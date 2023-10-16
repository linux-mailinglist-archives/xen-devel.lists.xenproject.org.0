Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706177CA4BF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617424.959978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKVF-0000HS-Mb; Mon, 16 Oct 2023 10:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617424.959978; Mon, 16 Oct 2023 10:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKVF-0000Ei-JL; Mon, 16 Oct 2023 10:07:13 +0000
Received: by outflank-mailman (input) for mailman id 617424;
 Mon, 16 Oct 2023 10:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKVE-0000EZ-7v
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:07:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a9603a-6c0b-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:07:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 10:07:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:07:08 +0000
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
X-Inumbo-ID: c5a9603a-6c0b-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi8jL6eh5+L4u3J1plKBxGJj6SSNZaE+Xmw7zNup0IoDJT42nIRIF9wvoiaJe/SnseAi48CVqGCgDeyHi/wxn0tZE7jp2f3w7W2uPpuAA5gw9+anOZoDrS/0kgYNw1Lk1QnLiUPTExcGsjIXfjFVM0N3WqcVIN/lR5WE1YtFI+xcQZx69OJJBAtj8YXyEC0gqTPPjSOKvvlvET/m8HTbud6rifbL4C55HvsmMMOThBx/28GgM+qgNw4XNROWB+XOzrpKNiwuhpzLOyxXuhcnyfPTxGaCYbb7wukLahymD3Eu17oQ6HzkEc0+06RmBO7NXI541yuYd59Nc74EVTDaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM5fyfKtKu0gfNS1BOMZ3y4vY9dwBbzn1lkBCuvq7kY=;
 b=cyZgY24luNlche/XrR40tNNcJASChr4qbaTKfB0onGFk1Xpv0pNhc0NToh79IsY2699eVkGpl+YyzC9lPkXoDvDUICY/DDZU+BLzuQpgXoiKDmXqmJW416G6yt/YR0segfpA/7htfifpaeQsFjFsSyjRzk8zPR1p/V74JEVGucYe4Inqqs75NjUKRxHGD/5d8Sy4gSM6X1X1N+Ism7e08uz8JYKARHs7bfD1GNvDr6J4Mz8tN/sR2Uds4lr9F+QRs7vgpmA1gJFB/0UAHlFw9C+7F0fnjtysRKh+mSDrDa77AbpdKups6m8jm6gJ7V4Va1LcVxVLH0VkC7xFC3nNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM5fyfKtKu0gfNS1BOMZ3y4vY9dwBbzn1lkBCuvq7kY=;
 b=degIvQseRCbrNDERhkd5hYBBKLaoIPSkgOLKUdHni2qIj6v/yBHEICRZGwhr+6cYwNjFofy+z4+y3OrIa2WdusjpskWwaxPbEPifEMA/PXN9zXce5edIbW5pOvO/fYmC813QgxBIpklPJlme3t9eQxVjcmu05kwzImdTFc74EYliek0VE1ZRYlRtvL4rpGl3Q1TIB6H+oUhQ3ehUTvO44QyxLUOc7MA3vAaa0NrhqYUif664kcU1cAjv83xiXInkeMG32n3hsN9vQRHidlZgRKT7Gmw0+Ql/NgPZzrD6RfGuMOQbucuEvQvmXcxU27/PVU9JiA4YljHZaM+n4EuO5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ed5ba6a-2698-730e-c6e6-46ba7674ee86@suse.com>
