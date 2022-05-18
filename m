Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F552B7AA
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331886.555502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGlY-0005IL-TJ; Wed, 18 May 2022 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331886.555502; Wed, 18 May 2022 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGlY-0005Ff-QM; Wed, 18 May 2022 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 331886;
 Wed, 18 May 2022 10:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGlX-0005FZ-DY
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:18:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e901ad6c-d693-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:18:50 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-Sp_u_IYHOZ-Km5U7yFy5FQ-1; Wed, 18 May 2022 12:18:48 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6117.eurprd04.prod.outlook.com (2603:10a6:20b:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:18:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:18:47 +0000
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
X-Inumbo-ID: e901ad6c-d693-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652869129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mxbmnoN3ECUmit/rHTKvacZBtge35bgZsyj+rhSyxxg=;
	b=Mup+N6QT4aVoxszSzAu03ah5LcL86aIC3EEKxGqKpLdtN7qEOCs8bAk8qJ+g+dgMtqwv9M
	fOaYXDWQ3qdlZnq+faTXZ+OsKJFsc8k1UOWFfjv9konE8x5vp2crrcvEm2Uegl1BlQPiqr
	aUPheAxr1dezW5I7to4pX1JMvnapNnQ=
X-MC-Unique: Sp_u_IYHOZ-Km5U7yFy5FQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl/ydblejImuA11KWBDqXw5HGS5Vrh4VGLC1RCUDnnlmq7ImhYLh7/nalQXPYnLu09xiTHF10bj+Ngc3BMf3Mo/0KdCdG8+1m6ShdoOqzpVPXayp50wqpQ6aUyKc5E1Ro6Luvu3Bbsrfp35NFeFOqKGjenVus0TXtnmoRGDblNyUsOkWO46qvN3+WpTfjQ8pi/+JhltJGSVb2lDsfSAdzqsGnHSIOHjf7SyNAiwFlpmnWABs4Zw7jkNfcdkKxTyGF32cRAljqM0wUqMpq7GBfyYnTYcUhkTbk0MO3kiWkRsk3n7uCfnfft1QQHmfconBBZZd1s86nozz2MycEOwfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI25F0S5T7JK5JzpBnf6DwdbMN1F1TCy/dlsT0E0OgE=;
 b=A2nxwu8EZYGE7wQcpu/SfdWRCWy80BaS7lxYBJnk17q3jiSaE2tr9vZrTNb7lO+Av9ikNLIU72bHuT0aVh6snuoaxHUJB2RN6WozJNxCpNJDzwJROGCZQy8OwrD9z310WdzBAVMa9c1Tqs+8yMXsTnR0ZHyALnZtw7lDsMupBVUaE26Se2MKqRofre3Ox2fZ5s5PjHieLPhHk58dcLxS6YJgjnnfodv/0KDNIhaH9uYtwyUTHmxkTmB6d7TtsNYZlJNLdEXzvFY+J7XZO2xog6mHE7ybipPlG+19fKQjVza0NmGyWeJ0BprjQxmy5oF05smZZGPvGVhYuOTCfpx1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0813754-460d-fdc4-8e43-59d7431f860e@suse.com>
Date: Wed, 18 May 2022 12:18:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 15/21] AMD/IOMMU: free all-empty page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <16f5b398-56f6-a70c-9ce0-0ad72eab5058@suse.com>
 <Ynpo7xsOS61fZd/U@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ynpo7xsOS61fZd/U@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8609e011-dee0-4c66-8d11-08da38b7cbb7
