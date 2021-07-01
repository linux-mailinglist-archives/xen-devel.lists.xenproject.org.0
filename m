Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143E3B9092
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148612.274630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyu6F-0001ls-8Z; Thu, 01 Jul 2021 10:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148612.274630; Thu, 01 Jul 2021 10:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyu6F-0001k2-4k; Thu, 01 Jul 2021 10:39:15 +0000
Received: by outflank-mailman (input) for mailman id 148612;
 Thu, 01 Jul 2021 10:39:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ+h=LZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyu6D-0001jw-IL
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:39:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7fa66ee-63d5-46cb-a6c1-0a4362cdce9d;
 Thu, 01 Jul 2021 10:39:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-n8oveD0ROeKPuBcTvYZ7xg-1; Thu, 01 Jul 2021 12:39:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 10:39:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 10:39:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0117.eurprd05.prod.outlook.com (2603:10a6:207:2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 10:39:06 +0000
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
X-Inumbo-ID: a7fa66ee-63d5-46cb-a6c1-0a4362cdce9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625135950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0xtOFMSUTTAQEmkk1wxyYJrt+czH7YUmCcT1A65bl0=;
	b=XtPw6nwZixxZNpDrjNDVIxhboZXNpBwyJCyK7767U3Kb01nr8tnJOPVvmaIm0dzpUK3JRI
	h+x430LSTCa3AKWzLrTSmQLDrR3PrsTwnb7hTAiKum6Pm1ueSsIfWpFuELNwn88QHJLjj+
	nF46Lff2+LI7VkA/WWeTvnFl2k9rAYs=
X-MC-Unique: n8oveD0ROeKPuBcTvYZ7xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNZkTjo0MY2ruxaD+3erLgT7+G3Ew0Kor0OjbuqI5SZ7HdkCJ6X+kpqCue+99GOO/11CgVPCiErX9ZE478yJesA+n+LVmP7WRjX1L1gXulvD0dADo9yUAAxSIHXjT08Na3HrfdIBqTBOArSk2S8L3AVZAcBXCKGhw4CF6QDPqPD+MEE60+CfdxPO4SwWuV8az/I05b4GQ2XorWPqGPVMYEwd44DeaoB0i0VjRmNMFd6AFYv+DbAbKjC05udVRV1rFgixPPo4VqF639BHmaHc2vqm571ClxVOeRIAb7aEFyC2jTdI6KjqZj8GIdOsdL30z86Fuy8MTO8212cMTl4pXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0xtOFMSUTTAQEmkk1wxyYJrt+czH7YUmCcT1A65bl0=;
 b=UqbT22COKc+pYZJOP0m6HrZZegXz8ZOJ6+VHdsQdtrNx48BItCpojTy1DP893zCyqRvE0JbHzqshAmuPqy85c9bHkO3bmLuGio9EM9Y2iwu7Era9sb1vnuJG8VyBZWYh9MNKfXzXwT+0QsCru6q70C3iizmPUibuzGEtBRxsIy6CSs1SWWnSPfP0qPK7n1O6t9D8auCsUBI068bP5fYoEiHh2cUsxXVrTSf1fn3JLTOVVMgNMnsMXsGzS19RwbOIjeOWj3gPZCqfDBqzqwwu1XxzZZpaaGuSBnn4OVFwJlHd7qNNUBDs91wOIliq8zNPRwU2RhzKyRXz17WY9mB96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore
 maintainer
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-9-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
Date: Thu, 1 Jul 2021 12:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-9-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR05CA0117.eurprd05.prod.outlook.com
 (2603:10a6:207:2::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 981d1cc9-293d-4264-dbd7-08d93c7c7417
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5599BD8DAB7A1A2244E9FA9CB3009@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y+/CU+GgGyuzU5w8K515II4xYotgvSuXGuLGeG52Zu4WPau6QF44c94bfBdZfN8OBZy+0eWyNkoEnA4fKAZmuTBt4x+yw8Edyhc+p9E7eQMEgQZjbZizJBStIpGpcuLcQTuxvc5nIGWSu21LDQrLiny8KjKd/LIU7BUI3V0znzlnRQXL7ceyX5GvMjWsJkWtqpqi7135doWRl9dSQoInv51OSejL/1GLPJMYukZX6IchCSV2lDYtUDOETPbUAcMIAzj7EXKaO4zqKJoglvAsNPMB4ZprTt9qXBVLKQdogrbzoHX4FU8A6AL/Ox/zxppvPEHrivYD3sZMcdwARs8tKLlW4wvCSMm5KcMkCE1eaYRF9CT2c2w9hidKjJHcVoId+sYM6YNpHi0P/ydJMBloHN+juZv8SKDjSvBswId5woTxWRFIRbAZCNaQeXhrgWiJWNbToB5Xo0QAQHFimplSrd0ZxNMgxjre4yshoOmVRTLG2zp8Y7OD6mKcJiREaMdWUUYU+AlAm8HDu6v8fpehRaqquzYQzJN2xITwfFceE0V+tMHjzRH7jQPGFHxxpd7IcFyrCWhu3c/tsYpYqUdD88imrLmBxHFkYCK3mHWnFg6I0rdJmBukdc1qb8iv47iPF1r8cz2CXGfITX+t/0BUA3Hn4Mfy08hydIf/SCo5eMG/vw4yb7JVq+vFCwyoeRmzx/t8k0m5k86lu6CxLesyDF2ezZf2gOYb/O7VO2vrB5u0H+FnTabWUTHm8ZV3kE2x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39860400002)(136003)(376002)(53546011)(4326008)(5660300002)(31696002)(36756003)(26005)(16576012)(86362001)(316002)(6916009)(54906003)(8676002)(478600001)(6486002)(8936002)(66476007)(2616005)(956004)(31686004)(83380400001)(186003)(16526019)(2906002)(38100700002)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUhHTDFaUTRiMkhLeWZwTVVBdnl4UVlOYzR1ZWpHeDBhTTdsaG5UTGxXc3Zu?=
 =?utf-8?B?dlVkZFpuRkpreHdHSUxHa0dxS1ZwRm9yRk5GOHR5UTQwYU5jQWN0akNpSmc5?=
 =?utf-8?B?N05md0pUQ3gxTE5Jd1ZhL2l6RUxDY01OcWphT25pd2pvZTI5dnVGc2NiY09Z?=
 =?utf-8?B?TE9QVEpoNXpraDVUL3ZBNUxLOWdrNmNTUVd1THNaNS9Ic05WQjg5VklHWmNE?=
 =?utf-8?B?aEkwanVoWkdIVTgrQStmaGsyd0lRdnVmSGlmVHdxRUdDazBHUnBMUXV0ck1Z?=
 =?utf-8?B?YmtMYjJFN1ZOM1R5b2JUV1lzc0FNQm5FSzBlT0hHcXBqakpUcTE5Z25mNmVN?=
 =?utf-8?B?Y0QrMkhESmdBSXB4RnZGTEdvSVlqZ2ROdVpmdU1pSFJob0Mya3VmdXFUU0lX?=
 =?utf-8?B?a0xHWWt3dkJhZWh3Qk53aVg0WEVrNmFybXQyUmZEbG1obzZrWmdKTkhXcjNK?=
 =?utf-8?B?Vk9YaWhmNXZOR2xaYU1JVmcrcTRpYnZzeGZlaUJtUjNubC9nN0g4dFYzTnQ5?=
 =?utf-8?B?MGt0SEFKdWsxYlVDN2xCNUpHNHc2eUFma0lPQTlqZmxCUUtCRFRKRkU4Ylg1?=
 =?utf-8?B?eEI1SHZPamVTWFA5bWo4M090NFFQQkZEMGI5eEI5WDFMOGFSNnI5RXRnc2Nn?=
 =?utf-8?B?ZEl3RzlGMnRZcjlsWmcrL1hGT2ZKcnV1eUJ1S011dVBmOFlwTWhlSHBSbGtO?=
 =?utf-8?B?M01hSWZGTklCbi9iOVhDYzU4eXBIOVdyVXNXOHV6OFVqcVJBRE1vQjE1MFVD?=
 =?utf-8?B?NWdNZ25ac3krMkdIUmVnVTk3MmFsdFZSZWtuajc0SWoyZ3d1TUY0SmJCcnNB?=
 =?utf-8?B?SlU2emdmT3lGai8vZm5ZSk5BL1dkdTJ4TytURHFJVVBPWkpoRER3azVQMEpq?=
 =?utf-8?B?SjhXTWdYOVFzM00zaWpReWNqZzdjRnNjN1VOV2ZGZEdCQ3FFaEpyZVlNL09I?=
 =?utf-8?B?KzJLTmQ1eDU1VGdGdzM0UEtwUFVXQUtSbE5wanFDSFd2NjVJWXdOMGgzSG1n?=
 =?utf-8?B?QzVLdUI3N2tVbHpwTTFsMFp5V0syWE9TZXVnLzI1LzlqTVAyRUphT2tzZG05?=
 =?utf-8?B?MVVENXpPeHJOU3JjaU5DVU1QcXJ1YUIyMXA4bXNBRjZmSFVNN0VhdTdXUDYw?=
 =?utf-8?B?d3lsSkhGalY4R1psUlYxckxzdjZRSzlEcGREWitidFJzdFdNOU9rSzdqRUVt?=
 =?utf-8?B?MWJvcnBITkY0NkFpbHlVRE8velNHc0FJRjEzeEQyVWk1WU1teGUxSGJxV21s?=
 =?utf-8?B?RnBMMDlHRWdURzZrR0FrNTY0STFpNlhpaXdCbGtVVWRucXdNTFMyTmNROUhz?=
 =?utf-8?B?Y3p5RkNvYWdyNG1BTXlHYWFRUFpESjI2VGtpckFqZllzVXpZNC8wRkloaUFS?=
 =?utf-8?B?VUN4dUJhMXkvWGdFU09qQnBVY0o2dHp1bUhSR0dweHQ1QUt1SVkxVm14NXh1?=
 =?utf-8?B?ZXVYRGVKUXBvRks2bzJocVVQeDlzcjA5YUlWVjZzL0FidDdrbDhaUGJnS3VY?=
 =?utf-8?B?eThIQUJ0eGlJdFJJUU9uaXg1cU5jelF5bHh0K3U5b1FWZ1RtcG5OTVEwcFRC?=
 =?utf-8?B?S2FGRU9BQmtRVTIvalEyUFZPR2hGVmduSy9wekpYclJaQ2pSdTRkWVhsOWg3?=
 =?utf-8?B?OUVGVUtSdkNhT3phTVZjRVRqUWd2YUhBVWMvVmcyU01lbE9raGhpd3k3dkZ0?=
 =?utf-8?B?SEpzS2ZWM1J6K2V3SDN1RFRUbzZsWVBmbi8veTdlSmhGYTdrQlZFU3pkeWVk?=
 =?utf-8?Q?6yyau3qIOP5vLs1NYt6rS2jqkyGpObDfNgF709o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981d1cc9-293d-4264-dbd7-08d93c7c7417
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 10:39:07.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqMCRx/av09Rv2Z61n9kfvyYoBQw5pGnL7ixf+HRXtJ3pwtwq/eUfZNz9ZZKpBbH6w57KpsgFvAN2UrmU4YAkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 01.07.2021 11:56, Olaf Hering wrote:
> I touched it last.

For my taste, this is too little as a justification.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -381,6 +381,12 @@ R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  F:	tools/libs/
>  
> +LIBSAVERESTORE:

Nit: DYM LIBXENSAVERESTORE (and hence for the new entry to be below
LIBXENLIGHT)?

> +M:	Olaf Hering <olaf@aepfle.de>
> +S:	Supported
> +F:	tools/include/xensaverestore.h
> +F:	tools/libs/saverestore/

I'm afraid this goes too far: This way you remove all prior
(direct) maintainers (see "The meaning of nesting" in
./MAINTAINERS). And I'm sure Andrew, who has written much of
this, ought to be considered to become the maintainer of this
code then as well.

Personally I think you may want to take a smaller step first and
insert yourself as reviewer for this library. See e.g. what we
had done a while back for "VM EVENT, MEM ACCESS and MONITOR" when
new maintainers had been proposed. I may not have a sufficiently
good picture of reviews you've done in the past for this part of
the tree, so I'm sorry if I'm missing significant work you've
done there, but surely my recent series fixing code in this area
could have been a good opportunity to actually do a full round of
review, when you have the intention expressed here.

Jan

>  LIBXENLIGHT
>  M:	Ian Jackson <iwj@xenproject.org>
>  M:	Wei Liu <wl@xen.org>
> 


