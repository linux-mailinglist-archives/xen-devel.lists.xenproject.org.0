Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B685E4675CB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237348.411658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6G4-0000LP-7S; Fri, 03 Dec 2021 10:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237348.411658; Fri, 03 Dec 2021 10:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6G4-0000Io-4B; Fri, 03 Dec 2021 10:57:40 +0000
Received: by outflank-mailman (input) for mailman id 237348;
 Fri, 03 Dec 2021 10:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6G3-0007qi-2R
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:57:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d426d624-5427-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:57:38 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-6c8DX1yBOnSyOEKqLJyx5g-1; Fri, 03 Dec 2021 11:57:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:57:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:57:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 10:57:34 +0000
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
X-Inumbo-ID: d426d624-5427-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638529058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdGuHEod0PjyKKkct1qPtti9jY5e6u+ZzA9caApkWi8=;
	b=Z7G5Q5JsfHV/zMl8MDGFEW+Ecxz6N9zg5h/oZafMyMMCpabZ1HGNhc9FjPu4rlxmDJETeE
	kC7B+OmiKNrvhJr7g9OUSwlEDyjAVBLpwN121/hb6FpECcXh8AAtsFiBs0RIPPBPCZ07JI
	OHa5x2cg52fCqbpktNZ4QIMMU4Fmi74=
X-MC-Unique: 6c8DX1yBOnSyOEKqLJyx5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Faz+QAnarOJ23z3QiRZ0Ukp2/WXg2JosfCFtbTds/j4RFBoux53KnycfiUoO0KJgZRR3eB7uACJKmqPE7PmZ05THwWIwACmyLOdhFAfoZQnm/Vwsv7HEEVoi28Ugz4uR2nwYL7IOkxRT9y6If8ksPokf/bPvQp1A40vPy26BWOatgIqatVtdpFOFN/E8C9RtgdjCiz6Bs4+YPinRfrCS6l9fJ9rusPrzWsIW3w1PcQT8T6BGlKj/lDRNB4J26q2kEC76WXW7zm9/SIRxPw56v1KLXJDn/p7nj0CCrixZTKBf3KqDUwquSICr4wA3YhPA9Zj+UEbmMYEvTGvBrd/Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdGuHEod0PjyKKkct1qPtti9jY5e6u+ZzA9caApkWi8=;
 b=QT8a0ONwjD4LQY9PLihw+c1qdZNpKF3agrxWhql/n1dCX7zuStk2Vf0cojAsYS1JJL4f4Qw0gFrj+gfJITD5W/tbqxDqR/xPIXiXl32e61oX5T4ABpmis8TC1tulIHb5R42VVQFxSsdObzkh9m9FlyDbngmK7Dl1DdPUglo6v2t9Que9/r8L5u6HkJmqD2mQmhTpX0eSGqvIvp/woGhOasUR+KsJM3zaci5/efybKU84rkrwtdAPVKTQefKCrpNzjHBnp4elpJ5cmwXW47cmWqZc78d1d0uDKyA1QIJvvSzV/LfqT8e8+vkZheA8YaLR0yZu+1E2isoEilijYTWRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
