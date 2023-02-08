Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAE68F0F1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491838.761162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlZn-000630-Nu; Wed, 08 Feb 2023 14:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491838.761162; Wed, 08 Feb 2023 14:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlZn-00060x-Ji; Wed, 08 Feb 2023 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 491838;
 Wed, 08 Feb 2023 14:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlZl-0005uV-Of
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:37:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2608dd-a7be-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 15:37:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 8 Feb
 2023 14:37:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:37:31 +0000
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
X-Inumbo-ID: 1f2608dd-a7be-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrS+vnlzccE9IWsvsXtED7UZwF7WWkjI5pRMEQXWyKxx1gHcnbsCQOtV2OHnricjn8gPJKDHqILaaPDW5QW2MoUXbHWpmBP4dbm2UGejKxxMbPDnQdBfibEaYaVcOS9uMojyb2yG/RNQMvNs+u1Oepy3yYalYi8JB1RkYS1sdlfJOLIHHm9mMlCcP/63NFwWHvzLfg8y27pab8nS0FOHMbowjJcbnGqvlhEUXQiWSBaVvQzEBImL1toXQ8MgE/UO5Btd49gjOr5ND6Y62POj8mN/Ah15fe44RNmvqJg3XEgOIoAAqtEf9ezHcff72F4feqGSPawHfuHgKWAtMl4Ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OFFDeWa7q1c8WhKPz1ZFmBqxkr1kVm4Ujr2h18c0yg=;
 b=b1ADAVqAiEVqKArrvPwGoM0wtrdsi/LqpGViZxC0sox5A8B8vVbMb1tE3bRzCJGW+g8vY3lo4Rr5EEVS8AEtQfVduDEWMfX/nII4d6xXVnegI0AdkhpnPW9f97MOhYsLAzkv2EpokDIyab2ia24vaIkSMTk1DBYYlekGgRgWcoJ7kfCHZi6D8g8PLwYLM05ab3aTXzJCx1HYXZXMxqvCkmBi0laAKDoxA6E7qyrDFvjzxpRB+De5JjqOgMjfRu1iit9zDCxCM+Tzs6ZR+aohi26XaiUqk6+b9dhqZRc4WjGKJddbKw33oHBgQarV65fHgX3j9H6jMCgfX0BcyOFluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OFFDeWa7q1c8WhKPz1ZFmBqxkr1kVm4Ujr2h18c0yg=;
 b=iZkyHsFQYtKxTQYYWsIS7pvq2sBKeIryr9u55glMvGbT5tPPQQ2RsbxpIkF4ELTkEeGP7gQWzePkFrX/VC8/7n5BcmXhCR+OrpqwevkJqmBYn+00tUxzYJdFmXjjD2BNrZpMfS4CtxKnpgnN+CR3CspN6dJxDOF7aioCp0HJrbCjH3uCgmaj9X9Dn5qEiCxTqvnCPboIHfbW/5Jm0Fc9mMoXlviIzGeQcyceV//uy1pjksni/UNTezjq9Ov0HsWbAIdwEe6qzzhCgRs0cu/aHcjlz5HcPV12QrYnYCe6S32ird2q0AbT0WT0dyddMXWBC+ND810uRnu9Va7LgucTvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55114c08-6407-db9c-a25c-06fa7bbfd4e8@suse.com>
