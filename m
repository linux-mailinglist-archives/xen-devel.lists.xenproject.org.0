Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA1355649
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106021.202735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmUk-0006ur-AM; Tue, 06 Apr 2021 14:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106021.202735; Tue, 06 Apr 2021 14:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmUk-0006uX-6K; Tue, 06 Apr 2021 14:15:54 +0000
Received: by outflank-mailman (input) for mailman id 106021;
 Tue, 06 Apr 2021 14:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IE8=JD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lTmUj-0006uS-63
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:15:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f872aea8-3ded-40bc-9a93-0e46b7f58e19;
 Tue, 06 Apr 2021 14:15:52 +0000 (UTC)
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
X-Inumbo-ID: f872aea8-3ded-40bc-9a93-0e46b7f58e19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617718552;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ER4oR17/AkZSKVJPBnNqYnNSd1fVIJuJvs2zTTakA5w=;
  b=aIuHy35XqnygUtgAfMsph7/XDiDx114TRSuArmQxpE3aiC+iKDupqgGq
   10PYUlVtDcnGrrU/opnV5hkyBdCqhS5Oz+1lYXY/qBuH5w6BA51BscJlD
   /6sYtgzLKiHE0RBvwcpp0MxpQtnBMiHmDq0q9uySD1cPeE1Na70m7BuhE
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rMFTEDbtD/ptlWlFCdYgnjH2p589hacF1Rd1TwAXgWBeS45RNwIkzP2UuuNDUgu75ybkYerxpV
 nQDn5SKazEo3leqHmFEQUhoG5ciGuOVJPiVZKwt8aZnm/b6h2OXe4iv4n7iPYgRFJ1Bky+QRix
 TBlSzLObIhckFSOdwan1VuMYuAwHtYjzWjJc27UiAwZbHcMhLXYRydnoI8TfxVYupUGL0U04l+
 1j2WPVeFcAsk3yznOPzF4CmksozC0wwhiBEZsDMC2l1YxocPjOz8mUv+tBG7a6jyFXUKaCg5q1
 bak=
X-SBRS: 5.2
X-MesageID: 40832508
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yjkD+q+P8fYUuiKFp1Vuk+FRcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUfD38Zn/+
 Nbf6B6YeeaMXFTh8z3+RT9Nt4mzsWO/qzAv5ak815GZ2hRGsJdxi1+DRuWFVAzYQFAC4YwGp
 b03Ls8mxOLf3MLYsOnQkQURuSrnayAqLvKQz4jQyQm5g6HkC+y5NfBfySw8x8CX1p0sNAf2E
 fflQiR3MSemtG9jiTRzmrCq6lR8eGRsudrIOyppowrJi73igCuDb4RFoGqmDwuuumg5BILvb
 D30nEdFv9+4X/QYW25yCGFs2aP7B8U53Dv0lOei3f4yPaJPQ4SMdZLho5Sb3Limigdlex8y6
 5C0ia4sJdaHHr77UDAzuXITB1jmw6Ip2Mjm4co/hlieLYZAYUwkaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzsONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4ErRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9FIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104D2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6kiqX3T/kQXAQn+FQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9qosfE
 V/J7vjmrihpXa/+HvJ62kBAGscMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYgNkQ9jOCw
 5ZrVRv8aexJ5idrBpST+6PAya/tT8+tXiKR5ATlum//s/jYIo/FYtjcrd2Dx/3Gxt8nhtKpG
 9PZBQffFLWEirjhMye/dspLdCaU+M5oQ+wZeZItHrUtCyn1LwSb0peewTrbOm6rkIFQSFOil
 h47qkF6YDw5QqHGC8Ym+Q3MFpFdWKNJqlJZT71KLl8kqz3eQ12UGeBjSGbjRZ2YWbx60AOnA
 XaXFKpUOCODVxHtn9C1KH2tFtya2WGZkp1Lmt3qItnCA39yz9O+P7OYqq4yG2KbFQehukbLT
 HeeDMXSzkesOyfxVqQmDyYE28hyYhrNuvBDK47e7WW3n+2MoWHmeUHGPBTlawVQuzGo6sOUe
 iFfRWSIy69A+Q12xaNrnJgITJqshAf4IHV8Qyg6HL90G80APLULlgjT7YHI8uE52yhQ/qTyp
 12gd88oOPYCBS4VveWjaXMKzJTIBLapmC7C/slrp1Zpqo+vrp+FZuza0q96FhXmBElaMvknk
 IXR6p2pK3bMoh0ZsoIZmZX+EEqmNnnFjphjiXmRuslOVcjgH/QM4nXv/7Gqb8zDlaAowW1M1
 +F6CFZ9+rEWSzG1bNyMdNBHU1GLEwnrHJl96eecoeVDgOgfeRK5kC7PX+wa6U1ctnxJZwA6h
 Jhp8iVlOqWfTfi0A/evTFnMrtDmlzXMP+aEUaJA6pU6NS0NlSHn7uy7MOyhDnxTyGna05wv/
 w3SWUAKsJZijcji4Ur0i+9Dqzvy3hV7Wdj3Q==
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="40832508"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIAPgDs1QTW0MwZezha8UZ599jclBe8AgIrZZmD3sc5wR9SEx86Ce9QNtlZ1rn5rKAuY1hCo2y5M0VfisPUHnbu7vk1WvSuLFbYBDDBXxyjnRhNL8MmmJ9zKDo2LsZWfvkLMp/1rwy2+HPQBTV5uvd93B357VXElqER+obATQbA2tiHKYJNu6icGMrroxiWoKOrw5+RpMuDiQbrBnCrUoJW/zdkviu5yoe7RoKFTgTspP2YWTxtzXkExVL2tD8OWO0qMZIOGjRVBHRJzZMaVcpUxSIOQj2Flykef7FfJes392fdLUmowGVwzYT49FHgwQvwy0pNxWm8ALz0eU80Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER4oR17/AkZSKVJPBnNqYnNSd1fVIJuJvs2zTTakA5w=;
 b=jk0maNPFv7mqVqJ+UXnU3OOdCm/IgYvpkIs7YzyqEDQYkNVaFQgHZlnz2pfIf9uU33qwCsyIhO1JEI/6WNmkESFq7Ztw3NBlTGiuMGYONVnVBJC7JEywO1NZZtJwfpiSr07zgtVC9xBH8ao6hrz/GfyEC4UdVPm3+3jseQo3+X2fB13r+3E1Y3UOcnYLW9ZxgQG493j4tp+WDxP8ldWt48wAg3W1dPz47i7fD3JiYirBYVQRPlTqm9ST4+uHQ7+tl/XBd2ARrr+cS/z7Fi0krpk99A3wtJ5NHo9pxKXqGmLrvN9tFKxP0NVIOL8i7QXToqBf8nT+6opuwq2ZwylUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER4oR17/AkZSKVJPBnNqYnNSd1fVIJuJvs2zTTakA5w=;
 b=xQ0K6EeFwwKeQHLAMh3DjU7okiCqm0m2OnSgJgiQJCWRak4W7SW+P3Vsuv15UZwiLG6Z72HWcgrYBdKWsO6PextJ1fyL4/ITJqYOspqRr3QOfoGlz9lmxUW/1jX9rqQsy7ZnlNRPw+ilzRJLLx+0scgjqAaSo0x1lNVPc7gTLMY=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 14/14] tools/xentrace: Use const whenever we point to
 literal strings
