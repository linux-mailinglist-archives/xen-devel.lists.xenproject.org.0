Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FE975C2C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 23:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796870.1206577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soUX4-0005qO-A9; Wed, 11 Sep 2024 21:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796870.1206577; Wed, 11 Sep 2024 21:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soUX4-0005on-79; Wed, 11 Sep 2024 21:05:46 +0000
Received: by outflank-mailman (input) for mailman id 796870;
 Wed, 11 Sep 2024 21:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLDu=QJ=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1soUX3-0005oh-B0
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 21:05:45 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aa3db47-7081-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 23:05:42 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM0PR04MB6996.eurprd04.prod.outlook.com (2603:10a6:208:18b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 21:05:38 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 21:05:38 +0000
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
X-Inumbo-ID: 9aa3db47-7081-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZZG58Ts6tjWE2BFj6z2+Yx5cj9pKUy0Vq4c2bENtdxm9qOepX+Lfy/m987x4ahYshUzaX4FMzxU5vTB0yp9yVWVQCqAsEVd6q2C9770Z3qKRR8+fM9MNPQ6z9T3lyNM3bDfxzbq8JnCQP5BxYW5eEy5Aj96B6e62kll8GjUkVLus7U1nlq8XmIqwWZ8dTt3JLRZTwJ62KDje2lLAsHJAJs5rmLDhOpI1mR6ozyYcjMDAGHOuZOfG+d/KsbUYgRXfgU1KfgdyGgJ3SpmLmJZ0+yKZxZxRpWQafGc3ulrmmN21OCd9gW1in1dmLckFskTzzjFSzePk4zNzbeWsAJQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY2O5RKhlrCEHTTgKI8DeuseUMy6OCwWTLVwGSIzny0=;
 b=bkaiQHXMNJ1Z0Fc5LYzmqbLQ3hWOSt4pGtQsEVEDqcm7lQi0pAvF9UXMalFGKoMlmizkfrJFyFiiQsq7RHFDTDZcqA7sJtWPtgnwXIsf85lmiXHDzLzVbRUVAzsjauAukVK+39WGbn2O2xv/yYh/G76wXmUxhTMm9mKxoEC3LBJA8u3BHQ78PFqnxlCdzW6RfETnm2yh2+G0U7szig6ZjsaWuBombrtZB9EBuWzTuOu2PN/8Vqxgc8ZckXFF1nkEVmggLdSAsJAcmbDu3dr8a1ajdg6OqvjoxOsujOOgfqWfF2mc4tiQe1meqlxKBDsyBFrhQZ23V9bMMKS/zrxulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY2O5RKhlrCEHTTgKI8DeuseUMy6OCwWTLVwGSIzny0=;
 b=CnuxqwXlkHBzKqQZ0a0CIxW+DY8opglcpt1799n7SW8UW3GX8Iqtspbc2Auc0NpPz/4zeSuPybgrWoZCVlgvQ8a1sYExIAMkpXAWH8tba4Ql/cECrgsjlnRvmfhSpPxMipiOnHPztHXHPvYXQmwmpeU2UKg8L1oztEbdq6wTn59ZW3LTvWqxSy6O0oXh+KI2YjebYceeF2FPJ2MCVNNkKyXrZShTF/xgw6G55zcs0bq/4XdY5kQKJbXO6y/KijB9liRtC2pcAfESlCK0eSqYjZ99g4pXLyhyPJ/+ZuAa/mWD3ALx/LbBOKx6cbdBIgkVmRvrLCgVDxLYw+AqSQX1NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Content-Type: multipart/alternative;
 boundary="------------YWgjtk0eD7SRBSNiPhBq240d"
Message-ID: <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
Date: Thu, 12 Sep 2024 00:05:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, S32@nxp.com,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
 <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
 <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: AM4PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:205:1::36) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM0PR04MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 71418b58-d529-4008-23ae-08dcd2a57c90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emd3MEkxMldjeWVqbm9EbkR4YTVnWjF4ZG5OLyt2WlJaVlIrSGx1MTNTdjlL?=
 =?utf-8?B?U041czcybi9PcHJmcGJWV1NkK256clBJZC9DSStkdFVQaTNsMzdsNUxNbHRP?=
 =?utf-8?B?SXNFcWE5K0FKcWZGRlAvcE5lR3ZvaWhqZmlzaWVIZk1hYmI0akZTN0lCay8z?=
 =?utf-8?B?Z2RCbzE4UmNSOE9lZ3YwTjBHMXJWdnYrK1Jqa0kvMEVmbFRYdFAwRmFsS09F?=
 =?utf-8?B?RFg2VzVZcWRGQmw5WXVjTFpNQWtWSDVXZUZkQkQ1ZWFQK3IxVCsxaHN3RzJG?=
 =?utf-8?B?dG1KbkdaV0dFbU5UUmVxOEpnWE9QcDQrOFNWZWFkWlFmRmd2UWx4a3grbmV2?=
 =?utf-8?B?Wkk3TGlER29vR1gxN1Azb2xNVDN0NkNuYjlEQTIvTzNyUHB1VHlTVk5HTklE?=
 =?utf-8?B?S09ISi9xRE5NYmZkWW1NZGlqS0lhQmtDUGxSNWt2WGFWY3FreWFINWI4ek8w?=
 =?utf-8?B?N1VhUmVxMTJ3bmVneU9WdHMzejZiTldXanNsYzl5S0RvVjBldGR4RFhJUE1k?=
 =?utf-8?B?TExMQVFVYkhCdEtQMzBCbzZZWTUrSGRsaWdRdlJNdDVwbGpoNzFiQW40OTha?=
 =?utf-8?B?a2JnMTF0cTJFNVNyZkZ0UnAza0REVkVIbUhWWjU3UEFNYk1OZldkVmJPaUJM?=
 =?utf-8?B?T3NyOEl6MkZwSisraUNneSs0Nzl5OGxmbEhPc01KOFlWNXZwa2hjL0NGdkpp?=
 =?utf-8?B?U3lEVjlCblFxeXFzWUVWcnhxdWl3UmtMQXI0eEtmMzNrU0tuWEk2WHUxUGox?=
 =?utf-8?B?R0xMVmxCS2NTTklCOGRNZFMzT0J5aTJkZDRxLzhzTTNOS21OZTNJekJOZ1Fp?=
 =?utf-8?B?a0o0cnRBTDZwNVIxSVdWQ2lrUjdsUC9sWGlURlJTcVhwRUZMd096TWRRTWli?=
 =?utf-8?B?SWY5Sm1SRGcwODBSTjMxdjM5L1hVNHp1OUZVdUV3cm1XcTJMMXVjcTBpVkxT?=
 =?utf-8?B?c0JmY1RrbU5CRFQ1MVVwY2RBTC9Ub0haeTF2azNqZ0JKcGxyeXVoaExMaU9I?=
 =?utf-8?B?M1NLWjk0VjVsUEs0YXNuczk3cHVjYnl6ajE0RTZXby9PVlE3QUFYRmF0QmFT?=
 =?utf-8?B?cG5RZ05JU250NHJvY2JMVlBoaG5LQ2M2TUpYYU9HRkp6Y0JIK0ZDbTBBVTAy?=
 =?utf-8?B?SW8vVEdIMVk2NjZQZHloSURmZ240WTVPem8zM09RSFhMd0FhMjNIK011TjhM?=
 =?utf-8?B?N3d0MWlLRXJXeUQyS1E4bktQVll6ZjJ1K2ljMy93c2RzblRMRmY5cWdlRVYz?=
 =?utf-8?B?azU5OGpKS2JydTZYQWVxNjdabnluVnR5VVBxWjBUbUp2eis5VVcyeklhbWI4?=
 =?utf-8?B?N2xKbk5ySVFWc2ZETzNqK09MTXZWYnZuTWMvUXFGdGt3ei9TbjBhMEdMQVZM?=
 =?utf-8?B?ekl1ODJRTWowMk1sNmVOSFZpV2Q0T3lueGkxZ0w3UHVRYzkvcFBlTUtPNStF?=
 =?utf-8?B?VVZyM295OEp0dktlc2VoTXU1NDF2Yms1WURVREw0ZUd0T0FlREVIdExjc3A5?=
 =?utf-8?B?aXU5WVM5bnYzcnlPZXlocnNCQ2hocVhDSlo4azBoTmhxTDlVMkswUlVNdEh3?=
 =?utf-8?B?SHAyTmFDdXZhMis1ckEyWkNIOTVuME5CUWVoUGlYOFBIU2p3eElUaURFWmRB?=
 =?utf-8?B?ZldPMmdqcDdPaHNPU2s3VXRzYmYrNHVaMVpHcmVXZXA0TDRIUGh5TDJzeG5i?=
 =?utf-8?B?RTIvTWtYcEpUN0NGTGFEMXdIS3kxeUJXMDBoTmxLbUtZODgvVEw1QnFDeHVa?=
 =?utf-8?B?T0ZXMUVxZVh1S1ZldDBWU0oxcjFHQU5uU2hTYmF5MUM3Nm9wSkkrNXNjemcr?=
 =?utf-8?Q?E+KY1QseDrV2PBtCvh3OfHJsXvB03II0Qi3kQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJjTjAzK0ZXT1psSTdoZHhMQ293b2NVems4eUdFc2NUS01MalArNStCS1ZD?=
 =?utf-8?B?TkVqK3NYUm1kZC85R2FwVGk3L3E2YitpYmgvcGZvMWdjTVBZSmd0Nytlc3ls?=
 =?utf-8?B?ais4VGxOTlR2Nk92MFlrSmpWS051WUlFSVF0cW1PYlpVKytoQTk0S2hpMnBq?=
 =?utf-8?B?aHQ4UGJIZVR1bHR3Q0N3RmxsWm9kS0w0NzdyR0h5SVZ4TGQ0TmNleDh1aldy?=
 =?utf-8?B?Sk9GTWxweUpEYzJYTGVqZ0ZjVTQ4b3FwSk51dVNJVjhweENtQ1E0ZWk4Ulhi?=
 =?utf-8?B?Z1VvSGl1VDhOWWpzWmNVQTVwK1FHMDd2d0pNN3Q1bm1RUGU2cGRWSk1XeVph?=
 =?utf-8?B?M3JMOWtvcUFFUklwcThqejNxSmZ1YnJOOFRuM05lbU5ESzlLRm82bnN5ZkZx?=
 =?utf-8?B?bEJvbW5TNm9ldVpwYjk4Wmp6UnFXWHFuVzRUN1VKOWdGUmFoU0pKb1diSnA1?=
 =?utf-8?B?WXlJV0l1eHluZnUzZk0wd0RhaEJlTlFTVldJWktsTThmaWVPVlkwQTV1aEtR?=
 =?utf-8?B?RUlBZGFINmZaRWNnU2FaQW5Sb0JtNTFBN1g3cUgxV2NDOUZQdXhQOE5BTTFt?=
 =?utf-8?B?MkEreXNpSGJhazladkxQNFZ6MGlEaUdORnZVdHhQSVIzNEVOektEYWlxbzda?=
 =?utf-8?B?QW02Z2xTbWc2OHFwcklmMnFkOUN1TDlWVjdSeVpQNHloN2hra0tkR1VKeGhX?=
 =?utf-8?B?c2ZNUUx2NlFpWVdKZG5EVmFPSW54RWIyVEUzSHd6cFdOR0xOZ3RBQ3Fvam45?=
 =?utf-8?B?TGJyWDR4VWJlcXZxRkV3MCtadW81TzhxelQrVURnOTBPOGdHV1NFb0tHa1JE?=
 =?utf-8?B?aStnVnl3US9GS1JGTDJkRFZDbGxsZlBqenJ1OGtVODZKay90d1MyU0JnYnc1?=
 =?utf-8?B?LzNURjNZVmRFL3BRMDM0eWJEVFp4SE1vYkl0VVV0NldIbm9qVXFBZXd2Mk0w?=
 =?utf-8?B?OUltYlpJTUQvaFl4QUhqSkk1TFduNm1FamhKYTVURVRmSkpxai9mSXZqV3Bu?=
 =?utf-8?B?QkZEcEpHUWRoOUREVldSL1JGdHlUOHhmRHhjajk4V3R5RHNWYjNuWG9jUis0?=
 =?utf-8?B?Mzh1RzYxSStpYWdNalVmeFdPVjYzVlNXN1BxR3NjWEpBR2ZEY1puKy82V3VW?=
 =?utf-8?B?NGNsWk5CK1lUcjBnTCtWeVNQajJ6UXorS055ZGFCSUxDWWNnRjcyR1Zja3oz?=
 =?utf-8?B?QWNVYkxyNGd5N1p3TUQrWmF6djd6blh2M0pWV2JRbUtTVjN3YWxSZEF6V2R6?=
 =?utf-8?B?UEJQY21qM0dVS0hPZWs4QW5YdGZYRzJvZkJJTGVyWlFNTnZGMDFJT3dPaEp5?=
 =?utf-8?B?Snp5OC9GUjVRc3FvRXJ5SnRJa0pZYTFyZDVBMHh0SjczeWFGUmczdDdRL2ZR?=
 =?utf-8?B?T3E1MGRnQ1U4YzVsck1QS2R2TnhXZmgzSzFmYlUvS3ozZk1XcXlQc3BleGxL?=
 =?utf-8?B?d2Y1Q3RaMkFzYWJTdXJyMzIreXBIQnRwZGFaeEFHZnhDUTJOZzVjNUdLenpP?=
 =?utf-8?B?UVB4T3VseE1CcjVob29ES3lTem1qM1l0Q3dMNHRtdWFyWTNhL0FoaklWQVdB?=
 =?utf-8?B?aFRINERZcUJrYmdLck1ZSDdERzZqdGZMRkhWNG40SkpDNFVjay9uYVdvOFp3?=
 =?utf-8?B?UmRvSkR1TysxcStRd2lDeUNnN05XWHNKMnNYNlRUWVNCQ2ZGMDI1ZTl3UWRH?=
 =?utf-8?B?aXg4bmxubmVaL3NkRTVWSXBnUGxvendwQWk0RmwzTS85K1owNmFhbzZWRWtq?=
 =?utf-8?B?SlVqOUtybVdCZ0l1aXdFYVdUMnJQMnIzMXdMSko5M3diOFZZUy9iellJK1Nw?=
 =?utf-8?B?SmFSWnJjSnlKdGtBcEd0UERNQUlDcE9sRTNON3djWTV1WnNXN3BsZFJncTBp?=
 =?utf-8?B?eHFCY1d1ZDZNMWYyUXhLRWdXRGVxUk83UW5aYWNWMlh1VmxLSWo5emd6Q1dy?=
 =?utf-8?B?aloxK2lyTWN6dmpUSDRjWS9TVHZLdzR1cnA0SG84SUtkWHdjeFZEMFZFaXB3?=
 =?utf-8?B?ay8zRkdJbmluZWUyU05rUzkwQWlkR3NKdDVGRitQaHl3WnROY28xN1Y2cExs?=
 =?utf-8?B?d2VrMVJpMTdabFFjUnRwWmxab1VaLy9DdlVGazg1cGVEQ3BNSFdwQ1p0eTNu?=
 =?utf-8?B?SU9oeXBJV05abUZ3ZHJGeUd2dG9JTnFVVzFqNXJMMWZZNFQwSThMamYvZTEw?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71418b58-d529-4008-23ae-08dcd2a57c90
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 21:05:38.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iqQDvmctejtZhoMFY9LNVU77aPj6ao1wdnuMABdDj1HBk2LvPfASoAWSPMh+UdHRHDKwTwWOM1Xt2nKffai7Ej8aB6EqV0Eu9WC6ppdjOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6996

