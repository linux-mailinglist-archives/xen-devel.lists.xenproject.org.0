Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE36D0455
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516685.801215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phr3U-0003Q5-NP; Thu, 30 Mar 2023 12:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516685.801215; Thu, 30 Mar 2023 12:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phr3U-0003Na-Jv; Thu, 30 Mar 2023 12:07:00 +0000
Received: by outflank-mailman (input) for mailman id 516685;
 Thu, 30 Mar 2023 12:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phr3S-0003NU-TJ
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:06:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dcd4591-cef3-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 14:06:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 12:06:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 12:06:54 +0000
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
X-Inumbo-ID: 5dcd4591-cef3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIxKAOfWin6DAf8Qq0pP7zyI82pZbQAQB4m/NfLFqxRxoY1Zc7EliMg9vK716WM8pp3bmODuiHU1D6ny7tHqj8F9nrw2yLY7XJOI1Kq7SCnYrGoc/C8pqyzXLMHnURxHbBaD3NJfE7f4y5ZCDHBMzskSACmOOlYj1eFNbQZkY/wwY+PnYi23MGyiU0SlqKxVJypN4Q5j+IlHaWisisvNTg27+NGiEVoqGD/ieF/u6lL+xjXKgnoIJ8vtrXgJMQ594Nh9cKSkg9N4eTrXFKSnKJW8pAXLFAX+rDvkLetE0dVSWzA/aC+swPHz2RpqT/pHieDEX092+oQAKAeBnKF3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F2yNd1m93iz4OwNbeQZ9bzI/XC3/pXi6YNmHT3v4jc=;
 b=CoEK0ioQlnTxPRm0pk55Y0EVw/zuyoL9HAVGDF6QEKXjjcY4wak2UotD3/vIZAdTyB8ogd3Dj4DdvVW1WpuWTCvQ1y2shkY6Bp7gvCWUosnMiKgf9Wpv/p26Gxi5bzuVDaveNEcajVdMbndOK1DXdSZoeFKfUjs8Wic59I1qV6Psm6mHwCFON4Ci5ryhZtriGkCehHS8OEZkthda6z3qsUcJbybK3C56rS3PoR9CXxgelaEs5QZlXseHZzrAmNRZnvs+DTtEBX8EDSomilbnT+iPtPGsQjhXq1+cOkZWkc3q97N2tD7gx2fGsUXz38s3XNAwsd2xvNXv/AQFTC6ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F2yNd1m93iz4OwNbeQZ9bzI/XC3/pXi6YNmHT3v4jc=;
 b=pHfIg2enjdYFw8uGiejycyZNmRh6B+ftSwUVGdBKuDNAJfxWcEkv07bNy2FKuP77B9f4lB+F//m7W11MbpTSX9nw8fGoM39U5aXmVYVG/P/C8oXeHKSnm4mCdwY4CyRAFENJyQAjkFnXhvPRcT8ipAgzapgnGhCAv4cRj6Ow0s5whKisGjLaTW0jAhr15Ftitzh2JQ2XpTOmlhuW5VJfRPON1znLNQyMAEnwKJvfl8bR3hkuBY4huQl1BbeUXbXeP7raueikzu/DAgJVEo0GN8GEZoVRfs8jEFtHNngjSPRC5JiaQ3C7M3COMjb1Vzf0V0NPxWHTixw34bjFjxOC8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cc9be8c-5628-1d19-077b-a70472c9095d@suse.com>
