Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF45F094F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414119.658226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDax-0008V3-TS; Fri, 30 Sep 2022 10:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414119.658226; Fri, 30 Sep 2022 10:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDax-0008Rc-Q7; Fri, 30 Sep 2022 10:50:15 +0000
Received: by outflank-mailman (input) for mailman id 414119;
 Fri, 30 Sep 2022 10:50:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeDav-0008RW-PI
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:50:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d1a219-40ad-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 12:50:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6809.eurprd04.prod.outlook.com (2603:10a6:10:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:50:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:50:11 +0000
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
X-Inumbo-ID: a8d1a219-40ad-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQ6MyUsEH6aLgQc1OTGQ9p7o8Feax54P6Zys6xBlJsDDqLMazuf6f66G6d4wOlPfWhIFvwPJaVIa7UnHzOO4XBi4Dgwy9HY7sY/yricgj5fZUwvA9hwDdtpoxldgkumYgM7j5+ocWx3eIy5fYhcovFtGQpz3rUKeE/lyuwcYrTUdoiR9TEUoCHTMSITK6IGpIBUuEHXbTuZv2wWeI7DlXTmubPdEpseuH9IFKgJynKeV+XZXmkdthmU5vKc/fsHPDMic2Lu0aVqktq5tK9VcwKUJxGifAoxZ2f1ks62pp3p5B4iQRD9aEWBQwe3V9eqBzc239AuQFiuoQj7iFrh/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj2a+dRMWO6m3CB7A4f7HIhY6I6eKhA/SbsW2g4szgM=;
 b=UbALCuewkdfGGQHtj8ZvKffifn0GH0v+JU4lOAnzHRlefHu8/b0qj8lVb9LUMdNKU4xvXFGWflZt0+2SlcplBMzae3Mkn0nFIQnt3co7/4wXow4bBrh+J3+ugRXoheJj1SMVMY/fZXD4kD2eJyU7qTSXGrgEkiyqMTgXkWhPjYcoPQSk3A+b+YnpjnRUOsAiU7/d7N3uhqv2oU4xTnM2Ii1gQWS5207VEIBou8/gA+C2ObEvMhTw4qyCla5g8K25DRtFrIvx8CJbtyRa1ZmnIQRMNdWtZNFJd2QvokFL9yAvjdINjKEVDq9XFF8S895dbxiPkpesg2jUodpM7uVqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj2a+dRMWO6m3CB7A4f7HIhY6I6eKhA/SbsW2g4szgM=;
 b=liZsuHlq+4rp+ZQnlWplSiEdMy1caN2I+SLMv5/SQrDgzgmo0nR+TLz31SrIMDdTM15jV6eGEFG1bM/KxOcdNvJcZk/XvmFyoJjU84tdOw/Sy1XW6ygmLSJT1KSdezCuDS1rljnFeoPI/qjPMfM2zLX0844LX0fEHfTl+60Gy68qDwawgGpLrvBI4pxNgTHor6R+K0gfrV6uT1+LKF2h/4Ut9YIYp5fISBiDOvepgoh8hNdkEVPZE/yOrJerJAuqrDV/CzGDTKaxzWaFjPbpfifUoYXEs3R450zUrxpLrDZhFOO5ADnwF8wjSabma0Xneb5naYA6gRK/KR6qKBYyxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6816f9ec-ecf4-0d6b-4eaa-eefcf7b07a6c@suse.com>
Date: Fri, 30 Sep 2022 12:50:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
 <Yzan9D2gZJ6yN3wq@MacBook-Air-de-Roger.local>
 <bf0168ea-f78a-477a-d3f6-cbff22b07cd1@suse.com>
 <Yza/AX8LmAbJuD8i@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yza/AX8LmAbJuD8i@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 254d62c8-bf54-454c-996e-08daa2d18c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6DbFOg0+VSzuRgDjwtMPJV+yR9W8w0lUMQdtLfLmZkzH+UuYB6RAq/gU5zAYGUWhL/ZJgAb5aqAgGKgvQ0MZ4RMVUxKIKAJZPrYrA8qe47WLAa/QZlheVMA1ojvl5pE1jwczDaycZI3Dtuc1VSqgYGc21gYS3WP3atJ56aA7VUNXu2uLoqhgwPA+2Pd3+OppWC3yZz3X6kEFoXHoOOq9xWl6ryKHf8TgqN61MzVVmBEuEqIOIWA8NC5akH0bJjO7YGggYNlCgVglCH675r6IvxA96jBJbSipbuJij1DJ147TIx1WzOh1CbVWDpD7b8j9XNKmQh1hUihm4WMIk9TEc/SaUIMyTywM8TJzBrEwAPgJf9Rbgg5pItmgpm3rg5LMkc2oPV7278CGV18TvaeJqDaVSsWMZDi/Ti/jSdhxf/fGJcrPc3ZnMNKTuDgDEnVwXN+kA9BQnDCViNduoQCD+sYzSsTiB/BL+2/bX3YFDBhkVrVsWhTMEIUMScLwrJvtVhF1LyEG8E9a8sHZsBwtuoiIqwvJYaiqvuc/I/sOflt7TI9SYk9gdQmtzqo0lTxpLyPxKYn1dcTkoGnaljLgeLts9H85PqniTIF2WR+ZXb5WwlGW0I9dCd8UwELda9m08zeugux0sb0O2Wd2PCE2a+NNRbMar7p/bXXUKpl7cyqAvxTon1eDCsAChwPp1EkfF8jclbvpC7JI+tAQQahtyFjKJ7fhyyHjD4QG1Ru0pAHyuCrVwGvosrZS4aTjO1nEykx56TrRXiZf8KK69wTgq3rAu+V2A7VVY6ELaulDnSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(66899015)(478600001)(31686004)(6916009)(316002)(54906003)(8676002)(66476007)(36756003)(2616005)(2906002)(41300700001)(66556008)(66946007)(38100700002)(4326008)(31696002)(6506007)(53546011)(6486002)(5660300002)(26005)(6512007)(8936002)(186003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUwzWG9kTDA0K3BBNUgzTSthNWxmUnJzUFdRSWl1Q0V2VDJhdEFPd0tSSFNE?=
 =?utf-8?B?Vk1pS1h0VVdaSm9UTE1CRTVXRkpLcVVHVVNWT01LaEVWU1Y0OGFyR3BVQUx5?=
 =?utf-8?B?Uk9mSEI1M0s1TnFacERQeHRrcm05bXg0akN3cUI2Z2RKRHNmY2NQUTBzalJG?=
 =?utf-8?B?eGY1blJUSDk1b3l1aUdRVFA5UzVVWTV0ZENLVlRtYnQxS2sxeEdQb1dqSFJR?=
 =?utf-8?B?cExlVVBFYlBXK3JSZ2YxMTBpdnVacEJzcTZ6dGl6M1Y4Ris4U2FETUhpajdF?=
 =?utf-8?B?MFRqL0tia0JPdlJ3MmoxV2ZDS1hiUWFRdlh3T1c0YWs5bHdSMlJmS3U0UlY1?=
 =?utf-8?B?NjlwYmFRcXd3RFFEV1lPMW5DWEcxSTdKYllyK0VDQktUWmE4VXliQm1WVEhK?=
 =?utf-8?B?b2JsOFF4alBZc1lYeHE5N1k3SkpOMjYyUWsxTTNQMTMzTnI2c0d0cjRFTDZF?=
 =?utf-8?B?NEFzc1hBQ3BaQ0JmaFlFczlBUW9rSDlhTktqbUFOTGpqMzV3R0JhMlhNMjd3?=
 =?utf-8?B?ZHBOMW54S1lxbWRzT0k2ZEFKczJidTVVaW8yZHVJZk5iSmVqV25EeklrOFU2?=
 =?utf-8?B?TG1lYk4reHh1OElGM2hkTmdTWXhPTElCRFRueHZpUnpoZERHbThuY005Q0J6?=
 =?utf-8?B?Vkd1ZHFocWMzRWlVTEZpd3UwWmI2eDRsTklwK2JHQUhQeXZ1cmMyZU42c3RR?=
 =?utf-8?B?MG84SzZ3SmFpbmdvdXBYOU9iQUx6ZUoxRjc1OHBhZnhjWjZFeUhUOStXNC94?=
 =?utf-8?B?UFpRSkRvNjlZUHNNMlFnelNQUldjR0tURk8vSzR4ZzZ5akxhclA2dWRraXo0?=
 =?utf-8?B?NzVrZ09ibFowcVE1VjRCNDlnMElmQWJ6WVMzczlhR3QvMTNhYmhyaHJYT1BF?=
 =?utf-8?B?NlZTNGVsMEdIZllNWTNkc1Zic2s2UzNkclQ3U1l6L0s2ZHRoTlZENTd2d3NT?=
 =?utf-8?B?MURjTG1Ja1pTQ0Zyb2hDWjlVUjVLdkgvRnl6ZzhTNGN6VHZqTU9OZHlJbitH?=
 =?utf-8?B?Y2lCVEExVWhnMUZLeE9yMVpldDJLSlVrSzdlaVYvS0M1eVk5Z0NIOTVDNUVY?=
 =?utf-8?B?TDVoYTF6TExIbzZUOUl4cE1YQUYzRWpnOVlQakMzMWkyeEs1MUJFVFpob2Jt?=
 =?utf-8?B?NDNiWlFTWEFQR1lsUmNoczBxNE4vSFpwRmFYVEZ4eTR5b1BmVjR3MFU2RzBF?=
 =?utf-8?B?bzEyN1ZtUnhyTFg0QlR1RUNEaWwyMncyVGNHOFNzNnpzak9GZGQxL2NCcEcx?=
 =?utf-8?B?a1V1QUVPbFFkSndBZS85TUFlVWJmNWZqaG1wa0JLbW1uYktYS3U1Rll4RnV3?=
 =?utf-8?B?ek9reVZ4Wk9SWUQ1NWpaNHVWN3lEd0h6cWxRVjAydUsva3FwaGlDc0tnYUNh?=
 =?utf-8?B?anZGR2ZEbUVxZ3QxUzlTNlhiMVQxTkNFOUlwdDN3OHhGMHlCOGlraXE4c2V0?=
 =?utf-8?B?WG5KRnJwdUFVd2YvbC9WeUtJdCt0NGV0Z29maVBHOTZCam9ZQlRNNGd6MDA3?=
 =?utf-8?B?aHBnY3RCWU9VMlI3aW52cGVEL2lkVHhQRy9QellQNVc5NU9UakNkNXYvWW9l?=
 =?utf-8?B?VEc2NXk5ZVl4VWNJcVpWc3l0YzZ4Y3J4Z1p1L05xQkFSa2c2aktPbFJwUElE?=
 =?utf-8?B?MWE5SUVBRjVQL2tZZ0hraUNLa0xKWjd6KzFTL0tpR2d2a1QyaDNISUtSenB1?=
 =?utf-8?B?UC8xTVh1bjJ5ajZKZkpOL1lYRFJlay9JTHlab2txNWVZTUw5RkMrVll1S2Zo?=
 =?utf-8?B?VEFIaEl2VVNsTkpnUkRRRG1DbXlSNGM4YXpuUjR3SmFqeUN2OGV3dk1lRVNl?=
 =?utf-8?B?WCtIZVV4bFRiK3lod0lxVlU1SWlrRkZ1NUVVOXY2RG12NzgzNGFaTGRHM011?=
 =?utf-8?B?MTl1a3ZkdE1NNGRZdVpxbWRLK054MkZNNGMvN1Nkd1ludEk3TXBRNU9wdTB0?=
 =?utf-8?B?MnhXRGpPc2JQNms4amtLVWFUdXhncDVLUVVZNjlrcnFnRnh5ellsclMzdFpy?=
 =?utf-8?B?N2xraWhLMGJlazd3UEUvU203aWgyS3d1TVlYcUtRNHJ0MlVYYXJrRnR4WlpH?=
 =?utf-8?B?cERYOVNRN1BIT3RNaGZUTFpCYkgraEthSU54MHcxWXdUQldsbVRUYXFWMUlP?=
 =?utf-8?Q?rOoIdHSwlijEC3S59JvPeRWsH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254d62c8-bf54-454c-996e-08daa2d18c5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:50:11.4339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfvZWP8kPx4gVUHrYmcDSDVHVRvzRwUxkHACI4iE1GeDvWjdnXx8MDkQ9mXGC5LcuH9tBTizMt7a4zWb0sjkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6809

On 30.09.2022 12:03, Roger Pau Monné wrote:
> On Fri, Sep 30, 2022 at 10:36:20AM +0200, Jan Beulich wrote:
>> On 30.09.2022 10:25, Roger Pau Monné wrote:
>>> On Tue, Sep 27, 2022 at 06:20:35PM +0200, Jan Beulich wrote:
>>>> @@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
>>>>  	       node, pxm, start, end - 1,
>>>>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
>>>>  
>>>> -	node_memblk_range[num_node_memblks].start = start;
>>>> -	node_memblk_range[num_node_memblks].end = end;
>>>> -	memblk_nodeid[num_node_memblks] = node;
>>>> +	/* Keep node_memblk_range[] sorted by address. */
>>>> +	for (i = 0; i < num_node_memblks; ++i)
>>>> +		if (node_memblk_range[i].start > start ||
>>>> +		    (node_memblk_range[i].start == start &&
>>>
>>> Maybe I'm confused, but won't .start == start means we have
>>> overlapping ranges?
>>
>> Yes, except when a range is empty.
> 
> Hm, OK.  Won't overlapping ranges be bad if not empty?

They are and ...

> Shouldn't Xen complain if it finds overlapping ranges, or that's taken
> care somewhere else?

... we do, elsewhere. Still I'd like this code to be generic, at the very
least to - as said - deal with empty ranges as well. It didn't seem
indicated to me to special case empty ranges here, when the code is more
clear when written in a more generic manner.

Jan

