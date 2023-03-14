Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4946B9BBD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509746.786137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7e6-0000Be-Ns; Tue, 14 Mar 2023 16:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509746.786137; Tue, 14 Mar 2023 16:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7e6-00009i-JU; Tue, 14 Mar 2023 16:37:06 +0000
Received: by outflank-mailman (input) for mailman id 509746;
 Tue, 14 Mar 2023 16:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7e4-00009c-La
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:37:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c2f60c-c286-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:37:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 16:37:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:37:00 +0000
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
X-Inumbo-ID: 72c2f60c-c286-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyfN+qqjsz/8WOBQwVCEM0fbgAIwTzKbQLw09EebVdMsxluFLBTsxZJ3oYPcsrh29/rE6+8l9iYSZPCYJf6XeFXSXNrV/s+0bdENoKId8bVUiaGm+njWcIqt5sV0NCfjDFSJy1eYl8ikMhIKMOmFMN5mlRpa8ZeLqEeJLWdOEDD0D+Flr+I1rct13IZmRoUG/nN+XAZ5uQSaNa6Zsra8sDJEV7avPI+344WCr8KlsKuXu9uhg7oXfFrNOhsuOQnhndH/qllVFu1KX+Dts/rvN7s6/gp4AjM5fPeu9ifNOpDxpT1KlJjEK9hUR9nbvSsc9tsQi+WPpqcyDsfvE9u+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCUM/P3v/jlK2Boso2ilxltpz18GsqtA0dI6uZTHTg8=;
 b=iFWsSwEdBnDh52B1/zVjteK3sG1RHMyBqsuGK/Sj2mzBR7C0qv7zwoHCjyOuQS9aUU1KaXKxrTKq5JbOs27yqUTBAGkuNRQKsTmUYrCR/ioMqp73k7vQt+Ck7l/ljNuEulYPfpwW1crYnhxLa4NHjae5t2P6LwEVAbfFSVHlYG7GZV1f79SW00+7TExiMaztGT8bUC6B1MnwJ0Qok8wvpcJ0en4RGPRosIuuBrHwD9UsA76q6gJVgT9/99KlGeFHYao/XzVmolq6FJ6UD+Mo3bnTmCFoRp2/qnGpEGgfQDjkxSxo+YyCY2YkoOoRrUKdziusm1KmXsc50ACdvLqBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCUM/P3v/jlK2Boso2ilxltpz18GsqtA0dI6uZTHTg8=;
 b=LnC9KmabS1VBKZ6MytqwdlPPQ8nteTWcHCD+0DQ1G5+8+hl1QaJHMNqnB0wTMNgGI6E2vPsarRpYN+Lby5kr/kZvZFw/Kiy/8eZGCtYgDnVHqg89Y15lS2FaYigw4ZTzDW4uNM9ea3A5u9f5xpp8yO+bBpFkvaJ0Ay00mbNXMWLnFbU2HFbGYmoChQpFAchy7bACC5MvFpIBf4yXxi/p+1xFCjUltfN1Pr0IWfNTK81CmHFxewtny1uRgyAjY5+KZlunyYdUBlwlNQ0yYuUFYHjdXfMVN4BKYqO+Pa6UAL0Ez2hma4px9tmUCNOG64bgFBc4bdsbjVX7NXHYV2dj7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ece7a0f3-a142-9ac9-bfd7-9398b5578081@suse.com>
