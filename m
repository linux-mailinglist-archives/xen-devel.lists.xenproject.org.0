Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC798C95
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 09:47:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0hmE-0007bS-BP; Thu, 22 Aug 2019 07:44:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CkEv=WS=amazon.de=prvs=1301474af=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0hmC-0007bL-CC
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 07:44:56 +0000
X-Inumbo-ID: ba8e0c86-c4b0-11e9-add1-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8e0c86-c4b0-11e9-add1-12813bfff9fa;
 Thu, 22 Aug 2019 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566459893; x=1597995893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=GUyMYkCn6t9QRSMNpHWdYV81WBuXo1t0VRt2nNx5S7A=;
 b=Q0uzaqRTTTL0FJY2sMo2NZpQ5VUHAhnaK+43Dql05yP4Dmx1pCRw8Ryd
 gLoA8MtCSqD4JoTnrt7zlP8LXhNXdq2JMzN1E7WkfMPeyekMoQCyomqPb
 pRSiQ9QG01X+3rRliQTZGII77gEjPs+sD2yShjQtt5aCLXPRefvx6RHOS g=;
X-IronPort-AV: E=Sophos;i="5.64,415,1559520000"; 
 d="scan'208,217";a="416886987"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 22 Aug 2019 07:44:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 04A8CA2176; Thu, 22 Aug 2019 07:44:51 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 07:44:51 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 22 Aug 2019 07:44:50 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Thu, 22 Aug 2019 07:44:50 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 09/14] livepatch: Add per-function applied/reverted state
 tracking marker
Thread-Index: AQHVV/lI+OhiRe5NgkKqw74UV0kjMKcGIIkAgACqd4A=
Date: Thu, 22 Aug 2019 07:44:50 +0000
Message-ID: <BEEC1E7D-4A4D-406E-97C3-D5433BAE8CAF@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
In-Reply-To: <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.237]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Jan
 Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8252108337692332699=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8252108337692332699==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BEEC1E7D4A4D406E97C3D5433BAE8CAFamazoncom_"

--_000_BEEC1E7D4A4D406E97C3D5433BAE8CAFamazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 21. Aug 2019, at 23:34, Julien Grall <julien.grall@arm.com<mailto:julien=
.grall@arm.com>> wrote:

Hi Pawel,

Hi Julien,


On 8/21/19 9:19 AM, Pawel Wieczorkiewicz wrote:
Livepatch only tracks an entire payload applied/reverted state. But,
with an option to supply the apply_payload() and/or revert_payload()
functions as optional hooks, it becomes possible to intermix the
execution of the original apply_payload()/revert_payload() functions
with their dynamically supplied counterparts.
It is important then to track the current state of every function
being patched and prevent situations of unintentional double-apply
or unapplied revert.
To support that, it is necessary to extend public interface of the
livepatch. The struct livepatch_func gets additional field holding
the applied/reverted state marker.
To reflect the livepatch payload ABI change, bump the version flag
LIVEPATCH_PAYLOAD_VERSION up to 2.
The above solution only applies to x86 architecture for now.

Is this going to break livepatch on Arm? If so, do you have any plan to fix=
 it?


No, I do not think it is. But, I am unable to test on Arm (No access to HW =
and SW),
so I took the conservative approach here.

[...]

diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 2aec532ee2..a93126f631 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -117,7 +117,7 @@ int arch_livepatch_quiesce(void);
 void arch_livepatch_revive(void);
   void arch_livepatch_apply(struct livepatch_func *func);
-void arch_livepatch_revert(const struct livepatch_func *func);
+void arch_livepatch_revert(struct livepatch_func *func);

I doubt livepatch on Arm will compile after this change.


What would be you suggestion then?
Shall I limit the change to X86 everywhere
 Or maybe drop the compilation flag completely?

 void arch_livepatch_post_action(void);
   void arch_livepatch_mask(void);

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



--_000_BEEC1E7D4A4D406E97C3D5433BAE8CAFamazoncom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <9F67601149E2F44283498E74573C23D0@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 21. Aug 2019, at 23:34, Julien Grall &lt;<a href=3D"mail=
to:julien.grall@arm.com" class=3D"">julien.grall@arm.com</a>&gt; wrote:</di=
v>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Hi Pawel,<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Hi Julien,</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D""><br class=3D"">
On 8/21/19 9:19 AM, Pawel Wieczorkiewicz wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Livepatch only tracks an entire payloa=
d applied/reverted state. But,<br class=3D"">
with an option to supply the apply_payload() and/or revert_payload()<br cla=
ss=3D"">
functions as optional hooks, it becomes possible to intermix the<br class=
=3D"">
execution of the original apply_payload()/revert_payload() functions<br cla=
ss=3D"">
with their dynamically supplied counterparts.<br class=3D"">
It is important then to track the current state of every function<br class=
=3D"">
being patched and prevent situations of unintentional double-apply<br class=
=3D"">
or unapplied revert.<br class=3D"">
To support that, it is necessary to extend public interface of the<br class=
=3D"">
livepatch. The struct livepatch_func gets additional field holding<br class=
=3D"">
the applied/reverted state marker.<br class=3D"">
To reflect the livepatch payload ABI change, bump the version flag<br class=
=3D"">
LIVEPATCH_PAYLOAD_VERSION up to 2.<br class=3D"">
The above solution only applies to x86 architecture for now.<br class=3D"">
</blockquote>
<br class=3D"">
Is this going to break livepatch on Arm? If so, do you have any plan to fix=
 it?<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>No, I do not think it is. But, I am unable to test on Arm (No access t=
o HW and SW),</div>
<div>so I took the conservative approach here.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">[...]<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">diff --git a/xen/include/xen/livepatch=
.h b/xen/include/xen/livepatch.h<br class=3D"">
index 2aec532ee2..a93126f631 100644<br class=3D"">
--- a/xen/include/xen/livepatch.h<br class=3D"">
&#43;&#43;&#43; b/xen/include/xen/livepatch.h<br class=3D"">
@@ -117,7 &#43;117,7 @@ int arch_livepatch_quiesce(void);<br class=3D"">
&nbsp;void arch_livepatch_revive(void);<br class=3D"">
&nbsp;&nbsp;&nbsp;void arch_livepatch_apply(struct livepatch_func *func);<b=
r class=3D"">
-void arch_livepatch_revert(const struct livepatch_func *func);<br class=3D=
"">
&#43;void arch_livepatch_revert(struct livepatch_func *func);<br class=3D"">
</blockquote>
<br class=3D"">
I doubt livepatch on Arm will compile after this change.<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>What would be you suggestion then?</div>
<div>Shall I limit the change to X86 everywhere</div>
<div>&nbsp;Or maybe drop the compilation flag completely?</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">
<blockquote type=3D"cite" class=3D"">&nbsp;void arch_livepatch_post_action(=
void);<br class=3D"">
&nbsp;&nbsp;&nbsp;void arch_livepatch_mask(void);<br class=3D"">
</blockquote>
<br class=3D"">
Cheers,<br class=3D"">
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

--_000_BEEC1E7D4A4D406E97C3D5433BAE8CAFamazoncom_--



--===============8252108337692332699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8252108337692332699==--


