Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296442B683
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 08:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207890.363846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXTN-0001kt-04; Wed, 13 Oct 2021 06:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207890.363846; Wed, 13 Oct 2021 06:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXTM-0001hb-RW; Wed, 13 Oct 2021 06:10:40 +0000
Received: by outflank-mailman (input) for mailman id 207890;
 Wed, 13 Oct 2021 06:10:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maXTL-0001hV-Dz
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 06:10:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48aba1fa-2bec-11ec-8160-12813bfff9fa;
 Wed, 13 Oct 2021 06:10:38 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-u_8kKY1pNV-ejMcavAC6Vw-1; Wed, 13 Oct 2021 08:10:34 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5905.eurprd04.prod.outlook.com (2603:10a6:208:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 06:10:32 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::79a1:1c43:93d3:d136]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::79a1:1c43:93d3:d136%6]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 06:10:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:20b:313::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Wed, 13 Oct 2021 06:10:31 +0000
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
X-Inumbo-ID: 48aba1fa-2bec-11ec-8160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634105437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPvW0alhaeN1fEesfffuVnvDNBcasXEl2o+PRj1zBn0=;
	b=h3/LY9xVoEERvocKYYOUILVWpiIAQc6VxfD0i/XIjnIqH8FF3R4CunP/LJgLu7zxgkpMOh
	uboQq94rkGBbgUH6vfdMPOjePSWx91qux6+fSiceTurn7TETviiRamxzapu95y3RuDNDwb
	5DoyiHGYd/fv0Hcz9WlD82IvAk/ruZ4=
X-MC-Unique: u_8kKY1pNV-ejMcavAC6Vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRvtUz+3UkhjMmIWPFkIjvMD6QbBHaA4hPwsP4c9GrWJwMDUuNzejulnRBKykMZQML6ZCPJgT6IdcpWrfdROEnG8hAGBAGnk+4Mg0QdHgvbCAc3RHo81pb8Ov/b9Qhq4mhdsgBTtjPV4G17R3SF7W9TiickbnGg+ZS+ujnpnnLey0JyYidvjTprHoT2Rxd1cKgRJioRoLrOnMQY8S9dVrriaxVVbOYxuGE6hB89PkINTZodw84sFcviQd8qN/fR2sfhhzu72jbex9XDV33UxweMbH8luFMPIEA2rHopFIGB7ybO0vNGSecesR8OLD+CRHY7NJt3nKY29OjJrBDjTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPvW0alhaeN1fEesfffuVnvDNBcasXEl2o+PRj1zBn0=;
 b=QYzdPJHncT73gi7JLMsILAsobtf6rjrYFi/Y9Ti9Xi4vZu192jlVfRlgpF+j+FEahNMIxw1/qDiMXrOr+hLGY4YT9/Q0jKNpaeEfmF9woXaBZq3At4klOZRellLitJkX19nlZAEFBT/jHTy27V0Lu+Oc9l2uDYndF5H1iB346sc0M3zrR0vQqiURkU7HlR/rlzoW79h89BhISwniLG6HNHgTY4xa55lUjhLMfJbBmah53B1fQsW7qN8qEsJT2T9MR8q8DwbMaNnXEhNtacwc7Pn074DaN0fWi0forr/f8tSSiT5kTiV3kG6IdCIAhy0O/wWGv+S+eTfSFLYI9QuJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
 <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
 <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
 <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
 <alpine.DEB.2.21.2110121436020.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f15de716-4c4f-47b8-b6ba-ea549c61369c@suse.com>
