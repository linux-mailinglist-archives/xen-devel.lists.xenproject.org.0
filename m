Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A417197E6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 11:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542356.846115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4f2b-0000KX-3t; Thu, 01 Jun 2023 09:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542356.846115; Thu, 01 Jun 2023 09:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4f2b-0000Hx-1C; Thu, 01 Jun 2023 09:56:21 +0000
Received: by outflank-mailman (input) for mailman id 542356;
 Thu, 01 Jun 2023 09:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4f2Z-0000Hh-It
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 09:56:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d04fa26-0062-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 11:56:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 09:56:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 09:56:14 +0000
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
X-Inumbo-ID: 8d04fa26-0062-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvkiKVf/zzmvs1gBzdSU2jG1dAY1f66KSIrilzKuAD3nziKISkllKqNTZhDPhgOqs4yQtjTFdvYIAapUs4aHy8oT4JxAspdZgSpn8qIXH0ebRrs2vBRLNpu/K4pryKbUlPi+0VGfpbo1GtsaULSgpiGgmIJBsz1jBzBLazH/hZH89iCr+uKolupVNixcrNaKJe6skntTrVCbqx4r8cEcJTENQuJlXSCBPUT5m3nMC0Wqq5nNM7Zd7z7t4ioiDuv4SBa7kxt2ca2K28MXjc/aEHLTK34MNwkg1J4aI/B7yd/TnY3V+TjzFh57UKNkalfbTlMB4F/gVnS+R7v8tRzmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPxPgAZnECpeEwSholZa3wqfIXi7TDHXi1G01LS/mwk=;
 b=oGsOJveUTVQdIZdOkQhqHFkusDx0EpbdHkdpMjIRRIPz3MuP2dJ3HHCJ0DUTxXgCLko9Qa1lFANjLc3SsqyS7is2487b7sKff4eEfHiN6wZPDMYuDXwTW4Bx5Z5Jc3pQg36w+sQACQz8vA21eeJpVy3n00uPBUY7OgXBTQO24J9FY0QA5AUEJka+aV79snmL/r/l3WhmuePUle2pRtylT0AJ+ZHJxWZfU8ggR7Lxy2h7hOkACWrFwXP4jIgl+RlEZW9QTOWFTYF7aeUOj8xBlmWKHgJkrFDLI3I9ibnJzj3bVa1tj2hY2H8vyFs2QGK87gQoEW4H6ZU8r88KDcWU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPxPgAZnECpeEwSholZa3wqfIXi7TDHXi1G01LS/mwk=;
 b=Nuh3FdmzOIrb93fD9jJVh64iLH/x+FqHvb4Rvjs5/xLjOPKGgdJspyocSR7GhoaJuUHYjHkXLIQbwzOzvP8ZS8Bkp/q69054fvZ71+MYa/gn3+KRl7Lv42IX5UYGj+NaWLyB59NlH7cAUAEyd40gk2lZqvHIVVX/7YzzOzB78VH1eLKiVE5GHgEntz6hBp/T7yRmvwqA2sAHB/7+Q+Q8Nu2/aU8lwpGGCOYqDv3wOZHZrFuiAtX+8VEL9ZyLuacC8BIKyAx4K0qd6BydscFdl3hKKP2AYXMoQwvWZzM+HQPIT4Ws397upiqH+k+ql8O1CZpP4loJvXyrcdFSdLElWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf17abea-0ca2-5794-aa29-3d9c91355d4f@suse.com>
