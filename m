Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B522BACC7D9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004471.1384201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRjk-0007fE-7t; Tue, 03 Jun 2025 13:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004471.1384201; Tue, 03 Jun 2025 13:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRjk-0007cG-3J; Tue, 03 Jun 2025 13:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1004471;
 Tue, 03 Jun 2025 13:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRTd=YS=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uMRjj-0007bg-AK
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:31:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20607.outbound.protection.outlook.com
 [2a01:111:f403:260d::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d9c9bd-407f-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 15:31:22 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7480.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:31:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 13:31:22 +0000
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
X-Inumbo-ID: 09d9c9bd-407f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6Q2rjLTV+WP5iu2QiMXFVihjwzrxeevj10KBh/bo1kY1qinBZRh2gub1jhStmpZYR/q2fYN1vP8VU58HMyTaTuQ3MQx0+yOwJ2q/ufhGRZY79Ghox4/7hIlnMAhgfsP6gFVyv1fpwYuj7CxwYd2IY+iK4azJmkSzbOgyE427xa7YGrlrj46XiOppWr/W1xI+E9Ym+4FxFGhbsoK9fv5a8omD+QeTndoCzXuxrU/juClqQgxIDD8jcRuO8UPrWC0DxjqRbLTYm0y5C7SC6JJbOf2EH1gBnDWEcFFKSnYoUU2AQQPAPIKJR7we/0FOLEBMeF05g+FKZGv06GQb5TUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5Suj4YHn9CkrIg05xjvAg9i480A2T2xjgAp6xK8iN0=;
 b=rBVzW6NzraKs4QW2YBFu7d9S4x+3naRPjXsaAeA2pTkdUo5oaCWig1StWaaY7Q9CUEYdiW6FjCDpRAKpGAPNFcWztSbQRUQ+azd0QDLwEC222Ky8PNc+wRu2mi+M5kIbQQwTzdaDNupClrBSBEP2oRbqkFRw1lU/yNk3hzGt94cXrxTKxa7wKhsPdGrS/nqpK26Yw9oMq1V8EK8tcTNR8UpxkoovATLyH+kod88uXQ+0z9LZWs0+eVGPwpAjG9Ieeg3DJQHFe9g5NLGLHDse8U6id1wh5ZKxlDhH/svLQ7A+Hcvx680UYlZ3h/sBc7LvKWz2z0WTo29e8Qg2mtjEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5Suj4YHn9CkrIg05xjvAg9i480A2T2xjgAp6xK8iN0=;
 b=VxUAJhu0Ph8RvLn9jsIrou/rIJUoNLdyd7G4wEB2/x7UT+BUaMWhsCFHNsdMi2fqecBpGq3aBK3YJwafFfogFYHpBcfoVWk8r4EPiGTgu6E1xztbvNczoE695PAQ0+N5lk8ZXkpmuDgeYHM6dKTTceQwMpLftk5tW7qBgIHm8bf+e1CBneAbgl5eLx0Cc156ek/Bsh0pt9W4pD+atoUDEnI7Nnh5mnLyfbXCCYhZshy3r++eyv/5J7p951ARkzwVI2AmEMRKG7CJKBOICLoZ96Q/qyc+HTMZYQ8XNG0ZD4U1jSZvFLafOh5FPKBxcVjlUpsIYfkiD26Zw/e+yGbtyw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbz7CcYslTkZ61QEOdjKGC2c9BkrPvjG0AgAHrw4A=
Date: Tue, 3 Jun 2025 13:31:22 +0000
Message-ID: <c5ff547e-4e0e-4f31-a07d-55527a6d8457@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
 <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
In-Reply-To: <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7480:EE_
x-ms-office365-filtering-correlation-id: 6e860d8f-649d-44a7-9256-08dda2a2eeab
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTNmMXI1QmhjVi8zL2lYUm9jME1aYU40c2tiWkNyUTdlUkN3bk9EdHlrOUVN?=
 =?utf-8?B?d25VeDh2VmRZU2JMMHdtQ2ZpTXNaeWRNU1A4SHJSSW1pNkg0cDNHMDVmZGRH?=
 =?utf-8?B?R2hDSDZncjhtVFdrZi81OG9jR1dyZGhiR0dhUjNEUXg3dzYwRS8rdU5iUWxt?=
 =?utf-8?B?U1o3aVQzbVhhbFhTWEJkdGVQMXFHc2tvRmdVUktDUE1kU1l3cm41N0xVcjFp?=
 =?utf-8?B?T2VKMlY2amlmVUFLV0pTVkFRSHcwbWRiemkyVDRnUXBHZ0V6OGxzTWpwMEFS?=
 =?utf-8?B?c0dCRmtpTXdVMnhLVGtEV1JIZkJDWEZlUjVzMXZpekdtUEs1VmQrRHQxWkt3?=
 =?utf-8?B?KytFM1E4U1d5Q3o1VGgxS0xCOVBMTktMUzlKZjZwZGtmMmtKN1BnOGcreWI1?=
 =?utf-8?B?MmY2R2tMQ2Zua2R0R29tZHlyTkhoRExqK2pzNU0xTmpSTmcrVXFQK29PZUZT?=
 =?utf-8?B?M0h4NXcxNXNQYmR2NkdPQ2VqZWwyUnBLYVZyYVdHVjhTaFRQSzJJelMrY29w?=
 =?utf-8?B?bldqVmwrbGVNWlpVYTBOYUpyMndFL0s1QktCWndhMmQ2SUFHWnZqUjB0UnBu?=
 =?utf-8?B?UjdqZzJtUmlaWXU4VmFjcVZZYlJvVkpocktxS0JSay8rMkFBaDRra243SUVO?=
 =?utf-8?B?Wm5CT0phRk1WV2ZNaW9zMEdDbENLcjA2Sm1aSHhNT1ZUcTBpUzMyNlVmTlho?=
 =?utf-8?B?STRPTmhnQTQ5QzA5NWljSFlrV2pRS09SSWxSYVA5UHZGR2lIdVN0MWgyQ3Zx?=
 =?utf-8?B?ajFZd2hvQnI3ekxiZldpTTVMdUFpbXNWbWVyeHVkajVnNFBlWkRWOXlOY2FX?=
 =?utf-8?B?SkFCckhNZnVQbFdBQm9QTStLMFplTFM0RS9sekpLRzQyakZsZ3ZCWnZSTzl4?=
 =?utf-8?B?NFlacFFnWURCTE9KZjZMcHlVeVY0bS9jeGFuVkVYZFZZSGc3YkF2b3lER2dn?=
 =?utf-8?B?aDVZc3YvVVpyNDlKTUw4WW1helBNTWtPVkVSdXQ5NktWb3FmS0ZlcDNhQ3hK?=
 =?utf-8?B?Nkh1eW1Hbkx1K2tzLzdYUHZpanZzTklLQ3M2QUFwczZrNGJZQmZrOU5vS1dZ?=
 =?utf-8?B?QlZXTTM3aFo3WWdsbFNRaHlzQVJpNmIzQTNKazN1TnFQaVFiRXBtRzd4RHd2?=
 =?utf-8?B?THJBSWJkdmFKV2ZjSUdRTmVZclJlUjZUZnJLMEp2MHd1VFd3TjZiYTliamZT?=
 =?utf-8?B?dzREWGw3a2lHbUNpcU4xUjllczFwV1JUYnEwd1B2cFBUanJ0VUR6WlgzUEFD?=
 =?utf-8?B?SFU2KzJCMnlCbWxBREtmcVNUeWdWNHJ5TjlPLzFQSVExOFQxSnY1Mk1lL3ZU?=
 =?utf-8?B?RFlUN09NcDZsWlAzLzhGUlZoSndFWUJ6amFvZHRCQkNhYVJ0YXZZT0ZCYXl5?=
 =?utf-8?B?SXhiaW1aWmsrYmw3WXUreGM1d1NVZlpwOHJ6NGVPaFB1MUR0ZUk5YmJweFpp?=
 =?utf-8?B?dmpTQ2R2VFZLdGtTRTJsNEdmejRFZndWM1RBVXgrWjhvd1VJR0ZaNTJXQ2Zt?=
 =?utf-8?B?ZVZFRFRJQnZwTEFCazZIa3NZZWtFaEVLL1crS0IwY3plUjk2dm1sRGlXZ3N2?=
 =?utf-8?B?dFNCaDhMOS9RSzRJTjRDbmFKSXd2cUZpcG5oSnFmVThDNXQ3N2Q2Zkp2ZmVh?=
 =?utf-8?B?aWlrNU9IaHNhb0pQeDRXMDBCa3Y3MDB4TENGNkpEZWFmOHFSdjdEclpiNFEz?=
 =?utf-8?B?SzJtQ3ZGenh1NjlkZWgzWVdhSlB2VkdSc0U5K0xIemFmMHphaEVtamd6ZVl5?=
 =?utf-8?B?N3ZSQ0FMQnVRQnJEQzIvd1R6MDBKR3VTeG04ejRGVHpGUDdLMzczdFp2cTNV?=
 =?utf-8?B?WnVjY2VYYnl4M3g3SXBKUzdxRTFsT2ZzM2hHdHVGVGlTR0lPNnFQVnNmOWlW?=
 =?utf-8?B?TnZkb1ExL00zNzZjSUtzNWJFUUgzeHYrVWUzSHdtSFVUUENHN3ExMk9Pc010?=
 =?utf-8?Q?y+rl1PvKHsQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEZ6U1ErQ1IwQTBrZEVHVVdnVlJkb2lQNXFKZGNPazBlaFJRYTIzcGpZdFhu?=
 =?utf-8?B?WWVxSFJQQlYxczVJQlRudmNjSkcxMm9xRnI5bVBEKy9XRHFhUTR5M3M5Tlpr?=
 =?utf-8?B?bktMbkdtSGZZVGl5Qm5oUFRYTjMybUw4S0xub29DYjU3UjJmUVFlOVZiVnpF?=
 =?utf-8?B?NmhtbFNMaDAwZ0xpSUwvREFKbkFIeVpvbmpGRE9DYXg3WFRGck1pWjVBMzdm?=
 =?utf-8?B?SUI1Q0JKUXl5QkVKUStQc2xPelM1WXIrSHdNZDBVanJUcDdKVGpJSFpZSDJq?=
 =?utf-8?B?UGgvWkphc2FLcFU0MDMzS2pkejcyQXdocXZJZ2RTVFFZZ29OMUpnR2w1ZXVt?=
 =?utf-8?B?UE1oWjBLRXdhUER2alptSkllUm5xc3YzaFlIaHQ5OUhCeW0rOU1hWEMyRkZM?=
 =?utf-8?B?VEhKS0RueVFJSVppODdWdkljeE05QUt2QlRGTkNVbnY0RzV4ZjIvMWhzZGtE?=
 =?utf-8?B?ZXlzK255SmZBNWltd0R5Z2p3YUN5SHZHZ25wVEkyWkZvdW02Vkg1M3B6VHVX?=
 =?utf-8?B?VTE1WWhoZ3ByR0h5cDJCck5UYU52b2RRN2VSeE9EejBOd2RsYmVWcUE2ZFYy?=
 =?utf-8?B?ZGJlQWVHd0tJYURIVmpIc29EMTNuTytLMHVNbjZ4aG9kYTdWeXJzOFdJUWpj?=
 =?utf-8?B?RGFSZ2FNTU1YZXpkZ0VkWVFGRDlkSW0wUkY4R0tCSUFEVG1HN29MRkp6RmJL?=
 =?utf-8?B?RGhzYlgyRk51MTdpZ3dkdklkTjNZaTlYNXhXVzdIMytIV2MzTW1mT3pqREZZ?=
 =?utf-8?B?QmI3OW9FdHNRS05CSXh6Z0NMNzROOXRBdXd6V0xPMGRaNmZvRzZybi9VVDl1?=
 =?utf-8?B?QnQ0Wi9kZjRSNm9UQ2NnMXY2dVpuNXU5WGNYME5tSVI5NE5LVUI1S2FWdmxC?=
 =?utf-8?B?T3NMYzdxTDE0dFRIcXRCQTdxSFFlR1RHNmdJYU1UWk9ZZ3VQb0V2UEl1T0J1?=
 =?utf-8?B?Q0lpd20vU21sNjc1U2w3TU9zYW9WTHlpMzB3Z1FtYzEvbXU1Z0NrT0tRS2U1?=
 =?utf-8?B?c0F0NXg2aGM5a2pteTlBdnlIUElidG1BdVBCZkplN1k5RjE2UzFkTXVKZEZs?=
 =?utf-8?B?NWVaa0xiWllLRzBNeWtQendIQ29rd3FrWjVoU2J6Smlmc1d2aHkvbE1jckhm?=
 =?utf-8?B?WXJmODEwT2hoUEVHdTViV3U4NUhtc015RVlqVnBVd0oxdzhYQS9JTThpTllw?=
 =?utf-8?B?VzBFSDBMNzY0c2EyRFI0UHM4Z2RiMXJHT3A1R1NncDlXbG5UVytWbUttelpQ?=
 =?utf-8?B?dzJsenl3Ym9KSGJ4bXhOYitHWkFDSXlRMlFVQjQ2cWl1U2pQTUcvNEJmVTNQ?=
 =?utf-8?B?eUlPUldHdmpRaVlQK1BDL29GWExaVzNzdDdsSTB5N1N6OEY3Y092czB0MEdw?=
 =?utf-8?B?UEtqakh6MVFWRTVQWXdDd2M1TklWSHJGYjFtVFo1YmhHcnkwYkRVaTFneGZ2?=
 =?utf-8?B?NzNQZDQ2dXg0Q3RFRG9XU04vWlBYZElxektBRHRyYUNNSUtPc2padVBCOE5n?=
 =?utf-8?B?L0tjWDZrais2YW42NGI0c3RodVpDVGRrb2prVHNTTHd3Ti9pZUdreEN2VzFU?=
 =?utf-8?B?aGh1U1UrN2hPanpicURYdTRLVXV2Z2lHVWtzdEh4UlI0Nmd5OFlheXNoYXZY?=
 =?utf-8?B?bzVyMTRzZFlINVppZmp5T0dxSzVNYmsxMWVob3owWkxlNi95eXQ4TzFBZ01U?=
 =?utf-8?B?THpGcWFGdnhoWWpxcUxJM3h4SEh6WnpsNHJnQVErVkFONytMMTNhKzJVSzhO?=
 =?utf-8?B?ai9RZGJWbDJibmtuOW9CcmhLaGlXYlJ2cWc1K0V1ZDU4Zy9tNWlZQW9SVUo1?=
 =?utf-8?B?ZjFWSHBMUkp6ZGRaT2JGa3FuVG54ZVZPRFhlR0RFQlIrRGNvRU96WUl3VWt5?=
 =?utf-8?B?eEw4NVpkQWM3Y0NDOWpHazgyczhJaGdXSDM5ajZvS056MktmNkdMSTZTZUNx?=
 =?utf-8?B?NlJ6ZFNETmtpWXQ3bzdYaFFUUlVMTE5nL0lKSk52NDEwN3kwY3VyUlY0U0xJ?=
 =?utf-8?B?WThCUTN2QXhGN1dhRzlubzFtc2FZYzhlVko2MzI2Tkh3K0VEMTI0NGZtQTF4?=
 =?utf-8?B?MzVoOTFoS3FUYXFEKzRtejQzck5KZFk2Ky9oL2lFMDJXZXdYM1A0dUN5Z1lD?=
 =?utf-8?B?dm5jZktzWlVSc1dCZm43NnNBMlJQdVNpdU1FZEpsc29ZOTdqZXc5M3VTLzJp?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E37EE69297539D4A9E95A14ED4A79E56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e860d8f-649d-44a7-9256-08dda2a2eeab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 13:31:22.9055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ne7xAsLWF0DEazM90ZtQcM69/L0D4C41zsv74bdCAhHb0UBvFwsy91oEo+D2SU4MVAuqtJWNqvptdCKnCjckWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7480

T24gMDIuMDYuMjUgMTE6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wNS4yMDI1IDEx
OjEyLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IEZyb206IFN0ZXdhcnQgSGlsZGVicmFuZCA8
c3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20+DQo+Pg0KPj4gRW5hYmxlIHRoZSB1c2Ugb2YgSU9N
TVUgKyBQQ0kgaW4gZG9tMCB3aXRob3V0IGhhdmluZyB0byBzcGVjaWZ5DQo+PiAicGNpLXBhc3N0
aHJvdWdoPXllcyIuIER1ZSB0byBwb3NzaWJsZSBwbGF0Zm9ybSBzcGVjaWZpYyBkZXBlbmRlbmNp
ZXMNCj4+IG9mIHRoZSBQQ0kgaG9zdCwgd2UgcmVseSBvbiBkb20wIHRvIGluaXRpYWxpemUgaXQg
YW5kIHBlcmZvcm0NCj4+IGEgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkL3JlbW92ZSBjYWxsIHRv
IGFkZCBlYWNoIGRldmljZSB0byBTTU1VLg0KPj4gUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVzZXQg
aXMgbGVmdCB1bnRvdWNoZWQgYXMgaXQgZG9lcyBub3QgaGF2ZSB0aGUNCj4+IHBjaV9wYXNzdGhy
b3VnaF9lbmFibGVkIGNoZWNrLg0KPiANCj4gSnVzdCB0byByZS1yYWlzZSB0aGUgcXVlc3Rpb24g
aGVyZTogSXMgdGhpcyBhY3R1YWxseSBjb3JyZWN0Pw0KPiANCg0KSSdtIGFmcmFpZCBJIGRvbid0
IHF1aXRlIHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyBoZXJlLg0KDQpUaGUgcHVycG9zZSBvZiB0
aGlzIHBhdGNoIGlzIHRvIHJlbGF4IHRoZSBwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCBjaGVja3Mg
DQphbmQgbWFrZSBQQ0kgcGh5c2RldiBvcHMgd29yayB3aXRoIHBhc3N0aHJvdWdoIGRpc2FibGVk
Lg0KVGhlIHJlc2V0IG9wIHdvcmtlZCBpbmRlcGVuZGVudGx5IG9mIFBDSSBwYXNzdGhyb3VnaCBi
ZWluZyBvbiBvciBvZmYgYW5kIA0Kd2lsbCBjb250aW51ZSB0byBkbyBzbyBhZnRlciB0aGlzIHBh
dGNoLg0KSWYgeW91ciBjb25jZXJucyBhcmUgYWJvdXQgdGhlIGNvcnJlY3RuZXNzIG9mIGFsbG93
aW5nIHJlc2V0IHRvIGFsd2F5cyANCndvcmssIHlvdSBzcGVjaWZpY2FsbHkgcmVxdWVzdGVkIHRo
aXMgYmVoYXZpb3IgaW4gdGhlIHBhdGNoZXMgDQppbXBsZW1lbnRpbmcgaXQgaGVyZVsxXS4NCg0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMv
cGNpL3BoeXNkZXYuYw0KPj4gQEAgLTE5LDcgKzE5LDcgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3Ao
aW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICAg
c3RydWN0IHBjaV9kZXZfaW5mbyBwZGV2X2luZm87DQo+PiAgICAgICAgICAgbm9kZWlkX3Qgbm9k
ZSA9IE5VTUFfTk9fTk9ERTsNCj4+ICAgDQo+PiAtICAgICAgICBpZiAoICFpc19wY2lfcGFzc3Ro
cm91Z2hfZW5hYmxlZCgpICkNCj4+ICsgICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9l
bmFibGVkKCkgJiYgIWFyY2hfcGNpX2RldmljZV9waHlzZGV2b3AoKSkNCj4+ICAgICAgICAgICAg
ICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gICANCj4+ICAgICAgICAgICByZXQgPSAtRUZBVUxU
Ow0KPj4gQEAgLTU3LDcgKzU3LDcgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICBjYXNlIFBIWVNERVZPUF9w
Y2lfZGV2aWNlX3JlbW92ZTogew0KPj4gICAgICAgICAgIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZp
Y2UgZGV2Ow0KPj4gICANCj4+IC0gICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFi
bGVkKCkgKQ0KPj4gKyAgICAgICAgaWYgKCAhaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSAm
JiAhYXJjaF9wY2lfZGV2aWNlX3BoeXNkZXZvcCgpKQ0KPj4gICAgICAgICAgICAgICByZXR1cm4g
LUVPUE5PVFNVUFA7DQo+IA0KPiBOaXQgKHN0eWxlKTogWW91J3JlIGxvc2luZyBhIHJlbGV2YW50
IGJsYW5rIGVhY2guDQoNCkkgd2lsbCB1cGRhdGUgdGhpcywgdGhhbmtzLg0KDQo+IEphbg0KDQpb
MV06IA0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAyNDA4MTYxMTA4MjAuNzU2NzItMS1KaXFp
YW4uQ2hlbkBhbWQuY29tLzIwMjQwODE2MTEwODIwLjc1NjcyLTItSmlxaWFuLkNoZW5AYW1kLmNv
bS8jMWUwZWVlNmMtMGRjZC00ZWQ0LTk3MGYtM2Q3ZTU2OWNlYzA5QHN1c2UuY29tDQoNCi0tIA0K
TXlreXRh

