Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7F46BA2B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240985.417800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYmi-0006lW-K5; Tue, 07 Dec 2021 11:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240985.417800; Tue, 07 Dec 2021 11:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYmi-0006ic-G9; Tue, 07 Dec 2021 11:37:24 +0000
Received: by outflank-mailman (input) for mailman id 240985;
 Tue, 07 Dec 2021 11:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muYmh-0006iM-EL
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:37:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab7f1f6-5752-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 12:37:22 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-C9fm7nQeOI-h0Avfzz3IjQ-1; Tue, 07 Dec 2021 12:37:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 11:37:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 11:37:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 11:37:19 +0000
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
X-Inumbo-ID: 0ab7f1f6-5752-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638877041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZpKi1AAiUKueAsqNoBd+0b0NR6mJhQN10Qky2HmwjY=;
	b=Wq6BhVb5kTldqe18S0ryB8dfSuMEybO7lLhLLFDAjbFYbWb/RgDiWjoq4uvuHBZ+LSmXdL
	nPe48V58iC9tIqWQ3BPeVzX0vhwXhyQkWGR41ilSNmFQmX6yQPT11e2yX3n9vTKBf4lnOO
	xSyseJJzXiPhIe8k8vzJZB9NlzDpH+w=
X-MC-Unique: C9fm7nQeOI-h0Avfzz3IjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQz8AkoUrZ4GQcXGxEoah6frmcZ38gNLVFuWe1KGCwf5oh4AWfUbOdg9Pv0DIYwDD+tja/n5NBuiGyMZ+6FN1P0IMJ1rqAJmyvC49fwZByOEK270f6SbnF2wt6b9kWBS7+yfsGKsRZ1YzQ06QytCs7Rp6Xkao4Fx+Jex87uV5/u0Ur1SUpLVCIU55lG/5G1kFHVbKuiTxzsuX7lMN6PHUhtyVHrbLuZoAfZ3PJp3KNgBdL1RD2swXDxs0ZzaLGJ1TeP3BEEgjZkvSufbQLQEp+TpLTa4TeTHeeCttEpirOBFp0kSkO5PWTZRM5DYpZpacVTcWuQnH0IJ9IXgydN9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZpKi1AAiUKueAsqNoBd+0b0NR6mJhQN10Qky2HmwjY=;
 b=EvS3+FAKTr5U3E6nha2CRFsBbIxvgAJvZ9wtx8t3e//zbBYt3K7kIPjn3cV8Eq3hNamLdHVpt/OCSuRzknYUjxmCxwR99pnq3/0s7F4wG8zFZCqJc5m8bEZnCszRg42W+i3arvUu6NOztb7ORLjnoQABmwiRZwkjRlOdJZwIE5y0NFzNU6KZIc9QhXc01R7jGmvKAtz3uwQ7bk4gAkSmmyJqChlVI4b8+VIfTlg2OhKVbkC9EGNO3uqLO9jVOq3U05TGDOQ/Dqp/Y5IyITsmbDSClJW+Hx70bgOyG9Tw4OK81Z7AXN3CnTRbYXahWP6+KQ6/noug+G2fhpJAlVLqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc3f5bf2-53f9-7dcd-2be7-f9f953b382cb@suse.com>
