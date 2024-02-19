Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91E85A3CE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 13:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682789.1062029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc35x-0002a6-PT; Mon, 19 Feb 2024 12:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682789.1062029; Mon, 19 Feb 2024 12:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc35x-0002WA-MA; Mon, 19 Feb 2024 12:50:05 +0000
Received: by outflank-mailman (input) for mailman id 682789;
 Mon, 19 Feb 2024 11:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TU0m=J4=gmail.com=guixiongwei@srs-se1.protection.inumbo.net>)
 id 1rc21X-0005nR-17
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:41:27 +0000
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [2607:f8b0:4864:20::544])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf719d4-cf1b-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 12:41:23 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id
 41be03b00d2f7-5cedfc32250so3451510a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 03:41:23 -0800 (PST)
Received: from [10.4.72.30] ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a17090a528300b002990d91d31dsm4956437pjh.15.2024.02.19.03.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 03:41:21 -0800 (PST)
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
X-Inumbo-ID: cdf719d4-cf1b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708342881; x=1708947681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DseBf/8i17+ETW7/Dma7xksfJzr0mR0ZxNxdl75ecBo=;
        b=N6lEOHHdxvDxzBeKYmSbMgK2LT7CcyqkuRoxLtyIEJNFgmvsePUAwP3VqL6QsVBWpL
         8+yY4N5i16Hx+5uAuoiPtb9xvHakEWxT893pY4Rq3bZ7OFWuSeEktS5ofiZCk89mc7ER
         cd4FHphVZJCvjdxQLcEvoih309u+wRvUu6Tt2SMjgkhDjng4d1CzrIsqZ09i6usEINWb
         khP8fnZJLgO8yUzTzIEZSowu/9BMLJ1iM+Ep+KFkb/ynVoEXvb8CDEuVzSP+tSvrMDKB
         mrkqOMXuiXFnAbkpkZCM/es2huylxiMhuv6IMyScwcTLYpF53N5yaFS5RZ9PbxCkkrkr
         3VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342881; x=1708947681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DseBf/8i17+ETW7/Dma7xksfJzr0mR0ZxNxdl75ecBo=;
        b=MPNM00Rjg+Q8SJdL3pzeOYQeZ+og8QwC3uPW+nrdQZ8gWxd42SX9GdOgKVvwI03ytI
         wLL7Uu+ClIqjaraaHQt84pKE3jLdIkoGxIpdZqzNAy0eOfEk1+Rnof0ZPchNfKimPEgZ
         9dGfKsWwWv2WlcpdaY0xwi54JRKj9ne1bxRymnlFxUwWUO6pzymxlr8uVecnAEmRl5p7
         rQ/x/DjCQZjmOlr901gr1Bq5WW5tj4LiB6OMp8NzvYcg9KalMXUeDcOsHLCYSJcFB0Wt
         V+a+NAw7h8nN8ppkCYZVs5hLg7jFYzBDRYpsB68L2D1oLK2wazfOn7Bz2XteOHJk80bT
         VjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNRI0aE+eYM+u3J1UH9dL213VwOGzjETuJJWL4YNPjiHo7bgpYUf830JwVV2aZZWUZQBjPyT5Iwq+FUnuPRuz2oCW0OuX1OZ0g3vvur6U=
X-Gm-Message-State: AOJu0YwCeIiVlau8Ae7BWko9EikfQyFxUYKj9ctXTZl08IPYCPM+Aiqx
	WDEnUbSkrz/WhyCYFbamkavzGNvEfjvjnO0rKQin38l+FaXSvg49
X-Google-Smtp-Source: AGHT+IHt9rUtlOsN4joDJDaLQ46HZsx+ssQX5mNojSpy9mOPjyyNMVV/S4A0DycY+IBGc04fyk0DsA==
X-Received: by 2002:a17:90a:134f:b0:299:11c0:13c4 with SMTP id y15-20020a17090a134f00b0029911c013c4mr7631636pjf.24.1708342881478;
        Mon, 19 Feb 2024 03:41:21 -0800 (PST)
Message-ID: <7a1c2bf7-df85-431a-ae21-82eeb171f1c4@gmail.com>
Date: Mon, 19 Feb 2024 19:41:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC] kernel/ksysfs.c: restrict /sys/kernel/notes to root
 access
To: Kees Cook <keescook@chromium.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-hardening@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Guixiong Wei <weiguixiong@bytedance.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20240218073501.54555-1-guixiongwei@gmail.com>
 <2024021825-skiing-trustee-a56a@gregkh> <202402180028.6DB512C50@keescook>
