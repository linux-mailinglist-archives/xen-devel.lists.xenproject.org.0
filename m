Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32A973D12
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795887.1205373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3b6-00024A-3r; Tue, 10 Sep 2024 16:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795887.1205373; Tue, 10 Sep 2024 16:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3b5-00022g-VX; Tue, 10 Sep 2024 16:20:07 +0000
Received: by outflank-mailman (input) for mailman id 795887;
 Tue, 10 Sep 2024 16:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1so3b4-0001xM-Ie
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:20:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a24facd-6f90-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 18:20:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso552895966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:20:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65cf6sm496168266b.222.2024.09.10.09.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 09:20:04 -0700 (PDT)
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
X-Inumbo-ID: 8a24facd-6f90-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725985205; x=1726590005; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4fNfWdV9BH+Mk/ABcJ857BgoQGD2cWlX2NUHqBJNLEU=;
        b=SadKIl6pjoR9orRxayaPEPAlv5o7o7A9JPS3mNTHLWORylzau29cSYBpiD18Rq8mP5
         9WMukZz0lI5r7p1a9hKEgH7HHOxaLKhzC3DgB7MXhzg4gqZBB+Buxx9DtZ/oa5OGiXkG
         DAr1Fd/CCwBGKb5WhX3QiB7yw2OTW4lSl1DA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985205; x=1726590005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fNfWdV9BH+Mk/ABcJ857BgoQGD2cWlX2NUHqBJNLEU=;
        b=epJVTSLe3eVAAxBMbECpKKNIP/sr19NPFbBJIgx1Z3Mn/k8m9yrh5F7Y9G5mLsWiGI
         GdcIv81zSJg9tfenmi3iV8Ha8j2B8kKg8iznqZgCDlSqvhodcXYqqboRymsk0Cgeq+iP
         syMwG9/ejTLOnLXGRWYygmLAzpF3kM9wN2UeV/If1cdNIIzNWB1cL0wjYI2JvGTTAjgg
         84JW/RVZitMZ+1ykgN+AL6KI2U4vHpogGxd7/eCpHNVQYTzrpaBy0adzxhA+GizQX0Ya
         W27JDMEQ8QSnzhTyGJJtF+n4WHXEzBCh6Up6YVy0d5UWyW3m9YwD7Fgaa4sXKpKcOKez
         szXA==
X-Forwarded-Encrypted: i=1; AJvYcCWTIkBodYOPeAYLvPnEAkdLWYHj3qrNsCgpy8KRTa1ILANHzJ9Xo+6arWtjia0EZab9Gb8V6pHH0/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVrjj4tdHQR7VmD3DkeHg77Se39FEUgROLNLE3KMYAP7Vv8Bjd
	UBEr4SwER1ndPNiCRNm4jVWmtlzWsYQ5E1WGlNbKb6IDqulYcqL/7DgnBOfLHR0=
X-Google-Smtp-Source: AGHT+IGRdJwT/gtPCvPs2jlIHld5oKQ4tniblGopgCertlYelv2eseg+WukE3Je6nUDs5ZLuDIcELg==
X-Received: by 2002:a17:907:1c27:b0:a8d:4f8e:f669 with SMTP id a640c23a62f3a-a8ffaa983b3mr123060366b.2.1725985204467;
        Tue, 10 Sep 2024 09:20:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 18:20:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/4] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZuBxsybr71Sgtx1Y@macbook.local>
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
 <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
 <ZuBFNu_GFygZwvil@macbook.local>
 <a52b019c-3f1c-4528-91f4-7bc1258c87d9@suse.com>
 <ZuBWsn2wgf9g1Nyv@macbook.local>
 <7d55bda8-222a-46c8-a810-79ba5c0928d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d55bda8-222a-46c8-a810-79ba5c0928d3@suse.com>

On Tue, Sep 10, 2024 at 04:29:43PM +0200, Jan Beulich wrote:
> On 10.09.2024 16:24, Roger Pau Monné wrote:
> > On Tue, Sep 10, 2024 at 03:49:52PM +0200, Jan Beulich wrote:
> >> On 10.09.2024 15:10, Roger Pau Monné wrote:
> >>>  Would you be fine with
> >>> adding the following in init_xen_time():
> >>>
> >>>     /*
> >>>      * EFI run time services can be disabled form the command line, hence the
> >>>      * check for them cannot be done as part of the wallclock option parsing.
> >>>      */
> >>>     if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> >>>         wallclock_source = WALLCLOCK_UNSET;
> >>>
> >>>     if ( wallclock_source == WALLCLOCK_UNSET )
> >>>         probe_wallclock();
> >>
> >> ... this is probably the best we can do (nit: s/form/from/ in the comment;
> >> maybe also "..., hence the check done as part of option parsing may not
> >> suffice" or some such).
> > 
> > I didn't put in my previous reply, but I've removed the efi_enabled()
> > check from the option parsing and instead added this comment:
> > 
> >         /*
> >          * Checking if run-time services are available must be done after
> >          * command line parsing.
> >          */
> > 
> > I don't think there's much point in doing the check in
> > parse_wallclock() if it's not reliable, so your reference in the
> > comment to "the check done as part of option parsing" is no longer
> > valid.
> 
> Hmm. Rejecting the option if we can is reasonable imo. "efi=rs" can imo only
> sensibly be used to override an earlier "efi=no-rs". Hence what we see while
> parsing the wallclock option gives us at least reasonable grounds to reject
> the option if EFI_RS is already clear. We then merely fail to reject the
> option if the flag is cleared later.

I won't strongly argue about it, but I think having a non-reliable
check in parse_wallclock() is confusing.  I would have to add a
comment there anyway to note that depending on the position of the efi
and wallclock parameters the check for EFI_RS might not be effective -
at which point I think it's best to unify the check so it's uniformly
performed in init_xen_time().

> Yet in the end I'd be happy to leave this particular aspect to you and the
> EFI maintainers.

Thanks again for the feedback.

Roger.

