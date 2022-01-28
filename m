Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DD49F762
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 11:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261929.453813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOcr-0003kt-2N; Fri, 28 Jan 2022 10:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261929.453813; Fri, 28 Jan 2022 10:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOcq-0003i2-V6; Fri, 28 Jan 2022 10:37:04 +0000
Received: by outflank-mailman (input) for mailman id 261929;
 Fri, 28 Jan 2022 10:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDOcp-0003hw-33
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 10:37:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39f73045-8026-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 11:37:01 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-xNIfM23uOBSiDPYZ7xl9rQ-1; Fri, 28 Jan 2022 11:36:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5418.eurprd04.prod.outlook.com (2603:10a6:10:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 10:36:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 10:36:58 +0000
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
X-Inumbo-ID: 39f73045-8026-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643366221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72GN5dE/UvS737PEGXDv2rGsm6JboRHNJEnW8SC4O+A=;
	b=BkGtbxEh9xdDsFF2xPzYEsYpckVneG5m6J91qPR+vp4CCtVtDXyR7SpLGh4I6vf7NJvc/U
	Dh+L3+Fsem+E4RPUibTIQ7aGQ6tqh/fH7OPkuQh3yJQtqhYkgpAcGYXw37i9OAHrkUlCJe
	9NPt4VLe7jjlKFJdycQG+Q5D8zEtjRM=
X-MC-Unique: xNIfM23uOBSiDPYZ7xl9rQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi5W1342fbhXUSxl0mf2T36+VIzLH1Zp99876P8KxUUXgqvAbDhKyFq/8yUowEOuqnw+k+gYyJ3eUmSrw+41ZNw5+bUSmaohQPTj9skh+bt8fArscuXxqVZ/Yi6RYBwUISS6jyesObEmZLRL4xcmdlvSIjhI2STjN8LqWNq2PMuUe2+dkLNk6BhTdwiOItlypj92y8qV6amnEq/b0Z8A7rNf4hbKyppMuFyPU6MI/LcCf6UI4wownEKmo54+X7cU9+AzjBACeBTuvlKEnWtuqXzCTf71Xu+qHS0aLsQso6sI2TKvdYCk1as1+r9fsdTDU5Be6+TtfBEvBgK3RmdsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72GN5dE/UvS737PEGXDv2rGsm6JboRHNJEnW8SC4O+A=;
 b=LnEzRK/Qn9Tg7ivvSfZZPBex7HmcTkqER3ozuSp4iof2qKG/vEuiWNBVRivLLL6XbqTfzXXAdxUUk46UW/Gf9mgz9a+QWYGjQzNDcEtFyZgPXa8a22Emj6FrgJq6UQWRvagES3/01k/0Es+rlPiwrvDH66hzrmq6b3m9VyW+zdYaOcVenTniAVbeAVG0kfj193a37azYjjJ5I015sswkFpe1pbWUWbNm9HNsqYkbOC2z5R8GAb8T8DH1sAuzKe8zK94c1Q6wU3DHnSGGgKXO4lyrRaNe7kh3/CrU9C+98DDityoMqI1Qf5xoXkTpmFazPawaW4Em+ePZ410p6yByzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ecaf1c37-0d70-77e6-2343-68bb25c167b8@suse.com>
Date: Fri, 28 Jan 2022 11:36:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
Content-Language: en-US
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <9f6e1b13-d53f-05d3-0f88-a05bd0da03f9@suse.com>
 <d5734fe5-4743-8034-57e8-afbc2ce2c624@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5734fe5-4743-8034-57e8-afbc2ce2c624@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fcc4550-c722-41ae-afa9-08d9e24a1c39
X-MS-TrafficTypeDiagnostic: DB7PR04MB5418:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB54182DBBCAC8F0E7A86EF423B3229@DB7PR04MB5418.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4DiAy77oaeFoUmanCOFMV6CoamnHaHDl/45ntKeQQ4jUQ4RdzIUljj76981LKw8L+CxZly/tujVla9VMPW/Wsysj7Mq7ujgN8zajxqObf9R4DTERu7ho/dZ51xpTtD4FM13lwpvQWmqQ/63YO1ymb39IrHh611faID7kujLVyjuClRM49MmUwhjgEXp6jLkYnrtyyY52Judg6Kg28LKCeemoAExkQrTtLFju1CCBMHZ5WoRe4woJQ3dPz/u8AoQPUo4RYcQrwv6HH+iDLrwidzTV9+SNPijbpEUCicZhwYqpq9XRDHyNbDgi3ZZY/WMEA3NgSGj94tR8bIBiqSAk3/O2YDbUvzwdGobDNKnbHWkEblqLmbLs3VJj4DkaBqg2d69zPVsvIg7V94KhFpDCOzc47SW3mUfkEeXt/AKUVmxGaMHcDJ4QJ+HUBpkvZvBKv5CEeQI8IpGnYYxVb0JrcmjTV+JNOsMSvQlfpI+8vhrcd9sJlBljzYJeinBTj/N9EGSJL6eeD8AxyEZPUKiWM5a8GTjb7bJpS3AuvWg+6kzgBQZ11HgFPLm2FaQ78C16nfuYTt+2Zh0fSDM6DnPCR6j+m+R0EAviWbVx62RVSSTJIbd3ayiKmeCGQ0QsvXT3TGyYPHlPjFfW6uPUq4S/4ItCYny/ynVAO9Llhp/hQ4R8Txdm943052vrxM7AGnq1XkPLjAJj7eN+5PIjYAFMFAdTWybtENFZgrcEABBZUes=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(6486002)(6506007)(5660300002)(83380400001)(2906002)(36756003)(4326008)(316002)(66946007)(66556008)(54906003)(66476007)(86362001)(31696002)(6916009)(8676002)(38100700002)(2616005)(186003)(508600001)(8936002)(6512007)(53546011)(26005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJxRHpjV0ZnL3FuTXhTUCtiM0VuU0NQSUlYbnJMejY0eU0vRmFnS3czWVlj?=
 =?utf-8?B?NENFRG5mNnNSV2VPeVNSWW8wUzRYWVIyR0lvaUhLS0tObFJ6Y0x1eXpuWGpE?=
 =?utf-8?B?V2U0OStRVTgwbUgrekNEaUNIb3ZIc1dOeTRTUVlXb1FXWFZUNEh4ejN6dEdJ?=
 =?utf-8?B?ZVNYOXBuaVNDVjRvaXU2WmJhY3VaSnpNTlFhOFozakdJbWJUTDkrM0tJZTJi?=
 =?utf-8?B?V1R3bDBSVFJTSm96Ly9tU0pnc3IrdkJNc3lCd3hRaEpXRDc1UytIbEQyWnI0?=
 =?utf-8?B?L2hCekhYZzNJTGN6Y3BkVDd5YXJnOG8zU1dVMFNpZEZINWt2RjlleVFJY3hS?=
 =?utf-8?B?anZHS251MStNa2ZTcTlrVmZJYVUxa2w2SkJiSUdIa2MyYTBiWmg2Z2VadUNV?=
 =?utf-8?B?eTltb0hWMzhVQzUxTXk5TFNIbEhvdER3TEQybmJYYVpQYTNsWXJ6d1ZtVVNa?=
 =?utf-8?B?WlhyLy9rL1NtVU1xUzhlQ0IyYjlRdFREQWoycjdKbE9xdzk5dkVyTU9XOVpB?=
 =?utf-8?B?MzBmcVBnU1FLQTFFQ2JJQTJ4ZEMvVHEweWJrWFUrcC95Rko4K0V1VFZzclhD?=
 =?utf-8?B?ZGtBcmxmRG9ITVozT0VoZVduWjdzME9HbUxRUmpxNXN6R1lmUHdvRG1GYXM4?=
 =?utf-8?B?NFFUZXVEdUIyZ3VpbjVrcmU4MzdHa0pIZ0JOTVZERzR2M280WTFtUzI0TXM1?=
 =?utf-8?B?YlROQ2N4MTg5V1hMSS9vdEJ6b2oxK3ZrQ1UxNkZEV3B4R1BSdXYrRGdqTnRz?=
 =?utf-8?B?dWkwdndhK1B0cTcvc3IxOUdyN3YzVjJWZ1c1ZmIwaU1MNVpSMUdZOUhOcWRt?=
 =?utf-8?B?MFNmSUNZMm8zYlRVTVp1SktiMVdGaW90dHRlUk5wOEM2WTl6a0J1WXIxdllL?=
 =?utf-8?B?Qkw3Q3RuQXhDdFRwSnNZMStYY0J4Y2ZlY1dqMm1lZTlSMFBLNXRDYlA0SGhJ?=
 =?utf-8?B?MVRmUnBvbkQzaC9lZ2NiYmhnQjRaUDFjWVpwaHFUMkJ6cktZblpaRURjSzRO?=
 =?utf-8?B?QlJhWld2cDVoNGlYNmdIRW8vVDBnQlhWUDVoeGJCN2NwbFZTYkd6YTJmWit6?=
 =?utf-8?B?YTVYQWY4TEVUUkJTL25mengwWGN4WFN2QWo0YzV5cmp3SU1uekhwTEFzRlBV?=
 =?utf-8?B?STMwcWErVmVRK1BXRG5HTVpzQU11YjhBOGdOMW83Q0FGUERwNWVNRi8zODls?=
 =?utf-8?B?ZlAxZ2h2V3RhY2JGZVpjSk1yWncvMTI2Zm1kUVRIZkhxRnZXSU5GeUUySkYv?=
 =?utf-8?B?TTFWUUZxZTFTTzBoK0M3aFd2ZFB3andoSDU4ZWxXa3NWMDV6Vk5DWFpwR01W?=
 =?utf-8?B?Rzd6bDNyZ1BMK3hNZWFxRmxHRVMzdGVnYlczR05PZDNuc09mekJKeHhQNVJz?=
 =?utf-8?B?UkpPelJVbzVOSFh2L3JENXE1T0crck15TTNka1N3K0tGTk1LVitZaFdRR3ZM?=
 =?utf-8?B?OU5EcjNPcDlDeUhmeHVBZnZuTnpKNTRFaEkwSTIwa094Zkw4dHM5RW9MRktt?=
 =?utf-8?B?bVoxVEZkYmt2amR3NENpaDRjSWQ3WWJXdDJ3dWNsREtwRVJ2TUlBV09ZU2Ix?=
 =?utf-8?B?djFyQngyVVBLeDd4SXdMcXJUdnhnQ0p6M2ROcGc4NHNnaVQ3aE1OYXJHbGQ3?=
 =?utf-8?B?RU5tNk5aWkpPWlNTTW1QbkdURmVtVG9WNnArMEp0TjFlcTFDR1k5dXNwblYr?=
 =?utf-8?B?QUpTcVB2UXlZaXV5dWRHbUZEWTQ3UzRBZHZRNHhKcm1hMEdWL3AwMGl6MUFz?=
 =?utf-8?B?NjhkeGNLT2NFK2FzbXMvbnZWV05oSmVJWjBuV1M0RjdTdWxLZUZ4YlFUMEF5?=
 =?utf-8?B?eWR5SXBxRysvTTNRTDJScTcxMDVNWHZsdlRIQWt6R2VrZzd5QUdIaW9ucGR6?=
 =?utf-8?B?LzJETms3TSt0VFRwY203SXVyOXI3UmZWcmlpejk5dHgvTUg3WG5BeUx6RnZS?=
 =?utf-8?B?eGZmVnZiYUZValQvYzZ6ZVowcS9ZZUZZdjVZMDA5SUJqMlpLSHM4S0lNeGZ2?=
 =?utf-8?B?OERHbTkzVUl2MUM0NG5oVlM1a2R0UGtXK3UveldxZE9ydFJEa0p3WHBYQWNT?=
 =?utf-8?B?dGRPbi9LWStJMmdMZjJrbDREdWpaQ0JEVStEcWoweUt3ZXNlVFJtQk1oTFhv?=
 =?utf-8?B?bzZKQTl6YTFtcDNJa2FVNTNPVDZnS0FyUEMyOUR5L0FnVy8xTWFtaWF5TFlW?=
 =?utf-8?Q?rOUH76I5C196KG3PJT+PMV0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcc4550-c722-41ae-afa9-08d9e24a1c39
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 10:36:58.4572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWIReN3obQaoQJ20p2/0nSJsfgyWVwvAOdbZqFBAZwEt6F1LR6XRn9caXqdL93VqUlVDeriweVgpDhNe5JAWKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5418

On 28.01.2022 10:28, Durrant, Paul wrote:
> On 27/01/2022 14:47, Jan Beulich wrote:
>> @@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
>>       if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
>>           return 0;
>>   
>> -    group_id = ops->get_device_group_id(seg, bus, devfn);
>> +    group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);
>>   
>>       pcidevs_lock();
>>       for_each_pdev( d, pdev )
>>       {
>> -        if ( (pdev->seg != seg) ||
>> -             ((pdev->bus == bus) && (pdev->devfn == devfn)) )
>> +        unsigned int b = pdev->bus;
>> +        unsigned int df = pdev->devfn;
>> +
>> +        if ( (pdev->seg != seg) || ((b == bus) && (df == devfn)) )
>>               continue;
>>   
>> -        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
>> +        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (b << 8) | df) )
>>               continue;
>>   
>> -        sdev_id = ops->get_device_group_id(seg, pdev->bus, pdev->devfn);
>> +        sdev_id = iommu_call(ops, get_device_group_id, seg, b, df);
>>           if ( (sdev_id == group_id) && (i < max_sdevs) )
>>           {
>> -            bdf = 0;
>> -            bdf |= (pdev->bus & 0xff) << 16;
>> -            bdf |= (pdev->devfn & 0xff) << 8;
>> +            bdf = (b << 16) | (df << 8);
> 
> Don't we have a macro for this now? Probably best to start using it 
> whilst modifying the code.

We don't. And it would feel somewhat misleading to use PCI_BDF2(b, df) << 8
here. The situation is even worse imo: Besides there not being a macro, I
also cannot seem to find any documentation on this non-standard layout (BDF
shifted left by 8). Yet then again I also can't spot any caller of
xc_get_device_group() ...

> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks.

Jan


