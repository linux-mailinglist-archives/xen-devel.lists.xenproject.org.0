Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383552CD6CF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43484.78154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoj8-0003YB-Gq; Thu, 03 Dec 2020 13:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43484.78154; Thu, 03 Dec 2020 13:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoj8-0003XB-Cw; Thu, 03 Dec 2020 13:32:54 +0000
Received: by outflank-mailman (input) for mailman id 43484;
 Thu, 03 Dec 2020 13:32:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnUA=FH=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kkoj7-0003X6-7P
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:32:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26d15956-a595-40c4-9a09-6e9ead0919bb;
 Thu, 03 Dec 2020 13:32:51 +0000 (UTC)
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
X-Inumbo-ID: 26d15956-a595-40c4-9a09-6e9ead0919bb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607002371;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=kmGynGka6OdOCKP6iBHNafWRmniOtqOEz4pj+4DOnFA=;
  b=ZhX3ydX1b2k7ROtkBLqdEJE793pgdNA6niCrn3h4TfEsbbPC5Mp4Stfa
   1acFSH2jTibsEUDzlkR8lAv3X0E1VVss7AFWy+gqway329NwJTFXNjnIs
   d78SQMfGfYnDNcn/zeeAWvYh8zgC2iNUsg6FZiGc1M8hiw6YVoGdVofXP
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HPlPa6xiAPFCZraDZfIaMQ161sNyf3o+pS3O/hBbwvuYDSNhwN+b2C9SBaZkn9k0/urNSA+e5+
 pxLzXQZcqun8YDpIAQ/2MmXCC8t6+q4Ejg1FsSnvhqY1EgJSyFWeG05jNjiP5HLMkSBZYzEz1t
 S+eOR2QcRErroJbE1dDXktttFiAkv1W3rKoNNoU+BajT0ty0T+hq0Hf/4QoD5hQN63GQkzQ966
 +Zwz8pN50wYyhjZG//OA0yhuxLREo2QKeE7y28WdI/7FQAIT1q3R3TVU8VtzUxNOsmi51E4RjQ
 f3s=
X-SBRS: 4.0
X-MesageID: 32449730
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,389,1599537600"; 
   d="scan'208,217";a="32449730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh9SOPutK6WOE//zhyxIsXlXSdao9WVRW10PV8w0SUWCZOP6hn1Gk2G7CVLhXK4URLMiTxPFoKI8LX8nPCKaF2329a7RH+THt8+Mr1YTjj/hKYN02qIXwl3iwOg84VlfRmiqyLT61j91i7lapguu00r30O1mtfwnMPkRltBJlT4kCywsYjD6NLQFF6/1wUiJ/GfQn1AaooNkkCp/EGenficC860nG4kAakd6F6R3yMd/myic+mX+wFQWe48khIefcYD9eE0Zjyf617bJfWG/Y9/E5GTKICnmsw8TzoM1kUG8a6kQlrfSqh60gPEDik1s06tLZwKZyNkvyIqGHBsudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXlpwmINk2mGBNYkik9bxuW71GX8tebXQLV7unc1R7c=;
 b=RIrYIcj2nWoXfLbhDY2TTAjJDcGie8FSW9J0cTNmnmaxIPhkdsgvIIK7zsChAElWK4eaeeLVQBbwuyb/CCjVRzU9UaNdJcygXveglhnSIt06cS4eZfk7xEsrFEfIIjYRUQuF50PN+mI91xBrGz7iAz1XYM96fg4ZOhjff9QFEBLJlr/W9PWUjYoR+gg3CIHhTEAODlGZKc6rbobLYgGJPx9VU2vLPad4rgK8d4jpPpFvaII/8CxmrTrg0WvMUoybuVMEhXVZLQILZPHJ/L2VAeQo+lfYPgaf2zMXb+CL3f7DGuGLFsnUcSUhbdi0UbS0UENtopc2RGFnDkcctyKjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXlpwmINk2mGBNYkik9bxuW71GX8tebXQLV7unc1R7c=;
 b=XPLTt1BATF15lzXU4/+KrMTOwoQr9O1tzbNw41gGVcGRLgtmgHzuOXWozEqZDrcziKjGpqB0/bNF0wZIJAokX4rq1Rm/g3BXnCR2s8JqB/SoeDnkl9Y9xdnGKFxejX8mGzunhS2e/nKjbmymgLNyTBbNqUTU+k2BVXJyJnLjoNk=
