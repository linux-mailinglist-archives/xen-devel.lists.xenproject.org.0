Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA6397576
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 16:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134896.250866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5Sp-0006NU-Tr; Tue, 01 Jun 2021 14:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134896.250866; Tue, 01 Jun 2021 14:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5Sp-0006Kl-Pn; Tue, 01 Jun 2021 14:33:51 +0000
Received: by outflank-mailman (input) for mailman id 134896;
 Tue, 01 Jun 2021 14:33:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lo5So-0006Ke-0X
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 14:33:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adde564b-427a-4b6e-ae3f-0c35ab59406e;
 Tue, 01 Jun 2021 14:33:49 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-vEedeJqRNZuSiJn43XEciQ-1; Tue, 01 Jun 2021 16:33:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 14:33:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 14:33:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.11 via Frontend Transport; Tue, 1 Jun 2021 14:33:45 +0000
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
X-Inumbo-ID: adde564b-427a-4b6e-ae3f-0c35ab59406e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622558028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPcPwxps5kyMy7X8TpWBhD/PnI8UMa6lr20ghPnD918=;
	b=fJCDwD8PlHstsEBBKmG0Yp7F4j6y9TKLrMMZMYsk2quEjsX16cji5zgGDI8sW2LsLVIF7l
	bSQZeJT97r+cvZysb2/IW60clJhrvOnEb4V64S3m/xDgDcoICjZ2xX7FeUPX8nKx87f+oh
	tHU09aV/W+8P2eBILDBTU7BAsghq3k8=
X-MC-Unique: vEedeJqRNZuSiJn43XEciQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I02Qou4eiuomiTz+N8vP9AQcCrXJme7566hUmkDcxlxgxI6I4YAyHqAFFM7EmX5xUYRPli4csDaVu+BxTcDLZT3dsf1N7UsT2XFvxBgkZWHP4ilA8ExiIoPxtU3o4Nbu6Vg+ep4w6XtXJftEFwiTk4koNm2Kk1eOrtefGi4+blUxd9etuOBlZzdEWD3Wr0F32tsJlhLtVkdok2okPvqJR2XyMBE68TTdWQMAYNrOmJexRB9ooUIdA+Kt+9cvHzIP6t7cjSx/VlaifEkEPFT8PcnIRfI5PS1JSa+ZWWGVkKAH9XyU0lfnchVgehETa1+FwBwJzbi0kej5NYlRuH856w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPcPwxps5kyMy7X8TpWBhD/PnI8UMa6lr20ghPnD918=;
 b=Wf3wq6h2uGFgTB7YBHCtDcBRrkbIGxs9Bef1eH7JVaHwYUVsSa9IL7++2t8nt710nLmXj5HODL63oLrPV1QUMioAhEGAFh48lTTzmXGK+Ugi1apzQC3DTmRP6IwNCgznHnlc0xSizfFZEw5JhaqHORkCad1gRHLfBLkdb9qyuOcWJ5j4Qt6rAvkuYBV4ZzhqQ4G3FaUOUiDDcX/CJXAhY/fy/HTLxoFmrZFSWQpso0Rj5poGIE/OuB2umfGIkA/fuZfGrADGf3EsRezoYNURQQXzAq22GvP4aU29cPJiN4TeDbuhxcdAJa+totp/Z4+BFIUURnjopKCBytWiu+3i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
