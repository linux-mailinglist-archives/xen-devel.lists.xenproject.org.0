Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E866274E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473633.734337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsN4-000628-AZ; Mon, 09 Jan 2023 13:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473633.734337; Mon, 09 Jan 2023 13:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsN4-0005zV-7d; Mon, 09 Jan 2023 13:39:26 +0000
Received: by outflank-mailman (input) for mailman id 473633;
 Mon, 09 Jan 2023 13:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsN3-0005zN-HI
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:39:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06bc94a5-9023-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:39:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 13:39:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:39:21 +0000
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
X-Inumbo-ID: 06bc94a5-9023-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ4khDbk3cVq5YTxYUB4dk52fiu5dfEC2JdUpW/bgZv2WY4hGFK1tBOFRAKW6PERxDS3fGqBKaU5o3WgW9kF91NC79dhBf/lmHYJ/El8M1LQrCJgrghnQd+Oj2ZFAXVZN2/h1HQ7HfdDqrBZp8VJpfWXm2zBF7Y57ccWVL9ylBPuplVn7cSABZiTj3X7vrEIE1vjV1D/4K3Fmu6GFNN/oyyxwvzi0GbjPx2MYoVs2Ln7voabdMqnq0u4dHlgTQiSxvpx3IiuOQjZfYu8rGE5IZP51NCjeBB4OhMEgAfamRRA4waQ3TleAM+axyU+f4GO76YEnbi7jxfG1gfQesa5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yskimPD3tXl4FmikgAtMvcJ03/xUebDIDOeJX91rW+Q=;
 b=KHg1zGii2t2RB72aGsH9fmlw3vmZPlqXjVHO7pzslCdobHcGatCoTv9lqqku7VPFh7EH0C7B/P468G781vvy+zF+HzikvP/D2mdGQTXzrXbJFzE7/G1X5bgVwPxoJZGtTdUk1+5FwOt0OhUQGEng+ols/27ZQDIIyiLC74le5KUwrGV1SjiOSH3OzDFc0gxqDFFF59UHCY7GNjZC4FhKvSWx6cq7SGR/8l4rqmyHlcP8yarDoSbhidczflPHj/FVmWXtMxr6h3COwwG4qRG/iJ/WOPIbG2oQHTXSn1FTsT86LoGpKEHvIbxJaBOIl3+Zj3VRx3NtBXRMuWDLFawBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yskimPD3tXl4FmikgAtMvcJ03/xUebDIDOeJX91rW+Q=;
 b=Xr6MwYYcMAQZp0cWnSjmdvTPUgEAldOpZaNZi1DcyPVEvdasfK2vGAWgDyMGlhDcT94jY9xLTtQWC3Upnw0ERYe7RrOBRBNmpzxygdr5eaQ2D93NcWLZuD8SvNb/+Dc8u2gLzzqTVq0RToVwkB7YHKmCAPJJdr5SePdVcPSLvTxw4BIR8fdel1N6zPRA2Keu6O5raCcgjOd/fUBGoVrJfuLrT1xmmhwPW/q4ICsUPRsEpMZ8xw3PCN06hNt1WCl6rhvnrVDjCMDUgF74nJA9fJoainBEWPJfZnEwK2dlCRCy5u7cagri84AngwnuRkPvtLRhhRwNo12ctg853aw8yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
