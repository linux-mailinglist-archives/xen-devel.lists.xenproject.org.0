Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJRzNdO1C2q2LAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:58:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE8575DF0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312345.1582483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8mw-0000Zi-KN; Tue, 19 May 2026 00:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312345.1582483; Tue, 19 May 2026 00:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8mw-0000YD-Gf; Tue, 19 May 2026 00:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1312345;
 Tue, 19 May 2026 00:58:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wP8mu-0000Y7-N9
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:58:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP8mt-002AYR-IH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 02:58:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0bb535-5cb7-0a2a0a5109dd-0a2a4509ab56-30
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:58:20 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0bb5aa-2497-0a2a45090019-cddca520a430-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:58:19 +0200
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64IFqMkF545944; Tue, 19 May 2026 00:57:55 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h4q37ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 00:57:55 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64J0sj9s028343; Tue, 19 May 2026 00:57:54 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4e6f1a4820-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 00:57:54 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by PH0PR10MB4808.namprd10.prod.outlook.com (2603:10b6:510:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 00:57:44 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 00:57:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=u+PFvMDHJ33oo7sGA3cLlGmVs2NUml79uY9VX5VPNXc=; b=
	JIeVxkmraKwKJQi7+XjdYYzhRThW8QDwiRTMVHzas61gXSKMdZSoCFpfYZsYOmy2
	LRv3YI26KV5viYAq7GmEIIerF6+da4qjeBORnhH0ru7tx/ZZGA1gjlfEpd+akBi5
	B9kiz8hCKfDC5s8Q9qBn97qSDauxCMcKuvWXt0X0ZURcgNhXOejPckdI2lFfUs/B
	/CjVDi27lP+S98v70xllu+P9860/XPamfFxVZXUeJ/MykJN94vRbGJpJbkhZRlYa
	4wsv9YUIMKmJhAApZPoLnc6I7QishVeDyUuKF1ad0MeEGp8ERwfvVud+mGbiAcvr
	eVTAN+bwIU/4rVMTgyn/OQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYvxjLHz0pT2q1GlB5Iur0+SSs3mOds/bcF8DL80LTKP4KkQ3Zv3WO7riHP80ivS7aX8LmGTi8Gdb0OMUsz5ry85HbNFGwMICws76wD+zSDNpQ9LfXuPaOzWWvlZ5V4tjgmWB4AoRNwqL8MtvQyu/cRNGffOXy47UlUt5vfEo75nS5YcEyfJn9xMxjd4WD0KpbrfJZm+StCiEpTSyd8dv6b5WmU0q8CYyBCOJop3M2baLAItyB/W3tI9Kskv0cFUUW0yAV20ysnZY99D7AUw9++8HrP+TUNzoUHpiZS6tU6igtGGKsCJJ4cwfeSeQ2Fd/4KhTs0lhMu/nLNSjpkXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+PFvMDHJ33oo7sGA3cLlGmVs2NUml79uY9VX5VPNXc=;
 b=aM3dfNqEaF+2GaLRInOI9LI2lhsvA6DtHoR24cKSCgMiZDZHjdecPJJY/lu2a80+h7HxH5gy/I9KLx/rN9N5/zbk1dHh4s7FwIuRLaJRx03uR9+WAABvTOWbFp0f5raRmWIJ/NKPASmFEoPUOQ9MKRKOEWplFPIbXbeqwo08dFyRjjsp6OoW7hs9y6TEjh7wqENcqc5TaoOPHXKX9ek0v25KwLwHN677MxId0xImJlB7TaCSBuQa4lYS+S9M3o/5WSLver3HQ0+S0vf2HKxLjqITGzn6JOggloXRNLQavyNFHhhAQuw1PjPEzELr18RUTSapqdWMaqedVTUsdoyoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+PFvMDHJ33oo7sGA3cLlGmVs2NUml79uY9VX5VPNXc=;
 b=KWfEYmpwQB6xr2AYzGkQ5R6IKcrqJxZXI85XeWiPsDoGm4+owFJGxvxkF6X2qpqggWtMyI0o99UYmgv46CCYO0CNb1KWvGq6gYBr9NZUo8X9NVdN9hocJjIzaJhovjajMQGH///fcQmp3dXXrICdHdReiglDhddmCnXUucnQeyk=
Message-ID: <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
Date: Mon, 18 May 2026 17:57:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, x86@kernel.org,
        Marc Zyngier <maz@kernel.org>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Jack Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>,
        joe.jin@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-kselftest@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-5-dwmw2@infradead.org>
 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
 <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
Content-Language: en-US
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|PH0PR10MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: cef7396b-254b-4543-6ed1-08deb541a29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003|13003099007|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	rqfUNSh+VeRSytHR4QihiGMxjfG72XXJKuh/PI+n85pjMZHdHVWlJeXBQesQc5hKWKFHnWLXEniHZvYvDbio8tybnw0AUVyUqvhlLbWn0Z4xZj/e5hRS05bg1Bdl29rmAW9+DvA9AUSz4v1BhnbrGR22jkt/CHB2H+/hNxM1D4zbyaTi1n6dnwX/Znq02IT+wv5mtwgkzAjnnNfNVn+AW6032PPz2iK88Iyne/3Kwnud1pEQ0D1XRPiNF+hIdPFUDQsskiFuuu3eOfOxnUVJIblG5f3U4KQxnLxZ7asevMSimT2u5gNaHb3dDRucZbnzYy2MimnQyRGwRVENipUAbvV61AO7RJXUMh4AVbirSJ+2pQv7ARyf95H0nFMrY97UaWlTlvY2G1YJJWcg0P6Pkoi8u3D3muOzX9Z1r3J9pOV79JS4Kp1zpvdx2DA7k0Io2Cl7KrDOGNd5TW4SV9N47uxeMczbXt12MeZFBCcQqNMmMTiy0Xrx83P2EhkQEhC79km1eQUu0BLwz5biz2VIyDzGRguc9j/Z0hrVs6howZH5kJP8iJh9l9xL+/USvRdrb7t4GEYaGJLeM4etSHJa9kq1BCP1/wm7vs3cJO10BLv6B3aevtXiOy6aNfdmr7npOjWUKMshdQQ4iQ7aAtQGgTQv99yBuY6yKMTYckZSmnhfU3j04hQyoXJoqSpL6S/iUEnJ/BlbOoCAUgms0f6PZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003)(13003099007)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N25MUzFqMngxbVJwK1RheGR1OFZkZTd3YTI0MjB6S1dOQmh3ay9XcWVYSkt3?=
 =?utf-8?B?OVF6M09vUk5sMEFIVFJiM3p2WjJKUjVDaWc3ZzAvRGNtcXpMT1hIazN5NFV4?=
 =?utf-8?B?dTNlTC8razRXZWFFd1M4QzBONjM0aGRSdjdzMFNlSzduM0FYTXBab3psTTQ2?=
 =?utf-8?B?Lzg0YzhmR1hlYTRyTXI2VWVDekUzU3UzVmphTWk2bGY3bElxQXk1WFBsbzJy?=
 =?utf-8?B?T25URlJqemJJcnhWN0xHKy82U1A4anRNdUZCN0hMUytvVU5DbWhjTHQ0QXZ3?=
 =?utf-8?B?TlZKam5EZ2owVjRNaWlPT3pxUE5OQk1CQUdnelJmTTNNeFlMbEJ5MWRhVWVC?=
 =?utf-8?B?UkJxQWE4OEVxVDErdWRiZ1l4VlRSKzI4bHY3Nm1ZQ2N4cjBFeXgzSCszRTI5?=
 =?utf-8?B?SWx0UjFhNHk3aldZNXN2VXkvRm5JY1hieXVPbXBpbys3TXRtR1diblYzbXlG?=
 =?utf-8?B?TlRXektTL1ovYUg3NzVKaEVjQzM3SzhnaUxuTEdNU1VTTDZ0cXEvY1ZjNjZa?=
 =?utf-8?B?b0tHd0tHdTk0MTUvdmN2V3U1VFVWQWR6S3llL0YrOFZId1RRSmdPa0l0LzRh?=
 =?utf-8?B?SFhkeFFXT0RZVU50WkgzdEord1NtMzdkcXhQdUR3Y2Fka1JJdDZTMnpmaUd5?=
 =?utf-8?B?NjdscDhaTDNaSisvSFA2MEcrbkQ3TldJcTdaSXFtS3ZiNHFrbjAxS3F4VkZF?=
 =?utf-8?B?MUVtNXJXMjhMaU4rUmhEaTNicGdGU3MxRklVbzZkZFJ6SERRZU9vVlpFVTR4?=
 =?utf-8?B?QlZTa0d0TkRSQ0RFbDEveXFyOVYwSlBLN1JjcDJTOVlnVHBRTkZNaGFSbGcz?=
 =?utf-8?B?R2ViVFJkWTQreFh4ZFpUdFljb0tmTzdxa01ucnpZK1N2VERXUmR3OU1qZlhW?=
 =?utf-8?B?d0V0QUNKWkQzelVoSmpTd2I4QzRoY0R3RTlXQjdtK3B0ZVVBRThTZU50Qm9V?=
 =?utf-8?B?RklQUHc2RGVtZDVwNFFLNlgrVkxGd3B3Rm42L2tFeWlCTTFKY3ROWUViRk5q?=
 =?utf-8?B?QnNZdkhZRk9qV2tydXFUV0svNmhzeTlFVEdRYTl2bXNhcHcwQ3pLdXNnK2RM?=
 =?utf-8?B?WjFQTEh2WWdsN1lpNEVycGwrSVp4eStlMW9RYUt3cW4wZGZpRlF4S1R0Kzkx?=
 =?utf-8?B?UTRHT29yMFJ4elRJbWlMV21TS2EvOStteWc3QkRuN3dKQm1FNDRuSzlzcmpk?=
 =?utf-8?B?NXF2QnVsMjRDWkNla0dEME9DM0FXZ2NXVlRLRDhBMGRJRldodVlKRk1Nb005?=
 =?utf-8?B?S1RueEhBT2lMWjh0N2tVKzdBZlFVNm44OWpZTTh2REwyMDB5QzBKbFhUS1BO?=
 =?utf-8?B?N0R3V0JtOTJ1SkNscHVybWRlaHQvUVZSUllGSFhIZW4xTDZmczcxajNoODJq?=
 =?utf-8?B?VFVqaXJUM1dLaHkvVUErTzdaUXhKLzNwQXJIcndmbjkxL3lJZm9DaGd5bTlk?=
 =?utf-8?B?NkVMdTFkRitTOW05QlkrUmRBd01obCtBMVBWeTdWczl0Q1J6U3ZZMEZtcDlN?=
 =?utf-8?B?R2lhUzJkQ1FndnBtWmlTYkJVRDlPdm9DdFhJb3h4VUo1eGpYNVZlWlZJc1Bs?=
 =?utf-8?B?dWJYRlhyT1R2SVNvWFhubzlGalNCOWtKdVYzRDdkRGJPVlpXanMzbENFU09S?=
 =?utf-8?B?MzRtNkNyWG9sTExNaUNWbjNuV1JOTEd1aEM4MjlJc01YYjVucFlCdGN6TGNO?=
 =?utf-8?B?WVZ1OGpoVWlzVE9oWmNCT0d4NEFHeWd6eVpSZDVPM1VXeUwyWWZiNXBJa0dF?=
 =?utf-8?B?UEJ0VXExQm1FQnEyd2hyWlpRZXVsODdJS1R1V3RjVVdjMjByMEYvSWhzM3Bp?=
 =?utf-8?B?MjZOZWpkYUpsOENTUW1KZkp3TnYvekhVK0ZUYUpOMDZ3UlFyQzhST1JrZC91?=
 =?utf-8?B?SlRzRTR3cjdPSDB6UHVmbEExWnVRekVIYUQ5K01GQXJydjBRUERlSUlvYldr?=
 =?utf-8?B?QXZiaVU2VE9DOEV4a3Bxa1V6N3FKMTRLUzZBVWJ3L0ppQmxQUXBwbVJLWVVM?=
 =?utf-8?B?SndtZzlaSnAydFlvcUlNdUkzMlkxOThxREpqRHN1NmRDUlk3czdnQy9zSHlJ?=
 =?utf-8?B?Q0ZxMDJBMDBYaEJ6eklteFkzb25tVlVVQmtLWVNFR0VLVmZNRC9CVS96TzBw?=
 =?utf-8?B?aGxwUFhHYmFVOEwyV1NSbUJVSFhFZnU2dm5LNDh3ckpnQWVDYkJKQ0srL2VF?=
 =?utf-8?B?OTQ4ZTJOZXhoRWx2SWEvSE85YVIxd2JCMm1DSC9nZDRVRzFRQjBJaTI1SjJD?=
 =?utf-8?B?QlBPVHRkVlh0WUMrUG1QYjF3eFBLT2lrdWVjUlNnTkZ5ejlVQ1laeWhTN1hR?=
 =?utf-8?B?bzdydkR4MXl1L3p2aG9ETjRHZmoyTS9VeWtPRHREdVkxMDJ4TDhUQT09?=
