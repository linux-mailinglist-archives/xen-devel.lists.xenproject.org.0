Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905A283253
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2884.8238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPM45-0002Cf-OY; Mon, 05 Oct 2020 08:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2884.8238; Mon, 05 Oct 2020 08:41:49 +0000
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
	id 1kPM45-0002CG-L2; Mon, 05 Oct 2020 08:41:49 +0000
Received: by outflank-mailman (input) for mailman id 2884;
 Mon, 05 Oct 2020 08:41:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kPM43-0002CA-VI
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:41:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d823c961-0ce5-43ed-a64d-fc0dd843bf4f;
 Mon, 05 Oct 2020 08:41:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1kPM43-0002CA-VI
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:41:47 +0000
X-Inumbo-ID: d823c961-0ce5-43ed-a64d-fc0dd843bf4f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d823c961-0ce5-43ed-a64d-fc0dd843bf4f;
	Mon, 05 Oct 2020 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601887308;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OllybNQ6Qdh+3LA1pRggAX2btkPQ3BruEMMbVLallSo=;
  b=iZiNBPNOC+m7SpLbNxbEzz/NI9i7AYh26ivCCMuHihL8HFD1m03AHw4k
   jOxrt4tO+jqnXKkNhrJo7QDDAbKfggrjWT6GRsruiefmqQm8VLTDjzvdF
   Pzadd1GgN52x7GK5x3fN9k3+96oN6CtDTV+bghQIuaigCu4Gstq56KlnG
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OnpN2/uv4joqDM0ZjLWDKk9DoeXZuMOYiZQPtBenXpWiGchcOne74pQjmiLLSdArZifMG750UE
 XZb/PMgCnU7U3YBZpkeaiF5H480peptsNfTjo+P/wcNwXViFiI4DYEFa0S3Z1ur4M5ClN6sNTW
 dnfTWqvZr0Jyldge18f2MwJrfowL5GOFCyymYnRut9rWqAdRvV8FjdzpnHNEmPiqwTgJZrLqOx
 Pq06lnkMWJqMn8H8sLkPq0yNTG3Z1mUTKWuQwL9pj7gDdhGD4AMyDKTr6UIMXBRYX5Qkdc2oyG
 T30=
X-SBRS: None
X-MesageID: 28604524
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28604524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDI+te7A30rYc9YVctY0PgFcu7amdGNAStU/5KldwTGfe6hDCMnNz5ZOgoTcQ/oDQfbyt5OzZ+Ul0+fmev/We3wYMJaNMiV+fYnWaKZGBIArxiEZL2dSyv1vvIonmgAtrJeR9/2WSDOVVoOMDuHG+WvwovR34X4GscQiY53A8b6A+zMvo2/VPek6Cza5IQGF9aa0vpEAtuIh51PQuevG8ZjEmk11QYf9umWJUi/fVD0XainrIiO0mA5qKkj7L+BopnkoH81WDkWROZWcSjfcEiWUWNN7n30udal5Xk2MNYWF/WZRS/TFCr77nxkgThIP9ZX/fUWTLJEbSoOwUpd0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5x/wKUN848vzuEGdVqXm88LxLsR0dTcojzg97lUdSQ=;
 b=J2yR/gMQ/Hrb/g3Q4Hv70I55Nbil19R/y8Wjw/4J40eeWJAiTtmDy8ND0Nw45o0S0zXDf0aSWWiSdXZgdEOvt2b/7vZ91c1a2PqynT9VAYP3XwpUXdEwkIrjwpO1zI+JQgRGVQXXEpS0GIAMmoZFFRPB5EIpSsZNlYuVuJzyLH8m/zXEgKpJ8Qy/0pvxPxiD7U1RZHKHD58Pt+2O1dWn72mtPdBOfkmUQlodn3PXjzgML+wV7djWqsA8kilJJAxBBOOFM46s1qEcVsiCND6/M70VaAoePfRcbGzp7bJEkTOcaGNZyY5RQwJW1+rINiF/CNojiAc5BVrpFKIdYkezNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5x/wKUN848vzuEGdVqXm88LxLsR0dTcojzg97lUdSQ=;
 b=fPGXnwIVD4zwDN9iO3NH/xTtqgHkQhR52Ds0Q9Ns+OLWv43ZxGii1pH02jQHDWc6qp2DaV34z7i/3klNNqLdf6nrDP8Or7BO3yXBgcNnDuaOG5qRlmDfTH2zlzuqyKmkvzuLruVQ5yJaO+hIQy5rILn2nNw71ftX9gigAxmqqAU=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v1 1/1] tools/ocaml/xenstored: drop the creation of the RO
 socket
