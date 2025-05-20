Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C7ABD1E7
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 10:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990521.1374458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIKn-0006TW-Lv; Tue, 20 May 2025 08:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990521.1374458; Tue, 20 May 2025 08:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIKn-0006Re-Ie; Tue, 20 May 2025 08:28:25 +0000
Received: by outflank-mailman (input) for mailman id 990521;
 Tue, 20 May 2025 08:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAyu=YE=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHIKl-0006RY-VE
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 08:28:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2415::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63ced086-3554-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 10:28:21 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 08:28:17 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:28:17 +0000
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
X-Inumbo-ID: 63ced086-3554-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL+43X8fD0UMWRkn29+PMfP0DCavQUyulMB8Rs6qLZJP1b3m7vpTHEQGSeDvW2LCIupEuO+5aJgBxMOZn/dNQXq0e7BmGa/V0n9pDFmUPh1xjc0gsa8Yh0zlfdtr/Y/Htr6ykt4rW0aKHQF+R9J5FHx5j4MSUICk4YzsTLtstGNNMil9tkLgPe76P6tEctesZRjfVU1DeJwGEPZ4bhXEnJF6yFsYy68oTdybSusV18xaGl3w9doSiPQyuWdr2AWf4CmfIZ4Yc4XWUatlZckKY7deWHWTxyOsxBX4k6kZZfFIIY/LgsXdn/ZQt4JLiIRm2g2VPOybAfr3+ry+/mRceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSt8KIMbBE9T/BjAVcrNZHKbqoYKvm2QZj7MqZe9Mtc=;
 b=IrWw8Y+S5X9zoW4sm3rbBDZjpD7FisZSBQlH0zSEed+YKF24lvhcwSGrUsMiDzp+V24r0hMLc1Zm1MC2gyCmEdyNvX5TGHCpgkYgj20YNrXm/igqxxY5aExL86ls2FsVu07GINMnn/ULq9znnSA7RtJpYd+LUoFJwNuc0TGjPqTx2TRsOrkXGg0LfDIGyZweLCXStJ4iNgZRw/8h4RhSK+KJS++P3OzsILyH+l84m+40E6V/ZJq4PD1R11aEs9vGGnmYbJsNuqjxCPydaSi6IB/V5w25QAs0rSHnay69Q3twNlQIVx6i6qnYRWn+HlwbwDf4k2hK7uaePEitj0hPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSt8KIMbBE9T/BjAVcrNZHKbqoYKvm2QZj7MqZe9Mtc=;
 b=NLfHu6fmL2rDTUg1diBKexSjGdRF5KUSYys2TG0FyI7xolZvR0NaqSkJIO30IQPSymwKz8RnO0PPCyyb5GvM1Eh8GTVaqS6/sFm7OGN4ZcTPRQ/8/NZqbdu0c93YdFuEM9Ot9N8W9nX2jT/cNRxzgSFtDdmrkqU28ekp8Sf8/XU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbrRCmtZ7pr/knH02upOrsNIOYE7O6sNeAgB8mXDCAAE/jgIABP6gA
Date: Tue, 20 May 2025 08:28:17 +0000
Message-ID:
 <DM4PR12MB8451084DB70D19B5284E1CB8E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
 <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <0f673a09-840c-4319-bec8-62fd920a6b84@suse.com>
