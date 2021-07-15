Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3B3CA177
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156690.289150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43IL-0004fa-5r; Thu, 15 Jul 2021 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156690.289150; Thu, 15 Jul 2021 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43IL-0004c7-24; Thu, 15 Jul 2021 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 156690;
 Thu, 15 Jul 2021 15:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m43IK-0004c1-6r
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:29:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adfca932-eedf-483c-bc0a-339c73e9bcdf;
 Thu, 15 Jul 2021 15:28:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-asdUlY5cN4ahn0b4OUuYaA-1; Thu, 15 Jul 2021 17:28:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 15 Jul
 2021 15:28:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 15:28:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Thu, 15 Jul 2021 15:28:54 +0000
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
X-Inumbo-ID: adfca932-eedf-483c-bc0a-339c73e9bcdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626362938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWA4TxW89p9pM7V2M0xA5sgRpzic3ruIVYqYJ0dLuy8=;
	b=FGcHjrfOCnlUZ+phZp81npe+8b4JQOOQseI6uartNgpHTXjZx4RQheBB8lKBdjjeBAYUSP
	Fv8McsVdt3d/6fQoox4m8K2Bf4Imh2BCrCPogz2ElUOJDvVhDu1SNGGBOjZcy78KGLPk2Y
	allX3YyV+yVbP95kITspw0dYB97QV8Y=
X-MC-Unique: asdUlY5cN4ahn0b4OUuYaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGummbR5z+OYimqEhYFPtJH+JJY4/XqjfeG+p9gQ1FpHfuuxeGfFni3+LQwWFgndsuN7nU1TRMI2GHKxHcMlCECjGcbGEwza67/Hiy2pG1pGRgadBh3zBTKUWJnD8+BGZ53lExm5f+TLGxL8qrBPr/lLyH61WUOxZPF9ytmE2JWitQdNM47BXLXFnnEL0/OPOHAlaLKWr7l8PMx5Xi8OKkdMnr7hyZreZ0usx7b2In6QyZ/ZdOsZioeHwVvNuocBcxmZQwyeWLQ+7FtD8yFws/T08aLM7dgDVJoN5aaxq1e4Wg3AnW2hEYMoXEMyaGCGaSz9tiI88fEsuAKiiWzLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWA4TxW89p9pM7V2M0xA5sgRpzic3ruIVYqYJ0dLuy8=;
 b=DSqN7cQex67nbeBQatBwOVaYkFjj5jAs89MYLfDls+ZgW54VGZj0UuZKRsi/kMkuZhobSYtO0p6rgkfiD7zG1NRf5RPcARNPTwYHODjD4nM29HSYwqwKk2vpia7wpXx/K7jnx3w7MnvX7P5MsQ6haN4F52XOvOOmaS4Y6QZBeMT2LctZOFVQSK4pfNOelvZDggu2wZ+aRqmYjwuroA4QzS6uCRC1K5fcXklCgOAVpswk+3XpTdllSHxEDdDFvZ79nqqkM5XH/7pcz5PBcAaM4I3mzJSJrZl7Nifs8cryc0PD1kknAv2xd84ETwltg10DDgLjiXhVkk19QSpcLt4fRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 4/4] x86/debug: move domain_pause_for_debugger to
 debugger.c
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
 <d3e88e2cb3c850085e7d1061d6b20f7e0acf3887.1626286772.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd300599-46f7-5c77-5ee9-9c4a49a18ee1@suse.com>
