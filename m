Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBF408539
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185476.334152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgE4-0007Yw-Vc; Mon, 13 Sep 2021 07:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185476.334152; Mon, 13 Sep 2021 07:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgE4-0007X7-SN; Mon, 13 Sep 2021 07:18:00 +0000
Received: by outflank-mailman (input) for mailman id 185476;
 Mon, 13 Sep 2021 07:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPgE3-0007X1-EL
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:17:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81082965-7031-4a74-a768-32b6370b588d;
 Mon, 13 Sep 2021 07:17:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-efV-9HgvNrKBM50lsS371A-1; Mon, 13 Sep 2021 09:17:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 07:17:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:17:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0072.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 07:17:53 +0000
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
X-Inumbo-ID: 81082965-7031-4a74-a768-32b6370b588d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631517477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkupI+z+J+GPRZUv9g1ZG2/sSk1W40uKlMym8BknD0E=;
	b=eK4RMndQEJVtZb2+U8Fiup8TXLIJLKFdguw+uUFYTKkmYOAdOJ8VJAWn5/3HI/7M0uluhR
	iRX0uJPSmlNCOj2XXVO5frwBGZm/IHo80M+cmf9hNLIB48sj/zlLJ2hmVyWtVG53hP+3RD
	09bab/iAYIc3vwbTRju5XUjmD0roAAc=
X-MC-Unique: efV-9HgvNrKBM50lsS371A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeRBxzYzUzjMK4NSiP34Uk/PcCgaLlmWWALtsohSs97gu8xJZfoIimujkQ83aG7Bl9U9uvLV0Py1kG1SmhkhENRuac72SfZCM43d4cZ5QCEctT8ZroBh6B7P6FXSuRC6HAp6eo5DruganR/FzlCGPXOTClkYUpV+9ubBHT71Pj2+jPs/5BxqQ13fDSgO7pXIKtoiYaUHvd0v2O00SP2/1grexcnmraLckL+OKjTG6isbkBCFuKNpBJffDpBCqhen1oFmXGMttkgQlEWz7Qn3g5nnO3g6/zKyDc0T8MK0EzLepoB+0XHePje0uIbd3/Vgl5aFqtxNJt2DFlDq1tiP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JkupI+z+J+GPRZUv9g1ZG2/sSk1W40uKlMym8BknD0E=;
 b=lE3/l2qHJ5578JodgGjuzZbrAnE3nNapJG3/AG7YJkAzB4d9/GhPmnpwYGQ7NNi3Ww0kBlCsgzv8iCoqv2DgXYIeiv7o8DesFIZS1mP6HWd6yF3Ll2zmL3Vb1KqXelESjJv9wPP3bMCrROYSzaHXbAZ+EEK3xPRFbZR65KXHYputs+dgrXcdGVF3jRZgFXRxAYaNk4W+eLQkHOClctDDyGzgXJ88r95gwjd5eZi5CR/h7p2rYWQHg76+SjMsg1TIUD5pz0MnNj8Gwg4lDgL0Pgd91qjigzduOwCAwLL+Ipl9MeVsAL2/TspKGM63AyNM6jLJm/eQGX7BfKs0uzG7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
 <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com>
