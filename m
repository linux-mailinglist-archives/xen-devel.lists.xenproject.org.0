Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D462D5D86
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49341.87254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMue-0003kU-Bl; Thu, 10 Dec 2020 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49341.87254; Thu, 10 Dec 2020 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMue-0003k2-7y; Thu, 10 Dec 2020 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 49341;
 Thu, 10 Dec 2020 14:27:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knMuc-0003jv-NM
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:27:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2e5a1164-de01-4467-a314-458220aa727d;
 Thu, 10 Dec 2020 14:27:18 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-mGaSwvYOO1Gg3ISAz0zdqQ-1; Thu, 10 Dec 2020 09:27:15 -0500
Received: by mail-wr1-f69.google.com with SMTP id u29so2008987wru.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:27:15 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c10sm8484225wrb.92.2020.12.10.06.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:27:13 -0800 (PST)
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
X-Inumbo-ID: 2e5a1164-de01-4467-a314-458220aa727d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rn2VH4T8LuIT+s6rlqEBKnGBqM/nvNt/ScI69+xP3I=;
	b=fNyffFdKY0BoLStxXVHzKRO/PX8plME2OWWZrFLttEByl7OHBKSQxlePx0fD6KpFDs6Fx1
	nFWuoKfM6jS4c4RQ/FsR4X16AWTV/MnG3Nu3igS7yd/9X2I316KZJe2C+zHfogSKQ7txj+
	MOKjq2YjKNJmonDVdoT9V3ApRGkjkro=
X-MC-Unique: mGaSwvYOO1Gg3ISAz0zdqQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8rn2VH4T8LuIT+s6rlqEBKnGBqM/nvNt/ScI69+xP3I=;
        b=Y1umiMvo7dHgRHi3dIFBOTseTgLTd6EvvW6DDUogpLE6u1QA9+cMwUMKiG/AJS2EIz
         SMe9KoqUXXpdyV/qVBaC17cruLJi60vpRWhEIFW6ieyrnV5MaE9nD4G/gNxJBDLzzZzo
         cDxpPRo2xFhK/W8CA65HuTwMSMagMRMf/UzSmWPCeveCz/K3BQscyPqshdi2UVSyLc7M
         NaThgMs9k83LadURPA9Gfr8hJUJ8Fgg1/mjg1kTWdWOI5MZ5BkwSIh4jrEmWxWpkP4OX
         X62cpXokmAJIiyVPDjcWuQoW+7cUPo7GGJjEwHyr4SS+yHxY0KleqIXKd2VZJf/PTMuv
         1XhQ==
X-Gm-Message-State: AOAM530xDXulsj509BK70TG7Stiv1/1VMZxVELqenHu2eSDJZeF8R+lO
	/LhwKnRYSh/++H45e5G75yDrvaoKjsSTvV821oocFh7kTLhV7/WeCM+DZeZ+ZVwWj8P1kXLRMcL
	+Gh1Nl4Gxmmrvlmaa2kT19gUAOpo=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr8479009wmm.81.1607610434242;
        Thu, 10 Dec 2020 06:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJWAdz+KqZMUM8QDoTMVk+MZI2a3+4LfwDInoEr+NawwT5wR47Yw7MbaR5q6dQWccikQgqIQ==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr8478997wmm.81.1607610434130;
        Thu, 10 Dec 2020 06:27:14 -0800 (PST)
Subject: Re: [PATCH v3 09/13] poison: remove GNUC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec8d32e4-11ca-8a59-c021-5b212b8f6d78@redhat.com>
Date: Thu, 10 Dec 2020 15:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-10-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/poison.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


