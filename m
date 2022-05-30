Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3D5377B2
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 11:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338435.563210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbmb-000768-EO; Mon, 30 May 2022 09:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338435.563210; Mon, 30 May 2022 09:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbmb-00073a-BK; Mon, 30 May 2022 09:33:53 +0000
Received: by outflank-mailman (input) for mailman id 338435;
 Mon, 30 May 2022 09:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvbma-00073T-3w
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 09:33:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfc3107-dffb-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 11:33:50 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2176.outbound.protection.outlook.com [104.47.51.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-GpCOlhQvP7WPohdUHj8gfA-1; Mon, 30 May 2022 11:33:49 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4202.eurprd04.prod.outlook.com (2603:10a6:5:25::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 09:33:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:33:47 +0000
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
X-Inumbo-ID: 9cfc3107-dffb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653903230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efMemm16pYw5nvgM1bwvH44Sl8mmqjTlIH+wKEAO0CQ=;
	b=P39P2zNNN98dzLKF1y6jRqA/GKgdLh75SqJNHBpuFR1LNkYLn0pkmU2vjy2JMiO+fx7vxQ
	yi8kAE062qA9ZWjwXkzsvPl1RZdcOQs6OvMFRVcLDCT3AMrBMzTG39wBshBbcgrzjEuaid
	HPxhIL+CLkLIvhHfhHXMyHUMcCnn61A=
X-MC-Unique: GpCOlhQvP7WPohdUHj8gfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8hPVtQJ0T1iIj2nMofS2G3VneQusZRumYrsCg44V5x2xPnRwfI46Xlnsds/i+zfFEH0uKb34QV+eA+1kgUxHnHu44Zglot9lVB0kJdzf+AFsSQW8PE2ITlOkYJyOQPWd3i9oNx8hee1xXwfC+HuIbldrfd6R55jL9RzUtVKx5piqeJNTEY7Xt7X7FCxcGB+Z02ByEcLW9qCkzs00C8sg2t2+kJ3tl1FFMHjF/cbjid9AsQs4sXpS9X2Xj2xgHplclX/6aexLZThcDmFoPDZuavH57fYF9MAHoHk96CVCDUWdRJpIEKNhUEcuJv8vCD2QQw8oU+LKM7v4f4Gske6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efMemm16pYw5nvgM1bwvH44Sl8mmqjTlIH+wKEAO0CQ=;
 b=d1Rio3tD9ejE9YcvdpGo8wJZNJZstjroM4ew7b+m8GB7p4LVIZDEhpkoRdU3FtuB9Ix4+Yr29einjeQ3EN9EjFKKUe8G4yDLKpbto146GiSjY6+eha4vV2pENscGUy+zmpSkVdTOqpd5K46EBc9pWTPr7PPgbBFi3zWocd5LqleHu5tj0F+5AzDyPD8dorM/mnkXIsNYN/igyW+eLg2zVxOLjpMd3pcvPSOwYtbS0Qu3zPh254hKjzheN+BhwguYPpjnPiGyLMdDwuvQ1xPtkLdiODh4yuxIQPf5vaKSY3Azm0uuZFt+DIINm2ptCxUqsr6IwY5zMWt+TLZTzmwkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com>
Date: Mon, 30 May 2022 11:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
 <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e3640d1-cbf1-4767-4a7f-08da421f7f79
X-MS-TrafficTypeDiagnostic: DB7PR04MB4202:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4202276F3518EA9D32D293A6B3DD9@DB7PR04MB4202.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCQPnbNHoPsNQhBP+jCHK85nmrfLkFRWNbyG+yF6/ok6zBiykCZP6T4NueL0aB9FaRP/xzO6C/BgC+g5eYhEuksN8KA0xJnbhawbvPBP+TJ8HorraM0BNa4JNwJNpp62Ka9PfhdfrhZ9Dou4ToaRaMRfIH08lm4QD4BnELAbJ69JgD8LZB2aEDhgwLUZm+VaD+3E58ZiWopnKUdNOA401RHBiJ81OlPjeyf3lUona59Z3hFFhZi8qWG6UFJe4UgV/YwKU4LBVhXEMJsNmh8pFwuNNMCHaZMEdg27TxPyTlhBrs153d+5l4n6albwoofzCmBtgmE6/y7Pn4x7qQ0AnEk1RDV2J7zeofMGo8dUf7QpjOXrpTSEygwJMaMQWu0JCnvIrnRf/YiDD6m/Q4XMOUCIFjnAYPEpdoz7ZN5Mtgvl+4pXZ/xD6v69nVdGrEVbfzorABHn0vtB4TRxUW+hKc5RSXrelVRAO9QbTVI366gJVuEb3caYk8hBMXTPE8jKJfYH4wyu4t4i1CwhikZQaE3UIvUmmV3WOwFYdsAvJV73JQ0otmAmmRCDqxk1h1x2LMnBSL7A1IJk1u5WjPlAKqI266qPxExAPoS5zKqJisluAkAQtP/cFhLrcClhEPvJv81BUIN05DLO7ucvi0P8j+A8uyCS6wfmpaNDqzhITD/dKzIsvMom/eutW5FN0Aukkm3hw0yiq0LpkJIYNyKWreTnC0tFdk9BDS4ql/1+eFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(83380400001)(2616005)(5660300002)(186003)(4326008)(8676002)(36756003)(8936002)(66476007)(66556008)(66946007)(6486002)(6506007)(6512007)(38100700002)(508600001)(6916009)(316002)(53546011)(54906003)(86362001)(26005)(2906002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURLeUw1eWp2Yi8wK2tDV0JiOUZURU1PSFVSa2I4SlBIZ2NvUHV4QzB6UEpG?=
 =?utf-8?B?cG14K2tEQ0RXSVZKSHlKVkh6aTdpSURFQitpVTloS3laQjZDc20wczBDVDNt?=
 =?utf-8?B?RFdNeEFhd3J3bThRb2Vpb2N3Q0dHZHRJU1ArL29OYW1tVkdSQTZWSktKZjFt?=
 =?utf-8?B?Z0w3RjV2bjBDT3VuYU1nZmh3U0pzcE9HMlpQWm5HZnhzWUkxR28wemhNWXBT?=
 =?utf-8?B?bFJKZjljM2ZGM0JUcEZRcEJKRVhxN0JKdjNtWjBZUzRTKzB4YlVQNHcvQTFQ?=
 =?utf-8?B?YkpZRTRsa3hwQ2VmLzZwS013Sm5MVDdsbFdFU1NCaDNqVStuNXdLZytCNytz?=
 =?utf-8?B?NmFUdHJPOUFQUnhtL1RCYzJ5b05KUmRHY1BoWXVqeDlwK01Ob1kwT2s1a2Nu?=
 =?utf-8?B?emtid2gzMTJsbTdvV1poUTkzTDh5WjBYRG9Yak5adFFLRDZWVmp6NkNkYWE5?=
 =?utf-8?B?VlR3WkFmYzgzbHFFbG9wS3llOGhMSmRZdk82RVNRRzNVcTB3TStNbzVxWW1u?=
 =?utf-8?B?QkJVTGtmbCtKT3MwVHFLTkdXOHFmVGZzVnBXWU1Wa2RyLzhXVFFJT2FEMXgy?=
 =?utf-8?B?ODAvQlFNbFduV3lZVXlYTDFjcFppd3NReVRCTE9HRVI0NFp4ZGppZlJFYWRG?=
 =?utf-8?B?MWdRMTBDbVE1OThRaENnbnBwNzZ1bnNCTmZwVUp2WTZMRklvQUhGaFB2N2I4?=
 =?utf-8?B?TDlXWFNObEZ4TkpOSnZWWFArZHFLcGU1cDBBcGR0TzRmeWRJVks2U2c1aHBu?=
 =?utf-8?B?dkJlUmlqSTE5Y05sTlJ2aGljclhXREpJSzlLNmlveXNXMUg0cXVsZFBuNFAr?=
 =?utf-8?B?WG53YUVTVUpHeDVUd096UnYrSkZBYzRuWGJ6VDlHR2hYWVJuL2V2bEg1ZVVW?=
 =?utf-8?B?V3JqMmdHR2ZzcUJFZDJNL3EydWxyU3Y3Vy9DSy9EQXMvNzVBSGVRVmN4TlVv?=
 =?utf-8?B?ZEpkRnJ6Wis0U3hBRVBnTXBIUmkxaktYR0ZxRndKZ3BqQ2padFR5N0NzK2RJ?=
 =?utf-8?B?Rm85QWZJcDZFTGlncWRjdmd6SXNLcDRUdzFOanM3UmVKNGJHRm1LVmpQejFP?=
 =?utf-8?B?NEt3U250QXJxRmJaalFXbEJuSE9icDRWeUQveFE2YjE3QU5NRkpiK2YrTFlr?=
 =?utf-8?B?cDltL2pWZEdNZ3BtZzg0NlE5SGRzeFBSRXMvb05WTU1sUnNMaXBxZ0szSUtw?=
 =?utf-8?B?N2t3eGJYajBwSFhuVTBXNklIN2JjN2Fib3VBcFk4Ulp3eVhldWt3ekxqRUsy?=
 =?utf-8?B?RHF3cGhQTkhTMDhDLy80S1VsZjZjNHNUWWpZN3VWM2gxY0FWRVBCL0tMcXlY?=
 =?utf-8?B?Mnhxdy94dnJyYWNuWmY5VkVaR3hydlVJMTlwbG1zWkZRY1dXRHZiQjZhTDBJ?=
 =?utf-8?B?S2NwdlR1azI5WWhwSkJ5aUF5d3Q3T0dDUVl6WU9Tb2hMQmtyQmRHaVFST2xX?=
 =?utf-8?B?QXV3TjdLZE1TaUtRaGhJWkNHRTBXOGROMy9hYjhkclliK0l4RHlIK3pxS2Uv?=
 =?utf-8?B?dTI5Q3grWTZLZzZtMnMyL1I4d0F6STE2d0NqOFkyUTN4WlRjb2pJSHdhVG1j?=
 =?utf-8?B?am9lUW9jVk1EUHh2K00rQXBNcDFUZVBFSFd1RmNrck9abEQyR2VkYVNRK2ps?=
 =?utf-8?B?NjhmVkY1K3c0THJOdTdjNzVGMXR4VVM4R3E5NzIxZnhNRkVRRDhTOFhHTHkr?=
 =?utf-8?B?Y1J5K0gzUDFSd01ST0xWbDhxRlpZbGdKNldrbFRRbXAwYVZZMGNub090T3hW?=
 =?utf-8?B?VUVQekdRd05xWVNqdUhLSXI3dlZoQzN6dFVndGlGaFZCQTBHS2FRZ3JQczRI?=
 =?utf-8?B?Q0NJQUhhbWJwTmxScVk0Y0hTVXZ1TjdXS1IyZDhKWG85TnJtbStnR0RRNTNP?=
 =?utf-8?B?UWdWUUFZNmU3aDRqY1k5bUtoUlZoOWVjVWRRM0pQUERyL0FHVFZYTTRMTS9W?=
 =?utf-8?B?dzNSOUpjbUZHWHYwVzc4WXVuOFRZdlhKeFRIcW5LNkc2UFZEUnhhWllyRXdW?=
 =?utf-8?B?ZWdGVFNTK3RQOCtNSG1YVG0xczdZVVpKd0VhS2p1MWZNNUJrOXM0MENpVGt5?=
 =?utf-8?B?dDQ4em9wamxkVUk1Z1Bva3V1YjJ5YzVTOWQvWGZ2L3ZadTRlL3RwTTBiMndt?=
 =?utf-8?B?YlZoWlYzcjhiSXVUTU04WW5STjZnSUVQZTRnem5sRGFDQmRqaWlIcGhvOGpM?=
 =?utf-8?B?bUVGbllQcHlCZ0hxYjAxS3pxZDlnRXNvRU5jdC82Y2xYUmdoRVVHcEtLWVBP?=
 =?utf-8?B?M0VMV3Q5amRoQllLd2hUbThURXdGcUV3T1REaUJCazZpZWZZK05oMkRyT2dU?=
 =?utf-8?B?b042b2hwNUlXR2RFNFRXZnVTUkFHVGtqcmNnZkZSS1hGYk4yQ1piQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3640d1-cbf1-4767-4a7f-08da421f7f79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:33:47.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59GQvmIy4+BsKto4eWfAgzcSqMAlea66lA5Uwdk/9mz55YY+NezGNZPZwNkPIYO8MJfcTwlX008F8k1bnUdn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4202

On 30.05.2022 11:27, Julien Grall wrote:
> Hi,
> 
> On 30/05/2022 10:16, Jan Beulich wrote:
>> On 30.05.2022 11:12, Julien Grall wrote:
>>> On 28/05/2022 00:16, Stefano Stabellini wrote:
>>>> """
>>>> It is possible that in specific circumstances it is best not to follow a
>>>> rule because it is not possible or because the alternative leads to
>>>> better code quality. Those cases are called "deviations". They are
>>>> permissible as long as they are documented, either as an in-code comment
>>>> or as part of the commit message. Other documentation mechanisms are
>>>
>>> I would drop the "as part of the commit message" because it is a lot
>>> more difficult to associate the deviation with a rationale (the code may
>>> have been moved and you would need to go through the history).
>>
>> But this was added in response to me pointing out that code comments
>> aren't standardized yet as to their format. The alternative, as said
>> before, would be to come up with a scheme first, before starting to
>> mandate playing by certain of the rules (and hence requiring deviations
>> to be documented).
> 
> I don't think this is necessary short term. It is easy to rework a 
> comment after the fact. It is a lot more difficult to go through the 
> history and find the rationale.

We all know what "short term" may mean - we may remain in this mode of
operation for an extended period of time. It'll potentially be quite a
bit of churn to subsequently adjust all such comments which would
have accumulated, and - for not being standardized - can't easily be
grep-ed for. By documenting things in the commit message the state of
the code base doesn't change, and we'll continue to rely on scanners
to locate sets of candidates for adjustment or deviation commentary.

Jan


