Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010EE88152E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696025.1086533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyQt-0006Uz-IY; Wed, 20 Mar 2024 16:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696025.1086533; Wed, 20 Mar 2024 16:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyQt-0006Sf-FZ; Wed, 20 Mar 2024 16:04:51 +0000
Received: by outflank-mailman (input) for mailman id 696025;
 Wed, 20 Mar 2024 16:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmyQr-0006OX-GM
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:04:49 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f66c93-e6d3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 17:04:48 +0100 (CET)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2220a3b3871so17681fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:04:48 -0700 (PDT)
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
X-Inumbo-ID: 92f66c93-e6d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710950687; x=1711555487; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/pF0IWf32BHYD2uOrVEQw5CEwumJcetdL7Wb7AMkBs=;
        b=RoYV9TftstrSu+ar48406rN1rCn8ZRrViOaI2sGnESL8Lvvvkz9959Cpl0OPH5lpEf
         oJq7xWwj/8eOk05cFokatUc3bf/OSlRs3dM/fmxc14w9VvcToX1x4dlDe5uK4g3QhXFC
         ASuoWvFI8t81RkpgmIc+/WPr8RHsM9toVxYSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950687; x=1711555487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/pF0IWf32BHYD2uOrVEQw5CEwumJcetdL7Wb7AMkBs=;
        b=W2/GVkt+Ewx7FnhS4/WPTd7qc4dv1fqXPdzU68bVCVaiRA+9Ysl7gZsYQEKO1i4/VQ
         dhmu0LivZx8nxSKvyhfL2OJd2tXSWgO75cHkT0Nt3ZmVB8XmQGHeHwyScjsdxBNY7fXP
         /iTRlgWAA3vdrTTFkU5HCrEjMEqHdV4m/bsdks2aGvYqcihqRXDsDkmrXrmgRjfKBDfZ
         mGLqsf4bf19EpHc8+qkSv9Lvb2g65cfMVlym83nDJEiEKF3Teiz6JXjEsG1mDsM4s841
         2eW+u5zzWHREc7/nDx9nbkR7wi+k6bVGxdzMCJ5pW6X1eOuzf1nszTwiasf1Hp8EItMZ
         A0TA==
X-Gm-Message-State: AOJu0YwpoUBC5RYDorFtRJ7m1k4HlDdfLtf7zZuwjkR3PCFYoTl9jRPF
	mrRrtZm55pvfuK65JibSAUcTY3ICKfo+ztws3iWo2nosorsgF4BSjnOn8fNpyeL0OoWcQpadKHj
	k9aXv7piq740EHo4t0V9x9ASik6Zjr9i569vprQ==
X-Google-Smtp-Source: AGHT+IHFJIyrLGdULx9WkCRvk7VkPcIKWGbMu/B6fHqWJq7auegFNHJf4l4dY2L1UGR33HM+5E4kn3h2dknuQ77dEGc=
X-Received: by 2002:a05:6871:7405:b0:220:99bf:c26d with SMTP id
 nw5-20020a056871740500b0022099bfc26dmr19939180oac.9.1710950686857; Wed, 20
 Mar 2024 09:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-6-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-6-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 16:04:35 +0000
Message-ID: <CA+zSX=bL9UStve5G_ea_HbG3BxgHsYE+VP6XstrQaJuNXsM3zA@mail.gmail.com>
Subject: Re: [PATCH 5/7] xen: Switch to new TRACE() API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> (Almost) no functional change.
>
> irq_move_cleanup_interrupt() changes two smp_processor_id() calls to the =
'me'
> local variable which manifests as a minor code improvement.  All other
> differences in the compiled binary are to do with line numbers changing.

Probably also worth noting that (as Jan points out in 7/7) by
bypassing HTMTRACE_ND, we're also bypassing the whole DEFAULT_HVM_*
and DO_TRC_HVM_* thing, which in theory could streamline the code by
causing the compiler to elide certain trace points.

 -George

