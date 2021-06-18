Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37243AC92B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144457.265874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luC5m-0004qY-W2; Fri, 18 Jun 2021 10:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144457.265874; Fri, 18 Jun 2021 10:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luC5m-0004oM-Sn; Fri, 18 Jun 2021 10:51:18 +0000
Received: by outflank-mailman (input) for mailman id 144457;
 Fri, 18 Jun 2021 10:51:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luC5l-0004oG-HI
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:51:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a950ffb9-a1d2-4f69-bc5c-18a08af8e13e;
 Fri, 18 Jun 2021 10:51:16 +0000 (UTC)
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
X-Inumbo-ID: a950ffb9-a1d2-4f69-bc5c-18a08af8e13e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624013476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LDuMz/juPY5gWNhy1V2tssudSm86+7xqWVv9XlGfvBY=;
  b=KPlsvQl/Qe0CYHqvLsmBmH1q1yDCzkHBzZepwkPnQUfboMrF27KC9cVH
   ftrY7M9kYQURAsbhZf2bpYYkE44WEVQV0voHSibdKaIxALjmYIl6usrEp
   1oCCA8tlkQEMx+q7TWKDbvsxXkSDSEdPnqTKk/4RpTgm3HB/2PEig9KKq
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1meH1P5UplFF3Qk+CTQUyR3WTiXVVJUBTk3sGZFNPjTNuot4XsS2/Wq3GDwGkRz10IR7+t+JW8
 EK7y0CaRqI5zKtrx5bMebzvWaV6+naCiYVY+bE6iXaLlgziYYhaHSTUz11NIk0O64vSz+xXc7M
 wg7/OHYxuZzijRhVnNTF2w+7+erEAgkxLq0B9WtgN4w7FLQ+BQ48Q1lb7LtwMd0XGpgs6xJZIN
 VTfCOzAMGr4gqXEJvmRR8KBK5LNStywV57MkniyogCBDKm/PIe4n3NbEIL/3XawOsFJxDn3Xfe
 rWA=
X-SBRS: 5.1
X-MesageID: 46176112
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yLLqFa3bKU8BKKGe6jRPPAqjBQxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hRAV7QZnibhILOFvAj0WKC+UyvJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZq6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngaOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k7Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXUISaCUmRIXee
 v30lEd1vdImirsl6aO0EPQMjzboXETArnZuASlaDXY0JbErXkBerV8bMpiA2XkAgwbzY1BOe
 twrhKknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfVsRRx2xjIlLH4sJlOz1GkcKp
 gkMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRHXJ9up6pH
 3laiIWiYcfQTOaNSS+5uw8zvmWehTOYd3E8LAr23FWgMyOeIbW
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46176112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKNdXtHxdc42/GN4zyiLt8lPZ27rOsasvv+PObgXsRGrvCUu4Tf+ric5YqN01C6pEBQmbLagmE87N2fee051aV206dZFh5I/Lak1H7p7kcK/x4p3a7oL6zNOCvwJ7wyjvRwp6LwHwpgnSth5tWG/yVw2drGwtjyzVS8vpfcOR1arNYVcN50GAOV/vIRSqe/FBcVDj1ru9UMWkKJ16Pape0DpclzI74EdIgyq6eeoMMxJZ6IifqDNdMtRQcNvWVZDSVcXRX+WzDxPEDss+Wt39yXLZ9INea/2MC7a5h/i0t01wY/Cs/ZJ7TDJlZmMdnJ498DxzoVKD+K7ym8+tIpcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDuMz/juPY5gWNhy1V2tssudSm86+7xqWVv9XlGfvBY=;
 b=clDwNdx0wwTJO9tmf3cOqQuO0+xjoDnEfDzuKMxpyC15Ay/vH1Hz5bYeH5oI4fWYzwq8nWjOShMZP6hCu5bLBxRPkri4pzXd1wFRU3kOE2ocGdmZbSj4QicILa2aT6ShwEFoYP1DYM20RS+o+Nkpm697Ic4907jducCtYByoJhebHdtcPKcfKoFZPVloAWJxlpDrRXYggkugnh9UXr07+yesdyz26/XiJ9V/eUUMoMlPU40PWExDfWfIsaTrb5eV0lKUvfEATpAw72wBhDYdrCT7EENoXQUegOGjuN/Sx7SWexhUvRr05QjjGrQ8T0pKFadwu3w13+WRzBDJxgDSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDuMz/juPY5gWNhy1V2tssudSm86+7xqWVv9XlGfvBY=;
 b=aTQU1DUA+h5uZvmfOKwwKLcyp0RDidvZ+i8ghRlwcXsi3AyH7D42XXy3kZ/y3OqU0eG6Oy08dVPlbIEKGJ/tYEsvv4oRRxb66bJrcRneZhuLZknP9rz/XsXbNytKBLxfLMgsDLYN2+k+JiLQwKdrq+B21iaKrEvyrXYAYkjJyLM=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 02/12] golang/xenlight: fix StringList toC
 conversion
