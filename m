Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19840C4D625
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 12:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158987.1487347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vImSP-00066a-Ut; Tue, 11 Nov 2025 11:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158987.1487347; Tue, 11 Nov 2025 11:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vImSP-000645-Rc; Tue, 11 Nov 2025 11:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1158987;
 Tue, 11 Nov 2025 11:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIBT=5T=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vImSO-00063y-NO
 for xen-devel@lists.xen.org; Tue, 11 Nov 2025 11:22:40 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fd13bd-bef0-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 12:22:34 +0100 (CET)
Received: from PH7PR03MB7004.namprd03.prod.outlook.com (2603:10b6:510:12f::22)
 by SJ0PR03MB5904.namprd03.prod.outlook.com (2603:10b6:a03:2d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 11:22:29 +0000
Received: from PH7PR03MB7004.namprd03.prod.outlook.com
 ([fe80::58d9:f998:8591:d601]) by PH7PR03MB7004.namprd03.prod.outlook.com
 ([fe80::58d9:f998:8591:d601%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 11:22:28 +0000
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
X-Inumbo-ID: b6fd13bd-bef0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz663qTnCwIOL9QYHvgseKn02COMtfXICoDxoUY4Gs0nJdKLjjUF4WWI7/+uLwkKRaf0M/iusso3Y3kdB97PD2GMHvOK3sWvRZGDfs+Xs5wU9CYpSFdCsl+HBzXXHgNaDAUGeYlCbVoHoFIB/LDJeRUUXoo7nBCQJxSiKiItif9rh58LwrHKB6Sv1nDfErDu2MWVLqU5P2ldwgr1SBH9KsLTx40h/G6+eynkz1oEbl8X2hmu9R96becFl2x9DJK90LMHu4she9PMWxnNgXSQEA+dEfQbkEAsyIMq6DcFxtyMCorujw+MkkP8uXJaWraik1r9H4q4RbEjUVdRGpupfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD5zv+p2zVuzsQv+J5Cqi1thCYSYg8o63Q7FckABUMA=;
 b=Bb9G9qz6OKm7zQ7K8b6zZwdUCO2p6uj+BYmC2U9M71C7pvBtLB6pO6BC/OTX6Dbx+b8snryRa7wCLWfDY1jdUAGe4CeDG0/hmZUABaMK7uR3AQsydWDeX5HMrCF/AiZrvWjL/XVJ3cKUtR+HTX4/YxRnGO688kvQF7kKpx3iCfo/xm0mYDkAxHl1GSufcWFHRmqYI6+Vw0ceuKvk0fyem5vpBSuCcC/UBB6JVxfjVOanGkigxNVTrWXZpAqQENmqfJcccSweqDg+biwNb2EBLEcFdl5BZlicm0LQjUdV9dYH3MnpTePNIbQIOXwv6Z98QlFqsCYV9iCC52gsCXa7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OD5zv+p2zVuzsQv+J5Cqi1thCYSYg8o63Q7FckABUMA=;
 b=Z6zyIusCeAUcY62vCdxuCyIhZ1VBed5ThAf17OtPwpmESr1nUeVhxSWiwcAYe43GOzrPI6HukZUP0TjwM2nSFS0mv7Ayl63BfyzMtEKqXFyMuWrq7+/b0vvoMvbmgHgJ3mRbmGFuCM0FG+bEGSN9du2xLEBClWSKEYS5k/ZFiB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7957dea8-dbc0-4c0e-8364-0b1ff2e75f25@citrix.com>
Date: Tue, 11 Nov 2025 11:22:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]: Crashing Xen when nestedhvm is enabled
To: Patrick <patrick@failmail.dev>, xen-devel@lists.xen.org
References: <ab3a978a-2088-4a39-a4c1-822ae5050fe6@failmail.dev>
Content-Language: en-GB
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ab3a978a-2088-4a39-a4c1-822ae5050fe6@failmail.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::17) To PH7PR03MB7004.namprd03.prod.outlook.com
 (2603:10b6:510:12f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR03MB7004:EE_|SJ0PR03MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0e847a-0213-4a96-8971-08de211497b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFhsL3hvbDB4cGRoQTE1dFV0SEpTUkIwMzZhdWJtS1R6cWNKSmlDbldzK2Rp?=
 =?utf-8?B?LzJ3YjdpYUVndWhleU5sUHg5U2RzQk1PbDB3SVpJd29RRFg5R1BMYjZUbmdE?=
 =?utf-8?B?cUZ0dThlYncybEtleG1CVjNOaW95R1Bzb3J2cW5HaEpwTTBYTTZDa3pNNENP?=
 =?utf-8?B?VE00TzNISUNLS2R5aGJLNDlGTEpVUWw0cmdpMTFaS081elpZeVNhc1YyOEVt?=
 =?utf-8?B?Nk43MEJUNW5NQ214TUNxcEd6ZmRMckpqQURRRksvNGpydWRPWDF1NFZFd2ln?=
 =?utf-8?B?dXZtTXlZR3lMNFBidFZEN2dhNHV6RjJONGJqRVgvMXVxT2Fmd2NXUmpHMGpz?=
 =?utf-8?B?NS9WWjcyVzhsMWNRdmdvL204MEJIZzNoQThSZkVFcGlwZ2NidmJhWVM3eUZm?=
 =?utf-8?B?VjNDMWxhbmFsRUFYTFlXTHNqUlFXd01ydllDVHZYTDFaYUc1NEdBa0pPQU1N?=
 =?utf-8?B?Mm5SVnpiMWE0Rjc1ZERIdVU5cDVvLytUWS9HblF4alkyUlFCbDNGbUFXQU1l?=
 =?utf-8?B?cU12bFh2MDJ3azhTdzhyQU5iQkZhakRpNUJ1dkVpRTdKd0Q5aE9NbDJFSUtx?=
 =?utf-8?B?S0dSUVEyL0lBc01wYmtBTU9qU2M3bXFrTituOExyUkZDRnVSbmJzUkRlZ3pP?=
 =?utf-8?B?dDRwVmdzckF2ZzVwRjlwaG9jdnBJRVZwZURFSnFEenRDRElFNXd2MytWbHk5?=
 =?utf-8?B?WVd2MWVnOVIzcTNWS09Sb1ByZE9IVUxrajl2R3BXMXZuc2lqVFFaK01NQ3BD?=
 =?utf-8?B?dVVESWFqUDdVQm5uV1FMRHo1U1ErUXk4c2diWWxqMDdTOWVxNHVYVERoT3pJ?=
 =?utf-8?B?cUlESCtTVEZoT0k4eUVUYy9YSVNLMUNMZGx6Slpyem1pL2RrTGgwdVNUby9O?=
 =?utf-8?B?c2d5VHl0VVN3U1p3YzlPaG5vNk0vRjI2d2xsOGJmUHpveXpkaFRUTWpIY2Yz?=
 =?utf-8?B?cVdUejJNU0dTVm1zaXBzd0Uvby9mT3hBR2ZIenlOUG9veDZZVXAvY0ZxYmZq?=
 =?utf-8?B?aExqNlpSS2luV3dHRG1WRFl2ZXpoUjBlZ1NQQWpmNjlGZmc5RnF6YXJJbzI0?=
 =?utf-8?B?T3QwNk0yRDRTKzkxUE0zaGxpaW5WNHV4Nm4yMGN4S3l0UTIwak95dTFjdXo1?=
 =?utf-8?B?YldLUnRHU01RMUVIR3doTER0VTd2d0VDbUJ5VXhXeDVvS3NaSjJxbkhrL3Uz?=
 =?utf-8?B?aXBjeTdLSlFVUWw3WUtiSlBpNTVsVDhOeFZtclF5TXBBb3RqWko1UmM2czVs?=
 =?utf-8?B?MnBsSnJiWkVlbnBwV3ZGeDdraDBiZ1E1Wm1pNTJ3ck1FTmwrbFF6NjAxQktx?=
 =?utf-8?B?anJTdURSdU1BTlR3NjdKMVQ0MDhtU2xpM2NxMDVXRkROdDdVN0xTWTN0MzJP?=
 =?utf-8?B?djdSV0M3dXl4Q1hKVmZTMitQTW45UVlyQThHQjZRK1dobEVJeThjLzBWODJK?=
 =?utf-8?B?Vzd4YU9nRDlNT0FYci9sWkl5QitxY0JTNGlJbGZmMWMza3V1Z295bU9DTjBB?=
 =?utf-8?B?Q3VVdEY4MVg4ZVVZSmUrUnRNQjI2bThITnZ5QXFPVFpTMHRrd3RSbldabXJY?=
 =?utf-8?B?R0xqbld1aUhyeEh0RTFsaFR5TkhXNG92R0NZWlNaeG5YMmdRODhpR2I0TlEw?=
 =?utf-8?B?ZGROK1pWNjNFNDBqbzZKMGJHeEpqWm4rRnRNY3BjakxRdUdmVTFucjU5S0tY?=
 =?utf-8?B?Z29qeFN1eHBGRkowSU5tS3k1cWlYK0tmOGRZVnVxY2o0TUVaU0R0MWlsblpS?=
 =?utf-8?B?SEhLQm04NytxU3F4SlllNGNiNmtPZlhRUHRFVWpRN0U3WEhEWExLYkl2cUtT?=
 =?utf-8?B?YlNOUWEycHNEc2lJR1FpV241ZTZhMVZneUhRUGtEVThQU2gzTm1lRjJaTVp2?=
 =?utf-8?B?VzdIMUhEV0dlMWRTWjFqdTc0WkZTLyszY3hoMkFQM0ZRQkloMUptZlkrNmtq?=
 =?utf-8?B?SUJBenh3bjgzOGNEOGZBcFQydHBXNnpUL2JNNXBEUkVKT1BtL2UvN2RQdldK?=
 =?utf-8?B?V0cxMEEvalFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR03MB7004.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z29vc3JGOEVVcmJWeFkxTlp2RVpxSlNVNlpHMmtwSzRuQmNqVUk1U2ZTZDRN?=
 =?utf-8?B?Qm5NVVl1VDh4empsdXQzL1hpVCtFOVZZL3Yva1dwZ2VnSnMvd1FsWnU4TGcy?=
 =?utf-8?B?dXIyVXV2aVE2Yi9KaUtiS1B0ejdCZTRMbnp6THJNMkUwU2diM0RCZjBDb0Ft?=
 =?utf-8?B?ck5xTmtob25VZURnZUV3Ky9GOStwUGFjekdaMjVJS0JCRGFmWURQaDFjOTRE?=
 =?utf-8?B?MkFsRmdzTlhKZ3RPQ3VRMHNFU0k1MmJWRmdhcGZ4WDJoQjBQaVkxdlBpNzBr?=
 =?utf-8?B?OVZpaCtzblZHRnFubnkySGtVc204K2RwYUg2OW9BUEZYQkRMMjZtVGNTMTRN?=
 =?utf-8?B?NUhXaUJLeGJFWDJRTDN1WWI5cWJqaHNUNkdHUVhhTkYwUGViT0o1b0tscWVV?=
 =?utf-8?B?Tm00MnVQYXNGdE1yNGVsQXUzSndqRXFEWFUwcWg1cUt6eFB2ajJJK1lPYmVG?=
 =?utf-8?B?Ni9aMWZqNW44L3hldlE5b1FjbkMwazVSMEJyZUFxK2toUk11TXc2dVF5MXFz?=
 =?utf-8?B?dTIyVVExSFFDWUlmc3A5U2U3dzZRMzRiL21KZndjQzRjTk9pNGMxRGczOFhZ?=
 =?utf-8?B?cEFNTDhIZjBCQmZ0MG1MdDBqYnRWL1NrNzVCVU5XZjkrQnI5ekhBNDNtc3Ji?=
 =?utf-8?B?Ti9PY2JmM0J2YnQrMlk0U0xiTWpHTDRzTjR2SmhxbWJuQWlGQVhra3RJbFZS?=
 =?utf-8?B?QjZ3aU1RdG5lRlJ6SEg1Ymtha3l6ZStYMVJGMlluTFFSdk50OXBCUkROUWVX?=
 =?utf-8?B?NkE3RUFSZzVqOHVzSzNMVHBHcUVmajBIbFZyZnlRS3BxNTZrbDVUMkVnVmtQ?=
 =?utf-8?B?ZGZFMFpkaUZ0a3dVTzg1S0RoOW5kU2ZicjI3MWx2K1hJTzFFSjBtaHRyd3Jt?=
 =?utf-8?B?RCtYbkExemN5VDZmSm5OY0YxcEVlbHlHZUtpSUZaMHNicWt5K3BPUmVGRzVQ?=
 =?utf-8?B?RncxNVpkR0FUSFljN1Foc2xaY3E0ZzA3WDF4a0EzNDgzTDk5dEYveERRZ3l4?=
 =?utf-8?B?am14S3VTME9sVis2SXZQWUZPdS9HSGlaMlQxU01mNlhZbEFIODBCK3RzZyth?=
 =?utf-8?B?MlRCZHNMMHdXb0dTSEdvQnNxN1ZpZGw5MHUvRTg4M3hkV1cwbUp1b0hNVFQw?=
 =?utf-8?B?a2hvKzB0Tjg1bWVvSG90dHNIWmF1UCthVW9mY0NFYTdXN3YxSUY1akE0aW9j?=
 =?utf-8?B?Z2p1K2ZXWVdTa1BhVmpHZnFia1h4MHdrdERoNXlndzhRRWMzK01QQ2JYc1RX?=
 =?utf-8?B?R2o4MTNSV3p5VmR2M0pvZk9WVHQ2Z1BxUDk3RGQ3a1plZTdnVUlxbUZIejNs?=
 =?utf-8?B?T2RiQUpyVFJBZWtwTjNWa2pPWUxyN1hWQVhzQjRpMjRZWUl1QjZ4VXY5Wm11?=
 =?utf-8?B?VUJuc1Nwb2VUSTRySCtpTkphcEhyajhweFAwQUozT3JxYndHN3pUY0ZYVDJN?=
 =?utf-8?B?RkRCbVNjYi9XY0liaWZ0cjdYUyttc0tVVWtSN2o2anRCQm9sTmdkd3BLbkQr?=
 =?utf-8?B?SFg5bUZrTE1BT3luZDZaYXVCQU1LVS81Q01ndTNtc010S0JNeUVKR0NVUGJ3?=
 =?utf-8?B?a2J3UzBJVUV0dnZlOFFLZWEyeFRDbW5WS1FmV1U1aGdvRkVSNGFrL1V2Y2gr?=
 =?utf-8?B?T1Axem1hNWdYeW9ieThoL2M2K1E5V3dDYzdrWmh6R2tqY2xQNXl4VUlXQURE?=
 =?utf-8?B?ZXJuMlBMeExyelNoK2x4SmhSY0R1TXMzR05yVXhjT3Yrb2l5RVd4MlhwcHla?=
 =?utf-8?B?ZVdqRHdKcjlyR1hVQ0dWRkNJWm9vQWRMSDZka2V4ZDFobCt4SlBXNHA5bFhG?=
 =?utf-8?B?ZUsxZ1ZEOHY4TlI4cDhDck1jYWhDTUZLK3QzTjdaYXJFYnFoNmVHdjNQM1Vi?=
 =?utf-8?B?MlVZOEsxSThZYlhBcFlxckVyYjBldzIxTUs2bzRsNnBGOGpMblFZVGdDRFJJ?=
 =?utf-8?B?Rmh6ZkF3bGoyQldTaDE0dWdObVpIMnEwUU51Q3VRd0dncmtNUmkzcXd5VFNw?=
 =?utf-8?B?bUdnbmg3SldVeVJCYkx6S2p0OG1QRGU2ODkvZHN2NktqalprQTRFZnd2WGlw?=
 =?utf-8?B?aEMrdVVQcStHL0lxVzBhWHZRektCaGZ5ZmdKRlJZaW90VnlDenV1VGkzbVo1?=
 =?utf-8?B?N01tUmdpSE9BbGRWRkRGVHdBSnFuU1pQaDJKaTh4YjFBc0hIZnBNSlQyR1dT?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0e847a-0213-4a96-8971-08de211497b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR03MB7004.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 11:22:28.0640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRP1cHRI8prFIiYe/T80/hKFN4Vub8IM/xtdHBKFI5Yq2rCA3+X12OK/f0SDTy1gOvPPqNwf8ZcZGsTzPN5dDHq0QthNF2EjXeEzwz13IRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5904

On 25/10/2025 2:44 pm, Patrick wrote:
> Dear all,
>
> I think I have found a way for a guest to crash the hypervisor,
> when hardware nesting is enabled and we are running on Intel using VMX.
>
> This is done by executing the following steps in the non nested guest:
>
> - Enable VMX and set a vmcs active
> - Override the revision id of the active vmcs using memory access to any invalid id
> - call vmwrite to write the `MSR_BITMAP`
>
> Basically this:
> ```C
> vmxon();
> vmcs = alloc();
> *(uint32_t*)vmcs = correct_vmcs_revision_id;
> vmptrld(vmcs);
> *vmcs = invalide_vmcs_revision_id;
> vmwrite(MSR_BITMAP, NULL);
> ```
>
> The `vmptrld` will set the provided vmcs as the link pointer as seen in
> `xen/arch/x86/hvm/vmx/vvmx.c:1834`
> ```
> if ( cpu_has_vmx_vmcs_shadowing )
>     nvmx_set_vmcs_pointer(v, nvcpu->nv_vvmcx);
> ```
>
> If the guest now calls `VMWRITE` it will access that vmcs directly,
> execpt if writing/reading the `IO_BITMAP` or the `MSR_BITMAP`
>
> `xen/arch/x86/hvm/vmx/vvmx.c:107`
> ```
> /*
> * For the following 6 encodings, we need to handle them in VMM.
> * Let them vmexit as usual.
> */
> set_bit(IO_BITMAP_A, vw);
> set_bit(VMCS_HIGH(IO_BITMAP_A), vw);
> set_bit(IO_BITMAP_B, vw);
> set_bit(VMCS_HIGH(IO_BITMAP_B), vw);
> set_bit(MSR_BITMAP, vw);
> set_bit(VMCS_HIGH(MSR_BITMAP), vw);
> ```
>
> If we now execute `vmwrite(MSR_BITMAP, 0)` in the guest it will execute this stack:
> ```
> nvmx_handle_vmwrite
> set_vvmcs_safe
> set_vvmcs_real_safe
> virtual_vmcs_vmwrite_safe
> virtual_vmcs_enter
> __vmptrld
> ```
> The vmcs pointer being loaded in the last step being the one supplied by the guest
> that has been overwritten.
> Since we have overwritten the `vmcs_revision_id` the hardware will reject the vmptrld, which
> will call `BUG()`.

Hello, thanks for reporting this.

The manual very clearly says "Don't Do This", but Xen should not crash
as a result.

I think the bug is letting the shadow VMCS remain in guest memory.  It's
also ridiculous that we intercept writes into control state then emulate
what hardware would have done anyway.

One interesting thing about VMCSes is that VMXON/VMPTRLD may make them
non-coherent with the rest of memory.  This is implementation dependent,
but works in our favour.

Architecturally, the only time revision_id is sampled is during
VMPTRLD.  There are no equivalents to VMX Error 11 for other
instructions, and no mechanism I can see for reporting this specific
failure during VMEntry or non-root operations.

But, with nested virt in the mix, while a vCPU is is in (v)non-root
mode, we can de-schedule entirely, run another VM, and come back to this
vCPU.  We need to be able to guarantee that such errors can't occur, or
to be able to forward the errors properly into the guest.  There seems
to be no option for the latter.


>
> ---
> A secondary similar bug happens when calling `VMXOFF` while a shadow vmcs is active.
> This will not clear the shadow vmcs, and crash the guest if it ever writes to the vmcs again.
> Effectively locking the page of being modified until a new vmcs is set active.
> This should be fixed by applying this patch:
>
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index 2432af58e0..3895dd158a 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -1589,6 +1589,8 @@ static int nvmx_handle_vmxoff(struct cpu_user_regs *regs)
>      struct vcpu *v=current;
>      struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
>  
> +	if ( cpu_has_vmx_vmcs_shadowing )
> +		nvmx_clear_vmcs_pointer(v, nvcpu->nv_vvmcx);
>      nvmx_purge_vvmcs(v);
>      nvmx->vmxon_region_pa = INVALID_PADDR;
>
> As far as I have read it is not specifically stated in the Intel SDM that a VMXOFF clears the active vmcs, however it
> does also not state anything otherwise and I thinks it's saner to clear it than to crash the guest because of an
> vmcs error, when it has vmx disabled.

This is different.  The manual very clearly says the VMCSes may become
corrupt if they're not VMCLEAR'd before VMXOFF.

In fact, there's a long standing bug/misfeature in Intel CPUs that upon
VMXOFF, non-coherent VMCSes remain non-coherent until the next VMXON, at
which point new VMPTRLD's can cause older VMCSes to be cleared (the CPU
can only hold a certain number of VMCSes in internal registers) and
written back to main memory.

In the case of e.g. kexec, the new kernel has no ability to figure out
that this is going on.

Xen will need to clear all guest VMCSes for safety, but if we were
feeling helpful, we probably ought to poison such VMCSes with 0xc2 or so.

I've opened https://gitlab.com/xen-project/xen/-/issues/218 but it might
be a little while until we get to this.

~Andrew

