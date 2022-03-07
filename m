Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2D4D0408
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286283.485749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG9d-0004nT-2g; Mon, 07 Mar 2022 16:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286283.485749; Mon, 07 Mar 2022 16:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG9c-0004la-Vg; Mon, 07 Mar 2022 16:24:12 +0000
Received: by outflank-mailman (input) for mailman id 286283;
 Mon, 07 Mar 2022 16:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRG9b-0004lU-Cc
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:24:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0352b4de-9e33-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:24:09 +0100 (CET)
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
X-Inumbo-ID: 0352b4de-9e33-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646670250;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hw4ChFqqRCgDZMlvxxo/VDB2pJZLzDDpYLAPRuARsO8=;
  b=PnCSjz6sP5wCHk7Mw6D2wnPcNCgOoGSzYiki5kuFUq99xoNzRjxrCe31
   tdOUud+CRg8LI0advL2UO0WRy+Qe9fvTNQTRSqbYFSFphVHefH8Kn0MdK
   T19U3Ap3XaA2HPIOHB81GgcwGP0pwIr7MQFrwMEKS8e0uNylJjcmrAioa
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65626181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bYCORKBFXmUjARVW/yDjw5YqxClBgxIJ4kV8jS/XYbTApDgn0mQOz
 mccCm3XMvfeNGqged9wOty/80hT68TRzoUxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhX0
 sVO67OycT0rYLTIx88laDsJHhlhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWlq2JkeRJ4yY
 eJIUGJvfQ7sUiceAWgzLbcDs77yr17gJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFierh1CdNhoKe9k8QXS4ZLvwVeUPndRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtrxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9qWn8pSb8JtAAvFmSwXuF1e5eJVfUj
 LL741sNtPe/wlPwBUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJS9DWcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF6No
 oYHapDTkE03vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvrugE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:sJ1kTKydEIWFiDKWKQQcKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65626181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzjdnTy9B3tbxtktFNz8Ov+2NDI2NCV010IgvgKb06aQj4wEuJ0UCwFXTBadppEVE6rSz4pDhVX4dUPzNRcx0L68vpQmBRFTjO26A4q8KqBbDOx3OpGGx9uM0CBTpZR/d6W4NSsAVyyAmT65el+V+msrV5lzrTpp8wSzSvr7nZqqUxOY6qooFhR8kiJkhgjh+Kkm1r79VaGJLJuK5ntuKp6lGHqlkqabW8v2PkIZGTxORN7acaXYlTHBJZKlOwR3niu5dG3V+knVtToZJIaXSzHgHOv8AY0tf/k47rUSkEN78dE1PgfefMRA7GmZIsKhmFuhUJK3g2sNQsWpqgk5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwEf5thNpMC0iOa5SJZ3mnlSn6rIoIeQsgCpsPNQus0=;
 b=i5aJUPrVQrgYYv0eAxFXIGJrcmQ6Upb9+uGumVaVW7GC8CRyXiM0xbB/gl7GNxb0Q6STA+IOHSi+jgJVMtkK5K/zIa/cwG0m0knzBmDjiQzAXO91Rtm6q36ZjTA0oLPlsHjMvPA7ex6K31tDppXG5fTz5YzGswMxOWdlC+atoEnqWngn8WUokSumvLyfHgoYoRcQBXrkonGdByokhuJTwIzLsmNxPM+BsMh3xJuYj/2jt/Uuy6w0K0JGSYTaoN4QbdzWM9v1Iig8NpGr7Ew+L435tcTm86MilKWntshhwaSoSWWWw/wPbj+u5BeG02e+KDZirqlHSM2sMVN+iOf8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwEf5thNpMC0iOa5SJZ3mnlSn6rIoIeQsgCpsPNQus0=;
 b=udys/XMl8izoXPiI+qldZ0aDPWt3fgMuzV7ix6cogK7MEdmQdOCmaYUk/pQI15AkB0g2SlX8X9mcWScuaA5GqZn4td1+1kg2hsizGeqfqebEaQNtQPzwiuFMvO6fpN1U4pV72i0loK4rXkr4+qEK4s5pwJCEBWe1wOEK716U4UE=
