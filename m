Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7255190B62
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:49:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGh4c-0004EJ-OU; Tue, 24 Mar 2020 10:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aGIx=5J=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jGh4b-0004EE-0o
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:46:17 +0000
X-Inumbo-ID: af8a5942-6dbc-11ea-b34e-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af8a5942-6dbc-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 10:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSTCjliUY94k3SWyeN5kZYVXJmLjYDar/ZSsr+2/txH1xzH8LHmA3+1LqVmczjYblaGP+2O5NsTJiJ6yqgmENuI4ot9Y9YzWyLBKA6+f20ZmhcHBSZDn5dqObxcwkRjSCopmxe7VYBSw7Cn51B4GVQ4VpmDzFWBHTD5q2JyhGPJkLS64n6zDCJjRaeZbWy3BsW271bPis4df1toKzSsOkI2XWqewbOLr0z9VbjiAcbQcWOl9UXbpuEpCr4j/WYJUdkEheoqhXAKU1Gl3KEr5qghBECgvHQbCdJWzLsdNkWbVKlYTZWe9zI7giYXHSfJlA/OG8J/trNqRgSC6rwNHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWPhZ2Bv2928HxcsIiPik3lPDAsXQQfiQbAxBZpxp0s=;
 b=EBbjLd7N4iIviB/yXxA7pumRntsOFUl9Tdw8IhLUhqVXPUrukOW/+1AyomrC4YPyl5SEmHnc7i0tib5llPv9ZGlBNsQceeQmmc/xgvoS7bKoqJqI9u+KBdpOgxeCzsgfMtejqbShOenWISx8VoweWUU9DYgStN8Ub9aw0kPNQBZBsr51pO7hVcHs/Fc8KBq3it6CrsJs4cJDOiQ+QE3V6yg8gWAtME1iJdno03artpnVSseuWoeNOpOqQc5dSm/P4PIt6GQFeH1K8L9WrdqowarvAEGvxSChqROT3HTuVmOc7dOef7iNQ9Vkl4uxPF/rIMG+FgP75xPQFf5abV2vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWPhZ2Bv2928HxcsIiPik3lPDAsXQQfiQbAxBZpxp0s=;
 b=iodRuV/ZlS8F7Kkw0EdxTCiDMtreBjK2CPLgkL0g+hvB4N7mIEcgLCAk0OirhmA1wu7T2XdkZHV4SjfnR0/BsfaiSXmy5deNZPMC3nnS340DhQkktBHTxwo6avWcOBjK/ApNY5w6hEBDrkGHlFTBqnVt9FEFBueG5yqwI7+UE8c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (20.178.89.87) by
 AM6PR02MB5255.eurprd02.prod.outlook.com (20.178.89.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 10:46:14 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 10:46:14 +0000
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5B06@SHSMSX104.ccr.corp.intel.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <449a58ea-e168-6c1a-33f2-7efa0b9f5a7d@bitdefender.com>
Date: Tue, 24 Mar 2020 12:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5B06@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0125.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::27) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.104] (188.25.208.5) by
 VI1PR08CA0125.eurprd08.prod.outlook.com (2603:10a6:800:d4::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 10:46:13 +0000
X-Originating-IP: [188.25.208.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 775adf42-8e58-4d99-cca6-08d7cfe092c9
X-MS-TrafficTypeDiagnostic: AM6PR02MB5255:|AM6PR02MB5255:
X-Microsoft-Antispam-PRVS: <AM6PR02MB52559BA7C04770E327D79C13ABF10@AM6PR02MB5255.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39850400004)(396003)(346002)(376002)(53546011)(66476007)(6486002)(2616005)(956004)(66556008)(36916002)(31696002)(66946007)(8676002)(52116002)(81166006)(81156014)(8936002)(2906002)(478600001)(16576012)(31686004)(16526019)(186003)(4326008)(316002)(7416002)(5660300002)(36756003)(110136005)(86362001)(26005)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5255;
 H:AM6PR02MB5223.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aq9E12GpiLlmZbUyZc9oerbKrDkNLf2KsHoSt/Qg4SCRkVl+2USC7OlNIAtBpusf68gnua/yqJRWbSr96o0TJsMt+XsVJmO0qsjkxcUt1YZQHm2UFvtkI5cVAgRpGvzSqOPQgPWEi9ugL7vkGEw40gaF7+U+8bMjDHGRWFKrBkjX3wp5J9jpM6NbQXkDFQyp5SdawZGE//0kwF8De/Uq26HjwwE/U0Sh61LGFG92MGDNp2knvFLKL4SzFl+VGAggAjia593gPMDRoKOQ1lpLviLnra27DmhCw4hzf7ekcSRPKU5WQ8LMYYTs4jNx67P5dbXtvY4XHlgQkJqRDr6BHObK2T4xcnJDIbBYrhXh9WnowYqN3E4hdGlc+AXYT+Hyhrtb8vBuosE3LAdGl5b+eCmQxpyzSjKw8u7HFdFLOvN2J9eMI3Ub1HMPcn1K3+mP
X-MS-Exchange-AntiSpam-MessageData: oIJmnAhAG4YOkElb18aGMvamuQ2F1pM7wWJhfbowiA5VkqQuiwygNN7bSSDou5vZUwsm9j+bBF3cPfdavcsh7ZgEBnx88NNiN5wHb7/1I4/bgN+eGpy1AnfXZyKO+u5ieiS1OewlPIYVkAynSyqRCQ==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775adf42-8e58-4d99-cca6-08d7cfe092c9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 10:46:13.9956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFFaykX1RJkcc8j+0BUkN78MMFdOHUQmgpFq7v2eZESJBZiRBZLVM4JmO01SAvPfbIe3d6GWK0ho0TaABmLXILr9a8MPW6fkYqHiR3QqZzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5255
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


Hi Kevin and sorry for the long reply time,

On 10.03.2020 04:04,  sTian, Kevin wrote:
>> From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
>> Sent: Tuesday, March 3, 2020 8:23 PM
>>
>> At this moment a guest can call vmfunc to change the altp2m view. This
>> should be limited in order to avoid any unwanted view switch.
> 
> I look forward to more elaboration of the motivation, especially for one
> who doesn't track altp2m closely like me. For example, do_altp2m_op
> mentions three modes: external, internal, coordinated. Then is this patch
> trying to limit the view switch in all three modes or just one of them?
> from the definition clearly external disallows guest to change any view
> (then why do we want per-view visibility control) while the latter two
> both allows guest to switch the view. later you noted some exception
> with mixed (internal) mode. then is this restriction pushed just for
> limited (coordinated) mode?
> 

As you stated, there are some exceptions with mixed (internal) mode.
This restriction is clearly used for coordinated mode but it also 
restricts view switching in the external mode as well. I had a good 
example to start with, let's say we have one external agent in dom0 that 
uses view1 and view2 and the logic requires the switch between the 
views. At this point VMFUNC is available to the guest so with a simple 
asm code it can witch to view 0. At this time the external agent is not 
aware that the view has switched and further more view0 was not supposed 
to be in the main logic so it crashes. This example can be extended to 
any number of views. I hope it can paint a more clear picture of what 
this patch is trying to achive.

> btw I'm not sure why altp2m invents two names per mode, and their
> mapping looks a bit weird. e.g. isn't 'coordinated' mode sound more
> like 'mixed' mode?

Yes that is true, it si a bit weird.

> 
>>
>> The new xc_altp2m_set_visibility() solves this by making views invisible
>> to vmfunc.
> 
> if one doesn't want to make view visible to vmfunc, why can't he just
> avoids registering the view at the first place? Are you aiming for a
> scenario that dom0 may register 10 views, with 5 views visible to
> vmfunc with the other 5 views switched by dom0 itself?

That is one scenario, another can be that dom0 has a number of views 
created and in some time it wants to be sure that only some of the views 
can be switched, saving the rest and making them visible when the time 
is right. Sure the example given up is another example.

Regards,
Alex

