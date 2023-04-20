Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7716E8DBF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 11:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523992.814487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQNa-00067H-QK; Thu, 20 Apr 2023 09:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523992.814487; Thu, 20 Apr 2023 09:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQNa-00064m-NQ; Thu, 20 Apr 2023 09:15:02 +0000
Received: by outflank-mailman (input) for mailman id 523992;
 Thu, 20 Apr 2023 09:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppQNZ-00064Q-F7
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 09:15:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3815105-df5b-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 11:15:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 09:14:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 09:14:58 +0000
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
X-Inumbo-ID: d3815105-df5b-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF1Q7e7U5+nY4gfXu1qRZYEbdtIszIiKDSECDrPUqWaieeERju3Igp3LIjapCYdE99Nq2G88uf1VFZzmqG8uKOwXgfUq5+Oymqmcpyyc6SdIi/dSRP6Rsx0xjjMNgNDtCy7fnpZ9xXidS8XmfW3YU1s4390PjBMLGglUJVGVU3SMhRVWGXD+vEmbUV7A/TXm3sRz4ncMqijibqqNFvbZxnt/Ca3EF1d5i94fZEE9baVoElANahj1hKcMEPZUKakUeVhO4FOoHdTznwBxrrKcNqsacfVjjbUUphxd8Ue6O4tQriS0/f6sM9hWYhDoSC0IPOdLfC1qx8FXlaVuSH2myQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4PWZ5dCXzP9D9m5d7FrH/Ok6O3ZPrfAaX/CkSbQix8=;
 b=Yj8o5B+fjNrCgBy01hUbDGtym2CVxo1E6f0CRmX3nvIHEc66ZhUMtKIMSlRMrFfKso2PjEmBNe4zY50LA/eFdX1DgIqHj8+SrVir8aSXiC9znCuTfJxf8BcJUPWXTnhzumGqTDRESHBVDIJIw9jW0iFj1pqopoqr20lJbJ0DWzQZimAf6I8PHPs9JilsXnRnXMVu1KAkqQJ2TuNfHfJl/bsAeGAoh8PxPG4b/3QEfAkEoyoW06qTHXJ0JvnS93bP7TOYQ9H2KtM7J+xdVSWUeDB67Aud7fYj6f6WywhnBkD/iArvDZxrijvRyN7C7uspsmHYvxrCaPhmxLr3F+Hg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4PWZ5dCXzP9D9m5d7FrH/Ok6O3ZPrfAaX/CkSbQix8=;
 b=lrkAG/uMyDSQETLe45RIQzy0ZIqAtkfigvHNl2+fKC03VkX22KXK8eH1vEedKGsP3Mn+zSdavtC6sT3E1MBi/Yyelr2YeZkBl1VkKvm1P2/6hMJKe9luef+B68IBTwLfAfKkiccJ8yI9IGqGatLJhPGCSjSDpzCyXe32gezn25JQdXJB7hUD3iuX+hiJI6ngcljX8ci3RNoD71ee0HQBmbKMg4JOHmyPwcpjT5tHyl0TJaYBw7uCY9YrLAoNTXnsB8Nr5CfZSK7cUT/Z1dAjkxY3VTobjwBdURncNPR+XY7gN+hX/7PMptFMUFkOPJrtyIjJNQqqFpg4weqoDuZaNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ca39f14-a1fa-e9c3-1ce2-65d0d5ed79c9@suse.com>
