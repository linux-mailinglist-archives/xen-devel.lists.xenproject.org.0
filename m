Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22885428866
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205447.360744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqPB-000183-LE; Mon, 11 Oct 2021 08:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205447.360744; Mon, 11 Oct 2021 08:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqPB-00016D-D7; Mon, 11 Oct 2021 08:11:29 +0000
Received: by outflank-mailman (input) for mailman id 205447;
 Mon, 11 Oct 2021 08:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqPA-000167-Dy
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:11:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4247c4e-2a6a-11ec-80d0-12813bfff9fa;
 Mon, 11 Oct 2021 08:11:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-fzQJtpmpNMKef9kbV6xTYw-1; Mon, 11 Oct 2021 10:11:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 08:11:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:11:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.24 via Frontend Transport; Mon, 11 Oct 2021 08:11:21 +0000
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
X-Inumbo-ID: d4247c4e-2a6a-11ec-80d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633939885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj7UsMq9SrEe2FV3McSS9jWXqS6uB0dcy2UGnm64cuI=;
	b=DyTPeh1vYxal8Y7l5NN9y5VbJKsKEgLcx6+FQLo4Fyiomai1yheuTzjRvw6l+g2gS2UZA1
	Xxf8QMQ6NcbJvH2xI260w96YXSZkS07DThLyL2aZnvCLPtPuD6/2s8npgCfMqWMxXa8H+e
	+Ff4DjGFxp0MX9+95EbQmsHlf5hjSpM=
X-MC-Unique: fzQJtpmpNMKef9kbV6xTYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2yjGgvmYJnxbtwdVg+1DKS72yRO8qci97VjTz4V80O9wVXboVWDYdFeUZdCp1gjt1ScbD5JOelwArWhVDLTlgKZRJu6SGjOS30x0IU3soRV5blFn2e0X97b60ezTVcBYzOTda0l26BFzAD9/YMwRN8Qa77aDcP9ktyrvEGJ8DPrKYxfMKBZWC2NpqHDfGViZqoget5QtA2tNhGR3XUf6IcMFAEe7gq4OEupoJbD1XSPGQknXfxv3rhV4o/PxvPPmWuyi67rVJ3HGXQdp02x4382ZJaFqzE47r/pfmiJP941lcTbHPumUWiNX+V6JIbN+SycOs277BGqpznsiun99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj7UsMq9SrEe2FV3McSS9jWXqS6uB0dcy2UGnm64cuI=;
 b=O4sbrZjGOqKUwNRY4DYhOfFVOqKpRo4wqG86zr3daFIlnUAdgh6jGCDE/Gfvdl55ghvmIl/Ump1wY8ZgxuJ2NxprimNRhiyTTgxXHs1YU7Phzfo7rkYtPr5V35uN273DNMONPuvFevOHAFz+PWXLr1Ikbw3xjlJ8pFItkRbsuXonbtLwdbaeYWGbImn0bLDrjYTaZTkunVr2CxHuWL+7TowiafnlUW1l6dQ3JprW2KvvpFi1dy8HC+J8jMm4HB/LOY4T+Sk5pOnlHA9d3VCnx50TllVGa532bWRfHtXJ7AsGgT/G9aZz+t01Jl7t0tIBvGLYKy2z7CjyRDzylCUb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com>
