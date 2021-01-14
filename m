Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A12F64BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67195.119701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04g5-0002MO-EN; Thu, 14 Jan 2021 15:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67195.119701; Thu, 14 Jan 2021 15:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04g5-0002Lz-BF; Thu, 14 Jan 2021 15:36:49 +0000
Received: by outflank-mailman (input) for mailman id 67195;
 Thu, 14 Jan 2021 15:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l04g4-0002Lu-2h
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:36:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 442d4b5a-e5c8-4097-962a-82f4ed959e09;
 Thu, 14 Jan 2021 15:36:47 +0000 (UTC)
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
X-Inumbo-ID: 442d4b5a-e5c8-4097-962a-82f4ed959e09
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610638606;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1pCh+cDaYWrEQ14qU59wKevgRsueZO7/sFcB7OyD6Pk=;
  b=T6k08eCzikC9cXoVrm1dCcxXnHosE113kFuAw/hXmH+INS3C87+4ZiMy
   1tPLBZFFzLhFCHGJyjZqCdB9IeXx2ZG+gvl+O9CynRRC4KgOpHnBksb12
   Z/RvIMusRXoKIlNaiEEAhDCWtnIMZUv9Dayfg5madW6HfAowijZ7r6wVl
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K1c623Yl8VkgDTkOhLNj7bzx4TLcpeLccEhYnIdSqAGw/5rjmCKlXyFhOiLnZuCnryA7rL0DO/
 +6AmGBlfLvaGqJ75/VyN8F3HiYHZ71GjevWcHIAW1pO1wmWTECFA/emSDqOLuRGHZP2wgVePNZ
 AcjTVcxnSxPHc0GHXblEjpEJvXosrkFTh/c0TWFMGIUxDyoq2wZkt1xtUQ8xXx0XKka2r/2U4Y
 pfvckorrqnuNQCe9LVNo55pijBPEpGBQrGmAt5cMFSjvc/epMXmUJgn84tun5vDq5QJMG+jHZ3
 2bw=
X-SBRS: 5.2
X-MesageID: 35084440
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35084440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fStARZBgBRHAEvIOEswh29lAOTutVR6Hkk8hzz56J+XFolPQQC+SHjt/AV11NthbcV3vYomsj2On1e9OwGa+3oeIt8cSxngdVoMGUkjTS73pOLXX8BRbha5+xHldQPp+O1Rug4+Tl8gnCGUlust34rTnIX/KqNJz3eeMbYlIZzGwwrdReKHNLAnCQA5vfby4dBJDZGymNh9Z8r3ym9R4NHnU/Y9R0lL1PJapxve1jq1Cbyy23cQfQwfAUAPlHaVMrA1VJOXFI8FA8z0RcvqR+uuBRe5eyn7wGVE7E7iErQ6epI52oJrj4gWABLgpff5fB/mqcA1Hd2lFQ3LoEpnayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmcK9Y4uFBjkYUXcotUtMKLlgljfb7Qzt6kbazAoOsk=;
 b=PhQDqOgt9M5wSZ9JWnXdSne6ye41IjuvcQze1U9ByD2Xu7I/k/S4vf7SosenLd088tpcgChCXLSXGl7xebj6Tx+fVds0AK4dXyP0VfAsOlv8guC+IslMJEzumyYO6xZN2vhiSrN7x+xXseOCFSLfMYbwxrUxBqkS52EAUOcCtmN4BI193KvDVqOJGR2P3JyacdTQJqM4uvIJHfaAw7USSYCu/+5Me9Kz7rDUWlUx1JqE3vn4YcVljZ5MP1jV1DqxTCVx0TjV18vjbI+VAKFTN2gaGnI3fJ511ApNEyPWDzXKn02Ss7lnWRDl72LELIkVWzTQRSttsG/z/uz2KwciwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmcK9Y4uFBjkYUXcotUtMKLlgljfb7Qzt6kbazAoOsk=;
 b=RMayFyUtWHoO4EkfVTm2gIzorjWatpulWVMlBF0WhLU2nTdK0PfZsTdvmrbm37YLlDLbPmJHIWSC1XVoLrDE2UYNzpo+I+Z5amYgmRMH7dh3ZDpFxUuqgECDxZhxngu4X3WAJmspPitAGLmCjnXMzTb9XFFB1Z1KXpAIF6RASbY=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
 <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <96130e56-9054-3e7e-fa83-e8d9be6b7323@citrix.com>
