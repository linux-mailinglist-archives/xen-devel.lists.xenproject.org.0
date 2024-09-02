Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F819680DD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 09:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787559.1196950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1im-0000dM-An; Mon, 02 Sep 2024 07:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787559.1196950; Mon, 02 Sep 2024 07:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1im-0000br-7n; Mon, 02 Sep 2024 07:43:32 +0000
Received: by outflank-mailman (input) for mailman id 787559;
 Mon, 02 Sep 2024 07:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl1ik-0000bk-3c
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 07:43:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b70625a-68ff-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 09:43:29 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so15949265e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 00:43:29 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e274c1sm128170425e9.36.2024.09.02.00.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:43:27 -0700 (PDT)
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
X-Inumbo-ID: 0b70625a-68ff-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725263008; x=1725867808; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suIbnb44cUpGBEqvf50PtENMikIrqtAa2Of2Lf0WX04=;
        b=fnOTnz5X1bSUuk3MU81imQhi/6G1jXucewedNdYfuK2+ml0E9UuUGWCqihTpFLUyrF
         5v2iOgp77XtXobRexg6FLYeIYQpT2CmQUsmrffg4xhelCFGMczZ+r0fh+PbtImwDfxr0
         bqHJGVHBpsWHkEuUAGV32UsIEBHA7HlZcHRGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263008; x=1725867808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suIbnb44cUpGBEqvf50PtENMikIrqtAa2Of2Lf0WX04=;
        b=e/CcerBUh7hLD0zY/2V2F+iCe/QqT9/7yzu7EmX08tYJnVOLKr2gLMWtisWoigtfL0
         /nK1tOyYSKYVhNvvFU1BjIZibJFD0FrQGibgw0pVFrvq3Jg2h0yhF7zySHu5pWvKaCz0
         zlWtdMR9QOTNCjRvbhIfrKm0txM0Q21RWOVq7S3nsvh2DU+tfuOGJjP6VtVE5ZliBmeS
         wI/sHwuyo9l5pdE5BcdTNqz6ICLUI9xhXLa9K1grervVMO4LED59skL79RQRrx7Aa/iS
         re8Kn9I3cRUuhKOjXDLoojxsHCEVE+lqmlJqT9gmEg6qC14bia1bGZMOH/Uy2EUO3DgI
         mtJA==
X-Forwarded-Encrypted: i=1; AJvYcCWOvUyThjVDvDUPJURyakl4JjdhSNFUh75EjMDofdArTmg7BHBReaMeKwaaN/KQgZZNfN0x873zAE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi3j3RHmGDUq8vJbh+zs7vTQjIGpCpBML4LCW8k4n7RfQQD65K
	geWtJaucizwJ6B5SH9rVOg8MMTGlPfSAJJgrgw5Ivy3jJFlllYyUpux18Qt6Rm8=
X-Google-Smtp-Source: AGHT+IEKgmlI78IevKKwQUIMUFKcM8ddjbB9oQjrc9RNZRtyUA7ejkR4JZd42V2Jnl1al4smsEsWNA==
X-Received: by 2002:a05:600c:3c8e:b0:429:d0cb:950f with SMTP id 5b1f17b1804b1-42bb02c2031mr98529485e9.2.1725263007947;
        Mon, 02 Sep 2024 00:43:27 -0700 (PDT)
Date: Mon, 2 Sep 2024 09:43:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
Message-ID: <ZtVsnqdU_URZu76d@macbook.local>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
 <da5d2ccc-6a21-4bcc-8ceb-75b930dcdabe@suse.com>
 <ZtGOWAnqGu-XNCgy@macbook.local>
 <9ac39818-2259-4aa2-8bc6-17809fe62368@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ac39818-2259-4aa2-8bc6-17809fe62368@citrix.com>

On Fri, Aug 30, 2024 at 08:17:40PM +0100, Andrew Cooper wrote:
> On 30/08/2024 10:18 am, Roger Pau Monné wrote:
> > On Thu, Aug 29, 2024 at 09:04:37AM +0200, Jan Beulich wrote:
> >> On 29.08.2024 02:35, Stefano Stabellini wrote:
> >>> On Mon, 29 Jul 2024, Stefano Stabellini wrote:
> >>>> On Mon, 29 Jul 2024, Federico Serafini wrote:
> >>>>> Add defensive return statement at the end of an unreachable
> >>>>> default case. Other than improve safety, this meets the requirements
> >>>>> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> >>>>> statement shall terminate every switch-clause".
> >>>>>
> >>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>>
> >>>>> ---
> >>>>> No changes from v3 and v4, further feedback on this thread would be appreciated:
> >>>>> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
> >>> Looking at the older threads, I looks like Jan suggested EACCES, I also
> >>> think it is marginally better. My R-b stands also for EACCES. Jan, I
> >>> think you should go ahead and fix on commit
> >> No, I very definitely want a 2nd x86 maintainer opinion here. Or a better
> >> suggestion for the error code to use by anyone. After all, as you confirm,
> >> EACCES is only marginally better.
> > Hm, the only alternative I could suggest is using ERANGE, to signal
> > the value of opt_mmio_relax is out of the expected range, however that
> > could be confusing for the callers?
> >
> > One benefit of using ERANGE is that there's currently no return path
> > in get_page_from_l1e() with that error code, so it would be very easy
> > to spot when an unexpected value of opt_mmio_relax is found.  However
> > there are no guarantees that further error paths might use that error
> > code.
> 
> EPERM and EACCES are both very wrong here.  They imply something that is
> simply not appropriate in this context.
> 
> We use EILSEQ elsewhere for believed-impossible conditions where we need
> an errno of some kind.  I suggest we use it here too.

Fine with me.  With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

