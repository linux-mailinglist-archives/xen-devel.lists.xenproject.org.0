Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13512CED5E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44612.79945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9V8-0005mB-Tc; Fri, 04 Dec 2020 11:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44612.79945; Fri, 04 Dec 2020 11:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9V8-0005lm-QG; Fri, 04 Dec 2020 11:43:50 +0000
Received: by outflank-mailman (input) for mailman id 44612;
 Fri, 04 Dec 2020 11:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9V6-0005lh-MZ
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:43:48 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdf0a977-74ff-4814-b36b-1c9a2445ed16;
 Fri, 04 Dec 2020 11:43:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e7so5018385wrv.6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:43:48 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c4sm3543772wrw.72.2020.12.04.03.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:43:46 -0800 (PST)
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
X-Inumbo-ID: fdf0a977-74ff-4814-b36b-1c9a2445ed16
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TBsEIpScqNtA8NjsGdqkjDDgChffWoqT9fq2HeODi5k=;
        b=kn2KzRGzsz5ZMAyXoveBrk8/T4OW29FZljT6qkydVOlXcKozZN0PeHAu6GAF3zracE
         ZRlRm19qkeBqM2dEtU9O8yyR6J0o6JMeQ3kruM/EJMl39yT/QCSu2kuMcsUEqTSdo/tC
         FXxXQyUM0F7Z/7J1fcTkSUHs1QDErCbS/d9eV3SczxGCAaY82XEcb3LEqP/QjH3ykov1
         igASPLYi/e2ynuYM0S7wfNbJPLgdnrf9YhlPGgMEgFUWKxFtDVq+ggyCdK1eRcpuemw9
         pffl2UOZKOTEqQ3CKujcbEiI30sGwIelBB6/FGaj2BB6gvBPFokrghTUqfXNq9uT3Ec3
         VVpg==
X-Gm-Message-State: AOAM531XHlZ+oZ/stYwAvOd5gFx22Ifhh2Jd+rZ30mPTnte0+SFMIBUe
	jJmA+Oeyof0huZXmcM9IZyI=
X-Google-Smtp-Source: ABdhPJzRSI29a+WSBAXVgoVxCU2YR7XeXSWUlbj9yt2Ezi+u8MjcugCTWZvJ9q9eSggeFI/JErVKKw==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr4404691wrw.160.1607082227354;
        Fri, 04 Dec 2020 03:43:47 -0800 (PST)
Date: Fri, 4 Dec 2020 11:43:45 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 0/8] xen: beginnings of moving library-like code into
 an archive
Message-ID: <20201204114345.4hbw3gkpzqnb4uf3@liuwe-devbox-debian-v2>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Nov 23, 2020 at 04:16:02PM +0100, Jan Beulich wrote:
[...]
> 
> 1: xen: fix build when $(obj-y) consists of just blanks
> 2: lib: collect library files in an archive
> 3: lib: move list sorting code
> 4: lib: move parse_size_and_unit()
> 5: lib: move init_constructors()
> 6: lib: move rbtree code
> 7: lib: move bsearch code
> 8: lib: move sort code

Acked-by: Wei Liu <wl@xen.org>

