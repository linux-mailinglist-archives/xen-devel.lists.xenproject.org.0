Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4477318B5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549559.858145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ltu-0005o6-GU; Thu, 15 Jun 2023 12:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549559.858145; Thu, 15 Jun 2023 12:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ltu-0005lJ-DT; Thu, 15 Jun 2023 12:16:30 +0000
Received: by outflank-mailman (input) for mailman id 549559;
 Thu, 15 Jun 2023 12:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9ltt-0005lD-QT
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:16:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73fdcd1f-0b76-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 14:16:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Thu, 15 Jun
 2023 12:16:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 12:16:25 +0000
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
X-Inumbo-ID: 73fdcd1f-0b76-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb203h49XeuGP6e72YhHmiaQPQ6QFLU8WBLHw/t1sG5JMVkutil2bEsR33xXIkZXH5FRO3itOojxIHKWsMGvrAsQI/r1tAkj/Ak/ojtgHtkQNJHMdatNxZ67z6fmd7q/gEF4Ss94gpqBsjHFFfqxowhIY1uTrqX4YNnKuRAGv8rOh930GQ8MxVxACa0yGs04V7k2T8i4O7lTCXiQvLDhGO8QfHjhm/+dKKrVDbeJv7Bodpi1GUH1NsLb/T78PgeF+cLfibaqTiOQQekqZRSTNOXW6Xp5yMvj7RoSgSXJYbp6uI7d6iiriqjLEiLKq4CJcv3KuZIMtxUEloBih5hIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeMe3i7111ySq248IWi7+mRH7GcpptEyMPwITjOWlbY=;
 b=RbQzPzNabhesm32By4i+9YyXROgjHXpFFzRGmNv8x8Z5wiM7Je1QM/n9n/F9M6FQ6leRUYcM+QJn3sLhYG4k/nxUmdgeWdNin+Wc7oRB5g1ZL90molIGxDpGQvSyJ6sbNF12ICZCVF2VtGOC0Y41JWHh1NrQCVwMBEn3obNYf5afQgSTw2CfwzuZPHJwIj/njg06pKGl4t4ePm+PLCTxps2G0VnSJprFWHoP6KM6W0vwlkxDs+JXGim3+6+PpBah8MdyGbsEs9OareXrcYgGqy6jlqOJ5+SW63fTz/CF4qglLTABroa6grdfJ42SGj0PEElsAqh0uE2iPuRkT6RQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeMe3i7111ySq248IWi7+mRH7GcpptEyMPwITjOWlbY=;
 b=2nIXlnUbuhn3+W0xrKoR9F1jVgo/+zQHb7z1hYVC8k9b/hjol4wPW9p6WxFgJscCAKFFX4H2xTpjBw06cqbOTBMGtPWG/UIbh+QvW4t5NgJs+HlLjTjNVFteLk/9x9lH9iKACH4nbauiYObMMx8GzeWhN8iR6PrLBM7QqjKYlG/xkz+UT5qOxthJAmvvowTP1rbak4GF+wzr7HQ09UCtgz1aVac7USrx359xzOkgt+Lwsrq0Fkj7hSv/vqqthNy/izyHYsEy+3kn+Obm/m4e32XK0IB+0TqL/NLdtqkvj5f/VhAyk0c/XfhiCmZx3rVcq7P70rIhTSYTYyABsKPw8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca2b82aa-0910-d065-a6b1-9e3105b33380@suse.com>
