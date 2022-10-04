Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE35F46FE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415660.660281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkGE-0002Od-I3; Tue, 04 Oct 2022 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415660.660281; Tue, 04 Oct 2022 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkGE-0002Lq-EJ; Tue, 04 Oct 2022 15:55:10 +0000
Received: by outflank-mailman (input) for mailman id 415660;
 Tue, 04 Oct 2022 15:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofkGD-0002Lk-2b
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 15:55:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb25922b-43fc-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 17:55:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 15:55:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 15:55:04 +0000
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
X-Inumbo-ID: eb25922b-43fc-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKX4YI9J0bd1BK9uJaids4Uirzhcl/Qur/DRNhHSb+OgvQBAFTq9jXDV4UGD8wepQ7A1CjLgC6b4UY7c6e047sVJSIdyEWkVtTfIsr+Ibj6cuZEBxNiAQCSLr7qcPNZveQ40ytJi+ahE4XbpJweN6xWDOqySLh+A+zp1mZvYycTIww/nN4WtIjX0Oua15IeBIA5ytfJqLDj3mFbh/RwjANXQseaZyhnRzGSEuumHp5vr7ji9Z1lwtLKow2jrXRCnB6oKzfmU+TJ6kDl3jodly/k3pZql6Y9RkF2KWfx+jVG04j1nuMAWQiyjmfJ8BiUU1qdp62THEIAViO3s3Qe4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0iQhFWJdNyZVsqfBQK6cwL4a7rFakcHBlmdpz5cRQk=;
 b=n3tIkdJjV3WUxofyrmB2Kapl34dg/oc8m0q1yR7ZO4WWIVliVAETqpH7DJnnrfs8JmEAyhB5OCMon4iD+bAxE8l36e06g2694snlOl2mdAOwbcCXHeh3QJXO5tMMgrWR0tyuD8drSR6AOyb8yPLdqHutlv6TOtKQ+vtUdkakpK+krN6bLtyKFZzztJlT8rnqyxf1nyHPMNSuWymQhraMDxHNvdqEohZVstLt4oL6e/aDHaUvv3m+3/jQYHXL7UHR01AXM1xV0zy3GNlLWJ1ikjBgE+NF3RZKQ9/gTIKfdCKPjIGL8SzqhQXOoKCgOV3FGfBd1OcvobwSVu9PpT52zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0iQhFWJdNyZVsqfBQK6cwL4a7rFakcHBlmdpz5cRQk=;
 b=zxyUepKPL16ZdSyiMa3Yv0P0rXEIGuTD1kBt/AT+pP0vPCpTs/MKX1ukRdE4ceffKG/R166+7PwUXrtEeBf+D0Wr/5NImi1xK3zYftenHLN5o1P+Cxpprnj1BS42KadzSia1uAAWtTGokMu838h8KkeiffwJyp2WJsJxnumoBxpx+2wdHzZO5i5CUBRPdh6WSXlDuE6gcEh2s5VtGFqaEhylAijNkgVxHSlLnuWuQelPhXOHOs5SCKBIwevLh1EYNo/Ir34VqeiGFRlafCaoowmHtYDqHT9TZ61TZOBuvR4UKNfphhuP3HVHnPE7aLwrJpC15JjrMI9Syw7sh93oOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1116596-f204-1b30-615a-cc7e84836661@suse.com>
