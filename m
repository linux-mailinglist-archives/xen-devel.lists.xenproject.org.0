Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69273A1F2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 15:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553580.864214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKVG-0005hO-Dm; Thu, 22 Jun 2023 13:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553580.864214; Thu, 22 Jun 2023 13:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKVG-0005fj-B7; Thu, 22 Jun 2023 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 553580;
 Thu, 22 Jun 2023 13:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCKVF-0005fb-Jn
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 13:37:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23f4335-1101-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 15:37:35 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f9b4bf99c2so40990315e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 06:37:35 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w21-20020a1cf615000000b003f8126bcf34sm18765151wmc.48.2023.06.22.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:37:34 -0700 (PDT)
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
X-Inumbo-ID: f23f4335-1101-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687441055; x=1690033055;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKtNqEa7eNDf4aw7mZRTRzS9lwyviaBYqS0V4KP7yeg=;
        b=iqt/u6MA3IQsK8oaozcKOC3JAGTVaYF04eW6LATQQIR2cPMgW2Qt5vJ/2JQ5pYEf3Q
         9Lw2vjB25DAj3HcOu+avbVZ9fTsSVfoVyE4PXaqMtVBybjptugLLeGVCR+L8QJu7jSv7
         1GCdLynf1oz7vZaTh1bBRwcrcwJ3cy5DfI5Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687441055; x=1690033055;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKtNqEa7eNDf4aw7mZRTRzS9lwyviaBYqS0V4KP7yeg=;
        b=CEIhCn+4zKyu2FVm70HxTvy7css6xs21qUDXzpajXKq3TvEKrnWgWSvL4EgvMV7sZs
         F3Bl0ghRei1Q2kiJKXceYTxbE96bVYmiabrXWLIJnm1xMHoR+js0G2pEjRHHX/d2U2s6
         9LCXBI1GxUK8lNSG14giX0gIRlq6qfxfQ9uRvTiZe9MzobVmZi5YjVn+mERoTsXPplXB
         U6xxFIMZMCdZal7NiuxQuQBtYeRuBjC5lMUnf/r6N+OANG7MW8f2YzXbMkNYYOlW8NXG
         tS2jOuA5rb1epsorGGC1pRF3j+aIvUWnHgMSc3XO2WBdmR3khxDGgRMIyrsYRkOBHr/O
         98sg==
X-Gm-Message-State: AC+VfDzfl6TGX+uvA+DkEnHiS1QLxDOJ5mKqWN5e3TsyuaopUBP9gohB
	s/au6GssmQqdhKM2KaurrvOg9g==
X-Google-Smtp-Source: ACHHUZ6J0BARQhNefgfBP1bTCrXLtba0bc07rPR7z2IuKbWfZgqyQLSzxeKkV17Z+aY+aGJ6swBNkg==
X-Received: by 2002:a7b:cbcd:0:b0:3fa:74bf:f028 with SMTP id n13-20020a7bcbcd000000b003fa74bff028mr1083655wmi.0.1687441054818;
        Thu, 22 Jun 2023 06:37:34 -0700 (PDT)
Message-ID: <64944e9e.1c0a0220.2e6f8.2c96@mx.google.com>
X-Google-Original-Message-ID: <ZJROnY516v37buzC@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 14:37:33 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
 <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
 <64930879.1c0a0220.28719.ce38@mx.google.com>
 <692b3db7-dfe8-8ed7-71e5-b29dcbba7f1c@suse.com>
 <649440e5.050a0220.708ad.038d@mx.google.com>
 <81f00083-0170-9189-19c7-c8385f7173cd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f00083-0170-9189-19c7-c8385f7173cd@suse.com>

On Thu, Jun 22, 2023 at 03:28:14PM +0200, Jan Beulich wrote:
> > Unless I'm missing some non-obvious piece of the puzzle, I'd say that for a
> > truly general compressor we'd need some kind of loop over the hole mask.
> 
> Well, further compression might be possible that way, yes, but that's
> entirely orthogonal to the number of discontiguous regions we're
> talking about. Consider
> 
> 0x0000100000000000-0x00001000ffffffff
> 0x0000200000000000-0x00002000ffffffff
> 0x0000300000000000-0x00003000ffffffff
> 0x0000400000000000-0x00004000ffffffff
> 
> The reference system's arrangement was slightly more complex (first and
> foremost because of the memory below 4G that node 0 had), but came close
> to the above conceptually.
> 
> Jan
Ah, I now see what you mean. A single hole can compress several regions if
they are all share sequences of zeroes. Fair point. I'll reflect that in that
paragraph.

Alejandro

