Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D2AD9E59
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 18:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015648.1393200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTwl-0002HH-2i; Sat, 14 Jun 2025 16:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015648.1393200; Sat, 14 Jun 2025 16:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTwk-0002FT-Uw; Sat, 14 Jun 2025 16:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1015648;
 Sat, 14 Jun 2025 16:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQTwj-00022V-HK
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 16:41:33 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b6bae7c-493e-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 18:41:29 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-70e2b601a6bso31702817b3.0; 
 Sat, 14 Jun 2025 09:41:29 -0700 (PDT)
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
X-Inumbo-ID: 6b6bae7c-493e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749919288; x=1750524088; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJO3DPmTnpimcmFIlDN1TKqKbZ/I+JX6jYAuRKKryfQ=;
        b=HIeRLtXwS6fGCCSQvHYeSjk0S+Pw5SDGdW/k1qzqHr9eMyuwWm4Wq+g+O8mCqmlWBa
         91JTY34nnUo5vzIP3OkcGuf+4pJYiv+rdO8s1+ntu3adQsVuZJXXChDOKXTV11YbhTY8
         qt8/llesltUgA+hJ6lNGYsAov4wjB2HtZABPhevGXZ7vqrpw47SwCCEUMNl/hBXhRuxp
         fov0nf5UPNi5Mtdl0ed4RT8UZv/Bvf1yj0TD7+fYUczmDLreCcVQO2Ur4gYBgbGRMdMH
         GUYgJlKjgPxW3hZhaYxhF7arE6pjXXcuuMHO8/O+V0iCE05kj/kUSRtzD0/qyUrbnBhS
         MTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749919288; x=1750524088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJO3DPmTnpimcmFIlDN1TKqKbZ/I+JX6jYAuRKKryfQ=;
        b=AB7e1lDQUTX6CkS/pBrJ4OQhbk0fMrO1bN50PDDZRJoGdaP/rkSuKc70ZYVvP0uJv4
         3zXs2giV8mfRlE53T7wfpvb13gD+zsUoCwdiD0sjj2ltx+e/N4ZfIqnpo238Isg1dBGZ
         0FcKYIZ/EGGnoLvwx9k9rz50gBt4cKOgMsNpMLAgcmgjej0obEo/8qIqYPF2ZRwLlanS
         +TRow+p3OM+XfxZHVxh/bEHvsTwgPTyN8VmDA0MI5gKitq6+ILr0Qxh+MFRtHgOYCcxy
         LaS7WQv3TeAcqNqkBFculit+ff1msup5NfBxMetJaND+m1ZGxnaebpjj12kFxSFqTIhl
         R9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMXHQjd8nwJtSa+m+fTrOXb2dMkgMRtRaoezpNMhBW9VMoQKS9C99ctXDKzqU0Rn1hT/cjGBIqCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9bReDz7QbqNp0ahgb3p+5OV7suB39rFFanOm8rzIV/iYJcFnl
	XMg8ODcLl8OfXfrxVOphTsFYCwLckG8OgqtJ2mhLcgD4d5EhJofDaI3AjArLe+Y4DxMnpL5Vj2J
	GajOhV/2TJ5Ris0ff3CrTscToDl+LrbWvRWQ2
X-Gm-Gg: ASbGnctxuX6TBM25kJokiXZPGJV4i1JAN/vbA8RglsyS/uxLACNix4i4oI10qP89UHS
	OcybOedmTxhaAFiFGogPcrqyCVTVoum7e0bMBARrr5QMD1DeI+rl9nuCTtVZabfOSvZtE3AIEaH
	YyLubvFurJDL6lmM5KfBbCIrewJcZV1t2TobImjllZ
X-Google-Smtp-Source: AGHT+IEAnAkQsLrLIFAiit2cbF9bQ5JMTM52mtEtI7vNK64Wm4m1DlZAuPMBQ/M4LIXcrt50+ZUHOh/osjgqg6qRb00=
X-Received: by 2002:a05:690c:7248:b0:70e:86a:ae1e with SMTP id
 00721157ae682-71175448c6fmr49156787b3.22.1749919288240; Sat, 14 Jun 2025
 09:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-5-jgross@suse.com>
In-Reply-To: <20250321092451.17309-5-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 12:41:17 -0400
X-Gm-Features: AX0GCFudxaAqybZz7opAuHCp3FhTMZE4WZiJAJp3RcPX6BCBtwpT63tnr4klkHA
Message-ID: <CAKf6xpuz6K+0OXjZBCvKHiOAzep8TW2YPt2ztkc3wHcBiNC2Ow@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 04/12] kexec: analyze new kernel for kexec
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:25=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Analyze the properties of the new kernel to be loaded by kexec. The
> data needed is:
>
> - upper boundary in final location
> - copy and memory clear operations
> - entry point and entry parameter
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> +
> +static void check_notes_entry(elf_ehdr *ehdr, void *start, unsigned int =
len)

I think you should rename this to include read_ since it is necessary
to set kernel_entry.  read_phys32_entry_note() or
read_note_kernel_entry() or some variation.  To me, check_ implies a
boolean return without a side effect.

> @@ -54,9 +57,122 @@
>   * - The new kernel is activated.
>   */
>
> -int kexec(void *kernel, unsigned long kernel_size,
> -          const char *cmdline)

> +int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)

NIT: introduce kexec() with the single line form to avoid changing it

Everything else looks good, so preferably with the renaming:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

