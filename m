Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C8AEB66B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 13:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027562.1402176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV7Ig-0002TZ-Ed; Fri, 27 Jun 2025 11:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027562.1402176; Fri, 27 Jun 2025 11:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV7Ig-0002QU-B1; Fri, 27 Jun 2025 11:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1027562;
 Fri, 27 Jun 2025 11:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uV7If-0002QO-7d
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 11:31:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c4d5656-534a-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 13:31:17 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 11:31:13 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 11:31:11 +0000
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
X-Inumbo-ID: 3c4d5656-534a-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMYVL6zUxiwQ75lGmFF6XiuAqxumWRt4sDgjlYlL1L6RWJkRGTAL7aiLeT2mg+qOXSDmhJUEeJRwzIrKs1W2m9HS6LIa4J4Ym2ua1iSNbK0trq9gzvP5PzzNDyVRsfn7S7gGR5nksM1Dqt1CwALz8gd6nIrwOvqNxF9ENip5JUVVlsyQTt1wUr501rEMBELOHiCVnBLbG1ZRMR+pHSD9OjeBSLEaUNBz6yziF0wTEXLqL4gleETxNDs5Eamer2+Vou2QPA6gzNqY7Zh+youcCxehNUP/nK/jX3XGOjZ23ipKxBMM1fZgnAUg65TDUHc4VitzRw/E1C6TenOCaHjwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsEPaB386by8MqkeC4YIuTeuzHEcNVqvtb0Vf0KcAzg=;
 b=cj+XZBAAblgYiFpob7980e8bYviCccT+ClafsSGoxfZ+8Hj9EjCCHAMBRKRKxtQh49f9PYem/W4h3pF101qzQK4lYe0YydpnU0h+FCge2hoaulOg8bzTD4RiYSEacNWpzdMzlAr1gyPl6AX30Ym94YpHALc2GmLbVKA8o6XPBqpkO01EaB2tQ46yhzOwnDc1H3+7L1dh1QppGEiht8YqU+nKxBkG9hDeyAV/MobMhtMx69HfSGHsj0jDPO57hSzL5sgbGE+3bMEmrtGqfDR0SSA8ePOMZNXPlsLWCHzYNkizLj1FGUHqNY0AeE9S2EWOd0qmomI19WRf6/Thdua7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsEPaB386by8MqkeC4YIuTeuzHEcNVqvtb0Vf0KcAzg=;
 b=KefNA0oyMtO9aRvJb5iWrwh+nr9MFs76Lb/PpzmGav3mhxCGT5uzdCoiSvWxzRPHq+xz85uXXBM0Hbo+3hIycPbMoAhBI1qO3bXSsruR5/aC/8A+IkINHM1pDwFnPi0nKIr6zEUlYA07Tv4To22+kDNYOBJi+kEfcf4Gkez1WvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <24d213e6-27c8-46d2-89ec-2023b9f8fc56@amd.com>
