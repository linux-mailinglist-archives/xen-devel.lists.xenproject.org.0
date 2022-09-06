Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32635AF70C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400201.641871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI9-0003cH-H4; Tue, 06 Sep 2022 21:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400201.641871; Tue, 06 Sep 2022 21:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI9-0003MR-2w; Tue, 06 Sep 2022 21:39:33 +0000
Received: by outflank-mailman (input) for mailman id 400201;
 Tue, 06 Sep 2022 21:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgHD-0000Cs-4f
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 431331c0-2dce-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:25:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3156.eurprd04.prod.outlook.com (2603:10a6:206:c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 10:25:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:25:42 +0000
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
X-Inumbo-ID: 431331c0-2dce-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw0v3xaFpjGjm1m4gB3WfEWnC2HMwEae8r863CQgLEh4k91kcnK3m+cS6wF5nW2pSWYLIG1ILCvcbabJSFD2aL8K0VJ0QmMUwDloapQRvhmsWMnoWY5uSdU5V6mKj0Lf2lymXLepObnP8NDjyXR8xU+n0iHo6aAv2DUUCvTgdYKIiV2f5deYGiBYYKE35e1/E82MGOqaWYDp6TNSB5hGWQ3jmkU/f7pUzmUsoZSbXuj71hEqGj+iUqGAwICLbKJ48dXMcsjTPm0jEGBPnWWI7xdiVxaTZMvz23wdD1DG3S1mqjOGHZWB5CZd1ipP0ycT9NAKubUpaFUlvIbnF7jsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t1Gjq3u0TsbiycCR2ZrlpGHJV23MQwsr3aB3gBMaPc=;
 b=GhvywZuQAIXFSyf4FAWJODpff4QnA5Z84ygXKPpS5nXugdcN3BviIJKo4TIOtFLJ6RaFug372Q4k3KZSX+QNiRhiG8KcWFgEROD4yae82BeISWVKV1q6y8HrbWCzJ1rGeQ69F2eLEnZ8qhYs27FGwOFbffgs11oCX5KxMk2raheSrluj5FUtCheiQyW1ZdZrGuupDflF4WBS7HLUWbl+KmUhNwq2hRpQD6azuZMALgCixkvMXGcpqKYiuLbvSJZuCDiqrVL7Nz4mvzseuG+6rMFEqVxCYbEVttUTmuPvyT//U0aCKxU+hSBxsNWK7uHMquFFqs9qhlsZB68C2zeRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t1Gjq3u0TsbiycCR2ZrlpGHJV23MQwsr3aB3gBMaPc=;
 b=XgfNmaHzYFhVsXAeQqjLlmq6GzKTEEw36716NQ6thBhFKuuX5yV3TqZshuE3bBoQoc/qots4f9h1AXQaUBK6PPCXlmAXR9AbBZQ7aPoC4EgHu6p6Gw1U+MOy8NxuxT4VGI3/IIjM/s5h56lBKO00FKhxU2ZCKxETjvNGEu7uaBQdUVlV8AGkob+JfjlGQLGtmAvvMnbzDS+riyecYQEKFdQJ1yIHr+lOCX45nWXikCfDyLcCcj6WLOAtHBwFA7fvt4DIZ9zbqCUZYSt0SYaXYuC72qKxVarUxWvIrNSBjDzOasAMXc65LBAx+0oUm+95pK0CkzJ/anS1kMSRXSMqqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ff2be60-0a25-638d-53ce-bb7d861c0a9f@suse.com>
Date: Tue, 6 Sep 2022 12:25:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Xen 4.17 release: Current status before the feature freeze
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44001619-6ebd-42a5-7e2e-08da8ff2271b
X-MS-TrafficTypeDiagnostic: AM5PR04MB3156:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lREvP+F6zQ/79GmBDdyXOOHqpWccH+dh0ZwcgRrnLFYzWlbuDWVgpHdQ+0dv0rdnBEK+BllY4akkrgZ+ZMp/K/Vz88XxRwqzZx0gO+9G94kpW48zhD2Qag5j+27MokuT852BhcAocmy0/LkJaT7xNbjRN0VnBjVMhSSD8lTMQ13KGGhK8lo37RyGTS67LXO6usN1ZhVklFKvCqetP31ge+1EnHi8TLW3A+Nv4ORFLWOCd2EeHUNTdHeyA1y2La1jADS+d81yfLFUyTQNvb7T1HJv56KU1k9noi2wCOVCts1bpuOvptN7iU9qD21dg/m9fyxScbwZ/GVKWz7LWCfwtcLHN5xAF+DaSSnMi7PFH1P2U5Q5uqD1p5eEKGEneHFI6DjqFJdd/pOxWDiKJFyarMXO/FcyZ8QTYYgfKbiDzyV/nj5wFD9pGawG4gNBjbygQMDV9Zq+hB3+0jZNXboOSHMDb7lTrICLawZY6iG0dAluizWoy74sXq6f69ZlqwQuOBseDgwZkjVb1Bj7U70MibAVARkTHB1t/w7yVLPC+PZkRphZI0SWXsPwFxFVfrln9zid1gltco5SSF/xB1y3E1O42pQhm7JWJcbK3cy1ARsoCdgzIiWxF8SDDgVFuozy3STzwZYod01z94dvfTQQvCb83LmhKOfzAvHaEOqneVvhTNF1RtRN98kac8uBfiLcz1m/FP675Gyxqkw92/ip9buCtith14g8F+dfeDpeUCfrJ2vtT9gf+jDdYHy5bBFYNo/kUTW+VK81aPHoUFiefxVlMSXc9SpsikXcKFlZAJ5yOGlUO+wS4odH/HR9PfBT3XBbZfqHbGEfAnqG2NODNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(2906002)(4326008)(31686004)(8936002)(7416002)(186003)(83380400001)(2616005)(36756003)(66476007)(66946007)(8676002)(5660300002)(66556008)(31696002)(6916009)(478600001)(26005)(6486002)(54906003)(966005)(41300700001)(53546011)(6512007)(86362001)(6506007)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckk2U0lka0hyc1g3WXB5bmlLUktrdjlnQWdIcEpYckRjQ1lVVWhLWEc1cFU4?=
 =?utf-8?B?Zy96aWswdEp6a0tyclgxWW10aG44aDRLTVJUcUNSRjc2WHF6U1RIc0tqS1Nv?=
 =?utf-8?B?MVY5bXpWSGdtd0w0dFFxcHNtbGMzb3VhN0xCSG9pSXF2K00zM3hyQU1TWHN6?=
 =?utf-8?B?OXB5RGxPS0pTN0RYNlgzK1hYMWdBTkJybGlVSW5xeW9ERGVYYVRXRVRHc2dB?=
 =?utf-8?B?Yys2aEtmS2F1ZnBFSzNWL1lzTlpZcnRTZmpHWkliWFR0UFk0bTdGNEkwNVVn?=
 =?utf-8?B?U2VXZVIvR2FvcWliaWZQMVgxUWt1YzYzQVhCQkd2VVB3THNpSHpsWVBsNVFh?=
 =?utf-8?B?UER3N1ozdWR6TnNMcENBck1SU2FVWno3WmhjbzFNYUsrRHZPZzZITFlIVWVU?=
 =?utf-8?B?alpuRFFFQW4rczJYdUNlUEFGM0tsc2Z6OFVBVXhoTHQ3RWRxa2JyTUlNWUR1?=
 =?utf-8?B?bGxUN2dKd0JqaE9DL0VHTkhhaE1mVHpuVUg0UEc3QWpwVngvQ0ZsTGNDSUMv?=
 =?utf-8?B?czMvZkVjcjJqbmZmUklWVS95N01IOFBoYWxxek1tT3BDeEVVN0VsM2FNdjhF?=
 =?utf-8?B?ZytKblFqUkhlenJGU2lVSmJ4Y3AwYnJXd2phaGMrNWdLOXB3bEpoN3NyMm1J?=
 =?utf-8?B?ZVpVa01kU28vZmhjQnBoQ3lHV1BaaDVRd1ZCYVEyQ0xONU1HUXFrUXdTYmhR?=
 =?utf-8?B?QlhUenlZSlNlQ3J5clZ4OEV1UzFTeW1YaXJyR0VkRGVDc05MZC94dkN5TWhD?=
 =?utf-8?B?SzJOMllVOVVIc1VhMFBNdmNzK2tFREljMWJJVlFuNVh1aHRWVW5YbE9ZcTVH?=
 =?utf-8?B?QVdLV0Y2SFNqd2pxbkg4dEdabmlXSWVkZ3RZTllWRVFHdnBDZDU1OWpTQWRo?=
 =?utf-8?B?TGJITDk0cWRqUjNqTlQ0MXRuZ08yWkxwYjRNanlGVlJpcXhra3FCc1hjWlFQ?=
 =?utf-8?B?SEYzZGxsM09ZQnFBcDFsa2IyKytQc3MrMFpqMjVidUFUeEVVa1RadEM4b0hu?=
 =?utf-8?B?S2liZWlIaXFPSnFBcjNEQkJmbElobjdyRGFDVTl2dDYrbit0QkNiWnFjYnlv?=
 =?utf-8?B?cEkxVDBPQmJnUWlNY09xQVo4U1FmQ2hTa3ExSjRpbUdTd0hSWjEwSkxTVjNl?=
 =?utf-8?B?UEpBb2NXSzFma1pJRUZXR3N2UFkxRzN2Q2tkbjliQmUycjRwcG5URGVpVmJM?=
 =?utf-8?B?RXhQeE5sRERDaUs2dmJ5U3BJRGxLUThwNXBuSHZRRzYxUXhOcmdDb3NCbzZH?=
 =?utf-8?B?NVpvMTlWb0VXSG10a255bUQ0bU5lYVUrRnh3M3hvMlNuVGZFQ3MzaUVjdWt5?=
 =?utf-8?B?T0dyS2thSlVDUzRQYlFxQW4ydEsrZFZjOHVEOEI2ekVseERxVnpZOFc1L0dm?=
 =?utf-8?B?K2tJcFQrOXZ4aWRSck1waXFtUWtrQU9VazNjbkRpa0JSenlCRjV4b2ttK3E1?=
 =?utf-8?B?VkIyang4ZkhVTjEydmJhVXVZZVdBZ2ttZEJXZTdLa1dYTXU2ZWgzR0tTeXZk?=
 =?utf-8?B?YkNNb0tOazJQcHdGZWIzeEZtQUs5L3VZNE5pUHFUYXJzRGhmWlhna0RlKy80?=
 =?utf-8?B?SFh0VTNpR3EyL1ZJZlladEpMdnRHYXBtTUw4RitEQ3V4Um9ZQTNaNHJycFhz?=
 =?utf-8?B?RGNCOXg4SlJNbkhWSGNRMlNjOEhhZTBxMW9yY25vRGhCSkk4dXpKL2YzeWNK?=
 =?utf-8?B?N0J2a3Z5MkEzR3FCZjB0eVRvWTBjSnh5QmxmMkZ2aGI3NmhxOG5PbmFEZ2li?=
 =?utf-8?B?azVvN296WW4xT0M1TWwxaWlISlliRTk3OHp1SjNkUnhGbURndnRXd29JUFZo?=
 =?utf-8?B?SlVQdDhrQkVhNlMzTHM3Yjg5NVR4TFV4dFcrakFmRGVpVWZWNVJJWXZnc21S?=
 =?utf-8?B?L3NTVzFrYWtWeS9jTDgwWnBEK2UveloxbSswZjJDTWxSbUZlL0k2L3hGbUp4?=
 =?utf-8?B?SWpmMldBdXJ6ZFVPUEZ5M2NYeUp6Q2FvK2lnODhnYU5rYmRSbzFBVlBsYjEy?=
 =?utf-8?B?MUY4Mmw2d0FoQmtQd1hRVnMxMGl0VjJ4ZTR6Z0RxKzEvNjlhYlBzV0lyUFc0?=
 =?utf-8?B?ZjBMOEl6QldiL2t2eDNMYXorOVJrSUludkN2Ym1VdWhzN0pEYURBeERab1lI?=
 =?utf-8?Q?9rFPR9MFfFkfpR6KveD/MS4wl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44001619-6ebd-42a5-7e2e-08da8ff2271b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:25:42.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ/jr8AX4yaNSrZH0+SgXKBsAn6OLHzDOWp6ipokPlDPptLaHqbjhI9vao4uTHlAR+F86hqxT+l4Dgjnjc3nkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3156

On 05.09.2022 05:44, Henry Wang wrote:
> ** Blocker List **:
> 1. Patch: x86: enable interrupts around dump_execstate()
> https://patchwork.kernel.org/project/xen-devel/patch/e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com/
> Status: Waiting for review.
>[...]
> ** Arm **:
>[...]
> ** Automation **
>[...]
> ** x86 **:
> 1. [v2] x86: show_hvm_stack() requires enabled interrupts
> https://patchwork.kernel.org/project/xen-devel/list/?series=667114
> Status: Need reviews.

If I'm not mistaken this is the same as blocker list item 1. The title
has changed in v2.

> 4. Intel Hardware P-States (HWP) support
> https://patchwork.kernel.org/project/xen-devel/list/?series=666690
> Status: Need reviews.

To be honest I don't expect this to make 4.17, unless suddenly new
review bandwidth appears out of nowhere.

> ** toolstack **:
>[...]
> 8. acpi: Add TPM2 interface definition and make the TPM version configurable.
> https://patchwork.kernel.org/project/xen-devel/list/?series=672588
> Status: Need action from author.

Didn't this come quite a bit too late to be eligible for 4.17? Or has
there been an exception agreed upon behind the scenes?

> 9. Use direct I/O for loop devices
> https://patchwork.kernel.org/project/xen-devel/list/?series=668537
> Status: Need inputs from reviewer/maintainer.

Aiui this needs a v2.

> ** XSM **:
> 1. [v12] xsm: refactor flask sid alloc and domain check
> https://patchwork.kernel.org/project/xen-devel/list/?series=666302
> Status: Need review.

My conclusion from the v12 discussion was that a v13 would appear.

> ** drivers **:
> 1. Add Xue - console over USB 3 Debug Capability
> https://patchwork.kernel.org/project/xen-devel/list/?series=673630
> Status: Need reviews for #1 #2 #4 #9 #10
> 
> 2. PCI: avoid bogus calls to get_pseg()
> https://patchwork.kernel.org/project/xen-devel/list/?series=666322
> Status: I am not sure if this is superseded by
> PCI: re-work pci_get_pdev() and friends, if so please ignore this.

Yes, that one was superseded.

> ** Common **:
> 1. xen: add late init call in start_xen
> https://patchwork.kernel.org/project/xen-devel/list/?series=664963
> Status: Need actions from author.

Wasn't that patch effectively withdrawn?

> 2. xen/wait: Improvements
> https://patchwork.kernel.org/project/xen-devel/list/?series=660565
> Status: Need reviews for patch #4 #5.

Reviews were done, and (perhaps indicated only on irc) these last two
then were withdrawn iirc.

> 9. Make XEN_FW_EFI_MEM_INFO easier to use
> https://patchwork.kernel.org/project/xen-devel/list/?series=670812
> Status: Need confirmation from maintainer

Confirmation from maintainer?

Jan

