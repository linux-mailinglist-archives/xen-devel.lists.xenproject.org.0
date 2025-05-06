Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E3AABA9A
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 09:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976698.1363856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCCdl-0001VC-J6; Tue, 06 May 2025 07:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976698.1363856; Tue, 06 May 2025 07:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCCdl-0001Sk-Fo; Tue, 06 May 2025 07:22:57 +0000
Received: by outflank-mailman (input) for mailman id 976698;
 Tue, 06 May 2025 07:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc8A=XW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCCdk-0001Se-0Q
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 07:22:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9fd4b3b-2a4a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 09:22:50 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Tue, 6 May 2025 07:22:41 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:22:41 +0000
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
X-Inumbo-ID: e9fd4b3b-2a4a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUCgRnkpOcuaIIZJUYi4u2+Frrz6HtM2IBGUDyV9Gkt/DSi+o5mZvyvhv4Md7dPbV9M6BDqwia4EL07QwqwCLOkwp3WKajn23JhbvivfGltHvfyluTg1XZQ7XH42yR/YXS01d0ZZ3nMZnjVR7p47bfidbgYXcqRdqFRepgw5cMMOMeqpsKzBPTG3o2rf4KNYOoDzo4JVGBwLqRAZpzE3XgBbvUdibH1qJcU1nW2IHxruae1ZwwFcC5/mcgi396QCNP/bTyOEf8GhbOANbTATo9DTf1tO0lM/HVTjqJuVfy3wMKBhzjhyoZYuW4UEX3Ks0CX1uGTxFKlVdhzyeFA5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2+gJ7NxO/tieKwOd+C7kF5sZB2s+VUhGpthCroc7vM=;
 b=kHOe3ZFeijvlU2piLx45J5G8wGG8JM689A7IAfuosGSxvnPbdX+u0fogbgtBwNerlTmkyPPn1IAYR16Jkkjx/J1Lcrz8tY53BFpd+TL4rXOIIoKIVO2uuHg3M7zqKBwb9afMASu0rvzsmSWyuiqZPxNOwDgSf74VIKrtUL19rMsSMbRE5+x7z1lsjYcJr7QdCDY3cOkWNnTWT2xEln4ZdwXSGICeb79+QpPCuGWimLVU94Rjh+HVoBFmuCl1W4haBM04J1jDB0htehWoDA7x8qIxmnwS7R58/R1YJ4j8ESucPjGBcbvCpM6QADPaqD2Z/xev/7ATAGFHCNzij2hzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2+gJ7NxO/tieKwOd+C7kF5sZB2s+VUhGpthCroc7vM=;
 b=nb4whos7Y6oZxx2IENK2NkNVRlRy61VaW126u91/Y8OOMgV5hlRHrDZxZZIrbbq1UnbXqOqjTmUCqpVASzOeScgZZP+AAoJ4mV+dhkYkyVuMZ8Kvoa7lbl+bZFzlj2D3TMKBQ8RAjDeMgt+mdHUUlG/EByYdnRgjNP1EQfSkut4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbrRCjQUXzVZg75kKZW3IeVU/v2LO5SzoAgAv/ooA=
Date: Tue, 6 May 2025 07:22:41 +0000
Message-ID:
 <DM4PR12MB8451CF34EE2A52B8D8A42369E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
