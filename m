Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E27D6778
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622775.969897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaWS-0001hm-Oz; Wed, 25 Oct 2023 09:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622775.969897; Wed, 25 Oct 2023 09:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaWS-0001fH-MI; Wed, 25 Oct 2023 09:49:56 +0000
Received: by outflank-mailman (input) for mailman id 622775;
 Wed, 25 Oct 2023 09:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvaWR-0001f9-76
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:49:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe02::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91569de-731b-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 11:49:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 09:49:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 09:49:49 +0000
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
X-Inumbo-ID: d91569de-731b-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DElr8AK9BwOwzOyJVFPRzeqtElqMSyVvxlkvlgJWEmgwW2TElFEdEqOzQ/hr2mS5yNggFUExG7iBvpwW4FMssksin8Bi64JUDJWvgDUz/cPcPiNvATEtKVsuKvsNWiN8YdbwJXJ4hifGjrXC51Xlgf/LuRbJAsbebJRdk/v1oFGuZ7vXEqu3BTnn31LxfwffRgg+2bvSPC9Ubb1y2klvXSpw8xF5qqOX7Pa1KN6MRXa4oO7CpRYdsjz6ZUm8aL73DiZUOe8Ygpavcmd3Y/cpIX82dPzrlem4N9RZxXgdfuhiKXUCjvfnKGuV7RDloJJmbox8Qds1eFnCX+Gp2UBZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s87VEnnMAjffZPq4R7FWmH3QT0udyrhJHe9MvB7A9Hw=;
 b=JH1uxe6VC4hpswSNVMrKWyhSs9Ys4R/gh+6Zu7BpaUZeduZTSOA6GZu0VZpGttrlM3y1x34eav5E1AJ81PY5AA8FKkw5JhD4fMh7MlYgSH4fav7MAaX5kCRNbec4reyjqRTnXT6JSLk5Vn1qr4JyCleOPGt+EQy2+zftaQ37h3GlNa1Sf3T7jyjfWJ24X87d6KLsn+1EQyGUZSjml8skPFe13PY98343s67qbL+AyEf3bc1APzIx/suGuIZ/yn1BY6ND5A4r80+o4fSSTzMhutZxkS1BFrcV+J4zwXyd033mVOsZdwhDdNUdAyqIuCT4o8IuU0uwOFwmZN9qlrt3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s87VEnnMAjffZPq4R7FWmH3QT0udyrhJHe9MvB7A9Hw=;
 b=XtWgATG1v5a6ulItVo3LvXNVZ+VeGtSDgp11KajtYwkHir3WM1FUKYNNIN3NElIt03WsEM/lpY8wcxEei7VgpMRDI0bGGRjiMp0OTi+5D30YSXovbmRg76GRwM6rRSgdjQArIrN1XHqEY48QgveP9yI5uOPvp8LfPB3bcojKg2lFzF9s+dCdWB4i/09qEWTthuhZ8Rzm2kIv588GRH/mvjlShw7UI/cR+1atfwL6SjBRAyzFCgTNRQO4G+T8McJOMVFQmen9bvS3s8qh5YlFNEFzjZT7I9qGY8yMyrlrd0HPtMzUHxsIAa7s9noOONWKIyhzTsNKADLFSVYJHA6eTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0807134b-3ad1-900c-64ce-b60475d91d45@suse.com>
