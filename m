Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AF403732
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181590.328778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNu7o-0006QJ-ID; Wed, 08 Sep 2021 09:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181590.328778; Wed, 08 Sep 2021 09:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNu7o-0006MS-Eg; Wed, 08 Sep 2021 09:44:12 +0000
Received: by outflank-mailman (input) for mailman id 181590;
 Wed, 08 Sep 2021 09:44:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iEI=N6=epam.com=prvs=98850bb71f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNu7m-0006JA-Ss
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:44:11 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c69fc1e8-ed8b-40ae-be59-91f4e4c4704e;
 Wed, 08 Sep 2021 09:44:09 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1889FxoT024637; 
 Wed, 8 Sep 2021 09:44:06 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3axtd083nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 09:44:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5700.eurprd03.prod.outlook.com (2603:10a6:208:16f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 09:43:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.015; Wed, 8 Sep 2021
 09:43:59 +0000
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
X-Inumbo-ID: c69fc1e8-ed8b-40ae-be59-91f4e4c4704e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSFa/X+79PDEBINK7vW5RYS39EJ8wso4+uI1RozkiTUHmKBcySqoxW89V8sJti/sef79MWdSMCzdxWJHgx0ZM+iPPiePEhzJEaOXyytdv9zsUeL8tsgADslosXT5szef2IT4qEjNTDo1xTyzZpNEGibCeDwPcyHNlA0nZx36/jNopxP6dy/hqAKo0Tnawz9PkNh/x+fCMi+VX7EO7HLy/qc3Grajgp4OEeCV971s8+Gks+g0WjktZp+fFySltxUscARmMaAwOCGpWm/KyHg3iW7WRgmjxfWir4uxQxqhpb7V/VCUgIU50cwyQ7xzljFh3JilYSJi+3opTykpGHDHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=X2aKd0k+XEncRABb6WT/koWSa4++HRFGx8CZSLC/ryw=;
 b=dbGjh8a2Aa9nmAJX9Uo2tAWU2fkRocCXSVj8ZGyqsXpLRSZ5MpJyHeMJwJVAQm28TeYWKnSxzgNrDQbaEl7TI8JFZxOgZiBEF5t59tMl6hLKoCqpxzYCD67FskBR3AtAGLNfn929vlqOnjVwyHynKNeRFrgGkz4V0yA7VEx5zkhXP3OwC6wBuTmR4jsxRfoBwEtLffxnhJDad+7HLWRa18/oImX1PrlOejbD0DYtCU/M+7c08ggseOyqIbHzQcuNZFPkk17tvJZ5OZTkR+nntKrtolUBG7DRiGsNq6PkOBEpDCeL65oBBdo7KzeSdvXwmao+LrgzZxHVXNUPBnRQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2aKd0k+XEncRABb6WT/koWSa4++HRFGx8CZSLC/ryw=;
 b=072+yUaJttkbl1Pp+sWpvbUZUZUrzAxK+OvzF1/mRNK+c8W0hgVcfXgicyESRpXL8U+StK+n7qQLtEINgbRwj+aQA1Jtp4NkYO6akWmAeVlgEFzCbIo3Vfsb4f0gcZWfEIOSqNc3rE49rxKnDE7gk8NGEE7xPpPgBVL9SJ+Mz53DCw3ZL/DObkopY1/dcnPP6J2c/PfiaxRtapKjZsyGRbAmF+Cuna8EYx83wvCxE1k6DzKaADZJBGVdM+xJfroNBQn7ySuotgxRAQ8ci6Fz/hHufMtrx0Vw8y+XUXSchsDW3eXxZtzAfqiezg3QLjZk9/TBTX+MMwsYm2bxHZo7dw==
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
 AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLICAADFtgIAAE0qAgAEIooCAAAS6AA==
Date: Wed, 8 Sep 2021 09:43:59 +0000
Message-ID: <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
In-Reply-To: <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5f5beeb-a20a-4741-bfb7-08d972ad2f1a
x-ms-traffictypediagnostic: AM0PR03MB5700:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB570043DC38F1A70C0BA8230AE7D49@AM0PR03MB5700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8b3+MPJ8fTW8GNQJ28JO1xIeYrvduCPcdyHuOjJbNZjMvdmgMma1Xrc4CwuPnHoHJoby7RxsiZemVLZUz2MtHg+D+4b9cqHHfeodEhW88CwyuKHNeJQn+sAEPjutwj2l6e0W3bxKZ3QJEb2Lwtj0pIG+tjM7TNrnJ5I3pH7LlViuQSl1VRDw0R8b1KSgkMY8dak6N0KtptkHO0ALecY6tO42W2U017K8YsblTtWXk/9j7/JySvEwoGhOFlGBMSxLBCdXyjpwTo1eGdZ5aKQPp2xiIDbXg7NBKOnZ0cu1VGtUcVzkOjJs1ZOwYuQHPIM9sn2BlFKe6AG43FzkCvJyOPUABnItV7OR9rCmdrSFwWvHyHWiPQgOnay7c9T5sYwfwnagnOEsS1a18HVd4HU2Vf18vm6lQhEyWahSD1zhfkLAikOaFvvEWdFIo54fV9tXfeRkja40LCmZGGeMX2wVwaYiXTMJ3QSwdLDmBXslOLYNE+JlkhtpOWBQanZ3q015JPdVOQyi9J9i+wJNgFWLPaGXCOaHiHAWRG/tuuQk89vp2qdHHzaTnGnOJ3yOALLc+d6uQTK6QagWVyYwaiqLTpvAom50b8rVRgcLJKZ7QIfBB9Gjric8K6Y+jtgl6sQXtwiTLVXerKJa0s/M7Ln2lMsPeS8op60fcOPv1Mm7sONRRprWSkEPzy2YvPGLqY6g3+xYSgMB8c1S+bySXkXpDphmJyFsHvZpz/qVmSp3Idk2QbkxcZk9Z3F649yUvJpQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(8936002)(38100700002)(6486002)(4326008)(122000001)(186003)(31686004)(64756008)(66946007)(91956017)(76116006)(83380400001)(31696002)(6506007)(5660300002)(26005)(110136005)(316002)(478600001)(53546011)(2906002)(54906003)(36756003)(71200400001)(86362001)(2616005)(8676002)(66476007)(38070700005)(66556008)(66446008)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUNMOTlrSWhCNzI4SmEvS2FqY1hiQ3VhWUNkTURRdDlUSytyOUxxcVpVOExE?=
 =?utf-8?B?RmdQeHVPWVBmN0xFVHZCYXVZbTBhVlowUE10MGd1VDBLai9GY1cwdnpkWjZ6?=
 =?utf-8?B?RnhBTHk4eVYvUGRFWm9LYTRnRGFJZkFleWNyMHphdk9neU5IQVVDYXhzclJF?=
 =?utf-8?B?eXd5Yksrb2l5WnVJSmFESmpzbzcwa2RibXdKMU4zL1JJbDBjU1pzY1pubDcy?=
 =?utf-8?B?TXM5bE9FYnp3dDlIbWpIOHNxbGEwNGxlSVBNd2dUeFlhaGVlVk52MnRiK0xo?=
 =?utf-8?B?WjE4Q3Rja25BRWNxSjd6L3ROczJCWVpJK3k4MnU1QnFReDFZeG1JTHFtd1ZP?=
 =?utf-8?B?QXNqUnkxVE12dGExT0wvUUZIY0V1WHdCRUdaRXcwYlNoREwvOEtOZWMrRzg5?=
 =?utf-8?B?eitaeXZXdVhqbDdUSm9oaGRRQVZzcStFb2poSzR3aFBQUDhKTEVOTCtvWlBP?=
 =?utf-8?B?Rm90NXpQMWFWeWxSVWtITW4wMFIvV0VaTy9vRG84WlVKK0tLQ3VqMVlld1V1?=
 =?utf-8?B?VUM2anM0QUg2My9PM1ExUGFTYzlOc1BMODYvVEJmSHh4NTR5L0RUWDRBTFVM?=
 =?utf-8?B?dWoxZXFsVzJ3ZlFFUFk0bXhlWUI0YjhONXJzRDdaYkg1ZkxRZDJWNjdmOFRL?=
 =?utf-8?B?a2EzN3VWT1d6OUdvTkRta3QwK0dDbFZGVGh4QTI5WGxydXNSaHVsZGdZVS8w?=
 =?utf-8?B?Yk8wOHQwY3ZYc0ZiMWV3TWphbm5iM3FveWV0UHVvbEwrTUNySkgvWVlFeStE?=
 =?utf-8?B?VzFNSkRZaDFNZVowc0NXUFNLZ3BJUXd4RDFQQlhHS0s3ZWgya1dHODYwL2xT?=
 =?utf-8?B?bERnVmUyT1grc3Y2emNaOVY2Yzh5VWhsRk0vRXVvOWVMS1ZycDZKV0c2clY0?=
 =?utf-8?B?b0tEN0Zyek5Jb3FXZ2ZnNmtUK0k4V2M1K3JESEtHelhYd0VvQUZUbnZib3Fo?=
 =?utf-8?B?TGx1RTdNZmRUY2pxUE1IblZDN1RJUklNMGwxQUhac2hwT0t0WW1JRGpXeElQ?=
 =?utf-8?B?MklTWXJwNEhIM3h6ckxUdE5ieHJFZW5hQ2hnMzB0MkZGYkxJdU9VdUpUUnJs?=
 =?utf-8?B?b1k3VUVTRStJVG5YK0NWZU5QTFMyejN3US95TDVMcldYc0xNS3ZXRVV5ajJ6?=
 =?utf-8?B?dDZRSE1mcDFNbGlHWXVFcUFnekVpcFNNNWpiZk9mVHQrMnBtVkJLZTdNWDhJ?=
 =?utf-8?B?Zk5oZXRBTy9QNmMrL3hEVCswTUFyRlBuOU9FcnNXa1Bob09RRlFvZW50TjdP?=
 =?utf-8?B?QTdFNHUyRHZtcVo2bjU0N2NjWlZ2bFFhRWpWWjZEOXM4OEhVZUtaQ3RGT1BJ?=
 =?utf-8?B?dGFJbFpHaEVPVW1ObWs0TVE4TzZOZXRWUTQ4SERoRkJKbEhBOW9YQXdvbVBs?=
 =?utf-8?B?dFlKVzRSVU8vMXMwZ3dwY2F5ZTFmZVg3UGh2SXhTRjlJNVJRRzVMaFlKY3N2?=
 =?utf-8?B?d1A4N1hLVjNLRTJuaGE0MnV5aUI1VzQvQzdqQVNqUTZBSVpER2U2cWlRd0N6?=
 =?utf-8?B?ZTV3ZnFHS0M0WmtON3BOTURzYnc1UWYxR1VyRW5rRTlodFExTmRUNGdqMHJW?=
 =?utf-8?B?TEJOMEdjaTZIWmJpSk94WjdFdHNQVU90WElibHdrMEg3THRWZFdkZEZUTndG?=
 =?utf-8?B?U1Vvb21BM2psS3RXeVRycDZOUVNyeWIrVE1KVG1jWWFrS09WYm9rcU5Ebys5?=
 =?utf-8?B?UDkwa3pISzRvczR1QkN4QVFWdW9FTGw3NTVFd1dUSUdRRmRBbG9XZVVFRldW?=
 =?utf-8?Q?nsW1o0OzCzRtWbWymcFQL9AHqljHJIRiTygZCuZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DDCAB43ABD7A6409F62548FDE514006@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f5beeb-a20a-4741-bfb7-08d972ad2f1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 09:43:59.3233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwC6Zi1yfh/yRvDbGIT66ZuOMihftHyQrsoR7rBSfcaCZwgzf/GtiRIGJRjF3PefeR/BSvsimNYWKaNH213+Zow1SifDmDU+H9hj+PGxJSffM1rc+qbYSVj/KYGRdAMg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5700
X-Proofpoint-GUID: bBojQ6-moUQjMXAwKoCL4aBJnyOo2AqR
X-Proofpoint-ORIG-GUID: bBojQ6-moUQjMXAwKoCL4aBJnyOo2AqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080062

DQpPbiAwOC4wOS4yMSAxMjoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTk6MzksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTk6
MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTU6MzMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNi4wOS4yMSAxNzozMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwMy4wOS4yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+
Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+IEBAIC00MDAsMTIgKzQw
MCw3MiBAQCBzdGF0aWMgdm9pZCBiYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHVuc2lnbmVkIGludCByZWcsDQo+Pj4+Pj4gICAgIHN0YXRpYyB2b2lkIGd1ZXN0X2Jhcl93cml0
ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkN
Cj4+Pj4+PiAgICAgew0KPj4+Pj4+ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0K
Pj4+Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGlmICgg
YmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiAr
ICAgICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+Pj4+PiArICAgICAg
ICBiYXItLTsNCj4+Pj4+PiArICAgICAgICBoaSA9IHRydWU7DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+
Pj4gKyAgICBlbHNlDQo+Pj4+Pj4gKyAgICAgICAgdmFsICY9IFBDSV9CQVNFX0FERFJFU1NfTUVN
X01BU0s7DQo+Pj4+Pj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZmZmZmZmZmdWxsIDw8
IChoaSA/IDMyIDogMCkpOw0KPj4+Pj4+ICsgICAgYmFyLT5ndWVzdF9hZGRyIHw9ICh1aW50NjRf
dCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+Pj4+IFdoYXQgeW91IHN0b3JlIGhlcmUgaXMgbm90
IHRoZSBhZGRyZXNzIHRoYXQncyBnb2luZyB0byBiZSB1c2VkLA0KPj4+Pj4gICAgIGFzDQo+Pj4+
PiB5b3UgZG9uJ3QgbWFzayBvZmYgdGhlIGxvdyBiaXRzICh0byBhY2NvdW50IGZvciB0aGUgQkFS
J3Mgc2l6ZSkuDQo+Pj4+PiBXaGVuIGEgQkFSIGdldHMgd3JpdHRlbiB3aXRoIGFsbCBvbmVzLCBh
bGwgd3JpdGFibGUgYml0cyBnZXQgdGhlc2UNCj4+Pj4+IG9uZXMgc3RvcmVkLiBUaGUgYWRkcmVz
cyBvZiB0aGUgQkFSLCBhaXVpLCByZWFsbHkgY2hhbmdlcyB0bw0KPj4+Pj4gKHR5cGljYWxseSkg
Y2xvc2UgYmVsb3cgNEdiIChpbiB0aGUgY2FzZSBvZiBhIDMyLWJpdCBCQVIpLCB3aGljaA0KPj4+
Pj4gaXMgd2h5IG1lbW9yeSAvIEkvTyBkZWNvZGluZyBzaG91bGQgYmUgb2ZmIHdoaWxlIHNpemlu
ZyBCQVJzLg0KPj4+Pj4gVGhlcmVmb3JlIHlvdSBzaG91bGRuJ3QgbG9vayBmb3IgdGhlIHNwZWNp
ZmljICJhbGwgd3JpdGFibGUgYml0cw0KPj4+Pj4gYXJlIG9uZXMiIHBhdHRlcm4gKG9yIHdvcnNl
LCBhcyB5b3UgcHJlc2VudGx5IGRvLCB0aGUgImFsbCBiaXRzDQo+Pj4+PiBvdXRzaWRlIG9mIHRo
ZSB0eXBlIHNwZWNpZmllciBhcmUgb25lcyIgb25lKSBvbiB0aGUgcmVhZCBwYXRoLg0KPj4+Pj4g
SW5zdGVhZCBtYXNrIHRoZSB2YWx1ZSBhcHByb3ByaWF0ZWx5IGhlcmUsIGFuZCBzaW1wbHkgcmV0
dXJuIGJhY2sNCj4+Pj4+IHRoZSBzdG9yZWQgdmFsdWUgZnJvbSB0aGUgcmVhZCBwYXRoLg0KDQpC
dXQgaW4gY2FzZSBvZiBCQVIgc2l6aW5nIEkgbmVlZCB0byBhY3R1YWxseSByZXR1cm4gQkFSIHNp
emUuDQoNClNvLCB0aGUgY29tcGFyaXNvbiBpcyB0aGUgd2F5IHRvIHRlbGwgaWYgdGhlIGd1ZXN0
IHdhbnRzIHRvIHJlYWQNCg0KYWN0dWFsIChjb25maWd1cmVkKSBCQVIgdmFsdWUgb3IgaXQgdHJp
ZXMgdG8gZGV0ZXJtaW5lIEJBUidzIHNpemUuDQoNClRoaXMgaXMgd2h5IEkgY29tcGFyZSBhbmQg
dXNlIHRoZSByZXN1bHQgYXMgdGhlIGFuc3dlciB0byB3aGF0IG5lZWRzDQoNCnRvIGJlIHN1cHBs
aWVkIHRvIHRoZSBndWVzdC4gU28sIGlmIEkgZG9uJ3QgY29tcGFyZSB3aXRoIDB4ZmZmZmZmZmYg
Zm9yIHRoZQ0KDQpoaSBwYXJ0IGFuZCAweGZmZmZmZmYwIGZvciB0aGUgbG93IHRoZW4gaG93IGRv
IEkga25vdyB3aGVuIHRvIHJldHVybg0KDQpjb25maWd1cmVkIEJBUiBvciByZXR1cm4gdGhlIHNp
emU/DQoNCj4+Pj4gIlBDSSBMT0NBTCBCVVMgU1BFQ0lGSUNBVElPTiwgUkVWLiAzLjAiLCAiSU1Q
TEVNRU5UQVRJT04gTk9URQ0KPj4+Pg0KPj4+PiBTaXppbmcgYSAzMi1iaXQgQmFzZSBBZGRyZXNz
IFJlZ2lzdGVyIEV4YW1wbGUiIHNheXMsIHRoYXQNCj4+Pj4NCj4+Pj4gIlNvZnR3YXJlIHNhdmVz
IHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgQmFzZSBBZGRyZXNzIHJlZ2lzdGVyLCB3cml0ZXMN
Cj4+Pj4gMCBGRkZGIEZGRkZoIHRvIHRoZSByZWdpc3RlciwgdGhlbiByZWFkcyBpdCBiYWNrLiIN
Cj4+Pj4NCj4+Pj4gVGhlIHNhbWUgYXBwbGllcyBmb3IgNjQtYml0IEJBUnMuIFNvIHdoYXQncyB3
cm9uZyBpZiBJIHRyeSB0byBjYXRjaCBzdWNoDQo+Pj4+IGEgd3JpdGUgd2hlbiBhIGd1ZXN0IHRy
aWVzIHRvIHNpemUgdGhlIEJBUj8gVGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGF0DQo+Pj4+IEkg
Y29tcGFyZSBhcw0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCBpZiAoICh2YWwgJiBQQ0lfQkFTRV9B
RERSRVNTX01FTV9NQVNLXzMyKSA9PSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLXzMyICkNCj4+
Pj4gd2hpY2ggaXMgYmVjYXVzZSB2YWwgaW4gdGhlIHF1ZXN0aW9uIGhhcyBsb3dlciBiaXRzIGNs
ZWFyZWQuDQo+Pj4gQmVjYXVzZSB3aGlsZSB0aGlzIG1hdGNoZXMgd2hhdCB0aGUgc3BlYyBzYXlz
LCBpdCdzIG5vdCBlbm91Z2ggdG8NCj4+PiBtYXRjaCBob3cgaGFyZHdhcmUgYmVoYXZlcy4NCj4+
IEJ1dCB3ZSBzaG91bGQgaW1wbGVtZW50IGFzIHRoZSBzcGVjIHNheXMsIG5vdCBsaWtlIGJ1Z2d5
IGhhcmR3YXJlIGJlaGF2ZXMNCj4gVGhlIGJlaGF2aW9yIEknbSBkZXNjcmliaW5nIGRvZXNuJ3Qg
dmlvbGF0ZSB0aGUgc3BlYy4gVGhlcmUgbWVyZWx5IGlzDQo+IG1vcmUgdG8gaXQgdGhhbiB3aGF0
IHRoZSBzcGVjIHNheXMsIG9yIG9uZSBtaWdodCBhbHNvIHZpZXcgaXQgdGhlIHdheQ0KPiB0aGF0
IHRoZSBzcGVjIGRvZXNuJ3QgdXNlIHRoZSBiZXN0IHdheSBvZiBleHByZXNzaW5nIHRoaW5ncy4N
Cg0KV2VsbCwgdGhlIHNwZWMgZXhwbGljaXRseSBzYXlzICJ3cml0ZSAweGZmZmZmZmZmIGFuZCBy
ZWFkIGJhY2siDQoNCkkgY2FuJ3Qgc2VlIGFueSB3YXkgaXQgY2FuIGJlIHJlYWQgZGlmZmVyZW50
bHkNCg0KPg0KPj4+ICAgIFlldCB5b3Ugd2FudCB0byBtaW1pYyBoYXJkd2FyZSBiZWhhdmlvcg0K
Pj4+IGFzIGNsb3NlbHkgYXMgcG9zc2libGUgaGVyZS4gVGhlcmUgaXMgKGlpcmMpIGF0IGxlYXN0
IG9uZSBvdGhlcg0KPj4+IHBsYWNlIGluIHRoZSBzb3VyY2UgdHJlZSB3ZXJlIHdlIGhhZCB0byBh
ZGp1c3QgYSBzaW1pbGFyIGluaXRpYWwNCj4+PiBpbXBsZW1lbnRhdGlvbiB0byBiZSBjbG9zZXIg
dG8gb25lIGV4cGVjdGVkIGJ5IGd1ZXN0cywNCj4+IENvdWxkIHlvdSBwbGVhc2UgcG9pbnQgbWUg
dG8gdGhhdCBjb2RlIHNvIEkgY2FuIGNvbnN1bHQgYW5kIHBvc3NpYmx5DQo+PiByZS11c2UgdGhl
IGFwcHJvYWNoPw0KPiBJIG9ubHkgcmVjYWxsIHRoZSBmYWN0OyB0aGlzIG1pZ2h0IGhhdmUgYmVl
biBodm1sb2FkZXIsIHZwY2ksIG9yIHlldA0KPiBzb21ld2hlcmUgZWxzZS4gSSdtIHNvcnJ5Lg0K
Tm8gcHJvYmxlbQ0KPg0KPj4+Pj4+IEBAIC01MjIsNiArNTgyLDEzIEBAIHN0YXRpYyBpbnQgYWRk
X2Jhcl9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgYm9vbCBpc19od2RvbSkNCj4+Pj4+
PiAgICAgICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmM7DQo+Pj4+Pj4gICAgICAgICAgICAgfQ0KPj4+Pj4+ICsgICAgICAgIC8qDQo+Pj4+
Pj4gKyAgICAgICAgICogSXQgaXMgbmVpdGhlciBzYWZlIG5vciBzZWN1cmUgdG8gaW5pdGlhbGl6
ZSBndWVzdCdzIHZpZXcgb2YgdGhlIEJBUnMNCj4+Pj4+PiArICAgICAgICAgKiB3aXRoIHJlYWwg
dmFsdWVzIHdoaWNoIGFyZSB1c2VkIGJ5IHRoZSBoYXJkd2FyZSBkb21haW4sIHNvIGFzc2lnbg0K
Pj4+Pj4+ICsgICAgICAgICAqIGFsbCB6ZXJvcyB0byBndWVzdCdzIHZpZXcgb2YgdGhlIEJBUnMs
IHNvIHRoZSBndWVzdCBjYW4gcGVyZm9ybQ0KPj4+Pj4+ICsgICAgICAgICAqIHByb3BlciBQQ0kg
ZGV2aWNlIGVudW1lcmF0aW9uIGFuZCBhc3NpZ24gQkFScyBvbiBpdHMgb3duLg0KPj4+Pj4+ICsg
ICAgICAgICAqLw0KPj4+Pj4+ICsgICAgICAgIGJhcnNbaV0uZ3Vlc3RfYWRkciA9IDA7DQo+Pj4+
PiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgY29tbWVudDogV2l0aG91dCBtZW1v
cnkgZGVjb2RpbmcNCj4+Pj4+IGVuYWJsZWQsIHRoZSBCQVJzIGFyZSBzaW1wbGUgcmVnaXN0ZXJz
ICh3aXRoIGEgZmV3IHIvbyBiaXRzKS4NCj4+Pj4gTXkgZmlyc3QgaW1wbGVtZW50YXRpb24gd2Fz
IHRoYXQgYmFyLT5ndWVzdF9hZGRyIHdhcyBpbml0aWFsaXplZCB3aXRoDQo+Pj4+IHRoZSB2YWx1
ZSBvZiBiYXItPmFkZHIgKHBoeXNpY2FsIEJBUiB2YWx1ZSksIGJ1dCB0YWxraW5nIG9uIElSQyB3
aXRoDQo+Pj4+IFJvZ2VyIGhlIHN1Z2dlc3RlZCB0aGF0IHRoaXMgbWlnaHQgYmUgYSBzZWN1cml0
eSBpc3N1ZSB0byBsZXQgZ3Vlc3QNCj4+Pj4gYSBoaW50IGFib3V0IHBoeXNpY2FsIHZhbHVlcywg
c28gdGhlbiBJIGNoYW5nZWQgdGhlIGFzc2lnbm1lbnQgdG8gYmUgMC4NCj4+PiBXZWxsLCB5ZXMs
IHRoYXQncyBjZXJ0YWlubHkgY29ycmVjdC4gSXQncyBwZXJoYXBzIHRvbyB1bm9idmlvdXMgdG8g
bWUNCj4+PiB3aHkgb25lIG1heSB3YW50IHRvIHVzZSB0aGUgaG9zdCB2YWx1ZSBoZXJlIGluIHRo
ZSBmaXJzdCBwbGFjZS4gSXQNCj4+PiBzaW1wbHkgaGFzIG5vIG1lYW5pbmcgaGVyZS4NCj4+IERv
IHlvdSB3YW50IG1lIHRvIHJlbW92ZSB0aGUgY29tbWVudD8NCj4gWWVzLiBJIHdvbmRlciB3aGV0
aGVyIHRoZSBhc3NpZ25tZW50IGlzIG5lY2Vzc2FyeSBpbiB0aGUgZmlyc3QgcGxhY2U6DQo+IEkn
ZCBzb21laG93IGV4cGVjdCB0aGUgc3RydWN0dXJlIHRvIGNvbWUgZnJvbSB4emFsbG9jKCkuIEFs
YmVpdCBJDQo+IGd1ZXNzIHRoaXMgZnVuY3Rpb24gY2FuIGJlIHJ1biB0aHJvdWdoIG1vcmUgdGhh
biBvbmNlIHdpdGhvdXQgZnJlZWluZw0KPiB0aGUgc3RydWN0dXJlIGFuZCB0aGVuIGFsbG9jYXRp
bmcgaXMgYW5ldz8NCg0KSSdsbCBjaGVjayB0aGF0IGFuZCBpZiB0aGUgc3RydWN0dXJlIGlzIGFs
cmVhZHkgemVyb2VkIHRoZW4gSSdsbCByZW1vdmUgYm90aCB0aGUNCg0KYXNzaWdubWVudCBhbmQg
dGhlIGNvbW1lbnQNCg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

