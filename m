Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFCD665D0E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475325.736977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbWn-0003f3-9z; Wed, 11 Jan 2023 13:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475325.736977; Wed, 11 Jan 2023 13:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbWn-0003dC-6r; Wed, 11 Jan 2023 13:52:29 +0000
Received: by outflank-mailman (input) for mailman id 475325;
 Wed, 11 Jan 2023 13:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbWl-0003d2-Vu
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:52:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db852a9-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:52:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:52:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:52:24 +0000
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
X-Inumbo-ID: 2db852a9-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnJXs/RCFzWvUfIZrzXsIUTiCGrHr6jla1sdXi42MvSxY3MQAvpBGTIER/bnW4Hi5ytmrbHEpHM50/qAl7LaQzNhto4LVcKMd41+EiCKXZ0I4rQfOHZhgYeccEboBEY459Cj7O1DKpKIyYP4VcyQ9cYzaChZ4sLmwWbtl8dbvru+GrOlGNpvpX4QzQiJJjiw9uD7m1+mbr/1tVcpb7hj0k2L14e9KaQRpuIvDFS/CqYH5VuZ38QnhyHRQQOvk3JRHS1kg5RQJRKzWw8nf6wG7WI+e1mKEAHoq/egIo5JhAXz+UmIN+RmtLitzn8ysfMkP0g313xyZ9eWHSiS1L59xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK/uRlwbYcJhgv6CUBJFcIfHjTvH5M/RQaJchWkIy70=;
 b=MBCyyS5Ey085RxPJypzjAQCj2Yb0n/K4ZU6ceMTQFiXncVyeZhSiJdrioXyqjpzimOtdRLoWje5xaxE/cEiRwg3vPJTVlBSmN7xlZ/4fjFcDGeMJ701mEduSMVEHN6afcv67s6e2/rVHByDrK2MCXKwXkXv+HJgSR2vKbeJGKbobLIeoNXCsUoiVh5XiXr//78XWscH9VXMkiPBAwWf+H74k/egUrtU7R52DtOz67SGxR4CWHd9aeskIm7gGZaRQnbREj6/IRxD0BwFiVLuQYexTed5VIu2636UX04qRktdpPHbWsJ4QdCSGdNfDHybxYHdKrxLz6XJJeibbvOh+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK/uRlwbYcJhgv6CUBJFcIfHjTvH5M/RQaJchWkIy70=;
 b=zTZ3dJEnc4LIasDhgH0+ZFcgb088WgxZGxR1ih5Ddihv/4ynuTkzfMQOdNgtwMbwx+JPt1OWrPZS+B/3ES0zCAiZtSwLGtliXWkj47uK+tS0PyiiaSFqgGaiH0WUlzKijD8R+fDYHz7PjmkO5QbpOZmUStqPKGypaBrLJUzmr+VIDvo5ETjXJkPPxOxvs/r0+vqANr2/frYRF3m1S8P2rPH9zYsJaRs7xr3TzDxzxeQzqei7kVTt8qffp1ZUh3DOWzTxxan3sVmJ38v4BLvUWoscdzVGrgppVC4Kp1iZnC49dMUEdklIXQ/ZMGfPhurLjMvMB6icqWnO6oQh0cQgRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
