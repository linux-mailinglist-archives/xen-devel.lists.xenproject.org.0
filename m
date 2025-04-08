Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F27A7FC16
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 12:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941735.1341142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26Fy-0004jq-27; Tue, 08 Apr 2025 10:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941735.1341142; Tue, 08 Apr 2025 10:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26Fx-0004h9-V4; Tue, 08 Apr 2025 10:32:37 +0000
Received: by outflank-mailman (input) for mailman id 941735;
 Tue, 08 Apr 2025 10:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QzSt=W2=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u26Fw-0004h3-8F
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 10:32:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2413::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c67b253d-1464-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 12:32:33 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 10:32:28 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 10:32:27 +0000
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
X-Inumbo-ID: c67b253d-1464-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJhXm1+rAkaudxiU+s7TrZjTcsXwqA2JClZN+su25637WUiHwca+rYSDeZR0ITKNfs211jOrAd1VJ4EVijp2K2qE3BKGTDqdDbDYgnUmHzponjiP5p1OKK3QbUJKz566UmrnPZsNKhouDDY6NMQA/F9wJYfc2tvdSyYtXyyfAG752ljNtoxk0l3/lIXTq6XpnzJ4t/6Rj+rzOQjn+80fuq13Iub0ko9IxaNQ8aLmNZK2QaEr8lUvzhq3+1Cy5EkhuSmpiOUYs1e5uux/31xUlRXf/5haNrZomiXgEHum03yAUi76jqqVqZckA9o5lNwke3KrU3JZ5Jg4uIByub7sJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev7nvsJKZBmuBBVLRoLK7K9PkOBUVIAuA45RqMOyAgw=;
 b=gcqPoiMs60qyNT8IDC8RnE0MWmvOb80Pmne2I5vg1Ai0dM5ren3JS/ucK1Um+sxcH8w/ESkGMSqoncaIlO6BsbgLn4kJi1D7kTSrGW/8o09TSgg0MC+9Oaf/attZUeNxGJ5erhb6ECywLTrDIrpFQ4fbejONU7pi+nIuXd5Ad3UXrrHjV6o9o/GqoCzWs02DFlywEZ5DLnTjNKNZLngAQudtdpykJAHxt3qVwuKP+HHvIqSlAEYWmR6+bcNVMGWRxsbOae8XFe/1oklNxkHEKwryEe15qAIXNgv7ygtbGRh8Z3K6wpWk+fMl7+AldM83zR/QYkhQgIBQc3FAlVyu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev7nvsJKZBmuBBVLRoLK7K9PkOBUVIAuA45RqMOyAgw=;
 b=p+/+LYSk1lEoPxs5NqpKRYzbjPN0DjgphxYZGFSAEG5i4Yft84q8wplmI6kkEi9RaZbaKP/ndzK6pD1dbIMM5r2Fc0XJ5nms/V89Nnu6jiLNvep14Pil7YB8ZKdAnSiyXDf2JohwjwyLZsWKiJDv4nsp+f2MiSBx/X26UcOgJKI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Topic: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Index: AQHbjnN37UHiYLzXuU6NGNUDEkiF17ODyhuAgAMeFYCAAV4OAIARekvw
Date: Tue, 8 Apr 2025 10:32:27 +0000
Message-ID:
 <DM4PR12MB845181D707515CB4D077480FE1B52@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-13-Penny.Zheng@amd.com>
 <6bcd0903-7406-4105-b471-85b5eb0bccc0@suse.com>
 <DM4PR12MB8451472692B00DAE0A909954E1A02@DM4PR12MB8451.namprd12.prod.outlook.com>
 <56243215-797b-4a1d-915e-7fabd6271388@suse.com>
