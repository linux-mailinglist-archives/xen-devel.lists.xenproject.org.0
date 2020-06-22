Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C762030CA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 09:47:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnH9h-0000YS-SU; Mon, 22 Jun 2020 07:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnH9h-0000YN-0i
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 07:46:13 +0000
X-Inumbo-ID: 707d0dc6-b45c-11ea-be48-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 707d0dc6-b45c-11ea-be48-12813bfff9fa;
 Mon, 22 Jun 2020 07:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP5a1peS0NMlG0qOmZ+msQPAWPKTpiiHxNyRYOXGIUfZsNZYPdg1dceXXf4zEoefO7PTGk44ZePUIcP+pflFlPhF+ftfIzU3Jz1dSaLbzEwisY1eVcAjSU92UAT93x3c8RrEY6PFnY96MTKMmhXM4Mr86QLG1s3J1MO0I2RxUtLwYAjEetWikyvL9TThcDguXdfY0bPZEGnmD28d5TcIZnvySh1+tDzOFLtYLQuRdF+fA3rD/f/Q6+eKgTJvQCu0U2UP+qcRa31P0Kf1GcVc7g9W8HFPTNxMirUwyaQrYMmud2eCPZL/PgdskfE1jUBoUOsQSLBtI2scOdl3ebY3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIXjtw8rpt2im2PJqVoJPd6ABNVHoSLEN5afQ+Pr+cQ=;
 b=kVSv8ff7/zu6Y0riNUm0TEwuBfhXeSbDG0qac3f1PlXjD8J00guK3lzCviNxM7tg5TPrmdgn8xrOyPr0RdyxKw+AjeqFAaKObZnkxrTYIZiUd6T9cTbQCRXegCF+NYiz4kP0jcYx6O2xQ40w/vbaAsbsUt4a2Gsv11FONOc3lgntOL3D6u+JulNNaDl9jPUfqADpRhsUOlFKHzO8vAs8pWT44fZ15GCNPyXKkESdK6w6/8T7la4CTxV0pTYbJVGk+s41uCiMDShgBlmqV1XRn21RI3iA4u7KRvHMYYhJCP1JHKOF2m+jYqXEgIOijWAvC1DZXB6nJOAyU0HxydGh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIXjtw8rpt2im2PJqVoJPd6ABNVHoSLEN5afQ+Pr+cQ=;
 b=kIC7XXX0eL/utehsyeSPutaAdCFwxa0ci3HtdeM7hoPC+OVxdIsWysVqvs4Med34uui/5by7qadISAPZLJWD1b6Kw3X3p32sMvDQoJ80N+RRvBvHbPc0+GcAXxYWI15hCD/aDIeMfL9sGCm25Wp0y3ql64Uv/ZLug22Olz71WWgJDn/EOkXlMg57UMx0QDD0ssJLkIH6sIhNiNtqJ0twSLj3s+Wko6VdmqhYHsU4LaonPz4J8H75eoIp2AYjxLPdsiCZ7ocnBD66RyKTBVGuUQV3O4Tf74gC7WybiEBMRO0pAwHnfD+pXDRi/j6OiH33Eq0lV2SIVgemlwQiljF4sQ==
