Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D744B2DC66
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087380.1445455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvQ-0003UA-1c; Wed, 20 Aug 2025 12:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087380.1445455; Wed, 20 Aug 2025 12:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvP-0003S3-St; Wed, 20 Aug 2025 12:28:19 +0000
Received: by outflank-mailman (input) for mailman id 1087380;
 Wed, 20 Aug 2025 12:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUzz=3A=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uohvO-00037u-Ir
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:28:18 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 260bd83c-7dc1-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 14:28:17 +0200 (CEST)
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com (2603:10a6:10:417::7)
 by VI2PR03MB10594.eurprd03.prod.outlook.com (2603:10a6:800:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:28:14 +0000
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db]) by DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:28:14 +0000
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
X-Inumbo-ID: 260bd83c-7dc1-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCh16k8REzEGLeIwSGEsh7gJldpdYG0+YgXJIJxGulXCluo0TsBGZ9EfPttjz0MB4isTRsyAeq0T8cNA30u0MR9M+L7OVNqWvl7ivRiHLQtJHhd7OHb0u1esYKc9zm+2c4JZA00ldYY+cX9WfmowTMc1SnOkilJak2CstfEf++pLBZ5ssdX+sthb0itPuWXeISc0ihVyAsluf8ZnAjZjEmavqA3GCS3oX6NvbsStkS0P5YT/v8A2K15zq1z4iBcmfRMx4vmlfmnom8E5nRVSQ8O83XAaS2Rg02V7SvhY6GmatWKRceZhZ2Cef4V/KeiO13iNUyLw0LMmdlQqb++Tpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac0C05LAy+PYdzhYPxrP52vTNes5QbyILNsb61Cpr/k=;
 b=urb5IoQcF/m47qbnFAtD+3dGX03k624gEMxTh4dsCQ1Bn79hr8jGFabP0B3kmVzDt1mYwZCB8mZC8hR/eMIgyx9oXegJHhopQ4Q8d/w73l1pXbgSlrmgHKz4ywedM5izRP+zVVeU3YoqrCRgppBJYnS3vnlYdgQU9UWz6R1kE99So8FiVYn0GE87BdqulhvHCHn54Xj/ye3RO1+6mAEULQ0kbYuzMmEpqCVjXE6605Twq/MJWhIWtL17J3yJJdIuvJR+arnRpSue89VzSm9z/SqfMGk7qgAPLzqwVipxAJFEisQE0PWwUsj1wK0iOzoxdY3Aa483srXDfz2Zz5dhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac0C05LAy+PYdzhYPxrP52vTNes5QbyILNsb61Cpr/k=;
 b=FqFsIHh1EfmpwoAS+5PD6WVLJe42Ai9Ya3OfIsH9otPckJRYBDV9MwA0rERE+l7NewlgdSXYd7cKVSJr+yLK8dYp7O86UaLcyvrGn61XTVO58lL+nfQBDB26hDpEtA/uy8jMTy1IJfQHJgldrsGR9Yl4q1mFCjQJXcCv8ob9JNYniPJnipgT3PCgc5sDejoE1K/Y7zCFm8ZIaUMu2Ndi0xeSlJdTfN6X0INUZmM9e3K9xih7nrfnt2l5exjDbWdA3zUR15d/F7tiz5vZt+hcumevoKNTJqwd7aaqbz34NQMMR2BLn3kAn5uWZ9nrC4UC609dqOXYQNM5EqSaRbiRzA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 2/3] xen/pci: modify pci_add_device to handle device add by
 Xen
Thread-Topic: [PATCH v2 2/3] xen/pci: modify pci_add_device to handle device
 add by Xen
Thread-Index: AQHcEc3mB6OQkCaDf06b+uo3Fz43YA==
Date: Wed, 20 Aug 2025 12:28:14 +0000
Message-ID:
 <e0da037322b978d427d23a1af50406598a08b378.1755683961.git.mykyta_poturai@epam.com>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1755683961.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB10116:EE_|VI2PR03MB10594:EE_
