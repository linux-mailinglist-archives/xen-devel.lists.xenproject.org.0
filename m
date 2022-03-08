Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6A4D1951
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286868.486546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa1I-0003KE-F5; Tue, 08 Mar 2022 13:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286868.486546; Tue, 08 Mar 2022 13:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa1I-0003IK-BX; Tue, 08 Mar 2022 13:36:56 +0000
Received: by outflank-mailman (input) for mailman id 286868;
 Tue, 08 Mar 2022 13:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRa1G-0003IE-PV
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:36:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce9e503e-9ee4-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:36:52 +0100 (CET)
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
X-Inumbo-ID: ce9e503e-9ee4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646746612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YC2dQfpJ2fbNbYs7YXDh7qTnSgC6EiRUZ1X06aKiLG0=;
  b=QDRqCTTNf6jIB3wQqtZUmdUFCtwmMBJ0m3LewyAeg4629YzHMi1AvPxk
   f79UPpG3P5/ta5wKnzx14dp+dBAM/l81hc6TOJz7DdqcfhE4xsuXVsEFt
   7JTnq8X9UW1xwPUbbQQHTTfWY2BhsVxbW42SJ4BGyZtoY/ERWzwDnmERI
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65711074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nBYnza4/qv/UIcvP1bteFwxRtA7HchMFZxGqfqrLsTDasY5as4F+v
 mVKDWqOPfbbMTTwc4twaoqx/U8G7JCDydJnTgdsrSpjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSAaF8XbvyLwdgZdBIFIhlyfrZX15vYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvWp7izXQAvs8XpnHR43B5MNC3Sd2jcdLdRrbT
 5RENmM2NEucC/FJEnYoDI9ghv+GuiXEWiZyi2qYlZMx6lGGmWSd15CyaYGIK7RmX/59kkGVr
 G/C1238CwMdMpqTxFKt8G+oh+LJtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa90utVNDxGQK5pH2suQQVUN5dVeY97WmwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhr/KxO2w+9+SpTVWWq4asoXCpKAcxMjpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlNtvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1QRNlFBN7faVUwZGKD+bF7r1xBHFb5IehtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S+S4u1C6uNPocVCnSUSONh1Hs1DaJ39zqx+HXAbIllY
 cvLGSpSJSxy5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6e95K9w/wfUPzbugE
 7PUchYw9WcTTEbvcG2iQntidKnuTdB4q3c6NjYrJlGmxz4oZoPH0UvVX8JfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:IqEcvqkkpRO43JOvmTIzrlAonzrpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65711074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYK9dv2j9HDejrEMrCztKBi4QviuFtNJlLPN7dxYy4UGU7Ce/0rI2SUHH1UB6lhwFcH0lzA4VzcuPgI4V/h2iLDRFf1p1zcAEIwcz/CtrAIiL5qFvYSy38fiAqFZlsidOTEdLqpqSecRyitVcWL+tMEgJKfkN2IBr+h/qLkgfDW+QiX3mKThG0DEUrrdKOznYQL4A/IP60g3XTZdxq+R1mW/4FCQmIF7+x85fm61RGsgoyEWsbXyTr5vsyyMVlDKSOBervgdsO9gMKCWO+4ZaVn3CZcdNG4zZ1QFKLtwwo/dgNiQ7PVQq2EtFP31/W8/nGWghkCuyhg4WOQEQr+QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLAu9qJDL/P9QGfhR/kTH95q3pawlGzxzncuIe9wUgs=;
 b=kdpFj2FR9d3U+JCY62LiyfXclNoXOWuYZroeOvSNUM6ktdJlrT7I/5O2haJ/0c26XkrWETPTFsPcVL0Jy3+fNQ2QEPaIqvRXaraE+vzsD6JMU25/gyDZa9vdhHQuC6fdsTSpKbHlt9BAiJp4DI1QM+DfuYux4ZY6Gsgs53m2bJPu5Hlu/RFB8sdMSy3tOr/22b38+nCGKO/OVtbs27eqJfiGzxLSLLy6XpiOKkGzmAuqlLPX2yYnyH8Ikfk9qVpgIMf4VwfAFIVCfjuwb98+WODzStXQXNF1lpcw/UFCquOX2UdSsMMcfKvuWByZOaAZeda0Hem9EakwZkrKkFb/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLAu9qJDL/P9QGfhR/kTH95q3pawlGzxzncuIe9wUgs=;
 b=aLIgb2iTWZWGXNQAVLOiDKRf1EU0BLCftym9F5u1nLLSAqfnz05UEUbbH9P5AeG616OVw+p1G4JKk8CoU2kdA+nyBUeN7CB0no2dNwQAXTt8Lh2M1wH/FlNIyBUXXOcTowc3i4znx5RiXhgeXEcgcPYabb2QiTXIP0D7JbSgBUQ=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "doebel@amazon.de"
	<doebel@amazon.de>, "julien@xen.org" <julien@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 1/4] livepatch: update readme to mention --xen-depends
