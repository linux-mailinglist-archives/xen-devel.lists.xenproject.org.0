Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6FC7D0899
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619675.965161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj9U-0000Hf-Bc; Fri, 20 Oct 2023 06:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619675.965161; Fri, 20 Oct 2023 06:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtj9U-0000E6-83; Fri, 20 Oct 2023 06:38:32 +0000
Received: by outflank-mailman (input) for mailman id 619675;
 Fri, 20 Oct 2023 06:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtj9S-0000E0-IN
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:38:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe02::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a600dd-6f13-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:38:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Fri, 20 Oct
 2023 06:38:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:38:27 +0000
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
X-Inumbo-ID: 47a600dd-6f13-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ9/82jNVQpAlT7PSwxFlqxfHNKazp6KSUMo4zg/DoudECnp+zvjsWNCz0IypM8t6edyJm25RE0DM+mqwXPkiRbujSD6Z2BR2gVYpm3JaDskKmrwFfx/Qd9AYCgDXeCOLmC9SzY2pwQ/CmU6kX0nB5eDmoGlyGXLUnJCERfW1lOkKjbG3svV/dEI6sQFL6ojLZYFwk3t0PpnWLZDHjE/nM6VEWQe5pFhwzXx2Qrd8a7Xz5PdBu9p6aZP1D0lD9iEqGU6h/PRqcEVtNeAjnBrTUifwSUJydZMUBqjatgTbZ4mXcZjNwpn4LkLHk62+f3bBatnAY2P4lrfG728MGWstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GlL0pCx8TxCi3MzjDPJc+lSsg7uh+KfVMtUHPMFiNI=;
 b=H59b75tNMvWJbR1F5B2sA2YABMetjgwjZb+GgI0bvtKScfTauS/0jNvdkvR3OIYf/6T4VQmav25sGz+O/5mSKhQ3FYJwmhQ5+vSmDAmr3WIVyWjyfChcRz8e3B3Av3S9fhzXDSgYcESz1NnJgpjwA9ftTnVmkLkSTqQeQNtP1dHLuKHh1fBHJawMjBUv9wH/fdVqZCv2R99XPZT8DvO9q84WIv4mkK0tY5O01JBYpm+qmsC06hK1XEYWuM9HsylegkYCmxO7TBvQDMNEz+wb+FTIWE5+Va8mgkdgsJ2opRTg1FfWM6xSzFSaoTPS1lPmRJId0zoxos069JrPdMhbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GlL0pCx8TxCi3MzjDPJc+lSsg7uh+KfVMtUHPMFiNI=;
 b=YQ0DpaT9m3wScj+nyz1zJSuQiCkQFwFoD7DQTyngSJeOhE901AW+ULcGGJ9uNwb37Eeve/URv+f3QKgJ3F5BN2AkSd0Ya0Btr8Vn2KCp7TNAN52BnoRHDOP3XXRhJ5jCCzlk7S2pLpURnDQGIimXH0kS5ZYLCRb9dldFPuCrGvc3FQsrC7i9tKoJ991bVSydz0XTVpkTKqVojD87DuvxLQMPQSjp1rD8a/gHFDWn4ZiwxgPHbKlIWRDTAfxdvlCjeG/uUupe653dNfdcPe/uUk6jBIcE1VHzmbtFbxSY3YTZzoAeADsjh+ch2fybmIXAli+xhNKV63holYtFir8Fvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