Date: Fri, 27 Jun 2025 13:31:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: Introduce flags_has_rwx helper
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <bf51672b258c374a76b8f6ae22d8ce87ca234395.1750411205.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <bf51672b258c374a76b8f6ae22d8ce87ca234395.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d8349f-6d42-490f-cea9-08ddb56e1d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWYyUzY4VWpjdHBLZEVQNUN3WkUzZ3RlTWtJM3crMWRWWnFva0w1RE0weUN4?=
 =?utf-8?B?MThNVmQ1K1RkbUFFb0tpL2E1WVdYbktEUnREYmtzNVJzeFBEbG0zMGxIYWV6?=
 =?utf-8?B?TDYxSWozQ1pLWDNlS3lMK01tU0VoRE9SZlBzSnljT0VBNEV0VWdENWFUbTdh?=
 =?utf-8?B?bmJLTzkzekozZ0NvMm9sOWtTaEd0dnJaUi90c0NxRzlUUzhFOFJHdGxpSmt6?=
 =?utf-8?B?ek9oUnlnS2lwbnRGbzNFMENLSkF1SGg0NjRhaDE0dG9aOGV5THk3Vk91WTM5?=
 =?utf-8?B?SG5ZMXlTaVFwRll5Kzg0U2Uyb20xVDBYRStMbER3ZHhpSFQzMGtyaVlnNGlv?=
 =?utf-8?B?TlRoSlVpa1JGc2IzWDBZVDZ0eWNwVUxuOTJPM0J2TEVnc0s3SVVOcS83WDlL?=
 =?utf-8?B?dXRBR1BZS0gvYzRFNlhIelBJY2pDaHIyc1dBSnZqaWJNcHByS0Q1RitFblQv?=
 =?utf-8?B?OElWbXluWjMyWWpKbVNqS3JLZUJScVpNdWVoNlVDQk9nMUl2cDdPVHNXWDV3?=
 =?utf-8?B?ZkxrYXo5Q3FQa2Z2QkFvR0M3eGVac0lZQk5hYjFpdTdwdUFUaFNrNVFJYUJQ?=
 =?utf-8?B?WHgybi9MbXF5L3BUTkNsalFVSmVpVzc3dDVnQ1hEMnFJcHFyUERqaFJqZytu?=
 =?utf-8?B?MFF4RlZPbWVQQVk1Nk1PTGhQT0hTUEtabExGQjBlMnFPTEJ5NGg1NmZjR2RS?=
 =?utf-8?B?VGJOaENWQ2JnRFM5WUVpV3UvZ0NCSG9FY3JxMzBtRm1YQVpDY3JnVmttTjJU?=
 =?utf-8?B?YnBXaU94QWpwc2ZHcVJnbEZkN1V5RjFCcmYxZ2hOenNnZXZQZ0RkV1ltd1ll?=
 =?utf-8?B?TS9iQ2RLMllkTW90MmhKdUY3dmEzdTBWcFdHMHZQY25nN3RsOSsvVG0vYTlM?=
 =?utf-8?B?QTNwZEFpNnRVeHFIOVpLNTJrR2NPR3lVQWpySXBISmxmbVZoa2xXRUNZUzR0?=
 =?utf-8?B?QmQwaFlIc28zcnpCUndLM0duMmJUV0RTQmZzNlpXUU9XbTFyZlFoamkxajBY?=
 =?utf-8?B?NkNrOGJDNEtlM01rVDA1WlA5TXZJSi9CbWNSdkY2YTAwSGsydFJXbTEwVlBj?=
 =?utf-8?B?TDJERm0rRThCRXhPKzFtbmtwQjljc3RxTVppd3gzUnRKQU14ZHNKem5MU0Ri?=
 =?utf-8?B?UUdRK3BXTlZRd2drdjhENHNISnBRSHp0YUtyMFYyNTZKWnFPNWpCZ3MvbmVV?=
 =?utf-8?B?QmlXRmRKbVNJU3hlN2xySXhvVEw4bnBiS0h3Z3NrVGZuSnJlZXRYMnBrU1ZR?=
 =?utf-8?B?dTB1NmtxNVZ5Y1kyQ3lWMU12TEozc3NnaXBJeU9vVFhxeFMxd1pYOHFxK2dS?=
 =?utf-8?B?blJITGtrVzVZSGwxTWhZL2lUd2d1ZTZodzJLQ3Y5bU41RE1DTlptZHJmUkxU?=
 =?utf-8?B?a3BVYXBYU0lmdmxMVCt0SmhjZVpndjF3MGhPMTh4aVA4d3luVktGSHBXUFJH?=
 =?utf-8?B?clpwTG1qdUZQTTVIa3k1YWF2NitpYjZhWm5rajlGdjg2cmNYTllCazgrVzMv?=
 =?utf-8?B?ZVg5eHd4KzE1R2R4dXJmR2VxMmwxZGR6U1RxbkVhRmNYZWpJRXUzd3o5WEZG?=
 =?utf-8?B?dGRLZ3VjWkZCMXd4SG51a0p4Rzg1T2J4MWRyTkpDcnhBOXNSRGo3YVNreDV3?=
 =?utf-8?B?WGI2N1g4SVZtRW1jNWx0YWZGTGtrTmNQaHUzMUFMWndOMDBIRTRwSmJiUklF?=
 =?utf-8?B?SnJlTVpsM0FmQXdnc1lEYWxETFY1czMySjg5cC8yTnB0RzhBa0dVL2tGS3V6?=
 =?utf-8?B?ejNYTnMvS2xHVDNZZ01NUjZ5Z3ZwNFYxVHNLaThIcFJnWUJZNzEwWGYxRXJG?=
 =?utf-8?B?NitOb2xjWUJEV3RRTHYweG0xWHMzZDhkRWdZU1VaUVJzUDV0cXc4S2t0TGN2?=
 =?utf-8?B?VHN4MFhyZzY3dHVFM2UzMnVPcGlJYVlEd2Nyd1dlR2lrb3JwY1VQNGRKc0Ez?=
 =?utf-8?Q?564r6m7Nm9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXhoenVDNGxDYmRCWWYyMTdlWnhEVkFZMGc2encwMVhFQ3hpQk1JN0FsOU90?=
 =?utf-8?B?L0dHSXBkek5WdWpKb0VuQ0NyNmZGcURTWGJKUGtCNTAvalJyekdsdTJRQVFn?=
 =?utf-8?B?NDdyMUZ2cWNGUE5sdFVEWlI3LzB1NWhPemRPMkJEMkx4bHZpQUg5emg1RURX?=
 =?utf-8?B?M29sMnZLQ2dBRlVrUW1Pc01vaFc3VHZoTHR3blllMGYvMnlzMEFRS25yUlVJ?=
 =?utf-8?B?enk4TXU4bHhXNHlaZkU4Q1FZWnRzYTNzVEMweEU2d3VqOEJmekp6d01ieFlR?=
 =?utf-8?B?NWR1cDY5TEdpUlY0Y2ZocmthWC9ZQkluengyZDhZaUEyV2tSMjZCVms4MnNZ?=
 =?utf-8?B?dzBhemc0bCtMVEY2Wm9tN1VuYit4c2tCQkh0VTE4YWxyOVZWd3liVStUY2kx?=
 =?utf-8?B?MTZmNkNTVFJOa0VJcGdwb0pUaWVxZmFqc05xSEYrZzZLYVplaHA3a2I3OFRC?=
 =?utf-8?B?U241eExQK2xLemVQMEw0SHRFVWMxZ0ViK2JvaEJ0aDlHY2RWVjJnWW45blY5?=
 =?utf-8?B?akljNHV0MVd0akx5bm1zQzZtN1FiZGY1QlczZ0VRRkRjaTlWS0RJeWFHZW82?=
 =?utf-8?B?L0I4VUlmSWVoZTdETVdQUkdTa0FjcEpaenVaRFB1NjNUUEZFOXVzQXNQRkFa?=
 =?utf-8?B?YlByUDVSeEkwYWhSRno2S2hvOTVyZjVxQVJQN3VtSm9lMTJkVnRmU2ZUS3VI?=
 =?utf-8?B?dGdFdG5MTW1maHRBWnBjQnZBMG90cCtjc3BzM3NBQWNIV2tmTDVnclI1dXVZ?=
 =?utf-8?B?eU5mVENMT2hENkZIOFowdVRLS2FGWVg1MWo1SktYUnVHNTZOU3IvUXJjSStI?=
 =?utf-8?B?SGhrbmQ1eWkycmcveEJNSHFpMkJwWDFzZ2xFTXlDVVVLQ1BXd2dHVGpHR2pD?=
 =?utf-8?B?THVadldKeUprRUgyQjQrZWwyYTNOb0FTUkxVVU5EWW5wVGczKzBIK2p1NnQr?=
 =?utf-8?B?dUhjTGpDY21TS1pRc3JDQURxNmRJcmg3OG8zVkZYTTlQOWV3QVZyMGNJNUZr?=
 =?utf-8?B?b29FWEFRVjBCbE5SdWNBNDBwVE8ybnVRcldnMGR0WFZNWi80REQ4QW9CR3U3?=
 =?utf-8?B?UHd4bjdrYUE3czVKRHQ4c0hMZTlWT0FKbGZveGRwZWl5NE9LU0hTL28remw0?=
 =?utf-8?B?Tm1yT0w1eWphbVQvb2licVVtMGVQTUw5WUxTcTd4RFNFc0JXN0habmRaR21I?=
 =?utf-8?B?RTFEbWNGejV1bFdTdEI0d2NscUhRN0pYallid3pnYy9sYjBvVHRJYmp3U0di?=
 =?utf-8?B?RmpXMEd0MzA3ZGk0bDE2R09iVGlEenpzdTQ3S0RRZDVnc2N1Rmd5MGI2eFJM?=
 =?utf-8?B?MzNBNGMzVm15YTc1ZWFqTVl5VDNlYWMwT3NZTkt6NVcxd25Gd0lIVzhZUUQv?=
 =?utf-8?B?Y2RIWldJSHhGYmJ2NzBKcnRoQmpsN3cyM1c5eEhDMmpFS2d1TG1mR1VWY05l?=
 =?utf-8?B?WUZNZlZvekpDRDVyNGZhZ2dJc3hXUTdSU2x2dmVjUXVDTWswTmNtOFgyeklo?=
 =?utf-8?B?WDBZa3RHVm1yU1lxcllONnNSVnYwOGhLYU00d2xkZm1Gc1hGaWVNdUtUZTh6?=
 =?utf-8?B?ZVAvakpqRUdQVGZpTmlIYng1OWduTExsbHhyVCt1VGo0UVhkd1lSa1IzN1lV?=
 =?utf-8?B?UGFIMHk5L1oxWjNGckFWTEtZVTdsVkxrOW1qRmNZd1R5YksrYm9kVmdvbGZY?=
 =?utf-8?B?d0NLWlcrWW8zZkIrK1A5T1hrOVZKSmFkTVFqM09qOVkxdHN1aDh4ZlF0Z3Z6?=
 =?utf-8?B?UjBFUFZKRG9uMTVCVXdhRVk0d2hjME5SRXNnSWNFMnZ5NnFrZXZEN2lhKzhw?=
 =?utf-8?B?V05JMDZWV0tUUEhhTk1Nbis2NGpMazNhTnNhdzVYTDJMenkvb3drTHgzM2dW?=
 =?utf-8?B?WkZyb09HNnU3T1I4WWpnVll1N3Y1Z0dINGRUQzRyb0wrUDluMVJET09rNm5I?=
 =?utf-8?B?M0lVYTA0UXVrL1phUWZNcUVRRFdxaS9HNGhjZkFTcy9mQkhWWmRZQkFuQVRU?=
 =?utf-8?B?S1lRbVBzQUZLMzZtOVgzZlJzY3VuWVVUQU1Jc21Fc1k3RTlPQ1RDSWlPUDVD?=
 =?utf-8?B?dmRxdUJQZjA4TjhiQTlNM1ROQnpZWDdiNjRvdFk4Rmg2RTVVb3ovYXFlSWNi?=
 =?utf-8?Q?N5uCE3KEPEhh+1VYaZVDopsSC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d8349f-6d42-490f-cea9-08ddb56e1d92
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 11:31:11.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMqZQwVfBNSos5TLV1pgwDSV4YrPo5OLomOkV9aqsZKhTsG9ItH/kJzIMM4iy5JP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687



