Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A075A402344
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180400.327047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUND-00035X-Hp; Tue, 07 Sep 2021 06:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180400.327047; Tue, 07 Sep 2021 06:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUND-00032d-Dl; Tue, 07 Sep 2021 06:14:23 +0000
Received: by outflank-mailman (input) for mailman id 180400;
 Tue, 07 Sep 2021 06:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNUNB-00032X-6u
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:14:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ff516a7-4b3d-4c57-8e0a-ffd3c287b952;
 Tue, 07 Sep 2021 06:14:20 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-V1VvL1hMNVeMrtjdYwZhcw-1; Tue, 07 Sep 2021 08:14:18 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB7569.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 06:14:16 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 06:14:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Tue, 7 Sep 2021 06:14:15 +0000
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
X-Inumbo-ID: 7ff516a7-4b3d-4c57-8e0a-ffd3c287b952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630995259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lE+pv+2t6gwcK6U4MSVYO6DoEvX4rlBIfkZVESIv7zc=;
	b=URLymQr+qMErGR58zs0ydrkxAtuFJ6oWB28kCFNV2IM0Jvm26T5G/ZkxOsc+snaOb/a0Vg
	R2GE3M6htWSJ6BTZJDIgNkxcHylhYSXGJG3Dqa2Iver6tYhw11fM3wc2lt4Sq7tejk/iPU
	CWF2URwmXNRji8UPhy3j+ZW1GZ4fKKA=
X-MC-Unique: V1VvL1hMNVeMrtjdYwZhcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr3DKHK7A9LutM5P9cRMQIn50PlzDY+ZN17mvsB1JAqyMRB1K3u90/sLb4BAVYUrq/cZjr2GCSKjGh4/B62LseCj6HHJ9TCYdjXjSjbFoZfW50d5uzJtbl8qRp2azfeP5zEv/mHSMF0Cfxl8IFhJcg32O7PdFRTsbmB+xrzSocsEvVFp7naLprZDYRVVhGR4G4NXlClc+bIjjSmU4932se8LXS/oGvp4K/x6COdrb8j9wk3663uVNoTrOzz9gSjmP3PGaWRZIsUR8vukObQUk/sDBWrNaQmdrnmN9TJ6Tx/VIA530eBxaTMSm+5iFtrId14CwxRWQs5frSUWs8JufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lE+pv+2t6gwcK6U4MSVYO6DoEvX4rlBIfkZVESIv7zc=;
 b=TPd7QSzH3Xrhv5V4PAzNTasoHSu8826fko0zq4zmw8nIMTcMlAyFMLkTK356baQx6KgrDveeLh4Ril1q2FTeUEJJX5sQYJXRsV+N/4dtXjhxt1pf0U8LYjMpqMT2+djFN5P7tcUT2vVDszXiPIYFf8wKx0UTvo4ReH0KGYLIK+9T11f13AUXzIzB3FQrjaBnLSmPR2ANiyrqjBiEwHrlJR6tL9HqEriQp2x+l7PxQEqFXuiHLjPNLcb8vP+Aoh8AGyLuTMi6QXbfQHtSIkKHtSKDdX+bVrLW8PTskg82ALf+d/tR8Ipf/YSm6iVSLXKO9eo9jP0y2AkyalLgcU6NSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com>
