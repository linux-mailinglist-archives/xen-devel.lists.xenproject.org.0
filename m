Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7373CCE35
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 09:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158083.291231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NKL-0007EG-RD; Mon, 19 Jul 2021 07:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158083.291231; Mon, 19 Jul 2021 07:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NKL-0007CR-O8; Mon, 19 Jul 2021 07:04:33 +0000
Received: by outflank-mailman (input) for mailman id 158083;
 Mon, 19 Jul 2021 07:04:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5NKK-0007CJ-K0
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 07:04:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90458790-e85f-11eb-8aed-12813bfff9fa;
 Mon, 19 Jul 2021 07:04:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-o5pG4AyiMlGbHkfKLubRPw-1; Mon, 19 Jul 2021 09:04:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 07:04:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:04:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0112.eurprd05.prod.outlook.com (2603:10a6:207:2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 07:04:26 +0000
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
X-Inumbo-ID: 90458790-e85f-11eb-8aed-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626678270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIuzFfhABiQv9iGsSDKXcKegJsrcfCTLxRL2Ms4iZ8Y=;
	b=kr7MCIBSlSiJUIkOaBnfiTd0BfkXyiSSPKKvyFsHNsDXwtno5vzhlps4REVPQ6GA64QVFX
	hulIJelyoIYHC4ZF+5VXHT4nAozWzTlS6SX+q3eGe7P3ih9Yum1ptrINFZqmdCISIPJPKg
	s3NzX+VpFNDixo3yDWX921RrJYHFObQ=
X-MC-Unique: o5pG4AyiMlGbHkfKLubRPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVPwkArwgDU/3fq33W5LFiD6qllz0g9UKNK3eHS0qwsv0kBpgEjdndaRD546w7lXVdNFqxS026Xq30cjmfdwv0gvn6AK1lTRM1GiW4ZKg9/bs7EonqQ4i/I0hnajf7nDURrWnXLMgNcN/Dwb9PVz9BHg377fst8/VSKLr+lKjbpATOoBap/gty3ub50iefhEEVQSr7mZZq6xYwO7QwP88UAz62rJOvPKGpdxp9NNTiUbaCqQ70/9ebwVgcinsiMJa3gD3HdoZaFdVKoORn6xyyUjDW75AQe+KoVvaslD4ostKSAWXfOj4zoTHl/t+Mnf3M/9tI4R8F3/M8YI8+U0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIuzFfhABiQv9iGsSDKXcKegJsrcfCTLxRL2Ms4iZ8Y=;
 b=m61XLntZHdKY6w+Vyv12Vs+92FsPL2t9YrviX8NecffjSYxziAMhQLsVYQHGfpm996yAKEU1ByVE9Gd0eMHguSbATSRIBb5ny6xlZc78k3veNLh5VRqEb9YcSYi67Wrm/o2pWYHQtrFOsFy7VKYrWOgHI64Gl9updIfkN0rXGKDdyEQFZw1BWlVV7DhVdIKBawBE3x0xOxb6VYb1QS/RpAXqP/DMA7HnyHF7M5/WK9SkCNgQQ6kJOcKPyucuTx+TvyJ0GqfRgmYbKa2jFx16BmVT9scg38B54tTjhtvvI+hchGIUrqkOX47RdGELq/xOjKjNWs4gO4WNQMU4ZKYDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 163782: regressions - FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <osstest-163782-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f3dfbdf-e5f9-f1fb-4cd9-a42adee73e30@suse.com>
Date: Mon, 19 Jul 2021 09:04:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <osstest-163782-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0112.eurprd05.prod.outlook.com
 (2603:10a6:207:2::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ed97eb-7512-4024-1ba5-08d94a837269
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608EDC464C0ED3971F20A84B3E19@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r5aC7nJ1968zG7KBwC0T5tZQu5ecskTby1K1G/6X+g6q503xOuLSGKiUoVZn9iXgFoFqrLwSbYF7LCwytu9DKunSWCHw5BhxHXh6sgnAj3J+UzcPA8bG9M/hP9beZVVdYbPNHqR9TOedZWGvPtngGMWo61/RE7JZn1Ir3AJe8tEgiVYNs1I/OyTTfU5dYNYeI0ANrp6jRC1MSFYeG3PNIUj+l5QruepBPV3ViX+lEsrIQDWNUMjOCfMB5/r/tK4nt/4QXU4L5uhZIpoyzmGylh7kPKYs9O7ycTlUDrMeddISvzwQOX5d2U0nwP+LJcks8CroRX2+3MJRZu+zFiOhEEgBZfqmpAk+cZE6cLLwLOQKexBO7wuOqaPsenfbbJbG5zV9TyGGG59lAEg3Hv+UIDKLif2sC6281nHstChhfV07ybq6ceowiGKLSKnLVU+XYAL1okRYVdyjv66Fgf1GOsa1BtNv0csi+aB7OcjYrASZu0v8T9joJQHvt8pgTY7gvy9jukJG9Ej5u40awxWVR4Tdw9eK/YesbiFjfUpzuTQ2OIJGmkmyzvzDcVsDb2mZqI+IDsoQcn5Leq3gTgCmzWkiDOgAov7uiIOw+15AGr9C6rpDxDQ0bo+8tFGPgrNL4np9q+2bEsacOHCfD6H+aT+5z+coWBZBdxjwJOVgM/GL373w9XpXj4pKgf0Eh8WQTFGMfJEX/kHRdGmA73Agn0hbBGi9bcDT6qzUNfJ3/HuukWmx8eDanmlg3VlDGH5CJPRLOZSpauy58mC/y+NDnxOD31WDmDX0ohO0THWn9daMjVGHI4ylqRd4UWcM3MCw/i6N+fBWJ6FksyqR/dXSesCtEocn0kzz1sFwQqntFR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(366004)(39860400002)(36756003)(31686004)(86362001)(5660300002)(53546011)(8676002)(4744005)(8936002)(316002)(66476007)(31696002)(4326008)(83380400001)(110136005)(66946007)(66556008)(16576012)(956004)(38100700002)(54906003)(6486002)(478600001)(186003)(2906002)(2616005)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3IrQndmYmtaZDJTK0RJclIxZUlUYWxKSytuYVgyVE54bGh3dkRKYXZ6Sndz?=
 =?utf-8?B?dXNRTHY0Zi8vL2hvUDRYZVNDNlk4RUt6US9KemM3REloVm5VLzNmVWE0U21J?=
 =?utf-8?B?K1NZSHNyTTRaeXAvai9MWmQzWG40UEFQd0RUT1VPWUk0bkc2Zmt3WTdiaDVQ?=
 =?utf-8?B?QWtPcmNDZWVEZk1ZRFR5UWlJd1ZGQ0Z3cnJFT3FKZUVmSVplN2hJYmVoVnIx?=
 =?utf-8?B?eGMxc1NXTlRhQTZDU3JvdmQ5SXNlNFhieW56S3d3U2VST1pQTTBKRy9YTSs3?=
 =?utf-8?B?MFVHdnkwRGFhVU5Bd3NSSmZacTUydVc0Wk1NMFFHUVk5SDNuSU9Sd2x6UVFZ?=
 =?utf-8?B?YmNvUCtQLzl5UzViOTU5bXZGTTFnb3drSHl5cldDVVkwaHJRS1UwaUU3V1NW?=
 =?utf-8?B?aDBxSGRxWGtJeFlQUHd5Tyt2Y3NXamkyQnlEaTB4Y1BZbm1Oa2RmdXNONWgz?=
 =?utf-8?B?YWFxZ2M2bitYTTlkdVBLZUp1dDhMcjBBMCsvTUhLdTF3bThBYzJOUUNmUXk2?=
 =?utf-8?B?VEZHa1V2Q0FFYTl0eThIMlNDQWs4TEVRMHEwOWl1bEJIQmR5RERPc1h1WFZ1?=
 =?utf-8?B?RmhlLzY1elAzS3pncFlOWVFwWWxvS0tEVUNGQjZIMjhlMVRtUHQ1dzdpbXBZ?=
 =?utf-8?B?WWhoRU9lWW9CaHNoMDBnS2VNQnhMUGlYekZwSzJZdm92dFB0SUpzUEQwSTdj?=
 =?utf-8?B?QjN6L3owNDVKSWNNaGlaSGNMcGlxWENaTWZ0dXdZRkJ2Um4rNGdkWGlNMDJn?=
 =?utf-8?B?d3ltT1c4YmxuL29rZCsvUENaZnpLSkpaMWxEVS83amE5TGt3QytnUVdMT01v?=
 =?utf-8?B?RGJxWmlFNzBaTW0vSVhEbk8wamVTVU9TalcyT243RWZWNW5YOE5XMHpaV3A1?=
 =?utf-8?B?YlkyNC9MN0tYaWZwM3RBM1U1ei96cmJaQVo0WGdnSWxLcFR3Z3lTb2xsTXN6?=
 =?utf-8?B?ZjRaQTRtbnFsVCs2aDFNbUlSVTdXV21GZHkzL0czSS84VnQvM0lNbjF4TEE5?=
 =?utf-8?B?STNXcGpUckF0UlFhWjFpK1ZEWVVkbWp6cnFrSkdrWHRIb0gvS2VyMW83L1Bz?=
 =?utf-8?B?WStjZldNT1NpTGZuU1VaMStFdG9qR2cvOGRNV2Q5ZjRJN01VSW02cE8wS3ZP?=
 =?utf-8?B?MUdLcUYyeTdxOG5KWnJTMGRiSXVvQTVQN1JaaSt4cXpqM3pQeGVkNlZMcXph?=
 =?utf-8?B?T1VTV09aU3EzZmYwYmJWcDRUMnBxRFpnQktXazVzRUJRUmJjb2ZuZTNFY2pr?=
 =?utf-8?B?bzNYQjFCTXdMWUdJeEtPMmpkL2NONmtrL3dadEdqWHBqaW00QUx3eXhBdWRU?=
 =?utf-8?B?WWVzTnM5SUZEd3dEQ00yRDVYeDJHRlN1eEdUNkN6WUFZbkFCUFpsOGdVVjJ5?=
 =?utf-8?B?bVNHeDEzNjJTUW83Q1dScWRCZWlaRStYRjllSkpOd08wRVFDbnIwR2pqSitH?=
 =?utf-8?B?cXB3eXVKdUUzTkJFOHc1NnBrSFIwM2gvaFExcDBnZU9xOUZoV01LNDU3bUdz?=
 =?utf-8?B?WnFOTjNxdFFQVzVWRUxXQVltT09ZU1RQb0VOWDQ3L0pSSmpSSCt5ZE5aQ3d4?=
 =?utf-8?B?STY0dGdVeDBOYW4yQmNORXl3Slg2SjZFS254d2tWRDl5alA2SG9lR2ErR29h?=
 =?utf-8?B?UVUzOEljQWJoT09qSlM2V0VXc2kycHJmMHlXMDN1dVJaUTk1VmxRM2hVNW9U?=
 =?utf-8?B?c0RNWXN4OGFNVGxUVHpLK2RtTUlYdC9qcHN1eE1IdGVnQm9iQVM2VjB1bXpF?=
 =?utf-8?Q?uo7ZbEmaItRylP/3DBSjzm39xdMkXYgUbdf1WkQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed97eb-7512-4024-1ba5-08d94a837269
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 07:04:27.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 295U5c0XXTwzdhEwUNglf4nlqQhGS1A7CQxChh6R8wUXzrLqeUwL9WSHBYUDam4C1ONVRUogwBJ4rqq7Sku/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

All,

On 19.07.2021 04:38, osstest service owner wrote:
> flight 163782 xen-unstable real [real]
> flight 163791 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/163782/
> http://logs.test-lab.xenproject.org/osstest/logs/163791/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-qemuu-nested-amd 16 xen-boot/l1         fail REGR. vs. 163458

as Andrew has indicated to me that he cannot predict when he'd be able
to look at "[PATCH] x86/AMD: adjust SYSCFG, TOM, etc exposure to deal
with running nested" [1], which I expect will take care of this test
failure (preventing a push), would anyone of you feel in the position
to review that change?

Thanks, Jan

https://lists.xen.org/archives/html/xen-devel/2021-07/msg00891.html


