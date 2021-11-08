Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A4447D14
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 10:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223158.385724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1Ia-0005xV-5X; Mon, 08 Nov 2021 09:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223158.385724; Mon, 08 Nov 2021 09:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1Ia-0005vN-1y; Mon, 08 Nov 2021 09:50:44 +0000
Received: by outflank-mailman (input) for mailman id 223158;
 Mon, 08 Nov 2021 09:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk1IY-0005vH-2t
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 09:50:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f3af73-4079-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 10:50:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-yhP0fRWyNpKCal0vphRehQ-1; Mon, 08 Nov 2021 10:50:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 09:50:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 09:50:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 09:50:37 +0000
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
X-Inumbo-ID: 54f3af73-4079-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636365040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MzTKTzVHggNYauHFQeJYFU1YKUlvsDazmaOPt9t9y4=;
	b=Ml+ynsDFEqrsSIekbgA0WV3K83a9py3iRKGd9EWY8615ec3nvxuluqPo/VrlYB8c6AjXzp
	LFMoVGM6OsdiMh9YqnMKOqa4+Zq0MSWivbaU7O3tH38Eg2S8dWLDV5sO5PzGYwttZ9rAWc
	V4CCXAPXFcQ/dTdlzt/alY1ts5R4Ucg=
X-MC-Unique: yhP0fRWyNpKCal0vphRehQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K379X1AS/DQgqt6TsqBYsnJMyghzkfd/kkG6+L7jaN/Aoy+yz6dURL67IcMe3Y0F7qUJp2zG0RF1wLruJ/ImNN7eLfW2estBTv1NBEg2oobJK7R9ic9gbhxTzY2O+A0sGrtgu+9pkihFn859RCt4u0Kmrwl+nLZ2w1swAxHJPtljdr8t4vVttED58ee6CpzWdx1igtQST83UOMKTNZP6wmm/T2yQCjPZ2FUGbMOIh4c4H4Xe4bBZRmdjRgtRqoAc0yXYG9V+ZJs4cRkRjPjG0VWvoQ3kleGKvhC3MmnUAz1yp8xn/RMbYrgbiMPTBkOm/IpE3G69OXu8sVCe/s5VJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MzTKTzVHggNYauHFQeJYFU1YKUlvsDazmaOPt9t9y4=;
 b=ACI07218mgzZ5Lo9d+pmyWjAHcKSp4+Or2Sj9yggNen+BHRKDhNYKQ01FAIhwE7bHHppGTpfI4UkHMRLdIKcchn+yoH2jcmx1ZCLYedUQyMvcf3iIJ+gi5WgeoutIDlzonVTLHT+Ywg8qMH/MIFIKogj8os6biLkTFQJ0hZDIaUCDr8oz4hFx53EaDfTKk8hiFsTT3XeVpP6hMyGr6TByVT8zbR+GIb1qRj+DZny5cn9wYjta/1GnzgQyh7T/wDbr6GwNkXGwoN0+LnwxVqctTtErZYbvCnPUnUKVISEsmp2SeK/8NpLGmi5QUFA4NZhViIObqHnl3y0Tu+yhhqoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8a9d0bf-c9d7-a1ab-f50d-7ebaffbb3f8a@suse.com>
