Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BA6F44E9
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528620.822018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpwA-0005PK-Ix; Tue, 02 May 2023 13:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528620.822018; Tue, 02 May 2023 13:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpwA-0005Mf-G2; Tue, 02 May 2023 13:20:58 +0000
Received: by outflank-mailman (input) for mailman id 528620;
 Tue, 02 May 2023 13:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptpw8-0005FV-Vv
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:20:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcd9ab2-e8ec-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:20:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.26; Tue, 2 May
 2023 13:20:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:20:26 +0000
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
X-Inumbo-ID: 2bcd9ab2-e8ec-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMU04rxa9l5XTjyZJyUKkTEL1DRsQmF7BdOs/g3wrogTK+ELfNEYR03XiTs5Tk7l6u9OV3s0lyuxDysYUJvxcbQrZdxGTXaiplFUrFXR4eP/qDyIh9HiuBC3OJQ+WLJdErkQzdgMs4YZbT4Vo5iR3rbgaUczx72gGGx/ZQxK2NnzUVbDQQx9Impd5QUCpBAvAepUhZXPZ1wmkxkjIS9hzHpI8gxyd6wuyL00ih8+B3rcAsIDB9YgVT+C4diLQCEHvAXoVX8AU+gdF3mwcAIwUnQK/zhNGdHPK7iZrtPLRqOPZTIWUDievC2meP2llvbmSVPpHG26npcOkXcewJlGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwJg1hIV7/IcKn86O/iBIYSL1qO0b18JDv7CnuQlPJk=;
 b=QWP8KKIfwPxaF5Ee/ayHFxTSg0yo4bOLjBz8TCSFKmvKeE+NK4XbzLL8+DFIGeIw9947t8T0bkYi9Xfs29Hj9sk7SaFow7XDZ9eYAfxzZirbtPA+Fv/LYOqXRIsVBWMhi14QzEp2LX7Kj0gvlo8QaIsiGREAhhqpGAxd1ppiixTzX5uzSAzVtLr0ei5/90uLDa8zuABsIi93uoVNN0uPhCFe/kalDnUoKNm67qem9y6biPi7jayQijwcmyqSQvwXqdZTaYTgKgFJUHURx2XzLo+0BHAlVFFCx3mtDhKCB9ZKPzq9iZGJ9hWbkHNGC716Iqx90wva3Vsd7C3u1D7Nqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwJg1hIV7/IcKn86O/iBIYSL1qO0b18JDv7CnuQlPJk=;
 b=LUisP/8IJctGnK+feS7dx02e58UpdCYmMpF6sHslUs6K9mRRGAY5VR6qTC4pNp39od9MvTaJn8/sme7zSVdtsVL96FAY+ezW/lPp2+dIbZawPH3YJOH3ssP59yDbtVMI2eOGz+ab5HBRWhSTmdEZgD4b+EmBQaIjZB8MSi379ThTSXeKrZKMjqXCJHzyUAWSFIOhhxmT95kRLOeuISmGYCuqZdISGEf0Zb6q/TQNvu14kJRneKLh9ZQdnREm3Zm3D05h4uraiPuXdj06RDB+O6IejZgIZYPYYST6FviVBPx4/u8Lsc1pz27pnDta3GE02Sz1LAQP6EOl2vn6mtH60A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9f78423-b7de-066f-2d62-0c354ea90551@suse.com>
