Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43DA6B032
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 22:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923206.1326840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvNql-00059U-3w; Thu, 20 Mar 2025 21:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923206.1326840; Thu, 20 Mar 2025 21:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvNql-00056Y-0d; Thu, 20 Mar 2025 21:54:51 +0000
Received: by outflank-mailman (input) for mailman id 923206;
 Thu, 20 Mar 2025 21:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7JB=WH=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tvNqj-00056S-AF
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 21:54:49 +0000
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee891e1f-05d5-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 22:54:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52KLsfCx023145; Thu, 20 Mar 2025 14:54:43 -0700
Received: from XCH16-03-01.nos.boeing.com (xch16-03-01.nos.boeing.com
 [137.137.111.10])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52KLsadP023116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 20 Mar 2025 14:54:37 -0700
Received: from XCH16-09-06.nos.boeing.com (137.137.111.51) by
 XCH16-03-01.nos.boeing.com (137.137.111.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:54:36 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-09-06.nos.boeing.com (137.137.111.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 14:54:35 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 20 Mar
 2025 14:54:33 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BN0P110MB1883.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.32; Thu, 20 Mar
 2025 21:54:32 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%4]) with mapi id 15.20.8511.032; Thu, 20 Mar 2025
 21:54:32 +0000
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
X-Inumbo-ID: ee891e1f-05d5-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742507683;
	bh=lUKxEa8icImYZjgIznuWJPeVYke4fgjKIYUS5wDBhOs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VwQzkRMWx1bn/aGYJbvRFrmDI4q/VyJ1Tsa2tcIG0yTZTKFivq0so0NWM1kdu6JyZ
	 Mu9xcuenI8BYtcwso5VYkkhmrw+H3aIuriBeF7Phf71uHdDXpo7j8aYMpEc9KMlJEs
	 11IM58lBo5pJeQG7PuICfGs7jr7UIsTtilk9nvc11+Zm6yMJK/HPcOerZVUHCFPcrB
	 doubOvKz9DiQeFnJj60+QtsrVTNwyPgYuWb1ug1YWvuHYI76RMPZbsG2DqwBn6AJO0
	 DUyknvzKbJbG/6tWYoW0aI9mRB6hLbgYiIEfteHWhxcby1d+Bpzcwwxd9SNNwh+rhO
	 Gc53uffN2BEJQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=hdpbeq/yVbephc/OzbhClMfurFzr+x2YpaZuBgEFy2ZXxGpRLxqxAAi0f6ImdXnTqsEpVhhy5YDDZ4JcYesxE4Uviqz5N8wBEbV/5X0HrgfG1YVD5pTiPPnHWN5I947rG5mpyOgW/xHqJZAN/fTIMtZF7eaOnxipjJrmSu7nd8aa30iFbSpIQuAIcxsNqWNcUCCUXzb3zMkS6K4wfZ/TQrjNUcOGZWd45/tfd6PwW5dL9157J1CJrec6co+ZDmD1C0EnoyWIB7Hffuz3qBJFKhxfD8Cl83bEH5M6JWwAFPggs/FBpMBIs8aE7EDajz2pcyEVCD+UbTh7XphGW33uBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUKxEa8icImYZjgIznuWJPeVYke4fgjKIYUS5wDBhOs=;
 b=NVSF+P2ck0vQEUs6qAmEPFFgYPF6OYzThmqP5YvjOODyhagCMYugTvN6CkJ1iEQoni6Q1SsEwAQRc34XjlTmezcWVM74eMyehy2d7t0XlvwPJzNrHjVMfY/PBzpGSIjIWcYep6FHSRVTPY3cgbLeh7pZbjInyheJg2WjXRowdhXkAkk7pyaV5dBcmYMY5DLs7N75TKhUkchWfhBSs4YwzYqH61l29OQ/wLQbIMklUPFzBs97V2FlOi7BLaSfttrxPB0DQrcjmZ4XbZG/Ji9kOLW3lKpPeBFMqZbHJUSWq/S8HXtKKWDkZ8lbdE3Dlw0lQP+3mWFqsZPXFKNGoTTyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUKxEa8icImYZjgIznuWJPeVYke4fgjKIYUS5wDBhOs=;
 b=N3fYyLeUYUJ5QfwXKAJkP7ZAszMbAB6TpndhVax6xsx/DJcl3xtmoi8IDCYcgoYGV4kjH7XoWfq5X0tcadmCtMWEMOm0kGSdRWdxZID4//QEugwxmQsm47v8YqorVR8nOVPvcjl3J6H+4S30kdt16iam+o+fMSzSV9fjvJ8jLmU=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Topic: Discussion on unexpected behavior of ARINC653 scheduler
