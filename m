Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA73CB2ED
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157042.289844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Hsw-0004YT-DC; Fri, 16 Jul 2021 07:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157042.289844; Fri, 16 Jul 2021 07:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Hsw-0004Vm-9G; Fri, 16 Jul 2021 07:03:46 +0000
Received: by outflank-mailman (input) for mailman id 157042;
 Fri, 16 Jul 2021 07:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4Hsu-0004Vg-Lp
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:03:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 304523af-51da-4053-a819-70dc0c28d2d3;
 Fri, 16 Jul 2021 07:03:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-3zmO7_nHN-af6hhiGpxdBg-1; Fri, 16 Jul 2021 09:03:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Fri, 16 Jul
 2021 07:03:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 07:03:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0038.eurprd03.prod.outlook.com (2603:10a6:208::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:03:37 +0000
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
X-Inumbo-ID: 304523af-51da-4053-a819-70dc0c28d2d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626419022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eenM6kYJAF/iOgZT54XXqCydbCYs4xSnzxr0nwGPqM=;
	b=CAGc9qftFH4OEKZAvHTdud6QZoIujzi0g02EIlDefEC7HNgSbg8IfsyYh62N1GeKG+6n+G
	+TcG/yJ89cjmEqVB9oXtlWe3v8dhr+VjNeMYnyoApdsXYcBXdawDSZdOWbt+LnusHXggh/
	ARzxv5E/5uOMIWJEedjOnvur3Y7W1JQ=
X-MC-Unique: 3zmO7_nHN-af6hhiGpxdBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBn9ulV6IAvtdOvG76EiHZpfvF9sz/BxQwXy9EuPxOyoWnA337FP0X+xnPJe7a48VNZ1NKGLKLv5SmeJU6h85Hv0l1GSiYtPtWaTvFrkcaR1GnH4IlfYFMMrLq7gBDKiLx57qfw4xNZa5SKvX/DK9jaZ+DKVch+m+Ff6Q9BF9W+TIS7iziBsonv93pQHHC2ubObXpXZa2dXOxN4cPMSK3ypdPiO1byutEpo4qY3MnmOAWYFQ1gGeZwiFQIgA+pUqxqUqaPfZsElyphSR20tkltNnmz4HaDFI4QbSVOVF2X1QagQyN4OJk+4BkJgCdIK25lCx7zXfprg8km5qP5JkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eenM6kYJAF/iOgZT54XXqCydbCYs4xSnzxr0nwGPqM=;
 b=cjDaYEAz8QE+SHPj6DQK+508Zx6o97D+VORiWtC14pX/4fPWN06ALDbo0SkHmFXLC7a7d4SS2SEZ2X8mZdwZN/PegGtA31YmIckxHlWv6vomQHVpC+/SddTqarOevMRRSw0ut6yei7A8wcLoMFX2BC+802GJ6jSe25EBw9yNZ2dBAVk4u+qtlLURoH6OrZbuWTks6KC+cWdsmV9ILkMB6pTR/obVdFbaVtdICkHFeKPbMc1a62YWQu4JlBY1k5hhXnV3ZpUaQJDTFooUsqEsoHohN66JgP5CXSm/VS7umxY1VdMeytxP9h2mjlUZvcmk1p72QdVIw5Q6w5wGRZBmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 07/10] xsm: drop generic event channel labeling
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-8-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91c4a46f-83b9-1156-c685-0d8d9916fff7@suse.com>
Date: Fri, 16 Jul 2021 09:03:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0038.eurprd03.prod.outlook.com (2603:10a6:208::15)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 476078fb-6d62-4e0b-ba50-08d94827d633
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46061FF0CA0A1F77893C2AADB3119@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMokM5EGSOjTv4Nn+lmGK8sXuJ3GB7wEODiiEZL+jxXNaJHgUWKAyXhUNkGbM6oQtqhTBa6JzcWESeWvGXXfYM2VUrAhifWSoIkaKMhjKbpMOODuMqQS+IS7m5Bs+hwyL77MijRPuknZQQmYwnBscUBShUOgT9g63/N+DazS+8QUGxuT5huuuNzdtaGz5LHs689/zRt5qtHC/Xkiqxrh4n/tO0I8+sHULgbK9/YTa6hlngtz23yf+1kSdJcbb48tLpOI62aioesiWdVLLscxeebWjkQPHLCnp9ytAOkOSW4C6AnkI69ZS6uH9XoGnFmuzJ5p48A39J6/KeFOJ9pdK+R9TY7XVpdfI4M65PpyMscbDRRoGbMWnQ3SZjAymeFNpTyIP1C6NLpyspQrHztGfX20pzYW3YpM+noJnuY0QC95+CBmZnQmhu5m0V1UexKo7rSN7sN41IFmNHEd3iYuSNsuOrFfEZbx1B+QiJssJRbjIz5JyZyQCSuLB1IAFWnJ2FADOhByeHa7ovXM29gFc3v3Lo3eTmXNtY5R5QhgObTzyNTsPLWxY1QB4QKgpzFAvhsH/ccYiQPSIoSIjHljQyp1PZ2A+Z1/O+zaqKexhK445k21oExXqi1GoeskFBiGHvOwDfa1WHlWYdoILcZsHkNEOg/6aeZy9KmIuaAqCb1NMhLD2IvMvEC/6/D6lqKN/0AA3vfED3fSSLr8sEXBft50ddqeI4rR9qkGVzE+ETyL0CMRVO7MRZMjMij0fg9U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(366004)(376002)(346002)(316002)(8936002)(66476007)(6916009)(66556008)(2616005)(956004)(16576012)(83380400001)(31696002)(4326008)(8676002)(66946007)(86362001)(31686004)(54906003)(36756003)(186003)(26005)(53546011)(2906002)(6486002)(5660300002)(38100700002)(478600001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW1HUXZic0Y3V1RMSVVHaTRrbytXNmd0Y2RyRnR3ZTB5S2dXdjdCWEZWTTdH?=
 =?utf-8?B?ODA3VGk0bFFvU0dDc0FjcW1Dck1LS1h2UWlzcXh4My9WMG92cW95KzJrVThB?=
 =?utf-8?B?UFVJZDdFSVdSTUxtYnUrdUVXN2xIS0xDc1VCbFg4a0IwYjd5VUVVTHY3c082?=
 =?utf-8?B?QWFZdk9KRm55OGk2Sm5velVFejNSTGlzbmNaWEJtWVpaWjd0NzRETzhoQVBV?=
 =?utf-8?B?MnVRZTFqL0w2eXQydnZkVHpLZWxkdHAxMnRUVnBhWEdIQmR6dG82aDd3eSt1?=
 =?utf-8?B?a3BPSklLWDBCQ1JSQzVhY3dqaSsyVFNqMWxJWnExWVh3ZUdsb3NwOUw5eUM2?=
 =?utf-8?B?aUQ1eUhiQ1FkS0pFRlo2T1M0dCs0UWt5QUtadE1BVTk4YUFZU3J5djFCaTlQ?=
 =?utf-8?B?NEJiWVdaam0vV1d2bmlmUGlMUnZxMnNYRHFZOWtHYTUvdkdVMXZYcnJHQ0F1?=
 =?utf-8?B?VWhKazZZa29EUE9zN3l2QlNXakdLZGdGV3FtTGZYQm0yZTZmcG1ZaXMzditD?=
 =?utf-8?B?N2svdnorN0tsTlUzRGVZZkZvWEtwZ2RJSW5HVjl3T1pvM0NqN1lzdFlrQ1U1?=
 =?utf-8?B?clNrOVVRSkJhWUFTTCtaY1JMMmhJd05tUXFpM0pFTlNzUEhVWkdRV0N6WXMv?=
 =?utf-8?B?cU9uSmFuUzVZSWx0TU1SVG1sZEp2cng2aWtqNnBsN2JCV0YwbGRUZzNDU2NT?=
 =?utf-8?B?NlRYSzV2RGtYTFVPUWh0RDdCampwM28vMGV4UFdjQXQvckNBWVNJeVFITW5Z?=
 =?utf-8?B?Ny9yTE5EMTBnVEx3WkcxeG9Wd2pxQ2FTbjBGQUlpOFFjMDBwZkIwTGxiUTFV?=
 =?utf-8?B?M09JQjFQckJpOEZ2ZGxWVmtNYmw4Ky9uMWxxa0htdWVGa0Q1UDZxcG9DZXli?=
 =?utf-8?B?anZXRVlQZmdlY1lDY0k2RXh3SFFGNHpnbjBHMktxamZYNzNpMHhWQXpYeTlI?=
 =?utf-8?B?OHlaaWZqT0JvdUw1YTkrM3c4TEFQYW1wcTBrN2NFQ3g1T0k0aysyYUpDVTdM?=
 =?utf-8?B?VUNKSkFIcVI0V1NPREJuWVp4R0R6QzRLZmhMdE1pYTZuK2FObGp1Z3Q0eVY3?=
 =?utf-8?B?K3hwT2UyRG5vS25vRFkrb3FRY0s2ZXlwck1ncGliUHJFZ1RnaHBPUWVzVWtK?=
 =?utf-8?B?UktEdDZLb0t1V2l5RXVlZFJBWE1mdzB3WmhmcFNhd1h1amgxbTdDTXpyanBY?=
 =?utf-8?B?cDh3SWhBbjFlYXlNenJKdzZ0WWltSVZ0Y2ZaWDVqYkhkaHpVNlNTYUxiNnQx?=
 =?utf-8?B?WWNkaC9meGZUeml6NCtLbWVGRGYwVVljRURQRmFjeGJ3bnJIWDNYOVdIN1k5?=
 =?utf-8?B?Nk4rZ2toS0ZhMEEvT2Q2UkQyN2FXQ3Q2b1l1Z3NEV2JnR1luc1lqK2oyY0ti?=
 =?utf-8?B?Z3BaTUhjWWs1ZmluQnNKeVBTY000UUNrUWl4VmhIWGhpRkNHQ1VLTzlPdWVu?=
 =?utf-8?B?ZGkyMFUzQ0pYQkhseGpmcDZBSVZtTHBnbEY2ZkVFeWhYaDRQRDRUS2c2N3hr?=
 =?utf-8?B?MnFQVUp6T3BpNUlJcnJ6MHhoKzNIaGpJU0ozNjdKbHdvUmhuQVg1UjFXWlps?=
 =?utf-8?B?cHNSUUtTNWh3LytvbmNXd1haU0F5K0RhZEd6QlZzSmhMV21YYU1pV2xvaElk?=
 =?utf-8?B?K1hEUndoTmU4N01lbVhqblRveHI4eVZNK25IV2dnVHhpeit5NlhUaG9mL3Nn?=
 =?utf-8?B?Njc3N0JNSTRNUER1V0tjMVdaNzNXbFVkZFZZREZWdFZJL1pFRWc5bjhpeUho?=
 =?utf-8?Q?3Y3e7dpJZs3EwfVmjw2+kDWQZkxBlVtW6jFQK2k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476078fb-6d62-4e0b-ba50-08d94827d633
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:03:38.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKCJPJ8lTJpgDWXsJhvRcNdQhTrQUNOmrAtaYTu6GwZ9A18cF/ZAeUUqD7ca6ycXr/hsKuKLRwogPgp7YAWZPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 12.07.2021 22:32, Daniel P. Smith wrote:
> The generic event channel labeling has not been used by any XSM module since
> its introduction. This commit removes the capability leaving FLASK labeling
> field always present. In the future if a new XSM module needs to have its own
> channel label, this or a new form can be introduced.

I'm not fully convinced of this removal: Does it get in the way of
anything?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -120,15 +120,7 @@ struct evtchn
>      unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
>      uint32_t fifo_lastq;           /* Data for identifying last queue. */
>  
> -#ifdef CONFIG_XSM_EVTCHN_LABELING
>      union {
> -#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
> -        /*
> -         * If an XSM module needs more space for its event channel context,
> -         * this pointer stores the necessary data for the security server.
> -         */
> -        void *generic;
> -#endif
>  #ifdef CONFIG_XSM_FLASK
>          /*
>           * Inlining the contents of the structure for FLASK avoids unneeded

This comment's "with only FLASK" now becomes stale, and hence would
imo better be updated.

Jan


