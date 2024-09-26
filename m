Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D3987444
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805463.1216566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoIn-0006eU-Ju; Thu, 26 Sep 2024 13:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805463.1216566; Thu, 26 Sep 2024 13:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoIn-0006cM-Gb; Thu, 26 Sep 2024 13:13:01 +0000
Received: by outflank-mailman (input) for mailman id 805463;
 Thu, 26 Sep 2024 13:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stoIm-0006cG-2D
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:13:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c806738-7c09-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 15:12:57 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c87ab540b3so850935a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 06:12:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c04esm3109126a12.14.2024.09.26.06.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:12:57 -0700 (PDT)
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
X-Inumbo-ID: 0c806738-7c09-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727356377; x=1727961177; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhZJoY+5kYO8yRQD0c0VXwzPMw2+aXm4NiXOutjtp30=;
        b=mSw9fdvS+0lTaY4Nk6LL/IDVVcPpBpTTAxJu4nwF8dwMygzNp2K3+81RfB9d/DyqCw
         2X9RCw34Vv6v4kIzturaoC/yNazqt9dhOeC+Dz4IfNeUB3U9GPd3u/04l00wPA5iAg5n
         7Mcntp/5Zwb0NeZSo+0ixJJV7KT2vmW5uvqng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727356377; x=1727961177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhZJoY+5kYO8yRQD0c0VXwzPMw2+aXm4NiXOutjtp30=;
        b=wEqw8XI+8pmaAJLOYh8pvSsURh1DxUvoFD472VZ8jJFzhkAaRj3vPMwkfmraSRyQSj
         qMYZ5pQ3avumJs4NuLCnZWBAlN4w7EOzu9pd/ltuM6TBcV2g+sw1xupXfliEqWPH+4Pw
         fHvpaZ0T1sa+Dc+7EBSQASZWifWCNZr8NOTmP4Jl39A8qvSexCUd3KL2OkpHO31zhu5H
         nqNuwC7BewTMyd8WNCoWjNDGkrqMWeoxYw6YXg94M2Yr20M1AiM2Sr6pJDl8yANLPJHg
         6p9REIW6gb2gBiZ38l6J5eaq90i8Fv9GDjdFKuis3XQzKSSScygg5H1nOFuwXQ+KPhD7
         PRxA==
X-Gm-Message-State: AOJu0Yyw7xPokY9fck3SZ2qiw+Qx66PjL3DpseaToXuX4A7qB0eLKAVa
	P+1LMg1WnEQM48AuA04iQbzy5LqWHWc2b635QWKp5WSvsTcO1TZ6l7JwQCO65uQ=
X-Google-Smtp-Source: AGHT+IGMlpBoND8XEVMiQsu7rK/aXPAS9cz1VAd5yzUB8jVcX7+pyA5eGBfE2bDir0moRkPFG4AB2g==
X-Received: by 2002:a05:6402:5ce:b0:5c7:18a6:32d with SMTP id 4fb4d7f45d1cf-5c8777b597dmr3480752a12.7.1727356377275;
        Thu, 26 Sep 2024 06:12:57 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:12:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 0/2] blkif: Fix discard req align requirement and
 various typos
Message-ID: <ZvVd2GjybgzFUGv_@macbook.local>
References: <20240926125347.23738-1-anthony.perard@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240926125347.23738-1-anthony.perard@vates.tech>

On Thu, Sep 26, 2024 at 12:53:49PM +0000, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.blkif-wording-fix-v1

That was fast, thanks:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Regards, Roger.

