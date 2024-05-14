Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AE8C5484
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721438.1124845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qhI-0003vI-0A; Tue, 14 May 2024 11:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721438.1124845; Tue, 14 May 2024 11:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qhH-0003tl-TC; Tue, 14 May 2024 11:51:55 +0000
Received: by outflank-mailman (input) for mailman id 721438;
 Tue, 14 May 2024 11:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6qhG-0003sZ-HD
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:51:54 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2895d1-11e8-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 13:51:53 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-43de92e234dso50157741cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 04:51:53 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54b58b5sm68207871cf.7.2024.05.14.04.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 04:51:52 -0700 (PDT)
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
X-Inumbo-ID: 5b2895d1-11e8-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715687512; x=1716292312; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKt2WiSV0PMWdBp4aAdKjqCr+kejxER0yNV4tKTETYM=;
        b=PiVvXZrlLuyu7DyDFGCQkskzLLVJAM1CVb/9yKsOh538wMEvIY8Lls2wMNb/DcFJge
         qspOMsnpS4zq9iapQAdUH4c9y03P82SBzKIFlZcENT0RwauX23bfAuaUY6XQZsZHNm5W
         NOzoYhSO6rvhLMVDzEM3b5Ux1Hno3G1t1vvrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687512; x=1716292312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKt2WiSV0PMWdBp4aAdKjqCr+kejxER0yNV4tKTETYM=;
        b=CJsC5cjyzKQG8nlByqG70Zv26Ztg10gteNWPRFRgGjJO1/CDoRS7HTLetBhg/uRiTS
         wWW4IP3MJMHTJ1cdlfMPeXZ9Cv6z03nB5m5uP8x9EgRqcjwtAuO2/hWBTck7lI87XX7w
         Pt63DLV+caL8DtU593YwYWAn9QoD6HtpGFm9RFYDlXg0oktHAph34xaMG7POU40O5Uxs
         QWnxiFUEWkS3Vfa3QhNv1x4m56HkSSWi1eDxONcWIv1QDeQM1RIVNta3raMYJwtyugNr
         nDN3MNM1ygmnfzCl4HeF2tdhliPkltaP0KGTRjYiXz3ASo823K2R+FiPoYETbNRn4MAx
         DOlA==
X-Gm-Message-State: AOJu0Yw+bkwHsyJMsj1wDDr9IJ0m66M74FWGc+QH6G35spErGj7Vsqfo
	krsY53qSEeSUYIyk5KhFjJ47xYteL4/PldtCexnC1o9bzbEq3BBcxFKdcAqe9no=
X-Google-Smtp-Source: AGHT+IEfkjud1hhz/xujaxaGcccgP0hYzTkxTckE1wd3KQXis07UuU3cM+A/lZNiqEd+Aan5+DtlUQ==
X-Received: by 2002:ac8:5d02:0:b0:43e:26f5:7e5d with SMTP id d75a77b69052e-43e26f58193mr28881381cf.12.1715687512512;
        Tue, 14 May 2024 04:51:52 -0700 (PDT)
Date: Tue, 14 May 2024 13:51:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Message-ID: <ZkNQVh-N9UUPxD7F@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com>
 <ZkMxgDPYgaKnmRRE@macbook>
 <87950da7-f765-4656-808f-6c63a29ced3d@suse.com>
 <ZkM7SK8U1Qsk7E3x@macbook>
 <90621115-e370-49a1-b272-d20f861d6137@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90621115-e370-49a1-b272-d20f861d6137@suse.com>

On Tue, May 14, 2024 at 12:26:29PM +0200, Jan Beulich wrote:
> On 14.05.2024 12:22, Roger Pau Monné wrote:
> > On Tue, May 14, 2024 at 11:43:14AM +0200, Jan Beulich wrote:
> >> On 14.05.2024 11:40, Roger Pau Monné wrote:
> >>> On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
> >>>> @@ -53,6 +55,8 @@ enum fixed_addresses {
> >>>>      FIX_PV_CONSOLE,
> >>>>      FIX_XEN_SHARED_INFO,
> >>>>  #endif /* CONFIG_XEN_GUEST */
> >>>> +    FIX_PMAP_BEGIN,
> >>>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
> >>>
> >>> This would better have
> >>>
> >>> #ifdef CONFIG_HAS_PMAP
> >>>
> >>> guards?
> >>
> >> That's useful only when the option can actually be off in certain
> >> configurations, isn't it?
> > 
> > My comment earlier on this patch suggested to make CONFIG_HAS_PMAP be
> > selected by HAS_SECRET_HIDING, rather than being unconditionally
> > arch-selected (if that's possible, I certainly don't know the usage in
> > further patches).
> 
> Right, but in patch 6 HAS_SECRET_HIDING is selected unconditionally,
> which would then also select HAS_PMAP. If, otoh, HAS_PMAP was selected
> only when SECRET_HIDING (or whatever its name is going to be), then an
> #ifdef would indeed be wanted here.

Oh, indeed, I was meant to tie to SECRET_HIDING and not
HAS_SECRET_HIDING.  I have to admit (as I've already commented on the
patch) I don't much like those names, they are far too generic.

Thanks, Roger.

