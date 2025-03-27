Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC38A72B9E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928703.1331383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txil8-0007ru-77; Thu, 27 Mar 2025 08:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928703.1331383; Thu, 27 Mar 2025 08:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txil8-0007pv-34; Thu, 27 Mar 2025 08:38:42 +0000
Received: by outflank-mailman (input) for mailman id 928703;
 Thu, 27 Mar 2025 08:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S28+=WO=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txil7-0007pl-9g
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:38:41 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2409::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ded7fdb9-0ae6-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:38:35 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 08:38:32 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Thu, 27 Mar 2025
 08:38:32 +0000
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
X-Inumbo-ID: ded7fdb9-0ae6-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSulkwmuRsmf3Y0pRE/mrLPA6483hY2bzpUngYc36oMRPQa3m/WrDy6LXxPsio1u66tFyfFVm4uG48e6Z9SW1Ln4idbLLq2DwLmAuBLELm3NM28P+tcfqXcrSqavSn4rjadbyKtxeR5loKKi6sq8QROQmPT6OMnEhhMBlPzLKm1uoQRUHwt8Cllh+WjegXkWIc4kBfi3v+p97kNnP7g/z6Of6cyhUglun+tSgXlvzOPD5f5ucm7o2SvMRirZhDqbha6IcY7rNsFBdrv3WHywj+PyVAxrRAOyechpLQAJ4fDVyTDOX0Ve4FCkthUaEX+EYcrFQDT7Fff42r7AQGoBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OjmTYNs557635oxZPdCs35UjNF0TopRJS8eUAOJ/vk=;
 b=lkBdsMMMYLgFgsYeK1+Kr2kBxEfCcwLRlGEeHlB24YTi/PU7H7iAlAebbilX1iznWAirr1ZpNcwd8WDmuotAQrV1Bd9MtnipMtidBFUe0kH6KGFNq0HaQQ7Tw4uMl2Hxbfdtu0nzvHwrzN7lEM1YqhzNhKyr3Mk7yFpQzdwt4xkIS7NCDeDZAuphPDhamIOAWGcu3vvR/iPEMYa3X1sLWQzEKutVby0joECx8IhH+/RB9IkuoNj0LBG7rrME4Ytk9rdOW6Lc02WwZPRqvm8hGeRxXR13OAybJHgpMm8f+2kKRHEsNl6jy9VzVThKawBlwOhZA5hl4eN0e4umNZXINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OjmTYNs557635oxZPdCs35UjNF0TopRJS8eUAOJ/vk=;
 b=CaaQeZ5ZMhVeDr/zXQMnk2o/5GBHMipVwX72YuqRhdUZudrrGQ47wAuHVc8gillofSvxKyCuFOMc8rACh9pPVIUdZhidtnmhMB0rhxH3OfsUls+GWao1mCUCX2GuFNmw/UnHfNtlCt3T1ivMeHqHC3IvkdDV3VaMh0b8GlZPZQU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 08/15] xen/amd: export processor max frequency value
Thread-Topic: [PATCH v3 08/15] xen/amd: export processor max frequency value
Thread-Index: AQHbjnNvhCrdHHKqk0qGbgQkaC8i17OCjH4AgAQ8V7A=
Date: Thu, 27 Mar 2025 08:38:32 +0000
Message-ID:
 <DM4PR12MB8451C12F0303DBBC12DCC3AEE1A12@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-9-Penny.Zheng@amd.com>
 <942a11ad-c24c-4079-a0da-339ca548c569@suse.com>
