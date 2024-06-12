Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9BE905039
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739125.1146067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHL1E-0004Pq-4k; Wed, 12 Jun 2024 10:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739125.1146067; Wed, 12 Jun 2024 10:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHL1E-0004Nb-1b; Wed, 12 Jun 2024 10:15:52 +0000
Received: by outflank-mailman (input) for mailman id 739125;
 Wed, 12 Jun 2024 10:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHL1C-0004NV-QF
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:15:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd0105b6-28a4-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:15:48 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 10:15:44 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 10:15:44 +0000
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
X-Inumbo-ID: bd0105b6-28a4-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXG+rr+anpClgKYFJjDsLo2OZGL0x5lbjhFhJQj79VTKRMpD0gi2bqbREhivRkrhLUxJeX9m2dfEuHcAvyJYxMJOxsgDWyosZLE/Nh7pdk8fCRdAy8ZpOU3Q3YWNADyv0P5cJDnZeUK8mLEOxHqcfORy3O5DCHDrSvjaSQn7qWpTNN0+hR3wmUh1kMmcx3sS5GivRI7jmxvauVfpECZeItXnFPKXXSzrnYh+JNTcGKFoWgjITFwNNdzCHlHrlj0cgxkRupsoD/xKs/R/+TUwmU99WTiL0zU4icxBuVLT2wtJnJrxnzQLZIZjCuzLEm+j4p6fPoAP0Ub1RC87VxTMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlkX//18Qxj+WXJZ1k/mDIZx9FU/OP9f2KkKTS44ThE=;
 b=Jr+0/RPTRhZmIshhoJTfKRKMQsLPWq+NxOOrp4yrJB5IaZiWzyQpXyXOl0GqdnC9+C1MZNsLCQ8jfvscRxBTdKL0VleVVDVdV+a8qAcTTG5wgcJVMgv341M/F0pMQZ3/3F8hAx+tV/5XAgKJp2Qc7G1AaMaFNnr503v+5txDBJdqQfIyWEA1QII4HAHjUm2nADMqa1Loig1wIEDqXp7htjEXZFzwqkdbbjLI/CmFSO6jhDPgLkmDsNLCMZY86GCbquFPTm6f0cIaP5jrOnHSe61M7GL+MhWs+pUZR8EiVmXLBHOWpIrdYi8mQDQpPXPA+p2UeQfY2DxPj2NKdULHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlkX//18Qxj+WXJZ1k/mDIZx9FU/OP9f2KkKTS44ThE=;
 b=xjxujFL/OmVk78xy1370uUIYoqvbeBG2MGi16KKq/Hk9TMdrIV3inK26fxR/JrdIwx9bgMCwyfzi5QudgYRsMzKWAiglVylH4nKrD+6ESqqCiFAS8XpAeJkJLjTovPNswrUhosY8Rs8v6lLsfONIHDoOFVQ8C+vFYNnfGnmpRDQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHauLJgk79xZtykz0GMHuXNeMsUFbHBLLUAgALK4YD//+MLAIAAiCyA//9/rICAAJTZAA==
Date: Wed, 12 Jun 2024 10:15:44 +0000
Message-ID:
 <BL1PR12MB584946C6DAC365C1C040C258E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-3-Jiqian.Chen@amd.com>
 <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
 <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <41905257-e2e6-4bce-b723-516916448dfd@suse.com>
 <BL1PR12MB58493C065A5CA4FF2A9C03B6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5bb436a7-d426-4413-84bf-907615e12212@suse.com>
