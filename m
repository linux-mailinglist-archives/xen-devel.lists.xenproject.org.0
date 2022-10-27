Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838F60F311
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430947.683278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyjx-00046s-Hc; Thu, 27 Oct 2022 08:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430947.683278; Thu, 27 Oct 2022 08:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyjx-00044I-En; Thu, 27 Oct 2022 08:59:53 +0000
Received: by outflank-mailman (input) for mailman id 430947;
 Thu, 27 Oct 2022 08:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onyjv-00040u-VX
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:59:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7506f95-55d5-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 10:59:51 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id bp11so1025477wrb.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 01:59:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bk13-20020a0560001d8d00b0023677693532sm677875wrb.14.2022.10.27.01.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:59:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADB0A1FFB7;
 Thu, 27 Oct 2022 09:59:49 +0100 (BST)
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
X-Inumbo-ID: b7506f95-55d5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWc8ZuMg1/+4qY7rzQF6w0oVRg1s+VU5bhsmROUresc=;
        b=m8SHq17GnllkBzLDUI0cKBCBnxw6KxFC9Ew/VVss/SVAL1xT33ju7XxARfhhxBJTP/
         Bi+Ad/ZO6vO+eHqqf0djGURQU0mtyMkaYXFC56Xuiy16rGesbE7R+XDyaQM7d1RQVXYs
         GDqIhZ6Bh5Q2408HR+ubCUseqtvDu2bryVc56pA24T7mUC+inICP08T3r+wxsG/Sqqn1
         eA2csEKTBvORv0wj6/oMtzHHai7ge39PjK5LDCsJaLLm7tGMyR3PY0tQ767IjZqwLP7p
         hHeScuyZBFRvQuZiyugO/0KVayETNq6lUpc97R01mVOV6PBDxR0ggTPtegu1QkpsVgMM
         mUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cWc8ZuMg1/+4qY7rzQF6w0oVRg1s+VU5bhsmROUresc=;
        b=irgjFOalnGQB/nnSFvjjNQWB4KSdcdwcSgK/C1L1DJIuCYx++NHJv56s1Df7JDJmrb
         NWGKGcm8y2yZHNisjSTlgGTTjiWHQXMMk6MxUdL6UAoGO+iRk453JK1Vy4sV+nGs0zHN
         dL7PeM7aMRr9Ldvkycp3inYNDV1pLU8MimiITk072l4epmrEYEzcgKvJ8+ZBSNgovwDI
         Xl8p8ydyryeLO+0pb90EZy+tiy0R5x44zITmWaNmYSPo9Dtu5LkMbXf49yAKEBoUy1Sm
         tvjZEIoJCFCraYxIT0eBiSOe+4ZtC22LV8f7hXlsEYK2NOZFjRjlmJGme/exJ+mErijg
         6PjQ==
X-Gm-Message-State: ACrzQf2nYB51bTBcKxMdufY62jRT68n2tzH8EeN6XcE6soFykJrvCjC2
	N9M1ZKTVLLzaUBleUVcxkT9rgg==
X-Google-Smtp-Source: AMsMyM7E352cvnvKVOaC8nFGoKrvYv8reHvdCXxgeuwBf1GvlE6shsatQzuA8/P+egWBRVhCR6tHpA==
X-Received: by 2002:a05:6000:18c7:b0:22e:5503:9c46 with SMTP id w7-20020a05600018c700b0022e55039c46mr29775755wrq.668.1666861190719;
        Thu, 27 Oct 2022 01:59:50 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-5-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
  Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
  Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
Date: Thu, 27 Oct 2022 09:59:44 +0100
In-reply-to: <20221015050750.4185-5-vikram.garhwal@amd.com>
Message-ID: <877d0l3am2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> In preparation to moving most of xen-hvm code to an arch-neutral location=
, move:
> - shared_vmport_page
> - log_for_dirtybit
> - dirty_bitmap
> - suspend
> - wakeup
>
> out of XenIOState struct as these are only used on x86, especially the on=
es
> related to dirty logging.
> Updated XenIOState can be used for both aarch64 and x86.
>
> Also, remove free_phys_offset as it was unused.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

