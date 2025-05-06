Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3009AAB5B1
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 07:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976650.1363816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCAvo-0002uo-ET; Tue, 06 May 2025 05:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976650.1363816; Tue, 06 May 2025 05:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCAvo-0002so-BR; Tue, 06 May 2025 05:33:28 +0000
Received: by outflank-mailman (input) for mailman id 976650;
 Tue, 06 May 2025 05:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc8A=XW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCAvn-0002si-FQ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 05:33:27 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:2408::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a18e5d37-2a3b-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 07:33:25 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 05:33:16 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 05:33:16 +0000
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
X-Inumbo-ID: a18e5d37-2a3b-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqKSXRaXu32Bt3HpfWv6tRroQcGtheHlxPcrbwyhSZ66K94pzsYg/5vE/45I5Z2l9RWP5lklK+eWf6+khmLU/Oc8MLAELdRCjcvNJwC8VDiBwmPpJoc9fxcn+g3vv27GR3bhlW7VNwyMwVsmp5q0WeuPFnX31l2fBHqxw25zTupFzwr5PIrlzrpTz0EXEAbCg9wVMxJ8m30NUSK8Ewq2FUrJP+/FYZhubD2/oK21B1aBopluJrznsvWtd6Efo47W24lWsrBGJzkGUbSVg/bDRb0dj7BGBxtVYVLR7HtnYyN8/HIB9XcyfMzpD5SPwdqiQjvou3pFq4wtWc1mZVaoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgH5atrwI9S1LyAVIiw6U2HammoJaq3frSdF73xa3DI=;
 b=eXe0YDunfu5CF2JTiQ0r68ZyORktqKV426FhlXZD0PasxpzU/bz4kw4U4w3ZLzdJ4EdY4JOrUJvBNIs/eqv6FFYXCvoHzedNO24hGt4HXiAm1Y/r5Gp0f22GK+eTSNvByTtEXkjtRQF7HVkucvUsT3Rl7zZYPfpUqj3muPVb4ShU6MZ/XTWj+8h2Be11v3uVn1uyqYPzDJ/xovvXe1R3PCp+gwY8pD/LteqqsiNMxxReTZ/E6IQwwDLX2oR/3ynv+tADOUBSvOD/9eTGF+fg15ufKseRw7YOT3hT4OWSWr+P+0FpcbJt0GYgFvaHAsa6Qttx4cyTUCxmy/Vd70DoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgH5atrwI9S1LyAVIiw6U2HammoJaq3frSdF73xa3DI=;
 b=kKOP4R/uzMx1ySQAa9hx/Sypu6KJ5N3LLRpeDnteH85Xdpsan/OtXs1GEvMuM1GgfIonHFpcUxBddmI+Yu5eQKlDaEBKpWHjwW+hDPJ2XXqkwN5SZuaFe4cOpjhbtF/f+L4N9vPpUN8Aho8dqNGP+U6sqsZOG4xyVIxAon5O1Kg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common
 structure
Thread-Topic: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common
 structure
Thread-Index: AQHbrRCfHxxYxeWsPkK2Iot0Lv1PhrOn/B0AgB05whA=
Date: Tue, 6 May 2025 05:33:16 +0000
Message-ID:
 <DM4PR12MB84516D714BA53A40978B96F8E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-2-Penny.Zheng@amd.com>
 <26067708-2854-4493-8801-d0fb709242d0@suse.com>
