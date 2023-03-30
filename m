Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC36D0332
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516651.801126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqUj-0003ce-Js; Thu, 30 Mar 2023 11:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516651.801126; Thu, 30 Mar 2023 11:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqUj-0003aA-Fu; Thu, 30 Mar 2023 11:31:05 +0000
Received: by outflank-mailman (input) for mailman id 516651;
 Thu, 30 Mar 2023 11:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqUh-00017i-Tq
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:31:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 598ba096-ceee-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:31:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:31:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:31:00 +0000
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
X-Inumbo-ID: 598ba096-ceee-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlLFKeR6RaPhYnHgeHi9MiqyGQdzUGh0q2Qywecje3WrA+tU1w5U77WBEGEw2Xeiobf0zpU8bbWtvQxi+nH93oJU3mnvOgf9AOUmoEPhNxrfg+LZyYbdEHOosznCSAGpa6RmToZlrq/vghEztF0x900XZsdRRaCEhAuBhZnylKyayIFdWNaJyMiQREubUgtIUPpBmoSerJczcy4QFcEF7MvpGNVgvYA98S9wyPe3q9kl7KqvoSVRgPYaX93cknWJhl8OuBPcOvLZtPt49ceNAP7JpST+GbIZfHyUrYIsff45510Z+HEsn+wFCU4kLPkuvH30cweOpzoxWPRzIv61kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8un3XXWErGo1I3D86zB/Aw1v47GFYml06HHbcbR4F10=;
 b=aXToDlwU6bLjvXIa8bB/Qq/aakYoQ7qmDijW1UbZ8ENPOvfQLMsp9UDgUGO/VxPHK7jaw6Y2FefJ2j6M+gPfre+/a3WNYlBG27Unm/w6tWoIIyBG6W+Ts0xV4exwUALor/7c5Kt0iNdR/vjahQDDn5GxukQ+QR/jfSbkqWLFUbP3D7sn2EEUZ8rfurJFm4LsxO9DeS/Clih9tGdsVM0rQugHiS0Uf9siKJUsyAqwPJlHxThGW+zc5lTmWeov/m33mBjYCpJ2HC6vg7clw6f4gA/rxIzoUzqg67tO7aarrYcxkEsvidAgOiPaN0hTyCfatBjT/HmJSM8if9nmZctFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8un3XXWErGo1I3D86zB/Aw1v47GFYml06HHbcbR4F10=;
 b=bwYI92QkfbsiXyVCmwFAdQPFhB0zDLAWld4Qhv7lB4JtLT0LWkxgf8xrsPn/7Mi86ZWVQnKiey0NTKgOmfr8tgnd/hbDXjIhpJJShqsscPmn9FI4baAvxq2zphTVE+mvo/gjxUSFZDgFqunWBC1PapssytRH+NYgX9x39BL91dDOuATv9Gwz0rA/5f5Df9Qw0CvNnS3QLt6fEg2bJLT1LssPUpDTFqAa2sWMTiZ2tGtoMhJDasqOB4/kAylQIF52Dvp82VFw0zRGgZbrwG4EaOn1XZgvX9X0CPpX+Qn6petWykr3RXtGYaf4wyHYssu6kpUNBqXmJdXz1HtxOpkxRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e19d5ce8-de4a-6715-9920-7df56a94fd96@suse.com>