In-Reply-To: <942a11ad-c24c-4079-a0da-339ca548c569@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e9349405-6eef-4a50-b5c7-12a707e5908e;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-27T08:38:26Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB7769:EE_
x-ms-office365-filtering-correlation-id: e7b6be2f-f9c5-484c-8d93-08dd6d0ac1c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sk1QRXpvOHdUanNjeWNVY1BEcFg3clFWc2dUY0V6YnZibnMrSFMvNkg2bWZZ?=
 =?utf-8?B?eUE3dDFScmxQWEcyQm5VSGpIaGZEVk5XL3R3YkpIUHJJOFF1azBLQm9hdDVt?=
 =?utf-8?B?cVIxN1NSdEpiMTA4a1I2d04rVjRCWW5Wbmg1aUQwVFlIRmhQNldmZS9YRWNN?=
 =?utf-8?B?dXJWTERZaG9VbDVsRDJacUlmNHhiVkpqR2ZYOHEycDY2Ym9hYXVMSmpZOHZW?=
 =?utf-8?B?Y09oVkgyNnZaRm9qbFJMUjRvb2FiVGZpaGZUMmQxZXNJMUczandxTGpqY1dh?=
 =?utf-8?B?dVlpeEFuTkVhQ2hJczR4dTdSVW5sSG9KT00vWFNpZjBIN1RZSzY0aVBJaDNE?=
 =?utf-8?B?QzRyT0lMRGpPQjc0Tzl2bHczUGhuY1NhK1ljeTR4QVdGS3lXZkhRcnhIcTM0?=
 =?utf-8?B?bjdVK3ZzSUl6NnNDU1RyNHJDK2JQaVpqZmQ5SVJjWjZPbzFWSnU4MjZGWjJE?=
 =?utf-8?B?azN4eXlwdVNsUUVpZ0VkZmhHRHFhNE15VVZVekR4VzhCcitBT0JkZitCbzJj?=
 =?utf-8?B?MndVa2lqOExWR0QyZG9JVkNzTHZJSHJrMTZuaXhDMlpVdUhPOU4rckVteUNt?=
 =?utf-8?B?VVB3MEI2Z3BwYnRjZXExYyswRHZQaUZGei8rTStEdFVRYlQrSkZiK2pxYmJh?=
 =?utf-8?B?dWUvY0pwZmtyZUR1SzdVSXdUNis0WDZkalpJQkpiYldiQXJSRW1RdzgxcnZU?=
 =?utf-8?B?QytMUUt0Rmpmam9QaGJ2bzhyUTFFNUZFWStFVWZ4LzdQWmlKSHRvZTZwSkla?=
 =?utf-8?B?VUJOMnJNeEZGekQ1VzRoZWlKd25VQkdCdVdsRnFacnVleEdpcWF5TmZBZDRP?=
 =?utf-8?B?NHY4eFZvUVlWdGFvam1yNUF6cGVMenRmSXpNREVxZWVFdHlMNWhKck5UeElS?=
 =?utf-8?B?L0VZT2ViWHFXWnFhSlpLcEFidVBUT2lMb001QlpPUlo2YzJ3akNweWN1V1pS?=
 =?utf-8?B?WStZZStYQVJDekdSemtKWWxYc3Jialh1aTYvcFBwd2JuSUovR1hTcDBzck41?=
 =?utf-8?B?V25YR2RVR21EbWkyS2VlS1lJRnBsMnlvcWk5V3VtSTFRbkhqNWJIRWZNZWhP?=
 =?utf-8?B?RGRrSzRYUU5DSVBhbmNjVUg2bk9iSVJURzNta0pYZzk1MERQZGZ0WUxoT29n?=
 =?utf-8?B?WHF1RVpVL08vdlk3SUFVbnIvU21sVmRGUEJEdW9Uak5NaU8vaVc5MTZmODl6?=
 =?utf-8?B?UnVnU1VCWHVjYXltQ3hZL3RhZmpiVUpBOStPOHNGS1lTL3h1MitOZkhRRjhU?=
 =?utf-8?B?N0szM3VqU2ZVb3c3TEdwVXNMZ2dsTE9EYnJrY05TRjlIZHdoQXN5cmtYbGsr?=
 =?utf-8?B?K3VYS3Nhb0Y4REZJTVJkbks1em5hd2FvQVdYWG1LQTNtT3JGc0FrSStrSnN3?=
 =?utf-8?B?YUxIaUtZQU9YekpTd3o5bHE3QlNmdmpQMTlLeEJPaUVaRWU1amFuOUhrY1l2?=
 =?utf-8?B?dmd2S2FncGZZN2FMZmhCOWxFWGljRFo0UzlBT0dJdkw1OGNpV1BLelpqOGo3?=
 =?utf-8?B?Z2wrTmVXcDJzdzJZL2FETUdSYnlSNjl6b3FjSks2c29FS05wUWFFR2gxMjl0?=
 =?utf-8?B?N0RrWnpERkliaHN5L2JJeG1uamFXL0pJdkRIWTkyZTNtendUbmpmQ2w1ZSth?=
 =?utf-8?B?WndzTWxhbWx0UndWYVRKUEZPdUdaQ3VYbnBnUDNENzZpZ1cySm52UitGWVJ0?=
 =?utf-8?B?a3dUWEwvRWk2cXNST1BkM01ZYVJhQUd4Kzd0bEZWTVZOcDBzUVZHWGE3MUpx?=
 =?utf-8?B?L3FKcmhmSG5HUTlHT24zcWkvTVJYejJVYk5YMForbVNPRmRPUTdaSmRsOEZu?=
 =?utf-8?B?aUVHT0c4QlZVRURNRlA0aEUybzRQZjJIQncvcTVMT2pZQ3NkdGVxbEtFZk1F?=
 =?utf-8?B?cGl2Y1pTR2h5WTNNd3F3SFpUbW94WGs3YkkvcmRUSFR3QnNZN3JqbFVDZnlP?=
 =?utf-8?Q?j/V1UKQyePk6Tcow2rdSSAdOKMmw2c5y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anQ3dytmQUxoZVNQbHRhSHhzdW5pNXd0TStXSnF6VFJhV1VnR2RRamRXcDNN?=
 =?utf-8?B?dU9xR1VDcFZUTHphT1B6STJoMEoxVkRLT2VqQ2duZHNjVW8wV1ZGaFdOb3M0?=
 =?utf-8?B?RDJobktoZVNOaTNOa2hKMjJKNXNka2NHWXV5VEQ4bkZ4emtoODczMjdya29Y?=
 =?utf-8?B?T2NMREdyN1lJZmlVeHJZMGo2ak9GMnN0Z0g0Z0FtenUyZ3N2WUpXZjJ3a2hM?=
 =?utf-8?B?Q3Q5VzJDeXN5OXo1OVZHTnAycDBoQWdBMXlabmhTcVg3cmRNLzhiQjBSM1Uv?=
 =?utf-8?B?ZzdqZitVVlJ5WEZKTkVmOWduVUlGQWh3cHNDZC93Q3N4c1JTNjF2aWlWTTR4?=
 =?utf-8?B?aFU5SWhDeDN4dUsyNE1BUFlXUCtsd3QzV21LQktuMDJzRzI2SDJYYlJNRnhM?=
 =?utf-8?B?OW5YK3ByYktDbW5jMHVQS3VSMXI1d0ZiaWpUcUlOWHZlTDZ0OSszOFljUlhN?=
 =?utf-8?B?VGJUZCtLWXY2MEt3V2NPRFlYVUczMm5SOUxjckhnRW1raUhHVUNUWnhxbHZE?=
 =?utf-8?B?RW9oQjZIL3h3WVZ6NldKT1VvOGZuc3VyQUp6bnF2Tjk3aWhWb3hmZ1NQTFhP?=
 =?utf-8?B?L0ZvUUcwd1hONFl6cVRMTVdYZ1BuY010T2pOaGN6QlBYc2FFZC9wN21pbDhp?=
 =?utf-8?B?YVRXQTZ1YlRlczUxQXFvUGthOU5OMmFMeERVYU1wMWRPWUo5RElnUGdmNkdH?=
 =?utf-8?B?d0NwUzZkY1ZhVTcvVG53OXNoSEFhanJUV2VQNWZTTFZ6dVFFa3dGcGlEWlhY?=
 =?utf-8?B?QnRhQzVuM0dGN21iL0phK1E5SXFuQ0RNTDF3ZW9DMFlnT01lWHZLcWdzV0VM?=
 =?utf-8?B?T1BhK0h5N3VDR1pUK0x0VGFWcjd2bnlWaWtFeFVIRVZZcE1XbXlJUHVpVkRQ?=
 =?utf-8?B?ckdHQ3dCL0cwek01bzBvQ2lSRGpZcTRQRm5DMGQrMFA0RTk0amxpRm9pKzZU?=
 =?utf-8?B?NFNEQkRoZkZidy9DOGs0OCtxOGp3Ymt3cHgrYy95YkpwWUlUcmRTZWEwQ01I?=
 =?utf-8?B?RDUvV2dmTXVmUGFyRmlhcFI5amhvL1FqMXYxdWdudndLbXd4bXpPMjRXMkw2?=
 =?utf-8?B?WXNhQmNOWlFLeVZuL3JZTU5XM1VFbG1NK09EelljQ1ZjdzJoOFlmb0lxZzZF?=
 =?utf-8?B?a2ZsL3VqMk0zb2ZidFljVElFMG9PWUdaTUVHWFE0NWtOdEIydDRLY3RIazgw?=
 =?utf-8?B?MldTelYwNW5uWFV3bURuMndwU1g4RDZwcDJsbEFONmZFR1ZiTjhYZWtNdS9j?=
 =?utf-8?B?eVZyVEZiNDl4Y0JjT1N5YW5jZUp2QzdlZVg4cWdDaG1BY2gzME5SbTN3eTJZ?=
 =?utf-8?B?NmxQVDdua041SGZPQ2w2UHhGd0kvRUZIK3ovU1NTMnFGUGgydnFCeGEvbEpL?=
 =?utf-8?B?TkJlOWM0YjAxcjgxcWlKcExSbnhnVkFZdk1PQTFQWjVqaDVtczlCOE5XYmtq?=
 =?utf-8?B?NmQwclNGdmxraWpLVmo2TXMxQng4TmdtUFZsU2VnMW1WMFl6cWJ2a0FlUGFG?=
 =?utf-8?B?eEh6L2V6WWNlK0FhYXhOaE95dzVXc1VZbnVEeEJsWU9CdUpFNEVOcjRYRGZE?=
 =?utf-8?B?a1dsQVZkNUI3c1hVTERxbVg5RmU0ZjR0Z2piZ3B4NWwrbkxSa24zVjRFY0Rt?=
 =?utf-8?B?QTZHMDZwSWVsRHhhUWtlYUNDYWFDZE1QbTViQSt6R1F1VDVDbXZwQzBFcytG?=
 =?utf-8?B?dDBQaVdNTnBUaHFYWDV4VHRMN1g0UEF1MzhiVWJBWC80VzFlQXJmenAvcHdw?=
 =?utf-8?B?c2d5ZTlYZm9QN015UTVBYUtvWGpLdmFzNTZFUHFjd0FpT0lwV1JOc2NBRmt0?=
 =?utf-8?B?cE0wMlVxV0JBZmN3dGd2L2FoQXlyQXdVRHZLY0FmWjhONUJCeEVFSVlGMlll?=
 =?utf-8?B?elZXeEYzajFZOHd3dDlDMGxHUks2UVNEbHg1MHRMbUd2L2krUjJHNHI1TFJJ?=
 =?utf-8?B?MVJTMERrY29EWXlxajF4RzM4OUJhckMzakxzc1ZjbzBTS0x5MSsrVWJRckNz?=
 =?utf-8?B?eVVsL1EwOXErZ3MrQVZTWHFQTFZETzhUSGZxdlRGdzllUytvVVJ1bUNWODVJ?=
 =?utf-8?B?VXlLMnhWc3JmRGFjdHJibjlNUDRtUlpzUmJtRGpBZGYreHNMZDkxbGFkQUlh?=
 =?utf-8?Q?SwSs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b6be2f-f9c5-484c-8d93-08dd6d0ac1c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 08:38:32.4096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aef3Ev8gZD1gUA9Cl82l9CgT4pUttiRKAtluD9bG3HBcQ4viHvXdAnSug/lEz1r0V4MhKga2TlE9C/IAdS6uqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI0