Date: Thu, 30 Mar 2023 14:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 9/9] RFC: Everything else
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-10-andrew.cooper3@citrix.com>
 <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
 <8b368b4d-8a10-eb82-f7cb-d20e406ed285@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8b368b4d-8a10-eb82-f7cb-d20e406ed285@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 997a9301-2745-4c0c-94f4-08db311740de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aq7Av6piGiuUPuy2++ypdBOT5QeAPyI8RV+L5X1fOgDzOPaYmEio0kaB63b7utOzi3SufxkAxPI6nWyBbqWvRhg0RcL4Ydd4ixHUZgzepSDNYOkkCHxUJ8qYC3DVi7DhnECEaqPtJi5VERDuXhXrPCUpLwvXTuPsOOwXOFIYK0nqbBDk8ps/2m/nU1EFHmtFx1m3zybJ/aISoQ/eoGVWWwJ1d0k4xj/2SYMV1IkTtwOvWFOwDN58UX+vTPLKib7xoF/u+sWCkQW7sXVN06TrmFJh75CB1kx5UbCSW2dk4bQBk02TPzqZpPiUegDqnsOibcaDvztGwTTmJKprpPwMkl54OqLi0yQ5mozfpwlVZmkgMLvdSIDq0uwHSUEGbLQraNOVaz5ggWbzpj3fVI9eqcW1CnS5mqEAJQ+1l95VIVclG1xNONjjUJCflE9DC3//CYnBkewAQD8xVc8D8tV0oGu51YWQHgjlwOcUzWnh9SEtz+FpDBZPnPI8Sj9eHSYRcNSEK1QPTtBHkUT9iPJCfAnC4t3Jf1p2md0Su5GsuP6frDrbKUNu7Tyx7W31R6HdSbcq9Yk+Bgr1X0tYZJkCNuwnG1PT0vF2MqHRHuL18EdZr8x50lg0crDYI+6M+DuG3bBc7D9nwgTczv95ByhyYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(36756003)(31696002)(86362001)(2906002)(31686004)(2616005)(478600001)(6486002)(186003)(53546011)(6512007)(83380400001)(6916009)(66556008)(6506007)(4326008)(26005)(66476007)(66946007)(8676002)(54906003)(41300700001)(8936002)(316002)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGNUN1BQRW5xTy82RUppZDAwbnBsVEdtQmVsRWVONUY5a3BEdm1iVXNpd3hU?=
 =?utf-8?B?M3JJbmFYTjNxa3lBeGxsbUdwdlhmSEJmTWpWRGQ0cWxEN09QTkdrRTFaTUdZ?=
 =?utf-8?B?V0xSMDdRUk1uWU9lVTQvd05FVm5obUIwZzJpY2dWVzUxWmo3VkdiMksvUG5U?=
 =?utf-8?B?cGtuS09WdFJlTVZ4a1JQdmhuUXNrNVZwM2ZjNHZNYk5IQTZ4TVh6MC9kSTEx?=
 =?utf-8?B?WmcrOEhEam4wSC90bzZ5STJCdzl2Mm9LZVBvZnJRVm9zQU5WYk45dUhOb1dz?=
 =?utf-8?B?UXFpQ21zb0c3NlRGR0lOQmhaL0JEWm1qL3JOZDlPLzRPZGFYZnNYckVlNmQw?=
 =?utf-8?B?U2RNUWttTzhlVkl2MUR0bHVuZjZNS1RTUytoRm1KTWl0UjZOMEZiNE1VSHpJ?=
 =?utf-8?B?R2UzVnh2MDNGSWZNQVpLaFAyK2lWbTU3VEtaRVdqSVloOWZVNk9kcllPWEhs?=
 =?utf-8?B?N3dtZFRqSXFybTBIYmtOWG9xOG15d3dKSUgxYkVHVzhPanpwSHN4YUJpdjlu?=
 =?utf-8?B?UVR2QmE0eitHSmd2MWV0U3hkK3ZTYXdnK0NDaUZUZkhObHhLZmhnMXh1SkVQ?=
 =?utf-8?B?V3VPTlVzQWRMTWp1aURYSjBSVnRid0M4OHJ3NERUZlE2QStBd3djS2NCQkxt?=
 =?utf-8?B?YjVMZTNQQythT0xGcy8zY2QwOXZIVmFqYk51em8zWkI3VlVqRjRncmRZZlBo?=
 =?utf-8?B?aHViei9sZlM1WUZTVWhuVERRQnBzMG5wTXUxV0RwMkszSnRXMmd5UjZyN21u?=
 =?utf-8?B?OXU3MDJRamg2Zlh2YXRyRnpIbC8xaWJtSnFFcWFHNU9KVW84aEloWEFEQzZq?=
 =?utf-8?B?YkJGeDV4VldKY1FhRWhjdWtkT3ZZMSs0eFNsVnh1Rk1FUjJIZ2VacHdWODVN?=
 =?utf-8?B?aTgwOGQ1a25lUjNzREhYNTlVTFpSNHA5M21yNUloTjRVRXIyOVo2eG40d2xn?=
 =?utf-8?B?ZU5EODVSdXR4QzNhNXZhalFLcUh4QXczUDNlMTlEWElJT05FWjNVVVRkQnpu?=
 =?utf-8?B?Nm9ITzRSdXRKVURzaXhaMllTZjJvb1FDRVZzM1MwSHlJRkFuQjkvTURTb2tR?=
 =?utf-8?B?VVpwR0QwNEY0VnF3M0p1bE0yeG00RmREQjRNWG40bHBOK1kraFZrV09LTVYx?=
 =?utf-8?B?RzRCZ3UzU1pqeVJUMHFNblZ2Y0h4alNWMGFLSnlhaFd0emVRMkYwd3p0SENO?=
 =?utf-8?B?OTZqbThsVk9EVDNGcWVhT2JQNG5HMWZtVXJXMk9zRlU3TWVWanVGZW9uaUpK?=
 =?utf-8?B?K3FtZUpIY1U2UEJ1L1VFWnMzcncwSXFmSTduUi9BRm1lRzRuNHFxM1hyVjZP?=
 =?utf-8?B?dWJRSnF6THZtd1JTL002RWd1RW1hQ3RBcDY0ZTIxVUtoUTFjRXZCQ3RUeXRo?=
 =?utf-8?B?ZGxxTldwa1gvVitCRER5ejBJMEdKdDFiQUlzY0RSdDEvNnVka0o1bmh0Z3Js?=
 =?utf-8?B?SXNZMU9DZDNtWlRuczFCU25jK3BYN1I5OWwzUlkxNjU5dmRXNzFIZEdqb2hZ?=
 =?utf-8?B?Vk1zY0x3aURKM2ZuUW0vVDZKZlptZVVaWkU5OFZDSDA0NEtnTENIUTB2SVhl?=
 =?utf-8?B?QUhUZ29xR3hvVEh6TzV6K0pZNERXMW5qZmVnbllwWmVLSjYzSXJFOVNCY281?=
 =?utf-8?B?dnVCTTRtN3VHVU85UEJ6Um5ZWllHZSsxWkhRWnhNc3A1dGk5VmJqWVJweHVG?=
 =?utf-8?B?YXpsTUtpeThQWEJJcGFYbTdNM010dTlBNFZyYXVZc0RUNGZVODV4TXFUWjBz?=
 =?utf-8?B?bDR1bk5ELzZGS1NLNjBsNU1qbXg1Y0J2TnhRalhOUUk1bXo4MmhxQmhNbXNi?=
 =?utf-8?B?NHJWVnhEWDRsckR3U2pnSndpeVJMckt4VDdPMkQ3U2p5K3RzZjFYYThSbGxo?=
 =?utf-8?B?ZllXOXc3YnhFRkQwa0xrM1l2VDBSeW5IRjBvMkxYNlA3WWNhZm4xdmpOaSs2?=
 =?utf-8?B?UER5NVUwWkRPWTlqUGIxWHRWZ00vbENJQ1Fvc2dQaTdQZWhHQnRIdHFXZmFC?=
 =?utf-8?B?OW5abW84bjhVNGhRRWZ1MEE2ZE5MdUZmVldxTUVkNVJuVVVpSHQxbGlxWVNP?=
 =?utf-8?B?NEdlWEFjMUNOM3VYak5ZZzVvYlFuV1NPR1pXT1VRN1dJRjJjZ1hkcklGUkpD?=
 =?utf-8?Q?JVwXqY92nAM2rFPHqsW/KDft4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997a9301-2745-4c0c-94f4-08db311740de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:06:54.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxpGNb7aP6CIQxUCjYpyH+aL3cbhc1hpchyQY5bhZuotbWBt2hyGxOURqHL/1gWXAOPV9d7AcFM/BkBl84s3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On 30.03.2023 14:01, Andrew Cooper wrote:
> On 30/03/2023 11:16 am, Jan Beulich wrote:
>> On 29.03.2023 22:51, Andrew Cooper wrote:
>>> Looking at this diff, I'm wondering whether keeping
>>>
>>>     union {
>>>         struct cpu_policy *cpuid;
>>>         struct cpu_policy *cpu_policy;
>>>     };
>>>
>>> permentantly might be a good idea, because d->arch.cpuid->$X reads rather
>>> better than d->arch.cpu_policy->$X
>>>
>>> Thoughts?
>> I'm not overly fussed, but perhaps yes.
> 
> If we were to do this, we ought to keep d->arch.msr too for the same reason.

I'm not sure this is necessarily a consequence.

> (Honestly - I'm still undecided on whether this is a good idea or not...)
> 
>>  Nevertheless e.g. ...
>>
>>> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>>> @@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>>>      struct x86_emulate_ctxt ctxt = {
>>>          .data = &state,
>>>          .regs = &input.regs,
>>> -        .cpuid = &cp,
>>> +        .cpu_policy = &cp,
>> ... this and ...
>>
>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>> @@ -909,7 +909,7 @@ int main(int argc, char **argv)
>>>  
>>>      ctxt.regs = &regs;
>>>      ctxt.force_writeback = 0;
>>> -    ctxt.cpuid     = &cp;
>>> +    ctxt.cpu_policy = &cp;
>> ... this imo want keeping as you have it here.
> 
> Ok, so that's a firm "switch to using cpu_policy for emul_ctxt" then.
> 
> Which is fine - in fact it's one I'd already started splitting out of
> this patch.

Hmm, wait - CPUID "basic" and "feat" and alike uses I still would prefer
to see using "cpuid". It's really only such initializers which (imo
even logically) want to use the name with the wider coverage.

Jan

