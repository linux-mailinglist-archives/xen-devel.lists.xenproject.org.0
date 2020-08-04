Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4223BC8F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:46:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2yCs-0006nL-Gy; Tue, 04 Aug 2020 14:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exko=BO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2yCq-0006nG-Ki
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:46:20 +0000
X-Inumbo-ID: 58a3ea34-5590-469c-92f7-2325a1158269
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58a3ea34-5590-469c-92f7-2325a1158269;
 Tue, 04 Aug 2020 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596552379;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Nq19iTNJmoNA2xjrkYq5ivLgI2YhtNvzGmirNBmBNso=;
 b=fJkEx+PsQ43Y/v1Pjd/yc3Fm8PBUL08fft4bjm6ufihMZCTAPnnBXPSA
 xk5DhnzRYr/Riv5ojbI59ZPNDOwJh9g34QhuQTORDUmW8eMknh7OdfKYd
 mjBsHPD8p9wimc89WZ5p26dUS5xyuv7o6AM/JH4R3CEX/0pPcIHoT/IDG Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: beRNKA3wdJ5hUdlqiUrNMXJuSmfctF21FctbsPOZor/2dTnkJFl39VCUnyFmuYVuDS8fJP6etC
 Usiv4Gz3wF+ovQV6ZjWqznQkoHgC73nubS2qOAYx7QCqH83Q81Pt5q871MgY4IUqZ5nGkHTf3R
 FDNrrzgJ2mGTv6tmrFX6QR0Bmagtoo1NE4L0lyq1nFCiaMKhXZQOUMi/48fuUDzVhrWbu8vpyL
 Rh7PTEO5Wks5Zij9aYxnTGGoxVTTOqI1i3qbLmUK6OPJ8pJv4uWEE29kiGiAB05neAk9HGldJS
 B+0=
X-SBRS: 3.7
X-MesageID: 23809598
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,434,1589256000"; d="scan'208";a="23809598"
Subject: Re: [PATCH] x86emul: further FPU env testing relaxation for AMD-like
 CPUs
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b2667393-0196-30de-86e9-b7a6145ed03d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91e628c6-cbbc-2023-51be-674de4901704@citrix.com>
Date: Tue, 4 Aug 2020 15:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b2667393-0196-30de-86e9-b7a6145ed03d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/08/2020 10:36, Jan Beulich wrote:
> See the code comment that's being extended. Additionally a few more
> zap_fpsel() invocations are needed - whenever we stored state after
> there potentially having been a context switch behind our backs.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -752,6 +752,13 @@ static struct x86_emulate_ops emulops =
>   * 64-bit OSes may not (be able to) properly restore the two selectors in
>   * the FPU environment. Zap them so that memcmp() on two saved images will
>   * work regardless of whether a context switch occurred in the middle.
> + *
> + * Additionally on AMD-like CPUs FDP/FIP/FOP may get lost across context
> + * switches, when there's no unmasked pending FP exception: With

I think you want a full stop rather than a colon, and ...

> + * CPUID[80000008].EBX[2] clear, the fields don't get written/read by
> + * {F,}XSAVE / {F,}XRSTOR, which OSes often compensate for by invoking an
> + * insn forcing the fields to gain a deterministic value. Whereas with said

... a comma here rather than a full stop.

Having "whereas" at the beginning of a sentence like this is weird,
given that you're contrasting the behaviour of the CPUID bit.

Also, the more usual CPUID syntax would be CPUID.0x80000008.EBX[2].

~Andrew

> + * bit set, zeroes will get written (and hence later restored).
>   */
>  static void zap_fpsel(unsigned int *env, bool is_32bit)
>  {
>

