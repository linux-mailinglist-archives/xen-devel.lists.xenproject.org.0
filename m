Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328546E4A6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 09:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242797.419890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFBh-0000PB-RA; Thu, 09 Dec 2021 08:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242797.419890; Thu, 09 Dec 2021 08:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFBh-0000Mj-O6; Thu, 09 Dec 2021 08:54:01 +0000
Received: by outflank-mailman (input) for mailman id 242797;
 Thu, 09 Dec 2021 08:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvFBh-0000Ma-0I
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 08:54:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0710df-58cd-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 09:54:00 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-YIeMfEgPNpKlOH3S7obqeg-1; Thu, 09 Dec 2021 09:53:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 08:53:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 08:53:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0047.eurprd05.prod.outlook.com (2603:10a6:20b:56::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 08:53:57 +0000
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
X-Inumbo-ID: 8d0710df-58cd-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639040039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDCu2pVFLr5823cYs9N69Z8etNH9rKVurMhQP4VSJc4=;
	b=cNklPYW0+t3csg0P2gZHOCj2JfW9UI8hsrC45TfUJZt5i5Hqf1Y1Ce3MBh0yz/TUjhnz45
	Raczx9ygFXgbOwa86QUBwPNZV+0saajYOremhQmS3YIcBjviHceuyk9fY8rMUHHUDMzxBz
	q2yUf7DsX5bJF9bg4XAyMnW525eae/A=
X-MC-Unique: YIeMfEgPNpKlOH3S7obqeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1ai2DLRgrmSEqUUoTjFhK2JbbRcUPkRuvjLkRIBgbfrhNFuzdODioM+/TJ1Bma62+6r5rviOuI8HvOOkEiDZhDxRHpyEEFVa4QrwbGc1+xb4AV6Va0T/024EAWpnVGSC4lGvS9nackXXpZCnU851bQB/6CLmHWESys8u2Ds0hhuwu6qEkOe++QuZw5GJBrzF7Fv6tcyvHjsdweF6f7G59zvG99CLF3/Nm63buFyKdzcMjVP8YVZnz6myP9s33BQtoQuwyZQcQ/2gpd6JTP0aXgrhYcHCAz0U8sNjt+K1tc/0js38lc3MTcfdwozIP1Ad8bShb1BU64JAH8b06kc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDCu2pVFLr5823cYs9N69Z8etNH9rKVurMhQP4VSJc4=;
 b=GaTklpN7t2dFzgwTmS2PG69zRz969cmyu7U1i9g5ifaH8q2v2Nmw1Lgk+R+hmhtwaPE8TJfflKbotNpD3eZ7rSXldcLqn+hzMPjKofFupJ2MRQYDO4VmZUOZjWXkXR34+6K/vthm6kw9PGG/zTq+h92Dso8z2VHZATdcKaDMgWdfold/0pgsLZDYspAKsouJY775NoymFWunGWMc1N9OI1DMlhZoXMaAgjH6x3HKqbBnmfyTbb9vt0CumBWljsnl8U5wYOTzR6fgs43hDEGzdxos54+q5nYMESPGGZKUXo1DFUmd3WG662rNom7k0ekujoraCFhk35lEq6wfF7Z5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98c1b555-0656-d7b2-0cff-3bed84eb5e88@suse.com>
Date: Thu, 9 Dec 2021 09:53:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/monitor: don't open-code
 hvm_has_set_descriptor_access_exiting()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
In-Reply-To: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d566b9d6-9afe-4a27-5984-08d9baf16fd9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2605580E27F4FACAA0B4F12AB3709@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R19V5zCCU/wwXBLgAiarhnGzM2v5X29+MWxreJfNuzCWQYOWvzO0mLNbyfLz7x4qinpyJZ4XSgps07ZinvuefpLv509M1lIcz9QeEN+6aaKml1FOCCBOf/9IEGvbgt3JyMyp2md0LCqY4yWXGiUMshyFO0iiBzJhQLzbR527mUlCa+LmOCTNyy6bXdxs35T05gk0CT94MUDUv1B2F96LQoY6sCGWRZUZKrVXbbSljiYgBAQjFMFRXKI0jYts2RlaIQSheyfimZPcUN3gM3BzOiQb+4Gs0CHlnWTBblURA/Y/YVNgv5MvqAoz7Lso8FI/qNJEseSUq+VXXWxXX10JJaDO/PDM51fOVbpZ1HK1wLrXMCtUmIRnSqLzE0KxdXMNfnKfKdOdQKn5GJ4tjzdvctY1w0nAc6B+AftHgaCTudchcQsCrBg9rzEIp9vsZmbT40WlVLG12k+PQdp2mlyYlNn98ENxQTj7GbHdgktzmiMRslzYvHWOrO2wY/IwftSOkrM8uPlOhKs7LIVOHUDyJEmusuxY4tteLzhgpfs63NAyS6p+ucZ6kQBqvQYlsitvGN78kR7qe85mZTyA7UncwI2NVLD9w8/CtIHmEk1Vb/q1LlKAGKL+F4fMdh7C2+8Bcyz8jCFc94GEjEYO7pWa73zN/tq9MsBcLHH7I7zhOW8itlu70vhxWmGQ1Iw8+SpZN28jR3nc64z77alcSovVmNtXJFjBJn72KV7jYwh8Hz2bihJsd76WIEZWpkkY4OCo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6486002)(508600001)(186003)(54906003)(4326008)(956004)(53546011)(66556008)(38100700002)(66946007)(66476007)(6916009)(2616005)(16576012)(26005)(8676002)(36756003)(2906002)(31696002)(8936002)(86362001)(5660300002)(83380400001)(31686004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGpFeks2T2MyZ0d4cnoxRFg4Nm4rbTZBd1pUeldzNk1UM21qZmhNRE5yL2F1?=
 =?utf-8?B?OXhqQjlraytKT3FWcGRNdGtZVTdHYzdZSHlFemRxVlVFRXBiRHdXb1BQbjlx?=
 =?utf-8?B?VTJPRlhLU2VWZDFvY0I1TDg0UDlVamFxUWFuT1dxRmZQSTdiV1RKUGRtUCth?=
 =?utf-8?B?NytZZEZHVmNRcnVDNXROR2ptUDF5V3B2bVp5RFJMWEduVEdUaGZldVEzT1Yz?=
 =?utf-8?B?QU5nQ0g3SC9xK3NvaFRWNmlxUEV1ZU5vY2Y1RkhsT1R4dGpqSUQ0ZHo4V2Z6?=
 =?utf-8?B?d3dURkhzWmlvNGZ2bHpacW9vNG02UnVvM2NVWTB0YlVQbHp1My9rVDdWZUlM?=
 =?utf-8?B?T2UvRWYvZWltdDF3VkZVVDRMbEVWYVJHdUdsSGFoQkdSd3lYMlRmaUduVzcz?=
 =?utf-8?B?SFF2YkJZTVAxd1RJSndJTFlVelJaZEhuZXR6RXI2VExTT2Z1bDNRZWhsaUVr?=
 =?utf-8?B?VlE2SnQ3a2M5bUNqRUozTktjS1VVSmpwWitGWjdlRHlvL0ZNVXZpemx4NUlr?=
 =?utf-8?B?MXN2YlVYOGx0RU41cmJndXgyWWVabHFKelp1OGd5Wk0wSW1CZ1d5Qy80dzcy?=
 =?utf-8?B?V2xxZ25UWWNHOHZ2aEJZb28rZ2g0L3ZMY0tmOG4vMzRzYVBwNU1EYlk1M3A2?=
 =?utf-8?B?YlZ6UTN1c1M1RlZyWXVVSjJvelI3Z3BzT3VSQ1Z3Rzh4YVhURnJ5SWhHS0wv?=
 =?utf-8?B?aUZ0UEhpZG4zdUFIVkJtOHE5aVZjLzgzSVh3d0VRL3RidGp1NXhObG5HZkQy?=
 =?utf-8?B?ZkR3SjdaenpZcHRlcUtUamtaeFBKdXEvdHduOWxKMGV0SzREYlNQTEp3TjFh?=
 =?utf-8?B?cmtFZnFNRmhpUWFoTlI0TEFhSS9pd3lCY054SmhEOVlYWGxNY3A2L0lqMWJl?=
 =?utf-8?B?NkJ1ai9iN1lBTDgxTjRmSmZCS3pxa0lWQ2l3Wi9QNTdzb0pBakdpWE9BSTIw?=
 =?utf-8?B?SDIyek9nQXVXVmF1NE9GdTBMdC9RejkvaGVKNmdkM3lxZElNekdrY1FBUUlp?=
 =?utf-8?B?ekVhL1J6REdTQ1JoSHRhOWhPUVM3QTlXcUhIVVB1S2UweU5DQ0NaOXhYZjBi?=
 =?utf-8?B?dlBIQUJORXNnd3hsMmhJSy9oc3pUSHAzTStpeTNwRHdReWJvdHdjTTBkdlQv?=
 =?utf-8?B?cTNOZzkyRFM1eVk3c1BBUVR6cUZ6ME50U2ROU2UySkhQVmV1eGRIUkpEU1Zn?=
 =?utf-8?B?WjNTWkFoWklKR1VzYys0c3J2aFVyVUdZZDlDRjJ4MEFWU2VBakVhNGhMak5n?=
 =?utf-8?B?WS9oTUl5Z3BQSHgvaU5xc3VtTXc3SmhaeVpVbEJqR1IwdDRicHhzNmpJdFZw?=
 =?utf-8?B?MnA1Nng3UlpnMGtBT0I1MHg0MkROQmFIaVM1QVM0bDNvVXhJTWozemIvRHZN?=
 =?utf-8?B?aDc1TGZ3eUJNdTE0dFhERGZzTFhmT2lJcE1iWWZ1bHVid1ZxU0RKZklBQU81?=
 =?utf-8?B?cm9nMjYrK0t6SEh1V29GUHBsQWtodC80eGI1YVo0eUxucG1rUVdDUkRadmxr?=
 =?utf-8?B?enc3TVFXZkVmS09yUEpVQlRTU0dtcXBOZkZrakEyZmwvYmZaSTI0eDBvbzRB?=
 =?utf-8?B?TlBQM3FVRnZMbWQyZHNBajNKYldQMk5aS1hIMWRQQUh4cnM2cW95UDRrSzQ0?=
 =?utf-8?B?K24vSFpTNFphNFhwMnB4VkJRUzZ6MjZzZVpuQlZvRy9kazI2eW1vT096dXZ2?=
 =?utf-8?B?RW9rRzhScWdlbEJHWlUrSGErQlphWDliZTR5NkkvR1lrdWtqMEJWZkhUelZH?=
 =?utf-8?B?ZzRJcnk4UnFLdCs3MVVTOFljd0QrSHVlMnpXa2pGZkZ1VlRhOTdUUHFPYTE2?=
 =?utf-8?B?OUVjT0RYbDZpei9wRDNyYnB4NjlmQ0NRbkVlQVFtSlFxL20yckJvaU5uSnZ2?=
 =?utf-8?B?SnFZTHppZm92SmYyR283Wis1K2RpS2pQTWt5clJvV3o2SllWQUh0UG5ZNzF1?=
 =?utf-8?B?Q3EzOE9nTjBVanloc05Fd3JXdXJ2dWFWN2xWRjFpV0JqT1NENE9lM25JdlR6?=
 =?utf-8?B?aWF6dllmdXY4azY0b0kvQk9vZ2dYbExpdCtlRmZOVlJ4M3ZObnJKM3BvZVRa?=
 =?utf-8?B?YkJUdXdCeDN3UlljaE45Z3dzaEJLaTFlY0lXUU5IWlZFQUM3RmZIRDd0OXoz?=
 =?utf-8?B?TXBtWjVrZmloTjU5QStTc1hyVU01Zy9CbkQ3Lzc2bDB3VWJnQytKSVpKcG4z?=
 =?utf-8?Q?bx1LUWw3Pq6AeiMXDehgOHE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d566b9d6-9afe-4a27-5984-08d9baf16fd9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 08:53:57.8354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h2ckoOVQZDzK6U2PiLTka0qf5G7OOgjEw7b2eTIAMZ4He6X+yEs5a6rxMFOAhwYrq3ESrzrbtjd9ZvrjrsDWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 30.11.2021 17:11, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack (or otherwise) here please?

Thanks, Jan

> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -263,7 +263,7 @@ int arch_monitor_domctl_event(struct dom
>          if ( unlikely(old_status == requested_status) )
>              return -EEXIST;
>  
> -        if ( !hvm_funcs.set_descriptor_access_exiting )
> +        if ( !hvm_has_set_descriptor_access_exiting() )
>              return -EOPNOTSUPP;
>  
>          domain_pause(d);
> 


