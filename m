Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C7198DCC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 09:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJBjU-00035X-Ij; Tue, 31 Mar 2020 07:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ZzL=5Q=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jJBjS-00035S-FP
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 07:54:46 +0000
X-Inumbo-ID: e2d397b0-7324-11ea-b58d-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::711])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d397b0-7324-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 07:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtGvgICZAmB6ZkrAPPo7L2WUzDLKksrWJklDBc4DKqB4SeZ3Z5H8n1oE5ToxzNgX8sFKKxr6zbUvl/CqnpghyVXpr7nsIjdBbXQnI8eIzs775wHlQqVlxw6rIAN6M9dxxBsxArA2NkiIQViZl0XWT7t544feJRpN+22jvvSO15sbSKucyEEI9R5l1xfUJAOEuV2982Ojiz/Qi+kKiLiGyRR9H09ARuFAts+jM6+rxhfEJrCdBzdSQO3rpyDP2MiwRBGmiIi8xe7sz2VliGkBPmaA+GWEKzg/C2vYUI++oXAQs9siD0tjbZr173oewgfVs7VvLMA5kUF7bQk7qAtCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qExz6318edWaypeGJ2/8X9CWVznrcS+O68lfdBry1nw=;
 b=FMb8FHTxTarWUQAlMrQ1kD//wBHTcDSYFSn2Mm4IVt/t4XCYw+mWYpVMA1c5Ozbh4b8b8SxyaIT5q3NHQHGh5+tHvdAcfIddT74OfCc6D+fQQkCY7Xjfe0BlOvyp/O7xxTMsQOKXLm1c1ITrZ9OO2+LtQhLFHmd3lwNUbqvwQpe53GccKXAstkHHkZNaXo5USvDga0nKRrEywivxFenjHu06sILct2yrAr4kV8xQx7QSHuWe9xfJnJEmO1RMTfUm7+3NwVOZLclLncKHMGDaRYKfRZ16AQwQu8ckPKeqARYm5k3Qm7f023AUzz6BHJmtaHzkpBCmA8kidfYX+J442Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qExz6318edWaypeGJ2/8X9CWVznrcS+O68lfdBry1nw=;
 b=ft21CkFxaiGRIPqZWW6GJKi63sH39VDXdkFvptpPe3faA4ig39MVHc6PqNDM7BevL0WZ7MyNeyd4VRDX+GL4Y9oyohKmSmRGT9t0yr9R0KGP/V3VpI9yhOfvFxTp2DXPc9+ZcuOyyI8eX78BzhE8yUQGJeLGSZHDqWlvas59Zek=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (20.178.89.87) by
 AM6PR02MB5557.eurprd02.prod.outlook.com (10.255.120.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 07:54:43 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 07:54:43 +0000
Subject: Re: [PATCH V7] x86/altp2m: Hypercall to set altp2m view visibility
To: Jan Beulich <jbeulich@suse.com>
References: <20200330065434.5952-1-aisaila@bitdefender.com>
 <47e96f1f-067d-470e-4796-b92956ca65bf@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <182c7207-6fd9-5b9b-0c99-ea31ee29b8d6@bitdefender.com>
Date: Tue, 31 Mar 2020 10:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <47e96f1f-067d-470e-4796-b92956ca65bf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0294.eurprd07.prod.outlook.com
 (2603:10a6:800:130::22) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.106] (188.25.208.5) by
 VI1PR07CA0294.eurprd07.prod.outlook.com (2603:10a6:800:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend
 Transport; Tue, 31 Mar 2020 07:54:42 +0000
X-Originating-IP: [188.25.208.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dce8eb0-5a02-4138-cff5-08d7d548c5ed
X-MS-TrafficTypeDiagnostic: AM6PR02MB5557:|AM6PR02MB5557:
X-Microsoft-Antispam-PRVS: <AM6PR02MB55578318EED027359E9088FBABC80@AM6PR02MB5557.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(39850400004)(396003)(376002)(36916002)(86362001)(53546011)(52116002)(8936002)(81166006)(36756003)(8676002)(81156014)(31696002)(4326008)(478600001)(7416002)(54906003)(16576012)(316002)(6916009)(16526019)(186003)(26005)(2616005)(6486002)(956004)(66556008)(5660300002)(66476007)(31686004)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D28GySwzGhMFaiR347Aol17RtgWviSBsok0yYE3idG3Qv2kTLErwkkzH0roz+2y6DUis4cFSmpzeOK8cuMuEMkPJGwTNbSYN25N0DMYrt3DhRMgVGGJkSattM8YlYBK1HHpD2xPi2PDJ1dElAv4s6qHF27ALN+Xd3EMq3KjGmVGASgSeBVypfC+59sO+BIxsw6Rq2mXxusLo4ekWiZctqd7aIvWIBLC0G0n/MGE/4hl2tABMgMBQ1IEjNpqPCO3cowoLxSUBzVfkdMF70/bVtBDeSy22jC7i54387BUeLgGBFr6Qp/lRtmdsRe1owFuQ2ZW0w4ug1hEgQK+2F+IrCMzTK8v4nrgdXgnwqxU4r1xXEVeARS20F4ew0aEqWIb7zdC8AogVYONR20vbehH9kafrhdnMBDghmoJjeHRS08y/L6NdpxETlBPxPa3/lnK6
X-MS-Exchange-AntiSpam-MessageData: EFc0SodbXyUCvgUJNO7NwJR0E3EWDoqwOV07nFZAy99DvK3nSC/Ny/TBKMfyUid/XGyxXjEwsDqSNkuz9UOtgdt7RsvD7s9YKe2JtJaRP4P5dkPbgrQFGv6VuQiX/aJWWMVjdVa3Ovb+K+/T9CALFQ==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dce8eb0-5a02-4138-cff5-08d7d548c5ed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 07:54:43.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ5GKATxWNwGay1tUubHijq8q82/muxv7ww9bEwDw+NQ8TnWIQhHlfJn7Xz3kVDZp/515qE7W3QFv0AYJjHhbQf5zDdDpuIjXjTJpPktizM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5557
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 31.03.2020 10:43, Jan Beulich wrote:
> On 30.03.2020 08:54, Alexandru Isaila wrote:
>> At this moment a guest can call vmfunc to change the altp2m view. This
>> should be limited in order to avoid any unwanted view switch.
>>
>> The new xc_altp2m_set_visibility() solves this by making views invisible
>> to vmfunc.
>> This is done by having a separate arch.altp2m_working_eptp that is
>> populated and made invalid in the same places as altp2m_eptp. This is
>> written to EPTP_LIST_ADDR.
>> The views are made in/visible by marking them with INVALID_MFN or
>> copying them back from altp2m_eptp.
>> To have consistency the visibility also applies to
>> p2m_switch_domain_altp2m_by_id().
>>
>> The usage of this hypercall is aimed at dom0 having a logic with a number of views
>> created and at some time there is a need to be sure that only some of the views
>> can be switched, saving the rest and making them visible when the time
>> is right.
>>
>> Note: If altp2m mode is set to mixed the guest is able to change the view
>> visibility and then call vmfunc.
>>
>> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
> 
> For v6 I did provide a hypervisor side R-b; I didn't think ...

No you didn't.

> 
>> Changes since V6:
>> 	- Update commit message.
> 
> ... this alone would have warranted to drop it?

I don't think so and if you provide a r-b now I will add it if it will 
be a need for another version (if nothing big changes).

Thanks,
Alex

