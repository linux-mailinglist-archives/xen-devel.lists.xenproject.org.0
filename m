Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDEA131224
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 13:25:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioROr-00086o-Po; Mon, 06 Jan 2020 12:22:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qyqH=23=amazon.de=prvs=267241f8d=wipawel@srs-us1.protection.inumbo.net>)
 id 1ioROq-00086j-Kq
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 12:22:24 +0000
X-Inumbo-ID: 3111f4aa-307f-11ea-aafa-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3111f4aa-307f-11ea-aafa-12813bfff9fa;
 Mon, 06 Jan 2020 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1578313344; x=1609849344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=tVt7xn56RDl7nu4foZVMP8s1lyE92SgqD3yyXUo8WMA=;
 b=iPXPMoy558JFs2wqF9aOTG01PQ4q17L3/eAjVPI4e4iC1F6znoO6UG8t
 xWLOFtcu9BIpB6JI5HHaHOQRx0MGIl1zuMQr5hbs+QR+jul81WYhpuiQq
 OfefkbF8R+cvxDSvkmyOOb0iz/t4ys6E8SuRQhnyea733OQU1KkNc+Pu9 8=;
IronPort-SDR: kVCF/wDxNvuwzTWj2JM8cD8BmZX8R2zVAp4XkmbKLFmoC+KfDk5gfORb737RGdrdSmj5Aqi15S
 uAMlgLZLQH9w==
X-IronPort-AV: E=Sophos;i="5.69,402,1571702400"; d="scan'208,217";a="8590729"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 06 Jan 2020 12:22:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id BD18FA06B7; Mon,  6 Jan 2020 12:22:08 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 6 Jan 2020 12:22:07 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 6 Jan 2020 12:22:06 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 6 Jan 2020 12:22:06 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v6 07/12] livepatch: Add per-function applied/reverted
 state tracking marker
Thread-Index: AQHVpEF02rAa6UooNU61iH0I9SNjr6fcMEMAgAGfCQA=
Date: Mon, 6 Jan 2020 12:22:06 +0000
Message-ID: <33212E65-06EE-4F80-9DAA-99F420615936@amazon.com>
References: <20191126100801.124844-1-wipawel@amazon.de>
 <20191126100801.124844-8-wipawel@amazon.de>
 <355ad943-8d05-d8fa-768f-2707630a7299@citrix.com>
In-Reply-To: <355ad943-8d05-d8fa-768f-2707630a7299@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.56]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 07/12] livepatch: Add per-function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2160861068742881760=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2160861068742881760==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_33212E6506EE4F809DAA99F420615936amazoncom_"

--_000_33212E6506EE4F809DAA99F420615936amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5. Jan 2020, at 12:36, Andrew Cooper <andrew.cooper3@citrix.com<mailto:a=
ndrew.cooper3@citrix.com>> wrote:

On 26/11/2019 10:07, Pawel Wieczorkiewicz wrote:
@@ -1274,6 +1297,9 @@ static void livepatch_do_action(void)
        else
<snip>
        break;
@@ -1309,6 +1338,9 @@ static void livepatch_do_action(void)
            else
                other->rc =3D revert_payload(other);

+            if ( !was_action_consistent(other, rc ? LIVEPATCH_FUNC_APPLIED=
 : LIVEPATCH_FUNC_NOT_APPLIED) )
+                panic("livepatch: partially reverted payload '%s'!\n", oth=
er->name);
+
            if ( other->rc =3D=3D 0 )
                revert_payload_tail(other);

Coverity highlights that this contains dead code.

The LIVEPATCH_ACTION_REPLACE case, unlike all others, uses other->rc,
which means the rc ? : check will always pass LIVEPATCH_FUNC_APPLIED
into was_action_consistent(), due to the rc =3D 0 at the head of the case
block.


Yes, this has to be other->rc instead of rc. Thanks!

If this were the only problem, switching rc to other->rc might be ok,
but there look to be other confusions in the surrounding code.  Would
you mind looking over the whole block of code for correct error handling?


What are the confusions in the code? Could you be more specific and point m=
e to them?

I have just checked the LIVEPATCH_ACTION_REPLACE case block again.
It looks correct to me. That is, it preserves the original logic of error h=
andling there.
I just added the extensions. But, the flow for rc and other->rc should be t=
he same
and correct (modulo the was_action_consistent() bug).

