Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gn7C4HNgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FA2CEC74
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218796.1527706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZc-00022t-Cu; Mon, 02 Feb 2026 16:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218796.1527706; Mon, 02 Feb 2026 16:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZc-0001w4-2I; Mon, 02 Feb 2026 16:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1218796;
 Mon, 02 Feb 2026 16:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZa-0000fY-1G
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:46 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4810d5eb-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:42 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:39 +0000
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
X-Inumbo-ID: 4810d5eb-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uo2hE3MQhU8Y/+6mnxplSpwliCr6Yv+j7bBXbsy3c51B/PAG9AS4vPBufm5CznAAtHXbrLLHJeagO2K52Ci/IetI1R/RFLwWzOGiKsq2NiMoFD7BRBcGJbpESiXEZm0hBEsUrxGd6cvZqsuKm2IURnHkKH7uQmVMCDPpAa4XSTMKFG5MtvQyqIUTeZvYmJIhrLAVEOzkvfNyy4wIlvQ/nHh5nqlsUlzhMONjxzLUYEt/EaNxxRdMzfz/MQmguGjeax+JjhTa49o1+OJogCan29fv6CiFt1I7kJwpcl7TCDzdKHzicSTkp/X22K0fgSAO9iotCZYLEhNbhpX8MbSRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTPHXMX3fipHD7hAp9lN3f/0Zh89SWFqMLQN0ky9Opw=;
 b=so9teKL6xQBct73mBjzgbH839UQbaJ0SuLlTkDbkj6OLUq25272p2Bx7U31aOvv2R/to5WuDj7p+CNXu9tA5on3OaqhxazsZyeNURjlmD+Eh1KT8zrZyw4pRj0xQt/qtisB1aWAOTxsEZs8eVjciUh/AjPm30SOl3y0NbFgWJ6BmlZRnovgoile/n0RGLKERW0KFlY8vl6s0PME2BZdtmudtC6CaOqVpDN2Lsj06E31XnEFeXhu0vHKD/BLjVIfYaeLoI+qq6NCDxbWSaaGcJK5a7kJum/qSRw2B98v7+g+MaTZlOdtRe5aD1irR84uIXSBamHNbly3q9lkxqrRDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTPHXMX3fipHD7hAp9lN3f/0Zh89SWFqMLQN0ky9Opw=;
 b=shmU30LNwwAJU7LjepflUy+GXLcaP7yfnhmDuKhwZPavbORnUYYa4/+J7ZnvvIwwrwwiW7l80OcQlLXXoXCFXEDZFz1LQX79uUOK1MFTn6wm8hSMGjychXMVNxKptVIpUvgNdSN4XTplng6q6GF9hY7/BeAPGymrWe4b/RmuNzmAoA187lNw0YtcdfuGu16RD7s8utm8aYljMUAOuemrJ4SN6bgomzQ4bQ3EZRZqh5KuSheq92cRZDuT7yzGr6o6VTYrDNIpm8h4Gd5l0hl11f03xgWYvwyTbIDULAvf/oaYiDvt3ayblAj6Un8qaSWmFZ2mHfXIvZMFUVL5Me4+1w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 06/19] arm/gicv4-its: Add VLPI map/unmap operations
