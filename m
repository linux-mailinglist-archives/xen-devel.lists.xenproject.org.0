Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730E6739D7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481040.745734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUpP-0001DD-Et; Thu, 19 Jan 2023 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481040.745734; Thu, 19 Jan 2023 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUpP-0001An-BN; Thu, 19 Jan 2023 13:19:39 +0000
Received: by outflank-mailman (input) for mailman id 481040;
 Thu, 19 Jan 2023 13:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIUpN-0008EL-IG
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:19:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2071.outbound.protection.outlook.com [40.107.15.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2db859-97fb-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 14:19:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6841.eurprd04.prod.outlook.com (2603:10a6:10:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 13:19:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 13:19:34 +0000
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
X-Inumbo-ID: eb2db859-97fb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuCDXcLn+ohS8CVsjCBVA2i5qgThdu9RU6b5GkS3fRmDLjZHpT7AmJ6DVD6jI0UJMQXptiZqw9fVAC2K91McbcOfkxBdsUgJ4LVos3kWKrzmZCh7wSo9J/nfEuL4uxu7cmx4GkNBOAGKAbQnQz8hssy9ib0W0UCWoPEGFjy2ESweLv5moHOLIGptM0bl4CyaNfLK+dpAMmEB6u+JmN2VNNeY44Q7O/guMZWt6xItQya5wOkCf0SZJwdpgUv6qgiNn1ftvysDPE4IHonJYxPN45Bs1ZlHFSs6xnviTJlx6FZtH1bPt4WVweCeTrP67g5ehLKmNXK0p9MTiNRx7LR7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1LHoiPUScSmgNZv/atqS4HErHP9rkJVOgHZWk7M6S4=;
 b=GupGzGHOHo8uRAaCNAwn1/jAHzw1abEKMy3dcv6UeDb29lnrCBtfGpe7YZBqGxL7mG50FCQgWz9I8YC9oyprzfj+SQKkTk15Qgvjzyi9sspQL+nv9SnthCrGqvGUqEVFCeJ6l7VEiT529zsDMQ/JBZl+BeBM1p/e2Kt82ac58gyGuwvEfIYoeIOOjtsP9t8m51hFGqA5NW0R4/qcfxtnAZycNe9IJW16W3mzbVWw/Au7DkuE9UxWrUnf6UmmAPyKd9dFf8J52RLHc96uAxkwT2wti8KLZKqoRLY0u3WVBY+8ztSp2mLy+VxuuzohxuwVVz+DYK3ddiE754xneI59tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1LHoiPUScSmgNZv/atqS4HErHP9rkJVOgHZWk7M6S4=;
 b=C9HZoJ8DIPen9fZa/fS6nhfUZLS+DYxRKfFS15J69yhvzFfFkb6GeYY4Q7hvciEqJK03bXU1w09AqC77MFuN7ZsDpgkHnO60aXV8wVN9rQb/eXvehWv86plL2hg1wAl7aatMzYhqyDTf2FyKtUnKzJ5qOP51F8ZeEdGesEo6os2HsFtWWpD2cqsmckRzUenMRn64xTClGQ1XdzTWYDyCWJpfYJ1Z81f4PnNVGsOC2Lf2zNURor2yHTVFg8zhOIpdAh46sInyb1i37UXudOm8XTGNx9zFD+cK0HAeZISOcX/YDjQuyyOr+nGrtYkqqQTOE/j9Z/iRyBCsTxWRlZDcVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4d6ac67-15c6-a7c7-d27c-b98544395a52@suse.com>
Date: Thu, 19 Jan 2023 14:19:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 2/2] x86/shadow: mark more of sh_page_fault() HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
In-Reply-To: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d93aba7-f515-42e5-68df-08dafa1fce68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q+zFarS/JFNWQuBFJXsbdOrlG5pg/wviss+IEN2VT0HbPmORLODl2VO1JqDNmRmSAwIEw7/8yVo/zrg/vZllpFbDnxns4Z6lJ2xywHy3WVrfW/+BltuU7W5X/rtRT4PXwCyx+UTvKaKVLGwW+8EH4HySsu8Eif9ZacUKqZv0PSzF572DCZAQzrKNl6DraFs+0a61j3dhYGwU/KV3ljjLKLClTx2TbAi7iFb4lF22fav1JTKdzcQSpdSvo45yqKrHKRxI3rvjZN+ASvleXBOrum/9msAs33+vMJHDpB0RTxnlA6H9GecdunglfY5amNIzKzdtNaxCSGgVpGqZGMyuRwlaoVSWe1UNomWZVSsFW9OcEvaaMdmdwPsSnerp+KscCwxmqA9cZSYQEoiyZJc00g8TjG6lJWsV6rPqMlHOz58L6Dbmz/EfDFEHlT5hPDUCFAG3rWx3gqLRjUAcsWBMoHSXbEgpKy3rTzx1znXgKfPTk1zTTc5dE8yt53MD1Q3ElCERPkPmT+p10g3TNzOJEEOM6r28IYGnQNmDQ9RDM/Gk3nY8Z8o0ujcnaMtJ/mF2/1yKxARGVG3t/rTWi6BzUa4YqXvNy/lKmeM2KXGEXImZZqsdKpdBvC5jLhDZI6KPgfFuD6pyyd7W0cZNSk81FRHqT90SbzDg1NFLpN1GHsKz2cFBQIYyjDntS9AONvqwO3ffE3uWy8L79ClRg4h/br0C9Vhwl4Apq2/Lyy1ZHcb4+q1ZsDitbwCedLDrdwdHtAf8VaEadxon4s/PQEe0mELab7KhS8zDQ0gZLkWx1W1Ga3V35NWCQF4N6Wj4zGgN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(8936002)(54906003)(66476007)(66946007)(4326008)(6916009)(31696002)(36756003)(66556008)(316002)(83380400001)(26005)(86362001)(6512007)(2616005)(38100700002)(186003)(6506007)(478600001)(6486002)(41300700001)(5660300002)(8676002)(31686004)(66899015)(2906002)(43740500002)(45980500001)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1ZTN1MzbE1PRlFReURscXFNODN0MG82N2NUL2EreFp3R0pjWWdCS3JmZFhW?=
 =?utf-8?B?Q1MxelpyNjNnYXlwT3RyTFMvM0Ixcm43WVo1OVo0Q3R1TzV0TytvcStlelF5?=
 =?utf-8?B?OUZzamJHRjRqL3Zhb2I0MDlaTlpJTExCbWNBc3Z6WFAxZGM2UDhmVnM5cDl5?=
 =?utf-8?B?UUpib29lUTB0bEZ5UmxKMDhLblZ5NnorWk4wTm91dmlacW1CQ3Y1cGNrajVD?=
 =?utf-8?B?enIybjNPV2txQjMxb21NaElzWFJreGNhSG16ZTBuL0pTdGZ3TUF3T2t5M0JY?=
 =?utf-8?B?Y3J6a0JrRU0raEp1Z3RTdE1Da1cwTXNEMks5M3BodThVazZzSlE1cWI0QWlP?=
 =?utf-8?B?YUs0aDMxeHg2YlZIWnhPSEQ2VEg5TVdBZUJxZE5NVWtuY3JRR0JsRVJCVERG?=
 =?utf-8?B?WmNWVkNxNnNocCtoWnQ1Wi9RdkZ6UDdSTkNXaUpvYnN1QnNpdENERFJLMDdy?=
 =?utf-8?B?MnEvSWdHa043VmZyUXlUTCtlbk5hSnZKWVBJczhkM0U5UzVodGVUenpTOVh2?=
 =?utf-8?B?T3hzSHBOaDdjYlFOdXgvS0k4UzlzZlFCK21QVTRVbS90c2Nzb0F2dDNIQlZs?=
 =?utf-8?B?dTY2bjRRNjdpczVoQjJVcXB1T1BFbjk0WUVwdC9kbWlGcTJUbk50bzZFMExN?=
 =?utf-8?B?MUk0MENZbE5nY0VKcDlJMEhFSndWYWo0Ykc4VFBnMGtpOE1JTmR5Y1g1YmU0?=
 =?utf-8?B?aWRsaEVYNjN0L3hVMGU1WCtVTWsyQ0YrTGI0c2xyUENjeS9TR1FiNTlBZy9y?=
 =?utf-8?B?WEJlK2JWMldqaTB5TTJWSzBqU1F1aDQ2UEljTzBFU3BMOFVleWNxQzE2d3p0?=
 =?utf-8?B?TFM4TDI5VlozbjVybzhMaElBOXRINzk2QjZvaUx5elNIY3RMWEN0Wm4rei9U?=
 =?utf-8?B?d1VtOCtEWklCSzhMSjVMb0ZpUkVEdUdrZ2FKc3lBUkE3dG5HYWZpWDQ5dlZv?=
 =?utf-8?B?SG5iK2hEVFM2Mi9UZDlJcGpzL1kxZjdYdjJUeHM2bGc3OGJLdDk5SnlBTmVa?=
 =?utf-8?B?SlFGTW9kaFczZnZJMVlSV2hUcjkxMmtZdDE4Ym5CTUlvdzY3NlIra3JMRHBU?=
 =?utf-8?B?MGdiOGtpdUM4ellJMXRaQWUyUW1LWk04TEJkaENGampPeW1jS1NOYVlmTlFk?=
 =?utf-8?B?Nm5ucjk1UDZJZC9kMVJYV3VpaGZ6VTZERjA1dXhoN2RiZzR6MmJpRUpkV1M0?=
 =?utf-8?B?TnkxRHV0eUZqMWlWRFZZUXlOc0p4dThsWFRBam5XM3doNU5KekhSTkVNUlFB?=
 =?utf-8?B?WFQyQSszallBZ2hadWZHK1BQN3ZzcHNuYmt3MjNEYXo1NU9yUzlpUVpUNUZX?=
 =?utf-8?B?eldNYlNDWjkwYXJlNDhZRE5XV0JDLzcrbitFZGZvQ1lsTkV1KzB4ekhWenBS?=
 =?utf-8?B?clJhRmoxM0NxbHNxbU9NTDRiU09GSEEyMTNCcWFKRFlHYmVWT09EMHRMV0xW?=
 =?utf-8?B?WU9ZRVFFeUJJQkt6eDJpbWZKOXc3cVU1UGZpbno2dURDYkR0SGhtV3QzbzVG?=
 =?utf-8?B?YTV4NEhBaFE2aWd2T0ZaMXFrUjRRdEZiQWNwNy8vbjkvM0tXUWwwOGZVc2xE?=
 =?utf-8?B?VnJsaGxaNVVsM0NYREowWnNGTkxjai81YUF0ZXF5M0pWNndLeVYwSFJXcG5R?=
 =?utf-8?B?SnYrRkg5YUErVzE2TExrUkJhOXdqMGorbHQ5TWlQNzU0cnNIMmJvdjRCR0Nu?=
 =?utf-8?B?UXdEUUZzZUFVM0Zya1NnRk5Ta2ZRUHE0ZnNtcXM3dlJGTFFFRnRlOHN4eW9S?=
 =?utf-8?B?Ung4T3lDVmM2UklpK29JZlNvZnZlM2VhMDlyeGFHOEQyMG41dWdudUZMSW1z?=
 =?utf-8?B?dHg0THBOUHdkMjYrYWZ3SGJudHpTaGRMVUdqT1FuMWdpUS9WSWpCVzJWOHha?=
 =?utf-8?B?c25tZGtWR1YzU1Q1cjllT3pYdkhWSmsvSGlXd1UwRnFJYkFvdEhUVGNZS2hW?=
 =?utf-8?B?VXhwRGJQTTNhQVdwdmhWOGJsVkdKRXFFbjNBeStOUmhRNHlaWElMdGFUaGNv?=
 =?utf-8?B?UDJvUkJUL0lTZklEQngrSzNwdmowcXdLUDZVRjNJcDh0UlhnYmdxNW5USFNC?=
 =?utf-8?B?VGladktYcU1pWW1Oei9PSDlxK09TK1FrMFdzSGI4ZjdkVEpvUnFvTmJBNFFT?=
 =?utf-8?Q?W+1pMUCEnB1mBsZHg7kYIB2qu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d93aba7-f515-42e5-68df-08dafa1fce68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 13:19:34.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMcUj3IUZBzjvvnqJWJwzm0FLG6koya/ov+eJOh+oioSyc6SSZdS2XNFBNsh/G+XiHmBNCozKMJn76Our6YlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6841

Neither p2m_mmio_dm nor the types p2m_is_readonly() checks for are
applicable to PV; specifically get_gfn() won't ever return such a type
for PV domains. Adjacent to those checks is yet another is_hvm_...()
one. With that block made conditional, another conditional block near
the end of the function can be widened.

Furthermore the shadow_mode_refcounts() check immediately ahead of the
aforementioned newly inserted #ifdef renders redundant two subsequent
is_hvm_domain() checks (the latter of which was already redundant with
the former).

Also guest_mode() checks are pointless when we already know we're
dealing with a HVM domain.

Finally style-adjust a comment which otherwise would be fully visible as
patch context anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not convinced of the usefulness of the ASSERT() immediately after
the "mmio" label. Additionally I think the code there would better move
to the single place where we presently have "goto mmio", bringing things
more in line with the other handle_mmio_with_translation() invocation
site.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2158,8 +2158,8 @@ static int cf_check sh_page_fault(
     gfn_t gfn = _gfn(0);
     mfn_t gmfn, sl1mfn = _mfn(0);
     shadow_l1e_t sl1e, *ptr_sl1e;
-    paddr_t gpa;
 #ifdef CONFIG_HVM
+    paddr_t gpa;
     struct sh_emulate_ctxt emul_ctxt;
     const struct x86_emulate_ops *emul_ops;
     int r;
@@ -2583,6 +2583,7 @@ static int cf_check sh_page_fault(
         goto emulate;
     }
 
+#ifdef CONFIG_HVM
     /* Need to hand off device-model MMIO to the device model */
     if ( p2mt == p2m_mmio_dm )
     {
@@ -2614,13 +2615,14 @@ static int cf_check sh_page_fault(
         perfc_incr(shadow_fault_emulate_wp);
         goto emulate;
     }
+#endif
 
     perfc_incr(shadow_fault_fixed);
     d->arch.paging.log_dirty.fault_count++;
     sh_reset_early_unshadow(v);
 
     trace_shadow_fixup(gw.l1e, va);
- done:
+ done: __maybe_unused;
     sh_audit_gw(v, &gw);
     SHADOW_PRINTK("fixed\n");
     shadow_audit_tables(v);
@@ -2629,9 +2631,10 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 
  emulate:
-    if ( !shadow_mode_refcounts(d) || !guest_mode(regs) )
+    if ( !shadow_mode_refcounts(d) )
         goto not_a_shadow_fault;
 
+#ifdef CONFIG_HVM
     /*
      * We do not emulate user writes. Instead we use them as a hint that the
      * page is no longer a page table. This behaviour differs from native, but
@@ -2653,17 +2656,11 @@ static int cf_check sh_page_fault(
      * caught by user-mode page-table check above.
      */
  emulate_readonly:
-    if ( !is_hvm_domain(d) )
-    {
-        ASSERT_UNREACHABLE();
-        goto not_a_shadow_fault;
-    }
-
-#ifdef CONFIG_HVM
-    /* Unshadow if we are writing to a toplevel pagetable that is
-     * flagged as a dying process, and that is not currently used. */
-    if ( sh_mfn_is_a_page_table(gmfn) && is_hvm_domain(d) &&
-         mfn_to_page(gmfn)->pagetable_dying )
+    /*
+     * Unshadow if we are writing to a toplevel pagetable that is
+     * flagged as a dying process, and that is not currently used.
+     */
+    if ( sh_mfn_is_a_page_table(gmfn) && mfn_to_page(gmfn)->pagetable_dying )
     {
         int used = 0;
         struct vcpu *tmp;
@@ -2867,13 +2864,9 @@ static int cf_check sh_page_fault(
  emulate_done:
     SHADOW_PRINTK("emulated\n");
     return EXCRET_fault_fixed;
-#endif /* CONFIG_HVM */
 
  mmio:
-    if ( !guest_mode(regs) )
-        goto not_a_shadow_fault;
-#ifdef CONFIG_HVM
-    ASSERT(is_hvm_vcpu(v));
+    ASSERT(is_hvm_domain(d));
     perfc_incr(shadow_fault_mmio);
     sh_audit_gw(v, &gw);
     SHADOW_PRINTK("mmio %#"PRIpaddr"\n", gpa);
@@ -2884,9 +2877,7 @@ static int cf_check sh_page_fault(
     trace_shadow_gen(TRC_SHADOW_MMIO, va);
     return (handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
             ? EXCRET_fault_fixed : 0);
-#else
-    BUG();
-#endif
+#endif /* CONFIG_HVM */
 
  not_a_shadow_fault:
     sh_audit_gw(v, &gw);


