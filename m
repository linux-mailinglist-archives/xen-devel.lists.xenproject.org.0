Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8C6A5DED
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503596.775900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3R6-0000NY-1e; Tue, 28 Feb 2023 17:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503596.775900; Tue, 28 Feb 2023 17:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3R5-0000LU-V7; Tue, 28 Feb 2023 17:06:43 +0000
Received: by outflank-mailman (input) for mailman id 503596;
 Tue, 28 Feb 2023 17:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX3R4-0000LO-Ig
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:06:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe13::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 442a66b5-b78a-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 18:06:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7922.eurprd04.prod.outlook.com (2603:10a6:20b:249::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 17:06:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 17:06:38 +0000
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
X-Inumbo-ID: 442a66b5-b78a-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmjeQHyZ5HqYzSGGgg5qnUJ0tlM/EnPOBhCjDFg25H0HxXlJ+vo/29GEl4vCWvl8uUv6LeLuGtENlgvtABwkICZk17N4vsGvpnnQH8avAde7MV0WU/6jd1LjUbwfovrvlhPQaM3ynBGXwxKOB4ewQnUo0qNLdoYTa84JBNt6aR66MreJ94xVILHx9RFmYNmWCjf8SgE2pjL09RcSunlGn1Q7PyC/Bs3LE31pSShZmFIoy1cBFrJc29/N4gTbfevBMSzpKpPrhsyygAurgI+Ws1agu7fN5eTWf/5QRc12WiSHBaHf6euBP1hkTYZA3CV0onyK4SOdFoU6lBO6S4zPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUwJSy2E/tJ9qFnJ2LTSzt8ak4265XZlhUlUeQR8tjE=;
 b=D1gDFYpiEAvraLfNGt3rM9Okf/mLyk+AE1KiT4bdxorAFvL+FahDnzo9fL7xD+dr2pIBp+DOw9CoSIXBoXXEG5eKCKWV0CuptDfijUf+bgyJ1sPTcqlmHw2X5jVt0X1FTuT2nf5XsFhzt7xQ+UkpARGsA2XUFlP29/8lzevzEEWYRsZ9vKTnSOyBM8oMies6aMY8pc4FBe3G5LJM9JkrliuGEi470KEn/VRKpyTXd7eBfMeSKMY4LSRmJyIJxMaOSN4c0pmMN/Dup1j4Fz9d18lUxMAJWWQC9AbX3fkmyi9BqAFZUNc36exbOHHbFhlXd0q3wGk4LBxOdIkuKd6UXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUwJSy2E/tJ9qFnJ2LTSzt8ak4265XZlhUlUeQR8tjE=;
 b=S9/Ly0+wQRqevfMLfOdE744RHghOxhOfcpudPZMMKrol9KXETEoEBtT2cyw/RLbsAGUptuIXmg9DQbM8Z43r97U8vondwrjpZwKu0M+4RSyGekafMvoAElFfRmtyQJ/j9B1tclPF1m/ySpR8LFaGU80OWcFx/7W5g0tSu4wYPhfDJzwazlTDwrJluFEPlMKa16CNteSQW5evggowzIPOumMUUUzcahMEzixGuOoEiS2/9zZwDr29cE1L9e2wiLdYwM+TBhWN42sYUo1ZdCSAefWqXY869vKqaR7LyjDamdeV/v6CfRB4uKQDWkd4V4oQFhLA333h6tyBmcOOraEw3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23d3cf82-3987-d5bc-7f71-48b573a47e6b@suse.com>
Date: Tue, 28 Feb 2023 18:06:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 05/10] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-6-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: d17c6ee3-0493-4a23-8224-08db19ae2775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y+EfrDAHXRxZ/4Edp963jZ1GYtFEsUCXHSwx7a4KyhPvKeO3yLMnxY5yXTcTkolIi4RtW6PBdFVUFiOPn1P9prCcNM3Kf9L1MbN/g0ZsIirZxgX1k7DlJ1invJEz8UL2ubteCiod6wdIIck4ue/usB//IeTtKmllqHU5Dp03otZVh7UWJNU5vwKNX0y1pdgL1F6ADUvFMOCEogZtdlUSaX+gOzCCN+6dOMA2ixqLrzKWeE/rpmavX3gcR9r3RDtB43BsKldCMBoSVRGYw8mVU7t4qoualXGZ96zD7hPLUKuYOrzVxDItxywLBGhE1LctjQ539BKh0GbOhKMnR9k/X1E15cLskAlJCTj2kkNjtktBEJXuOS1JM64oB/FaCZUY0i9MOx+ijdMFzDpHlWufFXHebHeqh3XfywREB985h4yTQGukOZLfNvzdagMXbigD5VBwqOT2D328459ljs9Ss5akPoxROczvEc+ubXTOULqZCDrAfpfQewQxauhX9uusWx2PXvoDREFNiFBJHhuv5t49falTzxXpfEwVXpidBKWcEKft58hMClhZKTsv4tn0C3NObhhR8HS2abKrl6lxgk9BngVgJz1m+N3DZFJK3ZwwA0dV/dIAnZhOYu2X+9j72LbPIN1t3CWtHJCL7CbpljaRl8pJQXO0/DY7djovSdMtj5tTtVRADOtDqOtx7DCiuvt7HP2bwMJvpyBHlf/FNuBuMmNWQgRexNfdwJ1/bWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(7416002)(5660300002)(83380400001)(41300700001)(8936002)(26005)(6506007)(186003)(53546011)(2906002)(36756003)(2616005)(6916009)(66556008)(8676002)(66946007)(66476007)(4326008)(38100700002)(6512007)(31686004)(316002)(54906003)(86362001)(6486002)(478600001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVNBUUJoN2tOVDd1TVJ1VHNCdEdoZnljUFFzYlVWTE1UUldFeXZ1TmpCaTFp?=
 =?utf-8?B?YUxrc2xmM3F3L3FJN0w4RTE1NFdhN1J4ZlpBR055R050R0ZlbzdiRGJ3RXU5?=
 =?utf-8?B?V0J4TmU2TndBbWpZTHZDQWs3TUdZdEpScWNmOCtyRlVzNFBTN0RRdzZQTFJT?=
 =?utf-8?B?N25uUllDWkw3R2hWdWZWUzZaY2Vtck9ldmRPM2NyUGtLYy9BZFlGS2Z1bnh2?=
 =?utf-8?B?YVpVSXA2UzZscWxvejdUS3p2RnM4V1AwdzRiKzZKdGZMam1lY1R5NFFvdnhl?=
 =?utf-8?B?L3NRVFd6Nll2OUFuZWFrdHEyVHIzZndDTURRQ3RWRHBnaGwwVnNEQUxBZVV3?=
 =?utf-8?B?QjYvM3h3VDZrdmlLWFhkSkJNczhMd29CYUswSXBFc3MvK0tCaVRIM0htbFdU?=
 =?utf-8?B?cTdnWGpSTUdoNUFwbkxtZ3EvZTYzMW41bk42RzBKRTZjcFlCeFo3Nms3ZVFj?=
 =?utf-8?B?ZnZUWHR3M1llNzV0Wm1PczgwVFdha1ZjRmxrRGFIOWxlTEFkREdIK2ZlRlBl?=
 =?utf-8?B?dzJQV2szNVRUOTVWTkJUbXNTV216MmRxckdTeGZReVd0TjBWWUtYSkhDV1Ux?=
 =?utf-8?B?NGhwOVlaNlh3dGJjam9oeHRPUFhlUm44Mi9IMFZqZEtabnZwR0V2OFBJMXAw?=
 =?utf-8?B?SU5BT3FBM3R1TlFPQ2pTeWVTa0V4R1JmQlNuQmQ2Y294Q0VydVpBTjlOemZ4?=
 =?utf-8?B?bE0zaXEvNitJeGRZdFQxMGlZVDQ1ZVQwL3NrMm9GVUNNOWh1TEJQRVliS1Jz?=
 =?utf-8?B?NnpSSWtuUkhDU2lHLzYrWGlEajBnc2J5VmVNeUxoM0w3cjVCOVNiWkxrdXJE?=
 =?utf-8?B?UjE4dHRHNlF0MjFSbjVBYW9MOXNZWGpUYTI2VDZYYUFiSnFxSEkvdzlHK2R6?=
 =?utf-8?B?YUlUTERNUW5GclJxakdwMERhMFpFQ0s5NW1MSG9xWHIzTDR5ak9teDZKdUMy?=
 =?utf-8?B?TGN4eGhHeFZWVnREdVp1STAyM1ZKMFFZUld4bDl6RDZWMVVzMHJTZ1pSaDht?=
 =?utf-8?B?T0E4R0crdEcrM1RuRklJVEVDR2tzK1VjNStrQlZraUdrSitQRjluODUrY1ZO?=
 =?utf-8?B?MVRKbGozQmF2Z0pTMVFyVjg5Tjh3ekVSQkc1cXYvMTIrTG5MY21lYmttWTdY?=
 =?utf-8?B?eElaTE9VNUJiVmdLYlhXMjVmRkdSQk05VFRldzBSWUxwMHBTS3VqYXJrNkdC?=
 =?utf-8?B?b3p4K3pkMlMvYXNkNlBRUFBDUWw2L3Z6T3hLcS9nSTlBV0NpM1BnMnpnTjRP?=
 =?utf-8?B?Rk5TOVFCQ1BPQm9lSVp3MFduUlNldWRwNDc0QkZDdFpiMUpqMXorR0FsYXV3?=
 =?utf-8?B?K3VnTVJmVVMxRXp1eSs1WjZVWmoyRUJBNlFSbzRMTFpHL2g0ZVdTTEpnSnY1?=
 =?utf-8?B?Z2ZwRkE0My9Md2FzemhsWXBhYVJCaWwxYU1qRzhYdXgvc0RpV0RZOTJ2YjNo?=
 =?utf-8?B?WHJaaDAyTFVERFNlL2FuaE9sSVBlOVAyaXY3RnVGTC9icVpDVTFFa0hwU0c4?=
 =?utf-8?B?dThsWCtSbkFSNU5iZ3FPczhPYU9kWnFGeWFFUjZza2MxZFBJeTlVMUJnNmpq?=
 =?utf-8?B?QVovQzBGRWVEdnhyOGVHSWJmTTRCeHJHVWNIbDMzcHlOUEZQdFRCNy9na3cx?=
 =?utf-8?B?MzNmTUhib1ZvbGtJQ2lXd0lRYnMrVkNNSlRSSFhKck1xb3dKOGtPek1ZVyt2?=
 =?utf-8?B?Z09ENzdYK2FZV0xGaE5ENFU4RlZQdEQyMDducFpYTnBOUEFxYkNXcmNCazlJ?=
 =?utf-8?B?WVpjdXdPQnJIdllZYTF4S1dSTnJwcGN4TWtIekJPTGJVbjYreGR3cXl5SXhm?=
 =?utf-8?B?YTZXOGRqRzE1UmsvZmdiVHhIY0FsVGI1K0I4MStJWU4rUlVReEtXaURQQW10?=
 =?utf-8?B?OEk1MW4zU05lWW1xbG92T20rL25HS3BFVnVwZ3dlSktNb0wwTnJtc3lBWDA1?=
 =?utf-8?B?b3pNMTVXWDMybmJkb0lKeSs4NWM4RE9VTHE0MW9kMWdRcDdHalBOMzQ1elJs?=
 =?utf-8?B?M0tiTmQwY0dud3IweVo0SkMzQzVNNExJb0IyZG5lZzE4L1ZldnVKMjMwd2Fo?=
 =?utf-8?B?bnhEemp4ZkY3VTFGeUp2QThQaEw1UzdPb3BCMzRFanV5b0JGSUxDalIzYUhl?=
 =?utf-8?Q?AMq+AhGml5UaelHm7e1TPknge?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17c6ee3-0493-4a23-8224-08db19ae2775
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 17:06:38.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oCqg/F3TBpJB3od70t4h4iVefviJC9DuhYl2ui6eboAz6q5czEAL6VlD8cxRIPTcHq2CoM22bMYNB47EJ/PSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7922

