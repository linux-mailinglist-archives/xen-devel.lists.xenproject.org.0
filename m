Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49650F357
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313500.531046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGBn-0002ne-Bi; Tue, 26 Apr 2022 08:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313500.531046; Tue, 26 Apr 2022 08:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGBn-0002lD-7s; Tue, 26 Apr 2022 08:04:51 +0000
Received: by outflank-mailman (input) for mailman id 313500;
 Tue, 26 Apr 2022 08:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njGBm-0002l7-6G
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:04:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a6d93fe-c537-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 10:04:48 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-07ImwbkFNV--x8Nj3TsdTg-1; Tue, 26 Apr 2022 10:04:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:04:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:04:41 +0000
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
X-Inumbo-ID: 8a6d93fe-c537-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650960287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSEbWyfkd3Vts7MZQe+N0h3vIdDUe9n+9BmIm5uJE5A=;
	b=H+sIxJx3TMabEg47YXHv5RUk+WPvMae0jcov7UZIzwLA+1q1b/jCMHV5frpfkRT1u+8T/x
	XtuShUhAwCKy9BGNTaVCmVNsR5rvZ5KMVvje/m5mGy6endcM9BUqYwxpF/eR8E8QKljisX
	2YidOgqh+2iZspd93H4XdX/6vhG/UeM=
X-MC-Unique: 07ImwbkFNV--x8Nj3TsdTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ2b5MPBUAqjRiVQKCRaVGxntuaHV0MHmhqzN12QPUGhzl7Sxi4Bk8wA/18L2Iuz/lITPs4gdJdyHCwYOqnisgdMuYIRmtkeziG8eb3wipO4C7ghAVFGolc9mpGnlHRhaT5xLkJzNjT3feHPYRrXyoqgdG3obrHaouNLtPUnvN45BI7pYe+X0AGuzs9oLzLOIK+FnnwmRUNH03FRKwmz9TPi6p3JXRmPIU0kQyXYHN5DyQqFPSXeHxNtI5kK2+0y4kNogRj4od9LsSTj0eR7M97Tx3ozI5Ffdx1tU0+rSj0w9857WDVMWmsot0Oj2zUzkZke+DiwjUP2p3N42xV13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSEbWyfkd3Vts7MZQe+N0h3vIdDUe9n+9BmIm5uJE5A=;
 b=mrhADl5mjmIcaRPF7G1Xoce1Kaez0LyA2s7A7Cdkli77COiyL/1gNLnkbUsU9DswPyHvGSV6vKqa7gwt6TIQ8X8xBvbFZuUfpkOJercvH8SpZGkVKbrjxktkbG80l1EnxxzXr2UYLVrPKP3erMAU6yGmKpzeJqiFdlT7h1XY2rHFq5ECoz/XDfYZl/Cyav1SiYmlAN/dNbcN/pOtgN06PJ5OVZjfa2tMi69Ok+Xw/fdUUc/b9ZcFIEt4DrrdYK58bfGuoxCCWdw2BZePvLUFHAjrpxVeXKKu0JpufdilBdt9+ofGH1vsE+wlLm7yqlGDfx3v6K50GWs1xVjQuHPbvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c84e70c-9cc3-5818-d453-b53354650771@suse.com>
