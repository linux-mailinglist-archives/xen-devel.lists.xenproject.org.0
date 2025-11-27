Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7CC90464
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174417.1499374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEM-0002aA-DT; Thu, 27 Nov 2025 22:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174417.1499374; Thu, 27 Nov 2025 22:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkEM-0002Xu-A2; Thu, 27 Nov 2025 22:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1174417;
 Thu, 27 Nov 2025 22:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0cJ=6D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOkEL-00025I-BC
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:12:49 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 351b9ff0-cbde-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 23:12:48 +0100 (CET)
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
X-Inumbo-ID: 351b9ff0-cbde-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLzjzjfADEmMRV8KCcSEIq0wPiJGwLmNsfh7QBjk05ObWNuNKE7tt3TDF7XhaDLuzwg8UIH/JqHxJeg+ERqw7O0JvCJUz0laTWdbrKNzSy4J+6Nxuce5osv/o8sbWr36qGZe0NuJm33GQY3rMhEtiTwgGeW7AU7YwKZ+0Vmnfa+freIdYglAtkzrj0eOAyW8vpl/ESx6gk1Fmb8hC4AbMIymEfwZRs1d+JuFeB75BFXUFWzwjffXGTn3YB6boIgXnDA4c9E14m4XZFSBhDkXW1CqdWlTq22rcPZcN/4t8uyVoNg+gWBMyAf81kdZhPgOLBO1Qu3Fe3XsuoKnlBOlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQRm3HxkVTSyhxJQFpEPpXyTrghOA5eViQECT6vFLDI=;
 b=YM7EHLiyAf40J5y8LRG8LPj+32kDJNOkTLXpTcF49hSugZP74L3VMBoza2pW95F6aUwzSeaNDIJh8LNceDCu5sIaHhJEneGy2JB8QAn1egWyKPZmoQ6GhwX2yGdx4cxHLvhGlMpPSGEssuIli8ho5ujffWMQxul7IuIP5aOFDT09CrgHJ3iSuBtHWZhL4Z1Iy6VoSZn4uPi41ZrZr/My0Z3Py0ogk5Jp5CDLcWsaYFqyxk7jC5CUWrupGNUqu5OPq26rZiCklEfovR+WBz+Y/CVGrP72hh62brv961wbLU7A2rN+s+UE3R6AJqiH4wzbjq8AgpaQlDvd8wFtOPgtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQRm3HxkVTSyhxJQFpEPpXyTrghOA5eViQECT6vFLDI=;
 b=lY0M0y6orpE89iqUdy5iBpOui7+0etwbinzH4SDuaYhgsbgpt1Ppp7Z3YcqgM2a3fXean/0aygdNb28UoNPyncrP7g/DH2Vqo7yFZBfL37B6XN3eMDItLw0PA93dOGGh6ptNUmZ1kCHsamDAiIJZx8gV+lNJh99V/xnoEZF4CslF72OVStC/FfaUD+4y90/6081WdaVOVkYMEtzL8kB74QSQ1eWQQbRgf6YCosyfHG2O79BqoTz2+HJpdKZVOW/61xxLOhb+aSQx/Hd3X+XkgM6NDRjVuPfQ0GDsAvm7hLsqfwUN86wZgzbEnYv68MBwfTenTSIyRxm59n8H0L+cgw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/3] arm/ppc/riscv: drop unused domain_set_alloc_bitsize()
 macro