Date: Wed, 25 Oct 2023 11:49:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231025082834.31680-1-michal.orzel@amd.com>
 <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
 <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com>
 <4cb8a480-a587-22cc-2f11-fd9d6cc8c1d3@suse.com>
 <5bd44ff0-041d-4fc5-ad6f-c9e1158c474b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5bd44ff0-041d-4fc5-ad6f-c9e1158c474b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 5102c12a-13ca-4712-3824-08dbd53fba94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dfDNiH/ZyVDI/rPlEmCntQX7ctprvzIFT8XVC6pXHfAtgUNsIF9EvBtEeMG0EZYRVBJopj1H7qx9ofzYQbS8cvoH2pgfZCoFbR3RGPal3HoAB2mQ0jjZwZHkYDGdjEZBaRCkSr0zJ5ueYWBtdroVO1zN+4OLEEjU1+eG5JFPoLQGP8rcmXAyosWeqt0kUJwoD6CLKkS/FM/IyVl+uboUZfm5RwKevhdwO/UcXJV4YHD4WRrzRoT7YC034YiImKkXWE6S8s42xnm711GVL3j7egwYI1XT9VxZg5uAwTLUE9pcrO7LMzyNY73uo3USAia/llTEtnS4l1znNFlecg8AEEH12VTD+Au04NgF/j3rozsaPJLhWX2Zw3Jy0FdLO529aivWyskyn+InnIDMt+DFZra9RWk/10osy12mp0iTy64hgF9g17XA1zxBwyuAWrakgEBb9IQ0l3vWBhNsjQIn00wjrDHei7WJNZs3xt2K4IFgeDG6RkQIvAO58eoXiQ90NblSCcIJ/YYYVhm1aD8OryQ6EZtyX5ZDZjBWDtl34i6Et73bOJb3p6TsaTwUT/CSsuscbfmm4XdZNzlbf2gWJqeCsQhEPiXE+ZxqOtrgpCzLFsBVMQ+KZO/SSiNS56TmxdfWkPs178o2ciWRUsglkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6916009)(31686004)(66899024)(2906002)(5660300002)(8676002)(8936002)(4326008)(36756003)(66476007)(66556008)(41300700001)(54906003)(86362001)(6506007)(66946007)(478600001)(6486002)(6512007)(31696002)(2616005)(26005)(316002)(53546011)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJNV0RKYXlwRFVyUzhxMWlOTEJtazVTaUVwN2pkV1Y1QVZSNmNaUE5HYUcx?=
 =?utf-8?B?OEd2WVpsZFU5cm51M0JyOVREaGlMV2Y4ZDEyb2JoN2dWaGZyRmVkWEtuMngr?=
 =?utf-8?B?dnlpVGQrd1NvOWhjTmtGWG5qNnVKanZybTNLVkJjQWxYamxGTnRQOXlxNDVk?=
 =?utf-8?B?dUlZYno2OFdVeUtZUXNGZTAwOEpJN0ZVYUNIblRwVVlZU3BETVNVbVVIYWJv?=
 =?utf-8?B?ck9pQlBENlIyYWpWb2FWSnpWRGhVYlJQa0JiZVlIY2xTd2k4a1hrUXV0dk5k?=
 =?utf-8?B?aEVUR3RmTElQdDN2eGc1T1ZPMUtUOUsraEoxekVWUndVU3ErQnhjR1lwamZ5?=
 =?utf-8?B?R2k0NkhmVzExMC82OFBKb3RObkZWaWpXUjl5a0M3VVc5UWZoTXdhdnFZdFFq?=
 =?utf-8?B?L1RPSko0Mkw5MkZ5WVAxQXEwZFdibkRyU25nV3p5U1hFa3d1NHVyaHRWZ3hT?=
 =?utf-8?B?V0lMMEc2a2JhSGFPdkxtRHoyamJ4QUVoei9qdHY1ZUQ2aWlKTTJmb1BSeEJm?=
 =?utf-8?B?TC84UEVqMnQ0ZVB0ZGxmRnBHSGs1dDIrTkIxM0hJcjUxUzZ1ZmNkblh5ZUtF?=
 =?utf-8?B?bW1rVkM3RTM1bzArZkpDVllkRFhCOW14M0FCVlpxVXJ0MUQzUmN2Nnp0V1d5?=
 =?utf-8?B?cmxBOUZ1R1JuR3hNVDduSG9tTnNNS0xlRWZ2bmUrbENKanNOSWE2bHpOdjFF?=
 =?utf-8?B?VG1vcXlpc1hzMWVWU0drK20zb2lad2xXNDhvZ05BYmpMT2NWMzdBS2tISFhC?=
 =?utf-8?B?bFhQL0NEdDhzU21Ta1d1cHB3dkIyemxZaTY5b0hWVklBSXFHWlhpb0U4a1lL?=
 =?utf-8?B?UHZJNk12Q0FaMDU2M25UV2ZRQzVzcURRTm5sSS9aR1RKNU5nZWk3SGhwQjUr?=
 =?utf-8?B?a0M2MmFpd3NrbUw1TW1IcnE3MG1Id09RY2hCQm10dTJOTWNEc1ZZaGdRNXFW?=
 =?utf-8?B?OW8zeXI2WC9pZXdqQzhnK2llVm92bnZzL0VyK29INWVCQkZEekxOUkJNVlBJ?=
 =?utf-8?B?Zk9pZnYzemRhZXdGemt6bGRBSXJ0S3BHdyt3eGx6ZXp2amxsZmxMZTlMbW5G?=
 =?utf-8?B?R2d1ZG1Bbm8yVGt0MWhYNjR0Yjgva1h0bUhndzlhN1JFY2pNRkNRbEU2T2NQ?=
 =?utf-8?B?aXJCZXoyTy83Q2RVdGc3ZytRQnA1bDlrUlhEVXZXUUI3cndObGNzdXcwTEJS?=
 =?utf-8?B?cnI0TmVoQ1B2b1JXZFM3dHhmNVduSHdlQmJTbXUrTzNZYjRkOTZYam0rMUU3?=
 =?utf-8?B?ZVFrVEFhM3l2UXhvMTUwVmFIM2JGdkZxTkRJYlp1TTV3MWExOGFmYWpXMlNR?=
 =?utf-8?B?UmEzektwMmhLVmJvMTBRM2c5Z2U5UWJWSm5lZ1VTcGEzZmdSOHdHRkdEbjRJ?=
 =?utf-8?B?VE0vNTlsK3YrMVRkNFkwNG8wdmdtMWN6c1ZvSVFKL3hBRm85d0dUZXZ3aUlJ?=
 =?utf-8?B?a2lrWjI4SXZLQVkvekw5Ujk1Z2RJdm1ZaTBiWkY1ODg4L1ovelhDdkM0UEEr?=
 =?utf-8?B?TDZ2REN6QkppUFBzaVpmTmRjS1R5Z1grdWYvWVBrWUJhL2Q4ZndxVEt0Vm5G?=
 =?utf-8?B?aWZxZzZqbkpSV0xGV2RqQWdPWEtVa1JLNlIxMTVUcjF3MzlSQlpSbWJDZXZ6?=
 =?utf-8?B?VEF2aDNTeXpKNGQrOVRyU09QZ3dIeEljakZBMWczM1RTb1k1UWZLTEh0UExo?=
 =?utf-8?B?bUlnVlJYRWNQOTBBdWQ4b3ZQMm9VOXZpTFQ3OWpna1VhZWN6bXlJUFJqYVVm?=
 =?utf-8?B?dHZ2ZTFUSGZnK0EralpPL2VQZjV0NlY2cUlVS25YWWRmalpURENJamdGemU4?=
 =?utf-8?B?d3lDSWhYTHVmbFBiTXhKTTBGbnpjcTlvbHBxbUllYzNaTnJuU0tBSmlJN3Fk?=
 =?utf-8?B?dVVCR1FxYlBRYUxySjlZMjZudEd1U3V0cENDTzZVeVdFVXIxNFpNdGVFaGNH?=
 =?utf-8?B?Vm1Xa1VBZWFRakc0TXI2Skh2WG1nQTR3M09PSlVzVTJocEdpdzJxZm5Cc0Yr?=
 =?utf-8?B?ZTk4RkRZbjdKOG81SGltZjdvT2JPWFV4SFl1Q1pxWW5kU0Jlc3NVZFoveGZT?=
 =?utf-8?B?SGN6SG4rbXdKZE5RRWp3TTJSU1E3c0FiOGZoTTM0dXdRYkpYcURlNGFES1Y3?=
 =?utf-8?Q?LC7n3AFYP8gRvDT9MkehJlhHu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5102c12a-13ca-4712-3824-08dbd53fba94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:49:49.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlegvnKG2rkYvwkkAt9YBQ2PUJd8CeWNScTvL8YxPvB+CiSLleRRmQo83KERMeSdhn6WrUoLWKVtt32WubgPTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183

