Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2C1A8C60
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 22:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOS7K-0006nS-RA; Tue, 14 Apr 2020 20:25:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOS7J-0006nF-DY
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 20:25:09 +0000
X-Inumbo-ID: 08099d08-7e8e-11ea-89a5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08099d08-7e8e-11ea-89a5-12813bfff9fa;
 Tue, 14 Apr 2020 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586895908;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Xxsifn00S3cqfDFWDaPTDSnQvEMZeFSLvLjuf2hAnwU=;
 b=U9SntYWdthAA/3UyLccHu8EaRtshqHLvki/N3mSx461eQ2MgIHBYxpnp
 ggaRStGJKNAlACAfxCau8i5S/wQHuWgykZQ0iC4LLOtVBIq3vtXB24u3k
 hJodrFd2fGl14AL4JDvY2oRma5Q2AL9a0k4Y26lh44ewF/afQcbyJxemw 0=;
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
IronPort-SDR: 5mAoYyuaIX3cmSmAMrsjyqeNkqyEuZUOWpo7unN0Pg3D+npzFV+kecgI8nfC3qwDWm+nytAsZm
 sYW+QCKdnC0KhEJQI9XRphX3FB1Na62DP231kG9yH018f53oG0shUCS9wpgP7t4pjzfChYV4Oj
 vVx4JaB5qz72Ts9A06pIY+evoPLP52siOf/MFwC+dmlKKAUjW4koIPw2+RCYfKejnyK0r4pBCu
 xkek1BKaRKMdKAqREFGd38cr5BFxFZHvwtYC7J2Mw9a50eSjF87mfhWfeS4+teBmICyiBurypr
 8WE=
X-SBRS: 2.7
X-MesageID: 15914633
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,384,1580792400"; d="scan'208";a="15914633"
Subject: Re: Ping [PATCH v2 17/17] docs/xl.cfg: Rewrite cpuid= section
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-18-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a4930733-99fa-072e-dd01-2e5b3bdcacec@citrix.com>
Date: Tue, 14 Apr 2020 21:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200127143444.25538-18-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/01/2020 14:34, Andrew Cooper wrote:
> This is partly to adjust the description of 'k' and 's' seeing as they have
> changed, but mostly restructuring the information for clarity.
>
> In particular, use indentation to clearly separate the areas discussing libxl
> format from xend format.  In addition, extend the xend format section to
> discuss subleaf notation.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
>
> v2:
>  * New
> ---
>  docs/man/xl.cfg.5.pod.in | 74 ++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 21 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 245d3f9472..1da68c4a07 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1964,26 +1964,42 @@ This option is disabled by default.
>  Configure the value returned when a guest executes the CPUID instruction.
>  Two versions of config syntax are recognized: libxl and xend.
>  
> -The libxl syntax is a comma separated list of key=value pairs, preceded by the
> -word "host". A few keys take a numerical value, all others take a single
> -character which describes what to do with the feature bit.
> -
> -Possible values for a single feature bit:
> +Both formats use a common notation for specifying a single feature bit.
> +Possible values are:
>    '1' -> force the corresponding bit to 1
>    '0' -> force to 0
>    'x' -> Get a safe value (pass through and mask with the default policy)
> -  'k' -> pass through the host bit value
> -  's' -> as 'k' but preserve across save/restore and migration (not implemented)
> +  'k' -> pass through the host bit value (at boot only - value preserved on migrate)
> +  's' -> legacy alias for 'k'
>  
> -Note: when specifying B<cpuid> for hypervisor leaves (0x4000xxxx major group)
> -only the lowest 8 bits of leaf's 0x4000xx00 EAX register are processed, the
> -rest are ignored (these 8 bits signify maximum number of hypervisor leaves).
> +B<Libxl format>:
> +
> +=over 4
> +
> +The libxl format is a single string, starting with the word "host", and
> +followed by a comma separated list of key=value pairs.  A few keys take a
> +numerical value, all others take a single character which describes what to do
> +with the feature bit.  e.g.:
> +
> +=over 4
> +
> +cpuid="host,tm=0,sse3=0"
> +
> +=back
>  
>  List of keys taking a value:
> +
> +=over 4
> +
>  apicidsize brandid clflush family localapicid maxleaf maxhvleaf model nc
>  proccount procpkg stepping
>  
> +=back
> +
>  List of keys taking a character:
> +
> +=over 4
> +
>  3dnow 3dnowext 3dnowprefetch abm acpi adx aes altmovcr8 apic arat avx avx2
>  avx512-4fmaps avx512-4vnniw avx512bw avx512cd avx512dq avx512er avx512f
>  avx512ifma avx512pf avx512vbmi avx512vl bmi1 bmi2 clflushopt clfsh clwb cmov
> @@ -1997,21 +2013,37 @@ ssse3 svm svm_decode svm_lbrv svm_npt svm_nrips svm_pausefilt svm_tscrate
>  svm_vmcbclean syscall sysenter tbm tm tm2 topoext tsc tsc-deadline tsc_adjust
>  umip vme vmx wdt x2apic xop xsave xtpr
>  
> +=back
> +
> +=back
> +
> +B<Xend format>:
>  
> -The xend syntax is a list of values in the form of
> -'leafnum:register=bitstring,register=bitstring'
> -  "leafnum" is the requested function,
> -  "register" is the response register to modify
> -  "bitstring" represents all bits in the register, its length must be 32 chars.
> -  Each successive character represent a lesser-significant bit, possible values
> -  are listed above in the libxl section.
> +=over 4
>  
> -Example to hide two features from the guest: 'tm', which is bit #29 in EDX, and
> -'pni' (SSE3), which is bit #0 in ECX:
> +Xend format consists of an array of one or more strings of the form
> +"leaf:reg=bitstring,...".  e.g. (matching the libxl example above):
>  
> -xend: [ "1:ecx=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0,edx=xx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx" ]
> +=over 4
>  
> -libxl: "host,tm=0,sse3=0"
> +cpuid=["1:ecx=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0,edx=xx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx", ...]
> +
> +=back
> +
> +"leaf" is an integer, either decimal or hex with a "0x" prefix.  e.g. to
> +specify something in the AMD feature leaves, use "0x80000001:ecx=...".
> +
> +Some leaves have subleaves which can be specified as "leaf,subleaf".  e.g. for
> +the Intel structured feature leaf, use "7,0:ebx=..."
> +
> +The bitstring represents all bits in the register, its length must be 32
> +chars.  Each successive character represent a lesser-significant bit.
> +
> +=back
> +
> +Note: when specifying B<cpuid> for hypervisor leaves (0x4000xxxx major group)
> +only the lowest 8 bits of leaf's 0x4000xx00 EAX register are processed, the
> +rest are ignored (these 8 bits signify maximum number of hypervisor leaves).
>  
>  More info about the CPUID instruction can be found in the processor manuals,
>  and on Wikipedia: L<https://en.wikipedia.org/wiki/CPUID>


