Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DF469AB4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239206.414598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFZg-00080i-N7; Mon, 06 Dec 2021 15:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239206.414598; Mon, 06 Dec 2021 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFZg-0007yn-K6; Mon, 06 Dec 2021 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 239206;
 Mon, 06 Dec 2021 15:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFZf-0007yh-Cd
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:06:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c40170a-56a6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:06:38 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-DJWBKCHHMsanzmJlQdhJAQ-1; Mon, 06 Dec 2021 16:06:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 15:06:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:06:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:206:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Mon, 6 Dec 2021 15:06:34 +0000
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
X-Inumbo-ID: 1c40170a-56a6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638803197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+G1ETFJKAA319VUsgzTu4AQUFm6aAXLHCeMOry6wIk=;
	b=FoAkxpHXfl4ffR2bRYh9QzTQCrJiBWOUPmZ4tnZE4rxvN4mOUnaYMBxR55e9ZUbdml+QZd
	PSq+xfH7EVL+UhvHlzVzkkWM4CGWQ3koEGf2LHcjEvNmlh8lVGsg0qz59ZWEJY53i+Aj0H
	g+CKLG2cHU0EVHG32NP3nOVwlKfh1wM=
X-MC-Unique: DJWBKCHHMsanzmJlQdhJAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csB/0wyFwJfFAh+hw1HqOOC4GcfNILJe/TBM7QNjAm/ywuDw68oZyfPZhNYsoAOdhFoi1GvbVOGucfc8g+bSyX1tTn+WgYt8xD+e9Ugou10J90FH+84pV9QTb8cVzvGAbkAzgLvB/VKxCGZiO42t0q3LlyFbDI8vQ65gdKE1rPLAdCLDh0f8zFmfCibW2dGSajMXzvtPn5z4YjHeqcPbe4NrSTCAhn22b6q0+9NlL5lhQs46oAYGeZ74+bj5oSjgnaEcGjZFszU0PwSBJknQNJhubRB2tNhEJxc/6qIniuLAXNj3Q2G1sHl5jA2IG4eSRblei9NwjWHCA8YqHYwQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+G1ETFJKAA319VUsgzTu4AQUFm6aAXLHCeMOry6wIk=;
 b=VkeK8vkXXcYQXV9ctwYIZELKH+KG9UH0G7mydL2r7uBrS4qkC+PGxTOzVA46oYdR16vA50PCJZG63szpZPeYwgeJgZezhJNiPVsa6hM+F3I36tZssBvmUg5XUzVjKCaZk1dXLkjPbKHvz70alvCKPuF1ZdSatk/KSkFsEgrd+zuQ0mPlhebVaibk2WoS/pcyDkN61KC3Jhs8xKIIzbdwuKjLvuWSZkJkyXqXxZKb57CzsrkkWRwpEBDFEHGmUNbiiDyt2K6lfh504Wx9ZgaeyAqs3g2FywgtBq1fndVQmnn9q5mEnj0DOIPq+42ncyNBvJ8kfxJugvXFlYxhvdW5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
