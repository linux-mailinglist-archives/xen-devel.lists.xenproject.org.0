Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO9gNNPecWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:24:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432176305E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:24:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210476.1522131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipys-0001iC-M9; Thu, 22 Jan 2026 08:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210476.1522131; Thu, 22 Jan 2026 08:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipys-0001f5-If; Thu, 22 Jan 2026 08:23:54 +0000
Received: by outflank-mailman (input) for mailman id 1210476;
 Thu, 22 Jan 2026 08:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vipyr-0001ez-8D
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 08:23:53 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adeca11c-f76b-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 09:23:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 08:23:47 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 08:23:46 +0000
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
X-Inumbo-ID: adeca11c-f76b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzX47nrBqRlxBqmqq9r67p5WRr+8GiTBMjndYSgqehzcHrHgtOVCDHjChHSOuR6MRHrMxHT+rBk5v2jPvO7Rq/NgJLmWwCy/ZaKpbW2UUHnvLxPfEisR9j/SjFLq0mqNoSypTm7YFsClyXPbsAS8ac+5JUtRCStLz9xKd/cZHsCEs33Drlj9nT61cLqM/Vyqse55YH037pTH+/O0h1MzvEH27goeI5Yovoc7vl3B+uB6XXCmUN4v+9df4HF0D8TnjikbNt93XDJj1nQXf5LGs2gOa3/YDuiXAfIT8PDEuuoyJCPR2LfYNi3rMvdJndUKXJh9HvbjPZ/T7q7oKKQEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWx11zkhJal/3cG430UB5J5NPVmKeBxVAY+JCjZJie8=;
 b=yKn6A5lYb89WYaOiie9gqumaLsmJt1AYEPuvusqFuQl72udQzcuEz5EhZp1uOK8m7rEOmipDV27khGShjGCWKI1Nxv7GjYNE/Rv0/X3MjPxUCgJSK0eiY9adD0nClz/AmfYlYd0O2++ub8HR9nvasajj0sJ4ko1xXzum56p+ucq+cKwnMYhWZU5DSlcxe3hPK0Fw4uFyMY0qb/TqZ4OqW4ThuUjLdQNSfwI8WFW5Pp0Igl/sGQu4t0yhNaGKR8XYhqLJD5uCjsu7jWySqb1BjRiq00veAqWt9ZY1fDpN9IGrltIHslwK4rgJxhs1OS8NrXKWUYHOwLIaJyYI12l1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWx11zkhJal/3cG430UB5J5NPVmKeBxVAY+JCjZJie8=;
 b=Ytc+BReW8KGJxas4GBPDW0VsEkcj2VF26zEkCjF83lZKKpIVe9qtMTg2SuMO/YK8FmfGsSsGbFu736iVlKWFYSpDnSIE7pt4NeYCF35jgw3llmvouNcxdT7eUG1xJk07vfWj5OiPv82R7bel7g3XN+QW1+hb9wFTaPxSs96hcrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 09:23:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXHej39h5cAs5-UL@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
 <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
 <aXERjdPS3KlcD3C-@Mac.lan>
 <634471a1-1185-4644-aeea-7891e62bc1f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <634471a1-1185-4644-aeea-7891e62bc1f0@suse.com>
