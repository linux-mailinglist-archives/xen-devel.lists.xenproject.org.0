Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A222A6119BC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 19:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432185.684948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooTbu-0001Z1-9s; Fri, 28 Oct 2022 17:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432185.684948; Fri, 28 Oct 2022 17:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooTbu-0001VZ-6P; Fri, 28 Oct 2022 17:57:38 +0000
Received: by outflank-mailman (input) for mailman id 432185;
 Fri, 28 Oct 2022 17:57:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooTbs-0001VT-8I
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 17:57:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooTbj-0000BI-LD; Fri, 28 Oct 2022 17:57:27 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooTbj-0007GZ-Do; Fri, 28 Oct 2022 17:57:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=c1XmoAUQj3+jFBnGeB4GeekYFOj+FFZJbONcyLLcspQ=; b=BzQ6U+EN8+ZxedMiAIZIhXOoNY
	ypgoCymcrhksfp5EFZ3UecTWgkETbMjmTzKTr7mkiqEauLe5Yk1vpqx2k9umGEhlflMubWBY0/B+i
	XW5Vq8O/9+RDC1N7oThhM/gD6iMQ4kgVLMqfw4BM/bZXnVFz3debQC/D+lKu395+fVxs=;
Message-ID: <7da20a2e-81e0-b3ad-c2d6-6012fa7edee2@xen.org>
Date: Fri, 28 Oct 2022 18:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com> <87wn8l3d3r.fsf@linaro.org>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <87wn8l3d3r.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/10/2022 09:02, Alex Bennée wrote:
> 
> Vikram Garhwal <vikram.garhwal@amd.com> writes:
> 
> <snip>
>> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
>> TPM emulator and connects to swtpm running on host machine via chardev socket
>> and support TPM functionalities for a guest domain.
>>
>> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>
>> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
>> provides access to TPM functionality over socket, chardev and CUSE interface.
>> Github repo: https://github.com/stefanberger/swtpm
>> Example for starting swtpm on host machine:
>>      mkdir /tmp/vtpm2
>>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> <snip>
>> +static void xen_enable_tpm(void)
>> +{
>> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
>> +#ifdef CONFIG_TPM
>> +    Error *errp = NULL;
>> +    DeviceState *dev;
>> +    SysBusDevice *busdev;
>> +
>> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
>> +    if (be == NULL) {
>> +        DPRINTF("Couldn't fine the backend for tpm0\n");
>> +        return;
>> +    }
>> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
>> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
>> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> 
> I'm not sure what has gone wrong here but I'm getting:
> 
>    ../../hw/arm/xen_arm.c: In function ‘xen_enable_tpm’:
>    ../../hw/arm/xen_arm.c:120:32: error: ‘GUEST_TPM_BASE’ undeclared (first use in this function); did you mean ‘GUEST_RAM_BASE’?
>      120 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
>          |                                ^~~~~~~~~~~~~~
>          |                                GUEST_RAM_BASE
>    ../../hw/arm/xen_arm.c:120:32: note: each undeclared identifier is reported only once for each function it appears in
> 
> In my cross build:
> 
>    # Configured with: '../../configure' '--disable-docs' '--target-list=aarch64-softmmu' '--disable-kvm' '--enable-xen' '--disable-opengl' '--disable-libudev' '--enable-tpm' '--disable-xen-pci-passthrough' '--cross-prefix=aarch64-linux-gnu-' '--skip-meson'
> 
> which makes me wonder if this is a configure failure or a confusion
> about being able to have host swtpm implementations during emulation but
> needing target tpm for Xen?

I was also wondering where is that value come from. Note that the 
memory/IRQ layout exposed to the guest is not stable.

Are we expecting the user to rebuild QEMU for every Xen versions (or 
possibly every guest if we ever allow dynamic layout in Xen)?

Cheers,

-- 
Julien Grall

