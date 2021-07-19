Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773553CD5A8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 15:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158433.291656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5TEG-00044U-QE; Mon, 19 Jul 2021 13:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158433.291656; Mon, 19 Jul 2021 13:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5TEG-00042X-N3; Mon, 19 Jul 2021 13:22:40 +0000
Received: by outflank-mailman (input) for mailman id 158433;
 Mon, 19 Jul 2021 13:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZur=ML=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m5TEE-00042P-Og
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 13:22:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6365e5ef-62f0-4a3a-b33f-3cae6f0b0890;
 Mon, 19 Jul 2021 13:22:37 +0000 (UTC)
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
X-Inumbo-ID: 6365e5ef-62f0-4a3a-b33f-3cae6f0b0890
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626700957;
  h=from:subject:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ur1ch8104mNgcxHmhQ/BwTuaEUIV/QgFAHygXvrKcVM=;
  b=gav4wJ3tsl7TK9Q5nUHhOJip35flmE2i9cw2eY4tVRaFhsuP2BoA8zlx
   hLjc2MSu9g38dSxgO22LuuQqTP7BOajFfB6cuaWoLjYTJ+sqrZ3MYEWS+
   Ui48u39BGqFMeg3zas5UlK2yW1nGzqrbzuo5OLPvpWALvjB9DeoQ3afBR
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9BDeqnaHHdxpkRcLogvMcgRo7u1Pk7tzWJJuDkjf1O5/UqE8MHTbKPReTXinQidn84xOz7SDj0
 SS3jmj1RH3IEqZRfzeDyY9hHU6oW5LCprOze26E6wyQpYWuyOCfUVvP3SW70YYochqbT6y1Bee
 siRkA7uirnV8WawdCy873f5e7002kdR7uJmUcd3myIMPn11AWFWAdvrvAlyhGZApZx6+IVHyzI
 6vyYeiPXvPQQ088k/NLNOQX6w3vrgFraOpx6Ds0yrWMI6CyBWUrkOFvEV+dCDbo+M08mZJtggF
 vrXbpoXo9GI/aYv/DgcH0MNK
X-SBRS: 5.1
X-MesageID: 50222726
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:V2zwiqtxgx4ycxOrCAhHh0ZZ7skC9oMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAs1D4ZjLfCVHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe3+m+yVNNXl77PECZf
 6hD6R81l2dkDgsH76G7i5vZZmzmzSHruOpXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6d60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKRQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpPyfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Xs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgs/DWVZAV1Iv66eDlFhiTMuAImxUyRjnFoh/D3p01wsK7UEPJ/lr
 z52s0CrsA9cicUBZgNTtvpD/HHUVAk7Hr3QSuvyG/cZdY60kT22tXKCYUOlZWXkaMzve0Pcb
 T6IR9lXD0JCg3T4fPn5uwCzvmKehTmYQjQ
