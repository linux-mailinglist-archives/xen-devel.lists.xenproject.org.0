Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD9A774DA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 09:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933540.1335468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVbF-0003rm-Ep; Tue, 01 Apr 2025 06:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933540.1335468; Tue, 01 Apr 2025 06:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVbF-0003pc-Bm; Tue, 01 Apr 2025 06:59:53 +0000
Received: by outflank-mailman (input) for mailman id 933540;
 Tue, 01 Apr 2025 06:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzVbD-0003pW-RS
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:59:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d48e04-0ec6-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 08:59:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2989111f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 23:59:50 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b658c87sm13431650f8f.9.2025.03.31.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 23:59:49 -0700 (PDT)
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
X-Inumbo-ID: e7d48e04-0ec6-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743490790; x=1744095590; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScQu8B85nX7UoHj6OIK9JPoXlkR0ynGgpmVeiNLdA5Y=;
        b=fZ51vd47wajgd6El1GP9VkJPjVOVSx+aNsoJPCoL0N5UAndg5AvBcxaVOm4kCpPJWE
         Alv/kJb4qH3o0udehlmkwQTG1PiOoiA8gnzlSzbFnD4RloMdM+sotR0fF7RFEUVNVtTF
         ivHTJuQ1VL7ZybBlNsQ90Pi9huGJHHhYaTXpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743490790; x=1744095590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScQu8B85nX7UoHj6OIK9JPoXlkR0ynGgpmVeiNLdA5Y=;
        b=h9JPYiR2MxrDSWYHVY0Q/zBf+86QuOgUEnrr42cU7QB5dv50H2e/ApPx5UgVBsTLyk
         afaUX3TQk48H962jzkC++kvZgiT5Wj9Ot1o20kfw7hVhIqYA/Q8ogykrZrTqkCFCCgKV
         CTHAqKT0/haxJstERN2e1LvxoW+t+xzIwp+YXUI1JZijsiE+/ci7mPA60B7Axih0Cqsb
         LldRWrr2nDyaxApIt4jWeJX4FekKeg0fsnug4OOVb3KfHlM5490QEhqChqR/ifenKEEU
         4Ky69IPFfOxhUpZION6gk9LZoeblKP3wQOpqWO0Db063mTsYkikT+LFKMEkgCrn7b26I
         j0Sg==
X-Gm-Message-State: AOJu0YyGLNpE0nkxgVGRRyQm2NdS++jOEPxmhBxfpm5hdxAT16gdkijD
	SHX6um9nevSaJO7615Duo5ODjlhJqzMNMrD9G2aGRI04FrPh3TGbkahnp2H6Alk=
X-Gm-Gg: ASbGncsfWhBHJaZBYg4pkiCFCR/q8O5FkxPGk9KWM2vbo7o/RjhMX1H/1XL2ugeZwff
	yr0AGDACa32inqvl8JtMn2qk4vgh0wSKVarYfAyllJ/tGZ3zKsYTUPweLskyuc0unrDoH7Il1zA
	Zu/zzuIehH69DajBNUtnWl5c9v0FIqrcfBdO1Tp2XcvtNH0zeHqvN0kCKM2/4uJI3Wx0C61WfQY
	sW3+FpC+FRYtWh80JCMWWPQ6RZ6rdq2LRk/4qafUzuMWw+5OtunQvbsdH9/VDgfypez3FsxFavy
	u7FSX66BPOfpbTLR+5556fFSWIL9XMqznCKzyXFscTblTEA9v37/NKoA9YYh
X-Google-Smtp-Source: AGHT+IFKQVah+X6jaRwBpp/tbQLwgQ0G67K/eV0jLgdbPhzBFasoUXNF/SYBJC91/1+ITHLHk0pUBg==
X-Received: by 2002:a5d:59a6:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39c12119cebmr8878018f8f.48.1743490790005;
        Mon, 31 Mar 2025 23:59:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 08:59:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1] x86/domain: revisit logging in arch_domain_create()
Message-ID: <Z-uO4X_mk8QycVVe@macbook.local>
References: <20250331213406.422725-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331213406.422725-1-dmukhin@ford.com>

On Mon, Mar 31, 2025 at 09:34:24PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use %pd in all logs issued from arch_domain_create().
> 
> Also, expand error message in arch_domain_create() under
> !emulation_flags_ok() case to help debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> The origin of the patch is:
>   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com/
> ---
>  xen/arch/x86/domain.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index a42fa54805..15c5e2a652 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -798,13 +798,12 @@ int arch_domain_create(struct domain *d,
>      {
>          if ( !opt_allow_unsafe )
>          {
> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> -                   " for security reasons.\n");
> +            printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on this CPU"
> +                   " for security reasons.\n", d);

Since you are already touching this, I would switch to gprintk, and
avoid splitting the lines:

            gprintk(XENLOG_ERR,
                    "%pd: Xen does not allow DomU creation on this CPU for security reasons.\n",
                    d);

Same for the other messages below.

>              return -EPERM;
>          }
>          printk(XENLOG_G_WARNING
> -               "Dom%d may compromise security on this CPU.\n",
> -               d->domain_id);
> +               "%pd: domain may compromise security on this CPU.\n", d);
>      }
>  
>      emflags = config->arch.emulation_flags;
> @@ -814,16 +813,19 @@ int arch_domain_create(struct domain *d,
>  
>      if ( emflags & ~XEN_X86_EMU_ALL )
>      {
> -        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
> -               d->domain_id, emflags);
> +        printk(XENLOG_G_ERR "%pd: Invalid emulation bitmap: %#x\n",
> +               d, emflags);
>          return -EINVAL;
>      }
>  
>      if ( !emulation_flags_ok(d, emflags) )
>      {
> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> +        printk(XENLOG_G_ERR "%pd: Xen does not allow %s %sdomain creation "
>                 "with the current selection of emulators: %#x\n",
> -               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> +               d,
> +               is_hvm_domain(d) ? "HVM" : "PV",
> +               is_hardware_domain(d) ? "(hardware) " : "",

I wouldn't use parentheses around hardware, but that's just my taste.

Thanks, Roger.

