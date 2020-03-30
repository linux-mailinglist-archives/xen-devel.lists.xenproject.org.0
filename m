Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97677197483
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 08:30:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jInrq-00056F-EB; Mon, 30 Mar 2020 06:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFsW=5P=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jInro-000568-H5
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 06:25:48 +0000
X-Inumbo-ID: 48da1470-724f-11ea-8e86-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.95]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48da1470-724f-11ea-8e86-12813bfff9fa;
 Mon, 30 Mar 2020 06:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+cM3qKwIY4ccWYUMFNndPmFleq+t6BOu9SOC0JOOqIaMj3SgIebTnEy2cLN4SzHlDt/HcNpKhfr8VKG1Ve2kTmeu56tah/Qf9cKh5tRXS/aXojiraJ5NizMY9qx26tVBMPw/kVlqVbiaNJGuEfDXZMum6My0j8ycpSduCerPDcqeuEiSMab9fRwj87yg68R8UcCWBnnlmz8h9CfoGWjak91nu/+Q/9ap4GhZATHFVtG9BkcmyWRDx00RW1OO11/d6c8SyseBzFmH9SXhSkd95dMqEIFRJd0i1pG8KF1L4Mp58cgcId/WRyJhSGjWVK/Y8VyASrDfQ90xf/mlasjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBYmWlH5KtNxldmisySPoU0rmwYsU8J/5cYIGDTwJVk=;
 b=f5SDSw81QnIlvu1XWyVKilUB+Hhx8UimTC+fFHNg84iLlYYQDP5PdYBnCmHvDyPstAaD78bV34Vu6hwyI2kPeNXVRMN/GIsVBRokNBHC9POI2iMkp2U6Uc/SSK9pVuY4I7xjQjO1FWjpMDSl7TYna9UMA4tLYAYftbh0yv8peeYWBqOzVw60/GwmNLQ1dhTBfutXmIw8fOdTJxI9fDoUzNmtMMUi7cYSw9fiBp7jndiAOSYXArVQCFep8DnCVa1UdhYTfixTbuIS4cTE85pwbEqwXOkfdO48gCMtS3FwpXKxergjTX0PzvFifMp6FjeRe9sDdr0wcB2QzverjVPDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBYmWlH5KtNxldmisySPoU0rmwYsU8J/5cYIGDTwJVk=;
 b=lhOliRqqZWzlbkN5GGvu0QVdUXLYakig83cCZBjKyguMJkJnHQMNz4glbUAnnaQGL4Zio5EfqEqWTBEi+4qqkSzhIccYUY+Co28Xo47ZIioRVCXBOGWTMxLfXA0fV2nphaHVnAciivQiG/6/FfhnBxASv2uVmu0kqg6H/gwKneY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (20.178.89.87) by
 AM6PR02MB5541.eurprd02.prod.outlook.com (10.255.121.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Mon, 30 Mar 2020 06:25:39 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 06:25:39 +0000
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5B06@SHSMSX104.ccr.corp.intel.com>
 <449a58ea-e168-6c1a-33f2-7efa0b9f5a7d@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECA76@SHSMSX104.ccr.corp.intel.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <de6bd451-2b56-1fde-893f-9d89120d16b3@bitdefender.com>
Date: Mon, 30 Mar 2020 09:25:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECA76@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0202.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::26) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.106] (188.25.208.5) by
 VI1PR07CA0202.eurprd07.prod.outlook.com (2603:10a6:802:3f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.11 via Frontend Transport; Mon, 30 Mar 2020 06:25:38 +0000
X-Originating-IP: [188.25.208.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3994130a-6558-4692-d2bb-08d7d4732a32
X-MS-TrafficTypeDiagnostic: AM6PR02MB5541:|AM6PR02MB5541:
X-Microsoft-Antispam-PRVS: <AM6PR02MB5541C04879778209FB77E89DABCB0@AM6PR02MB5541.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0358535363
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(366004)(39840400004)(346002)(396003)(136003)(16576012)(31696002)(956004)(110136005)(26005)(8936002)(7416002)(53546011)(186003)(4326008)(2616005)(316002)(86362001)(16526019)(66946007)(36756003)(6486002)(31686004)(66476007)(81156014)(52116002)(81166006)(5660300002)(8676002)(36916002)(66556008)(478600001)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udaTDCwho1VXPnLPakLNf+5lSE4JTYKCDaFs7gyzEu+RrCjIxq/wL8huEkqSsCZbw21V/pz7dd3EvlQJ8XR0aJj3tQNh0dZHo19HuJw0AbGp1FiWH5qBTO70WL5IqYUzQF/J1fqOb6eKrzjFH0LHAuL1RQggzSVNmEgmqgQpvkgsNNPUmzNwovNb+YN9ED6o18v+rQniZC+XLZZEK/a16HNNK4EYRP1+lztElu2PZsDivZSW5dpRWmcEcG+B8NGjJkXubg8/2CoTnOl8jdgMXtqVQW27a01uw5Cojh5N7he10H78rOSl5nwT3H+Xx9KXbBNF5rmmZqdva+LtHor6zHHeRIo7k5O4bShUoSlvzweTOHPb1U2OCUvJLIfX09ai0nRcFsz1ydcmJFXn+ZLmWU+y8ah4PpoTqqElqdetf9rndiiuoyEe8zJ4uAGvHztW
X-MS-Exchange-AntiSpam-MessageData: mp7GlPhGxx2VtYPdYnVwIvPoZExrv9BpcsMqXrGyyobgU7YtZRafdPsxwZXoDahtDXijy1xlAD3jZOa5cZ1vpX31A1KNwvW/HzYe+fQBlwU9Gdd28Jv7tTdCyf54mnBkD8/z1ek8h1a/QTAEONyMlg==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3994130a-6558-4692-d2bb-08d7d4732a32
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2020 06:25:39.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIc+U2H8PYJ8VqLPy69h793TL7HPpdXB90Poe4PH0YCWv2HYUXoVszTmCrxZav8TDGqXx/NNXrW2fE0+iwxk7ZN5D5hDH/boVdQhlwHNTAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5541
Subject: Re: [Xen-devel] [PATCH V6] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 27.03.2020 04:30, Tian, Kevin wrote:
>> From: Isaila Alexandru <aisaila@bitdefender.com>
>> Sent: Tuesday, March 24, 2020 6:46 PM
>>
>>
>> Hi Kevin and sorry for the long reply time,
>>
>> On 10.03.2020 04:04,  sTian, Kevin wrote:
>>>> From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
>>>> Sent: Tuesday, March 3, 2020 8:23 PM
>>>>
>>>> At this moment a guest can call vmfunc to change the altp2m view. This
>>>> should be limited in order to avoid any unwanted view switch.
>>>
>>> I look forward to more elaboration of the motivation, especially for one
>>> who doesn't track altp2m closely like me. For example, do_altp2m_op
>>> mentions three modes: external, internal, coordinated. Then is this patch
>>> trying to limit the view switch in all three modes or just one of them?
>>> from the definition clearly external disallows guest to change any view
>>> (then why do we want per-view visibility control) while the latter two
>>> both allows guest to switch the view. later you noted some exception
>>> with mixed (internal) mode. then is this restriction pushed just for
>>> limited (coordinated) mode?
>>>
>>
>> As you stated, there are some exceptions with mixed (internal) mode.
>> This restriction is clearly used for coordinated mode but it also
>> restricts view switching in the external mode as well. I had a good
>> example to start with, let's say we have one external agent in dom0 that
>> uses view1 and view2 and the logic requires the switch between the
>> views. At this point VMFUNC is available to the guest so with a simple
>> asm code it can witch to view 0. At this time the external agent is not
>> aware that the view has switched and further more view0 was not supposed
>> to be in the main logic so it crashes. This example can be extended to
>> any number of views. I hope it can paint a more clear picture of what
>> this patch is trying to achive.
> 
> Can VMFUNC be hidden and disabled when external mode is being used?
> or is it because the mode can be dynamically switched after a VM is
> launched so you have to restrict the views in this way?

Like you said, there is a problem if the mode is dynamically switched.

>>
>>> btw I'm not sure why altp2m invents two names per mode, and their
>>> mapping looks a bit weird. e.g. isn't 'coordinated' mode sound more
>>> like 'mixed' mode?
>>
>> Yes that is true, it si a bit weird.
>>
>>>
>>>>
>>>> The new xc_altp2m_set_visibility() solves this by making views invisible
>>>> to vmfunc.
>>>
>>> if one doesn't want to make view visible to vmfunc, why can't he just
>>> avoids registering the view at the first place? Are you aiming for a
>>> scenario that dom0 may register 10 views, with 5 views visible to
>>> vmfunc with the other 5 views switched by dom0 itself?
>>
>> That is one scenario, another can be that dom0 has a number of views
>> created and in some time it wants to be sure that only some of the views
>> can be switched, saving the rest and making them visible when the time
>> is right. Sure the example given up is another example.
>>
> 
> Can you update the patch description and resend? I'll take another look then.

Ok, I will update the description for the next version.

Thanks,
Alex

