Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C982F7F92
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68340.122356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R3H-0002y3-O6; Fri, 15 Jan 2021 15:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68340.122356; Fri, 15 Jan 2021 15:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R3H-0002xe-Kb; Fri, 15 Jan 2021 15:30:15 +0000
Received: by outflank-mailman (input) for mailman id 68340;
 Fri, 15 Jan 2021 15:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0R3G-0002ww-JO
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:30:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 116d9e1f-b26b-4a31-92d1-f9135d76cda0;
 Fri, 15 Jan 2021 15:30:13 +0000 (UTC)
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
X-Inumbo-ID: 116d9e1f-b26b-4a31-92d1-f9135d76cda0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610724613;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w1FGeOpC3mIMKoWm+85szcdLZ6srymJRhOw+1oztu3E=;
  b=NH61HeeTCeHpddulNXE3d5h7EtzT8rzCXX2oSWIayGqdkUBzbWeI0HtI
   iylbR2Uh+hjLB5dqqH36KwCbWTio/DGkp0ov3wOLgyvjsSVlrqr39+QYQ
   lIjBPutGB/EgWId+hrCT3IF/+I6r71mEsUsoX3BQH8p9zuFk2Mz2ZDrHE
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1HfR8dv0eodhdexUfTXwHy1DJYxpHqUbQlOVpALUn4qYAIRMFuigdjj8Ka3Lzcmm7AVJji9H1Y
 kRXPacgHSp3id+fUR656x8xTqvBLz3120GTsSbBQmNlaB2oKuh7DQOXPqbQ7JGyd7JEEq0+6xh
 xavZsfuiSOKIAhJD26lMA9VAG1hnE8phnpx2SMysZzbIcCHJGhLWW3BNJXGrv6eZqu1CW8FBg1
 YiHExzoO8vc2UB7UqzAr1eVlnhZMAvaN1pzphfjUKNwRi0a6M+LNV3pP1YAMUFTba9z8JoJP+3
 WXc=
X-SBRS: 5.2
X-MesageID: 35171299
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35171299"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFpuumjFCcLBqc2gVXgfvrKp6joHjcxRErra9lpCbvdd+8+Uu8dKrvD3YgMXSfWm6G35vvcUwHtEAj0zVgr9+OirNiYJI6IeGz8ABQM9e8nsi3Outj64IA0uoIZRkWWp+OBn2aEN5c0wK1833Oyc0B5SIBe0weuGFj2i15teQQUt7k96kndvO/K1IRJEwcYMc3oVbpepO9pm4+txyXTEJyg+a1RnSxNTIeZeetN70tp+9ut8WCm0BfSn5neiyxHj1pTNRSZD9j53YPcnFV0qs+BphOgoRZ2rsZVqp6w/JFl9IiPxQs1K+UGxe4IqzLOHD4EyT2ftPKu0LiWwylbTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1FGeOpC3mIMKoWm+85szcdLZ6srymJRhOw+1oztu3E=;
 b=AFyIhimMrvgBteEu53tKkv5aNGNPxNlXP0KMGfnSZ8G6EJCVFHy2aPxpElJQmgZDgD8oPfF8My+2ObdjG+gwAp/QIRK21Lz/b5l8QbJkXgOnyiOA/6cn/mZV/mvItFUjqpDb/wL5inheNMoWc1WIvlJ5j7EQ03rbk7VKJ8sXT2VRfdhXDvQTCoR6elh71pZQAyGFy0/5tVEVbVmwql1AEczGkDo5HAJeB1yaaSSh97NP+Jxe4RuSTgnxI7FJZyMivoYhHC2g+WgLIRamz7zeUHQCZfxL+x0YP5Pyd8FT6m2BJvop+fEw6j6hlaj+4pofmCoArYz9X8tBIgAjgliL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1FGeOpC3mIMKoWm+85szcdLZ6srymJRhOw+1oztu3E=;
 b=Oa1sqserun/1icLwau+t/NlSKSgDHS2LwtFDRND/LkgBnWWu5d8neX09wyaQs4IddOm4Mt9Mbmx1shas9j8yRFUm56rXlALdRRhD0pukfZE9zbU4PQLyXaVe6MqoOi6GVohFrHnrAV+YJjJrUfTXX8SMKh1V/yqGK6pLdLKaVcM=
