Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BAC3EE934
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 11:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167676.306086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFv77-0003FW-DT; Tue, 17 Aug 2021 09:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167676.306086; Tue, 17 Aug 2021 09:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFv77-0003Cg-9N; Tue, 17 Aug 2021 09:10:29 +0000
Received: by outflank-mailman (input) for mailman id 167676;
 Tue, 17 Aug 2021 09:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFv75-0003Ca-IJ
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 09:10:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f58babce-ff3a-11eb-a494-12813bfff9fa;
 Tue, 17 Aug 2021 09:10:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-sIADIbC1PIq8RWS1SXGoWg-1; Tue, 17 Aug 2021 11:10:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 09:10:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 09:10:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:208:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 09:10:22 +0000
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
X-Inumbo-ID: f58babce-ff3a-11eb-a494-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629191425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UahAwd7emKt9uXo65VJB7SOTs1cwbl6POIJg+90aPME=;
	b=VMp9SIoMq7l4BxKZrsCKMu9Zw/uTo3E1n8ykEWc4Xo0qPm9XySXf9Zu8D1bVBm5u3xBIrD
	2ThyCTfmH0sobwjOyS+LJj82kAeMueSVbz/bbbdh+c/eFHhuF2bZlEeAcrB1Bj81mEAvOR
	FJtosOPoyiFY+bBu35L7fproBkFY3Q0=
X-MC-Unique: sIADIbC1PIq8RWS1SXGoWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKL81SzcibpVeRlIVoB6FjzCtWdUEiyPR7w4X4aO5JJpyiz7ctn6sXK99T5sStMJH6agfZn17Ye1WOjJDb0zlfArC9G0yB38/GHKBTYJlAB78BgcXqKoxwDGbj1yLWo3CcK5aDCfVFCHLho4Y2s/CSKf25DFxovFTAri11iLuoB+J41Z9vAo2YbUSKdQBBhJ2jxsvH3rcmeCFUvU7dZr8lVQmclW8mnFKbafTQne0sEfZGUL76xSzwa219xSniD95cL8vPxi0ShvLHrFCk88itcYpJ7pa0OMQlWJImEpFYC8k2/G3laEZKIXn/4l1fiob+nuvL2Gwk9J3xjoa2jzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UahAwd7emKt9uXo65VJB7SOTs1cwbl6POIJg+90aPME=;
 b=f+Qjzc16lMWe0ludAUATfZwrHVHvImAr5Ox47w+FCHrPcGRpQCw57WUG7D7ahraFIkHcqYtt1atCmBSVaIMOEWYv6U7JYkkf1ec3WTSpz30dQPN0VhxBMqNH6zEqAUy7kIy3k2l6TCzlO47f5uBC+QUq9smtN+8mTEQ0Wdjt6w5E4lxDSLvdgrz4X6eK7mWrx0x7FTamgrk7JzQ+rYku4R4PJF+oAGfQtFhQUeV6Bq3ih/sm4vOhwUCH3F3K5Qqbs22otGAJmncvs5UlBYRxefNk0CAdHoeG509H7E9fNOPphCES0ZnzdhlRyn0ASaCz60FcXPToNlwBXEsSgcjMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812170350.23543-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4905f9de-8106-8a5c-c3f1-6a703b008d38@suse.com>
