Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2008AC60B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709770.1108758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoVV-0004kT-Qp; Mon, 22 Apr 2024 07:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709770.1108758; Mon, 22 Apr 2024 07:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoVV-0004in-Nm; Mon, 22 Apr 2024 07:54:33 +0000
Received: by outflank-mailman (input) for mailman id 709770;
 Mon, 22 Apr 2024 07:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryoVU-0004ih-K9
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:54:32 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d0dcd4a-007d-11ef-9e3a-7da7ca7a9ce9;
 Mon, 22 Apr 2024 09:54:31 +0200 (CEST)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4dac19aa9b5so1093008e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:54:31 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac86652000000b00437392f1c20sm4030087qtp.76.2024.04.22.00.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:54:30 -0700 (PDT)
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
X-Inumbo-ID: 8d0dcd4a-007d-11ef-9e3a-7da7ca7a9ce9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713772470; x=1714377270; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OcPbgIXMS8QwkbruuSty0mIHgeNwRdS0seIARraYIb8=;
        b=PkWIuyymskGhlUxJAaQem3BlOWCPXji7EXfsg4E/MRIJJ0ocww3E+pG0wRUO/f7BrF
         f3K3beiS8G6+GKpg0vITMe/1+8ITu+QDpe6Fc35TJSPa21E7+oh2JEUOAUIPi1xigv3c
         /7na2mYnHkvOBe6xZ9faHkE4dQY+aFwuY1cw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713772470; x=1714377270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcPbgIXMS8QwkbruuSty0mIHgeNwRdS0seIARraYIb8=;
        b=aNfn7q5Po+jRu2yg26ahrsEZZlN7kPvqZWrk6Bczu1mtGhFwwQCIjp2sFuxna8RfYO
         myiWaPBwshtBQtmPH/GWHIbVNGhiW1hU/M5gQvghcMSATn2c0fAilrbX5xqycDGNQPnO
         bmgeSlTauyTZFW3JhluBEJskIgqT/SX0NdQXU5ND5ITIm0IvauXoWIgVowsm5VZKO/or
         smSm+RmFrR/mKffV2LFu+f+gDqbI9DdLxVKvuYejLhcPxDbWKvQt1nTL+n4I64e/CNF3
         8SGeVfcJ9cJRjFf7Kg+6AGnWF7BBOrDGrAxrKn+4guKhzHVsuWLDGLBSJkcBioYvjHes
         ygvg==
X-Forwarded-Encrypted: i=1; AJvYcCVFsx6a0fLB8Hmr4Q7+x+RSJEXwjs6M8p2AOe2eNcFoEaCzyl2BVaIK2IAvnOzCiGOClimMQxm/B3Ml2LFrgfH8K+O4dhAg1YbQoP3/LN0=
X-Gm-Message-State: AOJu0Yzev4T/MTyMXZxHptDbrQ+x/ufEGDU4M3xbmLPaTxi9pxmpzpF6
	B5Npjlf25uliXjNZwiVgwEwGXVeFPe8F8qv45icKzck8icpkVpalUtm61S+ubH0=
X-Google-Smtp-Source: AGHT+IHkM3eI37R8m0h8fR/ZBggUKhs/ODaBBE5b3lkm8qeivhh7ZA9Qcn8oETdEJfEkBIHd6OSNjQ==
X-Received: by 2002:a05:6122:134f:b0:4c0:2d32:612f with SMTP id f15-20020a056122134f00b004c02d32612fmr5378264vkp.15.1713772470313;
        Mon, 22 Apr 2024 00:54:30 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:54:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZiYXtJcefv-iMpAj@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>
 <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com>

On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
> On 19.04.2024 12:50, Roger Pau Monné wrote:
> > On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
> >> On 19.04.2024 12:02, Roger Pau Monne wrote:
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
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v1:
> >>>  - Fix off-by-one in range checking.
> >>
> >> Which means you addressed Andrew's comment while at the same time extending
> >> the scope of ...
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
> >>> +                      st_value < (uintptr_t)&__init_end )
> >>> +            {
> >>> +                printk(XENLOG_ERR LIVEPATCH
> >>> +                       "%s: symbol %s is in init section, not resolving\n",
> >>> +                       elf->name, elf->sym[i].name);
> >>
> >> ... what I raised concern about (and I had not seen any verbal reply to that,
> >> I don't think).
> > 
> > I've extended the commit message to explicitly mention the handling of
> > bounds for __init_{begin,end} checks.  Let me know if you are not fine
> > with it (or maybe you expected something else?).
> 
> Well, you mention the two symbols you care about, but you don't mention
> at all that these two may alias other symbols which might be legal to
> reference from a livepatch.

I'm having a hard time understanding why a livepatch would want to
reference those, or any symbol in the .init sections for that matter.
__init_{begin,end} are exclusively used to unmap the init region after
boot.  What's the point in livepatch referencing data that's no
longer there?  The only application I would think of is to calculate
some kind of offsets, but that would better be done using other
symbols instead.

Please bear with me, it would be easier for me to understand if you
could provide a concrete example.

Thanks, Roger.

