Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E899233D9F0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 17:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98406.186669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD0B-0006wI-EC; Tue, 16 Mar 2021 16:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98406.186669; Tue, 16 Mar 2021 16:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMD0B-0006vt-B2; Tue, 16 Mar 2021 16:57:03 +0000
Received: by outflank-mailman (input) for mailman id 98406;
 Tue, 16 Mar 2021 16:57:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sz1a=IO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMD09-0006vo-Ez
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:57:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fde48c2-619d-4deb-a654-c2f61091bab9;
 Tue, 16 Mar 2021 16:57:00 +0000 (UTC)
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
X-Inumbo-ID: 0fde48c2-619d-4deb-a654-c2f61091bab9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615913819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fy4fYtsW0uznKhJmjpg3BsB/hQfLvOLZRqHtlJV7/VI=;
  b=C5bt1g5SK8zf/ShrBEV+YM0gv8gycQnTEfKv6X7l1Ifvp3p+zWP0mwPu
   bFd561zkLIqWZKCR6kkHK3ti7Bf5KrPn7TQ14YYlNKzRUw3ciU1gU9p3Z
   PqyxHWRFY5Sny5Yne2AFLWiv+zYgFI6qvUryBI2goZh/NyVXGw4tE7iO+
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a6jNA+HNR6+ZELLmCpqg8EiDcute/q/ASAEBiQYz305h3hOp16AQg4i0yP1lOgaec5sAogC29d
 ghRjfFW5QQ2gMi7egq0zN/WHg5z8YjCBV/EMEflSSHbhBJW5Lla09yMxQKQzOkEtUuqT4fy8SQ
 Je93BgK4aBEHBTCKOP/+4w6PDL6z+jQ1OJIH6bdbWkbYVPhnBbQ4eJNcuSGPDX+SXMrHzYt9xE
 vuf6Y+MZJie6ePYz1Q0sCaqA4piHbAoMqjSjX0X+yxzI94KcH2ZWgDLpylX4K5Jh9S8IbhRjYN
 /DM=
X-SBRS: 5.2
X-MesageID: 39424115
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hON646517ePWDYSnQQPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.81,254,1610427600"; 
   d="scan'208";a="39424115"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyn3XuK/xfuGDRomolcYeIhgpwcp4nsbpYaWXENDzjww3LnYn+wRtZypffpX8ldHp7WpZy8MMvr5KS5JlSLyIj5uvA9/bPrnIWpJ03YOPTQ4Qqs2Z/qCZYRPxL8OWPNZOk1jpXgJffqF8lY5PSMEMoFSFYbSzA8KwuW5ud7dMxxFLJD/Xxj7MaRZsx8lqYpbqVoUtXOlnVw4Be5n13COwE2ROSopwiy1uwCs3/i7AZAbdzDdNW7lAJB6bT2MjVrAo04D/DyUD6EkPCNtlVKV7RvU+Y6CoyKBbfDW1Yz1hmA/az3UPxRSB63uzqmz00yiJL5kEihNe6xK5OpxA795/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVIvL2AQAwlGUKJpF3Vu/Q8SeQcDuyYF4lk2o3iA9wA=;
 b=hfqFeDVTjFxpohJWiKhFlfxDDR5bpqv4lZwnWaPqs3VtKbVTRaL/ebUO2hJutOwFn53hf7ABE0qU+s9KZCG0rukFJwsDf7Dv/3wGofvecS5aT9QZm0i8ZaWAnqI53yJ8vIHu5LjYXqsjJBmXSmsJpvSgvEJ3GfzWFbatLw8tOoujwiIlYfhFuwsPkM7MZy0mWhfAJEvlUB8k9CjQb9D4mGfeP9bSMyIHE3R17cjXS16qgiKeRvhD+IPS1g/LUNwj6XC+StHXPEAhOAK69IlDuyCfXuDLciWO1ISHEzTL6KbIPdd7j7q+8ew0QmTcha4f3XUpQI+B61x5VdVqHkXUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVIvL2AQAwlGUKJpF3Vu/Q8SeQcDuyYF4lk2o3iA9wA=;
 b=AQBFYEwH6BUaxkWsxS8woNWMN3B1a5P8ZAo4xHlVH3Yc8QbGwN+7szkRruQrn6HxqFHmNrwJV+buLhXbo2uMSEJ7X0UI0X00o59Bv9ltpNBNrmFHi8CWFSbFMLPtNXqP713fyh9JtEhR31ubUq81uI2cQY+tAduAg1eOMsYgJO0=
