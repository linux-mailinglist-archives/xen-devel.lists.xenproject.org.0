Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676663F28D8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169337.309308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0UH-0001mv-VS; Fri, 20 Aug 2021 09:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169337.309308; Fri, 20 Aug 2021 09:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0UH-0001kG-SN; Fri, 20 Aug 2021 09:06:53 +0000
Received: by outflank-mailman (input) for mailman id 169337;
 Fri, 20 Aug 2021 09:06:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH0UF-0001k8-Oy
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:06:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4255a98-0195-11ec-a692-12813bfff9fa;
 Fri, 20 Aug 2021 09:06:50 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-oy5yFQ7UMlGwdK9zzQA4tA-2; Fri, 20 Aug 2021 11:06:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 09:06:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 09:06:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0084.eurprd03.prod.outlook.com (2603:10a6:208:69::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 09:06:45 +0000
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
X-Inumbo-ID: f4255a98-0195-11ec-a692-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629450409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcLHc1LRBfARLQL7Na50Jy6YNFFLfZ5cK1Nuc1t6p4w=;
	b=I4xIZjmoWr8ddoKGLG6eEF8syt4BifFEDySdSkFI7PuSwPO12iuhjr1VTf/NTaNC9EwGa3
	+DfxsrKKaN9Fya1EFuXXgGa5R1kU1mQRTHTKooOncl/ayr7VOMPS3SzhSJNBZ7DuKt7HpK
	s0wzaPALejPokOWvkdkf1Z/V+gG6wGw=
X-MC-Unique: oy5yFQ7UMlGwdK9zzQA4tA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEprxNZSfU2uTPzJxXTUEirqLccwQi5kguWFU3VUC4B1wR725dmJhoDLczmfsKZVrxYmqKsDBGqtVDA+viTGEPtt6Ry//cgGhxs1ht7fdwGB3C+9BAqCtjeOPAwVBqSjqaEN3eRGAaO8VctB0bFip5NL4l+br7cNem+V59hMjNCA48ONrvc5So48+RbCzc4+pDFpfk1RNGCn0Lv7o6qwRscSunAnro6wlPEbnsrzMCwEfNmQaHQMQqnvQyPVuIWP1tSAosS/5hZMVIXrnH3hiS8jQc0VkLqyEpPg67r2KJcIn61/5LHutiC+owA99jPof379jV1ROB7JhwvdLs3/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcLHc1LRBfARLQL7Na50Jy6YNFFLfZ5cK1Nuc1t6p4w=;
 b=TyBmxhFjwtPai7cFe7ksWKXfsGf7rnEwJgYDN97Fzpg+90RAf7ZZ+3Tk/Tkgpl5Zz+hr7eoMm2ZsPnkYcWAex5jKForyJznLntuJx67iBNs+XC1LTHqOBbZYXK67+oe5AfhxuAhq0v2Z/+pJWoi4w+6JCOcKydvLKjZeWf9f6wazqO6q8uqP/1/GKSzEYxYCxONnVLulhtDzqXhX7gZcRW9jBvElIzGAFAqjHkz5PKmtQy56Jy92aVR3veRW4er2LsmaFxT+kVhI2SS7Iw+Z9BzujOsS+Q66zNfI2BbOtJQ4dOT/NpGsAxKlmc7yX4FdBDpTMrGTILuoyizqu9imnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c9e3712-0929-d6bf-8a32-3904f7137212@suse.com>
Date: Fri, 20 Aug 2021 11:06:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0084.eurprd03.prod.outlook.com
 (2603:10a6:208:69::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d58273-9ad5-455e-3421-08d963b9d648
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863B684AED393748D5A18CAB3C19@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ukm5MMwonn1QjjBK7x1g5HD6eAghOmihNhP1jAQfrhAPL5ChdHzf+PV5c51Bw24vJYXPvRFhLbOGe8epZOcJIaXcfJw1CVP1p8sH/PcjaMQoRKTXJ/8KO8pJV6/aoRUxyQ4zWtAee+JzfuybGf6fbG2HiHFU3pg5Hr/M56BIpqlBa2NMbxt8l5oOhLfg9G38NSjokLb86xCypzCM2K5vxuY+BQKTDuFJcH5ucFegicXeQaFAS0bJcFcWy0IiIf2kCPvfMF93RR71S2nxj6WEt7i4ZMhuZfppeKG9VkAs/bY4SPn4xQj0+hHDwsIjcCbf7wGU1+87j5od6+SeRKMs8nmrN0bT8oPskv9C7nqxO6R7Nkio6Q/hCdWR319KZudOo4VmcaIRE5l4huZSrtgKxhf+Z5/e79lfrhT2KMoroDrgk5rqGV5Yap1pvDkR54F16eWF7IXly7FbJV1F3kKllT2cnM1qEZXIwCWxLQnlhigV/llCskcU4Xf9A6BAGQi9SItVkA5EE8Cc9aPyZsPKBB1lEqG1Piz1vEWTTT1JrOLoA8NLgKWDf3fBor20OApj57ZkslsJf22cGDYLfllULOIoOdQ1057iCMY3rwRHsgWfI2Vj/u2uC85LdoWuDq74/7an/94xOqaxXp0CylyNd3IKH34QZImzBAcwUZqDphqHg89Dq02xPXV9hVqUZN9n+4bzdyJB+/Lri4itwO9IiWuPXKdDUszhGIdu3iDYfyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(346002)(376002)(396003)(26005)(186003)(36756003)(53546011)(66556008)(6666004)(2906002)(6486002)(4326008)(478600001)(16576012)(54906003)(31686004)(316002)(86362001)(38100700002)(956004)(6916009)(5660300002)(31696002)(8676002)(66476007)(83380400001)(2616005)(66946007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHl4U2V2SmV2eG15cG13TkFrZk1Pd2tFS1JKMUJ0WmtINXROSkpDdGF4bldY?=
 =?utf-8?B?eHNCZ1c0YnN6UlZuSzJaTmxXYURyS29pcFpUTHlUWnFpQ1BEYjU5dmk2YXZQ?=
 =?utf-8?B?NGF0b2ExVE8xdnVwaXAreklvZUJ5U2dKWHJaekRQZFlsZnh6MHd6ekhBbUo3?=
 =?utf-8?B?NHRNR2I2dUYrV2xmY0dha0pUWnpqMmlyQzFTeVV1b2dwV0NRenJreWRSOWJW?=
 =?utf-8?B?U1Q2MGpXeEZSaVdWL1lGSlNtcVNJeVZDTzU4Z1MwRHNjS3dMRUFkdG5Nem9n?=
 =?utf-8?B?MjlNdzkzMnJ1ZmUxYWRsWm8xTVFuendIZHhkM2RLWnUxbmQrb1ZuMWlQM3Z3?=
 =?utf-8?B?ZGYrVmNGZWp5UVZqYXNjTmxiQ05ZOHJIbXNqNm40bjNyV0RmbEdnK2EwNTRo?=
 =?utf-8?B?TnFHY05BTVhtWitYbm80ZURqdjF2TGwwY1kzNjlJRUZXTFVMdFRtdk8rRFoz?=
 =?utf-8?B?MWFLOUh0RHE4MmNYa1BVdW1oT1BZSmR5MlZLS2hoZTlzOG1MN0tKQnduTEVT?=
 =?utf-8?B?RU1lLzAzSUZCUG5WK0ZmbE1DQ0lrZDdIcEViMzZvSy9mS0t3V1QxMGRVV1pr?=
 =?utf-8?B?NGJnblNHblBlSWNMemtUMnVVZndoZUl4OWZZU0pSM2tVVG5yWStxYnFkSlBt?=
 =?utf-8?B?RC96S1dIdXI4V2tOR21QMHJCa3ljUU0vbWtuMzlsMzIzWEVuRWFuNmVpdXor?=
 =?utf-8?B?Wkd2TVk5ckF6b1lNV2cyNm5BWmhVcUs2Y1kxT3g2bUJPQTRNbCtGQnFlZkp3?=
 =?utf-8?B?UkVOVDliVld3RlNqMTdiYkZleHhSOFlHLzIxWDFaZThMTVNYZkoyZHVCS0xQ?=
 =?utf-8?B?R1N3Q2g2YnVJcXpabzFWSTcvZk5WMTdxRHJYZzhFZGpKTDNEcStSL1VnSW0x?=
 =?utf-8?B?bksxQm1reWhLbWVIMXYxK1pVeG9DMUNneldVbzJacWZqbDQ1cTVBZXBwUEdY?=
 =?utf-8?B?ZUV5dWo0bCs3dlRGV29wQldpL2V0Uis5anN2cEJHOTBhS1VpOFlzRFpOWSt4?=
 =?utf-8?B?cVZkbDVFbThWbEpTL1ByK1d5SFJuV2pVeXBvc3hxTC8xUWlTSXZMeFl1ckpR?=
 =?utf-8?B?TFJXb0JoZ1QyREFVckQraG9LVlYxUW5zNkl1N0wwSGVrbExwbGM0Q2ZjM3lT?=
 =?utf-8?B?UG9kdU9ON1FwUWptSDAzejBJclJYbThvMXNSNWQxMlY3aXZHdHQ1eElRT3BD?=
 =?utf-8?B?QW5udWNoVFRMM09oTWZHb0xtcW1ucFp0NFJFZFdXb1BqRVZEa0NSekd2SVBq?=
 =?utf-8?B?VjZ2MEVNOUlYL09lVDlMdEdpaU5teEZKSkVSRmZyYTB0REVpNFB5d3FXZlFn?=
 =?utf-8?B?OHUwUlhMOGprYUtVUTJlckpHTWdCWWFjMTJjLzh2L2JpSmRXbG5KT2dzSlR1?=
 =?utf-8?B?a1FkbDZIZ1I1RUc0eVNSM2lpcVlWdnBUTzhmdGVTZEt1UjgxZUNFRzlXSW1h?=
 =?utf-8?B?cXlBVkk4eU5kdW1id1AwTWxtZVQ2TjVjRnNPMWRNREtOcWQ5UVZqa0trVmZF?=
 =?utf-8?B?Z0JVaks5Q3R4SUVjb3FLT0dPYlpqOWlWVzdia0l0RFp5bi9IbDYxZVBrVERa?=
 =?utf-8?B?K2Z6Z2RuMG9kWW9MQnRRN2Z3V3RTOU9WdnY1clo3OHN0VFFvdnZKTWJZWXhj?=
 =?utf-8?B?TnBSQThJSlY3MThYK05zazRMdTYwVG9ON1dhVW1hNXV4VVd3Y1VyZ29SbGZa?=
 =?utf-8?B?WXFMd0xScWVETmt0dndiWWsvUGpXZ29HbUN5Z0paeDFvWlNVYW5OSVBHdURx?=
 =?utf-8?Q?hhAapAuRWC1y+HSc9xGBvsTKZgQdzmRNCGc+RD2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d58273-9ad5-455e-3421-08d963b9d648
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:06:46.5970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhIOm4d0scLJCxmmIhDqC64aLpz6gJH3HrQDB6MiTdk7QUSke57STNygMX3NZHSnic7Q+XP8sZVYsPhlaJrZKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 20.08.2021 09:44, Costin Lupu wrote:
> On 8/20/21 9:52 AM, Jan Beulich wrote:
>> On 19.08.2021 19:50, Costin Lupu wrote:
>>> These changes introduce the page related definitions needed for mapping and
>>> accessing guests memory. These values are intended to be used by any toolstack
>>> component that needs to map guests memory. Until now, the values were defined
>>> by the xenctrl.h header, therefore whenever a component had to use them it also
>>> had to add a dependency for the xenctrl library.
>>>
>>> This patch also introduces xen_mk_long() macrodefinition for defining long
>>> constants both for C and assembler code.
>>
>> I'm still missing justification for the addition of a new header, especially
>> as I don't see that header to gain much more contents down the road.
>>
> 
> For the first version, since it didn't need to include other headers, I
> thought it would make sense to isolate the definitions in their own
> headers. Now maybe it makes more sense to put the definitions in
> arch-x86/xen.h, arch-arm.h and xen.h (the latter two) respectively. What
> do you think? I'm open to suggestions here.

Well, yes, the headers you name are where I thought these new #define-s
would go.

Jan


