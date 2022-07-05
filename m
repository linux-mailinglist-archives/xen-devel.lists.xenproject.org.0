Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10CB56640E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 09:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360654.590067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8d3K-0008EQ-6G; Tue, 05 Jul 2022 07:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360654.590067; Tue, 05 Jul 2022 07:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8d3K-0008Bu-3G; Tue, 05 Jul 2022 07:32:58 +0000
Received: by outflank-mailman (input) for mailman id 360654;
 Tue, 05 Jul 2022 07:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8d3I-0008Bm-Ti
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 07:32:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af8e7f63-fc34-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 09:32:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5246.eurprd04.prod.outlook.com (2603:10a6:803:54::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 07:32:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 07:32:53 +0000
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
X-Inumbo-ID: af8e7f63-fc34-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXfwPpP6AH9YNWmXt86IDfdaw0ykG9fJOyvaVxMIjuFRwRQq2BnCNOzsRWEEF/4sSNQC51aE7GN67iS6HnYqZkIbzH4O0gkSPL/0nIiSOHtbS5DL+WasH7DtofC5HuQzq6dgopMhdTsTOFTUsV1ciDxY6xFjJzSceKr5xl0i7AtdnLjWTbKFAgVAOZOy2bdShbD9IE8XXZn+mjmmCrBSs+xc/C03mUGQERX1Q6OLqEFa3ZZvYpKMUIZNM63/WF4vNDXCmVePPo2+RnYLcJkSHWw98w8XdPio7Toj20x/WKtC25bXPmPWUzXlJqwoUtacgLjAMEFOrEy6Qs9eUQ8EyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OluX7aEOrjo8Q8v0QVnoNB3RdsHYRnvbmTSYSEY2ex8=;
 b=W8o2c0FW7UIR9yK3PB5ttqw4TlABy4GTjgrMk+i9NUnktGO7fjKYQdx9nlnYGUcGfJd4mPfZno7u3k2/2s3niG4wYgtgLW5TFQ6Nhjcqm5kTJ/oveFIPKFCcbMDWJASyaMymGnPJqjo1JamZ/mtpa3uhi18CvX+ZmXmlp7Zb/DaE4eKJoNmlzqVT3dP5PPbsR1qaWOiGiNFip4kDE2z8yiwG9N0HVHItRyBW0c2FGbgks96qwgFxQgd64ZU0kneWxm3snBfE2LVm8rSKCb3QNL/BhIt+ZyqzlAP40IPjoKCidmSOPRFEjMLmk6nJYwK8C5tyzI47am67bgmjguympw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OluX7aEOrjo8Q8v0QVnoNB3RdsHYRnvbmTSYSEY2ex8=;
 b=GPDzwwDOu8RovXReBZqz5/5vltkOo0hvr5k8bbS0aeJdDlUsQqp+mXSSRQ4c8VfT2ulnrtLZkhzm6tQ2fjTV2stjezjU+MGoQPiB1GAnEcQYKrpILlTFWYBhl/YUqwjM8dKSmlxMv7+rmZhPF69QwxPN9qaq2JoULSsOBMRE6nx0ErYKgOqSSzAKkPG5rbZtsbrrdUWWicZW9lOtK+7SU1TSYyczcxuhzw/xCyyO+vOLxy21m0pjkBxuZ2RtouIVdqMuGV6AZPoUTdxXMXE5UkvhznVVsx0HBvYDPsajhjHZcVzOkLCkFo/ZLDx37mQCR7I9ZK5/peRku24H/LnIMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <480ec801-d5b2-37bf-9e84-456770b591b3@suse.com>
Date: Tue, 5 Jul 2022 09:32:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] Xen: fix EFI stub wchar_t size warning of arm32
 building
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220705035405.1283032-1-wei.chen@arm.com>
 <7843fd16-d2bd-1280-3513-11bc590aa55f@suse.com>
 <PAXPR08MB7420F3F4BE896CBF60C0BBE69E819@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420F3F4BE896CBF60C0BBE69E819@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e50ad12d-b1fc-44d9-a565-08da5e5892a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5246:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5I9ZEnR4NioqR/kCwgymM44D70KacO0e/OAwFKTdrpZ4bOUJYwSXWDBo1RWtW8Vgh/UHnqCNjwXcuOXNSyim+0FNodgf7MGCYUeIC9PPWkCbD9DMwY5DYAwv0oko4tcr0xd+N6KkszBUDRCep4VYPktxWOzo9pgq5ku54/gi2rIlFM96qZWgDXAKUtPoPnLHrUbAUiMhpmnKRI5inigCIQd0FRMMI+B4TO8iCm4E8R7T99iN1VJsMy/breHm6KKl1p43mbzaZmZxJyU9wXhKeXLPKt1rryVKiuRBqKiGHfApOeNMe5MRZQpez28hkE2pvwf3Zge1k5bc7B5fN6ECZm62ME5NMX4hzNJVYpzQjg4X17imsrCJwKDTUO8g3W+pZ3N6fEUmvNeprFqgw/cbHjhK1sIag5toQf8up9eJvAu1Sd+9UpsCB2rN3XiKLEJWZT0bqbhBfAWvMdaPbfRIgKKlUzveLmHSsPfWAsupdhK/jtUDWjdt+o2Z+M42riQBRrLLs9evAcyG+rqNoc2mHXq6goohxS45kKUDvaCUJRom1IXIJ0ppPDBhJq19jTk4FJ08X6XPGz+M8p//h9oF7Q1V7GrMgC8SVwe+Oyv3VQ4hxxP0aALu2KP4N/wShyWF9ow0WkQWdIkLq46AgX02QGuEJTnwENFWLWNmmJ+GIlw6v4fvBqqBGzOQQcrqfv/cReoidSLZ/tUaUzX4emwlZhz4mCzQsSq9Y8SVERYLEDvMbhPLdZe235joT4o2+bOMQUy4kw2E2tT6OtSOP3MGSz5FO+/O0osONzsqPHkJ/HjJc5PDhmuJvFDWg8v4KiDwHjyw2lMiBma45ueUs9KOnZYzXZqXycDgJUWtQEtKtGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(136003)(376002)(366004)(186003)(66476007)(6486002)(83380400001)(4326008)(8676002)(66556008)(66946007)(54906003)(2616005)(6512007)(31686004)(36756003)(26005)(53546011)(6506007)(38100700002)(86362001)(31696002)(2906002)(41300700001)(5660300002)(316002)(8936002)(6862004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTREbGdTaU84amdNV3dyMlY1cEI4bmVxUWJvNWsyQzdJVkZhb2JRTHB3Yzdy?=
 =?utf-8?B?eHVpODdTWEFBZE5pZHJHK0RsYzR5bVpod3FaVXl5UVRXb1V3SGpTaVV1RWxk?=
 =?utf-8?B?UkdQL2RIUUk5ZU5BOWZTUlp1YUd0M0RKbmJ3dTN6TGVkZjlBL0pjK1FTbkNT?=
 =?utf-8?B?ZE4zRWpUQUlJUzdaSFFrZlhPUVYwWjRIY00wZldLWmhRQ2FKbVM2ZGYrT1JC?=
 =?utf-8?B?d0hiMjFaRXUzT2svZDJpaFFONXhoM3JZby9KTUhYTUNkV2hhSnRFTld0aERy?=
 =?utf-8?B?cHZUbUV0U1F5Q2xmRmV2NnljTkFCWWRBdUIzRDZJOTlxc2FOV0M4NThoRWFQ?=
 =?utf-8?B?Yy8vZENtU3ZzRkh6NSs3UEV6T0FTeHFJa3pCelI1NzdBTVR4eXJoT09XK1Q3?=
 =?utf-8?B?d3BEb1Y4TmZvN2l1Mm1GSUY5a1dxNlVpMTBLdGpSZzZhdkwvVEpYM1pMTzJG?=
 =?utf-8?B?c3NRRHRuR0tySWY4cVQ3Wi81VTRqSXp2Zzl0RUdnZi9WKyt0TUVQNDZuRGxa?=
 =?utf-8?B?SnB5b2hoRmgxYXpFdEFUOTZUaXl3YmdPZCtJbDlmaENQTytHNDBDQ01lblZn?=
 =?utf-8?B?YnFDK1BlaUFZMzFJOXdHUlJiTER3QjY4K1lIb29ZUno4NE5TMXBGRTU0MG54?=
 =?utf-8?B?eUdjMGF1REpoTGQ1MFpESGluQUE2WjNPd0hUYURyMFFVc1QxcnBxTE55SUxh?=
 =?utf-8?B?STVnS3Z6TmdlSGRmY3NBeFRKR3dPOUJLV1NOandEdGROQzBueW5KUkVUeWhq?=
 =?utf-8?B?VTV1aFk5Z1ZJcXdDdmdzeFlpcFlwRHE4cmR6SlZGc2hLMTV1TjdOZ3MzNmVV?=
 =?utf-8?B?RzFkOFlDRFBBYWFPVFAvQXNJNUEvb3RTUjhRMkJQOVN5RFNhMGw4MDFHVDRM?=
 =?utf-8?B?b3I1ZUo4bFFmT1EydS9qWS9sQXlEODVoS1hkV0Y3ODcwNUtiWjlId2ltd0JD?=
 =?utf-8?B?Y2hTNm0yRlNTaGZacFMwWTlWSFpWc0Izb0RRY2JXY3JReXhicEdKaUNBdGM0?=
 =?utf-8?B?Vm1IZmh2bGlVWHZyU0JPL2JhTDZHeURlZEN3cDlmelhmWTJqVmZZUzlXQS93?=
 =?utf-8?B?Y2xRRFRZRGFYLzBia2JLQm5Ka0U5bENrakFya3FmNENCWFh5VWpwcmxUTisv?=
 =?utf-8?B?czZBcnBDYmdNajk2TXR5U01veDVkWHlCQ0RnR2xnUFFWT3ZDZ1ROTjU5anVa?=
 =?utf-8?B?U3JOVC9qVjcyUElTMzFPZnBKSHR6djhaSWdpM1Y0NWxoWnpLeFRYQWdLVmUx?=
 =?utf-8?B?WnFTWVZ4WklURnhhSEhLbnJMY01kVU16eEttY0UvZUxHL2hoczZoV3UweThX?=
 =?utf-8?B?SGhySTEydUloQzA5WnducnppalJaMTF4WDZWcENtRWdWMndBYm1LNmZBWTM2?=
 =?utf-8?B?eWZabUFRdTVOSlZvRzVTVitxQ0VRaTZ1aW1QR0xDSjBNMjd3NDY4Y2Z2YUNs?=
 =?utf-8?B?ZWN3d0U3eWxaajlDMGlUL2NUeVVDcmNYSUNyaHAzbVRvakY0QXJseEpJZ1dv?=
 =?utf-8?B?Q204SDhGNU43U3ZEQXJrZUJEMGtFUlNodit1dlIyM01laG9RZVlRdGpBZGVa?=
 =?utf-8?B?M3FGNHQ0VnA4ZGpraEFlMUlSZCtCV3NuTmFhTXpQdnpLa2ZXbnVOTGhRWnpF?=
 =?utf-8?B?WVFLcU9FamUvNUh0S2IxQ2lNbFpTMkxIMjZJeE1jM3VPWlc4QmhoZFU4OTZL?=
 =?utf-8?B?Ly8vYkNhMTBPVW9FOHdISkVVUzUxVURSZ2xOTCtjWjZBZS83MW5aTmNwVVds?=
 =?utf-8?B?Ykk3cDB5bGVCR0g1ckFaZWdWbTcvMGRlQWpZY2txdmlSL3I0dy83TWRkdUFN?=
 =?utf-8?B?dmh0NVk4bDhYMjVma0sxREY3UlVhQ0pIemV3dStpZGVTWXFWNWNLTEtCY3k1?=
 =?utf-8?B?aWFFbFJaTGRQNy9sZkZGaGRoNFpyVFZ4K2s2a2dhWE5neU9WWGM4Nm5YckV1?=
 =?utf-8?B?NUI1VWRPaVYvZmtkNDh5N0VUMXZOajk5bHNmbnozRUdtVFFzR3NGVFF5elpp?=
 =?utf-8?B?SlRxWHkzZ01jL1JxRnAxK3QwcDRsSjgyNEF0dnRQTXN6NzZBODlpQlF2OGZL?=
 =?utf-8?B?VjB6d2FLa0phcENldmNWNTJESWMxbEp2UXFnNGRRSjRyMWwwSjlLUEtFQkVB?=
 =?utf-8?Q?6cOyAJlKpMdmiz77O7M0T2alo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50ad12d-b1fc-44d9-a565-08da5e5892a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 07:32:53.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9oLQOueq1TYKD03QnIOkA0beIZhyCwMFmtrLToAEXxgKakGuwQn9MRoZnyw/u4o0BBHxSqWHd8TxFqeD4z+VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5246

