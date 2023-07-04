Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3B74702B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 13:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558287.872238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGeYw-0008Ad-Hy; Tue, 04 Jul 2023 11:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558287.872238; Tue, 04 Jul 2023 11:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGeYw-00087H-Dw; Tue, 04 Jul 2023 11:51:18 +0000
Received: by outflank-mailman (input) for mailman id 558287;
 Tue, 04 Jul 2023 11:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGeYu-00087B-90
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 11:51:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d06a30-1a61-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 13:51:12 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:51:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:51:06 +0000
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
X-Inumbo-ID: 12d06a30-1a61-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g05puPOLYeV0Hl5HOlyI37OhNG1W3yCFtTQ3SsGe55Mk0KAGX6kV4P8kssacRRC9262fvOrfuHqgKWRfzll7z6QcT20tO0lACNO1qN/i+MtVw2pK22inep6y2XFByIHyN1C/KcPBN2g0tgvNEXT8m7xd3pplQEqRbcqu9bBW6voM05lfTX0yOMkR2BwACZLQC6gzgpFcUgTz4nyyvGy29s4QQjs0XEk1hvXuKUNZhokUs+TJwUyRbNjkynI0EkWX2Su17LuC9rZ2dMSo2VBlxj2jnIcI5vm/U5SrQ8wzX5vboIkyZ422Ii+bIPJFPDwOvC2I2xEG7SsogeIH3uX+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3ANhmqLxdvka1UwAGjja914oZsDBwyaZbAbS5VTPug=;
 b=KL+HTjkRgrPZFjnVuu86MV1TNnAl8wrwWGmHonNMoywCMj1TfAmyjH1HinDMh4Dgh1f7rxROLlbOzPBFa4jnDOurB/guqSqmNXYmDYh8minwl/A3WXvycKVXHNA7sK+CIOaMiA0ZHl3XM7DFqlqpenzdyX6gsqnA3B87uecXYPHHyLb2elnJ6mhwcPm6absiAm2Qvw2/UPPk5XlkUvxvq9hSiEaLo3qKOM/DGEi3SfmZ+fPv9cYEQK4nJnbJVs7rvqItiBhQB6DtCgua/D0r3LUZLujN9AJLsryK4kR7MlvrXvXLdZu2/xzUBlJJUfrryotidnn1IsD4O1aeflpyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3ANhmqLxdvka1UwAGjja914oZsDBwyaZbAbS5VTPug=;
 b=cNVvrzmNbxniWqXRtegRn4WJj8rUH5o76tKJwcmW0f2TAKjP1oH5ZiHjj/JSgE4Wh4Oc29tAAORx9J/s0re3dhfOE1+PuhXetKmKYXIjWrM9SCkfs6viG8M8jVTBnJvliKfqU+AsV9Pw9UqLEkv91KUqOE+L+TDJjqbKIhor8iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5f3781d8-2f22-d6ab-dfe8-4a3d721a0459@amd.com>