From: Christian Lindig <christian.lindig@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
	David Scott <dave@recoil.org>, George Dunlap <George.Dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Wei Liu" <wl@xen.org>
Subject: Re: [PATCH v5 0/4] Xen ABI feature control
Thread-Topic: [PATCH v5 0/4] Xen ABI feature control
Thread-Index: AQHWyXjIEJK6osKOu0eZZfeqHV9qfg==
Date: Thu, 3 Dec 2020 13:32:47 +0000
Message-ID: <DS7PR03MB5655496C2C7EFC8DF29BCA37F6F20@DS7PR03MB5655.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acf09ade-402c-42bd-1b4c-08d8978fec6a
x-ms-traffictypediagnostic: DM6PR03MB4747:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4747431EFDAEC02F7B4F8DC2F6F20@DM6PR03MB4747.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0LziCboezOgvQRcHICS5Fe3NIWKHR6B+NHVIcYm1QAIP/GYrtiuJVcn8QAxUxk7KCiq5PyiZF50CgquV7PaFCIlrnzXprOzrb9vu7r+CwpUUqXRwpu7T5WDn+bXuQioFUg6rJmt5+ycHac7Z9Eq1mY2eYrN4gry+6Em4P4AvkBtJCao/NlkoJ8oMEvgSMhic+vdcjRezqe6Bw9ssw1M1dHjFJVggwJLg0m597BOy0ggtN0176VuLOmWD8XdJXdoiYuzpC3+BhfUt574VxA1PMvZmk6xcBbQ3wQlGZidaw+i1KyTlVN8oH4q7uEWrm2p2ABBUamYkuoQplqrRm71Vrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(54906003)(19627405001)(33656002)(316002)(44832011)(5660300002)(52536014)(86362001)(110136005)(6506007)(186003)(7416002)(71200400001)(91956017)(66556008)(66446008)(53546011)(66574015)(64756008)(66946007)(76116006)(4326008)(66476007)(2906002)(26005)(9686003)(55016002)(7696005)(8676002)(8936002)(478600001)(55236004)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?8g/UuWJSnFW3WTHYOfA1ajFiB5lVwcMOFuTZBv0oR3N3Sq2pqd8dsGXHki?=
 =?iso-8859-1?Q?XRLS/EmosV04rHGS+wRR7c36KruwPo8jqJ85efVzjKugISK4GWrzzx4a27?=
 =?iso-8859-1?Q?H0H15ZOeGAwAdGzHfIL0CEU/ptjfE40B85mNgD1cQG0se9MoXwQunKUU2M?=
 =?iso-8859-1?Q?oWwgeEL2zxEN1T/atJIsRDVuaiZgyikfrYUfho80tTT8DRww2zVGWOiMto?=
 =?iso-8859-1?Q?de4TGX2RxFRL34dALb0813XHl7oVVNmIdo+uKYzGz+cIgMJM+ZFgmcPG81?=
 =?iso-8859-1?Q?dkTwIU81/3p85FtJtVNVhG3fxVW9T0lF/FAcAD8nhwERRLydpkmFJ8nGVV?=
 =?iso-8859-1?Q?LLU9qQgPf2zhsZE3lw260Su8MPEKBNawDroT7KhQSDMkcJvqtQrUyHmAMy?=
 =?iso-8859-1?Q?vPWO9vretgADdfkKH0qwUyL9SvzMv6R2+/m92kgqM660TN8YFzL+pAZKUd?=
 =?iso-8859-1?Q?dLmFfNlxlO/pvCnszfu0MrGqdTSCiu/EVNsOMEK3X3L/Zd6lknwkkvFokO?=
 =?iso-8859-1?Q?PGb4ppKCBiIySgotpoErbzdf6fXDo4EWTCWEHoZJbmhO+Zgfu5rsl8AcNM?=
 =?iso-8859-1?Q?ZCpYbT5Zrz2gGflB0VcS5NiRc57isVwsNXn8hwyUqBQnetmHlM+UvseJIu?=
 =?iso-8859-1?Q?+ThkcY/Kfl6CWcckyqtp7YxxkphifeDLaBls9h+t+Rv9lp1XSIHYAsCaaP?=
 =?iso-8859-1?Q?vu1fP4r4z1yw3/OGlI1HZje8ywXrX0h7kPB3qIWaoaLuqk0NxYNJOopJ2H?=
 =?iso-8859-1?Q?Yrd8IPSC8jh7CbXzdCaQtGXoZgFS3aQb2RigZ6n9SIuYlr6wKrICv+hVtP?=
 =?iso-8859-1?Q?BKOArDJ0WfznEZODaPTKLiXAyJL63/beVaDRu5KiziJo/jvSSlUJejmrYp?=
 =?iso-8859-1?Q?Gym279PKy1iSuXK5vBxYE9MbSF+pptVI4+tegg59Iv0AaRwJz5rpbDli92?=
 =?iso-8859-1?Q?Be181QUsQYW7GDvHLZAiVLJUzKOAeogHJ+pDjgMSAyC1V1zLiquIY98A78?=
 =?iso-8859-1?Q?cDeifbMVs5SkX4zlg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS7PR03MB5655496C2C7EFC8DF29BCA37F6F20DS7PR03MB5655namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf09ade-402c-42bd-1b4c-08d8978fec6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 13:32:47.4075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7AElmWMrvGBDaWw5/bFSfDOeQ+T9NArnAAOSp13RfrdwcOfhgk9zHV9K9LuRNQYYP4u1wcd57eheTqBjRNZNeSCtG0uwRUGJHddR3/m8YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4747
