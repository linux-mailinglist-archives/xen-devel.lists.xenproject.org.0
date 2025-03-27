Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15AA72902
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 04:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928435.1331143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txdg4-0004aM-47; Thu, 27 Mar 2025 03:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928435.1331143; Thu, 27 Mar 2025 03:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txdg4-0004Yg-0A; Thu, 27 Mar 2025 03:13:08 +0000
Received: by outflank-mailman (input) for mailman id 928435;
 Thu, 27 Mar 2025 03:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S28+=WO=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txdg2-0004Ya-Af
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 03:13:06 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2409::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62458072-0ab9-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 04:12:59 +0100 (CET)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 03:12:55 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 03:12:55 +0000
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
X-Inumbo-ID: 62458072-0ab9-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpoxZvwkXbB7vG+r7N6h3+ooeJOorHwTwy3M9mXwzffd4cU5bM3qvcXRJJ+UZf8VZwHSxv399mrvKHUQ8iV0VRa8pxu0gmZ69IF4R/u8kp3Mh9oqj063T9iGcCUk16S8EnjgISmPJXeGRYk1skHY1suwhucNAY8+4rcbquE7MM9riU52Ek58eLUP8Vq12PBVY+1qbWqBvdMMLuPxZAAajG/UXy8A4bMU0Pv0kuSgRV1LUeZ2LQLY8lHQN4suBHxHaFKyTvKz7WKMusWtFxGLd+Y6rlrsw01tVJwiYSuezpZevT0j3XtaWniVY3UE7Xr0QywO7a4gLy1Dr5OurW2UGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LJM5PtC3Xxr6vped4HW0mD8Ydgluadw/ZZCZTOrU3g=;
 b=qwFqeojME3EFN70wxbd/8em5V44CaXQ2fcvS0Ugqn+FkjcOjMcazpGQZPTGlt2W3DbsPdaki3Xht8QR/G87y162LHhMZMWe6dG4SnPhKNbNa5FQr1pcyPD8qPgjOHeF3gty417WINwRIx9qMgBTRVTeA7pvK9xxkZ/dL9/PM9WGW8F/+HuSE2lqj5tCo0iOW1fD/Nw0UJfhJmqlXtN21LOflmCvpO0DGXOK594+D1yuJgtsPoELGbzoWjwtqonQ22MSzGBpAMY9wm0doQu0CFKpqZBNcqNsxPpShNITisoivcil2AXwHz/3GG0/W6n20bf6jB2I08alEzUJ9lJTv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LJM5PtC3Xxr6vped4HW0mD8Ydgluadw/ZZCZTOrU3g=;
 b=2H7DVjl/U2U49/w99HGoHfddM7M/pK0ZJdJPJOFvvsfMrOdyPkbNARuiChqUECkMTf6FOobxl8d8gpc836rcMEWRqYw6wFA+66hv90vhP1KmJzIpsGujBjvblVcqFSEG1Qi1gCWeXve+FLGfhnQ0lhGj/daTnWiEuHfTMVAqCUc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbjnNu8gKP+BdRfUqUIswSBCp7ILOChUeAgAKrd/CAAC16AIABDVww
Date: Thu, 27 Mar 2025 03:12:55 +0000
Message-ID:
 <IA1PR12MB84674DAE3F0FD2DB2DD87F17E1A12@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
 <5498f98e-f3c5-4cb4-9a3d-793239a4339d@suse.com>
 <DM4PR12MB84519AF2B72DDDF50CA8BF18E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <df911e05-df3d-4f16-992e-a1931ad00099@suse.com>
