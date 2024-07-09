Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFD92B73C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756196.1164735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8ur-0002fz-51; Tue, 09 Jul 2024 11:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756196.1164735; Tue, 09 Jul 2024 11:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8ur-0002eV-1t; Tue, 09 Jul 2024 11:21:49 +0000
Received: by outflank-mailman (input) for mailman id 756196;
 Tue, 09 Jul 2024 11:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sR8up-0002eP-MF
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:21:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d98d645-3de5-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 13:21:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so8927628a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 04:21:46 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551a2sm69477866b.147.2024.07.09.04.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 04:21:45 -0700 (PDT)
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
X-Inumbo-ID: 6d98d645-3de5-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720524106; x=1721128906; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDxwZnYCeeM78g2sRc5CrBn5fI2fHmE2DMV+Jy4FBv4=;
        b=N+oQ3pZxJ2Rh9eU7E8yvmRD10s0yR+4FfLlYTVlJOeeWwgf5r8zcbRYVkZbSkcuhxd
         HGDmRePx4ZZXyf7pw6k0z9XNt7UCnhR8u7hdmX7U/VUeRW5mkWbmPZFOnJ//2Nhm9gL1
         SpVmVfKL7HqkS9DWuKl5sjUm1EeeD7e4RTTxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720524106; x=1721128906;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QDxwZnYCeeM78g2sRc5CrBn5fI2fHmE2DMV+Jy4FBv4=;
        b=wUldO8kMlmYdgMqiTAJNRYuiWJ5b7Fsz+8r29EpeTxIWZ50+H4OC5MPJhfI1b0feFY
         3/CJPKoxvx3Ta7xDwXZVLfnvL1qBeWkI8mXAI5mKoHHxjL0Yq30NUgUZaYCyI9TxY5Va
         NcX3EWsDFwiLJo1FigJeAYRGQ3tTE1PXxz/Xmt0i30mZOmawQykeelt0Lb+fg1EBVBE1
         6p2mg5MTKC6TWoIpSb1lO+VZe6eqxE+EFVYOQbAu3pXgVfZrtC9XZxCiHo80Esntk1Io
         V5+Se9WmCtJKRUkSo82KeMY9NwGKkLQBx7dyQLy0LJzk2cs2YMcijMOBJbqJjuXjNzG3
         Uz3g==
X-Forwarded-Encrypted: i=1; AJvYcCXqlgSjdcfcHcubakIW8ovNV3wNC7CTyKCul09LwYN7AgmSi/V2ZdqNHFJvO/AtaMWsbIJYfXvUwTwRDcQYz0cFhil76WG35/t9ZsqWxTE=
X-Gm-Message-State: AOJu0YxpjgAUnDm4nMBs6v2k+bfL/LYRdAE6tG18ZApVu6WBRgsNjMJJ
	Im5aUd7mfXWwXf6F6Ta9uEf0dYpp8Y74+kNt+zD1CdLIQTSMw5lAj09htmN1mrU=
X-Google-Smtp-Source: AGHT+IGa0+qlhPjVZlXKm/I7Ei0eNlJD4a/HvtxtqISoL/LBp40fqN/HTflYP2u94yxehpYuViA2HA==
X-Received: by 2002:a17:906:c151:b0:a77:a1f1:cfa0 with SMTP id a640c23a62f3a-a780d30b945mr168159266b.36.1720524106295;
        Tue, 09 Jul 2024 04:21:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jul 2024 12:21:44 +0100
Message-Id: <D2KYW63EJC2X.2BK8GEXKZW2N@cloud.com>
Subject: Re: [XEN PATCH v3 09/12] x86/mm: add defensive return
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Federico Serafini"
 <federico.serafini@bugseng.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: <consulting@bugseng.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <acb26329a980809dda100825f52b05d0cc295315.1719383180.git.federico.serafini@bugseng.com> <4cc9a5c7-df57-4a90-8164-cf3002596870@suse.com>
In-Reply-To: <4cc9a5c7-df57-4a90-8164-cf3002596870@suse.com>

On Mon Jul 1, 2024 at 9:57 AM BST, Jan Beulich wrote:
> On 26.06.2024 11:28, Federico Serafini wrote:
> > Add defensive return statement at the end of an unreachable
> > default case. Other than improve safety, this meets the requirements
> > to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> > statement shall terminate every switch-clause".
> >=20
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>
> Tentatively
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -916,6 +916,7 @@ get_page_from_l1e(
> >                  return 0;
> >              default:
> >                  ASSERT_UNREACHABLE();
> > +                return -EPERM;
> >              }
> >          }
> >          else if ( l1f & _PAGE_RW )
>
> I don't like the use of -EPERM here very much, but I understand that ther=
e's
> no really suitable errno value. I wonder though whether something far mor=
e
> "exotic" wouldn't be better in such a case, say -EBADMSG or -EADDRNOTAVAI=
L.
> Just to mention it: -EPERM is what failed XSM checks would typically yiel=
d,
> so from that perspective alone even switching to -EACCES might be a littl=
e
> bit better.
>

fwiw: EACCES, being typically used for interface version mismatches, would
confuse me a lot.

> I further wonder whether, with the assertion catching an issue with the
> implementation, we shouldn't consider using BUG() here instead. Input fro=
m
> in particular the other x86 maintainers appreciated.
>
> Jan

Cheers,
Alejandro