Date: Fri, 3 Dec 2021 11:57:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/3] EFI: constify EFI_LOADED_IMAGE * function parameters
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
In-Reply-To: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17e26e88-f964-4342-5fae-08d9b64bb6ab
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33911B0443028A7A6EFEE5DAB36A9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OXkmzpEvH/38LjDuUPlQH6oqk02ybulncz2RhBHrMr3aJoHMjiZ167gid06vg9BThol6i5xWJKqStbUoC48kf8s3RfthZNsBHQpkf3XvuSqq4fXqrqk5Gx654lcxr9fS6UkDp7t8TzvJg8RlYetyiHtppgj0UFkH8XnGSZQpwPnwFQxsJ4T9KcIApvxSiyzqJuFvVSdnNk9VU8rHnLSQg8btSXexluqx747cRolI5Gy6CNsEe0hGhoLV9fWcKerQY10pL6oaPkwnzTmfnTcUCyNC69DO1JCb8KXDUoe2oCBbzMvBDbwE1n/9NjNT1RRIN6JEqsRvsV4+wUOB/OSCUgFWx9HoF47cWqUEthQovU6L0wB5s/MMwROKoPbWXLWe+do6kDtlMVs4+KzKCJLZLUbEATTXb+RX7/ga+de/jsGuKJIUYdq8hffKFzbLdGA2duBEtIPRPrUVzLuXgPeLTsfSBvebEjW8bFrMzzqNPwa3OIFtZWmiTpyDVtInREaGubo0kR8dOMOSorI+aDnd/hNg3Uy10moeb6XaC5pBFWZvG3FOT3KQgFV9L8RB9Gj4JyC7J0yxqi2nYz5VkxtJfvR0uZGHKKH4hXCpkvG1Sac6hcVCVIV4tcuY4wQne6o921G8W+FTG+4QGvDzJOG4rZqQtWaMYnAGOxqDkS5YHtWdiVgbOsEhKJQWTRx+qkm13gdtHfO/Ry4AcDquTGBLHn9C3LxTgu4G16MoLkEgwJxHzTV8Jw+j8CrGVSsJ3F8o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4326008)(186003)(2906002)(54906003)(66476007)(5660300002)(66556008)(31696002)(2616005)(16576012)(6486002)(508600001)(66946007)(36756003)(86362001)(8936002)(316002)(26005)(956004)(8676002)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlRvdXlSNmJEaXJCVDN5RU9rVExoOWlOVTJ1QS8wKzdrWGpuV0VQODY1UnVQ?=
 =?utf-8?B?R2hwMWN3K2RwdXhYS2JXMm9jeDJoYVlmN01HWndQR3VCeDB5Tm4xRHMrbDAz?=
 =?utf-8?B?dk5iUkxyZlp6TkVqcDJPaUlNeWttTXE0YXBYMEtFakUxbGpNcnpsWjNEQUtG?=
 =?utf-8?B?SUdXdzdVUjN2MnBpelBDWEZnQSs3TXo2bXVCM2NtSkdtRFBYUm85MWNKYmlS?=
 =?utf-8?B?WHFla1B1L0p6VmJyVVdoNHRXUUk5OEVld2xvRWZLKzdDSjBHY0N3WEpwaWpt?=
 =?utf-8?B?Zm9nTU5KMUU2WmFwVi9VVS9Cenpjemh6SkRIZStacGRkempkYUJsYk85Y0hu?=
 =?utf-8?B?SDMwMDhmVjF0U1V0WklpSUtueVpmcnI5ajFFVmpSREtRUXFZN0l1UUdmQ1RI?=
 =?utf-8?B?TmkxQmJXRUxKR2w5Ty9GQjd6aFJKa3B0M1RjRkJ4ZjR0Qzd1Z1dCblRvdjNk?=
 =?utf-8?B?ZkZUaG4yOVJLcXhzaVgzUHdHQW45OXdZNEFtZm50b2Z0RzZiZjUxWUJBREhO?=
 =?utf-8?B?WFh3YkY4M1UvOXRybEoxTDZDYlJsQjloTlExYUw1eGttbDBpM0F6NGNsU2dH?=
 =?utf-8?B?WEwyRVNKbG1WaHNkcWt4UnVqWDk5d1Fnam1vdHFGVVpCeGgyQzRzTzcrN2JN?=
 =?utf-8?B?bnNld3Boem9KN3duUU9qZi9FeENHR1FCNHhrc0plemxlc0RVdUpHTWo2NXJl?=
 =?utf-8?B?UHZjdFpZRGhaY3lqRzR2Z3lsQ0JkR3dLMGxhWkZHVmdNbXNtUEtadzZUT21h?=
 =?utf-8?B?Ni9xd3hSbnc0MlpXOFlnQ0gwb0NlUG9MMUVyT2t5bmtIM0NIMnNncEdNVm9m?=
 =?utf-8?B?dFc1eCtHYW1pUmZBRE1Bb0oyK3N1VkM5WHhLL2NpZlByYXdoeGY3eG9jTWpD?=
 =?utf-8?B?ZWplRHcwZnFUOGVFSHBqcVhpZ1FFRXlDWEo0TW5rdFpDL0FrZUlURTlXUG5Y?=
 =?utf-8?B?elRRQUx5aS9KSG5hUkZrdVlISlVJa29KMEJnYVV4R010RTdsL2FKVlo4T2RM?=
 =?utf-8?B?ZVkxVVI2K2taTU1rb1U1UHhpdlZDUE4zMjM1S1BoM1dYaWprUDNxbGtVUjVP?=
 =?utf-8?B?K1hUMklqSDRMbmJlSFVMQ3RrZkdrMmhRc1dyMmRPYXRqZUhyMUlmbWZDY09w?=
 =?utf-8?B?NU4xQmtQeFA1U0ZUbXlnWmpPbzJQdEVDZVU2VXpWeXY2bEdJV0pQVGxpV2xC?=
 =?utf-8?B?UFpGRHFqT3VXTlpZQU5uN0hUUE5YYVZrcDA3K0hTYkJnLzRqOWxvTDBrTEtO?=
 =?utf-8?B?djY0N1l0L1FJbzFUb0hjcEwvdmMzc0l3c1NvNHhZVzhldHdjbXpCQXRYemdv?=
 =?utf-8?B?akpINkFqOXJDZGpGWVRlUHI2Mlc2Vm1XN1dEOU52S2NIYnJWV3NVSEF1Yjhz?=
 =?utf-8?B?QXJ3aVpuUWp4WHJGSjdDVHVIcTcvWW5TMDNKZGJuY1N6Zm4vS2RwQll5OUIz?=
 =?utf-8?B?VE4zeUQyMzdzK1VFd2FDNE44ZXBHcHdORXY5VWlESGF0TXNaOXI1NHVuV0NP?=
 =?utf-8?B?NGpMeWlGdVo2SDZMdkE2YlYyc1dEY2ZrSWhkQzF1dEZ1SXAzNXRkN3kxdDJD?=
 =?utf-8?B?dWtwNW1GMUZCUm9uT0FwRDgxWUwyWk1HTTYyOGVVemhmWXR0S0FwVTQ3TXRO?=
 =?utf-8?B?R0FXaFpEVWtoTjh1RHM4T1lmbEdtT2xCV1pSK21XMHE1cmgzQTdHc0x5VnNr?=
 =?utf-8?B?bThNT3p3K3RZYXhSRTNWdHcxd3h2djRUL2tZd0kvSXZrM3Q0Vk5nNmJETUhm?=
 =?utf-8?B?SzFycXlHY3V4MzVhWEc1Mi9ITVdHUXdtdGdQTWYxK2lpdmFnSmIvVGNUVVU4?=
 =?utf-8?B?OVliRUtSY3NBdGFoNTFTTExJZTVZOHVlK3ZoRHNjVWtGejcyRmFCQ1VHOG02?=
 =?utf-8?B?NkVRckFkZXFURGU1Z1hqU0RIb2t1NXFleWtTV2ovcno0S0w0MzBYVnhDY20y?=
 =?utf-8?B?Zk5OWkFLeW5tK1R3L2xkZFNJMXIvblhKV2pxOHdwOXhNY2liYTY5dG9PdWp2?=
 =?utf-8?B?T3ZKMzIvTjB5eFl5VzNaaVFCWWVydmlKL084VHUwLzhmclVQdnZiejJZUzRw?=
 =?utf-8?B?b0VLQUVYYUtDWFQ5V3dBWkVJejNlamdERzJtOExteGUzOFp6VVc1VHJEWE5r?=
 =?utf-8?B?bEcvWUUvSXhwd1MvbFg4VG81dGV6MmhIZUI5Y1kwZSszcUtTYjlxZC9FVSsr?=
 =?utf-8?Q?S6VoTw5qxq2Fox21JrfGRn4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e26e88-f964-4342-5fae-08d9b64bb6ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:57:35.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXBHDNu5nYwmIaNTo+1bKc5jXuRa4r0ZoKyyH04vfubo3CPb+vKKko1PqnmhDExA230rQzmTpYrHUdrJkg4oiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

