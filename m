Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E566DCF0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479365.743173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkYF-0001zb-Vb; Tue, 17 Jan 2023 11:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479365.743173; Tue, 17 Jan 2023 11:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkYF-0001xI-SZ; Tue, 17 Jan 2023 11:54:51 +0000
Received: by outflank-mailman (input) for mailman id 479365;
 Tue, 17 Jan 2023 11:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Is34=5O=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1pHkYE-0001xC-2t
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:54:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be7c6cef-965d-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:54:49 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id tz11so10370306ejc.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 03:54:49 -0800 (PST)
Received: from gmail.com (1F2EF20B.nat.pool.telekom.hu. [31.46.242.11])
 by smtp.gmail.com with ESMTPSA id
 ed6-20020a056402294600b00499e5659988sm7369870edb.68.2023.01.17.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:54:48 -0800 (PST)
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
X-Inumbo-ID: be7c6cef-965d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOTlX+2xkK1p+GnUE+ayQ0fDfjp/RAyyCQOOAvZYkGM=;
        b=q4QnDoUEQYCba0P9MfjTlEKkl7lCSelI40pAA4jAdOmMC1oAM3FllECRDClUfPVFbP
         PnW5gLo4kMoOdLLDtLwPYLR6Aao8uDm+YFN867efw9lzEzRJg6MshN/+ScEheHYnByNv
         jUsVlnfuU91TqZtqHCMVJt3m8awpCzNoqH//WBqgrkluuqGEjoYpa9IlclTbK6SOqhFM
         i+dkG7TqXcFUu/DGmTGUkp85E0UsFOPCrz6GvqdaY00GIUxHz8PmT2izI5NJeXRwqrf9
         AyLILS4Z6lmVMhAOIbMROAtG1MoLbx2g1tS+6E0ieu8FgLy6VRbawgpCNpc/ZPD3UygR
         k3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOTlX+2xkK1p+GnUE+ayQ0fDfjp/RAyyCQOOAvZYkGM=;
        b=5AG6LcPD8f63EsWDnZEnHiCBMiAWh6+Dv9nXalQgKqWlCwVK5d1twdkebQOLB2ioSN
         0DSSnu6FghG2qMSAi2NWzNI2Erv1zPHBGUV2EAXpm4BjIa2i4OMVWJSfcshs8M18TJFD
         VpRCPgpc9bI/1Dkr+xvcaoGjmbi1uPKF3AnM4pOuZsgxEBNc/+z9IUrDaihg2uXLqHIS
         Jqvn+WBiw861mCpVf0mag1OKZquhMXSMKvSBGx7z9vSLO+sl4qW/yP+vVqESarFvFAXE
         Azka3zyaxxF54a3AIOhO1bFub+SrFRRtNhOmd7BlJkf9uaC1HKTvYEW+Od8Idl55ZZiG
         UoZQ==
X-Gm-Message-State: AFqh2koSdl/o+iVQH2fpvrxWY7iEepBvzURXCSL/Ma8xIxflI4InbJOc
	VcFeZbfM1i+sxi2CF8BycsM=
X-Google-Smtp-Source: AMrXdXte64K/uel2SaxiSjwgohbfF0SMbp29SRu/54hYnBRnxBmiku+YJvwFUpzRlNSfAzolYRJIGA==
X-Received: by 2002:a17:906:80cd:b0:86d:b50f:6b00 with SMTP id a13-20020a17090680cd00b0086db50f6b00mr2326176ejx.43.1673956488708;
        Tue, 17 Jan 2023 03:54:48 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 17 Jan 2023 12:54:46 +0100
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
Message-ID: <Y8aMhihmrahvFnrU@gmail.com>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.888786209@infradead.org>
 <Y8Zq2WaYmxnOjfk8@gmail.com>
 <Y8aGpHgSOczqeEHf@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8aGpHgSOczqeEHf@hirez.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> Nope, they do as they say on the tin.
> 
> noinstr void foo(void)
> {
> }
> 
> declares the whole function as non-instrumented.
> 
> Within such functions, we demark regions where instrumentation is
> allowed by:
> 
> noinstr void foo(void)
> {
> 	instrumentation_begin();
> 	/* code that calls non-noinstr functions goes here */
> 	instrumentation_end();

Indeed, you are right - I should have gotten more of my morning tea ... :-/

Thanks,

	Ingo

