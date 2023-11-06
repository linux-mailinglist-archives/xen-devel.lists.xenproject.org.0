Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE67E2928
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628175.979348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01vR-0000is-PM; Mon, 06 Nov 2023 15:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628175.979348; Mon, 06 Nov 2023 15:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01vR-0000fZ-MG; Mon, 06 Nov 2023 15:54:05 +0000
Received: by outflank-mailman (input) for mailman id 628175;
 Mon, 06 Nov 2023 15:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jw9=GT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r01vP-0000eD-NT
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:54:03 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44b0b6e-7cbc-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:54:01 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so62827431fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:54:01 -0800 (PST)
Received: from [10.95.110.31] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b004064ac107cfsm12608013wmq.39.2023.11.06.07.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:54:00 -0800 (PST)
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
X-Inumbo-ID: b44b0b6e-7cbc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286041; x=1699890841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt6CguaXRq/YZ+PZ3lvfxXKUnqOduWpE0HGPF4W1wY0=;
        b=ZK0yxLI7mCeOcL1I3KGoX7Cuv617OYEqOhHo67Ryg5ieKg0Csc0QP0GcKRc/7SeO/T
         t/82rbhwlItQFVfD61rN8HwevA0RSQWd8bXH0fakKD8VvEoAQbEqLr0lyEgmvamEJLsZ
         /ixtMkoF8Rx65Wufabyhra1aqoeGKuy5w5i9p6SuxyhBiNVzqt2bSwN2/kzhz7nOMMNp
         v1WRcAmSIAUnnpSnY51CGhFnIC3WPyBzxxSodbwYCRMUquyRX3kgzBvByTWS8EdWNjgl
         yTfHnTmKIqAJ9huGE/jJr+oeqmSw7DHGCBBMzDp0zJk+gpZt73S/1Ol5OYWS66ZRw2pz
         EhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286041; x=1699890841;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt6CguaXRq/YZ+PZ3lvfxXKUnqOduWpE0HGPF4W1wY0=;
        b=lnYC6AeP9psW8gFvi7ZOBFjjrK2+YyLoyDzPs9JylCEFO/9DmVGuAGKCIvvTcOqP+f
         KjooTrX7JGabw5xu8vaqNkIakSI3rSJSZOususpXDdg+U+0zple+LTT6WfB5APlgrv/3
         KuMJZzSp9wLtWYd79RFGd+kbJxXoy1VQgnxv2NDl5KH+/YABmqo1/u0zBcTYI5yso31U
         F9Ui3A4eUgM3A6mHckRsifCdIYNTan356Flr9ZlnGQRUBXYv+03IhKdmsvBMymT63Jkd
         hT/6djnBy/p0hbzzXF8rfjtPJrqUvpKGLmsnNV7epvSfo/jhqNev/G2WO8Wfzi7JuvLJ
         WeQg==
X-Gm-Message-State: AOJu0Yz17eNXDlrkvLLGGVg2kyZfZbFBGdJ6j/3QXTnglzjadXA5LshF
	CCuZGQz/flxYg7WkgOyNPlY=
X-Google-Smtp-Source: AGHT+IGCoYjqZL7KCS5nKOgoZCWqBe7yFIheTDPrXy3X0fCB+qVxX20b8MuMAQC0/PdVpz/QlzJQHg==
X-Received: by 2002:a2e:8692:0:b0:2c5:2191:3f35 with SMTP id l18-20020a2e8692000000b002c521913f35mr24457967lji.2.1699286040925;
        Mon, 06 Nov 2023 07:54:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d8838073-5169-4f84-bc98-912f5afa285b@xen.org>
Date: Mon, 6 Nov 2023 15:53:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen/pt: Emulate multifunction bit in header type
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20231103172601.1319375-1-ross.lagerwall@citrix.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20231103172601.1319375-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2023 17:26, Ross Lagerwall wrote:
> The intention of the code appears to have been to unconditionally set
> the multifunction bit but since the emulation mask is 0x00 it has no
> effect. Instead, emulate the bit and set it based on the multifunction
> property of the PCIDevice (which can be set using QAPI).
> 
> This allows making passthrough devices appear as functions in a Xen
> guest.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>


