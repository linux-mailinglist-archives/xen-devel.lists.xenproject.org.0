Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210366BE436
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510943.789544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5jU-0007Ef-G8; Fri, 17 Mar 2023 08:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510943.789544; Fri, 17 Mar 2023 08:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5jU-0007Bb-Co; Fri, 17 Mar 2023 08:46:40 +0000
Received: by outflank-mailman (input) for mailman id 510943;
 Fri, 17 Mar 2023 08:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pd5jS-0007BV-I2
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:46:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a90003d-c4a0-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 09:46:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 08:46:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 08:46:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3a90003d-c4a0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwZTqTV+mMjYmboW9/0bjzMGD7sKLhhd+vTPbgsfKjYH5er/88xE88/G36aMEipxLOWs4JHg/ocT0o3R1xgLJkH18oYxkgEDOd7UfVg/7rAHvi+GU6O4MrV5L9i2mCVzWuGb3PMIClo1S0jodfpgWMoDFbf1ipNXcKTN/qefcSzc2df8ZrebMyUSf8SyA1oUx2Ai3k++J3FKmDng16q5sVoDoJrNu9Bor7eY4ucvJKzRsYzDarJgow4gbtOF0lnh0sWDj2iz3StCtj/yo/lYATihGs6Yjs8UpAL9jQI5rURpLyFXHrYYbUkworjFj/3n9/Jgvz23bLoTqne9GQTXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gZpeoEBawGKzlaxpURaoTIqV32Kn57fp5CrVqxPi9w=;
 b=Wzl+NpiotsfDWHllK7PhrTJDSij7gbJaaMF3fEfKSVLPx1bCbJJeJf8bLBA2Qm857lvXCmWKYuispJGwV4YiIcUp6jP126ag0thoUXwcicPm89jRpP2XXICk7rWJbIUmx4wkp3akv7vo9tQcb+tqWIoY+41Gg5FK4gnOBpsdPe12egDNbguEsPHGW+QI/Te1h78z3eYHxI/QbJ7i/0KOo3Sx+H4ajGi1mcHoYZs67MB4CM8o4qDgF7hvg/UcOmRAuejE4dfipM2Rb0DrtBkFYx4LFQnQdb55S/3BOmRAjJAjgkqQo/82ulgh24PmvNmCNkD45SMd58utUtb1az6/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gZpeoEBawGKzlaxpURaoTIqV32Kn57fp5CrVqxPi9w=;
 b=ucGud/svYFK5cgU3Twd/ouruYl+NOIG5I6YwMcvyFeUF2r4T6Cus7PQ5MIfYIuySKLxtqbaI7fJ/GowYl/qsX86b2qgyFEtSfz9uNZetXT7WbAVWSePr9Hxo2AbJQ2OoGNCKNn7UxuRhR1BfwhRr8rKBnd4tzn49Pxa8BKw+V11loXEzXU5TUqFZNho1ZK939zWFA7azd1fKdnR5RmIp1S3MIHHT2E9zLeiJYCkWrcPtAxzrsRqZw5Q71gwtyDNfCx+Qn6Bk1sPkbLsN1FUPbSuXDENGGrCP953VtiAzLRYHMojhce7CeKiq0Ka2mU2wqzbsUnV4ONW/6HkP9HwnBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>