Date: Tue, 4 Jul 2023 12:51:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/52] xen/arm64: move MMU related code from head.S to
 mmu/head.S
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-9-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ac331a-b7ff-4426-f9ad-08db7c84f37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Feic9l5MM7U4MsTiu2rza66mCn+PH0XFbGxMWXvsBli8TT44l9PnpJVV7qam3YaEejwDff6OApo2p7NNgAcjXh7capjFg9y9OQCjHeEikTC8TkHH5G/mxCWHq+aK4XQLsiWsxrVehwXfcCgvJ6ywyUJ3Ml6FaZ2pb4snjARMSBICmULY3z6ZgM6F3jN0zn3e97ykui9bIov5s0jSqKFhf7h2INS6w8u28lCaZtZOHW7SGtp7VtB98fIXf0pHzcKl2aGguiTXiJYToAlyk8PWDYFD1x4r9B/NlFoy9wAqzN43t3XPOKyVYJ9bJhVLtzyAF4ABOQyknFXALYKXz/0/tLn9iR0/i1Ek0dFlIlvNnrRleycFP8rAKRe3lE7f/2I5ZasTNA9mkBqNPMzyXh/Gp8HW1b0eNWxqH1VpcDiZUMyjgnPczDVFXD7pXwExmFG9Ax9SuRwfMqGoEnZ7ssl1U4aWcdB1/Vd361z0lnlQD17mgzbmjMitrsAHDGYwNuM8+aiXaNcSCY+lYggWMZQF4W8x8qStPLXvuBmEg7C+xBH66v7PQFok033DKpzM5GNjL9AX7N1nPaF1NgyGebh3eccEtNBLIbhTORlX2TOd1QIef62LFJSEtTetA/o16S7QNVWJgAADQIpjFXyLntvFsCIrNEyNjQuWG9HWGHYnRUw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(26005)(31686004)(478600001)(6666004)(6512007)(6506007)(31696002)(2616005)(186003)(53546011)(38100700002)(54906003)(66476007)(66556008)(4326008)(66946007)(83380400001)(6486002)(316002)(8676002)(8936002)(30864003)(41300700001)(2906002)(5660300002)(36756003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emd0VGQ1UEpnZnZvS0h3TTRjSHdoVkUzYkNJd1NrbGc0L256MVdUaVArZGp6?=
 =?utf-8?B?aSsyemxEdW1SbzdqUkYzTUQ4SWxCRlNSUVJXdWZpMmZMVEJHby92Vnp4Zzgw?=
 =?utf-8?B?cndGL3RzWmJkUmNSNU5GZGJxV0V2VnAwcC9UdUJSenhyRktJY21FSWFueDZD?=
 =?utf-8?B?RDhmaHdzQWFxbm5TNjhzOFV3eGhvTDZOQnIxU3hhYWdQaGU4YU9DUGpvSVc4?=
 =?utf-8?B?MXI3blVVanU1TkxZZmRLTHNqT3NhUTQ0aHBQdk5FUlVjN2ZpUS9CWFJHZWNY?=
 =?utf-8?B?NkQ1QVNUaUVzRUIzZXpBOG5IMTdJNy9YVDhxZUkrREFseldpYjFuVDR3bm1n?=
 =?utf-8?B?VERQMWVaNWp3YkR4am9YbHdzemF3OU1UcFdweGZXU1U4dEt1OTE4MFdsQ0Rj?=
 =?utf-8?B?eUVwbFo2YzgzdmZRNm44WWxOaWRjSWNWWmRHeE1SSlpRbk1VWnZzK1JKdDB2?=
 =?utf-8?B?aysvdnZjOTE1LzQxNWt3M1BXUzkwUXJSY3ZSRHVGRVBRanNuREhoeGVRV3Iz?=
 =?utf-8?B?VUFKcFNqZ2VFUU44dkw5SFhwRkdCSUM2S3ppL0dhVklxYm9CSDBueFNSUUIz?=
 =?utf-8?B?eDRhMHR0cGo4VEQ2YXRXUnZxVHZrWU5hMzZQRVFtUlRqNzZxMHdQU3VVL203?=
 =?utf-8?B?NEdLSnZGWFBmSTUwTlNrL3Z6cGNGbzNkWjhWdFNHdE5XcjZLSStYWUM1anRM?=
 =?utf-8?B?Yk9rUnFabUtwUWY4Vm1BMzZKN0Era1g5eUhkdWxsRU55bGt2ZUNBa0d4dHNX?=
 =?utf-8?B?OWVObzF3UGM2UXJ1b2pJdy9zS1hVVnE1cERyOThQRGR2V1orZkxoa2RTQlli?=
 =?utf-8?B?SFkwTVR2SVp1ZHp2Q2ZzbmtxUXNCSitHOEhRSEdXRjhlZlhNZEUzSk9pcUFw?=
 =?utf-8?B?bnBQQmI0WE1SL0tuSjBMRURoSXlpUGNkL3pqN1plVHRrRVo0Vkc5WDFZOERt?=
 =?utf-8?B?SW1XR2drdytZR0pNeVNqSFc5K2FrejNWOS9yaG0ycmNadWRRMTI5VXhtZnJS?=
 =?utf-8?B?TkdybCtUVnc0dXpNdzV0bGhuVldoVG51Vi9TZ2pWbTdnRGQ4SEt0TnpPNXl5?=
 =?utf-8?B?Zm5ZdWtTNE5pSWZFVjk4NmZsb3JLYUQ5U09tNHg0MnpzcUUxZXdYUk5zbTZT?=
 =?utf-8?B?SG52WWhnWUhwKzY0MTVoTGN3UXpIdzVRUjFINzFVK0l3bVk2TC9vNWhTUDdZ?=
 =?utf-8?B?ZGdmU2lOc0w5enhQZFpsNDBGdHJGM0FvNTdiWUs0MzRZNTdYS3EzYUFzMkVT?=
 =?utf-8?B?SHhQTHA1VWJZK2l1RlhsMko5NzR0UFY4T1BEcFRIMERkUlk2b3ZwazI0YUEy?=
 =?utf-8?B?cTVxRzExYVhVSUVVcnNLSkpEUENrTGNXYndjM1JjeEx3ZStLWDVuUjNYcHF4?=
 =?utf-8?B?SGptRS95cTR6c3UyV3pQOEtDWEpialhIa0llNExaK1BEeE1DN3dtZGNkbG9J?=
 =?utf-8?B?bnd1TElZUHhidUM5TW9VS1R5dXk4Z1BsSmhZNWd6NU5VSVBxZFhSdVJMYVVN?=
 =?utf-8?B?SEJBNUJwZVJ3bkNVbFQvZklBODhPN3h3QmQycFovN2M0QTlzeGkxMldPQzVM?=
 =?utf-8?B?QXhaN2tuVWJXbG9QempjRU92ZXZ2MTQ4NnEwVXk0SVRqd2hpN1VzeEhnMndB?=
 =?utf-8?B?RnF1d1prMmRueVpsTG5tbkJCSXhzY01zWS9HemZCVTVGYWw2MDdQeVZBTWlP?=
 =?utf-8?B?dnlZUVVsQjd6VXZTMXIxam4zOUpxTkRXaENoSml3SUZGaXlkSVI1aGZDTzVy?=
 =?utf-8?B?N3RzZkdQQTNMUXRLUnE5c0RVYmc3VTYrcWQ5ZW9tTEFVS3JTOExsVDFPK0R3?=
 =?utf-8?B?OGhISEtUb3kvNkpUcHhkb1B5NEZpOGY0dkdDZWNQVzI5clI4WFRKWjcxVSta?=
 =?utf-8?B?U0h2OHRQRGhuQTNCRStkWW11NXVnK1NtWXZSMFBCaUlkRGRTVjB4Vkw4Vmkz?=
 =?utf-8?B?OXVTenBWR0huRk5tWm96b29HRGRsMmVBQTcvYzM0dGo3VWtDdnUxOTdHbHU5?=
 =?utf-8?B?U1JyN1hNUlp4YVUrMWtHWit0SjNsWW04QjRGOFozUUFPQS8rR1h2NFZFQ01u?=
 =?utf-8?B?SUxITkFzZFZiaVRFUW9UZ2FDNXZwdmRkM2RCRFEyUWx2cFVpclh4RmNqdWRP?=
 =?utf-8?Q?PEENc28cUmBswLBna4FPujItk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ac331a-b7ff-4426-f9ad-08db7c84f37f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:51:06.8165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJ+VqZ2HobmVFL9VH8J4khvLZlTRr62FnGP87Js0N53TAs93seUCOgEbt12CCuXXZ7nKlK10vfheKkocH8sLxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553


On 26/06/2023 04:33, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> There are lots of MMU specific code in head.S. This code will not
> be used in MPU systems. If we use #ifdef to gate them, the code
> will become messy and hard to maintain. So we move MMU related
> code to mmu/head.S, and keep common code still in head.S. We also
> add .text.idmap in mmu/head.S to make all code in this new file
> are still in identity map page but will be linked after head.S.
>
> As "fail" in head.S is very simple and this name is too easy to
> be conflicted, so duplicate it in mmu/head.S instead of exporting
> it.
>
> And some assembly macros that will be shared by MMU and MPU later,
> we move them to macros.h.
>
> Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
> enable_boot_mm()/enable_runtime_mm(), in order to make them common interfaces
> to be used for both MMU and later MPU system.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> 1. Move macros to macros.h
> 2. Remove the indention modification
> 3. Duplicate "fail" instead of exporting it.
> ---
> v3:
> - Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
> enable_boot_mm()/enable_runtime_mm()
> ---
>   xen/arch/arm/arm64/Makefile             |   3 +
>   xen/arch/arm/arm64/head.S               | 469 +-----------------------
>   xen/arch/arm/arm64/mmu/head.S           | 453 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/macros.h |  51 +++
>   4 files changed, 509 insertions(+), 467 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/mmu/head.S
>
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 54ad55c75c..0c4b177be9 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -8,6 +8,9 @@ obj-y += domctl.o
>   obj-y += domain.o
>   obj-y += entry.o
>   obj-y += head.o
> +ifeq ($(CONFIG_HAS_MMU),y)
> +obj-y += mmu/head.o
> +endif
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>   obj-y += mm.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 66347eedcc..e63886b037 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -28,17 +28,6 @@
>   #include <asm/arm64/efibind.h>
>   #endif
>
> -#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> -#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
> -#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> -#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
> -#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
> -
> -/* Convenience defines to get slot used by Xen mapping. */
> -#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
> -#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
> -#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
> -
>   #define __HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
>
>   #define __HEAD_FLAG_PHYS_BASE   1
> @@ -85,57 +74,6 @@
>    *  x30 - lr
>    */
>
> -#ifdef CONFIG_EARLY_PRINTK
> -/*
> - * Macro to print a string to the UART, if there is one.
> - *
> - * Clobbers x0 - x3
> - */
> -#define PRINT(_s)          \
> -        mov   x3, lr ;     \
> -        adr   x0, 98f ;    \
> -        bl    asm_puts ;   \
> -        mov   lr, x3 ;     \
> -        RODATA_STR(98, _s)
> -
> -/*
> - * Macro to print the value of register \xb
> - *
> - * Clobbers x0 - x4
> - */
> -.macro print_reg xb
> -        mov   x0, \xb
> -        mov   x4, lr
> -        bl    putn
> -        mov   lr, x4
> -.endm
> -
> -#else /* CONFIG_EARLY_PRINTK */
> -#define PRINT(s)
> -
> -.macro print_reg xb
> -.endm
> -
> -#endif /* !CONFIG_EARLY_PRINTK */
> -
> -/*
> - * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> - * within the range +/- 4GB of the PC.
> - *
> - * @dst: destination register (64 bit wide)
> - * @sym: name of the symbol
> - */
> -.macro  adr_l, dst, sym
> -        adrp \dst, \sym
> -        add  \dst, \dst, :lo12:\sym
> -.endm
> -
> -/* Load the physical address of a symbol into xb */
> -.macro load_paddr xb, sym
> -        ldr \xb, =\sym
> -        add \xb, \xb, x20
> -.endm
> -
>   .section .text.header, "ax", %progbits
>   /*.aarch64*/
>
> @@ -317,7 +255,7 @@ real_start_efi:
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   lr, =primary_switched
> -        b     enable_boot_mmu
> +        b     enable_boot_mm
>
>   primary_switched:
>           bl    setup_fixmap
> @@ -367,7 +305,7 @@ GLOBAL(init_secondary)
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>           ldr   lr, =secondary_switched
> -        b     enable_runtime_mmu
> +        b     enable_runtime_mm
>
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
> @@ -475,364 +413,6 @@ cpu_init:
>           ret
>   ENDPROC(cpu_init)
>
> -/*
> - * Macro to find the slot number at a given page-table level
> - *
> - * slot:     slot computed
> - * virt:     virtual address
> - * lvl:      page-table level
> - */
> -.macro get_table_slot, slot, virt, lvl
> -        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
> -.endm
> -
> -/*
> - * Macro to create a page table entry in \ptbl to \tbl
> - *
> - * ptbl:    table symbol where the entry will be created
> - * tbl:     table symbol to point to
> - * virt:    virtual address
> - * lvl:     page-table level
> - * tmp1:    scratch register
> - * tmp2:    scratch register
> - * tmp3:    scratch register
> - *
> - * Preserves \virt
> - * Clobbers \tmp1, \tmp2, \tmp3
> - *
> - * Also use x20 for the phys offset.
> - *
> - * Note that all parameters using registers should be distinct.
> - */
> -.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> -        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
> -
> -        load_paddr \tmp2, \tbl
> -        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
> -        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
> -
> -        adr_l \tmp2, \ptbl
> -
> -        str   \tmp3, [\tmp2, \tmp1, lsl #3]
> -.endm
> -
> -/*
> - * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
> - * level table (i.e page granularity) is supported.
> - *
> - * ptbl:    table symbol where the entry will be created
> - * virt:    virtual address
> - * phys:    physical address (should be page aligned)
> - * tmp1:    scratch register
> - * tmp2:    scratch register
> - * tmp3:    scratch register
> - * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
> - *
> - * Preserves \virt, \phys
> - * Clobbers \tmp1, \tmp2, \tmp3
> - *
> - * Note that all parameters using registers should be distinct.
> - */
> -.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
> -        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
> -
> -        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
> -
> -        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
> -        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
> -
> -        adr_l \tmp3, \ptbl
> -
> -        str   \tmp2, [\tmp3, \tmp1, lsl #3]
> -.endm
> -
> -/*
> - * Rebuild the boot pagetable's first-level entries. The structure
> - * is described in mm.c.
> - *
> - * After the CPU enables paging it will add the fixmap mapping
> - * to these page tables, however this may clash with the 1:1
> - * mapping. So each CPU must rebuild the page tables here with
> - * the 1:1 in place.
> - *
> - * Inputs:
> - *   x19: paddr(start)
> - *   x20: phys offset
> - *
> - * Clobbers x0 - x4
> - */
> -create_page_tables:
> -        /* Prepare the page-tables for mapping Xen */
> -        ldr   x0, =XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> -        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> -        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
> -
> -        /* Map Xen */
> -        adr_l x4, boot_third
> -
> -        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
> -        lsl   x2, x2, #THIRD_SHIFT
> -        mov   x3, #PT_MEM_L3         /* x2 := Section map */
> -        orr   x2, x2, x3
> -
> -        /* ... map of vaddr(start) in boot_third */
> -        mov   x1, xzr
> -1:      str   x2, [x4, x1]           /* Map vaddr(start) */
> -        add   x2, x2, #PAGE_SIZE     /* Next page */
> -        add   x1, x1, #8             /* Next slot */
> -        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
> -        b.lt  1b
> -
> -        /*
> -         * If Xen is loaded at exactly XEN_VIRT_START then we don't
> -         * need an additional 1:1 mapping, the virtual mapping will
> -         * suffice.
> -         */
> -        ldr   x0, =XEN_VIRT_START
> -        cmp   x19, x0
> -        bne   1f
> -        ret
> -1:
> -        /*
> -         * Setup the 1:1 mapping so we can turn the MMU on. Note that
> -         * only the first page of Xen will be part of the 1:1 mapping.
> -         */
> -
> -        /*
> -         * Find the zeroeth slot used. If the slot is not
> -         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
> -         * page-tables from the first level.
> -         */
> -        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
> -        cmp   x0, #XEN_ZEROETH_SLOT
> -        beq   1f
> -        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
> -        b     link_from_first_id
> -
> -1:
> -        /*
> -         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> -         * then the 1:1 mapping will use its own set of page-tables from
> -         * the second level.
> -         */
> -        get_table_slot x0, x19, 1      /* x0 := first slot */
> -        cmp   x0, #XEN_FIRST_SLOT
> -        beq   1f
> -        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
> -        b     link_from_second_id
> -
> -1:
> -        /*
> -         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
> -         * 1:1 mapping will use its own set of page-tables from the
> -         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
> -         * it.
> -         */
> -        get_table_slot x0, x19, 2     /* x0 := second slot */
> -        cmp   x0, #XEN_SECOND_SLOT
> -        beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
> -        b     link_from_third_id
> -
> -link_from_first_id:
> -        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
> -link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
> -link_from_third_id:
> -        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
> -        ret
> -
> -virtphys_clash:
> -        /* Identity map clashes with boot_third, which we cannot handle yet */
> -        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
> -        b     fail
> -ENDPROC(create_page_tables)
> -
> -/*
> - * Turn on the Data Cache and the MMU. The function will return on the 1:1
> - * mapping. In other word, the caller is responsible to switch to the runtime
> - * mapping.
> - *
> - * Inputs:
> - *   x0 : Physical address of the page tables.
> - *
> - * Clobbers x0 - x4
> - */
> -enable_mmu:
> -        mov   x4, x0
> -        PRINT("- Turning on paging -\r\n")
> -
> -        /*
> -         * The state of the TLBs is unknown before turning on the MMU.
> -         * Flush them to avoid stale one.
> -         */
> -        tlbi  alle2                  /* Flush hypervisor TLBs */
> -        dsb   nsh
> -
> -        /* Write Xen's PT's paddr into TTBR0_EL2 */
> -        msr   TTBR0_EL2, x4
> -        isb
> -
> -        mrs   x0, SCTLR_EL2
> -        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
> -        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
> -        dsb   sy                     /* Flush PTE writes and finish reads */
> -        msr   SCTLR_EL2, x0          /* now paging is enabled */
> -        isb                          /* Now, flush the icache */
> -        ret
> -ENDPROC(enable_mmu)
> -
> -/*
> - * Turn on the Data Cache and the MMU. The function will return
> - * to the virtual address provided in LR (e.g. the runtime mapping).
> - *
> - * Inputs:
> - *   lr : Virtual address to return to.
> - *
> - * Clobbers x0 - x5
> - */
> -enable_runtime_mmu:
> -        mov   x5, lr
> -
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -
> -        bl    enable_mmu
> -        mov   lr, x5
> -
> -        /* return to secondary_switched */
> -        ret
> -ENDPROC(enable_runtime_mmu)
> -
> -/*
> - * Turn on the Data Cache and the MMU. The function will return
> - * to the virtual address provided in LR (e.g. the runtime mapping).
> - *
> - * Inputs:
> - *   lr : Virtual address to return to.
> - *
> - * Clobbers x0 - x5
> - */
> -enable_boot_mmu:
> -        mov   x5, lr
> -
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -
> -        bl    enable_mmu
> -        mov   lr, x5
> -
> -        /*
> -         * The MMU is turned on and we are in the 1:1 mapping. Switch
> -         * to the runtime mapping.
> -         */
> -        ldr   x0, =1f
> -        br    x0
> -1:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards. Function will return to primary_switched.
> -         */
> -        b     remove_identity_mapping
> -
> -        /*
> -         * Here might not be reached, as "ret" in remove_identity_mapping
> -         * will use the return address in LR in advance. But keep ret here
> -         * might be more safe if "ret" in remove_identity_mapping is removed
> -         * in future.
> -         */
> -        ret
> -ENDPROC(enable_boot_mmu)
> -
> -/*
> - * Remove the 1:1 map from the page-tables. It is not easy to keep track
> - * where the 1:1 map was mapped, so we will look for the top-level entry
> - * exclusive to the 1:1 map and remove it.
> - *
> - * Inputs:
> - *   x19: paddr(start)
> - *
> - * Clobbers x0 - x1
> - */
> -remove_identity_mapping:
> -        /*
> -         * Find the zeroeth slot used. Remove the entry from zeroeth
> -         * table if the slot is not XEN_ZEROETH_SLOT.
> -         */
> -        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
> -        cmp   x1, #XEN_ZEROETH_SLOT
> -        beq   1f
> -        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
> -        ldr   x0, =boot_pgtable         /* x0 := root table */
> -        str   xzr, [x0, x1, lsl #3]
> -        b     identity_mapping_removed
> -
> -1:
> -        /*
> -         * Find the first slot used. Remove the entry for the first
> -         * table if the slot is not XEN_FIRST_SLOT.
> -         */
> -        get_table_slot x1, x19, 1       /* x1 := first slot */
> -        cmp   x1, #XEN_FIRST_SLOT
> -        beq   1f
> -        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
> -        ldr   x0, =boot_first           /* x0 := first table */
> -        str   xzr, [x0, x1, lsl #3]
> -        b     identity_mapping_removed
> -
> -1:
> -        /*
> -         * Find the second slot used. Remove the entry for the first
> -         * table if the slot is not XEN_SECOND_SLOT.
> -         */
> -        get_table_slot x1, x19, 2       /* x1 := second slot */
> -        cmp   x1, #XEN_SECOND_SLOT
> -        beq   identity_mapping_removed
> -        /* It is not in slot 1, remove the entry */
> -        ldr   x0, =boot_second          /* x0 := second table */
> -        str   xzr, [x0, x1, lsl #3]
> -
> -identity_mapping_removed:
> -        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
> -        dsb   nshst
> -        tlbi  alle2
> -        dsb   nsh
> -        isb
> -
> -        ret
> -ENDPROC(remove_identity_mapping)
> -
> -/*
> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
> - * fixmap table in the page tables.
> - *
> - * The fixmap cannot be mapped in create_page_tables because it may
> - * clash with the 1:1 mapping.
> - *
> - * Inputs:
> - *   x20: Physical offset
> - *   x23: Early UART base physical address
> - *
> - * Clobbers x0 - x3
> - */
> -setup_fixmap:
> -#ifdef CONFIG_EARLY_PRINTK
> -        /* Add UART to the fixmap table */
> -        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> -        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
> -#endif
> -        /* Map fixmap into boot_second */
> -        ldr   x0, =FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
> -        /* Ensure any page table updates made above have occurred. */
> -        dsb   nshst
> -
> -        ret
> -ENDPROC(setup_fixmap)
> -
>   /*
>    * Setup the initial stack and jump to the C world
>    *
> @@ -861,51 +441,6 @@ fail:   PRINT("- Boot failed -\r\n")
>           b     1b
>   ENDPROC(fail)
>
> -/*
> - * Switch TTBR
> - *
> - * x0    ttbr
> - */
> -ENTRY(switch_ttbr_id)
> -        /* 1) Ensure any previous read/write have completed */
> -        dsb    ish
> -        isb
> -
> -        /* 2) Turn off MMU */
> -        mrs    x1, SCTLR_EL2
> -        bic    x1, x1, #SCTLR_Axx_ELx_M
> -        msr    SCTLR_EL2, x1
> -        isb
> -
> -        /*
> -         * 3) Flush the TLBs.
> -         * See asm/arm64/flushtlb.h for the explanation of the sequence.
> -         */
> -        dsb   nshst
> -        tlbi  alle2
> -        dsb   nsh
> -        isb
> -
> -        /* 4) Update the TTBR */
> -        msr   TTBR0_EL2, x0
> -        isb
> -
> -        /*
> -         * 5) Flush I-cache
> -         * This should not be necessary but it is kept for safety.
> -         */
> -        ic     iallu
> -        isb
> -
> -        /* 6) Turn on the MMU */
> -        mrs   x1, SCTLR_EL2
> -        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
> -        msr   SCTLR_EL2, x1
> -        isb
> -
> -        ret
> -ENDPROC(switch_ttbr_id)
> -
>   #ifdef CONFIG_EARLY_PRINTK
>   /*
>    * Initialize the UART. Should only be called on the boot CPU.
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> new file mode 100644
> index 0000000000..2b209fc3ce
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -0,0 +1,453 @@
> +/*
> + * xen/arch/arm/mmu/head.S
> + *
> + * Start-of-day code for an ARMv8.
> + *
> + * Ian Campbell <ian.campbell@citrix.com>
> + * Copyright (c) 2012 Citrix Systems.
> + *
> + * Based on ARMv7-A head.S by
> + * Tim Deegan <tim@xen.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <asm/page.h>
> +#include <asm/early_printk.h>
> +
> +#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> +#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
> +#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> +#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
> +#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
> +
> +/* Convenience defines to get slot used by Xen mapping. */
> +#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
> +#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
> +#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
> +
> +/*
> + * Macro to find the slot number at a given page-table level
> + *
> + * slot:     slot computed
> + * virt:     virtual address
> + * lvl:      page-table level
> + */
> +.macro get_table_slot, slot, virt, lvl
> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
> +.endm
> +
> +/*
> + * Macro to create a page table entry in \ptbl to \tbl
> + *
> + * ptbl:    table symbol where the entry will be created
> + * tbl:     table symbol to point to
> + * virt:    virtual address
> + * lvl:     page-table level
> + * tmp1:    scratch register
> + * tmp2:    scratch register
> + * tmp3:    scratch register
> + *
> + * Preserves \virt
> + * Clobbers \tmp1, \tmp2, \tmp3
> + *
> + * Also use x20 for the phys offset.
> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
> +
> +        load_paddr \tmp2, \tbl
> +        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
> +        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
> +
> +        adr_l \tmp2, \ptbl
> +
> +        str   \tmp3, [\tmp2, \tmp1, lsl #3]
> +.endm
> +
> +/*
> + * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
> + * level table (i.e page granularity) is supported.
> + *
> + * ptbl:    table symbol where the entry will be created
> + * virt:    virtual address
> + * phys:    physical address (should be page aligned)
> + * tmp1:    scratch register
> + * tmp2:    scratch register
> + * tmp3:    scratch register
> + * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
> + *
> + * Preserves \virt, \phys
> + * Clobbers \tmp1, \tmp2, \tmp3
> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
> +        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
> +
> +        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
> +
> +        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
> +        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
> +
> +        adr_l \tmp3, \ptbl
> +
> +        str   \tmp2, [\tmp3, \tmp1, lsl #3]
> +.endm
> +
> +.section .text.idmap, "ax", %progbits
> +
> +/*
> + * Rebuild the boot pagetable's first-level entries. The structure
> + * is described in mm.c.
> + *
> + * After the CPU enables paging it will add the fixmap mapping
> + * to these page tables, however this may clash with the 1:1
> + * mapping. So each CPU must rebuild the page tables here with
> + * the 1:1 in place.
> + *
> + * Inputs:
> + *   x19: paddr(start)
> + *   x20: phys offset
> + *
> + * Clobbers x0 - x4
> + */
> +create_page_tables:
> +        /* Prepare the page-tables for mapping Xen */
> +        ldr   x0, =XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> +        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> +        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
> +
> +        /* Map Xen */
> +        adr_l x4, boot_third
> +
> +        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
> +        lsl   x2, x2, #THIRD_SHIFT
> +        mov   x3, #PT_MEM_L3         /* x2 := Section map */
> +        orr   x2, x2, x3
> +
> +        /* ... map of vaddr(start) in boot_third */
> +        mov   x1, xzr
> +1:      str   x2, [x4, x1]           /* Map vaddr(start) */
> +        add   x2, x2, #PAGE_SIZE     /* Next page */
> +        add   x1, x1, #8             /* Next slot */
> +        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
> +        b.lt  1b
> +
> +        /*
> +         * If Xen is loaded at exactly XEN_VIRT_START then we don't
> +         * need an additional 1:1 mapping, the virtual mapping will
> +         * suffice.
> +         */
> +        ldr   x0, =XEN_VIRT_START
> +        cmp   x19, x0
> +        bne   1f
> +        ret
> +1:
> +        /*
> +         * Setup the 1:1 mapping so we can turn the MMU on. Note that
> +         * only the first page of Xen will be part of the 1:1 mapping.
> +         */
> +
> +        /*
> +         * Find the zeroeth slot used. If the slot is not
> +         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
> +         * page-tables from the first level.
> +         */
> +        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
> +        cmp   x0, #XEN_ZEROETH_SLOT
> +        beq   1f
> +        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
> +        b     link_from_first_id
> +
> +1:
> +        /*
> +         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> +         * then the 1:1 mapping will use its own set of page-tables from
> +         * the second level.
> +         */
> +        get_table_slot x0, x19, 1      /* x0 := first slot */
> +        cmp   x0, #XEN_FIRST_SLOT
> +        beq   1f
> +        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
> +        b     link_from_second_id
> +
> +1:
> +        /*
> +         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
> +         * 1:1 mapping will use its own set of page-tables from the
> +         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
> +         * it.
> +         */
> +        get_table_slot x0, x19, 2     /* x0 := second slot */
> +        cmp   x0, #XEN_SECOND_SLOT
> +        beq   virtphys_clash
> +        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
> +        b     link_from_third_id
> +
> +link_from_first_id:
> +        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
> +link_from_second_id:
> +        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
> +link_from_third_id:
> +        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
> +        ret
> +
> +virtphys_clash:
> +        /* Identity map clashes with boot_third, which we cannot handle yet */
> +        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
> +        b     fail
> +ENDPROC(create_page_tables)
> +
> +/*
> + * Turn on the Data Cache and the MMU. The function will return on the 1:1
> + * mapping. In other word, the caller is responsible to switch to the runtime
> + * mapping.
> + *
> + * Inputs:
> + *   x0 : Physical address of the page tables.
> + *
> + * Clobbers x0 - x4
> + */
> +enable_mmu:
> +        mov   x4, x0
> +        PRINT("- Turning on paging -\r\n")
> +
> +        /*
> +         * The state of the TLBs is unknown before turning on the MMU.
> +         * Flush them to avoid stale one.
> +         */
> +        tlbi  alle2                  /* Flush hypervisor TLBs */
> +        dsb   nsh
> +
> +        /* Write Xen's PT's paddr into TTBR0_EL2 */
> +        msr   TTBR0_EL2, x4
> +        isb
> +
> +        mrs   x0, SCTLR_EL2
> +        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
> +        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
> +        dsb   sy                     /* Flush PTE writes and finish reads */
> +        msr   SCTLR_EL2, x0          /* now paging is enabled */
> +        isb                          /* Now, flush the icache */
> +        ret
> +ENDPROC(enable_mmu)
> +
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +ENTRY(enable_runtime_mm)
> +        /* save return address */
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
A newline here as was present in the original code.
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* return to secondary_switched */
> +        ret
> +ENDPROC(enable_runtime_mm)
> +
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +ENTRY(enable_boot_mm)
> +        /* save return address */
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
A newline here as was present in the original code.
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.
> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Here might not be reached, as "ret" in remove_identity_mapping
> +         * will use the return address in LR in advance. But keep ret here
> +         * might be more safe if "ret" in remove_identity_mapping is removed
> +         * in future.
> +         */
> +        ret
> +ENDPROC(enable_boot_mm)
> +
> +/*
> + * Remove the 1:1 map from the page-tables. It is not easy to keep track
> + * where the 1:1 map was mapped, so we will look for the top-level entry
> + * exclusive to the 1:1 map and remove it.
> + *
> + * Inputs:
> + *   x19: paddr(start)
> + *
> + * Clobbers x0 - x1
> + */
> +remove_identity_mapping:
> +        /*
> +         * Find the zeroeth slot used. Remove the entry from zeroeth
> +         * table if the slot is not XEN_ZEROETH_SLOT.
> +         */
> +        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
> +        cmp   x1, #XEN_ZEROETH_SLOT
> +        beq   1f
> +        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
> +        ldr   x0, =boot_pgtable         /* x0 := root table */
> +        str   xzr, [x0, x1, lsl #3]
> +        b     identity_mapping_removed
> +
> +1:
> +        /*
> +         * Find the first slot used. Remove the entry for the first
> +         * table if the slot is not XEN_FIRST_SLOT.
> +         */
> +        get_table_slot x1, x19, 1       /* x1 := first slot */
> +        cmp   x1, #XEN_FIRST_SLOT
> +        beq   1f
> +        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
> +        ldr   x0, =boot_first           /* x0 := first table */
> +        str   xzr, [x0, x1, lsl #3]
> +        b     identity_mapping_removed
> +
> +1:
> +        /*
> +         * Find the second slot used. Remove the entry for the first
> +         * table if the slot is not XEN_SECOND_SLOT.
> +         */
> +        get_table_slot x1, x19, 2       /* x1 := second slot */
> +        cmp   x1, #XEN_SECOND_SLOT
> +        beq   identity_mapping_removed
> +        /* It is not in slot 1, remove the entry */
> +        ldr   x0, =boot_second          /* x0 := second table */
> +        str   xzr, [x0, x1, lsl #3]
> +
> +identity_mapping_removed:
> +        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
> +        dsb   nshst
> +        tlbi  alle2
> +        dsb   nsh
> +        isb
> +
> +        ret
> +ENDPROC(remove_identity_mapping)
> +
> +/*
> + * Map the UART in the fixmap (when earlyprintk is used) and hook the
> + * fixmap table in the page tables.
> + *
> + * The fixmap cannot be mapped in create_page_tables because it may
> + * clash with the 1:1 mapping.
> + *
> + * Inputs:
> + *   x20: Physical offset
> + *   x23: Early UART base physical address
> + *
> + * Clobbers x0 - x3
> + */
> +ENTRY(setup_fixmap)
> +#ifdef CONFIG_EARLY_PRINTK
> +        /* Add UART to the fixmap table */
> +        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> +        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
> +#endif
> +        /* Map fixmap into boot_second */
> +        ldr   x0, =FIXMAP_ADDR(0)
> +        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
> +        /* Ensure any page table updates made above have occurred. */
> +        dsb   nshst
> +
> +        ret
> +ENDPROC(setup_fixmap)
> +
Why do we need the below snippet ? It wasn't a part of the original code.
> +/* Fail-stop */
> +fail:   PRINT("- Boot failed -\r\n")
> +1:      wfe
> +        b     1b
> +ENDPROC(fail)
> +
> +/*
> + * Switch TTBR
> + *
> + * x0    ttbr
> + */
> +ENTRY(switch_ttbr_id)
> +        /* 1) Ensure any previous read/write have completed */
> +        dsb    ish
> +        isb
> +
> +        /* 2) Turn off MMU */
> +        mrs    x1, SCTLR_EL2
> +        bic    x1, x1, #SCTLR_Axx_ELx_M
> +        msr    SCTLR_EL2, x1
> +        isb
> +
> +        /*
> +         * 3) Flush the TLBs.
> +         * See asm/arm64/flushtlb.h for the explanation of the sequence.
> +         */
> +        dsb   nshst
> +        tlbi  alle2
> +        dsb   nsh
> +        isb
> +
> +        /* 4) Update the TTBR */
> +        msr   TTBR0_EL2, x0
> +        isb
> +
> +        /*
> +         * 5) Flush I-cache
> +         * This should not be necessary but it is kept for safety.
> +         */
> +        ic     iallu
> +        isb
> +
> +        /* 6) Turn on the MMU */
> +        mrs   x1, SCTLR_EL2
> +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
> +        msr   SCTLR_EL2, x1
> +        isb
> +
> +        ret
> +ENDPROC(switch_ttbr_id)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
> index 140e223b4c..2116e48b7c 100644
> --- a/xen/arch/arm/include/asm/arm64/macros.h
> +++ b/xen/arch/arm/include/asm/arm64/macros.h
> @@ -32,6 +32,57 @@
>           hint    #22
>       .endm
>
> +#ifdef CONFIG_EARLY_PRINTK
> +/*
> + * Macro to print a string to the UART, if there is one.
> + *
> + * Clobbers x0 - x3
> + */
> +#define PRINT(_s)          \
> +        mov   x3, lr ;     \
> +        adr   x0, 98f ;    \
> +        bl    asm_puts ;   \
> +        mov   lr, x3 ;     \
> +        RODATA_STR(98, _s)
> +
> +/*
> + * Macro to print the value of register \xb
> + *
> + * Clobbers x0 - x4
> + */
> +.macro print_reg xb
> +        mov   x0, \xb
> +        mov   x4, lr
> +        bl    putn
> +        mov   lr, x4
> +.endm
> +
> +#else /* CONFIG_EARLY_PRINTK */
> +#define PRINT(s)
> +
> +.macro print_reg xb
> +.endm
> +
> +#endif /* !CONFIG_EARLY_PRINTK */
> +
> +/*
> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> + * within the range +/- 4GB of the PC.
> + *
> + * @dst: destination register (64 bit wide)
> + * @sym: name of the symbol
> + */
> +.macro  adr_l, dst, sym
> +        adrp \dst, \sym
> +        add  \dst, \dst, :lo12:\sym
> +.endm
> +
> +/* Load the physical address of a symbol into xb */
> +.macro load_paddr xb, sym
> +        ldr \xb, =\sym
> +        add \xb, \xb, x20
> +.endm
> +
>   /*
>    * Register aliases.
>    */
> --
> 2.25.1
>
>
- Ayan

