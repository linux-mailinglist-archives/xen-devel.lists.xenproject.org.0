Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E6307896
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77119.139511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58cP-0008UF-Kz; Thu, 28 Jan 2021 14:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77119.139511; Thu, 28 Jan 2021 14:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58cP-0008Tq-HC; Thu, 28 Jan 2021 14:49:57 +0000
Received: by outflank-mailman (input) for mailman id 77119;
 Thu, 28 Jan 2021 14:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l58cN-0008Tj-OK
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:49:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8601ab89-b689-4e9b-8b15-9d397cea88a2;
 Thu, 28 Jan 2021 14:49:54 +0000 (UTC)
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
X-Inumbo-ID: 8601ab89-b689-4e9b-8b15-9d397cea88a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611845394;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ltwwJ7jDNE6izGCbJ+4qjhtJ8W1sYPgKHP4Gi2Gcxh4=;
  b=Nzc+ADWZEPgzoKBHvlMKszwXrWcz9fHJuyPxH3Ym3n2xmo7p5nCjMjD+
   WYtnDOpvrm8Man6C0xzrkJGbWnEYtU0xsHfZn3MPC0ZCzcikNVBPH6BtV
   Oo/WcDyokMveYs/7zC+WrR05ivN4iCZ+I2MBBg6+C0VGU2SG3soLvB0Yg
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PKlgpBlDcTVZnmW9gw+5bGQlnbzODbQULIsAcRdu5yy8zVNvh/YBea2gvgJh9c6Yqr+dQVutAL
 1B4cYemfTu1CJ4bXO0na2Jz+YAGvIvBF8NZtqBJgxRIM7BP49U6xxPcjoXRN+kD0Z+aiH/oPwW
 pZix43mtkkCLxg2VIQGOQy9v8uxdbxGc0zuB45bNBaOdUaq4dMxHd3tnBbv7s5EM7syRApaYRO
 1r+Xc6ciHhtjINtCRnGKwqjEWAXRd+T1YS15RIa2f/m33xsVJXfyGVQ1TXqXHF8Al/O67Tr1dX
 Rjs=
X-SBRS: 5.2
X-MesageID: 37385390
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="37385390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLgh+4EPYYNxvGN4ucMHzRYej8Il01A7EcsSrTm8zswQsuAaQ4RCGOorxGXjWS6sRW6Uo+bykXl+6rn5ujLgoX4N1hcUvGCCBoclRHTmmEPuaIASyVOJtIy6XdBIMUV43fOJStGDLTD82kyY7WHRTf7dZMEHq+0vUsTDWi2U8tE4Lh/oKGv4UYNFRQS3eJGrmcnv0PSq8I2oj6KEU3ETlS40FhOiK7iccrWJ6w9eiliF89T9KI0EVw+YaxdlehI6nCnkAj+Id7x04bE/07NX7hhlqSc2TrqtbKOrO94+al6OrZK0RWX2QNoIOCcbEXH7ZFDPCNVxkseTGcoP8zLw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCSCGnCSRg4OJUsiYbqhdxEVzBRE9/s4f6rJxtBLuPU=;
 b=DVD2oRD9tkYzwLMLdKqbZ5HAMtQVcuXbK95lbox3HVxbro2bW8YaDnX8WkP3iD0BGro+eLwzyZRfQKTt9zr6/RUN357Ogj3ZkGiv6ybX2eqAnyQTHoC8WKjPyby/9xDl686ZFO/3GgBmU6ijvJ9i2dgb+CjljRB6gPfYp348satkdk04IJymN4xb+Kq2VlUm2rwMvuhpWihbAyU8/TygnFy0W/M5a+u1oeGmytWsCruOLmcV4QjAlRf5I3taAdBdENZNyIsbPUPGCqVaUM6Dj1fBcKgO8brFswFNPQ7HLtZtWdiN4tGsbCLjryFOuB+hDGdbvlhCTn7rkaiI4ietCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCSCGnCSRg4OJUsiYbqhdxEVzBRE9/s4f6rJxtBLuPU=;
 b=ReZvp+CtMfeVBj3MQ0B3gFdz0F6Zj34GcKb0qGLdrVs01HQy3gRlWH9Qd+rah3nw+ZSVLikNaKqDp+P0xKrylVEdsfRfjgIetonSE2kIqmnD4R/R8NCwWEK/rSGXGnqa1wUoWWaJ+/V9NYOTQBmVnFNgP5n9nZXWvT85gQw5q5I=
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Julien
 Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
 <f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
 <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
 <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <25dbb33b-baf3-5644-3a2f-7d4ef2888624@citrix.com>
