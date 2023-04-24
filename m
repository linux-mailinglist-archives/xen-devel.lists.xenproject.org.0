Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280356ECFD7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525399.816568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwiz-0003IR-2m; Mon, 24 Apr 2023 13:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525399.816568; Mon, 24 Apr 2023 13:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwiy-0003Ge-Vw; Mon, 24 Apr 2023 13:59:24 +0000
Received: by outflank-mailman (input) for mailman id 525399;
 Mon, 24 Apr 2023 13:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqwix-0003GY-4s
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:59:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35927e32-e2a8-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 15:59:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 13:59:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 13:59:17 +0000
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
X-Inumbo-ID: 35927e32-e2a8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXx/GP3+Rzh8Y1Ywy2CcnTrPgX2BVk0E9NkQfz4erQE6yxf8o/otzT0FhbCVrOLFmi6AAJnXGCv+Hb7uAog+bS9AlXyQpwH752VrW2iijbBNCqizYBbgVnObwkqCz9w8EMSf5CHMqfmKmASPi1KsKhwPrxKQCcaeYBzKxTwXmbtMHoqtMDPvSDCyatoxMGN21+Qy4mi8O8OyjaqQvPH+mrBbbva2qVfO9lEB3CES3cU73yy30UXUo0G617dfQ8Mmv+98tyRu7NlvKWHzjrNuR+V74Z0IdLtg7gwTUcXcbd62Lia7HGcwVCqXBAAOrZfqbmxtxRXYEGxgjAXz8TdqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7K8zzvcm/qI7O13PT/5IEE5ayUGR9RPHKuFzhwTJvQ=;
 b=VDZPdKTVhrqehNxBRjxuI4zwVX+nwK6gA4B8aHe3d/QNM94yl+HBEL3uF0odMLUDB6hNfykgsFvlbE5bB/59ej93rrQGV4BjgV4+VQLhD/6T3mi+FP3PfT1VUEg/mlTktOy3GSP8+H/5/tYy7scb2lUn/mmjB4FaTkPEXJl9UOyJ8G9X0TTn2LnR+z/p6aQxHgWaqL1lJbl+AInktCCecJljIxkIMBCWaGVUX1e5PwgkJMuaH4eXAKFpdtAe9mADT7fqCLbie7QPtdnjMFUxfmdbZuKhGvRqJkszVvQwYR4BgtAke0C5+2+4qTWJf15b9qDoqeoQ8WSnEphCtMgBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7K8zzvcm/qI7O13PT/5IEE5ayUGR9RPHKuFzhwTJvQ=;
 b=t2HtdK4Z8OB5wXKSyFn+TCCKOP4mbGYff8qbanzYnUBQkEJuFtZO13VWiUrpEQK0jIQUM6CueZdmkRNuzgjLQGnQ8h99EHQ1tPaevhs1rcvUvif/7mKGeoD5Qmc2ecXxss1OCHaXztVnPBsVDRsItQcN0e2v25wnvE7X7bY7ThNPY0rsTXDKbGtTscljb3+7KPCqSkvVu94KhuIz6W6AEz9J6mploaaJsJDVmNdX1eT24GIMU/UQ85FaWNZA6F2pYAQSjbhppTIYhz3SXqKfQ328q2z5vP4UVTaMSsxnTgh2wXBtjqhhRqgJzRtg3WGOZxt5CPcqRQbA5b/UV4SU1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69ae7948-64fa-deaa-03b8-30eb84e07b61@suse.com>
