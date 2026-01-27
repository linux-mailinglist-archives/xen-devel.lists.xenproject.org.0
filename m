Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkUGo+3eGlzsQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:03:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49A949EC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214643.1524857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiia-0006I6-Ni; Tue, 27 Jan 2026 13:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214643.1524857; Tue, 27 Jan 2026 13:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiia-0006Fy-L3; Tue, 27 Jan 2026 13:02:52 +0000
Received: by outflank-mailman (input) for mailman id 1214643;
 Tue, 27 Jan 2026 13:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkiiZ-0006Fs-Iu
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:02:51 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78d41f68-fb80-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 14:02:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8472.namprd03.prod.outlook.com (2603:10b6:8:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 13:02:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:02:42 +0000
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
X-Inumbo-ID: 78d41f68-fb80-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWbV+j0UDfV7SHApG9N9S72AByS2kN/2eP4+pbGtoQsJSHHs7WxaPoOFyyJuLslxZWG7khtTNKh/sct0vChkVQRMYH1tm56mDxJUqDaPS10QdtqsDA7/NJrodpUf1+m401E3mDG9apvr53i33NRHXyaZK3wsMnP1uxRu66Nh2R7IMOOtQxcOMAqmQZoHeLETQvONhUliMOCNp/hvSoApf3UjCKj1QUHHDkPxDsCHZG5PXe2tO3rWwhUfcYyTTEnC/7EtECZvw0aTtMJkZzyAtnOANCZnLcXlkxbd6JGk2R+BqZ79IcQGcOi+HXK7drN2+ixOW7FkP+PiHkcoI7uPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWpRMSqMIvsQAyuJ9UfcagbI/rBnw/ywlmAexI7elOQ=;
 b=lwDFPt0qg/z6c/vIJihyaBUc+9YmhN3iI6tn0bClKx8Zf12joH2dNrAKYYccQwlKX6m2k0sD0QZZRh8NoSytIequ1VrMj60C+cISHhjIgpuToyhcYsFfVBLT+bVqKLaHOqCCZMH3OXM6Y5vfXogX2n0ghUSfZm9ajgw9+YTl2RU1+z7FVzBQd/2JPAZ3LA6G24MnbTbwngRLGhcRMldLMh8evty3orzEUTE8yLFNuPcPtbS+d77LfYSlETfj+QSLjOkl4oFtYXf+BfNLGd60f7OSS71lAsyQZz33ODze3AiAlrQQcOB2rJz0fu7lCEzIayXqcNqCw1qNp2ZCf50Oew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWpRMSqMIvsQAyuJ9UfcagbI/rBnw/ywlmAexI7elOQ=;
 b=SYSOa8UdxQHvCpKpNsIHlBhCGC0go7QsJB0G85Cbm/W/Hzu/AL4GwXlPMX+g7CqXj+GfOJkcltAZvR6suOAnb751MQuuRBn/bJWQXnxs66iUU7ddaZOebEirDSddXH6tFWlqK18o2xAd1gkwZ0B1M7dGBVHuem5gy3h1nhmwvZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4e084768-1fe2-491b-a029-a07d648071c1@citrix.com>
Date: Tue, 27 Jan 2026 13:02:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
 <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
 <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
 <08d9aeaa-d503-4e75-863b-dee3b46c42a0@citrix.com>
 <98758ea8-8add-4879-a28c-bd8d6d898bba@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <98758ea8-8add-4879-a28c-bd8d6d898bba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfbec4d-1717-4692-d4f2-08de5da45b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUhUeVZrNTNobzhJajRKTldQLzI4MVphQTNNbDc0RTVvT0tEdFp3Y0x1TXUv?=
 =?utf-8?B?OWJQTnFkQUxoYXNRRnk4ajdKaWJWWjF5TWVmYTdLY2NvU2VNS2VMcWVqYnVu?=
 =?utf-8?B?TVJuRnFpam9jcDBQVzNwNGVKbEN1YWpvdkgyYjMxMkFHYjVTSjhLc0tqSVVO?=
 =?utf-8?B?a3JJeGFXblhaU2gzVUZsVXBsdmxmT0V4MGphK09ETGJRc0I2WGYrT2V4SGNq?=
 =?utf-8?B?WkYxYmRFR0RWVE1MVXlLaVJndStLMTc1K1c2aVRWNDFxVHhiM1hxa1hxckh4?=
 =?utf-8?B?UENlbGRJUVVRYjdRTUJKUy8zcXowclRrMC9yTHMwbXE1bFhDRDBDSEtWcWdq?=
 =?utf-8?B?QWhPREJwVGV0MVZEa2g5NGNaQ285RHR5WWE4azljWTBEUVh0Z1l5VnpnZzBw?=
 =?utf-8?B?QWs1alZwcEx2MTR6Nm8zRmt3OGEyRjlzaWkvYnVzUWU4L21jMVluU1RaQkI2?=
 =?utf-8?B?ekFEZ2trcXIzbHpldDcxZFdaK2hGRS80Vm96YTVWZHZuT0NhRzhyWE4wNXZz?=
 =?utf-8?B?VDduZzU0WXBRR0UzUTBzSTZZU1pHakFnTHVJWWRKZ0tvSkovMzBBSm5zb1hL?=
 =?utf-8?B?ald2c0dVcG5vOForMXBRVzZIdGxPd2RBODdYT2F6ZC9ydnJNSlVlNVFVdWUv?=
 =?utf-8?B?SzNqVkNkVXdjRzRHUDROK3AwUXBIY2FFL3Rhb1pwaUVZUjYrODB1LzdIeUNj?=
 =?utf-8?B?eUdrTU9hRVpFVUpzSEJtcmhtS1hkTks2V1M3YUVuTVFsOVYrZVNJK1FNMktL?=
 =?utf-8?B?QWg5ZnBKcXpWZzJrZXFSaGFSZ05ScFdIYlhKTlJmUWdUSWFCR3ZLVXpnSGYr?=
 =?utf-8?B?dzBYS1FuMnVpeHRLMG9GQ0ErdElLMnZZbDZhRUYrRDFvK3I1Yjh0RjUzQVZ5?=
 =?utf-8?B?RnhHQUhTZVBjQWtXNzIwUUhGQVFHb2xsRnRXL2h6SDFYelFUbDdZenNkbTZn?=
 =?utf-8?B?a0dzcEF6b0Y4TmZjYlBnRzBwOWp5cURPOU9JOTRtOVZ1MnlMQjhRS09KemE4?=
 =?utf-8?B?U0VuMk16a0lkYVdxZXZLSHc3Rkx4RGQ2UVJRamsrejJPbUdiWmkzRUNBV0RP?=
 =?utf-8?B?R3VpU3lFSFNxNUhaMDRheVpLNTZ6MG9palQ5RnRvZHlZTGlmWmNnV0lKaEV2?=
 =?utf-8?B?ZWEyMlM3Y1VpcjNlNm9YbW8xYW5pV3dGUUQrSVBPYldNb0ZxdUM4UWZ1bTY5?=
 =?utf-8?B?bFBiL3JMTElnTG1vSFZiWWxKSlNWeGgvdUE3cm9OeVYrVE5QMjJTdCswL1hQ?=
 =?utf-8?B?YVRYNklKU3RoT21Tby9YR1FNOUxydWttR3o2ZERQRlBQa2N4UTVnTTBGWW1t?=
 =?utf-8?B?Qm5WRm15NFRFVGZvcjFVNkF5L0MvQUdLYmsrNEVlemtxTGJuV2tJRVdFanRY?=
 =?utf-8?B?NnRta09ydXlBQkZXWUhLYXpiR3U0RmxDek8yWVpZN3ZPVTVyZ3g4QWU1eUxO?=
 =?utf-8?B?UDdWTm9mRlZyUkcrdG5oMnpVblFac3RiMmMvZ3hoVTJqWkhRK1ZuYjEvZ3Nz?=
 =?utf-8?B?bXRXVm9Qc0pDNTV4NUV5MjB0UnFWaUFjeTJ6cmxVcWNBdHV6Y004c093bFZx?=
 =?utf-8?B?Wmk3UUxZMW10WlowU0J0UTRlTzJaSHBpamN1M3EyWTh1TU5CR3pZWVdWYU0x?=
 =?utf-8?B?NEQwbzR1MFVNeDlIeko4MDB6WHBkWFJOOHd0UkZDb0hEVzNUMDgwRVEzYytU?=
 =?utf-8?B?ZE9USFFIL2JoejNyYUI3M3NaeWdXSTVSVHhPdHVyd3d3bWV6MXZkZ2J5TmZi?=
 =?utf-8?B?UEVuOTlHbzZJekFyNkZGNEtXazFJZ0haVk5qRXAzVHRYTURwTk5ETDJJZVdG?=
 =?utf-8?B?cjdnMzUzNXBWelMrb0lPRXJobW1IQVV6SjBhQUsvT3RKSkxNWDE0bW52VTZF?=
 =?utf-8?B?VFI4QUZHbXlNK3ZsR3ZiQnQzU3Z2MndWUmpVcW1uUWdKZ05vNVB2NDd4NkxQ?=
 =?utf-8?B?RHlOWHBWRE8yQWZZUGU2SlJSa1ROV045Q1ZjNGo2SlR1c3hzQTlIK1NEQVh2?=
 =?utf-8?B?YkFZU0hCeFVRRmlLZDhlMXJGWmx3TVp0d2VnN2NVTFVQcmhNMW9yaWVXN2cz?=
 =?utf-8?B?WVVTMEhLVndDTVNNYm5oRnhqQlo3d2daTWxybzcvSmc3YUg3Lzg2S2JuanUr?=
 =?utf-8?Q?eNxo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVY5Wk82R0U3MVBRSzZZTjN4MkpmYXRWalUzekxFSFdCVGxMQ3NIaW54TTB6?=
 =?utf-8?B?aDRDR1EzMjRsbndLVjRXZElrOFBCSS8ybTRSWW8yQldUUHdVQ3N1Q0RXRDRG?=
 =?utf-8?B?ZjJubE9WUlA0NmNrKzg4RWsxL1d6Mk1kSVVhSEFKZ3BXS3c4UzQ5MU9tdVlt?=
 =?utf-8?B?UHNTVCs0ckZ4WlBZQURKZllsenRDanVZeks2bW9yYzEwUEwrLzlQaE9DQldF?=
 =?utf-8?B?L3NaV0lpNFdEQ2hveVhuR2NUYzhmNDNCWUl0eldnRk1QOHp2d1hRdFZ3M0Vu?=
 =?utf-8?B?a21OSmV3TmlVZG9MQzZmY3dYMHRhcGNibzFlWkdvM2JiaEZNS3k5ZkVvbFEy?=
 =?utf-8?B?SGtQeGttR0ZoKzErWkdST1hTekZITUNZUmJiN0F3UjV3WTNNQy9ySUlqVHJ4?=
 =?utf-8?B?cEhvOWFia1o2MEh2Y0VHbTN4ZmZ2UmpZWE0vK0RLb2J1bTJMTmxvYklDZzVL?=
 =?utf-8?B?U2FFQmNueE0wL25vb2Q2TXA3aVhYMEFoR0gyaXlkZlgvUUtEeXBtQmxXU3Qw?=
 =?utf-8?B?cUQ5ZWxkeHF6dC9HR3NKaENibVR1TGFwdng3UThCS2J1WHJpaGxxcHgvT3U0?=
 =?utf-8?B?bittQms1U1NVR1dISHMySURuQmUxU0tEeGdPRUwyRmYwT250WjV0OFFWUnd2?=
 =?utf-8?B?OE1XT1FzQ3ppNHNVMFZOR2NPUVc1NWNaaThHaWlXbWRCZFU5dFV3L1NiTERT?=
 =?utf-8?B?OWwxR2JzM0lab1o5QnFEL0pXcThHckV3ZEhYeXRZSnhBWkZuQ2JvMVZkSFZY?=
 =?utf-8?B?SmJJNVVwZXFPc3hrMGpuYUdvNkVNeExKYVB3V0JoYzdmaGo0SUgvZWRxc29Z?=
 =?utf-8?B?aWg4YzRWWUV6WUhWN0huMFQvbWVkdFlUMUNoSnpJdm5kVi9TSGx1NFY4RHQ5?=
 =?utf-8?B?b3Y2SXJLYmx4a3R1M0JUclpVN3VjZmdLMStoZDJOVWF0eGVmVkwxR2xqUHZM?=
 =?utf-8?B?Y2lFVGpIRW5aSlZNQitzdGswZTVUdG5RVHVoaSttcHFvdjlwcWlRc3BoZVAz?=
 =?utf-8?B?T1loeUhHbGxyNFludEF5SlQ3S1ZoV3hjMzIyb29sRGQ5ei9sVUdwM0lmZC9z?=
 =?utf-8?B?c2NKN1Fpa21vaFNKL0dvM2d3YSsyNFBSTFFQMGFpTUZDNmN2UzVvMEVJRG1s?=
 =?utf-8?B?Z3Q1RzZFS3BvRDJXcDNMazB4bkh4YkdxYUVPT3U0R3NDRER4Y0pkR3FCOXNK?=
 =?utf-8?B?UDB4cDdGQUxGK1pDcHFLOFhBejB1aXAzS0lYZ2FISHdUTk1KUFZ4WlZ3MldD?=
 =?utf-8?B?TjlYTjBCcWtlbS9xakN5QW1FbytsZmRzV0VDUFcyOFp6bjZ2VFl3UWNxMjIr?=
 =?utf-8?B?cXVZUXZyZzF0azYzdHgvZlNmbFpIR3Y1dVNDamkzODJVaGRuYTFkUlp3U0ZE?=
 =?utf-8?B?UVBPT25NcWRxbFVtU1hGK25EMmNkZTVyWHFvTGN5bFdxUWdPSFBOdzQ2eGN0?=
 =?utf-8?B?Z3JSdW9SQm1YMmM2RFYwaS9ybGJwby9CT3dQTzdMekFkQjVwbW9ON2N2eFY1?=
 =?utf-8?B?eWtBZ0V4SnFEajk0dFo0T3hmTC9RbE1lM3RxdG84d29PcUxaUFIxK0NFTDdK?=
 =?utf-8?B?U3k3UTUvSFVCZnRjaE5yWFl4TTNWZTdPcGJSZ1VWT0FCVEltbDRTVVZadHhX?=
 =?utf-8?B?NDkrcGdvS3J2bnFZSjl3cm1WWWRDQUh4UHBpSGdoWDlST1l6a1dBblpBK3FC?=
 =?utf-8?B?T0U5TWJzMk5aZWU2Uk9qRUcwZGR4Ni9VL2hxUisydG5rUzF1UVFmYzFoZEdD?=
 =?utf-8?B?NVhwUkR4V0JHSDBEQ2pMbGdHeEJzaGFXSTJxejB5c1owaHJsb0pwM0x0VDkv?=
 =?utf-8?B?L3oyQ1o4N3pSVE1icWtNUUR6SWpvYkVYemwveXkwaEdrNzJZMkJ6T1JtSkhm?=
 =?utf-8?B?MU1Na08xSFU0a0tTNGczSVZrbHJFaFdKYXV2UUQrdDNkQ09JV0pGOTFTSHRh?=
 =?utf-8?B?UHppSHRtVjZXWUlWM1hjd2IxdkxPVDNiQ2Q0dXp6bHRDTHBUaGpySEFUVlNF?=
 =?utf-8?B?c0tTdFVsMFVkUkl5eGdzdG4yVnpvcEg4V0RQR0tPWXBidmwvYkdVcWExakc0?=
 =?utf-8?B?NEFZWnp2QSsxUkF2Tmpuc0ZraFhSUEJCY3BIV3hVZWIwRWQ3MnN1MEVaZTM2?=
 =?utf-8?B?dythZ0FySW00REZJSmlxKzlEMHR6ejUwek8rQ0ZtSnhaR3NzNTB1RXZnS0dw?=
 =?utf-8?B?Rkl1aHdlRmNTQXNldUJIRkRTOWJuS3N1L3JML2F4RWFFc3h4U0IzS2VMR2Ny?=
 =?utf-8?B?d1VQQ3NaaHNucXY0RDBHK3RyRldvVXBEOHhvbjM3UHhyelpXa2pHc3E1cTdq?=
 =?utf-8?B?SG5sd0c5bDNUQk4vKzdDR3g2V2ducFRRVjFLS0JPeExkM0lMQmVWQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfbec4d-1717-4692-d4f2-08de5da45b4d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:02:42.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I/pruGbDu1CLc+dZOvnAbBePLsBmk4bZMt3zAkBshwQLrcSCr8/AikpXsG9LdkHbyB8s/P5QaSeQ4UdFFNPAM4jpPZ+K3zx/kM9lzpjtEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8472
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 2A49A949EC
X-Rspamd-Action: no action

On 27/01/2026 12:54 pm, Jan Beulich wrote:
> On 27.01.2026 13:29, Andrew Cooper wrote:
>> On 27/01/2026 12:09 pm, Teddy Astie wrote:
>>> Le 27/01/2026 à 12:39, Andrew Cooper a écrit :
>>>> On 27/01/2026 11:23 am, Teddy Astie wrote:
>>>>> Le 26/01/2026 à 18:56, Andrew Cooper a écrit :
>>>>>> I was hoping this to be a patch or two, but it got out of hand...
>>>>>>
>>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
>>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>>>>>
>>>>>> The branch has one extra patch to fake up the firmware settings being set to
>>>>>> Gitlab CI, not included in this series.
>>>>>>
>>>>>> Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
>>>>>> did the AMD adjustment mostly because I needed it to test the correctness of
>>>>>> the prior cleanup.
>>>>>>
>>>>>> The final 4 patches are tangential cleanup which I've kept out of the prior
>>>>>> work in case we wish to backport it.  Everything prior is relevant to
>>>>>> untangling, and mostly for the benefit of the AMD side.
>>>>>>
>>>>>> The early patches are hopefully non-controvertial.  Later patches are a little
>>>>>> more RFC, and in need of further testing.
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>> Tested on a Intel machine with "DEP" disabled, and "Require NX support"
>>>>> disabled, I get a pagefault in hpet code
>>>>  From above:
>>>>
>>>>> Julien: This ought to suitable to rebase your cleanup on to.
>>>> This is cleanup only.  I've not got the bugfixes for EFI boot yet, so
>>>> the behaviour you see is still expected for now.
>>>>
>>>> Although, thinking about it, it might be better if I try to merge the
>>>> two series, so everyone can test the end result.
>>>>
>>>> Thoughts?
>>>>
>>> +1
>>>
>>>>>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15.2.0) debug=y Tue Jan 27 12:06:46 CET 2026
>>>>>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>>>>>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>>>>>> (XEN) re-enabled NX (Execute Disable) protection
>>>>>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw 000306c3)
>>>>>> (XEN) BSP microcode revision: 0x0000001a
>>>>>> (XEN) microcode: Bad data in container
>>>>>> (XEN) Microcode: Parse error -22
>>>> As a tangent, what's going on here?
>>>>
>>>> This is the first time I've seen the error outside of my own testing.
>>>> Is it a container you expect to be good, or some leftovers on a test
>>>> machine?
>>>>
>>> I'm trying to load a Intel ucode (taken from Alpine Linux intel-ucode 
>>> package) using `ucode=intel-ucode.img` in xen.cfg (UEFI direct boot).
>>>
>>> Many distros ship microcode in a single CPIO image with e.g 
>>> "kernel/x86/microcode/GenuineIntel.bin" in it.
>> Ah, that's a known thing that doesn't work and has never been
>> addressed.  People have been complaining for years, but not on xen-devel.
>>
>> It's also the subject of a documentation fix that is still pending (and
>> now needs yet another rebase). 
>> https://lore.kernel.org/xen-devel/20251215153245.2675388-1-andrew.cooper3@citrix.com
>>
>> Now that the ucode boot module handling is clean, we can probably try
>> both a CPIO and raw probe when given a fixed module.
> What does "raw probe" here mean? "ucode=" with a proper ucode blob specified
> has always been working for me ... (In fact I don't think I ever really tried
> the "scan" approach.)

This isn't (really) about scan.

What both Arch (where I noticed this complaint first) and Alpine do is pass:

ucode=CPIO(GenuineIntel.bin, AuthenticAMD.bin)

as would otherwise be prepended to the initrd, and Xen rejects this
because it's not a valid vendor blob.

What I'm thinking of is something like this:

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9e055b6f9805..82ddb5e9a6d2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -847,6 +847,11 @@ static int __init early_microcode_load(struct boot_info *bi)
                    idx, size);
             return -ENODEV;
         }
+
+        if ( is_cpio(data) &&
+             find_cpio_data(ucode_ops.cpio_path, data, size) )
+            ...;
+
         goto found;
     }

 

where we'd accept both raw and CPIO-wrapped blobs any time we nominate
an explicit module (whether via Grub, or implicitly via EFI).

~Andrew

