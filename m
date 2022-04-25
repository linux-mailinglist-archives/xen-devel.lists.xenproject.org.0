Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC350E205
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312973.530401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyuZ-00057C-VJ; Mon, 25 Apr 2022 13:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312973.530401; Mon, 25 Apr 2022 13:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyuZ-00055A-SQ; Mon, 25 Apr 2022 13:37:55 +0000
Received: by outflank-mailman (input) for mailman id 312973;
 Mon, 25 Apr 2022 13:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niyuX-00054s-Mh
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:37:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7db6dd1-c49c-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:37:52 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-bsDO0eSuMlC1ameI3lo_gw-1; Mon, 25 Apr 2022 15:37:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:37:46 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:37:46 +0000
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
X-Inumbo-ID: e7db6dd1-c49c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650893872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSsxJi9LYlPJl+IIMTs5uDaDxpOJHdoiSIxtw0NZvLI=;
	b=YnANsN2RfWpU8HNQFvl3tjWk54tdE2QmBqFF6P7lThfgOGFUENMkUleVuQMdPn805HSIMM
	DX6Xb999C9JSz+LqVZqGu0rhKzhsOqwZcij6uZnTbuOFiT1KGyfK9oXoumBubJvaVOi365
	EzY/C67mwdv1EpyeB8ZyZvIWOsNNnng=
X-MC-Unique: bsDO0eSuMlC1ameI3lo_gw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX6d23fwd/V3C+QSd2afj/UyNYQnC+i723y2FqPjGeUR/dmaRlkwW4TK5gmotiC8xYhx/+SV72Io4yMcKa7a1Qmb/lXtHhzyWv0oXQK/qm/JML8PsIzrSzBAFRLkZSt5mLYVxsgopmzsH4qG5m/xNeN9Nv1jUT605mmu7zHdc8QBoGHcsh17+Fbd5YZBuHGL8xbJIvEJC/DUXgtfAinpUKg4ERVeR53FskA+Ctqf5CV5sfKJK++mqit2JP5sYac1FHjSxnNiO4sN/QGQGGD4yhYLC2z6WRH5/SZUGpIpf0G2Y+O65vbzKSMrKE5fkSMzyI4PcL2n3dr/sP2NTG8Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSsxJi9LYlPJl+IIMTs5uDaDxpOJHdoiSIxtw0NZvLI=;
 b=finOw7y2zHliiZogVk1iEjGTkXx5fIRyKK2MzcNDsfvaTIqTTQw7TSsPysjo2/pBODWi7588Tzg0i7/K3uLhDe6Fe+p5QADIHkuZ+l5qcw0L/rukTTeGLX9STkDzCWkCmTjXv/mdxM55oRJsKIm0/cF57q0dRIaplc4DI0d+dndqCtlTa+ZvDXkeVNo8emMaJyyHS3i4MPm+ry7eqYSHW6PXh0Nsm58DQG/UyrIf1eN9DgLt5/Xuh3QkQ+10PdsnSzzcp/CCtY1a7Ur22ziodUmXP1R9p8cPn1YxdfMFIOGtjldbiPq97PZuxM6+7CbJ7kvbkzdhPqS8p2bFl3sH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