Thread-Index: AQHbmeKplrDBusQqVUa1MWzskssAYA==
Date: Thu, 20 Mar 2025 21:54:32 +0000
Message-ID: <BN0P110MB2148C8B4E101776B52721CF290D8A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
 <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <0158ee4f-635b-4183-a2c8-edc5d3189b27@citrix.com>
In-Reply-To: <0158ee4f-635b-4183-a2c8-edc5d3189b27@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BN0P110MB1883:EE_
x-ms-office365-filtering-correlation-id: 80e67fce-282c-4d67-2683-08dd67f9cc0f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?di9QY2VKTnlSZXhacXVYenR3UytZdmE4a3NGMFNLZ0xQSWh2emduMkR6VVRL?=
 =?utf-8?B?U01lQVc0cE5QSndZdzVwWEhNMWZPb29obUZUR3BVSTBGejBZZnRoQlZ6V2Nn?=
 =?utf-8?B?YXNqcTRoTklmRzc5WGxWK0phK3U1K2R1U1ppbWJrVHExcUlPME4zQVM4YWRB?=
 =?utf-8?B?Y0VzNEZqNlA3S29WTS9hSFFhRjJKM3l3RUhNcWJYVmQxVysxelYwRG5aMDdn?=
 =?utf-8?B?azMxM0pVUFFpcHpNN3lCM1pxWnJ3dStjZHRPZ3gvbFMrM0hsUGpJNGt4cTBv?=
 =?utf-8?B?cE1iQVFWR2x2U0tZSXhDa1gzY3VsN04rUmgyYnpSRkZsbnR1OUg0MFJqVWNF?=
 =?utf-8?B?dVFpa3Z1YS9zRWxtN3JUS28vSS9XaXU3b0NvRU9JcU5Ob3ZtTzM0Q20zWGd4?=
 =?utf-8?B?aW1sT3pHL3FDOXMrekpKdzZHWnlGRTVKZTJpdHN2OGM5ZmYrbkpPSldibFpx?=
 =?utf-8?B?NEFCcFlTZlh5RnhwWEJkUzVJRXl0ZUgrTDhXdWlPZmJxYWZYUUJJc3kvUCtr?=
 =?utf-8?B?WVMzUEIwa0M4VFJKaVBaZk80NXkyVVRWN3piNEpxQk5MM2Z6aE5CaHhFaHVP?=
 =?utf-8?B?b3Z2Y2ZyUEJrWWN3TGxJaW5ENm1Qbmd4NGpmYm9yaitNM0pHV2FRRk9sWVJr?=
 =?utf-8?B?bnJ6QUx2ekFzSTJzS0NBd1BKdnFVck5JTWY4WHhsNWE3bUFTR0wxOFVBTXRn?=
 =?utf-8?B?YUk3N1VFaGFoVVJ3WklOdk10Z3R2ZWNGNG1NckRxZUFlN3huWjJNR0kyM0VD?=
 =?utf-8?B?UVYvdVhBTUtNTTJkWGFOOVMwQnR6S0k4KzBRZGtqSU1xUmVBejNJNkFmaHo3?=
 =?utf-8?B?UGY2L215TVZRL2tYN29EVDJBUzVMZWd0ZU5jT0wxU3hBUUZwV2owbnVYcVli?=
 =?utf-8?B?Nyt1U1pwbnhWajVLYjhhRktHWWVDWDJ0Um5qTEhweFFvZVA0NEpocng5cUg0?=
 =?utf-8?B?Sk1pb0wvcllzTUhHQTAzeHBxTmk2QzhMVHo4M0lZQmQvNVE1VGtvQ0xLUkVP?=
 =?utf-8?B?ZnZLUmtIUzNWL1FJdnR5bkJxdzg5RUZMa2Z2bEMwcWlETFdsZGg1b2xVZXE4?=
 =?utf-8?B?L1EzWkwrY1RtYnRNV1BiVVFPZm15MWxWWVQ2UnlxL1hHeU1TNHEvY0Vkazk2?=
 =?utf-8?B?YnhBQUpkcXNrZW9YZDhQZkZxZHkxR3g3VU5jWDhmVDlHZGhmcTU3NkNCMVd4?=
 =?utf-8?B?SW5PYzNEdUYxdENudXl6WnVBMnZBZ0FScFdQODNPZXpERWkrUForZTk4OGRs?=
 =?utf-8?B?ZFlMWEMrSHhBWlNXUnJJMUEyTWRmTXpXU2QzYkFDenNYR0ZWakxtcmZmUi96?=
 =?utf-8?B?bENrSDI1YzVkRm1rYzhiWEtEa0pNemNpMDNSRzdmZGcxMURNWmdzUUNiaGVH?=
 =?utf-8?B?TWx1L3R1M24rZUZVeEduNVU4S2pxcWl1QldDdmI2K1BqUzZsRjhoU1JqaWt2?=
 =?utf-8?B?SWRlUCsrZ0ViNEozSjI4N2lZcDQ5bS9GOGQvZEFPWkVlRmZlR0xJVGZwdzJC?=
 =?utf-8?B?N3B4Zm1KaDRIemMvVnRDdzNYWmFZcTAyUHR1bUR1TkJuN0xLOWFKT2laUkhO?=
 =?utf-8?B?VFBUQmVVWHRBZk9xSGhsUVVveFhLaG5GdGlJdWlReks0NTI5aGdIekRPYk1K?=
 =?utf-8?B?YlJjdjhQWjMzMW5vTjBFMFBHTXplQVNmSkVBNnhUcXFOVEZvc25pdEtrR0x4?=
 =?utf-8?B?RXNmN0xnOVI0OUtwM2NmaGxOMnRoMUQxTm1Gb1ZGc25PSmZRQmJVRFk1djhw?=
 =?utf-8?B?TUp4QnZuK0pESGRGQkJzVi9rT1haYS9acmlEd1ZnVmhiS013clRoT0kwLzdX?=
 =?utf-8?B?YVVzNm5sSjBJYUlUbldPblhKdjhib3lJMkJMb3AvWktGU1dOZ0JLVTZxRm16?=
 =?utf-8?B?S0o3M1YxaGUvUDRnOC9uaDIzTWxNYXdVUzJmei9LYUhOZDNJZHVLTGlUWWFK?=
 =?utf-8?Q?wPV0vAlQkm9xtBOjbKqg9TkETD1lb4AF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTU0UnRKMnRxSEM2RGIrVE1rTmIzSCtGRk01aXE4cXl1dTE3T1R4UkpjczBu?=
 =?utf-8?B?YWY0MWpQNnRPYTlyYUIwY0Z6MU1HQnZ0MVViSkZJTXlyZHgrUDJNNzB2Zm53?=
 =?utf-8?B?T3F3US94TTFyUU9GMFNicUpWZmYyVTZ4UFByQUs4NmFaSFI5R1RJZjdWNXRR?=
 =?utf-8?B?RGpMOHNQaWxRaTVabjdnZU1hWS83ai9LbVpBUm1xZjdpMzRxNjRMbzlSNVpp?=
 =?utf-8?B?Q3NBK1ozdzVwY1lBTDlFNEduLytBOHRQM0YxeWVHWGZRS0tmWndGYXRma0xl?=
 =?utf-8?B?WWkvNkhvQ0lZamhTL2laTjNBdmZnL2ZRU0VrUklWRjVHMk91TjZhdzlsWnlU?=
 =?utf-8?B?RngxYUwwR1VlbU1IL2M4cHpDeGpyOUhwNmtGekdtcXd3QU10MHU1elJwS3Jn?=
 =?utf-8?B?SktoaW5EalVlNmFBclFuWEhwUDBtZTJvcTU0RTBZU0p1MmZEd2MxbGJRYUVD?=
 =?utf-8?B?WXdqa0FRa0FqUVpORHZXREVYWW5yYmVaSlNodzZFUW5IN3QrMUxyTko1MVFV?=
 =?utf-8?B?YmVxZ1FnMHdIdVVoeFNQRG53T3FsUWZhOVBzMkg2U2tZcmtHbkNXTUZUK2Nm?=
 =?utf-8?B?TlNQZnE5ampVMDF6bmNmNld1SFRYMGVHVHFzRDFMQjNkU2d5aUZ4amVCL2py?=
 =?utf-8?B?c0dCQWFQK01yS0pLSzB3Yk5pRk5DditiUWdJeUkycC9oS0I2dVFDS1JpcVdz?=
 =?utf-8?B?UlR2anpYK3paOHlvcVVRSXYydVE5MzlGNi9qSjlvbVV5c0JEQXpZa3dPWTB4?=
 =?utf-8?B?cXNDaU1ZWFRobXlIV1JOUlZ3V3l6MGlKZzB1ZGp6N1pHdEZIMWg4bzRZZWt6?=
 =?utf-8?B?dkpCdFBueWF3ZlpPVjZTN2NrUVdDTGtreGhsUG43OG45OXhobzdKanp2bzQv?=
 =?utf-8?B?NlBDVjZjL3JhUUtRdzFnYmRyVzdyeHU5azFJWE02OVArUTdkSk9nd090d21C?=
 =?utf-8?B?enB0dlR5NVFFS3BXbGUyU3NicXRsYUZTQ2xRZndQU21SRmpaTjg5aVQyeFNW?=
 =?utf-8?B?V2pobnBFdVpUY29WRkVqMGN5UGtMZi9WRHFKWnNZTHdoeFVnakZBdTlOcGxt?=
 =?utf-8?B?REZxOUVRTmpNaFIxVGxkOEJMS3B6ZWw0MWxtVzRNUXl0clhiMyt0NGUvR0Jp?=
 =?utf-8?B?VUtGdEZLNlNZWU1qU2VGNXZkK3h0VXMrSm9ZMUV5empueEtnK2xhYjBtN1cz?=
 =?utf-8?B?azRXLzVaeEhlZ2ljTnJhWTMvS1hYc1FOUFlNQjhlWGMrS01LN1lPQWdCM011?=
 =?utf-8?B?U0lqMzhGMU44WDFTZm5ZNGJ0ZCtzbTY4WTEzTlhKcXlwMlpOWW9UZXJRaVds?=
 =?utf-8?B?WU5jRXBjc09wZUpMWVB1RmE1cWE3WWNlODF4WmFIUXBUQktNYktYanZ6Yldr?=
 =?utf-8?B?WFpqbmEwYkIvN3pXRmN6SHJhTXhuVEUvSEN5VmlRN2VCVG0yK1FHNDJpYnBD?=
 =?utf-8?B?ZlVkdzRGSXNzTXB4ZTFEQmluUnpIK3BkYmZpQ0R6U2RidUUrOExZNkNqUU10?=
 =?utf-8?B?U1pNbFdOb1d0WEQ5aWd1UUVoWkhSLzBiSXNmMUZ5c0tCUXdNeGV2cm1hcmZN?=
 =?utf-8?B?dGpUTTNUOWJSUnFoM1BQeVBzaHVLVGJjcVVQbUorVjVQQUc4NFBEa0dIZHJw?=
 =?utf-8?B?TEtrRlIzSUlJTWhKR0I1WVV0eVhybTd6ZktTOHNZTk1zYmFhMkZJSXJocXl0?=
 =?utf-8?B?TVc0c1pRRXJYQ2x4S2d6RmR1bkE4NWJ4SGs0dDFEd3B5d2w5OVpsT3JBYTlS?=
 =?utf-8?B?S1FLTmxrSW5DemN1cDRMMkJjZVFIUjFwNE90MU56N0ZXdVBwYU9vYW9mK3Ba?=
 =?utf-8?B?aEx2RUJqT01mOWl3TzluMXhlSEd4Uzl4OGpwY0Q2R2VyZ3pFeTRvQ3Uyell2?=
 =?utf-8?B?eHFxY0h6WVEwenZoakdha1N1QkE3cTliMGRva2pnazM0dWJ0QW9kTnd5UnQ0?=
 =?utf-8?B?eWRUMHVoZGp3eEg2eU1LdzV5TkVnNlZkaUJjQktJOERqTnlYWGRELzJpbWQr?=
 =?utf-8?B?YTNBOUQzQjBpNkM4L09uWTBDWlNsclJkSGcwUkUrUW5JK1VYcDZ5RTA2TXJs?=
 =?utf-8?Q?v77aIT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e67fce-282c-4d67-2683-08dd67f9cc0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 21:54:32.4050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1883
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

