Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1C5EC647
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412703.656114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBf8-0007Tg-4S; Tue, 27 Sep 2022 14:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412703.656114; Tue, 27 Sep 2022 14:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBf8-0007Qo-09; Tue, 27 Sep 2022 14:34:18 +0000
Received: by outflank-mailman (input) for mailman id 412703;
 Tue, 27 Sep 2022 14:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBf6-0007QU-Sf
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:34:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7503acb8-3e71-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:34:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8219.eurprd04.prod.outlook.com (2603:10a6:10:24d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 14:34:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:34:07 +0000
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
X-Inumbo-ID: 7503acb8-3e71-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k51lSCM8Zn5tEJcAJ21EFJGdnvOfpXiFMiUs8cG2Cq4w/q/4fM03HH6Abseg5XklDwXRNujnVJYE68MOKFZ1xEA+o+cGVuC3KrZvB0s0mk/a/7wu1XYD5pPlo3RgiUagaV/pGzJffu2Wf/vVcGYfDtCu+9cqJzB5bUncax+VSMAHs49e8S1r3a1TBDLVveK/1rEYtdApCfxfOT5wtCj0TW+Amu4sPXYwmy3ywE4fdeDzneF7FYL2i1db5tSC1+yRHPwxcqw/AnDeqLqhsPcerDtD0CMQkDncXEN4LojMMoL9Ui7A9rjb2STj+u58AyBB5iXQtqYHTo5Fx6VnTv6TLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPdiUV4zY8II75gU4rSNsJ2bZZONG1hTR8i0I9CaB8k=;
 b=VS8M3f3AN584z01cztGPdoLc8TtCEUxa45+gfSt5mqJAY6fwFbpa4PI+FVjUY0Hz9Tw47ddSDDqphzvq4nJOwC3VtDdCfGogYC9eTkcCa1W9o31wId4kMPX9f0l3VWynFvPRjsYs13n4tr+7gGB55tSRMtf8xtdPw0Q+9wp9OPfObg3PEN4iqcszSvFuGU5+V67yEr1nU9PyMHibyTq+H4TUMtfLmndj1h5wH7r9Jt9EfUxCOOs1I7QRTUjV8U+w3PkfcDagIo2iaNA3AwMLw3GDliMS+XvwBlBdqYcA8c4MRS6cgSps5ynwTuyEyuT2gqnmseo6rM/7R4buHriw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPdiUV4zY8II75gU4rSNsJ2bZZONG1hTR8i0I9CaB8k=;
 b=duL8SXor/yNcKpWx+dx6ZGqTvyYcSr2kuyohQEg+VrpPMqckS3JUvEez1cgvONEy84BObAw6fdk4p9/oLx4OfMTczqQu2+ekHlLlK+Wjo8I8IGLZB0Vr/o1LbORsPJBxEPCfQHAnrI7vTYSEOP98UDPGJe3UP9P/BpXeM1jDGwOwzl9FTtkT7R1uBG8iD1l+EVismchFf1teqwV/FC2M/PaUetKNvYB/RtbL6sL0YKCn4kotlskie7AydHVTi2av43SoP58c0SM9gg456cInbXIVpVclOdCqAmxY+zsqZKFXExEvRS29JNcorPbluVFuCVoSbvWylOHq2+fTZagV1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b3f635f-9fff-2649-ca1c-01a52b1b8ead@suse.com>
Date: Tue, 27 Sep 2022 16:34:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
 <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
 <7eab9645-0c7e-e171-870b-814c330fac08@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7eab9645-0c7e-e171-870b-814c330fac08@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e75ef4-7b9f-45c4-04b5-08daa095555f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9XEGn428J9+l9VnfVX6dbPUlOWHTVfWG2gAN2JCMjWPh4yh5aMirUGWcJGGPOTrXUCzzJwqoJyEXW4HS0CENnTEEvB/+A1teesd885MaRO5XX0037Zk5Kz8p6mbxhrlFTbXkM87XCrmZYmzl0+gCZMdV181+WV/FgzMnrFJHB2j+LNQ7KtlrgGr02ThFMt/Y3C8RUqkg2mUKfqII9k6+PIEqfh9pnZG5rPmmlMHdCWD6CpjbOWvo2vhzkfqGhTR/Cg9i8gNaSxuBPfraBXVLQhId+tPW70aMRpIlxevGeoDSOW6Ioe3vM3JyyhSMV3XqYKdWjyZcDXru2boUKXDoXpqnDHFH7L1ARL5qSZcwWpy4IKEqS5IncysrS7dMSbhqEZo79cY7n38Nnmn59n3gy9aSFDZmMbsoEkkiW3/EAF5HZmTw+uEjGzNFfcd77Z4TQxwabHP/bnIdVWi2z2lxl4OH94uH4HS9UYnh3pFNZQD93NReLq9deSoSuCQ7bssCfKE0Fk0A3suhWjevUKKNfDd+i5MNhJXgS+GqLIqcLTb3KB4GcUBpPV982tUAX++WM6cyZpm0f6zGs5COn13v8d/2dULtbDaFOjia0CNjTCECEzpLyXoqcRBu4f+lvI+/F4TryM/2/Phgq+RV/5FpW2zun/hrbtapTr5swyPn3JJO8PjKIa7Hcmy24x0LQzJHltPv2ZiWxP1XufJF+pLfHIwr+e8jDYabqXOS8AX414eMFPqBu8+O86W2TCdDmn3bdsLFr7o2OFkehEAl5NaUwCH0M3ZgsFmpgQ4jrU773P0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(83380400001)(31686004)(186003)(6506007)(8936002)(41300700001)(38100700002)(2906002)(2616005)(316002)(6486002)(6512007)(5660300002)(478600001)(26005)(36756003)(31696002)(4326008)(8676002)(66476007)(66946007)(66556008)(53546011)(6916009)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXlvWXVTLzZhbHhPMFRrYy9BOEM4VDZhVkdNb1ppYXZ3R1VWam43TEQ0bVlx?=
 =?utf-8?B?QllFKzlRNjZ2UUpkM2ZoTWs5RmhhM3RRWERCbTZZa3N1bU9HUGM4OGhuWHc0?=
 =?utf-8?B?amc4T3U4a0doa29RT0Z2OVMxdEVDU1B4SXlwcUtzQXNpQWdINzhPWHF3NmJT?=
 =?utf-8?B?aEtPVWwrbXpjcmQ1UVAxU3dKM01iVnVaQmpIbWNjb0RIMGtZOHdrS0I1Ly93?=
 =?utf-8?B?M1hRK1NKbTZHdXhaUDZwTFpKWjhJM2ZSQzFxRGoxTklxTzBXcXN2cDFZSmNN?=
 =?utf-8?B?Wm83TSswT1lDUjhVM3MwRG1OMyt2eUdneFJoODFyTzZEOE1Od1d4VjBKWUZZ?=
 =?utf-8?B?eExaTkFvRWFkYkdZSGJyN1A5WnJPd2NDVm9wV2VvR3RyTWVaWmxlYm8xeS9R?=
 =?utf-8?B?QUQwejd0TTN3L3MwM05vdU4xY1NHRmVEaTNxMGFDeVdwSEk0dFR0ZkxURGZu?=
 =?utf-8?B?bXZFUHFGVVZGK2hOOHFSU1k1UkttS2lLeDhKcGpUOHdnOSt4cWNXQklzNVl1?=
 =?utf-8?B?dlQzZUR1ZXZ5Y1BFdDYwUjFzTTF3dWZGbU80UWJFc2gyN1pyZnNSbHgzRGly?=
 =?utf-8?B?VVlKRHRPaWg3dmhBSHg5TEtIM3kyVDJSaXdhdFI3UGZ4Qm5nMjVrd3k3bEg3?=
 =?utf-8?B?bkVjOVM4Q21VQTZPMzR3aUdaeG4vYy9RVTcrN3gwSUdxTE1KSTV3Nndjb0RF?=
 =?utf-8?B?ZGFiaWlqYjVXL2tQZGNGeHVxVmdLMnFDL0VGc3Qya2hpMFlVci9NTlYxdlZz?=
 =?utf-8?B?ZytWVHhUemdVaFVMWjV6NEpzRVBKbnk3TC82aXJFYVhCY1FTbzRHRUNZdzN2?=
 =?utf-8?B?ZVBZaGloVHZRVEJvY2s3OTVLeGpQaTZxNWJ4TTJXUFdmandkdElRR0lNV3o5?=
 =?utf-8?B?NVVvWGtodzU0WmtQSnZlT2lBdUxjb2h1R09Nc3JFRWx0aUIxZkVCR2U5YVJS?=
 =?utf-8?B?VUthdHA1b3lRZyt6U1lkL3dNdmszZ05GMzhzOXhFejdRRFpZN2tsSENzNG51?=
 =?utf-8?B?T2g1dUdXcXpQVVU5Qnd6aXRyQVZsanFSN0g0MGNEMW15RVZwd3VUN3I3eHJT?=
 =?utf-8?B?TSthVzBtY1B5QUt4VjQ3ajJwelFtTDB6a3krdS9YSEdKc2lIWTV6SDg1cUxW?=
 =?utf-8?B?MnFHUUF6R1JyRldWelI0Y0NKc0EzQ2dkVVlhSkZDYjkyZHBLNDZNcUl0NGNP?=
 =?utf-8?B?TkpqaUUvcDhoNEtjN1VuTXpnSEZMMVlHUnpMaDVpWEhZbnRpWlhESzBZcHdl?=
 =?utf-8?B?RkV1cnhTdjRkNExPR3FKeFFERmZUNUtaYmZId1BJVlJLckNUUGpBZ29DUjJZ?=
 =?utf-8?B?Z21YeFdqZGRZNXBmNXgrcXFicjlUN3RQVllzY2piN0FnVnBzK3pBUFJZeUkr?=
 =?utf-8?B?SFlDWUdRRWRpV3RLVnBZZGJNYUdQREZLblNRWjFKUlVUdVJzUEN4UmR1WXlj?=
 =?utf-8?B?SkVIV3djSVd2RkVjOVhhbXRvaEpFbDZ2VVRURFFERThIL0lpZjhkdTlhK2dM?=
 =?utf-8?B?amVCcHYyd0t3Ym1oQXRRMkdWdkRCcU9YTk5hUmdzMHkxejFueHFEcHVsYVVv?=
 =?utf-8?B?NDI2QU9QVkZWcGd0WjFhRzZzQmRkNmQvWXBVS1orbXNsQmh2ZWk5dkRmdEVw?=
 =?utf-8?B?RExwK1YvZzk5ZVNvTEtOaTdLTllJTng0QUhLejkzNmg0Ky82OG5qVFhrRGdD?=
 =?utf-8?B?RjJyU0hXOElxVnVZRDVwQndDaVNKZFhGVk1mSmhvZVpkcC9mcDRLNkZCNHkz?=
 =?utf-8?B?YmdRc0dpQVBkOG5KQzZaYXVqd3FjVENIN0FIS0hjUlN4cFFTUjRHSGFYNzc1?=
 =?utf-8?B?VmJObUFPVksyNkVHN2tIZlVxTGpKNXp6c01Id0Z4MlMvOElRVkQ1QWdlbVRh?=
 =?utf-8?B?SGJjWkJPd2dqSkFPOFpGeTBHN3RUVy9EbUdUclo2YWFwYWZRQ21lQ004dnY1?=
 =?utf-8?B?RmhBTDQ3RHlPZFduaFBIZ244TXVzRG5KeFhoMktqY3dJZDQyNDFkdUtkUWti?=
 =?utf-8?B?OUNkUWVBSDkxWDJtM2xBQ2N4NlFPUjBNMXh2alN2dnRJc0grR1NuMWdPVHlV?=
 =?utf-8?B?Qk4zWXRUalJ1QzhWbUxMcytDOG5qMjJ6R0IzcENrQmV3VkpYVWIvTEN2cnJC?=
 =?utf-8?Q?csiZ19+53h/pEC3ya1985KNjk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e75ef4-7b9f-45c4-04b5-08daa095555f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:34:07.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNx5iXGScFu2e/ix1ia4mlP9Qm0OJ17/DZyj7zt0iaxwcf2oQe4xDjWqGkf737VqzjGaLGdZYloj1kZjb24SUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219

On 27.09.2022 16:29, Andrew Cooper wrote:
> On 27/09/2022 15:14, Roger Pau Monne wrote:
>> On Fri, Sep 09, 2022 at 09:22:52AM +0200, Jan Beulich wrote:
>>> While I was suspicious of the compiler issuing a diagnostic about an
>>> unused linking-only option when not doing any linking, I did check this
>>> with a couple of gcc versions only, but not with Clang. (Oddly enough at
>>> least older Clang versions complain about the use of '-nopie' now that
>>> we actually use '-no-pie'.) Filter out the problematic option in all
>>> cases where the variable is consumed for compilation only (which right
>>> now is everywhere).
>>>
>>> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
>>> compiling, the option could be omitted from that variable right away.
>>> But if any compile-and-link-in-one-go use appeared, there would be an
>>> issue.
>> Is it feasible to have compile-and-link-in-one-go in one use feasible
>> with what we consider embedded (firmware or kernel like binaries).  I
>> would expect those to always require a linker script and a separate
>> linking step.
> 
> As I've expressed several times previously, the entire variable is bogus.
> 
> Just because we do have several things which are built as
> non-freestanding, doesn't mean they share a common CLFLAGS environment.
> 
> PIE is very specific to the intended use, and blindly disabling the
> stack protector isn't safe either.  It only works because none of our
> freestanding environments have gone to the effort of adding stack
> protector support.
> 
> -fno-exceptions is furthermore bogus in CLFLAGS, as its a CXXFLAG only.
> 
> And no, this mess can't plausibly be used for a compile and link in one
> go.  Filtering out a non-CFLAG from the collection at every call site is
> nonsense.

So what do you suggest we do in the short term?

Jan