Date: Mon, 11 Oct 2021 10:11:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211011080302.24203-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf2992cd-43ee-4633-30c1-08d98c8eb627
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68631948D2A2A30451329E48B3B59@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:295;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nPxe+gS8HYCGEPt1A1SH1EcrQniauynsW3hxl6sFbhXw3UA0gt4M3raM5YaUnuJLa/xhbplibUwf5M2G3+BxQo8jHM5a4VMZdEOBmscQSzwhVdTILy5ss8Hq8UfBzlhL7sMYWufbH/3okmcVnsd3OgHCocfrmm7g5KGBljKkD57MooQrGwdxOQRJ+9tl3VRc5DYYclU38g9o95Ke4+r4/LG4xlDzzd5/edxrqP7NKB7CeT7bZZw8dDtWiSOSyUtXpO+GX/Ds5GvgMM1UeP3Y06IMN6IJf2YkPLuegjyStAj0X61d22EDZHj5wzCPiMXgkCGCI+DHnNSA2plEfGXTquWD0hVCiAdMsVhDXXeYCXcZQxsRl6o6LIeNK2awNxNXZHQOwyEM5bb0x9pdEoi8h+Kcs0VcPp2u1Jd9ndbJ08PyKXRUaIkwOsFXoiEoMzSZFJEEozcspBqNvPZaXqK7GD6KBD6rCL1h+7YQYVuaX501FGuyQp+5/iYwLw9l2fdbLjP+j0d1EHM17z+bUhQZaGxiFDxrxV6cvnnyH8jrUgEmwvprVciJIkXtibYWAD8XU73a9bsK8m29Mujbyv3v7Mhk+3f7idK+cDC9E2J/BXy2njoKlrzft0K2qdAf/7AeFukhJsKDhOYQNM5ztY82Gc/G1ODMObuUd8OZzcL2UU/T1Ab8uWnSHo/uE3PtlvKRuoO3lXWObI1LyEY07Q2b2W1/iE27+5SoL1wBE0sl2TpL+x9o0HUbyuZCIbQlTSMyg00QCfTbqSvfpuf2G5EEjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(2906002)(54906003)(8936002)(6486002)(16576012)(83380400001)(6916009)(316002)(8676002)(26005)(38100700002)(7416002)(36756003)(2616005)(86362001)(508600001)(31686004)(5660300002)(66556008)(186003)(66946007)(956004)(4326008)(31696002)(66476007)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUUwY2tJTU1TNUhaUkpycGd6S1I3ejlHdEJrbm1KbU40emM3d3didmdTd0xz?=
 =?utf-8?B?dXc0bExjc0YxQ2tOYVZVZjcyRzdvU3VBT3p0UnNQM0plUXd2VWdUM2h6Vndh?=
 =?utf-8?B?aE94bWRNcnBJM25BNU5aYkZ2d3dhRjAyVGhDdlhwVXNBb3UwNXpzVi84WS9u?=
 =?utf-8?B?dXVOcGFqbmZpSEl0RUhnMEdROUlkZ1RySW52N2tlZGpwWUpiTzB1Q041dHpp?=
 =?utf-8?B?YmFLZ1UwbEF3YThjcjk0Ui9mR0hUNy81blF2UGtKRExTV3Q5RDdOY3ZVTlly?=
 =?utf-8?B?WjNCR2RkR3orMEEzamt5N1ovMjZRRlRhZWMrWUdUck1FUUV2UmhIQisxMUNZ?=
 =?utf-8?B?VGdscEwwNlhLcE1ib1ZCbDVqWVQwdDV3WlVKbVArRFh5VTZtQ0dXdDM4cGEx?=
 =?utf-8?B?WDNmNzFtbGFqaFQvSlB1aWRZcVFSWi9VK3hHa3dtdFJIYi81T0Y4d1hCTHJX?=
 =?utf-8?B?NVdxSXdqSUZCNjBxQ2Z1NUFhZWRvNm5QQy95VDBFUXNGSkJKU25UZjM1d2dF?=
 =?utf-8?B?U2VMZStKMnZtVlRWMzJLVFZaTExIMXBFY0pyQ3NvSlhCSldCMGNjYTlvdmQ3?=
 =?utf-8?B?bnRzZkFtbmNYOCt1WjZ1N3NQcU96ZzhGSDQ1TEVraUwwYzJkMkw0TDRZQTVh?=
 =?utf-8?B?L1dkVmJtNkUwWCtwYW5GM0hHbUNIQTk3aXVXQWViVm5oRTVCRG04elJLaXMz?=
 =?utf-8?B?WkJ3YkR5Mzk0blpLbWN6MkZ1NXhQQmptNzZEbERZUDNyUENkaUlYSS9aM0VZ?=
 =?utf-8?B?aGpqRHcyM1JiZEtKVEJDWEZ6K0FUZitmd2ZxQ0pnSUt1MlcyeGNKbGd1UG5p?=
 =?utf-8?B?NHE4SzFCV3kyRzN0UmV5RFY4NmRRYjF6bnpid2VSYlZwRjZhUXFPUHBFNkNy?=
 =?utf-8?B?Q0dsTm5hVnZZUVJDRjRtUEVJdlVEL2FOVExBalBpTmRLVzRVRENaNERXd3V6?=
 =?utf-8?B?NmpMWW1QeDBXTjJYY0R4MFhYQUtNM25Ea0ZHTVNodk9yaFU4N0dVbjV1azV6?=
 =?utf-8?B?dGZrbW9uOFB6ay9Db0NLd1RabmNPbW1SdDY0ajFwTm1Ua0pJZFJJMklFeXly?=
 =?utf-8?B?MExxZkJidjhDNXBMTnhzbWtaU1l6MDU2cVk0eDlGbGEveWRFQnZQbXNpaHEy?=
 =?utf-8?B?eVUxQmovdk9RRFJCQ2piN3FZKzZOVjN1M1dHaitoTXZodFV5REdmNk9Hc0hp?=
 =?utf-8?B?bXM0dnFHUzZpbjdhejhtcWxJRlRQc0grOUM5YUZoUUpPVUx6QWpiMVhqdU5L?=
 =?utf-8?B?N2hZZmV1QjRwajVZc2tBd1dUOWV3MlA5dkx2cDBmbCtKOTdhdlo3VkVKaHJr?=
 =?utf-8?B?U1pTTWNPRkpobUxKSTIxZGUrR1hmcjFzSDlCSk5ibkFPamdYWjNkbHhCdTFM?=
 =?utf-8?B?TWw5dkdQdTdDcEM4ZWh3L3dUVzI4eElWU1A2dmlScmN4NFVXSGo5R3BzR3Jj?=
 =?utf-8?B?RVk5RDdvOVd0WXN4ZFV6OHR5anByWUpsZ1dsQUdXcDZ3aHZlZFhERUQzQWxG?=
 =?utf-8?B?bk8yUUxIK0JWR0xwL29PdHROdWRzSEUxc1hhYXM0cldzZ2ZXUjBhelNCL0dm?=
 =?utf-8?B?eUhkR3ZMRFI4YVZCNk14d3A3bVNxb0F4Q3NieFdPQ2tzcUJPMTVCc3NVOWJE?=
 =?utf-8?B?Wjc5RFRzWWlPbmxsUVJJbmlqMys4dVVKVk8yWHVKTnBXMFZjZTdlVUNOUGdW?=
 =?utf-8?B?bEZnRVBqYzlYVFJ2Vm1FWkcrakV5djBPSFh0UHN0YWF5aTBMRDJiZ1dxVThD?=
 =?utf-8?Q?9/kOwrm9BvyzabIuTYDQf7VsDy1akRXYt4KLnhE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2992cd-43ee-4633-30c1-08d98c8eb627
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:11:21.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOCOuFhZFKoKOAjg6WwHhB98cavi7oyRW+v5YrxDn3THwGhC6PUK2YOP2vcHVnua9utoz/mWN45uSkHo1BnNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 11.10.2021 10:03, Luca Fancellu wrote:
> This patch introduces the support for dom0less configuration
> when using UEFI boot on ARM, it permits the EFI boot to
> continue if no dom0 kernel is specified but at least one domU
> is found.
> 
> Introduce the new property "xen,uefi-binary" for device tree boot
> module nodes that are subnode of "xen,domain" compatible nodes.
> The property holds a string containing the file name of the
> binary that shall be loaded by the uefi loader from the filesystem.
> 
> Introduce a new call efi_check_dt_boot(...) called during EFI boot
> that checks for module to be loaded using device tree.
> Architectures that don't support device tree don't have to
> provide this function.
> 
> Update efi documentation about how to start a dom0less
> setup using UEFI
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Did you get indication that these are fine to retain with ...

> ---
> Changes in v5:
> - Removed unneeded variable initialization
> - Fixed comment
> - Fixed error message for the absence of an initial domain kernel
> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
> message about the call introduction in the EFI boot flow.

... all of these changes? Every individual change may be minor enough,
but their sum makes me wonder. If so (or if at least one of the two
gets re-offered)
Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>      StdErr->OutputString(StdErr, (CHAR16 *)s );
>  }
>  
> +#ifndef CONFIG_HAS_DEVICE_TREE
> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)

... the "inline" here dropped. We don't normally add this outside of
headers, leaving it to the compiler to decide. In headers it's wanted
to avoid "defined by never used" style warnings.

Jan