Subject: Re: [PATCH] NetBSD: Fix lock directory path
To: Manuel Bouyer <bouyer@antioche.eu.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-2-bouyer@antioche.eu.org>
 <20210115150919.dolwtbqwbochgp2v@Air-de-Roger>
 <20210115151306.GA8765@mail.soc.lip6.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84f15cb3-cece-a52f-6de3-5bccd6a04de7@citrix.com>
Date: Fri, 15 Jan 2021 15:30:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210115151306.GA8765@mail.soc.lip6.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df815500-0452-4c20-1a5a-08d8b96a7243
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5632:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5632B86C43F5C26EB669E1CBBAA70@SJ0PR03MB5632.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/EawznxdkFpp7ChIC5/+j/Eghe5YnmTmFZgUS2/p9lWwXLTrEN5Kal+nPwdhDIQk4dn5NyhszMJqdIlioUQu4aJl9fnMqPIGIQD4bcalSal7X53qfdlgVKV/I7PmBueXzr1NaR17lICi39/TSsFxjQG9kd5kTsK2lZBzHu5Nmx/elXCfbSzZ98tV9fNesjk1X3ip3gMJknAmhAgSUBQh8qAdnNFNHjgzDBjj6hGkS47f7n3SVX/66//llLrpSTB09S6DU3ySbRtFhtEN6DgWFBDDBNAu7dkjYqkq3vosexjzNAAajMSGFyoYQI62KgIfYx24hYVDw0MKFURSIrMhPLic22ullGWh2ZpYQo30cUafbyh9hBLqenXkke3CIVN5pjdh44jBe6T1Vc5fUEL1ctz6z1GQxWig1ziJcZ2i0zsWdW51O1sXTHuBOMNHJtEBCEVsRntlrjqdyb79KFW/ne3AhfOaMDKRbIyQevyMUZfIKF4fEnr+gBcWXPFG4Fj7/adp80q1ZC6hfLj0vZnAoaMOXRXcyYFlTdsmeTtjHemFuxuEXLmD5miUArq/ESGaqJWB/2Gy42ITO/9V6+fWJcfJP4wS0Y+MMb/BssoqNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(478600001)(6666004)(6486002)(2906002)(36756003)(4744005)(316002)(8676002)(5660300002)(31696002)(83380400001)(86362001)(186003)(16526019)(4326008)(26005)(31686004)(66556008)(66946007)(53546011)(66476007)(110136005)(16576012)(54906003)(8936002)(2616005)(956004)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVNEK0JhMUNmbzRDRWR4N29KZGtLdFlWNkhvc3MxR0JPRTliMXo0dDZBMVJ5?=
 =?utf-8?B?ZWM4RGlyNDFTd1FXRGEyd0dDRkp2QjFwYktIK2llL0NFcUt5bFB5OUFvMHZT?=
 =?utf-8?B?Sld1d01KcTcxMExXMVkyUTU5MDM0enVIQlQzbG81ZDdyK29Ta3ROWThkT0ZP?=
 =?utf-8?B?RG10MnJuMmVUWjlaZHVQeitEeFBRMHRSTXFtTWxNVndaeTgxUlgyL1B0TVIz?=
 =?utf-8?B?U0JTd2V1SUpISHlicHBqUW1YTTc3dkQ5a0FYQlkxdm9FWkdoY2xIeVhLTDhI?=
 =?utf-8?B?eXNrUlBqZmM3OExhYWJKakREZGhKOGFmejlzRUFwdUlBVjJtWURTK0FYeXlU?=
 =?utf-8?B?VFlWSC9KRXNhWENnU3oyd0N0MUZEMnNFN2hGUTlrNFYweXFSL2ZEd2c3ck05?=
 =?utf-8?B?VEZMQ3BOOW51eXlRNytXRHdhU0RrOW1CbkVFQ2RLZk9RZXhKSXl6dlUxUHRG?=
 =?utf-8?B?a1pRQ3F1V0JXTHN6SFVTZ2VmYTZ4Q1lFOHNtMjAwQmFTRDRJYURLL1cyMkdx?=
 =?utf-8?B?aE1mbTlSWXVrTm5rTUJsZ3Q3dDQ5RndCZE4yZWkxOGdHRFgvdWZPUUlYU1hr?=
 =?utf-8?B?QzNBcUVycW44aGRxc1FwQ0lwTXdtOUJnYUlJY2lwUnVKMzh1TkY3bDdlQXJG?=
 =?utf-8?B?dkZoa0dQVzVGRUsyc0xXdVBsRStTd28yRnBuSGNrU29mK3laVWQxbzlGdWhK?=
 =?utf-8?B?eWxaSFF1VHBtdFJ2M05WQ0tzNHdHRDJoTUdKdEorRThQS2x2MTNDVFJ5UkVE?=
 =?utf-8?B?ZUlrNnZ2SklrTm9hVHN4SkFrb3lnL1pkUGxhQ05UTC9JZXc2VzdQNkFkVE5h?=
 =?utf-8?B?eFhpd0h4aEtuS1NRUXk5dHA3SlhtVmM5OC9uY2xjTW9jd250VU9QSEp5SmdR?=
 =?utf-8?B?L2JSSTI3b2xKRjZWZ1llZnp6MGQ0R3k0OEkrcXBSdEUwa1JPS25VZ0dlOExN?=
 =?utf-8?B?TGcxb0ZldHZpRFFCUFhqd2ZMTm9Ia29ITlFDV29sUUFFV0YyZkFsT25iSHpu?=
 =?utf-8?B?aW5GNklRa2JUUklIb0VjOHRnWjMwL2dzczY2ejlwdHNzTGpNQU5CaUhIRUZK?=
 =?utf-8?B?MzdYSnp5aXdEZ3orODRjbnpLcTliaTJCWWVhaEUyUEgydFp5OUJkRXdONCtI?=
 =?utf-8?B?b1pzUXB5ZVExYUh1d1FSanE5S1hFakdxa3cvZXBsZ2NUL1ZxZC9qYnY1bkpy?=
 =?utf-8?B?UU1KSXM5MGFhaUdtWFFwR1dDaS8rUHZEOEo3bGVJMy9NM1VQRkdKUXEwbSs2?=
 =?utf-8?B?UlJ2b1NLRmtrQmQ2VzBiaFJGMVBWeHNsaG5vbjFoLzRXVHVYVGZ2R2wraTkx?=
 =?utf-8?Q?aJA1TIMrKDAAb3MSR4gW+Ixs8AbGEFRSnf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df815500-0452-4c20-1a5a-08d8b96a7243
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:30:10.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzcJ1y4of//LRTyO0yCvoWU0fpII4W/Lo99zlkOaMiE65RyXmuKnqdXI3okrML2l6590CEWZGpenkQd0Pl2tJ2F8mXhHSKBY0AWw7KJMrCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-OriginatorOrg: citrix.com

On 15/01/2021 15:13, Manuel Bouyer wrote:
> On Fri, Jan 15, 2021 at 04:09:19PM +0100, Roger Pau Monné wrote:
>> On Tue, Jan 12, 2021 at 07:12:22PM +0100, Manuel Bouyer wrote:
>>> From: Manuel Bouyer <bouyer@netbsd.org>
>>>
>>> On NetBSD the lock directory is in /var/run/
>>>
>>> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> thanks
> I already asked, but ...
> should I resend the patch with this tag, or will the commiter add it itself ?

Please accumulate tags yourself, so that if you need to send out another
version of the series, they're already included.

However, this patch is trivial, so I'll commit it right now.  The same
might be true in practice of other patches as well.

~Andrew

