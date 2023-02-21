Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646169DC3C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 09:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498582.769461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOBk-0007Ur-Vf; Tue, 21 Feb 2023 08:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498582.769461; Tue, 21 Feb 2023 08:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOBk-0007S2-Rx; Tue, 21 Feb 2023 08:39:52 +0000
Received: by outflank-mailman (input) for mailman id 498582;
 Tue, 21 Feb 2023 08:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhWi=6R=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1pUOBj-0007Rw-D1
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 08:39:51 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e090336-b1c3-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 09:39:50 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id b12so13866130edd.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 00:39:50 -0800 (PST)
Received: from gmail.com (1F2EF163.nat.pool.telekom.hu. [31.46.241.99])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170906539700b008b128106fc7sm6835503ejo.46.2023.02.21.00.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 00:39:49 -0800 (PST)
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
X-Inumbo-ID: 4e090336-b1c3-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+s3LghqL/xNmAVCsHxyUzyrjEgIj+4vMZ5iip7icUXw=;
        b=BeQAjFO9ydOReLQGkvdAAU/LRuf7WcC3QQk2V7giMfmBzOpAzm9xlK5CC7pqR25XYO
         vlGacp8gx2xLItmgNYKS/IMUAEXYqgc+2k0Llwn68G+WN8w0cw1eIrlBvugyaO8H4lS/
         BzIg3kd5h5tmPj7T9vF1Fs/6Dk+Iqc87s1guyXkDF9rMOCXyoQZIOv3D1LDA4GZHESE0
         EYzFl3AVlvWz0sIpKB8UluoBij7uzBsbQK8gurSlP8igsiOZW6EplyCpUfnkjf9HNkcM
         RlhbNcoeXHkIW/eq4lkUtsoDgBuMy/6lmqx1/QUZVYjWkOZ3D5R0BXviU0TBpy30MiOL
         YvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s3LghqL/xNmAVCsHxyUzyrjEgIj+4vMZ5iip7icUXw=;
        b=lgZB/fy1Uk5a8WMdlpKcTP7AxiFubyv40K7mn/bP+tni/02HUG0GCIp45P/+UnqcZq
         o+mQ1a85IbvSOyXOWJNH4n/seYirfPGV16z+T3qPTMJeL4AVJUmDc66S8yh4MuDmsHWZ
         g1psQZLnbF6IDnmU/+Y1drwfctqqYm3hBHABIsczfx/3KUL3I/8HpcTa/t8kipaxsSAs
         rQMJU/yakIQ/NK3Rm4a+QvWOnDG5bWxNxC89P4Mnwht/Le5n6FwVdIcvCpWhSgG4by1d
         t/2g7KG3ERcAD1+7dff7SjaRAIScq7YEykqu3HmxKhJwzxEVgBzxvSWRCZ8IRyeQMywU
         qRIg==
X-Gm-Message-State: AO0yUKWUplBZILiDcqF5VggCg6UUyfobc5MpzhBdjypvU2hCuL2jdtAh
	sxQTAtrdTAoGKybloHyMryE=
X-Google-Smtp-Source: AK7set8zE5R9imDjkfkNuxiJSk0+e0JA3dNsTUxWIeITlzljnpOOVxOFMIa6S9dDuddJcALQVRJnQQ==
X-Received: by 2002:a17:906:2358:b0:88d:d700:fe15 with SMTP id m24-20020a170906235800b0088dd700fe15mr10557817eja.0.1676968789991;
        Tue, 21 Feb 2023 00:39:49 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 21 Feb 2023 09:39:47 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Xen Devel <xen-devel@lists.xenproject.org>,
	Per Bilse <per.bilse@citrix.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the xen-tip tree
Message-ID: <Y/SDU7d2LS9ka1+a@gmail.com>
References: <20230214124700.22f0a62e@canb.auug.org.au>
 <Y+tu6Xqqb6cdiDAA@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+tu6Xqqb6cdiDAA@hirez.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Feb 14, 2023 at 12:47:00PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the tip tree as different commits
> > (but the same patches):
> > 
> >   415dab3c1796 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspace")
> >   336f560a8917 ("x86/xen: don't let xen_pv_play_dead() return")
> >   f697cb00afa9 ("x86/xen: mark xen_pv_play_dead() as __noreturn")
> > 
> > These are commits
> > 
> >   859761e770f8 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspace")
> >   076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead() return")
> >   1aff0d2658e5 ("x86/xen: mark xen_pv_play_dead() as __noreturn")
> > 
> > in the tip tree.
> 
> This was intentional (dependencies) and the plan is to only offer the
> tip branch for merge after the Xen tree goes in.

The rebase & *duplication* was not intentional at all - I assumed 
1aff0d2658e5 won't get rebased. :-/

We'll probably have to redo the objtool tree.

Thanks,

	Ingo

