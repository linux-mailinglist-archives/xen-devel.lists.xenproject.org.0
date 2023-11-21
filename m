Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA27F32F4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637939.994064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T9W-0007BN-Up; Tue, 21 Nov 2023 15:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637939.994064; Tue, 21 Nov 2023 15:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5T9W-00078g-Qz; Tue, 21 Nov 2023 15:59:06 +0000
Received: by outflank-mailman (input) for mailman id 637939;
 Tue, 21 Nov 2023 15:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5T9V-000774-AL
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:59:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4a67ca2-8886-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 16:59:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 15:59:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:59:02 +0000
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
X-Inumbo-ID: e4a67ca2-8886-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqicUxu6SgWzWncMKe+mOTJW+RsKodDMp+EFQSfxGUidF/EkMe59rtkUpNRUkTEq2znjo6m6ZNrOXYwRyooCLKZUVoYOL7a9pmUQ9DK2r9F5lhn38BzSr9jnUXqF2oRRf6eeeYScsLoLw624Srci8UkcuBO+afJyS767xdore0uI8HDLzJLcERfaVgf4Di2pNFOqmxyryZXCvQZKqJtysId63pXLFpDs4XD1mpWn9EAjUJR/1nVUJpAMwUQRhAIAQGhRgjKMgQS6yHnRll8YuyfHWmtz/Dr2swndIiQNBfHM+CkPMClhq+6R6MuNVeiRCpD/QHNuV6BZFA7HEs0vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbniaed8oJVQiYFXzwkKjYo88w0s+o7OLfhaTesp88c=;
 b=h0dCVHhLpT722BynpobeAJPh+9hku4bE+qeHSGSpqKwLDMRPHo+eNMhh3q+iEaN4c4v6wRVtvveIovz4h+Mh5CmPVHNr0w3335NoDW/DR5wEOChcGj8XkL58b7hzyEG5fcyM1NpFXdzFTr+u6xmu6wvQhx0TcNQLaH4brZpGSX5hIFrBlQWn+IPaeZBk3bXBl28XincLHMO5T1DoH0U9ovlwHGlBmdgEVrGPIFH9fTp2WjqziDVBGxRaj4mwcAgiOzTu+MsWnfsLRvUYYEq7Qy7rvhV8smaG0VJ++FY8VFtGWuL94tshSVpa8Robz/5di4q8gebHz4OFuBcTBsuRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nbniaed8oJVQiYFXzwkKjYo88w0s+o7OLfhaTesp88c=;
 b=KebHr9aH2GTnnfF/FDml2COHflmSP6j96iWnxllpV3KFEy/jTe4AmVVq9uBU3JdfilnSmNdGhO2EnmlRtbC6aVeoaKpj9D9VUtRVoevbhb9gPSBOdFESucVJe+XXV5rYlabLXapiZg5C0Rk89iD1wQc529WwQWl5ccmRFRLAM/v3dHotF7c19OmpGljw3Ql15Kr9GGYnhDOYewRP19+D8u12isfN8J6lH0QjrNGJb/ZdjrQbukgZGTF9w26zgid+0FuGSASVBCReZraLZ/K9j0mYH2Cw+rHB3Jzxq9nztGGnjdAMcNSKGk0XTOSIqn4PtUOrv+woaY8z+llWp/M2kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a486065-75d9-43a0-8c9e-5af26c1e76d0@suse.com>
