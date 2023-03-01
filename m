Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF356A67AC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 07:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503844.776203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXG6R-0006bn-By; Wed, 01 Mar 2023 06:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503844.776203; Wed, 01 Mar 2023 06:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXG6R-0006YQ-84; Wed, 01 Mar 2023 06:38:15 +0000
Received: by outflank-mailman (input) for mailman id 503844;
 Wed, 01 Mar 2023 06:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SCR+=6Z=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXG6P-0006YH-EM
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 06:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b50f64-b7fb-11ed-969e-2f268f93b82a;
 Wed, 01 Mar 2023 07:38:11 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-OEZUUfguMdiWHgWOadDUDw-1; Wed, 01 Mar 2023 01:38:07 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso4935181wms.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 22:38:07 -0800 (PST)
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com.
 [80.187.114.247]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b002c70851bfcasm11667249wrp.28.2023.02.28.22.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:38:05 -0800 (PST)
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
X-Inumbo-ID: a1b50f64-b7fb-11ed-969e-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677652689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
	b=DXj1wR47wpMcRPlgfhSkLRjar7Zpf36fwWINAWcQooVZVe8W6YjUR7h9x3do4aNYp4dFAZ
	3LNZjQaCLJlbE0AJehOdijIBVb7+hsXRQHKrZmHZN2GoUuV7HKHiP9IaT3kGnEcytsSOuj
	2K6n0OulCAQdf/U20/ppfVyMeq1qF4w=
X-MC-Unique: OEZUUfguMdiWHgWOadDUDw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzMm3fUBKREDceB/hwB0g6aZBhTXaxovuybVbMipqtM=;
        b=Kn9DR+jJ6rXFvfdgRCC5ptTuj+OoSUOGZs0YUTy+L7SJ9cd3T+mIPCr7KcepESaVsH
         M0GwdpKxoW8C9jlzRuz7hTPN7e8yaw2THFkLSvyVkzuGarij9XRqOqAdKTdXdgdySxDa
         ZYdmKV1lOy/fZZ802lKclb1mXwYHOQCWQBf+SVt5CQhIB2Mf4J8ReTB3JuD0lIJx0Xov
         hdOOoKPUsBqD7BAj/rAevcYDS4WQqmTVe7ZDh7v2fWwqwmZJyXi5IGT/gi3fnOEUY2mm
         ndn7ifVEpmc4f8L+sN0tz8/snIhDW+h6WSjAo2xt/KyFim4DGsKsfGYaJ10XbMBR5JS+
         892A==
X-Gm-Message-State: AO0yUKW/YZPL4SYVFPMM2gC/q9ES6hLAVsjuSWVRCrVK5OKSyJ8/pCT/
	fFofoNbsIvr1cpMK5pFpRQrX6uReR/F156oQwTlTLkTJ7d4tTa6MFFPvg5J7/W8Ldz7m8c9Yxcu
	FFUcJKCC/SHQYD5seCkxI3g0suDw=
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id c15-20020adfed8f000000b002c9e5f0bd4fmr3769337wro.18.1677652686747;
        Tue, 28 Feb 2023 22:38:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+V39Q49fA9fFcyx9YeNU/nuEuV9BMhuxhc3OI7luNwKM5DIGf2neEPGFF8ADivpvznnmg9sw==
X-Received: by 2002:adf:ed8f:0:b0:2c9:e5f0:bd4f with SMTP id c15-20020adfed8f000000b002c9e5f0bd4fmr3769321wro.18.1677652686484;
        Tue, 28 Feb 2023 22:38:06 -0800 (PST)
Message-ID: <85aa3a6c-63a5-ad1c-b7c5-201ceedcc3ce@redhat.com>
Date: Wed, 1 Mar 2023 07:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
 <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
 <20230228162938-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2023 22.32, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
> 
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release.

Other hosts don't bitrot completely since there are still people out there 
who are interested in those host systems. But are you aware of anybody who's 
still actively interested in 32-bit x86 host systems and thus makes sure 
that QEMU would still work fine there when we publish release candidates?

  Thomas