Date: Mon, 9 Jan 2023 14:39:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 1/5] x86/paging: fold most HAP and shadow final teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
In-Reply-To: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: a8da4fec-62f9-4d64-4f16-08daf246e9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8wAcUZhned8iPJmlDUNadU0pDJVOBRfbCBt5jvVCZK43MGOY4X9xudFhiswrm6j9hbeWHRQ4C1EW3QILnI7s1A76WawJvgtGfVTA8w02zeYcDflNQbCOH1UtNbVMqxZUe3pWb0s112qQqKTITaZ5gqIr62dXjI+IaAUZK/0UovstgPdoBIuiJ7Bx5QBNCo0MeYVhg6i9e4o4TN4xfg9P6EDOVygnaaqVR/dyKkxA4XBwi6+WjZ7QwJU+bHHgWb62mbvJeBt3aGQg6u6qD27skqKJZYAqEzq5q55bY8hu6HuEFxmCyQjGMTgsZtkjCezDndY1Egw4JKuKPzMDLm5I2KkWjQXuoh6HHmK8F/AGehnyBz0Bsv58O4eb0YOCZIVCsfBwDm6BNlmLR2Eg1wmh3pSbN3GZPg3YsxAyr+mzFM+J3U973K73e4j/+lV3WHSOxvSjI+F1SptEMegEu9OIuFlqU5jgGYPlwut3QUQiywqx4yhnjjfnOb7jVI1yQOgMxVrftHcY21n64I7JOFQTr4bz1xmznEtS/9G4krLAkgj43x4OeOtGORzavZbbg3Q6vogR1pOTHoI4/h44mKKAGyLIaupwoYWQ6lkyo0g3FmrIsTOfPalB01L9BEKmbDArqm/0VgHfHZxv1T6C5YcJ/bCxbHuIVIbUHqxgUu142wHyN58wgSuODM5qu2ml9iUOhI9cwVXmOwotOtQItiO+KxG5ARLzCNWumqnEbraIl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(136003)(366004)(346002)(376002)(451199015)(83380400001)(86362001)(31696002)(38100700002)(5660300002)(41300700001)(2616005)(8676002)(478600001)(6512007)(6506007)(316002)(4326008)(66476007)(186003)(26005)(66946007)(6486002)(6916009)(2906002)(66556008)(54906003)(31686004)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak5lcDF2RTFQck9BV3Q2NDZNU1ZpZnRodHhCUTZjaDZNOURvQXF3MmtPdjRG?=
 =?utf-8?B?MEgwTVp2WUpoQWxiQnFLck12SExheEYveXIyT2ZSaGtSQ3kyb2FWY2RZRUpG?=
 =?utf-8?B?ZkV4RFlWT2hTM2crcUNEcnZQMXp2WHlsUGxrMkxTZ0xwV0JVakJMZnZDSlMr?=
 =?utf-8?B?S21tMzVKQjREZlZFdk42S0trOG9Ja2tJTDNJZE00UUJZZHowNDhxZ1FTWTg1?=
 =?utf-8?B?KzFkalZkdkQ2LzRNM1lGbTA5eWFnYVVYSHZHUVdHTHMzOWJxQ1VSSkU2bkRF?=
 =?utf-8?B?R3dtZnI0Z0hFSlJlUUplZkRMNkZHNmFqMDV1cXkyS2pUNWlJYTQ3UlEzQlR2?=
 =?utf-8?B?TmEya0xIQVhnRkFORzFZdTlUVm43VGQ1Y0pJVXBCUStidG9nazhOc0hwTk8x?=
 =?utf-8?B?eE1XWk8rQld2MU1OM08rS2g0a2xGdHFwWVl3eVE4bUJaaTJ1Yk0xcE9iczcr?=
 =?utf-8?B?VDdRajlEeDJxa2V5YVRPb0l5L0JCamV2N1QrcjJyUzBxQlZ0Q1hmY1Jlekc5?=
 =?utf-8?B?UVBxV1I2NEF6ZDRFdktKMTJ1dW0rTkNHOXZsMWYrcDRpOGdJSkxwSmdjYlJI?=
 =?utf-8?B?TlR6bXh4U1NxVldHWlFrVGdzTnFwYzNrZnIwOE40L2srbGVFZldJRlZMRnNj?=
 =?utf-8?B?SVpSRjJESXVINStUdjJsaWFTM0czKzRXK0xWZjc0Q0J3WktsQVNyUEFHNXRS?=
 =?utf-8?B?L1MzdkZTaDJrbU5yajVhZ1QyRW8zZVU2TDBmTmdnYnl3aXpuY1U1ck9MVEpG?=
 =?utf-8?B?MW8rL2Flcy9Nc0xxb2tUMTQ5UUJoOS9HRGpKenhCQzM1TDlzRWlzQnV0VjhN?=
 =?utf-8?B?SnZ0Z1B6QitJU0prYWlIa0dMZm5RZ1cwOFc1bEZsTzNLUzVZaDhtSm1wRlRh?=
 =?utf-8?B?bVdJaGN0cmg3NG11UTJQZit2anlpWTJpTkN2ektzdVlRcFJBeW1QT0VqMHhI?=
 =?utf-8?B?cUlEd0R0OE5VNXJIaVFPRXJMWjlRampLUlNzVWtwbnI1ZzNaVkhwZThvb2Vu?=
 =?utf-8?B?WVhYeEtqMHlrZC9pV29rU1J2SnVOWU1Jb2lHN3RQUnp6NWlGREtCeU8zOW1l?=
 =?utf-8?B?cHNtV1FkdVVrNmNDSWJRT3RNUnQ4NExoWmZWbjVVM0pXUVo5L2ZNd3Q2UTZ2?=
 =?utf-8?B?OXMxaERaRzk0R1gvSGJZZDFNSXk5RVpqNDF3M0trZDl2QTZsblhZQXJjeFlh?=
 =?utf-8?B?RXhscHJWcXVBVzNGUjdjWmRNMHhxdGUyQy9sNmUrSUZhcDJyT0lqREVMNVFh?=
 =?utf-8?B?d1RXZHVQODJ3VUFDK3EwNXBSeUk0V0VIdEZjazBub1dBSUpFM2JSN08wdzdp?=
 =?utf-8?B?NTVDUUVmZFN5N3BneUZKbFc4Uy9aMzlWcCs5T0hYT0JQTmVabE92cTNrOU5o?=
 =?utf-8?B?YVhLV3h4Zk1yMHVoSkdweWxnckpGMng1MUhneHhFa09rQlp1bXlNYjZFV2w2?=
 =?utf-8?B?Tk5JVnJmcnVSZUFVWjM4eDl4WFpJNnIvNnUyN2l6NC95U25xVUtWWkU5Y3U5?=
 =?utf-8?B?d0pvdm9yd1VvdDIxU3lGeGxXYmdTRUg0eHdPc2lEWnFqaStqRWduTDNDd1hE?=
 =?utf-8?B?VEdqUTNmZGNnZkVWcUlVZ1VUUkduSStnd085UmplVEY4Y2p6NjRHa3U5WnlJ?=
 =?utf-8?B?d2tTbGpSTlNPazE2MVhISEVCaEttRUpWaDlzalF5ZWQ2bUZYKzg3U0lac2tr?=
 =?utf-8?B?U3JaNnpzQWNTMzdQVzdMYk84MHBSRTJVbS9WbWNkRGl0SXhmdDFmRHRUV29w?=
 =?utf-8?B?Uy9FQU9rMDd6eEV5Z0dSNWtKZFV2WVBzOXUzN1dseG1aY2o2L0tXV1ZkOTVK?=
 =?utf-8?B?WEl5SVNsRE9mZEkrRFRPeUVGZXpMSXc2NTJ5MkJ3K1Y3SEljYVZBNnN2WGRJ?=
 =?utf-8?B?SXg2WHUzZXBkTkFYMnBCS3lEaFJ4U1ZPcmRPb3Q3Ym0rd09Xc0NCb0tnd0N2?=
 =?utf-8?B?MWdlbUVFSTZVMkZ3ZDJuWlpzL1M0clA0MHdXVmM0T0JjSTErVnV3cEhPS0lC?=
 =?utf-8?B?R0tZQ01PcTUrV1lpeHBoMGxMdHhHV3dnODM1WTJTUEFsVzViWnM5Y1Z0WCtE?=
 =?utf-8?B?dFFISEFCbnduSzlWV0l2N2Y0Tmdzc3BlNGRiVFFEWGhUUDJoNzNSdlpkR1Iw?=
 =?utf-8?Q?1CsJJKI1TfDgxsQ/fNL6vJZQP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8da4fec-62f9-4d64-4f16-08daf246e9ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:39:21.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyl3MhlNygBrjHdR+lDpUwNRec7MV4mrWTXFOA6NSVVpznR13HuBvtfkBhV67UpiqcvBCM5WTvZkk3foDuueAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936

