Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CB7D6A64
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 13:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622846.970047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvcPr-0005Zg-7S; Wed, 25 Oct 2023 11:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622846.970047; Wed, 25 Oct 2023 11:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvcPr-0005Xc-4V; Wed, 25 Oct 2023 11:51:15 +0000
Received: by outflank-mailman (input) for mailman id 622846;
 Wed, 25 Oct 2023 11:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvcPq-0005XW-4O
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 11:51:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe13::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb05ffa0-732c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 13:51:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 11:51:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 11:51:07 +0000
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
X-Inumbo-ID: cb05ffa0-732c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CotFTkRmF92uCXQvhvMuK1lXuvNnnRnTKWgmVuvHZuu5/Cx1En84VkaC69VivJjd3nueYXRvfZB5GzdLhPT8Snrddh1davTTQdAhDElusfcSi36GVgnR1ZypBzy4jXtX+QVfyLXiLSnJXFTmNzwCOy45x6jGOFSeBE8n32yYD7J7N5HuB6h7tVv+CIxhrPrPj8eGbnkH2r6XsW8n2xv8vlb2yuXBSvVxr1jv272tM+FScSjzHdIFEH1LDK1D2D3UVagZUQapJaL4nme7JEjImVw+DKL+UjECKOJzxtl/0ZWj4PiEN6t+usXKNgKa3RsH/v1vYXwn0XSv/Ckt4f59ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Lhg9odyrMlZFTzxre2T8Uvu12G9p9xI52b9P7f340=;
 b=CzLQZkBCqizOlvAgWuCoqrC5DbkXhq/rLdEztKRTV7ArhwJwwKBjVx9sX3as1S87iiblGV3IXL2Jq5jjUc8m6UXujI4wkO/GARX+Co15K4G0Lgi29I2owBZEcFrgj9qvfVlBVSCQrUWY/ms5D6nSNPL9C4cvTOKXdSGd+x1iLDsTqcNRhAlzhhMtq9uZAvLp1iYZyM+bgyr2WizNsFme3ZBpSxk/N1NFWH12sLgV77Jpb+9cOfB3qvHJeeMaSjAa7oYvgqyxYmcnjTZJWKEsR3a/NACfn3ROtNjIcKZ8bo21jRFq5ekNjr68MBUKPSA9y/8UXBAOZVOHxuT85TegvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Lhg9odyrMlZFTzxre2T8Uvu12G9p9xI52b9P7f340=;
 b=XzjSni2jeAXbLuC7Z5ltpIYi40HG2b5fTx533Umy5WTv4P92NvkAGhsQ6cFWJLeWha8XjnvbNYrwaRGivML6DpI+fC/UtRIs7fqhbHX/n1jK/5Y7ZFwjY4J9PatRR3rLFylHOxJUqd5J/RZzrXVACmKA38x2EnGA/Fqz4+e19b9/DgLG8F7q5kyTEEQA4HzGEPD/M0wlQntMknEFcJBaU7huVw/Hadt7d2xkW10AD2QEEJkB9eB/JvHZej7+BeTV35M2hzxZ6+CofMfcmF9ymCn/QXtGTSz/r5mkaCBzGRuoaSohFoVV6ohTTJ2k1Fq3rWDb/gMkYrPaShM4OY9zwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3de3481d-5884-02f8-6f32-faa53d16ab24@suse.com>
