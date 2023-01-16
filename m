Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B066C858
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478871.742338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSUw-00010I-RO; Mon, 16 Jan 2023 16:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478871.742338; Mon, 16 Jan 2023 16:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSUw-0000xu-Nc; Mon, 16 Jan 2023 16:38:14 +0000
Received: by outflank-mailman (input) for mailman id 478871;
 Mon, 16 Jan 2023 16:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSUu-0000xj-Ex
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:38:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29716d01-95bc-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 17:38:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7361.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:38:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:38:08 +0000
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
X-Inumbo-ID: 29716d01-95bc-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRG5BTRntx99+0PjID1N62loV03PdQoiW7aBYYByfnZLk1NwyWqfGVSoC3CT2EtCUW3VniPlhVhPbul2n5r7StH8GKsvbk3Q3cbcegpH8Q6b5Oqr76PCPda6Kd54EDFWEaDG/AGd9N/eamB0T/11rvwzks+Fj0E2HP8fKhY1HiZgczyF16hiGYoFncyCyKWd/dwjhKtHHwirifX2zVaj5+6OHeADEYNaD6TFMjMBfoPHCkJoiEqrHWdvuqEtOjcDtgPRN9G+icGFDHDpSSqoFiZJsU7A4vGjFlOPvDYYVCua5ZG8TnqkDZ6N7BbnpX/Yzdnx0m7/dZYBLscrY5kFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgEbC9EL1hsYlCUMz/E4Jjnqg9IYKBLHy2GwFHXaIpg=;
 b=X2m1pYATA7o4bSRVZabxu1JXi4FyOQ8zeovxzuzyPyHUwJEIeoLsUYJxdtdQ8dxTh7j5tKNPMk6i82llkI9cTTQqxawwjzSlfSJbGsfWmD1nH7YvVBokZMiuw3rZ8osQBAZw5SeBNri557llicP/3y7kTkca4iYpOz/Nu2c+el0Oz++dzERV4NXguk92C1F5KpmBzG53tskNh6rfI9SLQlD3SM8oN69oFQT2evNOTMq5kPnYK1B9B/UuoY7pQjcahAS4QN7wk3HITUrmKUNrpIgVITji+2qPW2L0C86wOO/bdNu+76VpkQ4OtY4cBz6uYvIVAKZWxcJjEPWr1E/faA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgEbC9EL1hsYlCUMz/E4Jjnqg9IYKBLHy2GwFHXaIpg=;
 b=aHefZXQiwk8hlUp4bjG31nd+1uJv+ZAu4YfoiUFNdPcFrLCWEICnJWdvF4KLO2+3Rj9Je6p0AjIFFkiI7COoWUVp4vieyDH8R3wH9hR+C4wLEroMlbKI7cNnUB9/SmTMZQ+Tcz/nWU30QWnWYfQz7PeKlj825+OM4y85dc4dKur8kIuiHUoaEGQIU8/rxx8kCf/X3ytgfQ3QbbElayZpOkC6qFt9/9KxOueLI0NeFkvkcsCk1olWCq9T4C3j+1VtxiwN9oCE9wIunLQNRu/GgcLQKqvnv0BHiaFkc+KAvmrscJTJdqyNEUaMBb8IvrCCanxa1mdO00Tth5s81VdVSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69b4225c-1e48-5949-20ec-41106a8ccc0f@suse.com>
