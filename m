Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28932757D2A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565231.883207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkcV-0004eY-Rd; Tue, 18 Jul 2023 13:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565231.883207; Tue, 18 Jul 2023 13:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkcV-0004a5-OG; Tue, 18 Jul 2023 13:20:03 +0000
Received: by outflank-mailman (input) for mailman id 565231;
 Tue, 18 Jul 2023 13:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLkcU-0003kW-0T
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:20:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc31cb31-256d-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:20:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 13:19:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:19:58 +0000
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
X-Inumbo-ID: cc31cb31-256d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQcI0VG1PaxNQy12xkMXZfaSdCMqWAIQfzEmNNhpGjDBGW1ieT4lEARvjRQQK0c5SQ2IBQ99wY3Wl8Q/eURZf9wpYDQCtLtC8yFdjSEJXQ3bkeFzak2WmIABLpLTWeF+Dd2bbMRxpy8sVjWCIlbvirtb9lGWOE88SgyX1RGnXgqk8AqOV9vrhOnXEAA4zyxYrdGncQ3iKTK3moBDELQerafAnj3DlXfv6QpjTvwaxi3F+XEzWUG5pAFDXO1FwlSwl/Dc7N9hoOo1oQYkEuvEhxq3kseOeFnuY5Zs0uomuKqRJa2ZRkvwOWEMUJOxgjHaViOiV3qIfZd3BmSIGxIRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAYuyBxSmIBnmASGk99SD4iM8FTfM6u4BoEaGoa3eIc=;
 b=DwyGXD1Utn3w1a6WD6SC4Vy4fzMOvdyzwepwA4HuE1BvwQ7g7dzZJ1PdG6/kKLmqdD+0IWB7OIh0A8wbvU/06eAUL9WmB1mKU7SdYsbsyWROGF7c/wuwIbdoiw4buyTFGdQd/P4CvMvoadsjkPamEsZFOohxN0TCmLfI81eRKErn1uqZPkjDhad9k/Ug3PZjK+ItcrJYmoDhMNSoHoMAyPurrs2M4LbQdBmS03OGh/QAk2fYXQ9vABGrNU3uGfrIOdqSGZMmaxznjHQY7VrIq4QRf5o0Pon/UBMCML85mWevD1gMcriGtWDBXXZ5kjUbAz3IgWDxNHPqYIRZCTdA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAYuyBxSmIBnmASGk99SD4iM8FTfM6u4BoEaGoa3eIc=;
 b=xeKkbjvdxn9ceDqdUTL0CFbs3C7gkfXbEKAJEokdLN0lNR5PhHLK/7WiOfJgNtRHU+Lp+/yJLLi6jFpRUy4XGpQbxO698c3uu0/gknRK+p5N12ixDTXIkg2eWsWi5GX47eVnd/PMmwOgeBHx/RCF/Uht01QPbrbG42C5KCGswMrW7MA4OD5CFIzGOY/snqt6AMeVN6y7wiToo/RplWfcP23KaXZlUyEognJsCYIDMoEjDxD3zSXHAbdomzDJxZPGHFaIpi+yPKu/9obXqPsNORlvZSIm541lw3o9n5ApZQ7adr2EdowUz70eWT8IvBO53A9g/MGejvS6tavuga0TLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <386eb540-8688-1a95-1e75-133bb21223fc@suse.com>
