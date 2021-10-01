Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18741E884
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 09:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200440.354962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDBr-0007NN-MG; Fri, 01 Oct 2021 07:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200440.354962; Fri, 01 Oct 2021 07:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDBr-0007LX-Ie; Fri, 01 Oct 2021 07:42:43 +0000
Received: by outflank-mailman (input) for mailman id 200440;
 Fri, 01 Oct 2021 07:42:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWDBq-0007LN-Qb
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 07:42:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27d40ad6-228b-11ec-bd96-12813bfff9fa;
 Fri, 01 Oct 2021 07:42:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-KYWTeJ7yOqS9wIYvo3mRKw-1; Fri, 01 Oct 2021 09:42:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Fri, 1 Oct
 2021 07:42:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 07:42:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0054.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Fri, 1 Oct 2021 07:42:37 +0000
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
X-Inumbo-ID: 27d40ad6-228b-11ec-bd96-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633074160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xP72K9E84/Z65IXSYyPcSwIPDNA9ioINlak2iyvKX0=;
	b=G6IGjjjciaBJ8EZIqE589nR1oJWCjsrH5OjbZdcoOyywAlATybbHZAGK/8ZL3a49+LbTV8
	hrnGS/R8Mee5h0rNWKEG3ZirFkOI6XFKwycTMIT02glnMCQ2u6/AAfUg3CMKhqvZf0dseQ
	kmXcppS18IDJY/QEZ6wkvj1UVlBAT8g=
X-MC-Unique: KYWTeJ7yOqS9wIYvo3mRKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQj6RKQd+2rt/1QxpyDmQNuMwPgKyZryUbMb37i9HlEBsROS4rdAsSiXDcChFz714jqltd4f79AXtjVADTV/8AeGBAc+kKlFL9graDArayzDRnXVUSbh6Zi0AHzui3FvY6i4rcmqDsXPRMG9bQJNTyG4lrL6tiUSd/Uz7FbveEP/VjO2LaegqkW7xiW8qjegDrtzT2L+M3h7ufZOK7/In3gPvXCK1ykmiJqxxLenDEwUhCJjLv1UvfUul5kIPKx51mfdKfPh53BriQdh0WHzN/g9X0xGNOrBE7zMUXIm6xoomFaBLhDfboqzAuEIOcVkqN60kMZOihpy8HJYnSnHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xP72K9E84/Z65IXSYyPcSwIPDNA9ioINlak2iyvKX0=;
 b=LEf0rf1kFZ1VpT9H1o7W/QSd4hoESPxSTkktWphvdGe/KD92dR9SeYUcdGMOxogBQXG6JIQgWQdT0blX9AXihFTIG205+I0PGndZHqYmCLI25S8lTMBqxpQell4VojfMsy6WlBI9xC9lU1rjEFryWhM76TEED/o8XNWke46ApNOay4U30DOnioCiysziLs/jnKSWDLoYus6OcKt/4Pwl9luLy8m/juqWRoB/JANNuE9AWZw5DgRrooUu2wEq1T73tTsjLvucS2zU7eV6Xicb6tkmdy+n3vO+gAKxBllI9JqjbAaJIrgwciU2i6IPyFgILOsVq2Ymt1FuFSPXexVD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
 <68a608f5-4159-5734-4c08-5a70ae9d3ff4@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <062c2801-26be-ef3b-71d1-70c598705b94@suse.com>