Date: Mon, 13 Sep 2021 09:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0a9fb6-a0ff-4534-4bfc-08d976869a60
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608CB5E39527D57AB5B5DBBB3D99@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ELwgU/qWRg6aa6TUhVNRthVnYd5M3QCagD7iAImUeheRSkFE6UnpKdmivaY3efQpntV66iQBlV08LSO9t8kEPjKapIt98dwDa39WEz5Dy93061ectWzAqzTSJSIJe8xSvHqUIbhOhijODrU9/aFlHt8tTDmVzhT5pK46GiN0rfwSxO9tdL8dUsTh0APV0p9My1oW22jfE2tiDTpnQBTCgipx6H07avu4DAcMCQFJf1FRPENstRg8/XEDTwiTFRE9tZOj1wJs5XfO8CdZsj6f/hlCc9pRGT9H5suqwa93KjyBqdsDqNcP4eFWKEY1EAs4iIC1DIwJ9h2ACVrXN9ZQ6MeFcWv1WSDRyp+1fLEIIH3k/cF2UmQ80mgFyVSb6ksenxxdCRgPeZHIOg2ohYVF8BYj+wOwAl5dsLHDE4tLUfQY+dSJ6ojQg2RZwXLkLi4xAt0IoBt8G0DbknDV49fLkt3p7aIlq3kZdG24HdYcukzUXMcsYWtuoDj8LP7mrXTpkgm3QUUi9KpCugwtsVz2+rvt3UtRUwhQ4kLOtElnaww0WdXsF40JXgy7px8/lAiMi/+Okt7g8raP56GRZkL/FqTjpwd7zOha8Ul2B+637+VAzWtAj7C9LdD6RxoDJXpHKt59NAb0P/mY8e/QTvhsQ1kNrqP5AzTkM9VsG53KPMGxhJrptVDATe5x0R9yhqtleY8rKVPivEP7RvXoJxaT30kcBG4JQK548S648jhH04g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(346002)(376002)(39860400002)(4744005)(6916009)(316002)(38100700002)(36756003)(86362001)(16576012)(6486002)(5660300002)(31686004)(53546011)(31696002)(83380400001)(478600001)(54906003)(956004)(8676002)(66946007)(66476007)(66556008)(26005)(8936002)(186003)(4326008)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJzYTBiM2l2YjlJUjJHNS9wdlRpekJJK3JScUUrN2hHZ3dzK2NGcW9FY0hw?=
 =?utf-8?B?VHVUb1ZuSU9PblVaaVREL0pDUGFLdHVLNzA1emlhdzdzd0tSVHlXQUxvZnRN?=
 =?utf-8?B?QkNrdnpFSEVsVWNxSmRmU08yVjRJMVFndW9nZVM2ZUNXd3J2U204TERHS0dO?=
 =?utf-8?B?dlZhQ2dVbUdXVjRiMTdKVlV0ZVQrM1Q2b01kUW9oQlFoejQydFNpclBBdUVP?=
 =?utf-8?B?ckwydEM1NEZoT2FxMnpwOEowZFhJSVhoTVppUlJDTDFGbDlFY0hSQVFiMWNt?=
 =?utf-8?B?KzlhTWJYMGF3aE9PcGs5emFVWXVJWjQ3ekFWSXV6ejFQZGs3TjdXc1NyNkVR?=
 =?utf-8?B?bHl6TlROajQxZVV2NmhodDg1bmFYL1k2YzFRKy9KWXdDaVZJTHZLZ1Q4S3F5?=
 =?utf-8?B?QnJwTDZLcm0wcExobnkzSDZZWFhyRUpSSUdBcmVEd3B4ZTJCYmxpeEl2Z3FZ?=
 =?utf-8?B?c2ZOS1lkVXd4Z3k4dldNUDZTdS9udWlpVHB3WmwxVGp0QlIxcVQzWmdRM2Rn?=
 =?utf-8?B?UGgyejNSdUluRC9sN3o3bk1WR3JnSGY1UGgrWWkvL0JPUnFPRUxreGNJa3Rz?=
 =?utf-8?B?U0pFQ3g0NldXa0QyZDlQdGxyTWF6bjJFZCszQ1gzekxMSDB3aGx0WFBWYkFp?=
 =?utf-8?B?YjNXYU45OUlpRVpsWjB0eDFiUUtWUFBmT0lKMis1NTNpU2ZjaENWUTAyUVB5?=
 =?utf-8?B?bTZGbGJHU2VTMHU0QU9wNmwycU1qRmlwa3B0cFhFZklSSDVBbSt0dFlOYThS?=
 =?utf-8?B?Y3F6MjNFTUU3U1hYZWRyV1NONTA3ei83TnVMSjBRelB0NFdMeGRIeU8zdTRT?=
 =?utf-8?B?MEluajRHbHhnUm9vbnhjR3dBTnZVRElJcmw5eDhHdno0ZFkrUFpQQ0pRNGNm?=
 =?utf-8?B?UklhaVJzQkVWYVRsalJWMS9GZk5tVlU4V1lFUUdocVBPL21JREUvR1FaMzl6?=
 =?utf-8?B?cmkyUFFFTGtoV0hqR0k2MkZLN0plWWxBVVFMYXhlY2ZHUEYrUm10SWM5MVNy?=
 =?utf-8?B?Ri83N1NrMUtPUjJMK3JHK0FHejhITU1Hdjh4OHNoVU9CTEExcnhTWU1vak02?=
 =?utf-8?B?S2kxcDlXdXRXSjJtcDRXbGhHNVR0RUNGdk5qRUhrWUFZWFN0d0FqT2NES1kr?=
 =?utf-8?B?UkVoRzk0clpJZGtnWllCVEQ0SFNKTS9RejZJT29zc0g2ck1PY3lDN3B2eUda?=
 =?utf-8?B?OVBwV3d0Vndhb2N4NzM3Vmw1ZWRaRjBOUnZ5ZEVnNXpnekdyR3BIbytlZVNH?=
 =?utf-8?B?WlBqQVlNSkRvL0F2bldUYWJVYnExSXR0UGdxc2prWmszQmR3S2dYVkJKTnd0?=
 =?utf-8?B?TXp4MlE2SVlveDdtWHJWWGhPVWVTQVFjTDZCUGw2blY3YXM5cG55RTAvM21K?=
 =?utf-8?B?MDJYSm9Oa2ZYbDRKNzEwRU9MSE9MVVZINmQzWGhNdTQ2dE1oMlRKWVQ4MEZD?=
 =?utf-8?B?VDBXcGQwb01WdDF1TE95Wk56S1FCNDJDTUovbzNpQkZUL1IyWUVDVGRMYURI?=
 =?utf-8?B?aGp1dmpKYkh5cjhkYXlYYTZQZ2RLeThueVd6RDdEbFVHdllJVjN4OFU4MmNm?=
 =?utf-8?B?Uyt3MFkxTDg0aTY1c1dlNkQrNlQwdHhaS1h5Qm1JazMvb0VrWk1FdG1RaFpI?=
 =?utf-8?B?d2NIN3NjWk5IQlh5cTdoSXNDR1ZwTXp1cDF0enBialYrdXZOK1hYQlpRTkJz?=
 =?utf-8?B?c3FWaVVnVXhvOXhiM1BGRmg1b0NhTW5jcjJJRDV2b0JxamdraGN0ZFFrNldq?=
 =?utf-8?Q?VhKgtOyr5o2Adz7Td6PkvcSoO8XdT/kRWU0jF2L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0a9fb6-a0ff-4534-4bfc-08d976869a60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:17:53.8262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhtZjWEP8Nv4s+v0fhfa2DlDNTNJmu2PStzSgUkCcO8WLmAmDVfjNcM1BZNVNUtReYOQdHiJwg4rdOC8CR89wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 11.09.2021 01:14, Stefano Stabellini wrote:
> On Tue, 7 Sep 2021, Jan Beulich wrote:
>> While the hypervisor hasn't been enforcing this, we would still better
>> avoid issuing requests with GFNs not aligned to the requested order.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder how useful it is to include the alignment in the panic()
>> message.
> 
> Not very useful given that it is static. I don't mind either way but you
> can go ahead and remove it if you prefer (and it would make the line
> shorter.)
> 
> 
>> I further wonder how useful it is to wrap "bytes" in
>> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
>> least was supposed to be, prior to "swiotlb-xen: maintain slab count
>> properly").
> 
> This one I would keep, to make sure to print out the same amount passed
> to memblock_alloc.

Oh - if I was to drop it from the printk(), I would have been meaning to
also drop it there. If it's useless, then it's useless everywhere.

Jan


