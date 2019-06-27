Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B102581EA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:55:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSvp-0003ny-93; Thu, 27 Jun 2019 11:51:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCrz=U2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgSvo-0003nt-3N
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:51:12 +0000
X-Inumbo-ID: da430c81-98d1-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da430c81-98d1-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 11:51:09 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AHl04zixFJGmzSW/nc0/OH+5SSdRT/PHxv3H9//ByZwf2xsy27918G9YrpgR2ESLBjoT2JZ+e0
 AwK/0Ny5mVDWpYjVQ1lY7NrxOMxaf8oIORaiZ4IgzhnQ3n4D/Fle9tbLpHS9aGUeAhyuk2a5nE
 DBS4k3OBsZ9k/nnHUCssgQIExgeUxQQEWnAWIy/NN6+inFEr6BVUQg4miC2dXhW5nA3yw+NavE
 Z2ZK3Qk7II2v1lvjwrhohkodIz+oOqB6ykMkchszULvyAs4kdfmIlk6quUV4OMBo3nxITfP958
 gX4=
X-SBRS: 2.7
X-MesageID: 2317054
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; d="scan'208,217";a="2317054"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dd4c70a7-9680-7235-f39c-790536129a0a@citrix.com>
Date: Thu, 27 Jun 2019 12:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190627093335.56355-3-roger.pau@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86: check for multiboot{1,
 2} header presence
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============2966248018237600281=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2966248018237600281==
Content-Type: multipart/alternative;
	boundary="------------AAF841D75BA012A033AD98BE"
Content-Language: en-GB

--------------AAF841D75BA012A033AD98BE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 27/06/2019 10:33, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 8a8d8f060f..94e6c9aee3 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -99,9 +99,14 @@ endif
>  syms-warn-dup-y := --warn-dup
>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
>  
> +$(TARGET): TMP = $(@D)/.$(@F)

I'd suggest giving this a .elf32 suffix to make it clear which pass of
the build it comes from.

>  $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
> -	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TARGET) $(XEN_IMG_OFFSET) \
> +	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
>  	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
> +	# Check for multiboot{1,2} headers
> +	od -t x4 -N 8192 $(TMP) | grep 1badb002 > /dev/null ||
> +	od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null

This works, but

Makefile:104: recipe for target '/local/xen.git/xen/xen' failed

Isn't helpful to identify what went wrong.  Sadly, we can't use $(error
...) in a shell snippet, but:

andrewcoop@andrewcoop:/local/xen.git/xen$ git d
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 94e6c9aee3..a1d6605a8b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -99,13 +99,14 @@ endif
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 
-$(TARGET): TMP = $(@D)/.$(@F)
+$(TARGET): TMP = $(@D)/.$(@F).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
        ./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
                       `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
-       # Check for multiboot{1,2} headers
-       od -t x4 -N 8192 $(TMP) | grep 1badb002 > /dev/null
-       od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null
+       od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
+               { echo "No Multiboot1 header found"; false; }
+       od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null || \
+               { echo "No Multiboot2 header found"; false; }
        mv $(TMP) $(TARGET)
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)

results in:

No Multiboot1 header found
Makefile:104: recipe for target '/local/xen.git/xen/xen' failed
make[2]: *** [/local/xen.git/xen/xen] Error 1
Makefile:136: recipe for target '/local/xen.git/xen/xen' failed
make[1]: *** [/local/xen.git/xen/xen] Error 2
Makefile:45: recipe for target 'build' failed
make: *** [build] Error 2

Which is far more clear.

Thoughts?

~Andrew

--------------AAF841D75BA012A033AD98BE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 27/06/2019 10:33, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190627093335.56355-3-roger.pau@citrix.com">
      <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8a8d8f060f..94e6c9aee3 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -99,9 +99,14 @@ endif
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 
+$(TARGET): TMP = $(@D)/.$(@F)</pre>
    </blockquote>
    <br>
    I'd suggest giving this a .elf32 suffix to make it clear which pass
    of the build it comes from.<br>
    <br>
    <blockquote type="cite"
      cite="mid:20190627093335.56355-3-roger.pau@citrix.com">
      <pre class="moz-quote-pre" wrap="">
 $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
-	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TARGET) $(XEN_IMG_OFFSET) \
+	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
 	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
+	# Check for multiboot{1,2} headers
+	od -t x4 -N 8192 $(TMP) | grep 1badb002 &gt; /dev/null ||
+	od -t x4 -N 32768 $(TMP) | grep e85250d6 &gt; /dev/null</pre>
    </blockquote>
    <br>
    This works, but <br>
    <br>
    Makefile:104: recipe for target '/local/xen.git/xen/xen' failed<br>
    <br>
    Isn't helpful to identify what went wrong.  Sadly, we can't use
    $(error ...) in a shell snippet, but:<br>
    <br>
    <pre><a class="moz-txt-link-abbreviated" href="mailto:andrewcoop@andrewcoop:/local/xen.git/xen$">andrewcoop@andrewcoop:/local/xen.git/xen$</a> git d
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 94e6c9aee3..a1d6605a8b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -99,13 +99,14 @@ endif
 syms-warn-dup-y := --warn-dup
 syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 
-$(TARGET): TMP = $(@D)/.$(@F)
+$(TARGET): TMP = $(@D)/.$(@F).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
        ./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
                       `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
-       # Check for multiboot{1,2} headers
-       od -t x4 -N 8192 $(TMP) | grep 1badb002 &gt; /dev/null
-       od -t x4 -N 32768 $(TMP) | grep e85250d6 &gt; /dev/null
+       od -t x4 -N 8192 $(TMP)  | grep 1badb002 &gt; /dev/null || \
+               { echo "No Multiboot1 header found"; false; }
+       od -t x4 -N 32768 $(TMP) | grep e85250d6 &gt; /dev/null || \
+               { echo "No Multiboot2 header found"; false; }
        mv $(TMP) $(TARGET)
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)

</pre>
    results in:<br>
    <br>
    No Multiboot1 header found<br>
    Makefile:104: recipe for target '/local/xen.git/xen/xen' failed<br>
    make[2]: *** [/local/xen.git/xen/xen] Error 1<br>
    Makefile:136: recipe for target '/local/xen.git/xen/xen' failed<br>
    make[1]: *** [/local/xen.git/xen/xen] Error 2<br>
    Makefile:45: recipe for target 'build' failed<br>
    make: *** [build] Error 2<br>
    <br>
    Which is far more clear.<br>
    <br>
    Thoughts?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------AAF841D75BA012A033AD98BE--


--===============2966248018237600281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2966248018237600281==--

