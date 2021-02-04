Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7AA30F13A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81233.149709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cF9-0008DX-19; Thu, 04 Feb 2021 10:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81233.149709; Thu, 04 Feb 2021 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cF8-0008D8-UH; Thu, 04 Feb 2021 10:52:10 +0000
Received: by outflank-mailman (input) for mailman id 81233;
 Thu, 04 Feb 2021 10:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jl0U=HG=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l7cF7-0008D3-3v
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:52:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde135cd-2190-417e-9a7a-fe50e5c478fe;
 Thu, 04 Feb 2021 10:52:07 +0000 (UTC)
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
X-Inumbo-ID: fde135cd-2190-417e-9a7a-fe50e5c478fe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612435927;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+RrCOgS5bqqy1znkZWAwJEgj8uOIvRFpn+StFHTw/tc=;
  b=WBSZo9t4KEVufASz77kTre2fW810n8BXPC6Oix5Cfa1VTxsxgOupHwGC
   TwVEVutvDFmg81AjpDR8Ej3VzaI04/xgI037deyTIpIMmNa3rSFBnOqVs
   o53E6vNJ6qrVQX0SqXuZDKvVmzyu5bdRhUYrQLDzlg2bkpLZglGCD0a7x
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DqMqhx+JEI+J+j6VoIfDYeLBiX1QlMtbV6GCcvQ0geFcX17WaltYtY7MW55p3wWLRqhNhYtq3Q
 QjSMZuvCHLUIs9pkqUvKwEZ/tw+0TRVGU/KTzxvBRCrKd/qJl4S4cOUDtAmUS+Qx7sLPK/PdQH
 eVu2AiLYWg4WtYjaKf15YLGfitRa8/1O+T7Auk8X5KUoHsO1JS49B3xI1e3e+BY2qYM1odfL/j
 6OK37eQBx0zn9hp41/P4eHpNRDcmqKuU+GekUv3uvOeiVlOQfLCRwYsri0MXqpvy6zQ2vyzUDz
 Nbs=
X-SBRS: 5.2
X-MesageID: 36491183
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36491183"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAaP0d26FshZ6wzmD7AeCYT2EkYo/6vekY2A5Tygp6KmYG4Y96HwoySAD6EbkewafF/LJwqs9H8dVhlb3IFNmKy+3CPSAXQOQO7090WrPz+dzGQrrrNyirHk9T4grWIydNTd/cTE7VGFi4zXgN3lpklDqYjHhfQ1G9vLEU50mDLsvkFwJXHdnc9Hf17xEEbTvJGIGuQVNtBadSbWaOUQd+7Nrdsb1vftVP74mybjXlyYcMWsTaN+VugMYAtlLf8fI7zuhJ28sLPLjJa11BAy78kIVq4h7B5FzPzBxdDfTQJu3fcHU4NdMZXS8Fl5n80xUcuKBMLBsf7vfygrfW6J2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76niKCVuE399JwJvasuKex51F5wmIyh13P0i0k6gpwg=;
 b=P/uZPCCrwHXATOjkQYbeZwfb2kLyHVYp8n7akJQUd9d7v8DuHYuQ9Mv1hmh9Q3gyAsMBcsrbnCJBl4DCw/r4E9V2RmFkQR+TenO/em51f5D2fbu1q/57H7WXddyPk5BZmL4Q6cP0YpZNeyOdZ/5PMg9IoGV5xI+tXodWgX/m5FbNc8F9PUUjlIgyRfN1EmSLPMfCFOZS8NFWWQfRjmW6DaVsd+uVWjenBkblnOlXQeKvjF1EakQr16b43bLj6RSGph9eryQaSL2N0r6szlRtUi7ifzcTWwwKqjSHWoZQz6Gs63Tgk1tfQ6lPaAY5yrlA7KlwT6N5yLeM9LMVbDUrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76niKCVuE399JwJvasuKex51F5wmIyh13P0i0k6gpwg=;
 b=vlibNGRPaZC+DUeCQVKyTax8NL5uruJIZY2DjvQ50e/6u7K3xMZYrSkxnZBRnBWiqxbmPEeP3Gn5j5ehxrsPrW06Ausc+DMoDUqlICV5KaDMlbVmFS1Dtt5bdVr2wolsMmxuqOE83kytS6FwQSQa68xllYRgVnGPRceDvdEIZik=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Edwin Torok <edvin.torok@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] tools/oxenstored: Reject invalid watch paths early
