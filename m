Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACA65C0B2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 14:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470629.730189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pChDO-0002LL-SY; Tue, 03 Jan 2023 13:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470629.730189; Tue, 03 Jan 2023 13:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pChDO-0002Id-Ob; Tue, 03 Jan 2023 13:20:26 +0000
Received: by outflank-mailman (input) for mailman id 470629;
 Tue, 03 Jan 2023 13:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=20m7=5A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pChDN-0002IX-5Y
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 13:20:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 616f84da-8b69-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 14:20:24 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id ja17so22623180wmb.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jan 2023 05:20:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b003cff309807esm48256372wma.23.2023.01.03.05.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 05:20:23 -0800 (PST)
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
X-Inumbo-ID: 616f84da-8b69-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAwOz3kc/9RSBo9h8xa3JZTDJQ2pKeCHHfYRBL5M+SY=;
        b=w6BTCvFONQCYPX0/nZZCMv4rr29dPxkv98CNXiyLTNiTsQbTli7oCIEorcdwzVRc3Q
         ge3kqsR5GujjPB0TW7Pfp2NU83khk8s3NXWX8wKRV1tIJK8gp6OTTXxCAVEi8dGmp2iE
         lSDbp3a/SWK5od1MJsS6FD+hXAzD4sSwQ9gd/VTBqX31dHDmzyczIf3WwfGAFeCnsVtd
         R4W7sbNJr0jZ+6X6duvmxscybWitengU3/4qw/6wfZC1vSF4TxAx4LbtKYfauDhMGWc8
         9qdRLb6hF7Co+q3ij/HqSwp9UpU0jJhxmDYqusP9482jSljfGackybhTGEO4GzTJm0cC
         xn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAwOz3kc/9RSBo9h8xa3JZTDJQ2pKeCHHfYRBL5M+SY=;
        b=g4tzIF+wBHSb2rkIIkUuzkRi/5nMTEK5FYv2VhsSav6YIafagvYA0dLATUOShueGz7
         x1/pCExsNbiUVyDiXe8noIkGHBHx7arSrTgXfUi5KRX1wAmCehV+caAuIlMISE/yiCHH
         +b/9+2UKFiFuII+bMltACNaZgzi76065eToucQcsjWnOfi9mWlVluVlHKEGz48gfgftM
         yhW9qSU2zUQ+g+1xWmOIM9jBKREbFTim6CrLSjQNS/4ftWdY1ciN7+Cr4r07lqzx93G7
         MX9A8yIS05SN2qXuEhq+n73WB0m0131KSl32EIbHj/18wtsac9s+mZeed34e1awd4efx
         m5Pw==
X-Gm-Message-State: AFqh2kocusvibBb0AVE61QJs8coaPUmbugD7WSYgtsrySj0USqzY2nkG
	ZdAe8RA6PWscx/WU1+6OjuZPJg==
X-Google-Smtp-Source: AMrXdXujUu1mK5FhNhKF64/Kjpk2KVHVVnvRRQsbR6qSJmMKeYk3xlYQ4gde/xnsingH5Bey5hXL1A==
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id 12-20020a05600c22cc00b003d1bd81b1b1mr30316821wmg.18.1672752023907;
        Tue, 03 Jan 2023 05:20:23 -0800 (PST)
Message-ID: <cdfe29e9-327b-476b-3343-92216874075a@linaro.org>
Date: Tue, 3 Jan 2023 14:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] hw/isa/piix: Resolve redundant k->config_write
 assignments
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
 <20230102213504.14646-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230102213504.14646-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/1/23 22:35, Bernhard Beschow wrote:
> The previous patch unified handling of piix_write_config() accross all
> PIIX device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


