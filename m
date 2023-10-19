Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587BD7CFEDB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619499.964663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVP8-0008F2-QA; Thu, 19 Oct 2023 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619499.964663; Thu, 19 Oct 2023 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVP8-0008Cg-MI; Thu, 19 Oct 2023 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 619499;
 Thu, 19 Oct 2023 15:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtVP7-0008Ca-96
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:57:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d20a05f-6e98-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:57:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 15:57:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 15:57:39 +0000
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
X-Inumbo-ID: 3d20a05f-6e98-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCXIDnGCcUqMnj88Cp+ryPIigWFsvFzpA7roB9tD8jXEGgTehYMM5fnegAUJLYQga6m7bJR+ONVH6yeNPUXm1Etr1Ji3nwd8+oq8qztNvg1DosJx01wTsfZ0IdXoVtvrBMjMRLx1WUlCdC2+/rQ8odqqwmFuLrk5IcW80dUTMpQBsVyg1eOkfwKsN2TyWZrmIHuxJktFQySptXWjJzEm+ZUR3mFYV+uc9zGNRNiGTHOSuEPkz2EcfkuJ/CmOaP9hiJw4KFH1ZsC941Idr772ScmFdxVyLHeISqm7x5glGNdXu/vH5FA9gNkVXahAGIMAXsVc1H6sfbDgHSBlZWQHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paUzkZg44djMz3PJhmxQsfRLR+/UqD5sbLMmziOv8bs=;
 b=asF95lK4ARMXdSqnXq9X++7lZBFphTgzw09zF7YutW3FxtxJAkXQeWkLOOGM4eYEwR+re6KO+vLAzxJrOrbH19GC7xh5SO+BLiyw5kr3AXAoFHugdpjuc3YGDFkaxt7F9gEl1RuNOVQ9hmOooilVaowtiBv0yHxXUtzD9vHKtrUkUWkZOI7XqBYlEJ0jjpiw5SQCQdJ4vFTF+uymo493x+ezKWge93b4mEqNByUFFeCgeMomzQ1XjihMryGNZFKxPG/sqQjJFz0t2AnE0oI6mxclp6HiDQfYdY78qOiTXOv7hgQPgYdcjmv+pWXa3YH0iht4sWh/PyXki9FSKs95Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paUzkZg44djMz3PJhmxQsfRLR+/UqD5sbLMmziOv8bs=;
 b=Dz1uze1yZAoaTlblqt2vVPjQk1gwsh5ptShzA1B99qeWe+EYfeBITeSOoiAb4aWiagKO7enm+ZeEuiP/zLd4inNIX55Xv0Q2WBznZ5quT1HiwHTPLePbGL5rGVf/IAI+g6W7B4qMKTymaIOPkFjCPgwnwIoT1XR779bHgHLZ7pacpD1v6penoliIFEBuik6OjXJC+HmK5K8qVTkxBhg3olH9xMudCRYLLqEO591oi+TE+DDYTBf2xVTJ6HiYmNm/QI1ucnFcS6WGPUJ4Kd6xQv+hSiGDWp7hkREqfPr6q52gFoPVjN5ddp+AfjkoV61cBslOjcxyDOspVIPUrIjkAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
