Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BAD72E345
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 14:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548152.855938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93Oz-0002yK-39; Tue, 13 Jun 2023 12:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548152.855938; Tue, 13 Jun 2023 12:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93Oz-0002vG-01; Tue, 13 Jun 2023 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 548152;
 Tue, 13 Jun 2023 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q93Ox-0002vA-PG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 12:45:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f8bdb2a-09e8-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 14:45:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6846.eurprd04.prod.outlook.com (2603:10a6:803:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 12:45:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 12:45:30 +0000
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
X-Inumbo-ID: 2f8bdb2a-09e8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huhgTdSjP7ajmhL11JB6kaIv0hoWQ7q2KRjS62AI1WCghVxWli6Q/cUM8GpPtVTrc1I3rsIl0c8yA7xK7tFD7wzpvMHLsU6/ycf4JPeFOOTJPY0PJGnjfIQf1OEVzHTLXDgiKHP1coo045Mij9WfPlVVTUMKpPAjB4rvf7GfnEhB9r0FqM9SCyW9U2D5vTc1KKJ7TuqokTdBxkgRR4gHUVdqued6xIyY0hCQCJlfLKQL+RdOFnyD4dwpA3oLiDCG2QUy7zw7p0lyBCv92c8B8jp0upVj2/9BfLK+uGLopZL1e5m6d5jK7sIncjgx8iyvTUfAwh4q2rEfneu0tS5Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwPh9ozuKxsTkqXgll8Bs25n4xuoiBrH5vo5FKhInbk=;
 b=mtLpm8KZsyoT/zcnTtvdTG8yZvx5yreEIzZqOH4c7L882LUFOeiGn91T3TKzhlhdYLH1l6fjmKsHeOFrsC7g6tCVvK0oXd4i1lTiWzQi4s/DkbsKeV2NKlk6BodV9zH0e/aDBCLVxT1sBLzPomm0N8WmQUMffIJpS4CyYP9fyZ9gphU2W32IFrED4igyHyMdiJlOkvmi+dibNwt/QU6pUEpJC+VdNayBFt33Mw07x6aOJhL4RFLhqbzXwklcw6T6NlfHpPF3U4oK+NqDeZmZZ4ND9KT8VAFi3utjZUfB9/TDG4lSupmjiZyWbXtvL6reG3imORMddlOBV3YBiWxfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwPh9ozuKxsTkqXgll8Bs25n4xuoiBrH5vo5FKhInbk=;
 b=hrq+IbzndU5Q6vRKcWYQ4GVh9Jsxm+3uuqw2kceFwRptm8JbjHt0lPUG9613afkfdpWE4em50fnwX2L7O/rWugksiXy/fJXIPwW359B5RZUMlNRS4PnhP6IvYSnOBsFQFw6gS3nONHnJSvqAuxHiQ+o0aRkgALolZOPr9vgXHc6dHQZujhTgq5ioGIGKi4Y9LFHYeIvmPvbjHd5ktHVU9dbxLX35PuEjKi6405dFl5siMOImroznVIx1poAoFHx39W0V5e0X0iw76gpRDCerWyV8eW+mgfV69oQi02XLDxF4arrqHMvWMsHMFnYjfiGrg4je7hDdMNr2AufjA7gcvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ed59d4b-ce6e-9687-81cc-ffd456deec0e@suse.com>
Date: Tue, 13 Jun 2023 14:45:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] iommu/amd-vi: fix checking for Invalidate All support in
 amd_iommu_resume()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230613101313.51326-1-roger.pau@citrix.com>
 <1c8bf2cc-4c91-6db6-edf7-81472ee107ba@suse.com>
 <ZIhF5MmSY0oEVm5t@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZIhF5MmSY0oEVm5t@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ee07ff-a684-4e92-fa47-08db6c0c123a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W/H8igbV/ob+8yZ6fhXpIxaiiPZ9VJzMy6wYqUysib690MOYwg+lml0+acgDKXv88YVEiz9oGH1hoJAa4RnT/eczViJQcBWlsyiG0d6F9oqcBAqJLKqmjF7W0mWOhIrBLT6LJ9VTXIHHh1RIl0YTvOCz07mRETmmiO06UOQcDDbUJQHhykaDjsRd6isSnQzvpTyedFnb17Lt1SDs15L6fdXkP3Dn/rsIYFDm3CbtY9r3Jwrwt+jO4wT1la/LybPFM+Bcdp9UCilNW7VtHEOQdriU2zKpC2ApWFUMQE4wIMpDiC6V1cKDy0rWcjvpVMsSe05pUswGfN8odIb7ycUI+cx1cwKeGjhFn0FxaOcb50fkiMEQDVI28Bx7CATIprWv/diSV9N3kyIvxylQpT5F/4MjCrX+HeLXgxcPzGAt7dhR+g5/ypPLE3YSSjPXb947GDpSl7Pk1Y7mBYjQDtElTwWCfZ1xrnTJMhfIi+CKtwMjhr2RyDRQxXpRStyn8gFacPRh5QdVrh+CVb8a68Zq6YHB7+QKe5ZFdeOLVdFZQPdPkivAtagPYtUJXA2a862chSEMfP2zlo0RHJEYTp96knjTHfJ2TtPeGcVc442fMev7OlSU3PMcFfg6ZY7R5yHDx5KPLSlowNm5PT6aiiENBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36756003)(31696002)(2906002)(86362001)(31686004)(5660300002)(2616005)(186003)(83380400001)(53546011)(6506007)(6512007)(26005)(6486002)(66946007)(66556008)(478600001)(4326008)(316002)(38100700002)(66476007)(41300700001)(6916009)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVCbFBaS1kzbFhlM2ladUFPaW9kRmtvVEJnQjhuVUpvclk5QktaMm1uamR5?=
 =?utf-8?B?UGRRcHBiVW0yS2xsMTZXaSt1R1IvVi9nRVNpaUdTVmhPTDZpQ09keWI5NTQ4?=
 =?utf-8?B?K1ptbDE4V3BJMHNMOVhIOCs2RExiQzAzbkoraGpxQlhpSGkxY3l1V0VBWmp2?=
 =?utf-8?B?YU1ldkpMb0hFaVA2cDM2cDQ3cHZpRDh4QnlselhnN0kwYmwzdVJCTlhCOTZM?=
 =?utf-8?B?MEdHbTBGUVh5c1VKZEp0WWhjc3BmOEJqZVphZGlqLzZSSzFub1VHLy84cUVu?=
 =?utf-8?B?SjYyN3QvU0JSMWg2NkFYalNQT29zbXEyNFRRcnIzQWJEQWRsSEFmbyt0VExl?=
 =?utf-8?B?QmdIdHdqNmFxVzMvMGt4enIzNGZZNUxXeGZmckhPNFljT0sxWmFLVkJ1aWg0?=
 =?utf-8?B?WmI2U0pPT2ZDUHg5cVNVRXJTWHpYVUNKTEd5M0R4UnhqbmVHQzUxR3lieUtB?=
 =?utf-8?B?SnIwalF3b2lxdGg4d0RQMDNCMkZjM3NvZlhjUDhTbEczbG9PT2IwNjl5cjdh?=
 =?utf-8?B?WTFrRHNIOWFtamhIWTlNM21mZWR1U3JaeFFqQlJORVZxWjcrTStycmFGVDQ5?=
 =?utf-8?B?c0RuOXFrOVA1L29Nd0NVZkN3RU52UzRSYVZTNmRVT0pFNXVyKzVLMCt1VER4?=
 =?utf-8?B?MFVXNVpUTXRhWTdWc3NHeGZTaVFPdTdOa3MzV29PUmFsZis4bnpNOUpFMWxu?=
 =?utf-8?B?MDdpOTZxQ25MeE0rRGc0eFgzRW1ZbWhPbmpMYzNMR0VzWGQwdWlHWWRsZGpE?=
 =?utf-8?B?bCszVm5YR3hSaGdEcFJFMGJpMzFHNWh6ZnhLVWY2YzUxYkM3cVhUNDZJMVZp?=
 =?utf-8?B?NzlRVm5GV1JsNmY5RjBxa2loZXc4NE5CLy9qYTFuZHJQVElYZXVKUHlmMFhY?=
 =?utf-8?B?YndtVE1GZTVOcFJ3Qk5VYWtUOS9QQXRIbkh2THV0QS9oektFY0tCbDg5Vkl6?=
 =?utf-8?B?WkZpZGkxZnNWRmZrMWsxR0dTeFN4UkRta1pSQlM1dHZDYjlndm5FSVE3RGxF?=
 =?utf-8?B?OW5MY01DM2RqaHc0RG5lVXJkRFlldEZLRjRGTVdGejhGcEdmeFljeW40TVM5?=
 =?utf-8?B?RVdIa3gzcHNrS3l5QkZpbHBLYzc4UjJFbHByQjR3SDdWTWY3cXJJSS9VSnMy?=
 =?utf-8?B?T2l2NTVncllmN0g2ZGV0N2g2cTl5TkMzRnZoc2tEYWp6L2grYzVUTW9FV2FM?=
 =?utf-8?B?dUowUDhhL2d6VWZWdWpLd0FPUkRPNmFEL1l0MTh4Ykhvc3Mxd0FZckMvQVRP?=
 =?utf-8?B?Y1ZpbWhhRTlhcEEwVmdkVDNEVFB4c2xTaDBxZzl2UzZwZ0hSKytHUDh2Zlkx?=
 =?utf-8?B?S1hsdkRjZGxhL1NBNEdPOTZ2L0daQkhZZUdJQmFObkplc3dnaTJsZEROTHZR?=
 =?utf-8?B?eHQ5N09GckVkQmtaWGtKM3F4d052OElMVllRQUIrNlNzekVxTEJ1Y2NhcDJl?=
 =?utf-8?B?T0t5Nkg4S0E1N3NUQXdqc0dwMjI5ZzFlRFk3UVdXS2oyNVNrRlRwdUptanow?=
 =?utf-8?B?aVN3Z0xSY0V5YVRqa01DemZNa0JFanBjbEdoZGMwMXBUL1BHWEs3ckYrZ2ZY?=
 =?utf-8?B?eHBaeVpIQkIxOXY3L3lmazRuYzFESFB2NGh1ODdkSVBONG9iOWppU2VVQ0Za?=
 =?utf-8?B?bGZkUlp1K0IxdzBmYTJkZ3JCbW5UWnN3ZEpET3VFZHAwTS9oNUhYeCtlb2h5?=
 =?utf-8?B?ak1rOTBNaFNaam42NEd5dUNYaU9vUHJDWEw1RjhZc3BERlFoR1AxN1VHclMy?=
 =?utf-8?B?N2RQa3hPdmpCSTRONHV1Q0l3NzhWVTQ4dnpNUXFoc0xNcUNQeWZpTGZCaUw0?=
 =?utf-8?B?enRhU3h6STlrUFFONnRjZ1lwdUp6a2VmYklTRFcydW9ySHpYSitqUnNHRlZR?=
 =?utf-8?B?TjNwM0xGWTRwNXFpb0p3MUlRZGhyak1Vc0ZkcHFJTXdyeVVYcHVZbmt2QXRD?=
 =?utf-8?B?T1FKYVZocEJFclVpTldXS29xSjFlMW12dWI2cksydTdaTVdjcndlUkZiaWlM?=
 =?utf-8?B?c2FuaERHaUh4SnQ5SG1sYXM2QXV1NzlsSWdkYzNYK2p2eTFvc1JERklQY2lO?=
 =?utf-8?B?WktpU0NMWXF4UjVHd3NpTldjTEFBODhDRXU2b01Eb0VJZTlMT2loWkVmeS9Y?=
 =?utf-8?Q?Rt3aVZF9EPw1OObGfHg/jKoZ7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ee07ff-a684-4e92-fa47-08db6c0c123a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 12:45:30.5705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcTWYeXerYNnbIA1B6XP+NbWeP8SfO/sNxjVvEKfI6kAyLsj8qZw24mvx1Ho3lbOz6rATDIhpqAZE7FCI+Yyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846