Date: Thu, 30 Mar 2023 13:30:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 10/13] x86/shadow: make monitor table create/destroy more
 consistent
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8132e925-4bdf-4ba7-058a-08db31123d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pmFGJKVfiuH0X/TqlRbWLCnJ/kQSgAWMcAYCJ67NT31FdZII4NauL61ohuKLjlfmI1R5ZMXfMqx2p9rQ5dxmaIMDkfrbhD1w2E8Ai71LNMMbm44bjwtFy98Hz7LSqOsGIjx4Tz3YEJV3/idN6eubibPqQ8kFIC7tsLNSBWEN8mUWczM9xHbnLnfdMsK8lDqPXhli1uiqj4+mChlxca7Lv7LaUtQo8exxHLHJv7y8gFerDQgW6e7Yng564s/InEK/MyflWLovOtHrwbuMA+BJ2omvE3qCeB9v6vWU/hePkLk9Eu8rbRzO0L9sbenzVbP53+fpUC7JygRAnf6EnB/1LCUbp8rLiyZnqblD9EYGQKvj1YQsXM0v7ZN3RsWSj/w/Xwh42aQrfkZWDNNTa2aTlAVesim6u8gx5P8BQCGnrjr8+9w+N+jD4DQMbVqqyPRM/cdIUtZfWwhksY6+b0fEE/r7wKuWq9pi2/wAjxYJxQoDSkv9XxB8uWFhj+CkD+0WdeqzdnkyPXuCVFReYvzvssLfbre9OVN+1waqieHFBPxypKQ0cQRp+M9WhyddLuefjB6u5nD2l68wtHMMS0UkVSiSP2frrbXc607vW1wEISu+hRd0MkUHbsvQxBkTIejSbQiGVgWC4DDuHNsrk3ae4oiC+p6SJteP/obP0LcVcnXUEdR778E41Bf2F3L3BwNU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(316002)(66556008)(8676002)(66476007)(54906003)(6916009)(5660300002)(38100700002)(41300700001)(66946007)(8936002)(186003)(4326008)(2616005)(6506007)(6486002)(6512007)(478600001)(83380400001)(26005)(86362001)(2906002)(31696002)(36756003)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFdmeXZ4dGFiS0FneFc2dC9KdEk3Q29DU2xCdmVvNjZrMW81VzVCS05HOHJt?=
 =?utf-8?B?cGlCVDVvWk5zUXg2SHdjS1l4ZlFVNGY2L3lWYlJsams4UW5ubS9wQUllcitM?=
 =?utf-8?B?QXpHWFpKSXE4clR0WWlnc2haTlpsbFU0Q2xOWENnZzNqVkhvbU5LS2Yvb3gz?=
 =?utf-8?B?QWxaZ0puS3dhN0VBM1dpVUFnSTQ4ellTL2NVZXl1NDZSWUZiaFNKM1dWcUor?=
 =?utf-8?B?amZJK2JPSVpwWVVKK2llWGltd3dwNHJVZTBZSGZvS2w0N0ZxaVl0SllrQUJ2?=
 =?utf-8?B?RjIvWTd5bkZMQXJidEZqVTdFOHdINXpCdm10NXdiNEI3QldNR0VzNFN5bFR3?=
 =?utf-8?B?NW5Pakh1QkZhVzN4V0l6Ui9HRXhjdHZEaXZLZlhGNnYyTUF4ekFiU2tlZWJn?=
 =?utf-8?B?TTQwTmNHMUlzNktaUUVtNks3R3JvVGhoUHlhdW9GMVhNM2VrNmJGOHZvbkVv?=
 =?utf-8?B?SkVadmxmNlVnd0hSWGl6ZWtHSFNIdkkzekxiQ3ZOeDRuSXpSSUJDaGFyOE56?=
 =?utf-8?B?d3NrZGlXNlUyV0dZeUthWVorcS9RZ2lZTXh6YVhIQVBnR2tGemxNQndJeFVo?=
 =?utf-8?B?ZERzdUd6U0ZmU0RUYU15SFJORi91UTQvU3poZklVOE5MM21YbHlDWXJnc3Fu?=
 =?utf-8?B?c2dibCs0d2xVeWphNVdRd1dTeTlqcC9GT3AydHVTNFZsaGRLejV5Ym9ESDBE?=
 =?utf-8?B?aGR2MjdBOU14NFVqMklHaFFTNDlIOE1Gb2VxU1JudVQwUG1NRitGbzRUdjZu?=
 =?utf-8?B?S3ZnTUEvMXlGOW5vVHAxOWE4TDVUK2JIblN4OGNqaVJ2dGV2bjRkTGk4aFJV?=
 =?utf-8?B?eHhJdko1bng2YTRBUUFnZ2NJbnhGa3lRb21WUDFRcml1M04vd1V1Ykg4Z04r?=
 =?utf-8?B?amJkNEdGN0J3V3NCYVlPa1FmS2RyVjFURnJoYW81a2FteFFDT3kvTm56UHg2?=
 =?utf-8?B?azBhS1orRHlMc2RKcjh1ckNtUFVwQTYwMUZBRVFiTnhUczRRMGdNdmttLytm?=
 =?utf-8?B?eEl5eEFxRWo5UTdmdnNCSW5uQThwSWprNC9NbjdXVFFIa2hzdmJOd1MzeXJs?=
 =?utf-8?B?bmNUMUMwTXdEczBiaTh0ZmVNZXZZVmhTSysxajZKUjZmZmhudVZIQk9Rd3pz?=
 =?utf-8?B?bERKMEhNWGFKSXdNQkdqbzZVSzFJTnVjTEZOa0g0RU8yY0pVWTMwemFFSXBS?=
 =?utf-8?B?cklMZmorWTI3ODNtMUtZTEU3VmNUY1J0UENpU05mbS93aFpPRWl5Rk5nZ3FT?=
 =?utf-8?B?NmFhakRKVkhSZVJtS0E0Q1JoYURSRUhFMjcxODM3RTNUb0hRc3V3OEcxalNa?=
 =?utf-8?B?M0xmQlZpM2Vkdk9EVmJ4ejdoZTB1SDlrUkFmc3Ftb0F1RTFYNFdCbHZJVG1C?=
 =?utf-8?B?UzRKcFZvRFMvVGpYRmllYy9CNnYwSEFYSHAycjVoVGFzcnFMUHM3S2xOTkky?=
 =?utf-8?B?MjU0OG14OFVQcWJvaTBpdDhyLzl4Wmh6bGhnVnBteVFDQWprd3NmZDIwODZF?=
 =?utf-8?B?Q3JITWw4YzN2WTl1WGJsUmcrSWVXQ1Y2ZDEydUo2aUdQc0hFMzhMK3RBUG5t?=
 =?utf-8?B?VXVXNVZTTy92OVJWeWZpUWl2bXV5dUY3MkZoY0tvaDIvejYzZmdwZDA2c280?=
 =?utf-8?B?MUpsd3dUQjdJVUNxRlVFcXBWQ1F1ZUFMWm9EeXhMeXVOeFRZNXNtN0U2aXpG?=
 =?utf-8?B?WW5ZQkx5L3J6dUNDQ0Q1ZzlFREFCblpSWUhqVEtpSlBwZUZrVjdUcDR2ditW?=
 =?utf-8?B?NjVZRk4zSUNWSnhuWTNSTmdwcGFZcGV2T210R0NmbXhaenBRVFM2UHViSmFB?=
 =?utf-8?B?eDQrRDFkZlJmL0ZNeVVuUW81RGdUV0RjQzlUbWFPTk5aajdueWl0ZGkvYlZr?=
 =?utf-8?B?NDAyd2ZOdCt5SllxMnlsTy9GelZEdGQzRnltTkYwWXFaWmh2YXdxRU5jQTlL?=
 =?utf-8?B?V1YrMmVqN3pEd2h3bldJV05meUdqRzQvU0NpOWR6eEY3YXJVeTJ3YmtwSmFH?=
 =?utf-8?B?aXNRTlduRVV0bTdZZ3dMWk12L2NWU1ZoeGJxL2ZEQU1SRHlzeHFWdmNtc2p0?=
 =?utf-8?B?NTJuRmt2ZWx3UHQvWHpNd2VrZGI2R2oySTVpU0I2SUpFSkZMS05UZXZ3YW5V?=
 =?utf-8?Q?QJr2TZmiCwkzIh6fJ72eqn2r4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8132e925-4bdf-4ba7-058a-08db31123d1d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:31:00.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvNQRdLzgnYkDnoKIuDBaiIzODn/iX4uP33cF6BCbFAEC7ab0Bk50EAODqWAkyFJ/Pkm5ihvBJUaFIilgxutbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

