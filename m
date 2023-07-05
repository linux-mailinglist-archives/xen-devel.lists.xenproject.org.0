Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003C747D3C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 08:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558803.873219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwFo-0005nG-Kl; Wed, 05 Jul 2023 06:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558803.873219; Wed, 05 Jul 2023 06:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGwFo-0005k2-Gm; Wed, 05 Jul 2023 06:44:44 +0000
Received: by outflank-mailman (input) for mailman id 558803;
 Wed, 05 Jul 2023 06:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGwFn-0005jv-20
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 06:44:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b279eac-1aff-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 08:44:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7190.eurprd04.prod.outlook.com (2603:10a6:20b:115::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 06:44:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 06:44:38 +0000
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
X-Inumbo-ID: 6b279eac-1aff-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaAqXhh5BS+ZpvigB0MxceicwQJUuC79/l8rvqRY1fvjJDuVtpzatFRX39kZ51RRpLUla+69cbW9vbZBtpt7uw7SFDT9YG+pfeR+xnFccQ+sVaXa3OYdJSfJZzDWCuM91CSyckBjz9DQGBbbzB5qFIOaRelaeXw1/LJPY1cbnB6SiWShB4aXFWsWpOlQ7GSqCZrfqPSQUJHu4TINjXhKnevmW9tMfNjxzLmRtaKKGzSUnBsQdH82l6y9wBqOPJEfz2iJYXdcExPCI6jpBjj4FFVTx52+i/bjsQ7C+omJtWX0tGBEtF5rs1WRBR2bKkbQtanrzgU9keIGtPyjFL1DfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLiCr+DxF+lItaSvxrFpQBIF77sFEtJ67bAB1dGMkUs=;
 b=OZ8nO03Z5BqRTwqdoi+AcEQpIyEwlvWs0RVrest73uuIdIZPRNOxt03ep7zU3bq6cdY28TSWSHmwUXG+djzM3qL6TMNhSr5pFPUb1ljEeIHqWt6s8rX3945cf3/XzKvTVTgB4/6P6OOroGTSjWlJmcuucF9F5SqggF/Pxn5azIz6HMANqlDxs4P46ss9fELFW3jgOvjo9Wyq5M14hwihFTZJ4w7OVAmsznAQ0CaARj2FFKf5kdV32TSH1+bUF1QpooW/FATEpuV9/LVFDtjhuQzRdxGbNrEqY+6q//EKAnYrJ4iwlTBue1d/zwWrRhkOvUeodCOiCtjRGQH4i3M9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLiCr+DxF+lItaSvxrFpQBIF77sFEtJ67bAB1dGMkUs=;
 b=GuSLybMddGfcG1u/NPUev1ny7whW9v+b5VQAyq94cWVfjUpZG2T2Xo6YJB88g9hoGMsksTPDdJRuKe8olnHlBtPn+xdEy0lP2UMmqNpumWBbLA0yYIurT4vKahAfnrcsm+tzyl/mN9R4d+g+Lq5Kg48zUPd03Lq7CdjS83rImqdtS+S1uSZ7ju7uYjkQyC/uiHmJtEg/V7YHQ1SN08azQ/V8t0SHQGSwSmJYuYvDkSiiDibxLojzxw0X/QrijGVSV6NoUe/KQVMBnldKQfs8Lu6dGsKSJVIT2eWBNz1egwSYnV+QNBvvDndnveA99zCy2ZS1HzUWX6Dxx+wWGXdIkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8cca7e9-c284-b591-1bdc-00d18c01cab7@suse.com>
Date: Wed, 5 Jul 2023 08:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686667191.git.shawn@anastas.io>
 <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
 <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>
 <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: e03899eb-504f-440d-7cd8-08db7d234de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XEPopODXzzfpxJC9uLauPASD+UNJFcp1yfevQ1xcLQiAyvN0OX9uRILwvocXxMYeyK8Ua4YYsuYK46hTFFi3AkL856zgSe6VHWjslYpOUlvyW0BW7qe5fWZSmCR4LXzR9JgErXbcSYGL0DYBFCn1KRZkn8Fqq043VvuZcN/EBizIXCwHpJEogUnDj5Gl8NiyKDegXVD4C2Bnh3nB41KHlmtto9AJcjgjdXsaVCgRgsN5DXyfEPl3q2vYuD35rbHdRyJ89DHDARO/uvpt1U0gwWnUA8W4JNZ7ULGs3uhAmdDXvrWlmYTyEGE7r2iEB4U4Se7YBLlt3lFmMacIzt0/ldXaVSnxSDtlCvdGXI5KfAi8td8TpJD6eplOIK8ak67nUXMlSfOJkW3jBAjgrieT9xIVLZ/b7z4qsN2QUnLd0nFueD9LhLgwtqBLZSa0rpS49EeyUz6grG5yl+EI7ygRc4x/w/ngCqqFKOnTRa15xdfvDHI9+pYfyDQLuDPbGv7OK0Zlx++/oKO/RW6ddNQ/Z8jLIMpifdg+Wl1/eYJ4g5Mdktk0NKpZDNFPpOtl4CokG7QIKGABrwsO0zLiM7NOAtz7rQhIPMBdVOsNygezZ7jzGdtbXUy+VmI0AqU6iZ5xAmEUTyAmdg7f0R+oRJEvgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(376002)(39850400004)(451199021)(31686004)(2906002)(36756003)(8676002)(2616005)(86362001)(31696002)(66556008)(8936002)(5660300002)(6486002)(53546011)(54906003)(26005)(478600001)(186003)(6512007)(38100700002)(6506007)(4326008)(66476007)(6916009)(66946007)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZTemwrQVVBaEpIOFVranFwaUZLTlRZK3NtRUR0c0FDMVpCcmQ0K2RUZ2ZI?=
 =?utf-8?B?SjlyVEloV1dUeFl1VXBiVjdvakFzNjJod2pJZzROQ2Q2UXdYSWJHZ1E0Ukpy?=
 =?utf-8?B?QUtsM25lTFVDTXJheS83MzB6L21rNWptZHc0S2JzRDVHTjBiYTYyemdBaEQr?=
 =?utf-8?B?MlZzNlQvV3JnU3pnRmVLL0J4cTBCcXdaN1JzQngzYkRVUzFJVDJMd0lDcEl5?=
 =?utf-8?B?ZUtzUHgzU3JqQ0hicTJCeDNlaTVlTXpiZkhTVCtudG0rdWxOQTJweWM1dEVO?=
 =?utf-8?B?RjBwNm9KcktxT1pLdE9qczVPZ21HanF5ZithdkM5QzFBdHIyNi83UVgyS3Fv?=
 =?utf-8?B?dHZuM2lReGYvRTJycElpMExYdXQ4RmZwd3lCeUtuQjF6N0gwUVJkTzVOMzI3?=
 =?utf-8?B?UVdvbFVvdGFMSHprWU9JQXVQS2crb2U0U01PYlRsRi9CcGRsS0dXS1NHQzFJ?=
 =?utf-8?B?RmRVcmNSV1ZrbnJHTm9qRFNjTE9QNTFpblJLa0lkTkwxUldrMnRFaDUwR1p3?=
 =?utf-8?B?WDgwMHRUbXhPKzVBMCtLWnpxcE9DRXliM2pSTzlMOHJWVGhCMldWVHk2cUVY?=
 =?utf-8?B?T1FzOUVIU3gxczI3ZVpJemh6aEVNRHFLbVIrdUM0NitGZHVORFoxWVZuUzFN?=
 =?utf-8?B?ZlpMNTcvdlRuc21oazRDREZTMzlWbkJnVHhYMjlqK3Nka2EycjRjMll0VVh0?=
 =?utf-8?B?WW5PVmNpYmVsUGllcE9wL2Y4WWtqNUJkVVJPNCtwbVRvdVZxMEhITXo3UU5x?=
 =?utf-8?B?ODZ5ZzRwMDdZQjlxOVB5d2pCUW1QSWZxUnRVKzlNaUM3blhiR0N0UHg1ZCtn?=
 =?utf-8?B?ZkxHY05hcGJkUUhoSXczdm9WV1hsZFVhWHJrVnptbzI3UGdaZXdLaWJ0bVdW?=
 =?utf-8?B?cEVLcVNna1ZkUXJQbWdDT2hqajNHMVZwZDJ1THcvWEJUUEN6bHMrTnZQY3Mz?=
 =?utf-8?B?Z1hWbUVkUHEzMzUrR2d3NGZGYjk3cmlKdk50UVlNbnBNcUMyNGhHNzNqbjU3?=
 =?utf-8?B?eXhWSUY1WFRLR1F6SndDSTRKS2pxN08xSWRSd2lrOEF4Z0hWWk5vY1ZucVVj?=
 =?utf-8?B?TXlwQ1NvR1ZKdXVZRHZydEhiTFNaY0Y3U2FSaGdvVFBRTE13dW1PVUV1eDhi?=
 =?utf-8?B?Q2hibnYzOGlld0dXZmM2SnBGSjUrQzFEaC9LcDZocHNrSkw1TjBCZUNmYnF5?=
 =?utf-8?B?eGRubUNwN3NBZlZsSURMV1VMckRDZmZXWFA5SHNPL0RJMEtGMDRpM3hWbTRV?=
 =?utf-8?B?dXJ0bTUzMGVTcGdVakxCQmhTR3VITUplOUNkQlAwV0FVQlhqOXFOcmlsY3Nt?=
 =?utf-8?B?U3dsTWM2WUhxSnNqQ1h5WnI1clJTRE1jVG9BM1BIaEFYZ29TdHY5YlF3Uy9y?=
 =?utf-8?B?dm55WmxMRElkK3ExME5EL2R1cjZXM2ZCelpBdk1vWDNka1lIWTlFTUxkM1Mz?=
 =?utf-8?B?bTI5K2MwZFJBNVE3Uzc3MFJVeHpacHVmNzE5dTRRTmtQQ0luUXRGeStzMkw4?=
 =?utf-8?B?K0N4enZ4U2QvR3hjWSsvQmVudm40RXJOSlBXeS9iUHNEcXY3SmFONlhuY0Qy?=
 =?utf-8?B?ZllwbVpic0YrZUcvemhUVHRCWE9JZTVnbjduN3VLNUxGSmpiYmlNOGhFQytK?=
 =?utf-8?B?VWVETWtuQXJQZFFjR2VXTzA1NjFXWlRFeGVVVDdyVHpFNElvVDZqZU9BcVFC?=
 =?utf-8?B?ZWtPUEJhQis1SXBiaC9oU3h2OEVhaUxOQTNGSDJRZUNER01VeElkdGU1M0hF?=
 =?utf-8?B?Z2EvWW1NcXFCaHpoS0d4UmZmVXc2TjZDeW9welFmYS9aNjk1SVJyZnllbXBl?=
 =?utf-8?B?MjhlTjlEVlFXcTVQUEMrN3o1V3lRa0hOS2FHSFZtSEhKZEtXWG5wNlBTWk0w?=
 =?utf-8?B?a2dyWFcyT3dZNnRJRy9BYnlsUS9oTm9FZG5qZmMvL3VQMy9VNjhzeHV4Q0RP?=
 =?utf-8?B?ZkZTRFg3Yk96THlwTG9QRGxUV1B4cEJYWDBJQkg2U3VEUHRDZzl3SkFkT0ta?=
 =?utf-8?B?b3pUWk9wNkFuKzNwbEcweEhKbDBNR3B6WEFsVXgvcngvTUF3Tjg1R2doR2Vh?=
 =?utf-8?B?dHFhZkFhaElRTWxqSXZFdEg1b3AzOVYzdzh4WVpmUVEzRFhwRC9veGZCbXlS?=
 =?utf-8?Q?CeRl5sy9YNSuhRQfExyubW5Bs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03899eb-504f-440d-7cd8-08db7d234de3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 06:44:38.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlCH/5EWxW7utxfrAekEzKlRYxrwCPLFBKQwzuuypqgKggnudwyH0tVHhzNU9uscTOqeMXXMm7DcEjt08sfCKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7190

On 14.06.2023 18:36, Shawn Anastasio wrote:
> On Wed Jun 14, 2023 at 10:51 AM CDT, Jan Beulich wrote:
>> On 13.06.2023 16:50, Shawn Anastasio wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/arch.mk
>>> @@ -0,0 +1,11 @@
>>> +########################################
>>> +# Power-specific definitions
>>> +
>>> +ppc-march-$(CONFIG_POWER_ISA_2_07B) := power8
>>> +ppc-march-$(CONFIG_POWER_ISA_3_00) := power9
>>> +
>>> +CFLAGS += -mcpu=$(ppc-march-y) -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
>>
>> Wouldn't it make sense to also pass -mlittle here, such that a tool
>> chain defaulting to big-endian can still be used?
> 
> Good call. On this topic, I suppose I'll also add -m64 to allow 32-bit
> toolchains to be used as well.

Turns out this isn't quite enough. When trying to test my little bit of
re-basing of Anthony's series, I ran into ld complaining about little
endian input when the target format is big endian (like for the compiler
I'm using a default configured, i.e. big-endian, binutils build). Looks
like we need to pass "-m elf64lppc" to the linker; I'll see if that
helps (and where exactly to put it).

Jan

