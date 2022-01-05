Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D64853F7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 14:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253612.434817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56on-0004YZ-NE; Wed, 05 Jan 2022 13:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253612.434817; Wed, 05 Jan 2022 13:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n56on-0004Wh-Jk; Wed, 05 Jan 2022 13:59:09 +0000
Received: by outflank-mailman (input) for mailman id 253612;
 Wed, 05 Jan 2022 13:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n56ol-0004VU-Vd
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 13:59:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5f423d2-6e2f-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 14:59:07 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-LgKUMkULNFieCDNIM9IpXg-1; Wed, 05 Jan 2022 14:59:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 13:59:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 13:59:04 +0000
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
X-Inumbo-ID: a5f423d2-6e2f-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641391146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOtoJrYnwb+6pTq3iX76gcDNkqLaRj7Wk1Spp/mwh8I=;
	b=LgZ+CB2IfzMOEUEKVDZSS+tZoUF1VGIQZbt1dwhCv+s77/O1Rf4HKyHu8NQrlWYrfaNvyQ
	/VLuIWLYYVAAV8MWAqiKL8niMXShY6oQhRucKbozm6D78yfopBh9zoLsOfFYNN1w64AVBW
	C04JqWqLd/U9BH4LPYd01g0NxMzYe3Y=
X-MC-Unique: LgKUMkULNFieCDNIM9IpXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvmCoBWNuuSiestSOAgqxqBIzCySQ4gysDqAsNpNacQGFNQu/QFTDkXnx9EaWYJBS+9/Al0WiQQNMnaBDkS1S1ZP97+22PrJC/C7Vi+3eQEeBTMPcJK392NdFjuYCsg8BDZ1P38usqkBUB3wAlv1lOHHwlbV98z+iRm/Yf/5hZTm0VFmUhmHg8Fb1uhb3uFe502AOAZMz709X4vP6Izh5pwQwcuADmVPXnd5G/of5ykDczlaCjGtnQHxvR7unFhDFXKdkKQad5XiTGCPlnN5OO5bnDNvj+uC4gMsmFYXVXZjJyzgwr/lEMU10F/Bpb1JlDO+74T/qQn//0CdWJW7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtoJrYnwb+6pTq3iX76gcDNkqLaRj7Wk1Spp/mwh8I=;
 b=iekbL4HYjIXrxiVuYnR1xHRT8q09Ft+Pu8jGmG4T3ou52zOOMLldN7IXBzc/Doe0UaKIcF/t25i4qGDCTIsToLqWf4YP7v4ccqbDOTvgqpJlNvjjte9LOofZMlWi0ZpnNM9gXo5cAljyshAN8U1JmDIKwgb87/xONkVtCiCRdZb2J89jlXoPxdJkXLwNgpVCjgRKMuuvgxMWVn7VJZDCF8Wvw7Zo+p3WtW04mbXBOZpLBTTduSQtypWXa+2REFCD2DpVChenEVAd7HFLL/8CC0i2/26WQ1mvMRhH5M4jX08d+lDSk5EmEKakt7HIfHTBXP7o4E8+Q1ncbm7tqX4UFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a2a47af-4ae1-2fe9-1190-e15b6ce742e6@suse.com>
