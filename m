Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4084C1CD3C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 19:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153057.1483539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEBHd-0003eg-Tw; Wed, 29 Oct 2025 18:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153057.1483539; Wed, 29 Oct 2025 18:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEBHd-0003bg-Qx; Wed, 29 Oct 2025 18:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1153057;
 Wed, 29 Oct 2025 18:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zIlg=5G=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEBHb-0003ba-T5
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 18:52:32 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b768878-b4f8-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 19:52:30 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM6PR03MB5146.namprd03.prod.outlook.com (2603:10b6:5:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 18:52:25 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 18:52:25 +0000
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
X-Inumbo-ID: 6b768878-b4f8-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzeRhSojtKVmumcHqaibQ/gxdT888CU0T9R/SrVRJWvmlELpQufpX7iw34ek9NPVWEqpbrE6ygJyvK6EHbV/XYgpVUxhS8Vflwa3seoVvFrbJLMeQRyuhKx77B9XMV6z6iUUWvx4S5J5voULgvIVEiY01jowPzBKXgmyoNJl5NiJI9+Yq3QItPrS2YXZApgCwEGYYufFKW+042gs+8WP5AtL4f1c6SoegweB80yWsjadopuQKL/NUBq5sIlSi+EsltKhPXbJiAhsRE2lvBVuhZ3cQmYq77MczC6WQrqgBzUeSB+tQWLGcfSH/WeBAnoZUIvlkhmM6X3/L9SyAH/WFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sH6INCtzCnQXwT71aQgpbPQwdn4imfrZtuBxjyU0ds=;
 b=uiIt05gpJ2IXGvmDSnoRrM5wngxTHtTZBEbiIWjVxHXubnfaboT9k1wXoQ7C3lGMxdvXYKUvbaguDXvBqgy8/lLVrFJJwnoau1eU1BG4zfaxUGJCTHKLW3XGWSV+OJZFhPJxL76BkYH80VmZ92ucF3j4SDIHihvRkKiIwSzS1BEtBOghplEINnms6aN+yLipd/6OO973FMV3Dr7csqzzFHFQvvhu4xwZtkHp3rk+FT2leKLpA7OlWBlUGrtD3AYv3/SXRj8bYZB9JElJCjchD0erVwY8RdaCpRISRUythFq5vf9d1z/lXbfcW7tXO5+eESczNex6Sf20wOwEHcS2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sH6INCtzCnQXwT71aQgpbPQwdn4imfrZtuBxjyU0ds=;
 b=KTOnoxGo8UQd6vKz0l3Rgrw7cKzMgHzbV4ltxXVzkOMv+2lGsUmrKbXv+Q5pJayaiXl8Q8ErW63mxnCgOJ6dURERNqm/ZqPLEEniia/mhJb33ksrA8Q13as/6wow+nQmwBnrj5PoEfRw+bYbs/TloJtAS17OKS4/ANkxHRB1NyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Oct 2025 19:52:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
Message-ID: <aQJiZQ37v9av7De2@Mac.lan>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
X-ClientProxiedBy: MA4P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::14) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM6PR03MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3434a43b-2d57-4dc9-c593-08de171c4ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1lEeHcxQ2tlT3c3Q0F0aWRyQS9oOUx1Nnc2eVN4Tm1QOFZta1h2UnRyS0VM?=
 =?utf-8?B?M1Zvd0l1LzllUFNlWm1yWGNLbEhzdXF0Tkt5N21qSG42aU5SdmE5TlRLeDJN?=
 =?utf-8?B?by9PVmV5dmNjWGRPS0lkRDZaQVVmOFhXUC94Q2JMZ3dxcXpFYUVyQittdkdD?=
 =?utf-8?B?b2QybDN2RVJWUEtNeWtFaGk5eEJ2aGV1TWM1VmFYSGw2bjU1NjVmc3RUSVph?=
 =?utf-8?B?UG9oNHFZWWVNblVtYy9HUDlOWGNidGhQUDZJMFQ0TFFvVy9YdHFIeEtUNWp1?=
 =?utf-8?B?NlhrVG10TXVXOUNaVVFzdUpROTdwVUxzWVlGSEhWRmdaREVMOEdLUGpzNnRl?=
 =?utf-8?B?aGQvTmJpNDZGS2N6Rnk1OTdYbEp1UmtDMmdqMmY2aVUxdjdNQnNudHBGdnhB?=
 =?utf-8?B?YjRxd2ZmV3hCRnhqTTVlTDJQbDVGbktuKzQxQTNaU2R4dDdUbTUyWFV6Qkxq?=
 =?utf-8?B?aTZNMUJTN2phZEszRW0ydVNhaStTMzN4K3NFZUFXTmU1VVFGT05HcFdTS3Fq?=
 =?utf-8?B?Tk40SEtITXBkaEk4RzdtV2hqdU8xSW9MeEFZZTBWRitzR0R4UFpFUHpsTHM5?=
 =?utf-8?B?MktDV0g1cnMzcHcxOHZrajZ5TlhXYm9rMU9KZlJja0Y3SHF6N09LUXZTV3Js?=
 =?utf-8?B?eEE5YWRpek5QblV3TDdCZ0lFeTdvbU9BQmR6Q0FVOHo4NTNaMDcwaTQ4VDg2?=
 =?utf-8?B?L0hQOXF3MkVXdDVhY1dVTXZmY1pZY0xQVG42T3VxWWNUaVBEQkNYTzFqWWVF?=
 =?utf-8?B?ZTVzR0pJcnhOYStqK2RGVlZFUjR0M29UbFlkU280Zi9DQkpiK3ZieWUrSHYy?=
 =?utf-8?B?bW1TSnUvcjBDWmtaUGtvSGZoTGt3NjJQVXQzRk5TSDhhNUZrWUoyOWNzUWww?=
 =?utf-8?B?anllbHhLTUNDTmlidDJPNTA4cDFmbFhCc0kzNWVTVHRJZk15TkFKN0p0bEVI?=
 =?utf-8?B?YlRqUEVqdWY2eFpnMXZnNnRVVDBEOHhSeEVqU2pKM3JCNThreUZJMnlTVjhR?=
 =?utf-8?B?VnVaeWg1STNTSjhMbWlyS3E5U0djZnBWRUVzeTV6bmhhM1JhQlRDQm1nRzlI?=
 =?utf-8?B?Z2ZoRHBPWllVV3FRMXZveXJPTFhGSFNabVVraDR6YTJrYk1BNkdiTS9CRmxi?=
 =?utf-8?B?cVFOZ1lmNWh2SlV0WmlFQ3ZxdXlkaHQvOWRGUy9WUjdmNlo5UTU5SUhvV29l?=
 =?utf-8?B?Q2NoY1BqaUtPZ0lpcFBwSFovc0ErWFM3QVJBU3ZlbE9MVW5UcCtmZ0F0UkJO?=
 =?utf-8?B?aWVDRWlUUVFRelFMcSsyODJ3SFdpQ3htTmNBQWRUam1ZQm54VUlzVHp6Z3U3?=
 =?utf-8?B?QzU2UGtwSE9yUDl5SkFsbDdGRit2WWtRb1NwRUNoOFEzd1hEejJWc3ZPT2Fm?=
 =?utf-8?B?VVg0V1VQRUgyRUFjMDFORGZDZmJJL3N1bHB3N0pXSG51OXFEeGRPMHdSUDk2?=
 =?utf-8?B?ZW94VG9XVXNBTGt2alZrRDFMUDZpcWhkMFA4ZnZJbW4yR1hzLzdhNERyTWtZ?=
 =?utf-8?B?ZzY2RTBDNGRZbExEU0JpSldUaXFxM2kxVzdUcmZCemNPSVI2blpMVkh5bUVp?=
 =?utf-8?B?WDYzNHF3YzRiZ29aNGczVmJac2pVVUI1Q1hUNHI0a1hTOXE4L01WL2NjSzd1?=
 =?utf-8?B?a0VEa2p2a0tSYXNWZXBkeDNJUms2T3NsamlmYVppVURMM1BlMnJpMklqUDJN?=
 =?utf-8?B?eGdpU2s3WDlqRXByYVpMTnI3czlKRkJDSkNxeWFaN0xWeGJKbWcwdnh1UFBO?=
 =?utf-8?B?cG5xTElacXd6TDN3d2x4ZE91OHgzQm5zWE0rRndXeU9VTWxSVEpYaW1WdXNL?=
 =?utf-8?B?dVRoMzJJR0F5ZGErMjBEd3BpbXY2enpGY3Q1L2V3dDN5RTBrMkM3TDgyVmdL?=
 =?utf-8?B?bytCT0VsbEVmRzVsazVPYTRUYzRuWXZhOWJmLzZiWGhESmZoUzRFSXdpbEQw?=
 =?utf-8?Q?hwpBJgBl5vSSSO9GpjJr4gpsgdDtHzaQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhhWHA0bStrUFFxcG9SZDlCaUhLSll0Rk1MOTlqQVA2SHd3Z2ZvTDdPdXlt?=
 =?utf-8?B?NWplYnIzaExkc1Zya1lBZllpOXlGby9SR2wvaUJaMkF1Zmcvdll2cWwvQnBV?=
 =?utf-8?B?VHgwVGZKbHZKeDBWSHhLV1hmMTlNTlZIQ1ptYkU1aUF0YnNwdU5CMjZVcEFE?=
 =?utf-8?B?VnpkR3FBS3N1YnRCNVV5RG5yOVEvQWNJeW5FV0htNTkxWUpVVFFPUVozVWx1?=
 =?utf-8?B?VXlkNHZlWlJEM3hCK0FkTVhnMzhsUzdmQVBUMEJjcHJya2dGb1ZCV2o3Ky9D?=
 =?utf-8?B?VHV3YUY2ZjRWMGdFS2FMUkg1SjgrQlhtYit5Ync4Smh4M0VjOFJ5VVlvNWpa?=
 =?utf-8?B?TGdpeDUwbEI0b2hOT1krSjUvdHJJOVRjdkFyc3NBTFBLY1pDSEdCc3V5MFJz?=
 =?utf-8?B?UEpBdEx2RXJFbDFmM3lUMFlsdkJkVVlhajNaWC9FWllVSWxJSFJmTDVyZnNL?=
 =?utf-8?B?ZVFUZXlGMWpUR29QdzBXUHdGUFdRd1NldDJKTFU4STdoUnZMREN6dFRSQzhP?=
 =?utf-8?B?SUtxTTQwU1lXNmRkL0lJc3dIZlBXcG5FVDUrYm5CWElMc0xvcmp4Uk5VVjBY?=
 =?utf-8?B?Ly9oOG1tUTBDb29uY3dnaEp4UjdObHVzWHZtWjlMSDg3Uk9UbHhaNktSam9R?=
 =?utf-8?B?aXIwdDVSTkIzSFA2S2hvVWNOaTFhV2kvTk5vOFNaOTZrbVRpTXloR0U5VS9I?=
 =?utf-8?B?TlQ3QkI3MWhmQWFmR0tzSHVyM2NQZWh6NkdjNVF5bjUxWnJhT0FuU09XRC9W?=
 =?utf-8?B?cHladnE4UndRcTFZOG00QnpNL2xMckRZQjIvSWR2d25EYkRSRkJzSFJIaFJF?=
 =?utf-8?B?OGVrb1BqU0FJdGxhWGdvNm1QL3QzRXFmSEU3TGFUaUNxRUZLTWtOeHdzZFcy?=
 =?utf-8?B?YW5xci8vZW1HdWFPYVJpVjZIeWNoSTZPNUp1U25YZlA5eUJJbG82S0JHN2lr?=
 =?utf-8?B?T3V0Z1hnQUNpMXFKdVlYcUlPSStKTDM4TERBNmdpcFhpWFJPVzFRZ3VCblNF?=
 =?utf-8?B?dGxQS0FzLzVsK2RzcmxJV0dpbEpOUk56R09uT2s3cjd4bE82WnlVNjEydUpa?=
 =?utf-8?B?RnJRSElNWHFSemQwL0xJbUI4dHp4eURad3Awd213SnJOc29pUDBQNm9lbGlW?=
 =?utf-8?B?RzJQU3FhVk9PZWl5aldhNXdKTmc4bndLMDVrRWhTaG93T25TaDNYbzQyUmJU?=
 =?utf-8?B?cGVXeXoxOXdXM0F4Rk8wL1NaWkFXYTE4UU1jWDJ5WnNpWmh2OWcvYWMzYkxD?=
 =?utf-8?B?bXVRVldtZDVKZENiNXo1aU1UR0FTMUZGVVNjY1JkdDMyeHUza2dLN3pBeG4v?=
 =?utf-8?B?akZ2ZjhDU282SU05YldhMFVWRHJ4Snc4eEpZWDZYa0xFZkhFa2dzQ0Z4NUIv?=
 =?utf-8?B?VTkvZE9CbHRicjhvNUE1a0MxTTZ0WmRnNWlCWnRhZGhIWmgyTkg1aUh6NDVW?=
 =?utf-8?B?S0hLV0dsL2FESUltU1UrMks1dEhVdVpzZXZ2VVhKSHVSM2hnTStuTjVyQ0gz?=
 =?utf-8?B?a3ptMlViTXRkSmRyblB2WnpSWE13L1hUS1BrbHhKaEwzdEJUOHBNeHNWWGtK?=
 =?utf-8?B?QnhIQ1hhZ25IOThSUi9qMUdhTGZkQVNqODVKUThIdnYraGtZYVZNTWRHTElk?=
 =?utf-8?B?a3FURDhOdVhNWm52N2grQU9lbHI2YjB5dSt6VldaTEN0V0kxZGl2VlJNakVT?=
 =?utf-8?B?KzRNZlZYeTczRWJuWU1Wd21vRjREUDhVTk04dHhDYWhBV1dnbXd2eitnNnAx?=
 =?utf-8?B?TURRVGwyc0xjNEUxVTNGL3pKaTJjU0lYQUFObytldmQ0T0txaHY2VzVJczdD?=
 =?utf-8?B?dzRmN1pNc3BwalFMRnovT2pvM1UxWHVCSFo5UHN4WnlKa00yRU5xZnJuL1V3?=
 =?utf-8?B?N0cxZktZYVgxU01kaGRDeU90K2k3TC9YVWM3LzRBNTNkSTczSU1SM01DaHBy?=
 =?utf-8?B?UlFiMEtYb2tZYnp1WHMvbnZtYnJEWWNIR1VnZlI3TlgzN0F0RnVtQ0R6aHpV?=
 =?utf-8?B?ak9sS1U4ZWQ3YkN4VWg2dTJMa2orVlhYMmRHcExkVEdKd25nUXhBU2Vxa0lV?=
 =?utf-8?B?bmtlbUlFUnVwM3Q3VnJERjZSU2w3eXB4S1dRclU3Yno4WGN3dlg1d2RLWS9D?=
 =?utf-8?Q?2K2OfrOl6QguSeet7sVvdqL9m?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3434a43b-2d57-4dc9-c593-08de171c4ce2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:52:25.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKZowiFTetYK/HLl/yGvZivky/HJM3h/nAgkpH7n76YuHRmdVhpSCjsuTM7imYYChZpV/hk6zO694DfTQHcVfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5146

