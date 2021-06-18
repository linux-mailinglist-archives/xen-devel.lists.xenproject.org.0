Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A503ACDBF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144710.266317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFjN-0006mp-FY; Fri, 18 Jun 2021 14:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144710.266317; Fri, 18 Jun 2021 14:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFjN-0006l0-Bn; Fri, 18 Jun 2021 14:44:25 +0000
Received: by outflank-mailman (input) for mailman id 144710;
 Fri, 18 Jun 2021 14:44:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luFjL-0006ku-UJ
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:44:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bff9a01-a40b-4e0a-9143-1f90433de55e;
 Fri, 18 Jun 2021 14:44:22 +0000 (UTC)
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
X-Inumbo-ID: 1bff9a01-a40b-4e0a-9143-1f90433de55e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624027462;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sNRrU3JooVO0gSsGbPQoxrXIpNmNssmD/+IcRU6wfok=;
  b=VWGXVnJgzLfK0NyjjDsqTRjfr64XlKycy9OIXGoRwnMRm0K2G8Eb2uAz
   LEpzxWtcYkXwDjiABn2qvkii9zKTehQWBs80R+FDJrEnDZ84O7++rakKT
   kebSmHp1pSOG8NkHLBo/5U1WjVkghS7code1Z2vn/Dxo7OofciLBX8aSw
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kwYnNaAfvjwum9uiKekYAUzvARgShfKr7QZiiRnIoiJB4A/+PIFHdMtM6JIBDDAkH+oVxW2rDr
 soaNAnNK/IAQtGD2uZyj2CIi82GBCzo2skFdlYHal7kMArkuz8QHifnwyBkGW0Vlwf8wV+JzKo
 qqsfpxbiSgzLSJ9IT1WVfFT8wcSQPy5pDkUU9heAa9raLTY2sMQX2Xtf/o5pZ/IQCqEeJx/s5T
 4ZpcD/PVpVquSvnaW0L+fAgElgImAAT/Xv4AHF9fqs6EEFFLWMmq0yv7Ut6jPPe2mYQJx5ra8U
 azs=
X-SBRS: 5.1
X-MesageID: 46834676
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lFZnNa5yTCJY3mAp5QPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46834676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNQ+kjF1n5MbIUbs1QdtGvoAZfnnSnRC3T9n1mSJkqgVKBBredNgGd/Ma182Wp2+oNsDr5LU9KSi3ClqQtOXwKzyEVwwTsuTb2F0Q7IDduXbQ3K122i7l4AV1sB3M/vlR2mEDVseeUmVRyCCGBrwm3MyRaPlaXoA93FDLp8cfETkE7/5qeFk55cw4uRU6t8w0DDx6apIApn/vDrvQ0PcSqtgSovzDoPtfrXO2+VwSkbJ98EwfRL8dCVQb/bt5L+SENvCM7pwx/kcyBaX+NhKBKAaXwRwamazP7JUO/PvBYLYbsMKArMRMi+tcXHefxbEIY86LC2Bx9YBRxMG3FtXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEOa0gxWto6hCpCgiwuSqe8UK1DjdPyCs54qQ16sxMk=;
 b=FaO+jwRpXHAOY++s8fKGB88K4PGU8LyAn0lBqQF4FMqf+2Se34eeiK+dqKRBcpM1MlKIXdHC0tn117wjiYeny5k+qSlfBlvgld1se8ZuklbqEpy89Rs2LS4M4xdGoIev4twv4sxF1skmufo91MQit5PyMKopbquwEvOUvE4DXOZNNRgU39DCYHwiCQ19ZjAcpFLd/o5NmfJ7exHe66vz9m6NP9pZYBP+6sjduvHq+XslTUjRaChQ0miI+KG5YCYZMW7QfFzVWLreOob4E8eJoNaHsEbpbLqykYeuuk4I/SA5IR/Jo0pjfqAnzMyLTqHpKhz5nCW6VMqumo4EPQIaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEOa0gxWto6hCpCgiwuSqe8UK1DjdPyCs54qQ16sxMk=;
 b=aRVbxM7G915ThM788TFhUhQBkHcFSol3JvMegChUqiRCZeCE1d7nVAV0aIK2I4TlvG948w89hcKQrlFOOUD1oWkNfemtyW4ub19qsu29mUzE+bICxohxhUWH4TjjET4AKJX7G49Q6mslj9rULZRNqqgdtJd4znUwTKyKDe4SmvE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Topic: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Index: AQHXUNzBxrtRVA/FskCGl/j6ZWY3UKsZ/xcA
