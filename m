Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7092638E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753128.1161407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP16o-0000jz-1i; Wed, 03 Jul 2024 14:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753128.1161407; Wed, 03 Jul 2024 14:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP16n-0000hd-Ui; Wed, 03 Jul 2024 14:37:21 +0000
Received: by outflank-mailman (input) for mailman id 753128;
 Wed, 03 Jul 2024 14:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sP16l-0000hX-Ru
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:37:19 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1bfda8-3949-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:37:18 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-79c0abd3eaaso410222585a.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:37:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e368a1csm54529026d6.16.2024.07.03.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:37:16 -0700 (PDT)
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
X-Inumbo-ID: bf1bfda8-3949-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720017437; x=1720622237; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hcMq7fg6hE4X05d+5KudbbYczuS0IaJ/p0Ip8jZS6o=;
        b=p6Gpj6TJGnGAS9lueqs3q04gjnjg3svN6/CtPFVl5NAKVHML+aa6faUVtA2SNwXUkw
         UBcxrZ6BXqfiHEphBorcQ8w1Gvf5HjAFpbuoxp1M8h2BPrQiV99MAhhmJnYuOlosTQjB
         kgHYkAGtSPHC5xLLTQwq5U7WtfuUQNiCS1CL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017437; x=1720622237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hcMq7fg6hE4X05d+5KudbbYczuS0IaJ/p0Ip8jZS6o=;
        b=eKVRynt54Uq4B52h8B8m5m+cPRohFB+/ZkUZZ8ROnOwAUvIdgCD13Fc6rK/xS+7Iqh
         pGb5oALnOT1LH8ypFDtYm8IHDLxGBZ1edE1PjZ6SUL80ieshMmWsAjcghnhaofWCcx7c
         nz9h1wFlzx3Q3wAodMeVupXLCByHr6o4GerSkuqnf1WrXmTO9kdjYQL3wXGxBQgiolOS
         HxjrkpDm1we7J6qCE8Drauk0X+ywPfZIFnRTYkGoJAEnYAYHOQmFjYZnqBUqP98rQAM4
         7NrfAopV7Quuoo6VTWr6H4JHdh92TMNoXjUjXSqV9buSm+cppLEVnLibrnVLLIkKCzc7
         wsgg==
X-Gm-Message-State: AOJu0YySgX0QnlAfLAP4UCGngsec4Va4kcBOk0LLSg8dcHbkm3jU7qXl
	JV3IyyUO4v1ubf2SytKEh202fHiDm7qbWY1MumbxFK8EiVJsq9IaOJcFWZSam3s=
X-Google-Smtp-Source: AGHT+IHTy5jBNOoO2wovyZGKR8mXhUoonThIZWp3wcnUBHIkcchHkfGRA3/jfL5XSP1PCu+Zc8Wejw==
X-Received: by 2002:ad4:5ecc:0:b0:6b0:729c:5efc with SMTP id 6a1803df08f44-6b5b71aecdbmr148383026d6.56.1720017436768;
        Wed, 03 Jul 2024 07:37:16 -0700 (PDT)
Date: Wed, 3 Jul 2024 16:37:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 2/4] CI: Adjust the usage of inline files
Message-ID: <ZoViF7KLRbV3qB4k@macbook.local>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703142002.1662874-3-andrew.cooper3@citrix.com>

On Wed, Jul 03, 2024 at 03:20:00PM +0100, Andrew Cooper wrote:
> As per:
> 
>   https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/reference.md#here-documents
> 
> For inline files, use COPY with a heredoc, rather than opencoding it through
> /bin/sh.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

