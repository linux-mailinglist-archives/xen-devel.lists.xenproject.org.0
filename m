Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPPgGiDACmrb7AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:30:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D616E567950
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311585.1581697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsQV-0000dO-5L; Mon, 18 May 2026 07:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311585.1581697; Mon, 18 May 2026 07:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsQV-0000b5-2f; Mon, 18 May 2026 07:30:11 +0000
Received: by outflank-mailman (input) for mailman id 1311585;
 Mon, 18 May 2026 07:30:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOsQU-0000az-14
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:30:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsQT-008mgc-DJ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:30:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac001-5cb7-0a2a0a5109dd-0a2a4507938e-2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:30:09 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac000-229c-0a2a45070019-d155d0b2a897-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:30:09 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-393d6025f99so28241731fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 00:30:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779089408; cv=none;
        d=google.com; s=arc-20240605;
        b=hBGSJVl5LvazBOsbTK7APQI+aS20slzk864eIxSIYPy9gw85awyR3wWjvfNnwlPwlT
         EAJFr4xLLhqtBrL4fV7EfT5s5VWQtSJF5xGqHJF++hbXFijJy9xPMqKsyqoqV3cbZR+i
         G70Bl8FEt5mcOBgm4/gcOzjesq5v03A1q2YwfdZYZJoU6AfgR54qkyaI6pkvSp8t3p1w
         oFy6SL5AmkUknP+RNSrdsPjmoVkEBegL2msUEzU0CIW72P06JDIdO2j1cf9J+b4/9H0K
         tRvSbmUNYHKqXaeGbtNi/Var2l1CY8YI2Shn360L24xc46lk+VQ6Eg/9LoOC5WTcE7DQ
         TSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GbB0xIaK2vd2KM7jae/EfM0r1j2c34jEMfjm9Ap3LFY=;
        fh=VmRYTqrYqQr1nP/EHKOetkoKt+mAJtoUveNvQ+rA8II=;
        b=imK8sLAAt5rPBiBgkvSyqvAV8L72CwCvg59I89KGuyOQTk7KAsPkIvXbrE7zQUpZ4g
         7vc0ZS7f1wi4LmXPw2ZJgWT1xzoKguFs8z4UxYyxEl5K3FdmK/rMgVA2Hm6futMxeiXG
         vtql7NAVkn7WZ3LQO1sz2PRTOZJsYIuhQ7XNSbza+UNndUi6fw0C3ZwltfWvinh4v/ej
         63WeyaSLxT3fKNbF+DPucO5SbTq/bikH4/VG0ogfF0D+zwvbT1+lzqYIxsp2SrEPXETR
         WnSSCWfFhXra+Q42FFXmVoOutKaELHSCmZt0dCEWLAVQXSQz6gNGwwprHJmVQBp79ni8
         55cg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779089408; x=1779694208; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbB0xIaK2vd2KM7jae/EfM0r1j2c34jEMfjm9Ap3LFY=;
        b=gl57NG8R2USOxXHI5Y4q0RFW1IuDgnGG7qPxWc2oNnxLBtJAu4Pl/O4i6VQiulcg52
         h0vVthgmPXSRTU8Fy/uI8re+qcjMd/2Kz8TNaj20SQEq2KAFCv7474bCB7Z6fOvCvujn
         kY9VcadNC5wcoaGPgntGXnlrxUfYiogoaJ/C1cj58uzn6sY+FfHsQZQ3pgHhBbRofGWw
         FSEWDxdeWEOui6p697UZSrMyEimwOG7Ba51S1tPls7uqN2GxeQdFDKwjpvWq2yWm3Dg+
         BayH5oXPoGSoos9YPkgc5dWeC/xEqdQTnyPuTPPGAH258vileqNRcXu/4bCp2jD5eQ3Z
         gxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089408; x=1779694208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GbB0xIaK2vd2KM7jae/EfM0r1j2c34jEMfjm9Ap3LFY=;
        b=UaUJujlJQz3qf5oDR5BaENRC2XWDNkllmJVcu5kvONB0/Z4D9HtB4r0n0e7WUVHR0Q
         Q+Q0pHD/qYCb6WOqKsOdIKLbM8NB/Cu7A8wIlueH5vI/rpMUAj82f0I6FKRDGExfktCc
         mAhjnCj4XcvIOwDwSBAqftcjkUGr8Vt4IQg49SwnEnR/KKCbACxNO9SXEYly6LzLAmYJ
         11pxJahiBqphMLFZHeIkjPh+wGUDWQ7dQJBUa8sQxweaR9uWMNp/2GnO61hBfWMNhH+Y
         AoBpcwPbzSJHjX//WuoE1L71C70iDbj6dhkyxA68A7F2tyuu8aYFebwKGfxWRj5Ye055
         D/8g==
