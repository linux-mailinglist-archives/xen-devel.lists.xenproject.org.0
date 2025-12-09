Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E0CB0029
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181652.1504678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxPF-0007Tr-8p; Tue, 09 Dec 2025 13:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181652.1504678; Tue, 09 Dec 2025 13:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxPF-0007Qk-5d; Tue, 09 Dec 2025 13:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1181652;
 Tue, 09 Dec 2025 13:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qC9=6P=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vSxPD-0007QX-GO
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:05:27 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba176f68-d4ff-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 14:05:25 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by DBBPR03MB7084.eurprd03.prod.outlook.com (2603:10a6:10:207::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 13:05:22 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 13:05:22 +0000
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
X-Inumbo-ID: ba176f68-d4ff-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0igy82zBHoF0swnnXo/XP6rQ1XvPnpmBX1VzSA16wE+dH2abSbuJTylLbcS/rnWkCdCq2FMyQnbs5+qvCAM2UQvg7j3xE7GWFVJ/3Dg+FXFVB6tZJaU5jI6fzw571AyFh189jmfPTzSK9qBzxyza44Swhx59OdUzJCMoKOEcqT1pK1aCKMDISlWFIfu6ZDCFBqkf83l1ZQ/052ub0sbfUWFgqOIZgzkN/x1Uxfaq9ovbdBNniSbJ8o8BFfzEQ2iEiqwHpJmCm63QjpIQgjHL1Ifyj1FXpTtD6ZVw80cUsiFsT+N7hPuQQwie5bmVrcA3GJ06tJCF3eRAqA8nMbGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kFEARygEVgtismNz/youeB9N5GMG8Y2r7IzauzXu6M=;
 b=N4Ly9DtUx1T/oNNdgULQmGqA2WVPslS9FiLMw1SrTUxxHQNNtFZyAKGjXZgzMYODoct/kN3M2iHdRR65/aR/lwLsTPr/kX2yEkPFO0oCZ2TbUsy7XjcyTysJ0W2kCfnIlOT8P/fgosmHEl4FkR1JhWg9hP17nkin98sSIJJ2be27Srktv8n6pEkuqFMbMgf0AaDu5VE4032sLDSHFHYqBbshEjaPmXQ8lueLBIkoZrRAQY6E+zbfJ9EzgoYbc7c72iWFfMgwhdeZtnoW+cjdFV9RojLybY8mEn5cEw12MNZMxA9nq8rNzUxsYEFQcP+0d3VSW9B4iiTe+xv0VLMMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kFEARygEVgtismNz/youeB9N5GMG8Y2r7IzauzXu6M=;
 b=d6vSDLBfS2PzznK9SoCaY0ff17kXRBJWQPf/7kLVmWISos/EUxi8BrjJ9D4gb7+nmdQTUo+1NIdah7jzsrsU6F30SORbajVSstgE9hCvaOc49GwVSOszmMvT5YXpIQVKY/2n5yoFiAMNNlzEWTUlQpG89psXYuB/Y2nBvhEvdHhXRbtV8YB5glmW8hdEPMgihY28ehTe9dGeHG3ArtQ09EZSmN0Jdqx1vjNsPJY+yKlVEoBBcP4g05R2LFYk/0VmbLpX2aHupKhc2fv1VfeiQYk09zDkqQHa08ljqP4Axnr/rg2WYM4JQ2+7EclUh10aUWpxWttiDaNwHDyHP2zTYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4c9a2cd0-e466-4737-a750-73b811c06ab3@epam.com>
Date: Tue, 9 Dec 2025 14:05:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] sysctl: align handling of unsupported commands
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <6c7cc11e3569f69b185d32809d63b8cdca67aa25.1764961645.git.milan_djokic@epam.com>
 <ac0b7706-ceb4-49c0-9147-250055b4cf6a@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <ac0b7706-ceb4-49c0-9147-250055b4cf6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0050.eurprd02.prod.outlook.com
 (2603:10a6:802:14::21) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|DBBPR03MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d18dc20-9a22-41e5-9cef-08de37239cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2M1ejdxclRMVituOEVpUXd1MkY5dFJnR3c2OGdmWFBld2FiejkyOEUvT0Y0?=
 =?utf-8?B?UkIxRVlSS08wU3AwNzZ2SDI0ekdWZ0ZnNzdYVE9OL2J1Q0pSNTBIakpuV1NK?=
 =?utf-8?B?UUlZdmNRcHk5WU9PU1lhbDN1RVY5Y1Bhbm1ITmpiZGhGc3lPZjdyNW8veElU?=
 =?utf-8?B?Qzc3YXBFTUpjQmJUYVQrN0tTMmJPeHAvWlBqL2FCV1hHWmpYTHVaek40RlQz?=
 =?utf-8?B?ZnFDOEI5VUhHNmRKM3g1YWdUWVlpTTFFSWVzMGdKQ21ldDFqRFMxdmxpd1pv?=
 =?utf-8?B?MzdJKzBnUUEzOC9vU1pvYW11bUlLNUR3SDAxdXorTnplWE9XTVR6dklob1Zs?=
 =?utf-8?B?bUFYK2s1Vm9qVmtORkJub2x0TmNTN0hmVUtOU0lyL0hqZ3BFQWR1MVRVdWZR?=
 =?utf-8?B?d0ZjTXJENVpIejJNQmt0VmZtV1lUS1k3ZGJTcWZBekZQM3hJNWhZamc4T1Rj?=
 =?utf-8?B?b3ZSN09tcjlqKzF3TlBlM2hpTlU1T1lpR3hXb2hPbTlBUWY0cHk3aEJQbllS?=
 =?utf-8?B?SS9VNnBQaFJVZlZuUGtzSWhWVUdweUJHSUdpRG9za1RIMGdIYW5CMzhVN1JD?=
 =?utf-8?B?Mm9YSlJ5ai9qN3RHeEpNM0h5Y1NpNXMzR3cyUGhkS3NiSGgwNExyZDNoaHRz?=
 =?utf-8?B?Y0hYaEFOeWp4OUNjenlJR3dtVkNVeW93ZUN6Ky9wcVVwTDlEYTVDTkVnR0k0?=
 =?utf-8?B?OEx3VHc4ZzBvQmVUMURjTGU1SW11U2syM0ZIR2l3QjB5eHVoSnZVckhvT0lU?=
 =?utf-8?B?dWhEbENYdkJNV1gvQ1JsUFRRMzBMQ3ZYcE04S0ZZOGMzN1JYQ0dTaEQwOVJp?=
 =?utf-8?B?aUxyQXE5M0xCNEJKZHhoMFM0d1hDQUFaQlpRMDFIaVVzS21hTmdhNExrZlFB?=
 =?utf-8?B?RTA1K1lHZTk0cXBuY1FVWWlGNml0bzZPUkV1TzBCdHRaa2JkYkkwNFQreVZl?=
 =?utf-8?B?bm9sRVFCZ3dQVktCUkJtUkNNeWcvVWVES0VOZ0RMcmFwSUsvT0V5WkpzZTJp?=
 =?utf-8?B?RC9ya29VZWJzRElwNnVaMEFGRFE3ZTFvL3JReUFQZDFQTWVXelQrQ043b1Jq?=
 =?utf-8?B?ZmFqaVA3WmJITUR3V0NuYnk5bjY2VG1RU0Q2Mk1SWXNhQWlMZ2lxM1NUdVll?=
 =?utf-8?B?Wll3SGtxRjVheGY4OGJ1UXN1OGZ0cm9MUTRyNFE3dVA0eS8yZk5EakREZVd1?=
 =?utf-8?B?ckllZUxwMjdNU1hKYU1VNnpsalFJZWx4Zk9HL0ppSDJEYXRpYzd5bENiWW9n?=
 =?utf-8?B?ODFyN3N1a0s4M1FEMlhDa2VwVHNCMjZoSm9mWkh1cnQ5SWxzZzNJTDN3MWJ4?=
 =?utf-8?B?ZTVUcHV3eEpwOHBYQ2k1enZHMW8ra1RsSmlFZUxNb2pzWmZlYmlRNTFEWDdK?=
 =?utf-8?B?endCQkprNHNQRHBTeElWRjBReHQvajJJVUNtRitMQUM2T3ovQ2V3SFVJejMw?=
 =?utf-8?B?OStQTnIrOGhiRzVCeFlZeWtXbXhYbTI3RWFOaU9MdU1kc1JoWjJkamtZOEFZ?=
 =?utf-8?B?bFJKTC9sUXE3Uk9WKzVqMHdsMk9Zb3QrVHJJSE1QRjQ0RTdOZDc2czMrTTdC?=
 =?utf-8?B?OW4yeHpQYnBlbGJhdUFvUE1QVFVJTjR2TnhETW80OXNPUTJuTXVLV2RnTXdD?=
 =?utf-8?B?SnZzdkFCbGF2T0pUenhzL1ZrRG5Da1l2enE4Y2RXS2YzdWhCY1ZMeEVpeWJZ?=
 =?utf-8?B?RGlXbytwcGdDbEVDQmtIWTBkVk56N1F3YmtVWCs1TVpWZ0JkaFA0WFpRWVlz?=
 =?utf-8?B?TWNHWHJyUjhtUXRBM2RRSWRPT2piSytyQUt3b0ZHQXRLbGptNEJtYm5mY1Q2?=
 =?utf-8?B?Ukt3N3lkVEV0elZTeVFNRitNS1RpQjZWQjIzclhaKzZ3TmhsTGdSd1I2YjYx?=
 =?utf-8?B?eXhxcDBaTzFIWC84Nng0aUxEVkdMNmNuUWcvdGxVd1Z6YzdNL3hVN21NcWVu?=
 =?utf-8?Q?ps+b8hRqIXIELry6ol+E27k14QloBUdh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3dJbW5jSTNSLzZ1KzNGSnBvaVF1K1puMzhUNlFFYnJlRUM1akcxalJ1NFhL?=
 =?utf-8?B?V2ovV3Jmd2xBa1VXSjdFb3J2aGFXdjVGS0dSbTczUngwYmhBNHl1b2dJSXdv?=
 =?utf-8?B?bmI0Q0FXK3VkTmp1ZGVyMmRYWE5IdlRMYXVobWp2azRqamlWOEIrR09idElh?=
 =?utf-8?B?WmFvSU13RFIxQm05UEF1YU5KTTQ3QjNKdG12aDVaSlltb1N2SFlTM2ZPSUNV?=
 =?utf-8?B?N1VwUWt2VXdQY1BMWDBMcVB2ekZ0WHJtUCtSS1VyVUpTRmdmbUhuK24zVlpq?=
 =?utf-8?B?Ymt6MnhhQnJSN1FYWTNudWZ3enNYaWNLczB4QUdjcC92aFRjbUN5VTc3Rmts?=
 =?utf-8?B?bHlkQmJZN280LzZib3R1NmhRL2g2YldSZHBuRDE0cUpqQWtGbDE0RnArUUpH?=
 =?utf-8?B?cnhqSWtYMlFoQ3JCdGZNT1d1c2dGWlJSU1A0QjJoVDQrOXJ6cWJNNy90Smp1?=
 =?utf-8?B?TFQ4OU9vS2ZBREE3UHRENUx3YTB1aTFCdXVDS080TlgwaHhCeXY0czk4MWZz?=
 =?utf-8?B?YzRFK3c4dVpDWUowUm1PeWpoQkxyWlNXOVArMEhjcS9JbXdLWlhBOWZkUDNF?=
 =?utf-8?B?dXZPbjNaZGlEWU82cWkxeEhNNHdrZ09TQWdTRlMrQlhqMExzaVN2STJ0dmRv?=
 =?utf-8?B?d29BdHBRMkYyL2NZa2xleUsyNFBlcjlWYzk3elBBeGQrUHA5bkdzSnJDZXV2?=
 =?utf-8?B?UnFqNUx5cCtvS3FlV0N0UXYwVzZleURFUnVObThSbGFoMFJLOXJhcUxqdGs1?=
 =?utf-8?B?aERPV0lUZ1VTYWZWVE96amI3Y2IvUnUxc3Uzemk0WndHd0R6ZGRIeGFSU01x?=
 =?utf-8?B?NFEycFhCVWlVV2daRFpWREpwMDY1UjNiL0l5MzNDellxTElJVGx2SDhVUVly?=
 =?utf-8?B?bVFmNmpmODY5L2ZsWFZPWXhrWTBmcGlTYlNlWUljc3lWaGVTUUZGUWk5NFVr?=
 =?utf-8?B?cDRFTWRBNjBQbE41dG95VXE3cVRWZHp6L0hFK3JFWmswcisraVNmRGpLV2JO?=
 =?utf-8?B?SVRPSmUrQXpDbHNjWmlVMGI0MlVJYlFDbGZRS05uRlNMaTNQWXp1dytHeC9Y?=
 =?utf-8?B?K28vRnNKNGsvOUNmbXJZSmR0VmlhUkNHQk5oTmxiYytGNTU3NXo3dzZ3bThX?=
 =?utf-8?B?ZEtYemkxMFZjK0VrM1dOMW9PQUlsSWdoS1FnK1FDUjBHRmxCcjRSNDd2Rjh5?=
 =?utf-8?B?UkdIcFFmNEIzNmtPY1pqdUpMUERxQ1BkbEh5K0xEVmpBeWFSNElmM3JGcjlR?=
 =?utf-8?B?Y2dRdU9BOXJJZ3JMT1Q0eGVGNW01eHpnNEVkekxHbEM4eG9Xa2pFSGJ2NDdV?=
 =?utf-8?B?NVdPYUUxOEQ2RENsbEZQdkJ1UzVidVVlRkF1amo2aTMwb3lWeTE0Rmp3R2dC?=
 =?utf-8?B?ZmdMWnB4Y1hLdWVvdnVJNmpuaFRzZTV1RHhpeDE0OUVqQllrTTN4eFF5UnhL?=
 =?utf-8?B?TC9QWEh6eW9YYXJNNGZENnQwTmFld29XMDV5Qk9wR0JCUVc2dThRMTgvZTBU?=
 =?utf-8?B?amR2RkNNdFpJVVl3ajJ1ZEZOMGo5MUUzMC83Tkd3ZFNMVEU0NHRWaUU5SkUy?=
 =?utf-8?B?dHdpWmRuYUdkbExTcnNGTWVnWUlkbi9nMzlhZ0JFbDJzOWtuc1ZvOU9aV1VE?=
 =?utf-8?B?cUtwUkpRNjhXUVg4U09HdmVMczhZbmViYUhDZlU2NUJ0YlMzcllHWUxua3Fp?=
 =?utf-8?B?eVRtVEhSYzBEcFZCcmd3MUJHWXlBRDEwMXdRUVJvT0FqVnJEdGxpNkdEUFF5?=
 =?utf-8?B?Qk5FLzBpVzNZdVBnVzg2bXZiMTI4bzBqTGFzK2psOGhGWTRBZzN0RlF1YkRi?=
 =?utf-8?B?TzEyRVRFa01GNU5xbDI4bENoVHRmQXVyOXZFaFltcnJzcmUrbDFSaDhOTTE4?=
 =?utf-8?B?SVBRQWgrbUh1RkFWaFRqYWtSQktIdjR4eTBkajcwQzN1c2Rmd2ljZ2M2TW16?=
 =?utf-8?B?RzVXRVpyQXYwZG0yVnBMZHNJSHREWVIvZnRkNU5vTnZFTy90MjAxV0JOKytz?=
 =?utf-8?B?MTFodVdnNFRCdGRVVTkzclRMeUtIRlZWYTNuWWdZK01XdUdaNzkwSWdwNndp?=
 =?utf-8?B?UFJBRHM5NDdKU3YvUkxWSUdjYm5yc2pyaXFQSXNnWTJLdmFtL01jWHArcU4x?=
 =?utf-8?Q?gX9aOGStMF4WwGiagZ5adaZCO?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d18dc20-9a22-41e5-9cef-08de37239cab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:05:22.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNus2UW/0onGtSW2orSaozR5QZ3jRCTomw3bGLmEsg80pjxNvb39LgExQm0AVL6k6Eqx2Yoc7VJVxGA+U/B8KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7084

