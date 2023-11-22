Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD907F51AB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639153.996140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tsF-0004wS-LS; Wed, 22 Nov 2023 20:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639153.996140; Wed, 22 Nov 2023 20:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tsF-0004uL-Ht; Wed, 22 Nov 2023 20:31:03 +0000
Received: by outflank-mailman (input) for mailman id 639153;
 Wed, 22 Nov 2023 20:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5tsD-0004uF-Ut
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:31:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ccb5db4-8976-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 21:31:01 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b2a8c7ca9so1118885e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 12:31:01 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 jg28-20020a05600ca01c00b004063cd8105csm525862wmb.22.2023.11.22.12.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 12:31:00 -0800 (PST)
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
X-Inumbo-ID: 0ccb5db4-8976-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700685060; x=1701289860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3L4iceppBlJDY1M1tRK/b6wiq/1ukaRWMlXyD+wqzKE=;
        b=tMmkzCO2Vb7tkM5YH3FA0hxK5iVf0CHzG3qggD2LPGw52gXpVwByoNwBVWuGDO2CP2
         dxl67omYXLMCLRpRpb7kRzqoEEwoRlaKzodJH9bdNGKg3DkOb+4nf4P16DllPETHm4sP
         MEo4XDooQkB3kxOypx5MHeZXrG+usckGapUA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700685060; x=1701289860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3L4iceppBlJDY1M1tRK/b6wiq/1ukaRWMlXyD+wqzKE=;
        b=MP9vZdggonIz3IbfOIG0c4dAKBvDbtLMQfxIbIl/t2xQtDiJ1vnxuJeyDjXiUDSdMG
         yqu4X+qBRzDHY2uFFZ0sw4Cujmc0CcMlTBD0OO5aJ75orNM4CwK6m7bbxy8HFFk3PVMu
         kHHaA6IeOJ76RO+lX7I/3jQ9dEo+vx89U7Tyj1lyns8Vfw7KK6ROxbrNfRbkX3BYo+nX
         WXmHkm5lBsiXaPPkib9YNOys/A3IyeM6t/lAjx/PN/NftZTb2BXK2HbGWAFnELwgBH0K
         b6PFL9mB2tS0UIo6NnXRVi3O3fDNfd6v+bf3O8TeYI4u+ot5PmtLTrgD7wxTUokcTI2e
         QJMQ==
X-Gm-Message-State: AOJu0YzIjdUWldGW8Fbmd5SNcU5BsH4s6+HQ6H5eJYUJuw8aAAtc7LAh
	aUdv/7cJbN5s/8cBTNE7mF1iTA==
X-Google-Smtp-Source: AGHT+IEfWrhUD+0S2uMccNxdmoYPzkbLrlYThFWS8J8UVSmPgkElr+kpaxwQLMMrPFVDgy/RNt05fw==
X-Received: by 2002:a05:600c:4311:b0:404:4b6f:d70d with SMTP id p17-20020a05600c431100b004044b6fd70dmr1115952wme.17.1700685060411;
        Wed, 22 Nov 2023 12:31:00 -0800 (PST)
Message-ID: <b46b276d-4df0-4c28-ba4c-e0147d0b98fd@citrix.com>
Date: Wed, 22 Nov 2023 20:30:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenpvboot: remove as unable to convert to Python 3
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231006145046.98450-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231006145046.98450-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 3:50 pm, Roger Pau Monne wrote:
> The script heavily relies on the urlgrabber python module, which doesn't seem
> to be packaged by all distros, it's missing from newer Debian versions at
> least.
>
> Also the usage of the commands module has been deprecated since Python 2.6, and
> removed in Python 3, so the code would need to be re-written to not rely on
> urlgrabber and the commands modules.
>
> Arguably the purpose of the xenpvnetboot bootloader can also be achieved with
> an isolated script that fetches the kernel and ramdisk before attempting to
> launch the domain, without having to run in libxl context.  There are no xl.cfg
> options consumed by the bootloader apart from the base location and the
> subpaths of the kernel and ramdisk to fetch.
>
> Any interested parties in keeping such functionality are free to submit an
> updated script that works with Python 3.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I've just found
https://build.opensuse.org/package/view_file/openSUSE:Leap:15.5:Update/xen/bin-python3-conversion.patch?expand=1

Which includes the modifications to make this work with Python 3.

Does this mean there are SLES/OpenSUSE users of xenpvboot ?

~Andrew

