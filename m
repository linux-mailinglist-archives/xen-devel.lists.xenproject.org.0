Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C17BF6DEB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147234.1479582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCkQ-0007So-Kg; Tue, 21 Oct 2025 13:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147234.1479582; Tue, 21 Oct 2025 13:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCkQ-0007QW-HI; Tue, 21 Oct 2025 13:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1147234;
 Tue, 21 Oct 2025 13:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBCkO-0007Ct-R8
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:49:56 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2feb597-ae84-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 15:49:56 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BN9PR03MB6108.namprd03.prod.outlook.com (2603:10b6:408:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 13:49:51 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 13:49:51 +0000
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
X-Inumbo-ID: d2feb597-ae84-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYib2CYQa+Vx1hIeUTv6EoMnZg8hI+hEbkyimzC09wQQlhC7TatAoW2t0OdikbSH7++8rIM6oGZDsko0+o7rv3MTXTAZEMnYuASvjvizMtwq5XF8+b0HrzEU2DnulsMMR8gEJasvXLfZeAKPKiRcwmNzRuknK1CUTfcTPpS9H+t1PkwDmnvY3G1NVWnQrvwEXQefTPr/NQrc+FOXuY9KAE/TZEjpSNquG3pOTTArU3AwAwJC8rc0LHrjQMQdapb2rEf31pjhSfVAcLkxnsMj4aQ4JuIT1qP/Pyoh6aeEs2bdfiRNkioY6DkK3Z5XafQ+dVqnAias/Ufghq8IzNDt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jM7wPd1hok6EuGBb0PaoWOgDB2IorXtzdr9mJMJro0=;
 b=j2kp9/+LmChVRcjM/nLLMpbdPs3Bz32W7Qj/QOeppWuHcUCn+Kstno+CFm5uhdHeRkKQHbPRCZsotiMcUV0cNrgw4cNptJez/VqFn15foZ5EKgKCTiZvj8cTMWo8qmv6I0lDQBbZd9ABc/YnLhQ8heWYjxw4MY+jVWxHJqb++RN1Z0XRm5ktoPrmwe+YUm/9MQH8RPRvdvS4x23+dpCY37FPEJlGATqaaY6ZDl+LfJG5I/mShmyTuUHGAPC4so1CBxxRY8JUkx8W2PV0qA515oV/2UwY7zFer9XQuDvOFqa5QfJ1s+6UBI13lQ6fGdVhzLIbFRbEx8QdjI1r8ZA6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jM7wPd1hok6EuGBb0PaoWOgDB2IorXtzdr9mJMJro0=;
 b=A9AIBlK3EJ/JLYQMwljkkgQkDzIP4MoLZiA+QK9C536wQwhXLa51gAkRLBljqkwAgXXNq7YMzhSsuZUSOo4B/dtoXgssp0312HP3odmZtym70U4Pd2LSxmojB77WZIRzpqb4eeDdPbchKwtqt4cnFKN0bTqcSJUzsswPCDLfjKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 14:49:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPePepQk3t6gxMR1@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
 <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com>
X-ClientProxiedBy: MA3P292CA0026.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BN9PR03MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ace9f3d-b08c-4a6c-76b7-08de10a8b4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3BZanJTVVlrUVFuaXA2SEk4ckJLVWw5ZEcwdTNMb3BZWElVeGFVZHJEakc1?=
 =?utf-8?B?L2VRYnRBV2o2NzF4OWt1dVNDMSt6WGFqaVZuK1NWeGpuaWRXU3hEYkpFek9J?=
 =?utf-8?B?RXRNZEU0MmRxWlZWTFVMamIrbVJDbVVzNGNRVjUvNjVIbE1BdEJrK1lzbC9W?=
 =?utf-8?B?SW1BM2NvY0o0eXNpR1FVKzNDalhEV1RXWlptSkpwMjZjQUdDMDBUelhCazVG?=
 =?utf-8?B?VzlSR010YkhBQk5EMUhsOW5UMm94eHpUcFBUOHB4NlNFTUVVQVlOY0FERnJh?=
 =?utf-8?B?V3kvVWZqbEd4TTdYejFVV2hnZmRkZGwrR1B6Rmg0ZHNVaXd1WlBDRUZwanJs?=
 =?utf-8?B?Z1BZMkZscjA2azI3ODhaeGEyMklYQUZ4OHFBdXdxZm91S1BhZTJacG5Gd3V3?=
 =?utf-8?B?Z0dncmx0c3FDMWl0enl3NjVQWlY2aDV6SFpEaHoyUnNYS0Q3WmdtZ3Mvc21O?=
 =?utf-8?B?alc1QjR6aUdwOGxYMWtlRzg3WXZJWTJWK0xBcE9yeGVKaXd0UVgvZE5VOThx?=
 =?utf-8?B?V0dsTytUOHVpeHJGb3VsUndQeGxpQytuZUNsMEtmUFdsQnVOZkkvOFJUOW9z?=
 =?utf-8?B?dWFBQkorMCtpa0NqemJ4NlBSL3NQWGFxeXBqN3lld0VNV0RXRk9wUUNQQ2g3?=
 =?utf-8?B?MHlPMzZrcUYwRzBLaC9CZDVwWmhTQWYreWVzd0J5M0NOa3c3QVBtcDR6RUNU?=
 =?utf-8?B?bWdjWU5YSFhDTk95a3AxUmVBQk56cmlxSVlIR2dPR1l4V0ozckwwZk9iMWpm?=
 =?utf-8?B?R2ZvUllzNXdTUC8zNUNHWFlJQWpYaU9pajhsT1AyVkh4N2oxVnE0VEtudzVm?=
 =?utf-8?B?dXBTaGMyVFpkNHhLYXB6U2tRWXROMFFwc2Q1WWZodm0rVEoveWR2VTFxbFFm?=
 =?utf-8?B?NlZIVVlMaDlkS3llbW1laHo0U3V2RTl1dzBDaTU4S3RWdTJmYWhvaVlwaGZW?=
 =?utf-8?B?YlZ6bkd2eDJoT1BBQ3B5aEUza1Z2M0hRc1hPb3YyUm9aakc1ZnJDV2l6dWtZ?=
 =?utf-8?B?WGphRTFNQ0tMRmRoZjFBcVJpWkVzTGtFemdYRVZML0l2cTExVE5aS05NcExI?=
 =?utf-8?B?ZmxSbTBhTURXQ3lHamdsb1RKWlZsVDJGQTU5R3VVMWlBQzFaRXl1NnRyNTNW?=
 =?utf-8?B?V3cxZlBXdjZCMlN2eUp3NENMZlZnYmxJY1F3RHR0K2J1M1NVdzFHYW5WSkRG?=
 =?utf-8?B?QlI0ZkxSOWtEQWxYL3Nzelc5ZERXUnZnTnN3Y3hya0s0ZysyLzN5K1RUdlQ3?=
 =?utf-8?B?aU9iZVRLbk9pRUgyRVNRZTFuRGtlT2R2MHltNTFiVUtQcEI2NUNHWkRxRjFV?=
 =?utf-8?B?Y3RLem1hbVJFbnJTcTZXVmdkN0JQaTFqK3pUay9KaHI1UEJZdmZpYlZTTEtu?=
 =?utf-8?B?MlRvK2k3Nk9lMjNlemozQkJYVml0QjV4R1p3aTUyclRqMlArRkpPREZKbnRs?=
 =?utf-8?B?Y0RkYXFFTlliQWhSNzFmS1ZPaUVuaVI0RHFmdjRGQUhMYU5zUTFvdkI5TFRx?=
 =?utf-8?B?bEczcHZjbTQ5cm12REJvL2MvakdXUEYrN2RqdFhPUVBwdHlBcDNOZkNMam51?=
 =?utf-8?B?RXJNNkFHRHZrZldEZ0VaSDN6aXgrSnNFaHljS1Rvem91RWFKOGVTSlA5NDJP?=
 =?utf-8?B?dlNnRk41dUh0ajlQN29YdWxnQ3pUcHZMV2gyVDEzVUNIZ2pMbENib3FUUnBJ?=
 =?utf-8?B?ZmVmVGFnMjRjQUYwYit3bGsxQWhNRFdQaTRwZW9oUVRZMUd6RHREdzAwUE55?=
 =?utf-8?B?enNmU0EwaFVScHhqcHIzYnhZTkxpb3FhNm93YWlnVGdXWTYxRzE5dWZpZ3Zn?=
 =?utf-8?B?aytMVC9qdzlpeWJjYmcrbmtTZzZHUnY4Qk9jU2hTRXp1QnJXOTZqTC9HS1F4?=
 =?utf-8?B?bGpQZDlnWlhDWEFnNmlzdlZ0WmRrQ2xpWTYwQWxUT2s2c29ZQ091NTNyZGhE?=
 =?utf-8?B?SUVEenpDY05sbjB1UTgxTHRkVE1QME5UQTZadmtZUEpWRFRrWDVSLzdwM0VR?=
 =?utf-8?B?MC9LUTgvOWpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGlTOWY0c2lRMjI4V3lud09hWThlMjJVbXRSdy8zYnREU21DRVo2VW96Q2Iw?=
 =?utf-8?B?R3VJcDVSb2p1K0pOc2FVeDBiMnRmVEt2ODNTRkR5QjdGN29tbkJ6ZzM1S2xN?=
 =?utf-8?B?dWF1OXQyTDV4R3F5MnBXQWM2SVJQeGVYSHpJeit2YmNkNWZhNVV3Q29KcHFx?=
 =?utf-8?B?SlQ3ZjJxMVlDRGxJY1ZtWHJ4RmRlelNwYzlqM0NCU3Y2SFFuQUFYSUp0RnVp?=
 =?utf-8?B?ZnAzSjIwTFZaYTl2MUpSazBnK2ZmdEdkMk1reW1lWkxqbzVFc2dOQ2ZDNnV1?=
 =?utf-8?B?dVZTYUM3Zm5aR0doUlhrT1ZvYUpjbUcySU5EWk9YUHBPaTR1YTIwK1ZKN3VF?=
 =?utf-8?B?ZFNmMTRtUHA0S3JZa1ZHeG50MWlmNmZDQkxoMW1yQm9pSWVKNVdjcXJidlpC?=
 =?utf-8?B?OUJXZ0xvMVFnU2xRTktNeU5TSVRhdnQ3SVdFb09yQTZqM0pSL1lGcXNYQWpH?=
 =?utf-8?B?UW5RMWZsVkQ1RUIvMEgveUlnRFNocWRzMTlrSDhOcjh1bExuY2JmR2hPbURE?=
 =?utf-8?B?eFZPb3J5dFpyaE5nWGkwaW5CSHY4cCsxd2E5a0hRU1ZYaXBJSTFtMnBmUTE4?=
 =?utf-8?B?WGUyaUJzRS9jd2JWenZDRVZSSzZLOU5lYUJ2bFUyN211SGtVTWRydnE2SEYy?=
 =?utf-8?B?aWVsZUl0QXAyVVZyWUFON2ZGYVBWK2FHRGpFS1ZLN1duWThwcDF3cm02RW0z?=
 =?utf-8?B?aGM1VnpWRXR5SDl1Ukg4dmxlTEtjVTlZMkZWQytGWWRSLzdxUVFzTElTL2RC?=
 =?utf-8?B?SzVKVmJzU3paMVRla0F3Kzd2UXFKbk8rNFFLNTk4MTdJdzE5QmZJWGF4RWdy?=
 =?utf-8?B?ZFg5K3dhZENiSFpiNW5YVHpvb05SMndQOTZzSmZjUzhBam4zSE5abEZwL2Ji?=
 =?utf-8?B?R1NMOTY1UXBEeEI5eTNOYW80RjlzRUV4ZmczVlErcmorSWdCU0trOGgrdDBN?=
 =?utf-8?B?cDdySGV2YVpMbHdLQTFQYUpWU0RlVW5KRkFUT2grYUIra0F4OWlCTnVTdmhJ?=
 =?utf-8?B?b0UvanQxQld1WU5CTkFPbTFnb3NJelNyV1RWQmhYZTN4QzAycDRxOCtJTE9Y?=
 =?utf-8?B?NmxxUU1mLzB0WktaVmp0RGZPVzdqR3h2ejBZY2Y5bU5WRGdsSzJLTEpjamFh?=
 =?utf-8?B?UzRzMkd2SGw5Y0hmZDhNakMvTDFTMmMvUEZnbWZmYzhoTDJmaEtYcFh6WVdI?=
 =?utf-8?B?aWQ5eE9KTDJHOVc0dFNkRnZJaUJiYTJpYnBBL2w1OVBQSExEOVEzS245ZGp0?=
 =?utf-8?B?bUp2YVFtZmFueTdsOVl4ZzdJOWpoZnZlbVFXOUltY3lMbDFZeTZjRlh3YklM?=
 =?utf-8?B?TExkcFdLcGw2c0pGRGtER3JSSUVkbVJnalRxRHpSZG9YelUrL0k3YU1CLzBv?=
 =?utf-8?B?SWNwNGFYVEdKZFRyVnNQaWgyQmJ4ZmFjaWtpcklCZXhGbWFxUG5MVXdtVEpp?=
 =?utf-8?B?akZGZm9Sa2I2RjhPeHZiMXUyTGJuaDByelZXcE5jQS9ydVNKWUQ0aUQydmtl?=
 =?utf-8?B?UjRYbzNnUTlJUDMvM1p1TXFDdTl5YVBjbjRhV0FiWDFFWDdaSS96NCtCYVRt?=
 =?utf-8?B?blliTmx1dUwxMGdpTG8rZ1JJQy8vaUc0TDhTWk4zWncyTHFoOW1leHFFdzk5?=
 =?utf-8?B?WEQ5MFJRSnllUDZjWDdDSUsyOWhFdVFaSTBVeUlqYlRGWWhEbUk2bTNaSzl3?=
 =?utf-8?B?OXk5eE5tbTkzVTVmUDJ1M09xdFJGVDhGNUJkWGhTeXdvM1NmNmd4Zm8vWVJG?=
 =?utf-8?B?SFFxdCtzR3RtdUZqVFRNMXYyS0t0bFNZaGR3elpEUHpkZ1hKVEVYamVRZnVx?=
 =?utf-8?B?dFdVVElQZ0hmU0p4MWl3U3FjMjJ6RzlQVTVqN0xmVW5aUXJ2L29DZE1mOExI?=
 =?utf-8?B?WDZqcHNXd1F2VG9TZllMK2FGYnR3czhKSUZJSk0xUk5JTUZsaUVlRU92KzFq?=
 =?utf-8?B?TGdwbjhDM0JMZmN0dUZNOHJoNEo2WDFnY2FvazkzTlRiTUVsRzVhQTdrTUpl?=
 =?utf-8?B?MkJlNjBsR3RPZGFsSVdUb1lidVBYYk5ETXpHU3dMRnZzblFucnQvaW1SWHhw?=
 =?utf-8?B?UEMwbXJEVVV6MUZrVUJydTA4UE4veWdzR2ZpSjFkazhiZzdsYlQ3alNUNjN3?=
 =?utf-8?Q?Xrldhwfj0MAR+6525le6q4nrP?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ace9f3d-b08c-4a6c-76b7-08de10a8b4c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:49:51.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svrKAEq4Sr0DkamnXNHIeHeTxC0MowctN5O0nwxXFoLG2B/igQWtf5SU9k9POUGcZ6IW19FhNv56Ue+BnFJlCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6108

On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
> On 20.10.2025 18:22, Roger Pau Monné wrote:
> > On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
> >> Using dynamically allocated / maintained vectors has several downsides:
> >> - possible nesting of IRQs due to the effects of IRQ migration,
> >> - reduction of vectors available for devices,
> >> - IRQs not moving as intended if there's shortage of vectors,
> >> - higher runtime overhead.
> >>
> >> As the vector also doesn't need to be of any priority (first and foremost
> >> it really shouldn't be of higher or same priority as the timer IRQ, as
> >> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
> >> and use a vector from the 0x10...0x1f exception vector space. Exception vs
> >> interrupt can easily be distinguished by checking for the presence of an
> >> error code.
> >>
> >> With a fixed vector, less updating is now necessary in
> >> set_channel_irq_affinity(); in particular channels don't need transiently
> >> masking anymore, as the necessary update is now atomic. To fully leverage
> >> this, however, we want to stop using hpet_msi_set_affinity() there. With
> >> the transient masking dropped, we're no longer at risk of missing events.
> >>
> >> In principle a change to setup_vector_irq() would be necessary, but only
> >> if we used low-prio vectors as direct-APIC ones. Since the change would be
> >> at best benign here, it is being omitted.
> >>
> >> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> >> ---
> >> This is an alternative proposal to
> >> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
> >>
> >> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
> >> generic IRQ subsystem play with our IRQs' affinities ... (If so, this
> >> likely would want to be a separate patch, though.)
> > 
> > I think that needs to become a no-op, with possibly an ASSERT?  Is it
> > possibly for dom0 to try to balance this IRQ?  I would think not.
> 
> I'd consider it an error if that was possible. But then the same goes for
> other Xen-internal IRQs, like the IOMMU ones. They all implement a
> .set_affinity hook ...

