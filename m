Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481336EAA52
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 14:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524566.815599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pppoY-0004QH-4O; Fri, 21 Apr 2023 12:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524566.815599; Fri, 21 Apr 2023 12:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pppoY-0004OJ-1g; Fri, 21 Apr 2023 12:24:34 +0000
Received: by outflank-mailman (input) for mailman id 524566;
 Fri, 21 Apr 2023 12:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pppoW-0004OD-Oa
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 12:24:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76abb505-e03f-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 14:24:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9679.eurprd04.prod.outlook.com (2603:10a6:102:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 12:24:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 12:24:27 +0000
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
X-Inumbo-ID: 76abb505-e03f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1SPoFGn2WeK0Cz7oLBj/6kaB62Hm6Fxg8m4RCzgyiozrK2ytanqbFQvKiSuktCsyiZ6EExSqcEnYefjxGGJ+at5p07O44EQ9TCmX5yrfn/F8oYJaDffPU/dtBkzTESwbdJRvDnfvN1E0BQQKS90+aw3u6luiin48ETa3VoiSsY5VoRG4mYsMWEohH85f1XR/BX/zwwrnM2VApuRQJHv57Tp5kd+RuZDcM+Q/eiKJruF3vVFCncixs/53xZjty7yvfvUsT+wGFWzhOL0fseOC/k9cS59VSfjYeirumVm1jdiSb/SMqeRMjERSfXq0CvPZS5WsZFvbTNYCJvJrXlhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc5xUyGW06UDfQIBCdqwAH+qHYdibFuKOlXfBc/eo4M=;
 b=QS8Ec9osC7sKxrAv+sIUjvIwtcQHCxGDtvyKgETbHt5vBZpdMRd4+C0zx9McxZWQc/4qSaKQrRn6vRIDodNz8CInC2qfmwPTOMFkxkdS61xgkpPVNlEfZpPPz9/FgZ6guhnWQniqgNyMweekqnu02BW+7qzQVDIPhmJV/6YL+RlB0Q9gIUZ95+EAWUkmt+Z8/gsx6OazV1ZbvVm/m2NjUYi9R3kcBz/bOzg8vdApJQZKQHCjIf3oBD5FpxVDeFcuEoWOAtW+lXXzaohZiErknVOLTXVUDXvRxP6rAp6mlgKTM8VbjslpyZjt+Z5U4ZASKx1lw8A1rAH70Tx2LZLNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc5xUyGW06UDfQIBCdqwAH+qHYdibFuKOlXfBc/eo4M=;
 b=CYcQKX+p25C0elRP/foGKxVeGHFRODTV/JTJ73uzdMYdPrDaLn49yf6KBhVKsd+vIXaWzsvytF8Ilj4MN4npYUJouwGlgdTwGsWt88XwliSh7TBHMu3JXfNrnOnMH1UJm58rU2pAPpWa0ihiPabWdihtnFNS0tl/glLMynpOtLCZO2ZPmYpls7uKIVGULJOi7eblbCVMdQDAfuoLzefHlbgButNabpJ3BRxEwiDn43eufj8yRs6bK8SQ7h2b1SbMl/NPN8lHaEk88dUr1tHT5W5o1sgtYoRTT27wmpx2ntueQDwJbth44Y56CY87et5n/Vul5g7xaV8lmSZILJTSQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9ab412f-b1d1-3fef-a956-05373ce76dd2@suse.com>
Date: Fri, 21 Apr 2023 14:24:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87354t8pqg.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3859da-8b01-487e-1314-08db4263592e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kigICMQy41musVPSHS0l0vlOqJocVhqgEjRhVUX5HCVlJED6X4Pzudq5kCVjYTpZFPsbOFgMuT5ZIV1WuNwbcmBxglzhFua9GCieeYYR3upEymDq5HOdBIS3xDIv4UaDySpFkVtwxfB/9zjGlEdJ7yO7KFMj261e2b4S9I+1i2MVBntlxpBDBtcLfxMRPwzNGPWj3n3SOuFry7BxEM+bezrgBr27nyzuGILQfxizyXE4Gi9GO7EDRRHi29bdLok26/2YwovKDQjHvL/QYn2b7fr19lfT9YaqlUqd/DBwx/vK2rfyQ7TJpyLgOEObOr381rvrbtqYhwH1Vzvu0j7+f7R54gSkvUFUUaliBLom69bGx+S2HO++rhFlcL1JXyDg6bLwZioD4si5Ehb1i5TCRkJ/J9L239jFFz+ZR/vrUGXRSX7whJgckhvC95Zqgn9fheGgNSFZNAlhJRYiCbLaWedDSv81kuVNmokXM0bba/W4wOgIShDOj0NIGMCDGmGmkgw0kFjXrVPF39VpujBpZygtTuhY27OnIjhxR/2HxHDYQ9R6kvpD81/l1AYwAhmVjKFMnftxSEPdSQb8KAvLRJ1bV2sXLJ2I80Bc663aqev6a4qYLo0jWzS7IcJk3zckz1iXpG2/JuPzgaXjVVpjUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(66476007)(66556008)(66946007)(316002)(6916009)(6486002)(478600001)(26005)(186003)(4326008)(54906003)(2616005)(6506007)(36756003)(53546011)(86362001)(6512007)(31696002)(38100700002)(83380400001)(8936002)(41300700001)(31686004)(8676002)(7416002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWplYThwTjRDTU5IaHI1VzB4eGxCUlc4UmN3YzhDcWsxQ0xQZHVYb2dBdStY?=
 =?utf-8?B?b3JzRjZxZWpjNytFZzdHWWo1dWlOZlE3VVFkR05tOHhpME1hcGFrZXB1UFJh?=
 =?utf-8?B?R2xoT00vWlo1Zk85ZkJRS0tSU2xHcXh1N0N3U01LQ0NORHZja2ViTkdnM0Rn?=
 =?utf-8?B?SDNodHE1OG56RmRUS05pMTNOeEltNlRBLzNzYTdsYUErYVVNMjQ5Vmg1b2s4?=
 =?utf-8?B?ZGNBNHFoYnB0dndDcE52Z29sbnhKL3MyTFJEM0o1UnZWZFAydTVaaFZkR3N6?=
 =?utf-8?B?THhIeXhBRDRJUzdiRHRMc1k0SVMwSkVIdmJldTNYaS9meGZtb1hmREtLZi9O?=
 =?utf-8?B?L3VqSnFBVjVpZ2ljT0piR2pWMHlNMjJRZUdWY1U0NmlnTTQ2RnNCZ1dDVWpv?=
 =?utf-8?B?SUtuMFFGN2pKQ2tzTFdVelpOUnB2cytEL3VBUXROdUxTWUd5SDZoUFlCY05t?=
 =?utf-8?B?RG1SM25OSy9GSTlvUmo5eTRyY1NTdlJRU1JnT1JadmtRZmRzN1RLZkF4elVQ?=
 =?utf-8?B?OG84czl6aVVMaTdnN2VUMVVGRzk0aWVFSUROK2NpVjlsRmZ3THJ5WGlGQjNL?=
 =?utf-8?B?eXdSTGlFc25ZVExrMWQwdGZ0SU5Ic1l0U29LUERSMkxvTlgwSTBHVUlHaFFR?=
 =?utf-8?B?TzNaM2VrYXF0bWd0YitMQzNaV0VHck05aVZPZjk5QnQrSkF0aWJjaTFZNW9Y?=
 =?utf-8?B?MXZGSGtiei9XSVl3SGJHdmEwcnV2UlMzVVRkYmJtR1VrOW9LUzg3dytmUzMz?=
 =?utf-8?B?aks3bEd5WDhwL3MyYTZHSFN2STZxK2ZqSW5QaXVpZG1nOENIMlh3ZWk3T2Zy?=
 =?utf-8?B?bG1vZThHUTdDcmpyZzh5bUJyZkI5WTFmc0I5c0g3VitNbzJPVVNZdHRQaHU2?=
 =?utf-8?B?cFIxY1lKNkJaVU42NVFHbE1qejZXZ3dJK3lKRGpJaGNVbnBiL3lUUFpRZWs3?=
 =?utf-8?B?N2U2UUZxekU3aXVzV0FGQURuMHRPMFB3aWRzOUJIaEpUN1J2cTdUTmVsTHpi?=
 =?utf-8?B?eGlveFVrOE1BMWZVeERiMGlLd2h4Wmc4KzJ4UlJrbituUHZkVnpyN25tNXI2?=
 =?utf-8?B?bXpzd0ZCMlMvd2U2cUZIbG9LNlFqZ04zRUlNYitMb1lIVkc2ZE1TTFNhZjg4?=
 =?utf-8?B?b2JDb2F3eW54bjN0bWcyZm1TU1l5clVyRzdZa3gzOUNtNFVNZGtzamNiU3VY?=
 =?utf-8?B?aVpyb092Zmtib2p6QkZxeFRJaW9YMlNrRitibTBkQ2dDSzNlNkp6VUdBa0hV?=
 =?utf-8?B?aHNqWGZ0S0Q4MDBsWVRpUEEwaHVVOE9hUDVjN1RuUDlORDJpZE1KYS9sN1ow?=
 =?utf-8?B?YzVpTFNpRUpsZUVnL1JGcjhIL2MxeWRWL0VMWW1wZjFhVHh5b0NQZ0NvVnRR?=
 =?utf-8?B?ZGV3RGplRGVtYStNM05GL24yaTZ6QWRGY1RlZm8rQUdyNExYWjBNS0Z5Ynlh?=
 =?utf-8?B?NURrdWtGbGF1UE0rZkpyaE55RUdUWldaaDU4VGxvS1o1TjluZDd3T2NxaFg3?=
 =?utf-8?B?VVFySGtDZFQwUDZoODRTMENkeWsxczIreWVuT1owTDI5WnZIZ08vNnNFbGtK?=
 =?utf-8?B?b3lPSmp5RExETHBJNWE4TXZWSzRRcWRzZ1RucjY1b0c1WFBQbWVFNU5NSFV4?=
 =?utf-8?B?L1lVWHo0VzJjVU5TdjFmRUcyaDRRTWtnZlIzeVhFSU1vbDJROUJUdmFReDhO?=
 =?utf-8?B?UVl4eGY4TFlVVHBmT28vbmVDNTFadFk0RTFURjVxUnN4bzZDRmpxTUxDeDBH?=
 =?utf-8?B?RVhzSmRIUWR5QlI5ZVR1ejBmY29UejNXQ0VybHQvbnZpdWNmNWdNVm42ZnZv?=
 =?utf-8?B?M25DeUlTV0xpa3NjVis5THRKSXNJQmF6K3RiMWJhalNCcU4wM1VLODdVRks2?=
 =?utf-8?B?bUpNN3Z1a0xGSnBMdWRGSXJSMElRZkZEeXZrNlR4aHE5VVhCSS94M1REU0pu?=
 =?utf-8?B?ZVdTSDFvS3dMQ2cxbU0wOXpWcGtMbFQvQnBCVk0vdjdySmEyeklrandHOWQy?=
 =?utf-8?B?SWZBaHlQWjZDV1BqTno3TWlIMjIzZzFIb2xRczNCMVlsUDZwdkJ1Vmg2Z3RP?=
 =?utf-8?B?eC9KZ2NNTnM1ZFlqdmtPYStzeEcrTWQ1ZjZJdk9NRm5wM2FRWjNTUXB4R2Za?=
 =?utf-8?Q?7Wtez1tK88obxKkOJjbe2Huri?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3859da-8b01-487e-1314-08db4263592e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 12:24:27.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlEN3sZ1IQwYLde2KRADkzXYquC1pHGEi0CXXVeA14HYguWk5rgd3q21vi09jR3uQb53h5mbyZe+KfMH7SIqNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9679

On 21.04.2023 13:00, Volodymyr Babchuk wrote:
> 
> Hello Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
>> On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
>>> On 17.04.2023 12:17, Roger Pau Monné wrote:
>>>> On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
>>>>> Above I have proposed another view on this. I hope, it will work for
>>>>> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
>>>>> after returning from pci_remove_device(). By "harmless" I mean that
>>>>> owners of those refcounts will not try to access the physical PCI
>>>>> device if pci_remove_device() is already finished.
>>>>
>>>> I'm not strictly a maintainer of this piece code, albeit I have an
>>>> opinion.  I will like to also hear Jans opinion, since he is the
>>>> maintainer.
>>>
>>> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
>>> holds a ref is entitled to access the device. As stated before, I see only
>>> two ways of getting things consistent: Either pci_remove_device() is
>>> invoked upon dropping of the last ref,
>>
>> With this approach, what would be the implementation of
>> PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
>> exist and either return 0 or -EBUSY?
>>
> 
> Okay, I am preparing patches with the behavior you proposed. To test it,
> I artificially set refcount to 2 and indeed PHYSDEVOP_manage_pci_remove
> returned -EBUSY, which propagated to the linux driver. Problem is that
> Linux driver can't do anything with this. It just displayed an error
> message and removed device anyways. This is because Linux sends
> PHYSDEVOP_manage_pci_remove in device_remove() call path and there is no
> way to prevent the device removal. So, admin is not capable to try this
> again.

So maybe Linux'es issuing of the call needs moving elsewhere? Or we need
a new sub-op, such that PHYSDEVOP_manage_pci_remove can remain purely a
last-moment notification?

> As I workaround, I can create hypercall continuation in case if
> pci_remove_device() returns -EBUSY. What is your opinion?

How would that help? You'd then spin perhaps for hours or days ...

Jan