HAP does a few things beyond what's common, which are left there at
least for now. Common operations, however, are moved to
paging_final_teardown(), allowing shadow_final_teardown() to go away.

While moving (and hence generalizing) the respective SHADOW_PRINTK()
drop the logging of total_pages from the 2nd instance - the value is
necessarily zero after {hap,shadow}_set_allocation() - and shorten the
messages, in part accounting for PAGING_PRINTK() logging __func__
already.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The remaining parts of hap_final_teardown() could be moved as well, at
the price of a CONFIG_HVM conditional. I wasn't sure whether that was
deemed reasonable.
---
v2: Shorten PAGING_PRINTK() messages. Adjust comments while being
    moved.

--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -78,9 +78,6 @@ int shadow_domctl(struct domain *d,
 void shadow_vcpu_teardown(struct vcpu *v);
 void shadow_teardown(struct domain *d, bool *preempted);
 
-/* Call once all of the references to the domain have gone away */
-void shadow_final_teardown(struct domain *d);
-
 void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
 
 /* Adjust shadows ready for a guest page to change its type. */
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -268,8 +268,8 @@ static void hap_free(struct domain *d, m
 
     /*
      * For dying domains, actually free the memory here. This way less work is
-     * left to hap_final_teardown(), which cannot easily have preemption checks
-     * added.
+     * left to paging_final_teardown(), which cannot easily have preemption
+     * checks added.
      */
     if ( unlikely(d->is_dying) )
     {
@@ -552,18 +552,6 @@ void hap_final_teardown(struct domain *d
     for (i = 0; i < MAX_NESTEDP2M; i++) {
         p2m_teardown(d->arch.nested_p2m[i], true, NULL);
     }
-
-    if ( d->arch.paging.total_pages != 0 )
-        hap_teardown(d, NULL);
-
-    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
-    /* Free any memory that the p2m teardown released */
-    paging_lock(d);
-    hap_set_allocation(d, 0, NULL);
-    ASSERT(d->arch.paging.p2m_pages == 0);
-    ASSERT(d->arch.paging.free_pages == 0);
-    ASSERT(d->arch.paging.total_pages == 0);
-    paging_unlock(d);
 }
 
 void hap_vcpu_teardown(struct vcpu *v)
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -842,10 +842,45 @@ int paging_teardown(struct domain *d)
 /* Call once all of the references to the domain have gone away */
 void paging_final_teardown(struct domain *d)
 {
-    if ( hap_enabled(d) )
+    bool hap = hap_enabled(d);
+
+    PAGING_PRINTK("%pd start: total = %u, free = %u, p2m = %u\n",
+                  d, d->arch.paging.total_pages,
+                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+
+    if ( hap )
         hap_final_teardown(d);
+
+    /*
+     * Remove remaining paging memory.  This can be nonzero on certain error
+     * paths.
+     */
+    if ( d->arch.paging.total_pages )
+    {
+        if ( hap )
+            hap_teardown(d, NULL);
+        else
+            shadow_teardown(d, NULL);
+    }
+
+    /* It is now safe to pull down the p2m map. */
+    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
+
+    /* Free any paging memory that the p2m teardown released. */
+    paging_lock(d);
+
+    if ( hap )
+        hap_set_allocation(d, 0, NULL);
     else
-        shadow_final_teardown(d);
+        shadow_set_allocation(d, 0, NULL);
+
+    PAGING_PRINTK("%pd done: free = %u, p2m = %u\n",
+                  d, d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+    ASSERT(!d->arch.paging.p2m_pages);
+    ASSERT(!d->arch.paging.free_pages);
+    ASSERT(!d->arch.paging.total_pages);
+
+    paging_unlock(d);
 
     p2m_final_teardown(d);
 }
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1194,7 +1194,7 @@ void shadow_free(struct domain *d, mfn_t
 
         /*
          * For dying domains, actually free the memory here. This way less
-         * work is left to shadow_final_teardown(), which cannot easily have
+         * work is left to paging_final_teardown(), which cannot easily have
          * preemption checks added.
          */
         if ( unlikely(dying) )
@@ -2898,35 +2898,6 @@ out:
     }
 }
 
-void shadow_final_teardown(struct domain *d)
-/* Called by arch_domain_destroy(), when it's safe to pull down the p2m map. */
-{
-    SHADOW_PRINTK("dom %u final teardown starts."
-                   "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id, d->arch.paging.total_pages,
-                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
-
-    /* Double-check that the domain didn't have any shadow memory.
-     * It is possible for a domain that never got domain_kill()ed
-     * to get here with its shadow allocation intact. */
-    if ( d->arch.paging.total_pages != 0 )
-        shadow_teardown(d, NULL);
-
-    /* It is now safe to pull down the p2m map. */
-    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
-    /* Free any shadow memory that the p2m teardown released */
-    paging_lock(d);
-    shadow_set_allocation(d, 0, NULL);
-    SHADOW_PRINTK("dom %u final teardown done."
-                   "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id, d->arch.paging.total_pages,
-                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
-    ASSERT(d->arch.paging.p2m_pages == 0);
-    ASSERT(d->arch.paging.free_pages == 0);
-    ASSERT(d->arch.paging.total_pages == 0);
-    paging_unlock(d);
-}
-
 static int shadow_one_bit_enable(struct domain *d, u32 mode)
 /* Turn on a single shadow mode feature */
 {


