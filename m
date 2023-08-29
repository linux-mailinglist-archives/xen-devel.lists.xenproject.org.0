Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ACE78C8E2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 17:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592384.925100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0wh-0003kB-Cv; Tue, 29 Aug 2023 15:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592384.925100; Tue, 29 Aug 2023 15:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0wh-0003hg-9c; Tue, 29 Aug 2023 15:47:59 +0000
Received: by outflank-mailman (input) for mailman id 592384;
 Tue, 29 Aug 2023 15:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qb0wg-0003CY-AF
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 15:47:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc5dfcd-4683-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 17:47:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8293.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 15:47:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 15:47:55 +0000
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
X-Inumbo-ID: 6cc5dfcd-4683-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJC4mLNgnCD2tYEzh5P/gm70rYcAD9XGITiS0UKYiiq9eZsCxR9v6vwHzNwuRIodMGZpHRdPv94tuHDRn5uCvVNBZG2kS3bE+v6a0NZ/TFxepZfuQ7ARoc/hAMcI757u01ENykABJOm5wuyUAOoRvqh1/bq23x3yBohJzW/Zkpc1d92aHh8pJ7xsfm8H2zeQ4PUjfiIPqg7xJ2i1FywjHrik21b2LZeuWbW7LkYwDkAni8sg9xrww8mymrULQGiH/p/wAfGU6Pi4dQigxVtgwVBPiqYsOQGh+9C8Fs+wNp4wEEhzQ4sB9yDJZ4qHTJYt/u5XcKDNtnKJR138zqyqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F25wLcWXfZFs/EVW6TwZ57JSM6KSn3qQto8lfMuzeCk=;
 b=bXobPu+LpHanbwRZGqBiQK7hbA6BXwi9re//2DmUv9LUjW3ooZtkfuNWSz5qkEypFcw7aLOK36kdb4MOAx8ST4v7qnQh3VMSjjJgkMeggDsbdkAD/3udM4UtCiQYK3FW5hrQhzPWxYbHMhyKXG8wXS8wnuya9FqmCycNF7j7aWtsUfI7ZMrks38MF/b/YWgtG1839GgeGdlSdZ5mOjET99HThGUdgYaZVOpCpGAlG0WDsn79SIJ5IpOu6K9Lt2oV0ERG3FoFaaa26Imj0IfoVvbMG4J2NleLPE1oeKEWNVlc//70ZO97v4sc77ke1RQGCIPYsFBIoGwqLNewNDsjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F25wLcWXfZFs/EVW6TwZ57JSM6KSn3qQto8lfMuzeCk=;
 b=r3yDO33FAi9cvP0OJzLbtnfOxFtfJu1PdlMPBZeqp8qhkuLQD5w5/FugazdDvuGwal8d/E3OE1G2ib8fmA9LgIl2n/CT82fa6OHAMU1Wos+BbzNzH1EvOLeIqXoM0kMx046qWQoC+9SxLmT3YSl2zwieN/nvuPSnQV9iiVt1SL596f/JaTjdcRR+wme1zde7jRXw6ClCn3SYvoC2Hpfs9Zwa41gERrHiyW67JN+kreXfP9C0jMM3Drv6PeqbyUhNprldLy8tAyEeQVQ9i7e+JSEpoy265ohCIo9BDUoV/y6Q7F2TFrrkLJ9VLbGpI965UOfO4V4jR45YyuEMOUVkYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dba6ee92-5952-64a7-86ab-8cdd2a4aa768@suse.com>
