Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BMWhKx01KGqtAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BF661F06
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:45:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=or43tL16;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333593.1596717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydq-0001wL-HE; Tue, 09 Jun 2026 15:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333593.1596717; Tue, 09 Jun 2026 15:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWydq-0001rR-Dn; Tue, 09 Jun 2026 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1333593;
 Tue, 09 Jun 2026 15:45:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wWydo-0001l2-Qe
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWydo-00DRr1-7C
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:45:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a28350a-e002-0a2a0a5209dd-0a2a4507d5a0-24
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:24 +0200
Received: from [40.107.209.48]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a28350d-229c-0a2a45070019-286bd130e868-5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:45:23 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH7PR03MB7785.namprd03.prod.outlook.com (2603:10b6:610:24f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:45:21 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0113.011; Tue, 9 Jun 2026
 15:45:21 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTk47K9I/PRYcV+dll7d7BwxlGryrM2lsb3bkc7CgE59rNseIX2G1tuTrPTvNs8FhmGSLyPxjWDExfED10ECSy6sFRQvgtwEN1lR5raFRbWoTvd6E2sAdv9pBG2kCWruW3pWdwn2ZDBPHWxvHvvfoCC9yJEki8qerpD7qAu2s3dSzJ2/8yGXtET/VmyaLHStA6VTGKxg5InZbhNl+ZHnuv7ftQXbE7EXxAoZGXBFm88S/aazubI0WfESLuwdktSSSSvi75UuWIoGDSv/R0Q5If+FXAm0SbpqCZ8SM9n/20HrGIliq4gMZd5gi3nGD/1oLCz1De8i5n4qYE2cuBzV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX8n3a47dmyiQ43p+mrCyQsl4Ss0tUYDgsOf9iF4SZ8=;
 b=t/IwFyNgPB5vn4y5ftGwCMTiWdZ3C2jXF6uIX6J849k+2cjY1hPvSsSyTjvghgT/ORGd7mrriiB2Hk1cOlVq53ZC3H1xYD3fCP0+zhzo8yvFYEzM7dFhNxYFzuIAtunRJpU9h3nAbtIppnRGa4/21P2QSH51GYmOIIKLJSl8IJgnQ6H4wTMUgf2MSjVLxv54K0fsmEbFMZ+5Xg55hmfnChixPZ38KeZb3KYqXXvfSrNOR9AjQrnj31OmdlB6sRBlBcyI+hZAUdkz1+QPyyHH0TGcBiVeD2FQ0Pe4vSX51M4d1Bp7hfoY3tICgXA5LakJ9nPAIldUtOFDTJD2a5M6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX8n3a47dmyiQ43p+mrCyQsl4Ss0tUYDgsOf9iF4SZ8=;
 b=or43tL16AdMOL59FaiCzXS9VNfQPgQLfRDnZYO29+wH75qZhys+kt98Q/cl7NVF8iOYQ7Iqvtik+1InjAnfkT40chQLcwAeegVDlJmH2a6PV13Yt7RNvViTF7QI930y4SoYNr0Uzu6GR5bYbeTORjGKza7OXRmzos/u4YwP7T/Y=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>,
	Kevin Lampis <klampis@citrix.com>
Subject: [PATCH 7/7] x86/kexec: Zero general purpose registers
Date: Tue,  9 Jun 2026 16:45:18 +0100
Message-ID: <20260609154518.779757-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260609154518.779757-1-kevin.lampis@citrix.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH7PR03MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: a28493b5-cda9-4324-40b0-08dec63e1d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4YQKk2hPXzsaipMxsx6jZWT+Dzm4i2xf/VWE1z1y2D1K5QrO8hwNWTv2rHzSy0xc/uigHhi6v1tl7qGvz53V/vA6IK72MnbqPqm8pxd2Diz9uprlfrWBsrGMcbsTkn0JCdMlgSbh5ysTlF58EE3Qts2Z9oKH9irvycM6OAqVbAUGXrf3qDakW1xofhjoUO12HE9mmZC0QbhW1uUPKAbrHrrwwK/HoI5XifOxoZ/g69lg9JrAbtxoK/ADpSrzaDnwJeFRozURG73SXkO3b8Ujo9lUr38537pnE+oioDvoG0hxZPXbwaByEbdq6m9z5loIPGagvc8AZZFOnfb3TkB7yGBTWPGHOHoRufSYc2wQw/Nl40hsmkZqLI9pV9twoKESlfSQkpngR7G22neRiJoIYVnn/Js5IXBG+P6/eq9ANE0BJex1mcqxJMdzIgAs9SydAO+vKgTy3iaMhin+qj6iwrxR34jfBP69XZr04Gi3wuAwYb9wB+Co5JlegNN91lniEsj5ZfPVycptiuGalNfetHjj0tpCTptyDHpGbj94I9LtoQvo5280nw/rWTQd/8jWq64YU5yUxbkOy5O0eh/3BdjDhEYaz/IKxisGfCjapWKPhe4TLJcEDXDQP3+Bno7Oue8NK8A0hNiQxanUT5p8DeKv5Vqk8XfcF6/4rbqrigHuRTbt9Zyxl99/LuTrd43v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GtSefAIIcQ3MwD9wJEPrMXIiJq3bICvdbltG7oh2AtZjbI4PgdzKqHOLSza2?=
 =?us-ascii?Q?c6AqFZxwdrSP0IkJy6XMMm7H9V89PYO+WDJ8WUEiSOItxnsG9I+wB4g4Sk1W?=
 =?us-ascii?Q?oH2KfYqWEgjeYNwRhJ0XnseRyl672Ke0bOszYMVvSK2jzngEOm4TW+O5pOnX?=
 =?us-ascii?Q?UV6bHcnFr22r86JWBeXP7yekdeCnIHu5xPtrqc+xdysBJZ0XgFl/Fu3e+Py4?=
 =?us-ascii?Q?rbD5tLW//9zsPkbNoNBMQZdKG7ArJY4rOSz6enhhakH42f03JJr5FpdHpeM9?=
 =?us-ascii?Q?4j7pMtp+tx/rFupyeByYh8OH9/16SGHnOG3QcNoizUeTXp5OERzSSSJ9p9GD?=
 =?us-ascii?Q?761qD78kCrxLSH607RqPWCx7rkqCyWrxyTn4sRDLxcSad5x8fwq4IZl8Xixm?=
 =?us-ascii?Q?UaAXk1xxNRChS8SBORF1MwdFD+blbOMGgBIwolk11sy6nvrXJqJy2+Fc8Hhr?=
 =?us-ascii?Q?1Yqd9siYz4uKqIESirz9FqRzY3jptcw/lqS3sGtcmrj7tn/AdQZVvbd2teQR?=
 =?us-ascii?Q?JKh/6wcpkfxyLixDkplomXVMLzMLG63Z+bhFpQjdOgaSnjS0C9HPT4jbaUFQ?=
 =?us-ascii?Q?F+XlSb5hnt+giKsLzIy2/ZZBJInNzWcI+EawjbXVFiBvH7kliQp61vxFk9au?=
 =?us-ascii?Q?3CSk7KYhtBrWTsjpi/7g2AtXlC/sDt4kQ6vyq1Ac5+HQCPcnDztRqXHNKBsN?=
 =?us-ascii?Q?BaIcATY4h9iGCHOo+I63rApCLkOFrCTgJBHTpEvz5TtioksIJpovxdC/C0kD?=
 =?us-ascii?Q?ljt1jN+oIrWocfT4dOH6w1VJECMq1f4CU/6P1PDclNuC9YDi4Y+FVX1BIYeY?=
 =?us-ascii?Q?RAsJ2vYnHiWLcHav3ZaFwJdHsNdD4xtPRIJdDHI8Hxjqfc0hI8DKnD/wp0zB?=
 =?us-ascii?Q?NwwiAzHs1ojDm+dazwsSpHU32OsYW6k15rkC/Wk3tXzfP5KKo6C1Q550Z/yZ?=
 =?us-ascii?Q?czr9ZDvH/UCck2XQTcJ+B9RHdZ/LP07Fl3QosF82vZJIerscMHeJZftZBoJD?=
 =?us-ascii?Q?sc0xbeu4jS/aa3hxd0z3NVKKCxiGtqTU6Z/gqpOEBr1xAM9cZJ7iWL7Azo0A?=
 =?us-ascii?Q?DmtX0F4cGESmbtxW+SyBCxX5g0i/y/qutswV7DxVxkZSGspORsj3FA6UN/XU?=
 =?us-ascii?Q?IWueAdDJ+fneP8z2KNCIscxWK+8ZNYDM8YSVnNNrxQ6VGcNpIYXMnpIosaVB?=
 =?us-ascii?Q?XaXgE3a5VBh5dnTiAgLtNjDvI/JIoH9xFwEAnAY4NY/tuO0/pL4ns3V+HQY6?=
 =?us-ascii?Q?mhd5da3AqNpmiKVRu6BF8pp7/sB1yyOZWbut9wkPTPA7SyCeTJEtqK3v97vc?=
 =?us-ascii?Q?oa+PRZAAngDwKdc4LhuVt1t6HB67Tx2+VAEJBY7WMnZ1ji0hwKpVM2WvLQry?=
 =?us-ascii?Q?H8AsxMf7cF6IHAkiTV31bNjMNefykMAJkZfoEkGFpt5pJSJphjrraZrZBOZY?=
 =?us-ascii?Q?W10oLMtufNPkIZUi8DHDen+Z0CjjpCMqiEgveZb3bN2mqfftKWEsyJKzaKfL?=
 =?us-ascii?Q?oHKXSxqYEF2IyaZZclTfxN6e+Zaiw4kKD7Udae9fIQnpAWL9EjCVwXty7h+p?=
 =?us-ascii?Q?zgMrIybfpBrTe1CEvbJrnlvsrYN6+R4MdSq0/JNSz4Jke6fA+qzT2/NLJKpQ?=
 =?us-ascii?Q?8rDTbNKgp7rg2DKXTOsVMP/QmQhdG6XZaYM3Gy3FYOYbmhGBLBPXk0dYFrhG?=
 =?us-ascii?Q?YhS60s5zzsoA4pbhIF4ibRd3tNhvd0sKeuhc7ZYuIzwRyfrTB/0XjQDDtOTq?=
 =?us-ascii?Q?b5iY8Q20JA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28493b5-cda9-4324-40b0-08dec63e1d0f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:45:21.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABwN6uVU41g18xGFx1sfwHrVsPtHt5v0WoSEjtH9/A2GtWmQ8jyolhmwcju3rnxmcPXJNQuVQ7lREG+wnbcXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7785
X-purgate-ID: tlsNG-ef75cf/1781019924-0A36CC48-933FDABC/0/0
X-purgate-type: clean
X-purgate-size: 1493
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:klampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 607BF661F06

Purgatory zeros these general purpose registers before jumping to the
new kernel. When doing kexec on an EFI kernel there is no purgatory so
we need to zero the registers here instead. This change shouldn't affect
the functionality of legacy kexec.

Signed-off-by: Kevin Lampis <klampis@citrix.com>

---
 xen/arch/x86/x86_64/kexec_reloc.S | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 6a2c839b83..be9e487f7a 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
+        xor %edi, %edi
+        xor %eax, %eax
+        xor %ebx, %ebx
+        xor %ecx, %ecx
+        xor %edx, %edx
+        xor %r8d,  %r8d
+        xor %r9d,  %r9d
+        xor %r10d, %r10d
+        xor %r11d, %r11d
+        xor %r12d, %r12d
+        xor %r13d, %r13d
+        xor %r14d, %r14d
+        xor %r15d, %r15d
+
         /* Jump to the image entry point */
         jmp     *%rbp
 
@@ -94,6 +108,13 @@ FUNC(kexec_reloc, PAGE_SIZE)
         lea     compatibility_mode(%rip), %rax
         push    $0x10
         push    %rax
+
+        xor %edi, %edi
+        xor %eax, %eax
+        xor %ebx, %ebx
+        xor %ecx, %ecx
+        xor %edx, %edx
+
         lretq
 END(kexec_reloc)
 
-- 
2.52.0


