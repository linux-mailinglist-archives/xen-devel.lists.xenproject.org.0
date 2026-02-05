Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bd5Dv/AhGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:10:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AAF502D
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222191.1530216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1vy-0002ca-LZ; Thu, 05 Feb 2026 16:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222191.1530216; Thu, 05 Feb 2026 16:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1vy-0002a1-Iu; Thu, 05 Feb 2026 16:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1222191;
 Thu, 05 Feb 2026 16:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IOj=AJ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vo1vw-0002Zr-AA
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:10:20 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e06922-02ad-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 17:10:19 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL4PR03MB8037.namprd03.prod.outlook.com (2603:10b6:208:58e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 16:10:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 16:10:15 +0000
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
X-Inumbo-ID: 29e06922-02ad-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoD7BpQmz6GK24hN28r4IHa/Dn7JwLgP2Q5HgdYUani75Im9FhI+5lhw6pGy70nzmLa3W1o50cwNyhuTu52r8iG9qcS4tyRzPSxkaI3tlr6Kq5YsRMEs3+76okI7eFwu6K+3G7yx+37p3jtZghFmmv0vLhMKfcbA9yiJidz/2usfY4TddfTh14EnbYNePb3QXnwZiK7XPL0IFxJlrOowF5Wy7DZpo+inF/nveNCkCgJeGOj89hXqqowy/i+flW9VerTiwLMQXMt7YgpyGGaX0ZqeSJ6Kc7H5SMs/2MJB2mAGKhSXZFFTA+wBN10mLZYzjQwBGhLWYhW2n4PaV13BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIFNsboLgTT8NUSFp1lc6J0wLhVurW6307dOo7PAn9c=;
 b=kPRaCcRneJYK19tjngSlviB0H4e0v+x+ivsqWXX9ZqV0j3dcmnI3OYD2lDaQwQ00IGC87/o+m6V34zpXUknHZWICwJm7P0Kk4s+p9jmNCLSrU78nJbr/IZi28ACplCYf6LOe28ngR+YypwIXmiP8yjFxVR/OjnorBLbpvvwBCCX5NEAfIca6CrEaepFASCZKaXDqEp1W+pCzyviSc+LzV1PfO2KEaDsd/I3XItMdrsUxCgT1cM1lISgn6ulakG9YstOOcbK7N15kpSRWXcn6V97MoBZLTg5xsd2tb4i5k805RrvnTHG8FKlo8q/yVGfNGFrLq4RSeLiOnPzQGdUI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIFNsboLgTT8NUSFp1lc6J0wLhVurW6307dOo7PAn9c=;
 b=sGeipC8HlyEegnvCU5kxV8pD8KGcSDvxagzLKjHOKhsWpdv14xF8rLDnQm45IYYraNQHCATzxdzyBt5bhrNrnOwZsSQWwO0+DWnK16c1fBjmGg2wOqbPg41mRL/TsbVGanfEojH6/qWWsoHMKTQv93W6LwHNSDczMzKobSuQdL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf78fdff-3c83-4c94-b08f-fd60bdfdda5d@citrix.com>
Date: Thu, 5 Feb 2026 16:10:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] Xenctrl.domain_setmaxmem: fix 32-bit truncation bug
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <7f0c73c140b53cf0777437b46d0a0fda496b48b8.1770299489.git.edwin.torok@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7f0c73c140b53cf0777437b46d0a0fda496b48b8.1770299489.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL4PR03MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb6a01f-541d-49dc-da00-08de64d10c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um9CU0NxWjlLQ1FYODBlbE51SGJ2UFBjbGpxOVhXMWpVemFSWW1IRDFGUmhG?=
 =?utf-8?B?ZFVTbThSTyt4RDFUUFE5dytObG1UTWc0T0h6NG1ZL2h3MVFnSldwT2ZZek8r?=
 =?utf-8?B?Zys2Q2VBSEltNEUra0p5SW1ZeFlhY1BMTWNWeTljWnpVS29IMkpvVXFQZ0Zx?=
 =?utf-8?B?M1ZHWERNUDNsaGtPaXdwdWhhTnVzSEpONTg0bS90dS9WNnIwUUNac2pXU3JP?=
 =?utf-8?B?aHFOWWt2emgybG1QeDVXb3o2NFpJZDVHU3lwS3ZvQnRrbG8xWUFnSXg3NHlF?=
 =?utf-8?B?UjExN3NMOWcxaHZ0dTl5ajRCaFdNYXc5bHFuY2VEbFFSYW04OFpMS1p4Yklo?=
 =?utf-8?B?M3lObVduY1ZzWW9iV2NOd0YwVld4c28yMU5wdWdKc0JkSzhodEtYaVE1SWU0?=
 =?utf-8?B?TFk0QllzYjJUMFYrVnFmMHJtWlVWWHhya3BTRnVGWmJPR3B4dWhONEtXSmlj?=
 =?utf-8?B?cVMzZDJTUnljT3d5SHprTmNWWGJHTnkwd0t6L3pId3cxRXhSMUlld2pmZWhW?=
 =?utf-8?B?bWhVOW5sbzRQOFNyNHUrZFRyUXBmQlRVTXQwMGphZjFGUmd2d0szb2lYY050?=
 =?utf-8?B?d0tzMmdLczBEZ0NnSWQ1WGhneDE1QWkzVjhWREFrdjIxTHdKZXJPVkluL2Vl?=
 =?utf-8?B?K2hnZVMzc3VlMEdZSDBGUmtXdFhPZDdBcjRSQmRQMURrKytSaUxoK1Y2MkMv?=
 =?utf-8?B?ODRmSVplNXlKeW9GNGx6RGtKNVNaT1JyTDNlSUh5bWlNNStsMUphckdyZzNx?=
 =?utf-8?B?eFJFM2VDNVlzVGZGTkpZNlI1c2p6RkNKVkhhT2RNaWdvVFIzU1M0eVBKUGMr?=
 =?utf-8?B?bStMdGluZ2pjUytIaFQ5SncrcUdMNWJZT0NZL3VFZVEyYjF0SlNvQTFocFJB?=
 =?utf-8?B?Mk9XVG1WR1ZLa242Z3N6UjRIdk9VWUk3R04zZVBmekFEUjVnY0xzQzY3L3Jv?=
 =?utf-8?B?Tk1yWjRUV3pBelRDZ29ESVpRYkxBYW9TREZjSmV4dVorbnpvdHVzRjRRT21m?=
 =?utf-8?B?ajEwQndablhrT0xtNUpPeURKVHN1cWZqODMwb05OMThIUzVhUURPUk1yOVNK?=
 =?utf-8?B?dnZ1d3UwVVJhbktSVHIvbDlVTUdLWW00MzhTWHRGbmhBWHE0TmoyakdPYlNK?=
 =?utf-8?B?MDloNUNPa1IrcFJQS2VKTFI0VEdJUXppRjZNaXVIUjVGVmR0UWEraGE4R01G?=
 =?utf-8?B?NXVCUGthSHJma1pnSVpCMmFyNTFUNDllRXkwTTdDbFVSTHR4RENBcklqeGJm?=
 =?utf-8?B?V24rTGFlQ2ZhcGVqZm5kYVh5WUw2aU9ENnJjbXZQUXE1VitvcFdoOWs5Nytt?=
 =?utf-8?B?S2FWN2VFSVdMY25OUVJhMnNLUlNpUnhzYWwvZmVCQ1k5TzA4OFh5OWtHSFVp?=
 =?utf-8?B?M01FVVJjVHBRQmpXcUhqTzM1RlU3ZGIvdE5qcG5XRnN2Z0FZdWFjMGxYSkpZ?=
 =?utf-8?B?TFFQRDZ5N2VnQ3VIOTZnZVRHbWFxZkgxbUFyemJVL0hXQ0N5d3R3NG1JR01h?=
 =?utf-8?B?ZGFQMDIzTkZ4aWhWa3lDMXh5YUhtdFFxenBKTWljR2w3d1pSVE9XL2Z6U05u?=
 =?utf-8?B?SkoyaXVnenpBeGhWbll2TTZZczgyRW1YQWZrTWxpbm5HcnowdGVIdlNrdzQ5?=
 =?utf-8?B?QjlMZE1Xc3ZwNzlYL2xxZ2ZtR2p0bWVXS0JDYTYySU04emlaMmZHaG9BMms1?=
 =?utf-8?B?cTBCekxxUWhiZUI5MHpMWC9FdmU1L2RMR0dpQUMrQWtmb1JORVVJT1Vvd3dn?=
 =?utf-8?B?WExJQnhVVW1wSHlWSHMwU1huRzVRaG9BMTNXWHg3ajdLdUpleUlnTkJKcnI2?=
 =?utf-8?B?T25wQWxoOXA5UzZnZDdPSm8waUdCS2J3MiszTEtVNlp6SWdmaXlkbERPM1l0?=
 =?utf-8?B?NUhtd2g0VnZVZ1hyS3dCaEZ3N1hPZ2M1NVpSS0ZaTWwyUlVXa0MyL05kcU82?=
 =?utf-8?B?SnNQRTE4dk1YcW11NkZoemQ4cksrcmZlSXZnRFB5NExoZXRpNGE2ZnlHajhP?=
 =?utf-8?B?dUdHY21LVXFiamRnZDBoUU0zcUdOaExMbmxybkVOUVpHRWxZOVZ3ODRUMmxt?=
 =?utf-8?B?UHQ5aXM5TzZ3R3U5bnR3YVlIODJzeGF3NmxrOVN6d1pqQm93RG1OdEtTaWlG?=
 =?utf-8?Q?E9rI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE16aGZZM0JudTExZHlteHVibWZyUGtOU29TUEZiYWVoNGtOVmNKdU5FbHRQ?=
 =?utf-8?B?NlZMNVNpb1E4ZEdUeWk3ZzY1SldSNk9haUMwYUhpUkRXeXVMVkw0VXpZeWRB?=
 =?utf-8?B?VnZIazRRcWVmZnl0YnBJNHp1aVE4YjB4QjBza3pjOG1uTCtwY1JUenU1Q2JI?=
 =?utf-8?B?cHA2SENERGVUUko4Z0RCWWZvUnRseXcwY0lHYldYRGlnTzl4OGRtVlAxK0lH?=
 =?utf-8?B?eGhVVUxOQnplVWZudG9qRW1hWi96NEZFOVNIVUo5RWQraVFEYiszMFZxN1RV?=
 =?utf-8?B?R1ZuOGlJU2F2c2R6MkswTjc4TTA5MVE1YmVMNTVwdllEVkF3R2RieE5qZmNC?=
 =?utf-8?B?Q1ovT21ybWpibEE1WURRYm1lMGlmZEI1SnFTenFKaForVDBtYTNoSy8wMUJI?=
 =?utf-8?B?VEg2bHV0UnZuRUxQL3hkeWhMMit2enRIM2NseThYaGhnRGI1R3F1K0dydFM2?=
 =?utf-8?B?a2h1WUFNZ3FyOXpUMjNkY0FTZEk2UXZKbEFEYjBXL2c0UWs1Q0xBZW9PNytP?=
 =?utf-8?B?S045blFJSXFTL2t0MzJrZ1ZORGJPUDV4WVF1R0E1NnFYSnY5UVBGakhFaW1R?=
 =?utf-8?B?N00wdjMyOWUwd01FNk43SitEdlZxU2x4SzY5VmZTWVJIWTQwVVNUdW1md1VX?=
 =?utf-8?B?bklBRTNnNmNqWlphRVozV3NSbUkrQWNsdXNRQ01PRnVoR0xWeWNkQWVmdVJD?=
 =?utf-8?B?N2gwNE1vN28yZ1JBalI0c3NVRFAzZ0tFRDZyTnpFSHNlK1QwUUg0K0xUUUJz?=
 =?utf-8?B?L3p0ZEo0TUlKcTlOay83WWRNcUJrbDN6bjF3SjhPZ3ovanhPallGdzZzZWgr?=
 =?utf-8?B?YnJOa01uVURZQTBsUldMTGJPamlFZ21NcnpqWFd4eUduSHZNTXVrZzl0RXNC?=
 =?utf-8?B?SEsxSnZMcithL2p0Wi85UGdrQnV3V0hVL2Riamw2RHFCOXpiNlM4ZmpJR2Jr?=
 =?utf-8?B?MSszSmFlbWtzNTRyOFZCWi9SYUFwUVBMSjJRVkRTZlZiZjdvYjgvYU9DNHR0?=
 =?utf-8?B?dTNnRk00bUxkWXJxbmlwSUlVWktUTEtsTzEvV1VOTkUzcGx5aENyUlNCS3py?=
 =?utf-8?B?MlBSWGJ2cXZMdHd2RGtJdGxlVmtHclVRKzNBOHVkbjV1Wmd1RE5SOEFKTjBa?=
 =?utf-8?B?bzQzcDVsbEcyYTNpLzJzTXRjY2ZmaXI1QjYyaVFoNEc4V2hqdk1UNHRjME9h?=
 =?utf-8?B?bHZhVFJVVkh1dmhQSFVkb25kYTRtMkt5WWVOYmlUUTNLdTVIT2h6WDNRRjVB?=
 =?utf-8?B?M2R4eVJlY2ZScUNwa29CSXpQT2FqbnI5bW82WkxHaExuMWxFWkhBbmVsUUJN?=
 =?utf-8?B?ZktNd1lwdzFqZE5IZ2ZITEt3K0c2ZlNNeUthN3MwNXpBdnhPWXFBOTg5djMx?=
 =?utf-8?B?SHU5UXZhTnBDcE9CaHZzRXltUkZpVXZSUC9UT1lKaVc1L0tpSWhmcXZzRXFH?=
 =?utf-8?B?U0lHeFErWVFLcHNYYVRrNlk1NUlrNmpPMEJSdXJISWZ6bG93cWFQdy8zemg4?=
 =?utf-8?B?TG5zNERrc3AvUW51NmxsSTRMWVdEcGZDcGM5K0hqeVpwY0NiZzJGQjBhSWtK?=
 =?utf-8?B?WlkwSjJwdEJETHZ1dTZkYVBINU1HR296NEhwTUpWNzZNVzJtY1ZVU0JKUi9y?=
 =?utf-8?B?N1hzcDhOaGlEYXBFYURHQWNIdUxVRGJtVW9HakluU2RYSHFxN2Y2a0dSd2Yw?=
 =?utf-8?B?a25hL2c1ajFranBCSXJwcmdLbXQxWXhoMlZGdC9sRnhtOHo2ckFCbzVsekVY?=
 =?utf-8?B?WU5Ccm5UV0Q3bHhXLzdyL0l3Y09tUlJTb1NvSWJ6SVpEbURGalFKUzFxUzhU?=
 =?utf-8?B?UWU1MUFEWThadkthMDkrNmYwUXhpOCsrdnROeGtsaWtEb2ZMMDhFRFVsU3RH?=
 =?utf-8?B?K1hCR2M4bm5YMHVyTVhmd3FQMnpCQzlXTWhQdGFWNGxHQ1V6SWxzbmNqNDY2?=
 =?utf-8?B?cDlYTFVTSTJPU3FJNVlQWkw0V1dJUHlhaHVycElza2poWmk2WmozMHNtSzhO?=
 =?utf-8?B?UWNOYkZEM0NBUFAzZjVYQVEyVkFBOENZQUt2TGtZWmxYNEpzd2RROVI2YXd2?=
 =?utf-8?B?MVVBM2JzOGJ4UXRhK3hhWFJ2clYrZHpPVFhqb2Q4M0V6VDhPMEs4b1dZUTNu?=
 =?utf-8?B?NlpMT0thb1JDblJreFU2alkrSDRveVJEWnBick5MVW5JUExpQnVUVkdJSm1R?=
 =?utf-8?B?RzBlQ2tQNlFldnVvTG5oc3M0cUYrN2huelJTS0swR2VTbHFmK2NLZDBBK0Qz?=
 =?utf-8?B?OVFMeU4wL2IzSnRJODZVMGdQY0prckZIbWFXeWZMWWRvS1c0S1RzbmlqaWh1?=
 =?utf-8?B?Y3h6TS8zdDFKRDlueklYWFpoTGptTVd5aFJuNjV5b1ordzJIOWo1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb6a01f-541d-49dc-da00-08de64d10c6b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:10:15.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hStASBobNc7jXedFHR06LP8jd83HZF+xXIYo6EiQ7DU+duAKqg6UtrDGrqCifQ64byn88g5aDqcIhVBGgmUPHWX2I5CcviSSWEVNWuzzMeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8037
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 907AAF502D
X-Rspamd-Action: no action