Date: Fri, 20 Oct 2023 08:38:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
 <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
 <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3b462c-4033-42f9-de04-08dbd1372aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zozzYr1kzwjZnlgNWikQEbfZFx62af3unvKEGoedTYRjL2rA+CrYwh9Y4iJyBkQ3TSeMyJGvBG9sKqfrDgtDQACcS+tS73yGJcNvF3TDVy2zEP6vsTBhevqrNoOxBf/q74U+d6dgw+qUeH2xeGJXGa1fbzafynTpMTUYseM5TWD7iqR1r0/OhJFM/BQm5k5PJm4LEC7FfbEKap5JB3PdNHtzyiC69i74GnVPj3UKitmWu66oBxWz10hAmSastNsPJCXu3ksuBx85fqIbww65wb/dJMa8W0k/uDSNpNDfnR9OIeIYDD7Ee2KFkGLkQjPcI7LN1jEr2dZ4gGmSkzsdd/SOb+oAFKnIVZBHHB6TO9DM+9ujb6JBqG2UemoBrxnSeZ2EH6xeFsVeqpL1rd3Cw62fI+JAUSKoEVBQCRW9Qlqj3OUkUPWWLUyEjG2YAWHnMAER8G7p8VW/CiMNlQyCaWyKUSs+3WtIC0eiRVGt01TTTjZe4Du+1M3hMz9Nikw0rixjyI2WQjoJG5Kp6tLrkLLvoPrRt8mjyf/V86oT/b6u/8/lC4qW6zIynd/FXjMzebufMhRnjtV0exsJhRUv4lI1GhysqggAPTVVdmkogdcgdka+ZnqOieMb98SinDTC8bhRwx7XWEoVf4WehWCxzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(66899024)(36756003)(2906002)(7416002)(38100700002)(86362001)(83380400001)(6512007)(41300700001)(26005)(53546011)(6506007)(2616005)(31696002)(4326008)(6666004)(8676002)(6486002)(5660300002)(478600001)(66946007)(54906003)(8936002)(66476007)(6916009)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTFidm5tMWlqVzVMU2RQTjBRbEJXSkJCTUlJRnFGWktmWkxIVFZLcUo1eVRL?=
 =?utf-8?B?eTBJRzVUMWUzemlLdGZCaUZ1eWNUd1paUnVBekwvdldBTGdlRFNFcnk1UUU1?=
 =?utf-8?B?R3BjU2VaWTN3QjJoK2ZscnRiWWhwcXZiSXJsZDdaNlg5L0RmUCtuTDI4ZlZL?=
 =?utf-8?B?Wkp0T1lRZ29FQk1oNlNBTDArYldWY2Z2ZS9UdmpVQUExQ01pRWFnN3Rha1lk?=
 =?utf-8?B?UjJlczhZU0N3a1hEMHZwczVYVE9mdlVtVjlFYTBNR3JEakpwNDBUYVdQNlFr?=
 =?utf-8?B?VnlNdWVnN25WZGdkcWdjK3d5ZDJHRkYzTUFKRnhYVkRkY1YyQzlLeC96dWdY?=
 =?utf-8?B?NElBUTFzNUVWSGJYNGVKR2svR3hJQTdpQ3lyMlEveGFhQnZPL3JEcUthVWQy?=
 =?utf-8?B?VFFWYjRickRuVHpyUkNETDI5ODhqZjBZWkxRc3ZoVFpyZituUUp0RnI1alNk?=
 =?utf-8?B?Rk5TTm9MMXMxZGVUVFhRTzVNZmtINXUxQWdoTjFWWHBsUXdkYUdoVlNEd3lx?=
 =?utf-8?B?Sy9Wb0diN1pISEZuL2NzYnNNVFdIRzRjbUF2MVduNm5aMHBJSDh0b3RQVmNN?=
 =?utf-8?B?Ti8zMnpTcmlIN1JRT3J6ci9IN3J6ZDRrTWZLa3BZYnMwL25CTUxDSzdpSjRY?=
 =?utf-8?B?MDVpU1pQNWQ3ZXBpQmZWOCtrQUpablFXTGx5VFRtbytmZTBqbERxSUJEWnNM?=
 =?utf-8?B?a2RMaENUQVVRYks0dzBHWFdRUi9jM3NvVGRXdUFEZE1PbjdreVJaR3E4WVA5?=
 =?utf-8?B?QjY3RzdGK20yNXpFWmdWZWZqRmZHNnB1U29obmoyblUyQUdMQ0NHNWF0M0xq?=
 =?utf-8?B?MExocC9PVUJXN2ZJUVBFRHVxTXQ3YTdCRkFPdFZZTTRTOE5mMHVEVDJmMmQ0?=
 =?utf-8?B?TkxBenZscXJBUFdZZExmaTF1TXlEakxkTXM1bytSV0FONk16ZWRPMnRqZ1VK?=
 =?utf-8?B?YUZzRVY1cFF5V1Q0ZFlnbkZEQjlTYU84Z0M3VHR0U0YyQmJmUVVxV1oyQzQz?=
 =?utf-8?B?ZG5UQnd1WjFtNllqZWRtcHJjc1U3WWxUL1ByMWdmTkk5TjZwVU5rdDllMXNQ?=
 =?utf-8?B?elNmdit4N2FENkRqK09LZG0rZEM0SEtFZXIyelJ6SGsrOFJQMWlaVXo5c3Jl?=
 =?utf-8?B?N2pQTlhBaWZzdFZneGhiTjh5cFhUQlRubGViZitpR2xGeW90aFZDMHVtY2lp?=
 =?utf-8?B?ZXlxWEhKY1dhV3I2QklKbHhJbmJkZGRna1ZvUEFnVWpvaDQ4ejdoT09KMDly?=
 =?utf-8?B?eWlLcXlkY0UwWXJaZTdnM0hUL0x3dndOZXp4ckVja1ZNMWYvbEcwM0lVVWE4?=
 =?utf-8?B?dXlBY1hYdmsyN0lGUmF1UFRzTHBCZ1c0d1ZER0RDb3V6K0RWdlZNTzBBaWJ1?=
 =?utf-8?B?T1lsZU9SK0ZoSVlxRDZ4U1VUU1NMTkZubEZLQ2xUcEVhQU1YR243VXZwNUVj?=
 =?utf-8?B?ZXNubkZPZFljWGdLMWZ6SGdPbEl3Y3JBeUc5WHVLcFlTV01vaE13VXViaHo2?=
 =?utf-8?B?NUdPTEpVVnNtaHRWOXdYSDFZbVpjOEtGZ2k0Zmorb2FCZld0bFUrRk9TRUZp?=
 =?utf-8?B?WDFMWWdpeDJxZCtkMFp3OWZtRnZ6b0xMTCtMYjJ5c1paOXhmbmpmSTVDc2x6?=
 =?utf-8?B?c1ozYnZuYWgyUFFvcTVQOXRDcy92cFVZUnIyZlhxKzI1b0VSNG5VR2szcldY?=
 =?utf-8?B?TUF1cEZPSnlvaU54V3JLcDVhb1V6dHppOENhMTdQQ1ZlYzNOdmVLejJ3L2V0?=
 =?utf-8?B?NXpQS2lESXMxU0poUWFWTE53M0FHTWZhdHdIczVyOFdGcloyU2EyQmRIamxU?=
 =?utf-8?B?YXQ0bHk4T01DcW4zMjRWTDN3ZStiZEdpaVFRNmhBNXpFRHVwWXZYZlIrandZ?=
 =?utf-8?B?Z2UzQ1pLTzE1SWlTUjJkWHM5elBoVjEyd3VOc3ZrK1lrOTluTm9IcWYxL3U3?=
 =?utf-8?B?eTZQSFlidTMzSStpa1lHZjB1Nm9GZU5ZcndoUDRuZVBKMHBQV0FkaFduQlRv?=
 =?utf-8?B?WkJpU01SSzRMUFI1S0JwY0c3eklhQnBpdlYyejU1RVhpcVlrQWlEZ0V4WjlP?=
 =?utf-8?B?djlENmlpUFlCd3pwdmYzT2d3b1BUejBPaWZEN0w4U21kWG1JVExSdTNjZFNp?=
 =?utf-8?Q?ga++cFJfuV91tz53+s0U48onW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3b462c-4033-42f9-de04-08dbd1372aa4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:38:27.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAsRENXUNwHXKlGIWul4N7FtTNdFvOzKyuAQKymlD5Ux9cRLwHYFW3VRJoxFUNltghQU87oRsLbyYGgtlGo1IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9416

