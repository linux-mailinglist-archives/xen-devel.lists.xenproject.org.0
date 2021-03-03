Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E932B7AD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 13:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92833.175018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHQBn-0006T7-Fd; Wed, 03 Mar 2021 12:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92833.175018; Wed, 03 Mar 2021 12:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHQBn-0006Si-C8; Wed, 03 Mar 2021 12:01:15 +0000
Received: by outflank-mailman (input) for mailman id 92833;
 Wed, 03 Mar 2021 12:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dD22=IB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHQBl-0006S2-Lj
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 12:01:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9940920d-26fc-4669-8ea4-3c05d91a4171;
 Wed, 03 Mar 2021 12:01:12 +0000 (UTC)
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
X-Inumbo-ID: 9940920d-26fc-4669-8ea4-3c05d91a4171
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614772872;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nllq/LR5NUkr2g40riYpZbZo/deabKkVCzcCfDWoVzg=;
  b=K5lkd+d/3T6dyb3BGQciCry0zf4hbBasVkUtVc8b+KDcoT57HPa0ozqA
   I9D5QlOclwAOwiZv8Ba/YjYQtuCXxAFLZAMPeJdiAAwFJAKmi7MNFckNK
   IQLqQvsqq3j948Tmjky9uZrgHh6PuA3muwTrEYBsBcn5uoMkl3/q5sOt+
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wUZhNSJmRzhrMDm2S0Xk+vjYcTOurCEAvsUG+CAEn3rWC8dPlh5S1MQb1aFhPeVheYxeIOt9TZ
 6AQMXN1aiL+LCt11YWG09MoafAx3h8o2PVmLtQlFhQ1lUmgaYZp353yRWBcy3iuQKlBXSmdxYp
 DunaExFF5RwVt/CT7PPyKCh7zJQ2u3dHR0FzBULnOuUdDFq90x9WTrEQUW4AAA63jx+7T1FDLe
 Ub+2FCVfCLmJGM/NmA9dV1zzJhiREzX+TZC4mfxKmnUo0aK+swVi92fUoauAjEWg5xr1U2HpF6
 f4A=
X-SBRS: 5.2
X-MesageID: 38790462
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38790462"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkIDvbVodf68MZl8MX2MPwSkewcAJACYfu4HCwrfSX1leR/sToSn0Ez1FoVjA/TIi+5cSe27pnDWKHYvpoxCHsYkY+vm6zoQsT6VhmtEp4AUe0zZlx/OYkJNHdW8i/anzi0JL7JpFHqqhxiXH0zFa/ubXlH2gX+ONmnYxoBrWxQAgttvDWFUkiHm02Jkkpl7973ECF1hqsJ4Q0EUQv7tX9AZBR6BE69gEbwS2L5mtaiFM5Du5MJwLOOW7lDNvbXF9FotAEdlA3obOhncwsiqknJNKce6mycls3k6jGuecrcK9rnvvJsBoqBLXVE58O0T0dh4vpoW1M1lPCEWR9ygFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nllq/LR5NUkr2g40riYpZbZo/deabKkVCzcCfDWoVzg=;
 b=XBfAkbfrOJAjqJKVtGOwQwJ15bI1NE35+pH9CsNZ78/xK26wSRw66ZAxFKdk8irSJkOlYNIqtFhH2L3IsDAg5ZGpMxQ07vaSTSO9Q/9puDQZya0PX18wdFdgxcmkkgcdT4lwGrytXHkP1za3fuRqCZIfUj4X72GXSg9aTxzNGaHrMsyXZ+/t1Q8k7uaxrjaKpXNt5bBuRYFQqB96cwr34D3NdNE4AjHi+Cb+Frl/Vcmg5EofFvZ98BlyARoFakz6DUOyGfoYbBk5EPTS3ZSa0Q/3By3gMIkjkt4SFZgyZ9S/hCB+y31hqh2H3Z4+P5bzo0/ty5Hji5+qaWKTgnPgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nllq/LR5NUkr2g40riYpZbZo/deabKkVCzcCfDWoVzg=;
 b=ZBrYbxQWaHg7P9eHJosbZBosB2bjFx9OvPO2hrx3ifiMItOUGEt5zRbnVrU8Zo30dCf31gxY/kfmcS103N/zFrDMaVDWBr1vAOpgoQu7J9A0llmOGdly96nVqM81x3YKnInhVFF+oS3X/if+1NXrwrD/BDlB0V5DvMnWWMckPUU=
Subject: Re: [PATCH] automation: add a build job with NR_CPUS == 1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, "Jan
 Beulich" <jbeulich@suse.com>