Instead of altering Arm's forward declarations, drop them. Like
elsewhere we should limit such to cases where the first use lives ahead
of the definition.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -44,20 +44,6 @@ void __flush_dcache_area(const void *vad
 
 static int get_module_file_index(const char *name, unsigned int name_len);
 static void PrintMessage(const CHAR16 *s);
-static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
-                                EFI_FILE_HANDLE *dir_handle,
-                                const char *name,
-                                unsigned int name_len);
-static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
-                              EFI_FILE_HANDLE *dir_handle,
-                              int module_node_offset,
-                              int reg_addr_cells,
-                              int reg_size_cells,
-                              bool is_domu_module);
-static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
-                                       EFI_FILE_HANDLE *dir_handle,
-                                       int domain_node);
-static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
 
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
@@ -650,7 +636,7 @@ static void __init PrintMessage(const CH
  * This function allocates a binary and keeps track of its name, it returns the
  * index of the file in the modules array or a negative number on error.
  */
-static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
+static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
                                        EFI_FILE_HANDLE *dir_handle,
                                        const char *name,
                                        unsigned int name_len)
@@ -713,7 +699,7 @@ static int __init allocate_module_file(E
  * for the reg property into the module DT node.
  * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
  */
-static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
+static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
                                      EFI_FILE_HANDLE *dir_handle,
                                      int module_node_offset,
                                      int reg_addr_cells,
@@ -814,7 +800,7 @@ static int __init handle_module_node(EFI
  * in the DT.
  * Returns number of multiboot,module found or negative number on error.
  */
-static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
+static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_image,
                                               EFI_FILE_HANDLE *dir_handle,
                                               int domain_node)
 {
@@ -862,7 +848,7 @@ static int __init handle_dom0less_domain
  * dom0 and domU guests to be loaded.
  * Returns the number of multiboot modules found or a negative number for error.
  */
-static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
+static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
 {
     int chosen, node, addr_len, size_len;
     unsigned int i = 0, modules_found = 0;
@@ -942,7 +928,7 @@ static void __init efi_arch_halt(void)
     stop_cpu();
 }
 
-static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
+static void __init efi_arch_load_addr_check(const EFI_LOADED_IMAGE *loaded_image)
 {
     if ( (unsigned long)loaded_image->ImageBase & ((1 << 12) - 1) )
         blexit(L"Xen must be loaded at a 4 KByte boundary.");
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -709,7 +709,7 @@ static void __init efi_arch_halt(void)
         halt();
 }
 
-static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
+static void __init efi_arch_load_addr_check(const EFI_LOADED_IMAGE *loaded_image)
 {
     xen_phys_start = (UINTN)loaded_image->ImageBase;
     if ( (xen_phys_start + loaded_image->ImageSize - 1) >> 32 )
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -389,7 +389,7 @@ static unsigned int __init get_argv(unsi
     return argc;
 }
 
-static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
+static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_image,
                                                 CHAR16 **leaf)
 {
     static EFI_GUID __initdata fs_protocol = SIMPLE_FILE_SYSTEM_PROTOCOL;
@@ -561,7 +561,7 @@ static int __init __maybe_unused set_col
 }
 
 #ifndef CONFIG_HAS_DEVICE_TREE
-static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
+static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
 {
     return 0;
 }