Date: Mon, 16 Jan 2023 17:38:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/8] x86/iommu: iommu_igfx and iommu_qinval are Intel
 VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116070431.905594-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 507e8b5a-5da6-4b69-5592-08daf7e00cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7gW7IW+QJ/YNRAnlVCwlThPh7xjhZ2l1xC943huPXAoEGVEtPifp+KbEkITh4Luq4UxZdta6trY4g9suLZxESL82DM5iJD5A+g6abZh2IP4726uN663a8ufJZO2X95KenUA977U2CB4xrxmDY5IrVoApzXKo1wiuW6icTNMAgWSKsGOfVnWkm2xFHyVM9p/YdUu5yB2hpmGm9oiiTlwUFuu4tjg9jVCe55KY41MNClyEDAqVyqi0A+4QPK9JsQT5aC3rQhN8YZF1E/0uxOnYIO2esx9Az67qe6PUnuszDjKHvVUlHhZWrSTVdSuT54YbccMQeZ1ypau6wKlavbqjK32wjb59QmKq3vbU/s5VD0x9Wc8ZYeF4hQ3SFio/Y388Jwm4JmFSQlCG279Mm32bavjZgoH3DsKpdHYcXbtMiboFCsz/jCwQBJa164XC5YGEcvTD2zVNRGb4uPRnqs6u71usA4wpiyYHcfrIMZFxnVANKuhPn+58vl6j9ZpHRy3z5Y4v9T5AxMcHKf6RJoGJHYcxcYNeRV9290RSHnQG89XyatRaDNSFxAvp0m5f+nejbwi6tEP39yTSPCPzmfjjiUWGcxS60ZaD2VIoFDnqgcoMgBTssx66eGoavXHwC5f/hJOgEg4D5FmJGPh1iH2ZSdSBYnMz46CLO9W4yaF638GXqQD1kn3tXRDZgEWydOJJ9erCApyCgCMr4CdEX0kjFtyGRObgdxuiTL6hjIQ7iJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(38100700002)(558084003)(36756003)(86362001)(31696002)(6486002)(66946007)(66556008)(4326008)(26005)(6916009)(66476007)(8676002)(186003)(6512007)(478600001)(31686004)(54906003)(2616005)(53546011)(316002)(8936002)(41300700001)(6506007)(83380400001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpOdy9VQ00vLzFOMERDRFZuM2RlR0hSQWswa24zeHRXcEExV2FjRTBwQThP?=
 =?utf-8?B?MnBCZzV1YUVDRmY1VEwybTA3VzhNL3dhelNvTkltbmR6N0JXU1BDV2FsUzhj?=
 =?utf-8?B?bUdDc1hjcENJOGZSMSt2YU5vNEtNd3ZjNTlQeDgrdVBJTVRPajdNd1I4REtk?=
 =?utf-8?B?WlRxUGh2akUwb3FHVkdGbFpsS2UreU1sT28xUjZLeXlPdWRuZExwWFEzZW0y?=
 =?utf-8?B?MVlQb0V1MlVlMytkU0tTNldWV0NBdWF5b25MUDFVTGZrMmViR3dOZTdJM2pD?=
 =?utf-8?B?Zzlrbzg4YU0wOThMTkRBYzluOW43YjdISitqaXg2enNreFN1TndnV3p5TmlG?=
 =?utf-8?B?V0wxUDMyV0JFTWFUenM0VEwrV00yeC9xRTkyd0VjeU5XZklMSXRJSEdlMnBS?=
 =?utf-8?B?eGNYT3QzOTFaQzVxZFlEWkp0YVQwL2Z5cVg2bElid2hOanEvTjRpeDVMYzlR?=
 =?utf-8?B?NGlwVlp5aHRpOFR3ZWhxbnM0WjdpeFQvdzRjYXV1d1pyNDFZRnlSdjFmNDUx?=
 =?utf-8?B?cHhVSzJrbkRUdFFvOEd0Mi9yR04rZENqRXdYcHZSMmgwaDRVU3RWM2M1dXk5?=
 =?utf-8?B?REpVdnd6ejVwbDA2b2NJaElkaTlJQUZPeFVqWHROTEwrVCtZWlBXdXNwZUd0?=
 =?utf-8?B?cFpiQWwzU09FbWlxQXpNSUlvSmlBMkFaNi9tbm5VYyttdG1BcXFIdzI2WGlj?=
 =?utf-8?B?UkVZVmoxVnZVcUJXcFBQb2pMU3NidWs0Y2IvRHVWbHNaWjdYOUlNWExVUHhn?=
 =?utf-8?B?OFpLTFhjendDeVRuVXFWenhSK2RlbWJXM0FMTjUwaWpLY3A3QzNja3VBTnhS?=
 =?utf-8?B?M0F2ZTJYSXYzdHo1TDBJbmNDSTd2MXg4SVVyZzgwV3RpOGJCdGZ2Vm5LeDFO?=
 =?utf-8?B?U3drWTdwbDdqVlAxNTEvanRYQ29uWTJrTCt5eGZMcUFoTW9mS1JaYUVxWjVu?=
 =?utf-8?B?SkhvMm13OW1jU2NxL0oxa1F1eFcrL0RoMU8ybk5wbEM0QktRZ1pWSXBJVnhT?=
 =?utf-8?B?bFR5bnZqZWNqOUczWXRwRC9KaFlHSy9TeEdsTmpWT3lkWVRQdDAwR29IZTlG?=
 =?utf-8?B?Q0FFQzl4VjNUcEk4TG9CZjhPdThodGNWS09lcjE3QjBXUzR1cTBsSEtRZWNq?=
 =?utf-8?B?K2FPZGxPckdacFFDNFRNUmZuMHU4RXhiOGhTQmZ3V3NkYm81SmM0ZkxyZmFt?=
 =?utf-8?B?dHgyUlJtM1o5YjBwMUIzVW8ycmt0bDhlbHFXUFBKMHE1Zi8rZ1lJQ2FLMkZT?=
 =?utf-8?B?Ums0eDByWkpzYWxRUTM3ZnVFejkzWURHVVk1Q0MyUThpdUFwQzhtajVVWktn?=
 =?utf-8?B?dVBhY2Y4Y1lobWFFSWpwWmZXcVp0VXJjTG9Xam9QNFRJYnl5SVA0YVhBaUlG?=
 =?utf-8?B?cFZRelhNZDkxaTUrT2MwYVZtZTRkL0JBUkZHSnBpalVPclZZckNsOWRBWFBx?=
 =?utf-8?B?SlpmRVFwaXFWYXhoYXZhWmpNc3ZMK3U1YTV3RFFFL1lwOUVJYWo1cDg3dWVK?=
 =?utf-8?B?UW91OStMb2xDT01Udk00clVtMHN3TXZqenlHMXFRYVBmSTVlb00xR1paMmZm?=
 =?utf-8?B?cC9ReWxLbVpHTE9oOHRQMXR4a0tJYWpYd3V5ZnZTYVFNeXJvSFlVd1ppYmNO?=
 =?utf-8?B?ZUpwdVBFdFJzVW0wZ20wMG5KQUM4WmVUaFFXVkdobXBPUnJPUFhpL3V1MzFk?=
 =?utf-8?B?WkV3UzRCLzhNVGkzTzdWTk5ReEhWZXA4YTlPc0NwQlJGSFlBMnBaY2lmVmdK?=
 =?utf-8?B?V0hxWWRTOHVOeHc5OW8xaEloc0VRbU9Bc0R0NGg3djFDYWVHVHpZak5XMXJ3?=
 =?utf-8?B?VDcvWmdmaGtpRzJHZ2kwK2MvcWNhYklEd0I1czFtNmtQdldjM1hSZXRwZzBq?=
 =?utf-8?B?UWlyYmVFVkdlVEMxOThqZnRtMHNLQzlVMlcxZ0RGU0NyWTlPby9EaWJUUnFt?=
 =?utf-8?B?VUJhSVZiR0N1dm44RkhPYXZSczUwd2lVRVdzS1F1MHNrSHcvb2hkU2JNMHJV?=
 =?utf-8?B?WHZCZE1BQ2hEbjFrWnZpNUZzOHBwckFUdVFIZlpUWjR5YlZldzNpbjhuRU01?=
 =?utf-8?B?QjBhQS83dG9rTHJibjhIVkw3SVQ1by9Rd1lRUTlOaHVJWkFOMXgyMFZhMWxZ?=
 =?utf-8?Q?5T29ItD777OirmeoyvjC4K8UF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e8b5a-5da6-4b69-5592-08daf7e00cd8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:38:08.8460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oPVSzBhxO+GDNBvyTrsDdkCfBFtD3+MkEnkeAn1aDvEQ8xqYN9wkYDutMH+IYVZsajjeArW7NmtuYJJT2+hGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7361

On 16.01.2023 08:04, Xenia Ragiadakou wrote:
> Use CONFIG_INTEL_IOMMU to guard the usage of iommu_igfx and iommu_qinval
> in common code.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



