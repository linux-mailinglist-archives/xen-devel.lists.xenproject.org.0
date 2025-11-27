Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB8C90461
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174419.1499395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEP-00032t-64; Thu, 27 Nov 2025 22:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174419.1499395; Thu, 27 Nov 2025 22:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEP-00031B-0I; Thu, 27 Nov 2025 22:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1174419;
 Thu, 27 Nov 2025 22:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0cJ=6D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOkEN-00025I-BW
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:12:51 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35dc3522-cbde-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 23:12:49 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB10621.eurprd03.prod.outlook.com (2603:10a6:10:58c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 22:12:46 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 22:12:46 +0000
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
X-Inumbo-ID: 35dc3522-cbde-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8Mkezp6VLurQiL3gjYFOV75gKWnDTk7LRqvmjujlLGr6a0UmhNOsvFdRCjuJLrBEIQ3z0iDb7gVQF7Bik4lGbR4HeoPe1e3bNSXbk2kGbBdXP6fTs0O2bsay155B1xAqz9mo0SWHS8SBX6OFooY5qHXAsgkKvXL2OcmHIeC0dyk8dfxweEGt3LUXKGqYa1Fa6QpGIT9qg0Wrh7GMgDivT/GEH5ZC0+E0vXeoyfE14BlmrbcGTDA98MZ3r+8+FI5Vz7tGf3l1uh2zsMIEkq9NzAS/rXu6InWl6dVfYWSxX2rYumYwdI0NkJqqqA7gzxcOAqBFVnWaSMVb6CoGl/cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2VabjAmDXqVHj1M9FrOzZiXHDhT/Xn3MZjZAnmNjS4=;
 b=d3iOWh9MdvuCv+DoDIxm4FoORsu1dvyIvhOkn5cqRgl6g/F+eWXSkYh71r0ST3szddtFF8yXLsuux4BSrwb4Igku5Fg1ngHKsgLaH6DGyFTyOr1StVbzcH7x3W10hKgWxMGRoiCqhIRQd/XCfCauERIA+mI49OaBYQTWl+MVSaJUIw3GcvezdYUI+jdhAIo80h0aqNdzhTdPqAFVLpVHJzxjvck8EDu5tQ0pKf5dkchBbrTrDWO2CLgG6d6KawBwos7h5pq//s+YgChaX0IJw9mwYzIMnoKqvkjZmG2FHXxOple5w8pufe0x5ePrk+39MNc0dB95fy5rAfxmVH1tFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2VabjAmDXqVHj1M9FrOzZiXHDhT/Xn3MZjZAnmNjS4=;
 b=BqK6xslbaIzV9cmbOytXGxTEikDI6WtrFFGQgKP+otJX5UTkeAEJw2uLYE727zalwLvg3v0HawA4kQWqwPaSbt0OmOyAg/pVwNHyQgbdZQ2dueLgkYE86UUXBjXxvtIjFcwIUXO7QRon/YK26thrts3oGKDHI1QSHaYd/3GZoVDj5Il+QLJsX4YokbfvUM7TmjymAVrNlTfs1t1K22LVQHS5ecNKAQ70JzKc6BDn1KYlt7ZdPci8TROnFyydkA7O9xuov43W4PJpQdMsD+DwnLifcmObVJOYbpM5zQHzndS7wjDFdWv9UQ/uBiygxF7lNlncI9wsCcuIxvlnQDvGbg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/3] xen/mm: add generic domain_clamp_alloc_bitsize() macro
