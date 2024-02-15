Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EC85620F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 12:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681611.1060456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaCL-0003Sb-LM; Thu, 15 Feb 2024 11:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681611.1060456; Thu, 15 Feb 2024 11:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaCL-0003Pm-I6; Thu, 15 Feb 2024 11:46:37 +0000
Received: by outflank-mailman (input) for mailman id 681611;
 Thu, 15 Feb 2024 11:46:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raaCK-0003Pg-BE
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 11:46:36 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de2c372f-cbf7-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 12:46:34 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d1025717c7so8217361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 03:46:34 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 v9-20020ae9e309000000b00785a9820313sm521912qkf.84.2024.02.15.03.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 03:46:33 -0800 (PST)
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
X-Inumbo-ID: de2c372f-cbf7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707997593; x=1708602393; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aaq7lSzJZGT0yqG0vRNN27MHOu3dbKZpL/7fwErPFYA=;
        b=ngaj35AKLsbAY2lt2Vft030h7kLRjwEMX8Xbp1kd/iJBkfWCPKwjHiWvCBOSPJjY+i
         xuSo1hT6UPjD2vGXupg+3iNT7fTAUwuIC1mmZzJ5PbOfJ1Yy4FTmWNdab8ys9/HkmiAH
         X3YZa94pyZj61enVpZn5NaLerV3znpzNGcXMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997593; x=1708602393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aaq7lSzJZGT0yqG0vRNN27MHOu3dbKZpL/7fwErPFYA=;
        b=UZ44n/rbSagUDJIbXBGi6Vf4sGL0rrUCwNtD32BT+truCI3Z7JuqTzBWxkMta4wwV4
         YiGon7tzFU7UAEz4PIfxxZgSgIA+O8GNJogcYm+ytlz+UlVaQxM4VCL/SSkcCUS6j5AK
         j0vcn9JsKkKTnioizA6jmv+riTg8z19EndtByWN6xvPPWOIy8AjzVvv1FB5PCBeCtfrQ
         9XImxavfaO3YaVrNsvn5oMXdhmrgvq29eaeJRvEZx2agfyZSPh0bOZvw7Z9ejoNn4Zlg
         znk9U0c14UzYOTObcGlbxhK5/dlDGz2tOcNMHKDQr5LDG8h2+PBBeAMo7UCRi2GY9P2h
         CzLQ==
X-Gm-Message-State: AOJu0Yy3oSlswUZlfZ4um+7IwFzsjvHcez2tasso7WIoby34//B8gdAN
	lISyi1upCp/X4cISA0m3oFpDKx2SKCAdctkBYOYgHZD3I/Fn3pclab42nvIJskM=
X-Google-Smtp-Source: AGHT+IFpMT84NbS+1BRX+5wb7p+xDlqF5b0dTAnRwAiHGq1SM3xxlpRzCRS7bLRufjGO8kbKm0AflQ==
X-Received: by 2002:a2e:984c:0:b0:2d0:e298:25d4 with SMTP id e12-20020a2e984c000000b002d0e29825d4mr1117664ljj.16.1707997593512;
        Thu, 15 Feb 2024 03:46:33 -0800 (PST)
Date: Thu, 15 Feb 2024 12:46:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc35ljv5XYzXGV2P@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <23f82e89-d5b5-4b95-bbf9-be0a76a15cc1@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23f82e89-d5b5-4b95-bbf9-be0a76a15cc1@perard>

On Thu, Feb 15, 2024 at 10:32:57AM +0000, Anthony PERARD wrote:
> On Thu, Feb 15, 2024 at 10:30:02AM +0100, Roger Pau Monne wrote:
> > When doing a rebuild with an xen/include/config/auto.conf already present in
> > the tree, failures from Kconfig are ignored since the target is present:
> > 
> > gmake -C xen install
> > gmake[1]: Entering directory '/root/src/xen/xen'
> > tools/kconfig/conf  --syncconfig Kconfig
> > common/Kconfig:2: syntax error
> > common/Kconfig:1: invalid statement
> > gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
> >   UPD     include/xen/compile.h
> >  Xen 4.19-unstable
> > gmake[3]: Nothing to be done for 'all'.
> > gmake[2]: 'arch/x86/include/asm/asm-offsets.h' is up to date.
> > 
> > Ultimately leading to a successful build despite the Kconfig error.
> > 
> > Fix this by first removing xen/include/config/auto.conf before attempting to
> > regenerate, and then also make xen/include/config/auto.conf a hard dependency
> > of the build process (ie: drop the leading '-') and reordering so the .cmd
> > target is executed before including the configuration file.
> 
> Could you try to revert commit 8d4c17a90b0a ("xen/build: silence make
> warnings about missing auto.conf*") instead? With a much shorter message
> like "Don't ignore Kconfig error anymore".

Yes that seems to solve it also.  I guess the point is that for the
target failure to stop execution the include that triggered it needs
to be non-optional (so not - prefixed).

I'm unsure about the consequences of reverting 8d4c17a90b0a, so would
prefer if you could take care of that.

Thanks, Roger.

