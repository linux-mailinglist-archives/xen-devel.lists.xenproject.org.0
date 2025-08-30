Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABAB3CB0E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 15:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102910.1455045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usLFN-0007to-CA; Sat, 30 Aug 2025 13:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102910.1455045; Sat, 30 Aug 2025 13:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usLFN-0007rF-93; Sat, 30 Aug 2025 13:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1102910;
 Sat, 30 Aug 2025 13:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5XJ=3K=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1usLFM-0007r9-5Q
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 13:03:56 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8579315-85a1-11f0-8adc-4578a1afcccb;
 Sat, 30 Aug 2025 15:03:54 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f6017004dso2731059e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 06:03:54 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc162sm1407762e87.6.2025.08.30.06.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Aug 2025 06:03:53 -0700 (PDT)
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
X-Inumbo-ID: c8579315-85a1-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756559034; x=1757163834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/e6yOZ60rC83U2r9TD49Ne5x7/TAXNJaSLaHe1DPrY=;
        b=nVzT7msTURAOtKH6NMydd9zlx2YyM5Y99dWkC6gJkXguyzBeqVnrKOs3eMezpba6Wu
         4RtOzEGPmlORan6CxPeFkPdIVc/tIGWM6IESGIkpug5hcsnzVZpni+m/Oi6Rlo6aZPrU
         dLl/AywZvfxR9/RmMXQ17B+T9m5ve/UMsQJn7agY8xvae2TxgeMfyRrpaGBoByadVK+5
         GB8BUCki8Pd+Q3RMccebXoiOi/53SYNAlGius8tZJFKVW6Bj004DaHatk8uA0ucGybGP
         f7UZgrJ/JKSactFznHSuuBW8sO1N5sYfdrWyL7gq5bms1gZevvLGu6HGX10lTlzeXY6n
         injA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756559034; x=1757163834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/e6yOZ60rC83U2r9TD49Ne5x7/TAXNJaSLaHe1DPrY=;
        b=q3F1myTf5NwSBK6qKPmvUh/XEbxHLhE5nk/mVCo7GA1X4owfqU8I6wiU1ji8YPCwW3
         bPyWDhBVwCisx6a+cu6yqcNdxclpKWAdlkLumR7+SQqSpjAu7/LdMDHLPZYW4je8kcOD
         AHgP6+k93AQO3X6x9F/tjs1FxtjKY6/bzgD2IPUlaKou6v5scRKWmPu72efbVy9HGkMa
         fPE5ciks5v/k0hkzaZ/+hpVLtw3IRYQqpWP8LQ5EtluGSEQYmXtjCF8NlSgF8l5fHqBg
         gepaNEo41TvAddQV9e+PpZ3AW+u2cLi1kAfvf1blyD4nqH8sfqZu4TwyVjVoZckO+mMK
         8mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMcB1xrqbmVhKc50XSbbngSjxxNEfHYjmXLMgQTPy4wt596FG1rW70Yo/ORnB+5tyYcRd2KSRpZC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKUF1YKaj0eGuyaAjBHZQE7RSxN5050CyIJe96B+3s3hd2hn4x
	kZ/Jg7T/EqtZ1PWlYh9Yz+KlQw3JhUOqQQiQ4j2ZDNug3rsCJAtPWb4l
X-Gm-Gg: ASbGncvVd8HSsTEGkNAMMBXbU81PDSW3umdhfJO58PYlYBY/WzlJXSBS8KGcHsIBXlp
	PiHfhmfHqZKQ6Cpru7yeabLBSZOrFv8axdEt3hel25FxRi0sfixpd9gnU9W1YWIFPryrA1lUecX
	Is3XKpcw6oJdnsnsaM/7ZSRk1K5Cu9PmnnzE6QPMysGVU0xy4/6x+Jah3rDNgaY45/GfA9MxB16
	dznChVVohd5MECN3ZsPt9vg51Yc09fS6TbKC/uYdH4PziTHduUICzKt1LuDb7Z9Nrc3oJWMF/yQ
	wUXVr1IvCFxfbLji7tcZ9g0nTin9oS+4hjzeGvSYGMOn/9E+c6Q5FVP5TtH1wpDAlw5VOi2Hz6c
	ZdQ3+5lKFCBJQ9HQo2QQb1uXZN7rRw7kzEubB
