Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E586D803780
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647080.1009785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAHM-0000q4-Fo; Mon, 04 Dec 2023 14:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647080.1009785; Mon, 04 Dec 2023 14:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAHM-0000oN-B9; Mon, 04 Dec 2023 14:50:36 +0000
Received: by outflank-mailman (input) for mailman id 647080;
 Mon, 04 Dec 2023 14:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEKU=HP=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rAAHK-0007Vk-KT
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:50:34 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b05037-92b4-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:50:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso16687645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:50:33 -0800 (PST)
Received: from [192.168.17.187] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b0040b501ddd34sm18955384wmq.48.2023.12.04.06.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 06:50:31 -0800 (PST)
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
X-Inumbo-ID: 79b05037-92b4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701701432; x=1702306232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuFxYfCQgGqyDlmipQJ9xAOvctGkAf1KGLHtYl2aWIs=;
        b=FtnUgNWPKW1/F5nqM7rpr4ilbEbzG5R50YIar3XqiGa9asQC/6/8q3VSO9EOJrPCaI
         oyRDypaIl/zrNPJKf6ZMy2aWtNhoq61wN9hwHKOrJ9XLL7jyBWXR0naw7nQBVuy4V8ky
         8Na6T1EgAvrxwOG7vcMAHeAR3RK5EqzQ4Zb3gIQLoov96UqcgA59Wtc+ZIHaq3Prs01T
         I6ZL1weeHAKpSPAZr+ziNT7U5FUE41YzScVuo0io/wNB+FXAvQYhdxJ3eKZPLt2Mpfm3
         J6tPayvy5Pww8FioAawjR5y59KN2M9mK5X/N7YKEOFyFUiIbwEMXNMco898cnNEkknjH
         i3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701432; x=1702306232;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuFxYfCQgGqyDlmipQJ9xAOvctGkAf1KGLHtYl2aWIs=;
        b=EmnyJ+d2V4VZHxhkeHiiUT1DHxmh0NCcogt5vpV6yEEBsdC+3XxD358DzW9v1Ld17R
         N9U9rpu8iQquLePMWdZ4bCaaOSbBIWkOWw1PvanQAiR2EOx9sAt4MRI/2QNdc7//Djdo
         apgSSE5QsRL2JxZeP1pe/8EnTSNKeKV2XlFItSHa+k0atyTq6W2w4sEYyUbybmSq9u6E
         8suLSRDanbsA/o9Va0UX+xKhda5TeLcS3NW7Y4oOph86X7/ydKvLJgp33jucnSfY+u71
         eRuKvbazbz8VJPXw4ihtgr/hTTG+NzBw05PC51BMF25xc83knsjzbmSvvEbAW0dEG+Hr
         sIVQ==
X-Gm-Message-State: AOJu0Yy9o+dNkLXlKkVd5agAlCsPMUQ4/VPp4jH/umMUzWu5sxHtotbk
	Dyqx02i5AMBL3QZYxhf6IMA=
X-Google-Smtp-Source: AGHT+IF21sWOb6KsB5O/DUFH/HjWdwEv6jhyxSjG9c7CR7UGAYutJWZUg8JZwLoPIYHj8tpXXVAIfA==
X-Received: by 2002:a05:600c:acd:b0:40b:38a8:6c65 with SMTP id c13-20020a05600c0acd00b0040b38a86c65mr1942181wmr.26.1701701432222;
        Mon, 04 Dec 2023 06:50:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <07817159-7516-44e8-aee0-f3f6330b2b6f@xen.org>
Date: Mon, 4 Dec 2023 14:50:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v4 3/6] xen: decouple generic xen code from legacy
 backends codebase
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
 <20231202014108.2017803-4-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231202014108.2017803-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2023 01:41, Volodymyr Babchuk wrote:
> In xen-all.c there are unneeded dependencies on xen-legacy-backend.c:
> 
>   - xen_init() uses xen_pv_printf() to report errors, but it does not
>   provide a pointer to the struct XenLegacyDevice, so it is kind of
>   useless, we can use standard error_report() instead.
> 
>   - xen-all.c has function xenstore_record_dm_state() which uses global
>   variable "xenstore" defined and initialized in xen-legacy-backend.c
>   It is used exactly once, so we can just open a new connection to the
>   xenstore, update DM state and close connection back.
> 
> Those two changes allows us to remove xen-legacy-backend.c at all,
> what should be done in the future anyways. But right now this patch
> moves us one step close to have QEMU build without legacy Xen
> backends.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> In v4:
> 
>   - New in v4, previous was part of "xen: add option to disable legacy
>   backends"
>   - Do not move xenstore global variable from xen-legacy-backend.c,
>     instead use a local variable.
> ---
>   accel/xen/xen-all.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


