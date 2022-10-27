Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4460F321
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430956.683301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onymr-0006Bp-CT; Thu, 27 Oct 2022 09:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430956.683301; Thu, 27 Oct 2022 09:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onymr-00068w-8k; Thu, 27 Oct 2022 09:02:53 +0000
Received: by outflank-mailman (input) for mailman id 430956;
 Thu, 27 Oct 2022 09:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onymp-00063g-L1
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:02:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2273c41b-55d6-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 11:02:51 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id z14so1044702wrn.7
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 02:02:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b003c6f3e5ba42sm4398779wmo.46.2022.10.27.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:02:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 35F5B1FFB7;
 Thu, 27 Oct 2022 10:02:49 +0100 (BST)
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
X-Inumbo-ID: 2273c41b-55d6-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM2J/iqTtZ3YgqXFapPxeERaDYDYuEVYIvE6ZdrIy9I=;
        b=P4fzATqIK/XTtT0SwdCeHEj68hQhUg6RdI7HtcK6qMvs3dSGlkaBr6LEX77yl6EI/r
         XO/5KunxRBzjWMkWmdkKf/WwNI9tZ9W/b7Z3/aWOyfSzbfiM6CX3ug05Z3nXrothXzM2
         RuIwj0wqxdAp6EHFTKqMF2xJdTaRwuigrZkWuCoZIUPME+kCc8BigF7wsGdnQMQIxzir
         SzEFto+/8kk/zLkHHpEGIB955GgC4FddAqh68uYAk1Q3kKBwcT8QZuRk27twW0L7641T
         JsvpV4MZe6GwYGPDf2nnP0ZVoYxe6ggIEjZg4C4dL/uiDk744UjhCKNaUkX7zh0I92UE
         uG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gM2J/iqTtZ3YgqXFapPxeERaDYDYuEVYIvE6ZdrIy9I=;
        b=cq2mQ+XUjiLRjZIhCKMMQJN8dYtED8u4Q890rRUAXe8BwkzoizdzDXEK83eOTvUmdl
         2AkfaQdUcNfCbrEw7E1GZr8Qrbe1IGKKTE0E2oPu7vwEwCroUIvKzSm6YvbeS9d1h34z
         g0twzbEV+AvRFEEGivUVfeXB3GjKp2L7aTq2t44VRwX3fP9YNwC1n1o3OjX7jd8pLqPx
         I3XDvDw9pDHCbZXBMGEwgFZbLXhrgRL+x4oMzRm8D+oPf0U07YL90WgqZ2O6KYKKjTie
         L7oo6+wat+JbJTweKkh+AIlkXOO8PZEr6nXYJFhGbml/eJANEJCCd/GsRix3XP+Ne4Mu
         sxqg==
X-Gm-Message-State: ACrzQf27/V4nNgL4vIry2Kt1gN2ahagbTbB1tGYI2llDApEJax1D5+vI
	fX5DgWrvVqt0AhAze7IzzMuZKA==
X-Google-Smtp-Source: AMsMyM7NiReiU4Tji7TAd7yKY3oQyuqn7T2/B8HNKEp77ib6k8oevwdOdjLwtI1IR331sr0dKLUHQQ==
X-Received: by 2002:a5d:58d7:0:b0:236:6c53:6123 with SMTP id o23-20020a5d58d7000000b002366c536123mr15253547wrf.719.1666861370324;
        Thu, 27 Oct 2022 02:02:50 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-6-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
  Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
  Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 05/12] hw/i386/xen/xen-hvm: create arch_handle_ioreq
 and arch_xen_set_memory
Date: Thu, 27 Oct 2022 10:02:04 +0100
In-reply-to: <20221015050750.4185-6-vikram.garhwal@amd.com>
Message-ID: <8735b93ah2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>
> Also move handle_vmport_ioreq to arch_handle_ioreq.
>
> NOTE: This patch breaks the build. Next patch fixes the build issue.
> Reason behind creating this patch is because there is lot of new code add=
ition
> and pure code movement done for enabling Xen on ARM. Keeping the this pat=
ch
> separate is done to make it easier to review.

But you do intend to squash the patches for the final version? We don't
want to intentionally break bisection.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

