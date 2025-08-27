Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169CB385A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096281.1451043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHep-0000X0-Ak; Wed, 27 Aug 2025 15:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096281.1451043; Wed, 27 Aug 2025 15:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHep-0000VI-7m; Wed, 27 Aug 2025 15:01:51 +0000
Received: by outflank-mailman (input) for mailman id 1096281;
 Wed, 27 Aug 2025 15:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urHen-0000Ud-Q6
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:01:49 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c109aa9e-8356-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 17:01:47 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAVPR03MB9632.eurprd03.prod.outlook.com (2603:10a6:102:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 15:01:43 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 15:01:43 +0000
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
X-Inumbo-ID: c109aa9e-8356-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVBvwDaRT2jYfyDcYHQp7A23hZIsgNfbj/lIu6fcreh5MapV8SPMdu0JB0IyKVwNXfzlX1tGMFVWJZSMPVlyK4wQFuhUWT33UwGgnzIig5sageK8ZCyH4rr1CBbnp+stUO4eA1a8drZNWCRQacRLwF1LMIxw19HRmAy9YIcR6VlUUUNhFOKV+gxKTuzXhkhXfm4/tXoq/esikdZPuTP/zdhiBxdZmyfZsV/RL8T9RplInt00X4aG4qmh4TvvReGXVuSwOLK4XnMg+aLpL+uCOYokfBPTvjEmT/pJh4zAx1p6mHUGoLMMMZjwzVj4XjbLcUAtr6rvGNOTs9BUA3chLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2F+TO3ZlI1rrXJ8fHNUz10eNwiQYpS1Ipz5LT58Q6I=;
 b=to59FVwV9rP8FiduX68/sb/a054kn/EtBkCvbjsWxRM+Jz1sE3ENGz03kOyTlKnu+r8YsZF/R53Uq7dWqn05N0EEbWoPZg9W7CcaBkPB/ER3RlzvhWoS15MQfcKFKZ3m8zo95ev7Ki12DEMF2FCPrk65O/Pw6K8wDYxsv6SY1kZBJ3p7FuRhabOMq2JKa/cXxJ+9oV28p6sxdvQ/5AcycQGsIf6ofIPyHXpGnQMKacXogiCE2VryxCBsZ5i0qyW9BjI28V2kFLagec8orgMX+lXCqbhzNstibfC8+WJK0anO+vWKhLI+evCnUQLoRCObd5lJXNh1PKwJrnc/QEjUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2F+TO3ZlI1rrXJ8fHNUz10eNwiQYpS1Ipz5LT58Q6I=;
 b=ehRWiPg3BnRO43r23HUdqqgfsLPKFqCowLpeLFPIEMuek5JutbrKvvlRuY76xD5Q6RhIHokfWWqC7FXlx6RVuOyByQ10geuPeZL5eRdXp8BpdDk1HPYIkiyA9EgjyZO8lxAChQ+KRnU1MaC/k7Fy0BxTrvPijJKi3wGiPz30tdxD9g6Nu8zuY6lrVZSTBglKkMnfTsUWWO5OSiZL4wedFVlIylGSSa9w2lO92TfksTo+GPnad5K0jnZkS9v9n2YuScXma7aCe8yZgXpOSfvW25iigQqrtgCGahniG2xUeL/3MatWAnJEJBICo8BE+7nJQtPBy/trEV1tlyeqURz/BQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcFpKAZWUsU5Sz9EWrJGvlceTbI7R2TLcAgAAap4CAADJ7AA==
Date: Wed, 27 Aug 2025 15:01:42 +0000
Message-ID: <120e2675-473d-4cb6-b004-70c22439c3c8@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
 <874itt4r5t.fsf@epam.com> <1cf0a662-b717-458c-8174-6b03187b4b6c@epam.com>
 <a230ad6c-294d-488f-ac2e-6fc3a7cf33fc@gmail.com>
In-Reply-To: <a230ad6c-294d-488f-ac2e-6fc3a7cf33fc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAVPR03MB9632:EE_
x-ms-office365-filtering-correlation-id: 67c7bf41-d050-4018-abcc-08dde57aa26f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWszbzJCUTl3RmozMFF5dE1kTU96c21jVzgyM1MrZFVqUDk4WTgwZGRkOGR5?=
 =?utf-8?B?Wm5rRzhBZlVhQ2NRQ3d1MHpKMTYvNHNyNE1BNlB0Sm1RTk9Kc3JCeXBiOUh2?=
 =?utf-8?B?K1EyaU5GcGdUT2x6eEY5R2xIc2JBQUloTlRMQU55YnN6ODFESDNaaFE4VnFa?=
 =?utf-8?B?QzNtWlpNTkNFTXRYbkpyTHZWYnQwYUFRSmYxRjQ5VU1JTTk2WE9FWEZpWnJy?=
 =?utf-8?B?YmMrV1dvcG93QlR4bjVsWFROZXAzOFNrQnk2dWpwU1p2Sy8xalFmd3ZPUjFo?=
 =?utf-8?B?U2kvbEc4dkI5ZXg3QUthd256ZjZZcmlyaHdlQldHRmJpNXFIY216SXRrUzBw?=
 =?utf-8?B?OHNqRVdOZ0gwSlhwbC90OVBaQTZVNEJpQTBEVnQ4ZGF4RkljZlkwKy9RL0Zx?=
 =?utf-8?B?aDVhOUZBMGxVM3VBMFFJWVNqWEVmNWdxQWhiUDI4cnRrV1h1bUE1OFFhcHVK?=
 =?utf-8?B?bXh4K0xaczF1UVcyV2tQMHRCR0pONDlGSzRJWVpUcjk5TkZzelBlazYvZmN6?=
 =?utf-8?B?TThQSVNVUElkU1dZMDlrUEsvdEF1a3lBazJEZWVqd1pMYWNhaGxjeHZDOXFs?=
 =?utf-8?B?TTlTNTVNa09jS3JET2EwSFhnd0hoNkhZMzBlb1g4NmNiY0d4R05SNHcvRlc2?=
 =?utf-8?B?alZ3ZXFrQ0d6VjRIMDByeGRQVStqcGMvejVLUHQrK1pJbi9yR0xWcFYvV2Nz?=
 =?utf-8?B?MGg4aWNJQUJ4amx0YlczOElyb2tJMW9qY09KWmxqbSs4dVg3ZmZkVTl0U0p1?=
 =?utf-8?B?Nmh2bWxSekFtY1hkQnpzd2hRaXJ0clN6TkIzSGRheUM4bDNqQkNSMlBjZzlq?=
 =?utf-8?B?UW9pRnQ5NEVYdTIrdWUxVmgxYncyRTdUR21VaE1EdDJJcktuZjY5T2xQRHF0?=
 =?utf-8?B?aTZvdE0vendLWnlialE1ZzBVMkpLUFN5V1V0WElMb3hWQU5ibG0rWUJMb3ZI?=
 =?utf-8?B?VWVGSXNlamJtc2REOXdiVmNwdmp6djJoRjI3aFJqMWd1UGJTdytnRjFtTmxQ?=
 =?utf-8?B?ZCtrTTRqK1ZKcmxuZjBJVUF4eWU5b2JtYlI2OXJWbFVZT1JjaVY4cEduRE03?=
 =?utf-8?B?aHc4MG1FVVdzcUp0RCtxdS9Vc1pjcEswOTRpNHRzNUdPVGJ2d3dmRFJsRGVI?=
 =?utf-8?B?MWtXVzFaNWJTY3diVmgyZ0dNWVQxcjQ3T0Z0UVNzN2phbVpmMTFkMHBsMks5?=
 =?utf-8?B?d2NXRFZkR2VveS9oUTF5TzI4YTdFcnlBdFVHQUdTOHlUM3Mrbk1GQ1MvZThj?=
 =?utf-8?B?RjBlTTJsamZyeTVpTnJLZmJFbjM3aEd2WllCWXphTm5nNEsyMTU3ekJBZmFk?=
 =?utf-8?B?Syt3Tkh0MG41UGZ5T042dnBvZ01kaFhWMkZmaDZaaEg5eDJmL3FkSnlWY0dD?=
 =?utf-8?B?ZC9hQzRwWlI1WDZzcXVka2xHTERvZFNucDkxOXpzWmpZVktlYThTb004c1RN?=
 =?utf-8?B?MUYzVjgvQjVXTGJJUGZrQkJLQUxETzIwVlo0UG1RbHpTeWZSdzVIbW14S3FG?=
 =?utf-8?B?MENBWnAyZFR1RCttbU0wUjlkRGNMaUsveGM3Zm5oclFDZEp1OWMzODYwaC9B?=
 =?utf-8?B?cDlYUE1mNVhBMUZITzJ0UXdMSFVCWFBvSE9WcEt6OWN6WFFBZXZWSGY3cFNh?=
 =?utf-8?B?TktmOTNiSXk0aGdHYXJqUXRFNkFkSzgxdUcxUUJvaGhFMU5XRE0yTjI3eXJ4?=
 =?utf-8?B?bHA2VTlpZHhmL0lZMzhWRnZiT1FLekZaS01ieVdQcWZVWWY0L1B0ZENnV3RF?=
 =?utf-8?B?SlcwczZmUHJCMkkrdWJSTk0rektLZ0pBcElUSFVGbzBFYTMweTVMbjlYZnFQ?=
 =?utf-8?B?aTF2QzRhdmgwcUpsbmMzOG9oaG93TU1JQWxaRjQ0c0c1aXpvTjVSV3oyVFBm?=
 =?utf-8?B?WGlTNXRNRzUvMkRPbWpTRlU0czNmZTk4SEJuazcySmQ0cGZLaGlJK2xVYktE?=
 =?utf-8?B?YmZpUTVOQXdrcDVlVHhYSDBhM3EvTGFxTkMwV3NaS2pYR1hrOHZCMU5XRVc4?=
 =?utf-8?B?NlVGRkdzNTR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WCtQN3NScVNCT3owRlNabUV3YW5NY2pYZzJmbHY4NEV0SkhteVZkazlEend1?=
 =?utf-8?B?Sm5xMENQQzZ1bHZsdkkwYUdUMGdnMDRhcElJLzVoQVNoZXpVQW8zUVRycm0w?=
 =?utf-8?B?MzlXaEcyNlZQeSttcklVQk0xTWtwQ2RaRFhpOS8xMVVQZ3pkTzVka3NDWEM4?=
 =?utf-8?B?NTNSczhheHFlRi9zb2JTMkRBc0tBbkFuaVM5enp1Y0NNem5sZ3dMNVQ2VVEw?=
 =?utf-8?B?NXN0ZjFWQ01hRlpaN2tKeUJCK2pKZmR4UmZoM1M3WDhVQllrVkdUMU41VGcz?=
 =?utf-8?B?V1VFRDlkaStmUnNhSnY5Q1JCMjlFb3oreTJPemxSM3dPUDBNcUlPMVVkeHgr?=
 =?utf-8?B?WHhmM0pRQmxpT1NGK2J2UnFYdFVDMnZibkV6SE50K1A1WDBCZDRUYUM0Zzgv?=
 =?utf-8?B?QVRiRWF4L3IrNFEvcm1ld1FsaVR5cFJ6b3B3aStTVmpOdHQxZlphMTI3RmVx?=
 =?utf-8?B?Z1ZiMS9vVFdvU2c5NzNrTE9RM2VSNkZMalR0RTJxWG1Sb3VJZzJYZXVoU1hZ?=
 =?utf-8?B?cjl0WlFLOGJVdjBoSERraVQ3c2IyeW9nTVljejg4WVdIWjMzTnFIMW9LNStj?=
 =?utf-8?B?T3kzM3NYNXNKMU83N05Yc0lhdEVYNVhOK0cwa3d0cVJJVWlSN3hTd3dqajNP?=
 =?utf-8?B?cmxxcW54TkxyZjgvTkJ3ZW1jK3BnWWpMT1dDVGJYNkpFWEpCMERSVTZka0Zn?=
 =?utf-8?B?RjFiNlRHY0hKTytlMVYzMjJMWFBGM3JLMmhOVTdLV1VZQ0dORjJ3WkRlZFFM?=
 =?utf-8?B?eEUrVHBXbUZCYjlrdVc1K0U1NGlkVnV3U05hRkpDTEx5OHM1WTRHelo4YzRG?=
 =?utf-8?B?bXlXNDM3ZXdpaHR1WmV0UkFWaDgrL0pMS0Y1REJCK1BvNllpT0xyOTN1aGFY?=
 =?utf-8?B?WTFkcTJNVERUYkhJVUtmN3hwNG1kQVY1VC9ya28xeHRRY2xjOEtGY1Z4WG9o?=
 =?utf-8?B?b0ZMNFJpbXBQR2Q4eHA5ZDh0ZkZnenZQL0Y3cVA0UlBnQmovMnFlQU9CNmwv?=
 =?utf-8?B?bDREdEo1bjcyTWRTK3FSNDF0eVVMZW1RVkhVT0RoNjdlL1d0MnpaZCtaVU5q?=
 =?utf-8?B?R3M1aklEZm9qNkNPWjlPMnBQM01TZXg2ejNKODhuM1o2dDRLaWpYaEJsY2pW?=
 =?utf-8?B?Y2lreDZKUS9IWUNmYTQzMkFiKzAzU0FNekJCM2VkZnVHOFlWNm50dUtBaUk1?=
 =?utf-8?B?UlNnNGNISFpscnVSelljVVJaYjIzTzFoV0x4QmV1TzNaalU1Q0sydlRRTHRj?=
 =?utf-8?B?Z0NvNzh3N2JQUU0yZXRsQmRaYnZHTGY0SWY0cmxMOWVQRDlFZDdOVXA5ZFAy?=
 =?utf-8?B?ZDhMK29HZDBmTWlnVmhxeHdxMEVzcHRobHRYbThRU2Y2VkJsZnFvOUhJbE4y?=
 =?utf-8?B?am5zNStuR2QvRm5FQ00wTitJYmFuSnZ0K3MycmhVM0JyUElXbTZxSVB2eFZl?=
 =?utf-8?B?clFidTlaTGJuSkNDeWNPL0hGS3RPbkZ0QWJuU3AwM2lvRnl5aTA3dFFKSGE4?=
 =?utf-8?B?RWRmb1VOV2VBM1VrNlk1QzNFckFXWm1OdFdncVMyQTRuUnR1TG9iMEJMUkV0?=
 =?utf-8?B?VGdwS1dIWnk0Tks2VzV4VHVHaVRDMG5WeC82VU5iWlh0WVROSGpBS3VFbFA1?=
 =?utf-8?B?WnlYL3ZmZVk2NjhBVlpEdTVZOUZndVBWdGpWTmptZHgrNlJuYjdycis2dkxm?=
 =?utf-8?B?azd4MERTczNHeDNBN28xeUNSQmtuN0JhRXdrOVdKSXo0SVJnWFhidHlycEQr?=
 =?utf-8?B?QUJFVytIaEtOQ3dyK0lBTW54aEdUR0ZtNnk0MnFUTi9RVHNmeDNSZnNvS2xl?=
 =?utf-8?B?ZEtVaE16cVhqbkpySFR6cnRCeGdiVWh5VWsvNUZiSEF5ejk2Ym9ZQlAvUEJk?=
 =?utf-8?B?Ym0yYzZKcThNWlhld1RvVkw2eEFvbWgwVzVERXRqMnhJQThSeE1vbkdyNytW?=
 =?utf-8?B?TkdnUklXVkJlQmI3Ui9DNTY1eXhIYzZaK0l1aWJ4T3BSMHk2RE1xa1MrVE9a?=
 =?utf-8?B?YXlxaE1MbS9pd2ZJVFdleDdwQ1dJaHY0RlpoMjRhbUtQSDNScTZlZFFxcmFt?=
 =?utf-8?B?Q0w0UDhVd3JDQnFoREp0WWxHRUtVYWdjY3lJRWVDaXVQZkM1aVZMc0lmYXVR?=
 =?utf-8?B?ZTB5ZzNmdWZJaUhWY2o4L1phWlgyanBIL1lsOFhrUFExcmx6a3o0NHZLVVBH?=
 =?utf-8?Q?5vmxHgVM1mxt0ROSzNJmq08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <223177F90570C14FBB6192B67A177851@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c7bf41-d050-4018-abcc-08dde57aa26f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 15:01:43.0106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrQtISQ2E0RRbjrDPQEF6HhJSjePNIzEeJyEnjIYNugdw2QI/Gbg6xIGEGrfoK/9pJSB0lHyOJ0gE/nsQf8jLW2dIBoVUe/nnLDyi2c17xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9632

SGkgT2xla3NhbmRyLA0KDQpTb3JyeSwgSSBtaXNzZWQgdGhlIFAuUy4NCg0KT24gMjcuMDguMjUg
MTU6MDEsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiANCj4gDQo+IE9uIDI3LjA4LjI1
IDEzOjI1LCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPiANCj4gSGVsbG8gTGVvbmlkDQo+
IA0KPj4gSGVsbG8gVm9sb2R5bXlyLA0KPj4NCj4+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0
aW9uLg0KPj4NCj4+IE9uIDI3LjA4LjI1IDAyOjA4LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToN
Cj4+PiBIaSBMZW9uaWQsDQo+Pj4NCj4+PiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRfS29t
YXJpYW5za3lpQGVwYW0uY29tPiB3cml0ZXM6DQo+Pj4NCi4uLi4NCg0KPiANCj4gUC5TLiBJIG1p
Z2h0IGJlIHdyb25nLCBidXQgaXQgZmVlbHMgdG8gbWUsIHRoYXQgZGVzY3JpcHRpb24gZm9yIA0K
PiAibnJfc3BpcyIgaW4gZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIG5lZWRzIGEgdXBkYXRlIHdp
dGhpbiB5b3VyIHNlcmllcyANCj4gKGl0IG1lbnRpb25zIHRoYXQgIk1heCBpcyA5NjAgU1BJcyIp
Lg0KDQpPa2F5LCBJIHdpbGwgYWRkIG9uZSBtb3JlIHBhdGNoIHdpdGggZG9jdW1lbnRhdGlvbiB1
cGRhdGUuDQoNClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkLg0K