We need such hook for fixup_irqs() at least, so that interrupts can be
evacuated when an AP goes offline.  However movement of Xen owned IRQs
should be limited to Xen (if it's not already).

> >> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
> >>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
> >>  {
> >>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >> +    struct msi_msg msg = ch->msi.msg;
> >>  
> >>      ASSERT(!local_irq_is_enabled());
> >>      spin_lock(&desc->lock);
> >> -    hpet_msi_mask(desc);
> >> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >> -    hpet_msi_unmask(desc);
> >> +
> >> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >> +
> >> +    /*
> >> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> >> +     * actual update below (either of the IRTE or of [just] message address;
> >> +     * with interrupt remapping message address/data don't change) now being
> >> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> >> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> >> +     * keeps setting the new deadline only afterwards).
> >> +     */
> >> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> >> +
> >>      spin_unlock(&desc->lock);
> >>  
> >> -    spin_unlock(&ch->lock);
> >> +    msg.dest32 = cpu_physical_id(ch->cpu);
> >> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> >> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> >> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> >> +    {
> >> +        ch->msi.msg = msg;
> >> +
> >> +        if ( iommu_intremap != iommu_intremap_off )
> >> +        {
> >> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
> >>  
> >> -    /* We may have missed an interrupt due to the temporary masking. */
> >> -    if ( ch->event_handler && ch->next_event < NOW() )
> >> -        ch->event_handler(ch);
> >> +            ASSERT(rc <= 0);
> >> +            if ( rc > 0 )
> >> +            {
> >> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
> >> +                ASSERT(msg.address_lo ==
> >> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> >> +            }
> > 
> > The sequence of asserts seem wrong here, the asserts inside of the rc
> > > 0 check will never trigger, because there's an ASSERT(rc <= 0)
> > ahead of them?
> 
> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
> we ought to check (and presumably fail on) data or address having changed.

Right, but the ASSERT(rc <= 0) will prevent reaching any of the
followup ASSERTs if rc == 1?  IOW, we possibly want:

            if ( rc > 0 )
            {
                dprintk(XENLOG_ERR,
                        "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
                        msg.data, msg.address,
                        ch->msi.msg.data, ch->msi.msg.address);
                ASSERT_UNREACHABLE();
                hpet_msi_mask(desc);
                hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
                hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
                hpet_msi_unmask(desc);
            }
            ASSERT(!rc);

I'm unsure about attempting to propagate the returned values on release
builds, I guess it's slightly better than possibly using an outdated
RTE entry?  Albeit this should never happen.

Also, should the desc->arch.cpu_mask update only be done after the MSI
fields have correctly updated, so that in case of failure of
iommu_update_ire_from_msi(9 we could return early form the function
and avoid changing desc->arch.cpu_mask?

> Whereas when we get back 0, we're told "no change" anyway, and hence
> checking isn't even needed. Did I misunderstand the purpose of the zero
> vs positive return value here?
> 
> Of could I could switch to using "rc >= 0" anyway; I actually had it that
> way first, but then decided the extra checks would be redundant in the 0
> case.
> 
> >> +        }
> >> +        else
> >> +            hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
> > 
> > If you avoid the HPET register update here you possibly need to make
> > sure that both fields are unconditionally written on the first call
> > after resume from suspension.  hpet_resume() needs to somehow taint
> > the channels to signal that a re-write of the address and data fields
> > is mandatory regardless of what iommu_update_ire_from_msi() has
> > returned.
> 
> hpet_broadcast_resume() calls __hpet_setup_msi_irq() (and hence
> hpet_msi_write()), which I thought is enough?

Oh, sorry, I was looking at hpet_resume(), not
hpet_broadcast_resume().

Thanks, Roger.

