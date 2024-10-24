Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04F9ADE63
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 10:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824990.1239179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3soG-0000iH-J9; Thu, 24 Oct 2024 08:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824990.1239179; Thu, 24 Oct 2024 08:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3soG-0000fZ-FT; Thu, 24 Oct 2024 08:03:08 +0000
Received: by outflank-mailman (input) for mailman id 824990;
 Thu, 24 Oct 2024 08:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0ej=RU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t3soE-0000fT-Rv
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 08:03:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2418::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d73674-91de-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 10:03:04 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB7621.namprd12.prod.outlook.com (2603:10b6:8:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 08:03:00 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 08:03:00 +0000
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
X-Inumbo-ID: 64d73674-91de-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6bBl+RPe4g2HALkqnmUn9KH9fl5Om4pLJKC7vVKKYUOEdp0urN39eIdkAxvhij6pnpe62DF4Rpi2Lc+EGxTKbTbOxyxMVsf+ZxjzsbBLM/xXtRZUqonVz7vCqkpf3wB/mAQIbufe4bRLK4pLOAp/ZBuZC8g3Kmj9DU9q2t3YR11f/UQeH1D7nxsGvnXn2EutQCRTKbuRG5AcIKByCsyIQX47fCKz9AxSlLjb4uFQBpgTorgeea9uHtbkBsqKu3MekYamyJzSyirk0CiAUZf0h1WEBbTdutFwboAS2ek0vzssXzrt2BSIbAEUF1oAvNln4o+Tpr59uChwBPq8Mi/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37IvVf8TaXXmk8HFUT8C60fmf9SPECPq7fxHBgT1+5g=;
 b=MZ2ki5MmPRC1TeApRR9B8v8oxmhwvLagEZIdnpuAhYWojL6nDysT4zEv9YDBqIs9C8RBFA/NCPK2j2Vttz//zXDYp8NBGaOiUmXXX3n5zAKBNT2eEC2Xzb+Q8o6GQv8ifeM1rm6II7FdW0//z/yDtWnUkpfeJvK8AEYs0HMGlJVBmsbMAT/8kTVAFraudEcgxPCN1Id23ZPqT4Wt0vNqcBpXJD4GAN5cPuc1gSGy9QH0Xk5uxuSNq/MEuoYjTybiuDt2dm/eP7V3YsJhHd/2YpgWabmOIP8x4433Qgy51fpJZdkUrGdW5jK63MEZjIP6w8CIoR1dsxXg6lAkUFQefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37IvVf8TaXXmk8HFUT8C60fmf9SPECPq7fxHBgT1+5g=;
 b=KhgR3w4zvAsXBKilzUddFdDXLPYo5dw1TrQmhTmWW4qO8b7lPrjlr70IwCuhtyPlFLyC2yWIup11LCMQKtFIE2dlxiRK2ReYyYfXu5y5LvXolBnH2EbdwpEkfpGuPLm9hq1AvCMRcEkxKE/6aN5ofXq7ozXRHiFG4JIvfmui/pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6dad812c-b1dc-49e4-aa08-aac5647ca37d@amd.com>
Date: Thu, 24 Oct 2024 09:02:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
 <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
 <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
 <251fb5a2-a8d7-451b-9714-5cc984645354@xen.org>
 <acd45c52-7675-4dee-b8f8-46429cadf9ac@xen.org>
 <d70dae8e-5197-48db-859b-a3cae67e4ca7@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d70dae8e-5197-48db-859b-a3cae67e4ca7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0283.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::7) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9a7f39-3e94-4837-a9be-08dcf4024736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UE1DalQ2a3NxRWRPS3BkUTdkK1E5UVN0WFdvTkw1WDBIb25WbTE3N3RLNjNU?=
 =?utf-8?B?TFRLQWFDUmlzSXprN0w2c0NBWGRpMG1QbDlHSG9MaWFLYkpkTmhBSlZOakp6?=
 =?utf-8?B?SmlVWkFYdjlVR2V4N3E3VjhqcTcrelhUc2p4VSt0OUdlcHJ4eEJLbkplZlJT?=
 =?utf-8?B?WEUwdDlNb1VtNHJ6SDNMTHVJNDBKYzRFUXJTcUNiUkpRZlZLSGQ3N044bVk2?=
 =?utf-8?B?aXpsOFZXUzJtRXZMRHM4dTlXK3J0NVB5c0gzSUpFRTJJRVVtVTJ4TS91aEtq?=
 =?utf-8?B?YllmUEpSeStyK0hxMzEzY1lHZ295MnJRQnVhVDNLVGtXTzRTR0pHL2Vtalgw?=
 =?utf-8?B?TE5kaTlvNlRkdmNyMFNON3NrNkwwOGpISlIwaHhPbGtqbUZiS2FCdVAxQVgx?=
 =?utf-8?B?QzcyMzZHZmg3UEZBN2NtUTg5clNoT2FoejdPY1JhY0ZHV29pMEoxeXdzdUl6?=
 =?utf-8?B?cUkyQk4wK0JETnhuVEJSRWFjVlY4VWprUnlxaW9xMXEzR3N0V2lUeXd4akRJ?=
 =?utf-8?B?bndzTjRTZzBDbG1BSEhHRUlINUNIbXhuWjdUK3NWWDl4eXB2U2RDdVlXanpF?=
 =?utf-8?B?M1Y2YUtscXZzbGc3RVVFM0hHYXZ0L3dOcWZYRjZHV2lsbGNmbjQrWStHTFJM?=
 =?utf-8?B?ak12QXdCenJQRC9yUnl2RlNtc2JsMUxBMWQzZnRIWjlrbEZITHVoYTNRRzdY?=
 =?utf-8?B?Q0xzakptb042cXYxeXM4QXVXdFRrS1RyYnVOV2pGVVhRRUsyNXM1YW5obHUx?=
 =?utf-8?B?d25RamVSSXBVeTBQRnRqOHYrWXdraWJRbzUraWJ4dnJibG0yWVY5Z2tFNzQ0?=
 =?utf-8?B?b2pnODQrRnVFelpEUkx6TXdxMTZFanBpZGlXWVB6MG44Q3NZODYwME5haGEw?=
 =?utf-8?B?WkN0blZWMjljTS9tNjAvMllUREZxaklvaWhIQVpnNmtERW4xQjdobkNmaTZv?=
 =?utf-8?B?S3NCU3d1NU5oRHlHOFd1NGVQcm9hWi9NdFRuV2JiRWdqaXJWVzdpUng3L2Ri?=
 =?utf-8?B?dm1KMmVoZ3NSS1plNHpVSXQvY0NqZnJVb0pyWlN0WVRMc1E4MEQzc2NCWXc0?=
 =?utf-8?B?L3ZvbXJPeUtxQzNrcjNjQktHT0lwdGVjdUZyNktremZPMld0bUVvSFhMWmVG?=
 =?utf-8?B?Rm4yOEhlMm9CSnlETUQzUGdJaDdWWVA3RnNjem1OQWdLZUhXbXVXRGJ3V3ZI?=
 =?utf-8?B?V0tvaDhOdlM3SE9DRUhCeWo4WUh3eW5VMzYyMW92VVdTWXpETzRESzN2ZFc3?=
 =?utf-8?B?QkFRVE05MHRsN2VibzJrNjIyQzg3M3EySE9VMzhSQ3B3T0pCdGQxZlorQ0tE?=
 =?utf-8?B?Y2ROb01CbHpBTXEyaktEUTRSVDhOMWUzUHA0bnEzZCtUVnNXUm5GUWhYRm1o?=
 =?utf-8?B?R25wcEU5VDB6N2h2L0dYSlFQWmkzTXB2UENlVkNCU2x6cXU3WSs1WnVsaTlu?=
 =?utf-8?B?U1FtNFZIc256Z2VRTS84Tk83N3FuNmhGMWVxM29Hd1hlaDlJTlR3ZjRiYU1L?=
 =?utf-8?B?WFVaRjdITEZhcmJqZ2lUVVBZMDZUT3QyTTdhYUZqM21GZ1dqcDRZSUZwUUVP?=
 =?utf-8?B?a3ZvVHIra0krRXNNMUlEWTVFRjRYSCtaN1FPbW5JenhYd2ZuNHdJUjVrRGpY?=
 =?utf-8?B?TWhGZ0MrSWVaQy9hc0pQdk54TWE2UVBnWXpHeHFiUzZ2MWFCKzJVWU1hWWlE?=
 =?utf-8?Q?oDNVUhsqLyVsxKeZFtJI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkl0b1RET2w2eE5NQVRGNjFPcEphRUpLRFBZclBxcXFiL3FsWkVVWWFHL3BZ?=
 =?utf-8?B?ZnZJSFBDQVplbFlXNUw5Zk5VYS9SNm5FU2lyMG1zOFJnb0hYWjA5alIwa1lC?=
 =?utf-8?B?eG9Wak5OazJlZjdTVDBVdHVVRkdWM1VWVHlsRU9TTkFwUzNxYkYrNEllWG5K?=
 =?utf-8?B?UHh3dHBha1hzNUJibGFmQTJlWHZUZm9qUDQxaXNEQ3hUZ1VGNG9idjl6M1ZV?=
 =?utf-8?B?VVNWd0VZaW1acWIwZ2V4TG1CVXNDSnhEUDBJd0JWcW5xZGg4N2I1Rmg4eTJO?=
 =?utf-8?B?NGlLY2dSamlDMFZOYTdjZkxFZm1JRzFjOGswQ0xYMmI0U0tKY1J5bzBNNUZq?=
 =?utf-8?B?dnNMaWJQWDkvTmttdmtpakJDaE16RU5UMzFZbUUvSmUxVFpNVGFqOHo3a2w1?=
 =?utf-8?B?cVFBZElZeGZxT0JHMmw5ejI0eXpxV3JtelU5TWhXSXByWTFmRWI4UEc3S0w3?=
 =?utf-8?B?NzY5akdndVd0MHFUSkZ6aTc3QWpUSXd3S1ZTK0NmTEJ0dnFjSWh3aVY0cFJD?=
 =?utf-8?B?ZXgrMGpEdHV2OWpIMWNLWS96c0NCbnRTU2FxancwUHhuWW1Ud1JkL2ZqQXlB?=
 =?utf-8?B?WW03UG5KaUo5bXl1djM4cTFxQ1E5a1l5UnVQNzNnc0VKb1l6QlR6ZXFFRW5R?=
 =?utf-8?B?aXdoZ05GZzVCR1NOY1VndzRqeWtrbDFxL2NIQTlLbGJSbEUzVTREeS8wWmh4?=
 =?utf-8?B?TTV0YlA3d0gvTzVsTlZ2WjlUK29YOE9QQnNYRHMrMHd0WWQzZHlRdGtWN2Ew?=
 =?utf-8?B?WHRkUm1FTURiR3g5TkUvRHJWNU9QWENXeXR3WDVZU3l5ck50ak0vME05UW1F?=
 =?utf-8?B?ajNTcjh6VEwyMlNUdmRxVmZReHZNc3BKUW01YWpyVTRFaWttVWJYZHBKVkxp?=
 =?utf-8?B?eU9ISjhyTHdpUTlpRHFucG9rNTlZZXpKMXVlVUVqVzBobk5KSWdaRW85N0Ro?=
 =?utf-8?B?TTY3TFdJZEtiVHV0bk5PaVdoakxRcHREYnAzSnU1aGV0QVdEc2phUTJTYmtX?=
 =?utf-8?B?WU5NR3cyTlorVGk5cVlKY2dtNnZjUWRic3ZvMWliNzZUWk1hdXNRNXUxWmpZ?=
 =?utf-8?B?NldMaVpacnUyYTNKK2U4NlVPTVRhcnMyOEpTbWF3bnhOMzF5eVEvYjYwMGlB?=
 =?utf-8?B?WWxhaDFmUnRFdWtKSWZvVFFtR1NoR0svL1N3eVN3K1g5RWtPVzRYM29oY2pH?=
 =?utf-8?B?UlloRmxnWUZ3UVNTMEErV0xXaHRBNko2MXRaeGZGTy82SFhteENOMktGYWxj?=
 =?utf-8?B?SkhWckV5RzM2R0szeWtGRm5nU2dDWVF5Q0RvT2dFNHROOTl3QkhyRXRxaExR?=
 =?utf-8?B?R240dDdJOFBpWTJqWVhxdWtzOVFXaWpxOUovZGZtbUtuQ0llc25RSFJIeGpO?=
 =?utf-8?B?Y2t0eHBCVk45alFGQUI1RzA1aGd4cit5Y1RwenpIb0Z0Q0tPT2huR1V2K1Nw?=
 =?utf-8?B?V1JyWjBlTjBEM0x4V0d3Rnd0eVRJMzBRUkN4VjRyODlPSHpXdS9FN0VGQzM2?=
 =?utf-8?B?K1BrSlJKcU1RNE1FejZYQURtY29tQWszVUp1SEZGdElCY1RiOGc0Vk94bUZo?=
 =?utf-8?B?UEZlMTMwSzB4L2RrTndrL0ovLzNyNC9wRUsySDBENXgrV0ExQWJINVhsSU9s?=
 =?utf-8?B?Vk9nYVZTOXlsSFZudmgwdVQ0ams4ZG56aVdhSFd6VkRiNTZsVDZ3elMrNmRl?=
 =?utf-8?B?NStiUVRUdzBzM2dlcmtrVXROQmN1WWpvSTZGb04yU0xqK0gyQkwxeXAwWkdX?=
 =?utf-8?B?V2ZXYXpIbGRTeXZaTmZGdStLU203aVV3amtWd2NPdVY1R21ORks2R0tDQ2sv?=
 =?utf-8?B?QWNaa1BYdFpFSFhwZGVVTEt1N3ZRZ2ZYdzhnOWEwM1huSmVidHRNTWkrRkJV?=
 =?utf-8?B?bitGNUVhbEExN3phTmh3S0V0MndjMXNKT0R5WTRETWhZNnBtQjEwUHNxNWdW?=
 =?utf-8?B?Yk9PTEhmTzFlcm5yWWRvLzNkMGZLRkhIb1lhSnVGSEdIS3NOOFhzaVdKdEhL?=
 =?utf-8?B?Zk5jQkhPdlVYVWlUOWN4bkNNU2NMSWZxNXA1bmNvZVA4b2FxdEN4U0hhMkd0?=
 =?utf-8?B?bWFBN05iZWZ1d1htRjcyRytYM0VodERNVGlVb2hRdStUd1VaVzVURURyR2hl?=
 =?utf-8?Q?LE9GvdUaUOsgKMVMhcmDstIou?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9a7f39-3e94-4837-a9be-08dcf4024736
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 08:03:00.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5RDWrDddKdIUwrfs/MkV/n4aGjVw/cgSjwd/YcMrbSc+Xc61MvyV6HUJF+rP1+7IXxqK3z8KV1QHUt+40HjAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7621

