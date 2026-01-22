Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I5OGi8dcmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:50:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4166DC9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210935.1522511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu94-00031V-2v; Thu, 22 Jan 2026 12:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210935.1522511; Thu, 22 Jan 2026 12:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu93-0002yb-VW; Thu, 22 Jan 2026 12:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1210935;
 Thu, 22 Jan 2026 12:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viu92-0002yV-V0
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:50:40 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f41a7452-f790-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 13:50:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:50:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 12:50:36 +0000
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
X-Inumbo-ID: f41a7452-f790-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8JL67FpODbMaE/ZIp5XW8VtZRzVQIusRq4+ZXlHflg/pJsPtNYwYhUFeJazKK2c/w3KiykTlj393Xst2Wx/KUmdwOzG5+1ZByJdAagF3RilG/jqxB7BVykMMvCsTvA5MF9ekKDPYagcq6yQR5yNql7xpGOfoTshmLzbo+snEvZdgNRBKaZ1iUqPe3X+pAeYB6/JskiUMbACxLC+ldU8E+qKGe5meKB6eodSfsnQOYMvdjrPhu4sjpnEIE0hstGqcczwrxq6FU5lYrZT1j0R780IV7GuzjSvAsb+/HAfkBsbdk57w5JZt5d5Apqixm0VFJzX4V67gEd13JwVznhaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVo6bcO928HmmvC+3nXtZDNNIpqerp+tl/3J5S3LZFI=;
 b=BX9Y2SMlePdqvs4LlDBjR+BPLozPkXZLnKSLOVohiAhbPuShwbX7ebs/9b2WiJ45kYvod5FYERSSTFNtdPwUkhEaNf7SLv0zY4s5LmoFP5bfP1Ls9EpRJgYE6X1nwiPDe+vPbFEUIVT1+CcqkS1Lu74JpbLPkI8YmG65VHbbLkTusL1vtOA/Tc/X6bBd2yyeUr/xvhDeJ2yhiOYa1f+Ch6ifHkE+0qzMicCT3u3en0KFiRdw1qO+IUU7+2po1XnIARjJSRFgTtAoghavYQ+O8aopuauEDqXpcEyk5C6A5NlkSIMD9WFqI+nPGz+n5ORVrGNBiym9YTeOd/P2UFFrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVo6bcO928HmmvC+3nXtZDNNIpqerp+tl/3J5S3LZFI=;
 b=XYCI8CFmLTwj/BUQ6ZS1zzvg/c2I5cknrC8hMVTB33rctmcITUuZVcZQtynbyYbRbHqi4svetyFgiAmg7MsG9JMoQMi0j8aIZz+0rT6vEWTms6GNxLG1lnUPP0G2rhiBIXeppZPovgJ6KGHObLvgQ3o9xEoLcbu0BLSDt9eK9oA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <947a4230-4a1e-4178-b7f0-ae5618f4303d@citrix.com>
