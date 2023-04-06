Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC06D9C9D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 17:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518938.805970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRoT-0003qi-KO; Thu, 06 Apr 2023 15:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518938.805970; Thu, 06 Apr 2023 15:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRoT-0003oE-HQ; Thu, 06 Apr 2023 15:46:13 +0000
Received: by outflank-mailman (input) for mailman id 518938;
 Thu, 06 Apr 2023 15:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkRoS-0003o8-4E
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 15:46:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247cc80c-d492-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 17:46:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 15:46:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 15:46:03 +0000
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
X-Inumbo-ID: 247cc80c-d492-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4UssXYJBhiBhKXc24U4kLrz4ABPVGONvoYBTbKauR5lXiNG8v1fVSv26GQqf7tSaENFasxFzORzyx9Ye5cucNBjUcebpSqN6z8oG7s9trtwSR8WYyzKcSK7ujDZJ2RJGvPur8Rz2FCulNjUKoqlSyQ+URIAVdvZI3FsQhG35JEreN4vNI3hhaQm/JYBfdrBOjnPpNh3PK16qAnHnJdYzDRYmaN8M6p/ruOmwSScN1hQZxVPsDY+gW+nZ8NMlJIZ5O6ulXKAi2ZwWtVot46XGFGgUXVIe9QA9bS080y7u9PaYDL0AMcuschejxnAcnzyR5j9+oPXmMIIMqPMXozecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thYrrAGxFG6X4w8l/nrCK7sjikeycPS+9A4eS6t2gXU=;
 b=nOaYIJKf+oVkyovyP8xoaeWKTIZ0umLtrQfZZyRsUsSwldpeZ6Buqn7Zpm+KJZjR6vqaYyuEPZTEfcKV5Ew1Rr0Q3gejHx/HeJdWjRG41GDWJcfTZ5lnQ29yWL1OoJ6e9hThyeqU12Vdh+4IHOlCW6Zt87sWjQUWc2T9vUWES8djkBDwSuftXSHI5soyETPtrBF5GtlMYAEmwDcifMh0GKE7rkqsfhkwddf5Lqv14qDGnH2pFvqffg4QsztVYsjAssoFzAWk/pgObGwIsMhX4oEDheSqgYnTaslu6q+XrKBcREYm9a82bojc1F3zo6McVq3lBxsp/OeL7WY7fGrDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thYrrAGxFG6X4w8l/nrCK7sjikeycPS+9A4eS6t2gXU=;
 b=gr4BwqNG1O2QaOC4XMYhs7ujM2ILbS7oV01f7skkl7XlONLGUdqUwLrj9n1+4l3EAsfLK0B08BwYgDrKBH8ba+M0D61Hbp36Y9KScmj9XGeHvjqVkHaHgRmJ+tboZou1IEZ+QvokAqSUynQrUjrn/6pRPcrkIs+QKzi+ZS+Mveoh351qt2NdFtColp14C5SzHSkERgIFFK6Qk2HTXfSCbBHOVqsgPuyUXMxIg62BYTqtkgyF084PzNySwwuzZo/c0V5ASadd81FIvqr1jwAZ9NdNVTEs9YJ5bh1S+DU6HoOZy3z7DCajyPH1FCM+n2FaGSa0UYMofyPl41LwNgn4gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b1ea79e-013e-f5a5-eb36-a79e400a87dd@suse.com>