Date: Wed, 8 Feb 2023 15:37:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v3 1/4] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
In-Reply-To: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: a9050c5a-b306-4410-92c0-08db09e1f6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shjkBeSBCdIULCxKfU1Km7pTB2b7uFYVwdbUu3Gln0LhyDGNB1+nQpELTiiHc0YeJJnvoczil663ew1qHtHrZ59jyBloFM5LqFCzvqzCFrgOgUhZPa7ecmt75M7sVw8gjam5GTI2topyJAiLBxI/rYCBIeogtvCtOHBHdXI+iVrO/3RPSImYXoSqtueBIXXM8wx9Qc+xdiCSg3EYhaq/wvxOQgED09wHZyGkVZAXwEL5OjcQfBh1m+98X9Gg45NxoNqgplHy5x3B1oYXNEHOO3vID+uYYqtKEUYqvLhL8C5lsXDD9A+siZIi1N5tbEVS3Br5+ry2gURxDg2WJjX/HKKt+WLtybElgpCtysjnA8JrXG3MRgxei/GGf1zhGCb3E7p5khjE2hToj+kYGhL7Na9ZCi+8gxNDfAnj477ru5mlo+8LAqwRewA3OcK1ZJyVYlg6FvMhmR0nrDjb0PLCmAmcH0vRjbpKQ0vrmH4gEuKn+UkfkLr96wML4vTZr11ljHBRg1qmr/rgT/lgV5TIDvveKwffg5GiC0yc+67I28b0dFTPUtL11JxFK61ky/5n4fZuUBl4nI4ssHeFdCMjzn3rys/WMDvypB6GEcNhUZWiMdtybhyA0DgZRyUDscfT94mvwR1derPyTzQq+wPPOxbEDZikVKYDGo8rAwpRwtVs/4FEO5KOptKnkU+13Ns4pXpDdH0ktfg9iEyyOnhyAwnEBe7h6XYzNG6zFww25Ro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(83380400001)(6486002)(36756003)(5660300002)(2906002)(26005)(186003)(31696002)(478600001)(6506007)(6512007)(6666004)(41300700001)(54906003)(86362001)(38100700002)(2616005)(316002)(66946007)(4326008)(6916009)(66556008)(8676002)(8936002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9MUk5yYzZFalB5U3pra2hybjFuWldIY3NURFY5MkNJOW5sRmxnQ3JyS2lZ?=
 =?utf-8?B?TGhySjNsZDRhNTFucjRPWXlZRmIyRDlBc05GakpvOHQ3NmVrQ2lMZng5WmlJ?=
 =?utf-8?B?V0I4SEk3dzhHS1FvMGpYZVBhOUtDc0JoOXVUSTVkMXZPS3NibEorTDBlQUVO?=
 =?utf-8?B?QU1kSzRnLy9nWkRvMTkwV09XSWNROXBHbC9HeHowSlE2VURLdC9xUHAzeUJ4?=
 =?utf-8?B?WHFKQzNrUFZQbnlVQ29FS3JtdWJWWHFvWmhUbjZSalhucnU1eFR2ZDVCa1lr?=
 =?utf-8?B?NGJ5KytVb1M3RWlaa2p6MEw2MnZqT2hTSVg2NG5NNmtvMDlhbzJXK0xZL2pm?=
 =?utf-8?B?endvZENzQmtPdlhTeWVBNllwRzlJOEZQWHZnUDdPaExwc3ZCemZEdmNKbWY4?=
 =?utf-8?B?bENpUXQ2dGJQOVdjWFYzaWFhaDZvalBkWjFWVU55OTdiRy9iVndjMmc2a0tC?=
 =?utf-8?B?elkvZUo4c3Z4WUFsLzQyeWhTbXM2QzlGc3htWW54K1JRcDdiK2tXOGdYVUdI?=
 =?utf-8?B?amRwRXFka21RWWhsVHhNeVR0L2pXVk5lWnRoRmZQNndUOU1RTXg1Y0VGd3lj?=
 =?utf-8?B?VGVDZ0hrdkh4b0YvemJpVE1iQ1gzOWJUMGNvTksrdmRTdVo2OW53YmhUNGtt?=
 =?utf-8?B?OGF1OE5kK2VRZHMyckZUU1FQMFZ4MUtsazFHR1BEQmpXcElFLzhubUxGTGJB?=
 =?utf-8?B?TFUzaitSQWF3REIzN2RIak9rSUhoUSsvMFd4YUZXVWN1Z3Z5TkxxUytrci9q?=
 =?utf-8?B?QmFPMldqck9KZWVoSnAzT1BGRkM4TkZObXpKQVFUZ2Nqc3FnTXFPVS83RW1y?=
 =?utf-8?B?K0NnWis0T3BXZzFRakhmdnVRYmtMUjh4c0p4alEwdUdTaXZ4L3ZUa2tnYkQ1?=
 =?utf-8?B?aWFpWEZKQ3Rzc1FZWDFCUXJNVTR2bFlQU2UvbHFjU2pia0tmSTFpSmpOY3RO?=
 =?utf-8?B?VkIrdnNwaksvblRRT2F5ZjhralgwN0VXNVBiVUxxbjZKazhGU3Z5ZXFnREMy?=
 =?utf-8?B?Wmttem1uNTZ2S3VXaTZKbXpRbmkvRDVFZ2krYTIxbGl3QU9Id2lNb3FHeUtK?=
 =?utf-8?B?eDZDVWIwajg5bUZjSHZ6Tm9DWDJ0YVg3eFlhamNJcldERWI0RHNkVW5hYnZR?=
 =?utf-8?B?c2pIc09hNjlOUDlBZVBqQms5SVR0YlFVRU5SL0dNeGYxSzlYM0ptNzN0Mjkv?=
 =?utf-8?B?LzZPaEFCc1VXekhvS1BCRnZNcHFXYjhqYU9oaHZtdi9SdFg4ZE1iaUROYU1u?=
 =?utf-8?B?S3VDdC9uK094QlhwZklrcExRRkNxUXI0bGFaeDBIOVU4ajFYa2NMTEw1eWgw?=
 =?utf-8?B?Q3Z0cE11ZVFlZmREN2JtczltNFUyT3ZFRTZGYXJsNXdza3ZBNXJMbDhQMTJ1?=
 =?utf-8?B?aDIva1kzdWJ0MUQvOXBtZVB4Tm9lMStqS2tRaThlZUl3V3VzMnJjVllDMU5U?=
 =?utf-8?B?M3hiYlZiVW92ZzVxYlFZdUtRNnk1cTVaTFNnYnlTTjdxeEs1WG11NU1JUG9W?=
 =?utf-8?B?bkl6dXh4K21SeG1ZZWhIam8vZHN0d1ZkNmpuQmZaTmxHWjRNMlBMNmZlNDlJ?=
 =?utf-8?B?UW80dDd3Y2dRZGkzY1FjSHp5Q3FueERUb0xva2NSR2NvRUNYV0Q0dENiR05L?=
 =?utf-8?B?OVNqRnRaVWdPSjlSSUpZT1J6Q0ZobFJmZHF3Z2tHUnF2L3kvZ00vSnltMmlT?=
 =?utf-8?B?bzQvTmRUaGdOZnkvY0NJa1E5Zkcwb2RHMVV6K1RXdUo0cVFORHpxT3IydndS?=
 =?utf-8?B?Rm5YbVhLWVY0K3Y5Z1VGVjVNdHFrTFhUN2xTZmpsNlYxUkUzRk80NDYrYi9S?=
 =?utf-8?B?ZDU1bGZaVVNjTWVaRDAwcXhISjgrWVJKZ3luL3NkZmNDbVh5UWRBR1hkMFhI?=
 =?utf-8?B?VDB0ak9HUmRiOUlZYzFqTk5CZlVDRHAxZWREMkR1d1FvUzc1dmc0aENTcEhT?=
 =?utf-8?B?bEpCc2pGM1lESGdTRGxVc21KVzMxaUl4bmtXVTduT0J3a2ZOVERTaUhzWnJq?=
 =?utf-8?B?VGJpUnFpdkYrN0tuQUc2dWs4TTFScEpwYVVMelIyekViZnlpVlV4U3RTR0hV?=
 =?utf-8?B?c0R2Snk5KzNoUHBZb3BnWml6Zzh5WXBoTmRkQU9hMEdXUUxJVjRMR1pCd0Jw?=
 =?utf-8?Q?dbA63uEnTuOhMOJdZ7Q/9Ok/+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9050c5a-b306-4410-92c0-08db09e1f6e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:37:11.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izx8F0g51C9a/q4kyhVLL3i31CPqGxejAfvMefCe4XRtcgh9fQ0a7ISF9yFi6t7/CgDJ7OFk0dXxQTZ223qmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343

Rather than doing a separate hash walk (and then even using the vCPU
variant, which is to go away), do the up-pointer-clearing right in
sh_unpin(), as an alternative to the (now further limited) enlisting on
a "free floating" list fragment. This utilizes the fact that such list
fragments are traversed only for multi-page shadows (in shadow_free()
and sh_next_page()). Furthermore sh_terminate_list() is a safe guard
only anyway, which isn't in use in the common case (it actually does
something only for BIGMEM configurations).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Clear sp->up uniformly for all L3/64 shadows.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2371,29 +2371,6 @@ static void sh_detach_old_tables(struct
 
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
@@ -971,7 +971,6 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
                     sh_unpin(d, page_to_mfn(sp));
             }
             d->arch.paging.shadow.opt_flags &= ~SHOPT_LINUX_L3_TOPLEVEL;
-            sh_reset_l3_up_pointers(v);
         }
     }
 #endif
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -505,11 +505,6 @@ void shadow_blow_tables(struct domain *d
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
@@ -729,7 +724,7 @@ static inline void sh_unpin(struct domai
 {
     struct page_list_head tmp_list, *pin_list;
     struct page_info *sp, *next;
-    unsigned int i, head_type;
+    unsigned int i, head_type, sz;
 
     ASSERT(mfn_valid(smfn));
     sp = mfn_to_page(smfn);
@@ -741,20 +736,29 @@ static inline void sh_unpin(struct domai
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
+        else if ( head_type == SH_type_l3_64_shadow )
+            sp->up = 0;
         sp = next;
     }
-    sh_terminate_list(&tmp_list);
+
+    if ( sz > 1 )
+        sh_terminate_list(&tmp_list);
 
     sh_put_ref(d, smfn, 0);
 }


