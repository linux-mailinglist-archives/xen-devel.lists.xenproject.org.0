Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E8B2DA51
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 12:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087310.1445398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uogMS-0005fX-OV; Wed, 20 Aug 2025 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087310.1445398; Wed, 20 Aug 2025 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uogMS-0005dH-LD; Wed, 20 Aug 2025 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1087310;
 Wed, 20 Aug 2025 10:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmnz=3A=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uogMQ-00052a-J5
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 10:48:06 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26df0903-7db3-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 12:48:06 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-310c2f193b0so571986fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 03:48:06 -0700 (PDT)
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
X-Inumbo-ID: 26df0903-7db3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755686884; x=1756291684; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE5n/uYoEfT/Ac//khvU235+HiqMMoUZP4tTrzR4Nhw=;
        b=ib5fvxmb1wKUAMGtWpNToklPpUFvs+tPBP9jC3qM2bM8j3vtazNUkTVKVh4V+cOEdh
         PfMehXlNGwrPxuKXqC3jFFBO8J6OPGpEOLqjX+WM3S3AueQKtnIzoIoHMUv+48HdChPo
         qAasTr4Z2IaYZl2DVkZlot9DlGljVPKQ08zVvk6r2m5h28koEHLOQwRktTBcVdVdumy+
         JRxq4qZnycOJs/GU80IBzyHtX0ifmP+IkLQzqemGD5nSBsvWvOKEZuZZzTmfJEEan1aq
         kQSlJdUUhFv/U0662HZ9JBwo0ag/8j2x4YeAbpjRKb0OF5JxUygJg8OzJiXD+Inqqkcp
         JQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686884; x=1756291684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE5n/uYoEfT/Ac//khvU235+HiqMMoUZP4tTrzR4Nhw=;
        b=N8lKTP+xF5N6YRIUDHFqHGBEU0dZDywn1h8LrJ/JNrMDCjqPsEjNHsJXLzbOX3wYXS
         YOmX8nttPB1NNOQQlPH7jvTFocIY3ipyI0zPl7ksMBMdPLtjgyGb2cMsSJzNruIGHPeU
         jFPz0nxC29JSCYsWSGi6nkbz3OTtLGP7+QbjLXNtNuocPEZZy2Ux4ij6WNDy/ZoVEWs3
         U03G6MA1mGqWgvn7DD6TfBPJBemeHyj87hz6WDibVrLq3d16CxPLsx0jJ3Blct5DU7ZO
         6RWl97Bo3SkbPlBCc9IIofL9jmb/Q8KjdO810fcBT85qyXiUREtgql3Ax3Nevp2+hl8S
         SrYQ==
X-Gm-Message-State: AOJu0YwZaMIOeMeD5S21YAtRDMtKkah3Bws8wmRIevBgGPN4iQU2nRZ2
	pmv2AUvXR12cst+dh2suNn8WopMuGaAvKGCUYC/jsYKtDWpeNHpF66Xj3glnBqafJTkAqafwvAw
	GMKRFHGNr5+p/H1kgsu6Iv8XyAY4AgNSO1g==
X-Gm-Gg: ASbGncs/Vn/BC0ntreTG94WkGjXShZYzGJKc20vsI6w2uRctaY6UCDSl6BizLplSnlW
	p4gB82TYWu3YG5b1s6CcUMDxfeJNhYh+JDUYIXg6fdPYFlsvIOZZN3ldZc2kXoTBO5QsMQy6p2U
	EqRRUW/Ju/4LkdAgssMlrJCBYNe+OegYjHjEM7v/7WtSlx81i6FqF1R5yrDIFDELiIOlcTfbat0
	GhZiEP7+omm/pf2yxoPXTHQgAG2v+4n+dPBf8Vt
X-Google-Smtp-Source: AGHT+IEHTCYjB4JshHsUtIQ6SPuIqiE8OvBvKmf7UMEkYhT2MnLCLN5fk/Qi4hkXLGA5RimhjClPXk8W3UaFYYxt1wE=
X-Received: by 2002:a05:6808:6d81:b0:404:a28c:ca53 with SMTP id
 5614622812f47-43771f10d15mr639568b6e.0.1755686884520; Wed, 20 Aug 2025
 03:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753869323.git.w1benny@gmail.com>
In-Reply-To: <cover.1753869323.git.w1benny@gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 20 Aug 2025 12:47:53 +0200
X-Gm-Features: Ac12FXyh236mPiqIbqgnmqUrqbFNV0g_JmmSkQTTqzG6o2YskmoDd233FPGgpCU
Message-ID: <CAKBKdXjmhBHOMpK0DFqDr78KfX4hMMn-sUT5431V3xdZQief1A@mail.gmail.com>
Subject: Ping: [PATCH v4 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 11:56=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com=
> wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Changes since v3:
> - Renamed offsetofend macro to offsetof_end.
>
> Changes since v2:
> - Added sizeof_field and offsetofend macros to common-macros.h.
> - Used offsetofend macro everywhere to make semantically sense.
> - Added BUILD_BUG_ON to ensure offsets are correct based on the SMBIOS
>   specification (with explanation in the comments).
> - Fixed commit message of the second patch to mention the new smbios_pt_c=
opy
>   function.
> - Fixed nits (empty lines, misplaced *).
> - Retained the original comment "Only present when passed in" + added it =
to
>   the new tables where applicable.
> - Replaced hardcoded offset for chassis_handle in smbios_type_2_init.
>
> Changes since v1:
> - Swapped the order of S-o-b in the last commit message.
>
> Resubmitting patch from Anton Belousov and addressing review comments
> from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/2022-=
01/msg00725.html
>
> Original message:
> > SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox det=
ection
> > by malware using WMI-queries. New tables can be mapped to memory from b=
inary
> > file specified in "smbios_firmware" parameter of domain configuration.
> > If particular table is absent in binary file, then it will not be mappe=
d to
> > memory. This method works for Windows domains as tables 7,8,9,26,27,28 =
are not
> > critical for OS boot and runtime. Also if "smbios_firmware" parameter i=
s not
> > provided, these tables will be skipped in write_smbios_tables function.
>
> Further explanation:
> Some malware samples are known to check presence of various hardware comp=
onents
> (like CPU fan, CPU temperature sensor, etc.) by WMI queries. If these com=
ponents
> are not present, then malware can assume that it is running in a sandbox =
and
> will not execute its payload.
>
> This patch will allow security researchers to create a custom SMBIOS
> firmware binary file that contains these tables.
>
> Petr Bene=C5=A1 (3):
>   tools: add sizeof_field and offsetof_end macros
>   hvmloader: fix SMBIOS table length checks
>   hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
>
>  tools/firmware/hvmloader/smbios.c       | 290 ++++++++++++++++++------
>  tools/firmware/hvmloader/smbios_types.h | 109 +++++++--
>  tools/include/xen-tools/common-macros.h |   5 +
>  3 files changed, 317 insertions(+), 87 deletions(-)
>
> --
> 2.34.1
>

