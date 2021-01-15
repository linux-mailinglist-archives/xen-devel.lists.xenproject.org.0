Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C722F7713
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67939.121471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mpa-0001uA-19; Fri, 15 Jan 2021 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67939.121471; Fri, 15 Jan 2021 10:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MpZ-0001tl-Th; Fri, 15 Jan 2021 10:59:49 +0000
Received: by outflank-mailman (input) for mailman id 67939;
 Fri, 15 Jan 2021 10:59:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0MpZ-0001tg-81
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:59:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccd97377-be51-4c85-9edf-f519ee413f79;
 Fri, 15 Jan 2021 10:59:46 +0000 (UTC)
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
X-Inumbo-ID: ccd97377-be51-4c85-9edf-f519ee413f79
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610708386;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A2qsHMrM0kIcckogph1nC6gWp19IZaKmJkCL4ZVrbZ4=;
  b=TLaE/xlwtm/U70a3eYvcTIxJ67g8eRvNmUqTIjFXKKYnHzrY4Lz29nLk
   gtenge76U9g2ax5OWAzR0ra4kIaDVsid8qQfsfEANeHscwTiwzrCqXyCP
   AFjmOIvPcesRW7BCH7F1C2x76g1GO+y6yyizGz+gcd2OuaKR29oPelqhH
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wQS3pfhY8lEheVLYpCvcnrxqNtKah+PNypQDXajEjTUx+crQeTSpnI7WQ60Cxu/2bOn/NdVnKH
 CGzRiqcBuyzHwH486lYtKEpv/0PjqwDZyKcQ+NTZWDcF2f/lbJvv55lEOYhWnTiWQ+gKj7Y8Fy
 sODiTjqHXUBcgUohN5DpEUOc6TR1YwPICi61sauyH3c2VadNVIdeoeIOLAUzC1wFWvnRdiLeem
 MpNQWsGQmgcQFyWqk5rMD3zv24LDZYR2/4Ki9G2oJGeM317yjWcW9Jp6jNgUkQxq7XX9thb+XK
 gBQ=
X-SBRS: 5.2
X-MesageID: 35380001
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35380001"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWvWiCIPpVaxPkLq9b6iSqSFWfXEe4tm5MYyDoNAwZZDKBRJHMeXcB8wIB+ReHn0iyTLhEgmCbbvSMfvA5ISxKnYMcTaGrpgWxkkiHFG0MUHKcJRZsLY88V3eHolKMuljuCtJiWvtQhQ2D31znGjyfqYRpZrN5ZMBe5WyvOfAEHoCX7vjKcIEoZcpAO0uY2d0M5ZYrxKZzEJOKAVe8Autw6zIYTdARa2e8fqBJsd4OgnuDIUBu3t+bB+C3lD14ha1mNXAM4DaP8+MhUI6+PXojN9HzJ7bPMPdeG/sZlFwgb30Sd6MWfKlGtYQErfEbb238P1Rg+pxfGBzNKnFgbing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2qsHMrM0kIcckogph1nC6gWp19IZaKmJkCL4ZVrbZ4=;
 b=kEhKQCbtg2Cbll6GBII1R3on0mMVHntWyLKtcrjzILz8M/cc5tMMAcd10saDWge8smTsZan5ul/uy20PHT6r0MHGbRe1uk+/AYErSnprArpHO+VgBv8UtbeKEMBvuZbXHzS1xdRadLZDy4PnPTknO7uR0j/yaCo9O5tt77UksEqCSHubdEziFwYEBKAUi1vXF2nO2TpnZl4svTx3tSf4P3nmX4tRA2DCOPqam6pG/afEHoo+nZAI0QAzQNoojZMBTSq924F1HjDtKuaocQm4WF2dd/ZcU++DYbrCjL8tutIfXgcv5NlLGCP/0//GONgSsv9ueBNLknW7XMPAkZ03eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2qsHMrM0kIcckogph1nC6gWp19IZaKmJkCL4ZVrbZ4=;
 b=PPtK48djGLgunz8kDgg8iZPMarjZFtdpNS3bB8bIEx6J3zEkqEI6oOUlnuT3moLjXBXn6Kttyyjc5GDIc9c0tLFUtyWPXKLyy65l2dK+TUe/BkkntcoUJbLx718AQORLcIGTfSn1HDcCGHIyIIsEv7Bhn+11giBnj+5TgPlkiXk=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, <committers@xenproject.org>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
 <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
 <79f5fd23-debb-701a-1aec-30144af1a896@citrix.com>
