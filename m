Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492456C0B8E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 08:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511740.790937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peADI-0003iY-FO; Mon, 20 Mar 2023 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511740.790937; Mon, 20 Mar 2023 07:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peADI-0003fD-CO; Mon, 20 Mar 2023 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 511740;
 Mon, 20 Mar 2023 07:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peADG-0003f5-S7
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 07:45:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0ff483-c6f3-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 08:45:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8985.eurprd04.prod.outlook.com (2603:10a6:20b:408::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 07:45:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 07:45:41 +0000
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
X-Inumbo-ID: 3a0ff483-c6f3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSz/PFn3BGMjTkXDrLHqJ8wmdB6KxsQ+VW8XFnVOOmiTreFSL4tQW9YR2vZ1GmJr64Ijxk01vsnmbHJMRi6f5Rw/mwPgmQHcH0Pxb2ugY7fXXQ6n1wIMLtpPgsCndycAMnuNNwxUltFLlkkcl9fgzlX2N6pazdHNYC/5StgK29L0voZciqr5I7mqGEPfrdU+7/bOA/Gp7ATKg1R0vdZTsqs3VSihnrkpJ2RWN7zmKgTcdbN7EnJ9NxCRqYHWRYyb8CXUh6SDwsK3FFfBk1Q1YwxH+ZGChkiYf8z3sIE6GXoWq1QFnmU3YLUmrsWsQga5/4cR9fHdGIKZ3MW1paFTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXJIjDbR5xUJjs00RqVQVcWmI5CGmxY/bzTrxSuk4OU=;
 b=I0UNO4ql84pmXTPiERs413Uyjd4jHfbjOAlGT2g7cU/CWg+kxztHWhTf1Q/P4xApXok9hqINCIwFGjaRPkeQfpT/LBFwG0ui2PeT06Lxwnk0B6K7xZx9FF7wbV60KRRKtkN6ppqYpZFgTDcLM0UJ3lJ7vYYB4njQtam2v6Rj48Bt7NXrcoAdo1HVwPazVffGMMJg+26hNerfRBi1DsvRg0uSkBZWHleje0WjMRCpd5iRjHNZk5BvbQ6tc4nBv+B15NdQC3ry9yoM/Xq4TTlGFHWKKpWzwwAepWmZnjW/JQ3b0NvCOxGxVSDS5YPhkVMdhAj9xA71bQ9acxwXCaEtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXJIjDbR5xUJjs00RqVQVcWmI5CGmxY/bzTrxSuk4OU=;
 b=OCsTHQGHugxMKoo6UQh0ExzU8nAVcO7gl7cgiPoOF6V4Tg2o3FeqbwtpNp5s+LNikL+HKofiNABMk+0+dpyrClssT/dObfd3PBxfnjrRwKI/OjcZFZ0K3b2SZXBPv5ismYfSD6wxzLIHAYD7MAbSf+ZbqT9o3ujTXjKxLOPjiiHr4rCUI2XbJwX2nD/bB5PERjkOg6EzmRGZb8h4wc2JEOyTkBYeqo38PagHxibRAWejldauMCaYNsfPqFQON9xDem5yBBe1BoDpbmEC0fAC1heAsRUXryG/8xWmnETYZi3NzEbZIFFAbmt+MCKhXeYINudJemMxRuFpLi1HxMkmqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9419f4a5-845d-4761-bd35-ad0de306a561@suse.com>
Date: Mon, 20 Mar 2023 08:45:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
 <ZBR5T57tSqs2o/Sl@Air-de-Roger>
 <a77ec0d5-0f97-409d-e954-0f28c30cf28b@suse.com>
 <ZBSQnFpf89uEwXif@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBSQnFpf89uEwXif@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: e68c7492-238c-4d79-7e9e-08db29171ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwxbPoLyrZ/7cJcAkBBs5IfbDrIwStClmfy2Yr58qo/8cFyJusVMVbtRdNYyZ9kDb3TRBTCAURfKwXOa7O4M/miLtwAarj7j9OraA66njtjwgqQO63LRjGGBzAITeZRCJ4asmgMUznwHTkUpt50dbK9CMZSnei6/9OLKvEx47ULkl2IDCKXB7Tj980C+tpFBek29IT/NTFXQT6vzM7FYKN/szcalSmfDhIUYPGWyqvKJm+deGJCYRckJYIMupr2TuEnJUaA3vNpAwJxjojIvCkl/OIkpFfWrfZfWs84DgKdHYaYxJ6Czl/DPpnLg41PYTaATB2p8IVY6IF5I8GPhRzczOxBhiiVW3MsiwtbF1xqaFqeqVQImiaQysyScd4/LDCcyUxkBYyS2/Zra6RRdznk6+gkGxAF3eXtj5X4m7DVPnc6oOSOwh+CjY84LHhLdjC5hzEzHxTJF1liKuTBPvUMfNUisHmzRfW8K5AmC4u8pMPEY6ThYQBqTftUSQ+rsEyJFMRRAEdwggR4vMeYoF4HCAKXKXhRjDai11zYu6LA+wlzU3GK271DUKYBwCulJc9+2vMMLvOFt87tjXhzTfcpspI6NG+El/dgCxW1DFuUHoCpea9UuWJrE0njvDfhqI5vpD5PnNryveH7+wZ2siYOxxLi7zJuPMExPDuRP8c67DO1V4vqgOAmM5EuNXBiBloaE5p0K43Mn7zDmBWBBa4t8fGzPekMkQliFS/R+0KI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199018)(186003)(478600001)(26005)(6486002)(83380400001)(6506007)(54906003)(6512007)(31686004)(53546011)(2616005)(316002)(66899018)(66556008)(66476007)(8676002)(66946007)(6916009)(4326008)(8936002)(41300700001)(5660300002)(38100700002)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUZsa0lZTVM5Nm5tSGNQTE85RXFyMWx4WVE0eHluNkxCdmt6REp6SWJwUFJw?=
 =?utf-8?B?MlNBdFJaK2IyU1NQS2FkQjRoV2N2Q2NKdHBwSU5yb1hzWkxaTWQ5VEJ4aUZV?=
 =?utf-8?B?Z2Nxc21PTXRXTjNhamhnVTcraHlZbldDb2hGc3dDTzV5elpLRStPYTlvZVNB?=
 =?utf-8?B?a3Axb2xUcSs0THVkaVpjNVpqS29Semx4dlJDNjExQnNrZWNqZm5yeVNhclhZ?=
 =?utf-8?B?OFZOQ0lFYk1mZFBIL1M2dkMvc1JFVDJaNkZtc0hrczZ1M3ZRZUFHOTBGalBQ?=
 =?utf-8?B?SnN6UWZzNHhmWjhqdHZ6RmlFQWhMYUsrOEx2bG56N3lkb1VXWE1VcmZDMHE5?=
 =?utf-8?B?SGlzOHBqQTNDcjVkZDlDVVdUVktqcmJtd1VLbDZERnIxWTRjUUNUV0t2bUJJ?=
 =?utf-8?B?UE9HU21HVzZiVjhUVUlEWmlEdmR2L01Sem5keW03VFVpaUwrazNhbHlSRUYr?=
 =?utf-8?B?Umg5WFJHeHpiMkVoQ0RDZElyK1ZxQ3lEbjBuZzUxdkV6bCs2VkxUOGRvdXBP?=
 =?utf-8?B?MVA3ckVaY0hQZ09IcFdQVXU0UmV2TzZ4NDRmcWFDQ0QxY1RXdXFJVUpFUlhN?=
 =?utf-8?B?NW9ZMkkvNzBJYUxaSDVJeDFEN1pMYWQrc1RUR0dwQmlKbVBNK0szVlB3WWVY?=
 =?utf-8?B?T1pWSTN6TFhqcnp6eG9YTUpPL0JMWENrUHhFOHpqRXpoSS9EaU1ESWZDTmg5?=
 =?utf-8?B?cjloWFlCTmN3dFExQVR4NzMwWWs0MEZtR0tFSU5yaVFWbk5tYjNVTGc0RjNm?=
 =?utf-8?B?dmIwUGZVRnRLRGRQTm94ZTB5SHk4Y0psVjZKVk85aGRkS1F4bHZha2tKSjh3?=
 =?utf-8?B?aVBsNGczTWltZzNJeitKWHBIQ0JsVENlclNSUndJY2dBVzdxS1BEd0Z0bTZt?=
 =?utf-8?B?LzMzVGpNL0F2SE8yR1V2UEtDc0JzVHhqZzhIUWhzTjgweWVNelI4eWJRbkFQ?=
 =?utf-8?B?QU9YUnBNbnFBRy9UamQzY1RmTG9GTmZtbGxiS2VLdFYwdVJOdm5GK1duR2Vh?=
 =?utf-8?B?T1VPdExjRGNrekN4RlJIUk1jVXBUb3ZHTEk1aHZVdUxNRXc3M0lWM0xXQm54?=
 =?utf-8?B?eWl1Wm1ZRVBRTVhUaS81VmNJWTdqVjkvMnBmNmdnN0JENEZkbmJnSVM2MlA5?=
 =?utf-8?B?TFRwOEdiOW5YbnBEWWdaSERRS2UzUTBNanNlTzFmZkRJN3hpaVFVRVZrdWs2?=
 =?utf-8?B?N0JXbzNuaUhGamcycU5yejZad2ZKcnlwRHJNalR5NkFEMXY4WVgvYW8zWkJU?=
 =?utf-8?B?bndVMVZjTjMraWszcjhVeUZQdkM2VEVOajJYejgzNmFiVGUyeEM1a3Z2d3Mw?=
 =?utf-8?B?Q21mRXA3WW5vYUVEV1Bzc2YrQ3g2K3ozU05qaldaZFdHajNzemphYjJtNlNp?=
 =?utf-8?B?RVl0RnlVNXFEWFhFQVhJd3pjOUJUQkpYRXRmbTR2LzhoVHBVM3djYms0eGNn?=
 =?utf-8?B?THJvWkpoRmcyWjNvOG9MVjk0ZEpDNG5sNG1HMzEwYnlZYU1hZURVOUhVOTg3?=
 =?utf-8?B?S3BJOXZFZGhXOFNGQy83Z2hJUEo5dmxlWHhUZzliRWhTeTdudWdKMjF3emJw?=
 =?utf-8?B?WUh0K0FqRkQ1Y3cwTjZKWkljSU0vb1BsMWp4UE0zK0VSZjV3S1grelhXblgw?=
 =?utf-8?B?MkR1QW1PM2hRdUlNaDdCamRtSG1YT2FaeDNKTE8yTjRDaTkvZTlOOHFOckdD?=
 =?utf-8?B?Vzd4d3JxNStOUlNla2J6ZXZkVnBtd2VKOG00bmMrUTBwZGJmeXBsU3ZDdGI4?=
 =?utf-8?B?STdpcUU2aEl2M2E0OVRwS2RGSTFnRjBlcFlTT2hoT3hIaGFORncvWUdrNWlh?=
 =?utf-8?B?QnhCY1hudGVwM0trbjd1N04wd3FPbFhCMUxlQzY1UGFaVmZjNGtDZkRXdTB6?=
 =?utf-8?B?SEZ6eDI5bVhEejNVeVNPTDRpYW1TQXhTRkxVVmJzcHhqUEFkb1BkbWs4SGhr?=
 =?utf-8?B?cVhVOGFSdk5ySCtXcWlheGlpZGl0T29OVWZiWm9URW1ydVpxcndZeVNpRDcx?=
 =?utf-8?B?K3IxWGx5anlRcUloMTRkMFV3V2xZMjU4N1NrVis1d0F1a3IvdnRMY2RlVmY1?=
 =?utf-8?B?ZDVkbUNlM21OdnlXTmlrL2NPNnh0OEptVnBQOVZVSnZSTlFaTGtoZXRsaVBL?=
 =?utf-8?Q?1GSgfrmNlSi4zaRS/yz/5NRKP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68c7492-238c-4d79-7e9e-08db29171ac4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 07:45:41.4691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD+LQzF6d6NFyHBSvw88ebz+jpiIQ+8i4Xe5wf7wLGmp4AvmPw8FeVbQllA4gSg9d6vQwAHH5KeLIdLscjm5tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8985

