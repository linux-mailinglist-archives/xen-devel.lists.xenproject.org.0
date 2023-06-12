Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4E72BD12
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 11:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546947.854063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eC7-0002vN-W1; Mon, 12 Jun 2023 09:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546947.854063; Mon, 12 Jun 2023 09:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eC7-0002sn-TB; Mon, 12 Jun 2023 09:50:39 +0000
Received: by outflank-mailman (input) for mailman id 546947;
 Mon, 12 Jun 2023 09:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8eC6-0002sh-2K
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 09:50:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e70a6b-0906-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 11:50:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6775.eurprd04.prod.outlook.com (2603:10a6:20b:102::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 09:50:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 09:50:34 +0000
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
X-Inumbo-ID: 94e70a6b-0906-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1gbdWhzuHc11ddPK6QW7e1U6I7ecfwumu9tAsI7/MXjWvb/OiurnM7JzZiWIEZmAhoadbiGoNZ8uaM1/nyYnsA1VXtdmlUeOzdIBgeA1ATEowfcsqJKTIflxFrV8OqSw1riN6FqRIl6m4UPEmNBjURQBbZgNjaGp+S+U09+zt3xHLdfQrXc0ipRZJVCEdvQqxhhsj2k7pfD3H/W3HzovI5ANirRFHXrrrk40dEY98+1KQdZOFX59RCciVi7cCXOzaqUZW83sL6rIIK16U7pVNRljx4RQUbGjjeKuJns+KJ2Hj/Z4zAbMxrUs3iOU9k7TB/QKl4HQz301woWlilTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H615CpVv+w/SpkQvGfcGh+cMYoDODlyezwbCeGvGAhM=;
 b=IT12K5O0Ci24p8qh9+6l5yrvCj8wJ0Fssra/3kI13oB4DqKN0tu751D6Tn6TflsJ0C8wh9Ca2A7sMMWiB8qahB8yPcNaY/kbpiAzixViW3xSFofvMLSXDM9jQQ366yQqgPrlSWmSyZcEHDyd3pU+X+A/S2ozx95PHxWoAcl3l3vf+ithLO+kSiNisaHbtJ64/TXfLlLj3kMRhyMsRTzVs0K80snfNx7coxxxtxiO9me9xmco/DtcdWU8KbGzB7JhMgIIiShjOlxmCsO+uqb4xXVf+wi8593dkhiQvIhBnWQ/YjM33t9gLRQ+BgM8zr3kJLSOJTQ9FX3n5+CckgqbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H615CpVv+w/SpkQvGfcGh+cMYoDODlyezwbCeGvGAhM=;
 b=aUNKxy3aN6HKJpzLWyOoQ52bkzP+nrBlgqFLCd9YN1jjpwhluKOq2RvFIMjzmN1j5tVtm2aYPIVJ6kJQPqQs34bBlK6723FjAKCfylnhqDdOAZRpyN6l7NP254PuMOUQ/Vk5FB8RBhOFW8Nt6pkngaTzFChMkxtfnIKtZsD2SArBruE1eCxyDFLdIYkOai3LBmpQuHJXApkwM/OnA8AwY/3n63yQdCodT3xpNbZZ1uNl+VaIj10I54MoRLIt18zzPed8gpgn9NRnzm3yeCKK7zGIucz6lm4KXgrPaetaFxWQi/hBjlxReIvdDRIBcDbnj5sE4xy1U4/bxonIzpNZWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e831ef81-85e3-3b5c-f899-e9dbb83b8296@suse.com>
Date: Mon, 12 Jun 2023 11:50:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] docs/misra: new rules addition
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230609174543.4067574-1-sstabellini@kernel.org>
 <a3229436-c714-ab2d-27f9-eac1455d3943@suse.com>
 <6525d690-e487-ead8-34d6-55219ccfbfa2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6525d690-e487-ead8-34d6-55219ccfbfa2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 395a971c-fefa-43e0-c261-08db6b2a7787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oscT7KVY0wFY2xI8v1xEsaRVlZ93irElV9mct9f2Tar9LuaSUXFmagudVAUNHffMT0LItbl8sx7WUFJQ5gjG1fAPGr8Iifb85iTCzRIjqS/ndoo2uyfsfv6Ea0e69J1413Px9KzUHsODjwDBmHG6c6y9GJffCjBNdmYdd81420FcDyMYVpW3zLU/eN+QrPw6xFp9X4y+vbdGBtCuYXbp90tjhUqaJoQn1bDL0rxa0Wmn65xbDA4vGetavp3mnq/4k8UEFLTOT7nbIbQaNAAxo+bBSvmM6UOF0wmENWx/Zb+uz5Hz3KNCgei4l0JtG8j8iNIFFbJbNmExY3kDhJY+bJ7Uqp/jo6CLiRyA5O+WAdUzYTUfojrSZJKOTUljXD9wODh5mSWAxTCB65IXJyLj15qUyzVzjSwf4XSXscHMrq2WZ3QzJFQ1+bVlZDeG5KwQjs4BeshpFoXwxp6tHOgJn/7HBE9O0auagEmt/KOkvMAp2UDHJAxAdQZrfIP6cOJgB1Kakp4NQ1wIwrdKboTJtB/hEkSveM4+KgqhKWxKK0f24flJfzLmuJBWdHrlWdtoKVu8P9XcWqibT6fQ6HCK6206PIBps61SK0opkhNP25k/B48XLHjsOc6lJ+fKVF23d3VnKVla0mCsj/o2LMMLww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(396003)(136003)(451199021)(5660300002)(110136005)(31686004)(4326008)(66946007)(66556008)(8936002)(316002)(8676002)(41300700001)(2906002)(186003)(66476007)(478600001)(6486002)(6512007)(53546011)(26005)(6506007)(83380400001)(36756003)(86362001)(38100700002)(2616005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURhTVdpWHg0QkhUREZ4anBZNGRtL01sOXFhUlErY2hyd3RtMXFDUGx2ejJV?=
 =?utf-8?B?UW9pL3IwaVRWWjg5SjF3aDJjc3VTdzQyTEJMZzBXS0ZHN2Z0ckNEU0ZzYXF5?=
 =?utf-8?B?RmZqS0tvZUdsNTlnOXQ1SFVGcEpDaHBWM0dKenpVK1Rac0Rya2VwelV6Sy80?=
 =?utf-8?B?ZVU0dUZWaEdYb1l3anlVajJxMWlSOE1GbExDV3dxbTU5aXlUZ2FJaHNnVHZm?=
 =?utf-8?B?NGswcFROczBsYndPY281dng1SUZGbVdrSlhOTnZ6L1h2MmlLdGtuOWlGNnBk?=
 =?utf-8?B?QUFsRkFndE9QMUFoT0dSN2ZoMlZ4Y2ZBVytDNm9aNUN2cW0rYlVpZWRNNzRy?=
 =?utf-8?B?bGVsWGhZMXptczN0Sm9RWUVBNXg1ZW5wT3BrSHRGWFR2YzZFMmVnZFFWMVhp?=
 =?utf-8?B?eUtQU2tWcFdzUzhpeDQxdzlac2tuRmR5ZGprTUtOMmxmYnBzb1drLy9wRlpW?=
 =?utf-8?B?VGxOV2lWVTk4eFNJUHMrc0x0akpNdXVCMHMvSVkrRDBKK3RqeldVU1BDM28y?=
 =?utf-8?B?V2I1WFJ6MUVSTWk1UkRnb0dzbWxDaTN4cWlqMHFiMmk4NXZiN3FmbFE5bXdO?=
 =?utf-8?B?ZmJBMy84TTdmdDVXaS9qNFpxREVISmJSNFRRWkRMTnFScFFSb25SYVBvbFVj?=
 =?utf-8?B?dWwyeXdCdTZFbnFOMXoveWIzQUhrVFFCaXp3ZENud1RZem42U2dhQ0cyWVp0?=
 =?utf-8?B?NnAvU29ZR2pCVGl2aUc0aHRmY1ArUmo5U21wdDhGdGdnRFk0QkhGS000Sk9s?=
 =?utf-8?B?Qk0vZm9oK2ZQZW5XNThhNUsyOFBIZXpURTh0bmplTFZNdlhCbGNiaW95bVZN?=
 =?utf-8?B?amlxNnR5VkNwRzRFbXlObWwwaHlPQW9FWUlCbWVBUEpocjU5ZGRseGVBNVJo?=
 =?utf-8?B?dER1TU05RnZISDZNcUhkTGZoNTJnKzFSRGhhRVFLbDhGN2lFQjU5UnU4UFU0?=
 =?utf-8?B?VnVLOGFKb00zVUMzUlVHb3dUWDdSZmN6d2VMNjZKTTI5b29PMWZkVk8xbDhx?=
 =?utf-8?B?eHN5NzNrbkZmUlZ0UXpHV1EwVkZxc05LN1FiL3JQNXk3ZlRLMHAwampNYUZS?=
 =?utf-8?B?T1RDM1JiMUI5WHNNUXpYaFhwT2NCRmxqREg1UVhpZFlVWCtDa3lZVE55d0JN?=
 =?utf-8?B?NnJRWnhRTWlySFdEVkhJdjI0UUZ0VEtia0FLK3V2UlhxS2JtNWl2K0V2T1dN?=
 =?utf-8?B?T2VUWWF1UythdGREMmZPY1kvRWZkVTRPVVhGSDdZQ3ExaitzTk9JNExFaDRq?=
 =?utf-8?B?eC9ReU13QkRPTnhVaG5ic1ZqT3V2MWlkWXZjQ3R0d3lXcklkNXFpWnhLd1gv?=
 =?utf-8?B?TExPclY0bURwYzdxUHBzdzdzUnF2M0V0R055TjdjQUNYN2R3bnIyOE1qekt1?=
 =?utf-8?B?cFhqcFUxSDBMMVZmTWJhcVRiYWtjOVE4alptaXlCakZ6a0xtRUVZcFY5dEN3?=
 =?utf-8?B?T21OenZ0SjlHWGNlMTdSa3ZFbUtoMlhycVhCUWpEU2xnc3NLRGFaSXFoT3VO?=
 =?utf-8?B?SVJHOVlSeElUYkN4bWpUVFRkWlZWNlZJME12M3hISCtrdk9qS2h2S0FDYVJR?=
 =?utf-8?B?SUZmRDNRZUV6dXBPV1lueUxTNnA2UlBCRXlpZlI1MUdEeUpFR1I1Y2ZoNHhu?=
 =?utf-8?B?YU1DUVgvVHgvNFhwUS9qM3IrdXVMN3dkSUZ0V3BqekhPWUdTSm50Z282d3NK?=
 =?utf-8?B?K040OUQ3S3RDTTZmWFFUdEVWeTgxTHRiWTZlZ1lGUWRPZ0F0dlJ3SVZDQkM5?=
 =?utf-8?B?eXFaSnpYSDhrcjBHWnJwSzNlSWc4MXZtT2w5T01iQ3VFUjNJY2JQbEc2VlNV?=
 =?utf-8?B?Q3dwRkZ0QktTNnVKeGVQVGM1RUdSRDdXSk1GaTlzVVh3OW80ZDZQc0loL0Np?=
 =?utf-8?B?UDV4TmVIaE9DeFBhUXk0WENKVTdBdDBXR0U2akthbUhxYlJCZi9xMVJMVjZ3?=
 =?utf-8?B?NXRpa3Y4dVlUakxRbWs2WU1ZR0k2NS9rQ3dmTDdtU1ZxdW4xNzhxeDI2dzBR?=
 =?utf-8?B?Q2wrZmx2M2Nka3NvOGlFb0hzTktNb3R0Unp2RTduWStwb3lpcWd4WkxDS3Rx?=
 =?utf-8?B?dFh0R2NhakZTRHNnRmFUYVNMOURhREd3QWhxM2hzRUlhbG1pVjFxUVZIY0ZF?=
 =?utf-8?Q?8c4rJwRQCypzcvzW7u5YANSOj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395a971c-fefa-43e0-c261-08db6b2a7787
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:50:34.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlRgWrhtQsjNY3FsEYXszUMD4DHXtNATzNqEoIpTrGwVqkvJ8yaN7mvmrplnx11rvG0cC3M53//SEHk0zDm8LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6775

On 12.06.2023 11:34, Roberto Bagnara wrote:
> On 12/06/23 09:33, Jan Beulich wrote:
>> On 09.06.2023 19:45, Stefano Stabellini wrote:
>>> @@ -143,6 +163,12 @@ existing codebase are work-in-progress.
>>>        - Octal constants shall not be used
>>>        -
>>>   
>>> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
>>> +     - Required
>>> +     - A "u" or "U" suffix shall be applied to all integer constants
>>> +       that are represented in an unsigned type
>>> +     -
>>
>> I continue to consider "represented in" problematic here without
>> further qualification.
> 
> We should distinguish two things here.  The headline of Rule 7.2
> is non negotiable: it is simply as it is.

I understand this, and ...

>  As all headlines,
> it is a compromise between conciseness and mnemonic value.
> If what is wanted there is not the headline, then you can add
> "implicitly" before "represented".  Or you may leave the headline
> and add an explanatory note afterwards.

... such a note is what my comment was heading towards.

>>> @@ -314,6 +340,11 @@ existing codebase are work-in-progress.
>>>          used following a subsequent call to the same function
>>>        -
>>>   
>>> +   * - Rule 21.21
>>> +     - Required
>>> +     - The Standard Library function system of <stdlib.h> shall not be used
>>> +     -
>>
>> Still no "inapplicable" note (whichever way it would be worded to also
>> please Roberto)?
> 
> I am not the one to be pleased ;-)
> 
> But really, I don't follow: when you say the rule is inapplicable
> your reasoning is, IIUC, "nobody would even dream using system() in Xen".
> Which is exactly what the rule is asking.  If Xen adopts the rule,
> tooling will make sure system() is not used, and seeing that the rule
> is applied, assessors will be pleased.

My point is that "not using functions of stdlib.h" is ambiguous: It may
mean functions implemented in an external library (which the hypervisor
doesn't use), or it may mean functions of identical name (and purpose).
The full text goes even further and forbids the use of these
identifiers (plural; see next paragraph), so it's clearly not only
about an external library, and we also can't put it off as inapplicable.
(I wouldn't be surprised if we had a local variable or label named
"exit" or "abort".)

Btw - I can't find a rule 21.21 in my two (slightly different) copies
of the doc, nor one with this headline and a different number. What I
have is "21.8 The Standard Library functions abort, exit and system of
<stdlib.h> shall not be used". (I further wonder why neither of the two
docs allows me to copy-and-paste a line out of it.)

Jan

