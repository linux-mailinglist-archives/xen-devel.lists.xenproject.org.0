Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E355F651D5C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466795.725737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Yy3-0001Ye-Kk; Tue, 20 Dec 2022 09:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466795.725737; Tue, 20 Dec 2022 09:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Yy3-0001Vr-Hj; Tue, 20 Dec 2022 09:31:23 +0000
Received: by outflank-mailman (input) for mailman id 466795;
 Tue, 20 Dec 2022 09:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7Yy2-0001Vl-MC
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:31:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f88b402-8049-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 10:31:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:31:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:31:18 +0000
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
X-Inumbo-ID: 0f88b402-8049-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTBSSfswO8F9ApAPXqvkBa/kJoNYXQqk5lUmaTezQWfHPxbT4158pkIXnNfu9ttP+La5OQTfEl1Q3SIf4kewmWpAa/chJXwc2zf064iNnHW7IqlGiBaZ9cqKMS70VI44XyiKZEgyx3KOt4UxC2hrTA+gI6Vg50OHCI4z4yHNWmlOwz4sEMn5zbyWmfPCq5YZ13oLssxo2D7iOoBTbHg3XW2OBr/c1lllq/UkBb6GCj+oTcOwp9kTeqnGj6FNIyXHUvg1qoWuJcl1cPOK+LNPjBQlk3GNZa90hUc2427Fd910ogZmm6d1T/IaqjSogXApjjkb+fTJxCsBPZv2CGKUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLtPC61751IpwhUcuuXLlTDWtVrGTCjSmqCq07KWVQA=;
 b=FrAitCxJ4kjJt04Bgq5duOrVsLkUOxAeP3SdUTtu7Y1nhTg1XPeFurKflEJT7m4v4X0F8LLIvMQrUG6N/4ntlb82fyw7g++Zk4lQ+mfdYNAX4sibUB5pmXIcNg2fEAQCvZY+xnkfRNUaG8/0/oVRC39raDY+OrXQlrdgC8FhilgY79fBeBTfm/vDNun88rE42Gra/0vH3rNc9r8SGOh1emr9hYzP26DMYzHnO9KLwEBrt16Lv3AizTPu4JyGEd+a0F3jFqe018bsGj1DsdJGqm4iC9E8DPSg7vp69SXJ+OtBh0fCHesxerTJvEP2tp3DQ3mdmNOUsT+4T/Pc8aWQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLtPC61751IpwhUcuuXLlTDWtVrGTCjSmqCq07KWVQA=;
 b=cDL9/++w0SuGxN6aHnZDXKy6QYCyNkhi/RhC6auJCfyOiI9xqOkXOEZTJyE4wEOUomHE0oPwF+/OImMw1ExgP/V8Xgic6WQ1eMYMPciHkCk6+RiBWP98fz1sFRtUL8kR/aS5nWBmY/AfpQfbatMByUukBPBHprM1lkrgy1SWWn7BLikC/muyl50ijjEbkMheD4Nnmd06dhflAIdaNnt7M1r63Ngf22ucyfjlQ8BHkDaWAjXhBRp5whFAeIr2n6sCt/N9Pb5KBdw1BcWJYikeZTfXgZdKVV+9/v+u/RWQtE0bu0mQQG13vqQRnXshlT8AVRT0NpBLhA3G1QS+cH7MLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <584277e2-abc1-0f22-e393-2df882e633e9@suse.com>
