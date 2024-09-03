Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E3969651
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788733.1198205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOQU-0004Pg-Rr; Tue, 03 Sep 2024 07:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788733.1198205; Tue, 03 Sep 2024 07:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOQU-0004Nm-OP; Tue, 03 Sep 2024 07:58:10 +0000
Received: by outflank-mailman (input) for mailman id 788733;
 Tue, 03 Sep 2024 07:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slOQT-0004Ng-7U
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:58:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ecab08-69ca-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:58:07 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:58:03 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:58:03 +0000
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
X-Inumbo-ID: 40ecab08-69ca-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfDhsHfrP/1Jh+/Hz1XfS8a/u2J6FW/3TExr8BfLoAq1uBeh8c9sc7Qf5j8Gbax33Ql6yKeZPFjV2ALS/wJ4ZUAezTFz5bqvat3T6yrgNYKeEOAxfU21AwL5XM9r2SSqBZkZnsN1xSLiZo3K7r2V3sl2YG5srcGTFlzm8W3NWL9yDXpD/NyODm0Z5X1OHZ+pEu4OKVu8PTHn33SuB8uF2zGXikaLYaazL/lwgdwVLyx/82IawAaytN4Nv5DIoE89Pnpop+FXBn9Zuis0yhFQBDNEZVOBFgFOKI3YS85Dp+u/01FeZkhJn5/ggRw3KoaiH161Hf9Y1zNprGUANwtB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuDBDOlOjpTYwSN+oLrtwWoThiYuxqF0Igwwg+CYnGA=;
 b=UsumF1kl1CH38gOxuDniatPpaFnFuF9BfOHTPc6KNNKjNrZOiwWso20zHPF3xrpho6cjwf17nTll+6Pr4L+UVL+zxbkhxp7VOPOInd2kz0ZZcVU0YrwsaznXduVXPPS/ETaBHarlvge3RGX9VJK8NHuIsdspGePz6gvXgHHHznJTxUXQoYcYpc6Yil1hLvoynTlwSe3YdjIbYJl1dmrq7JyWxPmRU0snaVL+7y/8kaI+LnPGdkqQN/DE01ZvwDXp8MVH20UnP+434Pfqmn0QJSI8pOvtFlFOiYlkjanIqfwjK2YEQciNdRfIdyGkuc+YmvclHOQfSIjiE1DphLZ6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuDBDOlOjpTYwSN+oLrtwWoThiYuxqF0Igwwg+CYnGA=;
 b=FkLgD025a+1QB0qntVFEs2l2SRr66XLYwt13mVutYJSetzTkrhmpmsh1xvEksqFdv16et26GFhS0Z6DwwfQoUlWlxZBCr6aGCxhQvROm1/ONTlJTu2FwOjYJom0aYKSgro8Q1GzeNZzhiYrbePBh4dsN2pdEP9twS8ZCZYJe/vg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa/c+T1Q4Qq6O9skmV9EceghcgI7JFrg2AgACIPoA=
Date: Tue, 3 Sep 2024 07:58:03 +0000
Message-ID:
 <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
 <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
