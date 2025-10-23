Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D80C02D28
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 20:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149537.1481159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBzbn-00021o-MR; Thu, 23 Oct 2025 18:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149537.1481159; Thu, 23 Oct 2025 18:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBzbn-000208-Jc; Thu, 23 Oct 2025 18:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1149537;
 Thu, 23 Oct 2025 18:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBmZ=5A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vBzbl-000202-Pg
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 18:00:17 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 214e86f2-b03a-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 20:00:16 +0200 (CEST)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 VI1PR03MB6159.eurprd03.prod.outlook.com (2603:10a6:800:141::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 18:00:12 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:00:12 +0000
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
X-Inumbo-ID: 214e86f2-b03a-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2MHE5U6yBxxz/w0Er2H3Ulz4mhRAhUcEh1V1wtPNVsp9foxwYWkxY11/h/diNoZm4Zl4GnaUxuOli6lKxhYbnOY7nwOMzyATrPG0BRoFD5VuWk7A55CWPkEg8k1EGV23iKg5XT2yi39SexNMe813fcJOVIJO9puVk7IkJs0N7ZZLen9YvVB2JJesD6mZwD/YrHM8YQdomKiT9lKy7yZq+/Hm1+JqtWpH86TZQDjnLrwjqu+zZrQPrHBkToA9Z1zpgfCFOC7B/zqUurAGal2FGAuw90zldD3zEzBQEq0lzQ2uZ2VQOCHMOWVEDKLHDbASmPDC/y/191BkL/jdDf2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxktiCwG7SjR7vO9m0WseD9BnXWQ15fGx/2XbUPLGjE=;
 b=UfmUqU/vsya5N7Zp97foemKn0iMgFHxYPngT3xfVI/Lc48Loi3HLZ1XxrEqrGmK1/GWYba2VvVIqWRqGDt44oMKWMS5de8zNeGtmvdfhsXJ9k3U/gpvAIvG0ZC/+vgAqI+mvMAz1tNXRTaHT1GUnbfRYqd4aoW7nX4fmDOkai4Iug5YuTRVpiiqBGf41ssjo9kC8E/oJJyRIoKwldAvdkPF+MWD+qwlpFPocPDXwHk0tPtGA9l7aIjh1b/eNz6wzdDyQmJ1bZcXn1cwj/40U7JFkNqIdg6pjRKfQ10YagGq6bANJZhsHBs58JDTFVqcfvk9dRPorXH7FY/KQLkFr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxktiCwG7SjR7vO9m0WseD9BnXWQ15fGx/2XbUPLGjE=;
 b=M6vurIc33X+AqWBK6JzpbxTmI4r7GiXalIoHJK64oxAf4oAzYvrnljRpl7IUwn6tR9cqesVa7eyzZ1szCj41aboP/1gScccXzDcoeNLSvO8LlarWQ/hzoACtN4j58aoSTOh2mLA/Xdf/xxdU/GDWZKLlODCeXlkQ4GPOpqed2UTKVGiHphGQiXFd8r731B8EY4091XlL5lBAOB3JdQk4GuBy8R3mNbR9/040MjF4Ov4PszTop4BP0mr92NRyLWfjg3EPWy18k69jujOaEMTKfX2jTM9WHvkCuL2gYCDFe9OKyRacP5AOSWizQPgoB1pXxGwlwuKV/xEVy2ViTdZUEg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Topic: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Index: AQHcREbgd161cNZLPEqc4+KUMk5T6A==
Date: Thu, 23 Oct 2025 18:00:12 +0000
Message-ID:
 <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|VI1PR03MB6159:EE_
x-ms-office365-filtering-correlation-id: a3e35332-cbe4-4cae-0f1f-08de125e0376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?y43vzDBRxArVtoxR6xCgqUQACN3+IF/dyFaodoZbPK7xrCBpeF278RRGGH?=
 =?iso-8859-1?Q?tP4IfEYLaxbVDLUuQ1LgfkhwFPqU82RAkVZI93o25VEuAW2igdd47uGNst?=
 =?iso-8859-1?Q?J7wrmDFnjfaOotC5/LbWZQIuqbTrzZgWRAkRWu5+aUY5pnB2Y+vcIK65h5?=
 =?iso-8859-1?Q?GPoybVfvOV5dFw1zNl0rb4Ba4Zpq89aTuUmKs5Ol0fQ1WMGsWJYecjXrUy?=
 =?iso-8859-1?Q?WyblNSPZPurflrqdquBjKWW6O1OmhnIeuE1CfMC41sD1ZQ6zKvWGE3jCh9?=
 =?iso-8859-1?Q?QxRDovL5F7hTcRU+l9Ut8yfAr0HZKHuybSXxXwLXvT2R9t28RUNgkMoLgj?=
 =?iso-8859-1?Q?1oSfhl3LyJV9etg4ZMfNsSsljnzvr6oaOVl5yvOYGWQBgOWUw5i0E8evqW?=
 =?iso-8859-1?Q?aN/shZJlbFHGrxw59yBQcQSbbHABQSgvYwnp4yg2bafbCRlVD80+d48x8g?=
 =?iso-8859-1?Q?bbvfkJtOQ8SziY3UycA+oMyToL9QziYi0G77G3yHWCEfAbzkLYV29i5XsP?=
 =?iso-8859-1?Q?OUlFXqHwMsK2HeAIFE761NZ4MPLnyGv9V93angqzCgdQKvyvMPyJp+6p0x?=
 =?iso-8859-1?Q?i258Zg90VzU9bgsAlIUCt4ugVbSIznsxi+3jz5sp4xkbzme9gwdMvUCzLb?=
 =?iso-8859-1?Q?7G+S7THKn1Q15EYgXbtUUMI0J2z/hpPnME89iK8Wc3Ph71bRtavD8ew50X?=
 =?iso-8859-1?Q?Qxf28Xd2zelj5etJzuRKJArzDtAk2uD4WCBNPobCkQ2YhR3hfWAmWKSxRx?=
 =?iso-8859-1?Q?E2W4qkqsUj4aB7oPhajwabjMbZ0qb+69T1QUqZtfvtLuJV+c9i0hZEuc7U?=
 =?iso-8859-1?Q?NqVRYWYX4iNmSX3c/Xxu3zYR66CXrp1zqeBaJMrSlSdRtnWU8qhFLtJ7dF?=
 =?iso-8859-1?Q?pjCduIRj9Du/5V6DitIaDYK1sscktNy4zkliuUUHCM1FnwJMFnCTrdIo10?=
 =?iso-8859-1?Q?LtdeNH2bWEUEPvre6FDN/ADv8/olHJNjR+AJ03LmAm978G2WrqhUbu/H/V?=
 =?iso-8859-1?Q?GiFlw9dx7UV2KztWEYY6yV96kFO86ffkoasGthY3D7RxHeVP3DYO8uyFgv?=
 =?iso-8859-1?Q?ox94yBuZDDPSIae7AdSgDXCEwUW8Gr3TC7irJGgECtzGd/zZ5CbKgOmxo2?=
 =?iso-8859-1?Q?dEtrit0gcA2eTFUApeu0A02zqZ2pp1kuys/E3J2h0PV9ZrDuHJ/cXxmHqM?=
 =?iso-8859-1?Q?R3ou+t1SAGUxZPesWuQODQ2pycWpAptMQxX5wYBYoC9AtgDpV6eMyeK50O?=
 =?iso-8859-1?Q?LTQvuDetxdZITjeuL0L179DB+n6CUKhdkeucuAe4izk7y/5mpgkOU6lQSe?=
 =?iso-8859-1?Q?vW2esf/xrVA/lWvBhiu/kjgQ0meBtqxLZuWHVnQrd+65DQmr9Jbftj96mn?=
 =?iso-8859-1?Q?z6I6zwcGEBYJOmuIwjHTVjG6NkOKtfTC27I2teEgIl5PkRQoW1y2DC3VKS?=
 =?iso-8859-1?Q?lUthaluag/cXdC6F7WEALmgqDr95JY4/I2Ocy1TB7mM81mjSs7g19lqPlz?=
 =?iso-8859-1?Q?3TzThe23fSd5tpqkYpM2NluH04aDlpn2qnbMuPg55X8Z0gotGdAEHPbSLP?=
 =?iso-8859-1?Q?AnQe0u8Wir5yT++Hzq+NC0B/+pzD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JIHrXU7xYK+M15GaVoIkjtjBt2G7HThavv8OGhFwf5EEzEMPNMdaFCTF+B?=
 =?iso-8859-1?Q?M4+lU567vxT+pi8TikeOfEUmKSCpepkTzprtOl98E5JU6bDCkNgOI5uB8c?=
 =?iso-8859-1?Q?WI4X3LEc7fXGCY+Ue6Ur/hViKDw0fVXgCE8ZfuP8v+sPcGM2kjD+v1yHGP?=
 =?iso-8859-1?Q?FCDAsKYCnrb6cen82kXOUIVGmRdhF8mBCy2Z8MvJGxuUh80slWAxC5ItqW?=
 =?iso-8859-1?Q?Tzb6R3RXLtvWllNw5i0lBwk0CMO8d1SlN2T+f31tM6nNFm9eJlucSvRdpU?=
 =?iso-8859-1?Q?HOiBxuPY7NDdVimx0DdBSlzO5CxSijPVOC+GfcFvPmDUO/T4B7/2p0AEVB?=
 =?iso-8859-1?Q?gnk09C8OvkdwfGQbh+rpp0UqkrT1INkiBUAfV/KEmO24aMVz48PRlWb0U7?=
 =?iso-8859-1?Q?obyNo3Hp7XV990AqaqL5NpDjadhdugR8hXaVn2olpKaur1ObgexuRJj2t+?=
 =?iso-8859-1?Q?YuwQf3w+zvNSWXodtQMqf6dg4YzLxplqA4F7rZQaV6krYwFL8coL/qKsUp?=
 =?iso-8859-1?Q?lYkx0BR2eXq4K6Jlnlw3J/mz13CKi/WgteQ4zHWnzKy6zZTiUNkv9TwWz0?=
 =?iso-8859-1?Q?WA8gQGB5uqa+KfjwKfNc99yf6fOHkhy0tNKyzO9VQat5A333/espLW2Gu8?=
 =?iso-8859-1?Q?F1UahxR/3k7p4hUlbAfieiUUVbFH1N8UzirsS9+SLQzrylL+6pegGTl6NH?=
 =?iso-8859-1?Q?iDOnGkDhx9JSIn1lWhtSyaklqWDkw97ibM6e65C2cEeQYBiDV0WsNjM+KU?=
 =?iso-8859-1?Q?zkulzUH380T32sopoJJ40mDAqB3T6uaxPcqMOIgvgAxTn2WQ6ueM+hY/4+?=
 =?iso-8859-1?Q?TFSsiaHjwX10o1G5jkAZ7c/3vaBUFrbkCDQsEZ0ja6IGi1GLwUShKf0/Ms?=
 =?iso-8859-1?Q?1otXcq6UDz1+i5VnZdD/V/Br/Fii+forFfyAd3G3+vbF0YyAQ72039vyi/?=
 =?iso-8859-1?Q?clUZgWLwVtnmb9Rpz/lyGgfYMGql3/St4bz/U2KoZgWqNBN/2QUoLKk/8i?=
 =?iso-8859-1?Q?OJ6yYtS/rp+Y2PlVMYBSA4uhLHiGLupI16VzVzJS7B9wNZ34ubXhtCk216?=
 =?iso-8859-1?Q?8yMoDOd8KSG3NcbRkCvE4IiHc3zGCqtBaC8finNe8AMISj+RdZseGRV2HA?=
 =?iso-8859-1?Q?ir/dbUnDJvgkWqn4q6QUIbEppfwHD/t3nWwkTjmeAiwQHcoMP7PpksST08?=
 =?iso-8859-1?Q?Kpd5T62TnWP0XMvAvXMkjbeQGdqG3t4F5P7RPjP/Cf7xt9FofsFxZt6PfC?=
 =?iso-8859-1?Q?vfI7qDr1D3pKs9oj8HtWMxgD6CkRxYduwtg2fC04N9gks0Fdc+/gu4OXWf?=
 =?iso-8859-1?Q?4gwhj0mCApR1oDXTFR1TJVSprWKrQoBofZhiebwxJ+jgarVVY3DTEEeViW?=
 =?iso-8859-1?Q?dY+WpvpQ96YCtiCOTCD9SB92B0kDQwJDPLi3ZnkSGFYwEiH6FQlxtPJOlh?=
 =?iso-8859-1?Q?GRYV8wfYI9GnRNajWZe0IP/t7uM81iaP/gJ8NZfc8OYvbJcSQzC/Ffado1?=
 =?iso-8859-1?Q?huxVMpDuGOGVirumEkF4xfImvP8B0EavFxbrVmowzU4q3EfS/bZu5W/HoC?=
 =?iso-8859-1?Q?ALNfjOEKqQYs5UcCYZxH8CA4ow1l2eP2938OJJSQjwD84aKgwnGErKAi7x?=
 =?iso-8859-1?Q?guO6db6+PMfcLmoHrMw8QY9QDQ4wTizu3le1sGW9w9CpPdTqqa6VI+Tw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e35332-cbe4-4cae-0f1f-08de125e0376
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 18:00:12.7198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHh8kKmihJzZcdo+mYf4XA0BKQIu+teMm+EmPpQvw9psaHZgf7NcAcWcY8mOIG/aDYRUq75c6oN8ogqAiAVh06DFJBj2YaeV6gwBub02A4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6159

Given 'NextMemoryDescriptor()' macro is casting (UINT8 *) pointer to the
(EFI_MEMORY_DESCRIPTOR *) pointer, which is not allowed by the MISRA C
Rule 11.3 as they pointed to the different objects types.

This macro is a part of the EFI imported code ('xen/include/efi/') and
is deviated with a SAF comment.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 docs/misra/safe.json        | 8 ++++++++
 xen/arch/arm/efi/efi-boot.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3584cb90c6..c5e193e0f7 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -124,6 +124,14 @@
         },
         {
             "id": "SAF-15-safe",
+            "analyser": {
+                "eclair": "MC3A2.R11.3"
+            },
+            "name": "Rule 11.3: casting a pointer to object into a pointer=
 to a different object",
+            "text": "Violation due to the use of 'NextMemoryDescriptor()' =
macro is allowed, as that is EFI imported code."
+        },
+        {
+            "id": "SAF-16-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 7844b9529e..a87004001b 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -227,6 +227,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
             }
         }
 #endif
+        /* SAF-15-safe casting a pointer */
         desc_ptr =3D NextMemoryDescriptor(desc_ptr, desc_size);
     }
=20
--=20
2.43.0