On Wed, Oct 29, 2025 at 06:26:14PM +0000, Teddy Astie wrote:
> Introduce a new flag to force the x2APIC enabled and preventing a
> guest from switching back LAPIC to xAPIC mode.
> 
> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> architectural MSR of Intel specification.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Thanks, some initial comments below.

> ---
> This feature can be useful for various reasons, starting with SEV as
> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
> boot unless x2APIC is initially enabled, even if it switches to
> x2apic afterward). It could also be interesting to reduce the attack
> surface of the hypervisor (by only exposing x2apic to the guest).
> 
> As it can allow to have MMIO-less guest (using PVH), perhaps it can
> be enough for avoiding the problematic cases of virtualized INVLPGB
> (when we have it).
> 
> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
> freezes for some reason, NetBSD doesn't support it (no x2apic support
> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
> with xAPIC.
> 
> On Intel platforms, it would be better to expose the
> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
> guest, but it's non-trivial as it needs to be properly exposed
> through IA32_ARCH_CAPABILITIES which is currently passed-through.
> 
>  docs/man/xl.cfg.5.pod.in              |  7 +++++++
>  tools/libs/light/libxl_types.idl      |  1 +
>  tools/libs/light/libxl_x86.c          |  4 ++++
>  tools/xl/xl_parse.c                   |  1 +
>  xen/arch/x86/domain.c                 |  2 +-
>  xen/arch/x86/hvm/hvm.c                |  2 ++
>  xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
>  xen/arch/x86/include/asm/domain.h     |  2 ++
>  xen/arch/x86/include/asm/hvm/domain.h |  3 +++
>  xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
>  10 files changed, 54 insertions(+), 3 deletions(-)

