Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2C5392BA
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339655.564537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2KA-0006Nd-56; Tue, 31 May 2022 13:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339655.564537; Tue, 31 May 2022 13:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2KA-0006KC-14; Tue, 31 May 2022 13:54:18 +0000
Received: by outflank-mailman (input) for mailman id 339655;
 Tue, 31 May 2022 13:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw2K8-0006K4-4B
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:54:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2823d663-e0e9-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 15:54:15 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-xL8jQEicOPu0w72fvyHefQ-1; Tue, 31 May 2022 15:54:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 13:54:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 13:54:05 +0000
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
X-Inumbo-ID: 2823d663-e0e9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654005254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Us5R4VsO1R4Ot8DRk2rKDbDqbN8gvDQoF4WJJAeZrWA=;
	b=H2wxZvRhLiW+v8QA3jAWeWjSms+PiWGFeu+6l1nxNfvisEGlP/Cc5ZUBnohUNRGvv2HgT8
	rt6KLl6EfNLRW8z8Z7sCTObhD9mySOSbwg1AOZBZQDFU92UPk9bHaSbAeOHtKQZM1JaWA1
	YPYqs9Yp3JIG9NjgkGce0Fxk7YYElAQ=
X-MC-Unique: xL8jQEicOPu0w72fvyHefQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuWKW6+pzoffZIN0+31ni16SLulr/sQWor5Feo9FerRzxKNhxvqqxhq54FzQbjk/3EezL3BGagnkqvrETHwFHI8yqbJ66LtAF231RWJLGfTd61xBbP46Av13rLkinSuC2u6mDynvIJ1ZcW9dSYqC0SbbbxjnvhdQR3hIgGCvYI1bldCksQPn2l+dQBOhE5Yg7z2hA+PBvX7+CS4DuW+xXDeB3wyHGW8/u/HgWhzfzw9BXh/FyAbU1g7e0QVIYDn2SXGnNhWJKAa1FFyvsEFiKjMg0vLycMATVHflK499Aicw/iP4L62Tb+u1f8uyxjjYhwl97ypwBfVN4KdgWu6Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMOZ9lOX2mNrBi6/JYl8p98MUBZnHa260B069jDXq6c=;
 b=d6iHhS88LRaEAb7b/L0K6q1rU5UA90R127M4l0MFRxYoQvXqTtt5HBCAryqWJBcnotU6EiNt7zirEMAgtEOw4JZjhuhS4ESJ7/ucdGmyYey/GPaBudmYWM6P8swYQb3+A12kvTKFkWIGqMD494T7DHTl+Ou46PDpLAt4chS6bQYBpk4xbIred7H3KLkClnXQflto7Nk8+4FYLKltT5d8G9+/AWe0Kv9CMGOwNSuXTpQsD7fYSFtcjpGvFgX2q5r/2WllSkXnNKnw3R5IVqCJkn6iMjDFcJTYkNaLMZpgJWdruCpRh9vp2k+pi3E5cnKmik9S52XXmbVpgjTciBNZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02cd3ff9-85d6-61f8-6e46-7f0240c1cf7b@suse.com>
Date: Tue, 31 May 2022 15:54:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
 <YpYdqglsWIlsFsaB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpYdqglsWIlsFsaB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0047.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 644b16af-8704-41d7-fe10-08da430d06e4
