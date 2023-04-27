Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807B6F05D2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526988.819094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0lv-0005K4-Ja; Thu, 27 Apr 2023 12:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526988.819094; Thu, 27 Apr 2023 12:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0lv-0005IM-GZ; Thu, 27 Apr 2023 12:30:51 +0000
Received: by outflank-mailman (input) for mailman id 526988;
 Thu, 27 Apr 2023 12:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ps0lu-0005IG-7i
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:30:50 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe12::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 570e67e0-e4f7-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:30:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7698.eurprd04.prod.outlook.com (2603:10a6:20b:282::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:30:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 12:30:47 +0000
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
X-Inumbo-ID: 570e67e0-e4f7-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2GUxjBLQNoYdJvKh8yU8WqSHbgtEprjKthpU4kWYbc0Vdex31787FKr+HEN+FS0UL8PmbsDCYz1w4kbLybJj00dWLojVaICh/1DAhjigkUWyD0HZecwgg3CvLGEX3UvFgfCsAhHwU70bU6T+m7EDrPcZUPG/1WWMp1u+fFv1619+CXsKmJT+zuiynFvbgK5Ng72BlJYfsFyqt1Xykzh8S6A/JyMcn+Nr08GGDcMufTc7wFngayLwMz9eRqfMojza8rEbIEvNzTd/16OpCytHJA4w7EsCksBymgsgJSbu1+U485O0aBiSSkkv1N4gtPrUIBcg5QX3PUw+GabL1UyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSCDGoMS8DxV99cjm4knNAU2old1EG2GkTc6sQ76v8M=;
 b=iBUAILYoepAVxZouI/7DytgeFwi/D8nW6HQOYXhspsCvdEACaXSbkqkn0H5gLYr0EracMoir99gB1cxD+jXioTp5FNCAR70vFO80Ql+OQ/9JqYxnjk9uEjeuYkLS6QA/At5KxWJkYBWl7afWtL3knPz+n8JUmd+wxZO6YwwKkv0KnXqJWRoQ899YZZqCt4gO1Iu8wxVdBcRKUsXYY/g/6CAhzWxFP3Cbq4kad9GnEASNNxeMM+jtkOOYyDvjQ1hgYB9uttm4W8QoDG6PBMOQkAukF2jsqHolPlPt+KUgFVwRpG9SpbFMlLm6Ml9RzuE4q1Z2/qsYf2QfFYpRbm8tQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSCDGoMS8DxV99cjm4knNAU2old1EG2GkTc6sQ76v8M=;
 b=e4sO/7+87GVi1yaL0Rz3OGqUOVx8oAo05be+x8OhM3RgN7hZkwL/SDX88tqbUoQlUmbwWmWq1OsqCmLLiZ+w3mmTs2WInDSg6E8LsBmPdYEhm8lCb+U9EAtRS071fE/JeEeqGlPjXgyRk2NGgWCDjRKnHREemh5GWgQbpD0eiFbPRQ7dQRvweHTI+1/bJXiJrqQKfnuATqaPF/dzHEo3mGRQEdzl9nZkutU3pRdpDd4Qc1XrLvNWdkZGQWUmxNWv1EHv7Yy5jI43oOJPPUGw1KqNDo1jQ3EmYcxZ0cLQtiGDm64fgrUufWJsVJq3/cUlSxdSVOpnFtUR8TOgqtUSbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6803514-7aa1-a927-57e7-299097470bb7@suse.com>
Date: Thu, 27 Apr 2023 14:30:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: drop log-dirty-enable's log_global parameter
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 1251d0c2-2ff2-424e-79fd-08db471b3a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jneGr4KRieLA59UhpXlfTLdK2OkIMlN7BtV6b9qsgT94p4DLZyg1TACB/335hW6d0OOwRJ15Q7NRZEg//IWaACY4HIqqEYE3if4va+MfivbfcVbWUguhUFubes0U5cgAB0fBtCutzyHv4T0vU/Uiu7zsuL1xQMbBdNR/4s1MZBtQkN1asGMDlyvUBqglioF5soc5Dpf3OTMPRYCbiAKMyZHz8kZUSX+MpmqZ4e7KJhosMuYUBRaHqYWx4QSeH/r6yWmi8+IysAp67xib/mwl2qk7Vqkf1jeZQYSSu3ceqbMEFARKR8nQZNOLkFzQ1PB3/PqFO68uB/nfyWbFp+UNI6491XOcJfRZHBNArkjfhVWhjSzUpsFqd9p6x0/P++SG2KM0a5nRW48atG5T5mqRTRZYiZfoMinSPyNB2rt6w1VtHWiBnixe0MDfpUA0c3FMuMwvTpx6G2vj+2wh4+0iPMZ4glqjIE9dt1SPnrZLZlGDcvNkkfe1UpCYPUYGWDBeR9AyT8ZCBU2u1M+xNkV0PEbkDd7ffxave7Qh4KQ1Qr1hjPWjZOpXjrctu8c0hHQsHVySEH3eL7EDmQNgHLE3bq5XlzyePgcG08Td0h3NBGrPbZYqmEqL6NI+xXsOCvk2jgClWxcvmylr5kujNmjZmP/9fxlymVbSZk+f5BIdqcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(6512007)(66946007)(66556008)(478600001)(6916009)(6486002)(4326008)(54906003)(8936002)(66476007)(41300700001)(186003)(38100700002)(8676002)(316002)(2616005)(26005)(6506007)(86362001)(31696002)(36756003)(2906002)(5660300002)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHAxRGtBQkZya3NMa3daT0Z5YzVBTW1iLy9uVzFjSXdGZFVlMDQzT1RtcTIy?=
 =?utf-8?B?WXBkU1dWcXhaVnkvZzVUMTRkcWtiZXJhUldoQWt1MWlXaXRyN0hxcTRUb291?=
 =?utf-8?B?aFlCWDVMS1I1Z21GTEFyeUhzZVZGZ1VONVlpSjFrMHdPMGlYSkdtUnA2YTFn?=
 =?utf-8?B?YTBkWERqZlRSSHVXdkdSVnEwSFdlNy85K0tWSmNsWXBEWldvZStEWTVFQWFT?=
 =?utf-8?B?ZWJneTExSFo0MFFSRUhuWkZQUC9wN2RhUzRGb3JYakUrS0xiTm1YR3VTVHNY?=
 =?utf-8?B?OFhsVlhHRXFtRGd0cDlCNlhlNUp6VW9aS1JXV1cxL2pwNDRTanEwNkNsYnZN?=
 =?utf-8?B?MzQralBmTDdBQlNDLzY5djhZWGxVdXo2cDB6eXRuTnMvcU9RWGRLdnhJanpr?=
 =?utf-8?B?YlAxSUFLcjBSSUthcGUrRGl6NTF2UkhhdnlGRFJFeWQ4SjhRMnY3U3RVUEJM?=
 =?utf-8?B?MlNmbTNVb2kyUFo3WjZLRlp3cHpaQlMxemhtVVhYUVNKeEZFRUNVQ1hWYllU?=
 =?utf-8?B?c0VnYkRqKzFhVTIwOW5FU1lKV1FEQWo2dFEvc1pSVmtocnJ2Q2NaenVEOTQ2?=
 =?utf-8?B?a0hjNldFNjVGNDZld2k1d29WaTc5L2dxUWFUY09EbDNRM2owUGFNYXB5d3BC?=
 =?utf-8?B?LzhhUjNFMFVSb1dFVGxha2hwYmI0WUFseEFtRE5WZ3Q0dHpmeUNpMFJMM3VE?=
 =?utf-8?B?dVYybnh2QnBQZWNGa0RuU1JCbnpRNisxVS9BOFhZeDFvRnFjWHcxUExOMitv?=
 =?utf-8?B?c1BHWjhxQ1hrS2d0NTJUb2N4V1BVdXJkaUJzUWR4N0l1dWMydTMvQVJUeWU5?=
 =?utf-8?B?LzdjM2lVWkdOdlMzY3NaeEdPemxSTFFEeVYvWkxLcmJXQVAyeFVoZ3Rvb0t0?=
 =?utf-8?B?cjZqY0FNSVpJUmdsYlNYRFh3L205VDBnamJ1aVE5d25hTkM5OGRUUm1najFZ?=
 =?utf-8?B?Ri9VUjNPUk5mUWdvY3gyaGNrVmx4YjdJVjN5REROV20vRzdadlRmODZOc1No?=
 =?utf-8?B?akNSaWxBajBXaXNud21jcjM2R2lDU01rWkt2Q0l5cWNDWU1USk5QMWVjMWZO?=
 =?utf-8?B?QjdsK3BSQkdwMFZnL0FDS3ZYNVR3aC9tWUFOdEZ1QkxXT0hEVnllYWV1YkVT?=
 =?utf-8?B?MXhoYkVUbXBSTVl2c0EvNFcxOW1DcDNVU21rc3J4c1h6cXUyL0R4ZVZrandO?=
 =?utf-8?B?YTRGaVIrUDJ2U1NlL0dyRVVhdHlBME50R1NVYUIrNFllcEx4MEVyMUlremJX?=
 =?utf-8?B?MU8wVjNna3R0TDV1QU5IWHBXY29sNGtxN1FXTWdWSE52WEtRUi8xNEdocXU2?=
 =?utf-8?B?ekZzcHhuZWl5QkMzb1lMdVJQRzRFb2VxQWt6RGIxVmwzVlhNSnBBNFN6Z3Rp?=
 =?utf-8?B?bDJwbGRURTUxa2h3N09PaDNyRnhRRG83VVBhcksyWkpZNTgwd1BRYnlwaDMy?=
 =?utf-8?B?bndjZ2ZFK0dCbG9IMmlId0xxYTRaajUrN096MzlySXJKUFRFZ2l4NVBqQWhl?=
 =?utf-8?B?cW8zWW9aejJKRm9UYkd6QVdLK0I0VXN4ZzZPOVlqdGROa251dExVbHdLTHJJ?=
 =?utf-8?B?MFhIa2pJWERYMWNqRUlzLzdvK3dhY2hET2NrSVlPSHU3cHlTdy9mY2FuUjln?=
 =?utf-8?B?VVRrZCtXKzZ2NDY2aCs0bXdOZzZDYVBKR0ZjNDVtUHdYSEFmcTBXdjZTL1RW?=
 =?utf-8?B?YmRQTVlFZmZKTEpTODYzSXY3azUwQWxxdlpGbWM5emI0akhmcGxHZkRBaHhT?=
 =?utf-8?B?cHJhKzJBdjhLTWluaGYxSXNpL0x2M3krNzRPZzVFQjJKc1hOa1gwVU9tQWMw?=
 =?utf-8?B?R2p0TTV1RmFSMlFEcFdrbWVtQ2FNdVZpcldCZW5rY2ovclRFbFAxNTRCaThu?=
 =?utf-8?B?S3k5Mm01cE9KL2hOY0VQenJRSUh6QkpXZEt4MDEyR0lwTytHUzQ4SUg1dHdY?=
 =?utf-8?B?M1B2akRZMW9wS2lGR1ZHaUMrK0k4VjlnV2U2MmlTbkpTMGJqYW9uVnN2VU5l?=
 =?utf-8?B?RUtqUmF6MHUxdjJWMGEzWEZnZi84VVdRc3lxMGZSWmpGb3RjMHY4enlUcEQ3?=
 =?utf-8?B?clFKTnc4Q2daTFM5M2Z1cUdsLzJnOFdjd0ZjR25UZVpTdkFxYU5qdnArdmJF?=
 =?utf-8?Q?ETtel68mYqULjMHJtbZhrZxmk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1251d0c2-2ff2-424e-79fd-08db471b3a59
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:30:47.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XF2vTIVbsKZSiPnLqferFOnouzILiYmERqEd9S/JqagFRQ8EhBKCCo8FO9ru7nlUXf41DUPZIP4EVCGkKuIXSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7698

As of XSA-397 the only caller passes true for it. Simplify things by
getting rid of the parameter for both the internal paging function and
the involved hook.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -186,7 +186,7 @@ struct log_dirty_domain {
 
     /* functions which are paging mode specific */
     const struct log_dirty_ops {
-        int        (*enable  )(struct domain *d, bool log_global);
+        int        (*enable  )(struct domain *d);
         int        (*disable )(struct domain *d);
         void       (*clean   )(struct domain *d);
     } *ops;
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -164,10 +164,10 @@ out:
 /*
  * hap code to call when log_dirty is enable. return 0 if no problem found.
  *
- * NB: Domain that having device assigned should not set log_global. Because
+ * NB: Domains having a device assigned should not come here, because
  * there is no way to track the memory updating from device.
  */
-static int cf_check hap_enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check hap_enable_log_dirty(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
@@ -175,7 +175,7 @@ static int cf_check hap_enable_log_dirty
      * Refuse to turn on global log-dirty mode if
      * there are outstanding p2m_ioreq_server pages.
      */
-    if ( log_global && read_atomic(&p2m->ioreq.entry_count) )
+    if ( read_atomic(&p2m->ioreq.entry_count) )
         return -EBUSY;
 
     /* turn on PG_log_dirty bit in paging mode */
@@ -186,15 +186,13 @@ static int cf_check hap_enable_log_dirty
     /* Enable hardware-assisted log-dirty if it is supported. */
     p2m_enable_hardware_log_dirty(d);
 
-    if ( log_global )
-    {
-        /*
-         * Switch to log dirty mode, either by setting l1e entries of P2M table
-         * to be read-only, or via hardware-assisted log-dirty.
-         */
-        p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-    }
+    /*
+     * Switch to log dirty mode, either by setting l1e entries of P2M table
+     * to be read-only, or via hardware-assisted log-dirty.
+     */
+    p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
+
     return 0;
 }
 
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -201,11 +201,11 @@ static int paging_free_log_dirty_bitmap(
     return rc;
 }
 
-static int paging_log_dirty_enable(struct domain *d, bool log_global)
+static int paging_log_dirty_enable(struct domain *d)
 {
     int ret;
 
-    if ( has_arch_pdevs(d) && log_global )
+    if ( has_arch_pdevs(d) )
     {
         /*
          * Refuse to turn on global log-dirty mode
@@ -218,7 +218,7 @@ static int paging_log_dirty_enable(struc
         return -EINVAL;
 
     domain_pause(d);
-    ret = d->arch.paging.log_dirty.ops->enable(d, log_global);
+    ret = d->arch.paging.log_dirty.ops->enable(d);
     domain_unpause(d);
 
     return ret;
@@ -728,7 +728,7 @@ int paging_domctl(struct domain *d, stru
             break;
         /* Else fall through... */
     case XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY:
-        return paging_log_dirty_enable(d, true);
+        return paging_log_dirty_enable(d);
 
     case XEN_DOMCTL_SHADOW_OP_OFF:
         if ( (rc = paging_log_dirty_disable(d, resuming)) != 0 )
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -67,7 +67,7 @@ const uint8_t sh_type_to_size[] = {
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
-static int cf_check sh_enable_log_dirty(struct domain *, bool log_global);
+static int cf_check sh_enable_log_dirty(struct domain *);
 static int cf_check sh_disable_log_dirty(struct domain *);
 static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
@@ -3030,7 +3030,7 @@ static int shadow_test_disable(struct do
 /* Shadow specific code which is called in paging_log_dirty_enable().
  * Return 0 if no problem found.
  */
-static int cf_check sh_enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check sh_enable_log_dirty(struct domain *d)
 {
     int ret;
 
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -1,13 +1,7 @@
 #include <xen/mm.h>
 #include <asm/shadow.h>
 
-static int cf_check _enable_log_dirty(struct domain *d, bool log_global)
-{
-    ASSERT(is_pv_domain(d));
-    return -EOPNOTSUPP;
-}
-
-static int cf_check _disable_log_dirty(struct domain *d)
+static int cf_check _toggle_log_dirty(struct domain *d)
 {
     ASSERT(is_pv_domain(d));
     return -EOPNOTSUPP;
@@ -27,8 +21,8 @@ int shadow_domain_init(struct domain *d)
 {
     /* For HVM set up pointers for safety, then fail. */
     static const struct log_dirty_ops sh_none_ops = {
-        .enable  = _enable_log_dirty,
-        .disable = _disable_log_dirty,
+        .enable  = _toggle_log_dirty,
+        .disable = _toggle_log_dirty,
         .clean   = _clean_dirty_bitmap,
     };
 

