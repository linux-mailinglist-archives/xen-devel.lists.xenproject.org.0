Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C46196DC2
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 15:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIYIw-000455-FP; Sun, 29 Mar 2020 13:48:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIYIu-00044s-W0
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 13:48:45 +0000
X-Inumbo-ID: 01374f74-71c4-11ea-8d94-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01374f74-71c4-11ea-8d94-12813bfff9fa;
 Sun, 29 Mar 2020 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=dMeLDkByMNmT1EIlc/J38W18kXT0ER8zOpubOOgkMYE=; b=Yv/1Ysp/6/9awpHfZ/3NZWQLHf
 uVWWnht+ugQwBEmAQNsnrbUglObK4fkmn1erXszrn7cRT4p+CHJUhwvo86wWN/2GChQvYSELwGy5I
 GgZ47f0QkcqDAor//JfhyTWDhpmAZ91L8cPpAxviobmpAIT9DTJGOklHIYN/KlpXM6Ks=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIYIs-0003na-W1; Sun, 29 Mar 2020 13:48:42 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIYIs-0001nL-NP; Sun, 29 Mar 2020 13:48:42 +0000
Date: Sun, 29 Mar 2020 14:48:39 +0100
From: Wei Liu <wl@xen.org>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200329134839.akygrmhq3qxxsrtl@debian>
References: <20200329061608.GA29651@simran-Inspiron-5558>
 <20200329134657.zdbanqkhzmtmurue@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329134657.zdbanqkhzmtmurue@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: Compress lines for immediate return
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Mar 29, 2020 at 02:46:57PM +0100, Wei Liu wrote:
> On Sun, Mar 29, 2020 at 11:46:08AM +0530, Simran Singhal wrote:
> > diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
> > index 5c48f868ae..2bc0d04a1f 100644
> > --- a/xen/arch/x86/oprofile/op_model_athlon.c
> > +++ b/xen/arch/x86/oprofile/op_model_athlon.c
> > @@ -343,9 +343,8 @@ static int athlon_check_ctrs(unsigned int const cpu,
> >  		}
> >  	}
> >  
> > -	ovf = handle_ibs(mode, regs);
> >  	/* See op_model_ppro.c */
> > -	return ovf;
> > +	return handle_ibs(mode, regs);
> 
> Hmm... ovf can potentially be set in the for loop before this hunk, but
> then immediately get overwritten by the function call. I bet the ovf = 1
> line is the reason why you didn't remove ovf out right.
> 
> I think you can perhaps just remove ovf here. It would make any
> difference logically.

I meant "It would _not_ make any difference logically" here.

Wei.