X-MS-TrafficTypeDiagnostic: AM6PR04MB6117:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB61171FC67B1F145B8F3D1CCCB3D19@AM6PR04MB6117.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+WmRrfnhfg9SgWg1jakXZH5Iimud1PO8IJO1tlCMEMx6DfgYhA/7iSTTlxTzCUtOp+Mjwu1BVun7aCJ29/G7QZ3+m1EFSFQyJAchnp2pvLBNy9O5i00lBuHbJAaPpeW/TA39Jp0ltEjBz0FJY88JCW17XT8EkyBZq9WyKSODx7duaBZDpBNmsb/Rnh0tx9kKf8dTC70nNycFcqfYw1v/2VSz6MfjtSOZEuNjjP7wOQlAWhigqdD+U7vN+jOa+VVnRaHMA8t+0WAeDuNLHSEA6QknUMJQkjESp1IUkbuzsygZJm8hNH5hV7qQYfFIWZLr6W1F8WK2Yilcp2v7zTQo98ifDAYicvIH061yYcHMwMTBFiEEXZjUecDxnTsP+Pk73OeOQR+oxqj3Nfw8IzI/EkkusOnF1DHUHNhBK6/7KhI/w7WjeI40PeoE86r+jqRfKkm6ITNIMDvOAmqYZLbX2r+N9apoWltpFjySNYD5dbww9WPEN8Ane6NpAwTMxnwvcCQGwaylZY+V5avmVESvAwSHN8GXFXxU5nq2ln38SYNN6gBQqfvQ158rH6a4MUp6QXjZwdA/oTW32fzYrJq5VYk9kXYihm4mhkkGhy6A5zdY9uV4N0ZulhU8SFFsc/xrqJJC+60rZHbV1WPk6RTU3M4xEBRjL0N/g9BBH3TykZfWM7VnrbIg/TdY+xCDPjZxzU5uLavcTbhWOGmeygrHgqTV20lcTtqHkgxgCzp8QZlW48tQ8dzBv1OtlXVj0Ko
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(2906002)(5660300002)(6506007)(83380400001)(53546011)(6512007)(508600001)(6486002)(66476007)(66946007)(66556008)(316002)(8936002)(2616005)(8676002)(54906003)(4326008)(36756003)(31686004)(86362001)(26005)(186003)(6916009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yQ4QYALpoIylgEQkwPIMl+rrKanvKoArElrffm32mg3FmKy3bRiUfYAIgU/b?=
 =?us-ascii?Q?8npifBJDLHssL0GTPM2mLnIWeyrhLPhSvwZvB1nwSusapm3Ke/e02bX5ox9X?=
 =?us-ascii?Q?jKbp60rqJjKV1+WXRvFuqEGUFGycL75S259dnvkrtmxJaF5Bk0mgkq/h7NbJ?=
 =?us-ascii?Q?sFVxrNUjc+W5FeZOUBUHEvf6jqRh796rh4wvYavvkJgmRwdPzX1eTFJm825+?=
 =?us-ascii?Q?Qxi+QKoEmCpXnqT7PaqAgNCkNKi/+L8kc7ixWXvN1iK6TK5u/eP4F0nBixWV?=
 =?us-ascii?Q?c+I6IYN9eNO5qj1a1Cph2F9gOhj2aLrUkcWIimmuTdI1l1WEZKeCAaMaRKN8?=
 =?us-ascii?Q?eJz/bZ7stdeSW8cvo0NhpGuhakIPbO3hwZ5WpU7XMppa8t/Gs8GaVEnCqWA8?=
 =?us-ascii?Q?lYoLdywUXVv0xGvl8IBBBt8WH4F8w0PmC2uiPap9E9ywoN4kUoBFl3WWbRi4?=
 =?us-ascii?Q?cqi1Zz00xTC3un5Pd0vbNj4nGXWAXCRiUfmbyTLaQQjiQf9GBJoOkJyQBuLi?=
 =?us-ascii?Q?+pCzw9TWMutgdmnzcRrXNVMAoiGKOdW4yLMuIrXcQ3yVw2sFKqt5+cxJsiZv?=
 =?us-ascii?Q?E23sfHwpXQVtpS2y/We3lq58rm451fW+Pln7pJsiXEr1K+tKYDvV/YMs386w?=
 =?us-ascii?Q?PT8y7UbnEPtnpijaSOqpzfk3flbw/vul1DcnpwumsTQg0A9obj4sB4Kt4lG+?=
 =?us-ascii?Q?9PqdR4CrvEg0cYP2MRKdk4c4ZKeu0pAl1+EEZ4dBTWXb+0J6zrGDVnNbOdBy?=
 =?us-ascii?Q?Oj6SPZ/0T54sKETRxLWSjOhEkzqW2M6B3fT7s/m7vf4bL9mFSZaBPYpF/9p6?=
 =?us-ascii?Q?AoL6N7ba5bLtws62k2YxQrdNYRhcFHdcEFYWeuWhoBRPnzsnj+FXk+dZsFCx?=
 =?us-ascii?Q?R+T6Dd1DBlPSssGbuxKCQ+K6zntMcHpOhQnzVrd6lQu+84jjLm5up/hERc11?=
 =?us-ascii?Q?PJtz+jwWDgWJfxwdfYksrhcBsuPUlkQpeWJTuk6yGiXE1TQlNEROhG+a+hom?=
 =?us-ascii?Q?l2sRuiQHq26q5IPrfNZxzldrZTp/zvLmNNkJizF++zKkZk2aOH7s1NSfSsnd?=
 =?us-ascii?Q?puGJjp+QCZzVrhMr69yYc27kmNVYWslXZyPi2JYkyRR5NVA2gG/8teNPolaF?=
 =?us-ascii?Q?9GeySrSWCGkQ9A7q24NSYq2POy3L/vfe6FdG9cPDjzeEPUuxgHjhofIjeq2x?=
 =?us-ascii?Q?Qj8go5b+t4rJA5hdb1vNgnEd5L8azS/rRIek1I3WJ5fDyVZlRqx5YktzGClr?=
 =?us-ascii?Q?sYp8ozm+/jMuNKzHRJc8mgPHiZgFRdayKSmC04FIp7moRDy++JfwQAdik81a?=
 =?us-ascii?Q?F3IdoFVYrHo1v4BBPFqLjkXN3fEOPNgbm0cYDjRXvlCC86q3pKhsj2WcaStt?=
 =?us-ascii?Q?T+jqaYB/N8OxBJqH2Fwpv856VnbZYhR+LRJfFRTsqdTthWYOHumGr/1zbJkg?=
 =?us-ascii?Q?18v3aAQDKKtz5Hh6uOoITkzwQZpWEW85FoPVf0QK8Aj6W9sAlykyava2N8R3?=
 =?us-ascii?Q?vEPLWhmWg99oXKuGAs7/tdA/UNxvHHdlQ2IUUeMheERrR2jeuh1d/zRlIIBT?=
 =?us-ascii?Q?iSRFuXkkzBnnQvNcWPrPsZ3UfR2PUWtV/7WGvgK070NmaGJX1OsEiX2jSu3L?=
 =?us-ascii?Q?vEnXiIuuDwY1LiwXzZzlGYYxJhVjorKkgyJvKG0GAE83uEdpp17t/cqxKhB2?=
 =?us-ascii?Q?CdCCz2ekKNaj8aZS/+9lMEbzLO7dXatw9Kp8CZyApXo8qjEO+Z3RHChsRRVI?=
 =?us-ascii?Q?2n7GK+f2yQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8609e011-dee0-4c66-8d11-08da38b7cbb7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:18:47.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ScyrDeC5qqPoXJX39wKMGVTdmiJ76aLDzBOPvhEJQ8YarXUMQ1Foxqm+AuQsmJp7bzjWPowP3sn9CGSWv4nIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6117

On 10.05.2022 15:30, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:42:19AM +0200, Jan Beulich wrote:
>> When a page table ends up with no present entries left, it can be
>> replaced by a non-present entry at the next higher level. The page table
>> itself can then be scheduled for freeing.
>>
>> Note that while its output isn't used there yet,
>> pt_update_contig_markers() right away needs to be called in all places
>> where entries get updated, not just the one where entries get cleared.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> @@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
>>      if ( !old.pr || old.next_level ||
>>           old.mfn !=3D next_mfn ||
>>           old.iw !=3D iw || old.ir !=3D ir )
>> +    {
>>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>> +        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level=
),
>> +                                 level, PTE_kind_leaf);
>=20
> It would be better to call pt_update_contig_markers inside of
> set_iommu_pde_present, but that would imply changing the parameters
> passed to the function.  It's cumbersome (and error prone) to have to
> pair calls to set_iommu_pde_present() with pt_update_contig_markers().

Right, but then already the sheer number of parameters would become
excessive (imo).

>> @@ -474,8 +491,24 @@ int cf_check amd_iommu_unmap_page(
>> =20
>>      if ( pt_mfn )
>>      {
>> +        bool free;
>> +
>>          /* Mark PTE as 'page not present'. */
>> -        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
>> +        old =3D clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &fre=
e);
>> +
>> +        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
>> +        {
>> +            struct page_info *pg =3D mfn_to_page(_mfn(pt_mfn));
>> +
>> +            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
>> +                                    flush_flags, false) )
>> +                BUG();
>> +            BUG_ON(!pt_mfn);
>> +
>> +            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
>=20
> Not sure it's worth initializing free to false (at definition and
> before each call to clear_iommu_pte_present), just in case we manage
> to return early from clear_iommu_pte_present without having updated
> 'free'.

There's no such path now, so I'd view it as dead code to do so. If
necessary a patch introducing such an early exit would need to deal
with this. But even then I'd rather see this being dealt with right
in clear_iommu_pte_present().

Jan


