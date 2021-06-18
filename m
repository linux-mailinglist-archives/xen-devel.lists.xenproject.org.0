Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F33ACF9E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144823.266515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGux-0008P6-3e; Fri, 18 Jun 2021 16:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144823.266515; Fri, 18 Jun 2021 16:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGuw-0008Mb-Vg; Fri, 18 Jun 2021 16:00:26 +0000
Received: by outflank-mailman (input) for mailman id 144823;
 Fri, 18 Jun 2021 16:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luGuv-0008MV-N9
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:00:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea6fcc0-f29f-4621-a163-e5d9d5229f5e;
 Fri, 18 Jun 2021 16:00:24 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-5xO7tFhcPkyxgLeGsUyDUw-1; Fri, 18 Jun 2021 18:00:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 16:00:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 16:00:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 16:00:20 +0000
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
X-Inumbo-ID: eea6fcc0-f29f-4621-a163-e5d9d5229f5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624032023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gDu8v9Z6S9LCduvADm2MEdzkMI9LRIFgjRlVPFAk6+k=;
	b=J/VsPkeiHFR7IbkHFU8SvLF9YUbvEUSy/0w5gynf4p1L1FBfTjEjadXuVjG0sooBc6SBze
	G5p8m0Ocj+lTZWoXibDfHA0WY9Puv5WBhNVBlPJAzuQKOAoOata9FqpD9eUbEtRRxNMz2K
	T5Gd+WH+mdez6rvhkoh/7esRyqFKK7Q=
X-MC-Unique: 5xO7tFhcPkyxgLeGsUyDUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMfvnT1t2ckkboxwxZkK92n++C5W6YLHO7iDPu9RzDhICL/bBUrWBmCE3VkkGQFiRjqe8IsLpBvK5vHHkn0X2N6MlWjv00w3VQck30jelQ6GKmb0JytUTSoTzcGA9I/4+RnM756JiQis5IjPisCYwDR/1prNlzha7CUHCAkeuHS5zOSgfkUQ5+GK187cggqUiJ5riL+I1VG/QuAAdHVmlGkp8lFP/bXaguUgzNIM5YloID9Lc9TN3IQTuK3kHyWldJumsc2QvesA4CZdjc44pcNnMRnsXxQKo6NkdRbfy5RCw/t45/x7evSwovc9Y7StHQbgHXV4Nh5OTOJnYWdHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDu8v9Z6S9LCduvADm2MEdzkMI9LRIFgjRlVPFAk6+k=;
 b=PNfnMdwokdFkZmMFu02E13ESOC24hcV1Cv/PVB/WJ9JzLIq2tIfjHIM78r6CxpOhzCqkVMDcUPdePCGo1HDGd1sFxk1uHGnnSCgUtAQHY8cD6VRjmSZi5PwXv2CnhMygM+TyBEltZoWpLyI4lJopcQi2tDEqPmxN/6qhvbgy9nG4MgRtuxKB1XHTyOvLn7By53+ksYWTRNF8shO+ghov11hHgcMqZ4tLV4X5bHeirL76uCjvuZ4giPhkeKpsavinZrLttBm51efgYEEaVvBnobHS2wVG86XSJtwiQ8S9lEUFWAwQPXoe8eqpUh/4+/oSkSKxdALdFYigWY49X48cKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