In-Reply-To: <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8594:EE_
x-ms-office365-filtering-correlation-id: 36f66c9f-7041-457a-60ac-08dccbee2379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UG83bE9IWCtlU3dUUGZEbUVrdUIyWEJqdjJaWUhtT2NYdUFNVEpZZTlsRkhQ?=
 =?utf-8?B?eEdyNW1CdXdXZkM4NTFRR1FXREI4RVorbkNhRlRJSUdUNGU3dERXVUsyejVV?=
 =?utf-8?B?SWNEbVJQVmFvYlZnQWw0L0U4bTJOY1BTV01SSE5wWUcrQVhwOHhPY0lPVklB?=
 =?utf-8?B?SlkyeXJqem9wZHV2ZWE3M2VEMHVzOXVnZVIyS2F1clNKSjlpL3ZXa3VqOWdO?=
 =?utf-8?B?dlBrLzZsYi9FS0NHWDlqU0x0WXNZczhJSzY4MU1xKzNyMmJvMXJLQ3hXWlFo?=
 =?utf-8?B?dzRXcStVT1BsZUgzUUJRT25lUUxsN2o5d0U3NjJ4ZVdpejhJRWxTZ3lzMUk0?=
 =?utf-8?B?N3kyMndBV3EveGxzUTYvZTVZRlVGcTU3TVhhUWVrUTZHMDJsK3dRNFJjdWlo?=
 =?utf-8?B?ajZYeFlPWkExUkdxSXFjR2EzTVNldUxOaERVZGVaejBoMHAxNExSRlNLbmU4?=
 =?utf-8?B?NUVxb2VRU1crNjByc09VSmkyWUVuOWZVSG9TS1cyakkxTEVCeTRIcXdzZ3I1?=
 =?utf-8?B?dE5xWlcwYWgybXoraFpRNml2NkkzYnd3djRycFRCdlZKTDdrYlF5K3JyYnZ2?=
 =?utf-8?B?STNvU3hFNEVqa1Z4b1lTSTRCVjVYQno2NmhYdFE5ZUtzS2JjVzh0VXZaQXBl?=
 =?utf-8?B?cHVyUjRSYVdLMjRhSFRWckNMQXhNWDJpdkFrNXExcFZIOGJyNW40bzBFL1dK?=
 =?utf-8?B?TUJVV3ZDNW1ycG85ODlOWnV5U1gwQVZEU1QvcFhyRWt6K3JJcVZiQkZqdVY0?=
 =?utf-8?B?Wml1TElrVnNWTDdRR1oxTE9IaFFXeTcva01ibjFhZjdUL3lKM0JLYjg1cEYv?=
 =?utf-8?B?Qk0rNzIzUGFzR1hWS1l2YmNYSE1adEQ5bGk1cXU4ZmVTaGY2VHFmb1pDbEc4?=
 =?utf-8?B?QVlJVzZBSlQvNGd5TDY3b3h1TUFoSkNJODZJQUVlWHgrVmdrZkpxVXJqY1Ew?=
 =?utf-8?B?LzJaNGNRWUVaY2RSVDU1bUs2Tmt3N2ZmalpSV1JaS0duWFBxNFZQN2s5NDVp?=
 =?utf-8?B?WUZtZ1MxbnMwT3Z0Q3FoQTdWK2E3UWtON3czR082ZEw2b0RUUGNwN1BDd2tw?=
 =?utf-8?B?Y3RBaHVad0JhVW5rUjhLOGQ0dEt0bFQxMU9FYUtMYXNERUhzZWFtOUNZdmVn?=
 =?utf-8?B?dDhDb1VXVUo1YlJ2cWtmNE1lalVIZVJ2UXBjUXhiNnk4blBKdjBxc0IwZUQ4?=
 =?utf-8?B?VWE3U2llOXZKd1NibzNWWkdWZHM0TTdkeFVLQ1haTUR3ellVLzlUSkpaYmFt?=
 =?utf-8?B?eVFFd21LdTMwaFJIK2hzSWRkOXFVVWJDMU5WaGc4VUVWWlVybkVYYjFnNFlJ?=
 =?utf-8?B?czI4WnptK3JGVUEyNzZ5SGtCZ1dNTy9wcWMxb01uNUlxSXY5Zy9PcXdVY3Ev?=
 =?utf-8?B?Wkhad0FCUkRQZVF1d2RTWkNKQk9jRThkRDNLbWlOSmQ0NDNpZFhXMklLczdW?=
 =?utf-8?B?NGdHZnNWcEN2RjhjK3hTM3dMRGRnd2s3d0xqLzIyeGJoUUl1dm1jS3lOQUFC?=
 =?utf-8?B?MHdrQmNYdWtUZjRnVGJzMHFqSDVDWnZZWTNwNjhyYU5BZ05GWHdaOUU3Wkk3?=
 =?utf-8?B?MWptckRkSDhGbXpQOHZhNXI1RE1FTXBHWjJPZGZJbVVNbEVmYVVPelZvOFlz?=
 =?utf-8?B?d1FmUkVESHdQUnBWdmFSMzhCQ2FZZ2tlek5PTGlxRTRRS0QyT1ZQdm40b1dP?=
 =?utf-8?B?eDNkQzJqendHelY3bE1RUjNWSnN0S2VOUGhzYXRKb2d5KytqTmJpNUUzaU5W?=
 =?utf-8?B?NzkxTTZtZzZnUmNkb0U4Y0hRQXBrck5wMGFqNENkQ2FYb2VBUEVEcEFPWkpy?=
 =?utf-8?B?UCtralpra1orUTdxL1RtRVFwSjBuUHQvN1dHVncrWDFxRmVjK25tWkdqVzNj?=
 =?utf-8?B?NzlhRUZPWVRldmpiU0lGRFdTUU1nRFRDWHkxNmdTcC9RQmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzdEV0tKMVFVaHVGTmlaRzdpM3pQVVdUTTEveWJzSzFyeDlIZkJxcyszWEFL?=
 =?utf-8?B?RGUxcTBYS0JqUURJWW53RXpGSWpBbFN5M0ovNFRscG5GZXQyV2hTVkhHVWh6?=
 =?utf-8?B?SmxLREc1RU16eVRRTTlDWUFBWG1Cd1NIci9oQ0oxalltMXMvdTRTYjYrVUll?=
 =?utf-8?B?WXduUCs0cGk5WUp5Sk03MWF4SHN6VWVpZnlScExiRUpaSHE1bDEveUg5d05x?=
 =?utf-8?B?NTRDOERnbmFsU2hiVG5kTzBzeEJBVkhCN2cyd1VDeVQ3MGJBZTU1ajZBODQy?=
 =?utf-8?B?NXNTS1dsUzZMdDBzNmU4WmMwVzFXL1ovbWJwRXJrQTFidTJGNENKWWl1WFlp?=
 =?utf-8?B?d3dIY2ttK3A2WDNwd0VzcjUva0ZHRkVVaXRtZmt6N1RvYjBDL2Y3b3NCaDYx?=
 =?utf-8?B?MWFMNEpLK2kzY3QxWEJreWZHd3IzdzRHendjK2xyZEs2NWV5VE51cTBjOUo4?=
 =?utf-8?B?V2JHSkp5YjJGUVIyUnRFd2tYMlh2bjdweG9aWXg1VkY0Tng2ak5kSEF6cUZh?=
 =?utf-8?B?Vk40bC84bUdvRnFkd1dqZ1RrUW5hT21MVmdnMFBEbmQrSWg0UHA2dk1GVE83?=
 =?utf-8?B?Ujlub3h3Y09pR3M3QUQ3cjdHc0pacGp3MVk1cHV2cnNPNjd0UU5qMy9vb1BM?=
 =?utf-8?B?WmVRZWdicFFmYzQxMmdUVDlkWFQ0S283Q3NJSDJaNFRHcFdRVHBwc0xmQTRX?=
 =?utf-8?B?anVGMHJDTGV4bVJCTjdiUUZPeUxXdC9mWjdMcCthM25uR1lDOWpNZ1dzSTFO?=
 =?utf-8?B?VmpoNi9sZjE4L3Vvekp2ZXp0RU1jVS9Gemd3elhIUUhwaFE5b0ZDK1NFanBB?=
 =?utf-8?B?cTh4L3pUenJLdEpvWUdLYzV5TVFubzY0SGdMZTlFcUIvb3EzeFYyekpvNHRX?=
 =?utf-8?B?TS9OTG1XL2Zid0FSSWpzaTVQRjBnTzNyWVNnbDhaRFRyUmJSUUxLcExnQlpl?=
 =?utf-8?B?eCtIVWdHTC9HWmFrMDBMR0lEWWJUNTlTWDlnblJLZ00vWnhWLzdBaXNnTEda?=
 =?utf-8?B?RHBocEFwRWpQK1VyUUw0d095dk1FODZmWWY0allKUTNaY29FV1ZmNzRZL3Mx?=
 =?utf-8?B?VDBPNkpkQUZaOC96QmNTemcxaExVWHZ6cEJ5ZzhlSFdPOE94OXNsV3RiZlJx?=
 =?utf-8?B?VSszUzBpTFN5QVVKYytEOU10ZktuUXhKWXV1MU9ybU9JZEQrcWRQNkNlcXpv?=
 =?utf-8?B?LzVVMnpRamh4QUVieGNWU3VvNG53dVYrU2xHRG5XdmxjckNyTXcvWHRVMDB1?=
 =?utf-8?B?Vmk2OUNVeTBmU25ocy9aalFoWWJ0SE5SVjFndW1WQUNJWDE3dFNrL0Jjd2NE?=
 =?utf-8?B?bW03UnJhWWltbStWMjNGS1AveVl5WUsyTkVpYmFjM0FzR3AxNFhPdFpWWWJ0?=
 =?utf-8?B?QmQyaGxDVXMxeTNlSGJhTGZjeFZYdDJKdmtubkpuTEVsWlpweHVGRDI2UThR?=
 =?utf-8?B?R0dja2Z2UE1KamtGWjg4WEx3L3V5bHppbUpHSEtDUnc3NWl1NUg3dWFFT3lO?=
 =?utf-8?B?d1ZtTFFRZlFYS3c0bzZpYXFhNmNGelg1ZEprSkJtZm14S0N0Tmo0bjlNUkN3?=
 =?utf-8?B?SUYvZXpQOU50emhBenJrU1VCMjFjczE1dEc4VXliN0szdDVCY3FKU1QyV3B0?=
 =?utf-8?B?TVlVd2RGaC92MVR4dWU0bUJDbzlpQktzR0dUNm1ybk9hVm4xY3BlaDg5TFpT?=
 =?utf-8?B?MlJWaW93YnJOOUhhbCt0TnB6VXkraThlc0l4b1BzWDlTUHYyOGN0WHJIMzFC?=
 =?utf-8?B?TThHM0E3bXFuT1UzMnFoSmtYRHVBYW84WlFTSnF3QnoxYkh5OHFBWDNhRWV0?=
 =?utf-8?B?ekI2VnFMSm80ZEZXdk51S2trZE5rallRSU1tWUYvOGx4WTBwUkR3TzNEQ3lp?=
 =?utf-8?B?dWVMdFFTeUdjOVY1MFMvakxuL2ErbDdMdERZT0t4bzgwNTkrdjJKRE5GbVdT?=
 =?utf-8?B?enZZVHRwTC8wRnphVjBSWGVHTWpGbkt4Q0VmL2ttTmhveEJucU1NQ0NaOVE3?=
 =?utf-8?B?YlR0cHg0cWduSHl1TG91MEpxTUU4d1RDZ0U4RFJJamJyR0FaNi9sNDFUcVVp?=
 =?utf-8?B?M3VYSmVOMmxsb3AzOTlMTmtnUFY1eHNDQldhUzdEenNxZmhLVTE0RVYyVnNs?=
 =?utf-8?Q?+Sps=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2636C2075CAFD54CA0F6FC9E9389F4F7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f66c9f-7041-457a-60ac-08dccbee2379
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:58:03.7556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qI9kiiGEqgnbt8inZnCaW+B3UWtLWBN+f6crK0dc0m/TBr/KM2wEYhon/mmhLZ36OpHoTmLLQUJ1yEQbHLBSNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