Thread-Topic: [PATCH v1 1/1] tools/ocaml/xenstored: drop the creation of the
 RO socket
Thread-Index: AQHWmNZM2MiF3TuZZUy8keCMro/BnqmItKvH
Date: Mon, 5 Oct 2020 08:40:31 +0000
Message-ID: <DS7PR03MB56552313737C8007598620F1F60C0@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <cover.1601654648.git.edvin.torok@citrix.com>,<0cc19ced022e2a302fccf42bf9521c61dd0dca8a.1601654648.git.edvin.torok@citrix.com>
In-Reply-To: <0cc19ced022e2a302fccf42bf9521c61dd0dca8a.1601654648.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5b19a48-8a90-41b6-7713-08d8690a518f
x-ms-traffictypediagnostic: DM5PR03MB3355:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR03MB33554D253D13323754E6A048F60C0@DM5PR03MB3355.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JNPDZsQj/QxAA26DQlHDYFmW7qStZwyhiNdEBGWvtp2soIZbylGTrE6D+8twFpDlIZB3tVMF/QANC4mpSCazDTyHazMk40l0yzyTqleG7ajtyehQnTIOrZoQJ8rbgTTuL0G8V/Y3Gi61XeS6x05/mglrTMZRqjM0yweESg4+ped61S1UP8aRQRbOPO1DFw/AFL6ZZu9fW1wW4JetUlp9Jah7qsEWwJsLe2GZEQ92IY41h/1yioxnMZcc0Ew/drxR2oXWAr8noKvfYtGexiQlKRL/we+ckJlYh20M2g/B1BJevpBUx+pdUCbl5B613edN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(55016002)(52536014)(66476007)(9686003)(8936002)(66946007)(8676002)(316002)(4326008)(2906002)(5660300002)(478600001)(83380400001)(110136005)(54906003)(33656002)(6506007)(53546011)(76116006)(91956017)(66574015)(26005)(7696005)(186003)(55236004)(44832011)(64756008)(66556008)(71200400001)(86362001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: UqHiE7QtEP1XT74Z7ReDsPulQsewFiJBLhXlfigxso7fWsfDnk6qi1ovAQjonU2Ti0mP7gYDsgM431SQTGSQIYt6JXfTS1mwHLVj4FZytF/QN4oQEoiev7r2makZHKGKd2DqYh05crO9WNYLGE/vlPb12lgJODlWLUmQ5LSbgGQOa/vd4GyuLMcMa8MdoxdKU5S8PTjiZgEBDBJG/gtFORyFuCJ18RYUUbWF+4Pxu42Wc2cQC2SdK8N8irfLcCbFsLfvSMOufQnxDiQsetgK8/cCYesy3iOtbpyklz5jecIXLtKF4h7kufPGPXdjmy/YPIGdLjBXlwSjOeOjuSRK9Z6q07QSXyrykL6jL6UApLPxsiWAos/qLWy6ezt//3XSaZEAUDCw3Oc11U54CFA7LXSL0fRVwKJ5G8VIgvrlEqmDiAVZuJLq3sWoj68iQ0l4Q4OHMeYsxsUMIZ8lhhPlLmwivWdAbq/lGzWdYmNcYi8wnz1igUo7PJ4TTuUvqmjc6jI0swYDX4kOb2pjSdKsRLOyUb86ckmntUiXem8XZcaGTJTVJCmxQEn+WvwImAFye0MyG+vekT+1om5ecQuzIMM79NuryVuXGIfN9ypW4mjJoNGE093SG/yBgZXYmHxSviGNpKk2F8/ugPDnEcOC6w==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b19a48-8a90-41b6-7713-08d8690a518f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 08:40:31.0467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qM0eEW4LhMJsMoK8EJu+/uq0R/lcRYVSWTgKBrXE+7kW1/gesHNQRqTF4xGWY9Zc5GAhyj3vseBkcDWoGjM4c5qTAqRe727C9VB1nI+19Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3355
X-OriginatorOrg: citrix.com

--
Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>
Sent: 02 October 2020 17:06
To: xen-devel@lists.xenproject.org
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu
Subject: [PATCH v1 1/1] tools/ocaml/xenstored: drop the creation of the RO =
socket

The readonly flag was propagated but ignored, so this was essentially
equivalent to a RW socket.

C xenstored is dropping the RO socket too, so drop it from oxenstored too.

Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/define.ml      |  1 -
 tools/ocaml/xenstored/xenstored.ml   | 15 ++++++---------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/c=
onnections.ml
index f02ef6b526..f2c4318c88 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -31,7 +31,7 @@ let create () =3D {
        watches =3D Trie.create ()
 }

-let add_anonymous cons fd _can_write =3D
+let add_anonymous cons fd =3D
        let xbcon =3D Xenbus.Xb.open_fd fd in
        let con =3D Connection.create xbcon None in
        Hashtbl.add cons.anonymous (Xenbus.Xb.get_fd xbcon) con
diff --git a/tools/ocaml/xenstored/define.ml b/tools/ocaml/xenstored/define=
.ml
index 2965c08534..ea9e1b7620 100644
--- a/tools/ocaml/xenstored/define.ml
+++ b/tools/ocaml/xenstored/define.ml
@@ -18,7 +18,6 @@ let xenstored_major =3D 1
 let xenstored_minor =3D 0

 let xs_daemon_socket =3D Paths.xen_run_stored ^ "/socket"
-let xs_daemon_socket_ro =3D Paths.xen_run_stored ^ "/socket_ro"

 let default_config_dir =3D Paths.xen_config_dir

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xen=
stored.ml
index 5b96f1852a..7e7824761b 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -242,12 +242,11 @@ let _ =3D
                ()
        );