Date: Mon, 25 Apr 2022 15:37:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, David Vrabel <dvrabel@cantab.net>,
 xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e135b17-9957-44bb-10da-08da26c0c88d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7606:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7606D0110502DCCC73A78852B3F89@AS8PR04MB7606.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lI6wJFyMSjHlQV68gxlVTUaZhYiXgt3l9WGY2+xy+jcd1iNU9xcoUXEe8IpkOYw6XS683byJpJ/TsBok57PGwfIG7eZzxbEGNiucyl3h3nT29sZq7piZVzUEqa2uoEBiq3Gc5ULkjek+XKm5NTN9gAd6lp3GDO/djr1gvJFaYDjkvboEvYL4PLiG5r4CYTDsq0NLxgHPBqUuFkX8B6cSkr6SZ8kzSpZskWXkdtrHCxR3dtreVlcCz0jOl+Nuj64uXj5B1le9b1t4zoMlEwY5NFkhT8tSrskAVx4SfkEmrIQ8hgbKv8Wlb8z4N6BgO2sNC2ASOj+HDuLaUGKieg0Y/LAeU8LYUVTIkhT5sO2xnYFprxwVMV4lHUmd3Ye9zUSPPnTV1tOrDiVFYSK2QwnPdkQ5kDYqgOGVeJc+HuHyxECtywHIVTSZRxi2yAwATXazwwUW+ihw/Ypwh/nfMyYhLkwYaGAa+HcQAVET8xT/JhmeOQBguNVRGyosFcT1qg0ClDlOxsbEurksdtjLacwOGShbWM4vjXlbTyjRjjqfaMum6FyWVi4ikQWbtanQLuRfQeHjC4qlARXi16udgxyzc/0WgY/Mukz3trpw7Uf0w5CyQDFVuiu/TIcr8pzciuVPS/bEw2+9m/RK/W+6A5egLifDTo8dPiZJPWrtAzj4PUbqmmV5CI46X/nYYUYVQdf1sbdFRxCSAYjg+8nKigUiV2TgkexhmVQCFHNOkEmEwsajVLGOmMI4dQy3ljkQU2G7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(26005)(6506007)(31696002)(38100700002)(2906002)(54906003)(6916009)(316002)(8676002)(4326008)(66946007)(66476007)(66556008)(508600001)(8936002)(53546011)(36756003)(4744005)(6486002)(5660300002)(2616005)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVVTRzVOaGJ0dDluRnFSaGJtaGtOYlkvem8xeEN0NVdYZjNYRlBSbFN6SFg2?=
 =?utf-8?B?U0g2Qm1hZ1NsVVYwcU9sUkl6UjZma203bUl6RENoUUZ4V2pVWHZjYmM2WkVV?=
 =?utf-8?B?UW4rSy9tcSt3bk9WeEY1c2Y2aTNxNnp2VndpOHgrSGFpVXpSekpCbGpjNitz?=
 =?utf-8?B?ZUtzOUdzZmVJTEdKS0FPZUhQZ2JHRkF6SUtqS3pXZ1ZjcmNQVE9wSU0wT1V1?=
 =?utf-8?B?VEIzaVAyRGNRTU93aTVvc0h1SFNORlVTcUtVY1l6c1hDYnBVWmhFMFN0ejUw?=
 =?utf-8?B?QzY3V2Vyd0JnRGc4ZGtWdUFXQ2N3dWswWS9UTkg4eXhjRXJ6UnpqVnAzaUNy?=
 =?utf-8?B?ZytQS3RzL2NiUHYxNjlMWWUwM0JTOWtvTWxBUXZ1SHJZcHpJNFlDS0owMDND?=
 =?utf-8?B?OHMwQ0VobTVCeTlJZHpEcVYyMXdEYzBiYUsyam9pNlYyM0FyaXg0VzRNU2Mw?=
 =?utf-8?B?cVk1aHpEaVFSQTlnckJOL3c5a2J3cEdOazhsVFBObiswSnRQeWRsYVN1dHZP?=
 =?utf-8?B?ZUZrTGpYUUl5Z2lWN2VPYjZSM1IxMXMzSFlFbTQzcDRIR0tKRTlCSmV6R0xQ?=
 =?utf-8?B?cnh2Ni92TlVhVjNBT1U2TXdidGpyYjlqNWpsa3BwSFh3d2ZlUldZY2t2OGNU?=
 =?utf-8?B?c25qWHdDVFJlRkFYN2pWK2ZPNmxwMmdZeU50dUpITUU0OUhUcWZTeTJLM2Vx?=
 =?utf-8?B?d0NZaDF5WFRvNkE5NCtRN3l6WnVWMmMyN0VWZjJJUXhZN2sybG1GanZxQThM?=
 =?utf-8?B?RFl3NVBUK3p4S0hOM0ZvR0NWTW9RSVM1SVlEQ2J6SzVlZDlzTFdzcjIrWElu?=
 =?utf-8?B?VUh5VTAwSUpVVHlxWDRDM1BJSklRZ2ZXQ0FBZi9uTzFCMXBhbURySmtSb3RF?=
 =?utf-8?B?T25jN0JHWmxhRUwwN2xGY2JSelU3RUZDbGRPOWZlcUUyVVlIZXo1dThyeGdm?=
 =?utf-8?B?RlJEOGZPNHVRRUFoSytqaU85QU9mWVFEUWpFSFQ4UzNNZ2xQUTU3TEFUVExY?=
 =?utf-8?B?ajJSNzVxYWowUnhicVNPOGhQQWVLTk9FYnJHMCtBdzhEbEtWRitOekxwcmt0?=
 =?utf-8?B?ckUvQUpFUU5KTUpmZEFkNWZjaS81TVQzNlRIYjJJNFdJS3BJSmFzNnJZWmx5?=
 =?utf-8?B?eUREOU1SalMwY3FmanU5WEpCdnhaMklJdGdFdDNLQVEvbGRkV2VzbFNkRnlK?=
 =?utf-8?B?ckg5alJ4b3QzNzFKakFidjRCU0VzbkRVczljSjNjK05tYkZjT0c3QS9iRFJM?=
 =?utf-8?B?V0ZlVGtyOGJ6UWFtUjdXY1RPNlAzcE0vb0gwQVhqU1FjeHNYUERVRDc5Zlpz?=
 =?utf-8?B?WkZSWXlOck0wazVxZk50blYvYjNoMzlURmJleVptQSszU0dnbHd3dlY4V1dQ?=
 =?utf-8?B?cWJWak00UElFV1RBTWFQZ3pRQkpuaEtQODB4NWp0eVY5ODlVQlhDRzZiRWJu?=
 =?utf-8?B?RzFhbGFpMlEyTlR0MjM4bFZOTEZxQllmQ2p2QTV1V2gyN3BWeWJtNlA3Tk5a?=
 =?utf-8?B?eVdnL2lDVmtFbldUOGdZUFVTYm5uakNmRzJDd2IzYm1sOVo0VlJnMGRiaEhM?=
 =?utf-8?B?UFRENWhIdHJBWVYzaFExR1F3M0dIa2Z2MWdPb0MzTHB1N3lJemEvU1F0UFVS?=
 =?utf-8?B?VmNPZmsvRksyMzd6WXVRcU9KRGc3N215aVBTL1VYQ3hpQmhybXNmRTgwWkdk?=
 =?utf-8?B?YkhPc08wWkF5WXgvV0VUemltT3YveGFERU9qa1dyZHMwc0s1ZHFOUjJQU2c5?=
 =?utf-8?B?UzdtTlVtT2hvZ1Q5WGJQYlRwcHFVc3RmVDBHTFBHNWtQMHA4c2RjWjF5ZTA4?=
 =?utf-8?B?N1E5QWZ3VXZhOEhMdldFd3FRZXpaVlh4YlVoSlVuZmhxMCt5ZG0zWDV2S3pW?=
 =?utf-8?B?SG90aE82cTAreDNvSTlOREtlQjMvMjhHeUV2TFlKdTZzZC9kY0Q3dENrKzNi?=
 =?utf-8?B?cjJzNklRNjNTR2ZKMGNaNzFUTDBlamZVNU0waGxuTjFJL0NrUm5VZkNPQkUy?=
 =?utf-8?B?UVNJRXE4L0R1djg5VW5PNXJ3STRsZE9uWWZKMUZlbmtHbXFVelFOaWNxS2s2?=
 =?utf-8?B?My96TklGSHFmaWtMK2c5UU5lRWZhUDJsQWx5RC9iME83aE1sWmJCbkU1KzZ0?=
 =?utf-8?B?dGZpNzJDY25rT0VlRThJZDlKNmNFMUJTcG10UU5sbXRvRDJXYlRkN2FVb0hO?=
 =?utf-8?B?aXJZSHJLV1JWUmt1WUIvN3NTU1RNNHkyMlh1NEdzNDlwODVCbDREK1hZeGk0?=
 =?utf-8?B?OEZoamFnMFAwWmM4c1RSSnF0UGVUeURlRjhPekhhbk81QnRaWFYyUTRuR2NX?=
 =?utf-8?B?aW1QRS94RmtRdUZiaWJvYUpSalpEa0hVVWl1Mk00UkhlYUhJdGZ5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e135b17-9957-44bb-10da-08da26c0c88d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:37:46.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbCzoluF0ZYcs1mj0WhrhZfwSv08bM6BQC7yXjWFi/2xJTOO/EI4AyKD7EA5BbFkRbezbQyq4U5+wYTFf2p7/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606

On 25.04.2022 15:34, Julien Grall wrote:
> On 25/04/2022 14:28, David Vrabel wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -162,6 +162,13 @@
>>   static char __initdata opt_badpage[100] = "";
>>   string_param("badpage", opt_badpage);
>>   
>> +/*
>> + * Heap allocations may need TLB flushes which require IRQs to be
> 
> The comment needs to be updated to reflect the fact that at least Arm 
> doesn't use IPI to flush TLBs.

I thought the use of "may" was satisfying your earlier request?

Jan


