Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFA8AE96B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710662.1110003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzH67-0004Xf-VV; Tue, 23 Apr 2024 14:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710662.1110003; Tue, 23 Apr 2024 14:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzH67-0004UT-S7; Tue, 23 Apr 2024 14:26:15 +0000
Received: by outflank-mailman (input) for mailman id 710662;
 Tue, 23 Apr 2024 14:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzH66-0004UN-Dv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:26:14 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f00f252-017d-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:26:12 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7906776e17aso217506685a.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:26:12 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 s5-20020a05620a080500b0078ecd227e5csm5276343qks.74.2024.04.23.07.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:26:09 -0700 (PDT)
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
X-Inumbo-ID: 6f00f252-017d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713882371; x=1714487171; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zp7/a6GsE05lsQQVjgab8WZ4F47tU7dCrz2vyTBMvZA=;
        b=QmoheWJFuHJFDmmsf6GQl5L8Lj0b87V3kt+Y1Ylq1o7n828cSu0peVbupVwAdQnVcD
         bx/LIOobK8SBTNckZtcoFygswKvNHtE9be57VI7vdXAO23LDxBQAb4JaRsx/ilppBMNc
         P1ToOf2U7FkEnjwL1ZIMjPJFi72NFQOHi3EE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882371; x=1714487171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp7/a6GsE05lsQQVjgab8WZ4F47tU7dCrz2vyTBMvZA=;
        b=SwRS4bZWD7cW5yfVboY4rjN5ENN0Jo0dBNRWysyAsDOR/+h/MiE0KMKi+4Jxb8qRV6
         jXtN9bA+mz4zblB4o/FgeVPHhyr9erzfMJRyG8b8L9j5bxoIgR1fBEHxZpMySJnuVLVY
         EADmeNhb1jWRmS811uSlUOw/u3LNZySAMEbttr/sQRyo/GDyoNsCCUXLa5VnF1x+Rugj
         i2lbcKyp6MGwiWyhQpqneu021vh4NAGn1ZW1krUo/bV4yc7nY+f9nkB2de37ZxzII+3Z
         a6hLXFFATTVRrsj54hrJI1erQQLEM8j7BKuetFREyVvoqJEXptOjQtpTGWCEGBGZYG7R
         a7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVKYTWJ/yPy2g7k4/aksjOJIJgnn9CtP9mf+1IWoXhRrNnLtG29uh2baI+9qiUtknqqJ5qoY8UN93YpGNirbjxYX2lwC/FI8nxFxaK+bA=
X-Gm-Message-State: AOJu0Yxf/ognt2LphlWN0QXzHkhimc5EqWCjvELxDQhjL4RLA8LAVwFa
	21o2Z8Yx2Epk+c3Fg4ebXJrd9sVmlJqDzOFROwOC+vwIL4+HaygjhPUQknXodYSiMmsM7CeqWNG
	+
X-Google-Smtp-Source: AGHT+IHND9XhF3r+3B0YZKqWhn2dULEhl0rN1wdr2cEuA6YcZGQNKxaiSQVa11j+oH/5JuFAMqsg3g==
X-Received: by 2002:a05:620a:4010:b0:790:88a3:2754 with SMTP id h16-20020a05620a401000b0079088a32754mr1031042qko.10.1713882370312;
        Tue, 23 Apr 2024 07:26:10 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:26:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZifE_rQhaZNbjIt2@macbook>
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-4-roger.pau@citrix.com>
 <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com>

On Tue, Apr 23, 2024 at 03:44:42PM +0200, Jan Beulich wrote:
> On 23.04.2024 15:12, Roger Pau Monne wrote:
> > Livepatch payloads containing symbols that belong to init sections can only
> > lead to page faults later on, as by the time the livepatch is loaded init
> > sections have already been freed.
> > 
> > Refuse to resolve such symbols and return an error instead.
> > 
> > Note such resolutions are only relevant for symbols that point to undefined
> > sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> > and hence must either be a Xen or a different livepatch payload symbol.
> > 
> > Do not allow to resolve symbols that point to __init_begin, as that address is
> > also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> > resolutions against it.
> > 
> > Since __init_begin can alias other symbols (like _erodata for example)
> > allow the force flag to override the check and resolve the symbol anyway.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle, as promised (and just to indicate earlier concerns were
> addressed, as this is meaningless for other purposes)
> Acked-by: Jan Beulich <jbeulich@suse.com>
> However, ...
> 
> > @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
> >                      break;
> >                  }
> >              }
> > +
> > +            /*
> > +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> > +             * livepatch payloads don't have init sections or equivalent.
> > +             */
> > +            else if ( st_value >= (uintptr_t)&__init_begin &&
> > +                      st_value <  (uintptr_t)&__init_end && !force )
> > +            {
> > +                printk(XENLOG_ERR LIVEPATCH
> > +                       "%s: symbol %s is in init section, not resolving\n",
> > +                       elf->name, elf->sym[i].name);
> > +                rc = -ENXIO;
> > +                break;
> > +            }
> 
> ... wouldn't it make sense to still warn in this case when "force" is set?

Pondered it, I was thinking that a user would first run without
--force, and use the option as a result of seeing the first failure.

However if there is more than one check that's bypassed, further ones
won't be noticed, so:

            else if ( st_value >= (uintptr_t)&__init_begin &&
                      st_value <  (uintptr_t)&__init_end )
            {
                printk(XENLOG_ERR LIVEPATCH
                       "%s: symbol %s is in init section, not resolving\n",
                       elf->name, elf->sym[i].name);
                if ( !force )
                {
                    rc = -ENXIO;
                    break;
                }
            }

Would be OK then?

Thanks, Roger.

