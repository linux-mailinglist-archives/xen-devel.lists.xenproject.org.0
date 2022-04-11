Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E64FB387
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 08:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302667.516353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnL5-0006CM-NX; Mon, 11 Apr 2022 06:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302667.516353; Mon, 11 Apr 2022 06:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnL5-000691-Iv; Mon, 11 Apr 2022 06:15:51 +0000
Received: by outflank-mailman (input) for mailman id 302667;
 Mon, 11 Apr 2022 06:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndnL4-00068v-NC
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 06:15:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d408ee8e-b95e-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 08:15:49 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-0EpmkAz-O-OLElXlwJat7w-1; Mon, 11 Apr 2022 08:15:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6028.eurprd04.prod.outlook.com (2603:10a6:10:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 06:15:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 06:15:41 +0000
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
X-Inumbo-ID: d408ee8e-b95e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649657747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbcuE8hErk8FPmN2zoC2Xhidq+fToGy3rZu/qu2qBiY=;
	b=KZhv1TE0WJK7rT+bpJJ8JP9Cvu9hsvjAC4HD/k8+7UAqO1jFqpLUzupROU+kJiGPPb8reT
	63FDPufxTppLTTcJnHOD3z5Nh+mLbX5hkKsXmhUHdJLaMipLjHkuiR8/IOjO8Rxza2Nvk0
	5E+rIK09pCG8QuxnFsh19CxCVm6gOCk=
X-MC-Unique: 0EpmkAz-O-OLElXlwJat7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiW60APXS7x65nMRimkgTDHLFCR0BIn2sMbP+EGGfvaahgvK9rogF7aeZaYcygJGwMYAAAFsRUkZeBSXCStPQouNszh6OLwrstys2yXFI1r0Hxcmz+JJPNwOFitpZUFb/paeFGL38VkKVrtKvEXZK+ONfap7rP61HUt9HM4UxJLRnWMvAfCnkbvJi5+5g3BXBKe1omh/4v/KxbOhIUh2w2H0wgakq2DCqJrW8mrPx34dxdI+kY8v4nsKWREHETJeyXK9z+QpT9/4jwXDK3DAxfGD7xiHVtUmUfPTNvShV34FanJutYn+DOyBGZhmmO4c3JmdpCJoeeO9GgNdu7qsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbcuE8hErk8FPmN2zoC2Xhidq+fToGy3rZu/qu2qBiY=;
 b=n0UgBG1BMtw852P4VfuzIXkR9HRxxH2zatojTcrdkhD9TTee2NigGss92i7JCol2v/i4VkVuqxC/jDKE550hw5wQjj77vUKRfJMc9lsEqKbknuxMYRADEWgS0VR0I8/UOYRCtoYulFn0fGkFF5FeUQw6Pb813USREv4CnGsjR+FADsLbsu2JgZgoShUINUWTLdAK/Riv7GbABiRy9LZEArYAij9rPjH7zQdruSY/A50goRB49g9zn5u/3K6R/Kose2Z6+Zh/6ounciJXPQ2bqRxjwEj6bpfPrSLPTSKERHwl7TEvR2x2qo1ojDsrtOKFPtrYs/0YERXOICe4aQF2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1be2f46c-700b-6af1-a74a-d090196c9f5f@suse.com>
Date: Mon, 11 Apr 2022 08:15:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
 <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
 <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af332d19-f588-4a3f-bd43-08da1b82b49f
X-MS-TrafficTypeDiagnostic: DBBPR04MB6028:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB602817368933F7A3D83EBAC4B3EA9@DBBPR04MB6028.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0v/BM498ddwcT9TdkXUc3q8sGFII5htTVBTwTURhynu8sCX1gqFmz6qUKDy1cdohmUxC/5jGDgJj8EBb66rdUMAlau7hPUl/JZZ0tCPGQGXcsQeZWgrTLOlH5cx4bdKf66fPLoMrgzteseq9A2EuKLwef+QaYbTDjwzueuT5xVIzEb+ghvEDSqrVasD3yFkiBJ6PAAQdU3PxxvM6G4z2q2ZLGyYD/x33jElFYdxIphsei4ohG5zhzdpQ3I0H//OwnPFh3GARmNVlxyDA4SLQgINkYEDv8U7mGx5REce7jZuTM7s4YaP47frUhtE0xYFysTlTyLdMa2skeic0vx+02o2BxhqjK1cgxZRqjiO8H5dL3/ShpdA03ziM0bWOnCGDBY7nwdYbJ0lX3cp/5ntc3Shlyrqnvbh+516ASUNVlQsIV6EwI/1Gwh3rsZ/ZKiNG8gYvO1OjjKapEpPJHhDZWIA9sSikz6FAGK6RV0pYFf4eC+xerkwDsJJhqMrvOIrTQk3sAercEXu+wbtnzTpFGHkcgCwIo6jBdZs8mRS1ArL/LJUuSQjvQr/nIudxNvF00lumvoky3phQ5/ssq4L4UjrJo/X7ukIobvgxzu88Yjdeg05yXNe26S7+Y+exca8G7TJUsjrBJeMI099SQMNsfQ6e3s1gMIvdqPBhVHw5chcw2qUmN0ErM5vNAwYurJtCPrcA0FIRovJFc0iiMy2uji6bOt4CGz1cZYdpkyAKhIxP4x/O7XvlQ5h+plbiidwj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(316002)(31686004)(31696002)(86362001)(186003)(6512007)(83380400001)(36756003)(26005)(7416002)(38100700002)(6916009)(54906003)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(2906002)(2616005)(508600001)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVYMVQ1eUorbGxpMzJnOWZtc1ppS3d4aFVtbjNReHVBcjdKSmhiSmZYV1M0?=
 =?utf-8?B?OTVyMmlZZkJqYnUzcGJ5WHRXdTZuc2dpbis5cEZSczQ0SHcwWjM3OEpEcUla?=
 =?utf-8?B?eVAxdENtdWNBTVNMRURORDQ0MUc1cXp2blRhUzc5WS8rR0ZKZTlOMms1VUhs?=
 =?utf-8?B?TEpLbmJ5NFFwTk9QY1hydnV2Ujc5RDVrZUlicnRaaGt1NkI0R1N3MnZuRjhr?=
 =?utf-8?B?bUpVU2p5T3g2dWVPdkF6MThITlc2MTQ3aklmZ2xrMndPdWV3Y29Va3krTTJH?=
 =?utf-8?B?RzBaR2x3V0VKVEFYOE1DeTZBSnUralhLZW8zeTRGSzRuWGw2aWJWMElxaS9u?=
 =?utf-8?B?aHpRM2hhcTMzSVQ4Y08vUEw3RTc2S2JXUkFuSDNMVnJBREdOWlNqaG5zWXMz?=
 =?utf-8?B?QVlqZWViZnpMSHRKSlVvOTJvUjJWM0ZWS0E5YVZFT0EvUkcrZG5SeFBHU2M1?=
 =?utf-8?B?RzYyN2JhK3RtbElGMDkzbW1WUi9ObzdaeG1aSTY2S2xZMVNyZ2V6c1FpcGl6?=
 =?utf-8?B?VjNPcG9HREo4d1BOcGo2UnZNbE8vMzJIRjNoa08wRzg5WHNqQm1pUVhTNU1j?=
 =?utf-8?B?U3MxUEhjeFgzZmp2MWw1OW5RN0NlQitqRXNwQWg0MFdHWjZ2OWtlV2wvRmVE?=
 =?utf-8?B?TTkwV2YzdDFNRjhBNUg5VnpCZFJrbVV0TVhESThlQ0NaalZzcjR3S3d1Tk1Y?=
 =?utf-8?B?RWNLSlpUQjFSazM0RzVDUjc2Smh1YStaQ2lmSEsvVWFCY1NwMUhDTDFjM0ts?=
 =?utf-8?B?MkVuUXRrU1R2cGZpUjRnZkg3L2pXTVBDOERjVU15UUpKK1FVaW9ORGhSUnRO?=
 =?utf-8?B?RFFxdUw1bmd1cEQ2ZE9MQUVLZEZDYVZZU2xCcXZFWEJmaWc3bzFUdlhDNXd1?=
 =?utf-8?B?VEFCWVlHc09CczNVT0RjUlJHa2IvTWVMNVdaSlJxdTZ1V0UyeUN4RHA4RjBH?=
 =?utf-8?B?L3FBTm5ubURHNnRvbVJuSU9vVitoSHZ5dWFoRWVWMU9zUlRyZDNBZG9mNGlZ?=
 =?utf-8?B?OHRFVGxJSVc0VmtEYXFKZTBxcWY1WEVwbGRGbkVCUktrejFhNzdVaDhMdVBp?=
 =?utf-8?B?V1RLYmk5RzRpajlFWkpHVXBtWDdnTzhxWk9jVzhmNEhvUHVvdW8wL3YzbFNW?=
 =?utf-8?B?akpFUzhXWjRxRjMyRkJ3VVp6TnFDQ1FURS9Dc3NYU3dlNkxxN01aODUzSUVQ?=
 =?utf-8?B?ZFFKelZYZjJRdU4wc05SMEswRTRvN2dydExHLzk3ZUpzWVVmYStQOSsrRi9i?=
 =?utf-8?B?d0JqSC9McTdKVE1OVHlaK1hlcjF6VmVCMDhnUzN6Z2xMeHhpK0Uzd2ZiM3Ar?=
 =?utf-8?B?SmNtV290NFhIdmZWUTRDcVIrTFdEenBRZEZVWVNmTm9SL3A5d0VEc09GeCtY?=
 =?utf-8?B?K2NFRmxLRDVqMURKb1h4Q2Q2aWtxc3hUMjJwUlgyNlR6aVFFQnJTdWE1c0J3?=
 =?utf-8?B?dU5nRk1ocTJpZmNVd282VGlQcWhrNnE5bGp5ZHZSVnY4c09qTjh6K3dnZi96?=
 =?utf-8?B?dkZ3VmxoMk9qbmQvbEdLYmFKV2ZCUGJLdGZNV1dFRGtSb01vbCt4TkcxN1lj?=
 =?utf-8?B?MEI2ZmRuNEdvOXdBSkd6YzdUOGRpRndWNmdVSkJ4SzZnQjM3b0FnL0VWaUw0?=
 =?utf-8?B?WXRDT200TVFQRVY5UUJZOUtBZUJKUkpoMjczWGpnem5TNHl0YnZaK21BeU8w?=
 =?utf-8?B?Umd5MXhndGpieFJYSWpNd0dKZEdLTmpRdllxcXJocStzcy9ia1ZROHhTdEYy?=
 =?utf-8?B?SUVKL1g0cWdyVk5aUk9tM0NSWEowQWNaU1U0dWpQampPSWszZmxha0RuRmRO?=
 =?utf-8?B?WjZSRjk0YWRrbEVRdDA4SHVuL0JPUGVNeVJFaEtPZkFmMFZOYUFoSWIwVGhx?=
 =?utf-8?B?RlZBZ3JlMDhqTnJpYmhqSUIzYTRKMlE4bXlwK1NzUlZOK1E5VitiM241bTdt?=
 =?utf-8?B?YlZxTDUzMWRicnhtelpiOEhPT2hMYWdBSmFZUmdBY25LbndMelMvSXlkeXJP?=
 =?utf-8?B?RGxaQ2o5UEEwdnNGbG9CYnVCak1JNm85UE1qekNJREVXVHFUSGI2dmpZcVI4?=
 =?utf-8?B?R3ptSmhNVlY2UDMrTk9rVDMvWTh4MUJVN2ZrZlVSTEMrNDRWSi85Z2NWTGNT?=
 =?utf-8?B?bFc0UlBDekhBVzIyYUhtUGppVCtEQ1dXbzFYcDJMSnJhZHhMcXdFdG5GUjRl?=
 =?utf-8?B?bGprWmJiaFNoTkNJVzBlU2xGS3BZQ3lPSVhFU1RCNHplajVXbWYvdGdsaVZy?=
 =?utf-8?B?eGFZMzVKYzIrR2tXbmlzdUcxamw1NVdCS1BRVGhwYVBvQlB2MGd2VHNRSE1i?=
 =?utf-8?B?NWRNSHljdGhYMU10Q3M3TktVUGhXdnFjNlhHSWFqQWJXV2VBckRwdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af332d19-f588-4a3f-bd43-08da1b82b49f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 06:15:41.7662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SRdU2or/dnCwDmDC4fFmzwD24HN5rnre2cQ/l2tz2PJ6FZPHkQFzwz19EQ14M6FporTcKgh7cX7EAbqt06DiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6028

On 08.04.2022 22:25, Stefano Stabellini wrote:
> On Fri, 8 Apr 2022, Jan Beulich wrote:
>> On 08.04.2022 13:37, Luca Fancellu wrote:
>>>
>>>
>>>> On 8 Apr 2022, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>>>> ---
>>>>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>>>>> xen/arch/arm/include/asm/smp.h         |   3 +
>>>>> xen/common/Kconfig                     |   7 +
>>>>> xen/common/Makefile                    |   1 +
>>>>> xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
>>>>> xen/common/sched/cpupool.c             |  12 +-
>>>>> xen/include/xen/sched.h                |  14 ++
>>>>> 7 files changed, 383 insertions(+), 1 deletion(-)
>>>>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>>>>> create mode 100644 xen/common/boot_cpupools.c
>>>>
>>>> Under whose maintainership is the new file to fall? Without an
>>>> addition to ./MAINTAINERS and without the file being placed in
>>>> xen/common/sched/, it'll be REST maintainers, which I think would
>>>> better be avoided. Would it perhaps make sense to have this as
>>>> xen/common/sched/boot.c, allowing other boot-only code to
>>>> potentially be moved there over time? This would then also avoid
>>>> me asking about the underscore in the file name: Underscores are
>>>> a somewhat artificial thing for use in places where dashes can't
>>>> be used. Yet in the file system dashes are fine, and dashes are
>>>> (slightly) easier to type.
>>>>
>>>
>>> Ok I can put the new file under xen/common/sched/ as boot.c, should this new
>>> file be under this section?
>>>
>>> CPU POOLS
>>> M:  Juergen Gross <jgross@suse.com>
>>> M:  Dario Faggioli <dfaggioli@suse.com>
>>> S:  Supported
>>> F:  xen/common/sched/cpupool.c
>>> + F:  xen/common/sched/boot.c
>>
>> If it's to hold general scheduler code (which this shorter name would
>> suggest), it shouldn't need any change to ./MAINTAINERS as the
>> scheduler section would already cover it then. If it was to remain
>> CPU-pools-specific, then you'd need to stick to the longer name and
>> put it in the section you have reproduced above.
> 
> In my opinion it is best if the maintenance of boot_cpupools.c falls
> under "CPU POOLS". Luca, you can retain my reviewed-by when you add
> the change to MAINTAINERS or rename the file.

Yet even then, with cpupools.c living in sched/, ...

> I don't have an opinion if it should be called
> xen/common/boot_cpupools.c or xen/common/boot-cpupools.c
> 

... this one may want living there are well.

Jan


