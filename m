Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1353ACDDA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144718.266340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFmX-0007qZ-DS; Fri, 18 Jun 2021 14:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144718.266340; Fri, 18 Jun 2021 14:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFmX-0007nS-94; Fri, 18 Jun 2021 14:47:41 +0000
Received: by outflank-mailman (input) for mailman id 144718;
 Fri, 18 Jun 2021 14:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luFmV-0007mr-OB
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:47:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17314be6-aa6d-4aaa-b5b3-b4b5b6a9b25c;
 Fri, 18 Jun 2021 14:47:38 +0000 (UTC)
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
X-Inumbo-ID: 17314be6-aa6d-4aaa-b5b3-b4b5b6a9b25c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624027658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kG9rzPAvPGzHSSrl8X6sRybi5+/0Q8y9f2aJQljllrY=;
  b=RqpnSk/Ps5js/8GUhkVwQ65eYaLD6Xc4UydM29QtUEzdxkn3fkreU2W1
   s8PGBPGpUvhaqGj4IGSxVFLRdQUkNzXAHrCwcCstO9/U1HKQSKy1ByPH3
   sIXBrYLDZVGo/e4Y8RksCwVdnXHdofzcsEo5Na59P5iBN122Jymh3AbF9
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2agKAxDxVJPFpRadOz91ApZ0mGCD8wA7G+/MLn7jgTuQa61l6NHqSQh5h6wzUwLkmqBKD9RiGf
 kZqJGotQM+vE3OSnc4MXYbn+ovAZo4uOvlhRuxuuLY05woRkYnYun4H2sZRPJZgCfT7uJJaze2
 TV/l6+H0vyodPOnlgjKm+2qUXu9WprKs/3hPJb3vFvAGCh4z4JtzlF8QuP/3PQj13xjSdOIGJO
 i17NlPoyTUb3kaTtpv1uhueihN43XiIl4nny6cMnwZFXoDWD5rXHupG3gfggQldHDcXTNbiTSi
 tcg=
X-SBRS: 5.1
X-MesageID: 46467554
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:D130B65ZxoaMxQFltgPXwXiBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3Jmbi7Sc29qeu1z+803WBjB8bcYOCAghrqEGgC1/qi/9SEIUzDH4FmpN
 9dmsRFeb/N5B1B/LvHCWqDYpQdKbu8gduVbI7lph8HJ2wLGsJdBkVCe3ym+yVNNVV77PECZf
 2hD7981kOdkAMsH6KG7xc+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K11jDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy+Azd4dvfr2rCou
 O8+ivIDP4Ds085uVvF+icF7jOQlgrGLUWSk2Nwz0GT/PARDwhKdfapzbgpAycxrXBQ4+2UmZ
 g7rF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuJYO4PeQkjTNo+bo7bWnHAbocYa
 NT5QDnlYBrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd0AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOla2XkVwzvdMPcb
 H6IR1lXEIJCjbT4Py1rdR2G0r2MRCAtBzWu7ZjDrZCy8/BeIY=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46467554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USj+ZEZUBKxt2/nkDrFPU6Bp1tMETudyn3jooOUqIwWEP/13KhRDSC0aB3h6NnF6rfOs3N5Qz3/G0PgURwjXImV1Efak31fQqSrF8wjcNHZovHc3Ktcc8QEEDA433vDub0ZBcwy4Ww+STE2h0/P6DlJ6V78FTsT2iBqqsKt6bj1Kb6QJV+mN6cFqWXsS1e+DLmzEnGAUbEUnJGKH8ZvP3Qzb+MSHuXj4LHS4ay93upLItVwJT1jxMR+5LyLYOpyxxwdxLMMETSKzcc1Yg01uCNLmaGqfsXQ35uckLvcHwfdeoXimbdZS0/WYu0QXvRiBjo3nKenmcalwzXCLqVWoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG9rzPAvPGzHSSrl8X6sRybi5+/0Q8y9f2aJQljllrY=;
 b=FCKFO+PHWyUGb/nSru79e5j3mJULHj1W+fRlV+bnEe7BUNdQGLpa6lKbTa7gT806eE9rLZ/ObsRXlQoVMPqDT3c9YWK0wm1AsJ0WmWrKGa+V15NUyxPGmqkE3vbgxGYVtZS1jo/3jlQwkvhCsDmEkaRU/iWftQCOaVjheHDT0AsPUB/MYlhaaT6Y+noOlR9OwZqS3pNu6R6iiC2oobUN15v4baaL8XE5wjlYDSlaoRm33PUCtsm9U+BlYGd2FCeC5w4ci7AA+uCIj8QIvC4z9KpptatBzqfrHQtYPL47D0V+jHFug/xxUSQMRRtkDy31ASNN/Gp7iaYM/A6EvlMozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG9rzPAvPGzHSSrl8X6sRybi5+/0Q8y9f2aJQljllrY=;
 b=oc/JvuPgJz1FyegSJtdrCdrBAMq5/QANWGuUuT6Bs0GQWZT1kbySQyv8ox6bLWSYaRkxc8UjoMPB7bdfCoZ7RvjJabEqJ79ODrYIvhwanhZldA9/xSt4YfGRaNCp0tgBznhLikqaqcazKrRbldLpSnlnphgJqZY6/d9tpcGn3q0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 09/12] golang/xenlight: add DomainDestroy wrapper