On 20/06/2025 11:49, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Introduce flags_has_rwx() function that will check if a
> mapping is both writable and executable when modifying
> or update the mapping.
NIT: s/update/updating/

> 
> This check was already present in pt.c but since it will
> be used also for MPU system, it's wrapped into a function
> now.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Hari, your SOB is missing.

> ---
>  xen/arch/arm/include/asm/mm.h |  2 ++
>  xen/arch/arm/mm.c             | 15 +++++++++++++++
>  xen/arch/arm/mmu/pt.c         |  9 +--------
>  3 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 011bc1fd30..9daaa96d93 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -192,6 +192,8 @@ extern unsigned long frametable_base_pdx;
>  
>  /* Boot-time pagetable setup */
>  extern void setup_pagetables(void);
> +/* Check that the mapping flag has no W and X together */
> +extern bool flags_has_rwx(unsigned int flags);
Please, don't use extern for function prototypes. We don't use them anymore.

>  /* Map FDT in boot pagetable */
>  extern void *early_fdt_map(paddr_t fdt_paddr);
>  /* Remove early mappings */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0613c19169..c2da1e3a05 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -24,6 +24,21 @@
>  
>  unsigned long frametable_base_pdx __read_mostly;
>  
> +bool flags_has_rwx(unsigned int flags)
> +{
> +    /*
> +     * The hardware was configured to forbid mapping both writeable and
NIT: you can take opportunity to correct misspelling: s/writeable/writable/

Otherwise:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


