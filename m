Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8307D82D2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623800.971992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzeL-0005M2-Oa; Thu, 26 Oct 2023 12:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623800.971992; Thu, 26 Oct 2023 12:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzeL-0005Je-Ll; Thu, 26 Oct 2023 12:39:45 +0000
Received: by outflank-mailman (input) for mailman id 623800;
 Thu, 26 Oct 2023 12:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvzeK-0005JY-K2
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:39:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfb997d-73fc-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:39:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9935.eurprd04.prod.outlook.com (2603:10a6:102:387::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 26 Oct
 2023 12:39:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 12:39:14 +0000
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
X-Inumbo-ID: bcfb997d-73fc-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThYDUZ6nislAfKqu8FinskBEYpVkysYLk+dNvx7zlKKHSGQhbleKt6noTA0933SFTtguoGPP+fGLVtgplzYPBhu37nOzaSbJAvKAGdNnYnrzec5405IB7Civmnfv1rxAyjypbBntAiJmPsEf+Lmo9oIPglfQl3/fxuJIu5eJYNgdJvQd3yJw35HzTeT86lVSLtjwWyuc+Obk1EgwLsr9Gaio0hdOJ/J1c6cybAcdOUUMIhtTLl4LZ4kcx+i489Fg0guhADXvwf8XAE4Z0mmqtz/gG1C2jNep0RSpcQ9gjQMv7+hPB7SI/bHzwBDyMaILutKisQjpXjRlyxsxxAYWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW/rpsuDDMfLZC1kac+VgtyspHC0JL2PsRIaddtjRYQ=;
 b=FZoKMs0UWlW3u+UWDg/DJlGQS7GH1L8nl1+UUjE1a2798TVwK9UkqMWKg8hZHhLOxFFACXwHbSrvOF/QmUu9vzTTDGCri+WOmjMfxIxmMB4wk2BaVzRif+XL9/9TeV30962nGRbqwlcQ6lH39TL1mzueC18bI9Rs7OV+sY2OHB+Ru0IGlzseLiuP4SRA0W3Dyzt1+1YpR+RdsiD9+wvhBlWAq0ClWt5FUg6XDdjFrb8jK+ed3x0LfT9ItYh8mYnUbhn6vHgaWlNUMawxmE87w+R6i8Va9sVFuN/5dRvoeIfBeqFPgknZcCWQY9s7oY7Uy4aHN6RE0b4sjFXS5f9J4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW/rpsuDDMfLZC1kac+VgtyspHC0JL2PsRIaddtjRYQ=;
 b=ynBdwNs15jQ/dWspvqxtO/gI/+k8vnrERiQ56clZQNb5Acsi4KHZDiIpESwLSTsVxwe58CbP36SlnI0fuUroJz0A90oYYJ76Hs7/n4CEBXt5shCSKhruv5bdWU/arABlOKtxe6S11MO6xCLJm/gfUShC39aSL2xLPsgUk/1fsFw1vnFoOUq4I2fJwu8sXxBwZNK1UqtyrkfoV7MwDVy5grNRc1/7GRt7ldD4BF1I5tKfndB1SxKcrSaYBVeLcs+E9Hdw9L5b/jUmwTnDDJ6RngosHI6ng0ySMQGHs4ukhi1m/Qe1MFDJECsm3Tvm8sw1DUG0PwiiN1REiD90nVSdRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com>
Date: Thu, 26 Oct 2023 14:39:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
 <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
 <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
 <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9935:EE_
X-MS-Office365-Filtering-Correlation-Id: 836f4249-a685-480e-576c-08dbd6209017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F7ckkQD0grCDhLbDYCPC0eN/BsCxI6aPdoqIH1Sre1ayp+bc7K034qeJkvl27AurHhO8QWylN15f8Bt7Arm0uX1ppYLOO/eYGHodrL4b+q8v/3Hux1xy6v/BLRBslP+0nCKfidjYnyvEg9liEt6hEL+PIhCMgVcsh416ysGsTlR2mZtCP6d7nN69ODEPFWKMFpADk3jEa50jBVvmLqiOVyxdji+G3BWtDouUUeQz+VS7u3oHIlLZ6kxQYLss9j3BrOz0JgSAaHAFbEeZ6x9X9nCqQZl5rwcaI5rPeb/BOFUm3gwTlv7sSAklm4exLDF1FIGFMcHmKdmBjLB/qn/Tg4yBrgYC23dvQ1I2XM+VM4EXUr9tX+9kMETpgevJHD9iYAhs2FHlR7nzSFWH/r/D0iiUJHWY7SuUUMM+7kWjFNI/c/rVI8hgxp7pv9Q0DXlqRYGkjCxDpYQ8oPSJYhwAhDW13xmCcZnt9Smw0uLKQ5llgK+bsUH/QCwV73xcqE0i+Iyf8DOw2STtIrFJK2AF5HTTpaG4YNNpTS0W6470lq7vaFmb4tMT4D3G+q/LzkebrGoxN0pYCKmx5+V009dIPhIIBOFUsczgSjxwL64+dLHXQM8KrH7ZwTR3ilfW949s34Jsd3l2LrCdAobeqeP1BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6486002)(66946007)(6916009)(31686004)(66556008)(36756003)(316002)(53546011)(478600001)(26005)(6506007)(83380400001)(7416002)(5660300002)(54906003)(6512007)(41300700001)(2906002)(38100700002)(4326008)(2616005)(86362001)(66476007)(8676002)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0JyQjlYQ0dydEVSVTRGcU03KzRndkxtRnA5YjdKeXgxVUF0YVFkclZDaDNY?=
 =?utf-8?B?RHZEMlQ1S2pZRUVsK1FkS3lUOG4rS2lNa1dwRU9SekVCSDJVOU5jeWVqemJX?=
 =?utf-8?B?S085T1BDMVBLdFd6bjdoeWhwMGV0emRyY05EaVpKaHZFTDN2ZHoxWDNyL2pO?=
 =?utf-8?B?dzRUc3k3SjdhamhUNDY2enJYUHdsam9PUEo2ZloyRnNlYUtVU2VSMjBVWDA1?=
 =?utf-8?B?dEdiTEVBUkQrcXBha2JCYTVJN2tUcG5ZcFFYbTJVT0pKckZYQTBhRTAxeWtT?=
 =?utf-8?B?ZmNVZGljei9NWkRQRXVnd0pSNkg4WjA3dGZsbEZ3K1VMUlV4dFk1L0EvejNn?=
 =?utf-8?B?NXdncmZPaDN6eDJQTnJncW9FdVRaWk1jSmRzbWVTMlVmRW52OERMd3R0dnBm?=
 =?utf-8?B?Q3VLY2VoMFI0VHl3ZjM4T1FwTStPSlNpdVdMcXIxazk1N2NpT05BcFdRNG9P?=
 =?utf-8?B?bTYvRGUzaTkzRk1tbXVBakxrU005WlRWeHBuVWhpNEdCU3R0RkFiSGNQM1ZN?=
 =?utf-8?B?d2RLaVlUeVNKUDBFN0o5cGdUL095ZDVwMlRJVEtVaWFMSDY2b25lbmc0MGti?=
 =?utf-8?B?S0cxNC9pS2g4MWJwUnpSTEV5TEhVUlpiWmNKMHlSRDhGUEN4M1UybzRVZml5?=
 =?utf-8?B?Rm9IWUthMFRBWkFxVWR2bWhnYWZBenZUWUJNSTQyM0JNUzNWM3BvdHZ2NFVY?=
 =?utf-8?B?cm1PMElyZnhsNTZqVnN6SXZWb1diSzVIRWtNK29Wczk4SUpaWkhHUFZjbTdS?=
 =?utf-8?B?b2MyMzIyZDhJOThrMUgxTFluMjlhT3VhdFBZTnZLOE5VSnkvc0NmczNZUlgw?=
 =?utf-8?B?OEx4V1FWSERVMGRQbFdMQTFFbGYzZlBVZVpDaGRBNlRZd09CVmpiQmdEYmI4?=
 =?utf-8?B?a3NFVXB6SlpyUVJPZXZ3dGJBN0RVLzlYSjBBUVcrS3BqVVhva3NCLzRhdmNL?=
 =?utf-8?B?aHhUK1dKS280V1IrV3VqWlFMOGlTZ2xBRmhsQTljSDF3MTdNcHlCSnMyT3M5?=
 =?utf-8?B?UVVxV0R2S3VwaFdReWFCaitiVE95QkJvTzZMREhONG1mUDg0Z0NqRUNaVEVo?=
 =?utf-8?B?OVN3RXZ6UXUxV2lqNG9vNHRHR1FRa2daWmhPT3J1Y1ExOFdwaFNPS3Q0RFpH?=
 =?utf-8?B?bUFVbzBNRjAxcmc4eThjVFNpSEpYcGJIdFBiSC9Cb0Jhd3dYd0dHMUVtcnlH?=
 =?utf-8?B?Ui9aWHB5TXRFK0VJY0ZseDFLT1dxZ01JSG9ydFJmS1lXOW9YRlV6dlJnMmxW?=
 =?utf-8?B?YUFrcjdCYWdTMUhrM1A1ZzY4M3Q2OEVzUEQvQ1lDbWVCRm5KU1ZUVTFOZ0RV?=
 =?utf-8?B?cml0aGRHdTgydUtGMDFRa2FMSXlXTFFxeTVxT1M0R1hLWkNsQjhWd2dXUjBo?=
 =?utf-8?B?MjUvZGxDcUY2ZjhGU1kzOU5SLzE0RVY4SkVNem5QTFJiQm5RcWpVRzFkSU1h?=
 =?utf-8?B?b0NFWVpBdWlBc200RGsrTEpNdHM5cDZrTGpiY1RLUy91Z3JNNVhjY0ltMTE3?=
 =?utf-8?B?c1QxalcyODhoT3RubXE5YWJiSVU3RXNMbmlSQXZOOG1rWUZpNjltMWM3VTNi?=
 =?utf-8?B?WG9PS3VsSUx2UXo4b21SK04xeXY0UkJjelNXYjVFNVhkSFdaMlJ4ZThjVGFG?=
 =?utf-8?B?MTk4dmY2NFlGbElhcjZKVkZEeWczaXdmR3EvbjlodFd1WmMzazdmZGNHb2RD?=
 =?utf-8?B?SzdCMloxd2UzZ0VSNjVMSGNFNFVCNzkrQzV6QThYZHpHVjFpZU5XMDFzUml4?=
 =?utf-8?B?T0ttSXBRbVVEcW00OWsyRDlxZlQ0RjdXRU1BZ3FnUVJ6VWwycFZCakZGS1dP?=
 =?utf-8?B?OG8xbS9lSVk2QVAvNThZU215VWZpemZxd2VaOHBoejBmRXhvSTMwNWlFcmVz?=
 =?utf-8?B?TmZhelp2REFWcW5WcVBaanljVFI3YWVYV0twWjRpS1BhdGZqK2UvOGJRVzJ2?=
 =?utf-8?B?anpTcFFOMDJJSjVMeTBSN085dmZSYWxHR2xyZWhQc2NDSmhkN2U3YWVOOFBM?=
 =?utf-8?B?K1lTTWNUNUZsdE1pcy9WZnRJampaUVpEMjJyZEM4Y0E1NVFrUWl0MnpCY1Br?=
 =?utf-8?B?Qm9ZQjh4WW1lK3Nad3QxT2VEZEw3a3hzZW80NC9mWUtXaG5ZZ2pWdThvUUxL?=
 =?utf-8?Q?WhKMPXZiU7lwKDmSW/g/7xRrI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836f4249-a685-480e-576c-08dbd6209017
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:39:14.8854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIzbh+Z4ndlfjoDdmzF+uMlJSdZ+cb3KEJ9MTAeh/BGLh00BlpTsjgkkT8rVm2mVf8KRMibfYfKTNk7dwCHczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9935

