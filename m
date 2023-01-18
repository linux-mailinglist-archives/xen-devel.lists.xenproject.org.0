Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363A671668
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 09:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480222.744495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3zw-0004Ot-Cp; Wed, 18 Jan 2023 08:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480222.744495; Wed, 18 Jan 2023 08:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3zw-0004MG-9L; Wed, 18 Jan 2023 08:40:44 +0000
Received: by outflank-mailman (input) for mailman id 480222;
 Wed, 18 Jan 2023 08:40:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI3zu-0004M9-HW
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 08:40:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca407a5f-970b-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 09:40:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 08:40:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 08:40:39 +0000
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
X-Inumbo-ID: ca407a5f-970b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8c0elCAkKbR73BwQLzPvVx0mji58Wi54YGZM2IpAz3FEuVBPEgD2DP54khKzQay3P8I82hPRhxOKbGtfqFExXiWf6jm3S9nF58BHq+V99NWtJFktuQyUfNyZ29EHJfWKAqCSEzwLgqnnW9dHB856YDyWgLXt7NKWGk35OH5RC1zl84Q8As7b4Go86uuDOq3EajPHr6/Ub0yjnTjN5Aip2SiF+bHmQigxuBRGZhO9fs6MCFBsI/i661GfnCx71txnMRP0n7uJ19clfjzNX5KUAh01kaIUIVZjbAA6fI3xQp34RsY1vqAYICouZbHfIF/VsDpBu9CwxiZI1VGJuQ0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDQDOElpGTuBjaqUWEx0gv26w9qjgdkrpxT3ixcswXA=;
 b=E8Ie9nPvWQK5kB947vITDzXFgM5NPkdcyUvFLfpxQr4m8Dm2+FeBVeX12vLVHDwjLynNbCwwSjOtrmreOJIvqyvfe7YXn0I0ujXfiA5V+X7lTOD/ytloMCz6KTL1Im0boxVM/afMp7o23WQymzDh4qzq/Jdx2Zeaq7PgC4Rh5yD/ZChpWIe8HvFsKAlwj0G0fQRkdjRhPwL2Jd0pnJddJhr+pnpd1uUmiQZbV9mWUTVXprBelSvQCp9uK9tGPcXOX8GRWVEUNsRiTPM3WbOSBzbgV85yqVvBGzeEwIBeFOQrWIQyOZXwRuXPM00/hfRjMhYw1XjxUHo4yHjsUklDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDQDOElpGTuBjaqUWEx0gv26w9qjgdkrpxT3ixcswXA=;
 b=RweZQq6pel5v0rtrG6w8Sd/r/DCbcKyIRwVcLi6YfdMseVLH/2AnD7OLSAAWYOau9zof9AClUCaQc7Xkp1ipRhEgOdo3SvOFxpU4uRyMWYhxx4qZniSN8Rv38ZbJO6gSHKDepe8sq00b2mR70m8AoUr+ZxRSPYNoA0htLzl0ydYb34ddOKVLctPuwTGztiQDPtukC83mgo5P7XIiu8PmFiKscwyCXJS/vdwBFjq5WtBWfamXbTbjt+YzRiOfQoDA8AH04Y3bHgTTVGi2qVu0bGceV9jE58M7OFBvhE5t/B5avD1UAxdioUxHEDNiFo96ZHhPyAQ1LMmxEXq6gRfpHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
