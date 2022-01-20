Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D524D494FEC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259084.446871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYF1-0001sa-Uk; Thu, 20 Jan 2022 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259084.446871; Thu, 20 Jan 2022 14:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYF1-0001qX-RH; Thu, 20 Jan 2022 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 259084;
 Thu, 20 Jan 2022 14:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAYF0-0001qR-7H
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:16:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9675d046-79fb-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:16:41 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-ffoycnpLNzi9iczhDmV1hw-1; Thu, 20 Jan 2022 15:16:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5786.eurprd04.prod.outlook.com (2603:10a6:10:a8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:16:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:16:37 +0000
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
X-Inumbo-ID: 9675d046-79fb-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642688200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEVB2y/I9AJv59oC5zCnIj1lphgp7QzAQDw4BT4hvyk=;
	b=UrDwfH4S3j765wkV0gxCmKE85SVB6UGUnzI8rgcC3NG+ZVMJjawqWyemS/1NJep2oDrrtl
	bczuwtxORhfW4fCgEoCnvz/bLJWjQN1IEItq1AKlJxAYFfIt69FKQZvEO5n0vCzIZPh5Pm
	ENDTwhD2vN1PboBUdIsF557NISx0/7c=
X-MC-Unique: ffoycnpLNzi9iczhDmV1hw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcVhkpTDaC0R7RzKOEiuOZSFjifH29kVY+4EElnXEhj43OxirVrd6MYjAAMp3AsA/8FcUSbenEuvWCbkLZVWDx8XCnr66GkiZc9YJXByLpSQXSwSAbtQqg/Rn/cmS/5LjPX3HQXwJeNNq/ESJkphqEz6Gd8hr4OGuYbshkql2nz76+OypU2/gefEvDUb/CNeYSt87jMoXNBfMUM5P37Y0u8cLdiFPG2yjxMskCBGl4f2FK2rjHjucABZtg5GV3DpLssI7wQrggpilM1JMvbEC0mxkyaZ4hW0C8P3qLFSDA+GEa1uQaChrVvPyB9VxgBnHNuZ0zPCZB1rfKgCLzrcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEVB2y/I9AJv59oC5zCnIj1lphgp7QzAQDw4BT4hvyk=;
 b=C1Cge6HrMNd776vL2MgZIWKIj141aCvz5i1GqOvIBe9oD0rfdGSInOzFDACxdh5woB9GxCcTm4bMTrFFh24LNoVL2ujyJ1HWuwn+qfXN/fkzYorpupnuQelLecdbGkijrQksgrX8Ed5pa1IswWHUr5F4zsB3SunUfl9S1JVKlLsrGpMWbYvEnCwqXaeXgM3gcENEwCEw/9uc13iY5jl3KS53dRfdY2vEMUHrqNL2k81rJvbRbQeWLLkwtw90s0Qa0/bMaxqEIgjYKG1xti4xKNNDsW5dej7XNsv/qhMn5hyvRfPZnq42JJUt9wa3L+9550qfMcbBAwlYYFChOdVVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a8981c6-b3fe-c805-f45b-b6da5d0aa1af@suse.com>
Date: Thu, 20 Jan 2022 15:16:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 1/2] x86/Intel: Sapphire Rapids Xeons also support PPIN
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
In-Reply-To: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cdd0f45-f61a-4330-3176-08d9dc1f7863
X-MS-TrafficTypeDiagnostic: DB8PR04MB5786:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB57866D41D225657371E52509B35A9@DB8PR04MB5786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZsc9yQIooaxZjUyJhDZV9FjCtruv32MHwuF80CactK64pyKDdYw9M3vIyCFeQz+oRCveAsdzSuedWt3LEfrtNKUOJL7xoTo/Rnv1XAzlps190eTohcZvR7+nGU4VRb6+bIjPlpSwdtjBQaAK70cnMzL9NZ1deSDt0fJ/cUFGK0E9H2HZus+CdFun6cewNKFhO+CxQHmW7MiDwNtF6NqHvVQCJNH9lHhpqFrxLB5F5sX3ug1TB8u4+7tl3eEBKPHH5OOck29DD9CU2JNkz+m39c5h7rv+0n/TOzc9ybhyr2pfOSGz3WAc8X2ipx2yIxZPWY538GD9rKw2Fr/qNLrmuxnflu5mGpqsHYYeYiOv7XKecKKMvExP7SW2KoHidoDkHsoZ0vKA5QnaVF2mjafFXPeSOzLtd/auc+lUdGx3SACCZgSPQM71XB68/bNZNJBxZ1JytlpnxsMbWHXAO3ObFT4NwRFOr7L7tn7VCPsGzZI1IDwKRQmaNm2q+cVDejI768BuQikncXX+IuQSO6d9sp1x4KgUBfPGbgs5bspRspfnvhhMyvgIL2rmCkVXHiv1bG3G3JzaVi0gDHXeTu3+UkrkGveL+pGbJdyN7OsL1PjKXkoK9YN0EYjRSPUJuAsBwM1VA8GnPPpFeC4eu7uNBdx8KAhjrMF/sDUnQry55WOGTTDazil6vEqmt+ifUfJ+xi0uawmtmky1+90UHBOiC3ETLJvwCTNV3mB9vs0XpfuOENkNZ7YRx2gI88q9kFK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(2906002)(66556008)(2616005)(66476007)(6486002)(38100700002)(26005)(6916009)(186003)(86362001)(4326008)(6506007)(36756003)(66946007)(31696002)(316002)(8936002)(31686004)(8676002)(508600001)(6512007)(4744005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW83ek9xN3Y1akFWZ3VPVlBEL0hyditjSGNNU29TYmYvMTBYaXhPdS8xV29z?=
 =?utf-8?B?TVRleHdvYWo1V05rbzJKNkZwSFF1d1YvdEh4UzI4Mm1MNHZIVnhSc3pVNjUw?=
 =?utf-8?B?NlBTRFdXTlNybUNINHNlb0hPdk9mQ05nVDI1NThhR1RFZkFKbWgzQkFWdkpG?=
 =?utf-8?B?TnR5T2dxVUFDZVR3aFc2MTNXcXRzWVBaZ2cxZjJuVkIrNzlPcWlXdmJmc2I4?=
 =?utf-8?B?UC9VcWxHTTFWMTc0U2ppc3oveGpORXFXWFlXVGxUQU81RHdGbTlDZCsxVG9p?=
 =?utf-8?B?UXE0Zm5NOG1kNjR2VEFudWZUNmxzcld4NEJuek9WSytQcG9MM2dCMWJxVGFS?=
 =?utf-8?B?T3M5VmZYaXhqRXNrQld2WFBWOUNJcm51Mk8vaC9zeTE1a3BKOHhUMjlzd1Zy?=
 =?utf-8?B?emROU3ZkeFVldTBQMGFiVUZEcjJWTitLMmQyWlRMTVNwdFI3dGUybHg4ejdB?=
 =?utf-8?B?UTE4M3Vqc1NsSDJZZXVOaGdPTVhYVnVVUXRwUUVlblcxd1hCQUFiRjRiQUlo?=
 =?utf-8?B?S3Y4TXg5YVE0UEtieWJjMXhsQXZORmVpbHJHT0pNR1NrSWpQQVdxZi9rdlUx?=
 =?utf-8?B?dzQwTWlYeC9CL2NvaSs3MUE5SkNkWFJhRXdFb0RaUkhsbHp2WFZUR0pUVHND?=
 =?utf-8?B?c1k2MU9UdlpyVnJxZzNvdXdZUDVyQ0I5czZ0SHN3Wnd3a1hGZ2RTYXc1dEZW?=
 =?utf-8?B?eU5DMHRScGFZcktnTWtDdnEwK1VxOTZOS1FRd3pNRHFnRFlwVVJRM1dYUVlL?=
 =?utf-8?B?UFFwdkgyU01uZ3pSR0lacStNVkpYcGFqSUxEbXZ5TmFZY01pWDhQdzg5Rzc4?=
 =?utf-8?B?SDN0MHMvOU00K002Z1J1cEFIMmVSSTYxK2hwOWJ5ZGpDVzAyaXNOZStCUmJB?=
 =?utf-8?B?UnNZbXo1TEl6bHVkdXZtSkpCVTkvUEJkWWwrSlV1bFlLcFBPK1d5RERoUHAy?=
 =?utf-8?B?b0gxM0R6ZFdacEZjYTM2Q0UvWjRJY041TmdDTWhzUGpPOForbGNRV251eVV1?=
 =?utf-8?B?Q1VoaUtnMGQ3TjVQc1p6WkhNZ3lCbyt6aWJkNU9RZzhMTThtYXBoV0tRdkxp?=
 =?utf-8?B?US9mbW5KaXAxMzZaYTZNUU9adW8wZDgzYi9xY0xNenNTV2lkT1ZPKzlnNXAz?=
 =?utf-8?B?MVltUFpTSTM3TXVjbTlTcWxTWHRpeG5YRmRwZzBHa2ozeTlQc1U5MGhzTGpk?=
 =?utf-8?B?bm5RbFUvSlBOL0M0dWZxRTBNc0lvbDNSbW1tbERvNTZLRTRBZHk3TmxKdjFi?=
 =?utf-8?B?TnEzcU9jZUttcStEWXg1SFRxTDNidi9DTXhNODFZREVaN0U1R0ZCbGxWWE82?=
 =?utf-8?B?NU54d0M5ZHlwKytZTzRIMzVBMk5paEFzaVZNb2VhU0dEaGw0UGt2SHIwMG9p?=
 =?utf-8?B?Z0ZXNHZRRExic3pKUDRITG5YN21jV1ZWS0J5VERFdlZlZTg0SnFNaS82bDlE?=
 =?utf-8?B?TVpLWUpMcENBdVRWWUhweUdMclRJNjJjMEczMVBtNGpUUWtGME0vaXhEVmlF?=
 =?utf-8?B?QVFKdUlSR1ZNbTlDa2t2UjZVNitxdFZrNkY3YTJuTVJzbEM2c1JGakd0bkNh?=
 =?utf-8?B?clBnYU9UVEU5UFY2UDZ3MHRFQlRIM3g1eHVWYUJGVy9wMDdCdmt0SkdlRkRP?=
 =?utf-8?B?SnZHSnFQQTU2UFNMZXBiUjFobndBZDRNZkhxemtKQkFmN08zTzViMWd4cUps?=
 =?utf-8?B?ZmVZOGR6bUgvQUxZV0xDR0FUZlgyZktnTzVNRXdzK1N3eG1ER3dsYmVROURW?=
 =?utf-8?B?NEpzNkVlbW40ellFWWlaY3FpdGlEa1o3c1NPbzFTKzBORHpzVkxUb05BVXdt?=
 =?utf-8?B?YXRUQXJWSmgvcUx2RC9TWDVOZnFMYlkyc3BZd1RmMytvUnhjTXJSZThVVURI?=
 =?utf-8?B?b2x0WkNxVGZ1V2xUY3dYa2o3dlRwTmNWRWdDQUZPK0ppbExUVG9jSXFzeEhT?=
 =?utf-8?B?cU0yM29WZ1lUZXN2QTRwNjJnWXVTWXJNWWduamdIaDlpaHhMQzlmOCtEQmZL?=
 =?utf-8?B?RWoySllUN1J3WXRybVFodStMQklqdUxYQUQ4bWNjcTZBOFFTbWRQL2JoVm9r?=
 =?utf-8?B?RkFKbjdJRmdmaFFtSWJqRmNTNXdqTFpkdVZnSlRNTFF4Q24wdGdPR3JQc3Iy?=
 =?utf-8?B?Uzh6a0MzQWc2V2hnZEhpYWJmMitlcmVwb0RYTjJ6a0dXaVJIcEpYMHdGMnlx?=
 =?utf-8?Q?VKkbyO8UfcOGxkwwifsMLMs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdd0f45-f61a-4330-3176-08d9dc1f7863
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:16:37.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CODEykEDIPB5rmbbKQ8fAyUxN2ghU+nT9zSDooIVA1AEjrPxS2DIBsdY+SVf8dtzTRTRuG2rkMGi8XrQxniig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5786

This is as per Linux commit a331f5fdd36d ("x86/mce: Add Xeon Sapphire
Rapids to list of CPUs that support PPIN") just in case a subsequent
change making use of the respective new CPUID bit doesn't cover this
model.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It is unclear to me whether this change is actually made obsolete by the
subsequent one adding support for the respective new CPUID bit.

It also continues to be unclear for which CPU models, if any, the
PPIN_CAP bit in PLATFORM_INFO could be used in favor of a model check.
---
v2: New.

--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -873,6 +873,7 @@ static void intel_init_ppin(const struct
     case 0x57: /* Knights Landing */
     case 0x6a: /* Icelake X */
     case 0x85: /* Knights Mill */
+    case 0x8f: /* Sapphire Rapids X */
 
         if ( (c != &boot_cpu_data && !ppin_msr) ||
              rdmsr_safe(MSR_PPIN_CTL, val) )


