Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD34413349
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 14:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191731.341826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSejo-0005cs-LK; Tue, 21 Sep 2021 12:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191731.341826; Tue, 21 Sep 2021 12:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSejo-0005ZR-Gz; Tue, 21 Sep 2021 12:19:04 +0000
Received: by outflank-mailman (input) for mailman id 191731;
 Tue, 21 Sep 2021 12:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSejm-0005ZL-Sz
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 12:19:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73459a3c-8225-479c-b75e-5e90d141ed38;
 Tue, 21 Sep 2021 12:19:01 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-o3gr2-NlOuS7kZlNqQsZjQ-1; Tue, 21 Sep 2021 14:18:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 12:18:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 12:18:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:208:d2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 12:18:56 +0000
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
X-Inumbo-ID: 73459a3c-8225-479c-b75e-5e90d141ed38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632226740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPsGZx1BZ9bZll4oOKgFeSjcCZ1FW9k+MZvkR+BufVA=;
	b=BDEi13Qz553u0rnbXkPxS9YJq7B+pxen/z58/5xymkedGh+JVirfcmqzbyeWbM++6k4pZp
	5OHe7OwuUd8OL7kED1jcGhHiCR9JzCnxjDqqAyCK0H6R+xT7IfKNg/+4lu7ucsgElhDpSZ
	rc0HArnQquOJzV898Fxp6tfZhLrT7Oo=
X-MC-Unique: o3gr2-NlOuS7kZlNqQsZjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH1vvyo4fGgK1OkXnHuV6ioH8VkmpAQTMO0AQm2Qc15bxZJe28JUNddyc9jwGEBQkXVA/ijzjh6ZsLjZ6oaKKKCshUdsNuhrF6s/P1/6lIryPzgNLTqOFlfBB+fQn8ZMwLsglEGq7ap+HTQYHpKKtg/s+njeoEpKCTKwS/hRwNXRtb6KO/JPakNgNdRXAfyempzLKH5BWBCW6eIFgDU2Q/Zt3S/bKCn39KDhPozXwL2K8CJvlrOJin18r4jRJsgQt+EfQR8Fl9HytW/pDTZp3735i7CcrR77DZZkd3o1cSe5jx5XhF6d9OiaItCaNPMVFamM/6bwdlFXfksEwjh/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BPsGZx1BZ9bZll4oOKgFeSjcCZ1FW9k+MZvkR+BufVA=;
 b=F575BJA5gLWHM87gJaB1141YsNAfXZonAewFzgCgmoBLtutCkP5ryn+EmNms2t9mfJst9ISPhxMjjt/9UbSCchSIsREo1QlUVUhRvs812uYPjNoLaAseBhtkz4pH7gyAxDJ14HnsSIi/HOqMtrr6NYFZovaQlw5XOQitRnSJg3kiv/VDyDXGCQstGKAAQAzbB2xqVLdaP0qn4XOuRaMVSd7ZQE+2mkmcVnNBKojCSY2Fb3M8h6qlESSK7QhEJH2sp04wT+DWNVLcliwfz0Eh9SXrIHnPJs0S8eZBnwBVe+R3R9ws/fjXdgflspOs8YevsgkvftJYLYXjhNHP2eH2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/12] x86/hvm: Remove duplicate calls caused by
 tracing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45d5ba73-3099-9744-41f2-e3f53faed536@suse.com>