On 31.08.2022 16:11, Volodymyr Babchuk wrote:
> Prior to this change, lifetime of pci_dev objects was protected by global
> pcidevs_lock(). We are going to get if of this lock, so we need some
> other mechanism to ensure that those objects will not disappear under
> feet of code that access them. Reference counting is a good choice as
> it provides easy to comprehend way to control object lifetime with
> better granularity than global super lock.
> 
> This patch adds two new helper functions: pcidev_get() and
> pcidev_put(). pcidev_get() will increase reference counter, while
> pcidev_put() will decrease it, destroying object when counter reaches
> zero.
> 
> pcidev_get() should be used only when you already have a valid pointer
> to the object or you are holding lock that protects one of the
> lists (domain, pseg or ats) that store pci_dev structs.
> 
> pcidev_get() is rarely used directly, because there already are
> functions that will provide valid pointer to pci_dev struct:
> pci_get_pdev() and pci_get_real_pdev(). They will lock appropriate
> list, find needed object and increase its reference counter before
> returning to the caller.
> 
> Naturally, pci_put() should be called after finishing working with a
> received object. This is the reason why this patch have so many
> pcidev_put()s and so little pcidev_get()s: existing calls to
> pci_get_*() functions now will increase reference counter
> automatically, we just need to decrease it back when we finished.
> 
> This patch removes "const" qualifier from some pdev pointers because
> pcidev_put() technically alters the contents of pci_dev structure.

I wonder if you have so few "get"s because in some cases references
would be needed, but aren't being obtained. As a rule of thumb I'd
expect any entity storing a pointer in a long-lived data structure
to obtain a ref first. And we have quite a few struct fields pointing
to devices. I'd also expect a reference to be held when a device is
e.g. put on a domain's list. This would then likely mean that for
example in deassign_device() (or maybe pci_add_device()) you wouldn't
drop the ref in the success case, but instead the ref would transfer
to the domain the device is added to.

> ---
> 
> - Jan, can I add your Suggested-by tag?

Sure, why not.

Jan

