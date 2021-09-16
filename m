Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDB40D9F0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 14:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188448.337606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqXP-0001Yj-7o; Thu, 16 Sep 2021 12:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188448.337606; Thu, 16 Sep 2021 12:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqXP-0001W9-4q; Thu, 16 Sep 2021 12:30:47 +0000
Received: by outflank-mailman (input) for mailman id 188448;
 Thu, 16 Sep 2021 12:30:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQqXN-0001Vn-Un
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 12:30:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e926aa84-16e9-11ec-b5db-12813bfff9fa;
 Thu, 16 Sep 2021 12:30:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-HRmPBIvxNIiTwsb10WjDrQ-1; Thu, 16 Sep 2021 14:30:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 12:30:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 12:30:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 12:30:40 +0000
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
X-Inumbo-ID: e926aa84-16e9-11ec-b5db-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631795443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlr36CY5+SAAvpoICBA0IsyuMWuU3ehiv1naH4j0+Ak=;
	b=ABVrukG3Chh2aWqca7VYFw3Pm5o0dwHLQs0kr6rXL38nv8wS9wIrWtLQR+VCzPICrQWus+
	BH6ZvOPKvEw7+U1nC71+XEWl2FMZ7DH00egSCCLLaxZLfxUvctPZIF4DUvYqIt4xY44TcS
	kOoKcViHFpqJBT8BrkaMIdeFXnapxaM=
X-MC-Unique: HRmPBIvxNIiTwsb10WjDrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gppEqpwIFCNAJIQALLqX/vmWmQxdVusccMFXayUiO/xQrwlEmQ25IkZXauFb6F95PRYoyjTCNKif169bFG/I2W/ul8E/aIKnd3SS56oJxyE7lTAMcykhJnC9pGFNnUootwOex7L4B0dmw5CZS2sVjesA2Q9/iiFWNo+x39pOiJ8j2ejDHKGAR9pPY3fuFbBN52PZwPsxbQ7DwP4KXs4yEUaNpW9k0cLq2MbLR9QeMoD+QKnCu00+iMyZosCOf0MKhtXSM1ldusA1IKRKTzUMh3Hvp+FL+hVkL/rYto7Jv1QAr94z2bioqzQLwl4w1JqmDoYGket4XuHmzmqMmUOvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zlr36CY5+SAAvpoICBA0IsyuMWuU3ehiv1naH4j0+Ak=;
 b=cKqWtm3L4aTI+KAYNG89wgsO2oKyQdtOLqN3UZDaMcLoKwOF/nYrCM1iMj2bDzS31RUGTF4rsYBJ8mCElij7825Nu76ZH18+jiijWJTbeMmYBDgVwbC/WVt2sH5fTQ4cEsnzqGYQT8IiNUGLTU4wRG4qsxJnY4+kBVLTVxmY0EQCzXKV5K+iKP9W+VsgUS5Q4YzuLc3o/T7bs4vSwVFfX47ST4irKdR4Qtr7Et5CCoQz9yIBMoycB0J5pSuwM7DRsd4XD6Zyx21d4TGj1AVkurjCky0nPvDfWUHxmymBSpynt76WD47vs2tp6WsrEcILNPuLeysV/aUYtzDqxwZJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1] domctl: hold domctl lock while domain is destroyed