Date: Thu, 19 Oct 2023 17:57:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: 649d26a4-236b-4922-e801-08dbd0bc1ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mjFfGqV3PVnZYcDIdGEn0/0BhpTZ16HNgWdcNuL5mgUj3S/XCFiDeykqRlhgx6VcC99eI6Rd97hNNdO0p0eh6CoNcgIlNMltLvqs4q3m5+9ho5xXbNnO0iOQAnVMwXbub2ygyMxzUUZx0QVVjEih3MbXoikkSnr+KlOwZ6lLSPrAy+PPCHI1Uc/Agby6kAtCLZMDSvNNeOgM1VoNXcM1egkKP+YeoH/0J/fEG49l/InN+NQrXjvCQwCw9kJAXqUsrVMuPru8nvdb73GybTy875kLDLgsQAZu8Ch3Z3c+/vcwnej70GXpzQ/CE1eRutoFHkdtctDCP0Ed3RDbUeGlCYOSpiciY0SpWVhPJZ3I5JGYEAyghGSL3VP4o/qW83vuGs5mBOAk6q2Jc1nk4Xgeha1Gj20ZszZyG9X9/s3lepGRFSeDRHPcwFVUfty8qj8SgjH+ghKBECgbj17GZFGeneY6Ylk98FIB5/808quTSdl+IcWDsM/C4fo8haY94716WtDHErUQ9tvMMn//xU/tcFvFBGofNzwJMiJo7acTfIqoL3imh+JGTMkO7u2uj3Deqs26CRpzLQdNsgLhtlVVbZPpxro0fGC6eoFFNHLzcKRLbXRbB9WQivI6VDnv85aR5djnukzRru3+GMcqq18xyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(26005)(6506007)(6666004)(53546011)(83380400001)(41300700001)(4326008)(5660300002)(8676002)(7416002)(2906002)(6486002)(8936002)(478600001)(316002)(66946007)(54906003)(6916009)(66476007)(66556008)(31696002)(86362001)(38100700002)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVhaa1k4SmVhSGVwd1YrS2c2SXp1eWNaMXhSZDc4UWhLdHdPdmwzcHJWOGI5?=
 =?utf-8?B?ZENrMlpDSGJXZmxQMHBFY0RkZ2M3ZUgwNGtqdG1YQzMzRHUyS3gxWFdWRFg5?=
 =?utf-8?B?NW5GUG5UT3dCOHhoRksxNGpCVmt2VXREYVlSVU1rRVd0NjR2V3VxZzBjbE8z?=
 =?utf-8?B?eUZ4Wll3TXV0ek5XTmJSME8yQU1Icy9MRExMWTJyNVAwTFdYTGRoVEtZWjZq?=
 =?utf-8?B?aVJ6dTFsMUt0NjVXbFYyVVZuUmVJZi96Vkp3WXRqOW1FY0RPbkdDMEV2ZldD?=
 =?utf-8?B?Q2dBTlpPRVZSWFVPSGZ2Yy9SVDloclZpc0E5R0FJQzAvaU4xTjNlTzlhZmdQ?=
 =?utf-8?B?VEhNUEUzTm5ZVzZVUmk0WExGbzU5eGs1ZEpnV21OUHVRMzNVeWJjbDRyVTJV?=
 =?utf-8?B?MVVxSHZ1bjFreG0rcnNGU3AxV3NQSVBTVFlZeXU5Z0lDcmExZzljTHRjZnhF?=
 =?utf-8?B?WVRrMVgyNzdDR1RnNXowdE5RSnJwV0FrZkhCOWhaVmk0S0ZVMDAzZE11d24v?=
 =?utf-8?B?dVA3OGJYM2lhUGZXeFdFUUxGSU5kYTkvUXJPRVJlbWxCRFlySk5NMHFiWWhM?=
 =?utf-8?B?cU84T01mNXZjUjlPdFlXOTJMaHp4Tlk2ajJ4Rnl6aDZDWC9UcHEyUGJRNU1y?=
 =?utf-8?B?MjR3ME9ScU53KzhYam92aU9jTkV6TTZnNGJ3NWFSMjE4aUJWaVhXbkJTSUFJ?=
 =?utf-8?B?TjBuYkxlUncyTUptbWR0eVpna3ZsS0Fmcnk2YmFGbGRCbFRXT3hUY3l5eFFk?=
 =?utf-8?B?NEFGalZsTTFhN1EwMVVWWC9JRUJJUDloenVXVW9NNG42SmthTGlTSGp2eTBk?=
 =?utf-8?B?Y1RoejY2SCtKUE94d29RK0FFSVk4ZHEvbGhrbTBDNkthU3l5dkxNVHVIOUdE?=
 =?utf-8?B?R3VwVi8yam5zbDVFcWt5ZmxFUndzWDN3Qy94ZTlaZVZvaFFSNnRQaDdkR0JU?=
 =?utf-8?B?QUtqZnYwRVhsNVpqOEdORGlMYVpKbHZFeHNvOE15REJZUWZ6QU9LOXpyWjlo?=
 =?utf-8?B?dmlPUlRYOWtNYkxYMFNzeTJGRlNEdUM5Rjc0dVJnOVZCcS9uR2RySWhnSFk1?=
 =?utf-8?B?Q1JJMitMN2tEQXVmVW5UNWhrOHJxZWlBZXpwSEJ4NlNqOEtac21tOW5ZRTc4?=
 =?utf-8?B?c0Zlc3VHMmtaMGlHb0JvTjFKVUhUWkpsR0tjZExwYzN6ZXVvWGo3MG1TOTBa?=
 =?utf-8?B?bE5GUTdBMTRsZlFLVUFLZFlhNFR1MkpLZmE2Q0JjY2xpU1NkUmVmN0tjSEhU?=
 =?utf-8?B?UFZoSnVGK0xXV243QjkxakdNbmp4dFJhQlZxQVdyRWZ4Qi9rM0pKNXpIcHht?=
 =?utf-8?B?cjE5OFIvNmtaMDhibjFmL0JtQVRzK3RBRXVmNFJpOWpXRVpBb2o3bzRTWmw0?=
 =?utf-8?B?M2NBVS9ZL1h0VHpWeldhZWJ0L0ZtM2VoY3JrVDJTaGF5dnBBNTBBUCt5NFVu?=
 =?utf-8?B?NnBSQ2VtTzgzWCtpdHgzQTNMTERzcyt5NmU4Uk5sb0hLb3UrU0tJbDZrY1B4?=
 =?utf-8?B?V1k0QW00VEVaSFdPYnFvT3RzNUNqRklPMFhFNWpQUHd1WE0zZ2drdHBTbjdl?=
 =?utf-8?B?dVFvWTdWWGpSOCtmbTlTeGpYVGk1Nlo4eXpnbi9ZTmw2QVVnR2pqWkVKWUc2?=
 =?utf-8?B?ajlKc2tOZVVKSlMvQVJaRU1XdTVpRThGclVWQlhUeWZ2MnlJQXFGR3pBdEMy?=
 =?utf-8?B?NnN1WlBLOXVHdU81SHdiaXl5aFV2MFpHME4rMDlEMTBmNitFbEJ5SmdXZGJD?=
 =?utf-8?B?U00vWVpsdGZrdUlZamg2RDBpTGZhR3NoZXcyTHdrdldKUGwxdDg5a0tLY0k5?=
 =?utf-8?B?NjhCbFdaVGh4SXhmdlpVaW9VYTlTWi8zK003NHcvdnNRSVpkMktQa2owREt3?=
 =?utf-8?B?N1BZMjhIdmY0K0hZR1YxRnAxUXIwSnpYQ0RLdDhDOWFxRWsxU3htazhScE5P?=
 =?utf-8?B?UWRkdFdxbkJLU3NWM0pvZ0hBYXJ0R3BIeng3NmIvaVZ3WlIwbjZrdkxIOXhG?=
 =?utf-8?B?TkFUekdsRDVzcitac2FFczlEZVgva3RYQ2R3M1k1MFJuS2dCVElyRmc2NCtr?=
 =?utf-8?B?VXlCd2QxdzhNOHNFMVQ2eHQ4SkM4VEZ6WldvZFF2dmZJampUOXFReXVuUGFV?=
 =?utf-8?Q?hT3Wk595HlfFprQfE+tMQthEX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649d26a4-236b-4922-e801-08dbd0bc1ea7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 15:57:39.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jj+XoTjt45FyC9IbJX0XgrSyvxAQ/lJsm5IgtdO4dVFcsoG7az2CK+aBEkI9eg0mgIuR8LlfppgYz//3Ghd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