Date: Thu, 1 Jun 2023 11:56:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] x86/vPIT: re-order functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
 <ZHhiLgI0oL7jvKNc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHhiLgI0oL7jvKNc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3aac51-0c0e-4fe1-6d77-08db62866fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+5FkpWB3u1QaUuCFdm+Nv0S7pGEShG+B43VdXeyIuQiMSZ+s37xGYs4Oj9cLkeVa3mdeNF4LerGeuvgwy7Je3uKlCU87faZw7O50W3L9q4JsFG6ppgSDjWQjrvpNDfvaz27EXBC2DfP7mMx7De1Q7ywAv7XhXeiVuVEzSf9XjWZJImVzM8m8sw0H51U6IkTJdlFvhVeH2yXseKBvzxETjbXghuzEX5KFVfFczdvze/zOEjflunzsGcFUhl/ipi0xaWTuwm9x2CbIWpr1RAS68wu6DBj3PbAeWNX7E9BNUnktlZD9OK7/2Euii271AVamilJJijgVUVjdUsbomBH02aD1EWatO1HAL6+dIhFM8GR5hNjgqOpWBvUKImXnZkoBXM40e7z5IBKLikdNqS3CFag6ki6JloH9ETOqLcbAEgu4jduLzqXG6tmVHoSXsDz1KdMERbxQKUD8kQWKlkGUEb3aEf/3lR4FbzLPfp+5mMi6dnCMO1TVRJcSIHlfa/k19NMmfUCiRfPwWjqMXA2D07RXTFi5Wb1B5STYY+NZi0Vi56NJQMQLbOQFHzOcpQch5NJvcQxrfFHxB06eW+Rm0N+j3zOpMSiBuDQTRcjxUG2EaTsQsGhhA5KtFvp/QXW8mnkQa0t8n8hcJYEEq16ib76oQ60QRwzqEoTkbWtQDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(31686004)(83380400001)(4326008)(36756003)(41300700001)(38100700002)(316002)(6486002)(478600001)(26005)(66476007)(6512007)(6506007)(6916009)(66946007)(66556008)(2906002)(8936002)(31696002)(8676002)(5660300002)(54906003)(2616005)(86362001)(186003)(53546011)(169823001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXMzMFZHMjd1c0xMcWNKOVJONDNDTk94QjNHQ2p1MGQrajQwYzZzcmNkalVY?=
 =?utf-8?B?Z3FkZm1NUGFlRHp3L1ZCbExXZjQzcEtMcEJkYldEN0wyamp4TGE5Uy9SMVJZ?=
 =?utf-8?B?RGdQVUI2dXZqd2d5ODhRa2ZaNEZaZFMxenpWQmZJdnBseGtiMDI5eUROUzdt?=
 =?utf-8?B?RWtCOTcxaTVlZUVKVFZrTndFTU1rYnhaVHcxYVd0WDVoNC9HS0xzM3FuUHNT?=
 =?utf-8?B?bVFGN0RVWnJaZVRKa1RSYit0anRzdW12dXhqZG05ZURWV2pySzJqOStTRTh3?=
 =?utf-8?B?c21vTDRjeWVNcUdqNUl5RTV2TXZJRzZNNGV6ekMxbkd5RDYybERvbUh1S0hh?=
 =?utf-8?B?Mkxrem5YUnpJbEpXYlh1TTRhVzFzU3BTZnlpeHo1K21CdWVQVXk5ZUNnaXRI?=
 =?utf-8?B?ZWlNM2pLeTZiT25ZdjFQL2h4Tkl2bDRxMFlVNFhUOGtaZnFSNjQ1TlE3QVph?=
 =?utf-8?B?UC82MStDMGRSR1JIMHhIOGpaREJMMTNBQzhuTy9ibDFvbUNFdDFGVnp2M3p6?=
 =?utf-8?B?aHIzaFcxWE1jbGlOUkZLNFR4M3ZSMU9RbkttamQ4WllGOFo0aEJsSHRoMXU2?=
 =?utf-8?B?NlcrOWNwSDRKcW5Yc1d0Z1Z3dFdPcnRkeGJVOCtSdzdhWHVTS014REV3eEZX?=
 =?utf-8?B?VTlQS0NsUEZMbmRjTUprRFN5SkxCc2haUS9BK0Z5N0xvTkpVTFJiNisybDJM?=
 =?utf-8?B?TjhqRGZid01CUTRwL1gwOXVBM0JUbGdUT3lEalRmVFljbDFzellJZE4yM2p1?=
 =?utf-8?B?eGU2M3lxcms1MWcwM3BENkhWT0pHL0ZYUTdEZE55RFRLMVhPMUdiQXp1ZzVL?=
 =?utf-8?B?bXJpUFhZZzhlZXhSVkRhc1MrKzNNLzdNRDNwekZCZ3lnN2JDVEUrNGp6UlJq?=
 =?utf-8?B?STR5NTQxenN6bFRqenVRdzRubFNJWDZkMnVtaEpSMFdzMTBGd1BjUGgyQ2Y1?=
 =?utf-8?B?U1ZJN3ZRenU4N016Ui9DanNQTUdpRUlndURwWUZKZDdZLzRMS3o1SlE0TzRN?=
 =?utf-8?B?aVhtOU5FUUVCdmxNTlgrRkhuWnJtZFNDZ3Bub04vYS82U1c4R2lydjh4c2FP?=
 =?utf-8?B?RXNiemRzVXBlVHdjNmlqS3pGSDFZQjZ0Vkp0ZHVNSkZ6NGdOeXRiT083ak0r?=
 =?utf-8?B?NEdFNUtodHI2U0F1TEZqUDRqanRxSDNxdS9pb3c5U3VYTGVrVjRTNlM5RGRI?=
 =?utf-8?B?b25hbDZRSFJLQmI1WHRQTk1LOE5VT0R3c05zUWhTZythYXl6dlg4UXFCMmEy?=
 =?utf-8?B?WWZOOGtLOE43S3hSbnVqbExnOHRyVmppQ2x3ZFg3MS82Y015dHVUM3BaN3lL?=
 =?utf-8?B?MzdwVFBmQ1FKNDJRdUlGdlNheSs2dHZ3bW9ZMjB6ZnVybFRkaEZGM050cUg0?=
 =?utf-8?B?bW1vMUFCa3JsYkw1QUJmZk1BTm0rODV4MWlqU2pNalFiTDlPT05JaTZQOWlP?=
 =?utf-8?B?bEt1UHVUcHNQMG9QUU82c0RpekwxNkFYcmw2NkpDSVE1alJ0LzJrV201ZUEx?=
 =?utf-8?B?MEc2UXU1dEFtd1FwL3hyQ043bXhoWkplRGdYRXRMekVTc1lBMFFtRDhHZjBM?=
 =?utf-8?B?cU9CelNiVVdBUk9xL2UzTFRpVWtoaDNPdEJCajhzQWtkdGlmQmNjcmYraTBB?=
 =?utf-8?B?VldyenJhNVFmZ3h0MVE0a1BtMFRTVUpxaHlkWHdTTXZydE9FT21UUWNsUWRy?=
 =?utf-8?B?Q2FkbEw1cllhbXNFNnAzRi9LeXlhdnBwWUxML3g2cFp5MjRKR2lncFJHZDUx?=
 =?utf-8?B?a3hmRTZEOVFxRHRoc3NpMS9vV05US1E5RVpkR2lvaml6QnJWRHRiRkdQc2Iv?=
 =?utf-8?B?TTR1dkdUMnc3WndNUHE1bHZhWS9yTVUyUTVHU3lVT0gyeVpLS2JkZVlhUkNw?=
 =?utf-8?B?UzRWZ3Y4VXZmQkxGS1M1VDBxd1gwR3JqMlpyZXIxMEtOZzBENkwyR1hNZ3dz?=
 =?utf-8?B?MFVzazBLQVl5MUZVSjBBazBxcWNSMHBqQU95MFZvVU9LQXd1Nmh3RGtCY09E?=
 =?utf-8?B?SVF3YWo0d054N05YZGNCcUFMUDV1WFVBcmM0SlRiMHM0VW44L0JQTDBKTEIz?=
 =?utf-8?B?b2s3QlVTRWJnNFg3LzNWdzZoMnFKREhKMjkzQW5qQjBwYlNlRVFlRUNtTVA5?=
 =?utf-8?Q?uuM/DAVGxQLRtvgkzCFq9g+yF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3aac51-0c0e-4fe1-6d77-08db62866fad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 09:56:14.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHG9MKcg9+c9FT7NnH/Nnpe71cVY5/JSk5Zqvarwouq7xh4lI8fDzPcCUroseiijD7E0c7UG/1dfnL5n7W3czw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287

On 01.06.2023 11:17, Roger Pau Monné wrote:
> On Tue, May 30, 2023 at 05:30:02PM +0200, Jan Beulich wrote:
>> To avoid the need for a forward declaration of pit_load_count() in a
>> subsequent change, move it earlier in the file (along with its helper
>> callback).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Just a couple of nits, which you might also noticed but decided to not
> fix given this is just code movement.

Indeed, I meant this to be pure code movement. Nevertheless I'd be happy
to take care of style issues, if that's deemed okay in a "pure code
movement" patch. However, ...

>> --- a/xen/arch/x86/emul-i8254.c
>> +++ b/xen/arch/x86/emul-i8254.c
>> @@ -87,6 +87,57 @@ static int pit_get_count(PITState *pit,
>>      return counter;
>>  }
>>  
>> +static void cf_check pit_time_fired(struct vcpu *v, void *priv)
> 
> Seems like v could be constified?

... the function being used as a callback, I doubt adding const would
be possible. Otoh ...

>> +{
>> +    uint64_t *count_load_time = priv;

... there's a blank line missing here, if I was to go for style
adjustments.

Jan

>> +    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
>> +    *count_load_time = get_guest_time(v);
>> +}
>> +
>> +static void pit_load_count(PITState *pit, int channel, int val)
>> +{
>> +    u32 period;
> 
> uint32_t
> 
> Thanks, Roger.


