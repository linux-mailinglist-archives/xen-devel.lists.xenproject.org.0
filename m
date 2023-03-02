Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2186A7F4C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 11:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504822.777231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfj4-0001rN-5U; Thu, 02 Mar 2023 09:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504822.777231; Thu, 02 Mar 2023 09:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfj4-0001oo-2O; Thu, 02 Mar 2023 09:59:50 +0000
Received: by outflank-mailman (input) for mailman id 504822;
 Thu, 02 Mar 2023 09:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXfj2-0001og-A6
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:59:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f12915-b8e0-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:59:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 09:59:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:59:44 +0000
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
X-Inumbo-ID: f5f12915-b8e0-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeSAZslC/VHDdDzTQr5cl1Fc772ewU5rvnizPhBSNjZELSjGEnOGuVgR3hU5NhlQYMt8yd62JnVw427Lkivm264l9iD1HguOWe1YhYVWi+PsuhMSvZtjV9ZN6eBXlShCZ4hv8ZAXb6vK0dD4eDxvcfUuXkA34g/Q8HQSLoAAuFYBIatdmiLU68X1QCOZiX1SnQBZiBnzdlFcc/N/P2dtMMjHElVJXuUtFcFZFZ8QrKmPid6Lm5KZrSpPqOCCAd8/H5wpzB5CibVfjxz4SUN9mSIxQDuZYOVEkwRRr3TZGanMkQcNNhwxGThK943g4OdCFEbGND48Cfy418r1QAUMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWibBdVERcoiqmX0dqCZspYSaORlgKJ2mhTeJMeP8H4=;
 b=Fi7LgDigauAb4Aw+jJxJIKGW/f5bhNfnMSdA+adCoU6H4hUH2WkCQbp3jt2vnOB1hB9btbmab36c9KC9gUrv18Cb0VLD15MAuI6DJHyjlISxhdS5lfRFVglOxJ8NxAO71xgtKxhsoiiGJFwkziIUErvNJT397vkrcnG/jkiZfol75kUN+DAS6z4YjFKpCxbYzfyEK9PQJEwPIY+pjdY1vOnL+Z8qjpeb1k1iWdGOsXnYZPmACdryyInA9z060FzFeAZ/OfdI67esvJJVFER9/yGmJLHNt53fHDQfsu5N0F5mv0HgQ1WtsWB8PQ80tj3/amgq0zE1YvJluXZl2ekgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWibBdVERcoiqmX0dqCZspYSaORlgKJ2mhTeJMeP8H4=;
 b=5ISgOTbut2YrAY4TbQucB4wu26HMkAo4agBPOpsjKSb656Y2Gf8G+ekB0pO/X01HbDMM3jO+GtMe2wqGHMFXkL9NDIYS+4OsiwWAhNhorrJhSmDZNkUduHBhAqLiUcvE2+X2CDXc7IBVlt6udw9E4QrZYQWxF9hT64EPOa6rqmY28BEcX9XoQX2UUkIP3gNF3R0V+s1whunOG82h95ax7DPKHq7hBmwnP61yhw63Y026bxnzRFAj+kztym5qoAbVK86SF02TRfuH6ADAfiAmD4KOXBkwdprnfWhsGWzSBJ+ZNQUiBwiEmjyfUTV0q41Hui7Bf1m4ICUyJLPL3Iqatw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <649a961d-1565-03c3-467b-42655349492a@suse.com>
