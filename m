Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630864853E8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 14:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253604.434796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56nO-0003LW-Ur; Wed, 05 Jan 2022 13:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253604.434796; Wed, 05 Jan 2022 13:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56nO-0003It-RA; Wed, 05 Jan 2022 13:57:42 +0000
Received: by outflank-mailman (input) for mailman id 253604;
 Wed, 05 Jan 2022 13:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n56nN-0003Im-8H
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 13:57:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7218c0fe-6e2f-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 14:57:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-oLMNv7RKMf2yc9KG15D2YA-1; Wed, 05 Jan 2022 14:57:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 13:57:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 13:57:38 +0000
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
X-Inumbo-ID: 7218c0fe-6e2f-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641391059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfO6hMu+j+6AmU2LVFQtGR/ZVgz/9AB7/U+rI7fXn+I=;
	b=bwIjFz44/fCijYUI4xAonv3exYe9s0wnlJ3z+V0YRYxGfl5a/6Fk3gLmkkuru5DhZtHfLY
	w5n2q8Rl5zuKVa1dLt5gprLkT98DaVbuL+3Rhwb/Po2REkJqDe1bJ3ODmGONugqn4GmZno
	g9TjrpggdgZjHp7reHGWwCS/jdLW+i8=
X-MC-Unique: oLMNv7RKMf2yc9KG15D2YA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3SpFfead0SkPqEqOEk3nfjGwuiCdjyZ0IrXVAy/hMVXbns4OSDWCdbvOaKJq17Lj8xhITJEYaXRm/El+395sDrNKRUQFlUgRUjDG5SGntX9GKycgTg25u82tp3FgCy1QfzEc2Q0e8q45niYAdZx+W/2RQm1xR303mxU6jG+GsW7o77MhFWvNWw02n5jP3K2FsR4PkIpZ3Q6+6QI+IwiVhPkIAQLqIGn2MiMOOKcIoDyAAtSaO7gztOp4oXcphlIvfisODGTgPqZ0vJ1E2wYCQND5tf+OmMHbCXqBbSKFprOXimlqftK8hB/PH9zp45apQntNJHm3hKb0X8SD/YFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfO6hMu+j+6AmU2LVFQtGR/ZVgz/9AB7/U+rI7fXn+I=;
 b=Pge43x3gUHvdCLY6ED7YWAthFDbY8SeAHSNpeqcYOSwuqVP3+Xe/CKaLso0h+jgoxS7EGKmXs3qM6dPN8RlUe02L66LytxZ8MGJGixfi5B4yeMJMAklXhnrnpMtAL81P41raDMV+HmipF+6jbI52/aiF4aSUjYrgJzip+eRpe9HcA5DRNyHl7EM2Y168/7DPZqjtiSznzyPYSmnLCE0dSFHXhH75pYhibp0LzfjeFS0YvOOygiJcz1qyOF44X0LDJkTnrhMU8d/A4MpdX8nEl5/LZnUPufII/9IqC2Ptj0UZBlS8ecaIJhWLXikVNIyOXHCAGQ9MbjK9qH+tU5jaXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7955e956-c619-38ef-618f-344f16fe6517@suse.com>
