Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540665F0A7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 16:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471984.732055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSeF-0008Mc-U9; Thu, 05 Jan 2023 15:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471984.732055; Thu, 05 Jan 2023 15:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSeF-0008K4-Qd; Thu, 05 Jan 2023 15:59:19 +0000
Received: by outflank-mailman (input) for mailman id 471984;
 Thu, 05 Jan 2023 15:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSeE-0008Jw-Fs
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 15:59:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2080.outbound.protection.outlook.com [40.107.14.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e853aee9-8d11-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 16:59:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:59:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:59:16 +0000
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
X-Inumbo-ID: e853aee9-8d11-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZcD+H4ve0PIG6pU2giq5aYtk29Z7Prsw7S1ywA9nwCa54jRSIr98DdPEDcZhd+Y/U+mpknJAv8xlTRpOTiTmyFvQjblbCq4eMXsPWRcwBCeEPVdvr9ctyv+2u1M5kyT+SMiy+e4SC0oBJ+xiaIK6RhfzMItOmPH8rUS44TGoWW5FhvPEyNQ9Vd5jdSDJxoSrsS0IrNiPddk0cM7d4d3wew4edjqt5gfO+D5C6pAbpJApBDLVy3Yv2hIHgJVxbd7orZNu08waJgiKeWC6X+7qMYLYfm6t4m3wDYKlWMoj83hGjZ4kF2gSNBULvHClufXjEOqYBYehQjPa+MY/FHnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmoM5XdZSCG0IQymIs8Nrrx2EaS6/cU5V9J6nOA40tQ=;
 b=mYZswt96NTqvno4IES7zeafWv+2a36rtHyT0gdowFdCT7R+sfR0HXaiGtmayWNzWC2fzBQvI2nMVMvppRP5xO1Zt8umLbzMRUelDL8hQeQnO+WLXqiHxeIWuBMed6j6qcHZBthL7GigNLU0/0vA+clu7JSIpRsXp7A2uZeOxidM1Qw1bwdgouGymAliDajcjybkY7f+OMtkiLSl4LNTFU00JITKahW9krFP3EIU0hG0bF6rUuBfJDDkqGg5P4qOZMe35d8vMER7ttZBftCMxrHIt0l7+xwHRQbBz8f5gPa6QdZUjSOvgS7suFxC1Zbzz1woRwPb40sAVV0ewYakLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmoM5XdZSCG0IQymIs8Nrrx2EaS6/cU5V9J6nOA40tQ=;
 b=NN5NO4raLPKWcWez2JHf3sHZRckIwTAjAZgObsXRrYxh3z6bGc+o+NssxGntOkm19X7GZ4yP71VUPlaLKbKqIzpA5zFscnBhdgyK5HiEW/K4dAxejU+93Ld3lrGlFxQ3BGujaM87iACgWFT2/wecreVWiGGDMGsEHScX57u+D3UmNR4whSU8zjAkw09PU8axIsCKWii8fwD/iyEFb1WnJSRZLYmlmcIbo+JboVe7xwYKQjQKITl8pl/SGE9B/dT4R8aRhnJce4a7GtfxFCwKnPF1Q5kqng6pGojWqq7WH6l6KF6e+77KQBNCYJidcMaciqzC5jD2DkVg2IGfl2vU9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03ae5a1a-4417-0aa0-27d8-833ade20cc0b@suse.com>
Date: Thu, 5 Jan 2023 16:59:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 01/11] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 59051f4a-e839-4c34-6f74-08daef35cbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FTEVlLgcfqoiXp5dVP/eLRCdy9nVrMuV9os0uKWjLO5FOBp2XqUsOlFFmM2ieAKGN1UApSgusgic7EWQrbRzT0/DoHcbXOlr0lpFvPKqqosfkffCR/IilozbVKHs/7qSUc9uPLQaJSBdL9tPvWKQhQ4IwwEFBlDMYWQAS0plE40qF708ZpVjT2dgeDK/bOFUICNq3mwrJvPXWz4H2cCiFQISiio2yQmtUYlLVjvmvRGbkTn60fn/UTzP02i67DrjjGSk3bLElsRNG9krdO/53jgxZXVuqxcrH7lkfIdQI+JZjw/E/HzyiU4SBXI53aPJDRElbIb6LMCfm7AM+HQPWS6hcJFBJf2GaIdT8E0aNZhd6auEGg2i6oQ2YtVTytSo6Ah+5qDPyLkbCfSVdAI4fzMDZ4cJzK9lHVadm6vIHRVFxIdmzDz+qtREWmDTHw/ul73W3InhDsSHkWM774SNzCM6gymzkxlOBnZpEXUH5JwwE9AZhEUC0wHHGFIPTxtqeBZrgSMqZ9GGf5HKGY9TVe1MtXZsx4Q8jY/XCFCTSMU2XeuDyzc4mFQewQiie769kycTzBpZtmBtn27jAmuM0jOZ69Sd+ButFz4X/mDvLTMD7AafL7qegpvmk7bZhK+rqG2YDnkdCvG8KMarXK6k/lvyb1vj7pnqzPG5fiexHDg8EP7oGllkE2eOkmsuNqCRznDVLBxSGrsQV4YrYUMNhqOgR+i5kPDYpb62TlOE5fI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(54906003)(186003)(26005)(31686004)(66476007)(66556008)(2616005)(6486002)(66946007)(6512007)(478600001)(83380400001)(8676002)(8936002)(5660300002)(41300700001)(4326008)(2906002)(316002)(31696002)(86362001)(38100700002)(6916009)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpwdnZZeERmT2l0OXhZR2tBWFplTDZ6TXRLbDlYN1FEK0FLVzdoa3BWV2tS?=
 =?utf-8?B?bUJhakRuZ1N3T2RVaDVIVXluWXJpVWVQNlh0Q2R2YURWbTIxM0JZeHo3MTFw?=
 =?utf-8?B?TFF3ekdzN255QjFISkFGQVo5NXd4SDFtZ0ZEdHExV21lcm9MeEIxREx3d2Nh?=
 =?utf-8?B?QmVhMk9WZ1EzOFlMRmoxQmVQdEpYdnloWkR2R2tXMFBNTGZMOHR5NkhnYjhu?=
 =?utf-8?B?cVVLaDFKVHJqNENuUkhpeXhtNUNTd0Jxb0ExdHhqR0RnUnZQTmxHS2l3UzAw?=
 =?utf-8?B?VEIyTjltcWJBMVRyc3daN2RLU3VNMktFTkEzV2tZQU5uK0s2QXh3WHhlazFS?=
 =?utf-8?B?Qzc2dVQwOGZqblk5UFYzVVhob0l1ak10TlVrMHA3c2V1Zm1rYk83TXlhTzU2?=
 =?utf-8?B?ZkxnRE56TXVaSlRQUW04UkpsTjZSYUNtR0RkR0JaSUp6YWlyU3E4MjBOaDl6?=
 =?utf-8?B?NkZpOTV2T2hDbGZQcUt4V0FyaWxJRjBScHpYN1pOc2NTZ0lzYlczWHZhMmNV?=
 =?utf-8?B?bVBQOTFDSXlwd3pBc0tEanFBYUxEWnBRaXBXb3ZhZlVGYlJlOEpOOVA1UVZM?=
 =?utf-8?B?SFpRUmhEQ3JTVFptZVFSL0hpaFRKNWN6M0dZUWp1b05leTVSb0ZZWTgwR3Mw?=
 =?utf-8?B?T1hPdlgwZCsxbjdxUGdzTk9Jckt2V2xMUXBFQStjZStwc2NrZnJVbjBvZDFr?=
 =?utf-8?B?YTltNUV6Uk9CdXZUYkFlVU16Vnl2dGtrK0VaMlJhcjhzd2JRNFZrZExadGZy?=
 =?utf-8?B?LzBvYlRLSlFRdTM4QUdXZ1c4UXEvQ0tlU2szb1EwNTg3a25zVnNJeEd6Q29F?=
 =?utf-8?B?VndiTWpsQmtpTjQvQXJpdE9GV05ELytEMXBsZG9tNkFoYWdUN1RId1NLZlVD?=
 =?utf-8?B?YURJVjMxQ0ZhbnVyNnJPMXlFd0dJN2YraHBjSlNjOFBEWklmdzNBOUhaeXNB?=
 =?utf-8?B?N2M1RnNRU3NWblVHNnpOc25LdkhCVTJraWYrOTV3T01tNHVDdjhHbVlTb0Zs?=
 =?utf-8?B?dmpKam5UdGNFOG1JMHl5MzJ1RE04M1pQb3NQWm1kQ3pSdmdiVjFMcGVFREZE?=
 =?utf-8?B?SzNzczE5M3NlM3lZcGFIYldZd1ZPSUQ3Z0tXWGZzRmlpSmlheXJKTDNxWTNI?=
 =?utf-8?B?RU9nbzY1dUNjYTNuMG5Uc2JSNlZBVjRiV3V5cTlBQmJQUUMrQWZxaUNpbkFm?=
 =?utf-8?B?cFZ3NmtTbzN1ek84SlB4aStJbVlWVDZZYmdNU0NtZ3V5dmh2UkgrOXdyVE9N?=
 =?utf-8?B?VXRta2k1N1NJd2lJLzJ3bjF5TXVMU2pVLy9tZk9LRUFJR3JBYVd1U2dQSUFY?=
 =?utf-8?B?QWFBYmdueFRuTTRNTlF0UG55U0haVy9Sc1VlclpLTTNyUXF6cWIxZTZhdG9w?=
 =?utf-8?B?VWhOS1l0L3YxRnRjdWI5Q3ZackpucGJXT01Pb0NCWTdJTW5VdndPZU5PdEJq?=
 =?utf-8?B?L252cGw1VHNqcnF1Nm41RktwREsrNVN2QUFtVXJ4RWUrWFd6clVuMHNjeU9G?=
 =?utf-8?B?ZStZc0pSWVRYZ2dkaklwTUtoQ0VaY213TEplNGxjeWJicmFlVURHTHZRL2lN?=
 =?utf-8?B?Tms4VWZvOXlOM0J2dHVCOXFWVlNtdUN0TjkzdkxnUG1GTWZkK3VGS3RqWm1p?=
 =?utf-8?B?Z2F4Q1hucUs1OTgvUE01M2dZR2x5bEZPVUV6Mm1LZThWMkQ5eSt4WmhxeWhx?=
 =?utf-8?B?elQzOFdEWTZtdTgzZHRicGdZdGF0Vk4rVkFITU93TEtQQ1RXQWY0WmdLQXFH?=
 =?utf-8?B?TXlmV3FnTGJIWXpLTEw3NjN2U1FKMDJxUGUyMXJsNFc0Q3c4dDA0MkxoZ2ZN?=
 =?utf-8?B?UVhhKzBwcmlTbmVHRzhXODNncUhJL1BKWmE1bm54MmFyNmFpY3RaLyt0aXhE?=
 =?utf-8?B?ZTVnVnpDM0xienk2cUhCOTE5KzVnbnowM2ozc29Lbno2VWd2QmpqUUYzVjhv?=
 =?utf-8?B?SDFSRThNUHNtNVJ0SWJkdlpETWZTbnR6N0dpUGZDSFJuMWsvcnpMbXpXSU1M?=
 =?utf-8?B?MVhvUjJkWUcwdzJMdEwxWHNvbTJhMDhYMnNkOStZb29rMjA1cjFSNzVZZ05x?=
 =?utf-8?B?UXdpZ0M5cDFOMFZjb1FtYXUyeGc4djFRc3dzWlBiTXo2VldOTUNzNlQ5ZEJz?=
 =?utf-8?Q?KAVpB169ko7DFsCQsxcY6mKqf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59051f4a-e839-4c34-6f74-08daef35cbcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:59:15.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/gj38l7AgNF5OFPO0/fRcXrJBCzrlW2XRt8HgGw71aRQk16bZVvetdPzXIEdBp/GzPmfCu+TwqO5d3u/HwuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

Rather than doing a separate hash walk (and then even using the vCPU
variant, which is to go away), do the up-pointer-clearing right in
sh_unpin(), as an alternative to the (now further limited) enlisting on
a "free floating" list fragment. This utilizes the fact that such list
fragments are traversed only for multi-page shadows (in shadow_free()).
Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
in use in the common case (it actually does anything only for BIGMEM
configurations).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -2306,29 +2306,6 @@ void shadow_prepare_page_type_change(str
 
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
@@ -722,7 +717,7 @@ static inline void sh_unpin(struct domai
 {
     struct page_list_head tmp_list, *pin_list;
     struct page_info *sp, *next;
-    unsigned int i, head_type;
+    unsigned int i, head_type, sz;
 
     ASSERT(mfn_valid(smfn));
     sp = mfn_to_page(smfn);
@@ -734,20 +729,30 @@ static inline void sh_unpin(struct domai
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