Date: Fri, 17 Mar 2023 09:46:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] Update README to state Python3 requirement
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
 <20230316171634.320626-4-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230316171634.320626-4-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: c91924ae-2629-49dc-bf6e-08db26c41da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zLD3n1hMhpMKIyvz63qEw69y21fs8789kT2BHbJsW8IzKCSUGGvSbr0X9d7mcWFUsj9iESu8TIpeR1Wl1E19Cot2gaWVsWx5G5ypLFs9H2SbutHS7+xTHALgicXGJBUofmnF+r1ZXEitHiU2Jy9TCDwnbSmH80bKsuDXLd7BDep5avPo6Zj9X5p/u2+aiR504KYCrMnz5WWvKJAkXDeHctWBHAtAHyceb8UIsWTwf8iWd7LjRJcTPi8MC8297W0E9LiAmLXWpBvb1mILkS0LgxGZbpSpYSae349rXoXdUzj6asJfTF6l28kLjybM5w15vLnb3f9D/NIJBm9FbE4QOvoJDZfrcTQgpmqbaTjXcfhPQoGeNIFI8l7QXENF0sue8h3xQ64ol74Ip6Peg5uO5PBe3yq8yzO/69IhpeTPvNTGBgtoltZzP52kQMRatv4l9RANIwnL9EN680ZZhD3LHLEXjzsZWzv69L3jAv9TizY6ufj7a2HlHVZmWfUYOnIVPsXaS0y8sJmMzxbY3WJbeok6zSEBbwdxMVL4NysNmVrIfsrnI/Jn8LgKRn+ixhxz/6u0bqX/n8nJ3MzNDr4QKKZYQ3p3F/kx1p2rg449qD0nONk9pcnXdZ85u6mfycKWKdhKh6UoA02m2qV3Rr6XFJizOM5xmBlIv49WPwfuQhngs/Iiuy0Diw2lLfHLS74NAa/C6SbPUlIToUHwL171tUoh/PEYWgEobjdsIJ6mFDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199018)(31686004)(41300700001)(5660300002)(4744005)(2906002)(8936002)(86362001)(36756003)(31696002)(38100700002)(478600001)(66946007)(66556008)(8676002)(6916009)(6486002)(66476007)(54906003)(4326008)(83380400001)(66574015)(316002)(2616005)(186003)(6512007)(6506007)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3RxblYrdFBjTFpTMDlWWHBEQ09mcUFmd1VTRWQvSVdJdEM1NEgwWlFiSXIy?=
 =?utf-8?B?SkR2UVVVQjUydkVlN2w2TGhienduVUc5M096NktERUcrYU83RXY2b1pHSW5J?=
 =?utf-8?B?SHQ5QVVseW1uYytVazBRYnY4RERVelhkbHlDcmtVeGJzRmh2clJhWHV1TE54?=
 =?utf-8?B?SUtrNVZmSWJBT3h3Q3hWWDlnTmdjYVdaZVNSQW1hUkNGZGJJamUxdHBhN21o?=
 =?utf-8?B?T0I2RlBseWk5ZlM5ZTRCcHZqSG51eXZaV3ZkcndUMWNLK2lLN3pJYkYzTHFU?=
 =?utf-8?B?c0V1dzNyU0lhbzhtRUJwRlQvMTBEMHREYzlac0F2emM5Q3A4eVQrVzBKYW5p?=
 =?utf-8?B?aDVSVDYvZjZZeGhYYjloUTFqWllmVDNGdWNjSFE2eGhrN1ZYL3p2bjd6VHFp?=
 =?utf-8?B?cG9haVJuem0xSmJacVZkTFdhUlFIbWs5dWt2QkN6UlZwNnB1Z3BjeFdKalEv?=
 =?utf-8?B?aGNUdzljVnZEM2owZGNQT3YxKzRGSkhwa0J3SkN5eTUwSnF4YW4vNXdTVjl6?=
 =?utf-8?B?QWlkeHN6bGh3NlI3ZTFLL3Nob1Vhd0dFWnhlSng3NlNGZHFFdThJaU5GV0NZ?=
 =?utf-8?B?RGFvOVlOZ3VJTEk1V05FUFEwQlQzN05GV3huTXZ6UnNVUVVXblc2VFJiUGJ0?=
 =?utf-8?B?OGQvUEg2dWl4Y0pDL0xDZVhSOVd0NHlPQnlxRGRxNjdGV2JiandnWlNTMHhj?=
 =?utf-8?B?SFF1T3IvdWtIbkljb0kwZVZibXluYko2VkM1NnhvL1pHMXc1enB3U3Jyck9Y?=
 =?utf-8?B?UE82ODNPV1FDODdHS1JSTm5CTkdSZ3BrbUFESGlHMS82RVBnQmlRREdpYXhM?=
 =?utf-8?B?cWRCbVhnRkJlYjZLM2pUSjdaWnMyYi9ZOTBlS0hTeUhEZTBXU1p1eU1nNVg2?=
 =?utf-8?B?TlhLWEdHeFBJcmkxVmQwaTBxbmhXSTZnZ2UzbGFqVURtWlU3eC9vdFlPbXh4?=
 =?utf-8?B?UnNvbGtBSm5peE5GZFJRQ213UUI4Q0Zjd1BwOUkrV3NWOFE4blNtenFvekhC?=
 =?utf-8?B?cnkvUmY5a2VnMkxSN3B6QnJCY2JqNFZoeGJqSzVwVkN0dlhhQk80YUYvdW8w?=
 =?utf-8?B?RzEvRzhmYkdIdEJiUmVNMWlrRGdZN0dLY1RrdUxaWW5Wa3lFeXROMGsxZFlV?=
 =?utf-8?B?dXB4OVB2clRqUVdKVkYrZUc1WXJOZzNva0lsQlN1SFdheTRSc2RQaHkvTExU?=
 =?utf-8?B?V3oya2NxZkdKdTZNNzJuWkltbjJMcHlNYTh6SmtZRHVaZ0xXUFVxUWZZZWlC?=
 =?utf-8?B?YldDS0NuMjRUREd2THFzY3JlbHNNbWkzdXAvSDMxbG1oamdMRlV3UFozeU1x?=
 =?utf-8?B?cnBxVkozT1FjUnpjM3AwMzFyK01YUndGa3hpYk9OTVBVV2E2di90dHFoMHpt?=
 =?utf-8?B?L0RWZ2lyUHUraWlOQlFEZzI0ZmxsRU1YeFNNS3VjWXdocnpSREt3TDhpQ2xL?=
 =?utf-8?B?djhiMDdjVDRzZnFhZnZKODZjNHVzSGZWVXVPN3Ezc2VqV1pzODNFdndIdlBV?=
 =?utf-8?B?OUNkNk5mUHdFZlpoSDE1R0s2N0p3cUVNZXJZcExnWFZKSU1QQ2FIK2RYUXRq?=
 =?utf-8?B?cUJVSzR3c1NtVUdBWHhGUDNDTzdmMU91NTVveGtkcGxoM1F1dUdQeGhIMS8z?=
 =?utf-8?B?d3J3cnpYZ1JUcmJidjhjQmZOS0VhcHNkeDEzNnRRRHhROVdDdS9MVEFKcEFo?=
 =?utf-8?B?blZFUFVROVZ3VFNrM040ek5wQ01PRzBWMmpjMkJRek5mMHA2RkUrVmNuT3NC?=
 =?utf-8?B?cGpTYTVHc3lWOVh2Qk0wMnlocks1Qi9MMTduV2YrRk84M21FaWswWVJia2Mx?=
 =?utf-8?B?UC9ZRVgxREM2a3BpVVY2VUxTNk9jZ01jU0RHSm5rczNFTTZ2NGxvLzk0WXpG?=
 =?utf-8?B?cmR6cGtuL2Jsbnh4am9laUVOQkhJOS9QM1Y5aElKUWRkbkhWbjBLS2FXYm9x?=
 =?utf-8?B?VXFUNXZKUHMxT29QOUtrUm80MzE2ZVVGam02cDZvRUlCeHNTN0xxMHZ3YWJD?=
 =?utf-8?B?Nitub3dkVW4rS3ZwNDh0S3JuWmZFdTVIcmkxaUdHRk5JSlFOeHk2cXJGdVow?=
 =?utf-8?B?enIzNFVBcC9JUHBjY0wzcTNuenZNRHM2alRXS1QvSU4zWmRjcjEwelFxbXRj?=
 =?utf-8?Q?bbvGuU6faA+tgIUJnMrvP1XNI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91924ae-2629-49dc-bf6e-08db26c41da1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:46:35.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7lldEjQh40qPSB/j8OpZvJzCjOgOZ+CfeU/xYLKqeq0ufPKPOlctdwFzBHx5BTAejNoHdTWCWW+yOIyfR4+vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8747

On 16.03.2023 18:16, Marek Marczykowski-Górecki wrote:
> Python2 is not supported anymore.

There are two things here which concern me: For one, how come this is
at the end of a series? You want to keep in mind that any series may
be committed piecemeal (unless an indication to the contrary is in
the cover letter, but there's none here in the first place).

The other aspect is that there's no indication here of it being
consensus that we raise the baseline requirement for Python, and for
Python alone. A decision towards the wider topic of raising baseline
requirements is, as you may recall from the meeting in Cambridge,
still pending.

Jan

