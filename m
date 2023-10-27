Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5D7D9A56
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624496.973073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNB9-0002ob-OQ; Fri, 27 Oct 2023 13:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624496.973073; Fri, 27 Oct 2023 13:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNB9-0002mf-Lj; Fri, 27 Oct 2023 13:47:11 +0000
Received: by outflank-mailman (input) for mailman id 624496;
 Fri, 27 Oct 2023 13:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZGm/=GJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qwNB7-0002kn-JJ
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:47:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52ad8354-74cf-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:47:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso62839966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 06:47:09 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 lf6-20020a170907174600b009b977bea1dcsm1227285ejc.23.2023.10.27.06.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 06:47:08 -0700 (PDT)
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
X-Inumbo-ID: 52ad8354-74cf-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698414428; x=1699019228; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hn2H3DDSmFvevHsDTiyDlpZaUW6715OIjZp6yBj8aLs=;
        b=ZvFG9Jk+RUzhaGhiQrWZ7sh/kcPDX5/w28VZjw11rPkJHN7NrqvbQN8hS6aDSZRKb8
         WOZcsShAjLpWeHnHdN5YGjWQyo77+FFP+dwptfMEwlRGURHxkUF+6nU1O+WWjf28jLO2
         eOpwm+mbe0w86iOwqYoYMebSslYH7ozKtMNBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698414428; x=1699019228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn2H3DDSmFvevHsDTiyDlpZaUW6715OIjZp6yBj8aLs=;
        b=o16p1AHyI/4CMVlOQ6Y+QMKvgH/ra/jfUQ4Z0CYb/hTY56QFcOgDlgYynbjgP8YrJV
         EVk11NGeZGsVkvB6+ckuGbUuwV/zvpiF7jiROKInOrVluEEYFA6/dYI4aYSK/S5QZ9jj
         sGDwdC74HNBgEWkA+FqAIA7kkGW2o9zIwMF/e0fGsIsY08vQChr8RY5NfVafO3hFLmft
         kVQA4OJpfcYHVX3R243sNcdB7m10p9x4+WDVTL9rJ0GyM3Pe498R+iSScR8TK7y1RrZY
         YtKIPN9vBr4k9O12lwJH4woghPHb+ZTtHUOEiZORZfJftngOzoUIiPuGCR+Hi4Fzu1ZI
         86TQ==
X-Gm-Message-State: AOJu0YzRL5CSQxWw6Wo5dPvf5ipAy6FhgY9mF1scYBdT4TK9E4TZQv7F
	aMM+H64Tp3Hze1MhVEzU8QcMig==
X-Google-Smtp-Source: AGHT+IEIa9ua3rq95D+XQ7/37WjSH3SOw835aTW+08fZONME0dsSllsrfMq6u/Fdl0rwu+W+Zyu28A==
X-Received: by 2002:a17:906:ef07:b0:9c6:3c94:69fa with SMTP id f7-20020a170906ef0700b009c63c9469famr1885874ejs.44.1698414428575;
        Fri, 27 Oct 2023 06:47:08 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:47:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Message-ID: <ZTu_WxdWTrthCs4m@macbook>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com>

On Fri, Oct 27, 2023 at 09:12:40AM +0200, Jan Beulich wrote:
> On 26.10.2023 22:55, Andrew Cooper wrote:
> > We eventually want to be able to build a stripped down Xen for a single
> > platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> > available to randconfig), and adjust the microcode logic.
> > 
> > No practical change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Wei Liu <wl@xen.org>
> > CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > CC: Stefano Stabellini <stefano.stabellini@amd.com>
> > CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> > 
> > I've intentionally ignored the other vendors for now.  They can be put into
> > Kconfig by whomever figures out the actual dependencies between their init
> > routines.
> > 
> > v2:
> >  * Tweak text
> 
> What about the indentation issues mentioned in reply to v1?
> 
> As to using un-amended AMD and INTEL - Roger, what's your view here?

I think it would be good to add a suffix, like we do for
{AMD,INTEL}_IOMMU options, and reserve the plain AMD and INTEL options
as platform/system level options that enable both VENDOR_{CPU,IOMMU}
sub options.

So yes, {INTEL,AMD}_CPU seems a good option.

Regards, Roger.