Date: Thu, 22 Jan 2026 12:50:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
 <5948da25-0b4d-48a5-983f-0fc9424774b3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5948da25-0b4d-48a5-983f-0fc9424774b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1477943e-8faf-45a2-9bd5-08de59b4d6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlByYUtibm1wK3c0VHgxdTNkc2lkVU12RGZoS0tzTE1CM1VlNFNpMXZ1M3hY?=
 =?utf-8?B?aUtiaE5TK0FDQWRGd1BiQUg0T1RZU0hTNDlEUWJMU3QxRWZJRDRYNEdoS3hR?=
 =?utf-8?B?L0tYZmVjeUVBbWl5UUxjeFJuYmNnTnpNRUhGWXpsQjJtL2d6S1phNXVnVDVR?=
 =?utf-8?B?S2lqcTFlUjE1WHZIc2RTNkpVYWczSkJYZkRTa2NjZXI3U04rUDhkcEw1WEJ6?=
 =?utf-8?B?a0JHb25scWVoRlNjRHRuRExsTmJ4a2tYdEtrMGlpbnc1ZE9wcnZub2hYTlpS?=
 =?utf-8?B?Um9yRHcrRHp0NXEwNTVIaUpkT3VFZ0NEejJRL1VRb0JNL09UWldOb0hGQWJO?=
 =?utf-8?B?S3JKRHluc2h2QjAxYXJCMGw1QzhuTWpId0NKdFpiQzVQekhGL0RJNzJOVUJY?=
 =?utf-8?B?K1dUWTdvNGFJNFpKTUFvODloR1JRMmUyc3JLSm82d0VjSEFDTEdlOVJiWWFw?=
 =?utf-8?B?NGJrYWtPeXJoaTZyUkJEOHFERWQzWUlTZkdEc3dobGdTa2swQVp1aSs3VUVG?=
 =?utf-8?B?SXpYdXlIemt1aGFGalRua0ozcVErZWh2dDdqWkh5eW5XWWFaUGRGYmdQRWsw?=
 =?utf-8?B?RjJKNEg0ZWJjYkxtZXVaSU9FQVVOdzZuWTR5UnN1cGxQL1F0bGl2aUdqY2pn?=
 =?utf-8?B?MkdnQUQ0Q3kxQ2RTN2JyUUhkanZiZXBiYVNKN1paaXBaencxVG1KMGZBcGdV?=
 =?utf-8?B?RHpJeGdiSVI4Y2xjbmQ0bGV1UE5lVHBsMjRYTVhaYVlHV1UweWdKUU9CaktW?=
 =?utf-8?B?a25KOHNrUSt4YlFVdzQzTVZMaEVUVlZOMjI5S0UrKysrVXBST2IreEdtcUZy?=
 =?utf-8?B?aFJnUEtQek95UjhQckYvQXBQRVhvc0FVcjFES1hBcU1ucGFCNkNoNnRYWUNv?=
 =?utf-8?B?ZVFpWjVrQ0wybWxUdm1oTTVMT1BSUDUydWZ1bGYzNm1TS2hqSFRFSVJOR3pt?=
 =?utf-8?B?SFp3aXdRaFFaNFl5YVFncGt5MkppU09HOVZ4dFltbE8xWnA0MGJqWkEwdGlM?=
 =?utf-8?B?UG90RWpjNzBpTEpnQURVdkk1UlhaRTlxaDFGTFJwdndXWDg2VHREa2RRQXkr?=
 =?utf-8?B?MTJEa3JsN3N6d0c0YWFjanljVU1KZFh0Y1RHUVJ0OGx1aVRwaGhobUVvK0RG?=
 =?utf-8?B?cjVCYVVnRDdwR2luSHhNbVdZazRDUGl6VzhPdXlSTWZ4eG10UUZOQklpdUYw?=
 =?utf-8?B?T0hhQk9xMUdudC9qeTVEK3FqZ2YzNXd2R2NRb3Q3bENKaW1IVkVOY0NHN3ND?=
 =?utf-8?B?cEo2c29wcHhkRmIzNXptS0VidVJkcnlUcHBOT1lvUGg1RHJRSDg1eVJMdi9u?=
 =?utf-8?B?NVpDQ1ROaks1M0h6OFRhL3krdFA5d3ZVTDJFbExKem4zV0tPODc3b2ZwWXc2?=
 =?utf-8?B?R0FsWDJOV01ITDltZmhvdUFZdFErVVBLc2VnaEFwbVJiR0lTR2FMNm0zbzN2?=
 =?utf-8?B?cVNIOUNGSThGN0ZZZEF1SVBVNElxYTZxdmdxMllpWitTamhVc0tJT1hkOFpE?=
 =?utf-8?B?U25jeklBOFRvY2lsWjFVN1QwSGVZSmFHZkF3N0NkWXpJT1RYcTMzV3M0bFF6?=
 =?utf-8?B?bVNkYzR0SVpBejlOUG84cHNqZlNyNE9mcytXaHBoTmwzeXpHa2xvZGJlSS9v?=
 =?utf-8?B?NElzQlRsN2dYZ0tnaXRnRHVBbmdMQTN6MlJ5aUFrTGNvZnVNS0k5cFF5VWVw?=
 =?utf-8?B?cEFzamVTSk96TVdSN3BpUFpyTUROS3d2aVQyMm1UNkozNVNWM2Q1dlNjWjhl?=
 =?utf-8?B?UU1wdVp0MGlXdXdwTDRxUmF2aDJNTXY4NXExLzNCbVJWQk0wU2ZpYkN2R3Fv?=
 =?utf-8?B?TGF4VFlLTGs0TU91NUhZUzdnOENpN1B5dUNsbzhVS2R5M0kwK2ZWUkM5c3Zy?=
 =?utf-8?B?K095RE5WRkkvcUVLdndoWTh1WlFWZG8rTWFjSkRad2Z1K3hldjV0VmJ5S1BO?=
 =?utf-8?B?c1dyU3psZllxVW1qMWdSYzZKS29QMW9iWkZKek14NnZQbW1ubEhSeE9PcXN1?=
 =?utf-8?B?MlNGOXk3cFFYSlZ5QnZaSFVLcVhuMXdublFHOXdHWHZIVHZaSXRyVHMwUjRx?=
 =?utf-8?B?SkIwSWNSbVZ6WkxrM3dnOXIxSStmaUJ4ZG43Tmk2YldjUmtJUFc2TlR1MkFF?=
 =?utf-8?Q?y8O8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0hyY3FadDErSVNtQVpVb290RzRwc2N4dkI1VllzdGJuRHlmM0RZOUVOS1Np?=
 =?utf-8?B?SitVYkFBWXdKR3U2N0lIUFFyRHhwOUFrWGdVWVNFajllUlRha09jeFFWMG4z?=
 =?utf-8?B?eHZySktITXdqajVmdXV5b2N3b21wNW03ekpHVTZYejdqN0Q0dE1neldHYXoy?=
 =?utf-8?B?RWMzWjFUc3U4SVp4YmM4eDJlSzQrRWRvbmt3cVZ5ZUJkdExXdFFaZDhzNWxI?=
 =?utf-8?B?ZlgzRmlIREJGWVJOS0R5Z0VwQ0dOMDJHdU9rbDZDMVlQQy8rTzIvWXdDYlFC?=
 =?utf-8?B?RDc4RU1OR3lqZ0MvVi9KYklNek5YOTVzQW9qMU0wYWdPQkI4TGptVTZBWnVV?=
 =?utf-8?B?NjBzSS9aWjEyWkpaL0t5cy8rTDl4UWVOZmtVNTd1VndzdjVjRjRsMHdXbEJC?=
 =?utf-8?B?QmtpeDh3Vy9mME9lVDNUcjBoTHp2K0lnOThTWnJvQk9WMnVBRnEvTUVkTXBq?=
 =?utf-8?B?a3dvWGdOOE9JTHVDMmgxU1FZcGdJaWVxcFNsNm9LbTNoRG1zcWVKUEZ2MHYw?=
 =?utf-8?B?eDdpTG8ybTdYQ2M4dEZwYnZMWkxRM2owZkdlaVBmVEJuY2U1UStTcUNsWldm?=
 =?utf-8?B?Yng1Q2lsdGVaQjdXUklaanJGa21sOHNoWXhWQzQrM3E1Zkw0VmIwRXR3MVpW?=
 =?utf-8?B?Z2dFRXVMMzFhVnMwYXdVM1dwb1lYKzFscWZIWlJmZ1F4bVdlaEYyVW85Tmlj?=
 =?utf-8?B?TlNDeVFkd3VYMVRxRDByVGU4ZURDVGFVcnFGL1paazM1K05GZXN3Y2xCNFdI?=
 =?utf-8?B?Tk1rVnZYbkpBL0IzNzlyVU9iTlVtZUVTNXMvREpwa2R1b1pwZ0U2blY5N0VT?=
 =?utf-8?B?RGN0K3QzTENHMXVVQTIrVG92b3FiRm1Vem9PNjBMZnl6ZW8rQ1h6aWZGZ2N5?=
 =?utf-8?B?YzdLb1QyMEF2Qit2OUtWcC9FdHYwVnBPUGp1UWZqV1o2Wm9OVGVKcHFHeE1m?=
 =?utf-8?B?aWV3SVZmVDhpSDNNR24wckZnQlcvME5zdnA2dFFjejFhL1psbUxVMkhCWmZF?=
 =?utf-8?B?andiYXgvQnYxTTJWNFlTR3hZSGpiWDk1MU5qblVJWjBNUStyTUN2eUc0UHdF?=
 =?utf-8?B?S0p0SGVsZmx2SUxBQWIrbXJSZWUxM0swRm1RNUxlUTcwSUpjWUNUZjJJYzJX?=
 =?utf-8?B?SnpNVFJwVEJ6TWd4K2t1ZmR1dTRjb3ZDeWpFM2lLMkpkRXl4N0FOSUZxOEU0?=
 =?utf-8?B?cGEyVkdCVUh1aE1lNm0rK2ttQjBicFJRckpFdG1hNlJ4Y2RnSklONno2cEhh?=
 =?utf-8?B?cUNlL0c2VUQ1cjZrSTgweVV0SE82NUxsV2hveWNBdHRwNFRRRDhnT0xkUkto?=
 =?utf-8?B?TWRNVlZremlRbTRzZWQwR2diTEhaTHRCSHBiMDNBVGdjUUY5amt4S045czlJ?=
 =?utf-8?B?NldyejZTTkZYRFpiVFFvM214aHVMM2N6VHhkTHVNWVdRNjFMUzIwbXdmeDA0?=
 =?utf-8?B?elREeGJUVWJxQkU4NVYzRG1kc0NBcjFWV2sxWTJ1SUs0OG5Pa0x4R3NUTm1z?=
 =?utf-8?B?Z1JZTGR1U1hZU0ZHVGdpOWdjd0FSMW9kNU9Ya09WMnVreFc4R3lOc1F1YnMy?=
 =?utf-8?B?MkRFNnByT2d1YWlBNjYwVEJNeFQ3US9sdkFiVC9nRzFlZUNheHZIcWFPeTNV?=
 =?utf-8?B?NUQ4Y1JnbUNpYzFuWm50SC9URnhJVjRjSmQyb3dOeW04NlhBbjFrb2hXTXZB?=
 =?utf-8?B?UkR0Z3BKU1ZHRTJMY2l3VWwra0lIVW9VMk9wdUJSR3ZsS3hYdEpqZWtBQmlM?=
 =?utf-8?B?Y1JYY08vSEcwaEdNMHNsNWNJNDJSOEZwQ1RtUHJyT3lhWFBvMGsxNTBoeVdD?=
 =?utf-8?B?cHRmMi9VYnN5bEFqd2F2VUxVSXB2MEZ0ekYzV2R3WkJSVmxGOUdmQjZmdHBG?=
 =?utf-8?B?aDMxMDlRQjVxS0lRMUlSN2pYMEFidjR6ejVmOEFSczJLM2FDNW42TnlWVVM1?=
 =?utf-8?B?ZW0xMEpYUE5vblZBZUY2bFhNVk5OMDBrbGcxWGxTSldTWnVpeFI3UzRxWW91?=
 =?utf-8?B?ejF4TjgwZEY4OG0wOGNUd1R5U0ZKSFVDbkZXTktGY3NXN1lUOE5BVmxUdjJR?=
 =?utf-8?B?ZWExTzdCZVpTdzhMeHBRNXpWVE5NblZRNjM3MTFkOVBhdGdNTUlNbjZwZkhY?=
 =?utf-8?B?Lyt3MVVFU1lNZW1mT3pFc0F0eVFPZW1xeU1jRVloRzYvbU5EdkJtbnRCRnEx?=
 =?utf-8?B?SkVuYjNVbGkweGN4NmRqWXI5bEkzMnlXTnRVMzR4Nk1OTEJ2UWxsSGx5ZFdn?=
 =?utf-8?B?QTZ5ekNtR1o1U2psQkdBMFFycmhYenVBNy9qblZYSWhsMnA5WVAwcEYvWTFM?=
 =?utf-8?B?ZkVsbHBtNzN3eGszYy8rVldtdUcvNmI2V1pneXZ3NDdOZjQ2MDlJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1477943e-8faf-45a2-9bd5-08de59b4d6a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:50:36.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usSBWf+hoTXdR/H8PFYLCZmRDiK5LlpPaEUeJc8SQNMUixdr3VJd84fBrxYVxHsTHHHjdS/92XHUG04Cet0tsLcUL9nNSY58xPd+NjScGZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CCF4166DC9
