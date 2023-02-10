Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E66918F7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 08:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493115.762937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQNVI-0007tP-BE; Fri, 10 Feb 2023 07:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493115.762937; Fri, 10 Feb 2023 07:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQNVI-0007rQ-85; Fri, 10 Feb 2023 07:07:28 +0000
Received: by outflank-mailman (input) for mailman id 493115;
 Fri, 10 Feb 2023 07:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQNVF-0007Mc-WF
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 07:07:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91f55e1d-a911-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 08:07:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7029.eurprd04.prod.outlook.com (2603:10a6:20b:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 07:07:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 07:07:22 +0000
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
X-Inumbo-ID: 91f55e1d-a911-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvRySI0DlVTF9N0PcBcFDb5WDvAdaE1RecI9kJkX3IR5mcoaF+6MqYCvuoUXYU6pGGc/mkC9s7D2mxLf5XDy8zN4/qMicRItfUyH5zxGcvPLeb7JWg7sKCfezsUUtAUn3VbTcILve9ci6cxio9tpDmTxat8Mp1xKiNN5VGJu1A6r/w9fmbZ2kKtcxcYSo9AgqE+bxAM82deVv5jQPhmf10gl2/v3HS23aX9t2v/o/a/PyYydNTSjHLqKKE5S5OtUQPPxAc+Gc7JpzyGcKe7EZKEPrFUT8zuO6j5byISWmSNM757yK4mF1GSsvz5Rm5ianWYgvJLs4fTmZiPvXimftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdZufVofTAmzX8PPw6oGCkz3RIXqxNKnbYb4efDk5Lw=;
 b=e4sCdqRTpzyKfeUDDlGMYiX1p3GmmeCjb0UG/Yb/WroTi4Zm15yMB1Kbg2WTpj35AfvgEiGygzyXv/EHpWJOFLO6NA3EpSBskR/Vl0sBpCe4gyJXjgTEk1aGmIUvn2pfKoK3asZ+OkhAIzzYDhWZ65MmwTJzEQcUddWolorjdkf43uIm/nj5lTAFgoLZ3opJjNquNBPIlZ2/NT3NkWqkbEtxOEgaJPlCd/BWsHBsFdUgFZ39FeiTZh5Ham8f5I7Mq3leOKqNNdbXUe9fE6WGLkKVFHc5LlhOFT+I1g/juCCKCTtVMZitYIigSR2/Zud9IVcEb2m6dEn/1gR8C8qr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdZufVofTAmzX8PPw6oGCkz3RIXqxNKnbYb4efDk5Lw=;
 b=mcTEVxqzPxy/7QRE9U6aGLNB8ZtscPp1053KFGk/S+B+yZyT9OJG50Z7ATvRkXD2FTA3UkppHSduXzpHLoioI0gm4PQVjJh9OC+aq5fGXWzQKdJ8olOPETDfgO5tmuL2oy+e5e+ALlkaGjoA0Qj4r4BqThbiSB4Wbr9IPdZJqD3yuzQQc14K1Gimq6weWjEsfu5QcLaW6RUySg2sKUkZPn8/mTtpIfJSVqk2kSrXpB7C+LRDwIu4o6NGVxbxAdL6QOcTEvfGog2aUUxZwvUftsgHnXLQ00VHLT6wCF3ITUgu17KWVp9nGbACmyTJqLN7iqOOoaLTNQnjYDHfqECyIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a365e7e6-7ca8-6724-52af-efcc92833a94@suse.com>
Date: Fri, 10 Feb 2023 08:07:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/4] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
 <7d2dd28a-a821-e906-6245-ab26e5518706@suse.com>
 <7751faad-d281-bdce-60c3-74b17f57313b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7751faad-d281-bdce-60c3-74b17f57313b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e687a41-a009-4312-fc06-08db0b3574e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2H13tlB4Zr7+QmN+toMbceO7iLSjIdxKzGFR+0/Cjgoh5h9WtGP4PyUtq+ftpUID98hAYC3H5OHzFj804qWCL/5Ak7DZWYRoJdLhgI8iVe/x6V29KJi/RUCy8reatNIe4FZFdplVEG/eQYXrfoImd4CcUrPRquPpLRWQu0VfpH7hyT6f6bQnk9tAKH8QSUyjlxCciuf8nPPVPkG9Aig9FCRuK0TsGoEZ+LH/jV7VtG6WWZdiJz2de71ykPBm1yWSLkTW794yMCEFmBpjGgvuDKoljmr7dwiCowWa8pa6bCPluNN9JFVm22pvOkJTtd+/2M+iQYENurotBzKRF6Tg51lrhY7Rhq6wRPeraukbNW8uSCR3Q/EPnPiUbeBogG8900rITIJW0UMlXqSygPuX1e0ZRZ/nMg3dQkxN990dmSQHS22Jy2NpoPssap53c8SlXmtTZjaI1zqpkwjHHna5c/9gXZHej08KVwdMe3sdASg9rwrC2vcdWpRGl+gQMHCHGPhmpKwm1wJfImwRCCETmuss4FgYhWIJtWKyMdOYMZY2Sr+9UqwC4fR4ssgiCQ7oSxVlkkd2Abz/Azk8nmNrimX3oOkOVV6AOemByWyIj27Lgw5NuMdpNElTnB8hYJZ3vIUEnwnQ6K1rktowFm9Nxz5q6J7VmnBFg/nQRq/RfLHZm4pbCusKhqcucdHjjoW20VFFFQ7Czp03ICkDl7OqfuAENZbqm/aJUsruG2ZRhN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39850400004)(346002)(376002)(396003)(451199018)(31686004)(4326008)(8676002)(6916009)(6486002)(54906003)(316002)(66556008)(66476007)(41300700001)(8936002)(66946007)(5660300002)(36756003)(86362001)(31696002)(478600001)(26005)(186003)(6506007)(53546011)(6512007)(2616005)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yno0WVZBemkvMUpCUUYvWTVWdHJtQTBKOUttdlAycDNKZmJuVmxiVkxRM1Jo?=
 =?utf-8?B?UCtrM2dFQWNKS1dsbTlPOGJoZ1EvMUo5eTlyUjJKVEQxWU1UZ0p1cnU4OFZ1?=
 =?utf-8?B?MnZVeXBWZXY4cE5HWjI5OHgzRFVTRHh2SjlQOGdMREl4NDE4c0tHUW8zZGVR?=
 =?utf-8?B?aS9ib2hnc0RUN1FqNkpOL3VtZEZlSFlwYlN1SzBSeWhlVUJVd092amViVUlr?=
 =?utf-8?B?dzZBb2dLNElkZU5KVnNDSFRkT3hLVGJIaCt4cHF2SEZKd3pxdFdLR0lMUlFS?=
 =?utf-8?B?VlB0dUJpbXlDc2lpMU1WbCt0eG9SU3RBcnhnQkVVcXU3YXN5SnphcUsrZmIy?=
 =?utf-8?B?M0FrbFhhRUZ2WXJHMGxacG5nMzQ1d21kMk53ZGJDd1JEdnZISzhqTVRZdCtW?=
 =?utf-8?B?UHlEaTdIVWhJR3NXSCtGdmtSbS9ncGVDNWFuczNsNHRDSjNNaXk0YXovcXh4?=
 =?utf-8?B?Rit0YkhRZkVlOEs1ZTRXSW1JR0t6TmZsa2lZTHFYZ1pHdmxrSnpSaG5GUzc5?=
 =?utf-8?B?cW1SSVBCK2x5V0F5UmFadUxMcDJqN2NzVWhZTjl2NTlLMG9vNTVHaW5FVXhL?=
 =?utf-8?B?UnVuSWRucWE4Y0NkTk8zZ2x6eWM5YVdiSWxjdVVPR3Ryd0EwVEhCVzRRQ3gw?=
 =?utf-8?B?ZC9NL2loWnlncFVMUnBzL3JwZWNFOWpNbFN6eGpIVHZDU2tob3RpdGRMZUJO?=
 =?utf-8?B?N3pQaythOExhVFFBckVMb2hxN3UwZU5IK0xaa3ZHTm45TWFWYno5ZVZOQ2Vn?=
 =?utf-8?B?OFVoMUhWOHdKY2l3Vjh1bS9KWVFtS0N1QUFGcFFTQXJaWkluTHZyQnpNSUwy?=
 =?utf-8?B?TEp6MnUrbVFITGxCYVZOaVFFYTk0Q28vS2R4SUx5bVRKOFhETXdMeTFObktS?=
 =?utf-8?B?bjl4YnNUSjZNR0thOUNnd1JGTmF6WEpBL1k3cTNqZVFwU0VPbkdsV2ZnNUJS?=
 =?utf-8?B?dzNydUtEWTVrUEVjbHJBWGg4cjZYc1V3eFFQcU5xV2o3QVVFTUVOR0JTdlp0?=
 =?utf-8?B?VjN2cGtWbW1LSnVmS0RqQmh0OW93UHNGQkJITUFGZFVKbkE2V0c4MVFHUCtn?=
 =?utf-8?B?L2F6cjlQTEt3NlFWa1VYWVZoVXo1Z0I5azFrZytrVmtLcTZBN0ZNTXp4UzRT?=
 =?utf-8?B?aU9KL0pqdTZ5ZGp0SUVBeitJcFRtZGQ2YW5FNDcxS0crK1kxTDgvaVZTbkp0?=
 =?utf-8?B?WU5RK05NRklsUGdXOFp3SXViaWp5d0ZxbTBXQzJvSE1JWjEydDhaT01KZnJZ?=
 =?utf-8?B?a3laZDBGNjV6NVRLWm15TVpjUnhkY1BNUGR4YU1vVWFTZWd6dmorM2lxWjR0?=
 =?utf-8?B?Rk54U2FWWWZpRy9ibkFTKytDRW80cEpNdnYxNC93VmNYWVlwUWxNbnRSaUFs?=
 =?utf-8?B?ZDl5aGhiUnBKR3BlanVVREplUldURldRMHdSNFR4SnRWSHU2UGZqR2RMVVhQ?=
 =?utf-8?B?WUV4Q3lvVjR2TEZLaWpDUFQ3WmJiMjcvK0tqUE55K3V6S0FiTWxGaC9BbnpP?=
 =?utf-8?B?cFhreEZpRzBYc2dMNTM2MkpENUNORGFBUHVJV3Q0NlhjV1VSMWVPWmJJTFlD?=
 =?utf-8?B?ektoNXBRaUM0SmZoQldPcGVTamdhZG1ScHRWOXBvdVVqYmNIQnFyVHk1THUw?=
 =?utf-8?B?TWd2dzVJZ0JTem5xMS9Edy9zeEF1Y1dsdTJ5MTQ5NE94LzhJQWZBeStnZ3lT?=
 =?utf-8?B?VnNFVmo5dHUzM05UcXNWSVBzUUhqWGpCdzQzZ0JKUWdyckhNMVV0TlA1dVhN?=
 =?utf-8?B?S0NBbTNaNk1XKzR6MkJyMkI1cFhmYWFTbVlOSThMZjZwTlZzcnJVT0ZsNHB2?=
 =?utf-8?B?QVRlMjJ5ZVZrSklqdXprRm1ZSVB3bDVoYVkzUkNqTnBmelZ5cVdvMFVXNVlp?=
 =?utf-8?B?ZEExYVE4ZlZwWVcrKzRoSmtOU3AwUW5jTlJuVzl5ek8vb2g1QW82Mm1hR1pF?=
 =?utf-8?B?TG45VS93QUt3MjRlQVZwaHEyMDJBWXUwUHF0Y1VRRzIzM0VyeHZ3azd3OXM4?=
 =?utf-8?B?ZHBlRThKT0RIOXNtV0s5cUF3Qm1SMHdVdXI1K2ZiTUdWb1BITThIaUxWNjMx?=
 =?utf-8?B?RUZkd3Y4bnpwY3liZmZINjFCRG5JM1lHWVVFaWljelhpcWUzS2lmUDJmb2Jp?=
 =?utf-8?Q?+GG+6mu3Ge93YEbVCqeDRgb4b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e687a41-a009-4312-fc06-08db0b3574e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 07:07:22.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgg3yHz4S3nvvtu57wTjDtX6ehb5Iv63t1stOreSGA4NgUVBm0FAA7GPHGLX3gm8UkWq9pJCJkbSxE/2h7B4kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7029