X-ClientProxiedBy: MA2P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d73caf-3410-4bf6-182d-08de598f900d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHRiamgvSUNwYURRVXR5UjMwVEx1NlJaQ1RyTW5EWEw2NHJSZmFKK2p0cjA3?=
 =?utf-8?B?a0VPdzN5d0lFVTdQRVp4MXNlNGRUeDNXQUswcURIQWRkTWR6bldXOU5JZE5o?=
 =?utf-8?B?aWhqb3JoNFVjMWthYlJxSTZwQlF2L3haNldxeURPQm13SXVXZjdLVmI5QzRC?=
 =?utf-8?B?dXNiQlVwV0dwZm5OU1FrOGYxT3c1MlVDVXdLcjFwY21qdlFSaWFkNyt4dVg2?=
 =?utf-8?B?VUZ5M3hGdWtzZHNPVnVoemRockxCMVpmTXVTNnl4NHlEVUY0L2hlK1g1QUxL?=
 =?utf-8?B?SUFhNGRqZUt5SUVKV283Z2VvZWFJSFJNQWtvYm00Y2V1a2Q2cWtGcjd3S2c1?=
 =?utf-8?B?SFF4UGVBU1h1YzNldml0SlFXYmg3M1J5TlhGQWtBUzZic1duMUJ2VW9ERm9Z?=
 =?utf-8?B?OG42cEJrMWw1S1l2ZVBDTXZaUTE0eGhYU0h3OHNXVzhlaUY5RVRUL1l6dHVm?=
 =?utf-8?B?VjMzb3VuRWkzVDZodmsrUndtWDdTc3psMm9hQjhSMG1yQW15Y0dXOHZ3dXVC?=
 =?utf-8?B?VjNIYlNqY3o5SUdJTDVTUTYxVjU4UG5TQUd5T2dZSXZmQmNRNkpiVGxsK0lS?=
 =?utf-8?B?ZTNmSk9aaWVLU29zK1RPQkQ1emo5MnBiRlBBZGJrVC9VK3lDNG5VajBNeVdV?=
 =?utf-8?B?Zm50bHo0RHRkRzRpS3pyR0xNeXYvNmNzSkhpVzVQR090UkxObkh1MTZhQkFY?=
 =?utf-8?B?Y3BDSFlUbDZIR1VKUWJXVFBPYS9lZGViTVczQWprM1pTWmF1M3hDMTRlMnVC?=
 =?utf-8?B?N2tIbVYxVERkamNVNzlOOGZ5YzhyS3hjYUJhVTJ3VktVdEZxYUJkM28xT2pp?=
 =?utf-8?B?Vzh5eTVGQWRlRDIvSFk2V3l4ODFVVmVFV3h5MFBKeTZ5cyt3ZmFJenJXZi9K?=
 =?utf-8?B?L2p4Njg5ZzBENmtma0oreDZkVTZUcjVZVWtSUUM0d3lodE5pYXo4VXpDRE9G?=
 =?utf-8?B?MHh3UTdxbUhtQytFQS8rOUwrUmhhSFZVZEtTR3VNTS9NalRDc0RpRHRYSnRl?=
 =?utf-8?B?RWZEVGFBa1FOOVpSK1hFK044T0RIdXBOSGxqcGh2SnJPaUtyZ1lmRWJmUFd6?=
 =?utf-8?B?UkdJWFFBWTRtSkFZZDRMU1dSdzZBdWphN2N1QVJsN29scnJ6dmFBdG1Kc2lq?=
 =?utf-8?B?NWl0Z0M2OWFsZHRCNVNaR3pNZjc1eXdZM1U5NXp5WG5xamwwNSt3VXI0Syti?=
 =?utf-8?B?Z1p4WktxRHR1YVlGdGFaQ1lsYTQrZnNmdk9aZXY1SVJPTUVJdFBhUVVqbHVP?=
 =?utf-8?B?ZVd1OFNvTUpmVGJjcnB1dDlTZWovYmJsbHRWRTh1dXBCTVVLeWxMSS9VZDA1?=
 =?utf-8?B?SlZBZTY5eFVtbDlHb3lRSlUveEd0bFVPUnFMSm05a05mTDBoUzg2MXJIVXUz?=
 =?utf-8?B?Sml4L09zZ3dNUWhUWmpCcTFiOUxtWDdwS2pHZUMrZ2RndHFrQ1ZLYVZsMWhM?=
 =?utf-8?B?eksxZWdCaHRNT3BwY0xwaGFzKy92a3dRVGtmRjdtVHNJMkhsdWVSR0kydndm?=
 =?utf-8?B?Um5NaUFtNXE5ZUFTVnYzcEpnby8yYVl1Y0p1NDc0ODBkT0paSmhaODl6SzhG?=
 =?utf-8?B?d3FCZlVDTWVkdDQ3UzRNTi9UbjBHb3diTmlkR2cwTWJSVkVQUU9Da3VwZlRr?=
 =?utf-8?B?L1E0TWUvbjYyblYrMll4amxtNC9Ed0hMMjJFdEFwd0d4SEZSUHVneUEyZUJl?=
 =?utf-8?B?K1M4VC85L3pJTjl4N3lDOTZNbHk2bTBpUmUrbHh0d2dhOVIzS21aMndFLzQy?=
 =?utf-8?B?MnExcFhzTlROOGh5TkxPcDkzNDlLRDlRSWxQQWpsZ3A3U0I1bE1DYlBzRWJi?=
 =?utf-8?B?czE0L21mdW1WSE5NV0VJUnpIdTJDTDM2akFTRFlmWkg1Z2JzSzlxQWdWWU5J?=
 =?utf-8?B?Z1QxU0l6RFlMeTFpcHhkSllyNUU5b1daMFc3UCthVThUaEZ5U0RjUnFoVlV2?=
 =?utf-8?B?bW1tdURPaEYwNTg4UU9rVjJtYSs4UTk4RTl4QUxycFlmNmtjdGxhMTFSSGVM?=
 =?utf-8?B?NjV6ME5IN045ajV1Z2tPRnNjQm01ZjlMN05tbUwrZVZIdkh3LzN6SzNRblht?=
 =?utf-8?B?MEthRlpVZG5VSmhCc0NudklPRFFMeWVmNFpTRTUzQ1dydWRiRW5nY3Y4OTMy?=
 =?utf-8?Q?BF5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW9kdWpjcXBJZk5kMks5UUZIYkRrOWw3QXdxMzBVcVdvNnJ2VjB6MHlyZWRO?=
 =?utf-8?B?MGp1NkVPOHJDcXRWL3Fnbkl1UVBsWis2MW50dFlQUFBvWGJjMk5JR04yTkhZ?=
 =?utf-8?B?dlJKTkR2UHVDMXA1SWY5NVlQdWdYZ25POVY2UExOcXdDOU1hdmV2RlFjVWg1?=
 =?utf-8?B?TWZZeG5ZQVRVZ2ZQOVNsd2NEK2M1NENlUVh3R3A3clFVVDVXTWFSUHFGRXpK?=
 =?utf-8?B?b2E3eWNLQ2lTMlVzeEpTVmd2TCtwSFRtcTM4Z2wweksrM0pEa21LRzBFQ0s5?=
 =?utf-8?B?d3dQQjJPM2xzaFhZV0pRSHF5QlZCVXhHeEtISmVkZVJraTVvYy9aWmQzalhU?=
 =?utf-8?B?L0ErVERYYmVwQnYwR0FvQm1CekJQRTAzcUVZdWxrbHBzUDUrUEM5a1Fwa2wx?=
 =?utf-8?B?b1BYVW5uR2JBRVNzcHVXNzJzZEZlMnJYbU54RU41V2g1dFo0WVNZZjc0MEFY?=
 =?utf-8?B?QjF1N3A5K0dBWUkyVnQ5ZWRVWEtSb2YrVThaaWhjcUZVQ3RkNHdySFU0L1dw?=
 =?utf-8?B?Zm9xMHg0azJvWjJrMVFETmVYTmtranpSVEJ6QjVEbE5tNXp2bkg0ZWRiMWVS?=
 =?utf-8?B?UXBxZXB5aXZOWlVCaktmL1Vsa25UdkJCUmRhckJjbGRMa1V0RUV1M3R5bXc0?=
 =?utf-8?B?UDl0cUMxbzFVMlFJRmwwbnV6Z09RSHNaQVhyNVJTWjduc25NZUhCTk9lVUcw?=
 =?utf-8?B?Rk93Y1MyR0taOGw0b2xLdDQ0amRxd0FGZklzSitXSC9sWkFGTDRuR1BoR3po?=
 =?utf-8?B?ME1LOExFNTVoZkF5M1pCOEJQazBscVk3VFgrV3E2YUhUN1M3VmRMU2ZCQmlU?=
 =?utf-8?B?SjFZVHdXeUZ5Zmh5QVhYZHlWQS9GM1IvRjlZZEovVW5qaDBONUh3UlBzMkhi?=
 =?utf-8?B?MGdRV3ZTbGxyQ1ZjbmRoUUVHM2hUN1BXMGgyeEczSVdyWWNncEFOeHZjSGRS?=
 =?utf-8?B?QmEwTkN1OHRPYVltVHA2bXdTaWdyRm9KYm80ZnRMeGZiTUtHQit6MUVoeDVV?=
 =?utf-8?B?U2x3Nk5rNEdjNWhFdkUrWHpsSnVOTEJPKzR6bndrekpxOUNWaHh1YkJtcFdD?=
 =?utf-8?B?QURwdk1KckY3NkVuS0V0UnNjWU8xQW1SbmlzWXMwU1hmYy9iTEhMd3ErK0hQ?=
 =?utf-8?B?QWtxSytiL1k4OW5rWmthMWNUWkxlcXF1RlI3b3ozeWFWUzY2d0p5WDVIcjhG?=
 =?utf-8?B?ekk0QUZyNExmcWxzbDVhU3RFTzNudXZYenV4cGtUR0s0VzYrUGd1d01yN1Z1?=
 =?utf-8?B?ZU8wbm9UM09tK05NZ2tYTGRPU3R5d1Q0ZzF4Qyt4K0JiNmVJckhhRFAwcnpM?=
 =?utf-8?B?RVcwSjFMSTJGOG1yVGorTFhtWHlTSSs4enZoVWJ4LzJBUTRKUkJ4SzUwVW5E?=
 =?utf-8?B?RUpnYllRRkMwVFNKNHlEM0ZQdUtWS2FRR1BxdkpDai9ZNjdTUmM5TjgrZHFm?=
 =?utf-8?B?dThncmhOVGpsdkl3dkVBTVY3bnA4YXdQeEhpclpCUVpHb0tWck9WUktwU2xS?=
 =?utf-8?B?ckRDUFFFRndLcWhNYjJhN0dwZ1NNVTIzUGdmemFSL3ljQUVJNkNSeXhTNDB3?=
 =?utf-8?B?a29GL053aHoySGMwYjI3cnEyVHlYeWY4SU1kN1dlNGV0OXpxc0NUVEtKNWVq?=
 =?utf-8?B?OEEvV2J4bDFqc2YxYUFnempIY1RaakJYT0Q2WDJsNUt4NHRqVW91b3U4NEFt?=
 =?utf-8?B?dGdieDNlTzh5elZzOVJLdHQ4MUtURmJUSGtsVE5IVU85T0xldTJzeG1ZWEEv?=
 =?utf-8?B?SEtkY3M2eXZpRGZtVXg4VW10L1h6cHVQbXZiNWppWVVLYThoZ3lkMTVlZmUx?=
 =?utf-8?B?T1oyZUY5MlFkdFh4RHl3NE1iS2R2VUtjaGd5RUhFWjg1dUFQMTRQVUpreVR2?=
 =?utf-8?B?dThYRHY4MFRWdnpoSkdHeVU3d0psbVRZNUVESUkxTERRVmhRNHJOcGwzWGgw?=
 =?utf-8?B?eWpLVmNza1ZRWE5WZkdGd05UN2NGZ1J3bzN0Y3ErSFlsUlg2MzhVZG1pbGFo?=
 =?utf-8?B?NkZIb09Gb3Y0RHI0bWFMRXo3MHg1RVVlczdTTW4vT01qMkN4amJzRHpRdTNI?=
 =?utf-8?B?WXNkOGE0NHVNUE93S2M1RnNJWnNuQ2E3SzhOanFaQTIvZzlPeVFvRkVqS3h1?=
 =?utf-8?B?ZDhNMEFuNHZMU3BoblBxb0hsMGZvUW1MNWV0aFBCOWZQTFpmeDMvZFZZQTJ3?=
 =?utf-8?B?Z01aVVJYZWtQbmdKKzhpdmdVemlnOTlIMWVxQXROdjJFYnVVbDYxSDJKNjVp?=
 =?utf-8?B?eWJnUWZYQ2ZzQkJjY2trSTh2S0lZdnVEMzNqOVAzV1o2bGFqa211aEFYM1dL?=
 =?utf-8?B?TUh6WWRpWG5mQVdHWGJTY0hCb3RXcTlweFlVWFlaQVlyeGpRalh1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d73caf-3410-4bf6-182d-08de598f900d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:23:46.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTEcWNEgdpiBgoCWRQyBVBVZBpFp6yvjXQTp3zH+w3IaaLqk6MqoV1B7PAosU+xiEQAACiRYNSj+HtKXuqproA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 432176305E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:17:22AM +0100, Jan Beulich wrote:
> On 21.01.2026 18:49, Roger Pau Monné wrote:
> > --- a/drivers/xen/balloon.c
> > +++ b/drivers/xen/balloon.c
> > @@ -724,7 +724,8 @@ static int __init balloon_add_regions(void)
> >  static int __init balloon_init(void)
> >  {
> >  	struct task_struct *task;
> > -	unsigned long current_pages;
> > +	unsigned long current_pages = 0;
> 
> With this, ...
> 
> > @@ -732,8 +733,13 @@ static int __init balloon_init(void)
> >  
> >  	pr_info("Initialising balloon driver\n");
> >  
> > -	current_pages = xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
> > -	                                : get_num_physpages();
> > +	if (xen_initial_domain())
> > +		current_pages = HYPERVISOR_memory_op(XENMEM_current_reservation,
> > +		                                     &domid);
> > +	if (current_pages <= 0)
> 
> ... why <= ? Gives the impression you may mean to cover HYPERVISOR_memory_op()
> returning an error, yet that'll require a signed long variable then.

Oh, indeed, current_pages should be signed long.  This was an untested
mash-up of a slightly different patch, where I didn't realize that
current_pages was unsigned.

Thanks, Roger.

