Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443C66D9FB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479254.742987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiJE-00045Q-4T; Tue, 17 Jan 2023 09:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479254.742987; Tue, 17 Jan 2023 09:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiJE-00042P-1p; Tue, 17 Jan 2023 09:31:12 +0000
Received: by outflank-mailman (input) for mailman id 479254;
 Tue, 17 Jan 2023 09:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Is34=5O=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1pHiJC-00041y-UX
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:31:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac77fbfb-9649-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:31:09 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id mp20so27314023ejc.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 01:31:08 -0800 (PST)
Received: from gmail.com (1F2EF7EB.nat.pool.telekom.hu. [31.46.247.235])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm3073376ejg.223.2023.01.17.01.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:31:07 -0800 (PST)
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
X-Inumbo-ID: ac77fbfb-9649-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdnu+i46i2gnFS4iiJrllb1w2/cjIXrWKzQRHis/CFU=;
        b=J1vTmhiewt53nz0Aw/xd1Nkmv7FSoF283O3i2YTmIIqDBDOic1wlubmcsmDvQxDvO4
         QJJRMt5X9KB8BosQozglpBSaVcfQLVyazmkMvi/2G81lxgBFUGc6AKAr8/cFDxO23ada
         qJPsjKGuFDUhQ0womaUeXwkVfLpNp8fvvNK3Qf+fmrZV4I+Rm9Vf+Sog7ZOY1lk7Z7Zo
         O7aH+phliKhjKAsepC1stYUeuxBiwV1ymu+3Jj8Tp0YbmfxH8q2e9wemDFD892gfzbI5
         Hng8xTaD6TkJqzNTURbkAXfzMiuC6YuIkirf7yqoNz2mjydfVWSCXtDnmYXo/hguNMXq
         Xm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdnu+i46i2gnFS4iiJrllb1w2/cjIXrWKzQRHis/CFU=;
        b=Rioi1VLR8FW7W/cotvHzwiTNhf0D9HT4tH3OoXsJX8QTAQankFuRB4yjEcJXl672+c
         ux1hmFaCaTMwA4pcTB7Un5SwFUTybmabr4sDvcW2oftyCBpXsVYe/3j0I9KI/6qJHsEo
         eefH4vyLYgaeOMKdy826Cwl7g04NgLQkV7f+DOkijDTUYiGYA7RW1xVJXE73LeuCe4Go
         BBQH+UWSqct8MN7ey/OeVGx/s1vPuzYEDY4fjjXTqMPJdoGEBzRRQAUq5y5+1+q+SkwS
         gWkUt+puH50Az+C/zNV3vZUGhSlrG1RkH57zHK4hFD2D2ppGPXoZHChKimA09cd52KQF
         T0wg==
X-Gm-Message-State: AFqh2koMAZv9PMYfV4QHZrkpqbtR6WFTh4gW9/uF+CMw6qJtdgIt+38i
	VUuZRIWr39m0c49Fask+mO0=
X-Google-Smtp-Source: AMrXdXvAbl6az2nEprKe4qbBEkiakEEniymcQ+bk8FYAhM2poQzyIc90typ8o1yTNjA99vtnWkmtJQ==
X-Received: by 2002:a17:907:20e9:b0:7c0:dcc2:e7b1 with SMTP id rh9-20020a17090720e900b007c0dcc2e7b1mr2127024ejb.43.1673947868545;
        Tue, 17 Jan 2023 01:31:08 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 17 Jan 2023 10:31:05 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 6/7] x86/power: Sprinkle some noinstr
Message-ID: <Y8Zq2WaYmxnOjfk8@gmail.com>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.888786209@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116143645.888786209@infradead.org>


* Peter Zijlstra <peterz@infradead.org> wrote:

> +	/*
> +	 * Definitely wrong, but at this point we should have at least enough
> +	 * to do CALL/RET (consider SKL callthunks) and this avoids having
> +	 * to deal with the noinstr explosion for now :/
> +	 */
> +	instrumentation_begin();

BTW., readability side note: instrumentation_begin()/end() are the 
misnomers of the century - they don't signal the start/end of instrumented 
code areas like the name falsely & naively suggests, but the exact 
opposite: start/end of *non-*instrumented code areas.

As such they should probably be something like:

	noinstr_begin();
	...
	noinstr_end();

... to reuse the nomenclature of the 'noinstr' attribute?

Thanks,

	Ingo