X-Gm-Message-State: AOJu0YwntbNujzKEd93gfKjT57EC6VJC5vZJX4EMAJBQYa9SY4wFi9EG
	1cDfPNeE6HI0hiSO4obFHjxM4R/LrX0A78bGU2TWXUgjIyWs+tWGNx163r5oquF6B0Td2KNwMI6
	3DfauJemzAj4tcdAYATJYcrzUs2tw/u0=
X-Gm-Gg: Acq92OFcTe/F6GJtpggJpCjAQN6bKUGwNkR7EqYBW1DYjyyicSlv3KzsK4ETyv2w/9d
	hAqr8tX/a9aVDWx7b3cefUnKgN/PLL91NbyfPyXrUY59AIWyRXspZoRampe3zey08bXGdNsSDUH
	rBY4rpNg9JaGCGZOjDRdWZV3u4YfEp5Z+3Bckc9AaGWNhB0Wns0htA1czY37MaB9xsR7RJeRraS
	eJ281M8M3hPzrRaMNi/i5uvdJcMrmexS6B6yI9SsaoY1gg4T7nr42VQHuiiL8LbETbC1HPh3BiA
	YgnmpHPYCFWzT3c=
X-Received: by 2002:a05:651c:41d5:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-395609c0ac6mr40375261fa.9.1779089408290; Mon, 18 May 2026
 00:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260518070524.19813-1-luca.fancellu@arm.com>
In-Reply-To: <20260518070524.19813-1-luca.fancellu@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 10:29:57 +0300
X-Gm-Features: AVHnY4Ii4E0urLp1QprBh4czoFh0poZJ63kuZ7e6h6SWp5ENyorLcNGjFhVduas
Message-ID: <CAGeoDV8XLgPCVmK0uBxmYFTCGf9f6wYJqMB1H7WJHT_uDNqM2A@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: gic-v3: Fix redistributor wakeup polling
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1779089409-2176AC48-EA80748B/0/0
X-purgate-type: clean
X-purgate-size: 1702
X-Rspamd-Queue-Id: D616E567950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 10:05=E2=80=AFAM Luca Fancellu <luca.fancellu@arm.c=
om> wrote:
>
> gicv3_enable_redist() clears GICR_WAKER.ProcessorSleep and then waits for
> GICR_WAKER.ChildrenAsleep to clear, as required after waking a
> redistributor.
>
> However, the polling loop currently uses "while ( timeout )". Since
> timeout is initially false, the loop runs only once unless the timeout
> path has already been reached. As a result, Xen can continue before the
> redistributor has completed wakeup.
>
> Use an unconditional loop, matching the surrounding timeout/break pattern=
,
> so the code polls until either ChildrenAsleep is clear or the deadline is
> reached.
>
> While there, also fix the timeout message. This path polls
> GICR_WAKER.ChildrenAsleep, not an RWP bit, so "RWP timeout" is misleading=
.
>
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/gic-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 7f365cdbe9df..bb946dc11375 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -828,11 +828,11 @@ static int gicv3_enable_redist(void)
>          }
>          cpu_relax();
>          udelay(1);
> -    } while ( timeout );
> +    } while ( 1 );
>
>      if ( timeout )
>      {
> -        dprintk(XENLOG_ERR, "GICv3: Redist enable RWP timeout\n");
> +        dprintk(XENLOG_ERR, "GICv3: Redist wakeup timeout\n");
>          return 1;
>      }
>
> --
> 2.34.1
>
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

