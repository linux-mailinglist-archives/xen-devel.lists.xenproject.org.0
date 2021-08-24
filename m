Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C63F5FA5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171403.312776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWxJ-0007h5-LW; Tue, 24 Aug 2021 13:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171403.312776; Tue, 24 Aug 2021 13:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWxJ-0007fL-IO; Tue, 24 Aug 2021 13:59:09 +0000
Received: by outflank-mailman (input) for mailman id 171403;
 Tue, 24 Aug 2021 13:59:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIWxH-0007fF-H9
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:59:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71643d26-04e3-11ec-a8da-12813bfff9fa;
 Tue, 24 Aug 2021 13:59:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-dK6SHGrpMjyd8ccSiTcm6g-1; Tue, 24 Aug 2021 15:59:03 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 13:59:02 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 13:59:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0140.eurprd07.prod.outlook.com (2603:10a6:207:8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 13:59:02 +0000
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
X-Inumbo-ID: 71643d26-04e3-11ec-a8da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629813544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lTmn+nddLtdKPfdjcVWcHzcdMCrTixfQcjZr4C2DZo=;
	b=HsxrPWuMXY99CnjfFQKSDj5V1z43js/xxBvQUm9rFLSO6w43KjTXcAKIMGtz8sWCc6MpF7
	gU+6Z90EwpJdNBHapg/DkqdDqRQcppYVwoA1HVXtBkMiU5BwfY2vZ/PHPlixhasKRg9osd
	APgnMyTqg0ahoiR5CLHng4RquV8U1wM=
X-MC-Unique: dK6SHGrpMjyd8ccSiTcm6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4k6Df32ZFhESLExCy15voowe+uIZHnK7KLxjDnnA4TVwjJu/iRFRCmrHYIrv6D89Q6VdQlvEBml2ZCj7UxaTMbGnzvdboPuA0w5FA4gyzQ5LVCNB/nLBawi5konZLlI/oP885P3Z7AU1/WYaKB+ba157Z0ZNIIdmaaC2kHm6aoo+lsdcbXCEoFOV5Ay0AI2OA5QmC0USkGZ3xqNHd6jHYXFIRa3XVF4WvCLSIqPdHlzDK+BWXshQBFt+2RW+/wff48NZkFCApfcJqnBVSh/Qy3k/HXcW6R0M1vN9dVBrYxJVgu8bX/KXRQzRU5H/SfDCiv7A9LrFMGya1SBv/Fi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lTmn+nddLtdKPfdjcVWcHzcdMCrTixfQcjZr4C2DZo=;
 b=S70CXJoflBvWheExtCPoxen3s1OC7jqw1PpGoHw5RaC3QhsJ8YxbC2M7Z36fLAyjQh2AJhit/Nd/31PIaHvnOZFY/jmkf/K+G6elnyi31d+Wekns19dIY/r2UG0cvdUj1OibXkBnyVh03kobJCI3vrpqOUQis5yk5ZQmPfWaPPDgeK+yNMPSJS6T2YeuyNozEQJl/utrJ0irL5fY0r4pHinB9/+DaM0nMkkqfKLyl4ET3aB2kid/sm4xP0OeOly5NcahPkcwMEh6Vpubn2eii4/RR3897OYrAS/CK8skvIfVcC4xF9K/uPDxXUXo8gs7hvzeLq/QWdnUytkqCCPGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>,
 committers@xenproject.org, Julien Grall <julien@xen.org>
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
 <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
 <24862.31351.137596.242803@mariner.uk.xensource.com>
 <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
 <24868.63053.121473.979573@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa856d5f-b2d5-7a07-840e-0c9075e3e2bc@suse.com>
Date: Tue, 24 Aug 2021 15:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24868.63053.121473.979573@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0140.eurprd07.prod.outlook.com
 (2603:10a6:207:8::26) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edce59ce-b9a4-4bda-6a5d-08d967075412
X-MS-TrafficTypeDiagnostic: AM8PR04MB7476:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB74760BD4726EAC96D25BD8EDB3C59@AM8PR04MB7476.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9EPbdfF+1OWhaN1hB5bKAMgg0qWQ7EFSm07YfeLrWgiBS5iM54MAxWM7f+a1hPylS1qfzz/VHciVTJbAmz55Uq+UL8mykMMZJuETg0i2pMv76i93jKGfP9uz/G9ZLfjXYzAeqEuAtVA/O4X4FTaeX5EmdRr5JP2tsdEvCTTLbNRAunpJzYAuP/mtd/ryxfaeVK1Om1UbIArJh0au2UjxQFMMT8N+O1kMCiqvkTNDWGGsdXOxpoSTe7Eu2n7n84pAvksx8pAnc5QhdHo6LqVq7qRAHgSHnXYB+/JN8mKNEFkQSoUpD63Ok4R/jAMctH++KDcXwQm+/IP9YqoTZC0yTAj9H44x0GWI6pD9aKg6Eyhl4prCWUf5r+rkUw4Sbc1xDxLFCy6VJ97HP0EVErMnXaVgY2F+YqMoW5y6bX0u5nVlE455rNNqUQU6MDgVvcRhuj5sZcG9QHsd2DFvFuXdr3WWpF93SE6Mf8LG8JgIts0K1wS9qcGJuZolF4/qyDVIVVkaksqH9Ah4IrlqYVr6MFGqgNMfwAqwpYfPalVooDLbq6uQjMvw63fQFkPMbSMmftwjJECFxCmjDd/lyL7DCdHVB3m6OdH1lQfQRXqvHp87NN+Ks7x96gr4uL1MnMe+F+dm+zd0XXpobRaFPWJva7xBDDgVUcqIFVGgJ1bFtOZSlL317bdpBCSt2KLJc9/qMVmqp5MOMLveOrW8FZG7HlC2ppDUjHf7Eupaa2kjCjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(66476007)(31696002)(6486002)(38100700002)(2616005)(956004)(36756003)(316002)(8936002)(66946007)(53546011)(6916009)(66556008)(186003)(86362001)(31686004)(4326008)(16576012)(26005)(5660300002)(478600001)(8676002)(83380400001)(2906002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUoweERDL0JYK3ZsUytXcXNtM3ZUNVZYaWkyWGlXNFp1b2FUaTlZSTE1YzB1?=
 =?utf-8?B?anZ4ZGQxNmprTnVmRlJETTNaQU9KK05wMlQwWUFVbHFDUmpvbmJndU9rRHF5?=
 =?utf-8?B?YlN3WHBpT1pTWTk3cUY1aDJTd2kvZmsvQzNsZkZuVW41TndsYUNsZFVYc1pQ?=
 =?utf-8?B?WnQ4NEFHMmlSSng2dlBmYlllaGViTVcycGVuRTFOZ0ovMjZLZm5hclZKaTJk?=
 =?utf-8?B?dXZJWmcvZWE5eW4wSWZoeklQOFdNWEpaVldIbnZNTWkyTUVISWZPNzRMelkr?=
 =?utf-8?B?SUxiQ3hhalVYaWRBNDNTMXg4UEJHTkpCMTUxWW0xaW14SGoydVIvSHQrOFkz?=
 =?utf-8?B?bExrUWwydTdzRm5FUlFpNkVQY0o3OHdtVGFjZFZTQnpFbURJUDREbm5FYzAy?=
 =?utf-8?B?SE5wZ1hTbE9KOU5hWWtMcVVLdUFZK3hMbjN4b2FLNFlncFlTOEZvaG50ejlr?=
 =?utf-8?B?MHRQL1lpc3VSQUh6WnMxQzNYN05FMitiM21scUR3L284ZW0xc2xoUGhhVE81?=
 =?utf-8?B?NkZOTkNiUjh6aUhFN2RlSkUrMmQ4OEhTUGRRTjJONlZaaWNOeTVNeHFyTXFY?=
 =?utf-8?B?WDZVdi90VDZzWGIyYmpKMHRoMGowN2JiOGFEeURFWldqM2UvRGFOcTBGUjJI?=
 =?utf-8?B?UTFKUnpTcGtRRGQ1TTMwM2xXSXF2NHlBVUwxNElOTEpETEZ1YmE0Z0U3c3R4?=
 =?utf-8?B?UWl1TjZUZnFaTE8xWTRwU3h5ME9RdzBVbHJnQ0NDQjBoSGJBd3krSEtoZk1W?=
 =?utf-8?B?bUttalNwbUdOMzFDMG0rakEwR3B0K1J4Snphb0dhWHJEVFJndnNOb1R6V2t1?=
 =?utf-8?B?ZzBGS1lYaSt4RFNNQ1N1UVJWSXhIa2NyTUVHNDNubG5Eb2NrUUFvT3JsOEo4?=
 =?utf-8?B?TURGRHhpVUlXaXpRZjRFQUE3VTNnRDdySUVqV2VNT28xd0VhMEsyU0w3TERa?=
 =?utf-8?B?WDZEL0xvVEtWV214Tk5vOVlJNFRDNmpCTWpCKzRjcEhMRGczVm5XazEzdVZ1?=
 =?utf-8?B?M2pvL3podVd4MW9oVkxTUS9iR0piYStJQk8zWUxTMElVRTduZjV1MlFCRDRq?=
 =?utf-8?B?Z2NPd2hlUHg4K2YrbUxYMm15cGUrZmhKZGNNWDVtN3lWbHN2bUJwVytwcVFr?=
 =?utf-8?B?dUxCRE84TVJPRC9naENiOFlJbkRBZ2pNRlFjSXZoVGk0bVU0TXVHd0JoYkJP?=
 =?utf-8?B?MTdTWmJXOHNBNWVCdzl3ZHdnYm1aa0cyQTFLaTZlZDZhMkFlU1I0ZnhERFpJ?=
 =?utf-8?B?NndFVmh4VVl4Mm1FQ2tqcmxoNUdRbm1lN1pkdVpLYXAvdGZlVmszUEhJWW5h?=
 =?utf-8?B?QS9kUndOTDFyckdxZnFUMnRZU0lwY2JFeVU3Qlg0RGd3VFgrSG1WbFZQYTNu?=
 =?utf-8?B?UUpydnZoWndacXg0bTN4YXJKVlkvK1VpdHBFbVY1bE85dTYzZUdrMTZ6Vm45?=
 =?utf-8?B?dURicGRTbEpRNGQvSXJRbTQwRU9HQXc0bGJYUFZETUM1M1NscEROY0FhQmYw?=
 =?utf-8?B?eEoxdGxEZHVvSndLNENRL29abjNhbVVZUTloTXZIL0w3OEx0bTV0dDgzUnI3?=
 =?utf-8?B?bU5jOVV5SXBtZXFzbEJXS2c1VjVMTnZKUitlUzJGeE5zaW1Hb1pqcUM4NVpI?=
 =?utf-8?B?WENNd2R5R0VSUG9CWmJoQTkvUW1TcW9jQ2xSL0YxMWJXNEs5bW5sM3JHeDFG?=
 =?utf-8?B?TUpmWlJURWhKalpHc29XY2hkSVlOTHpYQmNHK2hWNVlaTGV3MTlLRUNDNERP?=
 =?utf-8?Q?Xg7f/5LRZs67OiVbf8YzKnpFU6nHeR67FvypXdQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edce59ce-b9a4-4bda-6a5d-08d967075412
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 13:59:02.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gAvinKYZxMFpyXEJzzuSCNW7/8GEg3FHdNMd09xPzsG66tD1beUpeFj7VMQO0Z9bFSfV6+v38W3X9GBtFjY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 24.08.2021 15:38, Ian Jackson wrote:
> Julien Grall writes ("Re: Xen 4.16: Proposed release manager and schedule"):
>> On 19/08/2021 16:36, Ian Jackson wrote:
>>> One option is to slip the whole release, in the expectation (hope!) of
>>> collecting more input.  In practical terms because of the impact of
>>> Christmas and New Year on many of our contributors, a month's slip now
>>> is probably more like two months' slip to the release.  So arguably
>>> for this to be worth it, we ought to plan to slip 2 months now and
>>> release in February.
>>
>> A 2 months slip looks appealling to get more features. But it means we 
>> will end up to split all the future releases.
> 
> No, it wouldn't, really.  Our usual release interval is 9 months.
> 9+2 = 11, so the result would be a one month longer release, if we
> delayed this one by 2 months.  In practice it is always a bit of a
> struggle to keep things to time (that's the way things are set up with
> this system) so I think this is well within our usual tolerances.
> 
> For the avoidance of doubt, I am not arguing in favour of this option.
> But I wanted to present it as a reasonable option the community might
> want to consider.
> 
> Jan, do you have an opnion about this ?  Do you expect that a 2-3
> month slip would help with your review backlog, bearing in mind the
> people who are currently on leave and when they'll be back ?

It's extremely hard to predict whether 2-3 months would help, or by
how much. I wanted to make the "slim" release aspect explicit, but
I didn't mean to question the schedule unless there would have been
signals that many care about a more "feature rich" 4.16.

>> At the moment, my preference is to stick with the release in December. 
>> We don't have major contributions checked in yet on Arm, but there is a 
>> chance to have a couple of them with the current schedule on Arm.
>>
>> We also have a collection of bug fixes which makes Arm running better on 
>> some platform.
>>
>> So I think the release would still be worthwhile even in the worst case 
>> where nothing major is merged.
> 
> Thanks for the opinion.
> 
> 
> Can I at least get a +1 from someone for appointing me as RM
> for 4.16 ? :-)

Sure: +1

Jan