X-Exchange-RoutingPolicyChecked:
	VSRczNI50qGl0t7ppFFJT9VSU1Z1EDiHIoLfTjdRidhWfHRscuuMr5FZhYM15qIcX6w3Mgm4vxZaKNSP/ib+Iul1Pu5lD7tmxUC0EzKHEzCNrZrEwrBY3x2lcniaxqWBbLIlRFgF/2W9t1EMm3JUwbkGsCh9iaCHtLOuiyT3kkhLkt8io64Hm/+65cm5kr8MEFIj6GpNJ5kodlJNaGdm+wMcuxYs0yDSrkoYp8Bjwyy2st/OenT7FoI9LlNkZwjagMv+IlCek7sagfv3hzW4s3aYMdNA+0D0l+bUgagjMTEbORLkabcmacgieiX412d8as9dFTmICxehOIJh1FqFIw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QS42RhmHIkZtk1Llb5kxv59L62liBw7TjNvOz9IiCZRKDJvHqbEcompQ6l3nZHNz2c+e+tZI+2sh0xpasekdlzy+1cwx1JbnBZpFiAs4LESptgkNMnQ8okZlw3v2a0rCvP1ufE8oCnvv/vcaPbkQiErFdhTcEx0NMMqF02r0U9c4+QxvyhTqbZq4mbK9/yn/gAFZlTx0dDRV237waRc9vI6fxznQzd8FomZQS+8nLKLShZJVK/V7AhJnCn1j6ZOtJ9qqMsd0VJc2w/jj/FYaVgfsRqdvC+auCO7m1Kdhro7PIjzSBBVacMcGeRJmcMlnLG0YpSmDX26jvqY7KFwTgan0xquFM6C2ow7xSYV/JSPyFTEzSJC/CUaUTAfUkBw/ba/oKD57jh+4AOEmZIh/YAvvofU4AKWbJoMmTEM4++VE1sLRHaLYbtb1mCn5//by7jmrmpak2GyWVRdc93JytGVi93ppvM+3zN67QnmmeXrOl9vLNWmlt2hCsfMKpqeOFFeL+FYZchHpNi6kw+1HHVtLszyFwtVLxddf9nxP7WhtwOy+//Z4i3NVM+MVfggMMOaFQsJiV1eaxnCWwebR/zLywPBVDzepnNu5qkQcpu4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef7396b-254b-4543-6ed1-08deb541a29e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 00:57:44.5580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOPiuUj3TuMvYnGrB0hM7c3l3wTYan25foTD2i6GkHYSIk9arQ1+CA28dWYHliMJN919r3Me0vNJLmPPIMiSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605190006