Date: Wed, 18 Jan 2023 09:40:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org,
 Wei Xu <xuwei5@hisilicon.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230117174358.15344-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6c5246-7be7-4f24-73f2-08daf92fad21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nu5F9Hf9smQWypU9BXM1xZOkpBujaRE7jSOsCv5gX5uV7YJGYvHt6vc+ZDfSeexXQexW78bopLtC9VI+ArwLOX+NCQC4WCkF8uZNTPMfFfUwRp7KKZKNmk/6ZduhW+thqYkv9C5Dw2/pqY0sGH8WBsPyeVLpwsa4H3EvF5gCXpPrFba3OiY/CpabQecRI6C/E9HWVhQkG665SvaXxv2QGMk0Xe8CyP3bYCg39207f8G6Igs+f6DF4OqrJ1i5Md2obMPFYsfJj5mTjjZ67li4x90cl2rJsPTcMiXvxluO4gpm+k6vP82GMTEhYZv5bu8kosqQ0pqsLHO2K1bEoT3Z616XBDSs4ppN8m71u78r2bcMkszni2XqCPusd8kbxKmpCMUKXG7ZBvRW3JZw0QxDiUo+YWiKQ8sstbIFuzvAcAixYWHY5c2eSjm2k9+3AVtziKE85E7vsZPGU2YO0HesB4QJ7jDyuECXJ+nQyCvVKnMWOhZWQeq6Jxn8XAjcugpG5ReSTQ1NfECQ3PGIG4zbIzoEpYjnQKbzDWlZ0zITinbaPefdoPf2TOEw0669rWQ3n0Z5n9utTXB+G3rZDurVTdYL7KKXWpCqbb/9bwVEVO07e0iyAe2uWyCbz/C5PQPArfKC5Ew0OTHAVcittOlXnqPZF4B+dhlItJsfup4kgqlbcYr0YC+g3rS55KTfU/PuXf+OFqkIh0NWtmEAPnYmLkIS08bM3OfnbL0OsUY5eEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(110136005)(2616005)(186003)(8676002)(4326008)(26005)(66476007)(66556008)(316002)(31686004)(66946007)(478600001)(6506007)(41300700001)(8936002)(5660300002)(2906002)(83380400001)(53546011)(6512007)(38100700002)(31696002)(6486002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkdwTWZ3UTUxZkJJSWxMbDE0c2pkdW5HcDFHK0x0cFRYVmhVMnM4T1hXekJY?=
 =?utf-8?B?TG4yUEpId3JENkh2dFJCSzNsNEFad2E0Zk1MNWxYb0pIQlB5SDN4L1BGR0FP?=
 =?utf-8?B?ZEZmenZDWkcwZjNUWHVNMFJnUW83OVkzSGJYRGc0YmQzcWFmUEdVbWVhbTdZ?=
 =?utf-8?B?cVV6YVo4UTZFTFIrTkp2cnZiN3JkNFRkSlhsK05VUnE5SzFMREpQMFNBUDZP?=
 =?utf-8?B?S1crSFE0OG5DNFNFTTJaNDgwMjBOeFJ1bTI4ekRxeW15ZFpmd0VJMWFkQzVY?=
 =?utf-8?B?ZithRGZEYi9GSDNRcE54VzE4dmpXNGU4RDgvYmxFSUNCekwzK1Q1aG1BTlRi?=
 =?utf-8?B?SEVkWXhURVNtaS9NZmV6VWFiNjNjMStaR2wrb1dZY1V0eHJIZU1vNDJmVkNM?=
 =?utf-8?B?QXVSaTZ6TkRISXRGcWVJZnJXbzF0Q2Fua1R1Q3UreXgxY2szZkFNdDZkK0JE?=
 =?utf-8?B?REdrRG1VSWRtMDBQSllYRm9KQkhrdzUwdDgvSlJ1MzZjeXVzUDhaYzlvNFY0?=
 =?utf-8?B?QXJnT2JMejVuUSt3K0xIMTZGdEJUaGRBanZWOUcrR2pma0EwZmJRaitFbEtG?=
 =?utf-8?B?aUFpTHNyaGFQMGs5WFBaL0oxa2V4Ky83SUdiUno3emtaY21GaVdMUnA2anJo?=
 =?utf-8?B?azUrdUpncXV2bjUraS9zNzJ5L2V4bVhyN3BzTldSUTBmOEZVNjg5SjF1Zlcz?=
 =?utf-8?B?ZzNwUW8zQUJOMmVoR0Q5OGhUN2NFM0NaTkNHT3NnZWJFcGo5V3Q2V2c3aEV5?=
 =?utf-8?B?bXVQdlFVeno0WjlJKzg2YnZUc242YjczVTR5Yk5yZEtRNHQvbUUrbzBSQWRv?=
 =?utf-8?B?QnNFaXZhYjUrRE5WcCtWa0R4b2dSUG8ydTg5UlhKYzhpdkVJblZyTDRSV3ZX?=
 =?utf-8?B?cm00eUhlZzVlamNIdGlUM3FaVmE3NWEwYnlDcy91cjArV3JwanBGODFuMkVY?=
 =?utf-8?B?S2Q3QVJtN1ZKdUlqRUNMRnNuMFlEZm9wY3lBemlOWXlrMTFtYmxYVXNVWFZP?=
 =?utf-8?B?bWRLN1ZxQk83OVFFYmRmK0JVY3h5ME5yQVY5RXJYNFRoZGVLY2ZmZFVNaUFX?=
 =?utf-8?B?WlhRZGhVUFNob0xRRWZvT1pjL1J5VGVXeWpxWXE0LzVRTVdhc1B3RzAzdVFa?=
 =?utf-8?B?YzNIK3dwZStBci8vWkMzMU1LQTdLYit3YTlSREJlVWVzZ0t6MHlCc3o3SklR?=
 =?utf-8?B?QTBIRkJQQllWR1JMZW9YeGVpQTJSSFZkSHdTZTQyTmhHZTd3L3FQbFpRZzdn?=
 =?utf-8?B?eUoxM0pFUlJ2Njh0SjBKMzNveU5PU0JjM3QySjY5dFFBVzV2emtKc3cxMlA1?=
 =?utf-8?B?MWc3dkdQWmF0QWJDNHRuY0JXNDlmYjVBc3hqRjhubUpMUE8xZWtIREJIVFYx?=
 =?utf-8?B?S0h5REZwU3lkS0s2am80cWQxZkFubGorY3JsVW9IZDE0cEliSUt6akJxVkc1?=
 =?utf-8?B?MGhqWE03Wm5OOU1sejZ2RTNMS2FzVHZrdXNLNUdoa1ZOc250WG1kUHpmSUVT?=
 =?utf-8?B?US9kRXNBTUs5eW9xSVY1SzVwWTR2NHZickNJTk81ZmNWbmo2NURURXl1UXBu?=
 =?utf-8?B?Y0Jnb3NjRVBWTVZpNWdpOWVUWDBGQ0JWdDZnditNK29Fc2MwbmU2TnFNOThx?=
 =?utf-8?B?TWtRbFJVMXFxQ0JkalpjQWM0ZjFCMTA3Z3lHZkZKWldwQ3NUS1NXdmp1ZXpk?=
 =?utf-8?B?OVcxOWhSNEZIamEyekhOcWRmVHpvL1NtS3lOaFYwTFQ2NUpES3B5VlJRVXRn?=
 =?utf-8?B?bENmOVlaNTNhNGxsY2xLRnppekRDYlNtVHFRM0RSUkJLblZabnhETzN4Wmk2?=
 =?utf-8?B?Y0RxMU4vSGMwVlV4WFpoVzJuNm8vV2VDUGFkUU1NTlRDZS9lQXZFd1FmMkUw?=
 =?utf-8?B?M0QyaWlpZGJtM1JDVXV6YzdldVBPOVV3aTFqcWpwcE9GQVpCSmFla3BLMjZ4?=
 =?utf-8?B?NWw2cEs3MHh6elNyaWwvNzBISEcveFljQ2htMjdtMmNDdDdGVkh2VXBKSEU0?=
 =?utf-8?B?ODNoS2ZYUlo5QnlzdmFpWE9ubnlEUVJqcklIY1JXR3YrTVVzV0d0aE9FdXo3?=
 =?utf-8?B?djNiYUs3Sks2QXRGUHJuZXR4T1J4aUNyRzRGZG1MaEpvN1pqRUliNnEyY3ZD?=
 =?utf-8?Q?wNbj0DIfHxdz6vKYmI/a2odiE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6c5246-7be7-4f24-73f2-08daf92fad21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:40:39.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JiF7FK0YDU9ooyuBoUrycOnDB3i294rEXxJuYWOL4US6MqaQlCF6qyvvijbomdu7Be1eiic2C46w9/M23VUYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8813

On 17.01.2023 18:43, Ayan Kumar Halder wrote:
> One should now be able to use 'paddr_t' to represent address and size.
> Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Rebased the patch.
> 
>  xen/arch/arm/domain_build.c        |  9 +++++----
>  xen/arch/arm/gic-v3.c              |  2 +-
>  xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>  xen/drivers/char/exynos4210-uart.c |  2 +-
>  xen/drivers/char/ns16550.c         |  8 ++++----

Please make sure you Cc all maintainers.

> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>  {
> -    u64 orig_base = uart->io_base;
> +    paddr_t orig_base = uart->io_base;
>      unsigned int b, d, f, nextf, i;
>  
>      /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                      else
>                          size = len & PCI_BASE_ADDRESS_MEM_MASK;
>  
> -                    uart->io_base = ((u64)bar_64 << 32) |
> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>                                      (bar & PCI_BASE_ADDRESS_MEM_MASK);
>                  }

This looks wrong to me: You shouldn't blindly truncate to 32 bits. You need
to refuse acting on 64-bit BARs with the upper address bits non-zero.

If already you correct logic even in code not used on Arm (which I appreciate),
then there's actually also related command line handling which needs adjustment.
The use of simple_strtoul() to obtain ->io_base is bogus - this then needs to
be simple_strtoull() (perhaps in a separate prereq patch), and in the 32-bit-
paddr case you'd again need to check for truncation (in the patch here).

While doing the review I've noticed this

    uart->io_size = spcr->serial_port.bit_width;

in ns16550_acpi_uart_init(). This was introduced in 17b516196c55 ("ns16550:
add ACPI support for ARM only"), so Wei, Julien: Doesn't the right hand value
need DIV_ROUND_UP(, 8) to convert from bit count to byte count?

Jan

