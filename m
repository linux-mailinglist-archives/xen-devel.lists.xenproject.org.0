Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EA469D2F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239250.414691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFs9-0006h7-7p; Mon, 06 Dec 2021 15:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239250.414691; Mon, 06 Dec 2021 15:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFs9-0006eL-4s; Mon, 06 Dec 2021 15:25:45 +0000
Received: by outflank-mailman (input) for mailman id 239250;
 Mon, 06 Dec 2021 15:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFs7-0006eF-Oy
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:25:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c67717dd-56a8-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:25:42 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-00e4U4wAOVilkXoa1t_zGg-1; Mon, 06 Dec 2021 16:25:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 15:25:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:25:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 15:25:37 +0000
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
X-Inumbo-ID: c67717dd-56a8-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638804342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kr0cj4QOEF2tnC3drtQqJd3HaRInyWKrIhu6JAJnMws=;
	b=NQAi48EX0b4KsyjD4oAFj0NuTxrUgKkciVAAvBlCUpMWfJ/ZT5JwBlENhrFpmUOBOTkC2C
	rMSWBSnQZlbxL8V8gN5a8r5jPQuKUogHyYHQLZIFPzsL8fiH73G6AfmlI1iKs9pHJz8FYm
	4sMtwua4l+g8YNFNEgqC0Wj+IpcLIhQ=
X-MC-Unique: 00e4U4wAOVilkXoa1t_zGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUJuk3mlGQSHSkuAwAspG1I4X9/TPv4gc3YW3IHaxk+PgRmQNE1EaxNdWF9tDgFzVWYXh45sKrKormgmNMEaDkSSsJkCFKfoViiQqDdyHPA0ulmrSP1MEsCSm0V7VcLbUa0kcbz+bdnuAt/Ly2NQuoVFZFe/JZ2ojX9i24U8oFcN2lY91qgGCuo0gtRbMXRsQFFa/2p3Po/7KK1Xc+AYzJ5I66wTPIuE1j+uWCC7N3kivWSeXvSD6R7lkVmXHAR6BuvJ/y45Hl4zSnkBadlEY14fNAzhZKiRVNzjOZmkQHp8OLRA4yRIxPz5ILTspHyRPEikPeUXkOVvkuwOO1yEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr0cj4QOEF2tnC3drtQqJd3HaRInyWKrIhu6JAJnMws=;
 b=KkBZ71fy2uK8RPvAlw9sq+MOPb2RKhXb1h6jYwStEgJgViOtb+d7WzLHI7Hf9celDyzFuTjk5qAvrE+0HCBUvvN1XQHgNSfZtZBmiAvLazSoyBTfKGLNOLNOypwoeKpdJxyApGWfuwCJjSxamHzAMXUF3wguu5YJB8xTIVCezSdTywc338vKFpwyB7dscocjhC8j0EsXurfKGahUSZGgfhR31qc/qMCZQKc03kbQz9bPJ8Kqatk8wL9Fzuklka07m5O42qC9zKlqsMg4x3Rc3zlMaeFDS0V7LtVw/2YLUnLcAvUvlbge7E/W1JO4LV17Do+lNtT8yOev6BWqC3WJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a7c19ab-5454-fa04-f167-f94d56398b14@suse.com>
