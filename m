Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E2330FE9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94944.178975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGFS-000694-N0; Mon, 08 Mar 2021 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94944.178975; Mon, 08 Mar 2021 13:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGFS-00068f-Jj; Mon, 08 Mar 2021 13:48:38 +0000
Received: by outflank-mailman (input) for mailman id 94944;
 Mon, 08 Mar 2021 13:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBqT=IG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJGFQ-00068a-9g
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:48:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a90b8f6-cda9-4974-bbf6-1edc811a79f0;
 Mon, 08 Mar 2021 13:48:35 +0000 (UTC)
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
X-Inumbo-ID: 7a90b8f6-cda9-4974-bbf6-1edc811a79f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615211315;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zTS8y9jsijYxARDDmBbM4t3EhgQDoxzfdy1ac/DDICY=;
  b=I/nbwj6DaK1wd7h/0PHd6leib3qxVoG5vK5kvh15biR5NsEU+FDu5pHI
   HDNb+l2jJJBqqUWzw37WLrc/N1VzZo5iunSKld/ll+0Ug2C3VVE244KUX
   1fXH34q6gt1aQ1ku8f6x7FYR2lLu96pkzG4XvEGsVlUKgwsJBzhNFulpq
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TCmCvPwbJWwufcMFe2Ew7H7HIa8SoYEWV1r3S2v/Et3OdRbtTXqJfS8a4X2N0WYVBnCkXXr0Yl
 NP/8Pq5vbUwCU1iSd5oKSa2WGcuNd3251aSvddxkiFO6CSh74pXBq8ve/EH468LHN7JIZFHuwk
 KHiyEwWExVYrkLIGzkTYPvrsvsNV9awCNxc/pVS9/Wuvn7uMWzv3ADXUJ7BXzXLH+E7A0HZyoO
 EwO11eW4XTzB8oiFL/warfp2MF3LMwS5Br73slmm4Q4LD4g6k0URqGCTE6b3ZJ1hABZDIQBue7
 7Og=
X-SBRS: 5.2
X-MesageID: 38783487
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38783487"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+aUe0IZ3fnp7BhRy2u5mqUVynnrwHW5M3NIDqJq229GIuK6qXo4AQ2EJYn+aawRZgZWngMtubFqWY2S5WPjWSqAju4SI+oXE20yeSk7BHWwZqBSIVJAOezm+nRvrUB552fjqWLYhox2Tw0MFd1/nHASMOLbCpYUDAwNYrrRu2xYwoMiaDSwklH5cHalX7oLZua+QJh6pFBHqGSV43lPWefwEDcUm54tn6XByYXi2PtCtQeTI6anlD8+XPg0tETaTWZNF7VwkOAurRSyGj4y4JFfgkv6E1qzHhx9h+qHtJHHwxQ0Gf3BmhxGNzgYnsbGtU4WbCgevuoCUxManFRBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTS8y9jsijYxARDDmBbM4t3EhgQDoxzfdy1ac/DDICY=;
 b=QYwgetabPnEXDB1lUkvSgdJQQPEmsa34hLuhu7tfY3dgxH5mSdBBqmymwH36KgVZzExtODFIrbdtoSiJbdb1qsdADMTw6eMtgPjFy6haDdlgaFGOiZmgrX+BUTZkfUt11P9RAjTaHnn2pQ0BVbrr2+ehyEldDo+zrnx9SJ92MR68aN4pXawWjWFVIFq2OXEc1xb+kUIamWkViMXKbGaAcmmXYkHhDqDIO+z1rh+NZUl5fe+X9hFSkuosKPMMbS3+3ZIe6pXrsAuhEe58BQA5s/1fsv7lkFODWIJxgDsBp7PZhCyMM8IJ9DgAVbcJUyzDP7MOjE+F7jDUqNB37VTT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTS8y9jsijYxARDDmBbM4t3EhgQDoxzfdy1ac/DDICY=;
 b=V9AE8dCBd88BGQo1ay+xOqZdmVsTKj1meXU9NJyArKsgjwPFFmQ+vZmA8HpEQgxgKgSKDLUv5cv+8qmsSRWstOAzQVsofLCEs0XFL8jCEZ+wo3KXN5LjyODrPlE+ybB/MRszRvID0hRKmxgSgyKpa+4+tkhPL8W8FpUj+c2oygQ=