Thread-Topic: [PATCH 1/4] livepatch: update readme to mention --xen-depends
Thread-Index: AQHYLkHWdk8ixY/QjEWIM7th04Hb+ay1hLe9
Date: Tue, 8 Mar 2022 13:36:46 +0000
Message-ID: <PH0PR03MB6382F67574E30A2A5D773E38F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-2-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: cbca4830-1a8d-bc00-f705-a2e9a29f6dcc
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 418a0961-ed07-4c68-bbcc-08da0108b0e3
x-ms-traffictypediagnostic: CH0PR03MB6004:EE_
x-microsoft-antispam-prvs: <CH0PR03MB6004229DC8BD75EAD61C6529F0099@CH0PR03MB6004.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pV+ejv6mE2xlh/CK684NI3X2JqMQwY6E1+EUerrpae9eiRqpItEC3s9oaBMdi9oojoxXzUFQLJIF2eyG5u0o/VWmSpXSVU1g3t2JS1cZQyXWj1nS8ZuMdkbT5jSbqj0OXz96bilIl1JAbA59zM59LN1ta6EXem+iNJoD0NUqNJ/mLVOvQvdE9MjPYUUFJg1yRSmN0sVv1k7Pv0uVoDaRM5M31FxAUb3GgeSnurl2fmgtKxLamSuzaBcMTdGMXBaqf1ZCdS7D1kNyMlKTlECMNbxBC0NGsveespylqt3msnz+OiL1zoyZoyEgjE0CCVycyGCKgxghEmGgtmzYrZLluYET78VxedwP2YMFFttALhE6pJZ13RxS0KJGYJ5hCCNjvmOJXQEyZQ8FkGtZ3u1FxHbsv89pX9CSLmYp9Dx/hQ/8yKlQCHnvxT8N/jjLyYmuz3/xgzcFqhVFeMwxkHuLE8CR4aMg1WKAMFiGVKx6Gc80izUMNeWD8McmyVckf6YtwLvHaXEe+3RO4vptQDusKHb6oNFQqaj2S2H4Ukbi2vWPKseS1tIQRaTwkW8JW2TtTmygIYlNBvsoy5hae/W/aD6QmKhDGbysExE/dne0retsOjOr4vEQ1ICgVGsxxBImea9OjG/4DLzslDV/hRt+ZHDAcD3HZmYunpA90HRulYZGtFOD9ONRm7/t4lnzQe+CdFjKEPWldWNNNFuY5c0RiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(52536014)(8676002)(4326008)(66946007)(66556008)(66446008)(64756008)(76116006)(122000001)(7696005)(33656002)(66476007)(8936002)(110136005)(38100700002)(6506007)(91956017)(316002)(54906003)(55016003)(44832011)(2906002)(15650500001)(86362001)(186003)(107886003)(71200400001)(53546011)(26005)(9686003)(508600001)(38070700005)(83380400001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ruodvh+8SXYBbFcf3We5JlBZfN0UT2/SCpJBCFqqPdsJrcWPjTgQkabBCV?=
 =?iso-8859-1?Q?/i9QM5FQOHfDhwXxLJhfDLg3dXrG9wYMyFv2gU3XufC14KRkn9j0BTkWW0?=
 =?iso-8859-1?Q?jmY1mBqgrguZd1rHo5Qq1d3pkf8OK0a3rYeupfj0u7ULkxIf1dWyXmUfDk?=
 =?iso-8859-1?Q?GgBRq8TyNg+cy8lxp9s7b/ycO/MxR9K+g86fxxenhi44O2hzfq1ZHo9iWQ?=
 =?iso-8859-1?Q?guuNbtstIqo/Yr6DP1xn9R7fdx7J2grp0Lvyt+Uw14Ra7KrmY8caK813d+?=
 =?iso-8859-1?Q?k5kDRuXSU8v1ExwD7huRUXNRcFAlV/nvcydKFqrDKWjyFvOvKUkvp2kYwX?=
 =?iso-8859-1?Q?57MIEFGXm/IOTH8VCdiNwT2uyDwU22WhTp73fXEP4m9M+Hotbfr9Md8wYe?=
 =?iso-8859-1?Q?rz0y3pNuiBi1Kii1JF9WtLk/BIlS+t9xo1kt9rAtQnfJAGtwVn2WoF5y/H?=
 =?iso-8859-1?Q?vh75Arceh54Hbdjopopbs2VFy9glglRN7NpsgO4Rc16OU+NcfrHYEoSJB/?=
 =?iso-8859-1?Q?DuC5LqMAD/i7ftHvzZfaEzYpQTHW3dnTti1jAqg+c4xZLSAfOeiTFA9nGD?=
 =?iso-8859-1?Q?L/tCzwO81hSBdCjQBeOS3+RI/x57oqbcjlK0ABVJQAy8imoyZVq9jZMWIe?=
 =?iso-8859-1?Q?txg/b9G2G+iuJrzzVNZKTSeEmalKHKcHCelQOH/ynnzw6DvZ1BtySL5kcT?=
 =?iso-8859-1?Q?QQ8sZ+b7KTxIRQnhdG6j1vEclTQ214FHP5tMNGFT4zrC4SsJveNn1ykzvz?=
 =?iso-8859-1?Q?qCaO2E+xT13L7AOUqRzfH3abaYh/n2FFYiVuiF/pgviwmLkkdv1a6p5cW7?=
 =?iso-8859-1?Q?P3CcF2Pci5Xsvp5lBxxfQv2Y9HOIC5rEKd2Pz4o+Gi8zINEEVujqhppAxg?=
 =?iso-8859-1?Q?a4gNe+o+0j7IhDH3sX3dih5ETrZRh27ipp6rWDLWBcfNveOAwYlVFoccoi?=
 =?iso-8859-1?Q?u/sCcBSpyUS/m78g8nIyLXVa2Hcic5XLfkft0mJevaf5YA/kDmB0l0RTFW?=
 =?iso-8859-1?Q?PcChex+ZGL4myg064zBSdMvMEHbWtY5xjYyatjs5xUOv4SffvlGpKvBcki?=
 =?iso-8859-1?Q?+S9o9JsOlm1c4Ba2XEc52Jkirv7gvoZ5fQZjAOqBfMzg1LjOPpPdWPS3de?=
 =?iso-8859-1?Q?Vl5gldvxf8i3/J3VyFQc8fHAZZggR5xzQUIXoqR6VvIDPO8st8ryaIFHn6?=
 =?iso-8859-1?Q?Gxt90xll1xFZGBQmq5JxauIMiBsqz50yuecTAZHRzEK9hnMkAH8hqaiEQ1?=
 =?iso-8859-1?Q?DJMhaFo5dVsBuKCoFQvI7OrmEUiMM3rmkwaXomXxv1V6H62InEnXqy3g87?=
 =?iso-8859-1?Q?W5/JpyjDWkIZyLjNeJZqfmFqGcK02O/dUHseAnrbuNd+L+gSnQ1ABLH266?=
 =?iso-8859-1?Q?RUtXAkWWGBeA/zwjy2oV6P/dU8hJDEOkjuGcT6oEA8glnGS35p78lP8UDe?=
 =?iso-8859-1?Q?7cN7Gj29A300i1JnZMbf3TxRJCA0ya6xg3aXfapkVjROR0I80EPtAxMDGy?=
 =?iso-8859-1?Q?H8d9rSfmZVOCvrKbAyc4f9Yd2+365LatU8D/a3faBdvODbO+1q0DrJ2bNQ?=
 =?iso-8859-1?Q?v5M173p+Xa4VJi4ZjVxgK6o93jeCzagUMUA63Z+qP3NzNE/R6wBsDnQfvJ?=
 =?iso-8859-1?Q?dczGBGQjO6Lz6kQgYUPeuHfS4pOfN0LLs9mljMKmrQ8QXdGg8DM6NHEx8y?=
 =?iso-8859-1?Q?Cn7pCuP22c/ZBTXEaGt/qbEAhuiTKVKywgKY7Yh1P4hdlxHW2xiza6djQK?=
 =?iso-8859-1?Q?6YEQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418a0961-ed07-4c68-bbcc-08da0108b0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 13:36:46.4177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCBosG+hj+js1z0imKWpvMPL3iFcSXCHNBMndp/EyRdvxkE+CmB6TcFtrbrH5V32mkMedOqx2xAQcpMTM8vhVBO6JEzC0yyW4RG6seo5OP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6004
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Wednesday, March 2, 2022 2:27 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>; konrad.wilk@oracle.com <k=
onrad.wilk@oracle.com>; doebel@amazon.de <doebel@amazon.de>; julien@xen.org=
 <julien@xen.org>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Roger Pau Mon=
ne <roger.pau@citrix.com>=0A=
> Subject: [PATCH 1/4] livepatch: update readme to mention --xen-depends =
=0A=
>  =0A=
> Fixes: b19df7b2c05e ('livepatch-build: Embed hypervisor build id into eve=
ry hotpatch')=0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> ---=0A=
>  README.md | 2 +-=0A=
>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/README.md b/README.md=0A=
> index 653c624..b48a3df 100644=0A=
> --- a/README.md=0A=
> +++ b/README.md=0A=
> @@ -24,7 +24,7 @@ Next, build a live patch, using a patch and the source,=
 build ID, and=0A=
>  ```=0A=
>  $ cd ~/src/livepatch-build=0A=
>  $ ./livepatch-build -s ~/src/xenbuild -p ~/src/xsa.patch -o out \=0A=
> -    -c ~/src/xen/xen/.config --depends $BUILDID=0A=
> +    -c ~/src/xen/xen/.config --depends $BUILDID --xen-depends $BUILDID=
=0A=
>  Building LivePatch patch: xsa=0A=
>  =0A=
>  Xen directory: /home/ross/src/xenbuild=0A=
> -- =0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

