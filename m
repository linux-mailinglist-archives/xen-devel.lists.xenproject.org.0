Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0F7D4903
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621724.968480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCC7-00086Y-8L; Tue, 24 Oct 2023 07:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621724.968480; Tue, 24 Oct 2023 07:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCC7-00084L-5j; Tue, 24 Oct 2023 07:51:19 +0000
Received: by outflank-mailman (input) for mailman id 621724;
 Tue, 24 Oct 2023 07:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvCC5-00084D-Nd
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:51:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb43f57-7242-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 09:51:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 07:50:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:50:46 +0000
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
X-Inumbo-ID: 1bb43f57-7242-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoQAoniCeNWB6lfyqdD0eUQCtd+sEWj/SFACaV5jK70JqdmIeMSV+IItjxOP91OQ4sVP+pNzjATCI5zHl4djIOeEBUwFvVxDbz+pzwa1HtMDc8RWEspbTQlkzn8gXV/CM1CC+t0cnivupPE/V6WVl6utc51xB743Io/PQNFv5kXtd7EC08z9ClYMzdDrjWlEr/4LvN3qqLKWjFs+1INrc47p0yHQ8aVTDXRSLrZ13NCt9WcXSerVnV22mOteJXb0Dp7N7ViqkW2VPAASmEdtEF4Kkt/l64SYRT+pH87NBDUanJv4Rqbh//CLOUu9OFtc3I6lNbZfyYbISyyi95a7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/A/s2bLBiDx/C0FK5HfiXvTKl/xB4vyrkZUs1dTOIU=;
 b=jxq3wAsYiwudRZ8LG+h8mnr8M4Lh7snu9WK2rmU1zD5qT+A9TEv3Ndmo9uQdY1X46rsIFuhCQOuw/hCrDSeWaH7Cr+pwmlOHLWjisQxfJaSvAtZMOI/rn0jTCzq6Vv+3L4Yny0tKl6oTMz0/sW9j8AJDlxrGFVNZXoqS57J0eBs2l/MXbKRdRT+t+SNZkVMdObh8uzX1bl460ivJTwxJtY10+XM0Hdbv1gQRZn71gtH+S+POBOu3PWhzEhlC/EZjmQjHMIiZaWXUi+jWVfcyAQ8JuTO07IDxPrA/RNgvMDb1NsC1+kSXXUAUZ3UFJ67F03Qm8an56gpmZEbxoxmSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/A/s2bLBiDx/C0FK5HfiXvTKl/xB4vyrkZUs1dTOIU=;
 b=kVVJ3KcutwEn4cM1ZdLI1rcSbP8NKbCVeCi3GBMR9uNwrjuM9DtS1OesUewT9g/vz9/gMPctniaBztXCbNPPtYCPObWmIK4W9NAqXqhN3adruksMuwOABZ/c2QIuLdv+w4Jkl0gCWgTOK/14THa7+7RaY9c9r/cmcRpqotjEnwA1wpZ2SE96EC9RCV5tfdKEbcDimTqhJppbUAiN1p9jAXjfC2PD74buYuEqxuCRhKAf7DBGJu0x1RkrY2jtymWbpoTmfDvajUSuQdoJIWlh0UQA114JbL4oHzknvPx5+/9CnBQ5NRRpzEChkji99X+mJKRJV9hGyC59rp2PyT0O+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8370e98-1cb6-8fde-9458-e579047dd607@suse.com>
