Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34E6C4684
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513236.793965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peurZ-0001IM-7j; Wed, 22 Mar 2023 09:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513236.793965; Wed, 22 Mar 2023 09:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peurZ-0001GZ-4M; Wed, 22 Mar 2023 09:34:33 +0000
Received: by outflank-mailman (input) for mailman id 513236;
 Wed, 22 Mar 2023 09:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peurX-0001G9-4Z
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:34:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdef27e1-c894-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:34:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:34:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:34:26 +0000
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
X-Inumbo-ID: bdef27e1-c894-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB1rdSMjRWbfJ9Tq4KcEdHNxG1vJdaUwKNfmSWU6lgTMjpm728RUY508VUrkdCyjYVqCPbFP8U8Jp0DWtX6CSXmje5gBpQHuakJiTlfQZhC9rl+TS/IxCYS9rPmJjcMScMbj8VzYmsEHdQK3dc+W+pK8T9oDn1oPe/BqjTN3fcbg+saSSihqabpsoqUZCUv8gSWUwfNkVb3aTEdF1D1ucB+dAFVrOphdGD6vSrPzO7kFV++JTnsgCVsqJstcBndZMOGd4VPoE4unPRtMQezuiUIJAwZ0ONa6YtchU1BamHxpOBGShp5oaoOeSnflceUzDU4iBj2ML3WwYLbX3x2qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOioC5uNa4Km0yn/dxAqSgbeWC2euhJVdbHwfnx0gMM=;
 b=Zsd/CuAtsBvgn6y/Ol8A/aeKQHFxDYVHJux7eU7Cp46XWa7re9w4jzhfbV2moNGy47bLf1Lko8M0KrWKgiou/oNCJ6l1znBICqDOzqvINfEcKMVSTku5E8ARhQQdgXHQNOnJxHXbOxNcQRCFcLUfHViSeN3hHRJIQ9pU2Wpj6bexesu0eWFbs7/py5dS2oPDZZZLwDSMhMEbu6757JMNSawGARBF/RW2mZAgdmj8517Fk8rWoT1OxLg65DR5TNXQWe3GKIUMdNS1r1zWXhgJfSf8wRCQqwiipOz57vByZbBJt3Q+5glsezddezHJfTBOuMwb+ztZMQ7paQPfZi+Z0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOioC5uNa4Km0yn/dxAqSgbeWC2euhJVdbHwfnx0gMM=;
 b=KS09LREAg/US/eJ2Xkraqho0yoopHbOWoNfjTaYiB/ro4tT5biSDSaZJGA+tir7SP0hIn57CwKfr7KW9dMz33sLFMzJtk/ntwbhlpsFr1pPbaQmC15bd0RtPXdEtRTNHD0/rf7eDqKgNi8g4vdYJdBZGGL8nHmybUmZrWJSJIKBABtyI6jFH+V13H3uIIpPwex7VdOBWmDWLBFn0AQ0QagjH8Ft1cHF0HekQp+MMfiDiUBgQKNdI7CPoN9ULqwSceeL22hvZ55ROSw+I8meCth0jZ9Uusjcd/2NynF1kEVG6ET5wUU+c1eOtjyUQaohbUiULzaLF8nRZpfoQbVu7eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a794e6dc-d73a-e6fa-2d32-ad46b22f8483@suse.com>
