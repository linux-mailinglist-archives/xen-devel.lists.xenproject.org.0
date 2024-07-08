Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C192A597
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 17:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755501.1163879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqFs-000623-4K; Mon, 08 Jul 2024 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755501.1163879; Mon, 08 Jul 2024 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqFs-0005z5-10; Mon, 08 Jul 2024 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 755501;
 Mon, 08 Jul 2024 15:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sQqFq-0005yz-JW
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 15:26:14 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69270859-3d3e-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 17:26:13 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso4860140e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 08:26:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6dc55asm3691866b.50.2024.07.08.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 08:26:12 -0700 (PDT)
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
X-Inumbo-ID: 69270859-3d3e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720452373; x=1721057173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAnfqi2cra/5r9skPbe4FgfCluiThPs3tUmMhe5MyKM=;
        b=HFBddgT9pDQhRlinJaUZqmzdeAehzDvRHdi0BgIiT+b4nNQQwqZ2AC2GWhkwm5n7sB
         ClB7l/ZzCeiurxGBCwZCK16DXFB6cJr/WbJQ3Wt/NVN5qQ6RUNHw1cv/Q1cAL5AzAi8v
         tpXHijanS8JjXxQ1Ym77ttP7+plIMFXEsAxCogI8I+NYfRdDwv13TlbOhSCGQKFe6Eho
         ARt1pFze9EXoFgub+yl8MZ5pUSXZV+8BNsasOkqyu/gamXnSVhMIZy2GwdSrRqmTJDQ3
         sPxGEJUhg40tTFdFD8ZquFt+cq0bLvp2DlKGsqIYxnIwEtF06zgfmD3662yhmv4Ca2FM
         BxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452373; x=1721057173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAnfqi2cra/5r9skPbe4FgfCluiThPs3tUmMhe5MyKM=;
        b=XyarYK15qamom2Iw0zfdGnNhffqjbU37hZQPXOYJMwpHa3JiSlixc/kATuefgkE7Yu
         tbBLujNWUwDfDaiiHTxnjGxv4Deol7xxiQQD70IK0H9gcq2ASgjskOxjT9HM64/jpIkZ
         G1paSWt7HJYZvdJNDNl0L9Oswbo7ZdV3zzcTO3WLNTBzN+oaFz0qdpdap9Yn5L4zY51x
         iRgr7WAWpzwie+SNkX7H6TbfAt1E5qLpUnw0G9wmIKSEQeMHOgGMThLSEUteZYrm+kCu
         MiRmUq/f0h/XFzgke0n0iUWFPqoQq7qQF9xceySzSsUJdEjhjk5JN/36jwcIB331dUa8
         7HBw==
X-Forwarded-Encrypted: i=1; AJvYcCV69dhpalWQNjZQvT/yLxQsBE/waaIIwxwyoqHtuGl7jm4RrcsNLtJL90sOsSyZaL0MGg+rEeUueXmvP+IYv/89CNzjBh1QjylXhJ2w0e0=
X-Gm-Message-State: AOJu0YyiSvshLlNIzoJAN0BqZEfhD1p77UuTUA9FrPaqhwZHpVNGsi6J
	SH3r6enTBkPOLEUYrMtw1V3O6oeYliss8V7JIUyDArUmxkqPSsascVhGbOhCAsI=
X-Google-Smtp-Source: AGHT+IGl87z+WsFqE3Kjuw0OIOd84dS+R6fPXBjw1LaNur/plN6juqSsNRuCF5WzkCCumDzhzaHpfA==
X-Received: by 2002:ac2:59cd:0:b0:52c:892e:2b26 with SMTP id 2adb3069b0e04-52ea061f5fcmr7213897e87.2.1720452372775;
        Mon, 08 Jul 2024 08:26:12 -0700 (PDT)
Message-ID: <23f8b3a5-67ed-4a84-af70-600337677e33@suse.com>
Date: Mon, 8 Jul 2024 17:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/libxs: Fix fcntl() invocation in
 set_cloexec()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <JBeulich@suse.com>
References: <20240708151522.2176290-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240708151522.2176290-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.07.24 17:15, Andrew Cooper wrote:
> set_cloexec() had a bit too much copy&pate from setnonblock(), and
> insufficient testing on ancient versions of Linux...
> 
> As written (emulating ancient linux by undef'ing O_CLOEXEC), strace shows:
> 
>    open("/dev/xen/xenbus", O_RDWR)         = 3
>    fcntl(3, F_GETFL)                       = 0x8002 (flags O_RDWR|O_LARGEFILE)
>    fcntl(3, 0x8003 /* F_??? */, 0x7ffe4a771d90) = -1 EINVAL (Invalid argument)
>    close(3)                                = 0
> 
> which is obviously nonsense.
> 
> Switch F_GETFL -> F_GETFD, and fix the second invocation to use F_SETFD.  With
> this, strace is rather happer:
> 
>    open("/dev/xen/xenbus", O_RDWR)         = 3
>    fcntl(3, F_GETFD)                       = 0
>    fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
> 
> Fixes: bf7c1464706a ("tools/libxs: Fix CLOEXEC handling in get_dev()")
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


