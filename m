Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F34EBD15
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296100.504001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUBy-0004tO-Pk; Wed, 30 Mar 2022 09:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296100.504001; Wed, 30 Mar 2022 09:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUBy-0004qR-MW; Wed, 30 Mar 2022 09:00:38 +0000
Received: by outflank-mailman (input) for mailman id 296100;
 Wed, 30 Mar 2022 09:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZUBw-0004qL-W9
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:00:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc575362-b007-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 11:00:35 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-alfkak9tNBWPvVz4k-QC9Q-1; Wed, 30 Mar 2022 11:00:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3860.eurprd04.prod.outlook.com (2603:10a6:208:7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Wed, 30 Mar
 2022 09:00:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 09:00:25 +0000
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
X-Inumbo-ID: dc575362-b007-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648630834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPREeCdMwfWN/OrzsJ9qkfGJrGjv9HyfQxfvelFs0hM=;
	b=RRpO9fKZHTLjtZ9TE3CMVTmBtPUORwaHiuXik28/3xjPKz4rKUypdHStcgnQzuS2ooCsAg
	gLcpRCex+izV4jzEypskdnrZkCAnQLJ2e3vpZGvLauqVXVNGRviLyT8xp5IH18spEqyNbK
	slT7cdwL+JroBO/8fvmvFCnWb1hWSMc=
X-MC-Unique: alfkak9tNBWPvVz4k-QC9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtbnwHJNi/DIiYVkRf4DD6RZru+YJl6G2t1AFUVtPEL8lNly4kwiZNeNWwGH8E60kdv3orqq6QNLDZjkJUv9EZuhUYUa0EkHh/cFCm7ndiXaE4LciuASohhTMb/p/oz+r18Haig2GA+MSgn5PgOVimXbGWs8p27YGda2PFGabRJsGlZXDcSVNEksSm2bNYk7ItchoQwXg4uo+OoKsV2p4NP+gnjlymEEyr0ALZ/oGFCCk1pfXO4cF896vFFBkMso79EhkgiKPom5jaAETJS4cTjKRYp+fiJuekbHxEc/G9UFIwdGMcMzCQTey/xxcBg4RQrcZoYdX2EAkWrvwkw5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPREeCdMwfWN/OrzsJ9qkfGJrGjv9HyfQxfvelFs0hM=;
 b=I6p1dYLuHu1fP9V4jg+j/BZ+8yaVTjqnD5UmESK2J/CGokbqPqG42pe/cl0IHTS537RsLZtGujPFqEtxbX0z5iXsBQsdOTpNXHNOUaw9Jv2Lb4nrqyYx/rivM4Lhj4JLYjA4c4QINgtT1PpWAiRBlGdy6v4a7QUcM5AP2s6L9wZsB4MKoaYmMtwa3JwXycQBuG1509L7dCbMJtGg3R5AsUmN9cHAo+m+IrVpxAlyc897myg8s+sUMWJYHWc3Vw0zhBm4uSci6k8rM10EXoeXHgx9FDC9VoflWEkjAkxrSltLteE49v9Sl+zMCQdynY4+pbfxqojAiw2yRTVqtteZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <001392f4-6c7f-3138-0682-32ff202b3ee1@suse.com>
Date: Wed, 30 Mar 2022 11:00:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@cantab.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307205313.31247-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307205313.31247-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ebd22e-0516-4c9d-5f1a-08da122bb989
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3860:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB386047143C75932CC40A3922B31F9@AM0PR0402MB3860.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B8BNg0zDJT+IOe9vtkcMs8VKCQNfVqrHZmIkdNGgTav6HzzXpUzOty0WAoqe2OzZbZAjaLw1d3dt/is1+0me8T1OkUQh+NxsTFkhYJ0TQahb8/B99l7y3iAmP39zMNqIQ1XMSVrIHwlkHFz4LH87w1wT9MbabXfUF+5okzCZsDXStGkTyCGnMKa/iVKS5R8h/n8+/AMGoAgsZ3jdprK+Hxni8dzPxTefiZ2vw+Z0ChIU2g7XCocqbWaeKFzhxqaRZZKZT4BnHI0vYDy7S6SLsgxFOGgy7aQMAchELPvJbDYxHFUftaW4a5J9Su1LidZeWn3UPAICzQRbXkhJXSiRLNGmzYsWoaEk//rZQddLSKNVh0jfPSSVozb4ZBPmTLixyxiCWFYV1e28Kt+heM81dEDFmJVBtdT4Vg/D6Iv7JLHcmzJW6wn0v8U6JTyp62rOJ51bRewkQeaJ5j8iWWj/AK9RMPjxlYzwajPB5ZjfsCr/wOZyQ4Q8Ee1WKSFpaFp8RE6/hSeh+eobVzfpizm1I4uhGyUShqjXdQcbFFWnqC2+1TjbL8XaDiWjamFTlhdmiQaI9+VsnLq6tiuvJEDLtBEq2PIB5Exr1qSsegg3QbMExr6LaQeybs41x1+owOUSq/hH6+70UtZ3jJCAP29Gxqe/0SFTiPj+2WsJgaiKI7BG5Iu7v3gyyfYaAuUbweGHUQ+qNfh1YqTpOnFunTyCGLO2Zx8+dBBQ+43uJLBsva4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(66946007)(26005)(4326008)(86362001)(8676002)(186003)(2616005)(31696002)(5660300002)(83380400001)(316002)(508600001)(2906002)(4744005)(8936002)(36756003)(54906003)(6916009)(31686004)(38100700002)(6506007)(53546011)(6486002)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2wvVm0zN3ZsdFJ0ZWhRNmtCa1ptZzFrYllsdFFhbHd0aUxQUVgrVW93TUpW?=
 =?utf-8?B?UTFlVVVmV0ZLQ1h2T1Y5d2NCUnBPU2FZTStOOUxnRjhJbURBZUdNcXlPQkh5?=
 =?utf-8?B?TCthaTJFbWV2U3J4MWtxWDBZNGlWdUEzMXBETkovZW5DR1JNOFZKMnhKTXh5?=
 =?utf-8?B?bE5YY1NLdEE0eE1DcmVhazZoeGd5MXlLTUVuNTNJYXJxbFc5UE00RHJndGVY?=
 =?utf-8?B?aiszTE9sMFZUUjJqNm94Z1k0MlJDS3ZzTWhMT3Y3WitqcVpaM0YwdEFVN1pV?=
 =?utf-8?B?TEJhUGs4VUJQK0lrUEczUE42azQ5L21zbE5iZTZFeHNQRlVuWWJSNy9Mc1B2?=
 =?utf-8?B?c3U3QndlQkpGaWpPelNjVXVUMy9JdVM4MnJ5MEZHbDBvc1ZENFBPUXlJWVpC?=
 =?utf-8?B?a1QwdmlMaU15U2JZbFI0a0l3M3BuU2o4UFB3MGphYVR1WWVjM3BzaWNwamtR?=
 =?utf-8?B?NktOam9uOU1YNkpHbW9XV0phNTVnRHk4UnE4YTBZdXM2NGxIMm9WUHZuL01a?=
 =?utf-8?B?NVFScFFsNXBNVnk1Tit1TytYRG1iY3c3V1lrb1VwTnk0aHRLb09WMVdhMFpx?=
 =?utf-8?B?RWg0b1NhaVczeHRkYXJOWVF4YW90ai9TSXBXUWRTeWhIVDFjUXk2WUh5V0tE?=
 =?utf-8?B?cHR5VFhacjlKQUVYbU5CZ2ZxY09Vc1BQQXExWjJOZE1ZRHlGRlI1OEQ1Y01v?=
 =?utf-8?B?SVZFZENZNFBVWnlSR1ZVSThUWVN5Y1dWTml5UUNXQzlRMTZkNlE3RHVSdGY5?=
 =?utf-8?B?clZtc0JLSzAyU1k4QURiWE40MDZQUU10bEx3a1hXWTAySFg4VDNyRitKRll5?=
 =?utf-8?B?MExOZnhPTXI1NzhVOVlTTzdKWGJmQ2JweWlwdGM4SGlWSDRDSFhYNUoyckFi?=
 =?utf-8?B?TDFoSWdWTHl3Q2hISHFkMjlLcUdSK1hrZGdwTko0N1lud2NmZ3dPQ3pmQkc4?=
 =?utf-8?B?ZXBFdEN3Rjhuem5SenRBc2kyVDhRdndWT01MdEVTTWIxcndWdEtOWWhBVlpk?=
 =?utf-8?B?c3kwcGNyOURhTk9jeU5qYSt2REFrc1hGOFo4SWdMeTIxbmZEU2Y4Mm5ZaTVj?=
 =?utf-8?B?MFlVWUUxVElDaEpyTHJyc0dISmNXZlBEZ1hvT09MY2dvVTdwNlJSelROdkQv?=
 =?utf-8?B?d20rVW1neDBSVjg3dVFubEo2WnlLN21qVVNoSC9XTjFwZWtkZnFuRE43TVpz?=
 =?utf-8?B?R2JobitIbjZ4eVFnVU11alpsTWhaL2dsSi81RmI1akxuU3FRRmpmRFpWMFVa?=
 =?utf-8?B?endaeGlpRjJvUTZXRnhCL2ZwbWcwRFVENXJZUU9yNFdHRldDeEllVWdrTjJN?=
 =?utf-8?B?NEttNEJjZ1FxeXdxcktyOEdRWGYwUFBFWHluTFJsemo1OXRTbitQQ2JkU1Ry?=
 =?utf-8?B?MHQ2WWFnb2NJeGtBNyt4em1lNGk5bXFCUE8zMmJyNy83SjRXUHh1Qi9tWi9Q?=
 =?utf-8?B?Vm1qTkdXc1NKeC9zamhjTzZpRGl3SklwM2VJelE2U2ErVlRVZjNYaTNxcWxC?=
 =?utf-8?B?YXVUOWFDODFNN3k5YlJua2cxd1ltc3dBQWV6L1JPL3ZCMHd6ZTBrSW5OSnVJ?=
 =?utf-8?B?UTBKTUJRT2FPTE1QS3VlSDAvMDlETm5SYTFBUCtlZUliUk1OWlJXUEsybVdJ?=
 =?utf-8?B?dXVkTGdvbHZKbUVST2NJTHgwYXBna0gySXJ4am5qUVUwZWljTHlzbEw3bkNR?=
 =?utf-8?B?NldWSzlWYnVORkZNV09Pb3Zzc28vZ01BcFRpVC9HR1paVHNIQk9uT3lWeEl4?=
 =?utf-8?B?MzJDMDlsR3hhaHUrSlIrZGtIR29PT0RmbGNzTkN3a0dtNEFPemZRV1VWbnlW?=
 =?utf-8?B?d1ZtMzRHVnRVL3Nqejg4V1p5RFlFMmtRWm04S1NwZzlyN2ZyK2hWcnM5SFJq?=
 =?utf-8?B?WWd5dFd4VHM1NFpmVU9UbnFyNmt2L1FZTUZ6VU9lR3Z6aFlzaE5nS1NvRzhy?=
 =?utf-8?B?eUlFMDh0SjBmY2ErY3g5WUl1SjNrMklVeWFEbGQva3VjRk1EWm5Xdzdvd3Zr?=
 =?utf-8?B?SGxJaWRkbGZNTFNMU1cxZ2owWThLeGpIc2FMK1VnRUM2emJlM3JtQjMyZmVB?=
 =?utf-8?B?dUc3QmdGV1ZRaHZ1cmNDLytTcWF2VE5CUXhTeE1tMTBXTkJoM2xlZzNMOXZa?=
 =?utf-8?B?dXd2T3huTXQ2bjg1Wk84RURUeVRHbnZCcFdSNHM5cHo3ZDZhSXJaNDF3cGxF?=
 =?utf-8?B?YkFuTWdtTnEwOFNrOTNENkFyT2RKWGZzc2lmN2FxZWpONEdZck0xckd4Y25L?=
 =?utf-8?B?UTBxYkxwYnBPbmtseGU5VWx4eWhXaldCT1hWaEVxRmpaTlYyN0FCeGp3M01C?=
 =?utf-8?B?N0phUDd6aWFjS0ZnVmFjWjV1SUsvSC9PTERacnIxU09HaFZZUlk2QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ebd22e-0516-4c9d-5f1a-08da122bb989
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:00:25.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuWf8tCh64reayM1b1JhbvBL626ZWLRuHwDpRBpiajL+n3UUxF4d8tBzrmh0fJQyXImIzh8+3j9Jsl3YynFrCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3860

On 07.03.2022 21:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -156,6 +156,16 @@ void machine_kexec(struct kexec_image *image)
>       */
>      local_irq_disable();
>  
> +    /* Reset CPUID masking and faulting to the host's default. */
> +    ctxt_switch_levelling(NULL);
> +
> +    /* Disable CET. */
> +    if ( read_cr4() & X86_CR4_CET )
> +    {
> +        wrmsrl(MSR_S_CET, 0);
> +        write_cr4(read_cr4() & ~X86_CR4_CET);
> +    }

It just occurred to me: Isn't using read_cr4() here somewhat risky?
If we crashed on the CR4 write in write_cr4(), we'd try to load CR4
here again with a value which may cause another fault.

Jan


