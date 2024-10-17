Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1659A2DBF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 21:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821267.1235018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1W8J-0000ia-U7; Thu, 17 Oct 2024 19:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821267.1235018; Thu, 17 Oct 2024 19:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1W8J-0000gR-Qa; Thu, 17 Oct 2024 19:26:03 +0000
Received: by outflank-mailman (input) for mailman id 821267;
 Thu, 17 Oct 2024 19:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1W8H-0000gI-GA
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 19:26:01 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3ef6361-8cbd-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 21:26:00 +0200 (CEST)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso150384266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 12:26:00 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68ae637dsm2505766b.75.2024.10.17.12.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 12:25:58 -0700 (PDT)
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
X-Inumbo-ID: a3ef6361-8cbd-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729193159; x=1729797959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SuNZu5aefzSwLtRNqfGvpifiTm71LesuuR4WD6zMOrs=;
        b=Gscz4gI64s0FSqctwxLRV0uKFqa7KJK6Mm6lNi5OHAisn4pDqzhl6Z+L03lB88ZTDU
         8L8HOThLhGOJBtfzWjbqwrETWXgPVqP8vI9/AUtW1d+QCojieQvDP1u7BbcFfAImhW+K
         jcZjcUWWYRkl/qJUcmPpx8XvsH92R+ZJ/w+HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193159; x=1729797959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuNZu5aefzSwLtRNqfGvpifiTm71LesuuR4WD6zMOrs=;
        b=YI6K24BLRGby4TkoZTu2tKgw+NiWf3m+QC5hRTQIoMMH/JF88PYMo2IYOUkSz5FiHV
         YJzUyxMDzyilC5Aab6c6QVkeR8MF2wAsLR90iRmc5NKPxpzKR5G3OFvnesxOJNWR+8e1
         KQxYCAAvEuOoXTo2SW9eWYq8hFbuqxnxL1vsfWOLWjw7st1OanJk63miIWGOqHppRbaR
         U2Ua1Ppbo6GBq4yEHnJhZnTeRxUpQ06XekpnIS2L9pNbPg+hNpz/kPXdaS/+0eqOxOyS
         lYf+PLcTmXvS5XFZ3SLY2ltRmzCvj26rIUzzO0TkS+lOdtdDmbtJjJFbE5dotKp79z0S
         gcVA==
X-Forwarded-Encrypted: i=1; AJvYcCVJU1bibrj+5iDMTu8+gZJd3vXTWdfeu6oriypjHIpvyVZjv6ubMnKkjgmb+nG1+2lWATTKjynjcZ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPzENzcOz2Q4/miaX2LdGYPqBoQbes1X6R14PfI48p8GGZLGdR
	A7af7IbUKkrxVBuANsdD5FaN4jsRYsQ8RQ/pMGdxib16qOHqLoPm/wQmF4WnwwY=
X-Google-Smtp-Source: AGHT+IH6ZiS3072UZTrI+W5l6YPINDutsxTy4mu+exhBWmaiIVUJZkuFk1/+xIM1bTYWEV38Cm3utw==
X-Received: by 2002:a17:906:6a14:b0:a99:c9a4:a4da with SMTP id a640c23a62f3a-a9a34e76bf4mr755322566b.61.1729193159361;
        Thu, 17 Oct 2024 12:25:59 -0700 (PDT)
Message-ID: <40f27418-08b3-4b74-889b-12720be8f9c7@citrix.com>
Date: Thu, 17 Oct 2024 20:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 0/3] automation: add x86_64 test (linux argo)
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <cover.1729183051.git.victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1729183051.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:18 pm, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
>
> Add x86_64 hardware test that creates a Xen Argo communication
> connection between two PVH domains.
>
> To accomplish this, add new build artifacts for Linux and Argo, and
> update the xilinx x86_64 test script.
>
> Victor Lira (3):
>   automation: add linux 6.6.56 artifact
>   automation: add linux argo test artifacts
>   automation: add x86_64 test (linux argo)
>
>  automation/gitlab-ci/build.yaml               | 34 +++++++
>  automation/gitlab-ci/test.yaml                | 10 ++
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 ++++++++++-----
>  .../tests-artifacts/argo/6.6.56.dockerfile    | 95 +++++++++++++++++++
>  .../tests-artifacts/kernel/6.6.56.dockerfile  | 54 +++++++++++
>  5 files changed, 244 insertions(+), 25 deletions(-)
>  create mode 100644 automation/tests-artifacts/argo/6.6.56.dockerfile
>  create mode 100644 automation/tests-artifacts/kernel/6.6.56.dockerfile

I'm afraid that we need to stop doing this test-artefacts like this.

The *-export pattern is nonsense (wasting lots of runner network&disk
and time just to copy data back into Github's artefact store), and the
main reason why we're at ~2T of data total for Xen-project.

We need a project wide expires_in: setting, which will prune all of our
not-most-recent content, and probably make most of that 2T disappear.

But, the test jobs stating what artefacts they want are perfectly
capable of pulling artefacts from somewhere other than an earlier nop
build job, meaning that we could get away with having one artefact
shared by everything, not one artefact copied per user per pipeline into
the artefact store.


I was thinking of experimenting with a separate top-level repo that does
nothing but has a few manual runs to populate artefacts, and having the
Xen tests pull artefacts from here rather than from earlier build jobs.

But, I've not had a chance to play yet, so I don't know for sure if this
is a workable direction.

Alternatively, if anyone has a better idea, I'm all ears.  But, it is
very clear that the *-export pattern is a giant bodge and there are
better ways.


Other notes.  Your dockerfiles use syntax:1 but not heredocs, and
they're also root containers.

Please follow the pattern in
https://lore.kernel.org/xen-devel/178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com/T/#u
or one of plenty other containers I've already converted in the past few
months.

Please do not add a new build job just to get a new minor variation of
Xen.  Just enable ARGO in general Xen build.

Although, given that you are now putting in testing from an unsupported
feature, we really need to bump the suggestion to move it to at least
Tech Preview.  (CC Dan/Chris).

~Andrew