Date: Tue, 4 Oct 2022 17:55:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
 <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
 <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
 <Yzw8t4oECUL6tzNB@Air-de-Roger>
 <0f3d61a9-aeac-0aba-e930-cee80c9232fe@suse.com>
 <YzxPSCXpzjcUmPAO@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzxPSCXpzjcUmPAO@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e5592f-6bd0-4b58-10d1-08daa620cd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67DtY2FLtpEtSlWvYANoKX9duJ4M+ibOktKQ50qLtcvZbeKFLUCLWm97HTRP7YkUs6FipxA481VuhnhppxOsIcD9v8Z0ViUWzc5vCDoKcpS3yBZRXUyAdYsmYRIbwuA/sZEmvU0wSrfmz6KfN3etkZte2lGZ3N7OcRJXMk78EwUK6NxWLY9Iwuj1yXjE1ddqWPuiPecXX+/NsSwdx2Kf0QNyp7p64q3gb8a1ioblSCDwNqUfep8wvYL6OQM59mOXkCDWTS7oEx2exspb9s3RX83xiU1kyovNZWV6APOhZMrWdLPPiD3YhwFO6Cr53chH6ykTV/fg/2JMavzAAx/IvSOYmF9mf5aVTvMwOuCSE63JmVRGoHPfrer2VAEDWg9HprAvXGpPlaVvPKGlhtSepsq2R8XBp+eRjbZC/GfXofxJ6/7+W1Hn5nSmxiFjkpsxl5oASg2Fl6y3qyAD+47c5na76ziEPR15eMNytiBieoaaPYleqR0RI9a3L9W3KUYe8+F5PbnNqThnmGJY80/kEgh3ByMUfH6qoHrEWpi/0Q1unMbtW0OcFeHYTPS7XdlQM2yQtSwNP8U4IZNryJ67RAh6A4bjA97t/WEYTEueh6kJ+1jc2flKwpTlDG1fv6dwWb5xZexHdrLwWNb2J0hlUNdkqw1lUF/jK+8R8Tn5RC3TgsdrNWVATLaqgdH/fHR633393EqXSPpz4k+sAU2hSkM+i1VT/HY5lXZDzWImms1LVDRbzUFgB2G7nqUCyqGUkWiHy4k6WugT3BLcWB9HFiICt/6Xvd4cuSDyT3C7o9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(41300700001)(53546011)(86362001)(38100700002)(6512007)(316002)(31696002)(2906002)(83380400001)(6916009)(186003)(26005)(54906003)(6506007)(66556008)(4326008)(36756003)(8676002)(2616005)(66946007)(6486002)(66476007)(5660300002)(31686004)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFENGpmTHdEQ0RnZW9na2d3emwyOEhrNDY2dlBJRVV6LzJURDdUUGwrcDlV?=
 =?utf-8?B?L1Q4M0dyeGloVDVhcHF3TVoyempxSDRWdDB1bTV5Zm01cjFOd1hmcXBqb3Bp?=
 =?utf-8?B?YmcvQ0cwaE9CQldyQWZ6L2V3b0pKdEhickh0RlN6d3huMDF6aW83N1lzbEE4?=
 =?utf-8?B?THFJVHJlTzkyUmxDZTJtNzZ6L2syc2haYU1vQ2x5SXM1NGswUEdJM2lBYVlC?=
 =?utf-8?B?bTMvcGZYaDVwR2pUU0lJVFVlWnJhVUJicFNFSXJEa2d0Z3NIcVo3dkgvc0hj?=
 =?utf-8?B?c3I5NXl3bTk1Y2RuZHRJaS9seUdKUTJnaTVMdndIQzRlVVc4Tlg5WGx3TkdU?=
 =?utf-8?B?ajZlOWtDZU9tZEp1ZDh6OFR6NTFOYmczSGRWYlZremsrc2YyN2JCMmhOV0RT?=
 =?utf-8?B?NE9mUmQ0d3VzTmFuWWpDUVZuWmtSRExkZW81TEhhc21ISW1PM1BHS2RBT3c5?=
 =?utf-8?B?SEJ0V1MzMGFsOW82SHhybHRUMFBqdGpXSUtOajJhQjFnaFJiM2RzbjVvQTk5?=
 =?utf-8?B?ZHc0SXN1M05wNWhQZTVlM01tQ2ZndjlFdXhsTzMvckcwRW1xYk1ybmpPZjQv?=
 =?utf-8?B?ZzNYNnI5NDBPK1FQQ0N3dFZOT0tESDU4VFRxUk1zdlNBcHVxV01vbUhTREZ6?=
 =?utf-8?B?MUZYUVJDUjNlMForTk5GV2p4TTFrRnpVOFZvb2Z3QVdVMHlObW9KejAvd0dM?=
 =?utf-8?B?d3UwaDMwVDNOYnp1Sm5ZNEZFMFUycXRpVzdRR3loNm94ZWlpZjh4enRtc0tt?=
 =?utf-8?B?TXNNaXFrTDJtcjJHbEladWNzK1UyR09qNVFLVXVqcHhEbHR6dnhyNDY2REVT?=
 =?utf-8?B?VkZCTUZsZjJCUEpLRG1rNzlZM3pidG0zcVZwdWozYUFPbFEzTWM3SmVwU2Fi?=
 =?utf-8?B?YitqQk5NSkUvUVZtU0sydk41aGpMckxmSlhUY3NOR1J1UThFS0lYbm9WbG5H?=
 =?utf-8?B?eFkzdm8zTmd6ZU5QYkd5Mk5IT0ZJM3hCTjk3YVBnRVpVdzJPSFcyckx2Q3Fu?=
 =?utf-8?B?Y2VkWUoyZG5ETStocDUrRzhnNlFqMGg5anE4Y1F3aTdkSFBwZWJsdVVVRXBB?=
 =?utf-8?B?SmpiWjJNdElyTnNvL0FKdEJiQmhleVduUERGaDhFOTJ3dmpqMWZRSEVBVXBs?=
 =?utf-8?B?ZjR2KzVpeDFCV1o5b2srdHF0NloyZWdpaUo5OHFmRzlId3Vrc1ViME5Lcklq?=
 =?utf-8?B?eXFJUUtYdmNCQys1RlF3UktIVkZzNHFUL0t2YXFuT0F2NmZKYnFIQTVNRTVz?=
 =?utf-8?B?amR3Z3ZCRUtaazNRNTk0WWVEcUVWckl0VUI0RFFTRVRFNS9rSUh6SXU5TUh0?=
 =?utf-8?B?Sno4WFhFVkhNYnRGRmUyWXlsNmhkQmV1NFo2dWNNY1lhdnpyZWJSczhnUk5R?=
 =?utf-8?B?SUJwMnhnc0hudHc3cFdvVGNVOUZGTnBvK1BvbmpCNm1salpwVS9CQTZObkZw?=
 =?utf-8?B?eEpNeTQ4a0VEekpqL0VVR3hvRTZaWmp5am9JYXd4TXVlRk16V3liOEZhVmJr?=
 =?utf-8?B?allsNXFBU25iUy96Q1dRNnJiNFdqM1NXQVNPbURxS0lKSXBuK2Q2V0NhQ2lJ?=
 =?utf-8?B?cUpJQlZHNGpIb2F1bkFwOFRLQnZiUTZoV044R043ZU43R010bDVnM3hHdXl0?=
 =?utf-8?B?SnVDUXlObjV1aS9VYkpUTmd1ODRaNUZHTHpFTFBYaWUrTDB0aEtwZUoyM1Fr?=
 =?utf-8?B?UmdkbmJlUnp2eEdhVjYrcXlpL3FiaEJwZVZqM1FrOHVac2svMXpaeXI3UGlL?=
 =?utf-8?B?WWFuTkJkNks4RTZ2QWdMUElkOUxnWUxCSzBFcTQxSUVtSE1ER2g0UzcySkRu?=
 =?utf-8?B?dENyRnoyOW9sUXNlbXNRYm9kcldVN29DSWVML084Z01qQXFwOVR6RTVzdXFD?=
 =?utf-8?B?UC84NXJkVy9JZ08ySWJDWWY4eEJybDRMeS81ZU1KMlNkTlhGcTMvYXRWVzd2?=
 =?utf-8?B?WTIwSVpuNVBTMFVNZzFkcXV0Y1JlNSttSDhyMjhjdmtGWUNadGhVZUVEV3JU?=
 =?utf-8?B?VytYVjVIeFAwK1pvaTFHeTgwYWdlb0JFR2V0UlQvcVJYUjJwZjE3Mk44YmtQ?=
 =?utf-8?B?cEVRaFRyeGVzdS9ZckRaMVBhRFRiUVlZZjFYTkd2MXNDZUZFbzJnT3ltNk13?=
 =?utf-8?Q?WWBzghXUlBahpPcuuYQ4pWxSU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e5592f-6bd0-4b58-10d1-08daa620cd81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 15:55:04.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWfkPFIDeBqu2b2DzviE4juwHbZ1JoWCxGlgkGpdLbsAZYS4tkUk5k8virFXBt/fkOXfhvbxE+GGkaOoKxrv3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

