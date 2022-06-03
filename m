Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E573C53CAB5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 15:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341524.566758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7Rp-0001Lr-0P; Fri, 03 Jun 2022 13:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341524.566758; Fri, 03 Jun 2022 13:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7Ro-0001Ic-Tb; Fri, 03 Jun 2022 13:34:40 +0000
Received: by outflank-mailman (input) for mailman id 341524;
 Fri, 03 Jun 2022 13:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx7Rn-0001IW-Hi
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 13:34:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea115958-e341-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 15:34:38 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-iRY8a7jENmiVE1X8zdFP3g-1; Fri, 03 Jun 2022 15:34:36 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9396.eurprd04.prod.outlook.com (2603:10a6:10:35b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 13:34:35 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 13:34:35 +0000
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
X-Inumbo-ID: ea115958-e341-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654263278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+PYYSk4JB9FNIbJmOdNxrClAU6r3UY0d+7IVas+AGM=;
	b=G9cgz3IaK2n0M0dOmbt5iCuGtmGu95heu/fRn71M2ZQy+ccEQF8VsaThkcr2ZQundI9xGm
	N3F34FlLkDiOXC+K0GVZ1ZCll3HMtHhGuRK9QcNP148wHNglPO1n+EJTYpGx8TRBAoJM7P
	7i2BrRfUvT97Z59DFEwA/nnzRUHoCes=
X-MC-Unique: iRY8a7jENmiVE1X8zdFP3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXN7Ef71MRwX+HHK/NpAPMYrqZMNsYYSa+nseApM98shQw2zBxqK1rwiI/oRYfuIyHtr6/8IDjGVhRbrv4MSrJPWr1GukVAKQCou9n9eqS134IfKy06Sk9KUHxZodiNOCXzoML8grjN78SSyeCNluaUIOt6GvEGB9J7LMtfuSlDIczkMeu5YYLXBCyKdhy1+gXorsSlioyHPXSb93MqJ1gV56G9RYBaGvbECu+P5wnkcoSRhkVdQQT+V9+BnUarvXy6iKQVSCktMH9tc1gQyrnRiH78vCjVoG4YCxClNEufsYauCjonHF217cqORVqXNlwUb8O8nXo581NKX+D5q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+PYYSk4JB9FNIbJmOdNxrClAU6r3UY0d+7IVas+AGM=;
 b=m0rhoSkto9Q7Rhmz+JGZBWYu3zUC1umKR8GuF499R55SyP/jFHxYDFiaSocYkWOQKsKZJKwkSM96Za+Ron0yrLq/KSuBDY8gkIaf4yL4MHRstKUXgQ3KYa8qZhya/ctInjEet73gtHyem72vWPc2ub9Agpw4+HcXhdnE6fJvbmHN2DJCPaZT2d3igQWIUbOadbt7sITB2A4CKPIfkJJLjPhRnaoHggn/vSiLovTqAkKdEC/PiEU+Szn8lHMeHDVlS1YWksBNvSZohLE+hzz7FY486cpAv5YQ6rbHlDvMsROEC2tiWBY+Q2CyclFH0YozcnalymNOk6KzoWjurV0Pag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <febbff78-6a2d-f2fb-d8ea-a15f97a3abf4@suse.com>
Date: Fri, 3 Jun 2022 15:34:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC 3/6] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421132114.35118-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3948cf2-a3c5-4b26-c95d-08da4565cc16
X-MS-TrafficTypeDiagnostic: DU0PR04MB9396:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB9396EA8F1A9A487B70FD3632B3A19@DU0PR04MB9396.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g9C47gJQldMxeg3pFVel2exSp2bz2XXyV+pvXnf8cP58ZUZg1lGdYkYL3a7bQXXBdX93ap3SCg9IouXO38l2cnyCdCxVEPaFIFgdGyHpUvHY8vMvdB+mYAmFXpoWNeAesq9kwzSoTkm3b9//sJGg/QBKYYyI3aq3hHIGekGSHLtp36u7HKVEKMqnp1qvivypC2oHHYNrWXQl/Fm0aop0/YJc3+GjMU0Ri8UagV2QJ3gaFIGzD7rAMlHcb4Y291ex2enggPKzJFVR8yzqX6UaCf+pphdsmca8j02TSCIbLlaQHsXFmwglEQTSZihqRRalM8ReM37PPxaqTaq+difCU48RTL/Arq/X/zQGGgfh77QdPLg1AcBF46J0TLnzsyo9dzQVXnKGxuLR6C7LT5PCUSHm09uksCD6cE9xg4xH3/w7RbFXQtdblbgOJgjdlnma17oYfESpTliGZmp5opnPeZIYqw1eqkMfwhqAuzw8z/r8ftjR3rs96+zmVXQz4nTCQUC3yevc8Yy9J1ocTYmhLdfOGOSl4IaR1tRJ0dJf5fhvRHODMOSJ6kB4kaMe90Y68PFuHEqCFUA3CGaqyeFeubw1DUvzxs39OGnA6pz9OJj4xpCfIaf78mUg5xPT7oycUPGB/sT4eu9FqQ3un9lLYQ270lBpKdQR5Knh2KByaQZ7pN2reTHMpM2pq9oKFt9AJBnnPpH+cvx5k+qnbPBJ09KvIVF876pQkg1kmEvLD69/7955ysZKNvqMgjQMOHkW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(26005)(6512007)(6506007)(53546011)(6916009)(54906003)(31696002)(316002)(86362001)(508600001)(6486002)(66476007)(186003)(5660300002)(2906002)(66556008)(66946007)(4326008)(31686004)(8676002)(8936002)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDZoNjYyQW1BeXk5WG9mclVKMmpIYkwwNFMrUjIzMzRIWFRVaHhpMk9ZcW9p?=
 =?utf-8?B?YU10UzE1RGNDOE1GcjRGVndtRk1IOHZpbTV3Y1ZxN01IZ1k4REFOVXhGa0pq?=
 =?utf-8?B?ZGlHM1h5OWJjQ016VFMrZ1RtcGZNMDNBblZrQWh5ZVkvUE5XZmwrcjBXSUND?=
 =?utf-8?B?eHBSQzIxTUozeG4zS0dkcHRMWFFpejU2amR3VE9CZTJNdEtVVng4czBxZWxz?=
 =?utf-8?B?NDRaNi9wRXdPcXl5NlNVVUowaTJBc2tiQTNtS1p2Y3JKaThIRGxaZExlQlpl?=
 =?utf-8?B?OHFiOS9CcW10VFhyTE40NWRmeDVnN2RWeWl6REZrVHlaVFFaR2N6cks3YXA4?=
 =?utf-8?B?bFRybEs5bW9jYU5DcXgrUG1mZWJoSzZTbU5IeTFDOUZhUVRkQWQyM0ZVblI0?=
 =?utf-8?B?OGthQWlkajhFbDJxQUdrN212VGlsd3dHbWkwN0pXU0RQaC85RTc0eWpsaEhm?=
 =?utf-8?B?cUZBbWlJTjBQczVSU01jcVIvTnJLZkhYMHJxWWh0dlhnbTBUSDdWKzdaanZD?=
 =?utf-8?B?Vi81UkdMV0U5OHk0OXdjNUxwdHIvMmhrbjM0eUx4TlVXY2FjSlRnQ2VaQ3FL?=
 =?utf-8?B?TEp1ckZ2N1lUOHdZNnY4QWxGWHZIUnQ1NlhEcUVGSkV6a1V5QVpROHNBaUpq?=
 =?utf-8?B?WGFBRWlGbHdxTVpLS3BkZVFjZkxsWU5laWp6SUVkNy82WjVoM3Z1NzZoaDF6?=
 =?utf-8?B?Y1oxV2dNOWgyTmF1UTlGdGhzNjgzQ2tXT0lZVUgwRjJJNmRjM1pjKzB3bUx1?=
 =?utf-8?B?cEl5bUxBVjBZOE45OHRKNWU0a1QrQk94ZVRpWHZ0ZFVLa0RkVG1od3RsWHRH?=
 =?utf-8?B?T2t4TlNhaGZlMlhTUDR4NGE3b2k0MFluYzZxSVdsRFB4WmRnaDFJVzRFcU92?=
 =?utf-8?B?ZVFtVkJydkZ4Zi96UmlRUTJYWDRmdGtrNVFRQnNWdWVMWGx5QWloTHEvSU55?=
 =?utf-8?B?QmtEYjJobGFqcEg0SXNPYXdqdEFGcFNBVHZNcDBNMkZpV2J1b3hNQnNTajNK?=
 =?utf-8?B?RVB3Z3VVa1Frc0YyR2hUQXpoTGlsU0lqUTdQWFFBUVBlOTZLaGNZVmU5Mm5m?=
 =?utf-8?B?TndsSWJJbjNQdEhrMHpsVEpuU2FNb0hENE9XcVZQcVRQNUFJNXBpZ2RMVFVh?=
 =?utf-8?B?YlZmUzRjUmhDRHhrd09Pb2cvK1FKS25vUzBhb1JOdk9jY0R3cWpCL1N2aTN1?=
 =?utf-8?B?WnRMNGxzRGVibzBwdDhkMkoxU0QvbU01MEh2U2dIN0xPMUt5d2lha2YweG9i?=
 =?utf-8?B?L2V0VlhSbDRxVlNiZEFlN1B3dUF0ZHZ1c0FEZ05xamZhdkRlSDBJWlRYWWtT?=
 =?utf-8?B?elJHYWV2dUtXTmhnY1M0QWx4R1E5dlExOE1NNHVrS1NXRUZkVm5BaFlGMXJl?=
 =?utf-8?B?WlpEUzk5eEVoK0puNk5IbWM0WlNlQW1qN253NVN2dzJsMW9WdjVpWU5QTUps?=
 =?utf-8?B?c2hjV0Q0M2YxaUhwK2VOTEpvd25PNzk0eUtxZGNhdUJVOE4rVlJWUXhUaXpJ?=
 =?utf-8?B?bitWVTRDSkdPNzZ4VnJONnlWelp6czA0VmtaaUdPaitmVzVpWmdST0Q2ZkNW?=
 =?utf-8?B?T3JKNDExdjQ0Sko5ZEJ6amdQNEx2NkFvelRaK21OckQ2bTdjM2lCMVpOYXQy?=
 =?utf-8?B?Tm83L3JNakRCemxqY0RQSGFGcFc1NGt0K2N0c2hnVzUzK3BOcDF4ZWxsSy9v?=
 =?utf-8?B?MjNKL0ZZZVprdVFlVndOQUVkYXY0YVVtbjNPek5mYWFHaHBIN0VZajQ2a3Zk?=
 =?utf-8?B?TmVRaUd2UHhEdWoxdVZ6ek5hRlFiaWZPN2tpRmpTTlB1RXVkbXMxNll0MU9x?=
 =?utf-8?B?cVN1bUZOQS96M040VGFJUzVPYkR3ZlRYcjJXcGJRQlBlWWoyLzdTT3g5Zko3?=
 =?utf-8?B?R3ZnYkJTWDhGOWkzWUJKeVR3ZlVqSWpFL2dRRTFreVVIdzJVbEpCWUNNQW5t?=
 =?utf-8?B?U3YzSWNFSFlYRThtTGxUV3NncWYweTAvV28vUGptaEE4RWRuczQ1SkZoOVdt?=
 =?utf-8?B?M0hXVVpZcTRvL3NvSHpzVzhhR1lKWC9BMlpNZjROdXNjZXllWXN2Nm9rWS9K?=
 =?utf-8?B?UFBab0g3ZWorNnZaZnoxb2VxcC9pNExWbHhaU2VqdmlrRVpvTmRVc2hkdEVi?=
 =?utf-8?B?UFVDb0ZVc0ZjZUFNbC9QQnpaeklKVThNQlBERWJocUlWWFRRMzhyMlVzZ2hP?=
 =?utf-8?B?RlBSSmJiQThJSnB2a1NoMzlNaU14MzNxUFkwUHlqSGxiWWQrdnEveWcvaERZ?=
 =?utf-8?B?Wjh6aGVHamlQQVJXeGlRazNCQ3E0UWZCR0pYazNZRDFtWUNyTnFTVVFBU1ZR?=
 =?utf-8?B?MXRjU0FxdHo4eVYzWFh6SC9aeHJOcGhMUDVieHVWNGRSbUNTU0tBQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3948cf2-a3c5-4b26-c95d-08da4565cc16
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 13:34:34.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxLvrfV155MmRlDt2K0hUOyq8qWCl9BBhmFUXTHM0DjOwjz/ovyxgYDMyqb/odAa44cFKE08GIr0bVaVCWyCDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9396

On 21.04.2022 15:21, Roger Pau Monne wrote:
> Do not allow to write to RTE registers using io_apic_write and instead
> require changes to RTE to be performed using ioapic_write_entry.

Hmm, this doubles the number of MMIO access in affected code fragments.

> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -161,22 +161,11 @@ static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned
>  
>  static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
>  {
> -    if ( ioapic_reg_remapped(reg) )
> -        return iommu_update_ire_from_apic(apic, reg, value);
> +    /* RTE writes must use ioapic_write_entry. */
> +    BUG_ON(reg >= 0x10);
>      __io_apic_write(apic, reg, value);
>  }
>  
> -/*
> - * Re-write a value: to be used for read-modify-write
> - * cycles where the read already set up the index register.
> - */
> -static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
> -{
> -    if ( ioapic_reg_remapped(reg) )
> -        return iommu_update_ire_from_apic(apic, reg, value);
> -    *(IO_APIC_BASE(apic) + 4) = value;
> -}

While the last caller goes away, I don't think this strictly needs to
be dropped (but could just gain a BUG_ON() like you do a few lines up)?

Jan


