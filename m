Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F648A833
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 08:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255618.438069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BMe-000347-AI; Tue, 11 Jan 2022 07:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255618.438069; Tue, 11 Jan 2022 07:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BMe-00031T-5z; Tue, 11 Jan 2022 07:14:40 +0000
Received: by outflank-mailman (input) for mailman id 255618;
 Tue, 11 Jan 2022 07:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7BMc-00031N-Pl
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 07:14:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218de39a-72ae-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 08:14:35 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-Br6b7TnYPcKwEWXcymG8Fg-1; Tue, 11 Jan 2022 08:14:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 07:14:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:14:32 +0000
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
X-Inumbo-ID: 218de39a-72ae-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641885275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA8OEqcZNMHPSENVQPo9047qeVa8zMHzMn+l7773h6k=;
	b=F8e32V9L7w1zZSVlnrKLB2Sq+N1Xz/qNIYLUaK5Vy/8tJKhKGkf1j9KFUBT232QH7oGmhL
	mLkfO1h/MxWNRkJ8/Xy8qz4qp5kbfn5YVWIXxCgxcEzrYhaKfXUcau/Zytv3WimOEG9e5q
	I3IdhbAXcIY1aB1mHm7yeQsiCxTsVZo=
X-MC-Unique: Br6b7TnYPcKwEWXcymG8Fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXg5/mepHG7flNSMQU0GGFIj4DgOFeLz92jreGOiTPPQ0TKJu9VyYf14tIvEX1JYpfJaXajJyghHbCVBIFHlk3jSANC5P6XOtaXBlY2vfM9TP6A5nIWEtjAtgbh6B6GxxLQOr1jth7tCq3cVJlvoV6oMqHaiTNjmhrJB1Hqdk29TZgRlZgq4xvU44ESsFYvQuPXTWl4af0uoj8coN4+DAgtUwTLoF9Ab5+xI12s0RtAjQor/mt7A/QSHnrlKVS0EvBEr0/iXaMT6TsILNKCrpcgSB5tFtL/qp1oKf7ftiVssfj+6Q8LBJ8XPnjkbFRe6nbvGhvblugrp5u65wFIjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA8OEqcZNMHPSENVQPo9047qeVa8zMHzMn+l7773h6k=;
 b=F9jbEaC44uKqaSHgXOfdxqQNtfg6gpcbFGXR0JiQhw2hWBuE9P7JeuP9xZpFVjLEw6nin3hu46pb38M9anHLUzp44BDZAC4ftSXO+hLreq4gB5KVhsp1CHnQuAUq3Xu9N8AMqzv2MkFbcU8ni/xfXbTHTxb6kDZaBMzwxx4OAf+6/GSRVhbbAhfE1oiVgGdCzwiYyJz7+7MfMg6kjuNK9rZ4DTluPtxmno0IRUBhkHATlny8zddaI0MaZmkvBs2WHocqBMvjao+aFytpIQ8UcliM9er3ocN96mRYd/bESO8ySO58K3DpTIc1WV4og20qXWEMcw2hJxigDJZZGAkQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <627242da-78e2-913f-33a4-4ae7fb94664a@suse.com>
