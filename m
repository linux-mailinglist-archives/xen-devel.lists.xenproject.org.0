Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAZCDgzGeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:05:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC92954F7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214805.1525044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjgV-0004Vb-MP; Tue, 27 Jan 2026 14:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214805.1525044; Tue, 27 Jan 2026 14:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjgV-0004T4-JH; Tue, 27 Jan 2026 14:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1214805;
 Tue, 27 Jan 2026 14:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkjgT-0004Sy-TR
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:04:45 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2150480f-fb89-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:04:44 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6966.namprd03.prod.outlook.com (2603:10b6:303:1a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:04:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 14:04:38 +0000
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
X-Inumbo-ID: 2150480f-fb89-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEkJXWCJsw2ss8GOVZlgUUmfBYKAJAwI41kR0ACPz9ftTapN43n0YNtLF0+BSr7GSSGhrJg4Ht9rWejY62gwaFGdZ5nVYW92rlQjs0JezJbgGrv8QKe+csTeTYQ9FWqWR13RxIQEX8SYeqYnmYGOC4bgI9GW1OvpxNsoa/3DZ/rgTUpKhEADs5yxO74HJ+w6WJvNBLOLvOxISMytfGi1l765LJuUUYPn46EwoxXuzPq7SzbqpfWGF7NF6Y6E+bg0GSVH2wuZR6dXGFi1ePrJNLndCJ6nFLVYZxSb3m6ugOWN8FgIrdMDTh+uaw0kJ3c6ZDM1rXKlGAv24TbL0JaAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5uVsejvK52uyQj8vzA/mu0K23jA4iJO19U6rJZ955k=;
 b=F9h7UdStkKFYu6rpJiDIoBq00O5lMWKOnkwp4YAKWmw/Ae5iQccXTpIh6BrlULLL99A6RPAULBII9XNzq7AgxxarocPpDtVxjkyjldQz7vj5xbhwUcYX6Ge45S3jqsC96EwbPeHnYvP126Du6c5jQSm5qvWgaTA2Ed3jMMYEe4hl+rVkacUjAMX3QSwSBVKXQb6KqKnysUbMrnpqpteOaFz2nzlAMRWdsX7xxU11Kyz3cK4cZ4AuIv/kMD1P5Tq3iracqZzp3qaVz7zirHnOtS9F3JN5N5eRA/4EPL4v5iGlcF9m101wMYjTbcdLS6KPZpZQ+sWNjlXmhRBmxqkb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5uVsejvK52uyQj8vzA/mu0K23jA4iJO19U6rJZ955k=;
 b=jmdxu113L+x+HNBxePXTwN468Qsj/GMOOqGdVILFreQwt9wAbyACi6oKuwZCOVjErunygqDi5HvDV5SxhVwaKpDNU8rX5J25KYQP52wGtjdibezdsMNYQlkMORHcN5ZK4m3Z+00PY7OjIiUaPS3Z5D5Pm/p/vFFLeEZPDLRIWjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26e12738-a7bf-49d8-a7ba-a98e88399c77@citrix.com>
Date: Tue, 27 Jan 2026 14:04:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/16] x86/cpu: Fold generic_identify() into its single
 caller
