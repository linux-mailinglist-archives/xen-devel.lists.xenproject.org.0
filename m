Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B62700C0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 17:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJI76-0006Dh-Cn; Fri, 18 Sep 2020 15:15:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9We=C3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kJI74-0006Dc-Ic
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 15:15:50 +0000
X-Inumbo-ID: a8e330e4-03a5-4e79-9afd-1e1d5f500ce3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8e330e4-03a5-4e79-9afd-1e1d5f500ce3;
 Fri, 18 Sep 2020 15:15:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600442148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W81dPn+S8fj8v8s78jjbRwEETdmqdUupq2xA+xfkuH8=;
 b=TXVw7JylSChK0lxBw2MZZWxSA6lcSBnnEqVh8chEX/jE4FHADfKoxlagHohjeXbNqV7/2B
 amqpB4lOy8SywxjirenVK31wA7tRLvu5iHsQ/WMiW4+K9gotzxgfCVV4hRSjNBdZuZvomd
 VjhnUzu24XphNDhXhaXrbpXDJGf9a34=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BADBBAAC7;
 Fri, 18 Sep 2020 15:16:22 +0000 (UTC)
Subject: Re: [PATCH v5 4/5] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-5-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51b0beda-11bc-a587-d390-63e5613ac309@suse.com>
Date: Fri, 18 Sep 2020 17:15:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917154048.1140580-5-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 17:40, Trammell Hudson wrote:
> @@ -624,6 +626,29 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
>  
> +static bool __init read_section(const EFI_LOADED_IMAGE *image,
> +                                char *const name, struct file *file,
> +                                const char *options)
> +{
> +    /* skip the leading "." in the section name */
> +    union string name_string = { .s = name + 1 };

Instead of forcing the caller to pass in a dot-prefixed name
and you assuming it's a dot here, how about ...

> +    file->ptr = pe_find_section(image->ImageBase, image->ImageSize,
> +                                name, &file->size);

... pe_find_section() looking for '.' followed by <name>?

> +    if ( !file->ptr )
> +        return false;
> +
> +    file->need_to_free = false;
> +
> +    if ( !s2w(&name_string) )
> +        return false;

You shouldn't give the false impression to the caller that the
section was not found, the more that ...

> +    handle_file_info(name_string.w, file, options);
> +    efi_bs->FreePool(name_string.w);

... you really need the transformation solely for producing
output. Just output a static surrogate message instead if this
fails? Of course, for x86'es sake you'd then need to pass the
ASCII string instead, which would save it from doing the
backwards translation, which is its only use of the parameter
(Arm doesn't use it at all).

> @@ -1208,9 +1233,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
>  
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(loaded_image, ".config", &cfg, NULL) )
> +            PrintStr(L"Using unified config file\r\n");

Maybe "embedded" instead of "unified"? The config file isn't unified
after all, it's the Xen binary which is.

Jan

