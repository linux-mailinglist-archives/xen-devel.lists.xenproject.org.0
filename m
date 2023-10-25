Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D17D652B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622705.969783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZIk-0005qh-BM; Wed, 25 Oct 2023 08:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622705.969783; Wed, 25 Oct 2023 08:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZIk-0005oA-6y; Wed, 25 Oct 2023 08:31:42 +0000
Received: by outflank-mailman (input) for mailman id 622705;
 Wed, 25 Oct 2023 08:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAMM=GH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvZIj-0005o4-Gw
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:31:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb5cf930-7310-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 10:31:40 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso39776955e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 01:31:40 -0700 (PDT)
Received: from [192.168.16.6] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056000023500b003198a9d758dsm11674037wrz.78.2023.10.25.01.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 01:31:39 -0700 (PDT)
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
X-Inumbo-ID: eb5cf930-7310-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698222700; x=1698827500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHTZm3wQVOwUIgOFYUJgqhN1NlzjTWcU0CvB9E7/Q/Q=;
        b=FbTPQZcnVBNfjwhq5+4dPAPlROk40xlEol/cF+rrwUYY4n52IOg2pHPTFSxR/4ZsHk
         L1zz5X5/yrIlGdiQeIOo93Hh1QVYh6PjQ3Oi8ZihtrQQVP9bI+mQmMLsy+r837VgHKs8
         bKjzdsGfNiSvbejXNEEQA+wQrMUPCageGc5SdTv4q8nd7+dtLCzPs6fYKYxoQBmTtxlG
         gi4LZIflAP87k2Z9D9bhEzpOOlg7+8HkEr8LaBax/yWFGuz+6Sf2eERqmaUN1RuGCcsq
         G+pJw11/eoXGk72h6GJ3LIWanFZH1zNgSjwb9UbRJs+e0dv+p5C7ysQKRFDle+6FTIWV
         mbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222700; x=1698827500;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHTZm3wQVOwUIgOFYUJgqhN1NlzjTWcU0CvB9E7/Q/Q=;
        b=j1xS+PpjnTuzD+3VKRFdfO/0iv+gFa//osGnR4QHSLUyK072OAZP6CQ8yed1j6sU1N
         8Wmwy79iTOX73M7KGKmn5w5B3wIK3NqH5OoryVolUKNfAU2AmDd0o29ejD0U6TQp2G/i
         L8qhpbrkONTAsEmXEDTr38fonG9TKZVNJ0ZDd+ZuGQhPJb6LOyH7yjD6nfBx6+X0p0wM
         89eWk2Aa1gH7wYHxXR1igNzIiv4k0d7+L20+crx0LPA8LtXydnKhNW9LcwRisdk7mPOK
         oFpCMD35QHayKLZC/SJ6WcFVmcq02fQ/7qo8dRTuayyYsLJ+jzWj8cPze7mu6hXwR+Fr
         2tCg==
X-Gm-Message-State: AOJu0Yx73BSl2lHMFQl7JCojCAWiYUXpMI4A/5apoGKZgBDR/upET/GB
	CLbgiA+xUSZ5Vmiz6ziE7mY=
X-Google-Smtp-Source: AGHT+IGAXvbeLVBCYEZe6F7VZMLsxtQMTPHkP81y9foV4MoWfIvrV+0OlYKHUvO1abu02c0w57sJTg==
X-Received: by 2002:a5d:456d:0:b0:32d:90f7:ce46 with SMTP id a13-20020a5d456d000000b0032d90f7ce46mr10513836wrc.16.1698222699603;
        Wed, 25 Oct 2023 01:31:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <684d378d-9c71-4a5f-8f0c-3ed6ffc20a70@xen.org>
Date: Wed, 25 Oct 2023 09:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 12/12] hw/xen: add support for Xen primary console in
 emulated mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-13-dwmw2@infradead.org>
 <c18439ca-c9ae-4567-bbcf-dffe6f7b72e3@xen.org>
 <3acd078bba2d824f836b20a270c780dc2d031c43.camel@infradead.org>
 <3f22903b-30f0-40f2-8624-b681d9c7e05d@xen.org>
 <42b005d7c03d5b0d47a16c4e025d8c3ec7289e0f.camel@infradead.org>
 <19fc2701-4cd8-4a14-9d45-bfaea37ed2d6@xen.org>
 <efdefcc11e2bd8c0f7e6e914dc9c54ffd65fe733.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <efdefcc11e2bd8c0f7e6e914dc9c54ffd65fe733.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/10/2023 17:34, David Woodhouse wrote:
