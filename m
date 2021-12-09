Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EE46E792
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 12:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242957.420167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHZe-0008Q0-AO; Thu, 09 Dec 2021 11:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242957.420167; Thu, 09 Dec 2021 11:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHZe-0008NW-78; Thu, 09 Dec 2021 11:26:54 +0000
Received: by outflank-mailman (input) for mailman id 242957;
 Thu, 09 Dec 2021 11:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvHZc-0008NH-Ch
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 11:26:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e74bb42a-58e2-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 12:26:51 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-xf1sdbNhP6-B94oFNdODZQ-1; Thu, 09 Dec 2021 12:26:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 11:26:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:26:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 11:26:47 +0000
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
X-Inumbo-ID: e74bb42a-58e2-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639049210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byEU016lID7eSKnqJIKIFTYD83U8No8UvINs5+8b2I4=;
	b=c5RsZaBuGRgHZcu6fMqAfSyFOFEn7k0NkgpH7XlG5+zEmIzdmT79dGfhAzJ0ceoiGjt3qE
	OlnLNdNAKFDr/E/8YWyoW+hCIXPhH3Ww6MC0o7/bAg5p9Ll60XGAQ0abTK/f34E30ejpwu
	IZ1OZSzoAk5fK/EjWUm2PnjJY2aET9w=
X-MC-Unique: xf1sdbNhP6-B94oFNdODZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4GLicznotsbY2j8Cb6G1oVRKHnLZMcrSiRc9zEm7ge9ORZn0T89DxQoCsSRVlsroRH8dVwIWIre+7FHoWzdg8p/B7tTV+R7hqv0bFE8zc54bE636siBYeL9rpULCx5R/GDmwET6qhzv7PHxiw+1jmdeYpml1Wt2KcFABDFoeZ8pJ+wGvb2veQ5EEzV4YoEtx5+w0w/ZORrUw0fq9F0AKGbKE2Dm248jICjzj/KYdgSF1Ymm7P3Ns/9p5GwCMiFo88GH6CocxCQmmNoXIvKT3RUzfmZHUvYPGvZXKRylXF6YrRrhe4KRClqAsKCEovVwJps91vf2yCktwOR0blCN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byEU016lID7eSKnqJIKIFTYD83U8No8UvINs5+8b2I4=;
 b=nhiqVwYBVj2wDlt8OHLFgQdr0TJa15Qb8llhfZnIgXz69RxC7XKH19M3E1g9D2bVnEUbHWirQIqsE4fyXif0xF+/6gp3ZhvCXUJBdLiz9JxVUgf26AEbdz57zCdrBmlAnZDVxFYTs1Elra7p8O0llkMUuWolyyJMwd66eM/UsHVFujCFyD8xpHpOleGjrItToEAZLEupF/KBvdackd9kBPRmAC+n241AP+r/TySQfnnIdEG1N9sRjZFZm5omrLng8q/rilxBmhsg73SFhkIBZL9OZpqW9+j2qBwFnP9MnWajdI1jSYpBhPfzcFD2Mos8G4FOn8NAA0N3/oZyaIERZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <521b39ce-2c2e-967e-ecc7-f66281aee562@suse.com>