X-Authority-Analysis: v=2.4 cv=NdnWEWD4 c=1 sm=1 tr=0 ts=6a0bb593 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=vggBfdFIAAAA:8 a=DIwNPwYT3k4F1lwTFE8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ZPc75IED0VObkGZl2k_c21ZY4S-pCRIs
X-Proofpoint-ORIG-GUID: ZPc75IED0VObkGZl2k_c21ZY4S-pCRIs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwNSBTYWx0ZWRfX8M1sB+19sih4
 QZUxBR2UBp7LQ8aw+yGXvxAnVTQ1otpufWml3BbWG6x3+bO3P/DtzUeJHzISCHSAaYJsYvKkoiM
 RzREnjNYqk//9P6mGrM1JhfTfSu6OCbs8tZeLMd1/kN6oMYMWOjFKbBccijTHTEKsOKbwhzEon0
 90+vzzeX2vmOuFt0pH19hIt9Xcp+O5UzkqsESAGlpUFfTWcbgtX3TNw9uIezZv3CnK36jpS2S5R
 ieEfPFg97DP2h3l5DXcI5FvV4bGaVyC17QtcuIxhE/CapLiFWeGxG8hXrHyP46AtJYi9jPpI+R3
 8tF5bXON9G1nWV0Xwd2/ZQc2zfqhmF86zErGk6g3hin5gwcLHVsW1e7C+qTpBoeYac6vqS3oOWK
 PD9cOO05h1o/EzO5IRA5BomaDbVwjRPmoHoCMsnwQIPl306XanCsGjyFjRC1UhcxO6Nqf/KQLsA
 7i5gpv8Kbu7YnArm6Yg==
