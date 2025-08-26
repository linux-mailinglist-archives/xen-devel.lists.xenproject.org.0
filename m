Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F440B35396
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 07:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093872.1449242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmdN-0007uy-4l; Tue, 26 Aug 2025 05:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093872.1449242; Tue, 26 Aug 2025 05:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmdN-0007sK-1i; Tue, 26 Aug 2025 05:54:17 +0000
Received: by outflank-mailman (input) for mailman id 1093872;
 Tue, 26 Aug 2025 05:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofj+=3G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uqmdK-0007sE-TG
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 05:54:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1038075e-8241-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 07:54:02 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Tue, 26 Aug 2025 05:53:55 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 05:53:55 +0000
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
X-Inumbo-ID: 1038075e-8241-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8VWQB2+ZpltoTFerdR0LlfSbabv0OWDL+N0hzyI3kI6MRHwUGTNYURJkEtcksurtQqeWOql8lYEV617jsZPg8QMuzcxtE42GTTvbgpDDr9c+yDLHm1JPXAQc3QzesguF5wG35J2SeUXV/moyZhEavJDsWoUnuv8wTB7dIyRTtxjrT6QoyWOD5y25nScghzPnqIFYxe93zYmAHeODDGDZSL+8dp9giUYAlO1B6DgZ0Kn8Hw/xHyrCAuZf0lbhLeK5JDH/z/x+FlLcdDl4u8AViitZLMNdHoaWqEQXFxUlH8pm28tnoD+mWc6Aso4veo8S5OLHOgv7/6Jb9+gsVSgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/pvuoUkyIetcbeS94/7fQhgXtwCEExSJ2XyU+rjjrQ=;
 b=QU+Xt4CRZYX9uzTtv7pGqjPjDugIq46GKXV/RZWJ9Jy5rSTRJpRBlc8lcn04onrBX5tTGZ0fLagz0CCK3GSe1S4OEy3u2L9iNkZITfOBiM17PFJPSt899LvmVY5VOJ+FZ+Gb7gNFN7RLl/c0FYHcWcBPC/7VKVPuCbhqvEwIGQtpJFV92BUMnLLA1Yx4saalPlVCP3oc4UeP4ev5lVuUUmw3gO7aoti51AmHMAtAb9Jasqm0xzriklDo8HhlGU0gRnik+RGBktDaIL6mrdaJDdUjpFCEAZtqnJ+M7PP1478SLKcXj0kNvIP1BXkLAPRIvSkfjOpEkDODzJ5I+EdNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/pvuoUkyIetcbeS94/7fQhgXtwCEExSJ2XyU+rjjrQ=;
 b=43c4RCfx1zwIu5YSoMTijjrabTECOrWjsqldxqFuhsbQJt/cDXaKsoIDnsdQno6PfyxuOYWqFwojyWsoj/PvTMGbL4SwdF6NBw7GOZ/DJLWXQSJmDy7dQwFFi+YK7Z3rsX/4wO2poPyuOjyhX2Ca6ndEopLQi4RmU/oPXe1o70g=
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
Thread-Index: AQHcE1LptmiQN44PAkOVJ+f0CssQOrRze76AgADdVjA=
Date: Tue, 26 Aug 2025 05:53:55 +0000
Message-ID:
 <DM4PR12MB845136B4B4FA756EC654FE31E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-7-Penny.Zheng@amd.com>
 <a4c5e149-828f-4ea9-83e2-79ecc8c56033@suse.com>
