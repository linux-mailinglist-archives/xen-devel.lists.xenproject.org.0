Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3B4D6263
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 14:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289032.490326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfK4-0007Ir-Co; Fri, 11 Mar 2022 13:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289032.490326; Fri, 11 Mar 2022 13:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfK4-0007Fm-8D; Fri, 11 Mar 2022 13:28:48 +0000
Received: by outflank-mailman (input) for mailman id 289032;
 Fri, 11 Mar 2022 13:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSfK3-0007Fg-HP
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 13:28:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d68e693-a13f-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 14:28:46 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-yCitXWhaNTaPuZK36NXK1Q-1; Fri, 11 Mar 2022 14:28:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2569.eurprd04.prod.outlook.com (2603:10a6:3:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 13:28:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 13:28:42 +0000
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
X-Inumbo-ID: 2d68e693-a13f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647005326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oB9UyoUTlYD7+jOARvtGocxIQ/b7yV0YHAi0kIcsud0=;
	b=bjjeT33WbtJms+PnDPcFu3LUPsPFlUeFCu3lDTEBTUGxUfLDAeUQLbCWbZSmhH528fm8/i
	0LdtX3CzFrn6Rsf5HSsr0gwiGGJ3cAT/IAo6A7gJo5Q5/Ll0Xwl9MXyev+3sGCBbeEKpma
	NKfsUwtQHJAm8+DgmkY4hjKmWG4cGt0=
X-MC-Unique: yCitXWhaNTaPuZK36NXK1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYJVjNXBBJdwj6kC0B8Yr+BQgQ6HAllLUvQufDBT0YFZcG6q6mMNCst+fFchvjHGQvb76Fit5p9+9+Wd1MyNkmui0AjaPlg4g8UgbhXXvYqkMy2ulCbYqhWE0hyvotHh/e/uRUoAxibTxEzQn40TGZej0Zjx9h/fpIMqjkBdvvGipnezDwD0p3m91kwlTFjL4GkzCSqBA8T7r6TuDtKSOXbMwbtlt374YhVxQGc4nXsWl4NlHKyoe+EL3p4JXsmijncPgOxXFSSkAzuE7d2V5EZp3KqLSouxaBiW3oGWencgrTW47Obyj0Lz/PGH8rKlEizDrPv7w4m208G5pXnOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB9UyoUTlYD7+jOARvtGocxIQ/b7yV0YHAi0kIcsud0=;
 b=kZb+zeekyDAP+0pZOtfPEYcRrszixBEJe+WcyhTxpESxrsxed/P+tR3CBs1y4ni37odAbyG1KuphjAjDPt6nuFbtRmR2fsi0uujk2paSfGlK853+CO6CBX0t7KeaPvId0VFGQvtKo0QupMxlYShfJrsFXFdkOcVuXuP7Pdg4kEiykVBdCAdYa4FM/KmyBqNrVf1sk0PlCCF7FUKMEwvdk8IvkDRTJWPVIY5hqaKBAszItZlpg2ZQ3iv8lTQbpcuu2OyCkhrPeICX1eY25rEb9Lmo6+CMCZ4Y8SAJn01I0+D1oYqZ4DSONVozXoLv4vvrKwZ7JVc3+2N/pqT/dl+CEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
Date: Fri, 11 Mar 2022 14:28:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0056.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b981e2d-df7d-4d32-3c5e-08da03630f95
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2569:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2569F517B262CAC4FA8A975FB30C9@HE1PR0401MB2569.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rlaI/TW7tj8+B7Hz4DCXnyYmnVoVbVYY8WXTSatMoAwkthNjV+Lpj2zcuyF0mVdCdY29eiNrVtyM5xxFs5pM+MPXvr84L4W0GHL/Lj8QnUOIdMBPQSI/MQYJUd4prNrfvW402g0tN/c4k4A4S7jQD2zEhSqzjkGksrEtatTN5mZ5iNbHRlhN/SrpWO7Q1vGdzOlaWznwR3ss3ppH+w6aaczWj3IQ/l6TV5Az8FHr/eCy2eIwzYQJc8w9LjvPS6jhSvVn2MjZAO5UA4VjC+xlOmmvlhF2rSrtofDjllDTHa3QEUh4SYaKnGeEsiEGHQUi+OlLg99z4mU1MutHcb9OTsPOgDZk99U/nPfHmzWFwRKlUQF0344NLsggZptYojGLJu/zKmY7GzzMmPJ3s0OpzNbxQJOrji7xiPpIWJwWUDnIiuXB4lPorKjD2eyK1+HWsRt+kpTtVKNl7wq4ClUgDSfwzzhlQU/rLFJ4yWrEaqaO6ZEYu8jere+9RUaVm7KIpquhykkB0vm1DWv20yNbniPNcZ65b5mgimis/5BYdq948Dc8xrEgQdX9s4wRoEko7Oz0tqwjTxCIBL8RMrq+O0RLdsehKeMGwTuMEf29RHUcHNmBsLGLHTXqis3Or9j1StnChTfO2PGvUN4QuRzfDHdWcF3gW3detbV8ebVsI5sdoBYx4A5qz46hYJ71ugiXO5t0wJG95LZ8Rri6aqD0EgTCdvXVEuq1cVL/xy2GCa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(6506007)(316002)(508600001)(38100700002)(8676002)(66476007)(66556008)(86362001)(66946007)(31696002)(5660300002)(4326008)(8936002)(54906003)(6916009)(2906002)(2616005)(186003)(26005)(31686004)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJIQXZMWjlJeUpZMlgvUm1ORDlDM1kyWnRiNk5JbUF6bEkwMVRQRTdiaHVx?=
 =?utf-8?B?Y3I4RFNONmdqZEZWS3pCd09nRWhYdU5ickxLUnNjclhwUXppTjJGTHpLelMv?=
 =?utf-8?B?UEpkclppdXFFRzcxaGhCRHB3Qm0rb2N3UkVNNXlUbVQ2R0RUbWU4aW93SmJC?=
 =?utf-8?B?MDZwQmhMVC9IaUtyVUd3L1NhM3lkUUk1SkFPcnhaM21ZajFFUUdFd1BxVjdl?=
 =?utf-8?B?OHR0dEUrR0prTkw5cEFSSnhucExrSUF4ZnJiM1lGcWVFWlJUU0plWUdqUUNW?=
 =?utf-8?B?NTV1ZzZJMms5eUJOUnpXRUVLMFFHNVhPS1JsUnRZVnlLb0cwUjNpbU5XaTB3?=
 =?utf-8?B?ZjdNV0YwS0sraUl6ZWY4N05yNHZIV0hRNlhLQlA2R0hhajREMzZaSXRaYkVz?=
 =?utf-8?B?VDRjU1VNU3JlbFlHWUoyT3F4NlZ5czF4LzNOWmRlNEVtV0ZHMExNbE9zNmly?=
 =?utf-8?B?NHlIdmpucHk0ekNXdVFYQkdwbUFVVVVlZzRnRWI5S3V1SXpZUG12Y01ISkdG?=
 =?utf-8?B?Vlo1M2JZaUJpY2o2cExwREJXbmtiekFrOFBpaEtZeGg0aXdQZDluY1JubjQx?=
 =?utf-8?B?Ukc1ZnM2ZU45SGluWSs5VGJsbFUzQ1NBL2szZkp5VDZJSlV0QXBBYkFqb0pu?=
 =?utf-8?B?TTZOdFNNVXM3cTluckVjeE51eG5Td0dVcytsNVRCakt3SDFGaktPVTRZczJk?=
 =?utf-8?B?Q1kyc0JpWDVQUkhKSXQrR1dsZmV3RWUyNEQrQVE2U0wxOGd4R2gxVlRoYmFo?=
 =?utf-8?B?aEJhbGtNWG1YRGgxUG14NE1kSllIUk91aG5jcndLT0lLd3lZbWt4bThuUCt0?=
 =?utf-8?B?NzYycHZyVGw2UEdoeXc5Tjc2TnFRRlZkU3FUaVQ2TFd0SFJPOE85QmVkUlF4?=
 =?utf-8?B?d1k2UmJSZjRIRzZaOURZcXNEdWNubFpmYXpMVWgvYTVhYUU4WjZRcWY4S1hC?=
 =?utf-8?B?LzBIY2lHSDlvRERpYUJFeXdsUHBIZ2VVVDR2b05CdXZGbUNNaVYrcEduTElC?=
 =?utf-8?B?SEVoU2pYRklUTjRHdzl2dkl2TzJoU2k2K1krQ2xQeFNkWE1KYnZWYmJncUJl?=
 =?utf-8?B?K04vVGkxdnozZ01oNGxkcWN4RkFqUXVpaHUwcFh0cHZsTVZUNXIrSDZzNkVk?=
 =?utf-8?B?Z1ZIN0p1MmNxVVJjZEtKdG00b1duejBRUC96N2JYS1RuLzRFTGhkRzFRSE1G?=
 =?utf-8?B?RElXY3JKZ2FWdE1Ub2FTMGJmSHp0UDAzYXMzdmU0YmNmNGtRTlZNUTlSZ0Fa?=
 =?utf-8?B?WVFCV2czWlZpZzNCTXJ6ZWZmWERnWTlZNmRkeW41MmZQWW9lQlpFN1Q4ZC9q?=
 =?utf-8?B?WVM2MEJmSU5vdWsySEF0a0NYL2xaek1EUXJJRnpjL2JRTDhhRDlaenc5aFg3?=
 =?utf-8?B?V0hwWkQ2MFBWdzJtTW9LUS9sNjRwVlUzWTQvMEgyWHAxb2N6blRWL1IvUTNL?=
 =?utf-8?B?SWpnbXF6NnZXOUpML0RaRWRMemNmbHFRYVIzOGNtWXY2dnZQR21jS2cvc0ZV?=
 =?utf-8?B?bXQ0clN1T1poOC9QYXNSR3FPaWtKSnNGYUk4Zk9jeEQ3MXRFRjVjL1JidnJD?=
 =?utf-8?B?OVpIL0gxQkhkbUFiMzlDTkJxN2o0R1N3bktQbGd5N0RiVXRJZlkrUlY4Vmdt?=
 =?utf-8?B?U1dvRmU4YlN3VzFPNUJsUE43WitTUzFkemtFQ0ZCWVlFOFR2eFB4NUpmVDlK?=
 =?utf-8?B?a0hCR25uZHVienBPaVJ6bFAyZ2IvWVNESG9EeTFpdUJmYk1UUmFxNGxsU0xT?=
 =?utf-8?B?TUM3dFpEZTd3OXAyenM1d3BBU09mOEFrN1gvRk1BcEJUM3pVQUFxNFFZejBT?=
 =?utf-8?B?TWpBamZsdHo0QzZSWHFjTnZ1TTcvU2hTcWNQMmF2T2IzNHF3ZURKbFh0RG5y?=
 =?utf-8?B?enlraGQ0bjA3MExBT1hIcCtMaWpxcXFZanh1dWRiZXVxSXN4Ym41aEg0WTRq?=
 =?utf-8?Q?DG1+pXOz+JR0KC7JROGmkdruTxVDp1+q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b981e2d-df7d-4d32-3c5e-08da03630f95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 13:28:42.6461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW8KFbyFTHy17yP0bUWSwmmVPEu8eZWf2y/Y9lREPLxEXhSnmdIpup3ex8hDSpVZV9znSrQ9IqgGAvs7336Dew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2569

Support for this construct was added in 2.22 only. Avoid the need to
introduce logic to probe for linker script capabilities by (ab)using the
probe for a command line option having appeared at about the same time.

Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),y)
+# While not much better than going by raw GNU ld version, utilize that the
+# feature we're after has appeared in the same release as the
+# --print-output-format command line option.
+AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+else
+# Assume all versions of LLD support this.
+AFLAGS += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+endif
+
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check := arch/x86/efi/check
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -30,6 +30,10 @@ ENTRY(start_pa)
 # define SECTION_ALIGN PAGE_SIZE
 #endif
 
+#ifndef HAVE_LD_SORT_BY_INIT_PRIORITY
+# define SORT_BY_INIT_PRIORITY SORT
+#endif
+
 OUTPUT_FORMAT(FORMAT, FORMAT, FORMAT)
 
 OUTPUT_ARCH(i386:x86-64)