> On Tue, 2023-10-24 at 17:25 +0100, Paul Durrant wrote:
>> On 24/10/2023 16:49, David Woodhouse wrote:
>>> On Tue, 2023-10-24 at 16:39 +0100, Paul Durrant wrote:
>>>> On 24/10/2023 16:37, David Woodhouse wrote:
>>>>> On Tue, 2023-10-24 at 15:20 +0100, Paul Durrant wrote:
>>>>>> On 16/10/2023 16:19, David Woodhouse wrote:
>>>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>>>
>>>>>>> The primary console is special because the toolstack maps a page at a
>>>>>>> fixed GFN and also allocates the guest-side event channel. Add support
>>>>>>> for that in emulated mode, so that we can have a primary console.
>>>>>>>
>>>>>>> Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
>>>>>>> supports literally nothing except a single-page mapping of the console
>>>>>>> page. This might as well have been a hack in the xen_console driver, but
>>>>>>> this way at least the special-casing is kept within the Xen emulation
>>>>>>> code, and it gives us a hook for a more complete implementation if/when
>>>>>>> we ever do need one.
>>>>>>>
>>>>>> Why can't you map the console page via the grant table like the xenstore
>>>>>> page?
>>>>>
>>>>> I suppose we could, but I didn't really want the generic xen-console
>>>>> device code having any more of a special case for 'Xen emulation' than
>>>>> it does already by having to call xen_primary_console_create().
>>>>>
>>>>
>>>> But doesn't is save you the whole foreignmem thing? You can use the
>>>> grant table for primary and secondary consoles.
>>>
>>> Yes. And I could leave the existing foreignmem thing just for the case
>>> of primary console under true Xen. It's probably not that awful a
>>> special case, in the end.
>>>
>>> Then again, I was surprised I didn't *already* have a foreignmem ops
>>> for the emulated case, and we're probably going to want to continue
>>> fleshing it out later, so I don't really mind adding it.
>>>
>>
>> True. We'll need it for some of the other more fun protocols like vkbd
>> or fb. Still, I think it'd be nicer to align the xenstore and primary
>> console code to look similar and punt the work until then :-)
> 
> I don't think it ends up looking like xenstore either way, does it?
> Xenstore is special because it gets to use the original pointer to its
> own page.
> 

Not sure what you mean there? A guest can query the PFN for either 
xenstore or console using HVM params, or it can find them in its own 
grant table entries 0 or 1.

> I don't think I want to hack the xen_console code to explicitly call a
> xen_console_give_me_your_page() function. If not foreignmem, I think
> you were suggesting that we actually call the grant mapping code to get
> a pointer to the underlying page, right?

I'm suggesting that the page be mapped in the same way that the xenstore 
backend does:

1462    /* 

1463     * We don't actually access the guest's page through the grant, 
because
1464     * this isn't real Xen, and we can just use the page we gave it 
in the
1465     * first place. Map the grant anyway, mostly for cosmetic 
purposes so
1466     * it *looks* like it's in use in the guest-visible grant table. 

1467     */
1468    s->gt = qemu_xen_gnttab_open();
1469    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
1470    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, 
&xs_gntref,
1471                                             PROT_READ | PROT_WRITE);


> 
> I could kind of live with that... except that Xen has this ugly
> convention that the "ring-ref" frontend node for the primary console
> actually has the *MFN* not a grant ref. Which I don't understand since
> the toolstack *does* populate the grant table for it (just as it does
> for the xenstore page). But we'd have to add a special case exception
> to that special case, so that in the emu case it's an actual grant ref
> again. I think I prefer just having a stub of foreignmem, TBH.
> 

You're worried about the guest changing the page it uses for the primary 
console and putting a new one in xenstore? I'd be amazed if that even 
works on Xen unless the guest is careful to write it into 
GNTTAB_RESERVED_CONSOLE.

> (I didn't yet manage to get Xen to actually create a primary console of
> type iomem, FWIW)
> 

No, that doesn't entirely surprise me.

   Paul


