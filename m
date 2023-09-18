Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08F7A49DA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604022.941221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDWe-0000Q1-EY; Mon, 18 Sep 2023 12:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604022.941221; Mon, 18 Sep 2023 12:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDWe-0000Nu-BD; Mon, 18 Sep 2023 12:38:52 +0000
Received: by outflank-mailman (input) for mailman id 604022;
 Mon, 18 Sep 2023 12:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiDWc-0000No-Us
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:38:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50a4c759-5620-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 14:38:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 12:38:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 12:38:46 +0000
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
X-Inumbo-ID: 50a4c759-5620-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvxW7icilHHmHVcekEnT512IX0PMZdwBSA8aFzZigUaxFdOqC1br+BC/NGFC/coajf3qyhqgUBZx2TCGLyLok7cVSzsxhc+dAJcMKKI8Q9WJE3O9rnZv8YB+szGpl7vsdFqaM+IHLQwpI6QcROEX29jzQ98dQgvf2p29jY6YynkjikMQf4v9WBmLqtcKQM0uLeDneO5nwFWAGQ/nE1R7sSQw5jEMevZ1CcyCNQqhMJFCY2utFM2CEIlDYtf7h6Nk9r45g5pBFyFpJix4saWmxV9WrtvKRXJgGABuLqo3V+e5FjU+vzghbhJi3G0eldaFM9VfE8Q7f2XDbK9YcIx6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yATWy4TPIq9TWYW9FN9Q0A8g7qVkB9cUrYYQDbKnxcA=;
 b=b7aVc7wwQ29vatUDxEWy8IXiAv2JOvldlsScaToNSBkMHANYC7cr9hOoZu20MHeONGTg4tErdaqJY8e+c6wP48p1dn/VJX0RXnj2nPOdO/I/wbfTDxlZW8BQ4GtHWhGt1NAolMOuY+rxtytEe6IlTDk5TlKiPvqDH1IdXnFG2DbCtAsXxd2eP1K5gX57uu6RMr/ol5TWadmP3VNhiYSHxhm7572ztcEwoSSw+MvCY799ZDQ553UdtJqVYGdEuyQ8GbILsp0rtoI8x3BP7tzyNTHlAywp9S3XrsAEU0MBiCTuXCMrmtii4xGNW6gmldG3PlVLNXZTeKlsud8mXfNAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yATWy4TPIq9TWYW9FN9Q0A8g7qVkB9cUrYYQDbKnxcA=;
 b=N7VV2ekaVcXlGlGOwedOq15cNdZz9Tf8RXh1styqjqIldZP3OUWwDYpY4fwFkM8cCZR5EFVI7W0IkLKdKKIt0x9hfOudiudRDpB8zCreJJCSaXDSX6YITz85BOT3SOZoel0FkznzYVxrgdrMWIk6jUwyOU73Eem7OrR1PBfq8yKXPK/c3TDVzlwHq88xx3hPd1EKgpxvs+sG8tzwKR636kdjhZ96pXTdMr4RD57Fb4DsMkKh0duNOeeMYnMZJoZUiJKSTb2+2kD1J2jqFrglufmFGNBv0UiBrZ2FtRb+QwbsUJ4TGFjZ8kQvB7MXKI9L5iFHIvxy8dDHJjpWPG4aCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d59acfd-26d0-bb9b-568e-d273252d1f2c@suse.com>
