Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB4NJrGdcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:34:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44EC547AA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 10:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209530.1521510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUb5-0002gg-85; Wed, 21 Jan 2026 09:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209530.1521510; Wed, 21 Jan 2026 09:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUb5-0002fE-5F; Wed, 21 Jan 2026 09:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1209530;
 Wed, 21 Jan 2026 09:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8igF=72=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1viUb3-0002f8-VE
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 09:33:54 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aa5eb8c-f6ac-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 10:33:51 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:33:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:33:45 +0000
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
X-Inumbo-ID: 4aa5eb8c-f6ac-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyEQr2QgU2P69MdPuFWm81M9N49dOjPeAV6/lR/QO8+Lvb3yaFQISf+9Tf/yl0AD7WV07LTPN29sze4s98MGEoI6F1+CkFLbJxGcXbabMezSpnV0HpA6zHsy1faWJnYsm8u2PmJDsFJQJ2Y6W8xqautU19B4hCzRm47dRqsd3vw0IN00DsOGa1n+8pxuZAB1KIj0HBhfoEqM/oEwWtwWsPvICbt2+2dO+8o7h0n/NDWKEfYwqGPGqSGPOlkX//Ffsb+9wELxtJHSg6SoLc0RwVNkIvfoBr45s4RgAJOm6YBJMtFLzqGdNtw9/fUw8RUdoo0AbQKLx+DpEU+p+7vTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHDsPPZ6/dZq8EHsYQlXHVTlvVeY6Dm6FkYjz+rLXiA=;
 b=MxSM0SKOhK4iNt54Br/mRNmAXSTZTZK3CFlYtzYowOkHhSeE0zlPTP8buliSqoP6RhKxt8+C58t8w6lb3KORMIbloypqhPy33QTLQtoz1FiAc2SvF7CB5vWm+1EVdB6znJivMowbTR+ZnKNQJaAsd8c6evPCtMzNrJ2z7tviyYJGDXItkmr148P/bXhhCQ7ZYDjJNz7Z8JNLI2QWE9+IKvCxB4V4sNaZnbWeKLpQWO+jhuwvZ19344AljKQo9Bs7KoztDVTdGT8k6+9Zp25eLFjcg58PYOhsmkxOqlUoLaSMLEuv+ONewUp0NtJYfbC6AjfI3fbFaSVWimZCwx1b/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHDsPPZ6/dZq8EHsYQlXHVTlvVeY6Dm6FkYjz+rLXiA=;
 b=v7LF0zpvrGrTSMq8kKX6Xhb3QJv/t1X+YVz7oORF25pJIqEF4DRws/1iuoURqdNwRGdzdjZQ/vna7A4qft8rsPOcJoGn3VD1MjsTePcQ/uqP9tvg8Tmf/Mstu20SdwetRQBf2UxNVpYfix/X3/tKJnJsZmEbWcdKhhpHirOp4M8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RESEND PATCH v12 3/3] vpci/msix: Implement cleanup function for
 MSI-X
Thread-Topic: [RESEND PATCH v12 3/3] vpci/msix: Implement cleanup function for
 MSI-X
Thread-Index: AQHcaBtCn9gZDX/DWkaHFEYDT3YAlrVcn3CAgACGhwA=
Date: Wed, 21 Jan 2026 09:33:44 +0000
Message-ID:
 <BL1PR12MB5849398AE0A8B2F904864981E796A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
 <20251208081815.3105930-4-Jiqian.Chen@amd.com> <aXCbcbedaXpsM1HW@Mac.lan>
