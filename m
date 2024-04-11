Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC758A12E4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 13:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703856.1099765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rusXw-0002ez-QO; Thu, 11 Apr 2024 11:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703856.1099765; Thu, 11 Apr 2024 11:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rusXw-0002dE-Nk; Thu, 11 Apr 2024 11:24:48 +0000
Received: by outflank-mailman (input) for mailman id 703856;
 Thu, 11 Apr 2024 11:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04oP=LQ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rusXv-0002d8-LX
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 11:24:47 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a02f15c-f7f6-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 13:24:46 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so793191f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 04:24:46 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b003418364032asm1538368wrp.112.2024.04.11.04.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 04:24:45 -0700 (PDT)
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
X-Inumbo-ID: 1a02f15c-f7f6-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712834686; x=1713439486; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfJsaR1TfK10rq4u8nVeQwNlrJ8dME5xcDhqJYgYsfM=;
        b=TsAXn1Mi082oBGsNANb08arBkJNDxoP+2KhQYS0zUOYGHkD6E2j0QKPUhr2U4NiA/5
         NbecowDFrGgyblx0OJWQRHMHYqihZi4bTvXZalQVvwmwwakbg4EFk5BOxEj2pQqU+jXx
         ORgTSndV6FK8pHnPKMZPy/g/wv35XJW4Ax+xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712834686; x=1713439486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfJsaR1TfK10rq4u8nVeQwNlrJ8dME5xcDhqJYgYsfM=;
        b=hpBYQAvPAhEelC3b1KifDF0k8JfoO2igENr9TKrEQ/TUF2iipRXv9bir9josW8LZau
         M4JegUiS4FU1b7NOF1JcdcJ72mLBP6remgraIkaDlUPIYqHvmH8VfmlDWc4uwWR+68gb
         3TnAgM5IE+RZ9d34hHgYfxcj88AyS8VDhwW/R6tEd4PBHLIqmE8qeW7Y0NhRY1qh8CHp
         bP9jzLxQf2kd5zaoxr/YY495uQTkYiArVFeOBqPwpRH5RsIzVBaC7Ibp1vmktbS75cCl
         y7lzesIJFELraIGn9UOY+IUH4q1L2OiM0XCPdKen/vcnGIRELd6XiQ5lcUELA821ExSM
         Qcew==
X-Gm-Message-State: AOJu0Yz6tPMcKoWWYE6VGgttTluW+WSS7iE72coT5im8EFJH529vAIkt
	PZeNuNAe9JnLkNm6l3zk9IQG5bobe8PfHx4g9GNLEaTt1A0RyDg3qhp/PSQrllk=
X-Google-Smtp-Source: AGHT+IFx7ZBxbc5aR/v8iRsdOJRQ2RA+HFh/uCOct3t4Fv4w1it+/pG6kNOY/HtbQdaVSmZptWIEow==
X-Received: by 2002:adf:e7c8:0:b0:341:a640:b516 with SMTP id e8-20020adfe7c8000000b00341a640b516mr3342286wrn.70.1712834686130;
        Thu, 11 Apr 2024 04:24:46 -0700 (PDT)
Date: Thu, 11 Apr 2024 12:24:45 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v1 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to
 env var
Message-ID: <e8103b89-c324-46a3-b58a-dc8253acee53@perard>
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
 <c00304a2-f990-4fb3-9276-7f4907b583ea@perard>
 <CAAjaMXbhjQT-PFJmYBOyXWbOwMKsUEa964+svR8XkJ-tYQ4a+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjaMXbhjQT-PFJmYBOyXWbOwMKsUEa964+svR8XkJ-tYQ4a+g@mail.gmail.com>

On Thu, Apr 11, 2024 at 01:23:07PM +0300, Manos Pitsidianakis wrote:
> Hello Anthony,
> 
> I do know about that, in fact I used it and it did not output your
> email. Here's what the `get_maintainer.pl` outputs: (same output for
> all patches):
> 
> $ ./scripts/get_maintainer.pl --no-l
> ../../patches/libxl-dm-timeout-v1/v1-0001-libs-light-add-device-model-start-timeout-env-var.patch
> Andrew Cooper <andrew.cooper3@citrix.com>
> George Dunlap <george.dunlap@citrix.com>
> Jan Beulich <jbeulich@suse.com>
> Julien Grall <julien@xen.org>
> Stefano Stabellini <sstabellini@kernel.org>

Oh, sorry, I didn't realise this was "THE REST" that is the list of
default maintainers.

So for some reason, the script fail to parse the patches to find which
files are modified. And I think I know why. Usually, `git format-patch`
output something like:
    diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
    index 4369fef161..9ffdd50c69 100644
    --- a/tools/libs/light/libxl_dm.c
    +++ b/tools/libs/light/libxl_dm.c
with all path starting with "a/" or "b/", which get_maintainer then
strip. (It strip them from the "diff --git" line, but remove the first
"directory" from the path for line starting with "---" or "+++".)

The patches in this series instead look like this:
    diff --git tools/libs/light/libxl_dm.c tools/libs/light/libxl_dm.c
    index 4369fef161..9ffdd50c69 100644
    --- tools/libs/light/libxl_dm.c
    +++ tools/libs/light/libxl_dm.c
with "a/" and "b/" missing, and that confuses get_maintainer.pl. It
tries to find maintainers for "libs/light/libxl_dm.c" which don't exist.

Did you by any chance used "--no-prefix"? It doesn't seems worse it to
handle this case as I'm guessing more than on tool rely on those.

Cheers,

-- 
Anthony PERARD