Date: Tue, 21 Sep 2021 14:18:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR08CA0008.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1e5405-761a-4e0c-8636-08d97cf9fc28
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7151A86B1A79F5BD2113826DB3A19@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbrFdPVf9vbiiwEBGnwFnWqtczCEM6+1Zvz9UJtf0QYXQLCLdAhX436Nyjc03AoYWAG8a5RS2Nv8I2f1a/f18Ohfts6OboFZprkku62Wxvgu7gcG6b06kq7M3O1gt5VfvxTw8TZoK9hdBoQN1dtQuYRpF242a+e9aFHr9Ji530UzI7tFwqKolsYUtUXosP13qiJSAuNj0icmkbAYrfsegZq1i5t68Jg2131x3W8RojeDTKXb7McYO+uUqLMk0IeaNT9rU5Hvu/jdfx91MyqVU7io82psQfGV0dR7gue/KvIgkYhO6ZdPgJWiH6oQIRp4Q+8Uf6N5bUoiF4jkKdB6YSQsZpJmwIo/S7+Y61fS3vFd+NZQNLHA31BHMQmcfSazKzlObby5fe0UN/dEzKlbXF0juvMrly5lZIh5Fk6WkoJFDhnSWZZn2POLDWao3eqknU5mI11Mnr8flwkMOxzIM2ispFj9pVBwILyt55cJG4F1yUaZe6Teck/BPt1iridaQOjXPehd5iHkc43RX2XUwRDkid65rYJFifVEWN9vcCrEkX/Kq/++bAwv63BaH+KAxr9v8jPk2+HKaACaP7hjzjg3F75aYGXfsK1O8/wpgcs9E65D/edJxssvrlp6Z8dzGtINpfr0QQwocDquVeRNz14y2V7ofaUL5eigYn7ReTJv1llBB4DySOQmj/FRnT6gNc7FIeUZ7rAmbcJjtFFBCgQv6HLuHZzGojgFH3+2Prs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(956004)(2616005)(54906003)(8936002)(6916009)(4326008)(36756003)(2906002)(8676002)(31686004)(6486002)(5660300002)(26005)(316002)(38100700002)(186003)(31696002)(86362001)(508600001)(66476007)(66556008)(53546011)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEpITmowam5pZlRTRHRoMXcvUmxSZlNvUHd1dTlKejIzb1ovVlNYdFhMOWNj?=
 =?utf-8?B?ZEFLTlVYd2VCU0g2NWRMOUpibFJnY1p3VkVhMnNsNnF1b0ZBanFFN3QyREkw?=
 =?utf-8?B?c2N5WGYzenV2bmVuc0RRcmZKZDRZY3B4aG1Qc285WFpzeTNZcXdhK01rR0NB?=
 =?utf-8?B?OUNkYWQzT3MwZVhFaW9UK0FnQkdlTmVreUdJa2FDRWV4MFRkalFHdVlQKzFv?=
 =?utf-8?B?eUUyR3RxY2lVMUp0ODNnOTlyY0xXTFZqZzdmQXhueDFqRVY1SnpzTkpaVkpF?=
 =?utf-8?B?NGI3dUY2bkh2aHFVeEdySEJhRGVoVXBDeUdmT0E1NFhNTVgxeGlZcVRCNDIw?=
 =?utf-8?B?bC9EbkRLQTRiMFVmMnF0RXRFdnczQThLdWF2c05sSHpSYVd5ZElHS25Mdkxy?=
 =?utf-8?B?WUQvR2NGMmNFenRBWmViZ2lSS1lIVlVMeGhOYmk5SVUyeGRhR2xyUHE4OEx4?=
 =?utf-8?B?VnVsRUUyVDlSbFdEemdDNzhnaVRSMXFCWTdBSEFzeEFMUmRJR1ZvYURUUnU4?=
 =?utf-8?B?emorcUNUOHk5eEJoZzVpc2pHUFBxSWFuSlBJeDQwNVd2WWZoZmc5dFl3MFdK?=
 =?utf-8?B?eDNMR2lqNnJPWldmVWRoR1U1R3hvelR4UjJoQ2U4WVNLcC9XT3ordGp5SFR6?=
 =?utf-8?B?dTdHNnA4TDdzeU5nMytTNS9nWThQeGVmRnlZcy9uR0g2TFJaV2wwYU9FTWs2?=
 =?utf-8?B?dEt6dHFRbnZIS3FYVVQ4di9UK1pWV2J0M3lrRkVTV1R4MEEwVHRtWGIyazZQ?=
 =?utf-8?B?N3RCdjBPcDgvYVY3V3RHZisxdjBaOTZYdkZhbkp6NGk1RFdINEluRU9FUzNa?=
 =?utf-8?B?ZVlYdjM0Rm83UnBsVUFRa1U0MHFNSzRWUkdmbXk5UUhRMDluMWdMNUUvMEM1?=
 =?utf-8?B?TWVKcU5mUGhTYTZCempEMzk5aUNhVEpFaEQ1VkhpK25GWkRlbExBZFVNMmNa?=
 =?utf-8?B?ZmJDL3JwdHpWa1FWUUlvTEVDZm9ISkZvaE9YYkFJaDZUU1d4TTFzd3dGWXJa?=
 =?utf-8?B?WDFiaXpYbGwzWFJnTkU0NG80TUlxRHhGbkExd2djTTBGZnUremxCWjdHbUFO?=
 =?utf-8?B?RGNpOGZReUt3QncyN21aOU1EZWg4QndtL0ZUeEc4U0J0Tkp2Q2RGdTVsNmlt?=
 =?utf-8?B?c3RUQVMzMEZpMVAvTWNPdUx5ZXZrejU1TXkzVDlyQ2R2dzd3ZmJzY3A4NitB?=
 =?utf-8?B?b1YrQWdHMzRtWjFpQ0orTytLUFN5SmlZOXROellIYllHSDZDL3BMQ2FmT0ZJ?=
 =?utf-8?B?TTFDMzNLZXRlMEkwODh3RHQxLzVHVG83TENIWG9uc2dyWVlVWVlDMWJQejVY?=
 =?utf-8?B?ODVNeEZwM1lIU0JlUzJNVEx4dUpLS3h5UmlzeDhqZnRHZjBpMDI0SGg2R1hi?=
 =?utf-8?B?MnR6aFBOd2Y2aFlkR3J0dTJLUkhEKzZDUFZkcTJ4MGZvMFBDRUNvODcxNS9i?=
 =?utf-8?B?aFJZYWtBRUNJL3BZWGtQM1pRaWpEdURhYmhWVCtBdVpqc2Zsd1hwVk1PZkZS?=
 =?utf-8?B?MStIc0tJUzNja2FtQnhWK3FKay91SXdkVkFtelJXQ0ZNaDN5cHBFZmt0U2Ey?=
 =?utf-8?B?Mk42YTZNK0R1YkFZYXYxc0tLdXBFekxweFZudDNIUUhoT3hEN1U2M2RRRmVl?=
 =?utf-8?B?NjVxZnZMeVgycVJ4UE1EUXBLZ2sxMWxLQnlhVGJvQkJlbHZWQkkyZ0NLSXFn?=
 =?utf-8?B?akpVR1U0UVo0WkhVYWhwNkx5TE9BVXFrVCsyUFBaQVloY3RMcEcyMlRsZzVR?=
 =?utf-8?Q?nOyq7GjlVaEZysqgAKIQWC9PkZjMpa+i2DOJZVn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1e5405-761a-4e0c-8636-08d97cf9fc28
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 12:18:56.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xb3IzypI0oV/Ob4WtXvnxh64SrePgpv8ukSJwPGbL5pO7Q9x+Y7IDadBVyQufid6GICOEzfPjK/BR7pppzF39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 20.09.2021 19:25, Andrew Cooper wrote:
> 1) vpic_ack_pending_irq() calls vlapic_accept_pic_intr() twice, once in the
>    TRACE_2D() instantiation and once "for real".  Make the call only once.
> 
> 2) vlapic_accept_pic_intr() similarly calls __vlapic_accept_pic_intr() twice,
>    although this is more complicated to disentangle.
> 
>    v cannot be NULL because it has already been dereferenced in the function,
>    causing the ternary expression to always call __vlapic_accept_pic_intr().
>    However, the return expression of the function takes care to skip the call
>    if this vCPU isn't the PIC target.  As __vlapic_accept_pic_intr() is far
>    from trivial, make the TRACE_2D() semantics match the return semantics by
>    only calling __vlapic_accept_pic_intr() when the vCPU is the PIC target.
> 
> 3) hpet_set_timer() duplicates calls to hpet_tick_to_ns().  Pull the logic out
>    which simplifies both the TRACE and create_periodic_time() calls.
> 
> 4) lapic_rearm() makes multiple calls to vlapic_lvtt_period().  Pull it out
>    into a local variable.
> 
> vlapic_accept_pic_intr() is called on every VMEntry, so this is a reduction in
> VMEntry complexity across the board.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -512,14 +512,15 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
>  
>  int vpic_ack_pending_irq(struct vcpu *v)
>  {
> -    int irq;
> +    int irq, accept;

Strictly speaking "accept" wants to be bool, and ...

>      struct hvm_hw_vpic *vpic = &v->domain->arch.hvm.vpic[0];
>  
>      ASSERT(has_vpic(v->domain));
>  
> -    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, vlapic_accept_pic_intr(v),
> -             vpic->int_output);
> -    if ( !vlapic_accept_pic_intr(v) || !vpic->int_output )
> +    accept = vlapic_accept_pic_intr(v);

... vlapic_accept_pic_intr() would eventually also want to be
converted to return bool.

Jan


