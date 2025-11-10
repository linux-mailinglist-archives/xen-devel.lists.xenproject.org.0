Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7DC49621
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 22:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158709.1487143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIZH0-0001jL-MK; Mon, 10 Nov 2025 21:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158709.1487143; Mon, 10 Nov 2025 21:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIZH0-0001gr-JE; Mon, 10 Nov 2025 21:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1158709;
 Mon, 10 Nov 2025 21:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhZs=5S=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vIZGz-0001gl-H7
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 21:18:01 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba805f40-be7a-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 22:17:58 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-297eca3d0a3so27382685ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 13:17:58 -0800 (PST)
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
X-Inumbo-ID: ba805f40-be7a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762809476; x=1763414276; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlTqH2QqRYRkrsFCW1+6qU6zhJzU2clBO3yX2ShB2Dw=;
        b=b6KSiZZVvXnBQ4kKCrL8iscC55yokzZiyDUHMrdT23QsEQC5eodj878At95jB5mb8k
         OobMMEsbfon5a6Y6UaUCj1VaPqjoLtTCYFsELmsqq7QeRM2LsTR1IttiK5JB9jEJkLuj
         zGC1mCdAvAFdEZDwytE5moMJJxYFwqaGb9TcdX+HpWQiCIVNEOEsmXgJowl8YmHbXNuK
         XvLNn3evPecb6A6QlgQQExm3D3tlT3ai5nUfueqoHADTCNuz486ZAns5KjHXLN+rTWZh
         mTh1quijTwt+CZKOXUN2RmQYsbLUIxgb9XGmkLDw4LU58eNiD5WYB45+J1qn80ZCt3mD
         Sgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762809476; x=1763414276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HlTqH2QqRYRkrsFCW1+6qU6zhJzU2clBO3yX2ShB2Dw=;
        b=N1aKpX8m6469xIGMgTifXrok+4mOxNulAnq41I+U4timBm4/U60tBRFoMh2tS6/08N
         uBVDvhw/5JBpkB2jHWHu1vztIDX6KcHQo11nNYvnLvlX4drB/I9DfOpHgr5dlgVFQJXq
         cW+8BRVlrf/r42qS5I9ICff/jgxTXRXZ+6CagVXoxAjlEly9ZDzlZtHYLSc3UqTa7Dl0
         krmNXLtHKbgefpN8KDJAo4+ETYVpYTaeDdugS7NZKUu5U4guSCu+eoBpmlRfJ51K5aku
         UedLg2anb2cmVZXwjK7lehVxrLewz3BmoFy73b3dqM2wSSn2IPPHjaTAlJUXr5YyIww3
         T8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV1c3yn1W+QKzExivCuGyJk+vUvcqtgsA0h2BpQV6VvRf8SjDCZhITA5jgZLnx3alL/SUIPp4+EEfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKLxeQhfpBepWXKMnhPxOjq5v0oYU8c+hjRUFnkrShVU/Uq+/8
	6G1GcVBlftEKAkkmvISs9MPI8PQ8q/YWm0clP7J9yX0GmkfzA2pkZsJnWP2vB/5QHUaxjJvjQDB
	H9xtgI3tL41tOUHCi2Cq9sGfersAkCQ==
X-Gm-Gg: ASbGncuFad/FF1flOHFe9G9bgNrWJPhkXTeQ9sc/QODZWrVEWEirSCE32Bner5CagKS
	jbJLn9nPfdKG2DngW6S0SLIP5R9iZT+YXDH+2S8v71Q/6saEBp3xMYwhJxhzIYuUgaSUwHQ2h5t
	lAvclofYGdf8Iw5GvrvYopFOipgjVjUSJB12a5Nre7xzPj0HIY/O4ZsPnT/UEH/yLhkBr4z5EcF
	Zcl2t17WcMQnF6xN4GyBdrJPoMcXUQTGNtVP7S7Wq+I1lfuouWppjogCg==
X-Google-Smtp-Source: AGHT+IGsaXeuQa2bpyTz/UVSFBN6MS2vjtdGN9vE1W06qF+XGm4PfJepC/O+Z/ErK8RG0UzL4ttlD+bK5PnldlEFaGg=
X-Received: by 2002:a17:902:f70a:b0:290:c94b:8381 with SMTP id
 d9443c01a7336-297e540d89bmr125911475ad.7.1762809476512; Mon, 10 Nov 2025
 13:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20251023233408.16245-1-samaan.dehghan@gmail.com>
 <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com> <88bff8bf-195b-432d-97af-317398796d40@xen.org>
 <CAJ=z9a2=jzZSJW9Y8rNhA2L=m9jYF1ziuzoEwH7+DAG+q-HKCA@mail.gmail.com>
In-Reply-To: <CAJ=z9a2=jzZSJW9Y8rNhA2L=m9jYF1ziuzoEwH7+DAG+q-HKCA@mail.gmail.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 10 Nov 2025 15:17:45 -0600
X-Gm-Features: AWmQ_bkJ3CYcuYqtxh8JHBeX3XPx6T6BTJPaL-KQWOlv1Av8yZV6g8LB3Y1sCgU
Message-ID: <CAHFNDNgfDaYUeN5fWs82urAzsG++cCAwWaPZyXDo0Vn4yEEK_g@mail.gmail.com>
Subject: Re: Support of building Xen with Clang/LLVM on Arm?
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wentao Zhang <wentaoz5@illinois.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:35=E2=80=AFAM Julien Grall <julien.grall.oss@gmail=
.com> wrote:
>
> Le mar. 4 nov. 2025 =C3=A0 10:44, Julien Grall <julien@xen.org> a =C3=A9c=
rit :
> > Happy to review any patches for clang support on Arm.
>
> I was told privately that there is a series on the ML to add support
> for Clang (see [1]). It looks like there series
> had some reviews but needs a new version. Adding Volodymyr as the
> original author.
>
> [1] https://lore.kernel.org/all/20241129014850.2852844-1-volodymyr_babchu=
k@epam.com/
>

Thanks for the pointer. We have tested this patch from our side and it
already solved our problems (specifically patch 1, 4 and 5). Shall we
resubmit this patch again or follow up on the original thread?

Also regarding the comment [1] shall we explore alternative fixes?

[1] https://lore.kernel.org/all/1d1684b2-ed0e-47cb-ab78-72cd2f51aafc@suse.c=
om/

Thanks,
Saman

> >
> > Cheers,
> >
> > --
> > Julien Grall
> >

