Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D69A60CCD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914146.1319941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt13O-0001N1-Ry; Fri, 14 Mar 2025 09:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914146.1319941; Fri, 14 Mar 2025 09:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt13O-0001KE-P6; Fri, 14 Mar 2025 09:10:06 +0000
Received: by outflank-mailman (input) for mailman id 914146;
 Fri, 14 Mar 2025 09:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt13M-00018j-Ti
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:10:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8df7db-00b4-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 10:10:04 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so327237666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:10:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3146aea4csm197020866b.33.2025.03.14.02.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:10:03 -0700 (PDT)
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
X-Inumbo-ID: 1d8df7db-00b4-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943403; x=1742548203; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FEhQ44Vm9/u5abUc0xjtMyneOG7EuDL9NhaKLTGbwbs=;
        b=uXfOrrmBoGCnNwLBhm0FisRpyWeWrS8mvD2I552Q/Pbxm/JO2JwRxxwUWLvu8Fn8pw
         kwlVxrmzBP5IAAcVfe1Ffe+p52KV9H7HBvcQjftBw3fXsLIl1UjTN7z73ziOOu6xzhGB
         h21Nd6VNIkRCX8wPBednlGb4vcEBvdrgy8BPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943403; x=1742548203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEhQ44Vm9/u5abUc0xjtMyneOG7EuDL9NhaKLTGbwbs=;
        b=fGntAv8FdZiPmLPPfv5EXNn23KC/seGGJIx2MzBXWGFrc2170O1bZDRryb9ulsb3vt
         w9zYvqCtIWinVDabjnOVoNI6FU0A9uN55TiCCmq8KpfYI4y2hOexUjCGOrCHTL9iabPg
         dgiP+si/Pt3PlPd/RAsT4pGvG51JlgW6+QfuGovjsRiu45TxkadoAS73s/P2NsSqCB49
         KCwq0uWWln+CMBEzTg14Oa5ARcuLqbchA0m6pyWggaWrLXAF2L9AU6um751XzSfS2VqQ
         zrz68iAi7b6c+Uce5nUuFEOAvmd5rDxZ9/90PFS4OCuZLWPLm6vtTZO8YNoHN45XiHk8
         N4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU/h5YKLlMVzia4Mua5WhAcXCsd/JS9azknIX6DlGb/e/mKdICISPgGz+Zc07Vg14veeWYWwmLulL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk0775FCeC67QHFcR3A58fp9UZ7GRSBXVChnWORWyiVNZLsysf
	nwpd9y57hfw97kGh0qHl26bvmDUIlFTrqAVCXu/uGgcDjXEMEwr1DbDiW1KUARg=
X-Gm-Gg: ASbGncuFOqHJCX9yTIjWZ4k2AQ3L1OPLm5xWw30o9maDKzc5i9D8yJBPtiNvjNv5v01
	BCNGr2dFXIO3yMIj23u5zw+CMr5Ql5DJUlJ995wu6qGAzsjIupBGDMLmRZmYkTmCxdlVfRDPQ+/
	lqPsZv5gEgP4t6c2l9I7CJrovkjKLhFTeh/kzSzLZzdliqpAR8KALdcV5EzDmItGvhSqXoJQyz0
	BWKtQHHXlGrQsIIoIG9BO/NyHpPBfKQK68QJWpqBLC2eN/w9A780+52tNzzw7RMICd0tVTMl5KK
	3MeA8FCzgvXajVW/0U0ov2n3KK+NZ1Fp945TSrp3qsxwMdzQCA==
X-Google-Smtp-Source: AGHT+IHcOAtQjYHEqgP8v0BJotJkafsAOv7P2SfiYrDYiD0TOxIjiEQ0YEOFWh8K5Rb0nzRnA2Rx4Q==
X-Received: by 2002:a17:907:6ea9:b0:ac3:2ad9:f126 with SMTP id a640c23a62f3a-ac330441d4amr217145566b.41.1741943403358;
        Fri, 14 Mar 2025 02:10:03 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:10:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with
 UBSAN and PVH_GUEST
Message-ID: <Z9PyaVYsXVxLrmLf@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-4-roger.pau@citrix.com>
 <eaf90340-929c-4c89-99cf-0383918e9d5a@suse.com>
 <Z9PobmG8lDy-oscG@macbook.local>
 <f5eb7710-c709-46a0-9821-bfc147d8cd53@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5eb7710-c709-46a0-9821-bfc147d8cd53@suse.com>

On Fri, Mar 14, 2025 at 09:33:01AM +0100, Jan Beulich wrote:
> On 14.03.2025 09:27, Roger Pau Monné wrote:
> > On Fri, Mar 14, 2025 at 09:10:59AM +0100, Jan Beulich wrote:
> >> On 13.03.2025 16:30, Roger Pau Monne wrote:
> >>> When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
> >>> compiler emits the following errors:
> >>>
> >>> arch/x86/setup.c: In function '__start_xen':
> >>> arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
> >>>  1504 |             end = consider_modules(s, e, reloc_size + mask,
> >>>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>  1505 |                                    bi->mods, bi->nr_modules, -1);
> >>>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> >>> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
> >>>   686 | static uint64_t __init consider_modules(
> >>>       |                        ^~~~~~~~~~~~~~~~
> >>> arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
> >>>  1535 |             end = consider_modules(s, e, size, bi->mods,
> >>>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>  1536 |                                    bi->nr_modules + relocated, j);
> >>>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> >>> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
> >>>   686 | static uint64_t __init consider_modules(
> >>>       |                        ^~~~~~~~~~~~~~~~
> >>>
> >>> This seems to be the result of some function manipulation done by UBSAN
> >>> triggering GCC stringops related errors.  Placate the errors by declaring
> >>> the function parameter as `const struct *boot_module` instead of `const
> >>> struct boot_module[]`.
> >>>
> >>> Note that GCC 13 seems to be fixed, and doesn't trigger the error when
> >>> using `[]`.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/setup.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >>> index 4a32d8491186..bde5d75ea6ab 100644
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -684,7 +684,7 @@ static void __init noinline move_xen(void)
> >>>  #undef BOOTSTRAP_MAP_LIMIT
> >>>  
> >>>  static uint64_t __init consider_modules(
> >>> -    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
> >>> +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
> >>>      unsigned int nr_mods, unsigned int this_mod)
> >>>  {
> >>>      unsigned int i;
> >>
> >> While I'm okay-ish with the change, how are we going to make sure it won't be
> >> re-introduced? Or something similar be introduced elsewhere?
> > 
> > I'm afraid I don't have a good response, as I don't even know exactly
> > why the error triggers.
> 
> One option might be to amend ./CODING_STYLE for dis-encourage [] notation
> in function parameters. I wouldn't be happy about us doing so, as I think
> that serves a documentation purpose, but compiler deficiencies getting in
> the way is certainly higher priority here.
> 
> Trying to abstract this (vaguely along the lines of gcc11_wrap()), otoh,
> wouldn't be desirable imo, as it would still lose the doc effect, at least
> to some degree.

This is a very specific case, I don't think we should change our
coding style based on it.  I think our only option is to deal with
such compiler bugs when we detect them.

Thanks, Roger.

