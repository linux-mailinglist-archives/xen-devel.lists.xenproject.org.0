Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57FC5A9D5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 00:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162195.1489936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJgoK-0004cD-Sg; Thu, 13 Nov 2025 23:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162195.1489936; Thu, 13 Nov 2025 23:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJgoK-0004Zk-Pj; Thu, 13 Nov 2025 23:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1162195;
 Thu, 13 Nov 2025 23:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQDN=5V=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vJgoJ-0004Ze-I5
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 23:33:03 +0000
Received: from mail-yx1-xb130.google.com (mail-yx1-xb130.google.com
 [2607:f8b0:4864:20::b130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15f97dff-c0e9-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 00:32:58 +0100 (CET)
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-641e4744e59so720171d50.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 15:32:58 -0800 (PST)
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
X-Inumbo-ID: 15f97dff-c0e9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763076777; x=1763681577; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SI4cIqrAacX8OARZm6mZ0FnCfCuDC1hURLlwaznqVo=;
        b=lSIVjD1uBVNCgLxnGBjhTtUJvzgWiconp/fbTF7o/nVzOYWbR1cOVTtQrM3N8hOH+e
         Jh2ofChN+u4k26IwtAi1hENILOfjmrHwWVjOjSG8DwzKw5A/y2mjxcjwSYi/DAuy8dDp
         PzVu0KqiKjm+saMjdummEu7BZaMzqzzydMl65Yj8+4aBUqQ3xeG2ZARnerb4/OrJZQvm
         XRS35dAddbAQOZCb2UDZoHD7UbR0h2OSRdE7K5Y9u2LtLl4TfBBLO3Wo3H5EuJTkRe9X
         gAL6NB4q0FuTm0d4BLYnN/zoIIKH/HzVMpIRoKY5F7ohM2gXwnTC9IJRqab9Z5pmKpqx
         CFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076777; x=1763681577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SI4cIqrAacX8OARZm6mZ0FnCfCuDC1hURLlwaznqVo=;
        b=djRhdLU6cbo+OISCohVcryr2q30aBgFFnBsMvb9eSHpnIdJTQ4Bm+Gmja/R0giuU4h
         i/SfKH484NXYvDdt3i/OGSSwsS/9QImnBmNI5ogq1FHkPiDt4hY3vmVnfp+im2C71WtD
         hf2O5o8BVxK18uVJNT559QCexOsFgWnzGJ/sVPtAhIMCs0jIt+lGu2Gl6N86BHzG1LI0
         AECnAp98a36IPCXOns/FQ/FUDYl9S34XZ8P5ViPPWbkiYSuYTlKvqdDRfRItti2RfFJn
         q3jxNq6hY+5BCvA0y0dSO2PhqOznsNOgrRXTN5jsfx7z+crNF07GSxLhnig9XxAn5HR6
         Vljw==
X-Forwarded-Encrypted: i=1; AJvYcCW44VIQlqJDtJx8RKS/0ICiUGiJxg/JpLgdHH3w8JzrqEnjek54GCEJwaoUU3M5JQjSZfr7LW7wXmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywplvk3N3Pq5D7anKSYbKlpHM8RT91uB1LEK6ZbXTn5UDAbBrye
	f32o2g/N3yVODuPhUOuvtH2KK03SDMiO1EyYbjI60+kU71NVcDblUG5xOUBVL4+oNnhMkogk7+F
	x0n9SeTaxfoh0nClPChDuzAltcxmwxwc=
X-Gm-Gg: ASbGncsJrdDI4YgxMUFdWANb0WqR4mC61JiIQTXDPfI5uCg+MSiELXq+iqtDZlBAEoZ
	FMzDh5kOHjeGKaA85oQm3J9zTWeWuwB42aR363suK0G7LsN63Mn449ogjDCGzi5Ms9nLnaiJHmG
	rQvhkNldoPd6Y2SyUk8dgMkavGiFYzjrUe/W6AQEKrwtBpdVU6mkbkazG8+ZbMxII9+ByisAgL/
	SukUxiV7ypvxCy8F6q4XBoRaZMdRNzwPW9H0ONrHnSEZB5teekeBDL/ogr5mqcoy2HoA78=
X-Google-Smtp-Source: AGHT+IG7De5RrmBHFBNMsQtSaaGYCJfRDbL8A8fGQhZag6Kz2YCQqZYAgnbu/n0DZUiyntRsADD3TYmT5ZiDdStoTHg=
X-Received: by 2002:a53:d00b:0:b0:63f:a89c:46f9 with SMTP id
 956f58d0204a3-641e76a391dmr889503d50.40.1763076777096; Thu, 13 Nov 2025
 15:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <aRYk80Sqo-sjN6fG@mail-itl> <d95e5a85-a8cf-4207-94d8-5e1afff615c1@citrix.com>
In-Reply-To: <d95e5a85-a8cf-4207-94d8-5e1afff615c1@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Nov 2025 23:32:44 +0000
X-Gm-Features: AWmQ_bmkl8V_7Xf06ULHeD6GClX2xw775Hsmw_BjynXbXQnDqw6ASMExjpcRDok
Message-ID: <CAHt6W4dKLM8_04TFheOT5zHv+U-XDJEyKUV_6g_i17baAn5E_g@mail.gmail.com>
Subject: Re: [PATCH for-4.21 v8] xen: Strip xen.efi by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Nov 2025 at 18:40, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
> On 13/11/2025 6:35 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Nov 13, 2025 at 03:43:58PM +0000, Frediano Ziglio wrote:
> >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> For xen.gz file we strip all symbols and have an additional
> >> xen-syms.efi file version with all symbols.
> > You meant xen-syms here, right?
>
> I think so.  I just noticed the same.
>

Yes, my mistake

> >
> >> Make xen.efi more coherent stripping all symbols too.
> >> xen-syms.efi can be used for debugging.
> >>
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > With the above fixed:
> >
> > Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> >
>
> I've done some ad-hoc testing and everything seems to be in order.
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks,
   Frediano

