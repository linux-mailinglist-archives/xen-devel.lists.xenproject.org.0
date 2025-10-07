Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15035BC174E
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138789.1474399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67YI-0007RF-K4; Tue, 07 Oct 2025 13:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138789.1474399; Tue, 07 Oct 2025 13:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67YI-0007PB-Gk; Tue, 07 Oct 2025 13:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1138789;
 Tue, 07 Oct 2025 13:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfFB=4Q=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1v67YG-0007P5-Tf
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:16:24 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d244852d-a37f-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 15:16:24 +0200 (CEST)
Received: from DM6PR03MB4764.namprd03.prod.outlook.com (2603:10b6:5:183::31)
 by DS0PR03MB8197.namprd03.prod.outlook.com (2603:10b6:8:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 13:16:20 +0000
Received: from DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7]) by DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:16:20 +0000
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
X-Inumbo-ID: d244852d-a37f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv+oWDOH4z1pFt25XYtfZkxEnklaDdVYH+BJj4k0HfwoxP+McOBZR6oGU3WB71C3sD8nJ4MVsnzC2SXmPjBTRDC4eQUpYuPzfk/4sNKgnM+iRccy7pwUZJbnsc0fQsWPF18JD81zoUE7mUa48ViEzi0AHg49YCLKttHx56PgnHk9KNNX3Vubrrv5RdKV8JcF48kS+x6m/tg7utmWvDCa+x7p4fXziV2gBEqMTSy0iQ4q1M7/H4Wq3WxZRsYyg+UTaxgOOXsgv3j5KbmmKLvE5jcbVZyHh/ouwMtNop9H605Xvl5QMDA7owjBq5NVYRcIMXr8KHeZFxvtQLybV/O3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PLR+3TWsc9fljTZHgroPluxhaljhjk0EsKKP2YITn8=;
 b=Rfaxoc8AA1H/OkjkcQl5+g8NL6XQehPIxriha4hx+xmcIxqndtCTXGq5UOyLNFUEyzyzzKEETl74ibC1rNvqIPcn9ar7mA0f8h83bRXm70F/6GABUmhJjU/EsBbH7Al0JafxpjnF5wJUizb3RnKw639BbEGfiwr5iWsl3dDZg5B1csEroO19nZn1qDjFloFPjI6ih7YsZ3cEP7W3BGx9bAKbL4dMgtJzLdkMcHsoMsHaV566z6TFNRnfLLhYNYVRMwM4gtpcYhmHNsSPU2oFIDNbptoBVQRjKMlvI61PvsI37YxnPIqKxzModuzvqNEVN/uUiNUgLD5du1DNzBamnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PLR+3TWsc9fljTZHgroPluxhaljhjk0EsKKP2YITn8=;
 b=wr+eGtUeguQfFqjCzvvHt2s5n3aNEAD5arGwr4Ggdjjibm7/KlNv56a9eAmgfRQWK0pO4UAoC6kYv8ANKw2DOcLxhK778O2oHGAiclZskww7yYWaQ/Ao2zEcuBgQoZAEulsd+lavDd/2dRCuZmmbekbKeOI96QhITD9o9TfzS/g=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<andrew.cooper@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
Thread-Topic: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
Thread-Index: AQHcN4dg1tiDvez4R0CuSL7Y5RkS0LS2qaxL
Date: Tue, 7 Oct 2025 13:16:20 +0000
Message-ID:
 <DM6PR03MB476422E4A60464CAAE7E0953F0E0A@DM6PR03MB4764.namprd03.prod.outlook.com>
