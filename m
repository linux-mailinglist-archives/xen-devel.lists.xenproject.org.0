Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17DA5BDC9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907711.1314932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnO-0004kk-4g; Tue, 11 Mar 2025 10:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907711.1314932; Tue, 11 Mar 2025 10:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnN-0004h1-SS; Tue, 11 Mar 2025 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 907711;
 Tue, 11 Mar 2025 10:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnM-0004Ad-1i
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a5a1c27-fe63-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:25:07 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:57 +0000
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
X-Inumbo-ID: 1a5a1c27-fe63-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeZCKa7NTPaalODffIpVPZxyubtbDkfmnybRmNGuy+ri0kcxKqOS5xNZQIEGy8/FqyeE3d2iV22W8we8y/G3b3NX1vK9xhEVpHy07lOF7cBkdoHBdySt1GCf98cpB/4F9e8/Ws2a+mlQx+L7INz7i/Wo92UPPJdOUuaWv3WJhpXh35Bb/f98GghY1R0xkxPp7Y+Rc7VUzlGle5qzWo3MLVhSOvck8xrA1Vc+S7b81fS6p4czEXrqUrNA4OA9gPBoccfbNMbzf4oSFtMs64a7ViFOrJQLsnPS6ZwcMgseyDE37yfPnX6BwcM0m6r3bFfIXoPFV6WNL3Bb+VW5e1LXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHsx4IPGUNnEssavxJhbxu4YzgwEQR4y4pjAfnqiIiU=;
 b=CAWtxwFyVWm+L8ZGXt/z7/lxl0mooQMfHIsKZW7UH8yTkXwzw1tS+kvpbLWTOfb61FQBxEDaR7sKgvD3paQNf2I2gxPtDPu1en6juokZKxsaSdYFPcU258Uabr4FRGpLAlhUVQ1d466yzAs2SOXO4NSH1Gmn0g3jwnvL8oBjgw1YRVShFUpUgC6IFn41iIjjW6ILMnw5EG+IzmK3f0ThpcywgQC67ePUVGoRjXwAzctydK8+z/MiYy+xJNyDImkKr/O8hUKJROX4hEmX3RQmCss9sZQi+0FaTI9AWMiIhehvfdz4VadLde9BMw8IZyjESwjjg0Z5sPQPxf64nnLDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHsx4IPGUNnEssavxJhbxu4YzgwEQR4y4pjAfnqiIiU=;
 b=GKrRwYRvHyM9HAeJHswhToy89qvcugDEgk+gKu8E0yKnIQ1aV/ITTjtrRaJgYpOlbTzyfp4ZFxVhVi3Ab1TMBXlTpImcwA5Kr9iYSUNz/E+gt1iJ/Zo1Bp1Oe3tCN7rwxVPgKiVnk1qCMHk5oxkalUsl8OXsbkAELCbh/W1Mw82clfAIXmyu6D1IkT7Z5TECynCqKpLoYGrgoFx4Nctdc5oGNS5+adEjC6Vth7N9XJtaZpQh0mdwDRpUmAgI1HS9yEh3uFHkFum42LPZgrCW7VqYxCzElGCDNDk+E8/iD4aChQF9yfRrkrrmTDnKcuzl6o+5jRASJwmIURsmi6YgTg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Topic: [PATCH v2 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Index: AQHbkm/V+s7gEh8jVE2kSVeMpYb04g==
Date: Tue, 11 Mar 2025 10:24:56 +0000
Message-ID:
 <9cd78a64dde2e0a039919a08025abaa89d63966c.1741596512.git.mykyta_poturai@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741596512.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10646:EE_
x-ms-office365-filtering-correlation-id: 446d29ff-4a12-44ae-44a4-08dd6086f902
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ULJyjMejd8A8v8/hbedXMoqoa7VZHsjkbOVOXYDu+V0CQ7qb/pkfqIJLwv?=
 =?iso-8859-1?Q?h3Prljx+pPfZ+Z+uFanBcn5M22j/fDBrTKztuM38aNC/woPSEHzYcK+QTo?=
 =?iso-8859-1?Q?gH/lQStxxg8ubEUYev9zme5tMMCL0fSGBIQ+bMINayoOlot1CCnS2bGw8I?=
 =?iso-8859-1?Q?vVUfUKxG5SDKc01TPEZRDxXoZS2TKMJXyyjy1EDRNGC3gLzH9iuICdfnr6?=
 =?iso-8859-1?Q?gDpeE1KqK8LfU+BK7k7X1pslQCmsaVTrTf6jhj05UOfRZMd0UDQDEph2QE?=
 =?iso-8859-1?Q?Q7oQ+mrV5UKxNUpMRMHTwV+yT3ceqQzldNEF6O27odGjkNAmiLvoI2uhPS?=
 =?iso-8859-1?Q?izMDjYwk6aEPGwFz/37r8Wav2x/SDx0U6onmYRcapGWDbLtz3G51s8TZ3V?=
 =?iso-8859-1?Q?y6CXh8EbFmyedr3dx1vfJAUQrYE2MkBql+JmEVA6IOJ0G9xqHB8VaJKzW4?=
 =?iso-8859-1?Q?b0YRD3NuUGSxivcshCTG6Qr+a35okh1QKaJzpk1VIDZELQwQ9V9Lk/pXNR?=
 =?iso-8859-1?Q?Jg+FD3/avnSpQM+CIdcRLrfNd3LA3ohTTpj2sZgkZjddyUlafbhZuINC9P?=
 =?iso-8859-1?Q?IpQYuVmdSfksXvnG+DkWjSuc1C0ia6n30fFuRY5bGi4XukYbjnSD5v8JQt?=
 =?iso-8859-1?Q?yFYlk8+8EVrXxfDH0a8+DPuqXQNBZsYHg0/vCs8wHzHAHYwMmh6l5ZyI7u?=
 =?iso-8859-1?Q?DPfsOvBoHbGBrIfOCA9XndfjGQG2WJh7NhN/uJJ1DvLDWXWfRqR7gmS3q0?=
 =?iso-8859-1?Q?wZuc+7C4qxiVWFtRtSoSZRrR71I9jdENLibjBjD9d5lWbmdrRCfrdXNP4U?=
 =?iso-8859-1?Q?eHXmDsySpwyx9TZ/u2/kiWGz6v7DzhnSYjJWyOHhynRRUVDKCiKCcda999?=
 =?iso-8859-1?Q?3DM5sLnaJAtWb0MNEdkHiowmbcHx+frU2QeOAQL8bbpmkxYLMGbabqyxJw?=
 =?iso-8859-1?Q?kykcz5jz7LE6UBzXzq8+Re8N1mv+6WAZEguWtrGJScnyFm3OlAHuBLk/2r?=
 =?iso-8859-1?Q?5Y7fDrIasJwat0vGU/LhSr85Z4G4rDaEyb4voGkWYw9m7nqbumJg+5fSL9?=
 =?iso-8859-1?Q?mQrURT8jjf+Lgnf2CG2GMgPWbcuFbZUG6ZvDsHrUEQqM1tv0zEJUqkmtDy?=
 =?iso-8859-1?Q?vlNe9/AjKjP/ndGnRBPeros040hshqXMj90AiovR57pdz2Vw2WZPsyl8ul?=
 =?iso-8859-1?Q?TAQbbgCbjL0xQKYFYTsNfBBK72Vj1mQITI/jBGc0SQrnwFnL9G46+5kkc4?=
 =?iso-8859-1?Q?BrUAVi7a7cf69h+LWZ2ra/jdSIJY/kVsQASG2W8wAS1z3mrq49jMJ3CU8u?=
 =?iso-8859-1?Q?Exk/NIkrua7yWfk0IkwO8kg5XJJDap00L8j2vZW+Lc0IjOJwSmL/BO7pz6?=
 =?iso-8859-1?Q?bxn9ip8J57dpTLx65+X+W+SA8uajNGcsedRYJToghc/+rwSvyzlDXuAREL?=
 =?iso-8859-1?Q?DmdoQjr20j6WXN9vyQtZnbnJjYfOkgCelteIeGyxI7j2LulMsCXO3BDW2/?=
 =?iso-8859-1?Q?ePA8j4PpfYyyQekpo35LJV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VbwCsf97UrpjouCUy+X62GBSISjeaNyMe+WBRUaD3BKawG+CWVCmzs/ZaH?=
 =?iso-8859-1?Q?rARnGHHwyqpVkLD0TKyVB59Adl0IdoZY+W6ms8kDVqg7rmvneljnUyjJ0n?=
 =?iso-8859-1?Q?8EvJdO9kUinXqN7O95AcAsIg2kkTXtnDeCv+uIcb4McdEApHj70Yuk8AsT?=
 =?iso-8859-1?Q?6uZhqm7fYJD74qS3dcwjyyDKDaKdMyeMJtpVU2zuwM1MoWk5XQOovWkmAm?=
 =?iso-8859-1?Q?sRXEaWuH3LIkxtJnsB4IwM/IPMaQY0ibaEkMhVGW48U45SzAvJsqZHQPcv?=
 =?iso-8859-1?Q?KjjvWIhJStiZS0toHvG9D+74v7Xl9ORQxSZLgyCOzVKrtKvIsgpe3XtHkc?=
 =?iso-8859-1?Q?8OrYeueSeJO6SSq+rL26XUWQRN3CQSGq8XE4gQQYt/Zng76J4uYbgOVexI?=
 =?iso-8859-1?Q?qRWdGHyTdRT7mbt3EHxO350Ck7jbRJ8cm/WMe/6i/L1IdarbiSiYhZhgla?=
 =?iso-8859-1?Q?tLj30fRK4Q2//00aaLyNNUFSL8NWKHO1nM/mCq4ey3VrT0obf7C0aLp2Nm?=
 =?iso-8859-1?Q?DkdzL5uIq99Wdk+r1GpjkbbocHT2fFbIURc/eAWRoR5NRHrFWPCCdCZrD6?=
 =?iso-8859-1?Q?Dg/EJdAFPpYnD/96hlt3cBtvhupgvMc6J9MwnFylhceU84DwY1g4f/SuUV?=
 =?iso-8859-1?Q?lK8ITPIsz3Th4ZIFk3Kcoq9QADABTCcKBQKodsbhlrMTsZIQYAFyXPJCyo?=
 =?iso-8859-1?Q?ESGAhhVtHMenYBcVFNSu5TIqY6b8w/1/gtkb9B4bjXPXugrfibVh6TAqar?=
 =?iso-8859-1?Q?fYcIJQFjF6uxrBmGyc7dWn4iGct4NEZ3QZpeEihmiK+Q1yaHg9kwlVJ+gi?=
 =?iso-8859-1?Q?Yga4zGz+97heFX9p1kDjLOnMOM8R64Teg1sC6qE4pttLezYI6rOEvm78UJ?=
 =?iso-8859-1?Q?Er6ALmR6qQX3DgEGWexqZwR+VSPZp0cFRMjNiwCWQuf8INRkkYHADFfPfS?=
 =?iso-8859-1?Q?Wbu1HGBrqB1q9XZmudVa5yb4EuhtMT+guRrL+DvAtWiWf6fR48e67uShCq?=
 =?iso-8859-1?Q?HpgAkZuKwmw3YMiGEGwcg8tlcJYLiXpSjzufj7buP2WfVooipsXAx/N6Z2?=
 =?iso-8859-1?Q?oKlqpkPyBoV6c5+MiVbGtHXHYi6F5aqv81iwOIxVKcc/Rw3bPOotkEBERM?=
 =?iso-8859-1?Q?fwoQIHjxyo0GFljtWVHonSmZYG1OdR85eDzTDiJPHrqrRRn7wOgaMJdaQO?=
 =?iso-8859-1?Q?XCHCQ7HW+JSYSn8AmEXAa/VFJfRRKg/VL280sNkMJlePl1fWbKJtTO7qFS?=
 =?iso-8859-1?Q?+8THfw00WB5MHbCBZlFV5hX5T8uuBynWAkBC+Kk5cYkUg6/jF2vbvm1w06?=
 =?iso-8859-1?Q?ln2MPPfbYKiZqlgBJi/u3o9/Y1ns1tUokDBIOCSU/3PrN89WsDkLyIPFJg?=
 =?iso-8859-1?Q?RQP32OsiehXL5XGnByzBqu0nLzgk3uLJrepUnA9bP8LjL09Fd7O8aNqNxR?=
 =?iso-8859-1?Q?/aBXrdtttmZQUliWAYzz9XIZ9w8/JRJY2+Grn7HFo8HZYhzMRSxQhO+bEi?=
 =?iso-8859-1?Q?to98xiyu6sJDkto5QOXnX/CIr1WPEHCfIg7d7DvYLcKYu1tYSoXvsoLTmd?=
 =?iso-8859-1?Q?lUti7eGUlaNhN7onN36ExNUn84gIR9s2vDidapfkYpkw+qnJrUdvQ6UOfR?=
 =?iso-8859-1?Q?OTuPqaGR+xKGnH9ZL6w7Nla6vqFak+YutNuW81uCcg4aud+7ubfRVvBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446d29ff-4a12-44ae-44a4-08dd6086f902
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:56.6931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fi/M4T3LWXxuhX6tBs/pc4e9GpPwJkWtXZmWUFbJ78+VMcTWwimcoT2egnnqeFZnpNHHoVOzrQufX22xYpnsQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

For some reason, we need a delay before accessing ATU region after
we programmed it. Otherwise, we'll get erroneous TLP.

There is a code below, which should do this in proper way, by polling
CTRL2 register, but according to documentation, hardware does not
change this ATU_ENABLE bit at all.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* rebased
---
 xen/arch/arm/pci/pci-designware.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
index 6ab03cf9b0..def2c12d63 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -194,6 +194,11 @@ static void dw_pcie_prog_outbound_atu_unroll(struct pc=
i_host_bridge *pci,
     dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
                              PCIE_ATU_ENABLE);
=20
+    /*
+     * HACK: We need to delay there, because the next code does not
+     * work as expected on S4
+     */
+    mdelay(1);
     /*
      * Make sure ATU enable takes effect before any subsequent config
      * and I/O accesses.
--=20
2.34.1

