Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE88ACC17
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 13:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709915.1108951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrws-0006Tv-0V; Mon, 22 Apr 2024 11:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709915.1108951; Mon, 22 Apr 2024 11:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrwr-0006Rs-T7; Mon, 22 Apr 2024 11:35:01 +0000
Received: by outflank-mailman (input) for mailman id 709915;
 Mon, 22 Apr 2024 11:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryrwr-0006Rm-3n
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 11:35:01 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5908757f-009c-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 13:34:58 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78f056f928eso304187585a.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 04:34:58 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm4194441qkb.123.2024.04.22.04.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 04:34:57 -0700 (PDT)
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
X-Inumbo-ID: 5908757f-009c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713785698; x=1714390498; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vs9H2eyufjAukqG9ygLTgtfMTLiTTcuoUQ027c0xEm0=;
        b=SWs/kGZ2hUOL3JyYcUwk1+DXdsi8r/BVY7t4jharVXJjjtnYSmCSn9unQwA6YAnBKo
         soef4jaimX5jVOcRShOYi0jUWiAk/qQPhLbT2uwwxhfK+3mt742t1d5XaVyecrjhqoos
         2rVu/SJKb0cFebe5inHjG7hY/+PSZaUHOcbMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713785698; x=1714390498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vs9H2eyufjAukqG9ygLTgtfMTLiTTcuoUQ027c0xEm0=;
        b=hsaEfrD8XojOg4r/BlskDajsNtLvMDgUJiIdvMobOqgVz/XvN5f2Hma24R1654PrdE
         PLJMuvbTO/iS2WUWmEhgtcaP460P0dLjOmLQ8zhbCxOplEMBuYEULGx12GOarhQFRir0
         E1hQU/+1B3VNC+3rqqd5xiI5JxYJsqIy/z9WrKTOq9ngWR8Hb886GsGhGZdrOI7GZ5HI
         mPnjX/LVamt4cgzmKC5jyUSQ49yEDywioM147n4rfGC6o4yDNYMvJWH+LtVEocl0Ncp7
         ahsbPruOqi+ciSjyFnBuZwiClaMfQLdhPhcEDZ+e77WTgW9K6YHgWelDnOoX/RzXJRZC
         EXaA==
X-Forwarded-Encrypted: i=1; AJvYcCVFhsQwMo6YqLFX4wtp/NO59HY3c4Fmgynm7zDCAVUuTtgvO6NoQA4N46gIhp8ETkLfvcJXzKz2Df+KYRlHrqspE23jMxKyG3XvV5J/MYQ=
X-Gm-Message-State: AOJu0Yz3qYmxzeAPZ1vMyjT7l8qhiEWj60RHaEoMNkcFogTsxTJ8ur2g
	6ugNkYwazjeWGCFhhBi/Hezs5/BlFAHtngVBDrElNtr+3wpqBqVe8WWpPa9zJ9Q=
X-Google-Smtp-Source: AGHT+IH5fIfoz6CWcMRe16edZkr/xXqGR63G+hqFD764MNdt/mJtcvSZd2xrwjO7LSUEVMbJYP9ZRw==
X-Received: by 2002:a05:620a:d58:b0:78e:ccad:61dd with SMTP id o24-20020a05620a0d5800b0078eccad61ddmr10272224qkl.76.1713785697762;
        Mon, 22 Apr 2024 04:34:57 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:34:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZiZLX15vpPT_uDJ_@macbook>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>
 <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com>
 <ZiYXtJcefv-iMpAj@macbook>
 <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com>
 <ZiZA0-n6vbOgu-_1@macbook>
 <e5763200-fa87-46ec-8746-c7b4215a28ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5763200-fa87-46ec-8746-c7b4215a28ff@suse.com>

