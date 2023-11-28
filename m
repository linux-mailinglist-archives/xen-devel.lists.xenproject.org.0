Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E77FB8FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:06:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643031.1002874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vuw-0008Un-5y; Tue, 28 Nov 2023 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643031.1002874; Tue, 28 Nov 2023 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vuw-0008T1-2R; Tue, 28 Nov 2023 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 643031;
 Tue, 28 Nov 2023 11:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vuu-0008Sq-Hx
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:06:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224cb7b8-8dde-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:06:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:06:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:06:07 +0000
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
X-Inumbo-ID: 224cb7b8-8dde-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oL3MlrunuHOzwpSyhG0X/PCdkf5M4mI0H0QcyH2oW3JC7iOZhi5usBuTFqSQG4C8/YEO5OpvKBSZfqLY1bF3KEvb1uywVR3VxvZ6UOIIzbO3cx+ao4g1akzNwI+QQ7erm00Zp0NU9nnE882UaY8NAaQhvNOAKKxRFhwje5+1VDgUAR9HxMXvS3aJ68d3TDlbmMoas1Ij4NjsZqYC+OU0Y2CatNHrb72RCz3CNxyfe2mEdcL4uCGtodjBEwcxPCUSPtn2nv3hfbNq5jJFQTSnGOV1ett1d/JUNXgnIPfPli8j8QR7DaVNqpl5TcWJQLVTbetKX1IeRVZVMGepgCITDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tCzUFHVVtZFMv3PlvJkQSJbk+2DfNWvtQzHlBmgIuQ=;
 b=Vi47j5CV7QJp11BWu1EnmoIq3psCv58hl/zp6IAuLrhEZ6HkTfQmelT4Rj+FFdy94aQDGPg21b/Hl1Lsj08WZAFW8aAuxhsg+CgllHsDLzdl3guniR0FTip54DrC8iTCo8r8n46XjDflc3hyRR2SAHIxrPpguivqV21/Eou/sQyMhMDJQVBt+pRZZUGLI9GyiOD3DdVBnSh25AQs3z9N7hs0NtIqrV0QDaoQzb09pMbsl5XF3DhZM5u54sUSi2VTJL/nQdBiUSPwqvGWM0yQ6+/yid3SnnCD1HnpSsR/Srs05RSvSvyfLI998SPCOqIcg24bgPyhInaKZZb0u7HBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tCzUFHVVtZFMv3PlvJkQSJbk+2DfNWvtQzHlBmgIuQ=;
 b=puPEj2efDnKt2JkN9RCQqUr0W/inooGIJA0TsnuWr0vRbOXT3C83Qe/wOOgVYHIQIQqwpJeFHvB5mNjNyHZllyrJITaBQbkuW8VH7UQhv7CuJpqNnsJgpCTUIpdO5+UC/oR0DFgr5HAIFR/HmEjYbywXZ3ev1Ja1EODXwiql4ZVaOQcuOLRB4vIGy2cjFOKdzRaWuevp94tYxdKW+TtaGhb0GkEp51IqD4Hl5MFeb4M6EAu3YkB90BCXta8r8bUklJQNPn6a8PvmHbmLoA3v/llWs1QmF4LLc0jHE0a7d7HtG69GesmhlcaG1VAV7GZzZ+/JAyLSJ22ifxe6pPwvDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2050719c-6a16-410c-b057-eed20733ffba@suse.com>