Date: Mon, 24 Apr 2023 15:59:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/4] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <3a8f54cf631e0342b144935950c853d1884a7eac.1680752649.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a8f54cf631e0342b144935950c853d1884a7eac.1680752649.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0542d7-56bf-499c-f65d-08db44cc17e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2FLc3ubGrUk86jB6NVP0xGzd8Hx172FKP042nUp8hA54igVVQOyrRfS0SK44pR/8JC6gXwyyUvKK2sX6GDSUjdt8UbaJyUGGzla2rBn+nO4nlgb2LtFDIWtHtzWi0R4pAfE51u1vG9kiv8htRw/NTTpBJfccuQ3t2IaBq6Q/MJXel4hf5SRed/fJICdEVQ7iC5qVv3lpxLJGQQXqxBiesRcAfB8nF4XzYA4+FIARzNR7MDOhgiPSKrg/picNn4ke2/FuwvWa4wOQuT3qNxW8uY0x3cRC7btZvvAPICewcR2RHQp4xZMl3b31nGwMMwNi/R/KEdFk+ZegB5vSO/SB1mk9VBcHQQ+wEa9Lxf9+ruJGYPkuLUKFdjV68XWXY+l5wftoRsnD4EYbAGXT3pj/mkiTak/XDkA8A4Ktzn/w3phFaaIQMbF17tMHPTKk1/42kxpevK69aL0hZU42/U/V83Z+IRoOtlNSG1NuR6hyfmgcJTqJqIeaNkYVVTaoDYOZG+NwPYiXL2fRv8OV52xesBR7nb1qGdpxeKWS4qIPXfPDRTPqAOS29WeUIfOryExvogSU00by47AMISIw2tS0OvOgcuWVhreGGXR2MI+xAsZQ/8NugpVxmo7Rap5y7kC62uXZDexfIRw+380pio/r2BrskpjKABCWVNwK4to6jr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(66574015)(83380400001)(31686004)(66899021)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azV4cUsvaTRWWXRYUWVmVHpwTGlpVzc4SENOV3JMRGV1ZG43RU80bERYSDMw?=
 =?utf-8?B?cFJjQlVqMDhQVi9odUdIcnRZazlNWjVXQzR5cHp3WXQvWmZKbS9nOWdsQ2JJ?=
 =?utf-8?B?QmdPaWF6cW5Lbmx1THpYRHQ0V2M5M0xkUjBuQjhKRVZWeVl1VGwwa2ZIOFhC?=
 =?utf-8?B?b2FWTGZvbUI0UVdYT2pKWUROakdjWEQ5SmNDeldVYXRrcXBLNzlRVEszbXI4?=
 =?utf-8?B?M1pnVzRWczUvU1FrOWg2OTE2K1NxVEJpMEgySWcxYXdtNWI0MkU4Y1JPL0Z6?=
 =?utf-8?B?Y093elVzQWtNbFRGeHM0dmFqbGV1ZkdMZmFZdmFoRVFYTi9Uck9SSVhrUERx?=
 =?utf-8?B?WmNaMkhjMGcwR3JDa3J5cDRkVllDdFpBSE1OQlkzNG1IREVEZEdpNFNFU3RK?=
 =?utf-8?B?QVRhU1ZMTklocG1hS0ZMdGpEN2RPbUlwMHdCYzZTaEJ3ajJRa05rUGdvSENa?=
 =?utf-8?B?bkNKSFV0M3R1OG5jUWJTd1lvU0d4cFoza20xSjNUNHA2TEJhV2UxNURkRWo5?=
 =?utf-8?B?STIzUnN3N0RHZFdTeW5FSkVRYWxSZ29lRStqM3oyUmwxM0dCRElReittRXNZ?=
 =?utf-8?B?V3BMNW9XQ3hOWXFDQzFENXowUnBVNkFHTk90MlZ6R0ZhOU9YcTRQcHNXY2pp?=
 =?utf-8?B?QXJQbnRtSnpqYzJDRzlrWk8wMG5tN1dwSXZXYm81N2dOd0pma3VYNjFEWElE?=
 =?utf-8?B?N2VLVko5ZEk4Q0ZZK2dPMENLTGhQKzlVUnkySC9aMkkrZnZwb0UvOGI2T2Fo?=
 =?utf-8?B?bmVQZUtxVWs2N0g4NzRNREdWdTdqd2lhVndpa2F2Ym10K0VjdDlsSCsyL082?=
 =?utf-8?B?bVZ0VTRMVGVSZStKOEtHMjAzUE40TGZhWFNHQmRkNVJyOUNIcUEwYTlmUTJL?=
 =?utf-8?B?Wkk1VDRyMk5aSklDaVUwdUJmZmtFbnVLNnJ4dDcxSkhCRlA2SXFObHJSQk5G?=
 =?utf-8?B?R3JMK0trdEdNOGIxdVVxcmNwQUVnTncxdjAxSjF0S0ZzUHMrdnBLUEM3WmJ4?=
 =?utf-8?B?T3F6UERNMWN2T2JncUNtbFhJYUQwaEh2dmZqSno3Y3MzdENROTI5KzVteTlk?=
 =?utf-8?B?SDVyaU5IWXNITTI3RkcvSlFVL0pXazFJazFvYXE1aWk5dVdob3ptbDFZelJz?=
 =?utf-8?B?TEY3OHVuNTExbHBvdXhWN0paSWtPdEM0cHVxeGx3Y2txUmgxVnVXMThIQ2Y2?=
 =?utf-8?B?YnJDZUJmZlcvQ0ZVL2tENisxU2tlQXBIcHdobU1rMldvM3paM2g1VXhUZWpa?=
 =?utf-8?B?QnVRMzVOdEEzSElzZThRRkFOYitrZVhhRXllNHJqOTFZQit1ZjVqdUtreWtY?=
 =?utf-8?B?ZmpMc2hockpUOGthU0xseDRnOVhMZFJmQk1BZ2QrbWN4WEZyYXo0R2NteWR1?=
 =?utf-8?B?Mjhwa0hGa09DZk5nVVY0RkhuVXpscStZVDBCeGN4MXhZZ3h3WFFEU1VUaXRD?=
 =?utf-8?B?Ym41Y2Y3enJneTdwM2R6RmpjQWtIQms5cnZIeVRUVFlxQ1dyVE1VQkxSWWUr?=
 =?utf-8?B?NHhubkdVNnR6L1BCL2JWMFRvcHNvbi9FeXBpUExCTVhFaEVKMXJ4d084WUxT?=
 =?utf-8?B?S2ViZzNTUnhCVGpRUC9pbVZORzFSaUZNbVcxU2xPcWl4ZGlROUlkMWMxc3ZT?=
 =?utf-8?B?Y1pwUkNmSSt0SDdsbE02ZldYWUJycnFHWnUvOFlsMU9RcHNxNVczNzl5ZUl0?=
 =?utf-8?B?aDNBVWpJTDdLcWk3Sy93RmN4VUE2TTlaa1NPOGJQdE5BWEVvajFyVkp5RHNr?=
 =?utf-8?B?bXBTOGl0ZlFzTFYzbWJsSk9aKzdrcnhVS2pQVnJjY1loU2VnMmJsRmRZZ3p5?=
 =?utf-8?B?OGRJcVQwS1JhSHF1RDBtdG1WUFF4WWlBWXpFRjB2bStQWXNSbFpsVzc3Zk5v?=
 =?utf-8?B?UGVsMWU3S1g1Nk5Ocm9kQmh6RTF1VDM4aFFYaU5QWXZWZllWNitqTHpPV2Zy?=
 =?utf-8?B?SGxWWm9ZZVdUL21PMFlTS2NqWE1FSU1yRVh0Tnc1SGdScVhKZjUzSjJyNlVs?=
 =?utf-8?B?REZlenpIY1c1YktHRlVoVklXY0d0b3g4ME50YTRxSWhYUlhTbUk2OFhOS2V1?=
 =?utf-8?B?SWRwUm5wUnlpSGNJd0F2UkNoK3JUbXg3WHcxaGxwL28weWl2aGZ4a3pjdmRP?=
 =?utf-8?Q?J2tNhpcBWzpGUg1aSvqxa9S6C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0542d7-56bf-499c-f65d-08db44cc17e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 13:59:16.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCOYT4OBOOwNtsSk+el4D1W7g1Pxf2VYVsYZwOqrZH6qWNAvwSfeSwsBIBbi8kJDe3fufsHOz+nXSjePPkt+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368

