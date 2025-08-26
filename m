Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3BB354B0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 08:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093952.1449312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqnK3-0000LT-QP; Tue, 26 Aug 2025 06:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093952.1449312; Tue, 26 Aug 2025 06:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqnK3-0000IN-NU; Tue, 26 Aug 2025 06:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1093952;
 Tue, 26 Aug 2025 06:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofj+=3G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uqnK2-0000IF-HM
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 06:38:22 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd2a7ec-8247-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 08:38:18 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Tue, 26 Aug 2025 06:38:14 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:38:14 +0000
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
X-Inumbo-ID: 3fd2a7ec-8247-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqw0vJ1ZATPOB4u4TEakZradzWARhL4NaJt1Kq3B8CLQhPM34gBJDud2niipp+0U+Ih+8N+vI9wSA0f9P1Y6NjS/dYmE5EXb2KfxXlcurU1PjHxS9TetBgExy2UrMQXMhtAijFnL05vng1WxPKbUs/M0WPkGUcidWSsNRm5CjgZAFvd/n3i/NYVEixO7cUhZokvJ4namyEy5NKMsQogaJGTdbPpWxOqNpqRdcVXp8aqji6hkrq6Ss8J7yW8oSU74bSjsYwSLO2LV/0wTwGsCedG6QI+yFTNIgL+jzTOqBOOzSIAlCzcz8x00BHMRWVQRf/qcGdGyEb8R2BNh35Ri5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JDAyhNEYcizKqFUk0EPOwdXCUxJGSSMjwEfXu2PTSQ=;
 b=qmhRPxTCyD2OmFD7+RcdEPdCgmfk6fG07vOMQAcu/zxAHdewOeodHRpGrR5r8liVusxWx36srrvQFLGulyxHJ4BS88Hpibf7lwSayZzXASfXLV7BMMY2/JNis6rHZBx9hRPvKyzw7+3/qCmJ6REvVnEeodEGtBS5J2EsuP3KYRF/wfmpA2sLdtNirSGlppYY8goKGDeGKACQJW3re2Dls1B1Uf5NWQdWYyVK8LFpQyR1zPNzYYYHVsSZxE5flaXDwEAlRWYeB57Sw8Ei0n6ODzftwTgKRlMKuHgoSpNf9kt6dvNiUtyc1+j5Z2EwJEgSIbC3QA5cz6uja5hS6g6e3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JDAyhNEYcizKqFUk0EPOwdXCUxJGSSMjwEfXu2PTSQ=;
 b=S+F0xZ2H2HLkdiMl+CBw3Ube7ZBgsapDMuQSW4Osj4lkXYeZIMVbXMJBsWnedjITDGfqhpob0kaeHAJWTXMSsznYzLBk/um5HyxSXnBQL4Pz5EA+0ExrvpHDAJ0ERL6qBW+tnKUOFYvuRtd8yW+ZSG0jTwMdNTkxepNzmzr05TM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 06/13] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v7 06/13] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHcE1LptmiQN44PAkOVJ+f0CssQOrRze76AgADdVjCAAB1GgIAABDZw
Date: Tue, 26 Aug 2025 06:38:14 +0000
Message-ID:
 <DM4PR12MB8451C39AAB9C6AD591268552E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-7-Penny.Zheng@amd.com>
 <a4c5e149-828f-4ea9-83e2-79ecc8c56033@suse.com>
 <DM4PR12MB845136B4B4FA756EC654FE31E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <927867b4-0cda-4600-b880-e5b1d9c2fbbf@suse.com>
