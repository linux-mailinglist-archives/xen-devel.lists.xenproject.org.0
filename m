Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86173BDA5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 19:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554414.865583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCkOq-0000aQ-5e; Fri, 23 Jun 2023 17:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554414.865583; Fri, 23 Jun 2023 17:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCkOq-0000YG-23; Fri, 23 Jun 2023 17:16:44 +0000
Received: by outflank-mailman (input) for mailman id 554414;
 Fri, 23 Jun 2023 17:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCkOo-0000YA-6A
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 17:16:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7c45dd1-11e9-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 19:16:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 17:16:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 17:16:38 +0000
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
X-Inumbo-ID: b7c45dd1-11e9-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg3ws51eWzSq77WSj2SuYRYMCoAcbxMHhAurgZAEPgi+thz9W8siUMPVfzIWDfl9VUHbqkBEFg931P5enRIQoAx7ZoTX43UktJB1rbutSuTGWrfWD2AienJnkBxtrSkhOeqLie7+Jp7//1ra8lUMpJbG4EmcExF4OQsj5A7hT5rVG00Tjn6wdlSDAh22gattRe9xlDWgHKq38wF1zedkekd790/Sw3pKzOkqTn8bm/PDFfICXzg1/ePdAqv7tfB+rJboh+Gx/mt7qltrlV4Fh/5AtqTjCyUm0LIkLeol74D8eF53bZk+MHjtUFEew22GOE+KYMs02PfFvN5r+eEbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJdcH9Rc9I1M6THLdWbipQkPRMWtGnku4q28KEcybq8=;
 b=VytVqe+XKtUqm5Es8Uabx3G9aB2p/D74CEEOdcQSGEhWy/EvTWikZg+8gyq6m/BAiE3+MtKwjjOZLh0ahyYXs8xSpQllV7AtmCTWctLdfJNnMTG7Q6435qsOq0cYvynJDd04ZFo9SHz8iIiohqOhV2FGlft6uKXwv8ugSm52J7lUrw6UHAjGA3eXQXLRfI0p5iw9zVqTX/s94LR6QGMTD7yZEAJ89tkYN4r3FWUmvJuen+Ox3UmTGghC5yVhaZeBlnlGXVMAOKzYvTHz4ygBQjfyRka/Y+G0N/lb/zvRfLl1QihyVx654Xdoa4owCdAetUi4isVj8GV/mD6Czsechg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJdcH9Rc9I1M6THLdWbipQkPRMWtGnku4q28KEcybq8=;
 b=Hxa1INU1+e51NMR6MwvDKVi1t7YWWbZhM9rW3DKi0ZGOtaw1P7SatceC6buxXnahXOtoS6qBsrI7y/FlSytpICio8E6k0WQhPHvkEeQ7YP2eFExCMxTvOweRLMU8CZIpSqroID2ti64pAkl6Ma1jn7zSQqHYIRGmyYA7bfhMa2guVkgZ4+qrshw5WxGlo96+o9U94GOOc4RGvZP74mFs722Y62jC/TeC0z++JSc5/yQZXQ7TPhzkCl5jSzAwMFzmFwUDVpBh/b0hNPYT/dCwvkWDEt+mFDWEdmsLrrqwLmhTebjG3g1VGa/UioDl1L6/jxxMYnqDb8oDQbZJlSFcWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f099efe2-e318-a40d-5254-e9c1e87578e6@suse.com>