Hi Julien,

On 23/10/2024 17:30, Julien Grall wrote:
>
>
> On 23/10/2024 17:18, Julien Grall wrote:
>>
>>
>> On 23/10/2024 17:13, Julien Grall wrote:
>>>
>>>
>>> On 23/10/2024 17:06, Ayan Kumar Halder wrote:
>>>> Hi Luca/Julien,
>>>>
>>>> On 22/10/2024 17:31, Luca Fancellu wrote:
>>>>> Hi Julien,
>>>>>
>>>>>> On 22 Oct 2024, at 14:13, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 22/10/2024 10:56, Luca Fancellu wrote:
>>>>>>>> On 22 Oct 2024, at 10:47, Julien Grall <julien@xen.org> wrote:
>>>>>>>>
>>>>>>>> Hi Luca,
>>>>>>>>
>>>>>>>> On 22/10/2024 10:41, Luca Fancellu wrote:
>>>>>>>>>> On 21 Oct 2024, at 17:27, Julien Grall <julien@xen.org> wrote:
>>>>>>>>> 2) dsb+isb barrier after enabling the MPU, since we are 
>>>>>>>>> enabling the MPU but also because we are disabling the 
>>>>>>>>> background region
>>>>>>>> TBH, I don't understand this one. Why would disabling the 
>>>>>>>> background region requires a dsb + isb? Do you have any pointer 
>>>>>>>> in the Armv8-R specification?
>>>>>>> I’m afraid this is only my deduction, Section C1.4 of the Arm® 
>>>>>>> Architecture Reference Manual Supplement Armv8, for R-profile 
>>>>>>> AArch64 architecture,
>>>>>>> (DDI 0600B.a) explains what is the background region, it says it 
>>>>>>> implements physical address range(s), so when we disable it, we 
>>>>>>> would like any data
>>>>>>> access to complete before changing this implementation defined 
>>>>>>> range with the ranges defined by us tweaking PRBAR/PRLAR, am I 
>>>>>>> right?
>>>>>> My mental model for the ordering is similar to a TLB flush which is:
>>>>>>    1/ dsb nsh
>>>>>>    2/ tlbi
>>>>>>    3/ dsb nsh
>>>>>>    4/ isb
>>>>>>
>>>>>> Enabling the MPU is effectively 2. AFAIK, 1 is only necessary to 
>>>>>> ensure the update to the page-tables. But it is not a requirement 
>>>>>> to ensure any data access are completed (otherwise, we would have 
>>>>>> needed a dsb sy because we don't know how far the access are 
>>>>>> going...).
>>>>> Uhm… I’m not sure we are on the same page, probably I explained 
>>>>> that wrongly, so my point is that:
>>>>>
>>>>> FUNC_LOCAL(enable_mpu)
>>>>>      mrs   x0, SCTLR_EL2
>>>>>      bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background 
>>>>> region */
>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>>>>      dsb   sy
>>>>>      ^— This data barrier is needed in order to complete any data 
>>>>> access, which guarantees that all explicit memory accesses before
>>>>>             this instruction complete, so we can safely turn ON 
>>>>> the MPU and disable the background region.
>>>
>>> I think
>>
>> Sorry I fat fingered and pressed send too early. I think this is the 
>> part I disagree with. All explicit accesses don't need to be complete 
>> (in the sense observed by everyone in the system). They only need to 
>> have gone through the permissions check.
>
> I think I managed to find again the wording that would justify why a 
> "dsb" is not necessary for the permission checks. From ARM DDI 0487K.a 
> D23-7349:
>
> ```
> Direct writes using the instructions in Table D22-2 require 
> synchronization before software can rely on the effects
> of changes to the System registers to affect instructions appearing in 
> program order after the direct write to the
> System register. Direct writes to these registers are not allowed to 
> affect any instructions appearing in program order
> before the direct write.
> ```
>
> I understand the paragraph as enabling the MPU via SCTLR_EL2 will not 
> affect any instruction before hand.

