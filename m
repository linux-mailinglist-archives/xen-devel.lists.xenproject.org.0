Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2053630F2D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 15:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446116.701615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owOyY-0000Cu-PF; Sat, 19 Nov 2022 14:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446116.701615; Sat, 19 Nov 2022 14:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owOyY-0000Ae-Ma; Sat, 19 Nov 2022 14:37:46 +0000
Received: by outflank-mailman (input) for mailman id 446116;
 Sat, 19 Nov 2022 14:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFTg=3T=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1owOyX-0000AR-Hy
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 14:37:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9fc3911-6817-11ed-8fd2-01056ac49cbb;
 Sat, 19 Nov 2022 15:37:43 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id me22so2865998ejb.8
 for <xen-devel@lists.xenproject.org>; Sat, 19 Nov 2022 06:37:43 -0800 (PST)
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
X-Inumbo-ID: b9fc3911-6817-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6KGEGZSA6ReBRUx4XvCy0uvdFeo4yZkejk6eMcKN1Zc=;
        b=n5AeAWUDkzI5JnNvTgTqQzYYZxtNqKLSf57P21/AGvMv2TJoAEB9gvksffv6+4HBEm
         /ourTFBAkiN2d4iA15tQmj5gxYwkdWM0MvVGKQ+ApGNzgkRwXQNTSaeIS2rpLlN96c9C
         YqL8+u1HTLR/L4IQxoSjMBALfBdHNS+jxrzu5hUO0TWJZbqi2ce2c07YqxI3Z7U1zsIZ
         2oK+g1Y+HzvhxhLjeunKgtoVC53T2lEAEq1ZtOFj3zk6XoB+7uzw0XhcvLNW3XcbGPJl
         SQpC+TjaYSQmIzJSJmo0wxANzCv/q4zge6zzFZWUHMLKWa7JwcVQuX/94j2V0BPV51kz
         alhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KGEGZSA6ReBRUx4XvCy0uvdFeo4yZkejk6eMcKN1Zc=;
        b=U92FBLQO+pAje0sxDk4JhSKNlxbVDk56O7OnCbVIy0YPWNLidAOc3dW5P5Ey75aPlx
         ZsFR9I58x4W0KzWIlef2uGfIn8ZUfikme5m1Bp7ANMnSFcmUnirMHfjkWiuLoMOnkaTv
         cvZdEZAmmKZ+qiL7o5cdz24Q4AhmLwdt5yEHmSB1xJA1TPxkkibu+e0i2hAmKsf1o2ZR
         bBRAseKMMd2uefpNebQ6329pbaGQnJQAfYEs41x08/Xf2XarkMqgFgiI5WcUYemxudwj
         oiFvGIsfaoRyfmxpdq7FRvWHi2NA0NW6nTXbFDikXwTmTPm0aAmTlqLqqXncdFmnUo9p
         eLpQ==
X-Gm-Message-State: ANoB5pk+q4STraMGrAvjS8sM1rhKDErm4BD+8XhphhFqCYEamqL+G4Xc
	aTooID/+AHMHUkxhqn634Js5288RFIx5nPPB9zNvLqju
X-Google-Smtp-Source: AA0mqf7TxqX+TzgrXztmKTiv13J23lOB6/sRm2UmwgxB6XzLNn8Scm5JOuCHAecHPaoj/u6N9w+Tlq+M4ok/in6uDVk=
X-Received: by 2002:a17:906:b892:b0:788:3a75:dc5 with SMTP id
 hb18-20020a170906b89200b007883a750dc5mr632491ejb.537.1668868663032; Sat, 19
 Nov 2022 06:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20221118165235.14143-1-anthony.perard@citrix.com>
In-Reply-To: <20221118165235.14143-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 19 Nov 2022 09:37:31 -0500
Message-ID: <CAKf6xpv_usNk-nQyvOHZCRGd8fK44mLbb3=05U8wwmqoHLhWyw@mail.gmail.com>
Subject: Re: [XEN PATCH for-4.17] libs/light: Propagate libxl__arch_domain_create()
 return code
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 11:53 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Commit 34990446ca91 started to overwrite the `rc` value from
> libxl__arch_domain_create(), thus error aren't propagated anymore.
>
> Check `rc` value before doing the next thing.
>
> Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Was the issue that libxl__arch_domain_create() failed, but then
libxl__cpuid_legacy() succeeded.  rc was overwritten, so
libxl__build_pre() returns success?

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