--------------YWgjtk0eD7SRBSNiPhBq240d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien, Stefano,

On 11/09/2024 08:19, Stefano Stabellini wrote:
> On Tue, 10 Sep 2024, Julien Grall wrote:
>> Hi,
>>
>> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>
>>> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
>>> which need SCMI over SMC calls forwarded to the firmware
>>> running at EL3 (TF-A). Linux relies on the SCMI Platform
>>> for system services such as clocking, reset, etc.
>> Is it SMCI as in the Arm spec? If so, this should not be platform specific.
Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform specific.
>>
>> Furthermore, I was under the impression that we can't blindly forward
>> everything from a domain to the firmware. While it might be okayish for dom0,
>> you also seem to give access to all the domains on the system is it intended?
In our case, only Dom0 has access to the SCMI mailbox. Hence, the other unprivileged domains are not aware of SCMI and do not make any SCMI requests to FW.
>>
>> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
>> [1]). I think it would be preferable to focus on getting it merged as it would
>> benefit everyone and increase the security posture (we could restrict access). 
I also asked a few months ago on the ML in a virtio related thread if there are any updates regarding
SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he did not comment [0].
I'm curious why the SCMI mediator patch series did not progress.
[0] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/
>
> Hi Andrei, Julien,
>
> SCMI is very flexible and can be configured in a number of ways. In
> general, Julien has a point that typically forwarding to firmware all
> SCMI requests from Xen domains is not the desired behavior.
>
> An an example, imagine the case where device1 is assigned to domain1 and
> device2 is assigned to domain2. Now imagine that they both share a
> clock. Domain1 and domain2 could fight over the clock frequency settings
> using SCMI to change it, without being aware of each other activities.
> It is likely that the system would malfunction.
I completely agree and we are aware of the possible resource contention. Another (simpler?) scenariowhere access control is needed, besides the one you described, is when Domain1 would directly try to perform some requests for some resources that affect Device2 (owned by Domain2). If Domain1 knows the clock IDs used by Device2, for example, without any access control it could perform a SCMI clock request affecting Device2's clocks, which should be out of his control.
>
> If this kind of situations can happen on NXP S32CC platforms, then this
> patch might not be a good idea. As Julien suggested, you might want to
> have a look at Oleksii's approach. We could probably allow Dom0 to make
> all SCMI calls. If you think that is OK, you need to add a
> (is_hardware_domain(d)) check.
> On the other hand, if your SCMI server implementation has a way to
> prevent possible harmful activities from happening, or maybe all clocks
> are fixed-clocks so there are actually no SCMI operations to control the
> clocks, then it could be possible that this patch might be fine. I admit
> it is unlikely because there is a number of ways SCMI could be used by
> one domain to hurt another domain.
>
> Can you please give us a brief overview on how SCMI is expected to work
> on NXP S32CC?
Well, we normally rely on most SCMI protocols to access system-level resources from agents: Base, Power Domain, System Power, Performance Domain, Clock, Reset Domain. Linux jumps to EL3 via SMC carrying an SCMI message, and FW running at EL3 decides how to handle it. Basically, Linux cannot directly control most system-level resources.

