Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC9429397
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206228.361745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxOB-0001mB-F9; Mon, 11 Oct 2021 15:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206228.361745; Mon, 11 Oct 2021 15:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxOB-0001kL-Bt; Mon, 11 Oct 2021 15:38:55 +0000
Received: by outflank-mailman (input) for mailman id 206228;
 Mon, 11 Oct 2021 15:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxOA-0001kF-BT
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:38:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56209bae-2aa9-11ec-80e6-12813bfff9fa;
 Mon, 11 Oct 2021 15:38:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-JM3_ItKtOlWTtNCRQeOzEQ-1; Mon, 11 Oct 2021 17:38:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 15:38:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:38:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0001.eurprd07.prod.outlook.com (2603:10a6:203:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Mon, 11 Oct 2021 15:38:48 +0000
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
X-Inumbo-ID: 56209bae-2aa9-11ec-80e6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633966732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/8VgskuAtOn+RajcLyK3w9vaJOVjYkOjh2PurgjvpE=;
	b=ho7jd3dnidtM4wx6QNM5GRqEUcklgqNKOrDsxH1y9nlw5i/G0CjvpQMaY3FOLSDFngLDVo
	FRZxmu+0JQFe365USeOxy1OdawfbJYOHm0PsXek5AJykAa37hOyeeSlMolXaqP5JPiBePm
	coBlhgZ8sS1JmvJ2SUiK6H7DyU+7WfY=
X-MC-Unique: JM3_ItKtOlWTtNCRQeOzEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKdyVkJqEsRUCJugHW8U6TA5F6mNG9+w/w3vmfyRTZcEY1KYDCWMdN4uF7KAYSTBBNTq1x0GtGdmSGO9+QL3djDebMMsPYwyX8EhP22iKBIWXChqkgahrPHfVNQo6AMI2RszLOT5y79jMQk1USKWJj8fpZoJYAbm0IpQvzBv5lmBOCnE3el+oS6cTWBX6a4q21Pufk0911/rrU4RczJa5HkJcS0t1yMrQGHOfpWhGZ1Hql/EfJiMKmlQPi8MGVgu7vLtxKpK35kPSvSN+ni0V7XlkBU8TbS57nwBHaWtg4ZQJbZ1Q0i3agt/DGfcOtQ8SiPqbP5KN8U5Ve0uxW2P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/8VgskuAtOn+RajcLyK3w9vaJOVjYkOjh2PurgjvpE=;
 b=Xsyw+F0v62JQkqyhoRDxOIVyObCxpQO/97naT01C4a8kYF5cD0gk/GR6LA7QsqArgZj4zMB6mKtsk4iDYI7mi2YtniASfRgrRqSBm8w1sn0ZgBdIprkzuT4XwviXk9oHO2q9cYLbpRbVKKF17UR0ZEKqTpTyNTiPN5RGcFuxRBs44S/X+jQOMcgtSlCojqBWbLKjGTAlqQ4gPrMszlImNZKTMQzy3oW8SMAAtBBuiRZkCXSEf8nUmsX3Uqd7vXR3aRE4lcNhpfa+h6j1uxgE1Hj8baPTTOAJkmcIw6okSOnMYtQTOkoZQ+FkLILriDWDRheALSnKRLFhWnAwsKubnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 30/51] build: hook kconfig into xen build system
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-31-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb7accc1-f46f-51c3-6610-4c6afbc40507@suse.com>
Date: Mon, 11 Oct 2021 17:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-31-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0001.eurprd07.prod.outlook.com
 (2603:10a6:203:51::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc72c951-744e-4d7f-c771-08d98ccd38b2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472E41E1F1FFB2302168259B3B59@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXz5xn4QR03tej+ryq3CAbZnBBwTNH00vCud52O/QSgBAPboOAAND0okTC7F/AuvJiX0WS46bQIcfkoqyEH5We7n234JlF4oyb1STabevMQYNMkRpKlxh7FRPOfi+SuqGknHnalMALpDuBo3tBfX2wMHWmJ+APAZjGWfR9egq/7dgbR1bFzXp+axlVf2F4Ybegn41XqR35IsmL/Iz3M2YBlYRlGGmEke6Hy+Nzet1QyFDaSHW1tLN4kbNKO+c7d7+nlj9IJbAekVXMhodHNOfEnKgKonXDZoYbL4EcTH9ffVzNee+84yXyABEVYGSGpdKO4AgPNjg/D38mdJEcU0FGrNDxkcHf6a+hLPQFhScBXrdarSreZk6Dlspyt267WSZkExUNuab6Bkiqj6uIZgDvZm8uNAie8gxIq8pY9sMZlWEGSU8AmoMO452UIIfjNg3aKXlVmyQLKWUIIJrKvumGzWjahk4sdDymJiIlEwrsc4K6gPjdrEWEPapGVj1I0qLu6+kBFRMJFiK2ADngU9E3/rslWqOEXO6lKXJjPdrkePwAOB8c/0i//xCftCgUkBOlTISbuwKJML+qUU16dSKDVsYNkXDqocOG6Ok/lgzsdeI6XViswllcyYfImuOgXy0LYF+PuUgvLP03CElctHQ9vPFidWmEFZLCqYVfkERnUV42lYNhegSpMW+AXrXxCtG3E86sB0Cr0ALBv7m95nV+QaWEbSuzM0RT0hVHOYBb9bEhXHxqQBniG+AHQoiEOO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4744005)(5660300002)(26005)(186003)(31686004)(53546011)(6486002)(4326008)(86362001)(8676002)(316002)(508600001)(16576012)(54906003)(66476007)(83380400001)(2616005)(31696002)(8936002)(956004)(66946007)(6916009)(66556008)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVo4ZDczc2twRHZPUDI4UXI0dms3NjJUYmpOQyt5Qm95ajR2SDQ3Nk1lOXlG?=
 =?utf-8?B?enYrdHlMN3lCcktXTEt4RVhNRjkrdG93Q1VmVGVwenB5N0RFR1IzZFNOWVVG?=
 =?utf-8?B?amM3Y2M0YldzZ3dkNGEvenJUeHhsVHZLdXdqUlZXWHZVeEljYTNMQlpMUis5?=
 =?utf-8?B?Zkk0b2U1R0RVRDJ5Q0tsS1Z5NlZxczJrM3k2WTJteDB1UE5QWHhuY096bFVK?=
 =?utf-8?B?ZkIwQ2xreDJNV3poMk9nYWs5MVVGRVczb2REK0E5S2krblhGdXpBb1VkeHhu?=
 =?utf-8?B?bWpTNWtEWjZmL0JGUjgyVUhoWXVyWlJORGZGaTdNTng2dnBIWkIxSmRETWVE?=
 =?utf-8?B?djh1SXJiMjFOVzlDcUxmbmVaYmIzdWJyMk4rN0cxRXZ5eStGNTJXUnhQNnJN?=
 =?utf-8?B?K0ZJVkJXOXhIbU1VdDREYmxtbmlkbUhQTWNGTXlYdW9GVjFGZDgrNGcycmNi?=
 =?utf-8?B?dWhVMnRvN1ZSU2FaNVNXTEFYb2ZKWXpRSXQ2cFVYQlc3Q0M0MG5sOHFlZlBk?=
 =?utf-8?B?ZnROekx4R0oxdlZvZE9hMUx6MGlTSlJ4NUtxUThod0FwS3A5SUIyWXdyMUk4?=
 =?utf-8?B?S3dhS2grNFpLamxMcDhCTkgvaUJUK2trVTdiN1piM3BZYjFvRzFaQVFYR0dm?=
 =?utf-8?B?aExJWk5RNWFyYkFkNmgwUmgvUUwxYnhZUVhhaDB4ZUI2KzVDTWVHMG8vY0hm?=
 =?utf-8?B?cEpaQVRQcGV3VjdReXptSkluNnJKQ3ZCRVN5QmN6VHgrTDc0Y2JVZWRkT1l3?=
 =?utf-8?B?SWNMVk0wMDZzYmxGeTRJNmxsZm5HQ2dlVWExWHlqMVRiU0JtcklxSXhjMXh3?=
 =?utf-8?B?ZENCWmpaRFF1OWZsZ1lZMm5md0pQNi9MaDZkQjdyZEMzMkVVOVYzbU83bXMx?=
 =?utf-8?B?aVVHWkQzdlMzM1oyUElSSGFMNStueXhpbWdaZ25TY2ZkLzc5UUx4N2ZHOVV0?=
 =?utf-8?B?eTJIdmhOM05PZmhQL3BHZkdXMURhR0VvK0l3ZVM3Z3Vub1dVWmJkL2FMYUJu?=
 =?utf-8?B?dFdXU1UzaUdNb3hpZ0owUGJqSmt0d2JISG9FSWVzblU3OUxQTTVDQmdzYTl5?=
 =?utf-8?B?TUptTTJ2ZzRGTnVSUDFIalQ2MXFhL3JaYlBScUZ4bTVTdzVvd2ZOd1JxVm1k?=
 =?utf-8?B?UlpqdHBqeXBIZVNwZ0FvWExnZ1praWRERWhUN1F5MlJyVzNVaUxMRGlGcHRD?=
 =?utf-8?B?SDliRHU5b3IzTGJIWHhWaXRtQithbHVNTTBacVpZNHloQUVvWmFKZFhUSG1N?=
 =?utf-8?B?UjA4YlhaL2p5V09ZTWZWcHNWL29JTG9QSEI0cTVuV2M1SDBxdkNzbWM1TVQr?=
 =?utf-8?B?eStRSXhqa3ptVzFaQ2tWNzU3dmlmQkQ4eDcrVFVPTzBSOUllNUZrYmFiSEZ4?=
 =?utf-8?B?aVFWSldvQ0pCeXBlZmRHYnUyeUw5Nm5yWHR1RXNJN1lwVFZ3cjNCYWhlbEVx?=
 =?utf-8?B?czJuK09WWjhmUG9PS1pDOXdBd1NEZVZaSnJoVlRpVEdpMlhPZ09WNTNrYXVo?=
 =?utf-8?B?THpqY0dnbDFkS2JnWHd6Q01Va3FJdUlLam9ZNXdBSThvd2QrRlc2MVl2eGZP?=
 =?utf-8?B?MGtzcGgvMjFGa0gzdUZ6aExXQ2xWcFpTM0d1WkJwTVZ6NisxM0E5N2FPVUhJ?=
 =?utf-8?B?MUdJelIwWjAzSm0vZWRtMW94UmM1OWczQjdGMm45b3ozWHNWU2ozMXBPb2hE?=
 =?utf-8?B?b2pzTEtRVDJ4b2Q2alRscVJUVEpWcjhqbDlxUVByK0w4TGJydjhaUnd4YVdQ?=
 =?utf-8?Q?cWzpqOD5vboxBHGtyih6cgORhg8CByAfPHHqQMW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc72c951-744e-4d7f-c771-08d98ccd38b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:38:49.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlkPIralznHkoRTpZQhiS8yO+bAKtg89yfTorukTRYzFRymYZM0xcqDq9shNhXmjP6u1qyhLce6UNnBhb2Dp8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 24.08.2021 12:50, Anthony PERARD wrote:
> Now that xen's build system is very close to Linux's ones, we can hook
> "Makefile.host" into Xen's build system, and we can build Kconfig with
> that.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