X-Rspamd-Action: no action

On 22/01/2026 8:27 am, Jan Beulich wrote:
> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -121,10 +121,6 @@
>>              "rel_path": "common/bunzip2.c",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> -        {
>> -            "rel_path": "common/earlycpio.c",
>> -            "comment": "Imported from Linux, ignore for now"
>> -        },
>>          {
>>              "rel_path": "common/gzip/*",
>>              "comment": "Imported from Linux, ignore for now"
> Judging from Andrew's
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2277362625
> this doesn't quite work. As I had expected, since the file is compiled
> unconditionally now in its new location, some violations are now also
> unconditionally reported. (Some, checked for at linking time only, may not
> be reported anymore for the *-amd analysis jobs.)

Yeah, in hindsight this seems obvious, given that we're compiling then
discarding.

There are two options:

1. Use an earlier form which adds the new location to the exclude list 
(Still needs to be in this patch for bisectibility.)
2. Fix up the violations first (only 6 in total)

Two of the violations look easy to fix, two need the deviation for octal
numbers, but two essentially-char violations look to be hard.  The logic
is doing ASCII manipulation in what I would consider to be the
appropriate/canonical way, but Eclair does not like the mixture of ints
and character literals.

I dislike option 1, but as (contrary to my expectations) this is
interfering with the *-amd build, I'll tolerate it.

~Andrew

