Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F/GOZq/cGmKZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:59:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1E5666B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209662.1521602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWrY-0007cE-Af; Wed, 21 Jan 2026 11:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209662.1521602; Wed, 21 Jan 2026 11:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWrY-0007Z8-6h; Wed, 21 Jan 2026 11:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1209662;
 Wed, 21 Jan 2026 11:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viWrX-0007Z0-Aa
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 11:59:03 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93010c36-f6c0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 12:59:01 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5130.namprd03.prod.outlook.com (2603:10b6:5:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:58:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 11:58:57 +0000
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
X-Inumbo-ID: 93010c36-f6c0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5sZM0it/JCjCRqPvJ3UvckDdhYyCAkI5g40gwjM2atRSChqn8IYJALewf7bsK/L3HbgoCt769JWMAb2HgmoiwsvwdMiZOOUiYIPTby2uodIuglqDFN4TAXHxlaoYs29T/VswfU2SlQTBVXaZIHDn8bdcHtiKuKJAj3X0pwwpLxFvxxDPHMutMzOeCVbj/Z4lfN9XjppF6MTYU4b4H0rl+sgfgtSWivOFBV2UzqCINDn0J3RzqVFfuSP43xSVrFh4VB3nxOmIbXBNuQfdNv1GLpdJ4Z1/LoNkWVKuXXj17P+3q/FY3JQIThp2QNTKxxmwYPuydqunvAFcWieW+oSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VM9xryBx8vMeosmXSUtzaIrbqm5eYskiAubR3TMpDo=;
 b=YiK0BSzr+zvX1tZwd1G5QZiAAPc5suOLlnfRPCVSkZVLrdomvxI1JfosME+xcH1l7jmkZv1sZZKzGF4iX7VMCWVglyhbg6pJg75Gm+xnZLP3RJXfwIj2m28pXtd56sRV7FNAbjSf8ckb3FgfNveWxif8KPUlaElFl3UC4dFNI3fn8A1YG1c+4VgEMPtXCGIawWlh89C5tIfsbmER/kMVmAR9aV3EyQCZ/XOfmJG209i67yDVuJLTqgsu12SK3ng5JeMvf8L7blgViVoGAUJyRrR9zKQ+AC/DIiCWh5XupFVYfaF/bJ5/qDgLrjzu974KjTlBLYea3NKkKaQMu412Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VM9xryBx8vMeosmXSUtzaIrbqm5eYskiAubR3TMpDo=;
 b=Hj8EyOZ4fHt3ArYwgLgEXlARla2rZDwD1WkXat7w5EEG+TShC7eaauS6V7nMzSwxLlvkotg+1OJsAQT3lak33kvdno7xqdFyRczZdeIq3YtWgI9dNg0tlyUFShVR6NOD9PYAdgH217NewmIBB8UrbAXg0r0M1kNjnXqR+xn9or4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c3945e3e-19ea-4646-83b6-d2727ad00690@citrix.com>
Date: Wed, 21 Jan 2026 11:58:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/amd: Delay amd_init_levelling() until after fixes
 to the CPUID MSRs
To: Jan Beulich <jbeulich@suse.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-4-andrew.cooper3@citrix.com>
 <b5e45ef8-40ac-4a7e-b268-2573855a6265@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b5e45ef8-40ac-4a7e-b268-2573855a6265@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 445c3f53-d7f2-440a-798c-08de58e4753d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTZZTXpYbnV3MGE1eGpJYlZXNVJ2Y3NQemxrQUdwNXQ0d2ZjeTNxd3lZYzhE?=
 =?utf-8?B?R2ZxMEhIbGtRUUlacVErbjIrSDhMK3pVc0o0blRySFdxUzUzcjZERFAvaHVt?=
 =?utf-8?B?Y2MwTGxucm5QT1BBMWc4YjI3NjBJalRPQkQwUGNUdzgvd1BPeXlmOG04T0M1?=
 =?utf-8?B?a21rWnk2ejV3bEpBbTZEU3hpVnNDSXRzVHpTUTN2U09POU1xOXI5Z0dsa0g1?=
 =?utf-8?B?cWNremRSSEVnME5xMXZiVldlUEhYT0RmcjM0T3YyZnQzUHU5cE1DblNRcXBs?=
 =?utf-8?B?RmFJaDlheHFVbnhxTzlxRmVrWFdJUS9rTmlTdUxaWm5IbHF6bmthSGJZTzVk?=
 =?utf-8?B?OFpldk5zQmYyZVdpUFBkR1lkYVBPSTF5NHBTUG1ncG8wK3J0VEpvei9vZkx5?=
 =?utf-8?B?RDl6VFFXcnF6OVNkSVhrWjgwUEVhZmdZWFhwZmhYUjZOQWJ4UWpGM1dHQ2hK?=
 =?utf-8?B?Zi9ZUWR2S21XMVBPemNHbEVaZUk5ZHdzSFIzYzIyaWE4OFNJU2I1WHpQL1BT?=
 =?utf-8?B?cTgxenp3WEg3MDVMY3UyejZmdEFQcW8zZXJIVld5VjhNVEZsR1MvTTFueFV4?=
 =?utf-8?B?bHhhbEtMM0s2K1JGMXpCeVY2Tk90Q0thWUxHdXk5Vkx1bDlISHhGVTJMdUE3?=
 =?utf-8?B?TGtSWTh5RUM1L0hMU3RNTjZOS2VENEJ5MFlDL0RRUU84NUZDZk1Sczh3U0Zw?=
 =?utf-8?B?YjRDQ1RzbjRqNHhhVXVLMFJ5UWxzTkZhbWNEZGp6SXNzQno0Qzl1Mm1PbzQw?=
 =?utf-8?B?SnNvb0ZtS2dydkhiT3ViUGIxQ1RtdFFiSzJtOEhnbkx5SWFIbUtEUXI4N1lJ?=
 =?utf-8?B?bC84SjJOMlA0bEVUaWlFWlduT25TUXF2Z0t6MVEvbkZWR08ydHBVdDhJNUs3?=
 =?utf-8?B?U2pOaDRlWmtHc2ZkZW51eGlYUGozR20vOHI4SHcxY0d6d1ZoRUwrVzQ5M0VN?=
 =?utf-8?B?bU0rdXFCdGdKU0p5MXhMWUNZTGlZSXVadEM2ZlAya2pwcElTVEREYTdWYmQx?=
 =?utf-8?B?d1lmWHBCSHBwNEh6MGJHelBUTHBSRDd1MjlRUGZpZ2w3dXRqbTBzVDNuNVc3?=
 =?utf-8?B?NE5ld0FaQStZWnZDQ3JES20vVXlYVkRrak5ENG9oeHlGd3BIUHl3LzNpQnhv?=
 =?utf-8?B?dkUwVWVBdHVwUGszbGNmOGFDQ01OTXpUaHg0cUkrQlFSZ1RTTXA2MU9nVmpj?=
 =?utf-8?B?TXE3b0llYUE0UHdiekRHWG80NlcwMXkyVlUwcmgwNWVhMWpWL3MycXNZSUpv?=
 =?utf-8?B?Rit6d3JoZS9RTlkyekE4eExMd1pPVyttTXpodlJKOVQ4cXI2Zko3QVU5eVNW?=
 =?utf-8?B?TUZOSktKdEFFL3FpaHU0emNsMUhEWUkyczFsNnZ0SEZTRGxPVEprQnFRK1h4?=
 =?utf-8?B?cFRmM1A4K1lrRlJrb2FnYmxTa2hiUFdhM0g5UXhVQWlWOUlVVER0ZlVKVmFT?=
 =?utf-8?B?RXpVWUpvRkZUM2U2WkNEMFJSUUNkbXFxY0tBN0xrY1NCZ01jNnVkSU1KYll2?=
 =?utf-8?B?WGtXb0RTc0hpZ0JLOW5aNGRJRldpTVZkR3g5c0lLMzN4Unc0ZFpEdS9heFdP?=
 =?utf-8?B?QkNnRXplMlFYRVJFL0VXSWNpcVl1b21jbExlVDQ5aU5VQlhYbUh1cnhDSUFW?=
 =?utf-8?B?NG9BWEgweXl6Ukl2WXF5K2t3WEFhUVJEb2piRStHMldtNnJtbDVkZmVQRFpv?=
 =?utf-8?B?Nk0ySXQzdzYvNEovSzlqM3JXcmVXYVhLTUVtVGxDa1VRN05IM1FaQ25jYWFk?=
 =?utf-8?B?ZnIwcE1SdUtWYlc5Z2NNZENtUGtRSlRmZ1FzVUJHUndEVkUwbzM0ZDIvMlYz?=
 =?utf-8?B?M2pCSnZuRk82d0xjcytWTDR2T3BESytTVTFNQ0xEa1Fud1ZZWUJ2MGU2TjE5?=
 =?utf-8?B?Vmp0Q2hRdlRmS1RvZC9Ha0IzU1UrM0tVOWhOWEhmS2FvR1BTNk0zS21RK2hW?=
 =?utf-8?B?VFdPZFZlU2RHN0RhekVtZ3dzd0dKZjNSTnNqdzhUZTBQdEJtQTVjLzlKT0RU?=
 =?utf-8?B?bkxoYU84WnQwdnIwZWkxeDdRNHFHSXZyQnVsdGxkRzd0OVFKUGNSOWk3TjBs?=
 =?utf-8?B?Z1BQZUJmeGVFQkRmNzFrODZMZXVDdTFPamlJeEtlWE43K21UWVNNOGczY1Fi?=
 =?utf-8?Q?ilVU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhBREN0L0dNS2RSVW1sUGI5UUxmc1EzZGhYdFhHRUNuT215RU1uWTZwUkZN?=
 =?utf-8?B?WFAzQWhQN0ZWeXZvRGdlb0xvZjU5bnJZMENCbXpRRTBCUDNDR2RZTE0zSzk0?=
 =?utf-8?B?WTZWc1FVVHdLWE5mdUlyOUpZdHFwcnRyS1VmUDNVcGxtbldaK2hxeExtU1Vi?=
 =?utf-8?B?dHNkZU1qc1UyT3l2ZlVBSDRXb2pNZlRLZGtwajF4QlR4M0VENzdpUXZJakRU?=
 =?utf-8?B?YzZQWUhqalpPeExoN3lGOFZ4b0NoK1NybHR6SUcyRFowVGI4UVlhK0lZVmE3?=
 =?utf-8?B?N0NxbE5WcGU2SWMwMW9YQndSSEtKdmN3Skx6ZmdwNlpxWDZuT0pXbXZMNVhB?=
 =?utf-8?B?TFFLL0RXWFFKNTZrVDl0ZFJWMTJyb3p1WjYrN1Rsb05vRXhHMU9tYU1sRTlN?=
 =?utf-8?B?NWsrNS9xN0RabThGM2ZzTVFQdGd4UDIzQkl1all0QWV6YkJsc0hlZng1bDJD?=
 =?utf-8?B?OXRaNTNHZFduSWp3OWt3MUNYbzVhWFRPZUdmZHhUTlVaMVRKSHB5SUFZTmJw?=
 =?utf-8?B?NnVxYnpHRFRNM05XeVNxSmdySUFlYndldkNWNm9oZXBTMW9CQmorcjRKekNG?=
 =?utf-8?B?Zmw4OWJOL0JXNXB0dUFkOHNNYy9KSjJuSGxRWHJ5VCt6c3BndkszOVA4ZVRB?=
 =?utf-8?B?WUhqWGdqZkltOWg2cXprUk9QMG1Db1VHaFJ6V1lKa0VxdU04ekpCa0lSeElO?=
 =?utf-8?B?UlJLQzhCdE85emdBTUZqWjRtZlNpZUcwUGgyNlVnUjVhZHZpanZ1R2NxZ1Qr?=
 =?utf-8?B?ZC82OGNZQnNoYUlIaitOZ1FtdjFSSWJlVDVmSlVNbElqbHFpSXdoOVhNMHNR?=
 =?utf-8?B?Rm91Sk1lNzZHUi9rNDVycGRVNmx6cnMzQjV6Z3JhU2J5dkYxazVvcCt3ZEQy?=
 =?utf-8?B?ak0xTHRJcTlKN0NYSWpIcVBnWFlxeXUvaDlHMDlYV2JHRnFKT3B0aDY2NlRj?=
 =?utf-8?B?bHROeHFrRUdsNW5hNlNBSGswelF1SHVFVkR0eFJubG5kSmExcHJ4WTVuQnN2?=
 =?utf-8?B?cDF1bHVBcEFxYUNuS0hFTWlNaEQ0RlNaUW9oRllhTENTRGJqbG9pNm9qZWFH?=
 =?utf-8?B?QVBCaG9kTzdaUVZWYlM1ZnMzY25qMkdNM0ZPV2JIRzZ6aDJsSytDbmJ2cW9p?=
 =?utf-8?B?VGRpZUZ6aVVSbjJqb20yZEpPTTRZV1RqVXFHbEJJR3F5YXRuSWdTSVR6QWgw?=
 =?utf-8?B?aS9EUmtBdlVvbjV4alAvb0ovMGZaSjNVZkk4M0ZOWXROZksxbG5IUTJZUXU4?=
 =?utf-8?B?a2pFa1JTbndjZ003SVNaWllGUVFkbElRQ3pNV2lneE5LTXdXZkdkUDFvVGNE?=
 =?utf-8?B?a1RiK1p1bTg5a3BkTTR5TzNwWGErUUtqdUMwRUpFZmt2cno0V29DZG03emNy?=
 =?utf-8?B?aGExUm0xeVRqaXljQVAyRUtwTmFWOXdtQUk0S3ErOEZBM3JtY3l1NGRkWC9C?=
 =?utf-8?B?TWlNSkJ4OWczS2dYcmpiWko4cDhzUUJvcUl0eDc1dVRQS2c4VUVmZWNlcllJ?=
 =?utf-8?B?S1Z4a3ZrYlhrc2p0ODhnbVNpSkhWalpDMWt3T2o2U3laRFFsOVpmcDhKaUwx?=
 =?utf-8?B?NGlkZ0VRTUVWUFY3N2JvSUNZNUJsNzN4MTQzSEFLaGdkWXR2RWpnbFQzNHds?=
 =?utf-8?B?ZHZ2K0VyTGlBSkxkTmVHQmhoRmhScDdzUGd2QWJXODMvdWl3MlJBRXMxdVVR?=
 =?utf-8?B?U213M1AvTktRSnpDMElXRDlCMDViYS8wNVdKNm9sYWFiTml4SDFyYTZVbCt3?=
 =?utf-8?B?Q2NCU3JiRXlqc20wc3pUS1JOcjlneW54d1JnMks0dlYveDdPbUhhME5GLzFt?=
 =?utf-8?B?ZGhocUptTDZUVUtqbVlJdzNjeHVWd2E2M29zK3JuZ1R4OTJjNHdXWEtxbzA1?=
 =?utf-8?B?L0cvOUR5S25LZzFTaFV2b2VDeENOUTloK0FWbTJZcGFlVHI4azl2cnNmQWZB?=
 =?utf-8?B?aEJaVTE4bkc1TzBaWWhTaSt5emRVZU1Ed05sMjROTXVoSWloK05DUHNlbFdM?=
 =?utf-8?B?RFJrV2FJZy91S093ZmxndUlZeVczN25BTmFVSWFvR1JpZTlESDdLOUlQOXFP?=
 =?utf-8?B?aFM5ZHcvc2hrRDZIVXg3cEg2TFNRU0JaMERUcEVxbk8yOFJTRDM2TWRmbnB6?=
 =?utf-8?B?VjRXQW9JZDMzK2ZZWFpjTGc0L1FDL0Qzb0lTZVY4bDM4RTh1dTVFM28vVjV2?=
 =?utf-8?B?SFlNenduaExsZ1BPZm9TWFo4YnNNWGVuRnUvMTFrREdaS0ZFa3h3Rk5xdFps?=
 =?utf-8?B?ZEFTekhJNUZKKzgwbU1UMmdMcGx4RCtqY3V2aXFtTFFlVmZKRm5CSDFBTWIz?=
 =?utf-8?B?ejk0TGtkSmI4SFR3ZDNkTDlRajJuOHBQYU95cFprQWc5YkFEYy9za0Nua20y?=
 =?utf-8?Q?IEEwlnZlXKE8hqH0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445c3f53-d7f2-440a-798c-08de58e4753d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:58:57.7781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3pgrsl5WhfulqPNhT2juLUGRzTpS+3W7BRF56syAzHhGt0f+nk2Wvp0YHeLgN/2PwUHvpjNr/ZHULXgbW2PDE6PiYLd5UJd+X25NSiC+BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5130
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 54E1E5666B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/12/2025 9:41 am, Jan Beulich wrote:
> On 02.12.2025 11:57, Andrew Cooper wrote:
>> There's no need for amd_init_levelling() to be specifically early.  In fact,
>> it must be after init_amd() edits the feature MSRs, e.g. enabling TOPOEXT on
>> Fam15h, or we revert the change on the next context switch.
> However, ...
>
>> @@ -1270,10 +1262,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>>  	check_syscfg_dram_mod_en();
>>  
>>  	amd_log_freq(c);
>> +
>> +	if (c == &boot_cpu_data)
>> +		amd_init_levelling(); /* After CPUID MSR adjustments. */
>> +
>> +	ctxt_switch_levelling(NULL);
>>  }
> ... this new placement conflicts with the two RDSEED patches which have been
> pending for a while / too long. Even moving up wouldn't help, as the TOPOEXT
> re-enabling is after the switch() that the RDSEED changes are being fit into.
> Surely I could re-base accordingly, but it kind of feels that the older
> changes should go in first, with whatever adjustments necessary done either
> here, or (in a preparatory and agreed upon manner) right there, or entirely
> independently.
>
> Looks like it would be possible to move the TOPOEXT re-enabling ahead of that
> very switch(), for the code above then to be inserted between that and said
> switch().

The NX fixes also need to re-activate a CPUID bit, so I'm going to have
to rework this all differently anyway.

~Andrew