Thread-Topic: [PATCH v2 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
Thread-Index: AQHcX+r1c6Bx9R94PEqg6lQrbZuXBw==
Date: Thu, 27 Nov 2025 22:12:45 +0000
Message-ID: <20251127221244.3747918-2-grygorii_strashko@epam.com>
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
x-ms-office365-filtering-correlation-id: ecd6b33b-6e31-4d3c-a2c1-08de2e02180c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fFP/xMSi9knUsiAxUOlJn9i88DOtJIHlECI3tkhBzwC6SaqDsKUVBT1CGd?=
 =?iso-8859-1?Q?kavZZ448LAFmFTr71QhEd5eQ9n2CLe6uOucG8dqresgnXLk4x77sskCfsQ?=
 =?iso-8859-1?Q?WhHwcv4uNs0Pa+oUOk71KigQXHaz/ho/ajiKs+njLxfiN/4s6NNSNlk+Sx?=
 =?iso-8859-1?Q?0qHNnHGbZ25Thf8GMpZtm4EyWm2wWJG1gvFq+V9RnjfYyeHi1NGS+MDmF5?=
 =?iso-8859-1?Q?QYgT3OTZfHOBNPA52fQvZ0KeWO/Pt9TYfKFttIcilT0wdfxPTSWRBCf0az?=
 =?iso-8859-1?Q?+9SVPZBRapgnJGwyWMGOFshVPYjGdsBhUolUAWVn7NikXeAJsBUFqf4+GI?=
 =?iso-8859-1?Q?OYA97SAmbN7ifV4/UzCPfFNjNm/wxF0R1pfkwJ6Nrplp+HiyeRBhcU0lYy?=
 =?iso-8859-1?Q?AKVtCU2S1/U6dmOTbxC9XbtXmo8ApPj/lmRqUQe97FxN6mdTRDMIBgydKx?=
 =?iso-8859-1?Q?nhQ4uneZfgC0MhvZvCobeUaTXFX8Y6Rll8gUyqiY2keHZMDME+SWSTlT0r?=
 =?iso-8859-1?Q?AxjiIlGFaESaP9twWA+AzAWuYmW0945pssTN5/X24JAWnFjdbh/1kGMLl/?=
 =?iso-8859-1?Q?BOos6ldGV3o/9EeFyT4Yywr6V92FRmJEUawVwbTE0dnHJZ350aY5DAiemO?=
 =?iso-8859-1?Q?tDNmsEt/uVkWc99bqPVUaQH7LzYBDKbcL28CvZVAyWj7ZepOI+NqxF1eGi?=
 =?iso-8859-1?Q?pNRKW5zYKsdJqTq00ybijCcSy8qULEYXSJEug2oUmNKBEiyizNY6zhMuUi?=
 =?iso-8859-1?Q?Bx61ZiqvDgevK1VfAz8A+HXN2DTCaV8Jjku1VpxYrxh47auOIimPLLw9UL?=
 =?iso-8859-1?Q?4kESkKydpZBxiHjIkpAfHO5coZwWp3zwssnYsovEv7htrbldUseWduTwgp?=
 =?iso-8859-1?Q?u5l9ypUKlRp2zQWtgbtMlYhPb07JRYuI/7hN8uvpjvErg84dLS5Q+N48Mz?=
 =?iso-8859-1?Q?zEs4F9P7VCErwekhO85xW+dKNqhQ4674G/w9em2s9IXuQK0PFdLEwJGfsf?=
 =?iso-8859-1?Q?dUa9y+G7WylL1hzTJeRJJ2iZiifvor86akUbmUco9l0l4GWuv/pTI5y6Zn?=
 =?iso-8859-1?Q?H6eA1c7jm51ckIVb1AUf/DzQHv8UcAofC7jrg1QMN2zWMF4ckS7G0APtmq?=
 =?iso-8859-1?Q?qFnFsvz/2iQMO8hTMNHkjWaC9y77tv3jh7y8e/JVIh70wfY4H9XZNgDp/O?=
 =?iso-8859-1?Q?fJQimVHoCDRfxVWYCY0rjC4FkkaIMSq0WIlT0BmVL1bFPm6K2zayKLixfY?=
 =?iso-8859-1?Q?hgUaMKtkV8U5l9IEdPHYByPDW20BWHNgLCJNk5bQzlJ//Xc49OthP8kYfh?=
 =?iso-8859-1?Q?Nq/OlZPes2BzK4/6Iyf7VKsdi6vqgdAnh+/ASM5i/M2dE2PTDBSvwWk2XX?=
 =?iso-8859-1?Q?NZnxTMzdrqMVpD36VVB6Z5KywFs0Odqng2dMSKWlliMkkamWx8i+8U6syM?=
 =?iso-8859-1?Q?zO+MYszt/vKDqdQozHnr/LGh82Cfn5+0lz0WYBvq0pY5BbSsTLwtqDuu3m?=
 =?iso-8859-1?Q?2S+qEjmDCZI5ztK84BOLwQsdMOL+0xEMoo4xR46DPSix4V8keQn4krw9iD?=
 =?iso-8859-1?Q?u4Hf0sZY46hqK0vAVnSPTZF83xKj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GucrcpWWnBy7xEfYZqgBYJfPnTaHv1O/jXRx0e7QuSCll5GSt7+aTTT2C/?=
 =?iso-8859-1?Q?kL3BnNgMrHzmIidLkEFKOLuXR7JBjRsCZVPLSQIn9FnFlhHIx+ds1oDDWe?=
 =?iso-8859-1?Q?oLBSKiuJZU8ogwGFWad44yh9a4/9a2pIgaghMayGi8ZgiPfA8PAiG+WSbr?=
 =?iso-8859-1?Q?rW5SbwgiDk9NAyKpUa3JCmIPEyTFF46h2m2onRyh88/eBlzkj4DxvQYimj?=
 =?iso-8859-1?Q?KS0mqUv9mc9nUUFRiNa1GrfDuLY6PTdTBCrkHk5+z9bgqA2sWsF1XrA4DP?=
 =?iso-8859-1?Q?6bVvfc5Qe2whbuRz2fjt5vyaN0uNm3nS0w3YiJlOGiznFlyJD6J5w5dqcq?=
 =?iso-8859-1?Q?FzIUGVe/PMRIuaQlmiDoCA50fLQXiYhMHTLYnJSXFdfPQPyi0f8tamTVc2?=
 =?iso-8859-1?Q?m7Y8lAUJ1iB6i3O6QIeEpUJ9vaFpQYF4zWpBx5TqjyMKi7jzMMBJqVK+GR?=
 =?iso-8859-1?Q?J4Y2lioCxw7/p8CLwXKGCvecYkaWV9QioGzJ605EL4ATDKn3y2p07RQqgP?=
 =?iso-8859-1?Q?0xbnnxY1XzwPegcSAiUqpX2iS1T0m7j35VCX8aTKKU/p9bFhwhqQH23/9q?=
 =?iso-8859-1?Q?raCMiupzd5WuAppMQm/5TDYv2jeEigX/p41GM6AiBWen68N7+7orRvRg3o?=
 =?iso-8859-1?Q?0+yG2p2v74+DM27U+31xM5uLkIe/3iAuQsAD+oiPb7FpfPyY4jgTV5Cbwq?=
 =?iso-8859-1?Q?ysMqcemOCJ92DTZLjSu4Vrf09I+qDuEMAT4VtGcoUd6WYDCx33+6VfsgxE?=
 =?iso-8859-1?Q?ZP2AVgR/fOCT5xt5Qn9etJfK+Rcd5UBsUpr8IGxVQZTQoA/FLMDFZ9rADu?=
 =?iso-8859-1?Q?pRusH4WmnWWX9e6FPYSITlbBmdNOvhpNe4LW9A6GUAQjepQF0yJTQFO1nH?=
 =?iso-8859-1?Q?LUJLJ67QXr/pzMyxObR7xReiJNThclDK3uHK9/HzWA3ZsF3jhqI6EnTmdR?=
 =?iso-8859-1?Q?w/yEW9fRuFoOaKCHK4vdQCyQaSURb4QkjVYtmBjMY6gHFV+SPjraaGqtCd?=
 =?iso-8859-1?Q?1qYbbdmZ7FDuUJamkHBqR+zeZK8uMPMKpYAtXD1r0s0xmRctKQ2F3GluA1?=
 =?iso-8859-1?Q?70h/eOqDN1oC8YxQhxdtRMRkWtOmv9eHoVBi7TfTgvh2qcmiKVA2crDMc1?=
 =?iso-8859-1?Q?B0Vz7VhmWTUCP9xhRRH1MdEv6CZSxHrfj17G/YXqU4Ub3kB37DTUuhjGSI?=
 =?iso-8859-1?Q?RrJrfbzH1aFdc2EGlMMX8H/uuJ8wW7XOr6DxPNQu4fwgPX3cg22I95EfxR?=
 =?iso-8859-1?Q?5Qhanxin2piijq6nqfA8fEyZkTbEpZzr20rWgSf1L+pIwZ6Q9bJKRIvVXa?=
 =?iso-8859-1?Q?Goz4r3NpRHbVMSbvz7Qo+WzdA/orckOdarieQDIXAmPLyR9X7Yv3f09yIv?=
 =?iso-8859-1?Q?Ie+dZ/0JOWzCV0gACkTg3Tp16cWDoreIa4Sri24SAto4BnpIAj6L1N+sZU?=
 =?iso-8859-1?Q?IH0IyVkZO2T1NOCiy3uKYXdgON/CyuGNCjM0Wl/Ul266mNoq+q9KS+/NW+?=
 =?iso-8859-1?Q?MZN1rhxBN/q2KFgBLiKPaJX68S8Rf+eMrq8VVl8MW6fCiELmAHeOH01Tel?=
 =?iso-8859-1?Q?VWwLgsOz3EXxVi0ApiG6xvXtbHRZfZxetVjR2ks8SVi+0wdc614MLGeS6j?=
 =?iso-8859-1?Q?/0dnhEzMA0TKYxInXQp/SzKP9dqsKyMD3IA3cOfkw8wQmYaFg8z57+zg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd6b33b-6e31-4d3c-a2c1-08de2e02180c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 22:12:45.9834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmsCKZHrXLoYN4jWws37C12TXUFH0ilz0MlCZt2v3NamjiYYXXN+M9aCws4uNVuHvJ4ATB5c5P+onSfqZjedhxeGfySTL0Tr0yefdVL1DQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10621

From: Grygorii Strashko <grygorii_strashko@epam.com>

The domain_set_alloc_bitsize() is x86 PV32 specific and not used by other
arch or common code, so remove it.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/mm.h   | 1 -
 xen/arch/ppc/include/asm/mm.h   | 1 -
 xen/arch/riscv/include/asm/mm.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f702f4a0d676..4c6cc64aa7ba 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -313,7 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vad=
dr_t va,
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
=20
-#define domain_set_alloc_bitsize(d) ((void)0)
 #define domain_clamp_alloc_bitsize(d, b) (b)
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index a33eeec43bd6..e478291fdf55 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -96,7 +96,6 @@ static inline struct page_info *virt_to_page(const void *=
v)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void) (mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) (b)
=20
 #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h
index 9283616c0224..11e9f26bf0a5 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -292,7 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long=
 mfn, unsigned long nr)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void)(mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
=20
 #define PFN_ORDER(pg) ((pg)->v.free.order)
--=20
2.34.1

