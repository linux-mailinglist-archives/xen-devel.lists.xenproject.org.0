Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD128B612
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 15:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5946.15489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxlq-0007F5-3u; Mon, 12 Oct 2020 13:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5946.15489; Mon, 12 Oct 2020 13:21:46 +0000
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
	id 1kRxlp-0007Eg-Vu; Mon, 12 Oct 2020 13:21:45 +0000
Received: by outflank-mailman (input) for mailman id 5946;
 Mon, 12 Oct 2020 13:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yFJ=DT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kRxlo-0007EL-4c
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:21:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a9db84b-b174-451b-b81b-aaa80353a45c;
 Mon, 12 Oct 2020 13:21:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+yFJ=DT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kRxlo-0007EL-4c
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 13:21:44 +0000
X-Inumbo-ID: 2a9db84b-b174-451b-b81b-aaa80353a45c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2a9db84b-b174-451b-b81b-aaa80353a45c;
	Mon, 12 Oct 2020 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602508902;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+opqHIrxp82GqLjS0Fyev5j2ebhjlS98gYziXnrz7SM=;
  b=HDPK1qUc1VOzWcBHixrBi3AiK1NhRuLyR+1ZNNu4lSDFmJPu6ukG4Ykj
   XELBlryxQA1DtR1VmuQ9wRB661+zhNHBjLfQ9qJO8n2mh2GdDNaE96i3s
   UEGUgPe1E36drh+9b2JFHAeoMpG8dXsmwzz3mXhmLrbC1Ehk8UAKOXt/O
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SFPNHpivpNQNDqZvBnZ1bEiXEp+6H7ofSCoF2QlCYW0sgcFGnBTXPxTSsh09B8lO9eTOIKzcBm
 zQAlFh1s+JBMxA1et6rRauArwI1W7j50TK9EPkLU5ML/qiSNugGeL01HK2YF28A7ZyoXim0jLP
 BK9rHnyZp2OKeoT3vajNtL6u07KtZFxiSbk8rPmX8WwXjk55RfrU3d6cGdVWMq7Vw8vK1wJqN9
 DmKS3NWNyyh9fQ8YtaLdccsbOTj5LuvW1J6WVFyL6kwGW3p5FyAM4QcWGM0NjTckFnIqF33eFt
 +0g=
X-SBRS: 2.5
X-MesageID: 28795818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,366,1596513600"; 
   d="scan'208";a="28795818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn3FrhdeR2ydI1MwnVRqtJKqF7UTwSBT4/E82sOxf5HnpfA9C79UxL5txzz268faa69hyFAfWOuev12/Tk8cf63EUnO7q3r++Ihd32rL9iE/ECcR/yHSoy6giaoXkhwHRhxsf3BoIo/P+Si0m9EdwYyDaBdCBdx1XHs91JOlY/ebeol6DeJXnrWpn2HnKNsVJXuCLz/CexctmsH4PLhABr3RWwnbC6Ipx+Whk4orujrliPIWKe+YP7NSq/BD9f1c3ICnPaNHeLOXUPtLPigfaREjOUyqSOAbviJcwf7IPD/8b8eN8+gHUVVCU9ozwCy7DRSlowePYTk5QebDs2qdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTgcSX37QmQcykf28E0vQqerMpNJnPSmoi6uIFIQk0M=;
 b=QOPZ5GvcWwfYJaA11SiqLFe1mJlCEhoK5K4GyiEeKSRFZm4/uu0tRpVt5YGIa2PJXcb1rxmBnsl9aeyPkWQxkvtADpn1Ki1y0GKsWKIv7H0e36xujhTqpcQgOalZTrUO6dnfUHb0Lg7rEIGHa+23jIiUrAYTz/mAcSY94AFzrYNLDcJFQilOMcBhDh6+AqZjxf+REV9PjmouTLT7Owduwz6Ll9AM2hOUUsNHBlKORO7XUI6MuaxHk6XtJ58behno56V9mDqohNd1UN7F5ZpzCaMs+iuABRgypprEkMf/usyT8XvmzFCrhyxvz+xI+a8SQBOzwMRG/Z5zMVS28QyULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTgcSX37QmQcykf28E0vQqerMpNJnPSmoi6uIFIQk0M=;
 b=B7yZwDa6gHJMZEI01Csou02BOATkOHVYv4a2c7JfMzidlXj1D5eLep9lHXYUU6uhDNR+gPgu0TJ1xfHeI2NGTz5aR/FIpaX3Tq/Qu2IVIAts2Jjm+Rtry66J3x6qiuiwUl7D1pvSyyzSYzkdf/zeVh3KAI3zGOOHUehEHX95/2k=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] golang/xenlight: standardize generated code comment
