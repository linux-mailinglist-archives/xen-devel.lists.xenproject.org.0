Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B1194508
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:06:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHVuu-0007wB-6I; Thu, 26 Mar 2020 17:03:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tNKh=5L=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jHVur-0007vy-VA
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:03:37 +0000
X-Inumbo-ID: ba9a1ffc-6f83-11ea-8820-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba9a1ffc-6f83-11ea-8820-12813bfff9fa;
 Thu, 26 Mar 2020 17:03:35 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 26 Mar 2020 17:02:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 26 Mar 2020 16:55:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 26 Mar 2020 16:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWoy7LA7nVQ+Qrh+WhrkkkTQI1gdO5JX4d1hDUW2mfQTg7EExpdY8AVV/l+hLQklOq/4O03nOPhyo0+34PTT0qCMmIGUyIjuD8JUky3B/0GlMCc5nH5KvEE8Zyd7Rs/npsj2Hus1knl8c/N+pmadyLF1gDQmVD/aa5WCp0Z7tum/OY0CBfuP7STm6xOqGDbX4LS7G7gdKGoayV70jXhXnIjU641vninGwg+ZIXycG4+m/oeQKN77uP73ZjFU2FrqUCymiWBlfrLaNVVNBoP3hpK2XWN6Z4GGvrlJF2X0DncsHV2Z5aPOCwVZvP16Y9OnItSGGfXE0bfRmyrNcZkFoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySCbFiJD3Ir5r8VAj6JmRO4mZAAlzbOlH14SOa1Fj9g=;
 b=BPrOhKgaKy+ON5Xr0Lbfh3e35dsGovcjpoH95veW+/ezdbClf+EyokvNMJzQZ74CBfHxVlwzOMAjOmQD9vWnTOQPvMYIwB0WqpadmVgS7B6HnfkJAmjyZ7Ckv4pOEmqM7CrQ4jzuryjP/sJSxZEYVTtgdEV3EKsQxvCqCq89C72QgNGZzLaGqf1g7JPRI79SQK/yo4f6uLYmmOMc/vVWzOA8e/mkFlM7WwDHcD6Wa3Jn8MIsyvVlHTsQOuF+qWt7MzY1CYbZ60VUqqwot23gWJEmCmBsoas09pVXG7KP5CGHy23d6Se2KRNoBv4K+owAT+LcbP4NfRDpFj+ziRJHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (2603:10b6:a03:196::12)
 by BY5PR18MB3186.namprd18.prod.outlook.com (2603:10b6:a03:1af::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Thu, 26 Mar
 2020 16:55:56 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::6157:7c41:b13d:23f5]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::6157:7c41:b13d:23f5%3]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 16:55:56 +0000
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
 <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
 <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
 <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <547e509f-93ba-2bbf-f12d-21b9443e12e4@suse.com>
