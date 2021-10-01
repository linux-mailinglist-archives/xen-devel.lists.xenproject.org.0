Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1541EB95
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 13:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200547.355058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGX6-0008CD-B8; Fri, 01 Oct 2021 11:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200547.355058; Fri, 01 Oct 2021 11:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGX6-00089f-7s; Fri, 01 Oct 2021 11:16:52 +0000
Received: by outflank-mailman (input) for mailman id 200547;
 Fri, 01 Oct 2021 11:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWGX5-00089Z-6v
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:16:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d34dc883-5416-4f8f-b109-c8a407262826;
 Fri, 01 Oct 2021 11:16:50 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-__Wb4LEvMXas0AfxZJ6qFQ-1; Fri, 01 Oct 2021 13:16:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 11:16:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 11:16:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:313::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 1 Oct 2021 11:16:44 +0000
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
X-Inumbo-ID: d34dc883-5416-4f8f-b109-c8a407262826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633087009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J88066DRHprCmPmq6onKz4kV4U88D+q7ClEowJcpkBE=;
	b=NyCj3oLtDLsLFqkpO+RL6siACGtd55vI3XJXyVLV5VxKrrPWII/KjOaaJLKrvdc94j/1uq
	uzudj5lsSL3uxEI4vSNOvX3sdQWZN6jkykAwZ+XQwmQMAwFIB+hVKBe7SuwMDcqyZaqfoB
	7mNCITYzsO6VK5pyR8w03WUay1l22sk=
