Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C2FB2DCB5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087427.1445478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoi60-0006g7-Cn; Wed, 20 Aug 2025 12:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087427.1445478; Wed, 20 Aug 2025 12:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoi60-0006ed-A6; Wed, 20 Aug 2025 12:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1087427;
 Wed, 20 Aug 2025 12:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P/AY=3A=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoi5y-0006eH-RZ
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:39:14 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa84ea9c-7dc2-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 14:39:08 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55ce5243f6dso7113465e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 05:39:08 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3516easm2620576e87.18.2025.08.20.05.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:39:07 -0700 (PDT)
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
X-Inumbo-ID: aa84ea9c-7dc2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755693548; x=1756298348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9l1r2v4WJhhYxl0b5jXV+TG8bdnbPnaG0WeVU2aT9s=;
        b=j7Hfiv5d4XB6+jK7qNX4qf8OWnXG2kqkmAn3pw1SyeEBDHwoVYGxSSSQluok/Tinz3
         FNE1jtWG/GXnnpo/scUC+BCom5zeiPxNoRrjs97loQu6VKH+EA4MMUJv/hAcvzy4Gl/S
         +jnoaalYjlOUjWfeOANe8vq/uZ2/WkxNKzBDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755693548; x=1756298348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9l1r2v4WJhhYxl0b5jXV+TG8bdnbPnaG0WeVU2aT9s=;
        b=PTX/HR0r6dXvb4Z4IgAtp6RsDrnOxQlfB7PW1dDcFUj0bwANq7/1Kz83rEINxQ4ZPX
         E8SxbxWvbMBZUy6TQBNzpHUBBQ35+aUiktTvL/kc5OsJfqDzCrPPlChdgejf83zw0l8m
         2XeydnHY57sO8i9xg1Ri107RMjlHFYLSH9mcpeLQCEwEu4tiuh2BLkMNV/xh7xT4ITkA
         GVFG5ct9heBIIEEU//gY19a+XW6eJ9qhVfO7Z7J7hMPy/wKtoz/5Tv5pQMYkCeyWXe+M
         iRr4X1xmVW6TrZOWHvy4aQBJPCxMcGz97SWPaTn2/TWRDcMFyForxQ6or988prXb4aLE
         ktSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIX7AoxtEarQSAWFwJ9bpBjVskIpGma3H/X9Ygg6xFGnAquAINDVNBmAlfxKa8P8sqQrujgmwUzpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg6G40mDPOXzhXVoxhhwchBr5gvszl9aSL+vIr4ZRWvBiuuaYd
	6ubRYzwf+ofzzOsc6UK+fzuzCswKydp1JMME/yb1pD1XQEu+wr5N/lHACTv+TEc7Dok6xsRotOv
	hIgF1
X-Gm-Gg: ASbGncstO6zRcFxRMU9zTZzgCjm865ZbOAih5K75SG/hKhpp+mjQl6lRMyduiV2LDmV
	XR7nPL/n8pTHF+IwHyNk9iWptm6+1V2tja3h8EYZ7oHhrjHQoO5PEor52dEOEZcUUK5qeBSDW93
	ZEnqiXUruPhLDLG5iOiVNuX4fU1JfdOBaW+PgbUdLBTbluWMHIm5BBJJpPRbYh/55unpopAzMIg
	WVMyyT2i56ShXm4t+PZWKxcJG/5iRObp82p1T9Zm7Tb3Dr/YTV3ylSwfPgOjd53+hxzGKRXmGR2
	uX6icREQh0IVdVPqzBoNI9ppNIHtaTr1LZ9L93B/bmgS2UX/z1pw+I5TTOcIZTAUSSILc17SM+W
	PXzirYTlPEVmqNckA/buxMnkhkQUqBfpWaSn5Y0pR2w7xkS+nz3cu6iABP7sK0TeLhVYY
X-Google-Smtp-Source: AGHT+IH068zN2b5rHQ5SDXKJrrCpVHqXKLGyhEdH6SNnbg3ERPdfFkdGrerrZJe9K0Mrc41DVNR1+g==
X-Received: by 2002:a05:6512:8a:b0:55b:8205:b21f with SMTP id 2adb3069b0e04-55e06b3ed66mr638460e87.19.1755693548028;
        Wed, 20 Aug 2025 05:39:08 -0700 (PDT)
Message-ID: <29aa715a-f70e-4cb8-8708-dda4d9fb4d0b@citrix.com>
Date: Wed, 20 Aug 2025 13:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] tools: add sizeof_field and offsetof_end macros
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1753869323.git.w1benny@gmail.com>
 <8cfd773bd5cc9ecac25a4a92104483f07021c991.1753869323.git.w1benny@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8cfd773bd5cc9ecac25a4a92104483f07021c991.1753869323.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2025 10:56 am, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
>
> * `sizeof_field` returns the size of a specific struct member
> * `offsetof_end` returns the offset to the end of the member within the struct
>
> It will be useful in upcoming layout checks of SMBIOS structs.
>
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> ---
>  tools/include/xen-tools/common-macros.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
> index 0088208c2e..3899e06753 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -83,6 +83,11 @@
>  #define __packed __attribute__((__packed__))
>  #endif
>  
> +#define sizeof_field(type, member) sizeof(((type *)NULL)->member)
> +
> +#define offsetof_end(type, member) \
> +    (offsetof(type, member) + sizeof_field(type, member))

In Xen, we have this called endof_field()  (although I realise doing
this post-dated your patch).

Please could you adjust, and send out a full series.  I see there were
some minor changes needed in patch 2.

Also, please add a final patch which adds to CHANGELOG.md in the root
directly.  You want a bullet point under Added/x86 about this.

~Andrew

