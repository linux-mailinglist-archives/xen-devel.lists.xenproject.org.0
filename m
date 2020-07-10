Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F721B6B6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:41:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jttHd-00023h-6S; Fri, 10 Jul 2020 13:41:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Va4v=AV=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1jttHb-00023c-Qn
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:41:43 +0000
X-Inumbo-ID: 17032a4a-c2b3-11ea-8fbd-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17032a4a-c2b3-11ea-8fbd-12813bfff9fa;
 Fri, 10 Jul 2020 13:41:43 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C0A1207BB
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594388502;
 bh=i75CBXIgGhcZUa4Q5eVv78+LmWfKj2lmU+kA47/adfU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BVP2jY9BJ54jjApBEPD0xvCJ3d7zT7Oyt4yCdw6oxKWIRmgnSMcGpIU28L0X3wCxh
 bXzut1P37bZxexmGGjWs8ERCJodOW/vggL3EuRUxtOy4TZBDtPsFf8/2Lxaz6AIvYX
 2BbnS0Pdbqa9ra4kz6hbuXtlqtqQ4nbR47BzrjBc=
Received: by mail-ot1-f49.google.com with SMTP id t18so4207536otq.5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 06:41:42 -0700 (PDT)
X-Gm-Message-State: AOAM532p+OjODEF83P1KAIyhH+vOKQtDk9tTRzFDqdpKTGDA3TokXtU5
 7O6jlbtxd8NdNcj+Wyyp6cqLipAZ3s9oWu/y8ao=
X-Google-Smtp-Source: ABdhPJzMDks2bKtBSSU06I1kMxmshqTzgvxqZ+s5CEUL5PYeC51lRTbaxITZFvhimohokw08oLmR71FMFMUIrqKF7Zk=
X-Received: by 2002:a9d:7553:: with SMTP id b19mr11274563otl.77.1594388501943; 
 Fri, 10 Jul 2020 06:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
 <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
 <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
In-Reply-To: <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 16:41:30 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGsAsOiBsbhT9TXNBsjba=GXHegYbGOpaVFR0vZ8w3+bw@mail.gmail.com>
Message-ID: <CAMj1kXGsAsOiBsbhT9TXNBsjba=GXHegYbGOpaVFR0vZ8w3+bw@mail.gmail.com>
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Jul 2020 at 16:38, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote=
:
>
> On 10.07.20 15:27, Ard Biesheuvel wrote:
> > On Fri, 10 Jul 2020 at 13:17, Bartlomiej Zolnierkiewicz
> > <b.zolnierkie@samsung.com> wrote:
> >>
> >>
> >> [ added EFI Maintainer & ML to Cc: ]
> >>
> >> Hi,
> >>
> >> On 7/9/20 11:17 AM, J=C3=BCrgen Gro=C3=9F wrote:
> >>> On 28.06.20 10:50, J=C3=BCrgen Gro=C3=9F wrote:
> >>>> Ping?
> >>>>
> >>>> On 10.06.20 16:10, Juergen Gross wrote:
> >>>>> efifb_probe() will issue an error message in case the kernel is boo=
ted
> >>>>> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoi=
d
> >>>>> that message by calling efi_mem_desc_lookup() only if EFI_PARAVIRT
> >>>>> isn't set.
> >>>>>
> >
> > Why not test for EFI_MEMMAP instead of EFI_BOOT?
>
> Honestly I'm not sure EFI_BOOT is always set in that case. If you tell
> me it is fine to just replace the test to check for EFI_MEMMAP I'm fine
> to modify my patch.
>


Yes please