While benign at present, it is still a little fragile to operate on a
wrong "old_mode" value in sh_update_paging_modes(). This can happen when
no monitor table was present initially - we'd create one for the new
mode without updating old_mode. Correct this in two ways, each of which
would be sufficient on its own: Once by adding "else" to the second of
the involved if()s in the function, and then by setting the correct
initial mode for HVM domains in shadow_vcpu_init().

Further use the same predicate (paging_mode_external()) consistently
when dealing with shadow mode init/update/cleanup, rather than a mix of
is_hvm_vcpu() (init), is_hvm_domain() (update), and
paging_mode_external() (cleanup).

Finally drop a redundant is_hvm_domain() from inside the bigger if()
(which is being converted to paging_mode_external()) in
sh_update_paging_modes().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Style adjustment.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -129,9 +129,9 @@ void shadow_vcpu_init(struct vcpu *v)
     }
 #endif
 
-    v->arch.paging.mode = is_hvm_vcpu(v) ?
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
+    v->arch.paging.mode = paging_mode_external(v->domain)
+                          ? &SHADOW_INTERNAL_NAME(sh_paging_mode, 2)
+                          : &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
 }
 
 #if SHADOW_AUDIT
@@ -1811,7 +1811,7 @@ static void sh_update_paging_modes(struc
         sh_detach_old_tables(v);
 
 #ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) )
+    if ( paging_mode_external(d) )
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
@@ -1864,13 +1864,12 @@ static void sh_update_paging_modes(struc
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
-
-        if ( v->arch.paging.mode != old_mode )
+        else if ( v->arch.paging.mode != old_mode )
         {
             SHADOW_PRINTK("new paging mode: %pv pe=%d gl=%u "
                           "sl=%u (was g=%u s=%u)\n",
                           v,
-                          is_hvm_domain(d) ? hvm_paging_enabled(v) : 1,
+                          hvm_paging_enabled(v),
                           v->arch.paging.mode->guest_levels,
                           v->arch.paging.mode->shadow.shadow_levels,
                           old_mode ? old_mode->guest_levels : 0,


