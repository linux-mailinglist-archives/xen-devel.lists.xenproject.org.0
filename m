Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8842DB5D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 16:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209411.365865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1bY-0001hb-Ko; Thu, 14 Oct 2021 14:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209411.365865; Thu, 14 Oct 2021 14:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1bY-0001fD-Et; Thu, 14 Oct 2021 14:21:08 +0000
Received: by outflank-mailman (input) for mailman id 209411;
 Thu, 14 Oct 2021 14:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4ou=PC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mb1bW-0001f7-Td
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:21:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5970070-cf64-4e81-9acd-b0c171b3d50b;
 Thu, 14 Oct 2021 14:21:06 +0000 (UTC)
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
X-Inumbo-ID: c5970070-cf64-4e81-9acd-b0c171b3d50b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634221265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=09b5qrfjwDGI2WO4AfAp6k6QZvt7V4OgG/lmt7+2qp4=;
  b=QnG40JIHEeY2f4fiyLFircXM1dAyi7d9pHrknG2RIH//LRuEHe7zXEyw
   GIaRYP28u5HvixlCxldw5mk5Czo9naJ7duFJLFB49jTKnXl0NAVi4/Vca
   OINnsq0t8UjMOh1ha3fTYX+AzR/tve6DJ+BxgTvVPjthFpv8hFSQB/hBQ
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JuCsNfQigaac7Ooa7EsQVDGFZZyOl7hjqppRoLa2KHzvlntuld6XO8bHduNNCY/qLrIUDeQ1/L
 Mi50rwlqfygvVr8lHwPhsfYf2jheTDX5mjCuXp+MgKE4gtRgsciZYtWOpkst275M3V88RqM7V9
 8CatogefCoNJAZunck3YGEIXmzPa5uVTa8g0guCaM1//D1AvxqLWxhOAjmzrQ10Ob09nN4GJOC
 6VCN3+jKyJVNWEggy5N54P+weOjThQ2UuaoLMxngupXGuiHQ5kdkZKbeuSrwSXasLwXlh45Fq0
 eFxIaTwMjOqWhMSv2/FSzdum
X-SBRS: 5.1
X-MesageID: 54761289
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QKECFqI1DX+huBYTFE+RGJIlxSXFcZb7ZxGr2PjKsXjdYENS0TYHm
 GcfCjjXO6mLamD1c4pxPYm3oEgEsJKBytUyQFZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Ur98g4
 +oU9qCCYiAgYqidtrQTDghHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gps2Z4XR6aPD
 yYfQT4xUBXfUz4MAFkGIq04uLuZxVSubAQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs4y4TCvFvSq4G2iqqw/bRsijJCDUVUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYndNczdTDcMQZU5cuYO7+dBs5v7aZo87SPbdszHjJd3nL
 9lmRgAFjLIPkdVD6ay/+V3W695HjsmUFlBrjuk7s2TM0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNZ8yR5xLpfZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxswb55aJm63P
 he7VeZtCHl7ZybCgUhfOdPZNijX5fK4SYSNug78P7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXKOqtRJcwBUfRDWx/ne8qRqSwJKGSI+cElJNhMb6e9Jl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:VzW046kLs6+SEeDj5w6m3JqHVHHpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208";a="54761289"
Date: Thu, 14 Oct 2021 15:20:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 38/51] build: use main rune to build host binary
 x86's mkelf32 and mkreloc
Message-ID: <YWg8s3e1WiR5QuQN@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-39-anthony.perard@citrix.com>
 <e2d9d545-4529-fe1d-652d-8f8828838452@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2d9d545-4529-fe1d-652d-8f8828838452@suse.com>

On Mon, Oct 11, 2021 at 05:56:06PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -81,6 +81,10 @@ endif
> >  extra-y += asm-macros.i
> >  extra-y += xen.lds
> >  
> > +hostprogs-y += boot/mkelf32
> > +HOSTCFLAGS_efi/mkreloc.o := -g
> 
> To be honest I don't think this extra option would have been necessary
> to retain.

Probably not, I'll remove it.

Thanks,

-- 
Anthony PERARD