QW5kcmV3LA0KDQo+IEVYVCBlbWFpbDogYmUgbWluZGZ1bCBvZiBsaW5rcy9hdHRhY2htZW50cy4N
Cj4gDQo+IE9uIDEzLzAzLzIwMjUgOToyNyBhbSwgQ2hvaSwgQW5kZXJzb24gd3JvdGU6DQo+PiBN
YXkgSSBrbm93IHdoZW4geW91IHRoaW5rIGl0IHdvdWxkIGJlIG1haW5saW5lZD8gQW5kIHdpbGwg
aXQgYmUgYXBwbGllZCB0bw0KPiBhbGwgYnJhbmNoZXMsIGxpa2UgNC4xOSBhbmQgNC4yMD8NCj4g
DQo+IEZZSSwgYmFja3BvcnRzIG9mIHRoaXMgYW5kIHRoZSB4ZnJlZSgpIGJ1ZyBoYXZlIGp1c3Qg
aGFwcGVuZWQsIGJhY2sgdG8gNC4xOC4NCj4gDQo+IH5BbmRyZXcNCg0KVGhhbmtzIGEgbG90IGZv
ciBoZWxwaW5nIHRoaXMgb3V0LiBJIGNhbiBzZWUgdGhlbSBwcm9wYWdhdGVkIHRvIDQuMTkgYW5k
IDQuMjAgYXMgd2VsbC4NCg0KUmVnYXJkcywNCkFuZGVyc29uDQoNCg0K