Date: Thu, 9 Dec 2021 12:26:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/2] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
In-Reply-To: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bdc8952-7bff-4f76-efd8-08d9bb06c9c6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669EB48048117AFCD55DB55B3709@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xVdHrffjrGgazC8hY/Wdlbj7pnONfo0zzD0Eow2U4NpM6EWkpIsuFgLRkvSiaE4yGKsolSP3vBIF/xllUvOPq68D2OWP6KWRm9mJLmsAN0W4yEY+bQfHkw8LZOyubnwWYMqbJc7NXOAd2GDOJYb46Lkw+cV6tMBcZAJc6FSnIs9LQo9258gAkvlXlnbZUhttvGdgt3QkiRRVADdMGpqySqpPwPvAFKfUNvVWg9raLcRQRuN1TSRgempU/69sA+8n21LtzfuZLJtGNYXeapWqFE/oKR1rm1Iu7TPG91yS7Ksil0WRg99mr1ea5/NqijZ3ubvUmT3rkxMCOR/HV4W4zHr5ZGDb+fLgjE1abUz5ZkvlIg9e5ltleida26ahyh3sE9rlimSrihtTtJX2tNn9MTyKeHTw0Bxuc/Hw4JC6JOE8xp/V0i4MhRxtXXL3mubS9alDjnUr/SdmVQgmWDVSzXrwunL8PlU3qzJ5HQxujaK26mkdDOZequGse4RyeUm9vYucYCxXSEetaYS2R+pxpiDKo8cBEfkwZyO09s/nfOIAnxoxaUJDEIs9YdwLJ3B3YZsay0jyRClNKkjFvAhba7VEmRQ3j0uCL2TTfr8gVADVgzwDLr7chpuAVJHeIFua6QsDHztCmHS4tVaJ/fmwYtxq92xD6E6hjnUGDB7oD5ccp3dQRIJDJuGm8KZdkzXaEfjFwiaL7ZJBFto9O2cdGS+jXRO4mFXslrplN/0hy6QVOX9vdjToBG6W9/kJAqTNoupdw1N0GFXELc4p3Byzvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(66556008)(8936002)(26005)(86362001)(956004)(6916009)(66476007)(4326008)(66946007)(6486002)(31696002)(5660300002)(38100700002)(186003)(36756003)(508600001)(2616005)(316002)(8676002)(31686004)(83380400001)(16576012)(54906003)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTN0eTJQVGI1V3JsNFhqR25GMEtFWlFQNmt2N0VqTUhMdW5XZDA2ZGNvNEtL?=
 =?utf-8?B?TkhBK0E0VjlEY3VRRlBRd3pxZDFzNEh3UmFYU2xQd0QvSTlVckFSSXNOY0p2?=
 =?utf-8?B?WEVMSGcrT2F6K0M1eTdpZ2ZySFRsTmNHUFdhUWcrSlZjRUx6dFQ5aGRxdmNx?=
 =?utf-8?B?OUxjYmFKRGZUM2RTM2ZIUkVjeUpVb0pUTUlncFBGdHBoMXE4TDdNMDhxNGp5?=
 =?utf-8?B?OVdKcklJelJOUGU2STA3NStidEs3QXBvU2lmS2JSQnhielRhbEVLRkFVMmVi?=
 =?utf-8?B?SmZsWWE1azBvcS9JS0pTc3Z2aWhDdGlTcjN2RFd5alE0SEVxMGN3TlhGZU40?=
 =?utf-8?B?OGg3bzVkOVdMdktuQTRZazY0T3lvQ0ZrK1FUTTRmNFRjVFF1WEVYNGdEM29J?=
 =?utf-8?B?NTBCbjdoanB6VytjbUQrQ3hNWVRKaXZESlB2RTlQUENJY0tSRXdQUmxNK1dS?=
 =?utf-8?B?UWtVMThtU3ZGUklOd0hVUjAwRlBuMWVKby9vd1VYY214RlV0U1lpdjZwMWx4?=
 =?utf-8?B?KzZETUVpQkJUNEQ4bmF0L3FGaUVkdmFIVklXMXAwM25iTng4SDBSZmhYT3Y1?=
 =?utf-8?B?UzhVbFBjOWxWSndPN1l2YTFSVis3ZGJDZWxjb2xzdjVwVm5vSjUxeXhGQkhz?=
 =?utf-8?B?c2pBaU1LWENHaVlyUWNYcDdEcDB2a3ZCejNCUE9EYWI4bGJCTXpQVXdsMnEx?=
 =?utf-8?B?bTloL2E5NTNpOEptRWdLVklrd1lrenhRdTNQVEEwVGp4V3U1ajJqTCtqVTAv?=
 =?utf-8?B?czlXRlNEbWNuM1AvZnlCYTRtdmRLa3JQZWh6LzM3TDg5U3pDbXJWOU5NV09r?=
 =?utf-8?B?Z1pxNzdQbjhqOVpldm53bllJRG1SSW80ODc1eEFnWU1BNW9XdDZ3Z1U1TEYr?=
 =?utf-8?B?VE5raEVMMDV5eFVqOFZ3eHFzdHcrN3BXTktuVFp4NUZsSDRyUU0rbXcxMC9r?=
 =?utf-8?B?TzFEZUVGdlVFTXdudGdPVWFtSVBMTnNZbDhBRWcvanNDY1NCQUdoMmQ2OGE0?=
 =?utf-8?B?UFF2OEhReGhJNDRGNjl4THRxUUJ0SjBjUlBsSE9Mc0J1LzdQTHFvcFNqUUdo?=
 =?utf-8?B?ZzFlUVVEMDVLZ09LdVV2U25ycDcyNXkzS0NQR3lqMkJJRXRxZHdvZjRBYTRk?=
 =?utf-8?B?YkZUdGJSWGllcnFzSjZyL1BtdEwrWVRiNDZRUmhEaDQ3L3JnNUg3c0ZiR1Ar?=
 =?utf-8?B?MGF6QXZoVTM3RmFua2ZMcVRXZXNweTFseGNBTEVOaDhsbXdXTXhmM2s0MFBn?=
 =?utf-8?B?ZVk4QWJWM3VRZ3BCeVR6MG0zbEdmWHJqbDhhRStyTjlRUTIwSGNzaCtuZ0Nl?=
 =?utf-8?B?WWRzQ0FnVU13di9wTEowdDdmNkRSVmo5OCsrRTZkVXcrRmN5LzJJR3laRTZV?=
 =?utf-8?B?S3JIbzlSa0tMWldsN0N6NURrK0dDTWhxdmRnOU1zNFdGTTlVNm9qb3JHWktW?=
 =?utf-8?B?eGJrV25WUUFQWVh4bGV3ZmdpNWJ3R1l0LzdUUDFKd1dmWmMybEtYRHZtRTlF?=
 =?utf-8?B?ODBzcUhMK09JOHI5TXhiYmt3bjVCRUYwcEl0bGpDMlBuU2piQUU2L3BCcEVH?=
 =?utf-8?B?MDJWNkpVNGdScFdiNGJGdWttZzF0VTBsdlZYVDlKdlZNd21JZ3FhejU3WEZR?=
 =?utf-8?B?MVNnQUs5R2w4Z1ArTm56Tkd3ZjFnU2JWVGJvL0NTS0ZOSHBCc2ZIWUllWnMv?=
 =?utf-8?B?U1J1WERVd3NBVnNOK1JoV1dlMGxlNDFVcmZYZE1jc2ptS2dkR04ybFVlZEpD?=
 =?utf-8?B?RUE0VURKenRLbm1oa2d2eXErdUxzOWY1Q2U3UCtXVlU3UkZhSUVwWG1pMTV4?=
 =?utf-8?B?TzdlSURqZjR3RG5qZWtrNDBWK3p1cjJJTUF5RUtJMWxMY2Y1bHM4bGhYQnhG?=
 =?utf-8?B?eDdCbnI2NXE1eWNPMEV1ZXpieFc2aFRDamFqNnRGREo1N1FJWWpGZFZ2MHda?=
 =?utf-8?B?V2hOSTUrNnVLNjBPYzQ5SWFHVk5abnY3VG85V0ZjdXVxZ1p6UFc2d0s0azha?=
 =?utf-8?B?Q2w0L1h5b3dQQ1dPTkNXVXdhYTQ2d3d3Z05Rd1RkWllkS1llU3lBMWtvMUJI?=
 =?utf-8?B?OHYzRTUrSFc5YzhCTTU3UTBKcGIrNllLYlBLTXBMZmlZTnZ2dHZWckQ4dFhQ?=
 =?utf-8?B?cG1JdXprdWR2cnpCdFBRWXIrTUpqWHlQNEZyZkpFQVVnVmJWUi83R0ZHcWF2?=
 =?utf-8?Q?asxolmAQbRvr4Q5yfatQFmY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdc8952-7bff-4f76-efd8-08d9bb06c9c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:26:48.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEtHiw2NlqTMGaVYM6uMvBlBAB5M8DSHDcWph0RCWBf2KP/VOLQ7DWtxgm7u8fXurZ07iORh7/Cn0IUe6yNnUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