On 05/02/2026 1:56 pm, Edwin Török wrote:
> Observed when attempting to boot a >4TiB VM:
>
> After a call to domain_setmaxmem with 6370254848 (KiB),
> the domain's maxmem got set to 2075287552,
> which is exactly 2^32 smaller.
>
> xc_domain_setmaxmem takes an uint64_t as a parameter,
> and the OCaml value is 64-bit already, so fix the C variable
> to match the type and avoid the truncation.

Fixes: f5b43e95facd ("libxl: fix "xl mem-set" regression from 0c029c4da2")

> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index ac2a7537d6..c55f73b265 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -947,7 +947,7 @@ CAMLprim value stub_xc_domain_setmaxmem(value xch_val, value domid,
>  	int retval;
>  
>  	uint32_t c_domid = Int_val(domid);
> -	unsigned int c_max_memkb = Int64_val(max_memkb);
> +	uint64_t c_max_memkb = Int64_val(max_memkb);
>  	caml_enter_blocking_section();
>  	retval = xc_domain_setmaxmem(xch, c_domid, c_max_memkb);
>  	caml_leave_blocking_section();

Interestingly, in 8b7ce06a2d341c1f when the Ocaml bindings where
introduced, it was always an Int64 downcast into an unsigned int, so the
binding was correct.  Later, xc_domain_setmaxmem() was upgraded from an
unsigned int to a uint64_t.

~Andrew

