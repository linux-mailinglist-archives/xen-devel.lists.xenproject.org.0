Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDB538554
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 17:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338655.563455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhdb-0005ei-On; Mon, 30 May 2022 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338655.563455; Mon, 30 May 2022 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvhdb-0005bU-LK; Mon, 30 May 2022 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 338655;
 Mon, 30 May 2022 15:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvhdb-0005bO-2O
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 15:48:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04031bf0-e030-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 17:48:57 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-jq9NEEMyNX-mOzY87rme2Q-2; Mon, 30 May 2022 17:48:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4792.eurprd04.prod.outlook.com (2603:10a6:20b:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 15:48:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 15:48:53 +0000
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
X-Inumbo-ID: 04031bf0-e030-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653925737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B+nWreY+WnPK6i+bgNybqgeha/kLJooNellhfaQljnw=;
	b=VPzmGzugkyGxFQbi4mktpruLI8VjNFB3Hx0arxv2dCsMF3mMgqGkUzlQHKzxYs8TimhJhG
	Sm88GVcqGfmTIfTJ84sIL6qWQPvIGh/YpKhhioHF761/ghpthKexYD0rrpFC1JiVr5XhFO
	yX/KkGIRC8OxLq+yMPVZV8yl7CEqcA8=
X-MC-Unique: jq9NEEMyNX-mOzY87rme2Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfMQ3DlNN+E+/Wb/zPc9IWWCco1RX9KFpZmxVXot0lAwiFSmiMqgbP/rF3bcrxgtaxBHcCTHllTU3WPCM1ALeAYGy7eK00iINAPA1mqfKsOJMhCV/mgyOEgblCEN39Gh6PwhTXCjcJxRaK5IMIUqKBRjN8VWIaNOUYX2oTg4Q058ThxYht6YJeBYAVOiURnPDRvVmurt5QcOnT6Y6BMmG2jSAJ67TwpODf9jXAZSGGNTH+evk3fyAo9aTsH48a74DXAVDJwA2IboXnATXNZj+q2j6Fb1vEwIKyr3/eOr7dNn5ARuVumrWFSE2UkIc74QwMnmRoPzWx6A8L51B8DLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+nWreY+WnPK6i+bgNybqgeha/kLJooNellhfaQljnw=;
 b=f0DeWM2JaYqkHqQ8EBd107G2dqiaiqAQ07/suu46Vzr4AP0cnwhhPXtT1Ae0ivJbQX7G47UkwfhfCIsydqfINIPCMlyApN0rYuncnfElD/+6KnWhbodqO7DavyD872Xq8gvyzRPtyUZF3yGxTPySk7sdo72fvnBzEr9XgXFMbmeRiTqhkr+uT+62BUMAhQ9gN6nlo2+TFiUSkuQ4A7V4fl1P4iclXcXeTzEkwycomg0N2c3uTqwkwssdFyXkZ2XNnjX5v3/fkx9PFGxKx6HW0OguF4+Efln+wpNovo5lQ0/CBoSHITsyEFKx9FqnVv/FzYarPiQfrMET5UMHPEUR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0fa2f54-e7a2-67c7-e611-69abdbb6829d@suse.com>
Date: Mon, 30 May 2022 17:48:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: harden use of calc_ler_msr()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0752.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3983341-f833-48b9-4a81-08da4253e608
X-MS-TrafficTypeDiagnostic: AM6PR04MB4792:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB47921947D980D6C0D85E9645B3DD9@AM6PR04MB4792.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6rG6lX1tPOj+t45PRbp3rBohxVnIPT7PXQUzloxlJ72uf3t/6tJrgoxpB9OjCZS7UW0rpiLQt54I7haO1fNqTo04PfzSGhgpOH1K2PbkmptwxnDVXwNBiiKj/FrZAjOt0Rbey6xUoBis2jgSg9XCwKVR+FpcvgM/+yc0jhPAMSnKmcsnC4fZSTVk1dQBs8ZqxMcPFpyoVR/LESBI5Sl+BmvT0czHRoHKNBnfHf/zbhrs4NEWvg+IdK4uC1CdYnzK/8co4Hx8O+lpqfiYxy8fnRAEAPmjt/pjdwSfiESLPBOof7CQJ+0FJ5Z0Q6jrf6tyEnLXuVyMon528fNUsiwCQ2B/2H5X0Zy9RKpFHK5YSZvy3GC/RcZoW+EwSLsfVLth2M9l3PBqBlPl2u0x8cgrhLM+BImKHTaIZUedmzZHMP+Pjt/j28VOr5GjLF+awM72ZMgLRcxUTXw/jwjgdCMZVr0aGr3b8XbJzFysopYOhGTxbmarONny7WtFdJmahaHy3Qce5KKqZgIfGSVz2dNroQODis8JbecsDuMn2mkoDT7jYm0aJxMrHfQObE4YgAoyaq1VfeAF40m6Sc++f1Rdfrb9d2JYv4+X9LjIH6QL+AA3sBsmvdq5m/u9GTNIImyjoaduy3SjidnO7OL/fsfvVM/4bZILA9i9dRYT07wt+RzP8YMcBrZZtbJB1EX/LsnjNCTsEXbbjxLzF16FzuQMvtrrv3b+vdwrTVaCN09b73ogeMyIg0cUBu4su8mMjIsu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6486002)(6916009)(8676002)(5660300002)(508600001)(316002)(6512007)(26005)(8936002)(38100700002)(66946007)(86362001)(31696002)(6506007)(36756003)(83380400001)(2616005)(2906002)(186003)(31686004)(4326008)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhybzE3MWlXd3JiYWtLeTJCVUhwZUVvUFE3M2hZbSs4RHdaYmdTbGp0cktH?=
 =?utf-8?B?RU9ocXRhVk5WUlhsTkxjL0tnak1ja0grRlZtOFh5dndrQk4rYlVITXM4bk1S?=
 =?utf-8?B?S3E1ZXJ6VERoc28rRnFBSGtxWG9aNjRpbEdmUVIwSElmQ1FpS0RKUWVuR3Fv?=
 =?utf-8?B?M1RYVzBPSEwzSVE0TTRzQkJrWVdqOHl6dFFQVm03bDQ2R0R0YjVFVjRSeVZ4?=
 =?utf-8?B?a0p5cjBwRVJCZExRQTIxYWhhWDQvTWFCRnNDTk9uMVpsb3ZxeTQ1K3RoUnow?=
 =?utf-8?B?NklWbUdPZkd6bHRaTXJpWVgvSkx3cUt6WXlaWUlDRS80bW1USzhSb2p0dGlZ?=
 =?utf-8?B?LzhmcUhla0Z1dUlVMWorM2t1Zlk5Mk9QNXJVcWN4ajhxbWlobG5IOXJoM3Jw?=
 =?utf-8?B?U2dhdW1oRGh6YkNmOVBob2dlUFJEV3JCMUdmSUVxZ2tyMFZnd2x3TEJIYk5l?=
 =?utf-8?B?OWcvbzk5OVhxVWVka2Jzc3ZQNnNOSDNuK3k1K3V2aG9RN2hPb25UbFhheHQy?=
 =?utf-8?B?Z3BpU29RTnpOWS9mMThXckt2N21qN05MeE0zbms0NGxncTVia3R4MHFJcWNt?=
 =?utf-8?B?dzViQ3I4S25pMmovNlZJQkJBK3JMSGlUSEtmRjhLUFZRY1cvL2pWMVF1b1BX?=
 =?utf-8?B?RkQxd21VSTZQeTZYSFRNTHU0aExKdGRVMDZNWEI2UzFvQmV3aWRDc1FmSW5N?=
 =?utf-8?B?V0M0NWdPM1VGWEhZSGJXK0llcGkwOEFYUThhOTR1TDRsU1BZZnJTYTk4Wk5P?=
 =?utf-8?B?Z2JWNHhNTm4vb0k3dGJldlI0WTdMYmJMUHBpZUNiNWlIZ0dvcXlwWldteUwx?=
 =?utf-8?B?cUUxanJMZlBseGlmY2crVnlaQ0lnRzhlb2xpQUliOG1Pa2EzcWVtV1ZuSWNS?=
 =?utf-8?B?S1dSUXZoVWZTM1VaSnFrVnNXd3A5NlVGSDZmR3NYaDg2Nit5aG80QWFoYi9V?=
 =?utf-8?B?bnFJaXZ4SkRjLzEvdTk1ZFJ0UGprUlZSRHVEc3dGNFBhM2JSR1RqeVYrNTVL?=
 =?utf-8?B?M2grb3J3K0x2T0JCRDRzenpFWm14ekJGVW1KTEMwZURLRHhRS2pWTCtINmhK?=
 =?utf-8?B?L3FBTW5HT3FaaEY5VHNvWXFiOG9ESmdJK0w0OXkrSWlqOWdCNzZTMlJJZkNo?=
 =?utf-8?B?T3J0RXhjZnRQOUFwN0ZIczBuMGlNd0toZHRqdkJvVVFRdjFneVBuWjAwYnQy?=
 =?utf-8?B?SHZYOXF5cFJuYWY4SkNxQ2MwSUtndytCZzBuMUE2dXIzTlNSeWd6OGxxQnJ2?=
 =?utf-8?B?aGxFVG80WWJFNTJmQWxBUS90aWltbktyaTUrR05pSjdQQTZyVTlmczNxQ2dY?=
 =?utf-8?B?YmI4bHVMWU5GRGxZaFc5ZmZqeUpLZmRWdFRtbEg2WFlHMzZxRGlpNmJVbFU5?=
 =?utf-8?B?TFBWRWhlbTFDOWROZHhDNE9KbitTSW43aGVHVnFNcGxGTkhrRVNCaTV5bjEx?=
 =?utf-8?B?ZHlkQitmcHdJdDg4MC9aSFdibk1qQkQreGE1ZE9EbjkrOG1EWnV4cUhPNytW?=
 =?utf-8?B?NXRFeHVOSEF4Z0tEL1A5TjNMcnJldkxBZTBlMHdOSlZDOFp4QmJpQ3drT3E1?=
 =?utf-8?B?eGJoVlZUeDJRYzU1eURLRURORkQvaDlLZEl2aEs3UXNVL0hkVjNqUUhlVXQ3?=
 =?utf-8?B?U1VKNmtGNGtuNVY2YzdiUW5WRTFEYlpmd2RFMHN3OEwxaWswMzE5M2RkUkpJ?=
 =?utf-8?B?dzFJeW9Rbkcyb3M4L2FhdFpJaVRSMm9oODhWNTF1OHVib1RCYU9lWjQrbHpv?=
 =?utf-8?B?QlFCWENXZUEwSDBIb1NLWGFYeUFHaDZmUEtRWWJGbkw1T1ZJVkdEVXpzbzN3?=
 =?utf-8?B?Qm5qbEgvMlh3VGQrNlNMMDZNN0dISy94WmZBTExLK3owbExMcTRJUmRvMktm?=
 =?utf-8?B?YnRleTFPaU8ycDBMTWIzTHExbUJZUUQ1TVBwQ2cyZFMrdFAycFZRSjYwNjRS?=
 =?utf-8?B?SzhDWklMSnFnWVdUOXNiU1RHeG5ZV3FIT2Q3VHZlMlljWWtqeVpZR2phOXBL?=
 =?utf-8?B?cjAwZVlBOGdiOE9Ld3pzQWRuL20zNFovK0YrVTVEVXYrcEMyaUZkbXJ0WDBM?=
 =?utf-8?B?bHMvcnYyS3dMMHF5VHMzTDR1QURNVjd1QXU5ejhNNktQUERTdmk5TU9jYjk2?=
 =?utf-8?B?MytjYStzek1EajUzbHZyVTZCeEx4T1hGRnkxL2F6MkkvY0VkVEE5cGtLL0Vs?=
 =?utf-8?B?OHN4Mm5aZGxpajdWSHVDcWRMQ2V1YzJTR1NzRDVkdisrRXExWk1GZG9kSEtY?=
 =?utf-8?B?K0QyVDE5ckhuV3J3ZlBlVG1sckxuMEMxSjU2cWtBUVA5cU5QSW5USEVxOERX?=
 =?utf-8?B?RTVYMzZ4cGx4Qlhaa0VlbkYzNTFjQksvc3lIUWNsWjFPSU1ld1ZVZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3983341-f833-48b9-4a81-08da4253e608
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 15:48:53.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtTEUDspO5nHE7JbM00u2NfwOvZSEdXma4jOYovewPSRBZuWL9OKVjFzty7Gkxka+pqucCP01FQlWDdGa1xUCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4792

