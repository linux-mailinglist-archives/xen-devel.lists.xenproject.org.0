Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4CA5DA0B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 10:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910143.1316910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIpz-0004J8-MA; Wed, 12 Mar 2025 09:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910143.1316910; Wed, 12 Mar 2025 09:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIpz-0004Gn-If; Wed, 12 Mar 2025 09:57:19 +0000
Received: by outflank-mailman (input) for mailman id 910143;
 Wed, 12 Mar 2025 09:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3Ag=V7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsIpx-0004Gh-NA
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 09:57:17 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 610c22d6-ff28-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 10:57:16 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so5928447a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 02:57:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac2394825d9sm1063193266b.50.2025.03.12.02.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 02:57:15 -0700 (PDT)
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
X-Inumbo-ID: 610c22d6-ff28-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741773436; x=1742378236; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgppIG5tpINg2Y1qHX6GPDEulu7c3cWP4/0KtQcMqZM=;
        b=VpOGVDzLHyX9brlI0lGlGZiY9/dUCpRCb+ZTH5MkKqviIS7HxVAuOyJ/2s4l+xGonz
         Msnuxn9W/mHMeFO2H09XjW91scrX36ctCPx67/dQ1tk2xUEum2FdEVFaW0aaw2pQFKZi
         kprWQOkTwnZc+TVl0P1DR6oh/Ug9yiCQ0uM2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741773436; x=1742378236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgppIG5tpINg2Y1qHX6GPDEulu7c3cWP4/0KtQcMqZM=;
        b=QOT8EhhdgAOH4fIsGr68xfthl4fD1Onn+qFqzLXczoq62Ywca+YqImREtHWatvNUAU
         79kf9UrajpmCkjgTd8frKwG1bXGMOKOKaM0YDVLJVE3FZS7h77cMIwLcYJ27wejehcOm
         xd4nbaFHu2ic12/scYx47h19Vx5fP0MkaVxSF6d+dj05qaxqBfaVj3SWdp6KkTEiltU9
         uND9R1nZ7wN+LBg9VTq93EtUymk5GHUMntoaplSzA4rkX8SaqepaFblCW+4iH+HJJFmT
         5SntQhcabu3rlaKJLpoTo4IloBJMEiVq5EYklMilRjdG+aIgIhOvk0u6KXPzev+HioYv
         uuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzT/1NNIjrLXVy9u1vSXfa15dS0PIr3booc/HyNBPvouC/iiei3CxMyA3zOWeOvM6MjCPT2FyPGNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjT8YPbRynNExliPv+T3vjgt2NKs5eqKwn7s3e39eNJqAeIVP1
	eD0W3QEVXLc1H4haUDDAFIV5SnMaWsSEcYMP+vR2InmVWahnsPAejMcXhOQkMCofICAkyuswg2u
	K
X-Gm-Gg: ASbGnctnOcpHWAydHHygnFs7J9FPDsqcWmbmZmedex+A/BFzyN57R7hvHK9glM0VoqL
	hoTxTXkX05Py3ZIlHQSv4nYx5qKv6x62kvGHvYl5+qGQ5+vCyg9s9clRw8V76O1N6+qriKag9my
	d8asn6UzZmKudY5Ka5NbI6LIp0uiT64C9qU5UeQ7jqy3laN7AlR+xaeJmnbit1nis48TITH0eFJ
	2Z1Uv7QmNq7i3fnFbYAOLlHaqD+Wgl00M7gWgtKnyhATMye2/2BY5g8dQ3VGok2WMb0HKMwz970
	tg2/Srq4CpohgvkMZ4ui/YdSRY6ta0JflMnIcdIr509TU1i1wQ==
X-Google-Smtp-Source: AGHT+IHwiTbQL/NyyTY4Bra6CIuLlq5Pr8bcMhjJzmfxVs4+/XMlhDVgLmCpwjzvIEvFmIeNVFEPPw==
X-Received: by 2002:a17:907:1c1f:b0:ac1:e00c:a566 with SMTP id a640c23a62f3a-ac252fa10ffmr2865168266b.45.1741773435870;
        Wed, 12 Mar 2025 02:57:15 -0700 (PDT)
Date: Wed, 12 Mar 2025 10:57:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
Message-ID: <Z9FaeksA0d9Ms15m@macbook.local>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
 <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
 <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
 <0565db90-5734-4795-8988-efd3e72cc770@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0565db90-5734-4795-8988-efd3e72cc770@suse.com>

On Wed, Mar 12, 2025 at 09:31:37AM +0100, Jan Beulich wrote:
> On 11.03.2025 21:47, Andrew Cooper wrote:
> > On 06/01/2025 11:54 am, Jan Beulich wrote:
> >> On 06.01.2025 12:26, Andrew Cooper wrote:
> >>> Regular data access into the trampoline is via the directmap.
> >>>
> >>> As now discussed quite extensively in asm/trampoline.h, the trampoline is
> >>> arranged so that only the AP and S3 paths need an identity mapping, and that
> >>> they fit within a single page.
> >>>
> >>> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
> >>> expected of the trampoline to be mapped.  Cut it down just the single page it
> >>> ought to be.
> >>>
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Acked-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Thanks.  However,
> > 
> >> on the basis that this improves things. However, ...
> >>
> >>> --- a/xen/arch/x86/x86_64/mm.c
> >>> +++ b/xen/arch/x86/x86_64/mm.c
> >>> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
> >>>  {
> >>>      BUG_ON(num_online_cpus() != 1);
> >>>  
> >>> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
> >>> +    /* Stop using l?_bootmap[] mappings. */
> >>>      l4e_write(&idle_pg_table[0], l4e_empty());
> >>>      flush_local(FLUSH_TLB_GLOBAL);
> >>>  
> >>> -    /* Replace with mapping of the boot trampoline only. */
> >>> +    /*
> >>> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
> >>> +     * is arranged to fit in a single page.
> >>> +     */
> >>>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
> >>> -                     PFN_UP(trampoline_end - trampoline_start),
> >>> -                     __PAGE_HYPERVISOR_RX);
> >>> +                     1, __PAGE_HYPERVISOR_RX);
> >> ... literal numbers like this - however well they are commented - are
> >> potentially problematic to locate in case something changes significantly.
> >> The 1 here really would want connecting with the .equ establishing
> >> wakeup_stack.
> > 
> > how do you propose doing this?
> > 
> > PFN_UP(wakeup_stack - trampoline_start) doesn't have the same obvious
> > connection, and it would involve partly undoing 7d73c6f196a5 which hid
> > the symbol recently.
> > 
> > While 1 isn't ideal, it is next to a comment explaining what's going on,
> > and it's not going to go stale in a silent way...  (It's also not liable
> > to go stale either.)
> 
> If in
> 
>         .equ    wakeup_stack, trampoline_start + PAGE_SIZE
> 
> PAGE_SIZE was replaced by a new (in asm/trampoline.h) TRAMPOLINE_PERM_SIZE,
> you could use PFN_UP(TRAMPOLINE_PERM_SIZE) here to establish a connection.
> 
> I have to admit I also don't really see why things going stale here would
> (a) be unlikely and (b) be guaranteed to not go silently. We just don't
> know what we may need to add to the trampoline, sooner or later.

Maybe we could introduce trampoline_{ap?,runtime?}_{start,end} that
covers this more narrow section of the trampoline code?

Thanks, Roger.

