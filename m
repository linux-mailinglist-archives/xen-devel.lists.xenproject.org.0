Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C27C86F57
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 21:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172192.1497287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzOt-0007eU-Ff; Tue, 25 Nov 2025 20:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172192.1497287; Tue, 25 Nov 2025 20:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzOt-0007bw-D5; Tue, 25 Nov 2025 20:12:35 +0000
Received: by outflank-mailman (input) for mailman id 1172192;
 Tue, 25 Nov 2025 20:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cr80=6B=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vNzOs-0007bq-I6
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 20:12:34 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 120d36ac-ca3b-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 21:12:32 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB7630.namprd03.prod.outlook.com (2603:10b6:8:1f4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 20:12:28 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 20:12:28 +0000
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
X-Inumbo-ID: 120d36ac-ca3b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1rCCiW6vwPJJcX8aDtvHKWyHmMql8hrVAQxRQfsHeAPZQKz+zDUWII4s7retBfIvYjqLL7QuTXpTIgxNo8BvmPlSGs17VUzces3F6YErvFDWpZJkcM7Jj6ih64VxOuDw+lJSLbE8cwbXBESmZ+ZEuKI4V7/yV3ipHgRutkbuH/C6cRH5Chb0DDOxYXIJ45Bm9bElrTW4Z3NIqaCfsP/dj09kkIIYOovS+I12olJ5MEwk9Jor27+B6b86ZJvNH/IYi+p93n8Mllcm+ZR0euc139N6v/iJmE14W0e2CKa6918qHpERPCEdKDraw6zYiTcAxujLRP4LWxvr3cjSTx1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUe/6vvfVHHwLPMl81vCZg18Njakv/jq3/l5Iv9DtBc=;
 b=MbhJf5YIYRUKlpMw7AWLoz+LE5EtoWvEcgUX/A862MO+mxy5QWFmuQG+syP+1hCehNtYARMnj0G/3tMitbPSQ2SXkaHyG1jknVzncs3VqTrvqPKloHKrZUuiK/e+nSCaewV99XBHHGYZeRoSztDiHHshqj0QNo1GGB/y8PwPy/5syMmu2LVkzGFCqBiHZOmqwUS7Zj4617UkFkUlH4HJPTR4qRRatQIbEb4/lZlQcjhHQBJEZWyufceFwLvZQ4+rg1wfLxHFQvOcEfhJcG48oQda2X1RFWPux6Kqv2l7SRXC9rWRAGS0+4S8iQYkYnCD94ULbLwNJZsOE05/8F3lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUe/6vvfVHHwLPMl81vCZg18Njakv/jq3/l5Iv9DtBc=;
 b=aS44Wc8vt7QSesINm0Bmwt7U2ASbz6lIwzoKHzB9uByxJR9rpuFGcGiIUAkj1IW0mlNGQ+QJB/ct+mUVoA445PiLjELlzat0l2eJ8YHgEjTwdJMPSseSLWyO+tW69mvknxbXw3bay7ywp7l3oQ/mFVf37gAAfZ+IVyZAEJ25XQQ=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
Thread-Topic: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
Thread-Index: AQHcXTQ73Jy0r9eIAkCAIFbbEnPqPbUCC28AgAHIZe0=
Date: Tue, 25 Nov 2025 20:12:27 +0000
Message-ID:
 <BY1PR03MB7996ECF620796C340E0B7537F3D1A@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20251124111942.1325635-1-kevin.lampis@citrix.com>
 <f4741251-0772-4a7a-86ec-951d08b22517@suse.com>
In-Reply-To: <f4741251-0772-4a7a-86ec-951d08b22517@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|DS0PR03MB7630:EE_
x-ms-office365-filtering-correlation-id: 8aebb85f-7bea-4ebe-ceb8-08de2c5ef4d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WABqgv2RQ+bQS6oyeb4frLkCdx8+92+h9xvNpKQuaDYng/yLdyauSTFaku?=
 =?iso-8859-1?Q?JH84QZ0CUe6rDrZgayT+D7+lRpDns44SJ6Xp1RhXj+SwZYOTs9K9R/OSA0?=
 =?iso-8859-1?Q?nTFGQc3Hwq5YID7vb0su9gS0PDKh4zeTYskiPYfZfaeCLsY2ssk2o1NXzo?=
 =?iso-8859-1?Q?LMkxrR4WIpuAP8MqTQSaEaFmD6XxU8W6NvVBiEd7kZmT1yxnehI+mCBJvB?=
 =?iso-8859-1?Q?BBzZBktQdrZ4mvsr2OQpua+DhBUS50h9vC8b1Nv/Q7Jbva6vl+YARLeFg1?=
 =?iso-8859-1?Q?AJrqAeudBEkjEJLkIqD+sae/kqaFN43rd6ErMFVCBO6ImsLZUNF6BjpcnJ?=
 =?iso-8859-1?Q?o/mOCl3jfOue/2Pk4uXffNnPcZOeGkTCEfMuC2lUkcJT8yySt30oI0V/Cd?=
 =?iso-8859-1?Q?uQKQz2Gb1MQQNnEVKAQuAmM92PAqO6+acLAO1Xr/Pvwbg5KdeP0suRjsgo?=
 =?iso-8859-1?Q?kfP4TxC4L/aqve4jmTszq/H6W6JFwS8G/Gt+kyUQ9Qm4tshLyE6dtor87J?=
 =?iso-8859-1?Q?YVe/fAE649gxre2qUnMBcTt9hoVKDe5EiZF3qwX04wAbmK5X0SrBOfZaxM?=
 =?iso-8859-1?Q?tBIcT8WmajIlAk+pMWFHrbaS1cfacDFxzKih2RZccfoKVezzyQHRcW+jiP?=
 =?iso-8859-1?Q?KVX9cRHKgEtAEDf0FCkxFtvwOmtWVarHHvn4+wMC6pkvL/pSuQZI0yd3Ci?=
 =?iso-8859-1?Q?ClDSGv6cg2F5DD+PtkcUjdek1TGrOeFplgbHMr0WVd3mAv5N1iHrMi4u61?=
 =?iso-8859-1?Q?hIxLjSaJW1C1SEbP3p25fQytdOJUn5lLIPJ5pTDkhGJXSXvH0DBUC6a1IV?=
 =?iso-8859-1?Q?VT1kKL6+oe99obvGNNuNapmWMJOeRN734laZsmJWrqbTaI8+xXv+/VEhvz?=
 =?iso-8859-1?Q?14sDDny+NAGgbC5C47cIZsDqkYSnkWtLAlEJja84OXfNEnLxc5RYMARvZq?=
 =?iso-8859-1?Q?kZMHEAkJ6p3KowQkMRHrGdmi3laa8bg6CasatnX0mebYzCzPLHiJKyq30v?=
 =?iso-8859-1?Q?ERm1k5kAZWvfgvpkuUQPJy0GJ6Yynt4sbEJ/zd6FGGSOKDIVqh1H5irSzm?=
 =?iso-8859-1?Q?WKek/aIH/szLaMxiG3WygyJUadaIdNR7ORVok9Af9ajPQBdY6fUVA/6+NT?=
 =?iso-8859-1?Q?RFrLW1HY/GUMhohQAAhkoasuLVtXur6hZrjyM8EL76ozgEBHXIN3LACmSM?=
 =?iso-8859-1?Q?0ZAyRM4WqVC8SaQOjryTnst60z/jHnEBS45Wu0P0DU66pn1Wl0uBWoi9n2?=
 =?iso-8859-1?Q?sP6Vq/tgjZFpCSm+loxXDydvyIPaMO5BTcCfS7QXBTm9AdXkUKMsORawNb?=
 =?iso-8859-1?Q?GCfcgKDta9nJ93DV4kxmDFQn+7WJxP1Rmuh3tginVqGYiwsQZOkXGH+4v1?=
 =?iso-8859-1?Q?2fm8MeBFTX8n6uJH4JSBXL1yrte1OL4Xud8qZ42lFEBD/RemJEjbHG5O2B?=
 =?iso-8859-1?Q?uQKk8sZ8TOa2P+bwvhx1BeXEdq8hpjJwHfLPePYCl69QDZ6Ip+XQw8VV7h?=
 =?iso-8859-1?Q?OIzHBrV1x1edInAYKKS99rxnFzOS2G5Qn8nh8cU+qjbvhFNxJ6wyzMr9ix?=
 =?iso-8859-1?Q?/Aa8YuhWfY2Z73gu5pQicyIGahRP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2KFbTGIWeS9kViP2Lxz6ZYrVml+qThS1gW+S618EfMceMmLwS6/1Oz+1zR?=
 =?iso-8859-1?Q?K9U4ZSw2/267DZR04KxbPAqboQHG0ieCmwQ0NV1BIPrd5LQ6vmSgiTWG5R?=
 =?iso-8859-1?Q?FjlWjrVUn4Zvbr9F4/tOds0BNmrrq1pGkQ09n2mEPF6/llcfLHH9cX46Ym?=
 =?iso-8859-1?Q?TzTmW7S3kXVJJAaiEv5iNbutn2L/Vn4rP3jfJ20DGeBFAGGya7mdG03ao8?=
 =?iso-8859-1?Q?P8UNDAfYnF3kAg1aPGtJECCjuLHJhE1Kxaen7Z4APTQEEb33FlY7L9cWWv?=
 =?iso-8859-1?Q?B5Aomg/f1ZT+sH5xrHXNbgzlbKC88kjU3TUjNnEicL7gwJLb8rbMkqWzpC?=
 =?iso-8859-1?Q?IRIrB6d367RlbG7OQf8XLTYkbk648oAKUDptsGwEQJdivg46FL7byKaqL6?=
 =?iso-8859-1?Q?k1RGqZbRh5tfsF7Wwk9ziYRjZU9DCUXf2W5zMiA6KE8yuN/WQd+t967Iom?=
 =?iso-8859-1?Q?5RpJUrlb7eNTscoBaVlTUlCNZZ01jp7pZe7uQKeYd69u1Y/0sP+wkhc95I?=
 =?iso-8859-1?Q?jF1cdE+i4ZJB4qVAWt0RamJg8AvN/QX7O9pmyYpjE7s8U94GkurnNsQFr0?=
 =?iso-8859-1?Q?9Nz50vP3TcBbCEo80V56AIOSGH7l8eh7exfEimMGzpeRij8yBmy/TTMKmv?=
 =?iso-8859-1?Q?L/dZhDWpVvQGf+LV10UdjBPBV1woH9GAjEBx7bdgLUStEmS3GANUym9Suw?=
 =?iso-8859-1?Q?QkV7SqsFSaWXXlxT32HjHz4cgBK8Voln+Ed8eNlBHUsBLSot0jb1juAA+E?=
 =?iso-8859-1?Q?yAEoe4k/5h0l6Not9OibEUQYk2bwLYen5SMUWRHFUKYY3mbuw8ChutFJ+E?=
 =?iso-8859-1?Q?DiKnxFGMBxGHMWijuz8BMxL3abdVHw1ZT8luDIPGAp6Ozk2SYHNro1HqLX?=
 =?iso-8859-1?Q?bexrlq85FzQLz61eIGB23QeGP/mo7YoiWkYaNd+RXf6HQbH/Hb9iTf69TT?=
 =?iso-8859-1?Q?7s6zXNkH6hnmmctWyHqjMoibu3h5wH3UAs3p/RleZuUMQ6vHFH+kJ+7hGo?=
 =?iso-8859-1?Q?NCi8qf6RzhJlj7R5qo7WmdQsEDUiXlcZV/RkhJpWZ09PbwRUCFvIgwzlQ5?=
 =?iso-8859-1?Q?4jXG+RDlI58LffuffTPxuxdG60XJ0fiAeI729FVWEr51FXmizysSlUOOzk?=
 =?iso-8859-1?Q?/Vgeboid0/eiAl131FHz6QUouGdzMcdMWzdLTx6u1pVFaPYrmKCtf/OS1H?=
 =?iso-8859-1?Q?8WAPDEUG2ZANeyXxk1btezgSNCqEZ7BRU12qOycXtWdHPrJv3A81YbIGHN?=
 =?iso-8859-1?Q?LHouleSquV93phf/R2cXvCGdyv0snGfZDT7V4YBfoCnQ49JSW2bOqQXkJL?=
 =?iso-8859-1?Q?IODzIZCgt5UWx29P6IUvShSIRKB+7bTF3DIDHEMVyeviKQ0W4ehaDyd9GV?=
 =?iso-8859-1?Q?aAVXf/gF1wJTF0vruA+/92DSffrud6LBeu7kFdy9dY8JOvh7Pq+T4M9I2U?=
 =?iso-8859-1?Q?5GVPlaMm8WJWYVhXidpNvd3Y+4A+RrT+J7UsMmr2gY0T52Bx4KpY1UA86t?=
 =?iso-8859-1?Q?RDlwQszRWOiHRCZE8xAn9zRL1SgUEKSNtl7extmXSvaWw66CiFjgibTUTM?=
 =?iso-8859-1?Q?sKwBpcNo79Hb12I+K/NgjLUnvD0/LvBQAkOz0tDl9GCsVuiz9XEIbtsim4?=
 =?iso-8859-1?Q?9ZunSoGtushLEJ5SpL4jRnzeC0SIA5KG3e?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aebb85f-7bea-4ebe-ceb8-08de2c5ef4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 20:12:27.9445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsjnCz94lDXfgt4NjzIeye11sxsOAFREmeTYVeRMY//Cua5dNszQbE1oeM3Cfw+YAkcE4Klxmwx7l5vUyizlBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7630

> Bogus indentation would also want adjusting while touching the line=0A=
=0A=
All this code is using hard tabs that's why it looks wrong. If I convert on=
ly=0A=
this single statement `if` to spaces then I get a `misleading-indentation`=
=0A=
error so I have to convert the `if` block after it to spaces too.=0A=
I hope that's ok.=0A=

