Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E92443F6A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220666.382019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCbW-0001Jv-UW; Wed, 03 Nov 2021 09:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220666.382019; Wed, 03 Nov 2021 09:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCbW-0001HR-RE; Wed, 03 Nov 2021 09:30:46 +0000
Received: by outflank-mailman (input) for mailman id 220666;
 Wed, 03 Nov 2021 09:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miCbU-0001HL-QC
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:30:44 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b77c083e-3c88-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 09:30:43 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A38Q4Cv029445;
 Wed, 3 Nov 2021 09:30:34 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3pwng8q6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 09:30:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5699.eurprd03.prod.outlook.com (2603:10a6:208:173::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 09:30:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 09:30:29 +0000
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
X-Inumbo-ID: b77c083e-3c88-11ec-8563-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxUdzAF2r4BXVul45o0g7C1lmBr3p7/8fYSFRZhzGtDmfhuK8e9Q6ujM4P5MypsLm0sJ9aXJyqdapqZjAAgA4RqE8/xfVnYmC51+nKr4QmH1vXURcoO2zYeSuUf7wzXVed/8kPwR9ITpAotHBH1llHM5NBXNyoWgCPewnIObH8fGx3nSwiWxAFIsdHrZykYk1y32AM+abEkxYZQxd+gV1YCJlWgWGoKmGn+/I9xyHJETDAt+oTAiFftGiR1M1Sl5wo+LwDHaGNtx0m6309juB8dl2Fl0PHSIeHos3bkEbmmRObuUI/epprgMfmPubls4biZdLdavWj9C6unxywHkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6GZz0SXOiQaYIxnn8YWDRzaWdGtZJYLZ7DtPoHh26E=;
 b=QN6dPXxx/dHM/7W+cniIiILWW+Sy/LLRV0yR6Q0SL//0nC/x/y1vfbo9wIJhIS/qxDcyeiQiWA4F+M/UzM3/Kx0M/EeME2t6i5AXpVBl5unDOgxVdjobVrfXTbJjHVBJcjwa1l2K4k+0lumfIxE+Ur2y4tgv0XqcDH6tFrofMhKO2pd5oVWXNUtKc+FvYplwTKdDyMx1y6aom9FmFX6mpLECzfTsTenmfLsD3t7jPXyoFbEtmbsY95rJo0Vz6Om4aV/5cyFZuIwTl79I996RZ3gj3WNnDKIFt1i5JfTaOc2JIwMCNCbQXTlRG+jMlDlGXwoTZy6PMgWeOEZfvCaVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6GZz0SXOiQaYIxnn8YWDRzaWdGtZJYLZ7DtPoHh26E=;
 b=mw1fn5+CKN9FTALohCW7rYiq3HWBICWWCN5vYgdh5f/NDmlwDCDQ7z5pKw+QZR7qU/3NKh/E8sLx4Xi59ismwgITSLupS+Q7jbn6b+yzWj97Gku9M9ARSH6paladMYjjQf6BNyplyp3BIYBNQhsfkqrigKhqJn+9XYkECFk31+PQU+cA/zz3ExSgrCB/K4nJVzVzTbzCybh44B5jKQ+AYbMYhy1ssbWG/kndGbhAbkMZ2qXNg37GsEsyv1N+yrIh6cdza9zLO+uEoGduvoJ32GNS+abF94V2RMF5YV8ecRN/5DcndteWxz+7gxc9nch7dF2Cu92DAC2/H+hCRUwyXA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAHkAIAAAZSA
Date: Wed, 3 Nov 2021 09:30:29 +0000
Message-ID: <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
In-Reply-To: <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e5fcba1-29d1-4664-58e7-08d99eac934f
x-ms-traffictypediagnostic: AM0PR03MB5699:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5699679D095EFC2F2B83360EE78C9@AM0PR03MB5699.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4nKLOF/ZRePL1fetXHoojKRaT68Sx00ZM+LE/FwSNIPhB+GIzOlEhy4Sy6Oo29dBBZmWPIHbetJuFONSI3dvA+cBGq3TMq98/N+xdZt2ZMe42k6+SDrcx+6OmDRzVHwo9q8z1SU/TA+7tvhPexnElGAkYDztMKrhCi8wR6hmyTUtlX1gc4qYxk0dxHx9lSiXwVBQlSSVXW5ismQUS3suIFn22cIkEizOGc7Un5TcUaGB1LwqNf8qRESZHQ63HupFDnWYLqOvtOh4Y7DJM2QO1YkUB2g/01EYBfDl51JPmf+L3LcQPP6jHdPpvYXswJGnE+PHUNmzVKPf4blYiIez6IZ20lJk4g6f/vGAXibhTApZkrOzKss9bKoUCKn0lxeneuJ4OOnOURUGjajNM8YOgpSbeiRINIJdje19dg4l6cZzbufUZTN+kMRn/Fi7pU3X4rIMW9WzX2GAyd/ogmHUEYrTwvZINGaJVJAxyCjV0RG1NWLrfMZLXMiUMLYtHIuSgES3HS4CTQ+sTgVItX4m3aTuO1ovax8bYDtbgXk8KRHt1Ecx8ZPTqWjZW0P7FNPH4T/wUmT6OhO4pEfz7oQMeqnpU/kyeCr0jqW0Gjb0s9rD/aZ4TxRGIADbSPlKZuYe0D18bgMq4K39Aacx9uwBXLHC3OXHPfOWl9EJnd/kfbPX6uyhzZepmkYllxZxT/QGD+mgXehAnywOJPrvxoIM4dgGLMnZ4UWtl0VI0sXGbeYqWLHsR54j4oDKIKPTJ9sy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(110136005)(54906003)(53546011)(6506007)(2906002)(38070700005)(508600001)(64756008)(76116006)(66476007)(66946007)(66556008)(66446008)(2616005)(26005)(5660300002)(186003)(4326008)(83380400001)(86362001)(38100700002)(122000001)(31696002)(36756003)(31686004)(91956017)(8676002)(8936002)(6486002)(71200400001)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WU0yS3ZBQWo5Z1RNei9sbUtCSVFvTXdwUW1YeU00clU1UHNnWDFkSlJsTW0z?=
 =?utf-8?B?OFVXQTljMEVxR3NIZ1o1cXRVSTdXelkycjJhUW1TT0dXUEFyUk5TWGpNV0kz?=
 =?utf-8?B?Mk02V2JIbmZOcHZnbU5mS2VvYUpCckxhWUhZeWRlMWVHMCtNd3VDL29OZWV4?=
 =?utf-8?B?bS9LZlNFS2pCRmdCUG93YzZYSU9YOVlZVzNMY0pPczR2OVJqcDJMRVVnalFI?=
 =?utf-8?B?bkJ5TWI4b0FvcWdZNFROSWNmc2gzZTN6cTdaK0NpcGtBV04ybnRKK0x1c0lq?=
 =?utf-8?B?RmQrUU9zUDZHYmtUS04xT1lMNmpTNFZoZzhpaGRqNzREbHJUREd0MkNtVTc3?=
 =?utf-8?B?Y2RIOGN4c1BzN2l0VDRBVjU1dWZ6RmtoZHFNZFJTbDdjWjFoTGc3cWowczYv?=
 =?utf-8?B?U3pPQmxZVi9TWFhYL3JvWlZXa1Z6ZEJtV0dReVhGVVlwQlVlM2NVLzg1ZVZx?=
 =?utf-8?B?SHZLMWRNSkxWcGYrVWhrcU1wbVhEUUFSa3ZZc0lUKzE3RTRFbnlsaU5IckhV?=
 =?utf-8?B?MkNSYnpJcFk4Qy85eXA5ZTVmcHRsdnhxNFNqZ3FPck9KUG91QkQ0bUxmcHE1?=
 =?utf-8?B?SWljcHlsR1dTUkV6SHM0OXBPYkhYZ204Rk1SS3JBWC9ZTGVHWis3RHZ5SUxY?=
 =?utf-8?B?K012dUo5SEt2dVNpUEN0Qk4xRmduS09vejU4OFFMSldtdUtaN3hGZng0V0k3?=
 =?utf-8?B?VXh1aHBOam9QVXJGZ0RURktvZWlxYlR4c1RpbUJ5b2k3ZHpMZVdGZ1NKdXdJ?=
 =?utf-8?B?cGtyWlFFODl5cnR0aUo5c2JHYXZ5eFRvQzBxTGFwQnRZRWxxaksvSWc1MnZM?=
 =?utf-8?B?cjVTNjdkbEZKVFdoSVNqQUxTWWZDa282bFBlZ3BiMHg1TklqRTNyLzVWMUhm?=
 =?utf-8?B?VW9JQ1FSOG1veWhNbCs3TXh1MFU5Y2FWYS9ZUlMwTFpnZTVQSTdLcURuYjdr?=
 =?utf-8?B?WGVzN2xXY3hQblc1ZEZFVGdIVzFPK2tETmUxWlRxSVBSREJQOGhaanF0cEpu?=
 =?utf-8?B?alJjdkhQSTlVaFZsbDByS3hNVWUxbmhzM2hWdHR6S292dWFLNktNbjdFbzFh?=
 =?utf-8?B?b3h2Mm1uTUluUVRpOG1UTjRZTjQ2QTNab2FYVzdvM0x5TzJDMlFpaUdtZ3ho?=
 =?utf-8?B?NWxwTjVPM3AzK2RmclRUR3RzS1JCeEFrUlJqZEtERitIOUtJZ2ltVDhCMWJw?=
 =?utf-8?B?cHIxbDQyQ2sxcjY5eHp2V1l3N1I0VDkzS25JN0doeFJGVVE3V2lHYksyRXRR?=
 =?utf-8?B?azluQmJIeXQxcWNWWkluVktKZDFoZkVYK3ZBL0lXWldDUWN4NldRc0gram01?=
 =?utf-8?B?TFBpUmk1R0hHdS96WE5qa3o0RE9OczlDY1hoMzlwS3B3R1dobzV1c1V3SCtB?=
 =?utf-8?B?akpOZW9kTjlYZnFCMzlmR2tXMitEcTN3M1RIekxKeDhBaE1ISnUwQ1hZSHFs?=
 =?utf-8?B?NHFLZnVlQjVGWVlncXdPTHZZNXR5aEtiYzhvbmszMy9BVWJ5bEVMM2VNS1F0?=
 =?utf-8?B?QnI2a2NvanN0dXZFVkZkZ0Y4WXMvNUlxSzZJVllYcVZPZGI2OEJjUXdZQnJK?=
 =?utf-8?B?TGlkUjFoYmpFdFhCRUVKY1pIV3NabDRFVS96WklxR0pvMEtmemptZnQxYy9o?=
 =?utf-8?B?RW1nNnVBZGh5MEZ1MUJYanFSM1J5V0p2UjQyYUgxTDREeXZHZkU0YmlkNTBT?=
 =?utf-8?B?ZVFhK3FHZlpLbzErcmdRMnY4NW5rQ2JlcXQxcGE1b1oyWUFVV1NxRjFndncw?=
 =?utf-8?B?c0xkVWlwdElEaDRjMll3Q0ZGdUdrb01Hdmo4dzV0ODBGSHJxWENhRUVJdzZ6?=
 =?utf-8?B?MkJrR1ZkOHNjRTNZcjh6TjQzbWNzbVpRSTlpRkM2cnlDWm9RSFdaRFdjQk1T?=
 =?utf-8?B?TlNJK3ZtN2lzYmx6TW5paTRhMldxenBmVEs5Zi82b25XSktyZnBWMnJObjZn?=
 =?utf-8?B?Q09rRFJTa2NOWnNXQVE1dFU2Z1ZUeFZnSjVKaDVFV2hLV0ZiNmYyb1k1dWpt?=
 =?utf-8?B?TENJZ2hCQWFxcEZrNlFPWkxIY2FiTnpqK3ByNS9MdzYxTFAwU21uRkhzcGt4?=
 =?utf-8?B?cFRWQkMxdjlQa21IblZEbEFkT25XczVoejQ3Rzl3Y0JkclpwTkNGVGY1YXgw?=
 =?utf-8?B?Y0pCZVJNNWx3SmRsNnd6NHZoaGJGQWd1MVp2d2t1SEZkUXgwTnFvYzNYU1RU?=
 =?utf-8?B?OVVGUW1SdHdoamtlR2dxbjcvcC92bDFidFIvb0E2MklBSHZicWZId2RRMUdB?=
 =?utf-8?B?K3BFbHBpMFZ3dVpsQktNMlR2Q1BaRXQxWTVFQzB2VlZlUmxPcSt0dWllRHM4?=
 =?utf-8?B?QnZkd0U4NWt6SUpEekRSUloyb25aNXlXZW9Vbm5oTGJwcDlEbDk4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0327075872F5C44CB442426DCB4A24BB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5fcba1-29d1-4664-58e7-08d99eac934f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 09:30:29.0987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myqE8pqkfrMwf8DDn1JsXoEW39Nu+/peNFQOaFj4NkVGpu/SdP/m1cy1B3Y0pq+yfDuKfsCAOHlTMHF0HBsQFyDGgPIM0Sey2GkWAPdM3X4K8D5AFSyMNrYpDA60WGCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5699
X-Proofpoint-ORIG-GUID: 7Tzn7FbViR1n-MQteWj8pv0ZiczCTIyx
X-Proofpoint-GUID: 7Tzn7FbViR1n-MQteWj8pv0ZiczCTIyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=740 malwarescore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030054

DQoNCk9uIDAzLjExLjIxIDExOjI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMTEuMjAy
MSAxMDoxOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDMuMTEu
MjEgMTE6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjExLjIwMjEgMDk6NTMsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwMi4xMS4yMSAxNjoxMCwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBPbiAwMi4xMS4yMSAxNTo1NCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMDIuMTEuMjAyMSAxMjo1MCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+Pj4+Pj4gT24gVHVlLCBOb3YgMDIsIDIwMjEgYXQgMTI6MTk6MTNQTSAr
MDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+PiBPbiAyNi4xMC4yMDIxIDEyOjUyLCBS
b2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIFRodSwgU2VwIDMwLCAyMDIxIGF0
IDEwOjUyOjIwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+
Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+Pj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+Pj4gQEAgLTQ1MSw2ICs0NTEsMzIgQEAg
c3RhdGljIHZvaWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2
LT5zYmRmLCByZWcsIGNtZCk7DQo+Pj4+Pj4+Pj4+ICAgICAgfQ0KPj4+Pj4+Pj4+PiAgICAgIA0K
Pj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgZ3Vlc3RfY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IGNtZCwgdm9pZCAqZGF0YSkNCj4+Pj4+Pj4+Pj4gK3sNCj4+
Pj4+Pj4+Pj4gKyAgICAvKiBUT0RPOiBBZGQgcHJvcGVyIGVtdWxhdGlvbiBmb3IgYWxsIGJpdHMg
b2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQo+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAg
ICBpZiAoIChjbWQgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpID09IDAgKQ0KPj4+Pj4+Pj4+
PiArICAgIHsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgLyoNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICog
R3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWY6DQo+Pj4+
Pj4+Pj4+ICsgICAgICAgICAqICAtIGhvc3QgaGFzIElOVHggZGlzYWJsZWQNCj4+Pj4+Pj4+Pj4g
KyAgICAgICAgICogIC0gTVNJL01TSS1YIGVuYWJsZWQNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICov
DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIGlmICggcGRldi0+dnBjaS0+bXNpLT5lbmFibGVkICkNCj4+
Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7DQo+
Pj4+Pj4+Pj4+ICsgICAgICAgIGVsc2UNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+
PiArICAgICAgICAgICAgdWludDE2X3QgY3VycmVudF9jbWQgPSBwY2lfY29uZl9yZWFkMTYocGRl
di0+c2JkZiwgcmVnKTsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgICAgICAgICAgaWYg
KCBjdXJyZW50X2NtZCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSApDQo+Pj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsNCj4+Pj4+Pj4+
Pj4gKyAgICAgICAgfQ0KPj4+Pj4+Pj4+IFRoaXMgbGFzdCBwYXJ0IHNob3VsZCBiZSBBcm0gc3Bl
Y2lmaWMuIE9uIG90aGVyIGFyY2hpdGVjdHVyZXMgd2UNCj4+Pj4+Pj4+PiBsaWtlbHkgd2FudCB0
aGUgZ3Vlc3QgdG8gbW9kaWZ5IElOVHggZGlzYWJsZSBpbiBvcmRlciB0byBzZWxlY3QgdGhlDQo+
Pj4+Pj4+Pj4gaW50ZXJydXB0IGRlbGl2ZXJ5IG1vZGUgZm9yIHRoZSBkZXZpY2UuDQo+Pj4+Pj4+
PiBXZSBjYW5ub3QgYWxsb3cgYSBndWVzdCB0byBjbGVhciB0aGUgYml0IHdoZW4gaXQgaGFzIE1T
SSAvIE1TSS1YDQo+Pj4+Pj4+PiBlbmFibGVkIC0gb25seSBvbmUgb2YgdGhlIHRocmVlIGlzIHN1
cHBvc2VkIHRvIGJlIGFjdGl2ZSBhdCBhIHRpbWUuDQo+Pj4+Pj4+PiAoSU9XIHNpbWlsYXJseSB3
ZSBjYW5ub3QgYWxsb3cgYSBndWVzdCB0byBlbmFibGUgTVNJIC8gTVNJLVggd2hlbg0KPj4+Pj4+
Pj4gdGhlIGJpdCBpcyBjbGVhci4pDQo+Pj4+Pj4+IFN1cmUsIGJ1dCB0aGlzIGNvZGUgaXMgbWFr
aW5nIHRoZSBiaXQgc3RpY2t5LCBieSBub3QgYWxsb3dpbmcNCj4+Pj4+Pj4gSU5UWF9ESVNBQkxF
IHRvIGJlIGNsZWFyZWQgb25jZSBzZXQuIFdlIGRvIG5vdCB3YW50IHRoYXQgYmVoYXZpb3Igb24N
Cj4+Pj4+Pj4geDg2LCBhcyBhIGd1ZXN0IGNhbiBkZWNpZGUgdG8gdXNlIE1TSSBvciBJTlR4LiBU
aGUgZWxzZSBicmFuY2ggbmVlZHMNCj4+Pj4+Pj4gdG8gYmUgQXJtIG9ubHkuDQo+Pj4+Pj4gSXNu
J3QgdGhlICJlbHNlIiBwYXJ0IHF1ZXN0aW9uYWJsZSBldmVuIG9uIEFybT8NCj4+Pj4+IEl0IGlz
LiBPbmNlIGZpeGVkIEkgY2FuJ3Qgc2VlIGFueXRoaW5nIEFybSBzcGVjaWZpYyBoZXJlDQo+Pj4+
IFdlbGwsIEkgaGF2ZSBsb29rZWQgYXQgdGhlIGNvZGUgb25lIG1vcmUgdGltZSBhbmQgZXZlcnl0
aGluZyBzZWVtcyB0bw0KPj4+PiBiZSBvayB3cnQgdGhhdCBzdGlja3kgYml0OiB3ZSBoYXZlIDIg
aGFuZGxlcnMgd2hpY2ggYXJlIGNtZF93cml0ZSBhbmQNCj4+Pj4gZ3Vlc3RfY21kX3dyaXRlLiBU
aGUgZm9ybWVyIGlzIHVzZWQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gYW5kIGhhcw0KPj4+PiAq
bm8gcmVzdHJpY3Rpb25zKiBvbiB3cml0aW5nIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGNvbnRlbnRz
IGFuZCB0aGUgbGF0ZXINCj4+Pj4gaXMgb25seSB1c2VkIGZvciBndWVzdHMgYW5kIHdoaWNoIGRv
ZXMgaGF2ZSByZXN0cmljdGlvbnMgYXBwbGllZCBpbg0KPj4+PiBlbXVsYXRlX2NtZF9yZWcgZnVu
Y3Rpb24uDQo+Pj4+DQo+Pj4+IFNvLCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlcmUgaXMg
bm8gInN0aWNreSIgYml0IHBvc3NpYmxlIGFuZCBmb3IgdGhlDQo+Pj4+IGd1ZXN0IGRvbWFpbnMg
aWYgdGhlIHBoeXNpY2FsIGNvbnRlbnRzIG9mIHRoZSBQQ0lfQ09NTUFORCByZWdpc3Rlcg0KPj4+
PiBoYXMgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIGJpdCBzZXQgdGhlbiB0aGUgZ3Vlc3QgaXMg
ZW5mb3JjZWQgdG8NCj4+Pj4gdXNlIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQgc2V0Lg0K
Pj4+Pg0KPj4+PiBTbywgZnJvbSBoYXJkd2FyZSBkb21haW4gUE9WLCB0aGlzIHNob3VsZCBub3Qg
YmUgYSBwcm9ibGVtLCBidXQgZnJvbQ0KPj4+PiBndWVzdHMgdmlldyBpdCBjYW4uIExldCdzIGlt
YWdpbmUgdGhhdCB0aGUgaGFyZHdhcmUgZG9tYWluIGNhbiBoYW5kbGUNCj4+Pj4gYWxsIHR5cGVz
IG9mIGludGVycnVwdHMsIGUuZy4gSU5UeCwgTVNJLCBNU0ktWC4gSW4gdGhpcyBjYXNlIHRoZSBo
YXJkd2FyZQ0KPj4+PiBkb21haW4gY2FuIGRlY2lkZSB3aGF0IGNhbiBiZSB1c2VkIGZvciB0aGUg
aW50ZXJydXB0IHNvdXJjZSAoYWdhaW4sIG5vDQo+Pj4+IHJlc3RyaWN0aW9uIGhlcmUpIGFuZCBw
cm9ncmFtIFBDSV9DT01NQU5EIGFjY29yZGluZ2x5Lg0KPj4+PiBHdWVzdCBkb21haW5zIG5lZWQg
dG8gYWxpZ24gd2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24sIGUuZy4gaWYgSU5UeCB3YXMgZGlzYWJs
ZWQNCj4+Pj4gYnkgdGhlIGhhcmR3YXJlIGRvbWFpbiB0aGVuIElOVHggY2Fubm90IGJlIGVuYWJs
ZWQgZm9yIGd1ZXN0cw0KPj4+IFdoeT8gSXQncyB0aGUgRG9tVSB0aGF0J3MgaW4gY29udHJvbCBv
ZiB0aGUgZGV2aWNlLCBzbyBpdCBvdWdodCB0bw0KPj4+IGJlIGFibGUgdG8gcGljayBhbnkgb2Yg
dGhlIHRocmVlLiBJIGRvbid0IHRoaW5rIERvbTAgaXMgaW52b2x2ZWQgaW4NCj4+PiBoYW5kbGlu
ZyBvZiBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmljZSwgYW5kIGhlbmNlIGl0cyBvd24gImRpc2xp
a2UiDQo+Pj4gb2YgSU5UeCBvdWdodCB0byBvbmx5IGV4dGVuZCB0byB0aGUgcGVyaW9kIG9mIHRp
bWUgd2hlcmUgRG9tMCBpcw0KPj4+IGNvbnRyb2xsaW5nIHRoZSBkZXZpY2UuIFRoaXMgd291bGQg
YmUgZGlmZmVyZW50IGlmIFhlbidzIHZpZXcgd2FzDQo+Pj4gZGlmZmVyZW50LCBidXQgYXMgd2Ug
c2VlbSB0byBhZ3JlZSBYZW4ncyByb2xlIGhlcmUgaXMgc29sZWx5IHRvDQo+Pj4gcHJldmVudCBp
bnZhbGlkIGNvbWJpbmF0aW9ucyBnZXR0aW5nIGVzdGFibGlzaGVkIGluIGhhcmR3YXJlLg0KPj4g
T24gdG9wIG9mIGEgUENJIGRldmljZSB0aGVyZSBpcyBhIHBoeXNpY2FsIGhvc3QgYnJpZGdlIGFu
ZA0KPj4gcGh5c2ljYWwgYnVzIHRvcG9sb2d5IHdoaWNoIG1heSBpbXBvc2UgcmVzdHJpY3Rpb25z
IGZyb20NCj4+IERvbTAgUE9WIG9uIHRoYXQgcGFydGljdWxhciBkZXZpY2UuDQo+IFdlbGwsIHN1
Y2ggcGh5c2ljYWwgcmVzdHJpY3Rpb25zIG1heSBtZWFuIElOVHggZG9lc24ndCBhY3R1YWxseSB3
b3JrLA0KPiBidXQgdGhpcyB3b24ndCBtZWFuIHRoZSBEb21VIGlzbid0IGZyZWUgaW4gY2hvb3Np
bmcgdGhlIGJpdCdzIHNldHRpbmcuDQo+IFRoZSBiaXQgbWVyZWx5IGNvbnRyb2xzIHdoZXRoZXIg
dGhlIGRldmljZSBpcyBhbGxvd2VkIHRvIGFzc2VydCBpdHMNCj4gaW50ZXJydXB0IHBpbi4gSGVu
Y2UgLi4uDQo+DQo+PiBTbywgZXZlcnkgUENJIGRldmljZQ0KPj4gYmVpbmcgcGFzc2VkIHRocm91
Z2ggdG8gYSBEb21VIG1heSBoYXZlIGRpZmZlcmVudCBJTlR4DQo+PiBzZXR0aW5ncyB3aGljaCBk
byBkZXBlbmQgb24gRG9tMCBpbiBvdXIgY2FzZS4NCj4gLi4uIEknbSBzdGlsbCB1bmNvbnZpbmNl
ZCBvZiB0aGlzLg0KT2ssIHNvIEkgY2FuIGFjY2VwdCBhbnkgc3VnZ2VzdGlvbiBob3cgdG8gc29s
dmUgdGhpcy4gSXQgc2VlbXMgdGhhdA0Kd2UgYWxyZWFkeSBoYXZlIG51bWJlciBvZiBubyBnbyBz
Y2VuYXJpb3MgaGVyZSwgYnV0IHN0aWxsIGl0IGlzIG5vdA0KY2xlYXIgdG8gbWUgd2hhdCBjb3Vs
ZCBiZSBhbiBhY2NlcHRhYmxlIGFwcHJvYWNoIGhlcmUuIE5hbWVseToNCndoYXQgZG8gd2UgZG8g
d2l0aCBJTlR4IGJpdCBmb3IgZ3Vlc3RzPw0KMS4gSSBjYW4gbGVhdmUgaXQgYXMgaXMgaW4gdGhl
IHBhdGNoDQoyLiBJIGNhbiByZW1vdmUgSU5UeCBlbXVsYXRpb24gYW5kIGxldCB0aGUgZ3Vlc3Qg
ZGVjaWRlIGFuZCBwcm9ncmFtIElOVHgNCjMuIFdoYXQgZWxzZSBjYW4gSSBkbz8NCj4NCj4gSmFu
DQo+DQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