Date: Thu, 14 Jan 2021 15:36:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <a53b09f9-a1cd-2f98-35e4-d8a6b16e1cc0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb5d101-2ef4-4a3e-759b-08d8b8a23178
X-MS-TrafficTypeDiagnostic: BYAPR03MB4773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4773EC91F1BC46CC50EC1421BAA80@BYAPR03MB4773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAHARmm5pfvR1XvQU8DO2fLtSrgThSK+EiaYxIQEEATv5Q+jOg4OwRDcEypkUboPIuIiGABn/F2mS9HlelFRyxz/lG1ZhkXi6axDOtK9aFI/J/oF3aY5s0I2A1hv3dd9jIl7p5D/oup0XGm7Kr2sh1tp2YQzBfaM91lghjrbBi5gfmtk+eYs40bKIYSTEUU2RfXbcQVM2JhyPIzSrCaLZdvbLh9f4s+czfF5TJMfNcZVli59TrkHqfIkwnFmOqVAgELySixhcWkHamc4mU6KCSLq7AbNDzOZl6dT08xHrM5AVlN95JZNWWsjD/vsY39V1Ar/udLgnkTfeH23anmk4kmpt3xPqbeJ9zlkupZ3bAEYpLFGo700MIYqc6fb3fTD+imGR3vqFwYiS1oTyRQRxvHb106odp/VMoxQ3f7IQUCgRXYUbT6TByxW3wj+6gb6oEuVv/bitRY7GtAbXEU9V5knVZIsfz//2amb4Qr2kt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(316002)(31696002)(110136005)(8676002)(83380400001)(16576012)(16526019)(6666004)(54906003)(26005)(31686004)(2906002)(36756003)(86362001)(5660300002)(8936002)(478600001)(66476007)(66946007)(53546011)(66556008)(4326008)(6486002)(2616005)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alZTZm5kREIxSmZ4eU02a0l4MERHZldXUW1zb2cyRFU1MkloN2lsQUlxUTdx?=
 =?utf-8?B?WTF2RjI0TmE2MXlubUlCMVUzUkdZTExrVnYzQ05JTnJrNCtSVjQ0Zjl2Q0Vh?=
 =?utf-8?B?TXNZdUZ1ZjBGYitVaVNwb1lKeGUwcE00ZlhpYVZ1SVB6Q0t3U2lvc0NMQmJT?=
 =?utf-8?B?VFJWZHFKQVE1SkRsZFZSR2hUa3JXZWxZcWlGWUlIZldXSmtRTWlyUGZlclVS?=
 =?utf-8?B?TGlvZFZxMCszT0JlL0tZMktmVGc2ZFRqUUJGcHdON002MFJSV1lRdUtKdGM4?=
 =?utf-8?B?aUp6MnlkOTZBY1NiZzhBTThtM3hNU1VNbW8rK1ZLZEhIeks4VlFrVVFMSnlo?=
 =?utf-8?B?aUxJenpIdW5Ga0xneFIySWhQQkllcWpVTE9kaTVtbTRCK20rZS9UUmxnVnRu?=
 =?utf-8?B?WkdadzJkanh2MEVYTHdmUUx3MWpQQ1N3OFlld0lucWZxdlJCakpVQXhiUm1Q?=
 =?utf-8?B?SysrektubG9RVXhwVEVwTEhRYzVLcVRGdmZ0R2tnSjZpS2RsajdDWTg4VFU0?=
 =?utf-8?B?YUtyc2lzWjlJNjJOTGhtdTZLMHJrM1JGTzFuZ01yYStkK29LdGRGVE5rT2I0?=
 =?utf-8?B?QWhaQWx3dEljZUhZQVA5MHlWbTVwZ0lTZ1Irc05MUzhMalRMZUlIdEkrOWc5?=
 =?utf-8?B?S1lnSHFZcW1lZVhBZ0pFM3ZxRUowQWdqYTRGNGdPL3pxWTVXV2lmTk11VEI4?=
 =?utf-8?B?UkpxN1dqM2dOdWU4eEEvWjR4VlRBOGo0L3lyU1EyMjdUcHNBYVpkd3pLRHdj?=
 =?utf-8?B?K2pkeWluOUlpUGllSEJxSWRrWktUMjRUZkUrM1JPa1VSQlhIeW43NjRLU0lo?=
 =?utf-8?B?djErcVJXZTgvWGJOOUh5aWRGQ2trTjJtdkpOdXI1ZWlYSFROVzRBRU1Qbkw4?=
 =?utf-8?B?VHprTkIydXd6ZGNWMXl4MWlxVXBmdWdpWU9zR0x3TU1iYk1GelNvSTNia2FO?=
 =?utf-8?B?L3paajFVOFE3dXRhazJnMkNjT3BVZUtXRjR1UVUwd0cvVnp5YkpoZWhXRks1?=
 =?utf-8?B?ZkZEckFsamowbnhkVGhGbUx3UUlpV3hIVE8xM0tvUHJGbjRDbTZhTWVXWTQz?=
 =?utf-8?B?b2ZKRXIyQWtBSjlIZHQ2bkYxN0grQXRqbnJRK01FckhsRzdqSk1HdFZOdFd1?=
 =?utf-8?B?Uk9GWnE3dU1qNVJRb3ZOZ3R2RzNjYWxoQW5HZk1wTmtISmRJYzY5Tm9LYjJS?=
 =?utf-8?B?bG5ySGdSNmhzd0V4dDd3NmU1Vk41a0kwN09vZzBvTHBDeEJod1Bicnk2amJn?=
 =?utf-8?B?SXAva0JQQ3lRdjM0TkF5RHhtUE4zdi8ybmlzWkd0bWZOSFJQaDQwckxBNzBG?=
 =?utf-8?Q?S2kqoyR1bPBO1TjI6gG0uOeGj603sk3tzO?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 15:36:42.5996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb5d101-2ef4-4a3e-759b-08d8b8a23178
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RGHGOz0IlX1G29AbWihpKGx0xm3f2u3ksaK11Kr8gMLjwgtQixf2CG77q2LoBmW8cv/9kLxRRvQ+Oha1gQ9XEOxD8BxNO1vPvkXz71fOVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4773
X-OriginatorOrg: citrix.com