X-MC-Unique: __Wb4LEvMXas0AfxZJ6qFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ6Xc+3cAW+y9BcO1XxCesIq6alphxZZYh5aQNppn1It/yMtY+jpyWYnohdOXXhbr4YzLQPDmrsRD53qyKBHxmzbSWYSX4eiqlmTbJleWsjHBfyH5aQ7TbIfm8eO7VBYTLpaVyPedHrwAXAYQ45LrgTznXSWX8sRfiEBhZnpU++rtAor0Sy0aEiVQwYgtupUE9g9CRaf74UWo75D1FUBtVxQVg+vQx75/5eiUT82by1p5oFNMSn7gV16P39n4rzYREaBnSsBrlp50mm3fm/vH5GOHoAF7MrBpjekLRackYqlCWCY3gcxGWOqsqiysc2IL/WzhkwqBNnzd9nIBkNI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J88066DRHprCmPmq6onKz4kV4U88D+q7ClEowJcpkBE=;
 b=ibZ1cS0rPTm5lJ+XpNu5am2qvMLA4l+ArOdyo4g2AQnzDWZfLqHmF54HnQlJ1bu49eA2NKObUream1nYKg1q89w+T6bU10z7u0sHIW1cdreOT62oGYwWtK/8cStbS5gvC2lrROSUN3lZwZqqughyBA2jnoHTpafLdzou+WAqgQiley4N5PDu4JeyhFI+JwW3wJxPEWM9vMb3J4cPpnx0PpVwlUNGk+ZDq0p8gKDmZh8ukoVGI/JLLHhcBDY4fGd0iPkdThSTteK1mD1mDXPdYTgf1n6awTUrWO3OzZRN5rjw0wI1XrhW9fIgjYoYVTt0aY3Ii7XFd7ItAn9W+QmzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 3/3] arm/efi: load dom0 modules from DT using UEFI
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21f9af33-0d09-fb2e-95fa-f4c5796671ca@suse.com>
Date: Fri, 1 Oct 2021 13:16:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930142846.13348-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b0ec75-1e51-44ad-4494-08d984ccf44a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63020A329FD268E214881530B3AB9@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UXqgg+Cng6Bdge1llfzpeDBXm+HZJJv/bnjbEkI7b3PfO7dl1h67CojSK2mXwxVZE8KD8ayKDCewC8s3H4YvAnQdwkVPqkzNjQ5CdQ51rdXdeCR7Oao0JKv2aloX5BlXm7BwXws2bjZOLIuDHpDeiGWOgO9C66npIJhHao3Ux/MbedYw98Ds4qsgbIWWR5skFnpoUucAEjlzoFA5q11RhxkkZZuwGQhVMzYi9FzB/u8KiXCMV+NX8UE9ilIcW1KdkYnQLqZUZL2nMWqDGyS64pYxMv2yF17HClXnuCzNB0abGZIghhpEAc6AYASBJW9fkrctTDsZD9s851EWVZbvQDCRLtGeTFqX5rAk6jx8Xjie5zhjZGZHNCeLA5vUvOmfW8qF8PUSogzIVl2emGj2hMh+hzvW6jQwNOCmwO/Us+x5cYHaE58wdXEXgUYEKZHYjPz4ObmB586Ox3yWkAlmBjJmaQJGa/D71tdDpec89X7+jLj1lQoV7jft8fmCnxVVrAHk1CMATkfL9Srmph+Skl391Q4TSjnFNgpTI8MI2PA8c5Er/IVj+3jDX14topDfhPhUer5Z1C9wzTFD/E9Nt5DDSLFjxGf5XTeUNjXDv5+a9IT/CYCT924kIf/CSY8/TIly5e9hVRKr4/twEdZ3TIipU9nvnaJwzapKMsDiO+pW8oJDt3Pcfk6rTskTVnt1vVDGj4sw4Hi1kblXBGITk55uTrhliOXhKz8LlSMa9mzG2eObcTTjzwvjt3hMI+Wn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(508600001)(4326008)(2616005)(83380400001)(7416002)(26005)(6486002)(31696002)(53546011)(8936002)(956004)(38100700002)(8676002)(54906003)(36756003)(16576012)(6916009)(31686004)(316002)(186003)(66946007)(66476007)(2906002)(66556008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZBUVJESHNMQkpaRXZoYys1cHcvVEpUQUVKdmZuQ3J6Rk9HZmF5SUhVNGlL?=
 =?utf-8?B?bGY1bHVvemhYamJQQ1VkNTlvSlNpQ0Q4SGFRRmJzMTh2NE9pR3N0UHQvdFdL?=
 =?utf-8?B?bnZrdEh3cE52NzVNY1p3VEc4U2dYU3Y3a0M2eDF1bzFYYTlYNWxBOHh1ZVpT?=
 =?utf-8?B?MmJEcWcvUDJKd1FkZE5aeEI4alBUYUI0K0k2REMxK0xDWkVra2FLTGJKZ3NS?=
 =?utf-8?B?b1VZZmExYjFNNm5uMHBWRStiMk92eFRiUFBFU2ZKV0tiS1p1YjRmd1JBSEtS?=
 =?utf-8?B?Y1RjWk5TQXJPMXNGbzhTbEhqbXB0Z05Kc0dXVWx6NjVaT0J1d21TUTJBT0ZC?=
 =?utf-8?B?dWQ5NVVZMVVqZ3dkT0VSK2pJWkpwRFJrOUNRQ2Y5K2QxdjBPanNNM1V0a3hm?=
 =?utf-8?B?KzZBOUZySzAzRFhmbk9FWGJjVEhHZndMbHhlaHQ1L2lvTDZZV0RIdzhyMnJV?=
 =?utf-8?B?VlZJT0RXancvQi8yWlBOYzkzV3JxZ0NRakVRamdGOGdHamgrbnZQVUxQTk5B?=
 =?utf-8?B?Z3BVSU9xUVAxVUJEWU5ZUjJVY1FJQmhIRlhtTFFwaVhBSXI0T0JRekRRc2gw?=
 =?utf-8?B?dXkvVTVNV1FjTTUrSlZaNGpaOTkvRW1WWmhEbm5ISEkyWEloZWxVMkdkZDAy?=
 =?utf-8?B?aklmNVN2MUwwYlBNdU1TV2ZmaGhlSUcrVHRhcmJpZHRJbWxhSC9hcThmVHRE?=
 =?utf-8?B?SW5DUlZkWFArYnprZFBUay9wcWw0QlBvdVo5ejJLQVc3V3lYbHcvN2thSmgr?=
 =?utf-8?B?TnE1dFJCZ1lqMnJqOE5BazlqSDRBa1RaU3hBendzcXlQeUtxK0Q2TkFPTDZl?=
 =?utf-8?B?NFhFZE4wTVlaNS9RbWNYV1NIN1EySU1BMkVjZVgyc1lTV1ZLS2d3QU5TY2Vl?=
 =?utf-8?B?ejQrUDdFZm0zUVZCMHYxZFUrbDUreFRLa0MvRnlOb2dCVXF1dEFrNE9EZUlK?=
 =?utf-8?B?L0lzT1FJakhDK3k4cldrVHdzVXliOUt4TEwzdzBTN095TW50aXFraHY1M3Nh?=
 =?utf-8?B?WGhLYm84NlhFcitmTXRFTG9zbEQwT2s1aERHbk9zYnBqWFpLL1FMZUFBTkho?=
 =?utf-8?B?cTBVQml6RVhVbVIwZHJHZjZOYWpvcWVDSEkrVkpGa2Z1QzBxenZzcjNWZ3A2?=
 =?utf-8?B?R0VpYWZSY2xScElBbUcyeSt4SE9Sb1R1Y0xSbUQ4SnF1N3JYQzdCQkJQZFRq?=
 =?utf-8?B?TVNSemFNT2dZVVYwNWozU3h4KzBUVXFxZnprUmpxbUh3cFB4OEV6T0JSbUVZ?=
 =?utf-8?B?Ty84RllsZjRyM0Vvd3lORU1iNnJ6STgvV2huS05WVFNMRm5rVUJxcWdvSXRY?=
 =?utf-8?B?Ui9LN2RtNHNOOTZ5bDcrczkvNmpONHFaYlhJQ1hPTVl3MmpkRlVuaWpjRFI2?=
 =?utf-8?B?THgxb3RneS9uK2hkZFdaOXBHNVVRcVY1OTA4S1Iyalg1cjllK0dQaTRlTS9T?=
 =?utf-8?B?OTBaMi9iMEI3YmVYSHpsMStYeHRZL0Z3RklEeUxjakVIa1ZnQ1pvd3pRRTRF?=
 =?utf-8?B?R0VaR2NMbmkxWkM1TUMzSzdlTnlnZlhQbldjRVR0b2l5N2dhNkY5SFpka3ls?=
 =?utf-8?B?YjU0WTNRY1hUZktBR0pPMmhDMWpaS2pORGNYVXJmbVhtbGdoRUpTaVhVdXhr?=
 =?utf-8?B?bGtGNmVTRkR5Sk13RnE5NnhHejNNbG5aRlFva2QyYjEwamZlVWZ3cW5LYWtH?=
 =?utf-8?B?N1lCL0FUZ1p6MHV6KzNiZ1pPblo1bGpYU3RZbEtzbFdjWnhlQzd0R2ZoeGVx?=
 =?utf-8?Q?d0vUvyMUmFXJvyrHuN0mmBeCT50Qx2MeIczNMTc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b0ec75-1e51-44ad-4494-08d984ccf44a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 11:16:45.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROEmxfHHRy61gZSZj0LPHyHV6nBtKb8liQW5URAUIeJwxjmO5Qr3Fxb4xxsBwJMf4WPSD9HdiDSQf3FTGDDZHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 30.09.2021 16:28, Luca Fancellu wrote:
> Add support to load Dom0 boot modules from
> the device tree using the xen,uefi-binary property.
> 
> Update documentation about that.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
despite ...

> @@ -1385,6 +1380,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      if ( !dt_modules_found && !kernel.addr )
>          blexit(L"No Dom0 kernel image specified.");
>  
> +    /*
> +     * The Dom0 kernel can be loaded from the configuration file or by the
> +     * device tree through the efi_arch_check_dt_boot function, in this stage
> +     * verify it.
> +     */
> +    if ( kernel.addr &&

... me still being a little unhappy with the inconsistent use of the
union fields so close together: This one is now consistent with the
one visible further up in context, but ...

> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,> +                                           (void **)&shim_lock)) &&
> +         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )

... is now inconsistent with this use. But yeah - read_file() is
even worse in that sense, except that there the different uses are
for specific reasons, while here the only requirement is to satisfy
shim_lock->Verify().

Please feel free to retain my ack in case you decide to use .ptr in
all three places.

Jan