In-Reply-To: <26067708-2854-4493-8801-d0fb709242d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=53968fb7-d563-4c53-bc82-a3b08ce75bf2;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-06T05:32:58Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW6PR12MB8959:EE_
x-ms-office365-filtering-correlation-id: 7179fecb-f9d9-4335-ee52-08dd8c5f8086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tmo5NkVYdkViN1REQldBbXczZy9WOTFWSnh5L3FUNzdXUDAxaG9ZVW93U1ZC?=
 =?utf-8?B?RUNVU0ROWVlxOVlzR05oQitIbmdFZmVod01XQ0VmdVNDbm43ZUUzY2lSSmJE?=
 =?utf-8?B?WmFicHhWY3NiY1dVeHdaM0NpaUJaSmFFWnljeEhtLzQxTm4rZU4yME1LNmJU?=
 =?utf-8?B?aElsUVlEMWpnSGU3SEhsSkxuOXdzakJJcnZOdkNabkJrdEV1TmMyQlFOMU5v?=
 =?utf-8?B?L0F1NDBtajdwRERMQ3FjcWp1d0FFUVNvQUtoSTYrc2V5OHo0MkFCaXlwUU8z?=
 =?utf-8?B?K2NvcjFiWE1oSjIzL29UQlM0d1NGRGpPWmVxOC84blpNMkVlNjZ4L1hsSGFW?=
 =?utf-8?B?MHFtZ0FYUzZKTTdWZlVSM29COEVRcE12NmxyMzlHeFN0Q2pKcTFLbDhvWUZJ?=
 =?utf-8?B?dEJuM0FqaHVGOHpzUnhkcGwzZDVJVjVWUURZaWJSNlY5Q3haVjZSY2RBY3ZM?=
 =?utf-8?B?NGFuUkdLL1RDdS8vU0NoeWlRYWo1c3oyZnJLV01YTEFDSmdIOTRaUkdCZTQr?=
 =?utf-8?B?amNWN0t2R2haajM3LzNOWDhhWFE1Z3hNZERNaDZiM05CRzZRcTZvOEMzTE1C?=
 =?utf-8?B?QXdJdWpyNjVoRzJkNG1VRjZ6cUhtdjY5RDROT1dQMU9IbUx4UjdCUTVzLy8w?=
 =?utf-8?B?RStreE5oczBpMlh1eEVLQjVmcXoxOFhrdjVsbjRZVlBTVFJDWDh2aWFseGE2?=
 =?utf-8?B?QlpWZTFBRUZkY1h0bUdpdStSMXJMaGtsM3hMQ2R4VVBBbTRmTWJoeFdEck5B?=
 =?utf-8?B?clhEWjVjNjJKUW9QdHd6eUxRR3pBU1VrdTUvSmJTa3FNbm1iRFk2RFljWVE0?=
 =?utf-8?B?Mk1waVcwSTBiMUJHVVVFeGxvYkRlcG44OVpJS3VjV0kvcEJGOTJMcnNQQUV6?=
 =?utf-8?B?RHM2YTVtUkhwVFhQMVlXZmZtRGtIQTZYNFU4Q2RvMDdEWHFvNU1naHkyck96?=
 =?utf-8?B?ZXphU3AxT1REblhucXNQdDFuVGQrNnNwcFIxRTIxY0V0WkpRZEtFc0swSHR2?=
 =?utf-8?B?YVE0THlhVHh3clBFeFc4KzgzNnRmd0RJUlBNbGhtbUNGbGlQSHA0blVJM1pL?=
 =?utf-8?B?Z21Dbm1oeXFKZDdUUFdSODh2OHQ1RGg1Nk5ubHpjYTNPR05Hb0hLZGNyZm1l?=
 =?utf-8?B?K1ZHU2FRSFZWeEsvM251aWp3ZWJUalpncUxxYmlPaURiNEYrVHN3UGtsdWth?=
 =?utf-8?B?WDdrcUlZOFV5NUNLVVVZMkxCTEV0Y1loZ0xvK2J6UW00Y0ZTSkdLL2MzMXNm?=
 =?utf-8?B?U3owNG5QeEtFUEFFMzlWRnV4YVZUQkNlMW41a2VNMmpCZXlnYnFjWS80TFYr?=
 =?utf-8?B?RFMvdmpSM1VhNnI3d1NVaXF1VndYYTFPL2xNZVJxOEdtT1NEWXgvaW93d2NE?=
 =?utf-8?B?TXBFeXVocWZjak5taEd6bnNsWDV3V3h2N2swb2tlTm8zbCtjaHM1dzJYUmUw?=
 =?utf-8?B?OVlnNDZxc3ZaSk5pckp2a1pQZkdhMWVVK0htT2Q4TzlJbTRxSGxrREN4NW5B?=
 =?utf-8?B?V0NsK0d4OEFybVVYWWVoVkxlUXhEV09jM0gxOTBPRlNWTXE0RmNMN2Z2Q1F1?=
 =?utf-8?B?dm9COHZoRzJ4NHo3dFh0R2xGRW5OMklZUWp4eFBVMWxmQkFCMWNoQy9FS0xT?=
 =?utf-8?B?ckZ4VWVSekg5c0cxYzh5ckcwcndwNjdXWEN0ZzFiQ3FOeWRQcWxKYm4yVHYr?=
 =?utf-8?B?U2FXSUNzUzkvelhXZ0VWTzVxdzMyV0huOXBXb2g0elFHUEIwVVF5bW4yRHRD?=
 =?utf-8?B?cjdRa0EyTWdtMlNTZnFUSzNibUhlYzdPb0p6NGl6RlZDamFlQmFsRHFkV2E4?=
 =?utf-8?B?Mzg0Y0daeHB5NTBmTEtHZlg0VFE1OVBxTDA1YjJRRlB2eDBwbmc1dmV3NHln?=
 =?utf-8?B?cWhNV1BiNkk1SStNMmR5a3dRZEw4UzhweTAxSmE1YnJ0WWZxV2txV2ZRQnc5?=
 =?utf-8?B?NjdHaW1DMXJYYVhtMmZvTDN0UTFnd2IvUWMzMkkwdStqWVNUeVdXeHV2N2wy?=
 =?utf-8?Q?Z+pUQu4EP0/mmBTqEgQfpQntJwGGRM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amxkM29sbWRubFFFN09RanB4c3o0VXVDdG9TS0l6M2hUVUZQTlJXNkhQYWQy?=
 =?utf-8?B?a1UzN09wMU5uMzVkOFQyaWxIY3cvZE1LY0hHTSt1cE1sYWlsbFB5UWhEdyt0?=
 =?utf-8?B?dG42YVRtNFhnTE5TdjR1eFFvelhsblVCZXZsNEZBWWk1NjY0dDhrNWlCdzNS?=
 =?utf-8?B?ZkczbWI3TnJtYVlFYmp5MUorTXp2ZGRnZWdVc3I4cm1DR05sL0oyTDhvZzBZ?=
 =?utf-8?B?MENYam5Tc2pnWllWdVFzTkRGWXBtekRyZzhHKzd4aGhhVy94S0M1SEhVMUpN?=
 =?utf-8?B?NjRVMnlEOTFEUGdNeTdNQUVGb3lpMjdJd0IyandHYXdkcmM5ZVVlNGZwWFRZ?=
 =?utf-8?B?dDJtMEkvRVVZbTVGTERpKzJPc01sL2dkU25nRUs0L3NBL0tVWXc3OWN4c1FZ?=
 =?utf-8?B?cGhOeklFWm40N0VNVUZTbjh4ZG9vRmlvcWRGUGh1YnlIWjJ6ZDRYWG5vNUI1?=
 =?utf-8?B?b1Rud3NpSlR3elNCRXB6T0RiWk9OaWRUdFEzalFPRUxqc1RvQVZnRnp3QmlO?=
 =?utf-8?B?R1BSbk14Y0xzQ3d1eHJMdHRzZHVPSWh6U3Y4WTl6UG5hTVM3WHVuR3RiOERW?=
 =?utf-8?B?UjhRMjdVK0FuRUptVWthZVVpWTNqM3NEZWdmOHJpb3ZocGpyRU5pbXdSREFo?=
 =?utf-8?B?VGV4dzhpb1hKNDNNZE1pYzFEWUllU0ZjWHdBTXFjSlB0T25OakdKWXdwa1lG?=
 =?utf-8?B?T3NxQ3FSRURXdVBYV0w4NmNLUlZsblVjSFFGaWdxWWJhZFJjUHdYUFROdHFp?=
 =?utf-8?B?WWJSQzgvcEtvZFF2eU1qVDgwc2VseUNxUDY3YmpFeXhIU1VyNmQydXRoS2dU?=
 =?utf-8?B?Y2pEWWlhbUM0bHJMNlVnSjlUcTBZR0FzRjNTdlV5amI1UVJZN3NsZG5ldThN?=
 =?utf-8?B?Z21JZmZFSG5kSmJadWNhZ2pzSGNuVVQyWkt1RjhGTmRlK3ZkV0xRRGhoZVJo?=
 =?utf-8?B?dDVScUJXT3EwQjlDaFAvaWNuNDhnTnU5L2ErNlRzb1h0dVBBVzBwS09TZk9U?=
 =?utf-8?B?RDYzS2NIKzhzVlNPVGJWdytob2lzVEFubElwNHU1QW5DaW5MSVo3QXZMTU9y?=
 =?utf-8?B?dkQ4cThleEIvVWp3VGJwVVJIc3hnWWoxb1R5TDgvdEJpdmp2MFZLS0tMNW93?=
 =?utf-8?B?eTFJeFNFUWpmNnZjMkwxWmtmZnREd1F4OGF1eHFNSXMzSFBEdVFVL0ZEdVMw?=
 =?utf-8?B?SEU4UmsyZ0FEbDc5UE03MGptL3cwbUYrWjlzRjh6SmQ3NDJ5RTlBcnVnTHpI?=
 =?utf-8?B?RUtVYjdqN1pxNWppcUJBd2FrZ3lwUjhHVlVDNHFrN0hCU0w5Qk9VV0pBd0s3?=
 =?utf-8?B?aTNjS1NRVm9HQjQ4Q2lXMk54Z3JldmlNczBMaFpwMy9pUHlWTzBidTkvTmtY?=
 =?utf-8?B?Z2tYeUZVTlFtLytvU0VVQklnK3l3WWhWRVY2bVdBSUlTb0JwbzEwZXJtVW5o?=
 =?utf-8?B?OUdtakI4RmM0Y1o3YTVnWHlYaVhxMjJlV3Yyb1VwbTA3K3VKbVZMSXZpTGIv?=
 =?utf-8?B?RzNOZERHRlhXMXExNytmRzFXWlBRV0NJL01BVlFXZmJWbDc5SXBvdk81bVM3?=
 =?utf-8?B?eERkempNTmFoVC96MExPa2dPVkJmU0xIYzc1TWtSV3MvSVNCT2ZKNGdhbVBD?=
 =?utf-8?B?ZTB3SUxLZitqcEhyNVNSZjVteTZSY09rcEIySmptLzR6cmpQQlZuYTY5Y3Yx?=
 =?utf-8?B?Q0pETGFLQWxSVEF5dTdlMkZzRWVwd0VSTmV5amx6YTM0WTRBTmxIanRkRDBH?=
 =?utf-8?B?ZVRuRHBYVFJ2dm1tZm45NGQ3N0JFOUpSNFN2cjZqY1NEVlA1UTBNV2pJYVYx?=
 =?utf-8?B?SkM2Z3Y2cnNaWDMzNVZsaDJ5bGptcy9ZbVhyNHVESmdnZWtRWE9HYXBDeGhV?=
 =?utf-8?B?cG5nejJXUG5LTGVySFNYZDA4L3VyV2ZXODBOV1JWZ3ljdTh1Z3RqWVB1OFQ1?=
 =?utf-8?B?TU9Kb2VuSm9WdUdGU3p0RmZ0dG1jWXBVMWxoaHNpWllORmYyaHBJaFJvcEp0?=
 =?utf-8?B?elR0ZUE1UCtKSGZiem9lVitxd1ZPWElzdUpiSzEwKzk3bTJqekZPbDYyOEFD?=
 =?utf-8?B?Zzc2bkduTnhicm03azJ1NlZQbGt0Ull6UHIxZ2tiNyt1TWI2ZGszTDBKcXNC?=
 =?utf-8?Q?2Myk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7179fecb-f9d9-4335-ee52-08dd8c5f8086
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 05:33:16.2261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fu948eQGYvVGP8O5FcTdDINSh070ODVG/gT+SOEotTPArLrUGjp9NO5cEFbcUQERAgDiMq5MXzZMOwHvzPTDpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwg
MTcsIDIwMjUgMTE6MTIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDEvMTVdIHhlbi9jcHVm
cmVxOiBtb3ZlICJpbml0IiBmbGFnIGludG8gY29tbW9uIHN0cnVjdHVyZQ0KPg0KPiBPbiAxNC4w
NC4yMDI1IDA5OjQwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBBTUQgY3B1ZnJlcSBjb3JlcyB3
aWxsIGJlIGludGlhbGl6ZWQgaW4gdHdvIG1vZGVzLCBsZWdhY3kgUC1zdGF0ZQ0KPiA+IG1vZGUs
IGFuZCBDUFBDIG1vZGUuIFNvICJpbml0IiBmbGFnIHNoYWxsIGJlIGV4dHJhY3RlZCBmcm9tIHNw
ZWNpZmljDQo+ID4gInN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmYiLCBhbmQgcGxhY2VkIGluIHRo
ZSBjb21tb24gInN0cnVjdA0KPiA+IHByb2Nlc3Nvcl9wbWluZm8iLg0KPg0KPiBUaGUgY29kZSBj
aGFuZ2UgaXMgY2VydGFpbmx5IGFjY2VwdGFibGUsIGFzIGJlaW5nIGxhcmdlbHkgbWVjaGFuaWNh
bC4NCj4gSG93ZXZlciwgdGhlIGFib3ZlIGRvZXNuJ3QgZXhwbGFpbiBfd2h5XyB3ZSBuZWVkIHRo
YXQgY2hhbmdlLiBUaGVyZSdzDQo+IHByb2JhYmx5IGEgbGl0dGxlIG1vcmUgY29ubmVjdGlvbiB0
aGF0IG5lZWRzIG1ha2luZyBiZXR3ZWVuIHRoYXQncyB0aGVyZSBhbmQgd2hhdA0KPiB5b3UgbWVh
biB0byBhZGQuDQo+DQoNCkhvdyBhYm91dCBjb21wbGVtZW50IHRoZSBmb2xsb3dpbmcgZGVzY3Jp
cHRpb246DQpgYGANCk90aGVyd2lzZSwgbGF0ZXIgd2hlbiBpbnRyb2R1Y2luZyBuZXcgc3ViLWh5
cGVyY2FsbA0KdG8gcHJvcGFnYXRlIENQUEMgZGF0YSBpbiBjb21taXQgInhlbi94ODY6IGludHJv
ZHVjZSBuZXcgc3ViLWh5cGVyY2FsbCB0bw0KcHJvcGFnYXRlIENQUEMgZGF0YSIsIHdlIG5lZWQg
dG8gcGFzcyBpcnJlbGV2YW50IHB4LXNwZWNpZmljDQoic3RydWN0IHhlbl9wcm9jZXNzb3JfcGVy
ZiIgaW4gc2V0X2NwcGNfcG1pbmZvKCkgdG8ganVzdCBzZXQgaW5pdCBmbGFnLg0KYGBgDQoNCj4g
SmFuDQo=