Date: Tue, 28 Nov 2023 12:06:06 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/6] x86emul: support LKGS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b87a92d-5e59-424b-ec6e-08dbf002053d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zYtZpJyx60aAbeFSHjUfATBObixXMlD1SW9ESTYicFsIqPO8e38nZhpdM3mo3V/8krKilZag2/HmcpbIUf2uh0MPcgm521W6vw43rQbpn67eXJaXKPw1GaCNRcYCnJQPAP5paTAz7brpkT68aaM60LrFmXHLApWeoUQYJhVKgDdiCKligLrULRS957WqblEA1ruKJNjL8FKLXwWJJ1f99VgBqZs/eP8WnK9KcVhaDjwU1LJe4SL2QtRoVtcHFBKfw5OtSk0QhybBPZjIux4NaDqD1eh4JQCL6qnz1A2LiAXUJuY3M7wFArFNDUkKMyS1jcX3XNCeMnkqPhW67q8yE5FJp4CaxcKyIHf3A+dXwVCDyuVsALYMSuAezvHrJnIW1b3GoxN1f62cp9+Sad6unIdz1OFfhsqXKTLZpDf9CO1VmCCHv4sco0Ur+6+HUn+V4Ci8DsUiNyVfclWc/okwAXZpgEF8eiTmSv1EB7WbQBtTZPiiMDO04t0hm+nHmO5lUKmieEPGho/ZL9r+/JpjWErD0PyZI/lVryQYnLY3B22ZlcF8TRG8WKSnkr+I2pB/dAJirWkaYBnLSbdpQFamuo0COZ4H0RC67/dhSMngz+Z/2eFExTZ9b4eDXDY2hsLUqFQEEdV6WreutGZia5n5jQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(2616005)(478600001)(6486002)(6506007)(6512007)(38100700002)(86362001)(5660300002)(31696002)(36756003)(41300700001)(2906002)(66946007)(83380400001)(66476007)(66556008)(316002)(8676002)(6916009)(54906003)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxob2tVMWM5QU5LdXFGemdNTWVMaHhKWjNidjZKdXhQdzZ5d1JQdXZ1NjUy?=
 =?utf-8?B?SThoU3haeFBQbElVdHZiUnRrWHUvZTZQcFlMV0Rkb3FpZXhTTnVhV1FTNnll?=
 =?utf-8?B?dXU5UXNvTng0d3o5ZGNVVzBVQzhTSytEMGJJYUNpNHArN2Q2OUxadG1QZ1Qw?=
 =?utf-8?B?RnZuMEV3V29hYVpiK0RLbWYvSXdmODdPWkZMYnpHS1huOHh4Uld1QWRuWm9u?=
 =?utf-8?B?RFdKMDE3dDlNK1pmYWM0K2JBY1RBNHB1YTNoQXJIaUNhVHZ5SlpxeVpDNnZR?=
 =?utf-8?B?bTdMTGhpWE5oL2xZSG42Q2hCUTMxQTZ3R3NzWGpZdlZsb0lZQ0orZzB5Tm1t?=
 =?utf-8?B?dHo4b0dtZGtSUVk4TDh4OVFzSmRrbEZCMnhxN2cvY1FyRXk3UTdEWUNHYk5p?=
 =?utf-8?B?eGR0MTIyNkU2SmpBR05yenVWdU1zQTFzNVprSG42ekF1ZUdXUVRsMHZwWE4y?=
 =?utf-8?B?d3plTFEyYVQ3Ti9qTlc1clpxUEdENDdRM0JaZGgxNE83TXpnUlF4bzRmb3lV?=
 =?utf-8?B?OHNnUUNWeGs5bmhEMzVGNmc3bjY5OXI1MXBCN1c4VHhOTHgrczJla1pvWTBq?=
 =?utf-8?B?b1V2MDJ0UWpBWkhBbGdlUnUzUXlPeFlZTWxkRlZNUEkwQnlMTG5LMW0zdzFX?=
 =?utf-8?B?dlNBOGtuLzBqcmUwdHF4Vm1OVjhuNkdFRXlRbkV2YmlVOGlxRThrR2NaMFJC?=
 =?utf-8?B?a2RwZGNJRzVjNEhBTWVad1pEd3JjWE13V3B3YThWK3V3Wm9UQjBWWkJacW9l?=
 =?utf-8?B?WnFYWmw5VHBocUtYemJCbkI2aFU3THlJWFZ6SlJ6UUdYNkJTYWRhZHBSZHBE?=
 =?utf-8?B?OVExWlROVDJOd3F3N3B2Z0ZIRWRQT1BRY3A4TXd1QXBlMWhXcE4rN3ZCQyta?=
 =?utf-8?B?eGJSa3plWisyRmhDZjFnTmVoRFNzeWhEOURvcUxLNUw0R05jT0YvMnhhSWlz?=
 =?utf-8?B?SFNJVCtaTWlVcWdXNU9CWVAvd3MyWjVXMzh0MU9xajU4WC9zTlllZk9GR2x6?=
 =?utf-8?B?cDFPckw4cHZHWDgrb2F5V3NNQUpxVUo4cnllQk9hbHNNb3UyMHZ5RnZzTktQ?=
 =?utf-8?B?VG9HQUtvUGJrdWJUNmRqUnd1RVhCT2RYWm4wMTgzYkJrTE9zZVdyVGRjYWdn?=
 =?utf-8?B?NWpBQ0ZteFVxb05nYThoK1p3VnUyVWlJQ09kbXBOK1BnYmlOdUd2RCtPUlNl?=
 =?utf-8?B?cVdOeGk0RUl0eFY5bURwakZwOWM3bTk0SUFPRFZLS1pZZE1Jb1luMU1PN2Rl?=
 =?utf-8?B?YWQyRGQ3S05FVndqdFFkZVU1cFg3Ym1aWVFxVEpCNGd2dFMrN1ZHL0hkUDFi?=
 =?utf-8?B?bUxHQUlEYitSSGNhMDVSYUJSY1lMUjhRdkM4OEQ5MGVISXRHYmlTUnk2bWZ0?=
 =?utf-8?B?dGRBcDZkcURiQnIxMldERGNrWi9aekpEUmNwM2dQVmdoaVduSDhPczd1endw?=
 =?utf-8?B?V1JORW1hS09ZUFVISU9PZnY0RTYvTmtoYmFMUmtQak1SbW40M2dxM1MxeC82?=
 =?utf-8?B?Y1p6R1RQSXJrWjRXUDJJUlpLQnlxSEdBcGVZYjNVRWE1WFlJNmRMUmFUbzFo?=
 =?utf-8?B?dFhTT3ZrNFAzYTJuNHBmbDlsMkNRWkFrSHMvUHE4amxSTlkxV2diRkM1cUVw?=
 =?utf-8?B?bTlwTG9oYXRRQWpOZ0J4Unh5dFRMdkFEaFlzSWlpWTE1ZVRMVk9OV0RCc0tQ?=
 =?utf-8?B?cTVzOEloRmo1REg4RDJVN2ZJTjhpcDdONFlCUDd6VVFNT2lINk4vUXJMOG81?=
 =?utf-8?B?V1R0RG9HMW52anF0czA3eGd1ejFqeGpwbDdVcjBOR0lBTkNlWWtKbFRXWkRj?=
 =?utf-8?B?U0lqNEpLUHFQeDRpNS9JemZNb0NsRnNucEVJcW5mSFpSeGt0TWhaZ1lONU1R?=
 =?utf-8?B?bG9SWGI2YlFnZUtzTnJacGIvNHRuNkVIWjJwMFRsM0lHdi9iYlIwb3lLdGVv?=
 =?utf-8?B?VnBVRXVqWW41Wi9EZjE4NjIrL3czd25yZ2R5ZmVkY0psR01CcXQ0RXZJT2Y1?=
 =?utf-8?B?TmpFZGVONnpuZUdPMkVXaGk0VG1oTGpvSE9NK0w0dXI2ZEpzckY0QTVsenN1?=
 =?utf-8?B?WmZ4RWw3MzhBUk55OHNxVWE2Yy9GOGsxWWtncFNNaWFWaUloL1Npd3BVb3pE?=
 =?utf-8?Q?+ocn3Cb0tHl4OwQyZM4xPGm7g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b87a92d-5e59-424b-ec6e-08dbf002053d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:06:07.2483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fzMLgQg626sMxPug5uDyRmIGujOMKauzXDK1WxZBUDwdw7YGRf+81H/ok8QHxzdaO9+4YoFsu2ZrQ6O+i1/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

