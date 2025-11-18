Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C23C67DAE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164434.1491398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFsD-0003SU-De; Tue, 18 Nov 2025 07:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164434.1491398; Tue, 18 Nov 2025 07:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFsD-0003Pp-AQ; Tue, 18 Nov 2025 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1164434;
 Tue, 18 Nov 2025 07:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLFsC-0003OX-Ic
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:11:32 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdad7f73-c44d-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 08:11:30 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:11:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 07:11:25 +0000
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
X-Inumbo-ID: cdad7f73-c44d-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbJRQnuvT09vw9gzuvTl2djpO0sZYPLdzxiLpX0XqpcYhMU36A9aQfOO+DSg8QZY8Pqww/Ow692bupctY1FWYVaUC1Mq5DO+ci6aG4JhpEF9ZvWuzdtHJn7P6M7BNDKzlXVOhDCDxtk2GEtOl+PLSgJZ+rXcYd27J5qnI/pNAJzrbkDlrU4vrx0uttBGWyYNXI1XHXKWE1d7E47jHuWM/2Q/JGi5NSj1Iy3Fbnw3xggrzcvIUwtHVhwXlY3208vr3ORLX0+3E5aeP55cgUokBjdCBKM1plYc4QYCwt7Fok8nAdcOVAArgUGSFvCqylDDeFwz4/hdMEJ95J/Pr7nMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odISFh7aI4OENhrTZCmHg4xZT4MHYQ0tgnMz9bD6XQA=;
 b=C4CrXPamnyZjcPrfaPsDx4AwURoaBcT1WCAGxugkUHo8eB8ACzUb6gvC3QMnGBtim3Z3rfB21qsiRap6XB8CY/pbrjg7MfFgCwQ0LnkCtsbCpNF47vaVAfLen6VGutLZnu9m+HgRy5M5lvIYUj6dBbMMumUV/NQCIWevh8tcUPrbeKv82Xr9728HWq53odxbKIxBNZZtX/JUOpVQp3uXTUclY9Xu+mGlQG1bwYWS/dlqmja0BAIaOpV12rtxCghrSKQQqn+WFp8t1uSAH1Amye/W9TgAqe/Gsd1ahbAeKa7QfpyZq5Zurt0ApP1X5tKHvbX++P72vhmWiRCmiMD0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odISFh7aI4OENhrTZCmHg4xZT4MHYQ0tgnMz9bD6XQA=;
 b=UHQBPXskQO9GShEs0UMuNp7H7Z+IxUvKJgfDRz46P4uBc3B5925uOchtENtoKHVQ7RV8Xy3QUeBlrtaJPjZD8xBnqIdOOmCRTvi8bsHM0Cyke7BqfcsgMxvkmWT1+dAkAUtRppF29eD8gl0PNseymMEdIpFtkSMna3ZD/7pMkW4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 1/7] xen/svm: limit the scope of "rc"
Thread-Topic: [PATCH v1 1/7] xen/svm: limit the scope of "rc"
Thread-Index: AQHcVEv7QeZ+fg/ABkeiD8Kl9SvRY7TwTjSAgAe47rA=
Date: Tue, 18 Nov 2025 07:11:25 +0000
Message-ID:
 <DM4PR12MB845149F3F5C2262969771FCDE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-2-Penny.Zheng@amd.com>
 <8304ea57-0574-482b-a2ea-e1dadc58656e@suse.com>