Thread-Topic: [PATCH 2/3] tools/oxenstored: Reject invalid watch paths early
Thread-Index: AQHW+lMQLgaeDrvHYEyTG7gcxvIkFqpH0ZCg
Date: Thu, 4 Feb 2021 10:51:50 +0000
Message-ID: <MWHPR03MB2445436997A3F5D6644AB575F6B39@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>,<20210203173549.21159-3-andrew.cooper3@citrix.com>
In-Reply-To: <20210203173549.21159-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2493a915-9920-4e1f-e7f1-08d8c8fae0bb
x-ms-traffictypediagnostic: MWHPR03MB3278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB3278066F9C7464534FD75108F6B39@MWHPR03MB3278.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ULoFI9ZklkB07pVdnO337RFnmZfFLvx7gXcsnuSMpY/z+26f0YHLqbW0TTiVy+68Di0tA3w5V1LvhM9BxW9b8DWRYcGvg7EWLbLYvHFUmpA46eC49Zr9Rsb8niBf2Ktjd5yfZosi2CzhBEUUPFJ7KLC+GJ9sixsgyQwwam8oJS8qPQmcZfYWOpJecrncP7Q85K8bTRmx/wwfyIy3dBUczycjtRX3S25E7B4T2SFenbablU3Dx6hJUnRsDRwpapssdqvovEKfkZuGHFrc1VBoV35y3klB4htfh8l0PcWFEJBe0MndUBrT75r+XcjDnVe47hdrbUQXnpQbej66Q0CB7n5qG0Z1o995uuJ37RPNTn5lroNZkZooqFdD+k2hWOqyowGfw/1wuZqL7n37W57E98Vc8CrxCwLmnwND2CWGdV9SajcZi7lA4uiFHuncp1xikPMRoFxGxWsUSHTEKnTNfCkOfSgGU8RBVJs0zdSPnG2CyAer4igkzEizzFA6nlxUFOTVwFoT/N9gbRakQ3MFdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(2906002)(9686003)(71200400001)(52536014)(44832011)(33656002)(54906003)(5660300002)(110136005)(26005)(6506007)(53546011)(66946007)(7696005)(66476007)(8936002)(66556008)(66446008)(64756008)(91956017)(76116006)(83380400001)(8676002)(478600001)(86362001)(55016002)(66574015)(186003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?NE8nlAOB0NGbXly2v3hmFt1SmrawSfeywSQerDXxR6hltiAJiWGvnZDvp2?=
 =?iso-8859-1?Q?Sx3klsUP5Ys637e1+eVDq+yYm56E4CbIfvQ1VZlNJ9GiUdgRmxtGfShkQy?=
 =?iso-8859-1?Q?xjUzUftsZThbBmsoqMrPVbBLnB5D3UJtRgyyPR0RvdRkAz5nAlWCaGC/yA?=
 =?iso-8859-1?Q?R2cAmBhiUWd/aaG3H6Xtht87X9Vu7xIgpzguEGkvabIj1cv6bFI6Dp4fGM?=
 =?iso-8859-1?Q?b2Hai+jby6+5B3ob+RJrjSSnwHLyv9z5u7Zv2qTOdmIo/SiCd46kudOKV6?=
 =?iso-8859-1?Q?AsmaW9uLg97ahdF7wkOz6BZ3LDJbu4MMoeny+HU6HY/LTvKyhF+9HRpdXB?=
 =?iso-8859-1?Q?2sHevQfP9byWeA/TwAOvGZYatSIDXS4amON2pEkFxVuHwsdsESzcvtGcAB?=
 =?iso-8859-1?Q?GSitK/uQsikKkZo2NItJrw3WuW2Ndpu3CG2uzcbKYspMle5KdyK0LJ37ZX?=
 =?iso-8859-1?Q?PZ92IvB9BQHhscLx2ZO6xlqyhdJHt9SebY3zrFqPWDDliROxDuCarcuMYR?=
 =?iso-8859-1?Q?2Jc3BFZLWh2hq+W6isvD2ExnCHr6/3MVj2qoz5IY78u2daucFvFz/Kvu4I?=
 =?iso-8859-1?Q?egriDDPTUp19c2NA6PPzOyk7JOqLTKT/e/ltrjVpyLFCDJ+R0NrgJ62Z+H?=
 =?iso-8859-1?Q?Ke97AtGtSjqKcKJ3x73ryxXfJfcksHQpXPg/8KW7BsY8CTPRZAX1EjssIg?=
 =?iso-8859-1?Q?mz1ZEcznfeMPds+4MLI9+1Qri8K+7d7NabN4metdkaGD0pl6YT5wBkuCHL?=
 =?iso-8859-1?Q?ZZF3syxHLS6FOhtEAiqlM/YnzHwk4qNJsM+TDry8Xr3PDk0q/+vwrCcD5q?=
 =?iso-8859-1?Q?ntMKUqU5sYDswuPfhuy4hCiE+OmlkzE73dRf301QI9VEN/Hdbl1RIeedD6?=
 =?iso-8859-1?Q?AVqeaBM3oS3gbKz4g7ApTOWdG4OzFTJgY8Bpy1L0EqvJf5QCarq1WPPJry?=
 =?iso-8859-1?Q?3qegc3tmrPh/Q/cehycJd1ehr3WbEoOOWy9zOmWv/uoT/d+037U0uHA6pP?=
 =?iso-8859-1?Q?xJbNFEynf5kBe0w4rgohcjCVLeHtPAW/x/0wDoXU0Hy/DZFzPNAaE8DwuM?=
 =?iso-8859-1?Q?dt1N8eCMU273EJjg4+E7IARr3yVnB6z9bRTAcYfy016D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2493a915-9920-4e1f-e7f1-08d8c8fae0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 10:51:50.9226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKOJmz+pwZSBy+2l/Wj4gyaRhnNQuoSmJI957ti0+2diCS052mq20k/OussMcqdnRiz1Q+nVMbbpY3tjBz8TaGjm0eakVU4/wIwI6KW9+64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3278
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

Great work. Fuzzing is often thought as best to find bugs in languages like=
 C where memory is explicitly managed but here it reveals logical bugs.

________________________________________
From: Andrew Cooper <andrew.cooper3@citrix.com>
Sent: 03 February 2021 17:35
To: Xen-devel
Cc: Edwin Torok; Christian Lindig; Ian Jackson; Wei Liu
Subject: [PATCH 2/3] tools/oxenstored: Reject invalid watch paths early

From: Edwin T=F6r=F6k <edvin.torok@citrix.com>

Watches on invalid paths were accepted, but they would never trigger.  The
client also got no notification that its watch is bad and would never trigg=
er.

Found again by the structured fuzzer, due to an error on live update reload=
:
the invalid watch paths would get rejected during live update and the list =
of
watches would be different pre/post live update.

The testcase is watch on `//`, which is an invalid path.

Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/co=
nnection.ml
index d09a0fa405..65f99ea6f2 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -158,18 +158,17 @@ let get_children_watches con path =3D
 let is_dom0 con =3D
        Perms.Connection.is_dom0 (get_perm con)

-let add_watch con path token =3D
+let add_watch con (path, apath) token =3D
        if !Quota.activate && !Define.maxwatch > 0 &&
           not (is_dom0 con) && con.nb_watches > !Define.maxwatch then
                raise Quota.Limit_reached;
-       let apath =3D get_watch_path con path in
        let l =3D get_watches con apath in
        if List.exists (fun w -> w.token =3D token) l then
                raise Define.Already_exist;
        let watch =3D watch_create ~con ~token ~path in
        Hashtbl.replace con.watches apath (watch :: l);
        con.nb_watches <- con.nb_watches + 1;
-       apath, watch
+       watch

 let del_watch con path token =3D
        let apath =3D get_watch_path con path in
diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/c=
onnections.ml
index 8a66eeec3a..3c7429fe7f 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -114,8 +114,10 @@ let key_of_path path =3D
        "" :: Store.Path.to_string_list path

 let add_watch cons con path token =3D
-       let apath, watch =3D Connection.add_watch con path token in
+       let apath =3D Connection.get_watch_path con path in
+       (* fail on invalid paths early by calling key_of_str before adding =
watch *)
        let key =3D key_of_str apath in
+       let watch =3D Connection.add_watch con (path, apath) token in
        let watches =3D
                if Trie.mem cons.watches key
                then Trie.find cons.watches key
--
2.11.0


