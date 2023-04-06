Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF876D9035
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 09:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518755.805591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJlI-0000Uh-4p; Thu, 06 Apr 2023 07:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518755.805591; Thu, 06 Apr 2023 07:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJlI-0000RU-1w; Thu, 06 Apr 2023 07:10:24 +0000
Received: by outflank-mailman (input) for mailman id 518755;
 Thu, 06 Apr 2023 07:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkJlG-0000R5-LU
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 07:10:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 164c8bb1-d44a-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 09:10:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8572.eurprd04.prod.outlook.com (2603:10a6:20b:437::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 07:10:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 07:10:16 +0000
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
X-Inumbo-ID: 164c8bb1-d44a-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/XvgeW/pYnjs2GLuD5j6QFjqW0aJbkKcayDwJIQ+H/ZIaaHV0H0SR1z7ERRnN6Q+RY4hmYYx7tKN1niEWEx0ngPwH46RYuK2QghV9rx0sMw7ixPAiXdr2R17cK8RqBdZQS9Z04mrr4IPOC055HyrX+2TRecEZ02out1/8djV7Et9R9oyM9gKGhfeJXPrmnmiAfJwTYXvfiYiDR0Kw9ilfbhah3ZeHu0gsCJW9Te8NlRIAUMpN1ihrHG2sfhhSKBixVKolcTrx5/0gY304TXLR3GDhDlG1Xwk/OePBSmXz8eBwVE8kqGJlowTy1DRLUj7sppwV5NazsrIOTG2Kr8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPefrZvcEibxdwrsmC7k+QiZGikHI68fSkhMQAQyOcE=;
 b=TwBCDa77dGpGQmSnhOQl+gPsFQfR6aoe+NQpHFpX5sGVtmXniljs8jz1z1Un+SfiD2hkRjAo9KMGG6VUj5m5p3W9Z2vRGBHV0THFxqlOaHqLCnFpEcZ/QyR41qUtbMFjCyKT8Zt93DGDHJ9rlIzDGKXG7U/ow4bw0AMYL7DobGXWKltIDHP9aYXAv2zZJlKjwWSSMlk11iskYmMvtfu60W4RX/5TdMtIvgSFkakQ6jhJqC6Nvqw25VXGi4ADT5b2uqmowGu252ajj+PbLhBKAC2lTwYWw2ntNKt1Vi/vi2BVEzAUnYunsOU406TwfaqNKRpb34SOotN+/+n94yuPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPefrZvcEibxdwrsmC7k+QiZGikHI68fSkhMQAQyOcE=;
 b=w9/NiFksH8H3o4g2jrvdeBBaIpKLKpLoNlR4PGRzCEiKnW2MKWiWQvDCJjEbiZCewF1VvRkJXkuwB9lRuvs4tKTzjNePy+FkVmQsdWzHEiOiGllJSAzEJd4q+rE1HvW8dmh8rLds4j1NWjtor2EftJMRN5ojOnz8qaAkIXZfXMLCNQyqMKN8fSB1TA2PCKsTPVUXo0tcOo+sllcfwrvXODlgFTjk1HhuwgT17PrTon0Y0VKb7d7yGBofEUXCGMCOGQ0FZZ+xTb5m4FikjRSITsE0bY2c/t5SQt0+7v3DbZ3th0OlcezWVpX8B5PP0feSPQOlLCaHdz/Y9/mn3aqQyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b771061a-4fc1-8c15-17c5-8696f515d021@suse.com>
Date: Thu, 6 Apr 2023 09:10:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d278d87-dd96-40aa-4dbc-08db366df918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FRZk6DApjp1EHc+5KhzWYNP0NkCMSyFu1zi7jM2fyeH0wXm8ZvSjMXkZGIz6MjDTcfZXrCTdDUS0Mx0dYoHL+c68gDNi7kvncJ9ARBrvBFcHggnhZ9QmsWGqMa+UAmx9Hud0X1jVsjrGIE7ZgbIujGo5J7JPniMZxokFq3WLsiaEv8A1/ucd0Av37bAVTdjdTAvm7AJap0GN4CJYHWxAybAfmSjfMNHHvQEYCq9PN4cFghkb3L1PM4hEDJhvtAL8Nay0lo8V8EIaH+oHvyaUeR+qfjDVWik3Dc7e4qP7sTsOHsWM6BrQLvEFivlAqcXAI7jfCHrEgOQxkssSFVsTz8jM/WkcRkRtXPhfHak2F0Gwm3LOiezdmuqcoAQLkkPoubMxY8KTgk53C/eAbHOZRkgzR7iQdc1uSUTxvqp+ILeYDe663mLKSE3+edUklHf5RGTWogvi/Lbfq5SaHrErCu4o7Y/0CsKlzh3xNUFLz2PgUDdAmU6Ztg3pY6ylfrgfID57yuEJ5WG+QPAsZO9NZlSCA432xc8UZlbYlMUtGThRLyH6IvX4pN7+t+krRmVCo0igbTOrVYO6V3hzv1fagMMcKtABdpFfdq9fJ+ZRgX8gnvsi4t+lZiqunbu/SJMe4x6QK+l9fdILXRyhDG6qLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(2616005)(83380400001)(6486002)(478600001)(316002)(54906003)(26005)(6506007)(6512007)(186003)(53546011)(5660300002)(2906002)(36756003)(38100700002)(4326008)(6916009)(66946007)(66476007)(8676002)(41300700001)(86362001)(66556008)(31696002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWJ3MDkrSUI4ekpCakZYVzFCcnp6V1JTd0RqbU42UmRvT0VTdm01Slp1dFVD?=
 =?utf-8?B?cFJrNlZQRkwrMzZSWDNLNUJBNHA1MFV6SmJXYnQ5b2pHOXRTbXVyRVRJS3RO?=
 =?utf-8?B?QnB4dzBocTg0NzdyTVpSQUZmQi9iNU1XQ2ZSMjg1S01iRkpUN3NhRlJuTGU4?=
 =?utf-8?B?R0gwVjZIUXYyTXVpeXFtdkErdUNDK1FNYWE0NkFtUkkzanBLU1BlN21TZW9K?=
 =?utf-8?B?VldrOWEwM1lXcjBJVGRYWXJiaDZFQXB3QXZRZ2J3Wm5XMkozR3poQXpaZ1Zy?=
 =?utf-8?B?V1I5WW84UTFiSkk4cWxoc2ovUTZ4Nk40UkE4QzlyNk92ejA5VmFuc0lWeFNV?=
 =?utf-8?B?aTFTeWhnN2pGbWg5KzB4VUl6V2lNODZPb1RBUnE1bkpieHdBcEhrTDJXcVN6?=
 =?utf-8?B?UXpHOUdlVk00U3NFUVBXcU51a1Zra05zQVd5ZmUvWE1ZUWhRVmxxa0pJTEpo?=
 =?utf-8?B?d3JGUklQWWRoZnk4c0hYRVVSVXh1OHNuVnllNGlJYWN6dlFnbFBPWXVNNUxN?=
 =?utf-8?B?RFIvWTZpOXB2U3JKalFhMCs0WDZ2RlhNM1BKV3JGL3J4czcvNTVsdEdrY1NP?=
 =?utf-8?B?M3RQUzVmYkpLelZYTXY1LytKR1hQQVhFV3hRcWd6WC9vcUZCNkU2WUdtM2lR?=
 =?utf-8?B?OWh0V1RxSTRJdmtPUDJTNGxOVlVlVEpNNFBIUVhTNjVDWTROcjVYcVExMG9D?=
 =?utf-8?B?dVJySDhxRUxudStBeVpLL0JUczVFMkhNeDRDM2puSkdhUHF1TGxtamFEaC91?=
 =?utf-8?B?THNMOHBRcU53ckp0TDBVZnVBQ3dhdEV6YUM3d0xzMlVJb0J3Z21YUHZTRDF3?=
 =?utf-8?B?NDlsYTB2NzNpS0drek9EbGtBQ25TNDFGczlVV1JsZVlPQ3A5dHNmZEpMdVB6?=
 =?utf-8?B?UW9zVnlPRFZwanZGN3hHQUVvS0FpdWJ5YjJ3YnRJTWJpeVRVd2h3MnJzemI4?=
 =?utf-8?B?SzRPa2dsMmZPb3VyL0YwdlVQaU1hNGV3dlhxdGR0R3crQjMrU3B3Nm1nMTli?=
 =?utf-8?B?UXBubk9LaFV3bzRDb2h2M2xRRFZzRnFmaUNsWWJtTk16UFpMWDVSTzRVRVJo?=
 =?utf-8?B?aVBCVHNHdkVSSURkNzRrYU1RRWphUldlSnNveDBaL1F6dTJvcllyTlhJY1lw?=
 =?utf-8?B?SFJHTU53UXpraFc0NTBzZ2swRnFMbWJzZE84TDd0MTlVVHR1bDVidGJUeFFr?=
 =?utf-8?B?aVBuSEpuVld3MmVIQ0lHbFN3emNiZHJMaEFnNi9DYWxyWUdPYjJDMmF3aC9i?=
 =?utf-8?B?NW1Sc3dGcnpDS21kN0pHdU5EUTExZHoxOU5TOXFhczk0MGwwMmcydDhnOXIr?=
 =?utf-8?B?RkRRY213VXJYSTF6RVNoTjJjWHMvTXJzSktGclJ2NjFpWmZvbVVDUmhzTzhp?=
 =?utf-8?B?VmcvTlV2YThjS3Qzcm5NaGwxL3BxcUR2SndpWTl4YnpFcXprc2tEbjdSSHEw?=
 =?utf-8?B?Und4Y3k3WDF5b3F5Y1BiZk1ZaFB1VmRyZVB1LzQ3YVlyZGt5cXRMbTJlT1Jv?=
 =?utf-8?B?Z3d4NXE4UVRYOTBNZkNRazBsMkJwLzRRbndDU1k3MEduclFIZy8yZy9PZ3Vj?=
 =?utf-8?B?RTgray9XeGRiZzZBa3FyRzhGcnBrWk5xTXE5bkdDanA0VmVQNzRRYnE0MkFS?=
 =?utf-8?B?c0lSM1BOcTBoM0xvWWh5dFNQaXdkRlF0dm56QzBBbm1YcE94bytpMUdjOGVB?=
 =?utf-8?B?MUUySE43M240MHF4Z3FvZ2VQQlNVV3NRaXMwVERrYnIzYndMT2hNSDJYM3N6?=
 =?utf-8?B?VnBmNUQvbTZWZFVmbVVUVDZCdzBXK0lWcjM0Y3RXZzdYWkRmb21CU0Q3Y0xD?=
 =?utf-8?B?ODN6SVVHRFV6QkptdnNEYS9iYjM2TGpuWjdwN1BNTHJtU0crTEZNSW1oNCtr?=
 =?utf-8?B?cHExbE1yRkhEOXJ2ZHk5ckdQeHFqWGx1ZWV0UFNjMysrWldUclQzYWo2dnB2?=
 =?utf-8?B?b0ZNbDRnTmlPVjFrZTVOeXhCQkJMQkhXTDMzSzlFWGNLOVR6OVo5UVlpekFF?=
 =?utf-8?B?bnowSXo5WkZKV3Zvajk2UHBPaTdMc0VVY1doTWlmRFRoZ1VqM1dzN3hHZ1Zp?=
 =?utf-8?B?cDZvTTcvdThLejdJaTUwcDZ3aWV2MHBpRWZINjdsWmZQZDJTODdPNm5URXFN?=
 =?utf-8?Q?G3wMo35uP76TLs1ls2dyMho9+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d278d87-dd96-40aa-4dbc-08db366df918
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 07:10:16.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QZyi7pfCO72y3Q68iZprTMpT08N8ZS+8ZnBJUlP1cHyTmTkD7bv1b2AYs7w6uTjIl3m3HUyS8mjqjH/1fXqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8572

On 05.04.2023 23:52, Andrew Cooper wrote:
> At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
> would load arbitrary values into %rip and putting a check here probably was
> the best stopgap security fix.  It should have been reverted following c/s
> 81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
> behaviour.
> 
> However, everyone involved in XSA-170, myself included, failed to read the SDM
> correctly.  On the subject of %rip consistency checks, the SDM stated:
> 
>   If the processor supports N < 64 linear-address bits, bits 63:N must be
>   identical
> 
> A non-canonical %rip (and SSP more recently) is an explicitly legal state in
> x86, and the VMEntry consistency checks are intentionally off-by-one from a
> regular canonical check.
> 
> The consequence of this bug is that Xen will currently take a legal x86 state
> which would successfully VMEnter, and corrupt it into having non-architectural
> behaviour.
> 
> Furthermore, in the time this bugfix has been pending in public, I
> successfully persuaded Intel to clarify the SDM, adding the following
> clarification:
> 
>   The guest RIP value is not required to be canonical; the value of bit N-1
>   may differ from that of bit N.
> 
> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I am kind of okay with such a full revert, but I'd consider it quite helpful
if the description made clear why the alternative of instead doing the spec
mandated check isn't necessary / useful. The emulator having gained respective
checking is only part of the reason for this, aiui. Plus bugs may be
introduced into the emulator again, where the checking here could be a guard
against needing to issue an XSA in such a case.

Jan

