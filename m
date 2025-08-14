Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A494B25D81
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080934.1441098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSTp-0002ck-Gj; Thu, 14 Aug 2025 07:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080934.1441098; Thu, 14 Aug 2025 07:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSTp-0002bL-Dk; Thu, 14 Aug 2025 07:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1080934;
 Thu, 14 Aug 2025 07:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ppuf=22=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1umSTn-0002bE-QX
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:34:32 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:240a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c2a736c-78e1-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 09:34:29 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 07:34:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 07:34:25 +0000
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
X-Inumbo-ID: 1c2a736c-78e1-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqScEeAUpVm3+iVGP1r78VM1AZ3yAgzprTE9khwY+rM4LfyPFW5svpnuTZCnnIjMNu4A0TSwPMBI+eQ3jcATeQTjtAuvhHYBbMH5nvlrxmeHV5XO0vbDYi/fayieN0XKLCZD6UZkwA3SJ/WGSWFScK1oxts5pEU1YtbCNdi0oeWKUbZ6zCq7p9s2z9BNT/lfqldJQ8K5eXsPe4rbGrbcOUDvyp3Xnh72OP5O2gUjq41b2QFAAi60EDmHHgnYxNb2sKq348M+ReiPfFH7n8bCjWR8jzfbLxdMvxG5ajoOkB4TSL6Z2xlvpduu8oSolQXYLaxI4ZFvJdlAmet66zSzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opEG/b95Dx49/uLGBUnqMVxA1WeEidt3Xws0ZLRxJrM=;
 b=vmAUaXr4S+2fUU5Z3EEU6qLDWVIpxgrR6OEzjTZehMKyNqMKt128zffWb7BlKCMB3MsGXvqeWiOr7HHS2HSz4qkoYaiONZiOpeYH7bHVNSne81i5i3p0w5wXykq8R6b7TDp6OPYR18k4xgryzmU2Ar4qVthq19YFZD0X5OS4m6rrEnOgsvy1ANfg+6QoXJyycc5tjb1FAeg7FZ/Ccru4Cf/XFrqvgTD3epKSjYGveaW9tka/wKiYQfciwQQn17NJ6NdDGkbqplFhOEYtLmer69lX46588HpR/yvO2W3dReRB9Bv36LQNKo9YbsQ5C+6QGsAL2x4eb7u4zzr/OEzBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opEG/b95Dx49/uLGBUnqMVxA1WeEidt3Xws0ZLRxJrM=;
 b=PytSXnBKjDdI+a3frXvTDnLxkJb0EzVNHHdXy23vErnvzuU1Nep++dCr6IaYMwlD+c2fbMlntknweR1CqlA71Zbl2Lo2YeIXIZuKsBbxBnHvDyvF9nAPsmU3ZFO/4AJXZw3HKmQrAHHN7zsjisKIG4JLEN1z+H7wQ5QfUtcm7Qw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHb8hcuzjUv9QY8PkCazI2v8DQHmbRBbryAgCA3tFCAAEHpAIAADdDQ
Date: Thu, 14 Aug 2025 07:34:25 +0000
Message-ID:
 <DM4PR12MB8451D475AED43F9884C83D53E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-20-Penny.Zheng@amd.com>
 <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
 <DM4PR12MB845131A7E81BD54B0334E3B2E135A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <98aa5a7b-5268-41ae-a1d5-25028b0704b6@suse.com>
