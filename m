Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JqXAsJivWlh9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:07:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18E2DC53F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258165.1552341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bRo-0006Yt-By; Fri, 20 Mar 2026 15:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258165.1552341; Fri, 20 Mar 2026 15:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bRo-0006Wp-8C; Fri, 20 Mar 2026 15:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1258165;
 Fri, 20 Mar 2026 15:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyP1=BU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1w3bMz-0001Ve-M2
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:02:37 +0000
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d47e7b0d-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:02:36 +0100 (CET)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-4094b31a037so1482211fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 08:02:36 -0700 (PDT)
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
X-Inumbo-ID: d47e7b0d-246d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1774018955; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyyhOrXVXff4riATGoZMjnlTiENcMPt21IwX9FKv2R+CpEGCmiaIXPfWA2IDK8iwLC
         W1B6VXgi1n/QYPMyk4IT769tCheNhaqSwCaAI3b/NOeXU8gk4cFhQCKFu7bgr0ssd/Xh
         Bw6vh8PltTm5GOrDObOfua+ul3GVZmyBX8FnuTfRxjMoWPnVT2yfBer2A0Wdfz5G/6Y6
         xHL0m3FiiStOpx3uBJTflQTd8DeV14JRdgGoJVG8+VbTxvu2W1upE2CCBIX/uz+NP2c+
         a/eQqVmKvA+MnbSDAuaKAyug+6P74I1hUGd0i/h2+elzZA5SHmdaDuW8vkks2i1R07H9
         IsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UaDWyjtfSyl77XXz0U7ShmHX+gyfVpxi6SPVf+gsF0=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=lr5E+h6WDTXGZHwEYaBgxwLMoUCnNsVHoET1my2txLkIDv+5j2re7jtp2Q4mnl8RJH
         NixlzOya6ISgF+AKKMvjCxKAZA3vINmoPmMeoayK43VuPCoYXa+pvRrz0p62BC2wfjsw
         6usMtfPzkUBQCCVqDd86pmyurbCLHpNviUrAeWeaQYF3DkOhlHxoYSSdQX1wip2hJvAY
         sRN8jjQIyoegDjstIHEvS2JTLrxbHNTVrd7TejROef8j993+9/qWeEH53IGuW3e5Pq5f
         1e0PVR52LZ9XqVbF7fe+Wmxkttk5Yd7xPxJLGNcZA/4aPYSpuQPZRJx5kaHGRNY/7jeh
         yR+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774018955; x=1774623755; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UaDWyjtfSyl77XXz0U7ShmHX+gyfVpxi6SPVf+gsF0=;
        b=Mq5cgfZaXafcUH3PKwUs+q2MFgJS2FN/YW01dqTFL7TjZcKOanajWB3VA2APnFnoP9
         Y1xlajCwpbietzHoPhBf9Ty8wfbd7IFdhKlJ+3m6t8ejt4YnJMyLJ4wVrCHDmY/WVJn7
         rP8L0e6LHjKTG0HxSY27z90T/YO/tFARbna9Eozne/ArQP4RvIU3OtUzZpgVwKHFsmX5
         Re9/AKru/ecCbsLlvFpzob35DZdIzmbY2GpMdQ6hnkSxq4LoasLDkIiEgySOjXCOtHJF
         NWpaZbkxjb3j9aE+zJERn9W420WUWTlhUnsG85GtzcV6909LM3VUJhyVV4Wz9pwJiUda
         am9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018955; x=1774623755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UaDWyjtfSyl77XXz0U7ShmHX+gyfVpxi6SPVf+gsF0=;
        b=DdF+i4L+glf3NIXYh4BsNhlafE9Vfnvn5cPwn56FjlEsrYLHD1JmTCmahlHZrUluSd
         TUGWWy52t4HFA/BM/CFdu/vRW4bAQARqVpcdR5qjQ7KrlGlzo9Bv9nBz6orSI+FEtlE+
         kdnWWqbiXk42TLwXmIYPWzYweUiJtCSOat0eBCu8TT5gPAhxfmjuUtZW8Zh1guRYAk2y
         Pi2UO8h/4GqIbGpjw1Tel2/olj7QjaJ13tImL2PwpGZvehvz72TD4kTAdgiLeHmMbcCs
         1j+ZMVdl00JNiVcORX20IRB9PtP8zxvOb4idLPIis5Pjjxw7O7Y4uw+YhXjJnnTtffxv
         s5GQ==
X-Gm-Message-State: AOJu0YxbPVUcAFVy9dUX6RIv1qkNrDSkv3TeF+YshNwrPkpM8tNIYJte
	ET7IOvFegNah64Wwf5784FsRwwW2zspFVijmz6HE+lNI2MGGZa9sZV1P05AhDU+9lReZ0jqav8v
	YUlKOPseRdM61au8X029ZK9gCWxV+eC2pZR1CdBOT3Fsr77D4q5pZ7eLG5A==
X-Gm-Gg: ATEYQzxPmjYLqhZgtKj289r1XEUopA7KR5b8Tro37JKJzAoD7DvsuWTVyWYXQ4t/ym2
	EMbLwI6Cl8WjPyM+GouScpCAkrD1MtE/9lvx+5s/PF73XwIyn4KpUSBuIkaqcU7Q5f8GzkBR1JW
	aYSdu2ubexO5p6j/a/TROR9hPusKwbbzlQq8TLDiYW1n10xIe71AuGK0uIYF1zy9obvUCTicgra
	wKZvpw/McBr3In4tv8iAoDpoJi8N5wZHdXvAahrJ71shV71kH2QG342a5jPVhcdH52d/gcMpk4O
	HrtmPpU5EZ3/Jh1rUTvpjrs+O+A16srabqUICQ==
X-Received: by 2002:a05:6871:529a:b0:416:543c:9180 with SMTP id
 586e51a60fabf-41c1146aca3mr1918897fac.50.1774018954782; Fri, 20 Mar 2026
 08:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773911799.git.bertrand.marquis@arm.com> <030d24e1776af7c2391c588bc696592a64a92c51.1773911799.git.bertrand.marquis@arm.com>
In-Reply-To: <030d24e1776af7c2391c588bc696592a64a92c51.1773911799.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 20 Mar 2026 16:02:23 +0100
X-Gm-Features: AaiRm53ARa9Luu99yDzrIbj2IoLI11hjxXaZ0urSQ1XVJmbKlTftr6CwucdTTAo
Message-ID: <CAHUa44Geu4ch=xo21w_bOJLM6GLVUn_xU6BiKhks=MLxyWoP2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/arm: ffa: Fix local ffa_vm_count shadowing
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:dkim,linaro.org:email];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF18E2DC53F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 10:07=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> ffa_handle_partition_info_get() declares a local variable named
> ffa_vm_count, which hides the global atomic ffa_vm_count declared in
> ffa_private.h.
>
> This triggered the ECLAIR Rule 5.3 finding "non-compliant local variable
> `ffa_vm_count'".
>
> Rename the local counters to vm_count and sp_count and update their
> uses.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

