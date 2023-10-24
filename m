Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92537D53CA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622023.969091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIGX-0001CO-9s; Tue, 24 Oct 2023 14:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622023.969091; Tue, 24 Oct 2023 14:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIGX-0001Ai-63; Tue, 24 Oct 2023 14:20:17 +0000
Received: by outflank-mailman (input) for mailman id 622023;
 Tue, 24 Oct 2023 14:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvIGW-0001Ac-4Y
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:20:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7344d08c-7278-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:20:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso33694515e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 07:20:15 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b00401b242e2e6sm17039468wmq.47.2023.10.24.07.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 07:20:13 -0700 (PDT)
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
X-Inumbo-ID: 7344d08c-7278-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698157214; x=1698762014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/RTcnvN+s3qfbGL8IxZ3YpZboBFi25HRb3Ev7DIpus=;
        b=evl0seWU5DQFDBEwOB+grsPcjrpcRwgSYth4JtHHKApnkHwAmE5cxv6YL140ELukgI
         TAIdzOm/OqATCt9ZhTi/dATUqZE5+d+NiF/3yvzinB2gUPv9OpAonGPmE8bbgXC73Mz3
         exeZU3SHJVcXQFkYXyt4sff2KYLZ2mPYKinWtmTmwiqRaOQ8M8VQDQdbllq8fC5vxqmE
         dZMeM0xp0X11rwvkERAYdvrrGv1c23gATaRDu3yjIYHsc+ge9qgbfjsI4cuzEKgyeYtF
         AM6G9pFXbkYW3S2G1MqsB2M7yj/fYP6E/jqMdkRj1BAvfUDvECepQB4r1rM0t2z3bCrx
         sp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157214; x=1698762014;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/RTcnvN+s3qfbGL8IxZ3YpZboBFi25HRb3Ev7DIpus=;
        b=lXKrcWHH7wHNrfHu61PeZx67qi2qvvqkOejoARthEKQPHHBRwIq86G5OwJBJypEbEw
         edptlE/s9jzWOortO8dvWk7rzjcpyq/4YACeexbsAbXVHvp7CO4EOnWN8EdCKXI9IJc+
         SFLbKlzd3HEx9ow8gNo/hOY9KCUG9e3zkoHJtO/3Wd3eHPd5FHF0dfU1UJYQZg6aeJu1
         xGlVm3XTLwNKfTVwyPI8UHKT5p1WQZHfw024Pe+8iegB3s44w53X98Xlq5pXPOSNVwK/
         EmY3lBcJCOmNEwRdXmBgjzI3FHmd30VsZtYZ478eRTRpbQw5O6mkKNHsftA+bU7b7B4p
         hv/A==
X-Gm-Message-State: AOJu0YzE4tj2PeL9gcBZqDD2n5/pLByBSKG95qPippmxOyZgJEx6Hbb7
	ViE1yjFpsr5X/M2aZOOSMnc=
X-Google-Smtp-Source: AGHT+IEyITPkgMCMhYLgEPjPPOpjFI74iF5+LpLQdanMOxh59eFvYc4PmD1+hbF9zetlTx+c01olxg==
X-Received: by 2002:a05:600c:5254:b0:405:2d23:16d9 with SMTP id fc20-20020a05600c525400b004052d2316d9mr9323630wmb.21.1698157214277;
        Tue, 24 Oct 2023 07:20:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c18439ca-c9ae-4567-bbcf-dffe6f7b72e3@xen.org>
Date: Tue, 24 Oct 2023 15:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 12/12] hw/xen: add support for Xen primary console in
 emulated mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-13-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The primary console is special because the toolstack maps a page at a
> fixed GFN and also allocates the guest-side event channel. Add support
> for that in emulated mode, so that we can have a primary console.
> 
> Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
> supports literally nothing except a single-page mapping of the console
> page. This might as well have been a hack in the xen_console driver, but
> this way at least the special-casing is kept within the Xen emulation
> code, and it gives us a hook for a more complete implementation if/when
> we ever do need one.
> 
Why can't you map the console page via the grant table like the xenstore 
page?

   Paul


