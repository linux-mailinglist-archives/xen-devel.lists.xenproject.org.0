Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECD6AC1CA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 14:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506947.780157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBCX-0004Up-MX; Mon, 06 Mar 2023 13:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506947.780157; Mon, 06 Mar 2023 13:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBCX-0004S2-Jr; Mon, 06 Mar 2023 13:48:29 +0000
Received: by outflank-mailman (input) for mailman id 506947;
 Mon, 06 Mar 2023 13:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZBCV-0004Rw-IK
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 13:48:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb79124-bc25-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 14:48:24 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-Hgc09HgxNCuM2IR7pdQ36Q-1; Mon, 06 Mar 2023 08:48:19 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so3773605wmr.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 05:48:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003daf672a616sm10046951wme.22.2023.03.06.05.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:48:17 -0800 (PST)
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
X-Inumbo-ID: 8fb79124-bc25-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678110503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
	b=ciLlD6bRl8rdybo4mbMj8ogntOumkFNjUFHrhZDIXdDwXAap8/DBgUn5bzHxyF+5g1I2Ex
	vemFYnaK5K5eo+NzaWxOjfOguydzg5YdCLPW9cacYzSMskYIEggszYFF1I7l+knpZcVa51
	Mv7S98yXCoArIJX+YjBNCESy0hDRZQg=
X-MC-Unique: Hgc09HgxNCuM2IR7pdQ36Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
        b=abZiB8Owm7DCn4hu59y6vsDWRB/TGR4qJD8m7evP4FKa7vFRcOEq7nFs5P32B3tnGs
         yL7vTnxl9bNw5nMZlIYQOIcTVRYEnFLhgyFAzJzhY5aniMpZv1cKBDF7ROa/aIpDGpw/
         fLkNBMppAIOafv9pVSsiJSvN4LLh1YC7PrRWKGxcSVvJlhPO/SyOhNzMrkjZ631wBjtS
         gC+y2qI2e01rUBepSXdjfiWLqHoxSeTSrjuaE266cx1f/w3ROamk4csd9fZRBsHvwPkE
         AXjnIxKI8MKJJBgR5nBNguCTb/VswmoCbzO+mNluHKaXUcwJ8uMG3vh7NGK3iOaIIkQM
         4GZQ==
X-Gm-Message-State: AO0yUKXXOVXmhW9iEk8Rh9ZCMntXDKjg6oevLPPdPC4UPV3IKJvRNXa2
	knGPPcUjT02grUlL/LQp3N3nU6e2Ahgmgm3X9+sSS/i5KQec6f2RCR5cJnHz3gukW5xGvUtW7+Z
	y8kc10fYwW1wCXYBJjfp/1yTZVzE=
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id j11-20020a05600c190b00b003eb38e6f64fmr9267075wmq.8.1678110498645;
        Mon, 06 Mar 2023 05:48:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8gc4hy0Y9b+zGdCJ1WXKWLCkTPj6LWr9s/xMhjNkm3Fu6ztFBbjS1tZSQvYUJf6SWYT6Lk9w==
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id j11-20020a05600c190b00b003eb38e6f64fmr9267050wmq.8.1678110498419;
        Mon, 06 Mar 2023 05:48:18 -0800 (PST)
Message-ID: <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
Date: Mon, 6 Mar 2023 14:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAWx5eBskd1cItDx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>> [...] If a 32-bit CPU guest
>> +environment should be enforced, you can switch off the "long mode" CPU
>> +flag, e.g. with ``-cpu max,lm=off``.
> 
> I had the idea to check this today and this is not quite sufficient,
[...]
> A further difference is that qemy-system-i686 does not appear to enable
> the 'syscall' flag, but I've not figured out where that difference is
> coming from in the code.

I think I just spotted this by accident in target/i386/cpu.c
around line 637:

#ifdef TARGET_X86_64
#define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
#else
#define TCG_EXT2_X86_64_FEATURES 0
#endif

  Thomas