X-IronPort-AV: E=Sophos;i="5.84,252,1620705600"; 
   d="scan'208";a="50222726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6ESgjnmLtPaTX7oXqq8OhyMqd+zO85SdiDYSBtv0MrBh+AxMQvO3R0Pso5dQtqvyfDP0RDXA4rxh9haWp8yl25+XUoTbmFbrQONdiyUk/p4bGEqMa1AuMHNh1gBnXT411bV9sdMQdvcdZhZzrUMP/L1hyo2PMJM4fdeWDlYy8BQqt1Ay73incld6GfC974NrkkIqWrH2qLhIV25YeoNrw1dDLemwtg4JTptEsqEDiXtY12xqePnfJg4jMfU1uaAKZ+2qFRQus5/oMQ/KfCRgLgZxv3Se9ZJtINdFky6UkL9GNHAQWXC9Ezr0RRl0H1XMdWUuMVuYc4Ra2KMlfW4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur1ch8104mNgcxHmhQ/BwTuaEUIV/QgFAHygXvrKcVM=;
 b=Y6tqRR7ZYXxlIAA75eZyPWANzggg40Ib/2FubZXVCUQyHeb8iugQvH9QB9l5+eXkCeiXYUApBu3FeIlqIVRCu43QsR4W1UN9gW/WtLEMDGQPUvFQ4mq8J3ihPSlLxUUsifoHCAfLSSx8r5H/0N87bZGZuliLq4ao5HJ2Sbx3wVlOqVpRiMB6kkLQVVS10V/1mZP11JPoFuvFUbn3pEAHkJpHVUpZnrIKB/Nus3zwOXOoqArl7QGHmmfkEYCVwoDLJmGgXDswfN3e85yBquu/kloODq6Rp6rsQUDHC/7nXZaxoUc2AofVwZblEyYcQH2s9jcXeV/3i4uDg1CYxCsyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur1ch8104mNgcxHmhQ/BwTuaEUIV/QgFAHygXvrKcVM=;
 b=jzdY9Gmrt46EfNQcqrC93hZ9Uiziyil9SUhW5QiMqYSpA/PNBUPQJ+3Kgi5Hf366xMzQPixHFYc85gZvEJaYnZEy3mkGi8vVGIm/ZUl4RCMuWJ2Bye3h/KRjE8natsxgH4o9O0xqCoCeofwOggFQWpz+Jkrs2EQGJfq//OI9X1U=
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Propagate real error information up through
 hvm_load()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210719111449.21337-1-andrew.cooper3@citrix.com>
 <2b12abb9-4fde-f21a-e763-38de14847e3b@suse.com>
