Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFq6IXAr3mmTogkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:56:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CF3F9AF9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281690.1564557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcNI-0003ZF-NY; Tue, 14 Apr 2026 11:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281690.1564557; Tue, 14 Apr 2026 11:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcNI-0003We-KI; Tue, 14 Apr 2026 11:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1281690;
 Tue, 14 Apr 2026 11:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wCcNH-0003WY-6h
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCcNG-005k04-Jk
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:56:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69de2b51-2eae-0a2a0a5409dd-0a2a4508d126-30
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:56:10 +0200
Received: from [40.93.195.41]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69de2b58-fab6-0a2a45080019-285dc3291459-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:56:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6549.namprd03.prod.outlook.com (2603:10b6:a03:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 11:56:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 11:56:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0ScF8jZpRm1oL6n2F/p8MkC3vfzqQxKe8/VrCEaX2tj4NVHuDU7D8SsqKAn1CQoHgqHYml1vII3wJjbPsXDhjNKaH47PJ4ku4otMCXzgfMnKA8Bvqmvqw3SMKnormhrhdy3UJajXZQeHGxqg+G1e6iqHhZlISkjp5o8nNGx6E35/eguC9/i43RmldoFk6VgwikWlmEv2l6mUM7UrLdFGwyG3GlufsimjFaZJrHLVuLXteIFmhn9RSTPfjxogzuKJgywUpI0RxVJdjmC5Q9ig8tsQ0L/i+genbIe8ny1ype5jX9fL9MxX/MauENBeqHXoMKV7fy6GZJefmexc19p3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M94bJv33gHFeqrysa14xF6+TDgzNfyA8CIlc/roGXA=;
 b=uZsAJ/NU1DQp/xjJYTfvjN/vULR9DmGkiXkUSfKrCtIqtTMqkJe2RJ5Kb48Cy8RIWKb6tp+DDrUULw8AEqHIE7XPEZHTaK48iZZSA6RMf2jdIw75/9g6MsC8OzfbbAjbLzOP2mCQEPSK3hNpPLZzv6uE/+OB+n3irfHDfpMvTrfSOLeFT/NIDeuUuP/rzO1peiMUXTJNe8U2PdG6Z/v2pMQ9h2qLFgECIAEbWZm+hjWVo0uiqxTieq2oY0fNXZJNyGxWPk0W5mO/Mqco1rjecKpWp2/pkzM/p75D7GXEFSan+Gm/rCZyBct0aY35kvtwPH2I+kizN7vaQ1cEj2yG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M94bJv33gHFeqrysa14xF6+TDgzNfyA8CIlc/roGXA=;
 b=t3Cvkad7oGxTjONqVlfotYOhl/gq7d+ZVwFFmxiD4TLLBvWAUZOhX6zGdiD1dhYft6Ju7B9p2UwCCfbHnFT+ST5aowfuLgA6dPCPlYNxbIZIvcnszrM4Al52dOGi5VAA1/DImjqgRS6iaybkYPyTpqsRm+bmL5GH7FjEtEDajyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Apr 2026 13:56:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] xen/cpu: round up cpu_khz calculations
Message-ID: <ad4rUspwCosSxfs4@macbook.local>
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-3-roger.pau@citrix.com>
 <d647f18c-c91b-4507-ac1a-149e50d14062@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d647f18c-c91b-4507-ac1a-149e50d14062@vates.tech>
