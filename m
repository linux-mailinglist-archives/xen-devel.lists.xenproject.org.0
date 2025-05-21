Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7DABF363
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 13:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991735.1375559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHi0m-0002wN-62; Wed, 21 May 2025 11:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991735.1375559; Wed, 21 May 2025 11:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHi0m-0002tl-34; Wed, 21 May 2025 11:53:28 +0000
Received: by outflank-mailman (input) for mailman id 991735;
 Wed, 21 May 2025 11:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEeW=YF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHi0k-0002tf-Jo
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 11:53:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f403:260e::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33016286-363a-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 13:53:24 +0200 (CEST)
Received: from AM0PR02CA0214.eurprd02.prod.outlook.com (2603:10a6:20b:28f::21)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 11:53:21 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::a1) by AM0PR02CA0214.outlook.office365.com
 (2603:10a6:20b:28f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Wed,
 21 May 2025 11:53:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 11:53:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9411.eurprd08.prod.outlook.com (2603:10a6:20b:5aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 11:52:48 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 11:52:47 +0000
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
X-Inumbo-ID: 33016286-363a-11f0-a2fa-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QMZL+6Dq0oSgb/CVa2t740rt+ojhWr7Mxdfh/uEjq7ylmlk9e+IpzsKegeESFIrGuP18/YZhejs2Fa9iQlGx5ytynnaVz3w80AFlaW9EA+/Z9BWOMLRpE8VwDM3EStG9KrGJp5XjmPH3HwVFf1xYlyi6gRUwIeDglXSPAqWL066KDoR0iOtKYQJACXP6BBeD+gl+C52xeK6DJ9jtbRsGjaCElMw2tq9omEyyLfJeF4t+jrdn2IzRa3Cm7azezmVttC8MA4O7gXkUhqFo4MEUeqfYGRXq+5RMu6f6uDed4hBmgKWEKzExVfjlV7/xgxF0NqIs4MOt+lG9NZaOBW0lqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ2kmbFCMaxI6Hmq2bPgpDH8KVgS9owSxdy9Y1yT+g8=;
 b=soy44w5OwKX6ieUH8n9nt4NTS3Wrj/TAzfL/fStipU4O3kz0Nsgxa/7S5f6EDF7oHUdYL4VkKREiEojEQqe1dRK44ROjgtAXLXp1NeAO03Bdtqmddotha6YAzdG3EzhLzxK3Kyyl65PQSmuhLPJk6vnXINgvmH61MxfLJdFVowRGdM6xGhgswTQY+GDfzvHEh5eZETDLmGB6QqWByksGdesKK6bBrNbjbKW4Jgx51PoYzSSxNghyf+EnKspxUDegDzFapj+mJjQp9IS+RPX/P6UgEEJtOaR0PZgyjENq9k7n7+OvX8tqId9SDilWhrabR3ZcR93g/UDzsBWkhZ4oBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ2kmbFCMaxI6Hmq2bPgpDH8KVgS9owSxdy9Y1yT+g8=;
 b=Zskf+NDQ/jRtMz4XTPdPPK+WN3PA8BvOGje2WIFeW0C/5CIkY5cvjrpptIaKuY8cUFvpbcmll//i4d6vktyyLZViXKPKLc4YfroG9E0uZozN2v0hccKMpVzHr7444Wzn8SysMattyof86LJ0sKJogn7a3vj8UqOYp1v8WTcjBv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdEyE101PUZlwwD2MhAaPWL/gmyGAByfdAfcSIxB7QX/P87R7AtMVasc+HhNBGfpU5AKHwMJ3iPPsg2MypKZqS/ETC5pYrET3y7Pnz6zadIZjZj8rzu21VD50CpXO0ALy1VwKS6HN61nJysoDU4p0HhACKRDjInTWwdPi9faYL4yPrZLpDqlZjB0dAY55AiiKKQz+bqIfHWbnlTO+XlAq9JZsmNCR/w1Da8UoVNSPvk8GoqzbcXFf2hW8/Qkh21k2KK+jwlDygrHrTE85Nb9LnC9ZjqhGre3Ji339A3n095iJ0QeieJn5AkrFjLbyZx7zUnycB6ZVrbDDecwEwuRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ2kmbFCMaxI6Hmq2bPgpDH8KVgS9owSxdy9Y1yT+g8=;
 b=ikXVCyvK6pLGgjnLt8T7SkLO87w8NivY4m8o7Gd4ZqfqvbGQ4jYBeKIo5tXS6rGC2rtjDeTtgRz+2TAH5prkCK/u0Z4aGRHFiiM0pwiFJ2kIUr7QBV9ZUL3z2b5qisDY1FNgcfv4mk38AXYweE+RVOHCHLcuF24BhWbu5p6vNwKjEoWJl+/gW+Dj9iFIF2h/h9x5jUBob8yZ3DFLdJAW2rzoyBJLE/l1JRBUmHmLnp3HNgKb5Ff9RhKm+gGthUYcvnbosppybfFImHH8GzTw+JYsTq8GYdgXyg75aPpvU0Wld2gwebQJJOUpEvN/AdAVGke7vBt2/AAk+n7Wmb1v+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ2kmbFCMaxI6Hmq2bPgpDH8KVgS9owSxdy9Y1yT+g8=;
 b=Zskf+NDQ/jRtMz4XTPdPPK+WN3PA8BvOGje2WIFeW0C/5CIkY5cvjrpptIaKuY8cUFvpbcmll//i4d6vktyyLZViXKPKLc4YfroG9E0uZozN2v0hccKMpVzHr7444Wzn8SysMattyof86LJ0sKJogn7a3vj8UqOYp1v8WTcjBv0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen/arm: Virtio-PCI for dom0less on ARM
Thread-Topic: xen/arm: Virtio-PCI for dom0less on ARM
Thread-Index: AQHbyV3Hle+PZAZfxkivw95jajJbObPc+vWA
Date: Wed, 21 May 2025 11:52:47 +0000
Message-ID: <904E8858-E310-4D3E-A1AB-352D43C4EDC5@arm.com>
References: <aCw3ddB2CZUeEtyF@zapote>
In-Reply-To: <aCw3ddB2CZUeEtyF@zapote>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9411:EE_|AMS0EPF000001AA:EE_|DB3PR08MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1a1cf5-578c-4022-c8e6-08dd985e153f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RFRRdVA1b2hUTUZBQUZPYnRMUXljNU5yenUvSGNRRlpqemZXNVpqRVFYaTFJ?=
 =?utf-8?B?NkhEeW4zaysxdzM1ZjM3QllxeitxQnZvbERWb3pzZ3FnNlQ2YnoxUkhjLzY0?=
 =?utf-8?B?dTIwM25PYUxITmxlVjhUNjl2dDkxWWF1dWtpVVdpNDRwb3FPNHhzNVFPZS8z?=
 =?utf-8?B?dk1wb3hZMWMzK1BVOENmc3BaVHNKVzVqMXIwK3ArREtUSlRRajIvVGRKeVNu?=
 =?utf-8?B?NUh4cmNwYzlFUnZLTmFxSkZSVERMREdobnBaWERvcDJremJVaUIyRWsranpa?=
 =?utf-8?B?RldyeTB2TDhPMkFSNlp6ZEtJcjZIcm5SZkRwUU1CVHFHWGo1aVFuYXRVbEpk?=
 =?utf-8?B?MHp6cVBVZkhUYjBLMWY5NThFUDVuVGJBdGtxYm9RcFdTd3hJRVdCdlMxVHJ4?=
 =?utf-8?B?OVFhZGxhbjF6M0ZmQ1JXdzVCSnZLYzZpa1lqcGcvVmwyQ0dYYW1xNk9IRVFX?=
 =?utf-8?B?RDRWTW4wOGtlcDVibHFvZFBoZWtTYjhTTXN0R0xJUEZXejVYcDNvUm5WbjBV?=
 =?utf-8?B?dXpWVFI2YU1IMlJweVc5VytUTklNNzNjRDNYOW9iYTlPekRmTkh1REkxZCtY?=
 =?utf-8?B?aDRlWURGQmg5MnRtMi9HVDlXbXlhdUFhMklzbHlnakNDdERjRGx6Q3duZ0Nn?=
 =?utf-8?B?SCttd2hwVFVlbjVNWXFtMlUwYWR3QW4xUTFHMWhkVkNtcnJ5QTFDMHpWaTBk?=
 =?utf-8?B?VCt1RTBQMXFtOWJtZm1vY25kZUVJLzUwdXNRNmZ4RUhkbXhreFVFZkZMdWJO?=
 =?utf-8?B?QjBKRjFNYmRBRGVRdmN4dGIwYmZVd3R2dEV2dUd6bGZ6VnAyVGlwOXcyREFx?=
 =?utf-8?B?Zm1nNHRoS1E5SXhVcFRZM1kvNmFQaCtmckFMZmZhWWJCWWlSQ2RtOEVKclht?=
 =?utf-8?B?TElpd0RQdS90NnBicTZDdy8xV0lJN3I1OFRDUStzbEg2QjFFZGt6TWlwZW54?=
 =?utf-8?B?a0FrYzM1YWJqMmtuUnlCcURWanoxWHZodDFhbnJpd1NVOFhSWXpkeG5tbXJo?=
 =?utf-8?B?YkpxNFp4bEl2T3Y0Sjk1dVhtcmovVFdWTkFteWhRR0s0RWhKbGpBc05zMDlx?=
 =?utf-8?B?YUdTNFMvVFRqT0czNmgvMG1DdTZSOE94eFM4Mm5YcHM2QS9hZmllUDhLUGQv?=
 =?utf-8?B?SjdLbUpUMmt4NnpaNmtCU1VoMVE1d1I0aDhEckhMRjdPdWJqTkl6OXJBcXZE?=
 =?utf-8?B?dEcwY3ZaZU9zOVVoTjREWnlubW5nMzg4TW1YS2Q4ZWs2cmZYZjQwZ082dFhw?=
 =?utf-8?B?VHdsckVodWNjb0FZdDUxaVMrUlpnZEFMcmp4NFRHU20yY0M3TERFRmd4KzNa?=
 =?utf-8?B?QzE2bE5FMHlLNkJyTVZFUUt2UkZUNzNGL3JoS1lXQ05lR2tHZWxKSFEvRlh6?=
 =?utf-8?B?MjQxQWpFZVA2U1dNMjRPem9Vamg0WUV0OTh5eldzVHBmZTRmTzNxaEk4K2ZQ?=
 =?utf-8?B?aGlrY3lES2lYeHlpN3VYSjR6ZGNwaUdTbzdRODVnL0hnMk1FTm44UjdQRENQ?=
 =?utf-8?B?d3gyeTRNVHlDek1DWjJjU3JzVDUwOVhmK1FaK2VxZHZacld3VFRQeWdRVkUv?=
 =?utf-8?B?Tk9Wb2xkS2Y1aVZHZTFCc1Yrd3c5VmZ6NUR4T3RFY0dTTCs0UHNuN0VkZGdq?=
 =?utf-8?B?ejIrb3pMeXBwc1ZBaEJvTmlpMWN1U0RaTDRITCtBM05xYmFtSmNqZjZ6QnAv?=
 =?utf-8?B?c1BpbHNsYkZWdWhGTUhsei85NHBjMCtzYzU0ZmZjazg5N2M4NE1qbmVFU3lL?=
 =?utf-8?B?aVJqbGZXcCtrc0I4cHJqVWVLV2w4aGxVVHlFWEJ4M01GWHVObTdpV0Rsblps?=
 =?utf-8?B?ZDdKY1p5WTFYWGhOSWxLUVl2dWZsSUYxRTlZUTJ5TTZPc1B3NjJIUUh3TEpY?=
 =?utf-8?B?c0NZTjZROGNHV3FYUjFjd2dTNnRlSE1Zc2V4aTVTaDQzZVI4TzFuNGVJQWpQ?=
 =?utf-8?B?UnFqNXdoQ054TUNrcWl2Smx5cEMzTk0xTklxRGcwdmFhaXMrWmt5YjhYSkZG?=
 =?utf-8?Q?F1Iu4sO6y7JLZ/1diaOHg3cDkcqINY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3376A14DCC58343BEFA56896D817DA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9411
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2aef9a43-b662-49e1-e8ae-08dd985e01ac
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3B4RE1MaVNHaVJUcFRRRkdWY291WWh4aWRneUIvSmZuQ0dZc1VKOU95U1ZK?=
 =?utf-8?B?MXlEc3cwampaYnpPWlA2QStQVjNrNTJwcEQzYkVOUjFRRlRLejViSEZJTUdq?=
 =?utf-8?B?dmVUdVZzejZSK0QxU0lPVkFjOGVhMmFldVo5eXA4azZPVTZpdWhnaHVDSkZK?=
 =?utf-8?B?NnVqNllCZmhrY25vcWRyN0tXbjl3NUp0SStaQWg5RzVMODhiYitlTFVWYTJ0?=
 =?utf-8?B?MFRkYWRiRFdWbkxNZjI2RlNWbmhqeUlCYURYRFBaUTRjZCtVcUVEazlDcFZa?=
 =?utf-8?B?MzI0anR2WlMvcjdyOFFWZDcxSTZpWXFOVXBPKzNVdm0raklWS2NOQW1tcFBa?=
 =?utf-8?B?eGk1ZUU0VW9YMFNiVFZPL3BFbkVMdWlZMUtwbmVCSUU4R1dqbWs1N3hTUElU?=
 =?utf-8?B?QU84YXI5SHRuOUxoaFM5S1JRMHA4OHNmQXZ1aVhObFdKZFo0d2w4REI2dkNT?=
 =?utf-8?B?dFJBMnlLc1NCWkNLR2xya2MzaWl0REhnSW9Ra2E1b2xBdGFpYlVndnBjME1p?=
 =?utf-8?B?M2tZdHFqUjNDVHFJYVJYSGJicEI3SGhwVFhHYW5TdjhHRHhYc08vQ0c4VVNu?=
 =?utf-8?B?ckRVYUt3Wk1TNFYway9nVjUvZVZHLzg3WVNrdE9nMW1rK0JyODNWNDBLVlh1?=
 =?utf-8?B?TnA4Y1NxbFNLT3JCT0J1ZjByWHFDMWt4WWF3ZHF2NHdSa3dwbGJ6TU4waWlE?=
 =?utf-8?B?ZEpYNmVKL1lGbC94NW0rYyt0bUN2N1BjckVma2RlVm9yUDZJWWl0N2ExTFBJ?=
 =?utf-8?B?SDlxWHdzV0lVMnBENXNndVlROTlhM0ZqQStIUWQ3ZWJ1QWZVNmZTOFR2R09Y?=
 =?utf-8?B?ZVZMTy9TYU0vUFVmOHdZSWNvbkQ3OUlNZ0hnbDAwKzdkVHQvOFpkck40UWJN?=
 =?utf-8?B?K04rSFJzQU1BMlBOd0FQbHZFSlhIbDNnZVJOQnNjTEVySjFyM080TXdsNlB1?=
 =?utf-8?B?SVdsK1JwVjJaWFVvZU1aRXFWdzVmTzBkOFNVaHE0SUx2bVlWbUZyNEJWNVJk?=
 =?utf-8?B?b2MxN2p3WStrblFKemVwempONlFRNHNHZ0dScE9TT1QxK0tCUGVidzgyWkRG?=
 =?utf-8?B?cDVWdG9JcVJKRHJRd2cwaytHZHlXVnFscnBTWWo5Y0ZVR2phVVNVZCsyRU03?=
 =?utf-8?B?RUNLUmw4R280YVo4bFJZVW93a1dIYzlVMGZVQ3FlWkZTSUtCaDg1a0xoeFNX?=
 =?utf-8?B?TE5ZODlHdFVZbW1saGZYcC8xQUhVblltVklSQmkvbXRRTWJ2NFB2SFlNWjdW?=
 =?utf-8?B?ckF2SXlNNFVuYWV5V0xLTEttSGVYeEtUSzBwbzJxUTZaR0lkVCtmZXZvU2ha?=
 =?utf-8?B?cGxqbThOWk9LMWVXWVR1WmZiaWp6R0JORi8xbUhjR0F1dXNDMDAvMERGVytK?=
 =?utf-8?B?RUtoOFBwelZjRG5YTkVCQ2ZEVFlCbHNwamszeUlpSkQwNkVLcVZpU0J2c0Z5?=
 =?utf-8?B?UURCT1FKMmNpdXV1RFR5SE1Ed0N3cC9xSGdCMDU4Y1RsbDlocXYxK2VFQ3BW?=
 =?utf-8?B?VVZ2cjRoZFNoRk5lMC8waUFJL204TE1LWEZHWU1YUWk1LzBsM1dTc1pLbWVP?=
 =?utf-8?B?U2tmeWR0c2VVWlRvbzRLNWJ0eitqQW13SnBVekZSZDNWYjRTUTRVVUpHcUph?=
 =?utf-8?B?ellTa01OZGVlbXRnUXJ4cHhvN1ZlNVZvRm82eExIRHg1aWNGT2JoWXdDa3hj?=
 =?utf-8?B?QlQ3YjNQUlVNTHJ2ZVdldHJ1SUxwbU84eE92b0xvd0todWhyQ2tETzBjK09h?=
 =?utf-8?B?YmdObEcxVGFCaVNrQU1Ga0k1ZjBaQWpLenJhMlltZ2dQTm1jbzRaNEZzYS83?=
 =?utf-8?B?STRzdStRODhvVnZKWWdNaER2aUg3RVlqUFVOckJmSEJLVXVIdDFVTFdwYkNI?=
 =?utf-8?B?S2IxdUZBSUVqay8vTGZEMXJHM3FVejRublJFOU5WK3E0QmhXVDRkeUVQaWdP?=
 =?utf-8?B?VkdCV1ZrTlRCQUNHbHZhRnUwMjU1VDlJbGdmRGFwRkV5ZDB3cXlPOWk3VUU2?=
 =?utf-8?B?d1d1aUlQanY4L3B1cWJLWGlBVkdwa2NhTTRxNFhKT2NTVFE5NU9DWCt2S2x5?=
 =?utf-8?B?NDFsUTFsaTF4Tjc4ZHRXbGUrL29STHpyd3pBZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 11:53:20.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1a1cf5-578c-4022-c8e6-08dd985e153f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011

SGkgRWRnYXIsDQoNCj4gT24gMjAgTWF5IDIwMjUsIGF0IDEwOjA0LCBFZGdhciBFLiBJZ2xlc2lh
cyA8ZWRnYXIuaWdsZXNpYXNAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBhbGwsDQo+IA0KPiBG
b2xsb3dpbmcgdXAgb24gdGhlIEFSTSB2aXJ0aW8tcGNpIHNlcmllcyBJIHBvc3RlZCBhIHdoaWxl
IGJhY2sgYWdvLg0KPiANCj4gVGhlcmUgaGF2ZSBiZWVuIHNvbWUgY29uY2VybnMgYXJvdW5kIHRo
ZSBkZWxheWVkIGFuZCBzaWxlbnQgYXBwZXJhbmNlIG9mDQo+IGRldmljZXMgb24gdGhlIEVDQU0g
YXJlYS4gVGhlIHNwZWMgaXMgbm90IHN1cGVyIGNsZWFyIHdldGhlciB0aGlzIGlzIE9LIG9yDQo+
IG5vdCBidXQgSSdtIHByb3ZpZGluZyBzb21lIHJlZmVyZW5jZXMgdG8gdGhlIFBDSSBzcGVjcyBh
bmQgdG8gc29tZSByZWFsIGNhc2VzDQo+IHdoZXJlIHRoaXMgaXMgdXNlZCBmb3IgRlBHQXMuDQo+
IA0KPiBUaGVyZSBhcmUgdHdvIG9wdGlvbnMgaG93IHRvIGltcGxlbWVudCB2aXJ0aW8tcGNpIHRo
YXQgd2UndmUgZGlzY3Vzc2VkOg0KPiAxLiBWUENJICsgSU9SRVENCj4gMi4gSU9SRVEgb25seQ0K
PiANCj4gVGhlcmUgYXJlIHByb3MgYW5kIGNvbnMgd2l0aCBib3RoLiBGb3IgZXhhbXBsZSB3aXRo
ICMxLCBoYXMgdGhlIGJlbmVmaXQgdGhhdA0KPiB3ZSB3b3VsZCBvbmx5IGhhdmUgYSBzaW5nbGUg
UENJZSBSQyAoaW4gWGVuKSBhbmQgd2UgY291bGQgZW11bGF0ZSBhIGhvdHBsdWcNCj4gY2FwYWJs
ZSBleHBhbnNpb24gcG9ydCB3aXRoIGEgc3RhbmRhcmQgd2F5IHRvIG5vdGlmeSB3aGVuIFBDSSBk
ZXZpY2VzIHBsdWcgaW4uDQo+IEFwcHJvYWNoICMyIGhhcyB0aGUgYmVuZWZpdCB0aGF0IHRoZXJl
IGlzIChhbG1vc3QpIG5vIGFkZGl0aW9uYWwgY29tcGxleGl0eQ0KPiBvciBjb2RlIGFkZGVkIHRv
IFhlbiwgYWxtb3N0IGV2ZXJ5dGhpbmcgbGl2ZXMgb3V0c2lkZS4NCj4gSU1PLCBib3RoIG9wdGlv
bnMgaGF2ZSBtZXJpdCBhbmQgYm90aCBjb3VsZCBjby1leGlzdC4NCj4gDQo+IEZvciBkeW5hbWlj
IHhsIGZsb3dzLCBvcHRpb25zICMyIGFscmVhZHkgd29ya3Mgd2l0aG91dCBtb2RpZmljYXRpb25z
IHRvIFhlbi4NCj4gVXNlcnMgbmVlZCB0byBwYXNzIHRoZSBjb3JyZWN0IGNvbW1hbmQtbGluZSBv
cHRpb25zIHRvIFFFTVUgYW5kIGEgZGV2aWNlLXRyZWUNCj4gZnJhZ21lbnQgd2l0aCB0aGUgcGNp
LWdlbmVyaWMtZWNhbS1ob3N0IGRldmljZS4NCj4gDQo+IEZvciBzdGF0aWMgZG9tMGxlc3MgZmxv
d3MsIHdlIGNhbiBkbyB0aGUgc2FtZSBhcyBmb3IgeGwgZmxvd3MgYnV0IHdlIGhhdmUgdGhlDQo+
IGFkZGl0aW9uYWwgcHJvYmxlbSBvZiBkb21VJ3MgUENJIGJ1cyBlbnVtZXJhdGlvbiByYWNpbmcg
d2l0aCBRRU1VLg0KPiBPbiB4ODYsIHdoZW4gZG9tVSdzIGFjY2VzcyBhIG1lbW9yeSByYW5nZSB0
aGF0IGhhcyBub3QgeWV0IGdvdCBJT1JFUSdzDQo+IGNvbm5lY3RlZCB0byBpdCwgdGhlIGFjY2Vz
c2VzIHN1Y2NlZWRzIHdpdGggcmVhZHMgcmV0dXJuaW5nIDB4RkZGRkZGRkYgYW5kDQo+IHdyaXRl
cyBpZ25vcmVkLiBUaGlzIG1ha2VzIGl0IGVhc3kgZm9yIGd1ZXN0cyB0byB3YWl0IGZvciBJT1JF
USBkZXZpY2VzIHRvDQo+IHBvcCB1cCBzaW5jZSBndWVzdHMgd2lsbCBmaW5kIGFuIGVtcHR5IGJ1
cyBhbmQgY2FuIGluaXRpYXRlIGEgcmVzY2FuIGxhdGVyDQo+IHdoZW4gUUVNVSBhdHRhY2hlcy4g
T24gQVJNLCB3ZSB0cmFwIG9uIHRoZXNlIGFjY2Vzc2VzLg0KPiANCj4gSWYgd2Ugb24gQVJNIGFk
ZCBzdXBwb3J0IGZvciBNTUlPIGJhY2tncm91bmQgcmVnaW9ucyB3aXRoIGEgZGVmYXVsdCByZWFk
IHZhbHVlLA0KPiBpLmUgbW1pbyBoYW5kbGVycyB0aGF0IGhhdmUgbG93ZXIgcHJpb3JpdHkgdGhh
biBJT1JFUXMgYW5kIHRoYXQgYXJlDQo+IHJlYWQtY29uc3QgKyB3cml0ZXMtaWdub3JlZCwgd2Ug
Y291bGQgc3VwcG9ydCB0aGUgc2FtZSBmbG93IG9uIEFSTS4NCj4gVGhpcyBtYXkgYmUgZ2VuZXJh
bGx5IHVzZWZ1bCBmb3Igb3RoZXIgZGV2aWNlcyBhcyB3ZWxsIChlLmcgdmlydGlvLW1taW8gb3IN
Cj4gc29tZXRoaW5nIGVsc2UpLiBXZSBjb3VsZCBhbHNvIHVzZSB0aGlzIHRvIGRlZmVyIFBDSSBl
bnVtZXJhdGlvbi4NCj4gDQo+IFNvIHRoZSBuZXh0IHZlcnNpb25zIG9mIHRoaXMgc2VyaWVzIEkg
d2FzIHRoaW5raW5nIHRvIHJlbW92ZSB0aGUgUENJIHNwZWNpZmljcw0KPiBhbmQgaW5zdGVhZCBh
ZGQgRkRUIGJpbmRpbmdzIHRvIEFSTSBkb20wbGVzcyBlbmFibGluZyBzZXR1cCBvZiB1c2VyDQo+
IGNvbmZpZ3VyYWJsZSAoYnkgYWRkcmVzcy1yYW5nZSBhbmQgcmVhZC12YWx1ZSkgYmFja2dyb3Vu
ZCBtbWlvIHJlZ2lvbnMuDQo+IFhlbiB3b3VsZCB0aGVuIHN1cHBvcnQgb3B0aW9uICMyIHdpdGhv
dXQgYW55IFBDSSBzcGVjaWZpY3MgYWRkZWQuDQo+IA0KPiBUaG91Z2h0cz8NCg0KV2UgZGlzY3Vz
c2VkIHRoYXQgdG9nZXRoZXIgbGFzdCB3ZWVrIGFuZCBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIGFw
cHJvYWNoIGFzIGl0DQpwcmV2ZW50cyBoYXZpbmcgc29tZSAid29ya2Fyb3VuZCIgY29kZSBmb3Ig
UENJIG5vdCBmb2xsb3dpbmcgdGhlIFZpcnRpbyBzcGVjIGFuZA0KY291bGQgYWxzbyBmdWxmaWwg
c29tZSBvdGhlciB1c2UgY2FzZXMgYnkgZ2l2aW5nIGEgc29sdXRpb24gdG8gZW11bGF0ZSBzb21l
IElPDQpyZWdpc3RlcnMgZm9yIGEgZ3Vlc3Qgd2l0aCBhIGZpeGVkIHZhbHVlLg0KDQpDaGVlcnMN
CkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gRWRnYXINCj4gDQo+ICMgUmVmZXJlbmNlcyB0
byBzcGVjDQo+IA0KPiBQQ0kgZXhwcmVzcyBiYXNlIHNwZWNpZmljYXRpb246DQo+IDcuNS4xLjEu
MSBWZW5kb3IgSUQgUmVnaXN0ZXIgKE9mZnNldCAwMGgpDQo+IFRoZSBWZW5kb3IgSUQgcmVnaXN0
ZXIgaXMgSHdJbml0IGFuZCB0aGUgdmFsdWUgaW4gdGhpcyByZWdpc3RlciBpZGVudGlmaWVzIHRo
ZSBtYW51ZmFjdHVyZXIgb2YgdGhlIEZ1bmN0aW9uLiBJbiBrZWVwaW5nIHdpdGgNCj4gUENJLVNJ
RyBwcm9jZWR1cmVzLCB2YWxpZCB2ZW5kb3IgaWRlbnRpZmllcnMgbXVzdCBiZSBhbGxvY2F0ZWQg
YnkgdGhlIFBDSS1TSUcgdG8gZW5zdXJlIHVuaXF1ZW5lc3MuIEVhY2ggdmVuZG9yIG11c3QNCj4g
aGF2ZSBhdCBsZWFzdCBvbmUgVmVuZG9yIElELiBJdCBpcyByZWNvbW1lbmRlZCB0aGF0IHNvZnR3
YXJlIHJlYWQgdGhlIFZlbmRvciBJRCByZWdpc3RlciB0byBkZXRlcm1pbmUgaWYgYSBGdW5jdGlv
biBpcw0KPiBwcmVzZW50LCB3aGVyZSBhIHZhbHVlIG9mIEZGRkZoIGluZGljYXRlcyB0aGF0IG5v
IEZ1bmN0aW9uIGlzIHByZXNlbnQuDQo+IA0KPiBQQ0kgRmlybXdhcmUgU3BlY2lmaWNhdGlvbjoN
Cj4gMy41IERldmljZSBTdGF0ZSBhdCBGaXJtd2FyZS9PcGVyYXRpbmcgU3lzdGVtIEhhbmRvZmYN
Cj4gUGFnZSAzNDoNCj4gVGhlIG9wZXJhdGluZyBzeXN0ZW0gaXMgcmVxdWlyZWQgdG8gY29uZmln
dXJlIFBDSSBzdWJzeXN0ZW1zOg0KPiDvgbEgRHVyaW5nIGhvdHBsdWcNCj4g74GxIEZvciBkZXZp
Y2VzIHRoYXQgdGFrZSB0b28gbG9uZyB0byBjb21lIG91dCBvZiByZXNldA0KPiDvgbEgUENJLXRv
LVBDSSBicmlkZ2VzIHRoYXQgYXJlIGF0IGxldmVscyBiZWxvdyB3aGF0IGZpcm13YXJlIGlzIGRl
c2lnbmVkIHRvIGNvbmZpZ3VyZQ0KPiANCj4gUGFnZSAzNjoNCj4gTm90ZTogVGhlIG9wZXJhdGlu
ZyBzeXN0ZW0gZG9lcyBub3QgaGF2ZSB0byB3YWxrIGFsbCBidXNlcyBkdXJpbmcgYm9vdC4gVGhl
IGtlcm5lbCBjYW4NCj4gYXV0b21hdGljYWxseSBjb25maWd1cmUgZGV2aWNlcyBvbiByZXF1ZXN0
OyBpLmUuLCBhbiBldmVudCBjYW4gY2F1c2UgYSBzY2FuIG9mIEkvTyBvbiBkZW1hbmQuDQo+IA0K
PiBGUEdBJ3MgY2FuIGJlIHByb2dyYW1tZWQgYXQgcnVudGltZSBhbmQgYXBwZWFyIG9uIHRoZSBF
Q0FNIGJ1cyBzaWxlbnRseS4NCj4gQW4gUENJIHJlc2NhbiBuZWVkcyB0byBiZSB0cmlnZ2VyZWQg
Zm9yIHRoZSBPUyB0byBkaXNjb3ZlciB0aGUgZGV2aWNlOg0KPiBJbnRlbCBGUEdBczoNCj4gaHR0
cHM6Ly93d3cuaW50ZWwuY29tL2NvbnRlbnQvd3d3L3VzL2VuL2RvY3MvcHJvZ3JhbW1hYmxlLzY4
MzE5MC8xLTMtMS9ob3ctdG8tcmVzY2FuLWJ1cy1hbmQtcmUtZW5hYmxlLWFlci5odG1sDQo+IA0K
DQo=

