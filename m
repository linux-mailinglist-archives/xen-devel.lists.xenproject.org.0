Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7175593B4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 08:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355277.582853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4d52-0000ed-O8; Fri, 24 Jun 2022 06:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355277.582853; Fri, 24 Jun 2022 06:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4d52-0000dG-JV; Fri, 24 Jun 2022 06:46:12 +0000
Received: by outflank-mailman (input) for mailman id 355277;
 Fri, 24 Jun 2022 06:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tt/v=W7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4d50-0000cJ-F5
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 06:46:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517f1938-f389-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 08:46:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 06:46:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 06:46:02 +0000
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
X-Inumbo-ID: 517f1938-f389-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8Mj9VMISWfAtQoqGfW002w7ULaSqIRbGkTCtLSDHbftVNWShqEHCniDEGpkr5TOApYegtttguErv9I24ZjhJkcSHXnu9KOPCVN9Ep1lubmbQKdyTRXYYiGlO7oagipMeYunUsKpaqLbafaRJnFnlxzqvs/Io+mluYiQf77xDCDwviAnc0EPH57+ed9q6N4TrYdjQspG4H35Sn8Q6NgWRMabqftDETAALtAlLBuBX4FyfzoJaS7Qwdhg9QVRRQQZeknS5Kx4y5mZLFMAKYbE36TnXhWTcx6GFSToAHZQ5O7xDwapB28txavVKKjhhHLHbJwrxE6ZWZBZ5sPFBMfGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQDrSFZylcM5YAFa8zNM1v4ZA0XXyJhh/B28gevNPj0=;
 b=TDMCy9Xl7ie8wP083yBTl32G9ZAoInqqpY1ngdoq7oIHl0gP/Huca91kk+B4q2pKsHokrv2M3pVQw07T60DM7dou1QIyq4Oe5WM1DC8+ZGiG9Yiw4nhuthGrcBgRpCKAxFw7BTJldE3dZrOxpk6Rz19eWhG+tndQlY9qiifPXOAQAZHSwn+gegjAJduLPNgX9RpkG7dCA0QJr5nM7e9qb0mwbn0ixClq8H/gLnptLUU8zpX1O4ZG665njF1eucTGOQEd8j8JSUSw4WYoWa2j3vgVuNKBGq3v/reTSuOPipuG/9xJYBdxHVoiBHvbwR4BSw4XVYV3R7BeH1gcV9XOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQDrSFZylcM5YAFa8zNM1v4ZA0XXyJhh/B28gevNPj0=;
 b=5oTSDSz+0G22X6Eu24Ryh/pxtpS39IeWyHH+RIELYiA0hJ6UijtaazpUo+AlUXiqAvrbBisLT9dJnkISdFAWFQCgAHAe9S7UqQNeFucOKI+oB8VReh0IKm+g1JXXe8l9xxX/oJ1VDC3KKifmf/0geOxRGoQ6NJBJimeHB4ri0cwswswBfExCPowm1wdNzxuf+EbsSStRSO1/nngQ99L7PwnVHCp1HMco6NpYfxg/+LtuAY9YZbgP7TnhCxUn8kKt1k0henmRpLguHEMK3LYGEJCsZrksQ6g1VRcR8/PGeN76Odh3qQK6C6jDLvVL+XtVGKsygyzfmS31MwZWyS3VtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15da3838-aa8e-57c3-b9e2-6c0a4a639fb0@suse.com>
