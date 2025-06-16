Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E5ADAC2E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 11:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017103.1394073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR6N7-0000fm-N1; Mon, 16 Jun 2025 09:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017103.1394073; Mon, 16 Jun 2025 09:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR6N7-0000dC-JS; Mon, 16 Jun 2025 09:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1017103;
 Mon, 16 Jun 2025 09:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR6N6-0000d6-A6
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 09:43:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549b691e-4a96-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 11:43:18 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 16 Jun
 2025 09:43:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 09:43:14 +0000
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
X-Inumbo-ID: 549b691e-4a96-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8OEzSzKKTnQSWAfa7OLiFThhmWs8ioHVAQJi1vA0bjbWCxPHJpL7VZMi1+jBqFoyE2SueEl5/BZkFUHF1mNMSCjvSJc61ZJyiepwhiofZW7tIiN/YLtitExyGs1me6FmgiCAoS4k9g0KkxjMcTGcjhpgmxd2VZIqhFwABhB+S7hkIGxMp+hUYDfri38ylNQUnqw3dcKX5rkJmb0OxmkVMPqPfqsmpMDP8iEDmPBxUxvqD6+mkI/OG68wa0jKa3ZqhrmpNdgBDRLztoDsVEH/gKNdcCEjyrfty1g3Fu0RqNWsvNCHgjKey9+rcDj3mM6mcbImYozJE8hCclMMvpchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVulP7Vi6An5GEs0rQDPdXKTKguq/7pkarZCmsj5ctM=;
 b=cO2dula6MuL3pjVkVoA2DEu7X2F8Tr7pKbXcgcvWb+QFT5F+W+UFqrxKL+9kqiJq5o95KRxaVGXhL7paTZkZathlLILaHEgtSbGjkEtGO9JjsIdlr5+FPHGsA7TxJxpWxBesQMQZbYLpeqHzUl1oo9nDHyg/KRBsHmihOZVk9yrRlOw6M+Ekc/K//byuMgjXDWBh7j5Fky63rHkBxYRh/rHW3sWOkqHkHpEEqYBTwckmUjObZELMbAH976IFmEzZzkB1HgLQR3sk1mU+glqcunwaW2EnvdFj0IamFNd05oflQhONAG1OOSYd0NTcgA1pgn4QILr5E9xeCAkyxhDVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVulP7Vi6An5GEs0rQDPdXKTKguq/7pkarZCmsj5ctM=;
 b=ZqlsaEKx/6YaEtcz0wcfdVO3/a6gIbS3YYYmR6jqLfEZxMJaWfbIZmR2yfzrGVv4C2eME9UZkigT2gE7NtsBFQjoxxIyFcZkwYTXSGRDwcHO8y7zN+kjkd64Qs7UP9xbOS44x+4I2U+deUEO/otYllqZg+wDeHbiLGdWBxnQ2hA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbzuQ7tkLRAfE4aEeQu239amEhMrP+LqUAgAdzEsA=
Date: Mon, 16 Jun 2025 09:43:14 +0000
Message-ID:
 <DM4PR12MB84516E8BD6E4C48D48273C93E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-4-Penny.Zheng@amd.com>
 <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
