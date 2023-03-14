Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6336B9C66
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 18:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509762.786187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc80L-000686-US; Tue, 14 Mar 2023 17:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509762.786187; Tue, 14 Mar 2023 17:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc80L-00065N-QP; Tue, 14 Mar 2023 17:00:05 +0000
Received: by outflank-mailman (input) for mailman id 509762;
 Tue, 14 Mar 2023 17:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc80K-0005sx-Uu
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 17:00:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91aa2b4-c289-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 18:00:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8015.eurprd04.prod.outlook.com (2603:10a6:102:c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 17:00:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 17:00:01 +0000
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
X-Inumbo-ID: a91aa2b4-c289-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVjRBVrbEaqfIivCJhcUrm7wJPsA0Dt8flKHvJfc1/X7+J3XFpOsvZh/WE3gmqJ033EnKVpF56l3asvKqkPyS4IaMrXABkj1EURa4ITGJ9cRm62TvBjjWDr0D5VH8eXfw/IrseVfnQyLi8hIrqYQFuoTU3kCsBUQmJIU3vERDFxlsYpq4S31CCKAwshZCoHRoLMt2g56Vj+SrhT9Nd3blPzfYbCroh8DObdxI6QlVq+5DoPEBNVta3diOf0lcSoGnPvyxbzHPGZYAcjDSoClHMKgDrI0a3TK4v9D7DYMoczS1a9ifCZmhN1LfRMmdqfUF3Z2ufBgd0lSuMrBvtYJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyZH6zVVFg7TQ7S4CfRsrF2bIkOJb5if0uVp/OE9tdo=;
 b=F6QdHcs6eIPm+j+6MMePCbtqk+8vq5VxxN3qIbcnGvUCZe95BE06dckiulxmJXeMSgTGvdRJSj7CSlDlTcjxt5gBJxzQxgyx5DovMjsgPNHCrwHc/bEB5waKuAyQQED0fBMIycd/nF2y1Yu7mWKDQQE7ksnqiWCpbuKFb5tCfBF2dNtLTMJzOTJ4E4I7vqVRmwWPnT9L3B8C0wm7lhgMbVCO8ugj0E9RTMKBCNWcc6/5st7AdsuJfhoTqydvopATHuhxpjlBIUeQuAnX+BPh6EOut7DVdUOu8MV88XuRRsmmBDHzdA6Dk8h4dc3M2r7maeK2XHdGTheySpHr2j6m/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyZH6zVVFg7TQ7S4CfRsrF2bIkOJb5if0uVp/OE9tdo=;
 b=itAxq4oZKDXztjZdGfTGoD8SVB4rasELil85VLT/g0tgGolmeiiah8V8bveO5s7iqdhqQkjbNHkBnlT/kKFAUyfO2cVatDckg0iJ6EaVaAsjCastoyhg+Bcnl2zNJcspXoBHuRo9qUf6Bt5/DNgbISlodUpnU47j481snL63sLHIfT04+WhH0n/purCVPSQYrQna04DynqWrRhnWIfEFYR9BDUNLpmm5BM3lJir8wMFqxqJ7XfgPPOhOhBavkuB1JHSH7CUsbEOhWppYJ/ozv5nrWJlU0ScxVETLrj9+Nrg8BCLggJ6rdlu98IONJWwS94RT5wWVkrCk0YivGJBoPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <805f8cbd-e6ce-85bb-7ad6-3c461fc41c07@suse.com>
Date: Tue, 14 Mar 2023 17:59:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
 <trinity-720cf1eb-48bc-4eba-9e14-e9eb570b1e7f-1678812331526@3c-app-webde-bap40>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-720cf1eb-48bc-4eba-9e14-e9eb570b1e7f-1678812331526@3c-app-webde-bap40>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dbbbd0-e40e-4836-ff98-08db24ad8c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zqifX++uen5q7dngcvjdeKxPRKqseyzERyjMQtC6s06M1njcGdgVOwku7vPdsrC1Xswhjplfc/K4wIZCTDN4DubNP3b834qyjURuLoBM/Y/Brof6UArG7SJb251Fk9MIkpjuMTx5VSDEQ6eckV6ULeLGOrauTyhBa993y8rEmclI5dgpb5kX8xHfgeDdxiCd3vqEKnGcLtTfB5nFVQDAQ1JAlj+4tHl5ucAbSuNKtoRNeEGUPF9tkdipkwz4O6Gmjk0TNvuFp/BpaaC49Ak2nhqAJ5veM1g7th+MPD3RgssoZDCKGtbVk7q17I8C1b/XrzxqK4CJ2hLTkAy+UQcrk8COvhJhTvQl3OKB1qsS6l/uB0Xe0zcmmFOmVCrWnMyzxSfeoyx+SDlKzW0AafZgmdrH76LoC7Z7NWQhnHMw/Dk41ZCjnmzldkvVnS65LobidULZkGN2eMiQCb85U8W50AHTR6aaz5ywZM7lGuMrpfocX2wT3cJq4urz1Ov8nS9JIPLcyn6U/4nVpXF+d8bS3PB00t8aSOqqw7zinwcG47I6jahABVUDWDxtxCmrO4G3z+urOYgqPijRxGYu3o0X+b6gsR+NY3/PSxBN9xh9vRW0krvbH0D0rtJBSrB5dB+ZvEoV9gK1tsUfsVbatwP559ZXfhkxo1ccUV4M9pr3KMgAysK5b6UTtJvw4FMVa7WQRSEsAJ1bnL3WDMuhzVeaXjNbrmh4ujjP/3qcW6te/PA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(86362001)(31696002)(36756003)(8676002)(6916009)(478600001)(8936002)(41300700001)(2906002)(5660300002)(4744005)(54906003)(316002)(66946007)(66556008)(4326008)(66476007)(38100700002)(83380400001)(53546011)(6506007)(6512007)(6486002)(26005)(2616005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDJHdmUxVGtCa0Q2MmNzMUd0eDZCM25vcEVITk1KNXI0dkl0a1NyK0J5cXps?=
 =?utf-8?B?VlI1S0NaYm9yWDRxeEJ6QkVhb1FpMUp2WmpjTzFIRGxJeEJOdG1tRHBZU3ZU?=
 =?utf-8?B?djhUTXRvTnYvRnpVaEZEemdRRUMrby9pYmFaZGl1UjQ5RHUwVTF0WnpsYkNG?=
 =?utf-8?B?bzB0SGpFYUZyQ1FBMVFVenNNYzFtL1NqUlU1V0FweE9sbU1jOTZCNmUzeExW?=
 =?utf-8?B?ZFExSU1rYk9EL0dTOG4xWnk5eVFJTEJCTXdyRnNnVHpJY3I3TitqYndzTWxp?=
 =?utf-8?B?NmFYYWxCeUsxVjRDZ3BJV0xKUGpUcWluM0lsSlZvcVRIUkp4ZnVtWWhEak1r?=
 =?utf-8?B?a0xmYnVHakN1NTJiejRUSm1yNTJxSm1vaWxJZkR5VTlsRGpGWDNEbmR6NHdX?=
 =?utf-8?B?V3Q2b2xzdzAzUUczV1hlUm1uZDh4cGtwOTlTa2xSVERGYTg4d0ZZeCsxMnBu?=
 =?utf-8?B?S3JnOFNGTHFNZFVvUG9Eb1NlbG5xc3RoendDbjRaVk4wcWI2RzNiSElvdWla?=
 =?utf-8?B?TnAwUXRzUHlhS0U2dXJmOWNybGNOOEZEUTRhUmxVejBtU1JQRGo5Nng1WXFK?=
 =?utf-8?B?M2MzTUNBTUlzcHhveGt2dWlOWTYwWmhCTjZLZjdvd3NMYWFQRnFNcUxYb2lw?=
 =?utf-8?B?K04yT0tMZm9FVmZTT0NwZUl5cml1REJ2MlNDZlNkMy9NODZtd2dpL1c0YXNv?=
 =?utf-8?B?OC9iTFdEN1BTVlQzNGRFRWNCc0pwTzZ0cmEvOE1leStkbEhDbkN4OENtYmpO?=
 =?utf-8?B?aEpTKzVuaHZNZUFhaGRRV2dmZFpwQUk2ZmFyUkxENVVFcWNManE3QzdNZzJC?=
 =?utf-8?B?NVFLRlhmRnZtaFlnRlNGaGRGMG5qWHRNdkVUeTF3N1lpSE9vcTBwTm8vaHIv?=
 =?utf-8?B?M1VvaHExS3BoOThISFNyWUcrdjE5R2VqanVmVWVpYXIvMnk1eXkxcjlYUGRB?=
 =?utf-8?B?cFM4Vkx3dCtmN3pOQUxVYkswRHVMSjlHVmRydWQzR3hlVHJ0T1VlWHVBMVY2?=
 =?utf-8?B?RzJCWmpLV2ErNkFkcHl5VWxGVUZEdWRzajg3cE40SkxoR3hJM1NYRWs0dk8z?=
 =?utf-8?B?dkVTMXUvVGhxN2JhVzEzTVJKRnpIVDFQanllRUhlUXRZNlc2L3daY1FxQ2Vh?=
 =?utf-8?B?V3MrSm9Ud1NzVm9EekJyRHpWK0x0ZXpheFMwMzQ4M1JxaDdLR2tWKzRKbGRE?=
 =?utf-8?B?cXRLQklMOUhadXJWcE9wMksxZmhXMVMzQWdhR3FqOGhDdk43Y2xSb2l4NmF0?=
 =?utf-8?B?SW9LSTYxZ2NEOTRWWU9xQ3NtaVE0N2YzNUJJendKQTBHRGtDaHU5Ky9nSW1D?=
 =?utf-8?B?NEx4d2IzbEVDT3BqT0d3RnMzTHJzai9zTmdhZmhOS3NQY1dEdEQzSXlEYWJN?=
 =?utf-8?B?M2VNd3I5RnVTZFlJNlBHUmg0YVRxVlNvNHB4TW11cWFQOHFUZlVmOG13TGhP?=
 =?utf-8?B?WDMzcDhXa0RFQi9rNitZUHIrV0pncjUwMzFjcVo2UHhnellROWtxYk5Yb1pK?=
 =?utf-8?B?NlJBaUh3a0FhWFZqQXZYV3hpeWplTDFpc0xBQWFHYXdpVmNVVExKNng4RHI2?=
 =?utf-8?B?elNIelNySE94djUzZGhyN1dac2dORFU0RFBCeW9kWXB3dU4zbHpUeVlPTjVp?=
 =?utf-8?B?UzZjUUR3UDR5QkhNY0ErSHdnQXlYWW1PbG9rWjFLSEJqeDRUNnQ3bStLZEN4?=
 =?utf-8?B?QldPY3ZmNDg1Y2ZqdTI3ZUZXTGR2dVk1V3VDak1nNndWRWVXUE83TEd3Z0pK?=
 =?utf-8?B?MWxXTWNjZEJhU1dDSzErSzhtT0RHYkx1SGdZdEtyeENVY0tmMEN6SEtrTFhP?=
 =?utf-8?B?OE96N1VGTnE2emc2cG8ySUM3TzlKdWgrelhRTU1RRG9jUTRLM29WZGdNZWhJ?=
 =?utf-8?B?VzhQWjFYZHk5a1N0TW5nR0JCL3dJYktkMUdrUDgwVkt3UEZZSFFleWNtUmh4?=
 =?utf-8?B?U1A0dlNYc1AzU0JSRHByd0xNQkxtSjVoWEM2ZUp2b3MvcUJWd04zTXl2cGRj?=
 =?utf-8?B?V3Y4d0FKQ2FkUWt4VFZySGJqOFh4WGM2OVI0K2JFTEpuQkU1V3F2R0RGbVdB?=
 =?utf-8?B?eVh4UDk1ck9wQXZWVmtwcG9VYkRiakFGaWJaUTZLSm1tMENtejBXL0paR0py?=
 =?utf-8?Q?al3u7FmKf0Ewq/5S8pVBVRcuq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dbbbd0-e40e-4836-ff98-08db24ad8c8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 17:00:01.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHhv9zwWnw0tRLHDUzQ7BuVhF5eaH/rjpmMAYtCihLGRQZOMdmHrnqvsVnntk50Oy6EXB4r3h4CWBHQVFE3AYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8015

On 14.03.2023 17:45, Denis wrote:
> On 14.03.2023 16:37, Jan Beulich wrote:
>> On 14.03.2023 15:53, Denis wrote:
>>> What tests could I do or what info should I provide to help?
>>
>> Boot plain Linux (no Xen underneath) and collect the full set of kernel
>> boot messages (some distros store this at /var/log/boot.msg); "full"
>> meaning we want to be able to see all output regardless of log-level.
> 
> I'll attach some files from /var/log.

Thanks, and there we go:

[    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
[    0.121495] AMD-Vi: Disabling interrupt remapping

It's 5.10, so somewhat old already, but from looking at the code I wouldn't
expect anything else with a newer kernel.

Jan

