Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D66F44FE
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528637.822058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq4I-0007nr-8a; Tue, 02 May 2023 13:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528637.822058; Tue, 02 May 2023 13:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq4I-0007kv-4P; Tue, 02 May 2023 13:29:22 +0000
Received: by outflank-mailman (input) for mailman id 528637;
 Tue, 02 May 2023 13:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptq4G-0007ke-F1
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:29:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c89931-e8ed-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:29:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:29:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:29:17 +0000
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
X-Inumbo-ID: 56c89931-e8ed-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dazf2fR6lB2HLePJKTnVMBJpQi0qR9i4H8M8leSrf/pobXazKGYOSwFpSMduMlbmLbtdtUrzofOK2WYu7mTTtjOMaxiHkF3FAigm/MCxy1N2vMB7MuIkqhWkmtUzQDmD3AB/2cR3MrY50KsQ1S4o2wDnOwtDf+vTuqA29bdivgnPi8FfIimPa8WFB9MhYKVVl//8djaAPIaGT6SH3fgxQ2MqjjvtDFk4fI/pIP7HKaTom066Y3MNwIQy6gsUJq77zS9aFxZwUgP0Eq6A3GmP8uvnCAzbN2oknsqfWGjot6eLSsXGAMV9hCn9r2y0b2yN9RE1y49k5+t4BNN+/3VwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME2ZQwWulxZwBXmpwWH9t4GVzAmCDXXPpMuLKWJ28IA=;
 b=Y2NGa++oFOYkzyb70uhKxiAgYnL+Qxahxlgn2BdSW8HLfKMn00MBzhn/7RSCSdbFGvmNXH+/eaphrLnR+Iv5hZwD9V9TU/JkKgAFOLyHnpT/Sd+Tc0qV0kMzXUZLKahzc8VJVOtyLQlKsSbkFtYvYFYeeuXvb7fGJCMb8qZaqvrkOAIvnYxHAjcbLMwtSglGyZNK1M2lGkIhkF13ZuwzWoUgOu+BQfZjR3P3UwbF9UFZJIPmrbs0nr9zOPCeJaF0os2cyXoyUJNqq1ivGtfyDphJg7CN7H64DsZEhIpxF0NcmqHpwk4NNRyj5szF9pQ2wwUclfOTEwTnAYV1+6g9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME2ZQwWulxZwBXmpwWH9t4GVzAmCDXXPpMuLKWJ28IA=;
 b=r+AQIZC0DpdQAzaW4Sa9+lM6UD5QBIJpBe49l/CEGwueWEKUULqqN957GCGULdtAo/UmdA3L0viMIURtM6vp4MLX9q7LL2nbXnm9onzSLM7nUJaWixWlAfh+iMbw0WxNBCIv3mPrS6ZXS0Fr4G1nX0qKHVA9gokQvFF8lU3WKufoPMPWH9CIKfkqQbTXBRZy4ssnYeQNozCfUL8tv0+j9VrMSh70KVxVreFqTJv5jwDQoMCprAHL0ocPYEQG0NgCAf0NuZnDXsiTc2JNo8SlOs33oYy6ZC+mDTH8j/1CBJk/CGs46B7qwnQFojyYLJnRwmOhYG+xNsE8HhBlF1O1aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9353d3f3-563b-ff88-0b0b-dfa2bb03522c@suse.com>
