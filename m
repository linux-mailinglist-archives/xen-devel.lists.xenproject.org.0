Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574447D695C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622834.970027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbNo-0005br-5m; Wed, 25 Oct 2023 10:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622834.970027; Wed, 25 Oct 2023 10:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbNo-0005ZQ-1V; Wed, 25 Oct 2023 10:45:04 +0000
Received: by outflank-mailman (input) for mailman id 622834;
 Wed, 25 Oct 2023 10:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAMM=GH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvbNl-0005Yt-Op
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:45:01 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf08f65-7323-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 12:45:00 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40859c466efso32740515e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 03:45:00 -0700 (PDT)
Received: from [192.168.16.6] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a5d608b000000b0032008f99216sm11788843wrt.96.2023.10.25.03.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 03:44:59 -0700 (PDT)
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
X-Inumbo-ID: 8bf08f65-7323-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698230700; x=1698835500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAB8Za+YNx8eTSkt0VDDXW7F6lrTKw3K5FZe8J7txp4=;
        b=m3TBSuW9/FpvFqp7StlyKYQHIdDAevskQlg0712dc1//Z0QcV3E4N5yu7JzPzTD8ZA
         3hCidX7GOTufa9Gqt2nLsMGe2GVqtUtvP9cG87kWZJXP+KX2iJUfeXbZAu+K918nwKbH
         5MhZHZNQQSAUU4er66ABzhjD7RM8x0xzj4l9L+NworxFj/qn5JHRRjY0KJxXc9MCtaah
         Q9jIgCtnIe4ftmBQzeQbU/iBQ68+kgeW2eYay5oioSzfqySm2jO0I4JQeSORt+dFgnNw
         Ry6uo7bA5us+4Z46N09SQBpzrVV1dauslApqzTvNK+jF3hJbpGHxrKMZjHBCtx1wrJBn
         5VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698230700; x=1698835500;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAB8Za+YNx8eTSkt0VDDXW7F6lrTKw3K5FZe8J7txp4=;
        b=u7Ektf4wyg7XLtopTddDN0do8ET3daqh+3U7AW6vF6RFmd6NV1wpTijg34kQFEF7Rw
         F2HsRmJ9EOg8C0pENecX0/cTQ6TqVw7iEuXZtjBWslqZoRsVnUYAw3uuvP6riyXsRDZc
         0zKoQDFGvhk0PC7NA+wxTFpny60j2zR4nsgoqaG03a6knzVECjC1ty/4OhJPq5WQim+D
         jllQOdkSPjECAD/wlH7PR0HAJHNZnlZXry9sKbdrHFveoQCV5b8rhuN7ElVtljqNVr/j
         PXk6FT+0WLNLAuVyqN5dWsuAdBh65DW2udZpysjTlrZMgDcBPd6YfOK+rLwcB3+E56sw
         ZcZQ==
X-Gm-Message-State: AOJu0YxQLkzM2JvvCRTVF+jc5xGbFexSmFoPkRQ9SkgUxfoE9QOp2iCT
	WUJ4VgZMilQ9Z8ysd6Mu810=
X-Google-Smtp-Source: AGHT+IEgUt177RqiVBjvNSokftEbLh1Zc0sYAnRvYjW/rhP2mAkIVy2gI7R9jgx0ZPOjQniQLKJEdw==
X-Received: by 2002:a05:600c:45cb:b0:406:5359:769f with SMTP id s11-20020a05600c45cb00b004065359769fmr11217809wmo.0.1698230699486;
        Wed, 25 Oct 2023 03:44:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bbed0311-c33f-4f84-a08e-0709c55ec151@xen.org>
Date: Wed, 25 Oct 2023 11:44:57 +0100
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
 <684d378d-9c71-4a5f-8f0c-3ed6ffc20a70@xen.org>
 <31b160a3f3ce2eda057dafec3cab273a38f1dc0f.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <31b160a3f3ce2eda057dafec3cab273a38f1dc0f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/10/2023 10:00, David Woodhouse wrote:
> On Wed, 2023-10-25 at 09:31 +0100, Paul Durrant wrote:
>> On 24/10/2023 17:34, David Woodhouse wrote:
>>> On Tue, 2023-10-24 at 17:25 +0100, Paul Durrant wrote:
>>>> On 24/10/2023 16:49, David Woodhouse wrote:
>>>>> On Tue, 2023-10-24 at 16:39 +0100, Paul Durrant wrote:
>>>>>> On 24/10/2023 16:37, David Woodhouse wrote:
>>>>>>> On Tue, 2023-10-24 at 15:20 +0100, Paul Durrant wrote:
>>>>>>>> On 16/10/2023 16:19, David Woodhouse wrote:
>>>>>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>>>>>
>>>>>>>>> The primary console is special because the toolstack maps a page at a
>>>>>>>>> fixed GFN and also allocates the guest-side event channel. Add support
>>>>>>>>> for that in emulated mode, so that we can have a primary console.
>>>>>>>>>
>>>>>>>>> Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
>>>>>>>>> supports literally nothing except a single-page mapping of the console
>>>>>>>>> page. This might as well have been a hack in the xen_console driver, but
>>>>>>>>> this way at least the special-casing is kept within the Xen emulation
>>>>>>>>> code, and it gives us a hook for a more complete implementation if/when
>>>>>>>>> we ever do need one.
>>>>>>>>>
>>>>>>>> Why can't you map the console page via the grant table like the xenstore
>>>>>>>> page?
>>>>>>>
>>>>>>> I suppose we could, but I didn't really want the generic xen-console
>>>>>>> device code having any more of a special case for 'Xen emulation' than
>>>>>>> it does already by having to call xen_primary_console_create().
>>>>>>>
>>>>>>
>>>>>> But doesn't is save you the whole foreignmem thing? You can use the
>>>>>> grant table for primary and secondary consoles.
>>>>>
>>>>> Yes. And I could leave the existing foreignmem thing just for the case
>>>>> of primary console under true Xen. It's probably not that awful a
>>>>> special case, in the end.
>>>>>
>>>>> Then again, I was surprised I didn't *already* have a foreignmem ops
>>>>> for the emulated case, and we're probably going to want to continue
>>>>> fleshing it out later, so I don't really mind adding it.
>>>>>
>>>>
>>>> True. We'll need it for some of the other more fun protocols like vkbd
>>>> or fb. Still, I think it'd be nicer to align the xenstore and primary
>>>> console code to look similar and punt the work until then :-)
>>>
>>> I don't think it ends up looking like xenstore either way, does it?
>>> Xenstore is special because it gets to use the original pointer to its
>>> own page.
>>>
>>
>> Not sure what you mean there? A guest can query the PFN for either
>> xenstore or console using HVM params, or it can find them in its own
>> grant table entries 0 or 1.
> 
> The code in our xen_xenstore.c uses its *own* pointer (s->xs) to the
> MemoryRegion that it created (s->xenstore_page). It is its own backend,
> as well as doing the "magic" to create the guest-side mapping and event
> channel.
> 
> The difference for the console code is that we actually have a
> *separation* between the standard backend code in xen_console.c, and
> the magic frontend parts for the emulated mode.
> 
> 
>>
>>> I don't think I want to hack the xen_console code to explicitly call a
>>> xen_console_give_me_your_page() function. If not foreignmem, I think
>>> you were suggesting that we actually call the grant mapping code to get
>>> a pointer to the underlying page, right?
>>
>> I'm suggesting that the page be mapped in the same way that the xenstore
>> backend does:
>>
>> 1462    /*
>>
>> 1463     * We don't actually access the guest's page through the grant, because
>> 1464     * this isn't real Xen, and we can just use the page we gave it in the
>> 1465     * first place. Map the grant anyway, mostly for cosmetic purposes so
>> 1466     * it *looks* like it's in use in the guest-visible grant table.
>> 1467     */
>> 1468    s->gt = qemu_xen_gnttab_open();
>> 1469    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
>> 1470    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
>> 1471                                             PROT_READ | PROT_WRITE);
> 
> It already *is*. But as with xen_xenstore.c, nothing ever *uses* the
> s->granted_xs pointer. It's just cosmetic to make the grant table look
> right.
> 
> But that doesn't help the *backend* code. The backend doesn't even know
> the grant ref#, because the convention we inherited from Xen is that
> the `ring-ref` in XenStore for the primary console is actually the MFN,
> to be mapped as foreignmem.
> 
> Of course, we *do* know the grant-ref for the primary console, as it's
> always GNTTAB_RESERVED_CONSOLE. So I suppose we could put a hack into
> the xen_console backend to map *that* in the case of primary console
> under emu? In fact that would probably do the right thing even under
> Xen if we could persuade Xen to make an ioemu primary console?
> 

That's exactly what I am getting at :-) I don't think we need care about 
the ring-ref in xenstore for the primary console.

   Paul

> 
> 
> 
> 
>>>
>>> I could kind of live with that... except that Xen has this ugly
>>> convention that the "ring-ref" frontend node for the primary console
>>> actually has the *MFN* not a grant ref. Which I don't understand since
>>> the toolstack *does* populate the grant table for it (just as it does
>>> for the xenstore page). But we'd have to add a special case exception
>>> to that special case, so that in the emu case it's an actual grant ref
>>> again. I think I prefer just having a stub of foreignmem, TBH.
>>>
>>
>> You're worried about the guest changing the page it uses for the primary
>> console and putting a new one in xenstore? I'd be amazed if that even
>> works on Xen unless the guest is careful to write it into
>> GNTTAB_RESERVED_CONSOLE.
> 
> Not worried about the guest changing it. I was mostly just concerned
> about the xen-console having to have another special case and magically
> "know" it. But I suppose I can live with it being hard-coded to
> GNTTAB_RESERVED_CONSOLE. I'll knock that up and see how it makes me
> feel.
> 
> I'm reworking some of that connect/disconnect code anyway, to have the
> backend tell the primary_console code directly what the backend port#
> is, so I can remove the soft-reset hacks in xen_evtchn.c entirely.