References: <20210303083318.9363-1-roger.pau@citrix.com>
 <5dda8f5f-0d91-e956-383b-41060ef8f3de@citrix.com>
 <YD95wJUFteP2o/yM@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2cc48689-2d25-dd14-e407-9ec996674e2a@citrix.com>
Date: Wed, 3 Mar 2021 12:00:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YD95wJUFteP2o/yM@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba9d2961-278b-4725-1e98-08d8de3bfcfd
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3622FDF2C2200404E8ADDFACBA989@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWdsTvZKC/tEC5E1hh6i2kOBtq6v/D40ID4Gnyx9dIQC1rklEvpgfMBEkiJGz+Cc4pzIaQa+//K3lGZAOGOr2W+05K9BdYKM+MipUJDUhtEnlVUg7169RHtQeNg3k6AGQ70CvQ/9L04V/mq2gtBZobO9Tz4S4fIraU/K7IzQ6RUKjmF3pDIGK0EvuHlqQigJqkO+QlkipleuVhvlZjgjhl7+9LUWx/rPaV0PQegnO3uP7Nu/IebhoVu9oruK5zMB3RssO4IJiCoemMFbwDd1Wngj4dhal/wQWf0btkgM4zbXclCQLZBi8/9grh1ccV+tl3k/BMO5fYeTByj6Ik7h9YsGhh/7jopekgca1Df1mXTGGbMlp+Nfi3NoegOKgQz1AGAMyg8ao+LzNFB2w4dJl/ZmuRIIMlVUYZdoBczGMVr4PA2dWu2a4VZUBtnDFTyEgrYofn+1bzCilK2Kip2/BxwPTB1Chfc3qAdDIUuVueVtRFG0jYrSm8Ux5pG9l3F6RuZDq0kAKH32ioCzNEhGC+IMRA7rzdzluplBwKvyAt+FLk5S/GuhtCQGdNrhlavPH024qoqY455nULj0t/L3jn5LPxCC6zZLHdVUprs2F5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(8936002)(8676002)(6862004)(83380400001)(6666004)(66946007)(31696002)(53546011)(66476007)(66556008)(6636002)(31686004)(478600001)(4326008)(86362001)(36756003)(2906002)(956004)(54906003)(37006003)(6486002)(2616005)(16526019)(186003)(26005)(316002)(5660300002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkZ0M1V6Z1FNK0F4YURpWTcxMHlBNWVUQUxOSkE5R205dXphbWN5a2srQWl0?=
 =?utf-8?B?c25RUVhBUFhpeGJYY21KNTB4NEsvMWI3WVJYUDJyZ3VuYVJhelZpakpLUVNw?=
 =?utf-8?B?TDE2WXo0TEN6N3VmdXhTUVRpQ2V3bjVDa3k2aSs0Nk5rOWlZR1FFMzFka3J3?=
 =?utf-8?B?SFhndmEwTEVyOXZLVW1STGk4RkVzUVM0UnNCcC9NOGZncDE3Nk9TVlVzTm04?=
 =?utf-8?B?bXdOcStjbHJzcjZnZHQwQTIvdUlYM2daNWphQ25lM2wva1dsWUFaZE83L2x3?=
 =?utf-8?B?MDFKS2M5ZzY2MUpTWmlvQXFDUHNmYWc5UkpGWVlqeUo4WEovdTNHYlZGbkY1?=
 =?utf-8?B?U1RWR0ovcVNaYVpQSDcyWUZWY3NaQzQ1N2c3NGRONWM5R3pzcnVyS0ZzMVpu?=
 =?utf-8?B?ay8vMU1xT1BqN3A2ZlZ3ZTA5S1QvSGZDS0wyNHU1a1U0NWpwM0cwUHZUZnhy?=
 =?utf-8?B?KzV3ZzJzdjllWSsxUm1EZytqSTJ6M3dwZElERHNzcmtRKzA3WjFJaWNzOHpY?=
 =?utf-8?B?bWl2aFZ6TlBXRFRQSC9xM0hvYXlWcDVQR3dpZWtORlRoUXBYbi9ZYjJOY1p5?=
 =?utf-8?B?SHUybmloazFVVU1YeTBpbjZkVytndHVVR05XUU9TeFYzeWdXUFdiR3l2YURn?=
 =?utf-8?B?OTc2OE9aY1BNMURqZ1BJcXBBZnQrdmRyUXUrbUhZSEwxTDU3ZEZTOUJBVkRv?=
 =?utf-8?B?SnBxaE81Yys5MjlGV1pLTHltSm5DTU92dVloUWJTa0tmUm43RVcwU1hGU2ht?=
 =?utf-8?B?Vk8wVXRXWEp3WVNzNE9yZTNRM0RSeUs1b29DWm04RkQ2NVRtdVlKcklGTkVE?=
 =?utf-8?B?dWRhWlpBZFNJdWQrbTJYcEF0OC9xSkZKdW84SHB3a0FrbjQxeDNzNXlXQkd2?=
 =?utf-8?B?eGsyQk9LNThuMjlBRGZ3eVRiQWZ4Q3VVUkJqZDVJaHJQZXp4d1lheWUyelpm?=
 =?utf-8?B?TlhKWDk0SHlZdlZrNWhXUVVOU3NjeXVUdElzekhpUGRiU1hUSUlmQ0d4Zk0r?=
 =?utf-8?B?Y2RFSGtrYk11NlZmUFR6aCtUd0N0RmlVSHNyRkdXbkllTnBCcUV5bS90bVF2?=
 =?utf-8?B?QVNMSWpSUUF0dEF5TFRDUDY3WnFzWk1Bb0tWQVZjMWlWS0NsbGpQcUJ5U1Bp?=
 =?utf-8?B?bUJqVWVYM1BXNllFS1FDWGVPU2FtS2VPYnJOajlkdnZZdkErZUdnREdNNWlv?=
 =?utf-8?B?RUZkMnFsTk5scjgxOVc0NHRCUWE3aG96b25Ba1RzOFo4dVROMFpsR3prRmNr?=
 =?utf-8?B?dzYzbnpJOWtlZjcveTRZYlZPU2JzZFBuUXN0RTF5WUowS3hFblkzUy9MTkxv?=
 =?utf-8?B?djBIODBybmxTRWxWQmVWbGpOT2xoQWRxd1NBaVVxSnNGdjB1dTZkd0U0a0JO?=
 =?utf-8?B?VGdWaVlLNzlmY2J5MXVCemtxL29aanJaWE81aHRiUDFTOEdMQStYRHhHa2lC?=
 =?utf-8?B?V0VUbjZoYmEzNVF4cHZHNUVCQTcrWG9EN2VVNE5PSW9PRTBqS2dkazJ6Ym1n?=
 =?utf-8?B?NnRWUTBuQUF5ckJLU2ZPSnNVd2tkSVl5YTM5blpsOXQ4L2x5KysraEptVVNw?=
 =?utf-8?B?K2s3NDBnSDR1NWgwdk4renMwMkpYNEJBUytLRDVWMXNveDVoMXNYMkgwdlJo?=
 =?utf-8?B?dlZ4ZHBnSnRpV2gxWDJqZXRvWTFic3VFKzk5b2FNS284WUUveGZJbzdZYStD?=
 =?utf-8?B?OE5GTEQ4VzdiQTlaUWtwcmc3QWhEd1A2YlFtQmtnbE9qY2o0alZaMDhpMW1L?=
 =?utf-8?Q?Mx9308FhTLLratfq3Vsr3nnNqL4CCQkgsRiXp1j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9d2961-278b-4725-1e98-08d8de3bfcfd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 12:00:50.4467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYT+4V973NdgLZ/NPQVNUONRkO20xDIoJvcmMkfsmurEgqbzG0OtPTYanFC76xyizSkbNT3Ue/29lBT1JVKw35hlF07WCNmdsqrzpPO1IwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-OriginatorOrg: citrix.com

