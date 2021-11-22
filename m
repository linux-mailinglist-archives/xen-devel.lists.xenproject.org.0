Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB6458C7A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228747.395872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6lh-000412-Or; Mon, 22 Nov 2021 10:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228747.395872; Mon, 22 Nov 2021 10:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6lh-0003yU-L4; Mon, 22 Nov 2021 10:41:49 +0000
Received: by outflank-mailman (input) for mailman id 228747;
 Mon, 22 Nov 2021 10:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp6lg-0003ql-5L
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:41:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab77178-4b80-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:41:47 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-hj2D4csqN4242BEsXaKC6g-1; Mon, 22 Nov 2021 11:41:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 10:41:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:41:43 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:208:be::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 10:41:42 +0000
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
X-Inumbo-ID: cab77178-4b80-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637577706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=903V5XqFxwppyZ+F1F1M2UDREa8nuIivWzixj+CU9Ic=;
	b=ZWhvuf5cz1b3hB8GpBWZMpofEAQC0fBUKFpALmO7vkPdElH3TKCTfGMD/V05OUkX+Hc9bO
	KqS4NaYEdSBPZydo0AZUe2itrSlvJxN+/bub1+qrtCmD5rp23KGj+5VpiEgDPfYkp5hAOq
	R9hHf5hENOnVg4YeeSperYgVTxUbZaI=
X-MC-Unique: hj2D4csqN4242BEsXaKC6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKCzgL1xlSSPYxBwD56BDKAwjYzUx1mqMtG5i/TEl5NmSuPnw4QPkCzNmzSoo+l2K3X+mr0so1UL9y2OHn0lxWXBml4DtkGtB+oB70aMqWuFRTcy6K4MQogGuX7awGN2hkWV+9shpdG0s8V0uFRGeecyFUscxgOv7SXdRZ4KqY8QTUz7kyY9sbqHGg7mHGM6uIc9IbuWdV6c2V1+rbV9d0s2UJHS6+1Ohw4P0TG2HHf8y91YzYu8x4Gswq02OsrrtGUXbkkeeVNm0VIpk4ZMss4GxsrytjRuGwIAR82Evz4TIM7UqZxFIY4gSMTSPyi81rxxP6RwN4DVHRvsEKqDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=903V5XqFxwppyZ+F1F1M2UDREa8nuIivWzixj+CU9Ic=;
 b=TZ5x6ut10FipeHCDajwSZLtA6po4EBLHjdwiYAtTz/wCBI8p+HjxAIuQiUwOx51E5iOfLGhZm6KAdJMAwgo82RG/0mgb2JoDpwseMgponhnPLC53EDhOi5wIxhRMdEiaBs1VuP3wT3s9JJ1fTfGlOzeJDHQV9n2BJdFiWzZdQ+/8tYHtVBpLThJ0BRIsqZxhdR+lIjYwguKAeLNNi33xoz8NC9ZzmlH9GPFjoYVxqhU1S3bVMq5f1Yq/RxptZXtiz1wBpvRjtiL+HrNSI58nZHzoSJi3QhOlwHkQpDDsK4eyz3isEnpC+pyqGfIoVEAhU7mKAdzA4CYaxgxmubZOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