Date: Tue, 7 Sep 2021 08:14:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824105038.1257926-6-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85cb63a9-dcdc-418c-f445-08d971c6b876
X-MS-TrafficTypeDiagnostic: AM9PR04MB7569:
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB75692A51FCDDE7621C4B46E6B3D39@AM9PR04MB7569.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7sAxio4bnaBRVvzEcBzNpwkR1auwlW/FZwG/PTFPuyHEC0BYmHbbntGwyh16slzFhEl0MuZ2z/68Mhyx+3VPUoRHvEUJOE0EdxGWtfW1McYnLQu+qPvkjLfORM9BKPfLOBMinTSmXX7Qf6wqt5wwNC1UWJn0imjmRFdxkGXyujX9apHGzx+qoZ238OT0suIMze8+pKyfDa9zaxW1fAVqTVXuzM8QdsByuFkAeDxJnjoslnc5YrVtpCLqhmFVoB3WWtJzepYJyWo/yA7v9ZbYxWC6euSU9BsNkSmPJco0RePG0ogv94Ar3CDuoFV/mBgu0DENm5S1F0tRn8XugiMO5goiQt4xVhcBhuwmlx5y8+awCoFtiKt3i2bC7S0oYc2vbfeDGP7J8drm6DCDswZ3mbnwslUtnH+vKCIBQweUcvpmh+rVL3FADM49tzaY40aVBUYEXJw6vS/77yVyBQiULjtALQFeIcl9nedY0ZzFa2ZEWJtbcR27s3ha0oA3WR1WlzgZgzYJhIoO3QACmMr13Mq/wN6CaEIRDW+r35Kih52INx0377E1IpejQf50qvkOSUt85vYDJP/AaK8hfP/OLJRkC0lDGRR5IUkvk3nkCVICr9py3n78JbwggtjXIaPvDR9op/fBTszu0RHK54IP2zYBmz1pTlB150JWRtXtTFIRED9Rw8CigV5l4+NKO0ksfBifSazPP3b8jeO4rrWq3NbYPRry6XZLB+VQOzppbYVFxlkLnhZwz0gaXtpWZDCaIorpTJSDGY2G8h2tkddXCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(376002)(366004)(39860400002)(4326008)(2906002)(8676002)(66946007)(66556008)(2616005)(5660300002)(186003)(66476007)(956004)(6486002)(53546011)(31686004)(8936002)(26005)(36756003)(38100700002)(86362001)(316002)(31696002)(16576012)(54906003)(7416002)(83380400001)(478600001)(6916009)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFNNbDBFSThZZ08yeFNKT3RwaWpYVUkvSGdZWmoySFg1ZnRPU0J6ZVFuL1BS?=
 =?utf-8?B?ZUVDYjU3Nmo0enFnZFNkSUhyZjFpcnFKeTNMRHV1dnJFQ0Y5YlhUUStsTkhX?=
 =?utf-8?B?b1JVNnFPNHRxOW8rbDZ6bVVab2FKSmFOTSsvTG1LQThJTjUrTkFzZHJLYlU3?=
 =?utf-8?B?Vk1VUGpSZjRNdGlZdGNoOFRhdHErLy9PeFNqdGgyQmtPa096dHhXNWw1K1Y0?=
 =?utf-8?B?Z3oyc3A4eksydnMwNXQ2YkUvMk1PcEFMMG1HSjZzNTJFOHh2M2FoelhpdkEr?=
 =?utf-8?B?MkhMR1o2azFOdm1Ma3Nrb2hVUlRWQ0J2Q2V0VjMwSmR0T3NQcEJ4ZHQrbFpl?=
 =?utf-8?B?SXBzMUI2eEE2S1JHWVlHT2NoWkZFTXY5Zm9DY1BoSXRaV25Nc2VlamlvcFBu?=
 =?utf-8?B?QldMbmw3QnkrREVXT3E3Z0hLNUQ5clM5c3BtNTRHTVYwZVF0b3hzU2dPbHAw?=
 =?utf-8?B?RFRxK3g5dFpTQ21XZDd3OUlMaUhYdUZ4bHl4U2RlUjNUYmRsODR2NmNSdHE3?=
 =?utf-8?B?SUhBVGp3TE1zVVI4TVp0OEloYlJtUGJDYWVhVk0wcjhjOVJmWlJvTkdIK2Ni?=
 =?utf-8?B?eWxFdytVQmU0U05RbjgzYlpFSUpMT0RSZVBPdG5nTGxWOWVMQUp2OFdSSTVW?=
 =?utf-8?B?ZGtlY0ZES0lpdGRxc0V0MHllQWVBK0RYdXZ5MWswUi9nTXNuTFFSZzh3cGxU?=
 =?utf-8?B?MUZOdzFFcGpjRzJMS0ZTOXN5WlR3UEUrOWpZTU03US9sUTZ0ZFNlQTJTc3R5?=
 =?utf-8?B?SEJKY21tRkRLSmxOdWsxaTVFR3JjV0xsMnZRQkZkd0JrTzhMcWo3dnZSWFNk?=
 =?utf-8?B?RTBBWlgxdFJpbjRISkJPeGVPMzdnaE8zWE11MzFQWnl1SndHUUZQWTRSWWI3?=
 =?utf-8?B?MnFXTzhzM3RMVDZsQUlDSHNaTjZ0TzF0Sm15YVRycTd4Q2M2S1V1U3BzZUtl?=
 =?utf-8?B?SWxjN1ZPZk9hZ0RCODZLMlVHelhobm5UU1ZVdFBLRUZiVXE1WGpxQ3Axdytj?=
 =?utf-8?B?T0NSZHFtRDMzSEhtV09MTWlMSGFiMHdvaDVWMTBnRXNMWDVsb1FDMS8xMzcr?=
 =?utf-8?B?aWtnSFhDZ3NFVjZNaW45SUl4M1dhdndZQ1kzM3NPZkJBdFE0N0tJSnZMbEMw?=
 =?utf-8?B?R29YU01VMW1RaDJUNCt4ZGJtUi84WUtMNGY5a1FmYXM5elBtUGVCbS9qWWtt?=
 =?utf-8?B?dHJVRm1IdmdnZWlUYm5SSm5mck5Kc2dEcmkrMHUyVG5ZSTlJcTQ2Tmp2RnRy?=
 =?utf-8?B?SWxKNm95Nm5rVUpadXpBNE9xTTBKTDNiMTU3d3NiQVhOSkI4ald6TXVlMEhY?=
 =?utf-8?B?cFIzUFFyMWVtZ3JEMGh2ekNTZXhJZ0xjcGFUWkl4dW84WUNSd0tHbC9sUkdF?=
 =?utf-8?B?Qit0OWdWcG1yN20yc2VhYUNjVzdUaVRjbGJxbFpCYmg2am5sNEViS2lkUkhF?=
 =?utf-8?B?cG1QQlV0Uk5wd3FrVG5CSi91dS83NDloY2NObFBiRzJsdkpxTWxOcWlTcVNu?=
 =?utf-8?B?YWZEbmdBUUYzVzY0MjA4bWtiQU9XVDc5b3IwTytuL2xreWxsVjVqNDZJWEg0?=
 =?utf-8?B?bXp4dzdQYTA5QlNnMGhrRFJxMG9UQnE5dlBPa21KYzR5S2JsRFhJZ25qbnNn?=
 =?utf-8?B?RVYvOG5PZkdrNGJOdWxFWUcybWI2Vll1bmF5MDZwM3UyNlhIMG1OckprREpa?=
 =?utf-8?B?dHl2Uk8vVzFFem1LWTI1VEIyTHV2WGN2WlRxZnRrOFB4Y3hDRDRTckN4MkI4?=
 =?utf-8?Q?Bugx0rXrTL2ZYJYSJkCBweGFz/sLNdBooApVy3w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cb63a9-dcdc-418c-f445-08d971c6b876
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:14:16.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJCqVni4EaS7DeOD/h21VrvC8Idlkc9It+rTXHSWS2ckgNKIzLl1HvUdBe8BYfZyuLoxTkKiZwm7sqzkXnBOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

On 24.08.2021 12:49, Anthony PERARD wrote:
> This replace the use of a single .c file use for multiple .o file by
> creating multiple .c file including the first one.
> 
> There's quite a few issues with trying to build more than one object
> file from a single source file: there's is a duplication of the make
> rules to generate those targets; there is an additional ".file" symbol
> added in order to differentiate between the object files; and the
> tools/symbols have an heuristic to try to pick up the right ".file".
> 
> This patch adds new .c source file which avoid the need to add a
> second ".file" symbol and thus avoid the need to deal with those
> issues.
> 
> Also remove __OBJECT_FILE__ from $(CC) command line as it isn't used
> anywhere anymore. And remove the macro "build-intermediate" since the
> generic rules for single targets can be used.
> 
> And rename the objects in mm/hap/ to remove the extra "level".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hmm, when replying to 00/51 I didn't recall I gave an R-b for this one
already. I'd like to restrict it some: It should be taken to stand for
the technical correctness of the change. Nevertheless I'm not really
happy with the introduction of the various tiny source files. I've
meanwhile been wondering: Can't these be generated (in the build tree,
as soon as that's possible to be separate) rather than getting put in
the repo?

Jan


