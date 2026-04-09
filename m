Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id znBrDirM12mrTAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:56:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8483CD2FD
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277948.1563011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArjU-0001OS-97; Thu, 09 Apr 2026 15:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277948.1563011; Thu, 09 Apr 2026 15:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArjU-0001Mt-6J; Thu, 09 Apr 2026 15:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1277948;
 Thu, 09 Apr 2026 15:55:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wArjS-0001Mn-T2
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:55:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wArjS-00AAaV-8o
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:55:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d7cc05-2eae-0a2a0a5409dd-0a2a450aa1f2-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:55:50 +0200
Received: from [52.101.72.116]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d7cc05-ee98-0a2a450a0019-346548743556-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:55:50 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS4PR03MB8554.eurprd03.prod.outlook.com (2603:10a6:20b:581::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 15:55:48 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9745.035; Thu, 9 Apr 2026
 15:55:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT8PivgopX8B6HK+EUR5dsMctaG8muPrUQl6BbSLRQxFbon6iOJtFSpd7uLfhoyVp6XTRriepBJxV1vxnslkrqKkjW7QlG4SshfT0+meM6c1gKXL3sthRo3C+lpwrBN9dpEi1P7tzpiPO+LLvXK9ZIvHJxL9/Jk5Wfc6c1tLfe3D4tUMJQ1TuDxXpM0d/0/wdaf24lXMGonTjyvfM3yVqz0Ov55l6rgcDuoTOURWEmKrpBnYd6SaAlGf3LhKU11Oj2S77nakf4LUekOwPuulVpx4wAc2DBTLIVYlJ6niYzR7M0ER6yS8OI5x7icG3tnRFiYY9WYTr08RDaRuVNrlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYFqiYL2RWaSj5UTs0yxhxZbv/2e+rgrJDmULLs0AUs=;
 b=FhaXJnZGsWeVyN/9fHL/BrJ1HwIcI8HHUfICRxW69ri/onLGPsHxszSFsHMh/yZyZmYJ8u/E113/u7Hk8zVQjh39UOcfQDcLaSchy8X95xyjMOrFaPBU05OYSr8Hnqmh1xGpjnE9AazC4mKXLhiLCiBPcrWCozUoszl75V33+wxzLZr9NBpMhMRmRsdd3tFTtpgksR+Ei2E1lxeetSY8St+hUz5+v7i2BJzo0qpNsf3DSzDZ8LHKwNNL9bOa9Nc14NR4TNHmMovCDrhhxAoKBt/T0I4DPMsG4dN64OKdlmaZXKDiy9tS4KlmguU9oNqOPK/Xd5S+LnM89I2/9CSBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYFqiYL2RWaSj5UTs0yxhxZbv/2e+rgrJDmULLs0AUs=;
 b=n5idw0ejnJfoz3RQ43zX2oe+0fiD9t+VMgKwF73mo2ri443NqAQfmEK9/MKanbmO2tKebrHr3Pn2F6WZkLdr8sF5sg+cvRBQFzzF4wOP+2hgmgkenstjrUXBMig5K69nadX/tchZ9dpF6jjv+CBM4JBc6NpajSewoGz51GLaT48MsHJrmmUpcvApcfnIPpoaCfrGtcWqPCuKJ4VUX1zxQGXSmZ9BhRA/7t/XKjEuc8x2Y6SifsQH4IGUQeQOoElxtYJKwu1DFyqwYyhxNATStB4gis7Q9ZBTQmJ/KWxBBRQrceCi96KgjGky4Llp1Y5q+T3jrQcZSG+lq5vtrilseQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
Thread-Topic: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
Thread-Index: AQHcyDlVyOevPxMGvE2K9zY95LxHDw==
Date: Thu, 9 Apr 2026 15:55:48 +0000
Message-ID:
 <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS4PR03MB8554:EE_
x-ms-office365-filtering-correlation-id: 6614684a-d48f-45ac-9200-08de965077ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 88KXu5Bz/Ik+huN8MZoQuJBNT5Vb40kAeKmQ7U28Ji0hhhkQESGPT8MRBKORgfFYMcTdcCnqvoUnHgIJCyZXyUI08svOQdGtvE+Z3MB57epNAex1qUhAvrXqtXop2zqjmyoXyEmihBUJabY87RxPqnt3kmYyzMcgeVff4w86BvdIRwOIItJmWS+6aWJDMHld1k6Ovp/dGzqajy5S7ELpWSZq4VnOikLL/iXnfz7H2JibJQOn00lM0Szds4A+vRvMEUs5ZhzOay/lP07TnMafi9hdwE9qgkB1tmwcDAhIjXmKfqgFN102Y+4dhw9rMW2ofR9YKmBrofVp5O2hdWbAg6jtQ0Sctfs2G2dW6glAY23nVUaNFRKLpxHtVNZk1sHfbJyHHqsVYgYJyJ0GCfF6lcBl2U3bSzEXcn/OQ2IpLoPQPZInk8zQZk6uC3eBdn9BNqeRnLANfFL/mhbnmXWHN+I85oXuTbWtUT3R/lsYMsPNDMo2B1w1n3Q7gGPlYVcmzwPVa9Aic6N9JkzDMfB4DEHRSYBSXfKeOTeawsM6X//xiWekW/9J3LMvKIpXKF1ds47vi87VU634r3cdJvaqXK//Bt0mr7VnrFqA4m7FiuMBoZydK1etjSXqXGYTzYrgrjhyVEcR700ehxiGBuU44G2+AzAcKOWHr7KQsFr99NUri5KHM+vsZfmnw4/1M6pWkJaycnf1vYqJtnltawzut42rFK1K5FlbCV056rr2G1BbxE/96a+XqYh+nxfdzR6yMHzzHELIwn7r/JQcl8Y2YQbu8LXY9Mf4qfTSUhF4B4s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zdAU1n9VqxciFQuOQZ+CDdUmkYwFJy6IoB2l6fIILJNk0v26tCy/TSKuqb?=
 =?iso-8859-1?Q?bpdayYKzrPsD58T1SJGLbxS4qHEmUAWSBXdcr/tornM4d9jbZiJyn9QiF4?=
 =?iso-8859-1?Q?ihS9q5sVroad4OASmhH1vPskOOaaLvWhhHzulwq7/LAfl+ZWNgpoysckEM?=
 =?iso-8859-1?Q?2y4bIBswk7P+3njgKhuEcZUICPiFTyF+2tlGNrR8g9H5ic6QpY3+s894Od?=
 =?iso-8859-1?Q?RBNroYrCmnoWC6OchgVAV0uS9MLxRJG64ZeMZ1s++J5kIvrRvTEFp1m5RT?=
 =?iso-8859-1?Q?y7JuHr5ONJisdpnavmh2tt8vXU41ixW612ku+jcI7vn+xoK4cjMPH1G1G2?=
 =?iso-8859-1?Q?wON+9nGc2zk3LG4fwMj7gV2AF+8OJxtJhKG2NbLahiQ/eDxM/zADUvSVy/?=
 =?iso-8859-1?Q?dQeBlUvtnIKbp3GvsoamFGF6aUE8r7Az5pvSxX6/s9L09d1RxdKyngY8r5?=
 =?iso-8859-1?Q?VuqzMVCHo+y/Xn8l+I4PkhqHsIYczgi0EB8GTCgN25KDYlZGBYk6+jjs0K?=
 =?iso-8859-1?Q?LNkIcSB9fYZjvhvUnEp7MAm7WJA/8SGTSFEdKF1EGDoCFoAgQGIWTCIh7C?=
 =?iso-8859-1?Q?HT26G5aks2TJKjJ8Zh5Y54zSjQWrdR7P2wqmMng/aXCx/bWmEzrvb3jcNE?=
 =?iso-8859-1?Q?RhJSEeJm4+LGJlz4/v3o8UPnPbZA7nlC+d5g2ikvzfxj2sTpqYT3aaXkfU?=
 =?iso-8859-1?Q?I+MpP9oJNm041EqgF+QQBM+nSnLuLIoQDWhysevJk6C+5+IaC2Q4y/27GE?=
 =?iso-8859-1?Q?3Kd2koo9HhsyaxPI3J3N2xKuoZmZ8BlWkCInzxlvD87lZuzZf6tn4cEJZ2?=
 =?iso-8859-1?Q?rRCLoY7uiKjY4jwSSgFddPOsfxESf1+mVMPkca0ZwztwOFnQgfSXT92nXn?=
 =?iso-8859-1?Q?rsxJFib7jALeq8jGDH28tNcxrclRbAqEzahDYo37nsPxbytfEfTdwP18pZ?=
 =?iso-8859-1?Q?S3Dw+LnXKdTPfFzjAYBfq6pX+rgRfIFWc0XYzrB8F48Ud9pWIJffpzJX5L?=
 =?iso-8859-1?Q?1H39vjXEuiWUAgCyPGSvkQpPvlYk3EG/AFLJyM6GHkeJ0UTMVNOsXYk3Zz?=
 =?iso-8859-1?Q?zvxIz9E8LU/FpPrDPwA1tnLHtk8nxTU4Jy+NViTGu4QyRYyIMn7tmfrejw?=
 =?iso-8859-1?Q?97GC65Qnhlz/NDOlqvtM0xQsBxV2ZuxqkMuCXbO9sdUkCCerpaTjxcsQLT?=
 =?iso-8859-1?Q?30t+avRasIOUQcw0lqZHwdv8eG2z0FMkJdCvkSYIlhHQfo75DDcGMo32EG?=
 =?iso-8859-1?Q?a2O5eS9xDeXId9JTmCE083n1cwA+24Tq7BwlSWCI9W9yse7GZZ88OEt0h3?=
 =?iso-8859-1?Q?fvRvng7go2estFJS7JrX/t652oqbOFPH5i0Qxo6pfXdw+TnNntX3TVvoAn?=
 =?iso-8859-1?Q?Dhp9h0Lngtw3jsTDf2La3nPyCdKU4pfEfmcNLeyQrRnxvPSO27ALqokd0o?=
 =?iso-8859-1?Q?FF4y4lQq1OzesX3j1a89RfcsM91W9bncvlsVhQ8wuuCuJtwlPTD/cbQF2p?=
 =?iso-8859-1?Q?ja2C+vMGOM5EOPr0nyDqZEmVttSFdUuuS8atii0K5J2IIqUfIy247jbj6U?=
 =?iso-8859-1?Q?BiMm8OWNadTg+wCqV/NGuH+EJDuEMersW92BAfCfd3qPehhDVqjbWjLZq3?=
 =?iso-8859-1?Q?OvuUHy3kqBO7MQeaCZ7+magd1/oRgtGIAobV9nhd1UeUbjnNfcpusus6Sm?=
 =?iso-8859-1?Q?eoW0+T5ui666UDQSSqosSZO/geV/TdxgfENGiSLPKu1Q5p/Z7UvNzYoXXx?=
 =?iso-8859-1?Q?h6ZjgxSv74zasKlGyqy+WY5xYmQbVCF5zkrvN+A5Xmk89sElY8SYyljV2r?=
 =?iso-8859-1?Q?ztEmY/3teRU4NRzIAT40UD/0C91PwlY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6614684a-d48f-45ac-9200-08de965077ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 15:55:48.4284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lS67aZYnXbTk9EexmvHQsh8SI6OWSAwhpme+fh7kFjk/8/qwgT+SSFm57vjKq2oRsVCW59jXlStGogIAAMWxwTY2+w6JksfEcK2U6y63Upc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8554
X-purgate-ID: tlsNG-4011c0/1775750150-0FD420B1-D8A2D9CA/0/0
X-purgate-type: clean
X-purgate-size: 1132
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,epam.com:dkim,epam.com:email,epam.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CA8483CD2FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The statement 'return ERR_PTR(-ENOENT);' on the final line of the function
'hypfs_get_entry_rel()' is unreachable because the logic within the infinit=
e
loop 'for (;;)' provides all possible exit paths for the function. So there
is no execution path to exit the loop and reach the final that statement.

Remove that statement. This also fixes MISRA C Rule 2.1 which states:
"A project shall not contain unreachable code".

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2440991088
---
 xen/common/hypfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index cdf4ee0171..fea74d66e1 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -347,8 +347,6 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct h=
ypfs_entry_dir *dir,
         path =3D end + 1;
         dir =3D container_of(entry, struct hypfs_entry_dir, e);
     }
-
-    return ERR_PTR(-ENOENT);
 }
=20
 static struct hypfs_entry *hypfs_get_entry(const char *path)
--=20
2.43.0

