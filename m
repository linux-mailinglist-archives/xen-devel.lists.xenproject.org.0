Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B98A94FF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 10:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708112.1106708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNAq-0001oF-E0; Thu, 18 Apr 2024 08:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708112.1106708; Thu, 18 Apr 2024 08:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNAq-0001ly-BL; Thu, 18 Apr 2024 08:31:16 +0000
Received: by outflank-mailman (input) for mailman id 708112;
 Thu, 18 Apr 2024 08:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNAo-0001lq-Og
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 08:31:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034f8474-fd5e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 10:31:12 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so3389395e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 01:31:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0041668053ca9sm5221792wme.0.2024.04.18.01.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 01:31:11 -0700 (PDT)
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
X-Inumbo-ID: 034f8474-fd5e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713429071; x=1714033871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eT9Md9JLobjMIkhFtaJ0Znjb8WrUtQm7VzYLZQ4RmiM=;
        b=V5GPaUwHbfvpKGDZ+fubuzYn509B5rL2lyaXBLiC1TlWSBdbEiqX22PNq0K1YcMEP7
         zJg0ZD36njgrnXUWEBKqjaID0gsuU4lM0uRLKyQ7u0BS5K2f/7RGWb1hynnPVBfcknr0
         MuXTpDM5q/rIm/JDKGG4qm6Qr/MUTia7QATpRoADX83J018v39vp2+GjLS9/BWunuj+p
         nVcDYH9HmUq4e2fE+xO0eilo+am7zPoa1Yd6VJYACqFOyfYXKZPu2nOGp6LVlerrvmDN
         vkEdk4BFDpGVHHdDUOSbxtzlFtqhcFTB6g6b6AzFMtNPnMOl2P/Oj/CE2JhNJX595yM5
         SBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713429071; x=1714033871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eT9Md9JLobjMIkhFtaJ0Znjb8WrUtQm7VzYLZQ4RmiM=;
        b=fMuo7aVTdqFsi72AxgeVc17foSlxkdhdnla/uBtX5Rs56YYQTiM4YIVjWSe7Ov2T50
         PCEQ90ikteUwJ5y59EHATFG9fZsgwpK0c9hYVdCPB1FvneT3O6BdwD90CEh3RXUb9g0i
         tUcha+YODuTJkZFtztUnNjqCaXT0/9ioo+dQKxfnsvQWRtC6VCF1H6fL1eFR6QzF5ZPM
         VxsDdM/aTsDAtRY5rT343i9CBM20ue40L0P/KiAYUQJX0bQOs7920sv2M86pIaZvdtqu
         jyKd2bALNfkhKhiablDmB8GvTrkNw1qbqlX4r6HJvtExsJjxxh4aM7Lx1CL6m2KXEEgB
         jiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjckRx9Um1X80DQFHfhe62KuVKtKRWJwJlnVQfvMTCJfK/8L21EZIardnoCWKiX2LwM3VnnNMCWHPbnWWZSBUDFCEPwGYtJ/aNPcOaaLg=
X-Gm-Message-State: AOJu0YxDTUy6iFSR2dbaom9Bv7EX0O/KGKiZicCIIECyTXAuMhddrxLD
	Zy9StS2HMNc2TN1Wz6/9JR4gt3bZ8R2MBTQdy49ERfUvdyZAhcZdL2Zk3By92A==
X-Google-Smtp-Source: AGHT+IEX/UwLo7EOyOhfOhVoJ1zS7go8PQi303SGBXsX4FWC6tJPMjYpq/e572SLIP/eTI8sfprQmw==
X-Received: by 2002:a05:600c:5116:b0:418:3d59:c13a with SMTP id o22-20020a05600c511600b004183d59c13amr1129064wms.9.1713429071390;
        Thu, 18 Apr 2024 01:31:11 -0700 (PDT)
Message-ID: <00da0528-d63e-4777-b470-df6a7404cc6e@suse.com>
Date: Thu, 18 Apr 2024 10:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Implemented Amd Secure Processor device driver
Content-Language: en-US
To: Andrei Semenov <andrei.semenov@vates.fr>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
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
In-Reply-To: <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2024 17:36, Andrei Semenov wrote:
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>

