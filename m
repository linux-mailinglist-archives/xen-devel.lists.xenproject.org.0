Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96506D77E6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518355.804800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzEh-0007ve-GR; Wed, 05 Apr 2023 09:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518355.804800; Wed, 05 Apr 2023 09:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzEh-0007sy-DN; Wed, 05 Apr 2023 09:15:23 +0000
Received: by outflank-mailman (input) for mailman id 518355;
 Wed, 05 Apr 2023 09:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjzEg-0007sq-37
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 09:15:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62ec97af-d392-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 11:15:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7876.eurprd04.prod.outlook.com (2603:10a6:20b:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.29; Wed, 5 Apr
 2023 09:15:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 09:15:17 +0000
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
X-Inumbo-ID: 62ec97af-d392-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+jaEhnggllRYjqTkpwjysVVVgWFYTGz9lzM5nBjrVMB9UystPgajJFU+uYsPPQdxLs/ndXUOLdb2pZ52y9G55PW6JbTh8VuMHFyzt8W7ak5Mo/AIgdS0OyMDtiqq0Op6qd24U2yEP08YvS80rxQmnsR/aVmfQnIqZaqdJuXwn2GoCr/IyiofILZwcQKXLLqLMpWN9eb0M0yl+aYlzMNDqloe9JzAt4fEb9CgmvfOXTucSION6hIJn2fzvpbKy2ReHCJXLSDOaztWjwQwOUxmYoQzUs0djmzADw9Le9hm2N/va6db5BNUkxpigYCh/jDVcYohx8wASZ315XrXa5J2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e++isSxOgl7MWiuKsHDzIFCAkVOM4/Smlnr77qRqEsU=;
 b=Dp9Xs+vjTb6aobqXj1w3J1PKBsRhsCo4c2l5ygtBCJnnAH34myInPHAfk/EDhbO9+1PHhFwgQQ/0O7NR6qog0KBD4tKrNeXSfc6qdsFsl7yT/+pPMiLQ36dnH0syHiCstGXHmDuLKn8PpH0Lt4nil0440NtQ98qOv6Abgu6eWfRpDFsKImFGex4xJRaAdWB9YYbjp3bAXjJOzzW8o4c9EbXYynK3nfrDYZ3a0lLbe8VIulzltJMy2yZZip5PUafKB9KRHOw6dtASn2Ls2ot3blNR2CoZVfdm8JnSeiiqbDl8Em24FsC6gFkFIoOQfAEL5GFVpkbDl8Wo0b68l4MWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e++isSxOgl7MWiuKsHDzIFCAkVOM4/Smlnr77qRqEsU=;
 b=O8ueFYfc6S/gFSd08mPmjK1LA/Tcj8ZC2QNXQtvD4BhxXhrEEi4i8/3QHK6o7jNfuKd9Zb91xw5mj42nNIdJ8AaoxIPimT/P36t4jscekT43+ijz4fzTpqFqNvr3/s4jTwisC3Cq152+nx4PQglJbp+E5TmjJV1nuR0PnFavGRIkUmm1IYeq3oEmCYfqEb6qRqR0Ev9sXsKcrCTLLiSLYQmbUkGRhXAfWlMiA1aG/O5DmbdTs28xYMDP4GSOdiW4hzF7eRZG2Dt3C9AvBD3zJGD3cIlk1vlrEQIfsPy26Kd6vAO5+sWKvpx0Wsv7Y01AOUukiDnyYalt7B9GlpF2PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b523597b-40b8-7368-4742-9dbce06b4633@suse.com>
Date: Wed, 5 Apr 2023 11:15:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2 1/2] docs: Allow generic virtio device types to contain
 device-id
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Juergen Gross <jgross@suse.com>, stratos-dev@op-lists.linaro.org,
 xen-devel@lists.xen.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
 <37fa3d37-5ee7-863c-48cd-1ce313c8e296@gmail.com>
 <20230405085115.dayqa6mrkac372sb@vireshk-i7>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230405085115.dayqa6mrkac372sb@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 209caa11-fccc-4659-eeda-08db35b6458b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a0MWxSlQGV65ovRIA57oL8LKsBhQ0cTYrfgSPHqbYNXpA2+noTpTMXJawwrlJSnKfFBVyEvFoc8MvLqoLRw6OluPVkiGk99cO0ceRqN/moi0CpGDdKdcmwLlnCcc6OMXxRRWVfmkNeM+jbI2j7hhT4o160m+VxxQlfT0wRREOYEjyqf1w6dtdGmZjxO9cy4y09jrBIixb3BrjG/qGlRWGosN70yU37jsGmz6D9177JHw+JJpOD8RhVSR9O5Hgoz++yrJ/kTY4abHvD7SlWJeWtmLaTdhpOu4iG/5ZUj9ZOiyGvbVQvmxSfeWjRkGZ7j1pH5kjOVnSnklsLDnJQBiKNSBjtW7zEG2YLcTlk1zHsge5YGKqxHJ9LwHwqPOtEjk4NZ+LyTMqg42o/7dTqII853q/XHbiOezvY+o5/PMP+OJOdpz3423WLBQmQ1emm0W8CokRkiSB/RgdZD8ZI0MkexiXk7mm3T37/UPGW/uqT5IIyXJVp4gMLE1wOCajHMTR7zbceI77wIgYFcabtqiSzDKa4nfJxH88PAZa3jxVHmZ+WyxshVNZzTmWnBXXkMO2lAnXJeRa0pUS2k8v8O5Uo2ZBEYOhynDm69wXUbm9lUEFK/CNYLYSYr7vcNktEVhwxtKQON0w4vtTMN4HmlJyRt39BWofNLS5ky1Hi+Sx3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(38100700002)(4326008)(5660300002)(8676002)(7416002)(4744005)(8936002)(6916009)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(36756003)(6486002)(2906002)(478600001)(316002)(53546011)(2616005)(6512007)(6506007)(31686004)(186003)(26005)(54906003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJ5RUJkUzJhcGE1dXhSTUhZTjFiWnc1RWpjdHdCMWZhVjZJOXJLZC8zM3ow?=
 =?utf-8?B?cEFvMmQzbDU3SW5scTRIV1d3b1IvR0p6eUxHQ0ZyNWhEMGE2RDYyT1NSSUVq?=
 =?utf-8?B?aVpMcGdBZ2RvSklMaklpRVpKQ1V2S3QvYm9IL01OdWo3RnlwY1B0eVFHR2hz?=
 =?utf-8?B?dzBBUEdlOE5MeXkxZWVSNndkRmJiMjFJMG5rdXJYUFUzY0pkNzJ2Y2RFNEdJ?=
 =?utf-8?B?K091R2JzTUpnZVhMZ3oxZzAxS2RZcG56YngzS0kwWlpDOURHWnlVSzdWUm9P?=
 =?utf-8?B?dTFRUXd6aWVpNHpCQ09BeXBjNy9mTGZqcVFrTDY0UElWVjFNU0prM3dHTXIw?=
 =?utf-8?B?RU1OVVRNZ1M5MGJNU1E4SzgxK3crZFJrY1BLbEc4aCtSRmU3Q1puVWRuanEw?=
 =?utf-8?B?bFhnejlIRm1VeXBDZkVMNmtxVE4vNHJVcjZXdlZ2a1JlT29DcFhCWmluTFF6?=
 =?utf-8?B?cmE1QlphQUE3Y3NoYWlsM1VaTEladlYzTVdlYkV2SkczaUhJZEI1MXRlWmhY?=
 =?utf-8?B?U1JpM2xNUy9JNTVlcU5Jd0RiNVJ2K2Y2OVN3eTAwb2VNSksxV0lodTNiZjBH?=
 =?utf-8?B?RkRoSWx2UUZITXA0dENubVVGNVJRM2dRenpqMC95RDkxRUVBTTBYQW9RMlov?=
 =?utf-8?B?cmwrcnpMc1lGdDRNT1Y3RDNLZkhEZ0g0ZC9QeXU0aU54T25JZEUzdE9FTk9y?=
 =?utf-8?B?MTNlVHlyS1pkRlhZS3lHbmpqdkxiZHdwVi93OHJKT0JGVDY4SmMxUCtGOUd0?=
 =?utf-8?B?VVp4TVVQNExFUGZyWnNJMkF6aFRRT3BCTzhNVFZrazdndE44RFRRM0pHTUtL?=
 =?utf-8?B?R2lYWTRVYjlZSFZLRkc2Y1pkQ0tmcDRUR1BaYnFVWnVDVWRjRldzREFEcDhr?=
 =?utf-8?B?UTdTU1FZMmxRWnRyZ3lBeXo2Q1padmg3Zzg1dnIrUXZicFRCd0dsUGFqLzc1?=
 =?utf-8?B?WTU1a0ppWUk5cnhNM3RuT0N4aVdsWUlpVXByeTZLbkkxb3pIMmRhSFJGR0g4?=
 =?utf-8?B?SUJkYWRHQ0dQWHlCSFowOVdYRkdsejQ5MHZlTDF1V0FXcENtY3hmYkFlcEFV?=
 =?utf-8?B?N0lSWTd1d1pwQzliZ3FoVGNiZzdaWWFSZ0s3SzZrQ1hjWUFvL2E3TkNZdEJ0?=
 =?utf-8?B?OGF3bDhpYmgrd1hqTEhEM0FBaHNYeHNKMVNFZ1R0dVRDSlZSZ0JqUzVCeGdZ?=
 =?utf-8?B?NkZRY210Ty9qYitRdFd5UHJVZWhKS2hZU2pETHBYRnRxVmlVMVR5QlpaMDlo?=
 =?utf-8?B?WGdodkc1NkJpbUU2QitJRTZVR2plZkdvQUlKSjJpd2hTNEFFRGJxcTYyaTFZ?=
 =?utf-8?B?YjBnV0NubzZMZkVyWmNoSW0yTDk3aFBRcWJXejJFRkdiWVZIWjZyZm04L3FK?=
 =?utf-8?B?TS9EdllEbExFeGdaUG15bnB5YWZqd1EydUVLNU5iWnNBbjFscFhGTUc3QjdZ?=
 =?utf-8?B?V1dlMkJkQ1lTamxlRGZyREpOVHJWSCtIN0RoTElGcTJJUml3Q2RnYWRsaUVH?=
 =?utf-8?B?bm53RFZDQmNIblZpZHc5NXVsamIrclR6SXpMWXA0cDIzWG1DMGdTcVNhQVBm?=
 =?utf-8?B?b2dUVGI4Z3dTbVBNL2hMWUxzRXNUbjU4ejdsNFc0VUdoa282Z1drZzB5dm9S?=
 =?utf-8?B?NG9tRjJTU0k0YWhEaGxmbXlHZU45bjJGdXpHQTh0ZG8zQVcrSlFBck05VTRU?=
 =?utf-8?B?ZFVJU0xtQkd1U0xPUGVPTHAxTHgreUQ2enlSaHVCSDNCNU84UEUrbkFRZjdk?=
 =?utf-8?B?UW9odFpiS2lTUzJBNHczN2dncWRDdFc2WVFiZTJTaDI3a2hOODJBRWY2c1cr?=
 =?utf-8?B?eWdpT00rVjFXckcxcDROVjRlZmRDV2l5STh3V0ZGYTBoQWdPb0o5QWZITkZD?=
 =?utf-8?B?RlUxRThzNk1WazhXOFNVSjhxQlpQOXdsVXFXRDkvOG1La1BnSXRaejVrTngw?=
 =?utf-8?B?TlJrVnBnSjhOaVBpcXloUkh5RFM0NWNzWEduOEdQNmU2NTBCSUl4Sllod1BF?=
 =?utf-8?B?bFk3akp1Y1BXTTFWU2UvSTY4QWpmSlRKWkNFZVpvSzdiTFZaOUtBLy9YM1B5?=
 =?utf-8?B?MVNFTncvMXBoc2o0aVZCZEpVZkFESFVFa2tMTmRwY0hpMFhFMWVlN1BPVHNX?=
 =?utf-8?Q?GTV2JFh3yzvRuv5p22GqtIBRW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209caa11-fccc-4659-eeda-08db35b6458b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 09:15:17.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0FcpipTBZHGtx7E/T4c/Ujcp08CGzDJZGguTsEmmD6FWKKzNhRqueGSlLBQMFP9yTsFFfDO4k+XVErcIC8lxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7876

On 05.04.2023 10:51, Viresh Kumar wrote:
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1608,8 +1608,10 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is
> 
>  L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
> 
> -For generic virtio devices, where we don't need to set special or compatible
> -properties in the Device Tree, the type field must be set to "virtio,device".
> +For other generic virtio devices, where we don't need to set special or
> +compatible properties in the Device Tree, the type field must be set to
> +"virtio,device" or "virtio,device<N>", where "N" is the virtio device id in
> +hexadecimal format.

Are "virtio,device0x1a" or "virtio,device1A" valid, too? If so, all is fine,
but if not, constraints on the hex representation may want mentioning.

Jan

