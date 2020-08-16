Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8769024595C
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 21:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7OQX-0000i5-U4; Sun, 16 Aug 2020 19:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehYN=B2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k7OQV-0000i0-KM
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 19:34:43 +0000
X-Inumbo-ID: 34e0a62e-69f4-47dc-88ba-fd71826085cd
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34e0a62e-69f4-47dc-88ba-fd71826085cd;
 Sun, 16 Aug 2020 19:34:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c15so7305157lfi.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2020 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Hssf5bTAeCC3iC4yBoGEIvQW1Ak4BQC6mHdvhUA+Qoo=;
 b=LrP1+1VtJYwx+DtspX72/BcYz9a9nGCmth8dpCE/pPHE5kzZu3M1iP3ZlWVMlBP7yE
 WVqqSoNJuuk0q8EpSIKk272p7l4z1SuZdc/+q3y87itcVUxgfZdwDhKOcEQDIedMv3TW
 HKPzNcl3o7sJUQNcwyzkZtdPRmzxOkyeavnDrXy8OL0iZihS4VsJgWODuSlZC9n4+CtK
 c5Qv41PB9la8FYTCC9REmuf3l4PQ6jEnOzFW3aKXJk445KSsgULMriiEMa9E82pO27iT
 /2YOEp0VDntCvQfgjvUpTWYtffyeMiDlwDd5frfOPEGJ5rtYZcZ9tq7GuzSD/ZJrv7QH
 ED2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hssf5bTAeCC3iC4yBoGEIvQW1Ak4BQC6mHdvhUA+Qoo=;
 b=M9ggTbwPCvUwGAN54dkgJsiu3Luv9i74YB0r1c6/FMh3llPQCU6fsPIOGn1+u+P5x9
 wNczHOHQXGVGsAISNkMY0qFYTRmmUikxMMTTUhYuJi664JyiixXHOQcoAfh+lgQgoJdo
 PFha8mPl+0GWTjfZexs7rBrxYXu0w6X7l0+9QpfZOq4cjtEGswxzCdFmtVtXYdok+4+a
 xfYrkjWNV52uuNXiYq+7IbVO7UrNkLSLRxUC8jDu/SsMCgGC1THp3TkkbYjOlJOSLIXd
 PPubN7Kcv4BkKrQgjtTy2O/cFBNwDEgMI9GPVbJ+Q67uztURa5Viv03upVYZ+c+B54gn
 qhFw==
X-Gm-Message-State: AOAM530GyA4RI6tD+p4UHW1AS64Iy0Tv7NAO0RCCabDb5k6qSSJC9tcC
 gW6L3JnbmBpjrB9BJVU9TCI=
X-Google-Smtp-Source: ABdhPJx469jLvhkv/eV/9V6eSvH42LhfcQK6kFC0YcyIgf6i/CZGNKMb7Mxfsx2jtTcMWc+Or9ifEg==
X-Received: by 2002:ac2:546f:: with SMTP id e15mr6123205lfn.133.1597606481455; 
 Sun, 16 Aug 2020 12:34:41 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t1sm4399045lfc.52.2020.08.16.12.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2020 12:34:40 -0700 (PDT)
Subject: Re: [RFC PATCH V1 00/12] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <5b6dcf57-ab0d-a4cd-654e-9f5007e84a63@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <474dc5c4-1237-ba72-558f-5be09467662c@gmail.com>
Date: Sun, 16 Aug 2020 22:34:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b6dcf57-ab0d-a4cd-654e-9f5007e84a63@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 15.08.20 20:24, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.


>
> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Hello all.
>>
>> The purpose of this patch series is to add IOREQ/DM support to Xen on 
>> Arm.
>> You can find an initial discussion at [1]. Xen on Arm requires some 
>> implementation
>> to forward guest MMIO access to a device model in order to implement 
>> virtio-mmio
>> backend or even mediator outside of hypervisor. As Xen on x86 already 
>> contains
>> required support this patch series tries to make it common and 
>> introduce Arm
>> specific bits plus some new functionality. Patch series is based on 
>> Julien's
>> PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
>> Besides splitting existing IOREQ/DM support and introducing Arm side,
>> the patch series also includes virtio-mmio related changes (toolstack)
>> for the reviewers to be able to see how the whole picture could look 
>> like.
>> For a non-RFC, the IOREQ/DM and virtio-mmio support will be sent 
>> separately.
>>
>> According to the initial discussion there are a few open 
>> questions/concerns
>> regarding security, performance in VirtIO solution:
>> 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require 
>> different
>>     transport...
>> 2. virtio backend is able to access all guest memory, some kind of 
>> protection
>>     is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys 
>> in guest'
>> 3. interface between toolstack and 'out-of-qemu' virtio backend, 
>> avoid using
>>     Xenstore in virtio backend if possible.
>> 4. a lot of 'foreing mapping' could lead to the memory exhaustion, 
>> Julien
>>     has some idea regarding that.
>>
>> Looks like all of them are valid and worth considering, but the first 
>> thing
>> which we need on Arm is a mechanism to forward guest IO to a device 
>> emulator,
>> so let's focus on it in the first place.
>>
>> ***
>>
>> Patch series [2] was rebased on Xen v4.14 release and tested on 
>> Renesas Salvator-X
>> board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend (we will 
>> share it later)
>> running in driver domain and unmodified Linux Guest running on existing
>> virtio-blk driver (frontend). No issues were observed. Guest domain 
>> 'reboot/destroy'
>> use-cases work properly. Patch series was only build-tested on x86.
>>
>> Please note, build-test passed for the following modes:
>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
>> 5. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
>>
>> Build-test didn't pass for Arm32 mode with 'CONFIG_IOREQ_SERVER=y' 
>> due to the lack of
>> cmpxchg_64 support on Arm32. See cmpxchg usage in 
>> hvm_send_buffered_ioreq()).
>
> I have sent a patch to implement cmpxchg64() and guest_cmpxchg64() 
> (see [1]).
>
> Cheers,
>
> [1] 
> https://lore.kernel.org/xen-devel/20200815172143.1327-1-julien@xen.org/T/#u

  Thank you! I have already build-tested it. No issues). I will update 
corresponding patch to select IOREQ_SERVER for "config ARM" instead of 
"config ARM64".


-- 
Regards,

Oleksandr Tyshchenko