Date: Thu, 2 Mar 2023 10:59:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: memory access atomicity during HVM insn emulation on x86
Content-Language: en-US
To: paul@xen.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aa65b90a-5875-9306-692d-d3221afe785a@suse.com>
 <8e00217f-d67a-af35-bef5-d2dc5077c543@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e00217f-d67a-af35-bef5-d2dc5077c543@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 79311534-e30a-4399-5c3f-08db1b04d943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3gSh9MbudHlwR5IKuI2KG6vCwot7s/ier2dAO9cfaaWORmHTENi5bK/n8nA98pGZvkGwfQGxcnLWhuykiuHBAjsNSmkTfdYjDDeM34aNK5BI3n0bUUKjvRXN79LeCtXTsCCjvHWvrr4AvjtSP93E6xNqeDfyhDc85fDcrzFg+2b5A/TZNW7+L0nch8cORYtsGRGa9RqOuh40KKtxoDVhxFqfv71uGMUS6YYK2JMjr5lka/oxpnwIZZrl0DJtiW7rfmGXG9uc4zAyQKKNHx4x79WPwyPZ+bG+cKKzJoAvMgKBcgi4kcgvclnzrsfmbq7BKwRLbMjB1r/oe0Yn0Xq1jzjntUll0bvwzEJqkZkHLfRBCPXHZxnsn2O5lQIuu9JscusLe9aAGI21ZQ9+b/H7Vi1un9mOOK8VLPAKixDZr2ETtuvAQC5433OnEQkt9U/HZtD7RjxW1FwjKMVGz6ET2DRJ+bjZV65ZqHKW8N51bEpAGJ/si14oq1HwDbJWu4vqZ4c9M5A7AFQjdEHBB53EWjCDD6MY3yQSu6d/DN+71eKdvejTjYjxgRLwelGjizmCqR/l2oxFRM+XOswmRVGxNzbPRCtsszLkvZ7QDjexjpfK9wnPs71aTZjXJlI+DpFoxLRDhuPWzRISKgfiaQOJAxDc0fhmSGHSAoM+AnsmoSCGDyDaK1x2e3zbYH2otxVIBgx+4VGlnqsXCR3DUpikjL/PU4SOW5QfIoNuekfvZJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199018)(31686004)(66899018)(36756003)(8936002)(41300700001)(2616005)(6512007)(54906003)(66946007)(6916009)(8676002)(66556008)(66476007)(186003)(4326008)(53546011)(31696002)(86362001)(83380400001)(2906002)(26005)(316002)(5660300002)(6506007)(478600001)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDFJdTZnWVhPaTE3L0M5bGd3S2VLa3FJQWF2a3JHaDJnb1pUSzVaS094cklL?=
 =?utf-8?B?YzJLYmp2ZStoV0lIK01Jb0lpUk1tQzdWK1psdkROQjEvOXJ2MU55RC9OeTRo?=
 =?utf-8?B?aGJidDVOUnJUUVJERTQyMWp1NmdJZVVKWVdSUmlXOVJRZmUrRjh0OW5pcnFs?=
 =?utf-8?B?NHpUeFRRalpsVDBvZHE3VlA4MGxMV1Bna1dabFRsd05CRlJzRVNra2RBQTJw?=
 =?utf-8?B?b05rdE42QitJTE50a2swQXFFSnpJUVBUV0xpVkVmNzJDZmlNTHMxK2Rta0Rz?=
 =?utf-8?B?TjYxRXRiclIxbEZvQVJ2d1pSMlZxUyt2VExvZUVMNmpWTFYySXc3eTNhWnVy?=
 =?utf-8?B?TlhFVHNuUXo0clZGR0c4KzZYOE5qY2V2eEtpK0JCYng1TEplRWw1QUJFYUJS?=
 =?utf-8?B?WnNHNVhoNzV3azlpbnQ5TFFjZjBSenBoYjJ6Wnc2TWlUN0F2TmllVGV1UzBQ?=
 =?utf-8?B?SkF2S2tEaWNwY0dvMUVXWmRzVlUySmJiV214RnVUc2xxejEyTVhzd1EydXdU?=
 =?utf-8?B?RnBMUTRvUVl6QmFVTjgvM0MzTHZOZE5JTHF6aTVIVUx3YUk2OExwL2Z6Zkpr?=
 =?utf-8?B?TXVaUk5pMWRhUmpiTVRhVFZlazVZa0ErTXlUSzdSN0laTjBaaTV6b0I4T2tC?=
 =?utf-8?B?VTNLZTJ3enRhcGJiek5aTXBjcVdqYmtEVjZvTkMxWWViWkVoN0FQV1dDZlBP?=
 =?utf-8?B?THBlN2VtTG5Dc3pRSE13S3JuVkE4VUxlZE9YOXU3UWplVnlpTUVHU2tWbDNv?=
 =?utf-8?B?bVNVSm4wR0tvU0c4a0liWkYxblFLVGYwL1VQNHVXYzEzQjY3RkJzUHVrM1BC?=
 =?utf-8?B?MGE1U3c3MmVVQjRDVUE1Y0F4citBTFJYVkQ4MDFJRlcvbFl3ZjRhQ0ZJMU1Y?=
 =?utf-8?B?eHZCZVJ1QS9JWUZrMlJrT1Mvb0d4Vkc4QXU5cVZFWTZjV1puanRpc3pHRnFr?=
 =?utf-8?B?OXVyeXNHaytwYUt0RFcwUVdKTm04cGUzSE9jSko2cmlhYXUzWFQ0ZUdpSUFx?=
 =?utf-8?B?SzRPeEp2S0FKZFhMb1hWOElpazArS0NNdEtiSmxCZ1l1bDYyRjl3RkZPNVhF?=
 =?utf-8?B?MFpTODZ4V1pIUVY4N3BkQTJCSVpvL3lDQkxRWW1xOVcxLzRTQkhhS3c0YjNB?=
 =?utf-8?B?T01PV1Eza0F6SHZIN0FQS3Zxa3FLS3d2a1Y3ejg2MlAzSEdtc2d2VHdQdC9P?=
 =?utf-8?B?ZCtnb09mZWRYalFzNEQvTXYwbVN5Szg2SUpLS0RRQ3NlVjhQQU9GKzF4V1ln?=
 =?utf-8?B?WGVKVTVRVlhka1IyUjkwbDEvTkg5UXZKdWRnQjhRUXJEUG11a0JlbytPN0ha?=
 =?utf-8?B?Z0h1MGtYSWV6a29RNzBJZXdNTW9UWHgxQmw5T2lDTkF0YzFrQWwzMzhZYW4z?=
 =?utf-8?B?VmdwMGlyRUFMa3NXS21Yem9TblptYlJlY2RPVWRlTFY0VExzRHk2RTMydXlH?=
 =?utf-8?B?YUhGSlFxRHpMVVA5Q1RHbkNHN3NWcGFwNGpkT1NDZkpqVGRHdEpBbFUrMlFG?=
 =?utf-8?B?UE1xOTA3cGZpNVN4V0hNWjZaNjl0RUtlZ0Uvc1pyUzNoYTlrdUloSzhxY0Rn?=
 =?utf-8?B?NXdnZ21EYVFMNWJQais1VGdNTThuMGRPL0ZvdGxscUJiQmh5UmIxYUg5N1lY?=
 =?utf-8?B?WUxEMXlNNEpFbVdzMGc2Tjd4N3QydlRwcWdZUUVmaWNYRzUzbEhyVk4rd3Bw?=
 =?utf-8?B?aWZveGNoR24rRDVNdVErSGVJRzA3SENKMGhQYmt3ZnVGcUU0eVR0cTlBeXlN?=
 =?utf-8?B?L2IweFZPY2NqdHpYNzVHSVQxMTlqM05ZdkNSS1czU0ViYUpvUXBHTFJvN09r?=
 =?utf-8?B?cm5Oc1dpdHphM3ZlZmsyZFh2TC8zeTJoVlluTnVHcjBHb2lnbktJY1B4Q2Rl?=
 =?utf-8?B?WjM2elpOdTYzQ1NYUnRETGdkdGVVYmgrUGZvaXBmT1MvV1EyejdkN3BEd1Ex?=
 =?utf-8?B?c2lMN0RLcjN3QlpydHVrWjBKYTFXaEFlZlZKTGpkSGlrRFd4V0JieUxtTUUr?=
 =?utf-8?B?TEYwaDJqYy82VnBwL01JQkMzYTVhV24yM3Jmb0N0aHRDSVdUcHUrYUluYVU4?=
 =?utf-8?B?UTVlRXVuWFU3MHpmMzN6Yld5SzFLTERLT1ZGNDNrR1U5MVJ5OWNhenVMQVZP?=
 =?utf-8?Q?IupFsj5WuzbMVuXXZJZIOj3j2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79311534-e30a-4399-5c3f-08db1b04d943
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:59:44.3352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1papar5Nlwn1jxHSgFDQLZZxrxgw2jj6uJIaeRd8nNpI9ntMXDD432djfKnuVAsQMBm65RmQVfNgOju3Eynjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663