Date: Tue, 16 Mar 2021 17:56:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
Message-ID: <YFDjUSz/whe9Jrqp@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316161844.1658-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b40d159-75c9-4ae2-a8f0-08d8e89c81a4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2713CB6CAC3606E3235A53228F6B9@DM5PR03MB2713.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2KO5B2wzsVACKbITwMVagi6TLok1H+GyVW963au1R4yirWMWO3PivWDrjyA2ctGPZLW2RORhSmp09SQxUPhVcsN/2S0pnHj1eU5BmZWNIHEwY04Y5bA5mYE37N2leykHwXsFI4I9eTgdsSn2QsybWZzhW9C0gN9meJO8Htk1neGZs5CUwvBBa8PeGydlb2idVml308Ys8o4sWNOybxU5xMvEBhbY0MRhsD/tpLhvbDa4pBegQq5+G2YBe9/DAg4maKO3ZurUbJePnxm60ReAtD1fCHLb0nVam8iz4p6EGLhdZdKhSGTE2QXiaJaaO7npuqomJtxqq8BVJ+PyvgCYHwOljsBWNChqArvg7AZcoF5fbjROB3nwuW1wWmMuOYYCuHGTJ7XjxjluQtzwhvrOZLWqIo5gbs8SXw6dzBhPKNCihR/tDA7f7+Jvyf5WNxnxbwZEakUYoAanWU6ceeowCislpt/Xvi4gdwOqK2qeEaV8uMlvLKQRArV2CDKQN1K/IvxGPJvsc7KVJo4YfU2/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(85182001)(54906003)(6666004)(6636002)(86362001)(33716001)(6862004)(8676002)(186003)(66556008)(26005)(66946007)(2906002)(66476007)(956004)(16526019)(316002)(6486002)(6496006)(83380400001)(4326008)(9686003)(478600001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWFCYnNraFd6c3FRRW4wN2FJYkxaZ21yU1hVRDhQYjVRUHA2ZWpVV1l1MXI3?=
 =?utf-8?B?MTRkQ1V0OVo2KzloSzZjMU9KYXlrOE5xZ2d3NUhYeFVzZXcvTFgzQmNHVG4x?=
 =?utf-8?B?LzdTQVM4UWRWaDlUZzZSVllUL2ZRU0FKZ3hHNytBVmcrakRxL2lzZjBWMi9S?=
 =?utf-8?B?TktONE03ZTBwWFNLLytHWG43clZtUHAvZWVudzVxeERuMzhBdnVxQ3hNQkxt?=
 =?utf-8?B?WDZtcWsvSXdES3VmRW41cUZFMnVWc2N1ZkN1VHFrdzh6aWF5bjR1aUUxYnBz?=
 =?utf-8?B?T1hhMyt1V2M1V2pNT0NtQkljZTdvbTNZTUFNMzhEM1AxeTdDRStEelY2V3Y1?=
 =?utf-8?B?dEwwbE85YXVndWlDYndvOVc2QU5xcVdEckJEbmJhSlBjN1hYZ1h3YVk5V3Zv?=
 =?utf-8?B?bUxKbGJseGhZQnh4MmtITWdGSGxzSFdmSkEyazZtcXJLR3RaSWl5WDhzY0FE?=
 =?utf-8?B?VmNXcW9RRUlXVzZremIraG1OYkhKdWlBRXZYdUZzYlo2WkMzWk9rSW1LMVda?=
 =?utf-8?B?ekN4Z3IzWG13SWxvanFXek1zdDE0M0g2Skh2VHBIQi9IYzM1cERiR3BLT0Zv?=
 =?utf-8?B?ODVkQU1BZ1Q1N2Riekt4NDJTRXg1QjJad2dGRnFUeFRmZTgvVUErOUFGOTZm?=
 =?utf-8?B?aXZidU1VM0E0YVBaOFgyV3ViL1cxOE9YaHdPZzF3QkJYQ00vWGZJaDdvbERN?=
 =?utf-8?B?TUMzSVo3N01XVEVSR2ovZjFENDRXQXN2KzNXNFJTR0xwYlp4YzhSVEtDME90?=
 =?utf-8?B?d3ozT0JVaWZQZ1pTZE1nLzhISjZzREE1aThLbWRZU3h3UDdXZXIwTTd4NG4y?=
 =?utf-8?B?aVhVWXp2anBkVjRyRit4U0w1SXhFK3c2dDZDN2VqM1I2QWx3M1FNTHZGU3FV?=
 =?utf-8?B?aE5HSEhZa3d6dUE5RW1PNnR0MGxoODQrTitOTlI1K2ZSQzZmTi95cVNzc3V2?=
 =?utf-8?B?TmFHdVhUTFR1dGxycHVIZU5jY3Vhb2dnenhoUDVoQnQ4TU0vT0VZN095TXkx?=
 =?utf-8?B?V2wxK204UXF6bkh3RGZkQnNjQUwrcWZRaUJvNFIzSURtSzVjaWp0MGVwdFFO?=
 =?utf-8?B?akZGK0xMOXpoTHM1cHVJdUpnV09SdVJ1R0YrQXBrbTBPdXA5M3B1THlJTjZs?=
 =?utf-8?B?dkYrZTNWSm12RUlJZkJLMENaZDhwVFp5QVUxV3JQWnNlYVZ6ZldKRTFIN3Zj?=
 =?utf-8?B?eHA4RWVnQzRiVGN6cmtrc09rL0NqV3B1QzI4cGtKRVJYdEJaeDZVTXgybjBL?=
 =?utf-8?B?SHZ2Uzl5c2dEb3JqM2ZiaFc4blRRbmdoc2tzMlRhdW9iaThqVkZ4Y3VFLyt3?=
 =?utf-8?B?MjFydTRxQUMxQmVoQUdPTUFpK1pEZmVUSEw1a21HcVQyd3dqVzdRb1NYR3o1?=
 =?utf-8?B?S05KZlVnVGw5LzVqcFBUUkwzbUpyU3EybXZBd2R4bmo5bklDbFlhNFFBajA3?=
 =?utf-8?B?RUJZdkVNRnh5WEd6QXFLWkxXYzdZeFR0dThnL0lvemhJeVpucUU4ZnRMYVdZ?=
 =?utf-8?B?UDZpMHl3WHRKL1hLWHRlVWllbUxoZ2NMVUpydTQ1QU1YR05aZlRqT0d5ZEhq?=
 =?utf-8?B?NlJMWXJEMUliL1FXZEJjclh6QTJpR1QrWGc0WXRoL3Vxc1d2ZmJZVnhYNExM?=
 =?utf-8?B?L1NQWnIvY0xNTlVPWjBkL3EzekJ5b1p3N3cwS09jN1lmbThnUEcxTVdhSHk5?=
 =?utf-8?B?MkxZYis3YjlkbGZ1aHVsVUdJdHBUVTl6ODYxR2pyU1ljTTlmVkdjcjVaTnhZ?=
 =?utf-8?Q?HfhSREWJ67o9i1h8Ek1z+REHWFBFme/ix0C3cya?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b40d159-75c9-4ae2-a8f0-08d8e89c81a4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 16:56:56.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K73AwcDkzvjoG/faH6oaiMrHxycJ7CldnEWQtA+61gQjYwS8MEaD7AOPef13KCKQpqMDSUhEGVnKko3eM8tFSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2713
X-OriginatorOrg: citrix.com

On Tue, Mar 16, 2021 at 04:18:44PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> For 4.15 This wants backporting to all security trees, as it is a fix to a
> regression introduced in XSA-351.
> 
> Also it means that users don't need msr_relaxed=1 to unbreak Solaris guests,
> which is a strict useability improvement.
> ---
>  xen/arch/x86/msr.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 5927b6811b..a83a1d7fba 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -188,7 +188,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
> -    case MSR_RAPL_POWER_UNIT:
>      case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
>      case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
>      case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
> @@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              goto gp_fault;
>          break;
>  
> +    case MSR_RAPL_POWER_UNIT:
> +        /*
> +         * This MSR is non-architectural.  However, some versions of Solaris
> +         * blindly reads it without a #GP guard, and some versions of
> +         * turbostat crash after expecting a read of /proc/cpu/0/msr not to
> +         * fail.  Read as zero on Intel hardware.
> +         */
> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
> +            goto gp_fault;

AFAICT from Linux usage this is Intel specific (not present in any of
the clones).

> +        *val = 0;
> +        break;

Do we also need to care about MSR_AMD_RAPL_POWER_UNIT (0xc0010299) for
Solaris?

Thanks, Roger.

