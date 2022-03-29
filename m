Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F94EB0DF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 17:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295875.503650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZDza-0003et-A8; Tue, 29 Mar 2022 15:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295875.503650; Tue, 29 Mar 2022 15:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZDza-0003cV-75; Tue, 29 Mar 2022 15:42:46 +0000
Received: by outflank-mailman (input) for mailman id 295875;
 Tue, 29 Mar 2022 15:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZDzY-0003c9-P2
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 15:42:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df2c2fd6-af76-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 17:42:43 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-_WchDNYaPMmENiyDo3W2vA-1; Tue, 29 Mar 2022 17:42:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5955.eurprd04.prod.outlook.com (2603:10a6:208:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 15:42:38 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 15:42:38 +0000
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
X-Inumbo-ID: df2c2fd6-af76-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648568562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzW7+upfC/9vj6lPRwgSDHEMt44ugTfZCunqQLg8lQI=;
	b=a9gwX2AZD8W2EoVs4I9wJnyT/0DBSUTSKn5s+JWr6CblZyRHyd3zsuwV+h6QUtBAp4chcK
	BJsJqz5GznDjFf1CNuDE9CmR4ImxxdV5b2zKdKtiHNbd/TomVHi66A7b6IbmQh1VQPSC+D
	rjxqtDRt0goN3IFo3ZqgfcxA31Dmgh8=
X-MC-Unique: _WchDNYaPMmENiyDo3W2vA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZIou94oPy/UbaThzWNdEafRDdgleG0S9ttAQFXrMcFYKsi16czqeC6gslnOjWIdi5DvhkPogE/sDm14Oe9XVSdc+4RL4NuFDTuG13eCmeLMKEjtcOR1yABWNWi350bCaTU5WmkjqFQp0Ae5TF+YMZ4/W31aeMcnzjqRhRPSeACXH9jewW5aOf61T8cbTOQ81FZd533L6beV9jxOOHYQNW0fGSjulNXnIMZ2HZdh/mS95ul9ZabZ6VIEVtQ9GEbfqcF1mm7EJZSdDcj3/z0gGVYRqi8/vaU4hhmdAJUDnY7R3W4GV16q+YDajxhMdM4d5xpcncnRIfYoHUejK2/NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzW7+upfC/9vj6lPRwgSDHEMt44ugTfZCunqQLg8lQI=;
 b=A4o9P+nfUbDv5Lp2YUVWZak2OLuTEQzoeEJ+z1nv3hFfbAYmaA+TBvdvtVTLbIXlxvaqv1m56oSE41X0pC98E1KhGGbvGksEGKJySwq2ER4I80OeeiFGXc89PlP7CEy0fDDVcMwP5cbtfMSgC5vO+/1uhXpN9/XXfFxif7oWedvzcSkI21gMVOBUbYznbfde0YHybeII+sA99FL77McclKLTaL637fb6x6bWet0AA1YpH0+5wEqBU9C+sMGQGNSsIylAdKPS7NuJA1Rv5sK2BNviZAf9faGsPoxkU7haLoBMSpFPhqaoCO3TUGAotq11spM17lix5KUVRIRZ4Tp7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04459197-458b-8d10-2692-981495c0e243@suse.com>
Date: Tue, 29 Mar 2022 17:42:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] x86/mem_sharing: option to enforce fork starting
 with empty p2m
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0048.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d3c8e5-5fc4-4869-0f98-08da119ac086
X-MS-TrafficTypeDiagnostic: AM0PR04MB5955:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB59557996F83B6F882DF61C61B31E9@AM0PR04MB5955.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eHW731YR1NEmoOwhP4JzQG4/AzE8229ckPh+FEYioIWzAp4c6YGa3kzgFaCapgb3NN3UAh3ketMMgRx7YqrzSt4ajJojzyUf1QOiz+QNqoYCq6b2TnkVmRQ83+Qwix2WE6A5PVr2xcZUsDpfN4P/ueuR3mWa+kWewCxe7DYOLmT9TqgZsEsh1Mf9DbgGKLhJ6yWlLdBa3aT4oxC94/hNf08f+1glzohKbnSo/qXJ1BYySJjBCmdeO8l/lMpolf+dICgkzPgYt5xLG0uFtSlPHLCznfwwkwlLDhMT1pvcsnMZKtAxWN0Yw75qqtVVbAcdUqrh5UQSQo4ImUy7WVYvcm6sfIVN6NZMoC1zRA5zMleFSeFN9S8bw5u0tt53+fxM+b6msahPrpjn5kMMhIklw4QVaiJnzGNM9ksUc+SkqwqkEWEnU4RhGzJtZvomHTYdNQNo9zgOid9Y5qmrTm8P/N2EkaCLhBHmmuiRJIh5Ie6PG4RVxXREiAky4KEMYXe/1iSAUVrZ1TOucwFbY8Drt8SMeGqxxwCJv92iAhcV7Mo5BOxHErcoGuTXbFz7nHZItz3et8Ka5134d3qyh0HDCfW4VIbCuc/ow6wVWGtAF3z+QKc/QQw7UN7U4f1+7HvKfvVgRGPCMNNud0Ptf8WzeyY7hj6p0W24jC/IuCtlrFPDpjteRViFJOFMySu2mQdtzhhvGDUPCWxXFutxQhuPHzKKVLhPerWQc6/bdvotldQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(8936002)(54906003)(508600001)(186003)(36756003)(2616005)(66556008)(316002)(6666004)(66476007)(5660300002)(7416002)(6512007)(83380400001)(6486002)(38100700002)(6506007)(26005)(53546011)(31696002)(66946007)(2906002)(4326008)(86362001)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkNLNDFUMEhCV01xaGFLbTZQVUloWkJYeVFUMm5adWV3TXk5WkJPc0hxY3BM?=
 =?utf-8?B?MVhVNGYwSER6eDFNZkk5UG1GdEFoYWhWckZPb244ZlVIN2k3Q3Rsdks0R1BG?=
 =?utf-8?B?eXVJc0p0WmJvbytnczhhMmpEWkxYUlNOcGY4a0YwN0xIWWlEd25YR3VMT2ZT?=
 =?utf-8?B?TUhEdFdEc3dhMVMxbmhRSUd5S2RwSmU3YjZpZDVWb1FHMUU0ZlhaQlF5Sk55?=
 =?utf-8?B?aS9FT2pVa3FtVHpLUm5PSndlRUwxVGQ3M3ZKODBKUTlXYnpUaDNzeVY2c0pE?=
 =?utf-8?B?cFRSbXVnSms5Si9KdzhxRHpDNmZuVGh0aHNjRnNibkM5ek9tRXhsa0txYkht?=
 =?utf-8?B?ZnFLYWFwNWtzem9DMHowM3NsVUhmcWttYytSdXhrT1RqMXpsOWNuc3NjNi9n?=
 =?utf-8?B?OTFLTG5GZWs5TC9vNWw5d3M0THlpUld6d0dSZ1F4dDhtMzNTN2FiSUdrbnkv?=
 =?utf-8?B?azlVdkpHc3V2NmduNkh1QjA0eVpyY1JoY1NxcFk3NWMrRzhSRnVLalNkck4v?=
 =?utf-8?B?WTBONmxrd0NwbG9wWTZyZE1kd2Y4VFpWaFljMFp5WDB6TVViQzRkamx1bjU1?=
 =?utf-8?B?QkIra1V4VlRvNWtrT3B5U3Q5azMyMGtmSU01MzM0NDNJaE80dUgxQnpRVDd3?=
 =?utf-8?B?N3RkdURJQ1Uvd2lGY3J3VThNK1FWY0phM2xveFpRSmJwa1N2Umttb0JjcGZl?=
 =?utf-8?B?bXpJc1pqQU90aUtRSVRhY1BoZGt6ZDcxQXp4YUFLQWhpZVFmU2NxUXUwbnNu?=
 =?utf-8?B?TDdRYnNxQlZobG5tRjRwMjFvSndsOWhlZnFNTi80UnljcTUyQXVDV0xkclRF?=
 =?utf-8?B?czVUUVRIOTBNOVhiQmVtVXN4WFAvM29XVVFBSFdYc2NoVWdXT1hzb3dIWnFP?=
 =?utf-8?B?bGhrOVdHOUpuRVJPbXlaeVNiSjVSTkE2U1V3MHZxdmVIczliM1NRYnROb1BN?=
 =?utf-8?B?UWc1MWx3NXhpTUhzMkJCVURnYjBPUlhQREtyNWVVcldSMk5oN1IzWktDYm1t?=
 =?utf-8?B?b1BVeEtTcFVnVUo1N044ZHo3bzBxQzJBSlBYV2FqcDNyNHMrZ3M3L29IbFVs?=
 =?utf-8?B?UDVlaXFOYTkyeWJmdUZYb3NDNTVYSlBGVnVuUzIxbDk3amFmV1k1emdFR3FR?=
 =?utf-8?B?RElndmxoZkVlVlNma0UyYmJ5eUk3RndNaXlKaGwxUkdNZ0d1QzFpMU9oNU9t?=
 =?utf-8?B?QVJFbVNEaGl5V0k5TVNrMnNjV3lmMTZpbFpwM0NRRG5uOExuR3piakVLVkpa?=
 =?utf-8?B?TFlkZW5jcGd1OThab01rTWhJYkljNWE1c3VHRzdpUUVtOE1qbnVvSG5vVkFj?=
 =?utf-8?B?aEFyK3ZpTUF3Vi9JdnNZNDhWSU5URUllNXhLbzFKSHRIUW8vRllLZnpack9Q?=
 =?utf-8?B?U2ZoSTVTc1lBTVpZOVJLTFk4RGxQakxhRFowYTV0K3lCODZtVjd6cURpM1BB?=
 =?utf-8?B?VUlpSjFuZ3N0d1E3b3RsbUdySlQ0MERpUHR6SVN1MEJxVTN0RHpTVXYyQkd2?=
 =?utf-8?B?MFV4RkZ5QXl5cEU0UExacmI0R1l6S01IWXZnMkVDQlpYT3BnRmRyeWxOSEtH?=
 =?utf-8?B?Tk5ZOHZsd0xKV0YwczVOS0pHbWliVHo3a1ExeFJIUGFUeTFPQ1JUTnZNWGlk?=
 =?utf-8?B?L1NRWmxzYlJDL0lzYVl6S0pGZldHcENXZzdIR3d6d1I4V2NzTkoyeXhPWW1L?=
 =?utf-8?B?U280dldveStJczVPY2Rid2RJSHlLODZteWNVQ0hsMUZVbE5WWEhCWlVxQklE?=
 =?utf-8?B?bmJGcDRURkt3Ym40UnBhTjZ1T2dBRmNSbTJWTjJQNFRIZnpMUGVTZVJRbk5z?=
 =?utf-8?B?Um92ejBVbVVyWXlQdnRlaFd3bTdQblRyM2kvQ0VjRnVGRmlLbDNUbk1YeGRl?=
 =?utf-8?B?MGpjSXRWaDB4REJFMVJFaUVhc3ZZZ0NvU3J5cDF3QnFuWk1qZk9aNE5UYTNB?=
 =?utf-8?B?MXlhS3pKcks5YXIrMGpNaTBnbWlEVkh4SjlyL3VMTlZtTlNCN0xIVm5Nb3FI?=
 =?utf-8?B?ZllmQTNPZmdNNjhoZktHQXVLKy81Q0Y1V3ZMVG5qdzl1U2pWZmRPVUN5Q0dP?=
 =?utf-8?B?V1Y4QXZIM0hoY2xlU0hBZ25TQlNybW1iRWVoVEZlUmEwQ1RyLzUrdTluaDZJ?=
 =?utf-8?B?bnNhaGhkaTJ4MUZFS1Qrc2dlN1NVMVBYa1k0NkZteGFOTGx2RkhkeFlKQXNZ?=
 =?utf-8?B?MW4xOHRUa1lFV0JWV0xuVEdnemEvN1JYQTFrYzkrSitvbE50Y25YVE1lRzZw?=
 =?utf-8?B?aXdBMVVIdEVOb1phVm5YVU8rYXB3VklMZ0VNZE4yYzU4VkttbkdBVE9tWDl6?=
 =?utf-8?B?L2tXWVJ2dU5IWVZwUnVPMXhZNTZKRnhZY2hhK01Udyt0d0RkcXdmUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d3c8e5-5fc4-4869-0f98-08da119ac086
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 15:42:38.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUGtyZ+XJ744VuijkvDGOpKN5S0C0d/BCDUQRAFNR5dyfLrZcyDyVrKPI1p6IS04CehbNxNBZzaEpzb8rqldqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5955