Date: Tue, 14 Mar 2023 17:36:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 5/6] tools/libs/call: add linux os call to get gsi
 from irq
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-6-ray.huang@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230312075455.450187-6-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 73df0165-4ffb-4eed-4044-08db24aa555f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/Dk4zZ+qy3TAsUmD9+OADSiZpTlvN6WyqRA0/4XnB1F5yc0LxALiy3NA3AMq7lTtZV4n5zFLX9pC6a9yKtzWe3Nj/dbDjQzsC9UOQzdbqyGhnSGxYX7g2OXFa1nJn58nkBLICdD+IRPOqeVUZ5ewqk2QsKbO9FBhdJAEEgb0pijYekdvXiVEdJWAITcAE0RaDTumpoPOB4DV/zNB8vJfolR0F3uwFIeuVfV3JEfPOIZG46J9MKHgVc2BQfPl5qGegKNPKRgW9MrNuUZizekFebbXQjjqAe7jijDRUAjdhZasPq4Qlj4udSR2gSvSw/hBKszGw6+nrdts4tbvxek005NT00+1zYoqLyM+jN3Wga88wPrifcpF1J3r0ogEH4uDFZ9Jft8qUcw+ABaYYt5mzpZnRWG8U8zs0Vizx4rcCtKjm+ywRgsy1saRXEhWFUwONctN1Zg/Y0h67KK3nU/0iebl6qPTlVzI3F7dcGNAAmFZJKdJQp/bIAs5cblOpARzp9x3O/ivxmz6wJKtm0tYAnBfl0zsH/2uLvs3uSqnxO3JOfcdcwKBSeOBFHb8cBQdoX7rEHA1MYW1HWHCpcK4Lu9TQLqjBYGvWlWMAwx6auNlC4BXbnwsJBJmV+IipxG2t/8FmMTPbC9cVSZ9SmoeIm358krE41lzEGkW7ZKHwxGsBrZMtLp3keOQ4xcSp6RHf0qVSTN1TZOpf8/ovSZRky12HroYDFbOwf/L2tMRzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(31686004)(478600001)(186003)(2906002)(26005)(66556008)(66946007)(66476007)(6916009)(36756003)(4326008)(2616005)(86362001)(8676002)(54906003)(6506007)(316002)(53546011)(38100700002)(31696002)(6512007)(4744005)(6666004)(41300700001)(5660300002)(7416002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukc1WmJoVlZrc1VwV0VJZGd5U2t4S3BIdkVCV04zS3RzT0VndXp1T01HczFa?=
 =?utf-8?B?OXMyaHB1d3lQdFRlaUg4bWdaK25Oek5JTVBGbVNNRjYwUU84Q2N6K0RaS2Uz?=
 =?utf-8?B?aFVWY2dLdnZMWWpkRnU5TUl1NFpZTDNaNTEvazVSc3NRb3RZazZ3SXpQV2ps?=
 =?utf-8?B?L2ZscHlUTnh4YzUwWmRVRDdUOFNCVFloSHdndWJoL1RGZVNURmczUWhlUDQ5?=
 =?utf-8?B?eUlpbFNQTXZPNUw0S0pQQlBDMkpldGVwWmRUeVpSN2tEU0QyZXJ2bmVLdFZY?=
 =?utf-8?B?c0RtblhvUXA4Vnk2cnFNTDRJYU9OYUhIVUZDQXdpd1Z4TXpvNFhaS3hsenN2?=
 =?utf-8?B?RG9pcm5ZbVhDcTBuWnVjRzVMYWxpSlNHUStNMFlKTDBXY3BFN1p1V2VoZHp1?=
 =?utf-8?B?UjZnWDB0cmNwc3RTQUtvWVg5SDZNSkc5ejd1Tlo5aU9lVTQxVmp0YkVBM0RR?=
 =?utf-8?B?TWVIZU51SHFFckRpZE44aDRYNGYzcnRNMG9yWEVDMi9XTy9tQmd1MVZFaXBm?=
 =?utf-8?B?RXlSYVNqTFZqcUNXcnFnUFlsMjNHbThZQXBHeEdOSFlTYSs5YkhaT0ZLTytX?=
 =?utf-8?B?TlZHbndhRTZuanJWbXhxekZKdldmMUdKVmR1d3FtTzhvNFZVbVEvRzdNTnBP?=
 =?utf-8?B?ZlhVZWx6NmQ5RVBLSEJ5R3FsMitNR2JvYi81VWE4UEVGR2tOV1c0R1Z6Q3hJ?=
 =?utf-8?B?ZzNNSWdhSVhKZktrUngxdkJrK200MTNVcUFPNXoxQVgrdW9razhLUUUvT3Q3?=
 =?utf-8?B?L0VOS204UStoWFk4WVc1bUdwQ040bEh0RThjUmw1OVdaMWJjcXRaOUEzQ1pt?=
 =?utf-8?B?VE94OC9HMHBWVjJpQ2FIREhlWit4K2ZFamxVeDlmelNWRzUwM2dWZDc5Zm9t?=
 =?utf-8?B?cVU5VE0zbmxIaWtKbXBTWGVITGNrWXRmVitDQldLOG1qUzZ1bmU0UWxINWtJ?=
 =?utf-8?B?VjVoNTVwR1g0VWNoY2kyVWJ1Wm5zVXF0aHhlbklqUlhtZEVlV1Z1TU1ITllm?=
 =?utf-8?B?L2o5enpMY2xHVERIT1hXTjZBRndKczE2ZDhLdEh3OUVlWElZTHM1S2I5MXlx?=
 =?utf-8?B?Nkh2RXV2Z3plb2FWd0wxUWQwanRzaGFEaFJueTVWMFd0WUo1TDlEUy9Lc1Yx?=
 =?utf-8?B?L1Y3ZlVOaDRPV2IxVFlLeTc2YmY3S0IzemlPV3FxZ244T0gyUTRwcmRIa0t5?=
 =?utf-8?B?OEd0T3IzblZNc3pLTEI0MEtKWDU2RHRSYTNEL1JJUmdIcGxKZWMxNjZlTFpu?=
 =?utf-8?B?SWJYRTJmNDdyUEhjbGtHWDdvbXlpNWlnUEZLVUl6a04rcm5CUld4MXBaNjBL?=
 =?utf-8?B?L3YzaE5hQWF5ZjY3bTIvNDlMN3k2azEvUFVCZzhkWkVVSDBJK3c0K0RYUXRj?=
 =?utf-8?B?RCt0SWNwcFVYclUzTTk1dUZGV2p0a2RpVXBURWpiUm84NzNmSWNtaTRjVTVG?=
 =?utf-8?B?amxmRWdqUTRpMXJSTTlRZkZCSjJZUEU3aGpiMDBNTG9oSW53aXNzY0t4YXNW?=
 =?utf-8?B?VWZRaWJBN2ZNdkM1RXlCdGZXOE1nbVZEVlJzR01yOFlmU1hWTHZqSm9oN2o4?=
 =?utf-8?B?R0twQVNpNzVUMm55ZHlnemZXODBEUDF5M3lidlE5MGJZbE5pVkFHNitTWllO?=
 =?utf-8?B?SzVjdjdzTm9ia2t6aE9zQ1hPMFpZQUdBNkhwanZJQnhaeEhEYVFGUzhVMXFF?=
 =?utf-8?B?cDVFQlEyVEF5eEhYZXUwUW5sbVBDS1NBT2IyS2I2bkxKTE9CTDFvMDlFUXR1?=
 =?utf-8?B?WUVIc2UyaloxZmo0K2lTa2VCdEx6R0gyKzFjbmgrT2F0Q0crWTZ4cTBxTGMy?=
 =?utf-8?B?a3JGSG1xb3FCM29sN1FjTlh5d09FL3ZCcHBCSkZGNnh6VnJMQSsvNDFIK3VG?=
 =?utf-8?B?Qkxsc05tbXlWQzduejVvaU5NQkFkYW05RXI0MEJ1ZUpESXJBU0h1VlYwYk44?=
 =?utf-8?B?RmJrd25zRFJzZU1vYVJFOG1Qc1F4TUR4MUNrRUNySG9vOUd4TTFyeERrSFRy?=
 =?utf-8?B?T0w1Qzh1TGY4NkNvWVZ1SVpneGVOYWVqYUFsbEhUcTFhNHFhemhCdFVXM3Vz?=
 =?utf-8?B?WllKdTJKbjVMUnJENGJ4ZE9rSVJrUkNTMVBXa2lpWjFmbU14UDRncm0yaThJ?=
 =?utf-8?Q?xRWa4+dH2MK8OxsfvDikMLZSC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73df0165-4ffb-4eed-4044-08db24aa555f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:37:00.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5ZEK4adKN58O9fvcsWa6eYwIBqWzjo1SJGB+UfsGKMh9bHqq0t4KNl6D6WWCpc489wS/kOt8GLSKPxGp7Wahg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

On 12.03.2023 08:54, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> When passthrough gpu to guest, usersapce can only get irq
> instead of gsi. But it should pass gsi to guest, so that
> guest can get interrupt signal. So, provide function to get
> gsi.
> 
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  tools/include/xen-sys/Linux/privcmd.h |  7 +++++++

Assuming this information needs obtaining in the first place (which I
doubt), I don't think privcmd is the right vehicle to get at it. Can
one obtain such mapping information on baremetal Linux? If so, that
would want re-using in the same or a similar way. If not, there would
need to be a very good reason why the information is needed when
running on top of Xen.

Jan

