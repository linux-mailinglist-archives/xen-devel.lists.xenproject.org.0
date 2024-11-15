Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B403F9CDD56
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837140.1253064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuKy-0007nr-Jf; Fri, 15 Nov 2024 11:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837140.1253064; Fri, 15 Nov 2024 11:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuKy-0007mZ-GV; Fri, 15 Nov 2024 11:18:04 +0000
Received: by outflank-mailman (input) for mailman id 837140;
 Fri, 15 Nov 2024 11:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBuKx-0007mT-1L
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:18:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455df965-a343-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:17:59 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so329442066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:17:59 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046891sm167614266b.171.2024.11.15.03.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 03:17:58 -0800 (PST)
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
X-Inumbo-ID: 455df965-a343-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1NWRmOTY1LWEzNDMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY5NDc5LjUyMjQyMywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731669479; x=1732274279; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix2dVE+deCG1s51693Lizi67KExX5t3NNvtuT07Vf+Q=;
        b=QbRZyN24tIXXEELgp19L+eS/CG0HVK/J+ckQpaXPYwXIu1mtV4vGl0ubF98lYy3Sh9
         qffvISKrBbKPkqxr1Ho/3kAw+0A8K8sb9E5jXZYVmGmRqEDcaelmUbXqU8H7u2cnQeiX
         F/1vs+RvrvNL5cMJVTZkL5R1B177nLwJg+CcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731669479; x=1732274279;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ix2dVE+deCG1s51693Lizi67KExX5t3NNvtuT07Vf+Q=;
        b=bagfVQH+/r6ojsydl88gFPuoouYgDaiLEfKcaJawgEcdLBCsCmdAVOyPpneLGiC30Q
         BfBn8HT/olpNEzPf3xpgX5Q2oP6jcCIViOX4W38D5wrQ4rks3ubRCRWQSZ6rJreMmpXd
         jlwZtUPmrNkqcNw2OsM6kci+LKbDTE1MCXFNVzRVzcSzaSb4QS+ZVs7vxX/MA5X1a5hP
         fzLJzr7MPbzG2xT/EDLgJHiqPmfBHdFZBHp0Q61XwKxeoj47XEBLx8/NqcnE2MWpsYnx
         VJ5BeoI1W4m2DV+ZiWuksRlMfjE2jA87EVlDRIlldyOtjKu2UNLcXU7TQpkq/2ZRycW5
         h9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3++hAHBi8A073HyboQ2XEIUdCn0KTae5Lq0IzYIKW+LReN0khOjL4CZuZ8Emv7YT0dEjcAoy2s1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvzVo5PKuUGH4XPYq2LvwasMOOfkdOynlmkclg6VsNLiiNMWNF
	YuaZgGz+Y1HI8I1D5ENrawFeyBisZJVSduywBgY9bMil1Ysyiz0KM6RsRR9O4rlaYpl+QFzggdL
	r
X-Google-Smtp-Source: AGHT+IFJEWeupOYNCr56nFtR7XcKNOduCPMib70C7Uani9i42t4GmsINLodabkcU+YsOBkEFhtqu9w==
X-Received: by 2002:a17:907:94d0:b0:a9a:b818:521d with SMTP id a640c23a62f3a-aa2076ee119mr600801966b.18.1731669478891;
        Fri, 15 Nov 2024 03:17:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 11:17:56 +0000
Message-Id: <D5MPLJ21KYF6.2NFO9RV8QZ44M@cloud.com>
Cc: "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Jan Beulich"
 <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 3/4] x86/trampoline: Document how the trampoline is
 laid out
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-4-andrew.cooper3@citrix.com>
 <D5LUCQ9MH2C2.1L6CFH028NYPS@cloud.com>
 <a2a65e08-84d8-4181-9a98-f4811eac6767@citrix.com>
 <5c5a0db4-0dda-495c-9241-9f45b0a10632@citrix.com>
In-Reply-To: <5c5a0db4-0dda-495c-9241-9f45b0a10632@citrix.com>