Date: Tue, 18 Jul 2023 15:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] x86: Add Kconfig option to require NX bit support
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230629121713.1211-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c3a8ef-0f20-4755-8247-08db8791af26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJ5T/c1T+8qpfYBjh7yma57NNbfniJKvyE4HasxvZ6DpGwImjhTz/QjuW3p4bYCMAiC/RgqPwbqjbl8lF/fX4/7M9mb+biB0rpx6+TBxq7KgbyYm/ko6oLaApFoLa/DglN9ji5m8fzO/n6osuFcguamK3/m6BNDRXmYcs+tbADKCa9qhWUjNia3qcpyNIu1L/8TLVrF3H97t5rdzHRmtvMg2cv6u0NMRJL+D0x9LWs7qtGRFAMWkMjwSVloy0/c/hnQe7TbXWp2QaSsJzFdemUmrVfwvfWNY/lh3ragGmAFjcVzqMGD7DD7r4xLGpkl7yq9Tw2QO8ro8wkr9vETbwS+jBYXKPM4/sIdS4m2YuejXn77C0LiV59ceUSBTJZt9YDXBhWdrFTo8r+pdANW7/UUuxM/Q5qwu11PUbOTn3riPcYz5QPqpnZhceGG7TuUcuiHq6E+RrbHAdMnQ4AplN1ALmHVBkfemX4nw4VlfNeEVBp1VhXDYfuIwwks1L7g+EC4cvog+Q8U0X68eufnGTiOwrioWBr0Wwo99b0AvS2YbUez7V91i39FYqgfP2nxK3VkeUQOqDFi0TlchDKs8aTQ5ewAbzNsJ7xhQR7v3G1xrziyCJeWPC7IOVtK1n7PgTNhK8+FlH20FLcWK9NhkYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(54906003)(38100700002)(6486002)(41300700001)(8936002)(8676002)(316002)(478600001)(5660300002)(66946007)(66476007)(4326008)(66556008)(6916009)(186003)(2616005)(6506007)(6512007)(26005)(53546011)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdnRXQ4NGdmTUJsWWQ5dUFlbUZvSnNxbXhxNCtuNkpDK2ZLQlJCYkVEL21W?=
 =?utf-8?B?T3RPbE9sSXJsa2hpMUxoTGNRMnI3T0VzdXZucHdsZFBZcWp4VmtHb0pBczUz?=
 =?utf-8?B?dEUrSFVoWnNFM0xZN0JCUFlrM0VlN0NzdXZRTTRvNG5NK0d5eERreVN4SGUw?=
 =?utf-8?B?cUtIcXRROUVlWDdldUZyNStkRE5DcXVFV1FZeDVrNjA0U2JGaGFjd0hEMkJY?=
 =?utf-8?B?VVhzNHdBU2FidjFFL0ZkRGd1d3I3YXpQMnUxL0RERVBZdGwrd0ZhcmZvcTZt?=
 =?utf-8?B?Tk5yQ0UwQ2VNWU1heDI2aDJYTUNqeFRCOS8wbHZYbThPa05ObExqNER0RXNR?=
 =?utf-8?B?UVdJckZ3UmUvNXNZQzIxeVRnVzRMTC9Nd0FaWnFURnphdzVwZG1kZFVWbnA3?=
 =?utf-8?B?OEh6cnpPYlhQN1g0TTNiQVpod1dQZk9Id1lNZFVHS0c3aEtCZzhMK0JXV096?=
 =?utf-8?B?UmZ6VjhMbjR4V0wyd0dHdFJCNTBrTUVKT3hvckVJN1lteTBodXJQSmtlTmtw?=
 =?utf-8?B?bVgwdlYyQ0pVODNxWUxITTZyNHRmUDlLZHphSlRYSlROTGxNbDhJTy9kNUNh?=
 =?utf-8?B?b2NHMzdyQzNSSnY3SmRUeHN1Y0RST21WUXVueDNvbW5PRVUxZnZ6b1hEQkpK?=
 =?utf-8?B?QVBQN3FBTm9mVkZwMlFpc2QvYVBWdzlhYkJsSzhqdjF3bWtoUTVzZ1c5VE11?=
 =?utf-8?B?WXExSS9uaTdwa045QmVTcy9aMmpZWEUrV3dmN21aQ2hXVVNla1o2aUlud2lt?=
 =?utf-8?B?UDlEM2o2blBCeDJHTnpMQS9NVmozMUlhcVlva0RLc3FLQ0FORG9IOVJ5dzhK?=
 =?utf-8?B?OFJaZ0N2Vy8ycEQ1VE03akdEdlZxWkdzcUFCV2VVdVRtZjNKZ3NvYStXNXhI?=
 =?utf-8?B?cjFWK0tWbUlDMWpMaW1qSzZMUDdzRnFuTyt6Y2t5dHN6ck5HSW1DSEJUOTkv?=
 =?utf-8?B?TmxvZ0dHNjBKR3ZlWitoU1I3eU9BU0xuTis3YzZpRzBjL1dodHJnUkp0MXBp?=
 =?utf-8?B?eFAxWCs0NFUrOHdYSmVXNUZHMFMwd1lQc1FXUHZMcVhKUCtrL0dXRHlUZmti?=
 =?utf-8?B?M1ZxMGxFMkRRVFJtY2hyV1o2TlJxb1htWitFWFNJU1NyajRRcGNneTFiaEpI?=
 =?utf-8?B?eW02aWZudEdBSlRycTIvL0M1Qm9MdEdWSWMvcEt2S3lOWmtNdmwvWkJMVDFB?=
 =?utf-8?B?NVFTUkFkNFdtOGhQK3JVSldUR1NYTkpKcXlYYzJQMlV5VzZ6aEVHR1VjWnUx?=
 =?utf-8?B?bzJvbFJIY3JOUFp5NTZmRTBXcnUyMjNIZE9xdVB1VHZFQWFUQnpJZFpRWElB?=
 =?utf-8?B?WHFuRFU3YnI5YkN3SDJWa2Q4Z3FOT3lvSGhhU2dDM1gwd1ora3RrNmlUaURH?=
 =?utf-8?B?RzREVndIbit1ZTIrTUYrTzNqWnJQVFFHbCs2WGRoUHNOcXFmUFJrcndmNm1h?=
 =?utf-8?B?MTJsb1UrdUpEc0Z3dnV4ZHVBZ1BtcWNRNU5MVnFUVGF5NDRYTlFRSDN3RzFl?=
 =?utf-8?B?SGo4bmlVdmtFMFBicDJHYUozUlhUMWYxaHk2aFVMTUFNMXRuaVl3TCtERk5P?=
 =?utf-8?B?YTVJVEFVeXVrTFd1SHNYaHN0K0RSdVRpUnRja2xsMExuVGFVTFNGNjJMa3Ny?=
 =?utf-8?B?Y21yb3Voc1JnbU9FRk84YzZKT3JUWVBQVVpiUGJINWxXN2Q0eXgrT01kQm52?=
 =?utf-8?B?b01UdG1BZDd5TzhIb1oyeWNxaWRvMDZhNmJ4cXQvS2tXbWQyWGtNVnFxM1Fj?=
 =?utf-8?B?ZGZIRFNTNldRMUpwR0x4bm9nQ09kMGNSbGxGWmxqS2prS0tuL1hBRzkreTMy?=
 =?utf-8?B?T0EySVBTK3dNYmNHZER2dEQ5Z0lXMlQwYWJTM0EyWnRMOXV4UWZNTDVucTdp?=
 =?utf-8?B?cFhPcytmVlI5Qlk4TElrU3dnVHY4KzZpdmkrK21rWVgvZTJiSEg3aGxsTGtL?=
 =?utf-8?B?cnUyaDZtM1JNWGt4a1RjdFF4NFFBY0R6SVREbUMxSExUQ29xTEZOWkIxVUJj?=
 =?utf-8?B?YzFZSGNVT1E5NmpNU1B4SkVTcmlXRTMrd2FxdjFZOGpIdk1jRWdNUTBuYTZV?=
 =?utf-8?B?eENjNFVpVDNQMENkN0xlZit0RXd6UEMxdEYrYlp1ZjJIM1pJUkMzM1FpOW5n?=
 =?utf-8?Q?RGaeLTdRCRIYFg1qBihkAr2HJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c3a8ef-0f20-4755-8247-08db8791af26
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:19:58.2683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAnme3LByg98k9zKmOaPtDnK8ZWTdqOZh1WUWe7PFxk0pJhBQ2UQTWNhDoVNDZ3iHv54xvfnjlpW6g7++9AKEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7260

On 29.06.2023 14:17, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -123,6 +123,7 @@ multiboot2_header:
>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> +.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>  
>          .section .init.data, "aw", @progbits
>          .align 4
> @@ -153,6 +154,11 @@ early_error: /* Here to improve the disassembly. */
>  .Lnot_aligned:
>          add     $sym_offs(.Lbag_alg_msg), %esi
>          jmp     .Lget_vtb
> +#ifdef CONFIG_REQUIRE_NX
> +.Lno_nx:
> +        add     $sym_offs(.Lno_nx_msg), %esi
> +        jmp     .Lget_vtb
> +#endif

Since I'm in the process of introducing more such paths (for the x86-64-v<N>
series), I'm curious: Have you actually had success with getting any output
from this code path? I see unreadable output come through serial (provided
it's the normal com1 I/O port location where the serial port is), which
likely is because baud rate wasn't configured yet, and hence I might have
success by changing the config of the receiving side. And I see nothing at
all on the screen. While kind of expected when in graphics mode, I wonder
whether this ever worked, or whether this has simply bitrotted because of
never actually coming into play.

Jan

