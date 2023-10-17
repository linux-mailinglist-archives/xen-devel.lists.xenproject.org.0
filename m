Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B07CBCA6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 09:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618080.961349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsekp-0004DU-5E; Tue, 17 Oct 2023 07:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618080.961349; Tue, 17 Oct 2023 07:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsekp-00048r-22; Tue, 17 Oct 2023 07:44:39 +0000
Received: by outflank-mailman (input) for mailman id 618080;
 Tue, 17 Oct 2023 07:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsekn-00048l-E7
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 07:44:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c2d035-6cc1-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 09:44:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7877.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:44:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 07:44:33 +0000
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
X-Inumbo-ID: 04c2d035-6cc1-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSOlABdpaSUuH4qJoU2gGvTFTzEq7w/VD6bZlV04dZh1/Rg2CwcZrZlwoquzpWJPvwybQEwMf3Qf71zq6bI9h1oZk4H4JLGPZpD53HDuvRfDC5SejoYfpel6zQBMjwmSgzKAIW4VzquzwY0cqhiyle6eWBa2ujBwjOeTFifGelTebYUsR1DfkDKeZ/LYKnCjOsNyW/TURNaitxp3+0TvzcjoaN1YaWW4xf8tFkmhSalRHoOus2bPFjD31WU1y1q8Jx/XG77a2Ik3ZqBscZVNDyUf9pH5ubzZLXPHNbghX3c2Q1oAIHeLdqiA38bJqNaBKTsXg6Pp5tW6pcMSovChDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkze/OsYiRiiGj/wkVo7GoOtDqcT8JNdm9b2IMB2l6o=;
 b=dHE7/CU/HW3MeP3X+zguuodoBK18F4jrqDX3L/Jc8c1oEC415Ku8scrJ3lNH9cAYTB0/host6usDBtE/UNF64C0eUvKSOmoqtEYejQTe8pdMHZWbSokyeaSxsW1pYyq4Al+iiU2kmJef/IMHmybfw2sne67kSiBuCxaDDWmSRY10vXGfS+gUlvNChNwetyMF4gIOfaomIydHLblp+Hc/9aYa9EjhldayVzAuELDJT34sJu/S7dmFFdhmSUfSq4FJfc3qDa5/SYYvtuu/vp4BdjcI8zOEi0kYeq2kpecPwBo43DKfaVfo7tlXn5lhQqwZcwZwCqs0HBbMXo8uSxZzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkze/OsYiRiiGj/wkVo7GoOtDqcT8JNdm9b2IMB2l6o=;
 b=bWAZHEggfJP/qtxX2EPf+XcWd64Hhv82VWiXdQZY7h2X3RWF4xF9oBW3HSL7z6Yf+jZz3K4bTwJJel1AJ+UcMkoPICvXA4+L3ACjyZyqdeGIAIGOMiwGrJvGMSG5VXPfgApftQVCDowgOOmVJk2wAoZUtdUQ7mD9veKFNynzEiMCCoSXlxfTAV+ktdU3Go2Clj4z0HHWOb0qHL5q9KEGP8cQpk73eydLILmWJyUKmOImnViJ7hGwcgwnM4xCiuo1YVWjivns4ltA2SlKV1YK2wlezvaP3WEbSN5uVbRzfeH6i/Unsyqj8B/MmrSse4YaOvaGIMf0eSo9SiQcBYGkew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca7a8bad-4d6f-1da4-b48d-7acbb5db401e@suse.com>
