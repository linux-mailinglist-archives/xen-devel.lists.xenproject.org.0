Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B823F86B048
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686609.1068814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJxZ-00019X-ES; Wed, 28 Feb 2024 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686609.1068814; Wed, 28 Feb 2024 13:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJxZ-00016N-BW; Wed, 28 Feb 2024 13:26:57 +0000
Received: by outflank-mailman (input) for mailman id 686609;
 Wed, 28 Feb 2024 13:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqYS=KF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfJxY-00016H-1j
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:26:56 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f36609-d63d-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 14:26:55 +0100 (CET)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6901114742bso9477176d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:26:55 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 mf2-20020a0562145d8200b0068f752195b5sm5245824qvb.86.2024.02.28.05.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 05:26:53 -0800 (PST)
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
X-Inumbo-ID: 09f36609-d63d-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709126814; x=1709731614; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCMMSK93bM8/azXpNgcJi8z64clOQqCgYjwRGy5nd+I=;
        b=ZP2DQkG8cWG0fIEGEH5nvn4x2oyn2j6EJJUcIV11NsyH/8YdJDP0KY/lXmdWAyrVof
         e+KCRRJ6PMCUltUiNKaxDGjec7Kpp5yAV2LpOX9jdEdC9dJkYOMWJhp85uHPUq8yVH/f
         dydFZqskfCaOcr7K/R9AVXlo23rcCSL4ilslg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126814; x=1709731614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCMMSK93bM8/azXpNgcJi8z64clOQqCgYjwRGy5nd+I=;
        b=pirJcD7qUYwC+nTZ5a6wpgjGmrZJDfqStpjxhYIc7h43jVzBLCdssIDAcKLJp7OPuV
         H7V3cNUlRLnUOwtbxDm+vccz17ctR4jkEJBFzps5Izy+/8QudsH16SXSLlvQZTvo+5+l
         iHlc/DhuzPz0mCVASyItKwE7IlOorTTJt6dij25YQpyBLfT9kKCvm5PFIBoWNEFYGfe6
         N6rrnC0vKdJVM7IXQuEUBhPhqz2Om7LikeyT75x5rCFUYEPVNQgCt+3BtBfyB9DEvZ01
         DCVImnrjKYZK4wrrpF0a2lzSfUvNplD7ShW03GfU/YQa7XfTdvttrDQBDNOXWtwJsRuR
         1L5w==
X-Forwarded-Encrypted: i=1; AJvYcCVV9fTB2xGwjcfhsSWeORvFn2bSVo0VtgqAg9Vbe9Ccu7k+4Y1yLpopirfGHJQwaWg1+P7JRknxXoL34yGpJWGVzQb5FAK9FJ9P0UEDxlo=
X-Gm-Message-State: AOJu0YyZ1q8Ix1yNm9vwlGlCnZ7v3oPPpKZsRUpjJ/JmTIvLj5dp0UvK
	+yNOeXaZBDL01qxvX8vOtDkWbHzx0VnhT6vAFCuHRCzb0ufuvt++wx+YuKXitRA=
X-Google-Smtp-Source: AGHT+IGlQSdmNSEnpcRaosxZdKOAXmTYrGh5veoT5xTz+bzJp6Zr+ZENrB1//t1TL+zWdmGI5oodcw==
X-Received: by 2002:a0c:9a08:0:b0:68f:441b:66ea with SMTP id p8-20020a0c9a08000000b0068f441b66eamr4306024qvd.26.1709126813874;
        Wed, 28 Feb 2024 05:26:53 -0800 (PST)
Date: Wed, 28 Feb 2024 14:26:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Fwd: New Defects reported by Coverity Scan for XenProject
Message-ID: <Zd80m6-4YNasktjg@macbook>
References: <65df054dd791_2895d52c84469bd9989838e@prd-scan-dashboard-0.mail>
 <27fad7c4-905b-4181-9882-f383eb194032@citrix.com>
 <d81f78a8-3e04-4fba-95fc-3b602ee3a740@citrix.com>
 <b174757c-8463-4561-ae95-a5791d33080b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b174757c-8463-4561-ae95-a5791d33080b@suse.com>

On Wed, Feb 28, 2024 at 02:04:23PM +0100, Jan Beulich wrote:
> On 28.02.2024 13:19, Andrew Cooper wrote:
> > Take 2, hopefully with Stewart's correct email address this time.
> > 
> > ~Andrew
> > 
> > On 28/02/2024 12:17 pm, Andrew Cooper wrote:
> >> Not sure how well this is going to be formatted, but there's one new and
> >> potentially interesting issue found by Coverity.
> 
> To be honest I didn't consider this interesting at all, but instead a false
> positive due to limited insight that the tool has. But maybe I was wrong
> and you see something I didn't see? vpci_process_pending() is vCPU-local
> (run from the guest resume path), and hence there simply are no two threads
> who want to look at the field. Storing NULL into it is merely a kind of
> progress indicator, relevant to the given vCPU only.

Indeed, there's no (intended) way for vpci_process_pending() to be
executed concurrently against the same vcpu parameter, and hence there
should be no concurrency hazards.  Setting it to NULL is a mere
indication there's no further work to be done, and the vCPU can resume
guest context execution.

defer_map() (the function that queues the work to be done) can only be
reached as a result of a guest accessing the PCI config space, so if
the vCPU is not running defer_map() can't be called either for that
vCPU.

Thanks, Roger.