Message-ID: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
Date: Fri, 18 Jun 2021 18:00:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3f919cb-976c-469d-19b7-08d932722cdf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445A8E4CAE9A2FAFD467372B30D9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTvfW0zhQxNJGZqr9mNEjNvpkv10jXWublwl0SVV405DVEGsx3vBxvA6XUx4W+fi9O6FMbK+z56vDTPMGKCmOVYHBoZjrJ5tlswWnmMnwilk2UFrTo9A6zpO2ZHoMNWprLV6yJ0BQqQHn4/VM7TkhwUQ0fZyh3IdIKigsvKfZwnUIxvmgpz4Cxfsu7Rl45Ks3mbyt3hoaSsIHXXp55fk8vpmpC8gV/snobpSf5t0pkKUxvtafgVb55q0BrIYBeQ5TYVNUt/9qzTDSDgyZYkDXV0aEFDXN57Ej+f+hPUAO/6/lAL55qqtVKSvwXY5NvcfgTp8OAOVe6hAA1zDAYF1DUZo7wem8SfIcY9ouaim384hMkMA4jQ6pRk4GRotyDKNaZUerAUNbSKc2Ac4jP+b8Tv1YXWK4swNrwK2RSz5lB//B4xHZagQzvU6I0QUW/ktuDu1AZVZWUhwkJF8uA7KyZLhbPOmeAM0tKBv/i2IA+Lg3i+GnRWdh6hXTGrNFmU5RKQaGraMs865Dy22EiJmNbNUQe4yCUjse2Hm9WwgwUAq+6y4piLcsNhBYle1BB9nRNc1fI8Gd4aKpbTz1wvnFr+CcOxo9cbQ0XRA6c9HhtFNo881l08CgAqcGuotZ9NeTXtWrUer0lEHSATSNp2/pRybPnbgYJktLnsTKW0iXLvVoDhTu85GPQEsbiMgH5TG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(316002)(8676002)(16576012)(38100700002)(66476007)(36756003)(5660300002)(83380400001)(2616005)(86362001)(2906002)(6916009)(66946007)(4326008)(31686004)(66556008)(186003)(26005)(16526019)(478600001)(6486002)(31696002)(8936002)(956004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUpkRHpxMnFqKzd3TlpZNkYzRHB4N0dUU1NTMU9YbkZxQzQwd0FhLy9vNW5u?=
 =?utf-8?B?czNGOEdDUER1aWVoVG80OTdzWVdhdWJZOG4xMVcycGcvYXRBeDlQR045ZnpZ?=
 =?utf-8?B?U2J6aTJvcGVURU9tU0pXUGtNbW9YbnFHQTF0aTl0R0RtcG9QNWlBcm1aWnpl?=
 =?utf-8?B?dzhrbTM0a2QxQ2tINTJuYXdsL3h0bCtTelhZOXoyanZiaEpMNkZRdlhQLzk5?=
 =?utf-8?B?VUUvYUpybVpzcXcwdmlkeUIxTWpMZytNRnBCQXF1SUdkamRZc0NCdkNFaWpP?=
 =?utf-8?B?ejF2Zk8vWTRkUWowdWJDbDQvU0N3WXRDT1N4Z2V5MElRTTZScHBLTHAxekNC?=
 =?utf-8?B?OGlNU2k1WnExVEVKejA4WUpwMkx5UjFnT0p3ZTdtM3Rrc3AwZzl1MFBNN09p?=
 =?utf-8?B?ODhxZ2pwVGtKdlJ5MXpUZHZ0WXJrWjZVaFNobVZ0Z1Y0WWs2bUZWaFJFNllj?=
 =?utf-8?B?VWovdk0zQ3diaVdrc1JiNXJheXJJV1czMExQQTF5cDEydnVyc3h0Zzk2OWpp?=
 =?utf-8?B?cFNoZUtWSU5iUGp6SFl1RDc2SGpEbThZdnBWVEdxZ0lBSTM4T01BSGJoaVEx?=
 =?utf-8?B?NW5oMWJKSEVmb3psam1Pa0VBckJtUGdsODhteXU2TExRanErOFBaYUo3RWcv?=
 =?utf-8?B?YnNKN0Z2VW16WVM1WlhFT21RZzNIdWFTK095S2VoTWx2WHpIaVJvT0Q3Q1Y3?=
 =?utf-8?B?bGpHMC9VVXpWUHlyT3cvYlNLVTBUTEZKM0l2MC8xQ3d3WWtZdXBIRTZkOERW?=
 =?utf-8?B?L3lsS0MraGRIZFc5ZC8rcTdlcHRNUlk1TERORm9aVzNwUUpkOFhSaUFkSCtW?=
 =?utf-8?B?dC82dzNyOGpFSW8yY2pabTlvNjNJRWFkWlhjNEU4OHg4US8xTzNZMUZOOUNi?=
 =?utf-8?B?L3R2NWNLTW0yZzY5RGU3SzlrYk8yLzdZaGxjWHd4K0p5MExybExEQ0Q2UHZv?=
 =?utf-8?B?Y1hQL2Vmayt2VXprdUNaVWQ0VVJkak5sNWhHdVQ5aFZndHJBMUVGcmgyeUpa?=
 =?utf-8?B?Q0hwazVReHYrckZFdjE5a2phUUYwV1I4NUNJQldXWTFuVjhJeG5NWGRGNkU1?=
 =?utf-8?B?VDQ0VytPRXRuWU0yMFZ6d0FCaDkwcVpGRnpVSjBlNStUdmpkRW5XcjlRb1pv?=
 =?utf-8?B?L0FCeU82Um05M2J3aWJRTEIrc1JscHprNnlmMmRIcXFGaXVJcDZMUTQvMzZx?=
 =?utf-8?B?YjlVblAzZXcyajBUVHRZQ3MzVkltc05vZDAyKzFCK1doZlNVWnNtdWdvVmRN?=
 =?utf-8?B?M3FzWUw4eXJveENOczhadkE0TGNzVHkySWRMR1JBcE1TWEx5RTdvVi9udW1O?=
 =?utf-8?B?YnRvK3diZTJCNWtMWDZjSXNnaHd0TVRna1NpcEdNUGNkY0wwL1k5NGM0MUl2?=
 =?utf-8?B?TFI0V2lyNjZNaWIzL3JCSFphSEZMblZ6cllFQW52eWVlaDNwdnMrWVJ2ODFU?=
 =?utf-8?B?Zyt1WGcwQkxIVnBKY0NrS1M5N3J1dWN6c2hXMktoWkNxN0Y0LzRmMzh5dUZh?=
 =?utf-8?B?c09NdXVwdTIzMnpqWjF3ajJqR0FoVVRYY0ZqRHNFTHhvcHVpMUVMWFc5V3lh?=
 =?utf-8?B?RW9MVmxJdVYxZDJqRG1yUVg0Q1dMMktJMXcxVWp6bWVrWjN4Y2VESlRUK0dn?=
 =?utf-8?B?dFMrSHRDdWFEenZEY0syQjNoWEl1SElFZm1sS2tPa1pTZFVtWHlzcEt0ZTdj?=
 =?utf-8?B?S1VuUlBhTTRENUErc1V4aTZMZzRiZ0xzRGZ2K2x1bXNjaHZZZXVISnNFa016?=
 =?utf-8?Q?P/c+mvm3nc0bWUnpfQL0lEYmuaQvT+HYhSQgiGY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f919cb-976c-469d-19b7-08d932722cdf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 16:00:21.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hix8lf89OuGLhHC0kX0quuwvTCE05Q4NP3DLAf+x0r5+9/QKDhuk/ahErPq5dEPn+5KXRMrIWbRKAwmzCzjVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
