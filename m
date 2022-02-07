Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4984AB6E7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266583.460272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzqT-0000J1-5f; Mon, 07 Feb 2022 08:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266583.460272; Mon, 07 Feb 2022 08:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzqT-0000Gf-2X; Mon, 07 Feb 2022 08:58:01 +0000
Received: by outflank-mailman (input) for mailman id 266583;
 Mon, 07 Feb 2022 08:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzqS-0000GZ-3v
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:58:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bf63413-87f4-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 09:57:58 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-vGB2GFO-P3ySKGDXTGJK_Q-1; Mon, 07 Feb 2022 09:57:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5483.eurprd04.prod.outlook.com (2603:10a6:10:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Mon, 7 Feb
 2022 08:57:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:57:55 +0000
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
X-Inumbo-ID: 0bf63413-87f4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644224278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZYDkpSFsIdm1YfqalckYcs9mzKa546JvAv4YG5D2G4=;
	b=CkL3sfTTfX1Vf8LQQxfK9JRS7VYs/Gd4xTQRNIVqgHyW+SL3aoNANZxFeiuc3P1O9t/F8r
	YoVNukG06Y8/YSCZFjmgHR6xKJP8JmYKGJu82CRr37BYvnK9c2tWjM/wCAKgDAqaF/shRm
	wwl3uu3FqEDK6aIjP+g2WZ5dWk6Lslw=
X-MC-Unique: vGB2GFO-P3ySKGDXTGJK_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJzIWNqbOHCHQ/PEPwqC3BxxTuG3/o0D4l0QiqoPWpw26zVGTy9LLv7ItZOFjIlKJLqSIaC7GUNeFiR92nMle68ozTP7mGq1CbPhKjNgHZVRoa6ERNEXuZddCYIZ3exmvHPrAX2EUIvwtTHiA7LAOGpsIlwqjVCuG/IOiYS9pckZ62ktSn6uhtPz7+2OSKK2jI5tpH7qyh2wPjWLtxxk8B8vDEiBkcZK0b8NV5P/aXhdY8AiisnYsgcL+Ac6uvKwQI+r1cT8s7drOUprnFJWLM/KsILBOxdUqAgG63YcD/24UMUNJ+yLm6n1plVGRO2NpzJ3LU8khC+bp/Tw7RI7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZYDkpSFsIdm1YfqalckYcs9mzKa546JvAv4YG5D2G4=;
 b=LFP3zttaktWzBwAeDOFwHk4ln1Od0m3FIZ1HYrZZJK+P9r7mQG2vmXzCwoDa9s6ojxGGNf/JlMhLU/VcGSFGJcSBnuEG7HYtvvX4fHKuWQvG0nVAS+S0sijlzyL3YQyNJGt4Xu3Djkh0ED1tHrQBIKxrgovCgwoniPROAsy6Y9LQj7PLYM/MeH6duhCJ7OrXRq/8Pw0q3REoTkT7uY4Ry4gzZLNtjDIXXdMedS8Hh/PMinc6ElP8FBHXZzq6ECJP4tVBcUEEtJV4APeoPfpOe61TD0yC5GK8U81wfHwr8qwhhqeTTe+KHkEefVdQX9mxKwnqD0fMHpeHN+RPGKYwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
Date: Mon, 7 Feb 2022 09:57:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the
 VGA information
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220206192839.75711-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df58d11e-b294-4427-2e5a-08d9ea17ee01
X-MS-TrafficTypeDiagnostic: DB7PR04MB5483:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5483323BAAAF2BC5039F9BAEB32C9@DB7PR04MB5483.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C91hv5wqNOaSfnPesFBaqccxB0DeOYnoovO8qlE6LcbSOrisPEltZkpuWmF3kEviIVz5hHGnptX9mnra2vQSYYJXsPaTzLafoA4ZfVfGhREQHm6ST2HbOlZhxTJg2UV3zFBtw0fbr/n52tvTbp55jYCJrl7qEqfPiY71PZBuJISrIir4otDL9sDBMONlGB34AG6m+IDmX/VFUm3Nu+3Wat+i5LV9hZkgXu6kMvkLM/ql4v6xFMUZsinf/RULkdwtTG8jXyj3aGju8TcEjOi19Yb0Xw5l4A9t9ACS/tw/gZVaCl30a7W1MuQCx02haoHKc/hSHNTLL4/OfFiYwo9SWe6FEhQ1d6HMdY241tuGKjwyqsQKelRUDzIkldA8TWJAT2QO1npgEo8O9cWet3aYMfjIF2/TaW+IYwa6fHyvEp12klMUi+LUcz7fJjFRquMB+ZqLiAzQMy0VsVZ8P6CWpq6PVzMinOEH0U+aoGCVfhk5N6qh6w0kfrF7OaJBwpVEJBZW/UOcpgLAT1E4wGBVRSne4AQhAZStStVSD40gvNjWbzFyhRyAVvJwMaxiV5EuCxwlNXZkSPj09uCDSYkVVJYIE8HLK2LSQJHT3AXOvyF6qjSBbbMuJYIGMfnknRv62hO8u20RmOkL9k8fL+xzY849sc/zRA7+HQrRyoQhYutsBpp8aQ0p1UqBYh4cXQpFy0xQQah/HnmQqsjBso+/vnvrVIVv2xCjjAKhKsivO0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2616005)(2906002)(316002)(31696002)(36756003)(31686004)(5660300002)(7416002)(38100700002)(53546011)(86362001)(66946007)(508600001)(4326008)(8676002)(8936002)(66476007)(66556008)(6486002)(186003)(26005)(6916009)(54906003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUVPSTE1TnJDeUFrNTA0RzdIZXAwR1ZuSTVqQ0VSYysyRWpKTnd0WkJxWjFp?=
 =?utf-8?B?WG5yMU9aL3FheklrN0ZWb2hJM0ExNDNkeGdTTnhKQnJIT29GaGVqWUhLMmd1?=
 =?utf-8?B?K1R6U3FpWkdWQ0lKWFZ1RWxLYzNqV3ZEdjlsVTlFbjQ0V3pnNDFzQ0pNYlhl?=
 =?utf-8?B?UXMvem1iTXhOMy9RSnFBNEdpRHFPbndNbVdFdHVYNnZibk5UVTJaNEdLckRi?=
 =?utf-8?B?cmRnL2NjM1NQRUlFRlFZOEc5NnBTajFuYXI2U29RdENHWDR3ZUttdzQrWlF4?=
 =?utf-8?B?OEk2azFncWVkZVgvVjM3dGJZdTdJeWFBd2N4d0VTUVByNzl0ZnB5VC9Tb3BS?=
 =?utf-8?B?ZVpqSzMwSzhsbUdhcC9GTHRvcE9kU0xmY2xHNjNBUlgvQ3RwVkNmTHEyckVF?=
 =?utf-8?B?VkJTY3kzT0taOE1LcUI3dWUvaG1adkxka3l4Qmw0SFYyakhBUTJuNU4rdGhr?=
 =?utf-8?B?NGhscERvWnpMcTJMRm8wNXF4T1dJa25ZNFlMc3dmcXo4M2kwNjJYVEdTdTNu?=
 =?utf-8?B?TkVJS3ZYcjZPaWlUc3Z6d1IvQi9KTGx5YkZyZm9LZ1VCM1JDZUJ3TCtNNENk?=
 =?utf-8?B?QXU5dTQ0ejBnOFdJMzhaMlhFK1M2YVpVb1JNMVFHUGt1R0t0b2RYSk9rSExu?=
 =?utf-8?B?VTM4KzVhdFIrSEt5TTZXQkRJdjVmNkFVMVJKbFBHckMxcENTVXZFK3RoRzYz?=
 =?utf-8?B?RnE3VnluRk5lU1J3NDFnVnk1TEtSSzBObE9oT05Vblg4cWZ3UVl6Z290TldG?=
 =?utf-8?B?cDZOc29xbE1TVThiZExoRHlpbmIvTVNBdTV3U2tvUVVxSXB4L21hekV2S1RH?=
 =?utf-8?B?Qk9jN1JTdk1ZYzNDcHhEbmZIQ2xEOHJqYnVES200Zi9PTi9nWnoxNWFXY2o1?=
 =?utf-8?B?QmxyYVZqaVQ2a0NRQkhHSFNZN3U3bDlSY2w0UVNLRTNTMkJtTHYwMU1nSE9k?=
 =?utf-8?B?K0o4VG4yS0kyWG9tOHp2ZExOL1M3aENQdjArS1VXNnlKT0lBbm10c1dPQjVv?=
 =?utf-8?B?QXRTajdMUnBLSG0xRkoxODBUQ1IwMkp6dlAzNThpc2dCOTU1a1Vqbm5kRm9C?=
 =?utf-8?B?ZStXOEpGSjYvczBtRG1CQjJYcDRqUTZzSlNEYkpHVmZSNmNxTjl0cmpQbC9K?=
 =?utf-8?B?OXhQYkFoOU5yWlFPcHk5QTVtK25wUE5WVUZyNlorOEc5c2U5UjdTZ1lKcFU3?=
 =?utf-8?B?YlFiL2M3V1lzQysycDNZRlhVdWR6akpWcGVrSGVpMTBVaHM2cVNaZjVjNDdS?=
 =?utf-8?B?RmsvYWoyTUtEaUVFa2RNQlQ2Tyt2dm5MWCtEdGlQdDBHUll0anlhaEJmQlB3?=
 =?utf-8?B?N3NNRWttR1JqYjlpNGRZbjdJam9HckdmL0t4WmtGOTlhSjJINlBabmhzek1X?=
 =?utf-8?B?TkV0TnNSbU80TDZoMy96UExndW8zeGtqNTkwSjNMTVNWSUV1eCs3QWN0V05N?=
 =?utf-8?B?QmQ1QWJ4djM3SVBwOGxMQTFPb1dPdzluanRac0p3d1ZhblVhaDBDQ2s4bDU1?=
 =?utf-8?B?aUtwOXlzL2NnN1lhT3dTZ05wQ1d4TC84dmg2Wkg2eEg3dXJWRmJzQ1J2YkRt?=
 =?utf-8?B?bDIyMDJ6b1BSY2tNR1dPWkdJc2QwOEFPdE1UR3drMHVlbmlsdG96UXVXcFF2?=
 =?utf-8?B?NGNPUzEwbXRFVkZlMlFqN1Zkb3IvV1MwZUhhaWVoMnlzNW9IUzFJZ1hQNVVP?=
 =?utf-8?B?ZHJrYVJ5Qmx3ZUoxZ0dkcUZRWGRrdjRjUzM2RkxVTThYVmhMR3FhdFlVemFl?=
 =?utf-8?B?di84UTVYQTZiQmEwanJ5Z1Z5dStXdEMwSXFlY3B1dlEvZENVQlVBWVVoKzVk?=
 =?utf-8?B?QTNRa1hEdmJrMTRvekVZUWlsUW9wR2UxalBPU09zQkFMNzJwVVFIdmU4NE5R?=
 =?utf-8?B?NFhzdWFoTWU1ZTVZN01YK2ZrampZVDQ1ZWVHYTI5b3Z3QTc3RHhyRUEzYXUv?=
 =?utf-8?B?eVRESnpjZXYwZ2xRcm5PS3ZldUxtQUp4QmxDNlpFSXVlWXo1WWorZWhDN1ZM?=
 =?utf-8?B?cVJIeGNYcklNaFNPNHd5M3NhYW9VZHpIVlJkYkRGMExScDdyc0dXbVdlQ2xF?=
 =?utf-8?B?Ty9IZGpjWXlXNWtWVDRaazcrV0oxbXdsZitTNEpxMkduQ1lFOVJ3ck13bzlr?=
 =?utf-8?B?REo3MXU0aDROVTJ6NFE3d1g2bUd5ZFRRRGIrM3hPQ3gxUStvemRXWmdSZExW?=
 =?utf-8?Q?pMf2EIwYkD/zuiH2Jj9tytI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df58d11e-b294-4427-2e5a-08d9ea17ee01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:57:54.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKBjrhWtLMuft2o9t5cfIeJxf1Xd6QVi02lUVzpRbmbi8iL7Z/IDE/dpLgHe9zCG490XF0DAEACLWrJoRfDWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5483

On 06.02.2022 20:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> When using EFI, the VGA information is fetched using the EFI
> boot services. However, Xen will have exited the boot services.
> Therefore, we need to find a different way to pass the information
> to dom0.
> 
> For PV dom0, they are part of the start_info. But this is not
> something that exists on Arm. So the best way would to be to
> use a hypercall.
> 
> For now the structure layout is based on dom0_vga_console_info
> for convenience. I am open on another proposal.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Cc-ing Roger as this may want using for PVH Dom0 also on x86; my
first attempt to propagate this information was rejected.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -244,6 +244,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
>  #define  XEN_FW_EFI_PCI_ROM        5
>  #define  XEN_FW_EFI_APPLE_PROPERTIES 6
>  #define XEN_FW_KBD_SHIFT_FLAGS    5
> +#define XEN_FW_VGA_INFO           6

Perhaps s/VGA/VIDEO/, despite ...

>  struct xenpf_firmware_info {
>      /* IN variables. */
>      uint32_t type;
> @@ -311,6 +312,7 @@ struct xenpf_firmware_info {
>  
>          /* Int16, Fn02: Get keyboard shift flags. */
>          uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
> +        struct dom0_vga_console_info vga;

... the structure name including "vga" (but if the #define is adjusted,
the field name would want to become "video" as well).

Jan


