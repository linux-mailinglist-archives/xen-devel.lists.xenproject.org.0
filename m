Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609BD752525
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 16:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563203.880295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxMO-0002XG-1s; Thu, 13 Jul 2023 14:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563203.880295; Thu, 13 Jul 2023 14:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxMN-0002Us-VL; Thu, 13 Jul 2023 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 563203;
 Thu, 13 Jul 2023 14:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJxMM-0002Um-GK
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 14:31:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 047dae3d-218a-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 16:31:56 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB7964.eurprd04.prod.outlook.com (2603:10a6:10:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 14:31:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 14:31:53 +0000
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
X-Inumbo-ID: 047dae3d-218a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn3JgjCVLTryE0nhQOK1kHTtf9u4H8+gLUYqzLFAORRu0A/5G10E3NoL6af2RtOGjVmDLxE18v+4g0bzioIkzAZNpPP3RduSz1gEcS4vZGr3kA7TgZW8G/lKBet+u6vj0ZTyW/0LTuFAtK/58eaCPLizzDHN0K5XgNXcO8KnKvAN1Ps8RhKJkhTl8AbwulXoo5XyVS44Mr0CGejXO6HKngvU2eWO30WFKHsv4uFDP95y9YPOmYF21D5pnF2kS9+NMzdM0uJd4I/1rH4ED/6ID36TZvLLCp18ReKB+ACXAKH46r+bf1IPSogD4HPAo5k5bOIc99klF2DUQQa2i4+sCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YWDZ3DnE2WqVOnPJEmvNbV7n+3zE2OC3vd+B0iwvPE=;
 b=B6Aj+ZWWPmwBMLO0cUA8mUQdMibsiAlqqcNapHUUjlgWONMSIYPXPPDAZvbcDjuopUntsnpCMlhm/J0ZIti+47E7oHLmErvloWHcIrKYiojTZ9pJZ/eCvq98d0AzqVuofRSEZ876YIT0q01GVX51JXu7dVJJbBlj4Q/7R6wMne89hsWHGdsfKpaQ7C16LSj7pehIVbp1sRquMXzUDj+dd0jYYCshjmgRLLM68du2Fx6g/DnuIYsPeShiYRfWilAkKCrIsw6LUeT/o1Zz/AuV+4MpNP2Ny7pAiRVO0w/lIQWvqXGswdQ4JxQClyAndb64oVQkROqBVWZbDlsTCeW8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YWDZ3DnE2WqVOnPJEmvNbV7n+3zE2OC3vd+B0iwvPE=;
 b=OMKFyQo/hvwmMJjijYtWIx9jojv+R5Dr3P3A6YiABRdpD1xRWcGE1Mhs3dVm/9UJ/8kfD1F4GNGGtOj+edBXps/6LwBybogv9xkGHFvCKLU6SMi7pcVCUMBTmjEuFk068FlUpAnE7DLgHU7hJmvfEJ//+065zP4LWZWMxf3/3SJnHhfpUoU9PXWDg+91UrSbwLoF4A8IWcKRqTAC/7tJbmv+3cLb1AKZTph6/UlX29XmeQ+gdyL5nIBxL6cR5G54F4oA5vnzQhHxvBth8T9OykB/AxFPUkEOdP8/xLhlL8NGxZZ2aYmzEnqj4FPbV4ibY0P59T49cfD/vrX06CCb4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72553e6d-b459-784c-bbf0-dabd8700ebc2@suse.com>
Date: Thu, 13 Jul 2023 16:31:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
 <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
 <c07a096a-9089-f600-4acd-30ae4d929d5c@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c07a096a-9089-f600-4acd-30ae4d929d5c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cede1a5-5dd9-46df-49aa-08db83ade6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fMam075Xa5WgCu1tmk2BO0d/50BW0uryz/r7LnTMAtHRkt2PrBdyVomCfp/fuOJ2a/OmK6No5SZ7I1BCbxLe/X8KxYGygppx1Q+AG1nfqxez2TgK/5vV+1NoObRcOvM0U4EhFIZ5ZrrNdzpMjyOB7OWo2juOdDF/z//4UktkF6UnEMJQJukNs5d6W/dzzfQr9685ymfiLpPzET2+psUL1mZsBpjwAHpsOQ36uI/MTDgafoMQaznkOtAXqHbNtkzWnhy2Z6e2vPGqgbtPFP8EgqvXgHIKAdACUchqw5vnh901NuZyVBYe/r5rMajaiYQfXE7BcFTCBas5K0IapKwGvXpSexhZFabNWQf+fhySUFdPRvskR9iGJg4HMbOuF79+DT3zWyxsSgE51i+jqVfMkS1HxyDSIgLKNMfnMVVRXz4xbMep9QGjo2Ee+Z5gG+/gq5FoYmCCr5hG7XZYC3zpAvfisvAfar2vN1t+uzxw2rh7LJEHwY/ZacwemeJ1OLm+vA7571u0Idsf9yts7cn31/BKydkYvVhyvNp9bn1UIR1yVtrOn0Jta3W0/5VaJ19/nPF+Y6/DyWV+vTzwQg1COyDpVzv1N0WVYsYd9bn/wb0Jsbivoh8Q4G/hSnytlh2qbflZI5+4lfsjQPDEDDevfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(478600001)(31686004)(54906003)(66946007)(6916009)(4326008)(2906002)(5660300002)(316002)(8676002)(41300700001)(8936002)(7416002)(66556008)(66476007)(6512007)(6486002)(26005)(6506007)(53546011)(38100700002)(186003)(83380400001)(2616005)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNkTWhHZ2JHUm5ua05GR3FnRjgvS3ZzdWZyWjUvMW94MW1NS2lTTkJBL2hT?=
 =?utf-8?B?dmlNZFZrbVZSUWo5YWlsdzFrSE5PL0pDVVFNTUNZTHhNZnQ0SmhQc1NDMmUv?=
 =?utf-8?B?Zks2cHd2K1AraWpFM2RDaG9tMXc0djg3M1YwU1pneG9ldXFMRFh3ekMxS2RZ?=
 =?utf-8?B?Mm11NmcwSU5lV2ZhNzB5SVpLOFBwS0FKemxDTUVRU3NjUnFVUTEyOFdNa0dK?=
 =?utf-8?B?djlnYllDaTVEd1N3MC8wcmtjb0JzWDFqd0xaUEdQams0eTlRSEJvRWJsNTNr?=
 =?utf-8?B?bVVkTmxxYkUrTUZiSWN5UmZyeFVjaGdrOENZUjhlQXZZVzhSUi9TdEZWblll?=
 =?utf-8?B?U0JWb2Z1TlhJOFQxVGsxYy94ZWRlc1h3QnlTZ1YzV2ZFTzM2RnJvcU1XQndW?=
 =?utf-8?B?VnRNSzg5c1U2ZXZKUXlCbDg5V3o1ams3dStycFhJT3NRNDhERjFGemZZaDYx?=
 =?utf-8?B?UERXSzZYWTl2eENRa09JWXNOVFU1Sm41aVBra0l1TXBLNmhuc2NRcWNJSzVo?=
 =?utf-8?B?VWNaNGplSXZabkVCYTJMaUIzL0VpWU4xY25oRHNoSGRBK2tiekh0SWFNZkh0?=
 =?utf-8?B?VFE5VVJSa2hqdkloamVWY2JmSHZLemNUTjhzZExMelFtV1pJbVpNL1ZjTmZN?=
 =?utf-8?B?K2RCUFZ1SW5vYnNGY0hXU29qbWdPaUxrekJ6bW82a1pZcVBlQ21kZEwxanZj?=
 =?utf-8?B?OXo4Sm5wUFhaSFZhcXA2QUhBMXNielpFQjFIWUVZcWFoV2N6MUJseVh1SzJo?=
 =?utf-8?B?UWlxd1NmNU9zVjdVYlJFS2lZN0N4RHF0OEtYSnVPRmh6N2J4WFBMajhFaUtz?=
 =?utf-8?B?ZjRIQlg5eXJSOHRBYnRBd0NoVytPTC9mVm5FRVhjWEFHT2tZSVh3czVrZFUw?=
 =?utf-8?B?ZkRJNG5heVZVSDVISW5VVUNnSUg2VURjMFhPQkxBWEMrT2xadHBrOXNYdFdy?=
 =?utf-8?B?eXYrb2NnaWZLTnVyVVowSXJ2QXA0QU9ETVcreGtUVEtwZjh1NDFGVnNobUpw?=
 =?utf-8?B?RlNTQytkU1dUQUdjYjdGLzRKMVpCSGgwNTJ1dnpRTnhkc0tHWk5JYXFZMmpO?=
 =?utf-8?B?M3JkbWFKZHJBVjU2N1R6V2FObWJGNC9RVENWSnJSSWFKVk1GdmRNbFBOVmRa?=
 =?utf-8?B?ZGFGdjRFSjlRTnhVdiswM1VyZUdYR0RqZ1BrVXdxZFViMmQrdUVqNk9icmdi?=
 =?utf-8?B?OHJkYk03WGMrTEVyQ1F1MTc5Umd2TkNJVWlxOHJDT0VCWUx0akZIdmtISDNF?=
 =?utf-8?B?ZVhMM1hNT0R5NW1UMUc0djFLeWJCNXNhOEh1dERxcFo2Y3AwV0VMWThOekl0?=
 =?utf-8?B?MFhrc0pBbDRZYzhCd2Y4dGVoS2FWR0xjMnRpMDhmNi9nOVFxMk9kSW1rTnI0?=
 =?utf-8?B?TUNUMUJaZXhYTUxCL1VvdUJlWVlaYXo0SjRvTk5sWHNjZjJPaDlaeUUwT1Zu?=
 =?utf-8?B?RURaK0lOcm1RZXRXZlkvYml5cDNIUUZSMUZhUXlNS1VVNmhCOTBEc0podGNm?=
 =?utf-8?B?VjAxUHdqTzA2MTJXNUlZdWhaQnROdmpTcE5PdHdCODFCL0N3VmNCM2RxRmRl?=
 =?utf-8?B?YnFwa1YrTE0zYmEyakpEaXpyVzBiell2TFpUZGh0SGp5cC9wZXp1Zmk3cUhZ?=
 =?utf-8?B?a1IrY0cwbnBqZzFXekkxNWoyaitmb21hWmRrbmIwclJudzZia1VXcjg1QnI3?=
 =?utf-8?B?OXEzN0NjWWZWaFpNWGdXZTFGQThLdmxMbHpSOUlDN2xpbVpLdVBxNlZic1NC?=
 =?utf-8?B?c0lET3BIM3VzK3ZQSmIwTHIvQW5tdHFJQ21lM0ppVW5heHB5QWNUZ2w2amc4?=
 =?utf-8?B?REVtZEFCc1A3YW10UVoyM1FlaWRWZFRZa3RoR0xOTUVsNDhRY3NBc1J2bVFz?=
 =?utf-8?B?K2IzYzF3cFVjRW03YXd6elQxRlZoTXFlN3pQRGhkTlQ2N3g5QzhDZVh3amM3?=
 =?utf-8?B?VXByWm4vTStCek9DdEhlOTNzZ3VrcldkdjlZV054K2d1K0wvNU1zbEdhN0xB?=
 =?utf-8?B?dFJDcFg5MUJxd3lFZ2o4VnM0TXJ3VlF3WkxpV2V6TFFJcDZPMGxXRjFuanFD?=
 =?utf-8?B?Q1NTZmc1T2dkeUZRY2xqTFRVOW9lczFoeFRIazhzSXM3Qms2TkI2VkxFRFVB?=
 =?utf-8?Q?UugUmIKQt7GHl/c74zFYikuqL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cede1a5-5dd9-46df-49aa-08db83ade6e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:31:53.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJRy8dffAJDkj2s7M4YMf0sPZqZ3ARMv6tfcEM4vuXuBayOSva2GCF0Ia6s31l/q6dd/VDqCwFmNetncJoo3xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7964

On 13.07.2023 15:43, Federico Serafini wrote:
> 
> 
> On 04/07/23 16:51, Jan Beulich wrote:
>> On top of my earlier remark (when this was part of a series):
>>
>>> --- a/xen/arch/x86/cpu/mcheck/x86_mca.h
>>> +++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
>>> @@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
>>>       return test_bit(bit, banks->bank_map);
>>>   }
>>>   
>>> -struct mca_banks *mcabanks_alloc(unsigned int nr);
>>> +struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);
>>
>> I'm not convinced here.
>>
>>> --- a/xen/arch/x86/hvm/rtc.c
>>> +++ b/xen/arch/x86/hvm/rtc.c
>>> @@ -59,7 +59,7 @@ enum rtc_mode {
>>>   static void rtc_copy_date(RTCState *s);
>>>   static void rtc_set_time(RTCState *s);
>>>   static inline int from_bcd(RTCState *s, int a);
>>> -static inline int convert_hour(RTCState *s, int hour);
>>> +static inline int convert_hour(RTCState *s, int raw);
>>
>> Nor here.
>>
>>> --- a/xen/arch/x86/include/asm/guest_pt.h
>>> +++ b/xen/arch/x86/include/asm/guest_pt.h
>>> @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
>>>   
>>>   bool
>>>   guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>>> -                  unsigned long va, walk_t *gw, uint32_t pfec,
>>> +                  unsigned long va, walk_t *gw, uint32_t walk,
>>>                     gfn_t top_gfn, mfn_t top_mfn, void *top_map);
>>
>> While the definition's use of "walk" makes clear why the variable is
>> named the way it is despite being used with PFEC_* constants, not
>> naming it "pfec" here will add confusion, as the connection to those
>> constants will be lost. One will then be forced to go look at the
>> definition, when looking at the declaration ought to be sufficient.
>>
>> I'm not going to look further, but instead repeat my suggestion to
>> split this patch. Besides reducing the Cc list(s), that'll also
>> help getting in parts which are uncontroversial (like e.g. the
>> change to xen/arch/x86/hvm/vioapic.c).
> 
> In the three cases above,
> do you think changing the definitions to match the declarations
> might be a solution?

In the first case yes. In the 2nd one I'm not sure, as the function
already has a variable named "hour". The 3rd one is probably better
left out of sync (and be deviated), but I'm open to differing views
from either or both of the other x86 maintainers.

Jan

