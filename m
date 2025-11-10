Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F8C46A27
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 13:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158322.1486670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR9F-0000Z4-G6; Mon, 10 Nov 2025 12:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158322.1486670; Mon, 10 Nov 2025 12:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR9F-0000XB-DQ; Mon, 10 Nov 2025 12:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1158322;
 Mon, 10 Nov 2025 12:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thpE=5S=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vIR9E-0000X5-Mt
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 12:37:28 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03aadc6b-be32-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 13:37:27 +0100 (CET)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-787cc9de986so22719427b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 04:37:27 -0800 (PST)
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
X-Inumbo-ID: 03aadc6b-be32-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762778246; x=1763383046; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wae001CoERG5WO46lzb4HtEOVA8lNVhjUvYhOsjDUc=;
        b=TSMHPGeNE9g6lKaNKlHIa2Ute/WIy79KUTjRFoJnEvu696VL6f1X43pnTcr7Zz40Dd
         xUZoKj0G6yapZd38608tdXF2FDif22fpz/3Gaw7dQP4htkMY51tGqdVBNyR5KG6u0JQV
         uG/Ik30Spqvr0GRI3T/ssXs+LE1GUwxrWisexQHem9F3VbIyyKliovw+lcOCNgyygRoZ
         3ofXIR+v5bT4n+7PihWQnYrKAveElCB/anFqmuPfTkcR/NL+LA52d7emm2jWtlYnhRV/
         HgLbgEfVOrO4EiYKW8QxGfiNoq5ILwjJYiEMPNj2MDcDdXrnsiG6EYV3hMyM0S/yZ7iG
         XwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778246; x=1763383046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wae001CoERG5WO46lzb4HtEOVA8lNVhjUvYhOsjDUc=;
        b=BK6KVE6j2djXc+piHyj3HE+yLhecQwlwK8vDE2vM1Xoc2GCbgLxhLKKYitMOy2veGk
         drTMvqnj6gQDGRq4Rqj4x7vhwBklGlHENmVdTs0u1YIyqAOtStuo38ktJJuSop6bbZEz
         9Sr0XmFE6Vfm7Bx/Z2xxCMnFKCTt1c8wNN1yH4sdpMbB8bJJawyjjBus3+QZtPdtIt5D
         Css7oTpdwY2TkkuCCV4sBMqMZSns9m+IAi0pof5hWxoKylEbD679t2orl7QYTPTPeg8N
         RZJXyQsfdwJ/itTK9RsKjYPaBmmf1KeZf/7goOmkwM4AQEKMh6+aTb7wx4sbZ8fWeAvB
         e1ug==
X-Gm-Message-State: AOJu0YxlmJ6ny9GxMBZNTBtyrS1nnY9HWsBGrkeOAxTqF+chkR/FlLo6
	6C3IUFo+J34XtblURB6ppqr0vSiBwZv9RUTBICOaXH6ykZ26TVsP/3roQoHrbj16FqSODyprVZ9
	VGjfzgR09ya+33USknX+SRvOS+cqAic4=
X-Gm-Gg: ASbGncu7NpNyn4jlTKcZA0PRlF7lecf67/xfawb1FMnBXdqbN3IIvMVkza1w1mu/MsM
	VCqLtka6rJ55Xn5XKFJH9N+2+kI2Nhgr46TNWAAMZBdsTMOC+705tVa7nvngvOIxGd6teqUwS9p
	CrCYmbk3dcFp3yXniKYXwQJRElLrZA4zIeZxeLr5hg1lSUx2TG1ka9Vpb6z0uQMtsNsd2jbTbIr
	rhEQuoEzJqg0lb0kcssMa8y0n/QugqEBZNd0uK8eZ3QXyYyIWaXaY2W6Q+h
X-Google-Smtp-Source: AGHT+IGJ293TP3BsXKshsR7HuRKuHMZf0ID0Tzia4t5syzJ8A7LG4In7UKur087FGg9weiyvgkVYQeOoYWU/6TeXlpQ=
X-Received: by 2002:a05:690c:5996:b0:784:a232:b3d9 with SMTP id
 00721157ae682-787d53765a6mr58245567b3.18.1762778246060; Mon, 10 Nov 2025
 04:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com> <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com> <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
 <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com> <CAHt6W4fscR1zAPbEmmgy5ARUGN5R2XBLF=Lkbjw3GU_RwibTfA@mail.gmail.com>
 <1fa1ca4d-62ce-49ee-8a8a-8d0d9e8abf2e@suse.com>
