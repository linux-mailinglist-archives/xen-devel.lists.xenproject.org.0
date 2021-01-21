Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93D2FEEE6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72207.129829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2byP-0007YL-Mf; Thu, 21 Jan 2021 15:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72207.129829; Thu, 21 Jan 2021 15:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2byP-0007Xw-J3; Thu, 21 Jan 2021 15:34:13 +0000
Received: by outflank-mailman (input) for mailman id 72207;
 Thu, 21 Jan 2021 15:34:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2byN-0007Xo-R4
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:34:11 +0000
Received: from mail-wr1-f41.google.com (unknown [209.85.221.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0050045f-0da1-4849-860e-0e3976a885f2;
 Thu, 21 Jan 2021 15:34:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id 7so2178902wrz.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:34:10 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 62sm9037573wmd.34.2021.01.21.07.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:33:47 -0800 (PST)
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
X-Inumbo-ID: 0050045f-0da1-4849-860e-0e3976a885f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ov5FWnD6SJBoDhkCBPs5mY/7rByP75QtF4I5lrCAEU=;
        b=X5ZPFR4qw+EghilYd9Mql7Cm8UpwqSrpqpfwZth4tHptTtny4CrM99aqinaO92CT7d
         JZTSJ6N19GiRyrSIJH2aEf0SdawHfFy6WlPgvuada/wtNJQFSjLOZSYEIPRCcxPVP3q+
         +Weyq/HZhqYH2bC20KXlW1tuLDlxS01umVaGKk2P1EuGADsBThKZOUCOwuyKEmDO6QL5
         qhgt/utHTgiHRXCr85996iJrk3Qfrp4OizNtj7rOb2zWiUwg4gaG73JfZNXUw4pcRFn0
         KufIL2oxxvJ9ehcrQ2c5xoKudBu26D1kjwtIs0vGlL8AOM1GLBIXdvRzsUpPzog1Ff8R
         Xxmg==
X-Gm-Message-State: AOAM531M5+l+muDyq5UcLG0YBd2gEtIiR3to9hMD1VPCfs5ETZR93L/Y
	eyvlkBEgxmr/4qYjG4whB0E=
X-Google-Smtp-Source: ABdhPJxTHmqt4iLutD4pBomli9EQLgrPkH6UwFMTVBVhr/5SrjfsyarZrJ4BIQU8ZjGgnc2ezStp/A==
X-Received: by 2002:adf:a319:: with SMTP id c25mr29503wrb.262.1611243250146;
        Thu, 21 Jan 2021 07:34:10 -0800 (PST)
Date: Thu, 21 Jan 2021 15:33:23 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/5] libxenguest: support zstd compressed kernels
Message-ID: <20210121153323.tsldj2e44rlw2equ@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <403d985c-b4c0-d8d1-4f42-7e1fe6ae3ee0@suse.com>
 <20210121150102.iifaquysrbkkx2tz@liuwe-devbox-debian-v2>
 <b3500237-e00b-cf70-12a6-37ed0ea55a01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3500237-e00b-cf70-12a6-37ed0ea55a01@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Jan 21, 2021 at 04:05:39PM +0100, Jan Beulich wrote:
> On 21.01.2021 16:01, Wei Liu wrote:
> > On Tue, Jan 19, 2021 at 04:15:25PM +0100, Jan Beulich wrote:
> >> This follows the logic used for other decompression methods utilizing an
> >> external library, albeit here we can't ignore the 32-bit size field
> >> appended to the compressed image - its presence causes decompression to
> >> fail. Leverage the field instead to allocate the output buffer in one
> >> go, i.e. without incrementally realloc()ing.
> >>
> >> Note that, where possible, instead of #ifdef-ing xen/*.h inclusions,
> >> they get removed.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > 
> > Acked-by: Wei Liu <wl@xen.org>
> 
> Thanks, but I'm about to send v2.5 to address the issue reported
> by Michael Young (adjusting configure{.ac,} only).
> 
> >> ---
> >> Note for committer: As an alternative to patching tools/configure here,
> >> autoconf may want re-running.
> > 
> > Noted. FWIW I use Debian 10 to generate configure. If I don't get around
> > doing it someone who runs the same system should be able to help.
> 
> Well, the version I've been using to re-generate isn't identical
> to yours, but allows easily filtering out and discarding the few
> extra differences, which is why I dared to provide a diff for
> tools/configure in the first place. IOW if I would commit this
> myself, all I would ask that you or someone else using the
> "original" autoconf to generate the committed version to double
> check.

This works too.

Wei.

> 
> Jan

