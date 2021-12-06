Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBF469197
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 09:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238738.413791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu9UY-0008Vr-1m; Mon, 06 Dec 2021 08:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238738.413791; Mon, 06 Dec 2021 08:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu9UX-0008UL-Uv; Mon, 06 Dec 2021 08:36:57 +0000
Received: by outflank-mailman (input) for mailman id 238738;
 Mon, 06 Dec 2021 08:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mu9UV-0008RJ-Kd
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 08:36:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa4dfd6f-566f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 09:36:54 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-tafLl-8fMfulVtp6SpfboA-1; Mon, 06 Dec 2021 09:36:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 08:36:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 08:36:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0066.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 08:36:50 +0000
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
X-Inumbo-ID: aa4dfd6f-566f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638779813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGc8cUwvGg7L/5Dgxzq27jqpcFYF9MeWp9OU2x0atT4=;
	b=XsH9Bc7Qf0ZHFxs+ZvmCA6u1N5BYolvwjT53rio2grzNKKZnvsd6YV9HARq9yOu9LHs0OP
	3NsdTRuYRfb6NJIoi1EeN4cxfkT6JuXMy2h7BE+37T73GUdU00iaMfzaaPnKgnoMYkE3S2
	et2qJM93c13ueiBNa8vckfizpE8ZBvI=
X-MC-Unique: tafLl-8fMfulVtp6SpfboA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey9fYSnLpvkHym19sTIg2AyGQlHR3VIwTgT5DPeKlQVDxrBFokbubXxq/l89+Tdt/KGh5gw/uTJdbvFC4zSY3fvw1W4QeTbj8kdghxS3FTpCm6m8IJIdJ1VCrPcfD5/w+Ne/5YhhDTQPYmDex0wLSHBjcMnaTRkFiPWLeRxZt5pOMHGVkSh0OjFsInn9G9OOaND4oZu0n4J/OQ83rEJ7werTQvuHhvwkitKQpzFJMz9qCByjXT9Fklm2rfD4/qjiqlxdANGZ107cE3opXIezqQvO6RaYOwRa6EmAmjD0AxP8N/30140r2RupiEHrEYXXkWTWZ32K5zbYWypexxvdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGc8cUwvGg7L/5Dgxzq27jqpcFYF9MeWp9OU2x0atT4=;
 b=PymPTwGbo+uLuo/h4zDDuKyVXIT2zBcGyh1+6pxj71UBN/voeA256JaAjtjVJ/RZSEZ06JX5pBYUBD/vddQGaxg7pFn2Kx/Z24XjhFwDlVvB65pMO5MxoWk7j/5vV7/xUqTwE24mizXydIzxCkm5pbutQYL2xWlZdj6Lph5pt0XrC4KQUsjM1xecQubBOnMbF7ccijBShyUQeKZg3R2SO9m0hP2EUYe32qiDEp4DYodEoYcwD2qpwgn78+RrOpM7z1/0Ebv2dVd+AgwguOPNhz35xni3oyqhTMyLtffubYkPkzejTRteO10kLcysQybOXDrfCMQkl5eqgy3HKhkBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bddd9fc4-d442-9272-0fcd-4472c83e36e7@suse.com>
