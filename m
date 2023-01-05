Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46765F0C1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472017.732110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSjS-0004Ai-OP; Thu, 05 Jan 2023 16:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472017.732110; Thu, 05 Jan 2023 16:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSjS-00048T-Kh; Thu, 05 Jan 2023 16:04:42 +0000
Received: by outflank-mailman (input) for mailman id 472017;
 Thu, 05 Jan 2023 16:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSjQ-0003hT-Bx
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:04:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2059.outbound.protection.outlook.com [40.107.241.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a844ed62-8d12-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:04:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:04:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:04:38 +0000
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
X-Inumbo-ID: a844ed62-8d12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmgGKirqO97aW2lzSqCXpaIMGF3eF+gzlXSdDILsRUTRy53Ts+dmTcDoA2bJ/bAnU3z2nlZx2jmznhmU7AK84CybI9T70vXkmie0xgGRut+p6DfJhXVCyNYQYEVyKncF4fIt8u+2ttL2Rt1EihkvWd3GGx9kPusq43eeLKp0iGlEQieUBy6eMtNNcrfy9F/eH/fsGSm0nMo2FGTGENBE2b+OxRjzPauOtWUvDUv2nwbiGW1lw5CAZxcSjIlBYvw/AlMKs0j9DkWWvutTSqko6nE4ozkU8m34mOZ+zTvaq8EjkGeY+cj1tUDHxFx5fGGOifCFF8EsRMH7JJjjEMw3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJaoeutQLbYPzxfYQUitLAuxg6Tn53bDvw1b7Tq+keI=;
 b=PMQyKOvRZKzmstJbOfx7xQT76V22aS/cbEfpwt/kZXbC5BmTLEYAc79ZZqUOjWrv949KUVYamDLCZibCj39TvC/WNHS2UOf5dE6NrJxRuUzculrwq5V0Pa1RirGIo/zvLa6v+m16Xf0LFGFQZjeI9ZoxpvgmBoNCvv10TGr6RbyXKidJPEm0lfvI6ZBP/CHf4z/x5qW8/33ABw7evNPnq/beGfRsRt5ax0Fvmm669kJQ63QRXyebQj9Y1+2PiZK1ZnhktMBwc+n3Q1wtJ70myb1H5bsoe7PzSS8m85hWVaP3t+VtN2WMxP6B+ovqZ8DcmC3JIhL1V5wcoe+VwiV/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJaoeutQLbYPzxfYQUitLAuxg6Tn53bDvw1b7Tq+keI=;
 b=Q8YlPobdSJaKnb4lppkjZ0CgQtxuyIXFDSEXkUhMrUEhDLLZALOxc29Ls+Wyt7uyBEdo6xMI6/C+77pbJHzMLDb6O62IYm3YgHWrplzBI+YnAXef5+bCGgAuRWsuFI65PsoCw/jGZC9Bm/ORLYAVCiQCMUwBwGdJViIYwAgkvuprRDgbe176GqqoXkFyfZZnsS1YVgkJ5LV7t4DU7ndRgY7mGY1ANrRq9H1xZsAJkVM3UO6rBaWRhrh3TBKC7WhhWlgm5IsK+omMpMVUVqINWG9z68+PpmEgOnb2hUg+4OaVDpHDsfmXXYPEUxxxuJBB+4Aaff8VLOwUgldlwb8Xjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca3e0c70-ae80-4c21-97f7-36525229074b@suse.com>
Date: Thu, 5 Jan 2023 17:04:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 06/11] x86/shadow: drop a few uses of mfn_valid()
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
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b6a024-c967-437e-adc4-08daef368beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XbhDPUSuADkRhwC6IzYXEToveZgcb20lXMisLZ+GMM3jSAMmAniv17a7NvzsDci67mEPC+Zzq5fi47TEnsLI3RWN2RHqlXBAEWYUITFOOldngtRs5IfrJ/IemNBFosSmXyimqXnN7HOnePDVVU7GFovd9Dgi0l1ZtG2LeSc5QD+j/6AcvV+3MqbTMrHs06dEduNxprJcZQ542I/L3MRu5WOlEkyPYA/AzYZIouvSgV0ILSvi6QjsfFlSJDhXx4vlOMOqsZsuDkMHQ4AIYYRtMkihj18fKgrvLP240VyRwhXnE45g5oL+Jgvfnrlbg4kTSauyLo/zeMQcPFw88V0G8fE2j72r4OdNbSsMIr5L5JP7IvkzTFDHNMg77cG5FWKIJ2bha14z3QtGKUup7zj8ZpBCERjqCXeFE0sXp6A/10J+Jo8bJ0AwICNUnP+WFcJQysYpxL71uLY2wIUU7VWjFhAbGyujcraQjdUNulTKpDcNO7274wQqr52wnNec4VxFkVw4qaBGSXduUaNjyzHb8uO/fGWMspsCFrn8i+u17kRjJzuo86muPb5nMY0UVgyZq9/lW2gwGv+yD6+kX+VP6ITn+tDDQr46au/SUqgRsbpJyfG1BEJIgeWkUcs1pG95UHkfl/S+3wJtRXNALCxZKzwtAqBRpbU9OsDr2r997pmYHyXqf/IX484ATxnq8nSkAhRaPH7SyRr27BQvT4RLov5L9ocdKSGepiaGwyeYN20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(316002)(31696002)(4326008)(86362001)(66476007)(66946007)(5660300002)(8676002)(2906002)(66556008)(41300700001)(8936002)(6512007)(26005)(186003)(2616005)(6916009)(54906003)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjhjUlVUSDB0dW9LVE1FTUlwYm1TNm91Z1RLa3JWRmkxRm5YYUNqWWNxdWxv?=
 =?utf-8?B?VmoxMWwxeUMyUkVnUm01YVV4MEdaUW9TV0M3S2xSOGtqZ05ncDhOdmhkMTFm?=
 =?utf-8?B?dm1GelpCVENjeWlSUitWeHZUWExhR2phWldqRm03VkZLTHNkUEFUYTRjRzNI?=
 =?utf-8?B?WmxDY0haS1d0T3BsYzlQSElCcGJVY00reXhFMC9YK3QybnlrQURIR3VoMXN4?=
 =?utf-8?B?WkJRU21FTWMxRkVFZGZCUUlpNmUyZldXemVzTC9zMGdZT0dhMzVBWjdON3F5?=
 =?utf-8?B?UExvRXd1YUcxejRjS1pmVXVseVlzQ1NiRUJSdU12c2lpL2RLU1JGWU05cVdk?=
 =?utf-8?B?Q290d2xPUUVYemo4VThnNWNUeVQyU2FJcmpqWHY5L01sbTZxcEZnOFAvNVRp?=
 =?utf-8?B?R09IVWRKa09Pb25RUWlGV1pSNkRNdmQ2Qkd1RTFDOVdCczR0S2YwSzFoVFRj?=
 =?utf-8?B?eWJBck1ZV3FvNFVxMCt0cFJMdmVYdC9NVG5XMmp5S0lKMTR5QVB6djJyMVpN?=
 =?utf-8?B?ankzUEhGemZlTk1ydldWWGRNVFpIMlBHOU8zVGFDdzRYRG1SeUp3OHlHRVBZ?=
 =?utf-8?B?ZFBvQk9lSDQ1RWNUaDhGNzMyTnB1VlZsVm94dHQrcHpXemFZUGo4VHEyOFRR?=
 =?utf-8?B?M1Q0bnRhdHEvUVRDaFgvMk93ODh4WmMxM0g2YXhsdWp4ajJKZTErVk1JRTNH?=
 =?utf-8?B?L1IxSDI3VkxkdjJtTThqWkZqaGlaS3FIamI4UGc5emQ5R3IzdEcyTnpJUno0?=
 =?utf-8?B?WDJmai95RDlBd3cvVGduOUlJU1pWTUErR2VHYVZXb3BhVGJBWTZSWlFCV1dk?=
 =?utf-8?B?MFV0NkpsUlg3bnhjTm8vSkFmbE5Rd0M3bUw2bVNOa3dTdTVHUjhnS2IyaVQ4?=
 =?utf-8?B?c29TN0psT0E4eHpzYkZhcWl2WnFDd1pON291OVlSaTl1SkdjMEMzaVR2LzBJ?=
 =?utf-8?B?V1hHRTBjNHcvMjNhbWYzL2RBSTh2VnZNRUhpYmpWL05HQVl0V1Nxb0k5R1Rm?=
 =?utf-8?B?NHc4WjZoUGhnQWlnTytpYWNaKzdwQnFPVFMrb1dnaFlIYW9LSnBheHdpclRH?=
 =?utf-8?B?cEtxeEp3SHMzZkVtekdmdGFoNDcrVkY2aEZJYUJzTzNGZVhJSDQ4UFN2RGlS?=
 =?utf-8?B?ZFlVSFdJRWNwMkRkRVUreSsyRkUvbTlsYWNEUDZqbFVyUTE4VkRLUVhGYmhC?=
 =?utf-8?B?SE53dUZQS29vbDNrcUVYQlNQTG5yeXZiWkF2bmQ0SHlwZGcyUDRaWkFtcWVr?=
 =?utf-8?B?d1h5Mmx2cjljU0pSKzA0VFhtRWhMVExDV0tLeE1XVTkwdytLL3hDaThtQm9m?=
 =?utf-8?B?Y3BBb1pUVVVKOXN1djgzNHNDUy9IRnI3a2gwRDVnOTBqUkVoRklGTVNOeHN5?=
 =?utf-8?B?SmVnVlNhV0Q5Tms1K0hKQVRwL3JwQ21Lc0cwL3dTeWFxWkwvanFuMzJHbGNG?=
 =?utf-8?B?bGF1dUpBZlJiamFRUkFXVHE1MHdkdTZpV0x0WmRQODJSTjJacEMraTQybGhS?=
 =?utf-8?B?UWJsRmd6SzFtMm0yNDdtckpiODBlZzQwTjFFR01HM2hRcTZtZ1ZxZEJiQ2ZN?=
 =?utf-8?B?MnFvYTBBYUpqNGthVHE3aDV6cUlpTGpjQjBwY2tzMHpxMGhiZGtzRFRVRktY?=
 =?utf-8?B?d3FGNkZvZUM5QjZHbWdLSERlQ1N1Qnp6Z1BaUm5rdnNNUTNiUkxTcmwrQ0JX?=
 =?utf-8?B?Y0NrMS9rUkdaaXFXNzNndnJCSSt0T3pwQjNMamN2eU5DelRKSlhSZHUyNFB6?=
 =?utf-8?B?RGlwbEppZ0wvZHNHM3RrUysycFNMK3hmbldoREt2dTBkaG81NWF1dUpCMGwz?=
 =?utf-8?B?Wm5MazU1QkpSbHZmQk1IWUZ6d24wREI1SVoza3A2UzRDQUk2RG5wLzA3SHF0?=
 =?utf-8?B?eXpETWVXVGZpZ3ZBWmhCcDV0SFkzS2U1WUtqMEVZMmdGZTE1dlRPQk5jRWJh?=
 =?utf-8?B?c1cxVUpZY21NSzZUT3R6YnJqQlRiUkRwOUkyM1ZHRkhzT2hiTWwxOWRwT0RL?=
 =?utf-8?B?dG9IQWVVbHNsN1hVdWFNM0hkS2QycVpnL2V2cTB2K0lYR3ZJdG9DVFhad0tH?=
 =?utf-8?B?WXJ0TzlWN1ZJY2d5ZDZUWmhQRVpLem9TMVFybWF0MHJmbUE5bm9pOS91clFv?=
 =?utf-8?Q?gMS60a4htwmvqQ0o4mrqRwHNZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b6a024-c967-437e-adc4-08daef368beb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:04:38.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ARPHIyL5U0VA9mm0aThyC45AGojNQUrsmdoH6T6X0+YXij7vXFKOyiVmsx4gZnZ4J7lGFRveNRWRUu9+sXXUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