In-Reply-To: <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7dfca292-8034-463d-a626-2ab4fbf23c8f;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-06T07:21:59Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB5625:EE_
x-ms-office365-filtering-correlation-id: 95bada94-ab7d-4d19-7f48-08dd8c6ec9ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RzBnaGZjQlFPcXlKRjIzSFo1ekhaQ3RXYmI5T3dZNUtORUtLVjJ4eVZDeitP?=
 =?utf-8?B?T1ZRZ1phRlRkTGhzV0g4MFgxTEc2eHN5Z1NZVXJpWDd6bVBRT1Q4NWxYNVJN?=
 =?utf-8?B?d250MmxkanpXYnhGWEZWeGJROE0wckZCMHdTcXFhNDBZV1VHc1B2K1J5ZEhC?=
 =?utf-8?B?cTVsV3ZXbGo5M3V6dzJOR3ZxWVFwMU9UaSs4VmZ3UG94UkRDamp5SW5lM1Nw?=
 =?utf-8?B?SjVpeTF5UHdQU0drMW10TTVwd2hKOXl3eWhoRW9OZTlrWVpITm1XQnh0MWhG?=
 =?utf-8?B?WDQvQ3F6TzhKSzVyVUxwQ2ZRWHdHaVlXVXh4ejRtSGd0UDZjWWNZL3V0S25x?=
 =?utf-8?B?ZElwbjU5cXVsVm1VQVp5VW5wZFlBTTBoQTU3NzlzWFNhTnFVTkI5aGZ5QlU2?=
 =?utf-8?B?c2dqKzJyN0xCUWJzUFo3Sjgrdlp1VXN5SnpsUXBOa2dhZktTbzFDOVlqY3Iy?=
 =?utf-8?B?dlZ4Y21EMTFNdXJVSkZKbnh2TkM5ZWI5V243MEt2T1VPbDl5RHZNMnovcHow?=
 =?utf-8?B?NXRiV2lkVmpuZlRXTDFTeFVUeGZzdmVyUjlxeUh0MFhVRk5HcjRHUWVGNTlo?=
 =?utf-8?B?MVFOV3dkOXZJNlczZWFCbTNPOVRmMmZEV3J3WWtUNTNvVCt3TW1IYjBmTkVm?=
 =?utf-8?B?ME1xeGQ0VFJsa2JDVndxMkhHYVQzWkRqL3A1L2RUNGxlM08rc0NjY0FDN1BU?=
 =?utf-8?B?Y1QzRnV4d0tWRFloUjBhLzBkOUs2WnBiemF1VE1PaDNsaXpmQi9LaWxWanh1?=
 =?utf-8?B?U0M0alhZcWEzQTRBL3ZaZHlja2pIeGJwNU1sY1ozY2V3UUpnYy9zSzFQUjNv?=
 =?utf-8?B?S2NiMTFpZVJYUURub2NrUnN2V2ZuV0ZiSmd3Qmc2bHVtQnB5MEJvcGFEbHBo?=
 =?utf-8?B?dWlsRDVhNDhZNlgrQXBrb2lYYkVuRnlmd0N6UHZMYlo2a0FXKzRPekVBWUtR?=
 =?utf-8?B?WVNMUmZZaTVhMXB3R282NjJGYS9XaUg3MHA5WnZZSXhtajcrMkVma29BY3Jj?=
 =?utf-8?B?Zll5cDVaMHl4VDlKTmdudVNFZ0FMSllhUytLaklSRTUvZ0t3aFdjSGVkd2tw?=
 =?utf-8?B?Tmt6R3FOaTRKQ0dPTCs0TlhReCtDM1JtTVFEMDJxRkhaMzMwL2VOSXpuR2tX?=
 =?utf-8?B?S2d0NCt1VHYwajZwQkxoZTNzVExtNkkyNUJuSkpEOVRkd0F0QVozTWZCd1Vm?=
 =?utf-8?B?OUF0SkI3Vk1aZGREVi9laDFvY2dEazFTYklNZDk1djZkUDd2V2o4dVlmWDZx?=
 =?utf-8?B?Y0lUVldzaWY5WnZWTnByT1ZacTRMQStRM1d1NFRDNlVCL21wRVcySFNjTklC?=
 =?utf-8?B?eVdTdk1CdGNKMEFYWXdkby9mRVJQTTY4TE5yeVAveWRLREMraTJWWWpqdnc3?=
 =?utf-8?B?b3BaRmtDbHN5bFNMZUhheXRQV0xocHowY0hGS2xMMHdhempnVnRvMmVZTWV0?=
 =?utf-8?B?aGFDYm0yQ1RxRStrbm1BdzJkSHFpV0tmQWowQWVuRWhTMGVXZDIyZ2owWjVp?=
 =?utf-8?B?eFFlTmxld1lGWmlYVFB4Q3dtUTJTRHgraFpVZ0dqaURiQ2FxOVY5Z05oaFNX?=
 =?utf-8?B?UEI2T2ptSFIzM1ZVY1FISkVXeVUwV1kwWnYxT0dVM0x2L3BPUjBERjZ5TUhF?=
 =?utf-8?B?RXU2RGMwRE50WUk1NW0rOGxjbk1QU2d6V0NNMy9YekpEVHZuY3ZsWktaMHZF?=
 =?utf-8?B?ZklDdG00eFk0dXRva1M4NUxJVThEZWNTck96azVYWXJwKzJrVFlnKzEySlU1?=
 =?utf-8?B?N3ZzdzNxQWVta00vODJ1VForNGMvK2p2UmF5VkNQN2loOFRxTi9uTnBGaDYr?=
 =?utf-8?B?emNQQlE5Y1dCSmNOZ3FuUjUxYUVIKzRkbGprd3pWVlVsYVBVMW05UW52Q0xo?=
 =?utf-8?B?NGpSUm40MG8xQUpha2d5NFpmMzhhWW9xUE9UeGNTSDU1ek9SVDc3WndGbmRQ?=
 =?utf-8?B?OUJvUWlibU1iTnJJNnFlZHlGaWtvR0pBbUVPRHdlVko2eVkxbWpPd1NoMXVw?=
 =?utf-8?Q?Eq7JEpDSmzzCbd6zCsk3031TOfgzfo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2xGeW5Dd1JjbzhkZm00VjR0SHd0K0pvbjQ4Ullocm13WFZ2amlJZ1MyV3BY?=
 =?utf-8?B?U21WZkszMm9RZG9WaGJ6QkxIK20rRXNoL0FlUjhOMjhyMXhpcnduQmhUWUlp?=
 =?utf-8?B?VTBPNzF5b3F6VzNLT0UzZ2ZpejdPTm5PRnZEa3c2QkdXYmM0aHkvdVlsRU0w?=
 =?utf-8?B?dVAvK1JJTUlEdVhtNVVwK05qak1OckV2dTRpeUo3K1JmTlRwYmNTRktleSta?=
 =?utf-8?B?STZFc0o1SjhuUnc2Z2tBNUhXM2JkaXZyVFhDL2pTbFErdGdmRGhDOEIwSnhD?=
 =?utf-8?B?bzBrQ21NWTVJYncydUc3QXBBVXNCdysrU1dvSGNnWDJZQXhzOG0rNWROM1FC?=
 =?utf-8?B?SXREUExCcU9JL3hwOUZUUmFNRkZEYUNUNU9xUGtOZWQ5Yi9aN2lCcWY5N3Vs?=
 =?utf-8?B?ck1KaU9SaWN6REVNTEQwMXExQ3Q1YXV5by9uNFJaUXlsblpYOHM1S0hLaGtL?=
 =?utf-8?B?bStRL3VhZVdjWGFhd3FJU0d0QTZOYi9zV0J5bzNCZEE3V3lwZ1hMZThBbXdF?=
 =?utf-8?B?ZnY4ZTFUQUF5cEFrYi9ubThnbEhkWXFZaWFIU0UzMzJtYVBncjVqdU5xT2pW?=
 =?utf-8?B?ZGlJQjFUams5cVNsMy9yT0hHdFlVRkplcitzTGFDZ3JHSEJBVVJ6Y2QvSW9s?=
 =?utf-8?B?R1F6QW80K1FIWXJvT0hkeFlFcGlDTEx4OFRWZW9pZHVLSnQwNEpGclgyTGJM?=
 =?utf-8?B?UFgrTi9rZGhic3k2TzI5akhtUkZVNC9udTltNnRVL3dLb0pTVmlIM0NkSDVt?=
 =?utf-8?B?MjdoMWZWOVNWK01ITGdMMFlKUmVMSXRlRkhnZG43NjRUNzlCMWhaQVlQcFpF?=
 =?utf-8?B?cEpOVFllcXZza0VTek1DTUY3eGJDektMbWJGSGJoZUw0Y052STFVQTFiaUp1?=
 =?utf-8?B?dU1weGV3UmwrSmVsZkY5QzIrN0IxUjcyaklZcW9zalIvRzdUaFNKU2x0U2dE?=
 =?utf-8?B?SERWVlB0Z0lkZ3RGdzQ4QVhaeDVTRkp0V2x0ODFSbnBITXFxcWlMZ0lBYnVm?=
 =?utf-8?B?Y2UyYk1zaEc4Z3IxaG1BQmdQZjRwcndQdmplMFptWklVVXowaWprWnhYWU5H?=
 =?utf-8?B?MXpvZE9uMnRBMHNmUDJ6MlJ3SkN4ZWtTSGtYTjBuenRZNFdpeUZ3bUFmbWlx?=
 =?utf-8?B?eEJLYVRYMmpTb0JJU0pwMDRNT2RMZDVjS0FRNzJIeW1oa0NWVjhCREZHOXla?=
 =?utf-8?B?MjVJWk5GNjB6UkEwMXA3aExJQmtMVlRmd0FneURmNzdXWGZHSVI2b1Q5Mlhn?=
 =?utf-8?B?ZjdZd0N2RlBSMk9PNGJBcjR3aWJ4Z2dnSVJLQSs5d1U3NFFONFFrR1FVcGxp?=
 =?utf-8?B?RjVRc3R2V3Q0NnJiZmN4MnNvdi9TWjdaKzdJNFdiWDBFSzk1SWhxSWd5UFQz?=
 =?utf-8?B?N1I1V1UxQ3pJdlF5dXE0MForYi9WVzZPRHo2QmxVRjQzNUVGRDZrdVNpTVU0?=
 =?utf-8?B?UEtDOG5wUU9DVU9Hd1N2UE83NkdvZFA4alBYVDBDZ24xNEc4VlUvY25WV0dq?=
 =?utf-8?B?TjlwQ2xVTURRV0tmYXFsRENoZmU1Nm1iaGx4Mm4xeGN0akdHYW04aW85Y3Zu?=
 =?utf-8?B?aGp5OUpSeHRJdXNWc2J3VldzL2ZSWXdtaG9mc2lhUHoyYVhYbUVQV2ExOEFv?=
 =?utf-8?B?QUlBOVVwOThrcE1ZK3ozZ0hoL3hoRFlwU3pUNnBUS1hnS1Ftek84aGlKQTRI?=
 =?utf-8?B?Q25FcTQ0bjhudVJVNDhEMVBZL1NOMS9mWnp6NGdwYU9RdEVrNWtQdDZKQ3NR?=
 =?utf-8?B?aXVVQ2tmMzJTMkZQdEUranVPNHp0NlhyWFgzbE5SQ005Umx4SmJObkhqUGZH?=
 =?utf-8?B?RW9uY0o1TThBSThDOVByOFJFd2NPZEZjQkFDNHc0amdOTmNsNlhyTVJjQ2Ur?=
 =?utf-8?B?WGtZYlJEaUpYeHR5UGlNd1NYaEM5V0Y3WENzVUdrdzdiaEdjR0N2eUNFazRN?=
 =?utf-8?B?ZVVIWDZRbTFtUGNvYVpBRlg5VVpaamU0YjY1dmxnNEFxOVpjbmUvWko2ZlE0?=
 =?utf-8?B?WjE1eUxWWThGdFJrODEvbVN4RWpiTVBJQkkrM0Q1a1lzYWIzbmYrYXppdHQ4?=
 =?utf-8?B?WGlWdEphMEx4R3NxSVl5TEIvamRydytLSWZlbWhYZmRONVFCb1UxUVphd3NL?=
 =?utf-8?Q?ZE5A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bada94-ab7d-4d19-7f48-08dd8c6ec9ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 07:22:41.4137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCu4Tf+r5IL5bqumbXXRqqpAchcfRJpGuIdDsYJM5MTEoXHbDJn9jcnJSAkZumuoHy8Ev6MdSA08PDvTzMGAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI4
