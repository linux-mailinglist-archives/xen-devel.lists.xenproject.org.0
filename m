Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4B6DEB65
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 07:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520036.807241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmTCh-0000fw-Ig; Wed, 12 Apr 2023 05:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520036.807241; Wed, 12 Apr 2023 05:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmTCh-0000dm-Fg; Wed, 12 Apr 2023 05:39:35 +0000
Received: by outflank-mailman (input) for mailman id 520036;
 Wed, 12 Apr 2023 05:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tEdO=AD=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pmTCg-0000df-I0
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 05:39:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65eef55e-d8f4-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 07:39:32 +0200 (CEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-JQc_aQzRMJS6h635kSrpkA-1; Wed, 12 Apr 2023 01:39:29 -0400
Received: by mail-ej1-f71.google.com with SMTP id
 r12-20020a1709062ccc00b0092fce91a838so3594910ejr.20
 for <xen-devel@lists.xenproject.org>; Tue, 11 Apr 2023 22:39:29 -0700 (PDT)
Received: from [192.168.8.105] (tmo-096-44.customers.d1-online.com.
 [80.187.96.44]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1709060c1500b0094a85f6074bsm2889674ejf.33.2023.04.11.22.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 22:39:27 -0700 (PDT)
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
X-Inumbo-ID: 65eef55e-d8f4-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681277971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHCdvDKrd6SHmT5+4IxRxVZw2qNaGEXhrgpsq6j6904=;
	b=alIzvP4R9DRwmMLLw7sGq/zhvb+mNNzrNWSmktRTobBXyGMOYn/V+z5Rx/rwKxdm0iHuUF
	K5IOgv7R9DepU+b+9mdUkAd1J3SlFA7hxG6hHDjwVGM3w2TzX2KPwMRQOXI+HzGtspUnWW
	UireaiFfk84teqvuOMiHa6wEJzaMHPA=
X-MC-Unique: JQc_aQzRMJS6h635kSrpkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277968; x=1683869968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHCdvDKrd6SHmT5+4IxRxVZw2qNaGEXhrgpsq6j6904=;
        b=bLh1A+/knq2m7I4kEW5oKh73VQf6lkLeB37+6v2z5jxb/Znc3j1sCaB90VnAmiv3vo
         zX5MSn48Iu80WF1t44v77SEwItqS6D8HNkZmHLCKVhtPC80eawXrPgR9yhRBKDvIWTyg
         XyP2EMQ6WCscg95gc1uGCE79R4vsCgSMhnQ2F7n+NeT/Z0EbCAQyIbUNRp8paWuj4s5w
         HZdm1IwU6xWhZybfevlKz3rAXe1re1CJqpTG/3w0rbRikJZ9eG+DQ8Uc7OZfb+P4M02I
         5bvsL9TZnj5fexPk7sQm3+0a7n1RqocG41KZd+MHSJ1fZNIGQfbnw8kzCc2okcJw+RYo
         uuSA==
X-Gm-Message-State: AAQBX9fXNIaqp1Gzk9jYwkMPbTH7twl5/8I/uDpthZ/Pqi9Y9IIFIUtG
	8FUtxpsjU8iFPsmT6BYzMieZwcdRoQrCJVtX5Gma6TaAkntPfacn1QcJY9/vV/pjcmYZ98NCOsN
	UoK4hG1XtXaonJlYcsnUVztPHC/o=
X-Received: by 2002:a17:906:1401:b0:94e:5224:b21e with SMTP id p1-20020a170906140100b0094e5224b21emr1134981ejc.14.1681277968556;
        Tue, 11 Apr 2023 22:39:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiVhpgQoLUs6/2V6EcX+z/iUJaQs6ANB2YdA1maYchDM3UA/NUeo7RWULN8e+iRtBMgK9+FQ==
X-Received: by 2002:a17:906:1401:b0:94e:5224:b21e with SMTP id p1-20020a170906140100b0094e5224b21emr1134974ejc.14.1681277968264;
        Tue, 11 Apr 2023 22:39:28 -0700 (PDT)
Message-ID: <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
Date: Wed, 12 Apr 2023 07:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230411210422.24255-1-vikram.garhwal@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2023 23.04, Vikram Garhwal wrote:
> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails the
> build for aarch64 target.
> 
> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..6867839248 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>     variables:
>       IMAGE: debian-amd64-cross
>       ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>   
>   cross-arm64-xen-only:
>     extends: .cross_accel_build_job
> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>     variables:
>       IMAGE: debian-arm64-cross
>       ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

This patch looks wrong. I'm pretty sure we wanted to test the build without 
TCG here. Building with TCG enabled is already done in other jobs. So 
instead of removing "--disable-tcg" here the question is rather: Why does it 
not build with this flag anymore? Can those problems be fixed instead?

  Thomas