Seeing there are no changes to the ACPI tables exposed to the guest,
do we want to start exposing X2APIC MADT entries instead of the plain
APIC entries?

The ACPI spec seems to suggest that you can expose APIC entries for
APICs below 255, for compatibility reasons.  But given that we would
force the guest to use X2APIC mode it would certainly need to
understand how to process X2APIC MADT entries anyway.

Not sure it makes much of a difference, but wondering whether OSes
expect X2APIC MADT entries if the mode is locked to X2APIC.

> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ad1553c5e9..01b41d93c0 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3198,6 +3198,13 @@ option.
>  
>  If using this option is necessary to fix an issue, please report a bug.
>  
> +=item B<force_x2apic=BOOLEAN>
> +
> +Force the LAPIC in x2APIC mode and prevent the guest from disabling
> +it or switching to xAPIC mode.
> +
> +This option is disabled by default.
> +
>  =back
>  
>  =head1 SEE ALSO
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d64a573ff3..b95278007e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -738,6 +738,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("arm_sci", libxl_arm_sci),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("force_x2apic", libxl_defbool)

This addition needs a new define in libxl.h to signal it's presence,
see LIBXL_HAVE_* defines in there.

>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as it is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c..2e0205d2a2 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -26,6 +26,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if (libxl_defbool_val(d_config->b_info.arch_x86.force_x2apic))
> +        config->arch.misc_flags |= XEN_X86_FORCE_X2APIC;
> +
>      if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
>              LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n");
>              return ERROR_FAIL;
> @@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +    libxl_defbool_setdefault(&b_info->arch_x86.force_x2apic, false);
>      libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
>  
>      if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index af86d3186d..d84ab7c823 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -3041,6 +3041,7 @@ skip_usbdev:
>                      "If it fixes an issue you are having please report to "
>                      "xen-devel@lists.xenproject.org.\n");
>  
> +    xlu_cfg_get_defbool(config, "force_x2apic", &b_info->arch_x86.force_x2apic, 0);
>      xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
>  
>      xlu_cfg_destroy(config);
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..02f650a614 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -704,7 +704,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED | XEN_X86_FORCE_X2APIC) )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 0c60faa39d..73cbac0f22 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -616,6 +616,8 @@ int hvm_domain_initialise(struct domain *d,
>      INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
>      INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
>  
> +    d->arch.hvm.force_x2apic = config->arch.misc_flags & XEN_X86_FORCE_X2APIC;
> +
>      rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
>      if ( rc )
>          goto fail;
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 993e972cd7..ae8df70d2e 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>      if ( !has_vlapic(v->domain) )
>          return X86EMUL_EXCEPTION;
>  
> +    if ( has_force_x2apic(v->domain) )
> +    {
> +        /*
> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STATUS:
> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
> +        */
> +        if ( !(val & APIC_BASE_EXTD) )
> +        {
> +            gprintk(XENLOG_WARNING, "tried to disable x2APIC while forced on\n");
> +            return X86EMUL_EXCEPTION;
> +        }
> +    }
> +
>      /* Attempting to set reserved bits? */
>      if ( val & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP |
>                   (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
> @@ -1474,7 +1488,14 @@ void vlapic_reset(struct vlapic *vlapic)
>      if ( v->vcpu_id == 0 )
>          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
>  
> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +    if ( has_force_x2apic(v->domain) )
> +    {
> +        vlapic->hw.apic_base_msr |= APIC_BASE_EXTD;
> +        set_x2apic_id(vlapic);
> +    }
> +    else
> +        vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +
>      vlapic_do_init(vlapic);
>  }
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5df8c78253..771992d156 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -509,6 +509,8 @@ struct arch_domain
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>  #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>  
> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)
> +
>  #define gdt_ldt_pt_idx(v) \
>        ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
>  #define pv_gdt_ptes(v) \
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 333501d5f2..b56fa08b73 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -108,6 +108,9 @@ struct hvm_domain {
>      /* Compatibility setting for a bug in x2APIC LDR */
>      bool bug_x2apic_ldr_vcpu_id;
>  
> +    /* LAPIC is forced in x2APIC mode */
> +    bool force_x2apic;

This should be a field in the vlapic struct, but seeing this I wonder
whether we want to virtualize MSR_IA32_XAPIC_DISABLE_STATUS MSR and
set the bit there.  This would also help with migrating the option, as
you could then migrate the "locked" status easily by just migrating
the contents of the MSR_IA32_XAPIC_DISABLE_STATUS MSR.

> +
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
>  
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index b99a691706..75aa31d9ed 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -309,11 +309,21 @@ struct xen_arch_domainconfig {
>   * doesn't allow the guest to read or write to the underlying MSR.
>   */
>  #define XEN_X86_MSR_RELAXED (1u << 0)
> +
> +/*
> + * This option forces the LAPIC to be in X2APIC mode (IA32_APIC_BASE.EXTD = 1)
> + * using the same semantics as IA32_XAPIC_DISABLE_STATUS:LEGACY_XAPIC_DISABLED
> + *
> + * Attempts by the guest to clear IA32_APIC_BASE.EXTD (e.g disable X2APIC) will
> + * inject #GP in the guest.
> + */
> +#define XEN_X86_FORCE_X2APIC (1U << 1)
> +
>      uint32_t misc_flags;

If we go the MSR route we won't need a new misc_flag, as the toolstack
could set the initial value of the MSR_IA32_XAPIC_DISABLE_STATUS using
the existing way to load vCPU context.

Thanks, Roger.

