Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E29A68CA1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920524.1324679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusQF-0006rf-MX; Wed, 19 Mar 2025 12:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920524.1324679; Wed, 19 Mar 2025 12:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusQF-0006q3-IU; Wed, 19 Mar 2025 12:21:23 +0000
Received: by outflank-mailman (input) for mailman id 920524;
 Wed, 19 Mar 2025 12:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tusQE-0006ox-3i
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:21:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ffbec1-04bc-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:21:20 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so4384060f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:21:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb318a8bsm21293051f8f.66.2025.03.19.05.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 05:21:19 -0700 (PDT)
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
X-Inumbo-ID: a9ffbec1-04bc-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742386880; x=1742991680; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQTLFeh9Cp8hHU/yCllwqtdwayubVByn8Q14I7vEqGs=;
        b=Atm0EuTZIi3jWXZNZv0NFiQV08RIzsbPiZc57JGkroy0pkPiU6bCLbK9sNF3agr4EL
         FunjOo6zHzc2rCbpn0ewaEnjg/wuXpw6GyKZ6rde+HGUv860O8FU5iWXtnDjPQJUW5D4
         w8k194O1Y1hzRBPHVMZGVUl7zKuOVqZ4Y27tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386880; x=1742991680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQTLFeh9Cp8hHU/yCllwqtdwayubVByn8Q14I7vEqGs=;
        b=djR6L1k+BaKhYiDYrBR1bJSJESSzsbCbmPV0cG9Aqs/1CKxqiXt4XerhFZwAMv1IHW
         saJrwglIlTZIpKY4IS0KUCKQVwD6wwG8DILb52kd2by3DWTZhTdziJR4mPl933IBc8Jr
         Cc56+C599sDA8cdHafybdaN0rK9l8T525XU/ijMnzZT4RijbPwel2TggapZcHJOhmOQy
         O3im3gT683As+f6WWUXXofVkMIuUQ82vCodgC0jT0br/6b1fEGDNbyb4RRG9V/dIkldN
         7ruQ8dW+S9uwEaMWQ13i/4ggYzrcf2BGhfCBEzgaz58iPoZuH98TUrqpqB5YLN89yhRn
         3mqA==
X-Forwarded-Encrypted: i=1; AJvYcCXtEktfcR1xb9++xmIEIDbOPGvbeUzf6OLn6Pn31ImKH6ktkB/o31xO9u8jnnPDe/lRmRdLj543xsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCbnJdYQp89J4xpRZfVCZhUTqiNW2lTYmcArxzggkw5c3GpDsz
	f06lX77m/u5jlh/Ijc3n2oVyKF8IP32WMWRY+v1JhS7FZ7mta4Mzau75bGUrbns=
X-Gm-Gg: ASbGncsd6vZFzCAk56vw0DGrS47QEJHLh490P+KAoIRprQwTq8RNNSJJI1Px13lF3Xf
	VjdBdl2k5f1pULStfJaiqcA5D6faNMn/eaOEoAVVrrjlDSbhkLHQt63cGHAZ9oeIgeqXNgwzCIH
	0pYZmpVp3cydfxkOaqy4aGxIVsiYzsDk+JYyM3VTgWM2XugBcNJQN8kkMiLfTWWz87bgCi/5G6e
	14e+ZpTHU2T4jllZlhiI767aXlw5PcDn5KpLT3OPVQzqDdOeswT0TBfptcvCIxe29EBxr/KnOEb
	JTssS8RDynImcYKxaZ9g2sJvb+pWhAsxllz/zwgCWYg8qnb6sqqMitYLahtX
X-Google-Smtp-Source: AGHT+IEeynx0Te696YP8VC0+T7euJqqQ3T+/FhefAMbOYmUD06pANLxrATQgyUFwT3vIzPZIOEJdYA==
X-Received: by 2002:a5d:5f90:0:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-39973b08eeemr2677793f8f.44.1742386879610;
        Wed, 19 Mar 2025 05:21:19 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:21:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] x86/PVH: account for module command line length
Message-ID: <Z9q2vvOzZ0zog3yO@macbook.local>
References: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
 <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>

On Wed, Mar 19, 2025 at 12:12:22PM +0000, Andrew Cooper wrote:
> On 19/03/2025 11:18 am, Jan Beulich wrote:
> > As per observation in practice, initrd->cmdline_pa is not normally zero.
> > Hence so far we always appended at least one byte. That alone may
> > already render insufficient the "allocation" made by find_memory().
> > Things would be worse when there's actually a (perhaps long) command
> > line.
> >
> > Skip setup when the command line is empty. Amend the "allocation" size
> > by padding and actual size of module command line.
> >
> > Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -712,7 +712,15 @@ static int __init pvh_load_kernel(
> >       * simplify it.
> >       */
> >      last_addr = find_memory(d, &elf, sizeof(start_info) +
> > -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
> > +                            (initrd ? ROUNDUP(ROUNDUP(initrd_len,
> > +                                                      elf_64bit(&elf) ? 8 : 4) +
> > +                                              (initrd->cmdline_pa &&
> > +                                               strlen(__va(initrd->
> > +                                                           cmdline_pa))
> > +                                               ? strlen(__va(initrd->
> > +                                                             cmdline_pa)) + 1
> > +                                               : 0),
> > +                                              PAGE_SIZE) +
> >                                        sizeof(mod)
> >                                      : 0) +
> >                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> 
> This piece of logic was already bad, but this is rather worse.
> 
> One patch I made while doing the boot module work is:
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 6a4453103a9a..7292ddd07276 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
> NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> +    size_t metadata_len;
>      paddr_t last_addr;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
> @@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
>       * split into smaller allocations, done as a single region in order to
>       * simplify it.
>       */
> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
> -                                      sizeof(mod)
> -                                    : 0) +
> -                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> -                                               elf_64bit(&elf) ? 8 : 4)
> -                                     : 0));
> +    metadata_len = sizeof(start_info);
> +
> +    if ( initrd )
> +        metadata_len += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
> +
> +    if ( cmdline )
> +        metadata_len += ROUNDUP(strlen(cmdline) + 1,
> +                                elf_64bit(&elf) ? 8 : 4);
> +
> +    last_addr = find_memory(d, &elf, metadata_len);
>      if ( last_addr == INVALID_PADDR )
>      {
>          printk("Unable to find a memory region to load initrd and
> metadata\n");
> 
> 
> which I think I ought to submit as a prerequisite to this, after which
> your logic squashed on the RHS now becomes an expansion of the `if (
> initrd )`.
> 
> Thoughts?

Yes please, I was going to ask Jan to break that chain of ?: operators
as it's impossible to read.

Thanks, Roger.