In-Reply-To: <5bb436a7-d426-4413-84bf-907615e12212@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7481:EE_
x-ms-office365-filtering-correlation-id: 05089407-9b0a-4370-0d72-08dc8ac89ec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|1800799016|366008|376006|7416006|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlNsQ09Ra2tXeUV6Sm11anBTVkxrOHFvMW1EUmg5d1VNVGVpOVJNNldRaVNC?=
 =?utf-8?B?a2lqc1VaLzNQS0QycjNrbmJ2KzJGMllMZmtvdUhGbGp5U0xLbE9mbzhyV2c3?=
 =?utf-8?B?WnozYlV0SDFOZE15ZTBhWTArWmdXTzVXVnIyTFhaWHIwYnQ5dlF1c3dSbXp4?=
 =?utf-8?B?dWdKRUhCTlhEeWdzTEdFekF4TEE5VlBlRnlkdGlXUnlGQ1JvWFJLNWhCcHB2?=
 =?utf-8?B?RTVZSE9yVjcvRFhpQ3dveWpIMDRIM21XMFFoQWp6bHdyZzk2Tm8vREt0eHAw?=
 =?utf-8?B?SUFPZ0x4cVFyOGdCaG8zYURvMGl3MUdqWkRmNzVWYUZZNTBEZVExQTdkY2tM?=
 =?utf-8?B?YUdaNlllcXVFRUl0RUNOYStVelZ3SVdCQnNzUDgwWCszWXZlVWJhb0MvemlU?=
 =?utf-8?B?OUwveDJDQVpNdGFJTmFMN01nL2EzaklOSWNGTy9FRFFaRFFXdVZrcS9Ra01j?=
 =?utf-8?B?eEFGRmZaMHl0cXJNLzFxd0Z0d2JVcUhhZ244NGZlUzJ0a1VsdldnWTJTZDNJ?=
 =?utf-8?B?VCt2UndEdVFYS3BQUjdTSWxxNkNjeWZQcFlrb3o1QUg3aVQ5enVuVko3bndv?=
 =?utf-8?B?VE0rWTBYdUt5bitKSzRYRlJ3eFNseDRyTUJTRmRXUmZ5dUZCU0RFR29keXN1?=
 =?utf-8?B?TmgzMThQdTk4dm9GWCtzTjNiUVdaZERpY0FuYjIxa2pWbWVvRXcwUXBybFlR?=
 =?utf-8?B?UElDdUw0T09zWmttTTBpTFdIdkg4OVJRZTN1VkVTcWlJa1dPYUh3NzVPMjdY?=
 =?utf-8?B?a1FuU3A3eitqY04vUmIza2VaOHBvaGEybWZXNFZocEZTdzBlSkNKVnVOOGkv?=
 =?utf-8?B?aWFRSkZGam05ODRyR2sxNE9zSmQ5NDQ5bEcvYU9EcHJld056YzdwK2NsZkR6?=
 =?utf-8?B?KzJxRDdSYjVzZWhWYXI5OFdVVE9abFhqQm9MbVZOWTN2YkVZLzJ2ZVJrajV2?=
 =?utf-8?B?OG1kR3FUd3h3RVRDc3JNQklZdE50NDQxaVE5ZUVTd3h4MnNrYWNBMEdhK1dx?=
 =?utf-8?B?enF2d0kzM2xzQUEya3kzNm9LRjk3Vmc4M2F2cXhJTVVGN1lnM0E3bWVjbER1?=
 =?utf-8?B?eXhRK29NblNBN1NaZm5ZRHorS2E3N3JpajFoRUMyRU9JaU1nUGo5UmcwandL?=
 =?utf-8?B?WVcyY2FLWUVsRFBqbWdHdkdoYWxFd2tUbVFNdFNmMFc0U3kxRFU1elJaaFJN?=
 =?utf-8?B?cmlPdlFnYmV0Q0FYY0t5dnl3YWZGQTY3Y2N6aGdTMGVoOGNaM0Jub0kxeTlS?=
 =?utf-8?B?SlF3UUs5ZG1QU1hWUlZ3Y2dESnp4MkdLc0xSdlVEVFJ3UE9LTHF2YXkrK3F5?=
 =?utf-8?B?bG5TWFA1ejAzUndPRktqdWp5K3FmeHFHM2d5RFQzbFRnQjRjQlpxYjJidFNz?=
 =?utf-8?B?V0hCTU8vSHZOYkJlMjB0TE1jZXNVUkdrQ0g1TW96dHNqK0E3QXhWZXZNaEhQ?=
 =?utf-8?B?K211cEZ2aGRuUDdYeThXNFNEYW1KRWwvQ2JZRktJS0h1aS9DcVltNEV5bnJU?=
 =?utf-8?B?bWhMaW9XL25FSk9xZlFmOWZmenU3ZjJxb1pXT2Ywamw4bzRMdktBNThJaVVq?=
 =?utf-8?B?alFXb2dwRHZOMFYzZUR2Vll3TERpSTFmbkhLbnFva0E1V1M4SXdkUUNwelBx?=
 =?utf-8?B?S2RKdkZVcm9jRHBlbnRDdHlzQkMxQlhkSis0MmZadU9QMGo5TElUYWdMUEln?=
 =?utf-8?B?aTJRdXRDdXdMTmorU0tSUTl5WjYyQzZQbC9DTTRzMlFsK2JLUU5LV1RlVWg5?=
 =?utf-8?B?QTRJaTNGSnVjQzJ2NDMyTEwva1J5eUFTeWpxWFRxVm01MUhJeSs3cjZ0aVRa?=
 =?utf-8?Q?QUST2PdT7phjMEJ3DGnu4DJwTIoANUZwm5C90=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(7416006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VENScXMrSEY5Y0JYK1llSVpEajV5Z0ljUW5kOXRjcTlKdzVzdUo5ODIxQVl0?=
 =?utf-8?B?T2tObjhGUGk4NnZ6QngzVS9vK2RKdGc2UEZRWUtDQ3VYUGJyK0VrZnJ6Qm5P?=
 =?utf-8?B?cDVCN0FZdkxlenVJcXlUZ293aGxHRUpPa1ZlU3piMWlNZ1BUcHQ5U2dJOGtu?=
 =?utf-8?B?eHpsZE0rcklXWkVJUXNwcHozbVJwVCtrRVg4UGR2MkR0RkhxT1NtMUF4N2lW?=
 =?utf-8?B?TERQdmdpMTZWWVhWcFFieEVqQmxqbHpva2VUY0FzTnJsSHE5ODZpdVdueU5N?=
 =?utf-8?B?aG5uVHpTbmVnNEloTC9OaGZkRll3d3NRR1hhekJJMFI4L1FZRC9IV3RBQjk4?=
 =?utf-8?B?RFNXQThlUzl5WWJTN0o2QXNwU2VEQVFCTTg5YmpxNTNZNHdCREMvSWZJSjhD?=
 =?utf-8?B?a2IvQVlHZFNybGhrUUdqdTFzcVFMdUg5OUVXZWhpcCs0V2JVOUpVYXU0YVkz?=
 =?utf-8?B?bnNzcnBZcjRmbWxMZnFVUGlSamhuVk5zYnhTS1BtSVNJVFNVWmxWd3VWVGFo?=
 =?utf-8?B?VE40b2tGTHBPczdEamNhVzFTUTRYaHJBVVVKUG1wY1MwVzlZUmwxd3VYTUZv?=
 =?utf-8?B?SzVzcGJjRmxwcHNDaHpkTGZXaUtxbytEa2phRmx3TFh4amNVeSs3QUtMVlNz?=
 =?utf-8?B?WGF2U2l5TnVjaFJSc25yMUdBUTYwb1l1Y0lIbWdqU2t2d0ZTZ2FkR0x5ay9u?=
 =?utf-8?B?WTZZSmN6T2tiTWNGcVV5eUpXMlJvVXdVNzJmOE9EYmdNYTBSMUM5Y1hiNTZ5?=
 =?utf-8?B?NjZadXk5N3pXWlI0Ny9UMWJKVXVkcjFoaTFzZVdwL1R1bjRNRHpNTXRZc3Rh?=
 =?utf-8?B?MkloVUNWU1Rkdm9lakx3UVNSSXExYUVCRlhkVTlld0Z0MDMyVUpuek1PTGZ0?=
 =?utf-8?B?bUhvUVJDdit5SFlIMU14MExTWi9FRjNtOVFsRUMzT0FUR1VyWGxKQ0tNSmJl?=
 =?utf-8?B?bk9MZFpEczhDN3Y0dEFHVEIvWmxLZm9sRTBSWDBjM1BqTEU2ME53cjlSWSs1?=
 =?utf-8?B?Q2RaVTNhWUhaSnZXaFgyUVRReGNGeEdDVGxrRDBBVnlTM2pzTUh0NXdlVk1E?=
 =?utf-8?B?MmgvRERldExWYVIxVFZpVWJhNDNiVGFta2pITGdlcUNDZCtyVnF5R0kxMzFa?=
 =?utf-8?B?NmdvOE5lUXJwZUxwTm1vNEcwQXdDenpXby9RL01WekI2QUgvY2p5bmpGK3g2?=
 =?utf-8?B?TG9vdzA3a2tLYnNyVFV6WWFHV2d1YUErTzg0TlF3cmNLNFVNL3pqZGdTc0Mz?=
 =?utf-8?B?eHBQRWk5bDVwZCs4N2cwNUhoTEpKanYwOVBZQ1d4WTArSEhGVW9CVkgzalpB?=
 =?utf-8?B?Z2xhdGVaamdNT0NteFpIR25LM1FCdUtnWUNYTVZlMjNKWUc2ZCtadGppRFdD?=
 =?utf-8?B?UEJSQlpZdHQ0Yjhock9hUUcxTmd1WGY4MU8rbEJMWTc3bCtZM1A2TG1JdG9D?=
 =?utf-8?B?N2tyemwyWW90S3NCS2pudUw4Rm80WDFqSUlSdGR4YjQrRENyT05jbUlmbWVt?=
 =?utf-8?B?UElINmNORlV2MXk2NUJmOHJaRGxld21rMEorQ3dRdmVkZWNGcncvMDFvcU14?=
 =?utf-8?B?dnRHSmUzeFFjaU5mTU5zYmxKdXpoS0pubWNUUWgxejBoRmVpUkZGa2FFOFE1?=
 =?utf-8?B?MlZsU3JxbHRYaEFjalZrbFZhaXk3VFRsQTVDdW80V2pFR0xucFJYYlZSZWVa?=
 =?utf-8?B?M0V6Mkhsdis3SVBOc2ZYWldUcUhHNlVLcGRzelpETXcvY3dxbHE4aDNQNFRI?=
 =?utf-8?B?YzNsVVUyeUViU2FUV1pFQVVsYmsxdGJMNmNxZG5WVkxDK0p4ZnBrNUZDTmJD?=
 =?utf-8?B?LzFSQm5XK3psai8zM1VLUG1haFd4WFI5bzF2dVdOMk82enFWdzlub0ZxcDU5?=
 =?utf-8?B?d2h4NUpkOXBJaUc1UTlRZ2J2OTMxU0tPWE5kZWZZQ3p0USsxWGdJSkQ2U1ZM?=
 =?utf-8?B?Y3RGVmpFTVljazR4blByMnZlU1E1ZGVRUnZHNE1jMi9GU0lrYlIwZ0pyMi9I?=
 =?utf-8?B?UjFsRmtwTUxuczBCY3BxVG4zSWRMQ3BYVnRqUUc3SkhvYlNnTW1uMVYvTHJk?=
 =?utf-8?B?QXl5SDJ5bGdLRUJDUDVNTjkzTHN5aGswR3VTcjh1U0JzS0VPc1lSK1U3UU5o?=
 =?utf-8?Q?6xKc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF1FAFCFA9425C4DAE231777B1DD9132@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05089407-9b0a-4370-0d72-08dc8ac89ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 10:15:44.0832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voKbKBJe5p8MbvIF2XMvr5wYjW9F0t6RS+gxPY2+sjJQK7mMGDsJFIFhtz6jHzeqiLwJyza9YCaPHIcoYGuFnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481

T24gMjAyNC82LzEyIDE3OjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNCAx
MTowNywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzEyIDE2OjUzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI0IDA0OjQzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xMCAyMzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAw
Ny4wNi4yMDI0IDEwOjExLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiBJZiBydW4gWGVuIHdp
dGggUFZIIGRvbTAgYW5kIGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJxIGZvcg0KPj4+Pj4+
IGEgcGFzc3Rocm91Z2ggZGV2aWNlIGJ5IHVzaW5nIGdzaSwgc2VlIHFlbXUgY29kZQ0KPj4+Pj4+
IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlDQo+Pj4+
Pj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlzZGV2X21hcF9waXJxLiBUaGVuIHhjX3BoeXNkZXZf
bWFwX3BpcnENCj4+Pj4+PiB3aWxsIGNhbGwgaW50byBYZW4sIGJ1dCBpbiBodm1fcGh5c2Rldl9v
cCwgUEhZU0RFVk9QX21hcF9waXJxDQo+Pj4+Pj4gaXMgbm90IGFsbG93ZWQgYmVjYXVzZSBjdXJy
ZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4+Pj4+IFg4Nl9FTVVfVVNFX1BJUlEgZmxh
ZywgaXQgd2lsbCBmYWlsIGF0IGhhc19waXJxIGNoZWNrLg0KPj4+Pj4+DQo+Pj4+Pj4gU28sIGFs
bG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93DQo+
Pj4+Pj4gUEhZU0RFVk9QX3VubWFwX3BpcnEgZm9yIHRoZSBmYWlsZWQgcGF0aCB0byB1bm1hcCBw
aXJxLiBBbmQNCj4+Pj4+PiBhZGQgYSBuZXcgY2hlY2sgdG8gcHJldmVudCBzZWxmIG1hcCB3aGVu
IHN1YmplY3QgZG9tYWluIGhhcyBubw0KPj4+Pj4+IFBJUlEgZmxhZy4NCj4+Pj4+Pg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+Pj4gUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+
Pj4+DQo+Pj4+PiBXaGF0J3MgaW1vIG1pc3NpbmcgaW4gdGhlIGRlc2NyaXB0aW9uIGlzIGEgY2xh
cmlmaWNhdGlvbiAvIGp1c3RpZmljYXRpb24gb2YNCj4+Pj4+IHdoeSBpdCBpcyBnb2luZyB0byBi
ZSBhIGdvb2QgaWRlYSAob3IgYXQgbGVhc3QgYW4gYWNjZXB0YWJsZSBvbmUpIHRvIGV4cG9zZQ0K
Pj4+Pj4gdGhlIGNvbmNlcHQgb2YgUElSUXMgdG8gUFZILiBJZiBJJ20gbm90IG1pc3Rha2VuIHRo
YXQgY29uY2VwdCBzbyBmYXIgaGFzDQo+Pj4+PiBiZWVuIGVudGlyZWx5IGEgUFYgb25lLg0KPj4+
PiBJIGRpZG4ndCB3YW50IHRvIGV4cG9zZSB0aGUgY29uY2VwdCBvZiBQSVJRcyB0byBQVkguDQo+
Pj4+IEkgZGlkIHRoaXMgcGF0Y2ggaXMgZm9yIEhWTSB0aGF0IHVzZSBQSVJRcywgd2hhdCBJIHNh
aWQgaW4gY29tbWl0IG1lc3NhZ2UgaXMgSFZNIHdpbGwgbWFwIGEgcGlycSBmb3IgZ3NpLCBub3Qg
UFZILg0KPj4+PiBGb3IgdGhlIG9yaWdpbmFsIGNvZGUsIGl0IGNoZWNrcyAiICFoYXNfcGlycShj
dXJyZCkiLCBidXQgY3VycmQgaXMgUFZIIGRvbTAsIHNvIGl0IGZhaWxlZC4gU28gSSBuZWVkIHRv
IGFsbG93IFBIWVNERVZPUF9tYXBfcGlycQ0KPj4+PiBldmVuIGN1cnJkIGhhcyBubyBQSVJRcywg
YnV0IHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMuDQo+Pj4NCj4+PiBCdXQgdGhhdCdzIG5vdCB3aGF0
IHlvdSdyZSBlbmZvcmNpbmcgaW4gZG9fcGh5c2Rldl9vcCgpLiBUaGVyZSB5b3Ugb25seQ0KPj4+
IHByZXZlbnQgc2VsZi1tYXBwaW5nLiBJZiBJJ20gbm90IG1pc3Rha2VuIGFsbCB5b3UgbmVlZCB0
byBkbyBpcyBkcm9wIHRoZQ0KPj4+ICJkID09IGN1cnJlbnQtPmRvbWFpbiIgY2hlY2tzIGZyb20g
dGhvc2UgY29uZGl0aW9uYWxzLg0KPj4gV2hhdCBJIHdhbnQgaXMgdG8gYWxsb3cgUEhZU0RFVk9Q
X21hcF9waXJxIHdoZW4gY3VycmQgZG9lc24ndCBoYXZlIFBJUlFzLCBidXQgc3ViamVjdCBkb21h
aW4gaGFzLg0KPj4gVGhlbiBJIGp1c3QgYWRkICJicmVhayIgaW4gaHZtX3BoeXNkZXZfb3Agd2l0
aG91dCBhbnkgY2hlY2tzLCB0aGF0IHdpbGwgY2F1c2Ugc2VsZi1tYXBwaW5nIHByb2JsZW1zLg0K
Pj4gQW5kIGluIHByZXZpb3VzIG1haWwgdGhyZWFkLCB5b3Ugc3VnZ2VzdGVkIG1lIHRvIHByZXZl
bnQgc2VsZi1tYXBwaW5nIHdoZW4gc3ViamVjdCBkb21haW4gZG9lc24ndCBoYXZlIFBJUlFzLg0K
Pj4gU28gSSBhZGRlZCBjaGVja3MgaW4gZG9fcGh5c2Rldl9vcC4NCj4gDQo+IFNlbGYtbWFwcGlu
ZyB3YXMgYSBwcmltYXJ5IGNvbmNlcm4gb2YgbWluZS4gWWV0IHdoeSBkZWFsIHdpdGggb25seSBh
IHN1YnNldA0KPiBvZiB3aGF0IG5lZWRzIHByZXZlbnRpbmcsIHdoZW4gZ2VuZXJhbGl6aW5nIHRo
aW5ncyBhY3R1YWxseSBjYW4gYmUgZG9uZSBieQ0KPiBoYXZpbmcgbGVzcyBjb2RlLg0KTWFrZSBz
ZW5zZS4gSSB3aWxsIHJlYmFzZSB0aGUgYnJhbmNoIG9uY2UgeW91ciBjb2RlcyBhcmUgbWVyZ2Vk
Lg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

