Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00A40F74B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 14:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189345.338986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRCgY-0000G8-UR; Fri, 17 Sep 2021 12:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189345.338986; Fri, 17 Sep 2021 12:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRCgY-0000DI-Pw; Fri, 17 Sep 2021 12:09:42 +0000
Received: by outflank-mailman (input) for mailman id 189345;
 Fri, 17 Sep 2021 12:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRCgX-0000DC-5v
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 12:09:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2187597a-17b0-11ec-b689-12813bfff9fa;
 Fri, 17 Sep 2021 12:09:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-fEf65TicOAqmXWqh0E-pGQ-1; Fri, 17 Sep 2021 14:09:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 12:09:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 12:09:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR05CA0091.eurprd05.prod.outlook.com (2603:10a6:208:136::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 12:09:35 +0000
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
X-Inumbo-ID: 2187597a-17b0-11ec-b689-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631880578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgKqa1a2alCeEDcpSkSE04vyMAsol14/hENrc2dKKfQ=;
	b=YjvpnnEaGGgLGvwWkaEt8DfZxHdFkcuS/20JyzwjgsNHPNuxDUji/M1qt5i+HEBTeZR/gf
	tyLZyu26hr5HAmmT/SyeZH+4zoLPKt/NkUj7tIhJb+YkmibS9TQHLtvYhqIFrhTUauheyB
	FGqvN+Jn2OKbGY+OIVnD08hAKKjEmXY=
X-MC-Unique: fEf65TicOAqmXWqh0E-pGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvuHhOIOXfGqJP49vGk2rmdXQUCQHhzOGiVru4g6pgswX0/ioGJVcDfSe0NtS8h2R32L1wPI6UOKGnVzxGJdHESDzbyhU0sCOL6MpJI3E18wsVsbYBLg3QglCeEmXW2ogTaAT4Wsr+9Kbfv5QCv3L6ZzLl7Y0Ab4zjLt5KZpPA5BIg/+xEoyYoejvdNxQV6Ls0f8FXPzw2auoxVuFQ/Nu7c1ijGKiYVgrBQw0zocI3Fyls+Pw2ga4WlxEavIyFzGZOqR8BO3vJzLT/m8AYwd4wvMNMaIQUR00FxU9T1IdJ+He32akbB+2+ok+Gx980mUIEr6y3fCv6Fl+4Dc4QaDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mgKqa1a2alCeEDcpSkSE04vyMAsol14/hENrc2dKKfQ=;
 b=UVWnfE8R9p7s37vjS6/ZKavpzPc04WJKxXMuEb9P+8zmYfLEImk7LhNumBEH1ob30E55e6qLfV2k/UnVpa4LH8pt3ecqMm9c/A4Aj1DRgTmnDMVr3yVrjUn8UKhNj5/oYmeeUM4YmbcyCGElerCpAYT7JwmjbFNdpha2IoxGFOFBPQuaA3LLrVj8uPHve9DdPvoxmbd1eTPjCtiKoJF5dQMrvlloNUeh226ynb/q9KdVKOEb4S2cF84fklJgYTLe41zaTe7I9iBwmAC773wg67ndg7g8usyhC1bcJa/Bk0kgYFnvA/iC0xN87r3K7l0OD7jz5bKDKO6cAyJq7emqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 09/10] kconfig: update xsm config to reflect reality
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
 <20210910201305.32526-10-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33d87667-4be7-0ec8-0c1e-f773d77f2d72@suse.com>