Date: Mon, 6 Dec 2021 09:36:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 08/65] xen: Annotate fnptr targets from acpi_table_parse()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0066.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e681c21a-c8f1-439f-8a64-08d9b8938cb2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606181CBBBA7101EC950150B36D9@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N38PW756cwQeWkRB0JBRSTQ+u9t6PgIA3WNRMtPm78bB4uTs48oqr8yo4IO+HMMAWX3arxbPQG5vZZs8fyqUgRgJYd+Vlduq6UbwPFENtjDF5Gkbw9Q7aVUn+dy9ET3CVDD8mdIlxRFqQ5kmqBGE2N6cqE6Ib2u77BFhBIVDsiQj1WcoD6JBj/NLEMBe9Pr7G3h4yLhOfnXkqG/zmEIuYPOVz5bMBSqsaji1roi3syXEcw9PByg5E5RDmyHSyPnzyRRSmygsSI5yNix9Br2gZruYzE5YcRz9jveKvyVezxzfW2L0nucuTTcxumEG0AKP2bHKBnHYH/V8ldK23xe/MfV9Crh57u3uI3s7E+kRYlIpjUM3ptPi0DVjwJaUS+rZT39vXb4rdwhF8C9llYALhb7a4z9oSzLFXrS/H56yexYc9nkD+MVcU6PUI6N5JEY11YrgpyryipOFUYBeEcvI/2HPXi1PnCq6NGC46RhQYls4COwr+D/1JGFObVBk1uTcLWDvi4+nT4njzJL2Pw03rj/VpLl9X+Q7bPzAcbES+kDXp5z075xS04ymQh254lk4SIWbpMGGvqiVMGWxQGyDWFObzSboPRTPbITG5CvEQkEC2ky+JZcNX61omCnBtxqKFlz/vlnULFBeb2HxHOziKbhEmVmuTjweoZiQ1N6/R6lZpK+8+mTR85AezjZW4hdgMSchoFSs1gSe5yshM5JihJG+/OHKXxRR+tHXGpUJ8wY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(2616005)(45080400002)(26005)(2906002)(956004)(316002)(16576012)(66946007)(4326008)(66556008)(8676002)(66476007)(38100700002)(6486002)(5660300002)(31686004)(86362001)(6916009)(54906003)(83380400001)(186003)(8936002)(53546011)(508600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNLcGltTEw5OW9MMGpsNFRsYzFudm40Q1M5MlB1N2EwNUtjRWkzbnJVSjh2?=
 =?utf-8?B?a0JNbHhqcGNiTzFpZkREQmEzMEJWbVJOdzVBbkNtMkl3eTQzclNzMUxZR1lr?=
 =?utf-8?B?c0ZFYWZLR0ZlNjBUcStnSkNKVjdtbHd2SjUwYk85U3FzelVYWTJ2Qm1KbHRG?=
 =?utf-8?B?WnNtM2szNnMzSmhNRC9XODV6bEM0Szc3Tm5Mamo0VitDR0ZnMm1Gam1qc0Fv?=
 =?utf-8?B?dVJ4NlZ3T3hDREtXaHhpL1RhY1FDb3RJcmFpaEZJaUZxMzlveERrMnFjZ2Iy?=
 =?utf-8?B?RDF3dW1TeGlKTWhETjBZUW9ML2QzaG5XL1BrQlhpMVpGWGtuQU84Rlgrblk1?=
 =?utf-8?B?UC85aHV6QUtFL2RYWTB2cW1TOE9KT0g2aGRneHd1OVZTVCs4V1FYcElHK3Mr?=
 =?utf-8?B?ZHNoaVRSZGkyZ3NIS3F5WFR2L3VLczJNbDJLdG1Zd3JBdFdOdGF2U3FqakJE?=
 =?utf-8?B?SVZzMEEyTllCSHBGelNQeDlGYzVRUzF3cDlpeitJY0pRNTdQcDN5eDAraDB0?=
 =?utf-8?B?ckl4Z0ZBQUdRNVhncXYwOGtock9lMjluNTBib29sMFR0bG4weHVqSE90cFpU?=
 =?utf-8?B?N2tnNWY5dUxoR1ZuWTBFbVVtRHpVU2ZJam5XYzU4RXZsckdDZDVhWkloQWNB?=
 =?utf-8?B?dlZRakltaitQbFdISCtBRHVmbGtSOTRmc2NWVzlJeVVEbXEyckFEVnBiR1Ri?=
 =?utf-8?B?UDVIZy9iVTNXYzc1VU55WTNnN0NQZVhsRG91RU9PTzhpU0hsa1pYYW5OSTQ5?=
 =?utf-8?B?Q2o0ZVdMWk9rZnBzVFVWcUFDTE52WkdhbnFmeE5NQ2EzZDFoS2ZUWHlkSDNW?=
 =?utf-8?B?bFl5YnNkYlZZU0lvYk8rSHgwelhIa3dRdEovNHYwaExzQTdMbDFFQWd6eU9i?=
 =?utf-8?B?ZlMyRDZoSmhyWDNGKzUwWm8rcmNxaUFnSFZjWmp3UkRvQ1lOVS9mNmk0aEQ1?=
 =?utf-8?B?Y04xaDdjZEgxTldXaWRXMUVVUkdWS1pCVzRvcHRvZGc1NUltdDcyTFdBOWF0?=
 =?utf-8?B?QytmT1JQdkFGL3A0T1FlSmVzYUVWM3lFbzYyVm45RC9YRVFoTEQ2RWZvaGZx?=
 =?utf-8?B?dVZpN2krSUNUakwrQUN4em5MTjJHajM2akpKMTkwcTR1RjV2QTFmaG00aFRQ?=
 =?utf-8?B?S3doclc4bHJKUm9JWFVTeE1TTVA3bklVblVFdVRMMHNxT1M2TEltTmw0Y1Fh?=
 =?utf-8?B?ZzNON1JpTjJHeHYzOGpBeUdjZnBOQWtlaHZjK1JZWEptWlFvZEJEdlRYVEgx?=
 =?utf-8?B?VS9ZaTNCL0lmNDJIT1VZNGdmSTMrSHUybE5HWmkxd0J1ai82YmhNeDRJd3BM?=
 =?utf-8?B?VHZPaXB5c1B2WDRlZ0lLWkMzSWVjbDMwOTJvUkF2S1FIS3FOOTQ0UTV5Y21v?=
 =?utf-8?B?WnJ6cEVLRXYybmlpdThXL0RyekhOTEhmTXdVclgzejgxTWM3REZTNGZXVytG?=
 =?utf-8?B?dXpOOWozOVN2SEF2bDl1U0pNZmlhbjZSTGI4bU11YWUwcTEvckVLZytCeURw?=
 =?utf-8?B?c09EV2JOcFRqVEZabVVxT0RWdVpHZWdOL0ZEaWhCRE5iMko2ekZhNFlJbHpK?=
 =?utf-8?B?RWhxMkhqTXlKOHAvN0lVOU5JcXcybEg3cUliaGlBWkp1eFc0MlZ4ZlJSbjB0?=
 =?utf-8?B?bGo1aENBRXJMem1nU2p6MWJCWUYwYVdUWE1ZWnpHUktDU2RyVktaM3hubDJw?=
 =?utf-8?B?NHhHUDlFWXEwTWJkbCs4RFpxNDMyR2x4anY1NUloVzN3Y041TU5Pa2Z6MjY4?=
 =?utf-8?B?dVY2Y2NMTGxLRi94SUZoNm1UTVN1ZTduVk1ZenNFa3pTS0RiWlVpck0yYll1?=
 =?utf-8?B?c0NuWEVPSXBWUlBLNVhtdytFZVRkNXg3S0lINHdraU54dTQrakVJZ2xZOElB?=
 =?utf-8?B?NmRkbkhFTHg5djlxdE5pbDVqWHBSRGl6SEJ2L2RrUFhRNmdGVnJFYnU3SVpw?=
 =?utf-8?B?UGg3RHljMmlDNG5BZStVUUp4aDNiNEEzT3g1VmZJQ3BoQnlzRy94WGtXSlpY?=
 =?utf-8?B?RGZHV3BNUjFpOEZ2YmJTYkZiZExNOTZveHlVMVNmaHgxLzNsU1ZjRmZwS2Nq?=
 =?utf-8?B?WjVMcitMdysyd0xhMSs1OEpramp6QUZpWWdKMEhXTWxQUWVOOGNvYVNiSmQx?=
 =?utf-8?B?MzBpNkxVaklWakJneVlCb044WjZmQlJuSVNtL2g4VnBRbzlIbWo1Z1V2Z0RK?=
 =?utf-8?Q?osQ4d05JOqrJ2ARNZtF0oA8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e681c21a-c8f1-439f-8a64-08d9b8938cb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:36:51.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzdxF5H1nUbUP7CFioKCTERZK66+UdDU5Dn4hunZZuWNEHXb6vxDUkH3FSgvOFSb6w3CVkgRDhSI8X9h0W7fkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 26.11.2021 13:33, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c

Elsewhere in this file we have

        rc = map ?   map_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn))
                 : unmap_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn));

which has been in this shape only as of commit e3b418ac4919
("x86/pvh-dom0: Remove unnecessary function pointer call from
modify_identity_mmio()"). Aren't we relying on the compiler not
transforming this back into the earlier

        rc = (map ? map_mmio_regions : unmap_mmio_regions)
             (d, _gfn(pfn), nr_pages, _mfn(pfn));

? And aren't we further relying on the compiler not transforming direct
calls into indirect ones for other reasons (I recall Microsoft's compiler
being pretty aggressive about this when the same function was called
more than once in close succession, it at least certain past versions)?
Is the widened effect of the annotation intended to also guarantee that
indirect calls will not be produced by the compiler for any reason when
the annotation is absent on a targeted function's declaration?

I've made an attempt at auditing our code for further similar constructs,
and I couldn't spot any. But the pattern isn't easy to grep for without
producing a very large result set, so there's still the chance that I may
have overlooked something.

Jan


