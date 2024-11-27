Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FED9DA30F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 08:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844480.1259985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCRP-0001WU-Sv; Wed, 27 Nov 2024 07:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844480.1259985; Wed, 27 Nov 2024 07:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCRP-0001TW-P4; Wed, 27 Nov 2024 07:26:27 +0000
Received: by outflank-mailman (input) for mailman id 844480;
 Wed, 27 Nov 2024 07:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGCRN-0001TK-Pk
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 07:26:25 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e583b854-ac90-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 08:26:19 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38241435528so4055968f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 23:26:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7d1a90sm11745985e9.32.2024.11.26.23.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 23:26:18 -0800 (PST)
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
X-Inumbo-ID: e583b854-ac90-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1ODNiODU0LWFjOTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjkyMzc5Ljk4MjE4OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732692379; x=1733297179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJ+SaTNP9GuzWMj+dBTxdESYt9FOdMe9CsWL5Gn4nA=;
        b=DMBYI6Q8PAdRwYfosy9mI5kVSGJd3MRWDNh7iBdk74qoR7E7xPsA14pTV8vV900hUJ
         LJL6ijgPTsMq8773EDI9YxgbvXzqXbxGcGD9GzTnkCbr6TjX+Co9+OXVfx4UCr316zET
         idDKdIw39UJcIhg2QSO8pOUJfHnCm69TNNRWjc3elpLl9HOsklDbAtvKtiQKlCxYdBk1
         aKKOq9osPyMPcyrZeoIS2EB7ZJDHDayTe+KQwJmfoC5YEKEbrKacSIGirnf6M+0Zbtmt
         qohqUIn70ojMkNE8cDm+uFPW26Bd7WSrqj8HRNS2aZ9JFEdFK+9HuJ+UtRg+0O223M2H
         weJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692379; x=1733297179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoJ+SaTNP9GuzWMj+dBTxdESYt9FOdMe9CsWL5Gn4nA=;
        b=nTswctLdIOK1ON5uR6rONvPZxVa++FYRzjKBkg53N6NYbn0Vq/Hyr+vGW2uTCXFDGj
         176MsCcKJmGJkmezaN7YELKjuzXdl0p0Yr3KR+uEFaRee0ngIFBaImZyqFIYUC+nwGFU
         gcM9OtFWHhuDhNgfAgTG3vZ597lWJ73lnXJv9Xkdrvwn4Y/Du7BtUQ8642irEvNkI6WK
         uykVTfSBpwP6vdJDy1a4JUPEG2gA3XsnqWBGKzHE/SwLw3ohNOVNoKI2Dnj9bhZjDuVa
         DxSwToJYet6iimyJQ5QZo+Z2JjNdyS9MWuOQI2FQ8jYcs9oL37q8UwMdcxPs6ERIDGPy
         Ds5w==
X-Gm-Message-State: AOJu0Yz/7FckWHdIrYfaU5VRCNQ4zYgHuRYjuoor/Z7S9olMoAp2QcyT
	XAhw2+/YpyEAy2fj9bxeYeTm4E3S4AzqBjfeBWcVGQ35KDHj5bypLVXMfm1PGw==
X-Gm-Gg: ASbGnctLhvJh+c6lZDzxoY7cWSauH37NFil7G4PBCvXR2KxTEUgI6FpTcR2pQA55/ES
	BORf/3rYde9Xtap7CBZnVOSqZKA1Oy5Iz/UixeHxN6qdy+jM8dXXG2W4CDgm4JerY9ZpM3drGxi
	ch6eD4QDNfghREcMJYR4RxnSHotNaugD1yBAeVHEaEkLFmtf506cfSr7HxcsjCf8dkEDbzDXkd9
	/BxiklL+3s3JcbktcLhoJjK58godoTR3vVobb15LqsO73yfwhGCFaT7JjXiDB2aD0EyItK/8fa7
	LTfx+/fcCMUKXw26FL4RaKzaImVXFrX6PPQ=
X-Google-Smtp-Source: AGHT+IEVxUuITR/wzyFw6qIoT0c3oit0CVnTDSvtSeM3xER/wmrXowTqiP+WvfpMdZAvTPbFh+lgDw==
X-Received: by 2002:a05:6000:2d07:b0:382:372a:5718 with SMTP id ffacd0b85a97d-385c6ec02cemr966412f8f.26.1732692379309;
        Tue, 26 Nov 2024 23:26:19 -0800 (PST)
Message-ID: <298c4fb8-4879-4471-90c0-3a4aa0151686@suse.com>
Date: Wed, 27 Nov 2024 08:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/36] Introduce NS8250 UART emulator
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Connor Davis <connojdavis@gmail.com>, Juergen Gross <jgross@suse.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 David Scott <dave@recoil.org>, Rahul Singh <rahul.singh@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
 <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.11.2024 00:57, Andrew Cooper wrote:
> On 26/11/2024 11:21 pm, Denis Mukhin via B4 Relay wrote:
>> The patch series introduces initial in-hypervisor emulator for
>> NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
>>
>> In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
>> early guest OS bringup debugging, because it eliminates dependency on the
>> external emulator being operational by the time domains are created. Also,
>> there's no early console facility similar to vpl011 to support x86 guest OS
>> bring up.
>>
>> The NS8250 emulator is disabled by default.
>>
>> Series
>> ======
>> - patches 1-2: some miscellaneous random fixes, added into the series
>>   because I stepped into those while debugging NS8250 emulator.
>>
>> - patches 3-14: preparation fixes for xen console and NS8250 emulator.
>>
>> - patches 15-29: xen console driver cleanup and preparation for enabling
>>   physical serial console focus assignment to the guest VM w/ virtual NS8250.
>>
>> - patches 30-36: initial NS8250 emulator. That adds the I/O port emulator
>>   for legacy PC COM UARTs, Kconfig option, enabling emulator and libxl
>>   plumbing.
>>
>> Limitations
>> ===========
>> - Only x86;
>> - Only Linux guest tested so far;
>> - Only legacy COM{1,2,3,4} resources, no customization;
>> - Only Xen console as a backend, no inter-domain communication (similar to
>>   vpl011 on Arm);
>> - Only 8-bit characters;
>> - Baud rate is not emulated;
>> - FIFO-less mode is not emulated properly;
>> - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
>>   has special FCR handling;
>> - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
>>   friends);
>> - Assumes no ISA-device IRQ sharing;
>> - MMIO-based UART is not supported.
>>
>> Testing
>> =======
>>
>> I tested boot of HVM linux guest w/ OVMF as the virtual firmware.
>>
>> The emulator, if enabled via CONFIG_HAS_VUART_NS8250=y, will use COM1 (0x3f8)
>> resources by default.
>>
>> To test w/ virtual COM1, the guest kernel parameters should contain
>>   earlycon=uart,io,0x3f8,115200n8 console=uart,io,0x3f8,115200n8
>>
>> Xen is able to forward physical console input to the domain w/ virtual NS8250.
>> To switch the console focus press Ctrl+aaa. If console= is given to the HVM
>> kernel, then the user shall be able to see the login prompt on xen console once
>> console focus is switched to the HVM guest.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Hello,
> 
> Thankyou for this.  It's an excellent start for first posting to the list.

+1

> Two things stand out at a glance.
> 
> First, xmalloc/free are the expected functions to use,

Small correction - as of their introduction, it's xvmalloc() etc and xvfree()
which are to be used in new code.

One other, more general remark: Please send patches To: the list, with
maintainers Cc-ed. And please compose the Cc: lists per-patch - looking at
patch 2, there should really have been just a single person (Daniel) on Cc.

Jan