Thread-Topic: [PATCH v2 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
Thread-Index: AQHcX+r1y5G1zO+uXkmHPH1zdoklgw==
Date: Thu, 27 Nov 2025 22:12:46 +0000
Message-ID: <20251127221244.3747918-3-grygorii_strashko@epam.com>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
In-Reply-To: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DU4PR03MB10621:EE_
x-ms-office365-filtering-correlation-id: a37f8bfb-c573-47a3-3f8a-08de2e02183a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?f8lbcN9LMTnP4KMnhPeoF4SNYLpIt64uFz1KY6WFx/6daSOy+dOWY2/M4O?=
 =?iso-8859-1?Q?DHcbuno5Dc2Av3Sj8olG3RY//amcHbmTAJKcU1GXVXkQpcwlHPIMXVILsO?=
 =?iso-8859-1?Q?8DxvLIm0OUpoViM6QfqRWqSXdUop+cZbTQNdZj6gMuGverr8BPVdsJsXvE?=
 =?iso-8859-1?Q?yO+LgS+CDMAMmZioKsFrXYakd6J5y3XG77QwV81gXzlm79Rpx+YdUoQN6n?=
 =?iso-8859-1?Q?FW5kS5jbiD0ZNseYbzPedB1lSwLiQwkF0Kkg5BSs8YE3W5af3cYHdJWJB7?=
 =?iso-8859-1?Q?+zq/qSfWGPTG0YlQBevn49uQ6FHnyvhWn8KLc6glCF91SMmeWoQjgUy2T5?=
 =?iso-8859-1?Q?pLEUFNPQj2kTo2dj+yMfMZaoKFNa+PYd0RoVaMNiVDJd5/pr3SZjuixODj?=
 =?iso-8859-1?Q?KpOWp1h12JcwUQpUpsFaMo5d5PalfdnBWSqL81uVvETyPKvWTauPpQCSoL?=
 =?iso-8859-1?Q?0BdxsMiTzKhC9JVGFBVvTJ5aLVB39oIC+tnVBumO7my2lQYD12BdlNs3Zf?=
 =?iso-8859-1?Q?kAUh1ZoPDXwL/Bp1FVXO+3hFyGJibqBzZcRurl52Qe/vvP4sBlQ2PXTezH?=
 =?iso-8859-1?Q?1nQC3Jc8Y+CEPbMNODUK+FM0wU+NZG8N/ZGO09iKB9lyVscokbybDWUFQj?=
 =?iso-8859-1?Q?/FWubjAVmZWRwo+ZvHwz75WL1tlwHOixcL1vQLW2S8fKVGREuQDYTNRc5n?=
 =?iso-8859-1?Q?WtEc3P24MOLJ9LIBqvirUq8f7zp0y4UI1Jc097TOYpVjZfvW76a9zX+uL6?=
 =?iso-8859-1?Q?32TfhPn4OALVB7tsl7RbXyhCJSM3DNBLwVy5T/T4+mxSBkJRFlDjHhoujd?=
 =?iso-8859-1?Q?FzNsxBH3DiRFEBnaVY4n3j4G5MaHHR6EKl+bwXW/9ZtooWrDU5maqaDpZ4?=
 =?iso-8859-1?Q?4q3lJNO7oC2HNhLREO8NF+l0FTUBRYIwe07WogI0KDGSWyOE0+NojkrqZ5?=
 =?iso-8859-1?Q?9PWlL2nd76f7iOghgNH5+ZQ0q04M2Rw5WLgjykOU44EvxNSE1OmZswALTL?=
 =?iso-8859-1?Q?ot1CEHdpJwrN74pAMpojK+IVFXgLhn6jEDDFGffB6uqjrB56vVPzKFagCz?=
 =?iso-8859-1?Q?PwGJStlw25pBidBpIQcjcmkEiZ7WslXb9jHkzeNmdOWxcAyCGRm+4xH/d0?=
 =?iso-8859-1?Q?oHgXD/VVrQaY3EMt9MySQOG4GtRonz3/YqlHBSS+0A38hclTD26+R6y7xQ?=
 =?iso-8859-1?Q?p87+Hk4LMHIrQyUnRKT5FSFKIHMfqtTKKo5P8GThgAJShSgyyOjinCmRki?=
 =?iso-8859-1?Q?XnEG8v/kRwI7RYhjgKvAQTq1eNslzA+rIJLTOcg8/q3v2UGJ3tQJSVDXpe?=
 =?iso-8859-1?Q?mBpqFIMoupgI8+F0H31r+R5lHqgkMvFAxIWJGHAsMoz018Ew1LpZXEaDSL?=
 =?iso-8859-1?Q?lQyPmR6Gsr4xE9jywm79J5ACs7k0Eq3T7DeJ2/8Mh0zIOBEo6nVqCpeVjc?=
 =?iso-8859-1?Q?fL04ANbOw7YrHF6ZuCq+ofeIfoBd09u2AYqUuKxKImqHVlzdGkYCrgyqg9?=
 =?iso-8859-1?Q?hTTrM53nFa7M9WseN2Kqs3TskFtxUnFf09auqw57f78jFd0FtRr71PlcYs?=
 =?iso-8859-1?Q?ZKn2Lb4XZBdcKnV+TQCXYRMS/lhf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mkEjW0n3W+NwMTRr0vEgiqcUXk86BtfmUBahtD6hiliUOg810uzBINLSvc?=
 =?iso-8859-1?Q?bqgFcwiEDeZptGQ8C2uOo7gCoDUuZPJhfFj0J7Ns2EJG0bZjM3TYxL4BXT?=
 =?iso-8859-1?Q?+t8bSMspuYiwu0SlU1w9jOlwhsjIQ/Cb2rg02XExAgmLl/bxTZYPL3+Q/p?=
 =?iso-8859-1?Q?oR7SyIHMNaZTENC/vJLl/RWbEmSlbBo70v073eiGDrgLkLZx3d2TKkZbkY?=
 =?iso-8859-1?Q?8RQrjmMLWfGXinSlqlxFO23tas9nSZ6WiX8eDbc6nibDAL+PKDWYllhnfz?=
 =?iso-8859-1?Q?3TlqcBXFJiEMyYImMyZd6u7sd6quFKraukkfBvgDhhXfndRjmHxB1FNSuk?=
 =?iso-8859-1?Q?uUJirsUeiVElF9aRU5bv2mgACpy7OFr4ZYmMhIitFcr/kyZhspNR9wmreU?=
 =?iso-8859-1?Q?k/7xTwTEjhrTJyGf2q5+9LMdNE9YX6VpsXVDzZzaBnIs6qTcbeMMuQ5N5L?=
 =?iso-8859-1?Q?ruAhxmO7NrR8ZLEIikr/ssMGksvAzXs4pzXW75phWx/J2KFZkkP+bFPcKL?=
 =?iso-8859-1?Q?7a2j66CsXCsPA/Fj9MvMG6yLOTEaEBZsysd2XNeneMr37YvLE4lfCMCxyV?=
 =?iso-8859-1?Q?B9N3PFE4xK2s1PuQxUqVbI1bMHPHw+3BR80ikLya7+1mt0mLjkdcCK5vlo?=
 =?iso-8859-1?Q?/o8SNjzK92AD2a/pkSGv68agwMh08el2tUjGMOSVDjyProCl6BdzRCT561?=
 =?iso-8859-1?Q?i+yfzrsge7MHufFJDLHUP18dtkfuo6X0usuQxxwL8TuRx2AguPDdyOdM/g?=
 =?iso-8859-1?Q?0FXs4vP3Qn7DG6JJlg9Of1irut718XFKOO9pCI7tGj1sOyu3x2I7+vvPPZ?=
 =?iso-8859-1?Q?tRs0x7QpRYFJe5FRAiMFYkNfFlpFqkpiv8Zn561CbDlaKpQPLOumJg8Lo4?=
 =?iso-8859-1?Q?F+OhxCVYAtq2AFjeFRl42KEouIZSBb1UWHtpWRQ2LXUewcJh/CDNabZlZV?=
 =?iso-8859-1?Q?DqtBwUCiQ/yzP10CI2BraiEZ1BK1HtDK4AclNZZa6OuShlo16DY6O8tCs9?=
 =?iso-8859-1?Q?hX2lxKZEuGrQNpYb9lIQtEBbfY6A1avp2ZOuT77IhRXFi8N9IMg73PgfwW?=
 =?iso-8859-1?Q?mTiTaKxcCNuDVJFJx0bnw+b1l5llTfL2ahQ/CNnG1+K7AZvUT79nMWRH+z?=
 =?iso-8859-1?Q?4vSV6RSXjNmz1KbvmbQtVQ05ztYAX8KAasnvgwgq2RhFQz8KaTUUPul0V5?=
 =?iso-8859-1?Q?Qj2OY5luv73jVspBb6TXsRXq/tea3iYL/0RbYIeXOaM6+t3z4F0xiWzlI6?=
 =?iso-8859-1?Q?fWKK4DrqCBQj1O5IGK5D5TW8moUgBLfCEpaXOJeFSY4/3i9ieHIb8RrGGM?=
 =?iso-8859-1?Q?7bnWfay1iBaB+in6wTRSsOQhzTTkkJj3FdLnF85OvWFfGWcu5/CM0V6YqO?=
 =?iso-8859-1?Q?ANKh2pEegTaBsm7Z2JPoQTF5To+3ZD9iMzzNYnUoSMhlUfT5Qkiakp8lUL?=
 =?iso-8859-1?Q?sT0NWyhKEtG3tj6JWttOalzXmcYs9OhD3sEl6e3+d6fMbwLYGYIbkp3H9X?=
 =?iso-8859-1?Q?rS1G6zdL0CXz4n9tLsOqP5HIYWTOCxmy3np816eV8nwD4zr1OrLYnHA3di?=
 =?iso-8859-1?Q?xiSkpFuEASBx+a6ggspX/IFYvknT7/QpV20BNnKWTZhaiewxtG4qVyzbBl?=
 =?iso-8859-1?Q?EGs9CNLs0jYFW+RqPvSVkIWp8gNAx/vYvKPn2nQOonfNKyVgWDHcbBPw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37f8bfb-c573-47a3-3f8a-08de2e02183a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 22:12:46.3321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOGsSq2FVsxBFH/Xewk+dNh/Jzw30eaBg3TGchGApgTlNlJOo0EegsN+I3JhkhIz2G6B35JsfuqP+nxLSK88FVSff9PWGQK9QeJeXWrcoqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10621

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add generic domain_clamp_alloc_bitsize() macro and clean up arch specific
defines.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/mm.h   | 2 --
 xen/arch/ppc/include/asm/mm.h   | 2 --
 xen/arch/riscv/include/asm/mm.h | 2 --
 xen/arch/x86/include/asm/mm.h   | 1 +
 xen/include/xen/mm.h            | 4 ++++
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 4c6cc64aa7ba..ec2d2dc5372a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -313,8 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vad=
dr_t va,
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
=20
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
 /* Release all __init and __initdata ranges to be reused */
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index e478291fdf55..91c405876bd0 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -96,8 +96,6 @@ static inline struct page_info *virt_to_page(const void *=
v)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void) (mfn); 0; })
=20
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
=20
 struct page_info
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h
index 11e9f26bf0a5..e5ea91fa4d0c 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -292,8 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long=
 mfn, unsigned long nr)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void)(mfn); 0; })
=20
-#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
-
 #define PFN_ORDER(pg) ((pg)->v.free.order)
=20
 extern unsigned char cpu0_boot_stack[];
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 08153e6d6fa2..17ca6666a34e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -621,6 +621,7 @@ extern int memory_add(unsigned long spfn, unsigned long=
 epfn, unsigned int pxm);
=20
 void domain_set_alloc_bitsize(struct domain *d);
 unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
+#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, =
bits)
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b968f47b87e0..426362adb2f4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -641,4 +641,8 @@ static inline void put_page_alloc_ref(struct page_info =
*page)
     }
 }
=20
+#ifndef domain_clamp_alloc_bitsize
+#define domain_clamp_alloc_bitsize(d, bits) ((void)(d), (bits))
+#endif
+
 #endif /* __XEN_MM_H__ */
--=20
2.34.1