On 05.07.2022 09:18, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月5日 14:35
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>; Volodymyr
>> Babchuk <Volodymyr_Babchuk@epam.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2] Xen: fix EFI stub wchar_t size warning of arm32
>> building
>>
>> On 05.07.2022 05:54, Wei Chen wrote:
>>> Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
>>> is using stub.c of EFI common code for EFI stub functions. But
>>> "-fshort-wchar" CFLAG will cause a warning when build stub.c
>>> for Arm32:
>>> "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
>>> 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
>>> wchar_t values across objects may fail"
>>>
>>> This is because the "-fshort-wchar" flag causes GCC to generate
>>> code that is not binary compatible with code generated without
>>> that flag. Why this warning hasn't been triggered in Arm64 is
>>> because Arm64 does not use wchar type directly in any code for
>>> parameters, variables and return values. And in EFI code, wchar
>>> has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
>>> CHAR16 has been specified as unsigned short type in typedef, the
>>> "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
>>> files are exactly the same with "-fshort-wchar" and without
>>> "-fshort-wchar".
>>>
>>> We are also not using wchar in Arm32 codes, but Arm32 will embed
>>> ABI information in ".ARM.attributes" section. This section stores
>>> some object file attributes, like ABI version, CPU arch and etc.
>>> And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
>>> too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
>>> but for object files without "-fshort-wchar" is 4. Arm32 GCC
>>> ld will check this tag, and throw above warning when it finds
>>> the object files have different Tag_ABI_PCS_wchar_t values.
>>>
>>> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
>>> to use short integers (2 bytes) instead of integers (4 bytes).
>>> So keep "-fshort-wchar" for Xen EFI code is reasonable. In this
>>> patch, we add "-fno-short-wchar" to override "-fshort-wchar" for Arm
>>> architecutres without EFI enabled to remove above warning.
>>>
>>> Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>
>> Tested-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> Thanks for testing!
> 
>> As to the description: Why the reference to gnu-efi? I don't think
>> it matters how they build their code? All that's important is what
>> we do, I suppose.
>>
> 
> How about:
> "Xen need to keep "-fshort-wchar" in EFI code to force wchar to use
> short integers (2 bytes) instead of integers (4 bytes), but this is
> unnecessary for code out of EFI. So in this patch, we add
> "-fno-short-wchar" to override "-fshort-wchar" for Arm architectures
> without EFI enabled to remove above warning."

Reads better to me, thanks.

Jan