X-purgate-ID: tlsNG-bad1c0/1779152300-40B60A53-813BB41D/0/0
X-purgate-type: clean
X-purgate-size: 11000
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 08CE8575DF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026-05-18 1:48 AM, David Woodhouse wrote:
> On Mon, 2026-05-18 at 00:52 -0700, Dongli Zhang wrote:
>> On 5/9/26 3:46 PM, David Woodhouse wrote:
> 
> Huh, I didn't write that then; it isn't September yet. Did you mean
> 2026-05-09? We aren't all in the US... 
> 
> Strictly speaking, you just misattributed a quote of mine, which is
> very poor form :)
> 
> What mailer are you using? Can it be fixed?

Thunderbird.

I have fixed the Thunderbird configuration. Does it look better to you?

> 
>>> From: Jack Allister <jalliste@amazon.com>
>>>
>>> Where kvm->arch.use_master_clock is false (because the host TSC is
>>> unreliable, or the guest TSCs are configured strangely), the KVM clock
>>> is *not* defined as a function of the guest TSC so KVM_GET_CLOCK_GUEST
>>> returns an error. In this case, as documented, userspace shall use the
>>> legacy KVM_GET_CLOCK ioctl. The loss of precision is acceptable in this
>>
>> The description here confused me a little. It sounds like userspace should call
>> KVM_SET_CLOCK if KVM_SET_CLOCK_GUEST fails. However, I assume it actually means
>> that userspace should do nothing extra if KVM_SET_CLOCK_GUEST fails, and simply
>> rely on the prior KVM_SET_CLOCK and KVM_VCPU_TSC_OFFSET workflow described in
>> patch 07. Is that correct?
> 
> Yes. If KVM_SET_CLOCK_GUEST doesn't work (which might be because
> KVM_GET_CLOCK_GUEST didn't work so userspace doesn't have the data in
> the first place, or because the actual ioctl returns failure), then
> userspace should rely on the old method using KVM_SET_CLOCK imprecisely
> instead. That includes on a migration from an older kernel that *lacks*
> KVM_GET_CLOCK_GUEST, of course.
> 
> I don't think it strictly matters whether userspace does KVM_SET_CLOCK
> first, then *tries* KVM_SET_CLOCK_GUEST, or whether it tries
> KVM_SET_CLOCK_GUEST and then only calls KVM_SET_CLOCK on failure? I'd
> probably be inclined not to use KVM_SET_CLOCK at all unless it is known
> to be needed?