Thread-Topic: [PATCH 14/14] tools/xentrace: Use const whenever we point to
 literal strings
Thread-Index: AQHXKjbX0++oj7YoP0KCrVGPVwIu5aqnij+A
Date: Tue, 6 Apr 2021 14:15:48 +0000
Message-ID: <1FD9E4DF-2F95-4470-A032-BC9E93337B1D@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-15-julien@xen.org>
In-Reply-To: <20210405155713.29754-15-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f4a08f9-c888-41ae-9585-08d8f90679f3
x-ms-traffictypediagnostic: PH0PR03MB5784:
x-microsoft-antispam-prvs: <PH0PR03MB578455412C882EC33640BE2699769@PH0PR03MB5784.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTlioYLHRYaXeRtuwnwjw2hdLGILQU1z4MTnWxID0RkV5mnA1DRGnomhjA4n4j/1lF74j7+cWjljTNDzzVhdP8ZlUVqi7q7EQ42n9BOnbeucSrGdLYGhHOEYlTNP3/KGEkL+8rPmHrAG5oAEegawnA0eThNA+VmoNfWTq8kZhmBsejgs7qkG365BUKBVhWBU0pLwsAYRflidDU8H/5WBbuoKTvJGSIzDdva67ZewCUjIYBHUjXHwoNK48E0yzQWohx3AJUPwEgYMm2PV0ExqFulIrS55IF4Tu89hnv0mm6ktSAF4kx8RvX5blz9BM53MVGMEzLYaHS3PRYC0CzxlcaR4vLFliXSGxUbR9IYak10RI6+L17SPl60cAWf9nVvA3CC8IrDPjIWD7pPQogPiymQwPnp7zLBl8hKkC0+yBtVDoJzQKZ4QVuKZoPf1MrrPjnWsMcu/HCFlmgFU9cN5jRYXvVCsDB6QFoDgmd/tw9aUBe6SgMWoO4ZWDmbJUAxYL8n1oiPwOBxwZcviHzcZ3Z8SydZhyz6yRNgIHQkyFRP5g5klgH64fMuYK2+sobmXrKi3fAE8bMRekWnloUBhwrQpS4EUbuOv8K86ugNXdlQV9ZdSIYa5TBJ933x6h8zP5YxgF93gtQvL7LCnwXQ0c7Q3FfycdxNcSdai+7pOvShyuZvjm61wj4vDZqhAQUWu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(2906002)(6512007)(76116006)(33656002)(558084003)(8936002)(66556008)(36756003)(66476007)(71200400001)(8676002)(6506007)(53546011)(5660300002)(66446008)(64756008)(91956017)(66946007)(478600001)(54906003)(26005)(4326008)(6916009)(186003)(86362001)(316002)(38100700001)(6486002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ymB1GNTw2+eAZpnZeWCkBJADZFdp9P9hE8mDMNmT2mNNxFie8473CFAs5hbH?=
 =?us-ascii?Q?gT5XDt2uRA6+yr05t/fjUeRBm2Icm9sRYu15KNRHR412zGjUhG74bRD5m5UF?=
 =?us-ascii?Q?YyoHG5N/2XSyF+xQB5JPBKK3YGHsnBBYiTy/xXBdGRIdJ6W2oUyMhOK1HbRp?=
 =?us-ascii?Q?o9j4VN+Rg5JUjldBG5VeqkAyW1v8CxRKc9z3osgeRTuqaRRBKotOGSRL9Kbw?=
 =?us-ascii?Q?m8zh5nK0FUQomdAAURbjc4cZBXykN2BNSvZQz6u1srfr7JRJSz6maBJgLBYV?=
 =?us-ascii?Q?LifwrFxUQkyzpnp2lJERkv+Mn9SV4SzUoBWSYgwd0jYCvVyVwgIkVq1zfLwd?=
 =?us-ascii?Q?5VOekKRBQ8XzvYIa9FLgdafVSrgNWhvNZLUuSErE9ld4xGvNpK8FCkTzHdig?=
 =?us-ascii?Q?FgJKUZynEw2szuQrTyx0WJ8oZTqBTImPQrttBvblc++N9ZZKZPjxsnKz96Zb?=
 =?us-ascii?Q?G2QO2+46AzKCml54bjvqIrUrI7E/b1GU/Dw3wON8ulOxWT0zCNBBwwD8IGX0?=
 =?us-ascii?Q?eaXJFiHKoDtgWN3noXvPJY+tmz6chcMhiYNLXH9ayyFb6Oa7SpO58VTdrG5Z?=
 =?us-ascii?Q?El9JunrjnyBxWxRQg3X1hnD9XH3tHgUiWVq4PxhG4lqD5JmkaRUZzkpebb/7?=
 =?us-ascii?Q?1DrwKpfydiCFB3ZrCkACkU5O/SZ0MMLn3n/Jr77969VlVgUv44TYQcG9RtEx?=
 =?us-ascii?Q?zVymZiWBsGYnGCYp6XE/eDLV6hHJBhIyNecFefc9zqBD6zjlvh7LfHpRSmnE?=
 =?us-ascii?Q?3CQrbQuInH/VQ/CLot+ZIwbzTNETM8kwcccFBCiQe0Qp1KwwfUAlBsgmhvDN?=
 =?us-ascii?Q?T8UXYqQdKikhtC0UOI3il0PSkeHxFhboASVWI0BMRThM+TxQhU3U3LWseewu?=
 =?us-ascii?Q?LMnKxs6djtrwObruW6SnPc6ACdRmLwKkQivwKMY4fEYAcJhx4sa4PEyZpWFR?=
 =?us-ascii?Q?u6QMMkwlk+xATSaONOzgbMrTu3SJV8hqfnyPIQYpj/WCydadzRpVeWvQBy4Q?=
 =?us-ascii?Q?ZSd2zo4hoVaPkKGN1J6e5icUPwsIx/GsWGOFQTVuE6cdZUvWMm1ru7l6zS1j?=
 =?us-ascii?Q?JuJYP/C6eWbNUoQob+XxDRz3J+62i9BWJz38DVpTeA4/F55fLV9ptFtr4VOw?=
 =?us-ascii?Q?bgciPqZW8iNbgwSmAgme29p6Tgo2fqiPHbIoE96VPkvckx/tIElH32vgemgJ?=
 =?us-ascii?Q?nTUkDQsTdrKgVRhIodwXCM04YORzRfPXIyR7meFznh+eL2RWSRBbe2COU1kY?=
 =?us-ascii?Q?AbjfmHt/7FBqv6hA187Jn9PaxoMD1k4lkWQ+PTRNoWXYd43Yu7A5YRgk+Dli?=
 =?us-ascii?Q?EpqN+fKcPYlSNjPot1WTUUb/KPl/0cooWADJ8+f4dRxgrQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7401286A74769440A7B0CB9B3836771B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4a08f9-c888-41ae-9585-08d8f90679f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 14:15:48.3245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSDMxG6wE7qCMp4HvpVjzke7QOLoT9JXlZBCva5zuHzOp33gcN77LXMXd1lcDI/244e8RLjvR3xm4WXAgjQQqHmF5c3v5WJU2lgnv3wnk/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5784
X-OriginatorOrg: citrix.com



> On Apr 5, 2021, at 4:57 PM, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: George Dunlap <george.dunlap@citrix.com>


