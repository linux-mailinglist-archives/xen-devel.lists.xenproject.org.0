Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1E53CA47
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 14:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341498.566725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6sh-0003X4-Hx; Fri, 03 Jun 2022 12:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341498.566725; Fri, 03 Jun 2022 12:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6sh-0003Up-F0; Fri, 03 Jun 2022 12:58:23 +0000
Received: by outflank-mailman (input) for mailman id 341498;
 Fri, 03 Jun 2022 12:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx6sf-0003Uj-Vs
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 12:58:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8436cf6-e33c-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 14:58:21 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-NWJKvzpZMjyMc3zhy6ck2w-1; Fri, 03 Jun 2022 14:58:18 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8334.eurprd04.prod.outlook.com (2603:10a6:102:1cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.14; Fri, 3 Jun
 2022 12:58:16 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 12:58:16 +0000
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
X-Inumbo-ID: d8436cf6-e33c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654261100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P09xsg/S0JeIpfNf9MHrZwsWQDycBLb0/iFvbFqey6o=;
	b=joArDh/WIsaAlPlScZ9Abei+3s6goJT4sj4JojASDcsBjkdGKwU1US4RGFV9T4Eo5v/jAT
	eg/eyytZ4LW8I+U5Xy3oP8skG2f08Hd9Usv61KZV+zNvaoZ0SvTdjrEDJRHetelxOw7g9U
	fMLNfdYkRIIVMSwrxNqm0p6kmSPC89Y=
X-MC-Unique: NWJKvzpZMjyMc3zhy6ck2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVCR5ohBTumrojmlXscazpol0D+86O8I3b39IHzHBfHmuZ481w6AK2AXKlsVsyvt1dERo7W3/oUXHBurwriE0XCmuAfuS0vK9UVvBMaNUj2rSAClUr6tpdoqwima1VTG8FWOu9mKuNGI1WlTl4zyin6uZSdA14z4QqS4of1J3os8jErYiqofxorLOw2oundjo6VTjmhlcBongtPkAP1RlFS0WKIsGxxl8hCO2Ne4fyTBbSvjR06zy6aP2eCm3Tw74pNpp2nBAhIqBazRJ9hkFR/0Ocx9h1J2SJeKXojm7gfVJRW3u1GIRlj3+0TGNh9ry+vhevfG2N4lkS7Y++bJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P09xsg/S0JeIpfNf9MHrZwsWQDycBLb0/iFvbFqey6o=;
 b=Cs3aFTtzonWzQDMOIl9i25ITPCh10QjuJ+Y/YWnWgUikhmqte+jQOCE9aoYMkFgFrzo6HPPZL4tuSxbM3YQFoc1+gipplKbE0oNEfRwIVREFSDz8L3b3uHX0aAvCBmLIGNEsAWT9Bzp0qhlSosvkGsP9gz0EC+asjRR5lBKtybejaL+JVZEnLOZTHi/JuL03Wm7HOblanXV0RpJvKhzzg9Po4osPfYuqUIkMbkJwl3e5sE/O8nl0/mO/ucQTSAYBgfOKB4OlJUNNaRcIArFwzV1UKB/g7qezYxefGqKQli+Yof5YBeV5HrPFvx8tinwm6GZDRvVQYL0qjFj89IKpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb6c3858-ccdb-4f16-2c16-3aa01b0ba9ec@suse.com>
Date: Fri, 3 Jun 2022 14:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531024127.23669-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0113.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1673682e-254d-4dc7-8b01-08da4560b9ec
X-MS-TrafficTypeDiagnostic: PAXPR04MB8334:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8334DF5BBB3544E8664C83B7B3A19@PAXPR04MB8334.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z1xr8vBr+EGdENWXzoRdkpT6IlXXN/9p8zenRRV1kyzj4Pa9JW5NWsM4VUrjPQVcyRZwDDxBj6ypZxGhh7vHqq0vBCS7fJy5+Qe6GhyLROC9X30HTlS5B8DcTk2Swu6SAWauvhfLL7jYaXxNZzPT3I0qcfmgECZsRNOl4lRCKO139T+B8WAKClcEoGub3ce6KnJKK/L5/UyauNyHoolPUPwrblWr+pmyzB3Tlc2HnIZcMFKuZTVjCrIJ9YpvmrMCIUdpbxM2UfT7k1dfY9h1i0pmZRn93zcnZl4IfrxvOsDf75PjU5lWvYiCNGpX0I63t0OLK6yKvrAlWcFk79P8ug/lPMhdxLAzPvHWi1Duc2KvnA1nYPNCCrLnZ8bo7FFfvKF0+iJfxhQ/ka02Et1HKwbXdoCSNoBvm7It1tasB8ivTl6Z2q46rn3IISy8qMDpYtU0WCzCbqMrcEKbKDsg+DkMVQpoT3msKACByVbvLKqkRbXGlOb5gaX/2vAVS/YfGqepp1kVQ7Lj3CT60GUqh5dYCc0mKEIfBzO2XvGcE1q4nB1Y2P4aVP8+nzJxdQeEYZ/xxULVaR9aCnO9kzlFQI9hraPJPz2x2zFsAjNX0qJvRu5HrmkBRD8RP7gN1qD56304Y+NVcQzeeNTF+d83hJl3lX6Sy+9HdxRpzafSVTooimHx/WmZ1xxzQQDuE3lLj55biqX1XbCqcMJuMJPgY+ESou5A4HZkFOydQ885IFrIls/z9gbcp++gI9zBm3q/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(316002)(66556008)(66946007)(2906002)(7416002)(54906003)(6512007)(26005)(31686004)(66476007)(5660300002)(6506007)(31696002)(86362001)(8676002)(53546011)(4326008)(8936002)(508600001)(38100700002)(36756003)(6916009)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdFTW8zVy9JNGlIeWJrMno4bzZQd0x3TXg3M1R4N29LbWgyUTB5QzA2NHdl?=
 =?utf-8?B?Y0pwVlIyVklVTXI5ejMxSFl6cEMwZ1FGNGF6bHZuc1pRbmVWMVlCTG4reFBL?=
 =?utf-8?B?dG4weGtzRXdmQUQ2QzE4c0RlWVBQQnhyVU9EbmpBM2lHKzJOS1RKbzdMY3pC?=
 =?utf-8?B?RG9xSlVqK2R0UkwxUFJXanlUakxrbWpVa3I3QXJ6bHZ3K0RYSi9wY1B2OFZ2?=
 =?utf-8?B?U0NOSFZMa2xHcDB2bjZ6Z3dSbFVMRUw3Sms4K1V1bzZrM0ZCVThROWE0eCsy?=
 =?utf-8?B?RXFvamdIbWNvM2VzV2RrOTNqaXNQbXlWQTI4MVc5dStTMzYzcUJjVEx0dlZP?=
 =?utf-8?B?cXJjRW1OdjliVWc4UUVnK2p0dFFDelIzTGg3OGxCVHhJMnZPSFJUM2tacC9a?=
 =?utf-8?B?Wm5EakE3VnN2a0VQVFNtUVN2dkp1ZThxRVJmcHZhWFNPYlhSMjhhN3c1NVRN?=
 =?utf-8?B?ZlhYZ3lhKzhiNjFuTzJWc082bkloTkdTL3R5UVpwUlk3Q2ZyKzZQYmVtT1ZV?=
 =?utf-8?B?YWMzYXo2L08rS0xaVy92OTl6SnJxa2lCQWNLQjBsNVdGRm56WEo0Z1Y5dms1?=
 =?utf-8?B?cmdTS1pFOE9GUWNid25qY0lmVzU3Qlhoc1dxelh1WWlyVUpIMTVQOE5DVFp4?=
 =?utf-8?B?RmE1a3hiUHJkK1lPamV0U0FjSzBxejBaWkRLYURrMjFHMml1WVlxZDdvUGln?=
 =?utf-8?B?OWhkcUttNHJncFEzR1RwVzhnVTdwd0oxVDh4QThxWWd2NkVoWWVVK2Y2UXIv?=
 =?utf-8?B?Wkw1UHFYMjgzUUUyejVvWWJXbXVzdERkd0RTbE9uYk1UUVBva2xNYXhDYkE1?=
 =?utf-8?B?OWNXTWw4a2lxR0twK1VDbXpPSHhnV0o3bGcwWE45MzMyaGNNVWFzZmFINEJT?=
 =?utf-8?B?am9mZ0U3WUtuRkVWVm1LdmxYSkoyTHIwenkzdDlncnZ1anRRdmx1R3RFLzMx?=
 =?utf-8?B?dmN2dC91OXRkanl5SFJmblFqczZSWXFQTlVNTDM4VFdxOGZiTk1QT1N2S3RS?=
 =?utf-8?B?UDRJUUlhRkFkMngrRkFBR3JLcG52Rm0rVzduOXUwOWdoSDMvZ3ZneU8yd09t?=
 =?utf-8?B?YmlxdEovbGtUYll6bTh6TU1kejdMaXM4RzdLa25NU3hsbnArRWkwM1ZqZHM2?=
 =?utf-8?B?MFRyUzNTMW4yYk16VUUxRU9KNU5LaHZMZWc4TUt3bFRpZGNOZlB0SVdlYkNk?=
 =?utf-8?B?cTFvU09peXVjSnRuMWFJNExoVkpINi9rRnRqc29CRUkzMk0wYXhFNDNKY2Vu?=
 =?utf-8?B?cDdoZFNreURCNmhUdmFWMS9pd1BHK2N6Zkp6QXRPUy9HNFpKQ0lkdzBuYjZy?=
 =?utf-8?B?WEFBb3F3d0d0cGE5V3FxaGtxZWJoOTBJTEZXV3JDQWp4VlRqQ1Urd3ZMWlls?=
 =?utf-8?B?M0I3QzBwNFlYYTRReDgxZDlPRzB2SHFCTHA4aUVPY0VCMmZLck90SkI5NnRm?=
 =?utf-8?B?aW4rWm5mUVpQZEUzZXhWZ0g4RWR6QlNxcWkvTzF6MUoxbVZicVZsN2JFaEhk?=
 =?utf-8?B?U2VHTVlzaVlkb1RUSXgwcGpEbFBSV05HR0RtZHRHYktQbXc0RGVQL2FkRmQ3?=
 =?utf-8?B?SmdhMk1OYmZIcWdteFpmWThXeElsYmhVdVEzVWFHSzFwQUVFQUdKTDBTbm5O?=
 =?utf-8?B?U2ZMQ3JVZWZJcFNKa0lmekdPazFHcEJBWGdtZXQzMVMyY1F5UXRaZS9RYTZN?=
 =?utf-8?B?YkZQdnB5OVpvakhYQjVzMEJvNk0rK09yQnBWMFlpNVVWdUhxR0xwZkJRblBm?=
 =?utf-8?B?NldQQ2QrVHplVWZDZEJha3BKSUZEd3ZsU29ZUXRyYXorcmR5YzJFQ1V5N3lT?=
 =?utf-8?B?MzBPcTJub3NtdjIyL242b2Y0QzJwRFNiYW5TM1ZQRTJhQ1E4M013NnJVZUhs?=
 =?utf-8?B?elZFSCthZGxsK2YrNVpFd3grcEdVM0MwbTdOaHJtSFJsZzNsUG10Z2tiei9k?=
 =?utf-8?B?a0diVzU0eW16N3h2L0NvK1Z0MFBBOGkwbU9lV1ZFc1J3d2NYSE55R0Q0VnN6?=
 =?utf-8?B?VFVXME5wVWhtL3BSWWhKTk5qZ3Q1UGRReXN3NDQ1cnh1RzN6RWl0TzRVL29m?=
 =?utf-8?B?ZU5MTVNqNXJVQkRXN1d1dURQQ3lkWW93RzN6dlFIeER2eXhIVTErejg1R2Rx?=
 =?utf-8?B?Ni90L2ZrMjVPMElwTUZGOWJYcitGKzUzTWw3VHhiemZUWFA2S0lkK3pnbVNr?=
 =?utf-8?B?ZGFnTm5FcUdjSWM0NGRwVkZKMTIyUzRFTHROUnQrMVE2c1VxUlpPYnJadDh2?=
 =?utf-8?B?bzBOalBldGZ1cUMxMnZqT3RXNFFTT005M3NBOENJUWdydC94SUE0aDdUZExk?=
 =?utf-8?B?SjRpWlZGTGhRbVhLWktpQzJ6M016V25HNTRWV2czUEw3T3k0QlhSZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1673682e-254d-4dc7-8b01-08da4560b9ec
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:58:16.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDP606Da2M6pCOE/k4dJLG/8xT8aA14CE/fKmsiACKoNBibxqsd4w41+qMBHdp4mvb/9/upZ/Xo9dQrXZ82XIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8334

On 31.05.2022 04:41, Daniel P. Smith wrote:
> --- a/xen/arch/x86/guest/xen/pvh-boot.c
> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>  uint32_t __initdata pvh_start_info_pa;
>  
>  static multiboot_info_t __initdata pvh_mbi;
> -static module_t __initdata pvh_mbi_mods[8];
> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];

Did this build successfully for you? Looks like the trailing S is
missing ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1017,9 +1017,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          panic("dom0 kernel not specified. Check bootloader configuration\n");
>  
>      /* Check that we don't have a silly number of modules. */
> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
> +    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
>      {
> -        mbi->mods_count = sizeof(module_map) * 8;
> +        mbi->mods_count = CONFIG_NR_BOOTMODS;
>          printk("Excessive multiboot modules - using the first %u only\n",
>                 mbi->mods_count);
>      }

You'll want to accompany this by a BUILD_BUG_ON() checking that
the Kconfig value doesn't exceed the capacity of module_map. Without
that it could be quite hard to notice that a bump of the upper bound
in the Kconfig file would result in an issue here.

Jan


