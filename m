Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C6B99FD1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 15:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129390.1469366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1PJQ-0006oN-94; Wed, 24 Sep 2025 13:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129390.1469366; Wed, 24 Sep 2025 13:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1PJQ-0006lt-6Q; Wed, 24 Sep 2025 13:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1129390;
 Wed, 24 Sep 2025 13:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDcr=4D=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1v1PJO-0006lm-Tt
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 13:13:35 +0000
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c407::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4190f18f-9948-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 15:13:28 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by OS9PR01MB12454.jpnprd01.prod.outlook.com (2603:1096:604:2e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 13:13:22 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%7]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 13:13:22 +0000
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
X-Inumbo-ID: 4190f18f-9948-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9iGc+6x1qRpShhre/pPxlycMeKMvtOKvUpMDB0znyEhJ47dTzRMMgDuCvNKFAoG5C+IDtN1xSEm1XiYOtNi1MzRyie+Nuj1FVm9YrXMekbwd4NcZcgj6ug5HpQTWSfuP7e6dNtl2kA1EipbgavzG1rlT4W012N5Xzh8OdYOCpMNxjD5ime5UM4B9MBb+x54cK0w2KEE0B+WY07gvtZ5/DSFVQMiUMwXcmyCa4yuN2mn7GTlGCIPpZEyi3XdXALl4vyACRTnCKCsr9Gan4uUrLTTeaz7yHJyabixj4CQPlKIfBG/YlTmBHTIlxRXL3Urh2ZhNeYiz95PjzsmFfdZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNBc339dmDuvSur9RcpUtIUmh2SjL42Vj0uSxaKWbi4=;
 b=cRkmHsAWRX2GyHTLW086Ft13S6v3GWk0v6rEW7g8zDQyWBW5rhpS1/W2iW84aUWZs0D3Z+tAylvghbGE46HOF6LQgAuaP7Ch1vOgwk1tVJ8mQe3VqgzoRxlsBrZUlDPvvBfNK/ZnJZJLiI+AoetEKL3CEiUR8n6vdPliglBBiwBK+pOqFPLFZ5ixMi9/MKSa6rRW/w+jMyjZccrRUSmtd5tjMnXwKNQ9pYLl5YeL+QNcn4XI7DfD5iSObIdbQwL7rUEpBEbtgfrRRZ+DS05RT79pQuXRSeNg0IAStH/pTKHPeY9nYTY7nCYGWUpjhv0KNPQRSgqXzRb7TTU24QZ3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNBc339dmDuvSur9RcpUtIUmh2SjL42Vj0uSxaKWbi4=;
 b=Xx/JwKG1XzpNjomZZAktLpYBOCGtBc+SMt5RxCNefIXhjyQnco8lqsEIb94Qc/6gTvTmyoyef9LsVrYGO/rC+wYCdFOIHy/oOlgVRishO/qA7vhNedmEkBPkjInOJ+PbH1bd/XzMgh4Tb3jPuJlAiGrZewfw0RDZ8n6uQMkf+Vg=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jahan
 Murudi <jahan.murudi.zg@renesas.com>
Subject: RE: [PATCH] docs/xentop: Add documentation for physical CPU
 monitoring feature
Thread-Topic: [PATCH] docs/xentop: Add documentation for physical CPU
 monitoring feature
Thread-Index: AQHcHcD1JxP+jqaKQEWwakPuid7f3bSibgcA
Date: Wed, 24 Sep 2025 13:13:22 +0000
Message-ID:
 <OSOPR01MB12408B802528454E13560CE21AB1CA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