x-ms-office365-filtering-correlation-id: 234bb8bd-92f7-4b7b-b951-08dddfe508f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Q56dZJ4d1S615WRQeo3rGXLytfUDLQgUVHPOW0lTtdrGwlVp3AMZusRJ9L?=
 =?iso-8859-1?Q?TB3GYfKFIPSW3OX21hQ7hNYPQ70Rixyei/SoO8dkAPX8IHzjIx9tqCLcxq?=
 =?iso-8859-1?Q?qg+tJVNPrUkhCcfdobMuDXs+eqmz3/SyIJtPW8+3BGukHWlbqpwCN2ZQ68?=
 =?iso-8859-1?Q?M7f2xfbod1PGXUZq/2IZWlLfI/2FzwPc7Bxx/CMSq8mhTEux7IZJbCTsWK?=
 =?iso-8859-1?Q?yycuePDtj6vszRXzFTla13ZPF7uZm50a9w55N7KiCGTRgPvucL3ku/5TEo?=
 =?iso-8859-1?Q?GQ3Ithx5f+mvZjf/pRLOpatCmWsgTydxEyOWu7mSo4B7W1riYPIIn6+uFF?=
 =?iso-8859-1?Q?Z2Xb+B7cFch1OM77USoMWT1vylVQvfRG2IrnSMgiDtLjmogSo8WjwerJAO?=
 =?iso-8859-1?Q?3JRrcgSGKoliGBt4xunlZLkKEULYukVD6U9jnMSDnAhRzNRsrpyTyLWyoO?=
 =?iso-8859-1?Q?5QE/FHU37FiosgCdrxrm/jlSG0TQDK4MzhVOrIyejKwCLOuJID7DgB1Q/v?=
 =?iso-8859-1?Q?ZeNQNvCe1JUQNbFeavhMvnN4r5T2uEjJY6Ame0uzCcB/WH9jtU5pkOKXO2?=
 =?iso-8859-1?Q?GFXtk8VnwLc8yrwna86csJes1uLi1Z4OB3oEwxUAZn/dhR3pgYgJnaa2ow?=
 =?iso-8859-1?Q?l/PWUfuexEUPliXMZD3WU956XCzROnwUy6iSGXqqQkGPjQzBYwG6Ppx8oQ?=
 =?iso-8859-1?Q?Vnc+IHopP85XDEZDFkrXGu2mg5+9srKOCL99gJSkX1MKiwZOG8Y4XR872J?=
 =?iso-8859-1?Q?DmrQhqKv2DWmzEEAlMpVQlBOmdWvbT29E1ggh86S3zyan7rKXbH5MAm8p6?=
 =?iso-8859-1?Q?X3TSQtssRUHvEVGPZfx6xV4WZTl1OOhYdFZqSUBW7BtYPQWnK2riJ77flj?=
 =?iso-8859-1?Q?2xIIgB5udZ0XiDtHjnJK1QvEHGb006PRn1JyOY8Nm6GXC6BlknNkOl3Es6?=
 =?iso-8859-1?Q?lxBNdzrLU56VCk6H8aauClFO494Pd+jrITTR60792Bj08DNAdk5H9zKU0W?=
 =?iso-8859-1?Q?tvJPlcpyb/6/5W8HxGe9/NXtB6ucbf/4LNET+f6e8qkmvcnLGmdq8iH5Uz?=
 =?iso-8859-1?Q?Ut4pLBELiHwFPNGPrDMzUa06BWnV+dUSUrsiASfa39EVLWfqth0UEpI1X9?=
 =?iso-8859-1?Q?o9IW2hmgGsmqPXEIz5VjYrBKJofQl9FoRbTXqsINb/4UCGVZ3mr8hvJFxB?=
 =?iso-8859-1?Q?lkPF9AnB1d/gCx+HaY1vFR4Z/5g4gxSgUhEJMd1pUge/Lddj9kL2wn0HEX?=
 =?iso-8859-1?Q?JW/gMIn9S66m02+EoQWxsIMdV/kMUZJHwsSn/e6zuzVGAmXvUSUs6yola0?=
 =?iso-8859-1?Q?lTdhdC1sAPAbswvC78d0o4i/JaDryeEUstCEluyY0xILeBbdRWXETsImcB?=
 =?iso-8859-1?Q?dX9ZWpoVYY8q+CfXkKnKkajE3kiv/2mR5yC995TXLU32W3TvW8ez9x3q3Y?=
 =?iso-8859-1?Q?MOgy27Y17ptpdawvL84LpNyOdtJLbjuLpBi4tQVspiX16wDqjWWPHIXytj?=
 =?iso-8859-1?Q?qJ6cT4G4XUDOd6W+wdagX9C9K0uMC3gx96dpXUsbu/vcdo7K8gUJKSs0g3?=
 =?iso-8859-1?Q?IajE2LY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB10116.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FBUQVOhRHpFUHQ3+yzXDlXAeoWaWEUY90ot84nyUYG5lYdb8dd8u4vTATG?=
 =?iso-8859-1?Q?fQZzIQ0tZ16E2ehHBVP3Cgle0HPmk9R33sRbsLudmqEv/UjHylkXwTeUPt?=
 =?iso-8859-1?Q?Y1cKIpDmRiD2AJH7K63p1Gjz377DS5WQvUfOD77t82q7H3bvB2mgT/FBnJ?=
 =?iso-8859-1?Q?Xz0ay36+5FWvtGTZ5uihuGmLzSGv0vJvSly41lxWLlaftvxkoR6rJQcokA?=
 =?iso-8859-1?Q?A4+/zfcPFZ98I/0p3A01biKb+sfllLcjxwoqE1D/7YVdxp0SJE8+wUEGLF?=
 =?iso-8859-1?Q?uKmq8s1RRa0IEaLJ7piU0L3gqbzInGHB9NGOsmiVsMm1IDzLnMCI/2TnBz?=
 =?iso-8859-1?Q?WqlEwtKt5nxLfFicWTL4N7ASILmKVcVFn1TsMb+Twx7sXtLR4vHNQL27FZ?=
 =?iso-8859-1?Q?+vZXgPcflQcO3xEqPpIgMaHFzFLBaOdU1cho0oWctJTS4oIQ0BlfJz4RBZ?=
 =?iso-8859-1?Q?vhZG+JKeUC22Pp8avcvGTPKGru3+HWO8rzx5d358+Ng3QgMC9g84rQPSrM?=
 =?iso-8859-1?Q?aljg7uwKwy1vTIjS5hR8E1qhkmpYf5DAUAxE1u23psdsEvLplBHeLJXzp/?=
 =?iso-8859-1?Q?g5j0Ij5fsKuRnrZQ+n6yjE7Tj0uS9YADiqPjGsXy5UWkFsIF+c8nZRLF7T?=
 =?iso-8859-1?Q?fYjL8vLJvvLhC7Wg8/+jjJxeFdUfMU6fRUJj2xUmjWAKA1RAXrxnAPIB1o?=
 =?iso-8859-1?Q?WGczFXC1J/cWlakkqVaR8fl04GH11JEHOEbyJhcjju/z3viUwER+Rt6EcB?=
 =?iso-8859-1?Q?/cfCIkZ04HletDgvrls4sxSbIv/1gv0uLLGz9mUBpfSZ+kHTRoFHweaUVp?=
 =?iso-8859-1?Q?TbzN9Gu3dJj1ElT8U/mDM1SvOMGnKMF1R+FdD2Sz1ha+hqb4E6S6FD82s0?=
 =?iso-8859-1?Q?euZr8Ht5WBOaO/+8UTV5hPOU8gNDkDcYQp7hoDPDFBNx9PtbmNQlH9HUKD?=
 =?iso-8859-1?Q?cCKEbJOUrjP5b12vqwmhTeT4YIoKSXJbPGsZ3jvJ4FN/mVCT+W1gFfyv79?=
 =?iso-8859-1?Q?Jl8X9oheK0Y0FNHO/1aFRfxY3AsOXP//Oqu6k/h+ukP1UHK02wwHhaL9zi?=
 =?iso-8859-1?Q?Y3oYY4NU/SmxFpoOxC9GCTH3kIsrmCslDSNHmdVHaFQel1yE1qyzxmAoZD?=
 =?iso-8859-1?Q?zStpN7U2qSfTm78Jk+N/BXOSdMOzvWWCOneBbyfsEd7v0Rni71hPHOZC1U?=
 =?iso-8859-1?Q?s6OrbNCp3Zw06mUSI3q79PHwuUuoL/r/aIbT4QIMfROUHyWtzw3Km8e2wK?=
 =?iso-8859-1?Q?3aaREIILVU5ZDyM2EdO5DJDp4z9HCwQqnHlWGWEMZIT+C4MPzNG5CruQU4?=
 =?iso-8859-1?Q?sjxGqosWrLUv6jat84YPPoRtV+9MCJIPgXMnjh7zuvqbfhH8zks3UijP3F?=
 =?iso-8859-1?Q?NR5Ey0NH0BLikkOh5vZ20xxkVieIjGJJ8fkkqnJ/LwRaS48GeeNnZ0RNwT?=
 =?iso-8859-1?Q?YcPPZgYHcvp2Plqu6J1UbXoPKidq1xcR5hFPsesP79LUA/hF+6foat111X?=
 =?iso-8859-1?Q?prOSSu2KW1ZRd78A/Vy7DK6UvLwYt3vX8mhrRIkuu6UpxC5qEluRNxTCtf?=
 =?iso-8859-1?Q?dhoC6TpKEKU67abTy8Gt2laUXhUzst9v5zzmQwvloQ5LSyaP9R/M+FOU6d?=
 =?iso-8859-1?Q?WqZR68JweKW/3nZe7SdsPDC9ygwHk6ICvuSV/eWOa1n0ey0OhcKLE5Yg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB10116.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234bb8bd-92f7-4b7b-b951-08dddfe508f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 12:28:14.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18eA6QfjVUG4CASLDCnp+wd549TRhsofCxevb0MBQtM7q+Gn08mk+ONMtUqQnIcaeZ2yDmL5ApwBOAe9dmseVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10594

