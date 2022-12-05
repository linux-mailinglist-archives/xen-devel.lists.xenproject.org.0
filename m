Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE2642C6A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454028.711681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DuM-0003B7-7H; Mon, 05 Dec 2022 16:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454028.711681; Mon, 05 Dec 2022 16:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2DuM-00039J-3J; Mon, 05 Dec 2022 16:01:30 +0000
Received: by outflank-mailman (input) for mailman id 454028;
 Mon, 05 Dec 2022 16:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2DuK-0002iP-IN
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:01:28 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1329eb1b-74b6-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 17:01:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 5 Dec
 2022 16:01:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 16:01:25 +0000
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
X-Inumbo-ID: 1329eb1b-74b6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a33q+s502qMVPbgmBBw+0ne+8aIKzVbiGELxs0a7t3a3ok7KQfnvQTsxsDHL2VX/Ya6Y14NYPabBtywKNrlMJMIeoHZXwyjGnorjNUvNNXFH/DG8nfvfF/BVNYw3DbdQ7ngFye0Mt5ZdrtBlnuVC4/ONDYHyAH5aqR/v3LlZ74asgShelsZ+IWidyUqeWxmsIYaIfZ2PYAgTzOj/WYP/ewv40EjlatNLMb5mF/sPRomJdUALcoWz9wrUDY6V48Ced2LAp83hVoUFz55QyMLr2z/lkvYgCi4ijME7tUscsZPalpLzj7FL1FDi+4OmQAt87iNYB2CmF++lqb/3+fGQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Wx0EcCbIXoLY8ukf46jNQxdvux6JH0MbT37A0aXCnI=;
 b=eyItqa0rn2Imo91KhgZxC/JEli3X7TCa3gBUg2TnwnyiyR0Hq+op72dIgmCf2kyiekztAr9eVi+aYDYr1aPIZyCetjEl41dIkTfmIM/KtJEbHglrpTcCirruuTQnouBN1fyEQz2e9psQioqPlo9yT0c2ibPcvqOxv2USkCS3mG7fnH1u+1KKc8K4oAsH5hkFTmV26qvdw2LXoyFA8EEbORj5hoe+et2SS8l0NASJfcjA/W5Qjgb1hiU5jsXh8Q/vHAHTw8MS7GXRWuiIzIfa+98FqXX57NT4CmWfeIlbKF+Zi4EImTGaYFr788OfxQC7ipWIIJstS0UHzNLR1zvDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wx0EcCbIXoLY8ukf46jNQxdvux6JH0MbT37A0aXCnI=;
 b=vsV3CXshXoa/B14WOepu3/Xh6WQ4ABNNV8Wjqh2IZElJbaThCfwb0fKO8t8KXdIjW+TuZuUHN8sSGjHmYrkfDqt6AB5R8IG2mn9QWC7Rt+4v9fxctZOTEOPkXGTpBlZZd8KdSdJtfpAH6Nr20z7CrYP22Kv9eL2juNqiW7RjGi1Olg7o+DKzfIv6fvhUcqP3C/MJKn1fJaaj1Dvc/NFl7lln0e4elHQsx3C99GH2fODmkqYny+GPoMYDdSU7iQQC5iKcIZtFzH2STR4YkN6gO2eQxTK5P27bG2hEhyxGJBC2QjqS5a0YvebSJUBZ9QJB4BdHnRvoIAPMzB+2p0cEKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90340815-41e4-d1cd-b3b4-f704b94e3467@suse.com>
Date: Mon, 5 Dec 2022 17:01:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
In-Reply-To: <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b443b3-20f9-4ef5-1f8a-08dad6d9f668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ky2B1aALd0e70GZJ+1Lntlx2DsX/AA4muHjcd9XEBypwGa/NkKOg5pYMrFwpUZ2ZLaO4YlYhCGMPNMRgoBD/vJ0XOCL2LjdLFNC+1scdfCpH5s+MdMPOBM5x6M51WVIRovWqvjcZ3y8QzholwEhT8w7TUJqMKuSvpK4dVfrXW22E/lCuwMAwivFH0vgVrhmXVRd8v/ia9lrO45qEXlYO/n5s1fl8luEBKN+8T6q4XFQ3nQuUTF15t5a+3mmXudD6oquyN1Q1GtmDLFGmlqrHh8E0NkauLcy91mJTUc4frphrGnxjlPywJjCbueCRbWTPCt+U9i+t40pUeZy/KKeLeckrGb0vX7IFsMd9AEkpRWQDTGiaZ9xluCez8PDHPdStUPTMzN2F1TbjgzaP0e4LIUWcZWXdD/KrZJsMPjEBFVUn07hc9/smVfamBv98Hlxn6ndG7TV7uW9HC+aDN+pXyn/LqeqUDvzp1XcfCImDArhRDbbfwsLV72zb6WmFGEbBV5yr/lyHaVg9dnNqmAShJudlk7Ye2L0V5wa3q369nL0U3rLzNit2zlmd5mymGCkEBNZF1yx+riPei8/31fXnnhJwTDoUss6h8hS0LzFS+rjDy5MNdTLFZlKawG35nHJpTzqyQIovdMc1WE6E8AOygSzd7rFrQxR1sFTEQpxcy1fzxvYrY7t6mEGyNGItyrXXHzNcNJGrwwsVn/wt3JmuihBwir5kEFYhRYxnbjlseGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(39850400004)(376002)(366004)(451199015)(2906002)(31696002)(86362001)(316002)(6506007)(53546011)(54906003)(6512007)(186003)(6486002)(26005)(6916009)(478600001)(5660300002)(8936002)(2616005)(41300700001)(4744005)(4326008)(38100700002)(31686004)(8676002)(66476007)(66946007)(66556008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWx4TThJQ0tod0Jyd1QzbDc3WFpZWU94QndvUGdLZWx5ZlhSL3diODZlb29s?=
 =?utf-8?B?OHFzbFg4eDFKRjQrRUlqaHJWOWxDNURvRUE3U1Vpd3hTV0JjZXdCbXU1UFBB?=
 =?utf-8?B?bTlDTDRlSERlVHpyRVZxZCsvek5GaENHbzNSeFZOQ1dhWkgzWFcrNGtUNmZt?=
 =?utf-8?B?b1VDNC9Eb2V1dklPOGlYUjlOOEtCb0FGQnN0SDAxNnRkU0F1TURtY2svWW1M?=
 =?utf-8?B?VnhKQXoydm1JbC9GQlQrNk5XSzVTZDBDQnV2YWJIbmlPUklOTTV6akYzYzJJ?=
 =?utf-8?B?d2dYMi9zclRHUlhsWFU5MysvRWE2YzNmS3VqbFF6cVVsaDlDc1JqSG1WNzAy?=
 =?utf-8?B?Zk1TMmhqeFBob3ROR01ObXRKY0pXMUZBcmdyZG91RE9OR0pEZW5EQzBHRFBl?=
 =?utf-8?B?UFV5QXYxRHhaWElab0tpWjdYVHZGUVU5RURzclpyV3Q3TkdYNGcyTVZvZVZy?=
 =?utf-8?B?alFoWmVzKzNUREYwY3FjY1JGc3lGeDQrdWJ5Wjd2cGNhZ1V3d3Ztdlh4a3Q5?=
 =?utf-8?B?TzhEaVoyOCt4VlpFc1Q1VFY1d280VDdTTDdLYjdDNVJXK3FZaytHditiQTZp?=
 =?utf-8?B?YmxNZDRibHhpOHd1TU42Ykh0Yk9KY2J5c282cEYvSmd0ZmNaaTU0ZnRHOWt0?=
 =?utf-8?B?TkJMbHVjYnk1ZG1sVHdlNkgzTStrT0JJWDFpQS95WmtLVkhNd3RMZmZGdkty?=
 =?utf-8?B?aEhXcWxVTFVjYjluck1ka1VKYkhEYzhUdjBqVGZxYkVVR3phTkNicEYvWERs?=
 =?utf-8?B?WUZBMElQRFl3Q1IyZXFQUlViYngxYUs4eEd2eVFlR1FjL3VMdWR0d1JhS096?=
 =?utf-8?B?Y1hUbkR5Q2ZvQjYwNFNBYm4xQUxyUmw0TFNKaDlrRTZUa0JzN2x0Y1dRUVI5?=
 =?utf-8?B?UjZjdFowM2Y2RXFua0JoY0xTeFZ0aURKTnUwblF3S2pqaWRXQllaOGZSOWZj?=
 =?utf-8?B?OVNqSHB1WXB6eUJqNVRETmt0cCsza3AyQktLVDk4RDFtUFFvT0tTZGI2emRx?=
 =?utf-8?B?VFJDQXIycnFvNVo2VFpVUGFZaDBqUnJuNDhjRkw2dGpSdTBJaW4wbDZ1RXRm?=
 =?utf-8?B?dFV6M1dHdVNsSXpWWjd6M2Q3NzJNRDUxMW9VQlREa3h5anhKeTJlQldsWk5S?=
 =?utf-8?B?cy9IZVZQdE9VUVozbFFHK2NTeWFXSzFGaFIvdVFCaTE5Q1U2Y0Z4cFVnQmhN?=
 =?utf-8?B?U1JIN3FTa0NFelMrWWs4MXNseDNFZDJQUUt6QkRYRTUybnI4VVhjOHBST3Jo?=
 =?utf-8?B?QUMwQ3prS1lBdDFQQW82V1poR0ovajVHTE1jTzY3YUxXdUlrYXZYSEhNNE5Q?=
 =?utf-8?B?Yy9Fd0tyUHRNUCtsSzlhNzBrN0ZwMWVhOC9uMnpzelU1clNNelAveTkrVDlM?=
 =?utf-8?B?ZXhManB0eWtHcUJteWZ1djZwNWdrZzV1ZGxwdFZXK3RVTXJPTEpmU1JHRU5w?=
 =?utf-8?B?ZjkrSTJzKzlTaVFOUStVTkhzMk9vakxIUXVhSTYvVlljS25kMGxHV0FUUkZj?=
 =?utf-8?B?UXZEMU5yVlNZY1dQZ2VjYVZkR0ZUMzJhU1ROVFlsdDRxYVU1eFRZbkNoWGZK?=
 =?utf-8?B?R0VtSU5VU3hNUnFSWGpWazRwc1dzQTV1L3ZYeUFpaVh4aHJpOEJQSkxYSTJN?=
 =?utf-8?B?YWxaUEd1Y2szSXVWYlpsV0k5T3VVUTY3RHN1NksrSXZ5dHlueTlGK0ZjRXNN?=
 =?utf-8?B?QVNkbCtoSHdVQU4yUFpvczJMR2dMWVBqVmUvMFI5T0RzMjhPWkFJbHRWeWVj?=
 =?utf-8?B?UXB0RnJUa2J3K0pobzY4UzFIM25FMmZEVmRjU0FHRDcvRXBCaTVqMjIxM09o?=
 =?utf-8?B?dHNZczdwMHRONUYxVmtBUHUvWnhueSs0TFA2MUVUV3FhcWFtWVd0ODVxN2dH?=
 =?utf-8?B?VkVwYzA4SlUwazVWVU9rVzZPSXpJSy92dFJ6MDRyM1IvMlp6TXU5MmszT2tn?=
 =?utf-8?B?bVVEdFJqVHh4ZkQ2S1RMSXJyVFZPcVdnLzFTVDZQQWpHUWlzWmRQbkNvT2xu?=
 =?utf-8?B?eVNZT0J3OCszb2lQWklpdkhMQVZJOGkwZU4zREZqWHd6M2RXU1FyTkYwcVNX?=
 =?utf-8?B?UDc4M0pBUjF3UUZMbkxtalJZRWp2VmdOOHRWMHR6U2JKQkdHOWJvSE5zRTI2?=
 =?utf-8?Q?Uxj8yaRGHcgPTeSad3ftx28qv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b443b3-20f9-4ef5-1f8a-08dad6d9f668
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 16:01:25.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ociCW/3XDy/6mMscOQF7g5mrzVFuR2mMVXToJuVsC845/a6RiZ5DNhQwjUvedWmpyPKaf2swG8eSxxoRfHyJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

On 05.12.2022 16:10, Jan Beulich wrote:
> On 23.11.2022 16:45, Roger Pau Monne wrote:
>> @@ -807,7 +822,21 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>>  
>>      if ( gop )
>>      {
>> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
>> +        const char *opt = get_option(cmdline, "console=");
>> +        bool vga = false;
>> +
>> +        if ( opt )
>> +        {
>> +            const char *s = strstr(opt, "vga");
>> +
>> +            if ( s && s < strpbrk(opt, " \0"))
>> +                vga = true;
>> +        }
> 
> Don't you also want to find a "vga=gfx-..." option, to avoid ...

Apologies - I should have looked at the title of the next patch
before writing this.

Jan