X-MS-TrafficTypeDiagnostic: AS8PR04MB7575:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB757576F8D066C9C868130430B3DC9@AS8PR04MB7575.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rH/jlxB22Yr4LwX5+IW7wKKxPoBH5Xevbrfo87PWr5jHHxDro/OlpuJSGZUjp7COlwGlIOpbnXLJ/Z6kWt5nkwvr6THg0QLhnFzWM/oODMlUW2w2QeOgtENTYDEWBbxhMPpWrSqemJn0NpS9FJg0M5ITbzywuk7hwyGCCuxLxbrCIJB/ZYQd5yxA+NDpMQf+Vyi/yAED/AHc2z7hJET3imVhGtswgcpJ0zpbSS5Xuo98eO0BvhJj2R78gTJf2iSzk0JuyKF+oIDzL4eoS8swH/c104GfYdeMESg1viYmvS1cKQFAtXGOSEjY/lnP7e9cYqYkGBYU6PR72qm4GMY5GxX6ge0UFhGOiTEM+7ZJLUAkvqhHPek6PVLBTLkJtGreBO2432Kb7a+0SO1zqiWqE4qZ3ZYLmPpcOzlZixI/HFNDeJw4VZcvc57s6KpV32cdlmCoJG14lewb1ryIT2ISThUvnMKd2cafmNWXX3l7WbEYULfg/RWUvQ+ySRUeWZTX/mDLkz4J+2EQBJHhZynTVkOSHP7pKCfrOCjpmM/AkaYntlzNNg3BVXQTAv5+IzJcBuE6kBofniSISPOeMDd0UzwpZEv6jYGWAj0CSyfo8UqVSxAGRbhFI4JMCzZLqjAkV8M1e7Fv798jY8S0/GQyHq9awpa184HE4fKJLoPnX7vjll0KJqPS1bNrcwVYtqrYbSo5YmN/BTX3dAAU5qPUt7HrYqM0NZiolLvosFSJhodxjXD8YBwuihTVMFR19GtN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(66556008)(66946007)(8676002)(4326008)(26005)(86362001)(66476007)(6512007)(53546011)(110136005)(31696002)(54906003)(6486002)(316002)(508600001)(38100700002)(2616005)(186003)(83380400001)(36756003)(8936002)(31686004)(5660300002)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5JWX7GkqcKEHVICP3MncdxFQQ4A907waFKiARt5bG5CMTgoHj2cOh1XXwcm5?=
 =?us-ascii?Q?8tPt23HQo3rynjhv9arQzq8t/+3darGyuHUT2cDUBZ9Yzs+rVMYw2SlCGM4I?=
 =?us-ascii?Q?j6vjOKY8z1i4nSeTl4hRDzj4OGqTKqNpMSq8XeDTjWbkWz8bvJdGbfHYynyc?=
 =?us-ascii?Q?hkjJPeSx299Bhm8zbntBAEMVnuTX5Dl98h98clzny0EWYWrnpRWiOXwG44Cs?=
 =?us-ascii?Q?H41K9TCvnuJ+6+9ENMC2YvHSKq5fM7RwurrKqWMmfo/anAnUbtTbFvAZdgpe?=
 =?us-ascii?Q?bJBXd8SzzfpfWZUi/knl7sDEGB9c5H7pGxD2hQsNSZIhg1KO3hnQ7thJ4Vua?=
 =?us-ascii?Q?mdnplzFjlemlXh6DQgAVJpdTMc68OiE7OBLl+ITlbfEXnUd082Oy5DmoRNBR?=
 =?us-ascii?Q?XbUd/lPF3PcdW7njYcCq6wsKkkzvnw4iwYWK9OG1oY5EG5kLSAFH2lA8YnM0?=
 =?us-ascii?Q?8HKCKDpY/lYXCGtXjRP906kYwHI9j/3VNtgEb8VqWpefZaBtQHQ8R0NLV8st?=
 =?us-ascii?Q?9NK/OIL/CJTMJP9+KAcR49m/1XFRLSeCdV/vatUvLhVelEF/N8XqzHRuC4EK?=
 =?us-ascii?Q?i1n/pxOb136qIvyiOPmXrcDOk+kEZvXkdl3FDFrYJEqHO/juVxeucBKNhLcV?=
 =?us-ascii?Q?2CRX/eHgtXX38r/NE2wz3z2VZNU+UGVPnAPfIcN/w+hTdpE/7FOwDobQz0Ui?=
 =?us-ascii?Q?+v9QDlAou04F7rVF4Shz3tcfr3k19b9yEljKZr8MLrzd6Mjak9nFG6lRd8HO?=
 =?us-ascii?Q?7JhDVSW7eK5Ot4WErAJiEMTzUbDe/xEMHwKZXUZ4MtAeW8cNX1IeLL35LJqz?=
 =?us-ascii?Q?KZZ8ybaxc9O18okSsVbmMee1ZUlQfx+qzdJRu/y3tNCNpjrgq8tAW4vMnzpq?=
 =?us-ascii?Q?qqUVrk63qcN/ZjaUcZ+6uaG87AUKPCMorT+B4p4udvSEfwlh+CiCrlPIZDUS?=
 =?us-ascii?Q?9NJbT9blzvW+qWGaht9WkDlVK5SxdetZ3HcCs3oB9lzj+mlW5/bw4YH1RcYa?=
 =?us-ascii?Q?WquMbmS1+wwuMXM5QbM1J/2Ii7Af5g+0LtVMSDJvOA9hXVcMBUOwdSEikPO/?=
 =?us-ascii?Q?Q7rAZ8PkVEp53ouEn/wgK+/O5X1cdewCpK7GzgaQ91Tzx7bwlRZNsNeRKjTI?=
 =?us-ascii?Q?JuDpAwyU/Woqn/btE1gUFwzBjSasYtr+bDqL1J6H8F19tsLx5B3MPuE7Pc52?=
 =?us-ascii?Q?ccP00xVjaXEnhBA1F0i1ecr1MA8RUcafdsQ5GDUM28WKwKaMyGr4HxuBcSWh?=
 =?us-ascii?Q?ml/LNBUdeZ4cQBcf6PEdt9Td4eTZ90lqzHn1IarEbMsqvAxFktpuDKMVXkOT?=
 =?us-ascii?Q?ympEBs0CpQANAH64jEQZRZLkMK/6M05S6NQ95oyHhtwpmDpc+axme7S86NXl?=
 =?us-ascii?Q?cqSqY9eCNvGxIfqlABkEAaJtGdYUNjQodlQkHAYfwWRDw3pIm1QfCicuVVBd?=
 =?us-ascii?Q?GT8JdQ3ZYHUcBe8JD1xZ30Aax5ZYfa2KVRA2HUVBYxMH6GRoR4YKuFb9U/0t?=
 =?us-ascii?Q?Jfg/LPf2JJBo44qTVwEdMj7rOAzWFYgEWVLAra29dcEYyZl7rsQZqvvUqVtt?=
 =?us-ascii?Q?wJ8rzivoEBwmlwGGbtT7fi0qb0mCcQHux0nusfKDka7F+kKxRyfpQm9TaeLQ?=
 =?us-ascii?Q?kSRDrZeFRrdGyBSgB8w+7S0oSUNsKh1GgQmfyfVYG4OktNom2edojskPxIEj?=
 =?us-ascii?Q?tebu0KTXQVUNX2RS4sr53yua/EfQcUjfzVviZ++5YDoYq1jZ/4O+IdzN3LHh?=
 =?us-ascii?Q?Fjk5mFPecg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644b16af-8704-41d7-fe10-08da430d06e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 13:54:05.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO1P0MxWcgg6Ca9cyi2lX67muqNZkIKgURzj/kcytQkECtl4pCAU5P0obYBrQSCGAwb1waeBchOjpLwcQ4Xo1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On 31.05.2022 15:52, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 31, 2022 at 06:45:52AM -0400, Daniel P. Smith wrote:
