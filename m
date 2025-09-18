Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200DB862EF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 19:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126392.1467975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzIGd-0000i6-DP; Thu, 18 Sep 2025 17:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126392.1467975; Thu, 18 Sep 2025 17:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzIGd-0000fY-Ao; Thu, 18 Sep 2025 17:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1126392;
 Thu, 18 Sep 2025 17:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R72V=35=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uzIGb-0000fS-N5
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 17:17:57 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b13ba52-94b3-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 19:17:56 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by VI0PR03MB10420.eurprd03.prod.outlook.com (2603:10a6:800:20a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 17:17:46 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 17:17:46 +0000
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
X-Inumbo-ID: 6b13ba52-94b3-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVmmxeM1Mze2SbriNnJ9KiR4uhT1RjHLtRMxae6Y9vthiiW9TPldXQOTLNYR2I5h+yS/2WtSDjORyiy7/jcdfDy7QzpxE7v5N3WBu+pKjqipQwNDsJsmI5rWzoAFJTY1c0pOBVZ8eEbmFIImtQwGZRZH1KYIBlR4ZbEQNxT1WcJWUXkrawSBvDOWJzxXLPKgADwKDPEQvfPH5Q2WiNak63ihEoKFkcBHuvlQNqW0R0ha5ipw8AHJpFtZJHkO6m+mrSLhgmx3f+1Lbk0DOq6Mw75NS5XPUOw0VWIbbqT1cIar2fWEsF6ZdFlIHuwJkswt1Z8BYREHHlTlHg7aac7nkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s29UzLn3S0yzMtXZih6lU9rifFrGf4nh6Jcza3sPhM=;
 b=XNg14fD8M/N+BQ1SaZ+BOX6/OW4sp5drf2K014A9XsYp59zT5wkcLk7b6h8P7v+VCTFAFENHtt1ad6cwMeo41TxLqyxPiwSSmDnq86kgij4Mk9ZxAo2wWusvE2OuB0g8m8fqMpSfATI1Xc2vyuLb/YWOH6XSZbY0P/zFaYPkrEBXm6oodIXvD7vCtOJ/ESj5as3Siup7NVZoXIJRj7fy4xhJx87jZCZxCrkKLBbniJ+W/FItLYWcQ0kUC01airjXJe25b41FH3iC+7A8WOZ/zZ1fYpXqH46G0DdFzRBcmMlDfTgzRpr6OOUi2UjorHHIzPkvva/JuMlwukvaawb6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s29UzLn3S0yzMtXZih6lU9rifFrGf4nh6Jcza3sPhM=;
 b=JMMde7Lz3Mxv8UtnAjpfOyIMEIy2hjU44XbplvN6T3ActCJ+O2ljsppXMunVGaDKg+IpUlpLQdHvZHEewkyVF2M3x9V6HQrHGxugFKjCleSr7P0hT+nm8EvqBby6cqqbEFe5bngUPMWJDtZvYlzM6VZNf/CcKTi3N4HqWTyTBRNTi2Ky/B+6TlviQKD9z+2lzuEYpWlFT13166mRxWgQYjWkaviKt5GAZYfEHllQX5fdLJZ51H2dr4YvcqVz7Sl1B8F9DXaYhowTNiAC6qwlv8nSaRQspvR1ZTjc0busrdMnQLac5/M6ph3Qe8gLZFL27GoW2dqo9AlTQa52JY0ZdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2d6e5cc6-15c1-40ce-8742-1b77b32203a9@epam.com>
Date: Thu, 18 Sep 2025 20:17:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <0e1a6339-a4fb-4697-acfa-392168b391d4@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0e1a6339-a4fb-4697-acfa-392168b391d4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|VI0PR03MB10420:EE_
X-MS-Office365-Filtering-Correlation-Id: 31389031-4eec-40c7-ca1e-08ddf6d74973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1FWbkNwSnpSL2x0UU9WYXQrL3F5dkZ1OVBPL2krMWZjVmQ0aTR1dGM1Ym0r?=
 =?utf-8?B?QVBTbjFEbEhqbkR3UXc5Zm9BV3pxTnQyQUlXWmM3Mm5JZU5EanZhaGhVQWdU?=
 =?utf-8?B?UHM5N0k4R0VWeWoxYjU4dXpQbkhwb2dnSnFVZW5SR3Z4Z1NicE9iR01GQXB4?=
 =?utf-8?B?QW51TVE1T0ZqTS9vb0ZWcUZIOVBuTzdJYUhZNnRZOFJEaHBoNmdWSUZzYnNv?=
 =?utf-8?B?clRKcmZGc0hBTm9yckpzYmFhMjNmN1NqL0VGZ0hoamJ6blNEVlduelJ2WlFY?=
 =?utf-8?B?UTUvM1hSVHFpTHNwSTVNTGVXNS9zS0xuWUUyZkJXNXplQzRLblpBSFhuSjZI?=
 =?utf-8?B?UnJrN2xQMTNCcUtBZXpuRm0vM1pVZ1BnOGo0UmxQeDlMWTJOc1JWWHlkUVd1?=
 =?utf-8?B?SnAyVCs3MU1xeHRva3ltdDdBdTVRODNialdMeWpXZGRuT0Q4YjhtUCsrelcw?=
 =?utf-8?B?UGtueGw0TjM2VmRlb2JrcU5sZlB3ZXdWMUNOVmNEUVlDRjFiQ1FPYkJpSStD?=
 =?utf-8?B?THM3YTFHWmVadG54bTFvbml1SGdVR1NXaG1XRnJndnVnOVUvQjhaMUE0TVcz?=
 =?utf-8?B?am03bHVRYWxmTXk2YW5FY1NJcHZEUkdKZzhXV2xQR2pmSFdxL1dSeVd6cjNX?=
 =?utf-8?B?UFppaEJJcWdOY0pEY21ydk5sSTcyS3FydGp6Um5Ta1RVUi9ySzg2RGRKU29W?=
 =?utf-8?B?Q0pBcDZCWlpMdGFpTEZzNHozNzUwUEhqVjVqaWpwREIrdkh1SjJpcktjaXE5?=
 =?utf-8?B?bGhTMnkrZ2tkZFdyWkdyUjl6YllpUW1Id0ttcktyUTdRUDN5amM4Y0VlczdK?=
 =?utf-8?B?Mmw4NXlJUUt5U2ZwS2pGK0xScCtrUjZSRG5PUkYwNU9iQXk0NVRkVUhaUmFs?=
 =?utf-8?B?Sk5FV1pxTnkvbWcrY3FDOUR6cjhxK2ZZSzZIeGJDRWZyNXJTVGxXUVhvSis0?=
 =?utf-8?B?SjU5NG1BWWV2SGQ2dUd6Zml2UFIzM2RTUldJUE9EWW01Y2RCdUdEUjhDZDdz?=
 =?utf-8?B?eC9lZXNyQ3NscHBaYWszaUZWSk0ySmdhcnRNNXRiVWNTMzVHcHhaR2NsTkJK?=
 =?utf-8?B?SnVoWmIxQnZyZVpMa1dNNGM4alNtdDUrdVZ3Y2l3SzViVHV3NUVMTXF2TmRq?=
 =?utf-8?B?UkV3c3NnZ0t4d080eTRWcG1FOWtWRkNZblA0RGZIVVZmYlc0ZnFkQ01obUhB?=
 =?utf-8?B?TE9JcFRSTnFGNDFFUUVUR3NGVURxZTZ3clpxZFJhYTJXYlpFYmJCUk1UcFZ0?=
 =?utf-8?B?RjYrS1Z5N2xZTEZxdkRMSWpnc0pJdEVPWDRXUi9jZTl0dnRITW5iak14d2E1?=
 =?utf-8?B?MFc2WXlnVzVUaGZObG9KN1BBVElCSnBqbk9NY0xVemZGZ1d0Uis1SjBTSXFR?=
 =?utf-8?B?QnpTVERjNUJnenpoR2FlQzVJQU9XQ3c2QXBXVi9zZUZLbFN5N1RzK3pYVUFJ?=
 =?utf-8?B?c2hlYWh1MEx3M0RmaURINXZ2UFZ0M0Rndk12QlpERGo1c2lseU0xT2N1bFhs?=
 =?utf-8?B?SGpYYUVkN0V0dWIybXEwckorZkVNVEw2eGl6OWxFQUVCZXlHanJLbVgxbmdj?=
 =?utf-8?B?YUN6Q0U3dzV6KzFPdTl1UU9pRVU1Wnc3dk93YXJMeU1FOU5vV2RHSDF1b2N3?=
 =?utf-8?B?OGVrNk9lUEh3Vkkza25KVHlNU2lJa2NxZzl1TCs3S0hZWWhZMTFSRWRuY1BT?=
 =?utf-8?B?aVkxanMxK1BIUW5peVBta2k4d1RsY01DVDBjckNrS0NmRDNSUElQKzYveTJv?=
 =?utf-8?B?NWo4dlF0OEpvejBFamErNXRJbjdxakZTb2ZkcWI0WEdVdlpvTm5kRjJJbWd4?=
 =?utf-8?B?QVFrcUN1aEpFelp1Nnk3MkEzM25hM3pJbW96ZjMxY1RQS3FRVU5yTlRsUmYy?=
 =?utf-8?B?QlgrK0d5Y0tXTGpnUy95T0hialFyS3NYcExwd283cU9jbnVUZ3pIcUJ4VGxs?=
 =?utf-8?Q?N242neRn3xc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDlrL0RoUHhmNkx1ZW9zR0hOUjVTSEJvL3krUE1kSmtOeS9yOEVnZTVieU0v?=
 =?utf-8?B?Z2NtdjlHSFBOdm1EZ2Q4Yzd0UXpyZ0p1eHRjay91NFh5bEFzK2xuTnZST013?=
 =?utf-8?B?SEhwN3F0N2UrVUxoamdmU29SWmpFVVplT0NJVGk4cmp6R2hKb0wwTFZPTGVi?=
 =?utf-8?B?aDBCeGc0K3l5M3dhNXlRT0pnMWhJcEtDaEJ1SDg0T2FBUXZFWmVLMUVZNEtH?=
 =?utf-8?B?My84Ty9oNk9KVHJ6bHROUnQyMS8wR0NQUDNmZGptWDhZNmpnWG0zbjcxejlD?=
 =?utf-8?B?RWx2bC9ITlRTcGtHUlhBRk83TzVrUjE2VmN6WFhYM1FLMERCMStVRTk5cnpT?=
 =?utf-8?B?Nm9qNWdraWF2SkV2YnpITjNnd2dpMmttdXRTQnVvTjludGNVSEQ3YVRSVFg1?=
 =?utf-8?B?NlVORFlEeGRXb252YkZSaEs3ekoyOFZMNWFoR1hIc0xHUkFLMlBlV2h1VnE0?=
 =?utf-8?B?YksrdTBOdzVVbmdlZWhxbm1IN2lyYStITUNOSXc5YjFlYko2c2R4S2VhYWFv?=
 =?utf-8?B?NzVYOE5YMXhJbldsSUJlU3E2dHJWSDVoZ1pEeGZmc2Q2dzh6YTdOU01nWlJy?=
 =?utf-8?B?OXNtZmJBU2ZycEw2bUhhTWJDSERJZUF0QUQ4N3lEbVJLeVhqcDZLVHIzQkMw?=
 =?utf-8?B?UGV2NGtMVDc4S1R1QWZsUTNneEREQzZlY2oveXllTXdaV0w2NG8zbXYxc0ZR?=
 =?utf-8?B?QW0vdG5laHVNZEJHOFcwaTZZcVdoRGk4REF0MC9nMHlBR244aTlDUkVMWmdL?=
 =?utf-8?B?SXB0QjVXTnZyK05yTmRaVDJuYVA2djBmRHBBV2FmK3hVWndCV2tucjl2dDN5?=
 =?utf-8?B?RlJJaW54YjFsUXJIQ3lVZmt1UHpLUDduYmM1SHVEckc4QVc2ZWdmSWwwYjJL?=
 =?utf-8?B?ang5R3ZabVluOTZ5MmxCa3ZiQjJjQWtuVjVOZWhYL3BXMWJuWnlqNFp2TDl6?=
 =?utf-8?B?MHBqdWVOOS9WakJxUEVuWGZObDIraStaWElNTHpJZ3ExdGVEWlV1cHY5TmlN?=
 =?utf-8?B?UUViNEhqRHZtMHBYajJSS1FKdFNXU2hoMEova3B1K3ZuZWV3SVZ6MFlRWVM5?=
 =?utf-8?B?Qzdmck9zdGpZRlZacFdKQ01ieTIvWGVZYXB4Zkx0enhqcDA0TFRtUE02RzQ1?=
 =?utf-8?B?ZWFYUjkrNlpVMG9lTm1NMWpNYVJUbjBub2xKaVJzVG5KcUovZ2VoUm5XUzFi?=
 =?utf-8?B?MlBUZFhSOGxpcUUwM3dVTlJpbmkvNVFiRjBMc3E0VytDUHJ0ODlDem1RWHFZ?=
 =?utf-8?B?UEpuZ2hKTDQyamFqK1NzZm1VVzJnM1ZycElEL2VCeXFoN3p1b2hPT3VhYjNv?=
 =?utf-8?B?cERwbDBkN1lCKzVPYVltRkRJSVQ0SStSMEhBSHFJMUd0Vkl6OTBJOGYzZDZv?=
 =?utf-8?B?RU9oRnhpYmhORFVXM1R3NEcreDNCZUpJejI2TExnVjhlUEdObVZ2TGVJOVdN?=
 =?utf-8?B?dkI0eXZVRmo4TWRDVEJWMmNkN1E4UXkvNEx6NWpjd2lPWlpTRlZGanpoaWdK?=
 =?utf-8?B?QmMzdE9oaEhISVJHV1Jhb3IrMFptNWlGY2NYWEphMlEyQWZaV1AvNEV2MTVC?=
 =?utf-8?B?cHVvZVUvRnhsQ3puNldJMlNTRmtReWtvMnN1cmZCSjQxS0F6a0U2bklLM3ZP?=
 =?utf-8?B?bFdBdWZiR0Y4b3MrSVAvaEZQSk1WbXlkTDFaUVpBZkRnR3E1bkM1NEhITUVP?=
 =?utf-8?B?Y2QvREJ4MzZoWkRVTlFYRllCWHZmYjdnY05xeWR5dWgvRWI2eGp1YkgzSEYw?=
 =?utf-8?B?anhtMmM5V0dsNVlqN2lJQll0cTdpVjM0U3hLN0hHUUhDOVlKdzJwN2RkcjY3?=
 =?utf-8?B?QkRVL2s1WnhkWnNwM0VHdjN3NEdZQ3ZhbTBXY2RVVnlSR2FkRnhiakQzc3li?=
 =?utf-8?B?aFZLeEp3c1dkRkxqZ1F0NHJ0RWU3YXRSY3Y2SmwvT2c5QkwxNlRJNE5sZ2pX?=
 =?utf-8?B?TWdoSWkyWjFLTjhGeGpWWUEvaENvRllmR2dmUFBjUUVDckI2UjJuMXErQ0tX?=
 =?utf-8?B?UlF5eUJpV1dTaGx0Qkg1N3cwc3ZTaGgwWlJ2L09nTmdLYjIvMi85RERFVVB1?=
 =?utf-8?B?SlFHUzE3cnNlclJrRU5LVUl2RFlRM0dIK01xaGdmYzg5M0huNHFqaDJSZjJ2?=
 =?utf-8?B?ZlIrUFluOERndXNYcWtXNVBkdVRueWgyS3cwSC9pTm5sb2xCbDB0YXBhOVZL?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31389031-4eec-40c7-ca1e-08ddf6d74973
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 17:17:46.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgzBBqn4U67GF1bEAuMhpGs6G4hPkyvkFL0IjTvNBcT4++Q+Ce1orI4WZnbs6QLZYHV7E9bGtS2dQw6M5qjihoV/JCl9sID7ZDP8WBk7P+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10420



On 18.09.25 18:41, Jan Beulich wrote:
> On 16.09.2025 15:41, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,16 @@ config ALTP2M
>>   
>>   	  If unsure, stay with defaults.
>>   
>> +config HVM_VIRIDIAN
> 
> I may have said so already on v1: I'm not quite convinced of the need
> or usefulness of the HVM_ part here. Viridian necessarily means HVM,
> aiui.

sure.

> 
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>>   {
>>       const struct domain *d = v->domain;
>>       const struct viridian_domain *vd = d->arch.hvm.viridian;
>> -    struct hvm_viridian_domain_context ctxt = {
>> -        .hypercall_gpa = vd->hypercall_gpa.raw,
>> -        .guest_os_id = vd->guest_os_id.raw,
>> -    };
>> +    struct hvm_viridian_domain_context ctxt = {};
>>   
>>       if ( !is_viridian_domain(d) )
>>           return 0;
> 
> This check doesn't check for vd being non-NULL, so this still feels a little
> fragile, even if it looks correct now.

Hm. May be I missing smth., but
- if is_viridian_domain(d) and viridian_domain_init() succeeded
   then d->arch.hvm.viridian != NULL, like always
   (otherwise domain will not be created)

- if !is_viridian_domain() then code will not go further

so I'm missing to see how !d->arch.hvm.viridian (!vd) can happen here.

To be paranoid can also add:
  if (!vd)
     return -EINVAL;

> 
>> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
>> +    ctxt.guest_os_id = vd->guest_os_id.raw,
>> +
>>       viridian_time_save_domain_ctxt(d, &ctxt);
>>       viridian_synic_save_domain_ctxt(d, &ctxt);
>>   
> 
> Just below here we have viridian_load_domain_ctxt(), which I'm pretty sure
> now also needs to gain some check: Save records coming from user space, we
> can't really rely on there being none of this type for a non-Viridian domain.

As per my understanding:
viridian_load_domain_ctxt() calls hvm_load_entry_zeroextend() which
should not succeed if context was not saved (which shouldn't happen for
!is_viridian_domain(d) case).

To be paranoid can also add in viridian_load_domain_ctxt/viridian_load_vcpu_ctxt:
    if ( !is_viridian_domain(d) )
         return -ENODEV;

-- 
Best regards,
-grygorii


