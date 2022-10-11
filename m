Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DA5FB07C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419541.664317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCZ9-0005rP-F9; Tue, 11 Oct 2022 10:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419541.664317; Tue, 11 Oct 2022 10:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCZ9-0005p7-BY; Tue, 11 Oct 2022 10:32:51 +0000
Received: by outflank-mailman (input) for mailman id 419541;
 Tue, 11 Oct 2022 10:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiCZ7-0005jM-SC
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 10:32:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d384544-4950-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 12:32:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 10:32:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 10:32:46 +0000
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
X-Inumbo-ID: 0d384544-4950-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgdBzoC8Mce5oREt/6h1OfZitjGn1wYrsOhVOdrwVzPuHEgYDAGf+dYGqqjsy4tjtc4PcPOcUqXvMnGTcdBPooTLfate3q864JgRE2xV3J7hFvt/2/qSab0ZIhCZ2Fugyj6FI+Lvu1nz+S5PDb5FGuJ4CKbcOhonfAo6C3mDIGSgRG87DMJa/yVJkTqvcpWt96bp+uOM5DLQbEZ5UXSTdEfmpVgIct2NGPhJFNt+zRhdygXH8R6vsZ85W9b5KKuB37syJD85mkkq3utes1+gEGhPmJerTRcUlgsRfq30NwVep+RbdzjfLIGVcCf//q4GufkTjpr4qgXPzIXU2AuT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scZ4KbixaPv599tYfN4CIeBtDOwAInSpvwmi+VBdTAc=;
 b=WQ8rQU6I4fqXMbqW/VQ+4MuzGepNd7GkjH9B/kxNyawSGV81jc+CDljuq5/EQfJ8L+ZsAgOxv4Ia5POGPw8teTG8JTSEHnAZKWVjjxlvMkJjHWM4bXLAttmDmJSPiAiu6LfASiZbOvQkYMo4p4eayIMnighl3qqJQVth8NjvyzDlwsnFsoTw2jir+bx20Z1CX0FMmGwFpJHlBOINzAbpSUADqcssI1ylONVQmzSsnxz6ocaWJu4vMS4+ZGkDuiOFjGAAWB9KVWnd8x/r+LeNk4fRKwypemoXrb/cP+F+1XXHc7x9cXfFAdJr03Wg+zX96uux4QV0m/FtVlgoQrWjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scZ4KbixaPv599tYfN4CIeBtDOwAInSpvwmi+VBdTAc=;
 b=L5bovrEGoPCT6acIKmQUC/cI+G+URKUJlHEFRqEtcEaDXs9brH/F5zqzHxDzPtoKQLvYs+ZRao+HTqlStA/nzNMxJ5i1782GWWs63hQqpjhv9xsQb/3OjEj4cgVMqc4QHAkK2avhDyFmDxjXnnuIqrdQVjZNDz+pgA/JPiS4Q+K3oQLdCNlpDbSrmbt7vWtJ0FuDGunVumRTWmiBmNHMDxEbd8YIIAkgJXfnF0qIwhthU9Y99rRLIFjMTIbIW4yTOkAUR83gb5wD+ElsBuBZgQieic8GJ4dqMQANtZdQW8wUndr5HITiSUo2htNhj6zzbLiKdRyen/hK2lXg6ScMCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f0fdef1-7e70-3d6c-3e67-aecc7bcad051@suse.com>