LCAyMDI1IDExOjMyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDIvMTVdIHhlbi9jcHVmcmVxOiBleHRyYWN0IF9QU0QgaW5mbyBmcm9tICJzdHJ1
Y3QNCj4geGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSINCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0
MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVm
cmVxLmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYw0KPiA+ICsgICAg
ew0KPiA+ICsgICAgY2FzZSBYRU5fUFhfSU5JVDoNCj4gPiArICAgICAgICBpZiAoIHNoYXJlZF90
eXBlICkNCj4gPiArICAgICAgICAgICAgKnNoYXJlZF90eXBlID0gcHJvY2Vzc29yX3BtaW5mb1tj
cHVdLT5wZXJmLnNoYXJlZF90eXBlOw0KPiA+ICsgICAgICAgIGlmICggZG9tYWluX2luZm8gKQ0K
PiA+ICsgICAgICAgICAgICAqZG9tYWluX2luZm8gPSBwcm9jZXNzb3JfcG1pbmZvW2NwdV0tPnBl
cmYuZG9tYWluX2luZm87DQo+DQo+IERvZXMgdGhpcyBuZWVkIHRvIGJlIGEgc3RydWN0dXJlIGNv
cHk/IENhbid0IHlvdSBoYW5kIGJhY2sganVzdCBhIHBvaW50ZXIsIHdpdGggdGhlDQo+IGZ1bmN0
aW9uIHBhcmFtZXRlciBiZWluZyBjb25zdCBzdHJ1Y3QgeGVuX3BzZF9wYWNrYWdlICoqPw0KPg0K
DQpJJ3ZlIGNvbnNpZGVyZWQgaGFuZGluZyBiYWNraW5nIGEgcG9pbnRlciwgdGhlbiBtYXliZSB3
ZSBuZWVkIHRvIGFsbG9jYXRlIHNwYWNlIGZvcg0KInN0cnVjdCB4ZW5fcHNkX3BhY2thZ2UgKipk
b21haW5faW5mbyA9IHh2emFsbG9jKHN0cnVjdCB4ZW5fcHNkX3BhY2thZ2UgKik7IiwgYW5kIFhW
RlJFRSh4eHgpDQppdCBpbiBlYWNoIGV4aXQsIGVzcGVjaWFsbHkgY3B1ZnJlcV9hZGRfY3B1KCkg
aGFzIGEgbG90IGV4aXRzLCB3aGljaCBjb3VsZCBiZSBhIGZldyBjb2RlIGNodXJuLg0KU28gSSBj
aG9zZSB0aGUgc3RydWN0IGNvcHkgdG8gaGF2ZSB0aGUgc21hbGxlc3QgY2hhbmdlLg0KDQo+ID4g
KyAgICAgICAgYnJlYWs7DQo+ID4gKyAgICBkZWZhdWx0Og0KPiBKYW4NCg==