On 02.03.2023 10:23, Paul Durrant wrote:
> On 02/03/2023 08:35, Jan Beulich wrote:
>> Hello,
>>
>> in (I think) Intel SDM version 076 a new guarantee of atomicity of certain
>> aligned 16-byte accesses appeared. While initially I thought this would be
>> another special case we need to invent a solution for (it still is, in
>> certain cases, as per further down), I had to realize that we don't even
>> guarantee atomicity of smaller accesses, including as simple ones as plain
>> 16-, 32-, or 64-bit moves. All read/write operations are handled by the
>> very generic __hvm_copy(), which invokes memcpy() / memset(), which in
>> turn do byte-wise copies unless the compiler decides to inline the
>> operations (which from all I can tell it won't normally do for the uses in
>> __hvm_copy()).
>>
>> The question here is whether to make __hvm_copy() handle the guaranteed-
>> aligned cases specially, or whether to avoid making use of that function
>> in those cases (i.e. deal with the cases in linear_{read,write}()). Both
>> options have their downsides (complicating a core function vs duplicating
>> a certain amount of code).
>>
>> As to 16-byte atomic accesses: The SDM doesn't restrict this to WB memory.
>> As a result, in order to implement this correctly, we cannot just utilize
>> the rmw() or blk() hooks, as these expect to operate on guest RAM (which
>> they can map and then access directly). Instead the path invoking the
>> device model will also need to cope. Yet the ioreq interface is limited
>> to 64 bits of data at a time (except for the data_is_ptr case, which imo
>> has to be considered inherently non-atomic). So it looks to me that as a
>> prereq to fully addressing the issue in the hypervisor we need an
>> extension to the ioreq interface.
>>
>> Thoughts anyone?
>>
> 
> Does the interface need modification? As long as 16-bytes are copied 
> to/from guest RAM in an atomic way then how that data is passed to/from 
> a device model shouldn't affect it, should it?

The question isn't the guest RAM access, but the guest accessing non-RAM
(which is why the device model is being engaged). Both a RAM and an MMIO
access can happen with a pretty limited set of insns only anyway. Among
those are none of the 16-byte accessing insns (they're all loads from or
stores to memory, with the other operand being an XMM register).

Jan

