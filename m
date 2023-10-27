Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F177D8FAB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624246.972658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHBT-0005Pj-Vr; Fri, 27 Oct 2023 07:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624246.972658; Fri, 27 Oct 2023 07:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHBT-0005N6-So; Fri, 27 Oct 2023 07:23:07 +0000
Received: by outflank-mailman (input) for mailman id 624246;
 Fri, 27 Oct 2023 07:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwHBS-0004No-I7
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:23:06 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abf8da1a-7499-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 09:23:06 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32f70391608so178123f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:23:06 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfef90000000b0032326908972sm1126352wro.17.2023.10.27.00.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:23:05 -0700 (PDT)
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
X-Inumbo-ID: abf8da1a-7499-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391385; x=1698996185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dSCOMydOnsCaHq17QXAhhoXbOK1DobHQBIwwTw48NnM=;
        b=mJ0BCAk0kTO8rgU+SAk0qQY059MTKnq6nXm2RFdpQRkJ6BNh1/VoST2ujkdSIiBlFR
         a+HprhDnjW6n4jXhtASg4sbp8s+tp8LrwpP9DUlb0IJR0X9m2MKVLz058LRMNxViNae4
         UWOxnrTTYrNXh3kz5YmFOXqyyFLzgt0Di9cMowepL2MK6ijsjiZKjaI1h3aDny2cE81a
         d3CMDxukK5KEsZKiz4yhY/vqYU8ab6RyPUKAzOh+TxBh0USRktUUQto2WJt4XbaV1CPi
         QVAR5B9ShFnZAH9Dvys607gD88o0zO8K5aYZhSg9uwxLhyz0CIYqi4loTdt3nkvjt0j5
         p7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391385; x=1698996185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSCOMydOnsCaHq17QXAhhoXbOK1DobHQBIwwTw48NnM=;
        b=qWG1YFFUaqiIgrT6F6v/rM7TMyT1JhDgi6nG755xR4PqqZs6c2qi2UXY3BPmHGXOxU
         S22+fAqgyEATUyC6wJu/2x6AbBsEaR/8w3fzKIbTL56XIglSeRFWEIKq4yagsn78NR/B
         8p4eJn9/5GhCXUFvlHQL5eXGUNy5pyCxposDNlT8rcNS8Ew8xzuj7PIpn/OCnR8KEFZS
         Z99rO2vnS+/cc1fxk42wEvwwedhgMOoDV2X2MD/JkIDfat75zE+hiWqj94D+begpXutz
         duFfdQaTqxVzNoTOYsOoxEi3GOlc4qsMVDC8Dje+3N6JffUKwyPJdGu6hvgweYyoyipB
         dMVg==
X-Gm-Message-State: AOJu0YxAV62EqUIgjq7RbZWkZJ/UKd3iqaCtflfb9c03aa96a516wv8j
	StpVQQEBA/yWQTHLSshTudo=
X-Google-Smtp-Source: AGHT+IGcJqs+3Lj5Br/+siV+aN+YMItskE6Hk6MaX+RfvRLeEZhRqSD3XuVFCG4gSuppLBynhA6zLA==
X-Received: by 2002:adf:e992:0:b0:321:6a61:e45a with SMTP id h18-20020adfe992000000b003216a61e45amr1332680wrm.15.1698391385492;
        Fri, 27 Oct 2023 00:23:05 -0700 (PDT)
Message-ID: <65c0d093-e83c-4307-9edb-2b4f04cde607@gmail.com>
Date: Fri, 27 Oct 2023 08:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 08/28] i386/xen: Ignore VCPU_SSHOTTMR_future flag in
 set_singleshot_timer()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-9-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Upstream Xen now ignores this flag¹, since the only guest kernel ever to
> use it was buggy.
> 
> ¹ https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=19c6cbd909
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   target/i386/kvm/xen-emu.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