On Thu Nov 14, 2024 at 6:34 PM GMT, Andrew Cooper wrote:
> On 14/11/2024 11:17 am, Andrew Cooper wrote:
> > On 14/11/2024 10:48 am, Alejandro Vallejo wrote:
> >> On Thu Nov 14, 2024 at 9:08 AM GMT, Andrew Cooper wrote:
> >>> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/inc=
lude/asm/trampoline.h
> >>> index 8c1e0b48c2c9..559111d2ccfc 100644
> >>> --- a/xen/arch/x86/include/asm/trampoline.h
> >>> +++ b/xen/arch/x86/include/asm/trampoline.h
> >>> @@ -37,12 +37,65 @@
> >>>   * manually as part of placement.
> >>>   */
> >>> =20
> >>> +/*
> >>> + * Layout of the trampoline.  Logical areas, in ascending order:
> >>> + *
> >>> + * 1) AP boot:
> >>> + *
> >>> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so th=
e identity
> >>> + *    mapping (which must be executable) can at least be Read Only.
> >>> + *
> >>> + * 2) S3 resume:
> >>> + *
> >>> + *    The S3 wakeup logic may need to interact with the BIOS, so nee=
ds a
> >>> + *    stack.  The stack pointer is set to trampoline_phys + 4k and c=
lobbers an
> >>> + *    arbitrary part of the the boot trampoline.  The stack is only =
used with
> >>> + *    paging disabled.
> >>> + *
> >>> + * 3) Boot trampoline:
> >>> + *
> >>> + *    The boot trampoline collects data from the BIOS (E820/EDD/EDID=
/etc), so
> >>> + *    needs a stack.  The stack pointer is set to trampoline_phys + =
64k, is 4k
> >>> + *    in size, and only used with paging disabled.
> >>> + *
> >>> + * 4) Heap space:
> >>> + *
> >>> + *    The first 1k of heap space is statically allocated scratch spa=
ce for
> >>> + *    VESA information.
> >>> + *
> >>> + *    The remainder of the heap is used by reloc(), logic which is o=
therwise
> >>> + *    outside of the trampoline, to collect the bootloader metadata =
(cmdline,
> >> Wh> + *    module list, etc).  It does so with a bump allocator starti=
ng from the
> >>> + *    end of the heap and allocating backwards.
> > Was this a typo replying to the email?
> >
> >
> >>> + *
> >>> + * 5) Boot stack:
> >>> + *
> >>> + *    The boot stack is 4k in size at the end of the trampoline, tak=
ing the
> >>> + *    total trampoline size to 64k.
> >>> + *
> >>> + * Therefore, when placed, it looks somewhat like this:
> >>> + *
> >>> + *    +--- trampoline_phys
> >>> + *    v
> >>> + *    |<-------------------------------64K--------------------------=
----->|
> >>> + *    |<-----4K----->|                                         |<---=
4K--->|
> >>> + *    +-------+------+-+---------------------------------------+----=
------+
> >>> + *    | AP+S3 |  Boot  | Heap                                  |    =
Stack |
> >>> + *    +-------+------+-+---------------------------------------+----=
------+
> >>> + *    ^       ^   <~~^ ^                                    <~~^    =
   <~~^
> >>> + *    |       |      | +- trampoline_end[]                     |    =
      |
> >>> + *    |       |      +--- wakeup_stack      reloc() allocator -+    =
      |
> >>> + *    |       +---------- trampoline_perm_end      Boot Stack ------=
------+
> >>> + *    +------------------ trampoline_start[]
> >>> + */
> >> Neat. Nothing like a pretty picture to properly explain things.
> >>
> >>> +
> >>>  #include <xen/compiler.h>
> >>>  #include <xen/types.h>
> >>> =20
> >>>  /*
> >>> - * Start and end of the trampoline section, as linked into Xen.  It =
is within
> >>> - * the .init section and reclaimed after boot.
> >>> + * Start and end of the trampoline section, as linked into Xen.  Thi=
s covers
> >>> + * the AP, S3 and Boot regions, but not the heap or stack.  It is wi=
thin the
> >>> + * .init section and reclaimed after boot.
> >> How can it be reclaimed after boot if it's used for S3 wakeups? I assu=
me you
> >> meant that the heap and stack are reclaimed after boot, but from that =
wording
> >> it sounds like the other way around.
> > This is the one bit that is slightly problematic to represent.
> >
> > trampoline_{start,end}[] describe the AP/S3/Boot text/data *in the Xen
> > image*, which is in the .init section.
> >
> > trampoline_phys is where trampoline_start[] ends up when placed.
> >
> > Maybe I should have "Note: trampoline_start[] and trampoline_end[]
> > represent the shown boundaries as linked in Xen" at the bottom of the
> > diagram?
>
> I'm going to go ahead and do this, and commit the series.
>
> ~Andrew

That note looks clearer, indeed.

Cheers,
Alejandro