To: Jan Beulich <jbeulich@suse.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-5-andrew.cooper3@citrix.com>
 <e1c899c5-53ea-44e5-b74e-e3c214576d8c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e1c899c5-53ea-44e5-b74e-e3c214576d8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dbd58b-0aaa-484e-890d-08de5dad0218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJwRzh5dE4yV2NuVTBEaG5NVW5SZFBmRXVnQ0NnTWlHVDhoY1cwRU5CMmJI?=
 =?utf-8?B?OTNaQ1Q4NWI4bVFVdXNIYW1LOVpUQy81QXJISjhsR0VJSHRrTTl6dUxoclFF?=
 =?utf-8?B?a0ptSVZkMnFMRkZ2aE1Cc1NQMlFyOFdxUkJuT3kxTWFwUGlIMXhHS3I1TS9a?=
 =?utf-8?B?aXFpcC9QamI1MlhJY0JVZDlTdlc3ZUtnTDhrbUNrVjlKQWJWTTlEd1QvYy9u?=
 =?utf-8?B?VS9jbmExWklTODRORndPSnNyUzdpUzl3OVRnTkoyQ0J6eEI2R2hwcEVETlhM?=
 =?utf-8?B?dVYwNVVLUmo2Zllnc3lsVy9PdXByQXZmSFEvTktadDBmOW9KbzkvOW4yT1ZW?=
 =?utf-8?B?QUxGNWhXU1lhSGk4N0V4c1czRVZOeXI0RGlVaGZUazJhMnJSRmFvWkQxOVRa?=
 =?utf-8?B?Q3lIVVRnR09YbVZ6T0xBeG0wV2gxYW5zb1FuaDJHeVBjTzhPdzVCREpmWXFp?=
 =?utf-8?B?YmJ4aFlHNy8wZVIrcmE2OEV4Y3I2Y2RkSlNLdGwzeFc4Wk0rVkwwUlc5M2dk?=
 =?utf-8?B?YmptWWJPYmFnUitRbFpqSVR5Y0NITnA3NlJkQ0Zienp4S3VuSGdSVDBZNGNR?=
 =?utf-8?B?VkdnQStOTnJQOGhHdm0xdjZ6ZkJJK2hIQ2Z6dmFFeENoOFhERTQwZHJZKzA5?=
 =?utf-8?B?K01IR2xHZTBPZjRyb0dhcVhGNzdpQlVNeDZmTlFKTDVxQ3lsc2FkU1hVZ1VX?=
 =?utf-8?B?d1Z3QkVmRzJsZlkrSkdkMHJmZnNac2h5STBXcFYwU29ibWp5ZUp0cHcyU2Ja?=
 =?utf-8?B?Y0IxRWcrYW5KaEtTRXczSEdiYng0RDdMc2phUjc1U2tCOWtlWkMyWkQvaUpz?=
 =?utf-8?B?K3RFUlJPOFJZaDk5NU5wSmh3clYrYWlsSzNKRGhhdEl2ai9wWUM4T3JGbkti?=
 =?utf-8?B?a2JKdHdOUVZaUmY4endSWmNWWmlHN3RxcktLb1YvU3MvNEF5Ykl0QVp4SHA3?=
 =?utf-8?B?VE43UEVWR25XZW5WS01TMEE1dUlUU29TVnhRR1NJanhZSXNjUHdCc2NjU2tC?=
 =?utf-8?B?bnBQTkJTazB2MjRQYWQyeUF6TDEyVStnbHNTOXlUY1M3K0lTaXZEZ0RGbkJB?=
 =?utf-8?B?ZFAxeGYrUFJOVVZnbE85MU5SamE0SkRjczdIS1g0SHY2N2JQRmZXaGtLaFo3?=
 =?utf-8?B?Q1F4RVdHS2RjSHQ3SkJ6RjhycXA4aGVMTmhMaFNxVXBZYm5NcnQ3d3AvN3Nu?=
 =?utf-8?B?ZTgxM2RibHFTV3Z4NDRJdnZ3SWxjM3luSm5PZVhud3dZa0pWM3haNVovcm9R?=
 =?utf-8?B?eENNT2FOQ1d0VnVJSm0rRGVYMEpBODlSVWNmUUQ1cmdibldGM2ZGSXMzTzRJ?=
 =?utf-8?B?Qmo5bThQdWxYL0hjRjhRN1BLSjR1cTJXRExSSGFFczJvc3B4ZVkzMU9hcVRU?=
 =?utf-8?B?WjAvNU1QalplV0RUOW0vRm8rcXRZaDV1QUh3R0xheExFanRtSlhDY1hnN1JX?=
 =?utf-8?B?LzN3UG9ORzBoRXRjZkVpTG5jdkx0NFpmQitJVkM5Qi8vODlvdGRrT05jZG9G?=
 =?utf-8?B?eWRYVnBOVnRFaVFabzA2bG1Jc3Z4Q1ZNRGxjZ1dkVkNqQjhZTU0xUU40d2Ur?=
 =?utf-8?B?NGM4cm9YN1ZmZUMvdjVCQ0YyQzBJZDlob242OStBY0RnNStiejh2eXE3aVN0?=
 =?utf-8?B?QjBJUWxiTUNEekVKMlVweE9KT0hCZVZYa1hPbkpuZFFaUFRkM2lkRExoalNo?=
 =?utf-8?B?U1lsd2NzK3gxRENwYWpKQkhnNmJSY284OWYrMXVlazJzQWFFRG5uOUNxdk91?=
 =?utf-8?B?aTdnNHoyVGRla092UUg5cWZpUW1ScGxTM3pkeUV0QlJzQTl3aHYwdjVWNG53?=
 =?utf-8?B?WXZLTjVFbWJCa21IaS8wdDNBd2xpbnFNVlBUYlVXbG8yUys5aXN6ZURiZ3Ju?=
 =?utf-8?B?QSsyb2hvNDZnU0hoVFR1Q2hCTjFYekIrYkwzVHRQREJHT2NIdHJPaCtmcFZi?=
 =?utf-8?B?OHlYcXI3MkRURjFXME9wZWpFVmxNblJ3SUtmZDhFOUlSU1RyRnU2dWZvc05T?=
 =?utf-8?B?MjJNVi9qVWVLWWpiOFFnK2ZHWjZQMlNETnJqTVBKWHMvdW9xdlAwN2FtWE1p?=
 =?utf-8?B?Z0J2R0xtdW92dnFUMnNzbFNZN3NadWIxemlFeFZVQjNYbGMxbVJqbzJjUXdQ?=
 =?utf-8?Q?N3cw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlV0STE2djJ1c2EzWkFTWVdLTGU1UmVudVM3MXFSZ2djbnYvVlRmYjI2NlNQ?=
 =?utf-8?B?QmV3dVlTdFMwa1hwY3ltOXk2NWF6aXYxNkdFTGRuSHZ4MW9BVFJIRnZIOWlh?=
 =?utf-8?B?N3EyTGpzQVdqa2g1ODhXcmlKWWV0V1pjbHBkaGRFWEVVamhmVWtDcjNxdEhV?=
 =?utf-8?B?LzgyQ3RnbXBBSnJUUStMbHVBRnZkRmpkYmpTQXhyK1RTTVlYS1NHNklkWThu?=
 =?utf-8?B?aTU3cFNOOFhzcUF5TkU2RTFETHpVcXJsb3JOS0ZOSWZ0SGhpUnFWR2crT09G?=
 =?utf-8?B?cllNeWtlK0UyS1JCenBEQUcvQjFmTzJTUTJBaU5IYXZ3THRCSk9OdytIeHJr?=
 =?utf-8?B?RDVMVXNhSTdrTVBuUzJ0bm02UFA0dVFIS3MrZWhXa3pZSmd5OTJlSGlEZUgx?=
 =?utf-8?B?VVpQcnJnVHBpeGZqcnNGMWFGTDZJekxIZlN1YTA0RHZYbkhRVDBJcmw1d1cw?=
 =?utf-8?B?cWxJQXJ6Z1lyeWtmQ3VySXRNbUxUVUM3bnNkcUlTd2RaSHpzNG9TeUMrNmI2?=
 =?utf-8?B?a3pySElGekwxeXpqZ3NqRUR2djcrbkRWME12TDVKQ1pIZzFFcVV2cTlNNmV5?=
 =?utf-8?B?VzRPVEpsSTkzOC9jMGVSK01RRTNyTlpNUjhqR1hqaTg3eE1rd09raGZESWJj?=
 =?utf-8?B?N01Yb2FvdFR3NXBDcFZIUUJQam9rdmx4dlRyQW03ZDd4aEROaFpjTkh4Zk1x?=
 =?utf-8?B?WUp5Zi95UGM0OTJaVVp6YjlEU0RIY1IyNjM3amhBa1lVdXZ2YzZRcGVtZm5L?=
 =?utf-8?B?YlJqeE9lcHFVZ1oyT3lSd2IzWEZ6ell4QTlycFIxVVVHdXpVMlZFb0VCcGNC?=
 =?utf-8?B?YklBOTYrM3NyZHhUaGpNSk1Pbk5XZEdhbUdLd2tiNUIrN2pPTFRZOCtjTUlH?=
 =?utf-8?B?T09GVDRGbVdkeHBMRXdvTW53UFRaWnQ2NjFaVUZ2S1RqZVdubmUxelhjYlFW?=
 =?utf-8?B?UHR2UDFsMG9FdFJGaTN6UFMrdXN1UkI3cjA2cUIxUkMyUFRxSFpXNEdxLzBi?=
 =?utf-8?B?aHVNOVJ0WlBHK2xyWEM2bFl4d3NFM2ZxeXV3OC9DNUhuYWt1UlN5Mk93a1lk?=
 =?utf-8?B?end3N3B6M0hEUitaUkZpZ095b3E0WnJ2cjN0NDJSNG1mMjNKbkNGSzl6RmFs?=
 =?utf-8?B?SmIzSVVoQktlaVhETFlJM3puNVpldmhyMzY4N1VRVklvNkg0MEd5cjZjOFgv?=
 =?utf-8?B?RWhNbWJlMGxhZTZlQzVGcVRkZXpHdnJZazMvSGczQk4wOVlsMjk5bFhMQ2Z0?=
 =?utf-8?B?QmVnZUlPVzVlZGpMNHhaUEJpRUxPVVgrL2JiYVE3dlNteG9Vdk5QdzdVaUVu?=
 =?utf-8?B?bXcyUUVxWGdTNzdtUVg3WGVTZzYwYTZrVy9ubEpnZEJscHY3RWJiLzI5VjJ1?=
 =?utf-8?B?RHZiRzAzNDg4cTBDMjZRVnJZSnZiUWw5T3Z6WWxZNE5vazh4RzJYelVzUy80?=
 =?utf-8?B?a2dPS3ArQ0NLN0FiNU1reVoxVnpsL3d2RnRtalBNb2plOWQzSFgrQlBiU2w3?=
 =?utf-8?B?akJ1anEvMURQcFdtYXAyc3g1TWdMR1dSTUdxNk0vVTd5V0lpZzljOElCeE03?=
 =?utf-8?B?a3RaSEVJS1NjdU9HbVlYOUVJK0dRR2c4THBHaUxnQ09XNnp2Q2J0ZEYvZGFQ?=
 =?utf-8?B?SnFDaDBQRUJ3Zmxmb0NwZXY2YnNWbktQNG5oMGRGWmQwZlVXMFpRNUlIbHc4?=
 =?utf-8?B?dmVzMUpJcm5tY1pYcDUzRVNxUW8rQnZBNW9ZemdSZ2E1Y3V1Z3dNMloxQUlw?=
 =?utf-8?B?d2VGT2xKOHR1MVJCeW0zS2tXcXJyRWFUd1VIRitOMHlFS3ZxU0ZtK3BPdjVM?=
 =?utf-8?B?QVZMajA1R1dYRGJ6cjdpWmZzUUlBU1RvMFhiTnpZWUMzeHYwZVlBeklKTnh3?=
 =?utf-8?B?SFI1OUIyd2VuMVd6cEVMNEdiM2lKSmttR1pmL3RBMmluOWtzQWZvYzJNSkFK?=
 =?utf-8?B?RmlxZGNIWUxxaVR6RklxNUh4a3hqa0pVMHUvOEtERjg2bmJOZFRYUFdWcnJR?=
 =?utf-8?B?VWI5RE1PcmxyNzBQelpzM2J4RlNZM3VuVFBLaGJPN1BpcWRPVjJDOWE1TmtP?=
 =?utf-8?B?TzFCTzhTanZXTVRPUnFwRzFlNldPMzFxRWppTzZyanQyNW44ZUsrK0hPOHpE?=
 =?utf-8?B?S0hlNkd6VW5yM3VUQWIwR3N2V1BQLzdRNm5ReGc2V3lTa25Qbzdha3BpTWdl?=
 =?utf-8?B?TVdESVNZM01ma01CNk5ZWDFvbjdId3hMdDlHMVFKbDZDOUxGTlg2Zy91dVRF?=
 =?utf-8?B?RmxUa25kZVJLNkpvcjAwNVZJeklEdzRlcmtIZ21MamdIK0p6QkVUTVJjejZC?=
 =?utf-8?B?YlppVUxNTEtkdkU4Z2JPSWxMUzZzQUdSSXlQdDVnVHpzL0ltNzlBQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbd58b-0aaa-484e-890d-08de5dad0218
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:04:38.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGhM3BM+pjXMfY4DZXInCaT0JgLa6cnRtQaPddL5bP7Ja+/oICzl+V16Qmm+zworkyXp4whGuxsJPH8lrunBDZcBA0xCmWX4kQ8B47F0MP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6966
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 8EC92954F7
X-Rspamd-Action: no action