I really appreciate guidelines like the ones below.

https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org

Assuming I am a user of the new API, I feel confused about whether the goal is
to replace KVM_SET_CLOCK with KVM_SET_CLOCK_GUEST, or whether the latter is
meant to supplement the former.


If we are going to use KVM_SET_CLOCK_GUEST when KVM_SET_CLOCK is not needed, I
would appreciate it if the API could carry more data in addition to struct
pvclock_vcpu_time_info.

+#define KVM_SET_CLOCK_GUEST    _IOW(KVMIO, 0xd6, struct pvclock_vcpu_time_info)
+#define KVM_GET_CLOCK_GUEST    _IOR(KVMIO, 0xd7, struct pvclock_vcpu_time_info)


In the future, if we need to carry additional data, we could simply reuse the
padding fields instead of introducing another KVM_SET_CLOCK_GUEST2.

The following is an example of how additional data could be carried.

KVM: x86: Report host tsc and realtime values in KVM_GET_CLOCK
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c68dc1b577eabd5605c6c7c08f3e07ae18d30d5d


So far, I believe this guideline resolves most of my concerns.

https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org

> 
>>> +4.145 KVM_GET_CLOCK_GUEST
>>> +----------------------------
>>> +
>>> +:Capability: none
>>> +:Architectures: x86_64
>>> +:Type: vcpu ioctl
>>> +:Parameters: struct pvclock_vcpu_time_info (out)
>>> +:Returns: 0 on success, <0 on error
>>> +
>>> +Retrieves the current time information structure used for KVM/PV clocks,
>>> +in precisely the form advertised to the guest vCPU, which gives parameters
>>> +for a direct conversion from a guest TSC value to nanoseconds.
>>> +
>>> +When the KVM clock is not in "master clock" mode, for example because the
>>> +host TSC is unreliable or the guest TSCs are oddly configured, the KVM clock
>>> +is actually defined by the host CLOCK_MONOTONIC_RAW instead of the guest TSC.
>>> +In this case, the KVM_GET_CLOCK_GUEST ioctl returns -EINVAL.
>>> +
>>> +4.146 KVM_SET_CLOCK_GUEST
>>> +----------------------------
>>> +
>>> +:Capability: none
>>
>> Do we need a KVM_CHECK_EXTENSION capability for this? If userspace wants to
>> support the new API, should it detect availability via KVM_CHECK_EXTENSION, or
>> simply try the ioctl and handle failure?
> 
> That might be conventional, I suppose. But I suspect Jack's thinking
> was that userspace is going to have to *try* it anyway, and still might
> have to fall back to what KVM_SET_CLOCK can manage, so userspace
> probably wouldn't even bother to check that capability; it doesn't
> matter.
> 
> Since then, we've added some more attributes in this series though, and
> it probably is worth adding a cap which advertises them *all*?
> Something like KVM_CAP_CLOCK_PRECISION_API?

