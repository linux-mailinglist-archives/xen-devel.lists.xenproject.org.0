Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29356646D5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474853.736248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHwx-0008DS-0h; Tue, 10 Jan 2023 16:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474853.736248; Tue, 10 Jan 2023 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHww-0008BT-TQ; Tue, 10 Jan 2023 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 474853;
 Tue, 10 Jan 2023 16:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFHwv-0008BL-0l
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:58:09 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2080.outbound.protection.outlook.com [40.107.249.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39dcc7e-9107-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 17:58:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8867.eurprd04.prod.outlook.com (2603:10a6:20b:42e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:58:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:58:04 +0000
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
X-Inumbo-ID: f39dcc7e-9107-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WphBUvhP/IUpgtfvJvwzelBQ9Nci9NL9zHwpRLQqzPeX4pFOvfyeSh8vJ8t2T1nPOHErVhy+IQKw5VtqhEhCcZFJhGmy3r+lCvm4uTcocS9YB9f2NHWzuAH8pkzQ6ceeF9y9xXqcrjQt3AOAJucSviRIcX7Dzv+OeAuIuAX1kd5l/B92KPykF5rrlucQqFzRY3iN0R9Xbvitu17iLF1IbkmWk1VAcdTd79sW10mpEAqMz/UhJYN8QAeyb6ofwYs2BuvWftsQ0CMa/B3TsbxXzSqtdkv4sdLtbvg/dJhSOMOHGDw7ahBZM0OHSOpVi/9ZUhAcAYyZDKwaeZ1OX++ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk+UgjwtsWqSfKJ+chmrOVNVaUuKHHNOX4IOpLZmjNQ=;
 b=QRDAHvLTVS6RfkL0Py4BT0MY2linMNqoUQgaqetbMVWf2lVpE2e/UpQKbnFcwkVS6y693uWe7YWnfMKTuY/2M2cqRlUN1qLGkSelsts6Vs7qp/Is+GHgARUuIMumfm+9see8NbZVoZRQuPFt+4RCCBH8GZsAgt1WWw8GiMJ6s6eVq0JgNpxvuDFhpr/WdDjJSB1PtkDVJXTd1sn3/fRkqEOSqZnvjABojkAUnzI4+4wVKUopCIO5rYQ9lpLA7zt22S4u/dKhTRIBYQftNKtcN9O33C4IzRr9geUA8tqFnV+VPKTgYQ9UkU9KSuR66tRj6mfb2yqnEg8SbJFolUBhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk+UgjwtsWqSfKJ+chmrOVNVaUuKHHNOX4IOpLZmjNQ=;
 b=Q2zx6AKgW0yMPvy0xHiqLcJoGJsue5qQVAJRVOHnRl0wgyD1rYJ8qH/xk7nbCltKO/gct3a04wRQJyNx+QuDb9+4yNtK4laLXb+Ien4vJHufWXFoB9aquDH0hXsP56iCFqUvhfYCfuVG6Pxt3zBhNnVZMd9vNh+zOCy+4V6YGZkfSfw+7o7GU5zCegyNer3Rxh3pl0yn1mxEHCLIwrSvLLuhueMeFdkkqCwi8pPVVOVAE2RfxbcmjizyOFyyqtlfmslLclBPGzuj1H1gMqcFNnIXUFmA7XWtybjStDPMttt6CQixTE12if4Fet5zKN/56xx1KvTyDQFz50BrHrveBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
Date: Tue, 10 Jan 2023 17:58:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b03cab-4929-4747-73a8-08daf32bd6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsKPvJSylOuFAx82eqbkLeJ9l3N3Gg8dkjijFH2mnNxybHuvGpZlgxOWV8swXkKa3W+lZ3UfErdwRXSYR19EJPp6CmpngcJcBTGQLZTl+3FOEVzMAq4PUBjYaqaBqsprxCDKzcKGQMOWdu30RqYBZFrNwUMl57ipNCEkLKOjd1L38qQnB3iH9MF4dI2Vq5Lfqqz6LctftkuudhZlWVcExxp2AIomICr2UZ1xidwdNhMKuHdSJHrPXb+Iet0NKrlBJRKlV6MKghJsPhuMlaJkDbkzxMepj2ajUMKEt1EJ8DFNgFx5XlZyNaLMK+gWvGuf4GumXuDi3q7NpC0K0GHdaFQCswfVj+rYlU9j2MCk4JWsrWZDSIIez7CBpvrDSKJnAxQG3mrvt61gRoFHafTZK9DrwVBJ7QtoPbRM7KmYg6b4M1aXcrPWC8PbPsFh2iI8ow2yoPC6fDlWiQaZBsgbOilRlebdC4KOkPNLNiF42ULe+yNW0B0+/MtRS+RuyAUpwHNHVTG8iPkjoES+vXE3+oYjpbj6pjGDjl9k/HDzklgEjvr+fFvULo9T0DirhnOXzDx2Z1i84o+Qkil2M5nTfh/rxf4TonxlfCdODenkyAfw5kiquWqz4b/LGRLwchd76M39C1Qq8W3AY8aGZH5elvOUvUMRIxyQQMHNWAad65M36mTe+4pTJ7hCOvm2r2pc5hZpe30Y6uKB1Iogt04y2IAruoU+5uc4JHlU2FMvRpE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(36756003)(8936002)(186003)(2906002)(41300700001)(5660300002)(4326008)(6916009)(66476007)(8676002)(66556008)(66946007)(316002)(4744005)(54906003)(38100700002)(26005)(2616005)(6512007)(31686004)(31696002)(86362001)(478600001)(53546011)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFhVM05YcVFxdXkvSVBiRUJnbWgzZFM1Vm00Q1F6aXJEZWhlVm9hRzhPbStq?=
 =?utf-8?B?WFpOSVJsbWh0aU92OWRiMlozZlBMb0pacG55OFU3WHBmQTdKS05vNmFhbmdv?=
 =?utf-8?B?bmhUMnBFdk5tZktjdnVNUUxmMllRMUxsUjZvSGlYT1dBQzRWMWJkL2ZDc2VM?=
 =?utf-8?B?WkxZQXl2QVVCUDVqTHJYYnVjTHlqL2lCOTNFNy9oMkhWcDFCbEFlVGZNd3ZX?=
 =?utf-8?B?aDdDV1Z2cVY2VVhuWXNweUZKVTlZb3Iram5hajh1TkdWUldNZkY1eUdma1FE?=
 =?utf-8?B?WUhrbG5aNDgxbFdLK2N2RDdUd1hOVUI1aHBrVHllOXBnMkM5elJlNlJPQ1Ri?=
 =?utf-8?B?TWhzYkQrVHN2b1pCUkFTNGQwTDVHU1BFTEMwcVcwZGtELy9HanoxN21UZkla?=
 =?utf-8?B?NkN3WDg1WCs3dTJCa0dJRjlsa05iQnE3ZlFzcXFDTGpTZ0ZVc3NhU3MzQlIw?=
 =?utf-8?B?d3RYcEdjNk5wU1d2V3YzendtSGFjVlFPYjFIUFNLYTJ0K2diemNkVzE5TEpV?=
 =?utf-8?B?ZHZBM2dFa0dkS05tVmxEU29kbkxld2JrdFFHK1pWbVRWK0Q4YlY3QnMrSlps?=
 =?utf-8?B?R0lGazErYWZ6QjgxU3UrellwVUpmeGE3eUlRajdCc0x3NjJGU3R3VTdzb3Fw?=
 =?utf-8?B?WG5YdUozYlZhRlFaTU45M0Z5a2FjYVNjNDRZTWJKNXZqcHhaemwyNk1SM29x?=
 =?utf-8?B?N01GeENmMjYwMk8xYUNmaW5CbnVEVTdIbmE3MllFc3BSWFVGZGM4UUFJbmFo?=
 =?utf-8?B?cnh2Y01YZmIvT1ZBR0FyWjJPZDdEc2ptOWxOKzYvYjJPTFRXUm1NbnQyZ3Bw?=
 =?utf-8?B?WnRxbm9iTktLNjg3T0JIZ2MzTU56RkIyMkZrSGVpQi9yeEZPRUl3V0N6UzVv?=
 =?utf-8?B?QVRtL2g5M3FBNWo1bEhEY0RYNStnN1JWWUxrRjVVZmdQSXg0ODhvcmVqUktt?=
 =?utf-8?B?VGZPM3h3MlJQdE9ieFVFblQzczFhU1JVaWFCKy8vMjZYMnl4cThCU3Q1Q2hh?=
 =?utf-8?B?YjI0cytsaWswRW9xSERBdHVxdGFYKy9XNDBOQkEybHpSL2tDbVhvb1EzYlhv?=
 =?utf-8?B?RS9XL0hWMmpZekd4UGRvdGNUSEVrVExWY0c3OSthRk1Zb05kS3ppK0U5eEkr?=
 =?utf-8?B?NWZydy93eGVQcC9qaExXU1IwSDNSOFFsb0wxWDV3aVMvTzh0TmxmTEU4aVlG?=
 =?utf-8?B?aFFJdCtFcFVqSFV0NWxZSVU3N1dlYnhvZndjV1IrbzZyU3MwT1gzZFQzRFNw?=
 =?utf-8?B?MWxMdVJtTDBjdG5NRzNHa0ZWVXNPbmQ0bVUyeHk5WXVqOFc4c2M3SWcycWNJ?=
 =?utf-8?B?T3MzQTBkRHJiYlBXQWMzYXgxamE4azc3eE95REF2WnVscld5T0oyblVHWFcw?=
 =?utf-8?B?alBBNHA3NEFoS01HZkZwZ3F6dFB5ZVIzN3FNd0MvVjZTdDJYd1BYV29Zaitm?=
 =?utf-8?B?Qy9xdDEvekNCdGpNVmZCQTIwZkpDeWpSWGV1bVhVem1TSHVMOUJ0MDREZTBW?=
 =?utf-8?B?anlXVnA4c3V3WDF0Nkk0ZEEySDN4M3hOeFpxV2VGZW5rUktjZ1ozdE90Q0wz?=
 =?utf-8?B?ODVncEJuclMwNzRpdWF1MWpEekNKeHdFMG5KcDJ3K056N3FXK3NVSHE1VlBH?=
 =?utf-8?B?bWRBR0htVTdhc09ucFZ0ZkpFTnFnZXZPcVQwakUrWm1EemE4aGdqbkUzSGlT?=
 =?utf-8?B?Z1F2QjJVSWNzVHdKdmtYTE5YV1FFTWc1VjlMSlpnSWZ3WmJtallYY2g3d09p?=
 =?utf-8?B?YU1zZXpwamExZUtXV1FTdW8vOVRvaFQvUnRRb0ZRSnArZ2Zyek52UXd2NUl1?=
 =?utf-8?B?cThyMzJ2M2R2aVJyQzlXVFNjNUxTZlZ5Q1hIbUxkQyt4SDNpQXUzMDNYNXVH?=
 =?utf-8?B?T3k2WXdjVnNjbERHTmJMejVVTmtTNnJXbzcySm1pYmFHZHltRG9rSEpqUUVm?=
 =?utf-8?B?Vit5azhVMnZDbnBTZXRPdU9POXJDQUhCOHJiaFFLNUlBR01tZktKS0hMNzNS?=
 =?utf-8?B?NDU5QUVDVkFuSUhXSm96OGdGakNHNENEdGZBN0xoZU41Znl4dC9hZnRmVFVx?=
 =?utf-8?B?ZkxkaTExUk9tMHZmdWhiYTBpU3ZFQVBFSHQyMUY5QmgzS2tSYWhMMmE2ckhy?=
 =?utf-8?Q?+h3B3SIIWjRv2E6NudnjkuWdB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b03cab-4929-4747-73a8-08daf32bd6f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:58:04.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTLhwhXds+fwdPVHE80x4/Bju6K8YDfeRC6pT4JxffManHtNatiwqB4mC3zqfAIOsWbtIESpwo+t7SBuUIBvuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8867

On 10.01.2023 16:17, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>     - Nothing changed
> ---
> Changes in V2:
>     - Remove unneeded now types from <asm/types.h>

I guess you went a little too far: Types used in common code, even if you
do not build that yet, will want declaring right away imo. Of course I
should finally try and get rid of at least some of the being-phased-out
ones (s8 and s16 look to be relatively low hanging fruit, for example,
and of these only s16 looks to be used in common code) ...

Jan

