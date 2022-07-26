Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4C5816F8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375516.607959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN4G-0006hN-6T; Tue, 26 Jul 2022 16:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375516.607959; Tue, 26 Jul 2022 16:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN4G-0006fV-39; Tue, 26 Jul 2022 16:05:56 +0000
Received: by outflank-mailman (input) for mailman id 375516;
 Tue, 26 Jul 2022 16:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN4E-0005zG-Bb
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:05:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3284579-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:05:53 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:05:50 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:05:49 +0000
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
X-Inumbo-ID: d3284579-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWMypyfxcoStgzw3imPIRWUl04DLwak49WfhFmf6OOzQdpkR9ojZRlQwQAoKW6h+0rrHu5CMMkxjF0aYdEPzb5IgLO3iRs5DU2SHDJYAM5FxSEWHXC0eCl6L8zvBhdqnHf9TPeHol9ijFxMoZhokt1f5P5q0rpYRaMrZrakbGivVuJtzztMtFW+6RGyOcv7iZipYXkCvK7Hv4K8kPIFGgZ1eqavjHOxuvpSntOr9AmD5XfbxFZAglHrROOJJ0xaPBm3Np7JIDtJewQ0GG0NmUKXgs3hRdoNiQNN21E2SsItplJxhZs2UsiRzRxq3k23fgGdUgqGsXMdWcKiVPP4dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaVObIIKwSsNFmuQ6pXbbqRuzlKrtGx5TcJJvcCnz5M=;
 b=GmYDE6n/HAqG8k7JrqpWc5zhZjr9medaA/jWzhjRRUQAbJE4WPZUxg4muXXetm1ZomS8MzU2CvtwR8FGtqacoXTQPFzncbvxxjFb+5Jn5BXY0s3Br47N5C7+19mLaG75FqGoP2ai99Ctapdl5fOYcRmqyjr46WolgbRMET6/4HRSoKkQQnKqoknY0ZW9c8cqYjLcJm6bU4eUQjzmpdBi9aD/pu77d1sUIAFpahVo5WHd0XBu+zqRH4N3PydHs1ojK4CEoJJmynUN7bdwosiybHAqTdCpSPsOYX8Z8+CV/C97P2PqTgBFfKUFoRTdKdSV3GnFI/V+9XA9o+/H58qJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaVObIIKwSsNFmuQ6pXbbqRuzlKrtGx5TcJJvcCnz5M=;
 b=wNHNedfhu2VIgCiNYN7M3qfHRdksfhI8Bqo/QnK82DFFCo0aJ4QuHIeCpZ54euKK7b41P1MvT2r4S+K/LEltJf2uAJhqACumVLLu4JRckyz7g9XFiH4ETNB4uslyOsh7Me+0EmxyD3/W0xqLkMgv5AXcJjNcJnZLNb9SztJKb0350OstMAVRaIkm03VwJS8+pGimIYzN3ZU7XViX3KY1pvwxMay2gojb4gdy33+UarnynrXHmCA5u3s6j48Of7yWaHBu0EOEUYVLkZhiqm/4ckvQOS50Ao261jQr2XQGh2hpKvpkPaBMVzKwG2z+GAkTi0GYlFzcfmKua52FLN8U/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9af0bb78-f419-b4f7-d20f-cd46a5073f01@suse.com>
