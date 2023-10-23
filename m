Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168937D2D1A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621089.967151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqah-0005Rm-6w; Mon, 23 Oct 2023 08:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621089.967151; Mon, 23 Oct 2023 08:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqah-0005OS-3L; Mon, 23 Oct 2023 08:47:15 +0000
Received: by outflank-mailman (input) for mailman id 621089;
 Mon, 23 Oct 2023 08:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quqaf-0005Dh-Pi
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:47:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1ec5e9d-7180-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:47:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8501.eurprd04.prod.outlook.com (2603:10a6:10:2d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Mon, 23 Oct
 2023 08:47:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:47:09 +0000
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
X-Inumbo-ID: c1ec5e9d-7180-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrrtTdSHFc9OzaDLzW+INhP5ISCk4/QEpEPlj8dF+aA4yRGUGwyZ3UYnffYgx/r5YNBozqgrI/27liRliYAL8ayGvEThDvRmvLIJE/Ot6G31KdCGHAnac3lOqKJmOAVH7gBImi45XdSva95OdZxreY8jDerpJg7S8Q02l9UkGQCJ8bN3eCJN6uNechGd1o0WfrYtT74sf+7uNGLsFGs2EByqr9RyuM0hrnNdqDkRCF5L1P7OoDVM+CYtZeiCQ504O3rsA77j4U0QwvL8Td3kBkCH0WdnjKtgzqKdR5v35Sp3FXWmySV4DArm1re+mh9Fmgx+TD3p8XV6QDHCAFVsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD+nQ5Zwp0XpZKuHKXpaw+I7Y+UiuAivr/EeVo2Khxg=;
 b=BG8REplpRPGT1afl6vWJ40+1qAyO7sxhWFYHCCzD0M2lehYYyqNQQeacMfEjbGZ9U0uOiiSeHjlACJBrIBTJb310IuPp6YnHKA5TNMBaEvsFjx9d7639bONr3cOv9tNZpTIuqUBJVAB4x2Z3eqgsAbpAXHW3yEGdoCvANiZxCJGpEurOCdrvhQ43igT0bfjpeiD2vTRI29BQTWXGPPwzbyInz9ifBPCjuT46q+veN0gTBDGfwhX/KDw2SArloLYG6UB6WscE9QQCfbZGPz3f5P6icSA7elHU+EZssqjep2z4nheDpK03SDr8wDXeIH3+VpRjsFR/Jaoq66H9zhQhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD+nQ5Zwp0XpZKuHKXpaw+I7Y+UiuAivr/EeVo2Khxg=;
 b=KAstmf/Qym1tdzVPQZdjjeT5QC+k9TiJrhq9hwD7LrJVt/huH2d9w2bztkuW27GPK/8ElkhhzWqGzZykEAeT+9dFi21o1cfbYPNKFF7zoRx4zojo3sIPs8diuzjYEAx5V5VpI4WzNUxXQo+JGxvG8Wq1F3Tl12rb/md4E3mhIS7qnfN7uazETw6rurqP4Kw7KD0gl/BeINh5BR3QTcBtye4+1itqfdsVEzO4p1u58yPzaKdYlygRvPCrqJaR6jcJAo5rpDmIn+2WEqMJbxhkmgEua6DTprhwqu9jy/pQlJlgsMud9iXVxckAa6KAvc0vpFmFp3FAPmst25deqkSITw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c844b724-0d27-34eb-368c-d6537bd24017@suse.com>
Date: Mon, 23 Oct 2023 10:47:08 +0200
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
 <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
 <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
 <d83c024b-05a9-5298-9e43-e693675c2da5@suse.com>
 <6a90edf81f410db8069526228de75d7e@bugseng.com>
 <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
 <800b2c809829942210323804b6778c40@bugseng.com>
 <23f2682f-acc4-20aa-21fc-644a3c1141b5@suse.com>
 <564217259e2f65e34d3497697bd5f9e5@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <564217259e2f65e34d3497697bd5f9e5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b60f47f-ba8f-4462-91d9-08dbd3a4a4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B+0MJOla9c+ThKShWPSLBEzN7BYWMMSyZkLWLNL7gJGdBtPRPkNN+Id0PONEk9Wu/A/5ufTYQukjnutA82PmLwKHR0ABITj4G/pRVujhXIUyGYcWcxV+g6wJHEQEyoDSQo0sZ4Cn+7lbBS3fLFHQ3/NC7ftvAzNOuhkMISbsWnHd7C1QRog3Bt3Np26PX3oldbsgZauZsonlHBBStohLvQCSpFx1c9RbBwZ5FAhkwxFy1qt7t27ig0P6ICDCLTn7xAKZeRsQbthczW4lRqUQ7nTrN3WfZBwdsrgF2vIgb2TV9XVoXaeWihvUaORQBZaaNSsYpndug/peWZlvgg+UUSi5pJOjevB/24P6rU2s1LzB5tmvEGQ5985HYAdwTbYbE9E0/NpGFEMMY3J5/FNpJuhmv0saiORP1hwbXTOmVfZrDol6feshMBH5PfyHkylZ873tnzbPta6AXBJK1VwI3J7TjBsI2yGAs0MLYhchdu3YuAof3QheiG1jKFCFsp/dbA/0BIZ3KWJNGNp6jGRZrZfPX3JCvMKPQ829u09O8DzpZI9C4tsb2pT5FzD4YFatD1kH1Vn/qVxVmkleY0z7ixH80gzIPo0XEpXOmBp9AyBCNLaWtLHHqRj3hW5EO2yc12Vmxb/k7AkUj2lUru+6eA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(366004)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66946007)(66476007)(66556008)(54906003)(316002)(6916009)(478600001)(31686004)(41300700001)(6486002)(5660300002)(8936002)(8676002)(4326008)(53546011)(31696002)(86362001)(2906002)(7416002)(36756003)(6512007)(6506007)(38100700002)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG1TcU9SVm41clFZLzBqeHZreTlMQ2RzOS9VYnN5aitsVmE1SUlaM2xQU3BR?=
 =?utf-8?B?aHBqdk1BaDBIU1JUeUIydEpMNHlkWmE0SnVFUUl5VXU3c0k0U21FaHlMdytJ?=
 =?utf-8?B?bFdZUXpRMlhvc0VpblFTWnROMnAxYjFGZXlNTmFnSjkySDNrc2kyaklKS2xw?=
 =?utf-8?B?dGozODN4c2FsYmE4a0tVcnB0U3dJdkdyRmhiaGEyZldsRzQySFpwek1XRFIx?=
 =?utf-8?B?TEFKbnl6MzVKZytmMEJ1K1VhMzFXcDVWbnZIZThjMjEzR056OTlYS1AzZHBQ?=
 =?utf-8?B?YjVMYUhaeDlFdWJwdlVWaEppRktRc3hMNGNFakJaMXl0aUNodlY5T05vdDFm?=
 =?utf-8?B?TEFmdUtWNnBtUmxyUkNTUVU2dFVhdGg0VkgxaUoyRGtFTWx2OVQ2bXplSUlP?=
 =?utf-8?B?S24ra0drL0tLN1NPK0RZdVFBMFJxWDNQZjJCZXV2dnZKdmZhOVBFRXhxOE95?=
 =?utf-8?B?ZHBZM3RFMTVtbWRmSDE1ZGpEZGd2czJBb0tuc0oveFRzcFh6U1hzS0NmNGhP?=
 =?utf-8?B?OVlHN2xwUEVVWnlpbVE2Wm9uaWN4UTN4bXlkTFYxTHBtN2ZXbHk3U29WZVZx?=
 =?utf-8?B?b2pTSDlDdjQxaGpxTXlpTzVwQTg5RXl4MlNvckdKb3lWczBhMWU0N3VMVmN6?=
 =?utf-8?B?Rzh1alVBQlErNWtXbFZZb2gwc1ZmdENGZDN4WlhROGZuT2M1L0xrVEJWNlRz?=
 =?utf-8?B?c3U5WjVqenhGanRjOHpBNVVEUWRkR0lRamRLREJjRFJPQW1uaVBGNjhjb1Nu?=
 =?utf-8?B?SzdvaTNoQWExa01qK1dEY2s5YjFoT3M1aDNDVDl0STRmNTQ3Z1NZakplcUxV?=
 =?utf-8?B?UVp3M0djd2xFNENEQ09yd0JuZzN0dThwOVFwR1E5Y3FMbzVwSmdCb3NTcUE0?=
 =?utf-8?B?a2lPVUoyQ3dndXA0NEZSM2Q3akl1aXhqTFd5WXovbWVWQ2RWazhjS3ZEdDBU?=
 =?utf-8?B?RjBJYmlkaUtsL2Fhd0sxeDR6RGg5REFadnYzbHM1cnBzeCttUmsrS1pvVlNw?=
 =?utf-8?B?UmVOcnJBQVhSMFpLMHFOck9MOWhqSmw4R2N4THQ0cmFFOWdCaXRUZ2EwaHU3?=
 =?utf-8?B?Ump5V0w1d1ltVmJXM1ozRzNxVlFIY3NuMUpnRXc2eDI0QjR6MUNqQ1VyZ2sz?=
 =?utf-8?B?Zy9LL3ZnRy9WeVgxZm1ZdmxkdXhyS3JpY2dDWTNyN28rMlB1T096WjZCMGl6?=
 =?utf-8?B?TXJTRkVwdmgwK2cycHBpVWZwSGZHT3VpVThTYW5tTHlsTnVzR250ZGh6S2xv?=
 =?utf-8?B?bmlHTDVaTlVDQit5K3FXR2l1S3JWMzYwamxHajB5MHFKMHdOWjB5amNzMU1j?=
 =?utf-8?B?eGJ4aUE5bjBVZks0d3piZGdtdzVWQzRlMERwaGtWLzNJMmUyYS9GcEJYU21w?=
 =?utf-8?B?MXJQT1VyZGttMEJvYys2ZXFRcFlySGc5YktNb2c2bWdyUFBtRUpnb0c0MTFZ?=
 =?utf-8?B?L00yMnc5bjBWZFFFV2UvN0dFa1BJeFRoTXdYNUpPd1RmMTQ3c0Q0cUpqcHF2?=
 =?utf-8?B?RmVMYlU2c3ZnVGlWZ05pb2lhMHYvS0t1dVlRTUZMNUJ4WTdWM3dEWHlYdlh5?=
 =?utf-8?B?bDN5WDN2aFAvQlNpQm1OZjQzeFV1OHMrVXF4MjBxWngzTGl0V0g4MlgyUTIr?=
 =?utf-8?B?UWJadndZY3hCR3E2dHZzdFVDcUxzRmRuZFo1QzBaMFZuL0pYRzJqNm04ZkRK?=
 =?utf-8?B?SGQyVlVhZmY5ZXB2THJlRU0wVE8vU1V3aFdyMnhtN0IreFgzNi9pT3kxUlk4?=
 =?utf-8?B?TWhlQnBMQmswdjJpQU1ueEFzaVlVdTRVNkNBNk9OUUtoWC9waVpqMmczSkpY?=
 =?utf-8?B?akRXMm9zSnpkdHBDMjRwbnUxOUlXREYzUFdMUE9qMUFXNkc4YlM3TU9pVEFN?=
 =?utf-8?B?ekd3NkE2ME5oVUV4S3djT0cyVHBvSVp4Y0JxL1dRNFF5bjZzUGFaNGpOcytq?=
 =?utf-8?B?VDRtR0drV3NSUW1HSDI1TTd5cFVRQXMwSHdBZDBwQVcvcVBhSXFZeW0yZDRQ?=
 =?utf-8?B?eEtHOTUwazJJS0F6MjE0NjlTZTFaR0NKNmN1Tm11QTdJaEk5MUl6RlRlVXBn?=
 =?utf-8?B?dCs1U3doZkJ6dkR5ME5yK2xxWVlkNVlOSWxTOFpXLzFkU3IrU2J5VWxncXNt?=
 =?utf-8?Q?wyt09vhXSKw0gdGKn7+rO2wLQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b60f47f-ba8f-4462-91d9-08dbd3a4a4de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:47:09.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL29LHRABZtSSzG3m0TPZBk4wK/YouPMGSZ6pHifVzaNIMKDYAKUzWziE3mjWxup9lKmBiazIo4RWiaTWmX3xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8501

On 23.10.2023 10:44, Nicola Vetrini wrote:
> 
>>>>> 3. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with 
>>>>> octal
>>>>>     constants in the expansion. This will be deviated;
>>>>
>>>> This is what I'm concerned of: How do you know up front whether such
>>>> new
>>>> uses want deviating?
>>>
>>> I understand you concern now. I can argue that all the macros in that
>>> table have indeed
>>> an octal constant in their definition (0 is explicitly allowed by
>>> MISRA).
>>> This is also specified in the comment above the INSTR_ENC macro
>>> definition, therefore any
>>> new addition should have an octal the second argument to INSTR_ENC.
>>
>> Right, and I previously indicated I agree as far as INSTR_ENC() goes.
>> What we appear to continue to disagree about is MASK_EXTR().
>>
> 
> Yeah, sorry. What about
> 
> if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* octal-ok */
>       (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* octal-ok */
>       (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* octal-ok */
>              return emul_len;
> 
> It does not really fit in the SAF framework, because the deviation is 
> still done with a
> configuration, but at least it gives some clear indication on how to 
> introduce an octal
> constant in this file.

Well, I don't mind the comment, but is the config change then going to
also match (part of) the comment, i.e. key off of not just MASK_EXTR()?

Jan