On 19.10.2023 18:34, Nicola Vetrini wrote:
> On 19/10/2023 17:57, Jan Beulich wrote:
>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>  # Series 7.
>>>  #
>>>
>>> --doc_begin="Usage of the following constants is safe, since they are 
>>> given as-is
>>> -in the inflate algorithm specification and there is therefore no risk 
>>> of them
>>> -being interpreted as decimal constants."
>>> --config=MC3R1.R7.1,literals={safe, 
>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>> +-doc_begin="Octal constants used as arguments to macro INSTR_ENC or 
>>> MASK_EXTR
>>> +can be used, because they appear as is in specifications, manuals, 
>>> and
>>> +algorithm descriptions."
>>> +-config=MC3R1.R7.1,reports+={safe, 
>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>
>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of the 
>> same
>> name could imo be introduced without issues in, say, Arm code. The 
>> above
>> would then needlessly suppress findings there, aiui.
>>
>> MASK_EXTR() otoh is a global macro which ise used for various purposes.
>> Excluding checking there is imo going too far, too.
> 
> I should have thought about it; I can simply enforce the deviation to 
> additionally match
> only a specific file for each of the macros.

That'll work for INSTR_ENC(), but not for MASK_EXTR().

>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -90,6 +90,12 @@ Deviations related to MISRA C:2012 Rules:
>>>           - __emulate_2op and __emulate_2op_nobyte
>>>           - read_debugreg and write_debugreg
>>>
>>> +   * - R7.1
>>> +     - It is safe to use certain octal constants the way they are 
>>> defined in
>>> +       specifications, manuals, and algorithm descriptions as 
>>> arguments to
>>> +       macros 'INSTR_ENC' and 'MASK_EXTR'.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> Similarly this wording is imo inappropriate, while ...
>>
> 
> I tried to be a bit more specific about what is actually being deviated, 
> on the assumption
> that the maintainers and contributors would find it more useful than 
> parsing ecl files, but
> if you prefer it to be more general, no problem.

Just dropping everything after the last comma would deal with my concern.

Jan

