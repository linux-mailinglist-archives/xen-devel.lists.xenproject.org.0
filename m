Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D13C640D3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163671.1490763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyN9-00045d-C6; Mon, 17 Nov 2025 12:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163671.1490763; Mon, 17 Nov 2025 12:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyN9-000443-8z; Mon, 17 Nov 2025 12:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1163671;
 Mon, 17 Nov 2025 12:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXl4=5Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vKyN7-0002nL-GI
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:30:17 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bbf5389-c3b1-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 13:30:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8225.namprd03.prod.outlook.com (2603:10b6:610:2c3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:30:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:30:13 +0000
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
X-Inumbo-ID: 2bbf5389-c3b1-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOVrGQWgoW3ZMDzinC9g6+Kdp1Dxo6wK7+qIjWAYaFgv6l1W+oUB1pK4RyuMdDleQBZPYp5p01RyAudk12/JK//HUqW8zhozYQFpRttWrlUifixthXHS12dej6GQFt3Mo8Vl+GcenkBtszkI99p35f1iWfczwH/zbt4HQJ4OYR3UcFe2yOgiBIJd7kcpVA+53dPK20vHWSwWSCC3Vd2ZVIg3kNimj22mdkaeEBKsq9dxg+AyLc01ZVKK9FcO4hhD5IWqSWfDtu6bETyMtIPi5EkDhmFy38FJa5l7z34QVEsa1Hdol5e47cL/87aiaErOeL4RgvZ/AEgbctM+oASyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/+DRLArGLCZpYFA3M/ya4bWWpXk10BXJza2YB+BZDE=;
 b=dXxMPQTB/Hg5N5Ztc8o9EcJW7ey3aWvtfJrs+p4LaZpUG2x3+RJkzDQMJTnl7gsWNyzbX+OS+DILeeTaGgMxeUL6ciQZjHUn8D2Xz+aZDaYIjD+iRv//DhG8tatwT1fCrbvGpQo/1UEtGZzVEiFOBIwesz3IoXP4aEysrk/aULB4ZziUqG2jaj/9CV9kntSRKkAPRW2Kz6ZeM+v3Mb7mXzVz5APPMrmBCYrjOJ6QbLBS5LXvX4lUhaV2y4mzaedV2c5PPcnznU+w2ehlYBKFbWF/EdrjGVulrJ6FLQv8t4q4tdUP92apMDU+c8+BB0nfvW1XSQyYX79jweRt83T8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/+DRLArGLCZpYFA3M/ya4bWWpXk10BXJza2YB+BZDE=;
 b=bo9Rjt1vI+7eK6Iv9D4EhuM1NcWi8fkQOOkNx/5gSEytMrRwwbgyBBYYWizL4jO+8es2wEl7YSMfmXQO2Adwh/KlfeiFwTeIZBmoFVjOsrDRfAG8tiHBzJMBV9tqNeNI3TElxnkeSnW2+hl2YvbvrY5N4pK4YfVamQLoLGfYOEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d3528e7b-a811-47ca-a508-c0aa0746d9f3@citrix.com>
Date: Mon, 17 Nov 2025 12:30:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH8PR03MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 508829af-6c89-4914-a821-08de25d50ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SElZMkxYTUhiS21yZWpSZ1pla253V0NLLzdYZ3dJTG55N3MwMUorVExGNWJ2?=
 =?utf-8?B?N3lIbFJ0MTlnNHFiMTV2NjQ2WDZudURsNDBtL0x0TjNqSjczZWJEdkFZT1Zt?=
 =?utf-8?B?eWhlakNCT28vc2xaMFJzN3QveXZhWlQ2YzRFWFhQcjhxenN1TTBBSEtlVVgw?=
 =?utf-8?B?RjRDS2JZaHR1dU5xdEtLYkJZMjJMQ1g0eWMvRlk0QzlGTHRDMno0U1BNQ1lw?=
 =?utf-8?B?SklZQ0ZOampiTGhMeWdkODM0bG9mWklTa0t4L2ZYeDROSkgvMzl3UkI2RWlj?=
 =?utf-8?B?TTY0bWQxU0VpRHpTemdxZENlZVpZN3FLdjhzcFYzdC9xa3VHZVRjQmlUbk5B?=
 =?utf-8?B?SXZFVGJpNGdxU3hCN1hiNFNzZ0J3bzRjakEyMmxKcG8xRVdIUktGTUpLbmpF?=
 =?utf-8?B?RTZMQ1cwK3JKVlI3ZFFBV1h4TWRlN29ySFlBM3B6aEw2blprdHQrTHNUc3RM?=
 =?utf-8?B?WEVqN09IbmszVmZHL1lCend4OTM4eTgyNDZFZ2h6c3hHNzEzN051c3dkK01u?=
 =?utf-8?B?QnE2dnVBN1A1TGxQaVp2VXN6ekJvVWdHVzBLTlV2YlhNZTdDRWZWK2dENm5S?=
 =?utf-8?B?Qng3U2p3YW03Y2FBR3FXU1A4dXNwdXh1N1Q1ZGxoVlZvbmVHTUdCS1grS0xa?=
 =?utf-8?B?R2NwSTRUYzZ0T1FUQzRkUGo2dXhHWkJBZ2R2ZnNXaVgyTWdnVHRaS2dHaU5j?=
 =?utf-8?B?ZkY2RFA3Tk94RGowR0tKbTU0LzdnQVlad3c5a2swTktQTHFFRDIvWGFUMzhB?=
 =?utf-8?B?QXRRenNJYTM1aHA4UFVQM1F5bzd3ZTV2Y3pacmpYWllid1RoNGdpSFNORHFD?=
 =?utf-8?B?YVpUekowMWtVSEY4YjhsOXZvek42OHFuc25ydkthdDJEbFFaYWtjN1YrT0Jm?=
 =?utf-8?B?OUNGVGhhYU1LaHNmUFRRbWkxc21hblVRaDZTbjlWcDArZGJqSlp6ZFNRUXd5?=
 =?utf-8?B?Z1NtZFFCSm5aSnVJTGs4dGVUQ3pZMHEvcEs0ZmdMV3g3MDZRSXpKeWo5aVVK?=
 =?utf-8?B?bStlR1QzcnJkSERncnZsNjYvUldpR1ZVLzRxY2ZBemRTVmxOTURkV3pRT1B1?=
 =?utf-8?B?QTJuVmg0UWdjcy92NmR4dVhNL3NkSy9ycVF3VTV2NUx2MEFMa2hKcTYwQWlO?=
 =?utf-8?B?NVFQcHZVNVRLZmY5Y25HZWNWdE5qZWV3QVhCbE5QU0tzS0ducyt4VG44ODQy?=
 =?utf-8?B?dHZMOStTYVpTbTdkYXFrdEVvOU0yTmV4dGdaQ3FkK2JiMlIrM0JRdjZNYTNV?=
 =?utf-8?B?eHlkeGxHWk81dy9MRXk5eFpxRDUwWStHWlo3eloxWVlHNE5zdVZuSnFQam8z?=
 =?utf-8?B?K3ZnR3laUmFmSE1JRzg2eHBKRmdTY3RSUDcyY3c2dUVKSFV3aFllWGRPNWY3?=
 =?utf-8?B?bTFOLzlqWFdOZHdDdUVuSEtrNGtFcjRDL0ZNMEcwekZMRzIvQU8zblFDcEl2?=
 =?utf-8?B?dzFOcmJqMFJkVmVEdDhHZElSL04yZTZBQnN6TnpiWG5CbHJDZEtsc1AzTzg0?=
 =?utf-8?B?RmJtUE9JVHpmRURIZXJ3QVdybzhOejZSRis3SzhCRUZuMTZ0SzRxNGZ2V3M1?=
 =?utf-8?B?akhjaHhCYlJjdGkxUVA1cThxanhaaFRzakJiSVNtUG4xOWJ1ZmlxR3ZYR0l6?=
 =?utf-8?B?bHNqUGlDRU1wS3FyRTAybEhGR2FvRlRERk8rNjlpc0xVWTNMS3E2Qy9ydmRa?=
 =?utf-8?B?cnFhVlhiMGtJdk5VcUwzNWkwU1VxWXd5UTlEMVZhV0JOM3ZsbkQybytUTmZj?=
 =?utf-8?B?REg2eXozVXBsbmpaYjNnN0FkYmNDMzQ0QlQyQXg4V0g5VFFZbi9VOXlvZkFY?=
 =?utf-8?B?eTUybzYwYjgycnk2MTlhTmNzUzk2QnVQZ25PKzh2TnMwVEJuWjl3NkMvRmw1?=
 =?utf-8?B?YnJqMmdZNnpTcnhrcGNNTXRGU0NuREs5SHRpRkJrV1ovcW5mSVZnVGwrZW12?=
 =?utf-8?Q?qujGYirKdmqzqn4c9oJLFrgsYfiWbYv1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3BRYUFZalhpZkc1Q1pYZW9wS3F3d0VCZ0JkZEFSOEpyOWY0TFJBVDdYNmo2?=
 =?utf-8?B?VGpDSU1LV0FvVWZORUpYZ3hEdjVGWXU3L0FqdGlRVFU3Zms5cGNyUzdTWUxK?=
 =?utf-8?B?ZW4yUjlYeFBJZ2RoNVF4dnRpWWdqOVFsZDFnY3VyNkhkOWo3WHo3ZU13ZFd3?=
 =?utf-8?B?SUlQMWRYanRubTJ1cHcyWU1sbnhydnRwc0NQWmxOLzZKSmZUbTVqZEJMVkh3?=
 =?utf-8?B?MlNJbHZ4MHR2MTl2SWdaSVdCTjk2NTZ2N0Z6MVp1ODFOaFBOT1JFeWhBZkkz?=
 =?utf-8?B?VjVvQ0xJREN1cnlWT2pSek1EOENMVzhHZDJsTTMyRW1YVUcrTkhVbWdIQVVn?=
 =?utf-8?B?SEVrM2RrcWo3SGpacjVkeHNSUjdrK3hLVy9XZVM2LzhjVHJ1TzB5RlJ6bUZ5?=
 =?utf-8?B?QnlTSkZMbXM1K1I2WjF0NDZHWWFLUGFYTGt2d0VLTVZTU3REcmluRDlpU2lG?=
 =?utf-8?B?ZG1GT0VZVzEybWRMZ0tzTTQ3d245TFdPWW5lMXJaVGhXQ2lkbUluUnhqVy9i?=
 =?utf-8?B?SVF3a2lRaFZoZjh4UG9aUTFwdmJoRnlLb05sN0E2cDBOcVM1dkREcjU0WnlL?=
 =?utf-8?B?Zmp5SUtwVldmeHRsT291a0tWV05ZbTNaQzNpbzl5aVg2NFAxSXhydjRNSm9E?=
 =?utf-8?B?Vmc3d0lQcHZFU0N0WnN4VGlYeTVXaWt5MDhqMGZ6U24yQU1RUE5RSncvY1BO?=
 =?utf-8?B?aU4xS0VObEJBWDVKQm5wMHRrUUc4S0RZNDNHdFl6dXNzQllaNjloMjlLVzJM?=
 =?utf-8?B?UGc0NHpFOVVBM1pyMnZHd3RXMXMrZmx6YkZhNmdxRkR3UFl4cmU4dktvN3Fo?=
 =?utf-8?B?djFQempsQWs4bnpzSjE4VFlJYU5DOURCQ3NEeW5tVHo2MTczM3I0NnFwU1My?=
 =?utf-8?B?SlRlSW1xS1Zqb0VUSXIxVHdOekV1aGd4YnhJZnZTS09hWFZuNGthTS92cE9p?=
 =?utf-8?B?UGhJTDU2d3d2Y1dxRHhyemxXVVR1a1UrRzZDQ09YaFEvWmExekZYUHBja1k5?=
 =?utf-8?B?blloelUyZ3UzS29uRnUrdS9QbkoyUlA5cEV2L2NIWFpHNlVPY0daWHgzK1BT?=
 =?utf-8?B?Sm5VTFU0RHprTmRjU244cTRvQ1ZJVDFZS0Zhd2FMUkZKTlh2SFo5Nmw2VzNY?=
 =?utf-8?B?S21BM2RUOXkwY213UEp1bHUxUGh1bklrTGV1ckQvRFVKZnMvdGVCMDJ4TU1P?=
 =?utf-8?B?SWgzUmZBNFJlYjJReXdBZDRrTlMxSVRSZTU1TlFTdS84a2JUK21kUWllSEhZ?=
 =?utf-8?B?Q3RDcHBPVUlJWFFxMnBKbEMyU3V0Mk5seUdTYXBYVE9ZSE4rTUtmK0R0MEZC?=
 =?utf-8?B?RlFqUlE2aE9wcGVMVXFKajZBcjdEVjZuQklmQWNCSWZMWEZEUW82cjVmWWRn?=
 =?utf-8?B?cjNZaC8zRkRKOU9NKzB0RUw5L0ZQMWNRbzBwMlQvT1ZSVmNoV0pVWGh3OXla?=
 =?utf-8?B?aTNnanhqTHh0VlRDTUZUbFk3TkpQZm1wYjRSa1NXdEZwMmNQVXcvMHk1SlpH?=
 =?utf-8?B?MzhHV1haOWpnWWlaNDJaODdUVVpZeksxRG1Ec2lZNXZqNkg3U3JidWhHRzBm?=
 =?utf-8?B?bjlwWElXNU5INkNudiswY01USDhScG5jcTR4STVGTDhYajNpdWNqbFdwY214?=
 =?utf-8?B?NXdPMUhrZ1Z0anFGRExuOVZPNW5sQVJZcmlldjcwZXdnTkNkaTVFQXZXYUxh?=
 =?utf-8?B?RmxhQWllR0tJMzBuenpsWk5lQlhEd20rUGMvc3NWN1hRL1pPMGNKM3BGRnhr?=
 =?utf-8?B?ZFFxVmdlditJQTJTQ21HRzlpbmtWSWZUS29YZXlrbVlIajE0QkFMb0hrQzkz?=
 =?utf-8?B?WWxaZ1FEUjJjUjZYVEdSV2kxUmlHakZlZXZIc2wwdkZxcEphR21UZmlEQVBx?=
 =?utf-8?B?Nyt6N00xRktSWEY2SU5Ba04xRGh6NWp0cjZaa2k4QitmV09QOTFBUVliMmVa?=
 =?utf-8?B?QXBnT0x5bCtMU0hWVE9MSjd6M1h4S0hNWlZlNjBnUURQemVUZnNqbFZxMklh?=
 =?utf-8?B?SGpsZ25ZSjk3M09rWDFIS2dMbmZPZWM3NWJ6SkVCNlJCUlNmMEJJWXVSdHZL?=
 =?utf-8?B?QUE3NGRLajFtdWFINWpSNUpsaTBtdU85WHpITkRsMWdBeVV5RUZpK0lQeTZJ?=
 =?utf-8?B?L3JTcTNNNncrQmFoY3dsQ1BIZStoSUcrUEV6SkxrOFFyZnFLUEFDZUFHRkdj?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508829af-6c89-4914-a821-08de25d50ea3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:30:13.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCCBYOkszKpYUlFwNS9ELiKyF8R5rPoLda/YrzpWnyhAp2BC0lfFuxNu+ztzW4uagquQcwCcRbynQDYVSeKQSLmndcvBJnp7zDOyPXQiwts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8225

On 17/11/2025 12:24 pm, Jan Beulich wrote:
> On 14.11.2025 13:54, Jürgen Groß wrote:
>> On 14.11.25 12:42, Andrew Cooper wrote:
>>> On 14/11/2025 11:32 am, Juergen Gross wrote:
>>>> diff --git a/Config.mk b/Config.mk
>>>> index e1556dfbfa..d21d67945a 100644
>>>> --- a/Config.mk
>>>> +++ b/Config.mk
>>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>>   	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>>   endef
>>>>   
>>>> +PATH_FILES := Paths
>>>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>>> +
>>>> +include $(INC_FILES)
>>>> +
>>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>> +
>>>> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
>>>> +define apply-build-vars
>>>> + $(1): $(1).in
>>>> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
>>>> +endef
>>> Shouldn't this write to a tmp file, and use move-if-changed?  Most of
>>> the time the markers won't have changed, and we'll want to short circuit
>>> dependent rules.
>> I can see this being an advantage when e.g. generating header files, as
>> those being generated again would potentially cause lots of rebuilds.
>>
>> In this case I can hardly see any case where make wouldn't do the right
>> thing already. Either the *.in file is newer than the generated file due
>> to a git update or a manual edit, so make will regenerate the target (and
>> this is what we want), or the *.in file hasn't changed, so make won't
>> regenerate the file as it is newer than the *.in file already.
>>
>> Or did I miss some aspect?
> Aren't some of the generated files Makefile fragments? Them being re-generated
> means make re-invoking itself, which could be avoided if the contents don't
> really change. (This isn't just a performance concern; this re-invocation has
> been the source of, well, surprising behavior in certain cases.)

Having thought about this some more, it needs to be FORCE and
move-if-changed, or to express a dependency on Paths.mk

Otherwise, if you ./configure --libdir=something/else and then do an
incremental build, the generated files will be wrong.

~Andrew

