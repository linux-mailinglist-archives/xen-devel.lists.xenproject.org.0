Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301CAB9AC6
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 13:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986996.1372491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsrj-00088G-TP; Fri, 16 May 2025 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986996.1372491; Fri, 16 May 2025 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsrj-00085q-QQ; Fri, 16 May 2025 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 986996;
 Fri, 16 May 2025 11:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFsri-00085k-Uy
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 11:04:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89254892-3245-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 13:04:28 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so66180166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 04:04:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d06cdefsm142158766b.52.2025.05.16.04.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 04:04:27 -0700 (PDT)
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
X-Inumbo-ID: 89254892-3245-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747393468; x=1747998268; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNRZulMHw+ZS3p7JqXl4SF+qDLtSvnv/s/9bSEhPxz0=;
        b=diEmTo2sd+oOEB0f3U048zVl+zLI40JF3G1X77K0G9VoLFnwYj6qssalsp3LstmEfZ
         b4UT+i8vA7OgUx0uyReAi/rIjH3uLSPxry1EZHmeQcnppUPyKZV8O7xEl/wDikyMGAns
         KnOhoPuQkIgXuWNQ4yPioyeSNXk9TU2aEpIQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747393468; x=1747998268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNRZulMHw+ZS3p7JqXl4SF+qDLtSvnv/s/9bSEhPxz0=;
        b=kcBpZBPXBIBY1VGC293BO1i/HC2Qx6FF685wq2bN5CDBtCU9Y5jKoLBnm3ycXVugI7
         qPZ3ApZ3i94OXhS0CH9kg48jpVjeaotYTru3iK2grzpnE7K2/faRF60X4ck5dFGAwMQo
         GgKJxdyia7wmAqSqY6flgHv/EV2Dsh78tavvewbc3ho+5uzY8r32yyjhUy/Z7nM8lK6G
         MolC6q/m/Rupbx5yO9bJxoYEKa5cXPe1BRW5pdx1oZqhJ32Q8zCm1Ac+0fPIWiCxLZFx
         wXAfkOVM1EkLqGyZVGoz1u6I9dWvRCQeIYXFwryqGm3G/e1VQIkuw/YGaVHJKPjajUtK
         oUBA==
X-Forwarded-Encrypted: i=1; AJvYcCXD//ToVhTIa+Rrpt7TU1dWwBaYgcyRz4iueH9DRW1aOLfQbOpYi8eQK4ckRFFoRcaKWQCuZHsl7xg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzoWbhH8LmU8hGfPII22ZJQszi4nRCIdErhDKqlilqC9v+qbES
	EOjecZooMvrCTmnqwXkvQYu3aD0OuqrfYTNbN4QCA2ymwsoZULNYFi8b3+zawqjrbiM=
X-Gm-Gg: ASbGncsR9EzLGC+yHlmcfD2r8qTdPnddMBZSy7z7OE0qzaJ4E9Dqc07RQFqFbOstqvJ
	tsOGK7TFZtS8rzgFOrHlp4iZ+BzjLfm522mCMvLmm7weUpRZtKixYCbbc1klKBOhL/sp+YpPbrL
	iT3Az5Zy3qk0F7fdC5nqVZ8EHLqoatTsQAhVFaJyswTvtgOkWHVCLNUsti8kAFpHjs81FpJMNZY
	qP1++SWHv+paxRdsZm1YbyqGNlG0ZStZvpWV3904oL4QpFPxq+wBwoZC5QOAr6dCTQU3FRKozim
	Zn53+jcfoNPDk6hFzfJOn2DvhjS5lVhfjAcxgE8FzTE14uttoweR7dMyduNNzmXKBbhrfTZsFlP
	Us0o3YV5i2AJZiE6e8wXkCBaGbPrzHA==
X-Google-Smtp-Source: AGHT+IF3zfeeudS4VRxzsXXWtTCDlb2/KgrrRwIclIdqLTgryYP46WqxI48CLpr/rGSOSVynee96vQ==
X-Received: by 2002:a17:907:d02:b0:ad1:81c5:5ec9 with SMTP id a640c23a62f3a-ad52d42bcb3mr334540166b.4.1747393467804;
        Fri, 16 May 2025 04:04:27 -0700 (PDT)
Date: Fri, 16 May 2025 13:04:26 +0200
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
Message-ID: <aCcbutQn6Q_vIZ-6@macbook.lan>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-3-roger.pau@citrix.com>
 <b7d2f338-6918-4052-99e1-733dbb0aac7d@suse.com>
 <aCcUHtWNBdbK7Iy0@macbook.lan>
 <885b6722-5a68-419e-9d63-bf5977194c96@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885b6722-5a68-419e-9d63-bf5977194c96@suse.com>

On Fri, May 16, 2025 at 12:38:02PM +0200, Jan Beulich wrote:
> On 16.05.2025 12:31, Roger Pau Monné wrote:
> > On Fri, May 16, 2025 at 11:48:48AM +0200, Jan Beulich wrote:
> >> On 16.05.2025 11:45, Roger Pau Monne wrote:
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -35,6 +35,11 @@ config GRANT_TABLE
> >>>  
> >>>  	  If unsure, say Y.
> >>>  
> >>> +config HAS_GRANT_CACHE_FLUSH
> >>> +	bool
> >>> +	depends on GRANT_TABLE
> >>> +	default ARM
> >>
> >> To keep arch stuff out of common file as much as possible, I think this instead
> >> wants to be a "select ..." from ARM. Then:
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > My first attempt was to do it as you suggest, but then if the users
> > disables GRANT_TABLE you get the following warning:
> > 
> > WARNING: unmet direct dependencies detected for HAS_GRANT_CACHE_FLUSH
> >   Depends on [n]: GRANT_TABLE [=n]
> >   Selected by [y]:
> >   - ARM [=y]
> > configuration written to .config
> 
> Right, it needs to be
> 
> 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> 
> (and the "depends on" on the new HAS_* can also go away; HAS_* imo shouldn't
> normally have any dependencies).

Hm, OK, I didn't like it this way because then we force all users of
HAS_GRANT_CACHE_FLUSH to make it depend on GRANT_TABLE, while putting
the dependency in HAS_GRANT_CACHE_FLUSH avoids that.

Anyway, have adjusted according to your suggestion.

Thanks, Roger.

