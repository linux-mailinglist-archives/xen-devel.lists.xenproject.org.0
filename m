Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC05AB9A62
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986947.1372462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsWl-0002gk-Od; Fri, 16 May 2025 10:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986947.1372462; Fri, 16 May 2025 10:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsWl-0002eB-LI; Fri, 16 May 2025 10:42:55 +0000
Received: by outflank-mailman (input) for mailman id 986947;
 Fri, 16 May 2025 10:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFsMI-00034q-TM
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:32:06 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02635dd6-3241-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:32:05 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-74267c68c11so1863991b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 03:32:05 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4adbfc0sm11446755ad.71.2025.05.16.03.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 03:32:03 -0700 (PDT)
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
X-Inumbo-ID: 02635dd6-3241-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747391523; x=1747996323; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j0XKJISHS4dzAt7Jr7nklY20nUhhhSE6Y+hlXuQuwr0=;
        b=Qitva1uZKekuWHP4VV3PFxYZbY4EHTJvP4oUnlJ0YzczmAk6jwjox9S10SlNpcBqU4
         +8W4yVVHVKco7Gsn2h1BnpuDJjrGbFGPMVd3R82GaU7i/h3yu020sHM9ghW3I7TYK4C4
         O5KyMEYqxtaNXbsjJih4KUnsiXoVE79NF7QbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391523; x=1747996323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0XKJISHS4dzAt7Jr7nklY20nUhhhSE6Y+hlXuQuwr0=;
        b=CpPNqGEDVtDNNXmfjttloFYvKa7FwUEoo8wcawl2EeDjvPeKdEjRFfsJ8ABqtZQqqD
         fkpr3JopeOUavOkCp3sFFivyk+9dYDtABOZNXrXl/NwQqU9c3vjw+bTGrOYsr2mzsxfd
         RSXI9Y8s67NAHgBgn4OR3DFyM4oiMtmwdfxbOaKV16LZurWf+iBH5s/5WUN5P204m4VT
         tV8qA694WcZ4/YxaA1jyX6ZBWfcsRDD99ISSWNwspIWgcRG0l+t493ZlmNHWg7wxmS7F
         gs5FtGPFPtSO2jGdkxvtrc7lqf2B+U81/rIC2NGacuSS3S9abTYLG2OLE36KxdKbiRYU
         dGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPw260vVk/TsnkP5e7+WAUP6oEHeCwAkpSAR3fPVmyqO+UpGIKnMpw/Ky03EKuNbNxYygXT44MIpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4PRwEYu1lOmWc3TEu3k4NDq19/Obde7+Yw22xPiQvZEdFk+UV
	Wuk0snNe/g9JQF4IeGgDmWihtaDuxk4H+IJFg6RMAz3cfOrasUVJbPysP/uabCG5QCM=
X-Gm-Gg: ASbGncv1o4MDSNAP28H4qtJilNLonYSKr0KoCF0ICZVebv1Kgr4AxZDK4QBHdVcvFjs
	ajsYYR+jOzKh1BALrhSvSpR9WWrry3DKBSjV2s6U8hWG1cO+4U1FPYZk1ebLFmms0cekaYwi6+I
	hsVfG1LRl5up2eaCdJeFuEbgBA0tbe2ZbJvXJXTRjOZM/5EDjVuocYZpPnwId+/7fXkBJcR4ZpB
	x1SBgo80jisaz0Qo4FmUlbdSRVvi5IPfam+/AVmTsXZe3NNTzqi/Dav3PMDmfwtADriy816FKXD
	N4TYFxRttMb5I9v1PqrnZSrTVP9b7UcCOfzxnbJ/tPvkeVsLijgtQh8pVznt98rrK5BtF0Quwon
	SMimI68p815SClTgh/tg=
X-Google-Smtp-Source: AGHT+IGlNaLtx3XnHMNfgYitvZAlLM+sz/IioPtcGAwH7g8dwijbXXbdGIWss5GC48RmrclnhESTzg==
X-Received: by 2002:a17:903:1aec:b0:22d:e57a:27a2 with SMTP id d9443c01a7336-231de36bb6bmr25947565ad.23.1747391523582;
        Fri, 16 May 2025 03:32:03 -0700 (PDT)
Date: Fri, 16 May 2025 12:31:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/6] x86/gnttab: do not implement GNTTABOP_cache_flush
Message-ID: <aCcUHtWNBdbK7Iy0@macbook.lan>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-3-roger.pau@citrix.com>
 <b7d2f338-6918-4052-99e1-733dbb0aac7d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7d2f338-6918-4052-99e1-733dbb0aac7d@suse.com>

On Fri, May 16, 2025 at 11:48:48AM +0200, Jan Beulich wrote:
> On 16.05.2025 11:45, Roger Pau Monne wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -35,6 +35,11 @@ config GRANT_TABLE
> >  
> >  	  If unsure, say Y.
> >  
> > +config HAS_GRANT_CACHE_FLUSH
> > +	bool
> > +	depends on GRANT_TABLE
> > +	default ARM
> 
> To keep arch stuff out of common file as much as possible, I think this instead
> wants to be a "select ..." from ARM. Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

My first attempt was to do it as you suggest, but then if the users
disables GRANT_TABLE you get the following warning:

WARNING: unmet direct dependencies detected for HAS_GRANT_CACHE_FLUSH
  Depends on [n]: GRANT_TABLE [=n]
  Selected by [y]:
  - ARM [=y]
configuration written to .config

And you end up with the following on .config:

# CONFIG_GRANT_TABLE is not set
CONFIG_HAS_GRANT_CACHE_FLUSH=y

That's why I've done it the way presented in this patch.

Thanks, Roger.

