Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0F963D09
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 09:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785516.1194981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZcj-0000W1-QU; Thu, 29 Aug 2024 07:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785516.1194981; Thu, 29 Aug 2024 07:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZcj-0000TI-Mu; Thu, 29 Aug 2024 07:31:17 +0000
Received: by outflank-mailman (input) for mailman id 785516;
 Thu, 29 Aug 2024 07:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9f7=P4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjZci-0000TA-CC
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 07:31:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abd8471f-65d8-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 09:31:14 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so30363766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 00:31:14 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb072sm40635566b.28.2024.08.29.00.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 00:31:12 -0700 (PDT)
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
X-Inumbo-ID: abd8471f-65d8-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724916674; x=1725521474; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MpogHJ9hNwyoLioWPtbtmNpT3TYed6fG+b23Bzg2nQ=;
        b=I3tI31LAGzV/bPa2LIhLLky8GejRMPn6pwDNTuA6fn5d1h/xJlrIDwY0mVa1lK8YE7
         TUZEE3J8CK80ysooi32X2c7Bts+Oy32zuNuyRwHwHVm5hwfMz76hP2VR+kP/hrnZMcNL
         Jujhdc7iPXlYve14+OvGyU6twZC24P2nN4G98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916674; x=1725521474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MpogHJ9hNwyoLioWPtbtmNpT3TYed6fG+b23Bzg2nQ=;
        b=Kvw2mkSsViBlhYUc+euFYJq2o1Ghe9eJopREPx9ChEKxxXo3oXveNy1SS7BG8Ve7YH
         i0X2NGC2qPYCXnCOLTHw5flMnEIVPlwdInTwwY0Iql5fWXeDk2uoaohuxLxzYUDSazD0
         GdxEg/W7aLzN6kXMyOPgASRmRzSU6WawJGE8mM/L738lq8e5aBsqglxs+E9pafA1NjcU
         b/86J3LUgpLzgNIs253RqSD8MBFS80oDcCvkYmOhmC+bd2iTg1YLOgKHyCBgAIxgUQTM
         OfqMQkcBh1+VkP6BEPADWb6C/tVTKjjaS4dRduTA8sIdmWEsEVauueiUJCVlfLukx/MQ
         J/tA==
X-Forwarded-Encrypted: i=1; AJvYcCWUH31dNUSwZEqjtqvoAExfpwEmYbRH/ISEYo/eojWYBnH4SYo5J+Du8bT2gOIp/5WY9yFQJTAlMMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0JfyOgU0RkYSY8MGksguKLjcdZrn4mye0WPN4O00XzuokiUrh
	gq9qOpR/de7FmeyhhDRkEkpMzfH52je+TyJknBNB7BmjuC9hazZDGFVXqAGur5A=
X-Google-Smtp-Source: AGHT+IFkuKYmBRsXT/a8mw8rZxoXTi5cK8IrMuZk1FL6qYXpPUBUIhXLuJtM8/ZkacV2pcmCnat9XA==
X-Received: by 2002:a17:907:3f24:b0:a86:9c41:cfc1 with SMTP id a640c23a62f3a-a897f775dd1mr149229966b.8.1724916673197;
        Thu, 29 Aug 2024 00:31:13 -0700 (PDT)
Date: Thu, 29 Aug 2024 09:31:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
Message-ID: <ZtAjv6hdbPTZ1dGI@macbook.local>
References: <20240828113044.35541-1-roger.pau@citrix.com>
 <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
 <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>
 <Zs8gAuc5qoVsVkQe@macbook.local>
 <a5b4ca69-96ea-46d6-ab0d-2be4fd1d9d99@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5b4ca69-96ea-46d6-ab0d-2be4fd1d9d99@citrix.com>

On Wed, Aug 28, 2024 at 07:57:39PM +0100, Andrew Cooper wrote:
> On 28/08/2024 2:02 pm, Roger Pau Monné wrote:
> > On Wed, Aug 28, 2024 at 12:51:23PM +0100, Andrew Cooper wrote:
> >> On 28/08/2024 12:50 pm, Jan Beulich wrote:
> >>> On 28.08.2024 13:30, Roger Pau Monne wrote:
> >>>> Move the logic that disables SMAP so it's only performed when building a PV
> >>>> dom0, PVH dom0 builder doesn't require disabling SMAP.
> >>>>
> >>>> The fixes tag is to account for the wrong usage of cpu_has_smap in
> >>>> create_dom0(), it should instead have used
> >>>> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
> >>>> only.
> >>>>
> >>>> While there also make cr4_pv32_mask __ro_after_init.
> >>>>
> >>>> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
> >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>> preferably with ...
> >>>
> >>>> @@ -1051,6 +1051,34 @@ out:
> >>>>      return rc;
> >>>>  }
> >>>>  
> >>>> +int __init dom0_construct_pv(struct domain *d,
> >>>> +                             const module_t *image,
> >>>> +                             unsigned long image_headroom,
> >>>> +                             module_t *initrd,
> >>>> +                             const char *cmdline)
> >>>> +{
> >>>> +    int rc;
> >>>> +
> >>>> +    /*
> >>>> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
> >>>> +     * construct_dom0().  This saves a large number of corner cases
> >>> ... the final 's' dropped here and ...
> >>>
> >>>> +     * interactions with copy_from_user().
> 
> 
> Actually, even with this adjustment the comment is still wonky.
> 
> The point is that we're clearing SMAP so we *don't* need to rewrite
> construct_dom0() in terms of copy_{to,from}_user().
> 
> I've adjusted it.

It did seem weird to me, I've assumed the wording was meaning to imply
that SMAP was disabled so that construct_dom0() didn't need to use
copy_from_user().

The comment you added seems fine to me, however there's a typo I
think:

    /*
     * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
     * prevents us needing to write rewrite construct_dom0() in terms of
                              ^ extra?
     * copy_{to,from}_user().
     */

We can fix at some later point when modifying this.

Thanks, Roger.

