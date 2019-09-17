Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF55B48B8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:03:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA8QB-0007FH-5H; Tue, 17 Sep 2019 08:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=os7l=XM=amazon.de=prvs=156cae3ca=wipawel@srs-us1.protection.inumbo.net>)
 id 1iA8Q9-0007Es-4U
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:01:09 +0000
X-Inumbo-ID: 4de266ce-d921-11e9-b76c-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de266ce-d921-11e9-b76c-bc764e2007e4;
 Tue, 17 Sep 2019 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568707268; x=1600243268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=cIHr5kZQ9EauEfxZzaSPNylxuhqcEp7WiuaVWqTXT14=;
 b=lQExC0RSMlwVH/L8VXs27mwBrIXvgeXB+ffrlHBfUGv3B/Y/+MW7M/Rk
 MsLdL0VWBee5NL//5yqC/CAETTfR32yVy2bW+td8aXGv26ns3wqP+NB/0
 1u/6fca0xyDbwRUikldFWT/71YS4TwS7DctX6kA1Lh+U7MzT77i32hCzg Y=;
X-IronPort-AV: E=Sophos;i="5.64,515,1559520000"; 
 d="scan'208,217";a="833109892"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Sep 2019 08:00:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5086AA23F0; Tue, 17 Sep 2019 08:00:46 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:00:46 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:00:45 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 17 Sep 2019 08:00:45 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [PATCH v3 01/12] livepatch: Always check hypervisor build ID
 upon hotpatch upload
Thread-Index: AQHVbH5gH9Jh8tgL+kWKVAl3G2OYx6cufRaAgAEF8YA=
Date: Tue, 17 Sep 2019 08:00:45 +0000
Message-ID: <87467B74-BD80-4695-BB90-83121220CCC6@amazon.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-2-wipawel@amazon.de>
 <77408bf9-0f5c-c9f1-4c23-a8ad596c6232@citrix.com>
In-Reply-To: <77408bf9-0f5c-c9f1-4c23-a8ad596c6232@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.11]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 01/12] livepatch: Always check hypervisor
 build ID upon hotpatch upload
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3228477053511612930=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3228477053511612930==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_87467B74BD804695BB9083121220CCC6amazoncom_"

--_000_87467B74BD804695BB9083121220CCC6amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 16. Sep 2019, at 18:23, Ross Lagerwall <ross.lagerwall@citrix.com<mailto=
:ross.lagerwall@citrix.com>> wrote:

On 9/16/19 11:59 AM, Pawel Wieczorkiewicz wrote:
This change is part of a independant stacked hotpatch modules
feature. This feature allows to bypass dependencies between modules
upon loading, but still verifies Xen build ID matching.
In order to prevent (up)loading any hotpatches built for different
hypervisor version as indicated by the Xen Build ID, add checking for
the payload's vs Xen's build id match.
To achieve that embed into every hotpatch another section with a
dedicated hypervisor build id in it. After the payload is loaded and
the .livepatch.xen_depends section becomes available, perform the
check and reject the payload if there is no match.
snip
+    sec =3D livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
+    if ( sec )
+    {
+        n =3D sec->load_addr;
+
+        if ( sec->sec->sh_size <=3D sizeof(*n) )
+            return -EINVAL;
+
+        if ( xen_build_id_check(n, sec->sec->sh_size,
+                                &payload->xen_dep.p, &payload->xen_dep.len=
) )
+            return -EINVAL;
+
+        if ( !payload->xen_dep.len || !payload->xen_dep.p )
+            return -EINVAL;
+    }
+
     /* Setup the virtual region with proper data. */
     region =3D &payload->region;
 @@ -882,6 +922,10 @@ static int load_payload_data(struct payload *payload,=
 void *raw, size_t len)
     if ( rc )
         goto out;
 +    rc =3D check_xen_build_id(payload);
+    if ( rc )
+        goto out;
+
     rc =3D build_symbol_table(payload, &elf);
     if ( rc )
         goto out;