address range") documentation correctly stated that the range was
completely fixed. For Fam17 and newer, it lives at the top of physical
address space, though.

To correctly determine the top of physical address space, we need to
account for their physical address reduction, hence the calculation of
paddr_bits also gets adjusted.

While for paddr_bits < 40 the HT range is completely hidden, there's no
need to suppress the range insertion in that case: It'll just have no
real meaning.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -349,13 +349,17 @@ void __init early_cpu_init(void)
 
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
+		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
 		eax = cpuid_eax(0x80000008);
-		paddr_bits = eax & 0xff;
+
+		paddr_bits = (eax & 0xff) - ((ebx >> 6) & 0x3f);
 		if (paddr_bits > PADDR_BITS)
 			paddr_bits = PADDR_BITS;
+
 		vaddr_bits = (eax >> 8) & 0xff;
 		if (vaddr_bits > VADDR_BITS)
 			vaddr_bits = VADDR_BITS;
+
 		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
 		if (hap_paddr_bits > PADDR_BITS)
 			hap_paddr_bits = PADDR_BITS;
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -524,8 +524,11 @@ int __init dom0_setup_permissions(struct
                                          MSI_ADDR_DEST_ID_MASK));
     /* HyperTransport range. */
     if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
-        rc |= iomem_deny_access(d, paddr_to_pfn(0xfdULL << 32),
-                                paddr_to_pfn((1ULL << 40) - 1));
+    {
+        mfn = paddr_to_pfn(1UL <<
+                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
+        rc |= iomem_deny_access(d, mfn - paddr_to_pfn(3UL << 32), mfn - 1);
+    }
 
     /* Remove access to E820_UNUSABLE I/O regions above 1MB. */
     for ( i = 0; i < e820.nr_map; i++ )