Message-ID: <d38bd6ae-9085-ac4e-e182-3216fc492bed@citrix.com>
Date: Fri, 15 Jan 2021 10:59:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <79f5fd23-debb-701a-1aec-30144af1a896@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To BYAPR03MB4728.namprd03.prod.outlook.com (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8caa84-d69d-465d-fb86-08d8b944a80a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3543:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3543605F1DC6FA10D51843BFBAA70@BYAPR03MB3543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y88gxhURSU0mvOIfajpyjmxnikNKUp4F7LKV1nRL409aQ5KPQ9C31ESMQyyHOd5XO4jgvjYY8LqZJd/Jg9foWkQY/oZcbqtEYaf0ePFTmyBmtluOgWzl228SqpGvLwppO40QXs15Zc2Cqyyi5jJuMdI4bzgjqqAqOx6DAbz+BxENGLYKnJBMH+5AAGnKEB0mlz1ol9/w4HSxGTEf0tsyOFO5sqV4cTOBfvwFFtPaAYmHykWlJ87Eohnam+wve0TxnRDijQ4vcEIOgHj+pvmHyPshHwZ2PvfjJwKVoeizbntRcW0IOsRkwInB3sD6NLYl4Df+XAmeFNdsDdiQXk9XQfus+GWbqB/yUEEuPhGSogVhkbsU3+lwO5s7Weko/zrTMNi3dNvdqfr+R/5SAKiLMjTFsUZgJJzD0Rrv3JHc3MWmiVBsM5hX7o3S7ptEW2lb9H/26BO08bG7C7XY0BLuHuPB4aXayl0qArH+grcHMMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(16576012)(66946007)(36756003)(66476007)(2906002)(86362001)(54906003)(956004)(6666004)(6486002)(66556008)(478600001)(316002)(186003)(31696002)(83380400001)(26005)(8676002)(16526019)(31686004)(53546011)(2616005)(5660300002)(110136005)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T09aSkl6a09jQXJ0aVpLUUV1WG0xa1h6WGorajUzSG5QM3ZGOWhLVTBkN0lV?=
 =?utf-8?B?WUFBK1JJQk5WVnZrZGFZQlJ1eFhiQ2Q5YzRMUGpjZVJ0a1FUa1lIbHU5U1Fu?=
 =?utf-8?B?STY3SCtLdC9lVFpHb280eTVsaE9SZHkvUE00R05hcGw0blR6VmxvQWxPRGR1?=
 =?utf-8?B?M3l4MWg2R1dZSFFKelRkNzUxOHJwMWNTSEZZZXZVcldvOFlCSHZrYnhTb1Qz?=
 =?utf-8?B?d2ppcVJEU2w5TlJqMWFNaVJHVGFyTDlEbGlGM1dqSlpUb2pEbm5aQTE4c1VY?=
 =?utf-8?B?QmZaN08ySjYzZVVwZWR6WWZHNjRaNTVVaTU5enFjb3dzNjdjNU9WRlFkMjJP?=
 =?utf-8?B?Tm1PNUlWYXhJc2JWR1NHT21hNGVjS3FCazd6M1drMGF0ZFQ1ajVqWE9ZUUo3?=
 =?utf-8?B?alM3UGcyK0ttTkdrWjZESzR0SmJiMnNwYTBTRitNZW5BT2tGd3lMcDUwaTYv?=
 =?utf-8?B?WGhUQzdTanZmMlNORVByZ1NPR1J4bGF0eFRkelJEMFhKWjJLTnN5SHRrbFFQ?=
 =?utf-8?B?WlFPRmcyaHA0S3R4UEdhbFlGUkhsUHpUR0VkY0grRjdhU3MxSzJqTThwY2ZN?=
 =?utf-8?B?MitXY2EwbFdac3VZNFAwNWgrWnZ4anhoUWdRd2hmbzk4UElLUXBJNkhNdE1p?=
 =?utf-8?B?ZWJnYXBtU2tuTEYxejlUYWUrMGs1UXpCVlIvMlZRWTQra1ZXcTdSUVFLS21s?=
 =?utf-8?B?ZER4N0FKd3pQc3dqbEdSVlJwY0oxVDRMd25QMFh1UzA5d3JNQm5Da2JuZU5u?=
 =?utf-8?B?elZwOVhNdGYwOGZoWkpna0p2dzlkLy94QmNZZ21CZUxJOVNrNS9pU0FicWJv?=
 =?utf-8?B?dEdEN0tocWF5NDBzVWJtTXE5aXh6dWpsR1RYMlAreU9zQXFQSjVBS1dZa3BY?=
 =?utf-8?B?b2lqb2dPWnJVNCtBWjAyUVRnbXFrVUdHRk54SE93VXNXcWlWWXArcTBOQkF0?=
 =?utf-8?B?aGMzbkRiRE1kRm9JNUZkYlRBTGhZMEdiaXpqS1dpUkErQ3ljTzhZSXBzZmVo?=
 =?utf-8?B?LytGNzIvYllaTHFobitqYnFjcHRycEJkdmZpa2xTQnF4ZlRORExVTkxjN003?=
 =?utf-8?B?dlVaVkZ2V3NUY2hsOC9wMFBPR0dUejdBOTZUOHVHa3JSVDZ2Z1RRbFhZWHVJ?=
 =?utf-8?B?bkFiY2dwQWQwb1duSHNEWlBWVHg0Y3ZOakM5ZGthZlFTSUxpZzZMMkNjd2RV?=
 =?utf-8?B?UTQ5bUNudlQzajZCdTB2OThWVTgzV3FSQm5hQ2xvdzVvQlBtRm9xSjRrc01a?=
 =?utf-8?B?VE1XdmRZTE04azJUd21qbWUzYkkraldHMWI5M0JWT1ZseFJOZWVpcUdUNmht?=
 =?utf-8?Q?xZvj/nbJNVaHlr0Yb4DroaIYF+bYHrwsKx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8caa84-d69d-465d-fb86-08d8b944a80a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 10:59:40.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNjHxXW/9ZZFE9N5Bg5sKRTJvxdg7DpjH0RX8GvQIO2ikGyyapJejRzvygdY01Y3rXx0ecLEG010Rt0WHJ13lqeb2aM91fddjdwLwOvPnaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3543
X-OriginatorOrg: citrix.com

On 15/01/2021 10:52, Andrew Cooper wrote:
> On 15/01/2021 09:57, Jan Beulich wrote:
>> On 14.01.2021 20:02, Andrew Cooper wrote:
>>> Bugs:
>>>
>>> 1) HPET/PIT issue on newer Intel systems.  This has had literally tens
>>> of reports across the devel and users mailing lists, and prevents Xen
>>> from booting at all on the past two generations of Intel laptop.  I've
>>> finally got a repro and posted a fix to the list, but still in progress.
>>>
>>> 2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
>>> working, and very little investigation on whats going on.  Suspicion is
>>> that there might be two bugs, one with smt=0 on recent AMD hardware, and
>>> one more general "some workloads cause negative credit" and might or
>>> might not be specific to credit2 (debugging feedback differs - also
>>> might be 3 underlying issue).
>>>
>>> All of these have had repeated bug reports.  I'd classify them as
>>> blockers, given the impact they're having on people.
>> 3) Fallout from MSR handling behavioral change.
> Yes, sorry for forgetting.  I was literally working on it while writing
> this email - no idea why I forgot it.
>
> 4) zstd support to unbreak Fedora.  (I'm deliberately putting this in
> the bugs rather than feature cateogry).

Ha!  I should have read further through my emails before replying.

But we do at least want this item tracking.

~Andrew

