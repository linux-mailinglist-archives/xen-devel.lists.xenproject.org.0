Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51764A27895
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 18:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881772.1291942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMq9-0007gZ-Mm; Tue, 04 Feb 2025 17:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881772.1291942; Tue, 04 Feb 2025 17:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMq9-0007ei-Iu; Tue, 04 Feb 2025 17:36:01 +0000
Received: by outflank-mailman (input) for mailman id 881772;
 Tue, 04 Feb 2025 17:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yR1u=U3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfMq7-0007ec-Ip
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 17:35:59 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e98a40b-e31e-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 18:35:58 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38da88e6db0so525950f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 09:35:58 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b578dsm16592203f8f.64.2025.02.04.09.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:35:57 -0800 (PST)
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
X-Inumbo-ID: 7e98a40b-e31e-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738690558; x=1739295358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ISaS725U+91vLGWsSGGwQqDRrytBA2ysHNS0ir0reKQ=;
        b=vXicIRd92ZeX3lELrlgnGZcmcr0EKGnsm6EGZtDTjxXMSwj4z0eCmXQzfkZogLosit
         D6WUxL1i8+4whqIKZbhqirW6XItAEGt2SIwVYJ6QhLjOhzq8jLP7f/XYASAlyyjoHl/U
         iR1URxcvVBCvTDw0RFzlUITmZBg1hre41DVP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690558; x=1739295358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISaS725U+91vLGWsSGGwQqDRrytBA2ysHNS0ir0reKQ=;
        b=ZM0EoQsYR+0U78JjWfcwZc/U0yeyiodLfi4+CwjTIK19EFb/fj8H73W+O/EAM3N5EF
         08GYjbdbBfqkhijITUVqf48SKfIYQQSLDTxUsLbZ+Pti/g9emtqFCU400vlkZfvTze0K
         drT+oxAj9Ea3+vpkLYZzwiHY0Pv4kfkrr2kXZXLHjEpEzesu+L+5NWXnThKeVKLe/t50
         6i/ZaZdG0vznNX57nrwa48mwKfa4xoT+J0jyZ5eAOOTLBgs1KqkpqMXlfD45IduOpBUc
         cZlZA43dk5c+EQIEf/+rbG0z7un8Ca5Ov8mdAWCDP19GoqbQz6UZ5YSxfQKPdV5t6sSl
         0nCA==
X-Gm-Message-State: AOJu0YxWSX97v20+C5+gEftUcLOEs4jq+6Ls9EqytUTn9zKaS+NwHu+V
	9jS+lOztXzoFLLwbpQHTIYYSefirc0Eur7eh5kJ1asz5O8bGJJfiP51RKWJIZWU=
X-Gm-Gg: ASbGncsk177t3iyXG4GYj4K/+95j8WAOMI+Zo5PwTAkLe8CA8HaxSzwppkElIMTGdBR
	VX+Ll72mONmKdBzyGa+oQMgj842b2qsWaPRYFIizt3bE2IWc0mSqprewhcOoIu+x504CD3AtChF
	uQKq0PW7Q3HA1L1lYfsVWz1jjUfNMdkb3Af7l7MVAh8V2juMKzIGe1bU4yQzLQ2amjV1JS0MSsv
	U/ERcEoGsp7yS8MPTA1Ol0r/TjCKMa3zJTJIUrODO1g/ScSdyvgGfS3i7GW5fasSbP0vkWbaq+W
	lAgfe0fnXCI8vuF6nPdliU9MH7hNzfO2Ndh0KAMv/g47wGcsrhpYF0o=
X-Google-Smtp-Source: AGHT+IHinhWmSY2KTgb6A6zSKozlXkSHj+/rVz/t4kFB6jJB27EWhjZUqAoZIocLbX2GNOnGCveieg==
X-Received: by 2002:a5d:64ee:0:b0:38d:a69a:a132 with SMTP id ffacd0b85a97d-38da69aa198mr2694004f8f.32.1738690557952;
        Tue, 04 Feb 2025 09:35:57 -0800 (PST)
Message-ID: <79fe5f32-c345-41ee-af29-cbe3c45585e8@citrix.com>
Date: Tue, 4 Feb 2025 17:35:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic due to xstate mismatch
To: Guillaume <thouveng@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
 <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
 <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
 <087acd38-868d-4e1b-ab0f-9dbdb0ceb8a8@citrix.com>
 <CACt9=Qh0nXr35wx-ce8BC-xHcQjAa5nUdPvsm2K12RusT-wzXg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACt9=Qh0nXr35wx-ce8BC-xHcQjAa5nUdPvsm2K12RusT-wzXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 8:58 am, Guillaume wrote:
> Oh cool, thanks a lot for the explanation.
> I added the "vzeroupper" and Xen crashes so it looks like the CPUID
> emulation is buggy. Also I was able to try it using a VM (same debian
> testing) running on virt-manager+kvm and it works fine (Xen in debug
> mode). I will have a look by printing the xstate when running on
> virt-manager+KVM and I will also run the xen-cpuid command to see the
> difference just by curiosity as with your test we already spotted the
> issue.
> Thanks again for your enlightenment. I will continue my testing later
> today and if you need me to test something else you are welcome, just
> ask I will do my best.

It sounds like KVM has a better CPUID emulation than VirtualBox.

It would be ideal to report this bug with VirtualBox.

But, as you identified originally, it's not nice that Xen simply like
this. We should see about what to for Xen, seeing as we're close to the
line on 4.20.  I'm thinking maybe making the xstate checks non-fatal in
the cpu_has_hypervisor case.  Thoughts?

~Andrew