Date: Fri, 1 Oct 2021 09:42:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <68a608f5-4159-5734-4c08-5a70ae9d3ff4@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6b8f60-c4f0-4aa8-c7cb-08d984af0a67
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23365437AFBD560FD469A24BB3AB9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7esy1Mei2J7/7FcEQfhCn8GwQ7fcflKCzA1Lp126eozPAQyAQdLusDx2uN36IX2F0WWImDjmyPweZJtUdnNnwZegtDDL8ld6HSJhbLFjB977vFpqI5ydS1uj+vksALjxSyvWc+nQQLcdii6H3oSp4XC8HaBAkN9u0wL8LmsYkE6MXcgmYqbA5g/6+6RJWayQ08PAb3Z6/V5xNBGhbveExzNnf4tCQFy8HMoyBGmIUZzfRzMdstG38KuX1j1iZOYRqUB29Qmhv4MsfmpjPy6nbZgsIGMtCqrfqv+gfGU0hNM5S3vZae6+xWb8Y6kTt5pkd/BlKzTejxj1hgJf0xBbkc65vzauIAPW2hh8lveH7RObrhOCFG5rtmUl72nRpNYXANEWuKnI2Rgtbhn086RQGagdpbgdpluh2OK+l0OIATIWe3yfYpLqcIswCwnCjmY5uMfuJZoYYfxLgheodrT8VDssqJQEf1TccPh4p5ff85dNPTlyJkTmNrzDJfSGc3QkagYWvri/nF5yBbQcrYXsa7dvlxfZjeMmkOHBXw6bvVUIXd9WY6uy3c21Ey5ViZIr10DXaTevmvjuMh2ayWKPh07ZWGGYXpax65laMoqXuDLiqCGJ8B8o/pqqtgeIYQ1I1C8tSq33ksn/6lsp2GoXaeOYS7+aLu4igmax5eh6ql69pj4Dfkq65lxsag/dyNw7J1QQ+YV+IzP+ifvNJ0TfHAN2cVxb9JswOweP9EjALvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(956004)(2906002)(4326008)(2616005)(7416002)(16576012)(83380400001)(36756003)(8676002)(8936002)(53546011)(86362001)(38100700002)(508600001)(5660300002)(6916009)(6486002)(66946007)(31686004)(26005)(186003)(31696002)(66476007)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRweU4yUTQvZ1VsUFhIUVlaMVFqVXgrcGMxa2s0RnEwdDJRN1FMcG9BbHFh?=
 =?utf-8?B?Z0FpcFpGcHlVZEhPdHU4SXRRZUg4YVlOTis4cW5IcmxZaE1seFYxQXRrYVg1?=
 =?utf-8?B?K0hnTEhVQm44S1Fqbmw1WVZSRktKOS96dXo2LzlabTJtaVBtZlFtcG4xcTZ4?=
 =?utf-8?B?dzVabnIwdG9DZ1JwUkRMVzdvT2hKQ0V6aXZtRkYwaFR2ci9ZUkFuYUJYc216?=
 =?utf-8?B?MHM2bk1WT240YXJhbEl0UDVFbWUxelV5ejdIdUFCazNxQ3UvL1VQVzdVUmZs?=
 =?utf-8?B?bDcwSkk0YmpNTEdsWWdPYzZWbnErQW01elI4VUk5NkF3YXNMU3dkaDdTOVdK?=
 =?utf-8?B?TFdCaFEvLy9leEk0Q0x4YjQ1RC9kV3h5ZkZKcHVnMlExdjgrSUs2cnVWUDFJ?=
 =?utf-8?B?ZlFWdEdQMW11dGJMQjRQcTR4NTB0UVNVK2pSQUpBQlMzdFg2cTZWK3VLd1pF?=
 =?utf-8?B?ZXZKbUdhTGliaGI5d0pnOWVyTWdubVBmYUVRMWhRb0RNdVpIRVlYQ2FQMUFy?=
 =?utf-8?B?SUthcnlaNzU4SE1oN29SRXJkaVhrM1Y2dEYzQ3JIbEtBb2ZJcUxhaXNXbkNh?=
 =?utf-8?B?YW1KZnVQakNlTzBUdU1OeGZyZ0dMZXpnVGZ5c0NOV250THovdm1jci9nd2gw?=
 =?utf-8?B?U3V1WEdlOE1OdzJoK0NIbVZvdS9XVGxVcXYva1NVWEI1OW5YTlVsMElqUE5o?=
 =?utf-8?B?NytYTlRxLzRDUEFVeXZKQ3NXU2I3bXZNSTVKemNsZjdqYzRCWjVVQ0U1WENq?=
 =?utf-8?B?R3o5NDY0cUYrakpnU1RXb1ZCd09ZQms4anlGaUJlMUV1N0EzQ2dLWkxGVFhG?=
 =?utf-8?B?OFVOYzZNbEdCSkJMODZxdUZObWprT21wTFh2enpCb29yVndxVzI1NmQ0MUlC?=
 =?utf-8?B?VDFjTHZyQTU2NVc4NTQxYjFsRlFCR3dJYVk3NHlVTWQxcUI3Smdha21LODBP?=
 =?utf-8?B?a1NZTEVUSEtIL3hXbzdVaWNXN2t6MXJSMmpHdU9EN242MzRBUDU1Z3RaMmpB?=
 =?utf-8?B?dFdzOE8vaTNuMUJ6T2pZaTA4U2ZLTGlPMEdoaTlSa2VvbDIyWjZ0R09Gc29w?=
 =?utf-8?B?UkxZa1hYYmlTKzJlV0QyQ1krK0NpTUxFelNmQnNGOU4yUXRZZEd5Y2RNcDRG?=
 =?utf-8?B?NDVRekJWVURhWkVtUXd5VkNEQjNOWTdvWkdWTFlCQ0E5aG1qNUQ5RkdJRHU3?=
 =?utf-8?B?SmNRVXNHNU0wUWEvTlE5RXJibWd0N0l0ODNiSXZJeDdPV2xOR1Z1SVM0M05m?=
 =?utf-8?B?ZkEvUzhVNWQzVzhNaG40V2xWbGhkcGNoNHFXaDJlM3JnQUJzQjYyQmJNVEha?=
 =?utf-8?B?MDhvd3MxWThNV0pJbnZlWUNVcDBHQWlCWnFoVjlzNk5lK1l5NnNnUjRrMkpq?=
 =?utf-8?B?bUovY21DMis3RGFObWVtWDF1TXZNdm01KzQ0d3BsVDAySFNkTDhSSUpoekJn?=
 =?utf-8?B?aE9FcklJM0FueUcwcXlkemtQWjhubmNMVExIZlNvbGxKV2F2MEhhd0dCbWcz?=
 =?utf-8?B?QlNxZXp0Y1BJbHFTYmE2M3lyTU9HeWJVQnNaSlFISjZwMXpQWGhZZWMzNmhM?=
 =?utf-8?B?Vm5nbkZUYzdZNHpQcG9mb2ZRWlAzMnZOejdXYVlIWUtlc3I2dVIrQ3FKOUNr?=
 =?utf-8?B?dW5xSlJaU291endyaWJDWWdFOTlIcE5Zb0FBSnBQY1NYOFNGVWZva2FxVTQr?=
 =?utf-8?B?b0ZIdVRBQ0hWZStLM2oyTDZHYjYyVjhLQ2xhTVIvblFYOXpaNC9YQzdjekhs?=
 =?utf-8?Q?M/B0rppbwkivJcS4DT24mj00GWyWm0XtMjoiupa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b8f60-c4f0-4aa8-c7cb-08d984af0a67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 07:42:37.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDBS84pjfT8e8SLOQh8ebe80vTAITjy5JWJcGm++MYWT8Uj9Zw8iX0bvgtEybd/ewFeBGnvjqrfEGcm2J8z5Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 30.09.2021 18:57, Oleksandr Andrushchenko wrote:
> [snip]
> 
>>> +    bool found = false;
>>> +
>>> +    pcidevs_lock();
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +    {
>>> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
>>> +        {
>>> +            /* Replace virtual SBDF with the physical one. */
>>> +            *sbdf = vdev->pdev->sbdf;
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +    pcidevs_unlock();
>> As per the comments on the earlier patch, locking as well as placement
>> may need reconsidering.
> I was thinking about the locking happening here.
> So, there are 4 sources where we need to manipulate d->vdev_list:
> 1. XEN_DOMCTL_assign_device
> 2. XEN_DOMCTL_test_assign_device
> 3. XEN_DOMCTL_deassign_device
> 4. MMIO handlers
> 5. Do I miss others?
> 
> The first three already use pcidevs_{lock|unlock} and there it seems
> to be ok as those get called when PCI devices are discovered by Dom0
> and during guest domain creation. So, this is assumed not to happen
> frequently and can be accepted wrt global locking.
> 
> What is more important is the fourth case, where in order to redirect
> configuration space access from virtual SBDF to physical SBDF we need
> to traverse the d->vdev_list each time the guest accesses PCI configuration
> space. This means that with each such access we take a BIG PCI lock...
> 
> That being said, I think that we may want having a dedicated per-domain
> lock for d->vdev_list handling, e.g. d->vdev_lock.
> At the same time we may also consider that even for guests it is acceptable
> to use pcidevs_{lock|unlock} as this will not affect PCI memory space access
> and only has influence during device setup.
> 
> I would love to hear your opinion on this

I've voiced my opinion already: Using the global lock really is an
abuse, which would require good justification. Hence unless there's
anything speaking against a per-domain lock, that's imo the only
suitable route to go. Nesting rules with the global lock may want
explicitly spelling out.

Jan


