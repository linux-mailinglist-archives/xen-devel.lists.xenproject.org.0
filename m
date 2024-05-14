Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797A8C4ED5
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721370.1124764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pGa-000756-2M; Tue, 14 May 2024 10:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721370.1124764; Tue, 14 May 2024 10:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pGZ-000733-W1; Tue, 14 May 2024 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 721370;
 Tue, 14 May 2024 10:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6pGY-00072t-NQ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:20:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d41cdeb-11db-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 12:20:13 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34d7a32bdd3so3131395f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:20:13 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad07fsm13330820f8f.88.2024.05.14.03.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 03:20:12 -0700 (PDT)
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
X-Inumbo-ID: 8d41cdeb-11db-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715682013; x=1716286813; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NKhc87XdzYB48q5cDIUD8gUxz3tFXu5pueGeLBUV/Y=;
        b=jx63S3kA63ULNMfu/JcLyRNsXTr+Qb0Uz4G0JViHqcj45XFDevHXEeTo/lYjAJF2Bc
         8v8fuLLXyxc9xPfs66GOCSIY9THRocruJfrBmIHJxQ7RzRkY2/ezGhNGGxkM1vLeQMwx
         /HURYRmspk/n5zqnzpfez+pdoN/w8CA4cNzzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682013; x=1716286813;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NKhc87XdzYB48q5cDIUD8gUxz3tFXu5pueGeLBUV/Y=;
        b=VoDz3QAwAn1x6KW13w5yMNq02S+uktTvEx2Foiltf8nKg7JQJqdmOh0pHJ9m/B3xDR
         DLgmrSSoHsryTbFZS1STpYKKUOv2djfAXatdLXVFPJRNtgv3a3IJYFCZdcKrNse/hIxh
         b02RRoJ38jd0TAAbRxWYkV2AkQxxvyeSr8/uOLQ6S1Z+CxktvKBiW62JKGM0BT+y2pG3
         3Ym9OPzSwjNZKorQbfm6pGz44Yr6aoMqJamzNQ+rjTa7lYU64zWVoozGj2C/e6Y9vk3B
         5Kjc6FcrPXk03A95SoEUVl2oAX+soHyLKud6m9LGhp01LAqKjIgRQo9OPHg139R6d4H+
         43GA==
X-Gm-Message-State: AOJu0YxyKTFrb6emkmcGMQUKHycq5K5C5yW66jembyL4UC0TEiLycm0C
	12B0swSLqR+YV6MimC/bOi3escMk00QykVLlfw9kZmIbdBDbacvPXbhjpi3rzHE=
X-Google-Smtp-Source: AGHT+IHtXb1Tx4pH/ctR3HLfMqrbHv/s/y7XKVKkMajmtWe1i2O9xjKJfDpnu0ezfz35tNljcKRJ+Q==
X-Received: by 2002:adf:c58a:0:b0:34a:56e7:5cc4 with SMTP id ffacd0b85a97d-351bfd2aa96mr4199767f8f.2.1715682013286;
        Tue, 14 May 2024 03:20:13 -0700 (PDT)
Date: Tue, 14 May 2024 12:20:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Message-ID: <ZkM625feJ8mMaM_p@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com>
 <ZkMs1cknBFBWZoJG@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkMs1cknBFBWZoJG@macbook>

On Tue, May 14, 2024 at 11:20:21AM +0200, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:33PM +0000, Elias El Yandouzi wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > index 7561297a75..9d4f1f2d0d 100644
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -167,6 +167,13 @@ extern unsigned long max_page;
> >  extern unsigned long total_pages;
> >  extern paddr_t mem_hotplug;
> >  
> > +extern bool opt_directmap;
> > +
> > +static inline bool has_directmap(void)
> > +{
> > +    return opt_directmap;
> 
> This likely wants:
> 
> return IS_ENABLED(CONFIG_HAS_SECRET_HIDING) && opt_directmap;

Er, sorry, this is wrong, should be:

return !IS_ENABLED(CONFIG_HAS_SECRET_HIDING) || opt_directmap;

Roger.