In-Reply-To: <a4c5e149-828f-4ea9-83e2-79ecc8c56033@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-26T05:53:49.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6176:EE_
x-ms-office365-filtering-correlation-id: ea7595fa-1d4e-4e3d-c9fd-08dde464f15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUhZaGZqamZuUXpEVmxBQTdLSFdSM2tZRWdiaE92Z1VjdXQ0SnRTSWMxUk9o?=
 =?utf-8?B?Z1ZaRGxvYk54aXI0Z0hWZklRU1VZR2V3WlZHVWhwdzJ2QlB4ak52WVYyU3o1?=
 =?utf-8?B?S2c2K0pUS3RHWmY0WHgyYk1zcytsMldScFlUTGl5NWNtdlVzWDBxM3pmd1VW?=
 =?utf-8?B?YWFiUnNhenREbEFBSFdkeHZWZEl0Uy8zOXV1ZlNVeE5XY1lzOWlTcUIxZWh3?=
 =?utf-8?B?TFY4eEtZZE1VUW5kYzJ3WUZsd3hWS1MzM253eXlxaTBzS0ZuZGo1TXdQK2NM?=
 =?utf-8?B?ekRteHVnd0pXS0VxY3JHM3h0dmQ4T214OExRMW5GZC9NWWoyQlkrc0JKdS9p?=
 =?utf-8?B?NDY5Y2xMN2EzTFpDeTkzWXUzQnpXUVdEMGk0cWxsV0lQbUtZM0YrWThYOC9N?=
 =?utf-8?B?ZHRldytXKys1cU1JZFA0TkwyNDdhVWRwZjFDZm9ENjUwZlZhMXlnaHFZVjJN?=
 =?utf-8?B?bE9HbGYyNkprS2dCMDloOG05L3EzYVJKb0R6bkJ5VHc5ZGxaczlwU0pCdWgv?=
 =?utf-8?B?YTNkU0ZjVkRkVk5DNU1SMkdDcVFPU1N5ME5zVDFFa1dORzJJeENkcWMvTjN4?=
 =?utf-8?B?cDE2Ukh5bFFsNllBRXZZTTZybzgyNkZwTFVXZzVKWUtIT3BUTytFMUtLQXFG?=
 =?utf-8?B?bnlDa1BnMDZUS05MN0lVUDFCQjN5UG1BQkVlaUdRM0txS1dHbGNaVHpTYW1y?=
 =?utf-8?B?MEc1RHB3ajZNUHVzYUhJU3lROG11dEp4WWQyRitiRmUzWlRacXU5OFZId0Rx?=
 =?utf-8?B?SkxOZnA4Z0JtbDZYUkdjTm14UzZMZGR5Yk1XczBQUnc2RmhWNWw0OVliVkMx?=
 =?utf-8?B?cm1TNGV4RHZnUEQ5dVVNQjVmMFd6bUpEVGRIS1dmQnRoaTJwZG1mZlp3SkNn?=
 =?utf-8?B?d3FScTh2MFQyNWhVM0pPOUhweXJ0RlM4Z1FSOUFUY2lKRFRiUnpJVjdLTXgw?=
 =?utf-8?B?Q2RLamdzeDlxYmRxZjBTMG1ERFlGRzlaTGdFb2srcHlNekl3eU4vVm10OTBj?=
 =?utf-8?B?ZDMwTXJ5eTNneSt4S29jNjExR25neGJqTXdaT3dLcFFGV01OK0NZU1ZhWDNV?=
 =?utf-8?B?UjY4N0ZKQ2JEeFNDNjY3VmpZU3RiS0xlQXVLZFBHb0RlZmFaUzFzd3VScFFM?=
 =?utf-8?B?Uk5jNlhEbHlDMG9tRy9HOGtFRUp3TWw0U1M2czFBVUFiQVpVSlJmVmJvUGVy?=
 =?utf-8?B?NVBFSHhTTUl3ZGxkK1V1TGNzc1dXcjNwU3JZZVR2bEsxbkM3Z2ZIUEtSR21V?=
 =?utf-8?B?aTdWMWtqWHRoaDh6S2lJRHhRcEhjdHB6Uy9odXpZVTJ6UXMrVlhKTThIalAv?=
 =?utf-8?B?eDFZem1Tc2Z2Y2RiZlJEQW1ZeFpuWktma2FBSnEyeWRaVGNJN0dFK1krSWtQ?=
 =?utf-8?B?TWg2ZWpHN01Ea2VPS2Q3eld6bStKbEk1ZkpBdDN3SFlackRLSml1Y0xFNlBR?=
 =?utf-8?B?cGszRFFrVTBxc3FRamMxbFR2UHFYanJGbzYrbXcyN1pzL2t0eGZQbnM5b1lq?=
 =?utf-8?B?VWROaFVnYmJtVC9tLzBWYnFlWFRFclRjSzFQbG1ZTG1IWWYxMDRqVzkwT3pN?=
 =?utf-8?B?MnRVUUxwZWd1NXVwVnM4NktPazd4dWROdmM2Z2RxRlVOdUhrVjBuZUg1RnFT?=
 =?utf-8?B?R2duU2tNbk0rNGx4OUt2UHhtdFFoV2RnWFZvSWN4ZHA2RWFwa3A3NVpCelND?=
 =?utf-8?B?OHdOVVRnRG55dFgrYkM3alVYY1Bra0JHNnZ5MVpSZCtQRWZDS05mSGlUVHpB?=
 =?utf-8?B?S3NmZzhlZ2J0OG1jUjNqcTlhNVhDd2lSN2NDK2I3WCtRMm1ITkFwMllEekxL?=
 =?utf-8?B?Qk5FcnJWS2Q4UEtTVHhvNFZMb0tGV3FJMkc3V3BqOWFBVDd4NmpRM0lTRDFN?=
 =?utf-8?B?NHJQUEsrL0w3OFBEb1d3Mks5N0krWjBNcmdPeENmN0tVRnh3YzJ2ZWJIV0Zo?=
 =?utf-8?B?eVJ0TEtoRTk0KzFqdThtME9qVzNrcjY4Z01YclB4WHppamxPNWRCZUIwY1lz?=
 =?utf-8?Q?8FYl/Ho5tKu6mjifkGTKuCXIbHiiIM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3Rya083WEJWdnlFVXBZekFUd1F3RXI5M1cvVFFlVVRLR1lYcEJwY0lxVGNC?=
 =?utf-8?B?YkJpeVFKMmY5blBiNGszNis0U0JZNWk3eW1MdGFZUGl2blFqTVpuK0Mrb0NM?=
 =?utf-8?B?b3lUZTlQVUVsT3ZTVnRLcUsxUDZHSU93dC9JeEZmVHZYUExPMFB4TWZ5Vjlx?=
 =?utf-8?B?RUVSS2h3TXVUOHkzYkpBdFlYdDhYbVV2akR5VHA1ZTAreTd5c09wbEJ1bnZN?=
 =?utf-8?B?WUE0bmcyWGF1TFRMNmhNYW9PUlVwVjRRUmhhV3Rxb1IzV25tQ1M1V2U1ZmFL?=
 =?utf-8?B?R1FzV3RpUkNIWllBTVMwQXVwbUgyMDFBbXNFeE9RZ25nQmhjRzE0OEVSMzdz?=
 =?utf-8?B?WkpqVk9lREJxYnR2NTJGbjlSOXBrbHRYTXpaQVNjWlhMbTlMS3JtZW9KQjFq?=
 =?utf-8?B?aG9SRlV1YnNnU2ZHVEljaGhXYVk0b3Q1L1pZVzhrbEw2Q3ZmeCtoV2hQOXRS?=
 =?utf-8?B?NlhVanRNTUlSYmMrOVk0MWd3SHB6OERnODFDcDdmWVpIMG9kMGkwTzhLSlFw?=
 =?utf-8?B?K25qRktXTXJJZ1hrSHgvQTdSMVlMOFl2b3BROUhyaHhid2VTUlozS1NhYkk4?=
 =?utf-8?B?dmJlcmxUZzJENHBpZVMxaHpvUzloWEcxSkNTUm5ZOVZuZVZ4b1d5WHRpUGtQ?=
 =?utf-8?B?aXVWTitQbm9aU0dBZ2tqblMxSVBqR21YNmc0M3pjb3VxaUg2TU9ObmNVU3VD?=
 =?utf-8?B?b0EzZG14VmkyODIxRkpqcnQ1OHVzcGhadDhwTkRGaVJkWUJqRlF4bURiSGQ5?=
 =?utf-8?B?cmZWL0dkeVhBbVdvK3J2bi94QkVLM3Z2bHlTcnpKbjh3U3FvMDFvRUpjcjhv?=
 =?utf-8?B?RWR4Y01Iak5IVFpkSXQ0QVRGZDdSeHVtV0ttUXY4RVNJTVRyc1FoTGtkYjh2?=
 =?utf-8?B?YnYra1JjMjZwOTFzUTlQU2l6M3luNjNHUmxmVEhIaWM5WDEwVGdQYlVTZDdZ?=
 =?utf-8?B?WXM0cUtScFZkVVZwbFM0K0lFdWVxVjIxaDQ0VzhYTXQ1dGEwQ2FSS0xmMlp2?=
 =?utf-8?B?WVpmTWtnVHhHOXdmSkNwVWtsL2oxcndjdFhROEU2KzZ1eEVMdEo4WGdnSFNz?=
 =?utf-8?B?OEVwVzJaRFMxZXlVV0tRS0U4Z1VnV2RiamR3QUZTcUhkb0xNa1VRTSsvNlVz?=
 =?utf-8?B?SktiMFJOeUhOVUszVWdRZ3AxYlY5dmQ3TWxhbWM4Zjl5cDBZdWpPdUQ4VXRp?=
 =?utf-8?B?MnR3bnpnLzAwTVFqdk5KcDJsZFE4b2hHNGQ0eXpMRXhjWkVJUmQzLzZlNUxD?=
 =?utf-8?B?SkVDRkxUVkI5ZnY5aGhtdm0wWFBoMVp6Umlmc2c1SERLdUVDVlRLNlFZeDFt?=
 =?utf-8?B?L0pLeDlLTzN6cDN2TXRQY1gvMFF5bUVra1ExYU82T3JMdjZLNTlxa1lkTHRK?=
 =?utf-8?B?UHBPekErUCtScXZ5U1JnQkwxdE1RMHU2Q2dZbFp5bWZnQ0RnQm1mUVpybHBz?=
 =?utf-8?B?U0FjT3lleklQY1dhTFEyQ0hZSlRlZEFhamFpWi9MN05VNXQ0TTdEeEN4WFZ4?=
 =?utf-8?B?YjNjdXVwWmwzSHhJeU5WWjhSSVpaSUJUT1Y1YkF0R1hxSXdXb28wN1ZPb09w?=
 =?utf-8?B?ekJ6QWhTU0g4MlZwK1liQ1J5KzBXcHZLNkY5bW9KYWNERGFTUlhrenR3ZzBm?=
 =?utf-8?B?TzFVblc0VmlHdTUrSGhneTJvVm5LVFJSeEl5Q1hjamdOeVVwRXpvQkZncG9G?=
 =?utf-8?B?MEEzb3E4RDY2a0NqZS9Ic1phYjlwTjZPSE5OTi9weTNSb3ZsVnp6Sk01ZE9I?=
 =?utf-8?B?RkVuSFJKWUpzcUdjY0tsUEdHMmZXbUU2U0kzaXkzNjY0bVdtajlGZGF4bWFD?=
 =?utf-8?B?NTJsQkQvdVRwNVpkU0J3ditpd2lGVXZZcXJXQ2tEU3JEVzVsVHlXTEdlWmlI?=
 =?utf-8?B?cWFyZlJNQ2F1YzZKcVIxdFZJOVBXU2grVGUvZnFiYmVKWUt0S1J1c2g4VTg0?=
 =?utf-8?B?NzVmVVQybmZSRUVLZlFqKzdSQThiWVhWNDF1NlZtV3hWSThQMWVySXJ3My9Z?=
 =?utf-8?B?ZW0xeEJKTFpkdERoU1M0ZFFJWFU5N2p1N2J2RUJtQXU5aFhZTm9VeCtpZ2pD?=
 =?utf-8?B?YWpuSzArNzVwZGd3d3Fobmc0Y1kzb08ySEZFVmI5N1FHOHVRaUYycUJ2K3FB?=
 =?utf-8?Q?6wbQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7595fa-1d4e-4e3d-c9fd-08dde464f15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 05:53:55.3181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zq5Yb3foIuKhgtfXOfdCeDE4PxSL2cQ00n80G8JSC313DW77s/MDH403nKUUd7Tfw0PESYw2+ZtQR+ugcxcEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI1LCAyMDI1
IDExOjAyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djcgMDYvMTNdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgbmV3IHN1Yi1oeXBlcmNhbGwgdG8NCj4g
cHJvcGFnYXRlIENQUEMgZGF0YQ0KPg0KPiBPbiAyMi4wOC4yMDI1IDEyOjUyLCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2NwdWZyZXEuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvY3B1ZnJlcS5jDQo+ID4gQEAgLTU0LDMgKzU0LDIyIEBA
IGludCBjb21wYXRfc2V0X3B4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lkLA0KPiA+DQo+ID4gICAg
ICByZXR1cm4gc2V0X3B4X3BtaW5mbyhhY3BpX2lkLCB4ZW5fcGVyZik7ICB9DQo+ID4gKw0KPiA+
ICtpbnQgY29tcGF0X3NldF9jcHBjX3BtaW5mbyh1bnNpZ25lZCBpbnQgYWNwaV9pZCwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGNvbXBhdF9wcm9jZXNzb3Jf
Y3BwYw0KPiA+ICsqY3BwY19kYXRhKQ0KPiA+ICsNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IHhl
bl9wcm9jZXNzb3JfY3BwYyAqeGVuX2NwcGM7DQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIHhsYXRf
cGFnZV9jdXJyZW50Ow0KPiA+ICsNCj4gPiArICAgIHhsYXRfbWFsbG9jX2luaXQoeGxhdF9wYWdl
X2N1cnJlbnQpOw0KPiA+ICsNCj4gPiArICAgIHhlbl9jcHBjID0geGxhdF9tYWxsb2NfYXJyYXko
eGxhdF9wYWdlX2N1cnJlbnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB4ZW5fcHJvY2Vzc29yX2NwcGMsIDEpOw0KPiA+ICsgICAgaWYgKCB1bmxpa2VseSh4
ZW5fY3BwYyA9PSBOVUxMKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7DQo+DQo+IEkg
dGhpbmsgd2Ugd2FudCB0byBhdm9pZCByZXBlYXRpbmcgdGhlIGVhcmxpZXIgbWlzdGFrZSB3aXRo
IHVzaW5nIGEgd3JvbmcgZXJyb3IgY29kZS4NCj4gSXQncyBFTk9NRU0gb3IgRU5PU1BDIG9yIHNv
bWUgc3VjaC4NCj4NCg0KVW5kZXJzdG9vZCwgSSdsbCBjaGFuZ2UgaXQgdG8gLUVOT01FTQ0KDQo+
ID4gLS0tIGEveGVuL2RyaXZlcnMvYWNwaS9wbS1vcC5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMv
YWNwaS9wbS1vcC5jDQo+ID4gQEAgLTkxLDcgKzkxLDkgQEAgc3RhdGljIGludCBnZXRfY3B1ZnJl
cV9wYXJhKHN0cnVjdCB4ZW5fc3lzY3RsX3BtX29wICpvcCkNCj4gPiAgICAgIHBtcHQgPSBwcm9j
ZXNzb3JfcG1pbmZvW29wLT5jcHVpZF07DQo+ID4gICAgICBwb2xpY3kgPSBwZXJfY3B1KGNwdWZy
ZXFfY3B1X3BvbGljeSwgb3AtPmNwdWlkKTsNCj4gPg0KPiA+IC0gICAgaWYgKCAhcG1wdCB8fCAh
cG1wdC0+cGVyZi5zdGF0ZXMgfHwNCj4gPiArICAgIGlmICggIXBtcHQgfHwNCj4gPiArICAgICAg
ICAgKChwbXB0LT5pbml0ICYgWEVOX1BYX0lOSVQpICYmICFwbXB0LT5wZXJmLnN0YXRlcykgfHwN
Cj4gPiArICAgICAgICAgKChwbXB0LT5pbml0ICYgWEVOX0NQUENfSU5JVCkgJiYgcG1wdC0+cGVy
Zi5zdGF0ZV9jb3VudCkgfHwNCj4NCj4gSSBmZWFyIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzOiBJ
biB0aGUgUFggY2FzZSB3ZSBjaGVjayB3aGV0aGVyIG5lY2Vzc2FyeSBkYXRhIGlzDQo+IGxhY2tp
bmcuIEluIHRoZSBDUFBDIGNhc2UgeW91IGNoZWNrIHRoYXQgc29tZSBkYXRhIHdhcyBwcm92aWRl
ZCB0aGF0IHdlIGRvbid0DQo+IHdhbnQgdG8gdXNlPyBXaHkgbm90IHNpbWlsYXJseSBjaGVjayB0
aGF0IGRhdGEgd2UgbmVlZCB3YXMgcHJvdmlkZWQ/DQo+DQoNCldlIGFyZSBpbnRyb2R1Y2luZyBh
bm90aGVyIGNoZWNraW5nIGxpbmUgZm9yIENQUEMgaXMgYWN0dWFsbHkgdG8gYXZvaWQgTlVMTCBk
ZXJlZiBvZiBzdGF0ZVtpXToNCmBgYA0KICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG9wLT51Lmdl
dF9wYXJhLmZyZXFfbnVtOyBpKysgKQ0KICAgICAgICAgICAgICAgIGRhdGFbaV0gPSBwbXB0LT5w
ZXJmLnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSAqIDEwMDA7DQpgYGANCldlIHdhbnQgdG8gZW5z
dXJlICJvcC0+dS5nZXRfcGFyYS5mcmVxX251bSIgaXMgYWx3YXlzIHplcm8gaW4gQ1BQQyBtb2Rl
LCB3aGljaCBpcyB2YWxpZGF0ZWQgYWdhaW5zdCBwbXB0LT5wZXJmLnN0YXRlX2NvdW50Lg0KV2Ug
aGF2ZSBzaW1pbGFyIGRpc2N1c3Npb24gaW4gaGVyZSBodHRwczovL29sZC1saXN0LWFyY2hpdmVz
Lnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyNS0wNi9tc2cwMTE2MC5odG1sDQoN
Cg0KPg0KPiBKYW4NCg==