Date: Thu, 6 Apr 2023 17:46:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86emul: avoid triggering event related assertions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e79b3b8e-666e-b94f-d2c8-1ec2f6f5453f@suse.com>
 <4fc4f5a9-0b9e-bb30-df32-09b5e9e63a57@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4fc4f5a9-0b9e-bb30-df32-09b5e9e63a57@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3071a1-9b86-43ec-d921-08db36b606f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjqlDdbb2WNUYOPqfM9I5B41VwononOqYcD3p595yH3zfTkHi7lh3Nr0L7CWaa8X3xFj0Noyt8hKqR0ojjLuVsaXVKxO2JM3/v9cRUQxaArUP0y/VQwrwXfCGJUN72QNH9zWFOokzCU5rKjCBNjgSZ7emy0MuW5w0Pg7Wpv43vLF4xIl83RK3oTNhfglyNKTbdrHmGkig1Y3lWAYGVuJ0ubzuroHMwq4mUy3c3hNXOooydtZCOhumqQWjT//DKA4ygKuw3FbtWBV6iPdr8xHcfnd+uFjyTlAeaoza+d+qhzsEj5O5Z3JjJisTMWPSMwuxLukyr9NtaFhw2dvcCH1L/N7HO2oTCtlhSalOVLeHNZz/Ydze+2ZEGhYuAxSbiGiTllCM4oiK4TIClE021Q6EVpvUOcRz3qx1mfTQAT8EhWpjnj1ePJjhFgTZIU0BbOSSOdzJgN8SCc1l6bfIxTwvWuXahXfUrSb86jjiILch6mMB0bkiT4K3F0aJY9Q3HXbX/StS1ZyjIqSv7m7lek3K3FJMRiu8Wg3r6A5pp7WwXLnthN+GNE2t2y7NdOndMDvIy7H8pG+fG62fzNE/HthWKBOcnzOuc1h+eVufBRBJI8kCJshXHOBqIrTYF5GKQT9/JaapSGZbe+P7F3TOLsgKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39850400004)(451199021)(186003)(26005)(2906002)(6512007)(6506007)(53546011)(38100700002)(31696002)(86362001)(36756003)(2616005)(8936002)(41300700001)(5660300002)(316002)(478600001)(54906003)(31686004)(6486002)(66476007)(6916009)(8676002)(66556008)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWxMRXNZaEpBZ0RyZTBxcHMrb081bjE1T3Z2QmNBVndiSjFQZ2lkTXl4ekxh?=
 =?utf-8?B?VXJVa3V4d3hXTFNwMkY5d3pCSndOTVo1MmpRVEtrdERSUzhqTWFyaGxZaTdR?=
 =?utf-8?B?eUxYMWk3U1prU29LYTJQcjUzUm5FZUlHaDExUHpleTNxYXVDT1dXc2h4aHRQ?=
 =?utf-8?B?WG1pOUo3ODM4eS9RN2E3NU40OTV6WVN0YWhRTHFXait5aUViblpyK0hJeEdz?=
 =?utf-8?B?TWtCRzFNSlNtTzVXdUdjeVNOVDRFV2VhbXRYNnhZR1dzb1lwU3lQN3FhSmJa?=
 =?utf-8?B?YVg0U082S2ZZVmo4VEFjR25qeFNKUitRQnhhTTlnMWpWYVArTmcrMjQvbC9H?=
 =?utf-8?B?MlRkZGZZemU0TDlqemRab2tjSU01a1U3NEt3SzZJaUVTZGpHeUVRUnc4Tlc4?=
 =?utf-8?B?enVWZHdFRjR4K0g3a3M3b0hsaEg1Z1d3Y0U1Q3VQdGdHLzZEeHlKdy91MGJI?=
 =?utf-8?B?NmkrV011VEkyT1J0OUlieWoxaFM0MFovVkErcEZhS0pRYk9qcDRYZ3lWMHVJ?=
 =?utf-8?B?RU1IeXlndjQ3VG1hM3lDbGdKaElLWnV3eXBsUGRIcmpUUFpCMndXR0E1Y3Rr?=
 =?utf-8?B?ZVNPNkJzVXVLVlRhSzNadHhUamRTaTVEQmJERGxsL2Q2MWd5QUFYZEFKVmov?=
 =?utf-8?B?OXZsVWhIOWVBelpTYklLMzRnSWEvc1JDMkZNZHlHeithOEtiRzRnSUVXWHpE?=
 =?utf-8?B?emxQYlUzT0xTcTd1TUo4WUNsUXc5UXdzZGtrdXhxaDROMjRsS3llemFuUHBN?=
 =?utf-8?B?Z3ptZXlUSW93bXNyUHViSE1BM3V4ZkdNQStuaXlIUU13UXZPSWF1Q3Njam9l?=
 =?utf-8?B?TXBxbml0bkRjaGR5dyt5bUtPdnVINkVWN3k0T2VzZDh5a1F2VW5CY0dtdjFR?=
 =?utf-8?B?QU1paC9TelEwZ1JRTDAxTVkvOUkzVXYwSFY0UFRnWG5ORmZqYmgzc3VIYzF0?=
 =?utf-8?B?akdWQ2pyY1BtSFlsR1hnZERJaTRkUW05Y05rU0U1TzZUc0JXRDU5dW5KZVhH?=
 =?utf-8?B?a24ybDZZUHd0NlF1UTVQQThGUDhYOFJiRUp2OGNVRHBYUzVYbUp3TXN1YUMz?=
 =?utf-8?B?aXl6dEZRNWZ5NXN3SEFOVVFQdnplcWdSYmdsQlJRTzJpZldTQS9YcFUvYWZ1?=
 =?utf-8?B?TEtwcHZodHJJU1ArSTVNTjlVdHU1ei9GM3JwRnJoSEErVTlmaGRJZXBtbXlp?=
 =?utf-8?B?ZVNYWm5UWGF5ZGJ2Y3B6bVVURWtWLzdGT0ZzaGo4UE1CQkUyemlLZHp6RWl1?=
 =?utf-8?B?S0M0b1pWNEtJT1NIWjFQSGVaUUgvbDhaclgxSFRRMCtGVFpHSCswaGFBYWJv?=
 =?utf-8?B?ZGl1WFJoenlWeE04L1F1ZnJvM1BHbVhVeURJMjBDdXdpRnRaZWxrS3FlUy9m?=
 =?utf-8?B?ZmZPSGt0NDV6RVVISmQyNmFFMUhhNTBKZTBPaS85UTdRRzdHRDhXYlUwbDl1?=
 =?utf-8?B?SEVzNDRpUHE3NHJKL0wxUXRaYVo1cUE3Tm1KTUx1dmJrdGZkWWZQUVNsQjEw?=
 =?utf-8?B?RmxoSWxTNzBlZUxlNGorWE12OU5rVTJPMXhBTHlTSW9jK0M4cXFDUDcwZUdX?=
 =?utf-8?B?SUdjTjRPV3BRZGR4SWpyR1p5TVRQRERJUXNWcE8zNS9SZ3phZ3ZiWWdsbndC?=
 =?utf-8?B?WWlZcTVZVFl5dklpdjdURnVaTEliR2I3ZUlRaWZnS0hiN3JFV21kQ05tSXAx?=
 =?utf-8?B?eTUwVFNIRzBJak5MZEwvZUxQaTljRW1MeVlkNFBSenh3Qm9xWnhkcXg2cVZZ?=
 =?utf-8?B?eDV3VVB4R24vdkhWRGl2VXhtYWx6Mkl1VnhPbTAzODB5WlZmTEF6aG8rRGdk?=
 =?utf-8?B?SmtzcC9hTTFHL3lYV3VVd2I5c21zMFJaM25ydW5hYXUzSDd3bHJYODNScE5j?=
 =?utf-8?B?cDAyVHBDSWhTVEdheGduVEpBT1Raano3amxjQ0JneVBiUGxXNkgxWnkxMTE2?=
 =?utf-8?B?OGd4WEM5K2VvTHBFS0ZSc1o1YzBYZzdsKzRGOURYZjZaczBhZUlRQ2lBcUZ2?=
 =?utf-8?B?N2tQYnJmak1TSmtSNWRjbVRIT3JaZmZXNEc1Q1Q4U21QV3JOWjlmZyt3cXU2?=
 =?utf-8?B?Y3hTQ3dUb3d1dDBiTWpLTUlEemx1TnlDbkE0ajEwcnhkZUJJYThFSHdZRXhs?=
 =?utf-8?Q?wbbXAj8X+wzl847uQ84Nla7DB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3071a1-9b86-43ec-d921-08db36b606f7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:46:03.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+o1SYKtcG775HbCYT1TlM6VPty0FLGV7Jclr41OMIeGwikcpgyyM+GryPnUhPaOn+CJt876/CB2Gz27Jqn5Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053

