Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788F49B139
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260040.449003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCIy5-0007Xk-RU; Tue, 25 Jan 2022 10:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260040.449003; Tue, 25 Jan 2022 10:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCIy5-0007Va-O2; Tue, 25 Jan 2022 10:22:29 +0000
Received: by outflank-mailman (input) for mailman id 260040;
 Tue, 25 Jan 2022 10:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCIy4-0007VU-4q
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:22:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a3dd6e-7dc8-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 11:22:27 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-vPBMhRPsPc-fbiITEB_vLw-1; Tue, 25 Jan 2022 11:22:25 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM6PR04MB6070.eurprd04.prod.outlook.com (2603:10a6:20b:b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19; Tue, 25 Jan
 2022 10:22:24 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:22:24 +0000
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
X-Inumbo-ID: b1a3dd6e-7dc8-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643106146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9Bgg+SJfqXBi48fTViXxwhqboRLSdtVpLXPDceCCC8=;
	b=P0Q54MQSXKyIk6BbAwfzyiwGYqGw3roiwCOKxkUAN3ep0JvnLKFie+34AUZLD/+X1py1rD
	YimBKeJpIhfPJgj3o/ORXp85/5ULNohna0FSssGE9d2o4f/PXqIbigKkgn5gZ641viTmII
	ALzhkD+VAoqsDD7rF1Hou8EPwDOJe9Y=
X-MC-Unique: vPBMhRPsPc-fbiITEB_vLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/zw7dMEa/R5mMgGH0MMqDPPtLpKyOTDuh7qq4swC/cYLIEB87FmVt67WZ2DuZuuG6zP2ohbtuPCSncrBGNSPuvOskomWyPCVk6GXfn4Xvdyqtya04wtMHngCW4DLb3lmmahxLL+83W/ELGP7eFhmxDWNYAw6DhB/R6v7i8SzzLb6H9aYXPrpgn0c5doJnNm/45f3f4SugblfEKo2QNSYJzwz9DodFYwoTJ6niEaYwI4CT6X7Fq1iszfXownfyeqW+J80BNYBCvkCuPjcMdgJKyUa+ATGaCPoFz9ShCsncbDkI0uZkh8jILbJRYfweb7eyt/32dRO/8o1xs/Sm4Vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9Bgg+SJfqXBi48fTViXxwhqboRLSdtVpLXPDceCCC8=;
 b=JBD8Zpm5RVFiEzWthQP3up1seknXEq2VSOTaEFu4/1LIkildsOoqdkHuU3OhUr24AgvpEjIP9/nez5fwQGKysbKMUH9r9zaQOwiuMB2QbbTKyN/UkOzeodWOG+rBjQYI352LeJsHLJSMuH1Z54sIbMwZRiFABaH+kcWVDxCjIP9M8dyvy9V8V23tmHPW2ye1wuP6/PZddfOKoCgKBJjNRkrGRDB45F2SBHO89zn0xiWH5qMZ35o13panXAp6ob7EX09tKRMQ04aHF0pkoHTaMXS5hWAWTx/93XKMph7jwlWjY8MI3OVbrgJnvO/soKIiiioKGSmrXk3YPaZu+e7L7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de67a7ab-785b-f545-5aa3-36e710db0868@suse.com>
Date: Tue, 25 Jan 2022 11:22:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/37] xen/x86: export srat_bad to external
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-17-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-17-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::11) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b121e2-bbf3-43f4-e370-08d9dfec9445
X-MS-TrafficTypeDiagnostic: AM6PR04MB6070:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB607038FEC403B1270F35E34EB35F9@AM6PR04MB6070.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dIgEOtc1UoG6naIqalFJjV2I2Z4vsfqKVqwVRysfdv7OOEKRP1+hwpo8Im2m5bYRnTmDmI2LliK80Ju5BzkcIwKd4Ryl7djlFQmrhsrKS84uNwKgxQvLEC2HQeEhALpsUH5MADx2Y00NicyNMdBKuyczcogNLI4xwvyKK+OqMuNi855wr87qbtwkn81mDk7K9GW/d9x6LgcXoK/nLBn4oX0DltgWFOEjqBhouVslsBO6XKyZ6vrCjljYWuTEFqzkZG7pqwGFOmzXcyflGinqu/ra+goj/QUw26ukGcFaZxUCwuFwprzrK/bsfELrZuWXFEOwhgH2TjFzIGN5nov/5vkX+rYUDk7tdlYiEZ5cqmAbcvbwFCrt46cyegLD/o8CvX/ustOGAd5nl4kUSPPOfDAC1uO+qoE6u09335pyqdUeI9itrUcRNdSwXVG59EEbXZt7oU4zZUohjcJazhmYtLLJg89oUN3n4Ckt1HWJHt53mykpKl/vZn46Q8WK/riGGogkhHmti72XDMqiblguhVbFy8I0OdOGj4ebONjowEAeMcrr1sKM9Cq1LyhBACY4smNpiikL80rAyYEH+CVXoH5xHA0a2V6Qjcz1DBiYY4sbv7uJ80nyDz7uGO1SVGWuIg7elNbiOHwDlWkG1X/xpH6IbgwXpLRkTn378w4ToerHPT1OqTbvuc/7NypYPXWEX6gaayBmDMc2UITfhOiUeoHYWkatPeaKakRJ062n1NA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(26005)(6486002)(36756003)(5660300002)(186003)(83380400001)(4326008)(38100700002)(8936002)(8676002)(53546011)(6506007)(2616005)(2906002)(66556008)(66476007)(66946007)(31686004)(86362001)(31696002)(6916009)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkV3N3ROK1U2aDhSMisrUGd6ZUV6QWREbUNZSzFwVStRclMxMS94Y3AzeDE1?=
 =?utf-8?B?RW1JcTdwOTJMdk91QkhoeS9wcHU4N3FMejRqTGE3WEY3RnpzYmViS2ZwY3Bp?=
 =?utf-8?B?NktKZW11U0lBaW5tQytZa29ES290MUU2M2VqTGpMOTlhZ3RvV3ZyTERFODg2?=
 =?utf-8?B?K2ZYaTRvQzdOVDUwQkMxQjRFZ0dRWUFhek8yangvbnQ3dGpFazBLeTU0eE95?=
 =?utf-8?B?ZHFZVjdGUi9jdzJZTkg0MGtLaFJlWjdWakJ1TXRCTDFkSzJMSmVETUJvNWhP?=
 =?utf-8?B?VkQ2L1pRMmVheXBXdC85OGZ5RDZReTBFMjhRZ3EvcHlLbitYSC9QRGE0N0xy?=
 =?utf-8?B?ZkpmcmVrbjVYcHhUaTNSRmFmd1JibzJGNkZYZEVGQUdKZENjT1JoTC9HK0VM?=
 =?utf-8?B?cXlhM3FEZC9EallyVndPT1lrZzNXcG85N2VQVkhQVDFoeHF2dmtQbVlZTThh?=
 =?utf-8?B?bFYzc2NMRm01T1NOTEtkYmFqV0NHOC92UHRUTXNDYTBkdFAydHNMUGlSM3NN?=
 =?utf-8?B?dlV6TzJxZUxFSHVqSURLTG44b0I1bzNUWUJZTEtSYU1aYmxYS1FtZWtTOUZn?=
 =?utf-8?B?amNjcG1uQ2pjRElBSGVPa1BZY3g5Ni9DeHFTdkx5OGFjemRYOVM1cjl4aEJn?=
 =?utf-8?B?a282VGRYaEVsQ0ZIcXJwdEgyYmhkOUhBMm9qYXlIQjRzeVV1ajdBcmwwMWhp?=
 =?utf-8?B?TXRGemcrS2tqa3FrbnlodTZHaERuMkgxZnBTcTZnVWpPdUR1Q052bEthcUox?=
 =?utf-8?B?MllJVDJhZ09sMkdsMnlNc2w1RER4RUdOdWRzcDhJNTg2bTNxYm4rM2ZzYUcv?=
 =?utf-8?B?d0JpaGZnbTVMZ0RNa3IzU1R0L1JLbUU4b21VaEQvRlR1QWdpd3lmNnFIQVgy?=
 =?utf-8?B?bWNFZFk2OHd2SnByTTBKUWU4STQzdjhncnBqNlE3UUw4eXZqQ2J0MFRreFZS?=
 =?utf-8?B?Y3p0WitwdGJuRjJsOTBtRTB2LzFHZ1VVVlZ5NkZKVG9GbTVuUU9RUFNtand5?=
 =?utf-8?B?amxKbDRybUl3K2xma081Z3BSLzZFKzhNZjdDN2ZCL3hxSmRFMlNmM252TkE3?=
 =?utf-8?B?ZjJpbVZ5bi82L0cxYUppNzQzSGY0bUlqZnJxRjdUWmwzQmgvOHdzenlObkJH?=
 =?utf-8?B?ZjAxRGNjaDBscTlwQmJRMEtxODN4T3llczZVUnBuOExWcGoybWEwcGRiUHZq?=
 =?utf-8?B?S1J2bUE0aW52UjZmRkxYVlY4WVZkVkE4R3R0VXA4aDR5bWtPcTVhNTNXQUMy?=
 =?utf-8?B?ZExKdUlvYmVyVzc3bzYyK0RJUzVneUZmK1NhWGQ2TE1zc3FHZGxpY0lzaDJz?=
 =?utf-8?B?RGR4dUlkaGp5YUZwZjdpdGhwVkZ0LzFHc0pzL29NcnVkYWZRK1RaMU9UaDR1?=
 =?utf-8?B?ZnQ0bjVLWlJpY0lrZlM0QXNxd0xXWGpuanc1L2NGanJ3RnNBYXBjK3FFYU8z?=
 =?utf-8?B?QVRyRFVwN2tIZEM5d3NmbnVVanQzR1ZXS2wrU0RIWEI1UmZORmZxYjVMWk1G?=
 =?utf-8?B?U3B3MWo4NTlWMGtIcWhLSW9pejZGT2JzdHl6Tnh4MnA5djVRQ2s4VUFTUGpO?=
 =?utf-8?B?N3RxMFlMeXFQc2dpUVZjK0l0K0MxeG5pcStEVXo3QUJ4djZReDBsTGlrcllF?=
 =?utf-8?B?YUpEbmcwL3NsNUtpMk9zLzYwNGY3akduMklkUG0wdnF3VGNqVmx4NWhtY0No?=
 =?utf-8?B?S3JJamhLWnVHQlozamxkOGZXeldmQ3BNcWM2SlR0aXVNbFNCK3V3UUQrRm42?=
 =?utf-8?B?VnZlK1FtNUFqRld0Q2Z3UkJDZzV2VXcyYnRRakV6YjB3c3V4NFl4UmF2WXJ5?=
 =?utf-8?B?bUppSDNkNjREZHN0dHhFcWJzNjZzYS9LUmN5YzBnTDdPbzJMR1lDMjdTaXd1?=
 =?utf-8?B?QVRUR2lqRHQ0cDhHL0U1cXdZQmtHZXRSSXZ6MVQwYWJFVmNWS2JkZVNRZUVZ?=
 =?utf-8?B?d3VVWGhiVnFaUGs3YUE5QkJqOWdOVTZzYUxhbGQwa1JVU0dUNnR5UEp2MnBN?=
 =?utf-8?B?UGdaUk5OLzNjaTFuK2xIN3hoLzd3M21pcmdBdnZqcFQvck5yUmorNnpJT1pV?=
 =?utf-8?B?WXREMnI0RUkybHlKTWwzakpHZXo2L2Y0Tld4WjVwNGFrVzFRdTJnS0pYaTcr?=
 =?utf-8?B?Q25heE9tRXZjejNGdUdnZFowYjdqTHlycXVJQW96K2IwcFdydklFanFlU0VI?=
 =?utf-8?Q?yUKTaT/EEkwoL5tMFBIiL98=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b121e2-bbf3-43f4-e370-08d9dfec9445
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:22:24.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP9M24GqB5q9QTMa4IPEIe7Squ+fpZ8AbqfRKqf3j8rze/YXd2i7gc8ZH0t3kShKMUfSKIyshkxelrk7tI0g2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6070

On 23.09.2021 14:02, Wei Chen wrote:
> srat_bad is used when NUMA initialization code scan SRAT failed.
> It will turn fw_numa to disabled status. Its implementation depends
> on NUMA implementation. We want every NUMA implementation to provide
> this function for common initialization code.
> 
> In this patch, we export srat_bad to external. This will allow to
> have the code mostly common.

Here as well as in the subject it would help if the function name
wasn't the wrong way round. I also don't see how you mean to use a
function containing "srat" in its name from non-ACPI code.

Perhaps alongside numa_mode() (see the reply to the earlier patch)
you want to have a set_numa_off() helper (name subject to
improvement)?

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -163,7 +163,7 @@ static __init void cutoff_node(int i, paddr_t start, paddr_t end)
>  	}
>  }
>  
> -static __init void bad_srat(void)
> +__init void bad_srat(void)

Nit: Once again, when touching code, please take the opportunity and
adjust style issues (here: __init and void want to change places).

Jan