Thread-Topic: [RFC PATCH 06/19] arm/gicv4-its: Add VLPI map/unmap operations
Thread-Index: AQHclF8I6+NnH8ugx0O4CpyExrWGFQ==
Date: Mon, 2 Feb 2026 16:14:39 +0000
Message-ID:
 <a821c49c7ba01f777546b0f7ab161d969a653b8b.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: dda4a3ec-6969-4f7d-f260-08de62762ac3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EC1wxpwNhlBNHT5dY52Gb/hwIq6bkGSY+Yh/4qg+pkO42i3AiWdoatBLg2?=
 =?iso-8859-1?Q?oPhM1FFJ5Kng65/rip9weKrcx7ePVaF2ApNJ5rgd4exlu8K8Ik6vi51HgN?=
 =?iso-8859-1?Q?ABtwSigH2GVowsI9Bx9gWD9WMLMwUueuz/u6flRQLgvGyTdZl3AqjgFeEa?=
 =?iso-8859-1?Q?NWv8hNl/c0zmx3CcW6lcKaH0cqfUn975oPoKdZkhhpqaUj4+QYZnGC+1Kv?=
 =?iso-8859-1?Q?p82TZ0Z3UejKTXVBLzaK6pwYu/NpMJz3Mgy/WvF42RMuMByB+D24ZilIJj?=
 =?iso-8859-1?Q?WOPAA3IIULp6iySdaL7LQhWojLXdsViZsSNeFdxni2XXJVupj1Tz5y0/NX?=
 =?iso-8859-1?Q?lg8+vznlLJe7Bd0pistUu3X5ct/SB15uXoPwTIEDzTZ1RPUvf3wzBO5jg2?=
 =?iso-8859-1?Q?61fOTa+NQHQPBuL1Gd58JICiVRUwoDa3Q/kYEwIEPdMqd8StV4CNmuzQhj?=
 =?iso-8859-1?Q?DKk9yUPQWIE4qKRwuAOjgxmKl42jFK46Ger86MmSRiNpCinlgUtasgg05G?=
 =?iso-8859-1?Q?X+34PhMD+J9iE0CJOk2qBsPg/LZ2gMTnP30xudptWpUWdKN0PsWKrtaDqN?=
 =?iso-8859-1?Q?HBd9Oi4I4TEUZ8RGmWNDTA0CjaKP2Lnu8ebAkmOlA3ckd6OPt+3gL+aZxQ?=
 =?iso-8859-1?Q?9HAjDU7+K+EbaJuZVhbZOgZ07Z6ERJ4cLH3E3KdegEJmwqQMdQptoHbvTI?=
 =?iso-8859-1?Q?Hhkd/WfYLcBn8hWz7Dskp80FfMtqKS1erzulofw/coWww8qb46ampeY+Cz?=
 =?iso-8859-1?Q?JRKxf/c4AwpsmYM469cqEkM2vqoFGQt0X38VML1ONWybT5g2SaXnYh8L+g?=
 =?iso-8859-1?Q?bf8lH6O+cXmOrm9pq/AW8alsc9aZoZvyQy3iLV5l0RIILtkDCYv6Eptkam?=
 =?iso-8859-1?Q?xzAYeRGV6bZ3qGf1VLfgRqx0kFijwyk9Bf1KhF60j3vQIJqkKpChp2eE/e?=
 =?iso-8859-1?Q?4uCXw/ReleypwUPA6AwgFGVgMgb6vqGTTyL614faQVUtmcE+IYmoq8PjC5?=
 =?iso-8859-1?Q?27Wr2MzF703PePt/aAxdwtqvETzjnb5Xn0FukkFXtna0A6GXl20S/YyX5w?=
 =?iso-8859-1?Q?NSPDtwxxkJjBLR+ZtJUK4Ol7AP9W8CDB13YhGN1Tu7flQFpw9SoNgAwzdC?=
 =?iso-8859-1?Q?G69mqS29yIwHOeervHyKGHbaEOoJn/DkLH5P9wYgDjum8iUWkhw50CQlcY?=
 =?iso-8859-1?Q?nLgKKm7ZWwclOw6fjCA25GLT8TA+2z1nGmeqygGTJjZjyh8Ptjf4x817NB?=
 =?iso-8859-1?Q?++U1iET/JEQXn2ZyBX0BTil1iRywspfFvRnaVP3tuc20fQZQm7JnANzXGm?=
 =?iso-8859-1?Q?0QAnisMWRSIUx04dsL1G7/TIppMXk6rNTvd2Kcfnef+Y9AXkHiKkMDhQkE?=
 =?iso-8859-1?Q?Qczr6ESs32pea1rb2j18fkdSzDhgQh8cf64YiaBtE/xwGE8JH9rhcwv1B6?=
 =?iso-8859-1?Q?vUdIFjy2KwRRqcyqGSpA2nK+F7vSLJ9N0iFHEMSyvIS9WWxUANEfTeoHAm?=
 =?iso-8859-1?Q?51utlxQllrM4IZk2v6PfMJY0lprQIdwkhXPYPRkk4gix9D7M0QlmJrW1DS?=
 =?iso-8859-1?Q?hRByEu7ZlYsGgXZzO+99zBQ21lJ2uYLRAjy5IAmCofUBUMH/Nc2ZDuckpk?=
 =?iso-8859-1?Q?MtraQtoNh0kd3dlVPU633QXFvXjEKxW24aGvg8xzR0QQ47lLIIEZp4TJGN?=
 =?iso-8859-1?Q?xl0jh2/tDkcOS5sE/O0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?K6hWoTP76894LqB/xRhftcMZEhUIzIae0bqsj3VAOyVdN8yzxOlb76iTPQ?=
 =?iso-8859-1?Q?LzbsM3NgqC84qeaNJNNQaJYo/vXXHjNq9wCznfbDdYbfJBOoY48KTvuNeF?=
 =?iso-8859-1?Q?jHc5Xr7Nb53l1OHlBLH//U+3QtVlNUIy5Cj2Y3UuJ8MPSBkYgvgVT5evo5?=
 =?iso-8859-1?Q?q3fdiaeYVxtyzXVHpjAZtVWRKyJKBL2Ks6lQf2q+1lx1rn5dBQiba7eoJt?=
 =?iso-8859-1?Q?BVP/7jHjGRP13TTyNsMOrms3Opwz2R8wgsTCflLuOt2TGYE0KphrRkFGTq?=
 =?iso-8859-1?Q?caNzE7IgSGuJrmTH0CQstmszNJl0lQ+z1S7iGzk2iEGIv/sjyqFT4G0/tM?=
 =?iso-8859-1?Q?2Yb2SyQAsLWvwmNQaUXXW6SRkYwFW2Ui2U9kSGDx8GFwUueD/ODgYaM3Yx?=
 =?iso-8859-1?Q?t8DNTZgGrqGgxtwCveyf1IUh69MV1gh5hu9HGygTupP3Q+QzuM5tKkvs1Z?=
 =?iso-8859-1?Q?4ynlj9DAlryYQBlZ/a3HF43/tlykTMpgK3Me5mBPNl63/t2FUYnJGZK9zg?=
 =?iso-8859-1?Q?UjHO/jkQL/zAqrHCQKxm8dHVqzvD+6WGGmcZX+kqS8JCtSMRHBOLlNA4UU?=
 =?iso-8859-1?Q?hjY+aMdZPDtGiZdzrWY83K9tDEG2MnaNW4ZNn1JhCU9Zf/gEemELf8jU5f?=
 =?iso-8859-1?Q?bxtrzxPKAqHnMk/ogZJt9gI2EKU+mRexqqjGLtuoublctmCP2a4CS5yHkm?=
 =?iso-8859-1?Q?R6jqGS9LmvTW3dA0cUV8Jp7UMu5gaX5H4FL5tg/mYtZLLAMdB6YzbCKbV1?=
 =?iso-8859-1?Q?Rpvrf77BFnHAyD/m7huZuDTS+fn6aX1xJzpzt0OFZ7HELu/HAJK4zL2u9b?=
 =?iso-8859-1?Q?Hnq3NGPsu9NamsDfJbC04wqntUkV1CykzFFA6yLIxM9YRPny9V2Lo2c0mu?=
 =?iso-8859-1?Q?tIM4WWwBVwHpK0siCEDx6zZFrtWRkkFgT93RWfnPfGk0aCZlhOvRd7D52P?=
 =?iso-8859-1?Q?4d4HquAEzKMI9xg1wEIs8ARobHzter0Ms2/doH0eE7erCQOAoM7go475lS?=
 =?iso-8859-1?Q?RSx1h3hwv7zKzk3OGB0SPhxctkme2ZYCmjI201eJrni59Nz35TU5aHqDEQ?=
 =?iso-8859-1?Q?KhUYPkJ3ofcoKfqoDjbAbXuxpb0AGQe28P0Izjd52YLVPdmnfBObSxWGbH?=
 =?iso-8859-1?Q?yd5H8cCMDncuxHMd8FN7rtykv3DzgJgtJrRA3eljGT0rnj0BT3NxBa+IV0?=
 =?iso-8859-1?Q?zZnetBWygt6V3NUiE3arsshOkLBU13ePY14H/G7ykWfOMQz84iGfJaK+FI?=
 =?iso-8859-1?Q?/UtAZSQA5Jm5hBmEq42hkqP8k4vGU4a8TpLhVur5Xvn0VZ7/SvGGAAP/Lo?=
 =?iso-8859-1?Q?D/SUTjloezvXf48pj7e1Lz0gT5WFImVvJNdO1Y9/NNw1sAGQB+eYBpv74H?=
 =?iso-8859-1?Q?PjnEQ8rxpVdVerN0rwXGeS+KVUpX96YC6nuSkUZk9uZZcFFt/imxsiuZzc?=
 =?iso-8859-1?Q?kTXwEiNesD7VNn+UYgpYtJeAzVFOnJU5sm20EtKXTKXkg0kSGyfxcBZceW?=
 =?iso-8859-1?Q?miQo2zxVOGaCdtT9tla2p6UClWB7KOADwEVOjWsUZsvHXZQ6ja7bWLXoHM?=
 =?iso-8859-1?Q?FuNHveJFsv5XyajN9BtoSS7AL79n6i60Sqg6AXiBV5fS3INqlry/6PL2sr?=
 =?iso-8859-1?Q?AIiAvbfEnV2UAfPhZVvPRh5IEsGgWc/bQFqVjfpzxsITC9K6Tx72y3DU3g?=
 =?iso-8859-1?Q?VMt1r1UyOzmbxoGkDOCeqlnBHP/N+RxXqiG16OkK1EioLDofZpgMmZh6Vy?=
 =?iso-8859-1?Q?oN/7Epz0LczmHZUCAf7x/YOIpLe6vzmSSvKs92pNYe4H03Ak2BcN01Ocls?=
 =?iso-8859-1?Q?MmPOuNUaTgkGI6lTgdQxuLd30kSl8a0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda4a3ec-6969-4f7d-f260-08de62762ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:39.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aazgJq0TTbF/EnamPFW34rY0hS57enu2SGrW5/cIwQlkSvKD0Mbxh3WTPoOWa8whBRP2Cd6An3rY+L6iZOQRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A0FA2CEC74