Date: Wed, 22 Mar 2023 10:34:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 08/16] x86/shadow: use lighter weight mode checks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f5857f-b202-43c0-040b-08db2ab8a0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPDLJYrIFi+yc21pV/95KYr55J9Q1Ei1HLJHq6qAirhsDhWOkhtcAqqVHufjIFcQ19oXlbitvLE70tkn5R0G5jwrdPHypNwLT57VMb53nhS3W9LS7IT7Y3Wk6Kxp2d8U1QBmvRYU7IbhQ5q+jrot9fcBWmUMVL7tp0MOMOxcVYm63o98UHaReZI49uIWuCF8HVhGY02B5gO9B1nGw8BzzkObJ6jyCrxhtYuPjhwBIuSKHPRkQZCBsNt0BfXklpgy+/lqKGB4IYAENJNlAlWZS04xKW7n69D6UvNS2MnXFxpKeL5mM/cI/EHy2pnPiXratDzqc2C0Fg5yi/7yRRzEm7YLLcf1X/TSZ96lGVA9FmSW+uZWwnlu93mS6odeltWdSEvCpG0yUc//diV2sxDuYApGCt/WzUXA69XROhESmLIh9/wV6q8xlYLjGsrK3MsPEPv6crFx7l5Ta3LId6JRPTk93f7GnKI4/7BVIWYpfYeEKgf/nzrlJGbq8ALlSj5XhSNAuMp4Q9eS/u+vEtsxgMVTBHC/IPu6lUkveAyNG1hu9waf5l+ui0TYPBGlTZMtcgRNKLvWthfJtd04j0dkW9dQcY4dpgDMJgOOe0poqSt23/x5m0+UgaHsO+pWmVaUP69CHpPKyNWA9/33Hcj9ZU2mEafyHZqDzSmsq1dwazqADMuqb9AGwZ3IkmeR9ozyTeZlJ1605hsXXxkkTfy+3juyMVQu7zYnhmjOYW7eppd5GJJPCkUNNA5uu3+3tVGrHsNmdd6y+6lsi6Im6OKI1cDX+jx1EtUvYACS8trzE/l560R9Xjvs8h3T+kaabJqTRSyGzAfDSPVYlgQQOdNidQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(66899018)(5660300002)(8936002)(41300700001)(2906002)(16393002)(45980500001)(43740500002)(473944003)(414714003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0FjM2g1NzAyNkhCSHkvWE1Fa211M1c2N0p3MFIycW45M3FrbmlGUjlnQ0Ja?=
 =?utf-8?B?N3l3ZkRJajV3T2Q4SEhRaDg2N1g2TktOdHh5UTVpNHQ0TVhTbWVpUTJxT1Jv?=
 =?utf-8?B?UXR6Q0lLclVOSzQvT3BZVFpLSitPRjVmQ0JreEVkOWNEWkRpQVY4Z3NkaGJZ?=
 =?utf-8?B?b0IyekdNU0tUemJXNFIyNDVaKzJ4bGt5bmlJcEt2bEcraFM1TDdXalY1MnIr?=
 =?utf-8?B?cFRvWUQ0ejdiTll2SmRndzJwYnRncXFnWG82YjRoeWV5T3UvdEN4OVFZVng5?=
 =?utf-8?B?TUg0Q01jTWw2a3NteWRYUTdsOE8wZk00VUJSbnJqVVk2c3JpZjQyT09tOTUw?=
 =?utf-8?B?YkJqT3FjTEtiTXUwZFY3eTJ2YWI1SmJrM2RFTlRHeXFsR29EWnNjZlhEM0tv?=
 =?utf-8?B?ZWtORVFIUzBWS1dMOFRNM2NZdzZ0VnBJQWNQTkdiNTFBY1M4V3lRdG9pWUwx?=
 =?utf-8?B?TTg1Z21RcGlOMHovVVNTbzlyQU9Kbm14WEYyV0hOZEJjNEwrQ2huY0FQZGpC?=
 =?utf-8?B?WDZZQkI5MmVtUHpDV3NnajA5alZTb2pwMnJiWkZoUjNKT2xJNys3bU45TXND?=
 =?utf-8?B?eDZiRGZCaUJhM1U5bW04WWZBOUJtcit1bjFtQ011WXQvWVJtUWE0aytKQTBI?=
 =?utf-8?B?RXcvRFFVWmswY29BL1o2amE1V01iaHBwM0gxT3JubDN5dmZkMG1pS2NlZFZG?=
 =?utf-8?B?blo2MkpYVWpnOGRKb2YxcVRLWjB3U1dKdVpNZU5NQ3lXT1VEY3hURUd0SUds?=
 =?utf-8?B?SjU3QjBiSUFLdm9JT1RtUzZTMDVtY0JReGZmWTQ1Q2d3NVBBaTZKYnNsaWFT?=
 =?utf-8?B?NXkzQ3hvSWVFbkRLUHdxVG5CeHhlZ2dsR3R4dDJ3NTh3SFQxK09ORGRGOVFO?=
 =?utf-8?B?V2syTnFOTXMxUGpUWEorWno2QmJnZ0ZjdWdIckdtZTIvSFJvRnE5NTNrSDJj?=
 =?utf-8?B?dWFVU1FjcElBcEI3SktQK2pVMFlSRnZoUjJycUNsVjE1R1E1TW5xckFEcFgv?=
 =?utf-8?B?bjBBaFZ5Njl2VzZPQVlFdE9RQ0xEc3h1a3JnN3BLREJ0Y0NPMDBPd0NOT2pL?=
 =?utf-8?B?c1hYeUxVeENNTjRqL1pTMHp1SjhQaitDdDJtWThhdG9HdFJ4RWxUMksvZnZh?=
 =?utf-8?B?WGNaeUZjbURQWU42UWM5TGtPNUtpdGRqN1lSVXdjMWNMVDFoL3pjRjkxM0VL?=
 =?utf-8?B?N29Wb2FtK083M2FCZXowWllQL2cwcDBkbmJtbFlnMjdKUzBVRUg3Rk13bjZX?=
 =?utf-8?B?V2hMNTFOWFRvdDJqRk01OCtvYWNLOUVnMmU0NTlPa1dZS0JveUFZaDVDa2hv?=
 =?utf-8?B?T1gzNkxobEFwaGFGSURraWZCOWMwM2FtczREbFlRcjRMSUdqcFptRXhuME1a?=
 =?utf-8?B?d0JqYUpOZkN2UGxLWkp0M2NnR1Q3dnNtaWNWeWdoQWM5VFFBTjV2T1Z1ekh1?=
 =?utf-8?B?eHorM0NwZmJMZEpPbVJtbEUzRXRHTkxNYms4NDdoc05nUzdiUGVGb0xlY2ZI?=
 =?utf-8?B?eml4VWNGTDFUaTNkMDFoWmFXZnFtcjhCeEpaUFExL09mTDB0anU1S2FJSmov?=
 =?utf-8?B?YXBrUHArSlNydmdlUG15MFc4bzNLTFRKQTc5ZUV3NWNOeG1mSVZrMXZZaTRx?=
 =?utf-8?B?K3ZTZzlYUlN4QURKTjJRdHVKWU14dm5YUVdxaHduQm9Db0ZMOWlmR3Uya0hI?=
 =?utf-8?B?djNUbXV2eUZGSmpXS2J0dGxjN2tVZG1vcG9pRzNJKzVvQTA3aGQ4Q1haeHJJ?=
 =?utf-8?B?YXM4WENiNWd3WW5RK21JMXNCYUFsZWY4Sm5FQ2pPU3htUzl5bVFzTE03RnlH?=
 =?utf-8?B?NkdWWTAzOVcwMTIrbzcydE53ODh6WHl4V2hzMC83c21WaTBwd0dQMDQxR29v?=
 =?utf-8?B?T1pCQVJkdC9wQTFwQVc5ZFBiMG1wRzZTelNjUDVobmpiT3lmZjArNmNZL0Q1?=
 =?utf-8?B?cWFUYlBrOU1EMU9FNCtzakhaSnFwU2RjY0dYZUNXbTJHdU01cjJsK1A5T1Nl?=
 =?utf-8?B?Y0QyTlBIbXpZQ205VWNvRDdTcnFyWkR5UTJpQzdReEVnSDlkckM5ZnBNNWN2?=
 =?utf-8?B?UUxGQ2xSUHhuNEo4dyswbTBraDBaVjNxZFFXQVpzcVlLRkxjbEdqM2ZSbDJR?=
 =?utf-8?Q?DD3Df9S1JiGHlTgt7k+wQAsqK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f5857f-b202-43c0-040b-08db2ab8a0f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:34:26.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ni0IRATFXo1A6wYlmSojoQHMrDbHvBD/N0FVXG7crMBWNhnsFArzB45Jo8Xr7nGBdOu/rYPAEZ7fUZKUnXj/7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

