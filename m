Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF75290657
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8087.21542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPpT-0007Xc-N2; Fri, 16 Oct 2020 13:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8087.21542; Fri, 16 Oct 2020 13:31:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPpT-0007XD-Jb; Fri, 16 Oct 2020 13:31:31 +0000
Received: by outflank-mailman (input) for mailman id 8087;
 Fri, 16 Oct 2020 13:31:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kTPpS-0007X8-P5
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:31:30 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18235c20-78d0-417a-b253-90f932c5f83f;
 Fri, 16 Oct 2020 13:31:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h7so2966233wre.4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:31:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m14sm3501750wro.43.2020.10.16.06.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:31:28 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kTPpS-0007X8-P5
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:31:30 +0000
X-Inumbo-ID: 18235c20-78d0-417a-b253-90f932c5f83f
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 18235c20-78d0-417a-b253-90f932c5f83f;
	Fri, 16 Oct 2020 13:31:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h7so2966233wre.4
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ILev03gENE1fDCXPJ/uLCG5cBWF9ijbz/VU3bAdmti0=;
        b=sE0bPxP/Z0tEev9xpGw0i+lBhjl6zlvHwCttlnxNGDS8Mivs7tmCHw8qt3Mclb61vs
         rI2zbaphZ3eskWpWEtx9IGbrLVQH/WwwN3roWF2+EO1dTiXQ4NdBvwzaxZDhvEvRu+Uf
         Rc2iRMGr/dr232Uu7wqY19fLdMjLGhOU/kUoZ0ZsoacLJepFRSBSrftzKwYa2A28Rmzx
         SjJAs/m34b6sqqgB7Teq+DZZxsMLZ0f65bVtBwr3R+Kl2o40E0Y1abZvf+Vij3Ej+nZY
         cIaoGC9iWDoHiWtkGIPMCRniAOjxnX70lVGrLI+NVZ5yV8NkE4sgLJE1m6zYV/pJ3/VW
         w74w==
X-Gm-Message-State: AOAM533gGIc9L7o/tn23yfwcAk6MIk707HM8JhUI/6MB8fVByEBVMUVE
	xXUseZi3XnYr8g+LU5gSRu4=
X-Google-Smtp-Source: ABdhPJwUD57fyqhy9vPp6E/z3GVHCfQzexQkwf3J3HBaVqdsmVPBe1NA2N9tWyrbtstKvSN6q5M2rQ==
X-Received: by 2002:adf:8b85:: with SMTP id o5mr4149964wra.104.1602855089170;
        Fri, 16 Oct 2020 06:31:29 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id m14sm3501750wro.43.2020.10.16.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 06:31:28 -0700 (PDT)
Date: Fri, 16 Oct 2020 13:31:27 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/gdbsx: drop stray recursion into tools/include/
Message-ID: <20201016133127.keb6v66fgnuxdxew@liuwe-devbox-debian-v2>
References: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
 <24456.19422.318790.279648@mariner.uk.xensource.com>
 <20201016132649.3ib7wiyucbukmvxo@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016132649.3ib7wiyucbukmvxo@liuwe-devbox-debian-v2>
User-Agent: NeoMutt/20180716

On Fri, Oct 16, 2020 at 01:26:49PM +0000, Wei Liu wrote:
> On Thu, Oct 15, 2020 at 02:17:18PM +0100, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH] tools/gdbsx: drop stray recursion into tools/include/"):
> > > Doing so isn't appropriate here - this gets done very early in the build
> > > process. If the directory is mean to to be buildable on its own,
> > > different arrangements would be needed.
> > > 
> > > The issue has become more pronounced by 47654a0d7320 ("tools/include:
> > > fix (drop) dependencies of when to populate xen/"), but was there before
> > > afaict.
> > > 
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> I tried to applied this one but git didn't like it.
> 
> Jan, feel free to apply it yourself.

This is already applied. Sorry for the noise.

Wei.