Date: Thu, 26 Mar 2020 10:55:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:805:66::45) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.4] (75.169.23.17) by
 SN6PR08CA0032.namprd08.prod.outlook.com (2603:10b6:805:66::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20 via Frontend Transport; Thu, 26 Mar 2020 16:55:55 +0000
X-Originating-IP: [75.169.23.17]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e75f39-6d16-445e-f7bb-08d7d1a68d54
X-MS-TrafficTypeDiagnostic: BY5PR18MB3186:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR18MB31865CEBDF5A64518DCFF5B5C6CF0@BY5PR18MB3186.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(316002)(81166006)(81156014)(6486002)(6666004)(107886003)(86362001)(186003)(16526019)(478600001)(26005)(956004)(2616005)(8676002)(8936002)(31696002)(2906002)(110136005)(54906003)(66946007)(52116002)(53546011)(36756003)(31686004)(66476007)(4326008)(5660300002)(66556008)(16576012);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3186;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lil2lLZp55ctmZrh7sSgLSTTUSa8BWxuOq+UCzVlC9FgFjJtOSopPOBaMQsaRmLfk61rpmOPodfrAWGLChEp0+8uaJ4+aNqjSlqueAIzWw1fcqpnqhQ8mNqU9pmge2tHDx6HezzvCbSqVWDJ2F7x9oH2RwDrqeboyEVuCQMwPJpaJ1V0Cg9/a6jFbk11TBdvKph0cIiYtmSw4+9ukOTQyj34daocAlOE2kWJLZdvAfft4KlI2LW4+HLSRAZSSngbE/Bt3K6d2Y+zFfyJbUcBZsi8fi414384QUhBZWQyoJI/E7SC4RcRTzwXqbYAzN/IR9PLVLkjxFYkNYHzFeBk/HWYH+M3L4BnpT2qCt3d2EGGf0bCYineUZ0x7ALJmyEewP5n4O3DXpwqb0Qi2DBp8nNSAsOZsYYW09a2rc+9xVCw812reLKQkAoYt/oUUFa
X-MS-Exchange-AntiSpam-MessageData: vMMT3wphThl5DGMLY4XpX9qf4a5yauZMjkfoBhbAGLufy8x+ShqlTa9hG7coXhIulkoMtTX/Zh38HtheO/AjdSJikgHMXLksIIfcQrfjkOcJ4e0qsE9s4/UwcxJx66N4i7xvd9S/mxAqmeV7iBRWXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e75f39-6d16-445e-f7bb-08d7d1a68d54
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 16:55:56.4545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cBN19k4PGuQuGZ4hB1G0f78EypgNQaby7jbVNp15dfFTup4pYZdoX6hLLsQnbVIBCpT0Bglfn7fWxp4fWumKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3186
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hongyan Xia <hx242@xen.org>, Charles Arnold <CARNOLD@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 3/25/20 1:11 AM, Jan Beulich wrote:
> On 24.03.2020 19:39, Julien Grall wrote:
>> On 24/03/2020 16:13, Jan Beulich wrote:
>>> On 24.03.2020 16:21, Hongyan Xia wrote:
>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>> In contrast,
>>>> after dropping that commit, parallel domain destructions will just fail
>>>> to take the domctl lock, creating a hypercall continuation and backing
>>>> off immediately, allowing the thread that holds the lock to destroy a
>>>> domain much more quickly and allowing backed-off threads to process
>>>> events and irqs.
>>>>
>>>> On a 144-core server with 4TiB of memory, destroying 32 guests (each
>>>> with 4 vcpus and 122GiB memory) simultaneously takes:
>>>>
>>>> before the revert: 29 minutes
>>>> after the revert: 6 minutes
>>>
>>> This wants comparing against numbers demonstrating the bad effects of
>>> the global domctl lock. Iirc they were quite a bit higher than 6 min,
>>> perhaps depending on guest properties.
>>
>> Your original commit message doesn't contain any clue in which
>> cases the domctl lock was an issue. So please provide information
>> on the setups you think it will make it worse.
> 
> I did never observe the issue myself - let's see whether one of the SUSE
> people possibly involved in this back then recall (or have further
> pointers; Jim, Charles?), or whether any of the (partly former) Citrix
> folks do. My vague recollection is that the issue was the tool stack as
> a whole stalling for far too long in particular when destroying very
> large guests.

I too only have a vague memory of the issue but do recall shutting down large 
guests (e.g. 500GB) taking a long time and blocking other toolstack operations. 
I haven't checked on the behavior in quite some time though.

> One important aspect not discussed in the commit message
> at all is that holding the domctl lock block basically _all_ tool stack
> operations (including e.g. creation of new guests), whereas the new
> issue attempted to be addressed is limited to just domain cleanup.

I more vaguely recall shutting down the host taking a *long* time when dom0 had 
large amounts of memory, e.g. when it had all host memory (no dom0_mem= setting 
and autoballooning enabled).

Regards,
Jim

