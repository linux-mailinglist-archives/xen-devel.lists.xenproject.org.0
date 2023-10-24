Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D607D56A3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622123.969360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJSo-0005oF-Uo; Tue, 24 Oct 2023 15:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622123.969360; Tue, 24 Oct 2023 15:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJSo-0005m1-SA; Tue, 24 Oct 2023 15:37:02 +0000
Received: by outflank-mailman (input) for mailman id 622123;
 Tue, 24 Oct 2023 15:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvJSn-0005lv-A4
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:37:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bdd2cbb-7283-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:37:00 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4084f682d31so34104955e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:36:59 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a05600c179800b0040523bef620sm785126wmo.0.2023.10.24.08.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:36:58 -0700 (PDT)
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
X-Inumbo-ID: 2bdd2cbb-7283-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698161819; x=1698766619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8ZSzBnis7KNXr8T2w9cXrHfqOor5r4c/mfSgp7VlQs=;
        b=duo9hkwr4MZqsOR9kzWZSv9E66z7eVfnA/Pymi0qwVQkVTf3N7EkYAyrdA5GCpqbRH
         SsJITyeLvG6SK0BQXgtQdSMt7WFK2271TiuSZdXDEnGOGbFFCnyKjG7DoSIzAolKy7RM
         95Sb8p/pNs0XR3D507DiMSnE7QewFCagQSiIAHFkT3+l+QYDKPK69FGblm/jF3kh8sPb
         9uQgqgiLb8E69xIT8JUFfoDnpP5IVozHjjS8LHGnwzTjuiu6ccoJRyuPOY/G/Mrj7caw
         mRdxAM+yBDAfFZh533WO7vSWig6lvEp6UhvAWo2y3zfFBjnFE/pLP1xWM0ARU7JsvKHa
         Oi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698161819; x=1698766619;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8ZSzBnis7KNXr8T2w9cXrHfqOor5r4c/mfSgp7VlQs=;
        b=KJT4YkXxbNeM3maVK+1O/+8NN3zjgFGtThBWo6Z/k4K+tmRXXj7vdQK/f2vgwdDvZ+
         4TCR6lH+hscdqzkERdtiaWbNve3tGfZS0NdUe/ZUOkaRrbDPMszTlIjxpMaqNVV1yVyp
         3XQyO/xumjfQZzCxzyK1uLiVH9SJ5Zoxg2MQZo+IuOnMmjokEp6FTQAmCCZT6mFZy5lD
         M4jB0lvbuTdY+Ru2TErziXGOoCd0xXjGOI93pKCyvYcFJ8IHj4/cmZYmqs/k2YP+kbQb
         rIrxKbdTj51LKpwOdJy5yReBtaov/EFnJD2A9a+MGaFx5Z+WGPQvXqtcsHEMbiJ4P3iQ
         cNGw==
X-Gm-Message-State: AOJu0YyjnYWOVd5rMR7JJQuC/YkzC9mCx5XocU1rfBaAT5hkEEUdccfo
	V+A6Z3C2EJNqWB1g1oy3+qg=
X-Google-Smtp-Source: AGHT+IF1dcmYSOIBAYhyDN+rJjDUtbiR7bpGX9yxUQ7nJ0qnc13saq8mF6pQ7QGMUfeqrZmcr7qgJw==
X-Received: by 2002:a05:600c:1d19:b0:401:b2c7:349b with SMTP id l25-20020a05600c1d1900b00401b2c7349bmr9736055wms.7.1698161819005;
        Tue, 24 Oct 2023 08:36:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <979ce4f2-195c-4488-869e-72c9abed1339@xen.org>
Date: Tue, 24 Oct 2023 16:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 10/24] hw/xen: populate store frontend nodes with
 XenStore PFN/port
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
 <20231019154020.99080-11-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231019154020.99080-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 16:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is kind of redundant since without being able to get these through
> some other method (HVMOP_get_param) the guest wouldn't be able to access
> XenStore in order to find them. But Xen populates them, and it does
> allow guests to *rebind* to the event channel port after a reset.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


