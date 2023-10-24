Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835ED7D49A7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 10:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621760.968540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCYu-0008Ms-L9; Tue, 24 Oct 2023 08:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621760.968540; Tue, 24 Oct 2023 08:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCYu-0008KN-IE; Tue, 24 Oct 2023 08:14:52 +0000
Received: by outflank-mailman (input) for mailman id 621760;
 Tue, 24 Oct 2023 08:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvCYt-0008J0-EP
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 08:14:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6663240c-7245-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 10:14:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 08:14:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 08:14:46 +0000
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
X-Inumbo-ID: 6663240c-7245-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpJNjQsQfsIiK2GSasugVnYC6g5t4kWv+2+/zVXpqK5CPhMwCLN/EVX1xGKWwqMnQMZUEO9ow8OsuCACvXlfd0k4Qe0jOuGVsV0vOIurJjEt8YYZhc2mNfRTFQwEMca+5ribn2+skvS1uW7io/rKDtKzAVrIF1Ewe7rjaHN0UuylW/Vz7DosGG3dml5cDl2X37vY0CR4SQBIFJdik1gTJqOrGuCWlF2WAGr2qSwJrP6HguJBV3asVfqUwB6Nu7a2eMbIBe+fzBdbn357CYy0tR4+tK0GJ47wlt3d0eoVCmORIQ119ifc1/IVRSbkdVdLjccZawrBxgq0/v3TpH8TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lClNo14qIxOXDeccmGf18BEwqsElUsggSzrtG1z4XxY=;
 b=Nx+05zA5ZM2r0tB7gCd62BwD07XEsCvAcsvxRjBJSEiBxANWky15hoJRk4VMTPWdd7FPxaQfLdkiTOKl6/uIxK1hhEa1ZEVEI2Wy8J/CAebrsER1d/MTG5Yg5K5r3gXskHBSY7mEaBOH7ZQbFFwsjMHZIw6fXmimozA8EX4hM91Y3pTrAE3MyXejgAVK3baWlhsRpN2PqSBPwcIuPW3toe0YKkpItKxVFDPvzwgvfzyQxI6BuOPW5lu2Ac6nQICkeX/OpH6Nxv6FcScO1/UpCsKRWChaALnvAzukq5w0xOYl0HTM/1IgxYEL8SSrXtOfuAKNOubGT9dVzgZ1h7NIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lClNo14qIxOXDeccmGf18BEwqsElUsggSzrtG1z4XxY=;
 b=39c5lLJxHOrra+qwAWKXBwo1Irc6hTpVL4LHniXMnAfxuV0NIshqK2eaADybOfdipZ2qPTDZcA4cuGd70O0M0AejCJfllpcyCBW2b5NkuK0SJxEwslmEMcwHwzn1O2kwpLZpq7JiSY3at5Ygi3Wmiq4zlHRBQxOc5Uj1fJ6iR9TyRGxqMea+3xsB6fHyQGUrVPh5+WZuTTo4/K7eJPp0hpV/gF7TdRiHx80fBVlmkTpoypOIt/1nkkyiYn2zh2ijnyp0Iu/Wn5ljlO6/k1pKOkfyOZZtWa84r8aSdUf+tLuhqV/nGIRIRo4jydgFaJ9RPA6NuhVwhQTXGbbI7W4O3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52422128-156d-5d6c-46b2-261b1c7e85c0@suse.com>
