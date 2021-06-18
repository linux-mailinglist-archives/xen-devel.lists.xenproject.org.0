Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D43D3ACA14
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144500.265958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCq8-0003yl-HN; Fri, 18 Jun 2021 11:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144500.265958; Fri, 18 Jun 2021 11:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCq8-0003vz-Dn; Fri, 18 Jun 2021 11:39:12 +0000
Received: by outflank-mailman (input) for mailman id 144500;
 Fri, 18 Jun 2021 11:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luCq6-0003vs-PL
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:39:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da22b60d-f373-403c-8cda-5e3b22250203;
 Fri, 18 Jun 2021 11:39:10 +0000 (UTC)
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
X-Inumbo-ID: da22b60d-f373-403c-8cda-5e3b22250203
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624016349;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1e01jVbFGNo3JnTOXqXUg6nUfbCM0wi1qcRNy2JnNCU=;
  b=JZkSzdGm0ElyAUY6zTXCsKwDloLPRWfW0P1NWQjc/ODr8q0znh29EzU2
   C3TfoBi0WDi+CHcVn0+GfLAoyreiW1bQ5zcyKj0PrdktYZnDhEl1eb/U9
   OOu/cdm1HOe+5+6pGHWRE1Gzx4mfZ2RmzgTgzxSZiLqppHlx/KoC3MrgF
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AspYnF2utBZbfS+e1l7Naxgf1l1qNr4F9ZA7j0xwLymAxAwoZ2vNdracm9J8bGgoC5D9tZ5+Dz
 RffKtWw1fzSnVruxe/2loVl3c6XCPqke5Xv5nJHz0BmaI30VpPIVimpJo3hzp4v1mjfFJzvGtw
 8XcYNNTcQPR+bu7/OnlQPnQbXXOZvQxwLdylPHTV3lXizg/HHon/6nO1SRwamdnBlGijSOvOo0
 2qI00k9z+mAQvw7gQBTndEvAtGO2Y4FqHxuRfOD4pLMjEgg5lhOBodfcwVLQs6alszxEOScDwE
 aCY=
X-SBRS: 5.1
X-MesageID: 46437334
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YEordKrVdd8BtgT/plenJzoaV5tuL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb+OxoWZPwOE80kKQY3WB/B8bEYOCLghrMEGgA1/qB/9SDIVyHygc178
 4JHMYOa+EcFWIbsS+T2njCLz9K+qjgzEnHv5a7855Yd3ARV0gs1XYNNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dnbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1XhPlfontlrcebau5J+7Y23+74owwzX+3GVjVFaKvW/VDNcmpDe1L9lqq
 iBn/4aBbUO15rmRBDFnfLc4Xic7N8Q0Q6c9ba5uwqRnSWrfkNJNyJ+7bgpDCcxrXBQyO1B7A
 ==
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46437334"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzlK/NakN49jKolvkIXGfNVdz+5i1/fvWSQo+O/LIQWCiTzZQ+/ePH9CL9PFb30eGW0GhXqfg4U1Hz9ra4+n/uOk/QnWe3GB87w9NwxVnrSiMi4cJpmC56tGytBgfctz/cENhc4j99RUIQNB9EEZIDlCj+VtCKZjbFxsnc1M5oCp4Zm6s8UraeLmuL6oACMnG9opEFBCMvPVwVfzyXckkAu4i95oAVla9ig5iJAKF8Z2QFrBSUQICYTRgdi2qwaINk9em3GwU4GhEl0FO0ygedX61TwK4OSZt1GQik63IGTlXBM1tW2YKVG+YMx7snbBvVE4C8Ik8MVLN+7IMRVXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+u3PV4BdxAtT+HB9GvfGK6f6I2qOpbhQxhuR3qMc4c=;
 b=Q5SysDqYR7y8l1syOH+BaPAwX6saAvSPLGZPub+dz7U6X/W2k7OiDz3WhRGSSAnfT70L+pBAH6lnWeFTzZv3CA2thIGiABsCcN6pnuaEE9CgA9kiwr5qNxMaA+y58tGVKwEhnydsXkd6DBv6dQrICtXC0JGTm0sc/OJLtgyKh1RAHw4rldft/6c0aQynLFikJNBVPPevtgCzzGjeOrRTQdSM/jHKb58WMZ2nUTGPXCWguHrAPB8Gfxwrs5mybopyn5CvnCECGNKioXVVg/uhpdCQT7UL6eZW/BwAuYXqxpe4LDT0UIKqvvL5e8fNRdYn+QTopy2ATsthuSdXvDsFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+u3PV4BdxAtT+HB9GvfGK6f6I2qOpbhQxhuR3qMc4c=;
 b=M6tztpz1NDheZRUzunAsNfSWZ0grpTlLnjHWPqnzbnkxApUIH26om08Em35iOf+VgtbbepHDTRH8O/RPztv1w7XdLW3CmvD0v8t3rOpS+IwwnYzlujeJtdzXHN4XtVALMImPN0OaI0xLwetGHdtDMGoJxGOBcbrbH4mYpadOf/s=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 06/12] golang/xenlight: rename Ctx receivers to ctx
