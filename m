Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88991DB07
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 11:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751409.1159369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCwF-0003Rz-9u; Mon, 01 Jul 2024 09:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751409.1159369; Mon, 01 Jul 2024 09:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCwF-0003QD-7B; Mon, 01 Jul 2024 09:03:07 +0000
Received: by outflank-mailman (input) for mailman id 751409;
 Mon, 01 Jul 2024 09:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VC/5=OB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sOCwE-0003Q7-0X
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 09:03:06 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1e47f0-3788-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 11:03:05 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d251b5fccso3150703a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 02:03:05 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614f3d51asm4142782a12.81.2024.07.01.02.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 02:03:04 -0700 (PDT)
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
X-Inumbo-ID: ba1e47f0-3788-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719824584; x=1720429384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9hrnj3X9YJ6RmYhA9fCWShdvWHdojozvuAsN8WzM0E=;
        b=YRdwBItOWkRhOrh7HuAHEsZs6uUw+gvCsZfQwW1ZXVbeG91KLXKPX4WMNBgfp6vHIF
         KbhSyPa4r+V85VGjfm26EBSsqwfPa5EK0A/IsU1jdtgtC0CElCqTcq5S/tVbyrseRA6V
         Z94+1RQFKe4Kxdea1rXJko/kV4XMef6DycFYrFXdk6g4lFQ7YYAtnq96ZOLEX9K80L7o
         zM8EeVdE/L7CIW3uG82NOaMxKnx7HLoXtOZ0YyJ6OVHd+vvdjNarI3qqItxVkS+E6PcY
         eIk27hQqO/tWJuBIHM2kiK2xQRGweAjMYr5SHPndYUZSBN/H2oy+QOmPp25Mf5KoW3z5
         DOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824584; x=1720429384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9hrnj3X9YJ6RmYhA9fCWShdvWHdojozvuAsN8WzM0E=;
        b=bJT0pGR976BGV1I6Y5fqfzkUQd5CPjDCZ81He88FbFlpwZ6Ef9x+3uZgziijqHxiGM
         aeVPQZbOgJ558tZ6q4nbhC0tOdu+XAzMviH1pH3xwpzgWpSQCEWZel5ImB1TVqphdyZf
         fDbE4KpLgXwkb0ZNPQUx4DSst0crUXwBYuR3nKfKC6fo70mYT+rHIqOHFjADf2KUnws1
         yudL0vqtZkVZMfQlSo029XVuqvF8fm5lwVxQROIVyySltbDexeFutxl3vVu9jMl3iBnc
         i89/OM3klcICnuVYullIBcg4tTgYGLK1YIT6uZtQItdhOZXs1TyLcvsyR2TKiSsew5Vl
         x2kw==
X-Forwarded-Encrypted: i=1; AJvYcCXBsj8BJn4HePRFJek/Exfq0SILvbmaLh5Ia9YmhpeSrDmezHMWhGG77IaWyYhC8XW3dh0udvGm9xjmNQi+Ri5DVtyYh765kaPXdiwFVcg=
X-Gm-Message-State: AOJu0YxDtPqhVxTLq/LE2hGbr1sNGMmzeSi/1veRfNS+pZTNlygHxWWm
	jRZO0C/5r+AmeBu5XLuUirenBgwhTpAT2aj0IkR2P59x0zdpi75WMZbCCfUjXyU=
X-Google-Smtp-Source: AGHT+IFqs1SsnE/tipEeOkAm9Nw8ZWlueCc6NO5iG3s0jWfyz+g1vTBgr7kdvT8fvOcPjj6sg2rOTQ==
X-Received: by 2002:a05:6402:1941:b0:57d:456:e838 with SMTP id 4fb4d7f45d1cf-587a0b037ebmr3425835a12.31.1719824584377;
        Mon, 01 Jul 2024 02:03:04 -0700 (PDT)
Message-ID: <db3b0608-6ca6-4fbd-a56d-343ba480e86c@suse.com>
Date: Mon, 1 Jul 2024 11:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?) 0/3] tools/libxs: More CLOEXEC fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.06.24 16:31, Andrew Cooper wrote:
> More fixes to CLOEXEC handling in libxenstore.  For 4.19, because the first
> attempt to fix this wasn't complete.
> 
> libxl is far worse, but I don't have time to get started on that mess.
> 
> Andrew Cooper (3):
>    tools/libxs: Fix CLOEXEC handling in get_dev()
>    tools/libxs: Fix CLOEXEC handling in get_socket()
>    tools/libxs: Fix CLOEXEC handling in xs_fileno()
> 
>   tools/config.h.in     |  3 ++
>   tools/configure       | 12 ++++++++
>   tools/configure.ac    |  2 ++
>   tools/libs/store/xs.c | 68 ++++++++++++++++++++++++++++++++++---------
>   4 files changed, 72 insertions(+), 13 deletions(-)
> 

For the series:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

