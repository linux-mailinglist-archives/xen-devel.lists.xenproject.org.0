Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFioFPIWj2mbIQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 13:20:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DD135FF6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 13:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230812.1536224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqs8U-0002WW-IQ; Fri, 13 Feb 2026 12:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230812.1536224; Fri, 13 Feb 2026 12:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqs8U-0002V0-Fe; Fri, 13 Feb 2026 12:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1230812;
 Fri, 13 Feb 2026 12:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hMq=AR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vqs8T-0002To-DU
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 12:19:01 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad6fd11-08d6-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 13:18:56 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-59de66fda55so936066e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 04:18:55 -0800 (PST)
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
X-Inumbo-ID: 2ad6fd11-08d6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770985135; cv=none;
        d=google.com; s=arc-20240605;
        b=fPGYO7rboRupc8ExDxL/61hJGvdwGslUrTBUyjtqdbn+50LItbMEwZSSvC4mLKo6nX
         CRZh5y2zthpCoHEbWe5oRthW0rZVDbZz2jqGcCzKD4f/3x7uUgENeA7Vf0FvBVz+G60S
         PTqWWVsr6ItU3pbfA1Xtr6agTtOW6en1/S6zb8n/GMEHaYadXqg2NXzaBKhDbvApfnCL
         xeBGMZASNdZA/EZq6KxF4SH2lIt9kV1gAneVTh3ELkpowXHfFXjapH/VnoIZA/meSNV2
         DMa9TVTr8ldv0WBUdSs247Jh1NWNlEVtkMtbajE/AThJHX+41+lkikIcoEC0/r0uafFD
         4RNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYAgGUGffvuHYd1ZunqHIlOmyUxXC7/dJt6Is9t6NNQ=;
        fh=jCddITIRBmVhai5fsel8Hn/4t4/GveTnXQ0OfLrOUBw=;
        b=QWu2vqQ+1xTO+83EeDDoOfZdJ3eqwCW8dptnmqVdNolMc+Rqxpb8oJY11xnXIhvPY8
         ODYu9UgsDPl9gbLNOKqt6mr+AcSg2nEQBMQGcwch3KgATn/EiTQ3R3iO7ESUTstIBL3p
         dYI2kSeRJp3upCXFGc0pUeimwit4EfSdX6fF2nMq4su6axYsl1LUMNdNJ+tLSGvEOQyp
         3Btlx9Uqm2Hw9XwFVeuNONsS0lLMuVza9YVv460YhcNhKzM6KI9RCPllVaYpWXWSjzjf
         og3qGGU7KfFjy9q1Kzza73R8TUsgLqVTWTfy98oUq5CE2c2u2E+m1zc1ogW8Bbced+dP
         uacw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770985135; x=1771589935; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYAgGUGffvuHYd1ZunqHIlOmyUxXC7/dJt6Is9t6NNQ=;
        b=TaUUM/QXfryHbBwQ+WONrI+4BLN2R37+o2wWYgI+iWQPCgPJeiB/ipXvSwCZdI60+A
         Ezg2yC1kwFVUSFerqsfRvuhypZsCr+up1wrJ39V5yksS3v+2nJcA74KXx9rw94qRDghm
         TDKgklxpoh5Z/roF8V1tNODx3tkgKm23WOrok3Bv+fO1DeaH4nUY/lDw9O8D7DbezU34
         WZVOalka0cZNlD0wXliNOljhQLcuya1GlNJvlKzGauAOh8gIQS4k7pERFHLO+B1RJk7m
         UhCPIWtz8jnc1L5eEmFVzgp+TegZlBJo+OErJUSVTkpnIm0SexINEIvN5ILQCgMDI6wn
         /tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770985135; x=1771589935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYAgGUGffvuHYd1ZunqHIlOmyUxXC7/dJt6Is9t6NNQ=;
        b=Hx1IWV3kTdDWMkT8Jzux+AwXLnjlaEsZbXijmeZSfR6AAyw0huRyMJefOaOsGPBFjX
         We+Hxoj9FmzpR8yuIyz1P5RgZ4A0+G7o/mFiDoaiL2AbgzuD55cjvAPUKeCFSDdSLFoB
         pnNYfyowMYQm/f/jLHBs7DiS986lQ+OaTojjHWIYwj5CkvbOgG3giWNNIlnthTSdR3SK
         VSJzN6eqRaJ4JfP7sVmLbk0M8wpLv+34QGEKG2xo3QV7oghYib7Lye25hOFQe420KQTy
         5WM4qXZbxwjfFBSC3U7B6KzvT4iuevroggnzxZQFwwlJLsWscyfFe3RzEOqKd7V++lID
         GBpw==