In-Reply-To: <98aa5a7b-5268-41ae-a1d5-25028b0704b6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-14T07:34:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH8PR12MB6937:EE_
x-ms-office365-filtering-correlation-id: 96e4efe1-c62e-4c71-4f82-08dddb04fe9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RmYzbjMyamFzZEhSbHYvU2Yvd1p5dGJmUVlUSHRkUGRib0JjSmFVUE1lemM0?=
 =?utf-8?B?bk5ITWVRYjFCdFc0UHk3RjFuY1gwZTZ1WXZ1cXVrdVVQNGRlN1FSdmpZL3BK?=
 =?utf-8?B?QUpTM2Q0aTV4RVRvSGo3eFpnNldVOHFMM0o2V2hBQWVxaUo3Z0xORUZqMnhr?=
 =?utf-8?B?bnJIRUw0Y0hpMUtwQUFxZGxtMkZhcTRLYTlJaGQ2WWhNTVBWeHYwZWhpUlhQ?=
 =?utf-8?B?dGQrS20xQmM4MGUwdThmNllPVVdjRUhVVHlZbis3VHJpYlEzS1pERmNHbFZ4?=
 =?utf-8?B?b0w5Z09RUjJCNHJkeG81NHFxalQ3Y1BJVnhFekd6dm4yQVc1NzFwQ0lVUUM3?=
 =?utf-8?B?WFF3VTBNbGpReXJueWhTcFBTdWkwQjVubkZzZEhMb09IdjI1eStGZnhITkxW?=
 =?utf-8?B?TXBFbjRQYjRSWlc0YzdSWnBqdjhVQ25iblBRT1B1eEc4ZjBPamlNTFJVSHdy?=
 =?utf-8?B?b2hTL1FlRTlvSG52bldUaWRLVXN2L0FVNGM5cGNKTnRhQ2FyU2pyTXZGNURy?=
 =?utf-8?B?NWZOZDAxRTRiRTN1UjhuMjRVcC9NMEtTcU4xRmJhdE91MnZBMEVENzF6YkFh?=
 =?utf-8?B?NGFjVURIYXMrTUlZTDBNQTBrOUFERGU1c1RjQVlYUmt6R3VGeGRLellaSkVx?=
 =?utf-8?B?S1pud0pROEdvN25waHBjSjBRZjVQWnNHbkdmWXpXSjUwSzRlcVZWZlZrUkJa?=
 =?utf-8?B?Z3Nxd0RjcUhjcFoyNDQ2cjlaU2puVEl4dGJWY2JIa2dIOEsxQ3BzanBWeUVv?=
 =?utf-8?B?eDFsLzE3VnJXbXJnamNFQ2xkQWVPTDVDVGRrazNsU3hnbURJbFRacnl4Z05Y?=
 =?utf-8?B?VE5YaC9keDVqTWQvM1lIeEh5KzZsZmNKaUtTbVRkd2x1OHBXdjhod29GbWxv?=
 =?utf-8?B?dGFhMDcyQ0w1dHg3aEtHc1FKOUdGWmNlMGRRdERnRVB2MEF2NVFWcjFPdkVP?=
 =?utf-8?B?QWM2NTZCTkxhZFpBSml4Yk9uRmtubGJvWWxFdFdweVZIZW0zT3FwNEl2S3o5?=
 =?utf-8?B?bU9VSlBXRjh4V1phbTBOV2svcVNUcVpPSER2ZEloaExFVFFWcTJBMDQrV0Fh?=
 =?utf-8?B?VnpacG9Za2NmNHVod0hpVmlwSnVwZ2JPQmg4dFRyZkdrY0pLN0NwTjgvSFRw?=
 =?utf-8?B?TlRoTDlIS24vOEoyVVRuSmJOemhucTN0MzZpdlJWNFk1K3YxNkYxZkJBbC9I?=
 =?utf-8?B?eHBuUVNRdlhrUEhMeHZEaEtlamRtQ0htYTJZdmRxMjVNS25sbGlCOWdyVndE?=
 =?utf-8?B?RE9NOFFJMFdkOW0yMW56TE52dFpRRUJqY2ZpTVVpZGFIQ2tFMHF0U2NwOEVr?=
 =?utf-8?B?WGwwY0tpd1FkSDBLeWFVYUdZdElIbmQ3N01EWXhxRHBXaDJqaG8vN3A5aC9G?=
 =?utf-8?B?UldFTGhWNDNwc1A4WWM3MXEveFNNZno5cmVVU0N1V3oxUG9layttemhGOGp4?=
 =?utf-8?B?SEoyVzZsazVpMHJoVUVxWThiWDBLL2VSem9DQ2hWNWw3UTBrNTY4aTBxajdj?=
 =?utf-8?B?N3ZtYm5VUTZheVJ0dXF3c1N6b0ZFc0J2ZTkrWHFTRmdBeGl3NC9NdFQzNWlJ?=
 =?utf-8?B?MWRSaDRsUlhEQ1E3Z24xeU5nOVdvNUVtcER3ZUlHS1ludEo2cE5uTWZsNTVD?=
 =?utf-8?B?bTljd296RUZLbjdNQWJScVF3Q1dOWUxKQzJnMEJGQ1Y3VDN5SGpJTS9XM2hI?=
 =?utf-8?B?M2w4eUFjdlRuUzNrSVJUZWM4RGpiNGtENXFXWVduZ3J1ZVpHZFFTUGxNSUo5?=
 =?utf-8?B?NlYzNUJ6NHEzV2VmRGJkUDFyMnllMzNoM2Q2ZmxkRHFYOUpDdHB4T3IyREJs?=
 =?utf-8?B?T3RvY1VqYmpGV1M1VnBmUGE3aElMS0dzdU1mdFVYSEZNcDZkVGNvZnIwZjlw?=
 =?utf-8?B?NUZnUkdSamxmb1VENXUzRU9BbG9NcHZYWnZWdk5hZGg0eVdWRnB4QlRyMTRy?=
 =?utf-8?B?YlR0UmxBT2JrN3VkVnlwMVFWYlI1WGJLSkdmOFZTQ0Y2a1BkNXo3cHlaUUhv?=
 =?utf-8?Q?TNBQsBYVxIo7fp3+CpVRyubMA4IQzQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmtXZXBYWnk2N080WnV0VlBleG5ZZkNSandqM1F4VnhTZGt4Sy85dmUzVzVh?=
 =?utf-8?B?U0xodWx5MGxmU0ZVOFNwbUx4Yk5rNmtSSWZ5Q2RQNTNxM1BUS0QzbW5MSnpu?=
 =?utf-8?B?VWV4cEs4akZLTWNIRWhMUkpHQVZ3UHBJTGh6K3ZBRGxHNTAxcEJBc3pxUURj?=
 =?utf-8?B?VGRJK0lEY0NKRk85OFhBTE9SdVQwL3g1WUhmSnEraEcwRlczNkl2Vk1hdzZ6?=
 =?utf-8?B?MDhVdkphZ0FzbVcyb3J2bmlXU0FBY3E0ZjJwd0lSZytleDZqSzUyR2EyZElS?=
 =?utf-8?B?SEh2bnd2YmpISkIvT09JS2psQ1A3blRVcFFpUUtPek96ZXBPZngxYzBUbFFW?=
 =?utf-8?B?TmVyaGhITCt1UEw0ZlUrRVpEYWhMYlpWZWZnc2gyTWxCZW9IYkVyRVRPSFZz?=
 =?utf-8?B?RVVmVWFjRnlLTFVKVHNEVTFEbnlJenFGUkZLN2tNNFNFNjBqYmVXbkE3c3Zn?=
 =?utf-8?B?RlVWaGFnWThmWDRlYjFSa2FyUVhqeXdPcENqenYxa1dPWUF6UGkzblJOT2ht?=
 =?utf-8?B?OTh0TzdBTW1RbG93RUFoYUM0WmhUZ3VLZU1OVWRWQ0paZFhyR3VLQWZoOHRJ?=
 =?utf-8?B?d1BQc0U5SCtGQ0V0MzhpUVUxRWRqSmpLZFBRTTRxcWdEV2YvczFmWWZMRWFm?=
 =?utf-8?B?L2dYUEZSMXZpQWNsQ0J0cXlqR1lhbm13RmxrT2pMWW55T01NSWd5T3pTcmtw?=
 =?utf-8?B?NDNmT3hMQ29CYUZWWWIzRk44dlczSlJLTnpxWSs4SEN4OUNyNlpqY21wRWZO?=
 =?utf-8?B?NUtDSXF1RnRjR281OENuQWZNSFAwWjU5UzFUeWhYTlZuODdYL2hVZVp4d1gx?=
 =?utf-8?B?WFBDcCtxdnVtSEo5aUd3NWNoYUtpbFp2NTdqak1qRVpEZ0lhZ0R1RWhtQkdE?=
 =?utf-8?B?Sy9IOEJsZHVoOFFrMENJZ01RTFdyVjVTVUIrazZBZmlCZzFSWmUxNDRXTkRk?=
 =?utf-8?B?WDFzdFRRRmtpblI5c1o5WDZwUlByUlQyL3d6d01pS29ZRGNidnkzeUV6RVZE?=
 =?utf-8?B?dGcreUQ0WFd2WmxpaGhGamlLd0NXUUN1cFJ5clg4VVJFS0taT3V5Yjl5aU8r?=
 =?utf-8?B?bG1sQkV5VkQyODR5VDRxZ0F0Vk9TTmk0TzVXUDZIcmlOcUc5QmtCMDBoYnpy?=
 =?utf-8?B?NzZRY3JzV3JlMitDU1ZvcXNzSEw3RXZtb2R6Ny9QMkw5R1Q0dU1RZk9UUmxL?=
 =?utf-8?B?THdrYkJzRGJUcWxldlNyM24vVm9FbXpIMXJtazFDYlk3cmZiZ0hpSXovbGhp?=
 =?utf-8?B?MENiMC85NzJsbUdvWVBNTUlKNkFDWTFXd3VTVWNIVnhsOWFpTDh3QVR6ZXJ0?=
 =?utf-8?B?N2J1UlVvUVR5RWlPMTVETHMybWEyeUdKNHZ5YndjNkFpZHNjcVlnTmovZXRI?=
 =?utf-8?B?TGwzSHB0NEppbHM1Nm1MNitaVmo5ODBFVStna2xNcTJKejBzWld2SW5wdUtB?=
 =?utf-8?B?QnhyMXh6SGpBdjNzS3U1VzkrVy9semViNW9kSXJwcDEyZk1VWkhRakJ4eGI3?=
 =?utf-8?B?NnMrUEJQMkdlSWtrcnF0YWZaR3E4RitwY09YSk1nYmduQkJFbG5KNllhOEls?=
 =?utf-8?B?ZXBEKzdOR1JwVU82NllmUVJBK2oyMjQyZHh6enVOemZJeVZZMEhFZWlnOER3?=
 =?utf-8?B?M1ltRUd4cWdHejMvNmNYU3BaZVBjdVJ1ZFJ0Y2JUamtZQ3lZWFhBK2ROUGFw?=
 =?utf-8?B?Vm9DcmpnTlNtMS9hbk0zd2t5djZhb2I3QTc2czBHc21JWUsrWnZPMEViNE84?=
 =?utf-8?B?RFN1c2l0OHBwNFBDeC94eStxZ05jN0UvSzUrdGJ3MENMZ3oyU3VZUnZLSmhl?=
 =?utf-8?B?VVByQlJNUDVsYmRrOUxBTHJVUzNKMytaODNlRlZGTFVTeGVqY01zZy8xcitW?=
 =?utf-8?B?SENDZngxNW91YUVqaHkvVW9EdjQ2OUdObG1TbjJZMXZxdyt6R2FNbVp5N21I?=
 =?utf-8?B?L0libzlzRnpLMEs5U0UxMktJZDZqTEY0WWFKUTAwRnZlWlhhNGx6OVB5VHow?=
 =?utf-8?B?aUVYMldvVm5hM0hxT2tKaUdaRUhaM09HcDlWZExRbHdGVHkxUkVva2cxc2Zn?=
 =?utf-8?B?MVdYWEtTYWdsbWxEUjUwOUkraUx6b3YvdG9iNXhFUTVDY255d2t6eTlzWVRk?=
 =?utf-8?Q?zzoo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e4efe1-c62e-4c71-4f82-08dddb04fe9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 07:34:25.3923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0DlGNUcWHNPpXhypaBmDSCg9BDvL+LIC4fhm9D5ozDcyIoHcgP7baqJ81UxGA2hQefzrtBzYMDXT1gb0W+GDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIw
MjUgMjo0MCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NiAxOS8xOV0geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhl
bl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAxNC4wOC4yMDI1IDA1
OjEzLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDI0LCAyMDI1IDEwOjQ0IFBNDQo+ID4+
IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4+IENjOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+ID4+IDxhbnRob255LnBl
cmFyZEB2YXRlcy50ZWNoPjsgQW5kcmV3IENvb3Blcg0KPiA+PiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gPj4gSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4gPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4gPj4geGVuLSBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDE5LzE5XSB4ZW4vY3B1ZnJlcTogQWRhcHQNCj4gU0VUL0dFVF9DUFVG
UkVRX0NQUEMNCj4gPj4geGVuX3N5c2N0bF9wbV9vcCBmb3IgYW1kLWNwcGMgZHJpdmVyDQo+ID4+
DQo+ID4+IE9uIDExLjA3LjIwMjUgMDU6NTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gSW50
cm9kdWNlIGhlbHBlciBzZXRfYW1kX2NwcGNfcGFyYSgpIGFuZCBnZXRfYW1kX2NwcGNfcGFyYSgp
IHRvDQo+ID4+PiBTRVQvR0VUIENQUEMtcmVsYXRlZCBwYXJhIGZvciBhbWQtY3BwYy9hbWQtY3Bw
Yy1lcHAgZHJpdmVyLg0KPiA+Pj4NCj4gPj4+IEluIGdldF9jcHVmcmVxX2NwcGMoKS9zZXRfY3B1
ZnJlcV9jcHBjKCksIHdlIGluY2x1ZGUNCj4gPj4+ICJwcm9jZXNzb3JfcG1pbmZvW2NwdWlkXS0+
aW5pdCAmIFhFTl9DUFBDX0lOSVQiIGNvbmRpdGlvbiBjaGVjayB0bw0KPiA+Pj4gZGVhbCB3aXRo
IGNwdWZyZXEgZHJpdmVyIGluIGFtZC1jcHBjLg0KPiA+Pj4NCj4gPj4+IEFsc28sIGEgbmV3IGZp
ZWxkICJwb2xpY3kiIGhhcyBhbHNvIGJlZW4gYWRkZWQgaW4gInN0cnVjdCB4ZW5fZ2V0X2NwcGNf
cGFyYSINCj4gPj4+IHRvIGRlc2NyaWJlIHBlcmZvcm1hbmNlIHBvbGljeSBpbiBhY3RpdmUgbW9k
ZS4gSXQgZ2V0cyBwcmludGVkIHdpdGgNCj4gPj4+IG90aGVyIGNwcGMgcGFyYXMuIE1vdmUgbWFu
aWZlc3QgY29uc3RhbnRzICJYRU5fQ1BVRlJFUV9QT0xJQ1lfeHh4Ig0KPiA+Pj4gdG8gcHVibGlj
IGhlYWRlciB0byBsZXQgaXQgYmUgdXNlZCBpbiB1c2VyIHNwYWNlIHRvb2xzLiBBbHNvIGFkZCBh
DQo+ID4+PiBuZXcgYW5jaG9yICJYRU5fQ1BVRlJFUV9QT0xJQ1lfeHh4IiBmb3IgYXJyYXkgb3Zl
cnJ1biBjaGVjay4NCj4gPj4NCj4gPj4gSWYgb25seSB0aGV5IGluZGVlZCBoYWQgWEVOXyBwcmVm
aXhlcy4NCj4gPj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVu
Z0BhbWQuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiB2MSAtPiB2MjoNCj4gPj4+IC0gR2l2ZSB0aGUg
dmFyaWFibGUgZGVzX3BlcmYgYW4gaW5pdGlhbGl6ZXIgb2YgMA0KPiA+Pj4gLSBVc2UgdGhlIHN0
cm5jbXAoKXMgZGlyZWN0bHkgaW4gdGhlIGlmKCkNCj4gPj4+IC0tLQ0KPiA+Pj4gdjMgLT4gdjQN
Cj4gPj4+IC0gcmVmYWN0b3IgY29tbWVudHMNCj4gPj4+IC0gcmVtb3ZlIGRvdWJsZSBibGFuayBs
aW5lcw0KPiA+Pj4gLSByZXBsYWNlIGFtZF9jcHBjX2luX3VzZSBmbGFnIHdpdGggWEVOX1BST0NF
U1NPUl9QTV9DUFBDDQo+ID4+PiAtLS0NCj4gPj4+IHY0IC0+IHY1Og0KPiA+Pj4gLSBhZGQgbmV3
IGZpZWxkICJwb2xpY3kiIGluICJzdHJ1Y3QgeGVuX2NwcGNfcGFyYSINCj4gPj4+IC0gYWRkIG5l
dyBwZXJmb3JtYW1jZSBwb2xpY3kgWEVOX0NQVUZSRVFfUE9MSUNZX0JBTEFOQ0UNCj4gPj4+IC0g
ZHJvcCBzdHJpbmcgY29tcGFyaXNvbnMgd2l0aCAicHJvY2Vzc29yX3BtaW5mb1tjcHVpZF0tPmlu
aXQgJg0KPiA+PiBYRU5fQ1BQQ19JTklUIg0KPiA+Pj4gYW5kICJjcHVmcmVxLnNldHBvbGljeSA9
PSBOVUxMIg0KPiA+Pj4gLSBCbGFuayBsaW5lIGFoZWFkIG9mIHRoZSBtYWluICJyZXR1cm4iIG9m
IGEgZnVuY3Rpb24NCj4gPj4+IC0gcmVmYWN0b3IgY29tbWVudHMsIGNvbW1pdCBtZXNzYWdlIGFu
ZCB0aXRsZQ0KPiA+Pj4gLS0tDQo+ID4+PiB2NSAtPiB2NjoNCj4gPj4+IC0gcmVtb3ZlIGR1cGxp
Y2F0ZWQgbWFuaWZlc3QgY29uc3RhbnRzLCBhbmQganVzdCBtb3ZlIGl0IHRvIHB1YmxpYw0KPiA+
Pj4gaGVhZGVyDQo+ID4+PiAtIHVzZSAiZWxzZSBpZiIgdG8gYXZvaWQgY29uZnVzaW9uIHRoYXQg
aXQgbG9va3MgYXMgaWYgYm90aCBwYXRocw0KPiA+Pj4gY291bGQgYmUgdGFrZW4NCj4gPj4+IC0g
YWRkIGNoZWNrIGZvciBsZWdpdGltYXRlIHBlcmYgdmFsdWVzDQo+ID4+PiAtIHVzZSAidW5rbm93
biIgaW5zdGVhZCBvZiAibm9uZSINCj4gPj4+IC0gaW50cm9kdWNlICJDUFVGUkVRX1BPTElDWV9F
TkQiIGZvciBhcnJheSBvdmVycnVuIGNoZWNrIGluIHVzZXINCj4gPj4+IHNwYWNlIHRvb2xzDQo+
ID4+PiArICAgICAgICAgKHNldF9jcHBjLT5tYXhpbXVtID4gZGF0YS0+Y2Fwcy5oaWdoZXN0X3Bl
cmYgfHwNCj4gPj4+ICsgICAgICAgICAgc2V0X2NwcGMtPm1heGltdW0gPCBkYXRhLT5jYXBzLmxv
d2VzdF9ub25saW5lYXJfcGVyZikgKQ0KPiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4+PiArICAgIC8qDQo+ID4+PiArICAgICAqIE1pbmltdW0gcGVyZm9ybWFuY2UgbWF5IGJlIHNl
dCB0byBhbnkgcGVyZm9ybWFuY2UgdmFsdWUgaW4gdGhlIHJhbmdlDQo+ID4+PiArICAgICAqIFtO
b25saW5lYXIgTG93ZXN0IFBlcmZvcm1hbmNlLCBIaWdoZXN0IFBlcmZvcm1hbmNlXSwgaW5jbHVz
aXZlIGJ1dA0KPiBtdXN0DQo+ID4+PiArICAgICAqIGJlIHNldCB0byBhIHZhbHVlIHRoYXQgaXMg
bGVzcyB0aGFuIG9yIGVxdWFsIHRvIE1heGltdW0gUGVyZm9ybWFuY2UuDQo+ID4+PiArICAgICAq
Lw0KPiA+Pj4gKyAgICBpZiAoIHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NUTF9DUFBD
X1NFVF9NSU5JTVVNICYmDQo+ID4+PiArICAgICAgICAgKHNldF9jcHBjLT5taW5pbXVtIDwgZGF0
YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYgfHwNCj4gPj4+ICsgICAgICAgICAgKHNldF9j
cHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NUTF9DUFBDX1NFVF9NQVhJTVVNICYmDQo+ID4+PiAr
ICAgICAgICAgICBzZXRfY3BwYy0+bWluaW11bSA+IHNldF9jcHBjLT5tYXhpbXVtKSB8fA0KPiA+
Pj4gKyAgICAgICAgICAoIShzZXRfY3BwYy0+c2V0X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19T
RVRfTUFYSU1VTSkNCj4gJiYNCj4gPj4NCj4gPj4gSG1tLCBJIGZpbmQgdGhpcyBjb25mdXNpbmcg
dG8gcmVhZCwgYW5kIHdhcyBmaXJzdCB0aGlua2luZyB0aGUgISB3YXMNCj4gPj4gd3JvbmcgaGVy
ZS4gSW1vIHN1Y2ggaXMgYmV0dGVyIGV4cHJlc3NlZCB3aXRoIHRoZSBjb25kaXRpb25hbCBvcGVy
YXRvcjoNCj4gPj4NCj4gPj4NCj4gPj4gICAgICAgICAgIHNldF9jcHBjLT5taW5pbXVtID4gKHNl
dF9jcHBjLT5zZXRfcGFyYW1zICYNCj4gPj4gWEVOX1NZU0NUTF9DUFBDX1NFVF9NQVhJTVVNDQo+
ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/IHNldF9jcHBjLT5tYXhpbXVtDQo+
ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGRhdGEtPnJlcS5tYXhfcGVyZikN
Cj4gPj4NCj4gPg0KPiA+IFRoeCwgdW5kZXJzdG9vZCENCj4gPg0KPiA+PiBXaGljaCBhbHNvIG1h
a2VzIGl0IGVhc2llciB0byBzcG90IHRoYXQgaGVyZSB5b3UgdXNlIGRhdGEtPnJlcSwgd2hlbg0K
PiA+PiBpbiB0aGUgbWluaW11bSBjaGVjayB5b3UgdXNlIGRhdGEtPmNhcHMuIFdoeSB0aGlzIGRp
ZmZlcmVuY2U/DQo+ID4+DQo+ID4NCj4gPiAgbWluaW11bSBjaGVjayBoYXMgdHdvIGJvdW5kYXJ5
IGNoZWNrLCBsZWZ0IGJvdW5kYXJ5IGNoZWNrIGlzIGFnYWluc3QNCj4gPiBkYXRhLT5jYXBzLmxv
d2VzdF9ub25saW5lYXJfcGVyZi4gQW5kIHJpZ2h0IGJvdW5kYXJ5IGNoZWNrIGlzIGFnYWluc3QN
Cj4gPiBkYXRhLT5yZXEubWF4X3BlcmYuIEFzIGl0IHNoYWxsIG5vdCBvbmx5IG5vdCBsYXJnZXIg
dGhhbg0KPiA+IGNhcHMuaGlnaGVzdF9wZXJmICwgYnV0IGFsc28gcmVxLm1heF9wZXJmLiBUaGUg
cmVsYXRpb24gYmV0d2Vlbg0KPiA+IG1heF9wZXJmIGFuZCBoaWdoZXN0X3BlcmYgaXMgdmFsaWRh
dGVkIGluIHRoZSBtYXhpbXVtIGNoZWNrLiBTbyBoZXJlLA0KPiA+IHdlIGFyZSBvbmx5IGNvbnNp
ZGVyaW5nIG1heF9wZXJmDQo+DQo+IEkgc3RpbGwgZG9uJ3QgZ2V0IHdoeSBvbmUgY2hlY2sgaXMg
YWdhaW5zdCBjYXBhYmlsaXRpZXMgKHBlcm1pdHRlZCB2YWx1ZXMpIHdoeSB0aGUNCj4gb3RoZXIg
aXMgYWdhaW4gd2hhdCdzIGN1cnJlbnRseSBzZXQuDQoNCkl0IG5lZWRzIHRvIG1lZXQgdGhlIGZv
bGxvd2luZyB0d28gY3JpdGVyaWE6DQoNCjEuIGNhcHMubG93ZXN0X25vbmxpbmVhciA8PSBtaW5f
cGVyZiA8PSBjYXBzLmhpZ2hlc3RfcGVyZg0KMi4gbWluX3BlcmYgPD0gbWF4X3BlcmYuIElmIHVz
ZXJzIGRvbid0IHNldCBtYXhfcGVyZiBhdCB0aGUgc2FtZSB0aW1lLCB3ZSBhcmUgdXNpbmcgdGhl
IHZhbHVlcyBzdG9yZWQgaW4gcmVxLm1heF9wZXJmLCB3aGljaCBpcyB0aGUgbGFzdCBzZXR0aW5n
Lg0KDQo+DQo+IEphbg0K

