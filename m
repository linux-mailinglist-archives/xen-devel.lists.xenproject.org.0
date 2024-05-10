Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255638C1F6C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 10:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719564.1122368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LGd-0001kD-9M; Fri, 10 May 2024 08:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719564.1122368; Fri, 10 May 2024 08:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LGd-0001hf-5W; Fri, 10 May 2024 08:06:11 +0000
Received: by outflank-mailman (input) for mailman id 719564;
 Fri, 10 May 2024 08:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5LGU-0001dp-Do
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 08:06:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23cfc18e-0ea4-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 10:06:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so420486166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 01:06:01 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c323887sm1565300a12.89.2024.05.10.01.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 01:06:00 -0700 (PDT)
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
X-Inumbo-ID: 23cfc18e-0ea4-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715328360; x=1715933160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjUmBYZRcJLqI6YjjRBHpniyNELY4eAJBJMOmGd2QSI=;
        b=FQVCUruW5XjuZhzc9HBuCv8fpBfUU/7vioAvsqoTV7EVPBa0pEd/sj0lTG8i7eBX1I
         t+6mv2Yk6xeX3NHzAj8KVellYx3bmcoj5UvVVHIQWxVR5rmlIIMzTfYttVo69r1G9Aym
         RQt/ix2J47o4vyTIBioTKiVL6hz4kCShytd/w0pKXifjLGEJFEvY8UQp8T3t4CiialNV
         UK93REUmJSsszibM1ZVSi8kdllWxaE2k+x2a1IzqdC0tEyxU4cn8Q0GcVbd1DhywAe7m
         NqMD9x+G5UoXmxQ3++1Sigxegoa19cYkV62fp2tNI5Io0Tne9RRzlunBwPEGONPjD06l
         +0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715328360; x=1715933160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjUmBYZRcJLqI6YjjRBHpniyNELY4eAJBJMOmGd2QSI=;
        b=VrfZhBls5BINFPzkKH5OtXfVEAPTonjpMqMDEHhKcD6uVTFUFZgEj9fMT6/KrNCzwu
         KMqariFcd2RvVcOIovWkQNX9W7kqXc2j+D0UoXwK/2m4S4Vsna/E1qdwKB1KHKy3DjMX
         7O6csXUyjgdKnHyYpQZQENS1azXRmtqNYFluS/BsXMaxrNaWomvwINQMtfzp6jdxbtxF
         U3CyUDr6D2nuON7gM5RvDY7/AH7hZdWpFPg/nRgdcmEj1iqAUPAmylIu2aksXkkd+Mga
         TZyzCrBnGI9URfA7DaJ2bNy9HSYwsPJE4/H6UJHmbtqYMZu3ccoPK5QJhx35oKF5/gHX
         NlgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrK6kAvZ+aPtaXrPiMoROcs0HuxTrIXb85JepNP/1mqr1uo77RubydXyV7IP5DOkE2wCEAXDkjyUhfltcBQCB7Q7eIgDEKeUkSQ2Qbzjc=
X-Gm-Message-State: AOJu0YxHfl21ab5LldQ6eUFvHX8Hqtpj2gc7U0NNvqNWIrtphHGkQCV+
	S6q+RquVhQA5NKnE9oNJz4pExNA0TfRQeUWQUpLopMoPXlOPtmrTq/Hec7882dQ=
X-Google-Smtp-Source: AGHT+IGob/d3TfUjBbghLynpjknZOHPeymBsHMDPCDMq2sreJOIGOkoi5rR8z3BhZwdrEdxSurL+dw==
X-Received: by 2002:a50:8a8c:0:b0:572:46db:8fa with SMTP id 4fb4d7f45d1cf-5734d67ea8emr1323463a12.33.1715328360588;
        Fri, 10 May 2024 01:06:00 -0700 (PDT)
Message-ID: <c978ac2b-0529-4bd8-a493-55e806740808@suse.com>
Date: Fri, 10 May 2024 10:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: Fix handling XenStore errors in device creation
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <84a6e6376ab9f5aafac8f33bf772d73fcfd0d818.1713998669.git.demi@invisiblethingslab.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <84a6e6376ab9f5aafac8f33bf772d73fcfd0d818.1713998669.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.24 04:17, Demi Marie Obenour wrote:
> If xenstored runs out of memory it is possible for it to fail operations
> that should succeed.  libxl wasn't robust against this, and could fail
> to ensure that the TTY path of a non-initial console was created and
> read-only for guests.  This doesn't qualify for an XSA because guests
> should not be able to run xenstored out of memory, but it still needs to
> be fixed.
> 
> Add the missing error checks to ensure that all errors are properly
> handled and that at no point can a guest make the TTY path of its
> frontend directory writable.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Apart from one nit below:

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
>   tools/libs/light/libxl_console.c | 10 ++---
>   tools/libs/light/libxl_device.c  | 72 ++++++++++++++++++++------------
>   tools/libs/light/libxl_xshelp.c  | 13 ++++--
>   3 files changed, 59 insertions(+), 36 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index cd7412a3272a2faf4b9dab0ef4dd077e55472546..adf82aa844a4f4989111bfc8a94af18ad8e114f1 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -351,11 +351,10 @@ int libxl__device_console_add(libxl__gc *gc, uint32_t domid,
>           flexarray_append(front, "protocol");
>           flexarray_append(front, LIBXL_XENCONSOLE_PROTOCOL);
>       }
> -    libxl__device_generic_add(gc, XBT_NULL, device,
> -                              libxl__xs_kvs_of_flexarray(gc, back),
> -                              libxl__xs_kvs_of_flexarray(gc, front),
> -                              libxl__xs_kvs_of_flexarray(gc, ro_front));
> -    rc = 0;
> +    rc = libxl__device_generic_add(gc, XBT_NULL, device,
> +                                   libxl__xs_kvs_of_flexarray(gc, back),
> +                                   libxl__xs_kvs_of_flexarray(gc, front),
> +                                   libxl__xs_kvs_of_flexarray(gc, ro_front));
>   out:
>       return rc;
>   }
> @@ -665,6 +664,7 @@ int libxl_device_channel_getinfo(libxl_ctx *ctx, uint32_t domid,
>                 */
>                if (!val) val = "/NO-SUCH-PATH";
>                channelinfo->u.pty.path = strdup(val);
> +             if (channelinfo->u.pty.path == NULL) abort();

Even with the bad example 2 lines up, please put the "abort();" into a
line of its own.


Juergen