In-Reply-To: <927867b4-0cda-4600-b880-e5b1d9c2fbbf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-26T06:32:52.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB6558:EE_
x-ms-office365-filtering-correlation-id: d0838a54-1677-4dee-9d38-08dde46b2216
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eG5pcDZrS2ovNGx6M2NDeFVVcFZhK1VNNzRvbHhqUXRtSTRTSFM3dTJzOTVR?=
 =?utf-8?B?dGhhcThTZTlHK0YyY2pOT3hOUEhmdWhhVytYdDNuZWcyQm0veU95QnczR3ZZ?=
 =?utf-8?B?WmNTZytCcDZrYzgxcjhCVWU4Q01McUpjMTZ6MU9WV0ZkdjBuNzUzWEt5ZEFY?=
 =?utf-8?B?VDZYNW1lWXdPdmlkVnN0UVBHQ1NEVk5ub2lET0NUemJmT05XZkZoTXhiTGw3?=
 =?utf-8?B?UWdnWUZ2OGliZm41ZkI2Q2RTL09wanlpVjl6dlMzZVR4M1lvc0pQS1hiVkFD?=
 =?utf-8?B?OGxCaSs4c3RUTHluVjFla09jSTJBM1BaNThreUV5bkRUMGZ1MWhYWENiamJl?=
 =?utf-8?B?TGM3Ym9JSTFKOEVZUS9kQTlGYkExcWRXRm5YSmJjSyt5bFYvN0ZuVHo2UmpD?=
 =?utf-8?B?bTB5NTRYRERFYklrbGJuK1l3YnBxTzJwMTFzSno3N2hMREc1MmgyOENiUm1q?=
 =?utf-8?B?Ri9CclVEMnBnWDhLc1FSUUZCNk9YWUJzU2pMR0NrWUxqWGEzTlZlcjY3cU9h?=
 =?utf-8?B?aHFoR01qQjNib1FoSjcwamlyeUhQeWtqazFuZnhYTXBEeWxCaXE1Wk56M1FV?=
 =?utf-8?B?MVNIYU4wZDdqSEpNMmpzOUlGVkZkZkxaRE5TakpkcTNRYjRMSlN2c3NiQU4y?=
 =?utf-8?B?VDlBNDd4YkIycnMzR2lRV2pmenpCNlFwSVZWTGtsMU8ySkhsZUd5RHhTOENQ?=
 =?utf-8?B?VmQ3MENBYjNnWGpnNlpRK3pNQUEvRnljWFNBRHJYUThqc1hRWVRKZXErUEFK?=
 =?utf-8?B?U0E5YUYwZUVJSjFRWldkVm8zK0FiWjB0SWtXQnJWbGtydjdPcWgydk9uTmVq?=
 =?utf-8?B?aEJSc09wbTFOSWxDUW9SNjJINjhxL1E2djlhSmF3MytrdWd3MVFYSjRpRGk1?=
 =?utf-8?B?bEluNEx4YklZVzVUWGlPM3l6bE12N1NCRlJRbjRKaHI0d211U1hIa1IrSVlO?=
 =?utf-8?B?Y0dQY3NsYVN5dFl4WUxDZGliaW50WG9Hb21CUytPZzdkNEhlL1ZXNnF4UEtX?=
 =?utf-8?B?WEhFd0UwTkQwdEJXN0tydksveHc4VS9pMnZuQjR0SWVrc1BEeklRVDNOUjRP?=
 =?utf-8?B?ZU50d1NENVM5U1hyRmdUbHM2MGg0Nm9FdEpkdm4xc0l5MVF4d0F5TVJPSDJB?=
 =?utf-8?B?S1U0STNEQU1DMC9SVjFNdHM2T1BRUjg3Rkl5UTVSbmZLaTVJSTNWelNxQ0Fz?=
 =?utf-8?B?SVNxV1Q5QldySU9FNGMwZGVJMFd2eVZlWDhZMWdRcUU0b1dVV2xZajIrQTJG?=
 =?utf-8?B?N21GZHVERkNwYUxwaUp5TVRaTndNNldGa2lxQjgxMjFXWmlnd1d3ckhQNGUy?=
 =?utf-8?B?ZFo0SzNaMjNZQ1hIa0dkL1pLT1NxaVd0YTBDd05kd2UzSXlISXJLQThQdjZ0?=
 =?utf-8?B?bHFxeWsyZGVOdzh2a2pVVW1ZY3ZPNkk4eVlSOG9ldVdVd2lJS2g2VDAyNHlC?=
 =?utf-8?B?Nk1JTTNmU1dJTmZkbHFCNGxSSkYwczBjUFBkckJVdGhobU9td2U5QnJBNVN0?=
 =?utf-8?B?VnQ3NjZDSjhkYW5KUkljdTJPaGJYa1AvSXNJcThBQXROUUl6V2tLWHpMV21X?=
 =?utf-8?B?SGZDclcyS3FTY0ZmNHpzdE1PQlgzWXhRR2NUTW41U3RER1JDNTN1K3FqREUx?=
 =?utf-8?B?NDE2Vis2Vk5rOVNLMDN5TXJKWUU5K0FPdVFHQkgzcVFvOWdaZHNiYzcwQ0JB?=
 =?utf-8?B?amdrbHZLYlpwODRsMEowVkRFeEdGRDNvaEt2Tm5HMzNaV0Qva0o5bVVOdmtS?=
 =?utf-8?B?VmoyOVNEaWF4bDFNOXNaaXNqbGVnaXR6ZW12ZUVYdUIxdWVtTkVHZFg3VTdi?=
 =?utf-8?B?VXY5YXZibTZ6Y0kvQXRHdkRvdlA1emRvZmFRM1l4akpnY0lNVDRRdlNYRURH?=
 =?utf-8?B?T3BoZFF4cEh5MVU2dzZPWlcvWFNSSWVEa1E3MnFFNS9uWTBiUlZwcjJhT09a?=
 =?utf-8?Q?H0/zqKIhT+I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2FVN25vRlpGZ0Z4QXJ0Y1JTVEF2Sko4VHFlV2swRXhOOTM4N0N1elB1R0FN?=
 =?utf-8?B?a1VNOU5HL1k4Z0FTVzcwY3ZldmRkOW4vcmhCc244QVhkZ3BIeDdVQ2RXcExm?=
 =?utf-8?B?OGRrU3hkRUwzdmJtcS8wWTFtelM2RUpuSy8rdmRCMXdML0p3YnNLeERlOUY1?=
 =?utf-8?B?NXVuRG1GR0JFNXU4eXg2aVZSazI2Sy90ZlpZeGxQL2ZWSThVaUp4bnczeml3?=
 =?utf-8?B?ZmlkaEhHcHQ5VCtMeW5STkFyNHNieXpyVGxLQ1V1VmREZzFIN3FtVXRnS1V6?=
 =?utf-8?B?TmZudngvSjBGc3B6UkFhajVJY1VpSENuNHJVYmxKNlcrZjVMTW5LNWQ4U3BZ?=
 =?utf-8?B?U01YT0VHb1FldTdkSHlLbmovOUF4aVc0MlRwM01IeGcwVVcxVjJ1Q3RzbkV2?=
 =?utf-8?B?K0VMVjI2NlNmWDFaeVRmVkt5QnF3ay9ZSGFOYUhQZWpJL3c2UGFnL1B2RmFZ?=
 =?utf-8?B?c0U4cHM5dHVydzUrRTF3dzM5aHgwVlc3ZExtR2ZGeWNRN0dMVml1aTZ2Nkkx?=
 =?utf-8?B?YjQ1QjVyNjVjVDJLeHM3MmQvRVQ4VkVyeGtyK3RDcXQxWDgzRXNOdDhmcmhz?=
 =?utf-8?B?NGlrTGhLdmNuYjVqR3U0STBkWUVHZGsvV2J0MHVicWxsbDBSaCtRWEMrbzZr?=
 =?utf-8?B?ZVV5clAvNVhGeEZSa2JoOUNEK0tydkVZdytzRFRNOU5sM3V0ZnEyZ2ZSckpT?=
 =?utf-8?B?cGxTUXlybUlBS0RuMS9kdjAvejl4SEd5YVA5bEQzNUEwbGM2NlEzeHpsQjJH?=
 =?utf-8?B?M0ttNU40UXR5dFc5MEhPYlcxY2orME11bGtZdlUvb3NoMVR4ZDNnM3pjc0k5?=
 =?utf-8?B?Y1BxNW84UUx2SStrS2pZSHJpYktjb01LaHMyTktYUTdEZG1UWURaUGN6N2VF?=
 =?utf-8?B?OVpwTVJkUENrQ0VtOSs0Sk5LalZtRXJ6dHZTNW54d3o2UTZzRUQrZlRja0Vn?=
 =?utf-8?B?M2hzMmJWSGRJSmJLc3QwdGxadzNNUFh6amEwY1RoT1JPaXdZS2g1RHBPM3pt?=
 =?utf-8?B?emtYY0pMc2pYOGNkNHI5VzlST3prcWJkTTVlb1FWbGxnd0xpQWFYc0NyaWVu?=
 =?utf-8?B?aXRTOHd0VUlzL2NRdVd5cnBrNTE5Tk1mSmxjZ3UydkF6dzFjdjZZQXNCZ0tX?=
 =?utf-8?B?L0kzeHQ5Vm9SMlVxUmpLZTBOLzBFR3VXOHV6ZHArcFhhRHFYeTRlRzlsNGJv?=
 =?utf-8?B?c1MydDgxN1lRb1NjTmdRVk03cGpsUVRGTjFRTXV3Zm9vNndaaFZHdjliNGFG?=
 =?utf-8?B?UXZHTzA1OG1wWWhBUmlCN1hvVm80T3Q3My8ycUVqcjVQOHBJUG83S2RiOVpv?=
 =?utf-8?B?UStFdTZyZHlDSjdTM2tpQ1Q1UVFDNFdSSXJiaytIcUtOWWJZU3QzMlhMMVBs?=
 =?utf-8?B?eHhVY0J2Sm5QV3NORTM4MFhKMzk5eGFnNitxd0xYSnJoN3hZMFpweURxM245?=
 =?utf-8?B?dTFRVVdzS1YyTFVIajBrbFNEQm83aThoSzBvQjdRTkZXZ2d6LzMyeDd5UExD?=
 =?utf-8?B?V2NWYmJ2TlREMHlaU3ZmNWdDMUIyOFkrMlZ1cHBwZEc4K3pQaHAwK0ExTng4?=
 =?utf-8?B?Z2EyZlU2MDdKTk5YV215b0ZIbnUrWm9nUHBYZHZSODlqeGNhckJxN1BUc3pS?=
 =?utf-8?B?MFVETG5WS3l4WVFDRXdjMWRZWFVTV2tiYlNVQU44QkVUOFRyYkF2bWdHWTRJ?=
 =?utf-8?B?WEUwT3ZBMlZvUXpqYi9WTmNSOVJtcXV4NWc2SWR1Q3RmNGc5UU5IZUt5OWNq?=
 =?utf-8?B?YTFZWXYyLzRiekFKdmwvZHVQTk1YVEgrQWhWNHFsZFJkYkFxUUYycjdPVnBq?=
 =?utf-8?B?Njc3WlVlVlByZnYzY0F3SWdKN1RUeDRkU1pMaS9xSXY5emFNQy92NjEvaFAw?=
 =?utf-8?B?dlgxa2tJVCs2Vi9BTUhIQ0M2cE5KM25xaW9DSU9LS2lMRVBOSW1aSEZqbHdV?=
 =?utf-8?B?SjNJRW1nZkdEMzZ1VnMwcFlkc0dZRzFrSW90bmkvTmVTOFI1NXRXQnYwdUc0?=
 =?utf-8?B?dUVlTmpSaDFZOVdrRndGTmVSN3ZGRC9rdXhpZUFFSE5icnllaWJRWnJwZ01F?=
 =?utf-8?B?Z0lXV0pHZll2Y2dBaFhpMzdLaGYxdDBZMWQ2MWZmOW5pT3hlWlpHcFpveW9y?=
 =?utf-8?Q?2GIk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0838a54-1677-4dee-9d38-08dde46b2216
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 06:38:14.0713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/KZm3VEjW/5p6Z3fIKP3bvZKekNew0vz1jWJCuiDX6V5Id4B5KTMGzof4TWl20325HQYYtqtY05YJvUJ6J4IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNiwgMjAy
NSAxOjU5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djcgMDYvMTNdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8NCj4g
cHJvcGFnYXRlIENQUEMgZGF0YQ0KPg0KPiBPbiAyNi4wOC4yMDI1IDA3OjUzLCBQZW5ueSwgWmhl
bmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IE1vbmRheSwgQXVndXN0IDI1LCAyMDI1IDExOjAyIFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhl
bmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdA
YW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+ID4+IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbA0KPiA+PiA8
TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3Rl
ZmFubw0KPiA+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMDYvMTNd
IHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgbmV3DQo+ID4+IHN1Yi1oeXBlcmNhbGwgdG8gcHJvcGFn
YXRlIENQUEMgZGF0YQ0KPiA+Pg0KPiA+PiBPbiAyMi4wOC4yMDI1IDEyOjUyLCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY3B1ZnJlcS5jDQo+ID4+
PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2NwdWZyZXEuYw0KPiA+Pj4gQEAgLTU0LDMgKzU0
LDIyIEBAIGludCBjb21wYXRfc2V0X3B4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lkLA0KPiA+Pj4N
Cj4gPj4+ICAgICAgcmV0dXJuIHNldF9weF9wbWluZm8oYWNwaV9pZCwgeGVuX3BlcmYpOyAgfQ0K
PiA+Pj4gKw0KPiA+Pj4gK2ludCBjb21wYXRfc2V0X2NwcGNfcG1pbmZvKHVuc2lnbmVkIGludCBh
Y3BpX2lkLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBj
b21wYXRfcHJvY2Vzc29yX2NwcGMNCj4gPj4+ICsqY3BwY19kYXRhKQ0KPiA+Pj4gKw0KPiA+Pj4g
K3sNCj4gPj4+ICsgICAgc3RydWN0IHhlbl9wcm9jZXNzb3JfY3BwYyAqeGVuX2NwcGM7DQo+ID4+
PiArICAgIHVuc2lnbmVkIGxvbmcgeGxhdF9wYWdlX2N1cnJlbnQ7DQo+ID4+PiArDQo+ID4+PiAr
ICAgIHhsYXRfbWFsbG9jX2luaXQoeGxhdF9wYWdlX2N1cnJlbnQpOw0KPiA+Pj4gKw0KPiA+Pj4g
KyAgICB4ZW5fY3BwYyA9IHhsYXRfbWFsbG9jX2FycmF5KHhsYXRfcGFnZV9jdXJyZW50LA0KPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fcHJvY2Vzc29y
X2NwcGMsIDEpOw0KPiA+Pj4gKyAgICBpZiAoIHVubGlrZWx5KHhlbl9jcHBjID09IE5VTEwpICkN
Cj4gPj4+ICsgICAgICAgIHJldHVybiAtRUZBVUxUOw0KPiA+Pg0KPiA+PiBJIHRoaW5rIHdlIHdh
bnQgdG8gYXZvaWQgcmVwZWF0aW5nIHRoZSBlYXJsaWVyIG1pc3Rha2Ugd2l0aCB1c2luZyBhIHdy
b25nIGVycm9yDQo+IGNvZGUuDQo+ID4+IEl0J3MgRU5PTUVNIG9yIEVOT1NQQyBvciBzb21lIHN1
Y2guDQo+ID4+DQo+ID4NCj4gPiBVbmRlcnN0b29kLCBJJ2xsIGNoYW5nZSBpdCB0byAtRU5PTUVN
DQo+ID4NCj4gPj4+IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvcG0tb3AuYw0KPiA+Pj4gKysrIGIv
eGVuL2RyaXZlcnMvYWNwaS9wbS1vcC5jDQo+ID4+PiBAQCAtOTEsNyArOTEsOSBAQCBzdGF0aWMg
aW50IGdldF9jcHVmcmVxX3BhcmEoc3RydWN0IHhlbl9zeXNjdGxfcG1fb3ANCj4gKm9wKQ0KPiA+
Pj4gICAgICBwbXB0ID0gcHJvY2Vzc29yX3BtaW5mb1tvcC0+Y3B1aWRdOw0KPiA+Pj4gICAgICBw
b2xpY3kgPSBwZXJfY3B1KGNwdWZyZXFfY3B1X3BvbGljeSwgb3AtPmNwdWlkKTsNCj4gPj4+DQo+
ID4+PiAtICAgIGlmICggIXBtcHQgfHwgIXBtcHQtPnBlcmYuc3RhdGVzIHx8DQo+ID4+PiArICAg
IGlmICggIXBtcHQgfHwNCj4gPj4+ICsgICAgICAgICAoKHBtcHQtPmluaXQgJiBYRU5fUFhfSU5J
VCkgJiYgIXBtcHQtPnBlcmYuc3RhdGVzKSB8fA0KPiA+Pj4gKyAgICAgICAgICgocG1wdC0+aW5p
dCAmIFhFTl9DUFBDX0lOSVQpICYmIHBtcHQtPnBlcmYuc3RhdGVfY291bnQpDQo+ID4+PiArIHx8
DQo+ID4+DQo+ID4+IEkgZmVhciBJIGRvbid0IHVuZGVyc3RhbmQgdGhpczogSW4gdGhlIFBYIGNh
c2Ugd2UgY2hlY2sgd2hldGhlcg0KPiA+PiBuZWNlc3NhcnkgZGF0YSBpcyBsYWNraW5nLiBJbiB0
aGUgQ1BQQyBjYXNlIHlvdSBjaGVjayB0aGF0IHNvbWUgZGF0YQ0KPiA+PiB3YXMgcHJvdmlkZWQg
dGhhdCB3ZSBkb24ndCB3YW50IHRvIHVzZT8gV2h5IG5vdCBzaW1pbGFybHkgY2hlY2sgdGhhdCBk
YXRhIHdlDQo+IG5lZWQgd2FzIHByb3ZpZGVkPw0KPiA+Pg0KPiA+DQo+ID4gV2UgYXJlIGludHJv
ZHVjaW5nIGFub3RoZXIgY2hlY2tpbmcgbGluZSBmb3IgQ1BQQyBpcyBhY3R1YWxseSB0byBhdm9p
ZCBOVUxMDQo+IGRlcmVmIG9mIHN0YXRlW2ldOg0KPiA+IGBgYA0KPiA+ICAgICAgICAgZm9yICgg
aSA9IDA7IGkgPCBvcC0+dS5nZXRfcGFyYS5mcmVxX251bTsgaSsrICkNCj4gPiAgICAgICAgICAg
ICAgICAgZGF0YVtpXSA9IHBtcHQtPnBlcmYuc3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAw
MDsNCj4gPiBgYGAgV2Ugd2FudCB0byBlbnN1cmUgIm9wLT51LmdldF9wYXJhLmZyZXFfbnVtIiBp
cyBhbHdheXMgemVybyBpbiBDUFBDDQo+ID4gbW9kZSwgd2hpY2ggaXMgdmFsaWRhdGVkIGFnYWlu
c3QgcG1wdC0+cGVyZi5zdGF0ZV9jb3VudC4NCj4gPiBXZSBoYXZlIHNpbWlsYXIgZGlzY3Vzc2lv
biBpbiBoZXJlDQo+ID4gaHR0cHM6Ly9vbGQtbGlzdC1hcmNoaXZlcy54ZW4ub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMA0KPiA+IDExNjAuaHRtbA0KPg0KPiBJbmRlZWQg
SSB3YXMgdGhpbmtpbmcgdGhhdCB3ZSB3b3VsZCBoYXZlIHRvdWNoZWQgdGhpcyBiZWZvcmUuIEFz
IHRvIHlvdXIgcmVwbHk6DQo+IFRoaXMgZXhwbGFpbnMgdGhlIC5zdGF0ZV9jb3VudCBjaGVjayAo
d2hpY2ggaW1vIHdhbnRzIGEgY29tbWVudCkuIEl0IGRvZXNuJ3QsDQoNClVuZGVyc3Rvb2QsIEkn
bGwgY29tcGxlbWVudA0KDQo+IGhvd2V2ZXIsIGV4cGxhaW4gdGhlIGFic2VuY2Ugb2YgYSAiaGF2
ZSB3ZSBnb3QgdGhlIGRhdGEgd2UgbmVlZCIgcGFydC4gVW5sZXNzIG9mDQo+IGNvdXJzZSB0aGVy
ZSBzaW1wbHkgaXNuJ3QgYW55dGhpbmcgdG8gY2hlY2sgZm9yLg0KPg0KDQpZZXMsIGltbywgdGhl
cmUgaXNu4oCZdCBhbnl0aGluZyB0byBjaGVjay4NCkluIGdldF9jcHVmcmVxX3BhcmEoKS4gd2Ug
YXJlIG5vdCBhY2Nlc3NpbmcgZGF0YSBzcGVjaWZpYyB0byBDUFBDLg0KDQo+IEphbg0K

