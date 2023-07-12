Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEE7505A7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 13:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562400.879058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXks-0008VB-T8; Wed, 12 Jul 2023 11:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562400.879058; Wed, 12 Jul 2023 11:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXks-0008TD-QK; Wed, 12 Jul 2023 11:11:34 +0000
Received: by outflank-mailman (input) for mailman id 562400;
 Wed, 12 Jul 2023 11:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/dJ=C6=epam.com=prvs=1557cd3329=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qJXks-0008T7-46
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 11:11:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dae9a0aa-20a4-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 13:11:32 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C7KE8Y031295; Wed, 12 Jul 2023 11:09:16 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rs96gtt35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 11:09:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB9PR03MB7417.eurprd03.prod.outlook.com (2603:10a6:10:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 11:09:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::c192:26de:9053:ab05]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::c192:26de:9053:ab05%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:09:12 +0000
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
X-Inumbo-ID: dae9a0aa-20a4-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ2Fs0Re0laEhWB9s13xkRX73E35Ti5MV9Ig2K9fxjaSSTd95sw4lT08dh9OeTuZEBjkrLJ6c/e6R0mfrMfX0ZODrj35JhEAmzHYHsA5m6+QLVbwRtJbUMcsFKagCQ+/aACRbUY0qhtxIjebg6GRww95dY3K0glRihpPgalUgO7wSWOrfCafXO9UfOW/skLTEqzlsOiGkSFHFTQ2cgugmUPyrdgVGurni6yCRB2qdrML0CgDBugo3XLAVRxEa/qhiswh8R55aX8H/WQh7isZ8IkkOevrsztY9bcQ7oKDPnckB+T1F+o0f8Qu6fOeNSaOln63TqKuJzAUpDXAbslSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBQplZJ/bBI+Ds3UBCsq/QIdWwTo2b0qGVSwh7iiGTI=;
 b=G8WTmcXMVOpbO+RZmjtynoIOPWdyLrSf81+TfHFtqE647B3Vxf+S0Kd+tYyheoKHktiLYrkSR4FSozS3uPOqz6D1zPn0LvrPoc0cn5KeQ2GPuIOvxNHqn2GROYmVgQjsy/x4F7mHGWw9H1nCe50u6ak7sKbtwySWklUEDp5nNWM/VoDDHjkMFwD37pdRvRO9aKNn/eYA/WbKCjwJRCRNJQ3jWgBDBd6hK4V2VBmIff36Y7bLt2I7YauFS0Z7JIkoK0G7sfCJsC5zU9dbWltJqPtlxG+ewAuPMjnYyfZrBhibn8otoxUqbX0BObzeHe7gk34ryXjApDIfQUGlTxHwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBQplZJ/bBI+Ds3UBCsq/QIdWwTo2b0qGVSwh7iiGTI=;
 b=M02N2DGSswgWbM2LQjAJrsysz6hZWQA8l4f1LoppgqZmNU7iV1DRWQo2G2/X4jC5+HH6ydZNzFbXD+bH+d3zIpFZDVAIoaohM0Vr8diw+KA3Cx2o9g24gndcj0vQc952gJGvuaCO6wntfpblKiXwR1hd4j0fdGF9c2sZQjSL1pdYmhBfsIdDh1EBYdKSk9gz3ymgR1Sa1wf0gC1u4ULs8bQij2mAbAB2aWaHMSi8qh49TufudrLmAwo02ryqAs2BFZKKylEk+XTTnxZQGI7tGXCe7ssTstthucvi47fsyf08uAq9CtQUP4zd2U5gt7Z5t94sI1O6yirFmsvyPJHsjQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.co>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jun Nakajima
	<jun.nakajima@intel.com>,
        Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] pci: introduce per-domain PCI rwlock
Thread-Topic: [RFC PATCH] pci: introduce per-domain PCI rwlock
Thread-Index: AQHZs5ESsjHhLtlMU0qzCbDGds6cO6+0XLQAgABxyYCAAQ0QAIAAE50A
Date: Wed, 12 Jul 2023 11:09:12 +0000
Message-ID: <87wmz5fktl.fsf@epam.com>
References: <20230711004537.888185-1-volodymyr_babchuk@epam.com>
 <e6ca0ef1-fb66-d923-388f-79cfc20d1626@suse.com> <874jmagulx.fsf@epam.com>
 <c0ba8144-3e3e-1f98-a719-ea03e9f29495@suse.com>