On 19.10.2023 13:04, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -85,10 +85,10 @@ conform to the directive."
>  # Series 7.
>  #
> 
> --doc_begin="Usage of the following constants is safe, since they are given as-is
> -in the inflate algorithm specification and there is therefore no risk of them
> -being interpreted as decimal constants."
> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> +-doc_begin="Octal constants used as arguments to macro INSTR_ENC or MASK_EXTR
> +can be used, because they appear as is in specifications, manuals, and
> +algorithm descriptions."
> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}

INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of the same
name could imo be introduced without issues in, say, Arm code. The above
would then needlessly suppress findings there, aiui.

MASK_EXTR() otoh is a global macro which ise used for various purposes.
Excluding checking there is imo going too far, too.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -90,6 +90,12 @@ Deviations related to MISRA C:2012 Rules:
>           - __emulate_2op and __emulate_2op_nobyte
>           - read_debugreg and write_debugreg
> 
> +   * - R7.1
> +     - It is safe to use certain octal constants the way they are defined in
> +       specifications, manuals, and algorithm descriptions as arguments to
> +       macros 'INSTR_ENC' and 'MASK_EXTR'.
> +     - Tagged as `safe` for ECLAIR.

Similarly this wording is imo inappropriate, while ...

> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -20,6 +20,14 @@
>          },
>          {
>              "id": "SAF-2-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R7.1"
> +            },
> +            "name": "Rule 7.1: constants defined in specifications, manuals, and algorithm descriptions",
> +            "text": "It is safe to use certain octal constants the way they are defined in specifications, manuals, and algorithm descriptions."
> +        },

... this reads good to me.

Jan