Date: Tue, 29 Aug 2023 17:47:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86/APIC: Remove esr_disable
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 22868113-6bc6-49dc-1d55-08dba8a74f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dnWPrbyROhNkLiDIP/lC0frS/PxQo0erPNPNA3xAGJH3LSZSyuHNELde3whDRbplRQUQZsPhvbFxBGupytwOoLwjdJccCGesCDaiM8rn5gGxUyLE/NIdfKWFNYpZs291YoJDLHk1gKJrjITzH/zsZFu/XLreJP4WLMSdzE32JVgn54l5eA00c5jQyakpX7i3Og+SmEgHBYMcye/OMo5UIASdniRJppHPRkwt2gx/5WeEGHoG+OtfpQPVwV8klIjv4VEzv3ka71DKYL2wtxVWGrTYNzVk/4taI/rzhUKF5yc8ueHIxElokx6PNFmQJw+sI6WMxBjVUjmGGNJ3PbzeEQCl3RqI+jaU7XI8Qt+V+4lsVHFcSwTFGztC++QhIQ/dFkVi5cX98PnhpvmRA0B+cX8EgA5++vuQjq98UmYXpVXecd0bCf8BstEo4Tpf69iTLB5KETmHOQsrBu60VHRSevaJOTZs8Mb94PF4naHVuuA1x3Nr2Cw9z4R+ruXX+L2cF6LwcmZqzcLdCldRxFjrhlY2uzdw6+t/0IhreHlbe0NTpUzfw77uIlHGQyCB/UpLbMffZ51ldoVJPmsqvAUuHi9wnqOBFi3xkPENZDLuogclbLdnq4yKLIGCJNa8AHGXpugkL+/2U5Wf7WyenJ83Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(54906003)(6486002)(6916009)(38100700002)(316002)(41300700001)(6512007)(26005)(36756003)(8676002)(5660300002)(31696002)(83380400001)(558084003)(2906002)(86362001)(2616005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlhZ2NWR09JTDZTZ0NFVTNRMGRaamNlMWRtVkhmMHNQWEpXR0FGY29sWW5R?=
 =?utf-8?B?SHlHVEp2SUpsMk9udDBtUnpUSWc0aVFOV2I1Q2w5emRZeEpIWDdjUHFkR1Jn?=
 =?utf-8?B?UDh1UFNIUjhzTHFVK1Q2OXhFaVdYZE5ZMDN2cjdEVmt6Z0pKUzRiMEdQMXBx?=
 =?utf-8?B?MkRoQ3BwZDBwaVZPVXgvUGZ2Y0hzSkR5Z2JycE1vZXI0UHNVVkxjNWZIdTFh?=
 =?utf-8?B?ejcwVFc2WWlQNWhXRzNmSEtPWms1ck9IdVFGY041LzU5UEp6aW54Q1lnV0c4?=
 =?utf-8?B?c1NlTmRlQVFEYW83MVY4ZFNxTGpqVTIzUmlyZnpLaUZxMlRXZTlkdkNHaXpU?=
 =?utf-8?B?d3Arc3E0US95cUhvemNETjZpSzN3bVVKa1dZdm1OQTNLMFN0ZGVrL3BIdmlM?=
 =?utf-8?B?aFNnbnNBTGRDMEd1SzVKcGwvc3lEV3lmc1BtaFBpd1RuclVHeEI5UWVObG1T?=
 =?utf-8?B?MWMrKzBRalNoZkZpOUJYWEhqL0RMRnJFUnpJZTNBYThXcWFlc1p1NDMwaWo3?=
 =?utf-8?B?TGxqV1YvU21kWUZwaE1NVUo0azVaZnY4R25uejdoejVPMGlYVmNBanN6ZENp?=
 =?utf-8?B?SVdMRzF6eHZKZ1BramlLUExnYldlOXdISnNzN3B3Z1ZYRWFYcEJyUVVoNWMv?=
 =?utf-8?B?YjQ0RmxYTzJjZEMzTW1zMXZNc1hoNmRtN1lYbEpHN1N3ODBabUgyL2NxVWpI?=
 =?utf-8?B?bitqTitQN3BUNHNvSnpWVVMxZUJRSDFSdW81eEQxenZVdUJTanVJc210bTFa?=
 =?utf-8?B?eHliRkRPOXBxK29YNDBlSzVOeWdqT0NxcnZZNFA4eHZVRkZCNEZBZ1RzTGlL?=
 =?utf-8?B?Z1RKRlRHYStVVWszVUZGcDFFQ25nRURkRTdFUXFmczJQZzBnTFgvakpaUit3?=
 =?utf-8?B?MW1Vd1p2cTE1V0k0TDdiNXdmb1E4VW9FazhWVEwrLzhEQ1pBVmZqRzdjcEww?=
 =?utf-8?B?VmVTdVNWNDcxTXBRTXh0akxtWmNTQVZ3cmNCNjJ4VE1BeDFiQ2tZcTF0MUdM?=
 =?utf-8?B?S3VPSUREVVowRDRFdmtMeFJ1UU1SNEsyNGV6TGdiaEZ2UEJKc3JSTVl1MFBk?=
 =?utf-8?B?aVV6SmpnelNWRDhDT1g2OEJpUnlLY3d2VzFob3lHQTExNmYvSWRuVkVNSUhZ?=
 =?utf-8?B?STdXSnd6LzFKUUZzWEVtNmFtSkhtVjFvNitOcjZnWGRiQzJkY1hjaC9qMVh6?=
 =?utf-8?B?UFBUK1R1V2thZGVvREJ1eHg3R2R0M3hMcHdCdUlCNmQwSDVocG5YdEhzMVBn?=
 =?utf-8?B?UFNCb1B0RFVyMWVoWWI4cG83ZUhTZlkwZU9JUXJCbGlhc0I0WkFWNTV2NVk3?=
 =?utf-8?B?MnRYUUVIYlpscVJIenlROERKSEJoSytrQVJCODRLTmdNYm43SWlwNWNoV0da?=
 =?utf-8?B?SnRGWGUzVWpDL2dndFhPM3lqMVFTQnZDMWJEUUFmQkZTU0t3ekl2VERuUUV0?=
 =?utf-8?B?bnVRQmNrVGxUUitMaXY5SjE5eGl0ZEQraE5nNktUZ1BGRW9XQUZyaXVJMkxB?=
 =?utf-8?B?d0JMdjAwMEFma0ZIUXcrV2xtY3BjSDRDbVV6ak5RdURmTUt1ZVFFK0E4c2F4?=
 =?utf-8?B?aVo3RFpOam8wSTI1VjFuL1Z6OVpTditLUFZaRm1wNExucWZaMEcxWExWbE1N?=
 =?utf-8?B?ZlZ0Vk5nb2ZUYzZ1Tmx2anhyRDVkQk1MMVpVeDZmWmpOMmFlUFBWbFVsajFC?=
 =?utf-8?B?cTNiSDA1ZVJUNTZNTnFtdWlSNWNvcXJ6OUhEaElRN0JEalBxTTRXTjk0UU5K?=
 =?utf-8?B?c1BqTldGOXhDNGdzRys4Zitjb1ZOLyt5b1d5ZEd5UDhJOFFGZGo4SnFtUksr?=
 =?utf-8?B?S0RWVHprYSs5SzI5MzU1ZmlGYmFOZDJwODJpbmJuYkREUi9kS0JtVzQ1VnBs?=
 =?utf-8?B?dlh6SWcvRFVvNURkelhmNWpZd3R0bUtiV0orYm1WUzZhbm5ra1Y2SGtRazgz?=
 =?utf-8?B?WWRWUkJZc3dRT3M3SzNwNUNNLzBvamVmSDlVT3pRM2RyaFlSWmFtUnNjQklx?=
 =?utf-8?B?cElscytUYkNBeVpxbEJOUUQ4K1FHREVTOEFtbVJoMnh1QlBNNzhid2RlYnFX?=
 =?utf-8?B?MmV4UlhEaXZqMDJzb2NzcFRuci9pYm40ZGdra3ZNMmRCbGlCcTd3VndyVU9l?=
 =?utf-8?Q?/OknqCUp93PurqNU8ktDuXAaY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22868113-6bc6-49dc-1d55-08dba8a74f77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 15:47:55.4031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSmDJ4Ulit6iFJoBEvyjiiSCklBK0IrcuVLTonZV2x8JvXerZ0t7c73FkYHSVtgDu9XIvOGQy2liiuKIkeqcVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8293

On 29.08.2023 17:46, Andrew Cooper wrote:
> It is unconditionally 0 in Xen, and was deleted in Linux somewhere between 2.5
> and 2.6.
> 
> Remove it in Xen too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



