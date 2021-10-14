Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B842D5F5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209151.365509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max09-0008OM-Pk; Thu, 14 Oct 2021 09:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209151.365509; Thu, 14 Oct 2021 09:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max09-0008MQ-Me; Thu, 14 Oct 2021 09:26:13 +0000
Received: by outflank-mailman (input) for mailman id 209151;
 Thu, 14 Oct 2021 09:26:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1max07-0008MK-QO
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:26:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eb561c5-09eb-4c32-aca1-273e167621cd;
 Thu, 14 Oct 2021 09:26:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-VCD5haOkMICCyBN2iuL37A-1; Thu, 14 Oct 2021 11:26:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 09:26:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:26:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:2e::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 09:26:07 +0000
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
X-Inumbo-ID: 7eb561c5-09eb-4c32-aca1-273e167621cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634203570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSayV8mUzZhvPOGzXRpilHnq89NQN7lboAV7GkhCB9Y=;
	b=deqYxYE0m3VppC0rKxRqxrAo2o0qDoq+AOBR4Q2hhsygJcdK6H/nmcbKC56/5BWIzmwYTo
	H9xU4J6kxCIC/6V3VlEQKD2UvQwsiUEbzhVBrJ0aMQpdeGgxdeVX+pcexLoguaiyUaw4ri
	BxQI6PWGvBi4sWiy63RLgq+ZBQcEq9Y=