-       let rw_sock, ro_sock =3D
+       let rw_sock =3D
                if cf.disable_socket then
-                       None, None
+                       None
                else
-                       Some (Unix.handle_unix_error Utils.create_unix_sock=
et Define.xs_daemon_socket),
-                       Some (Unix.handle_unix_error Utils.create_unix_sock=
et Define.xs_daemon_socket_ro)
+                       Some (Unix.handle_unix_error Utils.create_unix_sock=
et Define.xs_daemon_socket)
                in

        if cf.daemonize then
@@ -320,15 +319,14 @@ let _ =3D

        let spec_fds =3D
                (match rw_sock with None -> [] | Some x -> [ x ]) @
-               (match ro_sock with None -> [] | Some x -> [ x ]) @
                (if cf.domain_init then [ Event.fd eventchn ] else [])
                in

        let process_special_fds rset =3D
-               let accept_connection can_write fd =3D
+               let accept_connection fd =3D
                        let (cfd, _addr) =3D Unix.accept fd in
                        debug "new connection through socket";
-                       Connections.add_anonymous cons cfd can_write
+                       Connections.add_anonymous cons cfd
                and handle_eventchn _fd =3D
                        let port =3D Event.pending eventchn in
                        debug "pending port %d" (Xeneventchn.to_int port);
@@ -348,8 +346,7 @@ let _ =3D
                        if List.mem fd set then
                                fct fd in

-               maybe (fun fd -> do_if_set fd rset (accept_connection true)=
) rw_sock;
-               maybe (fun fd -> do_if_set fd rset (accept_connection false=
)) ro_sock;
+               maybe (fun fd -> do_if_set fd rset accept_connection) rw_so=
ck;
                do_if_set (Event.fd eventchn) rset (handle_eventchn)
        in

--
2.25.1


