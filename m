Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28E3BEA2B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152349.281473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m190Y-0001y7-0I; Wed, 07 Jul 2021 14:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152349.281473; Wed, 07 Jul 2021 14:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m190X-0001wC-TF; Wed, 07 Jul 2021 14:58:37 +0000
Received: by outflank-mailman (input) for mailman id 152349;
 Wed, 07 Jul 2021 14:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m190V-0001w5-SF
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:58:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cce9162e-df33-11eb-8508-12813bfff9fa;
 Wed, 07 Jul 2021 14:58:34 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-dQJvpEw8MCqAlpxDPzGxRA-1; Wed, 07 Jul 2021 16:58:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Wed, 7 Jul
 2021 14:58:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:58:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.24 via Frontend Transport; Wed, 7 Jul 2021 14:58:30 +0000
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
X-Inumbo-ID: cce9162e-df33-11eb-8508-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625669913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/dvHCIjx78q5kgwP6+xD1Jn43uap/PQanehUWu6ESg=;
	b=iRMU64zF2MeliIQfEEL+2vHdtluBO7HpMvzwcwkTXRYMgC4hw6jklZQ1fLqya23LGw5LYj
	oD31RZK1XR31yTrbfdRhKLKASIy/ve3V+M+qyJAHwzqgTQJpNijDlxlFfGaCN+5tEUbwyI
	AY7LMqGQ8O06GN6jH50YfaAbSBl8+Yk=