Date: Tue, 11 Jan 2022 08:14:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, Bertrand.Marquis@arm.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-1-sstabellini@kernel.org>
 <f3baac82-0eff-f885-f03a-ba987c8e12b6@suse.com>
 <alpine.DEB.2.22.394.2201101458520.2060010@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201101458520.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac43e015-dd8c-48b0-f193-08d9d4d203d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57427BB09D2F322F8CE2B04FB3519@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zoIFhDb0oQPhLYUIuxlb9+w1/5AEaLcmCfn9WAp290zqCe4r4aXSsHQ1lR+jEe2FXT4bP64jNiq9HLq/krzcXLwb/7Hfr1cDuvrrLcCFU9df73jq/p/OvZxGauuNidylTV4XUc//ksKvCxt9LiB0m9tRBF6ethFFySqtuNUyqHuN8H89aGChLJ4aVtdGCHbWEDY1mce+/z8mlgU6i/iidUSeRFlZFkx9GRdmnOZs6x7n6Kw+UBII7pecZw/rVi/IwdyjxcbPfhXsdNTi3egF0z2VH9cFIb1rJ65Do0Vqw+CkRsXYy3kYuSWyCxoshxm/BxMfrk8wse8SpJPAUABFucCrSuH1/7heW7afqaD2MyQVFI+0kwsaW9Ctx3f+MsgYj5M42F9wndNILbRsuFOVHlTV0Exax5gFJURKIUUcDzZfQJd4VtknrrSyUlStsa2pYTPoObtVsCJ3dF88vNe/TFD82ZLaXfP6wd0nTUI2IaiC6JHMDvpvnuRGMKH7RN6PZlNEoGF3NHb9R+E70SfIIUKbtpgcZqiKjnu693541WdTcCDL9ukbeI6rtLMKCo6Ux/PsmGSCXULBaImiSka5SesOMb54FW9xasd1NeZ14+cTPM0oapJEmqAi7pzni19fWsIPuuBh6byq2DHFIgYXUIi8FG2JduzSnWDHUkoUxAvQbBqbEedsiBsrAJZOJnOZBGftOIXsvRnEccqWkIojUoGPzVUFSpoxuMLyuARzz/EjeCoLJQSb8kzEGdXeFT+R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(26005)(54906003)(508600001)(31686004)(6512007)(31696002)(8676002)(5660300002)(83380400001)(36756003)(4326008)(2616005)(86362001)(66476007)(186003)(66946007)(8936002)(38100700002)(66556008)(6486002)(6666004)(6916009)(2906002)(53546011)(316002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUN6b2oxYWROTzNScncyZjdZSFQ5dGhYcThwdEFzK0pLME1JQ0JtOUIvdnRD?=
 =?utf-8?B?ZXQzdVBWQ25WWUphb241dFdXSmtoQjZhN1FrQnorbXNoMTBFZlcwNHlJNlBp?=
 =?utf-8?B?RWs1b2ZETlBkTEdYbHA4aVlDZGtUY2FHWUxPd3hFMWo2V1NTbEpoRHdmRjhZ?=
 =?utf-8?B?Rm0xSENFVlc3UGlMNGVQblk0NGFvenpuUVkvSU1GRHdxdXZGdkJ1NGRINlA2?=
 =?utf-8?B?S21uM0dPRzhJb25PeHU4ZjRhaWh1dXpuOWdDWjZSaUc1ZjRxVnZKUXFDa3dG?=
 =?utf-8?B?cnpVOVJGMHp2TGhyckFNaVNDbUo5eks4SkY1MExrZ09FRzlMUS90ZDRVdXdI?=
 =?utf-8?B?QWsvSE9CNmFWRjdGZEhLeHFXZktFVWIzZk1RUm1EOWd0cDY4V3ZIU2t2NnVS?=
 =?utf-8?B?OEdDWC9wWGlmUjdXSkpoYlNENmt2VUt4aXl6RFB1TUNXL1UwYUNyQW9JQnVZ?=
 =?utf-8?B?QUZ5VU51SEpkMldZaks3R2JURVREVE9SamFla1k5VVdFQXFtakttQjEzVGdi?=
 =?utf-8?B?dUk0aCswZUxBN04vRGZxd0Qwa29UOFMzWGx3MVl5Z2tHK1NYb21sVERSY3Jk?=
 =?utf-8?B?TnlFaTZwYlpTdFNXck9wSW5pV0szTEZwNUhLazUvNGRLWmFJMTlqL0xIZmNz?=
 =?utf-8?B?SDVJMGVicDRmbUpKcDVkTWg0ODU2Qmt4elhPK2JtaTYwbUMzbFk5Y2ZRTTNF?=
 =?utf-8?B?V0M0ZU1PcGVXcFQ5MGpDbTZGWGRONmZaTWZPTmFGVnhiRFZnckpZazl1b1dx?=
 =?utf-8?B?VkhwUkdyV2pQeWFsS3ZkOHZacG1nMXA5TW9zSldwdzcyQW5OQnQrb0w1NjhU?=
 =?utf-8?B?MmhzVFpqNzN4TUc0cDNUUzNITjQ4ZFZwU2dPTm80V0dGTnJYNkRWZTRRUHdJ?=
 =?utf-8?B?UGNvK3h0RFk4aDg2c1piMmYzRHBkOVhoV2cvMzYwei8xeHFid2tubi9RdHlO?=
 =?utf-8?B?eHg1SGtLQUhnajNrMVQrN3orVEtkaDFxTVkvNEN3dU9PMFJLZVMrOUtyN0hL?=
 =?utf-8?B?Zk1LL0JGR2c2SnVvL2w0eEp1Y2txeFNPdXBEMGY3clBtRkljTEJHbk1LMUJS?=
 =?utf-8?B?Ty9CVEc2UzN6ZjRXNEVObGtqL3lHMEJvOU1NdGRQSXZGcnBxMVNIUzY3b0pJ?=
 =?utf-8?B?VWw1MFhheGg1cmo1TVlsTzZWejR1T2VrVndid0huYVVMb3RNWjFEWWVWRmo5?=
 =?utf-8?B?eDNPT3VBUlJJdnprSUdEOTI5VysyaHZLRjIxcXprbUM3b0lqUnlGVjdxSElw?=
 =?utf-8?B?S3NQOGRFcmhpTjBsNlJ0aXZWdU5nTXFTS3paVHpYcnpEclZmcHNoaDZ4cEt5?=
 =?utf-8?B?bHJ1ZEt4NS9tbEMvUTFoa2hsR08xeTRyeitpMS9BMWdUQTVHbk1WbGdKTk1p?=
 =?utf-8?B?Y1dWNUlHcGY5SnVyU2J3Um1mU2ZuakNiZU5Xd1Q5bnQ5SXFCS1V5WDVVbjhP?=
 =?utf-8?B?Ui9KaUlWU2ljdjJRT0lzQXE3NVVkSWdsNmJVMjk1OVJhYkpxaVFraWZUZ2tB?=
 =?utf-8?B?bXJFTy9LNklWU0o3ZTVSRVRCKzhtN0RIemNyUlhkYnloWlhXTWp3bkdETFFW?=
 =?utf-8?B?OFNBVDlSQ21ubzVFaTNoczBRN2JkNCtYbnVMUjZOQXVzamkzSDRENThkNHFD?=
 =?utf-8?B?M3hoUEMxRnVmbHYraG9ScDVQMTN2dXlnVFc3YXFkcEtvM05jQWsxbUJoZWs1?=
 =?utf-8?B?S2pkZUJoSktwNGI0bGpHUUxRK09SMWVrVE1NZTNhdldad0F5ekVwdWVQTW03?=
 =?utf-8?B?ZGkyVWhRQ2U3ZDczQ3B4Y0phdlV1ako4bCtKWmxOWGoxNFBMOHNFWmI2MHV3?=
 =?utf-8?B?T3lnWm5pVTRpdzlQZXI5OTZWR0tRM0pMRmlHMERqNTdFOFNnS25heHp0OVJz?=
 =?utf-8?B?WDUyZW5FUzYyK1VEbjIvdlluQnZQSzYwQStnZ2tuMGxiU2w3V3p5VVV0Ylk2?=
 =?utf-8?B?Kzd0K2s0Q3JIWUNyRzhQK25JbDl2eUxsc1VKUEQ5RlV5eDFwY1JQamhqKzdk?=
 =?utf-8?B?RlpnLytQdUs4YzN3MzZOZkVLOFFGTStPcWJneXBXS2xPazlEd21OQWhTbTUr?=
 =?utf-8?B?eGJmQVY4bXhNVUVzVk1lalRGTlAyWEhtaTBKQTljTndxVjZiMVJuenBDeUw4?=
 =?utf-8?B?LzJ2OUo3bSt4elpWalhWMnkvYndUQ2ZheDBuYm5sangzQWt6NytvY3A1Tmhq?=
 =?utf-8?Q?5a61aTw7ozUi1dIKIDn2UDw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac43e015-dd8c-48b0-f193-08d9d4d203d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:14:32.3719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN1ulMGxE1UYTkQbYIbsXskKJrPL5AaCGVwa6RrXdfI3fZ2RYMbX2YRWzNzRcowe6iR7XXL+o7dmNtDxrHiWDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 11.01.2022 00:08, Stefano Stabellini wrote:
> On Mon, 10 Jan 2022, Jan Beulich wrote:
>> On 08.01.2022 01:49, Stefano Stabellini wrote:
>>> Introduce a new feature flag to signal that xenstore will not be
>>> immediately available at boot time. Instead, xenstore will become
>>> available later, and a notification of xenstore readiness will be
>>> signalled to the guest using the xenstore event channel.
>>
>> In addition to what Julien has said, I'd like to point out that Linux'es
>> xenbus driver already has means to deal with xenstored not being around
>> right away (perhaps because of living in a stubdom which starts in
>> parallel). I therefore wonder whether what you want can't be achieved
>> entirely inside that driver, without any new feature flag.
> 
> The fewer changes to Linux the better but we couldn't find a way to make
> it work with zero changes.
> 
> In a way, the patch for Linux is re-using the existing infrastructure to
> delay initialization, e.g. xenbus_probe_thread to call xenbus_probe
> later.
> 
> However, today there is nothing stopping Linux/HVM to continue
> initialization immediately except for xs_hvm_defer_init_for_callback
> which is not applicable in this case. So we introduced
> XENFEAT_xenstore_late_init.
> 
> As I wrote in another reply, I think we could do without
> XENFEAT_xenstore_late_init if we instead rely on checking for
> HVM_PARAM_STORE_EVTCHN being valid and HVM_PARAM_STORE_PFN being zero.

Just as an aside - as discussed in some other context not so long ago,
HVM_PARAM_*_PFN being zero isn't the best way of expressing "not yet
initialized", and hence you would also want to check against ~0.

> But either way as far as I can tell we need to add a new check to delay
> xenstore initialization in Linux/HVM.

Yes, I can see that a Linux side change might be needed. But isolating
the change to there will be much better than needing to also have a
Xen side change in place.

Jan


