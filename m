Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2278773A99
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579966.908197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNDB-0008Rr-Px; Tue, 08 Aug 2023 13:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579966.908197; Tue, 08 Aug 2023 13:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNDB-0008Ou-Mo; Tue, 08 Aug 2023 13:57:25 +0000
Received: by outflank-mailman (input) for mailman id 579966;
 Tue, 08 Aug 2023 13:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNDB-0008Ol-0i
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:57:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe13::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8008323a-35f3-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:57:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9884.eurprd04.prod.outlook.com (2603:10a6:800:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:57:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:57:21 +0000
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
X-Inumbo-ID: 8008323a-35f3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grazFLqUtDII6jduNncHAG0SFaC4y8tAZBbZdOCweSQCB01G3jkRkqZENfSWVQo8YdHHYefy5IfYBK2zddAuYh0qBqhv/Qtvs9DLw/YKPERbyD42HiKehtYRUu6WYcg5uWM842viTqChb0lLg0Lse3cnksF6EbXN/Y9j14RhgLMKxiiLJWf2Y3I0wGIOWOlKSCmKp+HM0KEdNZWPY76wuWO63k/zIxYmVEbnj5zsJQWLp4SjpkpjeYeYIX4tLUn0bUvegB4PfDYV4UTh4hkLHTm1rbW3eWx8lHitCYjBT51S2qcM81DgnYBUcbYfKxHUKUMbg/oRhQJzxhQWLY/oXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e67eX2oDl6jpU/qekLSK4xUFjZSfHvdrTMKP+TQ/U1s=;
 b=kwB0FqKkbZN9dNdtnMHvuzg6D69XWenjhGzGSXjycqNyXqurEGPibbiq/HQNWxr9JuEISddZ6s0CNZeCumAAso1Trmeimf6eNvaeFWROHR9+5Fg/8IN0mzgBDnKqRJd+AQw5IVD6CFv+hVMBv53kwMzfdH8m/EIdK7Cxn4l6tiBLHqOs3zIRXglaiDKMAcDdxsqmyHjc3lSupYucfMdvISwWt1L7IJYVa9KhkP0CEO1qMe+Q2AAh39VZJUbEyCzeqIY+Jfpz66L7qJrahJKln4BBVjn+ayayoMq+dFq6S1xrX4skwYU9MmIJLGcTBgT4c6/8ryd3O8lJ12ex/PO1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e67eX2oDl6jpU/qekLSK4xUFjZSfHvdrTMKP+TQ/U1s=;
 b=g+Lo3w+KanQgV5sp4iH4BzpiX1fR0ZEuMmj8ZpHt++rN6njhGH4Iw5Xs1N5RLOmnzp5BMVnyEPud9da/cZYrJ/FcpK002mB5/AWWl1dGVoAg5aCW+CA+pEHZZ3RzNV2bWxUBW9utl4pM7hRob3U1v88hmtBz3QoNHTaO6a6A043GCSoryEV/PV7Pa7OdRUIK8IostEtliXzb2WM/LRKYAWj2+8XxpH+SpUFNKxGRocs/bA1OJes0Mu9YGq1OApALhyrvp1xgwZmWBwm+FriTFhTd1XivztVk7gkpaQ04ygWTCfF3s4iOiMokn66tYep/5Vi/SZ/HOOtOWQ3Z81LPAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e7f8260-2047-c504-0c00-e2ec4145ec03@suse.com>
Date: Tue, 8 Aug 2023 15:57:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 2/5] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <27631ba28fc6f47095fe0db3f8ee2cd87de616ed.1691492441.git.nicola.vetrini@bugseng.com>
 <391b07ba-5004-6236-5296-efaf06720371@suse.com>
