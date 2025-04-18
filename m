Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7009FA93586
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 11:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958827.1351431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5iIy-0000nJ-CK; Fri, 18 Apr 2025 09:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958827.1351431; Fri, 18 Apr 2025 09:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5iIy-0000lf-6j; Fri, 18 Apr 2025 09:46:40 +0000
Received: by outflank-mailman (input) for mailman id 958827;
 Fri, 18 Apr 2025 09:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VdL=XE=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u5iIx-0000lW-46
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 09:46:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:200a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044189a8-1c3a-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 11:46:37 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Fri, 18 Apr
 2025 09:46:31 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 09:46:31 +0000
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
X-Inumbo-ID: 044189a8-1c3a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7JjU8cRAwOSzMwUR3zZqODH1gNWNa8pNg2wz0HNfHaRL6I0vBmU2PZNtIEQV3ValjZT0nn6L89lFtMFUQkUsUSp40mnWrADmQKazgmYdDIH5Z/TWmG+gUk1C2UBOdUx4COrov3A02Q6/7x+OFD5WB6lJB5qcfsxSg3HbjFtsWk/ERpZsJlxPVZlzXJX/vr22e3b5Iru3T5zaPvplZUnWMN7OMMoK9+g3Xly72GuJ62cf+GD3n/10+BU8p42KFaPt2r/MCUiFK8HTAwPROdIvRAfDA/y+gjIuVbnNResJUKjK0xMVl2L3V2yILSUf2EpxPNJ08S26EFhdhhouvjDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0gB7+lmym7cS5JIqUeXEHREwKoTG13rs0xXMLaym4Y=;
 b=tOQWZcjhJl56SqYE5o6bVopmAMlcdsDVnV6L3oDcd5Kamvvof7GQuuzJKhxLgUYSo7IPZnCStp6fG4UKKzAPZJ7keGsDqEHFPKS7MaucNF+8V0NdU04gCYMlhC0Z9+3shuv6zTjjFJCfAnM744xFxU0vd+tAFUve8YEyyvutZjNiVi+pY8ETSlamreHszDidNjkNlh2ElfeCz0f3ZmmKjRJdyo/idUzkApO0bBJBBrMWpZnsYaegn1jE1PPT3genVRGr2p9BEFBz1VeWb7gSNUEOg5/A9Sh1QSSkxxYGaj2oFbTVLvDD3VbCxS2Hm7hX8jEOIMq/ZkECp57hDYQ0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0gB7+lmym7cS5JIqUeXEHREwKoTG13rs0xXMLaym4Y=;
 b=EANls3O7XiV2Tae+3jlk+ds31s8mruf4dcG+qcPqK7fSEKahqWe2M1+HACelSQOvZosWBDZJ94pIlTyBuL4JgYXd04MoU8RJmImU5SXkH6b5cYfOMBN/Ve2inzQmeVLhJDqjJ4LY33h4Dedfiu2TTsLyalMzoHoXJbZYGIo5Hd4=
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
Subject: RE: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
Thread-Topic: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
Thread-Index: AQHbnhOEhC4MbJSWBkeJErel9AvRkLOO7ZUAgBpaesA=
Date: Fri, 18 Apr 2025 09:46:31 +0000
Message-ID:
 <DM4PR12MB845116DF8BF05D205BD8622FE1BF2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-19-Penny.Zheng@amd.com>
 <33b166be-21db-473e-a59a-3779436c0494@suse.com>