To: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22a4b3c7-7faa-607b-244a-0ab99d7ccfa9@suse.com>
Date: Thu, 16 Sep 2021 14:30:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5721166f-a56d-444a-68dc-08d9790dcbd2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152722EFA832F1ABF6AF8B9B3DC9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HNhMmFcySbATRL4sRpfr9nsTN25rMxQ91jsxbbdEMesIUWsr50KRHbA2JTZqO5GGkK43+ohHmVHPS1v26me9039o59l7jS+5dXqIfpa9Kb/1gshN0anWJozl0/YrrTfXfsegX5NN/hvn2Jhsw0iMRRowEEK4NP9EdNDj7GpquTZnSYWz3vTBfu7/TYZBjreOX6vKTG3TDI2N4TcWujPPQSy3GfRuEonwJ5yO478Sr2zcce9Z1esvHhQx+AJYMQc+cZUoBwAdkogxJ49NOAgKa+hdmtCwYo8lWtD41FhSK6btB3e3YJh5QMylmKtcr/2fsd3XAjs2qPoxUi1OSiWwd9q2G+BM7Yaq0yq7iif1Rtvhq4Tpuj/H7gkUWQssowCmW2srOTrhpZpBK3qdAd7vD1SAqM8XqwX+kct0ChVK7Q4yAGTvzGl4aCzt9q/LdSRcsWiAS7PcStk1HgLl2UgSJK/X8584Y6MB0hOMsXDjQi9k4TFJZjBeq8hLxk/YTu9Fx0b/kMarXtVbGbs0W0vCDTmDv1M1by1YOn2UflIioenG+pgXH5raeUdmhCLRrkRSyXdKTY5g9RJG5cOl38+zYnY6wpJRr8Mj88u7oZWtQGj/Qqexwm+eaheACJCXaIzEdrh/mbGtrNnfOf8HapeODY45Y5aq1YbdcdEkvhc5q82NxV6ImoL2ZjoNi5ZZcqOIQK2xkuFv4PwqyIaU1oTcxegJo3ILdOdMp973mUtJslr5jVIE5RwWTLDNUQ6G85waRXm+s5rwCtSfBM9XomzlbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(366004)(39860400002)(346002)(31686004)(6916009)(31696002)(53546011)(38100700002)(6486002)(36756003)(186003)(26005)(2906002)(956004)(478600001)(4326008)(5660300002)(83380400001)(86362001)(2616005)(66946007)(66476007)(54906003)(66556008)(316002)(16576012)(8676002)(8936002)(23180200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRXVFBGTFM5Q0U5WUdRMjFELys5d21qNW5PSzNFU2d2ekU3WmIwYUFxK2Rh?=
 =?utf-8?B?N0hab3IwNllwTEFhM3I5cDMyemVYOWs4MlJmeFRhTmM5YStxcjl0aEprbk9I?=
 =?utf-8?B?bGM5WThWeXNrSDZBUytOMUM1OWdxMHpEM0NvTkFIYVUyRGQ0RzJYRnRWaFFz?=
 =?utf-8?B?TVF4ZjFjMGlSUDd4WEt6Z2ZtSWp6WlIwWWozLzdqWEpXTkNkYzdFOUtNR0dS?=
 =?utf-8?B?VEs2Z0h4Z0wvSWNHUkRyTk0xQVBQOTM3Qm5vYTVYdVJMNjBjNGxHbFc1ZUxQ?=
 =?utf-8?B?L2JUUkJjeGpURXhVbDQxSWd4bjVTU3E4UXIzbWNRdHVZTGQ5MXByOWpjMHVs?=
 =?utf-8?B?LzVzQ1kwME9iNWpXZFlrcTZYZTYvU1JQd1phaURWOEhGNjdFUHpwTUgyZGJu?=
 =?utf-8?B?WU5GR2oycXpvSXVtMmpIcnhYY0czOWNHMHpMN0IwdTVwcVV4K21KeTlxRjU4?=
 =?utf-8?B?MmZ0akczQ1M5VXVHVTVaTXYxSkovNDVIbzczZ1ZlVitWLzY5Z0JVUVdSUTU1?=
 =?utf-8?B?Zjk4QnlwQlpYbWpsbXVXSlhTcldCNDdvNDRkY09Bdy9Kb3hBdGFPeEI5VVBl?=
 =?utf-8?B?eDkyOURhTXJ0Wm42dG54OU94NmFoaWp4VmZyMnVuQlZSMnAwVzBpU2F1eDUx?=
 =?utf-8?B?aHVKbDZBY0lROEZNL2ZYS3RZNVhYaHRaQlNPTFlOTm5oaXRrNkdPeDFVL0tR?=
 =?utf-8?B?cktjc0YreEtQWmwvNkxic0o0UWtxU1FoWHZqYzRFL3UzTkNCSCs3SjRUZ3Za?=
 =?utf-8?B?L2E2MGhYOVVlTHVUVW9HTGsxUjJqM3FwY09TcVpldHh6SFJubWZJL0lOcHA3?=
 =?utf-8?B?TVJFd3kyR1lsNlpIeEFseUlOUVg2azg2L3JHOFgxMjlDU29PNFZoU0I2OThB?=
 =?utf-8?B?YlRjQ0l4ODFQK0czMXJKUlFhYUR5VFVadDl3YjlZU3JUaEt2eXFXbXl5WWgr?=
 =?utf-8?B?UmFtR3UvSWFYWE5TNDhRR0lEQW8yeHg3ZzV4WFlFa1NvSFNZdnFNaHBiVnVt?=
 =?utf-8?B?d3ovYU5mVDlqbDBhblpPR0tWaWxyUDBqSTBIbFp5azQ5ZXJITDNia0RGZ2Vo?=
 =?utf-8?B?aWVaR21NYmhhZHUycUhpVTFyQmp0UzBKTVQweElpVW93OHFYdXNKM2JveXZt?=
 =?utf-8?B?R1BLYXZCdFI4eE1iUmw2ajBNZEZCRHQ2UHZpVnVlR0ZBeERhNGwzeVVTb2g1?=
 =?utf-8?B?MEppTTl2eFN3SHFMUnFhWkRTVHZaUC93UzFwbUYxc1QxWU1Kbkh6c3N6ZHZy?=
 =?utf-8?B?Y0Z0alZpZ0lCcmZ4QXc1TUhDV2VrNmFMSEZvMlJHK3hKVEJxbWE2QTBHREY4?=
 =?utf-8?B?NWZObktCNEQ1NDZSakwvd3E0Q0syUXY2UWxVMENiTTFRZWxIQVFqUG9GNTht?=
 =?utf-8?B?Nmg4UW93ZUphRmNwMHEvOTQvQ1hJMVBZWEhGRkVRMzhjT2lLTTY4M2pKdFgx?=
 =?utf-8?B?RXF6dC9xYVJncFE0Z2VMeExjU1RVYmhmT1NvbVFDOWRaa3VQT1lxRERWUUR6?=
 =?utf-8?B?OW1lM1FhbFFROEwvaGx2ZGc2M25KV2tjeGJOcUc5OTVmdTVhQ0xxdzZpTFAy?=
 =?utf-8?B?VEYwZERvWi9vQkJNdnFZUEViODFocEwrRVIxYmJYU3FiV241MUZkcThheHdR?=
 =?utf-8?B?VlA5MGE1Yk9ZdENnZlZUMFk5WXUxbVltZFEyNFBscHRmYmUvMkswQjU4NWhO?=
 =?utf-8?B?cGFHWUY1dU40cUx2d1VIZldWWVNoVkoyTVVsemR1cE16NXRjdlo3WUt6Qisy?=
 =?utf-8?Q?KVG+a0p9WGCVWvOe/wxZ+vdLJeZwzqa+n2IgvNh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5721166f-a56d-444a-68dc-08d9790dcbd2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:30:41.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fMgSAquxhxRnWEiRXswvWctSrn9j7tYkF3gbC3u9bmWaG9oFB5B+DFMbxubULmdgwIewwdEIxXlI+iWaVXOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 16.09.2021 13:10, Dmitry Isaikin wrote:
> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> 
> This significantly speeds up concurrent destruction of multiple domains on x86.

This effectively is a simplistic revert of 228ab9992ffb ("domctl:
improve locking during domain destruction"). There it was found to
actually improve things; now you're claiming the opposite. It'll
take more justification, clearly identifying that you actually
revert an earlier change, and an explanation why then you don't
revert that change altogether. You will want to specifically also
consider the cleaning up of huge VMs, where use of the (global)
domctl lock may hamper progress of other (parallel) operations on
the system.

> I identify the place taking the most time:
> 
>     do_domctl(case XEN_DOMCTL_destroydomain)
>       -> domain_kill()
>            -> domain_relinquish_resources()
>                 -> relinquish_memory(d, &d->page_list, PGT_l4_page_table)
> 
> My reference setup: Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.40GHz, Xen 4.14.
> 
> I use this command for test:
> 
>     for i in $(seq 1 5) ; do xl destroy test-vm-${i} & done
> 
> Without holding the lock all calls of `relinquish_memory(d, &d->page_list, PGT_l4_page_table)`
> took on my setup (for HVM with 2GB of memory) about 3 seconds for each destroying domain.
> 
> With holding the lock it took only 100 ms.

I'm further afraid I can't make the connection. Do you have an
explanation for why there would be such a massive difference?
What would prevent progress of relinquish_memory() with the
domctl lock not held?

Jan


