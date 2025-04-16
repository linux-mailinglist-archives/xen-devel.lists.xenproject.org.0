Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B27A8AEAC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 05:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954852.1348780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4tr6-0000Rc-Ai; Wed, 16 Apr 2025 03:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954852.1348780; Wed, 16 Apr 2025 03:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4tr6-0000Pp-7a; Wed, 16 Apr 2025 03:54:32 +0000
Received: by outflank-mailman (input) for mailman id 954852;
 Wed, 16 Apr 2025 03:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slpe=XC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4tr4-0000Ph-1x
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 03:54:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df54824-1a76-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 05:54:28 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Wed, 16 Apr 2025 03:54:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 03:54:23 +0000
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
X-Inumbo-ID: 7df54824-1a76-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4kyl9/r9Zl+jU4XBez4Lk/GGlclZvz7fJuHkEK+A4GYz/DO2hoOwO8H0O4X5yNNd3kqLLY7UO+ANxS40tjCsJS+RdGGG46ZWr+l7G9CyhelDB6K+iC82NzRbe1Ee2mzlL8EhRVL3X5p+8qdJzLBexM10yAn50Ns/cCJaA9Qh0jdiffG+XKUFaxYx/A4kYVJS0TvBGlUt9si494/4x1m0Kgiu7CTvwdU5rY/jhb0UpcZL+jEs6PnpEtV+U06gA90/l5Aha9OPnF4F/yGoAeVYupRk15SRjJwsX8sz6SGVaaixr267PQ60LBQqVg0rYEj4MKmeR/cstqTgeE/qdDSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c07+tqiNnwSTosVgWyuCrtj+bsNxAKuROUQ/E9k2O9g=;
 b=LVyLGrUoEeRmIQPwdwO5rS+ca24gxQfgy9getYlpPAisxEA1cQuiJR89ly5hjumPFszKxUtflClbw5RhKv0eBEKxAhjTI3joBjH74BwNsOnCNk9aaYWoeN9rfBl3aGkBTb7nbigJWl3bpLv1qOhRee+g8pyZIS2owGn0iKIYn7+504koeD9XNK2hmutQPYx+REFKRMeOmcr5FUjJuwdK2jBHAxAn7PnVTz54a4H2AHc3bSKvYHM9TXAFntKrKa1I6QcYjQEW5o7makjARwlsoj7tPfiwLXSQ8MCUUlS1O0HvllYbVd4qc7HbdWkIYVMh4ZD+9W9/bm9lKtaP8ZeTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c07+tqiNnwSTosVgWyuCrtj+bsNxAKuROUQ/E9k2O9g=;
 b=1OvVNz+RPlkVfwvZamgGTG4AHOYQbTna18OX00MfEke9o6jJJFFKe6VVSd+AZVy5nTOOpD6r6hY/gs81/6ZWJKT08nBQf6V1ilSMeRuW46mpeZ3Am7gDOW1CnGDo2488Tgc2NhsynNFYFs524nlf+NZe5F5zvG//27gLO5SmCeE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>
Subject: RE: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
Thread-Topic: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
Thread-Index: AQHbnhN0GO5sSI+g2kqtQPzlgrAUG7OO0pKAgBbuLcA=
Date: Wed, 16 Apr 2025 03:54:23 +0000
Message-ID:
 <DM4PR12MB84519E18C6F4FA7724C03751E1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-11-Penny.Zheng@amd.com>
 <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