Date: Tue, 24 Oct 2023 10:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 3/8] x86: add deviation comments for
 asm-only functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <36d24b3a3e264f0e0b265b4f68d6432a143d64cd.1698053876.git.nicola.vetrini@bugseng.com>
 <a8370e98-1cb6-8fde-9458-e579047dd607@suse.com>
 <2d92ef1f753165e2fa9cc7c04c219217@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d92ef1f753165e2fa9cc7c04c219217@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f99be3-ae1a-4dd2-d13b-08dbd46948fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OBdxwgCgXUfVQagv5CLaQf737A+CI3U+hLTSTNWxUxIS/yIK4MAHIADTF7L3snlyEeBASvaj846IlcsGviLKlVL/hr5cmFaZm3Z+bYp2TX+UqEzoRWLCaaPYh4W4phvcNDhhri2oUJ3pcQc7PiEzNAaob8bEttET8FqoFttnf1tekKAmjZeqql1WgnoSoCQBx7uaT2vxeTZqZTWr4JoSa+IajAr1zFMG6kTHeViiOf/Y7xhTclps1oAVHXDTeBN1nlXOuN+/wIIi5I9Lcw4cr+36d3RbqFQS+uXUREZtFFcJlEdqV0eApdWH+aSj4NLiTpxDD/kkOcDzChaSe1MyUtA6uVbSYCjYOnofRKPmjqD4gW63IFHd9Nl3GFNevclcSJ05sRvC+Bw7NXCcEizNrO/S+cG3Ys6cDLPCJkczCJ1Q4Vv/tnWX1h77APNaPhJPkdnrfqX30N0ba5iPyTx2lKGDIaQQYHWsKvAPmK5i94DAOg8rC29L46e57MORQZ5l29V/dXTamUvWVtrxPe0tMXSBd44vLJFKOmpnJpk+8QVWw1xqEM5MLd7xxn9bU6CTWw5b+IuhKPF58eneExF3awePoRz1lVVEyL+wT9KHaqVxrGjkoLd5+k/6TVi5vICbWfE+X2fWxVgIowQdqUzj9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(2616005)(6506007)(53546011)(6512007)(8936002)(26005)(8676002)(5660300002)(7416002)(41300700001)(4326008)(2906002)(478600001)(6486002)(66476007)(66946007)(66556008)(54906003)(86362001)(31696002)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk42REtvWWxyY3hCdFpBTDBxa1FVMDZlc3EwZmNXRnlhL0NDRVo1bkw5dmdN?=
 =?utf-8?B?SDlvcHdvKzUxSE45NVpKSzRIdytkck1hai9RSHlvam9UWUREdmRZQXZiOWxq?=
 =?utf-8?B?K05lYysxN3h6SGpSUWRrRDFORkx0S0Rza1BWOFE3ODZNaXRkY29na1VFNDAv?=
 =?utf-8?B?M3B1MnpwV3lJeUVPMXdQYU1rVGN3OCtFQ1NBM2pwWlFkRDlMNzhYS1RQSG52?=
 =?utf-8?B?VHcwTWVYSGVjMGtyZ0VQUnQ3ekRTck1jT0RnY29xZ1hqK1hTenBVbjhJdlBR?=
 =?utf-8?B?d25Rc1lKYWE1QUZsTnFNeVF3UVlXRXpOUE5QOHV3aUd6SGEvaGZ2Tlh5QjNm?=
 =?utf-8?B?N2dFSWp2SkRrTU1CUlM0VHBIMFM2Snh2eXpnMUxoMjBGTHhKRGhqVG5YN0x1?=
 =?utf-8?B?TXA2enJrenM5VUJXQkZkQzhmUzJZb1I0ai8zWEw1RlhYcm9xWmtyVHVvY2dF?=
 =?utf-8?B?c1VVMHp5bXlFZWo4eGgzMzdsMUVnNXlOc2xVeExIaVg2akFCVndyWWdMSDda?=
 =?utf-8?B?ejBiTGpZbVIvaVFCa1FzanJmUXY0QlFaVno5Zy9hYjBMcEp2bmZPeXgybzNn?=
 =?utf-8?B?cFJMQXVFMVphZ2RYWDFwUENWVWFMcGttNWlNWjZoWUhjRFd1Y0Z6YjZIc2g1?=
 =?utf-8?B?NGN0b3Zia1dYRWRLdzZqeXBNVFVaejhxMHNySWo1TGJOdVo2TS9zbEx5dnZV?=
 =?utf-8?B?YlhFZFNESHFMd0R4b3E3NTREMWxrYjNtSG1teFN5SjlHTXA1SS9JUExTN1hG?=
 =?utf-8?B?VW1lNlNqZ2pzek45aE5WanVMYkdjZ2JST1lyT2JUZ1BVK3gvWHZGREFDT0tE?=
 =?utf-8?B?Y0dDSGg3U3hiVU8vWmlRZkU5dzFSSkVPZnY5b3pPMkk3QS94VlJJcVg5d1d2?=
 =?utf-8?B?Zk9OSm1uOXM3SEhHMG9RS0hmRGQ2RlZ4bENLL1J1YktmMnRxanpLYVZzOS9Q?=
 =?utf-8?B?aHZOKzlXemdpdys3UUcvbUxiRXQ3K3FDbWZlWVMwc05adHlTNHlsQmtXYTZw?=
 =?utf-8?B?WGRKQWJ6cjg1L3VmUUNXUjVGWlB5UU9McHp2US9UU1JjSmZYeUdXNzZQbEpx?=
 =?utf-8?B?aXlGUmx2OHN2QXordjliMlhuUktIT2JmY2F2NmljNnByNlhnN1p4V1k1UGNz?=
 =?utf-8?B?SU1IejFqWFRSek5tbkw0UmgrZ2JReU0zWStCcHJGZHcyWE9yT0xQTFBlUUtz?=
 =?utf-8?B?K1JzYk1VeTRzT0graU03YnY5SlNGWnNWak50ZHVpT0NGNGNPNkNzbVA0NHNQ?=
 =?utf-8?B?OUJhS2RCRzR3UDAzYXJsN3ZvaTJuY1lZNkZWeVl3VitzK3RXbzdKUm0rZjRC?=
 =?utf-8?B?SDFCTG1SbzBuZ1RYeHdwemJwWHE4VUpoTDVKMXNBK2grNk5YdnNWclBsendp?=
 =?utf-8?B?dEFyZS91THFOYVlYc252WWh2Umd4M2xtNHJlVFVzNVdNSi9GQ2ZlQ3hqTGR4?=
 =?utf-8?B?dnBKdEhhQ3NJQ3pQa0dFa1VXZHdEdW9udVptbXZIUXBEN092N0dBeVMrNHkx?=
 =?utf-8?B?LzRrbUplVXkrSlF2dkZSa1JxM0xYTkowSTBieXpSaTZjampBWVZJUWVTVXIv?=
 =?utf-8?B?bUhqWkk4QklwbExqZ1Bxb0tjNUJ2UjdjYzFpSzhFLzVJbkIydGw1VlhYWFpZ?=
 =?utf-8?B?d09FdUo2UnZWb29tcUEySy9ETGlvUDFiNkFnQ0VQaW9sYUI0dFJwOFA1T2V4?=
 =?utf-8?B?UEI0NjUyZzFqU2laWmpKS0M2V2sySTNSNXFMZFFMM1JTdE5vUWJpNkNUcmN4?=
 =?utf-8?B?OHMxU2ErTEZUYzB6SWMyd1psbEprNER2ajRiVVlidUg0UUlPR3JqZUlrbzMx?=
 =?utf-8?B?bjVSeVNzQ1FkVVFPaXk1UExMRGF2aUJ3Tk9oRk9NQ1U0MCs5Z28zekR0YW4z?=
 =?utf-8?B?cFIyc3N5OTJGQndMcTVBeXF3ZkVWWVFmWnM5dFpQZXBrSnh3aUpJaTlxK2Nl?=
 =?utf-8?B?Qnp6NU9pc1EvR3hKaVlKTmpNS0x3SzVNK1FYM0tVR1lFZGNkaUdjaEY3SFdq?=
 =?utf-8?B?N0hOS3FoTDhrNnNoc01wVVo1S3l3UkVjbjNYNUZ6YUVpa2RpY0FXZWJIZlFT?=
 =?utf-8?B?eU16SVAxczFnZ1QxaHBXK2lTaldTSGJmbGFQMmlxWlBiQmV0Zktnd1BjMENa?=
 =?utf-8?Q?z6tUKONlYKEjgmP8F3+G22Ku+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f99be3-ae1a-4dd2-d13b-08dbd46948fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 08:14:46.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9fd2lmB4yHeHOe96BM0mO7CZPChY5jn3/b6BSo2Le+K8+g4p89Myyc7q/2vJXSUG0nzlY+s24G03hDVjNsS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On 24.10.2023 10:01, Nicola Vetrini wrote:
> On 24/10/2023 09:50, Jan Beulich wrote:
>> On 23.10.2023 11:56, Nicola Vetrini wrote:
>>> As stated in rules.rst, functions used only in asm code
>>> are allowed to have no prior declaration visible when being
>>> defined, hence these functions are deviated.
>>> This also fixes violations of MISRA C:2012 Rule 8.4.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> Changes in v3:
>>> - added SAF deviations for vmx counterparts to svm functions.
>>
>> Same comment regarding the R-b here as for patch 2.
>>
>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>> @@ -123,6 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, 
>>> struct hvm_intack intack)
>>>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>>>  }
>>>
>>> +/* SAF-1-safe */
>>>  void svm_intr_assist(void)
>>>  {
>>>      struct vcpu *v = current;
>>
>> Linux has the concept of "asmlinkage" for functions interfacing C and
>> assembly. Was it considered to use that - even if expanding to nothing
>> for all present architectures - as a way to annotate affected 
>> definitions
>> in place of the SAF-*-safe comments?
> 
> It was proposed by Julien a while ago (I think it the thread on 
> deviations.rst) to define
> a macro asmcall that expands to nothing, to mark all such functions. 
> Right now, it's not
> strictly necessary (given that there are already some uses of SAF in 
> Stefano's for-4.19 branch.

Can this then be revisited please before any such reaches staging?

Jan