Date: Mon, 7 Mar 2022 17:23:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <YiYxnd67jUBUlWHs@Air-de-Roger>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
 <YiYfVmW3iQ4wA5k/@Air-de-Roger>
 <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
 <YiYqLtozm4/2Ibu0@Air-de-Roger>
 <2f0b8b0a-7f0a-13b7-4839-94f30aaecfeb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f0b8b0a-7f0a-13b7-4839-94f30aaecfeb@suse.com>
X-ClientProxiedBy: LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed0952e-ac35-46e3-61aa-08da0056e548
X-MS-TrafficTypeDiagnostic: SA0PR03MB5610:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB56107497E659B14A03B019408F089@SA0PR03MB5610.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8os8Em8+KxQwY9yeYF6/5XtbuKk9OXlK4y5tFOSA9b/KFmA8gIvy4GQVJU5GZsUUdauE7wye1i7wz4m+YykJeVfPQ0UZkL45sgkIOx5HqnyaotnWfT7vTqrn54l69PBHc+2phP0JsDTDT+6orw3irifOWJ5c/K9OL24HXZxql444nciPnWuCI04hWj/E7UeeVddBx4b/h6ip+EJov1S0gbrlgXYCjXp3M34raNmcTR++zw+CIKdCXXVJAwQuDFATqSwjNSpIXDo4W0vY8ErtvvZEnU81tWZ8FPopVYt2erywwwVvGXi7dRi+ftlDr7z6PIymCoTSPKKb2u8cm0idSnFL+S8+vqj7CVO59ApC5e6Tud/I1tTWmz3PsBTZ+gAhrXEHSY0ohYOMtocdJr6E+sEtIUtzVSK6sNpv8h7MG76mSdwXFg6M4un54NThUDW70EWNOUmFVY9hNRfZ/8h2NUzaFzsxBK/qEY0l5ktjB1t2OgpO+0aRTKXEMJ+MxL9NQkQloHLfJGK3NIGx8rpN2/cJKvgC0zeGtKDlbQ4+W0m5jiahMhurdNvkI8nzLzs6RdM/rxqrRufJNiBNqFKn5ne8Yfl5QC4ubdwNWAXYAt+GmyJbmJYVw7RLh9lc4LbjoMtHqnc7/EzdToJDhlkbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(53546011)(6486002)(508600001)(54906003)(6506007)(8936002)(6666004)(9686003)(186003)(33716001)(85182001)(6512007)(6916009)(2906002)(26005)(4326008)(8676002)(5660300002)(38100700002)(82960400001)(83380400001)(66946007)(66476007)(66556008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZSUTJQS1BWOWRyL2RQOXA4SXZjeHY4VG9QRWlPQ2xBMm5nMTNTdTlFTlg2?=
 =?utf-8?B?VzBBVFhIWkswejRiZ3liaXpMTVZHdE5pT3lWY2w3TVNhU1RxY0lDQjZQU0s3?=
 =?utf-8?B?OGRrRGthRmJJalZrTjUrMkdubmxaOXRuSDcwK2xPMGFINUFRYUM0M2ljeXRV?=
 =?utf-8?B?NzN1d2E2UzBZanpjZE55eTVVS01IdFZmWTVwUi9SNzFmTVpwbEh4ZmlDSzVF?=
 =?utf-8?B?T2lIYU1RMFphc2VqeFJnbENjcUpNSzZrSHpJSWZSTHEwRG13MXBUK2ZQOTNW?=
 =?utf-8?B?WElSaENVNnplZ0xNVmExWnVwWDBWWEhyNjRLS1pNbjBqYTFzejBmbGZhTXBV?=
 =?utf-8?B?MUpNY0o4OWpCL3czSGtGU2VTT2V3TDNIOGpzb0xKMmxpckZyaVg5K0FlYnpj?=
 =?utf-8?B?cHNjblZCTlBaWG4zNWpVaFNEbmhxajVvajdZeHh6NTBBMEszN0VPVmNaV2Y1?=
 =?utf-8?B?K1JMRDkyekhOaWJPdGU5a0JpaVNFVk9BK0ZMbndKbzIzQzJ5MzMxQU43UC9s?=
 =?utf-8?B?RXVhOHpoV3BTSjJXMWpJTTA4QmphUEF5TEduNDRDMDFmdlNnUHlQajZvNDcz?=
 =?utf-8?B?eEZqdkR1cXFvN2Fza1haMGdla0cyZ2RnV1JIZWNwbkdpSitEOTYzamF4VlBu?=
 =?utf-8?B?WUphcUlGZ2lyMTMweFovK2V3STFxazRTVitITkY0dXY2eklrd3hUd2RwZ1Bh?=
 =?utf-8?B?ZkFoeVk3cmE3elJCYnFEYkszUDJHK2YrYjkxRDVxb0pjbDA0S0Ryd2ZObVVF?=
 =?utf-8?B?M2ZQakprcXdId2R5L3o0TlFJN3dtdEFsV2ZwcE10TFYvMTA1TmVzZi9TMjVa?=
 =?utf-8?B?YnNIaWk3N204NTRVcEFvV3g3Ymg5Nk5hZnQ1clg2UEw1OWJtQzFEaWdRVXpx?=
 =?utf-8?B?QkNGQ3FHaGtvQzJQcTQ0QUk4RVkzRUZIS1hMb3EyNU0rUGVxT2RFeFN3UU5H?=
 =?utf-8?B?QmtEOVZLWFJKdTF0NlMrYVorb0lUaGszT29lOG53L3lGT0ZCbFFEYUxvdmtO?=
 =?utf-8?B?ZG9oc2pCTEpvOWQ3WGZLS2t1S3BYQzRHV25PMjcyeFVURGF0ajFHbGZpYTdP?=
 =?utf-8?B?SDZXcGpXMkpBdjFmZDNOL1EzZ1FSWGI3NHZQNFVyQnZ3MWRuWVlDV0JFNVZu?=
 =?utf-8?B?eThXa0JHTjg3a2d3bDNIcFNlNkVoYU5qYlZMOTkyZExPc1dTeEIrdHFIODZl?=
 =?utf-8?B?UjBrMVZRLzRTZ0VzYllwTXo0Q0tXcFp3OXVKOVRSSXRISzZlTG1pbkhpUFNy?=
 =?utf-8?B?VG11SzQ2QXhxa1BpZ0ExS3F0a1dNeVlucjNKRk9xNW1YYTBnZjNuOUxPU1Ri?=
 =?utf-8?B?RHc2eTN2a3NTQStONzJ6NjZ6cjBxd1lGaWlqR1RjTUViekZWZ3pVUGVkTlJW?=
 =?utf-8?B?YldwTHF4V2JXMC9QUm1CWDV6dVRnWWlJOFh3RmpaMDRQbDdsblJZUkJZeUdP?=
 =?utf-8?B?aEUwMUdZempVQTk2OHpXZFMwT2s2dnl1Q1VJd1hBK2QvRWllQzhuMnJVa3RH?=
 =?utf-8?B?OVRFeVI0N0wyWk9iU000WHlDSG1XMzBZMkpBMzNUSmZpZ3ZkQXAwaVZ2ckZQ?=
 =?utf-8?B?SnR0ZHNIRGk5VFFLOCtRWjdzZ3AzRmlTVlRaUUlTcjlGc1RZQllKbCtzV2xJ?=
 =?utf-8?B?Y2kxWVhWMzdMUS9YU3ZKVll2UGFicGYxR3REMEtKOW5qTHNsYkF6UVRvcE5v?=
 =?utf-8?B?WS95bkNmQmxBdG04RkxON0NJYkdSUng1aUZ6emJtbUE0bFFEUzBUVml6RDJW?=
 =?utf-8?B?SzNDd0xYRVd5QjZSVWlNMnVhNUh2VVNRRkhrU29CdTh1MW0yWG1Mc2dEMFBq?=
 =?utf-8?B?SGgrb1NST3l5MkpZbkhSZXJ3ZENKalNZUEwzUU5heDdZYmszSkhZYy9zQ2da?=
 =?utf-8?B?c01sZmlYMTkwalErVXFaVnBIWVVEQm94ak1sMmI3RnpZZXBYalNMRVRzY1Zo?=
 =?utf-8?B?Sy9zMDQvNWJlRDc4aklpRzc3WDBDSWNUQWt1eU5tcEtTeDU3elZWOFU0dDFl?=
 =?utf-8?B?VytMNVJYWGVtUkhjRHdXaWNLMGhoNmYxSDdUY2dPeHlCMUtsczFUY2JMZVk0?=
 =?utf-8?B?cjY5SE9Oam00N2NOeU43b2lCWVV1Q2dHZXEvWllEUWg1Z281YUNrRUEwRnYw?=
 =?utf-8?B?K0o5WVV6OGNQS2NxOUJ6VE4vY1kySHVoOVhnKzVwc2dtdERNdUhKWWxYbFlQ?=
 =?utf-8?Q?gQEcNCDBULJM4xBRhy3W880=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed0952e-ac35-46e3-61aa-08da0056e548
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:24:04.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zI5aDOxMHWbAXgsBjzJAO3PfyvmxeMKyiBXrSlT+T6dLjuV1dn6ayAMG6JmSuBRxqVuPHUIMkpUKi6lL0tsPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5610
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 05:15:57PM +0100, Jan Beulich wrote:
> On 07.03.2022 16:52, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 04:29:22PM +0100, Jan Beulich wrote:
> >> On 07.03.2022 16:05, Roger Pau Monné wrote:
> >>> On Mon, Mar 07, 2022 at 02:49:32PM +0100, Jan Beulich wrote:
> >>>> Support for this construct was added in 2.22 only. Avoid the need to
> >>>> introduce logic to probe for linker script capabilities by (ab)using the
> >>>> probe for a command line option having appeared at about the same time.
> >>>>
> >>>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> Obviously this doesn't take care of old LLVM ld yet, if any care is
> >>>> needed there in the first place.
> >>>>
> >>>> --- a/xen/arch/x86/arch.mk
> >>>> +++ b/xen/arch/x86/arch.mk
> >>>> @@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
> >>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
> >>>>  endif
> >>>>  
> >>>> +# While not much better than going by raw GNU ld version, utilize that the
> >>>> +# feature we're after has appeared in the same release as the
> >>>> +# --print-output-format command line option.
> >>>> +AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
> >>>
> >>> LLVM ld doesn't have --print-output-format:
> >>>
> >>> % ld --print-output-format
> >>> ld: error: unknown argument '--print-output-format'
> >>>
> >>> So it would be always defaulting to SORT. I'm not sure what to
> >>> recommend.
> >>
> >> Do you know if all versions we support know of SORT_BY_INIT_PRIORITY?
> > 
> > Hm, I don't think we can assume that we support LLVM LD in 3.5. I'm
> > not even sure if LLVM 3.5 had LLD in the first place.
> > 
> > The first version that we care about and that we test is LLVM LD 6,
> > anything below that version is of unknown state.
> > 
> > I've tested you change with SORT_BY_INIT_PRIORITY on it and it seems
> > to be fine. This was on FreeBSD 12.3 version of LLD, not sure how
> > many changes have been backported from newer versions there.
> 
> I'm inclined to suggest then that we unconditionally enable use of
> this, in the hope that we'll never see a bug report.

It's unlikely for anyone to try to use LLD < 6, as that wasn't
considered capable of linking the FreeBSD kernel. In fact I should
likely suggest an update to the README file for comments, as with my
FreeBSD hat I only care about LLVM >= 6.

> But of course
> this then again gets me into the business of needing to determine
> the which ld variant we're working with. Looks like I won't be able
> to escape this anymore ...

I assume bumping binutils minimum version to 2.22 is not a viable
option?

Thanks, Roger.

