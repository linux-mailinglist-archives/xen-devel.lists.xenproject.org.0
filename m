Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B36A4110
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502426.774215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbtC-0005C4-6b; Mon, 27 Feb 2023 11:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502426.774215; Mon, 27 Feb 2023 11:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbtC-00058i-2f; Mon, 27 Feb 2023 11:41:54 +0000
Received: by outflank-mailman (input) for mailman id 502426;
 Mon, 27 Feb 2023 11:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWbtB-00058c-A0
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:41:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b93ee075-b693-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:41:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 11:41:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:41:48 +0000
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
X-Inumbo-ID: b93ee075-b693-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPnC9nF5hQ5i9twhN/481DN1AuXSkx2NpX11NIW44zIKi19Sq3FBPIoh7xZ54oj31Jw2vT/ew37BrtzjkBJP3uoroCqH6XB7ap/jI30X+mCQCyfRAu6nzHSoEbaVtCnWFfnicdOOJVJhTtt1FcO98Je8MZqKq6dQk0NNPs6f0Em5ISTuS/J6Lk0lI7h1hKaeSGV7sCcdRH/8TrPIfmj7eEYaZHmtaUlDpiqjM2gL729jP7lw7BjSH/EjOhlhQW32GiYX/0ngLFpgPS2qNhUJj9ZBK+RP6jX9Fe9WYXxzS9UPI8W19qJBpO26LRuFwfaNmhSlFWehG2w7HEb9ixIJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqyxAaHyjYnZId1R023Dey35QLGxvmBHDMcwCyDHp1c=;
 b=eKlEA+ro09eywfuztMzH+cCUQ4RWYRCVPpWR2iPmbAxIxK6P4bHoTW7Jz3iz/k2TYUmcQY4uCnwQIntUuHag/NnGSHeKSAQ9s764lzbqEBHl7IHjr7zPQO3FfMYxVKHDiYWsn4IMHwBkcxHb2xMZz07mvSphHjrd715hmrqcHj39p3VFqNUf7M6NI7Ueo/9O2cuku0XqvZRvuutLE28szYElP9QYkFgEBb0gwUgToZnLf1p+4hbxUtvq+9HvoAqIMbEPhqGTvRWKQphxdFoZfap2DAJugGyS38VG2pu58laih1cxVaHacpY4d1x5j8oGqz70CpByKaUI4x+47Qg42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqyxAaHyjYnZId1R023Dey35QLGxvmBHDMcwCyDHp1c=;
 b=Wa4r6A47r8fAxHa0h7aBw/orQgbrRrf1qZIQ/VqM7fPOmc2LYf2buY7i2hMN/CIDWa4QbnriyToisG3big0yC3nVsEWriRnc4VUKXtvq1cIlyo+ThdQIV76F/qExFtNu9SyX56f3IIxYihPTX2vWY/qzbrHu2UIw5Ty83SqpIDpozfGspBviLkB5casoQk1iP+Vxiy2djExdcvEpV6zGGaeNu7GcboZzKHZDndEXbp6mr7WxAYr8MrIxCoxHCFae1I467zMZyDzxnlNzsSEZhk52JRwzrtr6HcawrPqW+i1Llx2itrKC5IKPZvP8FPbp0NZtTlFRTKhDVZ+Bi70BoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa33e30d-831a-d0c6-4495-0c01a380338f@suse.com>