On 27/01/2026 2:02 pm, Jan Beulich wrote:
> On 26.01.2026 18:53, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -455,10 +455,13 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
>>      CPU_DATA_INIT((*c));
>>  }
>>  
>> -static void generic_identify(struct cpuinfo_x86 *c)
>> +void identify_cpu(struct cpuinfo_x86 *c)
>>  {
>>  	uint64_t val;
>>  	u32 eax, ebx, ecx, edx, tmp;
>> +	int i;
>> +
>> +	reset_cpuinfo(c, false);
>>  
>>  	/* Get vendor name */
>>  	cpuid(0, &c->cpuid_level, &ebx, &ecx, &edx);
>> @@ -550,17 +553,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
>>  		c->x86_capability[FEATURESET_m10Al] = val;
>>  		c->x86_capability[FEATURESET_m10Ah] = val >> 32;
>>  	}
>> -}
>> -
>> -/*
>> - * This does the hard work of actually picking apart the CPU stuff...
>> - */
>> -void identify_cpu(struct cpuinfo_x86 *c)
>> -{
>> -	int i;
>> -
>> -	reset_cpuinfo(c, false);
>> -	generic_identify(c);
>>  
>>  #ifdef NOISY_CAPS
>>  	printk(KERN_DEBUG "CPU: After vendor identify, caps:");
> To aid reducing the gap between the calls of .c_early_init() and .c_init()
> (that the next patch's description talks about), wouldn't it make sense to
> also drop this NOISY_CAPS thingy right here? The log message saying "After
> vendor identify" isn't quite accurate anyway.

See patch 13.

I put it later because it probably doesn't want backporting, and this might.

~Andrew

