Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF869AB3AD8
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981596.1368000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEULx-000463-V6; Mon, 12 May 2025 14:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981596.1368000; Mon, 12 May 2025 14:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEULx-00043k-Ro; Mon, 12 May 2025 14:42:01 +0000
Received: by outflank-mailman (input) for mailman id 981596;
 Mon, 12 May 2025 14:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEULw-00043c-PJ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:42:00 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4247f3e0-2f3f-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:41:59 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b2325c56ebdso3327585a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:41:59 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b234ad3ea55sm5721845a12.36.2025.05.12.07.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:41:57 -0700 (PDT)
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
X-Inumbo-ID: 4247f3e0-2f3f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747060918; x=1747665718; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJCRz/oIYTWnj4EjPCmhOZH2eW6o4a9pf5HS4Ytyvi4=;
        b=feCQFxp00HxcPNkUxad7E/NiT+2A/xK+7EaRYcSnkNDqjKiE/wQZRLh1ZMqswab+TR
         8qIYi5CM1SliCB4DJ2f+Cf5rpQCI2CAa22Qi2ySFMJgxpOig7EsBRTOwr77v53ZldUH7
         89z4+SMahfkIER8FIIyN53RHalb7dYNqZAMQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060918; x=1747665718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJCRz/oIYTWnj4EjPCmhOZH2eW6o4a9pf5HS4Ytyvi4=;
        b=roWUIhCWFs3Mzm4XZ+QOtMoYQPCmDLzVUcynAPM+k1zDGG2hg7hb1NmX3Y3LkUsuM2
         fPPTJTtSI2V4NdclnldkF7wtNt0r2PvTky7+z/qqk8wAmBaeGehbYOd8SgQwrjB9mnpY
         RFp3+BVj3FoNbzLnF23Ejuk0uP4zSSF5h+6JJALmRt1J/M+v+NxReSYeYP3YN+OEMuHJ
         oTT0gF9+Z+oBpz6YkgDDfuzEK706AjRYWNthPE9sP6hHuDJ6FQJDRg042RLUyviSCz5U
         nCpz1D7I5MupoLoo2YLIqRP2QB4sSsqMfz0D8m+4cHFjN7ANAuA8MGiGxUfGhRfs+S+J
         NNvg==
X-Forwarded-Encrypted: i=1; AJvYcCVpleZ88FxOG+qmI1DjCaAT8ClRiyHxI2FdzjDlkNOwx726sKTarckUzL3cThk9e0r5MtnmN3HEjIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfvsgjTSw8aQ/zEmwqQRR56x+haTSUA5dnKvxi0zUauRoLJzxR
	gWisvHQFMrWsiu6d4U00liEb8kPRbNLLNBtrFN+89EvY+dkSSotWzTt6e1oZZoQ=
X-Gm-Gg: ASbGncvtG8xaCpaKk+HYjrCWJ77t0ABlZ6wMa4zd9TUu+X+alsK295s+u80BpSeB1b+
	yDmUOjkd1ZfsOgxzdRnKSY16Qz/fES6OO/Tnylweuv6iKGM7hwx8nOgJxSi7AofdckiLXeSR5V0
	PySC8SVyGh3soYTtDRl6XHsrMNk/2QzyehZ4zEO4Aa98mio58ol+U+bgnKblQIVfGRJV9QogHG+
	vKD+/9FfkjZWFeSilhHAaFho0G0vzbJRQv34izwPDE6XnU6pxl4MT9Sa/Nq4/PqhrHUyhldjH6a
	Tluj6+mhbdb3e9MPxTJmffCpYanTtfqxtMsl8wV5YHUt6WlNC0vJZa0Z
X-Google-Smtp-Source: AGHT+IFcwMyIdOPYIo3ThrSrj9RRUrfhVJ4x6Mox2oKpHgr4uXhdNgA2CZff3sQRqpIg5eriz8IGXA==
X-Received: by 2002:a05:6a20:559e:b0:215:e53b:9ead with SMTP id adf61e73a8af0-215e53b9f85mr1164259637.26.1747060918038;
        Mon, 12 May 2025 07:41:58 -0700 (PDT)
Date: Mon, 12 May 2025 16:41:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/9] x86/pv: fix emulation of wb{,no}invd to flush all
 pCPU caches
Message-ID: <aCIIsPRB6IFGE46l@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-3-roger.pau@citrix.com>
 <7102b188-7abe-47a5-b889-d11db3eda674@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7102b188-7abe-47a5-b889-d11db3eda674@suse.com>

On Mon, May 12, 2025 at 04:20:30PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/pv/emul-priv-op.c
> > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > @@ -1193,17 +1193,18 @@ static int cf_check cache_op(
> >  {
> >      ASSERT(op == x86emul_wbinvd || op == x86emul_wbnoinvd);
> >  
> > -    /* Ignore the instruction if unprivileged. */
> > -    if ( !cache_flush_permitted(current->domain) )
> > +    /*
> > +     * Ignore the instruction if domain doesn't have cache control.
> > +     * Non-physdev domain attempted WBINVD; ignore for now since
> > +     * newer linux uses this in some start-of-day timing loops.
> 
> That's very old comment, and hence I think "newer" isn't quite applicable
> anymore. Either omit the word (if Linux still does so), or say "older"
> instead? Also since you touch the comment, upper-casing the L in Linux
> might be nice.

There's a wbinvd at the beginning of trampoline_start, which is
possibly to what this comment is referring to?

I will just drop the mention of "new" or "old" and capitalize the L in
Linux.

> > +     */
> > +    if ( cache_flush_permitted(current->domain) )
> >          /*
> > -         * Non-physdev domain attempted WBINVD; ignore for now since
> > -         * newer linux uses this in some start-of-day timing loops.
> > +         * Handle wbnoinvd as wbinvd, at the expense of higher cost.  Broadcast
> > +         * the flush to all pCPUs, Xen doesn't track where the vCPU has ran
> > +         * previously.
> >           */
> > -        ;
> > -    else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
> > -        wbnoinvd();
> 
> So this goes away altogether, which isn't nice. It was "only" 2 years ago that
> I posted a series where an additional ...
> 
> > -    else
> > -        wbinvd();
> > +        flush_all(FLUSH_CACHE);
> 
> ... FLUSH_CACHE_WRITEBACK is introduced [1]. I really, really think that should
> go in first, for it to then be used here. The more that it's the 1st patch in
> that series.

Saw that series when doing this, I was going to ask about them but you
where away and then I forgot about it.

Let me take a look now.

Thanks, Roger.

