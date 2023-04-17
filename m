Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F76E47B5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522050.811197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNyZ-0004IM-Kx; Mon, 17 Apr 2023 12:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522050.811197; Mon, 17 Apr 2023 12:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNyZ-0004Fe-I6; Mon, 17 Apr 2023 12:28:55 +0000
Received: by outflank-mailman (input) for mailman id 522050;
 Mon, 17 Apr 2023 12:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=be8F=AI=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1poNyY-0004FY-PS
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:28:54 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a59482f-dd1b-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:28:53 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so1509763f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 05:28:53 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc34a000000b003eeb1d6a470sm11782134wmj.13.2023.04.17.05.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:28:52 -0700 (PDT)
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
X-Inumbo-ID: 6a59482f-dd1b-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681734533; x=1684326533;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHlangfw+7m1YCMw8lZV9CNZHwQKHUWeJfkJFI19eOg=;
        b=bYg3qN6rK63/iJpugod5x88LFcz1ySMUUCQvLKN8kkAOJQfnJN+YlMvQnvFOStsAh6
         BjYH7KdED5M8d0IuoHaV/lK/N4fpjAIAylJ9HBBBLx824IF7/Y1MYngc6q0UJByU1Y8r
         Uy2/4QynzcQfW7tPQpQVwhDEstIAVTaN2cwo3HT8I5kxOVpsfGNBfApxzR/rkvqhc/cT
         s5AElOg4n4GJGRPIHK0RdoejuNQOcJUOSEXsE0bvLOrGL/2n82ceKv6+z7keZkcY76WS
         Xeq6yWo1ZJL05Cz8FwzIShenJKvi0sTHeAGK9HozDDLT5QsIgvegW8tNtkFIgcCBCjf7
         V39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734533; x=1684326533;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHlangfw+7m1YCMw8lZV9CNZHwQKHUWeJfkJFI19eOg=;
        b=cfa+trjDeDmxbUADwaLkxLArzfY84GH1GD/QqwTr4v+b5kjGWh5dNWBtB79kwv7rhh
         mQAAoaM5o5HHeDQXU7GEcSz88T8Os5ypxVEBoB4YcLuKQxQaESTpLgpxrOmv/5ckiaoH
         ASkdhBY0KTiZMu1u7MS7hfWac8r2ypsfv8tkV3w/XcIxUTMQQwfsiaaSoNyDchZFPGxo
         LCGJD9QQj39tFsOU04Ta0KDckwCdyH2m780c5GDgE8ow1JrqxAy31RdTCdJeD0RL8CG7
         JLiS8Ol5zcRtmhKZw1hnBwoN/51ewJz10Ycadkm72mX2JytRwbkAFq4myXdmqLu+h+fp
         vQ8Q==
X-Gm-Message-State: AAQBX9dFjIhO8d4A/tooFWp1B4IhEiZUKkeUiZxkhc655PMnAxKuJec4
	uDs3xo9iYgZfWr4F+y16fgA=
X-Google-Smtp-Source: AKy350abVnY/wIAxkqlJo9mt+LIZ2kcEVzwVNhlLPlEpeUu8gGoZ0KZlxQblQ+9TrYZpypLwud6o1Q==
X-Received: by 2002:a5d:6e01:0:b0:2ef:a57e:bb9a with SMTP id h1-20020a5d6e01000000b002efa57ebb9amr5522963wrz.6.1681734533109;
        Mon, 17 Apr 2023 05:28:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <95698d88-85ba-0072-f23e-91e8b686dc52@xen.org>
Date: Mon, 17 Apr 2023 13:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/5] hw/xen: Fix memory leak in libxenstore_open() for Xen
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-3-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20230412185102.441523-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2023 19:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There was a superfluous allocation of the XS handle, leading to it
> being leaked on both the error path and the success path (where it gets
> allocated again).
> 
> Spotted by Coverity (CID 1508098).
> 
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Paul Durrant <paul@xen.org>