Date: Mon, 6 Dec 2021 16:06:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:206:1::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd686d5d-fcb0-4a2e-753c-08d9b8c9fec4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59031E3EB1D046110874B85EB36D9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Rwi92TpZjOlP0ccDt2H4lxzyBGrniFqZVJU9WPVUP/7v8MIPhKJJz1ixK9K94McF9BLKfjD7u5ihyxye2BpSYx2kOiFim4jiih+Ik6PIj4Bm8iWAJGueLcUvIPwP4KY9mHYFfWAIkHiR2SAWBsW1KIaYSn2kXfrZS2KkCGsOufuJ8EvrizThrVAuNcpVKM9KpineQiujtei3oXP01+nUwEuOYAcNSMjYJPJB/qUoU0tWydPIXiKHrYwgMaFB85v04A0NUoClMUzS6Yxas6IXuUT6qHTnJvGlCC3nWY+D089Wj1HRhx0kZk5h7JEusOWuqCTYjE/imUAJMqTISpgK+0q79DaSZiVCQsl+OFW8hyUa5JMAYIe/SnfnShchf53GikBrp73XCUAn4Q6pBoJeAYyDobz4VZ4cOEbgMU0rX0ye+nIR8Lztjgo/vIZzHz/cP0YvZTO/7m2K2HPlqLCoEGNoEJfwnbzdwf4GAHi0gTySiAf0Li4PQzNu0XknGmX5aJxVI6KdVSspdCsSpn4hbOD76W2L7Z6cU0IRhgCxjBo/oazbc11QD2liESfH/Dw4Uo6dscJRLJckiWzB7l1/iY2QuKXRyd92o8cMwBkURD5InPWs7RTKtUAtwD7gvqS349UR662ILoXjZceHo/gRE6Yo+sjWKL0cjsreY6gpI5rISJJLctTypxwAms8QOxD94snkyMiZOehrd8B0x+QzJ7J3Rh/UYrYOP++Pd6oV/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8676002)(66476007)(66946007)(54906003)(86362001)(38100700002)(186003)(53546011)(83380400001)(16576012)(5660300002)(316002)(8936002)(2616005)(4326008)(66556008)(6916009)(36756003)(31696002)(6486002)(956004)(31686004)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0FQK0xqdmVjLzlGeGFaajF0WWc0YWJiMUJEcWpMUVlRTFlGVFpYNko4SnNu?=
 =?utf-8?B?dW1FQjkzVm9QQ1pHNXQ4b0xnR1liR0xnYnI4OWlXbmVuVmtlV2tUVC8vQjRu?=
 =?utf-8?B?ZXVoRU4yZVE2eDBXeWM1VXN2NGxZYzRQSkU3d2JOY0hpdUg1OUlxdXhqWnYy?=
 =?utf-8?B?TmpOZ0NKUzhhWmExaS8ybWpFdFlKdy95ZDJGTUJUYXMreXdqZkg0K1ZTTGFx?=
 =?utf-8?B?VUZreEFaQlI3TVArZVY4dEk2SG5WSWRQTXBvTVc0QVYvTThyTkwvME9zOW0r?=
 =?utf-8?B?Q1puVzNqbkp2cHhpMTJENFFLVFFSRDkwNHo3QUNQdVdaTE9OdExHWm5hVmRk?=
 =?utf-8?B?ZVZkTTBMeVVMOTFsOGdMeWlDdlZqTXRjZmNkOVBDWFppUmp2VzRTaU1BU2tF?=
 =?utf-8?B?Q0F6YVVzWkxwVTBLZ2FTcTkvNkh5SGdCd0dmbkp4UGF1M0toNzhhbjEvSTVY?=
 =?utf-8?B?S1J2a1BaeXpOdTZ6WTY3TWdlODByNk9VaktRMjMydGlXazRtMmhTN09pYy9y?=
 =?utf-8?B?NHNWY3I4UTREYWZ6bGJIOTZ5U3kwK0kvZ2pSbzBWVUlpMEpMVFM2Qm5RVDg0?=
 =?utf-8?B?Q0E5ODNTNHRIc0N1aUdKSWovZlRHZE10eE5BTnQ0c1BGUHpzUHZ6Qm9wZEk3?=
 =?utf-8?B?ZjdzYTdHVnlNMVZaSDVKaHkyanhJbEZLaGVhMnpuWnN4VEJMMVBvdDVNaXkr?=
 =?utf-8?B?NXFqVCtXaTBxOFI1R0lqQUVGc0tBbnVRZjFUWDRWNXpHanZ1UzZNbVU3UjBQ?=
 =?utf-8?B?RlBOWDBlZy80UFRvN3dETU1qbGxQMFZJY1lDWlFqaXpKcENIRXJ1UmFXdTQ4?=
 =?utf-8?B?UWxEdVpoWFRpdTI3MjYvRUFHRjJFT3Z1TEVBbUZtNURjVlV0R0pXTTNFd3RJ?=
 =?utf-8?B?UVM0d3FvdTZEQVdMa0JncVN0S3BMSHN0aDBkTHhIQjBrNkVLUzdoanpoS2Nl?=
 =?utf-8?B?QTJMdHJXcDg2amJXZDJLZEtxWldkai9yZm5kMWxQOWJRL3ArcUdXMytIQkF0?=
 =?utf-8?B?eWdtYlV2OU02azhySTR6Zlh5Q3Y3U3pSOW1aSTFYUE1PWHQ5eExuM25sMFhy?=
 =?utf-8?B?UDRINHpBd0gvaFV1MnE4Z2FMOFlqR201ck1ydUxJc0RnVklsbnoyc25ZRGtQ?=
 =?utf-8?B?WHhvSVBtVkE0OGdXS094VEtjUXpPNTdZdHdkdjl1SmVXeHFpNVkyUThyWmpJ?=
 =?utf-8?B?MEhLOHFjWmN0L21oUmx3dlB0TUJTNjliTG9wYWg4YWxydm1jVVFJZWVrZFRv?=
 =?utf-8?B?NUk0UHN0NWNhRUxKK1NjV29zWlFEcUQxZFhOZUc2WjRwemR4VlB3Tm1kTUlh?=
 =?utf-8?B?aFBkdmd6SnkwMVlBRlRqU1dwVFBSTVordWdoTzFVV25VOGNpeDRGeTRROVgr?=
 =?utf-8?B?YnlKY1J4M3ZxRG5vUS9aTHUrTldLaU5YeDVXUERjL3M5MUZoaDQwd2VwL0VK?=
 =?utf-8?B?R2dFc1RXRXI3enMxcHBDb2ppZ1oyVFkyT0I2eXJLVmhjQmw2U1pKa2g4bGta?=
 =?utf-8?B?OXZmZHFJME42YlJSWjNWZ3NIZlBRNmlyaDdPZkZKOGk0NU1PM2RDNnpUKzMx?=
 =?utf-8?B?M0hrcjdyZCtwT3BHeVF4ODhsemlBbk9ZMldUNlFlTkFzQmcrR05jVEhNSTVR?=
 =?utf-8?B?NStha1RibUNWeUVJV0VaU3h6YWR6V3VpNzBsODdzYlAzM2UwZ015bGhOUzlj?=
 =?utf-8?B?K0VZTnoyWUxLR29mbzFFUFBMVGE0eUhPcHY3QkhxLzUwQkgxTW9icjAwOUlT?=
 =?utf-8?B?Sk41Q2w4N1BrMGsyV2J2U0tiWVR1THVFQU9SajZpWHo1a3hkbGpVY2hSUDFn?=
 =?utf-8?B?ZTBZN1V4NnVJV0gzWjBiVzFaWUVjZDFqczJIV1pNWUhkUDhNbFI1d21lOTdl?=
 =?utf-8?B?WTRhakNZWCtZWE1vYjcvNzQwZE5KTHNMZ1N3cHdCRkFmaEdaY2ZuM1lsUm50?=
 =?utf-8?B?Z0pWcVA0ZDIzRG4vWlR0U1FVbSt6bWkxUVlIWUhHbWlJWWYweVZGYWxSSlVw?=
 =?utf-8?B?YUFGdVloU0haSi8xYXMwbm8zRGxUaml0ZE0wQTF0QWQzZTRNelFReUgwaWxS?=
 =?utf-8?B?WUZYZFBtcFNhNkM4UXpLVUpwbzRzeWRTUlcvdXZQelhqZ3RwSmVpTzY2bXZR?=
 =?utf-8?B?OVlQcVBOSUtpY21XdHF1anhFaDRxZkNpTllZM1lDKytaUlMrRVZiZTdKOVRn?=
 =?utf-8?Q?iY8Y1aabHT4ikqH03loSOk4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd686d5d-fcb0-4a2e-753c-08d9b8c9fec4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:06:35.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33Dr1rsW3+bjy3deDPmT2iMjnS8ts96Ai64lL/gEKpv4GKafXXt71OYPuGaVSDFW9/mtPsit9Bg71KKsGWnpMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 06.12.2021 15:28, Julien Grall wrote:
> On 06/12/2021 13:44, Jan Beulich wrote:
>> On 26.11.2021 13:52, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
>>>> On 26.11.2021 11:04, Julien Grall wrote:
>>>>> For this case, you provided some sort of an explanation but so far, I am
>>>>> still waiting for a link to confirm that the signed-off-by match the one
>>>>> on the ML.
>>>>
>>>> I haven't been able to easily find a mail archive holding this patch.
>>>
>>> I 100% agree with Julien on all points in this thread.
>>>
>>> Please can we keep the Linux S-o-b.
>>>
>>> Note that S-o-b is not a chain of *approval* (whose relevance to us is
>>> debateable) but but a chain of *custody and transmission* for
>>> copyright/licence/gdpr purposes.  That latter chain is hightly
>>> relevant to us.
>>>
>>> All such S-o-b should be retained.
>>>
>>> Of course if you got the patch somewhere other than the Linux commit,
>>> then the chain of custody doesn't pass through the Linux commit.  But
>>> in that case I expect you to be able to say where you got it.
>>
>> I've submitted v2 with S-o-b restored as far as necessary to meet this
>> requirement. I did not restore all of them, because I continue to not
>> see the value of retaining them. You saying "is highly relevant to us"
>> is a statement, but not an explanation of why tags beyond those in the
>> original submissions need retaining.
>>
>> Without me seeing the need / value, I'm afraid I see only two ways
>> forward: Either things are acceptable as they are now (and will be for
>> future similar imports), or it needs to be someone else to put time
>> into spotting and then pulling in such changes.
> 
> I am a bit confused how this would require more time. They are already 
> in the commit message from Linus's git and you have a correct commit id. 
> So this is merely a copy/paste.

I didn't say "more time", did I? What I did (indirectly) say is that for
areas like this one it looks like I'm the only one to check at least
every once in a while. This has been working straightforwardly in the
past, but is now suddenly causing issues. And as indicated - if I would
understand the importance of tags which got mechanically added on the
way of flowing into Linux, I would likely be willing to give up my
position of viewing such extra tags as more getting in the way than
being helpful (much like I would always strip Cc: tags before committing,
as I firmly believe they have no place in the repo). But such an
explanation hasn't been given so far.

> I am not going to ack it but I am also not going to Nack it if another 
> maintainer agrees with your approach.

FTAOD I'll be giving it a week or so, but unless I get an outright NAK,
I'm now in a position to put this in with Luca's R-b.

Jan