Date: Wed, 13 Oct 2021 08:10:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110121436020.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::7) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0af34b8b-2bfb-4ee1-f24a-08d98e102a12
X-MS-TrafficTypeDiagnostic: AM0PR04MB5905:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5905FFAD2E644624D6228435B3B79@AM0PR04MB5905.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nGMv6r+CBDo0q/WCOUPULTGhfbjxAMMrc72Dm1booYrZuhibgj6uBlT27uv3ct5f9x5YYOOyDu/35xIg58tlNbiYOpZIDwTl2A3L4Iy6xLC+KqYw/x6eYG2JnU/IBw+M+jSphr8i2BPLtOU5M6lZUODYJ8lMEQ+JWfGlUkUbEwMivqOKpfvwzqWweHsUE7tsQnIv4P75jzdvXN82bbBFhmh1afUHs331aRmK65FUPhZzqPum3ZwxBGhWSfAmtR5MFUygJPHvXTicwa1vcu32s7GORrzNF6FvOzAIkMB/b1fEFPpbW6+0SjXLS1Ye+4qU+AwobhLyJyaBIhv8hPsS7dl8RTJKntP1atbIN7s/Q6o3c79E7H5S36K4MWmXz6fNMRf8sqb/GNPPBr0QKoM8NIDNI+EHQAnaLYb7J1qGIOANhkwxi4sjwaNR6J0ntXjB7dCdk8jHk7nU7O/V83F6oTkMFI2odKoT/tWTf6kgZ9feoj8+hYDvvzlXqUps4HbPTlIUBzqxUp+7wNIILplQLsiY7/lB0uHAp+VcE/QLKhBA21g0bdvMSEZLKmvuqdgqrMBB82YfrAT5GkRK7j5W8UkbYMXruhUiznQGFldd6OPgd0sjqcV0LfPX+dzZJtM25d3EW8H6ZfLpOnLcPDzfms4fjz9vYpkxsWgV5S074nmqixN8fF3SEoS5xMTOFbcK/1MRhZ2kncraltx7xbTLZGlwGbB9lAS9+YUl3AZwo6HAXkAgT8KhQZgUu1hWz6Ju
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(8936002)(86362001)(956004)(6916009)(316002)(16576012)(31686004)(6486002)(7416002)(36756003)(54906003)(83380400001)(26005)(66946007)(31696002)(66556008)(66476007)(38100700002)(5660300002)(8676002)(508600001)(53546011)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZ0cWxNRzgwR1h2MkR3dWNCRHc4RTJyNm5hVmlVVk1yVHZsdWlkUnJCZmZP?=
 =?utf-8?B?TWYrcUtXWUY5VG1iTVRucm5FRWRZQllNSGJLMTV3UjBBeVFLLzhzV2d1V3Z3?=
 =?utf-8?B?OVdtTFVrencyTGNjbm1KUFlGRXdhL29McjZKbS9NTUNzOTNPTitOMXZ3dVRK?=
 =?utf-8?B?cTkxTGZ0QytUcnN1alMxdkFPRVJEbjlXQzNOYVM2NmdFOE1wYWs0M0lHZjhK?=
 =?utf-8?B?YkNFVVBMcE11RE9vNzNOT01qTWdETVRXUC9EVDNVNWhIS3lDMk1hSVg3aUR0?=
 =?utf-8?B?VEVtSG83V2dZb2IwMW5MSnl6SWVwWjNma1NldGYrRE9zZWxjZlZxaVJPclB5?=
 =?utf-8?B?bzJGd3cyczY1L3czSVdmRENlWllmOUxVZjFiYnYwc0d5VGRwd2JaZDdTdUtQ?=
 =?utf-8?B?ejNuMVd6ZFRMT25Xc2ZHK3kyR20zMm1wblc4Si9vV21sOVVERytCUExTTmlV?=
 =?utf-8?B?ZTd0anNRaHkvQlJRU3V0NUcvRVRIK1dyUDdrK1BHU1VDNjFOV3VIdGxHbDFW?=
 =?utf-8?B?RmcwckE4ZFgvaXZ1SXdjVXZqaW5kc201bjY4OG9OdzVlcklFUlFiU2dFZTQz?=
 =?utf-8?B?VGl4U050V3BuVW9MekcxTTNuUE5DbXZtaUp5VGM0dWZZUUNTNGlRaFp5cHVU?=
 =?utf-8?B?cy81em1GZHFpMEZvaEtmazMrUmRwb1FFY0pBaW9Sbi9HUHQ2TTYydVhtQ0cz?=
 =?utf-8?B?TG1MMVdrSlF1VHlwanFlZkhTVnFsVFlLQWRQaXFad2RDSHJwcE43YmZ6S1I3?=
 =?utf-8?B?NWV3cE5TM2lGUmJtamZiQ2FibmJNNzhERHh2d0Jrd0s0UmpreFJhUFlHM1Vo?=
 =?utf-8?B?dkx5UlREZHZNZ3lQamM3b2tDTkRPN3cvVUpsUGhXbVIwNzkrQ1cwSTVrYytz?=
 =?utf-8?B?d0RlaVVaWkxORThEdWZDMFJ5RUdLL3NQT1VqZzlBRGdkMXI1UWNjUzJ0ZXV3?=
 =?utf-8?B?cEtGZ1lEN3Y5Nm9jeTFWVjRqdnBRdEhTTVplOW45Zld1QjU5eDVMSW1wVXV4?=
 =?utf-8?B?ZkRaK1hZTHQvbm9oWWdKUWhFV2s1MU1BbUZiVFdiTE9JRFh6TENnNWpZb2JG?=
 =?utf-8?B?azVxSkZaUStxTjYrOUdDL3dGODZPbFk4cDRpT0Q5YVg0cGlFTklNU3grSk5k?=
 =?utf-8?B?MERkbEZpWHF2RGNLVTM0R0JvcGpPcnYyM3IrZXBNT2dST0tVRHdIK0Y2V2Mz?=
 =?utf-8?B?ZXhJeEVUYVljTGtmV01BdUpra3FvMTh3K2FpSmJxbTZkL2VjZHA5WHQ1RlNJ?=
 =?utf-8?B?MEtUdW5TOTBMTVNvOElvRUtnOWJNNXdDQU1KeHpJekIwWnFScy9QZktpeFVk?=
 =?utf-8?B?ZS9OMkhUWUc5Q1pFSkxveHQzQzZvbHRCdHZUaUQ1OWtWT3lyZ3pYcVM4NHVG?=
 =?utf-8?B?ckhPTXhJNXFsYUQrN2JkNlR6M0tMN2dUN3ZVNXhLN2o3azIxYlFHcFpvYkpk?=
 =?utf-8?B?SEhTN3grRnhkZGlXL0ZJbzRCMVg0WFo1UkYvUkcyejhHZnJjbGIwMktZOVJV?=
 =?utf-8?B?L2RsaXlsSWJ2MW8vaFJoRmFQK3VCSGNJQ1lDUXhKc1RnclpGTm1JbEFDT1cx?=
 =?utf-8?B?VVUxT2JJdktDekl4T1FWVDI4MzdQVDFZQ29ZWmplZXhUQVFFVzQ1OG04WUtp?=
 =?utf-8?B?cGN6YWxpTVhkWmF6WTVkQkhlSnhYbkZkRG9OSVlyNzR3Rjh5dVB3NTlzbnZk?=
 =?utf-8?B?TFB5TlJtZXo5eWl4VFlvMUJOamlkYWFWZjRzeGxKVmJuRUt3K240V2JLUmJB?=
 =?utf-8?Q?kZIVEqDQOW0x1QKkYLuesbw+qUR+Gfv+/bXXC7G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af34b8b-2bfb-4ee1-f24a-08d98e102a12
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 06:10:32.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BruSfMlj86zSlLa1Dr8a8xsmL8jwufpTccqDp1Vq1lE8sKg7JhRjHttOigYhREnyvdfD4GldIguG5fneveg0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5905