With Xen, we currently don't allow unprivileged Domains to do SCMI requests. The SMCs are of course trapped at EL2 and that's why we enabled forwarding to EL3 without any access control, knowing it shouldn't break anything, and to let everything function as normal. In some passthrough scenarios the unprivileged domains rely on settings already made by firmware (for clocks, pins, etc) that their assigned devices require, and in DT we replace them with e.g. fixed-clock for clocks.

An "is_hardware_domain(d)" check should be enough for the moment to harden the code, but I agree that this should not be something platform-specific in the future, and the handling must be done in a generic way.
So I would proceed with this approach for this patch series, if that's ok for you, and I will also take a look at Oleksii's approach.

Regards,
Andrei C

--------------YWgjtk0eD7SRBSNiPhBq240d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <font face="monospace">Hi Julien, Stefano,</font>
    <div class="moz-cite-prefix"><font face="monospace"><br>
      </font></div>
    <div class="moz-cite-prefix"><font face="monospace">On 11/09/2024
        08:19, Stefano Stabellini wrote:</font><br>
    </div>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap="">On Tue, 10 Sep 2024, Julien Grall wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Andrei Cherechesu <a class="moz-txt-link-rfc2396E" href="mailto:andrei.cherechesu@nxp.com">&lt;andrei.cherechesu@nxp.com&gt;</a>

Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
which need SCMI over SMC calls forwarded to the firmware
running at EL3 (TF-A). Linux relies on the SCMI Platform
for system services such as clocking, reset, etc.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Is it SMCI as in the Arm spec? If so, this should not be platform specific.</pre>
      </blockquote>
    </blockquote>
    <font face="monospace">Yes, it is SCMI as defined by Arm. I agree it
      shouldn't be platform specific.</font>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Furthermore, I was under the impression that we can't blindly forward
