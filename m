Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE228B611
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 15:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5945.15477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxlY-0007As-Qw; Mon, 12 Oct 2020 13:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5945.15477; Mon, 12 Oct 2020 13:21:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxlY-0007AT-Ne; Mon, 12 Oct 2020 13:21:28 +0000
Received: by outflank-mailman (input) for mailman id 5945;
 Mon, 12 Oct 2020 13:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yFJ=DT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kRxlW-0007AM-P0
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:21:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20a2e5b0-70a5-457c-8c38-d9f8e627bc4d;
 Mon, 12 Oct 2020 13:21:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+yFJ=DT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kRxlW-0007AM-P0
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:21:27 +0000
X-Inumbo-ID: 20a2e5b0-70a5-457c-8c38-d9f8e627bc4d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 20a2e5b0-70a5-457c-8c38-d9f8e627bc4d;
	Mon, 12 Oct 2020 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602508884;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dgbELpXm+tKUAI+m6aoZHvCyhz6/QiVIWuxq43gC7Lg=;
  b=dzZ0F6ZSwf91K4SMJ/mBuR/F+z5EGQg//n/yWU6v18P56m34RJ5J16Ec
   ILYEHXuvlkcNxP3fz8z79nfBxFbaesv2/ZUu06654F1yZ2WUectNcHqK0
   EyUEf1L+TuThA2ojd/X1ZqUbdgP5+q4MbZ8Wt0SON2YqUJos1AtzYBp8H
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v3fu9BnCv54ATKDShxmgTDgVx6oWO2ELsR6Vz4S8eI5gdVVPU+LB1O1gCpEMVSD3AmlqvaU0eZ
 pmA2lu6oa/rm/FWZhjXR+FSwYjJDcFcA6HxqG+w+/gnoUazECYwP55+hxDZmJ61nHLytwyCcaJ
 +2GNlRoniLEyuWe9Z6xrKhhh4fr4c74jga9JB+aoHkZ6Hu5YUmR8q8ha+IB+6mYf0Y2jqJy7Vh
 wVP9alXOomuDvkDG5IfQqhpiZWdGXKDXoEGnGNhmbyJJz1XWyDbX9NcHtd0Iv3y60tadXjP9io
 Z24=
X-SBRS: 2.5
X-MesageID: 29828672
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,366,1596513600"; 
   d="scan'208";a="29828672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7ng/DVulfPQMsbpcSvIefC1io3AT7p06CDp0l09hZieUbGoxhKQlB0cPV8xwZ0/y59tFP+/o6fOlmg49H64g18NDrClHYxUZlsq3T5khsNg/QX2tW9d5dP7xqTkE3KYaUTLiKcXwcW89eb49byNsh7/5HmrLwn57FLBdwpYJ/8DMSN8YKTgDQEGLK/6pE435o3o5nZ8BNg7MDnrU5FjmzkhFFh6Abw6sRSII9d8SDzCIzxnLRLA32JkEb/8r6HiTeegj+EcRdj6lH2Q1uVQ0GEHjUEfkjMty+mBGRdod6xJ1GyWXutHDrEfAZC6HjBJy/md+sY2PWHBpwmxSuQ32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgbELpXm+tKUAI+m6aoZHvCyhz6/QiVIWuxq43gC7Lg=;
 b=Gm/XOkpXxhszKyGe+qU/OjlDUUu09LEKZo+BB9UBqMcCfZGgKMEy8CMjtmvlfzvX/MpnaG1cX0ndw5dMbKzHC4FjoOYyguGzrJkXuqRq9jxbb4OHOugi0xA2UMn+LT7KNTQ87YweSdNztf6b5FblOwEIlUBcBG36/g14pe5VU66yQs2GbrxaaCPgMfKOOlKOgAbJiEiq+hMAm8HT5h/EGcsiLnPIJKc2OuGKCx3ik4DP7v9ju0EoGcyWvwGPneuJWbOzO2dC9g3ziCpDxDUDh59qDL1PSqLAmDnLDrqzMgWz9Zd0RFDBvhRKwL0XX645QNwKmFH39/26bbk8vIqRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgbELpXm+tKUAI+m6aoZHvCyhz6/QiVIWuxq43gC7Lg=;
 b=kMlyBchkWMJOxtV1AR4Jktrg+w3g2hkSkDRE1j28iRWwbZ1QnZaGl1rRYRGT85SX6Z0aTzXjlJXit5ZNtodUeF5z1dersoZRGQzMQrY4PyFOxEjQ+TJrx/68p5a+pWHmrFwuV0g7wYp8+sG8gW4ZnrJbDDGItch4kHXrEBY0jvs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] golang/xenlight: do not hard code libxl dir in
 gengotypes.py