In-Reply-To: <1fa1ca4d-62ce-49ee-8a8a-8d0d9e8abf2e@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 10 Nov 2025 12:37:14 +0000
X-Gm-Features: AWmQ_blkxVAXKVTlgNA7yJwVR9gISJiYP0I0CYBWVMETb0VbbeEKn0zNFqkemIo
Message-ID: <CAHt6W4ci9QfOn0cKgsyqaemn1R8eOh2bd=4wQehXFFZn22aNiA@mail.gmail.com>
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

On Fri, 7 Nov 2025 at 07:04, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.11.2025 17:32, Frediano Ziglio wrote:
> > On Thu, 6 Nov 2025 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 06.11.2025 10:58, Frediano Ziglio wrote:
> >>> On Thu, 6 Nov 2025 at 03:52, Demi Marie Obenour <demiobenour@gmail.com> wrote:
> >>>> Does objdump on the signed file return correct section names?
> >>>
> >>> From objdump -x
> >>>
> >>> Sections:
> >>> Idx Name          Size      VMA               LMA               File off  Algn
> >>>   0 .text         0016c9ae  ffff82d040200000  ffff82d040200000  00000320  2**4
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> >>>   1 .rodata       0006b9e8  ffff82d040400000  ffff82d040400000  0016cce0  2**2
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   2 .buildid      00000035  ffff82d04046c000  ffff82d04046c000  001d86e0  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>   3 .init.text    0004d123  ffff82d040600000  ffff82d040600000  001d8720  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> >>>   4 .init.data    0006c9b0  ffff82d040800000  ffff82d040800000  00225860  2**2
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   5 .data.read_mostly 00028da8  ffff82d040a00000  ffff82d040a00000
> >>> 00292220  2**4
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   6 .data         0000feec  ffff82d040a29000  ffff82d040a29000  002bafe0  2**4
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   7 .bss          00223108  ffff82d040a39000  ffff82d040a39000  00000000  2**4
> >>>                   ALLOC
> >>>   8 .reloc        000016b8  ffff82d040c5d000  ffff82d040c5d000  002caee0  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>   9 .sbat         000000a6  ffff82d040c5f000  ffff82d040c5f000  002cc5a0  2**2
> >>>                   CONTENTS, READONLY
> >>>
> >>> Which looks correct.
> >>>
> >>> From hexdump -C I can see close to the end
> >>>
> >>> ...
> >>> 002cc580  30 ae 38 ae 60 ae 00 00  00 80 a3 00 10 00 00 00  |0.8.`...........|
> >>> 002cc590  a0 ae c0 ae e0 ae 00 00  00 00 00 00 00 00 00 00  |................|
> >>> 002cc5a0  73 62 61 74 2c 31 2c 53  42 41 54 20 56 65 72 73  |sbat,1,SBAT Vers|
> >>> 002cc5b0  69 6f 6e 2c 73 62 61 74  2c 31 2c 68 74 74 70 73  |ion,sbat,1,https|
> >>> 002cc5c0  3a 2f 2f 67 69 74 68 75  62 2e 63 6f 6d 2f 72 68  |://github.com/rh|
> >>> 002cc5d0  62 6f 6f 74 2f 73 68 69  6d 2f 62 6c 6f 62 2f 6d  |boot/shim/blob/m|
> >>> 002cc5e0  61 69 6e 2f 53 42 41 54  2e 6d 64 0a 78 65 6e 2e  |ain/SBAT.md.xen.|
> >>> 002cc5f0  78 73 2c 31 2c 43 6c 6f  75 64 20 53 6f 66 74 77  |xs,1,Cloud Softw|
> >>> 002cc600  61 72 65 20 47 72 6f 75  70 2c 78 65 6e 2c 34 2e  |are Group,xen,4.|
> >>> 002cc610  32 30 2e 31 2d 37 2e 32  32 2e 67 33 65 30 36 37  |20.1-7.22.g3e067|
> >>> 002cc620  32 36 62 2e 78 73 39 2c  6d 61 69 6c 74 6f 3a 73  |26b.xs9,mailto:s|
> >>> 002cc630  65 63 75 72 69 74 79 40  78 65 6e 73 65 72 76 65  |ecurity@xenserve|
> >>> 002cc640  72 2e 63 6f 6d 0a 00 00  00 00 00 00 00 00 00 00  |r.com...........|
> >>> 002cc650  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> >>> 002cc660  2c 00 00 00 2e 69 6e 69  74 2e 74 65 78 74 00 2e  |,....init.text..|
> >>> 002cc670  69 6e 69 74 2e 64 61 74  61 00 2e 64 61 74 61 2e  |init.data..data.|
> >>> 002cc680  72 65 61 64 5f 6d 6f 73  74 6c 79 00 00 00 00 00  |read_mostly.....|
> >>> 002cc690  9e 05 00 00 00 02 02 00  30 82 05 92 06 09 2a 86  |........0.....*.|
> >>> 002cc6a0  48 86 f7 0d 01 07 02 a0  82 05 83 30 82 05 7f 02  |H..........0....|
> >>> 002cc6b0  01 01 31 0f 30 0d 06 09  60 86 48 01 65 03 04 02  |..1.0...`.H.e...|
> >>> 002cc6c0  01 05 00 30 5c 06 0a 2b  06 01 04 01 82 37 02 01  |...0\..+.....7..|
> >>> 002cc6d0  04 a0 4e 30 4c 30 17 06  0a 2b 06 01 04 01 82 37  |..N0L0...+.....7|
> >>> 002cc6e0  02 01 0f 30 09 03 01 00  a0 04 a2 02 80 00 30 31  |...0..........01|
> >>> 002cc6f0  30 0d 06 09 60 86 48 01  65 03 04 02 01 05 00 04  |0...`.H.e.......|
> >>> 002cc700  20 e2 47 64 f8 e8 7b 62  eb 17 e0 13 0a 0d 93 02  | .Gd..{b........|
> >>> 002cc710  7a d8 3b f0 20 a8 ee 3d  49 98 3f de c1 47 de 15  |z.;. ..=I.?..G..|
> >>> 002cc720  43 a0 82 03 2c 30 82 03  28 30 82 02 10 a0 03 02  |C...,0..(0......|
> >>> 002cc730  01 02 02 11 00 8f fc 11  bf 41 54 40 74 89 2c 53  |.........AT@t.,S|
> >>> 002cc740  a5 78 c1 e8 32 30 0d 06  09 2a 86 48 86 f7 0d 01  |.x..20...*.H....|
> >>> 002cc750  01 0b 05 00 30 1c 31 1a  30 18 06 03 55 04 03 13  |....0.1.0...U...|
> >>> 002cc760  11 58 65 6e 53 65 72 76  65 72 20 58 65 6e 20 64  |.XenServer Xen d|
> >>> 002cc770  65 76 30 1e 17 0d 32 35  30 33 32 30 31 36 35 35  |ev0...2503201655|
> >>> 002cc780  30 37 5a 17 0d 33 37 30  31 31 39 30 33 31 34 30  |07Z..37011903140|
> >>> 002cc790  37 5a 30 1c 31 1a 30 18  06 03 55 04 03 13 11 58  |7Z0.1.0...U....X|
> >>> 002cc7a0  65 6e 53 65 72 76 65 72  20 58 65 6e 20 64 65 76  |enServer Xen dev|
> >>> ...
> >>>
> >>> So, this confirms that the string table is there to support larger
> >>> section names and the signature is there and it's working.
> >>
> >> But is it going to work on all EFI implementations, or merely the one you tried?
> >
> > Can you be more specific ?
> > The file was tested using dozens of different hardware and under Qemu.
> > Only x64 if it's what you mean.
>
> No, I was referring to the fact that there are distinct EFI implementations,
> which may differ in their loader behavior. But see also Demi's clarification
> on her original remark.
>
> Jan

Demi posted an update on that remark that it was a mistake.

The signature should be applied as the last step resulting in it to be
at the end of the file. This as any following update to the file
(beside updating the checksum or the signature itself) would
invalidate the signature and correctly the firmware would refuse to
load the file if secure boot is enabled.

Frediano