On 04.10.2022 17:20, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 04:39:26PM +0200, Jan Beulich wrote:
>> On 04.10.2022 16:01, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 03:10:57PM +0200, Jan Beulich wrote:
>>>> On 04.10.2022 14:52, Roger Pau Monné wrote:
>>>>> On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
>>>>>> On 04.10.2022 12:54, Roger Pau Monné wrote:
>>>>>>> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
>>>>>>>> On 04.10.2022 12:38, Roger Pau Monné wrote:
>>>>>>>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
>>>>>>>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>>>>>>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>>>>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>>>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>>>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>>>>>>>>>> runtime which was re-used for other purposes, make
>>>>>>>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>>>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>>>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>>>>>>>>
>>>>>>>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>>>>>>>>>> dom0 doesn't try to use it either?
>>>>>>>>>>>>
>>>>>>>>>>>> I'm afraid I don't understand the questions. Not the least because I
>>>>>>>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>>>>>>>>>>
>>>>>>>>>>> Sorry, let me try again:
>>>>>>>>>>>
>>>>>>>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>>>>>>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>>>>>>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>>>>>>>>>> overwriting the data needed for runtime services?
>>>>>>>>>>
>>>>>>>>>> How would Dom0 go about doing so? It has no control over what we hand
>>>>>>>>>> to the page allocator - it can only free pages which were actually
>>>>>>>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
>>>>>>>>>> DomIO - Dom0 can map and access them, but it cannot free them.
>>>>>>>>>
>>>>>>>>> Maybe I'm very confused, but what about dom0 overwriting the data
>>>>>>>>> there, won't it cause issues to runtime services?
>>>>>>>>
>>>>>>>> If it overwrites it, of course there are going to be issues. Just like
>>>>>>>> there are going to be problems from anything else Dom0 does wrong.
>>>>>>>
>>>>>>> But would dom0 know it's doing something wrong?
>>>>>>
>>>>>> Yes. Please also see my reply to Andrew.
>>>>>>
>>>>>>> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
>>>>>>> know it's required by EFI runtime services, and dom0 could
>>>>>>> legitimately overwrite the region once it considers all ACPI parsing
>>>>>>> done from it's side.
>>>>>>
>>>>>> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
>>>>>> only appear in the machine E820. In how far PVH Dom0 might need to take
>>>>>> special care I can't tell right now (but at least for kexec purposes I
>>>>>> expect Linux isn't going to recycle E820_ACPI regions even going forward).
>>>>>
>>>>> Even if unlikely, couldn't some dom0 OS look at the machine map after
>>>>> processing ACPI and just decide to overwrite the ACPI regions?
>>>>>
>>>>> Not that it's useful from an OS PoV, but also we have no statement
>>>>> saying that E820_ACPI in the machine memory map shouldn't be
>>>>> overwritten.
>>>>
>>>> There are many things we have no statements for, yet we imply certain
>>>> behavior or restrictions. The machine memory map, imo, clearly isn't
>>>> intended for this kind of use.
>>>
>>> There isn't much I can say then.  I do feel we are creating rules out
>>> of thin air.
>>>
>>> I do think the commit message should mention that we rely on dom0 not
>>> overwriting the data in the E820_ACPI regions on the machine memory
>>> map.
>>
>> Hmm, am I getting it right that you think I need to add further
>> justification for a change I'm _not_ making?
> 
> In the commit message you explicitly mentioned 'we don't actually
> "reclaim" E820_ACPI memory' and I assumed that "we" in the sentence to
> only include Xen.  Now I see that the "we" there seems to include both
> Xen and the dom0 kernel.  This wasn't clear to me at first sight.