Provide support for this insn, which is a prereq to FRED. CPUID-wise
introduce both its and FRED's bit at this occasion, thus allowing to
also express the dependency right away.

While adding a testcase, also add a SWAPGS one. In order to not affect
the behavior of pre-existing tests, install write_{segment,msr} hooks
only transiently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of ->read_segment() we could of course also use ->read_msr() to
fetch the original GS base. I don't think I can see a clear advantage of
either approach; the way it's done it matches how we handle SWAPGS.

For PV save_segments() would need adjustment, but the insn being
restricted to ring 0 means PV guests can't use it anyway (unless we
wanted to emulate it as another privileged insn).
---
v3: Add dependency on LM. Re-base.
v2: Use X86_EXC_*. Add comments.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -190,7 +190,8 @@ static const char *const str_7a1[32] =
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
 
-    /* 18 */                [19] = "wrmsrns",
+    /* 16 */                [17] = "fred",
+    [18] = "lkgs",          [19] = "wrmsrns",
 
     /* 22 */                [23] = "avx-ifma",
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -326,6 +326,7 @@ static const struct {
     { { 0x00, 0x18 }, { 2, 2 }, T, R }, /* ltr */
     { { 0x00, 0x20 }, { 2, 2 }, T, R }, /* verr */
     { { 0x00, 0x28 }, { 2, 2 }, T, R }, /* verw */
+    { { 0x00, 0x30 }, { 0, 2 }, T, R, pfx_f2 }, /* lkgs */
     { { 0x01, 0x00 }, { 2, 2 }, F, W }, /* sgdt */
     { { 0x01, 0x08 }, { 2, 2 }, F, W }, /* sidt */
     { { 0x01, 0x10 }, { 2, 2 }, F, R }, /* lgdt */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -680,6 +680,10 @@ static int blk(
     return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
 }
 
+#ifdef __x86_64__
+static unsigned long gs_base, gs_base_shadow;
+#endif
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -689,8 +693,30 @@ static int read_segment(
         return X86EMUL_UNHANDLEABLE;
     memset(reg, 0, sizeof(*reg));
     reg->p = 1;
+
+#ifdef __x86_64__
+    if ( seg == x86_seg_gs )
+        reg->base = gs_base;
+#endif
+
+    return X86EMUL_OKAY;
+}
+
+#ifdef __x86_64__
+static int write_segment(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    struct x86_emulate_ctxt *ctxt)
+{
+    if ( !is_x86_user_segment(seg) )
+        return X86EMUL_UNHANDLEABLE;
+
+    if ( seg == x86_seg_gs )
+        gs_base = reg->base;
+
     return X86EMUL_OKAY;
 }
+#endif
 
 static int read_msr(
     unsigned int reg,
@@ -703,6 +729,20 @@ static int read_msr(
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
 
+#ifdef __x86_64__
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 )
+            break;
+        *val = gs_base_shadow;
+        return X86EMUL_OKAY;
+#endif
+
     case 0xc0000103: /* TSC_AUX */
 #define TSC_AUX_VALUE 0xCACACACA
         *val = TSC_AUX_VALUE;
@@ -712,6 +752,31 @@ static int read_msr(
     return X86EMUL_UNHANDLEABLE;
 }
 
+#ifdef __x86_64__
+static int write_msr(
+    unsigned int reg,
+    uint64_t val,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( reg )
+    {
+    case 0xc0000101: /* GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base = val;
+        return X86EMUL_OKAY;
+
+    case 0xc0000102: /* SHADOW_GS_BASE */
+        if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
+            break;
+        gs_base_shadow = val;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_UNHANDLEABLE;
+}
+#endif
+
 #define INVPCID_ADDR 0x12345678
 #define INVPCID_PCID 0x123
 
@@ -1345,6 +1410,41 @@ int main(int argc, char **argv)
         printf("%u bytes read - ", bytes_read);
         goto fail;
     }
+    printf("okay\n");
+
+    emulops.write_segment = write_segment;
+    emulops.write_msr     = write_msr;
+
+    printf("%-40s", "Testing swapgs...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
+    regs.eip = (unsigned long)&instr[0];
+    gs_base = 0xffffeeeecccc8888UL;
+    gs_base_shadow = 0x0000111122224444UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[3]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         (gs_base_shadow != 0xffffeeeecccc8888UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing lkgs 2(%rdx)...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
+    regs.eip = (unsigned long)&instr[0];
+    regs.edx = (unsigned long)res;
+    res[0]   = 0x00004444;
+    res[1]   = 0x8888cccc;
+    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[5]) ||
+         (gs_base != 0x0000111122224444UL) ||
+         gs_base_shadow )
+        goto fail;
+
+    cp.extd.nscb = i;
+    emulops.write_segment = NULL;
+    emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
 
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -86,6 +86,7 @@ bool emul_test_init(void)
     cp.feat.adx = true;
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
+    cp.feat.lkgs = true;
     cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -741,8 +741,12 @@ decode_twobyte(struct x86_emulate_state
         case 0:
             s->desc |= DstMem | SrcImplicit | Mov;
             break;
+        case 6:
+            if ( !(s->modrm_reg & 1) && mode_64bit() )
+            {
         case 2: case 4:
-            s->desc |= SrcMem16;
+                s->desc |= SrcMem16;
+            }
             break;
         }
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -589,6 +589,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2853,8 +2853,35 @@ x86_emulate(
                 break;
             }
             break;
-        default:
-            generate_exception_if(true, X86_EXC_UD);
+        case 6: /* lkgs */
+            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
+                                  X86_EXC_UD);
+            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
+            vcpu_must_have(lkgs);
+            fail_if(!ops->read_segment || !ops->read_msr ||
+                    !ops->write_segment || !ops->write_msr);
+            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->read_segment(x86_seg_gs, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.orig_val = sreg.base; /* Preserve full GS Base. */
+            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
+                                         ctxt, ops)) != X86EMUL_OKAY ||
+                 /* Write (32-bit) base into SHADOW_GS. */
+                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
+                                      ctxt)) != X86EMUL_OKAY )
+                goto done;
+            sreg.base = dst.orig_val; /* Reinstate full GS Base. */
+            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
+                                          ctxt)) != X86EMUL_OKAY )
+            {
+                /* Best effort unwind (i.e. no real error checking). */
+                if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
+                                    ctxt) == X86EMUL_EXCEPTION )
+                    x86_emul_reset_event(ctxt);
+                goto done;
+            }
             break;
         }
         break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -282,6 +282,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
+XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,7 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.
@@ -332,6 +332,9 @@ def crunch_numbers(state):
 
         # The behaviour described by RRSBA depend on eIBRS being active.
         EIBRS: [RRSBA],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))


