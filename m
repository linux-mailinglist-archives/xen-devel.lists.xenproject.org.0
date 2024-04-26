Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C18B3128
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 09:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712480.1113208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Fne-0004UT-7L; Fri, 26 Apr 2024 07:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712480.1113208; Fri, 26 Apr 2024 07:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Fne-0004SS-4g; Fri, 26 Apr 2024 07:15:14 +0000
Received: by outflank-mailman (input) for mailman id 712480;
 Fri, 26 Apr 2024 07:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Svmy=L7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s0Fnc-0004Qe-8v
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 07:15:12 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b73f5415-039c-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 09:15:10 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7906776e17aso120733085a.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 00:15:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 w2-20020ae9e502000000b0078ec3aa9cc7sm7748827qkf.25.2024.04.26.00.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 00:15:08 -0700 (PDT)
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
X-Inumbo-ID: b73f5415-039c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714115709; x=1714720509; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deOWyKjYW/jQYIfV3gLfpN1OqozgexBNat4UAll8F+E=;
        b=SsGdBov4N8b9Kn9omnu44CKO+eYAVbnOUmhgS4YT/TZSwwP77r23vaTNX6UWHeNwwI
         t2cxj1rY8gN+mIW2vxff1KwXXw3Nuvi63kU36Mekqziz5fqLrW9OKxwhbLLDj2byOGm/
         w8B+m8bfwmpr9mxvJGMqYBtFNP4NEY6OWDgoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714115709; x=1714720509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deOWyKjYW/jQYIfV3gLfpN1OqozgexBNat4UAll8F+E=;
        b=dW+rrGhlrHJkMDoxX7yKUZiRf+Imvr4oZROuvm+tRTzkPW795egz6N7LaMorXG+paG
         Ik5oAR9IM1E99FVGnDTyhRi0MV+y33Asxo6Rs7euBdy+xjXz1fBkQ1uzKo5GWa5GDBgl
         D76nO9tBj6Zn9UjiJ6X/2nY0bhLJAVCEFpkzFGDWrdbL/L5d1gbENVdCjulWP2LQhyMQ
         O4rkB4rR0BxD3m6zNj7r+WcSvrUBV0bvTNfLyFCUpyR+A5U8LkCN2FHcUrz/OefOKpx+
         Kyik/t7uuy2DkDFzYp7E5X3P8k7rERcnr3T+NodL8jK3eTsa6F2BP2xPYTmsTISjU1BT
         4SeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU201SQrgLeHISSxlrdlpuBXjXcduVtO/0o69cMT4ryuEf97Pfghk3dnmNoOCICAM7P+nhtHDVs0NvaZczbmgRC4OlmqQAU83fMiK6Y4Is=
X-Gm-Message-State: AOJu0YzWdZ7UMpzvHIWHGF8vedi/s5CEDDS81Kds4CI3NN0KiKUSY9DR
	coFxj6nq4JER1dxGLWYjBUG9Toh0wGA/VHGxMLxpOvOZohYhu/M1RZi9zcq79Pg=
X-Google-Smtp-Source: AGHT+IHtac1x+2okMIOH+Hnc0f3s0D5GWOt1xoE90SPIkSQ0Qn4HcFOpm6VtjJAh/2l6CY/a25vuLg==
X-Received: by 2002:a05:620a:a4b:b0:790:6b89:6a08 with SMTP id j11-20020a05620a0a4b00b007906b896a08mr1878021qka.73.1714115709050;
        Fri, 26 Apr 2024 00:15:09 -0700 (PDT)
Date: Fri, 26 Apr 2024 09:15:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/4] livepatch: introduce --force option
Message-ID: <ZitUeq8ugOKHb_QA@macbook>
References: <20240424081957.34326-1-roger.pau@citrix.com>
 <20240424081957.34326-3-roger.pau@citrix.com>
 <a7dd1c1e-76b8-437e-bfbc-111a904ab861@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7dd1c1e-76b8-437e-bfbc-111a904ab861@suse.com>

On Fri, Apr 26, 2024 at 08:41:48AM +0200, Jan Beulich wrote:
> On 24.04.2024 10:19, Roger Pau Monne wrote:
> > @@ -571,6 +575,19 @@ int main(int argc, char *argv[])
> >          show_help();
> >          return 0;
> >      }
> > +
> > +    if ( strcmp("--force", argv[1]) )
> 
> I guess this missing ! or "== 0" is the reason for osstest reporting a
> livepatch-run failure.

Bah, seems like I dropped it when changing from strncmp to strcmp, as
it's present in v3.

Will send a fix ASAP.

Thanks, Roger.

