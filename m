Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4813F5DE3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171290.312573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVRB-0005sD-4a; Tue, 24 Aug 2021 12:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171290.312573; Tue, 24 Aug 2021 12:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVRB-0005pQ-1d; Tue, 24 Aug 2021 12:21:53 +0000
Received: by outflank-mailman (input) for mailman id 171290;
 Tue, 24 Aug 2021 12:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIVR9-0005pK-NY
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:21:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dacf0d32-04d5-11ec-a8cc-12813bfff9fa;
 Tue, 24 Aug 2021 12:21:50 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-PIkU9koyMDimkvKH5qfvtQ-1; Tue, 24 Aug 2021 14:21:48 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB3970.eurprd04.prod.outlook.com (2603:10a6:208:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 12:21:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 12:21:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 12:21:45 +0000
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
X-Inumbo-ID: dacf0d32-04d5-11ec-a8cc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629807709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQRZWO6ZlMpw+i5AqLxdNypH5SSyoLYTkZVASba+Cx0=;
	b=HcKJLHbpNG79KXqwhbfLiOafgV2CBzzM3cJurA8ZnbZrDriP0I2DkuSko78Ub2KVo8xPhq
	aWiTZokogF6bE2K5foHUbUhn4/gXFmWAMSNGosJwYbqgSX+dmv98TnpKzQLus4EDimqJnd
	S9WOhEXx+eIP9cx4RAQtEOfAhodQ1pQ=
X-MC-Unique: PIkU9koyMDimkvKH5qfvtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiwF5gwCZruJsaZ+EIVCF7Ihh454oLtLxQ9UYHAJearH1QAjjHU50qCAzjtPYAlT9j4ciSmQFk4GR+KgOOETLvGVqrMvo0p/POxfWfEhmR3aHSvnKstG26SfA/EIRhK0z8xjgkYVjjigzSE9bdxnkh/MY1vvMSj5GOroJRfdlQY9Hmu/dqalhBpq46kwq+ihK3/Gkw+NXal29OUhqteO9IN/9QTdZKy/c8/RzZ2LwSqAw1EkhAEJuqPZ60B2bbJ7/L3zctffFLXAkAABJGcXsJuWUq+kbIWj8kbIQQ6gFQSeWO2hPrpowQCvsirA9p7eRfPqXOK8ZsaeagnB9ReUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQRZWO6ZlMpw+i5AqLxdNypH5SSyoLYTkZVASba+Cx0=;
 b=joUoI8r+6jULk4JWTqgcyPa74gQeGK+p3udeZOIqErAFfGavmlaYUnseaqeKuN53+eZmiWHU/rvR8VTI15RzVIoLum0G+ul+AbiA0r7/vSc6C09onfHnnyqGu+YZfcZBDJ0UGulJgJqxbvyuobfX3GFbfQYUJASIQSogdwC0yGuERqgB3NkbgVR/02tZhHGVgvuYecyQo+a9F4Z0X4A0qoGNMGi4DHTW0joqP1nZc/ye1iFyf7gKqVeXwB7LDcwjh1Skexw4AILHOil1DfBUfXY2aQve1rOUBgRllyXtG8lPMyJFJOd4aiefMumMd8iNaJTmb+b5++o7xdCkMkzi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 4/6] x86/gdbsx: expand dbg_rw_mem() inline
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7833b4a327212ff0fc816d17f91fa09291d6afc2.1629315873.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <625e262a-394f-a63d-2617-7aabe0b2b294@suse.com>
Date: Tue, 24 Aug 2021 14:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7833b4a327212ff0fc816d17f91fa09291d6afc2.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::6) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d73d837-13cf-452a-0550-08d966f9bd45
X-MS-TrafficTypeDiagnostic: AM0PR04MB3970:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB39701C2E8AABC7187C915729B3C59@AM0PR04MB3970.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKvUWD+CXMoOJDAONTOxGlj7h2Au1xlfNGks/CGEbDr9hSFTdrmPBiHB6IVwxqlO2QDqIYH5zIMWgNYJxgiORZpJ256BZUVccEq4KyF8Kjhf0RfDv+vPgnQzmUgBCVY50KGwIC8eUQzsN47pAC0ngQJcjQsio4qPGsH4k6RDNd0V9PT/0rf1OGrZJkX27t54mGzJTrJp4ZLubcXQU2pEPYS/LpXTVruXSnWD/Zgt7fMASw2hX/b2RoAaCkOPrbI1Mut4C8TxeQ81GoYBW6tqK59PtqDtG/BQX2VtOo9XDzU/IEm7goiM5hwjo8Pc9iZHJe/kgOqa+dnpG65V5SuuxWjkfdbTiVSjdcJndfST7mdJ+XyAOQAvFGel9PnVW9gGcFWqW3Rl1yDNBDPABt+/z+/dUeWf2IH8tDBP6y9ZmCm1J6hikmAiVF8fhnucpjeTLkY/Vw3hGSOZU+KnJHaCWKZQPEH+rF00G888/OaGrTsGLuHivymOPzydPNu+Kx0vapBH8GnDj2E1AiafLyIipJzczeEJfD3CXa8sKV/x/ILq0rAJNggvPgO8wDMd0LLunVl7NsVC1rwig5UqrnGmmMrbzdZMtq3wUaELQ7MYr2obbG9ClhaPbgFzfcEDFNPOq2+TsYVN3/EGwkW8ktXPQkPdvQ+xQ61Wm7rnOYRoEUYfgAgyDDq6INjzH4/bECvzG8kAHAgQCz1O0GUOzAl0yiCVDiTuXeRZWs3r+qrJc+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(53546011)(54906003)(4326008)(6916009)(8936002)(86362001)(26005)(2616005)(7416002)(508600001)(38100700002)(8676002)(83380400001)(5660300002)(956004)(31696002)(316002)(66556008)(16576012)(66946007)(66476007)(186003)(31686004)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJTZUh5VnpCOGt3cktMYlE1TDhnaDhBeUluZUdEeGFtUzB5OTdoR2VQTFlV?=
 =?utf-8?B?YlVCcU0zY28zelpGcmJITUtRSVdVVXdseWszV3NaTEFCL0ZWaVVxQzNvMWM2?=
 =?utf-8?B?bWdwamErU1d5UlI3TmptcmpvNnBpYUp3YXVUN2FkS29qNnpkMDZiVTlXOXpw?=
 =?utf-8?B?NGQ0UlptMTFEVTFDdTNaRW02VWZRaDhhb1pLclhuSm9ZTzltZ3I3bGNOcGw1?=
 =?utf-8?B?TmROaHk3MkdsZGY0NUFvOWdsUUt3QUJ0YWpCWk1FY2hJMnBqWkFnZXMxZSty?=
 =?utf-8?B?cUtDMzVuM3FrM2VHWVlWaHk1ZGF2blhtOGc4QURNbitzNnZPbzhaTFpoSXcv?=
 =?utf-8?B?SzYrTEdvMU1uZy9JaWlIY2kraVpWeU0rM2Z6K2JOZHJLL2R5UlhNRFU5YlRZ?=
 =?utf-8?B?YmQ5RzUwRk1sZk1sZTh6UXd4RHBFRnRucUpFdUhWYmNYdlRPUjUvZ2psUCtW?=
 =?utf-8?B?NkxuNTE4eWVpb09qNCtaNTg1ZG53WWZFUGlQdFB3S1ZtclJhc2czT2o5WWpT?=
 =?utf-8?B?bjR3K2YwczhZYUJVQzRjVnRBQjJrM3NiVzRuVFY3bE9WUDVVUTc0K1RCTkhv?=
 =?utf-8?B?MW1rZHFOTllvdnpEYWRsYkFCYWhaR2dDQWVGcUNFa0l6Z0M5R2V3bnFmWHcr?=
 =?utf-8?B?NEQwVmkrNHpsZ2pxbERPZ0wybWF4NEt6N2lsKzJJSWoraTdEbEoxRkx5RmVB?=
 =?utf-8?B?VEl4V0FBcmZZZ3NMZTk4T0RPWGlHNHFwTjgyNGhwdzhraWZBZUs3bW9CSjRB?=
 =?utf-8?B?WVJCT2wyZGpWZHJJalY1aS8xQXR4NFAyenlCNFpCbG9RU0UvVXdaellvejlB?=
 =?utf-8?B?S09FSENjeDk1OVd6SFZxdHJHc3lLY3JzTUZDa1l3L29jaDlHT3pNZkRUR2JH?=
 =?utf-8?B?NlliWXV0cjJwN2x2TVJWUjVhUGhKTCtxSEN1NWZqU0RYQVN6M1lVUzVJUnYy?=
 =?utf-8?B?eDFYTkRMVTdzSkxrQVNHdk1taG0rTEFmRmxscHRYOUJ5TnRQbzdOT0Jkc1BJ?=
 =?utf-8?B?TGtTUzJzWW1zWThNcU1DQWJCSEt3NDlHWmlTamc5aHUwaXZGOTVDeWF1UXFQ?=
 =?utf-8?B?eGVtYksybDNsUVdUc3dHeksvbmEzaFNXYWpOOUV2QWVVYis3SzRWanl0dEdJ?=
 =?utf-8?B?RUxOQTlyeTZPbU9ocHBRRE4xYVBOS1lnQlRSYi84NGliNTJCbE15ZytjUzNj?=
 =?utf-8?B?T2lQb0hONnFQZEJ0em43MFpURGQwNlpTYytOaGd4VU9pWDJKS1NXaU5Dd2ZG?=
 =?utf-8?B?d1UrUWx6RWlQSUlnL1VFUWYySkwyNTh2TGlmalpYWDh3TEtRQ3cyeWRpZEdH?=
 =?utf-8?B?dTZhVDhsaFBGTUpvKzRpZXg2eDR2a09sQnRuTWZMV1dDbzB0TnY0UERhRzRz?=
 =?utf-8?B?enRjTC9xY2ZJOGNOSWNXNXZYVDM2NWpWU3dNQWpOYUNmM0tyNkk1K3d4VHF0?=
 =?utf-8?B?dlhQUXl4WUdoSHpLclQwYkM1Ui96eVBNQmtNN3BMUlBwUUxaN3BsTFdzVGt3?=
 =?utf-8?B?c3VOOEFpVlJRRTJTSnBBc0tmcXJRMzdKSkd0WTZTUDY0eGpyM2lka1AwNTE1?=
 =?utf-8?B?TDZ2TGdmSzc5VUtwcUhFRHRMRUt1OHdMVEpTdHdLL3Y4cWo4RUpzVjFEY0lp?=
 =?utf-8?B?M2ltOHFvM011ODRwNDkzRVpRUllleUMrSDZLZFN3ZEZ4STFSQUgxK09Wbmpw?=
 =?utf-8?B?Q0tSL3RuQ0ZCRzJPOE9YckV5cFRKeTA4cTE3ZWdEZTNGbmxmT0hBRDRqRlo5?=
 =?utf-8?Q?9ChHr8ENtckhXJ8xmHI49e68vkdToirlm54aOie?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d73d837-13cf-452a-0550-08d966f9bd45
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:21:45.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE/rX044qNoVRLQanQaSBzinO00sJ7IaTATgZZll5uUY73no2anwWTiuQVwcc9z9stTyM8s0YM/6QmjFlYzyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3970

On 18.08.2021 22:29, Bobby Eshleman wrote:
> --- a/xen/arch/x86/gdbsx.c
> +++ b/xen/arch/x86/gdbsx.c
> @@ -151,33 +151,23 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
>      return len;
>  }
>  
> -/*
> - * addr is guest addr
> - * buf is debugger buffer.
> - * if toaddr, then addr = buf (write to addr), else buf = addr (rd from guest)
> - * pgd3: value of init_mm.pgd[3] in guest. see above.
> - * Returns: number of bytes remaining to be copied.
> - */
> -static unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
> -                        unsigned int len, domid_t domid, bool toaddr,
> -                        uint64_t pgd3)
> +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
>  {
>      struct domain *d = rcu_lock_domain_by_id(domid);
>  
> -    if ( d )
> +    if ( d && !d->is_dying )
>      {
> -        if ( !d->is_dying )
> -            len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
> -        rcu_unlock_domain(d);
> +        iop->remain = dbg_rw_guest_mem(
> +                d, iop->gva, guest_handle_from_ptr(iop->uva, void),
> +                iop->len, domid, iop->pgd3val);
> +    }
> +    else
> +    {
> +        iop->remain = iop->len;
>      }

Nit: Generally we omit the braces in cases like this one.

Jan


