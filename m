Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D0A73455
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929455.1332124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoBW-0006mz-Pk; Thu, 27 Mar 2025 14:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929455.1332124; Thu, 27 Mar 2025 14:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoBW-0006kb-Mf; Thu, 27 Mar 2025 14:26:18 +0000
Received: by outflank-mailman (input) for mailman id 929455;
 Thu, 27 Mar 2025 14:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txoBU-0006kV-Vg
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:26:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70888b3d-0b17-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 15:26:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so795565f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:26:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39bedeb82c1sm1194716f8f.3.2025.03.27.07.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:26:13 -0700 (PDT)
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
X-Inumbo-ID: 70888b3d-0b17-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743085574; x=1743690374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVvhx8Myk2NdnmysDI4Xnt4qOhf7M92UeoujUr+LMgQ=;
        b=nOnc/FSNwhCML1ZQO/ISb2EV06OS6iE5VBHzEjojhecNBhRg+6jfRkGXia4qE8gK66
         I3D7rFa2slrg0VRYFL2oFQgfw+623Op1eJfdDDsbGs6VgQT+/PA64b1k0t2pF/XqpPuM
         81jaS3hU5ufJiqLX3bCEPWGa8XlK7LWKYlVL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085574; x=1743690374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVvhx8Myk2NdnmysDI4Xnt4qOhf7M92UeoujUr+LMgQ=;
        b=v2JTVhehjPernbryMKtxYUEka3aHjNY6TZKewbQ8NOFdRwf5nBw+XUKC3NIRrMkXd3
         /3T6/351EKM5IFtDQNazFl0WmvtCX25HOHq64iDF16O7HSmdlxtIG7VgGEzoAqz6Pb64
         2xeQc6yriuvmJh4YBqtWmlbwizbzpN6sz0O8UKpxNicGyfE9VcstN7vhOZdppI2biTiV
         aHywe7pVFiPabWxScBit2AitoRyEWFgzpRWbIPhrSO8EbRKSqekBPKhjv5q58Z7xsSHS
         i6jqa8giVZeNOgjMz6FktPj3KalzmyW4XHqYPJ9J9+VGxS4IK8oLyNd3Hdb89eI5MWKz
         ED+g==
X-Forwarded-Encrypted: i=1; AJvYcCUkQd/gDRN4fCBLKZ0AWK6u1apCtDrSqC3SvNvojm3V7jR2tML1jkQzzwIQmjn0k5r4njo70OshxdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEcu1j/+IAvUc/0lz2P4m/PEQBGo5u+pjf5zdM/B/qh5Sn2ZTl
	M9+zPQ9hkaV3whLrWzJ4ICokzxGX6H7T2yEgudA6vXoQZTPkcq2nD/Az8Gvk9Hc=
X-Gm-Gg: ASbGncteAkdt///fqW8eHLX1UbZ9EJA0To115U3meQ9GJCS6tEVLhXxS+kPZaqowPF5
	wba2Kf7JtqK+2+Vil9msOWgJET6oziGVdtvt4CIw0HvzetT/oPR666V9NYcUKOdGb6mxQsFJfSH
	tcl955KQzPIajkdXfQ48V7aovIXHDPlXrqvf4hI7jecJrk2/VPTPCulqfmBe4/FRJztlgMUythV
	2x4u8tecL8DbJUneZTFkjHndLzi5LDN2r70IRfqRY3V2Ewoylm1qA88yS0iRKfKQvx4P8pghoBK
	cZe1s/zLB19cojTkqbH/0lZ3hp4EzbWxazu8O/BY031iWoHWchlu1Qkxq5qPNUbvPp8kJyDaFzR
	x6e1+pP9b1Q==
X-Google-Smtp-Source: AGHT+IGUCQ9a2FmAR3UGDPRZQsL0n8e7hTHHR0sq72KqpLi+ePnSQ+Lao+Sv9PN8DfKgV0LypdZsug==
X-Received: by 2002:a05:6000:2912:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39ad179b035mr2971807f8f.53.1743085574408;
        Thu, 27 Mar 2025 07:26:14 -0700 (PDT)
Message-ID: <4bf1fe0c-2034-40d9-a5d2-ea10983e530b@citrix.com>
Date: Thu, 27 Mar 2025 14:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.2
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <7ac97714-7137-47bb-b109-3ec4c69fbeb0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7ac97714-7137-47bb-b109-3ec4c69fbeb0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 2:13 pm, Jan Beulich wrote:
> All,
>
> the release is due in a little over a week. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant. I'm
> already aware of
>
> be7f0cc651d8	ARM/vgic: Fix out-of-bounds accesses in vgic_mmio_write_sgir()

Looking at the patchqueue, the only one I can see is

c11772277fe5 - tools/ocaml: Fix oxenstored build warning.

~Andrew