Date: Fri, 23 Jun 2023 19:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v4] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0038.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4e69a-25cd-4815-7804-08db740d9a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dpvph2k94nhbeqVh9060gln+b/LQmxLzomBuklMSs+R8TeKe0zR1JDcTRfJKgl2R14d6C8i3AzAhVNVYTjrzgO5vsNAoIAKbk8iHxUkbpyJ8bdHGsOtdjrgY5U/t8+ALTINLq0J6mdEZY/AHzbxy7oKGKhwWop7zQ8UWh0f9SJ2q02pEK7FNJQW7oRd/Kzz7fuUqn+n4W1GP2JT+eyNj+MBOelCp8EXt3qOQZO/4P2sVa5zAlJLrfHz1AHBMDzBZIDao2PsCpGehMU7eb1t0F4XeMSO4f0eBDBcDNagN3UdeEgLUrGl0p0W1QQVc4HHxitYdDCrRImfhQSzIG1Wbl/4KyBknM/W2p1uRQZbWZBhqIuhN55IS4xNfrYfmTikS5IPaNd3D5uO/MDi18FBpjlmlb2ynxokTuPB5xZApkLn2D8O0c7EPEna7qyhr1FNdkCnEWDam3pNhgaHy0Wn55BPBsZGlHcIyEf5dkZ82QFbNwwi5gOj6d566VwBDzk0tc2gQwFh5ONSFiZtjwvNRpWCWtXdB5nwoW5rokv0S4L1ebfbmMMxwuFVxjRZLEpXq93z/kVaN/9gaaygTyf/OL7JnhhQV2MRQ8JWagDjzs3AJoGLhIIiWf6Tdg3j02NTEmEFsHXixLdhaESi/AD11Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(31686004)(6666004)(478600001)(54906003)(4326008)(2616005)(36756003)(31696002)(86362001)(2906002)(6486002)(186003)(26005)(53546011)(6506007)(66946007)(6512007)(38100700002)(66556008)(66476007)(5660300002)(316002)(8936002)(41300700001)(6916009)(8676002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkduYUVzRnM2OGJBNmF4R2IyNksyK3VnSitYWFJDTE0ra1czL0diRHl1RVhu?=
 =?utf-8?B?dUdMdysrYmtCNGw0bHhCYUVmbjJRN3ZIOWZOUEVlVXVmMmdQQUNuSFZ4MVhP?=
 =?utf-8?B?WldBSExudFVhODlGM3AxT1BTM0RHdzkvQW5VM0Q4RzgxVysyclhUMVBxQkVU?=
 =?utf-8?B?MG8wTHVmRGxtZHQ2bFJVR2VRWk0rbUROL2pnSTJXbC9uT2EyUjJvcVBNOFR5?=
 =?utf-8?B?eU4ySDY3NFVCVWhpOVJWWW1uQU1OM0JQWXVEUk11bC81TjJGOGw0RWRxRU9n?=
 =?utf-8?B?SGF3K0V0UXZVZythbCtsRSt6c3lTUlNYZTJHMHl5c3g1Mmsyc1VaWVcyNDVx?=
 =?utf-8?B?VXlWZzlzQnZxbjlEWi9sOTBTOTJ1cXhWd2FPdStuWlVqTUlqUVRkQnNGTFk1?=
 =?utf-8?B?bkc3Qk5ETVFzM1p3VTlFWjNydzVia2RHNFltVUovVWdJNklMMlByZEtzTVVB?=
 =?utf-8?B?NEVsVEdMN0NRN1o5ek9ueFJYajhVWjVDbWhiUmxnZlYrYnZybitLOGNZcXFW?=
 =?utf-8?B?NXluWWNCOWYrSjdIWHVMTW0wclVScmo3NTNiblVuTTBNQjhnSXo5M2k5SFph?=
 =?utf-8?B?cDBFejdmekFvL0FobC9pR0I5RXd4RlBROEdtY3VMK0Y0dzFMLzl1aExDajVx?=
 =?utf-8?B?NnVIbmc2Q0ZiWXVaR0pWSjNkRWJ2azJpazIvQy9PdThsNXFkTUdqTzZnUHpP?=
 =?utf-8?B?aGRBRDlGYjMvOEIrNVdnODFpZkxvcDN5RlVrcTVSekRIV0FxZjdxbWtBZ252?=
 =?utf-8?B?SERXb0h5S0QyYTJOUUJWWU5hLzg2dkNlNVh3QUhYWlV4ZktseGxUK0x0NTh6?=
 =?utf-8?B?T29rdEhjL0tKT3VrQjBUSnNMMXZpUGZtbDVIUmp0K2Q3aVYrc2JWdXd1eEh4?=
 =?utf-8?B?YUdOY0JWRDJHcXRDdEhTVUdvT2FuUDk3MTBEbUZBTERGc0E3ekcrMnFOQmox?=
 =?utf-8?B?NmVOVXlxTXNrTmFsVWFLbU8vRGFGVUFEdVd4UXI4L1lOUjdmdkxmS0ZPSGtV?=
 =?utf-8?B?aFdRZGM2UUFreGFIK0REaE5MSFF1ckxHaW0yNTVKci9xSUt0YlFZNWc4Ym1u?=
 =?utf-8?B?T3dZZFRZVVZQZWdkN1p2eEhOUW9BbWgwRUJ5czhRTDlWcEhFNGRXNWVVa0VI?=
 =?utf-8?B?MFJyTEpmNUR6R1owWmZONDlRZVhnMEd3Vm9MWUJ3R1hVMlN6VEE2TkxOVXlp?=
 =?utf-8?B?azFkaDlaRldtZHJLVmFKRzhBZzVVU3ZUVzBHZG5OOVdSWitORU5rZVBYY1Vs?=
 =?utf-8?B?eU5wVzIwdklBVTF5YkE5UlJSeUlrNEtVd2tqRmQrV2djN1VOYXNpMGZzb0t6?=
 =?utf-8?B?bmMrcVBvN3VkbmxkNHcwUW9kUVA3TVpRRHdOazBaN0llMVFnWVR1Z25zRDJB?=
 =?utf-8?B?YTlKb0JLNjhQY1ZhcjFUN3dOWmVRTXQyckplaExiL1NYVUxhL0NoaW1pWWF3?=
 =?utf-8?B?d3IvMFVjckxBNnVzSWNQR2V5MFhINUR1R2EvWGtnZjUydzc4MUJYb3F0MVpJ?=
 =?utf-8?B?Uk9DOXM2STNaYytoMFgwaUZEMnpSdG4vYmpNYjBkaVFCaWRrNzdPcmtyWXNN?=
 =?utf-8?B?dHhGVjVUK3cyM0FDbEtVaDEzaWZPbVgyM0VUWGpWQXpySnphSGIxbHpBSmpS?=
 =?utf-8?B?dkZwYWF5RWd1elhVMWdraExnakFLbDlaZ1FoTFlPYlVyeDFOVFNhem5jQ3A0?=
 =?utf-8?B?SjFOM1ZGcXdEZWs5M3c3T1pXZlc2cWR6cUtJa2YwZWxlUWRYclpKa3E5S3lB?=
 =?utf-8?B?UTFuWmd6M2xQTStkMldsdGJtaE1SSzlZdnpXRnpTcW9oc1hFeEhkU3lQRXM0?=
 =?utf-8?B?cXhWK2pMcnVtU0FJTGpPc3orWWNYVlZvdGlPK01OTkkzMVE0bjZuVUZGU2sz?=
 =?utf-8?B?TXRIR2FRVjBPODZpSVRTbmVKRm1vV3Y1dHVJRkxrOG9ZTnlXcHRaamtVaWJu?=
 =?utf-8?B?S2ZVcGhGRlRORGlreU9ZWWduQjR2Qzc5RmpNTGhjdVZSSE04dlB3SXkvNVNM?=
 =?utf-8?B?VXRtaU9qcFhUTVZjSDRxYmRkTmtyNUJIUzJ5MmZ3TytoMlFjNGFaM2xlSHRS?=
 =?utf-8?B?M3FlZWNIa2lTNDJIMGNpT1pRazFWYXNBZ2ZPakJ0akkyY0JqVTk3VmZTRmJY?=
 =?utf-8?Q?AvFj47vlNN9hmEpsljmaMy2n9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4e69a-25cd-4815-7804-08db740d9a94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 17:16:38.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UBgEkOE+aGJV0UbVDAgWJ1ZnLlcwWijZoEEuHJgN8XmgDps1H7ElMNtMoTX0XWGSP5n3sKosIRA63VcDvgNfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

On 23.06.2023 10:59, Nicola Vetrini wrote:
> Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
> that gives an acceptable semantics to C99 undefined behavior 58
> ("A structure or union is defined as containing no named members
> (6.7.2.1)").
> 
> The chosen ill-formed construct is a negative bitwidth in a
> bitfield within a struct containing at least one named member,
> which prevents the UB while keeping the semantics of the construct.
> 
> The choice of the bitwise AND operation to bring the result to 0
> when cond is false boils down to possibly better portability,
> and the 'U' suffix to make it obvious that this operation results
> in an unsigned value.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in V2:
> - Avoid using a VLA as the compile-time assertion
> - Do not drop _Static_assert
> Changes in V3:
> - Changed the operation to bring the result to 0 when the
> construct does not lead to a compilation error
> Changes in V4:
> - Switched to a shorter construct for the second definition.

Which sadly renders part of the description inapplicable now (there's
no negative width bitfield anymore, afaics). Could probably be swapped
for "zero" while committing, if some other maintainer wants to ack it
in its present form. I'm not happy to, with the continued use of the
two U suffixes. It may seem minor, but to me it feels like setting a
bad precedent.

Jan

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -51,9 +51,10 @@
>     e.g. in a structure initializer (or where-ever else comma expressions
>     aren't permitted). */
>  #define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0U)
>  #else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : !(cond); }) & 0U)
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  