Thread-Topic: [RESEND PATCH 09/12] golang/xenlight: add DomainDestroy wrapper
Thread-Index: AQHXUNyz5vfbQ7EqBU6xbVFGrQQgbqsaAASA
Date: Fri, 18 Jun 2021 14:47:34 +0000
Message-ID: <4229142D-38F0-4ABB-A509-6E629677948D@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <82c68547f4cec1c82132cd6a867696f4b38dcd3d.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <82c68547f4cec1c82132cd6a867696f4b38dcd3d.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d06ba65c-8cd2-4531-7655-08d93268021b
x-ms-traffictypediagnostic: PH0PR03MB5752:
x-microsoft-antispam-prvs: <PH0PR03MB575211A75A7263F4F6347D09990D9@PH0PR03MB5752.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:38;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PEK9z0XRXeIwaLcHS2lwS0QYCk9w7P/o+dTOmVeJv4dmK7OFOdN7hUc5J2w0raPizOuI1G1ExoVNVpwqyh3l4cwT5bpO8qwXudzz+0ZcCkkhrAaoWiKSXBHlhpEOG9+L9riem8NRpwyktlqpco+bTBfPZIhQ08Ew15tLIFJjriHCP4UbeXDnU5CNUEYlelzJiAQzXnqqVg9PEP1lh1WXlaWRP1CSi8gXkLvE80vVN6OLgksjafGusXLOQ+qWWKUKBhscU/jwXCcVqyfPWwoB/uICFhFm5XOxIr5+AUcAFuQkLrGn3imCoRAS2k+8rUqVaZcgNXwzX5EHd8WX/EeJzTbzwCIUSwvkY4M23DSwBMv5FjVYEM5Y6GUnxcwKCxYN/Iegh3ChMTW4usO3hOhOZaIhpi5IzmcB1RPeDVR+83ESsGrMwbQzNEilsWONwdUE+3XfHiuQjIZDPGAOzH0CjBlvuvsh0Qs1f3LSRvgzjFDNCKSUYYwfAAwMmnSFvkfi1XNVYb5pdrJxtltX/t7pjJV+K6v3fbEoJ/RnsuvawDvnLTF2kmm+sXRRch2LgS/Kab26v278wArhLSsKUS+UG8m6QHYRKkEaCZJ1iBnoT0eWt4b75Ek8fCccDDpyHK94a2ARe+zuxfH9QezBMBt3NlCWMI5yS8HBJN2Lu4tquMw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(316002)(122000001)(36756003)(38100700002)(71200400001)(66556008)(33656002)(86362001)(53546011)(6512007)(4326008)(8676002)(6506007)(2616005)(54906003)(26005)(478600001)(6486002)(66946007)(91956017)(66476007)(2906002)(76116006)(558084003)(6916009)(186003)(8936002)(5660300002)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LzEa5L+u+D6zEmOoQkmXkMdZsgIuOeVmy2n5tqoR2SJi+ud6feHjeJXMKL6C?=
 =?us-ascii?Q?AJu5qyMqz3Ai+JlqtMo06oypnGlrZefY8BvWljf88QUrioHr0L+paAgBepWv?=
 =?us-ascii?Q?GOHYTiRJilwoBEFyW4wx9EWFYh7qp++N/oumlIsrAL/L5UnOaQj9kxxSrIbG?=
 =?us-ascii?Q?ZtKyuEhCvW1dq98xA/N6B1zydGJCwi9vLZ9XGjPGjxBuWfeFJ/amHGyfs008?=
 =?us-ascii?Q?u6ZqbAokdeOJb74mYyiz7HBBZh6MnHsboDh4n8Rs18d1TM+WpM+DCdHQszER?=
 =?us-ascii?Q?CU5LUbJ6+Xnx2CuIirk/AgDhKkMGHXzqIELqPLFyg4yDsdULqKm2A4GrLf8l?=
 =?us-ascii?Q?ahzTPXGSTMsCS3yN0sczMNSMXMY4acU2tKEhUV3EcMw0nC6QuqvlGgONRl07?=
 =?us-ascii?Q?ZzqFnRivzByyzQlfohTFfiqHEEFGxhzV+6fSJ5P0U0MwpPv7sX5tl5PKFWT8?=
 =?us-ascii?Q?MaO+L4fygyFt6hswxeICWa7AnFMcsIcIXQO/FeySvZrNo6oUq7KuW0BcDG4v?=
 =?us-ascii?Q?UWJDZ5bU2rGQQyVwVLSZJc5oQZ+MlskMdDmu26UgVSh5M9AsGsrHUunDrY5O?=
 =?us-ascii?Q?rjVRYvjaG4tNBFpJJys3PlMOxXh31tf1wEfeafpL1FIesphDs58GJApzlNad?=
 =?us-ascii?Q?Hy5vsf06apmALWdSOVv0VeNSSSIwIn+lXB2JgtPhM8R6ogXRi39ZqVxrW5KT?=
 =?us-ascii?Q?W2L3lvvbtAwJ8kW9pJj0R7xf11q8LTEJ3dJkNT4eMESNjYwGa5t/u5rY1CGQ?=
 =?us-ascii?Q?8Z9wN+AwlXReCz3uDUkpmkFk+dNGMOzaa4Kiu0stQ5uv7NKrfsYDypl0ZL1d?=
 =?us-ascii?Q?Jm9KgT3izaYHoHCrOt/zZSIoFigLlcjH/v2fI3BBJPNmFGNtAaJCJO1kcCbg?=
 =?us-ascii?Q?8Ni99jCl+dQffsyEhVBg0fGQj7yeFPxVNBujVCcpkjtCFh5rzMmDTG8duvKY?=
 =?us-ascii?Q?DbNXddEenKt9vln8VzVyFFDfh4z+U8X62heCYuSkX/pfbzEfD0UM4N39apw7?=
 =?us-ascii?Q?i+IYoFa3rvyGkq9esKjyiPtBt66/W0BifvdkTc0VLyZwys4k+OwkhPr+2/Rm?=
 =?us-ascii?Q?6BE3Qt43Zyf3SJXbw8Wt9Quuzq1fpR1S6dkKzaJ+G1m1V1JV6SmykCdSUunx?=
 =?us-ascii?Q?ah8b7sM7f9GzYzp//+c+og7XXrTny/ZEFNECBOowbnauYXM7woAzR12TzJSs?=
 =?us-ascii?Q?L79P/eDPfCAJkQwldF+NLFnVEOdX5/1iQNw93fRlB5oJF04lpojLlpemIHDY?=
 =?us-ascii?Q?RyiUZytsHSw9inhOPDxFBdZi+klzMSj7n1F8kU/yoNjBwM/fgaEFyUmuOk9a?=
 =?us-ascii?Q?IFwNz4/mdnvUa/mVtuY83jJb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F082F9431F086149A96DD99358AD4D61@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06ba65c-8cd2-4531-7655-08d93268021b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 14:47:34.1733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yTwI3kkUAR1TYJdnuc1MVXwSuSRHLSzD1DfPx1Jsu39AwYs8mOP8FFAqLlS+JB9Wbj+37lTyV1IQAArGnPzY9Aeafqm6M+kCARePpSIfGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5752
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add a wrapper around libxl_domain_destroy.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>