On 06.04.2023 05:57, Marek Marczykowski-Górecki wrote:
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -181,15 +181,21 @@ static bool msixtbl_initialised(const struct domain *d)
>  }
>  
>  static struct msixtbl_entry *msixtbl_find_entry(
> -    struct vcpu *v, unsigned long addr)
> +    struct vcpu *v, unsigned long addr, bool same_page)
>  {
>      struct msixtbl_entry *entry;
>      struct domain *d = v->domain;
>  
>      list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> +    {
> +        if ( same_page &&
> +             PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
> +             PFN_DOWN(addr) <= PFN_DOWN(entry->gtable + entry->table_len) )

This will allow access to the subsequent page in case entry->gtable +
entry->table_len falls on a page boundary. I think you mean "< PFN_UP()"
or "<= PFN_DOWN(... - 1)".

But I anyway don't understand why you need both this and ...

> +            return entry;
>          if ( addr >= entry->gtable &&
>               addr < entry->gtable + entry->table_len )
>              return entry;

... this (and the new function parameter). Again like in the recently
added vPCI code, all you should need ought to be the new code you add
(see msix.c:msix_find()), with the caller then separating "in table" vs
"other space". Only one of the four callers really cares about _just_
the table range. In no event do you need to do both pairs of checks:

        if ( same_page
             ? PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
               ...
             : ...

(i.e. in case you disagree with moving the original check to the sole
place where it's needed).

> @@ -213,6 +219,144 @@ static struct msi_desc *msixtbl_addr_to_desc(
>      return NULL;
>  }
>  
> +/*
> + * Returns:
> + *  - UINT_MAX if no handling should be done
> + *  - UINT_MAX-1 if write should be discarded
> + *  - a fixmap idx to use for handling
> + */
> +#define ADJACENT_DONT_HANDLE UINT_MAX
> +#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)
> +static unsigned int adjacent_handle(
> +    const struct msixtbl_entry *entry, unsigned long addr, bool write)
> +{
> +    unsigned int adj_type;
> +
> +    if ( !entry || !entry->pdev )
> +        return ADJACENT_DONT_HANDLE;
> +
> +    if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable) && addr < entry->gtable )
> +        adj_type = ADJ_IDX_FIRST;
> +    else if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable + entry->table_len - 1) &&
> +              addr >= entry->gtable + entry->table_len )
> +        adj_type = ADJ_IDX_LAST;
> +    else
> +        return ADJACENT_DONT_HANDLE;
> +
> +    ASSERT(entry->pdev->msix);

Considering the code below, you probably want to latch this pointer into
a local variable.

> +    if ( !entry->pdev->msix->adj_access_table_idx[adj_type] )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
> +                adj_type, &entry->pdev->sbdf, addr, entry->gtable);
> +
> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    /* If PBA lives on the same page too, discard writes. */
> +    if ( write && (

Nit: Style (no standalone opening parenthesis ought to be last on a line).

> +        (adj_type == ADJ_IDX_LAST &&
> +         entry->pdev->msix->table.last == entry->pdev->msix->pba.first) ||
> +        (adj_type == ADJ_IDX_FIRST &&
> +         entry->pdev->msix->table.first == entry->pdev->msix->pba.last)) )

