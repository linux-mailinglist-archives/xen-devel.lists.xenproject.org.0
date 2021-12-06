Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22055469978
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239191.414576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFKi-0005Z0-1E; Mon, 06 Dec 2021 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239191.414576; Mon, 06 Dec 2021 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFKh-0005Wt-Tu; Mon, 06 Dec 2021 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 239191;
 Mon, 06 Dec 2021 14:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFKg-0005Wn-FI
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:51:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f20fdfb3-56a3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:51:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-5PamRZifPYea6fl1lP0ZJw-1; Mon, 06 Dec 2021 15:51:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:51:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:51:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0211.eurprd06.prod.outlook.com (2603:10a6:20b:45e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 14:51:04 +0000
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
X-Inumbo-ID: f20fdfb3-56a3-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638802268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aRrX5R8iqzxW+LDnFBZt/gF5dtxcJY7nJSkqCuYa0xg=;
	b=L5OtJu8Bj79p6tj4369H2qD0g408w5zMAz+wGSsXqcT06B9wXj8FYwdC/fI0Gw7qoslehV
	63ZN7d4y5QLfT2egNO8qq7uXnYCFxi8FaoICAY7MHumKEHv0V05U6HBxC5RIu0yxg1RBPr
	YDpg2BqKIbzlxn3VABgo1RUt8rr7hLo=
X-MC-Unique: 5PamRZifPYea6fl1lP0ZJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euOMpTDWnMFNELBv8Hs7RJRlZrI0+8s9+LWnGKTzpI1jXjk6fPXhWiuiaQkYG2lr+op+ADei+FQeDooolKb5MFh7xla04dHFs3wsvRDS4SvSkalxpd50mfO8GNJNJgW7mfiU0VwfPjnJSxVklveqWyn8gz7d0h2nGnu0iSSjnjciAQU+VKh4cRct5UPHFZUQ/s/EnxowhLPK6qbn8ZlI0leCjHQhc9TaT3WUHfPoa8Z5a2x+EV2OV9dh0H9gl0DJ7tpebamG3jjT0TutqlZab2CJATgKIyDHPEwHrjbT6TbhsMncnhMCB8WD+3BmHS/h6Ld+jLyRY4QXFKKWvrkPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRrX5R8iqzxW+LDnFBZt/gF5dtxcJY7nJSkqCuYa0xg=;
 b=m0ne4NnElTkkIqD8jNhsIztcZmLiJmHBzG7y0DYsaVxh8fkKZ3Geerp7ljFPR2RMIy2e1bvwaeA8ZLfg2JUZt1X784TInNBQeXcZd6iZrYgUf46Tx+rjvfpczsm7Wn3UHStnKESGg+qxEV4Wa+iIvDU4K3/GxemO5xkKAutMhV1Ljb8bMaD5IW1Ee0lRJvoP2AkXG3Cv2exCD+0E8NO5afPQwn31pxK/pe9xs/xEuP3Bthnkz44MULMkeoY4o2ETv/Q+rxMOC1Yx9qm0Eii1Wnor1I9GwLx0lJS/nYUENuzqH7rxbaza/Sqdozg3ojUND+3I+iSwWoDvftHgJfQiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d6fd0d0-eee2-8f95-9c6a-7e9a0beb1a27@suse.com>
Date: Mon, 6 Dec 2021 15:51:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] MAINTAINERS: Resign from my maintainership roles
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <25006.8329.278548.571087@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25006.8329.278548.571087@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0211.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce506ce1-be3e-4731-f26c-08d9b8c7d414
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039481FD2909070D34CF4F8B36D9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HoY0Wm/UymnSQZsS9V/ZksNlD36itiBJPkhn+oG+eTt/eF7okOKrX/rWvi/5wEpvQ9Trvcjmg24tCNRt+Sl28rFI8RiM+TioOfAJIRRE34tLWLdfxyAP0iq831KvEU1OXlXnvoCCqv3uud4OYXtOlyginGRwtaIX03GhFBXS5RTROiuYVYLC04vz9ht5kK4SxgJUbodHqjgF9dykzN8NfsORIkQWErip7qcdRrYKvbKUsmFul3X6TuiYVEu7heVRc4Vtd7sEZy8szXrj3gMwmSnEEerZrsxbkBXVNLpPV/3UvwcUrlczh7DH93psFs5F6ZDVRsTjZFuOCKOTyVX7roVXIGJcp3i36X6cgoDZQsh9TNfAEpxLYTyaf3sYCyWTJDsbHT/UaDhfyQkPPdlTnOggOBWkEU5hmMo695MhUlu6rk/mMPKQU/e8IitjTbY2XijNxwViWgAYN/AMM45ZOA3I/wfVfAk15slkwSrQOsA7DysKQE3N5C/xYjffqw+R2ofVMoExpDAPIw4liICXT/9EuAspZJHpCvbLeeSFG4cPRAgWtSRPvp5hveF25dveS6BqAB/Mftdv+jv2OpzC9/d2x2X6M3msaN7pspK5QW9FHTL3KXCicSASNGI4Xf8Qe9dhc0yaXxfiitVTTppjnO7S83c4eduaVEJwmYWvQbPh5FZ7pmW6Sw0gl/0nG5XkN9xeGhTW+wQuazl6xQ+fTOT480dSyGag9CoD2RHm7Zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66476007)(66946007)(316002)(2906002)(508600001)(16576012)(8936002)(66556008)(86362001)(5660300002)(31686004)(26005)(6486002)(956004)(38100700002)(4326008)(2616005)(53546011)(31696002)(8676002)(36756003)(186003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9POURkTXJTbmwvczM5WU1jb1pQV0ZtYW9ibkFERkpxVzhnZkdJaWk2SitP?=
 =?utf-8?B?SDhRVGp5YXYyRkJURFppc2owRGU2VHBBd2daY2tzOVRjeHE1T09Cd0VOMWhL?=
 =?utf-8?B?NzBoeUNJdlNuU3Z2SHJ4Z2JLSnpyemtENTFxYU1seE9la2I3bUsxUm9UZUxv?=
 =?utf-8?B?WXNtNFZyUjJDR2krMlhvb1BmNExJc0FoTmgyRFRPRmtId0xxYWdqMlVSQm50?=
 =?utf-8?B?UzF5aWVQZnBkN1FLcnJ6Vkc4ejdLY0FNREpjNXFRRGZsWnpBa085WklSS3g4?=
 =?utf-8?B?WXB5bmxUMXhLeVExV1RrMWZZcTNCbGtwcjNxOFBCeEF0cVJBTVNDbzNIM2Qv?=
 =?utf-8?B?QldzZElmRFBieXVxTmwzOVJXUXRJVHB5cFNSVXh6Z3Z3bzRBT3lnSWNKczZ4?=
 =?utf-8?B?WTVPc3JQYlhma0hsTS9McEJLeERpZFhPcmpLVTFsSGIxcHhOMkdQVFhTbXND?=
 =?utf-8?B?NC9uVjQvL3FIYmdlWmxGQ1dtK2RHd1Z1OEtzQ2xFN01OeTRmSEQyYXo5bFBP?=
 =?utf-8?B?RHBWbC9ESDZnN1JoampYN0d4dzNwSnFYdFh4S3hJb3YxbDFzWGtxTHJqTzN0?=
 =?utf-8?B?bU1aWlU0Vy80S1FqL0FHQ0ovYWR5ZEhKbVR3WkVtODJiWVE5enAydS9ramNj?=
 =?utf-8?B?UHhPQ3E4Z0ZESk90b2VYcVBTeGg4aklDd3g1Q1N1ZDVXVE0rWnUvck1mbm1y?=
 =?utf-8?B?U0lxUHNrRkIrakM0eUNMVmFFdG9wVWVESnE1UUFSWldmdnNSQm9KQnR6UmJ6?=
 =?utf-8?B?UVNKcjhPN3cyZS9ISWlSYjVCUHNHOVlZM2MxbDJyQ2RnSTFzOVVFbzlCM3JT?=
 =?utf-8?B?dWhmWDY4ZDVVL2FLVlhzMXE2MmV1YmtGSytuOVpUS0x2TXlFVGI2OTh2RVpr?=
 =?utf-8?B?NUd1My8xaCsxQnlpYlcxeHVBOXdCQkNpVmdXMW5aQW0zeGFGWVhMZHI5dkR1?=
 =?utf-8?B?RTF0c3dFQkhaT3FUekE4eUdpczFMWUk2Zkk5eDdBMUlPQlhQU3pUQ2Z5RjRN?=
 =?utf-8?B?YkdTVDZNR2RlUDZPcGFjM0FUaHE5SkRPTDVRNzJZemQ1RmtmaGt2VHJpMFpL?=
 =?utf-8?B?RUxmUWFMZmZXR0pmWTlGdGNaL2g5bjBEUzZqSWVPNFZsMHhTL1YxS2ZldWNR?=
 =?utf-8?B?VzVndXNFU3hCMi9taUh2c1V4c3U2VlVxakNmUFZWVzMyS3VtUVpCdk1BQmFM?=
 =?utf-8?B?WTIxbjI4dG5NQlBxMDFNbU1MWEM2MnlnU2VjRHJFVTFXWEJkMzZSa0Q2Tk5q?=
 =?utf-8?B?M2syQ3lDTHkvSWU2dStjSEZTZGEybFp1WDdZS1RzS0trL3F1WFdLRllXK3FZ?=
 =?utf-8?B?RHM4b2QwNitrd0NlSjJIa3J2b1dQbE9FR2g3WU04dDlFcnJJNmdqUkIybFp3?=
 =?utf-8?B?SVFicUhPeW5GZGxoR2lpcTlpL3Iwc2JzZUJBRlgzNWE2bmJLNU1kdUVoYXd2?=
 =?utf-8?B?OHhCMzRJMnZ6SVF0bGpZYjUwbURwaUhqcVpWWHFIcUNhNzJDaDBtZWNsZDNt?=
 =?utf-8?B?ZWJGRFlCb05QalJkcDM2WUhjVGlReEdubi9TamxUUjFDQVVnNFdMZ0ovMDhC?=
 =?utf-8?B?bmtvNisyb3duMFVObUlKMnc3U2xDNjBxbFMwTHBpb1N6Qi9iVWliaUpPU2g0?=
 =?utf-8?B?K3VuLzByUjJvM3RhN2d0V3pxRnR0d2dMOURONm9uT3h3Y3VBMitUUkNlbTNp?=
 =?utf-8?B?QTBJMW5jRXd3M1MxcU9SR2RQSWFWaGhSSDI5UWErUEp0dDlRcG1sL1BpdUJw?=
 =?utf-8?B?ZGFvNEdiSmdVNE16OEZTSEhiSmxyUVpqclNJTjZnU2JSNWlBRndxNGZ1c1Y1?=
 =?utf-8?B?Nk0vdU5YcUo3WFBJcThVbmFUcGMreWU3dGEyVlA1RTBYWU5md2tyZVBaV2hP?=
 =?utf-8?B?aCt0THB3bXpFR3I3amkwRU11aWR1M0syZ1VBK21GN0xhQ0tZcjNPNG01NHZM?=
 =?utf-8?B?OWdhbERzN0lFcHFVS2JZeXZQWFUySVZjMXB5L1FKT2lZc0kvUmZxUFFDMThj?=
 =?utf-8?B?UmR6N2ZhcWF0aFZlcFYwVFltUDdSMmlGZjhxOWRsY2NXcWhKQTQ0ZU5jRTVi?=
 =?utf-8?B?QUVlS1hWRnE3QXo3czhkNkRTRjlIVnZwbndvWXJKZ2hQZ2h6UHZieUNoTDJ4?=
 =?utf-8?B?Tzg0NW5Ma0NETndUekp0ZHZSWElvWGROb0oybXJwZXlMUjkxM29DcmZyWCt6?=
 =?utf-8?Q?Rwr7zoVkAIMnaSa1aPa0TjU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce506ce1-be3e-4731-f26c-08d9b8c7d414
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:51:04.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWOxTcmDCq5v6hIEtLPQ4g5Yu5kIS9tIfsONuDOuwkBK8+SYiEsQ3URgyPGQOZFqlLYSKIbvsO11DyqAwxba2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 06.12.2021 15:39, Ian Jackson wrote:
> I am leaving Citrix to go and work for the Tor Project.  My last day
> working full-time on Xen will be the 15th of December.  While I won't
> be disappearing entirely, I won't have time to do patch review, and
> no-one should be waiting for my ack.
> 
> Thanks to everyone for your support over the years.  I have really
> appreciated working with such good co-maintainers and colleagues.

Thank you very much as well for all you did for the project.

> From 608531a0cc34a5bc096ccf585e16f182b5ed83e1 Mon Sep 17 00:00:00 2001
> From: Ian Jackson <iwj@xenproject.org>
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Date: Mon, 6 Dec 2021 14:34:20 +0000
> Subject: [PATCH] MAINTAINERS: Resign from my maintainership roles
> 
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Ian Jackson <ian.jackson@citrix.com>

In case it's deemed needed, yet much to my regret,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