Again a few nits on top of Andrew's remarks:

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/psp-sev.h
> @@ -0,0 +1,655 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * AMD Secure Encrypted Virtualization (SEV) driver interface
> + *
> + * Copyright (C) 2016-2017 Advanced Micro Devices, Inc.
> + *
> + * Author: Brijesh Singh <brijesh.singh@amd.com>
> + *
> + * SEV API spec is available at https://developer.amd.com/sev
> + */
> +
> +#ifndef __PSP_SEV_H__
> +#define __PSP_SEV_H__
> +
> +#include <xen/types.h>
> +
> +/**
> + * SEV platform and guest management commands
> + */
> +enum sev_cmd {
> +	/* platform commands */
> +	SEV_CMD_INIT			= 0x001,

From the looks of it (style) this file may be coming from Linux. Any file
take from somewhere wants to have its origin specified precisely, to aid
in future updating. (Once again, an empty description is not acceptable
here anyway.)

> --- /dev/null
> +++ b/xen/drivers/crypto/Kconfig
> @@ -0,0 +1,10 @@
> +config AMD_SP
> +        bool "AMD Secure Processor" if EXPERT
> +        depends on X86
> +        default n

No need for this line.

> --- /dev/null
> +++ b/xen/drivers/crypto/asp.c
> @@ -0,0 +1,808 @@
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <xen/list.h>
> +#include <xen/tasklet.h>
> +#include <xen/pci_ids.h>
> +#include <xen/delay.h>
> +#include <xen/timer.h>
> +#include <xen/wait.h>
> +#include <xen/smp.h>
> +#include <asm/msi.h>
> +#include <asm/system.h>
> +#include <asm/psp-sev.h>
> +
> +/*
> +TODO:
> +-  GLOBAL:
> +     - add command line params for tunables
> + - INTERRUPT MODE:
> +    - CET shadow stack: adapt #CP handler???
> +    - Serialization: must be done by the client? adapt spinlock?
> + */
> +
> +#define PSP_CAPABILITY_SEV                      (1 << 0)
> +#define PSP_CAPABILITY_TEE                      (1 << 1)
> +#define PSP_CAPABILITY_PSP_SECURITY_REPORTING   (1 << 7)
> +#define PSP_CAPABILITY_PSP_SECURITY_OFFSET      8
> +
> +#define PSP_INTSTS_CMD_COMPLETE       (1 << 1)
> +
> +#define SEV_CMDRESP_CMD_MASK          0x7ff0000
> +#define SEV_CMDRESP_CMD_SHIFT         16
> +#define SEV_CMDRESP_CMD(cmd)          ((cmd) << SEV_CMDRESP_CMD_SHIFT)
> +#define SEV_CMDRESP_STS_MASK          0xffff
> +#define SEV_CMDRESP_STS(x)            ((x) & SEV_CMDRESP_STS_MASK)
> +#define SEV_CMDRESP_RESP              (1 << 31)

(1u << 31)

> +#define SEV_CMDRESP_IOC               (1 << 0)
> +
> +#define ASP_CMD_BUFF_SIZE    0x1000
> +#define SEV_FW_BLOB_MAX_SIZE 0x4000
> +
> +/*
> + * SEV platform state
> + */
> +enum sev_state {
> +        SEV_STATE_UNINIT                = 0x0,
> +        SEV_STATE_INIT                  = 0x1,
> +        SEV_STATE_WORKING               = 0x2,
> +        SEV_STATE_MAX

Too deep indentation here.

> +};
> +
> +struct sev_vdata {
> +    const unsigned int cmdresp_reg;
> +    const unsigned int cmdbuff_addr_lo_reg;
> +    const unsigned int cmdbuff_addr_hi_reg;
> +};
> +
> +struct psp_vdata {
> +    const unsigned short   base_offset;
> +    const struct sev_vdata *sev;
> +    const unsigned int feature_reg;
> +    const unsigned int inten_reg;
> +    const unsigned int intsts_reg;
> +    const char* name;
> +};
> +
> +static struct sev_vdata sevv1 = {
> +    .cmdresp_reg         = 0x10580,     /* C2PMSG_32 */
> +    .cmdbuff_addr_lo_reg = 0x105e0,     /* C2PMSG_56 */
> +    .cmdbuff_addr_hi_reg = 0x105e4,     /* C2PMSG_57 */
> +};
> +
> +static struct sev_vdata sevv2 = {
> +    .cmdresp_reg         = 0x10980,     /* C2PMSG_32 */
> +    .cmdbuff_addr_lo_reg = 0x109e0,     /* C2PMSG_56 */
> +    .cmdbuff_addr_hi_reg = 0x109e4,     /* C2PMSG_57 */
> +};
> +
> +static struct psp_vdata pspv1 = {
> +    .base_offset = PCI_BASE_ADDRESS_2,
> +    .sev         = &sevv1,
> +    .feature_reg = 0x105fc,     /* C2PMSG_63 */
> +    .inten_reg   = 0x10610,     /* P2CMSG_INTEN */
> +    .intsts_reg  = 0x10614,     /* P2CMSG_INTSTS */
> +    .name = "pspv1",
> +};
> +
> +static struct psp_vdata pspv2 = {
> +    .base_offset = PCI_BASE_ADDRESS_2,
> +    .sev         = &sevv2,
> +    .feature_reg = 0x109fc,     /* C2PMSG_63 */
> +    .inten_reg   = 0x10690,     /* P2CMSG_INTEN */
> +    .intsts_reg  = 0x10694,     /* P2CMSG_INTSTS */
> +    .name = "pspv2",
> +};
> +
> +static struct psp_vdata pspv4 = {
> +    .base_offset = PCI_BASE_ADDRESS_2,
> +    .sev         = &sevv2,
> +    .feature_reg = 0x109fc,     /* C2PMSG_63 */
> +    .inten_reg   = 0x10690,     /* P2CMSG_INTEN */
> +    .intsts_reg  = 0x10694,     /* P2CMSG_INTSTS */
> +    .name = "pspv4",
> +};
> +
> +static struct psp_vdata pspv6 = {
> +    .base_offset =  PCI_BASE_ADDRESS_2,
> +    .sev         = &sevv2,
> +    .feature_reg = 0x109fc,     /* C2PMSG_63 */
> +    .inten_reg   = 0x10510,     /* P2CMSG_INTEN */
> +    .intsts_reg  = 0x10514,     /* P2CMSG_INTSTS */
> +    .name = "pspv6",
> +};
> +
> +struct amd_sp_dev
> +{
> +    struct list_head list;
> +    struct pci_dev   *pdev;
> +    struct  psp_vdata *vdata;
> +    void    *io_base;
> +    paddr_t io_pbase;
> +    size_t  io_size;
> +    int     irq;
> +    int     state;
> +    void* cmd_buff;
> +    uint32_t cbuff_pa_low;
> +    uint32_t cbuff_pa_high;
> +    unsigned int capability;
> +    uint8_t api_major;
> +    uint8_t api_minor;
> +    uint8_t build;
> +    int     intr_rcvd;
> +    int     cmd_timeout;
> +    struct timer cmd_timer;
> +    struct waitqueue_head cmd_in_progress;
> +};
> +
> +LIST_HEAD(amd_sp_units);
> +#define for_each_sp_unit(sp) \
> +    list_for_each_entry(sp, &amd_sp_units, list)
> +
> +static spinlock_t _sp_cmd_lock = SPIN_LOCK_UNLOCKED;
> +
> +static struct amd_sp_dev *amd_sp_master;
> +
> +static void do_sp_irq(void *data);
> +static DECLARE_SOFTIRQ_TASKLET(sp_irq_tasklet, do_sp_irq, NULL);
> +
> +static bool force_sync = false;
> +static unsigned int asp_timeout_val = 30000;
> +static unsigned long long asp_sync_delay = 100ULL;
> +static int asp_sync_tries = 10;
> +
> +static void sp_cmd_lock(void)
> +{
> +    spin_lock(&_sp_cmd_lock);
> +}
> +
> +static void sp_cmd_unlock(void)
> +{
> +    spin_unlock(&_sp_cmd_lock);
> +}
> +
> +static int sev_cmd_buffer_len(int cmd)
> +{
> +    switch (cmd) {
> +        case SEV_CMD_INIT:                      return sizeof(struct sev_data_init);

No mix of styles please: Either you retain Linux style (assuming the
file again comes from there), or you fully switch to Xen style.
There are other style issues also further down; please go through
and check everything again.

> +        case SEV_CMD_INIT_EX:                   return sizeof(struct sev_data_init_ex);
> +        case SEV_CMD_PLATFORM_STATUS:           return sizeof(struct sev_user_data_status);
> +        case SEV_CMD_PEK_CSR:                   return sizeof(struct sev_data_pek_csr);
> +        case SEV_CMD_PEK_CERT_IMPORT:           return sizeof(struct sev_data_pek_cert_import);
> +        case SEV_CMD_PDH_CERT_EXPORT:           return sizeof(struct sev_data_pdh_cert_export);
> +        case SEV_CMD_LAUNCH_START:              return sizeof(struct sev_data_launch_start);
> +        case SEV_CMD_LAUNCH_UPDATE_DATA:        return sizeof(struct sev_data_launch_update_data);
> +        case SEV_CMD_LAUNCH_UPDATE_VMSA:        return sizeof(struct sev_data_launch_update_vmsa);
> +        case SEV_CMD_LAUNCH_FINISH:             return sizeof(struct sev_data_launch_finish);
> +        case SEV_CMD_LAUNCH_MEASURE:            return sizeof(struct sev_data_launch_measure);
> +        case SEV_CMD_ACTIVATE:                  return sizeof(struct sev_data_activate);
> +        case SEV_CMD_DEACTIVATE:                return sizeof(struct sev_data_deactivate);
> +        case SEV_CMD_DECOMMISSION:              return sizeof(struct sev_data_decommission);
> +        case SEV_CMD_GUEST_STATUS:              return sizeof(struct sev_data_guest_status);
> +        case SEV_CMD_DBG_DECRYPT:               return sizeof(struct sev_data_dbg);
> +        case SEV_CMD_DBG_ENCRYPT:               return sizeof(struct sev_data_dbg);
> +        case SEV_CMD_SEND_START:                return sizeof(struct sev_data_send_start);
> +        case SEV_CMD_SEND_UPDATE_DATA:          return sizeof(struct sev_data_send_update_data);
> +        case SEV_CMD_SEND_UPDATE_VMSA:          return sizeof(struct sev_data_send_update_vmsa);
> +        case SEV_CMD_SEND_FINISH:               return sizeof(struct sev_data_send_finish);
> +        case SEV_CMD_RECEIVE_START:             return sizeof(struct sev_data_receive_start);
> +        case SEV_CMD_RECEIVE_FINISH:            return sizeof(struct sev_data_receive_finish);
> +        case SEV_CMD_RECEIVE_UPDATE_DATA:       return sizeof(struct sev_data_receive_update_data);
> +        case SEV_CMD_RECEIVE_UPDATE_VMSA:       return sizeof(struct sev_data_receive_update_vmsa);
> +        case SEV_CMD_LAUNCH_UPDATE_SECRET:      return sizeof(struct sev_data_launch_secret);
> +        case SEV_CMD_DOWNLOAD_FIRMWARE:         return sizeof(struct sev_data_download_firmware);
> +        case SEV_CMD_GET_ID:                    return sizeof(struct sev_data_get_id);
> +        case SEV_CMD_ATTESTATION_REPORT:        return sizeof(struct sev_data_attestation_report);
> +        case SEV_CMD_SEND_CANCEL:               return sizeof(struct sev_data_send_cancel);
> +        default:                                return 0;
> +    }
> +
> +    return 0;
> +}
> +
> +static void invalidate_cache(void *unused)
> +{
> +    wbinvd();
> +}
> +
> +int _sev_do_cmd(struct amd_sp_dev *sp, int cmd, void *data, int *psp_ret)
> +{
> +    unsigned int cbuff_pa_low, cbuff_pa_high, cmd_val;
> +    int buf_len, cmdresp, rc;
> +
> +
> +    buf_len = sev_cmd_buffer_len(cmd);
> +
> +
> +    if ( data )

No double blank lines please, anywhere.

> +static void do_sp_cmd_timer(void *data)
> +{
> +    struct amd_sp_dev *sp = (struct amd_sp_dev*)data;

Please avoid casts whenever possible.

> +static int __init amd_sp_probe(void)
> +{
> +    int bus = 0, devfn = 0, rc;
> +    struct  amd_sp_dev *sp;
> +
> +     if ( !boot_cpu_has(X86_FEATURE_SEV) )
> +     {
> +	 dprintk(XENLOG_INFO, "AMD SEV isn't supported on the platform\n");
> +	 return 0;
> +     }
> +
> +     if ( boot_cpu_has(X86_FEATURE_XEN_SHSTK) )
> +     {
> +	 force_sync = true;
> +
> +	 dprintk(XENLOG_INFO,"AMD SEV: CET-SS detected - sync mode forced\n");
> +     }
> +
> +    for ( bus = 0; bus < 256; ++bus )
> +        for ( devfn = 0; devfn < 256; ++devfn )
> +        {
> +            struct pci_dev *pdev;

const?

Jan

