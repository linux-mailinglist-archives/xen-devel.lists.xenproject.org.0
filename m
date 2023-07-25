Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E47619E7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569695.890653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOI3w-0002fk-Jx; Tue, 25 Jul 2023 13:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569695.890653; Tue, 25 Jul 2023 13:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOI3w-0002dU-HF; Tue, 25 Jul 2023 13:26:52 +0000
Received: by outflank-mailman (input) for mailman id 569695;
 Tue, 25 Jul 2023 13:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGH8=DL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOI3v-0002dM-1Z
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:26:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8aeadc9-2aee-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:26:49 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5222a38c0a0so3724710a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 06:26:49 -0700 (PDT)
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
X-Inumbo-ID: e8aeadc9-2aee-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690291608; x=1690896408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4YgP8vVhGP/Z3y2FHVVLMtFg2ANsoPqxTlazFBlfDo=;
        b=sLd4renpKM3+jIbQ8prX9LYJvJpWHnT9oSjmNmAMm5M8x4/HgQeX3chtabcUjstODq
         SYdXyDvRv3ZAvTyLDUN7VU4nkLUPp7qz5D6E5SWFHv3+0S5wlO3ZQV8NovtIGZimOfnn
         RJu/T658MY0gqV2Nr3l5tBP4N8ZvpmCfWvUVQJBMftFGDumo7tBOq/JfEe+21TQeIl8v
         MaDBt9tTdgbmy2a0Q1d/5ozScr7/bPN8Iv/YUJAAf/8YCnxUdmqVhYBswj8DuddYqo48
         M7t8ucxYObQZIPZ9tr6dAXI1DB/VKR7ldBurwAdjWNa2tN7GyFPJFF3Iby4IIcbHeida
         qxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291608; x=1690896408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4YgP8vVhGP/Z3y2FHVVLMtFg2ANsoPqxTlazFBlfDo=;
        b=Gae2O7tOCjlV+VRGD8duB8iBsTwtzjVL/gI90TgBANAM4gE0L3HpIE0ROzpisOokqk
         zqkMvLyFKdH9UUaF7x6gPAhu3+tL43eiMQ+Kv5vMnHy2Z3a/hjPfCxfYosS7m/kDT3Y2
         IorZEEzbPn/zRBjRghac6qK5r7YWWv4Rcg8TkX8vf8QVmasgeR2O+nYh3Ou1wCqHbq3D
         8eQGJuHoMCpuO+6pkh7h5a9YUAdkMyjQogvxR9n6YjNDJgvPveqjv/mFSigHU5s8ciml
         Llsni3io/uePgdnVa7CwmHSlMrgJYCi26nGkOzvGpRz1qHqtjwV2a1C5hiL9+jH5FZ+I
         pYBw==
X-Gm-Message-State: ABy/qLbl8KXRYA9dPTpArUkAuPzfTUZFG9QVsPtGtoSdFv98ZslCgX3R
	SpPOmAYAVK5JCe6UiuoXfkZFO2TjkVxM9k8RunU=
X-Google-Smtp-Source: APBJJlH9r71cTL5AolZNWo/nazMISuKmtnGcyOofNXifLkrI09MZyWhVrserdDZAqKjdwooFl3Nxnii/6fG/LYqyQWs=
X-Received: by 2002:a05:6402:3da:b0:51e:3558:5eb6 with SMTP id
 t26-20020a05640203da00b0051e35585eb6mr11534512edw.3.1690291608404; Tue, 25
 Jul 2023 06:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230724125857.11133-1-jandryuk@gmail.com> <20230724125857.11133-7-jandryuk@gmail.com>
 <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com> <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
 <d3d8123e-2b81-d3e0-3883-83dcdaf99700@suse.com>
In-Reply-To: <d3d8123e-2b81-d3e0-3883-83dcdaf99700@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 25 Jul 2023 09:26:35 -0400
Message-ID: <CAKf6xpsE_=XYWcC8Q6NhKkboMajnOKZAsfUpOROeGuhU+7CTdw@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 2:27=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.07.2023 21:49, Jason Andryuk wrote:
> > On Mon, Jul 24, 2023 at 12:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 24.07.2023 14:58, Jason Andryuk wrote:
> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> >>> +#define hwp_err(cpu, fmt, ...) \
> >>> +    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
> >>> +#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA=
_ARGS__)
> >>
> >> I'm not convinced ", ##__VA_ARGS__" is a good construct to use. I noti=
ce
> >> we have a few instances (mainly in code inherited from elsewhere), but=
 I
> >> think it ought to either be plain C99 style (without the ##) or purely
> >> the gcc extension form (not using __VA_ARGS__).
> >
> > Using plain __VA_ARGS__ doesn't work for the cases without arguments:
> > arch/x86/acpi/cpufreq/hwp.c:78:53: error: expected expression before =
=E2=80=98)=E2=80=99 token
> >    78 |         printk(XENLOG_DEBUG "HWP: " fmt, __VA_ARGS__);  \
> >       |                                                     ^
> > arch/x86/acpi/cpufreq/hwp.c:201:9: note: in expansion of macro =E2=80=
=98hwp_verbose=E2=80=99
> >   201 |         hwp_verbose("disabled: No energy/performance
> > preference available");
> >       |         ^~~~~~~~~~~
>
> Of course.
>
> > I can use "__VA_OPT__(,) __VA_ARGS__" though.
>
> __VA_OPT__ is yet newer than C99, so this is an option only if all
> compilers we continue to support actually know of this.

Right, sorry.

> We have no
> uses of it in the codebase so far, which suggests you might best go
> with the longstanding gcc extension here.

FTAOD, "##__VA_ARGS__" is the longstanding extension?  It's the only
one I've been able to get to compile.  I'm reading
https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html and it
mentions a few different extensions.

This part seemed promising:
"""
This has been fixed in C++20, and GNU CPP also has a pair of
extensions which deal with this problem.

First, in GNU CPP, and in C++ beginning in C++20, you are allowed to
leave the variable argument out entirely:

eprintf ("success!\n")
     =E2=86=92 fprintf(stderr, "success!\n", );
"""

However, it doesn't seem to actually work for me.  I still get an
error like the one above for plain __VA_ARGS__.  That is for:

    #define hwp_err(cpu, fmt, args...) \
        printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, args)

I can drop "fmt" from hwp_info() and hwp_verbose() to just use
__VA_ARGS__, but that doesn't work for hwp_err() since we want to
re-order fmt and cpu inside the macro.

Thanks,
Jason

