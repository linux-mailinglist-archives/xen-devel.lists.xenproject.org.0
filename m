Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71005B03F9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401566.643413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuF7-0008Sw-7F; Wed, 07 Sep 2022 12:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401566.643413; Wed, 07 Sep 2022 12:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuF7-0008QK-4A; Wed, 07 Sep 2022 12:33:21 +0000
Received: by outflank-mailman (input) for mailman id 401566;
 Wed, 07 Sep 2022 12:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVuF5-0006fq-IB
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:33:19 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4019e2bc-2ea9-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:33:18 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id z187so14464149pfb.12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 05:33:18 -0700 (PDT)
Received: from leoy-huanghe.lan (45.78.11.189.16clouds.com. [45.78.11.189])
 by smtp.gmail.com with ESMTPSA id
 4-20020a620504000000b00537b1aa9191sm12648211pff.178.2022.09.07.05.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:33:16 -0700 (PDT)
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
X-Inumbo-ID: 4019e2bc-2ea9-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UZyeeIW6CDevxhzZZ82aZV1Yflrt63k7g2aNi/UkNrU=;
        b=HYlGGA9TcnWG+BLBQP4YD1YmU7c0dpCZpYw9/2pFvu/5suTNvhw7Fg7rNeZCvznoT4
         N/38/K2mW7tbwutimpMfkn2d/QBVW4GJ1BlPXuaA8uMhfciMlJUXkj8jIBSLZR4u7DDv
         AkT83BL5z9/nG6ZdMxml5vuuM3O9ieG5GxbgF1y5+DyB7xuktC8SuzhNDHGwSbCW8zdg
         sZRZqcdsSHBGFh+u5a9rNqk5rcLgNc4KVou5N+Q/pF+T8OqrXdqw50GoMmQr9XJFNOjm
         pgugaNmRUqfwGCeCARfjdasXLdYJWgPE7iZ5CVmyiQz09GtAFT0jF56PMVeI0ToZTL5X
         ZkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UZyeeIW6CDevxhzZZ82aZV1Yflrt63k7g2aNi/UkNrU=;
        b=JVkiJkcQnutXz68HXYa9hcOr6+0aNmn46fmbJ9nqzh9oeyP0Jn5fJJTcSxdBPYyCNy
         iBje/WvV1VHCXnoYMD78KG+inTL2Iya8ZCuDNH8MZCvI0Ff+N1hozCPfPs7zuvixzjn6
         9TNYUaq3zNt4NielcBNhsMoT/fRSqmjt+MC3cerbVIuZN/NbHkWWBOOcM2jCzF8iGXAo
         moaQi4Fl/htiyCy1oqkD7Qrep5W2B1W7J3GV9YErFrRBxQArSzntiIIwnrG2EoTtraKR
         hmzhi5lCmvoM2ovVSrR8JlbpUu90QD4Et2uTseR0orzi+wsdutkUmzvhm9sr3tEMvcEV
         WwIg==
X-Gm-Message-State: ACgBeo0dgheUXgTLRXqKqzX83H4hr4CKlsPbbS4yw4YRB/Gy5SJjBrn8
	KGDPobL0mFm5Xc9sWw+uyMlNUg==
X-Google-Smtp-Source: AA6agR7up8kHTnYebU21hfKdW2j3z1FDTPnNstpgk5JCwQDhildibLLCJIbpsTslffJ8YuXDKgf4Ng==
X-Received: by 2002:a63:1c47:0:b0:434:cb11:5478 with SMTP id c7-20020a631c47000000b00434cb115478mr3310180pgm.398.1662553997388;
        Wed, 07 Sep 2022 05:33:17 -0700 (PDT)
Date: Wed, 7 Sep 2022 20:33:12 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: Add macro for version number string
Message-ID: <YxiPiG/LXfzlnbpw@leoy-huanghe.lan>
References: <20220907120420.387771-1-leo.yan@linaro.org>
 <40400a52-b55a-1c35-5ee8-32ebfb08bc28@suse.com>
 <YxiOf9v5jPsAkRs/@leoy-huanghe.lan>
 <b5b12417-decf-3286-751c-87c78a7e0c40@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5b12417-decf-3286-751c-87c78a7e0c40@suse.com>

On Wed, Sep 07, 2022 at 02:31:52PM +0200, Jan Beulich wrote:
> On 07.09.2022 14:28, Leo Yan wrote:
> > A question, since commit 5d797ee199b3 was merged in 4.11.0-rc6, for
> > fixing it, should I explictly add backport tag as below?
> > 
> >   Backport: 4.11+
> 
> That's up to you, I would say. We don't really use that tag all that much,
> the Fixes: tag is more relevant at least based on recent observations.

Thanks a lot for confirmation.  If so, I will just use Fixes tag.

Leo