Date: Thu, 20 Apr 2023 11:14:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] VT-d: restrict iommu_flush_all() to cache writeback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <d07ee286-52f2-c7ec-2d0d-1c343dbc78be@suse.com>
 <583d3f63-c3b3-dc73-6ca9-0ab5c60b26d8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <583d3f63-c3b3-dc73-6ca9-0ab5c60b26d8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: afd2dcba-c489-4ab6-695c-08db417fb6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LEax8ZgN+mymUNjkaAWCnKFvf7Y5DjGnXrdyaVD8HQrzz/BZ+ZkKpBr5nvjyQnb27TrgevCshWOxLP1Ih3A0+9EwQnZsko9iwdd4FI0+epOa9R2cmWiEPPKOqHtnuMMX3n/hmnqe/foQHv0/BvQo4j6XRGJtyXIVgw3mIEwaoQtWnU1TteogxWNjIjmOdDY116p8aEXbwKQGmoSjzkTnSQ2U7Gqz8Lg7ssT9Izez+QPr7uYUIwror4oljEiR07i4Mv8pgyAjMg119bLXd5GjByOrOn5KYbN05iNUVZdZ6yrgJlwgCqrjWoQUXhONP0td1eFWzszbbksICzDm8u7U1RNxoFk9IjFCIs+WiZ+bzHvH5OwUPETKLYREI4kxy+CdDa0bA/2vGk3NlBZLuYVoEY88D2fa/ZpyhpeyKiVNQpKyiKWkjT2UroYk4mW4BRyOtWSv300Ijwj/zLXgSIJ4/VA8OLIbJQ9+ZiS8fm2L2yXjkauswMpmFs+wXniKEOzDgRih7fEENDf7q+dOfNTgX5uKjTQOV6voVSIAeSg4jmkIdfFSLcuRPVRGIUSb6wAaIWYNhvsHV5sBSBiNq85mcX04LT+R+GLM/pSQOS/Z/DJN5zdFb8XJxD1piplJJ//CQtheE4aejgXeV13giGWnQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(8676002)(8936002)(6506007)(186003)(86362001)(6512007)(53546011)(26005)(2906002)(31696002)(2616005)(36756003)(54906003)(478600001)(5660300002)(66556008)(66476007)(66946007)(6916009)(4326008)(316002)(6486002)(31686004)(41300700001)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWlxSjA2Y1lFeTc1MnFhejVrRkhEaDlXZVhTZm1yb2g0cUNZODRhWk1IZTFK?=
 =?utf-8?B?LzdwYjRxZGNoSjJzaU9PTFI3QlNreTQ1ejQ2MkhDYStCYVYxa1JXOHFqdHhp?=
 =?utf-8?B?d1BwYktBVWYxUklHbHNQaGl5NlJ6K2dGanI3c0xOUlhGSG02YjJvWjVQL21p?=
 =?utf-8?B?RFZVblN5N2wySmpBSXZiZlBSdkVnY0lGRDJyWUJLdXh5eDdLU2dPVHFLaHhS?=
 =?utf-8?B?amRRNGxHVGZyWlpleGtDWVUyZnUrc0I2RzgxaHdFQTBjUEhsRUJQd1RkNHFC?=
 =?utf-8?B?eGEvKzZGbXFNRmZaY3QrbnpaL3dXNnNmbzhJNE9rUmV6ZkpmcUxsdG5hQjgv?=
 =?utf-8?B?NkFocnhLd0Z1bTd3UlMwakVqbGxhWmdMOWFZeGF4M0VMTHp6YjFja040ZGhx?=
 =?utf-8?B?VEtDdjBSM3BSbEdxUmJTK0tsQzFjRFlYVGxLSjZMdUx0K3JQVzZSdHdoNmU2?=
 =?utf-8?B?clY3T3NxRHZXVTJrNWNWMWZ1QVR4TUNGMFhRN2RWZUhWN2hrME40QkNSczhW?=
 =?utf-8?B?aElVbWVSY1p4Ly9uSkwwK2xnU0lFb2MyemtObmJsU1U2Y0NQOFYxaWFEd1JG?=
 =?utf-8?B?WFBCMUowSkJVLzZPcFBncVdsSndVWkc1VGlXMjZ3eTVFZ1BrWHFSejc0SG9Q?=
 =?utf-8?B?STJzbDFDRlM0a1J4eXg0ZEw0NmgzVDY4U1Zqank2OGN6MXArWEpwYVBIZTdl?=
 =?utf-8?B?NUlVcUhhUkc5aFZpN1IzR3NGbGNBWUtxL2xMUWxsYTluaXdZMTRzaTV5c3lF?=
 =?utf-8?B?T1BrZ25rK21qVWJNSVk0SzRwWGU2T3kwdkJkSU9Db3BoSHFGTGgxV012a1gv?=
 =?utf-8?B?UTZYbW1JTC9ZazRzK2VSdkFrTE9wWmI4RGJNaWVrS1pPLzhvVG8xVWRQMHQr?=
 =?utf-8?B?NUdud0xVWnRvbDJEK2FxV0REUW9hMTB6WS9xd0prL1E2OEh2clR6VUZqZ1BE?=
 =?utf-8?B?NEtvUGoyOVYzby91OWRIR1IrVE1hU1ZVY1o5a3NJc1hnYnd6UTgyMHR1ZEE3?=
 =?utf-8?B?YUlTVGF5dkNKK1B5a3hqbUNTbXo1Wmlxc2hzMmJPZGx2V2JQTTI1dVBtNVYv?=
 =?utf-8?B?QkdPZTdyRFR3c1VUOVZ3QTRsb3FiNmUreC9VajBWaHpwbnl4QzJMRlUzOTc4?=
 =?utf-8?B?aUdkdjQ5Sy8rYWNDeGtTY2ExVXJUZCsvdzNkUW1aZzlyVHh6N2NMM2ZsQm5E?=
 =?utf-8?B?bnBlM3g3RWd4UXFIRjIzQ3Z2RFh2alVGZlhpY1hzOXJhcG1iaDJWcHVOekpn?=
 =?utf-8?B?cVd4SEZHVkN5bWNHZkxpWk5oYm40VnAvVEpmTndHbUM2Vm1hV2JrUHIzVzc3?=
 =?utf-8?B?MkZIV1pOQ0ppSUJ5akM1aG1nVkNCSGJmMy9hNjBLbWtCVk50MHN0a2Y5ZlR5?=
 =?utf-8?B?YlRwMlU5WkdPeGxsUHNQcldIMWhrRnNsTjZ2MjdickEwUkh3LzVCMlE1cWRC?=
 =?utf-8?B?YUN3U0FTSENDd2hKNGVzNzJOam1tTFV0WkpnMndmK2pOTzQyVXFSeFhuZ24v?=
 =?utf-8?B?MzV0MGx2OUd3d3NlMTE2eVhvY3ZpVkN1QlVob0xVaUZzTFJzUUpla2tZa1l6?=
 =?utf-8?B?RHZ0blJjV2ExRkh5L2lWMHIza3RjNlZSYncwZU1adC9QaEJhLzkzRk5ia09U?=
 =?utf-8?B?Wm0vRzdYbnhNNHFYMWxMOThOY1F0cHdiemF3NVpKL3Rpc0VxREpTWGlvRWxS?=
 =?utf-8?B?bzRDVFYyTmU3ajU1TXBkbmo4QUF6MzJrT0tHRk9jRVZJN2tCd1JOYjFwcVVF?=
 =?utf-8?B?TlpneThTV1FaUUVKZENVZ0F4cDVHSUdtYm5mcmY5bjBybzZGYnVTdHE0YUNy?=
 =?utf-8?B?ZGdTcldTbXN3TWtLeHpTZzR0dWZaYlVOU2o5SmlQeDNTOEJVbjV6Z20yNk1T?=
 =?utf-8?B?SmNqeW9ETGs2ZWF4dTZUTWptMk01VDBVUG5ON1ZxV2FKR1E1YlRJNGNHSXZi?=
 =?utf-8?B?bTNiaTI3cmUwRkZWMGFQQkgxYU9sNkRSWjFndjJKbDd3TmRlSERhMVFTZDJI?=
 =?utf-8?B?Sm80WXd1alNhZWJ5VXBLcEdiOVJtN2c2ZEh0SllKRThpSk9iUnM5TjBrY0tV?=
 =?utf-8?B?cUVHcUtOK1NCdlRVMlZ0c1B6Qk1oUlJpL09wcmE2M1NKRnpqTXlaMjhBYjMx?=
 =?utf-8?Q?aurUlvfJi2VxyO7jyyfQ/sssU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd2dcba-c489-4ab6-695c-08db417fb6c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 09:14:58.8233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPZfH59nnIoh+Vjh/xk78vF7smxyRJZRbLOoVtG+Fs52JF/G4z7IhB+eWDhOBOihzMLzcixGlhJf0YgE6dHQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182