Date: Mon, 16 Oct 2023 12:07:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 00/10] runstate/time area registration by (guest)
 physical address
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, henry.wang@arm.com
References: <20231002151127.71020-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 7258bdf3-d56a-45ca-80ed-08dbce2fa81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XvoqRLYRjVxORVISLLvWqHX3BZ7xIYKW3HxgEehjQMGK/NTqAGeRezsK4nX1SLAoPCMztgQoeubKrDWyMGa0B/QMQwJj7jvcE2QomFmnCqg0qJ108a3oUIbG8UwnHbmj9kMdo6ATepf/DnVsQdSK+hsLN8PfeZ4rZPELFORDwBEaOMoS6K+G4ujzAvZhqVJ/daiDzRr7jQtTmMywCQbyDd8bMerajn/iDSRcGkn5EBaVXZB+QwGIm9gst9X4ioh3hhgwGjYyUPzeBdORVy3ZOWH98l+3X9429jXX/oJ4OBc4ZtkBDaj5lm3/YoEdizxFdCTDcJhYP6iRnR53tTW63jdbRpwfcxlXMyoYkZZru/+r3RXA4ZOqeMhWkrAyA0cLUkzXN+8rp7577kStOvN/0fO1kx+csOb28JMS1nBTPI6aJpeVn2GgYRW3w0uDLv816WxQBrWyDNZnlCozEPQsn5byxmr0r0dIY/5cK2d/Trnva94iq7T92gzUUM0goksDsxb9CJSOqC/0vVO5jemhpYO7CEP/CLFG1igGcubqbn9GXfHvMsMWJwifI+ysT1CboLUvGHnXjcyc8klV7oyMfK/RsCZ46C7zKcY1PRyJtu5ce6xRnqyEZAZWffIIFoS4WUAjZuGlKIHNRaQ4KA2h7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(6486002)(478600001)(66946007)(66556008)(66476007)(54906003)(6916009)(83380400001)(86362001)(31696002)(38100700002)(316002)(6512007)(2616005)(26005)(6506007)(53546011)(41300700001)(5660300002)(36756003)(8936002)(8676002)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU5pdnRrZkJxZEdvNmVCNXIzOGJIQmNsOEhpcHZBS0dyTWVVM0Q3eHUxci9o?=
 =?utf-8?B?bU9FRDJYNm8xWjUxc1d3NWFhVmEyK09NQWRNZmFYV0tkZ291TElNZW5PakVB?=
 =?utf-8?B?T1QzcmhRY2lobDJIT0xjM0JmZTF1eXlBMHNEdU16T0VzckhBcjZSUWlTcVhF?=
 =?utf-8?B?RmlpRW10MDVwdExGbDgvd054dlJ2V3AwSGZSa2twbmxvRkFGaFRpeXQyNERn?=
 =?utf-8?B?dWM2U3UvRTFrYVZrLzE2N1JHMTdnWGoxUm1iZG51SmhXUUFodkRLVkNMaUp1?=
 =?utf-8?B?OTFTVEE4MzRLelF3SnF3TnJHdXd2TjlObWtpNUluR0Q4K0NJTndhb0grSmxy?=
 =?utf-8?B?eWJIWTBsNnFrM1F5ZTllVUMyZThRRHY3alFzM2ppYW05VWdHUGQzdU96Rlgx?=
 =?utf-8?B?WDY4ZnRaYU5lRU8xZk5mQ2JOdTIvazJoSzlDYUQ3eGJiUUdTQlFEcFpxcW9r?=
 =?utf-8?B?ajh5ck9jODZieDRMYWlYaFVUOTZEcFlUWjF5R1lNeVFYMUFIZWpMNXlTdmJX?=
 =?utf-8?B?WUdHSUdzMWdCUEtxaERIb1VwL1ZleUljTGl2VmF1bVRxNFdyTVVPQTB5QVpz?=
 =?utf-8?B?RWd3MVAwSUt2QXdaTzBEQjRaelpDTGx6UmI3VWE2ZGJLa2Qrem9iUjJkL0lI?=
 =?utf-8?B?S05yT0JmNmdObUdwd0Zya2pNV3lmbG1DdGpZWmpNSno3dnhjK2orYTVJZ2di?=
 =?utf-8?B?ck9TRmoxam15Z2ZkeCtiQVZaNnh1eWhSS1hDWExiZElNc051YTloSWg1RVNj?=
 =?utf-8?B?Zk5CdWJwVTJNdnZoa1QwckFodjFhS1pPNWs5KzNNRjc5OTBNZGcrbUdhemVo?=
 =?utf-8?B?aFlaVk80dGY1bkFGSldwQnZ1aERJQmhITk40QlRWOGJLbUZyOTd5UDhGSHdy?=
 =?utf-8?B?WGMzSjJJNE9OODhRMjViSTUrSk9iM1V4UzZXWWc5MzExaWl2MGo1NVA2U1l4?=
 =?utf-8?B?eTFrRUpOemk5RHJBSVpHd0FDTFVyVVViZFZSZFJpRXAwTXNOcGRXemxLV2Iz?=
 =?utf-8?B?bFFCMFdndk0vYjdkb1JYWkRBeTVQb2Y3VjUveDUzSGxRaW44aEp2TVZSem5C?=
 =?utf-8?B?ZUJubDZCOUJnODlHK3ZLYjA3ekhpMVdLYjgzQVBXVERMR1M4bnlnRHFUb05n?=
 =?utf-8?B?VjMzQmdXMjNDWUlXTHJhby9tazFpY0xacUZ5emFwbFhpNUF2TEdobjI5Wm4w?=
 =?utf-8?B?enFtV0xhMUN2WG00ek9ScU9relRrVkg0blYxakdsdVdpRjEzRnpWY2VtalVv?=
 =?utf-8?B?Wi9yaWJkTk9BN0xGSjBIVFlCUlR0enNzd0lZcXBxdmJEVnloZVpYeWtPcWxF?=
 =?utf-8?B?YU9FQ3phOWppa0lvVWFKU0cycjEzMXhBQzdpMC9RM3B6c1dtUnM0Njh4U0s1?=
 =?utf-8?B?YURDYTRpWTB3Y2l1RlVZQmltcGt6cE8vZ28wcjJVNWZ4cC83U0c4UkYrZmk3?=
 =?utf-8?B?cGxTTGRTZmc5cW15aE5QU0JBL0xWR3Rud0VoUDBCUEdZaEk1ZXZ4V1JHV2dJ?=
 =?utf-8?B?KzVMbmRXNFhRV1g5dU5PUGluWU1TdUk3SjVKVEFBRHk1S3F0WjdBQWM5aE5j?=
 =?utf-8?B?VDZZYXNieGorWFF0bnZVV1N3Y2NEaTY5Wm8wdUtSeWJTT3l5cWRBVUxRaXBX?=
 =?utf-8?B?WXR3VVh4bDVmTXpVQWs4RG1ZMjA0SXZNWE85RXd3aWdWRjFXTDlXb3dzVGs5?=
 =?utf-8?B?UmJzNXhaQXpPbDJybGxldEJhRlUxcEpxSnJDNXhNeGFMV3d1amZSaHNYSU1N?=
 =?utf-8?B?Z3czZ01mVGlJQkw0QkhmWUVObGxBZis2alBPQ1VjUFdDRitiaGxRNlNHNys1?=
 =?utf-8?B?cWxLWTF1ajFtMWFMYUNuWDlFVkRmMFpDUGFTdHA5aHlZUHdtQWtjRW9LNlcx?=
 =?utf-8?B?cENSMzFQN1hhZDhJMlpxMnZUclI4bFVvNDBzUzhkNGRsWHBYVy9IY2pYaURZ?=
 =?utf-8?B?UXV1b0cwY0U3L2RuOXFuV25iM3hCL3JXM05lK0hrNmpVYjlpd3VKdnhpdE5V?=
 =?utf-8?B?Mm5nRllhUTFtaGJrcHEwOUo2MGxlc1hvcEdITEg1Y1A2OUVCNkdxWlhOUHlz?=
 =?utf-8?B?bGZLaUdnSVV4YjE4V0NoSFNmVWZqbVZDeGlBc1krdGZ4RldZZUFRbkZZVlF1?=
 =?utf-8?Q?aWgmj0D9IYl95ovZR3LdB/D0y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7258bdf3-d56a-45ca-80ed-08dbce2fa81a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:07:08.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH9o6XHwwnt0+CMDCXK9KSqFw/KmDh7hIDaQsja8xFXYjXjmCDxM6uknos3HGUZRjT/L36RbYjwdV2k/96iZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488

