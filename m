Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A779CC39
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600174.935825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzye-0005pT-Je; Tue, 12 Sep 2023 09:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600174.935825; Tue, 12 Sep 2023 09:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzye-0005kO-GF; Tue, 12 Sep 2023 09:46:36 +0000
Received: by outflank-mailman (input) for mailman id 600174;
 Tue, 12 Sep 2023 09:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfzyd-0005WW-8h
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:46:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 422f74f9-5151-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:46:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 12 Sep
 2023 09:46:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:46:30 +0000
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
X-Inumbo-ID: 422f74f9-5151-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHQdQfkqFylBEkhl/UtkibYGtxm/4hOwuwfMSB1iTSlJCwOxU7J+WhHUF2t0RS7iqP+MuxdoilLuDaeQPW+kGfoWUmHLidqg8OlYOdvasakSiChTJhbRr3eAJUMblIHqpxTK4VLqI+X7tjSgmEV7NbiqmLtzPcueKl9HQtm7buvC8Z8zqn8qWrMAf+dP/uyZqWvTVRQkP4xSSyEWlRK7gBoqxR3TAah0LmVxpVEwuF5avnS/GzwdePveeLYLyI1GdmSTDfYNSqpLWIkHBxJ7qdGbcIAQLETlYb4+4cMzKA5DqAp21SQDiM+fvABLj6MI6KrD2t3KChi6YNjjeCtHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPu/qrkMBDpL2V5NyfEyr9/O8yPPYmrKt6TezA4M4OM=;
 b=l7DAejJTpSCmWfjwDx0Nx7diEqyZP7rctloowjtqLygXPytXKUtu02lWMVQtKl8H/6i9DLcUD6lQovit8BZqH1p8PdOCfzXgR0HxLA/tcHxAcI023/e5bZt9f0Svekt1UE1mx9SZJRUnvHHHMuC6KEZCI/aMq5Nph099yNPzWjPuKVJo8ORLIYR2mthNZApUdLvJfJJze06KdSbaTbnF4Z7W+0LUIqE+U8p8FF3PJrUL2RS5zli7yp91HT+U/4PvsdtXBCg493SIjSdTmrwCCY/EAKsPRDNn2XKF+I/K5awTGmLAfx1QYGJ8af8tf0F2TyT1AL4MQOiCrWGLU0pLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPu/qrkMBDpL2V5NyfEyr9/O8yPPYmrKt6TezA4M4OM=;
 b=moFL+68a1H9+ObmivKurHfZ4NunKt5c8tvDUpp6jU3+Guumi0jR3/uks+ddPm41/rJGLf+weSIvwsWc73W3Z1bLQ7yJvh+rDtbHfCxeOBQItJ6N3PRJ4a9L1woudqmsqZSP92cmWf79TaH6HKBilbQMU4aZFp1oAeXj8CsYgqPrshWWQOrrQdky/AcO9QDo5nkluOAXMzAUDlAk5hyKZtmNaZJ5neZH7DssmP01a+/iG+zAOW13k4qIrr3l4oLrDkWO4X4ZhwVTNtfZ8M2EKnILz44YlPmj0BGGj264JRhiSaTEw2fRB36YaJAGnQKOgJjPyFOACCLbz6dP64z1CBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb421d34-64d0-f9c1-e44d-d3622ac8c3b7@suse.com>