In-Reply-To: <33b166be-21db-473e-a59a-3779436c0494@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=811c2760-efa1-4230-9046-6aff4bb3dab4;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-18T09:46:24Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6563:EE_
x-ms-office365-filtering-correlation-id: 851682a7-708c-4337-6654-08dd7e5de5e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0pOWnFiUnhEYVJMZFRuT2RvcUMrV0dWOEJTRGZjcFJvbS85anU2WW9KZWI3?=
 =?utf-8?B?VEtPVkF2eXZpR0VWQnVZSW5mMXRQWGJEbndXYkNsZGlnMDF2SjU1bW51TDkr?=
 =?utf-8?B?Z0RGRklibjJmcFg5MEtzNHQwcndJRjBiV2RpTG5mdGJQS2hxbTRpOE4yRWE4?=
 =?utf-8?B?MCszVDNNOGFhT3RYWUZTV0hNcmRZQnN1TU9LM2U1YzFaN2FsNksrdDMzVlc4?=
 =?utf-8?B?QTdCUkh5TDVWTUNKVEVzbWlQZnRDeWI3TFE1dXBzYlI4Qjg5c3QrMVdGRjFw?=
 =?utf-8?B?dEJLUElic1B6L2ZmQnUzV2JwUUNjUXZNdlUvdHdhdlFyMlJONVA3N2R1Y1A2?=
 =?utf-8?B?SWhvdXFmSDVnbEVxamRxL0d2UlYyMGsvVzF6UGdoUHJVRHFCZWtLSldxcVUv?=
 =?utf-8?B?dkVqT2Y2MDlzMytXaUsyNGQ4Z3hlNU5ZTVRwRmpYRjJLd1dyZGxIK1RVZVZL?=
 =?utf-8?B?TG9waHZ5TXgxUDUyY3NZc0hndVFac2dFNXNCNnRGNlkyZUNybWdXSVdZOFRH?=
 =?utf-8?B?RWF5UlUrbVAyeFNHK3NFVVhQZ1FOdUpDR1RLWkhSTk1EY0kyQXhYdjVCSGdD?=
 =?utf-8?B?bWZSL0J0R2VCbU5SWWJ5T0FFMmV4ODVCbmtKenpkWHRrcTlWYy9OUFQwOFhC?=
 =?utf-8?B?OXBxYThVbGpoREErUlY1TkNEZ2JlTFhCQXFLMS9pMlNDTlRwSlcwa0tONUUv?=
 =?utf-8?B?UW16V1pPWWRnbzhMY0trZUVMNGtkeFFhaC9SVEZyU0FXczZ6ZnFrKytmQWMy?=
 =?utf-8?B?amc5WkhxR2xRUWhJa0toUkxMMUI5T0RtemJUZjFrZXN2cXkzNndhOUY4RDUr?=
 =?utf-8?B?cEtyZXg5NC9YNmpSS3hTTEM2YlJLTDFsRDJRZS8yMVlnOCszWUtHYWVYMHVB?=
 =?utf-8?B?NmhLZnhRQkM2MExCWVBtU3k4OWN2VStabWZick5TY0xuNGJ0b3QxY0VHUFZU?=
 =?utf-8?B?OVhWSktuVVdHVnlFejk5RzFTa3hVVzVrUG02SXArdWFrOTI1UjliZVhKNG5p?=
 =?utf-8?B?OEN6cnlrZ3doc3NTNVpsbElZelQxRGhJRXFYM0twMURzQWFreUl0OTc4Y3d1?=
 =?utf-8?B?UHJCNWFTeU5odGxVY2ZyeHhWOTM3VDVEOTEwRjloMU1NS09DajZ5algxNmNG?=
 =?utf-8?B?eFladEVsR3Npd3ROYmZJZXNUUUxKZHg2c2hLZURZS3htdktTdVZ3TzlxRWJ5?=
 =?utf-8?B?R2drZGFabG5jeGVnai8wVzFuQ0w4cU9iakFNN2lRbUQyQXJlc2t2bjJRbm14?=
 =?utf-8?B?V0V3MUVEb3l0K2tTNzFuUCtzQUdGR293Um9pVXdQWkN5WkJITkhCT1gvUVRn?=
 =?utf-8?B?V011MlgybndqZlZKMFlVOGVJa0h6SlJ3bzZkYkdQSERsWUEyZWV2RGgyV0Rq?=
 =?utf-8?B?dmV1dUtnRmNUY255bEJOcThCRE9QL2FvbWZ6aGJPMFA5VmxTWk51eWc1anpv?=
 =?utf-8?B?WFhpQ3V1N1dsSXlKcXdrb0lKaURVR0FJT1p0djJmUndxbDdRc0wyMGxaMEVH?=
 =?utf-8?B?OWdEVzVjNFFPSEtpVFV6Y081NjBjTStVTmZJUEIwVmFQQWdCQ0Y4Y0lzcWZL?=
 =?utf-8?B?eUNXc3djVENBbk9yVktxZ3l5ZkdmNS9yempSNDRmL2tVSDBabVlSUllIc0ZH?=
 =?utf-8?B?ZU5NcjJNallRWEtRaHUwYjdpSlRhbllVU000RGdncmcxUis0dzJXbUJFcU9H?=
 =?utf-8?B?N1IyN0ROMlROL1lxRERyYUdpcHc3S0VxbG5adHcyQzJ1UEh5djdjVjVtd3Qv?=
 =?utf-8?B?RWg1eXdBNlA3eExRYW45NFpJbHdGbnd3c3FpSEFxNkR0T25CcTBnNGljY3ht?=
 =?utf-8?B?Y1hrSlM3Rmg3ZzhQL2xKSGUzN2VNT3FUZWlIMlp4Z1g5VCs5dDkrTlA1OWJy?=
 =?utf-8?B?bTFlRDYwRUxVcDBJb2tKSlZPYnpGYlI5YWpkWEV5QkFBbzNzTXFUSUFTSGRK?=
 =?utf-8?B?cW02K2ZnNXhmRWZ1UFR0YTlUQklyNnF5bklER2JlOWptRXlMSERySUNMcTFa?=
 =?utf-8?B?QWlIUnIrM2l3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHdMbGVRS1I5ZmRmbEFiVldlczliY3dweTZEWnlmY25zWWVlSlBjOHF5cTBl?=
 =?utf-8?B?azNmYnpmZUZJQ0NoalEzL09YcG5LY0hTdVp3SkUvakhtZGljNnM5TXpQdW5D?=
 =?utf-8?B?eDgrL0kzK0kwWEZUNytITjhoUTZuZUFLT3pnaitOR29MbGx0T3h5S0JRYUVX?=
 =?utf-8?B?azdMQ3NNTDgzS2ZDMkpVN1RrRzZ2dXQ5QjRRcXpZd0JuZWx5Nlp4VG9xTW1I?=
 =?utf-8?B?b0hQeVVMRlRFTzBXWXdHY1huSU1tUkJmaVdIS3VuV0FvQ3l3dzlscXZhRW9S?=
 =?utf-8?B?MzgrVjlxbTNsdlM0alN5RWZVSTFxcnE3RFlhSnZ3T1l0Y3hvV3hQSC9DOU03?=
 =?utf-8?B?Q2diVC9pb25xRXI0WC94UXJtbVo4L3duZVo4eFVUeUpqdXVzQzIrTTZ6c3VP?=
 =?utf-8?B?WjZRSVAvSlpuSGtES0JXQjBmbGJkYldPM3NXbk53MlBYVVRJNTdsSUIxdlBI?=
 =?utf-8?B?SkY5R2QyODY1dkFEVjZSVStKbmJERExRZVdXSlFnajBkTzlxRG5neExoV0ZL?=
 =?utf-8?B?ZUZxV1lNRUF5dndpekdTKzZqaGk5RmZHVkltdzM4WkFMZWU1eVltc3dETFFT?=
 =?utf-8?B?VkQ2Z1hVUHcwdTV2OXFKVm8vUEpuMjFxVWE4WG9HSWlRUURnVDk1QWNENjVB?=
 =?utf-8?B?OUUyOFZuYVd0Sm1iNGYxR0pKUEZMMkZ3ZVJBaUhEVmlpTzNnWVVJRXlWV243?=
 =?utf-8?B?N2NIYUxmd2pVeHkyUHFuLytueGlvMFdqUEVQQm5mRy9IZ1g4S2pOWVdMUmR0?=
 =?utf-8?B?TUxuRWZQT1lBRGdTVGtEcUNTekZXNFROSEpmdmcydXFrT2dUMFRzcHNCcy9a?=
 =?utf-8?B?Uy9qb2YvMXdVSktyczU3em9iWVp6eE1NRUFoazZzK3pKL0lWeFlBZGIrRzRv?=
 =?utf-8?B?N0o0ay80VjBZN1dsSUFmQVhPODFaT2d6MnE2dDkvdURnaWFOZFFkMEcwZVJB?=
 =?utf-8?B?MDY5ZStOUXdhODlVRG04UXdodHF3aHpMU3J0R1dqZ0VaUFQrSkFmV3RybDRE?=
 =?utf-8?B?cmhHSWp0YWwvVHVYaW9TRzQvd0E3ZnU1ZWYvRk9DR0ZaL21jMXRwcVViNmox?=
 =?utf-8?B?b0V5RlFBaTVSRW1yWXVKVjluTFo2QVdyVVpBdmg3OXphMHJ6eWZhK3Qrb1BK?=
 =?utf-8?B?WnBKR090bWpqUlI2aDRYcnV5WWQ4Y0FiTW85VHVrRWt2K3hMcVdpdityeXhx?=
 =?utf-8?B?WldUbkt0dWZYa1haeSs3VnZOUUwzdnYwRXdKWFFKd0pVWVlhSGh2US96NTFO?=
 =?utf-8?B?Q2ZxeWxCOU5Od04wa2d2TkhGaTZ6OGVaYTRvU3BOSGtKdjJjdmZBQkFxSmRm?=
 =?utf-8?B?azJTRmxqWEIrVTVNdjIvcHQxUjFEaGZ1ajZjcUc1V2lzRENiQnozM2JYcHNq?=
 =?utf-8?B?VC9Eem8yTnBqWkpPbGZXU3h5cHlERGFoN1BJRDdDWVBjbUFoY3J4NDFKcXhF?=
 =?utf-8?B?V2ZTL0gvRlllbzBEUjNpa1pTWThSMDIvc1JHdFBIZHdMRW50SXlRTmZGMnZT?=
 =?utf-8?B?UWFIV2ZLdW1DaTFPdTF0c1dBN1pXNGIvNWlacFhWalJVWTRaY1hFYVJZRFVN?=
 =?utf-8?B?U08vaXRtalByYURLSitVRklJRnY4TFhJZ0dDZXZZUVJQQzU1SlpRdXVsTHlN?=
 =?utf-8?B?WWZ0dkVoZ1d3RjQ0N0xUWEcwaTJPY1YvVEVBYXA0UmkraCtFR3dIakxYUHBZ?=
 =?utf-8?B?aGtRd3JVcWJ4Vk9ESGtRM0FiZlBxRFJYMW1DbEpvZE4xSFVCSzhYYU1OMjNk?=
 =?utf-8?B?VldoWkxHZnU5TkpQMFZjR3NEMFd0UmJsTjhaazZaNkhlaCtBYmNSYXoyOFpr?=
 =?utf-8?B?M3FNajh5RFdvU2hVazN6WS80VmZUUW4wanQ1TTI0L3hWb2o4c0pEeStpS1Uv?=
 =?utf-8?B?NGxPKzhsc1ZuSjZMbkVFSmhyV0JpQkFTanBhekJmNEVjZnlvK3plZWEzNnJS?=
 =?utf-8?B?MHR0N04vcDZ0S0N0anZOaWNpaTRHVnMvYTVDcjRtOERLS3Z0aGRlL1RwcGtS?=
 =?utf-8?B?RUZpbnZqYWtHY2FQOHNKL2dVWlQ4cG5HdWExN0VHdExvMGxtQ3NyMkRRZWpN?=
 =?utf-8?B?bVlBVzNSWXVtWjlvdlpDSFdEZU5pTE9oQ0RjOHQvcnRBWmtKV3lSNThCUC9w?=
 =?utf-8?Q?tobI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851682a7-708c-4337-6654-08dd7e5de5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 09:46:31.0244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pkZ9D7ELojR76pQpKAkJDacvceM+8O/EtFcvjGGQlt4gnb5T2Ggneu9vVptU8ois92sZ5ONZRVe4CDTEW3L7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563

