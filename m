Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B118CE4A5
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729348.1134480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAShI-0002Xk-8E; Fri, 24 May 2024 11:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729348.1134480; Fri, 24 May 2024 11:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAShI-0002WE-5f; Fri, 24 May 2024 11:02:52 +0000
Received: by outflank-mailman (input) for mailman id 729348;
 Fri, 24 May 2024 11:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAShH-0002Ur-5N
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:02:51 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290c866f-19bd-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 13:02:50 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-354df3ee1a9so2653047f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:02:50 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c9363sm1330653f8f.72.2024.05.24.04.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:02:49 -0700 (PDT)
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
X-Inumbo-ID: 290c866f-19bd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716548569; x=1717153369; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3BswUzSzXy/a4rA08jYVQviuF2QhYJsjbScxmPbKlg=;
        b=hqsfEL6zg2B5guMfexKGvrh5JhGpQCQ8uE4BK4CWbmUcel+wPT4Lqbxw1Bj3xSBYSk
         VfO1iY4guEOqp7Gq95tl4HlG4dmGR+K41elasgXd861IxBrzlUWK7wREIsm1AxX/WGoJ
         xG4ZPkfWnGbs0rouSxqN6UbtDEfdS1bzw1SMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548569; x=1717153369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3BswUzSzXy/a4rA08jYVQviuF2QhYJsjbScxmPbKlg=;
        b=Mjez/naF1qurq25GU37rVXq2MWXoy322sEGqM5R3ckl5x1cnPe2MbkV2Vp0x6n8NRZ
         9EiWDBxWnC83/2WPjpLUv9gKJys6HTDeeMVfGt0pCvUdZSkLdAfAq9u3NVL+4GYwrLIA
         2pON/suBTMvfkwzuSwopIoo2aybzrkgxC9H53gAbCQtiR9Nbs0qAWrzyJlxuBMTJKZP8
         cgtkrrRYwNzquKgM9SbmhKIgHYuITMp01xE27fjqwoBTConmura1TnwuSv9WXJwHa4l3
         mcEVnAjm2hUo02sgCBFxAommA5pYdMkGtGwp7n9Tcf5UX0UWJYdNvd2lOMGVWoyiqbuv
         IFQA==
X-Gm-Message-State: AOJu0YyOic9H3s+s8/hlA3VRV4uyN/p6pUTBrPM97V9kiF+S9eRbk8My
	weo56/Eptq1Qm3lbwYG1vtcibTksbx8dey46flrwCdxLuEKgCJwjYrxSgl0LeZo=
X-Google-Smtp-Source: AGHT+IEqtcAzHinqqC9eCH7ICNYDHiCNIjwJsWk1eRdq9UgyJ+cK/+bC7KnMe74uxUSS+ccCBYHyog==
X-Received: by 2002:adf:a18d:0:b0:355:586:2245 with SMTP id ffacd0b85a97d-35526c2889bmr1197043f8f.23.1716548569431;
        Fri, 24 May 2024 04:02:49 -0700 (PDT)
Date: Fri, 24 May 2024 13:02:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
Message-ID: <ZlBz2HSAjvNWJ41B@macbook>
References: <cover.1716457040.git.alejandro.vallejo@cloud.com>
 <5c6ee74b60bad4eb9cc8e17dbfcf7158d38bd32c.1716457040.git.alejandro.vallejo@cloud.com>
 <Zk8YucyA1ZwGU4Y-@macbook>
 <de256e4b-fdc4-48a8-9173-38092ab90716@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de256e4b-fdc4-48a8-9173-38092ab90716@cloud.com>

On Fri, May 24, 2024 at 11:32:50AM +0100, Alejandro Vallejo wrote:
> On 23/05/2024 11:21, Roger Pau Monné wrote:
> > On Thu, May 23, 2024 at 10:41:29AM +0100, Alejandro Vallejo wrote:
> >> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
> >> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> >> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
> >> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
> >>  {
> >> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves);
> >> +    unsigned int nr_msrs = ARRAY_SIZE(p->msrs);
> >>      int rc;
> >>  
> >> -    if ( leaves )
> >> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
> >> +    if ( rc )
> >>      {
> >> -        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
> >> -        if ( rc )
> >> -        {
> >> -            ERROR("Failed to serialize CPUID policy");
> >> -            errno = -rc;
> >> -            return -1;
> >> -        }
> >> +        ERROR("Failed to serialize CPUID policy");
> >> +        errno = -rc;
> >> +        return -1;
> >>      }
> >>  
> >> -    if ( msrs )
> >> +    p->nr_leaves = nr_leaves;
> > 
> > Nit: FWIW, I think you could avoid having to introduce local
> > nr_{leaves,msrs} variables and just use p->nr_{leaves,msrs}?  By
> > setting them to ARRAY_SIZE() at the top of the function and then
> > letting x86_{cpuid,msr}_copy_to_buffer() adjust as necessary.
> > 
> > Thanks, Roger.
> 
> The intent was to avoid mutating the policy object in the error cases
> during deserialise. Then I adjusted the serialise case to have symmetry.

It's currently unavoidable for the policy to be likely mutated even in
case of error, as x86_{cpuid,msr}_copy_to_buffer() are two separate
operations, and hence the first succeeding but the second failing will
already result in the policy being mutated on error.

> It's true the preservation is not meaningful in the serialise case
> because at that point the serialised form is already corrupted.
> 
> I don't mind either way. Seeing how I'm sending one final version with
> the comments of patch2 I'll just adjust as you proposed.

I'm fine either way (hence why prefix it with "nit:") albeit I have a
preference for not introducing the local variables if they are not
needed.

Thanks, Roger.

