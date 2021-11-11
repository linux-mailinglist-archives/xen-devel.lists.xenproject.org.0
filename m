Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEED44D575
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224702.388154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7os-0002HQ-GZ; Thu, 11 Nov 2021 11:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224702.388154; Thu, 11 Nov 2021 11:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7os-0002EX-Cs; Thu, 11 Nov 2021 11:00:38 +0000
Received: by outflank-mailman (input) for mailman id 224702;
 Thu, 11 Nov 2021 11:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ml7oq-0002E6-19
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 11:00:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9829b0c9-42de-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 12:00:34 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-U-dGOahpN2aIkQZG0yggWA-1; Thu, 11 Nov 2021 12:00:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 11:00:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 11:00:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0021.eurprd03.prod.outlook.com (2603:10a6:20b:468::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 11:00:29 +0000
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
X-Inumbo-ID: 9829b0c9-42de-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636628434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+ZSZcs8LMHeEBhVtCrNtbwSi9N0AxYfGpxUMFiZIn8=;
	b=BgkOUNEKH4y6C62pZ7hKlIlblrirBdVtkIrGE2QPzhrnPxckRJYi/rurqoLK13WQpmeDpu
	udWh4EvhAvcnPImeIBEZlpoGO7NnLw79/s8uQNWTnh5yDhJqYo3CfzkP9svL4y2jI5ZHnE
	JSY4pJK+CkpPAWDDb51vBx254mMkxa0=
X-MC-Unique: U-dGOahpN2aIkQZG0yggWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LomRstbX7Fb4zIJDJXYqs+dZ7rbXklruAUwOuVq2XcRMnjYUcWo9SCpxZCT+NlcxSB/wUasQ8wDRaEjkk8bbwHfa9aEe1M0O3JEHihdVqPUpvMrRDUb96kpZHQozTFyl8LqOLqBA2H6cjH03+KO54xQ9dY8xyEPCUAOLuGU69KY4YVzuu3Z/JRTLUImUhfQ4kqMG3uDBbH4mZmWY+hm0SIEiGaO2v9xOGwHBftaYhhQiLXERDm/OESiqLUDh19CnCnMvySM8ak/YAptz4fMbYa/U9oeT7re5UDG7RWI+zDJ5iJqAXFuEJW/u0N7SO5fgodIHRXZ2cV6qkm3wRBpE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+ZSZcs8LMHeEBhVtCrNtbwSi9N0AxYfGpxUMFiZIn8=;
 b=Zdw0UigzjAz8t2xruzNBSqifjxbiqomyq/IYUJaOMBHpMCGXBS1sICuaCCH6IlQsHTfiGdkNCDU3JND4zDugcY3cdh7ZvQwxxN74hP+m3FAqkRhJJFK+URb4AYDG+vxejT4sRK0En4U0rz7Xsyfy+HVSXAKK2f1Rzw8FXBn6UBlaHdJWQvGFhES0uF0HazBw+0Jv8rVtwWVzaaVLvdVfYS9pMSFRo83n0KW2swGGPJJUr17c2abo7RQcMFdobFTfwesZjjYpPCqtzgtHndbAbk8VyFIou+5L6XOCmvzj2If5wjSyOgYXrBIZMBjC3Xp0/7cBAiHdU2cQsNYfd38NSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be6018d7-da39-6764-ebb3-9edc393526fc@suse.com>
Date: Thu, 11 Nov 2021 12:00:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211110091935.16906-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b2b1e2-7101-4fe0-ec33-08d9a50279b0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24463BA0B5FA5BC69443E91CB3949@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eHw1gIGIooIzHgUdF6sdO82a4lZ6Q1MvBy25PcAnHNTJqJSPa/GjfTOrzp0Gcom3TjPwX3d8pBe8mJvB+luDLB/nmrrvFPm/BQeMk1zwKhxAPBn1/Pw/WxgSZKo0bbALGQMclzwrVmoSYhGXiQPqaO6SlpVKNL2tPuuKO9mBLV+jCzugshbzE0XZLOT5FPvUSNhdxh9PAgFyG9YNLhBEoh6urINliOKhPmdVyuulujBWZ05WYuD+8y5qqsn33yZ53eLCb8bpwCiWwiOifPSgiFd450BpnjwpEd5lhnQfwsD+DTzm/VpvEnaWMULFLALYgF2lvrm4VlQhddVFb4CsnZt89BDQdXwZdTj36BoQnJT25w65IjskBfn0MJ83Y9iIXgF9vpmhK9slU6za3g8MB0pWLOVBdqMncq89Y3oaQhzog+nG8BvBDkN3vn5oAsgagBdFXXLVK7OrDQy04CYlBWJQXjLLcgLB1QhajfOwot6d+MlgXgoJorzTGdC+8ph9RXOS8qiKzNDhdaivx67eVU8j/ikE7fwLnMxxErfre/fSVkW0YLqUvAlep6vqbUAgUxcXfXZttgTaYYUv+jKs5GY1+E31bOJRn1m4tItUzyWQSERoPu4GQZeE3H2mq/OVG6rwCHme/I6uR0fM1zx2f1OugcpJ76B+A1V5IsOicy87sradEeZZIRnfK0AGQ4pkKJgeevOh6sMDi7NGqDa/NMEjiqPEO5G57nCPLLIyO8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(2906002)(4326008)(186003)(38100700002)(8676002)(6486002)(316002)(16576012)(66556008)(53546011)(31686004)(66946007)(26005)(86362001)(8936002)(5660300002)(508600001)(6916009)(66476007)(2616005)(956004)(83380400001)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjdOUWxYV1hZQzN2UFU4eWtFVVFQM29BV1pzOW5WM0JmLzFEendYTHlCcTdz?=
 =?utf-8?B?a1pwbzkyYXZ5NlN2eGVzNFpveUxIVEVXT2REZmtYVHEyTENjN1FwU3kvblA0?=
 =?utf-8?B?d3dZRHdhREVSQ1QrcU5oa1RhNElYQlcwM3N6eDlxbGd0aUJJRktoaFcvOUR4?=
 =?utf-8?B?ZExMOWFpcFd2cTdkdVBVVkFFb3hVTnowZkxHay95bXZmWHlwWmpjTnRhSEw3?=
 =?utf-8?B?ZVdqd2JseEYrOTdObDRTdldlTDdKa21EdE1JWitsNmw2M3dkY3I2UFh1ZnVN?=
 =?utf-8?B?T1BXRkp0Z2pLY3ZZMlZPS2VETk5lNlU1dElLT25qelVoNHZGbXRxY2tUK3g3?=
 =?utf-8?B?Nlh0cFM4NUtwaG5MZk5URnE0OTdBWjhFUkhud3NNRyt5aEpUNHkvS3ppWGQw?=
 =?utf-8?B?U3ZSY0ZtRVVQNGZOcXROZllRV2JUaEtuRTlQQ25FbVh1Y1lFK216TEhTRG03?=
 =?utf-8?B?b1IrOVJlZ2lOSjN0dEVxRFJUSFZvYjBxUlZpWjRLS0ZOUVNIbWdwOXZSOThj?=
 =?utf-8?B?WlJlTzFobUlTRVAvblpuVUhsYTVGNmVUOWwxUXFmMm5UbTBYUmtHOXpxalVt?=
 =?utf-8?B?Qk9reWF4dGFWWllEVTZJNDdDYTlqUGwxZS9uRHdEQkMxMnRwSVFMcmFNcllB?=
 =?utf-8?B?VHhROHNFMlVvUSs3L0FzeC9LU2tFVFcvYlpKMHhJRVpyWFBxbXVsNDl2RGRU?=
 =?utf-8?B?bDI1QnhyTWdEODhKdXJRTlZvMmpPWlFUbTF2U2hVWlhUS1VKR1AvM3BFTGNk?=
 =?utf-8?B?MW9reG56blk5Q1dRMWVNQi8xWWl4Uy9wT3NYSVhJcm1yNE5ZblVXVUx2T01u?=
 =?utf-8?B?RHBCMVdRemZUeVdxQTdKWVlnT2hzMUdjWVpxWDloamRRV3BwL1pHU1FOUDBT?=
 =?utf-8?B?cVpaZXhpM25pOVpLajlkYUJKK1c1ZW54ZC9qSTMwTUJqUjZlL0p0N2NmdEVW?=
 =?utf-8?B?THo2emRseVBockQ5NmtEOUhYOUNINHY2QVdkM1lnL3hJbEsyRyt1V0U1ZVo0?=
 =?utf-8?B?azVIT1BnS1Z2bnU3b3UvTXkydjRobm1JaU0rdDdlblJuMkVFVUIzYXBRSTN5?=
 =?utf-8?B?T2RPNUZKWmFjejZlWUFGbWh3cDRIZTY3TGx3WWRJR0l2U0NwZVZES1VWYmRm?=
 =?utf-8?B?T1VqQWErVTUzUlNVYkFJRlp3bUNza2tSb2pZZ2ZYL3JhMmVRVENsS04wZEs3?=
 =?utf-8?B?MUxhdXpoREFqeXdYcDVRZFNLV2RqYzUvS1VoQ1l4U3pId1RRSHFHMnFFN1pi?=
 =?utf-8?B?OVRINE9LbEtReEFIaDNyZmRjSElZTjdkQUVYYmM0dEt1RW5MbFdrNzMrbmc5?=
 =?utf-8?B?M1o0OUZNRFdrekxITUc3TTVKN0xFb2s4ZzZLRjl1QzA1blkweG0yM1I2dmt3?=
 =?utf-8?B?czFTZmFUeU54andCaEhSc0dSL3M3RHI1VzJiMldaaEhQL0NEWjRmdW1qcmE0?=
 =?utf-8?B?bVRDZ2NhRlpUSWl3SEc3UVpQeURORkRPd3RjaDZCck9nTGVZMVFEYmhNWUxk?=
 =?utf-8?B?bU1ycVQwdEpSaHBzSHdSTjV0OWNQeGlUTUtzZHpmL0ViWk1HT1hCODdDQWRz?=
 =?utf-8?B?bFpJVC9pbndRdER5QlF1K1FBZHRxL0l1Q3dCM0VtL0RuelRGcUxjTGh1TjQ2?=
 =?utf-8?B?MTdadlIwYVpZN2FwSm4vQVJiQnFuOVB3K3RFY1h4YS9VLzRneUd6WVhMbmpW?=
 =?utf-8?B?dTA5cDgwTFIrMDRyQWw1U1I4QUJZRzZ1WDM1MEtuclVubXJWU3lYK0M4dnJG?=
 =?utf-8?B?S0J3OUxhaTZsVVJobkZJQXliUGxmSzZoeFNTWmZTM1dBenJpa282WUJhYjk4?=
 =?utf-8?B?TDk1OWFhNWx3eEY5S05udjk4ckpJSy9FeUp0aWJjRHlqOWZoYStRTHUwY2pN?=
 =?utf-8?B?TlRPZERLaGJPdTkvKzdJcnNYSFlZdTlMejJNUmZRK2Y5MXlZaWplazQ5dFZ5?=
 =?utf-8?B?SkRyVlcydnB5b2sxSEM5dHFSbnRCZkRXZzFVZkg5MGI2a2h6OWthSXpwRFdX?=
 =?utf-8?B?U0oxUHlESzVQM0pBTFlGSm9hWlJleWNzekRmMTEweVFDTjY1cXByUWR6U29x?=
 =?utf-8?B?TjljSWYvQnhtcDNQQ2VUTnpIT3BaQ3h2ZjZSKzFtU1Npa1lzTUR3SnpBdC94?=
 =?utf-8?B?TVU3NmNXRFlLYU5lSVBKR3BManhJRmdqdjhGUmxiZlpFSll2dERTWXFDaXNY?=
 =?utf-8?Q?kecI2lKWB26+3MShJBEoiSs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b2b1e2-7101-4fe0-ec33-08d9a50279b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 11:00:30.5927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JG07yOFNA/v0OxX9pzKh2Jd0dFfGvru0DToG+dabvztFj07j6xoY7bMzdmjkZP8ansrS/Z2nmQNM2mnPK8VjAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 10.11.2021 10:19, Jane Malalane wrote:
> Before, user would change turbo status but this had no effect: boolean
> was set but policy wasn't reevaluated.  Policy must be reevaluated so
> that CPU frequency is chosen according to the turbo status and the
> current governor.

Aiui this only (or at least mainly) affects the ACPI driver. Powernow
updates CPB via its update hook. I think this wants clarifying.

> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
> 
> Reported-by: <edvin.torok@citrix.com>
> Signed-off-by: <jane.malalane@citrix.com>

Nit: These would look better with real names added. Without I'm not
even sure enclosing the email addresses in angle brackets yields
something that's valid.

> Release rationale:
> Not taking this patch means that turbo status is misleading.
> 
> Taking this patch is low-risk as it only uses a function that already
> exists and is already used for setting the chosen scaling governor.
> Essentially, this change is equivalent to running 'xenpm
> en/disable-turbo-mode' and, subsequently, running 'xenpm
> set-scaling-governor <current governor>'.

Otoh things have been this way virtually forever.

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
>      {
>          ret = cpufreq_driver.update(cpuid, policy);
>          if (ret)
> +        {
>              policy->turbo = curr_state;
> +            return ret;
> +        }
>      }
>  
> -    return ret;
> +    /* Reevaluate current CPU policy. */
> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);

Is this really needed when an .update hook is present? IOW wouldn't
this want to be in an "else" to the preceding if()? Or if not,
would this perhaps be more logically done prior to invoking .update()
(such that the hook would observe the updated policy, in case that's
relevant to what it does)?

Jan


