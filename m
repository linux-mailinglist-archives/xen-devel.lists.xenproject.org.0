Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FDA72E40
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928972.1331614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txktG-0004lR-VU; Thu, 27 Mar 2025 10:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928972.1331614; Thu, 27 Mar 2025 10:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txktG-0004iJ-S2; Thu, 27 Mar 2025 10:55:14 +0000
Received: by outflank-mailman (input) for mailman id 928972;
 Thu, 27 Mar 2025 10:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txktG-0004iB-8t
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:55:14 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d69d4a-0af9-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 11:55:13 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-224191d92e4so15880805ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:55:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-227811b2be4sm125614485ad.126.2025.03.27.03.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 03:55:10 -0700 (PDT)
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
X-Inumbo-ID: f4d69d4a-0af9-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743072911; x=1743677711; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZVIzZTshyRyX2vdlYGGUIrTH089iaLhOCPmsd6J5qA=;
        b=h9OOORSNYWdXiZvCRwh+5Iza0mVv+GUzND8JNDUuiIEnFbNMyX7+uclfdMx4EfPzpx
         mSJy2x89XG9qBhBIlv2zpw3Ptz5tvodCYJ/UA4XT2zDM176Cg1Og9weZop0AOZblB8G2
         t9pgUvke92YFuqNTOEeaj2Pr+Lm/YDi82LERg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072911; x=1743677711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZVIzZTshyRyX2vdlYGGUIrTH089iaLhOCPmsd6J5qA=;
        b=eqZiHlsj8SelIS04CyQ6hAhnO65xvUwPMl3c8r6QWea4c3xiNx1szQe91FmmarrIkY
         cckxUS/FQ2l1BnOdwXQUT5gA2qPPGyMFbqzw2CGiDZc/oHhU7l4g7MXM7Q9W7RXp3CDe
         1kChM/1y1qV06+BZE1z95tmXpDvRxf2LkE6IEG8BHQYS1ngQQvo49xG8RAhpMm9PBSy4
         IiBFd+lL868meKLcE+Cie/xbRXMRbwGI6ZkYw5avTtVce08B1shccTDya6xy6pP5DqpC
         /nTyC9H+8jPWmAn5IGiWZGdPs8/xefagydoR7vWW2xm5QcE1pHaJW5ZvE6SADAJ1Wn0Y
         9j5g==
X-Gm-Message-State: AOJu0YxnZb6VQVXfg9a4lshb1C25YtV6CQuFfIc/9styYLPb3MVAgrYZ
	GfFEMRA391dpCjMwceI1uDy5BBLvdes3QpAJZB5lsmUadQKo+tLRrEr3BUNn2Pl/tD/Pd6WSot1
	q
X-Gm-Gg: ASbGnctZeLUMUGvHMTsKo5Hy2LQBWG+zR+V1bh5z+9k5p/hcsUTMLBD6W++i+DCori1
	WVDUNOBBCTuZiv+wdtH79Qnpc305WbGJ9YiocvIyyDdOqFknMKRvgIVrU1lK7winb1yz38WInzp
	vS3DfUKnlzBxtKdtKB5TKwi3J/BJ0p87YL2gt/vwJyDKSjPKG4O7XQVOnN7DkzanWYegf2IA2+f
	kt4ZMMw8jWBYSDMMABIoQGUov0NF00tfDntzZ8Umpp7KO/i8aPnP/rM+Q+cxwFhvrXQdERpLpKr
	g3HxImwrM2xlofZacfrqOazPSA7k1JDh3sF1n6TfxfRZjf9bBQ==
X-Google-Smtp-Source: AGHT+IGExd2sIbSmZzKtam6I8zd684oNOHYyg8WBy0kkAAad7bdPpKA77vQp192QC66mA5wkY6OAXA==
X-Received: by 2002:a17:902:f646:b0:224:f12:3735 with SMTP id d9443c01a7336-228048c8674mr53388225ad.31.1743072911248;
        Thu, 27 Mar 2025 03:55:11 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:55:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
Message-ID: <Z-Uuin-9Mo1Wnln5@macbook.local>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>

On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
> In particular if we're running virtualized, the underlying hypervisor
> (which may be another Xen) may not surface MTRRs, and offer PAT only.
> 
> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

