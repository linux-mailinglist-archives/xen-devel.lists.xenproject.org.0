Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A0569C46
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 09:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362768.592973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9MM8-0004q3-GG; Thu, 07 Jul 2022 07:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362768.592973; Thu, 07 Jul 2022 07:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9MM8-0004nQ-DS; Thu, 07 Jul 2022 07:55:24 +0000
Received: by outflank-mailman (input) for mailman id 362768;
 Thu, 07 Jul 2022 07:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9MM7-0004nK-Dy
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 07:55:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b143ad-fdca-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 09:55:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2532.eurprd04.prod.outlook.com (2603:10a6:203:37::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Thu, 7 Jul
 2022 07:55:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 07:55:20 +0000
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
X-Inumbo-ID: 26b143ad-fdca-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cct7mlQ+fmofmRKmzqcl2c/8V04kDu6xrEXlaakl+Il1NzS6OS360UQRt5qtzF4Z7eIKLtpUJF2wtEKNhEmQZWhDflIK6fcmFKTUqOhYIv4DWnPlzasTbKBRJoBc8+oG5Y6VrmuNhBrFgkHuPM9L9a4qFpyHpKDZD0NAR45CTiUqB+QM0J9iSni34S3bXZCgybl+Q91hnWZpw2F80J63KQj/U06oGTNF0gibxnv70zdg1RoMAVAs53l24q5zPfp9My/5JSm6ohdc28YbqhTvXHrzXRel/n54CRPWotVPBtTeWRm3KiGkPgJk3tpwU5NnA1CdMhpt1scL4ATFGTBtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDoXUJYE2L1MXgeg5Vl21Hb74gqxgy51xSJU7VJ02sw=;
 b=hDTFAUhI/jirQgCyOZF9WS1sMeBwbkujoxX+dA9Tm/wZDh+RpaexWz+PzxsgWz6nck3DBSy11E+3tDbfCbWQ8kI3w56LW50LpkOtpiWdCvu5pr8NsF6dOKn4UioCsrvg7dzzogYzkNZo0hlvSbkQp0aAD0J+juMYkdfNovz1v5YTMWxiy/lG/iJo8JXFpWAMkRWxwEMQ4ZVdZmQHmdToWs4+A0rF8Cr7HBhwTnPVaVlMy4rZeILf6xYoIlssCuPYTbWFW9/Xlp8A997orGdzm/ic3D87EBcQ4AMK3lr2HBGrKbUaHfbgw9LIK/kkf1FaZmyi4JrBbivvQJAIRU/jBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDoXUJYE2L1MXgeg5Vl21Hb74gqxgy51xSJU7VJ02sw=;
 b=vkvxyLebAtIKtH7UzJADo2f98j+nBZeAeWZDkAh5/HjR5Rr9+bnXE9vuy2B6vvUlBbzpJ/LOny/WHB4acilGGwb1cseWFm/ULINlZeyk5DGghNi4PzAY9Fsfw4ONN8LirZm/IID41ab39XYoNAg0DUmPzysn4kuOfkywmfmrdwXi7+WFNrN3r0bdfr2JsjxXXZlKaeFJIf0E3oXvtIjLTllOobam6Wx/OvS3MbeeP9+PE51dNiOxBmz6v9qokc5ZjFCHvTFLi64qwqi4bWOzWfiawQAC0tmRPPhyMmRv71whcVDVLhASae77WfcbMH57ArYmkd6q6yNdkDl/9oquBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
Date: Thu, 7 Jul 2022 09:55:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b2b5a92-43d5-4a08-668d-08da5fee09cd
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i/0JC7Y2rJ07HWNPe2zTOfLD9Zjoc/gQC2QF2w2I8Fah9gBMfgO95e6vSGYluuWGQhB2NT+64EhhRARz7WUrQAPbqeNBoefo2UwDm1tDKWPF1qMXTiS58axKVOWa5ojvZirl4yKI48SCtVfQZ5n9TL/+AOLk0kx2sfb0/hgCR8dIPzayEieL5IqGtjXn7p4+YrsxAjlSGR72LKdfFTGFWkN0X4wOrezKBMRP/YbcZ9NZwYN0HFnPdqk96bNOWukirNohxITn2w4kxgy3X+due8xvHpAsKsYb2gdKvytTjyTPXm2eM2Ntoj/oi+kmxOs1yxpDLsi3qPoiQ05JMPNU2lrfLtFVzu78vPeTDFePSCoePLMiMlc1hg4vnxfxmZLUJKhPu4MZSOiJ7iRJdzWELDoCFETceUyu3ht8fQRQitqd75ZFRNRCj9vtzPKPNGqbRx96QSJ/lUu/qaKqSm83weTcFNmDkv+3Fot2DcmAHCQc5d4ygBJw1BhlgLUMYkwh2ReDgRT55bHJaIVSYpXzM2olXBsWHDlpwQA9puokOnjeJTAAPPFfk8xhh7S51A8bPIy2d304tDJsBszNibg0CXfvMs6yaaBuZqzcMNr0qQZ48mXQXOZOEy1F55gFX5lXkxO58UOlzgirLXEToiEu2QpKoIQ1RVAJiSYzv95XylebxPTIxhPyRsMOz193bNXKy/qhCBN0kMuOIJPlWSgzgpCpdf06PeTgoUNlVDFgnQiKrZW/lHt19VIjyn1HHgfiZsp8d8P2nr2P6qNQPid0kdS+VEpW5vlmHBZhxrpyZwn3vdavu/HDlo8uYJU1RPjhKQPA+P8WS0mQNUddUmshgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(39860400002)(366004)(396003)(38100700002)(31696002)(86362001)(478600001)(6486002)(316002)(5660300002)(8936002)(6916009)(54906003)(66476007)(66946007)(4326008)(186003)(66556008)(8676002)(41300700001)(2906002)(83380400001)(6666004)(53546011)(31686004)(6512007)(26005)(2616005)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2NHcjNaN2dDY1dJZW9RS0hpdzdkeGIyRnRYNi9pa25vV2tXWUNOMnExeXdx?=
 =?utf-8?B?akxHcVpkNnpEWG1CUjVtZWljdDFGbUJSUDNpcXNwWGVwNnJ2S1crdDJvdGVK?=
 =?utf-8?B?MDJCNERCS3laSFRsT3l6MGVoZWxud2hVcFlQaC9MdHY3SUZxem9ZOXpseTVM?=
 =?utf-8?B?VVRWUjBpbHV6TFJtNVQ3eExKNi9BYnp5c01rRmJGbm1vRjlzSG5zVWJTVGpB?=
 =?utf-8?B?NkpzQ3k5ejVTamZvUHJDM0tpKzA4SE83b2gzTGJWWVA1Q1ZFK0l4MXlQWEU0?=
 =?utf-8?B?WTdwRThReHlnTmcrSEEvTWJ6aUlGQitlT2FpbWVwNlI4Mjk3QnFEQlU5ZWVO?=
 =?utf-8?B?N1dTSlgxVnA2eUpPYlZZdGJ0c3NRME0rNDdGcHhoSHZXYW93WFZQa0N0YTBa?=
 =?utf-8?B?TXNxUEhkTlJtdEFMVGh3TUlVMlBuOC9rR0o5S0FaVDg1RGxxMmYwbzZSTzNo?=
 =?utf-8?B?OUtWc2tLODZaczlhZGk4akZuUXo4azRld0ZEZm40WXFXT2U2QWZvMWJ2amhy?=
 =?utf-8?B?YUU5RjBNV09Qblg4a2ladmlmWFdZbm4rQzQwaHczWU41UkZFbW9IMU9zZXJn?=
 =?utf-8?B?OFc1NUo0Q3o2d0w1NnF4U2RzTll5eDVBMFFYcEE0SXBPamVXbWVReWlDR0VB?=
 =?utf-8?B?c3I1RjBHQVc1TDI4Y0hZVEFyaWtEWERqaDkvU1l2WWVNWFFLZzQ3Z1FqNUVX?=
 =?utf-8?B?OU54U3BsdHhXMnBiZ1plSUJIb1ZuN3NJcGE1Z3Z0UWVmMzdLamZxMy9FYk96?=
 =?utf-8?B?TWFwVEJnVUxBUC9sNklES3RIVW5PWjNTemNaNVAraUErVHM3SlVSb2Q0MlEr?=
 =?utf-8?B?VlppcTZFY2FreFJDZ2VDdEtSN1BrSHg4ZW9QY2ExMVQ3a05NY1RWbHNiUmdM?=
 =?utf-8?B?RklNTnFTOUwzM1RqMEJOMDAyeVRuaU1Rby9OcU82aloxOHc1OHdtS1ZpWnY5?=
 =?utf-8?B?RzJGY2JzVEEyNEVOZ0tFWUNyQ2VUOUptRzN0QWlQUmpjNStYVTRVNVpYZkp2?=
 =?utf-8?B?aHRBaHJYaTM1T0Q1ZkZQY2h2Q1lhTzFjWU1xV1dtRjZJQzJNaG5ScklubEZU?=
 =?utf-8?B?M3RSTitRTnlYdHNmYnIxaE9uOUF4UG9YSzRnK0oyWUhuc1pUZDF4d3dWdThu?=
 =?utf-8?B?TUE3NmYzdFBLWlJKMHYyT0hTSEFybEVHeXdZOFk3RSthbHJZOGEyRmF6NCtn?=
 =?utf-8?B?TkZmKzJCSzZPVTNIN3FuRzFFb09uT1BOQzdBVHI2dHlMSWhnVWl2Q1BGeGQ1?=
 =?utf-8?B?TGR6OTFIY0J1bHpYS09xSjRIRUNNUnBXdkUyNnBxSVpnSHpVOTRjRmJQdnVV?=
 =?utf-8?B?N3dhUUxnSGFEVkd6dHZjTzVxU0h5Mno5Zm8wVytUcG5Jak41cHFDd25XdGp3?=
 =?utf-8?B?cm1xaHpCRzNNcnNIRysyaHZKamxvT2Y1QzNSamZ6VEoxYU5NaHdIYVVuNVJX?=
 =?utf-8?B?dFRQeXIrVDJlb3kxL0xVLzdZekhDSFovU0xtNmhBeERNTTB4M2VqMmZyaXRZ?=
 =?utf-8?B?UHNleHE0VG9MYzh0K04wSlZVZ0RSNGh3aVZIRC9IWjkzZGhGSlhLL3RQUjFL?=
 =?utf-8?B?VXBxcERsT0FSOUZqQVdjeU54VUdXaUVtcVZaWWdQVVdkc244QWV1QjZtbnly?=
 =?utf-8?B?WXJpeGdTcGlpYnJEODVMTGM5dVlTb1ZNVERWVEZ6enoySndsb2tkTEs4bjhO?=
 =?utf-8?B?d00rbHRTcEY4dTdNMGZ0bytRTmxjblJoSUVBZncwUXdqZTFCMDlVeTJQVXBD?=
 =?utf-8?B?WXp0dzVMbDBPcFN6MWg0TzhRRmJtemtaYnVsckpuYy95N1dFSTR4YzlIbHpZ?=
 =?utf-8?B?VDRKeUllT2Z3ZmRUUG1jbUJnZk8rZWVCYXNsTE10MElTVlhrdnU2QVNUL2V1?=
 =?utf-8?B?RzE1dFZyU09uOEdUMzJJeTI0TmlQTjhLVE1OQUJjUjlRQzhXdjVzenZDc0NO?=
 =?utf-8?B?aE1RNnJvdncvUklKSkFrSWVXWGFjT3I0V1dFTDFUREErbU83L1lhQ0FNOVlz?=
 =?utf-8?B?WHpGUHdzZmRUVWx3MWVxN1oyVlgySjdyeWJZcmg0LzdDWTZBNFlYZ3JDTE1q?=
 =?utf-8?B?UzJXS1lLMHUzL2VtQ0JwQTdBdGE5OXNLMnVMa0xYcHZ0dHI1T09rcS9UTitw?=
 =?utf-8?Q?riID+hRdwliZzmiIKxfrTVcao?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2b5a92-43d5-4a08-668d-08da5fee09cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 07:55:19.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfF1z/lSBFV+yS6rFk8LJrXTF0lcEdRgjtAQXaqTCBZHnEQhvl+JXjDQZONiECG76eyisCZorjJPk1acnf5JPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2532

On 07.07.2022 09:27, Xenia Ragiadakou wrote:
> On 7/6/22 11:51, Jan Beulich wrote:
>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>> The function idle_loop() is referenced only in domain.c.
>>>>> Change its linkage from external to internal by adding the storage-class
>>>>> specifier static to its definitions.
>>>>>
>>>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>>>> attribute to suppress unused-function compiler warning.
>>>>
>>>> While I see that Julien has already acked the patch, I'd like to point
>>>> out that using __used here is somewhat bogus. Imo the better approach
>>>> is to properly make visible to the compiler that the symbol is used by
>>>> the asm(), by adding a fake(?) input.
>>>
>>> I 'm afraid I do not understand what do you mean by "adding a fake(?)
>>> input". Can you please elaborate a little on your suggestion?
>>
>> Once the asm() in question takes the function as an input, the compiler
>> will know that the function has a user (unless, of course, it finds a
>> way to elide the asm() itself). The "fake(?)" was because I'm not deeply
>> enough into Arm inline assembly to know whether the input could then
>> also be used as an instruction operand (which imo would be preferable) -
>> if it can't (e.g. because there's no suitable constraint or operand
>> modifier), it still can be an input just to inform the compiler.
> 
> According to the following statement, your approach is the recommended one:
> "To prevent the compiler from removing global data or functions which 
> are referenced from inline assembly statements, you can:
> -use __attribute__((used)) with the global data or functions.
> -pass the reference to global data or functions as operands to inline 
> assembly statements.
> Arm recommends passing the reference to global data or functions as 
> operands to inline assembly statements so that if the final image does 
> not require the inline assembly statements and the referenced global 
> data or function, then they can be removed."
> 
> IIUC, you are suggesting to change
> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
> into
> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );

Yes, except that I can't judge about the "S" constraint.

> This gives, respectively:
> reset_stack_and_jump(idle_loop);
> 
>       460:	9100001f 	mov	sp, x0
> 
>       464:	14000007 	b	480 <idle_loop>
> 
> 
> reset_stack_and_jump(idle_loop);
> 
>       460:	9100001f 	mov	sp, x0
> 
>       464:	14000000 	b	600 <idle_loop>
> 
> 
> With this change, the functions return_to_new_vcpu32 and 
> return_to_new_vcpu64, implemented in assembly and called in the same way 
> as idle_loop(), need to be declared.

Which imo is a good thing - these probably shouldn't have lived entirely
behind the back of the compiler.

Jan

