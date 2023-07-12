Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F204750501
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562319.878959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXLc-0008HC-24; Wed, 12 Jul 2023 10:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562319.878959; Wed, 12 Jul 2023 10:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXLb-0008F1-Ty; Wed, 12 Jul 2023 10:45:27 +0000
Received: by outflank-mailman (input) for mailman id 562319;
 Wed, 12 Jul 2023 10:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXLa-0008Em-2V
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:45:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34a25579-20a1-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:45:24 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:45:21 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:45:21 +0000
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
X-Inumbo-ID: 34a25579-20a1-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWlaQxnHpy6xwcyMkDwf5UIH+yd1ijD3xPDcSY4CH065kG4WTr4P307OC1DzlYRpVlF1jNvBwgho8XoCHQVsdkiu7gay2aJor7EtbIRDv8gQ8aIkNfkY9clDb4Qa7q9qKfhUFHPC3h1+N2tSN3ScBCehlqPEHAx6OsxnHB0UAPhhJomHdjS4dtT3fERL+4spINQrm0QggyKMTFL5VyucU3bNjuvEy/HHDINwZOPo4qn0EQZLKrSQch/fzKCtBXHd8YWNkdTAE4DFMb5D90cHc8yTWGZ8IwSqVdqQx+qIAg+OsbQqE+4VIQSo+243bgPUTyKR4oPJt07z4FDk4mduRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JPKHRKtLk0O0yYloJPncdmyXePya+s7YKuYK36KxW8=;
 b=QShToUUQXe0TlEPCcqKMu5wW/XzC5VTzW7D1m1noJGOxQgLKRphl8HgvUhDRLfXf/useUhb90FE8IsRVXx/L00YFjTvrapvf3nF0EZpf593dokMtcbLsrs67ioDB2uNdWL8JWDEBC+tCV6FXApHR5rus6pJC4TE36aA/t+GzIo684p7jjYX/7ullSwUKplicVOisMSlza3EeOBcpqtYWO/Q2m1or5m5qiagqkPB45ebTvQQVdmDh9BIzOWeQdqpsYTA7LUrRmYnJlikTL3sVjBXXmhWg00RZI2igI85CvuBsX0Ld6/Zrxo15gaYtPwVts0bIZqAtc8zn2q/QeppfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JPKHRKtLk0O0yYloJPncdmyXePya+s7YKuYK36KxW8=;
 b=Kpi/e8sT78T5y+RVcd0+x95IJ7p5nZeVBPAl9DvfE4E2XlfKhKFbBxqYOcYIkdwtDJQCN0ANcq4WY86014AcUYvlYIZz3KcNHBDm9+ybI7+FcijzG7tXYS1Dyuo/GyZwW8BD++B5lXY4B4irzvLV/l9oK7arTBxdTA566MVtoUKbSoWAq0kbvFxy278XjYUS3h68jJ49cbD/IZavjAyNPd79C/iZMfEvybr6Tf5iAewUkreuxvHf6TJoQQ+sJ/7tdS1BQjM7onixORjESMkT/SP+rEH4YXYbB9UfkG+vD5p+V74Wp9vznwrN0o1MJM9ynFgavflLN8LyomVUuXf6DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3802a61b-13a5-870c-7f33-8ed6687e82e4@suse.com>