On 09.02.2023 18:26, Andrew Cooper wrote:
> On 08/02/2023 2:38 pm, Jan Beulich wrote:
>> First of all move the almost loop-invariant condition out of the loop;
>> transform it into an altered loop boundary, noting that the updating of
>> _gl2p is relevant only at one use site, and then also only inside the
>> _code blob it provides. Then drop the shadow_mode_external() part of the
>> condition as being redundant with the is_pv_32bit_domain() check.
>> Further, since the new local variable wants to be "unsigned int",
>> convert the loop induction variable accordingly. Finally also adjust
>> formatting as most code needs touching anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -861,23 +861,22 @@ do {
>>  /* 64-bit l2: touch all entries except for PAE compat guests. */
>>  #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
>>  do {                                                                        \
>> -    int _i;                                                                 \
>> -    int _xen = !shadow_mode_external(_dom);                                 \
>> +    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
>>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>>      ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
>> -    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
>> +    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external(_dom) */ && \
> 
> As this is a comment, I think can reasonably be
> 
> /* implies !shadow_mode_external */
> 
> which shortens it enough to maintain the RHS justification.

I would certainly have done it without pushing out the escape, but both
alternative variants look worse to me: In

    /* Implies !shadow_mode_external(_dom) */                               \
    if ( is_pv_32bit_domain(_dom) &&                                        \
         mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \

it isn't clear that the comment applies to only the first part of the
conditions, whereas
    
    if ( /* Implies !shadow_mode_external(_dom): */                         \
         is_pv_32bit_domain(_dom) &&                                        \
         mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \

looks more clumsy to me. I'm not very likely to accept a suggestion to
for the former route; if you think the latter variant is strictly
better than the original, I might make the change while committing.

Hmm, or maybe

    if ( mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
         /* Implies !shadow_mode_external(_dom): */                         \
         is_pv_32bit_domain(_dom) &&                                        \
        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \

?

Jan