Date: Wed, 25 Oct 2023 13:51:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/vPIC: check values loaded from state save record
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <060ae425-2daf-9ce4-d291-215d483d592d@suse.com>
 <ZTjp_LYGwvKKumYg@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTjp_LYGwvKKumYg@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f601a0-fc55-489b-11dd-08dbd550ac54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zJVnHxy6pVQ4O8yiyvsdi2QxYuEBZePrao0HTvl2WcJ1RQQJu/eIALQq9r4fbIMk8El1OnWVy8PQrQGdLZB4tEXjcNMDCVvEsKxK+B2LsHA0fkERjKXWwxqEk/dhAuBx8kOiUfjjkOcLiHJ/LDPAY53Qnkqf0gDO3xTm2TE9Rvv3jSaeAe30bHuX/IESqs8oVEXS5om4501AXUOiRGYkbQo8etLa48y8Ae0/2lBvvX7beaDhXtAvlhvIXMDKpAGKQUpWi/HpI29Sn+Wwj50aJzNzmJUAA6yuacF2C3RCkTEZy37W1nTgMP8Cx0v7/bSZEXzKDrwR7YwQNkLhmr8UGSXAoWTFGEEiDLyDrTo4blbntubi0hKmE4mFnSqQHlmEW56hrMeZb4U2cBcboylT5Xs52DJ6KJv12LaHK5Gp+lGZNmLce1MRqS2sYXDmHlmTQxT/kVezssHT648asIXwC1hbaFjBpwrvGV+RKUstTd8TXfXqHzAPQLgOvkc1NEdRfFYyVOhT7LkviaEmDAm7L1fC7/63WvKiLpFmgnVxOGiBZ/dK106C9GmxWqExW6asrbwum8ulnx0PotFg362pRYVhBRLvS/pD6gpT6SRLWw6lNHaxFq3mQhdpNWmUrGsjJDTdzr7BDLEPRlW3L+s0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(53546011)(6506007)(26005)(38100700002)(86362001)(31696002)(36756003)(83380400001)(6512007)(2616005)(4326008)(8676002)(5660300002)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(8936002)(41300700001)(6486002)(31686004)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTB4VzFTN0tNbGtUWTdJRkZhZFdRbGc2NnpBaHVrNkJZdVlFcVFaZEFXSWRD?=
 =?utf-8?B?blVoeGN6YUQ1K0M5SFhlbTUvMi80ZmRUN1FXZ1ZxSU5INzlGcEZKUWg0VmxW?=
 =?utf-8?B?SUJ1ZlZxR0NjSXNSTUNTM0V3UFRrTVZmQXhwaVRLME5RUlJWVjFmNitZeDdS?=
 =?utf-8?B?YlYzWFhsbmtISWNyRUZrUm1JOGtRWjNrU2gvT1dUNEtWOWw4eXFqTzJzaUR0?=
 =?utf-8?B?ZXM4TVpGZlg4REIzOUhmOGpkcG1YV2crc0wzdGprS1FZdGJycm13L2ZjazBU?=
 =?utf-8?B?K05HQy9sVmIvc0JDSnkvdW4zUkdVcTJycW9Jci9ORmpHcUhZenMvWGxaTG1u?=
 =?utf-8?B?b0ZjNlg0R0tFZ0ZrbmFRWS8zUWhJMjNQb0dUdmFpOHQwNFZ1VjBNOUQ2SFJQ?=
 =?utf-8?B?RDBXa0FPRFdZVEt6WUUyOU5ITmEyMUxidS9iZ25UaWJ2dVAzWXdvcmo5YnlW?=
 =?utf-8?B?OGpKWXFpWHdDZjV5dEhIYkk3TkhqdndVc1A2NFd5MGNESG95NGg4amwzVlY4?=
 =?utf-8?B?UXdtWS9tN3ljZ2RSRnA5OStxWmdVMGFPNFV6bFNIYnd6REc0MXY4QTVaTXRw?=
 =?utf-8?B?WkpGeXFPTDB6QWxiVWMrT0FrR2NIMGYwd3FTcVExVmw1SjM1VFZ6eFJTbUtP?=
 =?utf-8?B?YmJGaGNWQ0hXeEpxek83OWFCeW41Uk5wSExKTDRyK3g5TlE3dnpTNDhqeW11?=
 =?utf-8?B?ZmhHV2JyemlSQ203ZEJlbzVnMnFFWmRXNG9kVk1mWVUzV0RybjlUaXErcUx2?=
 =?utf-8?B?aVU0Ujluc1lEbUVIK29tWkFPcGVFWEgyNTlCajJSdFVrbmxWWlJBOUZYT1hv?=
 =?utf-8?B?RTRnanpSbWtUV1BMSFo2Vkg2RkhXOG1BOVF1U253ZHVzQVkvZGJXem1wOFFa?=
 =?utf-8?B?TkdRUVc3Y3lwZWhwMmduajhibExPV1grMFI2bEE4M1cyVlJXMUcvc096dkY0?=
 =?utf-8?B?V09SaDR1U1R2ZzJ4ZzNBQ25GbFQ0dUtaRlZVb2FiSGowN0Y4ZWNMd1QrVmRi?=
 =?utf-8?B?UUFPR3FoK090cFZOMndXMXNhUzVIT2Z5MmxFQW04T3RmT1VVU05mOWxBcXFw?=
 =?utf-8?B?d3J3Z0RyWnljU21JRlpZNnBqVFZWRlBwNE5hSWltL01SOUtsRHlLRFgwMUVq?=
 =?utf-8?B?djRVa3d1RUZ1YS9waHFNQU8xNGVHREZwZ1FTZDlKRFJMR1hvUFA4WGlPczBR?=
 =?utf-8?B?V0hKL2t1dmJ5VmJKb0RPVFJLS0pOb3NMZjlZS1Z3UURuTE9nL1RGaDhtYU9V?=
 =?utf-8?B?R0kyVzF3WlhwSEl1dS9mc1U4WkxQaG1wZFRtR0Y1bmFzNUVFWURuQXJuVExk?=
 =?utf-8?B?VlFCeUpwQ1FpUXpaUEJEN0hKZDZCQlByZGkxbWdDT2gzb3Y2V1RobXpCOG5D?=
 =?utf-8?B?SFZJbVhXYmdFSUtDTWRlWVh3SENuR1RHVDhFbm5nbCs4eHBYQU5MdFVVYXpC?=
 =?utf-8?B?V2xlZDdDSlRoaVJTa0pjVTRuQitFWHdZd29EMVVnTWh6dHlJWkhRU2FtVlVR?=
 =?utf-8?B?ZTdmTW1DYXhRZ09SU2ZYZXJJVCtmN1p5MVlCNGR2RmhzNjVienBYRDJZM1Ro?=
 =?utf-8?B?MEZyVERNUDNIWWZRRmR1NjhuT0NrNzg2amt3ekEwaGVma00wRjZSYkYzTEx4?=
 =?utf-8?B?MTFFekVCdk1MZjdCWko4NzRrd0VXcG0vUVNHeFN2dGF1b21DQVgvTytVUnY3?=
 =?utf-8?B?UFV0aE1ncHJVK2FaQktwVHk5UERReFFUeUIxSVU4K0d4QVp6ZmlXa29VUVhM?=
 =?utf-8?B?eXBseTFLNmg0bDlIWFRZamc1aWZRZjFMZWtBVjlpa2RaTjJrY3RTQ2h3cGVE?=
 =?utf-8?B?VG92d1ArNTB3bTFCSTlKTnRtVDBVQmpITWl0SXhTZ2dDNUhhakJHSVZhdnhj?=
 =?utf-8?B?eXB1Zy96T0UrVkVBQnBsWnY0TnpsaHlJeFNiL2NOUDFlazRNMk1Ib0NIUk53?=
 =?utf-8?B?R2lDblRCdWNhYW9zM1I2amtwZjQ5M2VXMTNDOEJHZHEvM1Q3RC9DMlBtS1Zk?=
 =?utf-8?B?WnE2OXoxMnJ2WE9hWWJ6dXNqRCs3WDY2K0xWUk5KRUljbWVWTFNXdHdMLzZK?=
 =?utf-8?B?eVlaY3dDQ2RHRjRZQllqVS8yZzZQUHd1eUxRY2pVbm1BWGFWUUNjS2tSTlJM?=
 =?utf-8?Q?kNz9hKv/F7v1UWNEHYZU+GWkY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f601a0-fc55-489b-11dd-08dbd550ac54
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 11:51:06.9789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urTU/F3nTJ/9FXNEfHNtcOy/QWqfMRDteL2Ss3t/bhm4mqbo9eljy9zfrQtvx9Bhc7HUcs1FBaJft8XlfH7W9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888