On 14/01/2021 15:30, Jan Beulich wrote:
> On 14.01.2021 15:43, Julien Grall wrote:
>> On 14/01/2021 14:02, Jan Beulich wrote:
>>> It's not overly difficult for a domain to figure out its ID, so
>>> requiring the use of DOMID_SELF in a very limited set of places isn't
>>> really helpful towards keeping the ID opaque to the guest.
>> So I agree that a domid can be figured out really easily today and in 
>> principle it would be fine to relax it.
>>
>> However, most of the guest OSes will care about running on older Xen 
>> versions. Therefore they are not going to be able to use this relaxation.
>>
>> So I am not entirely convinced the relaxation is actually worth it for 
>> existing hypercalls.
> I'm aware of the concern (Andrew has voiced it both here and in
> earlier contexts), but personally I think undue restrictions should
> not be retained just because they used to be enforced. We've gone
> this same route in a few other occasions not overly long ago, and
> iirc there are two patches going in a similar direction (different
> area of course) that I have still pending and which neither got
> ack-ed nor firmly rejected.
>
>> Anyway, if we decide to relax it, then I think we should update the 
>> public headers because an OS using this relaxation will not work on 
>> older Xen. A developper will not be able to know that without looking at 
>> the implementation.
> Well, DOMID_SELF exists because that's the preferred form to use.
> I can certainly add commentary, but it would feel a little odd to
> do so. To be honest I'm also not sure how helpful this is going to
> be, considering that consumers often have their own clones of our
> headers.

What I envisioned would be an RST ::warning in the "how to grant table"
guide for guest kernel developers in the sphinx docs.

Of course, this presupposed that such a doc exists, but its the only
useful place to put a note.

~Andrew

