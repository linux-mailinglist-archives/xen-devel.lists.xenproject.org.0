Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1193F14E5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168433.307522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd8v-0006h9-Cy; Thu, 19 Aug 2021 08:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168433.307522; Thu, 19 Aug 2021 08:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd8v-0006e3-9Y; Thu, 19 Aug 2021 08:11:17 +0000
Received: by outflank-mailman (input) for mailman id 168433;
 Thu, 19 Aug 2021 08:11:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGd8u-0006dv-0J
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:11:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a480452-a27b-4a7f-a894-27316e9d1c48;
 Thu, 19 Aug 2021 08:11:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-5M563CDBNb69ghbuG5adjg-1; Thu, 19 Aug 2021 10:11:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 08:11:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 08:11:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Thu, 19 Aug 2021 08:11:11 +0000
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
X-Inumbo-ID: 4a480452-a27b-4a7f-a894-27316e9d1c48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629360674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfn88W/TL+6/Kaqc5/V6BscKLs5KNXuBrQy7LXoKHGw=;
	b=hxmu7+QdYELUxD6pMVQioTNHYxXT47O1dI36wiOW+D+4i4SUCf1sVgZm6AYwl1Iedp/LOC
	eXQlJiYKktnUWiQfS/MbEB1MsYsWWUQYpeWgnYRJoRdc5Aca5zlXi4+ZbT0h6b4LxDeGy0
	hTz+l7ZiEF7daB+hq4kLFdQpQSNu+pk=
X-MC-Unique: 5M563CDBNb69ghbuG5adjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcGIjQ0wt5IJ5DMCyVNdBtChMaYQzgFF0znEidQ/5Ea11fLNWwJezs27eFEuLe51EfnhoqBbFUEh3Y48RLjQ+iISDIRM4GO/Gboc7c5/irxuCSBUJe+Ox1ijsaxt7pFBt6JfNP99OojLz1MXxwuS03Wn7ufbCLtPWDape5jdhUDgyWBIWH1bf1R1KfMQFOQ2Ak3qiOf3MpWRGNnF1ZFa7indF727qmJ8bHdRWQ58z+BkJ0PV3x04OIM90YgjpB0UYFyPV1D6SHBMRp84eILwE0J+yK5q6heOLtCYGn3vNigSD4VlVJKzhexR8ObpPCA7m5/rwswDUeuNiUDu/dcQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfn88W/TL+6/Kaqc5/V6BscKLs5KNXuBrQy7LXoKHGw=;
 b=WQUd+W8tQE+lMNBYh2yTZxlU1L6WbDLhm1f2o5KBj+30knu0l4t/jBI6f/G8ctE1OHTCcRrm7tlaXEH7qe6VOWtzioqOUpIkgNqyhwf3VR03fjZUWUCjFiSiQN5y9xroWaOFd5O5+DFUwv++VHiyLzKY4Gw6YSaJgstY0313lsXy+4KSzIzBhPVqVgP0zn6dnFN3HuTVsnC0zuOx09CV+YGjirokyva4s98Vc8RHJWWaqhlSswYItjcYnimnSTlWuALL071VEAwmK40uLFeStFKcAz6zV8PEniYptPXB/5ApdfcWJmCwb9/3f6n77lZqq+Rski/m8fBnVgk0lEhj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Arm: relax iomem_access_permitted() check
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
 <adfdc3f6-5801-8387-6400-393f2536c6cd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aa93b5a-3c73-a662-63db-5babc69078c2@suse.com>