T24gMjAyNC85LzMgMTU6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wOS4yMDI0IDA5
OjA0LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdoZW4gZG9tMCBpcyBQVkggdHlwZSBhbmQgcGFz
c3Rocm91Z2ggYSBkZXZpY2UgdG8gSFZNIGRvbVUsIFFlbXUgY29kZQ0KPj4geGVuX3B0X3JlYWxp
emUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUgcGNpX2FkZF9kbV9kb25lLT4N
Cj4+IHhjX3BoeXNkZXZfbWFwX3BpcnEgbWFwIGEgcGlycSBmb3IgcGFzc3Rocm91Z2ggZGV2aWNl
cy4NCj4+IEluIHhjX3BoeXNkZXZfbWFwX3BpcnEgY2FsbCBzdGFjaywgZnVuY3Rpb24gaHZtX3Bo
eXNkZXZfb3AgaGFzIGEgY2hlY2sNCj4+IGhhc19waXJxKGN1cnJkKSwgYnV0IGN1cnJkIGlzIFBW
SCBkb20wLCBQVkggaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywNCj4+IHNvIGl0IGZhaWxz
LCBQSFlTREVWT1BfbWFwX3BpcnEgaXMgbm90IGFsbG93ZWQgZm9yIFBWSCBkb20wIGluIGN1cnJl
bnQNCj4+IGNvZGVzLg0KPj4NCj4+IEJ1dCBpdCBpcyBmaW5lIHRvIG1hcCBpbnRlcnJ1cHRzIHRo
cm91Z2ggcGlycSB0byBhIEhWTSBkb21haW4gd2hvc2UNCj4+IFhFTkZFQVRfaHZtX3BpcnFzIGlz
IG5vdCBlbmFibGVkLiBCZWNhdXNlIHBpcnEgZmllbGQgaXMgdXNlZCBhcyBhIHdheSB0bw0KPj4g
cmVmZXJlbmNlIGludGVycnVwdHMgYW5kIGl0IGlzIGp1c3QgdGhlIHdheSBmb3IgdGhlIGRldmlj
ZSBtb2RlbCB0bw0KPj4gaWRlbnRpZnkgd2hpY2ggaW50ZXJydXB0IHNob3VsZCBiZSBtYXBwZWQg
dG8gd2hpY2ggZG9tYWluLCBob3dldmVyDQo+PiBoYXNfcGlycSgpIGlzIGp1c3QgdG8gY2hlY2sg
aWYgSFZNIGRvbWFpbnMgcm91dGUgaW50ZXJydXB0cyBmcm9tDQo+PiBkZXZpY2VzKGVtdWxhdGVk
IG9yIHBhc3N0aHJvdWdoKSB0aHJvdWdoIGV2ZW50IGNoYW5uZWwsIHNvLCB0aGUgaGFzX3BpcnEo
KQ0KPj4gY2hlY2sgc2hvdWxkIG5vdCBiZSBhcHBsaWVkIHRvIHRoZSBQSFlTREVWT1BfbWFwX3Bp
cnEgaXNzdWVkIGJ5IGRvbTAuDQo+Pg0KPj4gU28sIGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3
aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93DQo+PiBQSFlTREVWT1BfdW5tYXBfcGlycSBm
b3IgdGhlIHJlbW92YWwgZGV2aWNlIHBhdGggdG8gdW5tYXAgcGlycS4gVGhlbiB0aGUNCj4+IGlu
dGVycnVwdCBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4gYmUgc3VjY2Vzc2Z1bGx5IG1hcHBl
ZCB0byBwaXJxIGZvciBkb21VLg0KPiANCj4gQXMgYmVmb3JlOiBXaGVuIHlvdSB0YWxrIGFib3V0
IGp1c3QgRG9tMCwgLi4uDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwu
Yw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4gQEAgLTczLDYgKzcz
LDggQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHZvaWQpIGFyZykNCj4+ICAgICAgew0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycToN
Cj4+ICAgICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+ICsgICAgICAgIGJyZWFrOw0K
Pj4gKw0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9lb2k6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9Q
X2lycV9zdGF0dXNfcXVlcnk6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2dldF9mcmVlX3BpcnE6
DQo+IA0KPiAuLi4gdGhhdCBvdWdodCB0byBtYXRjaCB0aGUgY29kZS4gSU9XIHlvdSd2ZSBhZ2Fp
biBsb3N0IHdoeSBpdCBpcyBva2F5KGlzaCkNCj4gKG9yIGV2ZW4gbmVjZXNzYXJ5KSB0byBhbHNv
IHBlcm1pdCB0aGUgb3AgZm9yIG5vbi1Eb20wIChlLmcuIGEgUFZIIHN0dWJkb20pLg0KPiBTaW1p
bGFybHkgaW1vIERvbTAgdXNpbmcgdGhpcyBvbiBpdHNlbGYgd2FudHMgZGlzY3Vzc2luZy4NCkRv
IHlvdSBtZWFuIEkgbmVlZCB0byB0YWxrIGFib3V0IHdoeSBwZXJtaXQgdGhpcyBvcCBmb3IgYWxs
IEhWTSBhbmQgIHdoZXJlIGNhbiBwcmV2ZW50IFBWSCBkb21haW4gY2FsbGluZyB0aGlzIGZvciBz
ZWxmLW1hcHBpbmcsIG5vdCBvbmx5IGRvbTA/DQoNCj4gDQo+IEFzIHRvIG15IGVhcmxpZXIgY29t
bWVudHMgcmVnYXJkaW5nIHlvdXIgY29tbWl0IG1lc3NhZ2UgYWRqdXN0bWVudHM6IEkNCj4gZm9y
Z290IHRoYXQgdGhlIGNoYW5nZSBoYWQgdG8gYmUgcmV2ZXJ0ZWQuIEknbSBzb3JyeSBmb3IgdGhh
dC4NCldoaWNoIGNoYW5nZT8gRG8gSSBuZWVkIHRvIGNoYW5nZSB0aGUgY29kZXM/DQoNCj4gDQo+
IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

