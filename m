Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D84D19DF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286936.486656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaMN-0002yo-4h; Tue, 08 Mar 2022 13:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286936.486656; Tue, 08 Mar 2022 13:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaMN-0002wy-0w; Tue, 08 Mar 2022 13:58:43 +0000
Received: by outflank-mailman (input) for mailman id 286936;
 Tue, 08 Mar 2022 13:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRaML-0002wq-Hf
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:58:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabbf8e2-9ee7-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:58:40 +0100 (CET)
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
X-Inumbo-ID: dabbf8e2-9ee7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747919;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rt4cfDzFZOTotWlyXZ/PSOSbZJ7CHVK/cdU8lYt+EDk=;
  b=Rn9AupEEzG1kuWXaB5/jcnPOboOh8cQMe6h1z65F2E599AdRNR5KvMlv
   OLfYXtp90LpassrlzF1hAnNRs+JRopdO1hlQpJ2CMVIV1fMgAQQ2RdiTu
   kV64OfK80PYlTmJPg/e+nNo9OAO9cHGV58JwZbEhfLUvWYhHTmDlt4ml4
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65184025
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ygRppqALUGhFzBVW/x/jw5YqxClBgxIJ4kV8jS/XYbTApG4n0jNUy
 TcZUG2FaaqKZGXze90kPdm0pE9TvcDVzIQwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhgx
 olqlbKSYjsDO73RuekNEFp9MCFhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K9LweocWtXx60jjdCd4tQIzZQrWM7thdtNs1rp4TRKaCP
 5BEAdZpRD+dXi1jO3EoM6kBhs2HiifmST4GhF3A8MLb5ECMlVcsgdABKuH9dtuHT8hRtk+dr
 3DB+SL1D3kyNsGbyDeD2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+S0ot6E+slOqStrVWAexq3qJ+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeVDJ28
 X+nvfjVLzl/rZyYWTHe05SUsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2/0/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nQzERho81XRdlFAspp1hWG2TaD+LF7q1yQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd7vVZt6kPO5RYm+PhwxUjaoSsIqHONg1HsyDXN8Iki3yBR8+U3BE
 c3znTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMD15W6+Ln+J7INANcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:0ABvraup2mfrqcYLavuqsHBJ7skCI4Aji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKdkrNhQYtKOzOW91dATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj3Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSnGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZizU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUgZ1TChkF3nAic0idurD
 D+mWZlAy210QKXQoiBm2qu5+An6kdp15at8y7AvZKpm72HeNtzMbs+uWseSGqD16NohqAN7I
 tQw2yWu4BLAR73lDnh79LIUx1si3yvrWA5kegVuXxTOLFuGYN5vMgR+lhYH4wHGz+/4Ic7EP
 N2BMWZ//pOd0iGBkqp9VWH7ebcF0jbJC32CnTqe/blpwR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKNZKPHHR1DlUFbJKiafMF7nHKYINzbErIP2+qw84KWvdIYTxJU/lZ
 zdWBdTtHI0eUjpFcqStac7uCzlUSG4R3Dg28te7592tvn1Q6fqKzSKTBQ0n86ps5wkc7vmsj
 aISeVr6tPYXBnT8Nxyrn7DsrFpWAwjbPE=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65184025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR7sFJv24yNtktPfuvEazCO+rmEdsLV82qpb2tF+24ayxHQb4TRCAE5UMhQ4/1VUSnTK9hsiyttkj0sB4X+wiFsnqf6mPdMXnWI8Fo64u//pLb2jaH50Q3EUu5m2JdHrCWA9EWW0PHTF65b0uoO++YYl9+uY9F/rR2zyiGGfvKZXeEhM72BqlyslLUgYneKtKWyobFYkDcSqPJLq3SsTDK7KpT/L2UnvGnlrapnIkJbPgUiRRo17wYpqxnThK0bo3U0WCKKCULFZHG0wHlvtAB8LILXLr5vdzk+czfEfYufsFU7I6yB2N4RRM0NXFdw0tmnRFUHC6qCmekOW8DBMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RFB/hQOeq43eBGNj1oRyYEhU1QdoQPtPJmfJi5cujY=;
 b=UgDlvEg31PtmrrSAenUoo85q3EPETs7lxzcxieRR4JaNqKH1n1nt7T2Wt2172u33JM5QGZCBNmgKXuojEVFg0qsExE9EYxoI6uno8zGmoT1D6+2Mk++w525lmLafewH6veJXLW+fyYzOkc+konZxob2SECQmLl0hHDeZN45M0ZdbdIHOGOLBkXNPA4ugxdHxJsVwV66muyUEU7gyUZJt2swU8YClNOCBHLmrBwojKGci59tRfShQtfhm1OTdNmSKC4zKvMqwVV9FuPeV3MNqgo9x97Yh40IEPyj0eB342HJLoj7ozlWGnvrsbCJ4TIy7wiBsT6egmHYHCgCBp9kNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RFB/hQOeq43eBGNj1oRyYEhU1QdoQPtPJmfJi5cujY=;
 b=HbjwlGo3+fKxkFLhKDDcURX7IKvfQu7U0m5SIytr0qVdeHu0j8jIkO5CcYV+LWcrVtN+Tyc9XLjB7Bwp1AWRcKRHwpvRQRn3qwOWPsBQ7c6jQ4C1TSCMZbljT8mTvntiDiHaVsNzz8aTG7dFjvjJaiOMQNUxEHrW7rJaX1tUwSo=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "doebel@amazon.de"
	<doebel@amazon.de>, "julien@xen.org" <julien@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Topic: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Index: AQHYLkHgkh5BrSNp6k2TMCqk/XJtv6y1jGEP