Thread-Topic: [RESEND PATCH 02/12] golang/xenlight: fix StringList toC
 conversion
Thread-Index: AQHXUNy7TNv+p7nNOkmLFrh5orF2CasZvfqA
Date: Fri, 18 Jun 2021 10:51:11 +0000
Message-ID: <95DDE0E9-E275-4E9D-AAEC-4BD0324F01D4@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <0a15ed9eb6cd70416995f5d9805c98572eb6bd50.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <0a15ed9eb6cd70416995f5d9805c98572eb6bd50.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c40206c-1673-4358-78bc-08d93246fcac
x-ms-traffictypediagnostic: PH0PR03MB5782:
x-microsoft-antispam-prvs: <PH0PR03MB5782B503D3F0C475F5344111990D9@PH0PR03MB5782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JX+A0plX2b49jJw9b0i9K6tJgLsnHSLYelotK4AbHFTVCe1D59UxRjG0SeEqNwe0GRCfXOs5koDKRHg86QwXuKu58UUPrpCya7Op9wjHfSTzARMnb++LUv9iF5yV5cHlQst2DhPL+sItERwfrdu2cxp5b9h/ojGhxDcsyjqTRUUJEFiVBMiBldkCaUXnfoJ3Q3Y51sWHL+hYD6KXANMpJz3qmv84J3Bbm92NOFUV7uo/uZCxIPpqyEO/2U0eMmVoA8Xl7h7yt6czvNEy1FbZdnd5E6g8sRIrGUiYmSYHV76Ir4ZOLcRgKLxxqRiAU702i0NN1tC6vINdAcHyxCt83OEIM4134McRVI1/mkaIu+wYOOP2wecq0IcZ3RsIpgF+2T0vqs3xj3Qg0pDuz4NSkl3yR+Lue9sW0OoVB4keADKCGacTk7O92ufDZKXOL6jLKP44bRcvJVM/AS1wz9j9IB105X9WKYIMCppzXZQGMSTv9WqIEGQcmMUkHAUMSs6oSZgaa/u2GqY3QJ4MF9mXDCaNoo52SRswnaOCB0emHBe2eHjLqPK/WEKQ3ZH8sggy3CHoC2X1U5phS7panWsFOgNYHLrjFUCjKHc5rx1hxNZq986wcqHV4Cp6WTgSVGfUEOqr5rjfvx83qu1HOwS5T/nEgKCwzcZjbcDcej/lGOc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(54906003)(316002)(83380400001)(478600001)(2616005)(6506007)(186003)(55236004)(26005)(53546011)(76116006)(71200400001)(33656002)(4326008)(2906002)(8676002)(8936002)(86362001)(66556008)(5660300002)(6512007)(64756008)(66446008)(36756003)(66476007)(6486002)(6916009)(122000001)(4744005)(91956017)(38100700002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QOSz9IVzCo72+g+/F0MMQG7XxEjlyY0uWeGOC6/bwJFZD44+7xb1JrYc5wSP?=
 =?us-ascii?Q?OKlMNcOqGYerpEQBM7dH1+YZ9/6d38FFmgfb78/zydJTR+s8Jp/t4KvYjx6D?=
 =?us-ascii?Q?1dNbTl+SIiAITm80C/JZNtOx7cHuTtAgxe9eExiM76BJGTxoQJz1BKjal18Y?=
 =?us-ascii?Q?Q1sJQ/8AZo5yl3HkSIx3T/+FVjRWEuN5JIAeaokiXnF2QC0yudeLSNlDn5+B?=
 =?us-ascii?Q?tDxVbMEhxtSEL5tRm4244Q976mt7cI4Yy2eag1ZU2Z9ScnHQ6rpcbp89mexV?=
 =?us-ascii?Q?z0Lp94/SXca0hGe/2JUMvZb/UNRIt7lBJDroVX2RB5MxL1EtAe3nU/GpvIzN?=
 =?us-ascii?Q?rbnAokCe2Dn4DSLPej67C05/EXHjM54dIahy255G+KGdUCDD0A6Mn3cQqcNo?=
 =?us-ascii?Q?hZURw4LNDq9JTQr5wyCpNP8us8PtwQmZnhHuuJ51AVXpDIt0SU9dPmhxQRne?=
 =?us-ascii?Q?K4QSq/sV6bZ7ZK3dSeexVdJFv2TieUP2lPTbHjF8HlYDA3phV3kT76No85Zr?=
 =?us-ascii?Q?FIN3O8HqHUlqxwi2iyvVZYBtgO22xgdQcvEe8iiFQG+9AwMM3oJUymuereOU?=
 =?us-ascii?Q?+zO8JXlwyqOGlh5Oa7S+iQT52ixxjxq7D+ynxfE8J6OYJVRSZE9PqjDDDrVN?=
 =?us-ascii?Q?GUv2uqkqG10CKpRXCxT84ms7iyyPgAK8fQG8TzovG1v+4B9lg3XtCSJyWKo6?=
 =?us-ascii?Q?YBUMtGk85+xqV8HNIh+Y8YMCWX+3XVbXNNtfmBYSmuGfpNbvrXkak/vPQkJr?=
 =?us-ascii?Q?dL36KAPpyOjY/8Kar3aX9FjLFymC0hMhv7vP5wsP+c/37IpVqgnDdgzY33sM?=
 =?us-ascii?Q?GlZsA8F/8zZ9ofeMZNZsOewSZXiccAXbs4l12fN7WlIjSTWWWJeBI8880YsQ?=
 =?us-ascii?Q?RNiqZk5pUAfN3kJM9kUxRXSeclZBiWbMoYWdNlqGY/VrJzOIAGtp9dZn6aO4?=
 =?us-ascii?Q?8tkASJ4X7Z3dzgCGhYLYH7YwAXgG/dluxYN27fU9XNoZhEW5XLy1IbDldyll?=
 =?us-ascii?Q?tjJerTBGhezAl2cMBFvHtFZWh8p0jRfhYZbUq8AarS6xpwwPK1t8VO4eAS9l?=
 =?us-ascii?Q?f+BENOPOosrtczSJWJieGuENkD6q6zwZBRhTzC9QAxSK+02E3x2m6QG8fggT?=
 =?us-ascii?Q?z11eDniZHDJCA1rY83AgkDB4X8mJRbNmicKEcy9pViEst20Rekx0CTjI4i6j?=
 =?us-ascii?Q?mghmNBhN58sluRFWhkjigGWCWVEuw3Cw2iKXC/0A8rL40QDuNrawRsJQJATE?=
 =?us-ascii?Q?QcEePFuWO/rTI6lWtN31WgYrr6uuilZ76JLPUPhbSeWEbnZAgZ68t5KorEFp?=
 =?us-ascii?Q?i5VSYLuruRiT7UeMzEUtLSGo3op3JDnf46PIckwdgfEQYw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7EBD2F58C273E4382D6340B00F7A616@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c40206c-1673-4358-78bc-08d93246fcac
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 10:51:11.7130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgI+ixQ4Y14KFU0pG9M7u+jNc06IvqVoUKcvovPEsDf/Pil6HkcHzDmJxd/t1t4X5G24fg0Kat72V3c+B0YfbovcDyoYBZLtyOaevjwnWQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5782
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> The current implementation of StringList.toC does not correctly account
> for how libxl_string_list is expected to be laid out in C, which is clear
> when one looks at libxl_string_list_length in libxl.c. In particular,
> StringList.toC does not account for the extra memory that should be
> allocated for the "sentinel" entry. And, when using the "slice trick" to
> create a slice that can address C memory, the unsafe.Pointer conversion
> should be on a C.libxl_string_list, not *C.libxl_string_list.
>=20
> Fix these problems by (1) allocating an extra slot in the slice used to
> address the C memory, and explicity set the last entry to nil so the C
> memory will be zeroed out, and (2) dereferencing csl in the
> unsafe.Pointer conversion.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Even as I was making these I thought it might be good to try to get some un=
it tests of this conversion.