On 29.03.2022 16:03, Tamas K Lengyel wrote:
> Add option to the fork memop to enforce a start with an empty p2m.
> Pre-populating special pages to the fork tend to be necessary only when setting
> up forks to be fully functional with a toolstack or if the fork makes use of
> them in some way. For short-lived forks these pages are optional and starting
> with an empty p2m has advantages both in terms of reset performance as well as
> easier reasoning about the state of the fork after creation.

I'm afraid I don't consider this enough of an explanation: Why would these
page be optional? Where does the apriori knowledge come from that the guest
wouldn't manage to access the vCPU info pages or the APIC access one?

> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -31,7 +31,9 @@
>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
>  {
> -    bool enabled, block_interrupts;
> +    bool enabled;
> +    bool block_interrupts;
> +    bool empty_p2m;

While the name of the field is perhaps fine as is, it would be helpful to
have a comment here clarifying that this is only about the guest's initial
and reset state; this specifically does not indicate the p2m has to remain
empty (aiui).

> @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
>      if ( (rc = bring_up_vcpus(cd, d)) )
>          goto done;
>  
> -    rc = copy_settings(cd, d);
> +    if ( !(rc = copy_settings(cd, d, empty_p2m)) )
> +    {
> +        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
> +
> +        if ( (cd->arch.hvm.mem_sharing.empty_p2m = empty_p2m) )

Is there a reason you don't do the assignment earlier, thus avoiding the
need to pass around the extra function argument?

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -543,10 +543,10 @@ struct xen_mem_sharing_op {
>          } debug;
>          struct mem_sharing_op_fork {      /* OP_FORK */
>              domid_t parent_domain;        /* IN: parent's domain id */
> -/* Only makes sense for short-lived forks */
> +/* These flags only makes sense for short-lived forks */

Nit: s/makes/make/.

Jan