Date: Mon, 6 Dec 2021 16:25:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 03/12] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0541e1cf-e823-4222-c290-08d9b8cca818
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191E10001099CBEA63D4FC5B36D9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wRR9jZ3FnasPEQqBNNRJuh1LxNqolZfsamz7gQkYDQP06ASOXAoC9KP9alusRzoh14g606YzPDSsYPm6JLlXNfHQTrXj6U5J2T7g/s3yfdY+XWiSaLnLbT0kEqAvrk/sviqx/IE0+PoY9UScmICZjot5ADsYCb2aaDigtFR7aO471xRryymFbK3nyWU3o+tm1cn62xI2MjUqqu2H/OlQYrImswtilgNTW+wLJtNE/CJmiyECx/Ipxz7W6jfNgiEQvzWeiAKwn1fYOhHoL5pceMexdM6mnGFVxJSXUHbZIFcMySJsl7a+RXXrxl9wzp2ZqmE818FNmaFAJ4tJEAgsX2ljzloHwKM8/qggq7rQVv/+/GeUQdAHkaCoxQx15wSbYPVIhWpi7oJh+VYcTq01PmG0JiS9sy69Sx5ssHKOjUtU0ErKJ/B2Chm4DvA4wqhx440cEw88lSQFxQCiLwGQ+vCPrCVI9/8z0xcTrCcyNXZzN1SiCIdsDJYWy8d8G9mRl8J9/5qR7aCqsiEn8xFBFsfh+J/4q1/kXdqhk1wzFxu4YCD26w3dfFVsALRQHXdgG5wmctCLHZ334kY8pzN3lS58C0Rq1+Yu7BNj3/UHDK5CFB+jvn6qgew4QL0scUQ6C/bO0cw5yKY+gsoUiKM+7Y4Jl/ZDfjQ5qpFtp9h5pv4R+aPztTgSxzgZf/W28AzPldCVJ/ZVrTRRXq/Fz/gLHCTycfE9jhTjL3mAVQnosQ++vYxtkHsXe7foykfm/I52
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(5660300002)(66476007)(31696002)(316002)(66556008)(66946007)(508600001)(6916009)(31686004)(16576012)(186003)(26005)(2906002)(2616005)(8676002)(86362001)(6486002)(54906003)(38100700002)(956004)(8936002)(83380400001)(53546011)(36756003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkh5blBXcE1lWENuZUhBSkE3UFdRSk44aDRJb3ZtWE1rdW9aN1U1NWlxb3R2?=
 =?utf-8?B?dnpKbkhyenl2dU9wQWVKbk4wNjhYaXQyeFMyWFBBZUswQ0MyTS9VSFpSWWIx?=
 =?utf-8?B?TXMwQzFtalRUQldoU3lDMy9CeXVwN2JsUmE1R1dTN3FWRUNFbVNYNFNOWVlw?=
 =?utf-8?B?aHhFL0t0TGN2TUFkamxHdEdOWkpVNGlBWlQ2eDIzcDRwNERzcytiNTE5N3cr?=
 =?utf-8?B?NnFvWEpZWGF2Q2RIWW1WSThFcEVlR2toQzA3bnhSWEhUcGNXUTRzZ21tNUxX?=
 =?utf-8?B?eVp4bXlJc2g3a1N6VkUySEg4MFltTHZQTXJuMFFtMWdaaXZFV1lsMjU3REZ5?=
 =?utf-8?B?aERnYjloUUVFM1ZnZ0IxU3k1aVlhbnFRbEZIQzd4c3JQdkkwS2ZOTUpGSHFD?=
 =?utf-8?B?bVpJTWk5bGtwM2ozK0pGTjZmem5mdysvWW8zY2pjMEwrQnl3alpMRFNSUXd5?=
 =?utf-8?B?RkVXampZS0cxdnAxcldIUUlzNDFmeDRselgzYldOcWVFMktnS0NXeENUcFNu?=
 =?utf-8?B?bXR2VUJ1T1A5YmpGUFZWLytjajcrSGx1cTZoaVNyd0ZMZDB5S3c0bGVjVnN5?=
 =?utf-8?B?U2tnQXlnUmw4R1drUGh0MjAzNFBoS0NOdEg2UVVPZUpUa1k4c0RqNGtyMDVs?=
 =?utf-8?B?VlN5Q3JsVmhtUE1JdldRQU5rbFlDU1N2TWFEM0FXanVra3JsK3pGNHV3emRo?=
 =?utf-8?B?bG9SdDZLVHJsZjAyWEtuQWN2cjVFTlJvMEpkajBiZVlUT2FaSThJeE44anli?=
 =?utf-8?B?QWMrNU11eTFDTFMvZkYyblFmenhETTRFajVmcDhPc3JXV1lwMDFIT1NpRXN6?=
 =?utf-8?B?Vld6cFlHQ2RMeUhNZmQ0Y1psVGpqU2RHS2VRRTZWazhZbWxhZzBOOEJqTHFr?=
 =?utf-8?B?Y3ovY0o1ZHRLTmJ1UTBoMytDWElRNGYvTFlQa1pqTjRQVjBLb256alZMRGUy?=
 =?utf-8?B?c2o0RFhKUjlRVEt6QW1GYmxnNFRkU2huWnI1WTRKY1dkZnVEYzhzdkV0Q2tG?=
 =?utf-8?B?QnpmS29qRVlCa3NsMGw1MlhuY3d0N2FEL0xyUUN5UE1lNzJ6aEkvOHNMZGZM?=
 =?utf-8?B?TUZCNVJnMmEzRVpRbjhKQW04d1ZsdnV6akpkczM5QnlHV3krQi92amlMK1Zl?=
 =?utf-8?B?ZHlkem84Q0o0V2lxazB0ZjNhOTArdzN5b3pDc3VuYkNBdHhOOTN6bWEvUjdD?=
 =?utf-8?B?V0Nqb3VsZWVlVTA2YTlEQjk0a0tQdk93SEJLVXNzZTg0bEJTYjJ1RDJPam1k?=
 =?utf-8?B?MmJjbUpNM08rOUNUS2hXNjErdU9TcGY3aGFHYit2Tm5FRWZGK1FySTBhRU9O?=
 =?utf-8?B?QUFpdFZpeU5yS2syY2FVZDFxOVV1dS9HYnFWbVlZS3psVlVveEYrZFI4RHBr?=
 =?utf-8?B?d2IwdTI5NklnMWRlR05DQ2xNcExjb0IxUzBiaHpBV2ViZ0RZWmZUd1hRQ1lr?=
 =?utf-8?B?ZnoxazJQN2FsSHc2UUVPcG1EckI2Q09vdkFHajd2RWttT0JKQ21abDFPVFVG?=
 =?utf-8?B?YkV3UmdUVXNSanAwUzJRNDdFci9kR2xpWTh3WE5xS2pWeVNCYUNoZ1l3d04z?=
 =?utf-8?B?WU1lcnpqWHlDZXhab1FRcFJXWUtHcEtPYVdSTUVFZEpKdUQ5ZnZId2s0Z3gx?=
 =?utf-8?B?a2tyWGxLcm80cDB5NlZvcUxKQXVxWWtoN2p4V2t4aEZ6cy80M1YrYjdPTWlU?=
 =?utf-8?B?TFlYc0R6Vzl2ZGpVbUFGckxoOEI5YW52NHpiMmNIekFMWGhPaSs2elowaXlP?=
 =?utf-8?B?YnR6aTVCeDBoT3NKK1ZELzlWL25xdlRMZHcwakhPQk1qbVQwZ21EamJWWGdX?=
 =?utf-8?B?Vm9Qd1hVYldJSVFEUDZ3eGIvb3ZWU1lGS3g5MlZtc1dWNkEwSG00TDltUWlD?=
 =?utf-8?B?bk9GZzdhMVV5Z2FPRU1yMTY2aGwxYmo0Y2JrbnVZdW9LZ00zV1kyOG95U3Jj?=
 =?utf-8?B?Tjc0ajRwblZQL1RhcW12aHM2VTkrMXgxM0s2Z1gvelp6UzBSOWdlTXpFVDN5?=
 =?utf-8?B?UzM0SnYwY3VvaG9jTmE1Q2p0MndUUXkySUNvZ0JWaGc1b1A1WDhMaEx4T3lr?=
 =?utf-8?B?WFFVTG9HYWFLWVg2WXcwZEl6enNUUjBEbHl4YWxZVDVoSHloUUo1bEw2cTZp?=
 =?utf-8?B?cjAyOEM1MFphT1NQeTFIdXMzNWdjWkRYVzMxaGxMNHNlKzdzNG14Wmp4SjAr?=
 =?utf-8?Q?2xmk85DyKwAPyZx+QABG0NY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0541e1cf-e823-4222-c290-08d9b8cca818
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:25:38.4428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awcX5RBszEhgkn29Ys+oEz5JBzKRqhfUeWd4q1OZqm9OQOGs9XqaYtso5x1XUdCFjvFhPHGb8cj08YsFPsKTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 29.11.2021 16:33, Roger Pau Monne wrote:
> Introduce an interface that returns a specific leaf/subleaf from a cpu
> policy in xen_cpuid_leaf_t format.
> 
> This is useful to callers can peek data from the opaque
> xc_cpu_policy_t type.
> 
> No caller of the interface introduced on this patch.
> 
> Note that callers of find_leaf need to be slightly adjusted to use the
> new helper parameters.

Is this sentence a leftover from an earlier version? I can't associate
it with anything.

> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -855,6 +855,29 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>      return rc;
>  }
>  
> +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                            uint32_t leaf, uint32_t subleaf,
> +                            xen_cpuid_leaf_t *out)

Is it common practice in libxc / libxg to have xch parameters even if
they're unused?

Jan


