Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1D5EAAC6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411945.655088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpxI-0002WF-E1; Mon, 26 Sep 2022 15:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411945.655088; Mon, 26 Sep 2022 15:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpxI-0002Sm-B6; Mon, 26 Sep 2022 15:23:36 +0000
Received: by outflank-mailman (input) for mailman id 411945;
 Mon, 26 Sep 2022 15:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocpxG-0002SQ-M9
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:23:34 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e3944fa-3daf-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:23:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:23:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 15:23:30 +0000
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
X-Inumbo-ID: 2e3944fa-3daf-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvGMWBGzys6WGgGw/3PTlTuRm5hM3ZDiBcQjWezLVpulYNDEwxXz5rNeJpLFAsdxFJMXs4bP0FE8k+i9iyj+lBaaTcI63Gy/DtAevnW2hB7k+iHHZhP/+ZPE5vesQfjIZdU7QhaZpwjsbx+bLbC/qmeQDvYNRSkkC9AvxwuB8aRT/7utM/Au9Uo57cdh/0msexKSIruBsoCleZpYQP2HLi88erWQB6sZgQjjzoob6CEEVMe9MA3N/mkiy+LPzYi2SO0wncwRHLPihuD9AZl5U+DNFH68Ah0EcyBaIrvs+lXiF8XZ0WSUsqHiYEFvEi5g7QRjO7cE0YrUzkmefUPn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJJhoMOxaU4i/GNzKhMMmRVhdWHqmy7FcW5ttvMCuUs=;
 b=oPqsYLRgjzBE+mkqoFC7IM4oHk9spsKyeVKrjY63baVa4dbSRbHQdGaMO1EuPdeBQEPjUBJvxjz7qjebbOWmhdrg/ci3KEqQz014ZU47Vh1gSM0s1+/RVzU+gOn+aeCpbFyF7s0x+w2ysyZ8hJ2c3z23yf2G3Mekbq9gVAdMiBN7sP3l7A4BF8h/4OAI3P4kgIQKc3YTEdVy/72M4s752osr4HrCQQLNIypLyIHZp+CwWJOb1uibrxqDzKtVRGXqtRvp1S8kVL3vET/DJUKjuq8QEPFx44PmgfPtOJzpNOdIJ/dICfAyXyXAIS8E0FuKlYPA+47HbfvRSCGuvUuyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJJhoMOxaU4i/GNzKhMMmRVhdWHqmy7FcW5ttvMCuUs=;
 b=cguDe3E6UDrKxNe6bNMtlbbNwuqw9gQxw3RMXg1XN0H5N5hkjkQTPMgs9CfemZ16tvRtiRNMAUL3FiayYKD3g3YNb+Bp8dQC9FH1vK6fHzDvAyq/Q17dfHzGrM45O2Llx/nFDL5bilNNHhT+1qyqBozfDoeEsqR+czZsOtj4MIvzX9/9l5NE1ExKpGGWQNRyq+Cimjx3N+sr+aia+cG3g930iO3fIK35uJRKxx2+XQMa1RZ8d83ZWGtXOE5yTcI/7CKCIJPjUelaerYnXOgiNB70U15QvquLayRxbhYopsmn9BApnZqMTltz5DlSqVVe3ixWGkbPigq1X8x6P7WdkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9f6c0e9-f34d-7205-9e85-054088ecddb4@suse.com>