On 26.10.2023 14:32, Nicola Vetrini wrote:
> On 25/10/2023 09:56, Jan Beulich wrote:
>> On 24.10.2023 22:27, Stefano Stabellini wrote:
>>> On Tue, 24 Oct 2023, Jan Beulich wrote:
>>>> On 24.10.2023 16:31, Nicola Vetrini wrote:
>>>>> Partially explicitly initalized .matches arrays result in violations
>>>>> of Rule 9.3; this is resolved by using designated initializers,
>>>>> which is permitted by the Rule.
>>>>>
>>>>> Mechanical changes.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>
>>>> While not overly bad, I'm still not really seeing the improvement.
>>>> Yet aiui changes induced by Misra are supposed to improve things in
>>>> some direction?
>>>
>>> I think the improvement is clarity, in the sense that the designated
>>> initializers make it clearer that the array may be sparsely 
>>> initialized
>>> and that the remaining elements should be initialized to zero
>>> automatically.
>>
>> That's as clear from the original code, imo.
> 
> There's also this functionally equivalent alternative, with or without 
> the zeros, which
> doesn't incur in the risk of mistakenly attempting to initialize the 
> same element twice,
> while also giving an explicit cue to the reader that all elements are 
> truly zero-initialized.
> 
>           .matches = {
>               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
>               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> +            {0}, {0}
>           },

Adding a dependency on the array actually having 4 elements (while iirc
we have seen already that we could in principle go down to 3). A change
of this number would then require touching all these sites, which is
what we'd like to avoid.

Jan

