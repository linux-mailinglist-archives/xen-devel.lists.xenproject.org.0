Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A313E5FECB9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422744.668983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIGn-00031G-Sm; Fri, 14 Oct 2022 10:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422744.668983; Fri, 14 Oct 2022 10:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIGn-0002yB-PY; Fri, 14 Oct 2022 10:50:25 +0000
Received: by outflank-mailman (input) for mailman id 422744;
 Fri, 14 Oct 2022 10:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojIGm-0002y5-3m
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:50:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00a0c6cc-4bae-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:50:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7644.eurprd04.prod.outlook.com (2603:10a6:10:20c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:50:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:50:20 +0000
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
X-Inumbo-ID: 00a0c6cc-4bae-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZH+BpDGJw6WX4J+SV5OXvjWR6ZicvuCvJ8pxStYMc9hxFpLFolusykdee+1fMO6SB8/Fvu91EfjxEIfHIkdHZVgWexquhWQBfCH9eEZRiGkNtobwQ9O/6NXNaHDI8pNUuO5RzD/GO22szZzPVguGDZlmOZl+DrBCURdAvbmHRTcDWQkITPRuQDN1O31gxQUyxYSgs99mzNDGw1djRfm1Pa2S2RLeFJqfEY+mljrF+MoYBYWgMXl4Y+cm+HEGuzvnr1msWLwOsmAazH/bKVOZtg3b5qFPKyJqqZHP417RQNCc5tv6SuXZHa90DWI289wrO/Ci8KRhAqAOOLhtPQu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv0yEyOILgtKWPOKreoq0TNzXam1SklXEY/x6lVR8mU=;
 b=GYXYEfjNYVtYaPeqgZmVR8xlZ1stUnEJV+AMfDYfdKEsuo1+OZV7FovY3l2iLUZqrbf56vWWaA4cV0jE0IYbFg7GsRB1ZAsC6XERw7WFrCDuSTBEwo7Z2f9NTrU92+od7T/0AQiIAQ1Ovle8b4ysB7AnDmPHS6mGLnO53MXcfS6AOjMzDHFRh0rMsS8QvBHishIyRyH1PYaybmVfrfqwnzUzK7xt7PkLZZKnRWl/b0KWLYBhAlfVj+pm27KoFphqzAZBd/NtnTEx16exbPK81mYSkW9kiKD2pCilYCYalMdR8/7tK3sCa1+gsnrRx+X/uYKpSaMr8WGffpfl72QJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv0yEyOILgtKWPOKreoq0TNzXam1SklXEY/x6lVR8mU=;
 b=WatwEWLOwuimyC0Q1/osgL+fsKIq6N9ctGaqd93FHeuO2Sr2Q7Z3xg6MuvBIpoo5NvRvhAfFRa5QxEc5isa/5Ht8yjF5YkmnMk/m1PsAOFxlX1fZkhbQXuUuoh1PJfLfUSm1YJ5eEBnlOWZtDRUyHBz2aJnfXqrC1Do1KEMWDkKOfrL2rDdfmor3eTjrLy9kCOhDY20yBWnpUQSLGxhJ1PHdDq6hneTg7/d7lyGsjs0A6ZGn9XT04C0wKhKxzyYa6KSnsOBTotFBCCtKodbHkdQoZ0KH5XZldCBa0gxGzN48GJZTIuShG/y7uYSBcyywgNC2amPgO4yPSTvJMRf8jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e0c6a59-0d78-d926-3928-ea06f0120bbe@suse.com>
Date: Fri, 14 Oct 2022 12:50:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
 <Y0k6RSI0VJhTVmEi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0k6RSI0VJhTVmEi@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0050.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad5a60b-2823-42b6-16ff-08daadd1e3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q7t0HsrXFpZA0Zl2szBasM8z7bBpTOuN1hLV7WNWPcl1WoCjdEGlJHyIqgad7xepmjfeWcH8OlWHP6S3xqm96ux2cj2QIUTJmIL+84m7S88fBS3jj7dCmwnCH83U95pQYqUgBujAnVS9xyMo8rudNSFjX2wv8IvX/yyQBMoqWM4rZzjNAo6PMdUZuj3jf14Wr8y9DHUk1JDFS0NJP7O0Imp/Ya6NlkDtNtFBGT9++RXh+U3cvppyRpb5K0AQ6kbJTxpZ0hbFVTBSBn19tFC8uNwfezEc/0+GWGHTylLgB285fX0mQgjGv0mU+ok0gLRa70mDwJ2BLPwbPaulhV8C4qi9vgQUFK49ceR1oOKKl6BUUkvvrFRSnYkpUWrkOoj4BAfW4hwCqOCtindv6gBYH45w/SfqK5HMxcC1ea9brsKHDPvpX9LYxa6AxkWGiEHoFCoDiHCFsP4Vh34zWSQRbYS/BHhkFqXmXNycpRC3FSdxTWiClncLCIp5HMKWjTURZQuoaAjP55sYAC6LgKkw5r1cN4eSr9yX6vHyFRjUcx2r//cucZqYsIbjr7ZjRvKzxaDOpi9v9NaJ6hSaFo+DKArWt1h6riqzSO7mXfEAo5+v5G953Z0qUFDgS2F2JPkuKpMXKptnDMJMH0ugMCVbRUeGeJ0o0eKuZKy136HeHj7PPipfoQv5qHI9zChtOKvX39TLUVZbvIQNPGMrZ+5+y6COFlNMWvB/0xeSZiSt+219Tdrzmwj2q3gr3x82dI7NwkMZ6KFwQ9kdri9J+ToOGzInEZLqqfcXMW9ZvmcX2I8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(36756003)(2616005)(4326008)(53546011)(2906002)(6512007)(86362001)(66476007)(316002)(8936002)(26005)(6916009)(54906003)(186003)(31696002)(66556008)(8676002)(66946007)(6506007)(5660300002)(478600001)(38100700002)(6486002)(31686004)(41300700001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGl3czNwMDJjcnMwTFpROUdUQWdsMW1jYTRiZm5KRDJYZTFTU0FQbk8vVVpN?=
 =?utf-8?B?VzBQNjhiVlhCSUNob29XRENQOHZxZWVwdzNzVVRmelFlRDVxWE5kdkdKUWF0?=
 =?utf-8?B?eDhjakV2bnNsQmtJYVFzaEFBMzVpanNySEFydzY5Y1dTbjJjendYRUwwRHBW?=
 =?utf-8?B?US9xVXVGNVcrL09ibWZ0Z1NHVTA5U2xZR1RMMDBHZFZlRWpQTXlYSXEwNnJW?=
 =?utf-8?B?RG9XNWdZU3EwUmtIaHl5WUtaUDJlMnUxNHhaUHRva1BOTTlmbFlRRUMyc3pR?=
 =?utf-8?B?K1pHUzNRM1FmOFB0alpRdFBMWTV0RVRGV2ZOM01BQlp3STFqalZVNU5VdTQy?=
 =?utf-8?B?dHN5OTNHMHRrVVAweEJudHQ0ckY4eFFZM1ZSa01hWHJCYkhkckluYjRBeFJX?=
 =?utf-8?B?U1djb2lyK0lhUUlid2dqblM5TkZmUVJKbUh0dkE3ZTRNK1VpTXRzbUh3bkRY?=
 =?utf-8?B?VHYxYzl0OXRxMklCT2ZUQm5SSlVKMUxXRFpkNVpIUjRUcWZJUnVVVjFJb0JI?=
 =?utf-8?B?d3ViYWJpSllIYzArVkg1eUQzNlpFdHcySFlkVEFLL0pMNHFYby9jN0hkRkhF?=
 =?utf-8?B?aWs3VTg3OExZa3ZYQ2VjK1FDcjg4SlI4NGFtc2lWT01rOVdYQm95TzVucmZY?=
 =?utf-8?B?N1FLNG42MjBZSi9PaHZMY2t6dHdlMHhIdnh4Ty9yK3R2UVczNTBHWm9KTkZ5?=
 =?utf-8?B?TDJLSXRGMWRTalVTeXUvY25lbnltNzhDaUdHWlI2enJFRGpsTFl6d0w0RC9M?=
 =?utf-8?B?ZmF0N3dpQzk2RHZRNHdhUVN3MUhEcVU2dVRFbStNT2NseG4wc1JTd1F2ZVVN?=
 =?utf-8?B?ZzBvU0RPOHU0R0M1Q0hTSEN0YlF6bWJVcTNCUmp3WXdpOFVNQkE4RHkvUzdQ?=
 =?utf-8?B?QlZvcElzQ0JPTVhpb2NPUXFBTUo0UWcwajcrSUdkRUk3L3ZDNU1mVlVTMWRi?=
 =?utf-8?B?eUNtSi9SUzRGNzRVQ3Z6dUhsOHhmWGxnLzVuUlZVTHNXc2h4VWpaMTY3TCti?=
 =?utf-8?B?QnlEUk9NVWhkekpMekVNcjNjdkxLMDJCczlhV29ad0pzV2hrbFhhcHMyTHpT?=
 =?utf-8?B?dGVqcm9EYllib3d2QlA3emZLbUpJYUFIZkRySnFkQkRHQ2E1UWd0K0UvTW9Q?=
 =?utf-8?B?WkU5ZGE5b2dHaFcxQUozQXk3d3pKOFo0bHRLckZOaHRZaTdrSDJ2aklBVGRy?=
 =?utf-8?B?V0NXcVRNWjF1d1dlcjJVdC9RQmNZdWJNY1JYckZyS1ZYc2N4Sm10cnZ2bnlY?=
 =?utf-8?B?RndPbU1CU3FQTEQrdk5rc2JRTG9rajhmS3JGUDZzV3RJMEt2ZktLWWpmWS91?=
 =?utf-8?B?d255ZU9NeEI2dUsyck5keDdQSWkzNERtRFBETkVkTm5yR3lDbjZKcTNlZGF6?=
 =?utf-8?B?Z2U5a2ZZMGErbU9ETW5janFWa3RGZHlpNDRXbVM0YjhOUzNQazBKY2pTYkhG?=
 =?utf-8?B?c3VEOFRVWXlldGpUM1hrQU1tTkNMcU5DUnhjTTBPVFljdXNCd0lYTkJSa2li?=
 =?utf-8?B?RVE4R3R3YUlaY3JRYzZWN3JWQkZka1Biam5SWndudWxvOTZXWkZvbW42bUhN?=
 =?utf-8?B?aU5hMVhXb25yN0loamZZeUJsRWpWSjQ5QVFKTEM1dk1FcWtnOWZJYXpIVzBC?=
 =?utf-8?B?dHJRQy9oWkZWdkV5S3RDN3dqdVBBenc1MkRLNjNQcjE5a3lpSHJKK3NYMkc3?=
 =?utf-8?B?OEZSRkk5czdkcmR3YkFEd0lsZjBxWGE4RGRKaTF5SUpWeEE1czNjUlY3b3Nj?=
 =?utf-8?B?YkFrV0dhZTlUQ0NpVGZQdTBvWXFiNmU5M0laSDNBcTF1Uk1jdmVDNWJsa2NC?=
 =?utf-8?B?dkZEc2JoNjc0NmI5MU9Ram5XMFRvV3BLem9rZGI4OUlsU29rNDlTZjhKUXE1?=
 =?utf-8?B?bDc4QXpCL2d3U2hIK3QxVTFVc1k2V2ltajVWR09EUXBxWUxOZVJYc3I5RG9H?=
 =?utf-8?B?MW9UYUJnd0pHMXVhdlRqUlJibHJGNTloOTlwMzVXSzZ4Uzdidmd4TGE2TEFC?=
 =?utf-8?B?aWwzZ1pkd3pUYy8wSWM0d1M1RWtvTHBNQ1pFSlByaDJFTUY0MGZnRW4rNFBP?=
 =?utf-8?B?bkhiZFJvMENBdnlNc01ZMExNdEdyOEgwekVuS2dEQVAyZUFTRjlOREhwVXZk?=
 =?utf-8?Q?+yukD0702RlHCTmQ86HrA4pVn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad5a60b-2823-42b6-16ff-08daadd1e3b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:50:20.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK3BwU1svZMd76q0fTABBM/lIhy8B4CFT9UciTXu2xKvXAZw1/CjDirPIoprOG/pR0+moyNbglimeSSaLoFLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7644

On 14.10.2022 12:30, Roger Pau Monné wrote:
> On Fri, Oct 14, 2022 at 10:49:55AM +0200, Jan Beulich wrote:
>> The addition of a call to shadow_blow_tables() from shadow_teardown()
>> has resulted in the "no vcpus" related assertion becoming triggerable:
>> If domain_create() fails with at least one page successfully allocated
>> in the course of shadow_enable(), or if domain_create() succeeds and
>> the domain is then killed without ever invoking XEN_DOMCTL_max_vcpus.
>>
>> The assertion's comment was bogus anyway: Shadow mode has been getting
>> enabled before allocation of vCPU-s for quite some time. Convert the
>> assertion to a conditional: As long as there are no vCPU-s, there's
>> nothing to blow away.
>>
>> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> A similar assertion/comment pair exists in _shadow_prealloc(); the
>> comment is similarly bogus, and the assertion could in principle trigger
>> e.g. when shadow_alloc_p2m_page() is called early enough. Replace those
>> at the same time by a similar early return, here indicating failure to
>> the caller (which will generally lead to the domain being crashed in
>> shadow_prealloc()).
> 
> It's my understanding we do care about this because a control domain
> could try to populate the p2m before calling XEN_DOMCTL_max_vcpus, and
> hence could trigger the ASSERT, as otherwise asserting would be fine.

Yes, that's the scenario I had in mind.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but Andrew and I will need to reach agreement before I can put
this (or whatever alternative) in.

Jan