Thread-Topic: [PATCH 2/2] golang/xenlight: standardize generated code comment
Thread-Index: AQHWoCapLtpfOKLaDkuCp3d16+bqdKmT9OyA
Date: Mon, 12 Oct 2020 13:21:38 +0000
Message-ID: <91E60ECC-5F17-4BCF-8BA7-DAC4E9227607@citrix.com>
References: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
 <d8615f72d205b8a818ea397ccbb86f6ade1cd158.1602458773.git.rosbrookn@ainfosec.com>
In-Reply-To: <d8615f72d205b8a818ea397ccbb86f6ade1cd158.1602458773.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34d82313-c310-4e5b-4a89-08d86eb1c045
x-ms-traffictypediagnostic: SJ0PR03MB5631:
x-microsoft-antispam-prvs: <SJ0PR03MB5631FD39EAAEF6AC48D2498999070@SJ0PR03MB5631.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TX7yb3O2GXeccd7B9UJG2FkS83n2KTSp7CQarXqr90JxhwcdRi0fOPmu4QoHaQt3Ds8n1lBnq14a/wE4AbwJXvp68eFOOTC7/Ia1H2dQMrlkU6/HQyTDwHTQHy8iEs2R2VnSm/5M/gZ5sJEBGTvSyznlcE0l5wS0/bXXf7Jtd5/ECeitok6+I7dPEub0Cq2QQU8qu08Jl17MeWYKfrtLxEZnOSJMFDSwAGbUcLmCdSpZ4I8R7Vj06A+WmJgXRK4yX4zoP0K6ayBODYhMwS+sDL0vjHiKizf6EfKwGlbSnnnGFNPWHVIxZZIm95LWBeboCegbPgGosv9NWmY1gc5UUWxnR46Eh/fJ1sQDM6l6KvCSJXQ5/K7WCOTKsRyJnmOqNHExTPXS/stCf7a/n3V8RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(33656002)(2616005)(54906003)(5660300002)(966005)(76116006)(186003)(4744005)(316002)(66946007)(66446008)(66476007)(66556008)(64756008)(91956017)(71200400001)(478600001)(26005)(36756003)(8676002)(53546011)(2906002)(6506007)(4326008)(55236004)(86362001)(8936002)(6486002)(6512007)(83080400001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7gOt+Jpz6vXSdrOph/2+XS/3z7Agn2N5TKgX8n2L4ceXGJJC4eoacC5dequ1ntrRaGxgYjORtwel9U5okCXLk+fC/ZmX+hHn+hLH2i5jkCDOTTWGkFFsk8vhD72TVzGpQFC8Yk+7auDfhdYBlZ4sVTRGYzpdXWwiU4xALKTWXdTVF2ZcSy2kWVjN0N2qvPR8A8DWdRKRMdI/7qXbEyh4WIhGFy6o5EuES2ErM3V5eKAVVfHX+Bqgdy9R7O4Ni+SPqBTHJ3+5gavOQBd7NEAw2jUdiI7p2H63M7eUut7YFUSZc5H4j06Vgm4FJq1Gr2AMKVIloFt39l8q9Eatv0InOHWZnVeJ7MdzD5jeXR6R1Rp8f/fj6mKxH+PDdj94+TW4d+/zW3jGP9YGv3lcY+qZegmkJOAvTzhs8/GzG9rgsUZrylhoqjwaFauMCrU1tFwruOuID+yPX2O5E0B8CtYnO2rTYrX2z9oTZ+w/Sm/J8djGZP7etsKwYxGj7FCIgN4yYylLylU+0lwyGQiKX6UTrbjYKAROYoz3DObPu6+yq4vi6iwFujFWFNi0hkzoxRIqWjtlriAhOO58838bwxhRXjCWBgiWRDmDVKAC+qZ3mRx5THF9b0oqMDsSqnOLPj7NEesyGyuG/6540nl3LIiHEg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D30F78B635CDEC49BAC1D21982489BF3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d82313-c310-4e5b-4a89-08d86eb1c045
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 13:21:38.5149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugHFN44HWOE6lG6jigcBWKUnx4i4GGyb7+ov/6egQr3FC8XgQi72sW7kCTv00GgMCSyR7nCbZmWGm2ojqy7/yvx0PaYfzstWxSAWsarsxS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5631
X-OriginatorOrg: citrix.com



> On Oct 12, 2020, at 12:31 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> There is a standard format for generated Go code header comments, as set
> by [1]. Modify gengotypes.py to follow this standard, and use the
> additional
>=20
>  // source: <IDL file basename>
>=20
> convention used by protoc-gen-go.
>=20
> This change is motivated by the fact that since 41aea82de2, the comment
> would include the absolute path to libxl_types.idl, therefore creating
> unintended diffs when generating code across different machines. This
> approach fixes that problem.
>=20
> [1] https://github.com/golang/go/issues/13560
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