On 25.10.2023 11:35, Michal Orzel wrote:
> 
> 
> On 25/10/2023 11:26, Jan Beulich wrote:
>>
>>
>> On 25.10.2023 11:21, Michal Orzel wrote:
>>> On 25/10/2023 11:10, Jan Beulich wrote:
>>>> On 25.10.2023 10:28, Michal Orzel wrote:
>>>>> At the moment, in order to use a different defconfig target than default,
>>>>> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
>>>>> Switch to weak assignment, so that it can be also obtained from
>>>>> environment similar to other KCONFIG/KBUILD variables.
>>>>>
>>>>> This change will activate the use of KBUILD_DEFCONFIG variable in CI
>>>>> build jobs that so far had no effect.
>>>>
>>>> I'm certainly okay with the change, but the above sentence looks misleading
>>>> to me: Yes, the envvar was ignored so far, but isn't it the case that the
>>>> envvar as specified in CI matches what Makefile set it to (taking into
>>>> account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
>>>> hence the specifications in build.yaml could be dropped (until such time
>>>> where truly an override was intended)?
>>> Well, today riscv64_defconfig matches tiny64_defconfig but it can change. Otherwise, why
>>> would we need to have 2 identical files? Looking at the latest full build series from Oleksi,
>>> only the tiny64_defconfig file gets updated which would be the clear indication that what is
>>> specified in the CI matches the author's expectation.
>>>
>>> Also, I never mentioned that this change fixes something. I just wrote that it gives a meaning
>>> to a variable that so far had no effect.
>>
>> Well, sure, but if you e.g. said "... that so far would have had no effect
>> if they didn't match the default anyway", things would have been unambiguous.
> Ok, I can see you did not provide any tag in which case I will wait for other's feedback.
> Then, I can either respin the patch adding sentence you suggested or leave it to Stefano
> to do when committing to his for-4.19 branch.

The reason I didn't offer A-b (yet) is that with the given description plus
the claim on Matrix by someone that things don't work because of this
override not working, it wasn't really clear to me whether that claim was
wrong, or whether my view of the situation is. In the latter case I could
hardly ack the patch, as that would then mean I'd ack something I don't
understand. Provided there really has not been any breakage so far because
of this, feel free to add
Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with the slightly adjusted description.

Jan