Date: Tue, 26 Jul 2022 18:05:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 5/8] x86/shadow: don't open-code shadow_remove_all_shadows()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0ce0f70-cf2e-404a-2198-08da6f20b542
X-MS-TrafficTypeDiagnostic: DBBPR04MB7532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIeM2wE3Cy2H3m6E057OvXYEmamOmpyHYJPRSsl4T0KhhNlmiKBWX4EaCru6ZZRgJWIsr2//XPg7l9+eqEyau47CC4W4Iv9zEipOOE97hJWRCKzqO5iR680moEqk52hbb70YukAdzmhqmMZPaCnPXgkMuRFOItL/WG31K0/0YOGscF5/wb99hd8vaCu3Cp3o+xYM5SVOVeU0RcrWmNt40DnFmzyjhlkjzjSMRxEO4cC2RW9suSloQ5wGkJOFe9om8FKtyIXUTH6velI8KKS6EURuM5fxGbOIUcSz8M0hLOJLmOlFnlLsFDpf+NLgumKWN6JnbQDDExr7BI4PW1GDic7RkTGdOdEaItxgc0EFjJlIaEjaLDU/DJ+GPjnOW1B/jwKzLSu9GlMZnqMzuFANMyCv7UbEbC1ovxfUv11gnIOpmaZhnyp9nJjOeDNg0Ca4Zhc6qOS64dAFINAbKoSpCbCk1OwobZXlMdLFPXYvQm4K8M1y58OYfcDZYxsm1PN5Bq8T3EG2CLJpiw8k89a90b+EIQc3feGJbhS01Mh3ZtwrDnzoIcxwSyAmE2O1bNRMIlKSFinxnJcrT7LOHtA7oZZLxWiaeeAI9aT41IuJqNUxad3NDHRF3LcAU+p4fh6MtVoNSaiZcmrA0LJuZ8XqYGXJxpQdmShefNjEC8ohsTotB7OFYbp5lJiTt9CxjbtVo5AhsQQTpGD/dBbriYEKHysj07JKsIPzR5ubSTz5P9rbs9V7FQZozKxEqZ1V+swq0DO+8IISl1bOlGK4CTuqJJZkrxOycDIEcNznxSfsHix8ISZ9oLwxycbmADo4WuY4KR84EZMHfRhsqmu4S/l0/ZctZJsVkF8OPyJRf4kDesY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(2616005)(316002)(8936002)(83380400001)(38100700002)(2906002)(36756003)(41300700001)(31686004)(6486002)(5660300002)(478600001)(6916009)(26005)(6512007)(54906003)(31696002)(66556008)(8676002)(66476007)(4326008)(86362001)(66946007)(186003)(6506007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1prYnJCQlF6dGpVUU9LTitKWllLQTBtVnFaSjBXb3RMSUt5Wi90V0ZmOEJE?=
 =?utf-8?B?ME1KRFVzbFRrWDg3RDk5Z254VHJaclhicXh1OUYwRWNERU14L1QrcDB0Nk1R?=
 =?utf-8?B?MXpvY2V2NnVkRGxYRGZMRXhrL2pYSCtrOGlVdERaQlhoNnRmRiszNVd4amtK?=
 =?utf-8?B?SWZpNTQ4VFdCSStpaVFYUDdZNjF0VHlZQWNraGRJWThWeWxXY0pyVWJ6Sndk?=
 =?utf-8?B?TXQzdGJtaTBFa29sbjBQSlBEdVRCNy9XUmExZWhqTzJuek5IWHZLdS9oOEp2?=
 =?utf-8?B?MzZDOW9iL09vbGlUSjloeVBXdndCZGpMeUIxUHhYaGtDRDJRL2dUNXhZNjlG?=
 =?utf-8?B?WkoxN2tLRURoNW9QMFBHbnVvMDNpaEgwRmY0L0hzNXVwZWNiRW5JNnZGZDBO?=
 =?utf-8?B?U2VGK1VEY05ZeTRmb0sxMEFBblNNYnJLb2MzVFlEL1lkd1dPME1rTzZGMTJq?=
 =?utf-8?B?ZFdSc3p4NkZtMTRub2lyc1VYeUFjSHJzVlVtemdIQjV4TFUrRXRrMm5GS24v?=
 =?utf-8?B?WVIwaFYxd2VEYnlJSWIrc2FlWWpKTEplQlBNclIyTFhUdU83WTJCZUdmRVF5?=
 =?utf-8?B?SnhRV25TQ3hKRWJBZHlIMWswdmtBMVlpZDFURWpjTlNaSDVaYWRCc1RGT1I1?=
 =?utf-8?B?c1JNUkM4Y2hxYWphVDB5OFJCcVMrSGNsdFBFdGJTbWw3b2tGb1NVa2pndndO?=
 =?utf-8?B?blduNEludms4aXBCOElWZ2JHWE04Zlg3VjIwdzdMVFh5UEpqTGIvYzNudzV1?=
 =?utf-8?B?ZmlmYjJlT2VqMTFjQ3RmZ3dHYXZwVm1pSzU4UEgrMlpQcEp4cEpMMkcwN1RC?=
 =?utf-8?B?SUhFSHZ2dVA0Q3BHVHRCWkp1Z3hIblB3MkdOZkFpV290cFppa1JxZVc1V1J2?=
 =?utf-8?B?cUYxcUMwc1dOb2pZNFBoc1lpRENQSnRSRGRIcXozSVdmYWl2anZyS2VieDlU?=
 =?utf-8?B?WjNaL3RSM0s1dXM5ZWlJVmxqaWZRY1hqR3hRY1FaTE9CQXh0WWRjaHJGRnZs?=
 =?utf-8?B?NUtaTmdwT2tLV1N3WFlUaE5iUDVkUUd4OXExTjFmV1RVWUR6QXBoOUphZTlP?=
 =?utf-8?B?dzVMWlhPaklFYWk4Y2pST1A4d1FWYndRckpkSTFUT2JjZ25kdzRhT2c2ZHRR?=
 =?utf-8?B?cGVnN1N5MmFZT1ljQVlIei9iN3IxYnJSWmNieXRIbjYxOEs2VjJBeVovblM4?=
 =?utf-8?B?OFoxTms5dzBQOUhOUjU0OThPeDNtVFBaNTNnemlvcVIwdUJqRWNFVDVQSGNG?=
 =?utf-8?B?QWV1NXlpWGxFNi8vK1FFcjZzVGRrbTk4NllyQmFCYlltRkl4endrcjBxWGJK?=
 =?utf-8?B?TmtSNUdJT2xMam1KWEJYMExtSkFPK0VZQ3p6Rk11QnVsb2JHYXdTaTFRTkhr?=
 =?utf-8?B?VjJNMmNTMGdUNHpCSFJRWVJqaURxaUFVVnNEcFVTc2p5RDJhMm1meTRWdkxz?=
 =?utf-8?B?WC9jZGNnWStONDhpcExoQXE3TVVRekdZSUVJa2dFdmNYWW5DSHVoVGJRSW5E?=
 =?utf-8?B?eTNuSkxLVGxCcHZJWW94SUMyekVFQ0ZxWlIzVmRqem9ySnQ5cU1TZ3ZlUEEr?=
 =?utf-8?B?alFacTdSMm1yV2x3L285b3RCeTh2OS8wZ1NsUmFEQk9nZGQ3ZlIxbFVscHpB?=
 =?utf-8?B?SE0rdnFtcjdDTk1Wb2YvOUpzRTFYMGJKNzNTOXhDOFdXcEZLZFRXQml0UkN4?=
 =?utf-8?B?aVFSOWJ5MFFrcm5DNlNVbVdQK0FWT3NNTjljeThQSGNvZXpJM2EwZ2Q0ZmJG?=
 =?utf-8?B?RU5BMmhwUmtXVUh5c1BON3A4alFJY0M0M0NGMjVNeWJIbE1TL3lkTXN5RWlG?=
 =?utf-8?B?bHVYNUlMWWlqQUpROWV5UDFEbEcwclJaam5xQWtCS2hDU3VveEZBVnhJK3U5?=
 =?utf-8?B?dnVkeHEwSld3MkNkanVQWlZ4MEx1OU9IMUdDazhZYnE0UkNTZm5RSHl0TGRL?=
 =?utf-8?B?eWVucHF3MVl6cmNuMG9kTjUxMmw4MDRLb3E5S3BOQ1B3c1RxL2tuKy9GSlFZ?=
 =?utf-8?B?OGkxdkRhY1lzM0syQ2RzelozclZHUEF1VkpERi8xZ0IwMm1pMFRlelh4NHN1?=
 =?utf-8?B?MkQ2MHk4SitUZDFTQkNsZHFXVTZSSnJueVlSemM1QVdwL25hTUpaQkRUZ2Ev?=
 =?utf-8?Q?GB0ZkMn+91RK7joW+jdvkvmj3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ce0f70-cf2e-404a-2198-08da6f20b542
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:05:49.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kNMhtrAlHC6LL2HZETkkkWXu+mq7AuraTjF9Dk2R0Ysd39mebETulS0+ShpibKoIkCT6EcV8B5JVDU7H5NggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532