In-Reply-To: <c0ba8144-3e3e-1f98-a719-ea03e9f29495@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB9PR03MB7417:EE_
x-ms-office365-filtering-correlation-id: 01981ee1-4a4c-4357-249a-08db82c86c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qPbB/bPpKmydvFuYjjv4y2D9uPEq8WTpIQdsuDFaSbgQh5najjC3OEICU0XpAxNqBdQWbcrnPoOm3MP4QGPIYsJNii8/NRVbt+kc5KpouIVehdOr48jz8bjm4/ZRQkTEMBaCsB70v6POBoUzhfs59wKnvzMyHgBgOYL7OTCq039pka8WWXFUPV3PHt9qayxMzMXy7iTx5DXnYDTwO91h9y8Z4QceJu030D7l0t9i2RjbMKTz686p+Yy9DtiPZRJDmvoIr0LHwrUqLB0bTXvyeQ+ajx3PmgQC2U0jSUT4NuHvIZQbNyadWX+HJnuszAXiBGXzBAKs1cp1O6br2Ek/Kxo9+XEIaADLPO9rIevAph756ObZ2v3KccfT9dwKCbSl8gxQuLAZlDTCvVgSpbgNAyb5IDqyenfJ55SVGXFsQnfiJO5zR5ZqBWlpDRapSWhlAxovAisp7W5xcKQu1XYVOyNx4fp/SLCccNw5g0Ia2flZ4zjIWm5F9/oe/tA93P2q90MmWJaOufWntTTJmaUBysNtYJ8LkAZbwUNn8BuHLuqDT3JA3PlbCKaMTxC7zuaxNWbGxNQXpv+lBPre1HHdTEgDbsvXv8ilxzORPqz6Azo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(186003)(6506007)(55236004)(26005)(6512007)(966005)(2616005)(5660300002)(4326008)(64756008)(66446008)(83380400001)(8936002)(478600001)(41300700001)(2906002)(66556008)(316002)(66946007)(66476007)(8676002)(7416002)(76116006)(54906003)(91956017)(110136005)(71200400001)(6486002)(36756003)(122000001)(38070700005)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9EjfmWgxVt2qFSwgjM6k0ibPI1LbnOZaU7baqsovhaZq8v77o1WmyjeGf2?=
 =?iso-8859-1?Q?n0dQMd7B+S8K7X/FtCj/vymVx7au0bSneo3DhhmqhkoHlmoCp3YgIT6bQq?=
 =?iso-8859-1?Q?eCWsfctGfzh9ZOvpejba3mpzbJjS8UuhRP/P93tGWMd6/RBYYpzFPECGcR?=
 =?iso-8859-1?Q?4Ksi7RUc6wZEBzxkSW0CHkL4U0FcxmmnaiY9jgw/97WsJE/gehef/uwDVH?=
 =?iso-8859-1?Q?rMO1g6DqmOPMEuG33Z1Ytlj4P062nCTFYrJwtTkRUCr+qUEgkn5ZkIjHP0?=
 =?iso-8859-1?Q?W9Ewg8pvbMseZrKZDLNWBZPpKYuDisRal3gBIIw14t/zSiaVFNnJA8unlP?=
 =?iso-8859-1?Q?kOMoubPhWufI++rwOi7y3l9WK0MV8KL1NiDsxd2sYzfFboMgRdWNx3vjMt?=
 =?iso-8859-1?Q?mB2caGnuElZoGRLX+2XJOYKx2sH5Aih/yMPTWqli21L9PHphdYTTOBIeGc?=
 =?iso-8859-1?Q?JNCRMqmQJAOme8bFw9t+XEyePIdfS0sNcgWoWg+fbAwdjn/ftl0KJpmHPU?=
 =?iso-8859-1?Q?iIsUI1TGEmqOhx8ZMnJNUVErLBp3Tl8jg70AZ5SOZB7l+lPkugxPXBJAhq?=
 =?iso-8859-1?Q?y6znAUOUiwHT2fE4U4UQn602Bgk0APNVRav39to6MDcIRLMz1KVTX32rgO?=
 =?iso-8859-1?Q?tYKMfOCyLJuvaAtbkRq7R8lXvR0cfzxKDfV/LMOVfF+c45W+SgYYM27B+T?=
 =?iso-8859-1?Q?UYp1Or03LbkBz6f0zKX8vDKZcSPbzdGBlWN02oPcW3htI1b1TFmS5Ca4+U?=
 =?iso-8859-1?Q?BVcuQNKtFQfxQPKilS5qIqqym81u1Dvr2YXDkObsboegp7Ojzj2p+6zQuR?=
 =?iso-8859-1?Q?9VrNhSj4u3zxxjlGTPv2Gd1GB/6WOFjXDFswRSPcXBgz3CuJe2FylGq7Ji?=
 =?iso-8859-1?Q?I4vSbObc3mSZhi2TMFZ4UjMZVXiS24/r/yFsNGot/yzAYXmTNlbMt0MZXs?=
 =?iso-8859-1?Q?MICSr8dmTKGE0tsJbQnQJ5QesCQ05R8cPPuMXsl8fLerZEG8sR2x2hq76i?=
 =?iso-8859-1?Q?r9bS2LcAu+Yyk8JZuIgOruDGuDu3fEGdxzquYaC94JP+Wwp92SjhNhlJ14?=
 =?iso-8859-1?Q?fEF5WfZQiDcinPapt/+WbQXttKlUvYE+l+FzvleZ+4weYaD/R/ZWu+Heys?=
 =?iso-8859-1?Q?RJjb8/752va6tClnAb3xEo9SM/GfFOCn2RU3UZsZkrATBbbnTxSZQ+AOcW?=
 =?iso-8859-1?Q?ARsBCSNC5TH/OQ2jOiKnVzc5d/1Up/GshhNEy1Bqc/yE9O7+y8nFAWCZP+?=
 =?iso-8859-1?Q?152OPlMJ05X2gUxN5AX3HC0E+i7Z1H7p2ivVpM98fP+qdBPN4g/MhQS6tq?=
 =?iso-8859-1?Q?NjfoTuwwAGoijHT9QypnqUnGl3gVqNI3Uh9nWNFMG8nuzI1mb+e0B1ktil?=
 =?iso-8859-1?Q?R61sh8x5HIPnTggtbM45cHQ7B5BJf4oJa8gs7WkoWwIExr+fWfP73g8DS4?=
 =?iso-8859-1?Q?ymzQk5CQeRxDbG1Fb2ASrPApMqH0aycSUzte7bKR0aiDLWKb5ICDXknclv?=
 =?iso-8859-1?Q?cOd0zkyk1/kBoSs5UN3xq+axQ1mjfnKc9T6QWFECPVxFSyItGXtLSHze2j?=
 =?iso-8859-1?Q?Rltl3L93k8Apm69p7C9PV38sn7GB+OMUtG/HXWyBJO1sCrZyORnx6iqwoV?=
 =?iso-8859-1?Q?Dgi1xgwtkyWgkC6BD7plm5y1tPpvi5y8psS3clzUpOuFeCiuA9i0H6YA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01981ee1-4a4c-4357-249a-08db82c86c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:09:12.1183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLm3cDQmakp1/GvIZqIkRNhI2AoG5yoO9Vxf6ccQ+RuZUgS4XCe/1loW1+LutmSFfarRS5WM7j5zu/Mj+iSOb2kUEyfowlZ5WGoBR651Xsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7417