X-Forwarded-Encrypted: i=1; AJvYcCXsLKf/j18cdnr8fq8/xT6oXBRNHs5FVYne8R1V36HZJ9H1mOum8zcHQbgHLCBNXsGI1Hl8Vievc7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3V4W8M6ebBVwBuWBm/TVKIfaCgEK+MPkd4yGVCgxfDK8HxEud
	Vm44zSA5DsfeCFgOniLeJkUsCTKPlRCSEkFNKl6Zkd5Dw65fgHoek/fLrqdQHqSonV1ikan1jyd
	MzbrdreeWo0RcOv/3cgNJWVReZbcGCnY=
X-Gm-Gg: AZuq6aI+TWEAJbPSqZVY1xXqrG6XZOpZ/lS0NJHLwrMEEhnyc1SoK66N40GFj/gMDG8
	X8icHb0P+5L33OUj39sfQgJxLk1l7H3rlGtalZcuUObubBcJEOx/8vXdiqwS4nWt2R+fX0BGI0I
	JNZL/A7AgQStsqQ1kX92IhXfBJG2qKqsHj8m+SjyygqKx4yFCCNaIfmTYXGYIFyZwsZR6hvclPo
	Ao9bwz+NRrYFvMbMuc37CzH5QtCm9aNWXtBw0dMPJll8ljmZZV814RDAgoFLkd8v4CMCKCSszWv
	yEhlWg==
X-Received: by 2002:a05:6512:63d0:10b0:59f:6a34:59d2 with SMTP id
 2adb3069b0e04-59f6a345a19mr338253e87.19.1770985135227; Fri, 13 Feb 2026
 04:18:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
 <CAGeoDV_bN812-qKJwTxNpJ6Ewz1jcBM8nLYc9D+OjqbuAAkEHg@mail.gmail.com> <c339b2a9-5d22-457c-8b32-a0b01eee3cec@xen.org>
In-Reply-To: <c339b2a9-5d22-457c-8b32-a0b01eee3cec@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 13 Feb 2026 14:18:44 +0200
X-Gm-Features: AZwV_QhFgaV1Vllm3LAQkQqZw_uooMIMQ1HLC_MN1d6MeY-Ttxk84d4MGUhSiDg
Message-ID: <CAGeoDV9OTA_6fOUOqdHG2naGRdaagPhRFr75v_mCnxE7-7kLGA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF7DD135FF6
X-Rspamd-Action: no action

Hi Julien,

On Fri, Feb 13, 2026 at 1:48=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 13/02/2026 11:36, Mykola Kvach wrote:
> > For this reason it may be worth conditionally recommending (or even
> > auto-selecting) `vwfi=3Dnative` when direct injection is enabled for a
> > vCPU, so measurements reflect the actual delivery fast-path rather than
> > exit/scheduling overhead.
>
> I don't think this is a straightforward answer. "vwfi=3Dnative" is
> beneficial when you have a single vCPU scheduled per pCPU. But if you
> have multiple vCPUs running, then you may impair the overall performance
> of the system as the scheduler will not be able to run another vCPU even
> if the current vCPU is doing nothing (it is waiting for an interrupt).
>
> As a data point, Xen didn't initially trapped WFI/WFE. But we noticed a
> lot of slow down during boot if all the vCPUs for a guest were running
> on the same pCPU. The difference was quite noticeable.
>
> So instead of recommending to always set "vwfi=3Dnative", I would conside=
r
> an approach where Xen decides whether WFI/WFE is trapped based on the
> number of vCPUs that can be scheduled on a given pCPU. This could be
> adjusted on demand.

Thanks for the clarification. I agree: recommending vwfi=3Dnative
unconditionally is not correct.

What I meant was specifically for benchmarking direct injection in a
1:1 vCPU:pCPU setup (or with vCPUs pinned), where trapping WFI/WFE adds
extra exits and can hide the fast-path benefit.

For general setups with oversubscription, vwfi=3Dtrap is the right
default, because it lets Xen schedule another runnable vCPU instead of
leaving a pCPU effectively idle while the guest sits in WFI.

I like your suggestion: make WFI/WFE trapping adaptive based on whether
the current pCPU has other runnable vCPUs.


Best regards,
Mykola

