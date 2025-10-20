Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5296BF1F99
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146457.1478881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArPa-0003Qj-5l; Mon, 20 Oct 2025 15:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146457.1478881; Mon, 20 Oct 2025 15:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArPa-0003PJ-2D; Mon, 20 Oct 2025 15:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1146457;
 Mon, 20 Oct 2025 15:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BTWa=45=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vArPY-0002uw-JB
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:03:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddfb8c08-adc5-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:03:00 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Mon, 20 Oct 2025 15:02:57 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:02:57 +0000
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
X-Inumbo-ID: ddfb8c08-adc5-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UR/LmzUqD9oc3FoGiLVT3+pmEEjF5iZCLbqlXPh4vHgOjORxQMAMjG98HHhrBt8SQ/BZyAJihcmYobxU04XFcYaRumMKG/dTQh6tvHY2zOkdDcGP4TQIztZtgeholu4M76Wic/Lex983nheMlSkoqv5UexjfBFwVHKvhX5VaGwj6OxBMyJ5OuQeoyBeCccryAtkYhFZjuUGuLRKkuOmHhrAL0RCy9s1TW1dfuJcZVvp1zGMpDiX017HqVgvZIdx+HeOybWJx3O8fShYWtxYN15yi/zCQlokYxbXvp/cOSTNrNJTUyT1ZuL57iYW6zAAZz9MVzZFKdR0CxU17v1DgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUbRl/+Ktua4Xwc7LTUR4FaE+k9ELZBC085dTtOk1l4=;
 b=gH70cTYaeJq4kfl4s8uAGmrUY3nhLEl4msGJCJQA8rXOYwPonIfjHSiYR/GSCzyH5lmVviZTOwy2EhwSn2p3zY5B9jkmy3Xwk+kQWrFJMx8WSJHVmK8fLPGdNZmUXMG5lFl9CpaFQmGsaR/KVNGOIJ6AJWSkTgPRTbtL4+808oS/tB6cbZ6VpWSn5ZAL0ohj/YGQdmHRPufVb7B0ndz/Y798VRjj5DEV7fTG7d2I86Lw4s6R+gCqA24nLcOfWiavZkiQ4rAIHfjn+/7y49J7Qp0jpgfmsUT6psB4gi0ESSFI/ZbaUsTSfVRFc0UBEPK63kLbAvUMqMCmo8Z3OmONWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUbRl/+Ktua4Xwc7LTUR4FaE+k9ELZBC085dTtOk1l4=;
 b=tRSEtQDm53O4P1gJ8X6Vjf1TGWU66vK8IbDs7uS6XenTwBZnQJ2bjsfp8svWAnVj6v2Z7P/8+0nwwf2ErBlPCDsyVCfMdVIhg5au4eftu3bJoPZCiuUJfCaeMgZFKwilcOm/fYUjkibPjCETlbCSPMlaZQ7qqytvOBRgIeHcZ60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d6571dd6-5471-4c3c-a538-9c37b4ae322b@citrix.com>