Date: Wed, 5 Jan 2022 14:59:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v2 3/3] x86/perfc: fold HVM's VM-exit counter arrays
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
In-Reply-To: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0056.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44fe8601-47e1-4883-9189-08d9d05388f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301D8E5F4BCA20B88B5AA16B34B9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PC2+5gDSiJZ8TJzmZs5NzS30mS6LQKLgi6+Lb1j/1t4zd0dA1hn4AElRwWLkJvzmHE4RoPgqIF+iqnN2+OS1uimk5ZsQ00OLF7ar5OC9zDSsWARm9zTEjVtui4jGU92R06LohxLm17DLt2O7mQoV/rDXfjoesWigeKy5fpcYlWX9l0WsPHKxVpY5f/kgbjoJvfslY7bBVDVxCpVDwvh+nPePuh8rE7y6cO58m2z5cSaSALGIOGwyDs28kA8evv1SkUs8DoNwCIFYCQlb4gpBDs/G7Yr540DLrmh0ZpgnPkOKRzDXQcuZpFgWbeUmhDhoUpV1tbFHETW/neauERVkwiWyc8Ga3PA+GMCluA2ZzM0u1H+BlshX/wGz+nEN8RkPqfMXOaGcCtziJnRoc1Emh/1eSHGYjBOqRtNTHMVIGPmKnr5Nrq13QNvVGlGibwaUt697w0a0PJv7vHQkjLzqzmJaIZnz3/h9YM5x4JQbXATAUZ2B6WmMbrZrXtOOmzVURG1+gmm+rMxZ25eDmsQUM3J7SeSucSlyRh7GgU9iv73jTwNEzSQj7YpkZgixrmOjDgiqzbBEaENgiY2tsz3YeMRMA/HCYghk3/ECQILHTGqMUHDfZ9qpFqk/iTQ/h+GTuJdxb4Oethytqhr5ywSglw/5nxe62CJLY3bbzjbXRccWTW97KhxUnd0fHoLRFz/A0UCCiyOwdkzR+bEiPZ2BMDh7yahur5ZnmA/CETLIPbbXF6JE+lxdnHfueMT2zDCh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(54906003)(66556008)(6916009)(8676002)(508600001)(6486002)(38100700002)(66476007)(316002)(66946007)(86362001)(2616005)(36756003)(6506007)(4326008)(5660300002)(31686004)(6512007)(2906002)(8936002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBXZXNiK2Zwd0VwdDJtTFRmVW44VSt0WUppd3ZyNGlZNmdFN3pXSjdqeE9C?=
 =?utf-8?B?NGZCVmtGK3VocHo4MVdEdWc2ak9FZDgrTFlzRDlvU2ZLSldqTEJhVTZuL3FH?=
 =?utf-8?B?ZnRJM1F2cHZXNUVsMGFvTGFqMCtYZUpiUnkxVWdrTy94VzZYdlBrMklQbVFx?=
 =?utf-8?B?TjVpaENMeVEyMi8vc2tmSG5ib1VzTDlscUsxd2VFRGFHV3R6Wmw0b05uQUxW?=
 =?utf-8?B?cnczRlpiSlFNQ29TVU9RS2NVQ1pkdmVWdWl4SkNudkNMTVAxbDhWMlpMSnF0?=
 =?utf-8?B?WHdseHNJd0tGdStYcTZycGFJZXQxdFQ1anEyemJFMk1Ld1Y0KzdPa3daNlFq?=
 =?utf-8?B?bnh1R291TDdCeUxEem5EbFJxdEtUTDdDd2xPZkVEQVUvNVU1NFBhVytGT0pL?=
 =?utf-8?B?VHc3MldseUpKcjZlRjRmSUpLQXVBQmpEMWpxZ24wY1g3aUFiT21LM2dkZXk0?=
 =?utf-8?B?akZoN0tmNm1BZHVPOHZOKzZHRzNnSmxlUkl6Tnd3aG5hdmZ1aEJKcytWOHRl?=
 =?utf-8?B?blRaM0FBeHBTdzhaeGtzRXhMTmwrMVNzUnFwc0J4YTBNby9vMU9idHZWOTMr?=
 =?utf-8?B?QUo3VnJuOGZZbVl0YmcyZW5qZERjY0JWdzVVUWs5NXNiUG1BQmR5TG9Rakor?=
 =?utf-8?B?OUlqRWFySU9XcFBDZ1c4QzJWdi9OQ29JVlZBRFMwbzlEaDRhVHZHQ1liMmlt?=
 =?utf-8?B?MjBVWUdwVk5DdFBHSU00ZEZyODBuWTArRXpQM0xTTC94OEVoSFRnTTliUmhv?=
 =?utf-8?B?WC9ZRzZWeVpLLzIwcC9ueUpBYTk1ZWZBU0JuY2ZnUlR3S2VOcFVUYXRCd0pE?=
 =?utf-8?B?MkdEY05MVTdGdDBhcnZSVllxRkFXOVFCamRQc3BDZnA2enZBekJwNTVjbVFy?=
 =?utf-8?B?OHlHamdUWklOWHo4MG9rcGM1OWhnV29uM0lsdnFUYS9vN0MydWI4eXJuNnVv?=
 =?utf-8?B?QWxvT2xsTlFFem8rc2JpZzg5MjZWM1FuUk53MEFRazNqM2NFSzFRRTNEZjA2?=
 =?utf-8?B?S1JKOGVOMDlqazFBY0pQWVVoQUtya1pnSitjOUJ4b3Z0UHVCem4yMFBySDZ5?=
 =?utf-8?B?eVhnRzdhZEF5b2xUU3JJcWdNSnNNcktER1VxT28xaXJhalBHS0hDVFpLUVhv?=
 =?utf-8?B?YmtUN3dacnRvTVczRTdPeGErV3VSTFl5UnN0VnBZTk5OOTFScWZWUFR0dzN5?=
 =?utf-8?B?T1VyeWVwOTNJcXc2YzZtSmNsYzVLRFF2OHVIZW1reitTRU5QVjlvUHRGTnN6?=
 =?utf-8?B?VUZQSGhrUHZXZ1F5RHI3dFNjeVdKZEJOKzRwSXZ6QmZKTWMxUzE3SytEbTRL?=
 =?utf-8?B?TnEyN3ZJOU9pb1h1Nzl0TDhTclNxRUNSaDFFWkxhUEVYVnVxdENLTFc2Q09H?=
 =?utf-8?B?SzdLOWVxRXo4K0tnYXF2TituelZQZy93U1hBdGg3bEQrU1Z1TDR6UHBZN1hi?=
 =?utf-8?B?UGpHT0IxZUVyUVRiTGdydldLelI1Wmo1aHhZMUxvemNTTFNCeHQ1VlFaMi92?=
 =?utf-8?B?QldMWE5MUUljdHNQVW9panVjNlVSMWxlQjFMY29mOS9TWXJSelo5VnB5MHJC?=
 =?utf-8?B?NmFVMWxQLzBJY0Z6a2ZUSkI3U2s1MkRGeWtFZGdqWGMzT3Bya3ZkcXpMdHVC?=
 =?utf-8?B?Tmx2RmhhWFBITENFczJsUWg1NFEwbmxteWRMQVZQV2xiUG5wQXNnNjJsblVo?=
 =?utf-8?B?a09QdUM1QU15T1NtTTBIenJPYUhNTXdpSS9ZQVJZNDZBU1M2UmgyTmQ2Z1Mx?=
 =?utf-8?B?dFcxMEdTcFl0cWxSdjN0NEQ0d29CS2VnZmxmbDdqaDJtVVA1VXdZWitsT2Vk?=
 =?utf-8?B?akZFSmxkUlpyWHI0THlsZWdrZnpIdTAyQUpLblZJaE5hTTJRRTVMMnBnVElG?=
 =?utf-8?B?d205UDZhMEhxYllZejJ4bjNEa2ZHTVZ1N1kySTU5Q21sbmplOWllODRsTzZF?=
 =?utf-8?B?ZmthaXk1M1YxZFdKTDBITHQ4LytPcVNaUGZtOTJSV053TDVRUjcrMkJacFpa?=
 =?utf-8?B?b1hkS1BwOHFmVWNFQ1ZhbzNDZDJ1Ykk2WHd2VGE3a05QaGpTZ3Q3ZkJzcU9l?=
 =?utf-8?B?N0k2LzVUbmdUR3RYRktCeUc4VldyTi9PeUcrbUFGYkRNakc5eUdncEh1NXZm?=
 =?utf-8?B?ckxIWU5FNGtLMzhQc2R2djRjK3NyVXl1Ynk3bHl6Mk10VUM5cjM4VjNzeUh5?=
 =?utf-8?Q?ryxrsMA2hmZJtZWYU8tRH64=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fe8601-47e1-4883-9189-08d9d05388f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:59:04.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEe2xvOAqtGmFNZS1ZwRYMBvNM9DW+wJtaBniyQKT80hNL3+QthkLBYenTZWBNOBnmHMjhW+zKfogjHp1YqiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

Only one of them can be in use at a time, so make the whole set union-
like. While doing the rename in SVM code, combine the two perf_incra(),
generalizing the range upwards of VMEXIT_NPF.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2644,7 +2644,10 @@ void svm_vmexit_handler(struct cpu_user_
         goto out;
     }
 
-    perfc_incra(svmexits, exit_reason);
+    perfc_incra(vmexits,
+                exit_reason < VMEXIT_NPF
+                ? exit_reason
+                : exit_reason - VMEXIT_NPF + VMEXIT_NPF_PERFC);
 
     hvm_maybe_deassert_evtchn_irq();
 
@@ -2973,7 +2976,6 @@ void svm_vmexit_handler(struct cpu_user_
         break;
 
     case VMEXIT_NPF:
-        perfc_incra(svmexits, VMEXIT_NPF_PERFC);
         if ( cpu_has_svm_decode )
             v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
         rc = vmcb->exitinfo1 & PFEC_page_present
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -7,13 +7,13 @@ PERFCOUNTER_ARRAY(exceptions,
 #ifdef CONFIG_HVM
 
 #define VMX_PERF_EXIT_REASON_SIZE 65
-#define VMX_PERF_VECTOR_SIZE 0x20
-PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
-PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)
-
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
-PERFCOUNTER_ARRAY(svmexits,             "SVMexits", SVM_PERF_EXIT_REASON_SIZE)
+PERFCOUNTER_ARRAY(vmexits,              "vmexits",
+                  MAX(VMX_PERF_EXIT_REASON_SIZE, SVM_PERF_EXIT_REASON_SIZE))
+
+#define VMX_PERF_VECTOR_SIZE 0x20
+PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)
 
 #endif /* CONFIG_HVM */
 


