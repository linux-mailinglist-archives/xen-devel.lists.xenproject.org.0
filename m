Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0396446369
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222281.384401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyRM-00037p-9t; Fri, 05 Nov 2021 12:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222281.384401; Fri, 05 Nov 2021 12:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyRM-000355-4T; Fri, 05 Nov 2021 12:35:28 +0000
Received: by outflank-mailman (input) for mailman id 222281;
 Fri, 05 Nov 2021 12:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyRK-0001oS-7k
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:35:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9acb659-3e34-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:35:25 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-jbdLz5vAMKSydrRXpgynYg-1; Fri, 05 Nov 2021 13:35:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:35:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:35:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 12:35:23 +0000
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
X-Inumbo-ID: d9acb659-3e34-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpgB95rPSSAEva6eQRre47O5y0IXJlpRfMop3oBtTjw=;
	b=NkUu9GpjOKtHG3sYYFGoqlVBBCdphX92aGWWfJhDZocWL4JFkwI8LHL/REja96N4ilkhh1
	PwMuGUd9bfEQ7/HWbSSvCRqqBXhzcTbylOo/PYKp42GhqLJT2+1NWmY/vN/FHPzKcQvLmz
	eEm2fWI1eMsXLq5FOOiu2jVE0bn240I=
X-MC-Unique: jbdLz5vAMKSydrRXpgynYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OURxSrgnDpDhlt3I3/9o2pRy4GJ9mP8A7XVoTfx1rlglU52SGz5Et6h+VZlg+/VxjOsjZW2i5yuZ4C++BMyRupvT/BASEeQKo7GuDiM+jhgRTq2Av9LcxjM//a+DMbLZT3NdfJTeko28QRkFOotiq8smtgxN5JtwyW9sCaV83pcM9rDzgfyP0jIE7c3wNLlkXqv5SJLo7t6AjoqDcFLxb+i4ZYC4uJi3TdEkPNk7BMKdc0eaVVM6j38dSykneKbD7Fhnz4AftaA3wRavbkCI+MRfFG+FiHV3GHjT3+6RJ9pO/jbPYZH2nyT6i84OtEZrBv4naxAoSaCK6RLVHuWDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpgB95rPSSAEva6eQRre47O5y0IXJlpRfMop3oBtTjw=;
 b=X9g98COVJ+0Drr2P+8iBKGdhYrXSYZK2JncT9e/NK2fiAgRUHxFkg/MPhhZ2+FCL2kAS645Bk+sgsu6S/FQY8eI16Z5i7F5U4GW3fvp5oVJ82s8GqdssE+EHRXmo8YYg3iuCFoFFj0gLJhlc/TDhDzWYBPosVgPR7GbBnlbLl39fJE2QNbjPkuk/lDLOQTrt8zwE4QM7GrbipREn1luSxJP5aSVcLKBo3KJ81x4QwARkBjEUZ/kk/WXt4zUIgZBQBumSnXwSxei53oJ6t231PU95Xe4DPPdC7jARZlAxbcySX2mDyDF1XnTs8dVlVJ6mL8u9UYfOPKqimWUCivKWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b578ac1-f39f-5bb3-d53c-731ab94cbb6b@suse.com>