v->arch.paging.shadow.shadow_table[], v->arch.paging.shadow.oos[],
v->arch.paging.shadow.oos_{snapshot[],fixup[].smfn[]} as well as the
hash table are all only ever written with valid MFNs or INVALID_MFN.
Avoid the somewhat expensive mfn_valid() when checking MFNs coming from
these arrays.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are many more uses which can likely be replaced, but I think we're
better off doing this in piecemeal fashion.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -171,7 +171,7 @@ static void sh_oos_audit(struct domain *
         for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
         {
             mfn_t *oos = v->arch.paging.shadow.oos;
-            if ( !mfn_valid(oos[idx]) )
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
                 continue;
 
             expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
@@ -327,8 +327,7 @@ void oos_fixup_add(struct domain *d, mfn
             int i;
             for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
             {
-                if ( mfn_valid(oos_fixup[idx].smfn[i])
-                     && mfn_eq(oos_fixup[idx].smfn[i], smfn)
+                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
                      && (oos_fixup[idx].off[i] == off) )
                     return;
             }
@@ -461,7 +460,7 @@ static void oos_hash_add(struct vcpu *v,
     idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
     oidx = idx;
 
-    if ( mfn_valid(oos[idx])
+    if ( !mfn_eq(oos[idx], INVALID_MFN)
          && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
     {
         /* Punt the current occupant into the next slot */
@@ -470,8 +469,8 @@ static void oos_hash_add(struct vcpu *v,
         swap = 1;
         idx = (idx + 1) % SHADOW_OOS_PAGES;
     }
-    if ( mfn_valid(oos[idx]) )
-   {
+    if ( !mfn_eq(oos[idx], INVALID_MFN) )
+    {
         /* Crush the current occupant. */
         _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
         perfc_incr(shadow_unsync_evict);
@@ -607,7 +606,7 @@ void sh_resync_all(struct vcpu *v, int s
 
     /* First: resync all of this vcpu's oos pages */
     for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
-        if ( mfn_valid(oos[idx]) )
+        if ( !mfn_eq(oos[idx], INVALID_MFN) )
         {
             /* Write-protect and sync contents */
             _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
@@ -630,7 +629,7 @@ void sh_resync_all(struct vcpu *v, int s
 
         for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
         {
-            if ( !mfn_valid(oos[idx]) )
+            if ( mfn_eq(oos[idx], INVALID_MFN) )
                 continue;
 
             if ( skip )
@@ -2187,7 +2186,7 @@ void sh_remove_shadows(struct domain *d,
          !(pg->shadow_flags & (1 << t)) )                               \
         break;                                                          \
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), t);                       \
-    if ( unlikely(!mfn_valid(smfn)) )                                   \
+    if ( unlikely(mfn_eq(smfn, INVALID_MFN)) )                          \
     {                                                                   \
         printk(XENLOG_G_ERR "gmfn %"PRI_mfn" has flags %#x"             \
                " but no type-%#x shadow\n",                             \
@@ -2755,7 +2754,7 @@ void shadow_teardown(struct domain *d, b
             int i;
             mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
             for ( i = 0; i < SHADOW_OOS_PAGES; i++ )
-                if ( mfn_valid(oos_snapshot[i]) )
+                if ( !mfn_eq(oos_snapshot[i], INVALID_MFN) )
                 {
                     shadow_free(d, oos_snapshot[i]);
                     oos_snapshot[i] = INVALID_MFN;
@@ -2938,7 +2937,7 @@ static int shadow_one_bit_disable(struct
                 int i;
                 mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
                 for ( i = 0; i < SHADOW_OOS_PAGES; i++ )
-                    if ( mfn_valid(oos_snapshot[i]) )
+                    if ( !mfn_eq(oos_snapshot[i], INVALID_MFN) )
                     {
                         shadow_free(d, oos_snapshot[i]);
                         oos_snapshot[i] = INVALID_MFN;
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -110,7 +110,7 @@ get_fl1_shadow_status(struct domain *d,
 /* Look for FL1 shadows in the hash table */
 {
     mfn_t smfn = shadow_hash_lookup(d, gfn_x(gfn), SH_type_fl1_shadow);
-    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
+    ASSERT(mfn_eq(smfn, INVALID_MFN) || mfn_to_page(smfn)->u.sh.head);
     return smfn;
 }
 
@@ -2680,7 +2680,7 @@ static int cf_check sh_page_fault(
                 mfn_t smfn = pagetable_get_mfn(
                                  v->arch.paging.shadow.shadow_table[i]);
 
-                if ( mfn_valid(smfn) && (mfn_x(smfn) != 0) )
+                if ( mfn_x(smfn) )
                 {
                     used |= (mfn_to_page(smfn)->v.sh.back == mfn_x(gmfn));
 
@@ -3824,7 +3824,7 @@ static void cf_check sh_pagetable_dying(
                    : shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l2_pae_shadow);
         }
 
-        if ( mfn_valid(smfn) )
+        if ( !mfn_eq(smfn, INVALID_MFN) )
         {
             gmfn = _mfn(mfn_to_page(smfn)->v.sh.back);
             mfn_to_page(gmfn)->pagetable_dying = true;
@@ -3867,7 +3867,7 @@ static void cf_check sh_pagetable_dying(
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), SH_type_l4_64_shadow);
 #endif
 
-    if ( mfn_valid(smfn) )
+    if ( !mfn_eq(smfn, INVALID_MFN) )
     {
         mfn_to_page(gmfn)->pagetable_dying = true;
         shadow_unhook_mappings(d, smfn, 1/* user pages only */);
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -770,8 +770,10 @@ get_shadow_status(struct domain *d, mfn_
 /* Look for shadows in the hash table */
 {
     mfn_t smfn = shadow_hash_lookup(d, mfn_x(gmfn), shadow_type);
-    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
+
+    ASSERT(mfn_eq(smfn, INVALID_MFN) || mfn_to_page(smfn)->u.sh.head);
     perfc_incr(shadow_get_shadow_status);
+
     return smfn;
 }
 