Date: Wed, 11 Jan 2023 14:52:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc66c8c-e5ab-4393-7521-08daf3db113f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FAg/V3ol1FxL1GfqhAbdhCjB4B35KZL+j52JNj0TaLBgflCBP1Ix6ERrGgelSlRmnY8H5o/yYVhoKj4FW5QojGsNNNvTgzGZaBscoGuXgSCxZP+qwKL435daBOGcGHMb+fDX1OUg6P/82nvpqBKorVY3LZ1hyvSSTjW6pyeHrzhSr4YYeZtvZzkjZU3dVKlulV2tmzaovBPOjJRbtuD3CnqCVpuMe8up2X5ysjx9Ma36M26CSp5IMShlPVl2QZ8UHjxDPnT5Yu/Ua1jZwLUTL0utjr3poNDaF6gMh3PBpZb/mhbz1SQrCoUoQu3ZQ4yQabXqT9+1Ex4gwnMFSyndmXAbba53thJVAzeD7vLX39toVUH8pW0qbLcpLUEiGUswEP9R+xqAOa0lZPSG9BU74jvemnnJqARFTSylDbDU0a5Ww0gA2ndUOnmm8e/Z1Zboam5xBn2OT+r9rFdIKLkHV758IlvaHTW6IOEqO9R4RkjLwEhZm+6XGV2hm56eSNtl+8+xhBAXGE4+kDVNBqz87unFy+y4EvUaL32JhWExqKy/4n0qqO2lNOZyMTA51x6jboqhwS2qynHgzPoBOj/XkjliuzxGjrZBTm3dwLbTGHKa+ZyH/mjcqmhQDA94vGFRkQnN4F4OLmksR7X3ygeZi9miopC3g/3a2HHCrnjCX5iWrzBgndXcl0UPQLqMBr8BZLJGGYpMsxdxhxwz/gHy5T+g+l0aFF5rLBA3ehcW/vA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1mZ2ZNQVpSbTZxbUhqalNhK1hrTi9wZHlPSG5xZjlUV0xBeFhMb3JtdG5I?=
 =?utf-8?B?cTZta0gzUkhCb3JMeTViL1BueFc3bjQrdzZRU1dkanBTQkxpY0FvbDMvT2hn?=
 =?utf-8?B?QkxSTllCWkc0MU83YjY5RVRFSWdPeitZZGp3c1VEVm5tbkoveVpZNUpkVElX?=
 =?utf-8?B?OGVOOFhJQnAzMStMN1hwc1JYeVhnaFpjUGh3cVJxQ1VJbzd0Y2lHVTZTSkdC?=
 =?utf-8?B?L3BPUWVHMVhFdHE4MzUrcWFCcUM2aUFtMUdFeVhqSmE5NGFxK29WR0IreXM0?=
 =?utf-8?B?MDJ2RU93TUsreHp4Q1ZncGc4K01EWWdUQ0NUdFlaRW4zMVBHUVRwTndHZldR?=
 =?utf-8?B?YjVveDZyQWdJUWFwWThWM20vU2NKV3prUlhHRmxUWXpCZXZDUVRPdDZocTY4?=
 =?utf-8?B?cTFFdUg4aVg0MGhRNU1QSkhzR00xREdPUjZpR1JjenFjREFzKzA5V2Z6bVd1?=
 =?utf-8?B?VnFWb0dNUjVKMXVVbTlLdVJvUXVRWXo5dVdvN00rRGRrell0eDVNMU9YUVoz?=
 =?utf-8?B?N2lXZlArRktJUXMrU204R0RNbWRoRmxieG0wK2VWekZKSHkrYmptL1pwM0ZM?=
 =?utf-8?B?YUhkaE9zbEpGajlCSTVkbnFSSUoweGpaTFUvTldSUGFHUWJadzFweUREemRw?=
 =?utf-8?B?SlA4YXpSQVJtcGtZNk5wOHF2RmR4enVEZ05HdGxVM1pnaFlPUXZ1Q3dqQ3Va?=
 =?utf-8?B?d0Rod2VWc1AzQUZ1QU0wQWl3eURZbU1YMUlQb3NtMStNSmlocThEZGRaTzlV?=
 =?utf-8?B?SW5qTzQ4dGl0NktyZDZlWnBwVUR6eHJab2gxSXV2WlYyN2FHQlRscDFoZUNF?=
 =?utf-8?B?K0VZQmcvQmZycjJRQkM0R2pUOVJicEloS001SStyU21uMTlydVJFOWEvK3NF?=
 =?utf-8?B?UTNwbTRPd3hRaWdWa2xvemJaeUJHdVN1Mm52V0ZaS3ZHa3JyQ0JqUkNzL3gv?=
 =?utf-8?B?aHo1OE9sOEVHb2MyNUxQb1I4cUxlZ2cxRkR0UWxwUXpZSXVFZDhqd1FkOUhY?=
 =?utf-8?B?bitwaWVJbFRRWEI0WlJYVXVRTVcvbFExQkk0ZVpRWHFTZ1UyMU1UeENCK1h3?=
 =?utf-8?B?UG0yQ0dvSm92MFpsc0g1cFpkMG8rdWVYcllJSFVwKzJpVFN6QkxOSHF0OEJM?=
 =?utf-8?B?UzlKdU1WRjFFWmUvVVJncG9oYmVPZUx0Uk1qbFdtWjRXRUJyTlQrWEFuc3lh?=
 =?utf-8?B?bjdQZ2U4RzNwVXdIa2IxVUQxOTZOL01aMTZoOHRhTnJsVDlnOUVFdXJpR0hM?=
 =?utf-8?B?MG8zYWd2bkFCNnZMNktadlFNNnR4UDVKbXdGemJWcmdPNkFva01xQTBpTm9M?=
 =?utf-8?B?TFZpUTl4SDRtU05RTU12b3Y3bWk5WGtSa1VzZG9SeDhVMituRFFMeGFZWW5O?=
 =?utf-8?B?SGF2ZmJGYkxPeU1WUW9yY1lQUEFUVzhTampsL3FwZ3o5cDhhaG5JWlBITDBX?=
 =?utf-8?B?TEl2TVFOUWNiOFc2N09DdGxNVjFzemg3bFl1OUhjZmNtbXN3RzJsUVhYeXRn?=
 =?utf-8?B?QWNZcHY3ZXpUVCtDREs4QVQzNHhkd3lyRFB1VGROemtWU2VsWHRJSlE4b2xs?=
 =?utf-8?B?aGUvbEVBOGdnbllZY1ptVzVlSk1GUTM0NXNVQVRHZENFVUF4cERYRXVINXN4?=
 =?utf-8?B?OFo2Tm5YWmVld2JUcUFnVm5PUE1rNjZscitDNkNpT3RmVzgyQUdUdTh6QTA5?=
 =?utf-8?B?Tjh5SDVKZG90Y3NkOUJWR0k5YytaRlRTdnlEa3JIRm9hbHN3VHpEUTM3c04w?=
 =?utf-8?B?b1FnckkzazdzWEd6a21IdXM4Nms5RHFBeWl6cHNWM2V0enY3OGtxUlo0YnRO?=
 =?utf-8?B?VnIzUmM2b0N6a0ora0xBSXpta2hDNGFqTnBOaTNYakdkdGJ5R3MyMWFlZVBW?=
 =?utf-8?B?UFlURVZuak4xRkF2bXpLdVFUemdSTUs2SjcrNG0wTkp4RzdUeWNmaXM1MDRH?=
 =?utf-8?B?QStjYUpHakVleW1NTWxxamt4eGE5RERDZTB1clgzVkFiVlJuZnB6UU1XRkpj?=
 =?utf-8?B?OVl4OEViMDdqblc0aFZOZWNDTFZwcEE4WW14UWlDblhwR0k1TDhWSDJYQm1p?=
 =?utf-8?B?Z3JRdndaV1p1bHZta2FmNW5DcUx5MkJRbStoQ0pHb3NDU2lIRjZsZXA1UzBP?=
 =?utf-8?Q?r7K6LbkkbedpDlsGwErrqgxUj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc66c8c-e5ab-4393-7521-08daf3db113f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:52:24.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /U09tZ0oVetiutgyIdihm2DyfKHPO/w6U5ml9c+X/+ZicL/95qDaPBMkt1HZ0THp0BBZ33yXwVlA5/KkecZJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

