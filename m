Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A704CD31512
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 13:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206565.1520026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgjFX-0002bD-0q; Fri, 16 Jan 2026 12:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206565.1520026; Fri, 16 Jan 2026 12:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgjFW-0002Zm-U8; Fri, 16 Jan 2026 12:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1206565;
 Fri, 16 Jan 2026 12:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZM7=7V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vgjFV-0002Zg-43
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 12:48:21 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d754dc-f2d9-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 13:48:18 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-382f087e6c9so11315691fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 04:48:18 -0800 (PST)
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
X-Inumbo-ID: a1d754dc-f2d9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567698; x=1769172498; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L41dPiH44XiWmV9X9+UuETkLEvEFX3CXZYd9hOxjhhk=;
        b=ib6oomKYWQhMyMKs36q4Z9quTPe58dHDDKP9hWho8ek5QZ/XWf9rDZmg0E/SHsU6F0
         dBHwhv7cccj+wtMNTG935VYuI7q7gYT90s7eaOVvVmhQPZkeoET+YTNGUM2PFDIDtfFz
         D1FiZdCi8fqcoBzXPYbk7d7B0DAS8ZeZ8VupqipsNXIL0G+sX10Axay3GGPbSlRjMqji
         P0MrtwY+B7TE4o5Qi2uuRm3HfsSm/wCjMx2NmpiGHef5wQJPuIze1ySf6gM2Tw5Y9wHl
         6SvkFN9FoRsRJKHDSUntLHRntSp0UNo/Cj4suzB+jlOMY1YCMzQi3LzTAYGtnb79QZJp
         4tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567698; x=1769172498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L41dPiH44XiWmV9X9+UuETkLEvEFX3CXZYd9hOxjhhk=;
        b=jQl1L9wIbiVsSLReTu0Bm7zF6I0Ezt7dEVBvypY5kqnMK3tAeEyx9OUUKFofl/JQEY
         pLV5tO0DFK+iEY5PsPrfv3rfLZa1aeiTh9Vj5yLJB978zNd8LdU8z41uaomDgM/A8uVh
         nH+Ey4RMz5oCcp6O36dyw1b1o4Fpd2QDimFl2PLgY2dfvV7Zh/qSO9FlMiBuGzuldB/4
         4E3/Be4iuc7MdWJNMWvkEI9P2R9Hp9HX1rD5/GIbvkH+q+fJ4lPJRyLjK76DKg44aK3F
         IhQaFSQXPRDXGNtsiO8UEZ4bf+n8FBwgyizCbZMeoYCeRsea6woBJCzk+CHuVY9E6u+3
         6zCQ==
X-Gm-Message-State: AOJu0YztM7q6YWLYN37ipxEI27xgv1YsJvFzQCGBUVq34+T6ap8yYQA2
	HxLIQOnMfbcBCRVn014iqQxmWiF450OGS812b+DnxF+D1FybiHSFm7vo+5BjYJQSsOQ9a/g2nb5
	Ham2dM5X6C4VDVhOrbk1to3ujna6iiNQ=
X-Gm-Gg: AY/fxX42vmELyP3Sb+SaDTZlIwU7ZkdlcRIJ8zf22AlqvS2Lr8yihaQkh3XoUvH5i3H
	eGbVo6F8KwDjgcQhC+0dInH5v/89VSx0b7eUq7QQT8M7anL1Xx0G434ZfVO0cRluEEKWanaKHAc
	DvdH6HV2RQEVv4UQ8sxpU0x9cKZGH733Dr+kmAjZIfIbVgUHx8y5TEcrpXfny3wNB2KH3u7vTuD
	eJbyrljTVly4qCY30RDFa5SQHMZcMkQ7x3W9O3YQIytmwQM/bPr51ByOOehKNBG53bqMMRTJS61
	akKGiQ==
X-Received: by 2002:a05:6512:1050:b0:59b:72f8:238e with SMTP id
 2adb3069b0e04-59baef0bdcdmr1067322e87.52.1768567697697; Fri, 16 Jan 2026
 04:48:17 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com> <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com> <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com> <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com> <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com> <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
 <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com> <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
In-Reply-To: <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 16 Jan 2026 14:48:06 +0200
X-Gm-Features: AZwV_QgHuf3HNG8dQpQ5mNjqMNv5I22t4l9d4lWYcn3x9SaUiwDjaUaIvY33XXw
Message-ID: <CAGeoDV-sYJC-bXMAN2qJmPRHqE7oQPRb6D0e0BZi=tJ0aTK-Mw@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

> Actually, can you give the patch below a try? That would explain the 24-byte
> difference (albeit I'm struggling with some other aspects of a proper
> explanation).
>
> Jan
>
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -87,13 +87,13 @@ endif
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>         $(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>         $(MAKE) $(build)=$(@D) $(dot-target).0.o
> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>               $(dot-target).0.o -o $(dot-target).0
>         $(NM) -pa --format=sysv $(dot-target).0 \
>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>                 > $(dot-target).1.S
>         $(MAKE) $(build)=$(@D) $(dot-target).1.o
> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>             $(dot-target).1.o -o $(dot-target).1
>         $(NM) -pa --format=sysv $(dot-target).1 \
>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \

Thank you for fixing this issue.

I tried the Makefile change you suggested (adding $(build_id_linker)
to the two $(LD) invocations.
With this patch applied, I no longer see the issue.

Artifacts (binaries):
https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12743067337/artifacts/browse/binaries/

Test job:
https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12743031743

Applied changes (last two commits):
https://gitlab.com/xen-project/people/mykola_kvach/xen/-/commits/reg_dbg1

Best regards,
Mykola

