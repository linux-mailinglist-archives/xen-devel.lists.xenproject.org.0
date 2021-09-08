Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF393403C5D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182218.329693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzHu-0002dv-06; Wed, 08 Sep 2021 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182218.329693; Wed, 08 Sep 2021 15:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzHt-0002bn-Sa; Wed, 08 Sep 2021 15:14:57 +0000
Received: by outflank-mailman (input) for mailman id 182218;
 Wed, 08 Sep 2021 15:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iEI=N6=epam.com=prvs=98850bb71f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNzHs-0002bh-PX
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:14:56 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f28711e2-70cd-4fdf-ab5a-038c19e4878d;
 Wed, 08 Sep 2021 15:14:55 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188EwNox030430; 
 Wed, 8 Sep 2021 15:14:51 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3axwna8mh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 15:14:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2766.eurprd03.prod.outlook.com (2603:10a6:800:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 15:14:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.015; Wed, 8 Sep 2021
 15:14:46 +0000
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
X-Inumbo-ID: f28711e2-70cd-4fdf-ab5a-038c19e4878d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cezgYwNokEuP8IU1WrNp/SpeWHd0ADJdfhLuqqRHvEwFdGsda/MotUEgKYQhbCHzV9WdMbj4ns8W26X3dcvAM7CwN0naeOx+LUjHKHOg08uDyDFhIlFjSuEBHGoiY96Iq6OqDQwtqtf0AwqzdHhp+7mAxwRFRWKOxZ7t52T2Pxhlb5CqXFt/TGXMNe23i8P90bkstwq0b3DdCfK6bJkA04LQsUTdQA9e3AVUK9hYTThmftnuXVuSXqMy7r553X+MSJtRQWS8+gmJLHt+6m9fu3Q/VSaC6iY1pUIphEOVLMOgUz8i4TcvgNN12ocXOIrM3Xyo7CxvCRikL55dFaGJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jLpf7T2GS3Z0c/y8shA8fr/NAWe8QNcklPFtyAfEp40=;
 b=oWlz2kiRzhTOWEUfQhjRy6uvSd6kpe97o4a4n/oTx2B6j2BkjwbDCP2/ZuGehOKbS7sF2WCtsc38hnQI07k+jckRb9JkmEFBqyE6rf/J9BA7Gmy7PPeH2h4NwJHD5sS1NScyCAvjksfNrTs4zF9M4gSi6qY5HOQ99e0R0hH/7wiO5XZMzuaWkBtMGU1QuP+/Ezg2SmoC9kpjBtmoAeVg+fy4Iit0C0IgE5WkYZA5SaSVV6IB54g6HPeOGoMFMfuwDIeWIVTw20X4vi9snBQmuI+1HJRwTfgqzZ1HnNJQZ6LPBgFuNuUBOAo+jlhmqi1lM4DVT9y94s3/uUxOxk4Bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLpf7T2GS3Z0c/y8shA8fr/NAWe8QNcklPFtyAfEp40=;
 b=qOS/UN7oN24JtK3M+3VYnw8oaOEjkl21qsL7fInFcRYqz18VxDo6kuQQDjhiEvcROs447j2QYKqe9WXpcFf9Lex+O37022l1cXuTCM/PZ0+q3frbmBIJsrjWzk15lxqrNRRJGzuhLiXqTrT+ptaOVkauFsQHNyvxevXL/XNDliFvi+3lBfTR68j+q8RAz6MbooA41fsxqJfUqct/HhXOAKC++ynKmdHwc+15qlYOGIf6VpcVLe0KWqw4ycmyOpLWcLbWi297u+Kcb/LkwVzSJ7wH0KJ33to/I8mY+Rvg/1jRsQqmM/bRXWhR03y0pYV0HWbk6HL7myShhtpjEV88Jg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Topic: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Index: 
 AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLICAADFtgIAAE0qAgAEIooCAAAS6AIAABV4AgAA6yACAABRDgIAACAOA
Date: Wed, 8 Sep 2021 15:14:46 +0000
Message-ID: <d5ef78d1-253e-26cb-8d24-667d1ce7a671@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
 <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
 <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
 <2fd6b81e-e5fc-f6d8-b24f-9fbb1db034d7@suse.com>
In-Reply-To: <2fd6b81e-e5fc-f6d8-b24f-9fbb1db034d7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c051a72-ec4a-4d4e-09e1-08d972db6520
x-ms-traffictypediagnostic: VI1PR0302MB2766:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2766DD7BDA0B8D54BD582CECE7D49@VI1PR0302MB2766.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u0ZUfZslA5SnZCE4Up8jl4fNc1Enp+RVtT9Lmp7HPjOF3VSX8bDwhpMOmu/rZoQ4JQuEl3oQaxubxI0SLwtuwoc1YDjij+cBWN12GCcxiCz5Z6u4nB5ckcv7jC/evE1TfrlFX6qK9jG4cNtSdzlYqO8QFlnSFCtqzv2KhactVgiCMXm4/tKMDag3j1jnx2YE11vGGYaHeLZFBtoibbY3oc6f/KW5GlcmuBSRKke8XUYcUhox29Fc+cfs5seRDyAk+T++9vde+aZ7jiCcGgAx1zXkSSz5t4tei08yc0AX0YiZGObuZlnZm4K4Ffgt5ajemlc3CbltC11u3HmgTTmKgKOLi9RxGLxgsAplNnZN2t8BP5KtQBGgDyMmhwtIKjpnuaaJkShsF4apDQVVzN9hwtYTCqyakI0SauXE1cNoeZelItO6th/J1TsvttcBETUPagJjPUG/BEHnbbyDG2M7US7RxqTnMszZKR7CrjH0EQ3RiMHfqyTM5WX2TQI+EoAGMcrBBIV63fhm469K95X/t2NIDEvQmOr9xfj/XhRHIUe/hlShrYFjJf0uclABQPs/2gOiVcHcA8S8G8rGH0WMr/EBiOEeK2Lgiod2p4zK4o6lCFuo8vK6gaRwhv6hRGvlfSS/MTzbNCfQO0PbIp77PecYWdb9B8SbdECU9H1ZDhvTdE2qUvLQLEMY+DMGobU3XXp/RC6MnDP+Qk2/fgHTMoyKhIUwGQMFR9l/kRkbTzB9SkulRw0P6rdqjjt1bJSl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(2616005)(53546011)(122000001)(66946007)(6506007)(66476007)(71200400001)(38100700002)(64756008)(66556008)(36756003)(6486002)(86362001)(91956017)(4326008)(76116006)(31696002)(83380400001)(26005)(478600001)(5660300002)(6512007)(66446008)(186003)(38070700005)(8676002)(2906002)(110136005)(316002)(8936002)(31686004)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTNQN1BJM0RwdjlBTDJxNitSR2wyZmlJbkVUUW9mVk5vaktPSkcyS1ZDTXg1?=
 =?utf-8?B?S0c1WXM4SjN3NHBHTkprNTdxVC9pZ2grSWh5bGw3NDQ0WHA5aEpMa2k2V1VM?=
 =?utf-8?B?cVorVnJ5NEVEQllKdHVuZ1dKakxUQklhTWRnQWp1UUJMaGZFOHdjRFdQd2Zr?=
 =?utf-8?B?c21jSDVJOXNveitQU0Uva1hsNFVWc2RKZUE0OURLNmZ6dHdOY0JGTzlPdFZF?=
 =?utf-8?B?SzVxZmtYbnhYNmlOMklFQmJ2NkloMEYydHNBTXVMNEpzdUpSUS8xQTVQU2Vw?=
 =?utf-8?B?N0MzOGdObjU5Z0VVQllQdUc1VWg0RDd4ays1UTcxQStPQ0orRm52My82Sk9J?=
 =?utf-8?B?TWxRT0grMkc1NzAxOVQ2MzdrZ3YzU2xGN3BabHM4VG9VTC8yYWxxRTlqSjlY?=
 =?utf-8?B?d3c1cDhzNFRTNFBrK2lNKzlEYW9aSjMwVWdvKzNEV1pMYTdaU3VJNlBQNVhW?=
 =?utf-8?B?OUd5SEQrMnJGbGVva1FUbVYwVHFMbWl5TW5nS3ZrUHR1OUwwUzhlK2NuRExj?=
 =?utf-8?B?T1ZKN2xETTB3cVdOKy9vTkZTeXM1MllUQVNMVXp4ZWdTYVNIc0llOGF1TjB1?=
 =?utf-8?B?UEY3TlB4V3NXN29MVEdUcXo4TzFnL1B2Ulg5TFBJZW5FNTdGR0FKdXQybkNr?=
 =?utf-8?B?blRQMXA1dUJBT0NoaXhKWnlGTTBYbkh3MHowcjVlSGdKZ2RseDdrZDJyWCtw?=
 =?utf-8?B?S2p4enhvN0hqQmVVSTdaT3A4MnBoZUNVMDBidmJZN1lDVDZBUFZldmw4eEU0?=
 =?utf-8?B?Wnhnak1raFFjRzVyZGphYTBRT0lIeHJ3bWlad295ek9qWEs4cTR6N1Z2Qk8y?=
 =?utf-8?B?R042amNHWjJyM1NWSjRlZXJ0S0ErV0c1TTZvZ1NvaTJrL1VWcEZEQW0zd0NX?=
 =?utf-8?B?YVJ3NHd5L2JDRmJPTk0rMjErS0lETEU5SHZCcS9EMHJ3WWpFRit1TWlWN3FD?=
 =?utf-8?B?MjFwK1BMRVJCTHBJOGkwWVNvRk1wWXpaZENRVGFHOEJPUUk4dmREY2x2eXNq?=
 =?utf-8?B?akw0WWFxWGJYTHJsbW5UcnRVaW43dXRUcDFpNCt2YnBWenFUVU9QWUZLMjVN?=
 =?utf-8?B?NC92VjBENXhubWVMWVJ4aTR6WURmQkJ5Y3J6d21VSHhnK3cyWnNYRGRjRXlP?=
 =?utf-8?B?Ly8yV3pLT3FKdVRTbzNjWEtjbXBTTzUvQm5lZllNaGlGT0l6SjRqRE0yVG82?=
 =?utf-8?B?d0Uxelhrcm9xc0FDWS94MTRpWTNHOVZQcDYzMWZ0VGZ4MFFXaTlmVHVQMU50?=
 =?utf-8?B?ZXA5Z3VuVmk5M1R4SkNEdmhxWHlzeklHbXJxMnRNakVtQUlmbFhKSDl0TXBT?=
 =?utf-8?B?OGQvdWVUcmc0VnZaQkNXZFFBNDhBUjlaL2dCS1hWck1mSHEwTXBJYnNtc3p4?=
 =?utf-8?B?cXRrcEFPbWRqTGZsd2h0eTAwcTBDS3NySER6WVoyUUIvY3YzN0crbjk4ZjFJ?=
 =?utf-8?B?QTNLN0xnOU5KSnFYZ0NpUXc4NmsrMXpZZmVlajIrYjdDYTlDUTgyVlRqZXFY?=
 =?utf-8?B?Sjl1V1Uvd2F6R0NXNDdtQjVkQTVhaDFUekRNL1FRN3l1Z1ZLclA2dy9aMEE3?=
 =?utf-8?B?clRRYUo5UXFhQXRNN0szUmczZ09MZGhMOExsV21nK0NDM3ludWlkaXNqUVBt?=
 =?utf-8?B?ZXZLS0wzMThvSzRzZkZFWk1lS0piWFVnYlRGL1Boc1VGc0gyODdEM1E4eDZw?=
 =?utf-8?B?ZFFuZDNPY29WckNLNjJjUVhBRTJGVFp0bzhJMytpdk5ZNnFnYTViV1g4K0pW?=
 =?utf-8?Q?ayX7M4+0hM29POdF2/nftJfNwXe3Dbj5kXHt45+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCA610E42E623B42B957260569C831D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c051a72-ec4a-4d4e-09e1-08d972db6520
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 15:14:46.8394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgmO5Bh7Ka8cgqh6aKakNjcI2+leaXTTWhnBLeyZnlf+SR552fD0r/yFxwTK0j1gHiBziyXvcCtR2Kg1KCvWNpo12Yn9eLdQkmAEiCyvWC0zft4ROj2ZqfXewni3PqBD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2766
X-Proofpoint-ORIG-GUID: 33t4pPL0pMMOIaiUq4upRmil8h2nh5Hx
X-Proofpoint-GUID: 33t4pPL0pMMOIaiUq4upRmil8h2nh5Hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080096

DQpPbiAwOC4wOS4yMSAxNzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjA5LjIwMjEg
MTU6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDguMDkuMjEgMTM6
MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjA5LjIwMjEgMTE6NDMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwOC4wOS4yMSAxMjoyNywgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDE5OjM5LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wOS4yMSAxOTozMCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDA3LjA5LjIwMjEgMTU6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gT24gMDYuMDkuMjEgMTc6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+Pj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+Pj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+Pj4gQEAgLTQwMCwxMiAr
NDAwLDcyIEBAIHN0YXRpYyB2b2lkIGJhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4gICAgICAgc3RhdGljIHZvaWQgZ3Vlc3Rf
YmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0K
Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFs
LCB2b2lkICpkYXRhKQ0KPj4+Pj4+Pj4+PiAgICAgICB7DQo+Pj4+Pj4+Pj4+ICsgICAgc3RydWN0
IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KPj4+Pj4+Pj4+PiArICAgIGJvb2wgaGkgPSBmYWxzZTsN
Cj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFS
X01FTTY0X0hJICkNCj4+Pj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIEFTU0VS
VChyZWcgPiBQQ0lfQkFTRV9BRERSRVNTXzApOw0KPj4+Pj4+Pj4+PiArICAgICAgICBiYXItLTsN
Cj4+Pj4+Pj4+Pj4gKyAgICAgICAgaGkgPSB0cnVlOw0KPj4+Pj4+Pj4+PiArICAgIH0NCj4+Pj4+
Pj4+Pj4gKyAgICBlbHNlDQo+Pj4+Pj4+Pj4+ICsgICAgICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERS
RVNTX01FTV9NQVNLOw0KPj4+Pj4+Pj4+PiArICAgIGJhci0+Z3Vlc3RfYWRkciAmPSB+KDB4ZmZm
ZmZmZmZ1bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+Pj4+Pj4+Pj4+ICsgICAgYmFyLT5ndWVzdF9h
ZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+Pj4+Pj4+PiBXaGF0IHlv
dSBzdG9yZSBoZXJlIGlzIG5vdCB0aGUgYWRkcmVzcyB0aGF0J3MgZ29pbmcgdG8gYmUgdXNlZCwN
Cj4+Pj4+Pj4+PiAgICAgICBhcw0KPj4+Pj4+Pj4+IHlvdSBkb24ndCBtYXNrIG9mZiB0aGUgbG93
IGJpdHMgKHRvIGFjY291bnQgZm9yIHRoZSBCQVIncyBzaXplKS4NCj4+Pj4+Pj4+PiBXaGVuIGEg
QkFSIGdldHMgd3JpdHRlbiB3aXRoIGFsbCBvbmVzLCBhbGwgd3JpdGFibGUgYml0cyBnZXQgdGhl
c2UNCj4+Pj4+Pj4+PiBvbmVzIHN0b3JlZC4gVGhlIGFkZHJlc3Mgb2YgdGhlIEJBUiwgYWl1aSwg
cmVhbGx5IGNoYW5nZXMgdG8NCj4+Pj4+Pj4+PiAodHlwaWNhbGx5KSBjbG9zZSBiZWxvdyA0R2Ig
KGluIHRoZSBjYXNlIG9mIGEgMzItYml0IEJBUiksIHdoaWNoDQo+Pj4+Pj4+Pj4gaXMgd2h5IG1l
bW9yeSAvIEkvTyBkZWNvZGluZyBzaG91bGQgYmUgb2ZmIHdoaWxlIHNpemluZyBCQVJzLg0KPj4+
Pj4+Pj4+IFRoZXJlZm9yZSB5b3Ugc2hvdWxkbid0IGxvb2sgZm9yIHRoZSBzcGVjaWZpYyAiYWxs
IHdyaXRhYmxlIGJpdHMNCj4+Pj4+Pj4+PiBhcmUgb25lcyIgcGF0dGVybiAob3Igd29yc2UsIGFz
IHlvdSBwcmVzZW50bHkgZG8sIHRoZSAiYWxsIGJpdHMNCj4+Pj4+Pj4+PiBvdXRzaWRlIG9mIHRo
ZSB0eXBlIHNwZWNpZmllciBhcmUgb25lcyIgb25lKSBvbiB0aGUgcmVhZCBwYXRoLg0KPj4+Pj4+
Pj4+IEluc3RlYWQgbWFzayB0aGUgdmFsdWUgYXBwcm9wcmlhdGVseSBoZXJlLCBhbmQgc2ltcGx5
IHJldHVybiBiYWNrDQo+Pj4+Pj4+Pj4gdGhlIHN0b3JlZCB2YWx1ZSBmcm9tIHRoZSByZWFkIHBh
dGguDQo+Pj4+IEJ1dCBpbiBjYXNlIG9mIEJBUiBzaXppbmcgSSBuZWVkIHRvIGFjdHVhbGx5IHJl
dHVybiBCQVIgc2l6ZS4NCj4+Pj4gU28sIHRoZSBjb21wYXJpc29uIGlzIHRoZSB3YXkgdG8gdGVs
bCBpZiB0aGUgZ3Vlc3Qgd2FudHMgdG8gcmVhZA0KPj4+PiBhY3R1YWwgKGNvbmZpZ3VyZWQpIEJB
UiB2YWx1ZSBvciBpdCB0cmllcyB0byBkZXRlcm1pbmUgQkFSJ3Mgc2l6ZS4NCj4+Pj4gVGhpcyBp
cyB3aHkgSSBjb21wYXJlIGFuZCB1c2UgdGhlIHJlc3VsdCBhcyB0aGUgYW5zd2VyIHRvIHdoYXQg
bmVlZHMNCj4+Pj4gdG8gYmUgc3VwcGxpZWQgdG8gdGhlIGd1ZXN0LiBTbywgaWYgSSBkb24ndCBj
b21wYXJlIHdpdGggMHhmZmZmZmZmZiBmb3IgdGhlDQo+Pj4+IGhpIHBhcnQgYW5kIDB4ZmZmZmZm
ZjAgZm9yIHRoZSBsb3cgdGhlbiBob3cgZG8gSSBrbm93IHdoZW4gdG8gcmV0dXJuDQo+Pj4+IGNv
bmZpZ3VyZWQgQkFSIG9yIHJldHVybiB0aGUgc2l6ZT8NCj4+PiBXZWxsLCBidXQgdGhhdCdzIHRo
ZSBjb21tb24gbWlzdW5kZXJzdGFuZGluZyB0aGF0IEkndmUgYmVlbiB0cnlpbmcNCj4+PiB0byBw
b2ludCBvdXQ6IFRoZXJlJ3Mgbm8gZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZXNlIHR3byBmb3JtcyBv
Zg0KPj4+IHJlYWRzLiBUaGUgQkFScyBhcmUgc2ltcGx5IHJlZ2lzdGVycyB3aXRoIHNvbWUgci9v
IGJpdHMuIFRoZXJlJ3MNCj4+PiBubyBoaWRkZW4gMm5kIHJlZ2lzdGVyIHJlY29yZGluZyB3aGF0
IHdhcyBsYXN0IHdyaXR0ZW4uIFdoZW4geW91DQo+Pj4gd3JpdGUgMHhmZmZmZmZmZiwgYWxsIHlv
dSBkbyBpcyBzZXQgYWxsIHdyaXRhYmxlIGJpdHMgdG8gMS4gV2hlbg0KPj4+IHlvdSByZWFkIGJh
Y2sgZnJvbSB0aGUgcmVnaXN0ZXIsIHlvdSB3aWxsIGZpbmQgYWxsIHIvbyBiaXRzDQo+Pj4gdW5j
aGFuZ2VkICh3aGljaCBpbiBwYXJ0aWN1bGFyIG1lYW5zIGFsbCBsb3dlciBhZGRyZXNzIGJpdHMg
YXJlDQo+Pj4gemVybywgdGh1cyBhbGxvd2luZyB5b3UgdG8gZGV0ZXJtaW5lIHRoZSBzaXplKS4N
Cj4+Pg0KPj4+IFdoZW4gdGhlIHNwZWMgc2F5cyB0byB3cml0ZSAweGZmZmZmZmZmIGZvciBzaXpp
bmcgcHVycG9zZXMsIE9TZXMNCj4+PiBzaG91bGQgZm9sbG93IHRoYXQsIHllcy4gVGhpcyBkb2Vz
bid0IHByZWNsdWRlIHRoZW0gdG8gdXNlIG90aGVyDQo+Pj4gZm9ybXMgb2Ygd3JpdGVzIGZvciB3
aGljaGV2ZXIgcHVycG9zZS4gSGVuY2UgeW91IGRvIG5vdCB3YW50IHRvDQo+Pj4gc3BlY2lhbCBj
YXNlIHNpemluZywgYnV0IGluc3RlYWQgeW91IHdhbnQgdG8gZW11bGF0ZSBjb3JyZWN0bHkNCj4+
PiBhbGwgZm9ybXMgb2Ygd3JpdGVzLCBpbmNsdWRpbmcgc3Vic2VxdWVudCByZWFkcyB0byB1bmlm
b3JtbHkNCj4+PiByZXR1cm4gdGhlIGludGVuZGVkIC8gZXhwZWN0ZWQgdmFsdWVzLg0KPj4+DQo+
Pj4gSnVzdCB0byBnaXZlIGFuIGV4YW1wbGUgKHBlcmhhcHMgYSBsaXR0bGUgY29udHJpdmVkKTog
VG8gc2l6ZSBhDQo+Pj4gNjQtYml0IEJBUiwgaW4gcHJpbmNpcGxlIHlvdSdkIGZpcnN0IG5lZWQg
dG8gd3JpdGUgMHhmZmZmZmZmZiB0bw0KPj4+IGJvdGggaGFsdmVzLiBCdXQgdGhlcmUncyBub3Ro
aW5nIHdyb25nIHdpdGggZG9pbmcgdGhpcyBpbiBhDQo+Pj4gZGlmZmVyZW50IG9yZGVyOiBBY3Qg
b24gdGhlIGxvdyBoYWxmIGFsb25lIGZpcnN0LCBhbmQgdGhlbiBhY3QNCj4+PiBvbiB0aGUgaGln
aCBoYWxmLiBUaGUgYWN0aW5nIG9uIHRoZSBoaWdoIGhhbGYgY291bGQgZXZlbiBiZQ0KPj4+IHNr
aXBwZWQgaWYgdGhlIGxvdyBoYWxmIHNpemluZyBwcm9kdWNlZCBhdCBsZWFzdCBiaXQgMzEgc2V0
LiBOb3cNCj4+PiBpZiB5b3Ugd2VyZSB0byBzcGVjaWFsIGNhc2Ugc2VlaW5nIGZmZmZmZmZmOmZm
ZmZmZmY/IGFzIHRoZQ0KPj4+IGxhc3Qgd3JpdHRlbiBwYWlyIG9mIHZhbHVlcywgeW91J2QgYnJl
YWsgdGhhdCAoaW1vIGxlZ2l0aW1hdGUpDQo+Pj4gYWx0ZXJuYXRpdmUgcHJvY2VzcyBvZiBzaXpp
bmcuDQo+PiBIb3cgYWJvdXQ6DQo+IFllcywgdGhhdCdzIHdoYXQgSSB3YXMgYWZ0ZXIuIEp1c3Qg
b25lIG5pdCByaWdodCBhd2F5Og0KPg0KPj4gc3RhdGljIHZvaWQgZ3Vlc3RfYmFyX3dyaXRlKGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3Qg
dmFsLCB2b2lkICpkYXRhKQ0KPj4gew0KPj4gICDCoMKgwqAgc3RydWN0IHZwY2lfYmFyICpiYXIg
PSBkYXRhOw0KPj4gICDCoMKgwqAgYm9vbCBoaSA9IGZhbHNlOw0KPj4NCj4+ICAgwqDCoMKgIGlm
ICggYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+ICAgwqDCoMKgIHsNCj4+ICAg
wqDCoMKgwqDCoMKgwqAgQVNTRVJUKHJlZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7DQo+PiAgIMKg
wqDCoMKgwqDCoMKgIGJhci0tOw0KPj4gICDCoMKgwqDCoMKgwqDCoCBoaSA9IHRydWU7DQo+PiAg
IMKgwqDCoCB9DQo+PiAgIMKgwqDCoCBlbHNlDQo+PiAgIMKgwqDCoCB7DQo+PiAgIMKgwqDCoMKg
wqDCoMKgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KPj4gICDCoMKgwqDCoMKg
wqDCoCB2YWwgfD0gYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTMyID8gUENJX0JBU0VfQUREUkVT
U19NRU1fVFlQRV8zMg0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBQQ0lfQkFT
RV9BRERSRVNTX01FTV9UWVBFXzY0Ow0KPj4gICDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gYmFyLT5w
cmVmZXRjaGFibGUgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7DQo+PiAgIMKg
wqDCoCB9DQo+Pg0KPj4gICDCoMKgwqAgYmFyLT5ndWVzdF9hZGRyICY9IH4oMHhmZmZmZmZmZnVs
bCA8PCAoaGkgPyAzMiA6IDApKTsNCg0KRG8geW91IHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUgMHhm
ZmZmZmZmZnVsLCBub3QgMHhmZmZmZmZmZnVsbD8NCg0KZS5nLiBzL3VsbC91bA0KDQo+PiAgIMKg
wqDCoCBiYXItPmd1ZXN0X2FkZHIgfD0gKHVpbnQ2NF90KXZhbCA8PCAoaGkgPyAzMiA6IDApOw0K
Pj4NCj4+ICAgwqDCoMKgIGJhci0+Z3Vlc3RfYWRkciAmPSB+KGJhci0+c2l6ZSAtIDEpIHwgflBD
SV9CQVNFX0FERFJFU1NfTUVNX01BU0s7DQo+PiB9DQo+Pg0KPj4gc3RhdGljIHVpbnQzMl90IGd1
ZXN0X2Jhcl9yZWFkKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVn
LA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdm9pZCAqZGF0YSkNCj4+IHsNCj4+ICAgwqDCoMKgIHN0cnVjdCB2cGNpX2Jh
ciAqYmFyID0gZGF0YTsNCj4gY29uc3QgcGxlYXNlLg0KU3VyZQ0KPg0KPiBKYW4NCj4NClRoYW5r
IHlvdSBmb3IgaGVscGluZyB3aXRoIHRoaXMhIQ0KDQpPbGVrc2FuZHINCg==

