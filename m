Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4685F90D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 13:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684399.1064245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd8ec-0000YE-W6; Thu, 22 Feb 2024 12:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684399.1064245; Thu, 22 Feb 2024 12:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd8ec-0000VQ-Ru; Thu, 22 Feb 2024 12:58:22 +0000
Received: by outflank-mailman (input) for mailman id 684399;
 Thu, 22 Feb 2024 12:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBgv=J7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rd8ea-0000VK-HA
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 12:58:20 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c929cc7-d182-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 13:58:18 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d0bc402c8eso8163131fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 04:58:18 -0800 (PST)
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
X-Inumbo-ID: 0c929cc7-d182-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708606698; x=1709211498; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjre2Q/BSMGJzCXdj7238/HXa8ZceCmEO0mTF1CT35I=;
        b=KAAtgH2Q5wqK1czdl0vHDxxMqsZoua448STTHAbmEVz24kKyQzvPb/ntF37W9EW6u2
         zM7d/ou/Yu8uIGIYpIdd9Ayn6u30kDSmpyrYmka2G2sDcmJmrsJ8XnXfsGdZoH5tSUZl
         2rZqQhlIgGKJMxrTr+DQBSi9qeTQyWhI+p/vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606698; x=1709211498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjre2Q/BSMGJzCXdj7238/HXa8ZceCmEO0mTF1CT35I=;
        b=epFlojbhHbmpnsrgz7OFLJ/aDm2NxWek+phK8tgKvm4MW75Ba8fQtMa8wEjWtIlci5
         30lNRfhWlDhHJ+Gp9SS7E0UuOpi0ponWg0bnu+Kah8eR350kW0MCnGh1mEGOobjquGPN
         P70xy6uwVgFAlq23MzSET2pYZgn+KpOTMzS4LNIvIkw78qcbXb/ST6Fdfal8B9l9PVNI
         SoeesNID/hn3NsENlAtZOgkMA7nPCZB5PETvwMC3W8TE0J3D7oVXI2LBPboy24UhiBq/
         4BiYogFOXz7F7dQHtD/fUXLfRB+Q8PrTmgShWGM2BvEsJb2U0aL2TnI+J+bzrLtdUvk9
         EOXA==
X-Gm-Message-State: AOJu0YxTz2umwTJqOaiUWAM+s6HWr6/0xkJa0C1JiYxWu+FS32x3uuXf
	11dEnds4h457MsWh10S6YDvKmbyHU0rYXD1xJ4fQFjEf+9L4AReLLpCFIVnxlZk5LgQygkpAs9t
	wQi/fcWS0je9iAHrwaboPjcTR1Ym9gsfvHSo46Q==
X-Google-Smtp-Source: AGHT+IGrGuMknL/Lt6eaFLg7q4My4LtxTYnRntmZ1GVvJHg4kN41xZtwmsRfczYMkCjeX+I/bv2PkldgxzgK90/wQWw=
X-Received: by 2002:a2e:9241:0:b0:2d0:e4ef:f1ec with SMTP id
 v1-20020a2e9241000000b002d0e4eff1ecmr931412ljg.18.1708606697811; Thu, 22 Feb
 2024 04:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-6-george.dunlap@cloud.com> <801618fe-73fe-4d15-8e17-dd02e115cdf8@suse.com>
In-Reply-To: <801618fe-73fe-4d15-8e17-dd02e115cdf8@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 22 Feb 2024 20:58:06 +0800
Message-ID: <CA+zSX=Y3W-CXyXzOZYXNhjSOUMJpS6=mLjjFJiUFxOOpPeB2sg@mail.gmail.com>
Subject: Re: [PATCH 5/6] nestedsvm: Remove bogus debug message from nestedsvm_check_intercepts
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 11:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > Changeset ef3e8db8068 ("x86/hvm: Corrections and improvements to
> > unhandled vmexit logging") introduced a printk to the default path of
> > the switch statement in nestedsvm_check_intercepts(), complaining of
> > an unknown exit reason.
> >
> > Unfortunately, the "core" switch statement which is meant to handle
> > all vmexit reasons is in nsvm_vmcb_guest_intercepts_exitcode(); the
> > switch statement in nestedsvm_check_intercepts() is only meant to
> > superimpose on top of that some special-casing for how to interaction
> > between L1 and L0 vmexits.
> >
> > Remove the printk, and add a comment to prevent future confusion.
> >
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I wonder if a Fixes: tag is warranted here.

Yes, I think probably so.


 -George

