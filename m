Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6536CC20E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515898.799232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAJY-0001PR-HA; Tue, 28 Mar 2023 14:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515898.799232; Tue, 28 Mar 2023 14:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAJY-0001Mz-Do; Tue, 28 Mar 2023 14:28:44 +0000
Received: by outflank-mailman (input) for mailman id 515898;
 Tue, 28 Mar 2023 14:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phAJW-0001Mt-7a
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:28:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe13::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50d78c9-cd74-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:28:40 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9421.eurprd04.prod.outlook.com (2603:10a6:102:2b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 14:28:38 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 14:28:38 +0000
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
X-Inumbo-ID: d50d78c9-cd74-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcFywrLDgnW/ChEKNZZgiBoBkqJ3tRhxfo7MwlgafRvmsVpb7NqDHPJW6WwulkYl6URIHZ/+GjG6hP8L5Qd+wr29VhrW6bqqaplaRNrezKODjVGaXcEgG5sMf09qfCfb6UpKm625hT9e1/QDGbmt50Tm4WxQXZRJiYfxB9KNi9v4xpDMDmMhSxXCDabZHo3IWweJRtclLaR/ZaRg8r7jW9fcOuPG0a6ZtGcgyRqfZ1OlV78UE1V1zzTu2l/pdo1vWRsD4EU89N3+Y8rYu5M3kHS8YNcg2B9fLuMmYGBT//rGm+Mtpb014JxkD/yBf4iDjI9H0696g2NxnaozzjE9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrRzzGZx79GvdfvZtfyt7X++JTiFnWIX+XEBOGPhBY4=;
 b=kRDOcC06KJPvJ9mpvYsAlGcMPYoICU/wXeIs1YICLK38rJreZvwxR4A1v0/bcmGjLREqf4voUna11e+4+5dKozzeHfPrRTokqwwuGxTy5EwDmXIp13ov3BLVf1ceqcFiZyLbocG/TP8t1DGfShwXCo1zOTUWbWfWaV4uT0FBUEa/Ck9SUyrQja3sJpWmSEfsH0DEKKDRAZRX5Ky6LpMAwJockLvyXakmy4GB8/y5KgoJMuUnqVlEr4Lv7SHxJtazIuntPejHgEKdmxBAdm0EgMntn92ASFI/WNnwguhx6Ko+sEeGvLtBR/Fkmhwyoh34P4An7NfZP1GRGDBXEODLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrRzzGZx79GvdfvZtfyt7X++JTiFnWIX+XEBOGPhBY4=;
 b=RhN1yIKvR/FjETD+FDO6/pvpLeTHvpFilEaFRJCAhqbK6XsIEqBi6NSw+Xc/G+GXFsyk0FJxqSFURICL35DGteIkcHQ42F2tRQJqLq7p761FMCTf47cmULj1HYyJcOdDDgkW6W38ZsqjRzd4sqPI8N10LH8TYWmhMtS9WLcFA4d8y7OfPkLQ4/OWAu16qW0LU/MktXVzt58atqCVkDKbQZjZPD1hlnbXPauAO0OcCJaRPvvPB9X7viGi3iNj/jNsvlWmanYyzJIDWdTQ36AzUhzzo7JmDGMVv+q1xF4G4+DUSTYXOIYKow5G1pXKWV4aJl/rvRztk3iwoNkj1sSuMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7539fcb-0e47-bb4a-f39f-d9d60e072a7c@suse.com>
Date: Tue, 28 Mar 2023 16:28:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] x86/ucode: Drop ucode_mod and ucode_blob
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327194126.3573997-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fcffe7-c1ce-4c38-d480-08db2f98b841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bsTysIwaaZ9W/j549Yzd85RF54HqbN4FO+P2Tkiw41II2N5lT2ifad9Sica/+zAeYT4Qf/7A3016gQoQRc0jLYzCri/ipAlagBageZ02bvkxXqSY2ZyurCn8gHHPSlqtcYuwNF/NI3nOTphQjDMpl0hGQxhFaTjnfSbkyy0GpxkokqeIAnfrqCTiFT1m4dhN0AsRsKByZxQEo8UzOHOcPyRE8JGq483AL8sZ63Xe6MTjJF6s69QwYhII/G4x8JCEP91S11nRWO7vFQEh07PuQ1Gv5ZFeowEqUy5WVnK/+RP9ka3mUDTc2Kqbr4UlZhpEWZY2yJ5pal2WDwhORvnWebSQzE3hfchz26gSHcv/aWcn+taapOjEg49til2NcMZ8p+2Jl0ABtf2TM3kV9RqLleq/uSqNLreCOCdIECmHuthf/NDOrcdDC5XyXKnW2s2TJ0P9rfW8+ItN8SZ9MgtBkTcjTrWaEFwdPzXj9MfqSTHH/ns58Azjv4ZZBtMdWZ9PULga4ZHMnxpVYUR/z+aStOfa75IjlfeG0hXDGMDD0acFQ7O5pbWcwj2IuiO/Z7XvBGvyrYfcR/qVeHakBrLDkhzt5BWXihNzytCQwqIhZU9iy56he41aCWt1J5iEo1WrkI59wNiGZOtoT1JRMbiqLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(38100700002)(8936002)(316002)(54906003)(6486002)(31686004)(66476007)(4326008)(41300700001)(2906002)(8676002)(6916009)(66556008)(66946007)(5660300002)(31696002)(86362001)(478600001)(36756003)(6506007)(26005)(6512007)(53546011)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enBETlR2V0JJU1BVQXJ1a2tONjdmQnJtcnZHYXR1TlZVREZPRW4wazgvU3JH?=
 =?utf-8?B?aU5LL29QVHczSzk5LytJdWNLMnJaMjJ3WVZxZHN1em1PckdNOTBKTGlYdFV3?=
 =?utf-8?B?Yml4VFIzaTNXSHZ5OFNjOWxIekJwbWJyaThVZjNGNUlSRnRBaXR3QUI4enli?=
 =?utf-8?B?RFhUSEJZTUdNYTY5M2ltVjZsY0ovNElmRUdKV0JLc2VtRENtalR4a3NyQ2pt?=
 =?utf-8?B?eXZudDVJWTNYdFNtZG9YWXd3UzVyb1B3bjVOOTVCY1h1TGJCUXJ2Rzd4N0ZD?=
 =?utf-8?B?bmpBelFzR3pRb00wTzRYcGRpTEJyZWlMbjdzRk1rOWhET3kzd1JObHZId1pl?=
 =?utf-8?B?QVFsUEw2aE45RHVqYWVBNEdNSy93TFJlaks1bnNtOEEzV3BaVW9oWGZpV0U4?=
 =?utf-8?B?eU9BbXhHanlGRHNGRmFYci9MTVQ3YWgyYkUwZkJNZVJ2WFF4UllBSnlvR2du?=
 =?utf-8?B?QVNjM1dkbGpEZFhoM0dzQUljNkxDeW13S1pnVkl5bUZCRFdyRDVPL3FlT2xl?=
 =?utf-8?B?STErQmQ3eUY0S3R2ZUFuMXlQdlorTkNaZFk4ems0cVl5anp2akRyN0ViMmZ4?=
 =?utf-8?B?UVRtWUdCVDliR3lIMlBXRmU0dnh6NmtaSlR3U1htaVgwMVM1ZFlmOTgzVFlm?=
 =?utf-8?B?UWxmbzFHR3NYS09jbFFMUkJwMjVFKzFUbHZlZjlmRE53OXV0TUNQeStCQVNN?=
 =?utf-8?B?YStCcW52YnVtRzlJeEpxYWUvdksveHhmMkxwSUJFanQrQmE5Q1lHSU1YM3Jm?=
 =?utf-8?B?a0FmV0RRQTZtVVlmeFAvdHc0dk9qNi9HY0hkOUpvblVNbzZ1NGZIeUN0amJU?=
 =?utf-8?B?b1M5QVNTVnNTSUFTWExlZUdUL29aQ28zTTA1eGhkTmg2aEo0dW4zN0liM3Iy?=
 =?utf-8?B?cmE5YWNKdXU5L2diTHJPMWlvT2xRM1ZlTEFhNWlHa09EWUs3cE13Z1NCeTU2?=
 =?utf-8?B?b0Y1TFpmMDBkN2xka0UzWTE2V0REYUp5QzdEVVdsMVZxWmNxNVpoV0RxVzVv?=
 =?utf-8?B?M3Z4TjBaTExVd3VnT3phb0UxSG85UjR1Tkk3aU1TRHhxenRnLzg3bW4xZ1l5?=
 =?utf-8?B?aHN5L0dUUHExOUZ2MkxxQ3hWT0NGeFZyd1dIN0N2Nm82V01IN1ZCaytnZFVq?=
 =?utf-8?B?eDNmbFpadlBqQ1VQQVJkSFp3Z2xSM3VQWTFPOUwrZ0pXYXBpSmlxTkk4Vjhu?=
 =?utf-8?B?aVJVYlNkWkMvLzdsN3pjOFFRZ1JnR2IyRXBodWVQRmpZN2lUa1RzSzhaSGN6?=
 =?utf-8?B?TmwxbUJwSUcvQnFGaEFBajVoVFQxaXpQUjdVTnczNVFUV1JoZVRPMVJ3RTc3?=
 =?utf-8?B?U3Awd1Z5THRiZUNGWkdUSDU2R29heWRZTVlTd2w3Zk5uZjNxT1FYeDhIUWQ2?=
 =?utf-8?B?dDlPM01JdzJyV291c1YyQ3hNQVFzdUQyMDlITUdmbzZ5NFMvSTIraVp6Qk82?=
 =?utf-8?B?SXBOVlBtdWhERnV6ekhRNERmN2ZhdFlXVHBKdnBRcVNYMkhkRENNbU9PNVFm?=
 =?utf-8?B?Y0wycWNCL2RVUEVOS3dOTGd2NFhKbmtPMmZxd1lNR2JJUkVCaDN2VjJlbUJU?=
 =?utf-8?B?ODV4YWhla2JIa1NQYnNEUUlzRTAzSWNCdEIxUWZBREN4RzdKSnVic1R4eXAx?=
 =?utf-8?B?WjBxanZ0dnEvQmpEV0NOV3o4NDREUEtoMHdxSk1wbXMyeERuYTZONnVVdnYw?=
 =?utf-8?B?N1Z3WjRTWXZsVkhJYUNqczBGK29CY0J1YWdjNi9rQVhYNHFPbDRudjdZYmVF?=
 =?utf-8?B?cFBXKzI5eDRuVmlYTzZOTFh2d1FaZWdtOGRKb3UzVE9ES2EvTlhIMUpBMGZC?=
 =?utf-8?B?WTNidjB4T2MrY0c5NHhyd3dMbHVUZ2JDYmNKRjMvRWhLY3dVdVpIQnZFMXFs?=
 =?utf-8?B?bFdSUGlPNlg2cG1OeUszUTZRMnlWYlQxZUFYMGpJNFVSWGt5RDUyTGlZUzN5?=
 =?utf-8?B?YVJUZXk3TXJUTXViamFXQmpyNEdMUVh5Y2pXNDJESUhBLzR0WTNQaktGYzlE?=
 =?utf-8?B?Ui92MU9kMmhrN3pDWTU5YmRpS1pybTRBY3RKdXdHVlIveVhTSjRqK21ZRDht?=
 =?utf-8?B?UnVCdkgreHRtVWVJY2Y2cDZWVEd1UHVCYXJwNnpabFpsUitmcFg2VzNzLysr?=
 =?utf-8?Q?iYCK9SDpNccyD3tT7CpS3v/ox?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fcffe7-c1ce-4c38-d480-08db2f98b841
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:28:37.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJAMFkx8A1h9RqIcIjShlCgoNTo3c1AnVBFyxILkSH7uTr+0tmObrxH3L9sZWkpHIlR+8ZItQun1M9V2blhJqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9421

On 27.03.2023 21:41, Andrew Cooper wrote:
> These both incorrectly cache bootstrap_map()'d pointers across returns back to
> __start_xen().  This is never valid, and such pointers may fault, or point to
> something unrelated.

As before - unless bootstrap_map(NULL) was (carefully) not called in
between. Same ...

> With the refactoring work in the previous patches, they're clearly now just
> non-standard function return parameters.
> 
> Rename struct ucode_mod_blob to just struct blob for breviy and because
> there's nothing really ucode-specific about it.
> 
> Introduce find_microcode_blob(), to replace microcode_grab_module(), and
> rework microcode_scan_module() so they both return a pointer/size tuple, and
> don't cache their return values in global state.
> 
> This allows us to remove the microcode_init() initcall, the comments of which
> gives the false impression that either of the cached pointers are safe to use.

... here.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
but I'd appreciate if the description was adjusted to only call the
original code as bad as it really is, not any worse.

Jan