X-Rspamd-Action: no action

For VLPI to be injected into a guest, it needs to be mapped or moved to
a corresponding VPE first. Add a struct to handle the info about the
VLPI mapping and a flag indicating whether the IRQ is tied to a HW one.

Implement mapping/unmapping of VLPIs to VPEs, also handle moving. Tie
them to emulated MAPTI/MOVI/DISCARD commands.

Add GIC_IRQ_GUEST_FORWARDED IRQ status flag to keep track of which LPIs
are mapped to virtual ones.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             |  14 ++
 xen/arch/arm/gic-v4-its.c             | 292 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_its.h |  20 ++
 xen/arch/arm/include/asm/gic_v4_its.h |  20 ++
 xen/arch/arm/include/asm/vgic.h       |   5 +
 xen/arch/arm/vgic-v3-its.c            |  42 +++-
 6 files changed, 387 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/gic-v4-its.c

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 25c07eb861..25889445f5 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -315,6 +315,20 @@ int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
=20
+int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
+                         uint32_t eventid)
+{
+    uint64_t cmd[4];
+    uint32_t deviceid =3D dev->host_devid;
+
+    cmd[0] =3D GITS_CMD_DISCARD | ((uint64_t)deviceid << 32);
+    cmd[1] =3D (uint64_t)eventid;
+    cmd[2] =3D 0x00;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
new file mode 100644
index 0000000000..9bbd0d96b7
--- /dev/null
+++ b/xen/arch/arm/gic-v4-its.c
@@ -0,0 +1,292 @@
+/*
+ * xen/arch/arm/gic-v4-its.c
+ *
+ * ARM Generic Interrupt Controller support v4 version
+ * based on xen/arch/arm/gic-v3-its.c and kernel GICv4 driver
+ *
+ * Copyright (C) 2023 - ARM Ltd
+ * Penny Zheng <penny.zheng@arm.com>, ARM Ltd ported to Xen
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+#include <asm/gic_v3_defs.h>
+#include <asm/gic_v3_its.h>
+#include <asm/gic_v4_its.h>
+#include <asm/vgic.h>
+
+
+static int its_send_cmd_vsync(struct host_its *its, uint16_t vpeid)
+{
+    uint64_t cmd[4];
+
+    cmd[0] =3D GITS_CMD_VSYNC;
+    cmd[1] =3D (uint64_t)vpeid << 32;
+    cmd[2] =3D 0x00;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
+static int its_send_cmd_vmapti(struct host_its *its, struct its_device *de=
v,
+                               uint32_t eventid)
+{
+    uint64_t cmd[4];
+    uint32_t deviceid =3D dev->host_devid;
+    struct its_vlpi_map *map =3D &dev->event_map.vlpi_maps[eventid];
+    uint16_t vpeid =3D map->vm->vpes[map->vpe_idx]->vpe_id;
+    uint32_t vintid =3D map->vintid;
+    uint32_t db_pintid;
+
+    if ( map->db_enabled )
+        db_pintid =3D map->vm->vpes[map->vpe_idx]->vpe_db_lpi;
+    else
+        db_pintid =3D INVALID_LPI;
+
+    cmd[0] =3D GITS_CMD_VMAPTI | ((uint64_t)deviceid << 32);
+    cmd[1] =3D eventid | ((uint64_t)vpeid << 32);
+    cmd[2] =3D vintid | ((uint64_t)db_pintid << 32);
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
+static bool pirq_is_forwarded_to_vcpu(struct pending_irq *pirq)
+{
+    ASSERT(pirq);
+    return test_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
+}
+
+bool event_is_forwarded_to_vcpu(struct its_device *dev, uint32_t eventid)
+{
+    struct pending_irq *pirq;
+
+    /* No vlpi maps at all ? */
+    if ( !dev->event_map.vlpi_maps)
+        return false;
+
+    pirq =3D dev->event_map.vlpi_maps[eventid].pirq;
+    return pirq_is_forwarded_to_vcpu(pirq);
+}
+
+static int its_send_cmd_vmovi(struct host_its *its, struct its_vlpi_map *m=
ap)
+{
+    uint64_t cmd[4];
+    struct its_device *dev =3D map->dev;
+    uint32_t eventid =3D map->eventid;
+    uint32_t deviceid =3D dev->host_devid;
+    uint16_t vpeid =3D map->vm->vpes[map->vpe_idx]->vpe_id;
+    uint32_t db_pintid;
+
+    if ( map->db_enabled )
+        db_pintid =3D map->vm->vpes[map->vpe_idx]->vpe_db_lpi;
+    else
+        db_pintid =3D INVALID_IRQ;
+
+    cmd[0] =3D GITS_CMD_VMOVI | ((uint64_t)deviceid << 32);
+    cmd[1] =3D eventid | ((uint64_t)vpeid << 32);
+    cmd[2] =3D (map->db_enabled ? 1UL : 0UL) | ((uint64_t)db_pintid << 32)=
;
+    cmd[3] =3D 0x00;
+
+    return its_send_command(its, cmd);
+}
+
+static int gicv4_its_vlpi_map(struct its_vlpi_map *map)
+{
+    struct its_device *dev;
+    struct host_its *its;
+    uint32_t eventid;
+    int ret;
+
+    if ( !map )
+        return -EINVAL;
+    dev =3D map->dev;
+    its =3D map->dev->hw_its;
+    eventid =3D map->eventid;
+
+    spin_lock(&dev->event_map.vlpi_lock);
+
+    if ( !dev->event_map.vm )
+    {
+        struct its_vlpi_map *maps;
+
+        maps =3D xzalloc_array(struct its_vlpi_map, dev->event_map.nr_lpis=
);
+        if ( !maps )
+        {
+            ret =3D -ENOMEM;
+            goto err;
+        }
+
+        dev->event_map.vm =3D map->vm;
+        dev->event_map.vlpi_maps =3D maps;
+    }
+    else if ( dev->event_map.vm !=3D map->vm )
+    {
+        ret =3D -EINVAL;
+        goto err;
+    }
+
+    /* Get our private copy of the mapping information */
+    dev->event_map.vlpi_maps[eventid] =3D *map;
+
+    if ( pirq_is_forwarded_to_vcpu(map->pirq) )
+    {
+        struct its_vlpi_map *old =3D &dev->event_map.vlpi_maps[eventid];
+        uint32_t old_vpeid =3D old->vm->vpes[old->vpe_idx]->vpe_id;
+
+        /* Already mapped, move it around */
+        ret =3D its_send_cmd_vmovi(dev->hw_its, map);
+        if ( ret )
+            goto err;
+
+        /*
+         * ARM spec says that If, after using VMOVI to move an interrupt f=
rom
+         * vPE A to vPE B, software moves the same interrupt again, a VSYN=
C
+         * command must be issued to vPE A between the moves to ensure cor=
rect
+         * behavior.
+         * So each time we issue VMOVI, we VSYNC the old VPE for good meas=
ure.
+         */
+        ret =3D its_send_cmd_vsync(dev->hw_its, old_vpeid);
+    }
+    else
+    {
+        /* Drop the original physical mapping firstly */
+        ret =3D its_send_cmd_discard(its, dev, eventid);
+        if ( ret )
+            goto err;
+
+        /* Then install the virtual one */
+        ret =3D its_send_cmd_vmapti(its, dev, eventid);
+        if ( ret )
+            goto err;
+
+        /* Increment the number of VLPIs */
+        dev->event_map.nr_vlpis++;
+    }
+
+    goto out;
+
+ err:
+    xfree(dev->event_map.vlpi_maps);
+ out:
+    spin_unlock(&dev->event_map.vlpi_lock);
+    return ret;
+}
+int gicv4_its_vlpi_unmap(struct pending_irq *pirq)
+{
+    struct its_vlpi_map *map =3D pirq->vlpi_map;
+    struct its_device *dev =3D map->dev;
+    int ret;
+    uint32_t host_lpi;
+
+    spin_lock(&dev->event_map.vlpi_lock);
+
+    if ( !dev->event_map.vm || !pirq_is_tied_to_hw(pirq) )
+    {
+        ret =3D -EINVAL;
+        goto out;
+    }
+
+    /* Drop the virtual mapping */
+    ret =3D its_send_cmd_discard(dev->hw_its, dev, map->eventid);
+    if ( ret )
+        goto out;
+
+    /* Restore the physical one */
+    clear_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
+    host_lpi =3D dev->host_lpi_blocks[map->eventid / LPI_BLOCK] +
+               (map->eventid % LPI_BLOCK);
+    /* Map every host LPI to host CPU 0 */
+    ret =3D its_send_cmd_mapti(dev->hw_its, dev->host_devid, map->eventid,
+                             host_lpi, 0);
+    if ( ret )
+        goto out;
+
+    lpi_write_config(lpi_data.lpi_property, host_lpi, 0xff, LPI_PROP_ENABL=
ED);
+
+    ret =3D its_inv_lpi(dev->hw_its, dev, map->eventid, 0);
+    if ( ret )
+        goto out;
+
+    xfree(map);
+    /*
+     * Drop the refcount and make the device available again if
+     * this was the last VLPI.
+     */
+    if ( !--dev->event_map.nr_vlpis )
+    {
+        dev->event_map.vm =3D NULL;
+        xfree(dev->event_map.vlpi_maps);
+    }
+
+out:
+    spin_unlock(&dev->event_map.vlpi_lock);
+    return ret;
+}
+
+int gicv4_assign_guest_event(struct domain *d, paddr_t vdoorbell_address,
+                             uint32_t vdevid, uint32_t eventid,
+                             struct pending_irq *pirq)
+
+{
+    int ret =3D ENODEV;
+    struct its_vm *vm =3D d->arch.vgic.its_vm;
+    struct its_vlpi_map *map;
+    struct its_device *dev;
+
+    spin_lock(&d->arch.vgic.its_devices_lock);
+    dev =3D get_its_device(d, vdoorbell_address, vdevid);
+    if ( dev && eventid < dev->eventids )
+    {
+        /* Prepare the vlpi mapping info */
+        map =3D xzalloc(struct its_vlpi_map);
+        if ( !map )
+            goto out;
+        map->vm =3D vm;
+        map->vintid =3D pirq->irq;
+        map->db_enabled =3D true;
+        map->vpe_idx =3D pirq->lpi_vcpu_id;
+        map->properties =3D pirq->lpi_priority |
+                          (test_bit(GIC_IRQ_GUEST_ENABLED, &pirq->status) =
?
+                          LPI_PROP_ENABLED : 0);
+        map->pirq =3D pirq;
+        map->dev =3D dev;
+        map->eventid =3D eventid;
+
+        ret =3D gicv4_its_vlpi_map(map);
+        if ( ret )
+        {
+            xfree(map);
+            goto out;
+        }
+
+        pirq->vlpi_map =3D map;
+    }
+
+ out:
+    spin_unlock(&d->arch.vgic.its_devices_lock);
+    return ret;
+}
+
+int gicv4_its_vlpi_move(struct pending_irq *pirq, struct vcpu *vcpu)
+{
+    struct its_vlpi_map *map =3D pirq->vlpi_map;
+    struct its_device *dev =3D map->dev;
+
+    if ( !dev->event_map.vm || !map )
+        return -EINVAL;
+
+    map->vpe_idx =3D vcpu->vcpu_id;
+    return gicv4_its_vlpi_map(map);
+}
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 9f0ea9ccb1..75c91c0426 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -116,6 +116,9 @@
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
 #define LPI_BLOCK                       32U
