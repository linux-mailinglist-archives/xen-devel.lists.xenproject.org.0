Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6936CA9D7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 18:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515363.798146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpGy-0002kZ-6U; Mon, 27 Mar 2023 16:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515363.798146; Mon, 27 Mar 2023 16:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpGy-0002hz-3g; Mon, 27 Mar 2023 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 515363;
 Mon, 27 Mar 2023 16:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgpGw-0002ht-Cy
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 16:00:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836731a0-ccb8-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 18:00:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6914.eurprd04.prod.outlook.com (2603:10a6:208:189::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 16:00:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 16:00:35 +0000
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
X-Inumbo-ID: 836731a0-ccb8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In2M39JKrdUsvZ7OZFIrWk8wWa1Pv589tWHprSpyGmCxAFhtDuXt/m/Lamgt0LsFs+wNkW0vU/n4OAp/3dqrcKJ50fPKoP4uOcAX1HfHrD67fvYhKbR5W6faN6urvdeOKr6kbwyleappfnaO7vmbtqzZWxiFVNBnmV6AOdfUfYHQmmNjiS+RMTRr2l/iOwZUd6IMymhuOuoAGwjx30In385bZqXdqg7wMowelLGj9LPobcTndTB0VbyJTJcpeJeo0qgfHRp3e0iVb/mFZiwgHIUwRxFnnOometzUA8G0Jh1+wc6bum5Qv0LiejYqIOowdRTKIdd6g+b7w2YJINo6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH7ml24ke/dUQlzBgHbx7LeAFcWgCXJy3gcXwPs50VY=;
 b=fnpWuIcgIoKTS+3SWc70qmC9J5/yVP1cEXQsMiJ0/BcBXWFxOiyU9twGDvbJnpJdEYWxLWR8t1+6hiiSSzAoGU1QoMNX2R8nhQz6NCXz6aeKvSw2ps4V8VjZmtJzLdV7JTTdiQJtfxBwHPerIh9XFV8iP5K7WzAI6a1UBwxH9rrHGzkB/DKCXzSv0SWgLAo10r35ZODLNzWbnmdO3zwyprGQEz4ixgvmIZEyAFsl5yoW1G2kdfBeDAs+ZoeEAXTlD90voZXWeflGbAea0bRxkl5JXwqiZogXBVrWkQ8p6RSbd81KmBi6UJfVY56VWbqSVzUST4YBOhnVl0QDJx+cCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH7ml24ke/dUQlzBgHbx7LeAFcWgCXJy3gcXwPs50VY=;
 b=AbdkV0DiTBX4dv6W5xsJymaP9bTa9JM86hYzrCEU31HrjwjJP6naC7ltMkgOs4V088UAnKtGsj21VyODBdOYXJo4oQHE3Xv3Ui3C0wZ19ofSJ4nfDfh1MbTeZ4/ri21dcYI1m0D4YLIsYGH7Ij7lAviKw1jISXEApD5eMI3GgudhoFXIbek6ExM9vcjx60oyqLGtlwXVHy6Bochc2/mbheKs6wbR/vLbWtnikWDZ2kTKf4WaqATDNwvs2+YV5m60iD+NTZCmxQnpfqzlfThJISK15TJupriy7jppWaZE9BED0xck3+MHYZtkhxeNSCGpqRZ4Y0xkrozpHTq5TOiHHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e840b93a-8f37-4ff2-6542-81289127a72b@suse.com>
Date: Mon, 27 Mar 2023 18:00:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: preparations for 4.16.4 and 4.17.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7bc583e8-6ca4-2197-2d3f-c4325c024407@suse.com>
 <c220e84b-bae5-7a53-2cdd-df5839603c01@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c220e84b-bae5-7a53-2cdd-df5839603c01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 913c3466-4d9e-4417-dd07-08db2edc666c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sRGtWwAW7bQt8Et02h4uMpShdmtAWk9hvOJYCI8XJc/mQbvEvLIwnuDoAM7j0bymflkE3OHpOvdG/MOhUypzCH4JV3AqybZ5OVeSUuBe4UnbyjlIfE408q5MNV3mHw6zNYMM2SrBEQWP74fumHPATppT7xvcZnYAdkRaPgwSFasGjMUfxBuUT4oJrcZRA26HA1C4AelwgJ7vDXu3sBRGUWbdZRM+6Q0LNjMphf2LdD/2lhwVOuyXiX5KA4BzVFTq/8/6vI833oKkbU8KZxK9961SVvkUJGuQW5l+rHa5P4uCcf6crJVPWpOKB4SC0SeMxwZ2i0rrYJB64Aq+KZ9NrncZraFlTUnBva2U7OPEh7ImemPDTO/KjnN6iFP7erZquIl66t6q3fYkpUnwIQng8hK/xyfbYVcd6SDWMYYxuMSYinj3XA8q659YxVJhXmJxf5xleu55rnFT9ptqbF+UncJhiv4Mktu/c1G+0bpVSgMlNHXq871rkI+uB4VU0YlaO/ecapvmL30qvE7hqOJ++trTR1Cf/sNU4CiulUMqHobLQVQ5f/TOwdrJScbHIe+FGJLJZ3UDoow6QOC/Lns5vq6q1aUgtNEEL+yCFlmfTXq14vL7clNJjuOOlZKHpeasPuOrcFgDqdY3hDhnU6rZQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199021)(31686004)(2616005)(83380400001)(41300700001)(31696002)(86362001)(36756003)(5660300002)(38100700002)(8936002)(54906003)(6486002)(478600001)(8676002)(66946007)(66556008)(4326008)(6916009)(2906002)(66476007)(53546011)(6506007)(26005)(186003)(6512007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTArdFZHOEp1eDdXb3ZvbUpFaEZpWGdmK05iRmRuNVk2THpKYWNGWGpWd0Fy?=
 =?utf-8?B?a3p5c1cvbURvQTRXTlliaU9BQlJWSXpjMENjQlA5TldnYTVsVStWQTRJc28v?=
 =?utf-8?B?R1JzcW95MUpwdkMrTmk3d2tVVC9mTmUvc2JuZUorMFBQL2tvY0pPbTNlUDZu?=
 =?utf-8?B?d2g3WHcyUkhvUTQzZFlwQ096UUFMQVpZYnJJL1Zva1VDRmhlQ3VpTW9kYWNl?=
 =?utf-8?B?ZEh0bTdlUUZxdFdTc0M5d1gvSldIeWVPUC9RVzNiY0JqeFJNb0xLTlVKdWlq?=
 =?utf-8?B?SndpayszNG1jTjJhUEM5KzBjQm5Jc2NjenlGY2MzUVZ1NFMyVzZZWEgzRkdO?=
 =?utf-8?B?UTJaaXZlbU5nT2s0bFBrWElPcENmU3hiSUU3b0tOdC8wK0tUUGNQMHpoeEpQ?=
 =?utf-8?B?bXVwNjBrZWJXWUFoQVc4eEg0czZpeFV2SHpkeTB0dnk5RHZiVERJL2gxM3N6?=
 =?utf-8?B?bkxmTDQ1bks3WGtQYU0vcE5wMjFwQkJoM1IxTDV6dDZ4NHFEVTJMeDJjTm96?=
 =?utf-8?B?WUsrR2M4MWhvV2xOUUwxbHpXdGdWSWh1dnRXNmtvbE5zcWY0eC9SeXllWG9L?=
 =?utf-8?B?emtOTzVCbCsxamdrbnJhUkdxU0tMVng0T2UxR3MzVklxUTVaMTZWb0tuWlND?=
 =?utf-8?B?bjdHQkFnOEpYRGpFNk5ZY2ZQeUExbytIMXl4Z1NKZDRnZFlVeGlFdDZUN2x5?=
 =?utf-8?B?NWVRaWVHT2E4TitnR2htVmNkSVBvMkwyVFgwei85R0dRNWFpaE1zdnhLeFU5?=
 =?utf-8?B?eDNNUHFPc2xRSlFKKzRudXZMRit5eUF4T1RVdnFvRjBIYzdwV0xnRjQzTWtL?=
 =?utf-8?B?NlBWajgyMVpiRDFrZGpiNGhqWkpEaUtMYnZGNE1oRXpjM2VmSmlmbVBOVGRP?=
 =?utf-8?B?dm1Pd0FCeTIrOGxMcFV4RFd0RW5PSmVPemwxdHRHMzMwRGNETDVFUGZoeENi?=
 =?utf-8?B?b01FSiswWC9FdmtjTERwS04xTlJwa0JMTS9PTGQrLzRyU3JRNjJSMkVqeTZw?=
 =?utf-8?B?NTZOQU91eklVS3ZBMXRvNXNlSGlzdWdxc05xWFl0cFk5YmhLby9CMkdvbzBt?=
 =?utf-8?B?engzQ1dVZnhVcWlLbXZONXRRdjlNMjQvWjdZWmVOQ0ZycktkWExSOEszT3N2?=
 =?utf-8?B?Qk1FN2p6dXVTd3BOR3hiaUlZd0JxZWRLNm9yNTJGTjFqcmpISW5mRG9Ma1Jp?=
 =?utf-8?B?UlNCR09rMHM1ZXBOWkp2U010MG5WbFFIUzBmYTBDb2FOdDNHcFBGRG1nWi96?=
 =?utf-8?B?RVYzRk1VSzR0a1h3Q0dwYjJFMUJnd0Nzb2RkU0I0MmRJQ29JTGN1UmVzc2F3?=
 =?utf-8?B?aVhUcW5FRktOVGJYMXhoQVdYeVo5d0ZZYis3WGZFVHJ3aitkVy9yNGdZUE5V?=
 =?utf-8?B?SGtkTFEvN1hPRjlkYjMvWVBwTnZhd1ZxZXNYQlJ3OGE1endSb05OY29UczYy?=
 =?utf-8?B?WGpuUG9FVzJyRStWWUFRaW9jbzgwWjNXWEpBczhsNWZmUXdUWUwvdnZyRHVp?=
 =?utf-8?B?d2FnaE5sNDlDakhPT3h5WFkyK1Z5VTNONjR4V3R6NENRSTl0ZEtMUTd1TnRk?=
 =?utf-8?B?S2hybUNGRVYwamt0bkoxd01BeDFXVS8vdkRlQWltL2hSbzA2dG9NbXV6Wkh0?=
 =?utf-8?B?cmd4TXFkRmlaQU9VaWlLUlhnczJqdG50NVBUK0xJdGhPaW5valovZUo3TklR?=
 =?utf-8?B?RGk4M1k5eWpOZzc1Q1lCYU9QbnV0S2R0cU9rVVJGN3hmSjRIM0dEUEM2UW9y?=
 =?utf-8?B?eXZObTFJdENMN1BseSs4S05rYndWcEJFbG1pZzdUWkZ2bGdJY1Z1K3MzZ2s0?=
 =?utf-8?B?NmFtb1N5Rk1KVGdQVlpwOVB2d3hKdnpYUkZ2NWJRLzlDOGViUCtHM3VFOHFW?=
 =?utf-8?B?Ui9NT2pGWXdkYnRhOFh2UU1MSTZzQXF0RXp4dm45YVZQcEpEWmtQa3pDVjZx?=
 =?utf-8?B?UWk0WHJzaVJxbEFtT1FCZ3l4ZDVVRlplRHppRStQL21OQlZxWUJwMG5VeHNQ?=
 =?utf-8?B?bm9VdVFEMGV2WktXZzlnamIrang4eVc5VCswdVdkcXdieVNoUitKMlBiQytT?=
 =?utf-8?B?RXo0ZWxBeUVwa1Vra3UxbmIzUVZnc0ViaTVGNEUwVjhZQUxPWEpjN3Bld3Ru?=
 =?utf-8?Q?beOj4gBQMelfPRnHzE8MCboyY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913c3466-4d9e-4417-dd07-08db2edc666c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 16:00:35.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8M8sPjF9zYynRlr1s5kfEx/IK7JgUQvPnZamI5VqYOo/6KA1u9r23RaK+5/teShYEt6kyP5CZD7boc47cNOMcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6914

On 27.03.2023 12:55, Andrew Cooper wrote:
> On 21/03/2023 2:30 pm, Jan Beulich wrote:
>> All,
>>
>> the former release is due in a couple of weeks time, the latter a week
>> or two later. Note that with us following the 4 month cadence pretty
>> strictly this time, 4.16.4 isn't expected to be the last ordinary stable
>> release from the 4.16 branch, yet (unless, of course, we end up slipping
>> significantly).
>>
>> Please point out backports you find missing from the respective staging
>> branch, but which you consider relevant. I have one change queued on top
>> of what I've pushed to the branches earlier today, simply because it
>> hasn't passed the push gate on master yet:
>>
>> 0d2686f6b66b AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode
> 
> All subsequent to this email, but for completeness:
> 
> 6d14cb105b x86/shadow: Fix build with no PG_log_dirty (all trees, as
> this was a bug in XSA-427)
> 
> bc3c133841 x86/nospec: Fix evaluate_nospec() code generation under Clang

I've queued both already, yes, but for the first one you name I'm not
really intending to put it into 4.15 and 4.14 - this is the kind of
issue where older trees simply won't have fixed anymore. The problem
only affects an obscure configuration, which is hardly used anywhere
for real. Or are you suggesting that CI runs randconfig tests also
against branches which are in security-only mode? (If it does, then
I'm not sure this isn't a mistake, because issues not introduced by
security fixes wouldn't be fixed there anymore either.)

Jan

