Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7388D3ED5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732304.1138232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCOqR-00076S-T1; Wed, 29 May 2024 19:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732304.1138232; Wed, 29 May 2024 19:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCOqR-00074B-QV; Wed, 29 May 2024 19:20:19 +0000
Received: by outflank-mailman (input) for mailman id 732304;
 Wed, 29 May 2024 19:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xAhx=NA=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sCOqR-000745-AD
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:20:19 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b043fac-1df0-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 21:20:17 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5b9776123a3so22305eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:20:17 -0700 (PDT)
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
X-Inumbo-ID: 7b043fac-1df0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717010416; x=1717615216; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYEZ3QdPOBVtKLMGxphyZXjG3jXLrbQxZILjLBd0uT8=;
        b=cKFi4iq26jWEDOk4ZDVZEWDEGfOKFZ2yu0bK+ZYFI9F60QAyg0nWL6PMPode6w00rQ
         5NCy7mvvsTU0e6tO8H28siHblF1cd7BJ5q9lecUl4jQY+RPXAeL2YCnLM/81gY3w5piS
         P7G6e/IlN8EbRy7txN3Fh5gc2/ey3mKTopK5Udufx/1mj53JCmS6CGbWEtE5POcFFw9Z
         KeIP6iReqCyGgbO+v8yeDZf8AH/RmstMCB6nZ0i1Z3o6jrZRv575w0DGuMeuZkghmaiQ
         vGYJk/2pnmsd9dPleZqvn/MpIErC91fP0NPKERosQB8dOJAu0ESg4YUWFNcyKAimdUkp
         8YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717010416; x=1717615216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYEZ3QdPOBVtKLMGxphyZXjG3jXLrbQxZILjLBd0uT8=;
        b=uVK3jrYS3WEjQMz9fPurjFmvga8B6WLS1WB7FSgvtnuIQ8gzpCZ/pd3qtMIG8d+MDb
         fMc8wqD3mt6S0bVmi4JFQw30KzTxSZdXQPHKKBk4K9genGUv79dI4icgojWWPTn01xId
         etgCrN4ljorBGTNGVQ3HOrKLpgngkJQC6zmRHdDWdjhUVKQYsqheoiUNDRAQbgf/6W81
         62ihlvDG+PKF1YB10HZAqw/lnJTFf5ZMTW5WzIvjMlekl/uU+gW+1qi1UGwU8Qq1dA0j
         VkKyeNgTKbcW0o5YOpjLZB4tdd9rnwnDc/ynBieA0bsgU3NDNbX0pFukCWydjdcsVHfx
         Az1g==
X-Forwarded-Encrypted: i=1; AJvYcCWYHkaJcm1YSoO5Hqduc3OihkznIiBAL6Pr1gk+cuu1LVZ68s63ahqvbm+SUYHsiMG6TxXwS88+seIOlSIxvB/Ctz/4rOWB+cMN9Kg+U/8=
X-Gm-Message-State: AOJu0YxTpvz5medRmyxL1Tk4mru8AjXkEwnO///69A35a0j035E178kT
	WYBoettvGMhWBrqIh1M3dyO0kkNWJomh+ggTiRdt07tiemhA1hOiKbQLXffZsJ04jb3+1gG3ND3
	B2+acwa2GqDvIWaV1RinXPvlkMcU=
X-Google-Smtp-Source: AGHT+IH7dzzBsRBUM6NjiNPEqPePk3LBlVotkKy36aTOkYG7k8Mdi271TA5C51uZ1qI7DV9hYpXkCeMN4l0lHFIg46E=
X-Received: by 2002:a05:6871:5210:b0:24f:dad3:97c with SMTP id
 586e51a60fabf-25060dd25aemr162328fac.46.1717010415890; Wed, 29 May 2024
 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716029860.git.w1benny@gmail.com> <ba5b81fdaf174a236c3963fcfd29ae3b19aff13d.1716029860.git.w1benny@gmail.com>
 <21196eb3-82ca-470b-8dc9-1a95b427f3b9@suse.com> <CAKBKdXj7xUyuy-wPCjR0a+kNwqCmGXOoO=-pMQa7=Yiyaom_mg@mail.gmail.com>
 <12335f4d-adde-42d3-aa25-b662e701b96d@suse.com>
In-Reply-To: <12335f4d-adde-42d3-aa25-b662e701b96d@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 29 May 2024 21:20:04 +0200
Message-ID: <CAKBKdXjuf3T1ozYFm3njU5pq0bwZnHjAoHjD0LsvcDnCRxdTBw@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v4 4/6] x86: Make the maximum number of altp2m
 views configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 8:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
>
> This is suspicious: You compare against one value but log another. This
> isn't EPT-specific, so shouldn't use MAX_EPTP.

Sorry, I copy-pasted a snippet and didn't edit it correctly. Of
course, it should have been:

if ( config->nr_altp2m > MAX_NR_ALTP2M )
{
    dprintk(XENLOG_INFO, "nr_altp2m must be <=3D %lu\n", MAX_NR_ALTP2M);
    return -EINVAL;
}

> > ... should I be consistent and also replace these accesses with
> > altp2m_get_eptp/altp2m_get_p2m (which will internally use
> > array_index_nospec), or should I leave them as they are?
>
> Perhaps leave them as they are, unless you can technically justify the
> adjustment.

If we can avoid speculative execution, why just not do it? The
performance overhead array_index_nospec is negligible compared to the
whole VMEXIT handling. It will also serve as future-proofing, since
nobody will be confused whether they should directly access the array,
but instead use the accessor function.

Currently, the idea seems to be that array_index_nospec() is used when
the index is user-controlled, and not used when the index is under
xen's control (i.e. in loops). But I found at least 2 instances where
the index _is_ user controlled and the nospec access is not used -
further proving my previous point.

That being said, if there are no protests, I would replace all array
index accesses with the newly introduced accessor functions, which
will unconditionally use array_index_nospec().

P.

