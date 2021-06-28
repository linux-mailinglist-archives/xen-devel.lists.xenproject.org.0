Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16CD3B5D53
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147803.272816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpl7-00031S-6I; Mon, 28 Jun 2021 11:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147803.272816; Mon, 28 Jun 2021 11:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpl7-0002yf-36; Mon, 28 Jun 2021 11:49:01 +0000
Received: by outflank-mailman (input) for mailman id 147803;
 Mon, 28 Jun 2021 11:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpl5-0002yZ-Cs
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:48:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36be1bc0-4158-4ee4-8a1f-99d21953f949;
 Mon, 28 Jun 2021 11:48:58 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-jf2029s-PImhlqfW_Oiugg-1; Mon, 28 Jun 2021 13:48:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:48:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:48:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Mon, 28 Jun 2021 11:48:54 +0000
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
X-Inumbo-ID: 36be1bc0-4158-4ee4-8a1f-99d21953f949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624880937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ovgdEUZK4449SSVXu+RZ6OixL9MZGdsajLD/7j3duts=;
	b=OcbDUeKfNEg6zWHr3R4gXKOILVEjc/XJ7Lm28AdyGC3CBybqWNrA87BTZ2RaU+/KI764uh
	J4vnY8/6GzrtebaeDpk5gcfSVptzzNS0Wh1eVWtBeWC4oxXVp0dKQI0o4csuXVxGIPW1A5
	79YPR7HxHnHY9BE4s/zxjuCnc+Rno7w=
X-MC-Unique: jf2029s-PImhlqfW_Oiugg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWtx65viYSnF1HMwMin9jkSjtCKchyjuO4qv32ILRJSG66JCq5lvnfHmZ850YjWX0W0tvraaLHCAJT8E05Dav14M48ni56pzgF1yztnmIG5CijshX5pnupfHLmvjAJXHSwiNzWZYBcvsIF9iAg1EPX9iq2sCm9pkWPu14FVlhHjzao9mjrLUqeJUGQg+UyM3kgRTvQcb+96qa44qnYe+LtVN+rkmZpEjZtn2Gda4NGqrQYtFTo2tpp8LLGbUCIyE33aVhn+fyhHHmk7v3cZbkgFK0GyQdQ6JPVI3xzdrgZzbUhWl1QCVZkKqn85Bd7wOd5nwpQc7+A7d7+iVMPbSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovgdEUZK4449SSVXu+RZ6OixL9MZGdsajLD/7j3duts=;
 b=WjpwJT3dVgGvXZTh5yti7WjhJxtdxnMsBitRGOscoq5q79foaykYRbfeSHXFPMpaZ/M6Vl3F+ofs4NUM4BjUylmpqMgXavaxCaBG8uan5clFdwHVZz78YYwv2bPpB3zdgaNIKMcUOQY4FOGbUmKxr+qvLHIz5/6+IpjEIA9t8TztaYrpWRBQq0PKzG0yEAOnzS/BwLCEmHe8IeIkW4QtqEMDe1dQeFldkY3/h0A0W/QOdnUOAzDMlnwdNlg8JcPxsyB1Kbtt5H7+60xnrBD5kZLCtjPkBQQMVsMZ9HqOjNvHfxS4dPuAxjdfGlz+M8ljxlFi4qnyNrScEN0Kx/1TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
