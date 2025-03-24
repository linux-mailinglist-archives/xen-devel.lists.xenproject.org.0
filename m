Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F928A6D5A6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 09:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925079.1327951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twciV-0008DU-CM; Mon, 24 Mar 2025 07:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925079.1327951; Mon, 24 Mar 2025 07:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twciV-0008C2-9V; Mon, 24 Mar 2025 07:59:27 +0000
Received: by outflank-mailman (input) for mailman id 925079;
 Mon, 24 Mar 2025 07:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zPYW=WL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1twciU-0008Br-6S
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 07:59:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4c7c0c9-0885-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 08:59:22 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 07:59:18 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 07:59:17 +0000
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
X-Inumbo-ID: e4c7c0c9-0885-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPQRrEjnpyrQSovXtOelSi83a2TjKK9PnOWJEBjhbXZcDXOynl/tJHphloGc6/9XvhFyeoEQFf+OlNlNTYb8yCJ7eRXFfLV2b3oyRn4htKSCaIj73M/TZzI1KgtXVZPCVTKGwdhrDbZeBxbz8Ta2K6qerQIN2qJ3/Kr1sKK4/TG9/6kl5SHXkeRwt7BnYm83Hb91qGMzDhyALqapI88kldf1XxttUa8VnkVtrMIXDLtVJ+A8EytHbNYX6slTHkC7bUvhMb/yFT6d3GbV9FpdfFAarY7/URQ5c64+emFldBthSYoGy9vuvbhdUBEH+9/kDgpk8A3FNfJgnTBMeabEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwxPaEozaESBEW1iVkA/K3I3sTL2YRw+5pk+wbE0/cw=;
 b=xf2DZUsNcwCIlTtNIWU8KtObcEVL1npYX4lgL+dqIz/WMwZ+zUbvILbO2aCjdjY4og+xU+CYCvv2aylFZEGjCOtGxkRmFowsguF9dgj7v8B+u4tVp+wTvQSap3PdDqOS0c1KbBk5r/Xwu5FgXMebobvc17oiIV+NOtH6RbxgDtuOOJdY9KMlM1Y21xGmY68J2gKGLjQ7DWwPuNBOfl9anZbcwaNoB3kQ9lXVISd7dVqXJYdWNslYFmtd2GWBnY/5DNAINywOlgVPMsALT2OD8LkyvgeCWUnXJOAs7rFOGKq7+h097sAJZ59PnReo0YFEjugUqo+73udT2jwV04dnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwxPaEozaESBEW1iVkA/K3I3sTL2YRw+5pk+wbE0/cw=;
 b=qpOyMiAiIF1do6RJ4auwnzu7LQsCxvaecxYdK9QZjeVFZw7qro68S9ERoJ5hM2OdLk+VMOKvm16+WE5ThfzZvrV/jgy723sOuzpFekGDWDc/TCh2L7Tu3H/AynnMl57t7SjxylFcFdcCqxzVTS3MAP0iecoHeLvxUarzk1C7ojE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, Sergiy Kibrik
	<Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
Thread-Topic: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
Thread-Index: AQHbkwRVqqEOllQJtEeRzJGK6AnihrNxRScAgBC2aMA=
Date: Mon, 24 Mar 2025 07:59:17 +0000
Message-ID:
 <DM4PR12MB8451A85D3C1E9CAE59DE5924E1A42@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-19-Penny.Zheng@amd.com>
 <18983fc2-08e7-40eb-b5d7-738e36a2a271@suse.com>