X-MC-Unique: dQJvpEw8MCqAlpxDPzGxRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELq2MNlwECO+NTrv8nfnl01AadH4r5YqIZZHPjfNMjTzJ5TQAVAFYhnYNhoO0dER9ecD3NmNvhJO5qsg/klV+9EFg58y28KixxgiJulKj7UlY7/PYJeHHcebSpfZ8HeiJUtXFFOm1QoUi2mYc5/DlKVNi1GVlPZJXA0Q6BfLVYdBsaBOx1BcESzo82IJgl/4+DKNQdgjW12tv2NSy6gKIZq9Z03iUS845AJLs9D/2LxI8SYSKq4HPMggtVwGZpyqKsDYrNEONhbVCgguLObexEnQ56ul5dxuo++eTZLUtQDWpUXEy6ZuKvWLbu4V0FTEGmiP156N1cpAJmyTiuM4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/dvHCIjx78q5kgwP6+xD1Jn43uap/PQanehUWu6ESg=;
 b=bIOPvSAaWULyIeDnYLNXM/nR73coAaLnbGrZCVbxzTOo1hJIbeBbHGzVgWl8arj+YzEx8ey0Hv9ir4fd3WRwzZRIa5mwpqAUCVeIv4jEGqaFVqTYZj/rUaqQiv4RDg2qh7SIloj/X/YC1dNyA3uDUTSQtwSciiG4sU9+aQbyXrPdznnCvrL8pif+5KHU/FC4oKgu5WNS4WknxX8aZOnUy4EdqL/l1aiGr+/35eudYh+a8PLcD9b6F18Jzb5M6W1XkMkPq96mJBBcR5KO7hkqRGDdRzUtFwvvWNbh2gxQPVeHrcyKOApc3jyWU/1dyiRoYFMrIBFKaDNed1JwqV2SIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 07/31] build,include: rework compat-build-source.py
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b7b6366-c138-3e92-3a9b-640fcf949b15@suse.com>
Date: Wed, 7 Jul 2021 16:58:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-8-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e6b2e2-a9de-4a58-b283-08d94157af2e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64782576C05A3CCC34460DCCB31A9@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUaBzWLw/DyB/+PfB/s2VuPOwYiqUbaCFT1AaexNZCLz0G4HkeN3mRLdOs6wYcxjqxc7WJKg0K+mWTSbLo8Gtn9mKIRVRwFwZjHanVNFL4czuljGDdDe4H5r6W80yjhlV9VAfFJnmWftXW1ChvJVy5nx53VGcRsa6ZbzNWfo4HEH05JJC5b7FndDmoYfxXT5OSWM67f+dRjPyk2z/IUtsHvzp7oA3vjpzpSIMh6TXZJ5gxbWPT1STVY8aKQWYod1efJSEvwrCpINqvRi+Q0xRLTI9AzeSwviP4jSoTT2MqSb5eTNpLSAgG3TVqK7XPLjamgmikgZKBjSm7NzkjjezihLlWLLPZ9n9Sd/CuZvNNkvDfTAKRiROVgNIoIAo4oAYioPOFcDesA4cE3MmIFjIfXqroKCFA5MRcR+XjPlHpnvfmHXOZ2MUhjuDuPgDjA9dz9tqrFxx8W3W21RACRBwlGIZhICUK3ebHpND5IqunljZRiV/eaVIByHu1GO/BkZ0W8vnCd7qD2N+g6W9oIuIS4fMfutgXPVldyTxJQ78L7I2qMtKM5xnChgAQsq2YF7OZWvkFpBj/SeIqJQx6hoKnziq7lsH5PkZKHrH5K40/3i6eSkJLdSTw5v0lD3PomdhVZzN1bZUGqc1l4VZVolAP8IT1AMxCvNAUxQvMFbZYG9lySDIkYLeM6Rq06l3izUkSix0fl0AVKk2+BzsaNTi+84DTJuSBGQDZfeRO0g3jU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(39850400004)(366004)(376002)(26005)(2616005)(86362001)(956004)(6486002)(478600001)(8676002)(8936002)(186003)(31696002)(54906003)(36756003)(66476007)(53546011)(2906002)(4326008)(5660300002)(316002)(38100700002)(66946007)(6916009)(31686004)(4744005)(16576012)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ljY1ZhY29qWnYxTStoQkp2Tm1xRTRZdFRxbDBxUG5TYVNMc3BmUGRVYlRW?=
 =?utf-8?B?RjgwazREUnlvQmo0TmNCUHU0WmZVUlR1QTJjbzJqUHhzeWx6NFJmMkVvYkFa?=
 =?utf-8?B?T2h1Zlk3bDNqcjV6ZEJpN3B2cjE3RzFMY2tESU80cXE3UkdlSHpNN1lTUmMy?=
 =?utf-8?B?ZTdVMS83bm9GdEZqT0ZyYlQwQ0xWeDJvUG1iSWhsWHQ4R3VsVEhsVERGY3pj?=
 =?utf-8?B?VTZSRmQzcHRoc09mMjNScEp1QnZRY2oxOFVNMlMzV0NDWHp1SG4wV29rdDFj?=
 =?utf-8?B?Z051RXVraTNFWmZWWVFHc1BVSHVpc1pud0pJa2JTUHNZak9BUEFNSEF4WXlW?=
 =?utf-8?B?OE45b1RsUmErUncxc3c1UzVmeWtOWjdqSDlQaXF2RUt3bFk2a3BUT0NVNEZP?=
 =?utf-8?B?T2wwOXFYTmFWaE9wejlDcjUxanhBWnFHSHJMR3NaaGt5dHRMWTVBb1FqUkx4?=
 =?utf-8?B?RmxLOHU5c093b1pDeFJSYTRIejArU3QyQnNoOTdCczViUlBTU0t5WC96aXM2?=
 =?utf-8?B?S0VGaWRJRitIZjQ1TWZVVGRUMUpGMUlsN05PUE9uYmpxWFdyR0FrUEtCNE55?=
 =?utf-8?B?N0hLVDBtU1pFbkRWNE1PWnpqNGdVQVhhMGl0Z3ZBcUZTdTIyaGp0c0ZzWms1?=
 =?utf-8?B?RktPcGtkQ2ptRC9oUGZ2VWlwWnJ0aDY5OVBaSGlmeXBUSlBVZExsNkUwMHVM?=
 =?utf-8?B?bldNWG5TUjV0T1pKZWJ6SUlSTjZZYU5UVWRNTGlsc1BubFhMUStBeWFOdk9R?=
 =?utf-8?B?TkJMVTdNeEJ2VS9UeEtzTTlMVFBwUmxDaWVIQUZWWkJicEo5VG55ZFRiOTNO?=
 =?utf-8?B?M3BmSG1hQjZ1ZXVwNmg0Y3Y0WlVIeVFtTHN1L2YwT25mbExyeFh0dnlwRGFv?=
 =?utf-8?B?ZGR2TTl5UjhDYXBocWNtSnVnazlnWG5YUnFiR1NLUkMyWGIwWUlpOERxUC9t?=
 =?utf-8?B?VTljZGVvQ0VlSERUTjduQXJGekp3LytoK1h6M2xVcEoxMzByVStFTmNISG5F?=
 =?utf-8?B?ZGNVbldMZEIrQVJTRGVIZHhhL0l0ZU9MUDVmSnBTeTcrM3drK3RwUjhuajJN?=
 =?utf-8?B?Rk8yS1Qwa2ZXZkZILzFBYy9oU2VDL2NnUDFSRks2MGRvem1NczZSRXA4YmtR?=
 =?utf-8?B?Vm42WUgwbnFvUGl2QUIxQ0hiZWFlNlVCNzhrS2VWUVNSQlk0NzdrUExTb1lQ?=
 =?utf-8?B?M2JXajdCbUFsbVdoMnlyRWxLT1RhSTRuUUFIU1RIMEFGYjh3d3hVZjlGajBL?=
 =?utf-8?B?b0tCRjl4QVF2SGwyRTZhaE1sZnpoa2dsaFFOOFhjcW54OHZQT0ZpWFNobnhP?=
 =?utf-8?B?cXd6RTVJZEdmK2pEMkpLNWc0NlhhNTErVDV1YTNWVGNTTDIyNXZTNTdRSXNh?=
 =?utf-8?B?dnBGSEJzQzB5UUNJVE5HSVdZRHRldHVwK09yQUQwYUZLcmtiZ1k3R2JUQ0xy?=
 =?utf-8?B?b2JlVVFOSndKVFVveFVDSWRLSUQ2Mi9iK1o4c0k3dlJ4SFhXWXFFbUdMWU1s?=
 =?utf-8?B?QmpEZTRyRm83elI3YjJBQ3habjhjQnF2eG5zN3dtUENySkFkMG9RbklZQTdx?=
 =?utf-8?B?L1lUZEt6eEZTTElaTDZrUUJvSUpETm1KVTZoNE04bU1raGN6Ukw2Vm1VNGpt?=
 =?utf-8?B?OFk4T1JjSFVEUEtzclhGZDk3ZVlpYlV2bWFUMHltbkVKL0dwdGFqNjVJbEtz?=
 =?utf-8?B?UUhKUjE0a05uTWt4eUhjU2h3ZWZZTXlNdStkUG5PUytwdjhwN3VOY2t3Z1p6?=
 =?utf-8?Q?Hd86Kg21edSyblih6kZLm5SoyonbmpbJRZljTHs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e6b2e2-a9de-4a58-b283-08d94157af2e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:58:30.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4Y2NDjzQqJ9uMjYQT03mJVRtlEoeKioGN9fg8l1LPo5/6MeL6130BfyhiTa8yR0xsSB7UqcB1MLNP0fhWe7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 01.07.2021 16:09, Anthony PERARD wrote:
> Improvement are:
> - give the path to xlat.lst as argument
> - include `grep -v` in compat-build-source.py script, we don't need to
>   write this in several scripted language.
> 
> Also remove dependency on Makefile as the file generation doesn't
> depend on it anymore.

Did it before any more? In the subsequent patch I can see more of
a reason to drop the dependency, but neither there nor here I'm
really convinced: In general I think every generate file would
better depend on the makefile containing the rule used for its
building, as a change to that rule means the target wants
rebuilding. Therefore for the moment ...

> No changes in final compat/%.h headers.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

... this holds only with the dependency kept in place. But I'll
be happy to get convinced otherwise.

Jan