To: AL13N <alien@rmail.be>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
Date: Tue, 1 Jun 2021 16:33:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00cd749e-a20d-4832-ffe5-08d9250a42e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039692DEBEA3B7BBD4017DFB33E9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qk1cXsbPA3TFb9Ab/5KjyoKHURdeYuElCIqlv0FP2piRAL4VE33CAEVC0zCfSU3TJrxt8NVMgHNXtOwz5eyQ0gN+yTnW1xK/R5DFM/qHejMwQbdV/FmSuaennvCFV67RZsK6Uq5U42H6q11aQ+3tObB9YLB3mAB+Vst5EdgXVHa6mzRVvhvjo06d6j22UL8+11If1dCkxLRoArhB8oiiWUy5/tjErw7fX05u1CcR1EXRPxL7nO4fYabgGpoKto2groPAd6Z14XreoAov8KrEbyaakAQC9nv7fD4A1/6tdB1504z108DxVhGDnKm4tV3mvC4dVQ62em7ZbqRwM8Y4kfZPb3/Z6Mto8+qI5D4fDU2jRSYpLOVand5Jz89TnHDJj+a6hzeNvLIIXtGN4i/bxVpvvvldtQ8q0mvVjh61thj3hXgNRtrmWSdwJS9A6X62Ydn8gu3amLfQfF20iiR4Omrm+5drEmG2D0PpxxQfxcZFQeVYOfWmWj2AkTXxzl5DRSQCMt7w14B+Bky1paGXp7j19Qz+XKebb8wYBcO98UN9B97HNrDk/PvbABYd8848VQioWN8d0oi3W0O9RzMKNm1rN2fqlfaQapVyq7V8FPBS6M3nedgiwPvdbcw0YXJ0tiuBliKZkLJFXbuAvDNN6OQp2RUq/puttd8ibXr/VaP1/IpOFuqJcPiKY8xZ+oS7DKYGQ3doeaEjYnnpp2lL787vuJn96y9HDLlo4vFFdP+s7tgH0kRGSwEms9UnSRsQaC2wmQkQ0dnztsJjFfZZzxYgvoolGdVmVjNrrEMQP0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(86362001)(66476007)(66556008)(31696002)(38100700002)(8676002)(2906002)(26005)(66946007)(4326008)(186003)(16526019)(53546011)(966005)(5660300002)(31686004)(2616005)(36756003)(498600001)(8936002)(6486002)(6916009)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?enlwTGVFNzFWbldwR2pPdy9xYVBLNEl6Qk1VZExVc2VRcGtZQkhJUkQ0b3A1?=
 =?utf-8?B?eWQ5Y1RTSWpGNWNZanNBbkxvVEZFbTErcU81R2dHS3d3ek9TdjcvdnJmTldR?=
 =?utf-8?B?Qm9Zd1RNaTVRMG15MmVQZHdiUzU1MjhVYThFQ1hPRDB5YlFtSm8rWjgrWTFl?=
 =?utf-8?B?ZFIxTCtqdmRRQzFlN2NneW1lVlNCU1VQNFQxMXdvTDJxamFVYnUrUERUWTA1?=
 =?utf-8?B?Zk9mQUJtYllkTmNCRzg0SnBEdUwrUDlWZ1NpaTljSjNtK0FveUNVWVhTc1hS?=
 =?utf-8?B?SVY0ZlJxRS9Nb0hUTlNxbEwxV2dIT3RFMmxvZVh2QWxXcGtzdjR5MElKZTVX?=
 =?utf-8?B?VnMrRzR4bkI3ZS9EMmcxdFF5a1pvTzJIdHQ3U3BHY0R3VkluQXpkanhGb05x?=
 =?utf-8?B?WHFJb0JZV3kxVEU4UGlOQSt6UHZHdDl2NlhwZ1FQd0NuTnA4ekJYVzU5QVJ0?=
 =?utf-8?B?eUVlQXFtc3M4dnRqemo1NmVrczRpUVQ3bGoxZW53akN0RHJ2TVdhOStPL20y?=
 =?utf-8?B?MElCM0Y4SUNldSt6eXlyM3k5UlRBN01FQU5TY0w3bi9SMWZxV20vZHBMKzMy?=
 =?utf-8?B?MlEzVGlEa2hScFRVWjRDbHA0bUF3NjNHQWpqSGRaZ3NrYmxaUWZTemdIVE8v?=
 =?utf-8?B?a1padTNudUhCcWwxYU5JTy83UmZlOExHeHp3cTV1ZzZnUUt2bGhmSVQ4VUUr?=
 =?utf-8?B?aWhtVUVXTmxKSEtBRDkwbkR3dUl2S01iRjFSbWxMSjB5WkZVWFVNdTdGSmlh?=
 =?utf-8?B?SGNDQTUzNDNhTTZTTFJEYWdZV0F1anNPaXdYZVdDQmQvSmdLcjJ1dnNWa1JM?=
 =?utf-8?B?VndVS3Bhc3VGakxoVG5WcTVYb042NjNSRWEybFNNNk1hVXJaaWZybnN4aUdz?=
 =?utf-8?B?MDJLMm55UlA4NUF4bnNDa2htalRQOGZBVmkwWUYzSDVBdnd1L3JEM1FROVdO?=
 =?utf-8?B?cUVNaVIyUWZnNndGcjlrQ1R5akRTM1VKeUVBQ0NnbzRQdkVBV1RVS01aRDli?=
 =?utf-8?B?N0FhQzYrRFdHbTFZd0tnMEZUQ0pSVlpESkdvRE9uTWxIaElDeXY5aldQWWdW?=
 =?utf-8?B?S3pVS3Y5T0pSdS80VVdad0ZzdCtnTHFpSm9VY1Z6ZVR5UEgyY3lQeXY2cFo2?=
 =?utf-8?B?SWRNUXNqbTVJcUVxUkJYNjI2OFlHaUdQZGszeU5jdHFrcyt1cDlNR0ZpSU9B?=
 =?utf-8?B?V2JHbVJJQWFOZnlwZTNYSHdGQ1h2eWVGMGE1akFPeTJaQld5TWlRNVZqOGc5?=
 =?utf-8?B?WGErVVBqT1ZtRmdJdEVHaGl3NlZITFNJT0ZYOEJjakNNL3MwN0xsSjFEQUo5?=
 =?utf-8?B?TFZTTEp4UExpZVJzdzc5NHk4NVkvN2xhTnpUMFFyREpCR3MxdUZzeEpDK1hm?=
 =?utf-8?B?bFBVMVdkdGdHZ1JBVjhIM2srdm9XalkzVzgyMkkvcUQwbWkrU3NFSlh3dnlI?=
 =?utf-8?B?SHBtYUJ1b0FObGQxV1YrRGtibklxdU9IOFAvRFJXMXRGZUkyaEY3c3dDTFpi?=
 =?utf-8?B?TWRkL3RBL0lYQ01WWlZjZ2NyREY5KzQ4WVhIVGZaN1MvZWxmL09hZTUxc2xK?=
 =?utf-8?B?ckNpczhlODVnc3FUVDFWdlBROVhobE9OcmZybElWUVV6V2ZEcHlraU5uVFBa?=
 =?utf-8?B?L3JjQnRKS2ZNTEllYzBPc0lBWFFwVkV2dWhnYlgvM0JDanNlKzZRTVZEQXQ2?=
 =?utf-8?B?VXpEdkN3d3U0a1l1bnRCRUExQmhFUWVwWXNIM2E5TFM5aDZtVUNlNkdFejZF?=
 =?utf-8?Q?jJiMd50F9rv4y2ycZArAqZxXkz+AKzsHe397LWb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cd749e-a20d-4832-ffe5-08d9250a42e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 14:33:45.2958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLZTEBwpnzyOLXAK+7Axox02lH/m4dyofCwxFsT05bfUmMSEPNGbcdLE2Hy+5hHXOGaHdIjIH3EfqhTx1zrGZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 01.06.2021 16:06, AL13N wrote:
