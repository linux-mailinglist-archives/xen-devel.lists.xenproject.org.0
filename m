Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00480881459
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695991.1086440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxj3-0008Nq-B3; Wed, 20 Mar 2024 15:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695991.1086440; Wed, 20 Mar 2024 15:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxj3-0008LM-8D; Wed, 20 Mar 2024 15:19:33 +0000
Received: by outflank-mailman (input) for mailman id 695991;
 Wed, 20 Mar 2024 15:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmxj2-0008Eu-7m
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:19:32 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f27473d-e6cd-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 16:19:30 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-221a9e5484aso19363fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:19:30 -0700 (PDT)
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
X-Inumbo-ID: 3f27473d-e6cd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710947969; x=1711552769; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu393cTx6QvaMvwbGbEh7W8EIbEAY62y8lPrC2ykeBM=;
        b=bc5VTf54J6AqfSojIGwAJUR9ryiAdUbpI4lTNqar0ZR5TBnX6FxDes9BrD32jr5X4E
         Hld3rEvX/F0M0dYkUOwhTyH3i9JzUVFO7mAc9/68AoOGPYVsvjTh5r5JNV3tQkLoMuLz
         yGEEq9f33Ank8ERYuZwtYRHR3h8Ff8Twn0EkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947969; x=1711552769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu393cTx6QvaMvwbGbEh7W8EIbEAY62y8lPrC2ykeBM=;
        b=aIv4FHQHmp56uUkQ3BUus1lp2NQ9RhcxQWE6cnF504IliRq1c3w4PkpAUNbrXkNI7v
         U3Bv8ytvzFGae5qHto4pZ3heCPFBXmbeLSCSLWjntRIEwlO5kFSg67KbHQsFxOmzaNvs
         TfieYJpm2aMyPk8q2vqLZ++RYJT/4EV3CM1dB/XiwS9AxRFe3rJxFN0KeV7c6WdoE+g2
         3tOS1RbqNVsT6VR791wbTfWeh9LCzAgDwcTW/hRSUJhStn8TwzYLIjmPuUUhbQLJr5bg
         PgblRXULuWEjtTP+0jN2QHSQDcwSBZsbH6hFu5hUm66CUB77/dI8JZJ0udbN5P3iNETR
         Ia9Q==
X-Gm-Message-State: AOJu0Yz+1fTzn+W+LENQmosCBpVUbEOywjAr1pHQmzlGLs1zhcj7HTBa
	HPaEqKwS9VU0T1STDLQ3G2ebOFia9vN56+J+11OSt0Km0ObXOpusY9nBgB6JaKN+jvcL7IcYFN4
	DTcbod48WSxvcGUoCJsBkByb2QItB3C4QEB/SsA==
X-Google-Smtp-Source: AGHT+IEi82yqno5eBgA7Sujeg4SmVLKEcvZEIkHLOAkysCPR+Wh9kv0Qhujv5MSeA2P1sJjbB1P1jXi7drly7b4Pg8c=
X-Received: by 2002:a05:6870:510:b0:221:8a03:6dea with SMTP id
 j16-20020a056870051000b002218a036deamr18679533oao.38.1710947969216; Wed, 20
 Mar 2024 08:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-5-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-5-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 15:19:18 +0000
Message-ID: <CA+zSX=ZfZET4MZ2bHkq00Q8EXuQ-=LENU-BhmWr6h_Jsu2Ewzg@mail.gmail.com>
Subject: Re: [PATCH 4/7] xen/sched: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> There is no need for bitfields anywhere - use more sensible types.  There=
 is
> also no need to cast 'd' to (unsigned char *) before passing it to a func=
tion
> taking void *.  Switch to new trace_time() API.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