On 17.03.2023 17:09, Roger Pau Monné wrote:
> On Fri, Mar 17, 2023 at 04:01:59PM +0100, Jan Beulich wrote:
>> On 17.03.2023 15:29, Roger Pau Monné wrote:
>>> On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
>>>> There are three noteworthy drawbacks:
>>>> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>>>>    now have to emulate certain instructions for ring 0.
>>>> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>>>>    complete there.
>>>
>>> Then I'm afraid we can't set the bit in the max CPUID policy.  What
>>> about domains being migrated from a host that has UMIP to an Intel
>>> host where UMIP is emulated?  They would see a change in behavior in
>>> SMSW, and the behavior won't match the ISA anymore.
>>
>> Right, but that's the price to pay if we want such emulation (which back
>> at the time did look at least desirable, because the other affected insns
>> are more important to deal with). Not setting the bit in the max policy
>> is as good as not having emulation on VMX at all then.
> 
> It would need some kind of justification at least on why it's deemed
> worth exposing in the max policy (and thus made available to incoming
> guests) even when not compliant to the specification.
> 
> Could the non-intercaption of CR0 reads and thus no #GP on SMSW on
> Intel lead to software malfunctioning as a result?

One can't exclude it of course, but I don't view this as very likely.

But as said in reply to Andrew - I guess I'll simply drop this patch
then (which also eliminates your request for further justification,
which I have to admit I don't really follow).

Jan

