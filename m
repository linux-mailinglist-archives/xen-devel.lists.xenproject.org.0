Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809BC3C728
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 17:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157126.1486031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2ud-0006HH-Ta; Thu, 06 Nov 2025 16:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157126.1486031; Thu, 06 Nov 2025 16:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2ud-0006FB-Q3; Thu, 06 Nov 2025 16:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1157126;
 Thu, 06 Nov 2025 16:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMQi=5O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vH2ud-0006F5-4V
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 16:32:39 +0000
Received: from mail-yx1-xb130.google.com (mail-yx1-xb130.google.com
 [2607:f8b0:4864:20::b130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3431fcea-bb2e-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 17:32:37 +0100 (CET)
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63f9beb27b9so1195459d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 08:32:37 -0800 (PST)
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
X-Inumbo-ID: 3431fcea-bb2e-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446756; x=1763051556; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HoVdgOaqpJHfULXrAsHu8NUf8f/kGjWiUOAS8fLn9b8=;
        b=B9GTAuF3DP9dY3akmDQ24St9N3UlGF60txdjxFn9gdpu+P4qDhBczy8beM88f+AiLr
         rl79qAL/xQVPOUKcdQHJFEG41axciKvvW0jxHJu42G44jiheRb+9IRlAwu0gpxpcIoyV
         NPdHBN0hU/tG8ygiEskDM/BTp/GnpNUQea6M4MOyfnM1Pk8hRNbXVGK1uzlFO9l2WgOj
         tWXyXarmHLHYKvtc/WduV4WXikSCKhPU3zbdIE7Kb+IPxykt361JAgAJ0xEys1Z2nN9C
         UI2ZmV80Bc9Rhp31ML3FmJO6aOSUoH8RZ/boNPQ7tffK19dvFVjptHeiMRXgWqOc/PS7
         bdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446756; x=1763051556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoVdgOaqpJHfULXrAsHu8NUf8f/kGjWiUOAS8fLn9b8=;
        b=c+1iaHvb1EySAazAy87oPEdT0n7E5XJ+OpK/blck6oVo/ht9vzABi50DH4nqSLSi+r
         19GeHqLdcPpbSY95ir9BBj9lOwWyHSmgkrm2bj84FxejHeLRCieCFQ3emXfYltQv6t+I
         vVdOgHVmzQi+kNXCoUyRUrkmf2CbMjyi3cHd+RwvxSAD5pFKMbz97tHRjQiToF+9WC7a
         obEN7hH6MMlMpBPPGrQPxUWq/yhnxiBV8lFWpUSBllNQR+0M8DGkvmJl55z+jng2zK6X
         T+WKwPdFWHmvB7tdVz4ga35Kw0JlfY2LWUUWmFwQdRo3ZkaaWgGoRAZxu6YPqfolFfph
         TFBw==
X-Gm-Message-State: AOJu0Yyb2xYKkdWuvcQLW7LSA5IipIIgbVngmRDoWx1UmYjJqkvOQhvs
	GSRtwUB42R1CdPm5jDPYgeZTGuffqBzg55tzSEae4uQsRWkGX/GiYIrpMAzO7ZV4mEUF8jtYb0y
	5Gu0NPp0UN3nj14epn22EDi4FTydfB+M=
X-Gm-Gg: ASbGnctOsZNLnjxDpqCdYPLfrCSr7M2vHWwE7yTJZnAuWNjUU6kqCZPWCtUKn6P4n3+
	9+WT7uyeQUXs2mA78yuec7GfyL/erJQNPW8KsZILunQtRGe/aX2T5lhbUMWKHVBTd/+17gVOB8V
	RzMBa+U6U5mQHaX55Lpltlm3Y8QYft9BfI6sVft0yWyUMxikyIvSeal1YHOEI7OdFaxxKiwA0oz
	e/oHGkjtCKoFYhR289lkzkHX4JZkHuyQnsUuUJatHOxNi0tJQZN9NNDkWpB
X-Google-Smtp-Source: AGHT+IFxlP/1Z3VenWkOzjn1uLUZ0V3wSFGQmq3PyzCEB0U9Wxo4NZYQ0Vf9zxXV3zTBOtaE6aEK+J+r9NFWcAbOlvE=
X-Received: by 2002:a05:690e:1a98:b0:63f:4b71:18d9 with SMTP id
 956f58d0204a3-63fd35b5abfmr4526688d50.69.1762446755597; Thu, 06 Nov 2025
 08:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com> <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com> <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
 <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
In-Reply-To: <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 6 Nov 2025 16:32:24 +0000
X-Gm-Features: AWmQ_blH8amtrbbrg3a4IDMoF2izySOvVGnY5u5qjrvC8kQvPkLxSBqN9Ub54Zo
Message-ID: <CAHt6W4fscR1zAPbEmmgy5ARUGN5R2XBLF=Lkbjw3GU_RwibTfA@mail.gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.11.2025 10:58, Frediano Ziglio wrote:
> > On Thu, 6 Nov 2025 at 03:52, Demi Marie Obenour <demiobenour@gmail.com> wrote:
> >> Does objdump on the signed file return correct section names?
> >
> > From objdump -x
> >
> > Sections:
> > Idx Name          Size      VMA               LMA               File off  Algn
> >   0 .text         0016c9ae  ffff82d040200000  ffff82d040200000  00000320  2**4
> >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> >   1 .rodata       0006b9e8  ffff82d040400000  ffff82d040400000  0016cce0  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   2 .buildid      00000035  ffff82d04046c000  ffff82d04046c000  001d86e0  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   3 .init.text    0004d123  ffff82d040600000  ffff82d040600000  001d8720  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> >   4 .init.data    0006c9b0  ffff82d040800000  ffff82d040800000  00225860  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   5 .data.read_mostly 00028da8  ffff82d040a00000  ffff82d040a00000
> > 00292220  2**4
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   6 .data         0000feec  ffff82d040a29000  ffff82d040a29000  002bafe0  2**4
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   7 .bss          00223108  ffff82d040a39000  ffff82d040a39000  00000000  2**4
> >                   ALLOC
> >   8 .reloc        000016b8  ffff82d040c5d000  ffff82d040c5d000  002caee0  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   9 .sbat         000000a6  ffff82d040c5f000  ffff82d040c5f000  002cc5a0  2**2
> >                   CONTENTS, READONLY
> >
> > Which looks correct.
> >
> > From hexdump -C I can see close to the end
> >
> > ...
> > 002cc580  30 ae 38 ae 60 ae 00 00  00 80 a3 00 10 00 00 00  |0.8.`...........|
> > 002cc590  a0 ae c0 ae e0 ae 00 00  00 00 00 00 00 00 00 00  |................|
> > 002cc5a0  73 62 61 74 2c 31 2c 53  42 41 54 20 56 65 72 73  |sbat,1,SBAT Vers|
> > 002cc5b0  69 6f 6e 2c 73 62 61 74  2c 31 2c 68 74 74 70 73  |ion,sbat,1,https|
> > 002cc5c0  3a 2f 2f 67 69 74 68 75  62 2e 63 6f 6d 2f 72 68  |://github.com/rh|
> > 002cc5d0  62 6f 6f 74 2f 73 68 69  6d 2f 62 6c 6f 62 2f 6d  |boot/shim/blob/m|
> > 002cc5e0  61 69 6e 2f 53 42 41 54  2e 6d 64 0a 78 65 6e 2e  |ain/SBAT.md.xen.|
> > 002cc5f0  78 73 2c 31 2c 43 6c 6f  75 64 20 53 6f 66 74 77  |xs,1,Cloud Softw|
> > 002cc600  61 72 65 20 47 72 6f 75  70 2c 78 65 6e 2c 34 2e  |are Group,xen,4.|
> > 002cc610  32 30 2e 31 2d 37 2e 32  32 2e 67 33 65 30 36 37  |20.1-7.22.g3e067|
> > 002cc620  32 36 62 2e 78 73 39 2c  6d 61 69 6c 74 6f 3a 73  |26b.xs9,mailto:s|
> > 002cc630  65 63 75 72 69 74 79 40  78 65 6e 73 65 72 76 65  |ecurity@xenserve|
> > 002cc640  72 2e 63 6f 6d 0a 00 00  00 00 00 00 00 00 00 00  |r.com...........|
> > 002cc650  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > 002cc660  2c 00 00 00 2e 69 6e 69  74 2e 74 65 78 74 00 2e  |,....init.text..|
> > 002cc670  69 6e 69 74 2e 64 61 74  61 00 2e 64 61 74 61 2e  |init.data..data.|
> > 002cc680  72 65 61 64 5f 6d 6f 73  74 6c 79 00 00 00 00 00  |read_mostly.....|
> > 002cc690  9e 05 00 00 00 02 02 00  30 82 05 92 06 09 2a 86  |........0.....*.|
> > 002cc6a0  48 86 f7 0d 01 07 02 a0  82 05 83 30 82 05 7f 02  |H..........0....|
> > 002cc6b0  01 01 31 0f 30 0d 06 09  60 86 48 01 65 03 04 02  |..1.0...`.H.e...|
> > 002cc6c0  01 05 00 30 5c 06 0a 2b  06 01 04 01 82 37 02 01  |...0\..+.....7..|
> > 002cc6d0  04 a0 4e 30 4c 30 17 06  0a 2b 06 01 04 01 82 37  |..N0L0...+.....7|
> > 002cc6e0  02 01 0f 30 09 03 01 00  a0 04 a2 02 80 00 30 31  |...0..........01|
> > 002cc6f0  30 0d 06 09 60 86 48 01  65 03 04 02 01 05 00 04  |0...`.H.e.......|
> > 002cc700  20 e2 47 64 f8 e8 7b 62  eb 17 e0 13 0a 0d 93 02  | .Gd..{b........|
> > 002cc710  7a d8 3b f0 20 a8 ee 3d  49 98 3f de c1 47 de 15  |z.;. ..=I.?..G..|
> > 002cc720  43 a0 82 03 2c 30 82 03  28 30 82 02 10 a0 03 02  |C...,0..(0......|
> > 002cc730  01 02 02 11 00 8f fc 11  bf 41 54 40 74 89 2c 53  |.........AT@t.,S|
> > 002cc740  a5 78 c1 e8 32 30 0d 06  09 2a 86 48 86 f7 0d 01  |.x..20...*.H....|
> > 002cc750  01 0b 05 00 30 1c 31 1a  30 18 06 03 55 04 03 13  |....0.1.0...U...|
> > 002cc760  11 58 65 6e 53 65 72 76  65 72 20 58 65 6e 20 64  |.XenServer Xen d|
> > 002cc770  65 76 30 1e 17 0d 32 35  30 33 32 30 31 36 35 35  |ev0...2503201655|
> > 002cc780  30 37 5a 17 0d 33 37 30  31 31 39 30 33 31 34 30  |07Z..37011903140|
> > 002cc790  37 5a 30 1c 31 1a 30 18  06 03 55 04 03 13 11 58  |7Z0.1.0...U....X|
> > 002cc7a0  65 6e 53 65 72 76 65 72  20 58 65 6e 20 64 65 76  |enServer Xen dev|
> > ...
> >
> > So, this confirms that the string table is there to support larger
> > section names and the signature is there and it's working.
>
> But is it going to work on all EFI implementations, or merely the one you tried?

Can you be more specific ?
The file was tested using dozens of different hardware and under Qemu.
Only x64 if it's what you mean.

> Of course it would help if Demi could give more concrete pointers to (possible)
> implementations where there might be (known? suspected?) issues.
>
> Jan

Frediano