To: Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <96c83adb-9e81-8398-c905-f4f0730ba240@citrix.com>
Date: Mon, 8 Mar 2021 13:47:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 394c6b28-eb15-4437-3833-08d8e238c4e5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5773:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB577346961BC9CE95B051BC7FBA939@SJ0PR03MB5773.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZlPEA0zeEu538e/bk3X1O7ziyhAYeeJRJYXI7aEEGDZMvukODJOX95wnSJa3McFqtkW7gAwb3cXYFpeYecPWn9TDFTiN2FLCqU6x6sU9axK84Q6zQNwfqPLjgfCix75l3BfYg6QiEEClW4F9LDXs2GCcSKPsnYyZEIGjyyBOYRTOlTQbyq3y/Flxyt///Nv4/15ZoNhs5YwwPi5EBakWlVjW1XONj7g6Rf1kyuEU9bhiulXuvCfpqQ3YqYkIugcjkEivhUxb0M/0171ZxwxQYcSEtMDflbtgvtIi2ku+bvm00xGwINw0KxIYp4Zu6XwhJr4AWlgh2oeIZnJnyt9XRwb3SmInx/4wrIgKnS5HvXE1G9lZxksIU6WzpQKG3MKA8ATJOEZkppMkh1XjtWX9iaqrvSO9jTJZeL8bGtQt8OHmiJ1GrCTNwjsZaP03wfk/xiTNGSX07fpGOHsEMQH08Jneo3sX5bgAoQJm20HEfK6VzUFfrKdymXNoQ32xp6rTE6gRxi/YubfZK3iKyNY/O2NWjvp9avuhB7q6QT6BawK2ODZwCXkRrl1uQLzV4+YOXJCAQIZGRj3v+uEvueMxwqrLFItBTb2ikZpXeUeA2pA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(53546011)(2906002)(4326008)(16576012)(6486002)(956004)(83380400001)(6666004)(2616005)(86362001)(66556008)(8676002)(31696002)(66946007)(66476007)(186003)(26005)(16526019)(31686004)(36756003)(5660300002)(8936002)(54906003)(110136005)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXBpOFc1c0lQc29Id0JXWXoyZVdLTEh3NzRVekdZcjk1aXVzUXlvWWVKdnNC?=
 =?utf-8?B?MWMrVzcyR1VORzcybXVZWCtsTTBza3R0SVdEVzZ6aVlCdmx1U1pXVHhzazUv?=
 =?utf-8?B?MmhCeUNabTdtV0poY01EdVBtYkw4bktBSFVjOC9BWENVZURIYVlsVEJPK3hZ?=
 =?utf-8?B?RGlLZUdPL3FFYTUxRzZOd3dmTm9EU2dldUllTlFhMXpmYldHYktZWGdSZ0Q5?=
 =?utf-8?B?OFUySGRjaittVWJLUFo2TFZ2UkRYZkpERitnbXBSMTBPeDkxb2JlMkE1amVY?=
 =?utf-8?B?QmphN2lxN1FtUzRyN2Q0NHkvbVZmb1pXR012ckQ4QXozWFFIQ0QyZDVpU2p6?=
 =?utf-8?B?QlJxMXlSbCt1ZEhvLzhwMnFlRVh1WXlqdnJaalo5d0I3SUo5Zm1sR2kwRlRn?=
 =?utf-8?B?bkN6dzZaRjA1Ui9NNE9GNFdkbkRxSnNTOWZuamVoeE9hL0dCcm9VaWlUVFh0?=
 =?utf-8?B?RTlNcG1pNzd0NTJYY2hlcjB0TEZoZkUwZmRBeURSZFVxQ25xODJkNkY3WUtZ?=
 =?utf-8?B?amJBSnFnQ00vUHZjWFRzSFJwYkttSVlkSXlBWnJXUXJjQkJScUR5S2tmMFlI?=
 =?utf-8?B?VjZqa3ZxajYwWGl6YzhEaGdXTzFoSytZT0d4VUNidkhNM1dYUFZGRGJmZWhp?=
 =?utf-8?B?U04wcVlHZDVVTXI5N2M2U0dnSWJkOXlzWW5zdVAxNUNPUkV6bXVFaDUxanA5?=
 =?utf-8?B?dzM5MWhmR3duQTlVU0VtUHZqYXZENVE5N3FTNTVJd085c2pFa05zbGxGTnp2?=
 =?utf-8?B?anBFbFFmbFkyenR2NWpLcXArdHF3TGtHbFMzV1BFYnc4QTluM1kzRnVTOFlE?=
 =?utf-8?B?V1B3T1hzamtxYVJhbU9mMWtyUnlYbWtKdGpEREpMSWZ3OXQ1amVMK2ZCamJY?=
 =?utf-8?B?NVcyQlNZVkc2dE9FcytsVW5qMlgwaUtSWllLdTBLRERUQWVESlNQQUJjWUc5?=
 =?utf-8?B?eGxsVFVBcU1QSEQ4NloyNFM0TzNPRWlGS2ZMZUI5RUhUK1Y1Nk1DUlk1SExN?=
 =?utf-8?B?OUpWSG5vQzJBUFpUNDRMem9xSzdOcGNwWUQ2NFpTejNGVlNnM0dzbFhOMDB0?=
 =?utf-8?B?MGMvV0JNYitzM05ZZlFib1RhQ2JSUnVycU54dWQ2TVZmbXpEblFnTjVpMDd1?=
 =?utf-8?B?Mk55TmtYTTJyNWhDR3I5L29TN3k2ZXN1UHJQNHJ6QTVYamIvN25oRFhHT296?=
 =?utf-8?B?ZkZ6OGc1dGdVTGNmQ3dMVTh6TDllR0xGQ2dYU2pVV1dBelZrVHpaZTB4aEJS?=
 =?utf-8?B?aDk2TDhzTGdQelVWY2hMdG0xWnFySEZ5THpmUnpuMU9WYmpTdEx3dC85NjZJ?=
 =?utf-8?B?NmY5Y1lEZ3c5dkpObElXdThYcnd4aEdzR2dVLzVNVkNDUU1CU3BvV1FnRU82?=
 =?utf-8?B?WVZHNU02V21UN3NlWjlsT1dUbWdiMnVVcHkvUXgwVEk5dDJnMUVqUldsL2ZJ?=
 =?utf-8?B?aHoyYWkzV3hnUnVuZjdXY08zVnBFelU5Z3EvaWVJREhUdVRtMWNaNWpVbFVj?=
 =?utf-8?B?ZEsyTHJzcU9PckFRdHNEeStRWEpJV29ZaEwxTE4zVndYVTZUUk1MN2UxWDhM?=
 =?utf-8?B?dW1XanI2ckNRYnEwRjlFWkNnUFBlbXgyNDk2Z1d1U1RxV3pnN2tIYXNhdGdm?=
 =?utf-8?B?OUVGTUJ5ejZ0bXoycXRDUlFveTEvdmtxY0ROcEQ4amErU2QrdnJNVkwrT0tt?=
 =?utf-8?B?SFFybUd3ckZjL0twWmNuTGI2d0VLOTArSVA1aEMrRWNKSmVpTVdycERLSEw2?=
 =?utf-8?Q?c7D/zGehySLsAVcJLx7aSs/NtCIY26bPkBFl0MY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 394c6b28-eb15-4437-3833-08d8e238c4e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 13:47:52.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfGK3/KLY8ZmaYg9cBIhlCyVZjqCoH7l1U9kaUwDHalBv9NEYQpCLnFLyFf6y0WLo6VVdH5LaXmzaXzfYuccMAZd8IDMek7APs3ySPJiGCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5773
