Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C71A3BE5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 23:25:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMefP-0007OW-M3; Thu, 09 Apr 2020 21:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JlmV=5Z=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jMefO-0007OR-Fi
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 21:24:54 +0000
X-Inumbo-ID: 8d5d8044-7aa8-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d5d8044-7aa8-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 21:24:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dk4so1757008edb.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 14:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GImh+BuHdjMuc/1Sw1GaPIx1uPXReGwki6MVmkPisT8=;
 b=W4ueCqGgyRYyHsR4+Yx3BoeUY0sZs7aLj29f3jSy252G/8bw7jnL7Jfz49w/C3ERv+
 aCnheSk+7Me7wprsBLvwy7IUPccS5J8emuYoKFIP/boFEFHD3qiDWYC8rFWTE9Lb+Toc
 D/Q8EQ7Zl6tjX9suHYfdahUkW5rMtN1X0/KWak1IvO0zcZFt6spLEHzhB4/9sylW1omj
 l0SjWhxe5n/dbBlV1Fr4IE3hO5roGlbjJ2s/RaM/Rp6c/9FDDWN9nFDojqeCtnlUkBQ2
 cWgsoqRuVVqfBxPxGubzCVLMgt/Eam36Tjde0HRtx3myh+7X7+g6m+d5ISi9/iCUlFGU
 LzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GImh+BuHdjMuc/1Sw1GaPIx1uPXReGwki6MVmkPisT8=;
 b=g1wvxXD5dtoLWDYR8RQNha1+YsejC0m5AlqioF3f3c7bDK9rxS0YylfKBVewT29GGH
 INwO5gSXLIg9SvqIZiRLbUpXUAW+1lcYtSDUeGK1qDhT21SpRnYzxGt4xxTz3YDMpip0
 ca2xPcq+y+kBiQek8zZc/3N2+AzgvmDgmdSTbsL9vgqd8/VwA5w39OsYp3l4Z5vTb9ju
 B5ZELSVcDhtcH0kPKVvzrmC2jSO/I7s7CpMR/xYzdYgVN+BOQ7tbb6q4AjBifV1qXYIE
 +wHJuKN8rGIIo4a5pnrr7cE8/RN9xE+0vHtDxq1O9Txg0wzx2C3dM1+TWJw1SVj7vRN/
 Ie0A==
X-Gm-Message-State: AGi0PubeboTSv57BXV/HIjiprSkoUISMO4PJ67gyhlzJGt9NCoqsZKSK
 SMDEZqaEkTtn1jLF6pfHzWpEjWw6Kg0=
X-Google-Smtp-Source: APiQypKF04Tmc0LjV/7uKCZGwkv00ozDdFiu1WOzP76yFH9NPkR9y4NRBMVefG7UGJA05X6YVxPQUg==
X-Received: by 2002:a17:906:3509:: with SMTP id r9mr1033450eja.5.1586467492565; 
 Thu, 09 Apr 2020 14:24:52 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id e25sm3715623ejl.4.2020.04.09.14.24.52
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 14:24:52 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id v5so13715122wrp.12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 14:24:52 -0700 (PDT)
X-Received: by 2002:adf:ea06:: with SMTP id q6mr1191089wrm.301.1586467491693; 
 Thu, 09 Apr 2020 14:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200409204837.7017-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Apr 2020 15:24:13 -0600
X-Gmail-Original-Message-ID: <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
Message-ID: <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: Fix build folloing VM Fork work
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> A default build fails with:
>
>   mem_sharing.c: In function =E2=80=98copy_special_pages=E2=80=99:
>   mem_sharing.c:1649:9: error: =E2=80=98HVM_PARAM_STORE_PFN=E2=80=99 unde=
clared (first use in this function)
>            HVM_PARAM_STORE_PFN,
>            ^~~~~~~~~~~~~~~~~~~
>
> I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 "x86/=
HVM:
> reduce hvm.h include dependencies".
>
> Fixes: 41548c5472a "mem_sharing: VM forking"
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

So staging definitely compiles for me both with and without
CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't even
be compiled so I'm curious what's happening in your build. That said,
I have no objection to the extra include if it turns out to be
actually necessary.

Tamas

