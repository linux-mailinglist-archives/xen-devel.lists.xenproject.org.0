Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D44AD9E78
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015721.1393257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUXo-0000ZE-PF; Sat, 14 Jun 2025 17:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015721.1393257; Sat, 14 Jun 2025 17:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUXo-0000W7-MG; Sat, 14 Jun 2025 17:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1015721;
 Sat, 14 Jun 2025 17:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUXn-0000UH-91
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:19:51 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53187be-4943-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 19:19:47 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-70e40e3f316so22862127b3.0; 
 Sat, 14 Jun 2025 10:19:47 -0700 (PDT)
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
X-Inumbo-ID: c53187be-4943-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749921586; x=1750526386; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5+N1kbLD+IUbDgxWMy//0LLQepPeelA35Ixfb+CwiA=;
        b=NBwsDE8PyEguPK5afSFuePtMPMxNhMJmOicbPAVOuE8yVT2AltlOTqdusQ5IoRnuOM
         jGjOGFPKVIvbktTiFBV7qGNag875eK3ZSw62f9DW3FRZMo5CSWw/VzJlHrTUUN6O1Knz
         XWAPcV1+HOr5frZiJfZ5A3huJRGnV1mpXPR2nyfG96g9Ln5EN94C/yhwbRZEFCyuaepq
         Y+AZwCAgOO2I1gxrJkewMAw+y/VeyGOZ5u3kmKA+bwZaohyG5y5K1maMtHerExTPTLUz
         4Lyo4uJshLOrZuGc8EnKaYZE954eTIjd6+dG2+rSUzpHmCR8MlDgmm1i2ixFM0gB5UuN
         nesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749921586; x=1750526386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5+N1kbLD+IUbDgxWMy//0LLQepPeelA35Ixfb+CwiA=;
        b=AHI3ZrGtiwBL3MTeeBVezmDF1K3PRvapkKy7OzTmerAeAJsINs7IIN5JZDvFypYos2
         SmVv8R0+RPXtNWRXLhJ9A+aNGgeL/qw5cp5gESgAv0dcXzqMtWNV+FUWG6O5chRvlvNo
         i/4iGPONgCqHxSbk4OKPOIWwKXQ79U2fz1g1eC6wNlrd5xWkaE5Jj3UATkhTWZ3LQpWN
         5uzDg5U8kyyiajPtQV28fr9C+E7F+5gTSLny5egrs9PpOtLd0hS3AnBfJeYT49keMGoJ
         eyqXSWxNHNM5yo9yFkxZtfhHsdoQJ7caOzJqRhiIUPhBnyqePnBUK/EGenPQveeKxO2j
         ctjw==
X-Forwarded-Encrypted: i=1; AJvYcCW4zCuEZK8ljhchxSfn79wmUp30MAOvsVEAsPgR/sq0DIzonwytTEs3af+dtkAi86S1S6kOn/6BPu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykUaBI8lMkFjYR6wSgn8WAQDezlrh6RhJ0C8tcUKrqw9CdTR58
	Hq2TztM+t8EFQT2uYn8x5bZ2HnIx3GAoJb+nDzNYZaXGgBX/jbMagyKVCZcqnpRF/j7X3aOgp6m
	07T+DoqyONOFFbJwaJRP8J6xBCjta8HY=
X-Gm-Gg: ASbGncu9dtj34IAltHCMIoiHcAKLdnY7WWE06aN99OzH9D9ynt7m674igjQGE4WNyQv
	evSbUrhEu/dE5b969qPUl9t00+N1aijrCjCRTUbEO/nc7T6GW+kDbPLfsO33ebym2vwBtXS99Wc
	6yLzk/iWE6Yurt1i+24TDlpTpGYLeSIy8CsIMQmg0O
X-Google-Smtp-Source: AGHT+IE4LIYBSmlVS/6k0rpCv0XLrSjXfkcQ20TNpGSk3ZsAIDJfeS5dHcRlzrgktwdNA4l7hOamsRcTlGnYcGs7/YQ=
X-Received: by 2002:a05:690c:e:b0:70c:b685:a6b7 with SMTP id
 00721157ae682-7117542acbamr49505167b3.21.1749921586367; Sat, 14 Jun 2025
 10:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-9-jgross@suse.com>
In-Reply-To: <20250321092451.17309-9-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:19:35 -0400
X-Gm-Features: AX0GCFv_TqYUW0fUZPc6Vd_64H8YW9QGcFaIkeY72FFc-on-IPVkwyXOwCIQMOY
Message-ID: <CAKf6xpvgshy7xO-Fs7VZor3CKg1TWkRvHd8m7aU8BH0tw+HMhg@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 08/12] kexec: move used pages away for new kernel
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:30=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Copying the new kexec kernel must not overwrite any pages still needed
> during this process. Those are especially the GDT, IDT and page tables.
>
> Move those to new allocated pages and update any related pointers.
>
> In case the kexec process is cancelled later, don't undo any page table
> moves, as the system can just be used with the new layout. By freeing
> the original pages there is no memory leaking.
>
> GDT and IDT should be reverted to their original locations, as their
> original memory can't be freed due to not being whole pages.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

