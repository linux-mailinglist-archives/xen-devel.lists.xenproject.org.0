Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0F50A077
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310154.526826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWbm-0003Tn-MJ; Thu, 21 Apr 2022 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310154.526826; Thu, 21 Apr 2022 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWbm-0003Rs-JK; Thu, 21 Apr 2022 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 310154;
 Thu, 21 Apr 2022 13:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWbk-0003Rm-Qq
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:12:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b15d9517-c174-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:12:27 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-sMe8rIa7P9OaK5EiQzQmKA-1; Thu, 21 Apr 2022 15:12:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2551.eurprd04.prod.outlook.com (2603:10a6:4:3a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:12:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:12:24 +0000
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
X-Inumbo-ID: b15d9517-c174-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEhOx39Vh3u+diaBYHdOaToLd7oDXDRK7iqTC04f/1s=;
	b=Ahcc/pKFtdLEU7bura8DB7lLXu9vs2VglVXN9dhoBRGIQXEZboMRVTa0ckS6kHisXxXQXG
	vz+aXDTABF4A6WAees8W+g3U7Iy0+thn2Yrnjh0RaOItWaPK6tgyxcg6nwISoKNUB4vh5M
	VxHaPN9NOIrCNattLHghHMvFdfBMlII=
X-MC-Unique: sMe8rIa7P9OaK5EiQzQmKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g66ZoQ5twHK80kZO0Doko+jYerT96/K2u/8EMPOhvB4/ObVkjZj7gWABIP+QU2aBmQ5D9eHY1vTSCSnR/FkcOtZdGTbYeNt1nowZvF6PWqETXOGwpMXEh/NejfhuP8XfLOjKrP+IjLewlKyEMxCf6He8nzsC4DsSEeW+VLp1UTZ+F8oX6nBxkb8LSaY/oUuBaA199bjGZ3+H3lz9CPtVlQM5/5B1pOnLLWrqREB2vvA0X8QQ+YRHuhPXw4YAabclhKF4BOfga8QoU/C+jLrhcFtGCS9Z+o2CXcPDt08ymixdLu8q+3L+X1JjTWOnoH9Wx2QGqS5LXJ3Evvy318e3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEhOx39Vh3u+diaBYHdOaToLd7oDXDRK7iqTC04f/1s=;
 b=QPyd2OVoZouCA7omhhEB9gUdya2kN7Z1gjWT5K2S4J1QqgScLL3nkankizQGE2IzGt+ZtlGHavhSAyKPUc+SnBFi2vVsfzIWGHv3lHEvprDJ6q0cJnIdmz/GvuP0dPTa09HS8HNT+RXzM3q1013xhL2cp54pthZno2ZgNbZ3iWDXBlrP7JwL2UGt+4ciziyFL2/Rt9LoVfDg+qTKO9XPXKFxR18pE7Ihe2fmsobk18yB2ruFX6pv7hYgTSEEouz08SbJGg0Y94Ga+75AGRW6+WTiAE6cgRoAgj/ld1yzxXWmx2l/LGRmeRRwv6MZd5Ud006fXpEC9ihkyVkJH19+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e74361a8-4006-4673-8a1a-d3ce6edf60ad@suse.com>
Date: Thu, 21 Apr 2022 15:12:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 6/6] xen: Split x86/debugger.h into common and arch
 specific parts
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89a90163-497c-4208-8823-08da2398932a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2551:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB255198B981A14F5EFBB8C0C1B3F49@DB6PR0401MB2551.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9rW3ll+aiyx1zyMuB/Gmok80RWx4VbqHZ5n5Chg4fehJa29taajERQxdBw2NCNOHRzik8oXkEF7aK6oRe8Rg8NAbG6cjcKKfAsaz9PxHOyzjphBLxJsV0CZeIespll8CZc1jyPm4SmA2T664ZbJKR/5tJeS6tWEnJBpcRxtF+PHc1Mc1FHDNRBDW5EBqo1o3siqrl9040Yho3XCc5hHZirncBGBrpJ7mn3zQefNjsRJYStMKknT105H04KP9gU+xHRQ5q6C+8yLqvtrJsGn1W6m3FxVhkeFHbP4pb/4UifkJdqXGRkUJnM3kGmDtUAwhpZ7LYdaDeHQd9vbOZ7Rmji1eoDKM1mxALrA0JY4O3QanDpnSJezrQeruJLuygC/87FGgdu4HXogmETcsE/2oAA/2WGpXwx6m7UrMf2dOgFr1bv1mqGfk9MAPwk0CQKxi9OSxCbSpL+U0wgV3WogKN0O7ceEasmQL6PVi+R/i/d8aA9Sfb/NpmosBjxRXa9Zgm4KfZ995u8wKgCQZk2bB8HrjiQ+LaajZijdpOcBHbX/XBGSwzjQ+iwzvuObSfeOVrdb+CDFF4LS9I6WLtafuIyrb7fAY4oN1nrjoTchoFwPjuFUqnWAkyMEpfk5x701CFo/xrXnEI2M2DCjt03CjcuV6F6a2XszLoXUIyw5jXU88pZFb+wBglM/HQbzcPAdIIiZXkAhPxL4aHfC7/jgIBQRpEsAcVGiWjVgH8OG47hak34T+vjUD3XeayxDpUor1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(508600001)(86362001)(6486002)(2616005)(66476007)(2906002)(8936002)(53546011)(186003)(83380400001)(5660300002)(6506007)(31696002)(4744005)(66556008)(36756003)(38100700002)(66946007)(54906003)(6916009)(4326008)(8676002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktzWnpDdm8zaTgyWTlLdDJTOWFPQTZuRlY1bTR5SlNKOXJ6MERTOWZiYWtR?=
 =?utf-8?B?d1NFVlYyaHY0THlNUUFvNHZXWkFDS2xJTzBxZWJrZVg3UC84YkcvRThCK0Z4?=
 =?utf-8?B?bTF6SUFpMzloWkhXS3d1ckliNzNxTTlkdmVxK3Zja004alY0RjV0blVwK2dZ?=
 =?utf-8?B?OThldDZyKzFKdU9OVUplYk9sVGZKUkNoaWYvcEpFNFZzRVh1VkJwTndJc0w1?=
 =?utf-8?B?R0xubmtEc1FxSXpjNmFoWGhiNUVKWHNldlorSW9sbEMweDkzTFA0N244Zk5N?=
 =?utf-8?B?V25YZFpnTjdEa3Nac0oxZGdzQWNsek83cnlOOW9IYm5XckpPVCtZQXZWMEFB?=
 =?utf-8?B?elpONnp4aExEbUh0UzNCZ0pZbDBkVnZqS01aa3VkdFBnNS9pRS9IS0FCMyt5?=
 =?utf-8?B?TG9xSTFWdXNlalV2MEJTUVZ6MlFRd2g2ekJ6aUFPaEp2Q1BqeXJ2dXRkVWVy?=
 =?utf-8?B?QUZOK0FEQlV1RU1rVmE3TjNrTy9MK2hETDRTc1liMEZRVXljL1BiaUlOZmFJ?=
 =?utf-8?B?NnZJN1ByQUZMZ2dYL000NWFHVTJHeGNxdUJWb2l3bnVwZFRHS20xY2E2djRr?=
 =?utf-8?B?WG9mOWRWSDg0VmFtbitQRzVUMEdqMkNLYmkyMFlrSHErR1h5ZjhNWVptRFl4?=
 =?utf-8?B?cVZ1eEhFODZCNGFqcWhFSjVnNjE1VHd4d0VIK3QvQjN3RWZIaXdjbjNJOVp6?=
 =?utf-8?B?SDdpczZ4SElBbmwrNUhYVzFkVWZKK1FzdVNjRGt4SGtwb1VSTUZ2Qy9mdUZ3?=
 =?utf-8?B?Y2tGb0djNCtKRkZlUUxGRHBXTkVOUGRJbXhqUHhNa1V3cisvdi9JREowQVBv?=
 =?utf-8?B?alViUlZ5U28xV0NYMXNCQnRGckg0VTNHcUlXM1NyQmpuNFB1QVp4d0RWQi9t?=
 =?utf-8?B?ZGhKMXlyNGF2bnJmZTd0TXgrMHVQZ1VDdDFtVW9KZVBXRE96SXdEL0NXekNl?=
 =?utf-8?B?bmIrdStQanMvT3pkNWN6S0QrYkYySk1nM1hvQmtFcE5HclJ4VnVnYVcrTUsz?=
 =?utf-8?B?Mnhsak1CNWNKV0NiTTVIa21oQW5uMUdoeVZwK3VsR2VjZTJGNTcrSmZleGVH?=
 =?utf-8?B?MFRVazhQMzYzS1JtUlExbDhjUlRaTFJLd29zTzdKNzA3L1JWME9OTkE5a3l5?=
 =?utf-8?B?dWF4czBBR0F2dloyVDB4SURZRXV1M3V3STdvSGtQYmhYciswOVAxUjYyeUlh?=
 =?utf-8?B?SitPK3htL1cxcFVjK3c0dHI5T2Z2enJtNkdWOUpINEpCUytYQzdwQVEwRHMy?=
 =?utf-8?B?VVl3RkdWZ2cxOEhrbmE3NC9TaDUrN1RIbVJmalNRQi9odnd1YVBRMStOUVpv?=
 =?utf-8?B?Z0dtWFA5NmdmUmZ3YnlZT2RuOHVIWlhOTzc3Z2xadC9reHFmOEt5bTFzd0N3?=
 =?utf-8?B?YUJSMFdtSm5WR3o0b2MrQk44RkZFcVh1K09RQXFEbnJ3R1d2eVZjMkRSMnk4?=
 =?utf-8?B?LzhqTy94TG9tNTJwRnJLd3owSHJlWjBYWUl4b1lCZjg3TFVjREIyaVM3UjNp?=
 =?utf-8?B?VXJIOFVLbmIvMmZGOTlxbDBWOFd3cjJZSkRtUlhvaE5rcU5TNE9GMGE4LzRJ?=
 =?utf-8?B?RVh2YzFtOFdYWGU2REIzaG5XU3lSbE5tcGlCaittU3RoQmZzUm1JanVBSjU5?=
 =?utf-8?B?QWZXa1I0UGljL1J4cElzNkdudEJWNUcvekZrVjB2UWFrWHBwU05yano3UnM2?=
 =?utf-8?B?alk4YjlyVy9oRU9ZQk9yNCtqa1NhaG9GOW9nNHE3UWxRZnNOWW5IWTlNZkU1?=
 =?utf-8?B?azBoRmNCaXF3eW5wbXl0cEFYem0yUzZuZk9KTHZFbjZYWnJDeFdvUjV3bjdz?=
 =?utf-8?B?YWNKVnV1c0JWUlhJV1NwWTNzc0FQTEhyZS9LaEVvbVJGcDRXRnB4UzNhcXky?=
 =?utf-8?B?V2FPU1JCQUJKQWxnQlBVT2c4K0VocVRtTVRKUVlnYWtuSHplVlB0RnhZZE5w?=
 =?utf-8?B?KytnN0JUQkIyWFBWOUZnWDg2M3ZBeER4czArWHNlc3FrY3l2Rm9rWnRsSGtS?=
 =?utf-8?B?NVcwbkp6ODJUMVNWZ20zeGlEM2VkMHB6M3phdm9YdEVNMXAxcUtaVk9YSU1n?=
 =?utf-8?B?eVp0d1huR2JFQ0VsWjZBd3J2ZGU2YisxU0RlcmNKdmxSbkVVR0lnZklvRjV0?=
 =?utf-8?B?RU1Zb1NEdEsrYk1jOXpMZWE0UDhicDFDWlpKSmM3OEVSTnJHRlVYRVdtQ3Fa?=
 =?utf-8?B?Yloyd1MxdjIyOHVNRi82aHdGeGZ2K1E3elNuMExUcVhVL1BLbC9qTHhIblEr?=
 =?utf-8?B?dkl2MVBQY1BQcHpDUXRVN2xESCtkdDFEbVRJUGgrdm4zbHZLbGVlSkt4M3JP?=
 =?utf-8?B?Y2xBNHplbm03bks2cXVjN1l1MXNGcjljT2Y4eTg2bm1IenhtMWQwUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a90163-497c-4208-8823-08da2398932a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:12:23.9104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIeNr36yFOfqjVf8nJSQ3zWOuONtNsihRDiPsDv9Y3Z8eCZktACY55DE3c42tS53Fh1kFlAQft6ZhDSWncoHkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2551

On 20.04.2022 16:13, Andrew Cooper wrote:
> From: Bobby Eshleman <bobby.eshleman@gmail.com>
> 
> With all the non-CONFIG_CRASH_DEBUG functionality moved elsewhere, split
> x86/debugger.h in two, with the stubs and explanation moved to xen/debugger.h.
> 
> In particular, this means that arches only need to provide an $arch/debugger.h
> if they implement CONFIG_CRASH_DEBUG, and ARM's stub can be deleted.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


