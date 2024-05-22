Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67658CC4DD
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 18:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727816.1132501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9oir-0002lI-0G; Wed, 22 May 2024 16:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727816.1132501; Wed, 22 May 2024 16:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9oiq-0002i7-Sn; Wed, 22 May 2024 16:21:48 +0000
Received: by outflank-mailman (input) for mailman id 727816;
 Wed, 22 May 2024 16:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ieL=MZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9oip-0002i1-NS
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 16:21:47 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6113ac63-1857-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 18:21:44 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6f1016f41e2so2476220a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 09:21:45 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a8d595809esm42940246d6.56.2024.05.22.09.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 09:21:43 -0700 (PDT)
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
X-Inumbo-ID: 6113ac63-1857-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716394904; x=1716999704; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N4+qUAE3RinRnCNLSdqj+tsXo//3UZJt8DNMpzP2Ibs=;
        b=PCGafyMTVgBpdvwV7QAX0uS/pEMWyhfzZXQ2Vzj25HLL3XP335AQQUISRIwfdSlewQ
         JTU/fw9zSjSb5T604hrngDlT/qUn1izZ5CZiQNWOGDIbRN5hUkvNyzvGdaMDSBpkVS3Q
         8m2woGCS4pfIMWLOCxQjAU5C3x+niq8muyKjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394904; x=1716999704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4+qUAE3RinRnCNLSdqj+tsXo//3UZJt8DNMpzP2Ibs=;
        b=BsOFI2HoimmtZA+fK2xfvJCMrtm7a5ic9kkHcXvxE6ARlSfQWlDQfmryt6u50zfkbp
         h+hCcj8F8O9bIIXbuDmo/jhAeu7qcc5J/bmEcYPKn9hUaICcIeEfbPLpI8K5mpf+Ogbd
         f+OQMuvGczyeQQW3LZVNuqVneBlbTLH8iqFpFpo1/ys4fdsXHWGl/2qeCk9mc8uly38g
         cxlQRU9cL0kFtFd4Opjm8gso76jgi761Nndtm9U+puqcpcDRT7KFZbHkSHXXMz6MiI8U
         z9rVwr9lcbOFSug9bzEbgKu/GKhagDQjeCSndSMR97K9Adp99uJ4AbWP8LnCTcK+NtKc
         ERBg==
X-Forwarded-Encrypted: i=1; AJvYcCUR9uBk/cm7ETSrlQMWZuivy3S8uCE+lq3BjTTkbpz2lXU1K4ULhAiJCfXza8ReCaWdnlsysCMaf+fb0G6kDc4osFmK6ke/3CFXl7clgaY=
X-Gm-Message-State: AOJu0Yyxkl68JXCMHmSKzIhj0FZeO3cE+ut6kHqW0/lrFN6NYywBjpsI
	8Y1eiGDB8icYcj3c4wxLM8M3G2veZ4PnAWeqH/LTTLtSi2/PBzqPpqG77lFE3Uo=
X-Google-Smtp-Source: AGHT+IEkxH0PYLn/hDKBcNbrdXS8OyxHsQk7PQAVHZ1VuY6DaMH0yE7e+t1B597bI2RYqSkzIaY6BA==
X-Received: by 2002:a05:6358:a59:b0:192:47fd:8bf9 with SMTP id e5c5f4694b2df-19791cce683mr224927455d.3.1716394903628;
        Wed, 22 May 2024 09:21:43 -0700 (PDT)
Date: Wed, 22 May 2024 18:21:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
Message-ID: <Zk4blZ9z6cn-ORrv@macbook>
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
 <cd1bf7b0-4a0a-4a38-9129-53822cb8e037@suse.com>
 <Zk3wMevPye8Rfjm4@macbook>
 <5484aab7-b15d-46c5-9ff1-9a5b54640acc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5484aab7-b15d-46c5-9ff1-9a5b54640acc@suse.com>

On Wed, May 22, 2024 at 03:34:29PM +0200, Jan Beulich wrote:
> On 22.05.2024 15:16, Roger Pau Monné wrote:
> > On Tue, May 21, 2024 at 12:30:32PM +0200, Jan Beulich wrote:
> >> On 17.05.2024 15:33, Roger Pau Monne wrote:
> >>> Enabling it using an HVM param is fragile, and complicates the logic when
> >>> deciding whether options that interact with altp2m can also be enabled.
> >>>
> >>> Leave the HVM param value for consumption by the guest, but prevent it from
> >>> being set.  Enabling is now done using and additional altp2m specific field in
> >>> xen_domctl_createdomain.
> >>>
> >>> Note that albeit only currently implemented in x86, altp2m could be implemented
> >>> in other architectures, hence why the field is added to xen_domctl_createdomain
> >>> instead of xen_arch_domainconfig.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> >> albeit with one question:
> >>
> >>> --- a/xen/arch/x86/domain.c
> >>> +++ b/xen/arch/x86/domain.c
> >>> @@ -637,6 +637,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >>>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
> >>>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
> >>>      unsigned int max_vcpus;
> >>> +    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
> >>> +                                         XEN_DOMCTL_ALTP2M_mode_mask);
> >>>  
> >>>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
> >>>      {
> >>> @@ -715,6 +717,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >>>          return -EINVAL;
> >>>      }
> >>>  
> >>> +    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
> >>> +    {
> >>> +        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
> >>> +                config->flags);
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    if ( altp2m_mode && nested_virt )
> >>> +    {
> >>> +        dprintk(XENLOG_INFO,
> >>> +                "Nested virt and altp2m are not supported together\n");
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    if ( altp2m_mode && !hap )
> >>> +    {
> >>> +        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
> >>> +        return -EINVAL;
> >>> +    }
> >>
> >> Should this last one perhaps be further extended to permit altp2m with EPT
> >> only?
> > 
> > Hm, yes, that would be more accurate as:
> > 
> > if ( altp2m_mode && (!hap || !hvm_altp2m_supported()) )
> 
> Wouldn't
> 
>    if ( altp2m_mode && !hvm_altp2m_supported() )
> 
> suffice? hvm_funcs.caps.altp2m is not supposed to be set when no HAP,
> as long as HAP continues to be a pre-condition?

No, `hap` here signals whether the domain is using HAP, and we need to
take this int account, otherwise we would allow enabling altp2m for
domains using shadow.

Thanks, Roger.