Date: Mon, 27 Feb 2023 12:41:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86/svm: Decouple types in struct nestedsvm
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230227113533.2848119-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227113533.2848119-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: b57f2e1f-21d3-4b2b-96d4-08db18b79c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LxaaZRzTk0YCBv6aS0Isw+Z4nKw4gRr1pSZfNrgcM/6ww/BnLqSYo1Y6EpdKNFzdhivl475JVLK17j7DbufI/Dbd5H4i57uTUS7xl45LRoXi1vkkpHDt7wlCZD6fqW9CtXyRfzmjQliE1E0INA2hy6CpTaW0CFoQjurLhN5s2pT/U5yPEtr9H6fiyVcE5sSITU6gSrkEyqg8kuTcy9HaBSR3cjNADtSABTreuvDKxmOZrhWMAPeaNnkqKBJqpASLMt+K7B7yLeeCtoPD7VT9svuceSRhtLvI4AvMfuf8srNpnrL6XMpQ3Dl38IYqim8FM2NydfVPz6ZobAUpzXM+uktav3V253MJfK4x4Rwqnv/ysPKYahkMxnsd1XATxmWiYmYNmLS1F6AgwTAID2GKjP+SLoX5syaHETFGfZijWEoqu+ScD/PnLFKB2FtcrKYrRrQzjlyf059I+uOkNHuHjo5a+dSeNeDWmfpsnsOXv6p3uM9sDiPgBvy+VkiKEwN/Nuw9/i9PlGdHwTrMo1xR9sTG24xXruyH5Fjnf3WRZ0yoju3CqTSlKAj5I2cClhyA4aZaOkR0XWZF7LkH4tDqMIbiCWnRetJoPQaPZs4XY+YymgjEFUEiCyaltxB7OHSxTlfl+rCymHQ9fyHgXBM5xp8cTlbj1t8pS8VghYW01HYy4zu+hClvwGE6z+qnchJZBAkfDVjdzGZDaQS1w+OX4NPMqUgVJShWUujr8TfQM+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(36756003)(6506007)(6512007)(6486002)(53546011)(66476007)(2616005)(26005)(186003)(316002)(54906003)(41300700001)(8676002)(66946007)(4326008)(66556008)(4744005)(2906002)(6916009)(8936002)(38100700002)(86362001)(31696002)(478600001)(5660300002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZELzlwd0R6ZDlyOW5uY1R0SVZmTHNNMTFQNDhCR2RaQWk3S25IbmhNamV5?=
 =?utf-8?B?ZXRqNXZkU3p6dEF3M1RBU0hKWitPb2htM2Z2Yy8rMEFseDZpWm81Qjcybmwr?=
 =?utf-8?B?QXVMQXVlOVFsekhCZ0EyeDd6ZkwycUQwZUpmVk9naVFEclZ0MGZnYnpFOSs1?=
 =?utf-8?B?SnZoZmJ5NXRBdkk1U2VkRUNLa0V2UmI3MHRiRzdvbEFHNFo3K01RRDZXY25V?=
 =?utf-8?B?WDI5NFVGQ2NLOXZRK1FJWHY1S2NWUUVvQWkweW9ram1wNW82Slo2ZUVjVWFp?=
 =?utf-8?B?MFF0UzBBdWp3U05jNzZscG9ibmx6NGpEUEhOWW8zc3J3ZFBEWEdVZC94Q250?=
 =?utf-8?B?cnBiOW1SQ2E5d0FuQ0ZSdWU1ZncrQ3dGOUhVWW9tdWlUWEprV0MzTWl6Ym5P?=
 =?utf-8?B?c2RhN1UrSGZFTGNTUGJwRUdyNUJaMlRvbDZaRGhORjVqcVdXV0VRSkU4cThQ?=
 =?utf-8?B?cWV3NXdlZ1FSU1FicFdYKzQ3ZERISWNLbnhSaWllV0RlRG96WDBJeWtPREpY?=
 =?utf-8?B?K1JlQS9ZRFNIMk9pQjN1SnArUXJ6SkNoSDRtMXRrWjR5aTJQVEpoYlhuR0Yy?=
 =?utf-8?B?cTNiTlcvWUN4d3dmMk4rKzFGdkQ3T1k2UzhuVWszWkZJTEVUdnF3cEZXVDNm?=
 =?utf-8?B?TGRzVjkrT2UvNThFa1d2SFIrc1dDam1KM0dvamZadlBNRWZFWXp2VXkvOGlT?=
 =?utf-8?B?ZXk1SjZWWk0rZTB3VjMycFJjU25ERkt4VC95S2pxaGtPRWltb0pLbzlvd3Nt?=
 =?utf-8?B?Mk1yUTQzNldiZ243ZzJNUHlYem1iL2R5ckN5SUd0alBNbnJieFFvcDR2N2JS?=
 =?utf-8?B?Z0cvTG1yRmRJRG5jQVRXeVNVNnZvSk1ocElsZk5LVWM1dG0ya1Y0RlBkV1hG?=
 =?utf-8?B?MXdsYVZlNHh6R3FxemdMWHlOZ1lXMlhLbnFjdkUwU3oxcU9CeTVsOGJZQldi?=
 =?utf-8?B?TUtBSnFLWllBUUxJbXNQN1VSMHQ0clhNcFpRdm50OC8vY1VRcTlHb2pFc1Nh?=
 =?utf-8?B?SFhaYzZ2azMrMi9UTE44bW85TDNCckZOcmRYbW4ydHdPTTRHRFVVc2xsVWIv?=
 =?utf-8?B?OFM2YXJnbUN0SFl2WGxPTnhvQ1prN3F3ZmhIdzMvNXFId3lJNlZEcENKN2Ir?=
 =?utf-8?B?R01ZMW5YWDlCTytzSnZ5K1hicHorVldUMnFoR0ZTbis1UFVzQkZKK2JzNlhB?=
 =?utf-8?B?RDhhYTNhcFNCb1dFZkJ6NDNSWXVobDBKbWxpVW5nN3Z6WXlMbTM4UkNDeE16?=
 =?utf-8?B?SXpiOE51TlJkUmdkWW9BcU1oaVh5aGRpd3NXb2JaTG1malNsb2RZdzRzVm82?=
 =?utf-8?B?aHRsK1d1ZlZGd0Vhd3J3OHBGOUh6OTVvTE9wbUZhYVQ2dElnSGx5cmR6STJ4?=
 =?utf-8?B?dUpDMWgrbnNLTElwc1FTTEV5Nmhhc1B2SC94SDRWaGR2MmtTYmpnL1NDNHFa?=
 =?utf-8?B?SU5pbmVLb3F2WjFyaXpkc1JBbkh0RlJKRjlvTnBKUWZUbG91MnVnZzZwQndE?=
 =?utf-8?B?MDJOUnVPc3IvWlpzdXdUN3lwS0x6SEMwcDJLekQ0aVFPdjFIMjIwa2tNU3ZJ?=
 =?utf-8?B?aTg0RmN0SE1qYjRRWVpuVXkrZ05SK2lPZkJRUUFZYml0Q0M1T3pjeGRtZ3h0?=
 =?utf-8?B?MTNtbTRrOEh0YVhGV3d2RWVPL3plMm5Zbnc3L2h1eDJ6M3NUWDRHMkVuYUFO?=
 =?utf-8?B?TzZpOG92UTBkb01hK0ZuZCtPREtoamhUWHhKREtkL1pXOVdsT0lYdnNTcXd0?=
 =?utf-8?B?dlBSblg5V0JCbVdZeTBsWXRibENmNnRYclJBRUFNWGt6bXJUOTF5TURnWkIy?=
 =?utf-8?B?cThJZVVOemtJbTBwTXpHK1JFeitjeGROSGRWYmw0UXhwY29GMTRnZ3N1RWJV?=
 =?utf-8?B?NjdxVC9DQkIzS25nUDV4NmVtOG1XRXNvUjEyWDJDRk4zaGFkVWZkR0hJT3VS?=
 =?utf-8?B?REFXdEhYVk1mMWRQU3pCYnF3VVB2N2JkTTQzVnozc0VrOWUybm1oaURwR3o5?=
 =?utf-8?B?ODNRKzhGWFhZQTlIUU1HbUh1SHNnM0Npd0tZRmdvaXhvUGpVUzltWlRZVTho?=
 =?utf-8?B?MVZpbVlWTnhqVXhLdjdMVnlBWTl4UnFjUFQxUFZES2pNQTFUNzhDMUZSVGZX?=
 =?utf-8?Q?J54mnDQ39JVTz0iDMHReuQEd4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f2e1f-21d3-4b2b-96d4-08db18b79c77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:41:48.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcObehTLuoU7/CZYnheGKbIjlTLHzO5gV1K2kirTW5zJhHsqsGrJr2xZwcIPA0IuP/sUvXXc18w3ZEUC9ePQqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

On 27.02.2023 12:35, Andrew Cooper wrote:
> struct nestedvm uses mostly plain integer types, except for virt_ext_t which
> is a union wrapping two bitfield names.
> 
> However, it turns out that this is a write-only variable.  Delete it, allowing
> us to drop the include of vmcb.h
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> v2:
>  * Delete the variable entirely.
> 
> This probably means that nested lbr/vmloadsave is broken, but that wouldn't be
> a surprise at all.

Well, yes, short of figuring out what's missing this is probably the least
bad option:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