Date: Tue, 20 Dec 2022 10:31:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/18] arm: cppcheck: misra rule 20.7 deviations for
 alternative.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-2-luca.fancellu@arm.com>
 <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f43dc8-8c88-4e52-9257-08dae26cf2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeA5EsOGLgcF4gWT88lBm+QJiFPpHso+3yLkfqeuJckVPufjpJdq0qL3aUXi8y57PZ3/5Kf4h7agVJM53AwP3m/Inf+3mjpPZp4kiTu0t8imwXwwKEyKU9NkY8vcOu1XBOBrRv16BwbrdgtmQ7XBOnFqs0CAQ3AUvyONX8fZWe47RDV5ZyyKidJH+uHIbF+Ca9grCOWvXVvwJ0AjpDDZpn9FE2fCbbK6GAhWpXzoz6dGtE7DQZ7jz6RuXzOfJDiKxE5BWUyvElscnjD8vF3KsrNnS9gAc40dHAJEaoIpuVUZcxXEBLymyLdKkbBx+x5MIP5BlYDCp9hsWZ0yA1VC73a+9tDOa0uG0bzDpTsFCEjxHg0fPHwBok9b5vgtmDR9/iL6Bwj4A4wYe3jxTOOqFyBMpUyuRfG6WWRiT+Mh45HaUrooVIs4lCUFRag9WgHC2QL/Iy2xC7ZgjDoJUOxE10WsILz++SNdlSRhv3wxoXi2AiXDVPrj9TmG3k9UhXaZsZWaMkaCT6/A/iWEbWvnNu74WgiX1Ka8Z8mdAvoId+9Pm8bH+ZdAZkpwT8gYXhdB7My8+WvOFoD38PKnHAjhHvPieivjT0Y+xwtFLBKWMZfQozvfzeV1Z+f9OvYKeeKm+UzstV/55CvxwsDHjtnuLzqy+yL9TnVZ9gkq70sC2W1S73vkzuv+Wi4jVV/W14JOBQ+bfRRf8mY272J4n48AtSTTG08LMruUTmGuYZEHywY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(2616005)(38100700002)(86362001)(2906002)(54906003)(478600001)(110136005)(36756003)(6486002)(31696002)(316002)(26005)(186003)(6512007)(7416002)(5660300002)(31686004)(8936002)(66946007)(8676002)(4326008)(41300700001)(66556008)(83380400001)(53546011)(66476007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHBaS1p4a3hWY2ZKS0NDakdRSFlnaVVsSVpDUm9oTUhseDB2dm9yTjJhT2FI?=
 =?utf-8?B?d2ozdUtrMzh3OHUwL0tLTlBvbGhCOGNYQlp1YmZKQTFmVFZnZktmSnRLUnlB?=
 =?utf-8?B?Sm5KUVFadzRJaS9XSWxxWlpuVWEvLzNkZHNSb0o5TDhIUWNTVVQrbjIvbGtE?=
 =?utf-8?B?NitoVW13MEFsMXRxQlRKT2tiZEo3a09neDk2WER6S05RazVIcTFucDQxSi9C?=
 =?utf-8?B?b3N4NnZrUHRjZWpXTHplcnM3Q2tSQTcybExpeGF0bmJ5OXVtZjVROTdmajRE?=
 =?utf-8?B?Tllhblh2cXphVWovWWkyTWxUNkxrSkZJZWtraDF2c3hCaCtTYmpoK0FiQWhU?=
 =?utf-8?B?QmErTEtuVm5yZVJNcVhmd2ZkTnhoQUJWNEtPOTJRdkdmSEtwQ2Q2VG5FMTV3?=
 =?utf-8?B?MSsvL2xicFlDVHoweXpIOXVzd2xwSHlUa1R2elduRmhqQ3lLaDhWTzFSU011?=
 =?utf-8?B?RDAzNVRxWHNvSnFOL2hwbTlXQldJNXN0WmhEREpmN0lkZnFTQzE3OTY1K2Zv?=
 =?utf-8?B?Tm1JY0ZtS0o2UHVVWXQyT2NtTnJETzhHT3JMeXc1Yy9KRW1mdUtOUTVnajVj?=
 =?utf-8?B?eGl6b2R0bjAzQnlJN0d1Uk1vWVcyS3BWQVIrbzV0RVJEZVJkRXBxSEw4Yk9P?=
 =?utf-8?B?ajRkK3RlRnBNZ2lZSzZkaGQ3bGNGS20rd1F3Z0xYRVFJOG02WXlhTkJ1eXV3?=
 =?utf-8?B?TnZKTmVPbXluWkJ0YmVaRjY4c1hZZ2FBUlNpTUV6enFiVWl0VHUvTkg3dEdi?=
 =?utf-8?B?UDJ1YTJWd29OSjY3YmVJVDl6NXVNT0FvQUFQOEthNUxaTVcyUFB1aXV5VklI?=
 =?utf-8?B?VHNFTjZsVE5iZVNmZ2JQMkFyRi9telZ0elFOQWJSeDhjdWNCdnlTV0RpZEsx?=
 =?utf-8?B?aW1VSDBkL1dmSk5hbHIrZFBUNjVETkdkcS9Bam1mODI1THBnUHcyNTRYMktV?=
 =?utf-8?B?MGJIckRIcWF6RC84QTZTSFpYeXlpN0FNZXBGRHBnb0FoQTdQV2ZFeFU3Y0E1?=
 =?utf-8?B?LzdxWjlsdmhyRGhXNk1GODdUK1BWT2VlbGp0RGdpWmNwakt4dWJQalR1VUg1?=
 =?utf-8?B?US9tOE5GNkxjUXJNb0FJY3BCZUp0Z2Yva2VvOUQxaWt2ck9rbzdrY2tueG1N?=
 =?utf-8?B?K2JwbXVSS3pzMHNvRnVSSk85WFZBTWpXZ3ByeGlzNXNSai9LZUJkQ3hsRGZv?=
 =?utf-8?B?V0ZRQmdDd1U4TWx0ZWtMRFl3L2Y4L1E1UmM4eVN5c3NudDEzdW5EVnpVZWd5?=
 =?utf-8?B?amhPUWNUMlhzTUkraTZObkt3dGRwazI4VWZtdnFkWHljMHZSRTJIelBCTjdD?=
 =?utf-8?B?T0lRbVpLd0ZCeHhJVFZtQUNsQUxiRE5kUnZFVjVPK05pMzBOOUZvOWJjd0Z6?=
 =?utf-8?B?M1RYZm5nZjRHOVRTTDhXK3RpcGZCaGV3VXZnMmlqUnVPMnVyMDZZczlsM29r?=
 =?utf-8?B?Qlp0Q2FQTE10Y0ovTXhudjBWMTFtSTBhYXdEbVZQV29CNUQ5eGpvN3g5dlBU?=
 =?utf-8?B?akdVdTFVMm5VUzJ6Y3RRY0ZqSjRtRUpDM3dGOXl1VEFQcmhGMXBjSHpaSHQr?=
 =?utf-8?B?dHpsZG1UYWVQL0JzNkJoZkZ1WDFZeHhDbzJhbW5jTEpVcEM4dEIyZUVMdGo1?=
 =?utf-8?B?aE1ybE1mMS8zRHFuYk5LR1JOWXRaaS96TUFqQ2tQdXk5VlN1a1lEdksvYmY2?=
 =?utf-8?B?ajNsQURRU0d0Ulh0clRDOEYxK0RZdlVwcDVIUmtmZ0pNWEc0QUNOK0xkM2N3?=
 =?utf-8?B?VHgweVVkemR5bUVqbmlUbFlGR1FZcUZqTG5kcUlMLzBuQ1FQMklnYWI2UzVR?=
 =?utf-8?B?ZUlac0w4dit2MWh4Vk8xcnpDZWY1YmtPa0tQcFI3OFFERER1Q2xhYmdCZ0Y5?=
 =?utf-8?B?dkt0ZjU5RzZEMVpzVnFCOW1TYTdzbkJJcDVXK05hOVpBZ3FvVWJVdmJmMDNT?=
 =?utf-8?B?ZXJZWkRIYytYNnlKTmxuOUZVSkhyTkdOZ0RSY1U4SFBZUTVBWEZMUXpIenNr?=
 =?utf-8?B?eXozWmxxaUE0Q2FlK01tMW16MFAzTFM3QzJCTHlGcWEzTEtoS1ZWeVg1dlZI?=
 =?utf-8?B?eHJMNWNzbkdvT0tPSzZiSDY2N0MrUnRUSG1oOW1sb2RqUjZNR3BDbUJvVTlW?=
 =?utf-8?Q?RSHNR/XJOiSFEXiyJNZjBBNLm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f43dc8-8c88-4e52-9257-08dae26cf2a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:31:18.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFtEKxP2g4aODTC15mONkUPskGd7YPAUJbUl1U5yKQrtPINo2Td5HKPlNpB2fY6NSc54hvpH4Wovi0bOlcT0uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

On 20.12.2022 10:07, Julien Grall wrote:
> On 20/12/2022 08:50, Luca Fancellu wrote:
>> --- a/docs/misra/false-positive-cppcheck.json
>> +++ b/docs/misra/false-positive-cppcheck.json
>> @@ -3,6 +3,20 @@
>>       "content": [
>>           {
>>               "id": "SAF-0-false-positive-cppcheck",
>> +            "violation-id": "misra-c2012-20.7",
>> +            "tool-version": "2.7",
>> +            "name": "R20.7 second operand of member-access operator",
>> +            "text": "The second operand of a member access operator shall be a name of a member of the type pointed to, so in this particular case it is wrong to use parentheses on the macro parameter."
>> +        },
>> +        {
>> +            "id": "SAF-1-false-positive-cppcheck",
>> +            "violation-id": "misra-c2012-20.7",
>> +            "tool-version": "2.7",
>> +            "name": "R20.7 C macro parameters used only for text substitution",
>> +            "text": "The macro parameters used in this case are not part of an expression, they are used for text substitution."
>> +        },
> In both cases the constructs are commonly used in Xen to generate code. 
> So I am a bit concerned to have to add deviation everywhere cppcheck is 
> wrong.
> 
> More generally, we are still at the beginning of MISRA in Xen and I 
> don't think we should start with adding deviations from bugs in the 
> tools. Instead, we should report those bugs and hopefully by the time 
> Xen is mostly MISRA complaint the tools will not report the false positive.
> 
> If they are still then we can decide to add deviations.

+1

Jan

