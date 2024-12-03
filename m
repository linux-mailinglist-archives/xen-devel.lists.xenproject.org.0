Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3169E191E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847819.1262872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ1Y-00062k-Se; Tue, 03 Dec 2024 10:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847819.1262872; Tue, 03 Dec 2024 10:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ1Y-0005zb-PZ; Tue, 03 Dec 2024 10:20:56 +0000
Received: by outflank-mailman (input) for mailman id 847819;
 Tue, 03 Dec 2024 10:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lc0I=S4=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tIQ1X-0005yh-H5
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:20:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4537cb7c-b160-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 11:20:51 +0100 (CET)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-5o-kJoWZOi-tXhPZfYxmUg-1; Tue, 03 Dec 2024 05:20:48 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b678f64ac9so851892485a.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:20:48 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b684944f4asm496777385a.52.2024.12.03.02.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:20:47 -0800 (PST)
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
X-Inumbo-ID: 4537cb7c-b160-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733221250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YKWGDBbWazXWRRISTbTF1ZHM9e0Oj61kFvNUpJ5aQ5c=;
	b=CADZxIgjna0d3as1JXCmsXn46IyOnWm6LAMxtxB0yzzw36KSPIBXNExc8Bxn94/nH0FK0J
	fBx4RB2ys59Q3xtOsCJi1npXn5ccUhm5T07rTxNihpo09+A0lSFNDOf62FmqZ6pogQ549g
	LKEszuvOYK18AcjBw8CL8mZ7JSlvRnA=
X-MC-Unique: 5o-kJoWZOi-tXhPZfYxmUg-1
X-Mimecast-MFC-AGG-ID: 5o-kJoWZOi-tXhPZfYxmUg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221248; x=1733826048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKWGDBbWazXWRRISTbTF1ZHM9e0Oj61kFvNUpJ5aQ5c=;
        b=UvhgZcFq26JxM8qDwOYU8sokbwos4uxrcJpGpdedCOcZmbokUW5v5s2V3k+ndoXksi
         cljHG8tYmy8It8hJffIEoh/vxbZqSGuUwnGACG4TrHljfRAefPxhGPYTTNTMXaEWSGS6
         gfm1YqTBJ3fIYuMO2MDwWpz7YFLnJTXf3nSpjOWYvt76I806229vlPqVcgkpty7gg+w9
         l3HcA3Ss/Ags3l+RQKm/QbA5SpX0c4GwPKtXFUkgkxePT4eRXLlSqLDmEpkzq8CT/UDq
         Tk2eU5LPEcAlahPMWU5HbzTjPf8Bkgls2JG2K687DGYFd7jjmgWJxTexNhh7+O9Ub0pL
         vtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqahENswq+DZ5HCxk6nq1T1rJ2aVKTwdjtdVrteBvUYdLuMPXoVJpoeoQKxfLfatal3srFkTspLgc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBTb1rEEoPnjQuUiX5I2otD8O2RRvE1e8gbBxzH1hVJ/KgV2Zv
	eBA27qdj92dhFUsv+yxTkdVD1k8d6hqtVJKo5mlfnE9j9fHHem2SLw2SWfmqn2vlZM4y++F6AmG
	R2yMWt4P9BcY2vjQ/46SReb2Z52bS7vgjT+OQ0vfqgiA28TzVqj0UrHNiVrzr571m
X-Gm-Gg: ASbGnctBwGMPw0AKXNZes9hF1T5bOKaOXrtWnId3dDoXovICNregGl5k46lFCMXRMLK
	WZ0MrV7f4ZPSN5prhh71JtuRmZxI5oexh/rzLDoaqqchpzmC+CNnvbgYGzupW8NmQua1cylvK8+
	0PFEyOWdjdcKwVEAly4/KaRBgSLHw8FKbmGA/mE/406XgV7+xNShDMH92rFd24NvfmSaJpfSyWM
	sERjcD0SYAY5s/sUOJBdqVe6n3nh6xbeugWe8G9c+2YRKBVBTBmFx89J0vjjHd4QlA6ioUwmU6i
	ti4T4Q==
X-Received: by 2002:a05:620a:4622:b0:7b6:7030:5125 with SMTP id af79cd13be357-7b6a671c791mr271864785a.21.1733221248411;
        Tue, 03 Dec 2024 02:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmVZ3ON9eIn5dL8E5BQTHAgs0mmQUW6ex3+h04ZvNnq/PhqrDf+t126oQ7tGNKj/ag+YHQzw==
X-Received: by 2002:a05:620a:4622:b0:7b6:7030:5125 with SMTP id af79cd13be357-7b6a671c791mr271862685a.21.1733221248125;
        Tue, 03 Dec 2024 02:20:48 -0800 (PST)
Message-ID: <94358073-193a-40f1-b625-8722a9de8b29@redhat.com>
Date: Tue, 3 Dec 2024 11:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/functional/test_ppc64_hv: Remove legacy
 '-machine foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gJIOwyJbyTXIFFV5SaL3n3QiHViFphgZ9dJX53RW4KU_1733221248
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
>   tests/functional/test_ppc64_hv.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_ppc64_hv.py b/tests/functional/test_ppc64_hv.py
> index 312248bbfe4..536a433b993 100755
> --- a/tests/functional/test_ppc64_hv.py
> +++ b/tests/functional/test_ppc64_hv.py
> @@ -138,7 +138,8 @@ def do_test_kvm(self, hpt=False):
>           else:
>               append = ''
>           exec_command(self, 'qemu-system-ppc64 -nographic -smp 2 -m 1g '
> -                           '-machine pseries,x-vof=on,accel=kvm '
> +                           '-accel kvm '
> +                           '-machine pseries,x-vof=on '
>                              '-machine cap-cfpc=broken,cap-sbbc=broken,'
>                                       'cap-ibs=broken,cap-ccf-assist=off '
>                              '-drive file=/dev/nvme0n1,format=raw,readonly=on '

Reviewed-by: Thomas Huth <thuth@redhat.com>


