Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16D2F770A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67928.121447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mj3-0001RS-1d; Fri, 15 Jan 2021 10:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67928.121447; Fri, 15 Jan 2021 10:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mj2-0001R3-Uj; Fri, 15 Jan 2021 10:53:04 +0000
Received: by outflank-mailman (input) for mailman id 67928;
 Fri, 15 Jan 2021 10:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0Mj1-0001Qy-C4
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:53:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16e0afda-8bde-4de6-9fc3-221894692da1;
 Fri, 15 Jan 2021 10:53:00 +0000 (UTC)
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
X-Inumbo-ID: 16e0afda-8bde-4de6-9fc3-221894692da1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610707980;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zY/GqfNG2I2hPdM2my0XD3TBZ28zCGTYnsW3rafgSN8=;
  b=hxLoEpP3rTwOfwLSlp7ebx/DOtYC3c3ei8G6XSmzR5ZvB1eL8906vGWx
   w9abUfdZ9d9oFJ6SD7Bygk5tGeyXwQiVwWdYKZEpZTByxsAjgtu1xwTWb
   R8TPW59D2cEW3wt+qUkpmAuYpyDVbnytdAEqd6AJzN6781QEreah6YXx9
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NPT4U1x252RmYok7lNJvLwi3B9PaMI1srZ3MOjkN0XWdFLyt5POKho1LCMBcg+HlW2ispbkCco
 qFCOZfwY1CBJrj5co7/bfyMjj90RYJnVpLprIBv3bEb5qPrGpWFPgeSmVfLuI3uPwNlvscyxRY
 +sGhtOS6XRcsStTYoyKs8tIV7KQSV4Fz0i+ryPkMT7TKD9WSagjqpAuUuMaAe34hwaYYAPlzto
 GlWZX5tPjxjfae3rrJzYhejOukFXe5XX3Kgpm+SQ1eWKDJadQo/pGIXYr7+wcDL9udWXRtLFJg
 K24=
X-SBRS: 5.2
X-MesageID: 35152590
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35152590"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+MXR9fYbbX5Q44MH2b/vyzOtSD8pSeQfR1ryiZJW4RVo2CKlbNJVPmgU2vCh1a3t6UGZ7f/mypP924n614l1JPWl7sI7HdvIP2RJ0lNltxp0vqGOplzCYeJ4m8y96hwE3ic16RbqeQ7OkPkswuvOat0uTzCUwSgutIP60z5VTCAuzvtgw0R5v+xl2+h8s++sLVC8XvnK2VJP9DHLPNQI23PG8qWZUKV16Bobqa+bdsaswiu/KISFywhcAjWcKUsPKPNGY7PyZK7HQV/+oCZZ0H57iI2ZLfWC0goON8RZwjX52T+Sa4zxrC86ChKeyWVkyakLC+axfmCQftTv0SIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY/GqfNG2I2hPdM2my0XD3TBZ28zCGTYnsW3rafgSN8=;
 b=R0PipgVt2djHW+YgKWXtN4S2s+4tL7kBtssjZvwxjU89Jy4hUR4ka4NePynkmZtynVbMrayEYVC8buw3Mb6+mTYRtCxRu5qhCaggdlNgKJP5kMea40IItbC6keR5vtyJAedfF4c/2cYsR1hyOlTYseKRv3T55N/u2gFJPcxLeg6aglzJMSa2JaG0xIwLO77p5vjnQ6ZsPTF8sYQ0LHwKq8EqrDR4AJG5gvpRNukr6sIW8OtPCDuc2kLZ8TvMuZKNIS0til2J3okI94Hc3s1wZFfFDaLrhguAZvzuDmgydrqZM5DoO5UEx/51sY0ql8mIPePtAaUfGabqsdAMctHWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY/GqfNG2I2hPdM2my0XD3TBZ28zCGTYnsW3rafgSN8=;
 b=oLdmrKjne0qYnzNayvxNvm3rNNFCugCT1PivPuBHCPkfbvagS7JoB2iKNs7W4CWixkNvVgLaW9omLK+IFon8RKHjtjgA/f4bRLttfa91t7p42vc8YYuCeXE6YpURbM717nfgi6XV9qbHyzfXYliP+I8VgaZ7x0LlM+59BTndb7s=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, <committers@xenproject.org>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
 <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <79f5fd23-debb-701a-1aec-30144af1a896@citrix.com>
