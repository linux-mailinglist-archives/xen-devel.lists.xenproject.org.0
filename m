Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqsjKO7fIWpTQAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 22:28:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CA64355A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 22:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="K4/USIfq";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328502.1592941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVEfX-0004Ta-0X; Thu, 04 Jun 2026 20:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328502.1592941; Thu, 04 Jun 2026 20:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVEfW-0004RG-UB; Thu, 04 Jun 2026 20:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1328502;
 Thu, 04 Jun 2026 20:27:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <christopher.w.clark@gmail.com>) id 1wVEfW-0004RA-2b
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:27:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVEfV-007Zt8-1w
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 22:27:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a21dfb5-bab6-0a2a0a5309dd-0a2a450bd076-20
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:27:57 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <christopher.w.clark@gmail.com>)
 id 6a21dfcc-212f-0a2a450b0019-d155a731d0cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:27:56 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5aa68e66128so1195078e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:27:56 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780604876; cv=none;
        d=google.com; s=arc-20240605;
        b=JvfH9wRxp0SDfyUmqdv+KZZkN4wtEmFLWA/8vob1ICBXoaZXNhImSWSKwKPEQXGsjH
         yhGBpW32sOr4EVurMthIOoSx6wRmmj/0IMcahdEiP1PqrFxdAydCh3cHo/TfhQimC/Ry
         jPay8OGpA5bA+FZyfqTlSiggJpyRmKqgjL5IBbbzvyG5FY+h0GrR+AC9CZ+m+zIsZ1YK
         jaaBOA1jD+lAYI3qrDkNvPyqTV/tNSEEzBhnlzMcqlO4qgdiwRF8ISH42VrZngSeqi5B
         Le/zpJb7td0uUB+xneUMPN9oyKX/1NXldC9dqDX7NnFnb/uWeULQ+CxsSHFvtgwqDYf8
         WMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ru4/tFbPykkdYophb2IbPvYCEm08M5TfxMYpDRLFU38=;
        fh=tUKWqsqmNtSv8OyLozKgacW1gCbGytWM1DFVOq5CTIY=;
        b=enxleIZTd0CYoYJKjXs6bXkeH1NJf8NHkLsev7IdNR9IjY6JT0Ww7Cyobhojq/ekKG
         OSZk+AusfatGaCkHmwlR8lTXrlmk74beIiI3ivVOmxIMBLxkvAvM1QmTLivIrO0QuV+7
         hrIM1aEhoLxQSXJvzYId3sCxUxdl60apNJyGXer803aPf6jil6OUtGNYb8xqWV9nhrcW
         hrJGGXWdW0nO1nXggt3gkr8Nb69dDXAKIyWTjtjLfB1zvdmXO7VI3FV5Y1CfFx+JLV+D
         6tjeRpmjqIKxz9VEM8I7eo8bqfJL9L2kzxb4xtXEMgkZunPVb3VftYms6QGpQpkLAj8R
         rAJA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604876; x=1781209676; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ru4/tFbPykkdYophb2IbPvYCEm08M5TfxMYpDRLFU38=;
        b=K4/USIfqBDBIPognR82E917yZJXjIVhokwQONmKeeBEWLAzxTEDD+bsZEjr26Vs9Vl
         hBMiUnpEUXGbZjawE/uF9SXF8lTH5RiIRRbSLNO9we+xcmQ0Mcd60aPUj4vLs6kE91aT
         iwIh1VHj7wLK0N1HccXuagazYYxr1grVgAs2g+KXgYdGKCaY+gydOWyszKgzxKZeDpog
         q7kXzXzIdzJJCxPW2KbihZMrtuvRj1pEoUwugUpe0HCpCv+MSwPSMhf/gVYHprJ6QA1x
         wV2sNjMIoZwqSRYycQ5b/ZjFtcEkjm6mh2fP87OQ2lNGwmiDjooGiTb86l6TrmfGiyR9
         ciZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604876; x=1781209676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru4/tFbPykkdYophb2IbPvYCEm08M5TfxMYpDRLFU38=;
        b=YpNpKJ5HV4Qt4hjsKKHNrrNNmcO+KeRTCkCLikA6l4MGALH8OPhf1D9C5NV/K6xcbZ
         c3wiEK45QfikAVcMu1kfGaqBQSJ2O2k0SW7zNqRG//90pNtGI/SelvA+Kf347AYzTssN
         ZiEaxE4XywlWsKryHR7skGnUJjF6kI65kWPt02H0Q0J+V2cDW4Iph6wR97Vz2FNsEKm+
         1htMNwW91iR69l+YI5j+7OuslxcUvvfQ7ASqSnziGNgKEVI6QPVQVsJT1giugCM5pGr2
         ePwTQR7wN2mMssDPYWTnkgS+oOlHkioTclREONhqlqpCJsfiaarPHJFjdOHByPG6MGGU
         SnSg==
