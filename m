Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BCAC4950
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 09:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997905.1378697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJofq-0008Ir-Vk; Tue, 27 May 2025 07:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997905.1378697; Tue, 27 May 2025 07:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJofq-0008Gb-T1; Tue, 27 May 2025 07:24:34 +0000
Received: by outflank-mailman (input) for mailman id 997905;
 Tue, 27 May 2025 07:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jbf=YL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uJofp-0008GV-Kc
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 07:24:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fb366ad-3acb-11f0-b893-0df219b8e170;
 Tue, 27 May 2025 09:24:28 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso31965105e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 00:24:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f74cce5bsm254662365e9.24.2025.05.27.00.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 00:24:27 -0700 (PDT)
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
X-Inumbo-ID: 9fb366ad-3acb-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748330668; x=1748935468; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nmBoGMb65jQencl+T6MB+gJjSD6HDzfiSCDyL4OuV+4=;
        b=BULzsyXvbOu0NGQ7N4x5HY3fJem2a4HTZixfYxOX/dhOHIMi4cdwietZRe7foZM7gW
         AEUgvUyQkvBbQMjgi3+/CVjnDk5xa7NHJYOOMdITOVFO4BmoA5hynnQAs5HxBfV3CEZG
         gMa+DwfHR0zFtOQY9o5BkPi71jDdog6FjPOdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748330668; x=1748935468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmBoGMb65jQencl+T6MB+gJjSD6HDzfiSCDyL4OuV+4=;
        b=tmDKAp8zl8s7NXlOBLM8hP1yFO6TzE/KN5hAgZOUv7FqqmxZ061KsHq0Bt7AvTn6pp
         C7LEFFncncuYruK+4gqsXr2Bw91zeuFWVCBeCc/P9HrAFJTDGOo0WVawxcWoFRYnKokx
         a4VBq8dftegC1cx3jwD1dew4HbJhceA3bLA/G49SsOgAP1JKpYpIps0RseXx1T9SMsRi
         f49Umpl4TjV0W+QbxCE3s8q95P225q9YEoOkiJZh/ZoWYsM+Io7XRTNQ0iP2gmowL6Mg
         0H06sB36m0d1csCkQojkDqedzIpJRDOjojYtItn7b0+lWblrIg6huv3nKBoj4cDyiWBe
         nqjg==
X-Gm-Message-State: AOJu0Yw/4yJDG02LeWNmJ5YaVwdyjeX6dhGsPG0Fsre3aw7gJifAfuF8
	1XJzBgdEKKkX+NWK/6gW49Pm2S+7xfdnQp2eWs3o+36K7Qw7q/m/vuqHLOrv12iNKkw=
X-Gm-Gg: ASbGnctpsR7qqgpj0xNjXdqWkFnh6sC7/fzqAGjKES2jEOaLXRJWGLVgbt5EC8ZakeH
	D4/MLC8SHZJWS5qhNNty7n4Hf5suJaZnxHtZovFtUB5cbUyRUmBpWUWI36ezZRxwedUmgsGxRaD
	Csd4BLC0S63TO6k3tauQaySMW6D6dL1u/JRd1T4qzLVbXPrPNMaR60jqKe3gvmB2CjhR0wDDkG6
	Cd2VEzfMEDl+e8q+TqsVIr/pwXWSKNTuq6V2A24FXLNxC2O5c3Hc+pT8Ugpk9mupplmYKV2gCB6
	+S8C2L0Nd2SBTGTyokbjkgFR0W7ziqFL+JHp7drxeq3zf3LYUZY44v4iozbfi8/Y9zMdKqgVhm2
	tC6UUmLVsAVtK3Iixlz8emifRbN6tUw==
X-Google-Smtp-Source: AGHT+IGTRVf8wYKXNuKcMvVnjEQey6aNYisfZ4LGPtXtCShGgi2PVXgNHIUW59cGp5qdDFFM/FgfUw==
X-Received: by 2002:a05:600c:3b19:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-44c8f25dab7mr122447655e9.0.1748330667983;
        Tue, 27 May 2025 00:24:27 -0700 (PDT)
Date: Tue, 27 May 2025 09:24:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/vmx: Fix VMEntry failure on ADL/SPR with shadow
 guests
Message-ID: <aDVoqrpov1Z4fYRC@macbook.local>
References: <20250523160558.593849-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523160558.593849-1-andrew.cooper3@citrix.com>

On Fri, May 23, 2025 at 05:05:58PM +0100, Andrew Cooper wrote:
> Paging Writeable depends on EPT, so must disabled in non-EPT guests like the
> other EPT dependent features.  Otherwise, VMEntry fails with bad control
> state.
> 
> Drop a piece of trailing whitepsace in context.
> 
> Fixes: ff10aa9d8f90 ("x86: Add Support for Paging-Write Feature")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