On 19.04.2023 22:46, Andrew Cooper wrote:
> On 19/04/2023 11:46 am, Jan Beulich wrote:
>> We don't need to invalidate caches here; all we're after is that earlier
>> writes have made it to main memory (and aiui even that just in case).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This, aiui, being an analogue to uses of iommu_sync_cache() (just not
>> range restricted), I wonder whether it shouldn't be conditional upon
>> iommu_non_coherent. Then again I'm vaguely under the impression that
>> we had been here before, possibly even as far as questioning the need
>> for this call altogether.
> 
> I'd far rather we fix it property than continue to massage around the
> sides of known-broken logic.

I agree in principle, but you're not asking that I actually amend this
single-line change with all the work you outline, are you? To be quite
honest, what you ask for really is something the VT-d maintainer(s)
(i.e. Kevin as it presently stands) ought to be doing (or really have
done long ago) ...

Jan

> Coherency, or not, of the memory accesses of an IOMMU is a per-IOMMU
> property, not a system-wide property.  What the iommu_non_coherent
> global boolean currently does for us is enforce cache maintenance on all
> IOMMUs, even the coherent ones, when any single IOMMU in the system is
> non-coherent.
> 
> Inside the IOMMU driver, cache maintenance should depend on iommu->ecap
> alone, disregarding anything else.  This will improve the performance on
> any system with mixed coherent and non-coherent IOMMUs, without any
> other behavioural impact.
> 
> The complication comes in in p2m-ept when we're sharing EPT and IOMMU
> pagetables, because the EPT can be accessed by more than one IOMMU if
> the guest has devices behind different IOMMUs.
> 
> But we know the devices assigned to the domain.  They're almost always
> static for the lifetime of the domain, and generally single device only,
> so there may be value in considering a per-domain "I've got a
> non-coherent IOMMU" flag, because we absolutely don't want to be walking
> the list of attached IOMMUs on each EPT update.
> 
> 
> But...
> 
> SandyBridge era systems are the only ones I'm aware of where the IOMMUs
> advertise themselves as non-coherent.  And on that generation we quirk
> the superpage capability off anyway, meaning they are ineligible for
> HAP-PT sharing anyway.
> 
> And if we are doing HAP-PT sharing, the cache maintenance for regular
> EPT updates will be crippling for CPU performance, especially as the
> software bit updates are not relevant to the IOMMU anyway.
> 
> A better option would be to simply disallow HAP-PT sharing when there's
> a non-coherent IOMMU in the system, or (slightly more fine grained) to
> disallow adding a device behind a non-coherent IOMMU to a domain using
> HAP-PT sharing (as there's a disable now anyway).
> 
> Either will reduce the complexity of Xen's code without any loss of
> functionality in real systems AFAICT.
> 
> ~Andrew


