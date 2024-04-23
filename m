Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD68AEA1C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710771.1110222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHgi-0000fD-59; Tue, 23 Apr 2024 15:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710771.1110222; Tue, 23 Apr 2024 15:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHgi-0000by-1U; Tue, 23 Apr 2024 15:04:04 +0000
Received: by outflank-mailman (input) for mailman id 710771;
 Tue, 23 Apr 2024 15:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzHgf-0000Pu-T2
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:04:01 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b75f89c3-0182-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:04:01 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4365c1451d4so33445641cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:04:01 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fu48-20020a05622a5db000b0043781985244sm5256354qtb.59.2024.04.23.08.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 08:03:59 -0700 (PDT)
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
X-Inumbo-ID: b75f89c3-0182-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713884640; x=1714489440; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6DSngawMOgOuZiT9JFZr/V3Hf+OcJkFuTeqxpbqjVjM=;
        b=EM4Gy60yF0gi/V1Igl7xmglzI+bkl+mTt7pq8ud2LemZEEtGWmhFC0IVK9aWKq9eku
         7W2APWxqHSYT1G4Kn/VD0zFK1/E7O/q8TscNEaVlhiNx12BggT7gGpRBxncikufbgTYt
         PAf4WAM6rUj1rVxNXrq7eZ2gIM4MI5Ec9BxFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884640; x=1714489440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DSngawMOgOuZiT9JFZr/V3Hf+OcJkFuTeqxpbqjVjM=;
        b=hf4STH8gaTB4DGrqBiGQ/XA1UKj4ukEgVDnved1WSid2OTaPLGZLrGuymWv9ZRVGUr
         ppRTAm/xgMT46haIyoWFov/wATosiFYFa1J7dkgfRDIu74ngn8YvcztyMnOXFJrjli3w
         r1BXRRifi78uCYMPWa1+h93TTVtJtum74pRqjPBNr6VSPdmljATYgJDRnSepechInStL
         e87f0ecDzpXySeLWHysPfo2177PMWLfC3jLzsC5zik63UX2gqhs2afGgz3HHEnhNOL3K
         spfnksT7vPb5kOstnBjB25rrOTlQSJSBNSwt3ibQOZTL3tQZdWqKbet7qFR4uRCBb95U
         66lA==
X-Forwarded-Encrypted: i=1; AJvYcCWFMiRsARF2oS6KYwUBOvzkx+YzKMGfgxsqqoCj88tkzXOoy8V8uhvJxxnzpLukOnwbysq7322xmRkf+CfYQGuaJ3bt9Fu2Ii6LW+cx7FQ=
X-Gm-Message-State: AOJu0YwauCcukvaZ6CqzjR+nG+4fVKXCZqfPAcQUWwMVU724GKbBnA4s
	HSS7OYEc11e9WxbhHuV0bZVWZp9UyAyYknUoc+b6Z6R8olOSWixQklu5agFYQp8=
X-Google-Smtp-Source: AGHT+IGuCHWTx29oVk5aDqNrIw5AD02sIsOBHv4ZDczIXlczZCNGvP8E5BbHnxN2Pc8O9r3ojb4bIQ==
X-Received: by 2002:ac8:5fd2:0:b0:434:feb7:9d77 with SMTP id k18-20020ac85fd2000000b00434feb79d77mr17766088qta.32.1713884640010;
        Tue, 23 Apr 2024 08:04:00 -0700 (PDT)
Date: Tue, 23 Apr 2024 17:03:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZifN3YMbYtlv-Aa4@macbook>
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-4-roger.pau@citrix.com>
 <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com>
 <ZifE_rQhaZNbjIt2@macbook>
 <46c58aa4-d908-40ff-9c77-e0eacc7e10b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46c58aa4-d908-40ff-9c77-e0eacc7e10b6@suse.com>

On Tue, Apr 23, 2024 at 04:28:59PM +0200, Jan Beulich wrote:
> On 23.04.2024 16:26, Roger Pau Monné wrote:
> > On Tue, Apr 23, 2024 at 03:44:42PM +0200, Jan Beulich wrote:
> >> On 23.04.2024 15:12, Roger Pau Monne wrote:
> >>> Livepatch payloads containing symbols that belong to init sections can only
> >>> lead to page faults later on, as by the time the livepatch is loaded init
> >>> sections have already been freed.
> >>>
> >>> Refuse to resolve such symbols and return an error instead.
> >>>
> >>> Note such resolutions are only relevant for symbols that point to undefined
> >>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> >>> and hence must either be a Xen or a different livepatch payload symbol.
> >>>
> >>> Do not allow to resolve symbols that point to __init_begin, as that address is
> >>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> >>> resolutions against it.
> >>>
> >>> Since __init_begin can alias other symbols (like _erodata for example)
> >>> allow the force flag to override the check and resolve the symbol anyway.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> In principle, as promised (and just to indicate earlier concerns were
> >> addressed, as this is meaningless for other purposes)
> >> Acked-by: Jan Beulich <jbeulich@suse.com>
> >> However, ...
> >>
> >>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
> >>>                      break;
> >>>                  }
> >>>              }
> >>> +
> >>> +            /*
> >>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> >>> +             * livepatch payloads don't have init sections or equivalent.
> >>> +             */
> >>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> >>> +                      st_value <  (uintptr_t)&__init_end && !force )
> >>> +            {
> >>> +                printk(XENLOG_ERR LIVEPATCH
> >>> +                       "%s: symbol %s is in init section, not resolving\n",
> >>> +                       elf->name, elf->sym[i].name);
> >>> +                rc = -ENXIO;
> >>> +                break;
> >>> +            }
> >>
> >> ... wouldn't it make sense to still warn in this case when "force" is set?
> > 
> > Pondered it, I was thinking that a user would first run without
> > --force, and use the option as a result of seeing the first failure.
> > 
> > However if there is more than one check that's bypassed, further ones
> > won't be noticed, so:
> > 
> >             else if ( st_value >= (uintptr_t)&__init_begin &&
> >                       st_value <  (uintptr_t)&__init_end )
> >             {
> >                 printk(XENLOG_ERR LIVEPATCH
> >                        "%s: symbol %s is in init section, not resolving\n",
> >                        elf->name, elf->sym[i].name);
> >                 if ( !force )
> >                 {
> >                     rc = -ENXIO;
> >                     break;
> >                 }
> >             }
> > 
> > Would be OK then?
> 
> Perhaps. "not resolving" isn't quite true when "force" is true, and warnings
> would also better not be issued with XENLOG_ERR.

I was assuming that printing as XENLOG_ERR level would still be OK -
even if bypassed because of the usage of --force.  The "not resolving"
part should indeed go away. Maybe this is better:

            else if ( st_value >= (uintptr_t)&__init_begin &&
                      st_value <  (uintptr_t)&__init_end )
            {
                printk("%s" LIVEPATCH "%s: symbol %s is in init section%s\n",
                       force ? XENLOG_WARNING : XENLOG_ERR,
                       elf->name, elf->sym[i].name,
                       force ? "" : ", not resolving");
                if ( !force )
                {
                    rc = -ENXIO;
                    break;
                }
            }

Thanks, Roger.

