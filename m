Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E077A4ED422
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296677.505066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZod3-0004Xg-WF; Thu, 31 Mar 2022 06:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296677.505066; Thu, 31 Mar 2022 06:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZod3-0004Uw-Sh; Thu, 31 Mar 2022 06:49:57 +0000
Received: by outflank-mailman (input) for mailman id 296677;
 Thu, 31 Mar 2022 06:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZod2-0004Uq-4P
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 06:49:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5c99a2b-b0be-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 08:49:55 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-mmaVZQTcN369o_P9nvhKTQ-1; Thu, 31 Mar 2022 08:49:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2411.eurprd04.prod.outlook.com (2603:10a6:3:25::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 06:49:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 06:49:49 +0000
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
X-Inumbo-ID: c5c99a2b-b0be-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648709394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YGmDYJFRqVoX7TqiRs6LvG2xNPugw+qDMYWQQY9WFIk=;
	b=mZHAce9eGHWx7uCKMgu9cSQ3wOAnPCWtjToIX92vsmh4wA6MeGsiroN+S07e7eX1YLctgO
	IJVbDmR8L28t7HpckA5ABDnngACRcmx/xohQLg9wYkVBRctq5Bk0C6+zfeNl6PlWy+RgAo
	3bM01O97a+9qnfGcGDKQ/RG1o63hy38=
X-MC-Unique: mmaVZQTcN369o_P9nvhKTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0lNIi00SSD7KLAihSuPtC56hey3IHS9ybT56qvcjegUdhcEl0Xn2GBktLWYySVpmVkYoVfNQlXeGq/Hh4ZvnMrddF1ap+zS+Hg2DqkgS3pXZmzae9j5+9Fqwailm3gNFIkKDtArs66/S8tKE9eBQp0e8dUVGMDreRi8fdvNgmIyvcj+RN1xTxUlfIz9BAik26ZzwiA+W51KCBwJC6+3NRKYTAcmmewNrV8jTVRetL/+QDGu4RdsQTvayURNKmxB0u27k3YNLZIiTAVyKYjyhPG23GoDuZWcxrko8jZ7uDBCC0D98e1XXKM8UlD3msbXCjXJ1zwUkM8rLAet4Jju5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGmDYJFRqVoX7TqiRs6LvG2xNPugw+qDMYWQQY9WFIk=;
 b=hmS8AgoHXHbxS//M+sAxLta4WMgdsxMCwCK0HEVIhWrj9uu/HPmu8qdrN5zaXpp9vfHQWFPXL3WFwyztgz6oFV1xEAxoSSgVO691hx1TER5W8UBQ6Lskac31o4Cky9hAf4aEwmFQXpTrOZGnqqXECGMassguk/mmYIKXF0vzdmVVZglqqoDKvgxAJozVabMyujX1Ttvpdfd+cO1kpWCbTpmR0/pQAufUxgs3/AgGvgOX+pl8s7bX9dCeONyc3DypUeL6DQzzZtQIEqzX2RKIM1MiuICHrwC/kLbWaZg0H0TCzbsByUNSclbpUSrZh229JLD/3hn2irQQ8gB6K+QuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
Date: Thu, 31 Mar 2022 08:49:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bjoern Doebel <doebel@amazon.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19b7095c-e967-475d-4f93-08da12e2a688
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2411:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2411DF74D896816BA340B552B3E19@HE1PR0401MB2411.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tNNXMzUi67svPaTOmGgYs3Rug2i88uX9LFuXBvfhtd+RgWBRm0Ddrlv/e7QpyXvSthZqimc3CMhn256r0GqxSQqpWhIRX8mvkkzj8ugYbLyIiuIpBtyvrOgZHmLxwq0088ygumHETgUzuL/sxzRoWYQENsMPybtZAO/gcseszAZCdU5hdZTh3Dza0mdPJ6WLYE6Kl9Ye085em0aRyRxPsOWLM1WqVXdh0nYP0HLeSH2yV9lWbYDsjfIheTvOMreTjflYxEz/2ai2N/+gUTZAfJj8RXu6iG5aqyhD37TfBMHReaa0Wj/lDINHaahzj8Dmb/xGbQQQ7NJoFa9fm0n+HevDpkqnZr+lzH788vuPrPpSGWJFP0vJrfl8q99B30qUGpBuLyerEq7ih7C7nGfbA1CQQD/QHv5QtADntn+2KaSfO10wA41/9QHMjFcRh46OcX8WJ3W75Y3y7E+NhaqSa28/zhE2Ri6MWPiNFIF5g6p3Za0UBejK+2gFZP/ox9Sfclvn5L6d98rFrDAfYtG9uq1T7cr29NkOsi8zNCpwBbUGDJHTlTPdBxEfMNnbDAW17/mGtrNljnyIWeMkYJOjoPvXmq4cEW3dmCsouIIU0JC9l+JK0WIWw28XuVxobo2byvlZz2zJRp6gCkaunY8rMagQlqlU6J6wwDtscLOl9xnMsn3l3s4MpgpWN4C1TMicao4W4/wVqzpuNn2R8tQ1+zIW5mMLWdpwqarOfFzqWz46+4as4BATbFsore46rZB/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6506007)(2906002)(5660300002)(86362001)(36756003)(6916009)(316002)(6486002)(508600001)(31686004)(66946007)(2616005)(8676002)(38100700002)(66476007)(66556008)(83380400001)(54906003)(15650500001)(6666004)(8936002)(6512007)(4326008)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVJUeU8yK3JCMThpRFBWbStma0MvTGpld09wV3VSNnJTRHE3Q2hzbXh1V0VV?=
 =?utf-8?B?UG1tRk1TSlU5bkNCNk9KWjZXQVUzUzUvd0V1UC80dCtVczZySEs3aklmRlE4?=
 =?utf-8?B?MGZrSFVRaXpNbHJNTURLcC9SeEdrZU1acjZQSUQ1RjN0azhVV0NLRkN4N2dN?=
 =?utf-8?B?NnJDVXZtbGZST1h6bUtPZHltWnNlQlB1akRMVVFncGxQaEhGRUZ2clpnWUlU?=
 =?utf-8?B?Q3Z4WTRKakt1TTJYcTdwSkw0dTNkRVZCSnRHSE9wTkVTdThpcEtoSnJobmQw?=
 =?utf-8?B?bDh0bzUwbHZhbTAwUmFrWHVZYzlWbFhBZzVlemlPS1d5Vis2eEVBbzdTZUdU?=
 =?utf-8?B?T3FzeW40bExpSHZIcnkwN2FDemE1TVBwMHc2OUJhR1Frc0V5WWc2RXQydHBJ?=
 =?utf-8?B?ZHdteXlXbk9uLzAvTDhveEJPVy9DMXNtWVZqZWZIQXJoT0RicjdXa0xYTFdF?=
 =?utf-8?B?REhpaVhGbmg3eHpmS3FoUjJFdExFWGV0RDVQQUx2dUFzS3M0QkZudE43Q3N3?=
 =?utf-8?B?VHBIbFJqK2VzcTRFc0k1T2RGZGN5VERGN1NTWlJBWVA2ZUl2VXZDNUMwY1NN?=
 =?utf-8?B?dlc5UzhWc1lZbFJRT1pONDlzelNnWGdtQlJ0dEc5SUpQY2I1M01TbFNuMkZm?=
 =?utf-8?B?a0JyM0g4SDIwSDhTOUR1dDhkRUt2cUowN3lYQVl3eGZrOWM5engrZ3hxNEpt?=
 =?utf-8?B?cW9RTVRzakFVbUhNb051cStwcE9zRm9lam9uc0tRODltc1I5YU5vUUFPWjNs?=
 =?utf-8?B?NjMzZEtBVFE4ZE1iWW1HQVEvaHNiU0d6cmx0cmEyQm8wNmdYNUxDM1JNKys3?=
 =?utf-8?B?emNpL2h5K2hQVEVOQXlIYndSUkZCN0MvbW9NMWNQVDJLZmx3NGYwaUtSTUs0?=
 =?utf-8?B?RmRWcENUUi9hWHNKMWJXZ0VEMy9nYTVlWmRFOXRsU250OTFQUStZam9OL1lV?=
 =?utf-8?B?bSswb0JmeUxSZkxGSGI0WTJEVnhJYkxoR0ZTVFV0eG5ycnNTSzlEa0hKNDRs?=
 =?utf-8?B?TlF3dkxtNDRaN2ZwWDlXMVdHeXJXTXd6M2dZbk91a01iRnJjMEgrZ2dMNlRP?=
 =?utf-8?B?UVR6NEVoaEVJclZPS0g1eEMxckxiYUcwWXlQcUhVWk11cHdKeVgxN0UyYTBG?=
 =?utf-8?B?cUwvaURxNFFBejNsYWtKZ29rOUtheXJtSUk1dTcrYTRPUTFpMEMrNFh0d01n?=
 =?utf-8?B?bXlNaDBEWGY4dUZlV3djR2VtRG14b1hMcDdKOXk1ZlVhdXkrSGtlUUxsdFJP?=
 =?utf-8?B?OVBzbHV2YlBldTRhSE0rLzJXYkFGeEZGODNIdnp1dUlYMVNOcks5bCs5a0pW?=
 =?utf-8?B?WFdQN296OGNISUpjQjIxZVVCc3pJa1poTUQxSDhORDAzM1lKbi82eGd3MWlX?=
 =?utf-8?B?eTduT1FXa0dBRGFNdnRaNzIrVFZqSUdaKzBlem0rdkhYUm9XQnVKdEYvaVZT?=
 =?utf-8?B?dm91VWYvNVJoaUxtck1jbGcwSG5ESEZGODlZdm1ic0QrUkJiQkxnZVZRVms2?=
 =?utf-8?B?MmlEUngrUmRISFNXYVlPTm9lbzhFbzRoMzFTMHBQNTVYcW9mQUhseEZtcWhL?=
 =?utf-8?B?azhjZFIyYXYvVmpVYTJzWENSNEFpUUhkN1ZTZEU4NU4xWkZwNUFIa2tFdUZQ?=
 =?utf-8?B?K0JUbDRiQlhNb1REb01hNmVtS296bE5TamRkRnNIS0R4UUwwS2JRVlNHbDhk?=
 =?utf-8?B?cFp5b3h0SGIxazM0RjBHNlhJdXcrbFRkTU4zV01WT094ckhORmJzaEp0Q29R?=
 =?utf-8?B?RHZoUUFDN29aZzVmMDJ4U3FMNlEzYjlIS3p4Y2hCYjl6dUsvNUNSYm13RlBP?=
 =?utf-8?B?em5ZNlpyWGhxelZma0FqcEV5dGVyZldDaEdCaWF5RUhTYVBNb3Zaa0xoYU9t?=
 =?utf-8?B?MXhJV2hQamZxWTMvS2R6c0xBWFFoN095SHpZUG5DcFVGWUtOMXo2a0JxL3Iy?=
 =?utf-8?B?NEVPOUl2TU5LSmpRMVQvSHhEelZQR2xwK1dRTmVsN3N5ZGFuRzYvQXpZVXNP?=
 =?utf-8?B?b3o5RVZ1RDdkVGM2TVdyYkxld1NkdVRTNzB6KzUrSlBkVHJEdG1YQlh2Uk53?=
 =?utf-8?B?ZTJaSTQrMTBmZTNqbGdTc3hEUHFxeEhSaGQ4OHhMdmJHaTcxbnVYMTFhc2hy?=
 =?utf-8?B?UkhRM1E2WFIybWFFNHlrMmZGdnFEL0R1a2Z2ZGlKbzZyeUFxQi9DV0RjSDFx?=
 =?utf-8?B?N05TMDhWd0tvMkxzazdDQjVrdXl2TDBvT3JGNVpMT1B2QzVJN09wWXNyeG1m?=
 =?utf-8?B?VENGSWxxeVF0R3RjTWpZRFhic1pPd0w0NTZuMUF3cEQveXdVWmFBUWRWYzdr?=
 =?utf-8?B?Q1ZzaDRRMGpHNFJZR3dZc2xscHM0eHNPZThUNHVmUHNPT1hCb2E5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b7095c-e967-475d-4f93-08da12e2a688
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 06:49:49.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp1hoIRdZxN1Tm72qcCmq2zY6gyZ1F0W74/Pmk5y7lzJcVARIA+T3lGCXLa7hTFWZdNMvujFMPR8yEk2tFRrkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2411