X-Gm-Message-State: AOJu0Yy4mQFYpU258bLNcMs6j1G28YXsYvUoKr+Wa1NWUe1e204mm5S7
	BBfv2H5m6NxywFv+ji4I/BuQIOt0jT38h2slspWYP4H61VY9hYmrh8jSQ+/xbjjXqMPamANMCoz
	f30LwQVT6Dg5uhVjrvSRFo1rzCszuJPo=
X-Gm-Gg: Acq92OHKwO56g2Avi9rf8ReFSyAEeCMXd2lO0Y8HaPloRBx9Dhpgr3LddEz3itiBXPR
	KVIdOXh0RYOXbHnt2sWiccPrm58EtU55qukeSiuZwEmO3r4a0qMTegEcnPVejfClqz9lCfZFCt5
	PiUWcfza690n71zejoyeTs9TjWqo0LT/qmb9ZJfpgPbk9Mz4zT6Ln+CvrG0a6Pjljy+DEgzZB3u
	KZnqmt/uT1G8mjPCKj9eimaLjajduaXlHAFoqc1LWPEvBVE0u82PTSQqYH7QKaaGu+YP9HTDcOO
	NsvJzlpptqvncFumnbf53/imU5kg9RYfl6Sq6XFArCDkvBKqtVlGuMsaR3X8XaP2kGh8Eeu7ZQ9
	B1Q==
X-Received: by 2002:a05:6512:3092:b0:5aa:6a5c:be4d with SMTP id
 2adb3069b0e04-5aa87b8a392mr139592e87.9.1780604875960; Thu, 04 Jun 2026
 13:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260604184413.788910-1-jason.andryuk@amd.com>
In-Reply-To: <20260604184413.788910-1-jason.andryuk@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 4 Jun 2026 21:27:44 +0100
X-Gm-Features: AVVi8CeL-sm57SCBfaARXQs6s0IPylS-ML79iSfUl7Iddn_LitcSelm0nJ4DZzQ
Message-ID: <CACMJ4Gbi315aQZ0qE8+f3JJXyaRvva2vxmiH5-iXtiPKk+039w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as an Argo reviewer
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1780604876-18762F3B-76344C76/0/0
X-purgate-type: clean
X-purgate-size: 802
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,apertussolutions.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[christopherwclark@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 015CA64355A

On Thu, Jun 4, 2026 at 7:44=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.com=
> wrote:
>
> I'd like to help with reviews of Argo.

Thanks, Jason, appreciated.

>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77f72e52f4..b3c33317d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -242,6 +242,7 @@ F:  xen/arch/x86/include/asm/hvm/svm/
>
>  ARGO
>  M:     Christopher Clark <christopher.w.clark@gmail.com>
> +R:     Jason Andryuk <jason.andryuk@amd.com>
>  R:     Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:     Maintained
>  F:     xen/include/public/argo.h
> --
> 2.54.0
>