In-Reply-To: <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=8bd29732-aed8-4ef7-b226-d4447684affd;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-16T03:53:37Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB5916:EE_
x-ms-office365-filtering-correlation-id: 049a515b-69f9-4ff2-14c3-08dd7c9a5fd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WnYrWU1TOXFQcEI1bTdnWjJ3YnIzYVNRZzg1Y1pGMUx1Q3dmTDcycC8xSDk0?=
 =?utf-8?B?MXRZbW90ZnJQUmM4ellmd1lpa0Q0WUJjUGsxeTk2MmRQL0p1Q2dkZFZMaE9x?=
 =?utf-8?B?ZVRzWkVPNjJ1ZVl1VkZSUzBHTHA5dVV4K1NpeE5OK0RiWko0b0YrUzhNNzNv?=
 =?utf-8?B?bUZVWlBjWS9WV1NmdXdhbXlwVmZhM0VCQjN2NzRveWhLU1VyQldqTEpFZE1E?=
 =?utf-8?B?UVVKak9GTy8vS0t6Zk1jM3VJMmRwZGZKTWZiV1lGWVF6dmZkRWJuWW9KWHl0?=
 =?utf-8?B?TUcxVzh2WVhRNkthRWgweThrb3A1YjdxamJoSFhwdWd1R3d0Q3U2WENCa3Jh?=
 =?utf-8?B?RTZiRnFFaXVDVk5TVDJTSjYyT3ZTRzlLekZ0WG1OWUhiM01iaUdTcTlsQ1Zi?=
 =?utf-8?B?ZmVSTzZ3ZTZnUGRCbDlDWDRnK1FHUXM5ZjdvK2ozcTlwSHpGQnU5QkgyZUF5?=
 =?utf-8?B?bVRWdzdxZjZuNGJLRWxTcGE2ZFhSWHpFcVR3aFdaMGRQckU1aFd4amVlZVNX?=
 =?utf-8?B?R2xsaVZYa0ZOUDdRbHpIeVVTRndrUHFNZUJhNS9vKzJBQi9JdlE1azRVL2xQ?=
 =?utf-8?B?Vi8yWDY4LzRRbTlUQlA4bnUzVW8wZGZUZmE3cnE2cVYwd2c1enlMY1dLckJl?=
 =?utf-8?B?VDRpcHNLZTl2bE9Ra0NmVS9ZdWNlcU83N05qNHlkSUxkVTFOWEczNEIzNHpH?=
 =?utf-8?B?TE1Bb2JPS0Rtcm5QTnltcm5WL2h5VWNFRHAzZG5yaG95YmlET2Z5SFR1cVZP?=
 =?utf-8?B?MVNoZEE3cm1sbnJuZk14M0E5OFNSTC9aTG5McnUxYjdXTUJJVlZ6TWFKUmtF?=
 =?utf-8?B?OWpKZ045VlN3SDBmYlJsSHJzNVA1aHlWOFM0cThYR1VGbnpEQjNUSVdZRzRG?=
 =?utf-8?B?aWh1K0Zadm5hOGkvREoxaDZuN3ZxTkFDamU2aUdsckwyUkpObXdzU1B2QkUy?=
 =?utf-8?B?MUZwZkZhNlJpUDNYUlIyYTVSYUxtdk5BUkVoQWtnd3c3VzZFdENXR1U4cW1K?=
 =?utf-8?B?Nm1XclBET3pFQlhXYXFaOFdwdEZTa3hXd2FucHZsamlXSTdKYm1tWTI0Y05J?=
 =?utf-8?B?VTNLcDlYMzFXUzhDL1ErdjJqSlVHVmdmVEt2YWRzaDJwWkx6Zm9PZWVORHZR?=
 =?utf-8?B?cElPT3pBSnJHbmlwd3R5by80MVp3ZDV1cGh3ZWRaYktIWUljMmozbTY3S0NX?=
 =?utf-8?B?aU1UZitJVmRFY1ArT1hqcE8zY0dRRHoreVFnS1QwS2dPNGRqTmN4MmdFbGhF?=
 =?utf-8?B?dVlqR3ZLNE9JZUIwOE9laEU3WjRBRHR6c3lBdS9LakU1dWpBN29tV001T0hp?=
 =?utf-8?B?YU1RYVRGKzNONHd0dkUwZWh1WjhtU1V3a01IZVJrZlJEWmZLdm04VTBkSm55?=
 =?utf-8?B?ZVNtR2JlemUvOTVJSUJEbFYvZDRFQVhucno4VjRTMjl6OVZvZ3B3ZWlwWUVK?=
 =?utf-8?B?SWZqZTZSZCtDRkhtK1Z6NGdxTktiTlE2S1pFWDRXQmdKLzdOQ0p4VE1NMnJ2?=
 =?utf-8?B?L3dMWHhIYzdDL0hSd255eW1pV3ZrbzhZUU1nK290V09RU25NNFJaOGQrc1RU?=
 =?utf-8?B?bVZ1L2xyMDBPbDVCSTZvT2VibmxwOG9Pa1oySExwaFJEeUN0cGgzTWN3dHdO?=
 =?utf-8?B?MTJ5a1JTOEhKT2JtZHJMbkoxTzQ0Ukd6bXBINVhmMnJqbWs5YkQzenV1bnJN?=
 =?utf-8?B?U0ZCVFlGbFNWNWtnVi9SVE5lNHJUNjFLWWNPQ2hQWmhMUzUxeFRIaXg3SVpG?=
 =?utf-8?B?THpsWnVmZEYyZEF4OVhxUFc3YjJ0VE5yNlRRanNuN2UrYlJKaWRhdXdadHFj?=
 =?utf-8?B?MGJqODFwTDF4aXNoWlN6ZEJScGJtTHB4alh0Z2dIbTVEMXlXNnpFeG1nam0v?=
 =?utf-8?B?MVVLNStkSkxJeUxITXFBVUFHVnhLcE9kbThuZCs2R0JqN2xWVVdodWhqb2NB?=
 =?utf-8?B?NjlUaVlldlRDM09ma3NWYm5RVGo0S3UwTDF2UFhqN2o2anZoRTZRY05Bamcv?=
 =?utf-8?Q?KyOUldDIwwabs61VVroI6gKu4+6Zrc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGxWMGxpTnRESVlXMkFSN09qRHlSdlBIWnJSSTFKb0NjTkkxcTl4aDIrQklq?=
 =?utf-8?B?SFRGVzA1Ynp2M2R5bmRPcURNYlNkMklUKzhPSFhGQm14NkNMNlRRRDFMSkdH?=
 =?utf-8?B?SlRzRVRrRW5OQW9NSFQ2cGxXNTNYUFJMUElHS3N0UWxFaGQrU2x0QnZGdmZh?=
 =?utf-8?B?VytTaFJMOVp2bVU0Y2Y4dWhvZXNrSldrNEVPTjRFWDE4alZsZEtCaHZiZERJ?=
 =?utf-8?B?NDFxeXhoUUhDSy8zZkVzQTIrMDkxNmkvZDgzQmt5bmlwMHVZSnJLK1RQUTU0?=
 =?utf-8?B?eG04QW1TM3N6eVFBbDNxZ2RFY1RIb2VoZHc3SkRGZG1peXIrNXQ3UHFJRlQ5?=
 =?utf-8?B?WjE3SVQ4L1lCOSsycTE5MzV2S1d6aXp2T3hqdWxhYjdTWUFKSTVsMVQwVTJs?=
 =?utf-8?B?Z3NXemtZVVhmNEhvRk82SHQ0Z3BNSE1veU4yUGtDanRGQ2dhMGNXQnFmcUY0?=
 =?utf-8?B?WFFDWU5sQ3ltTmZWb1pWU01JRFlKMWRDdjl3ZExtY05GQ2V2OTVtRWp2M0gy?=
 =?utf-8?B?cjZreW5mTnZBSkt6TW93YVJZeDNtalRxWVFTU1p4ZUJtclhxVzcyT0UwUDda?=
 =?utf-8?B?anZXeFlCbVpWRXBkc2M2YXBxUjN2SnFTWmluL1ZBakZDaWFuL2ZaSkNTamRT?=
 =?utf-8?B?a3prYUJLSXBhQ2JiaWJVQ0gzb0d6MVVBZzJBZHFoZVpsMldIa2E5RlNYQUtK?=
 =?utf-8?B?amtOcWEyeEZXQ3ZYa1ZkaDVtczVRRk5tVnVyQTFkUnhpWEVvcmxxQytaOWZS?=
 =?utf-8?B?SG1mZzlheEVLNitua0F0TVZJNHNHRTAvMW8rUjdFV1hmRHI5dVcxTXRBUnZV?=
 =?utf-8?B?M21JTEhLT0pjNnR1SXJqcmdTQmdYRmlXRCswRkEwRGhlZ1BmcU96RnFpUEJi?=
 =?utf-8?B?QjU2OU5jK1JYMzY0VG96ZHhJSE5NelhCemJxbFg4cnMydVF1L2x4QkZkdkg0?=
 =?utf-8?B?MDVhajRxSGFETEttK2FXQ0haVE1BU1hwTHhwT08wVzlqQXhmWXRrWlFjOTBW?=
 =?utf-8?B?eURUWnF5ZmJITkdZcm9CMC9pZnJUd2dGcHpCZlMzMGZ2N0J6Q2JZYlVsVEc5?=
 =?utf-8?B?WnpEZ3BnT0F4SUo1NjJTZ3F3QmpEUlVWYk1XcHVoVUpqRnZoRTBRSnl6Tmpo?=
 =?utf-8?B?QzluSHJjblZOcThqZnRWa256QnoxYUdQSU5SZm00Mk9LYi9VTDRHMldRdTE1?=
 =?utf-8?B?RkpKK3J3d0RjaFE2TkVFcmV4MkpFZisxTTZjN0Zvb2VKOFV1bVZwVzhBZ0FZ?=
 =?utf-8?B?K0RDVUVxVW9FWXVjTEp2UVRhR2s4U3hrREsxekNsdG1FSjZ5RlFFa3RWdnBH?=
 =?utf-8?B?VlA3VFUyQktvbW5ab2huRzF3a25wMkwyYmF6bXU0MmZhcEZQWXhWb2pxWnJp?=
 =?utf-8?B?SnFFRFNhZFJibE9KY0lYSSttTmRaVThkMks5elNiNWdLdTlDWEhCVHBFY2hn?=
 =?utf-8?B?K0pIN1E5VG9UVDJnbU9CSSsvVEVYcGJ1a3VXOGQyWmp0bGJWbXE4NEVmNkFX?=
 =?utf-8?B?WVM1MmRyaVFoSnlSZCtLOTNSajZqYzVxWFJtWkd5eDNKcUZuemtuOUNTbmRa?=
 =?utf-8?B?aEZLek00eXJteTJURitjb0pwZGNqWHh6M1NxVTdqeXJUZ1FaNGoxTFY1VjFk?=
 =?utf-8?B?TVlJWDltOWMrMHpQM3BMeHZRTTVvWU9kOWRKSXVONjl3YldGclYxK2ppRTZG?=
 =?utf-8?B?am85TnhtakFDNFBWS2ZVVGI3VVBaWjM3cUtsNGVONFR2Qmc2N0N5Q0lDcWZU?=
 =?utf-8?B?SHZyb2xoSXpzSzF6QXlKRkZKcjdqU01hZk1Jait4YXhMWVVoYzJjbmliWUlR?=
 =?utf-8?B?aFU3T2N0SS9lbU95T0Fpblp3NWZmR1lzMHRMeHhEcVpiUGNGN1FnQlYyWGg1?=
 =?utf-8?B?TnM0S0pmZitneTgrU01Rd2V5U1A2Nnh5YWwvVnpUVU5ycFFFVWpMTDZQazVq?=
 =?utf-8?B?RFBLUUMxd2xWWDNTUEhUOHdoOEloRUQyMHRmVmtBaENONFlGY0JRallKaHpu?=
 =?utf-8?B?QlVJMDV5UXp2TEpEMHdsR3E0WG42VERKL2dTaTRJVXhJeTVxUWYxL1JlWlg0?=
 =?utf-8?B?d0h4Vm40eG1IalVCYzZ6OEtYVUg4QS9FNFJJNExuUzM2YlV2UmpZclhLdzdR?=
 =?utf-8?Q?UaqU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049a515b-69f9-4ff2-14c3-08dd7c9a5fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 03:54:23.0739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RX7HNiTocchjrDw8n2rujXgQ41ZJLbSDhazHDMv07ZKoKKfhqLrsbeO/S9bX9KsVzrebgTnFccefO2paScarug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAx
LCAyMDI1IDk6MTAgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxMC8xOV0geGVuL3N5c2N0bDogaW50cm9kdWNlIENPTkZJR19QTV9TVEFUUw0KPg0K
PiBPbiAyNi4wMy4yMDI1IDA2OjUwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBXZSBpbnRlbmQg
dG8gaW50cm9kdWNlIENPTkZJR19QTV9TVEFUUyBmb3Igd3JhcHBpbmcgYWxsIG9wZXJhdGlvbnMN
Cj4gPiByZWdhcmRpbmcgcGVyZm9ybWFuY2UgbWFuYWdlbWVudCBzdGF0aXN0aWNzLg0KPiA+IFRo
ZSBtYWpvciBjb2RlcyByZXNpZGUgaW4geGVuL2RyaXZlcnMvYWNwaS9wbXN0YXQuYywgaW5jbHVk
aW5nIHR3bw0KPiA+IG1haW4gcG0tcmVsYXRlZCBzeXNjdGwgb3A6IGRvX2dldF9wbV9pbmZvKCkg
YW5kIGRvX3BtX29wKCkuDQo+ID4gU28gVGhpcyBjb21taXQgYWxzbyBtYWtlcyBDT05GSUdfUE1f
U1RBVFMgZGVwZW5kIG9uDQo+IENPTkZJR19TWVNDVEwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+IHYxIC0+IHYy
Og0KPiA+IC0gcmVuYW1lIHRvIENPTkZJR19QTV9TVEFUUw0KPiA+IC0gZml4IGluZGVudGlvbiBh
bmQgc3RyYXkgc2VtaWNvbG9uDQo+ID4gLSBtYWtlIGNvZGUgbW92ZW1lbnRzIGludG8gYSBuZXcg
Y29tbWl0DQo+ID4gLSBObyBuZWVkIHRvIHdyYXAgaW5saW5lIGZ1bmN0aW9ucyBhbmQgZGVjbGFy
YXRpb25zDQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMgICAgICAg
ICAgICAgICAgIHwgIDIgKysNCj4gPiAgeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9od3AuYyAg
ICAgICAgICAgICAgfCAgNiArKysrKysNCj4gPiAgeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9w
b3dlcm5vdy5jICAgICAgICAgfCAgNCArKysrDQo+ID4gIHhlbi9jb21tb24vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKysNCj4gPiAgeGVuL2NvbW1vbi9zeXNjdGwu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ID4gIHhlbi9kcml2ZXJzL2Fj
cGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgeGVuL2RyaXZlcnMv
Y3B1ZnJlcS9jcHVmcmVxX21pc2NfZ292ZXJub3JzLmMgfCAgMiArKw0KPiA+ICB4ZW4vZHJpdmVy
cy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYyAgICAgICB8ICAyICsrDQo+ID4gIHhlbi9pbmNs
dWRlL2FjcGkvY3B1ZnJlcS9wcm9jZXNzb3JfcGVyZi5oICAgIHwgMTQgKysrKysrKysrKysrKysN
Cj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMNCj4gPiBi
L3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMgaW5kZXggNDIwMTk4NDA2ZC4uYjUzN2FjNGNk
NiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jDQo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KPiA+IEBAIC0xNDg3LDYgKzE0ODcsNyBA
QCBzdGF0aWMgdm9pZCBhbWRfY3B1aWRsZV9pbml0KHN0cnVjdA0KPiBhY3BpX3Byb2Nlc3Nvcl9w
b3dlciAqcG93ZXIpDQo+ID4gICAgICAgICAgdmVuZG9yX292ZXJyaWRlID0gLTE7DQo+ID4gIH0N
Cj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX1BNX1NUQVRTDQo+ID4gIHVpbnQzMl90IHBtc3RhdF9n
ZXRfY3hfbnIodW5zaWduZWQgaW50IGNwdSkgIHsNCj4gPiAgICAgIHJldHVybiBwcm9jZXNzb3Jf
cG93ZXJzW2NwdV0gPyBwcm9jZXNzb3JfcG93ZXJzW2NwdV0tPmNvdW50IDogMDsNCj4gPiBAQCAt
MTYwNiw2ICsxNjA3LDcgQEAgaW50IHBtc3RhdF9yZXNldF9jeF9zdGF0KHVuc2lnbmVkIGludCBj
cHUpICB7DQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICsjZW5kaWYgLyogQ09ORklH
X1BNX1NUQVRTICovDQo+ID4NCj4gPiAgdm9pZCBjcHVpZGxlX2Rpc2FibGVfZGVlcF9jc3RhdGUo
dm9pZCkgIHsgZGlmZiAtLWdpdA0KPiA+IGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9od3Au
YyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvaHdwLmMNCj4gPiBpbmRleCBkNWZhM2Q0N2Nh
Li45OGU5ZDQ2ODkwIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEv
aHdwLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2h3cC5jDQo+ID4gQEAg
LTQ2Niw2ICs0NjYsNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGh3cF9jcHVmcmVxX2NwdV9leGl0
KHN0cnVjdA0KPiBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQ0KPiA+ICAgICAgcmV0dXJuIDA7DQo+
ID4gIH0NCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX1BNX1NUQVRTDQo+ID4gIC8qDQo+ID4gICAq
IFRoZSBTRE0gcmVhZHMgbGlrZSB0dXJibyBzaG91bGQgYmUgZGlzYWJsZWQgd2l0aCBNU1JfSUEz
Ml9QRVJGX0NUTA0KPiBhbmQNCj4gPiAgICogUEVSRl9DVExfVFVSQk9fRElTRU5HQUdFLCBidXQg
dGhhdCBkb2VzIG5vdCBzZWVtIHRvIGFjdHVhbGx5IHdvcmssDQo+ID4gYXQgbGVhc3QgQEAgLTUw
OCw2ICs1MDksNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrDQo+ID4gaHdwX2NwdWZyZXFfdXBkYXRl
KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqDQo+ID4NCj4gPiAgICAg
IHJldHVybiBwZXJfY3B1KGh3cF9kcnZfZGF0YSwgY3B1KS0+cmV0OyAgfQ0KPiA+ICsjZW5kaWYg
LyogQ09ORklHX1BNX1NUQVRTICovDQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVm
cmVxX2RyaXZlciBfX2luaXRjb25zdF9jZl9jbG9iYmVyDQo+ID4gaHdwX2NwdWZyZXFfZHJpdmVy
ID0geyBAQCAtNTE2LDkgKzUxOCwxMiBAQCBod3BfY3B1ZnJlcV9kcml2ZXIgPSB7DQo+ID4gICAg
ICAudGFyZ2V0ID0gaHdwX2NwdWZyZXFfdGFyZ2V0LA0KPiA+ICAgICAgLmluaXQgICA9IGh3cF9j
cHVmcmVxX2NwdV9pbml0LA0KPiA+ICAgICAgLmV4aXQgICA9IGh3cF9jcHVmcmVxX2NwdV9leGl0
LA0KPiA+ICsjaWZkZWYgQ09ORklHX1BNX1NUQVRTDQo+ID4gICAgICAudXBkYXRlID0gaHdwX2Nw
dWZyZXFfdXBkYXRlLA0KPiA+ICsjZW5kaWYNCj4gPiAgfTsNCj4NCj4gU29tZXRoaW5nJ3Mgd3Jv
bmcgaGVyZTogVGhlIC51cGRhdGUgaG9vayBpcyBhY3R1YWxseSBtYWtpbmcgY2hhbmdlcywgc28g
aXMNCj4gZGVmaW5pdGVseSBub3QgKG9ubHkpIGFib3V0IHN0YXRpc3RpY3MuIFNhbWUgZm9yIHRo
ZSBwb3dlcm5vdyBkcml2ZXIuDQo+DQo+ID4gKyNpZmRlZiBDT05GSUdfUE1fU1RBVFMNCj4gPiAg
aW50IGdldF9od3BfcGFyYSh1bnNpZ25lZCBpbnQgY3B1LA0KPiA+ICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB4ZW5fY3BwY19wYXJhICpjcHBjX3BhcmEpICB7IEBAIC02MzksNiArNjQ0LDcNCj4g
PiBAQCBpbnQgc2V0X2h3cF9wYXJhKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5LA0KPiA+
DQo+ID4gICAgICByZXR1cm4gaHdwX2NwdWZyZXFfdGFyZ2V0KHBvbGljeSwgMCwgMCk7ICB9DQo+
ID4gKyNlbmRpZiAvKiBDT05GSUdfUE1fU1RBVFMgKi8NCj4NCj4gVGhpcyBhbHNvIGlzbid0IGFi
b3V0IHN0YXRpc3RpY3MsIGJ1dCBhYm91dCBnZXR0aW5nIC8gc2V0dGluZyBwYXJhbWV0ZXJzLg0K
Pg0KPiA+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9jb21tb24vS2Nv
bmZpZw0KPiA+IEBAIC01NTcsNCArNTU3LDkgQEAgY29uZmlnIFNZU0NUTA0KPiA+ICAgICAgIHRv
IHJlZHVjZSBYZW4gZm9vdHByaW50Lg0KPiA+ICBlbmRtZW51DQo+ID4NCj4gPiArY29uZmlnIFBN
X1NUQVRTDQo+ID4gKyAgIGJvb2wgIkVuYWJsZSBQZXJmb3JtYW5jZSBNYW5hZ2VtZW50IFN0YXRp
c3RpY3MiDQo+ID4gKyAgIGRlcGVuZHMgb24gQUNQSSAmJiBIQVNfQ1BVRlJFUSAmJiBTWVNDVEwN
Cj4gPiArICAgZGVmYXVsdCB5DQo+DQo+IEFzIHBlciBhYm92ZSAtIGVpdGhlciBuYW1lLCBwcm9t
cHQgYW5kIHRoZSBkZXNjcmlwdGlvbiB0aGF0IFN0ZWZhbm8gc3VnZ2VzdGVkDQo+IGFyZSB3cm9u
Zywgb3IgaXQgaXMgdG9vIG11Y2ggdGhhdCBpcyBiZWluZyBjb3ZlcmVkIGJ5IHRoaXMgbmV3IGNv
bnRyb2wuDQo+DQoNCldlIGhhdmUgdHdvIHN5c2N0bC1vcCBvbiBwZXJmb3JtYW5jZSwgZG9fZ2V0
X3BtX2luZm8oKSBhbmQgZG9fcG1fb3AoKS4NCkkgdGhpbmsgZG9fZ2V0X3BtX2luZm8oKSBpcyB0
byBjb2xsZWN0IFBNIHN0YXRpc3RpYyBpbmZvLCB3aGljaCBjb3VsZCBiZSB3cmFwcGVkIHdpdGgN
CkNPTkZJR19QTV9TVEFUUywgd2hpbGUgbWF5YmUgZG9fcG1fb3AoKSBpcyBtb3JlIGZvY3VzaW5n
IG9uIHBlcmZvcm1hbmNlIHR1bmluZy4NCkhvdyBhYm91dCB3ZSBpbnRyb2R1Y2UgYW5vdGhlciBL
Y29uZmlnIENPTkZJR19QTV9UVU5FIHRvIHdyYXAgIGRvX3BtX29wKCkNCmFuZCByZWxhdGVkIGhl
bHBlcnM/IEkgc3VnZ2VzdCB0byBpbnRyb2R1Y2UgYSBuZXcgZmlsZSBwbXR1bmUuYyB0byBjb250
YWluLg0KT3IgYW55IGJldHRlciBzdWdnZXN0aW9uPw0KDQo+DQo+IEphbg0K