From: Luca Fancellu <luca.fancellu@arm.com>

Currently pci_add_device is called from hypercalls requested by Dom0
to add pci devices and when the device has no domain associated with
it, it is assumed that hardware_domain is the owner.

On the dom0less scenario, the enumeration is performed by the
firmware and Xen at boot time might want to assign some pci devices
to guests, so it has to firstly add the device and then assign it to
the final guest.

Modify pci_add_device to have the owner domain passed as a parameter
to the function, so that when it is called from the hypercall the
owner would be the caller domain, otherwise when Xen is calling it,
it would be another domain since hw domain could not be there
(dom0less guests without Dom0 use case).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit f0c85d9043f7c9402e85b73361c8a13c683428ca from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

v1->v2:
* remove dom_io check
* fixup pci_add_device parameters
* use current->domain instead of hardware_domain

changes since cherry-pick:
* s/hardware_domain/d/ in some write_unlock calls in xen/drivers/passthroug=
h/pci.c
---
 xen/arch/x86/physdev.c        |  9 ++++-----
 xen/drivers/passthrough/pci.c | 29 +++++++++++++++++++----------
 xen/drivers/pci/physdev.c     |  3 ++-
 xen/include/xen/pci.h         |  5 +++--
 4 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 4dfa1c0191..04d179e81b 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -446,8 +446,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&manage_pci, arg, 1) !=3D 0 )
             break;
