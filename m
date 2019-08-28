Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE259A030B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 15:20:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2xoR-00019G-QG; Wed, 28 Aug 2019 13:16:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2xoQ-00019B-7z
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 13:16:34 +0000
X-Inumbo-ID: 0db165f4-c996-11e9-ac23-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0db165f4-c996-11e9-ac23-bc764e2007e4;
 Wed, 28 Aug 2019 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566998192;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=UL2LrfYzr5LLIyhisXOktIc7BIfJeWRISQrsn3ct4ms=;
 b=Nds5kIT3SmnWhTeK+FhqoJwI8oWji6OA3rPJbkoWVphitVmUSdp03jfS
 qcJw/Mh6ZVrAFND4bQZvsZnF8XE9W3GOvGlZnE+qm5XnIB2hf+be6sU8V
 +D3XzAzkg5Fz5SK3WsEHGRUZjdls/JmRPdNGDs1N1rbOlz1ErpwUtrQAN 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S2fZ4Q20U2Xhh2RkMDqz3R5zSecVKT1355VT+9FSqQqF9z7dqnr/8Ca9nugPSFEoBlaDaXfjfj
 sR5mOTlHqE7TXHr7+hGbUnZYShOiEn5cE5v6QMtcBx/kAJRiumBS0alaslHDkxwwotyFI2vLfM
 LIYNi8OSqGyohPDjiX9wlLUwt7GDc63JTiCNV4awLQ3MWj95PMFV6FMzJ49Pofw14z3sAIEex5
 LZ/DEx2z2/ZpCMv0M2UdVswZJ+uqrqemw6BQhX27F9Upwx+NCS9ZxDT6w5jymmOYmLM3J7K0rS
 X8Y=
X-SBRS: 2.7
X-MesageID: 5086227
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; d="scan'208,217";a="5086227"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0ea77999-9389-6dd9-0bc4-00202b70df70@citrix.com>
Date: Wed, 28 Aug 2019 14:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen-unstable staging build broken by pvshim patches.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8961474073350358406=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8961474073350358406==
Content-Type: multipart/alternative;
	boundary="------------CA7387B6719D9CE38AAD827F"
Content-Language: en-GB

--------------CA7387B6719D9CE38AAD827F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 08/08/2019 21:59, Sander Eikelenboom wrote:
> Hi Andrew,
>
> It seems the pvshim patches in xen-unstable staging break the build on my machine.
> I cloned a fresh tree to be sure, haven't checked which of the two commits causes it:
> 060f4eee0fb408b316548775ab921e16b7acd0e0 or 32b1d62887d01f85f0c1d2e0103f69f74e1f6fa3

So this is all horrible.  Anything which causes the linkfarm to
regenerate breaks the final symlink, which is ultimately why the build
fails.

I can't explain why my change altered the visible behaviour.

Can you build with the following patch and get linkfarm.stamp.{old,new}
from a failed build please?

~Andrew

diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Makefile
index 697bbbd57b..02acfb4cbc 100644
--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -32,6 +32,8 @@ linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
                echo $(f) >> linkfarm.stamp.tmp ;)
        cmp -s linkfarm.stamp.tmp linkfarm.stamp && \
                rm linkfarm.stamp.tmp || { \
+               cp linkfarm.stamp linkfarm.stamp.old; \
+               cp linkfarm.stamp.tmp linkfarm.stamp.new; \
                mv linkfarm.stamp.tmp linkfarm.stamp; \
                cat linkfarm.stamp | while read f; \
                  do rm -f "$(D)/$$f"; ln -s "$(XEN_ROOT)/$$f" "$(D)/$$f"; done \


--------------CA7387B6719D9CE38AAD827F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 08/08/2019 21:59, Sander Eikelenboom
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it">
      <pre class="moz-quote-pre" wrap="">Hi Andrew,

It seems the pvshim patches in xen-unstable staging break the build on my machine.
I cloned a fresh tree to be sure, haven't checked which of the two commits causes it:
060f4eee0fb408b316548775ab921e16b7acd0e0 or 32b1d62887d01f85f0c1d2e0103f69f74e1f6fa3</pre>
    </blockquote>
    <br>
    So this is all horrible.  Anything which causes the linkfarm to
    regenerate breaks the final symlink, which is ultimately why the
    build fails.<br>
    <br>
    I can't explain why my change altered the visible behaviour.<br>
    <br>
    Can you build with the following patch and get
    linkfarm.stamp.{old,new} from a failed build please?<br>
    <br>
    ~Andrew<br>
    <br>
    <pre>diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Makefile
index 697bbbd57b..02acfb4cbc 100644
--- a/tools/firmware/xen-dir/Makefile
+++ b/tools/firmware/xen-dir/Makefile
@@ -32,6 +32,8 @@ linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
                echo $(f) &gt;&gt; linkfarm.stamp.tmp ;)
        cmp -s linkfarm.stamp.tmp linkfarm.stamp &amp;&amp; \
                rm linkfarm.stamp.tmp || { \
+               cp linkfarm.stamp linkfarm.stamp.old; \
+               cp linkfarm.stamp.tmp linkfarm.stamp.new; \
                mv linkfarm.stamp.tmp linkfarm.stamp; \
                cat linkfarm.stamp | while read f; \
                  do rm -f "$(D)/$$f"; ln -s "$(XEN_ROOT)/$$f" "$(D)/$$f"; done \
</pre>
  </body>
</html>

--------------CA7387B6719D9CE38AAD827F--


--===============8961474073350358406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8961474073350358406==--