=20
+#ifdef CONFIG_GICV4
+#include <asm/gic_v4_its.h>
+#endif
 /*
  * Describes a device which is using the ITS and is used by a guest.
  * Since device IDs are per ITS (in contrast to vLPIs, which are per
@@ -135,6 +138,9 @@ struct its_device {
     uint32_t eventids;                  /* Number of event IDs (MSIs) */
     uint32_t *host_lpi_blocks;          /* Which LPIs are used on the host=
 */
     struct pending_irq *pend_irqs;      /* One struct per event */
+#ifdef CONFIG_GICV4
+    struct event_vlpi_map event_map;
+#endif
 };
=20
 /* data structure for each hardware ITS */
@@ -184,6 +190,8 @@ extern struct __lpi_data lpi_data;
=20
 extern struct list_head host_its_list;
=20
+int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
+                         uint32_t eventid);
 int its_send_cmd_inv(struct host_its *its, uint32_t deviceid, uint32_t eve=
ntid);
 int its_send_cmd_clear(struct host_its *its, uint32_t deviceid, uint32_t e=
ventid);
 int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
@@ -254,6 +262,18 @@ int its_send_command(struct host_its *hw_its, const vo=
id *its_cmd);
=20
 struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
                                   uint32_t vdevid);
+/* GICv4 functions */
+int gicv4_assign_guest_event(struct domain *d, paddr_t vdoorbell_address,
+                             uint32_t vdevid, uint32_t eventid,
+                             struct pending_irq *pirq);
+int gicv4_its_vlpi_move(struct pending_irq *pirq, struct vcpu *vcpu);
+#ifndef CONFIG_GICV4
+#define event_is_forwarded_to_vcpu(dev, eventid) ((void)dev, (void)eventid=
, false)
+#else
+bool event_is_forwarded_to_vcpu(struct its_device *dev, uint32_t eventid);
+void its_vpe_mask_db(struct its_vpe *vpe);
+#endif
+int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
=20
 /* ITS quirks handling. */
 uint64_t gicv3_its_get_cacheability(void);
diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
index f48eae60ad..722247ec60 100644
--- a/xen/arch/arm/include/asm/gic_v4_its.h
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -29,6 +29,26 @@
 #define GITS_CMD_VINVALL                 0x2d
 #define GITS_CMD_INVDB                   0x2e
=20
+/* Describes the mapping of a VLPI */
+struct its_vlpi_map {
+    struct its_vm       *vm;
+    unsigned int        vpe_idx;    /* Index of the VPE */
+    uint32_t            vintid;     /* Virtual LPI number */
+    bool                db_enabled; /* Is the VPE doorbell to be generated=
? */
+    uint8_t             properties;
+    struct pending_irq  *pirq;
+    struct its_device   *dev;
+    uint32_t            eventid;
+};
+
+struct event_vlpi_map {
+    unsigned int            nr_lpis;
+    spinlock_t              vlpi_lock;
+    struct its_vm           *vm;
+    struct its_vlpi_map     *vlpi_maps;
+    unsigned int            nr_vlpis;
+};
+
 #endif
=20
 /*
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 77323b2584..360f8a968e 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -70,6 +70,7 @@ struct pending_irq
      * LPI with the same number in an LR must be from an older LPI, which
      * has been unmapped before.
      *
+     * GIC_IRQ_GUEST_FORWARDED: the IRQ is forwarded to a VCPU(GICv4 only)
      */
 #define GIC_IRQ_GUEST_QUEUED   0
 #define GIC_IRQ_GUEST_ACTIVE   1
