Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51D7EAC5B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632212.986369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pIH-000298-0U; Tue, 14 Nov 2023 09:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632212.986369; Tue, 14 Nov 2023 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pIG-00027T-Tf; Tue, 14 Nov 2023 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 632212;
 Tue, 14 Nov 2023 09:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GB7=G3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2pIF-00027L-IT
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:01:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a02daf1-82cc-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 10:01:09 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so36546575e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 01:01:09 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c320900b00407b93d8085sm16211069wmp.27.2023.11.14.01.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 01:01:07 -0800 (PST)
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
X-Inumbo-ID: 5a02daf1-82cc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699952468; x=1700557268; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUGhZEgj+tTwcbEJ5oblpH8Ps3IBPADAPD2tO/yiRCM=;
        b=TeqT4t0+gIwe2+EgSMCWUx8nvrlRI3Xm/lvZMLL9AGXneckrUSIcrFgfgBwecGvzCM
         dFTxK23HRgm8g8WwCWxvvPa1YCrLqb4Hkgc74+f9LMGJC0fEQddN++n9Fb0jpAqEk5CA
         2V7L5zaN8jvvF6HqPGfTXE1fLHCogp++TAN6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699952468; x=1700557268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUGhZEgj+tTwcbEJ5oblpH8Ps3IBPADAPD2tO/yiRCM=;
        b=ibfl2PFqScLdQYcbQNthPoviIYoDA2HWoQXxiaaylEQ5zywDxMyuFAsDPgdgMg2Qf2
         vbOFBxO1WEnr/ltPrc3ADGCyPmFT2VhGzBQLeP9bzR1Bji577dx65kI/xBHGLQ9xgZOq
         E8vdfaFnEj3TXM7BR0lwy4/df2nRSjCC4Omf6JY8GopJ7WDbWCps1Yw+VvDBNP/fE1AJ
         gn8SuvT4mxuCKkFBnSeKV0lKttDPGAK8/NakZ9fZLrawcKEBgRVXa1feyhOMVz89XKM/
         LLanRrJqVCGhgoswyqgTWoI6p+dT1JYBTNlqNaR5cVTuWTsVdtYU7//ItyPADHbubGsk
         js9g==
X-Gm-Message-State: AOJu0Yyltb/KxrlvXNDp2xZxMTGrcc9W7F27RZlfs7e3fdMS3dwG8KWI
	tylL3cHVTwcRLjv0P96e7/pwawhVRGVOixCeWak=
X-Google-Smtp-Source: AGHT+IGOWmqBY9VX7kdhweiW31V8M+Re1m1spmSHoJxy43F13N5fOdrC9auyrWrWCVWDC/4YYvDGGQ==
X-Received: by 2002:a05:600c:c07:b0:408:33ba:569a with SMTP id fm7-20020a05600c0c0700b0040833ba569amr1670248wmb.8.1699952468612;
        Tue, 14 Nov 2023 01:01:08 -0800 (PST)
Date: Tue, 14 Nov 2023 10:01:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: set architecture in docker files
Message-ID: <ZVM3Ujf1nsws3Mxr@macbook.local>
References: <20231113155701.52052-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop>

On Mon, Nov 13, 2023 at 04:10:24PM -0800, Stefano Stabellini wrote:
> On Mon, 13 Nov 2023, Roger Pau Monne wrote:
> > Pass the desired architecture of the image in the FROM instruction if the
> > image is possibly multi-platform.
> > 
> > This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Although I am not opposed to this change, so far we have been using:
> arm64v8/alpine:3.18
> 
> for x86 it is not specified but it would be:
> amd64/alpine:3.18
> 
> Two options:
> 1) we add amd64/ everywhere and leave the arm containers alone
> 2) we change all containers, including the arm containers, to use the
> --platform option
> 
> I don't think is a good idea to have 2 different ways to specify the
> architecture for x86 and arm containers

I'm not an expert on this, but attempting to use (2):

-FROM arm64v8/alpine:3.18
+FROM --platform=linux/arm64v8 alpine:3.18

Does not work for me:

% make -C automation/build alpine/3.18-arm64v8
docker build --pull -t registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8 -f alpine/3.18-arm64v8.dockerfile alpine
[+] Building 1.4s (3/3) FINISHED                                                  docker:desktop-linux
 => [internal] load .dockerignore                                                                 0.0s
 => => transferring context: 2B                                                                   0.0s
 => [internal] load build definition from 3.18-arm64v8.dockerfile                                 0.0s
 => => transferring dockerfile: 818B                                                              0.0s
 => ERROR [internal] load metadata for docker.io/library/alpine:3.18                              1.4s
------
 > [internal] load metadata for docker.io/library/alpine:3.18:
------
3.18-arm64v8.dockerfile:1
--------------------
   1 | >>> FROM --platform=linux/arm64v8 alpine:3.18
   2 |     LABEL maintainer.name="The Xen Project" \
   3 |           maintainer.email="xen-devel@lists.xenproject.org"
--------------------
ERROR: failed to solve: alpine:3.18: no match for platform in manifest sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978: not found
make: *** [alpine/3.18-arm64v8] Error 1

That's why I've left the prefixed images alone.

I could prefix the x86 images with amd64/ if that's preferred, I
didn't try that option, as the Docker manual suggested using
--platform.

Thanks, Roger.

