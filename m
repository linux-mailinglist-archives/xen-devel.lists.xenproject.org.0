Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE276935F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572895.897001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQPU-0004jj-HT; Mon, 31 Jul 2023 10:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572895.897001; Mon, 31 Jul 2023 10:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQPU-0004hX-E5; Mon, 31 Jul 2023 10:45:56 +0000
Received: by outflank-mailman (input) for mailman id 572895;
 Mon, 31 Jul 2023 10:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQPT-0004hR-8Y
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:45:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe12::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bae7ac6-2f8f-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 12:45:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 10:45:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:45:50 +0000
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
X-Inumbo-ID: 6bae7ac6-2f8f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzOrG5JCy77eKVXHL2cE8dMo7MHcCyfvMoUCLmxRuT5Ovymwmw8m3QnwtBqwEh6GKjjZnYDc1PBC0kMAFPZe1dZXJlB4Gw5UdU01qM8/U4baRUqtFaQT2QLwW/0Xx0lnqxqLcsU0BcxhJwlFDr31koEUg1KpoiHRWohv7PwNsGtWT7/9elkdp7E+2jDTR6o7tz+5/MGEAMtFMWIGQ7ksx5WU6of89xIlQ/1X/hWz7n6EHqqock8mTCApw43UbAHb7+5KxOz05Kq6vP8RVhSSSDKddb/7bbdxxcoz7Aiikc0zz22WwKevki5l4QY7t7YfiOsKhrCF6o1gw1OmNytcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUXmaj4TufZiMN8t0xt/rNzlBFVfzQe8B+tPimEyiMs=;
 b=icxeoNMoPCc/osReuDQiya+S66gK2UcuhA77iscVm1iv2ukbjiTu1qvUc6eg/Ge7DRp75CZX2PaEHEPTzH4y+R2QdWlEojCnVkMa+GlWnGxiO97iphLC0iOhsh+oxX4nARDmF7NHYwqBjQu5E3SsxmMYPOZM7KpUy13obCBILYw98a4wGXpKbH+zRLczelrqkSDa2nSY+9smoag1ggr3JrcoVgxT1csqDDQjTatQIxHYDFjpOMwGShe0buZY3df6YicOEQD0CEdNedztyvSVMG2CM5K5OQedPThdHWlVdObGTAbktLaU6lS4uRyhZycWVvyVab7OL1oN460tEylmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUXmaj4TufZiMN8t0xt/rNzlBFVfzQe8B+tPimEyiMs=;
 b=ZEYwLdYg8Z2Nf/EPxqngZ62dMpJzjrJ4iLXWoyJN6Qd+Xp7qrXLrGTlT6FqHEsAy4Cl2PQ9QnjctWofq/h5HEgEIEmZDOutR86R4LwyD5MHVVxp4LWIYSC0QwgZzjg0ACPoTa5HN1USxXQNMbFnjoBPV4iDvLbitabBV69/KCKcPV91avo0puyxVBvDjlTlMNEgbyas3bbB007tNeDWxtmOwHnwARF3rWbChE9BkkZMKGFbfZqZ9zYfzucyEJoU7OM+Erd8oJEESIndkDpdMP9atB7i2q+ExS51H5GTrMmG+leX1mmWa3sz8JcrqEfxlrsdxPMeI02CZYGzTyKfrAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2505a2d1-1606-9199-5115-6dd6623b1b9d@suse.com>