In-Reply-To: <aXCbcbedaXpsM1HW@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9542.003)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL1PR12MB5850:EE_
x-ms-office365-filtering-correlation-id: 249c40bd-4410-458c-b35e-08de58d02c14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MXdodEd3a2dHeURVNmpSK0JNU05xeDBxU0txaVRuenhYdnhuVjhrMWpiL3Zq?=
 =?utf-8?B?Rmt1ek5kb1I5cG9yZlVNWWRCYmVxNGZxQzFqUEl2Mkh4RDVCMDVLNGRRQUJx?=
 =?utf-8?B?Z0t4OUdrcHNQTzBwWW5vZzQwbWxwOGRvckNLUGxha0xGNitlNnJMUHRFVEUv?=
 =?utf-8?B?cUtFbUVxZlhMbUNxbmQvdFV6bnE0b2ZpQ2JFVGxzMjVTY3QxYjAwWFdOWHdk?=
 =?utf-8?B?d2FVeHR3Y2ZQMFhOa3pqaENxd09DTHdhbHRGY1hoQTBBbm55d1crMkUzUlc0?=
 =?utf-8?B?bjlWQ1RTTjR6dFRMYlplNEJVSDRQWFpBYlE4anpiUTgvbEpjQXhzY29lOTdC?=
 =?utf-8?B?QURHTERnOTBUeFNIL04zMkVDOElRSTI0ZVFRMngvR2g5VlFZZk9QbDR4dmlt?=
 =?utf-8?B?WXAvWDVBTjZJRVhDS2JSY0VTQWJZNUNUOU11VDU2bnk3a1hQc2p0Sm1wcysy?=
 =?utf-8?B?SDhnSDU0V0p0blRieWExUE5SdjE3SHk3WWNtUHlaczJZa1FuWWVpdklDUDd3?=
 =?utf-8?B?VUxOMVVhUU1tWFN0djY5amFhWndrSi9Ddzc0YW9EeHlYOTRTcXZOOFhYM2p0?=
 =?utf-8?B?TGxTa21zTXZ0d0FMQk1KejdGclArYW1Fbmt4WmRZODlxZzJYVFRxNzBHWVBq?=
 =?utf-8?B?Z2J2NjBPV3VjUzRuUm1lQ2M4cXgyOXBaWG53Q0pBWU41Ym9yeStVeHMrY0NZ?=
 =?utf-8?B?eVVEaTJnakNJU2JuTkV6K0MycU9TYURzMjFIZWNBREFpZ1E1SEtBRkVzQkRS?=
 =?utf-8?B?ZFA3SmR1MmFsdU40dlFSeFgrZ0wrb1RIdGxML0ZOcjdyb0JhenQ3QVViKy96?=
 =?utf-8?B?c2J3bEZvQ1dCMzlnbFphSUUxcThMdUZmaVpya0w3QzhaaytTeXNpMXF3amVB?=
 =?utf-8?B?MVhJQzZNQ0VzdHMyWERBMnBwaTRreFE4N2FOUlhTamRCNWhFZURFVmg5UnVF?=
 =?utf-8?B?U3dTZGpyeC96ZzRsUHJOa1Z6K2xjb1ZJVW5xZmlER0dtbzB1OEF1V25ONmhk?=
 =?utf-8?B?Vm95THB4Q1h2V2poZDZlZ0hMYnZRU0djbzhpVnkrMWZVL05ncFk3N1c0Qlhx?=
 =?utf-8?B?SG12WnR6QXIxVk8zUHQydkxRU0phblpsOEhlS2ZsY3g3K0ltb002VTdWMVAx?=
 =?utf-8?B?RVc0dXQ5ZVpvUVhBYXMxTDYva3E3WThNZG54d21qajBOTVBabFMvOHRrNjJi?=
 =?utf-8?B?NzdYY00xYVhOTU5DQjR3enltRDdWMWN3Y25oTWFaNEFnenU3T0J5WkxVLzhN?=
 =?utf-8?B?aFlYSzZtU1B6aUlmMVp0RFdLK0VsS05KK3BLQm9NWGEyVDY3dUVhMnpER1BR?=
 =?utf-8?B?dVZ2OHhwQ1BWTGRWckFCSFZ0aHoveUtibHFrU0E5djRrUzJSWWhidFdNZlZy?=
 =?utf-8?B?cSt4MEpYZTVXSmNyTG9qdURUS0FtbURRWU1jWHFxR2d2N1ByMkExZmc5NERk?=
 =?utf-8?B?WlMzRGVlbTZrMnVMcEwzTk9FRm5BWnpkU2Q3b1dHU0YzU0dKM1JvU3dvZWhX?=
 =?utf-8?B?dGRMTW83c2FnMk5LbGdvSVVLRkh1TDc3NjROSVAxMEgvMUZ1NUZoYzNHR1pq?=
 =?utf-8?B?RkEvUG56aXovM3F1WEk4eWxVZHVUTGJPVndWZnFBM2NLWXVrczQySFA4TXpr?=
 =?utf-8?B?QndQdE9IOEQvNy83aEFaSVpuS2YxVGI4RlJyV2drN1prdWM2VXh4bnR5K2xI?=
 =?utf-8?B?VmNEMXdRd3ByL0ptWDk3aG9CVURLYUdBN3lCa0ZNRW9ISUc1UGFkYnB0a3Nl?=
 =?utf-8?B?WngzWWFCVTBRTkdWQ0VCaWEwQTNoS1YrQkJXMEFGelZhSFJwQUIvamNwbFM3?=
 =?utf-8?B?RlJ4dzhlRFRiTm43WVZYeFdzSFE1WVpxMDMzRGJPTEFDVXl6N2w0clpzamlL?=
 =?utf-8?B?Sll1TUorNEhiUmVSRG9KOXovaHpWdUp2dWt3SldVS2J3VWdZTnVvNytHTGo3?=
 =?utf-8?B?MWNaWUNOdFh0c3oyZFBvZmxvVFVzd2QrMWRobjdPZG1iSk90OG4zWVo0Q3l2?=
 =?utf-8?B?b2xOOGJpZmlEb3pHb1VLVUhKUjBDTGJQZkVxV290MjhLODdCOWxaTkZwU215?=
 =?utf-8?B?YWNBZ2JHRjNZaGM4L0hNMXB6SjlvRVpTWFd0TmlVQWxRVTB6T2VvWjRqUThN?=
 =?utf-8?B?RVNNTkxlZ0pTd1R1c1haUXNUMTR2eTNWR1FLZlQyZDZob3ZRM0Fnem4ydWxO?=
 =?utf-8?Q?wm1BDugU6j52gXBR6H2SFJg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rjd5dmdaMFYrMndPbG9ITk4yczVzUHJaTUFMRm5nakFSU0lYbUlHSVJndHUw?=
 =?utf-8?B?alRDdzRFbDljNnB1bU8weXVZdFEzdXJNb1UyYmRGRElOT2IwY3BWbGo4cHox?=
 =?utf-8?B?bVRPbGZLNjFOendWaktnQ2YrM1JXb29NaGZxdnFxVGdPSTd6cVZHeHc2SzN4?=
 =?utf-8?B?emtLd0dFcTNNN0RNS1N0ZmNDTGNjSk5Ha2ROS2l1WWQ4MURhWitmZUtDdVJ1?=
 =?utf-8?B?VmJmMldONms3QnZLa05rK0V4UW5iay9IOXQ4Wm1PN2NWWmNpSEZ4dTM3bjd4?=
 =?utf-8?B?SGpITVBKOVJKaW5WZzhRSStBOXVrQmJ5cWxWQzMxbHJnMlBZV2Q3bHNIZ2I4?=
 =?utf-8?B?bjNndEFTZjdTcmRYbGVoblVRcGJ0THlTZng2VmtGZG1wdWVneTNrZ29PdGhl?=
 =?utf-8?B?ZWxLanIxKy9QVktjR2s3Z3hqaDdYdjJveERMeUFHaVl0akZscXp3WWwrd0Rq?=
 =?utf-8?B?dXFNU1dHRzZuSlFnNTFFck5sY25oa2VaT0drQ0ZYa29EaUwxWGxsWEdNdlFO?=
 =?utf-8?B?aG11cDNudUxJU2NUOWI1SlNHMjBlRUg5ZjJmZzQ2VTA3VTc0QXNtNGJIQ2kw?=
 =?utf-8?B?VVkzdUV1MG5kOEdLNzVVYWw5dnRvejhBc2IvbVFhVFp2NmEvbkYxZ2ZNZVRh?=
 =?utf-8?B?RW80UnF2TFBlT0Z2K3JjY2ZqS3E0Q3JDS1NvVitFb3o0NkZMQ2dPVDBPOUJp?=
 =?utf-8?B?cnVlYURJcDlvN2hmaWtFeDY1NjZNWi9oQi9Sa0hHdWp2M0N1OXNlUTVsL1RJ?=
 =?utf-8?B?TndzNG94Vk54QkZsVlFhMi9KZklWUy9GK1RKMXZYYzdzNkZlY21DTjNKekl6?=
 =?utf-8?B?aHdRYWhFU3p3Z1VDVGVnSjVJWFV6bWxJUmtyaW1nRTYxMkl6eEpmY1VhdXR2?=
 =?utf-8?B?cDlGYUNpK0NRWDFxdVREbkNhN2NTUFdMZjFVaVRVM2RYREtVUit6aUloYUFO?=
 =?utf-8?B?TWFEVnF6WW5BaVJzRVdVZ0JOVzZnTzhSNU5DdFFvS3VWcjRadVVSQmlQV0lh?=
 =?utf-8?B?U2RKRlJtbUEwTXR2QzBNcytvelhORVpyMWRndSsrVGZnRjRIeENxc0hqZTQ3?=
 =?utf-8?B?UWFXdzVwcWE2bEt2Z3lqWGt6enlIdmRyV3htZk9uRmMwQzJuenczTk9kSloy?=
 =?utf-8?B?U1FJSzdxbEUvaW0ybjhjMk1yWXhvT2p4bk4wRHh1NVQwS0hmMTVDL05NdnBQ?=
 =?utf-8?B?eTJKNmFzT283bDJ4ZTJKYWlKb2swWTdBaFdzYk5TNHpWdnlBZWRzRHh4TkZN?=
 =?utf-8?B?eVdoU3gvaHNWcmNmeVo4WEVwQ0JRWkZDVG1JMUFKN2ZyUHI4QXBMMFo0M2I4?=
 =?utf-8?B?NTNpT2NRQnR0dXJiSzdkK3NtZ3BxOG1HZDE2TGJJZGFDU2J3WU00bXlmT0Ez?=
 =?utf-8?B?UFJYUEhKRWZ1Q29JUjhFSE9TQzNSTDAvbjViZDdnMW1wZWR1NGVia2NraWh0?=
 =?utf-8?B?QmtDVzIrOUMzOWMyWjUyWTRwVWJVUUs3elhHWHJtNjE0TzMzWUhyS0hNdVJl?=
 =?utf-8?B?L2RpcW11dzFPd0kxMWhXYWcvT3UreS9IM0VFeHg5ZGFZdGMwcko4UXpydXdX?=
 =?utf-8?B?Vkp2M1VOa1JsTXYvOEhYWk1XZU5pb2tHM0huTk1uUitsU3J6cWEwcTlZTTl4?=
 =?utf-8?B?NCtpQ0JVaWZZVUJEMEw0ZS80Yk0xS0lTNWF5WW5taHRVTm9zTjlRQ0NkSzlj?=
 =?utf-8?B?dXBReXd6cDlxNVp3dmlXTVdDaUI0enVpSmsvZit3TVU0eWJueGpnRVd4YUpp?=
 =?utf-8?B?U00vSzJVVkRLbzZ5Lzl2NUVLSkJ0MUY4V1RxUS9LZzN0UTR3U1V0Z2V0Q1ZZ?=
 =?utf-8?B?ekY4RkRQMTc5YVRMSHlnaXVuZ2l6VnlGOFd2VEdYVmlCNVU3RFBBaGtKalFy?=
 =?utf-8?B?STJTeWV1aGRldWJWQ1pJZnpjMTZnWmZCU0RHYytqbXZSOFZDcmEvVjRPS2Y4?=
 =?utf-8?B?V1IwOGRJcFh5VTBwWjdKZUIyOHBsVVRER0xWcEl3ak1KQnVzWW9uOXMwK3hV?=
 =?utf-8?B?VTBXOGxLVjlXeWsrclR3V2V5ZzJpbzY1dTlEM2dwSWtWakc1SGZ6WWU1Y21F?=
 =?utf-8?B?VmIzNkluMEZqZ1pkN0s0am1KMkRaQS9QRXN4eEM2NmdOci9KTTg1dkR3Z3Bv?=
 =?utf-8?B?dzJVUEJMZ3RJQ0d1bW95dWFyU1B3Y2ZKa2IvV09ZZWdITXE1NE9Vbm1ROCtz?=
 =?utf-8?B?SE9Fcm1Ga3VuZkdDVWJIVHFQbVdMeXlZWXVHY0t0T0s3L2NqV0xqUVcxYjhP?=
 =?utf-8?B?amZGVUp4ZkNpMDI5a0tCS1F1MXNvcE8vdnNEQ3hoclEyNCtGRXdrOHN1Tzdq?=
 =?utf-8?Q?ta73w8ADB6ZOJ9n4bn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <357B352A7A389C46B633E7C93423262C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249c40bd-4410-458c-b35e-08de58d02c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 09:33:44.8966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8cSmM0AeeSBrS2D+iZMqbYaRz35rWHX0Si5RhSPRlUtmtxNEFvkL8CrkjNEnOJJf31Vu9TVBQjGo8Tl0Yxt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:Ray.Huang@amd.com,m:Jiqian.Chen@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Jiqian.Chen@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jiqian.Chen@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B44EC547AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8xLzIxIDE3OjI1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIERl
YyAwOCwgMjAyNSBhdCAwNDoxODoxNVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gTVNJLVggaW5pdGlhbGl6YXRpb24gZmFpbHMsIHZQQ0kgaGlkZXMgdGhlIGNhcGFiaWxpdHks
IGJ1dA0KPj4gcmVtb3ZpbmcgaGFuZGxlcnMgYW5kIGRhdGFzIHdvbid0IGJlIHBlcmZvcm1lZCB1
bnRpbCB0aGUgZGV2aWNlIGlzDQo+PiBkZWFzc2lnbmVkLiBTbywgaW1wbGVtZW50IE1TSS1YIGNs
ZWFudXAgaG9vayB0aGF0IHdpbGwgYmUgY2FsbGVkDQo+PiB0byBjbGVhbnVwIE1TSS1YIHJlbGF0
ZWQgaGFuZGxlcnMgYW5kIGZyZWUgaXQncyBhc3NvY2lhdGVkIGRhdGEgd2hlbg0KPj4gaW5pdGlh
bGl6YXRpb24gZmFpbHMuDQo+Pg0KPj4gU2luY2UgY2xlYW51cCBmdW5jdGlvbiBvZiBNU0ktWCBp
cyBpbXBsZW1lbnRlZCwgZGVsZXRlIHRoZSBvcGVuLWNvZGUNCj4+IGluIHZwY2lfZGVhc3NpZ25f
ZGV2aWNlKCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVu
QGFtZC5jb20+DQo+PiAtLS0NCj4+IGNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPj4gLS0tDQo+PiB2MTEtPnYxMiBjaGFuZ2VzOg0KPj4gKiBJbiBjbGVhbnVw
X21zaXgoKSwgbW92ZSBjaGVjayAiaWYgKCAhaGlkZSApIiBhYm92ZSB2cGNpX3JlbW92ZV9yZWdp
c3RlcnMoKS4NCj4+ICogUmVtb3ZlIHRoZSBjaGVjayAiIXBkZXYtPm1zaXhfcG9zIiBzaW5jZSBj
dXJyZW50IGNhbGxlcnMgYWxyZWFkeSBkbyB0aGF0Lg0KPj4NCj4+IHYxMC0+djExIGNoYW5nZXM6
DQo+PiAqIE1vdmUgY2FsbGluZyBhbGwgY2xlYW51cCBob29rIGluIHZwY2lfZGVhc3NpZ25fZGV2
aWNlKCkgb3V0IG9mIHRoaXMgcGF0Y2guDQo+PiAqIEFkZCBoaWRlIHBhcmFtZXRlciB0byBjbGVh
bnVwX21zaXgoKS4NCj4+ICogQ2hlY2sgaGlkZSwgaWYgaXQgaXMgZmFsc2UsIHJldHVybiBkaXJl
Y3RseSBpbnN0ZWFkIG9mIGxldHRpbmcgY3RybCBSTy4NCj4+DQo+PiB2OS0+djEwIGNoYW5nZXM6
DQo+PiAqIENhbGwgYWxsIGNsZWFudXAgaG9vayBpbiB2cGNpX2RlYXNzaWduX2RldmljZSgpIGlu
c3RlYWQgb2YgY2xlYW51cF9tc2l4KCkuDQo+Pg0KPj4gdjgtPnY5IGNoYW5nZXM6DQo+PiAqIE1v
ZGlmeSBjb21taXQgbWVzc2FnZS4NCj4+ICogQ2FsbCBjbGVhbnVwX21zaXgoKSBpbiB2cGNpX2Rl
YXNzaWduX2RldmljZSgpIHRvIHJlbW92ZSB0aGUgb3Blbi1jb2RlIHRvIGNsZWFudXAgbXNpeCBk
YXRhcy4NCj4+ICogSW4gY2xlYW51cF9tc2l4KCksIG1vdmUgImxpc3RfZGVsKCZ2cGNpLT5tc2l4
LT5uZXh0KTsiIGFib3ZlIGZvciBsb29wIG9mIGlvdW5tYXAgbXNpeCB0YWJsZXMuDQo+Pg0KPj4g
djctPnY4IGNoYW5nZXM6DQo+PiAqIEdpdmVuIHRoZSBjb2RlIGluIHZwY2lfcmVtb3ZlX3JlZ2lz
dGVycygpIGFuIGVycm9yIGluIHRoZSByZW1vdmFsIG9mDQo+PiAgIHJlZ2lzdGVycyB3b3VsZCBs
aWtlbHkgaW1wbHkgbWVtb3J5IGNvcnJ1cHRpb24sIGF0IHdoaWNoIHBvaW50IGl0J3MNCj4+ICAg
YmVzdCB0byBmdWxseSBkaXNhYmxlIHRoZSBkZXZpY2UuIFNvLCBSb2xsYmFjayB0aGUgbGFzdCB0
d28gbW9kaWZpY2F0aW9ucyBvZiB2Ny4NCj4+DQo+PiB2Ni0+djcgY2hhbmdlczoNCj4+ICogQ2hh
bmdlIHRoZSBwb2ludGVyIHBhcmFtZXRlciBvZiBjbGVhbnVwX21zaXgoKSB0byBiZSBjb25zdC4N
Cj4+ICogV2hlbiB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSBpbiBjbGVhbnVwX21zaXgoKSBmYWls
cywgbm90IHRvIHJldHVybg0KPj4gICBkaXJlY3RseSwgaW5zdGVhZCB0cnkgdG8gZnJlZSBtc2l4
IGFuZCByZS1hZGQgY3RybCBoYW5kbGVyLg0KPj4gKiBQYXNzIHBkZXYtPnZwY2kgaW50byB2cGNp
X2FkZF9yZWdpc3RlcigpIGluc3RlYWQgb2YgcGRldi0+dnBjaS0+bXNpeCBpbg0KPj4gICBpbml0
X21zaXgoKSBzaW5jZSB3ZSBuZWVkIHRoYXQgZXZlcnkgaGFuZGxlciByZWFsaXplIHRoYXQgbXNp
eCBpcyBOVUxMDQo+PiAgIHdoZW4gbXNpeCBpcyBmcmVlZCBidXQgaGFuZGxlcnMgYXJlIHN0aWxs
IGluIHRoZXJlLg0KPj4NCj4+IHY1LT52NiBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgdGhlIGxvZ2lj
IHRvIGFkZCBkdW1teSBoYW5kbGVyIHdoZW4gIXZwY2ktPm1zaXggaW4gY2xlYW51cF9tc2l4KCku
DQo+Pg0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0aW9uICJzdGF0aWMg
dm9pZCBjbGVhbnVwX21zaXgiIHRvICJzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfbXNpeCIN
Cj4+ICAgc2luY2UgY2xlYW51cCBob29rIGlzIGNoYW5nZWQgdG8gYmUgaW50Lg0KPj4gKiBBZGQg
YSByZWFkLW9ubHkgcmVnaXN0ZXIgZm9yIE1TSVggQ29udHJvbCBSZWdpc3RlciBpbiB0aGUgZW5k
IG9mIGNsZWFudXBfbXNpeCgpLg0KPj4NCj4+IHYzLT52NCBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2Ug
ZnVuY3Rpb24gbmFtZSBmcm9tIGZpbmlfbXNpeCgpIHRvIGNsZWFudXBfbXNpeCgpLg0KPj4gKiBD
aGFuZ2UgdG8gdXNlIFhGUkVFIHRvIGZyZWUgdnBjaS0+bXNpeC4NCj4+ICogSW4gY2xlYW51cCBm
dW5jdGlvbiwgY2hhbmdlIHRoZSBzZXF1ZW5jZSBvZiBjaGVjayBhbmQgcmVtb3ZlIGFjdGlvbiBh
Y2NvcmRpbmcgdG8NCj4+ICAgaW5pdF9tc2l4KCkuDQo+Pg0KPj4gdjItPnYzIGNoYW5nZXM6DQo+
PiAqIFJlbW92ZSB1bm5lY2Vzc2FyeSBjbGVhbiBvcGVyYXRpb25zIGluIGZpbmlfbXNpeCgpLg0K
Pj4NCj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4gbmV3IHBhdGNoLg0KPj4NCj4+IEJlc3QgcmVnYXJk
cywNCj4+IEppcWlhbiBDaGVuLg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMg
fCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gIHhlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jIHwgIDggLS0tLS0tLS0NCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQz
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvbXNpeC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IGluZGV4IDAz
MmU0NzFiYjFjMC4uOGRjZjJjZjlkNTk4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9tc2l4LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+PiBAQCAtNjU2LDYg
KzY1Niw0OCBAQCBpbnQgdnBjaV9tYWtlX21zaXhfaG9sZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+ICAgICAgcmV0dXJuIDA7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2Zf
Y2hlY2sgY2xlYW51cF9tc2l4KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sIGhpZGUp
DQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRl
di0+dnBjaTsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG1zaXhfcG9zID0gcGRldi0+bXNp
eF9wb3M7DQo+PiArDQo+PiArICAgIGlmICggdnBjaS0+bXNpeCApDQo+PiArICAgIHsNCj4+ICsg
ICAgICAgIGxpc3RfZGVsKCZ2cGNpLT5tc2l4LT5uZXh0KTsNCj4+ICsgICAgICAgIGZvciAoIHVu
c2lnbmVkIGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodnBjaS0+bXNpeC0+dGFibGUpOyBpKysg
KQ0KPj4gKyAgICAgICAgICAgIGlmICggdnBjaS0+bXNpeC0+dGFibGVbaV0gKQ0KPj4gKyAgICAg
ICAgICAgICAgICBpb3VubWFwKHZwY2ktPm1zaXgtPnRhYmxlW2ldKTsNCj4+ICsNCj4+ICsgICAg
ICAgIFhGUkVFKHZwY2ktPm1zaXgpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmICggIWhp
ZGUgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHJjID0gdnBjaV9yZW1v
dmVfcmVnaXN0ZXJzKHZwY2ksIG1zaXhfY29udHJvbF9yZWcobXNpeF9wb3MpLCAyKTsNCj4+ICsg
ICAgaWYgKCByYyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIl
cGQgJXBwOiBmYWlsIHRvIHJlbW92ZSBNU0lYIGhhbmRsZXJzIHJjPSVkXG4iLA0KPj4gKyAgICAg
ICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIHJjKTsNCj4+ICsgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPj4gKyAgICB9DQo+
PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFRoZSBkcml2ZXIgbWF5IG5vdCB0cmF2ZXJzZSB0
aGUgY2FwYWJpbGl0eSBsaXN0IGFuZCB0aGluayBkZXZpY2UNCj4+ICsgICAgICogc3VwcG9ydHMg
TVNJWCBieSBkZWZhdWx0LiBTbyBoZXJlIGxldCB0aGUgY29udHJvbCByZWdpc3RlciBvZiBNU0lY
DQo+PiArICAgICAqIGJlIFJlYWQtT25seSBpcyB0byBlbnN1cmUgTVNJWCBkaXNhYmxlZC4NCj4+
ICsgICAgICovDQo+PiArICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIodnBjaSwgdnBjaV9od19y
ZWFkMTYsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNpeF9jb250cm9s
X3JlZyhtc2l4X3BvcyksIDIsIE5VTEwpOw0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBmYWlsIHRvIGFkZCBNU0lYIGN0cmwgaGFuZGxl
ciByYz0lZFxuIiwNCj4+ICsgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRm
LCByYyk7DQo+IA0KPiBMaWtlIHRoZSBwcmV2aW91cyBwYXRjaCwgSSBkb24ndCB0aGluayB0aGlz
IGxhc3QgYml0IGlzIHJlbGV2YW50IGZvcg0KPiBkb21Vcz8gIE9ubHkgdGhlIGhhcmR3YXJlIGRv
bWFpbiBuZWVkcyB0byBoYXZlIHRoZSBjb250cm9sIHJlZ2lzdGVyDQo+IGV4cGxpY2l0bHkgaGFu
ZGxlZC4NCj4gDQo+IEkgZG9uJ3QgbWluZCBhZGp1c3RpbmcgYXQgY29tbWl0IGlmIHdlIGFncmVl
Lg0KSSBhZ3JlZSB3aXRoIHlvdS4NClRoYW5rIHlvdSBmb3IgaGVscCB0byBtYWtlIGNoYW5nZXMg
b2YgdGhpcyBhbmQgcHJldmlvdXMgcGF0Y2ggd2hlbiB5b3Ugc3VibWl0Lg0KDQo+IA0KPiBSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBU
aGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0KDQo=