In-Reply-To: <56243215-797b-4a1d-915e-7fabd6271388@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=3a8dd3f6-df18-4998-a1ff-938efd1d046f;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-08T10:31:43Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB9063:EE_
x-ms-office365-filtering-correlation-id: 3e8139f2-0936-4880-2a60-08dd7688a8d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkxMYngzYWtoS3RiVU1oMEV3eWF1SEVGdUtUS1U1MUJydDhVeWpWcTBPY0Fu?=
 =?utf-8?B?V1BZMlhTVXV2TW5MTlZ2THdBcCsyYzR1YmdnbVRQVWhlR08vWVhkcFhKbXds?=
 =?utf-8?B?Q251YWtPQzlpUVpGY2VwSjl0V2IwNE5DcERLR3Q1Q3RHdk5iN0x0NEMzeFpD?=
 =?utf-8?B?a2RhY2F2NWdnY3ZlaU5YaWY5WUhEWmNKWDh1RlJJQ0ppNE9lRENtd2lKcFY0?=
 =?utf-8?B?a0Z3WWVqMXcxVGNPaWRzaXpwV3M0TTl0TTl4V215S3B6MmlXWUdkdFVjSllN?=
 =?utf-8?B?M3dGVjdDRkRVYURXRHNPMlFXVXk4dzBldDF0Vy9PdG91dFQvR2RkQnhwVDdk?=
 =?utf-8?B?K3FmejFWcWQzRnpIR3FPdmoxdXVuY0VwNmE0cHdkSTlaS1JvTEZsbTJheWxk?=
 =?utf-8?B?dU4wcFEzb2szSnhwV1JBQ0NEczJQRXVBRCtqNWo1aW11NmY0WENrdjdKZlM0?=
 =?utf-8?B?RFN3OTZwL0U0aDJuMXJaMjRkNXdPMkJoMEVSM202d1diUnBOK3B1RGJmV2RB?=
 =?utf-8?B?eGUwVHlzS3F3TlFsQlV0d1RVM29sTm5rL0dBanludW9xK0Rxd1BsOUJueE4x?=
 =?utf-8?B?TVBONnRkVldsL28rcjZkeURuZ2UyNWg4cDlUaXJTbEJ1MDdQOGFNY2toQ052?=
 =?utf-8?B?OXFrZDZ6UWtaR3BQU1lVODkvS2tIVklHNnJveW9UWXpkUUtWWVYxNHVxZ2kv?=
 =?utf-8?B?N040cERGWGhlTnhnbFJqWXZqRGJwU2RVTlhkUVlWOHBKNzNORG0yUlgwdGZj?=
 =?utf-8?B?NTZpNlJ2MThIaG9GMmRZTXlYdC9oRTZpNFR0OGNWbU8remo3NTN0N2g5TzZ4?=
 =?utf-8?B?QzN0dzh3OVJhOXk3QnZxQ3Ria01sa3A1bEY0YWNsUVdKcVNncVNqRHVqcHZE?=
 =?utf-8?B?cjNpQVZwcmJkYVduNWR2aUYxczhNVHdmUVZkU0s4cFJlWHlENlNOOVE2amdz?=
 =?utf-8?B?V0tvaEFUNFlUUFFYRlVkUUszb1RjdTExYkxwOUZvc3ZRc0tXN3RLeExpS0NP?=
 =?utf-8?B?YUxYYVMrSGtUdk55MndudU5YelFwcDdmMW5UKzlMNDBhUndVTWpXaXdwU1g0?=
 =?utf-8?B?SmtUOVc2eVZOMDZ4SlJOaXpiVFVFSVBRcy9QcmN3TStEd0ovQVR1bHpObFNh?=
 =?utf-8?B?aGdsblZvU3piWnJxbmVMK1ArUWFtalZTbUNJTmtxb3YwTllHWUVjczFLdDRB?=
 =?utf-8?B?TW1Td1dpWmpyMG1WK0RyR3Zoc3FQRWpQMDRyZTdiK3Q3NGxwMzVHZmtXMXNK?=
 =?utf-8?B?YmhtQm9OY3JyTE9Ba2FEMXk3dzJ5eUpIZVo1b09nVkVQS1dBQ1ROK2xGeDVM?=
 =?utf-8?B?M05tTHFyV05rRWZJUi9WUnllN3ZEdnoyWTJDa0Y3b0pUVHNMdnJxMWlBQkRF?=
 =?utf-8?B?VFhTZVYvQm92emRKdGhVSWM0SXduejROdWdpY0Zsazh1aXJFOEZUVkNjRzQx?=
 =?utf-8?B?Vi84bDBja2pQdGRyRXpobWllZUgrRVlvQ0ZIMUszYm1lSHRYbG1CU21sdkRv?=
 =?utf-8?B?TkhEODVxeDFZWUNna3lvTG96ejJ6dldhVlZCeDNrV3FzYWk1WTVvUlZCSHJ2?=
 =?utf-8?B?ZmlKbElSbnArZzhYT09QOXRNMXQ4OVV0NlR2ZWxiQzV1TStZZ204Tm5SSHIv?=
 =?utf-8?B?eHNCVGc0dmF2TW9TT1RDcUxCQS90K3BZYm5VV3lpbHU2K29SYndZTytwcUNY?=
 =?utf-8?B?RWZWcHIrRXlmY21Od0w0WFRjcCtnSk9WZWZNcDFMbGRNZVNsQnA4OGxROWQz?=
 =?utf-8?B?aDkrWkZkYWF2d1N2dktNKzc5UjNDdTY2a1hLSmJRMHlMV04wN2dKa0NIOFo0?=
 =?utf-8?B?MGdWMWhOV2llNkFmK2pyQWZKR3QweU5KWlFiQ0VkMEFEWnFDNmVwVWJTcnAw?=
 =?utf-8?B?VEk0SVROaGMySDlSMU02RTQ3dmJPeVlZaUMrbWJaOEJhb01oRFphM25ISDFU?=
 =?utf-8?Q?2K84Yc3se8v4Ad8NzxRfSrQrQCpNC2pb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Skpta3JJRkpMV2Y4UWNZc3JmMkU0OUgvQlBpd1pCZmZHdzdpdHkra3J3a0FY?=
 =?utf-8?B?MzdQZVRtSGpUZGtBYVI5WEVUbDdaT25temNwRk5yd3EwMTRZRlBUbVZQTUNz?=
 =?utf-8?B?NnBXRlE4eGVkb1QxNkovUG9jV2JJYWRHVGNiTzlraEVvZnF3MU9IenJ5Z0R1?=
 =?utf-8?B?dytrZXpGRC9SL1VCRjNaSGZpQnBzRkcvdU92ajc5akZxemR5SWgwYVdDUHlJ?=
 =?utf-8?B?NzFtRlNmbWlMbzVIUEJxQ3hndVFXSU43Y2o4cnYzYkRBQnQraXBEU1cxcGpi?=
 =?utf-8?B?TGNONEVnRGdFYmI4L0ExcmlzNUNCNGdPSytOUVhzZGxKU3l4Sk5ielN2ZU8v?=
 =?utf-8?B?b3RNYVBYVUlmK09YUytmNGJMdER1L1k4MXdGcHBaTCsvVERMNmJDSmpSTVhU?=
 =?utf-8?B?QlV2WFZJamc0eUV6VXZZa3JoU01XM0FEeFJpRlMxb3ZsYlptZFhXdDlvUHdz?=
 =?utf-8?B?bDYyQlcyUVNVMjFUdzJMZ2VZQW9pMkFxc2VTWHhjLzNlekRISXBadzJKNTZL?=
 =?utf-8?B?SlMrUTg0am9vM0VjUG9GK1ZYNGRFRVFWOGRzS3hBTU5PR1V3Ym4vVXQvdVly?=
 =?utf-8?B?bmJzZlVOQk1BTkgyU1BiMFRURW1JVE9jVjE1bWN2RGw2eUtIVDAvaHk0b2g5?=
 =?utf-8?B?WXZSWkh2SHFuY0kxTEZ0QnRDWW1oQW90M3pTeHE0L1U0RlFXSGZXazhra3Bs?=
 =?utf-8?B?WVEvd3AwaXlMWllIWFNnS3FBWFdhMGhGQTJkMFc5aVYwbzBYa0lIaWllbWdP?=
 =?utf-8?B?VDNWRUdNT2hJNk1MQXdabllDM09FeGYzcDl0bWF0ZjRxWUpablRWdDBPSWsw?=
 =?utf-8?B?RExwazhSNW4rclFPbHVSa3lqeFVGRy9lQWtaVEVLbVhzN0xQWlZqb1l2bDI1?=
 =?utf-8?B?STFYbUNxcndiUGxIbjF6eVI1dGtnRW5GdmEvVXM3bkdEZ200WE9aVmNmbUZ5?=
 =?utf-8?B?Yk1KNmRhWENwN3lJZjVNZU1DcVFvbWlGSlVJaXlPRU5WZzQ2dzk4dFRTemdu?=
 =?utf-8?B?V3BSVVNKcGYxS0RsUmF3ajBQSmpMQVd3Vk9OR3lJQ1RqeGZodnl6MUwxV3la?=
 =?utf-8?B?NmJZZ21YYjZsekZ2alQ3aG1mbXdXSkk2VzRaWHgwTDFGdDliMlNtcXdlQ3dS?=
 =?utf-8?B?TGxSWmNEaFVCeHlNV1Y3L2t2R2lnZHgxWlhDY25NVDBkbmZNcTNta3ZldzVS?=
 =?utf-8?B?cnlmdjNPdGJrb05wL1o3ZnUwRWhYVUlFUFlaajB1VXMxVkFIZTRxeXNhVFIx?=
 =?utf-8?B?emsvRTFDMk1tck10T09WdEFSNDJHbmpHVTZNWmZnT3p4aGhEWkVxVmlzam5k?=
 =?utf-8?B?MHp0Zkg0RTN2OXJQQk5yMVJtSUFCUUFTTktHdGFnRDRwVVFwZldLQ09rQXN1?=
 =?utf-8?B?RzQ1cHRqSlB4RVVpWElhNDVHUVVscXRPQUNjNW1GYWtUZC95UDBsK2lMa2l2?=
 =?utf-8?B?alhEVDFYYmRTdE5rMkVNRWU1czFWbXVDd0kwRzhEVmYzTFBJaFlhTXdwU2My?=
 =?utf-8?B?dXhuM2t2VDFjWmU1NElPK2djNG9wcTZJTC81SWo4YUlhMkpWS1B6REZOVWts?=
 =?utf-8?B?T1R1bUZjUlV1a2FibVJFK2lEVHUrUUlZV2pwaThMVi83T3hrYWtvbnpaRnZ1?=
 =?utf-8?B?Q3FHY2xvdlNMYk80bkYyM3RXSjBWd21BVFgrWnU1NWZGTDZtRDBZaTVOWm1o?=
 =?utf-8?B?dHRKS3dvaWZOQkhLNVlHa1FlMmV2V0VrSXhqd2kxNHE1RGR1RjRhaHdUSWZo?=
 =?utf-8?B?c3Z1OTlTMndLZy91NHUvTEllc2JwckRxUWRkcGUwN1VydVlhUkRPS0c1NElv?=
 =?utf-8?B?L3k3VXpIdDhGaHJLWnNUODlTWSt5Ync2clhIS0QwaEJEbEh1R3JjR0MzajBJ?=
 =?utf-8?B?QnhsdjN4RVdCNHpYd3M4YWNEZHB5QkxEWnpVUCtKU3hBcmZzUmMranFLQjNu?=
 =?utf-8?B?RTRwb1NXcVk2ekc3NkF4SFArRmFBWkZ3Mmp5Z3lNMnVWMzBBNmlpa1lCV0w1?=
 =?utf-8?B?V24zVzh5Q2VOa2dJN1J3bWxlNjZOclNxMDNvTXNSMUxOTEVUUWdsSWRkVzRZ?=
 =?utf-8?B?UjQzckl6cVBJbFV2V3o4WTVNRjkwRUwweEgyU0hpNllzYzRuL0ZOVFdOalhO?=
 =?utf-8?Q?cAMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8139f2-0936-4880-2a60-08dd7688a8d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 10:32:27.6317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4T2754G9wSjQ1eCk1UOKRC5h8El/XQwfyhlDYnqdwE3r9P2PJqezdBz5Zsn2Ji/mtbh8m3uY66oTx+D/RdR0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDI4