>> On 5/31/22 05:07, Bertrand Marquis wrote:
>>> Hi Daniel,
>>
>> Greetings Bertrand.
>>
>>>> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.co=
m> wrote:
>>>>
>>>> For x86 the number of allowable multiboot modules varies between the d=
ifferent
>>>> entry points, non-efi boot, pvh boot, and efi boot. In the case of bot=
h Arm and
>>>> x86 this value is fixed to values based on generalized assumptions. Wi=
th
>>>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results i=
n large
>>>> allocations compiled into the hypervisor that will go unused by many u=
se cases.
>>>>
>>>> This commit introduces a Kconfig variable that is set with sane defaul=
ts based
>>>> on configuration selection. This variable is in turned used as the arr=
ay size
>>>> for the cases where a static allocated array of boot modules is declar=
ed.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>> xen/arch/Kconfig                  | 12 ++++++++++++
>>>> xen/arch/arm/include/asm/setup.h  |  5 +++--
>>>> xen/arch/x86/efi/efi-boot.h       |  2 +-
>>>> xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
>>>> xen/arch/x86/setup.c              |  4 ++--
>>>> 5 files changed, 19 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>>> index f16eb0df43..57b14e22c9 100644
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>>> 	  For CPU cores which support Simultaneous Multi-Threading or similar
>>>> 	  technologies, this the number of logical threads which Xen will
>>>> 	  support.
>>>> +
>>>> +config NR_BOOTMODS
>>>> +	int "Maximum number of boot modules that a loader can pass"
>>>> +	range 1 64
>>>> +	default "8" if X86
>>>> +	default "32" if ARM
>>>> +	help
>>>> +	  Controls the build-time size of various arrays allocated for
>>>> +	  parsing the boot modules passed by a loader when starting Xen.
>>>> +
>>>> +	  This is of particular interest when using Xen's hypervisor domain
>>>> +	  capabilities such as dom0less.
>>>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/a=
sm/setup.h
>>>> index 2bb01ecfa8..312a3e4209 100644
>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>> @@ -10,7 +10,8 @@
>>>>
>>>> #define NR_MEM_BANKS 256
>>>>
>>>> -#define MAX_MODULES 32 /* Current maximum useful modules */
>>>> +/* Current maximum useful modules */
>>>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>>>
>>>> typedef enum {
>>>>     BOOTMOD_XEN,
>>>> @@ -38,7 +39,7 @@ struct meminfo {
>>>>  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes=
.
>>>>  * The purpose of the domU flag is to avoid getting confused in
>>>>  * kernel_probe, where we try to guess which is the dom0 kernel and
>>>> - * initrd to be compatible with all versions of the multiboot spec.=20
>>>> + * initrd to be compatible with all versions of the multiboot spec.
>>>
>>> This seems to be a spurious change.
>>
>> I have been trying to clean up trailing white space when I see it
>> nearby. I can drop this one if that is desired.
>=20
> IMO it's best if such white space removal is only done when already
> modifying the line, or else it makes it harder to track changes when
> using `git blame` for example (not likely in this case since it's a
> multi line comment).

+1

Jan


