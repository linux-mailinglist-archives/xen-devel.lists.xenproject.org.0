Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE397D580C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 18:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622390.969451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvKB5-0000gZ-Ez; Tue, 24 Oct 2023 16:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622390.969451; Tue, 24 Oct 2023 16:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvKB5-0000ee-Bu; Tue, 24 Oct 2023 16:22:47 +0000
Received: by outflank-mailman (input) for mailman id 622390;
 Tue, 24 Oct 2023 16:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvKB3-0000eY-PX
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 16:22:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90042a23-7289-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 18:22:44 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32003aae100so3375727f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 09:22:44 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff18c000000b0032d402f816csm10104046wro.98.2023.10.24.09.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 09:22:43 -0700 (PDT)
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
X-Inumbo-ID: 90042a23-7289-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698164564; x=1698769364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3Lw885OKwVMAKJ+lcANwbqiLUJvnaLF4rMzyVhxCiE=;
        b=UqLWlsHZAJ8d+CBmGRbOcLAF8ZNVGvGcRWuXhyjXfjssyIVLlR5I9XqtUqcT8TMs8n
         UK+TsXfctNOBo/WQSKXatQN7U+HRGOkaPv3matGYsDSLXVs10EPVSRb+KUUCoJ6pyTLC
         4wfT9sSvKMdkz9TRh+9ykaoRE0CVSazAWEyQVnvfKmrdvPFy1RWc3KgZXLYRBOp8XUrm
         rh1Z90KG/XjCytZpae8gFWIzcxALGEi2g8qtMX21s0hppocfRi+96MAURD2CloR5cujn
         /1cTET7xzf3lG0BnRRp/J0cZ1JIvPyg6+0madqGX5Nq2kYtMcndjLeQmYIUogXVdVt8g
         jx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164564; x=1698769364;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3Lw885OKwVMAKJ+lcANwbqiLUJvnaLF4rMzyVhxCiE=;
        b=g0sFEJm+F0MrLU1XVQTEouBkWetD14G9S0lTSTDV1oHaEs/R2skLDMCnperBAkcLYW
         TSNxcHUIVFcs/mQt6xsCfbUvzFbXHkcN5sSq0MN1LMXreRXVmjmZZRBA8tdc+XamllEU
         tRBxY0YZohAUnnpcYtNk/yHShZnIG9wZxQY1oc812aZNKBTrxNS9vS0BRqDd9RM9WP1m
         80485uyDonid7vcRm0UBsv6Mz1k+9X2riMNYHR7ZSdzvS1/WL2CR51o/2/Eo9GZLf0h6
         HtjZGbg35bARUvsipCiTGhhkQBA5uvChtH6CUORMVBpi8BP2YD5dghGeVS6HTTEpwPIl
         owwg==
X-Gm-Message-State: AOJu0Yw6xAmUgZnIVUPoGd/PUb4smFGmxLit7s71RPVIue0gdp7MPVg2
	Tqw6k1lDmsjT82/bKNYcipk=
X-Google-Smtp-Source: AGHT+IGE5clc2rOnE6leeciZfVRiFGqwOxcrDHe1tg4zz2ecPacv7kXaqp1axxGRcGZHMciB9vvCKw==
X-Received: by 2002:adf:b1d1:0:b0:32d:c755:d73d with SMTP id r17-20020adfb1d1000000b0032dc755d73dmr14284793wra.18.1698164564123;
        Tue, 24 Oct 2023 09:22:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ab2aabe5-b3c3-43f5-812e-bce98d2e59ae@xen.org>
Date: Tue, 24 Oct 2023 17:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 16/24] hw/xen: handle soft reset for primary console
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231019154020.99080-1-dwmw2@infradead.org>
 <20231019154020.99080-17-dwmw2@infradead.org>
 <8ba01df3-6189-4e1e-a70f-37a2d4dd21ed@xen.org>
 <3124d1d6e9af139a3c7b6dbe2b73a82914d3f559.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <3124d1d6e9af139a3c7b6dbe2b73a82914d3f559.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 16:48, David Woodhouse wrote:
> On Tue, 2023-10-24 at 16:44 +0100, Paul Durrant wrote:
>> On 19/10/2023 16:40, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> On soft reset, the prinary console event channel needs to be rebound to
>>> the backend port (in the xen-console driver). We could put that into the
>>> xen-console driver itself, but it's slightly less ugly to keep it within
>>> the KVM/Xen code, by stashing the backend port# on event channel reset
>>> and then rebinding in the primary console reset when it has to recreate
>>> the guest port anyway.
>>
>> Does Xen re-bind the primary console on EVTCHNOP_reset? That's news to
>> me. I go check.
> 
> I spent an unhapp hour trying to work out how Xen actually does any of
> this :)
> 
> In the short term I'm more interested in having soft reset work, than
> an explicit EVTCHNOP_reset. And I can't work out *how*, but we do seem
> to have console again after a kexec in real Xen.

*Soft* reset may do it, but not the EVTCHNOP_reset hypercall itself, 
because there's a bunch of impenetrable toolstack magic involved the 
former. Perhaps you could just push the re-bind code up a layer into
kvm_xen_soft_reset().

   Paul