Date: Thu, 15 Jun 2023 14:16:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com> <875y7p9ia2.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <875y7p9ia2.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ee4372-b4cf-47a6-12b2-08db6d9a56c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CHyLG83yHD+nHj5iJCXP2DXgElHRL0xrvDCAoN8kcWrYkHXDerlEjlFAUUL11i/roNpb09mwzYYUaeEvgT2Q/v3PXv5l2xinkpMeKxaXnSdBBFnB0Ovz9xFc/WutdQ7wJcug9aHoGX632z/e8wqPDDkDRL70byYLHvt/HW0tXCLDu73sQ6J+3/s4WEGVRbsFjc6LGlPr+2VOj1u9VUcecvpp3MUOHzkJij8UOM99DgzFSbar3bfZIt4Wh9RLl7FQBrrE78rs3NeLTYqEqW04aujUnkCWhkY+HPW3+PQ1YuFwj4lky1l+5IOuDRL7MVr5BnvfECRt4x/wn3zRNpzRiIp9RQyArWA1q4SghNtredAZ1oEug6iYxxbsrK6MzNf09JIeml76rEHDTv7wMmBZAuCNlF7FIXUNjwSt9OJ8xqbZ1TkaWFiBrZElhH5r6pq0HaPR63vISCIOpQLq9yoqpa/Y+pK1h0udANMTr89MQ8U7okJWOveKdPzGZSkiBdjSK28RjJ9gpQjRs69nFeJUNupVKSPWojI37v+IEe2yibGp2XzV4C2rE92CrwSyBxYn8fEUiP+Zqf5+7ZO1EWhcNfiAlbOl3m9Ivwf/JjQYIWqJvL4dYK/LBbN3OP3RBg0lLXDL9nKOuzBfqLCmuQ1eVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(2616005)(316002)(966005)(66556008)(478600001)(54906003)(6666004)(6916009)(8676002)(41300700001)(38100700002)(8936002)(66946007)(4326008)(66476007)(186003)(6486002)(83380400001)(6512007)(26005)(6506007)(53546011)(5660300002)(86362001)(31696002)(7416002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjZudGhiYkREVnBwVUZKZlN6WHpNcUVyRHV5TEdYbklwUmZsV2xPSVl5czBq?=
 =?utf-8?B?L2VweHBTOWNyVFZJMXhQUTdkK1crMS8xL2piN3Z6K2RrZ1JWcWlSbEIyOHlW?=
 =?utf-8?B?MmNoaGt0azhFTWYrdmFMd1NrYWZnYk5SK0c1dHpkQ1JtU3BRZ09LRC9OdXdS?=
 =?utf-8?B?WTJIZ1Q1aFkxV2hiL1l0NXdTRzRJNCtCaHJST2JyZ3hOVjhCdHZVVldLUTVF?=
 =?utf-8?B?NTFvVE1TUkh2aEVlL05BbEw5ZHNRZnJwU1U0cG1KS2hzSG5DQjlCWVV6aXo3?=
 =?utf-8?B?VmpCa09JY3piTmV4VXArOG1oTWRXNG5lVStlRC9hM2RKUnFnYTJ1RDlzV0lh?=
 =?utf-8?B?QkFGN3pEbzc3SFA2cXhDNTdMT200MjdRZzRsU3dHU3lQNDFXc2x4ZXoyZWd1?=
 =?utf-8?B?UEhCVXU4bjQ0MVZ4WkdiZnl1UnRxanZlenM0NUpMajc5QlpXR0FvTlN3SzNU?=
 =?utf-8?B?b09OM25kK2c5dEkyYnNIck55cmZ5dEtMSU9uMVBLVWhsYkF1R1dOTWlKR1NN?=
 =?utf-8?B?c1JpejR0ci9ET282NUxFWDBUOFZNYTNOcDBBbU1KQWV5emZmaTdlSTFGQ01B?=
 =?utf-8?B?aHlZUFdYSzd5d3E2bzYvaHVWNmFUSFpJdUkyTnhoN1ZSZFRNMFprbHo1SGxY?=
 =?utf-8?B?RFZEYWordVpqbTFOWkJvWEM2SzJBdVU4TXZwT0dES1diaGNmSG1LMFlXdGxu?=
 =?utf-8?B?Q0svS0tRUkhiMkl4TUl6NGo1WHZOLzFLQThKM2pVNmRybGM1OVJuTGlWL3Z5?=
 =?utf-8?B?cHRkVVByd1pLa25pWUxpWkNoekFFWGhBWjZzTWxld2JvZ3hFeVNJUkxKcDd6?=
 =?utf-8?B?d0pqcjcxQVRvUWJ4V2g3M0xvVCtYM2ZhaUxNaHRxZm9UdVMzV1doVmEwaVpY?=
 =?utf-8?B?Z2JKU0Y3RTdZOEZDMDBjc1cyT3hncUt2a2pwZ21SZGpRc1Z3K1g0TVlzTzB5?=
 =?utf-8?B?cHI4dDMzYUROY2xzcGdhU3lDQ0ZMeUdxaTFIRklJY3hYY0xNdGpMTGZoKzZP?=
 =?utf-8?B?NXRqM1NZN0FVaElKWmFoTG81THJvWjZjSytLZWh0WnpQbVU5ODNyTEpPUk1w?=
 =?utf-8?B?ZllGa2wwaVBYZWpzdWUxVDFKazVOWnNhOXhZRHRWbmR2azhkZHpTS3NCdlMy?=
 =?utf-8?B?clFqOEMrRytSU2ZBZjJNeHVMMmxlMFN0TGxhNktFNXpNckhDb1BLbFBWYmkx?=
 =?utf-8?B?VFJZNlo4ZDhtODREdDAxSXJoOXh0VFE4eWdNVVlna3hUQlBSa2NDdTc3Umpv?=
 =?utf-8?B?TjMyVHFRTCs5T2tyUkI5NTNsSmFCZ1pMKytTTlQvYmdmRVN3ZXczNlpnZUNv?=
 =?utf-8?B?Rmd3a29ldlE2M0g0WWhjaVhidU44VmZqQ0k2Sy8wTmhqck9ERGtRTUVoMUV6?=
 =?utf-8?B?cjVxeEg0V2dHT093Si9PV1B3MFNOZjlzQlc0b1c1RjcrL2VjN1FsVk5Rc3Fp?=
 =?utf-8?B?YWlzNmJ6eTE4MHo2Qkt1b0xzbjVxK0k1Yk5wL2plSFZOWFVuSUFIVFdRVVV6?=
 =?utf-8?B?V0Foc3ZCYTMyVCt5bTZjYlJERHFlSHhpQWphV3FlNUpHclVRRmZBTlhmWlVM?=
 =?utf-8?B?bS9MZEloUTAraHZxUkFRTEhWeXpwRkFpci8wUEJ4SmVXbWpWSlp1VTNKN0hB?=
 =?utf-8?B?cGhsUWhpNWRNc2RoYXVhc2I5cjFkbWNWVmpQSWQ5Y0NNNmVBZUR3bVBNN3JB?=
 =?utf-8?B?VnU5UU1QOWdzalNNYXhCUlFndXlLRGFmWGVPWWtsSDRDdHkveC9LZUlCQnBn?=
 =?utf-8?B?bzRTWXBOOUIxTXFreFhabXBtRlBVWHhUbXhPaWpCbWcrSmo3YkFCZTRYbmN2?=
 =?utf-8?B?b2pDcy90THRyMXVLYVI5WEV6b0xiMEZxZUlwc00vamtsUWtqd2VOaGNBVUIr?=
 =?utf-8?B?TXRGOW1HcVB3T3o4eXp1RVhIL3dxT0NlOHUyWXByUHJRZ0NQeEgvdjBGQ0dz?=
 =?utf-8?B?eFd6aTBvd0RTOW15V3VFd0hESzM4L3lQYko3SmJhS1JOTVBtYU9sV3pDZ2NL?=
 =?utf-8?B?cGpPR2NVdHdEUlk5VUE1TmIzUFlJUDZqMnl1eVZGM2hjNVVFeTVaWmtkWHBR?=
 =?utf-8?B?MCtRTmdTUHNDL1JqZWdaYkR1YWs4UzNNa29RajIzbUNCUERlbWg2MXczR2JO?=
 =?utf-8?Q?r/mZSERXuqDPvmiaZygeux9UG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ee4372-b4cf-47a6-12b2-08db6d9a56c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:16:25.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7JDXFKLMPLaP6+ag4CvNrIK95uesmM45L7J9du6xmXQwN/ENNa7rAkmYPuVpwJdzYuodFCWGFTncpzr8BNEJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9561

On 15.06.2023 11:39, Volodymyr Babchuk wrote:
> Stewart Hildebrand <stewart.hildebrand@amd.com> writes:
>> On 6/13/23 06:32, Volodymyr Babchuk wrote:
>>> Hello,
>>>
>>> This is another another version of vPCI rework (previous one can be
>>> found at [1]). The biggest change is how vPCI locking is done. This
>>> series uses per-domain vPCI rwlock.
>>>
>>> Note that this series does not include my work on reference counting
>>> for PCI devices because this counting does not resolve isses we are
>>> having for vPCI. While it is (maybe) nice to have PCI refcounting, it
>>> does not moves us towards PCI on ARM.
>>>
>>>
>>> [1]
>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.680961-1-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!0BUqPos1zFKUoPwbKLLwKItNgBVPaBgxmH1Y6zXpms2bngrlWrzB-qMNvIaiAy2WSWMa93UrlvRi0ijYP8X4Ymx07GXYPO1W$
>>> [lore[.]kernel[.]org]
>>
>> Thanks for sending this!
>>
>> Should this be v8? I see v7 at [2].
> 
> Oops, my bad. 
> 
>> I had to rewind my xen.git back to 67c28bfc5245 for this series to apply cleanly (just before ee045f3a4a6d "vpci/header: cope with devices not having vpci allocated").
> 
> I rebased this series onto staging about two weeks ago. Looks like
> there was new changes into the PCI code after that.
> 
> Should I send a new, real v8 which is rebased onto current staging, or
> we'll wait for review for the current set of patches?

Please send a version which, at least at the time of posting, actually
applies. Taking into account Stewart's observation on the version
number makes it even more desirable to have a re-post.

Jan

