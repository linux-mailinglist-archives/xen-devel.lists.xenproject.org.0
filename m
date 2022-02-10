Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3E4B110C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 15:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269887.464040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIArr-0005G8-29; Thu, 10 Feb 2022 14:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269887.464040; Thu, 10 Feb 2022 14:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIArq-0005EA-Ud; Thu, 10 Feb 2022 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 269887;
 Thu, 10 Feb 2022 14:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIAro-0003wV-JZ
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 14:56:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 989d30bc-8a81-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 15:56:15 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-5VJ5TEBbOs2s_-h9RH1w1w-1; Thu, 10 Feb 2022 15:56:14 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 14:56:13 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 14:56:13 +0000
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
X-Inumbo-ID: 989d30bc-8a81-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644504975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5zMM3qKdb6oVy6iS2IeBm7vTPi70YImKG2OphmjMjY=;
	b=gwrQP7MHythQtvnvIzAB4mt2BSeUmbB8BVoyWbSkcMN7OfpM6C+kJw1/MAAIV3Z726T/7c
	NXm+gFLuInPnBCRUh0nJUhjFJSw3etN4LkuUJJNHMaGv5IcnlptBkbmJvLKTEb/9C67EXp
	DLfW3ExJv+N3Dw8/OKu52kCba7F7H6Y=
X-MC-Unique: 5VJ5TEBbOs2s_-h9RH1w1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOL2RxalxbJXiqJO7LoesobC6ldSk3kT9B1nHUf2BB23g+/DpFtvbELlTB3bFHzv4cTX5lyN61Jmy+GHwyLS8ATpeL4qbtLRwWQn38cICDi42wxdWckjCTiSSFN94POmkiS2vRcGr0gSxmme3H3y5fy82Xu+d3WIecyVzHNOtEpd+njef19U2NS+fg2dLu7kjU+scjrRo65gv1diZCnm3E4rhtwVXfzwds5K2uuO46a+a8yEV/Ggo+TQAB3zB6HYAmXzZ60noqc1OZSA9AIbS1v101RXiRl4CTR19jdU1ELgSxn6Vyn6CyTpdwLHrdhw1IsE9vA6UIXvC+RH206iKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5zMM3qKdb6oVy6iS2IeBm7vTPi70YImKG2OphmjMjY=;
 b=nCujtQU5viKNhfguBQQYW87CQHSO150Qk8NkY26zLEm1fny41yDBMJOFcoU3YsjD4/ma6jo72JV1cPVQ+mJTMt3BB0QwGJsnijhNssKK8RVVYJQ1UXfgbiqQgcHQdVDIxeucNjBXkz/lc3wFdqbxuLtdc9VhCW436RUumkXx0KkU/isGTwHXVu4ZiOut46+CW3jt0e/EgzfPlMu2+MPHQ6IDxbwL1/xJ8fIuxs+PDTBv3gqhivZD2SvudA7ebzbLAseQN24rrzhG/3be/FSAfK1MSNR/NjuZ/NdvN6ySbRzRb7aTKW9YI2gwkMwupFfMZnryGdD9Fdzh+Ko8owzaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c16c2c4-0943-1db5-e22d-a6e1ffe5d00e@suse.com>