From an API user's perspective, userspace may need to distinguish between an API
failure and the API not being available.

I don't see any existing "Capability: none" entries in
Documentation/virt/kvm/api.rst.

> 
>>> +#ifdef CONFIG_X86_64
>>> +static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
>>> +{
>>> +	struct pvclock_vcpu_time_info hv_clock = {};
>>> +	struct kvm_vcpu_arch *vcpu = &v->arch;
>>> +	struct kvm_arch *ka = &v->kvm->arch;
>>> +	unsigned int seq;
>>> +
>>> +	/*
>>> +	 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
>>> +	 * has never been generated at all, call kvm_guest_time_update().
>>> +	 */
>>> +	if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
>>
>> This was flagged by AI, and I am still checking whether it is a real issue.
>>
>> What happens if KVM_REQ_MASTERCLOCK_UPDATE and KVM_REQ_CLOCK_UPDATE are both
>> pending?
>>
>> From my perspective, I am also curious how we should reason about this in other
>> scenarios in the future. Specifically, when do we need to process
>> KVM_REQ_MASTERCLOCK_UPDATE before KVM_REQ_CLOCK_UPDATE, and when is it
>> acceptable not to? I noticed that kvm_cpuid() already processes only
>> KVM_REQ_CLOCK_UPDATE.
> 
> The way I've been thinking about it — and I'm only two cups of coffee
> into Monday so take those words literally and don't think of them as
> British understatement of something I believe is absolute truth — is
> that MASTERCLOCK_UPDATE is updating the actual clock for the whole VM,
> while CLOCK_UPDATE is about *putting* that information into the per-
> vCPU pvclock structures.
> 
> So after a MASTERCLOCK_UPDATE, we need to do a CLOCK_UPDATE on all
> vCPUs to disseminate the result. Which means that if CLOCK_UPDATE is
> already pending before a MASTERCLOCK_UPDATE, it's probably redundant
> and might as well be cleared because it's only going to get set *again*
> in kvm_end_pvclock_update()? 

Another scenario is when only MASTERCLOCK_UPDATE is pending and there is no
pending CLOCK_UPDATE.

In this scenario, is it fine to skip processing MASTERCLOCK_UPDATE before saving
pvclock_vcpu_time_info?

This should be a very rare scenario. Although it is not mandatory, I think most
users call these APIs only when the VM is already stopped. I am just curious how
I should handle this in the future if I am implementing similar code, that is,
processing a pending request outside vcpu_enter_guest().

> 
> 
>>> +	/*
>>> +	 * Calculate the guest TSC at the new reference point, and the
>>> +	 * corresponding KVM clock value according to user_hv_clock.
>>> +	 * Adjust kvmclock_offset so both definitions agree.
>>> +	 */
>>> +	guest_tsc = kvm_read_l1_tsc(v, ka->master_cycle_now);
>>> +	user_clk_ns = __pvclock_read_cycles(&user_hv_clock, guest_tsc);
>>> +	ka->kvmclock_offset = user_clk_ns - ka->master_kernel_ns;
>>
>> I used to explore adjusting ka->kvmclock_offset in KVM_SET_CLOCK based on the
>> old hv_clock and the new hv_clock long time ago. At that time, my concern was
>> what would happen if userspace provided bogus values. Theoretically, this is
>> possible with any ioctl. My concern may be unnecessary.
>>
>> Would it be helpful to validate that the delta is within a reasonable range,
>> e.g. that the drift can never be more than five minutes (forward or backward)?
> 
> Setting confidential guests aside, which have their own way of trusting
> the TSC and should never even *consider* using kvmclock, surely this is
> supposed to be *entirely* under the control of the VMM? The kernel has
> no business deciding what is 'bogus'?

Yes, I both think and agree that this is supposed to be entirely under the
control of the VMM.

Sometimes security researchers use fuzzing tools to interact with APIs in an
attempt to leak data or crash the hypervisor in order to turn it into a CVE. My
understanding is that, in the worst-case scenario here, the guest clock would
simply get stuck.

> 
> If a guest has been running for months on a previous host and is
> migrated to a new host, don't we expect that the KVM clock of the new
> VM on the new host is tweaked from its default near-zero after
> creation, to some large amount?
> 

Regarding live migration, my own investigation does not show a proportional
relationship between VM uptime and the amount of drift.

Just taking QEMU + KVM as an example: suppose TSC scaling is inactive, the
amount of drift does not depend on how long the VM has been running before live
migration.

Instead, it depends on the delta between when we call MSR_IA32_TSC and
KVM_GET_CLOCK, and between MSR_IA32_TSC and KVM_SET_CLOCK.

The guest TSC stops at P1 and resumes at P3.
The kvmclock stops at P2 and resumes at P4.

We expect P1 == P2 and P3 == P4.

On source host.

- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=0 ===> P1
- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=1
- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=2
- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=3
- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=4
... ...
- kvm_get_msr_common(MSR_IA32_TSC) for vCPU=N
- KVM_GET_CLOCK                               ===> P2

On target host.

- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=1 ===> P3
- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=2
- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=3
- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=4
- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=5
... ...
- kvm_set_msr_common(MSR_IA32_TSC) for vCPU=N
- KVM_SET_CLOCK                               ====> P4


Here is my equiation to predict the drift.

T1_ns  = P2 - P1 (nanoseconds)
T2_tsc = P4 - P3 (cycles)
T2_ns  = pvclock_scale_delta(T2_tsc,
                             old_hv_clock_src.tsc_to_system_mul,
                             old_hv_clock_src.tsc_shift)

if (T2_ns > T1_ns)
    backward drift: T2_ns - T1_ns
else if (T1_ns > T2_ns)
    forward drift: T1_ns - T2_ns


Theoretically, if P1 == P2 and P3 == P4, we won't encounter any kvm-clock drift.

Thank you very much!

Dongli Zhang