Thread-Topic: [RESEND PATCH 06/12] golang/xenlight: rename Ctx receivers to
 ctx
Thread-Index: AQHXUNzF07nShyBlEkWr3AI/MqKPx6sZy10A
Date: Fri, 18 Jun 2021 11:39:06 +0000
Message-ID: <413F7924-2A8D-4BF7-AED5-36AAE1A860FC@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <c1f7b48068d3855f48f818d93ddd23638a0f9f70.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <c1f7b48068d3855f48f818d93ddd23638a0f9f70.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64eafcd0-b05b-477f-2db9-08d9324dae7a
x-ms-traffictypediagnostic: PH0PR03MB5734:
x-microsoft-antispam-prvs: <PH0PR03MB57343FAC16B4C5C36A1F58E0990D9@PH0PR03MB5734.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9qMDuMjfXHOy3lyfJZU6j8xztYtdi0fSxYPE3PqgX+RCDT3ikh06RSqDdUMszympblvtjoFUCFUbyMcaruDItRRRT6NAIaB8Q/x03Cv/etSwe2ObpVD5CKZmAC6IbttzWkWjn0aQdL5nPmJhHFeotFl1eGtOzEOguyusGB1oro0omaD1+Wz6XLUVc+5s1JyMSxer1p3RP65pFJW8wuxATbDgK8LfubhmHZqrx1nkQ1Z3CeoMvy8VNLqCaQnUfRJKpGvfJNDC7Z2qIEoiH5E+fLmyNezLR3vktMe4RgjVbXUwINwvEevychs9Dqu3KKCL//deC2zwVUIMwrXoDPdxXJSo7Oj0QCN6+I7pomCw4r8TeTOrCfqg7zShqEjo232F6H/o1BJzzytYzNmNTiGpnhgfP7O93qiy8FW5rHXc5TP76mt5DMEaA9GaoiIAEKyZIuE9fIGqkY6BSPIDhjHruDX3mR4tc8F4CgJ1QX+Y91frJssnOIi5ltTLTMOSHYHCGT4pb7x/dLuBK0FeAlFC/zbxjDzVAYDRzUrZ4BWey/sqxgJMAw5nRRjH+UdXG40+E5ztfoBZhkvMpiJMmgGbIdOhqUHQIvbVUGaVA9spVZYldR3hMS/BOYMkgrYYZzfkTGbKwOedzpraxTZKLmMZk2A5G6YKUUD3xn3l4Xt0G0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(4326008)(186003)(26005)(478600001)(86362001)(122000001)(66556008)(38100700002)(5660300002)(316002)(2616005)(54906003)(64756008)(91956017)(66476007)(4744005)(66446008)(6916009)(6512007)(53546011)(6506007)(2906002)(66946007)(6486002)(36756003)(33656002)(8676002)(8936002)(76116006)(71200400001)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aUmdzhA2rtmN2vrn2pngOhInOPPxP4P0ich49Z6LajqYQX09GTfVJ64H5IQX?=
 =?us-ascii?Q?Qjtk2AoaORo1iRj4JvDPSYMtt6weOh2O77s5WZo32/fniFdGEkTQ+d1SUmno?=
 =?us-ascii?Q?+ghNzVynVGctwbHkBggTBZzhQKvkIEkF8W5n0vdCnINapR0lOSSBq1dmdrFz?=
 =?us-ascii?Q?Bd96AE8qs7/ULPUKYUCKpwmYVlIxMkuh7xvVA1AP9OlRFWMC5hXKJ16ilTq0?=
 =?us-ascii?Q?q+9o9bYnEfLkNp4IA5NhAx6TbmjLbbCF6Cr2X9V01bCsspkj6JScxmONHRDs?=
 =?us-ascii?Q?SzGCyF4LOKkicx7tcLOFcvBZN6Q17p4XrdURPGYvHK7GraDumbp09oEr3Kbe?=
 =?us-ascii?Q?RYRLn98yuMIpFTEyDKKzg1hJ6CH15MKq4z1nMyqr59zeBdMDe8CZ7nr7MLwr?=
 =?us-ascii?Q?ycI8/4KlZM8LQy2wu1ILPmVDR2DlDcNV5HYjeDwI5uS4Zvl2Yb4SKYuYWfZU?=
 =?us-ascii?Q?9EpbACRvbeLesJx2h5jO36QV49qyhKGraib3drI5u7P7qGLi1o2zSDFR2h+a?=
 =?us-ascii?Q?BGfAlKPyFio45hiPIwhr5iSTTYq2lOpd052LwxphQ/0Twxb5M89fZoVbipbN?=
 =?us-ascii?Q?sE1eL7H/gY6DCIwJ0TtS/HWxpSF/jjcml6dr5zNJJsl1MMTce7f+H7AOrSOW?=
 =?us-ascii?Q?fJsCSptQFF22xN4lbOuWPM9ddWJrVicasJ7ny9KNB8rH1rsR9tLGkbj2VHQA?=
 =?us-ascii?Q?oDOt0c1H7jyP1ALY6fSR39UmGcKsUu0b2ZJnFwanYGKD9scWpVirlyAgz2a1?=
 =?us-ascii?Q?KfkUHMUk8aX7jxpHBKvN8ekiv0GDMOS+ZRTWNmurJPyB7QAScxqqb6/BREs5?=
 =?us-ascii?Q?ZHBhkvWBWGEJmkMno9WRzlh9epyq4VKuSW0Las5aTWrK6alJKb8J0a5/oMZc?=
 =?us-ascii?Q?uHinE62wERxwXwJl0RhB9fTxGJetjmZyRMf5bBA0PBtPHQ4PGnt7djOfiu9h?=
 =?us-ascii?Q?N25w97OpN16Ao/Fo3SSB+CXIcEXWuySf54ptnKaBfcirNYybb/wlk2wVYOkt?=
 =?us-ascii?Q?0nC0XR/tlTlpaf9lY7rKMVajijpqHop9VFKG+PxvlMg2L/Ge4VUYzckQUA3J?=
 =?us-ascii?Q?gKH1XfpLQ/C8ZanZ3iN7F+ojUY20ckieChYY7Qz7IIvZmQp3zAXcYIxFwpMP?=
 =?us-ascii?Q?5bcgDkWYNp9epEQz+jZtF6yyDiLIdXixOatnPBhn6jlksdDz+nq3BCgPLpLL?=
 =?us-ascii?Q?jVaotD+sIUHqKC+1RzII2zaixT9C58fvQdaGtJeLlGUZKr9ef9IVr+ru+ZVz?=
 =?us-ascii?Q?k7ZkRGc/gHrHt1WqvBWRkRmAoRkhkH93qqlrsekwPcrF9Tiqntc4348MEQsj?=
 =?us-ascii?Q?xTmAreBGFZXAHe7wUu3Rih6kods52yNa3gmJzbcZvwV+zg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <47B9D8791E940642BF846DAC13ED3141@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eafcd0-b05b-477f-2db9-08d9324dae7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 11:39:06.9265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJvBZRNoo5tCJXUj+UGnGk1R5qYUfI5q51Tbu5cYrdCurFazbNz2F0JtRs5jxAqyi957YbGOdgjefTnfT5e6P1R5uKI1cBBxPC98Wwp3/WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> As a matter of style, it is strange to see capitalized receiver names,
> due to the significance of capitalized symbols in Go (although there is
> in fact nothing special about a capitalized receiver name). Fix this in
> xenlight.go by running:
>=20
>  gofmt -w -r 'Ctx -> ctx' xenlight.go
>=20
> from tools/golang/xenlight. There is no functional change.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