Date: Tue, 24 Oct 2023 09:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 3/8] x86: add deviation comments for
 asm-only functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <36d24b3a3e264f0e0b265b4f68d6432a143d64cd.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <36d24b3a3e264f0e0b265b4f68d6432a143d64cd.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc2f78e-356a-49fd-371e-08dbd465ee91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DzYTkach+8x7gegWkZn8b1xaIstTHpOaqpzwFeAt/sXIwNHQTHIBWBjVX+Gsr096AG3f1CCk/ZTnVyMgTayAw6ckI7A8Wke5OEORQZ75G77c9syAmiCyQqqcQvSc1jYpConzWe9q+098JaH3jdACiVCVU54we0/pneqdztOenF3s9eH4k06HK9RIm1zql5PrsWOsH8yiCQhAOPp4J5VFCllm0Z//aNoqIQjcb0/o/FIT4BCeOrljqkq1e24zIZwAHKa7e86u61YWeQ6tTnaporCXtkGgFx6VQX593e4KVKaAE+YNsK9gq3+TvcJRcpQUDIHipmzy50AlzFPS4f5sL+nEd/5YFcu7fbHbewSqnFXllJGe4eWjEUPC1Sd/GrGSzI4FyRxEzyEdgArPjhxvJS6Eg6jHjlKw2jHospHGD8fLZqn8m3Nv5fMIIFzyfJK3H9bvhS8htkWroxUlkzXKqLDhqQWrZWMbwLX9z0TmJUmeKdunJIHyxpndMZGd3MhdOAtXnNTrS4Cl0y2gfvERlcT1o+8U4EfBmgyyyMwadzk3m8CUdkcZZTxZ5OvHCm8+IzGJPMLKyaXg9Qr9Ytysi12TpL6gOKB8gyuNWFAy5dob/QJroqKWAmV2DyqgCf7sRQJGXQq3kIlY2E5ENwXfTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6916009)(66556008)(66946007)(5660300002)(66476007)(6512007)(54906003)(316002)(6506007)(6486002)(478600001)(2616005)(4326008)(8936002)(2906002)(41300700001)(36756003)(26005)(7416002)(31696002)(86362001)(38100700002)(8676002)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzByZ3djUFdEMUdUMUNxbjhxbHVTMFgwSndTWEY0enQxT1lUK2lLYVA3ampu?=
 =?utf-8?B?VlF4TGIrMVNPZzNWU2NzYUNlUXdvQ25RRkNRK2JjdGJhdVNrTmJZZWx3U2w2?=
 =?utf-8?B?M3RIaGQzZ2x0VFpOazZMVm9OeTVqaXdMNXFCanVjb1ZpSWppeng5VUpLdFhQ?=
 =?utf-8?B?aE8zK1RUcWpUaU9tU0N0WEMrZUdIUjkwOTY5a1hjTHdCWWtWamdMUDQ1T2Np?=
 =?utf-8?B?ZVVoaVpRMm05Skd6OHJjcTdGTWt4YUtyV0MzQi9iL3hJVk5YZVRqakdsTzFt?=
 =?utf-8?B?bXJseWh2aVRhZVh5RG91aG9IQmdQVGkzeVd4eXpCSWNaR1dNZnVKdFpESnRY?=
 =?utf-8?B?QmFyUW44MnNvWlZGUFdKKzNocmtVZDJJZk9RSi9Zelo1VUZDeFFMQTMxRFNr?=
 =?utf-8?B?Y3ZlZ0pPcDRYTW5xM2RnWit4b05CSk0vbTFhczB3L1dEVVR5SWVpdVp5Y3o2?=
 =?utf-8?B?bHBOOEJDN3RINVdHVDhuSWhnemRHMXZBR1J1S2grclVYVi81V1BFMG1hRWh2?=
 =?utf-8?B?ZWF2dTlxamtleU5Hb3lhK2xVQVVWNlVUb09PNEVod21QOGF6LzJmREkzZ1dm?=
 =?utf-8?B?T3haODNkajVzY3grOU1SeEgyR2liRld0ZldxNFo3SW9MVkZjUjFZMHIzMTFM?=
 =?utf-8?B?OFl2djdvcitkVTU0UEpSNzJ1dy9zWlgxeTNrakRsNElKcytOOWdReFU4b1Vu?=
 =?utf-8?B?ZUhneDhVbGJSeFVUSEpWakxrNHRFYVlNZmppUmV4a0xKdDY0bldsV3BoYXVr?=
 =?utf-8?B?YkJBeEJ6L2tPVk1NMEpvSElVSVJVczg5K3pCR1NvYjlBcCtMZElLcTVGaFBQ?=
 =?utf-8?B?eDBpUjhtMzE2Vlg2SlM2NnRzNnRUK2lQS095T1lLTmlwY1pEVFg4NzB5cVdY?=
 =?utf-8?B?Ym55aTlibHdobGE1MGJnWDZtd01yZkgrakIwc25zTGdzVFE5QkQxcmNIUVdT?=
 =?utf-8?B?eEFSY3hwcDdtaVZrZVBqZjR6K010N3NFVzJndmw3QWlpRmNzVW1CVEI5eTUx?=
 =?utf-8?B?UGswT1Y3SVFnODdHNjEwOWRkYjRIVmRjRThJMVRLQ3NEc1lTQXFacUFmU1Fv?=
 =?utf-8?B?NHNxeWxTTFl2bjIrUTRRUUM1aGFEUnNydmlSdlcwaURaMDR4QWJmdXgzeTQv?=
 =?utf-8?B?VjQxd0ZHZ2htenBmSU1VcWV6eU5uNGVydGNRTEd5Mm5kU3dscmlvaU5hZUN5?=
 =?utf-8?B?QmVPbWNsc0I4d1lWQmF3NGZxMnkrNDNHc3d5N2d3Wjg4OUJ1QXJySVdDUUsv?=
 =?utf-8?B?T0NiZzY1Y1laQWk5Y2VSbmsrTllaRmVVZ1g0UkRoSVQ1MWdTQk1jTUUvUWh2?=
 =?utf-8?B?VXRCOUJnRDhCTFpLY1RFNW1pVldzb3RPaTJBOXBUa09MV0p0U1JEK1ZOdnpy?=
 =?utf-8?B?MEh4VE81MWFhRnBPeWk5N2NNYmFiMUhPT3ROR1A2QlRPTSs2NFRjTFg5SW9o?=
 =?utf-8?B?V2lxdVZFMlRaNjFseTd1Y3l4dDlxY3ZRMHFoQmRtTVRoUE1RM2ZoVlJLMWFV?=
 =?utf-8?B?YzBYK2w5NHNISzNMSURvc0F6MWlOTHNtQzk2Vzk5R2lybDRlN2dJblZsbVBN?=
 =?utf-8?B?Nmdld3lHeEJ4Zk5yWVFOZ0Jia3RhcU1VYmhnK0lpTWtYYjUxdXZULzVpUEpS?=
 =?utf-8?B?OStTTFJVMncrZmNSTlFJNHF6RytYVEN0dW5zRU5XMmxOMXltUXZTM1JYa0oz?=
 =?utf-8?B?QUtobmdwWndNYUc2SHlyZzJMRjdYdlhhTjdQV3Z6U28zMEtubzlBTGZjYlVi?=
 =?utf-8?B?V0ZvVy9EY1hJY0QxK1hHdWdmNFZTdE9nNzZmQjluYWRFZm5NQjZSSFZVRWF0?=
 =?utf-8?B?QWFRajJGaHAvSjdwc0k4Y3V4eDVDN1Z6elhBOUdYMVFRUVEvVHZvYndWWUhj?=
 =?utf-8?B?cW5iWlUrUVc4N3JkSmZxNXJOTDJoQVdqN2x3TnFqb2VHZ1NkR3kwSjhDd1Y5?=
 =?utf-8?B?a3lvc3pNYWVzeElJTnpmc0hZZCtDSGtvUVgwcnlZRG9wR3cyM1BaU0w1dWRr?=
 =?utf-8?B?ZUVVVzl2MktaNDNnaHpEUkpGT0Z0Qmt0S0FHNzZDdTY4TmNNMDlMbW94Z1dz?=
 =?utf-8?B?a0pUVEdKRllVcVpMQmcxMGVDaW5hUEVMN2QrZWVyNlp4SDdyNGg1RENiUnlm?=
 =?utf-8?Q?NF6BhUc2kvKzn9SRywMMZdXe2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc2f78e-356a-49fd-371e-08dbd465ee91
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:50:46.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mbBYtcGH5em3tLVD1dH1YOZ9ZuOuZgdvfC6EiE8vQkMum6/axpZIGx1n9o37R1ozvhU29/TNNUB3zLPq44dyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697

On 23.10.2023 11:56, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm code
> are allowed to have no prior declaration visible when being
> defined, hence these functions are deviated.
> This also fixes violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v3:
> - added SAF deviations for vmx counterparts to svm functions.

Same comment regarding the R-b here as for patch 2.

> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -123,6 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>  }
>  
> +/* SAF-1-safe */
>  void svm_intr_assist(void)
>  {
>      struct vcpu *v = current;

Linux has the concept of "asmlinkage" for functions interfacing C and
assembly. Was it considered to use that - even if expanding to nothing
for all present architectures - as a way to annotate affected definitions
in place of the SAF-*-safe comments?

Jan

