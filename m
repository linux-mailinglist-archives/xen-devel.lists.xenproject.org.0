Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D947D9421
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624323.972811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJRz-0002KG-2I; Fri, 27 Oct 2023 09:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624323.972811; Fri, 27 Oct 2023 09:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJRy-0002Hl-Vh; Fri, 27 Oct 2023 09:48:18 +0000
Received: by outflank-mailman (input) for mailman id 624323;
 Fri, 27 Oct 2023 09:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJRx-0002Hf-C0
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:48:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f31731bb-74ad-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 11:48:15 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so1290048f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:48:15 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5949000000b00326f5d0ce0asm1389222wri.21.2023.10.27.02.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:48:14 -0700 (PDT)
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
X-Inumbo-ID: f31731bb-74ad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698400095; x=1699004895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=30VwI2HQrqCL5YyhF8qmfbeeHlzGfWBEtfc4fCXo8Fs=;
        b=ghvQJP/cSukx4GztB+T6CP9VyAYjMG5s2K72XcLvs5GNjS5WMn5DNTNAbPhH5y5HFT
         SrPqyo3pNcC8pC7gkA+NLEE6SXQ9e8dQ9rZ6u24EnLwt8VmkzFxIXjHVUcLHmWl01Qqb
         TJI8G975AhJmyuzcY9WQMtlceVoHGTBVduTYLV+Jc2KR2GdxXJMAa3YQsUy1RIK3sHuK
         R28LYqYHuqpM36mBfw4HWmR6zOXzyCjGdUN99nHOKLMWyVeVc9vayWVgyyZv87kSPPwM
         64Rdmchhj8A5/H48Jy4eLrz8Cfvtt0dyIAKmZG6mDu8W2x49mynNlWpiDKjMXFgl5pDi
         aZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698400095; x=1699004895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30VwI2HQrqCL5YyhF8qmfbeeHlzGfWBEtfc4fCXo8Fs=;
        b=sFYYsVRlzpO2zYVA7kmjCa9aLDXr88XSL2G5TNaoiNptbi/PFLXWvrwsAQeb3hoZk6
         J8LuohhS/lkg/XV5ajTckWcNgOlbrUrZth9KcfojdOPs+VWL5KfTwrxBN39trs/HcqWn
         9jZCdTE1wUVoUGIXnJQQXgIS2ZDMNUQ1AseZXScosCHxO4+BZmSF3IqUqfxUfOUSP2vu
         DtplF82LwuUk8wuxWi69/wFq/Fnqu1YJKV8i2o2IE7Hu1TkcIGQItAa526li8xeYc9VA
         mRaeTuEN1QJpibr99aaoAlX4sDvcH2pez569Rz3Vyx+5qx+tE530Yq/Up4lT/CvLnCPd
         fe5A==
X-Gm-Message-State: AOJu0YztekjQCrwEckAEjxU0z0tnVPWoaccsBMAfn0x2ctkcyUjvtFRY
	OyKaWMWPDd0lb6MFQ5ZnNKM=
X-Google-Smtp-Source: AGHT+IE4PpSyRDRjuLCwnnRqMs4Ez7+O/3yvQMMGSADruwPllbL3a4A8idM4xcMnD9poi1dGJZ1Jjg==
X-Received: by 2002:a05:6000:1361:b0:32d:9b80:e2c6 with SMTP id q1-20020a056000136100b0032d9b80e2c6mr1636403wrz.26.1698400094647;
        Fri, 27 Oct 2023 02:48:14 -0700 (PDT)
Message-ID: <322697f1-c4fe-40ab-88ce-f99f9d1fe4d6@gmail.com>
Date: Fri, 27 Oct 2023 10:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 26/28] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-27-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-27-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Eliminate direct access to nd_table[] and nb_nics by processing the the
> ISA NICs first and then calling pci_init_nic_devices() for the test.
> 
> It's important to do this *before* the subsequent patch which registers
> the Xen PV network devices, because the code being remove here didn't
> check whether nd->instantiated was already set before using each entry.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c                | 21 +++++++++++----------
>   include/hw/net/ne2000-isa.h |  2 --
>   2 files changed, 11 insertions(+), 12 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