Date: Tue, 21 Nov 2023 16:59:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/asm-generic: introduce generic div64.h
 header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: a148918e-4b15-4288-aeef-08dbeaaac800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLj9l2nbE3lnoqnFExkXbKPYIIa41Ht/q07tYCWQgp6FhocjZ11sifsHWW+MWvAQErPODsE3oReKP4I6yeye8d+yejm9wcfOvyKQ80fx3KbLhuTtw7WHsaRPx4aejiwzWdyVyETGq2g5goODjEzNgKRU4Fmd0LVbBmlFF+KCkIBGAk83vUhr/ASgn1MHP9ER75SactOEb47+gvagGQ1rnn6+B8DTYvvIQww9wwU2y9CHBFjcVKKJEFrDJT4D3Xc1eNEzmmMPTm0rJL4Cyh3Dpj9hD6On/pN3ky8+AhWcSVrZQIfSpZ6XdYkC/+m9jBn6fFDWHKbetb04rv1Zvqay8dq9ghTQkT3nYq2BQd5w/RlMO2GavgEwHGfvNtlu0S0kVxVxm3bgRAFrdTBpzOvW0l22Tc2qfnbV/uPZnBtpUURHLLym2zm+tb45E8ylLGTOnH5fjibP/VHo5X6sloH9f/qmJ3OiADoCJzYXv8lygHA1oTsBcNlg9rXQ64fGNAq85RnDRPWfWWik53tbTcWr9Mz4em7AZaXyQrtDctCYzat5H9yTtk8rdwCzKTd+cav1WbOcOFCwsA1T+mpzwZ9l75U2z0Z6Orl9VmssPvLr+oaWQq4F95A0xRMwDPy93c/lVQ+80JLwWkV2CBY52POxrMEau0u8wziHCL9iS9A0AGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(41300700001)(36756003)(86362001)(5660300002)(4744005)(31696002)(2906002)(6512007)(31686004)(6486002)(478600001)(6506007)(4326008)(53546011)(8936002)(38100700002)(66946007)(316002)(8676002)(6916009)(66476007)(54906003)(66556008)(2616005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHhEa2tlaENFeGUwaFh4RE1yMnJEMERFc095aWxTWGJ2OFNDNHpFWTg1U3l2?=
 =?utf-8?B?czNZYnZuOXdUZGY4eHA2ZXU2T2tYWTB3QzNDM2M0VDNnYkpRbnBnRUJpZlhM?=
 =?utf-8?B?bTZsN1hMdk1EYTJTUXA2ZTYvaWtnMGxWVW1nTm1ydHBUdFhFRE1SRDRrVXVw?=
 =?utf-8?B?dE5PZDJWTzk0SHRYTldMS1J5WHBsRkNDSzYzTWR1VWY4d3l2Q0l6anROc3lo?=
 =?utf-8?B?R3hFZmdhc1NzdEh2cVM3VkhiNDJNWFRhbW0xT3dmb0ZsQ09kWkNmSDRlNUQ4?=
 =?utf-8?B?UzhTekg5ckNpdGJURkQwSXNIN2FBZnJ2QjB5Y2ZPRE5PRTdLYlgwZzNDWWZs?=
 =?utf-8?B?SWJWN2F4Q3hWSjhVSmtBOU1EM21nbjFhaCt1bHFUUDNQeXRudlZqc0V1T2FG?=
 =?utf-8?B?bUFkd1FZQ0NNR080ZkI2MkQzbzRsTE5xNkpzZjNnQmx1eGMzTzdZOEpLcGQ5?=
 =?utf-8?B?bUFrOTZEWi9NcEpZT0ZpdjFuUmIzYW1pM1dBMU9zNmxBYzc0ekpYMG5OZFY2?=
 =?utf-8?B?RU9NOW0xdm8vTjdSdnlsOTgvR05sbnRJam5vRDNvL1c1SXdBa1c0UXpUUUhW?=
 =?utf-8?B?clZjUlkrU3k5V3ZDaTRWalJaeHBKRzhUVUtmTmRGc2hZazJyWUhaR0dHSEd3?=
 =?utf-8?B?NVUrYU1aMnJjUVhXaDliQUgrRHp3VENhazhvSklNdU04SEZvb1RuV2pDb3dy?=
 =?utf-8?B?anZrRmpDVVQ2WDhQRW5tdVpTN05EYThOSXdRdFBiRUZoZU9PNm4vc0ZTTHNn?=
 =?utf-8?B?VnZ6T2hiVWl3eTEreEhvTEs4UlY1eEFhNkRPendteTdkbkhCb1d1NXFkSFlG?=
 =?utf-8?B?SGJXaUYxWnF0RmZ1TlFIeVJadklrb0F2cnMyaFQ1ZXFxekY5QVZKUGYzWjN1?=
 =?utf-8?B?aVlTUjVrdjZ5U1BMakZIbFdPWjcwc3ZpdjdySTkxWUp4eFBaNXlUNGZNaEZi?=
 =?utf-8?B?MFJpU3czYmVQWUl1UWkwQ0c0em5aTEh0U29RVlMrdGp0TExIZEZOWEpkb1kz?=
 =?utf-8?B?cnFhY3BYeCtGYm9KeGlWUkVmWGRUUm04Rk1VS0RPcks0c1B4TlNtYVpXQVF2?=
 =?utf-8?B?S3FLY08rK0FTWE1SMksyQnJDeDJsQjN0Vk91cmlXQm5yQlQrbW9vY0ZkMkNs?=
 =?utf-8?B?aXFrRWlzZXl4KzEzN2lQWHJSblgrTkhxN0NnT2ExU3RqendBbXM0ckxYeVU0?=
 =?utf-8?B?bENhTTNkZzhPMDUwVWdFQUhXY1pMZlB2MHJ3ZVM2TTgzaFJwMXlWUFMyN3M5?=
 =?utf-8?B?ZHNURDM5Nk96M1IvbnBVL2xCVnh3NkxvMmtiUkF0bzJGcUZwQ0xOczh6a0FK?=
 =?utf-8?B?bjNUZjRqSDRpTWQ1WHBrZWlNTDZRR2thOC9jWXNHMnRvYXhyYUdCNFlpSXZo?=
 =?utf-8?B?NTA0WjNGNVVSc2N0OGx2SGpKcmtzclBTazI3UjBNeHVqZWJkSU5ZeTBrWjJ6?=
 =?utf-8?B?Sjl4NTFkbHpTNCswSURzbUNwL0dlK29paW5HRlY0ak1sOXpRNzQvU0c1WDhG?=
 =?utf-8?B?eVNJbFVBcVpnYWU0SnZjQUY0amRCeXNuSHJrTGx3V0JuUExPSUtrbWtEWm9N?=
 =?utf-8?B?RjdtdGhLbDV4NmVDOEEwWmxjbS9WbjgycXpoNmpYRG9BeUFTM2g3a2oxdEs2?=
 =?utf-8?B?b1crY2tRVGxNVnlkQ0dsM2IyeEUxMFk2SU52c2RmMlZIQWpRaU1FSkFRb0dT?=
 =?utf-8?B?ZVBadWhNR29lN0dzRnJxeDMzbTdYYmlwQlU5TkZBdzNPRDM0d1JoVGt4T0NC?=
 =?utf-8?B?a25yOE9JbHhMOW5sb2NPMTRsVEZOZVdPVUJNNWxCSUFLL2xqc3lmay9LTVJa?=
 =?utf-8?B?eUN5U043ZWRoaWtvVEJTUHhDRHRLVFUxWklIc2pQVzdzT2FxRGtlVEViUExM?=
 =?utf-8?B?R0l0aksySllsQ1R2V3h1ZVZVcTVyT0JqN21MRVNYMVlSUkc1QUx6SWRuQ0xC?=
 =?utf-8?B?QlRRU09ETXNuYTdhQVBUS1ZzNUhmUnNGazNEMmE5YVg4cjRhU2hQR1dDd09u?=
 =?utf-8?B?OUIzMml6bHBHNzBKVllQMG5idXdDaDZlbnpoNm0rNEFWTjhkVUc0MTB1Zzc1?=
 =?utf-8?B?eFlsbXU5ZlNuMlVIQjdzMmpNaW1rck82MVhYd0hSVVN5TENISmlkVEpTWDNE?=
 =?utf-8?Q?ZCAoiwT8lYqVjnx50rjWW+MkI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a148918e-4b15-4288-aeef-08dbeaaac800
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:59:02.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StETC6HWrKDwsj0VIcusLBtnE0T+eEFSw99iWieDA2GRTbF1Tc/iYR8bdWijgklV8tIjumY6J+CXv9oZnJBquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> All archs have the do_div implementation for BITS_PER_LONG == 64
> so do_div64.h is moved to asm-generic.
> 
> x86 and PPC were switched to asm-generic version of div64.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