Date: Tue, 2 May 2023 15:29:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
 <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
 <20230502133313.2192eb99.olaf@aepfle.de>
 <20230502140444.1dacdb33.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502140444.1dacdb33.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 5647e937-736d-40a3-634d-08db4b113a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1j0vhaKzmsGTWSnCb0iAAGAKuL4MhtY+mWb1jLSQr/huHtgE92mgq62M/mfZpsNm7YlUXMK83nghwKyFR9JTApdiNNlIcFJ3jVlocIvBkoy4MTj12GQ/XzNGbIYgv9V4Ay5vpvgKCsB0Yknlz/ySqXhrZ5KGJ3CioTroVXg0XFWJW19KTpQ0yLMdpCegQ0VfzSb0gU4JxuKygiYdzie+DB5B53M4Ug7bAtftkSsvZEa6y01l/sVCyDWfscWXfEPa24unSm6AvmKXy5X9FHc4bFeS+67AUS24GRjPO8vb4B5jKPOKUE9UtvAKPUcaRiYV+Cy8S3WIEs8l/5J+AqtLuFglFhOGBSxTXM7ELM1Fa8Fxp+T8KufEM4fA9286D3NRPqlA2YK93JQ8iWAL9PMJQVaLHxLUdakVTxezLPC4ioQoEpnTnDyhKFJnDsuqLgteOdQSPsIrBTqlDGcSVF+0AHBSDnFED4ntFMjbARj1FA6UHBg8I4nfsFIdbEUf+6MlCbsxjjH9ZA570hZ0UMYcFgUG28LqPzvpvt4/dXaUDV6CtA5nSYzmRMa2tUb/T8GjZoswNHnEDKI+tgeNtuExKziCPFqtuYcVjXlJqs1uhdwGwjvpm8EtTZ28bicy1oZNnzkSrbmwfexLfJJ5A9idyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(31686004)(6486002)(316002)(4326008)(6916009)(5660300002)(478600001)(36756003)(31696002)(86362001)(41300700001)(66476007)(66556008)(66946007)(186003)(2616005)(6506007)(38100700002)(2906002)(4744005)(7116003)(8676002)(8936002)(26005)(6512007)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVUydi9GTmZZdUNQQlpETFNxSmR6TlhVTzJaUFhoN25CNHdONFNpN29HZE1T?=
 =?utf-8?B?Ukd4WWNkRmtLV3NnQWUyL3JqOUp6WHhRZWxpWFJGRnlMOHlwQndMQ3hGZkZu?=
 =?utf-8?B?YW9XWmVWNWZRb0Y3aC90dlFlcC9aRitIbUxleWNoeFkyNldQQ0JJMHl3cGxm?=
 =?utf-8?B?TGpyV1pXekFwaUppUlU5Mzd3QzR1Z0J1OGZObU96dGFrZWRqMFY2dG1OSkJK?=
 =?utf-8?B?UkFpMEFleFNoZ2JBV0JRZk5xRjRTZHlMa04xYVc1OE53bHJwZnMzVHZIYm9j?=
 =?utf-8?B?dm1obStLR1RaOEdOcGtGSE9mRGY2dWY1dkI2YXdZVmVwMDBheVo4MW1SZUlN?=
 =?utf-8?B?cnpzK2RQNW9BUEJ1eHgxUGVhbHlVcmVNZUZxUzFOQWpFYWdTczdIMFBOQlo5?=
 =?utf-8?B?STNqWVU5SVAxZDZEK1ljY0VIcWZYQ3lvbSswK0tWQVJZVFdyNjBETDJFZjJp?=
 =?utf-8?B?QW1rWExidTU3dDBLVE9VU3RkRFU4UU9qbUJMWGdaQkFGZ2x6NXJIOE1Ec21P?=
 =?utf-8?B?MzRxbjBCYU5RZVRkL0wwdVVUeWJmYWZtamVSN0tsS0NyK0M4SWVaMFdWWDZr?=
 =?utf-8?B?cnpYYzZEandRa044R2pVTGVtWjcvUnhlQ3EvSlllSWhKSmtNQ2FwemhVT1JX?=
 =?utf-8?B?bWY0SC96bEJQR0Jnd1BnL0VnVUF5U2V4UDFVL0FkYVMxUGhCQ1VaWlQ1MzVW?=
 =?utf-8?B?d0JobC9sRnc3VHp6aW5MZnpBd0J0K1l5MDZ1eG1FZVMvVEtFdEg3TWozZWZB?=
 =?utf-8?B?UVZ2N1paSWE4UTNpQnBSWFhtWTF2SmFmN29ub3Z3MThuS2ppQ0JEOHE0U2k1?=
 =?utf-8?B?dzlablRXeHR1N3h2K2xwVVJqcy9FY2JLLzRpWGttRzNUVkxQT0I3dzFVbFRS?=
 =?utf-8?B?UUhEZW5yMVNBZm9OTk1lRFJIQjFHMGV0NVhjMDBWNTNxYUsvaGlidlhZTno3?=
 =?utf-8?B?VUpOMEo2d0lkeDF3dk54VDJMbGFXV243VjRCRjQva3kxbFhaNnNZUDNaOW53?=
 =?utf-8?B?amlzV0ZSWDVVQTBBNFpnb1VDbE44TXFoZHFwK1lvWno4djRKNVIrdXY1SUtP?=
 =?utf-8?B?YzhubXpITWZ6dVI3dXZDZUg1N1NST2VSejFzUno1dXBzcXdTa0hyK3JxVlVQ?=
 =?utf-8?B?c0tDbnRqMWFWNmZrRWM1MW45SHpVc2VBZjdpY0tmcnc0NGQ3ZWc1SkNPTVRG?=
 =?utf-8?B?enRrai9vanpFMjZDNFI5MEc1S3J3ejBmODhxWWV5V3VSSVhpSDRWWnJsSmVk?=
 =?utf-8?B?OWVUdk9xK0JyRjY4Vno2NFo1V2ZCOUdrMlJtUm5uR21vNzVtSldaZnlzVVht?=
 =?utf-8?B?UDd2VHl0ZXNQVUlKWTZ1OXIvaGptWXRaTC80VE9rTWdhZHppRU9XZ3dqcGdH?=
 =?utf-8?B?S2lWMVlVZTAwQis1S08vM1FWSHQvNldYZGgxWDFBNUNBc3F6MXNhaGpGb2hH?=
 =?utf-8?B?UzVZVVV5ZG1DTktXcCs4VGZqU2I2dTdiSEIrZndLcVBHQ0oyclFpeFpmaC9o?=
 =?utf-8?B?MFlRRUl5K21LUVNaMjlpM2U5NEU1R3pjeVBwZy9ZVm5INHN4clkzKzVSNTdX?=
 =?utf-8?B?ZnZzSHBNMm1vVDRLSkpVQ2MzcXB5Y05Pemppc09ycjRORStpOTIzSDZLTnVn?=
 =?utf-8?B?SmI0c1pMQVZnWStHallTTGpOTmNZQXhpamFCYTk0dldtWThRN3ZjbjAvVmFa?=
 =?utf-8?B?QkkyNnhhL2JLVXp5MHNPREYxaElvMzVtUUM2RFJkVzNqUlcwVW9TaWdOZEwz?=
 =?utf-8?B?WkhmaGp5bXc1Y2d0dlJlUDlrL1MvN2UweW1nOFRicUFDbDBZekl1cmxHTlZS?=
 =?utf-8?B?dnF0SUpLRVVLeDN0WW9ITVdqK2ZOSXJKS3puZGlyY0NiZC9aYkpOQnN6bU8r?=
 =?utf-8?B?MUtjVGVacEl6REpnL1ZTalltM25ZUWYxWEVHMlRGS09OU3ZPUE85dGNPbzQ4?=
 =?utf-8?B?VGwySEpZNDUra1FQREw2SFB0dUd1STUvdG90eVpGOHYzMk42dUgrcmkxa3hR?=
 =?utf-8?B?U21QbUtteHR2ZDNiZkNmeVB4NFhwNVNrOUtpVGhTeVFGWTlTUkZhOTNMR1ZH?=
 =?utf-8?B?cVBFMG5Eb1E2QngycEwxNVRIU2w1TVgyVHl3TTFoNlVMUVN2WDVXY0Z6R0Jz?=
 =?utf-8?Q?BdlLKp0kkg652JdbXe6cFe+qM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5647e937-736d-40a3-634d-08db4b113a68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:29:17.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFJUnxEynLHNCH2wftjkb4h7SriH8FwfPQSBuDc1RsgRclWKckKHnWB3YUjYT/FJVOwnbBlgqaOfPlczhWSBSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On 02.05.2023 14:04, Olaf Hering wrote:
> Tue, 2 May 2023 13:33:13 +0200 Olaf Hering <olaf@aepfle.de>:
> 
>> I will investigate why it failed to build for me.
> 
> This happens if one builds first with the Tumbleweed container, and later with the Leap container, without a 'git clean -dffx' in between.
> 
> Is there a way to invalidate everything if the toolchain changes?

Getting this to work automatically is a continued subject of discussion.
Touching xen/.config before starting the build ought to work, though.

Jan