Date: Tue, 11 Oct 2022 12:32:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/2][4.17] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <1dac86de-cb8c-d2b2-d0ab-bf76707d22d0@suse.com>
 <9c407e09-4af8-b021-293d-b1db8a0ca4f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c407e09-4af8-b021-293d-b1db8a0ca4f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd29457-bc14-4ae0-df19-08daab73f03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aNmcax+zY7JUYAqLG0UA1sLoGpjlRcPmNjzx8kdhlEBDUwHViLjNFRAFaBoJ+UnpbrwyjwJNmFAmzJix3lDSFauJ3+w4Z9a/2O7xQHjS2zjsMxWWzzI76u2/N2F8mtMgKyH2GJb+thwYpiwnGDqHm6D7uoExi16UZEOyBE93cO/yAhivJmtPRv/ADwshQPX+wFbyWLIeD6hRltNoIt0MtHlFfk52QAbCtXyYcblPtFrWvHJ6X7mvJjAzfD73Mk882sV9I+6rITOVODZ/Z75hKaH74wsJIuUIJqlwzN4dsK1ERGIAwEgh+QiY/5UVCJwf4WugJnIlVsmFwba9YtdE2zwYvPuFPv1hvs1k1TuLddTo1URobjafpMc/c6PAnhUbrPhhFrpscmHYoqcKloBjY8itqtQkppAFYhnh/cHxkWssLkpoYqBPr4kxeU+3zDNzegjHwszyrMthslz4+ap/Oj1YBcFzRv1JZ2MC8eTftYezRsuIdlxFBJTsYsfJzLh9UMPu5xD/LBI6rVX3Yrj9ekyFglG6f4vtT2f3ipElnxqd5kGnJpOXfXIkPi+oa5un5UHt/Pbhl/Czjwpopf3gNCwu9Oczps1ge/MLBl4LqF/aQ89+eyIIvjLOI979ATCJ2mPZEnOUreXzIcIQF52HrC27c+wqWeAl0YnJLLS043pdO28aeRzOgRgjrxgiJ3Hoce85epWyx2jf4Eynfqh4qv2rMOpo519UEk4Qgibcc7bubt2CgwcaO5JbCgrvo1TLOE0M4uZuscJaACxfyxz4fuadkwogqa9/+O3ci8N6HT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(8936002)(478600001)(5660300002)(8676002)(4326008)(41300700001)(2616005)(6486002)(186003)(66556008)(83380400001)(66476007)(66946007)(53546011)(6512007)(38100700002)(86362001)(36756003)(31696002)(26005)(6506007)(6916009)(31686004)(54906003)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZwK1dyT2RRa0RyN29ZTk5Dd21zdXdmU2xyZllUb2RWSnJOb3MramZ4NTMv?=
 =?utf-8?B?NkVCM2hnZktpNTE0SHd0ZmZuT2hDY1hPaEFVUGp3R2JrL2dyeWN0VjZLdFRT?=
 =?utf-8?B?S1gyOFo3RDJEN0dvb3U5YVA2RENkY3ZvZ09JeTY3RFNYS3JGWXZJVVRZOGlO?=
 =?utf-8?B?ajNEZ0s0c0lRVjA2S3VXaUVxNGU1cjJQTE1GdXV1eVRJcjVoc1FTYU80Qi9v?=
 =?utf-8?B?MCs2TUtxdWpnY0dvclRvRWZkUVJVd3hYMllLVTdxK0tLVm1lOVdaUHh2aXM3?=
 =?utf-8?B?SXYxejhwczMraE9XSlpZTG9YeGN5QjRPUSt0a3BZRzF4cXVWL20yek8vU3RV?=
 =?utf-8?B?OThxYkRhTGZkY0ZFbXBkMU9GWGNYWGZCT3g4OWplRCtiT1hPcExqcmR0R1Jt?=
 =?utf-8?B?VHUraS9YRDZmK3RvZHBPc2hGZnRxZ29aN3JYdnlpeHUvUlRkYkFEU0hFMFBJ?=
 =?utf-8?B?aDl5MGlTdWUzWWkwLzE4NWM0NDF3WnBFSXhUWUgwYnN4SEtUWE9NM2VUYXpN?=
 =?utf-8?B?QkhIWmNIZTNmVFlueVhOOUJ1Y2IyazJhcmF3NjFMMjdyWDVQZEk2WncwbVlI?=
 =?utf-8?B?U1VwQUQ5cUhEd1EvaE0wOFI3ZGlrQ1hkd2RSRVNxQUc2b09NRGFhM2Q1OEc0?=
 =?utf-8?B?bFNJUUl2d0EzeTVPWWFCc1JUbjZqQ3FkWHVmM3NHWmVwUVhPUXZ1b09nNDdT?=
 =?utf-8?B?QkhjSEoybjBVZVdSUllTK1JpS3VZSWozTlFZTEVBcXlRb2l2bzlnYURLbkVP?=
 =?utf-8?B?MFUvL2t1UTRlNHFyWXJjRjZBT3FiMktiOXlaakNZQ3c3L04rWVA3M29mdjFs?=
 =?utf-8?B?R3ZoaFphK0N0c3M5Q0lRNGM4YmRyNXhjS3N0Si9FSFIwZklSRldrV1BEb21H?=
 =?utf-8?B?U3d0WlhjVGkxRG5oTS9pSGxJY3V4bnJQN0REY3lRY0dKSXJJWllyaGtnSmx5?=
 =?utf-8?B?OVFpdFY2QmlwRDdVSXMrbnY1cnlqbGgzLzNyOXU0S0lLM1hndzYwb2MxZVR0?=
 =?utf-8?B?RTN0ZTl5ejRVTytWeVA0MVNTVlJPSGF3WFVlSmhScmg5bEpKRTRKMSt4S1JE?=
 =?utf-8?B?M1RWNm5XVVpWQzhCeW5vVnFkbi9vdzNVYjUxK0x4bUhxTzBPVkxNK0psd3F5?=
 =?utf-8?B?bUJLMGpnUWhpcmIvMjFtS0xqM2RuT0w5SCt3dmFqVHhmelkwY3FYWVBjNVdM?=
 =?utf-8?B?dTRIeU55bEcvZFdiKzdQQitlcHNnMVMrVFNIamJ1bVp2WkJ0L2VLeUhyb3Ez?=
 =?utf-8?B?T05SWUs4d3JXTWRyY0g3eTVvY2VNcnZwRUsvaGM4dk1uaFdCSGhpamNESExi?=
 =?utf-8?B?UGRqSzNQY0Zva05vdGZLUGNLYkhNdlNWQW4xVjRmcSt4aW50QUhTa0Z6ei9P?=
 =?utf-8?B?ZlB3RVM5TklzMGwvaXV2T2h5bEs1WUgyODljcFlIWW51dm1oemtkbHlxM1ZZ?=
 =?utf-8?B?WnBZblMrUVI0N3VjYmw4WGNXTEZrRnpNeXE1a1p6bXlBMUVKTHRuQVF5VU11?=
 =?utf-8?B?RlVZK3NhOHVQVFV6MVhpT2FkSEJ6bHZja3ovTDdzbW10cnE0ZmdjL0k3Tlp2?=
 =?utf-8?B?ck54ak56VnhHckF1V2FWdmRnOTVzTFNzZGcxa1lZV05yaXBycHVoSzBYcFh0?=
 =?utf-8?B?eUFTWFFueHR5QW41NjJMMnJtUWZIby9Vdm5HWnZNbmJKTlRWYjY0R0pwWTFa?=
 =?utf-8?B?Y0xzeEZqbnIwVnY5OXdSdWdydVF1UWY4VXI3dHh2RlZZK0pjNjhUeStlZjRO?=
 =?utf-8?B?WC9lRzQxN0RsYjJlaFZsYWxEck1JakFGaFpXTloyUWxaUDVXbWduRXAwbHd4?=
 =?utf-8?B?clFpN0szTmlhTGZDcVIxVlc2bXNHWDNXWng2WG1hQUZ5OU9MNEZPMXBOVXFE?=
 =?utf-8?B?VWl6RGQ0UFZ1S3Jremx4U201ZkxlTWRPZ3MwSVRzR0dScWtuZUxPUXRXNTdU?=
 =?utf-8?B?NHdkaFVmSlh4MmNUSFlvaTZLc05CUGozMjdDZ3lIV1M2QkdZdHdDTHJUT21a?=
 =?utf-8?B?TktBUmZ6Z1JEZVgrVEJ4cnRXT1RRemlSMDF5U0ZCMVU5bVUreVphcDRBaTdu?=
 =?utf-8?B?K3JNSmJ0TlJNeFM5ejJUQk5Xb0NWcFV2MUR6T2w3OTk3R0o4dU5tcThzZnFa?=
 =?utf-8?Q?oEuHDczKMjBo7aSAzfQ+5kLrF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd29457-bc14-4ae0-df19-08daab73f03d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:32:46.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkHqc+R420XqTSfoE95aEeCEWSeQGVtAyB1eJdfZQdyerUXwAVT9/wIQZvbk1S22LxJEZZLXkg+tf7gVvR77Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186