Date: Tue, 17 Aug 2021 11:10:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812170350.23543-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:208:14::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0227905-12a6-44ca-1d90-08d9615ed815
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516699B195930C2DBFA6E28DB3FE9@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VL9NwlNDARSptilPWKC0+Kuv5imPFxXQ9uLXWlG64vTKr02tY6YFeSqXilHSeJ3SP3xj/ylTbuWDj2U+iWej3tQCu4NDa147cbMcTa9ARXhuYDTOwH8s0NSljN+pms/xjGn0UEHuft7AXxY32xH7EBV1VBgxB+Pw2sbXXFzOSvG3MpjdsmBQ3MsqrnDqAzCJkQtNfF3eyykUoIi/Fwn8/3OtD3zJaCTtywyjdWM7TvsVAl1eb3+cNlfN+tSg501jJsc1HAfSYIK7BQqrzr/G8EQ26csXoVWYMjcJpvJDDZ7KYLNXJEVkr5XY4723/TszLGmypy2qQ3ec/65/Q8GL00OLLqEn//39PB30QZc4tLKFvL/GSIrjlUOV0F9WhreRzcE+orNM0HMg2S5C55IoUFqaBUS7e6AX2GOpBJxvGFDE+sLn4itsAH5UBq7Etdk1uyBQKXP+Hnq+xcu0FxQ3uIW1qZuhoEuMhrvVhR3C5/Opmy7VR6JW2NcYZQMPAAFURpbXSJGicJGsQ+byQl4g8K33oQZ4gY5nTpPCYFGJm5Ctvpw4/p4jm/OsZG8gedVvqLasuE0xB13FGO+nCyWLfIRNwva1tnBNxU3HYOVXV/lAemNQv0dQi9o+vEfCTd4hW8poofmA1Pw8cDdPrrxTz/HaDo1LDYmFlpID89vMZkjjv2JnVZg/Kez/h2eo9MaO83FnY/x+I5T4VAGtloq44I6ikFkQtvWxKCx6mqzuPSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(366004)(376002)(396003)(136003)(6916009)(31696002)(8936002)(2906002)(38100700002)(186003)(478600001)(31686004)(86362001)(4326008)(5660300002)(83380400001)(36756003)(6486002)(4744005)(16576012)(316002)(66946007)(66556008)(66476007)(54906003)(956004)(2616005)(8676002)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckIvVnVYcjlBQ1JiWjdnU3hEekRCdEd5VjEwMEZLR0N0WEhNaFFXTDJ0eUFB?=
 =?utf-8?B?VWsvUXMyMWtRaXdBWXFUSVZVK0FsdFdRZi9kNHg3c2ZNMDhzZnNpL2xGNFJj?=
 =?utf-8?B?cHBDOXVUZFlBR2VRTks3NGpaNFZsWGJHOVRDNWpUOGEyc0YrbzF6ci9pRW1i?=
 =?utf-8?B?a1JYODFwT2k4Y01MVm1OL0lWaXo4OGhSQzZlcG1reFpPVzhqZ2dxc2pwZmFm?=
 =?utf-8?B?SEhnYUJZcGNqMDh1ZmRhYmpxMWxsWVBlYXZ0YXVCTVRrMWpyWml0VHdwcTZl?=
 =?utf-8?B?bTNZN3JMWmhkUDVxYUhITjk0NnFpUVRGUDVkSnVLaEZ0d3B5MTJ1cFhnUWJs?=
 =?utf-8?B?bVI5RytXL0dDZTZkQ1VDMzBuMHgyeXE4RlJNa3IybllhRXp6L3NPMExoeG1m?=
 =?utf-8?B?aVB2KzhWMUtKWGxqMU5vMFVDY210NHVFODdSbjMrSGNlNldtck9FMGs3elpm?=
 =?utf-8?B?Zi9ZblMxZlJMOWlMWGhZMHJDeW1lb1A2SU54RnhFYWRSVHJQaUFRSTZ0Mjdp?=
 =?utf-8?B?b3FBRFRoREN5Z0VsWlkyNGhvSSs5MklUYlVuMGM1SzRBbFBQV1MraXBBTkZm?=
 =?utf-8?B?L081VU9IQi90cElJY2UvY2Jxazl0RHB2azkwSUtRMkd1S01PK0VGUDZ6bGsr?=
 =?utf-8?B?QlczUndpZkFxVUhOR2xxMGtEREViVVV0MGpma3VTNlkvZGtJc0Yzdi9keGFH?=
 =?utf-8?B?OUVtN0EzR2Q1YmI2WVJpbEJ5RDF6SDRjdmVDL21jTU5jMkNjWWs3UDlyK2dt?=
 =?utf-8?B?Mkl5WWJlaE5sTFJZMEVKZ1NvYWIrL3QvclFoMU9HS29qS3hCelRTQTg2ZExH?=
 =?utf-8?B?M1lKMVRaeG9xNCtDQTh1UXBBVk1WaUZKM3p2U0J3VE9vZ2N6bHdGUzNZM0JS?=
 =?utf-8?B?MWRDQ2dpbzlaSEgwc2xEUk11SUhSZXJISm9vc044UENUeTFnVm1FMEZXdFhI?=
 =?utf-8?B?ZGRJUkhWVnBrWWxzaFp1UmNWRVArVFJFMTBTWmp6YjNPUDF1UEVlb0J5NkJv?=
 =?utf-8?B?ZDBBci9xbVhWWDRjdUZwQk9hdS9KZnhKK3p6bkxqNHpmcHVuQlBPd1pnd2VQ?=
 =?utf-8?B?K2lCUzJJSnM4N2V3S1lUcWdITlJsTlpyNHZRZFQwazlKQ2p5bWJYWEY2TDF6?=
 =?utf-8?B?RUhLM1ViWWk4V1FrSWVmNlcwT0IzTC85UWxJdU5NNk83akJVbnUwQTJ6MHox?=
 =?utf-8?B?NVlweElKTnVxanlCKytjK05ta3N1eEQ0NzBlT0p4c1BkU0FzMGt0K3NFb0kz?=
 =?utf-8?B?NGZzcnQwRDN5VjRPajN4UU15Q05IaWhNaWptYk1NR3lEeXFkUmhVMmJvQnN4?=
 =?utf-8?B?UDlzU2c4ckxVMGlTM1QxT0MzeG80ZVJqZVppTWliR3FaeW5jNEFJa2x3a2NS?=
 =?utf-8?B?QmcyOWdaQ3FLUHA0SExKM0FsMit3cyswWTh3MHZIRXFzNVU3eWdQMkNHdVRE?=
 =?utf-8?B?ODNSRHYxRkVDZlU5aWcxanM5OTdQYnRWeWM3aXdTbnFueUlHLzdoaGdIUHNC?=
 =?utf-8?B?eklqbmVKRVVGR05mNzhPSjhLNUFuZE54ck55b2FJKzZxZnBaM1Q2U25ydm40?=
 =?utf-8?B?Yk5pckJMMFdSUUc3V1paZnBFNC8vVS9YNW5MUERQRDRYV25lR3VBbHBDaCtt?=
 =?utf-8?B?a3k1cUN4VUMwL0RicStXVVBMbE9RbXlBdHppWmcxVlpEdTBLUzA2TERxbXZ0?=
 =?utf-8?B?dU1EVi9mK1U1OGFWZVdTWXVLeC84S2pod2ZJTlVza2xYMmJLZVdka1BrTXNv?=
 =?utf-8?Q?7TxGRNMAa9090VMxaqQVNMuchm0gzN8ATPeWwBL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0227905-12a6-44ca-1d90-08d9615ed815
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 09:10:23.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06mc49wlwkXSy4IiIsC2JX6z4uNni94SLQK29fazvUGK1fZYH46+ZHIX1mY8GlBDhoAoc3WLZcdrOpve+tF/Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 12.08.2021 19:03, Andrew Cooper wrote:
> I'm not a massive fan of the large ifdef area.  The logic could be rearranged
> to use IS_ENABLED(CONFIG_XEN_SHSTK) by indenting most of the function, but I
> can't see any way to drop the goto's, and this is certainly the least-invasive
> diff.

So perhaps the build failure I've just run into (also apparently spotted
by osstest) suggests to actually do so? The alternative would seem to be
to widen the #ifdef in get_shstk_bottom() to cover the function as a
whole ...

Jan