In-Reply-To: <df911e05-df3d-4f16-992e-a1931ad00099@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e32bf465-8cc7-4698-b80d-8819d837cd8a;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-27T03:12:48Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|BY5PR12MB4305:EE_
x-ms-office365-filtering-correlation-id: 58ba6228-8f88-4739-30aa-08dd6cdd44f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjlHZ0UyTVN1R3pCZzhDcXBtQWhuWjA5YnE2WTRCQ1lOYnhFTEFBTExpNUcy?=
 =?utf-8?B?bmJibDFHVHdLRWM1eDV4VTV3KzBOUXZGOTViMHc3RDh3bmhJdjhLYUdCbWtQ?=
 =?utf-8?B?bGU3SFNsODR1NXREOXc4Y0V4QzJmbUVrVkJadGVNc2V2ZzRpUTdQU2Z5blJT?=
 =?utf-8?B?Y0RNa3JSelJxcVRiN3czWGwwaE9UWVVGdnlxWks5UTE0a3MxbHZyRFdUUUww?=
 =?utf-8?B?dFJWa2hON1B6VVdCN3RNUjEwSzBuMDMrWEVOaU9ZZE1odDdQd0toamN6N1Zj?=
 =?utf-8?B?NDFWMkhMYncrTVdvNGZJSWw5RkxIY1NUZWxEMkppWlFHdEJwU29UaWNuS3Ux?=
 =?utf-8?B?YzREczkzb2tCUUxlemp0aDBNdWpkMFFQeHpqMFhrbitRNnd1OFcycVdKUWQ0?=
 =?utf-8?B?SjhrdmVQczZwVG9GR2lIZkdMV280a04vWnlzK3hKaGFzTkxqSDN3RmFaZUJY?=
 =?utf-8?B?MW9nNWtlOEpTeHl2emNsUDdNblp3OHg3RnY0UVJ2ZW9aeTh2a3NEcytvZTQ2?=
 =?utf-8?B?NS91ditCMDcrK2ZGa3AyZFd2Um5NTUV1UkpBQXZFVVE4YlN3YTByOGo2R2NS?=
 =?utf-8?B?enh0S0dYTVJPamU1L3Zpb0dIa2s3bS82eHkwaTl3TmdRYldkS2hmYzlZV25p?=
 =?utf-8?B?UnZuL29qVGtURDVOR1hPT3cvOUxWV24zUzZHdjlCRVlwSmRic3FjTDVKWmEw?=
 =?utf-8?B?MFhmSDdGZG5vR2wvbUFXOUdKek1TVGFDR2FPaXA3d1hpS0VyVEJmRHhUdCsv?=
 =?utf-8?B?K2xGV0RWTE85d2F3M2s2a3RkR0dRTWpzYkdaRGhSYnl3QTV2T2VlZWtwb0l6?=
 =?utf-8?B?UnlWV2tvQXRJYXE0ZnVReGx1OHY2M2F3bldwOWVnNUpVT1NvWThEN2hpbGN4?=
 =?utf-8?B?NTBGcGpUSUNSVjcwSFJObFFuS2Z5Z2tyN0dSM2FsQUFNR2ZNZU5zSG5rWUJ0?=
 =?utf-8?B?NTBOYVlDNTZXSTlzTHkrNzU2eXBsWW9kU2xzajlyMDZ6aXJ6ZmRuaitHUmlY?=
 =?utf-8?B?Uk9WNkEzRDVJVElIanhHM3ZKS1BCazdVLzNGNVQ1TER3eVJSN3Y4a1VuR082?=
 =?utf-8?B?cXJnTDl4amhqSU9nSDVsME1FU0RPcUNRQkdOL2p3c1RuQnpCNWVHRkYxMVdQ?=
 =?utf-8?B?UjFZMDQ4bWlFbkpXRzFReHpHcnFVaTMvS21zbStGRk1LRVc1ZE4wbUVSY1pL?=
 =?utf-8?B?NzZqMWVMOEo1U2N6TkZYUXM3UDZpWTltdXZ0aVFyckw0RmUzd3ZKNHRMbGN6?=
 =?utf-8?B?TlZRampvazV0d0hwQ0FBVEJ5ZlJXNWhySmdYaVlGWWcxaC9NK1V3dVRsSFVK?=
 =?utf-8?B?elNqdTlYUzUrcXQ2K3dNU2grZUR6T2puU0pwVHhuSHZ6cFJNN0VRNmJiTnc1?=
 =?utf-8?B?czdxRUljVHpta3phMzF4MVpVL3RoemdVTmZkeUFDcnhPRlNwNjFhSFUwTXJ1?=
 =?utf-8?B?YmhmQmpUajNFVW15UGx2VDBwQldpdHFkSHVwQ2dLSUROS0NyeWh4Umh2QnhC?=
 =?utf-8?B?UXlRUlRBOTFLcStpV0srdm9TNS9NaWlQYWJFejFDc2VlZ2ZtQUl6MkNSblZ4?=
 =?utf-8?B?czY5Zm9hME16Rm5MTThVVnFuSEhPcWl4dFNBSlZKQWp0YVc1TFFLMDlXUXpK?=
 =?utf-8?B?T3FVUFZpTkFydEx3UGdESVBqWk9hWE5lV3ZtVk0reWlKdENUOGZYL2J4em14?=
 =?utf-8?B?b1pFTmlUK1lsOEFISzBYWjVuQ0FPWXJweUFjdjBDSzZUNC83WWViblNnejZE?=
 =?utf-8?B?eUNCczZmcFcxcGFtQ0VQT0ZxQ3A4WVAxUmZVK2MwOExKQkM4dkNzcG5SbSt2?=
 =?utf-8?B?Z3JsL1NEUVoyVnNsN0dLVzVqL1ZWbm1jREpkYWNRMUJvRHphcjJhNUFZZU83?=
 =?utf-8?B?MWJ5WnZlemxrN0xJUjNwN1FiUTgxdUF2bENQM28vaEZNZGF5RUQzbUFERW5l?=
 =?utf-8?Q?Mktt4l2bSTv0jGStd0BQStVuQgjtvnVh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajJWV3YwOWZMMFBVTFRVbUo0eDYrRXlLejBybUJEeS8vbnByMWNJVVh2OUla?=
 =?utf-8?B?YmltY2dUNkFpY3lkNFFmYW5SMHJGb2JDTlBKY0xFS2dZbXhTMEhHY2pEcjFS?=
 =?utf-8?B?K2lBa0puUmNKNjE1R3FLMnpRUm1HYUVjNEhTRWljeEFGbDF5c3BkTXc2dDJW?=
 =?utf-8?B?Q28vK1kwVzMzcEZVNnZBRSsxeWhidmF3c1oxcjZjRCtyaWFSczNFaHZaZFpm?=
 =?utf-8?B?M2ZNNG9aeFlZbzRzZyt2YXJieWJ1U0xZcWZsMktwU29NcXM0SmJqZ093dllO?=
 =?utf-8?B?UEhSNXROVk9iNjVOb2RMb3VGNG5GQWVpTG9TOWM4bldPYzNONEJsek1IdnJM?=
 =?utf-8?B?U1ltWjkwVGYzZHMzQlhlUHphdGVlYWxlY2F5MTJmek81b0xQdFRRVTErb2Ur?=
 =?utf-8?B?dEVQRUFVdDh4VVBJWloxeUdSYmszeDA3dXBZbGwvNHpoVG56WXcxK1lQS1c1?=
 =?utf-8?B?TGlVWGJuNzF2Znl5TWtlYisraVFyb2NMTjRpT1dERVI4c29UZWpSVzlrV1lN?=
 =?utf-8?B?RjJOL2xDM1AzWlYwdUhsbHNHSGtjMWpMY0piTmR5TzY4Ukh2WDhlUkFma3Vy?=
 =?utf-8?B?SlVMeDJoSjZOUGx3UitodkRJZXZvM05RV1ZPNDVHTFNRSUdLckxYbWxtRmRu?=
 =?utf-8?B?SU1PQ2c2Y0RpU0VyMktPUXhjNHhzQjBUWGlsNlQ4REJDbS9ka1RXdW1HRXVw?=
 =?utf-8?B?VjlIVkxWd2tmNkxwdGdYRWhKWHhnUms4RjZoaHVpWkZqRG1WTXlESFJneXh4?=
 =?utf-8?B?cjFsNkF0eHpoa2JpRDBKRjRNN3M1L1NmNXJKVU5ob2pxY1BJa3Z2NTJtQnl2?=
 =?utf-8?B?V3g4WVdOQTJZU0VLd2RoeENrazhGcUFrZGVMc0thNUUvRnpKaXNOOWQvNE1h?=
 =?utf-8?B?cEF3MUVlMFA1YkFwU0tUa2lXNVQ2UUtFZFluNHBJTHczQ2dmc0NBNzkxcDhM?=
 =?utf-8?B?V2w3RktMOGp6Y0NwSDZlZSs0aDc5UnFxUHNLdTdCaGZVMG5rdmxBK1RJekFI?=
 =?utf-8?B?aVZzUENSczdVYXV3TURlRzk4TW5hUjRYaytTR1NPZmFYcytrbDhmdWgwbm5R?=
 =?utf-8?B?QjVHUVJHcndaUnJvV2tjUU5uVk5iNUg5YTZESmJMQW1XMW5ZMnkvN3U1dnFw?=
 =?utf-8?B?RkUyWEZ6REJlOThWTUxJUk1BY0JmVW9ReUpCUHlRQ1cxRFdvNWNwUVg2dWsy?=
 =?utf-8?B?dms0ZHZGK2xSWTZYMmk2bG4rNWJ0RWNmTEVQbGlaY2JFOE1JMCtDL0YvMVd2?=
 =?utf-8?B?d3QxSUErSFhvM05FcDBCK0I3djcxbDAvM0x4eWpnZVpRSFlNVEc2dW5NVnpL?=
 =?utf-8?B?QVJ1V0p1eGRaeEFLWkhzalVRR2hNUTBMQ0tUUWdXQ3FEU09KS2VxZ3VCQ1ZG?=
 =?utf-8?B?SnVPczBNTmJMaE02dWlycFFkTEoyYThucXJmRVpmOGxZZGp2RC9qQ1lPRjZ1?=
 =?utf-8?B?K0sza0czOWV0WEtKRjNoRFZuZHRRSmRsaFVOK2VwNFJMNGVrMTU1VU1pYkR5?=
 =?utf-8?B?ZTN1Rmx1bGJVY08yM3BEVWgxWUxVdFhETC80ZUZYeUZzbENidEhvZlQ2QnhR?=
 =?utf-8?B?d1JNK0hkK0pHKzlWWWFFOEt5b1BsR21uSlhPY1VEaVZpZ0xyNkpqT3ltM1Nx?=
 =?utf-8?B?NlExMEhHUVdtNHpHeWhFdWZQeEF5MHFTV3BCK1R1VHJLQ3JxR2czS2ROcloz?=
 =?utf-8?B?bkJYMmxubTJ1OFJPUEU0Vjc3VFlLODM0Z1VvUnBLMmhibjNWMyswaW9HMTBG?=
 =?utf-8?B?bFZRNStzOUhtcHpYaXRYMFdWN3ZsdUc5UFJHVThtRWFSTFllWlJkRnFFcllR?=
 =?utf-8?B?ckNDcVhyNmt1dGZHcTVoK0ExTy9QckFaZjBsLzQ4QWh3VUFIM2dNSVhKRnFh?=
 =?utf-8?B?b3ZxUnJMTzJUcXNPdDMxNVpHN1gvZnNpdVNCQXNHUm9SSCtROXBuUkFMMSta?=
 =?utf-8?B?Vk9IZ2h5eEp3eXV4b01MVWIxaWJkckhjSWxsK3FtZWxBcmcxTEVieE81YUVI?=
 =?utf-8?B?QWE5RndXZGsxcWJWcUtDdjZ1QnU3L3QweGVoSm9qWE5Tb2s2MkNrRVJJd2VE?=
 =?utf-8?B?RUNhTzl0MFVZcUtHTXpzUVdUQVBJRDk1TlZLamVJWkNtak12S2xJM3drQ3Mv?=
 =?utf-8?Q?FwzI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ba6228-8f88-4739-30aa-08dd6cdd44f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 03:12:55.6671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6ft/24kP2ev+46kFpyhvK2txRCqtfSuY5nUPclYS9IhQd3nqv9LyUSJMJolr0LkWeFgu08QmYJIP/XqzV32RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNo
IDI2LCAyMDI1IDY6NTUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0K
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEB2YXRlcy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+
OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMDUvMTVdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIg
eGVuDQo+IGNtZGxpbmUNCj4NCj4gT24gMjYuMDMuMjAyNSAwOTozNSwgUGVubnksIFpoZW5nIHdy
b3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjQsIDIw
MjUgMTE6MjYgUE0NCj4gPj4NCj4gPj4gT24gMDYuMDMuMjAyNSAwOTozOSwgUGVubnkgWmhlbmcg
d3JvdGU6DQo+ID4+PiBAQCAtNTE0LDUgKzUxNSwxNCBAQCBhY3BpX2NwdWZyZXFfZHJpdmVyID0g
ew0KPiA+Pj4NCj4gPj4+ICBpbnQgX19pbml0IGFjcGlfY3B1ZnJlcV9yZWdpc3Rlcih2b2lkKSAg
ew0KPiA+Pj4gLSAgICByZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9kcml2ZXIoJmFjcGlfY3B1ZnJl
cV9kcml2ZXIpOw0KPiA+Pj4gKyAgICBpbnQgcmV0Ow0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZXQg
PSBjcHVmcmVxX3JlZ2lzdGVyX2RyaXZlcigmYWNwaV9jcHVmcmVxX2RyaXZlcik7DQo+ID4+PiAr
ICAgIGlmICggcmV0ICkNCj4gPj4+ICsgICAgICAgIHJldHVybiByZXQ7DQo+ID4+PiArDQo+ID4+
PiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfQU1EKSApDQo+ID4+PiArICAgICAgICB4ZW5f
cHJvY2Vzc29yX3BtYml0cyAmPSB+WEVOX1BST0NFU1NPUl9QTV9DUFBDOw0KPiA+Pg0KPiA+PiBX
aGF0J3MgdGhlIHB1cnBvc2Ugb2YgdGhlIGlmKCkgaGVyZT8NCj4gPg0KPiA+IEFmdGVyIGNwdWZy
ZXEgZHJpdmVyIHByb3Blcmx5IHJlZ2lzdGVyZWQsIEknZCBsaWtlIFhFTl9QUk9DRVNTT1JfUE1f
UFgNCj4gPiBhbmQgWEVOX1BST0NFU1NPUl9QTV9DUFBDIGJlaW5nIGV4Y2x1c2l2ZSB2YWx1ZSB0
byByZXByZXNlbnQgdGhlDQo+IGFjdHVhbCB1bmRlcmx5aW5nIHJlZ2lzdGVyZWQgZHJpdmVyLg0K
PiA+IEFzIHVzZXJzIGNvdWxkIGRlZmluZSBzb21ldGhpbmcgbGlrZSAiY3B1ZnJlcT1hbWQtY3Bw
Yyx4ZW4iLCB3aGljaA0KPiA+IGltcGxpZXMgYm90aCBYRU5fUFJPQ0VTU09SX1BNX1BYIGFuZCBY
RU5fUFJPQ0VTU09SX1BNX0NQUEMNCj4gZ290IHNldCBpbiBwYXJzaW5nIGxvZ2ljLiBXaXRoIGFt
ZC1jcHBjIGZhaWxpbmcgdG8gcmVnaXN0ZXIsIHdlIGFyZSBmYWxsaW5nIGJhY2sgdG8NCj4gbGVn
YWN5IG9uZXMuIFRoZW4gWEVOX1BST0NFU1NPUl9QTV9DUFBDIG5lZWRzIHRvIGNsZWFyLg0KPg0K
PiBMb29rcyBsaWtlIHlvdSB0cnkgdG8gZXhwbGFpbiB0aGUgJj0gd2hlbiBteSBxdWVzdGlvbiB3
YXMgYWJvdXQgdGhlIGlmKCkuDQo+IEkgdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBvZiB0aGUgJj0u
IFdoYXQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdoeSBpdCBuZWVkcyB0byBiZQ0KPiBjb25kaXRp
b25hbC4NCj4NCg0KT2gsIEkgZ290IHlvdXIgY29uY2VybiwgYW5kIEknbGwgcmVtb3ZlLg0KDQo+
ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5oDQo+ID4+PiArKysg
Yi94ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5oDQo+ID4+PiBAQCAtMjgsNiArMjgs
NyBAQCBlbnVtIGNwdWZyZXFfeGVuX29wdCB7DQo+ID4+PiAgICAgIENQVUZSRVFfbm9uZSwNCj4g
Pj4+ICAgICAgQ1BVRlJFUV94ZW4sDQo+ID4+PiAgICAgIENQVUZSRVFfaHdwLA0KPiA+Pj4gKyAg
ICBDUFVGUkVRX2FtZF9jcHBjLA0KPiA+Pj4gIH07DQo+ID4+PiAgZXh0ZXJuIGVudW0gY3B1ZnJl
cV94ZW5fb3B0IGNwdWZyZXFfeGVuX29wdHNbMl07DQo+ID4+DQo+ID4+IEknbSBwcmV0dHkgc3Vy
ZSBJIHBvaW50ZWQgb3V0IGJlZm9yZSB0aGF0IHRoaXMgYXJyYXkgbmVlZHMgdG8gZ3JvdywNCj4g
Pj4gbm93IHRoYXQgeW91IGFkZCBhIDNyZCBraW5kIG9mIGhhbmRsaW5nLg0KPiA+Pg0KPiA+DQo+
ID4gSG1tbSwgYnV0IHRoZSBDUFVGUkVRX2h3cCBhbmQgQ1BVRlJFUV9hbWRfY3BwYyBhcmUgaW5j
b21wYXRpYmxlDQo+IG9wdGlvbnMuDQo+ID4gSSB0aG91Z2h0IGNwdWZyZXFfeGVuX29wdHNbXSBz
aGFsbCByZWZsZWN0IGF2YWlsYWJsZSBjaG9pY2VzIG9uIHRoZWlyIGhhcmR3YXJlLg0KPiA+IEV2
ZW4gaWYgdXNlcnMgZGVmaW5lICJjcHVmcmVxPWh3cDthbWQtY3BwYzt4ZW4iLCBpbiBJbnRlbCBw
bGF0Zm9ybSwNCj4gPiBjcHVmcmVxX3hlbl9vcHRzW10gc2hhbGwgY29udGFpbiAgQ1BVRlJFUV9o
d3AgYW5kIENQVUZSRVFfeGVuLCB3aGlsZQ0KPiA+IGluIGFtZCBwbGF0Zm9ybSwgY3B1ZnJlcV94
ZW5fb3B0c1tdIHNoYWxsIGNvbnRhaW4gQ1BVRlJFUV9hbWRfY3BwYyBhbmQNCj4gPiBDUFVGUkVR
X3hlbg0KPg0KPiBNYXliZSBJIG1pc3JlYWQgdGhlIGNvZGUsIGJ1dCB0aGUgaW1wcmVzc2lvbiBJ
IGdvdCB3YXMgdGhhdCAiY3B1ZnJlcT1od3A7YW1kLQ0KPiBjcHBjO3hlbiINCg0KTXkgYmFkLiBJ
biBteSBwbGF0Zm9ybSwgSSBoYXZlbid0IGVuYWJsZWQgdGhlIENPTkZJR19JTlRFTC4gSSBwcmV2
aW91c2x5IGFzc3VtZWQgdGhhdA0KQ09ORklHX0lOVEVMIGFuZCBDT05GSUdfQU1EIGFyZSBpbmNv
bXBhdGlibGUgb3B0aW9ucywgd2hpY2ggbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBjb2RlDQpgYGAN
CmVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19JTlRFTCkgJiYgY2hvaWNlIDwgMCAmJg0KICAg
ICAgICAgICFjbWRsaW5lX3N0cmNtcChzdHIsICJod3AiKSApDQp7DQogICAgeGVuX3Byb2Nlc3Nv
cl9wbWJpdHMgfD0gWEVOX1BST0NFU1NPUl9QTV9QWDsNCiAgICBjcHVmcmVxX2NvbnRyb2xsZXIg
PSBGUkVRQ1RMX3hlbjsNCmBgYA0Kc2hhbGwgbm90IGJlIHdvcmtpbmcgaW4gQU1EIHBsYXRmb3Jt
Li4uDQpNYXkgSSBhc2sgd2h5IG5vdCBtYWtlIHRoZW0gaW5jb21wYXRpYmxlIHBhaXI/IEkgYXNz
dW1lZCBpdCBlYWNoIHdyYXBzIHZlbmRvci1zcGVjaWZpYyBmZWF0dXJlLCBsaWtlIHZteCB2cyBz
dm0uLi4NCg0KPiB3b3VsZCBwb3B1bGF0ZSAzIHNsb3RzIG9mIHRoZSBhcnJheSAod2l0aCBvbmUg
b2YgImh3cCIgYW5kICJhbWQtY3BwYyIgbmVjZXNzYXJpbHkNCj4gbm90IHdvcmtpbmcsIGxlYWRp
bmcgdG8gdGhlIG5leHQgb25lIHRvIGJlIHRyaWVkKS4NCj4NCj4gSmFuDQo=

