Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB56AE5F3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507570.781252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZqJ-0008Eq-GK; Tue, 07 Mar 2023 16:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507570.781252; Tue, 07 Mar 2023 16:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZqJ-0008Br-CZ; Tue, 07 Mar 2023 16:07:11 +0000
Received: by outflank-mailman (input) for mailman id 507570;
 Tue, 07 Mar 2023 16:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZZqH-0008Bl-VW
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:07:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c121b48-bd02-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 17:07:07 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id bx12so12627524wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:07:07 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adff011000000b002c5a1bd527dsm12816184wro.96.2023.03.07.08.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:07:06 -0800 (PST)
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
X-Inumbo-ID: 1c121b48-bd02-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678205227;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0H/+Aloi1KiZg+ye6m8zoXqklBT/IfAyOTQ+13p4YMk=;
        b=BewN3PtsvMyJwYGyLWpl6bBq+SlhTspcjq9nuGvBobr+QVx8bTyP3XJ4xvE4aHNzuF
         oY2IhjwWimGjA9WqwI4DUlKDJG8RhHdwDQ+3+jeU5VOnDc0S/5uBxcj9hqUncUr8pTgX
         6S5rKNbzO5if6SxeS/FS/+21sQdVQog6/PXIn3uEP4E2EaY5cExY9GadQHeYW412aX2F
         bYyy9XI2BrkXgy/p5fBIZa4esns5VpvNcmHC8hh1IMd+AP8jPZYQunZj5hkx/c+Anm6k
         icV7Q0azz6RCP94vazUVzFIUo6oGnVTyu0dfRVe+RtmHJPvzYcT5s9BzWcfekz8dQy9J
         3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678205227;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H/+Aloi1KiZg+ye6m8zoXqklBT/IfAyOTQ+13p4YMk=;
        b=db1ktlZhFsSR0NKl1IylEzoViJdwZ8L55QmWJtsYsXGvyojrToxMt6/0lvGVLEQWGS
         k0FoaSCt87kkZh9rz77eWGEFC+IdWT2LqtqFP5PjtOl779NUDg0T/1n+lSvcT90ggtOX
         XVIAjMyThHtOTJ65NHT7BDvO5jpzrM9VQ//ZuPcvVGpsFg1Kv3DBdqK2uHL0dhNTTW5K
         C6KZNXOSi+ACYkUYH+js/xObMumasVgP3BedDK4jEmillS/OwfGvKDl8AIphdFi1NudZ
         ofu3LM3zvTuJ6HtThoV0MJY7fTL/ac2j/fbJ8bwKsxYxd4GKLii6vf1xHyOpcY+UQNJn
         wikA==
X-Gm-Message-State: AO0yUKVGUvSd+mt/gNbI5j0PO4To/NP3tQJ0amf9I3G/haxflBROsKIa
	MkQxTsHaVNxS6yUcLljO4Oo=
X-Google-Smtp-Source: AK7set/hEKiuZhAKGXqh7OLuuCFpqLaIldCtdKFsHX1nROkJ2AzPbuOMO1Nn1rjJ9BWUmxmW2ZbrWQ==
X-Received: by 2002:a5d:4ecb:0:b0:2c7:17e0:54f5 with SMTP id s11-20020a5d4ecb000000b002c717e054f5mr8562529wrv.13.1678205227220;
        Tue, 07 Mar 2023 08:07:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ee8f307b-1e0a-6d6c-3edc-8f8262dcfe42@xen.org>
Date: Tue, 7 Mar 2023 16:07:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 21/25] hw/xen: Add emulated implementation of grant
 table operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-22-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is limited to mapping a single grant at a time, because under Xen the
> pages are mapped *contiguously* into qemu's address space, and that's very
> hard to do when those pages actually come from anonymous mappings in qemu
> in the first place.
> 
> Eventually perhaps we can look at using shared mappings of actual objects
> for system RAM, and then we can make new mappings of the same backing
> store (be it deleted files, shmem, whatever). But for now let's stick to
> a page at a time.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c | 299 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 296 insertions(+), 3 deletions(-)
> 
[snip]
> +static uint64_t gnt_ref(XenGnttabState *s, grant_ref_t ref, int prot)
> +{
> +    uint16_t mask = GTF_type_mask | GTF_sub_page;
> +    grant_entry_v1_t gnt, *gnt_p;
> +    int retries = 0;
> +
> +    if (ref >= s->max_frames * ENTRIES_PER_FRAME_V1 ||
> +        s->map_track[ref] == UINT8_MAX) {
> +        return INVALID_GPA;
> +    }
> +
> +    if (prot & PROT_WRITE) {
> +        mask |= GTF_readonly;
> +    }
> +
> +    gnt_p = &s->entries.v1[ref];
> +
> +    /*
> +     * The guest can legitimately be changing the GTF_readonly flag. Allow

I'd call a guest playing with the ref after setting GTF_permit_access a 
buggy guest and not bother with the loop.

> +     * that, but don't let a malicious guest cause a livelock.
> +     */
> +    for (retries = 0; retries < 5; retries++) {
> +        uint16_t new_flags;
> +
> +        /* Read the entry before an atomic operation on its flags */
> +        gnt = *(volatile grant_entry_v1_t *)gnt_p;
> +
> +        if ((gnt.flags & mask) != GTF_permit_access ||
> +            gnt.domid != DOMID_QEMU) {
> +            return INVALID_GPA;
> +        }
> +
> +        new_flags = gnt.flags | GTF_reading;
> +        if (prot & PROT_WRITE) {
> +            new_flags |= GTF_writing;
> +        }
> +
> +        if (qatomic_cmpxchg(&gnt_p->flags, gnt.flags, new_flags) == gnt.flags) {

Xen actually does a cmpxchg on both the flags and the domid. We probably 
ought to fail to set the flags if the guest is playing with the domid 
but since we're single-tenant it doesn't *really* matter... just a 
nice-to-have. So...

Reviewed-by: Paul Durrant <paul@xen.org>


