Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDD78BEE4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592000.924610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasgF-0003XJ-FO; Tue, 29 Aug 2023 06:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592000.924610; Tue, 29 Aug 2023 06:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasgF-0003VZ-CW; Tue, 29 Aug 2023 06:58:27 +0000
Received: by outflank-mailman (input) for mailman id 592000;
 Tue, 29 Aug 2023 06:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasgE-0003V3-SV
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:58:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72a7ad45-4639-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 08:58:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7923.eurprd04.prod.outlook.com (2603:10a6:20b:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 06:58:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:58:22 +0000
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
X-Inumbo-ID: 72a7ad45-4639-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBArx519cr9/A/eg/mtt//qbCT5kcx2KYmNBQILihTYQk7+agUXGyBpQ36Smr9SkbEZ4HsLkZTfqDOxHwFg8X8s6nI0TJTCEjWd4/vOYoDmwMo2ko3oabcLSLpeOVN89xD24QrqZuiEPg8zBA6Fak/bazfBBHQYxFKAASkEqo6jdT+HibN/OjJZ77pwOmY15VfLkGWNEj55WWP9K9xGHQaC39df+W6ihTQaBf/FJeN8mhfQnEJ9JOt8rt36S7W/YpGNTWdw+GgAyXkcBIK8Zw4XxUVrR7SsZENZvs658SEQeliVYRre9+aqJSWHl83p5SKbgQvNfw+GLxaEP9DEQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Wjl1GQARSufvv1hcls9KQ7oYaXHnS/RI1t5GmaAA3o=;
 b=Yf2UV1wQPrPJKOOl9hw/IoQrxavJYSW6xrUyAQzrRGC65tIvisAGCP+h91ZSt3qPVEjIqgclbwiwJnm7Ju/bKWiNpZcCc5TKNsmIxPM+g5jN3szdM8IS458jPvSnN2n4buXxZkm+E9vv+cWKImspnehnobHTjOsj1B48+EoHRc16kjcTtX+XdfVq7ZZzfS/qmWoMnFCsVdkQ7bNAdgxhgC8DvtVORXAOiMqpMPf5HLFX55u71AB1Pz28pTdFUjr3PoMS8GeuBVmU3V/ksJBnt6/SqTRkqJWtuKQ8+pThHTvhy2ri5aapZj4CA6L5gWJtKlUHXfWAK3wIRpiE6Chxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Wjl1GQARSufvv1hcls9KQ7oYaXHnS/RI1t5GmaAA3o=;
 b=1vOprXysy+bEbzGRpnZPrUSGjGR1/0nmoiKsFJwag8kGCLsNqVlBJQx50rmRgPbouVA/Jenh9oUilawzepJOUGIIIZZeuPP0YwiMP7/X/hTs8krGGnrKVXdhnnEfm9u2PGdW3ND60LU3s+FruZV4oG0ASHVYBI/+4QG1jjNgD5j62hRD79v03TNpeoJxnxIBzwLPdLzlu0LHbcwHBtJt5LOXQ1DsA49MKLxuNaiaueex5NEPH3CO47TKs9MJPrpVk8tlT1Iml7gzEdgIrJ9qFL8EHOxW33N83U7tXz5BJnMndcL92qFDv23hKIBnuWXkFecleH0+9L9kSg4kxPiAFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26e0d0f4-2524-b366-7e68-069bd72dbfaa@suse.com>
Date: Tue, 29 Aug 2023 08:58:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/6] x86/msi: remove some unused-but-set-variables
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-2-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 5736cc31-2645-4f36-e59c-08dba85d5595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XDxvPX5FwthdiT9hA3cuCtr4n9612QS7orSS8sXsboZwgegSK+RNZfncIskuZPPe10MfyNtq3+QsdGutQTsIh2iytO7ZdkP+spYMVDQybiDJjJ3K/XkahA7myviouwim4uTS/TXS9AcPLsOuEKZlwvf0keur1tA9sr4aVk0AkAyTAvZSPEXq8gPLnShp9LAlEask45lwZz95QDp1CBffMTczPpI493y1GOaWSXcGbwsjgrPOf74TseFpcKvnwowzmM0hykYLFfbqubY8zjmH5SgL0H2Qc8Z5R/lidcyrzFk3DYyxasiyLD7kH/SfWSwwEyhrCHjbwPaMgRM43RPZ/NE3zV6pQtH9NEqroNSxKdk/yQ+riOJIN+pB+KJzrbKdS7RL6i1CsX3m/QWTSZA76Y9zpTjDMIRBPEcgNuVsFUgv79SRsIEinVAMfwj/J7MvOsy9R4WTX4Jj2j8pr9jCeKtQ9BIWtmM3aUlFLm/vIzAPd3OBxeOyzvVZv85knY+o2dMnoBf2dkFUbvNdydv1VKTv6PDCUOhh+ZQ8t6Oqxl4DgGqAwonnsDakwcJxUg4y6+yKd2MoXuQsCsjDWmvkA9J/MXskKvyNrZrUu61DryiYR5n+tnFmXgHZFsI9GUfSbRhzOu3edTNklMWlh17i+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(186009)(451199024)(1800799009)(6512007)(6506007)(6486002)(53546011)(478600001)(26005)(2906002)(2616005)(316002)(6916009)(54906003)(41300700001)(66476007)(66946007)(66556008)(8936002)(5660300002)(8676002)(4326008)(36756003)(38100700002)(86362001)(558084003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUpVa3hxZDNsdkg2cVN2V3EzRjZFSVVSeHlxNjEzc1hIVVloVFdyZzFITWI0?=
 =?utf-8?B?dHBVVTg1aEM3Z1lVNCt1WGlrT0VDMXN4ZDc0cGJGSHJvZ1hRRWwxQWhBQmNY?=
 =?utf-8?B?cW8vaE4rdFdWV0RvemZRTDZHRXpRRklmZ3NjRXphSkNUQUszZjN4NWo5WW5T?=
 =?utf-8?B?ZnpSZDdSM2xJalZEMVgzMmtUTFJxZGh5ZFBzajd0TTNsTFl5U3BGRmNIbXgw?=
 =?utf-8?B?eXpOSmFST1hEV0F4ZTZYR3NDb01iUG1STEcxdjZrb2N2Z21JOVRCOEVPK2s2?=
 =?utf-8?B?STN2ZHk3OXRyRE9MeXFicmcvWHByZkthY3ZFanU3b1dwcks1STJzYUREaEk1?=
 =?utf-8?B?Z2pObTI1Mld1NExJSU9EbnZDSzZsdU9wUHhYL0hHdFFJaUw1OGdqb25uTHJJ?=
 =?utf-8?B?bndUbUNnNzdKVCtHSEY5akRBeFpLU25JRUxxUHdtMVRxTmNKV0lFeTBFZWNX?=
 =?utf-8?B?UHd3aFdSTitmdmV5Y2lsaVhBOWxyZkkzK1oyQ1cyejRCRi8xTXBiTjl3Zng2?=
 =?utf-8?B?L2Vldm9nUUdmdWZVa3czL2pWNnk2S1E3VEdqZ2FFSWt1V25hZm5EaG1WTVdp?=
 =?utf-8?B?UXVoampQSWpoYm5sOE1QVjNXTWoxL0dHemgvSmwrdDlFR0s0M21uSzQ1UUJ4?=
 =?utf-8?B?VXRkSlB2UWpVRzlOY1JtUTZ2MDJuN01UMXkxdjRsaFRWTGt0ZWx5Tnk3ejNN?=
 =?utf-8?B?TWxnNDE2SjF1VFhHVUJ1TnpRS0NwR091VnRlT2ZGWURzVmI1N3BWTThpK2o3?=
 =?utf-8?B?YXVEM1cvdVBBMFlVTWpid1IwZjIwb1VwamVLTzFqTEE4bUtIRnhjOHFLY2Vt?=
 =?utf-8?B?dUFaV0I2bitXNnI5UVZ1Mzh4RFlXNlFTT2xuQTZNeUpiaWVJY3RoTEJWQmFQ?=
 =?utf-8?B?dWFRTzU5eW5vQVJUOER2NG9USjVSMjBBRFQ2NXBYQU9vU0RCekpKaXNCQjJR?=
 =?utf-8?B?RnFicmVtR3RxdzJOSjJCTlNYcjN5ejRXTDN1dEF2QWVTWHBMZ3R0U3BZZUQr?=
 =?utf-8?B?MjZPRUkrdGdHd3B6QkVEcDF0dHhZUVBsaHh2a2tTK0tVUXd6MGNPbHhhRTF2?=
 =?utf-8?B?T1VGWVpyZXpkQSt2LzRMM2xwczN3c3lNdkhLcGFUOFV4THBkK3gyYm5DR3JU?=
 =?utf-8?B?L1JtSHVRSDNNbXQ5T2YvYXBRN3hlRjgzOFl4cXFyOUFwSzZJeEd3RGdHc1pK?=
 =?utf-8?B?R3dvNzRnUy96LzdxbS9oUmF5aXV4Y3BwUEpYd3p4Tmw1Qk92OFpuN1BDelpF?=
 =?utf-8?B?ZXpoN0p1MHlRZGhvOUlmcXJXR2ZBMDhTbVpONHhDV244S3JINStLOXhrM3ZR?=
 =?utf-8?B?TUdMYjVaVzBralJkZUtWbmwxYTZqUitvRndtRWhadFRiZlBreHFlUVltK2FP?=
 =?utf-8?B?QXBVZUFKQkdQb0xTOFkrdC9MOE0yR2QwV1NsaVdhS1NsYUNBR1NDOUJxRmlT?=
 =?utf-8?B?S0tZMHB4bnl2S1c4Z1BscmhmMGxteFRTdDZ6Nzl4bng0bDVraEZrWElCcTA2?=
 =?utf-8?B?bStYUk5FazdERDJLdUhvVXJKRCtSQkh5TDM0eVd4cHduLzJPc3NCakZaSlRU?=
 =?utf-8?B?RXRFeUZxUklYcWhMU2NBY3ZmaDlZUE9mRGZaaHFmMkx5ODBiR2FXS1lTZVFm?=
 =?utf-8?B?Tks5M1VPWlZiV0Y0dzNnTm5yZTkreUgzRVBzc2pIbWRxb1lqRzZxYjJ0a0Zh?=
 =?utf-8?B?elNJa3p6NjIzTTRQcEJYRTNFQWFQU0dJbHk2YUNvWVpSV3RzYlJ0OTNOcEs0?=
 =?utf-8?B?ZnB2MlVpc3MyL1hTRk9JS0hneUdpcnU4ZDBZMGVvRWlzdFBLZVJCdEhra0dQ?=
 =?utf-8?B?ZjFBMUtEWDZIb3dOSCtCRDJKSllBWXQ0UG5FNi9ZWmlnUVpUalJLVTdhbXAz?=
 =?utf-8?B?dUNZZHNZc1RiM0dnK3kzU0t3REFRTHhsUmIraVBnRHBib3g2MlBVSzQvNGlN?=
 =?utf-8?B?OGJTelNEK3luRlVhWGdoUitveDY3SHlYemxMbXJhMjdoTEM0OEVkaG1KY1dj?=
 =?utf-8?B?d1B0WDRWc21SRnJjQ0pGNk9HTVNUc1ZLQk5GZ2dNMDByWHdRbFRPVDFaVW5o?=
 =?utf-8?B?UFJWZ0lwdjJJRmdZQjdNOE96SG1LendyK0xEbUY1eW5vcm55ZVpISlJ0eGVs?=
 =?utf-8?Q?T8oSis1zLXR6fsPcf+me4Ck8N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5736cc31-2645-4f36-e59c-08dba85d5595
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:58:22.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnVi7lP5Gj1+9Zo71m08TIeqjDTbad12+GGUVm0rPlwSxdNp81P0c3Zs+PgMGMl2jCbejppzh4EhnaX1olmLpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7923

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> These were left over after a previous pci_sbdf_t conversion.
> 
> Fixes: 0c38c61aad21 ("pci: switch pci_conf_write32 to use pci_sbdf_t")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