In-Reply-To: <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-16T09:43:06.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB7201:EE_
x-ms-office365-filtering-correlation-id: 9b390dde-b1c3-4ef4-78fc-08ddacba375a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTFCdUlpT2k4dlI0Nk9SaXNIdUVIUk9CWENhdThxUE1FQVcvNFRQNGY1cWUv?=
 =?utf-8?B?cGxHVUlaQjlzNzJuSnQ1NjdJL0FhazJiY29SUHg4d2xiMkNWNmFvOGN1Y3NN?=
 =?utf-8?B?Z3JjK1V0RHZZQnVUeFovYW1zTWlkUE9NYUQrUVhRbERNQXBYZWtla2VRajl4?=
 =?utf-8?B?d0dlQURVKzRNczBBU292eTd5ZTl5dzRVQWlzRjJxMlRzUkFjREpFczZwbjRE?=
 =?utf-8?B?VlhVZ0QyUHdZV2FOa04xdGw2UDllUnJNK1BZQlNRcmlmb2kvYXBXLy9UcVRz?=
 =?utf-8?B?Ykw5bFBaSmF5UW9ZZEFXS1h2L1VCU3BIOEhCVC9pc05CeENxT1RsQ0NFQmts?=
 =?utf-8?B?Ui9ReWRSS2hTWjNVZGZMaFh2bHJtMGZZeDU0b25QZmg2Slg0MXJMcVNSU2N0?=
 =?utf-8?B?OWNnczVCR1YrQjc4TmMxWjRla1NuMWhobEpDVklXQkdBVXJ2dDFpdXIrb0VN?=
 =?utf-8?B?L0hVNFdiNkc2QXpqZDhjZkhzM1ZsNGhXczFGN2tneWU3T01VWjlUNkJWT01D?=
 =?utf-8?B?MU5vZ1IvSDNhSmNjZER0RGNIQVdKYkc3Q0pCYVhueXU1K3FJdzc5cnNFTVRN?=
 =?utf-8?B?cXB4eFFmWVY5aTNCeDFYcTM2OEJCbkg1U3Q1YmRKRkEzVkNucUREUThQTVpl?=
 =?utf-8?B?ZDBJRXFjZFg0a080ZytOM3FnajIvNi9EVzJiVVNJK0xHeENSN2N2WnFycE84?=
 =?utf-8?B?d2xDTnBEdzBjdDRBdkY1ZTR1eWZ3VjI2ckRvNTdya2h0ckdLcXNLbUJHNXhR?=
 =?utf-8?B?Q1NhcXRRdlVhOVBrdWpMS2NMN3JaRUtGc25MdXcrNWUxQnU3d0FUellXdXNn?=
 =?utf-8?B?Rndoc01KRUsyTGhHNTZwR24rdkI4bzdrTXZVSldPV29VdTdYQkdYUXJUdDNZ?=
 =?utf-8?B?R0h6TGdsalRiRXJyYXlYbGRkQkNqT1FFNzVmQUoxcXdTbFg5VnFHMHJydjZX?=
 =?utf-8?B?WFoyV3o0MnVNaFhnaTgrZ1pNYWpkRHMzZldJbTI1eWNpY1J5Q1pid3NONFc5?=
 =?utf-8?B?ZEttanpLMnI4cDlSb1dnWjRzckErZmJLWEc2ZjNzdVlXV3Nkdkc1L3ZBaHJM?=
 =?utf-8?B?SGNPRjhiYm1pWng4WnA4bEhyc3ZNY28wTzU5NFhRZkxFN25Ya1hackU3RXNW?=
 =?utf-8?B?b094cmVLUW1rL0FaeDc4QlY4K1MzOUxGanZuMlFtMkJwUG1jWmN5UFpQUVR6?=
 =?utf-8?B?TWNsa3NOQk5raisxNWFRWDBPQ28zQjFhMHR1ZmxPR2RVSjBNd0FwbjhRT2dL?=
 =?utf-8?B?SzcwZGQ2Wno2M0xvTjBGbDMrd2NwODZoYmpLKzNkL0lqckt1VWNhTENBQVd2?=
 =?utf-8?B?QUdMVkNKMGIwejAvUUJlcFRiby9obVpOQ3N5cWpKa2ppU1BBZTkrRmNhSVBZ?=
 =?utf-8?B?RTllc2U2TUh6a3BwelJ0T0RYT3Y2cW5neGxYaStyUXM4WldwTEU2eE9OSlF1?=
 =?utf-8?B?d01SV3dYZWlxYXJZenZJQjFjYTZJMjkrNjJmUHlYOXhpblVtdlJ4MERVQ2NX?=
 =?utf-8?B?R0lVVkZvS3dHUDhHcW0zS1FaT0Rram0vZ0o5VnhXUmZCa012RFJ6NDBKR2RT?=
 =?utf-8?B?UkEwVXFnUHJlT3duWUd4anhGQU1qMTgwaFpscVB5SlZtRjVHSnV4Mkk1b3hL?=
 =?utf-8?B?dDFYRWpqM3NmMHJxSGlqSUVCMmo4SUFSVU5uZU9FS0VHRndLSEdHQklFRmhV?=
 =?utf-8?B?TXJ3VVdmRlYvU3E3T282RC9yQmh3M3VUNldySXJ1ZnlxalFocTNScXJUdEkx?=
 =?utf-8?B?WGgwb3QzS2hOUFpuZFRCYS8vdXZpS3dyTXB2MjdKckluTjJObFBrU0hKVE1O?=
 =?utf-8?B?cWx0L3dlSysvdE90S0RlM0E5MDNTRXRSU0pUTGxJTkRwbUFQUHNuRGkxZnIv?=
 =?utf-8?B?clBwSGs1Z1c3aTY3b2tvQmI4aFppdkRMTFNaOTJUQ2FDcUNSTFVEM3dXNHV2?=
 =?utf-8?B?c0VXV3FKRWxNK01kbGxIa0ZXdmRHSTh1NXQxaDJlay8xSGpRS1VMWjY5NzZB?=
 =?utf-8?B?VmQzUGRNTkJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTY4STRFUkFOY1JTdDV0QzZFNnNWYmh2aG1kZHQvMXA1c2hUanVLUUNSVmxV?=
 =?utf-8?B?Z0w1Zk5XUW1OQVNWQUtNQ2NtZVA1OE5ybEEzZmpvK0RaQjJ5ckJ6anprNXFF?=
 =?utf-8?B?RXdkMkVhUVJpclB1ZWovYTBDVEJWVHZGeUthY0FqRWZKVkw3QkU1bE5pMmRC?=
 =?utf-8?B?MExmVmVyZzVHSkJLajlIQ3grUWsrQkp0ZEtPaml3eUt4OUtOa1U0OUE0OHFG?=
 =?utf-8?B?OU83dFBadXhvZWEyOFRhWGJmaHo1K2NZWFN4N3d3L1hvdDFTTzdUMTY4YUJa?=
 =?utf-8?B?YlpaUXVTSlU3VE9FUjJiWnVBVi9VSTdscCs4c0czbDcvdkhKK3AvU1UxbHk0?=
 =?utf-8?B?SUdjNmMrN29HTC9qM2M4WWc1T3doRlFLWlBlNlNIcmhwNENtTTZVM3FYZ3hN?=
 =?utf-8?B?enI1aHlpaTVKRHd1QnBzKzhxOEpqYW16UmcrZENORzhIV1N5Slh1M25WSlBD?=
 =?utf-8?B?QjNEekZLL0dyS0lYWjFpMGtwakRtQmsxZkVWUFJZZUhwN0tiOW1kcTJGSW9a?=
 =?utf-8?B?YUdQT3hGcWVXMTdJSnRIRlRCMDNuWVlCYUNPNHFwRVFrSkdza1pHaG1IczN5?=
 =?utf-8?B?WkhJM1FiWUdWVVhLMWJEdmFRUm5sT2xudm1iQ0hyQU5BeTdMRG96WVJqWTkv?=
 =?utf-8?B?a1VFaEREaVJUTk9SR1R0aEJXcVJwZGk2ZzJ5WFM4SWNuUUFTblBnUzdQRXdv?=
 =?utf-8?B?SVlPTEV1TFJyeW5TZzQ5ODJWY3hZZmxBcE9QMVZIMnl5QUExK3hJdVRQUkwy?=
 =?utf-8?B?UnJ1cUZ4VDlWWW0vMUZuR0JaeDVTVkRMTVZUdW9aK1dHQWVCSFBFWkxFcFFk?=
 =?utf-8?B?SDk2c2wzWHVrblV0M1RMUWVuYUgwam14RFpBU1BGTmJSejIxQ2l5VkhObzRk?=
 =?utf-8?B?cnZad1lsNFdGbk1QWm9halJvUVVnSExXQXdXWUQ1QjBHM0QzUTZ2bzJHRktZ?=
 =?utf-8?B?aVV5WTdVK1dmUjZUZ3Bnbyt4MWZOVDdBSlZWZXQxRlpQeE9iOWUyTlczbWs4?=
 =?utf-8?B?ZEZRdkU4NllrUWtJLzEyQTZlN2pJbFlJQ25NVDZJMHcxUTN0UGJrK2VpT3hQ?=
 =?utf-8?B?QjN0L1VzbkxiTktBQTlPRFkvQjRHUXNKUERWczFNdTJwLzlRRDhIcUZjS09N?=
 =?utf-8?B?bTJ1eVVBV0tGZktRdEF3bkxQVnJFTHpiVzg1K1pZcTI5L1dVUDVWcVhFbTQ4?=
 =?utf-8?B?MEhtUVpjVEN4b3NFa21uRmF3ZmduUWpPcDJkWmhhT0Q4bi9GMTJ3akpIRW1M?=
 =?utf-8?B?Ui9qLytqR09Qb0ltVUNaRllvdTBUZjk0NzBZeTZSQ2QwQlVRS1RwQWJ5WG0v?=
 =?utf-8?B?Z2RTUW85ampNSWp2YTNyTlQ5SEtFOUFTUjlXa21TM0xta3dCbzMxaHFNZWZY?=
 =?utf-8?B?THdNbCtQRGxSSFpJbWdWOXVMZWFPZ3ZtVWFJQU1OdWJJeFV5dDdzMjFJbk03?=
 =?utf-8?B?Q2RncUlEQnN0cG1zZSt5bk5vTmdQT1FmdEhFTVRxdHFzcmpOMmJRYk1DQXlv?=
 =?utf-8?B?Q1VqVDJnOHBGZitxWHhDUDNXZ1VKRG1wVXlpT0hlNWNuZ1Ryd0NPR25laFRa?=
 =?utf-8?B?UHMwVTRmZVdGeEYySXM1WWltaDc1NStYczNybFYySko4V3dlZDVyRTVFbTMx?=
 =?utf-8?B?M25UU0VwRlQ3RzBCS0ZSb2FuNSs4VzRkWGFzaVdOc3dNRmRLOWFMb3I0TEVE?=
 =?utf-8?B?d285S2xYS05MZjFrWE1zbUxYNVBZQkdlMTlwT2pKamNFTHh0ay9vVnBlY2Jy?=
 =?utf-8?B?dXdZQjQwd2p0dTQrWlhZdnhzVEp4eDZjYmh1ZlkvUlhDWm9yTGFlM0JZenh5?=
 =?utf-8?B?QnZYWW1Za0UzVGwyMTlpQmcwcTJIdHhkQ1dxZEQ2WHRhK2ZTRXV2QjMwTEEx?=
 =?utf-8?B?R20rbkJ2Wk9OTjRmVGVNeDkxUTdlQjZENGxEaGpqVUpKcy9vRkgxSFhNZ3d0?=
 =?utf-8?B?eXQrR2xoRGN3bXlQRVI5VEVVY1l5d2pydUEzbjhjbEowREw1c1c1Y091SENY?=
 =?utf-8?B?OWhwZklXaFpFY1hCUFV1VUI1bmlSSTE2UmtqQ0VtRUl0dHg2RTFaR0NaTlZx?=
 =?utf-8?B?SnlVSkczZzd4UHMxK2dLRkpYbTVmbnpOR3N3VXNROGdOTGQyL3JBb3IxdUc4?=
 =?utf-8?Q?yUYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b390dde-b1c3-4ef4-78fc-08ddacba375a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 09:43:14.8904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slhOrH2WkH15kZgPBSpoiY8mzqq+2zY/qV7GEmzkgIvr06PKuRA4019ZRTxNMgXjRpRSCvF6wodidgVINKUh0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxMSwgMjAy
NSAxMTozNCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMy8xOF0geGVuL2NwdWZyZXE6IGV4
dHJhY3QgX1BTRCBpbmZvIGZyb20gInN0cnVjdA0KPiB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNl
Ig0KPg0KPiBPbiAyNy4wNS4yMDI1IDEwOjQ4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBAQCAt
NTQ1LDE0ICs1OTcsOSBAQCBpbnQgc2V0X3B4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lkLCBzdHJ1
Y3QNCj4gPiB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlICpwZXJmKQ0KPiA+DQo+ID4gICAgICBp
ZiAoIHBlcmYtPmZsYWdzICYgWEVOX1BYX1BTRCApDQo+ID4gICAgICB7DQo+ID4gLSAgICAgICAg
LyogY2hlY2sgZG9tYWluIGNvb3JkaW5hdGlvbiAqLw0KPiA+IC0gICAgICAgIGlmICggcGVyZi0+
c2hhcmVkX3R5cGUgIT0gQ1BVRlJFUV9TSEFSRURfVFlQRV9BTEwgJiYNCj4gPiAtICAgICAgICAg
ICAgIHBlcmYtPnNoYXJlZF90eXBlICE9IENQVUZSRVFfU0hBUkVEX1RZUEVfQU5ZICYmDQo+ID4g
LSAgICAgICAgICAgICBwZXJmLT5zaGFyZWRfdHlwZSAhPSBDUFVGUkVRX1NIQVJFRF9UWVBFX0hX
ICkNCj4gPiAtICAgICAgICB7DQo+ID4gLSAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4g
KyAgICAgICAgcmV0ID0gY2hlY2tfcHNkX3BtaW5mbyhwZXJmLT5zaGFyZWRfdHlwZSk7DQo+ID4g
KyAgICAgICAgaWYgKCByZXQgKQ0KPiA+ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiAtICAg
ICAgICB9DQo+ID4NCj4gPiAgICAgICAgICBweHB0LT5zaGFyZWRfdHlwZSA9IHBlcmYtPnNoYXJl
ZF90eXBlOw0KPiA+ICAgICAgICAgIG1lbWNweSgmcHhwdC0+ZG9tYWluX2luZm8sICZwZXJmLT5k
b21haW5faW5mbywNCj4NCj4gLi4uIHRoZSBuZWVkIGZvciB0aGlzIGNoYW5nZS4gQW5kIGV2ZW4g
aWYgdGhlcmUgaXMgYSBuZWVkLCBhIGZvbGxvdy1vbiBxdWVzdGlvbiB3b3VsZA0KPiBiZSBob3cg
dGhpcyByZWxhdGVzIHRvIHRoZSBzdWJqZWN0IG9mIHRoaXMgcGF0Y2guDQo+DQoNCkkgZXh0cmFj
dGVkIHRoaXMgc25pcHBldCBvdXQgZm9yIHNoYXJpbmcgdGhlIHNhbWUgY2hlY2tpbmcgbG9naWMg
Ym90aCBpbiBQeCBhbmQgbGF0ZXIgQ1BQQy4gVGhleSBib3RoIG5lZWQgX1BTRCBpbmZvDQpJIGNv
dWxkIGNoYW5nZSB0aXRsZSB0byAieGVuL2NwdWZyZXE6IG1ha2UgX1BTRCBpbmZvIGNvbW1vbiIg
YW5kIGFsc28gYWRkIGRlc2NyaXB0aW9uIGluIGNvbW1pdCBtZXNzYWdlIGZvcg0KaW50cm9kdWNp
bmcgY2hlY2tfcHNkX3BtaW5mbygpDQoNCj4gSmFuDQo=

