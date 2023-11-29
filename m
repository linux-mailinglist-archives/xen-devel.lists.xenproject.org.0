Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A667FD78E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 14:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643910.1004472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8KL4-0003nq-Nf; Wed, 29 Nov 2023 13:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643910.1004472; Wed, 29 Nov 2023 13:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8KL4-0003k4-KO; Wed, 29 Nov 2023 13:10:50 +0000
Received: by outflank-mailman (input) for mailman id 643910;
 Wed, 29 Nov 2023 13:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0D6=HK=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r8KL2-0003jt-JG
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 13:10:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b505bc2a-8eb8-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 14:10:46 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso5632565e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 05:10:46 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fa16-20020a05600c519000b0040b36ad5413sm2157720wmb.46.2023.11.29.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 05:10:44 -0800 (PST)
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
X-Inumbo-ID: b505bc2a-8eb8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701263446; x=1701868246; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4X50eZOhWvmWJmUVFU8wVducMdwYXFMWcMkpWAQFcu4=;
        b=J3bDoZGw5dyS0sJx4UBZcvKwv0uG5ewME8H0Z0Thhc8yeBpNBIfDnMYD5VDPWXHZ+F
         qP9dVq3uCNc/iRYfYrJf7b62d0jZlNcsS4XCR6Rd2f27tYSHQ4h6m9NvElp6Et0wrdG8
         lZez60UoU1FnwzmE6kQmtX4tFxF1PWEZALeuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701263446; x=1701868246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X50eZOhWvmWJmUVFU8wVducMdwYXFMWcMkpWAQFcu4=;
        b=TtUv6Yziy6uf91X/LO1MJ/3zIlwt/GKl4HzTQSIqlrIVmVzanO937MW7C4GWAfy0n3
         wjlPZkFq16q94P4LfPySTMpQ59vndjQOsomo9+jrMb/SY6ak8XAOvhtsN8PQAo33DpZ7
         rulp1a7UOzNCmBGPOq4FzBkQjt916qlQS/eZpQ7DxncZDCZAjL+UzoBIIa2c0Mr8Xlut
         HIsUwtLu9zPtKwYrfqoSVU8H9ThRORf6k7ekJ0S2utsup2LtWW/Nr3sqkYi+NkuYGT/z
         n52XbJufw6Zl2YiginvhKK44jpT97iRtA1fcZA48Se2Awd7xiWwYpJAeuoUJI+2MJ62o
         cCmA==
X-Gm-Message-State: AOJu0YySI+OqW4Et+TQti3G8zocrtaQOnFfgrCYQhqPUlE5zcFRHD+xP
	5+yM94VASVJG7EoL6nvgA1kk2g==
X-Google-Smtp-Source: AGHT+IFRmjRQhBGiR/vf0okQ1Bh4X0ncYDuqYhkuCsxj+KDIepYPZ/F8+1wTFJGtw5apFeCwnupdhA==
X-Received: by 2002:a05:600c:3c95:b0:40b:51c7:7ad7 with SMTP id bg21-20020a05600c3c9500b0040b51c77ad7mr2037154wmb.18.1701263445291;
        Wed, 29 Nov 2023 05:10:45 -0800 (PST)
Date: Wed, 29 Nov 2023 13:10:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Alexander Kanavin <alex@linutronix.de>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Message-ID: <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>

On Wed, Nov 29, 2023 at 11:47:24AM +0100, Julien Grall wrote:
> Hi,
> 
> + Anthony for the tools
> + Juergen for Xenstored
> 
> On 29/11/2023 11:34, Alexander Kanavin wrote:
> > On 11/29/23 08:51, Jan Beulich wrote:
> > 
> > > On 28.11.2023 18:47, Alexander Kanavin wrote:
> > > > Such constructs are fully allowed by C99:
> > > > https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
> > > There's more to this: It may also be a policy of ours (or of any
> > > sub-component)
> > > to demand that declarations and statements are properly separated.
> > > This would
> > > therefore need discussing first.
> > 
> > The error is coming from python 3.12 headers and not from anything in
> > xen tree, no? As you don't have control over those headers, I'm not sure
> > what other solution there could be.
> 
> We seem to add -Wno-declaration-after-statement for some components in
> tools/. So one possibility would be to move the flags to an hypervisor
> specific makefile (in xen/).

You mean xen/Makefile I hope.

> Anthony/Juergen, do you have any concern if the tools are built without
> -Wdeclaration-after-statement?

I don't, and as you said, there's already quite a few
-Wno-declaration-after-statement.

It can be nice to add a new variable in the middle of a function, it's
like creating a new scope without adding extra indentation (if we wanted
a new scope, we would need {} thus the intend).

Cheers,

-- 
Anthony PERARD