X-OriginatorOrg: citrix.com

--_000_DS7PR03MB5655496C2C7EFC8DF29BCA37F6F20DS7PR03MB5655namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Acked-by: Christian Lindig <christian.lindig@citrix.com>


________________________________
From: J=FCrgen Gro=DF
Sent: Thursday, December 03, 2020 13:15
To: Paul Durrant; xen-devel@lists.xenproject.org
Cc: Paul Durrant; Andrew Cooper; Anthony Perard; Christian Lindig; David Sc=
ott; George Dunlap; Ian Jackson; Jan Beulich; Julien Grall; Roger Pau Monne=
; Stefano Stabellini; Volodymyr Babchuk; Wei Liu
Subject: Re: [PATCH v5 0/4] Xen ABI feature control

On 03.12.20 13:41, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> This series was previously called "evtchn: Introduce a per-guest knob to
> control FIFO ABI". It is been extensively re-worked and extended to cover
> another ABI feature.
>
> Paul Durrant (4):
>    domctl: introduce a new domain create flag,
>      XEN_DOMCTL_CDF_evtchn_fifo, ...
>    domctl: introduce a new domain create flag,
>      XEN_DOMCTL_CDF_evtchn_upcall, ...
>    libxl: introduce a 'libxl_xen_abi_features' enumeration...
>    xl: introduce a 'xen-abi-features' option...
>
>   docs/man/xl.cfg.5.pod.in         | 50 ++++++++++++++++++++++++++++++++
>   tools/include/libxl.h            | 10 +++++++
>   tools/libs/light/libxl_arm.c     | 22 +++++++++-----
>   tools/libs/light/libxl_create.c  | 31 ++++++++++++++++++++
>   tools/libs/light/libxl_types.idl |  7 +++++
>   tools/libs/light/libxl_x86.c     | 17 ++++++++++-
>   tools/ocaml/libs/xc/xenctrl.ml   |  2 ++
>   tools/ocaml/libs/xc/xenctrl.mli  |  2 ++
>   tools/xl/xl_parse.c              | 50 ++++++++++++++++++++++++++++++--
>   xen/arch/arm/domain.c            |  3 +-
>   xen/arch/arm/domain_build.c      |  3 +-
>   xen/arch/arm/setup.c             |  3 +-
>   xen/arch/x86/domain.c            |  8 +++++
>   xen/arch/x86/hvm/hvm.c           |  3 ++
>   xen/arch/x86/setup.c             |  4 ++-
>   xen/common/domain.c              |  3 +-
>   xen/common/event_channel.c       | 24 +++++++++++++--
>   xen/include/public/domctl.h      |  6 +++-
>   18 files changed, 229 insertions(+), 19 deletions(-)
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Christian Lindig <christian.lindig@citrix.com>
> Cc: David Scott <dave@recoil.org>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: "Roger Pau Monn=E9" <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: Wei Liu <wl@xen.org>
>

