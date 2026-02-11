Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP5QKp9sjGlmngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:48:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED3123F35
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227406.1533803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8hQ-00031b-2t; Wed, 11 Feb 2026 11:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227406.1533803; Wed, 11 Feb 2026 11:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8hP-0002yU-V3; Wed, 11 Feb 2026 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1227406;
 Wed, 11 Feb 2026 11:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq8hP-0002yO-5M
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:48:03 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d2452d-073f-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:48:02 +0100 (CET)
Received: from AS4P189CA0045.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::17)
 by DU0PR08MB9656.eurprd08.prod.outlook.com (2603:10a6:10:446::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:47:57 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f7) by AS4P189CA0045.outlook.office365.com
 (2603:10a6:20b:5dd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:47:56 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:47:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI0PR08MB11198.eurprd08.prod.outlook.com (2603:10a6:800:252::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:46:54 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:46:54 +0000
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
X-Inumbo-ID: 84d2452d-073f-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f+vjGm2kwfMvgTIXG/z9UJhC70/T7mabl1Ds/UE3ICUVzsEmo60n5x2DILJhYfJLabZ1Q1kutsHkwhTvADDuXPWBVrNgFWJ0iF50z6I4HuC2lBMFDxp3ea2t5GzQiXCAyjF1j/WGZ0VJJyRstJOVXtBmq1gPKyU11NMFXXhUEmS7WRcSTBlqd8vm18ZGVHIFlC+TwmJw2Hk0Ldp+udC09GXbv5dvw6hgeMjStrLMQsN7nAKneUEiHpcI+TAqQWXp6Mr+1RPB12VyOfNqHVPYdvv8fCLHHY9c9vA+7zab5A8fvjeSwqliQMySpf9sMTT1N9zjOTYcDsVCErQFfwxo2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5sl5hAanQc1Llf+S+e+08YbBQeFoa9/3JncaIt3UEY=;
 b=hREuPqtsq5YNSlnuaEmqbFNfCrdPpgbz6EIJinHsWxO8/qX2uEAr6Wb6vyMzicB+oRFahWA7ELJgsxGx/Wp/nyfnieVI8pLl7oNAwgSnhyB/S04XMaKeFG5B54uoh3+aE0STo+oh6l4ggAQ+loOJvCLXIxE03hYKorxHK48dStphkoA040d8hjl+iUbvPuUJtHS46uzNS76gGSYyNkZpA2Et+3zu0MJBRCBMWHmHePNGg4Jy7VvGsKUu1o/V69wxn4eQM1t5vWfn2ql4h4HPCp8fqbdtiB6C3TxcW29+tFv80yqYroYVHcwi08IAHfm11jmV1J2ilVREFXLdu5SNCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5sl5hAanQc1Llf+S+e+08YbBQeFoa9/3JncaIt3UEY=;
 b=DJEPQbW9m3nXlsApjU87c4lJnYjuyW78+1TJs1q+e37VmfITICf9uWPKAGmSlYG1NaaxFAAclrzlZA6ToyuR4uyKM3quQuMX+k3ajvPCBFS5yeyIXwCcdwtk130an2hGRe5HU5/2V6MANZ6vtTPdCb7pVZWYLzTZgPP1MjbTyww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fejUP3THP+kDwVpZ0t6igyjc3UIvCvASoxBc7+fLs238Q3dCB4rJVh1oIMoMfUM9Ni59j99A+Rt5a1ONB08vlmpmakr38xxtYmr7V5VIsTO2/Pc1DQxlh7uKtVaEVabwdDo1Sk/NNGxvJe6jznIhuISsDpCYhccnY4TzRbdE3I6guheUexmSeWkox+PNTou9GMQcxfEK+4TJk1XZsysP6t0GnJB9LVNT4q8XTI9D1sdkLaLHcm68GvZU+Rx2C/75EAMo1V6rjMUcj4iFpiNweciqudi+SfkjwMC0HFGbLjwLYgJDpx9SRqUyWchZEHa4E7GxaBY+g/olmbGpmHwIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5sl5hAanQc1Llf+S+e+08YbBQeFoa9/3JncaIt3UEY=;
 b=CV6pHLy9MK/EdwSaomB8pOLUpn4TeJ0BiDoX+5LotwRP9Av+W2QH6nTEHmIwXVUwoSvNo3D5FX+omkyWmMZDQlnKA9qe/hljZRRDOwy1necn16AWEkGqp+jalpbjhOFeh1vy84gxKgGc8IIrcMqnphAosOMC3PVUcHFoCyJbK7SiL2MiGhuYgKER2j0VoiC0N754EKPhaTiFBmlrlcxJUk2vOXQsvRVF7f7JV8V2Q0idConsD+45vB2taWgVzWpROylnQRiFNNJA4nuXh0pM+9RJXRYUBc/99yJlOQMbhPTyAde8Y1/t3CK4Xf/ogEVPkX5VifSqp2c+YYp2ollQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5sl5hAanQc1Llf+S+e+08YbBQeFoa9/3JncaIt3UEY=;
 b=DJEPQbW9m3nXlsApjU87c4lJnYjuyW78+1TJs1q+e37VmfITICf9uWPKAGmSlYG1NaaxFAAclrzlZA6ToyuR4uyKM3quQuMX+k3ajvPCBFS5yeyIXwCcdwtk130an2hGRe5HU5/2V6MANZ6vtTPdCb7pVZWYLzTZgPP1MjbTyww=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
Thread-Topic: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
Thread-Index: AQHclTU3ZJPDIpNYRUSOTYp5hfKcabV9VJGAgAAZM4A=
Date: Wed, 11 Feb 2026 11:46:53 +0000
Message-ID: <7B367F9A-37E3-4157-A7B2-3EA21EE9FE52@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <209e5474e236737dd13e0f7ff8120b05cdb7eabe.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ebe03R2nTzUW9tDx5hPC6trZCWOdr94ApawFs20chdWw@mail.gmail.com>
In-Reply-To:
 <CAHUa44Ebe03R2nTzUW9tDx5hPC6trZCWOdr94ApawFs20chdWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI0PR08MB11198:EE_|AM2PEPF0001C716:EE_|DU0PR08MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bb6456-1ff9-48dc-cdce-08de69636665
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N0cwT1h0UmFEc0p3ZnFUMXhRQkZhaHhxWWJybU1vaGxEbFNBTm52MUEvekNK?=
 =?utf-8?B?YndiR0JMS1NlS1V1VUZIbkJsWnQ1M2xxVUZMc21pLzMyYzBwSm5STUdIeWNp?=
 =?utf-8?B?azdraWQ1LzFscjdqbXQ1NWdIeUNtcFRveEpFYXU1aWVXVnFxc2JPWVFTejNW?=
 =?utf-8?B?eXdnSmMzVXI5R3JHdjdDeVE0S29DQ3FCRjQwVmFlWjR1RW9BZ2dzZGZHZWsy?=
 =?utf-8?B?S3ZJazcvaDNaV1pVeGEyR2dlMEVUSGNpbXI0RUxQM2NFdldHWExCUTk1VFFE?=
 =?utf-8?B?elVCN0krM3VENXBJckZ3a2VITVNSNk9HNXR6aEJTOVdubmZJeTRmQmgxczc5?=
 =?utf-8?B?Q2VUNVhRNTBTM3lWQ3AySzNkd1h1NFZKbEttR0szZ3NLWVdNTWFreTZYOVV2?=
 =?utf-8?B?Y0NzMmNqRDVFSlQ0dXl6bEdveVBIU0w1LzFXZzB2R2NFc3NrYWE4YUJnQVBS?=
 =?utf-8?B?M2Frbm53MHk4VHVVSmR6cVVwQXFxSmlHcVlNMFBDRTF2QkhNeW9pbmxtQy94?=
 =?utf-8?B?N1BtYUlKWkpZZkZZWEw4WVZINTEyRDhPTHlZNTZTUlErTHhUb3ErS3luUmla?=
 =?utf-8?B?NkZhTktnZmhaQjEzMmJnT2R6SENmOHpOaWxzRUhkRVFFVytpREZsVncrZHlq?=
 =?utf-8?B?Zm9SZTRtSGNudnZhRExhVGt3UTlWUmFTc0w4N2dUclBOM2FXVUc2MkJ3Z1hy?=
 =?utf-8?B?cU44TGEwcFNjTjdnY3JoaktJTWVNQXFTMU93MUVZZ0xKQjBicFB5WkRPampr?=
 =?utf-8?B?VFB2L2FsWVdueWNabDZPRUxzOFVLa3RSQm40TUZsWkpVbVRzalBYN1dVK2F6?=
 =?utf-8?B?YXR6YWtUeTI5TW5PWWllMkt3T0VOQjdpYmlyczZEMzdybVJ6TzZsSEREdzhK?=
 =?utf-8?B?YmorVjA5NU1kVVF3U2FUWnhmRjJleSs0YW9TbjVSZnpSUGt2QlhJVnFIUlQ1?=
 =?utf-8?B?aFZnQjZJRG9GcHBRR2dwUjdMRmsvS0FMWFJXSmFWOHNDMzFTQ1BReTdmeTRI?=
 =?utf-8?B?d0RBYkZXN2o3VHFKYWt6dEZZZWhzMGhvQm5jUjI2Z0pqZHRTYlllUWV5VjQx?=
 =?utf-8?B?U0ROVXh1aG5SUzEycGtOQnRyT0tnRFhZUHNTRzVGd012Q2cwVTN4eG1JL3J1?=
 =?utf-8?B?WmlRN3Q2RHdENGFnQndwYURDYmVpTXRZb05NOFd3RS9KSExHYk1lRlhKQTJK?=
 =?utf-8?B?ZmhSQUJEUVpVS21VSkZqZmhsb3hDRGVoSXFFNmkybGkra01IK2FYcU5DTmNp?=
 =?utf-8?B?eVlQdkJ6OHBHYzkyWUFvN1Mvdk9KckVsa3orQkJpU1NCYkd3YThUVlYvdUJp?=
 =?utf-8?B?cUZqdXpNK09SbTJjQmVlL3Q2M0YyaGZlbTNoV2J3U1ZqQkV1ZDZWT040Q2Vi?=
 =?utf-8?B?UFc0dkJQUHZNc2RZK0pXbWd4MnhvOTZKeTRCQlZlc21wdndSTGVzeFNlNkor?=
 =?utf-8?B?eE04NTgyc2tWTHVIZ240UTF5eUp6bmJHa2Q4d09xZ1V6bEtQMlVMMERacEt0?=
 =?utf-8?B?NVVyTXU4VkdVNWhsWCtiNlN5SkpPbFdBdnBUK0Y2UEpYUVo1aG42MS95S2hI?=
 =?utf-8?B?SjBtbGZ4SlBock1VRkt3MnQyWDRrSlV6cm53MVFUanN5cHFpa0hQL1RwemNN?=
 =?utf-8?B?ZGVFUGxTandzRlMzeFpXRzZuYURDNm90V1pHSE1hbnNFRHAreHA3OUpjamJo?=
 =?utf-8?B?RFAzV1dzaFJvSGdKNk5raGxWU1oyUnhKd1IwcGlxTzJ6NVdncDJvT0czTDgr?=
 =?utf-8?B?Q0duK3liM0txTS9VYzZrWGxGcEtOUDFEWkpjL2VWSzZZU04xQWR4VFYvSDRU?=
 =?utf-8?B?QlExN1B6ZUxDbklXU2hJZmNQNDFSWGZ0di96QVFtZllUU2FEalc3blFLYndD?=
 =?utf-8?B?RGF2LzN6VG9wcnQyaFdlc0RhQVZ4bno0b1NsUU9iTFA1YzBQbTdQMExDMEht?=
 =?utf-8?B?QlV1T1piMktBc3llOVBqV0pGZzJXOFpuRnNIN0NGVFpLdHYxeXBiZnRkZmpj?=
 =?utf-8?B?d0ZoZndMQS9RTnhROEhGL1oyU0FsT0xJMXNPelMwZy9na2FQaHd1MkpuNE93?=
 =?utf-8?B?enNvdUtGMEhQU2E0K0JhdmwvM2JuYVRXck1Gdkt6dDRtWkM2SE1FZGN0NzRk?=
 =?utf-8?B?MGo3QVAvcExBRjJhTHhDY2lhNzJ3NWx3bmVCV3JEdEZ3SWJPelRuWmYyY1V6?=
 =?utf-8?Q?X1BBLYbqqo+dBvHm071zqgM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E09502FE814BFA4396C7985F37EF79D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11198
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87de86c9-522d-4c8f-a6e9-08de696340a3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d042VVZMVFNXTkZ5Y1lVUGVucjlwb1NOdGM3c2FGYUxnQmczZ0JpMFdJZzRS?=
 =?utf-8?B?MnQ2bi9HT2x2QkszMzd2NEd3RzR5TmIwZXVkRkY4cXJ4ZlBBMjBYQjVvNitl?=
 =?utf-8?B?U2xOc0hPS0lLL0RuZGg0S2RxSWh6MEloU1QzbDZVcWpmTk82bTNhaURBZVN5?=
 =?utf-8?B?d0hsM2R5c0g5aHhGUFhmeGhxUm8zcjRaWW1XZEFYeXlTdlBnODhpbC9BczZL?=
 =?utf-8?B?djd4eFh3YlFNREJHSEczVGJicE1OVytuTVphYU95aWExSGtHcUhLc0FFUytT?=
 =?utf-8?B?Tno5YklFd1RIWkhBWUxTVmh4bGZZYnF3K2hoZ0lRaE1QMURuVG82STliMGU2?=
 =?utf-8?B?bW9RSzNXVlpxREE5QTJVcmNDcUlneEFDMUtGdzJ2ejJFSUtoVS9FSXNaRVRT?=
 =?utf-8?B?WFpqb21QMm5tek9udkUxclp4cjdiRUZCaWlQd0tmSTBCL1l2dTl4SGo0UHZS?=
 =?utf-8?B?UC9adGFvcnpUZXI1OWh6K2I1UzJXTkczMmd3ckhRVGN2SFRqM25ZdHVWUUhx?=
 =?utf-8?B?NzgwRldiTkdPV3I2NXRMRmF1VWFBUElYMjVwTUlRSFMyWUlnMXFJVHN4d0pM?=
 =?utf-8?B?L3lvbnY2K215Wk0zbXBiMGFudEYyWjlvaGc2L0dlWDZaZElQM1NJeWd3MVRD?=
 =?utf-8?B?QzJPLzZZU1lEQUdQMHdOOXBIWHBLK2FUMk9NSXMwYmJmem04L0dRMU9wb0xr?=
 =?utf-8?B?THdYajRJMEtOczEwckI3ckZPNTArUlM0R2ZlaUpRbHBrTklRVVlXWVBvcEhP?=
 =?utf-8?B?cHp1WHp2clRuYndLYlVXZmYvWVh5eEJzMHNwWC9KM0V5NmhhVC9oQ2ppdmRo?=
 =?utf-8?B?aU9XNklIZTVId0lkaU40R3hQcmhTRm9ReEN2a3JXQlA1cXpDVVYvSGR5VGs2?=
 =?utf-8?B?cVM0NU1pTFo3MGpJOWt3b3huU05tbkZzSWhVVU84Q3N2RDhXQTduQUt3b1pt?=
 =?utf-8?B?R2l2QzFNVDYyWXErZzMxZGtxYmc1WmRtSmxteFppNEI4SUR5RVg1N2orYW1S?=
 =?utf-8?B?cE5ycVpCVWhPSW8yak1VcWdXS0tzemFRY0ZLQlIyTnEvS3JhNXJWVXZjUndx?=
 =?utf-8?B?dEZURUYxNUpvakFwM1ZnUHpQcEtaUDB4SjJBZU9ockZNT2VtclVPdXFPaUNy?=
 =?utf-8?B?YkVaOXFOclFta2pjdXBkVVEzcGpVNzBQNGM1Z3E3RmE4T2VqNVpmMWdHQVNr?=
 =?utf-8?B?a2xUVlMwL0tadmR1bDZlbnVtZWVyOUVLZ2Fmb3p3Uk90cGdpLzdKNHAyb29J?=
 =?utf-8?B?cWJkdzM1ampxSlNwcE9pcmpnREpFTzE4Sk9teDdKb01NeHV6dXRsYVp0ZzRY?=
 =?utf-8?B?Nkxpb0I2YmxYTkkvNVdGTGdsdWdhQnBISXp2aGhON1dWZzUvbks0K0o0U2Jk?=
 =?utf-8?B?ZGJEZndtUUxRQ1F4SDg3M3dhOElYT3BRT3g2N3VORXpCbnp4MEZQRW14OHQv?=
 =?utf-8?B?Wk02c3VLVFhZK1lQUTM2ZnFvU0x4TDh1R0hOVVcwRkpiSmJuRnlnWWpyRjRL?=
 =?utf-8?B?YWpjZzd6azloVlN1WGhCRk1wTnNFZU1xazFqVTJPS2JLcU0yUXdENU1GaDdy?=
 =?utf-8?B?aExjbGVnbGh5dXpDMzdhMWI2Zi9mYXZQSWhlSnBaclFDTWcxZlpnYXdtb3p6?=
 =?utf-8?B?aEpIbXBYbnFHcHBYTCs1c0k2dkl3UG5ObFBtb0tmY2FiVUhsV2x6WG93NlpW?=
 =?utf-8?B?cE5sVW1tMUVzbHFPZTdpQWlnSURkZG4vZUJZN2ZXemIzMkQ4UlFRa2wvOSti?=
 =?utf-8?B?a1ZWbmMwNkNWTWxaYmpMS2pkdGpGYnFRalpvdUlFMmhCaU5DZWx6dXlHbWlk?=
 =?utf-8?B?WDd2NnRZMUp3ajI3OFVwd0xpcU5BQ1U1ekpDRWozLy8vLzk5MmVUMm9vb01y?=
 =?utf-8?B?QlN2THlzUEJqQld0QmQxbkN2MUF5UGZUTW1QaFg2aDIwSkZaSzhyOVZYeUtw?=
 =?utf-8?B?bXlCSVg2a05WQUNVTTU2b3paZk1mSGRrdGVaOHFnWkIxN3ZUeE5oTVJYYlRy?=
 =?utf-8?B?djdKRXREZ1lTdTNnOUQvam9YMDdaS1hxOVc0ckk5STNpR3Zoc3gxWGZNRWEx?=
 =?utf-8?B?Tzh5d0RtQ2pmUUxVV3NaT1FjenF6ejZLT3pVTWxFOTNlVFFOMy9jOUJyb0ZG?=
 =?utf-8?B?TUdNeVdCZThlTWJLQ1ZYVUlHU2RJc2ZEWkIvbnk5bHRwc0ZiVHNtdlJWUzhy?=
 =?utf-8?B?d3RlYStYQjdzVHZJbUM3K3l2WkhVdmRPUzlyT2l6bEdKS0YvRHl1T0lKeTVT?=
 =?utf-8?B?QU9xLzlZUklaWDZWdWFQK1c5QmhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1KGvlbdKciIT4YFZhuzuqZ2eIdvKE7060qzGR/SrKJrxJQ385x6y+ixNlAF5MN1Q1lZ5IDLwltG5qzUUMUrp7YxFFsg7B+Bgo/TP+GMqvudkKn1jM36FUSCQa9iW2UEimQw+bOWLZCb3Q3xsNu+UuFR9jaUNlyCunqoQj46N9q7PS5iW1VhDnOgW+IrUjQK+opmsV9BPrJUasqI0wTKVg13F+jvSzfRwJ9vW6wBPyRQfQgElHVpFFe7URz8JWrwFnBn8r8fb1HhmlDBsTWp8QA/Ja+6PxGXaXAaTg39CTMOe4/auCac0+WVmzJ6TVE2Hx7RW8566F4ta4h39BbjkFVJF1UZgqgDfzrXf+oHET/ZzvPRIWrMLHJqhY8bR/7vAhxOqpAp9RCTMouYYTdeRDX6aQS+O/IsdoxJd7nHJW7Atb6juhGTImZFSSSAL92cT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:47:57.2891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bb6456-1ff9-48dc-cdce-08de69636665
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B3ED3123F35
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMTE6MTYsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gTVNHX1NFTkQyIGFuZCBk
aXJlY3QgcmVxdWVzdCB2YWxpZGF0aW9uIGZhaWx1cmVzIGFyZSBzaWxlbnQsIG1ha2luZyBpdA0K
Pj4gaGFyZCB0byBkaWFnbm9zZSBpbnZhbGlkIElEcywgb3ZlcnNpemVkIG1lc3NhZ2VzLCBvciB1
bnN1cHBvcnRlZA0KPj4gZGVzdGluYXRpb24gdHlwZXMuDQo+PiANCj4+IEFkZCBkZWJ1ZyBsb2dz
IGZvciBwYXJhbWV0ZXIgdmFsaWRhdGlvbiBmYWlsdXJlczoNCj4+IC0gaW52YWxpZCBlbmRwb2lu
dCBJRHMNCj4+IC0gb3ZlcnNpemVkIG1lc3NhZ2VzDQo+PiAtIHVuc3VwcG9ydGVkIGRlc3RpbmF0
aW9uIHR5cGVzDQo+PiAtIGludmFsaWQgc2VuZGVyL3JlY2VpdmVyIGNvbWJpbmF0aW9ucw0KPj4g
LSByYXRlbGltaXQgTVNHX1NFTkQyIGJ1c3kgZmFpbHVyZXMgdG8gYXZvaWQgbG9nIGZsb29kaW5n
DQo+PiANCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
QmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB4
ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMgYi94ZW4vYXJjaC9hcm0v
dGVlL2ZmYV9tc2cuYw0KPj4gaW5kZXggOTI4ZjI2OWY2YzNhLi5jYzI3M2M5YThlODAgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4gKysrIGIveGVuL2FyY2gv
YXJtL3RlZS9mZmFfbXNnLmMNCj4+IEBAIC00LDYgKzQsNyBAQA0KPj4gICovDQo+PiANCj4+ICNp
bmNsdWRlIDx4ZW4vY29uc3QuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPg0KPj4gI2luY2x1
ZGUgPHhlbi9zaXplcy5oPg0KPj4gI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gDQo+PiBAQCAt
MTAwLDYgKzEwMSw3IEBAIHZvaWQgZmZhX2hhbmRsZV9tc2dfc2VuZF9kaXJlY3RfcmVxKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCBmaWQpDQo+PiAgICAgaWYgKCAhZmZhX2Z3
X3N1cHBvcnRzX2ZpZChmaWQpICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRf
Tk9UX1NVUFBPUlRFRDsNCj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywgImZmYTog
ZGlyZWN0IHJlcSBmaWQgJSN4IG5vdCBzdXBwb3J0ZWRcbiIsIGZpZCk7DQo+PiAgICAgICAgIGdv
dG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTEwOCw2ICsxMTAsOSBAQCB2b2lkIGZmYV9o
YW5kbGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWlu
dDMyX3QgZmlkKQ0KPj4gICAgICAgICAgKHNyY19kc3QgJiBHRU5NQVNLKDE1LDApKSA9PSBmZmFf
Z2V0X3ZtX2lkKGQpICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJ
RF9QQVJBTUVURVJTOw0KPj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLA0KPj4gKyAg
ICAgICAgICAgICAgICAgImZmYTogZGlyZWN0IHJlcSBpbnZhbGlkIHNyYy9kc3QgJSN4XG4iLA0K
Pj4gKyAgICAgICAgICAgICAgICAgKHVpbnQzMl90KXNyY19kc3QpOw0KPj4gICAgICAgICBnb3Rv
IG91dDsNCj4+ICAgICB9DQo+PiANCj4+IEBAIC0xMTUsNiArMTIwLDkgQEAgdm9pZCBmZmFfaGFu
ZGxlX21zZ19zZW5kX2RpcmVjdF9yZXEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQz
Ml90IGZpZCkNCj4+ICAgICBpZiAoICFGRkFfSURfSVNfU0VDVVJFKHNyY19kc3QgJiBHRU5NQVNL
KDE1LDApKSApDQo+PiAgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX05PVF9TVVBQT1JU
RUQ7DQo+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsDQo+PiArICAgICAgICAgICAg
ICAgICAiZmZhOiBkaXJlY3QgcmVxIHRvIG5vbi1zZWN1cmUgZHN0ICUjeFxuIiwNCj4+ICsgICAg
ICAgICAgICAgICAgICh1aW50MzJfdCkoc3JjX2RzdCAmIEdFTk1BU0soMTUsIDApKSk7DQo+PiAg
ICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTE2Niw3ICsxNzQsMTIgQEAg
c3RhdGljIGludDMyX3QgZmZhX21zZ19zZW5kMl92bSh1aW50MTZfdCBkc3RfaWQsIGNvbnN0IHZv
aWQgKnNyY19idWYsDQo+PiAgICAgLyogVGhpcyBpcyBhbHNvIGNoZWNraW5nIHRoYXQgZGVzdCBp
cyBub3Qgc3JjICovDQo+PiAgICAgcmV0ID0gZmZhX2VuZHBvaW50X2RvbWFpbl9sb29rdXAoZHN0
X2lkLCAmZHN0X2QsICZkc3RfY3R4KTsNCj4+ICAgICBpZiAoIHJldCApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+ICsgICAgICAgICAgICAgICAgICJm
ZmE6IG1zZ19zZW5kMiBsb29rdXAgZmFpbGVkOiBkc3QgJSN4IHJldCAlZFxuIiwNCj4+ICsgICAg
ICAgICAgICAgICAgIGRzdF9pZCwgcmV0KTsNCj4+ICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsg
ICAgfQ0KPj4gDQo+PiAgICAgLyogVGhpcyBhbHNvIGNoZWNrcyB0aGF0IGRlc3RpbmF0aW9uIGhh
cyBzZXQgYSBSeCBidWZmZXIgKi8NCj4+ICAgICByZXQgPSBmZmFfcnhfYWNxdWlyZShkc3RfY3R4
ICwgJnJ4X2J1ZiwgJnJ4X3NpemUpOw0KPj4gQEAgLTE5OSw2ICsyMTIsMTIgQEAgc3RhdGljIGlu
dDMyX3QgZmZhX21zZ19zZW5kMl92bSh1aW50MTZfdCBkc3RfaWQsIGNvbnN0IHZvaWQgKnNyY19i
dWYsDQo+PiAgICAgLyogcmVjZWl2ZXIgcnggYnVmZmVyIHdpbGwgYmUgcmVsZWFzZWQgYnkgdGhl
IHJlY2VpdmVyKi8NCj4+IA0KPj4gb3V0X3VubG9jazoNCj4+ICsgICAgaWYgKCByZXQgKQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBpZiAoIHJldCAhPSBGRkFfUkVUX0JVU1kgfHwgcHJpbnRrX3Jh
dGVsaW1pdCgpICkNCj4gDQo+IFNob3VsZG4ndCB0aGlzIGJlICYmID8NCg0KVGhlIGludGVudCBo
ZXJlIGlzIHRvIGxvZyBhbGwgbm9uIEJVU1kgZXJyb3JzIGJ1dCBvbmx5IGxvZyBCVVNZIHdoZW4g
cmF0ZWxpbWl0IGFsbG93cw0KdG8gcmVkdWNlIHRoZSBhbW91bnQgb2YgbG9ncyBpbiBjYXNlIG9m
IHNvbWVvbmUgcG9sbGluZyB3aGVuIHRoZSByZWNlaXZlciBSWCBidWZmZXINCmlzIGJ1c3kuDQoN
Ck1heWJlIEkgc2hvdWxkIGFkZCBhIGNvbW1lbnQgdG8gbWFrZSB0aGF0IGNsZWFyZXIgPw0KDQpD
aGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICsgICAgICAg
ICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsICJmZmE6IG1zZ19zZW5kMiB0byAlI3ggZmFpbGVk
OiAlZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICBkc3RfaWQsIHJldCk7DQo+PiArICAg
IH0NCj4+ICAgICByY3VfdW5sb2NrX2RvbWFpbihkc3RfZCk7DQo+PiAgICAgaWYgKCAhcmV0ICkN
Cj4+ICAgICAgICAgZmZhX3JhaXNlX3J4X2J1ZmZlcl9mdWxsKGRzdF9kKTsNCj4+IEBAIC0yMjYs
NyArMjQ1LDExIEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpDQo+PiANCj4+ICAgICByZXQgPSBmZmFfdHhfYWNxdWlyZShzcmNfY3R4LCAm
dHhfYnVmLCAmdHhfc2l6ZSk7DQo+PiAgICAgaWYgKCByZXQgIT0gRkZBX1JFVF9PSyApDQo+PiAr
ICAgIHsNCj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+ICsgICAgICAgICAg
ICAgICAgICJmZmE6IG1zZ19zZW5kMiBUWCBhY3F1aXJlIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+
PiAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgIH0NCj4+IA0KPj4gICAgIC8qIGNyZWF0ZSBh
IGNvcHkgb2YgdGhlIG1lc3NhZ2UgaGVhZGVyICovDQo+PiAgICAgbWVtY3B5KCZzcmNfbXNnLCB0
eF9idWYsIHNpemVvZihzcmNfbXNnKSk7DQo+PiBAQCAtMjM4LDYgKzI2MSw5IEBAIGludDMyX3Qg
ZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAg
ICAgICBkc3RfaWQgPT0gZmZhX2dldF92bV9pZChzcmNfZCkgKQ0KPj4gICAgIHsNCj4+ICAgICAg
ICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiArICAgICAgICBnZHByaW50
ayhYRU5MT0dfREVCVUcsDQo+PiArICAgICAgICAgICAgICAgICAiZmZhOiBtc2dfc2VuZDIgaW52
YWxpZCBzcmMvZHN0IHNyYyAlI3ggZHN0ICUjeFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgIHNy
Y19pZCwgZHN0X2lkKTsNCj4+ICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgfQ0KPj4gDQo+PiBA
QCAtMjQ2LDYgKzI3Miw5IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIGlmIChzcmNfbXNnLm1zZ19vZmZzZXQgPCBz
aXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4XzFfMSkpDQo+PiAgICAgICAgIHsNCj4+ICAg
ICAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gKyAgICAgICAg
ICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAiZmZh
OiBtc2dfc2VuZDIgaW52YWxpZCBtc2dfb2Zmc2V0ICV1ICh2MS4xKVxuIiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICBzcmNfbXNnLm1zZ19vZmZzZXQpOw0KPj4gICAgICAgICAgICAgZ290byBv
dXQ7DQo+PiAgICAgICAgIH0NCj4+ICAgICAgICAgLyogU2V0IHV1aWQgdG8gTmlsIFVVSUQgZm9y
IHYxLjEgZ3Vlc3RzICovDQo+PiBAQCAtMjU1LDYgKzI4NCw5IEBAIGludDMyX3QgZmZhX2hhbmRs
ZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgZWxzZSBpZiAo
IHNyY19tc2cubXNnX29mZnNldCA8IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8y
KSApDQo+PiAgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVS
UzsNCj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+ICsgICAgICAgICAgICAg
ICAgICJmZmE6IG1zZ19zZW5kMiBpbnZhbGlkIG1zZ19vZmZzZXQgJXUgKHYxLjIpXG4iLA0KPj4g
KyAgICAgICAgICAgICAgICAgc3JjX21zZy5tc2dfb2Zmc2V0KTsNCj4+ICAgICAgICAgZ290byBv
dXQ7DQo+PiAgICAgfQ0KPj4gDQo+PiBAQCAtMjYzLDYgKzI5NSw5IEBAIGludDMyX3QgZmZhX2hh
bmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgICAg
ICBzcmNfbXNnLm1zZ19zaXplID4gKHR4X3NpemUgLSBzcmNfbXNnLm1zZ19vZmZzZXQpICkNCj4+
ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4g
KyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLA0KPj4gKyAgICAgICAgICAgICAgICAgImZm
YTogbXNnX3NlbmQyIGludmFsaWQgbXNnX3NpemUgJXUgb2Zmc2V0ICV1IHR4ICV6dVxuIiwNCj4+
ICsgICAgICAgICAgICAgICAgIHNyY19tc2cubXNnX3NpemUsIHNyY19tc2cubXNnX29mZnNldCwg
dHhfc2l6ZSk7DQo+PiAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTI3
Miw2ICszMDcsOCBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICBpZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9N
U0dfU0VORDIpICkNCj4+ICAgICAgICAgew0KPj4gICAgICAgICAgICAgcmV0ID0gRkZBX1JFVF9O
T1RfU1VQUE9SVEVEOw0KPj4gKyAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAiZmZhOiBtc2dfc2VuZDIgdG8gU1Agbm90IHN1cHBvcnRl
ZFxuIik7DQo+PiAgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgICAgICAgfQ0KPj4gICAgICAg
ICAvKg0KPj4gQEAgLTI4OCw2ICszMjUsOCBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQy
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gDQo+PiAgICAgICAgIHJldCA9IGZmYV9z
aW1wbGVfY2FsbChGRkFfTVNHX1NFTkQyLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKCh1aW50MzJfdClmZmFfZ2V0X3ZtX2lkKHNyY19kKSkgPDwgMTYsIDAsIDAsIDApOw0KPj4g
KyAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJV
RywgImZmYTogbXNnX3NlbmQyIHRvIFNQIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+PiAgICAgfQ0K
Pj4gICAgIGVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICAg
ICB7DQo+PiBAQCAtMjk1LDcgKzMzNCwxMSBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQy
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICByZXQgPSBmZmFfbXNnX3Nl
bmQyX3ZtKGRzdF9pZCwgdHhfYnVmLCAmc3JjX21zZyk7DQo+PiAgICAgfQ0KPj4gICAgIGVsc2UN
Cj4+ICsgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsN
Cj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+ICsgICAgICAgICAgICAgICAg
ICJmZmE6IG1zZ19zZW5kMiB0byBWTSBkaXNhYmxlZCAoZHN0ICUjeClcbiIsIGRzdF9pZCk7DQo+
PiArICAgIH0NCj4+IA0KPj4gb3V0Og0KPj4gICAgIGZmYV90eF9yZWxlYXNlKHNyY19jdHgpOw0K
Pj4gQEAgLTMxMSw2ICszNTQsNyBAQCB2b2lkIGZmYV9oYW5kbGVfcnVuKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzLCB1aW50MzJfdCBmaWQpDQo+PiAgICAgaWYgKCAhZmZhX2Z3X3N1cHBvcnRz
X2ZpZChmaWQpICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRfTk9UX1NVUFBP
UlRFRDsNCj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywgImZmYTogcnVuIGZpZCAl
I3ggbm90IHN1cHBvcnRlZFxuIiwgZmlkKTsNCj4+ICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAg
fQ0KPj4gDQo+PiBAQCAtMzIyLDYgKzM2Niw3IEBAIHZvaWQgZmZhX2hhbmRsZV9ydW4oc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90IGZpZCkNCj4+ICAgICBpZiAoICFGRkFfSURf
SVNfU0VDVVJFKGRzdCA+PiAxNikgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgcmV0ID0gRkZBX1JF
VF9OT1RfU1VQUE9SVEVEOw0KPj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLCAiZmZh
OiBydW4gdG8gbm9uLXNlY3VyZSBkc3QgJSN4XG4iLCBkc3QpOw0KPj4gICAgICAgICBnb3RvIG91
dDsNCj4+ICAgICB9DQo+PiANCj4+IC0tDQo+PiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpDQo+PiAN
Cg0K

