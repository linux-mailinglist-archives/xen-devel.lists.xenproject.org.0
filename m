Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29703976E32
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797674.1207694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1som71-00047j-Iv; Thu, 12 Sep 2024 15:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797674.1207694; Thu, 12 Sep 2024 15:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1som71-00044l-GE; Thu, 12 Sep 2024 15:52:03 +0000
Received: by outflank-mailman (input) for mailman id 797674;
 Thu, 12 Sep 2024 15:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1som70-00044f-8U
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:52:02 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f231402e-711e-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 17:51:59 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c413cf5de5so1469574a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:51:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf03ccsm765516766b.183.2024.09.12.08.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:51:58 -0700 (PDT)
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
X-Inumbo-ID: f231402e-711e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726156319; x=1726761119; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXRIUburIX3aE5SjdJJLUwGPSRg8ANCkYNtaqz9yUsU=;
        b=SCVJF3QcBngkcpGOVDxhzZ3ZFHE6T6EmefTjptN5ZzQmi9ipq4nuv25P6wey0wZZ/x
         L1pjQy3KjVIEQNhorvlZuLuXYIhx1Z9lkgvob/zeGCuV/RB8BX0mmiqn3xKRhaQj+CQM
         hv1Jsu56G2UXxPnTiBX7aUGxLCRyPpdq23lJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726156319; x=1726761119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXRIUburIX3aE5SjdJJLUwGPSRg8ANCkYNtaqz9yUsU=;
        b=LxWF/Q2gCPrnuzRN4i/jPEKrwLigtX9gOm3RB40gKVLL5hh013JrDuNmhLOovDssWY
         Ji/1lEHWU+D3ZtETxfMFoxI0Rau+rIKY7W5Kt+tAO/tUqoVx6fM90Pvw/5FapJnYC+GW
         nO6dOZO1F9eKl+BcH5afNEba6S9elNnDJgbweoWjz7Vuc/w8wWK4IxpuGOxXZQuEfH8d
         EAlWywkSlmmM9oTrelD+iedpBE0PdUAZReq0bVIIlPiCvA7ytJQNa5k3+gEOeAiCOuFB
         +FC8t1uWIdRewclBisZMYciORnJaDoW6IWxV+WYEIlk4rdDiUqH5ovEGYlxKQq8/jJvg
         iWig==
X-Gm-Message-State: AOJu0YwYhgoU8r4ZdEYL9kNmEvv4ysSDyjFwAv9OFW05Jf7yD3tbYJh/
	99PNyf0K9xxH7xhJs4DeCoZLG/0G8Tn3Bmyh35TD9F46Nlyq2IqWe1GSiE5CZMw=
X-Google-Smtp-Source: AGHT+IG9Fy9LxyTg1f4kpV67j87ADeNO68UG2iL5EiKdDErACmS92V/ev2cANEFZuQxqoJvZrdt73w==
X-Received: by 2002:a17:907:e662:b0:a8d:75ab:17aa with SMTP id a640c23a62f3a-a90294a4b21mr337917266b.37.1726156318792;
        Thu, 12 Sep 2024 08:51:58 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:51:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: undo type change of partial_flags
Message-ID: <ZuMOHV4JkcEZDslO@macbook.local>
References: <25a6b7e7-3bbe-4121-8f29-cce6f0a99206@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a6b7e7-3bbe-4121-8f29-cce6f0a99206@suse.com>

On Thu, Sep 12, 2024 at 05:38:17PM +0200, Jan Beulich wrote:
> Clang dislikes the boolean type combined with the field being set using
> PTF_partial_set.
> 
> Fixes: 5ffe6d4a02e0 ("types: replace remaining uses of s16")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