On 12.10.2021 23:37, Stefano Stabellini wrote:
> On Tue, 12 Oct 2021, Jan Beulich wrote:
>> On 11.10.2021 20:18, Stefano Stabellini wrote:
>>> On Mon, 11 Oct 2021, Jan Beulich wrote:
>>>> On 11.10.2021 15:34, Bertrand Marquis wrote:
>>>>>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>>>>>> But digging deeper into this, I would have 2 questions:
>>>>>>>
>>>>>>> - msi_cleanup was done there after a request from Stefano, but is not
>>>>>>> done in case or iommu error, is there an issue to solve here ?
>>>>>>
>>>>>> Maybe, but I'm not sure. This very much depends on what a domain
>>>>>> could in principle do with a partly set-up device. Plus let's
>>>>>> not forget that we're talking of only Dom0 here (for now at least,
>>>>>> i.e. not considering the dom0less case).
>>>>>>
>>>>>> But I'd also like to further defer to Stefano.
>>>>>
>>>>> Ok, I must admit I do not really see at that stage why doing an MSI cleanup
>>>>> could be needed so I will wait for Stefano to know if I need to keep this when
>>>>> moving the block up (at the end it is theoretical right now as this is empty).
>>>
>>> I know that MSIs are not supported yet on ARM (pci_cleanup_msi does
>>> nothing). But I wanted to make sure that the pci_cleanup_msi() calls are
>>> present anywhere necessary, especially on the error paths. So that once
>>> we add MSI support, we don't need to search through the code to find all
>>> the error paths missing a pci_cleanup_msi() call.
>>>
>>> To answer your first question: you are right, we are also missing a
>>> pci_cleanup_msi() call in the case of IOMMU error. So it might be better
>>> to move the call to pci_cleanup_msi() under the "out" label so that we
>>> can do it once for both cases.
>>>
>>> To answer your second point about whether it is necessary at all: if
>>> MSIs and MSI-Xs cannot be already setup at this point at all (not even
>>> the enable bit), then we don't need any call to pci_cleanup_msi() in
>>> pci_add_device.
>>
>> Well, at the very least MSI can't be set up ahead of the traps getting
>> put in place. Whether partial success of putting traps in place may
>> allow a cunning guest to set up MSI may depend on further aspects.
> 
> Good point about MSIs not being setup before the traps. We should remove
> the call to pci_cleanup_msi() in the error path then.

Your reply makes me fear you didn't pay enough attention to the "partial"
in my earlier reply. The traps for the various registers can't all be set
up atomically, so there may be a transient period where enough traps are
already in place for a cunning guest to arrange for setup. Unless, as
said, there are further setup steps needed before a guest could succeed
in doing so.

But even if partial trap setup alone was sufficient, I think the cleaning
up of MSI then might still better go on the error path there than on that
of pci_add_device().

Jan


