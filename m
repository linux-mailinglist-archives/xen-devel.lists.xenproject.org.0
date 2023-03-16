Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603A6BD188
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510618.788616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco3i-0004bw-Oe; Thu, 16 Mar 2023 13:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510618.788616; Thu, 16 Mar 2023 13:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco3i-0004Z2-L2; Thu, 16 Mar 2023 13:54:22 +0000
Received: by outflank-mailman (input) for mailman id 510618;
 Thu, 16 Mar 2023 13:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pco3g-0004Yk-V2
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:54:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8178d8-c402-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 14:54:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:54:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:54:15 +0000
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
X-Inumbo-ID: 0b8178d8-c402-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buCEHxvfxECAy9kY/uILWEQluXAVZiY8Q908G0GWTQcx1dAvLAixs5GnSjTfnAvnT1ZAm6RV1AG2P8AufO5FPGgHZ3oYuq7MCSG+p+BGDDkm3+8l/pNtdzuv9RjPH1GUqoq4MaFv5ySEhN+Cx/LGb95oRGNuhk7gKFnEn/UpnV5w69kIp0+YuNP3wVPTkCO6oIpY8RArFiWH3ZCB5aZhjHLqOYglVKomKxZOw2oJrqvfEt88MzDz1lrOQ24r8Hhvk2ucl3O6FtNTj5Z22TgFXR8BwfeX7/XlVyuRusyiottBmDuyX1iAHeqE6Q8ZLKkEYhgbHId68tkzkjpPQ/kWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb17+LzZElRJyCFvA7B6zLYsmWnVZwBMBmAEEr+v5zM=;
 b=d4p4DlJloJ/b8MOdRZO5YbY/EkeDxf2Osmqy6EDokpaltue4TOBvGKtMCunAD86lIns8FqkcWv2EYL4bEotTcj1vJCvky9neFNW7lP21Ahc+WbpAOA99FDoI5jCAI3UUh1Kxr15rWqcnAVHDEQNoClMpm9oK22l8dDGxxPB3gOSvswaETh+xmA2jpmgOgY+8oICWaQQ37X1OMxEydIoNlIIfJXqhHv9i5GMk6rhPm4aMP+XeX9tjQmmgFIrQ6HF1wZ1VpHVjGCnm/9Y2QLX+sK95kUlVwXXWIi3X97xXLPjv087QP4Hta30TtuaQl9O6HLJhnXevO6IxR/DhaL/JkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb17+LzZElRJyCFvA7B6zLYsmWnVZwBMBmAEEr+v5zM=;
 b=ZUlNt7ePjzlm+7IplArVw5vvmBBVC9v/qAXOICYIxfXP2j/J0weJUq3V6KU5ELfyBOzDpGrM7fQIL/E5zl9jSJOC5NRcFGvAj9ov3S4Nwc9/BYY92LIR7xFuC9HNoLkKHOIaE6eSg5QbBMRtuuJ37zFZj2jh9SgbEddmp2M8y2gPMr1cZt9vbS+zQhQQ9a97vKyDNgjX6L4mgmcGJyTqVpKJiaQAn9wLaVfqwZyY8B2q7LjYp3tWP+jY0D/ZJLPXkJaOLPPLZ9AB1m5LnuXjknyxeBEiHgfwmbFoBmYZHGeh66F4mzX890EkBpgtTTrTuj4heDGknm4FQKpddPIBoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cb02d15-05d3-ab40-845e-f124604c8843@suse.com>