In-Reply-To: <18983fc2-08e7-40eb-b5d7-738e36a2a271@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=38e40917-7f76-4008-b47a-3aa2517e97fa;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-24T07:58:59Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB8407:EE_
x-ms-office365-filtering-correlation-id: b1f60b5c-0237-4196-b8f3-08dd6aa9c713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N09McTJUZGozOExRekNNRm9md2c0aWxZb1BsSDAwZk1CWHIzYmZJMVlpUTJF?=
 =?utf-8?B?YWxiTW4rZkI4QXErbTRQMW5aVE4yS0d2VkZFN0J4QUUxb25zaUowYm0ydXNa?=
 =?utf-8?B?THp3c0t0MFVzSTllSHU4a3A2ank2OGdSTUw1bkRnZGFaUU9NeDhWV2JFVWsx?=
 =?utf-8?B?eExiMXA0c3pwY1JsOGJDUkE0cHNrOWRNL1FHOEVhUFNEdXI1K21jQ0ZaTXo3?=
 =?utf-8?B?V2pwV25yUjZNdDVETTlHYXBxRHJ1RllESXJrbmh2OFBxT3A4UE9lUFEwcFJX?=
 =?utf-8?B?WWF0QldJUFdLRUk3aDQvcXZQc0hYY29EQTc5VFhsbXJOUTIyd3R5N2lUUS8z?=
 =?utf-8?B?NUJiejhIYXhqS3F6UHE4Y2RBamNOOFMyQXNTSVZ5bDZyRE9vTWY4MFRlbUI3?=
 =?utf-8?B?VTV6ZE5jOFArV2xUdDdKMkhHcW5EaGFRWS9VbjBOOThsZGNGUHZVUzBaU1pJ?=
 =?utf-8?B?bk5LUGM2QWVHOU96ajZUaGw2Q1RzWlZwQTJVWThjTGljMXpKc1lsemlRdVFE?=
 =?utf-8?B?b0h3K3hhMGFxUHovWkRnRUtaV2U2ak52MjFya3oxRnVMblFvaWNsZlFVblJy?=
 =?utf-8?B?djd2bXpDRitZZjZCM0J0bERyS0krTVNEWEhnTTlnSlVaaW1zR25HVjV2S1dp?=
 =?utf-8?B?U2xMQlE2TVVXbVlndXhVcjBZek1QS29uK2FoQTdFUFlVNUl0TlBzZEpWZEtC?=
 =?utf-8?B?Z3MzQllOdTMvQWUwZVMzSURvbzVHVVhwMkE5aGxFU3pUdzlHQWM5bmZXUUFl?=
 =?utf-8?B?V2N6eFFGUDRvdjBkOHRwYUtHa2RSN2hkT0g2RlJPdWNtVmROSDJIR1NibC9t?=
 =?utf-8?B?TzNXdjlZSFNiY0JNdXlyQjlQU0RiZ2FScklPaWIzZjBMRHI4a3BSTXQvOVJ6?=
 =?utf-8?B?VncvMXR2aUVReXpXcXlJSnEvTjN4S01XV21GdTdmYVMwQ3AxVXlyTStra2x4?=
 =?utf-8?B?V0s5Y0F4TCtsTnRzaVh3cHVycHdvYnNZMkdnYmVnNHRVSzVmUGNRMy9XWkVi?=
 =?utf-8?B?SnFGWlFtak15YWZnRVQ4L1JGMzFtbHVydm5jTmJkbzJzKzhzaWFudHkvc2Vp?=
 =?utf-8?B?TzRkUHZhNTVpTEhoOW5RdDBLWXZwdjFKZHEwTmo1QnFKZEcwblphcVk4ZlBv?=
 =?utf-8?B?WkE3NE1XRTlCOVpiSit2NllUeDg5WWdvcTA4bzRGZnN3N1RiM1lESVJwVG4z?=
 =?utf-8?B?MnBNTmpsOXFjQ0xHYXBTclhuOVN2NC95SytPOXJLM0R6L3dDcDNjajJlenN1?=
 =?utf-8?B?WnZvUW9QWmY2MmJTOE5OUFg3ZG9pajBDUmg0ekw3dEw3K2c0ak5tM2VleFFR?=
 =?utf-8?B?K2s2VGZEeGluL3BsYWhmY045WVVzdE5nTmEyUHZLczJaQ3oxMlRlWi94aTlw?=
 =?utf-8?B?THUrSitFd3RHWlJhYjYyQkJuR3k1MWdFMXBpZWM4dnBPNm1HQ29ncXRYalIy?=
 =?utf-8?B?Z1loWnRjMmp2K3h5ck9CNEJZZEZXTVhzMXV5YkNBTDRmYnNLcTBnREVha016?=
 =?utf-8?B?UWRPWDdiOWRiL29OMzN0UGVueFNhY1VGbTh5SnlWS29sdThWb0ZMc2NwU0ZB?=
 =?utf-8?B?bUtpOE9hZVdvQkRHdW50SzVQUnVubm9sVzhBcXJBSWR0U25SWVQyc3NhQzR2?=
 =?utf-8?B?MjJaM2dOcjZGcXVBZmllSUptNXhEWEk4QloxQUtWQmU0cWIyazdkeE4zV3gr?=
 =?utf-8?B?d0xrY0x1UlBzQ3N4SEVyNTA5Z0V3NG9UKys3Q29JeHJTUHkraXZ5ZXZJWGdW?=
 =?utf-8?B?L2FiazRqVDh4c2p2UlR0TE8rUjFLRUU0dkZTaWNYdjJPODc4WUxkK2FMemxv?=
 =?utf-8?B?RnNuSDNHM2tzc1duQ2V1UlJpMkY1V0N5T0w5VU0wQTRMMDh0R2hKRFZDNWZU?=
 =?utf-8?B?ZkxEVmZ0QlJld05HaXI5d1UzeVdhNEhUQ1RBRndjTWhTcGIxbjBSanBOMUlR?=
 =?utf-8?Q?yjBnHrvAS8JhTz69AJXXYpnzWh3CdfSc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUV6UjlCS0VUQ0FkTXlZeTVqUWkwcnEwK3B5S2sxa1JsWS9RaHZHbmQyejln?=
 =?utf-8?B?eDdnTFZkaGFMY1JabWV1ZGlZbS9FUFBRQlI5YjZ2WDlZeWpPSGt5R0xBdUFw?=
 =?utf-8?B?SVYrUmVvZ2o3ZHVrTWlyd0VSbHNoVDZPWGc0WDEzdmREK1EzR2NQUTQwSVFx?=
 =?utf-8?B?NnE3VGdzZUgydDh3RFVHUHJhb2FNUkxiUDA3VHdnbXdnc05weG9PSWRKTlVO?=
 =?utf-8?B?UXVzWDlLSldXY2ZTS3hldGxXdVJEYW4xK3hEOTNWd2YyMXRzREZPYmhGNWpp?=
 =?utf-8?B?WVJCNmFKWWE3R2wzdDRsVmN4S2JXeW9aSk1WNnJXdDlnT1l2M3BsUkh1dXBK?=
 =?utf-8?B?d3M1TkFZN2VENkVjZmxxUUdHa1VXOTRtV05HVmJkaGhEZ3p5a3hBTThDTW9u?=
 =?utf-8?B?N1VHaW15YWZpN1F6WXB4WTh6ZEpGS3huUCtma3VvVDRkN1NnOUxWZGRreFJ5?=
 =?utf-8?B?WXFjbFpBeXoybnJPcW1qc3hWTlBlenBLS0tnVXAxeDVEdVhUT3BraC8rYkxD?=
 =?utf-8?B?R3N5djlxbXkvZ1hYYUpiSGFLWUtYbDVCQ0cwelFVYnU1eHZwNC83NDlRWGcw?=
 =?utf-8?B?cytZejhaWVlocXk0QmdYbDZKWGQwV3FOcTFocUFTQ09pd1NoOGJPcnNiTCsx?=
 =?utf-8?B?VHdMMk5VMktnS1kwN1ErVmUvSzhMVmlFcHBxeWVxNXQwLzkzNDVwRmprYVdY?=
 =?utf-8?B?M1hvTyt1T0pMdTRKUEVhSFZVRU5JYlQ2eXhJT2FnU2pPOTE2L1FEL0V4QnZR?=
 =?utf-8?B?c3BQVSt3Q0ZDUEJMZVpaWnRXckVHbE8reWxFM3dRODQyVUh0aWlsakZhcXBW?=
 =?utf-8?B?QjRGbzN5ZWdlZzNSWnZJYm1qQ2d0dXRBcUVuL2tsTWNvaS9CSGZSQXVLcHpV?=
 =?utf-8?B?Lzg3YlhUQ3JlK09IRlk0aTdTVVZVN3pJWGZMazd5aVJEQUF3ZUo4SitMVjJY?=
 =?utf-8?B?KzdSNzNnUkpzRzhuZ2ZsSUdMNDNWREtnaFN5d3JzQXNwS2JBQ2FhN01OMW9z?=
 =?utf-8?B?RkpiMk0rNFFINEtwTTBIZmZtNXd6RmtWbDc0MFVkVmFHNW9CTmNJS1Q3RUlL?=
 =?utf-8?B?WTgvcHE2S2ZZSG92RDZRQklLZGJodkQ5bmd6ckhNVVpvMUNJTmNlSldhU053?=
 =?utf-8?B?QmtWUlFaVGJWZGxCSXkwZEM0SE5QV3ZlcWlnRDhyU3Z6RmVhSzJHRURZL2t1?=
 =?utf-8?B?LzB0UnYxV3dJMGUrWE1DOUU4bStENHNxeG1LdzI1b3VPQ1JMQWp3OWF2WXlQ?=
 =?utf-8?B?VnFNbTA1a016emJKZHNzQk55ZUF2RE52YzdaazJZeE1WdHhqdm5RaDFZNmhi?=
 =?utf-8?B?b1plNFBDVElzUVRRMDBMeUU5TVQzK3E5Umt5REg4QXUyZU54N28wR24xeFl4?=
 =?utf-8?B?VHlBWHVCOG93Ly9GSjVCeHNnUTB0N01ZcmFkaCtXdC9Wa0tWUGJ0Z1ZYZFJa?=
 =?utf-8?B?ZXlpSGluUzRNcXJyeExwVUFGNzhodHdKbEJKRFFYRUhsZHVrOVY1cE82VU9a?=
 =?utf-8?B?ZktWWjFXN3k1a2lMWDZvUjB2M1V2Smx5S0RwQW55NWZKL0k1VHAzYm15bTZH?=
 =?utf-8?B?VU83U3VabXVDRXU4LzJIS2dxMExzQkpPcjVpeE5kSnplMzJlTU5RdURSdEIv?=
 =?utf-8?B?Q3I3bHJBTTM0Vzdadzcxc1loRjBVYWNkdGM0WkxadmZjT3ZuL3VDMFdXQ3hk?=
 =?utf-8?B?RFlsS2s1WGwzcDkvRS93RHdzejlTcnpBa2pObFFDZ0c3empuUnJ1YkpZRTRm?=
 =?utf-8?B?UU9hZVFPQUpZdlhVTFRmYXI1NVJxVzNzOEVIejQ3emRZYzRrbGk0TC9BeGd3?=
 =?utf-8?B?ejhSdnNNSnlDd2Jnb2Q5OHZKSnc1QVhUaDZTOUdDdUtqeStPVkVDWmpERWMx?=
 =?utf-8?B?SCtMQVFsMXpyWmQ2MzViT2g2UUtDSHY2eGw3bGRmdVZsL0hiczhaWW9WUExE?=
 =?utf-8?B?Ly9pNEZvV2ZxWS9KZ1ZoWEdHb2g2MURHZXQxTEhJbUNmRW1uN0srUnI3RjlR?=
 =?utf-8?B?TFpVVGhXSHljL1BnbGRDeFhZaWdIay9VdGNaRlJrUVg1T1B2UXRhY0ZlTHdE?=
 =?utf-8?B?MGx0b0FhVGpXZTBFNXpxZjZoZ1E1ZXVZZE9PN3lZUWxEY3kxSjNnWFVIOVhh?=
 =?utf-8?Q?8I0Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f60b5c-0237-4196-b8f3-08dd6aa9c713
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 07:59:17.7936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +wMcJCbTXMJbk2B6Uiq+zrHvGcuXdXU+grnhx+4B21SWwzLcnXEH2fPuMe8ea+SOJIWXApev8fdPuzIvDflrog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE0
LCAyMDI1IDEyOjMzIEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+OyBPcnpl
bCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVj
aD47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQWxpc3RhaXIg
RnJhbmNpcw0KPiA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPjsgQm9iIEVzaGxlbWFuIDxib2Ji
eWVzaGxlbWFuQGdtYWlsLmNvbT47DQo+IENvbm5vciBEYXZpcyA8Y29ubm9qZGF2aXNAZ21haWwu
Y29tPjsgT2xla3NpaSBLdXJvY2hrbw0KPiA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+OyBT
dGFiZWxsaW5pLCBTdGVmYW5vIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT47DQo+IFNlcmdp
eSBLaWJyaWsgPFNlcmdpeV9LaWJyaWtAZXBhbS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAxOC8xOV0geGVuL3N5c2N0bDogd3Jh
cCBhcm91bmQgYXJjaC1zcGVjaWZpYw0KPiBhcmNoX2RvX3N5c2N0bA0KPg0KPiBPbiAxMi4wMy4y
MDI1IDA1OjA2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvcHNy
LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHNyLmMNCj4gPiBAQCAtMTMzLDkgKzEzMywxMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGZlYXRfcHJvcHMgew0KPiA+ICAgICAgICovDQo+ID4gICAg
ICBlbnVtIHBzcl90eXBlIGFsdF90eXBlOw0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfU1lTQ1RM
DQo+ID4gICAgICAvKiBnZXRfZmVhdF9pbmZvIGlzIHVzZWQgdG8gcmV0dXJuIGZlYXR1cmUgSFcg
aW5mbyB0aHJvdWdoIHN5c2N0bC4gKi8NCj4gPiAgICAgIGJvb2wgKCpnZXRfZmVhdF9pbmZvKShj
b25zdCBzdHJ1Y3QgZmVhdF9ub2RlICpmZWF0LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGRhdGFbXSwgdW5zaWduZWQgaW50IGFycmF5X2xlbik7DQo+ID4gKyNlbmRp
Zg0KPiA+DQo+ID4gICAgICAvKiB3cml0ZV9tc3IgaXMgdXNlZCB0byB3cml0ZSBvdXQgZmVhdHVy
ZSBNU1IgcmVnaXN0ZXIuICovDQo+ID4gICAgICB2b2lkICgqd3JpdGVfbXNyKSh1bnNpZ25lZCBp
bnQgY29zLCB1aW50MzJfdCB2YWwsIGVudW0gcHNyX3R5cGUNCj4gPiB0eXBlKTsgQEAgLTQxOCw2
ICs0MjAsNyBAQCBzdGF0aWMgYm9vbCBtYmFfaW5pdF9mZWF0dXJlKGNvbnN0IHN0cnVjdA0KPiBj
cHVpZF9sZWFmICpyZWdzLA0KPiA+ICAgICAgcmV0dXJuIHRydWU7DQo+ID4gIH0NCj4gPg0KPiA+
ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICBzdGF0aWMgYm9vbCBjZl9jaGVjayBjYXRfZ2V0
X2ZlYXRfaW5mbygNCj4gPiAgICAgIGNvbnN0IHN0cnVjdCBmZWF0X25vZGUgKmZlYXQsIHVpbnQz
Ml90IGRhdGFbXSwgdW5zaWduZWQgaW50DQo+ID4gYXJyYXlfbGVuKSAgeyBAQCAtNDMwLDYgKzQz
Myw3IEBAIHN0YXRpYyBib29sIGNmX2NoZWNrDQo+ID4gY2F0X2dldF9mZWF0X2luZm8oDQo+ID4N
Cj4gPiAgICAgIHJldHVybiB0cnVlOw0KPiA+ICB9DQo+ID4gKyNlbmRpZg0KPiA+DQo+ID4gIC8q
IEwzIENBVCBwcm9wcyAqLw0KPiA+ICBzdGF0aWMgdm9pZCBjZl9jaGVjayBsM19jYXRfd3JpdGVf
bXNyKCBAQCAtNDQyLDExICs0NDYsMTQgQEAgc3RhdGljDQo+ID4gY29uc3Qgc3RydWN0IGZlYXRf
cHJvcHMgbDNfY2F0X3Byb3BzID0gew0KPiA+ICAgICAgLmNvc19udW0gPSAxLA0KPiA+ICAgICAg
LnR5cGVbMF0gPSBQU1JfVFlQRV9MM19DQk0sDQo+ID4gICAgICAuYWx0X3R5cGUgPSBQU1JfVFlQ
RV9VTktOT1dOLA0KPiA+ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICAgICAgLmdldF9mZWF0
X2luZm8gPSBjYXRfZ2V0X2ZlYXRfaW5mbywNCj4gPiArI2VuZGlmDQo+ID4gICAgICAud3JpdGVf
bXNyID0gbDNfY2F0X3dyaXRlX21zciwNCj4gPiAgICAgIC5zYW5pdGl6ZSA9IGNhdF9jaGVja19j
Ym0sDQo+ID4gIH07DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgLyogTDMg
Q0RQIHByb3BzICovDQo+ID4gIHN0YXRpYyBib29sIGNmX2NoZWNrIGwzX2NkcF9nZXRfZmVhdF9p
bmZvKA0KPiA+ICAgICAgY29uc3Qgc3RydWN0IGZlYXRfbm9kZSAqZmVhdCwgdWludDMyX3QgZGF0
YVtdLCB1aW50MzJfdA0KPiA+IGFycmF5X2xlbikgQEAgLTQ1OCw2ICs0NjUsNyBAQCBzdGF0aWMg
Ym9vbCBjZl9jaGVjaw0KPiA+IGwzX2NkcF9nZXRfZmVhdF9pbmZvKA0KPiA+DQo+ID4gICAgICBy
ZXR1cm4gdHJ1ZTsNCj4gPiAgfQ0KPiA+ICsjZW5kaWYNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBj
Zl9jaGVjayBsM19jZHBfd3JpdGVfbXNyKA0KPiA+ICAgICAgdW5zaWduZWQgaW50IGNvcywgdWlu
dDMyX3QgdmFsLCBlbnVtIHBzcl90eXBlIHR5cGUpIEBAIC00NzMsNw0KPiA+ICs0ODEsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGZlYXRfcHJvcHMgbDNfY2RwX3Byb3BzID0gew0KPiA+ICAgICAg
LnR5cGVbMF0gPSBQU1JfVFlQRV9MM19EQVRBLA0KPiA+ICAgICAgLnR5cGVbMV0gPSBQU1JfVFlQ
RV9MM19DT0RFLA0KPiA+ICAgICAgLmFsdF90eXBlID0gUFNSX1RZUEVfTDNfQ0JNLA0KPiA+ICsj
aWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICAgICAgLmdldF9mZWF0X2luZm8gPSBsM19jZHBfZ2V0
X2ZlYXRfaW5mbywNCj4gPiArI2VuZGlmDQo+ID4gICAgICAud3JpdGVfbXNyID0gbDNfY2RwX3dy
aXRlX21zciwNCj4gPiAgICAgIC5zYW5pdGl6ZSA9IGNhdF9jaGVja19jYm0sDQo+ID4gIH07DQo+
ID4gQEAgLTQ4OSwxMSArNDk5LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmVhdF9wcm9wcyBs
Ml9jYXRfcHJvcHMgPSB7DQo+ID4gICAgICAuY29zX251bSA9IDEsDQo+ID4gICAgICAudHlwZVsw
XSA9IFBTUl9UWVBFX0wyX0NCTSwNCj4gPiAgICAgIC5hbHRfdHlwZSA9IFBTUl9UWVBFX1VOS05P
V04sDQo+ID4gKyNpZmRlZiBDT05GSUdfU1lTQ1RMDQo+ID4gICAgICAuZ2V0X2ZlYXRfaW5mbyA9
IGNhdF9nZXRfZmVhdF9pbmZvLA0KPiA+ICsjZW5kaWYNCj4gPiAgICAgIC53cml0ZV9tc3IgPSBs
Ml9jYXRfd3JpdGVfbXNyLA0KPiA+ICAgICAgLnNhbml0aXplID0gY2F0X2NoZWNrX2NibSwNCj4g
PiAgfTsNCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICAvKiBNQkEgcHJvcHMg
Ki8NCj4gPiAgc3RhdGljIGJvb2wgY2ZfY2hlY2sgbWJhX2dldF9mZWF0X2luZm8oDQo+ID4gICAg
ICBjb25zdCBzdHJ1Y3QgZmVhdF9ub2RlICpmZWF0LCB1aW50MzJfdCBkYXRhW10sIHVuc2lnbmVk
IGludA0KPiA+IGFycmF5X2xlbikgQEAgLTUwOCw2ICs1MjEsNyBAQCBzdGF0aWMgYm9vbCBjZl9j
aGVjayBtYmFfZ2V0X2ZlYXRfaW5mbygNCj4gPg0KPiA+ICAgICAgcmV0dXJuIHRydWU7DQo+ID4g
IH0NCj4gPiArI2VuZGlmDQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgbWJhX3dyaXRl
X21zcigNCj4gPiAgICAgIHVuc2lnbmVkIGludCBjb3MsIHVpbnQzMl90IHZhbCwgZW51bSBwc3Jf
dHlwZSB0eXBlKSBAQCAtNTQ1LDcNCj4gPiArNTU5LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
ZWF0X3Byb3BzIG1iYV9wcm9wcyA9IHsNCj4gPiAgICAgIC5jb3NfbnVtID0gMSwNCj4gPiAgICAg
IC50eXBlWzBdID0gUFNSX1RZUEVfTUJBX1RIUlRMLA0KPiA+ICAgICAgLmFsdF90eXBlID0gUFNS
X1RZUEVfVU5LTk9XTiwNCj4gPiArI2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgICAgIC5nZXRf
ZmVhdF9pbmZvID0gbWJhX2dldF9mZWF0X2luZm8sDQo+ID4gKyNlbmRpZg0KPiA+ICAgICAgLndy
aXRlX21zciA9IG1iYV93cml0ZV9tc3IsDQo+ID4gICAgICAuc2FuaXRpemUgPSBtYmFfc2FuaXRp
emVfdGhydGwsDQo+ID4gIH07DQo+ID4gQEAgLTgwOCw2ICs4MjQsNyBAQCBzdGF0aWMgc3RydWN0
IHBzcl9zb2NrZXRfaW5mbyAqZ2V0X3NvY2tldF9pbmZvKHVuc2lnbmVkDQo+IGludCBzb2NrZXQp
DQo+ID4gICAgICByZXR1cm4gc29ja2V0X2luZm8gKyBzb2NrZXQ7DQo+ID4gIH0NCj4gPg0KPiA+
ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICBpbnQgcHNyX2dldF9pbmZvKHVuc2lnbmVkIGlu
dCBzb2NrZXQsIGVudW0gcHNyX3R5cGUgdHlwZSwNCj4gPiAgICAgICAgICAgICAgICAgICB1aW50
MzJfdCBkYXRhW10sIHVuc2lnbmVkIGludCBhcnJheV9sZW4pICB7IEBADQo+ID4gLTgzOSw2ICs4
NTYsNyBAQCBpbnQgcHNyX2dldF9pbmZvKHVuc2lnbmVkIGludCBzb2NrZXQsIGVudW0gcHNyX3R5
cGUNCj4gPiB0eXBlLA0KPiA+DQo+ID4gICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgfQ0KPiA+
ICsjZW5kaWYgLyogQ09ORklHX1NZU0NUTCAqLw0KPiA+DQo+ID4gIGludCBwc3JfZ2V0X3ZhbChz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgc29ja2V0LA0KPiA+ICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgKnZhbCwgZW51bSBwc3JfdHlwZSB0eXBlKQ0KPg0KPiBUaGF0J3MgcXVpdGUg
YSBsb3Qgb2YgI2lmZGVmLWFyeSBoZXJlLiBJIHdvbmRlciBpZiB3ZSBjYW4ndCBkbyBhbnkgYmV0
dGVyLg0KPg0KDQp4bC1wc3IgaGFsZiByZWxpZXMgb24gc3lzY3RsIG9wLCBhbmQgaGFsZiByZWxp
ZXMgb24gZG9tY3RsLiBTbyBJJ20gbm90IHN1cmUgZm9yDQpDT05GSUdfWDg2X1BTUiwgd2hldGhl
ciB3ZSBzaGFsbCBtYWtlIGl0IGRlcGVuZGVudCBvbiBDT05GSUdfU1lTQ1RMDQoNCj4gSmFuDQo=

