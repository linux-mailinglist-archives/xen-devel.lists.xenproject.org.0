Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wbBDFXJLlGnfCAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:05:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57714B23E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234811.1537925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIsV-00030S-7K; Tue, 17 Feb 2026 11:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234811.1537925; Tue, 17 Feb 2026 11:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIsV-0002xy-4V; Tue, 17 Feb 2026 11:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1234811;
 Tue, 17 Feb 2026 11:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeWO=AV=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vsIsT-0002xs-KW
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:04:25 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aaadb9f-0bf0-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 12:04:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA5PR03MB8380.namprd03.prod.outlook.com (2603:10b6:806:477::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:04:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 11:04:21 +0000
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
X-Inumbo-ID: 6aaadb9f-0bf0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4lvsFuYTnRggqjzUieqXQUD0xqMNE1lThmrisVw0moZ+7vsU8QJGo+0S0raGS9bq33AKulEHPHJyBXavrvjB73Bt5UVBWpl2v/FqOEm5WA+Nq9IrGWPD+7/yl+2F0P8JN3Cedl1xTtJuhR6pFLXP9coR9MxRH6DCzaO3S0U5WaJclfMkftr0wnCeP8eMNepQj2K8x50WFE2kTBCcXeU69oWF/IgyVasIM/TVQ5UIc6eElWxb5gXWfqTf1i7afSc8vrKxCVZwt39aKibhRb1+yIejMc+Fa3zfWrnFmpYV7lSYttD9Q5NmU33zK9bF9BksMvq5O6te1nxmPf6NIksAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0zerrpf6mTVoRwJ8KUPfcu9RrHiTpY7VL3BXCy1YEM=;
 b=YJrYJyxeYQGk3r7agPZ6+lwdzUKENivBXlTO+BQG227BUScPMc7/z7iS4b8A/i3wqYqJAuLw7RyjRExfUSRgzjK9K0uRLQuSnp3QaJnFy1TdqK5bgZFktMJieGvzZm/CfMP9/m4h2G60MYjP340AD9ROn6YausyMnbVB6ZAh+GsbUGSTL3PtqGkt1C5QlBkKKuOZTz07nO1bZvBwxXrzfPVuwKuI2Vl5CS361N5EvBxRGTLtlcVP6jzIjA/Ior4BsRYW8m71J44pOZb/TY8AgtCpK0JJ8ySQt/pXA8mZI5Jn3wxjh4D8i+cl3yMEFLzeteV0Ezb24soaM3sR5xyW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0zerrpf6mTVoRwJ8KUPfcu9RrHiTpY7VL3BXCy1YEM=;
 b=K1lxg7EZwpLd+Os4R6xefHZZblv2ab0AeBBeaffkg904acVYcPu6MPTz8G+bgyobKff8uL95AxOuHAyxfC5tUqwIXcNDaUXJxubxhpYYyzuhL/w/tlMcyBEQJMtygQvZf91xjX2KVaqxHfuSBQv9phplAo0RdzvX3VEBjmkyDh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 Feb 2026 12:04:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
Message-ID: <aZRLMePmm8ehD94H@Mac.lan>
References: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
X-ClientProxiedBy: MA3P292CA0044.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA5PR03MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c509e6a-b831-4e46-9c13-08de6e144d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zzk0SXpVSVd0ajFoL1k1SmhSTjdia0l5cE00bzdKbFFtUVVUdVBMdlBGL0pG?=
 =?utf-8?B?RHA4TDVTNXlwbWg3WWZFZGxJdkl6TkorN3g4U2wxRnhrS1ArV0prS2xKM3RV?=
 =?utf-8?B?RWZhZWRIcjlrTnpETnJtaVpOUGlza3ZkR1UrRXZ3dmZOTStyMHZNRWZHZmZp?=
 =?utf-8?B?a2Z4aTYySGNnZ0NndVlhL3B4cU9jT3RvWlVuVHo0bWNhMDEzV2VGZS81QWF4?=
 =?utf-8?B?UHdqcDBsMWg2V0hiUHhmOHgrRTFIeGo1bjRFNkRoVWdWSUdlUW1TaUJTTzQ3?=
 =?utf-8?B?ZkF4MnhSbCs5aGZkN1RuOHlYVUxYclQ1QXFDY3oyQm1zUTZiZGVDVU1pQmNh?=
 =?utf-8?B?R25GR1ZRem1WZk9WRkVUdEVqUlV3TmdiNDRQUjByZjh2YXJuOFo4UGJrb2ND?=
 =?utf-8?B?ODhqZk0zb0lCRDJudFVFQ0REcmcvZHI2cVAwbm8vMWkvYVVFYk5LcUwxaWw0?=
 =?utf-8?B?YVQxZUhTNDJTaGR2QXkwNzVCL3AxaFdJTnNiUGVLMEt2UlN4bVl0NnQ4MC9u?=
 =?utf-8?B?ZXpvckZaZE5hbmFrYmN2ZE5KMVNlOERwYXFOUlJ3aEdSWkpXWEhDSFd5ckxi?=
 =?utf-8?B?Rlc0TUFBM3FXRGszOWtidVNubnFJWDYzdEE1amh4bEo4dXYxUHRtUmw5WmNY?=
 =?utf-8?B?cGU4ejNUTzZIZHlPYTJ3T2JBVnh0NldXcnRjc3JkWHFzYmkzZHd0TzNoVnRV?=
 =?utf-8?B?QSt1dGJ3WXZRWVFBREdITCtJZjdpSTJielpRS1h1emtrWEVzMGhDbU52OC9K?=
 =?utf-8?B?SHYwa3c0WUtsSTRQR2tHWFpLY0prdUdGWGRocjJydW9QNG9nN0M2T3VUa25N?=
 =?utf-8?B?bzRnZ0JuNDhiN1NxcGVncGNGNEFVS3F5bHFtclhUOEV2SjgzMXdRTmJoU1Vs?=
 =?utf-8?B?cWM5d1VxR3NpbytIMkpMU3AxSCs5L0RqK0JOM2g1QnAyQ3ZmanRJVldmK2Qy?=
 =?utf-8?B?VmViOHlKN29MVlEwZzVyNGVtK2dNeHdGVTBuUVFwTnh1eE1TaXFIWk9ObHZk?=
 =?utf-8?B?eXlIcnVGSWl4VTRLU1llZFphdmdaYjA3ZnhueWNiV3YxY1RSM1lKZ1R0VHNH?=
 =?utf-8?B?UDVkdm9iL3lNelV0REtZY1FlKzdZYk1TVHkxMkVpbkZhZnpQdG5ldklNd3hT?=
 =?utf-8?B?UG9uMGxtTENXSXhSTHlDcDBNM05NT3FRaEUyZGY0MUptNG5MaTdMOVpldXRY?=
 =?utf-8?B?R21BZWw5eGZEYmVhbDVZUU5YZ200eUpFZEF0RWxjQ0F4K09DMzZUSCswREdN?=
 =?utf-8?B?OWltZmFaWk1nUFF6VGpaUTdCZldzVlk1MERiMmRpeUhRbHc2VkZRZ1pNVXJK?=
 =?utf-8?B?aW1jLzEwSlpWU3Zha3hiT2dSMStYSm8yRFlGM0E0UFhPd09rQ1BDNE9LR0hp?=
 =?utf-8?B?ZDByR0FFTmdaTjBjS2d0eThoUGJzT2k0RVlZUXFiUEpqSldZa1dLQm1mdnVY?=
 =?utf-8?B?MWtNS3RtOXVJRHdSVWhNTWFBYmFlb0s3ZERYYlBVWlpVczFCM09vR1NWV0Uy?=
 =?utf-8?B?YUVBbnBTMStmMVU3SUN4SlhGbmFxVnFDSWUvcUtLQlI2TmEyUE5uZkJBZHYv?=
 =?utf-8?B?TS9NRGVTS3pyWEI1Mkt1UGlJVlI4Unp3NThIUnh5Q2FYUUgzT0JwY0dna1dS?=
 =?utf-8?B?SGgwclM0TWFwZHltMTBKWldTZk1zU2Nkc1Z6YkY4Tzd6ZGxYZzlXd1NJajJx?=
 =?utf-8?B?cjh4NW5QSmpZaVZ5YTR1eWo3WDBua0FOMzZXSDVEb0FHK3MzbHRVQXFSaUpa?=
 =?utf-8?B?ZjllVVlUcGVESmtzaXFtblZpWVZCTEpoaG1mZFo4Uy8zSThPSExSZVNrcCs1?=
 =?utf-8?B?ZVZubGpOdmtYN1I3SmNoMlovSjlpTE5xOUJVMHpjbmdXMksrUk5xa3dpMTdi?=
 =?utf-8?B?c1puOGhQa2Y4M3ZSNDVrSlZsdEdaRmV5UWoyajZmNGxzdmttZ1NNTVR1ZWov?=
 =?utf-8?B?dFJFY0xnK2tKQTBoRjlVNTViRU85UkJnQmFFVEJGWWtxRTdtQzhPeWh5WFo3?=
 =?utf-8?B?aFpkelUrQjBEa05qK2JuL0dNck4xelNyR2I2V2JwYmZzeldCNE5oaHFhQUhr?=
 =?utf-8?B?Y3RaeGVJbzNsZFhTWS9NT3BpMFJRRVhCNTdkUHJwV2dGU0xWRXVjNnlRTmRD?=
 =?utf-8?Q?cRP0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJRclAzbzdRV1MzMU53R21XTEh5RGUwWjNURURSSklWM1JINmovaVUwdy84?=
 =?utf-8?B?T3Jna2xIVmpaU1RiVU9sQnlQVHlQbW14OWZoSVdDM0JVMnpzZXR4Q2drUXc1?=
 =?utf-8?B?NW5tTnFNblJEZGFYcHpaZ085NzA5OTZmWmtaT1JnK1ZzRi9IbnhWdlpVZXk3?=
 =?utf-8?B?dENGVW1NY2N3VGpFNTRmMGRjeE53UkpFRUxHWVBKSkEvTktiL2kzWVdCRG4v?=
 =?utf-8?B?R2FwVEhNMjB1VUo2ekd6SzFyY044ZUVFNTIvUTFydVpwcllQd0xMbTc1cGt2?=
 =?utf-8?B?L3NpTWZhQWtlZlpad0NPMndGa29YUWY2SXJIUDRVeHpEajZuaXBTSWw4VGdF?=
 =?utf-8?B?c1VieTFmdElDb2QrWDFZZm9uZ0QrWkM0NlBOVUxqS2hDTTlhdndWS0ZWQWN6?=
 =?utf-8?B?R0JGWU9CdGF2VEJuZ3RHbC9ZNUE4eFdMaGVWbkFRQ0dkamlrQTlvbnJrZGxo?=
 =?utf-8?B?V0gybmdkR3VYK2NRT25vcnM4VSsrbXdVOGlScG5iUlFjQkIxdWtrbVJaVXpm?=
 =?utf-8?B?aTEzVWRtR2xrRGNxbURmc1lyTC9ueUJxZ1h6WVZPZU1ud05DTFc3RlhCSitC?=
 =?utf-8?B?bVZrRDZBdEgwbXVrbXZ6VndKcWhXNEljK2ZmUm1lZEFwZHB1QjFibnBJbXAx?=
 =?utf-8?B?UEJDeEI5eVhoUHpmSTV6Y2h3TGt5QUFCclBjTE0vNy9iV3VrZjl1ZTEvUklr?=
 =?utf-8?B?VWdqWTUwWE9LZU50cHk3a0NreEpzNlFlbmNMME5nWHp6bVd4RFUrQ2F6SFQ1?=
 =?utf-8?B?dnpIcWJTZklzQlgweXhhUlJtNksyZ3YxSEhKVWh2Y1l4emsvOHg4SHpuNHNo?=
 =?utf-8?B?NkJ1eFFFZWg1bFYxL0JSb3hidmVaZDl6VnZ1dXJVQlp2S1k0eFBPV1pPek1u?=
 =?utf-8?B?cHdkcTdyTjdoTjNwOVB3WU56VHNOUkUycVJmeGVtSzQ0ekk3RVZWbHBpa0F6?=
 =?utf-8?B?UFNIUDlSOGhEbnZMN3JPVkFXSFpUL3VvUmpIdktvMHBLdFNzWTgvS0J3OXQ0?=
 =?utf-8?B?bWROdFVWVHNla2p5d05IQjN5aTUwYnhkT0lxMWNOL2dLWTR1cTFHN2ZuNnFq?=
 =?utf-8?B?OE9uS3hGRTZ0RU5vbDlMUThQbWhQTWd1dmFjUTFQSEFHT0RLUFNYbzdNbjM0?=
 =?utf-8?B?Y3ZkOSs2WGczYnZ5dGxUZTdQWXNGbVFnVlc2TkE5N2l0dTdkTm9EcStFcnpw?=
 =?utf-8?B?U3B0cWZCK2VnTmV5NnUwekJMSWl3QXBtN0tSMnlyeXppMFkzZmw5Q2EvOUJt?=
 =?utf-8?B?aWlUUEZiaXdibm5TTVRhdXIrVlJyZTFjSU9HbWI5T0dYSmtwZkVGSGQyYkJ0?=
 =?utf-8?B?bGl0czJCV1phc3JBSHo0bkR6c3lZeWpZVWV4ZEI3UEg1b0hWakR5b01Qc3do?=
 =?utf-8?B?S2xueXd3VzQrd0xka0UwMGdvZmo4UmRqZTFYdDFwNklQK0hwSXJpelZaaEVl?=
 =?utf-8?B?dXZYc3ZEUzY1RXFVdzhtTUc3akQ0MEs5cm1QcWJ6RTA2SDJUNWlkN3ZmNjhq?=
 =?utf-8?B?c09VaU1KVnZBOFY1cWdlb0FKbFYremZMSmwzMDBmbmhYZ1dodDVRRnExTWtG?=
 =?utf-8?B?NHRnck9pZEhNZ2dXZUdOUGt3ZnJyQm1pVGc0N1l4WStjbzBuVGZ4a0MrbTZT?=
 =?utf-8?B?RTI5RnpkdC9LRkhTS3JlaEpiS2xOQWg2OE5pSGpJNXMvNkdMTDNobjFUQTRH?=
 =?utf-8?B?UXZkNGhuZzhSZVpZYk1PaVdpdGxjbUpDR2xnWnQxV2l6cmVCV1U2azdlR1Rr?=
 =?utf-8?B?a1ZwOUtIV2FZVkNWMlplTlBQaHVTSE5kWlNRRVNXU29ZdnVNb2I5SnhMTUlT?=
 =?utf-8?B?Q2JzWlplVW1NR3dVZ3JJV2Q0OG1BSWw3VURHTlVBTkRaWnRjdkx0eW5Obkl1?=
 =?utf-8?B?alJDQk03V1AzTkJtZnBZVkJDaGpqVURGWW11MHpnRm1HSEVQdU5oWThnblRs?=
 =?utf-8?B?SkJCWEs1TzJvdzhSSHJTRVY3cEZEa2EyeEtkSjR5NzlndUZyeUlQSVVxRGFT?=
 =?utf-8?B?NVMwMlJhalUwdG5VV2hpZ0FPb2ZCTS9mM1pZUFpDNUhwWW1tREpQS1FVRWxC?=
 =?utf-8?B?L0UzTXcvOXFPTjJUK3RrcXprMzZ3SXlLSWdLWGtHTTMyOENxYzNPTktLK2cw?=
 =?utf-8?B?TzZGTEVVTTdSdzVNaGRKSE5ucWFHaHg2bStkRE44TG9Qc0xZWVJVczBnVVR2?=
 =?utf-8?B?eEpxck9MbSthWmhPR3IrZFpKRUcvcFEzSFVMemxYUHZTdTIyMVJZZFB2N2RK?=
 =?utf-8?B?c09FTkppTVduV0YzMzFTMitqSFJoSm9iZk5kNkZyckFBMFlpYzhBd29GT0ls?=
 =?utf-8?B?OEI2K0JDM3QxL2QvWDRGc0JRQ21QMGt4bUIvcGhQTUxpd2VQWVVqdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c509e6a-b831-4e46-9c13-08de6e144d34
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:04:20.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ik3mWnkI8MCFsSd3wSeX7xTYoC1VOrWlhMHR1aTOydno6uBuPg9GNpDMBbNqQlUNmrn2AUz3w1NBnoJgclLbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,citrix.com:email,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[159.253.27.254:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F57714B23E
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:54:30PM +0100, Jan Beulich wrote:
> Nothing hypercall-related needs setting up there. Nor do we need to
> check whether the idle domain is shutting down - it never will.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Drop vmtrace_alloc_buffer() part.
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -475,12 +475,6 @@ struct vcpu *vcpu_create(struct domain *
>      v->vcpu_id = vcpu_id;
>      v->dirty_cpu = VCPU_CPU_CLEAN;
>  
> -    rwlock_init(&v->virq_lock);
> -
> -    tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> -
> -    grant_table_init_vcpu(v);
> -
>      if ( is_idle_domain(d) )
>      {
>          v->runstate.state = RUNSTATE_running;
> @@ -488,6 +482,12 @@ struct vcpu *vcpu_create(struct domain *
>      }
>      else
>      {
> +        rwlock_init(&v->virq_lock);
> +
> +        tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> +
> +        grant_table_init_vcpu(v);
> +
>          v->runstate.state = RUNSTATE_offline;
>          v->runstate.state_entry_time = NOW();
>          set_bit(_VPF_down, &v->pause_flags);
> @@ -516,7 +516,8 @@ struct vcpu *vcpu_create(struct domain *
>      }
>  
>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
> -    vcpu_check_shutdown(v);
> +    if ( !is_idle_domain(d) )
> +        vcpu_check_shutdown(v);

I would possibly leave this as-is.  I agree that the idle domain will
never shut down, but it's possibly best to needlessly call into
vcpu_check_shutdown() for the idle domain rather than adding the extra
conditional for the common case?

My Ack stands regardless.

Thanks, Roger.

