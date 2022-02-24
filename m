Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C84C2CE7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278283.475472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE6g-0007LH-Ve; Thu, 24 Feb 2022 13:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278283.475472; Thu, 24 Feb 2022 13:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE6g-0007Im-SQ; Thu, 24 Feb 2022 13:24:30 +0000
Received: by outflank-mailman (input) for mailman id 278283;
 Thu, 24 Feb 2022 13:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNE6f-0007EL-1i
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:24:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17149470-9575-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 14:24:27 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-W-oIVrtENIWH0bYKBIOQmA-1; Thu, 24 Feb 2022 14:24:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4614.eurprd04.prod.outlook.com (2603:10a6:20b:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 24 Feb
 2022 13:24:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:24:24 +0000
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
X-Inumbo-ID: 17149470-9575-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645709067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAvTe/e7XAafZqd6Q/V4UD2oE01PCz2b1CUIOkE7Ztg=;
	b=CIZXaIBvf0b/6189RUQfleAXfJ1eZMgYjwgdNqpAUHEX1mveQO95fkU8aULftRnUENzHVU
	/lv5tDoEJWPiUEgNFxFRSyhfjlGKCG5DnrQhdsODR9Gc1L/+MJ8iT9qvrKdSYX78ij40nT
	iSWLH6ZmXlPsP2gU8dfx9G8HDcRuoHc=
X-MC-Unique: W-oIVrtENIWH0bYKBIOQmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll47Pd8EGqMCrXWDdU72cFFso9loZfAvqSQd7FnawSTMJXO+8gwhA5FbLVIg3QCAALxBEXJHNDZ9X8s+KhqmhwXWimSG4H8oz/xK25dFPLeZko6YmN1f9/O56eVAKNscPt/h/Rc9rygal9Te0pD/m4BpvXC0jd6hQwXUttBNDvacEi2ZNxMnG752gRJfjj/mzdRo7n8NtD9jn8dxKTOV1Moo4T5nf5vxGzt0muzVeemVtHFrUgqts+hrNCHiLGA9QsGluVnNk2sQHHWJUVE5xYS7CpnnMPF0cZL33hWUGWkyyGkPY6IXuIDuY5P+6RPjwuhwrj6GF/ag94l9Qp665w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAvTe/e7XAafZqd6Q/V4UD2oE01PCz2b1CUIOkE7Ztg=;
 b=jMFtamwTkqUz0NXPwWgg1TZ2pG5C/WvduWAJhawYzc6PH5LY1M+3/qjwWTKFwKh44ygWNNIUEBVAE8tTZSxqgJ7nUj/J467OUtEnDakBfQ+G03eEgctrxNoJAJE3ptkEv3cOcomEoQDnBvSRm2yITbcmlP4OzdvM2oAptBVnRvkEjpmnjDBch/kXsghXO9ZgZr4ToZoQkRkzUKihbnSrGZnG3s9iVLf2BV/8GJ9Hx1fOA7XJq4CUMhTGEznW2jBBGyN2Ch/BftnLPmSqxAGa8JjrttuFKNqKhykdsL47U1WzQhYolOp6Ir6tDPLXIzJWpgmgthfu32NxWyyH8o8xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afbcedb8-82b8-7c92-4bb8-8ceb597a2f1f@suse.com>
Date: Thu, 24 Feb 2022 14:24:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 1/2] x86/AMD: collect checking for bugs in a single
 function
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
In-Reply-To: <265e87fa-0f05-7953-1bce-34999119d3c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5abd7a7-0a89-4b99-f7d9-08d9f798f9c1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4614:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4614F9BD2C40C000B16EECE4B33D9@AM6PR04MB4614.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wl4vs5H3thqR12HM/bUrOlhMQpZK+3DmD0oo6PK613VMQS0GzfeaPUsdvr10RHdCLMMiZ+Z6w55fbOyJWzK7oL+vDuu62Dre4Ry1MuzHQjSaY8gETVFAXllTKnTWYb0yKVNmiNdsgCSV4f4Hee+I6dcS8JzKvG13eMb2qqqwR1Bypdzi3juPWvITArvaIbPiZ6hwYsI+CUDZsY8JaEKjftV6b96/9hH9SpzCtESq4Q3Kqi7IZ/5fREbQEjR6OZTm2Zcv8NnBKeZUxRpDQNDEiGvhca8JbwPUbZ7P85pPOCA1Hdx8Q5pb9yE7hB2Ut/YOofT0k3FxyYVhXy5kE1fYcX90slMPC5xHp0PpX327ihs1f+h8U7X3gT0GyuwPMvn+W6Qk+6RLDQDmkZCsgjfhiAvufV6JAcTURX43ol2W5ONeMORMLHsTA9uIV6NbpXMTrkgfp2GWkeWvtSfLBwaSRG2TbRAvBMVpK7nqazWBV1iD/fvPNV4eTuoVY6YeDGto1a57eH2mEWel5dV9QQYgLNVrKv+wRv93xSsXUf8fL5C5wXUUWrNKj9M5TVYanZWpnh7/lOmWn94654jPxqJGoz/NfTbVaS9DUUWv89zp655moEpQZLdihU+qscBxaRQuv+sOJmL7n4g5/uh6GAFZzR3JVik+LQ3oVxM/ciME04xb2cnfSoQHqFw1/HhFOBog0Gtih1MvcGNAu8vVIO+1USm5TGkhdq4k4Z2R/IRm4gEBwVQhzjdqY8pZTFTxAjuN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(4326008)(8676002)(316002)(5660300002)(8936002)(31686004)(508600001)(38100700002)(2906002)(36756003)(66556008)(66476007)(66946007)(26005)(2616005)(186003)(6486002)(31696002)(86362001)(54906003)(6916009)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXA3RW9TY3BJV3lBUkdoOXNqZE0xOEorRlFSVHFLdFhnQlFOVFVXZUlvaGdR?=
 =?utf-8?B?YUEyMTJJMTA4Rk1sTEZvNzNWdXBzN3RVd0thOG1QZ1F5RE1reTJLUlBDQllu?=
 =?utf-8?B?RkV6bDB2M2VFMDJwNWt0Q24zaE9BWjdya3kveWQwUEJXMDFjN3FIRVZ4dnJU?=
 =?utf-8?B?dVhGSkxYT01ON2gzS0RraHdjTC8wM005dXNFQXlqQlluNjBWRUZQQzdsQUNk?=
 =?utf-8?B?cEhuSC9IRzhVRnhFQTVKbHcwbjZuNzdpVjhvK2hvdEhBc2RXM2Rreml4S0Yy?=
 =?utf-8?B?U0o2aVpEV3k2TXEvaS9qWGZIdU1JTHFUMGZNTzhkSXlJdXFsV3lpTGtZc0R5?=
 =?utf-8?B?MTBNaTA5cXNWYSs2QzR0S2hBTTl6Y242Y2ZjZ04vUjJndngxaVVpM1dEazBh?=
 =?utf-8?B?dmtGcVZKdzcxM2RqdkxFTEFSd2hMOSs4VXBiTHp0d1N3ejNGMCtKQjZaR3ZW?=
 =?utf-8?B?bHdZdVBPcy9OaWxpVzVLOXVZQm1ENG5GMmRJbDhEWFp5c3VlRFVMZVY3ZHJR?=
 =?utf-8?B?WDB0RlluR29Vd1Q5SWpxUzRSWkwyK0hEZ2xGd2FxMGRpM09IWTRMaEJqRXFR?=
 =?utf-8?B?UU5mSDZJaEVQZWxXUjRvcEc0OVFQUkVVZnVrM1NkRkQ3b1lybmpMbnczVVpL?=
 =?utf-8?B?Q0RlY1l6Q2NSSTY5dkFrSXE2c1J2VzM5azY0V2NteVRTZmxLYjUybGxrcjNq?=
 =?utf-8?B?dnVleGI2TXJDQXVieHlQbTI4YWp1QXVZQXJUT1RpYjFSM0ZpSU1rRStlNzI1?=
 =?utf-8?B?TkI2ZDZqc3Zna0U1dFF0OUJDSUx4K0N1SGxaWHB4MWtRK3ZmRDc0R0ZuOGxo?=
 =?utf-8?B?eGRqcDVQeHF4bWc0TXBudVNiRmhIWGRPTTRvMjMrcTBqQmRRRzk1cHA0MERQ?=
 =?utf-8?B?RFBZMzJCeHBJY0NGTU5FUkVDekRORHF6RVhBamJxVWx4dkhmTTRKKzdBS2s3?=
 =?utf-8?B?RFVnak1TU2M2SFI4bzVMZ0w0UkJFWFV0eDU1NW5xbldUK1FrTmpPQUVuRWNO?=
 =?utf-8?B?cHpUWDdnZ3ZVMDJ6cy9pbFRCUHZaUlRxcXc1TlpOZkFBSlRhYlpIQ09KYjFx?=
 =?utf-8?B?TXQ0WVNvREFlVXlZS2lTdEY5YkxONU94ZFFhQlV3VmFKZ2tnVUsySmZ4cHhs?=
 =?utf-8?B?U1EzYlhOKzZBZGdqRXdLamlGUHRXdlZnYkdCVTZ5aUxuRXZQN1RnV1BUQzAz?=
 =?utf-8?B?VUIvZHlreGFYa1lIZnh2OUNLUnp3bHVFV2dpWVM3anpYYlkyNjdvYlR5NlJp?=
 =?utf-8?B?L21qQ2h4cFh0RDY4Mi9TTkNYZE0vb1JPUVNiMm5wVkhYNmFid3pXOFhqZWQ1?=
 =?utf-8?B?dlA2QXl4SVFZU245aThCMmIzSjh1bUsyKytuK1NyN1pEamFWM0N0dHFMMmt1?=
 =?utf-8?B?QWozcmVLaXdMWm5uMW9vTmcwd082ajk2NkZpNzFpOWxyTXc4aU1DMm1ybnFY?=
 =?utf-8?B?dkNFaThxdTVXWFdNY0ZONGs0SGVEU295blhCTU10cU42cTFiaFBsZDlNREJ2?=
 =?utf-8?B?VW4rc3k5Z2RxVjB4dlN0bHVBR1pTVkF3cU4xbEdSdERqQVNOZzRNL1I1R2Z0?=
 =?utf-8?B?cDZDaVg2MHZUSGpVV2hLd0dheVA1RFlUYlhKSjBxR0JOZWdDOFY3c1Ivd3Mz?=
 =?utf-8?B?L0hISE5qLy84QlloQ2g3VWRsOVJhUktDaEJtY3dJMGhRaW1NNk10SDc5a0pw?=
 =?utf-8?B?RXdEMVdtd0J2QmROU1pTTmxQNTRUTjVlWGFKUmlPWlE5RkZsZGdGZHFmdjM0?=
 =?utf-8?B?MVYyRkc5cEFvSEFiNDFNOEZiblREL1hnYm9hbWsxVktseVB4eVEzM1lQZmhi?=
 =?utf-8?B?d3NrTHdYcDNrSExSSFZQT1k0YjRhVi80SWp1RjFTbE5LYU1lUnQwSVVxUTNu?=
 =?utf-8?B?cWhJWW9uaUVKYWtPeEM3M211UmtlYi9JQWRWUDF2U2Nxem5RcmxrV25iZ0Na?=
 =?utf-8?B?ajZGZlZIbVVMY3VQRUtPUS9ZTEpCbjBsblc0QlNKTHdzMGljdWdIVC8ra3l3?=
 =?utf-8?B?WStGaTY2RmVkL1lsV09SZFNxQkcrWTlhanluQTB2d01PSEZrcE9IekhydUhW?=
 =?utf-8?B?U0w2aWhKMFV4NzA4b1JEUVRTd1MxWkhZOXNFV1dsSTVqOWYydGhkdm1abXg4?=
 =?utf-8?B?bTQ3blZxVnpZdElHam5qM0FIWE9VTnhmMlQ4emE0RmJJYkFMT3ZiM2xuQzFH?=
 =?utf-8?Q?/v3g//PPHcoYcDzS2WfXWeI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5abd7a7-0a89-4b99-f7d9-08d9f798f9c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:24:24.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NSBnCVwPYiy/Xom5DYK+QWd6cEVIPwU3j76qPv09dUVErX+ROX5Bf6aD6BHgDD9rsnAlRDjRzRlzVO6ScQq9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4614

