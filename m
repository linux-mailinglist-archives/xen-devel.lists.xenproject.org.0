Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C951EAE778C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 08:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024339.1400230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUJzD-0007LF-D0; Wed, 25 Jun 2025 06:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024339.1400230; Wed, 25 Jun 2025 06:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUJzD-0007J6-9r; Wed, 25 Jun 2025 06:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1024339;
 Wed, 25 Jun 2025 06:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUJzA-0007J0-Tp
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 06:51:57 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:2408::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e102ca71-5190-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 08:51:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 06:51:50 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 06:51:50 +0000
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
X-Inumbo-ID: e102ca71-5190-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRmWqjGqvAIMuqVR2//gN7Jt50Reu5y18b27JbAS18AUScjsheGsc2sXwH7yFPLchFIWGkKqNu5jamjMnBgVN/Lo9w94wQH6mYnhnCUvO8S36MGLjjPen2YdQU1Cz7ET1BftCMzD1AH2KUw3gjQughC2YcKiGVf9u4a4abUEsn46e5xGPVTqxMAsOmDoZwh8vUvjXL7G6BOn+M2yztUkhbQfdaJcYp66T2hhimXA1Nt/2lCdM2Vby4rAztq66gHvP04YIpXxNpFelg9K1ZJ/RTd2d8one8VHB93zP2y7EVaPJyePVdULn/gU7MnvKIJA/bFuJfNRHL+s4vvRe38EDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsuGD6OSWKpBAf6O5TS+39FWcvIRYURXGfkHs+ayxx4=;
 b=HUtj16t1jeg+jUO0x7GVYOE0BEcGmGkGE1/dcTfDJBNzLJTq2CsgP7xdVQtnNibqNJpdNJrUHr0m/LIGFdG/RY4qTLeBHEifRunsycoomaxJc2ATDa0gLH/S4jrhZN5Ui+ydRRXDaI3kX4L8uAtYLDD6jhU+JZNeSH8zMasam2VeA+1slmjTfgEbA2Qf+n2+abUmT2RriiL1NU9FO59m8rRWv2Gp2YF50tctzybT8ga8n9RY7djM8Z60MpAC5PYPWjPqEMYlxvkxPBVWuyfgsVj2ssiUaPwOj+caHu6Tc7Sa2Z9CuLxb2nggdGGJgts7XP65j2sfAHLRm5MDi2QxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsuGD6OSWKpBAf6O5TS+39FWcvIRYURXGfkHs+ayxx4=;
 b=pW3A0fEz0zYW1dquKDFztDxrVjFVe8Hw8YjxOQVQzjZuO+CPkClUhnc+gVy3apwBs1zoWZ5hxyqvRdD2ifbLi7HwOzNZrJR6CHl5W0QeImn+7uiQJrq3PcoTFS2HpqRxktXAFqbwHa+hZ/MpJiE3/O37I9ezcWKnHZAU5Q/KPqA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4A=
