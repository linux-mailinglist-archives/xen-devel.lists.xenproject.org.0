Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NsLMvyZhWmUDwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:36:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C3FB0A2
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222840.1530531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGO2-0008RS-Mw; Fri, 06 Feb 2026 07:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222840.1530531; Fri, 06 Feb 2026 07:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGO2-0008Po-Jq; Fri, 06 Feb 2026 07:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1222840;
 Fri, 06 Feb 2026 07:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voGO1-0008Pi-7p
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 07:36:17 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c3874d-032e-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 08:36:14 +0100 (CET)
Received: from AS4P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::16)
 by DU2PR08MB7375.eurprd08.prod.outlook.com (2603:10a6:10:2f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 07:36:08 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5db:cafe::7c) by AS4P189CA0027.outlook.office365.com
 (2603:10a6:20b:5db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 07:36:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.0 via
 Frontend Transport; Fri, 6 Feb 2026 07:36:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AMDPR08MB11554.eurprd08.prod.outlook.com (2603:10a6:20b:71d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 07:35:06 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:35:06 +0000
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
X-Inumbo-ID: 83c3874d-032e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wQfzrrLbeQ4O0FCVvLLQkh8ablNmUhLcZvp9cxL/qLRtKW6mT2HcEAnw6L/r1sTkptL6swMGjPic0BkvtRCktjPW1dfZgEOTV+cR3xsd1nOxFxseU+XfPBtRn2tu04DqQHHVHdlT3a1uRfGzjs+I1W+hHryz8w1CILYC3aBtwkgVlKi3xCehs8sXGCPbJC2jDp2llfZpKDe2wST9WAWO/K8sENUV6bXoY10v2829QDcM8EvqIpqYHEC++yVL1wXH5uXkRgh9fi+gttNukcD/vdR++eZFPzp0UpSsBIqSUHmrgCC2urqa1PKwRFnz7FHifnNvtGLG2BpTkvdIY1+9+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffyCm7Pk2R4bH3nv9iG7TXNrGZh+hToGVhl9zu1//zA=;
 b=A+56A5U0Gwk96OFV0gihy6LsNR3zfvPyBPWXUOq8IhqVtLlV8LgR4Ro1ZCH45e28RTTdIrqfn8UIlXZZhwnN5hzcQFiLqKo519aQVa6/IBY0DVhX9MG22c/uUBQxg6no7rfAV7OExeqZwWhkIJpVlso6DB9ndKy+wIknGaQA2xC1sLMAVFuywxIAhjOYECsjDyEBxvfqg3vkryqLwdKYSBdjPr7KH1so++0+2Y5jfjaAH7dqiqXJFNTGo0PUqkP/+YW4GypynWHiodG4GgNp46VTlpk0f+CevwxhZBCw3lePKGi2XCR2G5RMM5qpX//Yw4baQcqHiZIYKZXZ4jZ9YA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffyCm7Pk2R4bH3nv9iG7TXNrGZh+hToGVhl9zu1//zA=;
 b=Cw1V0926Vz7MnWx9q30zS3VltJZIdQ+HxZ00RSZ//TXIKmF1ngVWjWlk5tmqV8KoBtz5+/rEaZpfzb0HXTego5cu9ZmE5j13GfqiXm2w5IQcX5K/hn1F82MFpPsb4q0tq8N3v41bHQLDbX4WmIJkp7XRzmpzqbHYe+J1f6jJo3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VormqA62W8MWDP80qKQb7+71qtBaa/IWnq5mQWR+mE4EPe2If65jDja3nciGXN8TJIy6kN6kEK1Sc5+SD16Tg4n0bLF4dZWLmjoF2Hcu64FuzjdCr+5kTEbP+I5kbgrFnJbgdIfdSQidShdnMz7ojwdqoj2p9LdWqY4ngIEwoRIXBIWiRuQoziuxWCl+VW/FijvVPYh0LwRfglSwkwD1jL/OI5cj4E0VDQxbc0nVQ3O2IadISBYnEF7OjUGA0fdT8JMwxnPbj8WmP1xgUMYjO7VKsGTC25v5yixtI7kL+c7bvMYsWp4HgflXIZxZ1qEWxkDgcwhfbxha5c+OT2rSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffyCm7Pk2R4bH3nv9iG7TXNrGZh+hToGVhl9zu1//zA=;
 b=ny6adE19Su3yZV0XcA5k7fLJD0d8yl1mRbZlXh18ROAFf+Vq795VCPaSltCslsgnYz26P1jP7MGPqX5dreOfw0nABYkTYqrQN5qlpP29wqFRV42hucdu/Bj/j4s8BEwZqwLf2U/w2lVpQYpiu3y2b4vK1lv+lrtN43CpxL+k3vr4gjXpBI/MEOb/jSGTIrSDlbFCjy8t8a+qLMxxYWKX1pxNUUTkTq43jNzlIZXrXP4i2SyKJ/pIiRoI5jPcvC5k0JiNoxW6MpcEH8kdTHUAxtUx4JL1SHyXn6Dq03amW/y2rWSHSgUWOTdBCIZxddOc/f0yqEtUXILpx4IRmH1OxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffyCm7Pk2R4bH3nv9iG7TXNrGZh+hToGVhl9zu1//zA=;
 b=Cw1V0926Vz7MnWx9q30zS3VltJZIdQ+HxZ00RSZ//TXIKmF1ngVWjWlk5tmqV8KoBtz5+/rEaZpfzb0HXTego5cu9ZmE5j13GfqiXm2w5IQcX5K/hn1F82MFpPsb4q0tq8N3v41bHQLDbX4WmIJkp7XRzmpzqbHYe+J1f6jJo3U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V0VocAgADeUQCAABQugA==
Date: Fri, 6 Feb 2026 07:35:05 +0000
Message-ID: <CE4D854B-1FE6-4058-A517-70B2AD362CF6@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <aYTONBslOYwyrFqM@Mac.lan> <eeccafa8-8474-485d-afd5-85d9eecdb241@suse.com>
In-Reply-To: <eeccafa8-8474-485d-afd5-85d9eecdb241@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AMDPR08MB11554:EE_|AM4PEPF00025F9A:EE_|DU2PR08MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: d17f76fc-aecb-4228-1727-08de655264c5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bHI5VURsZWNUQkZTK3RGb2d0ZStsRVJCY0w5anFHWXFqT3g2b1AyQkFIbzQz?=
 =?utf-8?B?Q2ZEZkhGOGdXNVpBVUQvMldjSnV1RU1GUklIQVo1cEdpSnkxdnhBeDZsUkR4?=
 =?utf-8?B?QU96Q21SRm5uR2Y0bjRPdmp3ZHBiL1NsRHN2N2J0aGtjNzBjejgrQy9UMVFr?=
 =?utf-8?B?aEtIS1lJdzVBQnBjZWgrQU04aG0rU04yc2tTK050cStUMmYva3FnTWFaZnZO?=
 =?utf-8?B?bktTVEhxNkhOdGNna0pwcWpyazVPSG9qc2VlcVh0Vlg2NXd4cmI3Nm5GWWNM?=
 =?utf-8?B?V25OT2g3d0xWMVNGazNqUG4yYitoZDd5bkx3UWpQNW9Qb1FqNjdpRkc1dkdu?=
 =?utf-8?B?TUxiSUQwMElKSVRuUU5kWCtzKzJ0bThHT1pBTmNtenJMK1VyTVNZaUtJeG5o?=
 =?utf-8?B?YzRvQnRUTHFpQUVKdmtDaGNlN2NPVW81V2xUZ0dra0Y5Z3E0Z0RwaEZ5b2Q1?=
 =?utf-8?B?Qml5OWluTnRMQVlrTHZHanBWNE8ycGkzbDd3eS9tMDdCM2Z6WmJOY3FqTHV5?=
 =?utf-8?B?YWRsTDhFRythWWo5TmpZNDgwZWdYcExsUGdPL3NNK0pBVVJvVGZQeU9FRC9G?=
 =?utf-8?B?MXd3SGY0bHYxcGxkRElwVytIVnRVUi9nVVo1U2Z0R0ZkV2tWdlRzMFhFL0tw?=
 =?utf-8?B?OXV4Q3ZEWHg5UWdVeng0SVFtQUNHek15d3pFSEdIQS9jRnA0TVlqUGVMOUhn?=
 =?utf-8?B?Wm1Ha09EMkk4R0s3YVEzZHlJWVFJU3QvWE5LVElOMjBsc0dqNTc3UmVJeG5E?=
 =?utf-8?B?SXBxV2d3YmlmY3BIR3ZnZEwrRkJ5QXl5ZlpLOS9zRXhXcWtXNWh1L0h3cGJB?=
 =?utf-8?B?Rmw1bnFOVW96S0pxVld1blpod3BFMUN2bFRlclk5MHhKZTFsSTJBc1NIUXZM?=
 =?utf-8?B?a1hOK2hoUWhtd0tOTWpwR1M5ZmJsdlMyajN5TmJFRXprTGptaC9lUWllL3Qx?=
 =?utf-8?B?bGFsMFRUYkhha1VxUHliRnV6aWswUWpHNGNiNUdvYUhNU3FqcTlvZGVwR2l3?=
 =?utf-8?B?NWk1akVwcUFDMDJ6S1I3dHl1M3JUWUxhaHFkQnJacFIxQkdBM2pYM1RaREFL?=
 =?utf-8?B?YlVMbm0wOTRlS0FoaUZvMVdLUy9NU3NURXRqdCtBUnJxVGN6TElseFBoWDRo?=
 =?utf-8?B?d1RFUHJqUW9LTnQvdkVwTFFBU1F0ZTBIdDZQaW54Vm9JdGhJRURGMWFmK2tN?=
 =?utf-8?B?TEdLQndHaHVWeXFlck41UHVtSlpCR014UDBybnlOc01OQk82T3B2MzJiV3Uv?=
 =?utf-8?B?Q21NMHVQTUZURllTK1BLaitrSzU5WVhjWUlvUGR0Y1I1M0s4TThaOXVMMHJl?=
 =?utf-8?B?a0ZWVGJ6YTdhb0NPMngyc2k4SXcrZ0p2b1dCdGRSSjd3UUEyY2pyMlpMWHVX?=
 =?utf-8?B?UE5CT3lMRWxqNHFUVDdlNkVoSzhva1FhbTMvaTc4cjdWK3B5YnRyVUJReDdO?=
 =?utf-8?B?bDdOV1NiQzkvckhiVGJtUjNKd1ltYytVcmkyblZ4UncweHowbkJENGNuNkY0?=
 =?utf-8?B?ZFZHVHd0ajRPMThDNnBCbDdPWDFMU0hTL1NpQlN6dzA3RmF2bVNENXJaVHFM?=
 =?utf-8?B?b3F1cllhcXVsN3lKZDBXdHdqaVIzWkRCcDVBSWFLaThhT1VYR2xsR0VJN1By?=
 =?utf-8?B?NHlMd3ZUaEozZzA4bmFMbGNjNTlFb2NuTkhqemdleFg1MGNyZksyOXpoMzdX?=
 =?utf-8?B?NTBQeHpjSml2NVFKM1BXYVBqd2Vva1cra1doK21nY1BDdTFIQStyenpLV0tV?=
 =?utf-8?B?c3JXWFZ4STZ4M3FpZm43TEtrOUF6T0NLZXFoc1lwa0JCNTFyajcvQ3hYb3RT?=
 =?utf-8?B?NFJxSXFYYkhqbnB1UzI5K09NVFFJY0hMUXg1T3NmZzF6dzkxc0xRZElVa1Vu?=
 =?utf-8?B?dnNad042ZTY4bVdFVmRzNTRMSDRoTWZ6UFlHQVZ3K2cxQ05mbng5SzRHN3Qr?=
 =?utf-8?B?V0QzWENHL0l5bUI5RG9LQ243VGJkdWI2SU55cVZaVEM2ejd2WnFUNkdScHZX?=
 =?utf-8?B?cUZ0ajJyOUEzM0g3TEpob2hOU3g2UzJaVzNSd0lJQUt4dXB6U21oN0kvYzZI?=
 =?utf-8?B?ajNobms0SjNXY0dXZVdLRVVpVTBUWkxiT1IxbW0rSnRMZmhldVNnTWk2Z0NN?=
 =?utf-8?B?YUQxbnorbUZCQndwU3NoZjFnK2dldkZkM2pnRmwzckd4QSt5QkF2U3NFdmZt?=
 =?utf-8?Q?IZkoTqoJFRtYnrMsEVkG5xg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <17AD973D97082C4DB1D18EEE78F9AF72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11554
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4935bbde-0315-43fa-35eb-08de65523f7b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmJBSnhxUit4QXIwY3NwS3ZiUWFRTVBwYjErNXJwK01pVnZlblo4WnZHQmNi?=
 =?utf-8?B?RVpudFBSdktBYTU0MXhKR0M3ZlB4YzJTMFhhOEZRNkhCR2ppWXFaT0RDbjJT?=
 =?utf-8?B?VTk1Q3BXYWxuTy9pSDNTOWxKRllwcWJVWkp4d0xXR2JGUldKVFRyMmtRcnVy?=
 =?utf-8?B?ay9rdHJVaERMbnFIbDR2c1VqMS9pVXRVbEVXcW8rb3JEZjVndi9lVzU2bE1X?=
 =?utf-8?B?MStReG9oSkhOSHpLVFQyak0xZEJ2TFBuTnBEMmE2dmlWVTVnaGJWakVpZkFE?=
 =?utf-8?B?bXlrUERxYS9abEtVa3FkdXFMeWtBS0Q0UG9hS3FDclI2aXY3ZHcrSDJSaThp?=
 =?utf-8?B?QWJsbCtxYTllWmllc04vSHc3aDNpSThCb05ndDVJOWsrdjJibEhSSGZlRnU0?=
 =?utf-8?B?bkg1YnNSQzdBSnlEWUJaaFFPSUc3MkNMWXA1ZWs4WWVPZldjUGx1MDZRV2JH?=
 =?utf-8?B?d20vdzdwQzVxcG1ZM3l2M0J5RUNoUU9pa0VJaXRPM0FMSUZCR1VVSEtRWGkw?=
 =?utf-8?B?aHQzR0F3QkZVSDE5S2dsY1JpUHEvZ2N1bnhNbVNtZm1tYU5XYUR5OXovYkpX?=
 =?utf-8?B?K3k0allsb0EzL2l5VFdMVWVOQzdUWGtPUWN1eStLVmY0WkViSmt4Vy9WckNK?=
 =?utf-8?B?bjlkU0JiUnBvMUNrYmdxQ0hQR3FkRzllQUJ2QWRNNkZZYUhpN0RiVGFyS3dY?=
 =?utf-8?B?V0h3WkJaSjN5Ly9mTWNKblpYZmJMMngwK0NyZGRCUGovKzlFQ2owcEx1bXUw?=
 =?utf-8?B?eFVJWVF4bVdCK21PTmhJcFRIRm8xT1JxZkhrOEpzZjQzK0ExTCthei9ScUkr?=
 =?utf-8?B?ci9zVW93Q1puOFIyeFBuQjhtMFdlN0xvNDNQOWxtT3BIalBWMEdkS2ptVURZ?=
 =?utf-8?B?K1RteTdkblp0RVN0cHVXNVN1azlNa3hRRm1HNWdJMnFQeW9pbG1kZ3UyUjZl?=
 =?utf-8?B?QVhrRjl5NHdSUTFsZGNkd0JubUo1ZWI1czJ2eTRIOFJobFVCRWlyUWtVU2VM?=
 =?utf-8?B?enNpb3BkaVdvUkxrZWV2T2U5c3VSSUJGRUhzZG92aXpQdXFPOUtFZEpoN2RM?=
 =?utf-8?B?OFZPcHhxZjFuSHdlcTJlbXRvTkNCN1U3RG9ybVpOeXp6MkYxS2VMdWdiZVpV?=
 =?utf-8?B?UVFyZTBzVWdkNi9NQUtrK1BzbDh0OCtBYWE3c1hPRCtjaThHMk96S3FsRVdn?=
 =?utf-8?B?U0lDN2czaW5PNGRSc256TzVtTTVUUkY3dFhyRmJEOWRCRy9qajVsK0ZBdmRp?=
 =?utf-8?B?OE5YU2hUSGhoZk5HdmZidXlwRDZSd0tFVG5pVkVjUTZpNXArYzFvWDVKNW1z?=
 =?utf-8?B?TUltZWNHLzdjK0pQNFZUOVpQZENySEtqdlo2OGF0c0JPZ0dJNzVGK1NaVE5y?=
 =?utf-8?B?VXdVQ3dIN2Myd0RnL1FFdXRIR0dlcDJIU0VJYTBtVGVYbzdSTTUwcW9ORXdu?=
 =?utf-8?B?WjN4VWFGWUR3K2hFWE1TMEk5SkVhamJSRHRVQmo0ME1FR1c0VFBwdXFvWHlZ?=
 =?utf-8?B?OU1jQUxDajRZQzVUUGFvZW9IeCtvQlJ3ZEE4VHViREZjTEpFSzduK2FOeDZQ?=
 =?utf-8?B?WnFGVVNIZkNkN0pZNmcycUppbnp4dklkUTVJWFFlcDU5L3dTZzJ6Ulo2bm13?=
 =?utf-8?B?cm5wb3JVdUc3N0c3bWR6ei8yZm90bktHYWZUUDE1WEdwa3VZSExQMWRzbTJr?=
 =?utf-8?B?T0FuQWhsNjRCUUhRVEFmaVNhK3JjL2ZadGNaUm1NVnZleU1nUm9tdWhiekUx?=
 =?utf-8?B?Q3JhUkpmNHpCV2Ezcy94ZGJUOVovY2pISjFCdVJJM1RmY3dQVElrNEZhUDds?=
 =?utf-8?B?aHUvRnBnRG1ZUGNwMUdyR0pLK05WaUlhUjJWWlgwK0hCWjJYMXUzK3dIT0xL?=
 =?utf-8?B?R1RSZC9uRWUvek45dVl3Y0h0VDFGNGtzdHhyM2dUaWR5MC9ESkl2VzRSaVlY?=
 =?utf-8?B?SUlrbjFSVnNlNDdmOEd5Q0RGZW4xK3NodFdFVmpaYmNSTDlyVkZsMDFnSkVX?=
 =?utf-8?B?OHRveDF6SDhjOEpUbGZReURlazVKOU1Ddzk3cXZucHlMVnR3eTRlNThrTUtS?=
 =?utf-8?B?VHJTOUpWZW9Fc05DVmdDcUVEUkRUamhQZnlIYWIyaGJTWjlTem1wK2dNMVRr?=
 =?utf-8?B?Mzl6aVB6dTBqZTZrRWkrUi9FRzlZenp5c0xSbEhVdWhhTUR1VlJHKytkek1u?=
 =?utf-8?B?ZVI4eVJSZ2FvOVZZVDlpRGt1YTZaalErbzF5eHZ0OWRLamVHU0F0RUZzQTBC?=
 =?utf-8?B?bExMOGk4bDRLQzBPOVljckJXajN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F1FeFFMkdHxc9sBiqGsoDp6Vwzr4QxKjAynnEAUt8T2DDVuXfiDu70z5iKbHEXVQyZJzUiQmtBqZdjnh2xYVo2tkYQlZ+E6ixdLk2rSd4YOs+u00ZgkJVkXbD1F6WNffWNZCcQR4J9ErUvTPmzkIOvSspHaFWkCsbFiqSrMDYP679PJXnz8cE2Eiu/RLDIpbAwuzu8oRweflTFN2SeBrrtzwTMDKY5VLz9Xieute0go+MMMHgDxHRDbxKRHrYDlPk4KL22v7/iO9Ye/NbjYl/XdAoyp9wYq2tkHTW58Iv0ssVHg2rh4crkVH8tz8RgJ/BTlHe/qr48aU/S9r0CNLB0brVJRDP8pdC9p1RKrb7RHk9mMfM11bi+mdU0Dra33VIjpfhN8NuCE49a4/gYRo6rrfrgrD2NSaWZdjWVlYJqmga38pYP4ohBocFjneJMl6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:36:08.4705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17f76fc-aecb-4228-1727-08de655264c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7375
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darwin.mk:url,arm.com:mid,arm.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 1C7C3FB0A2
X-Rspamd-Action: no action

DQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMDc6MjIsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNS4wMi4yMDI2IDE4OjA3LCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOg0KPj4gT24gVGh1LCBGZWIgMDUsIDIwMjYgYXQgMTI6MzM6NTRQTSArMDEwMCwgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiArIyMgTGltaXRhdGlvbnMNCj4+PiArDQo+Pj4gKy0g
KipIeXBlcnZpc29yIG9ubHkqKjogVGhpcyBvbmx5IGJ1aWxkcyB0aGUgWGVuIGh5cGVydmlzb3Is
IG5vdCB0aGUgdG9vbHMNCj4+PiArLSAqKkNyb3NzLWNvbXBpbGF0aW9uIG9ubHkqKjogTmF0aXZl
IGJ1aWxkcyBhcmUgbm90IHN1cHBvcnRlZA0KPj4gDQo+PiBQcm9iYWJseSBhIG1vcmUgcGhpbG9z
b3BoaWNhbCBxdWVzdGlvbiwgYnV0IGlzIGl0IHJlYWxseSBhIGNyb3NzDQo+PiBjb21waWxhdGlv
biBpZiBJJ20gYnVpbGRpbmcgYW4gYXJtNjQgWGVuIG9uIEFwcGxlIGFybTY0IHNpbGljb24/DQo+
PiANCj4+IFN1cmUsIGl0IG1pZ2h0IHVzZSBhIGRpZmZlcmVudCB0b29sY2hhaW4gZnJvbSBuYXRp
dmUsIGJ1dCBpdCdzIHN0aWxsIGENCj4+ICJuYXRpdmUiIGJ1aWxkIGZyb20gYW4gYXJjaGl0ZWN0
dXJhbCBwZXJzcGVjdGl2ZT8NCj4gDQo+ICJDcm9zcyIgYWl1aSBjb3ZlcnMgYm90aCBPUyAoaS5l
LiBBQkkpIGFuZCBoYXJkd2FyZS4gQnVpbGRpbmcgeDg2IExpbnV4DQo+IGJpbmFyaWVzIG9uIGUu
Zy4gV2luZG93cyBpcyAiY3Jvc3MiLCB0b28uIChTdHJpY3RseSBzcGVha2luZyBpdCdzIHRoZQ0K
PiB0YXJnZXQgdHJpcGxldCB0aGF0IGlzIGNvbW1vbmx5IHVzZWQgaW4gYXQgbGVhc3QgR05VIC0g
aWYgYW55IHBhcnQNCj4gZGlmZmVycywgaXQncyAiY3Jvc3MiLiBJdCBqdXN0IHNvIGhhcHBlbnMg
dGhhdCBYZW4gdXNlcyBMaW51eCdlcyBBQkksDQo+IGFuZCBoZW5jZSBpdHMgYnVpbGRpbmcgaXMg
bmF0aXZlIG9uIGlkZW50aWNhbC1hcmNoIExpbnV4LikNCg0KQWdyZWUsIGkgd2lsbCBwdXQgYSBz
bWFsbCBjb21tZW50IG9uIHRvcCBvZiB0aGUgbGluZSBpbiBkYXJ3aW4ubWsNCnNwZWxsaW5nIGl0
IG91dDoNCg0KWGVuIHVzZXMgTGludXgnZXMgQUJJIHNvIHdlIGFyZSBjcm9zcyBjb21waWxpbmcg
b24gTWFjIE9TLiANCkZvcmNlIENPTVBJTEVfQVJDSCB0byBhIGZha2UgdmFsdWUgdG8gbWFrZSBz
dXJlIGl0IGlzIGFsd2F5cyB0aGUgY2FzZS4gDQoNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