On Mon, Apr 22, 2024 at 12:57:55PM +0200, Jan Beulich wrote:
> On 22.04.2024 12:49, Roger Pau Monné wrote:
> > On Mon, Apr 22, 2024 at 10:25:40AM +0200, Jan Beulich wrote:
> >> On 22.04.2024 09:54, Roger Pau Monné wrote:
> >>> On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
> >>>> On 19.04.2024 12:50, Roger Pau Monné wrote:
> >>>>> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
> >>>>>> On 19.04.2024 12:02, Roger Pau Monne wrote:
> >>>>>>> Livepatch payloads containing symbols that belong to init sections can only
> >>>>>>> lead to page faults later on, as by the time the livepatch is loaded init
> >>>>>>> sections have already been freed.
> >>>>>>>
> >>>>>>> Refuse to resolve such symbols and return an error instead.
> >>>>>>>
> >>>>>>> Note such resolutions are only relevant for symbols that point to undefined
> >>>>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> >>>>>>> and hence must either be a Xen or a different livepatch payload symbol.
> >>>>>>>
> >>>>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
> >>>>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> >>>>>>> resolutions against it.
> >>>>>>>
> >>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>>> ---
> >>>>>>> Changes since v1:
> >>>>>>>  - Fix off-by-one in range checking.
> >>>>>>
> >>>>>> Which means you addressed Andrew's comment while at the same time extending
> >>>>>> the scope of ...
> >>>>>>
> >>>>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
> >>>>>>>                      break;
> >>>>>>>                  }
> >>>>>>>              }
> >>>>>>> +
> >>>>>>> +            /*
> >>>>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> >>>>>>> +             * livepatch payloads don't have init sections or equivalent.
> >>>>>>> +             */
> >>>>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> >>>>>>> +                      st_value < (uintptr_t)&__init_end )
> >>>>>>> +            {
> >>>>>>> +                printk(XENLOG_ERR LIVEPATCH
> >>>>>>> +                       "%s: symbol %s is in init section, not resolving\n",
> >>>>>>> +                       elf->name, elf->sym[i].name);
> >>>>>>
> >>>>>> ... what I raised concern about (and I had not seen any verbal reply to that,
> >>>>>> I don't think).
> >>>>>
> >>>>> I've extended the commit message to explicitly mention the handling of
> >>>>> bounds for __init_{begin,end} checks.  Let me know if you are not fine
> >>>>> with it (or maybe you expected something else?).
> >>>>
> >>>> Well, you mention the two symbols you care about, but you don't mention
> >>>> at all that these two may alias other symbols which might be legal to
> >>>> reference from a livepatch.
> >>>
> >>> I'm having a hard time understanding why a livepatch would want to
> >>> reference those, or any symbol in the .init sections for that matter.
> >>> __init_{begin,end} are exclusively used to unmap the init region after
> >>> boot.  What's the point in livepatch referencing data that's no
> >>> longer there?  The only application I would think of is to calculate
> >>> some kind of offsets, but that would better be done using other
> >>> symbols instead.
> >>>
> >>> Please bear with me, it would be easier for me to understand if you
> >>> could provide a concrete example.
> >>
> >> The issue is that you do comparison by address, not by name. Let's assume
> >> that .rodata ends exactly where .init.* starts. Then &__init_begin ==
> >> &_erodata == &__2M_rodata_end. Access to the latter two symbols wants to
> >> be permitted; only __init_begin and whatever ends up being the very first
> >> symbol in .init.* ought to not be referenced.
> > 
> > Hm, I guess I could add comparison by name additionally, but it looks
> > fragile to me.
> 
> It looks fragile, yes. Thing is that you're trying to deal with this when
> crucial information was lost already. Or wait - isn't the section number
> still available in ->st_shndx?

But that's the section number of the to be resolved symbol?  In the
livepatch payload it would for example appear as:

0000000000000000       F *UND*	0000000000000000 .hidden setup_boot_APIC_clock

With undefined section.

It's possible I'm not following, is there a way to get the section
number of the current Xen symbols, and then correlate it with the
.init section?

Overall, I think it's unlikely for a livepatch to care about the
section start/end markers, albeit it would be good if we could make
this less ambiguous.

> 
> > So when st_value == __init_begin check if the name matches
> > "__init_begin" or "__2M_init_start" or "_sinittext", and fail
> > resolution, otherwise allow it?
> 
> Kind of, but that's not enough. For one, as said, the first symbol in
> the first .init.* section would also have this same address, and would
> also want rejecting. And then the same would be needed for __init_end.
> 
> >> Worse (but contrived) would be cases of "constructed" symbols derived from
> >> ones ahead of __init_begin, with an offset large enough to actually point
> >> into .init.*. Such are _still_ valid to be used in calculations, as long
> >> as no deref occurs for anything at or past __init_begin.
> > 
> > But one would have to craft such a symbol specifically, at which point
> > I consider this out of the scope of what this patch is attempting to
> > protect against.  The aim is not to prevent malicious livepatches, and
> > there are far easier ways to trigger a page-fault from a livepatch.
> 
> I understand the latter is the case, but I'm afraid I then don't see what
> the goal of this change is.

The goal would be for something like what caused:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=af4cd0a6a61cdb03bc1afca9478b05b0c9703599

To be rejected at load time instead of causing a page-fault during
alternative patching, because xsm_ops was (wrongly) an .init symbol.

Thanks, Roger.