LCAyMDI1IDM6MTggUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEB2YXRlcy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXINCj4gUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Ow0KPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAxMi8xNV0geGVuL3g4NjogaW1wbGVtZW50IEVQUCBzdXBwb3J0IGZvciB0aGUgYW1k
LWNwcGMNCj4gZHJpdmVyIGluIGFjdGl2ZSBtb2RlDQo+DQo+IE9uIDI4LjAzLjIwMjUgMDU6MDcs
IFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVz
ZGF5LCBNYXJjaCAyNSwgMjAyNSA2OjQ5IFBNDQo+ID4+DQo+ID4+IE9uIDA2LjAzLjIwMjUgMDk6
MzksIFBlbm55IFpoZW5nIHdyb3RlOg0KPg0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICAv
KiBGb3JjZSB0aGUgZXBwIHZhbHVlIHRvIGJlIHplcm8gZm9yIHBlcmZvcm1hbmNlIHBvbGljeSAq
Lw0KPiA+Pj4gKyAgICAgICAgZXBwID0gQ1BQQ19FTkVSR1lfUEVSRl9NQVhfUEVSRk9STUFOQ0U7
DQo+ID4+PiArICAgICAgICBtaW5fcGVyZiA9IG1heF9wZXJmOw0KPiA+Pj4gKyAgICB9DQo+ID4+
PiArICAgIGVsc2UgaWYgKCBwb2xpY3ktPnBvbGljeSA9PSBDUFVGUkVRX1BPTElDWV9QT1dFUlNB
VkUgKQ0KPiA+Pj4gKyAgICAgICAgLyogRm9yY2UgdGhlIGVwcCB2YWx1ZSB0byBiZSAweGZmIGZv
ciBwb3dlcnNhdmUgcG9saWN5ICovDQo+ID4+PiArICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAg
ICogSWYgc2V0IG1heF9wZXJmID0gbWluX3BlcmYgPSBsb3dlc3RfcGVyZiwgd2UgYXJlIHB1dHRp
bmcNCj4gPj4+ICsgICAgICAgICAqIGNwdSBjb3JlcyBpbiBpZGxlLg0KPiA+Pj4gKyAgICAgICAg
ICovDQo+ID4+DQo+ID4+IE5pdDogU3VjaCB0d28gc3VjY2Vzc2l2ZSBjb21tZW50cyB3YW50IGNv
bWJpbmluZy4gKFNhbWUgbmVhciB0aGUgdG9wDQo+ID4+IG9mIHRoZSBmdW5jdGlvbiwgYXMgSSBu
b3RpY2Ugb25seSBub3cuKQ0KPiA+Pg0KPiA+PiBGdXJ0aGVybW9yZSBJJ20gaW4gdHJvdWJsZSB3
aXRoIGludGVycHJldGluZyB0aGlzIGNvbW1lbnQ6IFRvIG1lICJsb3dlc3QiDQo+ID4+IGRvZXNu
J3QgbWVhbiAiZG9pbmcgbm90aGluZyIgYnV0ICJkb2luZyB0aGluZ3MgYXMgZWZmaWNpZW50bHkg
aW4NCj4gPj4gdGVybXMgb2YgcG93ZXIgdXNlIGFzIHBvc3NpYmxlIi4gSU9XIHRoYXQncyBub3Qg
aWRsZS4gWWV0IHRoZSBjb21tZW50DQo+ID4+IHJlYWRzIGFzIGlmIGl0IHdhcyBtZWFudCB0byBi
ZSBhbiBleHBsYW5hdGlvbiBvZiB3aHkgd2UgY2FuJ3Qgc2V0DQo+ID4+IG1heF9wZXJmIGZyb20g
bWluX3BlcmYgaGVyZS4gVGhhdCBpcywgbm90IG1hdHRlciB3aGF0J3MgbWVhbnQgdG8gYmUNCj4g
Pj4gc2FpZCwgSSB0aGluayB0aGlzIG5lZWRzIHJlLSB3b3JkaW5nIChhbmQgcG9zc2libHkgdXNp
bmcgc3VianVuY3RpdmUgbW9vZCkuDQo+ID4NCj4gPiBIb3cgYWJvdXQ6DQo+ID4gVGhlIGxvd2Vz
dCBub24tbGluZWFyIHBlcmYgaXMgZXF1aXZhbGVudCBhcyBQMiBmcmVxdWVuY3kuIFJlZHVjaW5n
DQo+ID4gcGVyZm9ybWFuY2UgYmVsb3cgdGhpcyBwb2ludCBkb2VzIG5vdCBsZWFkIHRvIHRvdGFs
IGVuZXJneSBzYXZpbmdzIGZvciBhIGdpdmVuDQo+IGNvbXB1dGF0aW9uIChhbHRob3VnaCBpdCBy
ZWR1Y2VzIG1vbWVudGFyeSBwb3dlcikuDQo+ID4gU28gd2UgYXJlIG5vdCBzdWdnZXN0aW5nIHRv
IHNldCBtYXhfcGVyZiBzbWFsbGVyIHRoYW4gbG93ZXN0IG5vbi1saW5lYXIgcGVyZiwgb3INCj4g
ZXZlbiB0aGUgbG93ZXN0IHBlcmYuDQo+DQo+IEluIGFuIGFic3RyYWN0IHdheSBJIHRoaW5rIEkg
Y2FuIGZvbGxvdyB0aGlzLiBJbiB0aGUgY29udGV4dCBvZiB0aGUgY29kZSBiZWluZw0KPiBjb21t
ZW50ZWQsIGhvd2V2ZXIsIEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndCBtYWtlIHNlbnNlIG9mIGl0
LiBNYWluIHBvaW50IGJlaW5nIHRoYXQNCj4gdGhlIGNvZGUgY29tbWVudGVkIGRvZXNuJ3QgdXNl
IGFueSBvZiB0aGUgKl9wZXJmIHZhbHVlcy4gSXQgb25seSBzZXRzIHRoZSAiZXBwIg0KPiBsb2Nh
bCB2YXJpYWJsZS4gTWF5YmUgdGhlIHBvaW50IG9mIHRoZSBjb21tZW50IGlzIHRvIGV4cGxhaW4g
d2h5IG5vbiBvZiB0aGUgKl9wZXJmDQo+IGFyZSB1c2VkIGhlcmUsIGJ1dCBJIGNhbid0IHJlYWQg
dGhpcyBvdXQgb2YgZWl0aGVyIG9mIHRoZSBwcm9wb3NlZCB0ZXh0cy4NCj4NCg0KSSd2ZSBjaGVj
a2VkIHNvbWUgaW50ZXJuYWwgdGVzdCBzdWl0ZXMgZm9yIENQUEMgaW4gd2luZG93cy4gTWF5YmUg
c2V0dGluZyBtYXhfcGVyZiA9IG5vbWluYWxfcGVyZg0KaXMgYSBmYWlyIG9wdGlvbiBmb3IgcG93
ZXJzYXZlIG1vZGUNCg0KPiBKYW4NCg==

