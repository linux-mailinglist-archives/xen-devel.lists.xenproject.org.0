Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0F8966F8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700349.1093357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvKF-0006I5-5n; Wed, 03 Apr 2024 07:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700349.1093357; Wed, 03 Apr 2024 07:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvKF-0006Fr-39; Wed, 03 Apr 2024 07:46:27 +0000
Received: by outflank-mailman (input) for mailman id 700349;
 Wed, 03 Apr 2024 07:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUqh=LI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrvKD-0006Fl-Eh
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:46:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4421e7cc-f18e-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 09:46:22 +0200 (CEST)
Received: from CH2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:610:57::12)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 07:46:18 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::b4) by CH2PR12CA0002.outlook.office365.com
 (2603:10b6:610:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Wed, 3 Apr 2024 07:46:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 07:46:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 02:46:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 02:46:17 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 02:46:15 -0500
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
X-Inumbo-ID: 4421e7cc-f18e-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZrJ8rq2FpIOoPjKfIDdlOSnPPowNHxNM8dZvxCvbn1l4VsthPrs01Rt096UWZ54nOOIBZgD8WWuE5K204g8pziM9eN0wPemYFgUv7/nh8oaya2m5Z53KyhbXzNYw4lnK+aFZibvLxtsEJz3pjyt6KvY24aUuI875L5SJS3jE8SZx3KuTx8A+Z6F02m4lwLpKbpnWjK3pUnEy0WXT/nHx8e9K6H5lYNUUmcBQ93KDFo+X+t2kEWi0HGHzpRShGYq6M8IcJ/nqew50ShouCXEEnBjPg4a6JFBGAHC2n43I/jYI1bweA+NPVA3UD8HROJry3sl05uUFDCZKoH2gsOAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loULl9pMkYI387aX2AzJt6AvPLu+JgrV94+h0gn2HH4=;
 b=jLApOYtOf8zTxDr0uHMfXpnqYOwQ6sZN+QkUWqwQRj2oCH+mHpssscfp4YUS48gp+AVm1wcAp7YCj1JZWhTVBZA1sGwlLElWoLyYLDqHnYDj83BGSxiVhGO9O/xodeCMrSkjjk07eRweIvsRAr3VylFo59jlfuEKkWiO4KxJHLu5sQzGNa/105zo8uiueuaxJsWmlMHqFIs3d2G6iQ6oO0jqZFTaxVsnDu1x+52Mz0faQeimYjcdTR4EbeIAJKU6xUCkNHb1/PF6t+ycrUlFYZdWkR8b7FqTpd6v2Xo9VV8tIgNntuoZCID4JqIEfa3JJ4Se/uWDGSIsk3pHpqEodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loULl9pMkYI387aX2AzJt6AvPLu+JgrV94+h0gn2HH4=;
 b=u4EqkcLp62H/FCRNBNjEt5AD2x209Aukw1UR9BPgwnBekf36ujnWhY2+VsJQKqcOCeA9C20a2m54313wUP1bmNsFUUkuFSuCAtHZOIfYC4j5DcTztAB9eJ/8dcU/SxjXwgO1C63rQtFhGAY1GztYw28V76c5gUumo48ylRlMm1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b76ca342-bce5-4598-b688-823cff436d43@amd.com>
Date: Wed, 3 Apr 2024 09:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
 <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com> <87le5vxy26.fsf@epam.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <87le5vxy26.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 69788b39-e11d-4ace-0a93-08dc53b225e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ev09NvxNtgCoftQNTTwPv44fLsXCMWjdnAPBNJeazmfU4yzG9+TN+9unbNCufp26ABktQqlYI2Jw6KbBQoqqQKDysl8pvBqkiK/sgO+FYHY25Q22p0TzaMAejwEIcMEOuuFxRD1on6p4yFtOxxeRqAbXiMce1sZqmUmC9E5UQZ9t/4WXPs6fuPC9fMABo4zBtBQrNasqmCdVu5KmUcgT20XL4NbHpqDIeMz+ESg7Q+3DtupIGHDK46RzOU+UWryiMQ/c/6lh5EwRY6hrxFbkBFImTtCjEwxYt5NTGF+yq6QZuouVgs71wVY9WKSFywVhHvkQTkpoQS2JbO0rUliEXpWbqlPVCA+YfQMRJVnVtoiKkVyrng6J9zQnP7vE0nv0VZGnX/CjZHHFkI2ybuf0kPWg4Gnpiv65iOy2eYvnjoYCS7Jb+MtcpFqdy0iIYs0m31IcJBARoELriPLtMESoAqzkzKKyN/hm8B019x1ZAZPKyVCBUpLj3v4+vIVtzWjlzLQhvjwSB5OqmtZDWOte2CpkdXTSzCqtbUHKskHrgiyKtebQT9KLjLuniOq27krmpD6AWgVvePCq5uUO3bBeVyYIp8fbKLDh8vrIm/N/o7nIovBWS68OjXLXkBBtms1/j2jyWIH7GCqwNFgowYUnSbieTbkdsiG3YpjvsC0JRJ2AiFJ9au5+ToJJKxPqqvbDk1vgFB8ZoZwxjMuwyv9NIGjJ7mSGWCZ6H7UGykhId1AQ9TrgSg5y95jA/+HO30T2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 07:46:18.2984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69788b39-e11d-4ace-0a93-08dc53b225e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043



On 02/04/2024 23:19, Volodymyr Babchuk wrote:
> 
> 
> Hi Michal,
> 
> Michal Orzel <michal.orzel@amd.com> writes:
> 
>> Hello,
>>
>> On 29/03/2024 01:08, Volodymyr Babchuk wrote:
>>>
>>>
>>> Generic Interface (GENI) is a newer interface for low speed interfaces
>>> like UART, I2C or SPI. This patch adds the simple driver for the UART
>>> instance of GENI. Code is based on similar drivers in U-Boot and Linux
>>> kernel.
>> Do you have a link to a manual?
> 
> I wish I had. Qualcomm provides HW manuals only under very strict
> NDAs. At the time of writing I don't have access to the manual at
> all. Those patches are based solely on similar drivers in U-Boot and
> Linux kernel.
> 
>>>
>>> This driver implements only simple synchronous mode, because although
>>> GENI supports FIFO mode, it needs to know number of
>>> characters **before** starting TX transaction. This is a stark
>>> contrast when compared to other UART peripherals, which allow adding
>>> characters to a FIFO while TX operation is running.
>>>
>>> The patch adds both normal UART driver and earlyprintk version.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>  xen/arch/arm/Kconfig.debug           |  19 +-
>>>  xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
>> Shouldn't all the files (+ other places) have geni in their names? Could qcom refer to other type of serial device?
> 
> AFAIK, there is an older type of serial device. Both Linux and U-Boot
> use "msm" instead of "qcom" in drivers names for those devices.
> 
> But I can add "geni" to the names, no big deal.
> 
>>
>>>  xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>>>  xen/drivers/char/Kconfig             |   8 +
>>>  xen/drivers/char/Makefile            |   1 +
>>>  xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>>>  6 files changed, 439 insertions(+), 1 deletion(-)
>>>  create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>>>  create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>>>  create mode 100644 xen/drivers/char/qcom-uart.c
>>>
>>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>>> index eec860e88e..f6ab0bb30e 100644
>>> --- a/xen/arch/arm/Kconfig.debug
>>> +++ b/xen/arch/arm/Kconfig.debug
>>> @@ -119,6 +119,19 @@ choice
>>>                         selecting one of the platform specific options below if
>>>                         you know the parameters for the port.
>>>
>>> +                       This option is preferred over the platform specific
>>> +                       options; the platform specific options are deprecated
>>> +                       and will soon be removed.
>>> +       config EARLY_UART_CHOICE_QCOM
>> The list is sorted alphabetically. Please adhere to that.
>>
> 
> Sure
> 
>>> +               select EARLY_UART_QCOM
>>> +               bool "Early printk via Qualcomm debug UART"
>> Shouldn't you add depends on ARM_64? Isn't this device Arm64 specific like in Linux?
>>
> 
> In linux it depends on ARCH_QCOM which can be enabled both for arm and
> arm64. But for Xen case... I believe it is better to make ARM_64
> dependency.
> 
>>> +               help
>>> +                       Say Y here if you wish the early printk to direct their
>> help text here should be indented by 2 tabs and 2 spaces (do not take example from surrounding code)
>>
> 
> Would anyone mind if I'll send patch that aligns surrounding code as well?
> 
>>> +                       output to a Qualcomm debug UART. You can use this option to
>>> +                       provide the parameters for the debug UART rather than
>>> +                       selecting one of the platform specific options below if
>>> +                       you know the parameters for the port.
>>> +
>>>                         This option is preferred over the platform specific
>>>                         options; the platform specific options are deprecated
>>>                         and will soon be removed.
>>> @@ -211,6 +224,9 @@ config EARLY_UART_PL011
>>>  config EARLY_UART_SCIF
>>>         select EARLY_PRINTK
>>>         bool
>>> +config EARLY_UART_QCOM
>>> +       select EARLY_PRINTK
>>> +       bool
>> The list is sorted alphabetically. Please adhere to that.
>>
>>>
>>>  config EARLY_PRINTK
>>>         bool
>>> @@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
>>>           will be done using 32-bit only accessors.
>>>
>>>  config EARLY_UART_INIT
>>> -       depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
>>> +       depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0) || EARLY_UART_QCOM
>>>         def_bool y
>>>
>>>  config EARLY_UART_8250_REG_SHIFT
>>> @@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
>>>         default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>>         default "debug-pl011.inc" if EARLY_UART_PL011
>>>         default "debug-scif.inc" if EARLY_UART_SCIF
>>> +       default "debug-qcom.inc" if EARLY_UART_QCOM
>>> diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debug-qcom.inc
>>> new file mode 100644
>>> index 0000000000..130d08d6e9
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/debug-qcom.inc
>>> @@ -0,0 +1,76 @@
>>> +/*
>>> + * xen/arch/arm/arm64/debug-qcom.inc
>>> + *
>>> + * Qualcomm debug UART specific debug code
>>> + *
>>> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> + * Copyright (C) 2024, EPAM Systems.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>> No need for the license text. You should use SPDX identifier instead at the top of the file:
>> /* SPDX-License-Identifier: GPL-2.0-or-later */
>>
>>> + */
>>> +
>>> +#include <asm/qcom-uart.h>
>>> +
>>> +.macro early_uart_init xb c
>> Separate macro parameters with comma (here and elsewhere) and please add a comment on top clarifying the use
>> Also, do we really need to initialize uart every time? What if firmware does that?
>>
> 
> You see, this code is working inside-out. early printk code in Xen is
> written with assumption that early_uart_transmit don't need a scratch
> register. But this is not true for GENI... To send one character we
> must write two registers beforehand: TX_TRANS_LEN and CMD0. Only after
> that we can write something to FIFO. But early_uart_transmit has no
> scratch register to prepare values for TX_TRANS_LEN and CMD0. So we
> write what we do here
> 
> 1. Reset the state machine with ABORT command
> 2. Write 1 to TX_TRANS_LEN
> 3. Write START_TX to CMD0
> 
> Now early_uart_transmit can write "wt" to the FIFO and after that it can
> use "wt" as a scratch register to repeat steps 2 and 3.
> 
> Probably I need this as a comment to into the .inc file...
Yes, please add a comment so that a person reading a code can understand the rationale.

[...]

>> What about vUART? You don't seem to set vuart information that is used by vuart.c and vpl011.c
>>
> 
> I am not sure that it is possible to emulate GENI UART with simple vuart
> API. vuart makes assumption that there is one simple status register and
> FIFO register operates on per-character basis, while even earlycon part
> of the driver in Linux tries to pack 4 characters to one FIFO write.
Ok. It might make sense to mention this in commit msg (no vuart, no vpl011 for direct mapped domains)

> 
> Thank you for the review. I'll address all other comments as you
> suggested.
> 
> --
> WBR, Volodymyr

~Michal


