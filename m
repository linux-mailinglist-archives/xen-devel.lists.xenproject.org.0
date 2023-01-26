Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A852E67D382
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 18:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485170.752187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6NM-0002rx-8d; Thu, 26 Jan 2023 17:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485170.752187; Thu, 26 Jan 2023 17:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6NM-0002q9-60; Thu, 26 Jan 2023 17:49:28 +0000
Received: by outflank-mailman (input) for mailman id 485170;
 Thu, 26 Jan 2023 17:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pL6NK-0002q3-LP
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 17:49:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c575218e-9da1-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 18:49:25 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id q8so1662603wmo.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 09:49:24 -0800 (PST)
Received: from [192.168.16.153] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 iz17-20020a05600c555100b003db07420d14sm2065074wmb.39.2023.01.26.09.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 09:49:23 -0800 (PST)
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
X-Inumbo-ID: c575218e-9da1-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK8D8R+tAQUoFtCWzoU1n8SQdUbAKXNoKJvtArjQYWo=;
        b=fsrSpnrqMY978vETifGGB5jJhFgGa9z1kwcWK6T2nOCu+2w+3q003EfrS2S3nto/9O
         lxe3tYcU8G4mfiFeNDwyeOtZ6IpN6OGNe5mvX2oCYaolr2h2fKwfDb+bxz95DcEGZcgt
         baW9SuyDs+IEAs4Fczqco/bSDXCuXJ9zw8fBxPmw1fsMHyYS/OnDg/d4M0REeUbUPJvJ
         RQv6LwyWhdbAqU2ztQFsLdrlFMGtDLdvlO64WYfr1H45JdhGSnTHa0NWmRYX1GMcLOq5
         lgctRAthj0M2xFVSiOFnZZWIfgJNNw6o+vkIeVJ+9yWcTvOSRYMwMeFWYUlgDljKCXEG
         ExkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK8D8R+tAQUoFtCWzoU1n8SQdUbAKXNoKJvtArjQYWo=;
        b=tYpBlRY33xSJenDPb3hlqVO868Xecr7i7h0mMR0sPv4esnzAfEZE4bDq2wka3SvRNA
         tXAPRfavCTcFUenLb8Xe7Bnxi4Vp3wp7zGVzb6qmqCjd7/ew3Ne90m23dr/GyiebSWIw
         rRJ6cjkDpf6Z/ct+XyaqGYzRoZLYJvuEKjR8uZaV6w2O405ytmBzcG/Rua2oS+FTHJmi
         AA0BRHQ0UG0GpMtDdAkYzOHFPLWHQ7NshrIIxIRV7CkZlIQnZZsHjw6hyINyr0jQ7cgc
         5Z22hpgL6Y69IJEeWmyynbjF/HDUuji++f7I8pUi62EFHhD1dXd0qb14IE6KuBtKGrQk
         Wvgw==
X-Gm-Message-State: AFqh2kpD0EDjORh43OdWZ49kouQ9Z2bwyFH5NeCYH9lIhQv2lc3oaG8a
	ir5IEH8OOoxsToJA0z3tXKU=
X-Google-Smtp-Source: AMrXdXs5F4OCgvN3uEJ60IUaqKqHzXV14E3jUKorb3s+0tE+r6nmGLv0K7Ivj0ZpjpxRkHHOTPAUPQ==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id d8-20020a05600c3ac800b003da270bba6bmr37704210wms.41.1674755364280;
        Thu, 26 Jan 2023 09:49:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <46ea1f4e-2061-d5f8-2b44-5d24a3a3e7ca@xen.org>
Date: Thu, 26 Jan 2023 17:49:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [SeaBIOS PATCH] xen: require Xen info structure at 0x1000 to
 detect Xen
To: David Woodhouse <dwmw2@infradead.org>, seabios <seabios@seabios.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/01/2023 11:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.
> 
> Untested on actual Xen but ObviouslyCorrect™.

Works for me...

Tested-by: Paul Durrant <paul@xen.org>

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   src/fw/xen.c | 45 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 32 insertions(+), 13 deletions(-)
> 

Also...

Reviewed-by: Paul Durrant <paul@xen.org>