Date: Mon, 28 Jun 2021 13:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e65e1c-5cc4-4cd8-f108-08d93a2ab4de
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638263AD1FF4818C58A78536B3039@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p16VeoQqZxI62ze42Gcfuh1mS+NWAy0zGLv3J8R+DHUeF3AqYhSWt/UdMOLdPRF4XEYsn4fo6B12Is3rgQ4nB7FDRa13mZVSlvzTKt2xcgNFvnOcGTObdBjp1xV13x6gKdjwNahwAMUjVyd09GIvhQ7KmS3EMYh0nlv/h8SdfxsepjdZFswQ6Eu4TMl4DWQxueEm00hDr2m5MVpNc3tMYzaiZthBMLV2LJzMH1MrPJ2JHbGus81ea1eULXRpRaHg28btGyOS8X0hLulY77/2xz5tCy4oSCKoae1NwrA/5BLFpa23CDpNOMjbG23uD7gM/LRe9U729rXQFnNpYeopKH094MO9MLIrTzNAqQzI7zPNgTd3IuyDhFyqmzGS4uodCToW//GPHJKU6i6uLONrzDIkfGmNfV28aZO3rCuRRUN40G3Dq9kkXg86BO75zgmHmc331zpoLU8chKZzoRoQQuIDHqLUMarci7Wu26BX1cnqF0jQXQhz7qv/SqbgLd9avdxraOU40Jhd9I/vQZ42ri/nwCnGIoCWF7apCRozUft59l4lU1pzyjIfR1U4IJlZPBp+sswRDvT32j/UFwL6v6JppiTulXyUZ4wocnUShfB6u/PRLEsHAO2e3+x3kjiZeWkS6RS0Bu7089AySn3Lt3R0DSOrhYFGZ5sZHJRxUdNUuphPdM1nIr7jb7MqqYP+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39860400002)(346002)(376002)(6486002)(8676002)(316002)(16576012)(54906003)(31686004)(8936002)(4326008)(6916009)(26005)(186003)(956004)(2616005)(16526019)(478600001)(66556008)(5660300002)(66946007)(36756003)(66476007)(83380400001)(31696002)(38100700002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckMwNVRKYVN3cktCN1ZoY280cFNxVWtoWVpZRHBUL2oxMnJaUE5uUDF5RlU4?=
 =?utf-8?B?bk5lemJSbnZ2WElRVVQzZ2tVTVRxY0Q0OGNZM3hiSktIVGxZVGhqVFFUUmZB?=
 =?utf-8?B?TDZBaVY4SlJHM0FlVXRMWkxIRFZjZTlmQ0l5VTdreit6Z0FCMU9YMGNHUFN2?=
 =?utf-8?B?Vkpib0NIVWk3UmxJd0ZQeFZ1blBYZ3MyUVpMWTNuZ3d2cUdERE1STzhBR1Na?=
 =?utf-8?B?ZFgwcjRHK0FrOXdtN0Yxcy9Va3Z6cFZQL1M1RkJQcmVjWWlkOEhNRytKYkxC?=
 =?utf-8?B?YkQzTWtLZzA0b0V2SDdMVzVNT2tXenlWR3VxUkZkaXp1RzFYUG8wM2w4NEZZ?=
 =?utf-8?B?VkJxWjBxYjd6bWNqNFd1ZGZXbVFtbEs5Y3oxdVdFUmhPcU5ONTNtZUFodVVV?=
 =?utf-8?B?WWM1OXFBNTZESlMwMmlKd2YrOGxreENqY29vWE1meXZhbnlVVGQwYTNQM1A5?=
 =?utf-8?B?cktkVHR6Zmk4NkVFQUIweW5YQWtQL2RKdmhGR2dwb3JnbGxMVG9YVDByRmR5?=
 =?utf-8?B?VDNHdTRQcXlVcjJERmI5ME0yM1pDQUsxN05wdlRuV0tNK0hybSsySndRK2pL?=
 =?utf-8?B?dXdJYzJaTDd6QlJPVkVCcU9wWElTRVdmV0FmNXo2eTJoU0JpWjgvYUNYLzcx?=
 =?utf-8?B?SGYzM0FYVUs3b2Z3VXVEVGxJZXphOTNMamlwTFREdUpPZlB4VEZyWHViK0FU?=
 =?utf-8?B?R1NZS1hiN1RIckRPQVRFQVczQXFKQ1QrVC9NeWc0bDFsWkJkTjVOWWJpUm5j?=
 =?utf-8?B?OE5XYU9KaWJqSGRKYzZRVlVFNzlXZEQwQnhkaXZKREtvR0tzSW1aOFZPbERV?=
 =?utf-8?B?OWdVNDNqRUNyejhyMFBaSk90cGpkZFNiNTdiSzNZVC9SRWVOaWcxTlR6VHQv?=
 =?utf-8?B?dTM5TjM4ci9lUEpScEJxRW1GZ2sweVdsUnhDb3E5bUdPUTVrWnptdHBQQ0Fa?=
 =?utf-8?B?c1pwamQyeFF6WGh6YXhGSUFaZ0FET2tuMGEwbTh5Mi9HSStHeFRnQmRkVnN2?=
 =?utf-8?B?V3p6dUFPcm9TcmVnQzF6WUJEUUcwYUVrTjZ1ZitpbzBSdUdoNHJzcS9GRHM0?=
 =?utf-8?B?MmRZOFM2ankzY0ZXZlltay9hZ0tKZkJpbFdscm9CYVZINVV4ZEl0UVdWQ1o5?=
 =?utf-8?B?U1ByZUF3b3RoSTMxb2dhRVpFdkd5bmcwc3l5bnRtRDNBU2UrU3FGT3YrQ0wz?=
 =?utf-8?B?ck9HZjVaOXpIN1lob2s5OWxFTWhMWHcyUXJLanJMeHV6SW5ETllhWnE1NjNY?=
 =?utf-8?B?QWpLTHYzZVVtMU9BVmE3Qm1VTFVhcnZONzZnTk1yQUpCUmg4NS9uY0RRR2ZV?=
 =?utf-8?B?S0lxWmR1YkpOSE1Wd1M1WS9UVGttTGM0dDI2TnJZRDBqZlQwMG4rRHV2OXlv?=
 =?utf-8?B?MnM2QmtTeU4wek5SdERHNG1yRVdwazlSZWNPK0xNQWU5dzBFVDhIWWtZMWUy?=
 =?utf-8?B?U3l5YXJjL2NlTVEraE1aUVJJcDk4aWplL2psbVVsNHloUDBMZkV2Z3VsMjFG?=
 =?utf-8?B?VTYzTGxxTVVRbFBHZmpINk5FbDVXL0xaZTBhejcrY2t5Ujc2SERialR5SVd2?=
 =?utf-8?B?b2Q0RWcrS3NMb3ZFVjBLa0MrSXJCaXJ4YTM3SHFSUDA5RjVjTlFwTkN1K2Rj?=
 =?utf-8?B?d2w4Q0hQdy9ncFZOTEF2KzNWbitjSGwvQTI3N1BmdEFDV2oxTXBuREZSQmQ3?=
 =?utf-8?B?dTdIeFFkV3VUME43MWt4SzYyZHRJN0YyYlJzOTRWT0REZm1uekRhNjc4VXRp?=
 =?utf-8?Q?kgQamhqXjHY/RHZk8gmJKC7RM3nhoxW/cYqx75a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e65e1c-5cc4-4cd8-f108-08d93a2ab4de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:48:54.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWT2y11Inhnu/olqEUBUXb6S//FamNVqh/LKCmbLRuccgrS/mBtG+ePyDfuEn+0IPcxDWouzlbQjc7tWRbZfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

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

Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Move adjustment last, to leave hap_paddr_bits unaffected. Add
    comment.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -349,16 +349,23 @@ void __init early_cpu_init(void)
 
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
+		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
 		eax = cpuid_eax(0x80000008);
+
 		paddr_bits = eax & 0xff;
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
+
+		/* Account for SME's physical address space reduction. */
+		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
 	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
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