Date: Thu, 28 Jan 2021 14:49:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8303b095-4d87-420e-2008-08d8c39bf3d6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3414:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3414DA97A5A5CC67A19AC0DBBABA9@BYAPR03MB3414.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4dRD1klOEKi5L7uIOGSXQSL7yr2a0RedTTFrdtPL+sIMReLKALI3bQq+bCSy1rGUS1hkGxN3hPn6nTH52+mPxNTvJUgZ1iteP8K//+d9UMtonT2IY38lNW/2cSQkQT0XHdLThA1kvXtcmIx6E3lUOcjyvwtW1Q+YlqpkCTcaHdSTdeEspuDx8ne5nASiMa4vkmfrYszlA8rf84ydr9XnnH+LmimRog6XYayE+TKgR3M0KVEWxhoo4P6gjGYzeNkjeN2okxJCk3OpYN2pGucFeaytubUMESX1nZ3/vsMVf/DxlWJjjdMNuOvVbyHP9fkdCtxFQ4WIu6ZfmnGgfBP6JH1tN1PsXDPhj0otkjRJM7afHiciG1Muieal8j2fKKf0kUay5Dc9rKtdinMwXjDM/Ba5CVnEYTYwD40Z/njubPKJFk5UcPvXvjfNMQgEr9lhuUME3OIKAHzmsOpabPTm5JGwUWsjlO7L83Z5ivwscwAQaQk4/lTPORVjjOewj8OIqxBbLCeLeDIMEgWWbYBRL3inKX6Avs/MIG+KZNQtViMzws4IwaG0c6hxQIjEJ7GacYF+qlGkMd/H33YLNzXPR8IBKZ84gGsYF5dv05PNLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(5660300002)(86362001)(36756003)(186003)(54906003)(316002)(8936002)(83380400001)(8676002)(478600001)(6486002)(31686004)(2906002)(4326008)(16576012)(53546011)(16526019)(2616005)(66556008)(110136005)(66476007)(956004)(7416002)(6666004)(66946007)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkxUUkxmSzFEVzljUE5ubGZkWGhkTEd5Y08xTXVjUm1acWZaaURDcnZNTW9T?=
 =?utf-8?B?M3ZHSGhxaXVEWm1DL2ZFcGNMaTBaUVpZY1FtUTlLNlBOc1hPRUlOZGp4TkIw?=
 =?utf-8?B?SllXbGdPQ21KWU93WWtUMGsxcGFzeWNWRENKVi9nbGRUeEFPOGhWWC96SDY4?=
 =?utf-8?B?QUNxdG5vL0pvSzlTeU1QcnRlYXNGajV1MEU1cXhsNTdYN2RrdjJsZFQ4MXJz?=
 =?utf-8?B?Y1RrQ1N2SjBVVnNjVHk1WjljNmV2T2FMbENrVUhycENiQTEyM29IRjhGRnc3?=
 =?utf-8?B?TnhjZW1aajRvN0tmNU1NNFVrZEg2UmFBV3RWdGVqcjd0UkIxNG0xM3ZjOGta?=
 =?utf-8?B?NmlDSkZ1QUZ1S3VkQStacU9QMGtReUJFeElMS3h2M0ZKdnlZdm5HZzB1VWFt?=
 =?utf-8?B?Q0FqYmtJUFVKYXp4Z0JaU3JpRmJBanRYTUNWYm94YW56U3FORUtLVzJJdkhG?=
 =?utf-8?B?MExaOFgraDByRVRoQ2JUL0IwRnFPbCtqb2ZFbkxkWHhpaXNicSt5MTRocnI2?=
 =?utf-8?B?NVdjTzZCL3NTNlp0ZW5RY0s3UitmSkZDYjVDNDN2ZStNSlZ3ZStkQThSTTZs?=
 =?utf-8?B?aVhiWEN6T0g2QlVsUmo1V2xnZlNqbUl4VEFVZkVwakE0Ylh3SUtUUjFxZ3pO?=
 =?utf-8?B?SXoxRmlKcDJYSG9ueURraGVCcUpyRTFoRFF5Nk1uNUZYdnI0bFVUbDQ4NWRa?=
 =?utf-8?B?aXRtbFNXZkkvU0thRzRIU25qVVFkOUlPNVlmVjRIeGhkRDNNVHRPZmNkZEZS?=
 =?utf-8?B?aEsvVUlOcU50ZE4zSDd0YlBFRmNCQUZVK0JaaVJkN1lZdHVUbm5rTTZackFi?=
 =?utf-8?B?WCtCUmMvbHRhME5nUXB5Qzk3c0o2Y0s4RWZlVkcvcURYVzNPck9hZHlvbzNO?=
 =?utf-8?B?aW5aU0xOWnVHTEFoQkJTTXJ5RE9HUWg2UlRXWTlkWFB2Wm9Mb1lRcTAydEJO?=
 =?utf-8?B?Y3Y1a0pZTk1zb0owMk9majVoSnBIQjVhSzVWK2VCTmdBd2R0WEtFTU4xdThP?=
 =?utf-8?B?Mlp5YW92bjA5QnZBbkpSN0R1aVRabkZkSXkvamtrYm1ZNXBNUkdJdE9YRytB?=
 =?utf-8?B?ZVoxeHM1bmtETjZ2T3Q2QVM1dkpEZEtVdjN2bWtVQitURndXMFZQSmRkS0V2?=
 =?utf-8?B?anA5R0p0a00yTDRzbUNQUnZuak1uRzJjcDlKMXlBVk9uUmxqaWdwbkE4bU1z?=
 =?utf-8?B?M0ZYSS9ieHJjd0FIR0lJcU1Rbll6Y0V2NS82eWlOUitHREI3NnVkKzdsdDY2?=
 =?utf-8?B?VWtqSHpWT21mZ0xrWHRvUk5IaklSeVhqK2hKZSs1cUZUM0J2ZEl1QVFXWkhB?=
 =?utf-8?B?NDBRVGphdWEyd2IwaWpheGN2YVZ5N0xDdzJUamVZZkN4K0FQNDhnaHFRWkZI?=
 =?utf-8?B?d1R1Q3J2RzBTNUVUdm95S0Rhd2krOTlFWGN6eE85SGM1K1dST1RSamRpMERI?=
 =?utf-8?B?NWh1eHJ2eTFwMi83VkdGMGF3N1VoamRZdVpraFVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8303b095-4d87-420e-2008-08d8c39bf3d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 14:49:45.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyjNadu+FZemeIGj9fHsdYDySn88RimaGByJghkrCubwJaG2kOiXtRQCXCHFyrgLeuBW97Lr3JoPKAgtQe+jMxMfS7hs3c3GZ0evOJtZO+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3414
X-OriginatorOrg: citrix.com

On 28/01/2021 14:36, Jan Beulich wrote:
> On 28.01.2021 15:21, Julien Grall wrote:
>> I was going to reply back on my e-mail with more debugging information. 
>> It seems that this is a build issue as if I clean the repo the error 
>> disappear.
>>
>> The error happens when I move from staging to a batch with this series 
>> applied without a cleaning the tree. It also happens the other way 
>> around as well.
>>
>> Removing entry.o or asm-offsets.h before building doesn't help. Any 
>> other idea?
> No, I'd need to know how exactly to repro and then try to debug.
>
>> On a side note, it looks like asm-offsets.h doesn't get rebuild when 
>> Kconfig change. I noticed an issue when trying to turn on the perf counters.
> That's bad and needs fixing. Assuming you mean the kconfig change
> in fact incurs a change to asm-offsets.h. Otherwise there might
> be a move-if-changed somewhere preventing unnecessary rebuilding.

FYI this is the incremental build breakage I reported in IRC last week. 
There is definitely a missing dependency somewhere, but I just far
haven't been able to precisely what.

~Andrew