Date: Wed, 5 Jan 2022 14:57:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v2 1/3] VMX: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
In-Reply-To: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf4d4d8c-94dc-4d0c-c1ff-08d9d053550e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44459760F70292CD1415E219B34B9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vr9ZHUd5M/uTn7Vuzzsw3lHQBn2iHltWdEYXi3PQoc2VVkj0P0JBrUWOkD6W5tIknIjDyCRTU6RZFpukH/HTkEB57ZHsL+92Q7yTO8kFPf8ZINzn882zI0elJpuCsmGxoJFmQq6cTdfoHOHDyGs3dfUj2pfaacBqnJT5PcrDRA9tCvgtxgX00ksP0vC8M/jWFnI9ZqCarQGz8cQlrwdI1emr9rUOeNT8hXnj0itVV2qewoHl6mg0ryX51A8bEBbzzDUesekzkUtTz6rdyi4TI+SKxq3E0p/tXnzivhrHAIlIOOV2Np4jdgn+Yj1gs5Lp6nFraXSKw4Eg8op1M92DY4iKMZ0K9d6g2tikkeIZalERfwUw+fPnNISs/yWvjKvweKxf565OoHp4cFNFE74/6D22YjALZf5PbLqpyG36FsvqfNMd7WnaZTf15QvzJiE3fKjG1WfCN5jdJWAgKOz1IiuC8+asA3iwqNIQavxlJWJ18NQQz2soltapOl4bRgUCAEubBZOmkO6Qqnfq9cIRKKgRb+OfqXAgvmzZAft+YQlE4bMjedmpOnKx8S5oFJe7Dnu3fMWVh6mPVfCH2a7ZTUJCh1wE/NzzS9+RvoSWiBh7ypYQTBw2npQmThij1nAJ6/uoVMl8fd8cxLndrcG3o9mMubLNCRu328DOkWnV4iXuqbnS2oUDct1u3DtQyaZed45+lq5Jmj5heboIlu1m2/nqlO+NAQ0UMqiNbSSTxCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(54906003)(6916009)(66476007)(31686004)(8676002)(26005)(2906002)(8936002)(186003)(6512007)(66946007)(4326008)(6506007)(5660300002)(31696002)(36756003)(316002)(6486002)(83380400001)(508600001)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3UwSVB3c1R6YUplTlZoSVRPM1ZjbkJ3a0hkN3E1QTJOMTkxT3JwMCtUL2lO?=
 =?utf-8?B?c0V0QlVVODJ6Z3FKaU1XTm54ZHMwUU1ud0FEUnQzK0l4bnBxTlF4ZzU5Wmlq?=
 =?utf-8?B?RUxESXBKSlhZb2FyK2ZVaWMzR2lIS3BsMFNvbnFaV1ZPOUljelZaRmtqUm9p?=
 =?utf-8?B?bVlsUkgwZ01GcDJ3S1JZTmtmRzdFcktuZTN3MEVncFliam1SVnMrWmhmRTBN?=
 =?utf-8?B?UnlZUTZXejgvcXVWa0ltazlSdktWQ05FWUsvS2l6QnZFR0tQeEw1RGpZSklv?=
 =?utf-8?B?R2ZydFZxUjI2TUJDTEJFL1pvV3V5dFlwOXJrenRPSFBkQnhuOUduN3hwU0hP?=
 =?utf-8?B?M29WS2ppaC85bCtoVnlWdmNGdWhkRnd1cXhxZ2JDeWhjQlliTkxTVzR1dExJ?=
 =?utf-8?B?VHk0WElBOHR6R01RR0ZaVWZDWlZ2aHBad2ZhL3NIVmZITEhUQWlhOEZXMWNW?=
 =?utf-8?B?eGRpQ2JoS2JDTkxZR3lBaENVTGo5WDlSUysvY0dpOVlvNUxOM0NoQVAxZ3Jk?=
 =?utf-8?B?TEp0Y0FMVVNwMGExbnVyT1k0NVJ6bUs1bGthM2o3bzR1ZisxYWVkcDZ1bFBt?=
 =?utf-8?B?Unlad0Z0eFZQN2FaaUVEN0t0SVdrSmxEUzkxdC9lNmFjY3ZLOWNhOGVJMUhk?=
 =?utf-8?B?emF0WnFSNnYybC9tb1RGUGFpaVZTNnFYc21GV251ZTg5Y3BlbHN1RmwyR055?=
 =?utf-8?B?ekt4a3FmMHdQR25PS3F4TG5QRW8zWDg0c0FQWEM3V0ZUZ3I1bFhoZEVwRDBB?=
 =?utf-8?B?R081QnZZZW90eUNLeFovYU1zT041K2lTUXBRYXFQYlpLbzMxNGViK2Nrdm1V?=
 =?utf-8?B?T1kzMlB0TnVPaitGM3ZyTVIxTld5REt0VnFZWWd3R25MK1d3VEh2L2cwMkp2?=
 =?utf-8?B?NkgwQWoyVFozVE5aSlBRQmJxcitOV29qaEZHb1R6R2pKZnd3Z0ova2MrRWIv?=
 =?utf-8?B?ZXdyN2tTeGdKU1VxTWdmQ3cwVGtPaHNybDFQWG5Nd0wzanNUYjlENnpScG5W?=
 =?utf-8?B?eVZzNEF6Vnc5WHY2ZExGOEZMUUN4QkZSQy9CcFcwTlhVWXdwcmFFNnI5ZmhQ?=
 =?utf-8?B?U1gxOEE1VTh0dlg1cXdHZjRWTldud1ZldFZOUzMrYmFSK1dyVjZhWUNpcy9I?=
 =?utf-8?B?MmtXQnVjOEtacm9zVmFxSFJNWGhsSHhTOXVQMGtQaWpFRzZnem9kVndNLzdO?=
 =?utf-8?B?b1ZSQnJSZUU4VnFSbk95VGpWQmhIU0pVN0dBbWwrQjJ5eDJzZU0xenhhN0xV?=
 =?utf-8?B?dHZZd0podVBsZERqalk5dEsxaDdOWFJkeHdHbjNQenEzOEZQYmNYNWF0YzJQ?=
 =?utf-8?B?NVdvNWY3dWZETWdTS1hpQUE1bW9NRDZUWURYOG9heHhQdm0zTEgyOHg1amJ0?=
 =?utf-8?B?aGo1ZkI4VHVVNFZoeTFiQ0xyRnhsUEg4c0E1MkVvYjhZVTVWNXU0WVJXcXNv?=
 =?utf-8?B?aWNsODN6N3FDL3M2RGsrVUM0SThtSUVHdUZybW1iSFdKbjduTGNXVktwL2JC?=
 =?utf-8?B?cHlUSzZGeHd0eVV2SE9iR2hjMEkrNlkzV0RFYnZsOElrYnhkbjYxRXFFSWZa?=
 =?utf-8?B?YTFtSS85TG9Vdk1QVGVJR2p1Wm9zbG9QTGZYQlkzOFU0SFJBa0F4RllNOS9G?=
 =?utf-8?B?Rkh6dWtvbTNNVytwMDhKU3g3YjRqRTFqZnByL2RaVzVhNnFCSDBEdStlQ0l3?=
 =?utf-8?B?WFdQUFRzenRqYmxpRGIzTmZvVXNSRzk2dHVib2NHbzVnYzNSTnVNQVN0VHBx?=
 =?utf-8?B?aENYWXZPc0Rxa3NyME5JU1o0cm9yMW0vbGtqVGlkb3N1d2JmWHRPb3E0RkJu?=
 =?utf-8?B?WFk4R3BIZ2VGSDhZdVVDalFOZXpPbVNFWk5JNC9PblhlWU9QbU5VSDkrdnB2?=
 =?utf-8?B?K0hNMHF3Q3NJMXFQTE80bkFKdzBXc2lpclBGalpheW5EcW53VGIvVE03eGRq?=
 =?utf-8?B?WWNaL0l0Vlhza2JFNHZ1RG1iSTFYYmtBc09KalhGTGR0VkYxRFQwckp2K2Uz?=
 =?utf-8?B?WGVVdzJ4a3VSTnVxVUVCTW4rMWFxZHpNTHk2ckxJb0pNWXJ6bXhUVDNNVUhQ?=
 =?utf-8?B?SHRFWGZWT09nR0xSRUt3Z0QzTTAzMTUwU3pXb0lScllJUlBsVTQvNzhmQWVi?=
 =?utf-8?B?ZWxsSXpXUmsvQUtjUE43cTltTW1YbXAxUWhBd2diYUM2bmZ0Zks0NHI1aC9h?=
 =?utf-8?Q?3Be5OGdqCAWOjG6MXxxbIIA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4d4d8c-94dc-4d0c-c1ff-08d9d053550e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:57:37.9178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +24NBXRupR94C3M2NQ5OIQyU++g0E6xSvCBVsYXI3YhQ6iWcx/vKXKtc6l742zUwVsfhTdFIgBZBdoDoyMProA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

This has gone out of sync over time. Introduce a simplistic mechanism to
hopefully keep things in sync going forward.

Also limit the array index to just the "basic exit reason" part, which is
what the pseudo-enumeration covers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use sentinel comment only.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3869,7 +3869,7 @@ void vmx_vmexit_handler(struct cpu_user_
     else
         HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, exit_reason, regs->eip);
 
-    perfc_incra(vmexits, exit_reason);
+    perfc_incra(vmexits, (uint16_t)exit_reason);
 
     /* Handle the interrupt we missed before allowing any more in. */
     switch ( (uint16_t)exit_reason )
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -219,6 +219,7 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_PML_FULL            62
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+/* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
  * Interruption-information format
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 56
+#define VMX_PERF_EXIT_REASON_SIZE 65
 #define VMX_PERF_VECTOR_SIZE 0x20
 PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
 PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)