Authentication-Results: student.uw.edu.pl; dkim=none (message not signed)
 header.d=none; student.uw.edu.pl; dmarc=none action=none header.from=suse.com; 
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:46:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 07:46:09 +0000
Subject: Re: [PATCH v2 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
To: Grzegorz Uriasz <gorbak25@gmail.com>
References: <cover.1592539868.git.gorbak25@gmail.com>
 <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
 <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>
 <ad15c39d-d2ad-9e13-2f52-432532b869c3@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7aae4c3-9e78-5cf5-41c4-7b90a3434e52@suse.com>
Date: Mon, 22 Jun 2020 09:45:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <ad15c39d-d2ad-9e13-2f52-432532b869c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23 via Frontend Transport; Mon, 22 Jun 2020 07:46:08 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a3eec4-9f03-408c-e139-08d8168053c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS: <VI1PR04MB7039FD6FED1096240AB670B5B3970@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZ3HxIDtLHl1yIDrOgPLtd5ZPGX4DmdThZgz7SsIR+JjDaxOtfVuRhH/XTLW+15D8OQEewRwobCagy/VGlIsdCX0zcq1F0O4YuGsZlf7+zi8IIXjIZKRv+QIYF+f207njK2FjMKj+fwDM7iL27K9LY0/gMNZZeQcszAw4oUwepah7gC/8t4cyemLTCDslh7ZlBgQ3dDiVqdf6qM7Gf5LLZJAi42Aw26TkpXlwpHZ2ONPIEraQAT5byYTM7vaml0ZQUby25U2/mcGWRKriD9BPPDSz8QwXQV0GQG0EhZWusDC14BmqWd/8Colh5lNATPItsx0O/lSqiE0vCj+s6HyqOMJiK4MOZJTnHouETftd9518jWxjqorGe1JC18q9doS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(39850400004)(366004)(136003)(346002)(31686004)(16576012)(478600001)(16526019)(26005)(186003)(53546011)(52116002)(316002)(8936002)(2616005)(5660300002)(66556008)(6916009)(66476007)(54906003)(2906002)(66946007)(6666004)(6486002)(956004)(4326008)(86362001)(31696002)(83380400001)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xUpNIB4hUITUkgTxgBD6u4HuhgLjwBWuUFXtHiUy1GB3x5BTn9MokJYQ0ofmAgv0zGOIEiNt/+O6U2L9S2Exhi1xtbgBQ21VHYpK44vEyHaB0CsUToN9Jhxp8e87A0lN0O/rNHChGwFk5MUA7mz9FYPNJ+ff3OL1IZ8ik72XH3Tgrw9jgdi7l89ti2eYaNMLd6fJmSUKtYBwAuIik+IsXpSCwYdjFLi/mO7FZnyuR9LEcD+G3nYp8/S6t+CX+XIB8Tde+ZbkowbvEaFDDov+qjF/JLgbCdfx//LSLtYBBMssH05V/9rp6lNA3aWOOLLN4PgZHhLu/euO5qxkOS3XHiSVT0inhDWBg0LgVAg7l/01m+qFGvwevh69+DFU0d3cn7TmNDzCFDpjIih0NYpGk+kl03oL0tmaVYgCe4/c60Y=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a3eec4-9f03-408c-e139-08d8168053c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:46:09.6225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUuqKChsNYGZs1MpU+4PKlbW27uX3hKcPdquzcm6e18Db0BHG02B0gzam8Csmes3iqAMWYkL16C4W5PIY+muag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 20:23, Grzegorz Uriasz wrote:
> On 19/06/2020 15:17, Jan Beulich wrote:
>> On 19.06.2020 06:28, Grzegorz Uriasz wrote:
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -457,16 +457,16 @@ static u64 read_pmtimer_count(void)
>>>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>>>  {
>>>      u64 start;
>>> -    u32 count, target, mask = 0xffffff;
>>> +    u32 count, target, mask;
>>>  
>>> -    if ( !pmtmr_ioport || !pmtmr_width )
>>> +    if ( !pmtmr_ioport )
>>>          return 0;
>>>  
>>> -    if ( pmtmr_width == 32 )
>>> -    {
>>> -        pts->counter_bits = 32;
>>> -        mask = 0xffffffff;
>>> -    }
>>> +    if ( pmtmr_width != 24 && pmtmr_width != 32 )
>>> +        return 0;
>>> +
>>> +    pts->counter_bits = (int) pmtmr_width;
>>> +    mask = (1ull << pmtmr_width) - 1;
>>>  
>>>      count = inl(pmtmr_ioport) & mask;
>>>      start = rdtsc_ordered();
>>> @@ -486,7 +486,6 @@ static struct platform_timesource __initdata plt_pmtimer =
>>>      .name = "ACPI PM Timer",
>>>      .frequency = ACPI_PM_FREQUENCY,
>>>      .read_counter = read_pmtimer_count,
>>> -    .counter_bits = 24,
>>>      .init = init_pmtimer
>>>  };
>> I'm struggling a little to see why this code churn is needed / wanted.
>> The change I had suggested was quite a bit less intrusive. I'm not
>> entirely opposed though, but at the very least please drop the odd
>> (int) cast. If anything we want the struct field changed to unsigned
>> int (but unlikely in this very patch).
>>
>> If you want to stick to this larger change, then also please fold the
>> two if()s at the beginning of the function.
> 
> I wanted to avoid hard coding the masks -> Linux has a nice macro for
> generating the masks but I haven't found a similar macro in xen.
> Additionally this version sets the counter width in a single place
> instead of two.

I guessed this was the goal, but I think such adjustments, if indeed
wanted, would better go into a separate patch. The bug fix here wants
backporting, while this extra cleanup probably doesn't.

Jan

