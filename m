Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B68AAAE4
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 10:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708866.1108030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjwj-0001gK-P1; Fri, 19 Apr 2024 08:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708866.1108030; Fri, 19 Apr 2024 08:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjwj-0001eo-MG; Fri, 19 Apr 2024 08:50:13 +0000
Received: by outflank-mailman (input) for mailman id 708866;
 Fri, 19 Apr 2024 08:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxjwi-0001ei-W1
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 08:50:13 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4726e67-fe29-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 10:50:10 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4199332c157so1133535e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 01:50:10 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6d46000000b003434f526cb5sm3836749wri.95.2024.04.19.01.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 01:50:09 -0700 (PDT)
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
X-Inumbo-ID: d4726e67-fe29-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713516610; x=1714121410; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYxfMKjHXy6ZFrdJVH7TBmUrb1xkHr6tFiczIIeWWeo=;
        b=T9xVhfVKV5vq8JIDUYmEoIi3sBcuDLYj4veJroIsLW0IcS5xpbN0in7DF5lXFNt1Vj
         ocNJigJkz3mXdBTR46Fc93aM5U5oQqi9ejd7VuW44pJZQ7SbaOMPaCzh/Y57QUBByQzX
         i41uu/MBQFGq+k3px0AXA5cWCPSvsESLRvbBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713516610; x=1714121410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYxfMKjHXy6ZFrdJVH7TBmUrb1xkHr6tFiczIIeWWeo=;
        b=Fat0bqEBPdBC0IGDfI6KUS62Ck/Lv5fm/PXauNDdAuMTnFg2jmF3vGfDOEU+6kjHyS
         GfS+zqdJKwOsbWHqYbR4wGeD6b5Q0RTH1IDWV92Sj2P6+z0y7y9nzEXnVejnJlWpXiRX
         VFbPo+SPGjwHqdpiDwMcl24ksUJgf1BAfHtij5zhwEusyRlmtB5YHFgX8MqljTepSoJK
         19/sbNg7zrBalz1WZKdoW+SGEyWZJehRauJ13B58TaSuaXClLQTTeCYSp2Q1Ld+fr/+w
         pRQm8CZu1lz/1S1Ux5G6Cm2k9HfHKBZopgrTzukQepqN6ZaIazaEOQ3Gq8Dl1f9r9i+i
         KZtQ==
X-Gm-Message-State: AOJu0Yy8I/azbpm64p6rGijFeJGeiIZCUzRoJhppa7tk2zxmpGZGbhVQ
	/Zey7d8G3jDD75b7Wy8eHp/w4ehTXeoV38wKLI+BD8ngRm8Qgu7w9XHlD8WZNik=
X-Google-Smtp-Source: AGHT+IFlj1JEv61tU6U68LM4szDGhtwfrlmBlU2VCCZKXudbxQzJ6UD0hVReDf4r6vtpBm9z+cI9wA==
X-Received: by 2002:adf:ec4d:0:b0:34a:2852:f119 with SMTP id w13-20020adfec4d000000b0034a2852f119mr885381wrn.36.1713516610020;
        Fri, 19 Apr 2024 01:50:10 -0700 (PDT)
Date: Fri, 19 Apr 2024 10:50:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <ZiIwQEyU4d9zDctN@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>
 <f178e1fb-0b6f-4312-a483-b85f413db025@perard>
 <0f89a920-c834-4a51-9b53-8e94ba7e3664@perard>
 <a8789951-4693-4ffe-9942-cd18f214e029@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8789951-4693-4ffe-9942-cd18f214e029@perard>

On Fri, Apr 19, 2024 at 09:34:21AM +0100, Anthony PERARD wrote:
> On Mon, Apr 08, 2024 at 10:29:08AM +0100, Anthony PERARD wrote:
> > On Fri, Apr 05, 2024 at 04:54:30PM +0100, Anthony PERARD wrote:
> > > On Thu, Mar 28, 2024 at 05:54:04PM +0000, Anthony PERARD wrote:
> > > > On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:
> > > 
> > > I've now pushed
> > > "production-config: Set Bookworm's debian-installer version"
> > > 
> > > and these two:
> > > 
> > > > >   Switch to Debian Bookworm as default suite
> > > > >   make-hosts-flight: default to bookworm
> > > 
> > > osstest should start to use Debian Bookworm soon.
> > 
> > osstest failed it's own push gate, I didn't notice that the Arm* builds
> > was still using an old kernel (from our linux-arm-xen branch) instead of
> > 6.1. So I've rewind this push and pushed an other fix instead:
> > https://lore.kernel.org/xen-devel/20240408092542.36711-1-anthony.perard@citrix.com/
> 
> I've pushed the switch to Debian Bookworm again, and this time it when
> through.
> 
> osstest have started to use Bookworm for testing.

Thank you very much for doing this.

Roger.