It was clear, actually, as I did mean Xen alone. It didn't even occur to
me that one could consider Dom0 potentially trying to do so.

>> And which, if we wanted
>> to change our behavior, would require a similar change (or perhaps a
>> change elsewhere) in E820 (i.e. non-EFI) handling?
> 
> Why would that be required?

Because if EFI can (ab)use that type for other purposes, why couldn't
legacy firmware, too?

> Without EFI dom0 should be fine in overwriting (some?) of the data in
> E820_ACPI regions once it's finished with all ACPI processing, as a
> region of type E820_ACPI is reclaimable and Xen won't try to access it
> once handled to dom0.
> 
>> The modification
>> I'm making is solely towards Xen's internal memory management. I'm
>> really having a hard time seeing how commenting on expected Dom0
>> behavior would fit here
> 
> The type in the e820 memory map also gets propagated to dom0 in the
> machine memory map hypercall, so it can have effect outside of Xen
> itself.

If used beyond the very limited intended purposes, yes.

>> (leaving aside that I'm still puzzled by both
>> you and Andrew thinking that there's any whatsoever remote indication
>> anywhere that Dom0 recycling E820_ACPI could be an okay thing in a PV
>> Dom0 kernel). The more that marking EfiACPIReclaimMemory anything
>> other than E820_ACPI might, as iirc you did say yourself, also confuse
>> e.g. the ACPI subsystem of Dom0's kernel.
> 
> Indeed.  There's no good way to convert a region of type
> EfiACPIReclaimMemory that has the EFI_MEMORY_RUNTIME attribute set, as
> there's no mapping to an e820 type.
> 
> One of the quirks of trying to retrofit an EFI memory map into e820
> format.
> 
>> But well, would extending that sentence to "While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
>> to do so, bypassing Xen's memory management), hence that type's
>> handling can be left alone" satisfy your request?
> 
> I think that would indeed make it clearer.

Okay, I'll make the adjustment then and submit a v2. This will now need
an ack also by Henry anyway.

Jan

