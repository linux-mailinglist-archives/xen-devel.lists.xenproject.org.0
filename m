Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F808B0A35
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711423.1111375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcCf-0002qu-N3; Wed, 24 Apr 2024 12:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711423.1111375; Wed, 24 Apr 2024 12:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcCf-0002ne-K7; Wed, 24 Apr 2024 12:58:25 +0000
Received: by outflank-mailman (input) for mailman id 711423;
 Wed, 24 Apr 2024 12:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzcCe-0002nS-J3
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:58:24 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54fe83e8-023a-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:58:23 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso7189825276.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 05:58:23 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 y3-20020a0cc543000000b0069f1c071f1csm938805qvi.29.2024.04.24.05.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 05:58:21 -0700 (PDT)
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
X-Inumbo-ID: 54fe83e8-023a-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713963502; x=1714568302; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TCV4VLZM9XR8olQPvsThTDB1wZaKXyjU82he/ktQUyk=;
        b=YOiHpty0jVy3THmdkHojZJFqfZBiag3GIX/4PMNfNm1PhYYyYRhygYsml4KG668mVT
         duv0HT6a3BC/uAAAJAfGs6GLT92xwSyaW1rSGmhWOhNQFhVASh8XLby1MEu0JAsndNfT
         zbUdxDsXNN6VWZIR3vmtyyBQC/jwzBkYfUpTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963502; x=1714568302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCV4VLZM9XR8olQPvsThTDB1wZaKXyjU82he/ktQUyk=;
        b=xUd0LuIu+6vnSCokKnWJtBxT5OYOOWbd7+jIW1NMYc4qthkMIQMuq2Zo9wHs9I7K78
         dndN5MEGBDn/z3+V/2UCfRjJD74T9hfRXjZJa46bdM/EM9bH2Lm1GlxLNcD8+ZQcSfjT
         aCXhZ9uwS5dbwb+d58E+IpSRf0ljgvdQtXoJRWvcIJgND0NDNOjPqTMAlRTn0w0GmV5b
         7oEIU6RrhkltpYyDV6JRFE82jXhjFupr/3cxjxmVtdSGzrbadFy10eAfXmLb/OqcG80d
         ybukibaGMFWbNe3KSH6s+yVN5wlNXtwlPFK83kUoboXFdAKPQ9O1Bx/fwMaZFP7tU6rT
         111w==
X-Gm-Message-State: AOJu0YwYMG469S4D5ekzaaUOXLpSERjVkKw9SpLd+dPRypKjBf5PTPjG
	wGnczd6Xwp5nH31MdPiXgWNtRzRTQAPoB+Nn79tSKlJyuqbwu9B8kr5QpBfDSChMHdxVgAsJ4ot
	5
X-Google-Smtp-Source: AGHT+IEHVMB7Pqg7J8XM/Oo7v1JkzIVkSENTx0XtowE73AoWT/e23FDKG4nUWnJNxb95jaBAxraw4g==
X-Received: by 2002:a25:204:0:b0:de5:5a39:2cb0 with SMTP id 4-20020a250204000000b00de55a392cb0mr2144276ybc.31.1713963502353;
        Wed, 24 Apr 2024 05:58:22 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:58:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 4/4] x86/shadow: correct shadow_vcpu_init()'s comment
Message-ID: <ZikB62jWANnUcQ7U@macbook>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <fea51839-4405-4330-8493-c544b9edf035@suse.com>
 <ZijZldtvQ_e1h6ys@macbook>
 <9b2d08c1-2bb0-4142-9722-0d2045041f2c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b2d08c1-2bb0-4142-9722-0d2045041f2c@suse.com>

On Wed, Apr 24, 2024 at 01:44:39PM +0200, Jan Beulich wrote:
> On 24.04.2024 12:06, Roger Pau Monné wrote:
> > On Tue, Apr 23, 2024 at 04:33:09PM +0200, Jan Beulich wrote:
> >> As of the commit referenced below the update_paging_modes() hook is per-
> >> domain and hence also set (already) during domain construction.
> >>
> >> Fixes: d0816a9085b5 ("x86/paging: move update_paging_modes() hook")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/mm/shadow/common.c
> >> +++ b/xen/arch/x86/mm/shadow/common.c
> >> @@ -99,11 +99,12 @@ int shadow_domain_init(struct domain *d)
> >>      return 0;
> >>  }
> >>  
> >> -/* Setup the shadow-specfic parts of a vcpu struct. Note: The most important
> >> - * job is to initialize the update_paging_modes() function pointer, which is
> >> - * used to initialized the rest of resources. Therefore, it really does not
> >> - * matter to have v->arch.paging.mode pointing to any mode, as long as it can
> >> - * be compiled.
> >> +/*
> >> + * Setup the shadow-specific parts of a vcpu struct. Note: The
> >> + * update_paging_modes() function pointer, which is used to initialize other
> >> + * resources, was already set during domain creation. Therefore it really does
> >> + * not matter to have v->arch.paging.mode pointing to any (legitimate) mode,
> >> + * as long as it can be compiled.
> > 
> > Do you need to keep the last sentence?  If update_paging_modes is
> > already set at domain create, the 'Therefore it really does...'
> > doesn't seem to make much sense anymore, as it's no longer
> > shadow_vcpu_init() that sets it.
> 
> I thought about dropping, but the "any mode does" seemed to me to be still
> relevant to mention. I thought about re-wording, too, without coming to any
> good alternative. Hence, despite agreeing with you that 'Therefore ...' does
> not quite fit (anymore), I left that as is.

To me the "was already set during domain creation" does already imply
it's set to "any (legitimate) mode", and hence the tailing sentence
feels out of place.

> > Possibly with that dropped:
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Feel free to keep the chunk and the Ack, I guess we could always
remove at a later point anyway.

Thanks, Roger.