On 13.06.2023 12:33, Roger Pau Monné wrote:
> On Tue, Jun 13, 2023 at 12:23:37PM +0200, Jan Beulich wrote:
>> On 13.06.2023 12:13, Roger Pau Monne wrote:
>>> Do not rely on iommu local variable pointing to a valid amd_iommu
>>
>> "Do not rely" sounds like we might, but we choose not to. But we may
>> not rely on this, as the pointer simply isn't valid to deref past
>> the loop. Hence perhaps better "We cannot rely ..." or even "The
>> iommu local variable does not point to ..."?
> 
> "Xen cannot rely ..." doesn't modify the sentence too much and could
> likely be adjusted at commit if you agree?
> 
> Otherwise your last suggestion would also be OK by me.

I used that latter one, as being more concise.

>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>> @@ -1580,6 +1580,7 @@ void cf_check amd_iommu_crash_shutdown(void)
>>>  void cf_check amd_iommu_resume(void)
>>>  {
>>>      struct amd_iommu *iommu;
>>> +    bool invalidate_all = true;
>>>  
>>>      for_each_amd_iommu ( iommu )
>>>      {
>>> @@ -1589,10 +1590,12 @@ void cf_check amd_iommu_resume(void)
>>>          */
>>>          disable_iommu(iommu);
>>>          enable_iommu(iommu);
>>> +        if ( !iommu->features.flds.ia_sup && invalidate_all )
>>
>> You don't really need the right hand part of the condition, do you?
>>
>> Preferably with the adjustments (which I'd be happy to do while
>> committing, as long as you agree)
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Wanted to avoid repeatedly setting `invalidate_all = false` if all the
> IOMMUs on the system don't support Invalidate All.
> 
> I don't have a strong opinion, my first (local) version didn't have
> the right hand side of the condition, but then I realized that setting
> this for every IOMMU on the system could be wasteful.

I've dropped that part: We don't care much about that tiny performance
difference here (and it's unclear whether the extra check actually is
a win or a loss), and imo the code is more clear with the simpler
conditional.

Jan