Do we want to add a create flag for each such feature, or would it be
better to set options like those via hypfs?

It would be fairly easy to ad dynamic hypfs paths, e.g.:

/domain/<domid>/abi-features/evtchn-fifo
/domain/<domid>/abi-features/evtchn-upcall

which would have boolean type and could be set as long as the domain
hasn't been started.

xl support could even be rather generic, without the need to add coding
to xl for each new feature.

This is no objection to this series, but just an idea how to avoid
extending the use of unstable interfaces.

Thoughts?


Juergen

--_000_DS7PR03MB5655496C2C7EFC8DF29BCA37F6F20DS7PR03MB5655namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div>
<p style=3D"margin:0.0px 0.0px 0.0px 0.0px;font:11.0px Menlo;color:#000000"=
><span style=3D"font-variant-ligatures:no-common-ligatures">Acked-by: Chris=
tian Lindig &lt;christian.lindig@citrix.com&gt;</span></p>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> J=FCrgen Gro=DF<br>
<b>Sent:</b> Thursday, December 03, 2020 13:15<br>
<b>To:</b> Paul Durrant; xen-devel@lists.xenproject.org<br>
<b>Cc:</b> Paul Durrant; Andrew Cooper; Anthony Perard; Christian Lindig; D=
avid Scott; George Dunlap; Ian Jackson; Jan Beulich; Julien Grall; Roger Pa=
u Monne; Stefano Stabellini; Volodymyr Babchuk; Wei Liu<br>
<b>Subject:</b> Re: [PATCH v5 0/4] Xen ABI feature control
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 03.12.20 13:41, Paul Durrant wrote:<br>
&gt; From: Paul Durrant &lt;pdurrant@amazon.com&gt;<br>
&gt; <br>
&gt; This series was previously called &quot;evtchn: Introduce a per-guest =
knob to<br>
&gt; control FIFO ABI&quot;. It is been extensively re-worked and extended =
to cover<br>
&gt; another ABI feature.<br>
&gt; <br>
&gt; Paul Durrant (4):<br>
&gt;&nbsp;&nbsp;&nbsp; domctl: introduce a new domain create flag,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XEN_DOMCTL_CDF_evtchn_fifo, ...<br>
&gt;&nbsp;&nbsp;&nbsp; domctl: introduce a new domain create flag,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XEN_DOMCTL_CDF_evtchn_upcall, ...<br>
&gt;&nbsp;&nbsp;&nbsp; libxl: introduce a 'libxl_xen_abi_features' enumerat=
ion...<br>
&gt;&nbsp;&nbsp;&nbsp; xl: introduce a 'xen-abi-features' option...<br>
&gt; <br>
&gt;&nbsp;&nbsp; docs/man/xl.cfg.5.pod.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 50 ++++++++++++++++++++++++++++++++<br>
&gt;&nbsp;&nbsp; tools/include/libxl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++++++<br>
&gt;&nbsp;&nbsp; tools/libs/light/libxl_arm.c&nbsp;&nbsp;&nbsp;&nbsp; | 22 =
+++++++++-----<br>
&gt;&nbsp;&nbsp; tools/libs/light/libxl_create.c&nbsp; | 31 +++++++++++++++=
+++++<br>
&gt;&nbsp;&nbsp; tools/libs/light/libxl_types.idl |&nbsp; 7 +++++<br>
&gt;&nbsp;&nbsp; tools/libs/light/libxl_x86.c&nbsp;&nbsp;&nbsp;&nbsp; | 17 =
++++++++++-<br>
&gt;&nbsp;&nbsp; tools/ocaml/libs/xc/xenctrl.ml&nbsp;&nbsp; |&nbsp; 2 ++<br=
>
&gt;&nbsp;&nbsp; tools/ocaml/libs/xc/xenctrl.mli&nbsp; |&nbsp; 2 ++<br>
&gt;&nbsp;&nbsp; tools/xl/xl_parse.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 50 ++++++++++++++++++++++++++++++=
--<br>
&gt;&nbsp;&nbsp; xen/arch/arm/domain.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +-<br>
&gt;&nbsp;&nbsp; xen/arch/arm/domain_build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 3 +-<br>
&gt;&nbsp;&nbsp; xen/arch/arm/setup.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +-<br>
&gt;&nbsp;&nbsp; xen/arch/x86/domain.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 +++++<br>
&gt;&nbsp;&nbsp; xen/arch/x86/hvm/hvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++<br>
&gt;&nbsp;&nbsp; xen/arch/x86/setup.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++-<br>
&gt;&nbsp;&nbsp; xen/common/domain.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +-<br>
&gt;&nbsp;&nbsp; xen/common/event_channel.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 24 +++++++++++++--<br>
&gt;&nbsp;&nbsp; xen/include/public/domctl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 6 +++-<br>
&gt;&nbsp;&nbsp; 18 files changed, 229 insertions(+), 19 deletions(-)<br>
&gt; ---<br>
&gt; Cc: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;<br>
&gt; Cc: Anthony PERARD &lt;anthony.perard@citrix.com&gt;<br>
&gt; Cc: Christian Lindig &lt;christian.lindig@citrix.com&gt;<br>
&gt; Cc: David Scott &lt;dave@recoil.org&gt;<br>
&gt; Cc: George Dunlap &lt;george.dunlap@citrix.com&gt;<br>
&gt; Cc: Ian Jackson &lt;iwj@xenproject.org&gt;<br>
&gt; Cc: Jan Beulich &lt;jbeulich@suse.com&gt;<br>
&gt; Cc: Julien Grall &lt;julien@xen.org&gt;<br>
&gt; Cc: &quot;Roger Pau Monn=E9&quot; &lt;roger.pau@citrix.com&gt;<br>
&gt; Cc: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
&gt; Cc: Volodymyr Babchuk &lt;Volodymyr_Babchuk@epam.com&gt;<br>
&gt; Cc: Wei Liu &lt;wl@xen.org&gt;<br>
&gt; <br>
<br>
Do we want to add a create flag for each such feature, or would it be<br>
better to set options like those via hypfs?<br>
<br>
It would be fairly easy to ad dynamic hypfs paths, e.g.:<br>
<br>
/domain/&lt;domid&gt;/abi-features/evtchn-fifo<br>
/domain/&lt;domid&gt;/abi-features/evtchn-upcall<br>
<br>
which would have boolean type and could be set as long as the domain<br>
hasn't been started.<br>
<br>
xl support could even be rather generic, without the need to add coding<br>
to xl for each new feature.<br>
<br>
This is no objection to this series, but just an idea how to avoid<br>
extending the use of unstable interfaces.<br>
<br>
Thoughts?<br>
<br>
<br>
Juergen<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DS7PR03MB5655496C2C7EFC8DF29BCA37F6F20DS7PR03MB5655namp_--