Date: Fri, 17 Sep 2021 14:09:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910201305.32526-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0091.eurprd05.prod.outlook.com
 (2603:10a6:208:136::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cef4b084-c852-4ecc-bcf8-08d979d40425
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46081F63970E1039EC1FBD3FB3DD9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ixsxzN2C3uhfvoyFhhRS9prEQcEeson01LF+EctWRFRjyBwL48HXk0yrq35S/mZqAj6bJVf7djW4ky0bCXl1SmXEcNfrObuXseunMIGa5s5eVfcwanFLgG8i1p/DhydiE0pNsHdHTNbpWb1vKxrLj5/lRZiqGnqo8Plh+cvtE1m8vMffQYfxsDgXaSKIKsUOIQNDsuYyaCTUMeFpAZ2H8MH+LZMfwISEFVMAg6TUT0VIMHT7R54iCnG8RLaqo3hd2/m0n4PtYGMzgAS9NeuAlsFittdl+ltxeuqONrVKuzct1LEjWmPKfSwv47sYsR7+saoAdXA1/xKaxWS7BTDopJNfqkCbxxjpLdJmMuvKoifRrqppSunGLCvIjXQBq/jOFdK0Ol+c8Ip5DEsc8OozqYslGthTBzQLvXsZqYRTb2Hngv4dwfPpO7RWofPBw88hsMZv9mAARBmmyMdouPxhNFb4KLm97AoIxOz5s6NZRzcrZukW2V30gFsRIIngB9qJvfcAMZpeVCJ0qOrkwe55miiBHuqo2IWceScGuUr/20miuXZ2Ieg7GTorrbURoL6cPsINjD3aP8lSAgL6ws9sU7yQCMZbNBvN69j2xe2gNcVMxHW8fK5NkwZACH8XKO9cKKsNsLyl3cptiMAqHBoNm/dRlRNtnRpeO9rUnstKDvn6M7GBLFI/nPKXwqFYfWG1vHNC3g80OuxKH7D0W6KepAo77jiMWTu/GY2ZyyCmUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(366004)(376002)(346002)(5660300002)(38100700002)(478600001)(956004)(26005)(36756003)(2616005)(316002)(15650500001)(54906003)(16576012)(4326008)(31696002)(6916009)(86362001)(31686004)(6486002)(83380400001)(186003)(66556008)(66946007)(8676002)(8936002)(2906002)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUdDcFJDMDRZOGIyOFFNUEV2SHA5amdlZzhDaWgycmorcVQ5dlFKZHJhd0w2?=
 =?utf-8?B?cWdMYVB0VVB3bVFlSGltREhzUE1FM3hOTHoweFhMV3ZXQ0FqbG9ya01kemRz?=
 =?utf-8?B?cmVCMWxFc20rTjBVc1B2aDh6NUYyZDJXV2d1RlJZSGhNdnd0Wm1ENWhFN3Ey?=
 =?utf-8?B?Nyt0b2duTERMWU1JcWd6c0Uzd1I2dkN1OFhNdGhxOXJxN21iOC9STVkyWmll?=
 =?utf-8?B?RTVBWHJoQTJOR09YR3BaelJibG5CMThoL2U3dVBSUUhKbkVIV2VhSlRVbXUz?=
 =?utf-8?B?OEJvS0tGZC9Fd05xOE9ZdnNWc0xDUjlJMGJCMmIzZVZ5RWZyVHBCb3lTSnEx?=
 =?utf-8?B?RmNlWGRRaXpQSFBSSVFhcElQUzFKd2Q1OHhabm0rY3hMS0dsZmJDTm45a3ZW?=
 =?utf-8?B?dU5GL1F1MzkzRzRQbG5mVnBiL0c5RTZqYTJUbWw0NDR3VWhNUE8xZWlFamVN?=
 =?utf-8?B?bWNqL3pQaUk1cy8zSTlReHk4QW1iUlFWenhvM0h3RlQyZnhxRW9zakNjdDJB?=
 =?utf-8?B?NXVrLzZpdUt5b3NjTGJiNXFDSW5BcXZCVnN6M3hPWExvSWpZNnpySTU3YjE4?=
 =?utf-8?B?V3hRMkxjcHlBZGp5VCtLbFNuVmkxdVE4NWdtT0ovWFJPdGZpM2V2NzBvblVk?=
 =?utf-8?B?MVNEMUo0bHZ5Z2llWVNUYWZTVmhlQWh4WktUa212WktxRjJ0WGhyYlcxYTNq?=
 =?utf-8?B?YmppZXFRc2JkYXJFU0ltaFljcjgxSTZOQ09YanNDU2pjYTVsbjRKRm51eXUv?=
 =?utf-8?B?d1dVaEZiUXUwQmI0N2s5cXN2eUpKOFlTVElBWFZBMTc3RFE4MkFtbitaV1dU?=
 =?utf-8?B?cjB1cThTY0tQak11WHdRbzhBL3RrMDNpTEd0bGlQR0hPV05Ld2FwS25VNDls?=
 =?utf-8?B?ekZFTWxHVGVpU3NTNmtTbFhZY0pXWW9qQTVDeUtKTEJVKzNiYWh0RnRjYjlW?=
 =?utf-8?B?d3FVNUVTSEljTHUwYWQ5R01Bemo4eDcreW8vWEI0YUtFcTVsTDB0b0JlVEpi?=
 =?utf-8?B?NU9SdVgyN3lST2NQRGNwUG1ERTVqd3JOV2VWZ2ZYT29ndjVUT3N2YzRObHJB?=
 =?utf-8?B?NG1pa0x4WlpnNlIyL0Q1Y3ZpaytRQXMwVkY3WG04ajdUbCtQME9VeVpKOXBE?=
 =?utf-8?B?UnovYnIrN3d6dGswRHNid0NQRWZaeWo3Y2pUeWNWVmNucVl1b0s3d2ZMWGor?=
 =?utf-8?B?NG53ZmZwN20zbTM4dTZsbEI1ZmdMa2h1aXJXQjZJU1ZQNk1JMmJMN1hUVFVM?=
 =?utf-8?B?QXhNQWtKUERYSU43cUk1UjNUZWJGQjcybVFEOUh1SW5nZEdibjBicU94R1Vx?=
 =?utf-8?B?UXBPdWRyM01ZblVBcEF3QkpENG5JbVY2eUNtVXFLZGIyWTdwdVRWeGdFOWk2?=
 =?utf-8?B?T3NyU2hXSVo3UFhMT2ZzOFM3YnptK0JyWFNvc0JBQThId3YzVXRkbEx2d0Jr?=
 =?utf-8?B?UDVFU1dQbnI2b2Z1bXBEZ3lNNFIyQUxVYXhlY2VoanNKNXZTY0Z5Mml0ZkxZ?=
 =?utf-8?B?UFZVQ3MxbEV0Z3QrTC9mazZYc0JRSzRzak9TbVJKM0hQOGRlNmVmYUgzUEpC?=
 =?utf-8?B?U3k3c1VGaUZOaW1WM2M5TlZSY09XN0ljUWxOdHhHRXAzT2Y4V1MwRUVNMkRl?=
 =?utf-8?B?M2tRK3VSczh5WUNPdndtd3JlRExzRFVacmU3TUVKUzFRMXV5NWNPeFpUWnZF?=
 =?utf-8?B?YjliNUFsd01wa1RNaFc2eTlkUzZtaGh6OWZ4ZDU3VEhwUGNDS0g5TElIRzFq?=
 =?utf-8?Q?yFiXvqOhD8wpzCKk4J5Iows14fcgyMnSbkVc37e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef4b084-c852-4ecc-bcf8-08d979d40425
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:09:36.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAx1+ea9poGruR9lNhm4vE1rBOg6r1Mj2Yfn/FA1mLiiyAPJ25zZ8Q4SLK9HqIYSbQstfyX7L/+ldmJArH/9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 10.09.2021 22:13, Daniel P. Smith wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -200,23 +200,20 @@ config XENOPROF
>  
>  	  If unsure, say Y.
>  
> -config XSM
> -	bool "Xen Security Modules support"
> +config XSM_CONFIGURABLE
> +	bool "Configure Xen Security Modules"
>  	default ARM
> -	---help---
> -	  Enables the security framework known as Xen Security Modules which
> -	  allows administrators fine-grained control over a Xen domain and
> -	  its capabilities by defining permissible interactions between domains,
> -	  the hypervisor itself, and related resources such as memory and
> -	  devices.
> +	help
> +	  Allows for configuring the Xen Security Modules (XSM) policy or policies
> +	  modules that will be availble and which will be the default.
>  
>  	  If unsure, say N.
>  
>  config XSM_FLASK
> -	def_bool y
> -	prompt "FLux Advanced Security Kernel support"
> -	depends on XSM
> -	---help---
> +	bool "FLux Advanced Security Kernel support"
> +	depends on XSM_CONFIGURABLE
> +	select XSM_EVTCHN_LABELING
> +	help
>  	  Enables FLASK (FLux Advanced Security Kernel) as the access control
>  	  mechanism used by the XSM framework.  This provides a mandatory access
>  	  control framework by which security enforcement, isolation, and

I continue to think that the default here and ...

> @@ -253,10 +250,10 @@ config XSM_FLASK_POLICY
>  	  If unsure, say Y.
>  
>  config XSM_SILO
> -	def_bool y
> -	prompt "SILO support"
> -	depends on XSM
> -	---help---
> +	bool "SILO support"
> +	default y if ARM
> +	depends on XSM_CONFIGURABLE
> +	help
>  	  Enables SILO as the access control mechanism used by the XSM framework.
>  	  This is not the default module, add boot parameter xsm=silo to choose
>  	  it. This will deny any unmediated communication channels (grant tables

... here should not change. If it changes, the change needs justifying
in the description.

> @@ -282,15 +279,15 @@ endchoice
>  config LATE_HWDOM
>  	bool "Dedicated hardware domain"
>  	default n
> -	depends on XSM && X86
> -	---help---
> +	depends on XSM_FLASK && X86
> +	help
>  	  Allows the creation of a dedicated hardware domain distinct from
>  	  domain 0 that manages devices without needing access to other
>  	  privileged functionality such as the ability to manage domains.
>  	  This requires that the actual domain 0 be a stub domain that
>  	  constructs the actual hardware domain instead of initializing the
>  	  hardware itself.  Because the hardware domain needs access to
> -	  hypercalls not available to unprivileged guests, an XSM policy
> +	  hypercalls not available to unprivileged guests, an XSM Flask policy
>  	  is required to properly define the privilege of these domains.

I also continue to think that this would better be a separate change.
Or if not, the seemingly unrelated change needs mentioning in the
description (to make clear it's not a stray change).

Jan


