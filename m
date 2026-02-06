Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBx/KMUChmmyJAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:03:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCDFF6A4
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223327.1530888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNMc-0001ty-TF; Fri, 06 Feb 2026 15:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223327.1530888; Fri, 06 Feb 2026 15:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNMc-0001s0-PX; Fri, 06 Feb 2026 15:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1223327;
 Fri, 06 Feb 2026 15:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voNMb-0001rp-5O
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:03:17 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2a403fc-036c-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 16:03:09 +0100 (CET)
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by PAXPR08MB6479.eurprd08.prod.outlook.com
 (2603:10a6:102:157::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 15:03:05 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::9f) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 15:03:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Fri, 6 Feb 2026 15:03:05 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB8262.eurprd08.prod.outlook.com (2603:10a6:20b:551::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 15:02:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 15:02:02 +0000
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
X-Inumbo-ID: f2a403fc-036c-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B1xPGy8gWwBBSIsoo2WadZKCyPQUMIrroAWaEG8mjojkm6AqEjAiL+Ti2XZaCJm9HxbM/nJ/eQ2YqVdLDnoeAZMpjGxdHRRL1/oa42t+xfbexbqsx7QsEySc+E2cB4lA+qYb/Y1N+0fVbVukp5XWwrTM2Xx2JdcE04AGhdZso55tufSoxCtkYBLAmEJR/SAHfvN9gzfP2lulNraWgtt9gloea1oyaqCfpvzA/9RPy98zBliYJoJ4JHm41/KY2BDwpLkyLmsrvwW8Y4wS0C2vsSulARzL8CCm7QL6nMu6pGOPHcUJyvNqNErxC3DZnb83plCtBAnho8+JZjr5gM+IrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnKYQMeDVtJmn4VMa68DYKnindDHzlMgDeE5Va9Lw5g=;
 b=HzhmYGlOxUe56N/0LZc9okJI50DJE7CYBggPeAImRV2k9V7pHkbBnPgUi//ngcPqjVA9fNTybyyhH5mi/yIqyrDP2kzhUz9KMKGbxZ1Lx6Q8tZavMir3IOacEoNirke+tEtFY0CVF2PXKf0hblkhXMqVmc4yI365NLlHYoG8yNYDPmMnS3kGJtbRY6dz+OM+U6fTPztbm6wqSHuXKA+mEOSZxqmQQaCf/cgrOVTJIhnit4JRGBvUarY9Ku41zKy+cSH5cgkLKRU540M5SHHL8sW8mdi3zZ1TL7RCLXuLhbDyNJpkDHzezq/0g+HIrUPELj1RgWRrt1cUd8Yz5+CJLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKYQMeDVtJmn4VMa68DYKnindDHzlMgDeE5Va9Lw5g=;
 b=l1hngG6TaS9uq3C58+NL05vvDBsSsgIrPRe5mdp2wW0mH4YWDBUcVG4ILWmjQRJEz6gDIGRFiRWFZCvNcJdBhHIrhEIDoLpF650dFPPv82S59sx/S2xdIGqe4Sz0h7NlTDhDsLC5DkXPP5gWh1v6PpKS1aupg+sVgs89r2zDPj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOOmUXnbadggPfcjCAtagM46rwgMVH/ooAm4ur3aggDWxiJHjp1O6TLAD9Gh/BGjTOuzYJgnb2F6g+fzH1gGSgq88kLU15Z2KuLTG7aFHKP2zCgyrMat+Vp5RQsygyQPey4P+77iLAEjefRWYffPITPu4Q9JKmq7N2hpSMqKDRI1k5AEZwoaUd6YJFoz5bMzYbmEHktYlcFyuLIiLwWprrat9z86UFh98ERk5CjWu49PNNC7eoSCGCTAfkb3XjRpEb1wiBF/aZAdtT5GWB6kVZhXThmKkUqA2XT2qrR7f2iSFUKQfIXZO5zJIvRVjlgTeWj+jW2U21iFl6fU9ZZ0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnKYQMeDVtJmn4VMa68DYKnindDHzlMgDeE5Va9Lw5g=;
 b=KTzvYFvlxWjobdf6BrRKJDRj8ZQYd79ZRRNqCY06tsuKYYLXzeg2QYinLcwAsJAwBuUXwUkvX93xWm+fsUgTYATIpW2Cnekpwg+Y/A2UalSXuZR4xqfyeukz6OwNP9ZrJQEUqarnnAN492uhSOyH7VrCH7VVjQC2+w4fyTTSdR6UN7IRkXG/COkcFNT4H+FIKYISCNW8VTS2exn5fsrnxn55HPiAP3MlaXVeApv+30OejdQEWzue9I3B3naNjJv6Y755kzE8AynewftXPkLaKYkaXd3cQ+d/KV3LX1GGBDKIDKnSDHSiL0GFX5nUueKiBhYjXyykVQ249O2xsqvrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKYQMeDVtJmn4VMa68DYKnindDHzlMgDeE5Va9Lw5g=;
 b=l1hngG6TaS9uq3C58+NL05vvDBsSsgIrPRe5mdp2wW0mH4YWDBUcVG4ILWmjQRJEz6gDIGRFiRWFZCvNcJdBhHIrhEIDoLpF650dFPPv82S59sx/S2xdIGqe4Sz0h7NlTDhDsLC5DkXPP5gWh1v6PpKS1aupg+sVgs89r2zDPj0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Index: AQHcl0ETIV6m5wqgrECh60MWgPTuGLV1etQAgAAv7QCAAAFMgIAAGAqAgAAAdAA=
Date: Fri, 6 Feb 2026 15:02:02 +0000
Message-ID: <668E74DA-1441-45A4-90A9-D720CAB7B04A@arm.com>
References:
 <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com> <aYXsvu3HlPuCUuY8@Mac.lan>
 <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
 <3c6fc5d9-dbb4-44f6-97fb-85095429c7d1@suse.com>
In-Reply-To: <3c6fc5d9-dbb4-44f6-97fb-85095429c7d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB8262:EE_|DU6PEPF00009526:EE_|PAXPR08MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acfb9bd-f830-4581-6742-08de6590d4e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RjdMOTczaUk5eG1Zb1F5MVhZWEZXdlVUN0dGVk9rK1d5ZTRRVzc2U0lEMTFK?=
 =?utf-8?B?bEx6emM2NE9FbEUwUnovc2VaYmxYTjVERStZL2NRVHV1Z1l2SGIyYlZFSHZY?=
 =?utf-8?B?enhlY21LbWNkUlZ1dnFINkM5cisvbExJbS9uYUVqc3czTU5xQjdVQThPdFFz?=
 =?utf-8?B?NFdhRXNlSVZaQkNwcTR6R01iSFRvQ0F1VVFIbjlWMTV2Z1hEa0cxSkpyS1Uw?=
 =?utf-8?B?K0Voc0dOZmJXdmI1NC9CS0dKaUFveTNaR3BRekVXVkdtNmp1eVZ3ajBWMlNz?=
 =?utf-8?B?RE1SZnpUQWk5NS9qSGJKdEU5TzVWc3JLT29BL0Q1ZnIrTXh4Nmk4SmNxRHRI?=
 =?utf-8?B?aWpBUHVScmJ5YlVCcnREdi9CaGlOcE1SVFROTjRPVlJRcDcyZnBMUW5lYkdv?=
 =?utf-8?B?WGJiNkF5SHh0cXlxRWN3aTdlbUh5Zm5Md2h2Z2xrcHk2UG43b0NtSG1jblBz?=
 =?utf-8?B?bmFqMHBZS1J0cXRaVUpPcUY1d2tHemFkSTVmcCtueWpueFZPSnVjZ2Y3L1JG?=
 =?utf-8?B?eXNnWjV4Y0NOcW1HaHZ4OTFlNGwwSWtnZHFSUXhyMHdVWk45NHdkOXZrd3U4?=
 =?utf-8?B?aFpnMkdEbmhQNURXM3ZEL01FVXljMkdMeHk0SVV0NzRXV1lTN0QrL2FoYkV1?=
 =?utf-8?B?YnJGK2FBWTl1MHBSUGZ2WFJIZmVxZDFzc0RUcTRTNVNrMkpHWStOUVBUVm0w?=
 =?utf-8?B?VExNaUh3ZkVQZVZuYkppdGE1MGFJL2pQYTl6Z3RZRzN2QVNDUXI5OUhPYnJ5?=
 =?utf-8?B?OUc4Qlk1QStmRThhc0lvK2NqaEFQbTBtYVdqSWZFdmxSZDM4alRPT2Zkb2do?=
 =?utf-8?B?S3BVdlNuOG43MkY1TkNxMDZGbHFrdjYxa3pwVVpZRlhBelpFS0M5WVM4OGsv?=
 =?utf-8?B?bmhWaWpCdkRHd0pVV0EwOVZDdmlNWGYyc1NQWEdpVkxJa0lQNW1wT1o5THdz?=
 =?utf-8?B?eWJqdGI1UXVPcXBBRndGakllRXYvcnVXbTN2enNUT2RXQUx5NHd5YVdXTnJ6?=
 =?utf-8?B?dXltNm8zR2VMMS9FdW42bTdURzNiZUFNdWNxMHQwaWNuYUFwNVdnUzZkNjFV?=
 =?utf-8?B?bkFBYnNSOUw0SnA2bnJMaTZ0NklOc1I0S0hjRy9sSExObVFJVlMzNzdiVzdB?=
 =?utf-8?B?KzFYaEtHaG1PZGw5eFVkZDNPRXFYL1dyN0pkRkRxeDcyTy9hbkF5YTFpdTVB?=
 =?utf-8?B?WWdXS2ZrNFJiQXNHZHN1Q2dzNVJobFVkdnA3cnNad1M1VlYrcWRQekV2Um55?=
 =?utf-8?B?bHJ3am1XNXVRZ3NtMHNialg0emkxd0JhbGRDLzVCRDJTd2VZcGJUbmJLWXJt?=
 =?utf-8?B?Q0J3Mzk3WXdjam9VWkNPUjhldVNtd2VnR3dOUExRSzc0MHg0ZG5lVlFIZmdu?=
 =?utf-8?B?R0M0c09ZNjgxbEcwVVBUWEFoOWY3bWlNbVUwZGZpNGZhOEFHbVBjSG1SZ21J?=
 =?utf-8?B?TTU0eVNjUFE5eE1GeEtJM1NhOUlPUTVKRFZHSkZndFFsZHNycFR2TkhkQUgx?=
 =?utf-8?B?OVJWbXNkVlhZdUFTdkZCZFFOOGduaFRrWktyWjY1dTZCbzVNUW9hMDAzSDFV?=
 =?utf-8?B?YXJwa3RSVUdKRXRnUlFQZEdhblhEazFPTzlzSFR4R2hHeStYaGpaOG5LNFg1?=
 =?utf-8?B?VWw5OFhkdjJsVzM1Tml1Q2JXUjhVUmcvZ0s4YUpOdnovcHduVVRMUkdHbklE?=
 =?utf-8?B?Zzg4Y245Y3htNkJteHl1MlUyd25pWFVZaWRvQTQxRnhXWUxWS1JnYkp2a2Nt?=
 =?utf-8?B?aFNRVkFmbm1hd1hVenc3enRabFZidXF0TEgyKzJQaERYVWVLVXE1QjNxdlF0?=
 =?utf-8?B?bDhPakNEcXhVandLMkttdUkxZ08wZFFZd0dkYkZIbTBWQXMzdHBOY0NMV0Jv?=
 =?utf-8?B?MWRPQ3p1VTlxOHhJY3JFb2gxcFlvSXA1YTY5b2lrdEFBbXQ3RjFieXlsSXdD?=
 =?utf-8?B?dEhkTnFvdlV1THc0a2h4OVRDcExuRXZ1cE14ZmVLMFZ6Vmh2NDNYaGtreW42?=
 =?utf-8?B?ejQ1ZG83NjZGQXE1UFhQQm1pcVl6OWdOZVR3amsvTUlZNWJHU1AxNGY4aFFy?=
 =?utf-8?B?dnZqNkVIK2ZvK3NlaDFYMDM2UzZyV0lZeVVFbmxwWlJhMldjblMvWXpNTmxC?=
 =?utf-8?B?c01HUXlVb1dId1JvMlVxREJnL2NCVlRrSVhaaFdDaERHMXM5eUs2OTMyeTVy?=
 =?utf-8?Q?Nk17SEURrLETWtgSXs2Idqo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <701B68A5C98277449A8754F93276CDD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8262
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	222ddd6b-16af-4be1-cbd2-08de6590af87
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDcyc0pwMVB5TzNSYkVMdm82WmMwYVNqdHRLemZ6Q0UzWFl5aUJTMVBUQTdG?=
 =?utf-8?B?cXFDL1lac0p1Ym0vaHBTNE5KZW9UcU1kVkhvRzI5cWRUdXNmWk9rVUVycURO?=
 =?utf-8?B?ckorKzNSMWxSU1NtaXI5L28vdWNSakQ1SXpiR2hzQnd3OE14NFRkbTR5cUlB?=
 =?utf-8?B?R0pkaWdkTVRWbXIzcmZEYU1EYlQ1b290UWdTOTZJV3p2emw1aHJYZElidWRR?=
 =?utf-8?B?LzNmbjc0VHc1Nm56M05rQW5FNWpaVDJxQTJvMUVEay9RTitjb0Q5MThYcW9t?=
 =?utf-8?B?LzJJaUhRTWtaL2JUeTREaFJDNmlCR25SU3cxWk9SN2V6d3VvSFBlWE1XaU8w?=
 =?utf-8?B?MVFZVXRRMlZBMmlJSTI2anNJbTB4QzlMampIcTRCaUlkVjBWaW1KcXk2NjNi?=
 =?utf-8?B?THhQeEV4ZEwrS1BFWU4yV2srN1ErUHpRKzRhT2ZiVmpXQU1DREhIMXF0WUwy?=
 =?utf-8?B?TWc1YzBpbXFSY3QxcFNQR1ltRnk0TGdWWnJTOXFDZDRneDllbllMQlBYbXFk?=
 =?utf-8?B?YlRkVU5YUzhTQmM5d0pOSy9WemhGMFkxaUZyL1N6L3AxRnFvODZvYVU3NTdo?=
 =?utf-8?B?UW5iY1F2clJLenV1SXorYzlpVk50Qk1GV2VFaVJSVnZqUjkybW5GbEdubkpE?=
 =?utf-8?B?U05ZL1ZCSGY4aEZqVllzR0FDMmZNT0NZS3AwUkRTTUYvSFNqNTRsUG1XY21I?=
 =?utf-8?B?aW0ySmg1UDdIZk9hUVVCY0VQOFVjYWFKM1Jub21xaWpzZnFwNi9SVitPYSsx?=
 =?utf-8?B?a0IxblZFeC9BYlludjY3aHhXNzFsT2h6MXE1YnNHa3RSbHRHd3BkTEUzdnZo?=
 =?utf-8?B?TU9WRFpEZ2Ftd1p3dXB2YjNvd09KaThaRG1sRVliczRQUlQxcUQrN0s5eURy?=
 =?utf-8?B?UnRYV0ZMZDVrL3dkRzNka1BOR0hKM3dUNzR6eHlSeklYMDhnZU5OWUdSdmdy?=
 =?utf-8?B?TUw1Nkp3U25WVGl5WURQWVdkZWNhWXZGRmUyWmlPeWg5TmpCcUUzTk9mQzhs?=
 =?utf-8?B?bmNsb3hQSXdZOUhzTWRFNTNZV0plU0tyVzUybE10b1RjdHRWZWp1UVZQNlFq?=
 =?utf-8?B?VkpGaDF6VXNYRUlEb3pxWnNlbDhBWFNFd1B6dDhOTTRyQUI4R1gxMmxjRlUr?=
 =?utf-8?B?VkNscWJYcDAzV1JwMnRIckZNckdMRkJUTkNuTTJJUk5ua01nZklMVGp5cDF0?=
 =?utf-8?B?VXgzU3htYUJnaGdUOWxPVjQzd1FCVDdOdzNXbDBpVE9xaU1rRG1PZm1VRzRm?=
 =?utf-8?B?bVRhWmkzVGVaNTBOSUdiS3V6RWxFNnE5SGJQNjY1RW13T2NMKzJtUTdLWGlH?=
 =?utf-8?B?UGo3R0x2dzdpR0RGdTU5RStvOHMxbmlmZDQzai90RnlQK0srOGlwd01rbGM3?=
 =?utf-8?B?U2szUUcrV20zYWtVVGlmdFZXMmJ2WjFRTkp3TnVHcFRhWGNLY2Frb3kycHpB?=
 =?utf-8?B?bXA0cUtzdGxRK0N4NjYzdElwb2kxeWdCNUYvQ3JwaS81WnhVeWZrTHkvOGg1?=
 =?utf-8?B?bUtabXl0emJDNHJFMkRnMmtpU0Y0eUw2WEFsM1k1WEI0WkVtaGR0bEdBeG82?=
 =?utf-8?B?N3JEcGFPblFCajNRdFk0b0NTbUcrUFYrWFFtR1VnNy81dDRwa0FENTEyVWdh?=
 =?utf-8?B?SE5GcHdFNzArRkN1TGdSSG9DUDYrMGhMMlQwQ2I2WVJ5Ym9CNFZQRHdTWTRK?=
 =?utf-8?B?M0tWRVhpcWh5Q0hKTkhZTUZlWVhhNHVObUZFN1FCSGEvdElJRFF3Z2FxSzhX?=
 =?utf-8?B?cktCQVVYNVd4TmRJYnRhdXE2Q2V4NlhJRXh1OEZtcVFMczYvU3B3RG9SNUh4?=
 =?utf-8?B?THloVExJU0pJcWRETktuSFNBKzUzSVVJeFkvTXVGSWY0NXBkYk8weWhrY1U1?=
 =?utf-8?B?aENyN1VLMkRUa3pkN0p0eWdnNDg5QUw2ZkFrWWtFS0FrK2QwbXlOUFJxenBi?=
 =?utf-8?B?cnh0a0V6TWVnODFhMVFtcFpBM0tVSEo3a0lTVS85bXZMS25TdzhtVDhyYnZp?=
 =?utf-8?B?RU9FMGRoMzFiRURqbXdBNm9vY2hFMDE1L2IycjJ4SDhLZWFDVy9ZV1NPTjVr?=
 =?utf-8?B?SE9sRksxYWdXSlNUMHVCaVM1QUc1a0dBMkxnbFhFbjg1N2JPbnBYdU5jUXhv?=
 =?utf-8?B?UlhPK3JkbCtKMkhGcFdjMWZMRHZOU01SSU9ZcUM2SFpLTWxwaTBuUy9jbWZG?=
 =?utf-8?B?U3NidDhLYytaNDU3QldOZXRscVdXeHBYRUI4dWRVcTNRcU1pcFlDNEo3M2xO?=
 =?utf-8?B?WEszdmpsWG1JajZVYkhVbHhqNkhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZwtugPE2+tg2wWeo7ULp2r8GtbAb8GcJBzuUHnGsu/kY6tUHg2brV5XCWQ+pBqFnL1S+gC/5ldTf1CNZVadFy5lW7WhDYGdZDt1iHZ29Tp1JQNO97iSpu2b1BaFVftEFlIqW9aJYKq94ihG3sPP0mhZV5bH9eQTBLEOXztr2Z+2DdESvmPvQuNMH62cffMTgsIYMDdhNlAjnUu+6oHfbbS4mUnGjt72G5gfM7uoQ/7i5zOes3h5fezia3FiKFN6X5a6PfrQ5yhWLlCXMZM5R4JKZCRhjBrieBeC5BMCJe6KUtEELfvb4a7Xsm8x148d5Ne90UvOcC2XhU3znhXZdfDKJHa8518B69+NMv8Lf5jJMiIgMkWJ1qs3K2ntNE9FzZoSFtIIJXj+Zz2WD/0k2arWfsoNGgws07jLsjOk1jvLQAaabvbzXydrdHDaaAFmI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:03:05.3756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acfb9bd-f830-4581-6742-08de6590d4e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6479
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:email,config.mk:url,darwin.mk:url,arm.com:mid,arm.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C9BCDFF6A4
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDYgRmViIDIwMjYsIGF0IDE2OjAwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDYuMDIuMjAyNiAxNDozNCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+PiBPbiA2IEZlYiAyMDI2LCBhdCAxNDoyOSwgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IE9uIEZyaSwgRmViIDA2LCAy
MDI2IGF0IDExOjM4OjAyQU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNi4w
Mi4yMDI2IDA5OjE3LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gLS0tIC9kZXYvbnVs
bA0KPj4+Pj4gKysrIGIvY29uZmlnL0Rhcndpbi5taw0KPj4+Pj4gQEAgLTAsMCArMSw3IEBADQo+
Pj4+PiArIyBVc2UgR05VIHRvb2wgZGVmaW5pdGlvbnMgYXMgdGhlIHRvb2xzIHdlIGFyZSB1c2lu
ZyBhcmUgZWl0aGVyIEdOVSBjb21wYXRpYmxlDQo+Pj4+PiArIyBvciB3ZSBvbmx5IHVzZSBmZWF0
dXJlcyB3aGljaCBhcmUgc3VwcG9ydGVkIG9uIE1hYyBPUy4NCj4+Pj4+ICtpbmNsdWRlICQoWEVO
X1JPT1QpL2NvbmZpZy9TdGRHTlUubWsNCj4+Pj4+ICsNCj4+Pj4+ICsjIFhlbiB1c2VzIExpbnV4
J2VzIEFCSSBzbyB3ZSBhcmUgY3Jvc3MgY29tcGlsaW5nIG9uIE1hYyBPUy4NCj4+Pj4+ICsjIEZv
cmNlIENPTVBJTEVfQVJDSCB0byBhIGZha2UgdmFsdWUgdG8gbWFrZSBzdXJlIGl0IGlzIGFsd2F5
cyB0aGUgY2FzZS4NCj4+Pj4+ICtYRU5fQ09NUElMRV9BUkNIID0gRGFyd2luDQo+Pj4+IA0KPj4+
PiBJIGZpcnN0IHdvbmRlcmVkIHdoeSB5b3Ugc2F5ICJmYWtlIiwgc2VlaW5nIHRoZSBmaWxlIGlz
IG5hbWVkIERhcndpbi5tay4gQnV0DQo+Pj4+IGluIENvbmZpZy5taydzIGNyb3NzLWNvbXBpbGUg
Y2hlY2sgdGhlIGJ1aWxkIGhvc3QgT1MgZG9lc24ndCBldmVuIG1hdHRlci4gU28NCj4+Pj4geWVz
LCBpdCBuZWVkcyBmYWtpbmcgaGVyZSBmb3IgdGhlIHRpbWUgYmVpbmcuDQo+Pj4gDQo+Pj4gSG0s
IHNldHRpbmcgaXQgdG8gIkRhcndpbiIgc2VlbXMgd2VpcmQgdG8gbWUuICBJIHVuZGVyc3RhbmQg
dGhlDQo+Pj4gcHVycG9zZSBvZiB0aGlzIGlzIHRvIGZvcmNlIHRoZSB1c2VyIHRvIHNldCBYRU5f
VEFSR0VUX0FSQ0gNCj4+PiBleHBsaWNpdGx5LiAgSSBob3dldmVyIHdvdWxkbid0IHNlZSBpdCBh
cyBmdWxseSB1bmNvcnJlY3QgdG8gbm90IHNldA0KPj4+IHRoaXMuICBJdCB3aWxsIHRoZW4gZXhl
Y3V0ZSBgdW5hbWUgLW1gIGFuZCBnZXQgYGFybTY0YCBiYWNrIGZvciBBcHBsZQ0KPj4+IHNpbGlj
b24gbWFjcyAod2hpY2ggaXMga2luZCBvZiBPSz8pLiAgT3RoZXIgSSBzdWdnZXN0IHdlIHVzZSBh
IG5vbi1PU1gNCj4+PiBzcGVjaWZpYyB2YWx1ZSBoZXJlLCBzbyB0aGF0IGlmIHJlcXVpcmVkIHdl
IGNvdWxkIGRpc3Rpbmd1aXNoIHRoaXMNCj4+PiBjYXNlIHdoZXJlIHRoZSB1c2VyIGlzIGV4cGVj
dGVkIHRvIHByb3ZpZGUgWEVOX0NPTVBJTEVfQVJDSC4NCj4+PiANCj4+PiBNYXliZSBYRU5fQ09N
UElMRV9BUkNIID0geyB1bmtub3duIHwgdW5kZWZpbmVkIH0/DQo+PiANCj4+IEkgYW0gb2sgdG8g
Y2hhbmdlIHRoaXMgd2l0aCBlaXRoZXIgYnV0IG1heWJlIHVuc3VwcG9ydGVkIGNvdWxkIGJlDQo+
PiBhIHRoaXJkIGNob2ljZT8NCj4gDQo+IElmIEkgcmFuIGludG8gInVuc3VwcG9ydGVkIiB0aGVy
ZSwgSSdkIHdvbmRlciBpZiBJIGV2ZW4gc2hvdWxkIHRydXN0IGFueSBvZg0KPiB0aGlzIGFuZCB0
cnkgaXQgb3V0LiBJJ2QgcHJlZmVyIGVpdGhlciBvZiBSb2dlcidzIHN1Z2dlc3Rpb25zLCBpbiB0
aGUgb3JkZXINCj4gZ2l2ZW4uDQoNCnVua25vd24gaXQgaXMuDQp3b3JrcyBmb3IgbWUNCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBKYW4NCg0K

