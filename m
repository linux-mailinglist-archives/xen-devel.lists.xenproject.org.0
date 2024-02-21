Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1585CDCF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 03:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683755.1063344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcc9H-0006Ui-Uf; Wed, 21 Feb 2024 02:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683755.1063344; Wed, 21 Feb 2024 02:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcc9H-0006SP-Rd; Wed, 21 Feb 2024 02:15:51 +0000
Received: by outflank-mailman (input) for mailman id 683755;
 Wed, 21 Feb 2024 02:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcc9G-0006SJ-VO
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 02:15:51 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 215c38f0-d05f-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 03:15:49 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d23a5a7c18so31913871fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 18:15:49 -0800 (PST)
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
X-Inumbo-ID: 215c38f0-d05f-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708481749; x=1709086549; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQF1qTpurz95qEjIjguEtPOhesntQW0/pAl5GKuAv2k=;
        b=BtTLnp6VsGICeU+0rFbRPV8R+gRhmkgpFtypAMJkAJhwzQG9TtFWWd7LZ+WJcGBD1C
         RCzliYNQnp9OT6/tk2PEeWbT3B5uN7ctrRP/BhpADrPLn2ekgdF4rf7kjJMawozFZn83
         yoECIpsOlqkQfbPSa4LZJuD4mKiAMs5CPT7zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708481749; x=1709086549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQF1qTpurz95qEjIjguEtPOhesntQW0/pAl5GKuAv2k=;
        b=bvqIvRFKygPad1ooikAhSGtQ2KlFl9KE5IHN/w/PHdK/2cJn/f3lqewvhATx3jBzEI
         D7CUxXNuTF22nWYZS63Gbmmobv/XXHy2dCMs7Vlj5f1IO2eOCasezkaaa9YIreDbJLcg
         FrWtp816jqvvlUoVSeHh83R0PF1x6XfoeVNyRQaAkJVPhyUzHAPg7bHU/2ZcvblgkwD1
         w9Pc/7LDjKZ4A9XOkHwpfrDGhHmSQdzbnwdPLmcU4s7fiZls1qWMVXNFicUAlI7sjONl
         JLyQSJB6egF+6ySvqGMyk20fCAAbpuE2eWRNMRIrGblWvHlNZ6Dy8PpHfAEYgIxuhA9E
         nSkA==
X-Gm-Message-State: AOJu0Yx6TvmDo5wQjXaxqC9kM3xQyilmE1h8q/YPhajef55stCeF8BPo
	7rVIy0LA05wM1h6vcxaLRDt+ynomU2PUYSH6yCnU8M6wcIo/O7Ol9ClBBt5kCwSKIrQHVKt1Nom
	BeqjiguyBdZJREPi0IrGFZOdbYzKsa7b4X3JW2w==
X-Google-Smtp-Source: AGHT+IHEqS+kxul4evQoa7DKb0efNc+gF3WvmJ/sN39vtA4IA2glOXVr3TQ5fT2S3I+0Q1Pp2loQvzXZASk6fYDqWQk=
X-Received: by 2002:a2e:a272:0:b0:2d2:4388:63fc with SMTP id
 k18-20020a2ea272000000b002d2438863fcmr3130404ljm.44.1708481749060; Tue, 20
 Feb 2024 18:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20240214094734.13533-1-frediano.ziglio@cloud.com>
In-Reply-To: <20240214094734.13533-1-frediano.ziglio@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 10:15:37 +0800
Message-ID: <CA+zSX=Y113S6zJqGExRw+bWSxPZSNmz9zY+yC=-yC0LLxoWXtQ@mail.gmail.com>
Subject: Re: [PATCH v2] Constify some parameters
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 5:48=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Make clear they are not changed in the functions.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Sched bits:

Acked-by: George Dunlap <george.dunlap@cloud.com>