Date: Tue, 17 Oct 2023 09:44:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] x86/amd: Address AMD erratum #1485
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: beede205-2241-40fb-06a3-08dbcee4e738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3uQJLhLUkdqzgUamIHjuV+stnCRgJj41KDD6jOkY/reF7RbjcnNTE4wr/cMfqIqP+mge5zMIohlQiBs4RFhitzoYqOhUVwqc14C8BHVXSuvM98zR6bmR7myVdEAIgd16OsfOqLhRIWblGo6xBFmbZW14d+jJA1YrGRD0idbLKA5s3KFfhN1y5o0pJ/0vI8Y42wx/60kJadtG+JeuyNoUfRFoOm66aNldTgwbt8uH7WOkrJ577zOHfwqPUqAsNGstEyxhN0XuDVqllYNJCVicsIXl9LX+2/QUBzX1O9QNSdQPLXgAXSl8hxgk6/0mec042GAJfcxr5BO0IwrW79eshd1BopxIR2oHLoiSYACWkiDetmzgCzVMSeENWR0wDkdSvwbW8z5MaEll9ZFrjbFlU+fHgPZdFnBZeVE4jfIh+bH0gLHgLLyxL5X62kngYm+YthjtTGWtcj4OIWn+AwE566HkUv7hzqeIKmkp9qQ+iCTH7IQBgXGdF0O6rHRXavgjDw0k43rQziSPdECAXwsWI7b6S4X2vt0gyugZCe/iWAoA2b1BxcMLD1DFrdELomyoqKZswpN4wrKGRET2zKbh4pzFkcfaHlwhaaotg/2WZlQ5FngM9tqmLb32aLR/wBHIJ0UNoZ1UuCZCvGTSLYTC9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(6506007)(5660300002)(2906002)(26005)(36756003)(2616005)(4744005)(38100700002)(86362001)(31696002)(6512007)(6486002)(966005)(478600001)(6916009)(66946007)(54906003)(66476007)(66556008)(41300700001)(316002)(4326008)(8936002)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2lVeGw0dklWRTlNQmpPMUsrRCs4OUhDR3c4d2dHVjFGN3NSOUZ0VGxlbGtr?=
 =?utf-8?B?VzhSbmNDaVZKbFBZQ3VJelNmMDVJSTlwN0RtbjVIWGJIMVpmclByQVJJUmgr?=
 =?utf-8?B?TWx6SEo3em5EczJCUHJzRktRL291bDFLU3BUa0tRVHNPMGZENGJaRW1LS1JH?=
 =?utf-8?B?TXJXWjhKcjRkNU12YmRnc0w1czZpNTJ5TnI4aDN6VFFwU0xFN2FUa0JTdzcv?=
 =?utf-8?B?V2FGOWJHdExwaGVZM21md1IxeVFCaDQwSFZzT2MyQ29HRmpleVBMc0pQazg0?=
 =?utf-8?B?R2dJTHZQL2J4VmNlNEc5TlJDYTJHbzh6RWtYRUlwcDk0RnY5K0NTRlNWaHJ2?=
 =?utf-8?B?SjhKZWZEa3BkMkNZSEIyOCs5cjJ6MnJMM1NKa3VMZWVxZUEwd3RETUg4SGNv?=
 =?utf-8?B?d00vQ3dmcjM2dlAxWUgrdUxCUFpuTU9NT0piK25IQnZ5ejlCd0QyejBSNEsv?=
 =?utf-8?B?RlRvSE1TNTNRQVlrTC9aMkhxYVhMRTQydGJNRFpCU0t5ZGYrTUdQcHcyeW5E?=
 =?utf-8?B?V3NsWU5Xc1Q0cG1mWGRtWUtrMmpTelkxYlFRQyt6QzNUWHQ1MFBFamZoS1ZV?=
 =?utf-8?B?ZWxWNEx6WHpzRFc2bk9vTnNuOVJQMmlEWkFxWXQrd2FML3FVWUtvTjltc3BH?=
 =?utf-8?B?bHh3YmFRT290cnlyS3FkazFaVFRGcEw2T3dZd05Va1BzcDNVVWJKd0lZU3Mv?=
 =?utf-8?B?Qi9jMnVZUTBmeUQ1S2NtUGU3TzE1ZWxibSs4SGJjeTlScTVUOTQxTjd0NDll?=
 =?utf-8?B?UDA5RG0vdkZlU3JyZjh2RkoySmQxT3hnWVFVYkVOV0VCZWRlTi9TNWtpS1VS?=
 =?utf-8?B?WG81S3lqZ1ZpbXlSQXRyMlkrNC9ZaGNyUlF3Mzh5bFBFWGtTMkpnSlRXNjEy?=
 =?utf-8?B?NkFmSHF2S1VidjNQd0h1YlJYZzZXcU0xcVlLNVdDcEkvVGhiNFJCWkdkR2tM?=
 =?utf-8?B?Z3R1dTYvTktXL0ZjMVVaM0N4QnBrd0JkQUdJOUc0U3FDWXZzb2NrdFRpaDNB?=
 =?utf-8?B?UGRsUjB0bHdHRmFZSGZ1V1FCZDBsK2lsK3BIWlpuRktlcWFTMjlWc2tyMHA4?=
 =?utf-8?B?bmhWcGJNM3M1Mmp6VEZxN1g3ci9VV29aOHN4UjVHZTVWRTlMZm92ekNsQVp5?=
 =?utf-8?B?ZG1UbmpkSUh2YTJaNXpjK3dSUFByUCt4VjFCUDFzYWVkR2hxNFBEblM1RUk4?=
 =?utf-8?B?V2dISStMdE5COWdHc0ZQQXBybEFoQWt2cGdsYUtLeVp2SmZqTTVOOUNUSjFx?=
 =?utf-8?B?ZzBqbEphZmlUSlJTMHJabC84ZWdpb1MyZEo2SmtrM1JxZ21ZUnQrSlp4RGZj?=
 =?utf-8?B?NkNEZWpoMEljOHFSMk9tR1ZpU2pwRm1hamNaS3l0SHMzaVdNVVZ1TEVwanEr?=
 =?utf-8?B?a1QxYkZ3emhTM2pKQkcyWDN0QXBsQ04xSkVZNVNvaXhyOU1SbncxODNTSU5S?=
 =?utf-8?B?VGpPWkdXbXRGRE5jNG1GU1QyRlZqbmVaSEQ0RlpybEtYVnVncWFKWFhuZmZw?=
 =?utf-8?B?QUsvMXpPWDBrQVZEQ2RnaWN0TzZIN1NwSzNLRGZwdTFnR1RRZXpwT1UxNHpB?=
 =?utf-8?B?MzMrU1lCY3hEcVdFR0laejR2a0JrTTVOdlh1VngySWtmNXJsU1ZnaHh0OTI0?=
 =?utf-8?B?Ukt3c3JIN2Zub3JWck1TRVRadlNVdlIybG9XTXdxYzJkSkEyUWd2Ui9KSUl3?=
 =?utf-8?B?VHd1SHNXbHFZQlFYTlplV013bkZHWWN6azUzNHZGblg5Ymh4MC8rQ2RaaFVM?=
 =?utf-8?B?V0s3VnBBYkVES3dUNjVQSXNTNkdid0tRS2hGVnM2NjNkOFVWQk5kZFM0a3N6?=
 =?utf-8?B?U1VQQkZIZXBwSk5YcHNIbkxwRjhaeXFKOXNwR2tzTGE2dVMrR3pVN00rYklN?=
 =?utf-8?B?ODdxcVAyUzRmaUk1aTJGRGpUeTIwK3N4a2ZzRG1yVURqMEtMUW1GTEdXUlZQ?=
 =?utf-8?B?ZGpDSnp0bnYwS3FsTS9iR0I0cm11b0VyT1NuZHllRzJ0RjZvR3Y2RjNVR0Y3?=
 =?utf-8?B?ZWJJek9ZWGdESDQzYjduK0VnOUZ5SnZBWVJQZDlCU0VBbFpFYWplbkdzOUU5?=
 =?utf-8?B?c0ZGYjhzS2pVWU81Yk0zZ29ybSsxRjdCemR3b2dJMEgzV0VBSkFkdDJtUUts?=
 =?utf-8?Q?mMlL5ouFweoAoXNa2k5VZEnIA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beede205-2241-40fb-06a3-08dbcee4e738
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:44:33.1322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dsx9aC5u0y/e2YFgFYu36FMYvfFsRi9pKqu0SyFSrTG5QNjO3ycoSoBucPAqSxs8bAB7ki61aqSr832+vby2rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7877

On 13.10.2023 17:38, Alejandro Vallejo wrote:
> Fix adapted off Linux's mailing list:
>   https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u

Why reference the bug report when there's a proper commit (f454b18e07f5) now?
Plus in any event a short summary of the erratum would help if put right here
(without needing to look up any documents or follow any links).

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>  }
>  
> +static void amd_check_erratum_1485(void)
> +{
> +	uint64_t val, chickenbit = (1 << 5);

Linux gives the bit a name. Any reason you don't?

Everything else lgtm.

Jan