Date: Thu, 19 Aug 2021 10:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <adfdc3f6-5801-8387-6400-393f2536c6cd@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6caa0543-31f9-4b89-900a-08d962e8e85c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64772879C68C9E921343224AB3C09@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bWKnLPgp8xh3gdeflLZmh/8oO8gBgAJCRa8Xb6Jfv2KyfXQmOdtDiVQ0WeEVkHI3vlBTb/OTE2tNgeor4c42KHbqfs1jaLWFhPz65xnqysi0D7By9awFfRmGu3YcxvHJT8ZtbVsjThi667o1YnNkg3p4FNXodaGojFMxLwJOh0Q2mB952BYMoVO7fSSGIDI4ofBX/9mFmTZYwWwawS3G72gOMcUtCw69l23XuEjLAX2ENE4pdhMAUWlnJyDiR4IIObmrBrgH+3tmomEtAtdF1D02x3rLgQms8Y9sBUQBb239YMXs+ZGWDoHvd+28/3Vf4XzIseHGcOtEB5rRYSM9VEcLohi1abVqyVv0U7PkrP1xwLzYsIm0mWtiMgntM2KG0mawth2qL/7RlNTrRN9fow/fqCUsuUdMtEJdDLAUNafJ5BJzsiCI8dVc0dmqSK3n7kQzqWFpScoFuNL2RpgzzoUdZAC2mbIgPeyp8Va42mSBZFSwV+iH4Pz1+Dp9JHm4M36EbEYSxmKp16F8oTLalMNEPKwS/JmmY47z6V7Qh2czn5WQsf81HvyAfdS4Q9Be5wFoDZluxD5GzIEHTlDymwzhluFxorYn9wzXVQn/8AN8kEWzP/+5KzAjAZzKvnkWewIxzf3FHFv8dz/yqNnF0qA1npabOCq6Smc5gSZYUmO1gOK0rOa1DwrpTPniXK/Tyl4C8YzfoXDySAddwEXGDBwRhL391p/+dkub6qOy9ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(346002)(39850400004)(956004)(2616005)(6916009)(66476007)(8676002)(478600001)(2906002)(8936002)(86362001)(4326008)(83380400001)(31686004)(16576012)(31696002)(66946007)(38100700002)(186003)(5660300002)(6486002)(26005)(54906003)(316002)(53546011)(36756003)(66556008)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWlnOXJUSDBpblliRGNYS2FjSW9MRFpxSVZ1LytTRS9vd09HcGhTK1ZxUWho?=
 =?utf-8?B?WDAzM2lkOEY2Q0VtalBMWDBYYkxxN2w2eGZNVWpkcUZwMU4wQWdEbVh6bkd6?=
 =?utf-8?B?OW9nSXBsMzJFTDlHSUZHMXVsS2NWb2MzenN4cWxVc2tIV0JNRmU2SzFoekNt?=
 =?utf-8?B?WjJsazlpU1RrMTltTitnZWFlZmNUZ2VPOFp6enpLM3prVnlINzFoY2NXanpR?=
 =?utf-8?B?U3hVQkJvVG9kRXFoQSt1UXNLVlVJQ1FlWlUwYlVnbWJ6L05SSUJZeWp2UzJF?=
 =?utf-8?B?VGRhYW9MaVVaS2NRNzZIK3huVDBnWFp3QWNLSk4wVmFJc21NZkdBUS8vZzI4?=
 =?utf-8?B?VSt0TmxCQ2IvTFNpSU1xNDJyTmhORFRRSzhYaG51MnFJdjdwOStWN1ZMbEds?=
 =?utf-8?B?aUpoQXpxZ2pYRklrODJEbWNiQW1lZU5iS3BSVElXMzJxWmhqanl1Y21aUk9Y?=
 =?utf-8?B?bDcxYlI0bVdORGY4YkZvUFpsZmlOQ2JZZHRBeFNSR0dDY2JPbWplUEd5RGIy?=
 =?utf-8?B?SU9pYSswaFAxaFYyQlhkRVZGYjFaRlU4YnhlTW5SQTRQSDJaYkNJUHN4Q0Mr?=
 =?utf-8?B?TUQwaXBtczBGQkFnSHc5MU9rSHdvSDZyTWJBY2JZM3hoenJMTjdtclE5TWY2?=
 =?utf-8?B?WmpRT00vMnRZc1RrbUtXSVFsZGdqaXZkWUs0OERWdjE0RG5NUWRKa2MrU1Bv?=
 =?utf-8?B?czlCcUNRanV3QXUzcExGZW9aUzFIYjg3ZXZKcFpPaitMajZ5R0RaU3NUYUdP?=
 =?utf-8?B?dlluTWtIaTVxOVdrQzNyN2MxSEV6SG9aV3pQcHlCOExkSEUydi9qRFg5ZDRu?=
 =?utf-8?B?T3QxeTJ1VllMNlRMRTJHNzFyRlhqOVJnZHBqZWUzbEpGTmRDTHJsTC9OS09z?=
 =?utf-8?B?UE91NnRTeWJvOFI1U05sYlJ4ZjhtdXBkcFdWcmhIVElJeVJzNGRaekFTOTR2?=
 =?utf-8?B?c2VuVnkwaEhGekhzZEdycjM4RG5mSTFrejdJcEhKRkZBd1hpdWV1ZVgrbWdy?=
 =?utf-8?B?a2VGNHc4bm1UVDM3WndHanZxZktoT0FvSGY2VTVLQ1I4ckttTkpkeTdVMEtz?=
 =?utf-8?B?c3ZXdzB6SmtuYWlBT0tGYjFWQis1SlZWK2luRTVTbjBJQ2dZMWt4Z3hCalRY?=
 =?utf-8?B?NUlEeEJ2enZHa2orMHBYZzVMaXo1amJBVldjV2NKMnNWRnZ2aVFsNjlZVitI?=
 =?utf-8?B?cFAyMTBjQ1RXSnF4ejJhOEd5WkxGTFJST2N3cHh2Vkc3RDNWdk1hUWY0YTFV?=
 =?utf-8?B?QmNGYnFOajk3R3ljbUduUmtEQnlPWE5BTjRsK0IvSVRxbldheEJtUEF3VVdM?=
 =?utf-8?B?YzErVE1ZUER2SndYbUppUC9iQitrR1k4VHFHYnhIdFVjaEFFeDZMaHMwK2lH?=
 =?utf-8?B?T2RPeFNydmF4QXUySnVmNFZDMjdYdVR4dG9OMlIvZ3FYTWo5c1pDUkFzOWht?=
 =?utf-8?B?Mm1JdG04VEN5VGIweng4aG5oYUJNcVNzN2k1Q0pKS3ZiRnZSamZQS1ZXMUQy?=
 =?utf-8?B?NVF2Y3VWREI2aG9sSU5NUDFPQ05iVjNIeUh3NVEwT3dvTDV4T0V3SE1tWG8x?=
 =?utf-8?B?NytlQ3Ezb3lGMEdmQlhESmRHL2pUeXJjbUtJdHlJZXRQVFF3WUJNSnd3dllX?=
 =?utf-8?B?RklrOVIzQ05hS2tJR2l0eSt2WWxIQ0g5Wkp2OEt6czR0a0FNVXVBeU15bitu?=
 =?utf-8?B?Nm1vK3JhaWp1UFQyZVpEQzBkWHpoWkE0aVl3YXpnclBnRjc3a3pxUWswaUkz?=
 =?utf-8?Q?3u83UDEUC4ErcCtH3AcapdwwEgHmcdK4/oFGk+O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caa0543-31f9-4b89-900a-08d962e8e85c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 08:11:12.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jbtb5TuZAJEVMep6br3A0pHtj0o1ySwmul0Coh11UOyj7f1m6kz2YxDisNpKElsParR3g3/hFRxPLUC0AAn8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 18.08.2021 19:44, Julien Grall wrote:
> On 18/08/2021 08:52, Jan Beulich wrote:
>> Ranges checked by iomem_access_permitted() are inclusive; to permit a
>> mapping there's no need for access to also have been granted for the
>> subsequent page.
> 
> Good catch! OOI, how did you find it?

In the course of my large-IOMMU-mappings work I ended up grep-ing for
all uses of the function, and this one - while unrelated to that work -
caught my eye.

>> Fixes: 80f9c3167084 ("xen/arm: acpi: Map MMIO on fault in stage-2 page table for the hardware domain")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan


