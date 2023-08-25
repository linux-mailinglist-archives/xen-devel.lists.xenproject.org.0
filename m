Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B578876C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 14:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590894.923247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVy5-0003cu-LR; Fri, 25 Aug 2023 12:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590894.923247; Fri, 25 Aug 2023 12:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVy5-0003bD-ID; Fri, 25 Aug 2023 12:31:13 +0000
Received: by outflank-mailman (input) for mailman id 590894;
 Fri, 25 Aug 2023 12:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZVy4-0003b7-7n
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 12:31:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f1705f-4343-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 14:31:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7748.eurprd04.prod.outlook.com (2603:10a6:20b:243::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 12:31:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 12:31:02 +0000
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
X-Inumbo-ID: 41f1705f-4343-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSCvpFr4JkX54LyoIDhlRU2eVxFnUBBxCCDIunURe+2m1lfDWUarNhwlluUjfE/3X/TS59D9FkwkaS9Fv24A2lmT27k2F+lzGoxPaBfbBn1SRxDekH/2mFfEjYjORaowziXujLbJKxdglHrU03q9QN+uZTmVYX2SDl8eZEGBzOXhmE2tNrlQAMnuEZ8BOhvvYdjnE5/ljJvOShTPBwN9Qea8cuymFj2+qLnTYQX5hb6Jp2Q4GEle4Yq1j58VELNHrPvOviPfsKAfbectrsvvRox+30lEs00gTAuygxxwjLKxr14im1D3j5gEDjmzjTwa7itZn3AlKiCyf9kTnfmpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZgKpeIUMb7s8ZPsEogsqqAUbJB+UDtSZH1hwkwhHj8=;
 b=aHtlWtZKnXWq98qaVHj0JtMDAP9L4qZCV79/f/erfi0UJBFPMvHB23rF8CIH2A5hHJbvBpK4eRM9788KxuBXUO3eB99HfTHvypv4jDzXgnonBV6FLIbcy/106Gvlpaksi5g36viE7stXbh7ZZJP6yujW0Jw792Bx1NSzd7UsIUvqaAbJkmO6SzINPMjEm73rP0nBzd6FfkmfndopQsKTO+l1g1KZZj28gEs/IFxNLVRJnPTrnAZ88X95Qa236IZxG3wKjJdr3cdtb8jhRLJzqSv7mpto+BffEf9VFdImw6zx3zdIul5Jm4p7oPn6iY16OruVdy/uUit4fFpOkV5tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZgKpeIUMb7s8ZPsEogsqqAUbJB+UDtSZH1hwkwhHj8=;
 b=cjA4yBJ8C3Bf+ydgbusOQz8bZHemG1Ev3XCGzJPk0IYnPxs7EEa1ePIeAj8LpbdJXpoI822KmuP2XNTrRPjzizsHv6lMKhMfvWuofRq4hOXAy1Z4DIT3j39akNHD4o8E6qUSmtl3kS69ZS7wFUwUBpVHVKx9/1gpFlz5dAJ89Wdp4Eylf4WHeL6TIv7fb2s4eLiy5Id7yuBQjH4k3H05W5wPdJDdiGJ4ZHpV4PZcKCExaBW+APm+U4uFOso9ay4o31hwgZcZn0p8D9+poiXLT73UJR4O7rlStsc/Hi2L/qbrqIrJ2D1bLoconfBdSv09dOvX+p6vneDKpig9CShLXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d90f8c71-5fcb-5e35-0d02-37b08af75a65@suse.com>
Date: Fri, 25 Aug 2023 14:30:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] xen/pci: drop remaining uses of bool_t
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cd7bd01c1ca9f3c6668ed15f7300c17a981c1708.1692965750.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cd7bd01c1ca9f3c6668ed15f7300c17a981c1708.1692965750.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: f75e34aa-4bb0-45a6-5540-08dba56724c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tPe9B6jWJ+OgasafBBC0dITh1J6HlJx7eJa9gCMDQFKQ4iIE/G+s9NjBbn/E/znV72sj69hZAUBkXY+2DYlkx0IU4BVenHPNuES508dW2/EhHklWpprM6YxtRtVc/HIlrv8WWA3kGjajhkNTbzprr6tECTVrWN89YlVJP20w4cPnsbkpZGkg3N+34DYYpKZaPunFKWEbSKJbCZYDjMNKvEyKmj5JFTS893Xjt0JfD/Q7FOUG54bmVHTnQCXDDJg9Jdz2JnyqBfzT38eq9KpMfKK8GxamS1OzmHhH5GJGpK0NyybmNHdpRYpa8RDchgQfuiUTs2eiFd9OV3DHffTCat2DW4Vu1am6ysLnJrd+Mci+MaK7ftcYd27IW/qbqhSV76qKCI9+1LwdtR6ZQvtZcOb7IIA2VKT3cm4Yi/64BEG/f6dab6Wt8wmRp3gs273n9zfCbxZaSRqQ7yrnLLl3CXJ8GrbrGYVg3EoL4AbPyNZuzy7z1v0ZM7pGur2aXXU8D7lr8mCMYxOvsrkp+n4LVfN7nBtuRE+EVsJ1GiuwRbGXBPO/TikoxaOkJwJMkWp5Yrjk+wkRqR2TM9nzkMDG4WWBGRuS7MILw2iUd4BBTJg6NOG3dqhNiREf9YkRqL+XwTqIHOdWg26x/g+HAZmf/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(7416002)(6512007)(478600001)(26005)(2616005)(5660300002)(31686004)(2906002)(4744005)(8676002)(8936002)(4326008)(38100700002)(66556008)(66946007)(66476007)(6916009)(86362001)(41300700001)(54906003)(31696002)(53546011)(6486002)(36756003)(6666004)(316002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTdOUjdrVThmWmVrdGcrc2Rxc0lOTTNJQmpmU1lnN0pIL0RLYnJiMXpyRzJy?=
 =?utf-8?B?NDlKMG5MSjRtN21uaW9lTlV1TjN6Qjh4T0UvS3lCN0U2RzJmaWJtU1FUaFlX?=
 =?utf-8?B?RFk4dHozTmFJUmNBUHVraXcyQ1R1VG85cmRMME1tSmJncTFhNGVtR3Q3UDEw?=
 =?utf-8?B?ODBmZFBobnlud0pRZWdVNS9Jakc5V2dPS0RnOHlLR3ZsZzlzNUxzS2x0OTRZ?=
 =?utf-8?B?ZVpUd0lCWWpEY0RnL2plYXFsVm5wOUxPQ3NZMUVjYWRHQm13YVUxbU96N1kw?=
 =?utf-8?B?MDVHVFgrbjdkaEZocWJoYkl3RmdCSjgvRUsreFVVdGYwdlZzRWJNOFNrbUFU?=
 =?utf-8?B?eUw4ajRtVW9xRG9VQjRTSlVCbjV3Q0oxa09zQkxkSDkxWis1MXdUMTJWTUg4?=
 =?utf-8?B?MG5DY0UxdXlFTTFSblZnNnM0Q21GUzdlMmIwOVlrWE9oZjFoR3liL1pwaUtL?=
 =?utf-8?B?ZGhMay82N1NUVzFlQUFVVVpENGxaU3N3amlPZXFGNXQxelc3ZGc5azBiTGtJ?=
 =?utf-8?B?Z0h1eVRTZE5mcFpqMGVhL0hiTVhyWDhuM2Y4TEYrN09vWmIzMVo5WVRIdW9l?=
 =?utf-8?B?YUN2dmMwemFpZng4Wng2eW9yaEF2Q3VEMWlqbUxqaGZIVm1xUFUzOFdjYnc4?=
 =?utf-8?B?a2h5RS96UkViMUdrNkNGNFB1aElRK05nZllaR3N1Z1d5bzlFSGgvRnlBUHJM?=
 =?utf-8?B?dHRENWFmd09qQzhvV3NvUGhWUmpvNmJHdHpKbXhYVXYrZ0xaVUNDUE4wS1JX?=
 =?utf-8?B?cHJUWFFOb2lGakxhVzBiU1RTLzVFd0xLUUxmZ3RGU25Mc1dkVWhtTU81dE45?=
 =?utf-8?B?d2Z0UVREWlgyM05scnU2amxxSmROSUJ0bkJoM1FQMHJQNVNJMDhaNEVoNk12?=
 =?utf-8?B?MnVhK2hFZ25sSWptdGN1SDIzb0c0bW1KUDkrdDN4QVF0bSsvRkQrcUVmL0NC?=
 =?utf-8?B?ckNLRnRQb1hTMHJKTHQyRUR6dHkrN3VEMlR2RUZyZk05ZHdtbGg0THd6bWNJ?=
 =?utf-8?B?UUhPaDBTM20vOHp4MEo3d1pkeHZBaEk2OUkvSWdZMXZLSXhXdkR5bmZYeFdB?=
 =?utf-8?B?Uzlaak13QnBTY001SEQ3T3czTzVjUHNjK0xHQjJpS3ZYQUV1aC90Vm80QjBE?=
 =?utf-8?B?dkhTTldVWlMxVzJ6MVJTcVFrbjREWFBEK255MWkxbWE5Zm5qbUluWWtHaUN0?=
 =?utf-8?B?VEo0VzVTNTBjZXRXV1R3WWdQU09CbDNQWk9yV2dOaUVFYnllSzRVNUxhTjJL?=
 =?utf-8?B?SUZqZWRiUURzNzNKaWJIMC9pT2t2bGFFNHRXbElHbmRqTU84WU5mVnFXeWg1?=
 =?utf-8?B?U3A3aUJQcjJ0T1d2aXFZdUVodytUdzdNV3BDYVFFcnZzVkx5b3B4K1hNTXpx?=
 =?utf-8?B?SVBmL0h1SFM1UUFhQUtxVHpFODgrM3g5QVE4MXczZFlvNDM4OHZpTXhRMlRk?=
 =?utf-8?B?cWFmUXdGUDdRYVcyOSttcmtHbnNRajZUR0gwNzFvK0VQbGVIcU11WlJ1WUtJ?=
 =?utf-8?B?V3VIeWN6SXlyYjFNZkVXZGZvTFh6Z3NsZmJTeTlOS0xvNUVhL3NoTFc3akN4?=
 =?utf-8?B?LzduYkZtUzlLR25DTXF1d1B5ZktxL2JPbWgxUkk1VFpUNGQ4Wm5sOWZzeDND?=
 =?utf-8?B?dnZDSDh6UVV0ZWJPODM4bXRNdUk1cnpxV2lGSHNOR2xLTDlWY1AvQUpmZWJK?=
 =?utf-8?B?Z3N4VGRxd2Z4Q1dMY0xMcHNremdsekhrUGY2SmUyYUVCenVsQkIvcUpyODha?=
 =?utf-8?B?SXU4dXJNeDRtVVlueERHeERHNzFPT2RNUVBteEszbXhNbUdlQ0NxMkRnNmVx?=
 =?utf-8?B?QVlNb0NvbWlNMEZkRzhoT0J0UGR4TjJmRkQ5VkVpc2xGSmIrN1BpQ3E1RTNS?=
 =?utf-8?B?U2RLRXdQN1FQVGZIN0MxTElRVW5seDd1dHBnQ0Y1VDhqcmQwb0IyVk5wQzdO?=
 =?utf-8?B?UG8ya2lrem1iNkwrZXBSWWEwOWZac09jSjlNNG9kYmUwenBpajAyUVRUdXI3?=
 =?utf-8?B?b25ZUFAyUzdyT2h1WDFDNEgzeGY3L0R0NG0wZk1iZFVySUxBdGxvMHhMaGZR?=
 =?utf-8?B?WkI0bUFBUEFkc3ZQazg2blRjMnlkY1MxSzVYMk1kRDFiYnJGdE9CSmQ0dFlE?=
 =?utf-8?Q?JyTpCikWkkzLI3m/U8hkytc5X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75e34aa-4bb0-45a6-5540-08dba56724c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 12:31:02.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mJZrUxf+h9M1BRE29cPyV1zv4p2RDOBCdCtUFpLB4vAmn1y55nU07VryjwXBAmUIZirNIEFHFjKlKJLqAcZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7748

On 25.08.2023 14:18, Nicola Vetrini wrote:
> The remaining occurrences of the type bool_t in the header
> file can be removed. This also resolves violations of
> MISRA C:2012 Rule 8.3 introduced by 870d5cd9a91f
> ("xen/IOMMU: Switch bool_t to bool").
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