Rather than doing a separate hash walk (and then even using the vCPU
variant, which is to go away), do the up-pointer-clearing right in
sh_unpin(), as an alternative to the (now further limited) enlisting on
a "free floating" list fragment. This utilizes the fact that such list
fragments are traversed only for multi-page shadows (in shadow_free()).
Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
in use in the common case (it actually does anything only for BIGMEM
configurations).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -116,6 +116,9 @@ struct shadow_domain {
     /* OOS */
     bool_t oos_active;
 
+    /* Domain is in the process of leaving SHOPT_LINUX_L3_TOPLEVEL mode. */
+    bool unpinning_l3;
+
 #ifdef CONFIG_HVM
     /* Has this domain ever used HVMOP_pagetable_dying? */
     bool_t pagetable_dying_op;
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2302,29 +2302,6 @@ void shadow_prepare_page_type_change(str
 
 /**************************************************************************/
 
-/* Reset the up-pointers of every L3 shadow to 0.
- * This is called when l3 shadows stop being pinnable, to clear out all
- * the list-head bits so the up-pointer field is properly inititalised. */
-static int cf_check sh_clear_up_pointer(
-    struct vcpu *v, mfn_t smfn, mfn_t unused)
-{
-    mfn_to_page(smfn)->up = 0;
-    return 0;
-}
-
-void sh_reset_l3_up_pointers(struct vcpu *v)
-{
-    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
-        [SH_type_l3_64_shadow] = sh_clear_up_pointer,
-    };
-
-    HASH_CALLBACKS_CHECK(SHF_L3_64);
-    hash_vcpu_foreach(v, SHF_L3_64, callbacks, INVALID_MFN);
-}
-
-
-/**************************************************************************/
-
 static void sh_update_paging_modes(struct vcpu *v)
 {
     struct domain *d = v->domain;
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -960,6 +960,8 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
         }
         if ( l4count > 2 * d->max_vcpus )
         {
+            d->arch.paging.shadow.unpinning_l3 = true;
+
             /* Unpin all the pinned l3 tables, and don't pin any more. */
             page_list_for_each_safe(sp, t, &d->arch.paging.shadow.pinned_shadows)
             {
@@ -967,7 +969,8 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
                     sh_unpin(d, page_to_mfn(sp));
             }
             d->arch.paging.shadow.opt_flags &= ~SHOPT_LINUX_L3_TOPLEVEL;
-            sh_reset_l3_up_pointers(v);
+
+            d->arch.paging.shadow.unpinning_l3 = false;
         }
     }
 #endif
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -497,11 +497,6 @@ void shadow_blow_tables(struct domain *d
  */
 int sh_remove_all_mappings(struct domain *d, mfn_t gmfn, gfn_t gfn);
 
-/* Reset the up-pointers of every L3 shadow to 0.
- * This is called when l3 shadows stop being pinnable, to clear out all
- * the list-head bits so the up-pointer field is properly inititalised. */
-void sh_reset_l3_up_pointers(struct vcpu *v);
-
 /******************************************************************************
  * Flags used in the return value of the shadow_set_lXe() functions...
  */
@@ -721,7 +716,7 @@ static inline void sh_unpin(struct domai
 {
     struct page_list_head tmp_list, *pin_list;
     struct page_info *sp, *next;
-    unsigned int i, head_type;
+    unsigned int i, head_type, sz;
 
     ASSERT(mfn_valid(smfn));
     sp = mfn_to_page(smfn);
@@ -733,20 +728,30 @@ static inline void sh_unpin(struct domai
         return;
     sp->u.sh.pinned = 0;
 
-    /* Cut the sub-list out of the list of pinned shadows,
-     * stitching it back into a list fragment of its own. */
+    sz = shadow_size(head_type);
+
+    /*
+     * Cut the sub-list out of the list of pinned shadows, stitching
+     * multi-page shadows back into a list fragment of their own.
+     */
     pin_list = &d->arch.paging.shadow.pinned_shadows;
     INIT_PAGE_LIST_HEAD(&tmp_list);
-    for ( i = 0; i < shadow_size(head_type); i++ )
+    for ( i = 0; i < sz; i++ )
     {
         ASSERT(sp->u.sh.type == head_type);
         ASSERT(!i || !sp->u.sh.head);
         next = page_list_next(sp, pin_list);
         page_list_del(sp, pin_list);
-        page_list_add_tail(sp, &tmp_list);
+        if ( sz > 1 )
+            page_list_add_tail(sp, &tmp_list);
+        else if ( head_type == SH_type_l3_64_shadow &&
+                  d->arch.paging.shadow.unpinning_l3 )
+            sp->up = 0;
         sp = next;
     }
-    sh_terminate_list(&tmp_list);
+
+    if ( sz > 1 )
+        sh_terminate_list(&tmp_list);
 
     sh_put_ref(d, smfn, 0);
 }