Date: Mon, 26 Sep 2022 17:23:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/3] xen/pv: support selecting safe/unsafe msr accesses
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220926141849.21805-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 12924017-37c4-4d0c-0484-08da9fd31124
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpgGP/eAiXHpw7TSAsCqKAnZfR7FR2l9X2kiMsgudDiD8Mpz4MO+warrMAoI7whHbKIsDmaa6cxlXHY7dY9l1TJTX16SFgG5xbN/4FcR6Dfxkh7aP8CkhqOQnhppzLdgJI22GhSGf3GTiOWWdEp92r1tp+Za3RHEJfmPtrZJ5vqhnqC+vtnqRMhJRzaH7w1demwioRYZ4b9q42vUaifgN+oSxKfIJNP5YFVRO0xCDBxN0upe43bxtIEBt7PznQ9P8uKxKvTo8icNsmVvYKMhkoyG3XM8VB8OqcoEiqouVK5QKB+tSggtXBHr9g8edOSDYXwYjuAC4VSmvz6sMZVr+DA2u1harIyb7DUnLJwhYZGjgPs/HoZ5wHKGzyIQ+Hc0Uv2viGzBrUa2Ltq1q6ygkHDCHLvR/XS1JFTmjDEkxoJvztNmUC6PsX3ZOQDXhaWBWzrQseBAD5wtHQmAuSPCjOwIe81IYUXHqBmFDc/KUIK9IrJQHv7jdc1M5IOMJiFv+oNoHOhpPLawU9Drpmw674NjF0n3AnxSio749M4VOyanFEtMKt9clJyGAFynOwA0AY1am/v3vG9ShBQaRPSEA6PplVJo3pXt4FeNiKf7l1SK/N4tJc6Qado2v4x5Wt2FFlH646xhf9c8QbKjUS/fYRBEA+JMMLIGblYX4sTq4unEJ9Eo5rKwiN8ubrxbKYL40UttiXv+qhMpEn3giDERJ3WMyatrODQvp4mJoX4WbceCMdNXmGL6TczqOTsxcgMqAqgoqoXeiP8mPoCfQXuUqtAN0iB0GLcSzg4MJl6KOiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(2906002)(186003)(83380400001)(2616005)(38100700002)(86362001)(36756003)(31696002)(66556008)(66476007)(66946007)(8676002)(316002)(478600001)(6636002)(54906003)(37006003)(6486002)(4326008)(6862004)(8936002)(53546011)(6506007)(26005)(6512007)(5660300002)(7416002)(6666004)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0JGRVJhamdKMlQrUEQ5OHdSc252NDcrNm50NFc4K2VnQXZtTTFBSjBpS3p2?=
 =?utf-8?B?QXNDTTNldTB2dWlybGNLVVhEbFAzR3RrQmVON3ZSdlhYaGpLNXZRc09iajdr?=
 =?utf-8?B?eUQ3R2ZSNk10Y3RRdHR2ajcxVjU4N0MxUEVrY3pISDY1N2JYUldJWjVFTnNF?=
 =?utf-8?B?ZERNLzBlWDZZMzl5SzcyeGZpeVJyeHBXdDFGTmJOaHpmSGpFd0hlb0NNOVln?=
 =?utf-8?B?ZHBsUENxNU0xUm01WmVVblVDSC9HbFZtMVhtUG5iWE9pWWhJU0lNL1psQW1z?=
 =?utf-8?B?M3BsWGZOdXQwQ21seTA0VGJPd0lzdEsyK1Z3d1QxWkx4U2FzMmJnanJFUmEv?=
 =?utf-8?B?L0lUeHhRM2IxZzhsemdIZFYzQ1UzNkRKcmdLVDBINGhRUnlUc2RiRGZhV2lH?=
 =?utf-8?B?K2xpYzZka0dYL0NpTmN0Y3g1b2dST25YTzRBcUFHSEpoWXVsQTF2andvN2lZ?=
 =?utf-8?B?UWJBR2QwelhtbGlHV0VmVXQ2YU1WY25HWU4xTFN0SUc4NzhVMi9qNlZYRDNR?=
 =?utf-8?B?eWVIME9HclEyQVR2WEN3U0hPeUVIQWFKVXFrL1FLOEs4RVdXRkZXcGtvalpW?=
 =?utf-8?B?MTVOc3RZMDV5SlI5MDVHeWxvTnNoRmEyZ25uYzY1KzU2MWgrUmtDS2xNOG9Y?=
 =?utf-8?B?Rk1qMVBZdVpaS2p5Mit1STlsQURDbFZrRUY2Um9LN0hxdVA2a3IxK1BWbGFJ?=
 =?utf-8?B?YUFMeEY1TDBSYUYvTFRLU1FDaTdBSWdXMXZQS1Y2azQ5OVFKNCs1S0FicU9k?=
 =?utf-8?B?a1pZS3VnN21SNXZ0VE0vSXRTaTE2MklsRXpDdlNFNDNaVVdpMXpHVVphTjRj?=
 =?utf-8?B?YnhXVDdLSUppSUltYjVRbVBCaWVXSE12UU4rSHdrbjlrK01uS1FCTXczZDV4?=
 =?utf-8?B?a0t2SEl5RXBRRS9Td0tkRnlFbStFVzNzYktPUlE1TzVtV3JRelM1VXhJT0w1?=
 =?utf-8?B?Ym5ESkh5Y1RCLytibDRaNUtxN1B6dUZzSlM0YTAwaXlmK0o3blNJRnBxUk9i?=
 =?utf-8?B?UVNDSWVNT254eWEwUUxoNHlqNHBadlhVckN1N2RJbHRpcDZsZU9DbUtYVllt?=
 =?utf-8?B?amk2c0NuSFZyTHZVOVhoWUo3OUR4S2VmYW5VNTlLSlMxMVhkMWV5VDhYNWdv?=
 =?utf-8?B?RWYvaTVuSEZ5VWkrU0MyN2ZQYTM1UzZLVEZyM0FHVU96V0w3emdKNDVJSm1q?=
 =?utf-8?B?THV4NENCc1psREU2WU9uOE4ramNSOUt6N0EvSEJETDZnQklBNzdxNitYY1NF?=
 =?utf-8?B?WVQ2QXRsVDNWNFpXNmR6UWlhM2t4QXZxQ0FtQ29xUnNuVTJabjBDbk1VWk9o?=
 =?utf-8?B?RDkvL3lQTlE5QlBxZU9mQ0NZdk85dnIwMzlBL080MWFqdjN2cEpMVk13L1Rl?=
 =?utf-8?B?dFJDQXJBMEQyY2dhamhyRDRWVVUxSU9lQ3pYYWxpUDd2Ujdlc2NNK3hSU29w?=
 =?utf-8?B?cy9UNVRkQitIMFJTQ1NKNDhDam1wR0ZuUTRIelRFQUlMaFByNzZwMU5nOU9D?=
 =?utf-8?B?RS9nV2JxV3JtTFdoZ3A0N2o4NVJUOE56RWlkLy9FekFsRzlqSTh3eVY5aVZ0?=
 =?utf-8?B?K3l0SklUWVd6WkFoSFZnOCtxTzJuU0VWSVpmNkREcDBBYTlPeU9DV0c0V3VK?=
 =?utf-8?B?MEZpUEpHT1FGMXQ0U1M2Nm5oS2swZmpER0F3ZGtoU2Z4ODM1Y1Ird3dHeE9t?=
 =?utf-8?B?eWp0bGhIOU12QWx0RTdDNTlabTBma1JSRmJ2NElUMTFWdVlRTDRXYm1JcCtI?=
 =?utf-8?B?NE9sYmFRNmxGVS9zZlF3MGx0QWE4VHNWbWZjZUJBcFlxOHZKd1J1NGl4RlNY?=
 =?utf-8?B?ZFcxTzU0VzBVZFYxd1hOTnNKUHhNRHlXekRkOGpZc2xWQzdvQ2g2YmM1cTdW?=
 =?utf-8?B?dmdSdW1oNkdCazJxL25iMko2eFRRbG1GVy9oMUUxQVNGQ0Ewbncwb3R1ek14?=
 =?utf-8?B?a28vMzQ2YmVEZ09xbFFBcEcwMVJYbHFVWHpGZGdQNHVLcmsxT2J2RnpkK3dS?=
 =?utf-8?B?SmxmYlJueTd6aU5ybDVadjhQVHhWVThYOTZtRGVPMUNHRnNvYzBWQ3o2elc4?=
 =?utf-8?B?Qld4aHFJRlNtUUI0VTRwT0VZYXFxL2E1WnloaDZSS0FMR0JhV0o2OStQRk1F?=
 =?utf-8?Q?aMZq6VU2pz0a+tpXzTCtX+TIo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12924017-37c4-4d0c-0484-08da9fd31124
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:23:30.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRmoEEsKe+hTYRjiM1xJ86epAN5DiKDMhl8Tn9EtkjbEiECj0eF+fvp407vFAfsB744OzwWhHjYQpG5ftQ53fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 26.09.2022 16:18, Juergen Gross wrote:
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -92,3 +92,12 @@ config XEN_DOM0
>  	select X86_X2APIC if XEN_PVH && X86_64
>  	help
>  	  Support running as a Xen Dom0 guest.
> +
> +config XEN_PV_MSR_SAFE
> +	bool "Always use safe MSR accesses in PV guests"
> +	default y

Is there any time line when this default will change, perhaps first to
DEBUG and later to N?

> @@ -1010,22 +1020,16 @@ static int xen_write_msr_safe(unsigned int msr, unsigned int low,
>  
>  static u64 xen_read_msr(unsigned int msr)
>  {
> -	/*
> -	 * This will silently swallow a #GP from RDMSR.  It may be worth
> -	 * changing that.
> -	 */
>  	int err;
>  
> -	return xen_read_msr_safe(msr, &err);
> +	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
>  }

When we were talking at the session, I think I said that at least there
is no uninitialized value being passed back. But I did look at
xen_read_msr_safe() only, which indeed is okay. Whereas
native_read_msr_safe() isn't (nor is native_read_msr() afaict), so I
think part of this series should be to also eliminate the undefined-
ness from this code path (possible now only when xen_msr_safe is true,
but as per above that'll be the default at least for some time), where
the caller has no way to know that it shouldn't look at the value.

Jan