everything from a domain to the firmware. While it might be okayish for dom0,
you also seem to give access to all the domains on the system is it intended?</pre>
      </blockquote>
    </blockquote>
    <font face="monospace">In our case, only Dom0 has access to the SCMI
      mailbox. Hence, the other unprivileged domains are not aware of
      SCMI and do not make any SCMI requests to FW.</font>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Anyway, there is a series on the ML to add a mediator for SCMI in Xen (see
[1]). I think it would be preferable to focus on getting it merged as it would
</pre>
        <font face="monospace">benefit everyone and increase the
          security posture (we could restrict access).
        </font></blockquote>
    </blockquote>
    <font face="monospace">I also asked a few months ago on the ML in a
      virtio related thread if there are any updates regarding </font><br>
    <font face="monospace">SCMI awareness for Xen and guests, then
      Stefano CCed Bertrand, but he did not comment [0].</font><br>
    <font face="monospace">I'm curious why the SCMI mediator patch
      series did not progress.</font><br>
    <font face="monospace">[0]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/">https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop/</a><br>
    </font>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap="">

Hi Andrei, Julien,

SCMI is very flexible and can be configured in a number of ways. In
general, Julien has a point that typically forwarding to firmware all
SCMI requests from Xen domains is not the desired behavior.

An an example, imagine the case where device1 is assigned to domain1 and
device2 is assigned to domain2. Now imagine that they both share a
clock. Domain1 and domain2 could fight over the clock frequency settings
using SCMI to change it, without being aware of each other activities.
It is likely that the system would malfunction.</pre>
    </blockquote>
    <font face="monospace">I completely agree and we are aware of the
      possible resource contention. Another (simpler?) scenario</font><font face="monospace"> where access control is needed, </font><font face="monospace">besides the one you described, </font><font face="monospace">is when Domain1 would directly try to perform
      some requests for some resources that affect Device2 (owned by
      Domain2). If Domain1 knows the clock IDs used by Device2, for
      example, without any access control it could perform a SCMI clock
      request affecting Device2's clocks, which should be out of his
      control.</font><br>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap="">