For any resulting patch, the Coverity ID is 1457467

~Andrew

            else
@@ -1329,6 +1361,9 @@ static void livepatch_do_action(void)
            else
                rc =3D apply_payload(data);

+            if ( !was_action_consistent(data, rc ? LIVEPATCH_FUNC_NOT_APPL=
IED : LIVEPATCH_FUNC_APPLIED) )
+                panic("livepatch: partially applied payload '%s'!\n", data=
->name);
+
            if ( rc =3D=3D 0 )
                apply_payload_tail(data);
        }



Best Regards,
Pawel Wieczorkiewicz






Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_33212E6506EE4F809DAA99F420615936amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <514EE4376D6A7C4CA92E35B3381833C3@amazon.com>
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
<div class=3D"">On 5. Jan 2020, at 12:36, Andrew Cooper &lt;<a href=3D"mail=
to:andrew.cooper3@citrix.com" class=3D"">andrew.cooper3@citrix.com</a>&gt; =
wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">On 26/11/2019 10:07, Pawel Wieczorkiewicz wrote:<br class=
=3D"">
<blockquote type=3D"cite" class=3D"">@@ -1274,6 &#43;1297,9 @@ static void =
livepatch_do_action(void)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br class=3D"">
</blockquote>
</div>
</div>
</blockquote>
&lt;snip&gt;<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">
<blockquote type=3D"cite" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;break;<br class=3D"">
@@ -1309,6 &#43;1338,9 @@ static void livepatch_do_action(void)<br class=3D=
"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;els=
e<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;other-&gt;rc =3D revert_payload(other);<br class=3D"">
<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( !was_action_consistent(other, rc ? LIVEPATCH_FUNC_APPLIED : LIVEPATCH_FUN=
C_NOT_APPLIED) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;panic(&quot;livepatch: partially reverted payload '%s'=
!\n&quot;, other-&gt;name);<br class=3D"">
&#43;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( other-&gt;rc =3D=3D 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;revert_payload_tail(other);<br class=3D"">
</blockquote>
<br class=3D"">
Coverity highlights that this contains dead code.<br class=3D"">
<br class=3D"">
The LIVEPATCH_ACTION_REPLACE case, unlike all others, uses other-&gt;rc,<br=
 class=3D"">
which means the rc ? : check will always pass LIVEPATCH_FUNC_APPLIED<br cla=
ss=3D"">
into was_action_consistent(), due to the rc =3D 0 at the head of the case<b=
r class=3D"">
block.<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Yes, this has to be other-&gt;rc instead of rc. Thanks!</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">If this were the only problem, switching rc to other-&gt;rc=
 might be ok,<br class=3D"">
but there look to be other confusions in the surrounding code.&nbsp; Would<=
br class=3D"">
you mind looking over the whole block of code for correct error handling?<b=
r class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>What are the confusions in the code? Could you be more specific and po=
int me to them?</div>
<div><br class=3D"">
</div>
<div>I have just checked the&nbsp;LIVEPATCH_ACTION_REPLACE case block again=
.</div>
<div>It looks correct to me. That is, it preserves the original logic of er=
ror handling there.</div>
<div>I just added the extensions. But, the flow for rc and other-&gt;rc sho=
uld be the same</div>
<div>and correct (modulo the was_action_consistent() bug).</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">For any resulting patch, the Coverity ID is 1457467<br clas=
s=3D"">
<br class=3D"">
~Andrew<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br class=3D"">
@@ -1329,6 &#43;1361,9 @@ static void livepatch_do_action(void)<br class=3D=
"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;els=
e<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;rc =3D apply_payload(data);<br class=3D"">
<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( !was_action_consistent(data, rc ? LIVEPATCH_FUNC_NOT_APPLIED : LIVEPATCH_=
FUNC_APPLIED) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;panic(&quot;livepatch: partially applied payload '%s'!=
\n&quot;, data-&gt;name);<br class=3D"">
&#43;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( rc =3D=3D 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;apply_payload_tail(data);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
<br class=3D"">
</blockquote>
<br class=3D"">
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
<br>Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_33212E6506EE4F809DAA99F420615936amazoncom_--



--===============2160861068742881760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2160861068742881760==--