X-Google-Smtp-Source: AGHT+IFt4LUO1Mr/VAoSg22hH8dzkPJrNqMI9LbNYeg7KdXWAAZGaBeOM+/IBj1ZpOYKiga0f2dDMA==
X-Received: by 2002:a05:6512:eaa:b0:55f:6f1b:24f3 with SMTP id 2adb3069b0e04-55f708b1517mr500546e87.15.1756559033608;
        Sat, 30 Aug 2025 06:03:53 -0700 (PDT)
Message-ID: <411b4b20-3f9d-409b-939a-c307dc460c4f@gmail.com>
Date: Sat, 30 Aug 2025 16:03:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <17e009a131e54ad68f0a182b1766d333cf1c63f8.1756399156.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <17e009a131e54ad68f0a182b1766d333cf1c63f8.1756399156.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.08.25 19:40, Oleksii Moisieiev wrote:

Hello Oleksii

the patch lgtm, just some NITs

> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add documentation section for Simple Arm SCMI over SMC calls forwarding
> driver (EL3).
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v6:
> - add link to the scmi bindings used in the doc
> - remove mentions about HVC calls from doc
> - rename cmdline parameter to scmi-smc-passthrough
> 
> Changes in v5:
> - rename dom0_scmi_smc_passthrough in documentation
> 
>   .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
>   docs/hypervisor-guide/arm/index.rst           |   9 +
>   docs/hypervisor-guide/index.rst               |   1 +
>   3 files changed, 190 insertions(+)
>   create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>   create mode 100644 docs/hypervisor-guide/arm/index.rst
> 
> diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> new file mode 100644
> index 0000000000..4394c95431
> --- /dev/null
> +++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> @@ -0,0 +1,180 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +ARM System Control and Management Interface (SCMI)
> +==================================================
> +
> +The System Control and Management Interface (SCMI) [1], which is a set of operating
> +system-independent software interfaces that are used in system management. SCMI currently
> +provides interfaces for:
> +
> +- Discovery and self-description of the interfaces it supports
> +- Power domain management
> +- Clock management
> +- Reset domain management
> +- Voltage domain management
> +- Sensor management
> +- Performance management
> +- Power capping and monitoring
> +- Pin control protocol.
> +
> +The SCMI compliant firmware could run:
> +
> +- as part of EL3 secure world software (like Trusted Firmware-A) with
> +  ARM SMC shared-memory transport;
> +- on dedicated System Control Processor (SCP) with HW mailbox shared-memory transport
> +
> +The major purpose of enabling SCMI support in Xen is to enable guest domains access to the SCMI
> +interfaces for performing management actions on passed-through devices (such as clocks/resets etc)
> +without accessing directly to the System control HW (like clock controllers) which in most cases
> +can't shared/split between domains. Or, at minimum, allow SCMI access for dom0/hwdom (or guest

NIT: can't be shared

> +domain serving as Driver domain).
> +
> +The below sections describe SCMI support options available for Xen.
> +
> +| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
> +| [2] `System Control and Management Interface (SCMI) bindings <https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml>`_
> +
> +Simple SCMI over SMC calls forwarding driver (EL3)
> +------------------------------------------------------
> +
> +The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pretty generic case for
> +the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI firmware supports only
> +single SCMI OSPM transport (agent) with Shared memory based transport and SMC calls as doorbell.
> +
> +The SCMI over SMC calls forwarding driver solves major problem for this case by allowing
> +SMC calls to be forwarded form guest to the EL3 SCMI firmware.


NIT: s/form/from

