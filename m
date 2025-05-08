Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94298AAF9EC
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 14:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979347.1365986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD0Mf-0005hZ-IO; Thu, 08 May 2025 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979347.1365986; Thu, 08 May 2025 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD0Mf-0005es-F3; Thu, 08 May 2025 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 979347;
 Thu, 08 May 2025 12:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hWE=XY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uD0Md-0005em-V4
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 12:28:36 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b371e9-2c07-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 14:28:33 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7311a8bb581so704331a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 05:28:33 -0700 (PDT)
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
X-Inumbo-ID: f4b371e9-2c07-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746707312; x=1747312112; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44T5OMorfHOKCGvj4mHS3mPDbc4n6JdYUOwE7sy2fIU=;
        b=bFv0ABbaK27kAg39pqNPXheNC+QMzGlXd5l7x1g27Wb5QLORm/U6kJGgt5tIBCAadV
         Pdqj6EOB8cz2FZ1yQrhMA3GKz2j7q5lpALGtiMsRABoeXEQG3AO4xoBRal/Gae6A9y5d
         x2MtrdJldYBzUJFLdo5jImNvEdwoDOlNGBYfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707312; x=1747312112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44T5OMorfHOKCGvj4mHS3mPDbc4n6JdYUOwE7sy2fIU=;
        b=ZKPrtmWXz77Lg4G1WWiKjk6cSv0sJlv5oiinSjAy0q133zGyw4fhdNZbpAnc7A+VBk
         r5klPwYK3EaSot5BLa4Pl70JCyGshCft4erhYfOSbw4iCuBa2fx8J0xVcVJIw7KjE8Df
         lj0sza4ZW+C55Lps/eXiL2obl7Y2w6IifLOXQkriajoqrjUDqlg37T36c3LOFqPr8Psa
         o4C1fAGqZOrrh4mk9n/fYsUcDGCFkE8v28N+0CRrWY6YQckaR9ZVDAkC9qoRVW2c3X5C
         YCWa2c2yHrT+GtnYwt+oxFBKcsmsQ4UeP6qjbrE6zufjWH8BlbR7k91m35d95aSnAIMn
         JZXw==
X-Forwarded-Encrypted: i=1; AJvYcCU3VqsatyDmNnxqA46NzHgkiQNQiqPJXz2LEVnLG5zPR/n9QigQrp4M3/mbFzu+WvfDKoaZ4qB57pA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZcyRneE27UpTA2YAjrH9o6HG64PblBuFAE37yW1LscxU059rv
	wDQjzUBqvtJl3WS7Tn06QmNHQQmYQRnUNqtnYeB0jqwtKXRXsMf9IcADJq8JVynCxkG/AHcqMqu
	VJmACyOQQwes0MHMXYUUlKBd4jAUN0tJ2gQiUKg==
X-Gm-Gg: ASbGncsK9cjJiiZC+Gz3p8cowF64JMPBMMT1d9wjwik7wCDV9KzmkAycaO2mm804P5U
	0NCIk9P1L7zoPow7YMrZmrmhxqQosNJZb2uaBNlrDcCwM5Tvket+lN0ML3ytwrjS2Mdgrr75PpI
	GzGsfPe9XO1EGmgXkvo3xF
X-Google-Smtp-Source: AGHT+IGSiMqAtNAruJHbQVd7nu7e/91PwpKHqnP9ppQ5oUuBTJuVd5dTtRKzC8ZIcNaXvufWtnlcU6LdjAwqZs0CzJs=
X-Received: by 2002:a05:6808:2016:b0:3f7:d16c:e283 with SMTP id
 5614622812f47-40377f23863mr1841973b6e.11.1746707312496; Thu, 08 May 2025
 05:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com> <aByIDP2iEHjmo99t@mail-itl> <fab47327-e885-4565-817b-16343f41f487@citrix.com>
In-Reply-To: <fab47327-e885-4565-817b-16343f41f487@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 8 May 2025 13:28:21 +0100
X-Gm-Features: ATxdqUFvfG0HOIyyKJXIqb5i3nRLTGXnv4GTo0SD429EKKfCTA25xnVtcDt0JvI
Message-ID: <CACHz=ZjtMSe8EzG-wTMCz=kecwzYGR14cu29JwQ0oozK6fr_MQ@mail.gmail.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>, xen-devel@lists.xenproject.org, 
	dpsmith@apertussolutions.com, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 12:55=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 08/05/2025 11:31 am, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, May 08, 2025 at 09:51:59AM +0100, Andrew Cooper wrote:
> >> Also,
> >>
> >>> ld: warning: orphan section `.sbat' from `prelink.o' being placed in =
section `.sbat'
> >> This is because sbat.o is getting linked into the non-EFI build of Xen=
 too.
> >>
> >> I'm less sure how to go about fixing this.  There's no nice way I can
> >> see of of getting sbat.o only in the EFI build.  The other option is t=
o
> >> discard it for the ELF build.
> > This is kinda related to my question on Matrix - is multiboot2 binary
> > also supposed to (eventually) support UEFI SB?
>
> This is mixing two things.
>
> Xen is either an ELF binary (ultimately zipped, so xen.gz) or is an EFI
> binary (xen.efi).
>
> Both of these binaries currently have an MB2 header.  This was by
> accident, as xen.efi is a strict superset of the ELF build.
>

We are planning to use multiboot2 booting. The reason is the way we
want some parameters (like command line) to be passed. We are going to
use grub2.

> AIUI, SBAT only makes sense to exist in the EFI binary.
>
> ~Andrew

Frediano

