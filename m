Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3AAD9E5A
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 18:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015658.1393214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTyU-0002xR-DD; Sat, 14 Jun 2025 16:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015658.1393214; Sat, 14 Jun 2025 16:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTyU-0002vQ-A1; Sat, 14 Jun 2025 16:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1015658;
 Sat, 14 Jun 2025 16:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQTyS-0002tF-MT
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 16:43:20 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab8923f5-493e-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 18:43:17 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e740a09eb00so2579817276.0; 
 Sat, 14 Jun 2025 09:43:16 -0700 (PDT)
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
X-Inumbo-ID: ab8923f5-493e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749919396; x=1750524196; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VsPMzepTflWSN6sj4gCijnZcPZH6y1oYNdtH24EsqQ=;
        b=TMrE+k2YHToaLsv+4kEWVZiB2cK8y9jPhIEImMHawf2pj/hCWAI4iB+XMUYNi9uywb
         ojcBUTB8w7hAG1EaAj3WlT970yopjpLRNg+AXhTj/9dDvKh7oo5tFtMSN6JL5ptbD6rg
         Zfcy0q8QZvAOSBija96PRxXukk9LvXCa88eUFxxul/ZInrkLqP7eGpYkvrZd7VJhRYC1
         ZID5hF7c7ASbBuDyHXoVeAftiB3t28BhP4TdQFIGtCJrnppmID8u+3kIIv15ttPOQQZW
         RT2jjfO/dlgxG1vKc4ykoMfeHAiZe4KOhKp5CZEFVf4rZhDELLp3MQAhhGZjOTzUbOJf
         PDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749919396; x=1750524196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VsPMzepTflWSN6sj4gCijnZcPZH6y1oYNdtH24EsqQ=;
        b=VDFHN4uO/QwVeiy+etgCe7OnlgoEppKVdqQKVoXdrBc3vqEcohipI77N7HxGqM/YqS
         VxDALx4tr56npzBtL/RsFxLZxdrlIYgXleIfIZPQKP9907JWjV8DnPsp5iY/PNrqtcJ5
         QMXehriCx1cMrdEQCh8P+5KCMdNz3tEvaJHTqx30t77q7SwWlTUmwtQi3gF9d4hDnPic
         +7/PrMmOyGe2LJDo55i7uWxvBnW/q8axRqTR5IpAYToMwqXWP2W7AzQ3m+gZR/GNkSio
         xDhNL2Z4xES4eO8Ml24I+dOj2bWeYM4qiFWx/DquSIfd5JgqrsIB8iQUJXanKexPRgFW
         9HVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMAxTWHsO/lOPh+gh7n5hezNzCJut+Btot2moOE9OHN523xyqynSlyHF9Y6AJ3r1SoLwifm0W/Fbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxURTK6Y3jZJIUL/qWdy86PaJx6M/90YO8jNTiKzwE5Ry+PMBls
	mS1IlNzmfVqUsBFMAc8sgFo1bp/Jn1M7jhW4qDh7yFDfS0RE24NJp6yyqU8RcG5BGdBZgWNcBCk
	E9BuoowodVf/RWvxab43tEmN6+LmotxE=
X-Gm-Gg: ASbGncvA1wGrwxkfoH8yvbQBcELKcupGdWVxvdRPooHyabllvQeL2zRKhUaADlbgVMf
	TCVQMe0AEHzFAuA3HyksVbHJFcVRh3I4avCtY5hrtc/1dl7C5wtbuHIEtFI5ZhG86Xl40D56AQu
	TRsL1gBQRP1hmUG8gA6YY7016srJdW80u5rU111Yjw
X-Google-Smtp-Source: AGHT+IHRZO/gCTRzBeDSbBoZQ2muL/3+1exHsIYorrrg5SWuDFcH2I4QGn5i1rE2RSkUpA0f64kf1sYKD6rCDscYbUg=
X-Received: by 2002:a05:690c:882:b0:70e:2246:1999 with SMTP id
 00721157ae682-71175457380mr47342547b3.21.1749919395886; Sat, 14 Jun 2025
 09:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-6-jgross@suse.com>
In-Reply-To: <20250321092451.17309-6-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 12:43:04 -0400
X-Gm-Features: AX0GCFsByrRDnafFmXpcq1dpAD05Z8tRENmkmf8yzt71Rcv4E0d_BqLOcOXZ7-I
Message-ID: <CAKf6xpv0bQ428niqdk_zF1kKTUPddDvCKXy21tdqkhP=MZMq7w@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 05/12] kexec: finalize parameter location and size
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:25=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Finalize the location and the size of the parameters for the new
> kernel. This is needed in order to avoid allocating new memory in the
> area occupied by the new kernel and parameters.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