While not triggered by the trivial xen_nop in-tree patch on
staging/master, that patch exposes a problem on the stable trees, where
all functions have ENDBR inserted. When NOP-ing out a range, we need to
account for this. Handle this right in livepatch_insn_len().

This requires livepatch_insn_len() to be called _after_ ->patch_offset
was set.

Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Drop 1st livepatch_insn_len(). Drop buffer overrun fix.
v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
---
Only build tested, as I don't have a live patching environment available.

For Arm this assumes that the patch_offset field starts out as zero; I
think we can make such an assumption, yet otoh on x86 explicit
initialization was added by the cited commit.

I think there's more fallout from the cited commit, but that'll need to
wait.

--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -145,9 +145,6 @@ void noinline arch_livepatch_apply(struc
 
     func->patch_offset = 0;
     old_ptr = func->old_addr;
-    len = livepatch_insn_len(func);
-    if ( !len )
-        return;
 
     /*
      * CET hotpatching support: We may have functions starting with an ENDBR64
@@ -160,6 +157,11 @@ void noinline arch_livepatch_apply(struc
     if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
         func->patch_offset += ENDBR64_LEN;
 
+    /* This call must be done with ->patch_offset already set. */
+    len = livepatch_insn_len(func);
+    if ( !len )
+        return;
+
     memcpy(func->opaque, old_ptr + func->patch_offset, len);
     if ( func->new_addr )
     {
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -90,7 +90,7 @@ static inline
 unsigned int livepatch_insn_len(const struct livepatch_func *func)
 {
     if ( !func->new_addr )
-        return func->new_size;
+        return func->new_size - func->patch_offset;
 
     return ARCH_PATCH_INSN_SIZE;
 }


