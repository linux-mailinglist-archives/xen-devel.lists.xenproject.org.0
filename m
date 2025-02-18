Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E331FA398D6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 11:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891248.1300310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKqA-00026j-T6; Tue, 18 Feb 2025 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891248.1300310; Tue, 18 Feb 2025 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKqA-00024J-QH; Tue, 18 Feb 2025 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 891248;
 Tue, 18 Feb 2025 10:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xg25=VJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tkKq9-00024B-7m
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 10:28:33 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2409::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18bb78b0-ede3-11ef-9aa6-95dc52dad729;
 Tue, 18 Feb 2025 11:28:31 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 10:28:27 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 10:28:27 +0000
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
X-Inumbo-ID: 18bb78b0-ede3-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXXGIwREqLS7FLna6sOm1GjzqeczYh9GkqTqSGIPn0V1QgvLULPC36LLUxINncOepETR8niEhR81Pem6M1vtrIUDEo0yxOzm3PyEfamU4ltj3WMvmehEfskGOmmqsVt7XAfWaAYJkkDWHcHU+h7ZHT0kGdulRG7WjCZtvpVJbAtwCEsJ5KRrulcbwDxpYuJbuqgud77i/awNlATte8kGrzIMQU7MCXCAGyaLQI0DsJASv9OVAEwDlTpfHKFq+E7LN1gRcTSerkb6Pl/kt8IiuzGbJfAHYkMGNaPsLnzDRdYiTIdhMCiPJrcVybH3d1TvrxpA2k17ncdXAev33ss32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWpnHqNLCAkyKdQ7pU4e7uXMPbCjl+d+gKySt82IpX8=;
 b=gZyAD4FuK4RFHGznfdEdF40sQY6OaDeAbLuntT2r1YPBov0Izplrw5WqjNDuRLFM2fCJa4Lac9u7K27ne6aA7VzKrhkwfWyid1YqcaZZSYw65ANtAs3eCQ4RqE9QYv+ijxnXKmFK2MVgQNcnSbQiDbbUJMHjzadgIZWgJDw8JmjOzrqwmcaNzFXw6nINXOrHtmJnEmy921/CSu0iJGW3qyFL3bcI/qvUtjKCaV6MpI3mmJ78hovRLgXgdIWZSgUKo+x2Ixj1PtszfpTgfWzLjAojtBS9toqtphcgmLn54Bx2tmCrnwBodf+lWxZ0ccQEDVMDP78bcDivpt9DMDHtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWpnHqNLCAkyKdQ7pU4e7uXMPbCjl+d+gKySt82IpX8=;
 b=pty+oxbiub/I5S5Ypj3vs5HVoQq0W+CqEqf/iCOmyyd4biR3W3quSHjWjsI4x+gLSELeff/N2Vf9hLcFQN820d4/ZzrfAPH2LvIeGjsI7+pNNFmLUJMhvIRJm5+c77if61jIM8TcJ1RdExGVCwXFHA2bnnq0Kkd0muX/galkNok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7faca51c-27a3-492e-85fb-a6981978256a@amd.com>
