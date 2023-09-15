Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D237A1C2B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 12:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602987.939845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh5zV-0007bO-HW; Fri, 15 Sep 2023 10:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602987.939845; Fri, 15 Sep 2023 10:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh5zV-0007Yb-EI; Fri, 15 Sep 2023 10:24:01 +0000
Received: by outflank-mailman (input) for mailman id 602987;
 Fri, 15 Sep 2023 10:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpI5=E7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qh5zT-0007YU-99
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 10:23:59 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa11dffa-53b1-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 12:23:56 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-502e7d66c1eso2905332e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 03:23:57 -0700 (PDT)
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
X-Inumbo-ID: fa11dffa-53b1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694773436; x=1695378236; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqPHAeeXZav0/fFcw+6CTts380pusIwosmOvUAf/C8k=;
        b=PxWXv90svxGLOLdZNnZeiPzkOatgWKFyacIO+7mG51YBvSTnnRJXA10lLkhUJrOgqa
         I0xSnk4T4bS4tXaYgXD9KpQ2TdlepUxLOKIpIdZOnMnBS7AuxdUA5EWXEVpmFatglL/p
         l/rsVNRV7ZUA0Im2t2KlTBq7ORrMePhBjpBqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694773436; x=1695378236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqPHAeeXZav0/fFcw+6CTts380pusIwosmOvUAf/C8k=;
        b=vO6juXEJHcnjxMXl2cke3c/qhU4+E2l+9SqaNsnznBXLeudFuO7OdUuF2uH8ZCH07g
         VFLFeTxaaYHMTEB0JFAs8QEO51OO4Cjw0/TYNAdR1YndEBZziMABkh7Jbr4uMz8VnHJT
         lo8EbV91GeHYXphWp0o/YNkVA+8ihJwoYUW0q3EI7QWQjbyd5B5lhPuiYetiQm9NHBXJ
         x52oTCdFYeSTOkngK70ybmCQR4V/Q7XgL72NYiOxAMie5UlWf5mgiha24ETT7Kw8mhQi
         l+nWIoYaHjhnAagfo1YfpfVwbdtBcwCEs4OXFzQf8nqSCPKyntFdewuxnlrqQLuSVzKx
         0oEA==
X-Gm-Message-State: AOJu0Yws9Dz3frh0PvFSOEOBk1EAhIMR28haGuddKZNpADjHPRGxUXgH
	6Bb8Cs7kdmE7RoKpqJIkUaXewyQIkOXVMMPrexpqsQ==
X-Google-Smtp-Source: AGHT+IEvC1SQReU5hDpyJmbL44JoXao/wNod1Kb8xal5E6xTHcbylAN+1cVmPezsWWNnRAfoaG5UGSYfkcih9fWVOdg=
X-Received: by 2002:a05:6512:2015:b0:4fb:744e:17db with SMTP id
 a21-20020a056512201500b004fb744e17dbmr1047291lfb.1.1694773436419; Fri, 15 Sep
 2023 03:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <11eaed0c-69a0-60de-43ab-55d50c981ffa@suse.com>
In-Reply-To: <11eaed0c-69a0-60de-43ab-55d50c981ffa@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Sep 2023 11:23:45 +0100
Message-ID: <CA+zSX=Ytnuz38Ra3Zf2Q452LZ7a=q=-cysXsK6O4TwGCQJU8ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] timer: fix NR_CPUS=1 build with gcc13
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
> is >=3D 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
> exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
> configuration). Make the code conditional upon there being at least 2
> CPUs configured (otherwise there simply is nothing to migrate [to]).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I would still have preferred the code be more robust for the NR_CPUS >
1 case, but this is an improvement, so in any case:

Acked-by: George Dunlap <george.dunlap@cloud.com>