On 06.04.2023 17:33, Andrew Cooper wrote:
> On 06/04/2023 3:15 pm, Jan Beulich wrote:
>> The assertion at the end of x86_emulate_wrapper() as well as the ones
>> in x86_emul_{hw_exception,pagefault}() can trigger if we ignore
>> X86EMUL_EXCEPTION coming back from certain hook functions.
> 
> Looking at the comment I wrote back then, I don't think I'd considered
> this case.
> 
> What I was fixing at the time was the case where
> hvm_inject_hw_exception() had raised an exception behind the back of the
> emulator, and any subsequent exception escalates to #DF.
> 
> I guess the comment wants updating to discuss this problem too, where
> the hook queued an exception but we didn't squash it properly when
> deciding to ignore it.

Can do.

> As it's debugging-only anyway, it might be worth rearranging the
> expression to be
> 
> if ( ctxt->event_pending )
>     ASSERT(rc == X86EMUL_EXCEPTION);
> else
>     ASSERT(rc != X86EMUL_EXCEPTION);
> 
> because it distinguishes the two cases without an intermediate round of
> debugging.

Maybe, but I don't think this adjustment would belong here.

>> ---
>> EFER reads won't fault in any of the handlers we have, so in principle
>> the respective check could be omitted (and hence has no Fixes: tag).
>> Thoughts?
> 
> We already require LMA as input state, and don't have an execution model
> where EFER is actually absent in the first place, so passing the whole
> thing wouldn't really be an issue.
> 
> I have previously considered doing the same for CR0 too, but at best
> it's marginal so I haven't got around to trying it.

Well, that's more longer term plans (and not very clear as you say). I'm
afraid this doesn't answer my question, though: Do you think the respective
adjustment should stay, or be dropped?

>> --- a/xen/arch/x86/x86_emulate/0fae.c
>> +++ b/xen/arch/x86/x86_emulate/0fae.c
>> @@ -67,7 +67,10 @@ int x86emul_0fae(struct x86_emulate_stat
>>                      cr4 = X86_CR4_OSFXSR;
>>                  if ( !ops->read_msr ||
>>                       ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
>> +                {
>> +                    x86_emul_reset_event(ctxt);
> 
> This is the only path you've introduced that doesn't restrict the reset
> to the X86EMUL_EXCEPTION case.

Right, other similar ones had to go into individual other patches I have
pending. The distinction I made was whether the call was in a helper
function (where I want to be careful, because I don't know what state we
may have accumulated) vs mainline code. IOW ...

> In principle you can get things like RETRY for introspection. 
> Internally, UNHANDLEABLE is used but I hope that never escapes from
> guest_{rd,wr}msr().

... other errors are possible, yes, but those shouldn't cause an event
to be recorded. Hence it seemed reasonable to me to flush events
unconditionally here, i.e. even if none is pending in the first place.

Jan