Date: Mon, 22 Nov 2021 11:41:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210914123600.1626-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:208:be::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db0b3e66-ac25-43c0-7aa3-08d9ada4aca3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57435A769D1DADD27FACC49CB39F9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EB6k8NuVC6un1ogIVuZ28Ab0wQDH4OP7GpxUDsH2VnDN3+5xkE052gEGVHBV5uQACBdoOV7eemCBmgpFPuHVFzuNCc3X6agymZW3kM+cw7Q+wv3gmVveVdy0Wt+v/TV4KBjxRQXr1FKvVEb5v+27ICKR+tJ2JI8+rq0kzHpgUNAwYApZVHacgjA5oe/1jhMQ7BIFGzyl13rIw+LNYc7JsOEfYzi2IAfqwDbTJgCSUSlu8+MyfHIrNpcGm9GAjnZ90jPefT1YPyMtY29bz7GRJdIlhEjLFftezcsT3K5DC37TKxJWsluqf1TZMwRW1IR7/XoQdExOfgknhczUeU+HqtR4kotRCZOkJZ8mXToqw/ILKP/m09ulmRqkg6rqLVoSNaL9ybDU6eFoOJyAkYaR3jsFE+fbSTFeaJaOJ5yaQBkdxpk69geC1ZRswrIoSbyLvWg/oPBqj0kfQZMu1vLevRYbHJK0A1L4BkFFcGGiW1BEZmnuU8EcRgoVoqa8A6wlN4N39cd4Ol+y4/cA9FHigd6BdP4N168dc8cBWiEdEGNi7KZmMxEjC1Iink9UjLy70GMAZh2hxabxhCZb0hl3i8hgh5ovvZNVp3MYDP4xb+WncVnwePRuc8q6c+cISmGuLehPFppL6/dxIGLHBJFhokoR0wiqQ2pJFMS9e3q5xulYV8u/UuRIeoYjJTkA4v4urNNsf10iAmDErylSFOCC2tU9CoUkV9Ld6HVUuuN0BSurGk+3Apm5rTtnMBCNxO5t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(53546011)(6486002)(31696002)(66946007)(2906002)(66556008)(66476007)(86362001)(5660300002)(38100700002)(37006003)(83380400001)(54906003)(6636002)(8936002)(2616005)(36756003)(508600001)(31686004)(186003)(316002)(6862004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGppZHV1Rnd4VUFvNXZaNkd6L3g0dGhBZTVQRDhxTnlLSjlMRHRrOXdiQ0c2?=
 =?utf-8?B?NTdoTDRLT2k5eUpkMlY2cnowcFkwS2dQT0pCZGs5ZFZubzA0bVVHRnA3bS9y?=
 =?utf-8?B?T3FIYXNPSHF0Q256NEVDbnNsOWU2NFpBUjhEVnZaNTgvSWVyQVF2MlFaa0lI?=
 =?utf-8?B?V2JQR0swUE5IWk1hbGJkM1o1TDV0VWI1aUY5QWNuYWJJaEdWOWsvRHU1T0hh?=
 =?utf-8?B?OVVvSUVaTmNuSHpEa1RpVFJsWXRYOVN4ZVcvUlc5aUlHT3dEOEhLZzdhd2Jl?=
 =?utf-8?B?MndZSWt4SkNJbVZGTkVlZ0w2eWNFQjk3eGUzTWYvOE9RU0FuRmNIOXpPS2FE?=
 =?utf-8?B?NklDVXVxbUtLRTd2eXlTb1ZscVVtTzhqVW1kVVpVU05UdWNZM0tEYVBsV25I?=
 =?utf-8?B?MGZKek5PMnB1clJkTE44bWFjNXliNkRXcTdhZXNmWkVsL0o2bFBNbDZTaGZR?=
 =?utf-8?B?WXZTSU1zbU9VNGc5bjNXK2E5djM3MCtLbFFwZzBocC9jWWlDbUVVK21SOWMy?=
 =?utf-8?B?UWdhK2JHeWJPa0tIbGhxMlJQVTJZWGpNVFRrZ3NBZVJpM3d2ZTVlcGdsRzlh?=
 =?utf-8?B?V094UHRmT3VjR0ZTZFpBU0pXamFraXU5K3lxdGQ5L0pGR1lsYy9qMVVOSlFV?=
 =?utf-8?B?RDhUZjdBUEhTVno5N01hMzZGVnB2d0JBMDR1RmdXd28yd21MWFRUNFZpZ3BX?=
 =?utf-8?B?NjUzbjJodWZLTkRVOUtlK3lSQVlIcUFHcW5rTEcvWlZBWVhwZGhQNzZXTnNF?=
 =?utf-8?B?dkUxU0h5N1Z0ZGF6ckVCazdzcHJ5K2FsaWVZQkFCOFBQZGN5QVkxSlFITDZY?=
 =?utf-8?B?MWZQeDZ6VlZoZ3d0V2xzMmwyczBTYWVKU0N0NDRJQ0phWmRJWjkvSm1WSkRT?=
 =?utf-8?B?WkpQcmtNWDZqSDVRM3JVWnFzd2NjQ0szYTVOUkU1RUVqS0twRXpQMlIvNVRJ?=
 =?utf-8?B?SGV4L3VnWHdZNWhMV2hYQ2hlMm93TTZFcU1SNzFybGJPNUw3b3hWb1ptU21s?=
 =?utf-8?B?ZmNRaCtOVzYvU1lqSkdEY1JUY2kvVS90REVlbWxpbTdZM04zL3N6NVowT2Zi?=
 =?utf-8?B?ajU4VXRiK3JPVU5nL2pWT21WMWRWT2FLMlRmU1ZmWUUxMVE0dG12c2NIQXVm?=
 =?utf-8?B?V1dyODZMMUtHK2F0YnQ3UW95R2dLby9ZUUFEaGZqSlJEM3ZKYnNkYm8zdG5K?=
 =?utf-8?B?ODV2dnNZT0ZtODRkaXFXWWVRdU9mZDBVYjBhTDhwNXVLdXRVeXdqMUdYd1ph?=
 =?utf-8?B?YjRzUG5FYytZSVIvUjhaK1E3dUN6endLa1R4VXI0S0plNnEwdDV1bTcyVkR3?=
 =?utf-8?B?NXdrSVRsMGI5b2JHRytYSG16bGdaQ3ArR1JiTWwrMisxR0RPckxNUHBVL01y?=
 =?utf-8?B?VURIK29hZTJzcWRpVHBvcktnMEZ4ZnEvTXBxUVhjNVJUcDBpaFNyaFhFZlV1?=
 =?utf-8?B?S0ZaSVVWYk5PK09VREhubjZpSW4vVzFqZmZkMVNmdTBmR25zbjNwNWJnemcy?=
 =?utf-8?B?ZzFJQnp3RFNQdTEyWkJYbGVCOHZiKzBqYWxJY2NBdXB6ajF4djlGci9BZ1BK?=
 =?utf-8?B?bGhGNHlFSThHTVltODBtL1BIMUJyOUZFWEFWUHpNeDVGSEtUdzFCd2QyQ2Nr?=
 =?utf-8?B?bGtCenB1dWtKL0JZWTdXR1krWkgzS3FKTnBuZDVzZWUzemw4dWl5bXFTaGVL?=
 =?utf-8?B?ZXdVWE92WEx6ZVRDQXNzdVRqRlU3aHExZTlncHJHc3lwdU1waDA1anVjSnll?=
 =?utf-8?B?aUxBeWZkLzFyckx2UFg0dUdLRTEyUkdNUktjWU0zVncwSit5NXNuM1UvQWh4?=
 =?utf-8?B?L2tVbjcvOWF5bm11R281MDUvbDdJSFVSZ0xyTjJVSW1nRTYweEFLTkNBTXZm?=
 =?utf-8?B?c1hYQXF0bFQvTWc2VHdZVmxlYWhTWW9lY3IxVGpOamdFTHViWlhaekIrcHhk?=
 =?utf-8?B?UTBWcTFrMENabWZpYVBubnFFWVE4UUgzL3MwR1pwSUE5aWhhQmlNeGhLQ0lo?=
 =?utf-8?B?QXo0SGxnTXRIbkxIUVZRNVlKdGFKbTNscHBjMlM3L2pUZFZTYTFDMklDWnR1?=
 =?utf-8?B?aC9tUm5xOTB6dW5IWUZ4T2ZuVVYxdFpwRnlvZDZXcUh1MnpkNytIaldYMUUv?=
 =?utf-8?B?OWpmdCtOcnpYNEF5Y2ZrekFzS2FHK2VJWVN5R2E5SUw3N2lNbjlkbmFMdm1H?=
 =?utf-8?B?NkZkbERISWRCdm56Wnh2ZXJYNjNBUmxWUHdkRzRQSXRGNUdxamo3bU90ODRX?=
 =?utf-8?Q?DVS8fnbg3c0Wt9bbS2ACpcScfGMv3eqNqBiyF/kCKQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0b3e66-ac25-43c0-7aa3-08d9ada4aca3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:41:43.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKFwWVMtKPEiBvpRq1vgk0D9VrNPAIAPXemRTFk8IJnAEypBqkXFmqxsfHPDNNxV2u5LMVsMqXDRs+PNTAz6cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 14.09.2021 14:35, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.

Generally I view VIRQ_DOM_EXC as overly restrictive already - what if both
a xenstore domain and a control domain want respective notification? Hence
similarly I'm not convinced a single, global instance will do here. Which
in turn raises the question whether the approach chosen may not take us
far enough, and we wouldn't instead want a more precise notification model
(i.e. not just "something has changed").

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -87,6 +87,22 @@ bool __read_mostly vmtrace_available;
>  /* Unique domain identifier, protected by domctl lock. */
>  static uint64_t unique_id;
>  
> +static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);

While not really making a difference to the size of the bitmap, afaict up
to DOMID_FIRST_RESERVED would do. Neither system domains nor idle ones
will reach, in particular, the set_bit() in domain_create(). And none of
them can be subject to destruction.

Also I think this could do with a brief comment as to what causes bits
to be set. This would avoid readers having to go hunt down all the
set_bit() (or the commit introducing the bitmap).

> +void domain_reset_states(void)
> +{
> +    struct domain *d;
> +
> +    bitmap_zero(dom_state_changed, DOMID_MASK + 1);

While this looks to be fine with the present updates of the bitmap, I
still wonder about the non-atomicity here vs the atomic updates
everywhere else. It feels like there's some locking needed to be future
proof. Since you come here from VIRQ_DOM_EXC binding, it could be that
domain's per-domain lock.

> @@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu_head *head)
>  
>      xfree(d->vcpu);
>  
> +    set_bit(d->domain_id, dom_state_changed);
> +
>      _domain_destroy(d);
>  
>      send_global_virq(VIRQ_DOM_EXC);

Wouldn't this better be in domain_destroy() immediately after the domain
has been taken off the list, and hence is no longer "discoverable"?

Jan


