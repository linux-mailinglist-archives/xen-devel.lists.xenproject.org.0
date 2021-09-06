Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332840168C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 08:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179360.325621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN8Qw-00021r-DE; Mon, 06 Sep 2021 06:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179360.325621; Mon, 06 Sep 2021 06:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN8Qw-0001ye-9J; Mon, 06 Sep 2021 06:48:46 +0000
Received: by outflank-mailman (input) for mailman id 179360;
 Mon, 06 Sep 2021 06:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NW6E=N4=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mN8Qu-0001yY-DL
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 06:48:44 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71175502-8074-44d1-8cfb-976cad8ddc83;
 Mon, 06 Sep 2021 06:48:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n39so2055687wms.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Sep 2021 23:48:43 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:f581:5504:73aa:6d39?
 ([2a00:23c5:5785:9a01:f581:5504:73aa:6d39])
 by smtp.gmail.com with ESMTPSA id k16sm6930834wrh.24.2021.09.05.23.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 23:48:42 -0700 (PDT)
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
X-Inumbo-ID: 71175502-8074-44d1-8cfb-976cad8ddc83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d2q96vSBWYolsynVYZ8qCx75g4juhICH/4ouPIjinkI=;
        b=Jyyedaj9+sm7NqUcI1nGPWdF9/qLNUsEdhKM2iNOsLkMAEpsa+1DRaYXva8ydqaQ2K
         EbfPLuPpu9rGlxyst45Fa9sTFZ/sR+wMAu0S5CghrRIPSz2lgf0B/qCkEbRf5i4mzviw
         c7lAAd9Le+RXQn96K0SUv8C5x/ACANaaqjqJunVOleHN4LheJOhKvA9Ndew/VzZ3010T
         1bxbCL9e3dI9pVDJFzd/W8H6VhrQCssi6Fp1HiYxjwUycMmgE5fP1Hw4qCSQR6oySAgu
         TGQTohXJCy331cXN8h6t+jGsBJwTWweeV/oF2scVLMYYNWGpK+GNzJEHKPjDrQByIboF
         GA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d2q96vSBWYolsynVYZ8qCx75g4juhICH/4ouPIjinkI=;
        b=AiPpZwPng5xAwWAPBBkCHbcUbK2+8KkxaQ2LmgnNuMfd4JxXIfDccPfrqrc44sZAGN
         KZImObD4/sYXEff8/3s0xK9N7Ou6C9SAzUArvFa7MdHk/My1bu9xI5VgwvdX3A9mlkNb
         j4PjIAQa6IGwBSw6lZfR7v5Ns7raMEoEXQSPTHcFL6ij/x2u9FTtp4AAE2BlQ2m/AjN7
         1+hvm4Kn18FRLVHubmFKZl96sZFcAwDpOWGWOqZhH6KChP907WoiDgy3N6WKCw+s8HfP
         MwisSA6mEZfJaJLHSIxfcrbZXRb3aHcs6UM/b13BIZm6Dv28FhAV3zU/YWSrnVqrtG71
         AuYQ==
X-Gm-Message-State: AOAM531GVRNO17YvbCfzc7G5dYswnY5n8tf+x76YtS62Y2neQTTF6eLl
	zPZcNO6YsqPD51oWCAQBbZoz3moOmqY=
X-Google-Smtp-Source: ABdhPJz5GXTy42bFINdV+bVQ/4IrI84/Mcf+IJ/fqGcFF/rg1XE+6IOHLmrnlMvlR77t4cVIc38DfA==
X-Received: by 2002:a1c:cc13:: with SMTP id h19mr9722348wmb.187.1630910922999;
        Sun, 05 Sep 2021 23:48:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 30/30] accel: Add missing AccelOpsClass::has_work() and
 drop SysemuCPUOps one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Cameron Esfahani <dirty@apple.com>, Claudio Fontana <cfontana@suse.de>,
 Colin Xu <colin.xu@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 haxm-team@intel.com, Kamil Rytarowski <kamil@netbsd.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Huth <thuth@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 xen-devel@lists.xenproject.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181943.763360-1-f4bug@amsat.org>
Message-ID: <f039f2e5-2558-2305-c30f-aaa89084e3fd@xen.org>
Date: Mon, 6 Sep 2021 07:48:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181943.763360-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/09/2021 19:19, Philippe Mathieu-Daudé wrote:
> cpu_common_has_work() is the default has_work() implementation
> and returns 'false'.
> 
> Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
> and remove cpu_common_has_work().
> 
> Since there are no more implementations of SysemuCPUOps::has_work,
> remove it along with the assertion in cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>

