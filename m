Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27DB19B48
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 08:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068765.1432629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uioIt-0003jl-N8; Mon, 04 Aug 2025 06:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068765.1432629; Mon, 04 Aug 2025 06:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uioIt-0003hG-Jo; Mon, 04 Aug 2025 06:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1068765;
 Mon, 04 Aug 2025 06:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owTc=2Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uioIs-0003hA-8X
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 06:04:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3aa8eda-70f8-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 08:04:08 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 06:04:02 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 06:04:02 +0000
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
X-Inumbo-ID: d3aa8eda-70f8-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+YLdtqLB4ehAwrMhBdwIZJMXRyXco+/CN00AjT19Ix9ACVHPqrV/KUe2Km9ona5yrFhkfURjldsavhWOgAQBiC3cJ3dFS0MscExfeGPaDT76INdWfbTKrjhJgOuXjQVaj4qQZxCFnj8LulnnWZdaMC1NVnFda5pHrFW4NU9dDzYDtbjcmf8gkqPeGAa1sGjlFibqh2DptW5dyc9bep0N0Lpx6oIBFLO3YW1PdjoeamPMebEc0EN9OVBFWUn+hSuufNUJrJCR5hEgNx8mAIpAY+QatwbhIZ4h8uIKHhbdWkbEzMCHuTtGnAsLyKfARNXV5EEsiyWSi6DzKVtXLW6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGnCakyqd8UMKZiuJ0iK2GF1Bhi+bRcqVYDKw5ml4zE=;
 b=DikHha9OmXc5ZjMVc5zML7xxtrEU+DWI87iaVyqHkBUdniEOtnrdZFXki39mSSnlOd0P48LoL696NGwWsuFWOVGMAheWpXHfOZtc2Fx4G2sNVWyVFkYZ/mJlpi0onYQ+M0721gSRxklxGJl1q3Lff/6zd+leyJ/iskyyKilo/usQtQcilTPjCyi3phpxVlyVWJWZ1Hh4O2tgdUG042PanFZrmQRIZQqm690fS7Te78MwhNTqT4mNjjz1kxxSK4a7MjuZJCp7TN3ERty/pS3EdzmsLabywFuNcFAxOGvk07rIYjG1dY5hoLRWY0mZyZKR9Y4W62ieagAN28j67UANag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGnCakyqd8UMKZiuJ0iK2GF1Bhi+bRcqVYDKw5ml4zE=;
 b=im0MwtTjcQe+1Ri/YqbFlJUsWYTUBfbZlp5bcETIRC72TUnKt2dTck9q5QneGkJt4ufFtdE2gVSudJ3a0gsYot3QHDWpDYbQKrtLSHn0D/OEssu3lHOsMqRo78Zsl2mxm5EsJp3UbpEH2GQUtZNl2usepPCeqVNdmDMnEIxQFl0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHb8hcZyJcOgUanrEKBu4lvlAPx+bQ04KUAgB1EuoA=
Date: Mon, 4 Aug 2025 06:04:02 +0000
Message-ID:
 <DM4PR12MB8451C4DA5340306CAB9E6BE5E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-6-Penny.Zheng@amd.com>
 <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
