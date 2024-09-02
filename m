Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3D96824D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787650.1197079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2hY-0002sz-M5; Mon, 02 Sep 2024 08:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787650.1197079; Mon, 02 Sep 2024 08:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2hY-0002qN-J0; Mon, 02 Sep 2024 08:46:20 +0000
Received: by outflank-mailman (input) for mailman id 787650;
 Mon, 02 Sep 2024 08:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vUE=QA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sl2hW-0002Wy-ME
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:46:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13fc1de-6907-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:46:16 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so1540754a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:46:17 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24ff04551sm2037830a12.35.2024.09.02.01.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:46:15 -0700 (PDT)
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
X-Inumbo-ID: d13fc1de-6907-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725266776; x=1725871576; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPZw3WNePYRWROn0r1yEtaz/Txxim8yWF8Db6879pYI=;
        b=U+pCBY1/nLiT6e+oI2MDUnpwCtTmN5Tdz+TsWNF+E9GyqlprNJjOmfjXh3m2dvuhAk
         UQ1+4ksBrBN2v6A/hbarGCxdJngBJSjb9rWaDLLun7bihukD3Pi8njRz82/1LPOLy3nb
         cr8ELPxK5UGjHjdf1VMsULIFmru/ng2efpnOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266776; x=1725871576;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GPZw3WNePYRWROn0r1yEtaz/Txxim8yWF8Db6879pYI=;
        b=rt7LWqLbNv0004wJPcVmWnBJefHsdgydyZebdMb61d9PhdPuLlpaAlialgwElDlFzt
         SGoZby/guYNOLDG2aekckBogQ4AoNu1KRD1BXrifcKncy+y85U/i5V+x6W+xPxfTWKKT
         b9PYmgEt5e1c+LukGHTeuAHF9JzG+39a4Cm8oqokTDsyL6zqcpai/a2vPObkol75xOKf
         8PiXs9raa6uQ2SUZbt3Yt5jUTss4Z1wX1itWUzxfSyHSAtBr5KZ5vusqgkAVZPHtDOeC
         4c5sNkrLRIYDmdgkx/RIT1TR3+z8wY/skY2IXtnqR9SzUYObMIjyj02DP+GlmiDqCSn0
         NAFw==
X-Forwarded-Encrypted: i=1; AJvYcCXWNKdfAs7E6j4uaFo6ma3qq9CLMzMWzGjZgsRf2aqqevv8VxQ4Yys0TtEX+7OukSm3428/2Hd4p3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt0x7LM8zRKwYIe8A2tb4jM30tMcwc3ojCjZ9EYzbVfe/8Ox4G
	qAQIfaZYa1bk+RmtoS66+X0+iQDA5R1vOo1Bg/KTKzCRFlZGk66OSBqzo+gZ05M=
X-Google-Smtp-Source: AGHT+IGLYTEgsV2s2n4EQ0s5F6yLqXquQQYZ3LeD4ugUO+fNINAt2R71HGYcvs2GOgpGp93LKwQm0w==
X-Received: by 2002:a05:6402:518e:b0:5bf:2577:4346 with SMTP id 4fb4d7f45d1cf-5c21ed42e2cmr10263748a12.15.1725266776299;
        Mon, 02 Sep 2024 01:46:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 09:46:13 +0100
Message-Id: <D3VO124CG8DF.FE5DXND84RJT@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Matthew Barnes"
 <matthew.barnes@cloud.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <248b4ea259aa78a17b7b05043ed211a00863bf94.1724247366.git.matthew.barnes@cloud.com> <88f54c3f-a81b-4323-a7cf-3a6be41a9207@suse.com>
In-Reply-To: <88f54c3f-a81b-4323-a7cf-3a6be41a9207@suse.com>

On Wed Aug 21, 2024 at 5:07 PM BST, Jan Beulich wrote:
> On 21.08.2024 17:34, Matthew Barnes wrote:
> > Upon running `xen-cpuid -v` on a host machine with Sapphire Rapids
> > within Dom0, there exist unrecognised features.
> >=20
> > This patch adds these features as macros to the CPU featureset,
> > disabled by default.
> >=20
> > Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>
> I don't strictly mind the patch in this shape, but ...
>
> > @@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_T=
SX_FORCE_ABORT.RTM_ABORT */
> >  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
> >  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
> >  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/=
resume insns */
> > +XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG insn */
> >  XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch =
Record */
> >  XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Trac=
king */
> > +XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operati=
ons on bfloat16 numbers */
> >  XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions *=
/
> >  XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
> > +XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operati=
ons on 8-bit integers */
> >  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (use=
d by Intel) */
> >  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
> >  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flus=
h. */
>
> ... having had a respective (more complete) patch pending for years I rea=
lly
> wonder if it shouldn't be that one to be taken. While it would need adjus=
tment
> to go ahead of other stuff (as posted in v3), I don't think it has any tr=
ue
> dependency on earlier patches in the AMX series. IOW I could re-post v4
> standalone, and then we'd have a more complete view on AMX as well as pro=
per
> dependencies in place.
>
> Thoughts?
>
> Jan

Oh! I had no idea you already posted patches to enable AMX. Is this the one=
?

https://lore.kernel.org/xen-devel/322de6db-e01f-0b57-5777-5d94a13c441a@suse=
.com/

Cheers,
Alejandro