On 25.10.2023 12:12, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 01:50:33PM +0200, Jan Beulich wrote:
>> Loading is_master from the state save record can lead to out-of-bounds
>> accesses via at least the two container_of() uses by vpic_domain() and
>> __vpic_lock(). Calculate the field from the supplied instance number
>> instead. Adjust the public header comment accordingly.
>>
>> For ELCR follow what vpic_intercept_elcr_io()'s write path and
>> vpic_reset() do.
>>
>> Convert ->int_output (which for whatever reason isn't a 1-bit bitfield)
>> to boolean, also taking ->init_state into account.
>>
>> While there also correct vpic_domain() itself, to use its parameter in
>> both places.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course an alternative would be to simply reject state save records
>> with bogus values.
> 
> Likewise on the vPIC one, I feel it might be better to just reject
> such bogus entries, instead of attempting to amend them.

Perhaps we should discuss which route to take on the next x86 meeting?
Then also Andrew would have a chance to voice concerns; not sure if
he's following the thread.

> This one however just unconditionally reset some values, but might be
> simpler to just test if is_master == !inst and if it's master than bit
> 2 in s->elcr is set?

vpic_elcr_mask() also wants applying (or a respective check carrying
out). Plus int_output can't be left alone, I thunk.

> Also if we are serious about doing some sanity checks in the loaded
> records, we could introduce a checker function for the load machinery.

If we were to check rather than override, then yes, perhaps running
through all check functions first would be desirable.

Jan