Message-ID: <71070f6b-f13e-f761-57a5-c07852f2d13c@citrix.com>
Date: Mon, 19 Jul 2021 14:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <2b12abb9-4fde-f21a-e763-38de14847e3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fea5a0ff-5db6-45fc-c419-08d94ab840fd
X-MS-TrafficTypeDiagnostic: BYAPR03MB3944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB394419306DD46C90392CEC5DBAE19@BYAPR03MB3944.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDSHKu107q6Ltp09vAnAD2YXK1hkr3siUu8yJYsLzE1bHSQukz6+zH0e/E59D+jGBCxcgZgqnCe3IAjSsRetoMYG3aSqiejSuPIx86uNsKXIYL+RUgu8MLDjrTosSjv/hJtMaXY8qOIyDaZEcJhhrynf48IeUZum2riwI8mtVPvVVAGH8z5f8UrU7xI/CabLXjgAvie4ajKjGgOkp4U9JqgZCvLz2lQoI6Six1LclnvURoU0HQbzn7Y0/V320L1v1qPrwDG94MCfGYcLDstMg7k0dHua+UnRMfEJLEWuCX3LJHdqhC+fr94rVAb5NQ7+Hcrm5mSExkFy3xVGO3X4HN/WiTFOugReTyeWPYvEIPKYZaLp3L4fOI82fS3D0YwgzbFeVgH2HnZVF8/XtLjMog8Zfgdp4EOz7xGF2uB+wYNOUo7NyGDWp5gv/xuFOsPpqCtvqf8hDdeqY9XR7F1wDqRL/jbHxtisZODFg3bzSnzxfHDRWUNHGRMVhiErnTwyx+fuxa79tZ5RMKIxeE+B01nffHS5pEgMxSsyAjylDG7pVQY+A4qUwPOQryQoSYwj0cW7KeQoBMv821kwp76q98emkirdFWC5i45LJa4LvxIgyyg6Y70LDinlGLTSn4amB5EFH2c3L/tVR68YdQ3iFHjz8pytBXyznzyCvj3GmnNu4kKtVLjpqC9kwxFEY6r5q5qDBhgicphvJCC4X1DGdRoPDm0u6lOv5FkTK4349Cs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(2906002)(53546011)(6666004)(2616005)(26005)(4326008)(186003)(16576012)(316002)(956004)(38100700002)(83380400001)(86362001)(6486002)(31696002)(5660300002)(508600001)(6916009)(8936002)(36756003)(31686004)(66476007)(66556008)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFQVFBHdUdTTG9OSmNGWmlTajNpNzhTbjNnTGkyYWVBQzhzRWx4eGV4ZVpU?=
 =?utf-8?B?OVB2TVAxaU91OVRWQlROUGRESElpYkI4elNQZzhOSXp0clZKdTdIU2NvSmZC?=
 =?utf-8?B?dDVIN1hWOGVPU0d3bkFuV0JOOUdvdnl6cHlTc1hwM2EyT285QXE2a0szUS94?=
 =?utf-8?B?SnBFSFZMZG0yZGR4ZFJNTE5WZ0JuenVHaXBUaHJxbEk2UTk3VnB5RG5wV1hK?=
 =?utf-8?B?aTgzN3lqTk9XWjRlSVBwdTgyYTB1QitubW4zOFZIOWk0UWhzVXRtdEJpRU1t?=
 =?utf-8?B?c3Q1UUhkMUdwaEpDeEpyRm9MQ0VNU29SK1BGYmlVWm56aTNBdjdZMVhKUTk3?=
 =?utf-8?B?aUg0VXNkcW5LcjdBSDhieU9PRkVDYmN5OVRJRnF0UkJDTi8yeEwxL0dWbTNv?=
 =?utf-8?B?UXpoL28wU0E4R2dzQVY3NzY4WlJoc2x2Y1haajYwNDRiNTVPMXUzayt3d2F3?=
 =?utf-8?B?VXVuMVQ0clhGNTBVNGpDOFJLYUdZdGVWYzUrOU9BM3o5Ym9UZGNiRElxcXNR?=
 =?utf-8?B?RnZtV3lwRmd6TktoV1NZcXZRZmxQQmR4RjNpUms5Mkh4bEtyaklLZUpMVVpu?=
 =?utf-8?B?aGRMTzk5RldjUjJScUYxcUk2aUNlcDhJTDdrTDBvaXlXTm1DNDdiRVhRd1o5?=
 =?utf-8?B?QzJkOEkwRXRrUkNnZTBBY2hWSkJ6aEpmQXZEQ0RBTkU3SjZsVDNub3p5dXJi?=
 =?utf-8?B?Y0FUb3RjRTl6cmdyVElhMnduUk1GT0FtRk43RFdXMjJIWmtvUEUrMUd1SW01?=
 =?utf-8?B?ZlBvdzBSQ0N6UndUQ1hsMkVBaG0yWGE5NWtFeTU3enhUckphNHhaQm1BOUEv?=
 =?utf-8?B?MEtOOHVzdlZhU3JtSThxUmRJbTIzeTFHejl2MUN5Y2hwbml6clRnOEdGTmxa?=
 =?utf-8?B?S0t0YW9IUW54R3J0dEU4NUVtMXVPL29zZDFpeGJrYXZkQVhjRktoMDJEQWRq?=
 =?utf-8?B?TTU4elhLa0c5UWNqMHU2d25PSWhaejFYVmxHaFBxRzdXSlVHdmNHV0owZ0JR?=
 =?utf-8?B?bjdHMnB2NW9uVXpubUhMWm96cGZ2bmlVWUcwSUI5Y1FPQWZSb01HaGdscDI4?=
 =?utf-8?B?SGIvNjNpdmF0T0Rwa0NxWkNEZUNncU05WjRyc0V1c2g0N2VNZHZ1TVhPZ1J1?=
 =?utf-8?B?dXhUbGVjRlp1UmZ0bGc4UklxbVc0a1Y0NEY2MHRRaEgzUXU4R2doRGhxZ0Zx?=
 =?utf-8?B?aEFSYzl5M0FUenMrUjBSQmtPak9GMlpoNk9FU2hUR0h4ZWVVRVE5cHB4Vy80?=
 =?utf-8?B?bm9FYUxYemEyZDBQQUFXajNHVmczaEE3RXhuU09VekFpRkdkSnBveDA0eUIz?=
 =?utf-8?B?dHBQWlE2ZkNJb3prZjBsaU1peVJLalJkK2JmZnpwL0c0Vk5MenZNdklTT0pK?=
 =?utf-8?B?ajZmL25LQWZvb05MRjd1SktsRGJ5NFl6WkFXejI5bi9XWUpDU2dyTHdsTWpz?=
 =?utf-8?B?SDg3eWJHcHpMU1VrWkJod00zWnU3WUtBL3pFb1V0aEJBOXhxVUZ5c1pUcEYx?=
 =?utf-8?B?aFlJYXpWbGRibWFPa0s2RHcvZkxvRis4cFhwU1g0dThuK1F6V2pFSG1mejB3?=
 =?utf-8?B?RjNJdm4wNW54eEg1czYzKzRFeUFUVHJDUldJZUFjU3lpSkZXeVB6L3BNcHY3?=
 =?utf-8?B?bWN6Q0FtOXhXYzQzR0IzWFplWk8yQVI4L1M0RVQyMGhBVHVjZURvYjdjS2cv?=
 =?utf-8?B?ck9kc2FOc2M3YWJiVEhTL3dnMnRSUU5JUElOaDFIZXc1aFNOM3lzWnI0R2R0?=
 =?utf-8?Q?n9NDtQpijloHECpdjiFAQNTR8hPL62qfkDjQXf2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fea5a0ff-5db6-45fc-c419-08d94ab840fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 13:22:27.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VMERw+d8ThClGmOgbdDruLj9d5emginQlTboh2WycxreuohRlojhqqY9mQqxXbtbJIr9XEv/tkCARsV3GDNBI4cA/aq63ml7kpvwzYg7NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3944