Thread-Topic: [PATCH 1/2] golang/xenlight: do not hard code libxl dir in
 gengotypes.py
Thread-Index: AQHWoCarymhorBdQCEG/HIvWMEWdvKmT9NcA
Date: Mon, 12 Oct 2020 13:21:21 +0000
Message-ID: <DF12E889-B8BA-490C-8FC5-B13531026DEB@citrix.com>
References: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
In-Reply-To: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d666ae99-fade-4796-936e-08d86eb1b611
x-ms-traffictypediagnostic: SJ0PR03MB5631:
x-microsoft-antispam-prvs: <SJ0PR03MB56311D2F46F447D29FCAA7E699070@SJ0PR03MB5631.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gujGHVO2ZXvpfomAXlsIuDK1c5N/jOFmg9wyd/InydiPQxAX7gIBCdcA/y0CIqYBZHBc82+yDG4LfTB85WZzypeSpANhMRf4eIiLJTMagRdrI2wiSFbHsGA757c12pV2cpYg1qSih14N4G9D2HaO6y6vKD6s5D0+l9Sh8xbmuRHfzIVEhJV5/8vk2QRq68FxY5fSDRPa3lsrwqQIL4L/haqdkdLNwJ5AeskcxZ0VtHstHNEBYA5m0sLlP3v+rP6FaWGvCiLsYHhd40OBBEHX39pYjX0FKteue3yvLt+bgeZs3Zf8gNWpKrzSfoG9BKBvO+yuuhsoCz3n8EJTFophRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(33656002)(2616005)(54906003)(5660300002)(76116006)(186003)(4744005)(316002)(66946007)(66446008)(66476007)(66556008)(64756008)(91956017)(71200400001)(478600001)(83380400001)(26005)(36756003)(8676002)(53546011)(2906002)(6506007)(4326008)(55236004)(86362001)(8936002)(6486002)(6512007)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JeO6OmUiP8KqR0I0JgmvCe5Wh1EWdlWSg33+1gaGfyQTzGrzHgQ8FvdHCD9gwhHR60CKfPi83FU0oZt8ZpZw1Cm5RzF6Nca4z71R2UCikRCxkOWYEFKc770lrX9hdKKNlvk9bPRKhxR5lsTpaZAg/Y1qAjpSL1CBCJqsWYYyGMw3ARKWavppsw9+xJHwASfKC/defeZ6e/grbm6hSMywB+EturIUF5pHmzgNqHuUJ0yeOsCh9XAhEMb4r/FiVEZVzs/jDkHWCiLJXnriZACnhMUN+9LtS6J82FPoZr4J4F0RkxqC4+6A6krtiQTMrPa+Zv1UWkcmaNSp35WsDdKROWhGIrJ1sejr69UD5I/Yf3N3l7KS8A7Jh1ycZ87g97FCdK8Vz7Fiz6rMarF/wCE7vZRpfAFQKrETUDswK219fy5QCtZ10+W7ikya0zuY37Q9ijJfI9lfbLkP+HI2gmffdLG3GbW/z99gNugi5ClKVygGDZKR3Qpve0OSQgHsW4wFScRgJ1ZVHva52YBqREgbEOw6NMI2ph4mSpRZtXZprl8M9HuIvp4BdQlT3O6V8yfg04wOjrLEpl1/38P7KpNp3byxkvvnibuPQKc9wZqt5YwZKPjMV9+iaWPFHh9S0ouX8IPdDpcFwn/pdwtL2cePZQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <285A952472198545A8B92AE3DB10EFBD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d666ae99-fade-4796-936e-08d86eb1b611
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 13:21:21.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qi4a8YIX2Y+pt9YVchjTceI3kwSWFgUJ7ayp1/DRYLocJgfeGhR9blUIs9OB5CgDQYLTvM33xuc/2aodnCCMVBkscPWeFGK9u9ZLKXWDkVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5631
X-OriginatorOrg: citrix.com



> On Oct 12, 2020, at 12:31 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Currently, in order to 'import idl' in gengotypes.py, we derive the path
> of the libxl source directory from the XEN_ROOT environment variable, and
> append that to sys.path so python can see idl.py. Since the the recent mo=
ve of
> libxl to tools/libs/light, this hard coding breaks the build.
>=20
> Instead, check for the environment variable LIBXL_SRC_DIR, but move this
> check to a try-except block (with empty except). This simply makes the
> real error more visible, and does not strictly require that
> LIBXL_SRC_DIR is used. Finally, update the Makefile to set LIBXL_SRC_DIR
> rather than XEN_ROOT when calling gengotypes.py.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