On 10.10.2022 20:56, Andrew Cooper wrote:
> On 06/10/2022 14:11, Jan Beulich wrote:
>> In an entirely different context I came across Linux commit 428e3d08574b
>> ("KVM: x86: Fix zero iterations REP-string"), which points out that
>> we're still doing things wrong: For one, there's no zero-extension at
>> all on AMD. And then while RCX is zero-extended from 32 bits uniformly
>> for all string instructions on newer hardware, RSI/RDI are only for MOVS
>> and STOS on the systems I have access to. (On an old family 0xf system
>> I've further found that for REP LODS even RCX is not zero-extended.)
>>
>> Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Partly RFC for none of this being documented anywhere (and it partly
>> being model specific); inquiry pending.
> 
> None of this surprises me.  The rep instructions have always been
> microcoded, and 0 reps is a special case which has been largely ignored
> until recently.
> 
> I wouldn't be surprised if the behaviour changes with
> MISC_ENABLE.FAST_STRINGS (given the KVM commit message) and I also
> wouldn't be surprised if it's different between Core and Atom too (given
> the Fam 0xf observation).
> 
> It's almost worth executing a zero-length rep stub, except that may
> potentially go very wrong in certain ecx/rcx cases.
> 
> I'm not sure how important these cases are to cover.  Given that they do
> differ between vendors and generation, and that their use in compiled
> code is not going to consider the registers live after use, is the
> complexity really worth it?

By "complexity", what do you mean? The patch doesn't add new complexity,
it only converts "true" to "false" in several places, plus it updates a
comment. I don't think we can legitimately simplify things (by removing
logic), so the only thing I can think of is your thought towards
executing a zero-length REP stub (which you say may be problematic in
certain cases). Patch 2 makes clear why this wouldn't be a good idea
for INS and OUTS. It also cannot possibly be got right when emulating
16-bit code (without switching to a 16-bit code segment), and it's
uncertain whether a 32-bit address size override would actually yield
the same behavior as a native address size operation in 32-bit code.
Of course, if limiting this (the way we currently do) to just 32-bit
addressing in 64-bit mode, then this ought to be representative (with
the INS/OUTS caveat remaining), but - as you say - adding complexity
for likely little gain.

Jan