X-MC-Unique: VCD5haOkMICCyBN2iuL37A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEVnPywkeF476qBiYey+9sq00hQydJXf7DlBNbmL6QRxtdGvB2NEZ8qAMY0uka8M6ZIjyc1fuGZHIx0LQfcZWGoEYmPCQBZxHUtgzNU5EfzeAZVZmFrNTJ1YAPb3bHRm4QH+965FPG0IJUlPpAZJvMH1USMNKKwKvUtxR69AL9ySmuveadjl7U7tQY2t/CZjrdAG7RR+jbrZX8OQ7528qCqGcqmT0abjVJS7cfCtny140BPNqCyA8LRTjWgeqvcYK1f+P+fXR0USALnHTnesjhUebKhRbg09zrUrG9FsOJzVlbM9x7TsvbqVTA7ykT7TnvCBIifYfwgUBW25NvH35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSayV8mUzZhvPOGzXRpilHnq89NQN7lboAV7GkhCB9Y=;
 b=GF0NDUbtPUgehk9jfaIsjGSNP2CWvOSxqCo4spAQ7wyWidS0IbolLFsran4oMUs755aiy4z6AVXJR54ZLd4lmc34LkfkBr13MIRNTIs10XN/tnbspJzS2U3wyqsD3DUyyFCSDgIYOAOX3S7luLIvuVaX7cEVZQuZzkLq/DU7msOabp1NVybQ7xHVfjZSoLzWfoWV3+lhnljVR3cToKtu4pvLdiIktRVeW1hcTOrK0paPSYizKFJz0Lnpgo+oA6lYqHrDCNkvUHKC/USnkI5PUEiwnGZ/wSdtx7bn9Nz8nKtDASagGV3gFv1wzcUyNK6MAiP0AxlTLrnjpGlEdLJeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 44/51] build: add $(srctree) in few key places
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-45-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <187631b9-923f-9710-2c3e-208c464a3202@suse.com>
Date: Thu, 14 Oct 2021 11:26:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-45-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0ffebae-abf9-4af3-75e0-08d98ef4a73d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260833580F53296E11A21F94B3B89@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zcb7zo9niT0GJ7s3Y2oPDZD2qhiFB7iZl0DfHFByae32FvFRb/5lHEPJ+k4jq1MnzpmKpN8A8SxYpUkwM0m+wEmUTEAWQGA59EWXhQd59wCijtsB7iCLVlbIuQaeJ+pFH1j206Gh6/VOw3M1JBipqYYxwqfJVeOlTpljC8sMVtjewfFVe/NqMB7AZMF6pZ1ixEKIASGK8fbAy8jUw4KYluGcAMIcnWH1+kRIJwZJKTbCtE/B2pau5PhbljQJ9wKOU1z6ORu9MP6BKJwlZ8lsmFnmgs2nfavdISaZKyu4hEdZ4OaZOxzlsoAmHWxbRS/dIkTRNCqfoEKFTUcxG0Uy4y1FFAXv1UuQj6tIFd8c5EGg0X4cuLuhDVZXTEMhUPBhFK1WY7JTFzFlwp2NtfvI2Mw91biip4Gaaq6BkmpyNYvyYjfJnFQZgLwphEAgGUnYE1cFVzOTuMwyxDKxZpiY8XafBnq81g6eNPqTqI4ODbuj1MSJnRXvE7y/NtMth4XdA4YoAfDkYtplv8q57EcsjmZlTPeKX4RY7/DARMmqeUBC3WbiG/uX9hnLvjoNSelqEdb4Qft7atwtznbUIJAC0Z6FMghLX8xmjGNbaby9D7qNEF2GdwPdnkqV2TI0zmqNZFPBKdzcacPXWVHh/kbNvJc0cSO7tdmZZSVFlhFrdUUgTEfhhjcWd/AEqp3kI2cx2H/soA5I4L167psFXblPAJNT+ZQoYZxAGUOyqtZkcATQt9kithGMESSiH/Xh/3dz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31686004)(54906003)(16576012)(508600001)(2616005)(2906002)(5660300002)(6486002)(316002)(956004)(31696002)(558084003)(66946007)(66476007)(86362001)(66556008)(186003)(53546011)(38100700002)(4326008)(8676002)(6916009)(8936002)(26005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkZtWnhuajFSa1RNa0pReFhRSjRGU1M4SWx2QVZ6eG5OU3JmeUtwcC8wU2RK?=
 =?utf-8?B?VXdNVVc3NGlRY0ZpLytKTS9IQk1FVFBxRWJ6WU5jcXlab2VTWWRXUmdnOHdM?=
 =?utf-8?B?RkkzZHBFU0FLaFh4VFh4OG5MTHFIN3AvMjdIRVpic2thTXdoTG5yOTN1NlU3?=
 =?utf-8?B?VlpEYXM0OW5XUDlEcFRZdEJjR08rZ1lvRHNpVHRBYmFUdkNJaXpuM3ZZRk9h?=
 =?utf-8?B?NVQ3K296a0pnaE9NckpMVVBsM3RHdUh0LzViR3lzdzAydFEvODJHaGRxY2pP?=
 =?utf-8?B?QlJtTldjbzRNQXhVeDV3ME9XdEZWeXJCTi8xUWZ1eWlGMGhsenU0cDlEdVhM?=
 =?utf-8?B?U1ZnenZJeXpzbGRtZkVWN1JJTUhtMGN5VlhlWXVIbElWQ3U1QmFldUk4c3dt?=
 =?utf-8?B?aWdvbmZ1R0dCQytFK2x3MGYxazY4RFBzNnAwT2lFNi9zZTl4UnNFaXB2Y1d2?=
 =?utf-8?B?TjhjeXNLT3daVTFkMHFJZnQzMTBnODd5U3lMRWoxY2t4WGRWTXlHdHk5NGZH?=
 =?utf-8?B?MmozZjNkeHBrL1IwSXdZUXVXUTdPRzV2TGwxdkhxVmdGS2dGSE0zUytHMEdm?=
 =?utf-8?B?T1FRUTBaWGNYNS8zUmZkRllwWmpUY3ZjaCswM2o5VFEzTHpwekJDUVFZWDBC?=
 =?utf-8?B?MzMyWGoxbi8ydjh5VjdPOUVzYWRPbU8yYWZYcTRMWnNNMjl6N3dCa1F4OVlr?=
 =?utf-8?B?b1FHaEUxTVZsQktkVDhtajJQUHpsR0wrWnFCZ1ZqcThkaEU1WFVQMWJUVlRE?=
 =?utf-8?B?NEVNK1VDWExMazZ4aWF2QkgwUCtqUjBUZGVQek5YRWFVb3JEM3RpcG0xYzdU?=
 =?utf-8?B?a01vaVlwTzBPc2VBaWRiUUxzVUV4MDMwaTlzdXczOWE4QkQ5M2VFTDdQUy9X?=
 =?utf-8?B?WlZlaVpRTlU0VW5pbDh6QUJpYTFYR1U4RlRLeG5RTzIzbkZyTllCVWViS2Jt?=
 =?utf-8?B?SHdSODNFakVLQW5hdmZyYkN2dWZUYWFRdDkrVVN1dXNWVldHYVc4SmVnSEZB?=
 =?utf-8?B?QjloUjdyei9uWXAxamtsYnBjQUxWaXU0UzZ1T0dKVmhwNGFyOENPMzhUOXlW?=
 =?utf-8?B?N2NhZTJrTHdtRWx3SnlmTkZNN2hQZy9jSzVDWHNvUjh1c0ZhWmZpa2M3eEYy?=
 =?utf-8?B?Yk42amQ3WktaK1I0Ui9kNHZqd1ZGN2dSNXVuL2JqZnhzOWFKS0g1clUzL3pC?=
 =?utf-8?B?NGFET3drR1psRFFEZmRsdUFBTDJLbmxwd1M5VmdtKzNiSVNrQjBGOXA4YVZQ?=
 =?utf-8?B?bUx2RkhaZXVsMERHMEsrWlAzR0g0M3hKajlUT0Y5Z1ZURXl6NXN2OTVXVnBw?=
 =?utf-8?B?VnRFaEl2Sm05dUpJYk5YWEVGd2FEeTAzNGI0QWsrTVFzOXJDR3dqeFhtRUdy?=
 =?utf-8?B?NnVPMXppUndBdjBnZnJBeGlEQkpVTkl4ZWMweUFBaTFvRFIzWVFRamNOQVc5?=
 =?utf-8?B?VU5kMW5yMXk5ODMrOHk1N3hjRkEyaFlwSEtsV21XeHNma0ltQTluSEg0d2tR?=
 =?utf-8?B?aU02c2x6WXN1cENzaUVySHdIRnRWTnBmdFpyTmtLMmRyRlF2M2o1Zzk1alFD?=
 =?utf-8?B?eDg2RWZxSmRBdkFGdUZCcU9DQzJQTThIRHo3NlV2cmYvVk9FQnFoekpXcU9Z?=
 =?utf-8?B?dGh1Y3BtRVh3eS9IMHErWlJtNEVkNnc0Y1FGK0dGblNocjF0U3NiK1hwaVlu?=
 =?utf-8?B?by9za2tqYzNibEVRV3p4b0Fld3BKR0tCNmI0RVpobVJEUXNETUFKSWc5RWRQ?=
 =?utf-8?Q?x2+/PViEDsf4slVBVE5QO7SA4uSmztBXnKYWin7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ffebae-abf9-4af3-75e0-08d98ef4a73d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:26:07.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoIy68QW3GRlqv7qOgJdpLUXfdcH0mmCFNhROhYzVcdV+Ok8Ph848MrCNVtUIuJbsMW/g8YOHx1wewn9AnaLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 24.08.2021 12:50, Anthony PERARD wrote:
> This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
> apply.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