Avoid calling the function more than once, thus making sure we won't,
under any unusual circumstances, attempt to enable XEN_LER late (which
can't work, for setup_force_cpu_cap() being __init. In turn this then
allows making the function itself __init, too.

While fiddling with section attributes in this area, also move the two
involved variables to .data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -126,11 +126,11 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_p
 static int debug_stack_lines = 20;
 integer_param("debug_stack_lines", debug_stack_lines);
 
-static bool opt_ler;
+static bool __ro_after_init opt_ler;
 boolean_param("ler", opt_ler);
 
 /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
-unsigned int __read_mostly ler_msr;
+unsigned int __ro_after_init ler_msr;
 
 const unsigned int nmi_cpu;
 
@@ -2133,7 +2133,7 @@ static void __init set_intr_gate(unsigne
     __set_intr_gate(n, 0, addr);
 }
 
-static unsigned int calc_ler_msr(void)
+static unsigned int noinline __init calc_ler_msr(void)
 {
     switch ( boot_cpu_data.x86_vendor )
     {
@@ -2171,8 +2171,17 @@ void percpu_traps_init(void)
     if ( !opt_ler )
         return;
 
-    if ( !ler_msr && (ler_msr = calc_ler_msr()) )
+    if ( !ler_msr )
+    {
+        ler_msr = calc_ler_msr();
+        if ( !ler_msr )
+        {
+            opt_ler = false;
+            return;
+        }
+
         setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
+    }
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);