X-Proofpoint-GUID: W_uM00fa6kLMe-4WQB9WjR5EblDrgsgf
X-Proofpoint-ORIG-GUID: W_uM00fa6kLMe-4WQB9WjR5EblDrgsgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_06,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=691 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120099


Hi Jan, Roger,

Jan Beulich <jbeulich@suse.com> writes:

> Up front remark: I'm sorry for some possibly unhelpful replies below. I,
> for one, am of the opinion that some of the issues you ask about are to
> be looked into by whoever wants / needs to rework the locking model.
> After all this (likely) is why nobody has dared to make an attempt before
> the need became apparent.

I have no great need desire or need to rework the locking model. I was
perfectly fine with much narrower vpci_lock. As you remember, it is
Roger who suggested to extend this lock to the include the whole PCI
device.

I already tried something like this as part of the another patch series:
"[RFC,01/10] xen: pci: add per-domain pci list lock" [1], with the same
result: it was considered very hard to do this properly, so I dropped
that effort. I am not so familiar with x86-specific code as a whole and
IOMMU drivers in particular to be 100% sure that I am doing correct
changes. Without support from x86 guys I can't do proper patches and
looks like x86 guys are not interested in this. So, this is dead end.

Roger, in [2] I proposed another approach to fix ABBA in modify_bars():
store copy of BARs in the domain structure. Taking into account that my
effort to introduce d->pci_lock basically failed (again), I am proposing
to return back to d->vpci_lock + BARs shadow copy in the domain
struct. What do you think? And you, Jan?

[1] https://lore.kernel.org/all/20220831141040.13231-2-volodymyr_babchuk@ep=
am.com/
[2] https://lore.kernel.org/all/87ilbfnqmo.fsf@epam.com/

--=20
WBR, Volodymyr=