Date: Wed, 25 Jun 2025 06:51:50 +0000
Message-ID:
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
In-Reply-To: <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB7223:EE_
x-ms-office365-filtering-correlation-id: c5e6e4fb-3133-412a-61ba-08ddb3b4c308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHRPa0RyRmtPYkhObzRhdGJsZCt0TFNzeU9KWUFpRmZBWXBzWHNGTjNWcW5x?=
 =?utf-8?B?MDN4bnE2QVFCZmhJblI3d0hSNm9VSXFFVzQyZktkTjllK3kzUjJ5OTZGQXBQ?=
 =?utf-8?B?cjhBSXo3NlRiQmdjL05oWkZzemlDMlh4TGJtMjJJQ0s2L2JEUzVzaHRzT0dG?=
 =?utf-8?B?OUZteXdWWm01NENyeEZRUWl2bXk5MkJPWUtOc1NiTmdWamNwZE5RdTcweWhS?=
 =?utf-8?B?WWpmWGxCWXBnSEI2WGpMa1Bmdi8wblM2RHhvYjlXRzlZNFpiUXd5dERRNDF3?=
 =?utf-8?B?bXhxVENPR09paXRBK0QrOW1UWXdOcXhYK3NraWZYRWZTTU9uQi9oUS96SXZ1?=
 =?utf-8?B?V01IR2JYanMvdGVNZkE4WjlhNndlMkxXWEF0MVZWSjJwSytxYWJvYUxZUjRQ?=
 =?utf-8?B?WXZyNDNXSG1ESDRQbFB2U1BpN0FueUVwUmNrczNMUmRxMlJkMTJMMHBwV25E?=
 =?utf-8?B?SXFyaEUySFpyRStzN3ovTy8vdk5EU2hoME5rNElpQzNuQ3EvMERwZ3FvTDQ5?=
 =?utf-8?B?SlJXdkpwaXdUVlFyZnh3Ymg2alBpUVF4aG1nWlNjQm5YVUU1OW55TDc0bFhV?=
 =?utf-8?B?amVyeDdxZklkV1FmYnhtL282SXZFSWJTT3p5SFV3bjMwYm9XdGZCSVd2Mnhn?=
 =?utf-8?B?aExDOUdObHlqcEhlVmNZVWdxZ1cvN2NEeVlPZ0ZCRUR3aE1zTUIvdEZja0FT?=
 =?utf-8?B?Unk1QnZGZ0JaQ09ybC91VVBWRWJJa2JhL2pPb2NFVGxWYjBhVzR4RWhQNzdz?=
 =?utf-8?B?Y1RVeU0xcTZBaWZyV2N3dW5hTmJHeCthQ1FhZERDSVV0Y201dm94SDUzYzFt?=
 =?utf-8?B?R1JSMkUrSTdzNGFUUHk0dWYra3JRdWQ5NGdoY1hiRnE4cy93TXdCSUhBcFls?=
 =?utf-8?B?emFoTUxObXVUSXRWVEM3M0U4bmZTMDQ2QTF6Rng3cGMwSm1vaFBXS0hqRGpU?=
 =?utf-8?B?d2k3Wk0xY3VwTzl5cmpFSmZ6ZlpuczZBemtNdkcvdHcwekgyQzFkWDZ3eWdt?=
 =?utf-8?B?dWRUa21aMU9JTVRVR283OFZtcnFvV1Rja3B0Q0FkZU90ODFJc2FyTFE2d2h1?=
 =?utf-8?B?WTVrODVxRnlodnE4cVdkYzAyUG15bDJaNEk4b01ycGpzYm9XWWZIRzBFeG5s?=
 =?utf-8?B?WUFJWE00V1dvSWhoViszL0dOTCtFdzRRZVpMTzZrSkkyaW5QTEVraFlWNUNK?=
 =?utf-8?B?YURuS3UxM3dGUWp0T3VpZk9Yc01oa25OallwNEpnZnQ3Y05uWUJSN0tkVk5x?=
 =?utf-8?B?UGJ1a0JSK1d3aWxKcHAvbWxxWEFVdVhmVlczdmlGOGR3aTJYQVkwbWw0ZHVh?=
 =?utf-8?B?MDdMVjEreDQ0VzdVR0twcFk5YTluK1dOejFHeEZpdCtXVmt1Q3BoN0ttbDdZ?=
 =?utf-8?B?ZjF4Mi8xM1gwSXpiK2tOR1lYUEtidDQ3UjdiTlNWNVN5YWVabHVUUzY0K0E5?=
 =?utf-8?B?TndqdjN0bXVQdjZnUkpyMmlJdUdpQlhudEVGeFdJQTVkbnlyd2hmcWdmV2RZ?=
 =?utf-8?B?RXlob2VtSzNiVXE0S0hucmFWeG83Z2h2UUd1dEpmMlRKRCs0ZkU1dnhlU2M3?=
 =?utf-8?B?dTgrOUx1VHZBV0ZUMzJpUlRoVUFUZEVBTHJrNjJuUlZlTEdETkFBMVlEQ2VT?=
 =?utf-8?B?SnR1UmdWa3R4QllBYlVrcHlCSkh3NmtTV3E0REFSNkpPN3dlK1Q3d1JUWnNu?=
 =?utf-8?B?b1FHWVhVckFBK3oxaC9BdVZpS3loeE1qUnRmY3FWelpxWFo3dHlVbGNlOFpM?=
 =?utf-8?B?azVTUFk4NFRYdjVseEdCT3Vxd0cyTURoVkpMWEQ1NElsWEJGNGpUY1F6b0NZ?=
 =?utf-8?B?T3ZIS0RjOFpEU3lXN3dFRHE4ZjlaeXFLQWorbEt4dlJyRDNnWmZuT0o3eEFH?=
 =?utf-8?B?bmJGeG1sVFRwMXBVUVBpb2xNOEV5U2NCRm5KMUw5QmlucDM5SEt4K3pqTzFq?=
 =?utf-8?B?MVhHdWcwb250elk1UHBnRHEwKy9FT25lcjJkVXUwV1lxcHVpc2JxaE5zWlNa?=
 =?utf-8?Q?6PD+l4X4gkLickiXhYl7qQO5MDPr8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0QzR1ZSUW0wSWlBVW43UnZkV2hIdnF3OU1tRHJzWWt6NGZneXhQNHIzSDBa?=
 =?utf-8?B?amxZSDg1bFc3SFZ3RjBwbWlaZlZuNjRRNUdONmd5cGVPckVBS21mdlpLZWNP?=
 =?utf-8?B?MnJRcVNvZkdVWnplZkJyU1JDTHBMVlhRZkl5SGwxRUVCM1hmS1RMdW94d0Vo?=
 =?utf-8?B?aWlab1ZEUWV2TEcwUVlKTEdtbFF4cHF4c1F5SWhvbnFnVlJZem1LSy9Yd0xP?=
 =?utf-8?B?YmtiUHFZYkNPNEtHSnY0Qm5KYy9GUTN1dm4rQmpDTFYyZmk1SlpiL3k4V05a?=
 =?utf-8?B?NkJlQ0hHTzFBVVNJb0ZxTlpzd1dzcGZYUTZ4TkhmTG1zdEhSSEF2Yy9PSnZw?=
 =?utf-8?B?RGVUQjNNeUowakZxTWRPZ21Cc2Q0NHJkM2ptbkU1L2lwZk9rRnIwWGRZYkRC?=
 =?utf-8?B?UEM3RGxWdys2K0hxUGF2RTNiMlNRWDdzTDY2bUFwNUorWWFCOHhib0l5enNN?=
 =?utf-8?B?eC8vVjdXYlNjTTcvTjRsZ1p2b2RRbXhBOWxIaDhCQjRPNFRmZEMvbVZLM01L?=
 =?utf-8?B?TVo0SHhwWGpqZDYyaDhadmpvSlptekFmOVg1bk1VWklTNzJ5ckp0S0Z2Nm5Y?=
 =?utf-8?B?bzExREw1MTNJYzJZbEdLTkRBcEFpN0NubHplTzNaZlZLd3BNQ0ZiT05WaGkx?=
 =?utf-8?B?eTRZSFJvYUpWaDVUR0pkWEJIRy80NGpVNE8wVnZ2RGJkUy9MR29NT1VDSitM?=
 =?utf-8?B?NCtlejdGN1RGU2oybFZMcUhYWElITWk1aS80d0pUY3BkeFFDQ0t1UFhXT3Fp?=
 =?utf-8?B?bUJTaVpIazl1VHJwK1hqd25QM1cvNnZnVm5HYVo2T0pvRDdidGIyeUs4WlZr?=
 =?utf-8?B?ZFhmNFhsRWY2SG5tVU1wTkFmZnQ2Mk52MlZSZDJyY0VOS1ZJT28yN3BqL3I5?=
 =?utf-8?B?Y2JONUZreXpCOUdHTE93WHJVdU9GcXc5cUM0cHR3b005RmN2bnhmRFdGSGVv?=
 =?utf-8?B?TGdvbmdGNEIvK0hCdnlScS9rSk9NUmZtZWFuQ2hTQ2YrcDJVR2ZkWTlzSk03?=
 =?utf-8?B?dm5mQ1dYWGg5TERRa2VOdzdQSkorM0gybkhaSEkwMUYvTWJUYmp5YWlaOHN3?=
 =?utf-8?B?QjBEcXN1d2dQUllVcUNyLzFPK2R1ZEJEU2tSR3ExL0RmK0hFaDk1bXZwcWZv?=
 =?utf-8?B?L21NekRTMHdMblZHY2xiTjcxMUNrVlZsTzI5MHJLdk45ekxGcUs2dUZMK3B6?=
 =?utf-8?B?c3hEdXR1UDZCRHU3dVBpTDNjNkVMUE83NVRYZlQ2R040MFVFNC9PcHlrUGYw?=
 =?utf-8?B?L3V4bWtqSTJBNmNUNktLSndOSHl6aEZUeFB1ZUM1elppejFFOFNwVFlWWGYr?=
 =?utf-8?B?YlB4U2hGYlRFZmhTYmlWSTAzYzJUR1FEeHV5dXZuWVI0YSt3SUN4UVA1a24r?=
 =?utf-8?B?SDl2U045NlhJL0lFVTEwdXhMcXRzL2ZWWE5uV25OUld1eXJ0TGhEcTI4WmFv?=
 =?utf-8?B?cFRXeC9VVldUWlBLd1NWLzlJNVROMFBCYWFVWGErWTcxY2FGUk9MVGNIMndR?=
 =?utf-8?B?a0paR3JZdmxSbmdWYzZublJyVm5TUjJ4aWNuTkZUbWRUM2dUQzI2bUFXMjdt?=
 =?utf-8?B?MXpvWnNkMXlOa1pGbXNCZnllcCtBVHYxbkpwZTVOU04vY3pna3J4eU54b1FF?=
 =?utf-8?B?YkJjeThuNUpGZVFuZC9ISkx4djdsSHRCY1FEWldzVG90WUcxNEJ3N0tSZ2to?=
 =?utf-8?B?MTc2eDJvRFAzYzk1Z2xOdGtON0laOHF4WnRIZjc1RWUyTWMzc3lvMlQ4Vjcr?=
 =?utf-8?B?WVg5SEl1V0tOYUM2cXo1Sk04V24vQzNadTV1aGljL2hTcXU1RW0xMTNzU004?=
 =?utf-8?B?eHVzVUJzNWJXN1l6VEJQekJTSVh2V0x6OTZJVHk1SEVRZWFpWXM1QzkxMXlp?=
 =?utf-8?B?YW82VGhHQjR6eTRHWlpDMXVlNGNkOFB5UEdvVVByMWNaUVZKMG1vTVhncEZF?=
 =?utf-8?B?Z3pHQW5mTS9mTTBWRnA4NzBmSzVkL1JmZzJtdU9EeDBRL3ErRXdCYVU1bVFa?=
 =?utf-8?B?SjR4YlB4TlhJd0k2YXBZSk9HeUtBenFSZVRkTGlzeXZFWVptS2NpWUpIWnND?=
 =?utf-8?B?Mmo2NEhjZko1dEczSThFYUpvVWdUMTE3UkRrcW5sVlY4a2J1elJhMS9jM2pn?=
 =?utf-8?Q?NgNY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45C8088827DCB94782F4B4671AFB4064@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e6e4fb-3133-412a-61ba-08ddb3b4c308
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 06:51:50.3700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwHaSggVWQGLJtRM5U40jd2B1JY3RKTJoHv5KtWKi/1x1FGaTEDLYnBI2HCGyLug984zJf3fEv12AYeETEqwdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223

