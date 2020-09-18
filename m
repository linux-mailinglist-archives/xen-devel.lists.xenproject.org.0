Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DC2703AD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 20:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJKkT-0005KU-Gs; Fri, 18 Sep 2020 18:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJKkS-0005KP-2u
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 18:04:40 +0000
X-Inumbo-ID: 6483f357-7244-4603-a7ad-84d3eacecaaf
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:d::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6483f357-7244-4603-a7ad-84d3eacecaaf;
 Fri, 18 Sep 2020 18:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OPD9EmaBvm8E6Hst9mNfoAov17dGh5Qad9NbWTaR9jFtgI5CmjLjcbt70j00ybz/JrXMrPDA2Uws+D11GJB54SxqngIMrsKMm7c2I+6YJuSHqagagiGtGrVFkxgSEnjWCqgiGmKwVc8zwnS9kYmpnRNslo+s3N5mOtj4njdJhO4qLRGLK98/1/jka7TnPOwmxMUIYPlML/kJ87Vo7ZlG2qw61nf+p/OuunYJ3J1XLslWL0z47NVgRECRZXcO2U78TcXj4U9FXJfHClLR8wNfbjoP9fJWs5VDEFJdpqMjyfXoXdJsV6RSOKpIDkny+L1Ci2yrESkIOsMhjmjDSUL7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04K8WvwpTsTT8DZRx/vQbmgtTL2ywarnaPCS/+o1PV8=;
 b=BeZBtB1WdqT68otNq45/Ztyj/jU6nhvUXU9eAfsjCk7IHtfr9I5vIx0Qwjl6eAZodI9Rl/Yl9dkCgBbXwGAs5mkWRLl282eTHqsfu7AzJe/P5Y3gUxCIAN0sbN0XScINmR33TP2wSxRGjfoGYcHsmixJWVlf4Uig7EJOSPPQJSffX020hbVfUBww6ywgu+EktPDS9CY86CNu69QcZ2f0d+jDYWlGNuchUKZOMdxHGLrJawwCX9iG8gny/LTsOh4C+sDQ/wRRVb18nm0qWHZh8Y0SCDNwTFtc9/YH/mNxUaF2+aeiMPuVUyIzAi15xOGpKNow0EE8kyaeOSPFAxScmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04K8WvwpTsTT8DZRx/vQbmgtTL2ywarnaPCS/+o1PV8=;
 b=GUCLqRZBew8hUa8DN3CWelHfh88L/b6PrQWb+BL0rid3mHnHJAGNU2Zq9hIjahtD/D1PnZ3MlmRR7rD3q4oFu27/ARm4Hb1IUyvhC1TBZKGvxcR4HBUPHbvSD/jhRji+aiMSKX7+NQ46Ym4EOUjccqpu93jJeTH2BLmAhXdmOkInFCDz58CuyBNQeTFB4QGGmrEskNpryL0VDXbVu2eR9e/zEY6gLkt+BRdau4RVyASug3url0w1yIY7qxgR2ozFcJkUI3VTvp9IAfEMSnKPJA5QGCCZQyBUIGmMBAdGRO8cbQjW7ExqVQYzL/ssKwAE7IdfIvtPIrkN91LLzHb1PQ==
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=dornerworks.com;
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::9)
 by CY1P110MB0520.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Fri, 18 Sep
 2020 18:04:33 +0000
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b]) by CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b%4]) with mapi id 15.20.3391.019; Fri, 18 Sep 2020
 18:04:33 +0000
Subject: Re: [PATCH 4/5] sched/arinc653: Reorganize function definition order
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
 <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
 <0a07faee-998e-e412-2223-7bbeaaa94bd4@citrix.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <3c795c6f-e576-e3be-dae0-a2f3cd2b19a9@dornerworks.com>
Date: Fri, 18 Sep 2020 14:04:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <0a07faee-998e-e412-2223-7bbeaaa94bd4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0057.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::27) To CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:401::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0057.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17 via Frontend Transport; Fri, 18 Sep 2020 18:04:31 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9de90b20-efc3-47c4-9afd-08d85bfd4ba1
X-MS-TrafficTypeDiagnostic: CY1P110MB0520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY1P110MB0520BD24B0A7AD5CC1615F32E93F0@CY1P110MB0520.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(2616005)(54906003)(110136005)(26005)(8936002)(4326008)(36756003)(8676002)(6666004)(956004)(5660300002)(16576012)(66476007)(53546011)(66556008)(66946007)(31696002)(86362001)(52116002)(186003)(44832011)(31686004)(2906002)(6486002)(508600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de90b20-efc3-47c4-9afd-08d85bfd4ba1
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 18:04:32.8060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0520
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/17/2020 10:17 AM, Andrew Cooper wrote:
> On 17/09/2020 09:12, Jan Beulich wrote:
>> On 16.09.2020 20:18, Jeff Kubascik wrote:
>>> @@ -517,27 +516,35 @@ static const struct scheduler sched_arinc653_def = {
>>>      .sched_id       = XEN_SCHEDULER_ARINC653,
>>>      .sched_data     = NULL,
>>>
>>> +    .global_init    = NULL,
>>>      .init           = a653sched_init,
>>>      .deinit         = a653sched_deinit,
>>>
>>> -    .free_udata     = a653sched_free_udata,
>>> -    .alloc_udata    = a653sched_alloc_udata,
>>> +    .alloc_pdata    = NULL,
>>> +    .switch_sched   = a653sched_switch_sched,
>>> +    .deinit_pdata   = NULL,
>>> +    .free_pdata     = NULL,
>>>
>>> +    .alloc_domdata  = NULL,
>>> +    .free_domdata   = NULL,
>>> +
>>> +    .alloc_udata    = a653sched_alloc_udata,
>>>      .insert_unit    = NULL,
>>>      .remove_unit    = NULL,
>>> +    .free_udata     = a653sched_free_udata,
>>>
>>>      .sleep          = a653sched_unit_sleep,
>>>      .wake           = a653sched_unit_wake,
>>>      .yield          = NULL,
>>>      .context_saved  = NULL,
>>>
>>> -    .do_schedule    = a653sched_do_schedule,
>>> -
>>>      .pick_resource  = a653sched_pick_resource,
>>> +    .migrate        = NULL,
>>>
>>> -    .switch_sched   = a653sched_switch_sched,
>>> +    .do_schedule    = a653sched_do_schedule,
>>>
>>>      .adjust         = NULL,
>>> +    .adjust_affinity= NULL,
>> Adding all these not really needed NULL initializers looks to rather move
>> this scheduler away from all the others. (Oddly enough all of them
>> explicitly set .sched_data to NULL - for whatever reason.)
> 
> The "= NULL" is totally redundant, because the compiler will do that for
> you.

I agree with this. This originally was intended to lay the groundwork for patch
#5, but looking at it again, was confusing and unnecessary. I'll remove the =
NULL lines.

> The last user of .sched_data was dropped by 9c95227160.  Conceptually,
> it is a layering violation (it prevents different cpupools being
> properly independent), so I'd recommend just dropping the field entirely.

I'll remove .sched_data above.

-Jeff