Date: Fri, 15 Jan 2021 10:52:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f73660d0-e19f-4896-e47a-08d8b943b73a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4664:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4664EE1C8FD44F7AFEB56C27BAA70@BYAPR03MB4664.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXzsxxgm7xfdoj5N7a2R6CjM+E/O2licRmIu6F0mEwzXMEYj9nPGwcchloMPtYEMY3d2Cbho6Z3kdxXaVC/9FOVKHUh+bYMEJuPWPACRYgw4xAJczIWMpzm4eVSxrUR8GJNGOsCEt0qH16RHzRaP+NphNrM+7DYKij7dvKrYoU6zWElA9zB+qmvFrkqlFIhJ//N5VzRKtv2hHM4o4XNoxn/2M7ZIkpVW7O4Rbys9MEo0o01zrtmJzcK3ywxvuHR4jvI8E6lWETcTdf7sOAHuWJXdsUiH0wDEIQeDzCoDPN5cDDvq2hjL02pUAEd51m4BgoOlxt/JIpq57MmeztVczLaCY/HU0b4jz5LBIno/HMSkV3dcUlgFYSHpdUACLiFdKuHRBjXt/Sc6bpDl1LHmSz/OU9MfzVn8JaJbMElKRDf8wdGImk/VfJd5YRovO8FyfSBWG3RgjkutniiaBv+cIrX1YG7ryPT+wnTESKchDWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(86362001)(186003)(16576012)(110136005)(956004)(31696002)(316002)(2906002)(2616005)(4326008)(16526019)(6486002)(36756003)(54906003)(53546011)(8936002)(478600001)(66556008)(66946007)(6666004)(83380400001)(66476007)(5660300002)(26005)(31686004)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjQ5NTVLL1FZNmJod25yTHNlTjV1bUFiYi91czNKb202YWVudDFjbi84VWZL?=
 =?utf-8?B?bWd5eGRYSnU1UnhBY3M4THlHZ2JRbWYxb2xwU1NRdEY2L3NXd2MzZTB5YlBM?=
 =?utf-8?B?TmhsdVhsMGxNY2ZvRFlsMjRnOW1VTk1UZEhOWFI1ZFRTbldzWjByajl0cmQy?=
 =?utf-8?B?eFo2Q0UwNWE5cjA1TTNGRjczVVN4dHBwanZaQTJNWkpucTRlQzFFYTRDb3Vn?=
 =?utf-8?B?VWhSSmt0V3ZrWmEvWUZzMmdwYXJtcWRhRExXcHhNU3RlNXowcWVBSXlNOEFo?=
 =?utf-8?B?M0ZadmF3bFpYNnIrT3FGQnZvcUh2dzZHRWxnUnpNQWh0bXA0REwvbXdCaWNy?=
 =?utf-8?B?d2tUc2tEczNYUlFyS2VweCs3UnM0azkremhPbjRqQU9MU1pGYmc3NzkxMFFt?=
 =?utf-8?B?Y2RoVmt5c2JVZ09oVFVaSGlUcnRoYXNXMWdvb2lhci8yVXVHQzlzSkJrd3RU?=
 =?utf-8?B?SXZmWFJlTkxoK0hLVjNQTFV4SDNWTkNPN1lUZDVGYkZ1cmVOWlRlcVNiSUVO?=
 =?utf-8?B?R2JTVXhOZzBheUROcXhEejBKV0dKU2VHajQ1TUZPQ0l0WjZKTDA5OTJBNDFx?=
 =?utf-8?B?dWtnV0FwY2ZFS3NqNEw3SmRtTDl1Yno3NHJwWmZuTWgyN0xTbWxHUW5FSUtZ?=
 =?utf-8?B?NEZFc1lxOTRqMTY4THg0c002SUEyTDZLSjFjTTFzQytRa2lSQWJYNTNkUVJl?=
 =?utf-8?B?RmYrZVlNRzBBVWhDcWp4YzhsY0hyL1JBN3NJbkZBRllyaFE4THpVcHJtV3FB?=
 =?utf-8?B?ai82ZUlxTDBFaUFVTEkwRVI2M3Bwa2ptSnJYRTZlb1dVUlordWd1UWs2SGpY?=
 =?utf-8?B?ZW9SeUZXc3ZhOEFRNGJ1ZlIyZVV6TFdOcFg4cU9PUUk2bGdPUmx6TGc2VWZz?=
 =?utf-8?B?bW1mVzF2c1g4T0d0RlNVUTVZTnNZUVVaeDNmMnp5UFIzWVZidEJ3QmRpWW54?=
 =?utf-8?B?NDlqMG1lNDZ3VGdwY3BNWnYrZDRlWXBzckx3VmpxMm9rQTVxeU5abFFUY0dk?=
 =?utf-8?B?S09JeUM4eWIwVkxKTmw5SVUwRlU0MlF1dERWNmxEMHdIUHBFTVQ3bStraCta?=
 =?utf-8?B?VGpoNXpSaWdUV2VrVUhhL0VVQlZGT1VDYTkxc3ptTk5qM3NEYkZqaldoWjNY?=
 =?utf-8?B?SUNCWjZid0tkR0ZmYmIvYVUrZ3ZsWVBkTUZTQXRwRVZEa09xM3Q4TzVUMUI1?=
 =?utf-8?B?K0YxdVRDbkRlVkt6cU1KRExMY2duSjRFaWpVTThlQnJpUzlFdTdiZFFybEJE?=
 =?utf-8?B?Vk81am8rN2t2aVFpVXltaTdXdXVGTnNVZ3lIZDRaNUMvVlRRenZUSFkyQTBz?=
 =?utf-8?Q?3BHNnCYkPjDbB6HDPswBOPZjStMWKikf5V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f73660d0-e19f-4896-e47a-08d8b943b73a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 10:52:56.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f36Ahz2qSTll2hICamUKcvEsnH9iK8mauD4HuW3Hus4YbS2tMcXIFZ2+9S4uqqskPvTjqzeYS6hbMPwwEQngnxSsaH9gVZT5Stbi+N+L79Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4664
X-OriginatorOrg: citrix.com

On 15/01/2021 09:57, Jan Beulich wrote:
> On 14.01.2021 20:02, Andrew Cooper wrote:
>> Bugs:
>>
>> 1) HPET/PIT issue on newer Intel systems.  This has had literally tens
>> of reports across the devel and users mailing lists, and prevents Xen
>> from booting at all on the past two generations of Intel laptop.  I've
>> finally got a repro and posted a fix to the list, but still in progress.
>>
>> 2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
>> working, and very little investigation on whats going on.  Suspicion is
>> that there might be two bugs, one with smt=0 on recent AMD hardware, and
>> one more general "some workloads cause negative credit" and might or
>> might not be specific to credit2 (debugging feedback differs - also
>> might be 3 underlying issue).
>>
>> All of these have had repeated bug reports.  I'd classify them as
>> blockers, given the impact they're having on people.
> 3) Fallout from MSR handling behavioral change.

Yes, sorry for forgetting.  I was literally working on it while writing
this email - no idea why I forgot it.

4) zstd support to unbreak Fedora.  (I'm deliberately putting this in
the bugs rather than feature cateogry).

~Andrew