In preparation for reactivating the presently dead 2M page path of the
function,
- also deal with the case of replacing an L1 page table all in one go,
- pull common checks out of the switch(). This includes extending a
  _PAGE_PRESENT check to L1 as well, which presumably was deemed
  redundant with p2m_is_valid() || p2m_is_grant(), but I think we are
  better off being explicit in all cases,
- replace a p2m_is_ram() check in the 2M case by an explicit
  _PAGE_PRESENT one, to make more obvious that the subsequent
  l1e_get_mfn() actually retrieves something that is actually an MFN.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -801,7 +801,7 @@ static void sh_unshadow_for_p2m_change(s
                                        l1_pgentry_t old, l1_pgentry_t new,
                                        unsigned int level)
 {
-    mfn_t omfn = l1e_get_mfn(old);
+    mfn_t omfn = l1e_get_mfn(old), nmfn;
     unsigned int oflags = l1e_get_flags(old);
     p2m_type_t p2mt = p2m_flags_to_type(oflags);
     bool flush = false;
@@ -813,19 +813,30 @@ static void sh_unshadow_for_p2m_change(s
     if ( unlikely(!d->arch.paging.shadow.total_pages) )
         return;
 
+    /* Only previously present / valid entries need processing. */
+    if ( !(oflags & _PAGE_PRESENT) ||
+         (!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
+         !mfn_valid(omfn) )
+        return;
+
+    nmfn = l1e_get_flags(new) & _PAGE_PRESENT ? l1e_get_mfn(new) : INVALID_MFN;
+
     switch ( level )
     {
     default:
         /*
          * The following assertion is to make sure we don't step on 1GB host
-         * page support of HVM guest.
+         * page support of HVM guest. Plus we rely on ->set_entry() to never
+         * get called with orders above PAGE_ORDER_2M, not even to install
+         * non-present entries (which in principle ought to be fine even
+         * without respective large page support).
          */
-        ASSERT(!((oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
+        ASSERT_UNREACHABLE();
         break;
 
     /* If we're removing an MFN from the p2m, remove it from the shadows too */
     case 1:
-        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(omfn) )
+        if ( !mfn_eq(nmfn, omfn) )
         {
             sh_remove_all_shadows_and_parents(d, omfn);
             if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
@@ -839,14 +850,9 @@ static void sh_unshadow_for_p2m_change(s
      * scheme, that's OK, but otherwise they must be unshadowed.
      */
     case 2:
-        if ( !(oflags & _PAGE_PRESENT) || !(oflags & _PAGE_PSE) )
-            break;
-
-        if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
         {
             unsigned int i;
-            mfn_t nmfn = l1e_get_mfn(new);
-            l1_pgentry_t *npte = NULL;
+            l1_pgentry_t *npte = NULL, *opte = NULL;
 
             /* If we're replacing a superpage with a normal L1 page, map it */
             if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
@@ -854,24 +860,39 @@ static void sh_unshadow_for_p2m_change(s
                  mfn_valid(nmfn) )
                 npte = map_domain_page(nmfn);
 
+            /* If we're replacing a normal L1 page, map it as well. */
+            if ( !(oflags & _PAGE_PSE) )
+                opte = map_domain_page(omfn);
+
             gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
 
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
-                if ( !npte ||
-                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
-                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
+                if ( opte )
+                {
+                    if ( !(l1e_get_flags(opte[i]) & _PAGE_PRESENT) )
+                        continue;
+                    omfn = l1e_get_mfn(opte[i]);
+                }
+
+                if ( npte )
+                    nmfn = l1e_get_flags(npte[i]) & _PAGE_PRESENT
+                           ? l1e_get_mfn(npte[i]) : INVALID_MFN;
+
+                if ( !mfn_eq(nmfn, omfn) )
                 {
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
                     if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
                         flush = true;
                 }
+
                 omfn = mfn_add(omfn, 1);
+                nmfn = mfn_add(nmfn, 1);
             }
 
-            if ( npte )
-                unmap_domain_page(npte);
+            unmap_domain_page(opte);
+            unmap_domain_page(npte);
         }
 
         break;