> +
> +By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
> +
> +::
> +
> +    +--------------------------+
> +    |                          |
> +    | EL3 SCMI FW (TF-A)       |
> +    ++-------+--^--------------+
> +     |shmem  |  | smc-id
> +     +----^--+  |
> +          |     |
> +     +----|-+---+---+----------+
> +     |    | |  FWD  |      Xen |
> +     |    | +---^---+          |
> +     +----|-----|--------------+
> +          |     | smc-id
> +     +----v-----+--+ +---------+
> +     |             | |         |
> +     | Dom0/hwdom  | | DomU    |
> +     |             | |         |
> +     |             | |         |
> +     +-------------+ +---------+
> +
> +
> +The SCMI messages are passed directly through SCMI shared-memory (zero-copy) and driver only
> +forwards SMC calls.
> +
> +Compiling
> +^^^^^^^^^
> +
> +To build with the SCMI over SMC calls forwarding enabled support, enable Kconfig option
> +
> +::
> +
> +    CONFIG_SCMI_SMC

NIT: I think, if we mention Kconfig option, then s/CONFIG_SCMI_SMC/SCMI_SMC

> +
> +The ``CONFIG_SCMI_SMC`` is enabled by default.
> +
> +Pass-through SCMI SMC to domain which serves as Driver domain
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +This section describes how to configure the SCMI over SMC calls forwarding driver to handle use
> +case "thin Dom0 with guest domain, which serves as Driver domain". In this case HW need to be
> +enabled in Driver domain and dom0 is performing only control functions (without accessing FW) and so,
> +the SCMI need to be enabled in Driver domain.
> +
> +::
> +
> +     +--------------------------+
> +     |EL3 SCMI FW (TF-A)        |
> +     |                          |
> +     +-------------^--+-------+-+
> +             smc-id|  |shmem0 |
> +                   |  +----^--+
> +    +-------------++------+|----+
> +    |Xen          |  FWD  ||    |
> +    |             +--^----+|    |
> +    +----------------|-----|----+
> +              smc-id |     |
> +    +-----------+ +--+-----v-----+
> +    |           | |              |
> +    | Dom0      | |    Driver    |
> +    | Control   | |    domain    |
> +    |           | |              |
> +    +-----------+ +--------------+
> +
> +The SCMI can be enabled for one and only one guest domain.
> +
> +First. configure Dom0 to enable SCMI pass-through using Xen Command Line

NIT: First,

> +**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom and SCMI nodes will
> +be removed from Dom0/hwdom device tree.
> +
> +**Configure SCMI pass-through for guest domain with toolstack**
> +
> +* In domain's xl.cfg file add **"arm_sci"** option as below
> +
> +::
> +
> +    arm_sci = "type=scmi_smc"
> +
> +* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
> +
> +::
> +
> +    iomem = [
> +        "47ff0,1@22001",
> +    ]
> +
> +.. note:: It's up to the user to select guest IPA for mapping SCMI shared-memory.
> +
> +* Add SCMI nodes to the Driver domain partial device tree as in the below example:
> +
> +.. code::
> +
> +    passthrough {
> +       scmi_shm_0: sram@22001000 {
> +           compatible = "arm,scmi-shmem";
> +           reg = <0x0 0x22001000 0x0 0x1000>;
> +       };
> +
> +       firmware {
> +            compatible = "simple-bus";
> +                scmi: scmi {
> +                    compatible = "arm,scmi-smc";
> +                    shmem = <&scmi_shm_0>;
> +                    ...
> +                }
> +        }
> +    }
> +
> +Please refer to [2] for details of SCMI DT bindings.
> +
> +In general, the configuration is similar to any other HW pass-through, except explicitly
> +enabling SCMI with "arm_sci" xl.cfg option.
> +
> +**Configure SCMI pass-through for predefined domain (dom0less)**
> +
> +* add "xen,sci_type" property for required DomU ("xen,domain") node
> +
> +::
> +
> +       xen,sci_type="scmi_smc"
> +
> +* add scmi nodes to the Driver domain partial device tree the same way as above and enable access
> +  to the "arm,scmi-shmem" according to  dom0less documentation. For example:
> +
> +.. code::
> +
> +      scmi_shm_0: sram@22001000 {
> +            compatible = "arm,scmi-shmem";
> +            reg = <0x00 0x22001000 0x00 0x1000>;
> +    ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
> +    ->        xen,force-assign-without-iommu;
> +      };

[snip]


