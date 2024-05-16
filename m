Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B598C739F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722924.1127322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XHR-0007MT-KB; Thu, 16 May 2024 09:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722924.1127322; Thu, 16 May 2024 09:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XHR-0007JK-G9; Thu, 16 May 2024 09:20:05 +0000
Received: by outflank-mailman (input) for mailman id 722924;
 Thu, 16 May 2024 09:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7XHP-0006Gj-KW
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:20:03 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 796884b5-1365-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 11:20:02 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78f02c96c52so480748685a.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:20:02 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-793017facabsm95003685a.88.2024.05.16.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 02:20:00 -0700 (PDT)
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
X-Inumbo-ID: 796884b5-1365-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715851201; x=1716456001; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wx6W+ENlg5PRro4DaaU11kdGbIPXqjVb6ItABsLuQ9w=;
        b=nZYzH3cuRe50fJ9FBITUVcvfGrSvn47VKLUXCUjFj8K4q9KBe40OjNvH49jMSgfFcE
         q2Qmm/EgKcb/9nPEqZcd9U+w5KtCf8KjkdrQxd70q4ZR7Hhqxmlg9zB/yKNRih9nQNjY
         rhOjfZmnB+/9SYeMpH4sgpp6CHzVZDUDDShLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715851201; x=1716456001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wx6W+ENlg5PRro4DaaU11kdGbIPXqjVb6ItABsLuQ9w=;
        b=lbyT2QHKnf5VW03KtPtnzi9NPEd2qEFWQ9t9FQorFffapdCt5/9N9BjkW0/gfMLLjZ
         B0thHlGmnHBDQj49L68ka3N6ae1FjLSV6pCsE6wesf1eGR09zypS8HGoVttqy34r3M31
         NdhYtE5btZmZN9bs6vKcw/6HZ62b8YY1EKstiMa9XP6/+IgvioBgadhS7QDLSgPxUWW9
         RKv9iMLS2RNbxpzTZMkxUgc3CP9Ufln2c1C/qtEBb8lcEXMHnNACQhPJDLjGIcHO4Oa0
         qRqDuDTqmvtFyQ2gAS0NgMkJnpPgrN6gmSLWkpQkfOPrUprVbQ0O0OkqKiGX5ybq4+ZI
         fRag==
X-Forwarded-Encrypted: i=1; AJvYcCVKLKR3IAtQblab84RfsQgfVEBlbp5GzYMS6GuwtrTaXYkFrPMPF/fRK41ck3BK7ISvthPOjfSdv9bw8eAbdynH7Xw0xfC08VFUUPgWkhA=
X-Gm-Message-State: AOJu0YyJsAhvTq1wd77K1HmvJQ3Hn+EajzY/Ppo9HlxbqBgV6qCOmgjz
	04JLc3hdza3ep5QBNhx+xhvzWOHECxyWpZnBZbOtfeCU3sbSvZM86J0TjA+Qla4=
X-Google-Smtp-Source: AGHT+IFBgbpaG+gm/fpEGXhcgTZ//0BPdTq1H4gMyQB8ODnBMFM52h2/0ZyWQvjIozD5yw2uGU78Fg==
X-Received: by 2002:a05:620a:c93:b0:792:c175:b12f with SMTP id af79cd13be357-792c7600ee8mr1860050685a.63.1715851201414;
        Thu, 16 May 2024 02:20:01 -0700 (PDT)
Date: Thu, 16 May 2024 11:19:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Elias El Yandouzi <eliasely@amazon.com>, xen-devel@lists.xenproject.org,
	julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Message-ID: <ZkXPvgRupZw31nGw@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com>
 <ZkMs1cknBFBWZoJG@macbook>
 <086f1bbe-2b86-493e-8936-81f420500672@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <086f1bbe-2b86-493e-8936-81f420500672@suse.com>

On Wed, May 15, 2024 at 03:54:51PM +0200, Jan Beulich wrote:
> On 14.05.2024 11:20, Roger Pau Monné wrote:
> > On Mon, May 13, 2024 at 01:40:33PM +0000, Elias El Yandouzi wrote:
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
> >>  hardware guarantees (with, where available and known to Xen, respective
> >>  tweaks applied).
> >>  
> >> +### directmap (x86)
> >> +> `= <boolean>`
> >> +
> >> +> Default: `true`
> >> +
> >> +Enable or disable the directmap region in Xen.
> > 
> > Enable or disable fully populating the directmap region in Xen.
> 
> Elias, would you please take care to address earlier review comments
> before sending a new version? This and ...
> 
> >> +
> >> +By default, Xen creates the directmap region which maps physical memory
> >                                                           ^ all?
> >> +in that region. Setting this to no will sparsely populate the directmap,
> > 
> > "Setting this to no" => "Disabling this option will sparsely..."
> 
> ... this is what I had already asked for in reply to v2, of course with
> different wording.
> 
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1517,6 +1517,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >>      if ( highmem_start )
> >>          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
> >>  
> >> +    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
> > 
> > IMO this wants to be printed as part of the speculation mitigations, see
> > print_details() in spec_ctrl.c
> 
> And not "on" / "off", but "full" / "sparse" (and word order changed accordingly)
> perhaps.

I've been thinking about this, and I'm leaning towards calling this
new mode "ondemand" rather than "sparse".  The fact that the direct
map ends up sparely populated is a consequence of populating it on
demand, and hence the later would be more descriptive IMO.

(Same for the Kconfig option then ONDEMAND_DIRECTMAP, or some such)

Thanks, Roger.