From: Guixiong Wei <guixiongwei@gmail.com>
In-Reply-To: <202402180028.6DB512C50@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/2/18 17:04, Kees Cook wrote:
> On Sun, Feb 18, 2024 at 08:47:03AM +0100, Greg KH wrote:
>> On Sun, Feb 18, 2024 at 03:35:01PM +0800, Guixiong Wei wrote:
>>> From: Guixiong Wei <weiguixiong@bytedance.com>
>>>
>>> Restrict non-privileged user access to /sys/kernel/notes to
>>> avoid security attack.
>>>
>>> The non-privileged users have read access to notes. The notes
>>> expose the load address of startup_xen. This address could be
>>> used to bypass KASLR.
>> How can it be used to bypass it?
>>
>> KASLR is, for local users, pretty much not an issue, as that's not what
>> it protects from, only remote ones.
>>
>>> For example, the startup_xen is built at 0xffffffff82465180 and
>>> commit_creds is built at 0xffffffff810ad570 which could read from
>>> the /boot/System.map. And the loaded address of startup_xen is
>>> 0xffffffffbc265180 which read from /sys/kernel/notes. So the loaded
>>> address of commit_creds is 0xffffffffbc265180 - (0xffffffff82465180
>>>   - 0xffffffff810ad570) = 0xffffffffbaead570.
>> I've cc: the hardening list on this, I'm sure the developers there have
>> opinions about this.
> Oh eww, why is Xen spewing addresses into the notes section? (This must
> be how it finds its entry point? But that would be before relocations
> happen...)
>
> But yes, I can confirm that relocations are done against the .notes
> section at boot, so the addresses exposed in .notes is an immediate
> KASLR offset exposure.
>
> In /sys/kernel/notes (are there any tools to read this? I wrote my own...)
>
> 	type: 1
> 	name: Xen
> 	desc: 0xb4a711c0 0xffffffff
>
> which matches a privileged read of /proc/kallsysms:
>
> 	ffffffffb4a711c0 T startup_xen
>
> (and the hypercall_page too)
>
> There are all coming from arch/x86/xen/xen-head.S:
>
>          ELFNOTE(Xen, XEN_ELFNOTE_GUEST_OS,       .asciz "linux")
>          ELFNOTE(Xen, XEN_ELFNOTE_GUEST_VERSION,  .asciz "2.6")
>          ELFNOTE(Xen, XEN_ELFNOTE_XEN_VERSION,    .asciz "xen-3.0")
> #ifdef CONFIG_XEN_PV
>          ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
>          /* Map the p2m table to a 512GB-aligned user address. */
>          ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
>          ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
> ...
>
> Introduced in commit 5ead97c84fa7 ("xen: Core Xen implementation")
>
> Exposed in commit da1a679cde9b ("Add /sys/kernel/notes")
>
> Amazingly these both went in on the same release (v2.6.23, 2007). This
> has been exposed for longer than KASLR has been upstream. :P
>
>>> Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
>>> ---
>>>   kernel/ksysfs.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
>>> index b1292a57c2a5..09bc0730239b 100644
>>> --- a/kernel/ksysfs.c
>>> +++ b/kernel/ksysfs.c
>>> @@ -199,7 +199,7 @@ static ssize_t notes_read(struct file *filp, struct kobject *kobj,
>>>   static struct bin_attribute notes_attr __ro_after_init  = {
>>>   	.attr = {
>>>   		.name = "notes",
>>> -		.mode = S_IRUGO,
>>> +		.mode = S_IRUSR,
>>>   	},
>>>   	.read = &notes_read,
>>>   };
> Yes please.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> I wonder if we should also remove relocations that are aimed at the
> .notes section for good measure? If that had already been true, this
> would have just given the same info as System.map.
That's a good idea, but it depends on whether the user space tool can 
accept the remove relocation address.
>> No objection from me, but what userspace tool requires access to this
>> file today?  Will it break if permissions are changed on it?
 From the exposed content, it seems that the main users are Xen-related 
tools. I add Xen list, developers should be able to provide some 
information.
>> And what about the module notes files?  If you change one, shouldn't you
>> change all?
 From what I currently know, the module note files do not expose any 
kernel symbol address, so there is no need for modification.
> Luckily all of _those_ contain what I'd expect: the Linux and
> GNU.build-id notes, which are harmless. But if we're going to suddenly
> have things appearing in here, let's make those root-only too.
Yes, but I also not sure whether the user space tools using this file 
can accept this permission modification.

