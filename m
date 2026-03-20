Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ou9FJNjvWlF9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:11:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FE2DC633
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258206.1552359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bV9-0000jH-5U; Fri, 20 Mar 2026 15:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258206.1552359; Fri, 20 Mar 2026 15:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bV9-0000hq-1D; Fri, 20 Mar 2026 15:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1258206;
 Fri, 20 Mar 2026 15:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IyP1=BU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1w3bV7-0000hk-OF
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:11:01 +0000
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 001dbd4d-246f-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 16:10:59 +0100 (CET)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-40ea611d1a4so326718fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 08:10:59 -0700 (PDT)
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
X-Inumbo-ID: 001dbd4d-246f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1774019458; cv=none;
        d=google.com; s=arc-20240605;
        b=hrjL0uk4VUkRC2Wef0bAa+cIKD28zViD5+p5FXvxDkMCCMoP9JtiXVyvORdAOC9XkB
         f0LhRpbY9r0gkG+zMioqHxwSdNHluGLkKnUq8IT3+PEBOBc9S3lkAS82hy7tB/4yE9QN
         lArA1SPkp73P1m+J/uMSup7gVvJoVAPAh72KrCS5vUa9BoFEap1iUPQMDnJeS5gIYTto
         rbCFO374l5wNBhNR1cSjEF2mpuYpUuV+T04KFJPzBAao5uiY8O2Sd8nqN+pWdf+QqOUy
         nuq0L5c4H7XC9hig+WLdcUaywFs2JxCe64kiLtNINgSl6dMfu2nV9IYrFiWD/DByoGnC
         AAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGaoT6ic99GsF4u+JNCzJoc3s5ODFyKGLwhSZj48pv4=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=dzcHcf9bJk1BnWq1hTwDYbObAYgWeDiAEGuRPDcVkwi1jSyRV7JJkegAh5HlkWYDYI
         VzQ3BADRbb8eGMg/+rpD6myMOtxfMU9qdmmtGDAGCdu7dWHE72RcMVpWzYA35+YxafEx
         5Z6LYqHcUzNooLKwFwH4NFziy013GPYkZAN17NfcAS/ONvhxGKddaky3uMsKNjfFCbt7
         UGxqztovXxGiQ/frAUgnRYJwUa5VmfjVgnAjwHoXnzHLtMYQv34xbp3L93Y3nc67iA8B
         Zto2yI9XcGCWv0vn+F90GXjhz5qEiC+Yudt5UqQkSVOpliA39gVYtsm8FHBgdzZGsxyA
         Z2yQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774019458; x=1774624258; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGaoT6ic99GsF4u+JNCzJoc3s5ODFyKGLwhSZj48pv4=;
        b=jE2jelymMD2Y7V0HYnTiy75nSqmCGdODP1QpK47D+Y7nBInbbp2ZeWlgfvcFkr3g6Z
         4l48TPGaHOfvaH/Q9FdMoba3BjQxl44IOvUzJQNla9vWphpkqKNZzKO/gX6LEF7w6vMH
         OcDHA7PSRvnQeHjQMAQWe+RJuNzTDd3+Hpp3ihFxeN5lLNumNk2D3P7tpmbP2KrJi8tQ
         f/ZF/ih3UQMWP8J1VrQmOeTVqIjdFUIF4M17XYTB85OM4foHaENxwQBCyeZ7GPm9uHs5
         JPJlk+w3E9XCHGt3zInE0gh3Rk1Oc8E9QegjbZ7tNnS/e4wJD5GRjkNwEl3UOk/mVskb
         CYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774019458; x=1774624258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGaoT6ic99GsF4u+JNCzJoc3s5ODFyKGLwhSZj48pv4=;
        b=NU45AP1OCFZXINqYDx3q1tXsnjRs5YTYHREm4FM0KTJ17wXXi3+qJkH/PfAHTqbK7u
         OQ8m8uuvdECQx8VSo/T5y8K6ev3ZNX9dBgdHnCZNYh6WOZK2ZGkGZexgMj4fFyU7SC6d
         +k+JvheWRb3rb5b0QPh8jRY/R1uTBsqZ4glqIfcoB1Zuy9i8mipmz3eWlSRckif5eT/b
         2IRv9pkZ7gqxGeJKY3yR4a1Qy+SUsuUqXkOZ4sDdBVGwohNxun9mPRPGOpR4OMp+fttH
         psORlO3pHOE/hBlqT5UEo1cbWP7DecvOLo4NVw9wfRBCY/YgxPYFj6c951ZxPgWviDGN
         VLzA==
X-Gm-Message-State: AOJu0YwPSJagQo8CJL4SYKCjKmvhg1gtQP0jiGRp1tPsVStIZ6rODwyg
	xhfAeE8giCMS0PLHlr2awfRYsXZ8l2dc3MofPca16CYa8ZU70vTDIKmTA/F4WqmrQiqu3iwT+0Q
	KfLmwcRZ2Q4yKh2a/qLrcSFvqoostU0krlGrE3+VAwA==
X-Gm-Gg: ATEYQzzWu2EYzjV/WSxB4z7uh82znE39fpxtlgWvDy8J2jLNsRWt2wjnp4LUFzXvAr6
	SDGm4DfwmzElTPgYDt3A5/WKrxQ8LnqNn5hWXxd8IUzpXktB2jkrox2QU67ggJVYTSmfmJ6SFvS
	iTQXmFhsR+FeSok6XbIEK4s4XSvI8Br5qcewGAUF7Cj0TqCNTz5qUAUxGHbDpJ1YwFnBCAvLxWg
	b4j9U3rF36Kw5PpiwcGjHa5KoAx7ZUA5pywXTwajZXRvXMpyvUGwHygkMwheWUHfaus2ea/QG/V
	eB4pogGvzoEMLmslDZj9DPu8Scq+XUK4znvsQw==
X-Received: by 2002:a05:6870:63ab:b0:417:6224:5855 with SMTP id
 586e51a60fabf-41c10c6ccaemr2074122fac.0.1774019457988; Fri, 20 Mar 2026
 08:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773911799.git.bertrand.marquis@arm.com> <0050ab559814a619b4ae23dd070e7aa4629865e2.1773911799.git.bertrand.marquis@arm.com>
In-Reply-To: <0050ab559814a619b4ae23dd070e7aa4629865e2.1773911799.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 20 Mar 2026 16:10:45 +0100
X-Gm-Features: AaiRm503kw4TRRLMqY0L2_uIEtBzREIoAAXo_6ZShucMyru2vptPC5CkoIKaCtI
Message-ID: <CAHUa44GHBNfPTn91L_9K=QVMCy3MAaoQWBHGU9rxzrs818-b6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/arm: optee: Add MISRA-compliant switch default labels
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: F26FE2DC633
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Fri, Mar 20, 2026 at 10:07=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> optee.c has several switch statements over integer-valued OP-TEE fields
> without a default label, and two default clauses that only contain
> break. This triggers MISRA C Rule 16.4 findings.
>
> Add explicit default labels to all reported switches and document the
> intentional no-op defaults with rationale comments. The new default
> paths preserve the existing behavior:
> - unsupported parameter attribute types are ignored;
> - non-handled RPC commands require no post-processing in Xen;
> - unknown RPC function IDs are resumed unchanged.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/optee.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Looks good.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

