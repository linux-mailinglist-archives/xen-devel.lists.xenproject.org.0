Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF8545D6C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 09:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345907.571589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZ5a-0006y2-Td; Fri, 10 Jun 2022 07:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345907.571589; Fri, 10 Jun 2022 07:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZ5a-0006vN-QU; Fri, 10 Jun 2022 07:29:50 +0000
Received: by outflank-mailman (input) for mailman id 345907;
 Fri, 10 Jun 2022 07:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzZ5Z-0006vF-Jz
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 07:29:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe05::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b935de4-e88f-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 09:29:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 07:29:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 07:29:46 +0000
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
X-Inumbo-ID: 1b935de4-e88f-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUnzLSENuXk3WIqnRZ1TXTwPbNe+gJnMmER4Yd3/0+rIBVVu4sQQ1st7d/7uDxHugDAmhaT2sUh3rr9iLma72ymQU7ZlHZRnrW7M3bHrJKNiXSvskpG/oJMNECTGs2jQPd053B7RomuF6LB8wdAAIO6Mu8N1YEEvefo8nERw2Ujb2p/lBzw7pJg4yK2R6lDTqbBXnu0Zx3boue+3x7ieJhpZ9NJJ1zE85jz88Z9OCWLRuc1Lx7IuchyRVcauwibbsUFKhFBgFrruGOk4CE4RIzwHGdBMyB/9sZuFbYv0a9OI/qXdMMR7FEO0xl+qcG5aXWcOIVDqLxuNTN+Tz8G5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFg+SRh2mEXaz+2IS2BU3ZXUtqSbZI+ynce61REkwpI=;
 b=O75O9EkNcSa89GGrsTunjUL2OB9jgXjjdAYjTRqEupBWvjo2Bn7yfmubHELVHmblOKOu3hwdDKheDLt6SfFxfDHVxKheOer9NgHdriUnMe8TsvFP3XGwq8RAF1v1emvgcveTzjnlSKKlD7gpF1/bVe54qo9tvz4NXOPd+t2YTt9oSsfvV9jVPJCOCZ798a7lft1Lda9ah3TAvJ8oRk8V+M0gg9o4HQtuqnO17yi50fdMcdZ7uiOGxTOyvIB03QcJqDtAKJlJjkXTihHmMqUli1l38cykfR9y7LGNbtoyPUtkW3v3FQyOE/pL61MVOdHNw4oWqBWvkpp5QW9blwo64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFg+SRh2mEXaz+2IS2BU3ZXUtqSbZI+ynce61REkwpI=;
 b=wntGm+yCCZTV1mb04e+34RCDeBMs4Lf3pc3TQEqALradhVRrxUAT3RMJgL9/OhS8YQ+r1g2j0MssaiTxBR+y2KLCB3KQP/WhGscpbRzhSXz8HeCMCNuYAaeLGnaqIZrFOH8SbtgGBetK8xP4f+3rvCE6xGFKezwcnhHE/kF27C0a+XypL3r/d4wuQ35HKVcK9lfXlRNNxvHAKT5yhgZ+EeC4a3Pg45yKg7AcOKm0NcvMNhhTEIl7oNfCXLuAgg5AeVQom8oxO/ZjSIArKiTQ8Jka0ThUecu3WTRSuATfBnKvj6aoA5LBL80WB10tYaefzH43h7IxPOxQKOFV0kVigg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26f619a4-d0a8-7895-2017-cda17526b48f@suse.com>
Date: Fri, 10 Jun 2022 09:29:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] IOMMU/x86: work around bogus gcc12 warning in
 hvm_gsi_eoi()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <52090c8d-fa21-6f53-c33b-776c12338f62@suse.com>
 <YqLwpGXxCHy5HJpg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqLwpGXxCHy5HJpg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6583c1d2-5cb7-45f8-30a8-08da4ab2fe9a
X-MS-TrafficTypeDiagnostic: PA4PR04MB7759:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB775906422E61C440119EE28CB3A69@PA4PR04MB7759.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B+a/WLxJkn8+Gr40/8CguyMugCbnLM2iFT8JbW7wVBSw3+0K2r9x7sdPMvcsA3Zc2AtL4Aef28Awp+2mdexocmBBoMMXP25GVa8SwKtPIqyUNCJSZ5ImsiYp7xVCOrs8gEbLHsARVrgdCZSA3mJ3p9fExWfep47HplE9jX3ufLozjhyefcOxeHKgDs6yiNIKVExag75xEibQ6wY3sRQjXpD+trppoljFgG9t3bliK+lF4bClnQOhgjP4s6waOv8Dg7t6xDCUpRT4UlpdU0Tin1h7L719Al2kV5km84rWJuDNCgNSUvFqA/5k3WC06hfQZdhcLT1FnLomhHMF/1ebhZvUxYPP0pQEzEhrmFugBFAjYPytDoK8ZK/qoUxL8apWRUafXZFOEexcWrO5owy65EHHiGIN7koKXslX05XSaOCDtgL5Uq6WpoNrKccgzsBBr9zWkMkRwfABJIPyouxRPPnQiNaLQ6uW/zjCC7h20E05KEKpd0z1iv6WHa5TkAdb042JUPBpwUnDJeHi8DIDY+8WymB0WS5yXIBL7UI5oNrSdc7cSSas7Ho5lwUJkibl+jcvWqHfSHI/N2BfrfSUKbC3YW8fsqtcCb6XZHI/Oeu67Osr9jJIx65zAME/stnKJFP9lHfPmh2YP57nsq0y7n1LkxhYkDCFJS9xZHRincy4SZsYCWumFqtS7tr2tjte2npCzXoVoT+SNq/RWhI6JTGa7y4bqbrgq6vUN5AKhEScxYp/pQ+jDjQHHL+E+MwMgSUnMX9I6LjVtWONNZNEB1uoVhQYRXHmqOyRt8rek+qO3fQMQswjOGYqsEYBp0PuMKRD3c5WWq3iZSeKhtbA/r1l376R7zRFCnuFPJmosZHXQHoPIBq2Oe8/E9sfSgAj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(54906003)(6512007)(66476007)(66556008)(38100700002)(83380400001)(53546011)(2616005)(8676002)(4326008)(36756003)(8936002)(2906002)(5660300002)(31686004)(6916009)(966005)(86362001)(31696002)(6486002)(186003)(66946007)(508600001)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEJJcytRaS9aRlhnYkkyamRtTDBaVWRlVXNIYnJiMmVTK21QNzA5OGhBUk9T?=
 =?utf-8?B?aStPUzZpaUNzamZ5WnJGZlJNa1ZWR1F6aW1Nd0RKQ2dHS1pqMCtIOG1FS1Jp?=
 =?utf-8?B?NmhFb2FrR3Q4WGVhamYxZEUwSlNpbnVHQ2tLWTJTNHUxS1ZlZnJ5Q1BVOG5k?=
 =?utf-8?B?R1VOM3lGTWlrNUdOZjJZY0ZnU2JGTkYwLzBGZE43NEx1QU4rZDl3RHA5bUVq?=
 =?utf-8?B?MWlLWWZ4L01KN2ZNWnJ4WWVWeE5DUU4rTGdFcFlmbitZc3RucGZtSVJUZnZL?=
 =?utf-8?B?MVJNK1Z5ZjdrVmZYZWJUMm5yeDBscm9iSlZLbXNJL1dUTjJTRGEzTDRieW5D?=
 =?utf-8?B?eFo4K1B1NzVSaE1nUmU2WmlLemFiUVF5eVdjUVBMQ3Bka1RBY28zbk9NWWVZ?=
 =?utf-8?B?M1ZydWxKekp4dG1GUVE4T21saldBbHdIUWNIM0VFOTZvWGxMZ1lxZURlSWdN?=
 =?utf-8?B?dldrTENNN3A4aWtxZnRTVlpDZUVlSk5MK29SU0N5OTE5VWZpeGxSd0R4a3Nx?=
 =?utf-8?B?ZzdqdWl4L21ZUFIwZGd3Uzh6eHNGa0p2WWU4ZkhUTDJCaXpmdktscFZ5WXJn?=
 =?utf-8?B?YkdZekFRYVI1clg5bHNFaVFucTlTRmMrMERLZUhlMkNEUXpjS0dsaVJLMCtL?=
 =?utf-8?B?S0lBTVhwMVM4U3Q0VEZBQW1GU3czYXpmZU5KN2k0TnZ1b3JSMzBGUWV5c0FE?=
 =?utf-8?B?d3p5Q0wwajhXY1FtTUxabHFpcWpFTi9yOXpSUEVNSjhGSVFFTTNjaS8zVG54?=
 =?utf-8?B?aHVjcjlSYU44OUdpUXM3VkFrU3BhdzhUcXJzRzJQS0ptbVQrWTduWGRVR04w?=
 =?utf-8?B?WHdwRldoK29ZTHdLamNYZ0htTkc4VS9ZaDdCazliSjNtd3lJK0NqdmhXK0ps?=
 =?utf-8?B?T3VmaStzK2R0TE5YSFhzYzZvdGFuYWNjY2UzYzF5dWtENFEyVytNUkg5aHhZ?=
 =?utf-8?B?NGQyUTk0dktmWEdSRjExV1dZZFpPRWZtYzlQUnV6ZTRzQzBybnkxa0J6Mm1m?=
 =?utf-8?B?N3I0WWkvOS8zMHZiUnp0ZzlkZVFCMUpJNHNxNVpMbHNwSGZaQ0VnemN0OE1u?=
 =?utf-8?B?VzlFem9IQzhvSldwcGhoVlFVMThiYlV4N2RmZE1HK1ZXNTBXYVE3YkNFSURt?=
 =?utf-8?B?RFZRdVU3QXhzRmZtRGNYYVhodVNnbVRLZlQ2SHpmSm1La1JpWjRCMmRBTVlw?=
 =?utf-8?B?MXNBTkRrTkpkQmRJNW1JaTREcHdPQzZHRXQrMllwaDBTazhyNHZqWS9SOTNq?=
 =?utf-8?B?SzZiVmNrZC9FUmkxbmRiR0VDMnBrR3ZDMlh4a1l5VUZTSVlhaElRRlBab1FQ?=
 =?utf-8?B?UmNKZ2gvVWFyQWdsYmZ3ek8xaEQ3ZU1rOWN5Uy9vNG5Yb1pwVHZRRW1JL0ND?=
 =?utf-8?B?UEtKdGpLQUZhc213NUUxczgxQnFjWDdyYXZlblo4QW9VeVVMWFN2bVpoV0ZL?=
 =?utf-8?B?QkZzWmxiNk9tcGZZVUU0bnAwdGtkUVp3QlN6d3N6ZG1qSVlrL0hDbklUQ0xz?=
 =?utf-8?B?ZWgrdUxmN1R6dDl4OUcyR08vSjlMSFpHOUw3V0lDM2EvbVRvQXVFazhZei8y?=
 =?utf-8?B?eXl6OTRXSVQ0cDdvNGpmTTdjOTM1RTgvVG9qK1pxTG10bk9UK3crUUJIdXpH?=
 =?utf-8?B?ekNFaStKYSsvWVF4UDVZQTU0TTNVQXd6Wmp1aWg2Q3E2bXIydkI0c1ZoSFFw?=
 =?utf-8?B?SVpUOW14azRzR1NodDZPdHBIdjBibUZyUzNoYTlsZXFRMWdONjlucFZYZHk1?=
 =?utf-8?B?M29MYUZTNmVNZ2o2alEzNHMvV2xKUjc1QmFJR1RPY3o1VFhwQTdkUUFQRFBt?=
 =?utf-8?B?cmdZZUpaYVM2bklWYlJjM3dXUHh2dXl3dktaZWRwaXdnRklVbzY5QjM2R0oy?=
 =?utf-8?B?c0pERWVhOHFoSzlKT1hpb0paMk8wQzF0a3hNZzA3K1k2VEdQR1BTNGw4cDFQ?=
 =?utf-8?B?cjJJdmZsWWIzZlg2RkdBWU4vUnViR2lHMUlBa3RVV1VtTkdyWk5vVHlMb3Vr?=
 =?utf-8?B?c21QQU9jNERJYkFhRjMyeU9zV1NYZUtYa1IvS0t4Tis0dFQvbzE3cUhoT3Z6?=
 =?utf-8?B?SjhVRmxKK2xaTU85K090bktWRFg2enpJa0pFa0gvaDZpTG1vWERFL2k2VVVj?=
 =?utf-8?B?TW1RaXcxRFo5S0NFRUlqc3FoNWowZi9RUVVzRFp0WGZjQjlQMytoQlFsT0NR?=
 =?utf-8?B?dHVJdGdRMC9KWnBRSmNuWWhVSVZybFB1enY5TlRQZm5UdmdsdzMyMU5yU2p4?=
 =?utf-8?B?dytTcVZGM0czYmV5eVR0VE44Lys5aS9yTExnYmNDL0JvcytBWkV4N09nOW9r?=
 =?utf-8?B?UVduZWZxdkRILytXanlTUW41cnhNRkdvMjBvbEpjZTErRDYxM2pRUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6583c1d2-5cb7-45f8-30a8-08da4ab2fe9a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:29:46.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCrLj4Bj8/IWMPJTXzEdoJINLxfg7GplRQ+v4zG7oK8+wR54e/N5K2dNMNtx73JubMka7ZHXCZk5jI/mP71nrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759

