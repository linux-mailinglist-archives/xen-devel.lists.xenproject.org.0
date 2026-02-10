Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KYNBIEBYi2lgUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:09:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC211CEDC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226603.1533111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqIo-0001Ks-3d; Tue, 10 Feb 2026 16:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226603.1533111; Tue, 10 Feb 2026 16:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqIo-0001Il-0m; Tue, 10 Feb 2026 16:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1226603;
 Tue, 10 Feb 2026 16:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpqIm-0001If-Bp
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:09:24 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dccf4f09-069a-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:09:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS2PR03MB8444.namprd03.prod.outlook.com (2603:10b6:8:331::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Tue, 10 Feb
 2026 16:09:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:09:18 +0000
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
X-Inumbo-ID: dccf4f09-069a-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLrlqcmReKoP/ApAOW5Bhctqh7RuGXZ7V5HxFMxNkS2pnqSLJTyBxPNQJzA3qEO4e/8rDaTC/T/QVx0NJG99WzREMIoW/jAAZtSqUIKS+dKxF3mZJtjqc4FNwJVrMjaQqv4tOcrwY4l8eLvkTRENUHd/S6+8+94VcNE/5qqnTJL9GTZdoU4Bw2xHR4XUVG25NaAEB/HiRDgq97M7DPtrCdvhNHuSoqqGWHN9UMpFS19pKnbLww02gtZX9zPO88U1Ragf04D1KQsGhFdYlhnIBRdF35KMzGQFSD5hUkZ5e3Tgqh0Iia7u3rtAc47nTkRPYS4tKCTuxdAnEkTrL5Q3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK31RsiUalQL7N9i71GiWC+3ugjqa5KY0q4sc7C5D7k=;
 b=T245PhiwpdfI9hU16jvXusxSsOPqOidbCk2CUJznyUdCajr7JPA5zTEv7Tt468T8VQIuAawLGwU8mMIqgWQ8uFp7XUnn4mk41rnNQ3as084OtIOMBjV3kywiPdEAehRJtCK6FkiGIjYcukKxeHI0VVga4zhjSLYklWgumTXGW4h70ZbT3J4CQa/izzY+gyo2vfkeXtMjGIeo4ocTPMlKGjNyltUZdrC7FWsbc62r/ggXB0YAGapfUCuNmexqa0nNTmN3+7FV1tkaEnzj6fB033DfQ7CoWy1GkzfRBYBTjh3xSo6GeHxPP2fHMPFK+w9gQHWaBcxmd6E66lB3EnxNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK31RsiUalQL7N9i71GiWC+3ugjqa5KY0q4sc7C5D7k=;
 b=hygTGCfdmy0gIH1NavQMTlIjeuiwvOBlGys8BUkHenr6nyddG6uHZImDGJtt+EuBblbPx6doDfWZvSXbL/j98GyRJd41EVJU1FueB3DbD1cHGEPP4vHV9OJr5l688ijv7WG2OTHAJDW5tfnkYs+jNr3qv7f2iPPumuC4axLGweg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 17:09:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Message-ID: <aYtYKlcoVAFvn8jh@Mac.lan>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com>
 <aYtVBuHVcfZE-L-a@Mac.lan>
 <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com>
X-ClientProxiedBy: MR1P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS2PR03MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dff0c65-0201-483c-bdf7-08de68bebe94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekFmNWtKMldVanRhbFpuSnpFdTd3TGZnbVRFSEUrV2xuMk9QeFQ3eFVVZ2Zu?=
 =?utf-8?B?bU94ZGRaZG1ZRjlWZHNuancwWk5rcUF4RW03QzA0WjV5WUlTY05zOFlBNEJD?=
 =?utf-8?B?YzQxaHZxTGtHcnNRRFlCVm9mdmo3VEVCV1JVbFNNZzBiZms3eU5RSVF5NVBB?=
 =?utf-8?B?aW5Db2NnQWN0TXB0NmgvQUFDemRveVNLWm9ybVJFaVhyU1dFVENIWGR0M0RR?=
 =?utf-8?B?OENUWjRzRmQwNVRpbkdHYXRib0srWk53YlJIQzBwVitBL0xoQUxFUkt3VU5F?=
 =?utf-8?B?a3NxdHRtMWJLMXF3TDNmZU1WN0lOUFIxOWZXQWtCeDZlVTNFblk5dmcxL1dF?=
 =?utf-8?B?eWlvd3RyRkx2dE1IVVlObUhJTlE3REtseUViOEs0L0NRMEhvUmhTbkYvNDRC?=
 =?utf-8?B?NHdjSVlzRTVTNkpibWR2VTNaMUdvaGJPeDJoN0JVSHRVS0hnU2JIeno2SDZ5?=
 =?utf-8?B?bGJpUDNha0VSUnlWaFhaeDB3d0lHRTlUM3E2b3ZVbU5SQitDdFJiTmYrcDNt?=
 =?utf-8?B?bW4yOGFPMWJDanJVelRZOHVISW04KytrdzFwQmcvZUdOeXZacEJGdG9VaXpV?=
 =?utf-8?B?UXdHTmNwZ1NEVmNjdkZEMHZ3aVp0Rk9GTXRDdWtVWm9ralhPYzgxOXVmdU9l?=
 =?utf-8?B?T3hnRjVWNzlmQ2JUeW1CMzFFUmxyTzAxakIrWGVIRFVIOFMyZ09DWWlnc3pP?=
 =?utf-8?B?Y0pCSXRCelBqWDNERnFVQkJjeGZTWS8rL3NCak9oWjVxQlBUN3lpQk96dkpx?=
 =?utf-8?B?OXY0VUkrMTlBd0txdm9KMlpWQWYzZHh1QzZCdUlRelRxajZYczJuNis5YkhJ?=
 =?utf-8?B?S25rSGx2a3VwOWxrTTBqQkE2emV5Vzdhc1REVG1OVDB5dGtpcGRUZnpTQkdF?=
 =?utf-8?B?ZHpVb25QWWcrSWJmSCtBTVJ3VklWZkZrZFN5MjM2SGJ2cy8zZHhVV2V2M0JM?=
 =?utf-8?B?NjFvcUZiSS9qUEVlSHMwRHdqTGQ2dndGM1dvSHFzczF2ZVVHbXV1amxjRUVQ?=
 =?utf-8?B?OFYrOWg4ODVYS1FtdnVRdHJxVEVNK3RrZStuYWxvZFR1eC80SVdjUzR4T1I3?=
 =?utf-8?B?UlRzTzdNVUsvcjQwaVdHeC80YmhLeEZ0UTVTUXlSdi8wak50YktjYzBnQWRY?=
 =?utf-8?B?SGVBSmlEM0VOK0c2S3B5UHdLZndrcUVpalFXTnd4L1BGd3R1TGFVeTNhQ0xZ?=
 =?utf-8?B?ZG1XSnVUd3h3aUdIdnZOMGlwOVRWWHA2amxydzhtWjRHcURsTnRoZHNWRHRr?=
 =?utf-8?B?TVBmRmlFemdMN3M5RFNZMTBCVFRPZTA0RmQzU1p1eU94Qzd3c2QwTEltbDlG?=
 =?utf-8?B?RWgwcUpxdFUxVzR3SGhzTTJSOEFweHBhQVI3dEtFTnJBenFWcE1qUXFaeGs3?=
 =?utf-8?B?YnZxREpVdDBDVGNsZzRVUm5GNUZDZkovKzBSMFI4WmJTc2IvRWk4R3gyN3Bs?=
 =?utf-8?B?Q09CZWlnZUNRekhsdmRNajMyMStacEhyWktFb2g4N21mVGc0VHduKytITVdF?=
 =?utf-8?B?b3pXdk00TEtlcXRheTd6K3JOMUluUm1UVFFxdWtLakRzeEU1ZHpKTEVKWTli?=
 =?utf-8?B?dXhUc0xoV0hpQk9sc0lHRG5peU1jdUh1N2ZMSGtmNE1Fa2d3VUhZZ2FEZlRT?=
 =?utf-8?B?My9pZVRCWWxoVzlJNjJqaTdPb0dmeXY1Mlk1UE4vYUY2SkFtYjhYdk9wUUlX?=
 =?utf-8?B?MEdxMGRlbldBbnloSVBZOGlyT3U2ZVBIQ1BNTmlTSUM0MkZrT3ZLOHVSN2M4?=
 =?utf-8?B?WkdyTXpnU0FaSzdvTDZuMERETUtKQ1RSQ3FOU01mRXlSYk9zQ21aQnYxd1Vl?=
 =?utf-8?B?OWYxTFBhTVE3empJbW9XRGJjSE5Zd2NaNUZSVFpheEJGMUxJa21sd0pZUHkz?=
 =?utf-8?B?cjFyeEJoZndqUk5WaUU3QTNXcVBnd1hMcThxU0h6N2FoS0ZRd0RMTWV6OGR3?=
 =?utf-8?B?YkZUenhqc2RNb280TnhPMytvWG9MbzVxL3NCMjRnUm5CMlQrQUtjUG5zbzQ3?=
 =?utf-8?B?YkFKWnIxUmZ0ZnMvVWgyTDhaN3N3eHI1QkZNcUlpc0NCNFdGZVVLdmRwVkdt?=
 =?utf-8?B?VU5NY2wvMUpuVFd4NHJNOXpEL1UxVjhoRmRDbUR5QWMzQlNsWUFLeEdaR0Yr?=
 =?utf-8?Q?C9UY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2dmSHV3SWh0QjdqWGl0Smg4TmhseTJkZEpLVkxaMXd5cWdHUm0vdzdxRUEy?=
 =?utf-8?B?YXVwM2RkWURvdElwYnVKT243bmp3OE1aQU9kOVhsY1FqSUJWMUtmbDZad2sx?=
 =?utf-8?B?dTR4eGVmYWJCM242bW5NVWVxRHpnOVpOOXVZYVh4ZlUxUTdjSmlnNkFoTTR5?=
 =?utf-8?B?aEVUTmJLYTNlN0xuR2I4QVN0T3crZUR5OVBoRG92MVFUd21LdFU5dGViZlJh?=
 =?utf-8?B?YTh2emc0UE1TMU90b0t6YXpESm9PMjk3NFRjWjVhUlFQMExKdGNieVE5Vm53?=
 =?utf-8?B?VXZhSk1XOFgzRHZSWnVQUHlNUE5lODFvSHU3NlBlaDRublVIME9xbUNFbTZa?=
 =?utf-8?B?ZXZqQ3lESDJUdlFPa2NnTzFPSUZRWnN1UjZESXptbVJtaVJEVzRWQWN5anp4?=
 =?utf-8?B?dFVZNEVNcHluYWI3SFJsR0dVai9VbjBCRVVaSnc2TFNtNVkwLzltTGh0YWto?=
 =?utf-8?B?YUxBaWU0M1dsQkJGVFI2WlZ3UngwY3M5eTlsNjVOMVZmK0RrODQzODFIVmJE?=
 =?utf-8?B?VnlvK0NkcnI0bEFLYWlPcVNsNDhLeWJLaGlxUUFSRUhOUSs0TmYxN24zN2Jk?=
 =?utf-8?B?UW15S0UvQTlBbEtxWmtwMThVRFo1Y3lmUjM5WkZUcUdYd2tkUkdxT2NMU3cx?=
 =?utf-8?B?MG1LeWZuL0xwM2hEcmNNL1BEL3VMckF5eStVWllVRVU2M2JDc3hWRGd2eERt?=
 =?utf-8?B?MllJMm5RWUZQRzZnOG0zWlJ0aHR3SzlDc0xSREtkOFNYMzZTenBmbFBFbVdl?=
 =?utf-8?B?V0d3TnZsVWlEdi82U0c2WmZyb3dQeXJhdVhma25sVndkSGtPeU1pdjM1UnRY?=
 =?utf-8?B?dktDUHZIU3hDR3ZwRlF3VjdKRkF2bVByWFg1QXh6UjUxVXloa0lXTENUeXlV?=
 =?utf-8?B?MEZCYmgwYTlGMUszUTBDa3lKWmpDc2pTWDNOSG5McVhNekdBcE91UkhySDNC?=
 =?utf-8?B?YzBFaXNPUkwrS0lFTHFlZnZRQkF3bzFaRXdJSC93bzdGMlF6a0xISmE0eG5M?=
 =?utf-8?B?bWh0ZVFlU1poTktoM0pIcTlESGxOWDUyaFBUUU9WR1AxQzZ2MGdxY2VxK044?=
 =?utf-8?B?Z2p5Qy9Za3FxdStWZnFaQk5nOTFMTzFFVjNBOE5sSkU3cmlITDV5US9Bb0hx?=
 =?utf-8?B?UzdGY0lBTGl6WmxESUpVRDZFQTJPd1JsbDZ5eG9RU002b2Z2NVpPTnNqRnlI?=
 =?utf-8?B?WTV1Z015OGFDaDhaRHJ1YTFwZ2NHNk1aU2dSR1dEM1JadG03M09JdDFXVU9n?=
 =?utf-8?B?VUZFSVZPVGhpUGFpUUw4M0hKMnk3ZjdzR1F4aVRBTnFLSDcvVHlVVFpnTGl2?=
 =?utf-8?B?cHRuRjBMWkZCNTVvWDM3aGZzSGdBcHVhSSt2UGZIQkZMc2dWS0lPNVhhZ045?=
 =?utf-8?B?RktxUDJKcTdsWjVpclZ2OTJSdUFHSituNWs1eHFYRkFlZkk3Nk9hYnUwUVdT?=
 =?utf-8?B?eStWZlVXTWRZY21nM1RwUnFQa2FETWlNUnZDNks0Z08yWjRJKy9DUXAwdW55?=
 =?utf-8?B?VmJxSkxNYUpGWFg4bk1UZXlkYTVqZEI3Rm5xbUZaK3N4djYrU0FyY2ZnSTF4?=
 =?utf-8?B?NmFmOFJuTkx2ampsTCtBQmNZSjBnYTlESjBQQWF1WEhsbm96ekFiWmUzRlFQ?=
 =?utf-8?B?cVJMLzRPemRmU3FQamUzUVhZRVFxSkxWVDJDbnMwWkZkeDhPc29vSE9iWFN2?=
 =?utf-8?B?N0hhTlg3Tk9xcU1oeEJmbVFVdkhQZm9RNnk3UkRsSGVDdERkT3BvME54bS9L?=
 =?utf-8?B?U2NibW5yWmhFV3FYTjVMbUJxdzdNUnJudGROeVFOQTdPbVBobUpuaEV4RVhS?=
 =?utf-8?B?Zy9RVWtFUUc0TmJIRkZPNUYyL0VocmhqakJmd3c4Z01vbFBpRlBUdDFzaWZw?=
 =?utf-8?B?Mk42eDI3TFN2MGxLalNCSzh5TGJSWWZ5UjEvV201enM1c29wbVNQMUJXYm5M?=
 =?utf-8?B?WllsR0g2T3ZhK2laVkZTaHFIUU52dzRrV0ZvS3Y4L3QwQTZxN1pyMkVEOFFN?=
 =?utf-8?B?QS9RS2ZuVFNRTjRvRW5mNWlvYUJMcmFneVZlekJCazdFYVMySkdXdzMwNVR6?=
 =?utf-8?B?Qkh4TnAxeGFrNE5IYnBqcUtxSkt2a1NtQTZpUXZ2TTV4bGdtYVdZeVlPR2FQ?=
 =?utf-8?B?SzZiMFNPSlpJQmNsMzVIMW5qSjhqcGZQbCtScDdKOE0zUCtrUU5VeG9TUkw4?=
 =?utf-8?B?QVhoYUlOeE5MTkpwRWZ6ZEVsbjI0RE1MRXA5RTE2eUZ5RU1NZGtsaS9rbFZw?=
 =?utf-8?B?TnBxU1RGdnFlOE5Na29MKzVKQmdkL2I0M1pCVTU2cjQ3ZEF5M1JWVENNSThV?=
 =?utf-8?B?NC9SZnNvMFVYR2hqczhYNlZqYzhPUjU3TFNRVVVwVFhEM3ZQaVpFZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dff0c65-0201-483c-bdf7-08de68bebe94
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:09:18.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fGRsd9N/5UC7+Hg6Kg5sJV9lnrdvMC3FnYht5rFQgmkMYFW57yU3mnI31BoC0BKhcSWs0/Q+K/qvGWHAf1BPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8444
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6CC211CEDC
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 03:57:17PM +0000, Bertrand Marquis wrote:
> Hi Roger
> 
> > On 10 Feb 2026, at 16:55, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Tue, Feb 10, 2026 at 03:44:33PM +0000, Bertrand Marquis wrote:
> >> Hi Roger,
> >> 
> >>> On 10 Feb 2026, at 16:11, Roger Pau Monne <roger.pau@citrix.com> wrote:
> >>> 
> >>> GNU assembler will consider '/' as the start of comment marker on some
> >>> platforms.  This is incorrect with Xen's usage, which does use '/' in
> >>> assembly files as a mathematical operator.
> >>> 
> >>> The behavior of the assembler can be altered by passing the --divide
> >>> option; unconditionally pass this option when available to force the
> >>> expected behavior.
> >> 
> >> This is solving the issue and I can build for arm with what and further
> >> for x86 on mac os but it fails on check-endbr.sh:
> >> 
> >> /bin/sh ../tools/check-endbr.sh xen-syms
> >> stat: illegal option -- c
> > 
> > Yeah, I know.  I've fixed the stat issue, but there's a further one
> > about an illegal bit sequence in grep.  I'm looking into that.
> 
> LC_ALL=C grep is fixing that one on my side

I haven't tested that one yet, but yes, might be a way to solve.
Would you like to send the fix for grep?

> with that and stat -c replaced with wc -c < xx I can fully compile x86 on Mac os.

Yeah, the problem with using wc is that you have to read the file.  I
prefer $(($(du <file> |cut -w -f1) << 9)) because that avoids reading
the actual data to count.

Thanks, Roger.