Date: Tue, 18 Feb 2025 11:28:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250218095130.2666580-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: e03565c2-56b2-4c9f-9b4b-08dd5006fb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXpCeEJOdjRaeFRzbTlLRmxLYWVHdmNJalluaDNtYW8yejRSN2M4V0lnYkxU?=
 =?utf-8?B?b0JCZmppS29zOGxyK3hPZnpLMjNoUllLbVhKaXpCTkdGSis5V1BBd1dYQVVL?=
 =?utf-8?B?blNPVUg3TDBFdGpaOG85dGY1b2k5QkF0eG9mNVFDamNuOW02R1lxWkttb09U?=
 =?utf-8?B?QzZxcWNiTEp5ZitZMWN5WWVJd1J1UmxwZmV5MDVNRG13SDVtQllldzhpSnZs?=
 =?utf-8?B?Zy84OXE1Z2hvRmdZOWtUbEJOWm16WGZYYmlRUWJVdzFQSHlLTEhOczBqSUli?=
 =?utf-8?B?eG5JbUQ0dUh3WXlvaHVEdVZCT1FhVkcrdW5OZkN2aVN4S1llVWRXdURocHNp?=
 =?utf-8?B?d1oyNjJaTHhOajBob2pVSm9Qc3hjYTRSVERrdm1tTTkrdmdQQmZhOCtVWm53?=
 =?utf-8?B?SWZqa1hrUzhkeGdVUVZpMWcrUEthMWlMUW8xcVVadHQxT2Z3dUlLQ1Nrd2lZ?=
 =?utf-8?B?WjZ2MzJQUjFQU21Dakdxd3hsOTJiS1cxODNaTzJvTSs1OGJvTWFmUGlTUmhH?=
 =?utf-8?B?MzBxOWxPSTkwTytFbHljZjloZFl6ZUpNRW1jSUk4VHZwWmZxdXlpWVBvcnA0?=
 =?utf-8?B?TXVSMlkvc1JUQ0hMb2J2VGp4UUhMeTFSMVdaMndBdFBabytRa0c2TFhZYThM?=
 =?utf-8?B?V1NicDNqMUx3a0lKUWtDOGg4M3U1MUdqWjFsVGpoaElRMW9TQlpvVWpDeVl2?=
 =?utf-8?B?VWVjL2pVelYxaFd1QkpyNkRjMFVEQVRMRVlwQ2JCaS83MkxJb3lIUjVPaTEz?=
 =?utf-8?B?U3ZqMVhRakJaT1FGZjJObHZCSVdxOU9FaXpoOXVNWEtnTCtSSFBBeTI4SVZE?=
 =?utf-8?B?ZGMrN1BJUkROYVdpeXdRWllDODZHekdOcHRiQks1N3h0bmZNR2VSV3ZtR1g2?=
 =?utf-8?B?Ynd3QzFaUkxEZWN5ZG1tUXZCQ2ErZGlDeERsNFlselJHblFEQU1VdkRkMUVC?=
 =?utf-8?B?eEg3T2NvbFo2K2VKbVNtZWVjRnVzOTNYSXAyRlpaRlQ2RFA4cmtOODV6cXZK?=
 =?utf-8?B?ZkpBeWNLV25KbVBKZUxmZHVYQzZNdDgwL2xSQWphc2lYOUlqbkdZUmJXZCtp?=
 =?utf-8?B?dG1MR3VxTmIzQUZ4dHdwWU5seWEwYzRrUWlPMzdNTmZwSEVldEZFSm5MbmVI?=
 =?utf-8?B?N0JJWGdzc2t4QWJ0dm5vT0pZc0UwQjNsNG44U2tqWnh5WlpndXZidHI4S0R4?=
 =?utf-8?B?UFlDUm90UHZGcFhjNVp1UGU1SnByODdJeWEzU1loc0tlOXJHNkVIazlmd2U4?=
 =?utf-8?B?MTZja2x1NVh2UHZQcTlBL3d6ZGlhL2pkUTdVZ3UreTZEaEZYb2d0dTlHZkVj?=
 =?utf-8?B?eFdPMVJ2cGxTbW5BNkFmM0tBSmF0M0NDelE0eFd1cjVPOU81enpubDk1Nkgy?=
 =?utf-8?B?eXJuYTJQTllaWG8vTHZpOTNsSkY2cVFnaUlNUEhXOVh0WTlGWXpKakcvdTd2?=
 =?utf-8?B?VWptYkV5dTZmQnIxMitWUVVCZFZBV2JRZEROckpDSnd2V3lJbmMxSEI4OWEx?=
 =?utf-8?B?WXcyYWJGZFc2Zzliejl1M2VqMzRNa3dFVDgzRUR3T2FUNTZzRGNJQm9sMkdD?=
 =?utf-8?B?YlJWU1VUTy9RRExNSWlYRUpmVjN0U0lYclpmU3d0MjFET2hVdVZROGQwbTY5?=
 =?utf-8?B?cEJnR2NieE5FUm42M2VFRjJQNit6R3NSb1ljRUpHV0pMVmRKcXhCL1VhZ3da?=
 =?utf-8?B?M29BamNzTWozUGxxb0c0d2VuUWp1WVRGclFJcWd1QWNOY3ExMDRWNC9VRkVK?=
 =?utf-8?B?aGhyNnl0MEZrMWYwTll6YmMvR1d6MmRudjUwVlNGSWFib0o4dzhERFZLdW5M?=
 =?utf-8?B?d2VwZ1JFSVUwN2tQSldselZwQ3oxQmk0ZEloUFpZUFBZOVBkMWVxNEJ2RDBR?=
 =?utf-8?Q?yWZW3g4FS8ARi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak13bVMwZkNMREZ1a05WSEQ2a282Z21xK2ZqMmdIekZXM04relRtNkZ4MVF5?=
 =?utf-8?B?VmtVZkYwb0RNSithaUpzRmZDazhFRWtSVnN0QXB0WEFVOTZsSDdiM2J0UGh5?=
 =?utf-8?B?UjJ2alRPYlhSSE1PS1V2OWgvVWNkMFpwTW11Q1czNUNsN2lYcDFia3FpdCt2?=
 =?utf-8?B?UzZ6ajZtaEhwYmVmeUpyeHE2RU9oOXpYM0ltWXJVbTA2RzZWdTJqYlVHZUEw?=
 =?utf-8?B?V2NyTk92aGVYUXFIaVFDbWxFMkxpak5ROStlN3hqTm5SWDgxY0NFemIxZGRL?=
 =?utf-8?B?NTFJajltYmp1YzhOK1dGeGpNcVBDb21MOVRzdnJMNFlrVGkvWWozbkIrMGw5?=
 =?utf-8?B?ZjNJVWF1RFMwa0QxRTFYMGxFUXAzVk40MloxRUpiemwvbVNVZ3FLSzRFdXB4?=
 =?utf-8?B?YmpGQVJBZ2pBbEpFRGcwd3hkQVd6NlhFbHNNQmFqeWJ2UW01djlyL01XYzFw?=
 =?utf-8?B?RGZtczJ4WHNMTnFML0o0QlZjYTd4R0dMRUltcTQ2WFhJSHdoZjRCTFVQSVR2?=
 =?utf-8?B?UEszRFRIQ2VFS0hOR3RtcGd1dnVJbC96TUhKVEVSWDc1VVlMaHNQQW1CeXU4?=
 =?utf-8?B?dEFzMjZKRzRLRGlLZk81bStQZ09XK0NjaDR5OG43VjFXckU0Z3dCV1AwdTBC?=
 =?utf-8?B?bmpQQmxsK3gyVmw1SnRFa2VOYTFDNE8zRlBqTTh4em94ei9udHFJN3pTTWVT?=
 =?utf-8?B?aGt4K0pwQ3pBcGRMY0psNkJyMjY2by9WOGkrdis2Rlpad3FtdDltWno0b2ZE?=
 =?utf-8?B?YjNMc0pZaWs5U1U2YWxVekh4OE5oVWZsZVhkd1UzbWptSGE3Z2wwSE9PcHdJ?=
 =?utf-8?B?bGNqT3llMG8wNTZacmwwTExNZkxnUmZWTEdWTS9LaXh5MWNXYzBSanRMM0Z5?=
 =?utf-8?B?bFJRZUZLMzhkYjZTeDJYSXU0YzgvampJUWQrTUpHYVBGSThDQ1kzaEEwYWRp?=
 =?utf-8?B?bUFHam5QdHlxTFE4bkFibUNqNThxWnV4bXV5Yzd2c2lpVjZBK2NOd3NJRnFD?=
 =?utf-8?B?ZW9sQlRWc1JGOXdyTVFzdVJxWDMrcDlCL0tnSU9jK3gvdlo4eFNRTkt5eXVW?=
 =?utf-8?B?YmdzdWdDOGl0YXNuWFZwUWVjVXJpRkZRMnhSODdla3JJWUxuYys3VXhCQzNK?=
 =?utf-8?B?MWY1STY4dm9vYkVNU09sLzFMcFNDdm8zVDNkYW9sTE4vVHFWVkY0REREN01P?=
 =?utf-8?B?ZFZrSndtZEY0aElSU21NSndndmNPWVZNZG5yRFc0RWJRWkJicmJSYjhoemhD?=
 =?utf-8?B?US9CaVZDbE15OE5UNmtmbkpkOEdCS1NuTGdLOUxVM3ZVQjZNYVpSNDFCVk5i?=
 =?utf-8?B?QUlzbGYvbTNXK0k5VkhQd2dDK3RINjNuQ0N3QytJMkdway9tSFkvN1RxR1p2?=
 =?utf-8?B?NVVKdTlPTUhnVUNWem1ieUVFUVpCTTQ0SUlwYVZZRHZEei9uMGZHRkZrQ1A3?=
 =?utf-8?B?Mk81QjRlRkdvRldSeEtFSTNnSzdZdGpiTk9wSWhwSzBBbjlHQWN2Rk1MSUtH?=
 =?utf-8?B?amdFTkd6elVQRGFhUzQ2bmQ3M3pScWloVEhrL3J0ZElMVURjYmgvRXorWUxa?=
 =?utf-8?B?QnhPZUczWlFGbC9mbEpFc0FJdmdBVUJmaEtFNEdtdW40MmU4TFIzS3lEMkFr?=
 =?utf-8?B?RVdKVDFicC9Cek9vMVV3WWtKR0dXS0t6dlFLY21VU1JSUWc3Y28xL2xIZUZL?=
 =?utf-8?B?N3B1U1BiRUw3Q05wNW1MbXl6Vm5aU0k0Wnp1aUxENlFsY09hMjNuNnJQSWxN?=
 =?utf-8?B?aVBQRWxOMmphZTBtYkRBeVhaNGRtMjRTWExvZU5jN1FBN1dPZlN5OTlXa2l2?=
 =?utf-8?B?V01DY3hNdGRvdHJLWnRNNFIxMlo0Z0Rpa2R1NzZZQmNzcncwZ0gzSnl0SXlw?=
 =?utf-8?B?dVdYVExJTDYyWlBnNERPKzdnM0xQSkdUUGxob3hzY0dGR2JwR25XL0NDUGo3?=
 =?utf-8?B?NzhDdW9NQUQrNmJpSlpIRHk1TEc1QjlacjByQUpOT3VlQW1IdDc2R2lTZHpT?=
 =?utf-8?B?VzRRNXl3eFRnbVE1NnlvQUxSeFJrZWNFY0ovTWRiTlVoc3hJYURGOU9sd2RO?=
 =?utf-8?B?SW1KLzdJSytCRERQUVFUL1Q0aDI5a2pEbmVDRzVNRkc3Z2VrTEtnOVhReEFw?=
 =?utf-8?Q?iLUA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03565c2-56b2-4c9f-9b4b-08dd5006fb36
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:28:27.4140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TtLoZfsM6J+8Rb9AyhT5pg0Eo4FIA1fF6HHNSddU5mXnuOUmDPwkU3yPHfXdTMj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233



On 18/02/2025 10:51, Luca Fancellu wrote:
> 
> 
> LLC coloring can be used only on MMU system, move the code
> that selects it from ARM_64 to MMU and add the ARM_64
> dependency.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