Date: Tue, 7 Dec 2021 12:37:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical
 relocation logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211207105339.28440-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8b34e7-97b0-430b-ea10-08d9b975ed9b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702FC96238D77FA040E6A87B36E9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sj4wx5ZHzwhmmsvJ7Doke5wwxsTJhN8H8dVOW1SKD0oOUgGOubzrMoLK+r7q1ZwugQy63TtJr10G2hUoAHPD9pSaqXcU6mwGZFB5mpuQfq/JfMIieRY/B3cjCCCjCykAbgX4+ZY5YFy57Jv+u56VH4k+y7Qwv7CnI5ecl1MWdZuxk8ooxoKUFje9b1xdp06SC5o0P12kKuVvsy6HD5rj31R7nEowUw3+53KZnU+YGg/Z06wodl06lUYOn3fltkVpF6J8k9XOjdqozNIBRVE9+Pol9839hmLoWp+8YIXHT3ZAak/xnIbQnuG5703s+dhNtCP4xiWW98lwZO5BkBowvdSFeRirhj5HBd3GclAtRMfeWDLOLDZETCG8s4fzhqJmAfGzOHrM+4ajSf7BVDSMPhRihzff1rYEo63is8i1+bP0RZJxL5iJR3s1SRoPGM9cgZf+z9InlgUEL58HZEvUN6f42NGVf6ptu7/xP15AJworqD+oQRy3t/QwPId19ddAVXLBBExgRvjyK0Ceth3D755nDkKWtbZZlZTrr0dRx+fRrHYhc/vhZmbtPcr4dtrqWVv91Rs6IJ+x4TOU6oWDPE6E2j2tnljg3b0IHnGYwy/ra/SAj/GZOz7KcUCvCChHnML6c/mjD01CkQcTn0865jPw79Gt1SwOpx38EcIH6YnNsHVCQv3kjffL+iRIpeKya6h/2qp1HFoBugyN2JZSk5uohOQR3FIjAqyulInUGsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(8936002)(66556008)(316002)(8676002)(6486002)(6916009)(31696002)(508600001)(54906003)(38100700002)(5660300002)(956004)(31686004)(2906002)(2616005)(53546011)(4326008)(66476007)(66946007)(36756003)(86362001)(186003)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGFmVzZIMHBNTnZTWFZJUWsxZXdFWGw2cnlHUzUrYS9XcmRqT2RvNHFDUHNv?=
 =?utf-8?B?T2EwSUVPVUN5NFNwcjBxRTFPalhONG9vZFUzTlpMbE9zU0RwYlk0c1NobHNw?=
 =?utf-8?B?c2d4V0UzVmp5QU9NeTJRQVBKT0srK0diZFFDcjJHWnYya2hZNDhaZU1aM3Jj?=
 =?utf-8?B?QlRWenlvdUZSZ1J5RUJTMzdGN3ZKVXZRZUNFRzZNa2I3NHJNTVY1dDlpZ25Y?=
 =?utf-8?B?SnFzanpBR3hQbklBUHo5SE5CU2RDOVZ4SStQd3Nad2xXN1pSTFZHbWlJTmFC?=
 =?utf-8?B?THE5cHZUM3lPVCtuU3lRUExoS240eUJsZEN5RWt0K1Q4dHlyVURMejBML0lw?=
 =?utf-8?B?U1V0YS9uSkxQSzBOVzVYSU4zLzk3c2RrT25mRkVDV2M1TmFjd1VGWkFVRC9h?=
 =?utf-8?B?TXAxMXBVYXRxSSs1R0k4ZThkNVJGTzNVWE5wb3hwOStpc2RLV2pqQjdqRDd1?=
 =?utf-8?B?R3pIdjBuKzliTG9tUms2YnhZcU9wVklKd0JOb2lGbkdBRnJ6ZHNwRkVwYVlG?=
 =?utf-8?B?NVVVT3A4MWRVb0V1TGJWdmIrcFlDU0FkaGcyQ1gzVCtMSmxiWXdzOEwzb0ho?=
 =?utf-8?B?aDF4NnJiaEcyZFkySUIrNTRxTkdQZU5Cd0lHT2haSzhSajVHTDFBeUZnVXgy?=
 =?utf-8?B?a1M3UFMrWm5SdnhmZzZvRExYam1RRnRaSk5CSjhzQ1V3RDUvWnRuaFRSQmlt?=
 =?utf-8?B?Y21hMkE2Q2JyUWROT0tVbyt3Y1FkQmFtYUdvVFM5WldQTEhiVm5nMW9kbS9Q?=
 =?utf-8?B?eUNIZ3VXN2VCZnhJZHYreG5ZKzg5Q0NKVEdVRTdCd3pWUU10cnhocGhiN25D?=
 =?utf-8?B?dnp1UEhBbDhZNllHcE8vTXNmbWh0b0EvbnlGYU0rMHBaMTB4aGhhNU0raGpR?=
 =?utf-8?B?L2EvUlRyUGc0VVdhT0RrUUlKR0VGeGM2Q2NZWk9sZkloSHZTTEVOc3BrUW9X?=
 =?utf-8?B?S3Jpby92K1F6UzN2WWdyRzV1c1BJRWhybmlZOEFaWS9IeERwS21NbjlNaHJm?=
 =?utf-8?B?QXg2bWl0U1FBdHdqd1dRT2FpcUJtZGp4NUhnbGdSQys2TjRuU2tPWUljYkZ2?=
 =?utf-8?B?QmdnYitOZyt4YkM3OU5uRVpaWkFMWnB6c25YcjNzZ3AyY094VlpiWDV1a29R?=
 =?utf-8?B?amtXQWdVMFhiM1hySFZCcDgxRVhXWllyVlR2K0gvblp1MFJITlRCVVRlVVp0?=
 =?utf-8?B?MTQzc2J5VUlvSk1qQWQrYityV3NDRzBtQ0JXVElaUm5odjNLbVBJZUVIQ05q?=
 =?utf-8?B?dzlhVE9wa3NiQ2dNSzFsSmZLcCttWDduNVY3d0p3SlozNFdFOUpySjdWOWF2?=
 =?utf-8?B?S2lQbHdmK3ZXcFdwU0lFdkxTMzNGaU5GcmhYQzdxa1FINWZuWm9BWks0enVt?=
 =?utf-8?B?aXcxYUIzTlFTcWx3R0F5RG5STkZGMDlYZEFPR2xCVHQ3clpBTnpxNHBSeGJm?=
 =?utf-8?B?Qm5QeTJHRlNTQmFqMTMrRVpTdS9vbGgxaTdtcWNIZkJnMUhjekF2SVlpaU8z?=
 =?utf-8?B?aHlvTmN3UURPaFY1MEZmWFpJUFhTemdocnlEWk9OT1I3M1VRWmtIMVE5QjlG?=
 =?utf-8?B?VzFjUFNuQzhVRGxjTWdETElBUlBsUzBZMEh4eUFYbGdtQ2dPbUNuUHVtaWpw?=
 =?utf-8?B?R1VIV2didkFNWlBaWGlWUjYveGlXc2pEVHZpMTF1WitLTHV6bUdaNnE3UjBB?=
 =?utf-8?B?T2pQaC9rZXhWTzhzZjh2SmdhYU5kYmpKL1QxVEZvS1BBdngzWFNIUXlSYWZL?=
 =?utf-8?B?TTk2OHpTbThMbHFLLytOVkUvOGpUcjlBVCtLWWVjSG50WXRuVlZFaytqcWRs?=
 =?utf-8?B?d1N1bmV5dFBnR0FsYXczTnl3cXp1aXUwVWgrVjFSaTVCOHJENENNQS9adFM3?=
 =?utf-8?B?WGFtT3pXUkZ2c1NqU0U5bGZESDNQYTBtQTN2VU1lV1NoMXVZeFMzS1ZwcURz?=
 =?utf-8?B?b2h1eEszSFlWMXFSaDFtVTg0Nm5KMzZnQUlrcjJoODJJMEdYZmhrNjFwZ3A3?=
 =?utf-8?B?UVB6U2JTNWp0N00rUVQ5aWdOWStMZXdTK3NYcTRzTEo4RnZKTEJURzZ5TXM1?=
 =?utf-8?B?TmpZMzM2c0pGRkxla2ZpQkI1VXI5Ky9UbWpzWFZKeExOUEVkc3dYay9LcmN3?=
 =?utf-8?B?cEcybngvYk44eTJMMmIyODVRR3ZWaWwyZUQweVdrTmNlK2UwN2NibkI2UEhL?=
 =?utf-8?Q?txhd/Gw+gUIhctysCqowQyE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8b34e7-97b0-430b-ea10-08d9b975ed9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 11:37:19.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et2J5u4SqqD+iGVyPo+IHQMObt7PT//ZwYlIWwLjiHL0JCx3qOzP4MWXSu7Y5wJcytnWIroKGeTNWqUStzhTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 07.12.2021 11:53, Andrew Cooper wrote:
> This check has existed in one form or another since c/s 369bafdb1c1 "xen: Big
> changes to x86 start-of-day" in 2007.  Even then, AFAICT, it wasn't necessary
> because there was a clean split between the statically created entries (L3 and
> higher) and the dynamically created ones (L2 and lower).
> 
> Without dissecting the myriad changes over the past 14 years, I'm pretty
> certain Xen only booted by accident when l2_xenmap[0] was handled specially
> and skipped the pte_update_limit check which would have left it corrupt.
> 
> Nevertheless, as of right now, all non-leaf PTEs (the first loop), and all 2M
> xenmap leaf mappings (the second loop) need relocating.  They are no unused
> mappings in the range, no mappings which will be encountered multiple times,
> and it is unlikely that such mappings would be introduced.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, as to the description and ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1230,7 +1230,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>              l3_pgentry_t *pl3e;
>              l2_pgentry_t *pl2e;
>              int i, j, k;
> -            unsigned long pte_update_limit;
>  
>              /* Select relocation address. */
>              xen_phys_start = end - reloc_size;
> @@ -1238,14 +1237,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>              bootsym(trampoline_xen_phys_start) = xen_phys_start;
>  
>              /*
> -             * No PTEs pointing above this address are candidates for relocation.
> -             * Due to possibility of partial overlap of the end of source image
> -             * and the beginning of region for destination image some PTEs may
> -             * point to addresses in range [e, e + XEN_IMG_OFFSET).
> -             */
> -            pte_update_limit = PFN_DOWN(e);

... considering the comment here: Isn't it 0d31d1680868 ("x86/setup: do
not relocate Xen over current Xen image placement") where need for this
disappeared? Afaict the non-overlap of source and destination is the
crucial factor here, yet your description doesn't mention this aspect at
all. I'd therefore like to ask for an adjustment there.

Jan


