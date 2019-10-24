Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F1E2F4F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 12:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNaYZ-0004gn-W7; Thu, 24 Oct 2019 10:41:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncnf=YR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNaYY-0004gi-Qt
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:41:26 +0000
X-Inumbo-ID: d1b84662-f64a-11e9-949b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b84662-f64a-11e9-949b-12813bfff9fa;
 Thu, 24 Oct 2019 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571913682;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to; bh=CczznEqgwV2ksgmmtUBK9Ba5KJ1eGc7dWaJtZvpGNTc=;
 b=YAYaP1tX6SS3XMc78Ar17r6q8bUCpULYbahDKp86Yt0PVbpZU7F04WUF
 qAwbSoEz0PjLoYYyIHVph90qKcLOAB02J3DBFaYvo60AxSQ17SFchPKn4
 AW+C349hhIstovMnDEkqE9tG7XCJXFO+s1/yrqfqGSnQD1e8+dMqiJv4b s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GluBtaEHdGAfME29OKWeLg2Y6DIJdXN+Vw30DkbmYFgBjoztwoIeZ/U5hRf1heGdJFUcfRP0bb
 LZuGhU5+CgfSdnbro/mjRX56q+rlRq8z0vy1VOKpsZYl6ijKVeVdVjobXY8LZ+GApz+/L04S5I
 5MA0ERcuiHZ5n8GR11MxOz7NzQUppzO2nA5wDxgxt4/dT0QSjJxOb3WcFfibrotIycqEzuBUaO
 2L+tKlW0PiYEIiQGvBFTs86DMVrNhjVjPB4G0wWzpcngFMULZQnG2UzwV9Zle5mwuLqC8JgVlR
 72Y=
X-SBRS: 2.7
X-MesageID: 7462768
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; d="scan'208,217";a="7462768"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Juergen Gross <JGross@suse.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
 <20191023164837.2700240-2-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABtClBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPokCOgQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86LkCDQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAYkC
 HwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Message-ID: <1ef3e120-a68b-117a-e259-f3ec5a7945d0@citrix.com>
Date: Thu, 24 Oct 2019 11:41:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023164837.2700240-2-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 01/23] xen: Fix strange byte in
 common/Kconfig
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
Content-Type: multipart/mixed; boundary="===============6005685033636397298=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6005685033636397298==
Content-Type: multipart/alternative;
	boundary="------------FBA9E57C286C931DC5DC167E"
Content-Language: en-GB

--------------FBA9E57C286C931DC5DC167E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 23/10/2019 17:48, Anthony PERARD wrote:
> Current description of the file by `file`:
>     common/Kconfig: Non-ISO extended-ASCII text
>
> Change that byte to an ascii quote so the file can become properly
> encoded, and all ASCII.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I see "about Xen~Rs execution" in menuconfig, and this is new content in
4.13 so wants fixing.

> ---
>  xen/common/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 7b5dd9d49596..5c0f8d30c709 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -386,7 +386,7 @@ config TRACEBUFFER
>  	default y
>  	---help---
>  	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
> -	  This will allow live information about Xen�s execution and performance
> +	  This will allow live information about Xen's execution and performance
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--------------FBA9E57C286C931DC5DC167E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 23/10/2019 17:48, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20191023164837.2700240-2-anthony.perard@citrix.com">
      <pre class="moz-quote-pre" wrap="">Current description of the file by `file`:
    common/Kconfig: Non-ISO extended-ASCII text

Change that byte to an ascii quote so the file can become properly
encoded, and all ASCII.

Signed-off-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@citrix.com">&lt;anthony.perard@citrix.com&gt;</a></pre>
    </blockquote>
    <br>
    Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
    <br>
    I see "about Xen~Rs execution" in menuconfig, and this is new
    content in 4.13 so wants fixing.<br>
    <br>
    <blockquote type="cite"
      cite="mid:20191023164837.2700240-2-anthony.perard@citrix.com">
      <pre class="moz-quote-pre" wrap="">
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 7b5dd9d49596..5c0f8d30c709 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -386,7 +386,7 @@ config TRACEBUFFER
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
-	  This will allow live information about Xen�s execution and performance
+	  This will allow live information about Xen's execution and performance
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
Xen-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailman/listinfo/xen-devel</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FBA9E57C286C931DC5DC167E--


--===============6005685033636397298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6005685033636397298==--

