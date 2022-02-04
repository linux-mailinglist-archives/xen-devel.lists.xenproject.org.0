Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916064A9523
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265160.458461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFu0R-00053w-GR; Fri, 04 Feb 2022 08:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265160.458461; Fri, 04 Feb 2022 08:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFu0R-000515-Ct; Fri, 04 Feb 2022 08:31:47 +0000
Received: by outflank-mailman (input) for mailman id 265160;
 Fri, 04 Feb 2022 08:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFu0P-00050z-FB
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:31:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e26b82c0-8594-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 09:31:44 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-6zsKg6GMNWmLZglFpecr2w-1; Fri, 04 Feb 2022 09:31:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2729.eurprd04.prod.outlook.com (2603:10a6:3:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 4 Feb
 2022 08:31:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 08:31:37 +0000
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
X-Inumbo-ID: e26b82c0-8594-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643963504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LK/CR0+BBooKbsYdZzl2Ztn7yljlzCE0MS/S81bF6TE=;
	b=MGol7dZEZJmYzC5lcGyQ18pUv6VxR/gzaAdlMma617X6XwhecVZDKDw3jB8S7+Z9A/kQUT
	aC0C3hBpBc7pi+krRGAH0lks72xwaAuIiDrff/xDOlKH8nyTRFV4lMroLvqaa7YH+s3BPg
	KjqA76FxFOBH2TuFak3qpHpigwRZl2E=
X-MC-Unique: 6zsKg6GMNWmLZglFpecr2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBQ45ptAFfrSPHnxr5JxiUAONZyYtwquJCvA2H32WMWOkeUxZZavzhhdBvYLEz4F2lBJ5EL1iXQNrH7LkuI2EEX7HGvRnM6b2yOPvvCxa4SaI9GUyRYZlWPzgIBj2GazAmLm2dumnM5lfkKxy3yxGJHsStnMvnQMe3BggR+JdhocFqWlHt8xuxoeN0gcr34ORcqBQKAwOd9dQ/kj1OiFx/cH56zaWoGgDMo/UuF5tfIG3lpr4rwf6R4abJ2cXFGu7j6rkKFMu8j30iKYWn/Ip7YOLrGzDdEFXC2YesDmoUxbSFB1nOgUI8poFd1BNOLcQi12xDG5j54SUXU3nR9YcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK/CR0+BBooKbsYdZzl2Ztn7yljlzCE0MS/S81bF6TE=;
 b=SS4lroUtoN7IXsm8d2/2wA9k1QfqlBX6TsJNjTVpeQKfHBDrlDgLNegSwa9Jr9tFq1VVyERreslwYe9soh35r5Io47H03YGj6G91ltNEUYlU/FFhB90hSG68U8Pas9nRtu5zYNRghfO8GAUU6XX3BG0XjCeQnJZQfme9Bj/UTD/pbzy2KIjzAUwG0LHdOfp+GBtyF2C7iDEfK0+rnBzqzRVc+1RU2YqXDOWjty6gbY41jyqcRrjBThaCZFgwvcLMzTHPpmgsxUqC+7G+HeldSVog5uZOmg/gdP13EZLaYBCol01rms06Uesn/zKE8k+kt6vL85M5N9yBZ3RHfw+wlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
Date: Fri, 4 Feb 2022 09:31:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220203181023.1554-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3c4cc48-c2be-4814-ec1c-08d9e7b8c2bd
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2729:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2729B0E5083CF85197255625B3299@HE1PR0402MB2729.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRWG4Utf97o4NtDMIlPTUbvL2dgSb7Vw5VAT6U1/271Q2uO/eUMQ/Y9OOHNfUCingx14FiMwnW6Tkb+bryyU769ekQOzqXnxHTW9+51zrxDRYoaCp9cSDhm+Y6vAuIvAmxF3kabCWTP5AaEi/Lri6s3V3GvbGVBFYyhzuzjjiXpK2HGaiwMJuf8UPV1z2CcbF07WfLOeAP+gcLc1RfaXva7CeHNDVOJUw2d2m5SH1Y78bFKbQs3Y7RgYjUw8xHcq+6sb2FgBFbKy98kG670ETkvWnHXGkjjMaUL7YLoSWkhpOo8a0pZbZZY3XBOuzrqYIWXeQ3iEWrmnDcIUsALgzWyFlrJIzTTnW/igJ0qv5REIbgYLOmvwwEiJktpE4ZKSJHbbuuWzMxrJXVsVBNCudEHZZJnFeumxDRSZ/yReBdPB20/WPV9IrlvOhge1FVCbNRxkfM8ffIj3ub+wZv/kfg7D0Vk9wCk5uiQLbXsp01B5zprq6JKim/c5HWDnFPt9SJbwCUKQ5H837q5iqdo8LFsEdtKjsx+hYxsWgNdAzhcSAij8oVz5d4NUncr34GdF5AB19rf/1ZgjrlX9pgH/o9vIzSdzmqm4JPWpmDqYqpAHvkoiwKM3Kv4XBaCnxGolqdA8dc/dLxT50yxernzVX53tjhw/yxG8q2APvvVmb+r0PrjUAMvf/ihB5u85uyrZ4Crl5epwkHXleN8blpvDgyhVrpwdnbUiZWcBnV1JJJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(53546011)(83380400001)(31686004)(4326008)(2616005)(2906002)(66556008)(66476007)(8676002)(316002)(38100700002)(186003)(26005)(110136005)(54906003)(66946007)(8936002)(31696002)(86362001)(36756003)(6506007)(6512007)(4744005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVFFYWhPenc5K2lKSXZyb0pUNkYxd2VNS3EyRG8yMzRzbWk5ZnduOG5GVktj?=
 =?utf-8?B?MVduZDQzWXgvUjQ0OEZraWpQMmJabWpINWtQWjZnUytudm1MOTV6cTRmR2RQ?=
 =?utf-8?B?LzdZL2x5WGpjUWNGdVJ6Yjl6ck5wUEtzRjZMLzh4dUVSM1BRV21ZZHZ5WVp5?=
 =?utf-8?B?ek50Q0dJUEV5cDBPM0FCaXhSQ1ZtNDhiazNaRVRkcDNuRXgwVmQ1Y0tZaFNQ?=
 =?utf-8?B?M2g0d0dDcTFpOUFrejMzZ3NRWkFKSGF0eThyVjdjTUdDVEJtSWFENG9pcmM1?=
 =?utf-8?B?bjNvZmVBcXFqdS9EcjVvcjU4ODZRNGs5MHA5Mm5KNkhyckpoSU8rcDNsVFVl?=
 =?utf-8?B?UlFhMmI3TEhsdStBQytIKzkzMXd2MGRSdW4zNngvM2g5bHRZRUd3eXFmZHFk?=
 =?utf-8?B?V2dGRWlxVmE5R3l1Q3U2UFVRTXpqVHlGQXhLMG9tdXRlRjE4bzdDd2lSVnBB?=
 =?utf-8?B?TWxZaUQySXdnek9FUTF3b0VnSnIyYnlTOFVPMktqb2dpSHZuak05bXhVSHJ2?=
 =?utf-8?B?YmdHV2Y3ZEJzK3RZOWtVREd5cTQ4TWEzTHNyZTNqRlgzWjY5ZUVaVHl6Y1BK?=
 =?utf-8?B?RXpkdTI1anFHa2pvcllTWTdYUE1lWjhTMHlBNjhTUlphRWJKN2xHaEhmTzBa?=
 =?utf-8?B?amJQZExVa3BNS0ZvTkxwME9zUTBlaEk3MDBMNkJPblJ2bXZtc1o1MkJpTHQ0?=
 =?utf-8?B?cWt2OUI2eXZUSVhjTFkvRG5TT0syQzlZcWcvcmhUVm1wNE1adE5FVkRjTWFt?=
 =?utf-8?B?TDI3MzkrUGY0anZGNmJlWGVhQXJCS0h6elorbjlMeSs3K1lSNXMwb3Q5YVhY?=
 =?utf-8?B?RFRSRWh6REY4cmJDZGhnM2JXRCtKTkE4VEtlcnZyNFdKeTAxQXdZRm80RFJE?=
 =?utf-8?B?d1VxZ2Z4SklqR2hVclR3dEhLZk1iR0kyQmRzZEczaUVOS0ZIYVQ1NEd0SUU0?=
 =?utf-8?B?dFE5VW9tMEhFSTZzNWhGNDRhSWhxSEhIcDFZaVdSMGZDdTRRSlcrMFVTcjRC?=
 =?utf-8?B?OEx1S1lOUm1DTVZYMjdmQzBMb0tyMnpzTnVQbWRKMktBZDFxcFNYKytGQ0do?=
 =?utf-8?B?WTIxbWpSK09HdFd1MlNEb1RGODhqdDZ2NFVBQjkvdS9yRmdBb2pNOVFZMG10?=
 =?utf-8?B?Q1ZKNWJZNlVMTk9zZU9Hd0swcFNhWFRzNUUzL3FPZ3JQR2lmM2tHRllyQmFa?=
 =?utf-8?B?MEVvSkR6cUdnL2s1YjVTcC9lcm1sWjlOck9YREFUNFRzWDgrQi9Yc1g2N3VD?=
 =?utf-8?B?NTg3MytzSEc0RjNDRlRyMkVTOWxrTitHbFprdDlVT1hVQjc1K2l3SUoweWZL?=
 =?utf-8?B?czhlVE0rUGVFWGxya3ZxQ2pZTXlFeWwwdEJIMEtWTlFFcnZITHpCRGVvSldX?=
 =?utf-8?B?M2Z1TERnQVA4aFFJVTZoL082RWJZZkpzQ09Oamc3eWN1MDJNUmJ0TWQwK1lQ?=
 =?utf-8?B?Z3NyamJsYk1GMm5uZFcxQU5nZ3E0WWo0aUo5elplZzN5NVVhZlZLR2pYVzdt?=
 =?utf-8?B?Ukp4dVJEUEhZY1F6WEl5VFcybk54ZU12cVYvbndFNGFhVlZTYkpEbkJUcXN2?=
 =?utf-8?B?VG5OU3ltQXk1OGNEaDcvOGkxVDV5aHFGMDZWdXlKZ25nN3MrMW16RzkrREpF?=
 =?utf-8?B?ZE80WnAwaEo1dGlxVnI2eTJhQTl4S21kOE0yK21WeFQ2Vkk0bXpTbHdQMmVv?=
 =?utf-8?B?ZTZGUWJKY1hkQkM4Y29USkQ3NTRrRlBqTDFkWVZCMHN0ckNkSGRPUDk0UHBq?=
 =?utf-8?B?b2lmZ3FITDV1MlZNR2hydHB2b1F4M0hQVjJNdUpnZk8wREdObVlmb2ZmR1dl?=
 =?utf-8?B?OU5BQ1c1cHQ4Ni9QU0I4VjZ1QXBNa0NoQlI1ajlYOEJEb21JVGpTNStCdXJn?=
 =?utf-8?B?WWErSmZiRlhhNVFZODBYVy9xcFZqdndaR2pCa2VMc0x2V3F2TVQ4ZmNHaXN3?=
 =?utf-8?B?VWIvRStocS84TFpLUUxlUEVWakFMRGlQNSs5ZW1wV0tyRjEzcDhWSTA4K0hi?=
 =?utf-8?B?SDNKOEhzVEJmUis4eVVGV3pySi9ZQWUxb2tWQTQrZERhN0d5Z1IyU3FCM2ly?=
 =?utf-8?B?RlVnMUJSa0RSSjl0UFFRaHcrUnQyOHVNc01JdWlVbkx5NllZSmpzNWlRTG0r?=
 =?utf-8?B?TEVIbHdEWGkvbHg5eHZTajFJMnZyRVpzdnM5SHA3aENvSnM4TXczYi9RN1NW?=
 =?utf-8?Q?nF0HULUOMdqIt2dXZCLKzbs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c4cc48-c2be-4814-ec1c-08d9e7b8c2bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:31:37.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e07w+2F5SjmSfaloMw2SuJMmv3oFI3FPvZw7XQrMEJFQ9wH94mXbQxqsiQDJUn5Jzk/bmSqhKIs6YvCQ5BiQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2729

On 03.02.2022 19:10, Andrew Cooper wrote:
> It was Xen 4.14 where CPUID data was added to the migration stream, and 4.13
> that we need to worry about with regards to compatibility.  Xen 4.12 isn't
> relevant.
> 
> Expand and correct the commentary.
> 
> Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore")

But doesn't this commit amend 685e922d6f30 ("tools/libxc: Rework
xc_cpuid_apply_policy() to use {get,set}_cpu_policy()"), which is
where DEF_MAX_* disappeared? That was a 4.13 change, and iirc that
was also why the commit above moved the 4.13/4.14 boundary related
comment from outside of the if() to inside it.

While looking at this, wasn't Roger's change incomplete, in that
for Intel the extended leaf upper bound was 0x80000008 in 4.12?

Jan