Date: Fri, 5 Nov 2021 13:35:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 5/6] x86/APIC: rename cmdline_apic
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c048b62-34a2-4874-1213-08d9a058bcb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037DB0B37C206AE4695AAC2B38E9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NIbny2zryNYkN1wzf4e5L4K2RjiYPjrd1NPDy1U1qzxSKcIYmljFVVQ+W6rxDzHAPV1P62oBxfm8e12XUnSskGJAFqApNegyttlN0V6ceAR0NJZ2LcSJdDMNlTROEdtcM9b4EklvNPPBDrpeLYX1naEAYixVIQ7E0OFRz4hPmNs03tp43QJ+WEuqnW1kX7YUN3F+6buEVwPV9wtxkQbfYfz1wvh2c+3m70TE9tTrssMRGmSJrCDHqvvZ6bNd34kU7dXwlQxflT9wlyTVhRQFcgiXtdEEII6R4xefs3i5BpeqBbieklATSlE73R4r4dX4+TIgvT17mUiXKJ005wWjKYtPxhwbvcK95uEl97nmp4ammR/lxKZc8NEz4ZW0URWpYxCOyEB+sVifsOVef6mzvWFpxqXF77HLEvDss3BRL4tY72W3lIEFeDxvtDJxI9tPKkNgtkgz5hB94/wux3blT1048C2Eba5hN9ImcWELA46EcfB19zxgU6AujdO7IhjT4lqAMyAQxUdDTWm36KZftKN4VpRlYXak3thrXkQfOO3brvlFPFtvcU8Ixajvfs6/pjDbrAaCqtdGLayRblye5WOximEAKFfqMMU4SM6gKMfa/gZCuq/1AWxkTlUaD4oLEt5LZorwtkGzqKtDPufkKJoSaqhDeDg8eZYGVdGF29UaypFVvjXkiyA/ztx1k0NOTjlfAhwDRROP8C/YjuWSqZ3ly9B9H68YYMXpUcuWLEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(8676002)(956004)(66476007)(186003)(38100700002)(6916009)(36756003)(86362001)(31696002)(31686004)(4326008)(316002)(2616005)(6486002)(5660300002)(508600001)(54906003)(16576012)(66556008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2R5bjNsR09HbWErQjNIeUNkUVgzMm14dTZJTUFGcDhXTDNBdmhuV2hwS3R2?=
 =?utf-8?B?ZUJQcHpUcXlNUkdmc0p2RDVkWXBWc1F3dzlyYnQvZkNHZjk1d2xpUWdSNVdZ?=
 =?utf-8?B?OTFzREJFb0tiTURURUNZUUdaRUNDd2NTa2JxbWhQd3kybjdLR3pEVlc0alM4?=
 =?utf-8?B?dDJRd2d1bU9FRk14anVFUytTVkNMbCtoTG9sRDU0T3JsVTllRGtlWjVoYVh3?=
 =?utf-8?B?WUppbjBSRVRPZmtaZ2R2TzVkZHU5L0NpWTd3R2Y2NDVDcDRYV3VNd0VMNm4r?=
 =?utf-8?B?MlhoUHpONmVCUXg4S1BHTXdQWTVzMVFKeUN4RXpRdDJ1ZEo5U0p3LzQzREdx?=
 =?utf-8?B?dURLOXcwRmVvTzAvY01iSnhhVFVma2o5Vnh6L2IzRVFmSlhjaDVUZTJ1QTBr?=
 =?utf-8?B?NllibTdoZStXa0tGY2JHd1Z1LzFldjJJQkN3bnZzYStma0ZEMnRuVktMZkp0?=
 =?utf-8?B?OUpYMis3THdYWU82K0dRQzF2OHp6VFJPQXBmQ0Rrblp0WTR6bTdVQUk2dHVZ?=
 =?utf-8?B?VXJ5WDJ6b253L1ovN253U0pmYnI0VWFuUit0N0t0ajdhNUZKQ1UxdW82eVkx?=
 =?utf-8?B?cGEzZWI1cktQWTB0MW1mZ0ZCTk4xLy9MV01mWUxZYjNFbFAxSDd5WFNlTnBE?=
 =?utf-8?B?YzhBb3g0aWFMSEVPcVUwd2tyNlJYR1BBWndNSTBMSjBrRS9oWER3NnhBMzRP?=
 =?utf-8?B?Q2tBMnBqM1JLTjAwSzFBc1pUSEV1NkZVUkVkOFloa1R0QWc3ZWhFc2hONnYy?=
 =?utf-8?B?NUxPeG11L00zN2ZiRUFFNi9FTTFaMEw2OVh4a05lTkhIVG5rTWo0UC9FMmxW?=
 =?utf-8?B?bGNzSHFpRXlJTkE3L29WUE5zcFU3eGNtOWQzTEROeWhWZzNlQklxcjRiRXdY?=
 =?utf-8?B?UGRJZ3dyTTR2UmZKSXZJYUhseDlyUnB4RTU4N3VLYmdyM25HbVFIbndlQjdJ?=
 =?utf-8?B?L0htbU1VZzcrdEJxRlZ2Y2JDRHZUa1hCQnVTL0pPR2pSeWIyNGh4Y0JsQ2tn?=
 =?utf-8?B?S2ZZWXExeGtmS2lMMWd6SDFrWnhzcmd2MlRreXJoTnYwRnljdVNmRXc0am1D?=
 =?utf-8?B?ZUdIaVl3czdiRjNUZUtXK1RzSFhFS2drOVNFVHZlYUNUdVFqQTlNbElONXhr?=
 =?utf-8?B?UXhWTldGUlJNUEJhbU9IbWdFbU5ZSUFCbEtzbW42QUxWNTVCb3FQSWtxZDJy?=
 =?utf-8?B?a1lSSTdZMjFZWU96eTllSXJqWnl2Zm1aZ1BINVdCR0YzMjEzNUVLZklaT0lF?=
 =?utf-8?B?MUZKeXVQdHhYM25GN0k3ZkYreG1FSkoyVkh4SG9NSVN0QUZoejgzNEQ4L3dE?=
 =?utf-8?B?ejJXWWJMV0hkRmJvdG1qOUpZbndBdTBKdHk1S09ZeHVBN3J2OEdFVGdGV3Mr?=
 =?utf-8?B?RDV2bmpMN2dUU0pQazB0U0pFK3laZkl2K2pJYjJLVkFlUFBxaUMycHRWc3Vr?=
 =?utf-8?B?RjRLTitUUW4yNThvTUZIRXZFWGZLNGVrbTJpT0pXWGdIa2RHQytSRVg5eFZt?=
 =?utf-8?B?QitVWllybGNaUGg0S29rUmE0NHl4TEJmM0plRUZsZXdFSGc5WGZ4NjNXcm5B?=
 =?utf-8?B?bGtZRE9BVDJsNlZjWkdmMlpCdU1nSkdXWXdXd3VQbnVRWkJmMU5WNnRZWFVl?=
 =?utf-8?B?MHNOY1JoRit4dWhlLzJpcXpHZTBMTTFJQ0lwNzh4MXBLTmZ1ZS9WMVVJOHZ1?=
 =?utf-8?B?dVdkQUFNYUdXcUJKNFVQbEN5a0IwUXA5SzEwNFF4MHFTWmQzbzVXbTM0RnVw?=
 =?utf-8?B?U0tPbEJuRDVjd0tCa0xmOVlQcDVDbnB4c3g5WHdqV1k4WDNRMnhPTWZFSEFp?=
 =?utf-8?B?N2txK09KbTgyY2RYWit3R1BpREVURGZENCtxeVliSjRBaW5UQmFua3YyQmlC?=
 =?utf-8?B?UldORkltZGZTaFk0NE8yWVVIMzlxeVprS3llREl0UnZRM1Zqb1VGV3RxUDRZ?=
 =?utf-8?B?M1k4YjVkVnVOeTdvRlFKa20vbloyZGx5YnZweG1lVitFOFVBeHIvaDJobmpq?=
 =?utf-8?B?STZpSDJMeXc1dmxseU5Qb0JwanN2SjVnSXdMOHZrbTZ5ejdycWhHR2pSVU9h?=
 =?utf-8?B?V09ZUG8rZlJBRUdQeXMxS2JmRW9kMkxnbzRuYS9iMVN6ZGwrb2pITTgwNjEv?=
 =?utf-8?B?RmNwZDA3bjJEaDg2Y1dGUTcrbTBiSVZxZ2gvU1h3aEhvSzVpbmFUcjAwSFRv?=
 =?utf-8?Q?WW9Xk0XF82nnMZts3mwbJZM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c048b62-34a2-4874-1213-08d9a058bcb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:35:23.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Hx57Z7QS8/Hf323yim0NeO/c8axoMiugtLlOerUaN4CSzBzjg3fjuN5Gqvr3evK1kOnh8VDo2fb3pTSVJMzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

The name hasn't been appropriate for a long time: It covers not only
command line overrides, but also x2APIC pre-enabled state.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -24,7 +24,7 @@ static const struct genapic *const __ini
 	NULL,
 };
 
-static bool_t __initdata cmdline_apic;
+static bool __initdata forced_apic;
 
 void __init generic_bigsmp_probe(void)
 {
@@ -35,7 +35,7 @@ void __init generic_bigsmp_probe(void)
 	 * - we find more than 8 CPUs in acpi LAPIC listing with xAPIC support
 	 */
 
-	if (!cmdline_apic && genapic.name == apic_default.name)
+	if (!forced_apic && genapic.name == apic_default.name)
 		if (apic_bigsmp.probe()) {
 			genapic = apic_bigsmp;
 			printk(KERN_INFO "Overriding APIC driver with %s\n",
@@ -65,7 +65,7 @@ void __init generic_apic_probe(void)
 
 	check_x2apic_preenabled();
 
-	cmdline_apic = genapic.name;
+	forced_apic = genapic.name;
 
 	for (i = 0; !genapic.name && apic_probe[i]; i++) {
 		if (!apic_probe[i]->probe || apic_probe[i]->probe())