Date: Fri, 24 Jun 2022 08:45:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7390f00-f8af-4eaa-0bdf-08da55ad344e
X-MS-TrafficTypeDiagnostic: PA4PR04MB9638:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GLj38xEMik1KfXZYa9oPT/hT9yQeKkh0QQBXlHO4TsHvgVh21cPMZ9h8QuPeUbpJ1bDN17OqRi9tqw5KZk/AZS2qwnFBEd/UeJlcO4xOJ1X9GWzQVvsZ6KVWEZeUtynrgeUOl14pLg1NWxjGiCSEII+AS7ZSv/eCZW1wvxoN2/1VACpVVz5o4cdkhEmqOMS3szOEYuMwfT2qThE0LB1FqtkiOYlaRbQ3xaUcvZwjt4bm55TIuXfqIIzfwAb0EeWff19MQ7+CCh4G+8GpaTVu9SINy5djaj6R7iwYSEOiSzZ2QBz0S74DQUbdcK0nN632zNas2FOa0n3GeUoZgCROhVau0O1s2zvRL4y/dff9GetDhDlH0gDzftKsW+4iceoaILmgiRtH+KUYgPg+xS2vCp4yUiBWfLmDBCweTNf21+bqZvYn/GtYoY6enQlEzlD+oNHpMvUTNx3B4yJarFTNlUDepoyYK8xmVk/FRj+WgpNhosng9c7zAwJsifuVxU+W+RPtUPj/m+T9kTBRUD5HJmJBj9lTOb5EcelH4hCX35lpt3Tv3+ZVjoj3n3fSqG4DpzlmBGz8cIlPugSF42UChIa6v5KFdU63O5yE2J27XlCVd4QgFa6DTugiMIm6ZxVhYRNs3kwQpbfYFT6/mYvrLNtUMCnNNNksUZu6/TJCNKEbg1GVX6F26h5YfDYrUEozISXVhE5DpFrgqIYGeNQyLmhXrO14N9/lknz9/LCiSWQ075RgSrtEksOZ8n0h1FhfMz991OrD11NCx3JPJaXm13sTE26G8PKxYLnjcxMExn1Q9fJT5QlQR8BLoxAvfO7BdsSI/3Bx4TVaf3ZU94VCGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39860400002)(6512007)(186003)(41300700001)(2616005)(53546011)(26005)(6486002)(478600001)(6506007)(2906002)(38100700002)(5660300002)(8936002)(31696002)(6666004)(86362001)(66556008)(66946007)(36756003)(316002)(54906003)(8676002)(31686004)(7416002)(83380400001)(110136005)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERRSUdkaDRaMTlOeGR4cS9XQ3I3SnBmQTlvRzJEVDFQVktWZlpZSWltbmlo?=
 =?utf-8?B?NWRyN1NEeFhDT1A3dFdUY1BKWVBwWHB4RkU1UlJSMFI1cTJoUWhDT2l6c3Va?=
 =?utf-8?B?Vk5CSE1mbnFLVTNzYy8wUkdjenhkSEk4Nzlpdm0zM0RRUFhBUWxiVlJOTTlG?=
 =?utf-8?B?NWMrd0dxNlpoZEN5Q2FZaWxJTFl6K2R2ekU2c0U1Wi8zQXZuVjVjNE9NcCtQ?=
 =?utf-8?B?aitLVHlyRG4xNzJ1ZjBnZEQzOTZ0NTM4cXdYa21mU3craC9WYUU2QjkzVFVm?=
 =?utf-8?B?NTE3YXI2d2ZraHdZRzdEWld4NDJsNE42aDErUTQyOVJTUW9ZRDYzaFJxbmFL?=
 =?utf-8?B?Nk9jN3dXdXJWUnJ4UStYeWdONnJOR1FrUVhGaEtheXdBVncveHpQejN6ZFht?=
 =?utf-8?B?Wklva3Z5ekJVWjNjdjQ3VDV4YVNldTNSZ2pFVG1CVW9HZFVPZmp1YVgwY0VY?=
 =?utf-8?B?ZUdNcGU0VW1aNG5Pc01lVlNpazRKSk1SelNKTHowcW1IUG5ZdGNDbkUxM1Bh?=
 =?utf-8?B?YjYzQXdvMGoxTWhWTUhCMVozWUJQa3NLeW83bTc0K0ViTjgyVkJCdkxGVzk5?=
 =?utf-8?B?Z3pDbUl6dDFMelVKWG83UEE4c3BjMlBYQWFJdjhXNGFvUHJIajYzbnhHaVAx?=
 =?utf-8?B?dEpwUWM0SHNsZWI2STcxTGM2bTlvcGFaVmVrYkxvbjJ1aXYwZjBITXpiZEt2?=
 =?utf-8?B?dUhVZWZnRWJKSXUraFRSN1NiV0ZPbm1JeTkraTVUMkV6Q3JTd0htOTdVNzdm?=
 =?utf-8?B?L2VtMll4SnNLOThxNWtxVVFIMHY5c2VXSlhJeVRWRUVXOUFoUnA5M3JHTUJy?=
 =?utf-8?B?VG9MNnlQMXFpdjduSjhMS3NITjRtZ0wwVEtSOU96c0VnS1BNOFk1dEIrN3Ft?=
 =?utf-8?B?Qy9mdGszeW5EN1JlTCszUFdGeFNVT044TldKYjRZbmlQLzBYQUcyNG1WYnEx?=
 =?utf-8?B?S0tGck5xSU1SbWpTajVFSUNzb0pWWEQvK2dxU1dCZUxYN0gyR2tDV0FTNFhx?=
 =?utf-8?B?WXBTWUNISHBUeU5TTFJtUzdqQlBMOFN2N1BiN2k1ZXV0cUxXT0VoL0VUODk4?=
 =?utf-8?B?eUdIOGxYWGk0cVdiZnNaeXJlQjdablJvRlpUL1JzL05uNjBnTmxCTyttTGV0?=
 =?utf-8?B?OFhtaGNOdXZrc1ZWOU1McjMySytvS2srdDdpWmtrM1laLzBRWG5tZk5UY282?=
 =?utf-8?B?dGwrQ01tdTZkOEdwZnd0VFkwektyU0lGWlM5cjdNWWszelMyeXZpTGI2cGt3?=
 =?utf-8?B?QTJmNnF4RVN5Q2NpM0JXOWZqNU9FS1FCd2YrVmtPYWZEK2NYSVFOTnRMUEZZ?=
 =?utf-8?B?dmViM1dxVU1kNEJrNEhaRUE4K0UvRnRlWlZBYzZDOGovTStUWlJyOW55Qkgz?=
 =?utf-8?B?b0REK1h4N0xtZmh0aUw0NWp1Tkt6Undzc0RDMWx0ZWFjVCsxUHVIb0NOaW5C?=
 =?utf-8?B?Nk1BWWhKdEVIMmx2d3A1K2M4OWxudjRGK1ZZQmdWdGRNVzNrbWp5SjN2SWVv?=
 =?utf-8?B?eFNtYTJEd2pCNlZTMGhKY3V0dGtNZUxSNkFmL3ZPdG9GVTVtZ2ZiUy93dHNq?=
 =?utf-8?B?bFBXaVpKMFVpWmUwTC9wbU5NckJpRGU4UDZBc09aSllacllXWGdmdE05aVh5?=
 =?utf-8?B?a2QzeXFxQWl5c0JoL0NpWVFtOTkrT042bUIyYVdLTGI5b1EwZGUxRW5iOXQx?=
 =?utf-8?B?eGpiSHBFYjR2Zkk4TEdaOXNVdGpUQmE5TTk5ZnhMYy9xMXBxZ3RWbkRqUGRH?=
 =?utf-8?B?eWR4MjNkd0VOb2Z5U2lmV1Q5OWtHK1F5ZGlIeURQWngrSHBLMndrOUpjcm1Z?=
 =?utf-8?B?RFMxbnlISFNzVG52Tm1DdDF6dCs3NURRUjZNcDQvRUdmNUloMGFHOUtvYUdQ?=
 =?utf-8?B?cnY1bmFuc0xRd3B3WlBLNTZIWUlLVExxSmwya3BHTzlKUis2d3dmdkVFUGxF?=
 =?utf-8?B?Mk5WMCszM0RMdnpUM3hVUmt3c2ZwZm45Vi93OUNERS9KQnFlVVhvWjd2OWZt?=
 =?utf-8?B?ZFRVZktBVEFmV0dSRThSSThOZ0NDbytOTmxDbXYxaytIdFBQQ1pzRGg4Y0RF?=
 =?utf-8?B?YWxnUTRwUHJVWkRYWWowcS9wVzY0NWJZenBiVzN0ZXZRRHpnd1QwZkJUc0Qz?=
 =?utf-8?Q?Eoj3cmREjED0riPZI1hsFDbfv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7390f00-f8af-4eaa-0bdf-08da55ad344e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 06:46:02.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMfipBHIvtT9HmfC/sOjPPJMNZ/U0cZPpd8pzFOfm0xDW426kkmLiEEZefXKPzPZze8pCTYF2zl4PIpvofWiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638

On 23.06.2022 19:50, Julien Grall wrote:
> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>>       }
>>   
>>       /* Map at new location. */
>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> 
>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
> 
> I would expand the comment above to explain why you need a different 
> path for xenheap mapped as RAM. AFAICT, this is because we need to call 
> page_set_xenheap_gfn().
> 
>> +    else
>> +    {
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        p2m_write_lock(p2m);
>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
> 
> Sorry to only notice it now. This check will also change the behavior 
> for XENMAPSPACE_shared_info. Now, we are only allowed to map the shared 
> info once.
> 
> I believe this is fine because AFAICT x86 already prevents it. But this 
> is probably something that ought to be explained in the already long 
> commit message.

If by "prevent" you mean x86 unmaps the page from its earlier GFN, then
yes. But this means that Arm would better follow that model instead of
returning -EBUSY in this case. Just think of kexec-ing or a boot loader
wanting to map shared info or grant table: There wouldn't necessarily
be an explicit unmap.

Jan