Besides keeping things centralized and reducing (by folding) a few
conditionals, this also allows this helper to be put in .init.text.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -744,6 +744,23 @@ void __init detect_zen2_null_seg_behavio
 
 }
 
+static void __init noinline detect_bugs(const struct cpuinfo_x86 *c)
+{
+	/*
+	 * Older AMD CPUs don't save/load FOP/FIP/FDP unless an FPU exception
+	 * is pending.  Xen works around this at (F)XRSTOR time.
+	 */
+	if (!cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
+		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
+
+	/*
+	 * AMD CPUs before Zen2 don't clear segment bases/limits when loading
+	 * a NULL selector.
+	 */
+	if (!cpu_has_nscb)
+		setup_force_cpu_cap(X86_BUG_NULL_SEG);
+}
+
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -781,13 +805,6 @@ static void init_amd(struct cpuinfo_x86
 			wrmsr_amd_safe(0xc001100d, l, h & ~1);
 	}
 
-	/*
-	 * Older AMD CPUs don't save/load FOP/FIP/FDP unless an FPU exception
-	 * is pending.  Xen works around this at (F)XRSTOR time.
-	 */
-	if (c == &boot_cpu_data && !cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
-		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
-
 	if (c->x86 == 0x0f || c->x86 == 0x11)
 		/* Always dispatch serialising on this hardare. */
 		__set_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability);
@@ -796,17 +813,13 @@ static void init_amd(struct cpuinfo_x86
 
 	amd_init_ssbd(c);
 
-	/* Probe for NSCB on Zen2 CPUs when not virtualised */
-	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x17)
-		detect_zen2_null_seg_behaviour();
+	if (c == &boot_cpu_data) {
+		/* Probe for NSCB on Zen2 CPUs when not virtualised */
+		if (!cpu_has_hypervisor && !cpu_has_nscb && c->x86 == 0x17)
+			detect_zen2_null_seg_behaviour();
 
-	/*
-	 * AMD CPUs before Zen2 don't clear segment bases/limits when loading
-	 * a NULL selector.
-	 */
-	if (c == &boot_cpu_data && !cpu_has_nscb)
-		setup_force_cpu_cap(X86_BUG_NULL_SEG);
+		detect_bugs(c);
+	}
 
 	/* MFENCE stops RDTSC speculation */
 	if (!cpu_has_lfence_dispatch)


