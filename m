Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748119919E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 13:06:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ks2-000441-GQ; Thu, 22 Aug 2019 11:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CkEv=WS=amazon.de=prvs=1301474af=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0ks0-00043k-Sd
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 11:03:08 +0000
X-Inumbo-ID: 6c1a5e58-c4cc-11e9-ac23-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c1a5e58-c4cc-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566471788; x=1598007788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=XJa8HrsXTVeTCGMkTBwSygCpe7SEm+BsRaLxeHs2XAI=;
 b=fhtdQeoWgeubPYupq5XzwJjatlpheVmSNrXVw32wvEWKvvYMqcmVhdZa
 E84cq6qfga2vV75Fr/qFOZWjli86fnXyoladkNJc01xs+PxBc7WuA343F
 79ZCRiVpf51dvux8f3bY+GeWgdlonvr3CzZ4cUdd2Zp+E4bShgNmK5uHE c=;
X-IronPort-AV: E=Sophos;i="5.64,416,1559520000"; 
 d="scan'208,217";a="696432255"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Aug 2019 11:03:06 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4C76CA2239; Thu, 22 Aug 2019 11:03:06 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 11:03:05 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 11:03:05 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Thu, 22 Aug 2019 11:03:04 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 10/14] livepatch: Add support for inline asm hotpatching
 expectations
Thread-Index: AQHVV/lLGB8pkfX9Vkeh2CxPqhkquqcG+Z2AgAAIxwA=
Date: Thu, 22 Aug 2019 11:03:04 +0000
Message-ID: <BF168A04-367C-4AFD-8F76-3AEAEF059552@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-11-wipawel@amazon.de>
 <ad165593-d59d-5789-cbe6-8e797ba68a9b@arm.com>
In-Reply-To: <ad165593-d59d-5789-cbe6-8e797ba68a9b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.196]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 10/14] livepatch: Add support for inline asm
 hotpatching expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Jan
 Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7955511653189505065=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7955511653189505065==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BF168A04367C4AFD8F763AEAEF059552amazoncom_"

--_000_BF168A04367C4AFD8F763AEAEF059552amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 22. Aug 2019, at 12:31, Julien Grall <julien.grall@arm.com<mailto:julien=
.grall@arm.com>> wrote:

Hi Pawel,

On 21/08/2019 09:19, Pawel Wieczorkiewicz wrote:
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b55ad6d050..e18322350d 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -818,7 +818,7 @@ struct xen_sysctl_cpu_featureset {
  *     If zero exit with success.
  */
 -#define LIVEPATCH_PAYLOAD_VERSION 2
+#define LIVEPATCH_PAYLOAD_VERSION 3

We usually only bump the version once per release. So this is unnecessary a=
s you already did it in the previous patch.


Yes, I will keep all these changes under a single bump as promised to Konra=
d yesterday.

Cheers,

--
Julien Grall

Best Regards,
Pawel Wieczorkiewicz






Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_BF168A04367C4AFD8F763AEAEF059552amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <974F94A438C31845B96A585BEAE46896@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 22. Aug 2019, at 12:31, Julien Grall &lt;<a href=3D"mail=
to:julien.grall@arm.com" class=3D"">julien.grall@arm.com</a>&gt; wrote:</di=
v>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Hi Pawel,<br class=3D"">
<br class=3D"">
On 21/08/2019 09:19, Pawel Wieczorkiewicz wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">diff --git a/xen/include/public/sysctl=
.h b/xen/include/public/sysctl.h<br class=3D"">
index b55ad6d050..e18322350d 100644<br class=3D"">
--- a/xen/include/public/sysctl.h<br class=3D"">
&#43;&#43;&#43; b/xen/include/public/sysctl.h<br class=3D"">
@@ -818,7 &#43;818,7 @@ struct xen_sysctl_cpu_featureset {<br class=3D"">
&nbsp;&nbsp;* &nbsp;&nbsp;&nbsp;&nbsp;If zero exit with success.<br class=
=3D"">
&nbsp;&nbsp;*/<br class=3D"">
&nbsp;-#define LIVEPATCH_PAYLOAD_VERSION 2<br class=3D"">
&#43;#define LIVEPATCH_PAYLOAD_VERSION 3<br class=3D"">
</blockquote>
<br class=3D"">
We usually only bump the version once per release. So this is unnecessary a=
s you already did it in the previous patch.<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Yes, I will keep all these changes under a single bump as promised to =
Konrad yesterday.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">Cheers,<br class=3D"">
<br class=3D"">
-- <br class=3D"">
Julien Grall<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;">
Best Regards,<br class=3D"">
Pawel Wieczorkiewicz</div>
<br class=3D"Apple-interchange-newline">
</div>
<br class=3D"Apple-interchange-newline">
</div>
<br class=3D"">
<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_BF168A04367C4AFD8F763AEAEF059552amazoncom_--



--===============7955511653189505065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7955511653189505065==--


