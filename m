Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF608FE11C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 10:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736026.1142156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF8cC-0005WS-7M; Thu, 06 Jun 2024 08:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736026.1142156; Thu, 06 Jun 2024 08:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF8cC-0005Tm-4a; Thu, 06 Jun 2024 08:36:56 +0000
Received: by outflank-mailman (input) for mailman id 736026;
 Thu, 06 Jun 2024 08:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PrXz=NI=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sF8cA-0005Tg-IF
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 08:36:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc18d80-23df-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 10:36:53 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so8856205e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 01:36:53 -0700 (PDT)
Received: from [192.168.0.151] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c690dsm13781485e9.34.2024.06.06.01.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 01:36:51 -0700 (PDT)
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
X-Inumbo-ID: ecc18d80-23df-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663012; x=1718267812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzOlTpGXOFDC46rae4mb64yBb7uEDZ0xP/1eKZGmBUw=;
        b=FrxzL4GhLm10bhjOnz/7cvkbWOyzrN5DmuBsLeJaI+Nrp6ZuNPHt076egcBXVrTSZX
         duQif5UbtlfxuUdpt/2M3UCbqZ42CxrN3qIDpGEIeY3MVyzMJSKJ5m3AAwAlMWuCQ8Rn
         /o0Xft/wgaqDtI0IzQXl1oybgrtfLeDXh0Hjb9SVyG+OIaOsoBCBziMO6TUWMAeiB+oN
         jaubWJJ8QWSi4nBHjRUAw/hcw9sOO/664jXJFwYL5+8wsNKx3itF7eyAUt+ah4GAMyq5
         jAk3KCyNKLrd8X91iCaxrnz305Sr6lRZyRmAOuFIcqch3+U6wIin8QKxvXX2PRxQtInv
         n2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663012; x=1718267812;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzOlTpGXOFDC46rae4mb64yBb7uEDZ0xP/1eKZGmBUw=;
        b=kcJe2BjnUdR/NwxZd6EMpOxRIVesGRnFJ/MCH68rhMkjdSHiXQMDRgP6aMonviT8ms
         53aejD0ada75rQxWeHFlNxC7tSIgjl8g59/pQ1xcMfO9EJMksg/jxy+H14hM6A7FT97S
         H6KK7gXl1gj7GAdTKV8SF7oSyYDfKD+8NV4GdLuCsGi9ub29qJ+LYC8toTtsqdG0v0X5
         OAf6PtAKKNag+uK1n5ypfh+E8QHXNKzDeOWMVwMMU8g27Wr7r3H3PmTFaX008UT4oJsy
         zmtgJzs9kS5pb9lJCo+TFOckDPoiFf7hLUVc5O2s1pnoryI7no6lJgAOrRrNeLkS7KRA
         XN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVEzk9pQIue3A9pm5FSB++wWDqE6PGbGgdmYaSwgK6ZI1bCzzJ+HVfiYs5/nZAGG/xAHe2ZdKVx0p3wNQ+wsTJ+u63J2JFmP7zfEM/JeKE=
X-Gm-Message-State: AOJu0YzJ/PXblyi3if1PW55bpUw8eKiPGD+GeVBx/0luNJGXxrO64ad5
	oq0wYpVeZh9zmTRGEJS8iYS5F3wjtNf8XTH0J1WxYxGVtOuocy+P
X-Google-Smtp-Source: AGHT+IGzT54QNK7IhOhsW9oQdhMM/tkMLq7skxG0VwQqxfW7PvYNgJZbnLqz09Ajr4xdIhZI5tb7+w==
X-Received: by 2002:a05:600c:524c:b0:421:4f34:3ada with SMTP id 5b1f17b1804b1-4215632dd1bmr43362575e9.32.1717663012050;
        Thu, 06 Jun 2024 01:36:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <434fea2b-c7e9-42b3-bc1c-27ef811d0027@xen.org>
Date: Thu, 6 Jun 2024 09:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 3/3] ui+display: rename is_buffer_shared() ->
 surface_is_allocated()
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
References: <20240605131444.797896-1-kraxel@redhat.com>
 <20240605131444.797896-4-kraxel@redhat.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240605131444.797896-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/06/2024 14:14, Gerd Hoffmann wrote:
> Boolean return value is reversed, to align with QEMU_ALLOCATED_FLAG, so
> all callers must be adapted.  Also rename share_surface variable in
> vga_draw_graphic() to reduce confusion.
> 
> No functional change.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/ui/surface.h    |  4 ++--
>   hw/display/qxl-render.c |  2 +-
>   hw/display/vga.c        | 20 ++++++++++----------
>   hw/display/xenfb.c      |  5 +++--
>   ui/console.c            |  3 ++-
>   5 files changed, 18 insertions(+), 16 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