References: <20251007123859.23646-1-frediano.ziglio@citrix.com>
In-Reply-To: <20251007123859.23646-1-frediano.ziglio@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4764:EE_|DS0PR03MB8197:EE_
x-ms-office365-filtering-correlation-id: 14ce2dec-6eaa-4282-37e8-08de05a3b4d9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eP4FeHX3kKeJ7X81zDK7am3Ad/jlOS6Sxi+YRpe7WYllBSLT715e8sjAzj?=
 =?iso-8859-1?Q?TeksFunUFKSLzo4y6A99pUYBRz7SHfiFmCxL1zWMih3eZ1ykTW8hPqS9Ze?=
 =?iso-8859-1?Q?IYYV5QLUFAyXdAbxv8nFUYYUWMFW9tjEAZ6CiPzgEyYhbHB0JAoujHvRF+?=
 =?iso-8859-1?Q?wuPnHR4fxp5esRP0xWnp8YSi/SfB9wAsIAvMM1r2c0ckFn3gu5L5OFSrk9?=
 =?iso-8859-1?Q?tLkgGfpX7IW7UwLHQ2BD3YKZcOjBxbqsmRO267KRu0YaZv3oGD5fcR6Ov+?=
 =?iso-8859-1?Q?xIOLSGS8uCBQX/OrFuiFQ1dzIyTLA1zIppeHHLkkUeeorag6RXbRfxDsJs?=
 =?iso-8859-1?Q?JYvdHcu3qyZk/pUGlRLV34uO7mAv1lmd8yAuRAHE9KTbJvqfKLqxly13Vg?=
 =?iso-8859-1?Q?bV9Bk6MI3A/uzkbmoIv0uel9TWqgHbqTGUN4zeHeL1s6+IFsycNT/huJ1t?=
 =?iso-8859-1?Q?mOFzEhBw3T22qjLM8uWv+o9iAxSonRP071zbvKjzAbfbQhIlMNadKs4jZ0?=
 =?iso-8859-1?Q?Bv/hLIVl+SyV7G/CTBi1wK13JLO/z5ZiDfNgkywOHxRJ4GJoJJD5sDt0NO?=
 =?iso-8859-1?Q?GVxFa0JLg2GGRWUrqwfJ6UT3ayw65beTfAZYjdBoLJalZMx8PdaQfDHfYd?=
 =?iso-8859-1?Q?oMW8PqxV2oTAHH+mPDi36STDLrmfSK3Qn/JAp8+LVI3Rs3rkPqZlPvEbYF?=
 =?iso-8859-1?Q?E2eO8mk07sVqSl4OGfdMZ+VFU76LsaTxJMlJeC9VXFLrKtwd35GD7eZyUy?=
 =?iso-8859-1?Q?ogGsalrs30jIq7/7azdLpopB3SjS2YMYm3KO1Y4pS99RRCEgXN+21CYAhd?=
 =?iso-8859-1?Q?Y/xKC23JPlPrUjYv7IGrBYc4DRJJrrHwDBilCct7Hu8N6s+1rmxsiHNPxl?=
 =?iso-8859-1?Q?vnDzbS7tv9CSXPeOduPRVwKQWQJ6Bm3wpJy7CuWVUNowIiq0uwQcf7s1jj?=
 =?iso-8859-1?Q?OULMBBojQdGk8zOllpm2RojC31GNJEo+A3yptKdCKUVSmRYki9P9Q53uTd?=
 =?iso-8859-1?Q?n8DmkQt7R4Y9nYeDKTZphNfyv0D9B+WETqPZtP+O/bE2lU8WqI2uxfJa7+?=
 =?iso-8859-1?Q?7EWLBuulPuhF3zG0wc0B1sRedQT1gwVYMpAFhs19C8+zWEmgStY3ZXIWK0?=
 =?iso-8859-1?Q?QKbVwVKEa1hqmjHBaT7tHcVjWmRezJhB0REp7MwG3FfRlSk8w+bToU7QNP?=
 =?iso-8859-1?Q?rch4Vtfy/wTBVIB8YTKBDzoG/32pp3t4FqLAQwMm2rsSEzynyWmXqagXKk?=
 =?iso-8859-1?Q?0aSPS020aA3DAA0p9HwXi66YNp6GZOtHyXcNOYH5qxTWx7OeKQPFyp8P6R?=
 =?iso-8859-1?Q?33bV6KOT4RlvHr1lc0O5UDr8I4flpzIL5K9lGh8QdxyDQ1MygyMD1TDt55?=
 =?iso-8859-1?Q?7lU3cZJRYS4S40cO79hU9rBf5R/kH1JgNTgwZusoclZhlExLdynMWltm5D?=
 =?iso-8859-1?Q?+FqQSb46uHVATBPJqGYN8JHK+SU1vLC/gwBPenNNY4EJZPMaJM8iQlG35k?=
 =?iso-8859-1?Q?SC1wA5Jk44XfYJCYls/QX7oELJgGgX60q8Bk7vlASMXl4IOIAzfJRjNwjs?=
 =?iso-8859-1?Q?yhh8anZGD9LAKio8hYUrN2500wEP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4764.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YmjbalIBdklVvOv+usk+/01OIvuOy40ykUK5hORSDs5kiXxbENIuvsk0Iw?=
 =?iso-8859-1?Q?+UXE26/oPD9RL03KZxVEAFS7JMxyFEJGe1o9Nn6Rv4yXUHEO7yOBDDgbEi?=
 =?iso-8859-1?Q?q0Aq0jeIWqRImyEh+LwiX3/bsUMlWR5NXEP5MRY2MlG6f0WDo9Jre25Bo2?=
 =?iso-8859-1?Q?su0Du0BP7168AWTo3xGyIbJjtxQNHLeAI8SZIw7pRET+QP8eUqE3nTGMYC?=
 =?iso-8859-1?Q?yz+ole1Gr74t/RapG0HmhiOThtMC2HvJubOpczwX6Kh5dc4ilteaxE7Cuz?=
 =?iso-8859-1?Q?sugG4zUFCz/PECB6OTYEKFoodLgzlvG0Azr7S2yJ/DUr+k35covZ4T9APE?=
 =?iso-8859-1?Q?WTQNU3AcbaR3DUxAXG53OjTV9smuVHUvrKRkYkj8Ir71BaryRiZ8nQfi5l?=
 =?iso-8859-1?Q?2ekbEfUpMIntvpCVULFnxSB3ALJgq7NMBj6esajmOK6p7O7l9YhmCOuGIH?=
 =?iso-8859-1?Q?XPcWPjPQIzHgIx6MTH9CeU/cIBTibgF8H6SrueuCtXC9NWaIJCYtFSv36B?=
 =?iso-8859-1?Q?pWookPbVXPLPELrmN+ABtniT8L1cCVAGZXURDEnzvWe3pDyA5YaHmdR68X?=
 =?iso-8859-1?Q?hnPU8LFrojDQKQXMo05c8uXY+mqPoB4RtAFRxlM3rF6LeMVmyXeGgJHtq7?=
 =?iso-8859-1?Q?pydz8x5cNdOF4BGwcO+BxeTQZYRE57G0xbjpcSmJ8qYWk1plUYH420ePb9?=
 =?iso-8859-1?Q?mvGItkox2DITfgsvlfAGn6AXkFywmpSjKN92IoTd3gv5G33lbfdQFmug2Q?=
 =?iso-8859-1?Q?pIzw3OLzMUIwVymybSbskxqvkYnSnOXgriihiQrnvxweEE+Ymu+pq/U9x9?=
 =?iso-8859-1?Q?HdbLBmTi0oLzJDNoKMmNWnvBAr77KvIC9HZE77n83AcDJebZg2zmtFmt87?=
 =?iso-8859-1?Q?P8p+uXS0Kx3YmfyxH18S6VSIqn7azC73QaBnVWfIXn/+lWMFRVXnBcbeqT?=
 =?iso-8859-1?Q?FGFRKk3QmT2wMtVKn1PfO25QQzrAasQgZZVrxuxLmX5oH2kpPdpuXjJvLE?=
 =?iso-8859-1?Q?6KT95T32oQZ/nLYTWMvPwJPsiogjLToincvcCznNF3HFtKw0gfikzl9ghA?=
 =?iso-8859-1?Q?njJlPRvA7fKUuNBJg3yVKTzE3AdzPZX4Fdxumf6Aq2MeSfhXLlBVj4x5sf?=
 =?iso-8859-1?Q?UFOb15uNmbCuFu36HSvRpOJG4FqzIBhGi/ZatJnKy/daRAhdwIV+SUA0im?=
 =?iso-8859-1?Q?Dl3mUlE0EfOUn1zi+Crm2i4ON9gef5+/CqIY+13VbKrPlEqfyGxmlKtkYu?=
 =?iso-8859-1?Q?5bfTGydvugxevPJcBsN/bvcN7IPXo2sTBby/+Rr1ep9DutvmXkbhCEWu1G?=
 =?iso-8859-1?Q?Kl0SBnbYqgFu9Nk2ZgwWFXQJRpNEFhB7wItBo6tY9nA2tZqluFnqpsc6sh?=
 =?iso-8859-1?Q?uTH7DNSNA3xyMzxK0KEfwYjij2XAINiZEjO6Y8kwdQZDVkSPklNdx41NbX?=
 =?iso-8859-1?Q?M89tsbqZwB6wEGCljz3TEKDuo9Wptnx2aBd7OlY6dkkqOX1T3lmuQO3SIE?=
 =?iso-8859-1?Q?UGnO0em1At/gVxFoqoLRKWP89dC3LEh8AEU5gaUTRcD4cTikJwchbsqoCX?=
 =?iso-8859-1?Q?mh498lxzV3WEvKGFWF0KHP1O8pDOvJq08K31jBxZ1Sw/N9DXnSVzpr8fv2?=
 =?iso-8859-1?Q?XSAsar9ctJZXps2ORdyisTciaFDYplXwA/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4764.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ce2dec-6eaa-4282-37e8-08de05a3b4d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 13:16:20.4543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0xqNrIF5YbYR+FtLhZhJt2tykGStEGtCKEp1mfrjlVLfYjfYYUf0E/rEdP12UM+6hBmRfacI9g5HtdLCCPjA+taTTWdvC7kmr2QBFxaTM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8197

> Newer compiler can put some constant strings inside constant=0A=
> sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).=0A=
> This causes the produced live patch to not apply when such=0A=
> strings are produced.=0A=
> So treat the constant sections as string ones.=0A=
> =0A=
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
=0A=
Thanks,=0A=
Ross=