Date: Thu, 15 Jul 2021 17:28:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d3e88e2cb3c850085e7d1061d6b20f7e0acf3887.1626286772.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68892f6c-0648-439a-89df-08d947a5422b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70401F76069861BF48A62595B3129@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VKSZxrC++dwJRA72FSeRpWAKHAdEBZVGrrPyRU0tYiJbvVQJgX/YUbeUkVGWpugSQcH5E/u60wgHn2ZhCmbaue+iaVuRwXDTDHL1CZdv++UIfNMf0Xif6BiC9A9XjkrAzqFIXlQZcepOuCAsbXptSOSnHaI9sBAkWuBtx5sRJEaFNWIVbDxnCwNfubWDU1vW5xC+o+Mnhx5zO6cL7SSCp5e20/t0Pa7KqmGuRCkcWJJ/zE06X4UrOUOzqKt7qyGSfanXtawCF3dhB79v+Y9C0chnfjPdsvqfN5d9uvOKrJiW5wGWpR/hf4Z6Y/8nPcpqHywacPV8A6OQW1un3+OVDLEHREKKQihRehi8baTB9PMDcfgiTTqyzA5Q79zVHmsZjOMJeAmULPsMfr0JC5OQgumsPv/IKSR7dbwqWRv6HXhTn4+gCYyooY5fx1Qarg6AC41sA24zqiNBnDDclgB48lp7lmvCKRtU/8z6ELaP4MYS0GGSxDrF7mCzckMMTlGa43WTfwbPNOTNksnRHlNWjJjHaHL0YYUEr0HhrZiqqQIzXX0ZTIb19/zHmlXU8otAbAYA/Tzze3AjKp9+m6o8j05ap3gHvE6xsHtOA6Vf2qKvm6XoAc19a1aCJj/NGKR/EWmAqTQyjCCOM2otItptFjhpGd+tNo8ew5mUcrQ5qGgzK1CE7eInFXNcEPLKuAt/5xOsUtaOUb9/jlCXpEwveT2ZOSpO5CG9eH85jgIi3WI5JTo9qiKbz+kL+MdQxEGr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(2906002)(7416002)(6916009)(31696002)(86362001)(4326008)(16576012)(186003)(478600001)(66946007)(26005)(4744005)(2616005)(66476007)(8936002)(36756003)(956004)(31686004)(316002)(6486002)(54906003)(8676002)(5660300002)(53546011)(38100700002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjRVNitOdWFMczEvM0tDVGJ1cUx6SUNlNVFkUXdmcXBsY1NNbnJINER2dWNa?=
 =?utf-8?B?UUM4MnJWSXdyQXd1ZzVMK3ZHWFoydEw0OGhyUmlhZ3pwaXg0cWJ2dW52NTJt?=
 =?utf-8?B?M0NWZ2FSeDZha3pMWUVyNTdMRmV2emVUL3BSQkhwaW8xTlluajRRclIxdk9L?=
 =?utf-8?B?di9Sait2SER6QTRMTmNrekZFVk1uWCsvOHlBNU5nTnJ0OGpRaXI5OHZYd1o5?=
 =?utf-8?B?S2tKdklaUm9pNzEzdElEK3czSmNOaXh0ZEZ5N2N0NmFCSXJkTk85QnFOUDNM?=
 =?utf-8?B?RWdjU0NxcXc5aCtjYjQ0TXo0MVc1K3BFNmVpQ0gxOWFHa203bkhxM1JxVnpY?=
 =?utf-8?B?R3AwTkY0NXhhSzByVHg2MGYzT0FuWWJocmVGU1RpYXk2YVlXWVE5bjhjQk13?=
 =?utf-8?B?WU1sRU1ndGVVRngxbHYvdnBUaGdNTmxIUEhTQkFJckplS3ZMMXNtMUlsSnJk?=
 =?utf-8?B?SlNDL0NBZGMrVEVUNXV6UlNWVytycmMydi9sMEY0cmR4WXUvUzFsb0xNUkM1?=
 =?utf-8?B?TkRHVENlWlRYcDFjSEQ1azBHUWljRVFVTjUrMklsNDNZYTVCTGFvL2UvUUpx?=
 =?utf-8?B?OXRZQjBNd2FzUTdYcURwUTdxY3IvencxYlIrM2FQbXBRVlIxQVVQNU1IbU9L?=
 =?utf-8?B?UVFmdTBIVE16eVY3VHI0RlVabDc0eS8rbDJzRjdTOXc4YUtXd3hrTDJVOElm?=
 =?utf-8?B?UTFjQ2h6YXl5bFAvYWFNTHJJVzFYdVN4dy9QQk5qNXFUTXJKVXp3OXRKaXVt?=
 =?utf-8?B?Yld4a3kxdFlIZk5SVzJpUDZtNFJhWE0rb1U0SnB0NlhaQ0p2RnBmT0Z0OEFU?=
 =?utf-8?B?djltU2lPS2d4aUo3Rjg5SExRdzEyNFR1cjVMU0pkM1V6cmVva0lxeXdlVll0?=
 =?utf-8?B?THU4cnpUbnhweDlPWVFMRURiUkZ5WlJqbXFNOXVvblU3MXdTU0pMT21KNUt1?=
 =?utf-8?B?Skt6UHovT2RGeXViVTB2S2M3Y2ovQmx3SndzVThJU2RSSjgwWlYyZDRNd01M?=
 =?utf-8?B?ZDB5T1pIdHBIMVg2eHo1S0pNKzFOSE5oSnA3NjdMVWJRcW9Iajl4UVZTOHUz?=
 =?utf-8?B?RzdFdElPUEJ5U0I5MGlGVTUyZzdEcVgyaDZJelluWWw2UDJoSEdXa2VxRm8y?=
 =?utf-8?B?K29aZktwazVHRC9NUGJTM2s5MEFvOXJnWi9KMFJ0TFg5a295K1FSZS9yVE1B?=
 =?utf-8?B?KzRRRldhVnhSUWRXdEg1ZHBoeHNvMVUrWDA0VnR1TVFhSkRUTC92OVJEQjdU?=
 =?utf-8?B?dlVTTXFXcm5ZdGFsb0pvQll0cFlTYlhUdlE4MzNyZ2x5Rm9XVFhJZzZnYXVR?=
 =?utf-8?B?S2FHQS9nbmNRbGp2Q1RpWU5FbVZLZXJrSElwc3pRVW9DV3VORXlFREVMblBR?=
 =?utf-8?B?VUtMYStRQXExWjF2WVFxUXlpdVRWUGErUjRoRGxyREE1Ym0xS1ZDbEZRVGxG?=
 =?utf-8?B?NnRucjdQZGMyWHE0Q1dsT0dOalcwc2R3MzJxU2djNUdXekhlOEJrNmlaaGdz?=
 =?utf-8?B?ejVqSktHeC9hVXQydE5kY0JlbitnTytyaGR4WXpENlhiVGtpenhyVE5scEFV?=
 =?utf-8?B?cVNXdjRTajgrVmlPWGgza0JkUHYvOVJtdTVrUmFoZVFpUXl2MXY2VEtkZmdr?=
 =?utf-8?B?RGg4Mkg4Z3c2eTlGWEw4NGo2R0FkakxMaWV3YWE1N0ZPeXllckZ6WFFCSFRV?=
 =?utf-8?B?RkFFanc3dFQzL0RsWS9KSzlvK1lDL1dET0RiaXEyZHdYTVRDSDhYbEZRL05S?=
 =?utf-8?Q?FcCiBalpUPBjzJnnZw/DeJFLvV+89uDik4cHSh7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68892f6c-0648-439a-89df-08d947a5422b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:28:55.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuRjImKQTKOBYMffYTEn8dsPYxjxUxJ16jqQRor1UTQehUM42UGGVvCoYZTVHitPbeVG0D390hiI9qANNUl2rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 14.07.2021 22:37, Bobby Eshleman wrote:
> The function domain_pause_for_debugger() is conditionally compiled if
> CONFIG_CRASH_DEBUG=y.  Instead of placing an extra #ifdef inside
> domain.c, this commit moves domain_pause_for_debugger() into
> x86/debugger.c which is only built by Kbuild given CONFIG_CRASH_DEBUG=y.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

I already gave

Acked-by: Jan Beulich <jbeulich@suse.com>

on this patch. Please accumulate tags as you send new versions, unless
changes you make require you to drop them (and require them to be re-
offered after re-review).

Jan


