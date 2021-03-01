Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF243287EC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91852.173367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmR9-0001wz-QE; Mon, 01 Mar 2021 17:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91852.173367; Mon, 01 Mar 2021 17:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmR9-0001wa-M7; Mon, 01 Mar 2021 17:34:27 +0000
Received: by outflank-mailman (input) for mailman id 91852;
 Mon, 01 Mar 2021 17:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGmR8-0001wV-T3
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:34:26 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7af00e26-e017-48df-b8cf-0c1b8628f957;
 Mon, 01 Mar 2021 17:34:25 +0000 (UTC)
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
X-Inumbo-ID: 7af00e26-e017-48df-b8cf-0c1b8628f957
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614620065;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bBZGwdEsMgCCCGBsaeq28+hzp7+XbceDPK7QYidNwW8=;
  b=BGss/6l+MFoFP2EDF0zR/HGM+Hg6mjIWOw8t9uKm1IM5XyfiuhTvsbJ/
   xfGfohlZGfwna7D+KHHTI/05KGr2M96QFNy7Rhq+yScQbuqBqOFFBtLPL
   /XFa+Pc8hIFF8zD4VEG5qXGChHEZW2F5E/Ron4dhJG8lz9bqRSqG2eUw+
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: acOxFDHKlY+t2BvIEz25gkiFzPtLxVJWMFqNwWgLSH0lDCeamDh8v7OFRziwEwsqzO9QAp8rSR
 mjPsUEMEsj4d2+VVzTY3XJAkPSO9g7BzdVp9/2sxip426yBio/gJ2koRWTHDkIov9mNx6bc7Cx
 NjZ8MLNIQQVh6fKHeUCfOWyiv+2G9het3c55/3fXd/0l5jI+fjqwBzCwe5zPHbH5E91dL/dOSV
 Xf4kCPIwmiuPxRVMorTc+SJnJhng05YiUAaDO+IL1baleoeiP1YGIB4lJVnR6P01rg2wcZUO7E
 Voc=
X-SBRS: 5.2
X-MesageID: 38258181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38258181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5O4z6U9EjluUpk9o9e4HHPsY+aWFrxeIZjSm8SwnIYc282RxVx0AMj4rfWD0REM03849HEvhzq9k5qa21ZBpzUzmyGGTwpDmiIboYVF9EeFGgvy5y76ZN5KUFqYtT2yBY2WfnCG7Gk6NP9c9Xr3FJ6piIOVSL1PCFZLLvje/6HDYPD2hVlK7MT66Rvwnd6u6ZIDn++GJHCTdP9G1DB6SPi65TERweoowZD+sQ4lyc70u+EfCEQFjuGvzU6lmrsk/rkYt+UkBBVENmCzV2QjjmZlzUK5OfAdg0XOid3qkyK32TLebg6g5VnyVJ79uPt++5FG1st1C2KQrSqPXqY5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwQ2z7c558Ji6M3CPWbw5WzYaOJmV2STZbVt+okV4FY=;
 b=dQyk+E+13DJ97b2wdkiFwGqc4Wbbucx0HEwfpw38sGt9pUMExBbiIJhnLxs2iQBQzCvPie4VgZAuBxZf3w5rAdiUgrkwUKf2MIPABQChlEh86mYUAJ/WXVPJeYzqOHcJtrqSnWAJLphgdpHR3YVoRbQ4Pd/4TBeXApfKE9Z3V8GyzQcghCnfUAzfbyHpoVSyQRaX/3F/LBaaVIasF/hVQECXhxRnSG6DAzfGU9gLRWBDUAKAOso4lu0bUqm7qrmj9OYp66zk5AjKpl2tKrHisRYfFyOQV5uW0iO3bRvnaNdCB4M6kEHTqwRXgIh1ZENKY6huN3kF/1OUPxJWgTAzGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwQ2z7c558Ji6M3CPWbw5WzYaOJmV2STZbVt+okV4FY=;
 b=TKF2Ot0PAi7pVFjE8bFlYyTtQOHvXsPK7yvLRiycFnX/zwTR6sqT7pJJXdIsbvECAHQxHWIGkLyn/jew2qVlv4oSyWyB4YMKxwPwAopzCI1sequsycH4TcTgpBiFf2r06s8NGKOQLPqG1QYZbX55qZu+yyBSxDxsEfFwzbB+y+g=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: Tim Deegan <tim@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
 <72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
 <24637.9408.839033.439930@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