In-Reply-To: <391b07ba-5004-6236-5296-efaf06720371@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: 3881e5ba-306c-4adb-6f65-08db981762e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ntJU3/lHOlL7SyWGnwE9oAIdfH0qXdpNEs6wx8oVa+lsxDc6Re2GgH5xJynPqTIkCLkDZI788A/2xYkscNujDpndwgkTjyVtf17zdI0/I61/EkS8TemBeSzi6xkU9P4QHORpv02NTFRxnlpBp30Fi3VvWkJUoya9u9wm79HQfb7GqJMTVahT1OLVY/uNRQxxzxKcPxIJbg9WW94uWmV7dFOQE3JoCI/mgzPxT/SQQWJWR7U6T3KtL8un3eluLIZYwRm+ZXsKCghZErdzI+IEFues1mzolLYW8YOU+QQnJeH37usRFWou6lH2qsl7TIEYtewGbJvWykD5d2HZDbik3nC+zN9+G2eVx5D/PSAsHQib5bX1douPGeg5doRu7LAvdWOFSeo5APfEvtWE1zrNOEBfcUEUXf/SXgQ26FpZdarAVTRfL2gAd+Ltp3Yazr5D5ZS/1O4AnDtbONFQf0Ru/KqfmHkcuyr6QoRBbfKbr9arwwu+GnYDTOPa7hFwduzdXgwgCzcaKk0sAxeyoIYqBHwsxVqJWUzKLRkSP8Gm45P1xnMfekvYWOhtDNSofxrV7afbEllj4RZQzqas3kVlluXyE6/kY8lSItWBN23da8U6zfm8DQzyAkQmP5wVHBU8GZF0HscDELAUiqGEwKZJcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799003)(186006)(451199021)(478600001)(31686004)(6512007)(86362001)(6486002)(6506007)(66476007)(26005)(6916009)(66556008)(66946007)(53546011)(4326008)(38100700002)(54906003)(316002)(2616005)(41300700001)(4744005)(2906002)(36756003)(8936002)(7416002)(5660300002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTN1b3pqaCtCOHMwWDFlRjlEV1RwaTFkZDZkUU1DY1o5QXpGNmZVbCtQNElu?=
 =?utf-8?B?VnVxV3NETU9MNFNGZjY0M3owY1diVkp0anZ0dGtORGFCODRQRUdKdHRuUTlr?=
 =?utf-8?B?dXM1aE1LaGJHM1RReHBDUzJ0VE1TdzYweXg5Zld3SSt3VjBOa3d5MnFzQjJN?=
 =?utf-8?B?ckN2LzVNdEd0RW5nNUNzMFJWbjNRenBUa1R5NVByMkhIMkkySXBrWFUvNCtV?=
 =?utf-8?B?dzNXdlhES0ljNG1iT0FRY2NEb3NhTmVnZHV3TWN2aUZ0bkQ4bWtZY2hzam1Q?=
 =?utf-8?B?R3JrSXBNbFJFTEN6VnBzWGVIVzBQa1Z5d2RYdldJMVR5U2RsWFBUQjhYWHBy?=
 =?utf-8?B?Sjd5TWlPTUpZOWpKdysvdVdSdXpXQTdWdWpOZGpSTmFzbUpDL1NmU0ZQYW85?=
 =?utf-8?B?TXArQUc2aXJTZkhPYS9lcFZINWYvVTA1K1hoL2xQSlFxWEhNd2RKZmE3dDJt?=
 =?utf-8?B?bk1PSDd3QkMwK3dsemJYd3NuMHJEOFBhSVdjaWZYVUZpcFdOMmxmcXQvQXdZ?=
 =?utf-8?B?a2w4ZlpQZDUxbXRweCtNRUtJY2tCNUJOM3BUWTJTRHh3djZyZDdvZk9uSGps?=
 =?utf-8?B?Z295YUZwU0QyREdpQUxkQXJmN1JNa2ZDYlpGcHJCOW1XU0lZR3JZaHFua0Rv?=
 =?utf-8?B?Q1BLU3dROVkxVDVmTmdJeC9DeXhMeTE2ZXY3K0ZsNWxqaG9GQ01DaTBXcU5v?=
 =?utf-8?B?amJlR3ArY0ZjNVhnU3FFREhpK1dudHlSUkFPSGpBQlIyUkQ0QzFLTU53UThz?=
 =?utf-8?B?YzB5cVVIK3Y0MUpUUlpyeExLSElOMEFxTWwwRUJqU0Z3YUt2bnlWZUFid0J0?=
 =?utf-8?B?Q1FwSDNVV251alZzdXRyOTFIUnVkZlFtTlVxRjhnSUVtNzRxaVpTcThha01j?=
 =?utf-8?B?Z2RHTHlPTEVlNk5WUUxWTkdmcm11Y2U1d1hnTFFSK2xMbUNEcFcycDMxVzUy?=
 =?utf-8?B?N095aEtUa0xPN241YWFhTWVtSUFiQmZTM2tqRWI5QWNYeFBDZ09VYkovYWNr?=
 =?utf-8?B?bEQ4cHc4ZkRyUlVueE1iT0lMZDd3cGNFSW9uaVU0ZFNrR2FXUWFwdzFuVzNR?=
 =?utf-8?B?OHFNWFBlWXBEdEZYZHhVR2pKQ3FZVjhzTkhlRERGdmRZOTRpRU1HTERNYWhU?=
 =?utf-8?B?Yy94OElKVENvcGdLYmFmSTZobTgrKzRFK2tOWTdSVFNZMjZ2ZWZPSWVvZkM5?=
 =?utf-8?B?L3lpRVhMOWozM2pFaitrSkZPSmE3U0VvMWR2bWVMT3orSVdkVHRMM0UzVWhW?=
 =?utf-8?B?VVFJby90WUdXelkvanJEV3dCeWVxMXJKNDMzOWZZM0pnTDBQQVo3N2lNZ2dq?=
 =?utf-8?B?cE91a3dSYjV5Y3J1S0NjUmY2VmtlYWFiS3lPbmJCOERVR3ZTZmFqbXQrbFFI?=
 =?utf-8?B?RmlDTktPT3Z4ZXZxZHE5MGlianJKR2N1WnZJVng1dXluWU1RcnViYlpJWU83?=
 =?utf-8?B?UDF6Z0FnbHMyNHVzMHJQdjdmNGZwbXMzRGZ0dnIwdWp5dWZzVFdpNmhhejRk?=
 =?utf-8?B?NGNKWE5PanFpdDFReDU2Q0syT1VCMDhiU283bXpIdVBmY0pLWm5JU0ZxWk5o?=
 =?utf-8?B?dEFpcVhoQmVzRDEwVEcwTW1rdHpHVTg3bzVNdmtxbEM5cE9JcXlvbGRZd3Uz?=
 =?utf-8?B?WmhIRVJVVDRWK3gra0tWdGNUNEV6KzdIRU9Ha2FmTitpaFhBakZoYjRBNG9E?=
 =?utf-8?B?YXNBRlZkOUg1cTY1ZW83OUg1WW91L1c2MmJ6enc4ckhqdWV5RHhFcFdkQjJx?=
 =?utf-8?B?a0dGOVUxT05tUmZMdEdLWDI2S1Z5QUlvQncrN2ZsbCtkL3pjeWN5NVpEOStu?=
 =?utf-8?B?ZCsxa0c0MHZBOTBxcXRmUUw3aWpEM1ZsVGR0eW9QTE82amMxbVBmS0p4ZGdX?=
 =?utf-8?B?dythbHZnU3hFTnZFb29sRy8wMStBTXZ1aVAyTitKd3U5ZDRIQnFLODBTY3hL?=
 =?utf-8?B?WFpVNGUwRjdpNmhJU3NYWnI2WXRDNWFrS2I5TjRMbVNhWnRPZ2xYYjdCTnJS?=
 =?utf-8?B?L2d6bzZJc21EeXhYeTdaeUo5c3lRYTdTb1JjanVkb015aVpXYTBzRzFXNHlq?=
 =?utf-8?B?cHdINjFZc1V4ZjBoQmhGRzg5czJ3eEdmTzhDNmhSUXc1S3M2VXVFZkkyVzVF?=
 =?utf-8?Q?F5wb57q1dc50JnFekV6hFW6d3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3881e5ba-306c-4adb-6f65-08db981762e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:57:21.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcNufy/K59DP98QoYb5qd6RDyRf6fUR0+IC7wh6kkcvYyxzyFgOXG6Dw21ul63nRgvrSsiptDF1BOjxEo+TgsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9884

On 08.08.2023 15:56, Jan Beulich wrote:
> On 08.08.2023 13:08, Nicola Vetrini wrote:
>> --- a/xen/include/xen/delay.h
>> +++ b/xen/include/xen/delay.h
>> @@ -4,7 +4,12 @@
>>  /* Copyright (C) 1993 Linus Torvalds */
>>  
>>  #include <asm/delay.h>
>> -#define mdelay(n) (\
>> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
>> +
>> +static inline void mdelay(unsigned long n)
>> +{
>> +    unsigned long msec=n;
>> +    while ( msec-- )
>> +        udelay(1000);
>> +}
> 
> Nit: Style (blanks around = and blank line between declaration and
> statement). If need be I guess this again can be taken care of while
> committing. With the adjustments
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually - why have a local variable here at all? Just name the
function parameter "msec".

Jan