Date: Wed, 12 Jul 2023 12:45:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 03/15] x86/svm: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <b63ed0674f467d532afe4b57c833b446b2e29a90.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b63ed0674f467d532afe4b57c833b446b2e29a90.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: d036e107-ff64-46af-9b5d-08db82c51772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0ycQg/rKGMdFCZo1ee+DN9Vp++nv7MbrZs5trxz0gz2h0uBSNyye67GQtvbM4NydBrTiuhp/ceXfCGMzDKFMOR06gFgoq3cYYMIK55/pf48Ww56SCqN4UPLPwkAKaKltfsisw89wo+30sgvIhoe6LLuBSDML2tUhvCGrjjSrkIIjSHeTa620soX9kJ2sy7os7kKR5Ysb2BG+Ud52/ybBMJJpceUQ1tXHqKIDUaDpAGeemOLbWW0Kr71/spuwDlBKttbhDFXiESwyu+3+bmJwOC4bDBUc7ic1SC1NVaJF17BpwV15bs/SkW2pO1uZp7zMucW6BNLrfy4HfciuPeGAt0jWOzrAB3YY+PbVtDRMz7FEf1W1JQMZtSOcSF7sE22ilNzfkgPflPzKK0HpjwW4Tkw+4n8NJK4Jmw0S1o7R+uvQ0VlTCa0mufZ3hfy9q9QcU6Fl71juoRR4u9FGlzT1PJZkcNftsZnWHLBzjkGtgT1w+JG1bgwX/uEXMbZ+8BRBys9xsBwOsYveDSgyu5DrqCkNJ0Un79RC9fK/mWrM79wOF2WVO/Am9TVAx2CcfXs2zidhgooEFNReY52BEO9ThM/SgaZh7RCYJzsaSe51YzdEJcBChyrrpUxk91KCTFOmjfcXEPzxPJyvC9JzzIElA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(31696002)(186003)(6506007)(86362001)(26005)(5660300002)(8936002)(7416002)(8676002)(53546011)(41300700001)(6486002)(38100700002)(66556008)(66476007)(4326008)(6916009)(66946007)(2906002)(4744005)(83380400001)(31686004)(36756003)(2616005)(54906003)(316002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnZWZzV1d1JvcjRUb2JzdVFnbW5UN0VrUzVrVTVBcWpPN042eldSM00xR2k1?=
 =?utf-8?B?cWx1U3N0azk5Tms0Nk5DNXFWWkVJVDRpOEpnblltNTV2c00wMUg1cnloNGMy?=
 =?utf-8?B?YWNiQTJBQ0QvZ1hrUFd6aXl3THQ1RGw3VzJmZ1IrU2gyM2hsUkU4MExkeFFv?=
 =?utf-8?B?T2piREwvS1MwMHcyL1J1OEc4ZXZVVUpjMHBvaXROU2xCYUFqbnRIa3AxRVA2?=
 =?utf-8?B?RlJKUXk2OC9Kd2lDODFyRDZ3WUJJNm5ycFdQd0FVMlVSQnFPYTdaRjFnTm96?=
 =?utf-8?B?NEhUeEo5U2hLbndMZTUyRkxQOWNmdmJKcUtzdGZwYmloWEdDbEQxYzQ5c2xP?=
 =?utf-8?B?R3czQ2hqTi8zY1diNWtxR1llcFRqSzBKZ210VDBJdFZmVlpQbjZXVjZQYUhu?=
 =?utf-8?B?eGVhSG5ydDM5MktmUXFDeWJ2bEZEVlkzNWpnTVExQTRZQ0IrbWwydVRldzMv?=
 =?utf-8?B?OXFTZ2U1Mldja0dReTM2dzlqRTYvOGFWd2d1NGxxa0gzdlhSNm9oT2pob1dJ?=
 =?utf-8?B?TDdMYzhIY2pLMDluNDE5aVpZdjN1VkN0UUxzZmtuRXdzSW9GMStWRWNZL21i?=
 =?utf-8?B?STk1OVpYSndUWmJOanBPUkxTam1NczAwS0h5cXJRa3VjN0pHU3pudjhWSnpX?=
 =?utf-8?B?SEdvaHJnVWc5MTRla2dHZ3Y4ZDc4YVV6SGo5em9HVHg3VDB2d2o0aU44VTMr?=
 =?utf-8?B?V0p0OGg2cExvSmtKZnpoQjFieFBnbk9zL2QweFBNOFU2QnNlREdQdy9SaktY?=
 =?utf-8?B?cTMxYnJ0bUJsQUl0Wkh5NnVNUnZja0hWeGtGcFI2Zjd2a0NMbmNuWkVHT3ps?=
 =?utf-8?B?WTNnejhZN3p0cWVCVUtYTTdXWEVicU13RVVhK1BMaS9CVjNRUGk4b1FZS2Fq?=
 =?utf-8?B?TGprT0pTY3hUbFJDMjNXckZpVjlhRmhNOW9kSm13OUNFQUVuaFcwWGZQUldJ?=
 =?utf-8?B?WUxDa21Ob0hxUXZKSTRodzdjeE9Cbis2ODY0QUZETXIyREVvWTdxNGw3N2N5?=
 =?utf-8?B?YytmYTNXbkMzb0JRcE45Y1VjdWhycnVwQmJlclR0dHR6UTlZU256V3pUaitj?=
 =?utf-8?B?RzhZck8yTGU4WnFLTnZWdS9hUVFXRnlvbVhEZUJaUmV4RDNLTTJkdFNBcHcr?=
 =?utf-8?B?Q2xlV3lBMGJSR2tLd0pYbWxXTi8zTFNvVVE5LzNGOU5xZ3BlNVgzaXRQcjFK?=
 =?utf-8?B?T0ZodmRqdWlHcURGSlNjaExxNFhpWGd6b0ljSjIwNktQc1prQlh0TmpkNlZM?=
 =?utf-8?B?THJoaGxzb2lTRkV3SUJJWUxMQkEvWGN5dUR1ai81Nk9wdWZDQi9VQnFaQXJn?=
 =?utf-8?B?K3NnZERSMWcxZ0IvWmgrZEhrd0syUnlObG92dUVyUy9YRTEycGdPa1dMM1FD?=
 =?utf-8?B?bXBzcFR0WWtXaWVOWkp0djBNRlhpbi9SNUg4MDNycUxKbVpnSUs2QllOckxI?=
 =?utf-8?B?ZE82V045bTVyQ0cvbElNb0FLbEZHZ05lSVZXTVFFY3pwNXVVeDlIUzJUMng3?=
 =?utf-8?B?cjN6cE9oNlZTVGlrS0t4cEZtVXhzQjFYU2ZHVGdkR2ZyeFlsaS8rVmtmcFQ0?=
 =?utf-8?B?Smc4em1PbGFMWUNEZUNrMlRtL1M0MHF4NlNnUTltUXl6TjFZOGNxbWxyZ3dY?=
 =?utf-8?B?dGx5a01zcU1ZMzhQUkcvR3lUeForMng2YlU2RnlwR3FIbkZjcVFxS1dwQTkv?=
 =?utf-8?B?NTJyUkw5RkF0cnd6akVPTCtEL3RZUTQrRmhPM3oyd25tdWZsOUZ6SlNMZ20y?=
 =?utf-8?B?VE5waTVFRWhUNlZxWGQ3V05INUQySE9PQTlhbExpaXU5bFdzUWp0V1ZHdEVN?=
 =?utf-8?B?aE54QnFvaWo0c0J2dUw1ZU5RNTlFTkdOVXhsNDQyNHpiM2NjZ005MWdXUXVa?=
 =?utf-8?B?YXhRTmJMNWNuVzYzZ29ZY2t3aUVRV2VhZ04wWjI5R240MW5RdXQ3Q0ZYNmIx?=
 =?utf-8?B?S3ROcWttck5aYXdUeHE3Zm91NGhueWxZL1VNMEFrZjY3MGNXcWNJeUlqY3RH?=
 =?utf-8?B?cFA0Rmp1SFdMa3FjTkp2d1FOd0xEeU5QM2ZHc1JldnViSEFMWkNZNzZJbEU5?=
 =?utf-8?B?T21MdENjaTVpM2N4ajZNMnBuQkpYeFMzb2NWdW4zRkgzNVRhZDc4UnBlMnNM?=
 =?utf-8?Q?fUmyhq5ESbf973BvF30L5gke1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d036e107-ff64-46af-9b5d-08db82c51772
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:45:21.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/NwCsrOt7Ww5zrptmlUCx0lIsWCfJpv26KBQ02OTC//75ZZTFy0+TNKspsTziuvKLzQJuFFiPMNfADo9JkfZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 12.07.2023 12:32, Simone Ballarin wrote:
> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -16,7 +16,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
>  
>      /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>      if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> -        nasids = cpuid_ebx(0x8000000A);
> +        nasids = cpuid_ebx(0x8000000AU);

When resubmitting it would be really nice if you made changes that earlier
on were indicated could otherwise be done while committing.

Jan