LCAyMDI1IDExOjUyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAwOC8xNV0geGVuL2FtZDogZXhwb3J0IHByb2Nlc3NvciBtYXggZnJl
cXVlbmN5IHZhbHVlDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvY3B1L2FtZC5jDQo+ID4gQEAgLTU2LDYgKzU2LDggQEAgYm9vbCBfX2luaXRkYXRhIGFtZF92
aXJ0X3NwZWNfY3RybDsNCj4gPg0KPiA+ICBzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IGZhbTE3
X2M2X2Rpc2FibGVkOw0KPiA+DQo+ID4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVpbnQ2
NF90LCBhbWRfbWF4X2ZyZXFfbWh6KTsNCj4gPiArDQo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IHJk
bXNyX2FtZF9zYWZlKHVuc2lnbmVkIGludCBtc3IsIHVuc2lnbmVkIGludCAqbG8sDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmhpKQ0KPiA+ICB7DQo+ID4g
QEAgLTY4MSw5ICs2ODMsMTUgQEAgdm9pZCBhbWRfbG9nX2ZyZXEoY29uc3Qgc3RydWN0IGNwdWlu
Zm9feDg2ICpjKQ0KPiA+ICAgICAgICAgICAgIHByaW50aygiQ1BVJXU6ICVsdSAuLi4gJWx1IE1I
elxuIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICBhbWRfcGFyc2VfZnJlcShjLCBsbyksIGFtZF9wYXJzZV9mcmVxKGMs
IGhpKSk7DQo+ID4gLSAgIGVsc2UNCj4gPiArICAgZWxzZSB7DQo+ID4gICAgICAgICAgICAgcHJp
bnRrKCJDUFUldTogJWx1IE1IelxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICBhbWRfcGFyc2VfZnJlcShjLCBsbykpOw0KPiA+ICsgICAgICAgICAgIHJldHVy
bjsNCj4gPiArICAgfQ0KPiA+ICsNCj4gPiArICAgLyogU3RvcmUgbWF4IGZyZXF1ZW5jeSBmb3Ig
YW1kLWNwcGMgY3B1ZnJlcSBkcml2ZXIgKi8NCj4gPiArICAgaWYgKGhpID4+IDYzKQ0KPiA+ICsg
ICAgICAgICAgIHRoaXNfY3B1KGFtZF9tYXhfZnJlcV9taHopID0gYW1kX3BhcnNlX2ZyZXEoYywg
aGkpOw0KPiA+ICB9DQo+DQo+IEFzIGJlZm9yZSAtIHR5cGljYWxseSBvbmx5IHRoZSBCU1Agd2ls
bCBtYWtlIGl0IGhlcmUsIGR1ZSB0byB0aGUgY29uZGl0aW9uYWwgYXQgdGhlIHRvcA0KPiBvZiB0
aGUgZnVuY3Rpb24uIElPVyB5b3UnbGwgb2JzZXJ2ZSB6ZXJvcyBpbiB0aGUgcGVyLUNQVSBkYXRh
IGZvciBhbGwgb3RoZXIgQ1BVcy4NCj4NCg0KSSdsbCBleHRyYWN0IHRoZSBwcm9jZXNzaW5nIGZy
ZXF1ZW5jeSBsb2dpYyBpbnRvIGEgbmV3IGhlbHBlciwgbWF5YmUgYW1kX3Byb2Nlc3NfZnJlcSgp
DQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYW1kLmgNCj4gPiArKysgYi94
ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYW1kLmgNCj4gPiBAQCAtMTc0LDQgKzE3NCw1IEBAIGJv
b2wgYW1kX3NldHVwX2xlZ2FjeV9zc2JkKHZvaWQpOyAgdm9pZA0KPiA+IGFtZF9zZXRfbGVnYWN5
X3NzYmQoYm9vbCBlbmFibGUpOyAgdm9pZCBhbWRfc2V0X2NwdWlkX3VzZXJfZGlzKGJvb2wNCj4g
PiBlbmFibGUpOw0KPiA+DQo+ID4gK0RFQ0xBUkVfUEVSX0NQVSh1aW50NjRfdCwgYW1kX21heF9m
cmVxX21oeik7DQo+ID4gICNlbmRpZiAvKiBfX0FNRF9IX18gKi8NCj4NCj4gSSdtIGFsc28gcHJl
dHR5IHN1cmUgdGhhdCBJIGRpZCBhc2sgYmVmb3JlIHRvIG1haW50YWluIGEgYmxhbmsgbGluZSBh
aGVhZCBvZiB0aGUNCj4gI2VuZGlmLiBQbGVhc2UgbWF5IEkgYXNrIHRoYXQgeW91IHRob3JvdWdo
bHkgYWRkcmVzcyBlYXJsaWVyIHJldmlldyBjb21tZW50cywNCj4gYmVmb3JlIHN1Ym1pdHRpbmcg
YSBuZXcgdmVyc2lvbj8NCj4NCg0KU29ycnksIEknbGwgYmUgbW9yZSBjYXJlZnVsLg0KDQo+IEph
bg0K