In-Reply-To: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|OS9PR01MB12454:EE_
x-ms-office365-filtering-correlation-id: ec2e652c-0706-4ff4-978a-08ddfb6c235d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DIyXbjpyZn5vvTjv1ufOudaWnQ1ywsQfWUf1aIbFdPYOhAAmhRE4ES++bhvB?=
 =?us-ascii?Q?0+IoA9ouKzW/asJTIccdb3QowHrOxkeLzFBijf9G6TgC09XM0McdPPsZ7eS8?=
 =?us-ascii?Q?28hWNWh5WhCJrXQkjSJOxEhrXkEWpKAypkbA02LEi6MsAo3cKkJNzOuqzpJ0?=
 =?us-ascii?Q?hOEFZg23wdcB7NcejanInp5aYnn6zv/0Qt/bdjSocc6JZnt9yRGNkq0yWt22?=
 =?us-ascii?Q?va4OGtgv8xBQzPVUPCkd/vNY4LK/kmCQR66y+uMzdcKk5L3wvFHCK8N83i1h?=
 =?us-ascii?Q?GWauphKyvL0lH+/E2ZhvaO3ttmg1PwYHsXwpK80CtcFiSMyoR67UmO1axO5K?=
 =?us-ascii?Q?TxdtUQ5UuFtX9ffsK88vyLSZtamXVxwmSxjzcEQvZXRc2clrsYnhCe3v1euX?=
 =?us-ascii?Q?OIEMPKa5QjdwJQXC/2FUVnq0O9QYxor6QhhVNTc9ZecqRAJh2qCXANI9O2ga?=
 =?us-ascii?Q?LHUlx/tUC4MXWAUvNN1WgbrgwKxfztNEzl+aTyPfoT1VMb/CjNWWK9Dfa30/?=
 =?us-ascii?Q?sXqeG7Xw45iMuLO0UiD4z8UiNaF1UK5/mzwlcqkT1oUhmn/8c9zjt88pcCnR?=
 =?us-ascii?Q?J7EIWJMdeGD+nI64oFZA6P5uoAtYTcSZoE/99erMzVU6GwIsfyGI0KnafFAi?=
 =?us-ascii?Q?gERoxwKl9YrpHLSORbNjBxOdy9uTjowP20P+Sdk7RG33LyrDsNhtEzYlC2Uw?=
 =?us-ascii?Q?ewXYsWGQXmOY0g+QJ9p+or6TUyv7457Dq8XrDCzq2Le0H2ps2hCNEs/d1Uta?=
 =?us-ascii?Q?96ltwN1XzgYmZ5SXN+UlrY2mXO+4rgpnsV2r8kBxc/Rpr+ACjr7OA4o66EOL?=
 =?us-ascii?Q?1z3nu6c0NcH+mAIlut3Z+zbwyBFyeZFMFkKA/978lRAMhA8knoLrbnDGGZ+3?=
 =?us-ascii?Q?+iS5rusipi+waFRHeM+IFcahB0B0vq+8QC7IBTeB8Fzds65UjYjsHcE2O4n4?=
 =?us-ascii?Q?LNZA5906n8l/p3f55pI1A/gIIe+gCML2+zDlMr73Nv7cP54ItORc8Q49se2F?=
 =?us-ascii?Q?C9gWotIMGo5azUSrhcDM6OaP8KXxhXnkATVZypttCGvPtWMhxt+9QqIlVH93?=
 =?us-ascii?Q?lOAkRuzLK4o6Jj9wI5kLIzMwCSsbxOBCTUxdShY03gXL3aELI5XAto1IcDP0?=
 =?us-ascii?Q?tm3d+wpU2GrVmJFyApENHB7qdRcnOZtFAOOp9rl0CACAXC5FzeiSq84zZFtW?=
 =?us-ascii?Q?vtCgIm3tOr0WH/0FWXaGolvtZPxNq5WZThVUGl9mLwkLRxyA+Z0hZelfRpQ0?=
 =?us-ascii?Q?rtX+nHH935PaxvUsXNniac10F6/M7z9LI0I5OHf46Qk2l0lLyA/xzfWVyvp2?=
 =?us-ascii?Q?p5VqRRpU777n7N0Vlo34ACqJGNMqQVXU8pk0E5Mgd2JGv+C9a9Rr/FWF9tjj?=
 =?us-ascii?Q?BgOUDXznTg2zVD07kgDR84RFo858zo5nqOpgdK1Vjw7c9MGQbI8DrNjKLr2Q?=
 =?us-ascii?Q?r+HsaZY7VkP+JBoY08K6CSPPzokiInIEpCWqcULDQLksr2xudU5+8A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aN/07sTv3DQnMVa3mxxOPYScygxBvJWXfHW44Bp9u9kgiy8kCTJwaGWoGfvt?=
 =?us-ascii?Q?btbI4QQKb59Gye42yXX+h/hfq1WFWyOUd9qGOzDmyxPLXnUAB+5AdEkziLCn?=
 =?us-ascii?Q?7rvWpi7ahQhsVKu2bY03biuISoWDLVlbvqMpQzyYfnjsRWsB+4cqeMzB8tlG?=
 =?us-ascii?Q?coVs2GqqrrnxCHCbmYtBOtxswQzLvE7HsQM8BIJxvE18u0xGurChzCwETFng?=
 =?us-ascii?Q?phJxik6L8py1urLsz+z6dgujIcv1f8QKTZ8DvCy8PIAOz6TnylMSSueVXbO4?=
 =?us-ascii?Q?H+YMksoPnP49/y3A//n6oT249u7oaJQ/yKrYmTYdaCehlx61Egt0uO0CzbpP?=
 =?us-ascii?Q?Yj/UclKqfQjSDoD0nO1Uiw9X5L7eH0Rby98qqlWr6BhToHjKcCr1Xjch7J07?=
 =?us-ascii?Q?TDvBNZUrSzPJj3ZoyS1nxZndudHCpZ5bHCT1Iwdp8z0y756Q3Kvf5UMHfnOu?=
 =?us-ascii?Q?e6l88FU6URxQ3wTGJAq5vHSaaChnTgRpURvxbkXo1k9R6ZfALymlNnzJUfrh?=
 =?us-ascii?Q?tasCiZa2vHhHYnnAst+LmBDvIisPYIpkpLY6st8ZJ4HMNQO6tetZ+7gLgPvm?=
 =?us-ascii?Q?weRtIQq0up2l7cU9/GeoHH+l9ipd/HZHWUGXfomIExFZxVjZcvSYrJQiyd9w?=
 =?us-ascii?Q?R9+RFz+ij/C9fAz5j7rFlvD5bEqclR2BvMgjyNiqGv255qCJrZR9003rqDEy?=
 =?us-ascii?Q?JhDQLeNNf/guJmP9R9hbvxF2G/5uuMtyAG5ol0xsIx4h44v4FJTEPTzvm/kc?=
 =?us-ascii?Q?IKnrTiWtsCy4cH7ma5xUwAw/8McTF+AaHUVuzSjNNmPS60jYvhCKfECWaopa?=
 =?us-ascii?Q?dkQGZwIPmslCFU0RD4SFQffbM1bzhHaMI8Ie1lxSMUi1KgrYr6rLUaUkFBiY?=
 =?us-ascii?Q?M6l7yhhwYVTLQQNr6872nWXjbbcPRRkQ6YjGCSCA+gSXuOhMh0vJH6gBhiGm?=
 =?us-ascii?Q?r7cabPDP79cPih5oUztKdSHkd+3iZxtGpzfI4uLnoLsTf5Zq417dVCcX9Kcp?=
 =?us-ascii?Q?cuyTFpGgwLZeJqniFNk5pepEwGqVVcGzfIqIVYn3cQ8R1xzETbIzqDq+7o9A?=
 =?us-ascii?Q?PUlvdPmB62VLuq8tmsVevOKcufSkqHqy0W0yKSKJ7Am0g7yq92os7FvM7I4U?=
 =?us-ascii?Q?wyx17rYRJnOCE/9bMPRXnzuOcsQk0foEkt4GRAIwFCQ3CpQu0JNk2Gwb+0wl?=
 =?us-ascii?Q?CCeqwx7lCl4+p6jK+EpfaWaYh6fv5kuWCi66pqETMWeefhlNHd3HmKu0kpWq?=
 =?us-ascii?Q?5xSGgor9+1VB0wGFWAPqjJP0RRiL6FWC1Ldvd2mh1mu+zzCEL4uebIcSnZTn?=
 =?us-ascii?Q?yB3KvqKk1fT70kC2rj7PNXCdx+MMmDY31b5rVJIUzrglqdjZ2Q/zL91qdbuE?=
 =?us-ascii?Q?SdsFqGnVI77y5rY7853GqtsPGw9ROTX/HZTzMl3cdbtSbvNyPcjhAoqfnMIv?=
 =?us-ascii?Q?fLk0L5f39q/nfHNvfPXBW1EgC4ucUO6y7DAUa2/ZLuL3LY3zIEDT2RNCKmXH?=
 =?us-ascii?Q?3kH3FFoLAEMXR/1Ji/uKdXTVr4FR1mEO+TAWTuYNrB6YFLeQOcifT+GTIw3q?=
 =?us-ascii?Q?PqFsRPWGCd4CxM2rR12Ogk43a+ePrIPFb1xVdanp8XuxZ3YvC3Y4ts2BPF0a?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2e652c-0706-4ff4-978a-08ddfb6c235d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 13:13:22.4356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxFFfmsOhynjMETkA2j2VpZzTVp4jVH1WGBXdqbSMEHHoQGnAoALzrWmwmh8v0DODvKTkSNrOEuXlsvkKekRrxZAD+G7N8vTk8bkJ8oruqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12454

Hi Anthony,

Just a gentle reminder regarding the patch that adds man page documentation=
 for the new -p/--pcpus flag in xentop. If everything looks good to you, pl=
ease feel free to merge it. Otherwise, I'm happy to address any feedback or=
 concerns.

Thanks,
Jahan