In-Reply-To: <0f673a09-840c-4319-bec8-62fd920a6b84@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=b208c07d-842e-4be4-bd2a-6feae91cb225;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-20T08:28:08Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH0PR12MB7983:EE_
x-ms-office365-filtering-correlation-id: a942e9d5-7e14-44d9-55cc-08dd97784555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUNKeTJxM0t2UUhpZ2ZXR2RXTEJ4bGFRR3ZuMm5IejhXazMzN21lLys3SE9U?=
 =?utf-8?B?Q3ZkQ0cxNFIrVzArSzRzblFpNllXRm1ZQmxtT2xWZ1h4N3F2NUJySkNlNGtF?=
 =?utf-8?B?ZHM5SFdWbUNlc2kwOGdpdVhyZDZBbW9BYWhJRXBrQU1sUE5HSGVUdHg3QmZW?=
 =?utf-8?B?cVJkcnBNNzY2b1p2M3ZhekxxZ3JJTFZ0VEZrdDZEaW1vZTc5ZzVSeW5ncS90?=
 =?utf-8?B?UE9kbHR6djN3SDJDU2d2SnNPV29CTVZORW1yQnFPc3V6bGpaREFQakltSjNB?=
 =?utf-8?B?eUkvODhPWUVPZ1krT2tLbExmRDVKYTB3WWJPbW9kVFdjMnJlT1lCem56L1Nj?=
 =?utf-8?B?TGNoZGQ2QzNQbHcyNnMvZGl0cFZvQVZ1RXJDMWw0SG1JaENnekI4WWxhTEFF?=
 =?utf-8?B?ZG4xL05jbEI1MmNrbTlkcy94elptRFVUMmdrRUVtWklwWE1MNjhzRFM3aUdL?=
 =?utf-8?B?azA3RnJwQ1REZFBMNVNlNlo5ZEE3ZDBtZllqdjBwS1dFR1lpbUY5TEFnaFFq?=
 =?utf-8?B?ZmJnSjdXeEU2K2FDNGxxc0dQSTA4WG5ES1BrWkRYdmx3QzVwY21OVXNXdjJ2?=
 =?utf-8?B?UDRlOUVqT1F1K0lsenUwZXc1WmpaSStDY2RYTGpSaVl0NFhxZzFMdnN4K3Vk?=
 =?utf-8?B?TjZ0clphN3czL3NLMENndEdrOGNtdnh3V29Ga05YWDlYVVNjOGpBdUdwdHpB?=
 =?utf-8?B?ajFrMmxCc2VSbVRLOTNDTkkvQzcyNWtaUzFWNytPRUo5WTdoZFF6ZFBlakdi?=
 =?utf-8?B?QUN1OStzVU9TM0hJVmgzeXl0UWl1TVNNc09IN1ErZ2ZJS0Y4MWNibG0vT2ZH?=
 =?utf-8?B?V1BPUy9rQkpmS3Z3c0Mza2JaOEwxcHRGajJ5emhPbjg3THhZK050RklUTkI2?=
 =?utf-8?B?UWVOMG9GRDB2NzUxUlFLSTg2aUtCbVBtZnhtNEZpbk0wNFRRaFR1YnhVaHJN?=
 =?utf-8?B?Rnp4MW9pZmFBL1d6UE0rUFVMNTFoVFY5QkZiNHJ3Vit1RXhoQXNtbkJ0am5R?=
 =?utf-8?B?aHB3WTdQNDRIcnBHS2JFSlNRS3NnUWtkYlB6cTkvYWYyV1gvMnBoeWpQdHM2?=
 =?utf-8?B?TmQvQkQwMG9BUUlrMTFIWThIeHFwSllianVHSUVQWEhjYjJHaVJteERxbDFD?=
 =?utf-8?B?bG84ZmYvcmNjY2xtUDY0aUx2MjlDNFY3ai93R3IvajR0WUxjRHJndnZyZ3ZB?=
 =?utf-8?B?Q1BtRTZET2EyNkYyZ0dUcjlVaWoyZ0FXYU5Ld3lSamw1L0VtR280TEtQM25B?=
 =?utf-8?B?SXNvak9NRjVVNFJZbXR0SHZsTmlaMHhKcVRneUdBRFN5aWZnVm9nTjFFQzQx?=
 =?utf-8?B?MElRbTJtM29KcStNUGVZV0sxUlI4Y0x1SndtM3k0aUJHYzBWY1BQdXFrR01N?=
 =?utf-8?B?NHdNcmU5WEc3ZkxwMmxtY1IyK1MxZHFUY2kwVzdOT1ltVzZtVDZOTm9BTUU4?=
 =?utf-8?B?WVZnNTcyYnM4ZXFJcURnSzBrb1k2MUtwOUt2Qm5GaTY5TTBYOHFWdVdxbDM4?=
 =?utf-8?B?Z3I2RnZrbDBBVVlPWTNSVTRMNHkrRkZtWFUvZGkremZENXlaSkZUTmVXV09q?=
 =?utf-8?B?a3RlYjRscUd3WFBQV1BwNVNZak1RNkwva0tzL3lPYjFNaDdvd1ZWU1ZpdzF1?=
 =?utf-8?B?aytFOHpmeW1mM1pjQVBYV1djekgyUTBYSFUwMVdHY0phM3FleU9iZEwzeDFB?=
 =?utf-8?B?TUQzTE5iRmxURENhV2Z0Ymw0d2p0Q2lwK1JYejlBME1zOHo2dEZiVU5KTzVU?=
 =?utf-8?B?bmhoQ1dMNHlWaS84WEQzZjNmZ0lCOHNONTNBWnFmMm5SMHM1cWY2WlpZdzFH?=
 =?utf-8?B?SStNa2gvbGQwb3ZHQlhwbXVWUkt5ODZZOWRnTVJmUFJVc2crYTJtZ3BrYi96?=
 =?utf-8?B?c29BV3ArZnpZL1VNTnNWU0VBU3E0Rnl6VXFCbXRudlRmUXcwZVFBRTNWZWV5?=
 =?utf-8?B?THVoSG5zOW5FMG81Y1BlRXBKMXZqcWpRYVVCZUZRUXBBMjBpQVJ5MC94NXhl?=
 =?utf-8?Q?jTjRytjiin+IdFJSluMAJpniqk0lYk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVBlTDdqRTNJNjdrSFhJQkRmVnBoYmVOV1Y1L3I3TmhIdUhRdFhSV29sWkto?=
 =?utf-8?B?NzNJcG43K0JFZGdWQUNsQWpJNFhkTGs5QU1JREJTSjRNL2VPMDdhWEw1SVQx?=
 =?utf-8?B?SVE0OGdabElTWm5maGFPVlROTm5QNUFFYldNTDRDL2pMLzdoRzdydGRiaUo2?=
 =?utf-8?B?cjlJTkJ5MlBKYTFmcGM0NmhuSTBwd2xlbXgxWHRIYTZ2M0QrNkprSTBDbzJa?=
 =?utf-8?B?MURyR291K3MrL0pjRHFmUndsYkdkSEFpVnNPOUgrV2YvNWFCclBtSnJFWGdX?=
 =?utf-8?B?dDZVb1pRNjRobzBmQ2NDc2RhY3E5aFBJOGlZL2ZwdW9rUko2OWFSQUhYTjd2?=
 =?utf-8?B?aGl5eURNeU5hN2pXb2NJYjJnRzF0d2NsNU9pUTVlanc3NXU2Y01BOEtGeGpq?=
 =?utf-8?B?N3ZJaXBhUXNMbXlNVWU2cmR1ZUFNVG0yZjhBYXljTG9OZXMvNHVJVEVINUw1?=
 =?utf-8?B?NEZvb200SGhqWk51NEY0bXVHNk1Ta1BMSFlRRENXL2t6cXpRZHF5VUpBcFI3?=
 =?utf-8?B?QjRlT05jRzF6SE50R01ya0VBd1hHVHhSUWhBTm96d3FLVzJaMm5uUnlodll3?=
 =?utf-8?B?dmJIVjlvaTJYK2VDd09iNnJtbU9PNFJHcFVhWkc5OTI2UHZscDBFSG5QQlEr?=
 =?utf-8?B?amllMlU0c3N2TlNxaFI1UHd1NjR6L2s5eU9ZdVlQUjA0NGhjM0lHRzNZa2Uw?=
 =?utf-8?B?ZXdlMmtvbnU3ZmN1OEN5YzRLaUUzSlFvTC8vamcvZkVMTnhLa0R2SEQ2bjJy?=
 =?utf-8?B?V3prMkR3cHBYVDBWcHhoR1VHci9may96RG9MSVNianBVdG5qNDNvTC9zdmRn?=
 =?utf-8?B?ZWlGV2lnWGRWQ1Bqa2hncitWZHl5UFc5L0NYOUFrNFIycVgvNVp5NFB1cWN3?=
 =?utf-8?B?MWtjRjFhTmVxcUZCTkxLcnBTcldLa1BoVCs4RFVFZzdsVHEvWHlKNCs5MVAw?=
 =?utf-8?B?Sy9NUHZhdXRjTjUySWZXQkZ3UWdaWWp6REM0bDcvOENyaHVlRXorTDNYeTQ3?=
 =?utf-8?B?bnlEOGNLU2dKbHNrK2Z2SHlta3UvVjA0L01kZmdMT0dMa3p6cVVxUTBBcnFm?=
 =?utf-8?B?L0k0TnM4NmU2RjUzdFd6UUFaNFROM0JOci9lKzNZajhYbjZrOXpYc3VvWW9V?=
 =?utf-8?B?eDUzV2k2YVJsOFdYWDZxUTlWSE1ENkRRRVNKVEFNOHA1U2FKaXFPNGJ1a1pL?=
 =?utf-8?B?R0RRTnY3a0t1bCtlT1NFTlhKNEgxYkZDQ1FtOTR4NU5tMmp4cEZtMmFNcHBw?=
 =?utf-8?B?M1dPZmVST0Nnd01GOXoxcE9YNERtVVdBMXdxUm5uLzZKOWMwbFBCYTA5dDQ0?=
 =?utf-8?B?c3ZuYlBCWHBPMmpuMVo2Ui9hQlRWWCs5RWx1eWoyMS9aZzFjWFlRRmhQa25B?=
 =?utf-8?B?UldnMHo4WDEweUF1NzZucEgvOGlqZnA4ZGNhZi85T1JBenJVaVk4RWdMb0Ev?=
 =?utf-8?B?ajhDWjJMSzBZbkcvdFlRVVBIRmdIZnJwd1BtRm8xejgwRFBaVlV4SXJiQlpx?=
 =?utf-8?B?czRCWmhuczVSaHY0WElwTWtLTFZ4QS9OakdrOUNGVGs2L1lkN0NHUVgvb2pO?=
 =?utf-8?B?cFc2bmJNUTdSazllRFVpWmpVNGFQbGhqL0lmNWVteHBrQUlORjBBS1NzNkNB?=
 =?utf-8?B?KzdqTWU1eDhENFc3QW81SGd5Z2lDT1A1MjdoOEpWNUx5SGtxa1REUEpDWlFi?=
 =?utf-8?B?bmVEL3lTOGRqWFZ4dllKSndKSVV4ZkpLeEtoUHZJSUNOOVQxc2RTVGp5anN2?=
 =?utf-8?B?eWlJRmluK0MwYlRCWHduWWpxaVZRemEwamxCVS9ZWUY4cks3VmkwUy9PZEFx?=
 =?utf-8?B?blNpYksrSWhkb3hiblp5MVVEdHZxdFdhMEJ2clhrWUtLQ2Z2MzQ2Z0tzcGd3?=
 =?utf-8?B?UmFiQ1F0N2llV2JKOW5OamgrVVluN05wK2JwRjdrdnpGeUZSakZITUpDeTBz?=
 =?utf-8?B?WFdMSXdkT3R6Wlk0TitaRjlrNXNCeGFHWkFMbUNXaFJPQ2FuRGlxbXE1WnBF?=
 =?utf-8?B?bXVzYnZ1bjdyTUZWOWhhZ1hXcUhiOHZibWUrS20ybkhjSVJQVmI4UVBDcURC?=
 =?utf-8?B?MlBSQ25iQ2tUOTN6K2dlNklrR05jVFd4V2hiNmY1YjZXOXQ4QmNSTE9GMzc4?=
 =?utf-8?Q?XkdU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a942e9d5-7e14-44d9-55cc-08dd97784555
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:28:17.1483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THujjlxypwMdp/JoLmW1QeSxw6xcMUngx1coMSKZyvyHknPzxvyQwvsvUz5xEeXLX9eCj20CNFBqsABT7Iw7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDE5LCAyMDI1IDk6
MTkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IEh1
YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50
ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQg
MDUvMTVdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVuDQo+IGNtZGxp
bmUNCj4NCj4gT24gMTkuMDUuMjAyNSAxMDozNiwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+IFtQ
dWJsaWNdDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBBcHJp
bCAyOSwgMjAyNSA4OjUyIFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFt
ZC5jb20+DQo+ID4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRA0K
PiA+PiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5P
cnplbEBhbWQuY29tPjsNCj4gPj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2Vy
IFBhdSBNb25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gPj4geGVuLSBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA1LzE1XSB4ZW4veDg2OiBp
bnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiDQo+ID4+IHhlbiBjbWRsaW5lDQo+ID4+DQo+ID4+
IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvYWNwaS9jcHVmcmVxL3Byb2Nlc3Nvcl9wZXJmLmgNCj4gPj4+ICsrKyBiL3hlbi9p
bmNsdWRlL2FjcGkvY3B1ZnJlcS9wcm9jZXNzb3JfcGVyZi5oDQo+ID4+PiBAQCAtNSw2ICs1LDkg
QEANCj4gPj4+ICAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPg0KPiA+Pj4gICNpbmNsdWRlIDx4
ZW4vYWNwaS5oPg0KPiA+Pj4NCj4gPj4+ICsvKiBhYmlsaXR5IGJpdHMgKi8NCj4gPj4+ICsjZGVm
aW5lIFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyAgIDgNCj4gPj4NCj4gPj4gVGhpcyBuZWVkcyBjb3Jy
ZWxhdGluZyAoYXQgbGVhc3QgdmlhIGNvbW1lbnRhcnksIGJldHRlciBieSBidWlsZC10aW1lDQo+
ID4+IGNoZWNraW5nKSB3aXRoIHRoZSBvdGhlciBYRU5fUFJPQ0VTU09SX1BNXyogdmFsdWVzLiBP
dGhlcndpc2UNCj4gc29tZW9uZQ0KPiA+PiBhZGRpbmcgYSBuZXcgI2RlZmluZSBpbiB0aGUgcHVi
bGljIGhlYWRlciBtYXkgbm90IChlYXNpbHkpIG5vdGljZSBhDQo+ID4+IHBvc3NpYmxlIGNvbmZs
aWN0LiBXaXRoIHRoYXQgaW4gbWluZCBJIGFsc28gcXVlc3Rpb24gd2hldGhlciA4IGlzDQo+ID4+
IGFjdHVhbGx5IGEgZ29vZCBjaG9pY2U6IFRoYXQncyB0aGUgb2J2aW91cyBuZXh0IHZhbHVlIHRv
IHVzZSBpbiB0aGUNCj4gPj4gcHVibGljIGludGVyZmFjZS4gU0lGX1BNX01BU0sgaXMgOCBiaXRz
IHdpZGUsIHNvIGEgc2Vuc2libGUgdmFsdWUgdG8gdXNlIGhlcmUNCj4gd291bGQgYnkgZS5nLiAw
eDEwMC4NCj4gPj4NCj4gPg0KPiA+IEkndmUgYWRkZWQgYSBwdWJsaWMgZmxhZyBhbmNob3IgIlhF
Tl9QUk9DRVNTT1JfUE1fUFVCTElDX0VORCIgaW4NCj4gcHVibGljIGhlYWRlcjoNCj4gPiAgICAg
ICAgICAjZGVmaW5lIFhFTl9QUk9DRVNTT1JfUE1fUFVCTElDX0VORA0KPiBYRU5fUFJPQ0VTU09S
X1BNX1RYDQo+ID4gYW5kIHdpbGwgZG8gdGhlIGZvbGxvd2luZyBidWlsZC10aW1lIGNoZWNraW5n
Og0KPiA+ICAgICAgICAgQlVJTERfQlVHX09OKFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyA8PQ0KPiA+
IFhFTl9QUk9DRVNTT1JfUE1fUFVCTElDX0VORCk7DQo+DQo+IEkgZG9uJ3QgcmVhbGx5IHNlZSB3
aHkgYW55dGhpbmcgd291bGQgbmVlZCB0byBiZSBhZGRlZCB0byB0aGUgcHVibGljIGhlYWRlciAo
YW5kIHdlDQo+IHJlYWxseSBzaG91bGQgc3RyaXZlIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGFkZGl0
aW9ucykuDQoNCklmIEkgcHV0IHN1Y2ggZGVmaW5pdGlvbg0KIiNkZWZpbmUgWEVOX1BST0NFU1NP
Ul9QTV9QVUJMSUNfRU5EIFhFTl9QUk9DRVNTT1JfUE1fVFgiDQppbiBpbnRlcm5hbCBoZWFkZXIs
IEknbSBhZnJhaWQgaXQgd29uJ3QgYmUgdXBkYXRlZCBpZiBuZXcgb25lcyBhZGRlZCBpbiB0aGUg
cHVibGljIGluIHRoZSBmdXR1cmUuDQpPciBhbnkgb3RoZXIgc3VnZ2VzdGlvbnMgdG8gcHJvdmlk
ZSBidWlsZC10aW1lIGNoZWNraW5nPw0KDQo+DQo+IEphbg0K