Date: Thu, 16 Mar 2023 14:54:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
 <2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f79e62-25bf-41d7-81e0-08db2625ee2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmitxhXytCWtKAel7DKPYXenSgVfxA1MPtVkfcLVmF8U8BjaboFkRVFyGNpt+Hpm7Fzf2UU+P756sdP2Eh7rvZcsn93Wv8+fIDLhIkrOuKR98SkVGPf//YQAzprMUjGma0vLdhLFj3gA3f+tX1wj6kXwB49FeIRvDglsD5j77VT2oJtMSKfz8XVQpZ7w02i1W9UiPtvpGJRj+wP+hDUM7O7peiCmt7lAOUE3inSU1KqNkiS2wx+0nrw5YV7Fm19f96thiEgaV2wh9iclzE+U+8EqAF/k5qLFdpa6d+pywk3eYtuLd1sM2NyzDppY0u8UvrtYTX0aRREwQfShZeeZndf44PCJQE51S67nQDCzzzhhPfg+yV2H+U6OGJ0/H7rWoQE63RxjRpNa4bfNMYNugElBPMDhNgJnwRt5WY7ZfUm/h++lCl+TGffYEQKRQMSj5+O27lJFyrBTocQwe3ec2R2s0MV0rzeT60DY0GKR8YPVEcOFQaCUgnH0947XyzQ3EnpnhgpDOPinNMPiNvlBYw/h6OBYUg7Nc4RIPss7wywy/qB0ZVTODkiW1SC39ogpOFCwv/m9+MPKe2hw5gF09RFwnMVJcj+BKUbkQa4Vf8O51S5aEFuSD1Ext1FmppYT7N4S8eAdWy+8MQ9nKLLaBhpEFdmpy+8lON9YcEdbsC+yq++Wa14RbdO+AiEWjIiiCvSfh3d5kZ3wJuUuLSn4TBa7eLHKicUNl0xifow9yjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199018)(53546011)(31686004)(6486002)(36756003)(31696002)(86362001)(6506007)(186003)(38100700002)(26005)(6512007)(2616005)(478600001)(4326008)(316002)(54906003)(8676002)(66476007)(66946007)(6916009)(41300700001)(8936002)(2906002)(66556008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVFwbFRsRWQ4K1A1dnRlTnhUVTJsNTB4Zi9CblNJeGdTMmN3UENIVVNmaEkr?=
 =?utf-8?B?WW9ZWTNEQUgrUWQ1d0Vmd0RRN3puaVhCZG0yL2JmaCt0K0l0dG9GWDN0R0pI?=
 =?utf-8?B?aVJGRHJXMVpTYy94cXdOSkZYS3RWT0NQTk94KzFUQlhsVTVNSDNhcVFwQmtV?=
 =?utf-8?B?RE1HVC8xd3NldVhYcUpkZ1A0dm8wMFhreW9oODhpbU9GV2t3NDdKZlRaYTlh?=
 =?utf-8?B?M3dDckQxY3lYbGtiRS85MlJGM05OeiticmZDM0FDeHRwanBCNy9wYk4vRFpu?=
 =?utf-8?B?NlNPa2pwY3c0Yk1kMHQxUWdQaEw3UXJEZ2JuK3czemJhZlpxYjlPa3ZsZU1E?=
 =?utf-8?B?MEVZZUZSL2JBOFNPbkgvc2lvZ0Q1WHVoY2llb0RXZWw1YkQvTHo1ek9GN0pm?=
 =?utf-8?B?UzhabzlURmVrV2tlT0VoR21yY1VUYmZXTnZLQ0UzVnhPTjFRRGZCMjVIV1N4?=
 =?utf-8?B?a3JTVUsremF1SDZXSlZWZDBmeTBwenhGdXBSSFJsRmYrTVExSWtlNFBjM0V4?=
 =?utf-8?B?WmtJTHVXTGNkbk1ib3Q4aWlkS0JVbFlGM1JnaWxZZ3ZPaC84MFNBNi9lRFp6?=
 =?utf-8?B?N3gzbkxTZG5IOVFhQ21pb1Rua2Noai92bkEzMlNWNFFRRVZpNTZpcFNVZ0g1?=
 =?utf-8?B?RExIc1FPWDk0K1RkOFZnSVJYYnluYzQwdUdIUi9reWJRNWFrSlNoWnZQanVs?=
 =?utf-8?B?RitwWnRUWmc0dEhocUJlNldrQVc3OWVseXZRenFUWFJoZjc0QjBEbm5iL1Y5?=
 =?utf-8?B?RWppcjEyU3ZQbFdQWU5GSG1tTzFTa084YXdpK2dNbUsybUtNZDlLbStkSUxJ?=
 =?utf-8?B?U1dSTTQzWXZPS09ZUXg1eGNPN3I5Umd3L0daMk5HZzNsWDJrS3d5aGY0NDVH?=
 =?utf-8?B?UmFaa29aTVIxdFFvYWJZSHNhZHQwa09yaUw5WWJjYjhicEh2NDluM0xBaE93?=
 =?utf-8?B?SFJ0K3haSnlKNEF5WjIxMGc4dmpKQmp1WU05VW1BNzFJcHFDd0EwSGxFNm1M?=
 =?utf-8?B?aDNrRzBRYzF2V244Q1VQaC9mS0hBbkExVUtKL2dHR1Y4Vzg4VjZlYk5oa2Jx?=
 =?utf-8?B?SUovcENLTlVnTDZpeFVXazBnT1hKcVlhT2t1ZW1TNFpUMVRiQkZLSWNrUksx?=
 =?utf-8?B?SHNQZ3VkK2dFb1F1VjlSYUJkb1N5cExDYmdISkhwaGRVR3lPMjRYRmd6anJQ?=
 =?utf-8?B?S0xUWnhjazdxVVJxWUl4b1BTSkwrVW5tYWZjZk5uMWdYaGRBVGdZK1dsRHFy?=
 =?utf-8?B?WXpscy9zTllIWFMrNXJwR1dleDQvTFdueGVMcU1iL1hweWRPZXk0QTdHRUNX?=
 =?utf-8?B?TWQ4anViUGN6SjAwNFFFNVdkZCt1N0JEZnh5Y1BjWVgxSWZhSUwrcFlyNldF?=
 =?utf-8?B?cmxLK3lwVFNpQTA1ekdVS0F6bEZIcEl2S09EWC9CbG1pcTN1QkRDNHZPMmZL?=
 =?utf-8?B?S2NFTFdXNDJNS0dIc3pKZXIvclhzZ0Jac0k1K0o4ZitOYTFYT3AwVkVmQm9Y?=
 =?utf-8?B?OVJKNTJDc1ZqRksydGRnWHFkY1VpbmhEejE1bDJVU3lmWWdNT0swNWhMRjAv?=
 =?utf-8?B?eVdzQldaOWhIUkZMa1EzeUs1andMaktiMVVCdWQyTi9RNHJRZVN1UWU0di9X?=
 =?utf-8?B?SzNtRVhEL0VoeTZFUyt2ZTd5aUFVdmJiV2cveEFCcnMrTUUzSkZiUUw2dU44?=
 =?utf-8?B?ZTRKelJzRjMvR2NKUU9pYjIwR1M5U3EyT2phVzFEcHAxaVltRXlhWjk2REJK?=
 =?utf-8?B?TVYySGNYc1ZSUjhCZHhGNW5jV3FXa1lrQTBqM0VKK2kvWkV5U05UUTZCN0to?=
 =?utf-8?B?bU5PNVRrVmNWNmdObVcwaGRkb09uK21lTjRXMU1iZTJBNzk0cWZEVVcxUmxY?=
 =?utf-8?B?WXRjSW5TbXZ2cFd6eHM3V3BZeXhydFhsZDNqVkZEOVlYUW1nRXVjRzlYZkpC?=
 =?utf-8?B?dVhwYXhET3dxS2lzYzFJc3k1U2hlOFZiRzkyb2VBdWNCL0luOFcwS3o1UnFl?=
 =?utf-8?B?RGJheUFzeFY2WXYvellwOE8xdWQ3OGZVV3ZkRWNIeU1PV1hWdGJmZVR5Qnc5?=
 =?utf-8?B?RHl0WjBxc2hpR2VNd2c4ZXA0Ukord0ovYlFWREdMUFFLNVNpTVlGSUZMSHBJ?=
 =?utf-8?Q?Zc5O0qMoz7eTNS32+/bHaQ1F+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f79e62-25bf-41d7-81e0-08db2625ee2c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:54:15.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJKYMNZhSIwMKQyiIIw/rHSyfZ3LqimBBvDDi8BwJwP7x2iag2YoeK3XrFQ+2OZ2n492qaj1mCiVOXIa6JIkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 16.03.2023 14:22, Oleksii Kurochko wrote:
> The patch is needed to keep all address of cpu0_boot_stack
> PC-relative.
> 
> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic
> or compiler flags.
> 
> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> where all addresses will be without counting that it might happen
> that linker address != load address ( so addresses inside got
> sections will be relative to linker time ).
> 
> It happens becuase the compiler from riscv64 docker compiled with
> --enable-default-pie:
>   [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -v
>   Using built-in specs.
>   COLLECT_GCC=riscv64-linux-gnu-gcc
>   COLLECT_LTO_WRAPPER=/usr/lib/gcc/riscv64-linux-gnu/12.2.0/lto-wrapper
>   Target: riscv64-linux-gnu
>   Configured with: /build/riscv64-linux-gnu-gcc/src/gcc-12.2.0/configure
>   --prefix=/usr --program-prefix=riscv64-linux-gnu- --with-local-
>   prefix=/usr/riscv64-linux-gnu --with-sysroot=/usr/riscv64-linux-gnu --
>   with-build-sysroot=/usr/riscv64-linux-gnu --libdir=/usr/lib --
>   libexecdir=/usr/lib --target=riscv64-linux-gnu --host=x86_64-pc-linux-
>   gnu --build=x86_64-pc-linux-gnu --with-system-zlib --with-isl --with-
>   linker-hash-style=gnu --disable-nls --disable-libunwind-exceptions --
>   disable-libstdcxx-pch --disable-libssp --disable-multilib --disable-
>   werror --enable-languages=c,c++ --enable-shared --enable-threads=posix
>   --enable-__cxa_atexit --enable-clocale=gnu --enable-gnu-unique-object -
>   -enable-linker-build-id --enable-lto --enable-plugin --enable-install-
>   libiberty --enable-gnu-indirect-function --enable-default-pie --enable-
>   checking=release
>   Thread model: posix
>   Supported LTO compression algorithms: zlib zstd
>   gcc version 12.2.0 (GCC)
> 
> Looking at gcc spec file for the RISC-V architecture:
>   [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i
>   pic
>   --traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno-
>   PIE|fno-pic|fno-PIC:;:-fpic} %{march=*} %{mabi=*} %{mno-relax} %{mbig-
>   endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=*}
> which means that -fpic is enabled if none of the following options are
> present on the command line:
>     -fno-pie
>     -fno-PIE
>     -fno-pic
>     -fno-PIC
> 
> That's the reasons why 'la' is transformed to 'aupic/l{w|d} GOT' and
> not be dependent on the toolchain used.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

There may also want to be Suggested-by to both Andrew and me.

Jan