In-Reply-To: <8304ea57-0574-482b-a2ea-e1dadc58656e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T06:55:07.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB7335:EE_
x-ms-office365-filtering-correlation-id: 13f8bd27-c8fa-4711-25e1-08de2671afb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUJlcWhZTzNWdW42S3VmZzZWL25UWTNMZ29oUHkyc0o1dTlJMjhjbHhDV3NQ?=
 =?utf-8?B?bEg5KzRxU1k2TW1sS2YyVitTZE1NeGQvZ2pma0tWWWgyTEkrQk5uWk5wMzFI?=
 =?utf-8?B?Zlo2Z0pYbHcwRDBPVWJ4ZHdiYm1LNllpTjZKYklYUld1YjhCNTdlbFZKQU9l?=
 =?utf-8?B?QVZWWmpmYnFYZ04wUTdUVm8vYUJIYk1nallRVHBGUVpRVG1sSDVsdHZqT2JK?=
 =?utf-8?B?WG5YNHFKMXVLZzJ6aFlXdm50RlFWeW1sNzgxR3RlM01UMUVSWmdjL3ZGU3Vp?=
 =?utf-8?B?OUdGUHFjQWlMa2Q1OFk5NWtpdFN5cEJ6cjI5QmdzODNsVWhVU2dQTjE5cDhN?=
 =?utf-8?B?dUR4dFdYTEhFUk92QVl4V1g0bk1raWt5MVExbkNwdzI1cFdlMjltNjFtcXJp?=
 =?utf-8?B?alZjMmVUREtMYkpYSld5RnNDUXBrc3QyaFZ1ek1iTHBFYXZmbmcxWDVzcUtx?=
 =?utf-8?B?QjdMYVhQTHR4NzNDZXF2ZnZHc3JtZ2dteCtndUc5ZXVycDN1aFVzbGpOSEk3?=
 =?utf-8?B?RU1XRHZsdnNXS3lCVmpNUCttUWZoZm5PRldMSjYyK2VQSHp4MmgvZTRCV2h2?=
 =?utf-8?B?REJNMGlFUmpYOUVTaVk2UlhpMXA3S1FGcC91dSthWmhHdFVvSzFnWmNnSitP?=
 =?utf-8?B?cHp3WFBMSHVLNHZUVEgxVW1Iak1QQXdxU3BFcmlkMmd3K3hvdzRBRDZyQ0Na?=
 =?utf-8?B?U2l6VHJkd1lFdXltZ1FoZmUwNlBPMHNiOU8rRjBtZytCNTN4djZKWUVSa3pr?=
 =?utf-8?B?YWFRYjZQMjVWMUlOVE14QWlGNUxyNVRlMTJweC9PUUJQZ2RrUVBOU1UzdVJ4?=
 =?utf-8?B?NTN6SEZ3YnFMRjdqTVpvS2UyMzE4b01DVldsVzBSd0RuSlk3WElEcTdZRmh3?=
 =?utf-8?B?MHN4MGV6ZXcrUmp1M2JjdzI5MlhjZ0M0cWZwUHNPSkMrTUNGYVlEdlNCcFNU?=
 =?utf-8?B?UFNjTUNQVWhTc0xzTC9VQUdGb0pEOTdNOHd4QTlKZXcrSWExTy9FbnljWHlE?=
 =?utf-8?B?clJsMXBwcnR4WTVHNGJZUkRzYmN1TEN2YUVUUkNlWDEvTUxqTENGZ3Z3U1h0?=
 =?utf-8?B?cmI0aFNRQ2JRV1h3b0lNa2RGN1NOeGszSUhDM2YvajR0dnFoVGQ3cTlla016?=
 =?utf-8?B?cjJZVWhGeEp1bXlqMmVsSUZFUjJMOVFNTnlWWC9vcERFZHZ4aDRKM1FMM3dV?=
 =?utf-8?B?NUFlWk5TM2NaTGdQRWtGM0JwWUhyREZ2MEszSmVuaHM0bkVCMnp6aTdjdnE1?=
 =?utf-8?B?aUloaGJJbi9xZHdTU1Q5THY1Mk5lVnFzL3pwMzBOYkRmNFNXOUFIMTlpWFNz?=
 =?utf-8?B?TG81MS9QVkZLMUo0dWJkVENxNFdVR0NJSFlWd3NsYXB2aG9OVmJhVENTNG1R?=
 =?utf-8?B?aHZiZTZBS1hzbktNNW5hWnhvRmplTE01V3Y0ZGVKQmtJbzVjcHZwamdBd1ls?=
 =?utf-8?B?cWExY2FDOUQzd0RTdnNWcG8wbFhWZ3JaOGxScGtseWFJb3NqNFhncUZ3WlYv?=
 =?utf-8?B?UFlYUzRBcVMveVBab0xzNDQvenpwdlRVVko5NHhMZUFBU0NBRTVGUnR3bERp?=
 =?utf-8?B?Yjg0N25uSFFUcTQraFRueXhINlhWS3MvbTJ3RG1hWXhtSWlXWUhWVWk2OEhH?=
 =?utf-8?B?WlBHZ3dZY3dkT0p3OEg4a1kxbzNEeVQrMmxGVjAwMHFBV09FVVlGc1hHanQz?=
 =?utf-8?B?SWFrTzM1cGFKN2FmNysxQnVEV2t6emVROFc5cXYzUHUvZkxvMU5DL3FOWDJ0?=
 =?utf-8?B?aHpDTmZ2VHVPeDJzRHJxdEZiWGpmV1JTanBvaGFpeHJFczJ1aFU1bllyR0Vw?=
 =?utf-8?B?K0t0MWwyQ20zZTZBY1NDY0VqTnk0cUxVY1dTQVlQYXd3NWtZdFNYVlRXS1hT?=
 =?utf-8?B?SUl4TEFaR2hjY011MU56UHZ2Mk9maDhRYTNyeWh0MXFJTjZubysxSm5IUktE?=
 =?utf-8?B?VUEvczVoRjVIcXpNMHEvMk81bWt3WXk0eFdha25pMGVTaUJHMWVRZng1ODZ2?=
 =?utf-8?B?Qmp6dzF0WWYwb0JuNU9yNDIrY0NKa21EYmcxUW50ZFBPSG5lYXBPeEVrR3Zr?=
 =?utf-8?Q?XFNvmg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHArQVh6RXN1b0pVMFNrQ1U2WUxiSVRDViszVGhRdllMdktYSDEwVFNmL2lW?=
 =?utf-8?B?bnl2VFU2Q0pDT0RvcjhJME94cnZCUnZ5anhQeEt1MkV2OHdZVUFOK3hJMk9F?=
 =?utf-8?B?N01aV2RXUjFyUzFVR0JOZGtLOGtzYWFCNjZsYUZWSlZ2Y3FOUmppTEJKNnBo?=
 =?utf-8?B?djQwck00OVFtaGR1emZucm5iVk1VSFdiTHR4RENXcGpSMkJ5NXlPZTR4QjR1?=
 =?utf-8?B?anJXTTlJdEh4c0hYYS9SOThTUkhJNmdNdmVrdFg4Yy9QVzZtNXlwN3ZqQTgv?=
 =?utf-8?B?WmE5KzBEUTVHTXcyUmN3WDhueTFOcUdmZXdEakwrMnkyU1pPZzFjV3NEWlFV?=
 =?utf-8?B?V2VhTk1UQ2thaGk2MjVRQlJzSlJrQWEzSjFXNlliNWg4dUkrSE50UUdSOUJT?=
 =?utf-8?B?dTlkanRHdjNSYVlNRU5wT1ZVQkIwLzRTeWNOYnhzVm9rK25rcVJETzBKYWlm?=
 =?utf-8?B?UTJXZGRrWmt3bGhVVnphWW1SQUNoZUREaTR6UUhMb2FCTmxjaG4wSjloaUFF?=
 =?utf-8?B?c3RTMm04ZWJ4RVpEYVh5U1JJMC9XekZCQ2paM1oreWJJOGcreEQ2R1dTRnM5?=
 =?utf-8?B?U0NHR1F5ZEg4M0hZVXcwZE9GUzMzM21WU21LNzQ5cHVuaUlkcnVTSU82NmZo?=
 =?utf-8?B?V05PS0ZnSjNNUEt2a0xNT3JwcUVJWGdLZGNlbW1MTFgvRjlPZys4VWhhbm5K?=
 =?utf-8?B?b2dKK3h1ckhDS1Y3OElZWHN0eFREeVBveGxHQi9LZnhjVzNIbVlNUC9uVGx0?=
 =?utf-8?B?TnhIckc3UjZpQit2L2FLTzJzOGFlaDlOTGxGYVlibzREN3VFSW9ENzB1dVU3?=
 =?utf-8?B?bzNCeVozZnJtbzUvUHREdWtyTEFOK2NVZjluek45SG12ZWVFYURKaEMwcVhn?=
 =?utf-8?B?QVlwZnE1eUJucEJPTVowYnJ1WWR5alF5K0NYc1pOL0pvalJ2TUNjSEcxNGMx?=
 =?utf-8?B?cGx3TjNZK1pFWXBKZ2M2aGpLbmFJRStHbmdJdExMY2kyQ0REZkF1K2NJYUlq?=
 =?utf-8?B?RitpVU4xTDgrUy9lbXBkTHFZSC81VWhEaUZOckRGSzhjNm9kUzVJbW9VcGpn?=
 =?utf-8?B?d3hpeVRPUW9nSGpkV0ZQWGpzRkJEdnVGOVROd1VpYlhOdXl5WEdmSW5xV09z?=
 =?utf-8?B?alNFS09hanVVeWcrVUlDTTk3RnRkZ3VFUWJhaWdGeUdHaFo1UVFyVnlIUzMw?=
 =?utf-8?B?MDRvNmU0aFZmeG9oRXlFWHROajBEck9YbWVaVnBDcUpHeVpnZlF4aWIwbU51?=
 =?utf-8?B?T0lURWNCUHFMaTlidXRiMWxLM0hMdnc3VktDSk56Tm5MdU1OdW1TbjRqRlZT?=
 =?utf-8?B?dzNnd3dEaFh1YjBEemhWUndkdWVaN2F1cWRTSGFCY3N2cWdCTzBPN0ZGbDBG?=
 =?utf-8?B?NFFRWi9QYmJIVzlNN3dLVG1ZMWhDTG1ZS2V3TzBLRzhENU5LTkNMNXFIOWs2?=
 =?utf-8?B?OThoYUVjR2krRGt0dnRwV0FXTThkVlNrUm95Tkx3MUE1elJLZEF4eWtjUFk1?=
 =?utf-8?B?VHNZTmRzdXJOMHNiNUNkMm9qakc5VElJcEJXdzgyVENaeWpJYTFvQ3B6UUhn?=
 =?utf-8?B?VGdOd0dXOE0vN3U1bnowYWlqeC9zNm9JTGFhT2pwVzFWUWQxTHpxVHdpTk8y?=
 =?utf-8?B?K1pyNlI2cWc1SVFDYy94aWRMZTNISmdkOXQ2aE9zUThRTFhuOG5nOHRsSFVS?=
 =?utf-8?B?ei84U2RWZ2lmcldsSDV3VDNpR01YeHo5MEk5akJVUkZBODhvc2ozSzRVdzBp?=
 =?utf-8?B?Q1p2SXpFY1VPR3pIZmxDczd1MlY5M1FHZkFnaEFVY2ZzNFBqS3dOWVRXaGhS?=
 =?utf-8?B?YUs4MVJNZFVEc0dOTGppU0lFbnFqak1lOUV3MFFqUkNDK2FHOWNJUGl0M0Ev?=
 =?utf-8?B?MlBOdk5JMDBmbUJRbk4zUU1vSEZ5WEJPRWZkdUpXUWxBVHN4c04vbHZCcnJp?=
 =?utf-8?B?SHVGTElIYmZISUNyYnVLUkRKNHVoNmtKcHBaRjhOaFYyOEtxNE5tWDlTR3hn?=
 =?utf-8?B?ckdyanhDaS82MVBWVEVja0VDTFVBT0V3bm9zZHI5OVkwQksvNnFhc2ZXSU9s?=
 =?utf-8?B?UlFOMWdkOVh2YmRyb29mMG1USVFaSWViaWVEL1BFcWoxakRRTjRlV1ZNVDFX?=
 =?utf-8?Q?rFYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f8bd27-c8fa-4711-25e1-08de2671afb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:11:25.3728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4c5E/idqGFk8PndH5jr+RYn1aHG+T/4e1tkJCHm8A5rMRueTKh9VgGOOVcRefrMO1clgPd1XiVxNLokCfVxZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMywg
MjAyNSA0OjU2IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1
IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbmRyeXVrLCBKYXNvbiA8SmFzb24u
QW5kcnl1a0BhbWQuY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYxIDEvN10geGVuL3N2bTogbGltaXQgdGhlIHNjb3BlIG9mICJy
YyINCj4NCj4gT24gMTMuMTEuMjAyNSAwNDoxNiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVG8g
bWFrZSBjb2RlcyBsZXNzIGZyYWdpbGUsIHdlIGxpbWl0IHRoZSBzY29wZSBvZiAicmMiIHRocm91
Z2ggYWRkaW5nDQo+ID4gc2V2ZXJhbCBpbnN0YW5jZXMgaW4gcmVsYXRpdmVseSBuYXJyb3cgc2Nv
cGVzLiBXZSBhbHNvIGZpeGVzIHdyb25nIGluZGVudGF0aW9uLg0KPiA+DQo+ID4gU3VnZ2VzdGVk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQoNClRoeA0KDQo+ID4gQEAgLTI3NDgsMTYg
KzI3NDksMTggQEAgdm9pZCBhc21saW5rYWdlIHN2bV92bWV4aXRfaGFuZGxlcih2b2lkKQ0KPiA+
ICAgICAgICAgIH0NCj4gPiAgICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgew0KPiA+IC0gICAg
ICAgICAgIHJjID0gaHZtX21vbml0b3JfZGVidWcocmVncy0+cmlwLA0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSFZNX01PTklUT1JfU09GVFdBUkVfQlJFQUtQT0lOVCwN
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FVF9TV19FWEMsDQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnNuX2xlbiwgMCk7DQo+ID4g
LSAgICAgICAgICAgaWYgKCByYyA8IDAgKQ0KPiA+IC0gICAgICAgICAgICAgICBnb3RvIHVuZXhw
ZWN0ZWRfZXhpdF90eXBlOw0KPiA+IC0gICAgICAgICAgIGlmICggIXJjICkNCj4gPiAtICAgICAg
ICAgICAgICAgaHZtX2luamVjdF9leGNlcHRpb24oWDg2X0VYQ19CUCwNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0VUX1NXX0VYQywNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zbl9sZW4sIFg4Nl9FVkVOVF9OT19FQyk7DQo+
ID4gKyAgICAgICAgICAgIGludCByYzsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIHJjID0gaHZt
X21vbml0b3JfZGVidWcocmVncy0+cmlwLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEhWTV9NT05JVE9SX1NPRlRXQVJFX0JSRUFLUE9JTlQsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0VUX1NXX0VYQywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnNuX2xlbiwgMCk7DQo+DQo+IEFzIHlvdSB0b3Vj
aCB0aGUgY29kZSBhbnl3YXksIG1ha2UgdGhpcyB0aGUgaW5pdGlhbGl6ZXIgb2YgcmM/IEFuZCBh
dCB0aGUgc2FtZSB0aW1lDQo+IGpvaW4gdGhlIGxhdHRlciB0d28gbGluZXM/IChJIG1heSB0YWtl
IHRoZSBsaWJlcnR5IG9mIG1ha2luZyB0aGVzZSBhZGp1c3RtZW50cyB3aGlsZQ0KPiBjb21taXR0
aW5nLikNCj4NCg0KVGh4LCBwbHoNCg0KPiBKYW4NCg==

