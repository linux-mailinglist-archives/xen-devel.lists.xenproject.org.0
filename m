Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D32584B9F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 08:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377318.610470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJOm-0003s1-9h; Fri, 29 Jul 2022 06:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377318.610470; Fri, 29 Jul 2022 06:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJOm-0003q3-6i; Fri, 29 Jul 2022 06:23:00 +0000
Received: by outflank-mailman (input) for mailman id 377318;
 Fri, 29 Jul 2022 06:22:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oHJOk-0003px-GU
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 06:22:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2f9f3f0-0f06-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 08:22:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2299.eurprd04.prod.outlook.com (2603:10a6:3:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Fri, 29 Jul
 2022 06:22:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 06:22:55 +0000
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
X-Inumbo-ID: e2f9f3f0-0f06-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzyfGKqAgtxVuEACmiM+QKK2Yc3EDlzc4L3TwlVSMg/pDZ/6zsloisj5d0NnZFAmiYGgfj3iopfqnlbcQJ8cXfx13AdhU0YOhmFwl1HwYm6u36tRXpWLBhNahUDMTl5bdk0ExUvSaWkEUvhfktvsbnYJddt25By9yUBgWUCNGSKm64CZbOXn8exv8vugwIA0tMuYjk3dw4aztZGgyhvk0YmzQfbNLly5Bj0u92HShq2zv5zQPJ7QYFguXxQSj7MNkpOMZv9+iMmZA8kgo3SUgdN/9BT62JYsoYZixh7797xZAr/1dKtcUr41+v6zk3SMK4Ako9nrze4ighkq6R9j7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9tt6EqXxD28ek1A0jl1qTXqxV7UgAC/yWPsX7RWDbo=;
 b=EpIf3xsbDxqKJWF0rUVJQW0HeLgOg10Rn4uRP+zuKUJlZY3TID7ztWNDbYFnniaA64bFDwkbQsi/dYrjbCq8tfllEUKBkY7aKjgYwVZGWp7N/+h/vbkg9CCqwBkvOp8HeeFCvHV+Cg9YL8worYq+Q3xcWaB2RYRQahcY0o4SV2StGGDmb9FTWiFiFmQhoAA+DpRZJkLyOSFWbV+7G4b21ayNJBuSmFLkFJo76KxfH/dGpj75d1rrCTJxph6LrxV8usxEWINslbHimHkhU5ev9Z7DLslBcQDU0rRqiKX4ZNWBAzhfw6pdOauo9symU81GRS+qPJEqDne4M7DrCAV/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9tt6EqXxD28ek1A0jl1qTXqxV7UgAC/yWPsX7RWDbo=;
 b=DcCc+mg9qAcCt5YUXm2KYDxRck1a1kJhKjnuR2G9VteWCggUrPvQTsZZKFi/fOyXRn2MmQHu8HP/hTTZTI7Cm5So+2XOsrrNkXE8vy3JGzw0xr2bvaSGu5Zo98zMBBXqkbF+AhjdvkimPRqbqkIdoxG1Hrv1n3s7Vx5NZX2Cfvl2bslYK4p4ET+9ny5uQfBB/+jPZm+O9GGZv+P4r7q4puuZUaAmaRWvUxc8TCyh8zyxH6/b9BG7pZFdwGKehfmxT7Tgt+pvnAw9bEABOG3JIzgh5lgUoxD3rq5ymiPMf/T6jYbvVSqETdhR7Oe6C/GOm/Wo9pCqEBCV6ZMo1Hyf5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
Date: Fri, 29 Jul 2022 08:22:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dad35cc-baee-40b4-4dc3-08da712ac60b
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4kkBcODQfw1koCTDKLa9NSXGw2pOLkZpPynGEVffNiD9AyHDrSNUvjMs7KO0YNagxKLqv/xE+mYG1WJQ2AmDRIr5IsGw/0W4XTSgJ1ea4qiKE+kOEFbmYhqgo6vLYHnAlDCTExwwjgfQ4PYML6hkP1Cybo5r8IEl1EHX+KECv0e9O6OUrqeBJWE9CpNG+xk/Ofsxxu/9WEriT6aF9lLS6B85u6dwE9x6F9/+Gx7l0x8LjRLpmAbzGSDoeGyUbxN/d/Qv45beCSgAPbjeIYJoAp9tcd6UqtEsWBD4wi4GEdVfwPPZ8co2Eo6pB9X6Arin8wAMj6/MNByIJdF8RsToV5mc9jbbxA2OQXQqGT2SHHdmJy0Ud7E/4YqOmCVkAa7bmtD2ffrW7YTkPaVs8+clPiAt2wuvJdLLLVo9R6yUKaW2GwJ6CiwTVhaMAiiLieZ5npJrGtW9+zcLUmIobeko4WuY/0CYITfPyQMyN7WUj+Om63GQ71mJd0YfHHeATxdyyk+0XRN+R4IrDYAMd1KSonJdOTnOy4bJ3K2egxxZE+xJaZwGx04VXLAf8zEP4inkJVnrIeleUOsuNhu7m3uZ4tSW1YFYisaUQnAbHGnB/RsGPZC0ouHExSx2zjBpHD/46iSu8NgUPt4IyFaYgZWp1ePOVa0KdlLW49Q/+tvH1MvyP82CL8UqIdBra0QtAT9scOYLAfskWtMNv95ihIUd8zq6SABeYsadhYZQ2NEZ09/LkGxROEzXzOUhlfPgLzi1eQG8bIHk4/EPqRxNkZFJ1ZwqiZgCRTeOXogKuj7FsXf8xHllLdsXx9Mv1sCeoiKLJ38i6xBu/ZiotKLAZCcTfOH5skAUo6vSeG2xr+MYHd/1KYTbp9x2XeAWKX7iXA2C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(136003)(376002)(186003)(6512007)(41300700001)(2616005)(316002)(8676002)(66946007)(31686004)(478600001)(4326008)(26005)(6506007)(66556008)(66476007)(53546011)(36756003)(31696002)(8936002)(83380400001)(38100700002)(6916009)(86362001)(966005)(54906003)(2906002)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHF5VHRTSUd4S3hCTDlKZ3pqQ0luaitoc3NyRDhDcENtWFhmdGlDajAxZzRq?=
 =?utf-8?B?cUZYS3k1N000RTNYTVpyTVZYbG5jSS9DNEJKNTBDUjhTcEp6YjNjZDZYbjVl?=
 =?utf-8?B?MFcybVVLNmppZWw0a0pFaU1JdFRRYStlcDJqOGRNZEFJZU5HdG4ybHNEOFJz?=
 =?utf-8?B?WjcyQndkN0ptdlNMZWpmQVhVRVFKdUcydHlYbEVYUnlRWDlVOWdWTFcyb2x1?=
 =?utf-8?B?eitwUXNkRHdHRzE0RTQ3YUlrMlQ2MDJDVmIxVWdPMGxVRVBsczkvMk0yZ2N1?=
 =?utf-8?B?NEdXdThpQnNDMzJQb1gxSXRNdVB2bEx2dGRWSjB2YmpaSDNOVGlGV3M1N20v?=
 =?utf-8?B?WjkzalROREVicUVMMXVLSWxXcktxV0RMblVYdjlaUmVTYXE2QkU3eG9saWwv?=
 =?utf-8?B?YllHVGVyZjdkOFp2SWxNOHZvbWJhQWNwMVBNN1pDdjlvUFdYZ0FVc1pmUGZ3?=
 =?utf-8?B?UEsvZUZzRVJtc0luU3A5UmN1RXlWWVpNSDhVeFpzNWV1eTFvZUQ1R2lKZWpP?=
 =?utf-8?B?Q0xMTm9xY2RMSFBjNlo0aXIzMmNreGJ5bEw2c3dSdytKMXBSbjg4dDhKOElq?=
 =?utf-8?B?WVplN2x4ellwVlkyM2cxaGpKREM3eVZ4NDFHUWoxM05oY0N3Q1cvUU0zY0M5?=
 =?utf-8?B?L3U0cVlvUWtjSldhRGprSGV1NXlBdjNURWVSNFQxWVhuaUxwSHhmM3lMV3ZG?=
 =?utf-8?B?czQvbDIzcnVkcnFJZnQwVkY2V0EvcDEwQm5zSlgyQVhQUzRHcVRuSnJGQjNw?=
 =?utf-8?B?d1pDMjBmM0ZQaXowei80Skkyb01zMXFxcTN2aGtZWEpxWkY5Z1FXTE5lUHRZ?=
 =?utf-8?B?amh6dVF5OWxyRUtsMDZkRW8wRDJBUW9CdlR1aCtNeXBqSUVBZHJhL2xSM0x2?=
 =?utf-8?B?R1JkTGFBelp2ZS9FTmtMclI4SGhEOUxnYkZsTC9HajgwbWRTMFcyMEx6aGlW?=
 =?utf-8?B?Q3ZRc24vRjJvejF1R1QyUjM3V25XVVhZOFdzcXljTVN3NW1zRmFyWG5kUCs2?=
 =?utf-8?B?ZVFXMzhrOGQ0OERTUGJBeWR5aGs3dVpKYlF4cElPVndqamxJR1BmRTg0bmg5?=
 =?utf-8?B?dWRYWHNwbmNZM2VDZDJydFliRURyandvOEpyMDIyOW45VjlPc21RZUhrT2VW?=
 =?utf-8?B?dkM0c29kenpSWE5BZEIzWUY0dzVNdE5SYTEySXJ0bWZBRi9QQS9tMlFhNXRw?=
 =?utf-8?B?cEVYa0R0Z1hhY3BXWVUrTENHQTk2bDk0R2duV29vQ0xYRzJRRzUxc0NCeWV0?=
 =?utf-8?B?Ym9ZNnF5eVY1clMrVW9JNmtmS3F1MGZGMXNMMzBoQ1MrQjltajB6dVBUV3o3?=
 =?utf-8?B?dXFqeGxHSFpTS2xDKy9RVENYT3dOck9xbUhkYmpWeWRHdVFURS8zM2hwZklm?=
 =?utf-8?B?Q1FzZkxGcFZOSFNvcFduMlVIKzh6d3VjbUpBWHgwYXFleVcwY0dMUHh4eEFp?=
 =?utf-8?B?eldCa0VucDk3ZkJ0SS9ITHdvNmV5Rm54RUYvaWZvOHl2cHVHVGZmTU5lU2Q0?=
 =?utf-8?B?YktrakttMm9rb2NkZmhUTmJVTWtMQkc2aUJlV1VYNEppVDc3c043cFlhZEFm?=
 =?utf-8?B?SVBhSlJidlF0b1FBR3k3QjlvT2VJa3hSTlQyWEdYL2JYTjFQV0hkNkZBd2lt?=
 =?utf-8?B?VjNSMG1sNFlnL21RN0w2amFaV25MRWg5aDNjRGh0Tnp5Q3FTVXpnZU9XWTUy?=
 =?utf-8?B?ZGtja3VrVFU1YS85TUN2U1htS2ZwYnNyL3Rrc3NQNW14aVpFZm1peDBOMXcz?=
 =?utf-8?B?bGZ3Ti9teGRHTmdOUHN1QVFqTitib09SVTYxYXd2cTVYUCtwck9pU0NMRjZO?=
 =?utf-8?B?Zk1zTVJZa1MzbEtqM1ZXN3Q4bjBXWjkvOUIrcnE2TnFkbkVXTllWeE84dzl0?=
 =?utf-8?B?bHppS2tFVElUcW1IdVBZNk9WM1hlRjRxVm0zTHVBSkRFUURNektTWGVUbEpI?=
 =?utf-8?B?aURraWtjSm9Oa3EwZHUvalViRDJlaTRLeXdsaTZrM2o2M0k1bUx0Yi9pbVQ3?=
 =?utf-8?B?VzBNVnRCSjYvQ0FoZmUvanMwY2x4a3VQaU9VZXhOcGp1Q1lWOTNMbE43Y3J4?=
 =?utf-8?B?Tk5qQ2dRNWRvdXpOQlUxQ2d1a05SM0NVd1FKMmYra0orRWpqWUd5MXBWYkZP?=
 =?utf-8?Q?UBnqhuw9r/tReSpqX8f6AkK0K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dad35cc-baee-40b4-4dc3-08da712ac60b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:22:55.2947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+cRFeOD4zg1X6d+uwevSvzuQ5QPWh6YbZ04PIHIS6h3aucsWiXcsPnBZVLPcAHXazUr7sWC65zeiZyVkb8fMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2299

On 29.07.2022 03:04, osstest service owner wrote:
> branch xen-unstable-smoke
> xenbranch xen-unstable-smoke
> job build-amd64-libvirt
> testid libvirt-build
> 
> Tree: libvirt git://xenbits.xen.org/libvirt.git
> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>   Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/
> 
> 
>   commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>   Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>   Date:   Fri Jul 15 22:20:24 2022 +0300
>   
>       libxl: Add support for Virtio disk configuration

Just in case you didn't notice it: Something's wrong here. I didn't look
at the details at all. Please advise whether a fix will soon arrive or
whether we should revert for the time being.

Jan