It is a bit confusing having a new function called check_xen_build_id() whe=
n there is already a xen_build_id_check(). Perhaps the new one should be ca=
lled xen_build_id_dep() as it is analogous to the existing build_id_dep()?


Yes, that definitely makes sense. I will squash it into v4. Otherwise, I ho=
pe it can be fixed upon merging.

Either way,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com<mailto:ross.lagerwal=
l@citrix.com>>

Many thanks!

Best Regards,
Pawel Wieczorkiewicz






Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_87467B74BD804695BB9083121220CCC6amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <9EBDC53456F03B448991F8D857700994@amazon.com>
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
<div class=3D"">On 16. Sep 2019, at 18:23, Ross Lagerwall &lt;<a href=3D"ma=
ilto:ross.lagerwall@citrix.com" class=3D"">ross.lagerwall@citrix.com</a>&gt=
; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">On 9/16/19 11:59 AM, Pawel Wieczorkiewicz wrote:<br class=
=3D"">
<blockquote type=3D"cite" class=3D"">This change is part of a independant s=
tacked hotpatch modules<br class=3D"">
feature. This feature allows to bypass dependencies between modules<br clas=
s=3D"">
upon loading, but still verifies Xen build ID matching.<br class=3D"">
In order to prevent (up)loading any hotpatches built for different<br class=
=3D"">
hypervisor version as indicated by the Xen Build ID, add checking for<br cl=
ass=3D"">
the payload's vs Xen's build id match.<br class=3D"">
To achieve that embed into every hotpatch another section with a<br class=
=3D"">
dedicated hypervisor build id in it. After the payload is loaded and<br cla=
ss=3D"">
the .livepatch.xen_depends section becomes available, perform the<br class=
=3D"">
check and reject the payload if there is no match.<br class=3D"">
</blockquote>
snip<br class=3D"">
<blockquote type=3D"cite" class=3D"">&#43; &nbsp;&nbsp;&nbsp;sec =3D livepa=
tch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( sec )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;{<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n =3D sec-&gt;load_addr;<br=
 class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( sec-&gt;sec-&gt;sh_siz=
e &lt;=3D sizeof(*n) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret=
urn -EINVAL;<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( xen_build_id_check(n, =
sec-&gt;sec-&gt;sh_size,<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;payload-&gt;xen_dep.p, &amp;=
payload-&gt;xen_dep.len) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret=
urn -EINVAL;<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( !payload-&gt;xen_dep.l=
en || !payload-&gt;xen_dep.p )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret=
urn -EINVAL;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;}<br class=3D"">
&#43;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Setup the virtual region with proper data.=
 */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;region =3D &amp;payload-&gt;region;<br class=
=3D"">
&nbsp;@@ -882,6 &#43;922,10 @@ static int load_payload_data(struct payload =
*payload, void *raw, size_t len)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( rc )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D=
"">
&nbsp;&#43; &nbsp;&nbsp;&nbsp;rc =3D check_xen_build_id(payload);<br class=
=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( rc )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D"">
&#43;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =3D build_symbol_table(payload, &amp;elf);=
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( rc )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D=
"">
</blockquote>
<br class=3D"">
It is a bit confusing having a new function called check_xen_build_id() whe=
n there is already a xen_build_id_check(). Perhaps the new one should be ca=
lled xen_build_id_dep() as it is analogous to the existing build_id_dep()?<=
br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Yes, that definitely makes sense. I will squash it into v4. Otherwise,=
 I hope it can be fixed upon merging.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">Either way,<br class=3D"">
<br class=3D"">
Reviewed-by: Ross Lagerwall &lt;<a href=3D"mailto:ross.lagerwall@citrix.com=
" class=3D"">ross.lagerwall@citrix.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Many thanks!</div>
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

--_000_87467B74BD804695BB9083121220CCC6amazoncom_--



--===============3228477053511612930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3228477053511612930==--