Date: Tue, 26 Apr 2022 10:04:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/build: Fix build failure from LDFLAGS mismatch
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425230656.12808-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425230656.12808-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23d81701-ed3f-4abc-a2a8-08da275b6aff
X-MS-TrafficTypeDiagnostic: DBAPR04MB7208:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB72089F035B76482276E3B5DFB3FB9@DBAPR04MB7208.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kZ22ydMvLTdsIxrjYSV8lcni0U5biySyPwR0amLdXMWHJHzfQXkf26r3TbNXjzbTBdzuug4xl6Rg+3HYOFdCEt5Emj8WOlBKSow53m4TTDbsvJpWZB3WTqtcbmlzkI7SFdkw9ZKUlsMHS5F6qcG9VTFV14W8dpHraCKZuRZwFn+ESDJQfbKGHGeiTuG4BkVbWPBHFhfOIonGN4HQpl/vi5AfnsbBLVJuxOxJgEXmW9nDnRnPKgc7nEA2KPbfp0Z8JM64686OPcDgkcUuLRvs+7JXVnMmHJkwf4imyki/reUxX03YOl+rs55lr6vaqaNqjnf7N15lGLvTw0HjJGwP6XhbSTRvwe1Vv07MGyUn2dEGplKch++0oKKWqdYqhGB82DlzhiK5Hih4CNi4aqPPQVoyvnjR0eX2xLetqb8LuhEzVM8/yJq41PZzfzO0yddnf5gvy2RHzZdh98i81yIaYtTiz435N1pYf5PwnQAw5VFkY8No03SSV6ldoL3ih8qnBbPLis+Jcc3iJirQU9mk3Jz2pDghJk/lEC0ukBGsGhtKw7zG9ccpBwGkwAxB5YOdw3NmlPtqaZCnsgVSTwyWuwUe3JyU9z1TNZ2t+27UiVporYSDfasTdGM2Uv+pmADgSVuvlyVG8xqTo5gk5ldegDI6ZcBlwMZWv1I5UKdJkcLYB0/lKMMuSQrJxT5/071bmaSC5xaWHs6qJe/OR4+raIqv+gDT4JK1QSX7MnudSH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(316002)(2906002)(2616005)(5660300002)(38100700002)(7416002)(8936002)(66556008)(8676002)(4326008)(66946007)(66476007)(83380400001)(6512007)(6506007)(53546011)(26005)(186003)(54906003)(6916009)(508600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWlHT2p0UU05cGplWmNpZ3h0cE1jVzd3aUZudnFla2cxNzNQSjFiUmQ5ZVZW?=
 =?utf-8?B?a1NSZ2xHRlB1VVRIRHBiSzlEbWVzcWR1UmhTQnZrOFd6SHE1MGhMeHpreWNv?=
 =?utf-8?B?Yk9WbXQreUZZOHJXTTdKbyt5OXRSeDhJWlJnYnJ2bGgxanpiOHovd0E4dnU1?=
 =?utf-8?B?cmgvMXUvMmhtVXFQNi96Q2svdUJtQVQ1VHowTkk1TjZLNlVodVRLZlU2Y3Nt?=
 =?utf-8?B?cFV0QkgxaFFPUGdpSmhmMXBPK1hyaUFmcE8yRitsalJ4YytOcTcrenlSaXc0?=
 =?utf-8?B?enlkMHpRTWR4SEU4K1NIRnUrYWRRQkMza21UOUx5WEpwU3lzcFdHMnkvMTdX?=
 =?utf-8?B?RzU1RW4wVDdoRmFpUHNRQ1BlcUJ1RkloZUpCWXhaSHpWaCt3bE5abmZDNXJs?=
 =?utf-8?B?a1k2SmFiSEYzYmVNN1pNVWpMUVMwMVcwU2ZCMXRRNkN5ZE5idEQyNUVQdlY0?=
 =?utf-8?B?WXFoOXpMZXVTeUhEVjAxYmpQNEpmTFpFTW05NkczVmo5dWhvbS8vTWxuVE9r?=
 =?utf-8?B?ek9FamQrZGllMjZBc2x5Y05TeFFsOTR1YmFibWJGSjYyMHhpZXF2c2pRakxn?=
 =?utf-8?B?cDhSV3RMa0NDMzVTN3VYQTNxa25PeEtSS0diLzlNZTJUdEMrajc4S3R6NTZB?=
 =?utf-8?B?bFRWK2ZLMXpCT3dQMysxeGhqKzU3diszVDZtLzQ2UWhGQ0hPR2IwSXpHV3Jw?=
 =?utf-8?B?UFZpc0g3cEhqY0E2c3FZbkZrdWkyVUJhSjQ2SENXOUxncFRsaENnS1VkUVJE?=
 =?utf-8?B?a0lydlJzT1dGQWZFeVVEQm9VcDZMYW1OWGlsWExpUXdGNzIrQnY4dHdvRVNw?=
 =?utf-8?B?RWFISmpYc2hHbWNBOUxPTEFXV0VSV3NuY2ZLZzAvemlCWFI3WitraXJDbkpo?=
 =?utf-8?B?UldVM1pJZnpFODRCdjNiS0VyNEJjb0VUWDJacU15ZVA0c3FqcFBEam5mUjR1?=
 =?utf-8?B?SGdnNEhOdmMrZFE5Y25hT05uYytPQ3p2V3lzQkN5cDJ1OXE4a1pyK2ZYVSs3?=
 =?utf-8?B?bzRZQWV3RHVNS05mdFRxTmd1Q3dTOHhILzZ1QzBPdzFHNFZNTzVtcjBVS3F1?=
 =?utf-8?B?cHVodGhrL3hJVitRM1dNSUVVWE4wZ3pBNzBBdmRqVEt1MVFUQm9PT1prL0p0?=
 =?utf-8?B?eGd2VTRtdHVkU1FsU3ZMMFQ4WHVZaDJtaTlxelFZQVRvMFdpSkV2eVBjYUJW?=
 =?utf-8?B?b3dnM2ZJc1BnWFh1ektQbVBkVGlyMFpUR3RXSmRRTTBqM2RrMExYN3pxMU9k?=
 =?utf-8?B?Zit4WG90Qm5JK1dsN2Y1bXNHSDhqYUlpQ3kwTVFFVGtqVkt3NExsYUJHU3c1?=
 =?utf-8?B?Y2srd09wRlVrVTBYM2JqRnFidXovaFIrcjVRd2JvSk8yUlR4anJRU2djWnJ5?=
 =?utf-8?B?dHBpUDN3Y2xmUU9IM1ZIZFVyc2VHQkRMOXRNNmtqMDFtYXhZQ2VuZmFkcTg4?=
 =?utf-8?B?SEE4eFM5SVJ3OFVWR1V2Q3RwTkg5WGpqcWhaT0V1MGdTQ1ZWWTN4SExaZXZN?=
 =?utf-8?B?OGxYRldYMURhcE96Z3d5and0ME15aHZneDZlWS9JOGN0MCtnQkxGUU1OcEdF?=
 =?utf-8?B?d3Q2SHhZQkdPc0pGQjkyd2NhQmRoQmNuRDRSdmczaDF6dS9qcncrQ0tncG8v?=
 =?utf-8?B?bkZKRG1Sdk5jRkgwV0dsaWpUR2JzR09zRWFzZVdnb2ZDSzBtYzR3MGhZa1E0?=
 =?utf-8?B?Y3BKeXRDTVN3WjJUTXZvQXExZWtKNGRCRHNXL21vS3hRb1ZZby9EcityczJk?=
 =?utf-8?B?MnpFRWg5eVM4Z0pqNFQ5VEhWMHM4aXRWbmM1dVp3QWovY3dDbmxCZ3oveFRD?=
 =?utf-8?B?ZUVhRHdWMnNkeUUwdUdpK1V0MFdPM0xiVnhCbSt0RWNKYUdOalBDaU1kTFgv?=
 =?utf-8?B?eGJYMlpKT04yZGZYL2x6cy9DT3FnRXArd3dMM3h2bnlpUW9USHRJV2hWUjlB?=
 =?utf-8?B?Z21BTFBJc1pIQlU1Z25adklXME9MeEVLdzJlbE8wUU5CRG1MTnlJa1dzd21S?=
 =?utf-8?B?MXRjbTBmM1h3ZE1vQ0pXWERzQjNVK2dTZEtRZjhwSWhtTEpEMWpGWkFJNUhS?=
 =?utf-8?B?SDM0VTMxSnV0SW5DUlJ6ZnNoditIMFdVRVhzVmxiWmswaWx0NGxFd1pBSlZj?=
 =?utf-8?B?SzRnYTVhSEhVb2s1d1JNcmVPa1dKN3ZyZlV2YjBtMFNNSW5vRkhpUktHbDZ1?=
 =?utf-8?B?ZWNwYzlzQjhiT1dwK2VacjZ1R1Z4cy9IdER0Mk56UmZoN3ZTcjJqRDlxSmVo?=
 =?utf-8?B?YXpCSHUrQTZ5Vm5XNlZ3VnNTK2kvYTk1Q0UxWHRJVmgvRGdlOUhueWxIQUFx?=
 =?utf-8?B?bzhBU2hEWWVXdmhueERXUnlTNHlzenBOQmhVQWpON1oyVDFCYzlmdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d81701-ed3f-4abc-a2a8-08da275b6aff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:04:41.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYrWI6aR8V4a2CIsjdRX7gFNWXq04IeFrmnc17T6uUu/OLrf3QUblCOTZ6gKcy7ASYNh6FMioynDlD4UN9Bnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208

On 26.04.2022 01:06, Andrew Cooper wrote:
> In a GNU compatbile makefile, $(LDFLAGS) are passed to $(CC), not $(LD).

I have to admit that I have always been puzzled by this anomaly.

> In a default CentOS 7 build environment, $(LDFLAGS) is set to -Wl,-z,relro,
> which causes the Xen build to explode with:
> 
>   ld: unrecognized option '-Wl,-z,relro'
>   ld: use the --help option for usage information
> 
> It turns out that many downstreams identify this as a breakage in Xen's build
> system and bodge around it in various ways, mostly by unsetting all of
> $(CFLAGS), $(AFLAGS) and $(LDFLAGS).
> 
> However, that is a security issue because it means that tools/ is not built
> with the distro-wide hardening flags that are otherwise expected of
> packages (relro, _FORTIFY_SOURCE, stack-protector, etc).

This "security issue" is introduced by them, I would say. They simply
shouldn't build everything in one go, but rather build "tools" with
the flags left intact and "xen" with the flags suitably pruned. (We
do build "xen" separately, albeit for different reasons.) The way
./Config.mk works this would look to be advisable anyway. And
xen/Makefile should perhaps arrange for Config.mk to skip this
massaging when including it.

> tools/ specifically should honour the packaging environment's choice of flags,
> while xen/ must not pass $(LDFLAGS) to $(LD), and should not be influenced by
> the others either.

I'm not convinced of the last part of what you say. Why should it be
impossible to say "make CFLAGS=... xen" just like "make CC=... xen"
can be used?

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -254,6 +254,8 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  # reparsing Config.mk by e.g. arch/x86/boot/.
>  export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
>  
> +LDFLAGS :=

Instead of this, why don't we do away with the few uses of $(LDFLAGS)?
If I haven't overlooked anything, there are exactly two lines (three
if also counting a comment) which would need changing.

Or why don't we transform -Wl,... into the form understood by $(LD)?
-z relro, for example, looks to be benign to the linking of Xen, the
more that this option can also be enabled by default and we haven't
found a need to disable it (afaics this option solely determines
which linker script to use when none was specified).

Jan