Let's use the existing inline wrapper instead of repeating respective
commentary at every site.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -389,7 +389,7 @@ static int oos_remove_write_access(struc
          * the page.  If that doesn't work either, the guest is granting
          * his pagetables and must be killed after all.
          * This will flush the tlb, so we can return with no worries. */
-        sh_remove_shadows(d, gmfn, 0 /* Be thorough */, 1 /* Must succeed */);
+        shadow_remove_all_shadows(d, gmfn);
         return 1;
     }
 
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -783,7 +783,7 @@ sh_remove_all_shadows_and_parents(struct
 /* Even harsher: this is a HVM page that we thing is no longer a pagetable.
  * Unshadow it, and recursively unshadow pages that reference it. */
 {
-    sh_remove_shadows(d, gmfn, 0, 1);
+    shadow_remove_all_shadows(d, gmfn);
     /* XXX TODO:
      * Rework this hashtable walker to return a linked-list of all
      * the shadows it modified, then do breadth-first recursion
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2632,7 +2632,7 @@ static int cf_check sh_page_fault(
         SHADOW_PRINTK("user-mode fault to PT, unshadowing mfn %#lx\n",
                       mfn_x(gmfn));
         perfc_incr(shadow_fault_emulate_failed);
-        sh_remove_shadows(d, gmfn, 0 /* thorough */, 1 /* must succeed */);
+        shadow_remove_all_shadows(d, gmfn);
         trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_USER,
                                       va, gfn);
         goto done;
@@ -2718,7 +2718,7 @@ static int cf_check sh_page_fault(
             v->arch.paging.last_write_emul_ok = 0;
         }
 #endif
-        sh_remove_shadows(d, gmfn, 0 /* thorough */, 1 /* must succeed */);
+        shadow_remove_all_shadows(d, gmfn);
         trace_shadow_emulate_other(TRC_SHADOW_EMULATE_UNSHADOW_EVTINJ,
                                    va, gfn);
         return EXCRET_fault_fixed;


