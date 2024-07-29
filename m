Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D893FB31
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767015.1177574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTIC-0005Ws-Ee; Mon, 29 Jul 2024 16:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767015.1177574; Mon, 29 Jul 2024 16:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTIC-0005Uk-Bi; Mon, 29 Jul 2024 16:32:12 +0000
Received: by outflank-mailman (input) for mailman id 767015;
 Mon, 29 Jul 2024 16:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYTIA-0005Uc-LR
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:32:10 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191486bf-4dc8-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 18:32:08 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-44f666d9607so18308791cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:32:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe81745aesm42669781cf.51.2024.07.29.09.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:32:07 -0700 (PDT)
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
X-Inumbo-ID: 191486bf-4dc8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722270727; x=1722875527; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBffJ6t/sO1GIH1ET9H2l2N6LNi8NyHOyJ9i6dO7VUo=;
        b=RJ56x0SVIhKomfoG1aJZVYUKUMCkCkJfXLRUA4yPuTlD1OaF5HKaNkFHDxbjAk2v/n
         1QGwW/DMEQiHTH7PTFUcuMxwAkgk8BF0rUvfyUfQm3LmjVqvefnBeOrFXsQntL3kKMiM
         7v1C4fPX7YfHCyaO2TwS1JVnQTgaHkfWrVpUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722270727; x=1722875527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBffJ6t/sO1GIH1ET9H2l2N6LNi8NyHOyJ9i6dO7VUo=;
        b=A1ED5qyVS6u5ae3fyqPGKEQYv6SdHO1AETOlDcWi0fGOWOVzOSs0DBrXkCVsCKqAaq
         XJN8RNkvjA4rC8552eXMoylhbv8LDi2DbgwgAKZcPjxiNLdoCPwPDwA3ubmgaHI8u8T+
         H4A6ORGMBrY0FQRl/+DY//yrFWgd8OIRGHh8xe3PV/5S7jSF89UP1RDzs6BLd14U+kun
         7gDJeg2sq7srF8JH1dz9RBg1xHhYM8n7t5IAfgs7Izw3McEZNsngLjZbCne+ue93T8S3
         XZ2upiricppVpDnsxw6fuasyzUUXHDKVAdAcP14He8u7ScUGbOsg+bRxWG1PFjF1DM2W
         h4lg==
X-Gm-Message-State: AOJu0YzLEg8LJYOF21uH+MHA6EUmc0cGVw/g4RvAHb/pOBir6ZMWBgC2
	eZfmpOm/yPxD5eVODdkO8j85zBEpMMib7MqrFcAO4EyVSBb4JExz+jkP+iNNsvU=
X-Google-Smtp-Source: AGHT+IFa4Y/m7QKgo9qurwcsabqkUX8JbXyniIvPmNB+ltxYXyDJjA3aRvs8llpfTCvtuku79HxcEw==
X-Received: by 2002:ac8:5f95:0:b0:44f:e2ba:2d66 with SMTP id d75a77b69052e-45004dfd4fdmr103266781cf.18.1722270727490;
        Mon, 29 Jul 2024 09:32:07 -0700 (PDT)
Date: Mon, 29 Jul 2024 18:32:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, alejandro.vallejo@cloud.com,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqfEBfcxJL87deDx@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <3077368e-caba-42ad-b6ac-3406ca5c4861@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3077368e-caba-42ad-b6ac-3406ca5c4861@citrix.com>

On Mon, Jul 29, 2024 at 04:59:09PM +0100, Andrew Cooper wrote:
> On 26/07/2024 4:21 pm, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index eee20bb1753c..bc387d96b519 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -955,26 +955,9 @@ static struct domain *__init create_dom0(const module_t *image,
> >          }
> >      }
> >  
> > -    /*
> > -     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
> > -     * This saves a large number of corner cases interactions with
> > -     * copy_from_user().
> > -     */
> > -    if ( cpu_has_smap )
> > -    {
> > -        cr4_pv32_mask &= ~X86_CR4_SMAP;
> > -        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> > -    }
> > -
> >      if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
> >          panic("Could not construct domain 0\n");
> >  
> > -    if ( cpu_has_smap )
> > -    {
> > -        write_cr4(read_cr4() | X86_CR4_SMAP);
> > -        cr4_pv32_mask |= X86_CR4_SMAP;
> > -    }
> > -
> 
> Hang on.  Isn't this (preexistingly) broken given the distinction
> between cpu_has_smap and X86_FEATURE_XEN_SMAP ?

I see, looks like Xen will unconditionally enable SMAP if the user has
requested SMP for HVM only.  Forcefully disabling SMAP for both PV and
HVM will result in the CPUID bit getting cleared, and hence
cpu_has_smap == false.

> I'm very tempted to use this as a justification to remove opt_smap.

Oh, so my change fixes that bug by caching the previous cr4 instead of
using cpu_has_smap.

It seems like opt_smap is useful for the PV shim, as it caused some
unnecessary performance degradation on AMD hardware due to AMD not
allowing to selectively trap accesses to CR4, so on pvshim mode
it gets disabled:

b05ec9263e56 x86/sm{e, a}p: do not enable SMEP/SMAP in PV shim by default on AMD

Thanks, Roger.