Date: Mon, 8 Nov 2021 10:50:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] xen/xsm: Address hypercall ABI problems
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105135555.24261-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0beed9f3-d5d9-4577-4c74-08d9a29d3770
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607789698E8539012682CA5B3919@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zh65SnV0ap3vOc/y5rT0D3i10UIxFrvov7Xv1Yaa++A3WI/shsNuAWq8jOK1zrzn3ShdwPVI3qCXLUFUM1ogLJpes2UUYpE/MW52/hfIgK1HJtif+E3X6Zxz0Ifo/lYGkCkOnmScQ/w4K2QhF85ZF5JNN4aOIjsS7xMUhGw+1jT+mRzb5ag3StbsX8HukJ+6s9Tn3yj88PNXhGUjw0ruRDyrnK5UqJYPWaSE+50XXmlEVcnZLXZu/jT06b+Z139cp6web4fVpsTTFn9pIs94QGDRwYt/rvWMjDH9CGzWrUsMn7lbioNZSxpaEVAKQ/PeRIW7zFcigdFOFu4Z4bD2in4yOl4JhffqHrostH1FAGHk2U7WJ5RBNyDWOqfEpfTuO8hi403O2wG+4jh0hk3tzRbUTe9h213zYC+h2aEwjw9w87pX3au30kNSQTwbApeRP2GnbgJwuIkiPoEw/8JrvJvARkGgD2R5+sRh9DzzxneOEzozCyxd6QGT7W4tPfT9iaep1FqDI2VmzUfHNvz4FmSTwmZSFBBdBp2nPsmAWkAkiiQOrJDDNZHBr25fBwfmLK8UvUzk9GkUHlXHX9DirhKJYHSRhq/YgDB+fdHx2LpWrKJHdOCEYZJE3WacWfmI61JDitPZJMgcjyhUYLngGs6bVCbwzruHn5A533uCL5PfVf4VOA9kgCSBCZjxIL6BREOYIhTvpW5/FtFjCavhLmrMPiUVqisK5r6r0aRlakNp5Nr/Bhx12PIsmJ9t0sMI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(8936002)(508600001)(2616005)(31696002)(2906002)(6486002)(38100700002)(5660300002)(54906003)(956004)(316002)(16576012)(66556008)(66476007)(66946007)(83380400001)(6916009)(86362001)(53546011)(4326008)(31686004)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEhGNDVFdjg3cGpTdUxRdkFSWjBTZU8vVGNnQm1SZFR3cyt2bmNFL3FKd2Fp?=
 =?utf-8?B?S1ljRGg4Q0RHSlQxMi9hZnFOOTJwQTYrSm11dDNoOStkd1lXYXVUOGZvQXBL?=
 =?utf-8?B?QzVyVkxFTnRRblZQeTdVblBxZU9VZ2FVUHZzMnA0ZVZXamIvdHd2NHRMVXZF?=
 =?utf-8?B?YTJ5Q3NZVTFkeG9CYjIrdTc1NUlYNkpsVVRGaVlUK2gyV1k2dGFkbkFFS1Ni?=
 =?utf-8?B?Vm9jRnIrbURKeDR5YW44RXdRRjhzMnljWS9aNTltRHBVYndNbmw2RHplNlFa?=
 =?utf-8?B?K2NxcWJZS2tveVlaRnpqVVVPdi85RUNlMGVoS3NwcjBsOHBCeHduRlJuak83?=
 =?utf-8?B?MlE1RElmOEpPeGFsZzNMMFk5VVRzN1YwMDVOK1VCM1FQdHJtWUJZZFlBZHNz?=
 =?utf-8?B?Z1l5c1VsY1RTdnJObHFnT0tqdVVqcm4xeVFHZHhMaWg1Z3ZITWljYkZocW5I?=
 =?utf-8?B?bzRpd2h6akVmVTVpMDQrNlpxbnJZME1rZ2pIcFE1M0hHbzlFYzJPeGpJUTl1?=
 =?utf-8?B?cnVJNUw5WldmMURrSUhJdENMUFdUcVVoekxndmlGRFpKSzdKRGl3dC9aVmov?=
 =?utf-8?B?L2JGWGpOSGZzQ09TM2dtTkpjRWlPSUtzaDVleXFZblZEREVJM3djN25nQ0NJ?=
 =?utf-8?B?bnEwZ2hJekthTk5wUlh2aVFXL1NmWW9CWEpjaktNL1R0bDBmTXBFR3pTYVFY?=
 =?utf-8?B?V3NDQzNXN2dWdVJZenc2M1ZHL2VJbUd3L1NLbXFjWHJOUmU0RFcvMDdIcnZq?=
 =?utf-8?B?cFYxczdmeW50S0FqMkdtSE9MR1FSdE1Jb05FYzRaakp5Vmw2ZDgyWnVXMTdL?=
 =?utf-8?B?TnpvM3J5VGIyYVF3YVpXSFJIZk9waW82Y2dHSVJ5cGZiU3ppNnZqeDE4Wkor?=
 =?utf-8?B?QjNLRnFMVlI4c0p4SkNtbi8zK1MyMUU5S1ArcWZRNlhvNFFXYkRaMjNSZTJh?=
 =?utf-8?B?SXI4ZHVaMFUxTHp1RHVYRWZJNkQzREdwNjNpdWlMOVlKT3k3QXFXMDBTeW1C?=
 =?utf-8?B?cldVb2lJdjk5dk5WNEJlQlJ0YXB2TXlIOXZQdkFJd2lvcTlMYWhOWlEzelJH?=
 =?utf-8?B?SWZMUkhLVGJhNUlxUVYySjg5WDdjTGxydGwrdm55T2FuWUx6NXpDRUw0Rk1Q?=
 =?utf-8?B?b1IxNFhyaEtBRXNtSHZWTTFrbjhnd2Z4Y2tYMWsrTUxrckVVaWJWVExOY0Zo?=
 =?utf-8?B?T2ZrQzNUYUhKN0JLcTMzWUZBSjhtancrTGlkaVdVbnNOTGU5blZMYWNpdjJk?=
 =?utf-8?B?VVlRZzAvQi9WQkZNdStkYy84cCt0NVJDN0N5TTMxZ3JyZVNzalQ4a3FZNXhn?=
 =?utf-8?B?dFNtNXB6bDV3bGV6bnhqZmMyUGNuZE8vdUM0ZjU5ZUxNSjBTR2FqWEY4bStn?=
 =?utf-8?B?RU52U2N3bThMSEt0bUFPU1F0MWlkSFFLdzRRQlRFTFNVdzViSlczSEJ3dEhq?=
 =?utf-8?B?TFNNdTNkRENXem5VR25JZ0FFTmhNcWtYb2xmVlNWS1VYUTMrUFZPYk1vR2ly?=
 =?utf-8?B?N3RscWlMalQ1UjB3RGdVVEMxSWxGdU5CUnI5eXdxeCszQmJGckNsYTI1cnBE?=
 =?utf-8?B?cjRrVUhPbGdZc1NDeHFIOUNEYjNzdnF4aStLc1JCaDdONVg2RFNKOXlHNEpE?=
 =?utf-8?B?aWdQVkJYa29hTVZVNDVOMjQ4WmF5aGtZWCszcFZQL2RMMWE5Um1sMFhNS1hM?=
 =?utf-8?B?bEE4bkdMRkxlVHRLTm05K3hQZEFIeUR4blNxbnRoOUdjM0RlY3VMTVl1ZE9h?=
 =?utf-8?B?bENmVE82U2VQaTJGVVJRdXFhM2xjMVQ1SnRPMFhURU1vcWoreVhMQllKSWhJ?=
 =?utf-8?B?OVFuVFYvOVVqMERNeVQxdmx2bWpNRG5GRkFlcDdwRzhGVXpWRGZNclEyTHIw?=
 =?utf-8?B?RDh3Nm0zTkZqZlY2b0R6Nm1oa3lEb1E5a2lmczlyTnZGZ0xoTkQ1Ti8vaUU5?=
 =?utf-8?B?cU1OMmd1V2ZMMTB5R0lUTGUxaGVEemZmRnYzcnNaem43L2J3elNDNGJuZEp4?=
 =?utf-8?B?SktXQkhocXdzUnRMRjRYRTBMbWxpR3NtclIzOXJ2NjVzQ3FLbit1d2dXbUs5?=
 =?utf-8?B?aHlGem92NmVIZmxRRkt3T3g1TDVveGhEU1hBemUrRHJGbFg4MTdmMDdRMkZC?=
 =?utf-8?B?LzZnYU80dm55QUFVVnBtQVgvYXZPTFRwMkZJL3NsOGRoVXhEbWxnMlFaZXVY?=
 =?utf-8?Q?Vp9sfOirCzeEkfRMN9r7uPs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beed9f3-d5d9-4577-4c74-08d9a29d3770
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 09:50:37.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nh8EA/VAQYGnW19BV4XITUzyWr0EZeo2hiULLiNXEv1lbmQoHRugROCylD9Ha8O652XX5iOWrvNIZFb7vABvaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 05.11.2021 14:55, Andrew Cooper wrote:
> Currently, __HYPERVISOR_xsm_op enters xsm_ops.do_{xsm,compat}_op() which means
> that if any other XSM module registers a handler, we'll break the hypercall
> ABI totally by having the behaviour depend on the selected XSM module.
> 
> There are 2 options:
>  1) Rename __HYPERVISOR_xsm_op to __HYPERVISOR_flask_op.  If another XSM
>     module wants hypercalls, they'll have to introduce a new top-level
>     hypercall.
>  2) Make the current flask_op() be common, and require new hypercalls to fit
>     compatibly with xen_flask_op_t.  This can be done fairly easily by
>     subdividing the .cmd space.
> 
> In this patch, we implement option 2.
> 
> Move the stub {do,compat}_xsm_op() implementation into a new xsm_op.c so we
> can more easily do multi-inclusion compat magic.  Also add a new private.h,
> because flask/hook.c's local declaration of {do,compat}_flask_op() wasn't
> remotely safe.
> 
> The top level now dispatches into {do,compat}_flask_op() based on op.cmd, and
> handles the primary copy in/out.

