Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E5AE3F0F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 14:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022295.1398077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfvh-00058K-9b; Mon, 23 Jun 2025 12:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022295.1398077; Mon, 23 Jun 2025 12:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfvh-000563-6D; Mon, 23 Jun 2025 12:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1022295;
 Mon, 23 Jun 2025 12:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=63EW=ZG=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uTfvf-00055w-CP
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 12:05:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb0b458-502a-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 14:05:37 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3333191f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 05:05:37 -0700 (PDT)
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97a908sm142235035e9.4.2025.06.23.05.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 05:05:36 -0700 (PDT)
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
X-Inumbo-ID: 5fb0b458-502a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680337; x=1751285137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhVmC7Ptr86082iSVP3tCUv3mxHNuSnJ7XLqXn+lKmI=;
        b=ERxREUfOUSpiWnO3iKlP6ylC3dm2Vg8Hj27uaZSIM4uzqo35fvHSB+/rfs1v8z6eK/
         jZBCRIr/lUqY0oxAKnwvRXC51oa5WEo6eSCne2NTir3mv4rb1pBY1Typ7n2bwBVcTU+S
         OHnCIoPL/3pijgfbvWPwjv2ySrYHTGtIVZNSJxjwNfoMylqs/U9HjA6fcZz8YJ6aElRV
         KVM4sWtSfZdgsk6Ah2sry7847gWgF6f9QHYT6u1OC19a86sNBAaEgDERrOW8TE/fgzF+
         6/Ji4nwgaUOoW/S/hDyqgxgRpzIoeJilrQ0qtR66GgtVyq2+ha8Ns7ay8JV6Qk9hJYRS
         kOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680337; x=1751285137;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhVmC7Ptr86082iSVP3tCUv3mxHNuSnJ7XLqXn+lKmI=;
        b=I0fpUNrtA5CT2BBMTm1YUulHrZoHEIbsoCSEzN/J3oQ1iltWhEPZgZtTUd69ebNHyM
         5nhf5RFaBzEWhJqhQ3ylK2qR7q+7Ge8jPd8MHxGGPABV/Es79VFJoCejn33J345D3/V5
         fvL5t2V/vLXllvVGImicLbf7xvW2X1c1ba/nPSfwLa9zQrSdRtFVhWoNd7VQwE63RG+/
         U66Q4RMrC+yxLlu5S2F2SEGjv3WRcP+2YCnVGf3Ezys8e+lV0oqt6TkEmNMh72evIVFV
         JwOlmU79JteSibz2ILvi+ueF/GV3Tfh5977d+Er5igfmV6cKTi2QtOlOCVWRVhcBZxxJ
         a5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXRbLvvR+pLKj2eh9abr1Pt7I+cJ3Z25fBD4Y5YihbHYj0LFBkdxGAvNSBRB8O6eHf//P/mcoBZeJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfG3vdDUcJ1frdzcM/U9XMdK2MmEVFT18AsFbbHk+a+fqxXufS
	+UVqIxiIU3ojlgGIH7h6OeAmcZMC0l/KVdVjZKM3vHoim70ZL/NaK1CZ6Yga+sdsxKo=
X-Gm-Gg: ASbGnctuHqO7smyioc21P4eXZdKvZUh6y1+rkt8zsPU/a7UY5GS/fGOviBj5HVl4zxB
	6nHs037xCYbGfZiTH9GfYPuEdMw4lZ+U2Qy/q1ezOIV8JXLvsc6QlLclykwjBQ44SQK+qy+mIn1
	HQ6gPCzrsu2mmsARY4EurgMKXuVUmyOkJ6gVP0rX9igVHknKeO67uue/ngQ3t4VmfRta4brT7R+
	Hwtrtq5JnhjCz8jCvEOM110lw+B/Getfo36beucpNXZrXFJxCIwvdySdhtBY9pgfsGjMNs2U3Wc
	wL2d5grSvNAyGnw+WnKweQFv3Fv7KWWQX00MppwrdWc3MwJKWfq8F2Ryh5GdiBj/8kAZUQ6R22+
	8yLcSNU/svmTD8Uwimjykccbsjwlw0w==
X-Google-Smtp-Source: AGHT+IFqbtwF21H6pWk34kjB74g+vaQ792b2mQtfrzzfV/L7m1oPbaWH1vPXMofzQKaBoxU+8UO20g==
X-Received: by 2002:a5d:5f93:0:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6d27e17c2mr9044838f8f.18.1750680336753;
        Mon, 23 Jun 2025 05:05:36 -0700 (PDT)
Message-ID: <424c91ee-f5cb-40a1-b1bd-3f0648ae83f5@linaro.org>
Date: Mon, 23 Jun 2025 14:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen
 test to TCG
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-24-philmd@linaro.org>
 <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
 <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Content-Language: en-US
In-Reply-To: <be71c7cc-a5ba-4ba5-b697-60814b712eea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/6/25 13:59, Philippe Mathieu-Daudé wrote:
> On 23/6/25 10:11, Thomas Huth wrote:
>> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>>> On macOS this test fails:
>>>
>>>    qemu-system-aarch64: mach-virt: HVF does not support providing 
>>> Virtualization extensions to the guest CPU
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/functional/test_aarch64_xen.py | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/ 
>>> test_aarch64_xen.py
>>> index 339904221b0..261d796540d 100755
>>> --- a/tests/functional/test_aarch64_xen.py
>>> +++ b/tests/functional/test_aarch64_xen.py
>>> @@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
>>>           """
>>>           Launch Xen with a dom0 guest kernel
>>>           """
>>> +        self.require_accelerator("tcg") # virtualization=on
>>
>> What about kvm (or xen) as accelerator? Would that work?
> 
> IIUC this tests boots a nested Xen guest running at Aarch64 EL2,
> and at this point we can only run EL2/EL3 on TCG. HVF and KVM
> can not for now (we are working on it).

I'll update the description with:

   Currently QEMU only support accelerating EL0 and EL1, so features
   requiring EL2 (like virtualization) or EL3 must be emulated with TCG.

> I don't know if Xen can accelerate EL2, it would need support for
> such hardware (like the Apple Silicon M4). Cc'ing Xen folks to
> figure it out.