Date: Mon, 1 Mar 2021 17:34:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24637.9408.839033.439930@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76dd7209-9e30-4560-232c-08d8dcd83fdd
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5438:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54381C24E2CA1A4104D2F8E6BA9A9@SJ0PR03MB5438.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVkrQhCskH9Ios1dKIHmg6pWJaKwZgekrRADmZQSS7h5hGNbMKAQtOOh3cZaPIkVhEGa4ExtEm2r0i6AIomEhELuqUDrsikcJ2V3T8QY9eb4GA2AcYQOguGTwBIz4Occb3OjyX3MYcEVV2ntEftMLZijDfB0hjeJFkaT5rvM5Rra+HodWN7N9Px3Dc9ISqaHQQrIYo67l+3V1kravd5mj31kz7HWllGgYavjgzUVH+RI5dUSK89oJBtqqa7XD75ITNyet4geIlTGHrz+Tk024b12ZTOMahoLu1+J/wzourSfV+ckkEAFqXwh4psaDcKr0Hm5HfzaZcbi+KCO14ltxx9uUJH4uLydGhGHJgg8IzROg94OUZuTneBnBnlLZxnINXpqUv+sV+gYbqA5WU+YNJcB1t73WczvupIDE93KHyJneoZu/1d3ilfT9rPlR0BA9uyuD5wDuEWSUaS6UGDTqUT5EMgT/HD6VYszMLkCSRGInH90YBK/f2QCTHbjnHe6SsNdxlJpJ+vfYMMFXaINSuMBY1DbfQiZd8Vk6Jakehtp8Jrsvt5yutSrVm8bEVMwfe2LshWtMpsSb40CmzzBYiigZz38Gwbf/fD2+5Fsdg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(4326008)(31696002)(107886003)(316002)(478600001)(6666004)(26005)(16526019)(186003)(86362001)(36756003)(31686004)(53546011)(83380400001)(66946007)(2906002)(2616005)(66556008)(66476007)(5660300002)(54906003)(16576012)(8936002)(8676002)(6486002)(110136005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWFCN1loRzFvZXcwQVhObVdLdlVJRkQwcHlTQm1qR1d3Ly8rTjFYSzJ4cUhn?=
 =?utf-8?B?aDlNbjZEc2RrOFNkODhLYzV4VWU0N1JmcHZRWjNrMlhxWVZHWC8yZEYzQ2U1?=
 =?utf-8?B?SzIxMjQraTEvT1BKK0ZEMDB2d1ZMcU5idEd3amVRM3Z3dTEzSTNaQ1lCVkxv?=
 =?utf-8?B?NFd2Q1pCMHYwUEc5c2NXY2V1UEM1RjhKWFpTQ0t5WGNQNnFOd29XN3ZqUlAw?=
 =?utf-8?B?MFNwcndEcVJ6THhsSS9abDNLNXJIcjJycjJ2QnB0MmNTZVZXZHg0UVNiQ1c1?=
 =?utf-8?B?YmxSNjdNYjY5MkhjSGhWS3d6THY0SkVoUy90d3RGaUJ6Z2hFMG1zbnFjVmlV?=
 =?utf-8?B?V0xEL3ZHa0s3UVdTcWFPRFZtelFBOC8vWnVVZStiMU41WlVUd09RL1M1blBz?=
 =?utf-8?B?alJWUTY0TmdKdkYrYjBrNTRFQXV3eXNWRTBlVzlHZ1Y3S29DajVVd2VCcTM4?=
 =?utf-8?B?RjZ1NjZFSkh2bXdMeUdwRjgzWk02bUt1Sm9iWDdvbzRiK1BLWVJXL1hYSzlt?=
 =?utf-8?B?MDRLYlhscWpJc3JoTUdLVmp5bTdPb3pQb2hlb2tmZXBHZUIrYlBnb2Jxd1dZ?=
 =?utf-8?B?U1pBdDIwRXU3RmswTXRDUnJ6SDNNdmZjVWE2aHJqYXdLTGE2L0hacjhGMXBS?=
 =?utf-8?B?QzRiL0Njb3JJcDhsMXM3UCt5dTZvSmd5VW56TVRXWEZ1MVJVVXY0elA0d3NK?=
 =?utf-8?B?SHg2V3JOWlhpTkFnY2JJOWt0VURMS05BTGJRUUJwMVFVdXlSR1F5YkppSzJ2?=
 =?utf-8?B?RVV0a0ZQaTE4c3RRRTJTaHRoU2JSc2IxWk10bXNZYW1UVGlWK2IrZzJ1T24r?=
 =?utf-8?B?NS9XdUZURnA1eDM0SitjK1M3aTVpUzYwZXFZaGxrZkVEZVVRTkM4WmRvQmJw?=
 =?utf-8?B?WStVSGxqRlRvbTR0WndBa0NKdG9sTm9mblNDbEJvdGJnZHcyeTBXcWdzcnEv?=
 =?utf-8?B?UVNTZ1BsSlNmMzNtdEVsT1k2ZlVoWklpWXVLbW9lcWpCc2l5RFV4NmVzNEZO?=
 =?utf-8?B?YmY0SkZJZE0zbXdpT0Nub0c2TnQrMWNONGNubDlVUzFKRmtGM2g4ZitZM3FR?=
 =?utf-8?B?YnRmLzNpUmJHRU1MaFpDdzBqcTBnNUsvZWplZG1yeURldloyVXRkZVRJbk1W?=
 =?utf-8?B?eVBzQis2WjJISDloRU1nWmQ2TVRncEtoc2pDUWdsejNldnJROFZjMGFGdUhJ?=
 =?utf-8?B?L3VPbnE0aEJQVFgxQnNxOVMyWnJwdmZoQmNVRVRtY2hXYm1jUm1NNko0YitQ?=
 =?utf-8?B?c1NZYWhtNDQzR1pZNFdEWEsvSnZRbGdoMXIyeWtHTm9rK2NkZm9HOHJZbjM4?=
 =?utf-8?B?SEMrdVBodjR3TDRBS1llS0pUYU9tTGcvRTJPYzF4MHBkTjhuQzJZU21aY1dO?=
 =?utf-8?B?akFoWlFHS0plczJzalJzUDFadHZhbkpWYWVGaXlaVEZhUWFEUWZIdXQyMDJl?=
 =?utf-8?B?SGRuUUpQNWN0VHd2RjdndWcrYUk1MUJadUFFRTRPMCtVcFVuY3FES1hQYzVq?=
 =?utf-8?B?SmtCV2w1bE1KaUpGM1lVeHYrSWFocjRLekRPV2RlRDdPVFVoSllhREVRYkk1?=
 =?utf-8?B?WW45amFLK09WbGdOanFBVzBuWitwR3ZUc2wvYXFKcG12QWorcDJlODJ2VjRl?=
 =?utf-8?B?UU1mT3MvVEM0SVV4V2VOdWNqTkpWYWtHdThMUENqSlVDVWd3U01RSW1yYjVN?=
 =?utf-8?B?RVA1MEs0TDM0Z0hEWU56dXNrV2w3OUhaMHh4L29kMHdsYmdXYkJYY3pDaVQy?=
 =?utf-8?Q?Q82WWj3EA8l0S4kBFvPCssY/hA676nEv4KdEy5R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dd7209-9e30-4560-232c-08d8dcd83fdd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:34:21.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yarW3jlFYHZ5C1LR+egpxkljEqOOR5SK761vvSQgH0VVdNcxqrrX4ETkLlzD0k0/QqVcHvBo0rhUC2jMjKepqM+sqbdWplAYfqUU5jUXP8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5438
X-OriginatorOrg: citrix.com

On 01/03/2021 17:30, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>> On 26.02.2021 18:07, Tim Deegan wrote:
>>> Yes, I think it could be reduced to use just one reserved address bit.
>>> IIRC we just used such a large mask so the magic entries would be
>>> really obvious in debugging, and there was no need to support arbitrary
>>> address widths for emulated devices.
>> Will cook a patch, albeit I guess I'll keep as many of the bits set
>> as possible, while still being able to encode a full-40-bit GFN.
>>
>> Ian - I don't suppose you'd consider this a reasonable thing to do
>> for 4.15? It would allow limiting the negative (performance) effect
>> the change here has.
> I'm afraid I don't follow enough of the background here to have an
> opinion right now.  Can someone explain to me the risks (and,
> correspondingly, upsides) of the options ?  Sorry to be dim, I don't
> seem to be firing on all cylinders today.

Intel IceLake CPUs (imminently coming out) have no reserved bits in
pagetable entries, so these "optimisations" malfunction.  It is
definitely an issue for HVM Shadow guests, and possibly migration of PV
guests (I can never remember whether we use the GNP fastpath on PV or not).

It is arguably wrong that we ever depended on reserved behaviour.

I've got a (not-yet-upsteamed) XTF test which can comprehensively test
this.  I'll find some time to give them a spin and give a T-by.

Without this fix, some combinations of "normal" VM settings will
malfunction.

~Andrew

