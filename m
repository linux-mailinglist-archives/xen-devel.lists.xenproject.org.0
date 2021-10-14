Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366D42DEE0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 18:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209502.365985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3FL-0000CG-4t; Thu, 14 Oct 2021 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209502.365985; Thu, 14 Oct 2021 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb3FL-00009K-0d; Thu, 14 Oct 2021 16:06:19 +0000
Received: by outflank-mailman (input) for mailman id 209502;
 Thu, 14 Oct 2021 16:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mb3FJ-00009D-Ub
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 16:06:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8184e60c-16d6-46f9-a890-76f9ac238602;
 Thu, 14 Oct 2021 16:06:16 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-_60D_4KhOZ2SuHj3OGy79A-1; Thu, 14 Oct 2021 18:06:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 16:06:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 16:06:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0050.eurprd03.prod.outlook.com (2603:10a6:20b:469::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 16:06:12 +0000
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
X-Inumbo-ID: 8184e60c-16d6-46f9-a890-76f9ac238602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634227575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RlA0inKH5ZR5TLQoghmdZ7ymt7NJrHc0t+FKcbdTdMU=;
	b=ACWwhX7KN5eInWD0wvS4W1wis43cvO2+dRFOG028+q9WaMEAXoI4ntoOg/xlcw9rCAwWKf
	Ze7LRpMHil0B8/GLFA/oxh6QkCJxC/DLZcypWdU/hIEofRXWIai7j6HSBXsAXZCYdRNz45
	udmI78HBbQYkGwmqNY9e35JEx6QAyII=
X-MC-Unique: _60D_4KhOZ2SuHj3OGy79A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPmI0kZa8MbNUZucmpuFyvpcwamc2INZANqlJKOd7p6tEabOGQe1W/yeOl3ffJbgzEdf3WHKPH592fM/0AYsb+BqS5iWQULP6aKWc4TNwFUltsQDA5nWeYkkLEnBxqeTgKiLX4f1M9rNoB+itD+tImaQADYRDs0HWvGEDck0cFBbr0cfIv4vGtqQYsXPPxCwNJyzjo/VB7wTNZii9PNf5wpwz845gLn0418nJQQxeC+mxfL2mgfoz3kfb9VnglVt+UwT4QL1Lvdy9Ziyhe8Ujw0GtBxzviTNaGvAMj8zRpoGJPafwFK8WA0bh18LPR0ujVYoN/CqJ9tcOL29J1UoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlA0inKH5ZR5TLQoghmdZ7ymt7NJrHc0t+FKcbdTdMU=;
 b=A2COEWrl78MFyi+AHLMCVpD8jW9T4v7SzHzPcc8i72EYmDXww/z+abFyFApO9SPU7rb6ByLbUFuNhAZ4SUXg+y+yGqOz/H/wZ8Lcg6Pd/4SQpPvtuLnMB26qIY7Cba+loq8EJQb2ia0Y+XMYRPldFHjItP9ItC1Ci8eZJhnxM3neS1wJEL96x8DFH1uf2yd5Uo9QKw+jMXtK9w4cBVvqlvg2/DZc6U1gepXp/TzNIg+HZF71Zl7XGcrqhpKwH93mNpnXXKb7KFV0YT4Pgno5zgQt+9f2MTOxYzxDRsv8MMMJnZLQXo+Csvbv++K7lqoBbR+/Dq+FKKRB9G4lp+k0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
Date: Thu, 14 Oct 2021 18:06:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e647b40-124d-4c81-473a-08d98f2c8b14
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46062E96B6CA6F81B1C536A4B3B89@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aick6tYq9wt/oX3gHKj6+H+Zqis+64LRcabg8+/Af7AkuN+M6nMnsHYKOoM7U6eY7AKwDtASl8sYnoFTDXfIFMwLURrGd9in8Ji5z3IPXCQgCR5/D8On2A+l+jJO9mOLQy8Ye35dpW+/NpC8724/WrewaNBZlWA1X9bPRS/mBQsDcz5tONrcekIaOTr6wlV/d/SbtFelPHDZ+ACf8dBls7i3NIy85Rjqz7IMCuv3iBaVAizXqQ+t2jklNmBUzbPFuugym4FKp8zSQNMzbB5tagGjMw5UvGrSVSjGtIDu2Vykcn6YYkCKfzVLghi8vU0i8i7zSfseSr3lVNMq2naiZdric6ICToy4r81aNq4QkDtct3HEhrvBgaMZ+6lvdQ9kmKWP6g99hMg1ylg7J1wsYUvCsXrmObSQeQEDwabJSm+8MecJIiAZnuPK71Jup2Nivnov9CrdVLuA3eSKIm8HLpX1wWfHMGxyghqAfwfTzhJLA8V3PhzMscdCIPHaS+U33aPY6QI3B+e56XCY96Lvh9WG8sphwUBgIi3xkMKDNqo0HdcXKL42x+oAPFj+U47f1rRXG/pf81ymHUs/WEO/fzMdo1HWDoo1Zff97BSQk02byn/k5+4kViQQKo0IDyoSOoOebJkulSICzW2Ti1WgyQBXur7YlT2RWRbiz49LyTzVUs5vR4w7nGulGfpx1ppLqqpJxQILjDpCDiICjTeZIx/ZCF+JGrO/GRxn1kLF7HQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(31686004)(4326008)(66946007)(508600001)(83380400001)(2616005)(5660300002)(36756003)(316002)(6486002)(2906002)(53546011)(38100700002)(66476007)(66556008)(8676002)(86362001)(6916009)(16576012)(26005)(186003)(31696002)(956004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDdUZDBVaDZHRCthRmdaK0lSbzdGSUNaSi9sd2RJOEdsRHNIcE94ZEpWb2x0?=
 =?utf-8?B?cXZ0ckU3dllybElyM2paVTNkUFU2QS9oVlFqeEhyeENmZWFJVUt4Qk9VTm1q?=
 =?utf-8?B?czhpVTZHZDNmMXpVVTZjTENOeGVrUEU1S2haOVVDbWRrYVdSUjJWNkZDSTZt?=
 =?utf-8?B?VkR5MXJPZnJtbjg0VzlNWTVKSnJKd0tFOFphQ1pQcnlqT200U2dDNjBLZCt3?=
 =?utf-8?B?aFpvcEp0RGZNRzV3YmhWQy8yUGtCT0FmS2FuTXJJdFFMTTY1dDZyNzV0TWR4?=
 =?utf-8?B?dmdnMVJuVzBHdnh1QUNGRkhQTVFMTktYajR1WkZSclpMaHJYdU1kRTRteXNC?=
 =?utf-8?B?S0RGcXQyVmNyZzJtRDJ6ZjFLeGtaQWdvRFdXTUY2MWpMRzVydFIxVDJJVGMy?=
 =?utf-8?B?ZG84eC9BQ2VVcXRFVkIwV0dIcUNRa0pvY0s2VWlsYnFaTFFIMi9JRjVSTzJy?=
 =?utf-8?B?NmZpenEwNEZZNnhWdmlkbkFEZ0FxRUZ5Snh1RzBRSk4xZUtHSjFPckt3dlg5?=
 =?utf-8?B?ckw0Tlh0K1M5Zm94ZzdEVUxMeTl0Y3dQUkdmUFJyNVlwcWJtSUhyQ04vR2gv?=
 =?utf-8?B?a0hqTGJmck9oekJ3WnVlTUY2VE1OQnVZK09KMXZ0c2d1MGw2QUhDYjVycEtD?=
 =?utf-8?B?S1FrVG1FSy9aeVlrMTdyMGZvL0c2cVVtZDEyWVVnM003Wk5XMHRnOGZLRm9B?=
 =?utf-8?B?ZXNoQ0hJcWptVngwWkpSbHgrMXVYWktPZkg1eFp4blZ5czFRaHFYeWRGNjRW?=
 =?utf-8?B?QVVQdUpaSXNXUlNLS2p1WCtjMEYybWZYUTBWZjB3VmcwWDh2UHlYaTJSS1JD?=
 =?utf-8?B?NjNJOVlhSm9mYVpoMXVvbHp1NE1sSUpXZkR2N2V6T2hVVFJ5NWdBRXByRUh5?=
 =?utf-8?B?Qmx5bTk3WFVVNTd4aFd6aE1YbHlhNUpuUEpuS2FpTXVTdXZLZU8vTzlMd3Iz?=
 =?utf-8?B?NzQxbjF0b0RQeWhZNVRBRnBTUzl1UXk2QWR4SlFGdk9lWk5vVXJ2NTgydjJj?=
 =?utf-8?B?Y0JxZmpJbFlOcHJQYytkQklYL2ROSnlIU3lzeEtzUGxFL3lJc25KN0R6WVlu?=
 =?utf-8?B?VzdJLy81R20rU0xmZEN2YmJqYWt2V1NHampLdlphM3NxK2JVSGpLbHhSaEJr?=
 =?utf-8?B?OTI0ek53L0h5NEFrMmhNMytycjNpNXBtMFF3c2NpOE50L3dJRVhVOGpaem9p?=
 =?utf-8?B?dENpS3hLM1RobDFyYlplcVRCSExKTXVGdUZmV3B3cXdZQm1rQ040bnpmMXgw?=
 =?utf-8?B?RFJyRVdlQmdMdmliSHlta3NzK2g2dXVRTzVKRGM1OE5ja25OVTVNNU9HaXky?=
 =?utf-8?B?L0Y0WWhxZmtta0hzMUttei92Qkh6Tlhmb2U2NWg5bnpXR3hSTjN0Qk81Tm5v?=
 =?utf-8?B?WUVFZnB6VkdpT3ptM1lSOStpTjhBaEtTVmVVZkFUYW1CcFlKK2pjS0FmZURy?=
 =?utf-8?B?cDZmYjMyYVlkcTNFQ0lROVVpcUcvVEFvWWRxVHlHUHFPNkZwVTFWRDRiUDBY?=
 =?utf-8?B?eDJjWEhNMGhLdVpHeGpPR3dRcXRnR1BaRU8rVXg1akRXUFFTUzFlbE43Rjc2?=
 =?utf-8?B?ZHFSN3RidG8zb0dEaWEvYkJkU0VQZUZHV2MwazRreHZMdkY1MFFMMGE4N1FR?=
 =?utf-8?B?TTdvRXFJeEZ1N2tjVFgxaFZiNzJVaWhrdEFIUkRvV3h4SW4vS2Y1MlMvUHF1?=
 =?utf-8?B?Z0toSEJlZWY5QVdSTkdVcGloSzRPVG5VcitJbWU4RDBYME42VjdhUGhkMU1w?=
 =?utf-8?Q?WTCFpGzOwC+syj8qeugZcwlOFMTQ/wChW7yx+Lo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e647b40-124d-4c81-473a-08d98f2c8b14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 16:06:12.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MNtAXNq4AHe6SMmsJErXNWjYr9ppn7044ZACBFZ5K0/DAGVoQ6QKYQDuIk3sdIi76kWZimw3BOEJtRuOGQXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 14.10.2021 16:49, Bertrand Marquis wrote:
> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      *data = vpci_read(sbdf, reg, size);
> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      vpci_write(sbdf, reg, size, data);

Why would port I/O functions call an ECAM helper? And in how far is
that helper actually ECAM-specific?

> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;

While I assume this earlier behavior is the reason for ...

> -    /*
> -     * According to the PCIe 3.1A specification:
> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
> -     *    in size.
> -     *  - Because Root Complex implementations are not required to support
> -     *    accesses to a RCRB that cross DW boundaries [...] software
> -     *    should take care not to cause the generation of such accesses
> -     *    when accessing a RCRB unless the Root Complex will support the
> -     *    access.
> -     *  Xen however supports 8byte accesses by splitting them into two
> -     *  4byte accesses.
> -     */
> -    *data = vpci_read(sbdf, reg, min(4u, len));
> -    if ( len == 8 )
> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +    /* Ignore return code */
> +    vpci_ecam_mmio_read(sbdf, reg, len, data);

... the commented-upon ignoring of the return value, I don't think
that's a good way to deal with things anymore. Instead I think
*data should be written to ~0 upon failure, unless it is intended
for vpci_ecam_mmio_read() to take care of that case (in which case
I'm not sure I would see why it needs to return an error indicator
in the first place).

> @@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    vpci_write(sbdf, reg, min(4u, len), data);
> -    if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +    /* Ignore return code */
> +    vpci_ecam_mmio_write(sbdf, reg, len, data);

Here ignoring is fine imo, but if you feel it is important to
comment on this, then I think you need to prefer "why" over "what".

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -478,6 +478,66 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>      spin_unlock(&pdev->vpci->lock);
>  }
>  
> +/* Helper function to check an access size and alignment on vpci space. */
> +bool vpci_ecam_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /*
> +     * Check access size.
> +     *
> +     * On arm32 or for 32bit guests on arm, 64bit accesses should be forbidden
> +     * but as for those platform ISV register, which gives the access size,
> +     * cannot have a value 3, checking this would just harden the code.
> +     */
> +    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> +        return false;

I'm not convinced talking about Arm specifically here is
warranted, unless there's something there that's clearly
different from all other architectures. Otherwise the comment
should imo be written in more general terms.

> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                         unsigned long data)
> +{
> +    if ( !vpci_ecam_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return 0;
> +
> +    vpci_write(sbdf, reg, min(4u, len), data);
> +    if ( len == 8 )
> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +
> +    return 1;
> +}
> +
> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                        unsigned long *data)
> +{
> +    if ( !vpci_ecam_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return 0;
> +
> +    /*
> +     * According to the PCIe 3.1A specification:
> +     *  - Configuration Reads and Writes must usually be DWORD or smaller
> +     *    in size.
> +     *  - Because Root Complex implementations are not required to support
> +     *    accesses to a RCRB that cross DW boundaries [...] software
> +     *    should take care not to cause the generation of such accesses
> +     *    when accessing a RCRB unless the Root Complex will support the
> +     *    access.
> +     *  Xen however supports 8byte accesses by splitting them into two
> +     *  4byte accesses.
> +     */
> +    *data = vpci_read(sbdf, reg, min(4u, len));
> +    if ( len == 8 )
> +        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +
> +    return 1;
> +}

Why do these two functions return int/0/1 instead of
bool/false/true (assuming, as per above, that them returning non-
void is warranted at all)?

Also both of these functions will silently misbehave on 32-bit due to
the use of unsigned long in the parameter types. I think you want e.g.
CONFIG_64BIT conditionals here as well as in vpci_access_allowed()
(omitting the questionable "ecam" part of the name) to reject len == 8
there in that case.

Finally, to me, having both "ecam" and "mmio" in the names feels
redundant - the PCI spec doesn't mention any non-MMIO mechanism there
afaics.

Jan


