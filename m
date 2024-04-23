Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D58AE93D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710655.1109992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGsA-0001Jo-Pj; Tue, 23 Apr 2024 14:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710655.1109992; Tue, 23 Apr 2024 14:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGsA-0001ID-LW; Tue, 23 Apr 2024 14:11:50 +0000
Received: by outflank-mailman (input) for mailman id 710655;
 Tue, 23 Apr 2024 14:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzGs8-0001I7-DU
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:11:48 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad16950-017b-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:11:46 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-22f746c56a2so2585408fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:11:46 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 w20-20020ac87194000000b00439622fb8f4sm3511650qto.39.2024.04.23.07.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:11:44 -0700 (PDT)
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
X-Inumbo-ID: 6ad16950-017b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713881505; x=1714486305; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbzdywQUMMJyc/51/F1TIJDmBNql2mGKph3qYuis9CA=;
        b=cMsugE0AyS5t6X5nD9oiaqqggojTeKuzWmpLZMqyX53KEpf1miqXG9/V56F5e+Uole
         YcQUy4hRpPYFMEcgcyaf0VJ2prL+L4IKncluXqaaHaz7kBKhaUG6EQwlA2k7LIp2/wtk
         r7PAJA4YyFDXAlWHIO+i4TlpEhVpQODY0IExI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713881505; x=1714486305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbzdywQUMMJyc/51/F1TIJDmBNql2mGKph3qYuis9CA=;
        b=aCMKiK/wkdnPkau1kcxDtLeqnaO6HnLjjLjALOPFbPzMGBnj4DXTTSD1jEOWOH8PxX
         8SoTdC/wv/FdKt2IfOzkTceE9zkiAENKIZldwZ3gInA2+cTmz7QVVPjnN4FExQn88OHd
         C+MBZy1SQa/oBj9j51bc0purHqfgtWG2NIkbG0uKmX/kalO6xQrtvmCAyi2rNkuZIZ9B
         lnqibJ+yQWuB2aa0Jy4TIdnKRBLgKjZXRpYxetm5lcNWyKH9mSaPNBOgKJhRY7NwmFZb
         OS7i/kcCAtS/RNzk+lH1YwkQt7QTv3HTaydPxy2IJyXq8XV+5Ua4VBPE5mFNi4RfetIg
         H8AA==
X-Forwarded-Encrypted: i=1; AJvYcCXTPnSZ/hZixPXfPipblXbKtoi7mUxkDbGxuqNHxdYFUsoKkecN9XvXviJOZwHqtFBHN4zD+X4F1+nQEp2W0JQEANNOaTbeHRFbA3cgV5Q=
X-Gm-Message-State: AOJu0YzKz9NUmaeTMSbMDY++6HXKrX9LmLDScQk+FcRdD9Cow/FpuEg5
	XKZ+jNqsBDEsjz9j3MEfH7RrC7TbAQ9pU3rboMs+eKpf5cL/+Jwx8ro4EOQaw9M=
X-Google-Smtp-Source: AGHT+IEEiqnvY5gU8olRLcK2tUJTBHzdYVi1NwcD4IMO2aJyMs/EXrcaOrK3rqbE8nr1ZMwvpRlmfw==
X-Received: by 2002:a05:6870:d298:b0:22e:a3b0:34fd with SMTP id d24-20020a056870d29800b0022ea3b034fdmr18566004oae.21.1713881505083;
        Tue, 23 Apr 2024 07:11:45 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:11:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] xen-livepatch: fix parameter name parsing
Message-ID: <ZifBnp4w8Cc1mH2R@macbook>
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-2-roger.pau@citrix.com>
 <e685068a-6df7-4a70-b62a-43982b05d4d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e685068a-6df7-4a70-b62a-43982b05d4d9@suse.com>

On Tue, Apr 23, 2024 at 03:33:36PM +0200, Jan Beulich wrote:
> On 23.04.2024 15:12, Roger Pau Monne wrote:
> > It's incorrect to restrict strncmp to the length of the command line input
> > parameter, as then a user passing a rune like:
> > 
> > % xen-livepatch up foo.livepatch
> > 
> > Would match against the "upload" command, because the string comparison has
> > been truncated to the length of the input argument.  Instead the truncation
> > should be done based on the length of the command name stored in the internal
> > array of actions.
> 
> But then "xen-livepatch upload-or-not foo.livepatch" would still wrongly
> match. Why strncmp() at all, rather than strcmp()?

Bah, indeed, how dumb of me.  Will switch to strcmp in the next
version.

Thanks, Roger.-