Date: Tue, 8 Mar 2022 13:58:35 +0000
Message-ID: <PH0PR03MB63828DD5A6099B904EAE92C5F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-5-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: a10ab13c-f866-b434-0101-d97a06c34bf6
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c788fe2-1184-40b7-44af-08da010bbd16
x-ms-traffictypediagnostic: DM4PR03MB6973:EE_
x-microsoft-antispam-prvs: <DM4PR03MB6973594AEB4E4DDD47160A4BF0099@DM4PR03MB6973.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uuurMElCQBVMLIcoJVhTs3PLLWdfqkDwJa0iwp+6ESiohPizQml65isQM4S8/GRChigite4/Vjh2yR+C+gOFpQOfA58PtLkUfY4K+KTHdJu2KpZjy4DptmKmlqnpMDLiXJFAe51Uwf4YMO47/MqpUShOAaTCF6xB2VNUdc38p0Uvi38E0fGKr3W8yCO8AIXewssfKFO0PZvSEBlOv3RK5xCTvjjx9bIE9TYgaYLfHOZQzYTDm8JTyDcKy3/0rZqtOk8vc8liqVWgeEnP8KbykiAvYGI2vH3DLY6d/DjUmYZwxF4+fd9/MT611Sd8gV2Mf0wfizaR0l3cdUePu00msBWEfQ5OxAxFzh/5eS7CRzK4CtBWZm5HIqmcDNkF6VNTXpz6qbH40vKfBw1wtEUoI5M22GQfadaVmmkNHr16JyjYKeA7g2NHD0GM5kpgilHKYmfqsZIKvUEEMiaSErZ5GU1o6WBycovYxiKT35kogPmaQe2jQp7W1UPqXs4vqE2LqGrksMFsVXhEfQB7SzAtP53N8mF/F7gQUq4ZLWEWHjZ6eDR+6f64nQ/hV3hm2HdLTJYgY7sQaPg0DUJCY4i96Uk1I3xJ4MMhJZxdjSLoe7WQWbfOA4dRpPz8vMbf22ftGEQnFcxif8X6SJQbu2XB4PibeO/ne0K2cMA2yOrsb3g/dzUrwKwZdhGmH3v8z+bXV+tFDSJETr2/4t1Il/4upA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(82960400001)(5660300002)(66446008)(66556008)(64756008)(186003)(38070700005)(107886003)(86362001)(83380400001)(2906002)(4326008)(8676002)(91956017)(76116006)(66476007)(71200400001)(66946007)(316002)(110136005)(9686003)(6506007)(53546011)(8936002)(54906003)(38100700002)(44832011)(52536014)(33656002)(122000001)(7696005)(508600001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YremvfiWAqPJLxvUtQpsi9pnktr3ieHQodzzdsbb97jZzcL2tk4O8d6mqY?=
 =?iso-8859-1?Q?kplSG98fArNHJVx2y3y1Zy1jxSntywUwKGOWHnks9RYlTeY8J1PRpqn77t?=
 =?iso-8859-1?Q?Z0WFd5kcDUWYX3L4km6q/sNhi8jpf+ujYTO7hb9POrm8K2Gx99OXFevwY1?=
 =?iso-8859-1?Q?Qzd+FFOhns/2HsY7dEkBtK0H8WDO8+lHD5z3w4hsR6T1i7BnOktUZUGMJe?=
 =?iso-8859-1?Q?ZN3LnJUJcd8edbMrdmA21voVkXXVePQFGpfthZRMvFbMPtpcV56+PLEf9v?=
 =?iso-8859-1?Q?gvF90SKV5+LWOpuXJBai691EdvTnelYv8PsZ2davSDr4t+jACCzeqDUznh?=
 =?iso-8859-1?Q?TICbk/tnJvUV8FttV2ZGOFA0BzNMkNzXzqsKnkFUGsRo9MeqRLvaGROQyV?=
 =?iso-8859-1?Q?hhV4DfPvgMjOZkWACg2uAVF9h3EAVoLnvvTGsqzoBWLFdY3vhz89d65qET?=
 =?iso-8859-1?Q?ZPy0mtKzo8Dk16ujncWqc916GLhuizU1Rbv7WMGa6XRQDT+q32XS77DHIF?=
 =?iso-8859-1?Q?I6X1JTm7IVrDcRQs/Fcly3AogbVIz4ykGo5W9LcfpDteuc9202PFk2/I6P?=
 =?iso-8859-1?Q?aA98GDP6m0i28dpHbydRzNoqAOaWr2b8bWNmMQ5c/D1Y/WDgC/9kARrfta?=
 =?iso-8859-1?Q?x6Xa7Ohc4k7CRq1A8RDAcHB8bIGP50j40AItRSXulpQBPPX9JpWmkRvv/8?=
 =?iso-8859-1?Q?WueRf8qCiSWcDgqMCAzXM8/cgr/Rga4B4pwJIPdsNyTaFo6pOSYAiipL1c?=
 =?iso-8859-1?Q?qbBwjZfY+aLTtQdTNQVn/70kKeAxq4b2e0+tCOvxchjHOREo2/a6OHei5b?=
 =?iso-8859-1?Q?+5X0UAI1ZICoL4D5gQ/et7UeKmJ5DUDqlLFva7k6Sio7DF1ps9gPTUvmW0?=
 =?iso-8859-1?Q?VgGJN6vC8ea8WoDMvPiMhrCc+D5Sgu3aYSTB1nS9+gz6yGDQlH5yg0PgmI?=
 =?iso-8859-1?Q?5vpKjusVUl59Zq/o1ECdkGlA2tgCDIiIPkViq+619Po1lU12aSoYwnk9j1?=
 =?iso-8859-1?Q?/4qH20l+YWk6IdTus3+CEDPfWgyH4U9xm0G3yUdrwsE7YReynICPz+invq?=
 =?iso-8859-1?Q?aXw+e9woYVGgAGotDVqtXHWI+DXRkO92fGCIirVYWMrVbztX5dugiV5U9J?=
 =?iso-8859-1?Q?P6RDRUuK/wnZov+k0ZMsCVJg3PYd3TxBGvGLeOg+M0VzLEpSlVB3DlvHUs?=
 =?iso-8859-1?Q?LwM8577YhAVnJ1Xc16crf2RsLNPekfD12XqRqx+Fm+6w0h5o1NEsaoxoL8?=
 =?iso-8859-1?Q?E+BQGsIBl/YGBm0KM2mhMW6XyrUVLcrY+2ybVlxLkPU07ipk0VTXY64ZDU?=
 =?iso-8859-1?Q?zwj7tslVsvs8O0ozX43SX7HFTEaVG99YJ0I1yk5oNxuNYnRyyKk/T/xEqg?=
 =?iso-8859-1?Q?b6w52nb6mPKRNpshvcXb3Le+0N0C3cFLiU/BioRITGHgzFm0qNzuJR8gn+?=
 =?iso-8859-1?Q?aNktl2NkWo3F/2s6D4H5uyhObf9cR9Vly4rR/OSrHeTQrmtOPlsftmJVRu?=
 =?iso-8859-1?Q?v/TdY6IWruUcFZzhaXFTY+6OcEwOkBUvgDSdcDcoGnSS0q54GfOtym5YmF?=
 =?iso-8859-1?Q?8oK1PskdrGQ7ftuVhOwc/+vcYohTrlVMFa9OYe0Z0OuWQi6kllAATQrjnG?=
 =?iso-8859-1?Q?fQNvPPkMVVkjIg2eKg9soJb2fBCVa2iYtACeCUepow6r4F/bUk1PTeVtp9?=
 =?iso-8859-1?Q?Hxe6pZbZTbC4df+iXd7UIVzHR24RPP2nj4MZoYTs7QTVkrBxzb2GPWqu84?=
 =?iso-8859-1?Q?NkaA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c788fe2-1184-40b7-44af-08da010bbd16
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 13:58:35.3874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1aqgXYhiYPz1jCDrYxVIlauz+vQoqbrZ2zazBw2AgQe4Dbo2vQeDaRFSPCadSOS7fL4JB0TRlLOu/OLx4NweYshvJce2zWMERnVa68XvnJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6973
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Wednesday, March 2, 2022 2:27 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>; konrad.wilk@oracle.com <k=
onrad.wilk@oracle.com>; doebel@amazon.de <doebel@amazon.de>; julien@xen.org=
 <julien@xen.org>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Roger Pau Mon=
ne <roger.pau@citrix.com>=0A=
> Subject: [PATCH 4/4] livepatch: differentiate between old and new build s=
ystems =0A=
>  =0A=
> Do not attempt to modify the build system if CFLAGS are not set in=0A=
> Rules.mk, and instead rely on CONFIG_LIVEPATCH already setting=0A=
> -f{function,data}-sections.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> ---=0A=
> This depends on getting the patch to add -f{function,data}-sections=0A=
> when using CONFIG_LIVEPATCH accepted.=0A=
> ---=0A=
>  livepatch-build | 22 ++++++++++++++--------=0A=
>  1 file changed, 14 insertions(+), 8 deletions(-)=0A=
> =0A=
> diff --git a/livepatch-build b/livepatch-build=0A=
> index 38a92be..656cdac 100755=0A=
> --- a/livepatch-build=0A=
> +++ b/livepatch-build=0A=
> @@ -98,14 +98,20 @@ function build_special()=0A=
>  =0A=
>      # Build with special GCC flags=0A=
>      cd "${SRCDIR}/xen" || die=0A=
> -    sed -i 's/CFLAGS +=3D -nostdinc/CFLAGS +=3D -nostdinc -ffunction-sec=
tions -fdata-sections/' Rules.mk=0A=
> -    cp -p arch/x86/Makefile arch/x86/Makefile.bak=0A=
> -    sed -i 's/--section-alignment=3D0x200000/--section-alignment=3D0x100=
0/' arch/x86/Makefile=0A=
> -    # Restore timestamps to prevent spurious rebuilding=0A=
> -    touch --reference=3Darch/x86/Makefile.bak arch/x86/Makefile=0A=
> -    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" |=
| die=0A=
> -    sed -i 's/CFLAGS +=3D -nostdinc -ffunction-sections -fdata-sections/=
CFLAGS +=3D -nostdinc/' Rules.mk=0A=
> -    mv -f arch/x86/Makefile.bak arch/x86/Makefile=0A=
> +    if grep -q 'nostdinc' Rules.mk; then=0A=
> +         # Support for old build system, attempt to set -f{function,data=
}-sections and rebuild=0A=
> +        sed -i 's/CFLAGS +=3D -nostdinc/CFLAGS +=3D -nostdinc -ffunction=
-sections -fdata-sections/' Rules.mk=0A=
> +        cp -p arch/x86/Makefile arch/x86/Makefile.bak=0A=
> +        sed -i 's/--section-alignment=3D0x200000/--section-alignment=3D0=
x1000/' arch/x86/Makefile=0A=
> +        # Restore timestamps to prevent spurious rebuilding=0A=
> +        touch --reference=3Darch/x86/Makefile.bak arch/x86/Makefile=0A=
> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.lo=
g" || die=0A=
> +        sed -i 's/CFLAGS +=3D -nostdinc -ffunction-sections -fdata-secti=
ons/CFLAGS +=3D -nostdinc/' Rules.mk=0A=
> +        mv -f arch/x86/Makefile.bak arch/x86/Makefile=0A=
> +    else=0A=
> +        # -f{function,data}-sections set by CONFIG_LIVEPATCH=0A=
> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.lo=
g" || die=0A=
> +    fi=0A=
>  =0A=
>      unset LIVEPATCH_BUILD_DIR=0A=
>      unset LIVEPATCH_CAPTURE_DIR=0A=
> -- =0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