On 12/8/25 14:32, Jan Beulich wrote:
> On 05.12.2025 21:36, Milan Djokic wrote:
>> Handling of unsupported sysctl commands currently diverges: some commands
>> return -EOPNOTSUPP, while others fall back to generic -ENOSYS.
>>
>> Unify the behavior so that unsupported commands consistently return the
>> appropriate error code, allowing the control domain to correctly identify
>> unsupported operations.
>>
>> Using IS_ENABLED() macro to identify disabled commands, allowing
>> dead code to be removed at compile time.
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> 
> Overall quite okay imo, yet there are a number of small issues.
> 
>> @@ -170,19 +173,22 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>           op->u.availheap.avail_bytes <<= PAGE_SHIFT;
>>           break;
>>   
>> -#ifdef CONFIG_PM_STATS
>>       case XEN_SYSCTL_get_pmstat:
>> -        ret = do_get_pm_info(&op->u.get_pmstat);
>> +        if ( !IS_ENABLED(CONFIG_PM_STATS) )
>> +            ret = -EOPNOTSUPP;
>> +        else
>> +            ret = do_get_pm_info(&op->u.get_pmstat);
>>           break;
>> -#endif
>>   
>> -#ifdef CONFIG_PM_OP
>>       case XEN_SYSCTL_pm_op:
>> -        ret = do_pm_op(&op->u.pm_op);
>> -        if ( ret == -EAGAIN )
>> -            copyback = 1;
>> +        if ( !IS_ENABLED(CONFIG_PM_OP) )
>> +            ret = -EOPNOTSUPP;
>> +        else {
> 
> Misplaced figure brace.
> 
>> --- a/xen/include/xen/perfc.h
>> +++ b/xen/include/xen/perfc.h
>> @@ -92,7 +92,6 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
>>   #endif
>>   
>>   struct xen_sysctl_perfc_op;
>> -int perfc_control(struct xen_sysctl_perfc_op *pc);
>>   
>>   extern void cf_check perfc_printall(unsigned char key);
>>   extern void cf_check perfc_reset(unsigned char key);
>> @@ -114,4 +113,7 @@ extern void cf_check perfc_reset(unsigned char key);
>>   
>>   #endif /* CONFIG_PERF_COUNTERS */
>>   
>> +struct xen_sysctl_perfc_op;
>> +extern int perfc_control(struct xen_sysctl_perfc_op *pc);
> 
> Why would you move the function decl, but duplicate the struct forward decl?
> 
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -7,6 +7,7 @@
>>   
>>   #include <asm/system.h>
>>   #include <asm/spinlock.h>
>> +#include <public/sysctl.h>
> 
> Why would this be needed? It means effectively the whole codebase gains a
> dependency on this header even when DEBUG_LOCK_PROFILE=n. Yes, you may
> need ...
> 
>> @@ -40,8 +41,6 @@ union lock_debug { };
>>   
>>   #ifdef CONFIG_DEBUG_LOCK_PROFILE
>>   
>> -#include <public/sysctl.h>
>> -
>>   /*
>>       lock profiling on:
>>   
>> @@ -164,7 +163,6 @@ void _lock_profile_deregister_struct(int32_t type,
>>   #define lock_profile_deregister_struct(type, ptr)                             \
>>       _lock_profile_deregister_struct(type, &((ptr)->profile_head))
>>   
>> -extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
>>   extern void cf_check spinlock_profile_printall(unsigned char key);
>>   extern void cf_check spinlock_profile_reset(unsigned char key);
>>   
>> @@ -360,4 +358,6 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
>>   #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
>>   #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
>>   
>> +extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
>> +
>>   #endif /* __SPINLOCK_H__ */
> 
> ... a forward decl of struct xen_sysctl_lockprof_op; I don't see what's
> wrong with doing just that.
> 
> Jan

I’ll correct these mistakes. Thanks for the suggestions.

BR,
Milan

