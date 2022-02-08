Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC84AD78E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268246.462041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOo6-0007Pg-5q; Tue, 08 Feb 2022 11:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268246.462041; Tue, 08 Feb 2022 11:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOo6-0007Nr-2e; Tue, 08 Feb 2022 11:37:14 +0000
Received: by outflank-mailman (input) for mailman id 268246;
 Tue, 08 Feb 2022 11:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0PE=SX=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nHOo5-0007Nl-EB
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:37:13 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a7a1f9-88d3-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 12:37:11 +0100 (CET)
Received: from SN6PR08CA0024.namprd08.prod.outlook.com (2603:10b6:805:66::37)
 by BN7PR02MB5218.namprd02.prod.outlook.com (2603:10b6:408:26::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 11:37:06 +0000
Received: from SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::85) by SN6PR08CA0024.outlook.office365.com
 (2603:10b6:805:66::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 11:37:05 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0017.mail.protection.outlook.com (10.97.4.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 11:37:05 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Feb 2022 11:37:04 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Feb 2022 11:37:04 +0000
Received: from [10.71.117.110] (port=30724)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nHOnv-0003Cs-7a; Tue, 08 Feb 2022 11:37:03 +0000
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
X-Inumbo-ID: 73a7a1f9-88d3-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMlzwOk5Io8GUR2VhKIgGi+lPtJMICgQa/Q51xyE/PGiKKEk0CLj5fffvP/N5Ool/sWuqBLSSlXVqtwyohO8j1d/dhqpUC2iPXWQHzs6csN58aHv+3b2eCPlYZeReD+VkETDylAQ0z47nMj8Ia3PJQ4/AXXqi9ICMmAL09Fnze8NM7Xv7hs8lwvmzgHApbTqOy8NrDD9gUDqNsdn4HD6ZKsqnC1ZTPMT0+6O0Gk+mraNf9s6jKsMbWMpnXpbRubXU5kPGaagrM1WYQvIndXL7ZpVwwuf3vOExcRRK06EGdknqBXHrCci/hDH3VIHOxvUQtcD9M6R7Dv6i7uNip43mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T5poAt1Fb2IYZkIgWRYu2olNZzpKQrUJnN4vwfPcIA=;
 b=ZWg85MfV6/g5+8AKvUcvsSR3FA70csuOqxjYPwsX5Q6vmCKMCrETKmvpb7ELiNQrp1R7ECWroqs33V7hJcQ3RZSJTDhicKeP4lj/RFDWIJtK06cDJ/0AkaDqglbXDpjXVSGNGedujBknvLCE4+5++NQ8o94zjx8SvUBh/whscOj8syEjS4Lb/Ics1nwmi0S+zXEZbv6gUAHZ5DRu+m8zXs9JZmDhzkGsM9LHuGV6J/G5YXy2QGkUN8TspqH8yic2iLr5wfO1YU/Eg5BySAyvuuadYns0iU6pD6dmwqtOUZL4pPownhiGJfE3RdZrfFFIOwAQcKLGjD8XkkRwdmdNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T5poAt1Fb2IYZkIgWRYu2olNZzpKQrUJnN4vwfPcIA=;
 b=URTgit3EaFSJQYLfJ5X/OCO55cYW8dt35FeGDQBxlD3E5mHVJg93JF5MkrGgTTFECszuQDr2VPH+FFYckRE5gz6esYeWrp5maCpbPOdfPf8DBH0BBNs/vGq8Ov+Xq7xyz0u4eSOgPpBGeRa8tVcwKqmqWOkC/lUcvPRZp9ETeiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <b3d559c0-15cf-4aff-0cf3-ec575716dc50@xilinx.com>
Date: Tue, 8 Feb 2022 11:37:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v7 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
	<xen-devel@lists.xenproject.org>, <julien@xen.org>, <stefanos@xilinx.com>,
	<sstabellini@kernel.org>
CC: <Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220205225816.5952-1-ayankuma@xilinx.com>
 <20220205225816.5952-3-ayankuma@xilinx.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20220205225816.5952-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a29b60a-4c7d-4aaa-9e92-08d9eaf75529
X-MS-TrafficTypeDiagnostic: BN7PR02MB5218:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR02MB5218C2D1A4AF38F3A6D4470AB22D9@BN7PR02MB5218.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wcq9urXa0Z1KAb+nyBMUO9Qq3JNYJxZ3e7pZA6m8KCT4wHvo8XHkdjRpW2Bcds9VShXEgHCj0XWM7yDfcyL08IcDolRM4kaMayQ0Uz9b0EwvwejXfOTDAeTudvklacXFhmAnAGiM5+0xTvXpIICEhPeIaB4ukhit8jPzaX2a199gqxX7ZCA3P/OzoRJX/6HSGLmbMcjh+20shmmsk4/hAJbZkM3DYTTPnN84uA/Drtquxo1C8cQV8jFpG5KHV853U09xmQJBEpM8OSud20eRO0Py8HIkbWVKYAa88DL5jMnOjACjjYRQdWlkNWX6QPL/1iFSeNySQnYfQ1xK4fOQNmROpJea00P+8+h1/fUiLzTTlKje7wRRarJejF2Q83MkJj9juCpIxH0d1Qdt71dZ4Ivfc2PZxU0X7tq73H1Q7qh83RaaOQtLjquW2gTkg8cshrR0FHdjn47Amv5L5+bzNJGybmBnHeV3JLpYX4FfljyhoyYSB8VZ3vYPm2CLYz53032gGbXISf2BqS4vUO/8tWTLZQgsqFwbiCI88muxXrjkzSi/J5+ujIAcKya8wD7aZd5iskAxViK2t/AoliK/xLpZ+e7PjjgWmMUa7gAOZmV3VzyZStgBiP+L865VHiDhS7gIFu6DcLi/HygNRaHcblSSH4qhmxqh8k3nb17TETRUQtCTxFwHUM4SUbh4uM+i95seXCFx5bP4/tPx7lPyu9gTPK45t9O8buJl3QGX8F8=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(186003)(47076005)(336012)(316002)(53546011)(9786002)(36860700001)(54906003)(426003)(2906002)(82310400004)(31696002)(83380400001)(26005)(2616005)(31686004)(5660300002)(356005)(70206006)(70586007)(110136005)(4326008)(8936002)(508600001)(8676002)(36756003)(7636003)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:37:05.3592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a29b60a-4c7d-4aaa-9e92-08d9eaf75529
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5218

Hi All,

I had a discussion with Julien on IRC and this patch need a correction 
(based on my understanding):-

On 05/02/2022 22:58, Ayan Kumar Halder wrote:
> If the instruction was related to cache maintenance, Xen
> will not decode the instruction or do any MMIO operation. Rather it simply
> increments the PC and returns to the guest.

This is not entirely correct :-

If the instruction is cache maintenance and the address is emulated, 
then Xen needs to ignore the ignore the instruction ie increment the PC 
and return to the guest.

However, if the address is not emulated, then Xen will get invoked only 
if the translation table entry corresponding to the address is set 
invalid. In this case, Xen will need to iterate through the translation 
tables and mark the entry as valid and return to the guest to retry the 
instruction.

As of today, we do not handle cache condition (ie dabt.cache == 1) in 
Xen. Thus, I will drop this logic in my patch and will resend the 
current series (unless there are any objections).

I will send out a separate patch to handle the cache condition.

> If the instruction was trapped due
> to stage1 page translation table walk, Xen will update the page tables and will
> return to the guest so that it can retry the instruction. To handle all these
> different states, we have introduced 'enum instr_decode_state'.
>
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
<snip>
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 3354d9c635..fb7ff72cdc 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -26,12 +26,23 @@
>   
>   #define MAX_IO_HANDLER  16
>   
> +enum instr_decode_state
> +{
> +    INSTR_ERROR,                    /* Error encountered while decoding instr */
> +    INSTR_VALID,                    /* ISS is valid, so no need to decode */
> +    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded successfully.
> +                                       It is ldr/str post indexing */
> +    INSTR_IGNORE,                   /* Instruction is to be ignored (ie NOP) */
Drop this entry.
> +    INSTR_RETRY                     /* Instruction is to be retried */
> +};
> +
>   
<snip>
> +    /*
> +     * If the fault occurred due to cache maintenance or address translation
> +     * instructions, then Xen needs to ignore these instructions.
> +     */
> +    if ( info->dabt.cache )
> +    {
> +        info->dabt_instr.state = INSTR_IGNORE;
> +        return;
> +    }

I need to drop this. As stated before, this needs to be done in a 
separate patch.

<snip>

> +
> +            try_decode_instruction(regs, &info);
> +
> +            /*
> +             * If the instruction was to be ignored by Xen, then it should return
> +             * to the caller which will increment the PC, so that the guest can
> +             * execute the next instruction.
> +             */
> +            if ( info.dabt_instr.state == INSTR_IGNORE )
> +            {
> +                advance_pc(regs, hsr);
> +                return;
> +            }

Drop this.

<snip>

- Ayan