X-OriginatorOrg: citrix.com

On 19/07/2021 13:46, Jan Beulich wrote:
> On 19.07.2021 13:14, Andrew Cooper wrote:
>> hvm_load() is currently a mix of -errno and -1 style error handling,
>> which
>> aliases -EPERM. This leads to the following confusing diagnostics:
>>
>> From userspace:
>> xc: info: Restoring domain
>> xc: error: Unable to restore HVM context (1 = Operation not
>> permitted): Internal error
>> xc: error: Restore failed (1 = Operation not permitted): Internal error
>> xc_domain_restore: [1] Restore failed (1 = Operation not permitted)
>>
>> From Xen:
>> (XEN) HVM10.0 restore: inconsistent xsave state (feat=0x2ff
>> accum=0x21f xcr0=0x7 bv=0x3 err=-22)
>> (XEN) HVM10 restore: failed to load entry 16/0
>>
>> The actual error was a bad backport, but the -EINVAL got converted to
>> -EPERM
>> on the way out of the hypercall.
>>
>> The overwhelming majority of *_load() handlers already use -errno
>> consistenty.
>> Fix up the rest to be consistent, and fix a few other errors noticed
>> along the
>> way.
>>
>> * Failures of hvm_load_entry() indicate a truncated record or other
>> bad data
>> size. Use -ENODATA.
> But then ...
>
>> @@ -421,8 +421,8 @@ static int pit_load(struct domain *d,
>> hvm_domain_context_t *h)
>> if ( hvm_load_entry(PIT, h, &pit->hw) )
>> {
>> - spin_unlock(&pit->lock);
>> - return 1;
>> + rc = -ENODEV;
>> + goto out;
>> }
> ... use -ENODATA here as well?

Hmm - that was intended to be ENODATA.  Will fix.

> Preferably with the adjustment
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> I'll pick this up for backporting once I see it in the tree.

I don't know how much the call tree has changed over time.  Every
handler will need a quick check on each release.

~Andrew