On 03/03/2021 11:57, Roger Pau Monné wrote:
> On Wed, Mar 03, 2021 at 11:46:44AM +0000, Andrew Cooper wrote:
>> On 03/03/2021 08:33, Roger Pau Monne wrote:
>>> This requires adding some logic in the build script in order to be
>>> able to pass specific Xen Kconfig options.
>>>
>>> Setting any CONFIG_* environment variable when executing the build
>>> script will set such variable in the empty .config file before
>>> running the olddefconfig target. The .config file is also checked
>>> afterwards to assert the option has not been lost as part of the
>>> configuration process.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Not sure whether there's some easiest way to force a config option to
>>> a set value from the command line.
>> I'm -2 to this.  We've already use thousands of machine minutes per
>> push, and this corner case isn't worth adding another 30 minutes or so
>> per push.
> In fact I think those builds could be hypervisor only, which will
> limit them to a couple of minutes?
>
> Would that be an acceptable compromise?
>
> Not just to test NR_CPUS, but in general for testing specific Kconfg
> options.
>
> Likely randconfig should also be an hypervisor build only, there's no
> reason to do a build test of the tools with a hypervisor randconfig.
> Let me prepare a patch for that.

This is already a plan for the CI working group (along with other
randconfig improvements) but it has yet to be implemented.

~Andrew