> Jan Beulich schreef op 2021-06-01 12:08:
>> On 01.06.2021 09:36, AL13N wrote:
>>> Not 100% it's a bug or something i did wrong, but,
>>>
>>> with xl create i start a PV with 3 pci passthroughs
>>>
>>> after wards, xl pci-list shows all 3 nicely
>>>
>>> looking at the domU boot logs, pcifront is only creating one pci 
>>> device
>>> and lspci in the guest shows only 1 pci entry
>>>
>>> in at least 4.14.1 it still works.
>>
>> This reminds me of my report at
>> https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html
>>
>> Meanwhile the proposed pciback change has gone in upstream:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/xen-pciback?id=c81d3d24602540f65256f98831d0a25599ea6b87
>>
>> I wasn't, however, aware that this may have been an issue going
>> from 4.14.1 to 4.15.0, i.e. something that was presumably (as
>> George also has just said) a regression in the tools. Or else I
>> probably wouldn't have suggested taking care of this in Linux.
>> Nevertheless you may want to give that change a try.
> 
> Well, both tests have only different tools en hypervisor, no kernel was 
> changed between both tests, neither in dom0 or domU , so, it might not 
> be pciback?

Well, if the problem was introduced in the tools and this having been
the reason for me running into the same or a similar issue, the patch
may still address the issue, even if - in case it's a regression in
the tools - it would have been better to also address the issue there.
As said, when analyzing the issue I didn't have indications of changed
tool stack behavior, i.e. I assumed the problem would have always been
there.

Jan