On 10.06.2022 09:20, Roger Pau Monné wrote:
> On Fri, May 27, 2022 at 12:37:19PM +0200, Jan Beulich wrote:
>> As per [1] the expansion of the pirq_dpci() macro causes a -Waddress
>> controlled warning (enabled implicitly in our builds, if not by default)
>> tying the middle part of the involved conditional expression to the
>> surrounding boolean context. Work around this by introducing a local
>> inline function in the affected source file.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967
>> ---
>> This is intended to replace an earlier patch by Andrew [2], open-coding
>> and then simplifying the macro in the one problematic place.
>>
>> Note that, with pirq_dpci() presently used solely in the one file being
>> changed here, we could in principle also remove the #define and use just
>> an inline(?) function in this file. But then the macro would need
>> reinstating as soon as a use elsewhere would become necessary.

Did you read this before ...

>> As to the inline - I think it's warranted here, but it goes against our
>> general policy of using inline only in header files. Hence I'd be okay
>> to drop it to avoid controversy.
>>
>> [2] https://lists.xen.org/archives/html/xen-devel/2021-10/msg01635.html
>>
>> --- a/xen/drivers/passthrough/x86/hvm.c
>> +++ b/xen/drivers/passthrough/x86/hvm.c
>> @@ -25,6 +25,18 @@
>>  #include <asm/hvm/support.h>
>>  #include <asm/io_apic.h>
>>  
>> +/*
>> + * Gcc12 takes issue with pirq_dpci() being used in boolean context (see gcc
>> + * bug 102967). While we can't replace the macro definition in the header by an
>> + * inline function, we can do so here.
>> + */
>> +static inline struct hvm_pirq_dpci *_pirq_dpci(struct pirq *pirq)
>> +{
>> +    return pirq_dpci(pirq);
>> +}
>> +#undef pirq_dpci
>> +#define pirq_dpci(pirq) _pirq_dpci(pirq)
> 
> That's fairly ugly.  Seeing as pirq_dpci is only used in hvm.c, would
> it make sense to just convert the macro to be a static inline in that
> file? (and remove pirq_dpci() from irq.h).

... saying so? IOW I'm not entirely opposed, but I'm a little afraid we might
be setting us up for later trouble. 

Jan