In-Reply-To: <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-04T05:58:27.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB6716:EE_
x-ms-office365-filtering-correlation-id: f8697494-1630-4972-5f82-08ddd31cb63f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q203UXJZMjVvUUhlR0xaVDgwL3NFS3BPS0F2M1VaUkZEVWlacnFrOE5TRVVY?=
 =?utf-8?B?Y2JZMkZNdHBwM3dZZTJobTJTMnZRMkx3SVlWMDAzemZReVF5UUM4aE1HNm5r?=
 =?utf-8?B?OFZTTlFXbEpJeURFdG1oOEtKOVpNR1E1dnRRR013KzNJeFA5WUx6T0RkY29P?=
 =?utf-8?B?bVc0QXFCRTBDTXlpQkZSSExXdGVmc3BOcnMxbGFxM01oV3o1a0M4dnRwbkpo?=
 =?utf-8?B?ZzRvMGZUSDhPM004R0hDcDFwNkh5VUhSUUFNZzJ1OTEzU2pORkpYaW1xVGNm?=
 =?utf-8?B?QS9xRTgyeHpJV3YrT0NvUkZFRmdaOEJTTVhsdXlHUkV3ZmVzd1lMTkVrV0U0?=
 =?utf-8?B?UDRUazg1VWNFckl4ZjlVYjlMVkdUQWdVZGtVMlpRL25VUXppRVhVM25PVW1L?=
 =?utf-8?B?a1IrQURnL1BObXVvK1JSQnpQSlA5U1ZqK05KM2NkUXJsbWNBWmhjMU85cXRq?=
 =?utf-8?B?VjFQcnJxdEhpdS8vNGZLa2FzYmxrSytWaXJhUmZCU3lTc3NaS1pnMnhpYzIw?=
 =?utf-8?B?M0FWemV5UkFHWHVuYUdpQ01kdGY1VlF6VTN6bWk0N1psam5kN2RWb1NMTTNY?=
 =?utf-8?B?dkM5YVpTbncxa2dNS25wQjNYWEplOHdFbDJmcklydnlXMVdzMUZ6MXRISm1D?=
 =?utf-8?B?STBaYzArZ3ZzRDd6L1B3Z3djSFE0bjVTdEljTmprWFZTN2FvZUxkdlFjNXpK?=
 =?utf-8?B?NWJvQVhBS0tNUkhKM255bmZ6WnRRTVZzME14YzlNRzhzKzVFeHhkZ2FTREQ5?=
 =?utf-8?B?K2NvaXhDUHk4VXVGVDJac1pENHZSYTV5cVVJYVZNUlRDM2lUeW5WeGJYYVpD?=
 =?utf-8?B?cHJ6WFgzTGZYcVlrQ0xHeFpBRGJQTVVKQk9qRi9QdXpHVVJSeHhabTlQYW1a?=
 =?utf-8?B?eWMraThTcjc5Vlp1bU1vMFFaSXo4NHJDRnlkeUtTTVo1R1VmOWxydmdZZVRq?=
 =?utf-8?B?WEJhVnh5UDRic3VCWERrN2ZHZHJXamNVVFMwajUxUUY5ZHpRTXc0YkZBMFRp?=
 =?utf-8?B?djNzMXV6cDJ5L1JQRDNDcnR2N3hvcWVscUtmdC9kVmZNSWRIQXJqeFBkQ0Ew?=
 =?utf-8?B?eldLTlFTbmhtVUZiRmtWMGJ3SDMrcXZ3V3A1ZDRTMDhvb3FaMlB5bVFWZFpZ?=
 =?utf-8?B?WFJOR1YwWThkOUtpY3Z0SHJTelJoeFhJZTZJZzRrSHAweEJCTjcxd3RoalBI?=
 =?utf-8?B?YlN5VmZLV0FYTFVrYW5mNE1UdUt0UUpla240VGJ3RVZtYVhoWm4zcEJ0SFRN?=
 =?utf-8?B?bzhqZnp2MWs1aVRteE5wdGRkNHRxSjhta0pIWDZ0elE0SUVrbThzbGVkSit2?=
 =?utf-8?B?WTVQcEVaZXozL0ZvSFJEUnhuYnlvdjRUS3RKUzRvT3ZVaU4xQlRYRyt6ek9z?=
 =?utf-8?B?RmZ2c0ZNdElvY2NhQkJKaXV3cTBqWGNzeUhyUU9KeVZuRSs3bkVRckQvY2lS?=
 =?utf-8?B?akY0R3BaWjRVUFRBcEFUTWxSQlF6SXMxSloxWWlCSm9ha3ZwUSs3TFNsd05C?=
 =?utf-8?B?ODJUdktoaU1pZ0NtWi91SllXQm9WWmtDdkZySXFjbklBck9TbU9aUjBHdnBF?=
 =?utf-8?B?cnJjOUh3U2tvYm5CYW5EY010OVVVM25lU2U0am56akIvWmhVbitiaHU5WUNa?=
 =?utf-8?B?Vmg5b0ZCb1hreGxLbURoUEFseHYrUXcwTUpMNURlU29DaExsd3NQQVh1TEhM?=
 =?utf-8?B?SDRXeVlGWGJ1bWU1K2dzdUUxemJQUzduWEtheEU2V3FaZ0t6cVUzajFLYWFM?=
 =?utf-8?B?TW5QMjVrQ0lqVm00dm15S010VDJ4ZktHc0JoR0NCWEsyeUlYaXBrbHlBSlNL?=
 =?utf-8?B?WjBFMVNNZ3BUdUlDQlN0OS9MeVFjZFFCdlBYQnVrT3JrWVpwMzh0UkxoU0RX?=
 =?utf-8?B?WjlQWnVEVVVnT3h4WFFoelFVRmJsQkFFWExmdXBQY2grVTUrM3Y3Z052VVFv?=
 =?utf-8?B?aHNFS1RPYlUwVjhQVEE2NDl5Q09PRVEzd3BZNkVsSEVibGttb0xYbnU1R0FL?=
 =?utf-8?Q?BI9aeM6/YBD+acE9Lh8wy7uJqB+aYE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXlPT09BcnRkQkRHb2ZCbDZGOWJtTlRVUUI4RFkwOE93djB2TmZpUWhaR1My?=
 =?utf-8?B?d25DWWthbWV6VHZMVUp2OU1tek5ZY3JRM3V1alRBUWdXcXpzSEltY3ZMMkIx?=
 =?utf-8?B?VW1TWldZb3YxZXljYS9BbUE1eE1MQW0zSlpKSFVyRXY3eWVVY0NIUFIzaVdH?=
 =?utf-8?B?Z3JWRjNWYVhodjBrM21kdUhwYmdoT0ljZ0dqelFwalNXRGc1eGZObHhRVTlk?=
 =?utf-8?B?bWl6TWlIRFJZSFBDZGcrMHM3U3dudFFnb09yNkY2UVBJK21WZjhvSm1Ba09m?=
 =?utf-8?B?Vmx0OERWOTIzREhOMU9QYmxaa09NZHJFOTREZGpidGdtMkNvSEw1TWM3TG9N?=
 =?utf-8?B?dDJpVk1wSGtMckhTV3B5Z1ErcmpJUkFISXo5ci81akhwZUxaL1BDRE9zSnh2?=
 =?utf-8?B?bVBRWFhvcUdHVnhjQmlEYjZiNjJoejNnZnorTnNiVU9VRGRJV1VmVk1Md2Jy?=
 =?utf-8?B?eHRqdjhBS0VqQndoenBvZER3bGc1VjI5cTFHQVpPa0JjaksvUHlhemE5cHhD?=
 =?utf-8?B?NkUxVG9vMWppRW5iNnZ3TXlqTVl3cXQxWU95bDFzTkNGN2grUE52R0hvNmM3?=
 =?utf-8?B?M2NuTUxXMWI4SE1HK1hkRmNEcUlYWjFLc2lMd1llU2hTRGNsY0lhVEN5dGlr?=
 =?utf-8?B?NCs0UU9IMzI5OGVjelJKakdoUjd3Qjc4TWpwMkNxaG91WUx0dXE1MUs4ZlNU?=
 =?utf-8?B?bm9peUxPem45cXRlTkFIK2J6TXFaWTJ2OFlKWU5hNkRleUlDbkpzaDd0QVQ3?=
 =?utf-8?B?UE1mOVRSUk5udzVUdXY3NmlRRzdPS3lDV0UrbjNvQTJyenJHRmc4aldJUFNU?=
 =?utf-8?B?bUdZR1dFR05mWDY4VlZ3TmhudWJuMTFwcUN6OGkvblRSdzFwOWZwTXhPS0l1?=
 =?utf-8?B?MHpRTWYxOUxidVVGdkUyS00yU3k4WXdibks5MUVRWXkrL1hKZ1RaQzA4NWN6?=
 =?utf-8?B?aXkralZ5TjQvNzl0SER1OFRmZTlxTGFyTE1rMVdHUTFTclFCdnFTVkdBTGN1?=
 =?utf-8?B?OWorYWlveW5Id29JcjdrZmhCV3RMeWNIaG9BRUgyN0RyZUk4WmYxbndQdFdU?=
 =?utf-8?B?b1NzbEZTOW1sL2hUVXZQRit6QkNTdGRxdW9wV3AwZGhic3F1b2lVQVpRNWww?=
 =?utf-8?B?azhYYmRyd0dobWdPUlg3bEhqaVVWQk9BU1hNUDdYMy9lQUZSdVljY1RLRmYr?=
 =?utf-8?B?TlFmOXBUekN6K3VnM0VhWEh1M28vL0FiV2I3a3dBUnhRRlR4TlBieEVFN0hO?=
 =?utf-8?B?NkEySGxYbVdoZ2tlVTNSRDdqYVNhaWl5SzkvbUI1RzJCNVdyV0xwZ1Z3UVlL?=
 =?utf-8?B?T3dOOVEwV0Z6UWVDeUFDSUxHVnB0Um9xU1R5QzQwdTB0SzZ1Si9CeGJPZGly?=
 =?utf-8?B?eVZZenNCdFZwMzFBb0FrVEtHRXQ1TlZaZFQ0MTZFMS9OUW13T0plY3h0cXNp?=
 =?utf-8?B?dDZiSmM1MzRHZTk5T1pkRjNSZDh5dkNIdU5mb3BVZGNQdU1ZRTVReWtUQjFJ?=
 =?utf-8?B?Y2JabkorZEUrSFNWc1lUa0VKSEFob3AvSnM3T3pnTXRlSG1icGpyUzdmZWwr?=
 =?utf-8?B?RG9hTlJmYkp1bkpMNVd2M1JXQVJZcWVud2pQVVI2RzFMV3E3cE55b1ZJYlpB?=
 =?utf-8?B?UlhUc1p5VEl6WWk3RXlFUHZDeTlLT1J6NGQxaGZ0OVRPcHpQZXV1RGMvdVo2?=
 =?utf-8?B?RHYrbjdzY1pFWW9rZlB6dU54NlpERWlsOXY5b1JNZlZ2VEs4NE14RWowc29U?=
 =?utf-8?B?NkZic0QrSmg2RlRwcmRKVG1SS2FWckxGTm8wYXJ3QmFGVk9EVzNWa2VRY3JP?=
 =?utf-8?B?MEpRWFhKbUJIcEFMbXBkNnY1Z1Exc2IzcEE4b1pGTVN6QW4yZDh2ODlWQjUr?=
 =?utf-8?B?ODRWejc2RVdzZHdsaG9jZC96T0ZhMkJ0ZmxqN2pucUVGRERTVFF2cGJLajIx?=
 =?utf-8?B?UmFhQjY2OEFJampVVm1LWG1VVFZRb1RYYUtLVWtDRENlcFVqL25FSE9McTlq?=
 =?utf-8?B?bG93UGt5ZHh5Mlp3cHEvQXA4d25lVC9pRmx4WUNKd3pzeGhxanRGSktONFo4?=
 =?utf-8?B?bXRUZGVDTVdzdjl3RFpyK25LbWpQMGVVcHBIcFh1OXJCckdLck9BK1lsVHVl?=
 =?utf-8?Q?mHTw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8697494-1630-4972-5f82-08ddd31cb63f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 06:04:02.6524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emUn1uraUs1LG0SBQCsSRncAD0skiMRHGcUDySR++WrDFYHja3bAfI8nE5Sd46Ig+BFgL4XMGr27wwcVPnCx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNiwgMjAy
NSAxMTowMSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xOV0geGVuL2NwdWZyZXE6IHJl
ZmFjdG9yIGNtZGxpbmUgImNwdWZyZXE9eHh4Ig0KPg0KPiBPbiAxMS4wNy4yMDI1IDA1OjUwLCBQ
ZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEu
Yw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4gQEAgLTY0LDEy
ICs2NCw1MyBAQCBMSVNUX0hFQURfUkVBRF9NT1NUTFkoY3B1ZnJlcV9nb3Zlcm5vcl9saXN0KTsN
Cj4gPiAgLyogc2V0IHhlbiBhcyBkZWZhdWx0IGNwdWZyZXEgKi8NCj4gPiAgZW51bSBjcHVmcmVx
X2NvbnRyb2xsZXIgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJFUUNUTF94ZW47DQo+ID4NCj4gPiAt
ZW51bSBjcHVmcmVxX3hlbl9vcHQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9vcHRzWzJdID0geyBD
UFVGUkVRX3hlbiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBDUFVGUkVRX25vbmUgfTsNCj4gPiArZW51bSBjcHVmcmVxX3hlbl9v
cHQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9vcHRzW05SX0NQVUZSRVFfT1BUU10gPSB7DQo+ID4g
KyAgICBDUFVGUkVRX3hlbiwNCj4gPiArICAgIENQVUZSRVFfbm9uZQ0KPiA+ICt9Ow0KPiA+ICB1
bnNpZ25lZCBpbnQgX19pbml0ZGF0YSBjcHVmcmVxX3hlbl9jbnQgPSAxOw0KPg0KPiBHaXZlbiB0
aGlzLCBpc24ndCB0aGUgYXJyYXkgaW5kZXggMSBpbml0aWFsaXplciBxdWl0ZSBwb2ludGxlc3Mg
YWJvdmU/IE9yIGVsc2UsIGlmIHlvdQ0KPiByZWFsbHkgbWVhbiB0byBleHBsaWNpdGx5IGZpbGwg
YWxsIHNsb3RzIHdpdGggQ1BVRlJFUV9ub25lIChkZXNwaXRlIHRoYXQgZGVsaWJlcmF0ZWx5DQo+
IGhhdmluZyBudW1lcmljIHZhbHVlIDApLCB3aHkgbm90DQo+ICJbMSAuLi4gTlJfQ1BVRlJFUV9P
UFRTIC0gMV0gPSBDUFVGUkVRX25vbmUiIChvciB1c2luZyBBUlJBWV9TSVpFKCksIGFzDQo+IHBl
ciBiZWxvdyk/DQo+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGNwdWZyZXFfY21kbGluZV9wYXJz
ZShjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyDQo+ID4gKmUpOw0KPiA+DQo+ID4gK3N0YXRpYyBi
b29sIF9faW5pdCBjcHVmcmVxX29wdHNfY29udGFpbihlbnVtIGNwdWZyZXFfeGVuX29wdCBvcHRp
b24pDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBjb3VudCA9IGNwdWZyZXFfeGVuX2Nu
dDsNCj4gPiArDQo+ID4gKyAgICB3aGlsZSAoIGNvdW50LS0gKQ0KPiA+ICsgICAgew0KPiA+ICsg
ICAgICAgIGlmICggY3B1ZnJlcV94ZW5fb3B0c1tjb3VudF0gPT0gb3B0aW9uICkNCj4gPiArICAg
ICAgICAgICAgcmV0dXJuIHRydWU7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJu
IGZhbHNlOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfY3B1
ZnJlcV9jbWRsaW5lKGVudW0gY3B1ZnJlcV94ZW5fb3B0IG9wdGlvbikNCj4gPiArew0KPiA+ICsg
ICAgaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBjcHVmcmVxX29wdHNfY29udGFp
bihvcHRpb24pICkNCj4gPiArICAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gKyAgICBjcHVm
cmVxX2NvbnRyb2xsZXIgPSBGUkVRQ1RMX3hlbjsNCj4gPiArICAgIEFTU0VSVChjcHVmcmVxX3hl
bl9jbnQgPCBOUl9DUFVGUkVRX09QVFMpOw0KPg0KPiBUaGlzIHdvdWxkIGJldHRlciB1c2UgQVJS
QVlfU0laRSgpLCBhdCB3aGljaCBwb2ludCBOUl9DUFVGUkVRX09QVFMgY2FuIGdvDQo+IGF3YXkg
YWdhaW4uIFdoYXQncyB3b3JzZSwgdGhvdWdoLCBpcyB0aGF0IG9uIHJlbGVhc2UgYnVpbGRzIC4u
Lg0KPg0KDQpJIGZvdW5kIHRoYXQgd2UgYWxyZWFkeSBoYXZlIGFycmF5IGluZGV4IGNoZWNrIGlu
IHNldHVwX2NwdWZyZXFfb3B0aW9uKCksIGJlZm9yZSBjYWxsaW5nIGhhbmRsZV9jcHVmcmVxX2Nt
ZGxpbmUoKQ0KVGhlbiBtYXliZSB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIGl0IGFnYWluIGhlcmUN
Cg0KPiA+ICsgICAgY3B1ZnJlcV94ZW5fb3B0c1tjcHVmcmVxX3hlbl9jbnQrK10gPSBvcHRpb247
DQo+DQo+IC4uLiB5b3UgdGhlbiBzdGlsbCBvdmVycnVuIHRoaXMgYXJyYXkgaWYgc29tZXRoaW5n
J3Mgd3JvbmcgaW4gdGhpcyByZWdhcmQuDQo+DQo+IEphbg0K

