Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33247D8E4D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 07:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624205.972557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwFm0-0004Ej-2A; Fri, 27 Oct 2023 05:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624205.972557; Fri, 27 Oct 2023 05:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwFlz-0004CE-Vp; Fri, 27 Oct 2023 05:52:43 +0000
Received: by outflank-mailman (input) for mailman id 624205;
 Fri, 27 Oct 2023 05:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwFly-0004C8-8q
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 05:52:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3c4e72-748d-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 07:52:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8435.eurprd04.prod.outlook.com (2603:10a6:20b:344::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.9; Fri, 27 Oct
 2023 05:52:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 05:52:37 +0000
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
X-Inumbo-ID: 0a3c4e72-748d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJz8Qz7Eljuq9Ii7BOIuOWYe7+wD1+epsy2FLQlxdIOACqtco7q3JRj03lgyjzt0Sbc1cj+Waju3jwGG8biNcQz2P7MHVo1kKJXmB8YQeTABepz20pkeHq2ljTWsmWQikACFKpVA1wWjCD2uH5pNbtUrL7LV5uYVeKilMY5BrCR9oFGM51SPeJ5DrPK0I6MiYAqyfnpGFIYzvHQA52JihwzOKhwWfqsH6kFrmbYIiiLJa1ppV9iLpUkDrUQcG5QRRfHyBrhgCSYznZGdsBbU43dU90Sp31nHlJZ/eNfust8bUm3IBKr3hpdFdgb2+Aznbix1k8SmqYR8EXTB6YSI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PbzUk38VxIU8334UTiLarqXadgrMhzYyzgwZ8GdFv8=;
 b=ZIJkKpPxfEaJQUxIitkT0tsiYblBgIDdrh78tW2Z4inCQ2X6C3yWxFLmuXWiAFwScYs3JOiK5YlUYGWwWWl3MBmCQrMWFhPKh7Xk1Q76Bvp18vb60ewx1fAMP4wUjrPJNeoNIcY/uVVZ5OAFp/rBkPAg27b5/BGOHbDAzTqJYH1eHdQScYFngmVXbMeIar/kiLw7Row0eQNiJbQDjXsSlTK6GH6o1ZWkps/GHfcawQeKId2W9qg/YqX2CzCLdgaN4QHuadZAMsmricrnRZuUVelreIQtowZHWepfODumnU16wAzSU0LtB3xl2ipTDh2Tuz6dMCayF9jX8uqlbtGkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PbzUk38VxIU8334UTiLarqXadgrMhzYyzgwZ8GdFv8=;
 b=NMqPX+JsUNepgaEXitRfbizXTNV/qD930qn2/MZhKsKEHjjB9i2l1cG52DRx5yrfBCnfWnMABpPYkiGoBo3LoQP2cUband0Mvhgrt60Oj0QG3LqZsJSMzkgl/I9N0P5WVN1J+eCbN8NeGAUIzrbYqdlKLUE2l2ilJzHlnpvs2cGd4KVqDZo4Q5gn8qTD+Jt/AyTAke0MA+kp7h3fJKI3iQwAVoTzmbqRvD3iNEccZ/7uIsRdKBZ69d/seKWu6OJVOihGurVHXkzfaj4BBPTAlFsX5Y6ELCU0jNhgGNzQqkNIfTZR4oT2htdYhF0BZSXtP3X5kV5M9XuKTIxk4cDn2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4f09e69-82f4-598e-3a5f-3d4b71ce65b8@suse.com>
Date: Fri, 27 Oct 2023 07:52:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
 <a907d98a-2d0d-cbf0-ae9e-cfa2e3dd37e2@suse.com>
 <3BB711DB-2420-4731-B3C3-A66E3791D039@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3BB711DB-2420-4731-B3C3-A66E3791D039@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: aaec0637-685c-4996-42cb-08dbd6b0ecac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJp6HZuWrh/cqUP4//tGhqZkeSu9bnOABY58DocfG7BIiqzM5zO30sQEabmkvceSrby1opfWHWI0h6sNwB7vuHALc4WKRwx81k1dRePaT+b0Km7fFG70vnaoAV2TXasxi+YwOI9qHnOkMloRx5/1blpt7fRZzEB3CpO/ye35DVHnnvvHw3O7r5PA3LGfGSoBXOOx86kjbALv108iskLrKJxvEJy+Bqx64DYeXUGTESJ5N11Gf7yl7+2h8I6nrejTgqb4fBUCx4GSQxXht8/1ERJvO+ldZB0+kX096dS8w+89aSxW0SG4aeesOgx1oFriTwUg2EfYDypGwp3EWKSHDDgK9DZUmyU6blKbxEWTPIiRTTbR3mTy+ndPBXaL1YEdJro8eg2sSWaGVihPIJigIfKflJVwkXihcPNjhdh5MuvR+mUV2TB5bdKe/W5oJv+o38Nl0qBALdgX5PZLLV/pNFh9nmLe/fmlsStwuWpt0Ujh1VSiUbbTeBjbZV9sABl1Eak/WrhrZHn5O0eYuaY9iWObnYi5xrwyENKvyfo+2IU2/+eBApC7NfKNARY0jk1nIvogMD2ISWEJjXCXTqnr/xKdRofcyqz1tfTXxSmaq/BPGzJp/UXU9BF119L0hDv0/HmahrBFBqwfvvXeXen7ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(5660300002)(8676002)(8936002)(41300700001)(4326008)(36756003)(66946007)(66556008)(26005)(2616005)(31696002)(86362001)(6916009)(316002)(66476007)(54906003)(4744005)(2906002)(6486002)(31686004)(478600001)(53546011)(6512007)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZyN2FseFkyZHBKS1B4eG9wVXh1RTVuSlk2aDVNRlFYK2ZGdkFvVjdzN0FZ?=
 =?utf-8?B?T3pzdDcyeUt1MFBUV1FTZFgvdk5UcjVIdVovZkZBVWhUMmJqakcvQVdiNEFN?=
 =?utf-8?B?OWZ0Um1TVG5CZE1ESUlLVHpQYWZxMVJsNlVlcGRmancwVW9VQ0EvY0VMMlFC?=
 =?utf-8?B?REpObmNOSml1UTRZd0pjbFRxcVduYnJmWndGL0VUejlhbGY5MVMwOFZJOGpR?=
 =?utf-8?B?ZE1heUkvaDNDR3RhOUxLQUtOR2ExSElkTEdUMjVwTGFla2ttQ1lzVUduMGNM?=
 =?utf-8?B?ZDliUm5xa2NTUXZpUkk5NFNMYjVUVmNDN0padldxTWdkcGQ1QXU3MFIxVmM4?=
 =?utf-8?B?bWZnZm4wbm9YUG1VK2N2T3pWTmkxdUl0dHZWbzljZFZVWnVPT01xNHQrN0xo?=
 =?utf-8?B?amQ0VEFtNHBqTlo4NXFyQ0s3ZVpnSTBaci9NTzgwVEVYZXlmZ0x1SmFtK05Z?=
 =?utf-8?B?ZkVncm5TcHphU09CV2k2NVBiOVR6V09URHc2d3lRcVFsSnk2MjFMaG45aEg2?=
 =?utf-8?B?Y1dsU3M2NnFIdkJzTE54UXlTTVRKVld0Rjd2WTlLeC94NE1vZFY2TklDeXIr?=
 =?utf-8?B?WUNDVzNxRjd5NkFXQ1JYR2dTQklaYU5sUnk0T2JGWmJqVG5hRFFYdnk0S2hV?=
 =?utf-8?B?aEJ4M1A1cjI3aDMrSVBEZ0RLNjh0anpMV2t2RTVIUGtReUpSQlR6MXdYdytk?=
 =?utf-8?B?bjNNVktQYXpVRHZUS2EyTDVlSDlGL0pKNjBXc0hWaDB5cXFycTA1NnYvWmFU?=
 =?utf-8?B?RDNXV1JxbWp5aHQ5alZrNVcwbE00b0F4NHdkMDNCV2dnUmlMeGxxcUZ2azdu?=
 =?utf-8?B?Q3Zoem43QVJqckRET25UaG9HRHF6S20wOEQ3aXZnTmp3SUFITi9HT25NSUdx?=
 =?utf-8?B?UHloTU9EdXo4YTVsblBtL0wzR056eUllWFlpbHlwNUhERTR4dy92RDZCbGpa?=
 =?utf-8?B?Y1dVQXZMa0lyZjhYSlRTOFVJV2hXSFFWUGtkajY2Sm8wZ3dWdUhFMFR1RmUw?=
 =?utf-8?B?VHUzKzhSbjlpaktVVUlsRDdjaHA4alFpa3pUUzJNcWxwS2N2ZHNHVmNibDFQ?=
 =?utf-8?B?WXhVNjFXQTNkUDgrTi9sbWRRbjQ1UU0xazZBekVUSU1Ld1FJRzl2amJoNHlW?=
 =?utf-8?B?M3FUZmNrT3ZiQXRQb1dZWjRjb2x3OEJjdkFUN2dHMmRlRzBUdVJzT05RRDVB?=
 =?utf-8?B?N3IzbHFselBFT0pUdzRDbUgrR1JSampFV1htdk01MVRGVWdEVDN2TGN5a3VZ?=
 =?utf-8?B?ZGVlNjZhM0VwdUdLem9oZk92RjhiT2plQUlaQm9WUUJiK1lmN1hrbmdCRTJY?=
 =?utf-8?B?R0J3Zi85SGIxd2dZMWo4SWRyM3hJNnZPUUNQOHpVREdKdHgvOERqV24yME9a?=
 =?utf-8?B?eTNDWDFQUFl5Y1NsSGJybWVyYVFYWmo5V1dhcTNxRzcwMldQbStFdkM1aS9M?=
 =?utf-8?B?YlBjU0ovM3hmRkRKWmYrelhEUDl5L1I1U3lReUt4cnJGTWZnQVRjZzMzVmN1?=
 =?utf-8?B?NHptYzg2SXJrQ1dMdW9vYnNTOEpDMDdVT2RaS0VtcFpheTJ0ek9jSWhReld4?=
 =?utf-8?B?T2k2UGF2YmJuc0RzMjJlWjhxaVV3U2RTOU5nWkNJZ2E1R2w3aC9RTkU1UE02?=
 =?utf-8?B?MEhoVVNLSjYzQ01tdFJsSWlvSnpLcWlpdWV6czRkT2NEaWg0MTJiUnNpUFRT?=
 =?utf-8?B?SFFob3VUTThiR254bFpiQWJFUDJvTzljdjNoWkx4RlhSN1dROERFNUN4Y1gz?=
 =?utf-8?B?blRSMThDUnVrMWNYZW9IRWF3T2ltNnVOVnZTcTQzTUNjb3FQTDR6bVJDVFIz?=
 =?utf-8?B?ayt6U1hGUVRNNkhOSi9VZFN0Mk4yZ29OQ01UMVYzRWRHNyt2cTBlQjRqVno4?=
 =?utf-8?B?aWptTlFrTmppR01IbU96VXlpakNtK3oyaVozazlSekptVHZBNldoV1dxNWli?=
 =?utf-8?B?MExOWWM5dlM0S1MzdUxVQm9KdVJ4WXR1eUJzM2EvUUhtN2JVbktBZ0prNEk2?=
 =?utf-8?B?eHVQTlA3ak1XOHRtRmEvdTREY3djTVdXK1BKK0VwYXJLSFdyenVyUG43VUlv?=
 =?utf-8?B?MnNlblcxL3dHQll1aW9PVGJlRnlMSDBTQ1B6YjdCbERhdGpBenZMMjFTdU1i?=
 =?utf-8?Q?So1SIQ/scLPZ7y5HatMx0OrN3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaec0637-685c-4996-42cb-08dbd6b0ecac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 05:52:37.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2giRPuey7sNS5w2RrZbnDMe0TxTN9bam8PqWOeIBCgBbmIk0ljDpcYcyCOs6L1tC1yGENA4RBpMwN9l//Nvhdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8435

On 26.10.2023 19:38, Edwin Torok wrote:
>> On 25 Oct 2023, at 15:04, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.10.2023 15:52, Edwin Török wrote:
>>> --- a/tools/ocaml/Makefile.rules
>>> +++ b/tools/ocaml/Makefile.rules
>>> @@ -37,7 +37,7 @@ ALL_OCAML_OBJS ?= $(OBJS)
>>> $(call quiet-command, $(OCAMLYACC) -q $<,MLYACC,$@)
>>>
>>> %.o: %.c
>>> - $(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
>>> + $(call quiet-command, $(OCAMLOPT) -verbose $(addprefix -ccopt ,$(CFLAGS)) -c -o $@ $<,CC,$@)
>>
>> Wouldn't -verbose better be passed only if the build isn't a quiet one?
> 
> Only the OCaml files (and the hypervisor itself) are compiled in quiet mode. It looks like tools/ and the C files in tools/ocaml were not,
> so the patch as is preserves the existing behaviour.

Yes and no. There's also make's -s flag, which I consider being wrongly
overridden by passing -verbose here. But anyway ...

Jan