X-ClientProxiedBy: BN9P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::23) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: ba114bf7-befa-4a1e-f06a-08de9a1ccf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hnqwy7/l3rrlRO5Vni/zqbNy9mUV7a3eu1hfJBxeY3pyTV0SaJYLPDvg1gmyCzGeuKT1LO/KafXA+bNvvPFG5hh8ao94g7Be66RIpXKcNvq2AYxrmFeWp7UpOEUUjzUbeY3j80prFRMf/ToCazubh8iek9Mv4TFlXhTPd1BZ8m7iYnWJrkX5CtTwK3oebNW2aolL7QVZAHsNb1kf0Hi+bvrlnR4LHFH805KTdQz7zzhIF/fygxuB0kE3fbG1zKMOmVeHpELiYm6D9wF9hD7JYDnbHTBV6tOjj1SF3O0iTz2Gt5oK9xW0ggkmkT4DBz9Mh8gCVRp+gBSJT0QheUDBt+LuMdHZrkFh1jD0LSzwRBis0y7N6vJ+SHDDZLFtYkm5JZOmH6OAnOBh/gbGRM/OwlOlhRv+D5yvCTuIrmdLuj1rAI4VrT20T6HG5+EmWEdoLoQaylsOawXC4cVVqXQ42kOjFouEctA6AgCdN8ONycQtq3fY8l7yYV3+oW06lpKIbwGR2I6kSUuDY+BkOwGXkCcZqP0rTCJyNjARrJytnIqwd7LuAUnIhOLlMtrvUPChc/UYcIqbBQQIuU3CJOg79cN8fG3131r15pmiEaR01qqebM3LfW5r80CS3I+pd9Z6brnKbUoQTHr15OCz0Ils+7CqzfEzUE+KqGPauTbCkzXp4VOU0Ls9bYJEq77wC4DpFEuDfyCrOeX6Y7zAnwscz5/CUu0jy7b8nazHpJ6ND88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjBKam1zZHpqTnFFcUFFNTB3WFhxcGdKUzNETnVGRjA5RWh6THZNM0Z3R25J?=
 =?utf-8?B?bjZORWRkdndzWHROQWJPNzBkMDErakl6TFU2Uld2WXNHMDdNVE5uTlZUZGk4?=
 =?utf-8?B?YTdqb3J5bVJDRjd0Y3ZldXI4UThkMCswQXFQcElkcy9yd2lGZWsrNUV0VEZp?=
 =?utf-8?B?SktQWjJDanFDQ01MR2lYZ05IeFlIZ011azl1STJmaDZIMjRLUVcxWWFuSW5I?=
 =?utf-8?B?LzU0SE5Sd3J0czAzSnRSMGV1bVFtV2hrcGVWMGdFbDFGeVR4eUViaElwV28r?=
 =?utf-8?B?eldQSTgrMGEwd2xLcUlmNGVlTGZCbHlGWFdDMFNlTlE2Z2kyQUE5czZXaWFs?=
 =?utf-8?B?WmhBTFBOdDVvQzZDYWZZdG5IZWdINnpnQ0dpcUxxOFFHaDJKbnp4cytreS9y?=
 =?utf-8?B?d0hQZnQ3Z3dVdWtONTJOMjdXTEtYZmhuOS9YYldCdUUwRjd6S0hUM0Z5MHN5?=
 =?utf-8?B?T1RrNDQ1WFVqbFNUalVRcWF4ZWdkQmx4SWM5dFJtRVVCRTdxMVNjcmdiZG1Y?=
 =?utf-8?B?ZitkcTg5YXROWktvbDdZTVN5Zms0NmkyaXBBK1NkeVJ6VmtTb0FOZExyL29m?=
 =?utf-8?B?c0lRRWg5d2RxT2pzdU56azQ2RENjQVZNa01mdFRQL1k1OFRaQlQ2ZXJpUXZL?=
 =?utf-8?B?SjB5Mk1WZXkyVFJjd3RVOGNDRGNmOGNJTE5kVS9rdExCVVBWcnVUckZDdXZo?=
 =?utf-8?B?YXZETUJvWklIUEZVWm5RUnZyOCswcU4yYUZJVGx1L0hQQ3FkQ3E2b1JpcGNH?=
 =?utf-8?B?OGtja3pvMEN5ejZBT0JmSU53cGxpcmF0RmZpRWl1VGQ1WmQrWG9rNk53NHdG?=
 =?utf-8?B?VFc3R3FSR3VJa3IvYi9BeE1IQ1I3YkxUckhnK1NCOFc2UnhUQS9RNzhwUU1K?=
 =?utf-8?B?djhXYlQzSkl4WnMzWWtLQ0lhREw1MEtReFM3K3B1MENsTDdWOUtWYkNrYUFU?=
 =?utf-8?B?b1hoSlJtM0Fsbk4ybHNFZUpEZ1hLNTJGUnBsdjdLL3ZOejNQNU1OaFY4OHp2?=
 =?utf-8?B?Mi9VOFAvQmR5VTg0QUJSYmsvdkZ2SWpNSjJKcmd4Q24vUDJyR3V0ZXRGc2R4?=
 =?utf-8?B?TXlYaW8reHlSM3A1OWRvQlZkVGo0T29EZlZzL2xTbTVnU0JXVTNHM20zdUx4?=
 =?utf-8?B?dDlmaml4a2h3Sm0wcG9JQ0J2Skw1eTEzTnN1RWF5b3REWXZMbWRpSXRtVm1s?=
 =?utf-8?B?Q05lTFdhT3VzVjVNaGVwVlBhL0lNMUxBdFJMZHM2Wmpydm1YeTkwaVNlOFpv?=
 =?utf-8?B?cHYrU0xJbzM2TlBwNVlNTE84dzZaei81YjJhTFBmSHpUekRuanN4T1AvN1R4?=
 =?utf-8?B?L0c2eGFPUFdhUS9RTVdjWThBTW56Q002dUlnK0RpNE80VTVGWGFEelkzZnlG?=
 =?utf-8?B?RmgyZ29WM213UTlsdkpFbHBLUUlSV0d0WE9ZYWtaZ3VRRENsSkFaV1c1ZkJy?=
 =?utf-8?B?VWx6Y2QvOHlRVEY1dXl4dy9JOWVzSjVJRDZsN3ZhcE5MUlRSMWlBRHZBLzFZ?=
 =?utf-8?B?emVZM1psWkFqdzRhVlNjeVAyNHMyTllEVGV4bmtxZlZqM1FlQ1BDVXZNbnJG?=
 =?utf-8?B?a3VZOTVqU0NUT1QzS01mT3pxRzVWUUpBSGtHV3JheE1IMXBuOUJJN0dUVGdX?=
 =?utf-8?B?QzhRWVloYWhxcDZHTkZ2ZzVYeUhTcnVkRUFFQW54ZlFYMkR1ZC9GVmV1eHEx?=
 =?utf-8?B?S2VaSXFpTXdkQ0hvSWF3RjVGRTNYcXBDT0pjSG5mT2UrVmdWUC9sc0RYTGZV?=
 =?utf-8?B?b01JNUdCZFJlcEltSkwvdlpISEtvZTZpcTBaRmNvN3NRamVKUDF1RVlTdWhn?=
 =?utf-8?B?OUJjNDBWZ3h4NE9nNmtNMmRoTFFueGdaUnF3bWw2SG5VRjVSRUNZck1JRURI?=
 =?utf-8?B?OWgxNEp2UFZSbTRoWjZic2NOb2h0OEkxSVhiaVJNa0k0NjdWcVJNMEM3Tnd1?=
 =?utf-8?B?U2kvZzdtN0g4YWo1STFheHpaQWpkR0VFSVY1ZTM1d213QStoMUtlWEQ2RDlI?=
 =?utf-8?B?MUhLVzEvYUhOM1d2U1M4QVE2ZTdDUWtKZjNtd09uVkY1L0k1WVpTYjc5blNB?=
 =?utf-8?B?SCs2VUNGZGlRaTVaYkF2cUplNzZGUUVLUjN2REZDM2RLWGpFcVJ3ZGk4a0Yx?=
 =?utf-8?B?dVNYUytuUmhkZno4UUVSZllzaVU3ZUFMTDA5SE9rdmtaL0QrSjk3cGVXYnEw?=
 =?utf-8?B?NnpDeVpkVUhJa0dsY2xIWDVrd1UwRmpFL0pxSjEvNDljRzdiWkRGYUh4bko2?=
 =?utf-8?B?Zkw3L2NSZnZ1R21tMFVRSWI2dkxMdzVGbXVPRVdxREwyZ1l2eFRBbldvMmF4?=
 =?utf-8?B?M2krN2hKZERPUmdWM2hKQUlYRU5VZlFacjZjNUZzNUNxWW4vZ2tEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba114bf7-befa-4a1e-f06a-08de9a1ccf23
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:56:05.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lX7Jjn1PJr/vjNlhroL8XtXYJuFlmLgLmhSiY3SrfH0IzkeFI3CFak0CPkNgy+ifGyLnlq6qyT/K6/j4RH0sPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6549
X-purgate-ID: tlsNG-c1860d/1776167770-F6D4B497-D0F6A6E6/0/0
X-purgate-type: clean
X-purgate-size: 495
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,arm.com,amd.com,epam.com,wdc.com,gmail.com,suse.com,citrix.com,vates.tech];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DD1CF3F9AF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:36:22AM +0000, Tu Dinh wrote:
> On 14/04/2026 12:36, Roger Pau Monne wrote:
> > All arches truncate the cpu_khz without taking into account the less
> > significant digits.  Instead use DIV_ROUND_UP() when scaling from Hz to kHz
> > to get as more accurate kHz value.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Couldn't DIV_ROUND be used here instead for a round-to-closest?

My bad, I got confused with the macro names.

Roger.

