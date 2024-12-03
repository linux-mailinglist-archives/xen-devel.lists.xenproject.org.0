Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954389E1929
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847829.1262890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ4K-0007sH-HQ; Tue, 03 Dec 2024 10:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847829.1262890; Tue, 03 Dec 2024 10:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ4K-0007qB-EI; Tue, 03 Dec 2024 10:23:48 +0000
Received: by outflank-mailman (input) for mailman id 847829;
 Tue, 03 Dec 2024 10:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lc0I=S4=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tIQ4I-0007oa-IP
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:23:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac4976ed-b160-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 11:23:44 +0100 (CET)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-pNdf7GLvNait0MZc-Mskig-1; Tue, 03 Dec 2024 05:23:40 -0500
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6ef7c67eeb8so41018527b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:23:40 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d87fe890a3sm53397756d6.29.2024.12.03.02.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:23:39 -0800 (PST)
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
X-Inumbo-ID: ac4976ed-b160-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733221423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kmyxVJ+YUkcgpMOIJZRmGj3gv31AXTUXR3Mg+4OB2T0=;
	b=dwlktHBupXvfVnzHUbOVNwXSA0UKg3dv1c6lWCuw5sfp9Pu/Oww2b+ag85Ikjp/HbEPBJ5
	DC9cVlE9eHwB1DYEbn9dKieaYPEM5J+3toH8hoMYoEE5XKkMYqGRNyiReDCOs2S0C1XeVA
	8JS4mVuLyv0LTkf2WciQCyU0Pqh8UEs=
X-MC-Unique: pNdf7GLvNait0MZc-Mskig-1
X-Mimecast-MFC-AGG-ID: pNdf7GLvNait0MZc-Mskig
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221420; x=1733826220;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyxVJ+YUkcgpMOIJZRmGj3gv31AXTUXR3Mg+4OB2T0=;
        b=jlYaogiasyZDpaiV1qi+REsK4+3K13lyKqXNdZzWWSh6HhXbDM/4ch5OkHVXAKOXuS
         VHqbiagIdbhUluEkttlfp8ZathH9AMkyGOu9ckaJxqcHEobNrgYKawA8uVqy1vzX/TGK
         wixj8uz/hrzsylDfFlhWmbSauDAHHOuxoWLBY1JWr18yL11xr/+83Fv+vo7eDfympxlN
         cIJB3RJRuXxMi/+ehytBgRLMcQrNRnNU+XijrhfJMFTDrC0J6KDn/w/2vEZpLe8iO2wY
         dAEcI4f2mBFoDn+IxtmBPTf8kM58cV3m44wcVBR0TLtMcZDB53b59V/E/MH+SUeylwZe
         sYtg==
X-Forwarded-Encrypted: i=1; AJvYcCVCGIh6OBh2dCZJ8q5DdPIi8H76fJMWohQDIonR7R9T5jqMZlkBnQ7tkMMA6YQFX+JrOeY/xBzq4PI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6pyAFllDt2Nl6iCIZz0I5H1MF8fFxZUwSbzjRZlfwk/+kbT0I
	XWPNprgG2hc+ondcfdo9mTB3GXVIEAg4PpvJ8JKeYqaZRuZVhLM4l9WUyLqilWpe0aVHJ8IRvTN
	hwgqIGR81ftaYlWONEjECjj+mahGdzywAubi+7rtwLILRhrgy4mZehbcPNpdc+9Mu
X-Gm-Gg: ASbGncs3Y4GG5AVJsRmdNvDoi4D8eLqWxVQfBA+5d9m/HYYBeMRVjeMnoc77gnxs7t1
	rrhXLA2Quvv1kGbrL6/lH2FOflH70mB85GjB2iXDhEEbsLZWvvFN1zTyR/E+tQBSedo9AQmSmQq
	Amv5Q3Y99oAHoW13u1jBxGMhJ6Wow68LkIPFZ/LA0yWOYAdltiIbIs1TQOxQhNjfdUqctSOvCkT
	DzS675i9adrp/BeUdlBlvCmErmTLdQzcqvRujLqpLoX2XNSQ23r1umeFOBbMfxcp8/67kv2GaSE
	UIDAFQ==
X-Received: by 2002:a05:690c:498c:b0:6ef:6d37:1844 with SMTP id 00721157ae682-6eface0165amr26104437b3.7.1733221419704;
        Tue, 03 Dec 2024 02:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhLH5mlnPSZDMavmUUFnJVktKyJMWmluLB4C8Hy0mLsNN/3vDHojrXbS5zn/OAP8RhyeXzIw==
X-Received: by 2002:a05:690c:498c:b0:6ef:6d37:1844 with SMTP id 00721157ae682-6eface0165amr26104227b3.7.1733221419366;
        Tue, 03 Dec 2024 02:23:39 -0800 (PST)
Message-ID: <a4f32fe4-37e8-4695-a2d2-46943b4893d7@redhat.com>
Date: Tue, 3 Dec 2024 11:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] tests/functional/test_virtio_gpu: Remove legacy
 '-machine foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wIf5NZF8eGUBMIeYhrmytIKAme05zwBleI6hKqdn80Y_1733221420
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/12/2024 10.21, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> functional tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_virtio_gpu.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/test_virtio_gpu.py b/tests/functional/test_virtio_gpu.py
> index d5027487ac4..cc0ec234861 100755
> --- a/tests/functional/test_virtio_gpu.py
> +++ b/tests/functional/test_virtio_gpu.py
> @@ -61,7 +61,8 @@ def test_virtio_vga_virgl(self):
>           self.vm.set_console()
>           self.vm.add_args("-cpu", "host")
>           self.vm.add_args("-m", "2G")
> -        self.vm.add_args("-machine", "pc,accel=kvm")
> +        self.vm.add_args('-accel', 'kvm')
> +        self.vm.add_args("-machine", "pc")

While you're at it, could you please change this test to use 
"self.set_machine('pc')" at the very beginning of the test function instead 
of using -machine pc here? That way the test gets properly skipped in case 
the machine is not available in the QEMU binary.

  Thanks,
   Thomas


>           self.vm.add_args("-device", "virtio-vga-gl")
>           self.vm.add_args("-display", "egl-headless")
>           self.vm.add_args(
> @@ -118,10 +119,11 @@ def test_vhost_user_vga_virgl(self):
>           )
>   
>           self.vm.set_console()
> +        self.vm.add_args('-accel', 'kvm')
>           self.vm.add_args("-cpu", "host")
>           self.vm.add_args("-m", "2G")
>           self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
> -        self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
> +        self.vm.add_args("-machine", "pc,memory-backend=mem")
>           self.vm.add_args("-chardev", "socket,id=vug,fd=%d" % qemu_sock.fileno())
>           self.vm.add_args("-device", "vhost-user-vga,chardev=vug")
>           self.vm.add_args("-display", "egl-headless")


