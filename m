Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BDB56933
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 15:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123848.1466553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxmaS-00088s-2N; Sun, 14 Sep 2025 13:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123848.1466553; Sun, 14 Sep 2025 13:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxmaR-00086M-RI; Sun, 14 Sep 2025 13:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1123848;
 Sun, 14 Sep 2025 13:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7UnR=3Z=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uxmaQ-00086G-Mn
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 13:16:10 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0fc1b2-916c-11f0-9d13-b5c5bf9af7f9;
 Sun, 14 Sep 2025 15:16:08 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM0PR03MB6243.eurprd03.prod.outlook.com (2603:10a6:20b:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sun, 14 Sep
 2025 13:16:05 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9115.018; Sun, 14 Sep 2025
 13:16:05 +0000
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
X-Inumbo-ID: fa0fc1b2-916c-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUCoz7cJkjo/8x6YP47E82iDC+/7fySvX5rmXnlyHgW36tPicn5jBEKtqFifuy13YPvx/rsXkbYsb5pZkG7HacyxmO5wwtkuDqh0Ba38kke/8foQZoLOjQ03Y73fzPViSPLdPkUU4jNk9vbWzZPSniGMj51wuLVNnqWsuZ1V8xugnCUjTD19WKVjNkKmBWTBu+ouHAV63aePm9OrZS5/NuqDNRUwm3aijaJePe5z7TRur2oW74DP3fer5cZMN6sHsuhrLkMMUUIRVn1rJEJFIIwIbJ84oK/mHKvWnEx7k7sxyUgQSq25/FUZ+E8Xss+6ARnoHVgXjSVfYOY+G7yBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CJzf1o3FIkwIZND5pCfpJAVKyuUylbQ8n2PwOOqp5A=;
 b=PR3wuc3AsEEwmDkInsBqe2DulFJAh18AY6/mtZqRCVL1PV0AYrp2GLzyDzIXiLmKFnou9NE+ta9F6yQx1x6CAEUTBIjIfdw//Pkvb2+DeE7TI0aJX1HE6pCYuJLFtbcITlqdOSyclsHWRPk1ok4v9gsoiqSw8xHthElvHt5+dL2y2Wad24mZcd5VSn5BpJBcEnCehtBW8X+TuQC7PfbHLhsSUGp0wqeGu3UpbK/J+65Hvfxkfnfla1tYnc/mS0F94f9lAEzf92F/GfAoffgxc1otUCk582JPnwSgxg9Gx/jZfUoojDNbjsTpJgcOhRf+4YS7JrPWg1WAOkkWrhrA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CJzf1o3FIkwIZND5pCfpJAVKyuUylbQ8n2PwOOqp5A=;
 b=iKk/B60imaRGmnTjTNGYia83235eVq5+9CWJlpFl4HP5j1cRzbvqiSXsMnrRMRnScfv4mDyTeaJKvVZGInjsdW+7fRe/azWUbL3d0FGNcRZN45TFi0LFIx1hPkxWDpypF3KaGDoBQNH/OWEeuOn7nSzaVLVFvfj+mqOBgS0xn+wjVwCaK3r+qcRz6GOwc4Pb3EEeoviiiBjPmG+9FsrHJz2tvV7T0tbihn2KNKbcUj7OB1rTFk9lko77THic8Vep5+UaXgFfG32QCsIygAGEooBOS8sSCm0lnqeP+5LM9lcrHtvLetb+GhjmEnWxIp+/23oOTr9sZV1Rfoqbpzco6w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
Thread-Topic: [PATCH v2] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
Thread-Index: AQHcJXm5/L1/35fsPkySCbuTTizhog==
Date: Sun, 14 Sep 2025 13:16:05 +0000
Message-ID:
 <d93294cbdaa0ca393ee369245a5dfd7e85b8a821.1757855718.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM0PR03MB6243:EE_
x-ms-office365-filtering-correlation-id: b7bf8982-bf92-49fd-ecc7-08ddf390dc39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ztuj4NfOV6SBLDQ56Ts9IKMw/lLnehs779qnA7FN55UyTrWA3bbXE1DGui?=
 =?iso-8859-1?Q?aK5JcFx0nX9qhPNfn4UiCltf06iJzt8c5F8yvuxNPIfaJ5zHxFi1XvtefH?=
 =?iso-8859-1?Q?4QGqxG7eM7XHkOVN5SBNuXLeWWfTaj7HW6MogOinoKsgG0/ViyzjeReikR?=
 =?iso-8859-1?Q?RXtOGvKJFBygeP9vxkLfRChdc9Fxj3M7O5P7/9uuNyDXaWZpk7ZhUG1+6+?=
 =?iso-8859-1?Q?iVKRQ7nHqrg+W4Z/9mp6m+7tmdNWbm7MCEcg5vf/BMWfGM0bccWi/1dB/g?=
 =?iso-8859-1?Q?tI96wXA0VN+PAavdmwxHp5qNHF1MD7SqV5F3DxKgSMXFVcSDjMi/L8gre1?=
 =?iso-8859-1?Q?TUvRn0XO0+OZANMtr383VQ7YPqkrT07L55V33s6GQ014sPBIFae7o7rZdv?=
 =?iso-8859-1?Q?belVOoWvamgV8VNAynVaZz+M/0r8fNXVUM7S52sqxEOtfTSUZ4F+FkYO+W?=
 =?iso-8859-1?Q?17kcXTSdtZVcDf074ZV4woVJNruYW0yecGjnECAtsyb+JWapQ8ANbh3SKX?=
 =?iso-8859-1?Q?nV6YArQmyklnIYqrN98EZYBKgA9ATc4mp/L1P+7KxUJs0wowzXuNCtwU/B?=
 =?iso-8859-1?Q?crf/uJhmk+ySQrIu8DWATS05iOv54GKtDS0aS45+PpcjnKuB2558zyv6P1?=
 =?iso-8859-1?Q?lzBzTV7a0d4EBwa2kNFWozAqgoQ05nYVMftB5lZCxyUtaIS+CAMyT5kuej?=
 =?iso-8859-1?Q?okLYPa1d33CEPEbMlakfzL1laHLp6uCiWwDpk3wg3ac4fw1yaWnrO4RBgl?=
 =?iso-8859-1?Q?MB1r95bsmHXDczYiKrY346gqVwxJ5rXvx30G6NrsKeSaGe88AtjQTcd/8/?=
 =?iso-8859-1?Q?4ahOZoyE6zZLtPXP45gyKmvQ3/b/LrelNt8tOyEikpHfnFQij8ZOg66zDM?=
 =?iso-8859-1?Q?6LP6nceyzMdeZhEMpZ+TFryqGvn/gVT5c1hJTj3TgiPfB/7ORJFLgOrnnH?=
 =?iso-8859-1?Q?HRn29KCxS1wS9C0lRX69ZUzULk7/qN3wMlh5NAG63s5DI3LO+wgM3e0BEb?=
 =?iso-8859-1?Q?ZpAIdD8bLT4cmXq+JwbByBxwi6lvPCqKpVySZrFjxrlifS8o4jQJDtD/k/?=
 =?iso-8859-1?Q?R+9qi/ryGHMCGsjwIfPMyFRrGfJRefV0ttFc93mh89GtZwPrBLmta7r7VL?=
 =?iso-8859-1?Q?2bOm3YSxliLJ0pSKSZB0bzbN9n03KMIp/8/A2ldGy8M4/HJ3sxzQb0dLrM?=
 =?iso-8859-1?Q?SQYMT9bt9+bJIDylCePz7YIyeGXl/k+TiiIhD+fFRpmddOkIxr9Cw53mI1?=
 =?iso-8859-1?Q?hADUtZJCyIjxfs82lPbg5tJ8jgaEIqasG5JSq9GjqjieYdgkOj7lGdj6eb?=
 =?iso-8859-1?Q?0v3rdpEyr19D7kSibqUsRAP5wMVG3LO5Z5xjHasaBmLMaHP5DPrze4YH0U?=
 =?iso-8859-1?Q?AAc/C5nNAz9QRXLIrOIJtlkI4aptKjFZ3TVvZ/zosoYvuxlXOihC1Yqp9r?=
 =?iso-8859-1?Q?G/8pvk6tW5GAl44QWoF3M0FQeyzDYGi5MlXyc2IgvWBJpjdFcUz8YK5x6P?=
 =?iso-8859-1?Q?5MOow0czn3Wmsab/ovCC8DFXSr/HfmL7eDfjGcZcdTecSU6E4o6cMuGk/I?=
 =?iso-8859-1?Q?rC8bkAE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yAvw8mShWs5J+/wrzniJ36BYF0P8zGRQ+4N6sjaJCFwG/wKpzmB8rJBtkk?=
 =?iso-8859-1?Q?T64zvrfZ7ZEdfbjxlTOQL+h04VNZupTAovzxfOfaLvN4r2MgTWEC/xxpRQ?=
 =?iso-8859-1?Q?i27ilFeu0doBq1qXP//tfXK54DgzNjxDjAXzAWoR92EqZj2QlMF9hlPa3p?=
 =?iso-8859-1?Q?NpPsY4PJ6YnIVQMZKiBQFwKN7do9Wld/o0h/VkL0W6nBeferVisdApudMd?=
 =?iso-8859-1?Q?vCccG4XjbvjaOsoZ1z1Mc7WkGP5fbOlRuEocSTskKhrj/CFEU+eIt745Y0?=
 =?iso-8859-1?Q?MdSxEU05lMijxef78uxE45no4CCPnkuoQjfW08yhkX0Nu58cJAC4p1UadH?=
 =?iso-8859-1?Q?8FB8qegEA728xemIe9H5jrOy+wvE+2mlFGtvD/uLfeMwIG7dhOvatiKrM2?=
 =?iso-8859-1?Q?W08en1PI6JOuO6tc7aydYJb/tpjrRFiQPrw8r6W4XdypkPPzz+cmbV2yl+?=
 =?iso-8859-1?Q?S4TLC1QRipyEtmT5eGhomQyvfXOepwzbd6KjqECRYEY9WRKgFEmesydnfh?=
 =?iso-8859-1?Q?vuCugswVl9hYhslIxsxUoNEbCIK3EMNxq+DD4ZwCJkJ/zCtgKsGl3sOK20?=
 =?iso-8859-1?Q?ZbTIC2MdjsHfY3XWXtYZfPqYtmuwCmIJiMZlSu6qlN4ASdHUVR0dAqvFqO?=
 =?iso-8859-1?Q?K2/KHwjwXnDuOwEV1vADkmsk9uX8aIbrBaYnfl4ggn8z0sv8+57+knDBvN?=
 =?iso-8859-1?Q?+U0Rpo8pbsC5H6FISbkjOWzRwYHkvz9+TndOT0snop259SJlBfZn9dALwb?=
 =?iso-8859-1?Q?a1Ty3s9apA9if/itK+SBeGcg0ZZA2i1d9t7B1OQ+dYSR/T6X9BYrMxddWG?=
 =?iso-8859-1?Q?k4xBVnUkt1QMvaPj2xnbrK3DJOEP2YFPzQ+q9EhWTGsRZy5SPYB0+w3nCN?=
 =?iso-8859-1?Q?a7mX7CXMH0LGbKZwdv0J6G4k0VdnRt9yh7Dhxh6knm3YsCImvXovagr0q9?=
 =?iso-8859-1?Q?HZkUufTOtzzJj+Oh28VGZEt9O2PYzPO57cVxC+vSkJ1U3FKaYJOzDNmQQO?=
 =?iso-8859-1?Q?K5SwICgqXOTHlFDUP3UTleG8m+2v6/+VMfgPHcjc+eILnIk9gWd2ihSZcf?=
 =?iso-8859-1?Q?3ZrhBaT7bBZT3g8E4wKsWwQ6rE6739rcONy6X+XkzFB/FxVAdj3nNwR+hp?=
 =?iso-8859-1?Q?ltBznz9qOhRaJypx3tFZFddyecV8uqdyWBLwOVzJuAbAZFPWNNROoS2Ao4?=
 =?iso-8859-1?Q?9YbM2/pjtQ7Kfo4SpAzhj/5IEOx7TubyafLdJfwFFfroTOd6wxnAvngkDs?=
 =?iso-8859-1?Q?/UGLoWpZjMRPY/YbIRco1RcNpKHFhsahlTnqvyTBcQx+VaavaM/ah8jL4B?=
 =?iso-8859-1?Q?iMwNTL+ovp1mFhkgs9nh00S7rNyE/oIVTJTMSWrsbrs++weEluYBUnEg3K?=
 =?iso-8859-1?Q?lfQ5CoHXITUYQTMVyIxUC1uwhmtZj/fM7Yw6gVh7xsSXM6pzsXJeb18IRo?=
 =?iso-8859-1?Q?JMgTlrk7m99EOUFb+LBGlhzNYzoilkEYnhsMunjAld/GxMaRPSpC5ZNlvY?=
 =?iso-8859-1?Q?03KSYKWH1MZfR3sqIPXFuh1gTAd6Jd1oOzuW5eiNAR4ZMcC9WxBWRBH2Kh?=
 =?iso-8859-1?Q?Qn0+wdEVN9SB/YWCp0GE/PuGFqVFSflzBuKVkGIVQOGrAm+NJTvrgk+mM/?=
 =?iso-8859-1?Q?YWsdPotg7MmmSMw83DYNU3p7e8yB/toABMI0ktx98LciRLNdfAN3Cpig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bf8982-bf92-49fd-ecc7-08ddf390dc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2025 13:16:05.1678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lz97l1hIJJW1V9U2UokDmODMJDTWRyhNtJg+czjbQcGVvV7LzcyLdJjaloqDyeRlmOO6ehC5zYFPI+GIoqybrrsVpGg9wQjPP1t0CNgqKOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6243

Remove redundant domid_free() call in the XEN_DOMCTL_createdomain error
handling path to prevent a double-free condition.

When domain_create() fails, it internally calls _domain_destroy() during
its cleanup routine, which already invokes domid_free() to release the
allocated domain ID. The additional domid_free() call in the domctl error
path creates a double-free scenario, triggering an assertion failure in
domid.c:

    Assertion 'rc' failed at common/domid.c:84

The domain creation flow is:
1. domid_alloc() allocates a domain ID
2. domain_create() is called with the allocated ID
3. If domain_create() fails:
   a) domain_create() calls _domain_destroy() internally
   b) _domain_destroy() calls domid_free() to release the ID
   c) domctl incorrectly calls domid_free() again

This double-free violates the domain ID management invariants and causes
system instability. The fix ensures domid_free() is called exactly once
per allocated domain ID, maintaining proper resource cleanup
semantics.

Fixes: 2d5065060710 ("xen/domain: unify domain ID allocation")

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- add "Fixes:" section to the commit description

 xen/common/domctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 71e712c1f3..954d790226 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -421,7 +421,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_d=
omctl)
         d =3D domain_create(domid, &op->u.createdomain, false);
         if ( IS_ERR(d) )
         {
-            domid_free(domid);
             ret =3D PTR_ERR(d);
             d =3D NULL;
             break;
--=20
2.34.1