On 02.10.2023 17:11, Roger Pau Monne wrote:
> Since it was indicated that introducing specific new vCPU ops may be
> beneficial independent of the introduction of a fully physical-
> address-based ABI flavor, here we go. There continue to be a few open
> questions throughout the series, resolving of which was one of the main
> goals of the earlier postings.
> 
> v5 adds one vm-fork specific pre-patch that does simply the introduced
> code later on.  It does also fix a vm-fork bug.
> 
> Patches 1 and 6 are missing and Ack from the mem-sharing maintainer.
> 
> Whole series will need a Release-Ack.
> 
> Thanks, Roger.
> 
> Jan Beulich (9):
>   x86/shim: zap runstate and time area handles during shutdown
>   domain: GADDR based shared guest area registration alternative -
>     teardown
>   domain: update GADDR based runstate guest area
>   x86: update GADDR based secondary time area
>   x86/mem-sharing: copy GADDR based shared guest areas
>   domain: map/unmap GADDR based shared guest areas
>   domain: introduce GADDR based runstate area registration alternative
>   x86: introduce GADDR based secondary time area registration
>     alternative
>   common: convert vCPU info area registration
> 
> Roger Pau Monne (1):
>   mem_sharing/fork: do not attempt to populate vcpu_info page

Thanks much for picking this up during my absence.

Jan

