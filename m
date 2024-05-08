Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F98C0200
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 18:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718889.1121446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4kDw-0007op-9H; Wed, 08 May 2024 16:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718889.1121446; Wed, 08 May 2024 16:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4kDw-0007lc-5N; Wed, 08 May 2024 16:32:56 +0000
Received: by outflank-mailman (input) for mailman id 718889;
 Wed, 08 May 2024 16:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4kDt-0007lW-SL
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 16:32:53 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce1f31c-0d58-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 18:32:51 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so193353266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 09:32:51 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 r25-20020a170906351900b00a59b2683971sm5094559eja.187.2024.05.08.09.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 09:32:50 -0700 (PDT)
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
X-Inumbo-ID: 9ce1f31c-0d58-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715185971; x=1715790771; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O354KtvB6ahvVPuGywICPIp2MHx6KYPaz+66z+lEk80=;
        b=XCdPkna+F8Vvvwv2GXSgpTSy6+L0+qVE/VSa7N6SfHfKDk4cet8JNgL81NhHdKWzJh
         kjdNaN4FHJuttpNSH8XjIRrWlMt5OvMz93oT4k1OJLOgj87B1NBXlB+LpzAolN/XpS4z
         11LhxR3+DABonkzGlrCYFc44g3zfrJ7QwRbSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715185971; x=1715790771;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O354KtvB6ahvVPuGywICPIp2MHx6KYPaz+66z+lEk80=;
        b=lBAVz1kME/eJLwFz+rgL9RZVv0KpPdgkhtt5FbP8CT8U/gOLTc7rZ5ZWhWWTvyiNls
         LvdA22a2gOXWjVozSP+5Yv30+tFdkdFpVtKaSHN8cDgdBQaRo5B30j9uutjCQpxiWpSR
         xogtZF2PICdAn9qKVKjtrz/mnRgJkGoL9q0jZMg84dRlKV7XJgBaBw9HfQeColTILUNo
         JESnDhCn/SEh3M0NgVpzGf/kvAgES5V0wh6oOyLwa0yPvIYS5RtRVfEIWrzIcX6WKN8i
         joqftfhR/Ri/IoKSrrGsLmHpaM7BYj1Ndtav35mUY9uTS2JifTavjv4y5uYRUo7j1PZ9
         DRVg==
X-Gm-Message-State: AOJu0YxgCjVdyyHk3g7lubbxNblCavEZjbtqe1Wc0fZJQXOij1iJAGdQ
	eyOeyUUu6aQ7ZMtL2sXJtmEcLM51E81z/VoswArE7KSFJdjZRe0WyvJRg9FghvQ=
X-Google-Smtp-Source: AGHT+IHPN7HSPneklhkm0fU/q9NksB+sQP+wFawY+/NxTsc0M8V+UrLH5wwSIAKUUmgwxRAXYu6jDA==
X-Received: by 2002:a17:906:408a:b0:a59:dba0:1544 with SMTP id a640c23a62f3a-a5a117934famr11663666b.31.1715185970744;
        Wed, 08 May 2024 09:32:50 -0700 (PDT)
Date: Wed, 8 May 2024 18:32:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/ucode: Distinguish "ucode already up to date"
Message-ID: <ZjupMbwLGco9rSeI@macbook>
References: <20240508161842.1785414-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508161842.1785414-1-andrew.cooper3@citrix.com>

On Wed, May 08, 2024 at 05:18:42PM +0100, Andrew Cooper wrote:
> Right now, Xen returns -ENOENT for both "the provided blob isn't correct for
> this CPU", and "the blob isn't newer than what's loaded".
> 
> This in turn causes xen-ucode to exit with an error, when "nothing to do" is
> more commonly a success condition.
> 
> Handle EEXIST specially and exit cleanly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