T24gMjAyNS82LzI0IDE4OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MToyOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI0IDE2OjA1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wNi4yMDI1IDEwOjAyLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yMCAxNDozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
OS4wNi4yMDI1IDA4OjM5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzE4
IDIyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTIuMDYuMjAyNSAxMToyOSwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiBAQCAtMjksOSArMzAsMjIgQEAgdHlwZWRlZiBp
bnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+Pj4+PiAg
ICovDQo+Pj4+Pj4+PiAgI2RlZmluZSBWUENJX01BWF9WSVJUX0RFViAgICAgICAoUENJX1NMT1Qo
fjApICsgMSkNCj4+Pj4+Pj4+ICANCj4+Pj4+Pj4+IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5J
VCh4LCBwKSAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4+PiAtICBzdGF0aWMgdnBjaV9yZWdpc3Rl
cl9pbml0X3QgKmNvbnN0IHgjI19lbnRyeSAgXA0KPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIF9f
dXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIgcCkgPSAoeCkNCj4+Pj4+Pj4+ICsjZGVmaW5lIFJF
R0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+Pj4+
Pj4gKyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgZmluaXQjI190ID0geyBcDQo+
Pj4+Pj4+PiArICAgICAgICAuaWQgPSAoY2FwKSwgXA0KPj4+Pj4+Pj4gKyAgICAgICAgLmluaXQg
PSAoZmluaXQpLCBcDQo+Pj4+Pj4+PiArICAgICAgICAuY2xlYW51cCA9IChmY2xlYW4pLCBcDQo+
Pj4+Pj4+PiArICAgICAgICAuaXNfZXh0ID0gKGV4dCksIFwNCj4+Pj4+Pj4+ICsgICAgfTsgXA0K
Pj4+Pj4+Pj4gKyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0
IyNfZW50cnkgIFwNCj4+Pj4+Pj4+ICsgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5yZWwu
cm8udnBjaSIpID0gJmZpbml0IyNfdA0KPj4+Pj4+Pg0KPj4+Pj4+PiBDb3VsZCB5b3UgcmVtaW5k
IG1lIHdoeSB0aGUgZXh0cmEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24gaXMgbmVjZXNzYXJ5IGhlcmU/
DQo+Pj4+Pj4+IFRoYXQgaXMsIHdoeSBjYW4ndCAuZGF0YS5yZWwucm8udnBjaSBiZSBhbiBhcnJh
eSBvZiB2cGNpX2NhcGFiaWxpdHlfdD8NCj4+Pj4+PiBZb3UgbWVhbiBJIHNob3VsZCBjaGFuZ2Ug
dG8gYmU6DQo+Pj4+Pj4gI2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkoY2FwLCBmaW5p
dCwgZmNsZWFuLCBleHQpIFwNCj4+Pj4+PiAgICAgc3RhdGljIGNvbnN0IHZwY2lfY2FwYWJpbGl0
eV90IGZpbml0IyNfdCBcDQo+Pj4+Pj4gICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEucmVs
LnJvLnZwY2kiKSA9IHsgXA0KPj4+Pj4+ICAgICAgICAgLmlkID0gKGNhcCksIFwNCj4+Pj4+PiAg
ICAgICAgIC5pbml0ID0gKGZpbml0KSwgXA0KPj4+Pj4+ICAgICAgICAgLmNsZWFudXAgPSAoZmNs
ZWFuKSwgXA0KPj4+Pj4+ICAgICAgICAgLmlzX2V4dCA9IChleHQpLCBcDQo+Pj4+Pj4gICAgIH0N
Cj4+Pj4+Pg0KPj4+Pj4+IFJpZ2h0Pw0KPj4+Pj4NCj4+Pj4+IFllcywgc3ViamVjdCB0byB0aGUg
ZWFybGllciBjb21tZW50cyBvbiB0aGUgaWRlbnRpZmllciBjaG9pY2UuDQo+Pj4+IEdvdCBpdC4N
Cj4+Pj4gT25lIG1vcmUgcXVlc3Rpb24sIGlmIGNoYW5nZSB0byBiZSB0aGF0LCB0aGVuIGhvdyBz
aG91bGQgSSBtb2RpZnkgdGhlIGRlZmluaXRpb24gb2YgVlBDSV9BUlJBWT8NCj4+Pj4gSXMgUE9J
TlRFUl9BTElHTiBzdGlsbCByaWdodD8NCj4+Pg0KPj4+IFllcy4gVGhlIHN0cnVjdCBkb2Vzbid0
IHJlcXVpcmUgYmlnZ2VyIGFsaWdubWVudCBhZmFpY3MuIChJbiBmYWN0IGluIHByaW5jaXBsZQ0K
Pj4+IG5vIGFsaWdubWVudCBzaG91bGQgbmVlZCBzcGVjaWZ5aW5nIHRoZXJlLCBleGNlcHQgdGhh
dCB0aGlzIHdvdWxkIHJlcXVpcmUNCj4+PiBrZWVwaW5nIHRoZSBzZWN0aW9uIHNlcGFyYXRlIGlu
IHRoZSBmaW5hbCBpbWFnZS4gV2hpY2ggSSBkb24ndCB0aGluayB3ZSB3YW50LikNCj4+Pg0KPj4+
PiBTaW5jZSBJIGVuY291bnRlcmVkIGVycm9ycyB0aGF0IHRoZSB2YWx1ZXMgb2YgX19zdGFydF92
cGNpX2FycmF5IGFyZSBub3QgcmlnaHQgd2hlbiBJIHVzZSB0aGVtIGluIHZwY2lfaW5pdF9jYXBh
YmlsaXRpZXMoKS4NCj4+Pg0KPj4+IERldGFpbHMgcGxlYXNlLg0KPj4gQWZ0ZXIgY2hhbmdpbmcg
X19zdGFydF92cGNpX2FycmF5IHRvIGJlIHZwY2lfY2FwYWJpbGl0eV90IGFycmF5LCBjb2RlcyB3
aWxsIGJlIChtYXliZSBJIG1vZGlmaWVkIHdyb25nIHNvbWV3aGVyZSk6DQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMN
Cj4+IGluZGV4IGM1MWJiYjhhYmIxOS4uOWYyZjQzOGI0ZmRkIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+
PiBAQCAtMzYsOCArMzYsOCBAQCBzdHJ1Y3QgdnBjaV9yZWdpc3RlciB7DQo+PiAgfTsNCj4+DQo+
PiAgI2lmZGVmIF9fWEVOX18NCj4+IC1leHRlcm4gY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNv
bnN0IF9fc3RhcnRfdnBjaV9hcnJheVtdOw0KPj4gLWV4dGVybiBjb25zdCB2cGNpX2NhcGFiaWxp
dHlfdCAqY29uc3QgX19lbmRfdnBjaV9hcnJheVtdOw0KPj4gK2V4dGVybiB2cGNpX2NhcGFiaWxp
dHlfdCBfX3N0YXJ0X3ZwY2lfYXJyYXlbXTsNCj4+ICtleHRlcm4gdnBjaV9jYXBhYmlsaXR5X3Qg
X19lbmRfdnBjaV9hcnJheVtdOw0KPiANCj4gSnVzdCBmeWk6IFlvdSBsb3N0IGNvbnN0IGhlcmUu
DQo+IA0KPj4gQEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmls
aXRpZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgew0KPj4gICAgICBmb3IgKCB1bnNpZ25l
ZCBpbnQgaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KPj4gICAgICB7DQo+PiAtICAg
ICAgICBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY2FwYWJpbGl0eSA9IF9fc3RhcnRfdnBjaV9h
cnJheVtpXTsNCj4+ICsgICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmlsaXR5
ID0gJl9fc3RhcnRfdnBjaV9hcnJheVtpXTsNCj4+ICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCBjYXAgPSBjYXBhYmlsaXR5LT5pZDsNCj4+ICAgICAgICAgIGNvbnN0IGJvb2wgaXNfZXh0ID0g
Y2FwYWJpbGl0eS0+aXNfZXh0Ow0KPj4gICAgICAgICAgaW50IHJjOw0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBpbmRl
eCBmNGVjMWMyNTkyMmQuLjc3NzUwZGQ0MTMxYSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+IEBAIC0zMSwx
NCArMzEsMTMgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPj4gICNkZWZpbmUgVlBDSV9NQVhfVklSVF9E
RVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+Pg0KPj4gICNkZWZpbmUgUkVHSVNURVJfVlBD
SV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBcDQo+PiAtICAgIHN0YXRpYyBj
b25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgPSB7IFwNCj4+ICsgICAgc3RhdGljIHZw
Y2lfY2FwYWJpbGl0eV90IGZpbml0IyNfZW50cnkgXA0KPj4gKyAgICAgICAgX191c2VkX3NlY3Rp
b24oIi5kYXRhLnJlbC5yby52cGNpIikgPSB7IFwNCj4+ICAgICAgICAgIC5pZCA9IChjYXApLCBc
DQo+PiAgICAgICAgICAuaW5pdCA9IChmaW5pdCksIFwNCj4+ICAgICAgICAgIC5jbGVhbnVwID0g
KGZjbGVhbiksIFwNCj4+ICAgICAgICAgIC5pc19leHQgPSAoZXh0KSwgXA0KPj4gLSAgICB9OyBc
DQo+PiAtICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgZmluaXQjI19l
bnRyeSAgXA0KPj4gLSAgICAgICAgX191c2VkX3NlY3Rpb24oIi5kYXRhLnJlbC5yby52cGNpIikg
PSAmZmluaXQjI190DQo+PiArICAgIH0NCj4+DQo+PiAgI2RlZmluZSBSRUdJU1RFUl9WUENJX0NB
UChjYXAsIGZpbml0LCBmY2xlYW4pIFwNCj4+ICAgICAgUkVHSVNURVJfVlBDSV9DQVBBQklMSVRZ
KGNhcCwgZmluaXQsIGZjbGVhbiwgZmFsc2UpDQo+Pg0KPj4gSSBwcmludCB0aGUgdmFsdWUgb2Yg
TlVNX1ZQQ0lfSU5JVCwgaXQgaXMgYSBzdHJhbmdlIG51bWJlciAoNjE0ODkxNDY5MTIzNjUxNzIw
OSkuDQo+IA0KPiBXaGF0IGFyZSB0aGUgYWRkcmVzc2VzIG9mIHRoZSB0d28gc3ltYm9scyBfX3N0
YXJ0X3ZwY2lfYXJyYXkgYW5kIF9fZW5kX3ZwY2lfYXJyYXk/DQpfX2VuZF92cGNpX2FycmF5IGlz
IDB4ZmZmZjgyZDA0MDQyNTFiOA0KX19zdGFydF92cGNpX2FycmF5IGlzIDB4ZmZmZjgyZDA0MDQy
NTE2MA0KTlVNX1ZQQ0lfSU5JVCBpcyAweDU1NTU1NTU1NTU1NTU1NTkNCnNpemVvZih2cGNpX2Nh
cGFiaWxpdHlfdCkgaXMgMHgxOA0KDQo+IEF0IHRoZSBmaXJzdCBnbGFuY2UgdGhlIGNoYW5nZXMg
YWJvdmUgYXJlIHdoYXQgSSB3b3VsZCBoYXZlIGV4cGVjdGVkLg0KPiANCj4gSmFuDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

