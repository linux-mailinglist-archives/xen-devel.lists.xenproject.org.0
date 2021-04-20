Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1B3652D4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 09:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113301.215874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkQH-00065S-E7; Tue, 20 Apr 2021 07:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113301.215874; Tue, 20 Apr 2021 07:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkQH-000653-Aw; Tue, 20 Apr 2021 07:03:49 +0000
Received: by outflank-mailman (input) for mailman id 113301;
 Tue, 20 Apr 2021 07:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N909=JR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lYkQF-00064i-Uq
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:03:48 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94e5059b-bb5d-426e-90f4-d7db59f96b73;
 Tue, 20 Apr 2021 07:03:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r7so24407014wrm.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Apr 2021 00:03:46 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id n9sm25761566wrq.86.2021.04.20.00.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 00:03:45 -0700 (PDT)
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
X-Inumbo-ID: 94e5059b-bb5d-426e-90f4-d7db59f96b73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z0qlnC9FQLAYaUfbzjwveKndRqxMBnneIPTllI02ItA=;
        b=hCCPYMXGdUsCAS6vyVjzwk4D/dBhqlKrvFqivZmP6ldu0r5XUM9lfCzwo+R0aqTra4
         Fp1SbxXbpiYGidu1zBLZJ3uo1eKKsUylIVVz1mVX4OVkQcKWMN2W7SVmtElqLgEWRa5h
         FDgBoPKwIwp5++UNE2GKjQcuLTzlrVry+ptJFl4GBOtwZnHf3T9d+l8dB+lsDoIwBsop
         9D0uj8TGXhOf6ytsyqHgh4neU6YJFJFctT2ZFU/VKYv6mrpiZrPEY4KdOqloO1JgikiM
         o2zsjFMKpm+xWR/h9bcVgQXfik1OwsCjxNYjqwgotz1fON1m2qKLwEf7BhTtu26Odae8
         li7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z0qlnC9FQLAYaUfbzjwveKndRqxMBnneIPTllI02ItA=;
        b=n0PLaYpy0BYbuZDUxuvGqJNK93YB9kbKCcG5+m3CxNzNRNTJxY+7RxK6vNDWnNc9K3
         o8+ze+1uCy3i48paDoXvb6BjAo/sLq5hU9F1rPHKAjOvn/AFyYTgoqROqrPvRXXDpabr
         zfsnS7Ki2S7bLXtjaTo53HSjnI4ThC+iGYVt2b0xwb9+6mQnSwxU48pUmUzclRXc+0ME
         Bax+IIDxVAfJCMJyH1HZqGQ8FM3OUTAK+V0hItkV062fxepVzF0z6F9Fc4CFCpBtWOWl
         ke50J0VPDLoW0ULzU/G+cOptMG737cxmgegfOMVdgk4/GOpVtkOaOCKJKo/ksXB8z/J1
         PNug==
X-Gm-Message-State: AOAM531iHJxUJrPJSX0rYj0R6+2JAfQg3fx14Fy1U+gx3rlStEmfEuxW
	52fpsh7r7c6tLuA37BTVa6Y=
X-Google-Smtp-Source: ABdhPJwZlSRYmjIazA6Om37onLUUl6ivvSf7z8zRum+4Pjxaj9lJNZiWZW4i5AzFsakd4iL8sDqYag==
X-Received: by 2002:adf:e483:: with SMTP id i3mr19436550wrm.286.1618902225921;
        Tue, 20 Apr 2021 00:03:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
To: Igor Druzhinin <igor.druzhinin@citrix.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, anthony.perard@citrix.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
References: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Message-ID: <37547f5e-5b75-d31a-f973-f8ccedbe4167@xen.org>
Date: Tue, 20 Apr 2021 08:03:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/04/2021 04:35, Igor Druzhinin wrote:
> When we're replacing the existing mapping there is possibility of a race
> on memory map with other threads doing mmap operations - the address being
> unmapped/re-mapped could be occupied by another thread in between.
> 
> Linux mmap man page recommends keeping the existing mappings in place to
> reserve the place and instead utilize the fact that the next mmap operation
> with MAP_FIXED flag passed will implicitly destroy the existing mappings
> behind the chosen address. This behavior is guaranteed by POSIX / BSD and
> therefore is portable.
> 
> Note that it wouldn't make the replacement atomic for parallel accesses to
> the replaced region - those might still fail with SIGBUS due to
> xenforeignmemory_map not being atomic. So we're still not expecting those.
> 
> Tested-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index 5b120ed..e82b7dc 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -171,7 +171,20 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>           if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
>               ram_block_notify_remove(entry->vaddr_base, entry->size);
>           }
> -        if (munmap(entry->vaddr_base, entry->size) != 0) {
> +
> +        /*
> +         * If an entry is being replaced by another mapping and we're using
> +         * MAP_FIXED flag for it - there is possibility of a race for vaddr
> +         * address with another thread doing an mmap call itself
> +         * (see man 2 mmap). To avoid that we skip explicit unmapping here
> +         * and allow the kernel to destroy the previous mappings by replacing
> +         * them in mmap call later.
> +         *
> +         * Non-identical replacements are not allowed therefore.
> +         */
> +        assert(!vaddr || (entry->vaddr_base == vaddr && entry->size == size));
> +
> +        if (!vaddr && munmap(entry->vaddr_base, entry->size) != 0) {
>               perror("unmap fails");
>               exit(-1);
>           }
> 