@@ -77,6 +78,7 @@ struct pending_irq
 #define GIC_IRQ_GUEST_ENABLED  3
 #define GIC_IRQ_GUEST_MIGRATING   4
 #define GIC_IRQ_GUEST_PRISTINE_LPI  5
+#define GIC_IRQ_GUEST_FORWARDED     6
     unsigned long status;
     struct irq_desc *desc; /* only set if the irq corresponds to a physica=
l irq */
     unsigned int irq;
@@ -95,6 +97,9 @@ struct pending_irq
      * vgic lock is not going to be enough. */
     struct list_head lr_queue;
     bool hw;                    /* Tied to HW IRQ */
+#ifdef CONFIG_GICV4
+    struct its_vlpi_map *vlpi_map;
+#endif
 };
=20
 #define NR_INTERRUPT_PER_RANK   32
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 576e7fd4b0..94f7dd7d90 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -589,6 +589,14 @@ static int its_discard_event(struct virt_its *its,
     if ( vlpi =3D=3D INVALID_LPI )
         return -ENOENT;
=20
+    p =3D gicv3_its_get_event_pending_irq(its->d, its->doorbell_address,
+                                        vdevid, vevid);
+    if ( unlikely(!p) )
+        return -EINVAL;
+
+    if ( pirq_is_tied_to_hw(p) )
+        if ( gicv4_its_vlpi_unmap(p) )
+            return -EINVAL;
     /*
      * TODO: This relies on the VCPU being correct in the ITS tables.
      * This can be fixed by either using a per-IRQ lock or by using
@@ -751,6 +759,27 @@ static int its_handle_mapti(struct virt_its *its, uint=
64_t *cmdptr)
=20
     vgic_init_pending_irq(pirq, intid, gic_is_gicv4());
=20
+    pirq->lpi_vcpu_id =3D vcpu->vcpu_id;
+
+    if ( pirq_is_tied_to_hw(pirq) )
+        /*
+         * If on GICv4, we could let the VLPI being directly injected
+         * to the guest. To achieve that, the VLPI must be mapped using
+         * the VMAPTI command.
+         */
+        if ( gicv4_assign_guest_event(its->d, its->doorbell_address, devid=
,
+                                      eventid, pirq) )
+            goto out_remove_mapping;
+
+    if ( pirq_is_tied_to_hw(pirq) )
+        set_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
+    else
+        /*
+         * Mark this LPI as new, so any older (now unmapped) LPI in any LR
+         * can be easily recognised as such.
+         */
+        set_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &pirq->status);
+
     /*
      * Now read the guest's property table to initialize our cached state.
      * We don't need the VGIC VCPU lock here, because the pending_irq isn'=
t
@@ -761,12 +790,6 @@ static int its_handle_mapti(struct virt_its *its, uint=
64_t *cmdptr)
         goto out_remove_host_entry;
=20
     pirq->lpi_vcpu_id =3D vcpu->vcpu_id;
-    /*
-     * Mark this LPI as new, so any older (now unmapped) LPI in any LR
-     * can be easily recognised as such.
-     */
-    set_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &pirq->status);
-
     /*
      * Now insert the pending_irq into the domain's LPI tree, so that
      * it becomes live.
@@ -824,6 +847,13 @@ static int its_handle_movi(struct virt_its *its, uint6=
4_t *cmdptr)
     if ( unlikely(!p) )
         goto out_unlock;
=20
+    if ( pirq_is_tied_to_hw(p) )
+    {
+        ret =3D gicv4_its_vlpi_move(p, nvcpu);
+        if ( ret )
+            goto out_unlock;
+    }
+
     /*
      * TODO: This relies on the VCPU being correct in the ITS tables.
      * This can be fixed by either using a per-IRQ lock or by using
--=20
2.51.2