shadow_mode_...(), with the exception of shadow_mode_enabled(), are
shorthands for shadow_mode_enabled() && paging_mode_...(). While
potentially useful outside of shadow-internal functions, when we already
know that we're dealing with a domain in shadow mode, the "paging"
checks are sufficient and cheaper. While the "shadow" ones commonly
translate to a MOV/AND/CMP/Jcc sequence, the "paging" ones typically
resolve to just TEST+Jcc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1858,7 +1858,7 @@ int sh_remove_write_access(struct domain
      * In guest refcounting, we trust Xen to already be restricting
      * all the writes to the guest page tables, so we do not need to
      * do more. */
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return 0;
 
     /* Early exit if it's already a pagetable, or otherwise not writeable */
@@ -2090,7 +2090,7 @@ int sh_remove_all_mappings(struct domain
          *   guest pages with an extra reference taken by
          *   prepare_ring_for_helper().
          */
-        if ( !(shadow_mode_external(d)
+        if ( !(paging_mode_external(d)
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
@@ -2387,8 +2387,8 @@ static void sh_update_paging_modes(struc
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
-        ASSERT(shadow_mode_translate(d));
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_translate(d));
+        ASSERT(paging_mode_external(d));
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
         /* Need to resync all our pages now, because if a page goes out
@@ -2775,7 +2775,7 @@ void shadow_vcpu_teardown(struct vcpu *v
 
     sh_detach_old_tables(v);
 #ifdef CONFIG_HVM
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -526,7 +526,7 @@ _sh_propagate(struct vcpu *v,
                || (level == 1
                    && page_get_owner(mfn_to_page(target_mfn)) == dom_io);
     if ( mmio_mfn
-         && !(level == 1 && (!shadow_mode_refcounts(d)
+         && !(level == 1 && (!paging_mode_refcounts(d)
                              || p2mt == p2m_mmio_direct)) )
     {
         ASSERT((ft == ft_prefetch));
@@ -543,7 +543,7 @@ _sh_propagate(struct vcpu *v,
                        _PAGE_RW | _PAGE_PRESENT);
     if ( guest_nx_enabled(v) )
         pass_thru_flags |= _PAGE_NX_BIT;
-    if ( level == 1 && !shadow_mode_refcounts(d) && mmio_mfn )
+    if ( level == 1 && !paging_mode_refcounts(d) && mmio_mfn )
         pass_thru_flags |= PAGE_CACHE_ATTRS;
     sflags = gflags & pass_thru_flags;
 
@@ -663,7 +663,7 @@ _sh_propagate(struct vcpu *v,
      * (We handle log-dirty entirely inside the shadow code, without using the
      * p2m_ram_logdirty p2m type: only HAP uses that.)
      */
-    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) && !mmio_mfn )
+    if ( level == 1 && unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
     {
         if ( ft & FETCH_TYPE_WRITE )
             paging_mark_dirty(d, target_mfn);
@@ -819,7 +819,7 @@ do {
 #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)     \
 do {                                                                      \
     int _i, _j;                                                           \
-    ASSERT(shadow_mode_external(_dom));                                   \
+    ASSERT(paging_mode_external(_dom));                                   \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_32_shadow);      \
     for ( _j = 0; _j < 4; _j++ )                                          \
     {                                                                     \
@@ -845,7 +845,7 @@ do {
 do {                                                                       \
     int _i;                                                                \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                        \
-    ASSERT(shadow_mode_external(_dom));                                    \
+    ASSERT(paging_mode_external(_dom));                                    \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_pae_shadow);      \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                 \
     {                                                                      \
@@ -866,7 +866,7 @@ do {
     unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
-    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external */ &&    \
+    if ( is_pv_32bit_domain(_dom) /* implies !paging_mode_external */ &&    \
          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
         _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
     for ( _i = 0; _i < _end; ++_i )                                         \
@@ -908,7 +908,7 @@ do {
 #define SHADOW_FOREACH_L4E(_sl4mfn, _sl4e, _gl4p, _done, _dom, _code)   \
 do {                                                                    \
     shadow_l4e_t *_sp = map_domain_page((_sl4mfn));                     \
-    int _xen = !shadow_mode_external(_dom);                             \
+    int _xen = !paging_mode_external(_dom);                             \
     int _i;                                                             \
     ASSERT(mfn_to_page(_sl4mfn)->u.sh.type == SH_type_l4_64_shadow);\
     for ( _i = 0; _i < SHADOW_L4_PAGETABLE_ENTRIES; _i++ )              \
@@ -977,7 +977,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
 #endif
 
     // Create the Xen mappings...
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         switch (shadow_type)
         {
@@ -1379,7 +1379,7 @@ void sh_destroy_l1_shadow(struct domain
         shadow_demote(d, gmfn, t);
     }
 
-    if ( shadow_mode_refcounts(d) )
+    if ( paging_mode_refcounts(d) )
     {
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
@@ -1476,7 +1476,7 @@ static int cf_check validate_gl4e(
     l4e_propagate_from_guest(v, new_gl4e, sl3mfn, &new_sl4e, ft_prefetch);
 
     // check for updates to xen reserved slots
-    if ( !shadow_mode_external(d) )
+    if ( !paging_mode_external(d) )
     {
         int shadow_index = (((unsigned long)sl4p & ~PAGE_MASK) /
                             sizeof(shadow_l4e_t));
@@ -2399,7 +2399,7 @@ static int cf_check sh_page_fault(
     gfn = guest_walk_to_gfn(&gw);
     gmfn = get_gfn(d, gfn, &p2mt);
 
-    if ( shadow_mode_refcounts(d) &&
+    if ( paging_mode_refcounts(d) &&
          ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
           (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
     {
@@ -2623,7 +2623,7 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 
  emulate:
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         goto not_a_shadow_fault;
 
 #ifdef CONFIG_HVM
@@ -3067,7 +3067,7 @@ sh_update_linear_entries(struct vcpu *v)
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
-    if ( !shadow_mode_external(d) ||
+    if ( !paging_mode_external(d) ||
          pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
         return;
 
@@ -3216,7 +3216,7 @@ static void cf_check sh_update_cr3(struc
     /* Double-check that the HVM code has sent us a sane guest_table */
     if ( is_hvm_domain(d) )
     {
-        ASSERT(shadow_mode_external(d));
+        ASSERT(paging_mode_external(d));
         if ( hvm_paging_enabled(v) )
             ASSERT(pagetable_get_pfn(v->arch.guest_table));
         else
@@ -3241,7 +3241,7 @@ static void cf_check sh_update_cr3(struc
      * table.  We cache the current state of that table and shadow that,
      * until the next CR3 write makes us refresh our cache.
      */
-    ASSERT(shadow_mode_external(d));
+    ASSERT(paging_mode_external(d));
 
     /*
      * Find where in the page the l3 table is, but ignore the low 2 bits of
@@ -3272,7 +3272,7 @@ static void cf_check sh_update_cr3(struc
         ASSERT(d->is_dying || d->is_shutting_down);
         return;
     }
-    if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
+    if ( !paging_mode_external(d) && !is_pv_32bit_domain(d) )
     {
         mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
 
@@ -3366,7 +3366,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.cr3
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         make_cr3(v, pagetable_get_mfn(v->arch.hvm.monitor_table));
     }
@@ -3383,7 +3383,7 @@ static void cf_check sh_update_cr3(struc
     ///
     /// v->arch.hvm.hw_cr[3]
     ///
-    if ( shadow_mode_external(d) )
+    if ( paging_mode_external(d) )
     {
         ASSERT(is_hvm_domain(d));
 #if SHADOW_PAGING_LEVELS == 3
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -423,7 +423,7 @@ static inline int sh_remove_write_access
                                          unsigned int level,
                                          unsigned long fault_addr)
 {
-    ASSERT(!shadow_mode_refcounts(d));
+    ASSERT(!paging_mode_refcounts(d));
     return 0;
 }
 #endif
@@ -536,8 +536,8 @@ sh_mfn_is_a_page_table(mfn_t gmfn)
         return 0;
 
     owner = page_get_owner(page);
-    if ( owner && shadow_mode_refcounts(owner)
-         && (page->count_info & PGC_shadowed_pt) )
+    if ( owner && paging_mode_refcounts(owner) &&
+         (page->count_info & PGC_shadowed_pt) )
         return 1;
 
     type_info = page->u.inuse.type_info & PGT_type_mask;
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -93,7 +93,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
     struct domain *owner = NULL;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
-    ASSERT(shadow_mode_refcounts(d));
+    ASSERT(paging_mode_refcounts(d));
 
     if ( mfn_valid(mfn) )
     {
@@ -354,7 +354,7 @@ int shadow_set_l1e(struct domain *d, sha
          !sh_l1e_is_magic(new_sl1e) )
     {
         /* About to install a new reference */
-        if ( shadow_mode_refcounts(d) )
+        if ( paging_mode_refcounts(d) )
         {
 #define PAGE_FLIPPABLE (_PAGE_RW | _PAGE_PWT | _PAGE_PCD | _PAGE_PAT)
             int rc;
@@ -387,7 +387,7 @@ int shadow_set_l1e(struct domain *d, sha
 
     old_sl1f = shadow_l1e_get_flags(old_sl1e);
     if ( (old_sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(old_sl1e) &&
-         shadow_mode_refcounts(d) )
+         paging_mode_refcounts(d) )
     {
         /*
          * We lost a reference to an old mfn.
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -274,7 +274,7 @@ int shadow_set_l4e(struct domain *d, sha
 static void inline
 shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
 {
-    if ( !shadow_mode_refcounts(d) )
+    if ( !paging_mode_refcounts(d) )
         return;
 
     put_page_from_l1e(sl1e, d);


