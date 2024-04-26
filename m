Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643F8B345E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712617.1113420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0I6g-0000Ah-2P; Fri, 26 Apr 2024 09:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712617.1113420; Fri, 26 Apr 2024 09:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0I6f-00007t-W1; Fri, 26 Apr 2024 09:43:01 +0000
Received: by outflank-mailman (input) for mailman id 712617;
 Fri, 26 Apr 2024 09:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luGg=L7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1s0I6f-00007m-6X
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:43:01 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d6a97f4-03b1-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 11:42:59 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1e3f17c6491so16017605ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 02:42:59 -0700 (PDT)
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
X-Inumbo-ID: 5d6a97f4-03b1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714124578; x=1714729378; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO09fXp7y7b1v5MnHu4S1VhxKstbks5Nj+es06/ka34=;
        b=WvvJbavz0nrFYRrkwwpAWqm3l2JrrYgali4DjRinPZwE44VNje+ZF6SKULVNuFxHsc
         UHaLSUndGFBU/AwXBpcFqfuloPOLw/sfeRQIs7ZNJSw8nFlm9pcdmHp68mpZfJF3hdZ/
         GL+BM9neIR2AeUh2BKVKXZmKf7egI25T3uBvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124578; x=1714729378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZO09fXp7y7b1v5MnHu4S1VhxKstbks5Nj+es06/ka34=;
        b=TtithwHbIkw5VFsI6mVAvGwlEAcEEu4MWYT4f8xN9RC6egLlEhH3T/XVxQo/PWF1Rk
         RC+Md6DRyWb6meU4bZHc7rhbs39P1AVcub44hCd8XSz8hJxOBNsM4LDrfJe01jeEGWrh
         JrPYBDVHuzwlKMU9D8T7qxROu+vk02XqYeW7jPJ7EMH9bDRvXgeprvkFUd0m98fdkrVw
         +x3Z1HZkFWqDTTcu3Og3yHDZECCIzl908p91bYY9SNzhmDJOYcGELuPMfl5Y0aNNY9Rq
         fQ1da7XxLZS1dOtiFvuBzwD+nZXO5HImbzx7nsV2YxfrU4PEJ7g5PAyTjD/KEfygG8Ef
         saeA==
X-Gm-Message-State: AOJu0YyuQDcryW+ZQe+CQl5d+7D5JPR+nlgcv64Z6l4yvmlPzG4C2DMU
	N4siI++3VYsu58tljObz9MIwy2Oyx630fH6tmUqgQe47NTnbcbFcBO3NmNd15K24YdG16ogN5MC
	1cQxqQ5jHRLF51hzxiKvLZrooJQ/ZItdbDrQuSoJu5bukJig=
X-Google-Smtp-Source: AGHT+IHhQjl8KaufbjweOxPrgeTNA8JHdcs/55SsaaVBymwxZ9RSc/DXq48HKsYjBZmV3jSvR7hl/GjTeWg1geu4g80=
X-Received: by 2002:a17:903:2a8f:b0:1e4:3e67:2bbb with SMTP id
 lv15-20020a1709032a8f00b001e43e672bbbmr2413141plb.48.1714124577697; Fri, 26
 Apr 2024 02:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240426072144.48828-1-roger.pau@citrix.com>
In-Reply-To: <20240426072144.48828-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 26 Apr 2024 10:42:47 +0100
Message-ID: <CAG7k0Epadd1YNEikKqQt=8s6WcK08eD3cdGtQMBd+nMt_qugWQ@mail.gmail.com>
Subject: Re: [PATCH] xen-livepatch: fix --force option comparison
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 8:21=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> The check for --force option shouldn't be against 0.
>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 62a72092a517 ('livepatch: introduce --force option')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