And these all need indenting by one more blank.

> +    {
> +        gprintk(XENLOG_WARNING,
> +                 "MSI-X table and PBA of %pp live on the same page, "
> +                 "writing to other registers there is not implemented\n",
> +                 &entry->pdev->sbdf);

Whereas here a blank needs dropping. But - don't you discard writes to
more than just the PBA here?

> +        return ADJACENT_DISCARD_WRITE;
> +    }
> +
> +    return entry->pdev->msix->adj_access_table_idx[adj_type];
> +}
> +
> +static int adjacent_read(
> +        unsigned int fixmap_idx,
> +        uint64_t address, uint32_t len, uint64_t *pval)

Nit: Style (too deep indentation). Also while I'm fine with the two
uint64_t (arguably the former may want to be paddr_t), the uint32_t
clearly isn't needed here, and wants to be unsigned int.

> +{
> +    const void __iomem *hwaddr;
> +
> +    *pval = ~0UL;
> +
> +    if ( !IS_ALIGNED(address, len) )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                "Dropping unaligned read from MSI-X table page at %" PRIx64 "\n",
> +                address);

Here indentation is one too little again.

> +        return X86EMUL_OKAY;
> +    }
> +
> +    ASSERT(fixmap_idx != ADJACENT_DISCARD_WRITE);
> +
> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *pval = readb(hwaddr);
> +        break;
> +
> +    case 2:
> +        *pval = readw(hwaddr);
> +        break;
> +
> +    case 4:
> +        *pval = readl(hwaddr);
> +        break;
> +
> +    case 8:
> +        *pval = readq(hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +    return X86EMUL_OKAY;
> +}
> +
> +static int adjacent_write(
> +        unsigned int fixmap_idx,
> +        uint64_t address, uint32_t len, uint64_t val)
> +{
> +    void __iomem *hwaddr;
> +
> +    if ( !IS_ALIGNED(address, len) )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                "Dropping unaligned write to MSI-X table page at %" PRIx64 "\n",
> +                address);
> +        return X86EMUL_OKAY;
> +    }
> +
> +    if ( fixmap_idx == ADJACENT_DISCARD_WRITE )
> +        return X86EMUL_OKAY;
> +
> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len ) {

Nit: Style (brace placement).

> @@ -220,16 +364,27 @@ static int cf_check msixtbl_read(
>      unsigned long offset;
>      struct msixtbl_entry *entry;
>      unsigned int nr_entry, index;
> +    unsigned int adjacent_fixmap;
>      int r = X86EMUL_UNHANDLEABLE;
>  
> -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> +    if ( !IS_ALIGNED(address, len) )
>          return r;
>  
>      rcu_read_lock(&msixtbl_rcu_lock);
> -
> -    entry = msixtbl_find_entry(current, address);
> +    entry = msixtbl_find_entry(current, address, true);
>      if ( !entry )
>          goto out;
> +
> +    adjacent_fixmap = adjacent_handle(entry, address, false);
> +    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
> +    {
> +        r = adjacent_read(adjacent_fixmap, address, len, pval);
> +        goto out;
> +    }

adjacent_handle() may return ADJACENT_DONT_HANDLE for reasons other than
the address not being in the expected ranges, so you can't blindly fall
through to the original code just yet (same in functions further down).

> @@ -375,14 +543,23 @@ static bool cf_check msixtbl_range(
>  {
>      struct vcpu *curr = current;
>      unsigned long addr = r->addr;
> -    const struct msi_desc *desc;
> +    struct msixtbl_entry *entry;

const?

> +    const struct msi_desc *desc = NULL;
> +    unsigned int adjacent_fixmap;
> +
>  

Nit: Please don't introduce double blank lines.

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -207,6 +207,10 @@ struct msg_address {
>                                         PCI_MSIX_ENTRY_SIZE + \
>                                         (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
>  
> +/* indexes in adj_access_table_idx[] below */
> +#define ADJ_IDX_FIRST 0
> +#define ADJ_IDX_LAST  1
> +
>  struct arch_msix {
>      unsigned int nr_entries, used_entries;
>      struct {
> @@ -214,6 +218,7 @@ struct arch_msix {
>      } table, pba;
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
>      int table_idx[MAX_MSIX_TABLE_PAGES];
> +    int adj_access_table_idx[2];

adjacent_handle() returns unsigned int - why is it plain int here?

Also, to keep variable name length somewhat limited, I don't think "table"
adds much value to the name here.

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *dev,
>                  domain_crash(d);
>              /* XXX How to deal with existing mappings? */
>          }
> +
> +        /*
> +         * If the MSI-X table doesn't start at the page boundary, map the first page for
> +         * passthrough accesses.
> +         */
> +        if ( PAGE_OFFSET(table_paddr) )
> +        {
> +            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
> +
> +            if ( idx > 0 )
> +                msix->adj_access_table_idx[ADJ_IDX_FIRST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
> +        }
> +        /*
> +         * If the MSI-X table doesn't span full page(s), map the last page for
> +         * passthrough accesses.
> +         */
> +        if ( PAGE_OFFSET(table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) )
> +        {
> +            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
> +            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
> +
> +            if ( idx > 0 )
> +                msix->adj_access_table_idx[ADJ_IDX_LAST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
> +        }

Wouldn't this better be delayed until / restricted to the device actually
being prepared for guest use? Which may be as simple as making all of this
an "else" to the earlier if()?

Also I think the 2nd comment is somewhat misleading - you don't really mean
"spans full pages" but, along the lines of the first one, "ends on a page
boundary".

Jan