Date: Fri, 18 Jun 2021 14:44:15 +0000
Message-ID: <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b9e8795-b770-4600-d196-08d932678b98
x-ms-traffictypediagnostic: PH0PR03MB5782:
x-microsoft-antispam-prvs: <PH0PR03MB578260E28685107AD88285EC990D9@PH0PR03MB5782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Ul3F+uk8HzAF3DN2ohJtxrX2J5nI44ZB6ixUmAUvC0MqFcn8gzsPN/0S/wYDu85Un/qxipz7CRChgQj1ek01q57qcvvptTwLFb1yKjDfy3UBGa4GpBYrAIXtzik9sWPZWBYjuKhPy5yVYy+Xr74qqvv1vdTW+WL/RhjdZmPaPb7SD6XEZaPrg9pmwrvRNaWmL+7bM0ibeTV3tmiSgvGu7cKeWmEILy3KLgJAgKvZohXM64oRMfmx4NTiSRhEPDuKuoUoro6il6mEn/FQclfVN2O0itULOv3FR8ZQurt25HrneKxxYGfKso6iLpslSJfnnnJp2NHEQCUqSwckv4Ygy/8n22O+CwXWSTSFq+CrXHITzIQ54W0nPOYB67+K6X1uNnMbMPJziHaarMydK651+jowkx1OZcm9pw3NH2u7dRwk01/LabVRE+RzTOl94GkiHxneXhHRsYYVeIQoYfejq44dnJVAghF+TuKdqKptp7gswFTIUYfAw9NIjcAHUDNfoTeYEkWnZLRUGeUYR9s7Xmm2CSVgL8JI/kEWwgFdiAW2PyAmLm0YkeDer1Pg6GTIbimJfW1M7aZSoHkOv0O9KGLRIbYRpsQNoZNYcr4x0rO0JtLX3rYMuNvXwgCIAjWleuoDM8zk7Zg7bwEUtE479YDz0R9aBiurUo3MQ/B/DQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(54906003)(316002)(83380400001)(478600001)(6506007)(186003)(2616005)(26005)(53546011)(76116006)(71200400001)(33656002)(4326008)(2906002)(8676002)(8936002)(86362001)(66556008)(5660300002)(64756008)(66446008)(6512007)(66476007)(36756003)(6486002)(6916009)(122000001)(66946007)(38100700002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dL0dINLw/mbw09AQ/5lUe4ljiQov3V+hAVnHYIplUmDwy43cVLMd+ZaYYweS?=
 =?us-ascii?Q?fuo5qwTdyigIAW2altGooNU1WTvSNrJ6hQ0mUqnyoikcjPkYnmTbTC+J+LwU?=
 =?us-ascii?Q?tMXntwRNFNRXoa/GSFVHN3AuevZIyjmJX7RvIUUrM0+UTn3y9KLSfaecLTni?=
 =?us-ascii?Q?qdNqYWqSIeKJnQNUzqwD0NAXcIGCJL9ntL2gInY7bZaiXhDGVmNzc+CFrfEh?=
 =?us-ascii?Q?N18vz4oije5a3E2j+yX8UH5sARvIBlqInS3T4W19sWGZlwKJPIFPVocdLoDY?=
 =?us-ascii?Q?TNOXq/xubq/yAh8ywwguqbrkIJMr05zh495q93LFT3QU4nTMuRipS0vfN4RS?=
 =?us-ascii?Q?khShNhpy6zRksNVAb+cS2dy7gVryRf1fWhAh//rU2OiGgy3gGhcUeyQQHVI7?=
 =?us-ascii?Q?R4LdczdO0j4DI8MMpzrvbTjdcmJTORAOJ5TusDV6JMj2iGybyBXfF8i0FgVg?=
 =?us-ascii?Q?ooHEITr9mqQpFmVqipVoc6368XsnOYcLwU8KKqjN99XsNlGspDg40M3S5x/K?=
 =?us-ascii?Q?TPwMSxVIWKHBv/pcCijzmYYzKhyI0ZSwyhCdN5q7qEEZBi3y7nsJafIJadXZ?=
 =?us-ascii?Q?/eqCY7BZHrgBPetJiLKfL7nwsTQ3mPYlrtuMzHITgPh4B6ypFNiytQEU9zQz?=
 =?us-ascii?Q?Ehk/JPlNXGhTxVYGJ4BSv7EOf7vstngjRvKQefF7EX7i8rDZqcOboon32oyI?=
 =?us-ascii?Q?YQcV4TiwsT0z+0Wt0mo8Eg0bQzHNjzupbjw7Q+vrjR8SwxeRMh0Y5cEwihSV?=
 =?us-ascii?Q?uowctHhAm+UpwWONnbrPgAx+U3Lctlr9HxTrFUNA2OEAyU6LcHpM23U+AHBa?=
 =?us-ascii?Q?OoJ6/SpDH57ayPhj24U5EnMXewE9P9oUBob7GAnmKoBWl91ILKb6RG4L5Qm+?=
 =?us-ascii?Q?mKJpurjJnzIswL0JeknFKxwyCLd0V1Shmw+NC37MivNV1TvjOr18M1aHGxVI?=
 =?us-ascii?Q?U2ROElsY3kLjfLwWRYyoGuyhRiEH0mqpHfhhx+BuHA53ieM2Jn05zv2yIZ4q?=
 =?us-ascii?Q?J2yO2UWgK1QgH6CvcE9IZGUjSskV06Llbae7ZPxJQHG3gQ4yvrnNmy51JTIs?=
 =?us-ascii?Q?zDYkhPcnZU+6bcK78IPLNgOPU+JHk+GGHDBaX754lYTOX5wpa+P+APnSTmQ0?=
 =?us-ascii?Q?zJmdM+AteNil2i+VuoPHI/nnGBhW7kXUwi0zTjhSPm8VjZDfzr31ZVflhING?=
 =?us-ascii?Q?X8eeDx3r9gXLWg9fwkvLZW287eBIhMdjZcDQd3S/6wXZDWbPtvobhMGOVqxe?=
 =?us-ascii?Q?IOVRFI+TLCJLs1j3EG5UXdn90VMTFRw1jvrGUEL3V4GwGxMahLyYuSo+lYwj?=
 =?us-ascii?Q?0MyYtuXTz4UnQYsjnKu5CUD3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78F8D6E82E38E54F938BE012BF0E942B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9e8795-b770-4600-d196-08d932678b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 14:44:15.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6nkpJS2EaI8rQqvI7RBj7l8ffLtByI0na7DqwD9zZzGTR7dZR5gsgR1l5cF2vbrxgoq4FLHvCrnCCzUDM9k8nJ1dNnAviRF+mhWu9P7Swg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5782
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add a ContextOption type to support functional options in NewContext.
> Then, add a variadic ContextOption parameter to NewContext, which allows
> callers to specify 0 or more configuration options.
>=20
> For now, just add the WithLogLevel option so that callers can set the
> log level of the Context's xentoollog_logger. Future configuration
> options can be created by adding an appropriate field to the
> contextOptions struct and creating a With<OptionName> function to return
> a ContextOption
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
> tools/golang/xenlight/xenlight.go | 44 +++++++++++++++++++++++++++++--
> 1 file changed, 42 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xe=
nlight.go
> index f68d7b6e97..65f93abe32 100644
> --- a/tools/golang/xenlight/xenlight.go
> +++ b/tools/golang/xenlight/xenlight.go
> @@ -136,7 +136,7 @@ func sigchldHandler(ctx *Context) {
> }
>=20
> // NewContext returns a new Context.
> -func NewContext() (ctx *Context, err error) {
> +func NewContext(opts ...ContextOption) (ctx *Context, err error) {
> 	ctx =3D &Context{}
>=20
> 	defer func() {
> @@ -146,8 +146,19 @@ func NewContext() (ctx *Context, err error) {
> 		}
> 	}()
>=20
> +	// Set the default context options. These fields may
> +	// be modified by the provided opts.
> +	copts :=3D &contextOptions{
> +		logLevel: LogLevelError,
> +	}
> +
> +	for _, opt :=3D range opts {
> +		opt.apply(copts)
> +	}
> +
> 	// Create a logger
> -	ctx.logger =3D C.xtl_createlogger_stdiostream(C.stderr, C.XTL_ERROR, 0)
> +	ctx.logger =3D C.xtl_createlogger_stdiostream(C.stderr,
> +		C.xentoollog_level(copts.logLevel), 0)
>=20
> 	// Allocate a context
> 	ret :=3D C.libxl_ctx_alloc(&ctx.ctx, C.LIBXL_VERSION, 0,
> @@ -201,6 +212,35 @@ func (ctx *Context) Close() error {
> 	return nil
> }
>=20
> +type contextOptions struct {
> +	logLevel LogLevel
> +}
> +
> +// ContextOption is used to configure options for a Context.
> +type ContextOption interface {
> +	apply(*contextOptions)
> +}
> +
> +type funcContextOption struct {
> +	f func(*contextOptions)
> +}
> +
> +func (fco *funcContextOption) apply(c *contextOptions) {
> +	fco.f(c)
> +}

Why all this convolution with interfaces and such, rather than just definin=
g ContextOption as a function pointer?  Is it just to keep contextOptions o=
ut of the documentation page?

 -George


