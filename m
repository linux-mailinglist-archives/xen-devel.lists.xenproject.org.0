Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB987E910
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 13:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694646.1083599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBfb-0000Az-S7; Mon, 18 Mar 2024 12:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694646.1083599; Mon, 18 Mar 2024 12:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBfb-00009C-PN; Mon, 18 Mar 2024 12:00:47 +0000
Received: by outflank-mailman (input) for mailman id 694646;
 Mon, 18 Mar 2024 12:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQPi=KY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmBfa-0008VL-Ph
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 12:00:46 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26584048-e51f-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 13:00:45 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c38bac4c50so170364b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 05:00:45 -0700 (PDT)
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
X-Inumbo-ID: 26584048-e51f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710763244; x=1711368044; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pVtFyqZfvvBB1UYqatX5Ax0FSP5NTPHu/QejxaaD5Q=;
        b=bVvuhGVlnLpbtfLMKnFZUKFQ49nVc9Ifl8zXts8/fLoWWua+H64aHp2gW5hkH1QxB6
         hfc9OxQplOEJYEMbAhhMai1Rw/+CO8BPSgZBR4MdGObrsl/AOzPPuhOyRMuANc9djgHr
         P6DUGOmF2yJ6kWBeJSR7ecj4u9E16kv+3lkrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710763244; x=1711368044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pVtFyqZfvvBB1UYqatX5Ax0FSP5NTPHu/QejxaaD5Q=;
        b=trheFgAzHHJWkTtMHHkXYQuYPwPMc53JYuXISzy7fLKZTcc6X1ZMaK4Dzh5QnyI97c
         dBAvJhWIZBBW61O+LzvCbyoH+qT/D9Cn9JQeGhuT6h75eaq//hVtPsiwtEIu5Y1LkSMn
         0cVXY4gWNbWnaL3JqqaM4s8/tw0GcMu9oo1O6rBHGAWRIEtTfRRSAKcaBxQKwidcpMaE
         g4CVKuQpfNe/Tpir8ka/p35Wmn1u7Ntq8s9XvS6hyN5DF/HdJ2udtJN34dlcQPSYRd/e
         URd3reHzq0uj7n8RT0CVOXviUJfnjBLxpMo6Vixy5YwkwhPlLr+XjyJXFz4f1au7ZHe2
         9SKg==
X-Gm-Message-State: AOJu0Yy1JLD5g5MdCtJ6wrTNboPmrnjGgi2wG/MerBzcITpdOH/R5ZKc
	Zdzq7WuXSvtPASNBxs6Bpis+dPg6m7DQAfn/crjELw9Y3LWSP0uAWoi20WcWSx8E90QkvLc/Ho5
	DdpP5qjJR9/qHPW22bXAtQxFaybRLw+Lma12GMg==
X-Google-Smtp-Source: AGHT+IF1erhh6qPb2+vPFu3twX4R0XdL8tC9t4mIN+qiUJsNptDyJZLJgye46L0p3kwRSwhL0sG3gYzkGGA2p06RZgQ=
X-Received: by 2002:a05:6870:a68e:b0:221:ca43:604e with SMTP id
 i14-20020a056870a68e00b00221ca43604emr11685694oam.53.1710763243910; Mon, 18
 Mar 2024 05:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710762555.git.nicola.vetrini@bugseng.com> <0c584c738f744a583497f1fb862d753836d8b249.1710762555.git.nicola.vetrini@bugseng.com>
In-Reply-To: <0c584c738f744a583497f1fb862d753836d8b249.1710762555.git.nicola.vetrini@bugseng.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 18 Mar 2024 12:00:33 +0000
Message-ID: <CA+zSX=ZFan78nXrymP-89rroDUwPfqWnj3ajSK8h0ov+1bDzFw@mail.gmail.com>
Subject: Re: [XEN PATCH 10/10] xen/sched: address violations of MISRA C Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
	consulting@bugseng.com, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 11:54=E2=80=AFAM Nicola Vetrini
<nicola.vetrini@bugseng.com> wrote:
>
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/sched/private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index 459d1dfb11a5..c0e7c96d24f4 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -540,7 +540,7 @@ static inline void sched_unit_unpause(const struct sc=
hed_unit *unit)
>  }
>
>  #define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
> -  __used_section(".data.schedulers") =3D &x
> +  __used_section(".data.schedulers") =3D &(x)

Arguably this is safe, because any `x` which would be problematic in
this line wouldn't compile in the line above.

But it's almost certainly not worth the effort of documenting or deviating,=
 so:

Acked-by: George Dunlap <george.dunlap@cloud.com>