Yes, I agree.

However, as the line states

"Direct writes using the instructions in Table D22-2 require 
synchronization before software can rely on the effects"

This means synchronization is required after the write to SCTLR_EL2.

However, this synchronization seems to imply dsb sy + isb.

FromARM DDI 0487K.a ID032224 B2-274

"A DSB instruction ordered after a direct write to a System PMU register 
does not complete until all observers observe the direct write"

So, a write to SCTLR_EL2 needs to be followed by a dsb to ensure the 
write is observed on all the processors (as SCTLR_EL2 and PMU registers 
belong to Table D22-2, so the behavior should be same).

And then it needs to be followed by an ISB to ensure any instruction 
fetch observes that MPU is enabled.

So the code needs to be

FUNC_LOCAL(enable_mpu)
     mrs   x0, SCTLR_EL2
     bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
     orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
     orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
     orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
     msr   SCTLR_EL2, x0
     dsb   sy			      /* ensure the writes to SCTLR_EL2 are observed on all the processors */
     isb                               /* any instruction fetch observes that MPU is enabled. So force flush the pre-existing instruction pipeline */

     ret
END(enable_mpu)

This will be similar to what Zephyr  does 
https://github.com/zephyrproject-rtos/zephyr/blob/a30270668d4b90bac932794ef75df12a2b6f6f78/arch/arm/core/mpu/arm_mpu.c#L258 
.

Let me know if you are ok with the rationale.

Also, I would prefer to have 3 orr instructions instead of one for the 
sake of readability. However, this is not a strong preference so if you 
feel otherwise, I can change to have a single orr instruction.

- Ayan