Date: Mon, 20 Oct 2025 16:02:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/ucode: Fix missing printk() newline in
 ucode_probe_amd()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-2-andrew.cooper3@citrix.com>
 <7c387055-0bb4-486a-997a-25fe0a5f68e1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7c387055-0bb4-486a-997a-25fe0a5f68e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4265c7-995e-4cfe-be71-08de0fe9c08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T05aZVZ1K2RISGdlNTE4OCtaQjlkejM5SVVaWDk0QS9zWVlJU1lEeHVTRGVJ?=
 =?utf-8?B?elN2OUszTENrTWlPNHh1QzFFSE9zSTBGUEdTcHZtMHF3VnpNVkE3eVliTHdU?=
 =?utf-8?B?M0oxam0rQ3BaWGI5dzJOQWNibGdsL2F2ZEdUS2xFTGdNWG5LOUt2Ym0yUVlY?=
 =?utf-8?B?QnhQTk5mM2pVMEQ4R0N6YlhiNW02MmFnTWswWG9YNlJMbjBEME05VEVaWVpS?=
 =?utf-8?B?elg1cHhNdlN0cEhqYUhVTUtoZitodGNlZi9BQ1NTQjJzSE1sVjl4d2pKSVBx?=
 =?utf-8?B?dk1icmZIN3pUbm0xbFJHbTRIb2t2cUlXSEppOVBES2MwamVOL1ozV0djNmxP?=
 =?utf-8?B?Qzl0UkQvMkVYU0wvVWJGcUM3RXFVVTltZUkxcjhJaHV4OFhCdzBmMWo0U2dI?=
 =?utf-8?B?anRhc21TZ2p2bmxyMWJPcG1sUmowc0pqYTEzWFpYWi9VL1hjZ0F2NDFPRWJx?=
 =?utf-8?B?TTVuV2FZZ3BrZkd0SFllOXRZWXgrb0JBNHNPTEFVZkQvT0FNQUVkek1iSllF?=
 =?utf-8?B?TWFCeFpNK09vbUliQS9QWVBxS01tcVBKZlZxQkg2NzNJek5TeHd5QkYrY3pD?=
 =?utf-8?B?QmFsTGZZY1hpNXUySEFKclBUeiswZjRERWRDZ1JHYWFJVFU3a2RqWFBPUFlx?=
 =?utf-8?B?YXBMdXduUVdkZWJoU2x1Yk5KQTlSdGQwbkkyL1JXSDBPQXphUW9iYTBqOHlh?=
 =?utf-8?B?T2NlVnV2RW5qdnY0SGF4Mm1waDdUSS9GbDk5TFc2NU9tVW9uL08zaWhSTjE2?=
 =?utf-8?B?NDRQQm85UWdGT0oxZUg3NDVBSmhidkdCNjZBOTFBTU0vUHc0UklVQitLM1cv?=
 =?utf-8?B?eXh3VGtPZy9MMjRhdVV6ZWR0WnV4OHIwWGNoalIzSjFhV3RQeWYzMTAxcWFK?=
 =?utf-8?B?aGNFenVBb00vMER1Qml5UmwrQVF1MHp4VEhlTUFNeE5WUmtiSWh3aVZrdHBT?=
 =?utf-8?B?b3VFMmNMNU1EWXlpMGptcTJ6ZVFKNTRINXRZaU5hbG1wOHZqZjRhWW00MVdz?=
 =?utf-8?B?S3dWSEV5VzRDcFVKQkthZUVLTHdrV3NEUytySlRJL3BlZ3FXUkxtOWhsbFZX?=
 =?utf-8?B?d2hmejlMYld4RGYvT3dtamdyLysxZUQ4T1BiRmJINU9KM1NGenhUeFB5NFBr?=
 =?utf-8?B?UW12ekhpQnQveTZVcmJVN3VwSTJiYUpjeEtNK2pPQ3UybkxoQ0dhbmtXQlc3?=
 =?utf-8?B?VUp5YkluNklnejlZMUs5T2FlY3pTR29IeFVsK3hYRnJIcEgyMlhOaU9UQUhX?=
 =?utf-8?B?dXAxejBwdDYrYjF2WGF6UnV5azB2SFdzOElVVjZuemhkb001VG1aSWI3VEpt?=
 =?utf-8?B?QnJzNFlWaHpvcVM1d0FrZHZWQnBVTmJGTmRyc3ArMnZUY25UVVowN0VzN2xC?=
 =?utf-8?B?amRTMk1WaVBWT3RTTHhncFBaUlVCQWtSWmp3QlZZS2FmbENXZTdHU3gySXlq?=
 =?utf-8?B?UUFqckZjc2V2OTBwbi9tUmNwV3BGdTZqSDFhR0RKbHYwVTFXYms3L0RUbWJ5?=
 =?utf-8?B?YlA5OC9wS2tiSUpUWjBwL1pnSlRpb2xQVGZySHprczVmZmszdXVJR0dBVmtJ?=
 =?utf-8?B?RXdja2syQVFvb1Y2eTJNNFFVd1Z4VjQ5U2V1Rit1cVBVMUdienYzVU1tM2Vp?=
 =?utf-8?B?SHBHZ1E5WkMrTEVZWkVrcDNuVEQ5SHlsZVhEeGJmUExqZXlYZmpyMkZScWZx?=
 =?utf-8?B?U2duZllNdGhEOE1PV1MwUEI2bjMvUStzMVdrQjc4ZHYyM1hBQ0s2eEZaOS90?=
 =?utf-8?B?QXFaZWVpbkNqaitJcnZudmx1YUhFOVh6ZUltcW1yc25nK3h0YmtlV1VUU1Zq?=
 =?utf-8?B?OWFONjZPTGlXditLaXRTOEJPTy9rdXdveit6bjVHMTc1SGxoeEVobWNlSjJm?=
 =?utf-8?B?ZVd0QjBRQzEwdW03anhGbXEyR2x1aGpJUXZDTDdwcDcvOGQ3SGdzRUduTjVp?=
 =?utf-8?Q?mPTyrublByTKy3qk4mpGGuycCTYXv/ua?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU84eFNKbkJmeWgzcGtndXFXY1kwYWt5TFU0b2UwRDlUclV3Y0RRa0EwMW15?=
 =?utf-8?B?TVVSQ3JYNkNmVENqQWI0WHc4YU42L2J6ZXdPcVJ2V0RKUE1sTXR5YnBUMU9o?=
 =?utf-8?B?eWNETC9vOXJGMFN4UnJaVDZuZ0ZkbFJkSnErMHBiKzNiUmRDVWN3QlJHbVFl?=
 =?utf-8?B?QjVvcnNOM0hBU3k5OG8vQmRCd1Bndm51c2xmNUdvQjlHSHJoVHBSYmpjczBt?=
 =?utf-8?B?SDJ1WDNGbStmLy9VQlFPcDVCYUVMOEFFc0h4YTBZUnk4UFgxbFh3T3A3UUpy?=
 =?utf-8?B?QzFkVXJwOXBhSE83QlhENlp4TmpNdjZVa0FZQkdQSUN3b2wxbER3WXllZ2tP?=
 =?utf-8?B?aGlMcVplMS9yUzBqdDBoL0RNbWhVWnRuZWtDcUtEbWphMTRkK0Z4Q00xejY2?=
 =?utf-8?B?STBHcytsQytOeWRzRlNDRDZMV2VPUXAzbTBGNjh4TXA5SkRId3JJMHp1ZnRM?=
 =?utf-8?B?VkdPUzBmUkFUN2xKeXl5NUFSSFJ3Z3JyaTlLcEV4bkFoY2NaWUJPMWhYQTMw?=
 =?utf-8?B?ZVZKSFZOS2dPMmxmNW5UUmJwVXdCQ20wNGFVZEI4Sk5taERTc3VFZnhNdmJR?=
 =?utf-8?B?VUhQYVo4cHgvTkFSVnVCcDdIWWtYaGNKS3FxTWVoWlhRYmRJWGtrd3RwZFF3?=
 =?utf-8?B?TUdGZVNaTURuY0xDeU1iakRaVHJMZVo3UEF2eXhETnpHbEtMVUkveHVPQmU5?=
 =?utf-8?B?NXMzT2Zmck9nQUgrRFdsQ2E4U1NuL0ZjWFNKc3BwR0NTb0tPVjRtVnRuckpz?=
 =?utf-8?B?QXpGTFVMTTVYOXdLZkE5TFJNYUI3dGdyZFhwSlBma29sVnJKdUR2ak01VkxT?=
 =?utf-8?B?c0NKSW0vTmt5cDJydndwZVU1Wkp5MGp6Y09hK2J1KzlXQytSb0drWEorbUZY?=
 =?utf-8?B?TGg2dUFlRFl5eDB0dnJycW82T1k0Y1ZodXBvV2JnQTRUczJwcnROblVvSlJF?=
 =?utf-8?B?NERDZzAwQWY4M1Y3ZGJRd3VmMmJZVS9xdE5KSjFHMzNDNUh0SnZQbHFucUVM?=
 =?utf-8?B?V0RobEM1QWxlS0wzVytnMGhXcnlNazUxV2tWU3hqMmRXcytCanV1dGlWdUVV?=
 =?utf-8?B?UU94WnhqUWxqNTBxOUtEMmo4VU9hYmhUa3JQeUFTQkNta3A3a0luQXhpVE03?=
 =?utf-8?B?MkRnbGsrVkh1eHJCMGxEU2R4QmVhL2QwcHpjdzVrRXJqRVplU0RldWdWazlX?=
 =?utf-8?B?amwxYmt5VFVDODRrN1RqZGRmN09mVzhlcitaaGZyd091Z3J4bDhaM0RQTU92?=
 =?utf-8?B?Zm1MUEExV1gyaWcwVTN2VmxzOHhIWmE3VWp0Nnp4bmFITXBsUzRpeCtxV213?=
 =?utf-8?B?U0ZjWHQ2ZW1vcUprTnU2UEdrUlhpYU9CeWV2MGc3M05GRlMrcmdhZ3kyWHYv?=
 =?utf-8?B?Y3hWMURYRSt6STdIY01BT093dWJtQU1meDBOYTBNTkgvSGpmbHR6L1Vac1Fw?=
 =?utf-8?B?L1JmUURSb1FKZGNaTWdjRDU4bkIyL2R1MWU4YTh6UVVXb3pjK0YwN3R3Ym9y?=
 =?utf-8?B?VlNxUVhLTnN2NnFCeUpzeVRRSmhBZHE3RmZCK253KzBoekpaVlRBd29PcXRQ?=
 =?utf-8?B?NXJxdzhjOW1KV2szNzVZNU5BMnhVQnhqL0d5STA3dHBucTZla04xY3VQSVNz?=
 =?utf-8?B?Q2MvUW1nUmo2QUc2MGRYSEMyZGw4Q2ZiNEZEQitZNXo0SHUzNkJvRFhYb29a?=
 =?utf-8?B?WXc2RkpDUDVtZFovVy9RMFAwSzFRTFBud1FhdWtlaml0WTJwYW1UQlpKOGQ4?=
 =?utf-8?B?L1krMUNTem5kdThZOVYvRkViNUZ3R0lZZ2Q0WitEVmNjZFh3YVd0SlU3K0hL?=
 =?utf-8?B?MlZTOFpRRXU0S28vK1daSVZsUDlJWURobHpDVFdrWjFBWWZlbWRTNStUc3Ev?=
 =?utf-8?B?YW9DTGh0ODNpM3hBQjh5a1ptdFlDOGx1UC8rSERINkVMU3o4SmtsSUNMY2p4?=
 =?utf-8?B?cGhEbllvWS9GQkVHR0w4b0tUVTl5Z3YyOTdIRzRMVnZJU0pEY3NLR01PTUQr?=
 =?utf-8?B?R0dSYTNxVDAyc1p5ZGdaVHYwR2cvTFlobktCT0crTnU5Y3Vpek0xWnhHcHVu?=
 =?utf-8?B?dnlUZjRiN3ppYzIzbHlGUDNwNE9NRGRPN2JzVHhubUFUWHkzRUwrenBtRWlI?=
 =?utf-8?B?VWpKb0NlZU8vU29ERzRGVFJDMm5vYkpIczY3c3FxUi8rZk5CVnF1SzVtNUI4?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4265c7-995e-4cfe-be71-08de0fe9c08e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:02:56.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2GI1GOxgSiFbKoYUOnhJKDngYHQVWcTPYY/4aYTtxnAM0XwpI24NrtsXpgVpomt9vr9gMeH72OIFRlkS897P189Lhzcgt2GPtwHZOoPW8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449

On 20/10/2025 2:37 pm, Jan Beulich wrote:
> On 20.10.2025 15:19, Andrew Cooper wrote:
>> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Looks like you got an ack and r-ack for this already, but you have lost them?

Bah, forgot to include them here.  I did note this in the cover letter.

~Andrew