If this kind of situations can happen on NXP S32CC platforms, then this
patch might not be a good idea. As Julien suggested, you might want to
have a look at Oleksii's approach. We could probably allow Dom0 to make
all SCMI calls. If you think that is OK, you need to add a
(is_hardware_domain(d)) check.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap="">On the other hand, if your SCMI server implementation has a way to
prevent possible harmful activities from happening, or maybe all clocks
are fixed-clocks so there are actually no SCMI operations to control the
clocks, then it could be possible that this patch might be fine. I admit
it is unlikely because there is a number of ways SCMI could be used by
one domain to hurt another domain.

Can you please give us a brief overview on how SCMI is expected to work
on NXP S32CC?</pre>
    </blockquote>
    <font face="monospace">Well, we normally rely on most SCMI protocols
      to access system-level resources from agents: Base, Power Domain,
      System Power, Performance Domain, Clock, Reset Domain. Linux jumps
      to EL3 via SMC carrying an SCMI message, and FW running at EL3
      decides how to handle it. Basically, Linux cannot directly control
      most system-level resources.</font><br>
    <font face="monospace"></font><br>
    <font face="monospace">With Xen, we currently don't allow
      unprivileged Domains to do SCMI requests. The SMCs are of course
      trapped at EL2 and that's why we enabled forwarding to EL3 without
      any access control, knowing it shouldn't break anything, and to
      let everything function as normal. In some passthrough scenarios
      the unprivileged domains rely on settings already made by firmware
      (for clocks, pins, etc) that their assigned devices require, and
      in DT we replace them with e.g. fixed-clock for clocks.</font><br>
    <br>
    <font face="monospace">An &quot;<span style="white-space: pre-wrap">is_hardware_domain(d)&quot; check should be enough for the moment to harden the code, but I agree that this should not be something platform-specific in the future, and the handling must be done in a generic way.</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">So I would proceed with this approach for this patch series, if that's ok for you, and I will also take a look at Oleksii's approach.</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap"></span><br>
      <span style="white-space: pre-wrap">Regards,</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">Andrei C</span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap"></span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">
</span></font>
    <p><font face="monospace"><span style="white-space: pre-wrap">
</span></font></p>
    <p><font face="monospace"><span style="white-space: pre-wrap">
</span></font></p>
    <p><font face="monospace"><span style="white-space: pre-wrap">
</span></font></p>
  </body>
</html>

--------------YWgjtk0eD7SRBSNiPhBq240d--

