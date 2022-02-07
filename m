Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16944ABEC4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 14:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266900.460625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3fH-0007rq-81; Mon, 07 Feb 2022 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266900.460625; Mon, 07 Feb 2022 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3fH-0007ou-4M; Mon, 07 Feb 2022 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 266900;
 Mon, 07 Feb 2022 13:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3fE-0007l7-Nt
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 13:02:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3abcf20c-8816-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 14:02:40 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-jEKGO2JvNpuZYuyOoA89pA-1; Mon, 07 Feb 2022 14:02:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3313.eurprd04.prod.outlook.com (2603:10a6:208:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 13:02:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 13:02:35 +0000
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
X-Inumbo-ID: 3abcf20c-8816-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644238959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4WWKhgOi3M36MYz/R47AZ5xPpJCEJa3GFJDXQgEYPk=;
	b=hz/vzqNQ8bDZe0C/N9/IJWJom5Byrop65eh+zC05b40tVm9jKEZ+9oAPGL8x7nDdOCuGL/
	SqP/F/M/ha/fgVdk4YL+vJU+TR0hiW3toe5/KeWsRRVKZUvT72wKdMVVN0TpsLvZKI0Q8b
	uDWGCOjJueH+G1VppRawflu7CRsNxYQ=
X-MC-Unique: jEKGO2JvNpuZYuyOoA89pA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1CpGsIWlQCn8KJ6AQp/b3ysDT5Q+UdZxzBaOyIYRXr+I/Hiozx9sNA6caTMDda3WaXb/Cjk1BoYfzTl/3wObESHnEUINlHs1laIuV5l4Dr7Dk+L/Amww+rFHXYxH0Q+00ISBC4s8n/8F1dvQn7ufYt3qKuts+WsFQ27m5QQbLPSB6p+3Pm8XvzurKi9QBOw1s7GcFptHfVF0oIf661UrvAKWhSwVVSm0dhBO1J3Zj7m5rFyMSSAY0E5VfH1ghXI6l+tzMcnQLV0OYbVuOrGmUTKdgPswp2bfwroS+ih8gmjqTDdNImD/mLjuKTt/Yt6Q73tuY4CIoL1tpseKWSXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4WWKhgOi3M36MYz/R47AZ5xPpJCEJa3GFJDXQgEYPk=;
 b=BjganenY7zv/VH/f9IR5rdIVfk0D+uvWrYjdfVPwopQRRtKTXJDK32BR3CNL43mver3CXljK8kDlej5hMONSxtIIWd6AhBMvMsj7kviHtPpGsm4AIGWZBaS+snrCtLfCaU5lCqMi7t6i2ZW9Fxu+W5Vwh1uSX2k71M5Unx53H8EhAze7e3cNACiaAhdVmvPvCqEsbE8XnfeV7oZy10Cx92gL/cvEw/jpxR/yQtpsO4dlbjEQjZgQo5NJVjGdnC+C0dVox+dqfARlF6K1w4sZtgdnK4bFGjjA/rPomp/atfayDcJ+GhNhzzQIznCMTYVdR/buDU4Wx56wljjgNCgLew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c51d671d-8ad5-591f-f21d-5af04220308e@suse.com>
Date: Mon, 7 Feb 2022 14:02:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <a71b7835-cbbb-74bd-d25d-6824f6f10683@suse.com>
 <6787ff3d-aea1-d2d6-a1dd-96e80a29b8b5@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6787ff3d-aea1-d2d6-a1dd-96e80a29b8b5@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c9d32a-489c-4b4d-b9f0-08d9ea3a1c2f
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3313:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB33132F85F40539C9C643E4D5B32C9@AM0PR0402MB3313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWvL3kP1bOqWPnr/7PcYshRhH1Eig6wwSWVyp9RX3h4fvMeOKkn4kBgP1egdAfCDXyZ7RJBqrZgNvLScPoK8UySGHiE7bl9ssmyyjdgcv2Ix+BnjpBYGLHX13mPbvoaX1Vg6TaXtH7p9erZTYURDxXyBpnu5oJ8BC1uvqL5msADmBlEazwFVlc5ULRBdg7g1354sL1LAPe2AfMhR8MR5IqKgpTX8DiNLv9Qcoa5rXnPFkD2+0Ljjg282lmSf5KLcmwuM+qj11NHJZbDgHPXHsyl7RPBTaiGMUnN3vHgEDtxMI1wQ/aHp2wDoz4v7mYT6/SrtZTYkSPxNKhRp+ibJ/meQywYJjTLE5N4pgz1tPnlqgTcd4W1Q8TAhj9qG0AX4c8bAiI42gbh/DN2+ug1+Xdp10EXKVLd6XcQ70fDE6XJrLc6NfhZEKC8J0L4rp3tJVqBvkQnAXWq67Zu0LVGPfbv1tQMm4+bcfrKJCrKoJBrR1tNkQA3KW8UJfsaFbBLs92F8YaPrfys9rUcnNnp4kF065apZ5gBsRZcSRZHlof//7tJOakam4tI99JH/9u2m2UhWY2Nfzt40s6kvoatlygEsnPpMecpa4e5WiZLuSpQ6XIkvxWoRhu0aOkeOYJDblhD9AFNPtFmaplw9AkGYsFINwHdqr0Jm6WtljhBqF2qx/peuT9poWJw3AoTWxQ70qM+ZakMM+AqjbP0YNAOowqsJS6FsehLwsV/r/um4+5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(508600001)(2906002)(6506007)(66556008)(8936002)(8676002)(6486002)(66946007)(38100700002)(4326008)(53546011)(86362001)(5660300002)(31686004)(6512007)(7416002)(2616005)(6916009)(26005)(186003)(83380400001)(316002)(54906003)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUMzOXVHamE3MUozdmNrUGdsakk5SHdwcjNqbk9aTjdqSXU2cXFwY3NPakxk?=
 =?utf-8?B?VkhTcG1BelErK2ZZc2lqR2lvQTRpZ3dqMnRvQmdlWnFlMGlZQjJaeEFSaG9P?=
 =?utf-8?B?WVJDY3EzejNQVHovKzQrbzhpMlBJSjZIbUZLd0xzZVdISWhRMkhWOGRUZjYv?=
 =?utf-8?B?TlErNUdBeDB1MXQ3SDJWdzNwWHZTZkRyQWxMVnI3S0VweXMxYWR5VDJnUVRJ?=
 =?utf-8?B?TWRIWmxRMmJqMk1GVDdKSWo4cDZ6NzhMZVVIalJHNE9PWFhSeXpzdDJKOG51?=
 =?utf-8?B?WTBZUk1RS3g0Qk1uQXlkdW1WZzNuNUpEUkNwWjVsK2ZZKzFVQmFoUno3UFpJ?=
 =?utf-8?B?WmltU0tBYVJUclA5VS85eWhmaWxwNjYxOUhWV1dVQTdPZ0llUCtuMXdsRlMv?=
 =?utf-8?B?L0hiZHcvRkRnK2JIVmVvbURFd0FmdldkOVoycU9EMk9hRVJ6OXIzM2toLzhO?=
 =?utf-8?B?ZkpaRk5kNi8rSDlnVW1WNjVBV1p3bzhkSjdoZWxtbkRHd0dTOU43ZnZFYXpP?=
 =?utf-8?B?WWdJaUhqTitHVEJKTU9VaDJqL3dkQTdyREg5SXZ2RzhSVEw1VHlGQXdua29B?=
 =?utf-8?B?Q1V3RFhlZnFONElFaTBOL3BrbndLaGlkOHJtZW9hRHdDSCtFU1B6YUJNbFBx?=
 =?utf-8?B?Q0tuRnVtOWR4eWlxdDYvVEhsSHZVVXI0b011V1lhTWZEYWx6VlJGVGJqblhw?=
 =?utf-8?B?OEtKZGtuaWZjRkFBRWZzd2xLQnFkdHJLZmJaNVNReHFKUnNvN20rVWN4ekw4?=
 =?utf-8?B?eEU3M0NERjZzSXBzZnQzMUY3UEp1a1Bhdnk0RHdGRTVwMjF6eTE1ZHM1aFov?=
 =?utf-8?B?WVVZYXMwYzBTcCtzdzRxMHcrUHI3T2NOQlgrTk1DNk03RWRkbHFuckJRbjVT?=
 =?utf-8?B?b3lIVzY3ZmVYYnhFZm95eEpDQUs0TnRxSVdhL3FrSFg1ejhIOTg1UjJWeHRN?=
 =?utf-8?B?enZlQjdTeDlJc0dpUThMVy9Ua3gwMVN2RTRmRWZtK1AxdHNvR3pXb1d2OFFp?=
 =?utf-8?B?a2x3K2RGVGxpYzMzeXIwNGlXUWdmUVVoUnNHMWxwYWdMNURGVU1HY2t0Wm1L?=
 =?utf-8?B?cnpJMkJ5Y25BQTAzcDA3WElpYTZzZXFHR1J1bk10Q3dXM1JHcXA3dzllTmta?=
 =?utf-8?B?UFZ3Sy92amFzcHlKcE9jSldNdXFENnN4emRBL1pweG5jZnk5M3BmaGp4S3hr?=
 =?utf-8?B?YWdiOS9nTWhFcTY3akZjR1NPWTgrczJXbzVtZEZGYW5panMzUU92cVBNNWw2?=
 =?utf-8?B?aDZ2UUV1ckg1N1QzNk1LRThxQnU3bVpzbTM5VkhJeWVPVk1MNmI0Y240cHFM?=
 =?utf-8?B?VmVSeXFiR1NSWllYVHJjZS9QK3h3bm1TUFJZMFI5TWVYUGNNRVI0eHplN1lN?=
 =?utf-8?B?MGRUZGVzejA4cWw5b1NmZ0g0TzNtbEdjU0FVMDU3V0VtWDgvcnM1QStzRzJq?=
 =?utf-8?B?eXhtYThsQkY1cDBzSFFsQWZZbEVQSENyWmNhbmlFRFRXdjhXRTYxaWl0R0p3?=
 =?utf-8?B?WTkraitIdWJnNjUvM095MUlVaVdwWldPMmc4MEljV2tIQXhySStsRkRya01Q?=
 =?utf-8?B?b2dxdGxCRkg5bFJQeE1DeXVnMUQvTjV0WHdHd0xPYTNJaTZ4TDZ0RThnZlla?=
 =?utf-8?B?N2Q0aG0rOUhWVW1FaEtsS2xIM0Z3WHQ3RkIrM0tkTTV6Y1JYdUdoaUR1eUR5?=
 =?utf-8?B?NU1MLzFlSktHZitHRnZFN1VTVmErRTlCOWRNRSt3QlhJVjNLVnNpYmJKWDln?=
 =?utf-8?B?QldML3N6dXBmU3NQYWN5ckt4SWlybkZXUFBBanhHSUo4MmlJOW10MU9jT3Y3?=
 =?utf-8?B?bnVyYzdtQ0pGOXI4b3pmaGl6YXNyNVFMM1Q2Z1VaQ09CbGdkT0c0VkIxTm5y?=
 =?utf-8?B?aWpZSlN0K2NRTmxITWxwWWxUczBkQUVDU0s2dXNtV1NQMUFaVlpjUHdpRFlV?=
 =?utf-8?B?RjBuZERESTArYUh2TE5WQm9qanNjWHRBZWNsR3FYNXJrbFJpbU1aV0QzWE5L?=
 =?utf-8?B?WFdQeW1wQ1cvbTV6TFREM0JpNjV0c2FUNC9MVWJIRldCUU5LUXJ6RE9DdzBN?=
 =?utf-8?B?WUpvTGoxSURDMUl6UTQwV3N2c0JHdXdkZDJGbzFCeDE5TnE0blFLelZaZURJ?=
 =?utf-8?B?S0VLTXJXajl6ZVpOUEYxa21IN3hhVjgwb3NSbWgxSjY5SFFTZnZicHI0LzJR?=
 =?utf-8?Q?+rdhCIc2P25lDRHdqFE/sbE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c9d32a-489c-4b4d-b9f0-08d9ea3a1c2f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 13:02:35.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eufm4RBkDHMVJ5wcuRBl25gg2nsy2yrFp7NZupn8ZYmfWuafpSjZ/1SIAMR+GrYdU1BC+MDB2ScYJgzw+ujCGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3313

On 07.02.2022 13:57, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 14:34, Jan Beulich wrote:
>> On 07.02.2022 12:08, Oleksandr Andrushchenko wrote:
>>> 1. vpci_{read|write} are not protected with pcidevs_lock and can run in
>>> parallel with pci_remove_device which can remove pdev after vpci_{read|write}
>>> acquired the pdev pointer. This may lead to a fail due to pdev dereference.
>>>
>>> So, to protect pdev dereference vpci_{read|write} must also use pdevs_lock.
>> I think this is not the only place where there is a theoretical race
>> against pci_remove_device().
> Not at all, that was just to demonstrate one of the possible sources of races.
>>   I would recommend to separate the
>> overall situation with pcidevs_lock from the issue here.
> Do you agree that there is already an issue with that? In the currently existing code?
>>   I don't view
>> it as an option to acquire pcidevs_lock in vpci_{read,write}().
> Yes, that would hurt too much, I agree. But this needs to be solved
>>   If
>> anything, we need proper refcounting of PCI devices (at which point
>> likely a number of lock uses can go away).
> It seems so. Then not only pdev's need refcounting, but pdev->vpci as well
> 
> What's your view on how can we achieve both goals?
> pdev and pdev->vpci and locking/refcounting

I don't see why pdev->vpci might need refcounting. And just to state it
in different words: I'd like to suggest to leave aside the pdev locking
as long as it's _just_ to protect against hot remove of a device. That's
orthogonal to what you need for vPCI, where you need to protect
against the device disappearing from a guest (without at the same time
disappearing from the host).

Jan


