Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0086B053
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686613.1068834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJz4-00028g-0C; Wed, 28 Feb 2024 13:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686613.1068834; Wed, 28 Feb 2024 13:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJz3-00026Q-To; Wed, 28 Feb 2024 13:28:29 +0000
Received: by outflank-mailman (input) for mailman id 686613;
 Wed, 28 Feb 2024 13:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqYS=KF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfJz2-00026I-AK
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:28:28 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4106a726-d63d-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 14:28:27 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-787bb013422so379896285a.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:28:27 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05620a12e300b00787f6064a9fsm129781qkl.108.2024.02.28.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 05:28:25 -0800 (PST)
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
X-Inumbo-ID: 4106a726-d63d-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709126906; x=1709731706; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0j5MyD9s/GyIrST96PYBQhHX3gFeuvn0TYPadHUmof8=;
        b=m4WIwGzTbAawjF/fdxE5tnTXqlLhGUZa0KT0iBSJ9s1sFxZax0T59fDCsmz7TD6u29
         b6KtMU1UtL8tSk0RpnynS4SWPW4JjFx5A+rzorgerG/W8zVeBiEJ/rBGt1H9IBlH9nwx
         D7jfhm5QBdo6nQlRhtv9Lg/ANwlBePUz7aVHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126906; x=1709731706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j5MyD9s/GyIrST96PYBQhHX3gFeuvn0TYPadHUmof8=;
        b=IjJMBVhkEEyfbrLLHcrOXzBgw2/MzV2BGB66fzh0hUXVBTbKwWyrLTfGvw3BH8UWct
         rmJxccq1RCP3UyNLHekV8Xj15TCbhvOQL7bYcErh4PAXhVVXkC5kjLlPHAA2HmmHC7Ki
         c1NMzCLPQyWh7n0z8t0P6ub88Rfr4y2AmDxVWYD7/6inexE18XNxs4gGcKgOrbyu8E8x
         FGyuxK3K3OX2PYogrSarxnuZspQMEcvocG+FvzbNLE85UsNwZ94st2sresqNdE/dZCMH
         hCw0SXcLefS0i9y4ynAXtcsYt8IFGcUz2tO6ff0+ipSiIpdTEVxJFbP+xXRUGuo16UWu
         JYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe0tqdev402uAnzwck8fAgff0fNNV2l9Yq1FRs7AWrxygm+gNZ8H+V4GwqCewu7I8NxxDiM47EZMDJP8HdnjA0vd28v6J7rrs58UddaBw=
X-Gm-Message-State: AOJu0YzzyyWoVB8AnrbBsDqXR6oKAkn7Joy3NdbOyqwkqX2QxsQZ9QMf
	WVQSyzxWahxGKzEZCMBX3Ti8KCiqV1vJtV76pY0bxJXtOydlsV41OKs2azKVZ+A=
X-Google-Smtp-Source: AGHT+IEY+IvmPSEnzKDGh0+zU9pOU1Ev1g4pS0B9K9aQYRcoHO0Q07QU/LgXvtvoAOcOZ6Wz1A20hw==
X-Received: by 2002:a05:620a:2f2:b0:787:a7c1:9d03 with SMTP id a18-20020a05620a02f200b00787a7c19d03mr4635217qko.69.1709126906248;
        Wed, 28 Feb 2024 05:28:26 -0800 (PST)
Date: Wed, 28 Feb 2024 14:28:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Message-ID: <Zd80-IGn13aThDaQ@macbook>
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
 <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
 <2f68276d-0b10-4cec-8636-5456314c194e@suse.com>
 <Zd8QtCwp75Phjluc@macbook>
 <de7c8de8-2373-4d78-8aec-c633bb253660@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de7c8de8-2373-4d78-8aec-c633bb253660@suse.com>

On Wed, Feb 28, 2024 at 12:18:31PM +0100, Jan Beulich wrote:
> On 28.02.2024 11:53, Roger Pau Monné wrote:
> > On Fri, Feb 23, 2024 at 08:43:24AM +0100, Jan Beulich wrote:
> >> On 22.02.2024 19:03, Tamas K Lengyel wrote:
> >>> On Thu, Feb 22, 2024 at 5:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 22.02.2024 10:05, Roger Pau Monne wrote:
> >>>>> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
> >>>>> can be achieved with an atomic increment, which is both simpler to read, and
> >>>>> avoid any need for a loop.
> >>>>>
> >>>>> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
> >>>>> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
> >>>>>
> >>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>> albeit ...
> >>>>
> >>>>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>>>> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
> >>>>>
> >>>>>  static shr_handle_t get_next_handle(void)
> >>>>>  {
> >>>>> -    /* Get the next handle get_page style */
> >>>>> -    uint64_t x, y = next_handle;
> >>>>> -    do {
> >>>>> -        x = y;
> >>>>> -    }
> >>>>> -    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
> >>>>> -    return x + 1;
> >>>>> +    return arch_fetch_and_add(&next_handle, 1) + 1;
> >>>>>  }
> >>>>
> >>>> ... the adding of 1 here is a little odd when taken together with
> >>>> next_handle's initializer. Tamas, you've not written that code, but do
> >>>> you have any thoughts towards the possible removal of either the
> >>>> initializer or the adding here? Plus that variable of course could
> >>>> very well do with moving into this function.
> >>>
> >>> I have to say I find the existing logic here hard to parse but by the
> >>> looks I don't think we need the + 1 once we switch to
> >>> arch_fetch_and_add. Also could go without initializing next_handle to
> >>> 1. Moving it into the function would not really accomplish anything
> >>> other than style AFAICT?
> >>
> >> Well, limiting scope of things can be viewed as purely style, but I
> >> think it's more than that: It makes intentions more clear and reduces
> >> the chance of abuse (deliberate or unintentional).
> > 
> > I'm afraid that whatever is the outcome here, I will defer it to a
> > further commit, since the purpose here is to be a non-functional
> > change.
> 
> That's fine with me, but an ack from Tamas is still pending, unless I
> missed something somewhere.

No, just wanted to clarify that I wasn't expecting to do further
changes here, FTAOD.  Not sure if Tamas was expecting me to further
adjust the code.

Thanks, Roger.