X-OriginatorOrg: citrix.com

On 08/03/2021 09:25, Tim Deegan wrote:
> At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
>> We can't make correctness of our own behavior dependent upon a
>> hypervisor underneath us correctly telling us the true physical address
>> with hardware uses. Without knowing this, we can't be certain reserved
>> bit faults can actually be observed. Therefore, besides evaluating the
>> number of address bits when deciding whether to use the optimization,
>> also check whether we're running virtualized ourselves.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tim Deegan <tim@xen.org>
>
> I would consider this to be a bug in the underlying hypervisor, but I
> agree than in practice it won't be safe to rely on it being correct.

I'd argue against this being a hypervisor bug.=C2=A0 If anything, it is a
weakness in how x86 virtualisation works.

For booting on a single host, then yes - vMAXPHYSADDR really ought to be
the same as MAXPHYSADDR, and is what happens in the common case.

For booting in a heterogeneous pool, the only safe value is the min of
MAXPHYSADDR across the resource pool.=C2=A0 Anything higher, and the VM wil=
l
malfunction (get #PF[rsvd] for apparently-legal PTEs) on the smallest
pool member(s).

Address widths vary greatly between generations and SKUs, so blocking
migrate on a MAXPHYSADDR mismatch isn't a viable option.=C2=A0 VM migration
works in practice because native kernels don't tend to use reserved bit
optimisations in the first place.

The fault lies with Xen.=C2=A0 We're using a property of reserved bit
behaviour which was always going to change eventually, and can't be
levelled in common heterogeneous scenarios.

~Andrew