=20
-        ret =3D pci_add_device(0, manage_pci.bus, manage_pci.devfn,
-                             NULL, NUMA_NO_NODE);
+        ret =3D pci_add_device(0, manage_pci.bus, manage_pci.devfn, NULL,
+                             NUMA_NO_NODE, current->domain);
         break;
     }
=20
@@ -477,9 +477,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         pdev_info.is_virtfn =3D manage_pci_ext.is_virtfn;
         pdev_info.physfn.bus =3D manage_pci_ext.physfn.bus;
         pdev_info.physfn.devfn =3D manage_pci_ext.physfn.devfn;
-        ret =3D pci_add_device(0, manage_pci_ext.bus,
-                             manage_pci_ext.devfn,
-                             &pdev_info, NUMA_NO_NODE);
+        ret =3D pci_add_device(0, manage_pci_ext.bus, manage_pci_ext.devfn=
,
+                             &pdev_info, NUMA_NO_NODE, current->domain);
         break;
     }
=20
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..09b424d1b3 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -654,8 +654,9 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned=
 int pos,
     return is64bits ? 2 : 1;
 }
=20
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
-                   const struct pci_dev_info *info, nodeid_t node)
+int pci_add_device(uint16_t seg, uint8_t bus, uint8_t devfn,
+                   const struct pci_dev_info *info, nodeid_t node,
+                   struct domain *d)
 {
     struct pci_seg *pseg;
     struct pci_dev *pdev;
@@ -663,6 +664,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     const char *type;
     int ret;
=20
+    if ( !d )
+        return -EINVAL;
+
     if ( !info )
         type =3D "device";
     else if ( info->is_virtfn )
@@ -767,9 +771,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     ret =3D 0;
     if ( !pdev->domain )
     {
-        pdev->domain =3D hardware_domain;
-        write_lock(&hardware_domain->pci_lock);
-        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
+        pdev->domain =3D d;
+        write_lock(&d->pci_lock);
+        list_add(&pdev->domain_list, &pdev->domain->pdev_list);
=20
         /*
          * For devices not discovered by Xen during boot, add vPCI handler=
s
@@ -779,25 +783,30 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             list_del(&pdev->domain_list);
-            write_unlock(&hardware_domain->pci_lock);
+            write_unlock(&d->pci_lock);
             pdev->domain =3D NULL;
             printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
             goto out;
         }
-        write_unlock(&hardware_domain->pci_lock);
+        write_unlock(&d->pci_lock);
         ret =3D iommu_add_device(pdev);
         if ( ret )
         {
-            write_lock(&hardware_domain->pci_lock);
+            write_lock(&d->pci_lock);
             vpci_deassign_device(pdev);
             list_del(&pdev->domain_list);
-            write_unlock(&hardware_domain->pci_lock);
+            write_unlock(&d->pci_lock);
             pdev->domain =3D NULL;
             goto out;
         }
     }
-    else
+    else if ( pdev->domain =3D=3D d )
         iommu_enable_device(pdev);
+    else
+    {
+        ret =3D -EINVAL;
+        goto out;
+    }
=20
     pci_enable_acs(pdev);
=20
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index d46501b884..cd3a36903b 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -50,7 +50,8 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         }
 #endif
=20
-        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, no=
de);
+        ret =3D pci_add_device(add.seg, add.bus, add.devfn,
+                             &pdev_info, node, current->domain);
         break;
     }
=20
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 130c2a8c1a..89f3281b7c 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -226,8 +226,9 @@ void setup_hwdom_pci_devices(struct domain *d,
 int pci_release_devices(struct domain *d);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
-                   const struct pci_dev_info *info, nodeid_t node);
+int pci_add_device(uint16_t seg, uint8_t bus, uint8_t devfn,
+                   const struct pci_dev_info *info, nodeid_t node,
+                   struct domain *d);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn=
);
--=20
2.34.1