Date: Tue, 2 May 2023 15:20:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
 <ZFDtMMUzBGXFZPsQ@Air-de-Roger>
 <ccbd0769-ef20-01ea-2204-ee0c211dcd5d@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ccbd0769-ef20-01ea-2204-ee0c211dcd5d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ded193-a7ae-4e4c-b6d2-08db4b0ffe4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxdNHioxd4vv43zGhDKzCc+x1NOANDIrUvVyj4VKtpITppl7v0u3Jo0zOHU81O2h22Hqh0KRx+jQnUMbTmFoIBOBR+vi+K7hBQL5ciy4RujoVOPVj+3342ThZDVy82/QrHv5fybmLjEPYYawB9l0ewJrADWuhNbOK4+DCOisTWmDIXMnTofBp562qQtQhtxfNCbdt9IH0GmQBMlFhg3Dutj6A5MWvBKiaQBK28D1wCzJ415S4Pt4KOFruOVZECP/k2C57HFRWRS1VgJFsDIkIgs/2oelGhn+TvgHHRhpBYjG8ZsB3Y2l0KwLHr2UGYbIVGlKqKO2GDEnfeMX9v6UZ+dStK+TntTh/sLBOtUR/GV2r5pJnvKee4QKATb5v05nK6kBQwVV9SsVz2LyXjsptVzuQkT2hCMHFkQwkvCGFWGPPlVielC/cOw8cg63vbyVnzmUkloI+BABheAbA0E/F7NPS6cgdHtMrDiRfCSMsn6OqADhDnH3SMX++/S44qtaW/GeHHnAvUT6/XatFLAkcjU2cSWhFkj4smQuinsFvuIFmB7LA/pcb8ywp57/+y47WcaNaHFLljIr5SDZ/SapLJawsb2BN87rRA+mIbI8jt93Jv86DlUVSdff4PFVJ1h+sMOayRF28GnlfIjcJYdh3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(86362001)(36756003)(31696002)(38100700002)(53546011)(5660300002)(316002)(66556008)(66946007)(8676002)(4326008)(41300700001)(8936002)(66476007)(2906002)(6916009)(2616005)(478600001)(6486002)(83380400001)(54906003)(6506007)(186003)(6512007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU80YlQvK3JZMjI4eXNOb2piZ29ROTJwS3p6MG15emZvRVlJeUNCUXJBUlp4?=
 =?utf-8?B?eU5wVjdqKzIzbThHRkdCc3NIMVVLaGpIdjZPTFZIZ2d2MngrTVoyR1YwWHlY?=
 =?utf-8?B?NVBMWjQ3cUxQMFljckJSdWlGbnFMbFNFWVpEcVNMUE1NWlA4dHVSL2s1TFVl?=
 =?utf-8?B?Wnk4WkJyM1dSNjhLVXFGVG5tbmc1MFRWQWR4RGpodVJsd3ZwRXlBWkJvTlNN?=
 =?utf-8?B?MGZzRHVTcUVMQ0lla0hzcFQrZU5NOUJOamx0a09iR3J4TzdQM1l3Wk9GU2VO?=
 =?utf-8?B?RWFTZXNJKzJlZlplcDRRQyt4cXBvcmxKVER6ZzMvK3BUQktyamJUaGtsQ1BV?=
 =?utf-8?B?LzNJYVRrd1Fack1LMHljalpQa0FzK0hvYlNiS3B5Umh5dGprUEdqOTRVNHF1?=
 =?utf-8?B?YUxIM3k2dGc4UWdUMHNCRGVYZXR3dVh5UWt5MmJDUHBITDNUc1kxTHZuZDRJ?=
 =?utf-8?B?NDJDWk5mSU5EZXRHZy9mTUxoZ0JUM0F2T1lDSlFXclRrRFk1OHRZbnFkVXh5?=
 =?utf-8?B?WWh4T3JvZ0pHSzlOeDlnYUVlWnl5dnp0ZUo4WjhxUzdhdFd2MHJSMXRIMUZ4?=
 =?utf-8?B?Z2F5dWwvMWtBd2JrMllKWlFZK3IwNEswdUp6UjBVV3JBR280bkN2NUlmWHln?=
 =?utf-8?B?WEp1dHRsZkd4YlNUZjZocXRSaDZ3WWFpbmZVekQ1MjE1Nlh2UGNuY0hKR0RW?=
 =?utf-8?B?dFY1aGs5blRDMEFGS3dzZjhya2RYYWxIRG1PdmRlMWZsS24zelRmVjNuanly?=
 =?utf-8?B?Y0JxU24vWUFSaDZOa3F1VC9CQ1p6YUR6bXJJTkg3ZGVESERqTjc1TG5HRmpk?=
 =?utf-8?B?L1laRVhlREZBNVpDZ2lTcFFPdm55ajZLdWZnSmsrWUJ1S1NUVHJFY3RCK09M?=
 =?utf-8?B?T3k1M2ZiandIU1ZUSFkzcVlVckZLK3BjK1BHdFNmZGFKT05yNHQyUHczRUhz?=
 =?utf-8?B?bVU5Y1dnM1llY0pxQVFMTHNYaFAxd1ViRC83cEYvcjlHaWxrWUtSU3hLdWZC?=
 =?utf-8?B?S3pybFpjajZOaXQ4aFhyUXZaYjdWdEFmNmlrWmQ1aDYrZWdFZlRnUHJQUFRZ?=
 =?utf-8?B?eEM3dG9VaFJwcWlIUDRrYU5OR0dZcU4vSzJ4UmpjMDRyeWdSM0JmWTJCeXpm?=
 =?utf-8?B?cEN1Rm1yMWhDdWJZM2FqVktlNmE2UXhCK25Zc2xsMnF5ZDloYXEyM2hlRXhR?=
 =?utf-8?B?a21EdTliVlRZWFdkOE0vdXVVU0UrdUFBemVXemJmMndaN3NXSDBoWDdROHhY?=
 =?utf-8?B?cExUUlVzRjNSaTFMK25jSkxHRC8vVXNVRmRtSE9qc241U0RSZHVqMThhbkVG?=
 =?utf-8?B?dlBDekk1dm5ObVRxaEQ3VVRyVzRKQkE3emlIT1Uyb2VQZVJwNUZqamhUVytF?=
 =?utf-8?B?aGtXZDVvUWNidTFyc2Z5UzkrYTVCVVVWQ1ZkNyt0emJZTnJEY0tGSlp4UGcy?=
 =?utf-8?B?eEJJZ3ZPVDRLaGt1cUF0N2UxM1hUMkd0ZHVjMFI2a2oxNHFDNVZlZXFUYXRK?=
 =?utf-8?B?bGxSYWwxUC9kcHlNdDczYW5LV3hzRFJlKy8zWndwSFg1MkRRMFI3cElaZStI?=
 =?utf-8?B?YktLeDQ2OFhSSllzUDRuWTdMTFgycjJ1dWY5M28wdXBrWm4zaHNTeGJ2cHJR?=
 =?utf-8?B?emQvZU5tSDI2ZWlaY0UrRTdZTm5idzdYSlRzdlR6WWdYQWNVTGhrYjU5Zmdl?=
 =?utf-8?B?U04wdTE1SGJuRG9oQ2NQaFFreDRKNHkrRmx5aDdSWEJTRjdwNmtPa3FDbUV6?=
 =?utf-8?B?VUVtSEEvNXVuaGhuaHRhTU42Z1A3cEZlSEo3ODIyODBXcUd1QWx3SWpkMWx3?=
 =?utf-8?B?bDdZM2NMY2N1UnA4TVVyd3J2NEVCSlpCYzNpZE50TkxGN281WGp5U2FVNWFv?=
 =?utf-8?B?UUw5N21JQlNPMUxpMjdXZ1FEcmRldzh1N1ViWmZkKzNoSUJBV3dwL1FjVnAw?=
 =?utf-8?B?bmh1dHN0bDZ0NzJCY29JT0FZQ2lyR09Pb2U3YVE0ellLS3VnNzVyN3ZUWjB4?=
 =?utf-8?B?KzlrM2hWcVFBemwwYUFLNU1sN0pnWHZRbkYxbFZLMXp6bGl0NllzdjdDbjMz?=
 =?utf-8?B?a2F5RXV3RGhSRTl5cXkwWGNMVWpLYnVNbjNnL25IMmVpNXhDZWdpeHV0aXYx?=
 =?utf-8?Q?QL4kmjYgvqiDIpTaPkKhbv5xc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ded193-a7ae-4e4c-b6d2-08db4b0ffe4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:20:26.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jqi+SJKJ6ic8IbrfSIUmOUwA/60e/yik2MNZPIAe27ifEl8eqRj3fRTunb1jogVWtapieF0+B7CKy0+lSKZS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

On 02.05.2023 15:13, Daniel P. Smith wrote:
> On 5/2/23 07:00, Roger Pau Monné wrote:
>> On Tue, May 02, 2023 at 06:43:33AM -0400, Daniel P. Smith wrote:
>>> On 5/2/23 03:17, Jan Beulich wrote:
>>>> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
>>>> cause the operation to fail, in the loop here it ought to merely
>>>> determine whether information for the domain at hand may be reported
>>>> back. Therefore if on the last iteration the hook results in denial,
>>>> this should not affect the sub-op's return value.
>>>>
>>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> The hook being able to deny access to data for certain domains means
>>>> that no caller can assume to have a system-wide picture when holding the
>>>> results.
>>>>
>>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>>> While racy in general (including in its present, "normal" mode of
>>>> operation), within a tool stack this could be used as long as creation
>>>> of new domains is suppressed between obtaining the count and then using
>>>> it.
>>>>
>>>> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
>>>> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
>>>>
>>>
>>> I understand there is a larger issue at play here but neutering the security
>>> control/XSM check is not the answer. This literally changes the way a FLASK
>>> policy that people currently have would be enforced, as well as contrary to
>>> how they understand the access control that it provides. Even though the
>>> code path does not fall under XSM maintainer, I would NACK this patch. IMHO,
>>> it is better to find a solution that does not abuse, misuse, or invalidate
>>> the purpose of the XSM calls.
>>>
>>> On a side note, I am a little concern that only one person thought to
>>> include the XSM maintainer, or any of the XSM reviewers, onto a patch and
>>> the discussion around a patch that clearly relates to XSM for us to gauge
>>> the consequences of the patch. I am not assuming intentions here, only
>>> wanting to raise the concern.
>>>
>>> So for what it is worth, NACK.
>>
>> I assume the NACK is to the remarks after the '---'?
>>
>> The patch itself doesn't change the enforcement of the XSM checks,
>> just prevents returning an error when the information from the last
>> domain in the loop can not be fetched.
>>
>> Am I missing something?
> 
> Actually, I should have finished my first cup of tea and looked closer 
> at the patch in the larger context instead of the description, as the 
> two do not align. You are correct, and provided I am not wrong here, the 
> change is a no-op formatting change that removes an intermediate 
> variable. I do not see how directly checking the return in an if versus 
> checking the return stored in a variable. Additionally, the claim is 
> that this occurs when XSM is enabled, which is also incorrect. The only 
> difference at this location in code between not having XSM enabled and 
> having it enabled is that for the latter, xsm_getdomaininfo() is an 
> in-lined version versus a function call. In either case, both will 
> return 0 unless you are using FLASK and have a policy blocking the 
> domain from making the call.

While perhaps imprecise, "XSM enabled" typically is taken for "Flask
is in use". Then again, looking back, neither title nor description
say "XSM enabled". And it truly was the XSM hook which might have
caused the sub-op to wrongly be reported as failed (given, as you say,
a policy is in place which actually can cause failure from that hook).

Jan