Date: Mon, 18 Sep 2023 14:38:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
 <09d0449004162ccd339e9e8559b7efad3e2335bb.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09d0449004162ccd339e9e8559b7efad3e2335bb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 059c80b1-a677-49ff-8c6e-08dbb8443362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SRU5XBl+zNL7ohm7HxhXKyxburH0dulgFLXY738EtCvfIgQ/i7gE6eQCvDxfBn4HiVABfOCZiFZRNjzqpSakaTkq7wJ9zpEacnuVq4yEP5tfofgHPduMs+qV8K4p+2k1K81BTo7FRDnJd6uZDXl7c9Xz+AcyqzDKcx2hhxyLlTVNIH5KLweov78zRM1qn/1Rn74+ZXLvv5kgYz7z56G3y2uTwiE8TQ0Dhbehhxi+Aoh6RlCRnBj9w6gakWsW7xWTOMCdPIi6vMR4nAGCeZnqcULIzst12UjUXZubVZf3uB3U/H5l+wOpCE0eFuBfV0ODijLIzNBSkx2ckQbDTUeLfJKX4Hzt7YK/uGhOjUpJMG66QeygsG5iCTUVA7PQF2WMvka8+x0g40Q+fbEc2k8A4XO1a8F24DvPYFts4gi2fBOXEcF61oo0yA0hMbPFwmdOaGd6i+du+ABuVm5hVrcDhqiN59igxKVTKQ8knrNF+iAbyrcWVluV/8W0vf5iqMeXKKkIW97z9c+ho7b5+WbkvOEu+IQGmvdwbNaNLG21z/B1w0ZZHdCtKzJ/B+1OSl2qm9Tkim5vHEnd9o3zkNCAbL2Th/CcFyCe7YbQPuRw8tEEttuMgS5HFyDtGzeSNzFoihbn/dO2RXD1HFLqHqX5oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(83380400001)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(66556008)(66946007)(6916009)(66476007)(54906003)(7416002)(41300700001)(316002)(2906002)(5660300002)(8676002)(4326008)(8936002)(31686004)(966005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmt3STU4VzhHZ1BtekNyRXdjaHpZcEVXN3hWYWNLd0c3TEFqY3pvMEQyRkhZ?=
 =?utf-8?B?UG1tVmJPMlFrM3FiMmpld21OdzdqRXdtU2NJOUhIbVJpUUVaVUZNeG1MTXpB?=
 =?utf-8?B?MUZjY2NUMi9GbzlncFFTOFI1RDh1OG9JbmE3Ukl1Tnh0TzlDdk9zU1doUmll?=
 =?utf-8?B?ejIzM3I3TXB4Z3pOQzg5MFVOQW00Z0x0MVFjZHY5T01zcnZJR3E4RGliR1hx?=
 =?utf-8?B?SHR0eXRDdWM4MldsQ2FncVhtMUhxczgvZVdER0FodHNDTHhqQXl1cEkvWjRH?=
 =?utf-8?B?SUFXYjJ5NVZzZVM1UWd6Ky80R1JoQUdlNVBjYkNzS2NqNnZGcGJ2Z3g4SXJw?=
 =?utf-8?B?SitUcGNLRXpmOHpMSEhTaGdRWmVQeFRjdnJzM0RldEVEaWpBSHdWdiszVExq?=
 =?utf-8?B?RzAwREFsZTFUZ1lLWnorVWZ2YWQ4amxTS2l5VHU1OUJnOWNKaURXMk1hTTFW?=
 =?utf-8?B?K0FDL3RTNU5uZzA2UUpsVXdhcmtkRFVoRHRiNGI2a3MvMjc2TDZJTU55MWdS?=
 =?utf-8?B?U3QrSVRzMjVYVUNOdW0yUHROb2dleEVLODRrcHFseGNUQ3JIU0tGS1M2UnVC?=
 =?utf-8?B?OWdsZVNKWFVvaWJPUUtJUHlLbE1IeEY3VE92YUkxcVNjQzFETWhUOW84VVlN?=
 =?utf-8?B?R0JMait1VzY1a1RHOW4xZDZmY0dTRmVKVnZCZkVYWTZxbnhCM2EwS2N4N1Yw?=
 =?utf-8?B?azd6K2g0S1ZFSG9EaENNa2Q1T05TNjZQQmFhSGVCejNKa3c3Vm5KUnZnYWNI?=
 =?utf-8?B?b1RseGhtTEtyRysxUVEyeEliUWRVQXR5dGQ3UzhVR1lmRktDL1gyenpkaEVU?=
 =?utf-8?B?QUZ1S1BveTlOZ25JanZNU0VOVXUwdlh5YXlCUWx0S21aZnQraWtWSEpheXd4?=
 =?utf-8?B?dWQ3TGR5RC81Y3A2eVV5NUVoVWt0cStzY1VydEdiL3RtR0tQZThidUdBZ3I2?=
 =?utf-8?B?dWhTNldrc21mSm90OFg5eE4wS3pMc01jWEE0UmpubWdTeDJneFBXUHBpRzIy?=
 =?utf-8?B?VGtxNy9GeVpjZlZvbU1ySGZNS3MxSWpJTGN6SkwyelRtL3lrRkVocHlRSWJT?=
 =?utf-8?B?a3ZiZUFyWEpkWXJVbXJsckUza0dsc1RTUmZESm5oWkNtS2xQeEVrbitnTmRh?=
 =?utf-8?B?WjRZalpQYlI3MGdPNm8rMW10a2lMRlRBZmNsTFZJT1dzZWZQQlZGNkswT0xI?=
 =?utf-8?B?WmoyaDlzbzBzdy9ydGs0NXlSc1VNM3RDcDQrZnFVMEVOekZpeVVmOW1mbGV6?=
 =?utf-8?B?b1gvTXJxMEltc3RhMTNuUUE0QVpqa3hKM1dnbnZKMStPVk9JVGROcXVUUzZM?=
 =?utf-8?B?WVJTNGwrMVRPNldUQS9hd0N6SU1Od3FFMzdpenBZWER6YTNtaXE5NWhkeFI3?=
 =?utf-8?B?YmtlSXZ6enhiRXE2aDdSZXh4Yi9qVkwxUW13UXpHMWFMM3dMbEQvaWVab05k?=
 =?utf-8?B?VTl2UEYvYXJFaDJNT3dvZ1BZTkNRRExrQm5DNTdJTVJvWk8xWWZqU0Y0eXk4?=
 =?utf-8?B?RVVpcXBFRUt6dkZBSmtzMXpHQzhNYjNZQnVmV1B5NzZDRnE4R0M1K1JvMHBn?=
 =?utf-8?B?ZFgvaTZ4d1g5YkpSaTJ6bkFsTklTQzI1VzMvbDRIL1k5eTcyYUNuQmNDNjdX?=
 =?utf-8?B?QTdES3J4M1l1TnEyaGVCWWdHU0JwMjNoV1F5VEovZ2hxSlJjK04vQUlncGdO?=
 =?utf-8?B?NXMvL1BwWTMrbVZ1UFdQaVp1TExCWTV6aTZNN1p6UkRLWG1pOHgxR3VyemZo?=
 =?utf-8?B?L0dvWEpJNTBSaW00TnhOWGZkdEdndVVYUmhoY1MrcUpBK1BtUTc5c2M0QTRm?=
 =?utf-8?B?cmJ5ajZLUDBYb0RpZktDOXJsZVVOMU1jNzZFOW1iRXc4QTIwTXdEbjJZM3FM?=
 =?utf-8?B?c2RwWWhxcndJZFpRU3E1TEt3MmVySld2bzJFL0lVclhzRE9vTmtiNkx5NnpF?=
 =?utf-8?B?c0RuUHUwWDBwWldodFBLSmkxUC9ia1IyMkgxaGZQa1ErSHlkUHZPdXppMThD?=
 =?utf-8?B?RmowaU5ZeUcwSHArZ3lNQVhLaDVpWkV5ZW93eGE3aGZsTXl4dk5oZ3dtWkdw?=
 =?utf-8?B?b2xqWjc3OXYzR0VhZ2c0TEh2UXd1Y253OERwTTJrY1lvLzQwclVrTTBGcXV3?=
 =?utf-8?Q?fg5eO5iZOsWTvZ5SrceHnQOAG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059c80b1-a677-49ff-8c6e-08dbb8443362
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 12:38:46.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iivqsGNx/BB8YMhdb6oJc+bGVSXAMEmqV66dO9iB3xBeZGDjGqsuolB0RzVxsqjJCao80nTO30niVuwNTDZVFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 18.09.2023 14:05, Oleksii wrote:
> On Mon, 2023-09-18 at 11:29 +0200, Jan Beulich wrote:
>> On 18.09.2023 10:51, Oleksii wrote:
>>> On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
>>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>>> Based on two patch series [1] and [2], the idea of which is to
>>>>> provide minimal
>>>>> amount of things for a complete Xen build, a large amount of
>>>>> headers are the same
>>>>> or almost the same, so it makes sense to move them to asm-
>>>>> generic.
>>>>>
>>>>> Also, providing such stub headers should help future
>>>>> architectures
>>>>> to add
>>>>> a full Xen build.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
>>>>> [2]
>>>>> https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
>>>>>
>>>>> Oleksii Kurochko (29):
>>>>>   xen/asm-generic: introduce stub header spinlock.h
>>>>
>>>> At the example of this, personally I think this goes too far.
>>>> Headers
>>>> in
>>>> asm-generic should be for the case where an arch elects to not
>>>> implement
>>>> certain functionality. Clearly spinlocks are required uniformly.
>>> It makes sense. Then I will back to the option [2] where I
>>> introduced
>>> all this headers as part of RISC-V architecture. 
>>
>> You did see though that in a reply to my own mail I said I take back
>> the
>> comment, at least as far as this header (and perhaps several others)
>> are
>> concerned.
>>
> I missed that comment on the patch about spinlock.
> 
> Well, then, I don't fully understand the criteria.
> 
> What about empty headers or temporary empty headers?
> 
> For example, asm/xenoprof.h is empty for all arches except x86, so it
> is a good candidate for asm-generic.

That's an example where I think it is wrong (or at least unnecessary) for
the xen/ header to include the asm/ one irrespective of the controlling
CONFIG_* setting. From what I can tell common code would build fine with
the #include moved; x86 code may require an adjustment or two. IOW this
is a case where I think preferably presence of an arch header was
required only when XENOPROF can actually be yet to y in Kconfig.

> But asm/grant_table.h is empty for PPC and RISC-V for now but won't be
> empty in the future. Does it make sense to put them to asm-generic? The
> only benefit I see is that in future architecture if they follow the
> same way of adding support for the arch to Xen, they will face the same
> issue: building full Xen requires this empty header.

Here I can see different ways of looking at it. Personally I'd prefer
stub headers to be used only if, for the foreseeable future, they are
intended to remain in use. grant_table.h pretty clearly doesn't fall in
this category. (You may want to peek at what's being done on the PPC
side. Nevertheless some of what's done there could likely benefit from
what you're doing here.)

> So, should I wait for some time on other patches of the patch series?

Well, afaic I'd prefer if I got a chance to look over at least some more
of the patches in this series. But you're of course free to submit a v2
at any time.

Jan