I'm not convinced this is the only reasonable way of implementing 2).
I could also see number space to be separated in different ways, ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> 
> Only lightly tested.  Slightly RFC.  There are several things which aren't
> great, but probably want addressing in due course.
> 
>  1) The public headers probably want to lose the flask name (in a compatible
>     way), now that the hypercall is common.  This probably wants to be
>     combined with no longer taking a void handle.

... leaving per-module public headers and perhaps merely adding an
abstracting

struct xen_xsm_op_t {
    uint32_t op;
    ... /* placeholder */
};

or (making explicit one possible variant of number space splitting)

union xen_xsm_op_t {
    uint32_t op;
    struct {
        uint16_t cmd;
        uint16_t mod;
    } u;
    ... /* placeholder */
};

in, say, a new public/xsm.h.

As a result I consider this change either going too far (because of
not knowing future needs) or not far enough (by e.g. leaving
do_xsm_op() to use xen_flask_op_t.

>  2) {do,compat}_xsm_op() are currently identical other than the dispatched-to
>     functions because the size of xsm_flask_op_t is invariant with
>     COMPAT-ness.  We could simplfy things by only having one, and dispatching
>     to {do,compat}_*_op() directly, but I'm not sure whether the complexity is
>     worth it.

Perhaps not, I would say, not the least because (as said above) I
think we shouldn't put in place restrictions which may get in the
way of adding some future module.

Extending struct xen_flask_op to become a generic XSM interface
structure (or even just for Flask's own purposes) also is not as
straightforward as it might seem: There's currently no provision
for sub-structs which would grow the overall size of the structure:
The copy_{to,from}_guest() invocations for existing sub-ops may not
copy more that the present worth of sizeof(struct xen_flask_op).
Yet your implementation of do_xsm_op() moves this deficiency from
Flask to XSM.

>  3) Bloat-o-meter says these changes add 16 extra bytes to dm_op() and I can't
>     figure out what could possibly be causing this.

Without comparing the object files in closer detail it's guesswork,
but might this be register scheduling differences resulting from
the changed sizeof(struct xsm_ops)? I've been observing similar
seemingly unmotivated changes to generated code ...

> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -22,6 +22,8 @@
>  #include <objsec.h>
>  #include <conditional.h>
>  
> +#include "../private.h"

Kind of odd: I'd expect a file named such to not get included
across directory levels, unless a single component was split in
such a way (to me Flask and XSM core are separate, yet still
related components).

Jan