Date: Thu, 10 Feb 2022 15:56:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH 2/3] x86/Intel: skip CORE_THREAD_COUNT read on family 0xf
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
In-Reply-To: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb6a289-30dc-4b35-f13d-08d9eca57b6c
X-MS-TrafficTypeDiagnostic: AM8PR04MB7443:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7443E64E94EF7D011FC7FDEDB32F9@AM8PR04MB7443.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4SyDc+UKdaSHwy8HYua6yKeMfH97RwbRB8cOjqhH0XReA/KcMi+OyScGOmzQpk2Hnx4fSPSR+rj8a3DcQUh125XFTG5MCtja5ow0FTemE4/nlQi1zkruGpZwYNLEWKaaECACHhAayt6brxY2nrLgAccVUP2eOBz5nHT4cXMvzbcnMxOfY3ZfLS8Gti5TP38kQ44UZNU2/DHgLlG5u6Wy7Mwwl8Ys1xr/H6pGMOiHAnXAGDl0OttdRTH34/I2v20BxHYhzp3Z0prBZiUpf655wPVKti1MIMBKIm2+bw+wcAkQSt6nkxP62Si+jG9g8lIyozkVyTxU7UJbedg+FyJ6mprBH1S2QRUIdU4lPRsDy3siTzB5BXYf+GH9iDFh1sQM8neVQy6d5KETzXE1/EuKJhbUFR2B0PBemmzLAraUpozkZRAg/bEwzwnncP/m2Up9YPPOKooot0zkQYHJyVxXz5ukHK+ZMvOkjwsLhbZNPeGHsqLkk7KEd5MOWPbBCer0BSkqZz9y1Uy5EbJY00uZh4HE+aaQF+60QnhhFZge4vnreERjQbQMOGnI1mItyaii6mL/Gf2zj07sbnQFr4u+qR+Xv4mcS+FJAkmeY2Ja1pjBPCNEPqH82988Q69AC5vnDGtcrA9BcwZ7z3T59OdGg4Z7j2dZul3EuSOIEdKysZiA3sm4tLh8qeO0cVQfWTr5V9sCI0GH5beqWNdxXs4rK7GWYQE6Yxaug7dZ3ouJb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(4744005)(6486002)(186003)(2616005)(31686004)(26005)(6512007)(508600001)(5660300002)(6506007)(8676002)(31696002)(36756003)(8936002)(66556008)(6916009)(66476007)(66946007)(54906003)(316002)(86362001)(38100700002)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VndrRXN5TVRKNExGdTdzYjRDWFllc1FCcnlGRWU2dXBSSXZxQWJ2VS9ka2Ri?=
 =?utf-8?B?d3owV1JZWEVrYmRsMWxiME0wUEUyTXljY2FEZzkvV2p3VXR2TFdSNlNEdmFB?=
 =?utf-8?B?K3U2Q2t6c09RYXkxSkQ5Z3RpSnMrYk1zOXlPcXBkL0pNSWgvSm1uOXI0N1Ba?=
 =?utf-8?B?ckY1QVRxejNuNEErU2RXallIZVJZTzJjV0JrWlJLN3lOMFZJWU1Qck5vQzhi?=
 =?utf-8?B?NU9mZHpBTDAxWFNOenhWTW1GazlzZDVmd1FRcUZHdDBuUXJITWI4Z1NUc1Bx?=
 =?utf-8?B?dEJtYmxMZkgxeWkwUmtCZTc0MVZIT2QrL2JqTWYzOTAwQ2NYSmpYOS9BSjJ3?=
 =?utf-8?B?elZJR1l2aDBPQmVNeUJNSDVOcy96OW5wNzBiZ2JJV1M2dm9NbWMyaHJCazE0?=
 =?utf-8?B?cTVBc0xXYWJlcWxGcHVVUWFRRVFTUytOd2o4MkRLMkZmRFlLTmYzMk81YVM5?=
 =?utf-8?B?ZWhsYnQ2Z2tVQ1A1VHhET0RNTnA1em5neFFwNE1weGNPbUhJM1Rja29JOE1t?=
 =?utf-8?B?aTVhRWpVSktaUDV3TitmSkdZa2pEdkNGRTF5czBLdGx6UEJ0dEZIU2dXTmc0?=
 =?utf-8?B?OVRoQlNWTmNjSnV1T2QzVDNoQ2Y3NUpiYkRiSW51azNkNGpnUEo0U1p3ZXY1?=
 =?utf-8?B?dmZpRitHdjJyR3BEL2ZuSCtLSUJWZzlVT2lpdjJQVUJFWEhqT3BtcSt1NXB3?=
 =?utf-8?B?cTR4Y3VFUmRQTTQ3MUZPUGo1UGxwb0pQRnlKNnQ5S3drOXA2UVkvRHhtZGRF?=
 =?utf-8?B?Y2VRMDhVQ3AzeEg5dmhxcTcvUzZOSTJad1Rxdzd1WnRwUVVXenk1WW5ZdzYw?=
 =?utf-8?B?Snh4REhZbG50K3MzWC83VTc5bTNWRmFtdmNKclI1MUtwVEVnNWk0djlRREpx?=
 =?utf-8?B?MjVneFlaM3R3dXlLSTJsR1hOQmd0Q296dFkyYnBMckxUTGM5dURMQlFwYWhr?=
 =?utf-8?B?eURONHd3MThuanpuTks2MHE3alhMaUhleHJ4SGlsd3FwK3pXOVFoWisycnRJ?=
 =?utf-8?B?UUZEejVOZzI5NzdNK1c4WnhaenZ4RkRROXZtNWlPOUUvcGJNTnJWSUloNlhz?=
 =?utf-8?B?T3FBS05lYk1ERWZnOG02bEtOZFh3T2JtdlFReTlMaWpMMGp3SWlYY1hOYVNY?=
 =?utf-8?B?Z0ZOSXZ3NVphSEtQd1JncnpyaFlmOEpHdWpHRHNBNEVMRmljZzNWc0FaWHJa?=
 =?utf-8?B?U3I5VDAxdDlYaUYvdzkyT1ZnbVgxODZpa2RWcmRNNnNPSHNaTm5OOFJxWVQ3?=
 =?utf-8?B?UEpqUERtdHRyQk9GRW1tNW9qSTJDWFVITktvQXV5OW5UYlZRb1lSRTZWMFZQ?=
 =?utf-8?B?YjFHTFhwb3RIaENnMDlWYms1b3g0MVZYZ29LcUtVNlFmNnJLQUlydnNtYXlm?=
 =?utf-8?B?dFBRUDArY1hGL0pZWk0wRGZ2cWEvR1FFbGNYa1QvblJjTWFWNGZEMkNlMTFS?=
 =?utf-8?B?c1QxUktBU21WQlFpSStzdEpmem9uaEEyTVp5ak5GOVM2NzJkc08wUDFnYkNP?=
 =?utf-8?B?TDMwbzhhQldtbkFyQ0RlNjQyNGN1ODUyYTEraGZIbUw1UEpRR1dMTC8wZ3Q1?=
 =?utf-8?B?RXJOU3kyU3dUT29WRndEM0ZXL1pMR0ttOHdiZ1Q3ZkFrMTlsUGNFaHU0WGJa?=
 =?utf-8?B?NXJHd0g0bGRlVjJpaXM0RnlzYWNiWE1venBkUi90eHVDRGgwTnZQeHE0UEJ0?=
 =?utf-8?B?KzlQVlFrL3dCc2tSWmVISWRUcjd1ejRpUzRwbzdsRVlFYytraW1mcGlsZ1dP?=
 =?utf-8?B?c0RxM011aTgyVUxsVHNxOTM0WExCT1o1RXZoN2czQkVZa3RpdmhLNm1Ndm15?=
 =?utf-8?B?Umx6YTJQM2tzeHgreFRkelJUd3d3OXZoNWp3eWtDcTBocEJ4SWROUVpDQVQr?=
 =?utf-8?B?VHJKYmdsZ2xORkhoTlZZOTZadW8rblhjZnYzL1l4TW5yL04rekd4SGcwdEgy?=
 =?utf-8?B?dkYxZ3UvS3RmU2dnK2V0aVorY1gvZXk0Q1pIYnVFQmsvbHNNYU95dkRMNFlV?=
 =?utf-8?B?YUl0MG5id1FNc0RMMHhmTzRaYmE2TzJNNVpKRXBzWURXczZkQ3YxSzBCQzRB?=
 =?utf-8?B?WVZiSEVIb1kzRTVNRElyYWgrZDNIVDRYU0lMNjB0TEp3U1ZBK01YODluOFVs?=
 =?utf-8?B?MEJWWXdQbjI1cnFnV09NNmx6T2dDK2RGM2pmbHNZQnp5Wm5WaVdCRmkwYW9H?=
 =?utf-8?Q?Y9fmBgjnn+U72BF2YtGW4bw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb6a289-30dc-4b35-f13d-08d9eca57b6c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:56:13.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s50CwxQrHxCE3aNif6wOaBG9n+aq/DeuSq0wwXbcH5f4Rpda1q0RaL0ZEbtw7EE+ujDrpzM3CJusIMuXC0pjmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

This avoids an unnecessary (and always somewhat scary) log message for
the recovered from #GP(0).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Perhaps even use "== 6" in the family check?

--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -453,7 +453,8 @@ static bool __init check_smt_enabled(voi
      * At the time of writing, it is almost completely undocumented, so isn't
      * virtualised reliably.
      */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && !cpu_has_hypervisor &&
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+         boot_cpu_data.x86 != 0xf && !cpu_has_hypervisor &&
          !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, val) )
         return (MASK_EXTR(val, MSR_CTC_CORE_MASK) !=
                 MASK_EXTR(val, MSR_CTC_THREAD_MASK));