W1B1YmxpY10NCg0KSGnvvIwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmls
IDEsIDIwMjUgMTA6NDcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT47IE9y
emVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50
ZWNoPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbGlzdGFp
ciBGcmFuY2lzDQo+IDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBCb2IgRXNobGVtYW4gPGJv
YmJ5ZXNobGVtYW5AZ21haWwuY29tPjsNCj4gQ29ubm9yIERhdmlzIDxjb25ub2pkYXZpc0BnbWFp
bC5jb20+OyBPbGVrc2lpIEt1cm9jaGtvDQo+IDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT47
IFN0YWJlbGxpbmksIFN0ZWZhbm8NCj4gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgU2Vy
Z2l5IEtpYnJpayA8U2VyZ2l5X0tpYnJpa0BlcGFtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxOC8xOV0geGVuL3N5c2N0
bDogd3JhcCBhcm91bmQgYXJjaC1zcGVjaWZpYw0KPiBhcmNoX2RvX3N5c2N0bA0KPg0KPiBPbiAy
Ni4wMy4yMDI1IDA2OjUwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBGdW5jdGlvbiBhcmNoX2Rv
X3N5c2N0bCBpcyB0byBwZXJmb3JtIGFyY2gtc3BlY2lmaWMgc3lzY3RsIG9wLg0KPiA+IFNvbWUg
ZnVuY3Rpb25zLCBsaWtlIHBzcl9nZXRfaW5mbyBmb3IgeDg2LCBEVEIgb3ZlcmxheSBzdXBwb3J0
IGZvcg0KPiA+IGFybSwgYXJlIHNvbGVseSBhdmFpbGFibGUgdGhyb3VnaCBzeXNjdGwgb3AsIHRo
ZW4gdGhleSBhbGwgc2hhbGwgYmUNCj4gPiB3cmFwcGVkIHdpdGggQ09ORklHX1NZU0NUTCBBbHNv
LCByZW1vdmUgYWxsICNpZmRlZiBDT05GSUdfU1lTQ1RMLXMgaW4NCj4gPiBhcmNoLXNwZWNpZmlj
IHN5c2N0bC5jLCBhcyB3ZSBwdXQgdGhlIGd1YXJkaWFuIGluIE1ha2VmaWxlIGZvciB0aGUNCj4g
PiB3aG9sZSBmaWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTZXJnaXkg
S2licmlrIDxTZXJnaXlfS2licmlrQGVwYW0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55
IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+IC0gdXNlICJkZXBlbmRz
IG9uIiBmb3IgY29uZmlnIE9WRVJMQVlfRFRCDQo+ID4gLSBubyBuZWVkIHRvIHdyYXAgZGVjbGFy
YXRpb24NCj4gPiAtIGFkZCB0cmFuc2llbnQgI2lmZGVmIGluIHN5c2N0bC5jIGZvciBjb3JyZWN0
IGNvbXBpbGF0aW9uDQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9LY29uZmlnICAgfCAgMSAr
DQo+ID4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgfCAgMiArLQ0KPiA+ICB4ZW4vYXJjaC9hcm0v
c3lzY3RsLmMgIHwgIDIgLS0NCj4gPiAgeGVuL2FyY2gvcmlzY3Yvc3R1YnMuYyB8ICAyICstDQo+
ID4gIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgfCAgMiArLQ0KPiA+ICB4ZW4vYXJjaC94ODYvcHNy
LmMgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gIHhlbi9hcmNoL3g4Ni9zeXNjdGwu
YyAgfCAgMiAtLQ0KPiA+ICB4ZW4vY29tbW9uL3N5c2N0bC5jICAgIHwgIDIgKysNCj4gPiAgOCBm
aWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcg
aW5kZXgNCj4gPiBmZmRmZjFmMGEzLi5hYTFiNGE2ZTZiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9LY29uZmlnDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiBAQCAt
MTQxLDYgKzE0MSw3IEBAIGNvbmZpZyBIQVNfSVRTDQo+ID4NCj4gPiAgY29uZmlnIE9WRVJMQVlf
RFRCDQo+ID4gICAgIGJvb2wgIkRUQiBvdmVybGF5IHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYg
VU5TVVBQT1JURUQNCj4gPiArICAgZGVwZW5kcyBvbiBTWVNDVEwNCj4gPiAgICAgaGVscA0KPiA+
ICAgICAgIER5bmFtaWMgYWRkaXRpb24vcmVtb3ZhbCBvZiBYZW4gZGV2aWNlIHRyZWUgbm9kZXMg
dXNpbmcgYSBkdGJvLg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmls
ZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZSBpbmRleA0KPiA+IDQ4MzdhZDQ2N2EuLjdjNjAxNWI4
NGQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+ID4gKysrIGIveGVu
L2FyY2gvYXJtL01ha2VmaWxlDQo+ID4gQEAgLTU0LDcgKzU0LDcgQEAgb2JqLXkgKz0gc21wYm9v
dC5vDQo+ID4gIG9iai0kKENPTkZJR19TVEFUSUNfRVZUQ0hOKSArPSBzdGF0aWMtZXZ0Y2huLmlu
aXQubw0KPiA+ICBvYmotJChDT05GSUdfU1RBVElDX01FTU9SWSkgKz0gc3RhdGljLW1lbW9yeS5p
bml0Lm8NCj4gPiAgb2JqLSQoQ09ORklHX1NUQVRJQ19TSE0pICs9IHN0YXRpYy1zaG1lbS5pbml0
Lm8gLW9iai15ICs9IHN5c2N0bC5vDQo+ID4gK29iai0kKENPTkZJR19TWVNDVEwpICs9IHN5c2N0
bC5vDQo+ID4gIG9iai15ICs9IHRpbWUubw0KPiA+ICBvYmoteSArPSB0cmFwcy5vDQo+ID4gIG9i
ai15ICs9IHZjcHJlZy5vDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYyBi
L3hlbi9hcmNoL2FybS9zeXNjdGwuYyBpbmRleA0KPiA+IDJkMzUwYjcwMGEuLjMyY2FiNGZlZmYg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3N5c2N0bC5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL3N5c2N0bC5jDQo+ID4gQEAgLTE1LDcgKzE1LDYgQEANCj4gPiAgI2luY2x1ZGUgPGFz
bS9hcm02NC9zdmUuaD4NCj4gPiAgI2luY2x1ZGUgPHB1YmxpYy9zeXNjdGwuaD4NCj4gPg0KPiA+
IC0jaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICB2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3RydWN0
IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKSAgew0KPiA+ICAgICAgcGktPmNhcGFiaWxpdGllcyB8
PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtIHwNCj4gPiBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwOyBA
QCAtMjMsNyArMjIsNiBAQCB2b2lkDQo+IGFyY2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9zeXNj
dGxfcGh5c2luZm8gKnBpKQ0KPiA+ICAgICAgcGktPmFyY2hfY2FwYWJpbGl0aWVzIHw9IE1BU0tf
SU5TUihzdmVfZW5jb2RlX3ZsKGdldF9zeXNfdmxfbGVuKCkpLA0KPiA+DQo+ID4gWEVOX1NZU0NU
TF9QSFlTQ0FQX0FSTV9TVkVfTUFTSyk7ICB9IC0jZW5kaWYNCj4gPg0KPiA+ICBsb25nIGFyY2hf
ZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsICpzeXNjdGwsDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQ0KPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9yaXNjdi9zdHVicy5jIGIveGVuL2FyY2gvcmlzY3Yvc3R1
YnMuYyBpbmRleA0KPiA+IDdiM2Y3NDg4ODYuLmFlODY1ZTE5NzIgMTAwNjQ0DQo+ID4gLS0tIGEv
eGVuL2FyY2gvcmlzY3Yvc3R1YnMuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3N0dWJzLmMN
Cj4gPiBAQCAtMzIyLDEzICszMjIsMTMgQEAgdW5zaWduZWQgbG9uZyByYXdfY29weV9mcm9tX2d1
ZXN0KHZvaWQgKnRvLA0KPiA+IGNvbnN0IHZvaWQgX191c2VyICpmcm9tLA0KPiA+DQo+ID4gIC8q
IHN5c2N0bC5jICovDQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgbG9uZyBh
cmNoX2RvX3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkg
IHsNCj4gPiAgICAgIEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KPiA+ICB9DQo+ID4NCj4gPiAt
I2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4
ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkgIHsNCj4gPiAgICAgIEJVR19PTigidW5pbXBsZW1lbnRl
ZCIpOw0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94
ODYvTWFrZWZpbGUgaW5kZXgNCj4gPiBmNTljOTY2NWZkLi44MzdlYWZjYmMwIDEwMDY0NA0KPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQ0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtl
ZmlsZQ0KPiA+IEBAIC03OSw3ICs3OSw3IEBAIGlmbmVxICgkKENPTkZJR19QVl9TSElNX0VYQ0xV
U0lWRSkseSkgIG9iai15ICs9DQo+ID4gZG9tY3RsLm8gIG9iai15ICs9IHBsYXRmb3JtX2h5cGVy
Y2FsbC5vDQo+ID4gIG9iai0kKENPTkZJR19DT01QQVQpICs9IHg4Nl82NC9wbGF0Zm9ybV9oeXBl
cmNhbGwubyAtb2JqLXkgKz0NCj4gPiBzeXNjdGwubw0KPiA+ICtvYmotJChDT05GSUdfU1lTQ1RM
KSArPSBzeXNjdGwubw0KPiA+ICBlbmRpZg0KPg0KPiBJIHRoaW5rIEkgaGFkIGluZGljYXRlZCBi
ZWZvcmUgdGhhdCB0aGlzIHNob3VsZG4ndCBzdGF5IGluc2lkZSB0aGUgY29uZGl0aW9uYWwsIGJ1
dA0KPiBtb3ZlIGJhY2sgdXAuIFdoZXRoZXIgdGhhdCBpcyB0byBoYXBwZW4gaGVyZSBvciB3aGls
ZSBhZGRyZXNzaW5nIG15IHJlc3BlY3RpdmUNCj4gY29tbWVudCBvbiBwYXRjaCAwMSBJIGNhbid0
IGVhc2lseSB0ZWxsLg0KPg0KDQpXZSB3YW50IHRoYXQgIlBWX1NISU1fRVhDTFVTSVZFIGxpa2Vs
eSB3YW50cyAvIG5lZWRzIHNvcnRpbmcgYXMNCmEgcHJlcmVxIGFueXdheSIsIGRvZXMgdGhlIHBy
ZXJlcSBoZXJlIG1lYW4gdGhhdCBwcmVyZXEgaW4ga2NvbmZpZywNCnNvbWV0aGluZyBsaWtlDQpg
YGANCmNvbmZpZyBTWVNDVEwNCiAgICAgIGRlcGVuZHMgb24geHh4DQpgYGANCg0KPiA+IC0tLSBh
L3hlbi9jb21tb24vc3lzY3RsLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+ID4g
QEAgLTQ5MCw4ICs0OTAsMTAgQEAgbG9uZw0KPiBkb19zeXNjdGwoWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQ0KPiA+ICAgICAgICAgIGJyZWFrOw0KPiA+DQo+
ID4gICAgICBkZWZhdWx0Og0KPiA+ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICAgICAgICAg
IHJldCA9IGFyY2hfZG9fc3lzY3RsKG9wLCB1X3N5c2N0bCk7DQo+ID4gICAgICAgICAgY29weWJh
Y2sgPSAwOw0KPiA+ICsjZW5kaWYNCj4gPiAgICAgICAgICBicmVhazsNCj4gPiAgICAgIH0NCj4N
Cj4gVGhpcyBpc24ndCBlbm91Z2guICJyZXQiIGlzIDAgd2hlbiByZWFjaGluZyB0aGUgZGVmYXVs
dDogbGFiZWwsIGJ1dCBtYXkgbm90IHN0YXkgMCBmb3INCj4gdGhlIHJldHVybiBmcm9tIHRoZSBm
dW5jdGlvbi4gSSB1bmRlcnN0YW5kIChleHBlY3QpIHRoaXMgaXMgZ29pbmcgdG8gYmUgZHJvcHBl
ZA0KPiBhZ2FpbiBpbiB0aGUgbmV4dCBwYXRjaCwgYnV0IGV2ZW4gaWYgb25seSB0cmFuc2llbnRs
eSBuZWVkZWQgdGhpcyBzaG91bGQgYmUga2VwdA0KPiBjb3JyZWN0IGltby4gVGhpbmdzIG1pZ2h0
IGJlIGRpZmZlcmVudCBpZiBwYXRjaCAwMiBpbnRyb2R1Y2VkIHRoZSBvcHRpb24gd2l0aG91dCBh
DQo+IHByb21wdCwgaS5lLiBhbHdheXMgZW5hYmxlZC4gVGhlbiBhbGwgdGhlICNpZmRlZi1hcnkg
YWRkZWQgdXAgdG8gaGVyZSB3b3VsZCBiZQ0KPiBtZXJlbHkgc3ludGFjdGljIHN1Z2FyLiBJbiBm
YWN0IGluIHRoYXQgY2FzZSB5b3UgY291bGQgb21pdCBhbGwgdGhlIHRyYW5zaWVudCAjaWZkZWYN
Cj4gdGhhdCB0aGUgbGFzdCBwYXRjaCBpcyBnb2luZyB0byByZW1vdmUgYWdhaW4uIFBsZWFzZSBj
b25zaWRlciBnb2luZyB0aGF0IHJvdXRlLg0KPg0KPiBPdGhlcndpc2UgSSB0aGluayB0aGUgI2Vu
ZGlmIGFsc28gbmVlZHMgbW92aW5nIHVwLCBmb3IgY29weWJhY2sgdG8gc3RpbGwgYmUgY2xlYXJl
ZA0KPiBoZXJlLg0KPg0KDQpJJ2xsIGNoYW5nZSBpdCB0byBhcyBmb2xsb3dzIHRvIGNvbXBsZW1l
bnQgY2FzZSBmb3IgQ09ORklHX1NZU0NUTD09biwgcGx6IGNvcnJlY3QgbWUgaWYgSSB1bmRlcnN0
YW5kIHdyb25nbHkgaGVyZToNCmBgYA0KICAgICAgZGVmYXVsdDoNCisjaWZkZWYgQ09ORklHX1NZ
U0NUTA0KICAgICAgICAgcmV0ID0gYXJjaF9kb19zeXNjdGwob3AsIHVfc3lzY3RsKTsNCisjZWxz
ZQ0KKyAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQorI2VuZGlmDQogICAgICAgICBjb3B5YmFj
ayA9IDA7DQogICAgICAgICBicmVhazsNCmBgYA0KPiBKYW4NCg==