Date: Tue, 12 Sep 2023 11:46:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 01/10] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <e78d0868a635fe9fba851bb8c2cfc80ba6d73491.1694510856.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e78d0868a635fe9fba851bb8c2cfc80ba6d73491.1694510856.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 4986abf2-4d09-415f-832c-08dbb3752460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B1u4OT7DRRYHNEtTTmS3DNhIPbaWrFLYUUhKl4z/AmdvWuZAlgSJHC3wAKPo89aD0FcJOp1PQl5jz7foEnhzkC+oXIWJmqVP3v84+Yx5zZlx33ZPBZJrHKT+zFqqyRhVXVOX6p6QIrTJ+DRelaoxnqUIu8Dqa8JnmpFC2rTUbA2UHwWSmvi1Ts3HGRtcWeRBgGtZrcinyWpCvJTJGPmnSQeOrmWCG12unu440cl5o6U+XDLd8YWp0LCtbkDPQQmTvCk/6NdzDH6vNQS63boMJ0SjOGkk5FYAjuKs7QB036yrdqkAZuzoKYnOOQk9FijjZwUEr0RKpFZxRGJHeE6+AUXDJ9XYDsDORmvwcurSXmAHuCYCkUQRv3/e6HjFCKmPAHZw2lmK5sov934zuLsNOMdM9wTHHJzx0V2coSSgAI1yPHEDWOByadsTVEW9+8PVfW/HVQIwdFg7/oeYeSwKA7fOEb+mKUu2w5hoNZjab4mZmJXimaI5yzsgZW+ZbdpcjPpEAsezFG7xvOpmsMew7ZKkb/vQEthsXetuwkrPwSoBFL1UiwUkdP5DEJxCwza4sWI2P2FiJv38DIsd6DIswqVnJHKXORk/uQ8PBTSEuQUz3GEM3up3HMU/YJQ4BCR2UxIzhQo89imepV+JzLC5zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(186009)(451199024)(1800799009)(4326008)(6512007)(31686004)(83380400001)(6506007)(6486002)(86362001)(36756003)(53546011)(26005)(2616005)(66476007)(31696002)(478600001)(66946007)(6916009)(8936002)(2906002)(8676002)(41300700001)(316002)(38100700002)(54906003)(66556008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWRHeks0a0FHc2hMOXBRTVRhQlBDWU4yUlVkcHRlY3h2SFpzOFFIcTB1VDEw?=
 =?utf-8?B?WkVZdEFDcDkvTGNXakdNbENRZlhydHZDNHVqSEROYk0zdlhnbFdac1VnSTVU?=
 =?utf-8?B?UFRuODlZTFJIVnVkYXZSWG9aS2t3ZmpWRXdvYnozdXk4YjU0WURoaXVHSXE2?=
 =?utf-8?B?Q1lvZGVsamc5WVB0R1prYit5WXhPUVFoWHhkc3U1bzM5TkFWQldCOEFsbzZq?=
 =?utf-8?B?SllqU2JOMndpZHFTTUR4V3BDeHdFQURNZTMvUmVhTnpaV2d5YlAxZWNQMW1M?=
 =?utf-8?B?Y3o2cDc0OXo0NDZ4NnF5SHh2TmRxRDQyQU5RVTdJeE1OYVcyRnMrRk9rOXNG?=
 =?utf-8?B?emZ1S1BwaGV1YkdNQ2xJbXAyK2l3QVNRQXdFUHBpemR0N3Mvc24xYVNkZG1y?=
 =?utf-8?B?dW5CTFBFRDNidFdZSDd6NDNFSG14TXdWWC8vZy9sbmlzVEtKdVlDMzJody95?=
 =?utf-8?B?MVhXWmpzTmlyU28rbVhraDVEaHp3ZWJoZnVlNGljbXZpTFlOL2loOUdSNHVu?=
 =?utf-8?B?K20wemFoUmNPRVE5UjRsZmNtazA5TTJydUYyRHF4ZER5M3BjV3dRTzYxS3dk?=
 =?utf-8?B?THBEWEJHRlprc2lBVVFWQW5CeFVrUkwyT1ZjOFUyZFJMdXZDVTdWa2UwT2dt?=
 =?utf-8?B?eHdmZjhmTXVrcXpkUW1IL0xOdWlVK2hlMys0dkF1cjR6NGNSNmpRUFhNVm95?=
 =?utf-8?B?aFBZcnBiWSt0cmo5eThleE03VVh6TEJQcXBKTVZnRXNxL3ZMN01GNms3VHN1?=
 =?utf-8?B?NVArdDIzUUw2dGQxcGxSdnE3OWdOejFPVVpIVWUwbVdOWkpMYXBZK2doVG12?=
 =?utf-8?B?YXU4Tk5VKzFlaUFBY3lkNG9TbUE0VHJUUGRvYTAwZ1FONlRFdDNWOHA1TUxy?=
 =?utf-8?B?OTByUTh0VVNWK091Z25iaUF6cWtCNDh6MXozUUxsTW4yWVlVNTdXZzNiY0FD?=
 =?utf-8?B?RjVSN1FPMjFjeE0zSmVqbUtqeFp5TG9wb0hzUThtL2NHTStVWUFqZDBTOEhR?=
 =?utf-8?B?T01wcWJCU01IM05IK284ajg5eFRIOE1ra0dkejM1ckU2RnM0azYrMDBBRFRV?=
 =?utf-8?B?WGxRZXR6SDcxOUwvbGV1MlcwM3RWRlppNXlrRE9YZmltK21tZ1ZWQldGYmJy?=
 =?utf-8?B?RWRBMllYOXJXZmZQOW9JdU90ME5QaXcyVkJqNXZhYlBzSExxZ1FXZ2dLeUZX?=
 =?utf-8?B?cStzcTQ0dVFLeTZJeVkzbGg0RlZFR05HNUdmcUpOcmVxWHE0Z2wrdnZJcXZz?=
 =?utf-8?B?cjIyZDdpSFA3WUZ0T3ltOEJxVHZJanBDdVJmSEZ3YzY2L2VVbFE3UXVXekNC?=
 =?utf-8?B?SlNuTWoyNlFDcVBSaG11Y2FSUldjMGx4RmxpdTFZNk1Kei9qS2pMdUZ4azF6?=
 =?utf-8?B?OVZBcjRWL1l5RnZwVFhQTE9OOHJTL2tIcUlLSk9reG5PdlVKQkdRK1Z0NHB1?=
 =?utf-8?B?a214QXQvcmQvTHEwMjArS3JoOEN6Sm11R0RSUUk4dGt3OEFlSVdzOTlyL285?=
 =?utf-8?B?VU1GWTd3eFkxYkJRclRmOWkwei9ORVJ5akRmNzA3YlZXV2pKSzJmNGRwT1pq?=
 =?utf-8?B?U0krUGNkYnBZeVlQcjZLRDJmSS91ME9oYmsvd0k2cFM1d2RSbmRPVldLQ1la?=
 =?utf-8?B?SWJCdHV5RHFJN3hkSmg2N0dLdHB4V1pxamNsbzhCTFcyWkhidGRPcEZObzlo?=
 =?utf-8?B?cmErOTVmeWZBQTc1aXVnMVUyZnNJd29zcEN2QW8xSVJkbHJISFQ3aTFGU0dI?=
 =?utf-8?B?S0VLNmJFUE9XWS90U0xrZUtlM2E3UkNqbDRZTzF0dmZRRi9HRDhlUTUrSU5E?=
 =?utf-8?B?VzF2dC8rOGVXdVhwOXZUWXRaTnc3WjJDL3ZHVjZuRThiVm10TjFVb2IvekYx?=
 =?utf-8?B?cWVlSjdKNEtSbjZEZis4bkZNdS85SmxDWHFMajM5WVdTVWRacm4rWUFSeHRm?=
 =?utf-8?B?L1h0N01iY0ZtMFpLb0QrOW9LSTJ5eGFnVlBsNmFZRDhrM0FTdXBtZDBHSjgw?=
 =?utf-8?B?MW1XVGNGVXRabVpBV2dYcGtId3dCREhpd1J4ZkYzWU5CY3dpWnVDdFgwVWQ2?=
 =?utf-8?B?L0hEUDk2c2VweGhOZ0NkcWtZNGtzNm0rZnNKVmk4dUhJbWdrL09XdDIwYm1o?=
 =?utf-8?Q?VSXFVk10q6mkHpLfiegkkLiyx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986abf2-4d09-415f-832c-08dbb3752460
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:46:30.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+tdW4gux5RtqqcaCfcs6l8cCxEQQq1+xOlPZQV9yi2+blQfyDnA8yUy5i5x62WlY1u6rodxCbdw0OGKtGnpmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9738

On 12.09.2023 11:36, Simone Ballarin wrote:
> Some headers, under specific circumstances (documented in a comment at
> the beginning of the file), explicitly avoid inclusion guards: the caller
> is responsible for including them correctly.
> 
> These files are not supposed to comply with Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of a header
> file being included more than once"
> 
> This patch adds deviation cooments for headers that avoid guards.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v2:
> - use the format introduced with doc/misra/safe.json instead of
>   a generic text-based deviation
> ---
>  docs/misra/safe.json                        | 8 ++++++++
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  xen/include/public/errno.h                  | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 39c5c056c7..db438c9770 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -20,6 +20,14 @@
>          },
>          {
>              "id": "SAF-2-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
> +            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
> +        },

With this ...

> +        {
> +            "id": "SAF-3-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 6b6ce2745c..eac1ae4b2a 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -23,6 +23,7 @@
>   * their XEN_CPUFEATURE() being appropriate in the included context.
>   */
>  
> +/* SAF-1-safe header that leaves it up to the caller to include them correctly */
>  #ifndef XEN_CPUFEATURE
>  
>  /*
> diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
> index 5a78a7607c..8b60ac74ae 100644
> --- a/xen/include/public/errno.h
> +++ b/xen/include/public/errno.h
> @@ -17,6 +17,7 @@
>   * will unilaterally #undef XEN_ERRNO().
>   */
>  
> +/* SAF-1-safe header that leaves it up to the caller to include them correctly */
>  #ifndef XEN_ERRNO
>  
>  /*

... you mean SAF-2-safe in both code comments. I did point out the problem
with the sequential numbering (and resulting rebasing mistakes) when the
scheme was introduced.

I also think the comments are too verbose. I don't mind them having an
indication what specific issue they are about, but it shouldn't be more
than a couple of words. Here maybe "omitted inclusion guard".

Jan