Date: Mon, 31 Jul 2023 12:45:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 2/2] x86/IRQ: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1690544434.git.federico.serafini@bugseng.com>
 <da6fc50b926e72b497db251ca640c60244db3632.1690544434.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307281611360.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307281611360.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9563fb8c-14a7-4ac7-bbb8-08db91b34e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aixuqNpeD3aN26a4Un/74wph+Xaze7phapMN0RGVj493dfwjHMkKlNIEApmwwggSVmihNgJ+rgdpIW9DdeYrCG+6QRHS55gFvx4QgdWJmDIoC5Tn9C+dhXeEo0P+e8DjFjmjMeYfhWkOx4wDOd2WXvrUD/UQmqXnUbH+BZ8MX6l2+vYtVV2JXMTVWu6EtAGmWhUHydDepXWIHAXeuTgJFEsAwcrarLycvVa3hE3T5EudpNQhoFq/slkAzw4DkiGvlqxIl5EoIeXfan/EOxvSeY7J2p+2qTyBHF0mnnHylETJRDSiV4c9Z2Ihgh56Mz+Qd9DElT2LhJvou7Xi4aMqj1JCk9KP/XV4UTZ/gsUaDs1GptqAW6wMXoY83QA/Nec9viSsZfQpnxDBtt/S50yGcnWWQumJExc3xdv6AEG2J1usvprpVR8olcjqZn8Ei6IdmSGXExCWwa+qwDqKSyMyxo8TTJpGjBjbF64LkvYbqC7+HlLAHwSMnzZilEjlt1x/38Eu6bKOmaGi6vyPyPmgYB0tJUztqI87KMCPz/iF9VpH/lffKk5mf1MpDS5pKsQOYdnOFEu7Y9QG3t8Da6ElbFvMJuqhiUeaghsGqkdImzkCH6a+IzoAD6yR2gDMZZE6rWm9zUsYholELsuBmvt7OA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199021)(66476007)(86362001)(31696002)(41300700001)(31686004)(8676002)(8936002)(316002)(6916009)(5660300002)(4326008)(66946007)(66556008)(54906003)(478600001)(4744005)(2906002)(38100700002)(36756003)(6512007)(6486002)(6506007)(26005)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzA1ZnBYaFBWVEVjYUwvMEhuOTNZSmx1clVNR1gvRExreUh0Z3FXRUxkZk4v?=
 =?utf-8?B?eXhVa2pHSkZESitQdVhUWWVjeHBrWVlaTHVIbjNzL3J2cHJRVjY2S2JOSlIr?=
 =?utf-8?B?ZDY1cm9OeFBsdnAreEVKMVM1YzVwanBjUisvZXdGNmV6WUk3d3J3UFI5Yldi?=
 =?utf-8?B?bjlHakVwTVRGL0NwMllIaWc0OUFMVVhUNCttaHFMOW9DTm9DNGFOT3RnbzhH?=
 =?utf-8?B?UmhIZXJSejExMjg3TVpkR3F0RkpLRThuN3pLUi9UTld3SjJIMnZsV2dCc1k2?=
 =?utf-8?B?TnBiWWlRNUd5VVc5U09Lb3Z2OFJaenhIdXpzaHFwOWtBcysxYlBKTEJicEFp?=
 =?utf-8?B?eDZwQ2dFa0dJRGpNd1lmQis4VTU1T3BwVVVTa0ZBQ2NQVklBSWlXSGw1YVBO?=
 =?utf-8?B?QktCdVkvN2RRbjJUaVQwV0ZFVWJySzJZQ25tbm1CSU44RWtidWxlZ0ExRndr?=
 =?utf-8?B?UGNVT09rbGNGd1BZbzFoTzhwV3dEbjBLSWx3ZjNLRUJ0R3hnci9qZ1NjcEJG?=
 =?utf-8?B?UUlQNEtYQkp1L1JCeEhXcHAyZlc4MkhaYXY5MEJWTlowL2RWN2RHaUlLWVFi?=
 =?utf-8?B?TUlGWUdhcm05ZTVyOGQzV2R0Z3kvK08yQnpsbnZMcmJwNGhySUpMS0U0RXVs?=
 =?utf-8?B?Vyt0ZnNTS3hNSnVwVEhiVmpoc2dxcGNGK0VQV0dCWnV1bzl4VG1SaHhHSWp5?=
 =?utf-8?B?MkFWVENBUVJlbS94ZjdtM0RkTHhJVnZKdlc1NElNeFdiM3ZHOHBSWlJZbW9V?=
 =?utf-8?B?bVBkdFQyd29GeEk2RWY2NXVlRTNNK3N5b0pRS3NLT1pEMjg0d3JJbEYyVXZR?=
 =?utf-8?B?cTRZZTF2ZHo4bWdnbTc4MzNMa1lzS1QyRndwZmFoOUUwU3RWMUo0eDlOWHZK?=
 =?utf-8?B?MitHRTZBRkJsQitiRDFTbi9EbFVxOUQ4TDlDVWJFQjZiODMrYm9XSnN2eDdG?=
 =?utf-8?B?NU1hVit2TitXb29uNnRYb0Qwekd5cFA2L2dBeVY2Ri9BMmdYdE1jcXRNSXV0?=
 =?utf-8?B?NU8vOHYwdEhLTGFGS09uWk5YcFNWcVlRK2sxcENvYUFvU0FLNS9XaFJxSnZH?=
 =?utf-8?B?QTJtZGNxZ1ZGUlU0MGwxVTJzSEF6YW1wOWJTQjZuRmRJUHRXUFNLM0h1bEpE?=
 =?utf-8?B?aGF5QzAwR1MyblVmT1paNmFvS1B2SHVObFowUjUrUTlIcDhPcVZ0WWl3TTNs?=
 =?utf-8?B?NTk5TDR5MXRhZlpmdnNyTG5VQi8vMFlZeFQ2ZjdlT083dStqd01POUdCL2cw?=
 =?utf-8?B?UEt0Q2w2T0c4bHNjdFFQTFJtaVNmbVVoVU83VnZPY29MamNST1pRYUxBdDh3?=
 =?utf-8?B?R0R1eW4ycU9TaEM5UitIdWhqcXE2MkltdEthTjBDa28xamVJdXZ5Vmh5RUpQ?=
 =?utf-8?B?SExJeWhsRUV3ZGw3UlZFS1J2dnNGK0c5QzluTk0zemJ2UDliQXQxQVJtbEov?=
 =?utf-8?B?Wm5mSEgzbVBvNE5obUVoOTlROGFUYldoa1Q2ajZnQWdPbjF1WStid1Q0T2Qr?=
 =?utf-8?B?d3NqVzBrVllvMG5YYnRSM0c4MnRCaGtJTm1YRzNWaE9lUDJOVzNmWEZRR1Nz?=
 =?utf-8?B?cXMwYkFObG9JbDVQMmRzY1RsdDlzYmYwQk00b1VxR2ZTVitBWmczZ1JrVHNl?=
 =?utf-8?B?R0ZZb1VobEx2MVgrNmVLV0ZNRUVYaFRwdENueTg1Mm5pNldJRytYcTVjR3NL?=
 =?utf-8?B?WFhBZk1DMmFla09UWjIwNXRCdGxxcS9vUHptV2lDZHpNSERGZFlHbjdCb0ZE?=
 =?utf-8?B?QW9TZ1pLczBsOG1CN2tqWk5OdnNEZlVlYmRlenZpWnJ0WHp0WXJqVlE0cHY4?=
 =?utf-8?B?cHpuRUlpcmJicjZiU0tBNTI4N1dlTkN1aHQvWnVxSnJ6ek1nQjBCZjE3ZmY1?=
 =?utf-8?B?cHNMQW8vQnVseG5jd1N2TStTTXIyOWZvcVR5SlZERVhwZXF2VXQ1YmhvWmxI?=
 =?utf-8?B?OER0dHRKM2NnU3VQTUZUemVMZk9TZEpDQ3VXVWRidDdzVnVXMnpzYUUrd0JU?=
 =?utf-8?B?NmF4RWdacGJ3VU5nRVBsS0cwM2VSYW9VWUFrWm42MTlYdnFWcC91YzRRTEE5?=
 =?utf-8?B?RTEyV3FKa0JIQThnR0Fwb2YxOVpXUWRwdkVRM3lxMmtZZnhXb0xTMWFNcEJ2?=
 =?utf-8?Q?Xkm0O9gtM7m9rBAmR22qADBIm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563fb8c-14a7-4ac7-bbb8-08db91b34e6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:45:50.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgWP9YpixUJkyFQHEt+m/Bp0dg9zrk2IIcUDQ1Cc9nACAgEiOfALy0tfKoeDZltb165juntOkr13AdhrqljjkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823

On 29.07.2023 01:13, Stefano Stabellini wrote:
> On Fri, 28 Jul 2023, Federico Serafini wrote:
>> Give a name to unnamed parameters thus addressing violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between parameter names and types used in function
>> declarations and the ones used in the corresponding function
>> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
>> ("All declarations of an object or function shall use the same names
>> and type qualifiers").
>>
>> No functional changes
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



