Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC056428C15
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205833.361240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtXK-0003KV-TD; Mon, 11 Oct 2021 11:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205833.361240; Mon, 11 Oct 2021 11:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtXK-0003Ib-QA; Mon, 11 Oct 2021 11:32:06 +0000
Received: by outflank-mailman (input) for mailman id 205833;
 Mon, 11 Oct 2021 11:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZtXJ-0003IQ-Cs
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:32:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db5606b0-2a86-11ec-80d4-12813bfff9fa;
 Mon, 11 Oct 2021 11:32:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-8pczssfdMXqlPZG0LOB65w-2;
 Mon, 11 Oct 2021 13:32:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 11:32:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:32:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 11:32:00 +0000
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
X-Inumbo-ID: db5606b0-2a86-11ec-80d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633951923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GYeOwNmNHEfe5DbtsDFiY6vhm/wM8AgtfL2GyOpfctc=;
	b=SllMLqqZpjpB2iDeuW3OgN++yIKbZTaYTKd+PAYdA8wBJbNSwgw3b6OVsmnmg1Oy0MPq5A
	pveEwS9FK/ZKdXeUa3YxJKNkQjPzcYx8uHT04b5bc2kcNMyiQUCvSEcTcgeT9oXMaZccqL
	IsoluhYLObHfM22RHv890by1l5FWcw8=
X-MC-Unique: 8pczssfdMXqlPZG0LOB65w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJRvp7YCwLOhXhzTFeHES65wcLJAMVZcGtKzNeFzpFYkhU3w9n/nAVMUjRPVvEnAvOCHFHiboH9Cdbky42SCLiSER5y3Lx+J+HLUzuHOXmf1wDg3xJyTk0wsLSELBGjUGcFeU40AJZQTygsR/5lglLp030pu2mBNsDdNA05MCqMD49OZJVPW4mKXJcipcwVSGDUnNCqoTnbnBWsIvmZnChtazIYX29aRrIYem7DHQiJHXCfr5oJDrsQKMHJW3Hj+IByiNoP3IaWJ2Bt69wLvkx4IzNOOs4U+sBRqp8QGY6wzh1VWVA93Xb8ZrEGqCoRmc2RTIJX9tpUTencEI7hX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYeOwNmNHEfe5DbtsDFiY6vhm/wM8AgtfL2GyOpfctc=;
 b=kXfzn8BrEOC19OQAlDEPbrZ3JucW8ptdFlsQ73DOrhq0/e5ci3vJlIQjNrRPhmO8GTllLWnIp2uIYsc7FaWqGJXPjiDD8y3w+LOOOZINuUY87P+NARmoo4VZeuonFUIVKQaCtB4+4hzMDlxkFLubX3AXZHAkNwU2Yzwcf3j+W4PwSqu0YsvbLhxrwYz7QkN/Ikmb5CiWHg9TrJ7rTbw8Gn5EQktT5vU1HTrmxsZ4eIrgrsn5DkXSLs0YuYS+g/EwJi9UsxEwFE36s8ru6zlwANlrA2QZNu/kSO8n01pVpVtjmDPQHz1+K1ctX2u3ku43xR6rB4OsJK26FFBcUoRYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 21/51] build: set ALL_OBJS to main Makefile; move
 prelink.o to main Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-22-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <304c1ddc-7bbc-e942-4c5a-8395a750b13d@suse.com>
Date: Mon, 11 Oct 2021 13:31:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-22-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0201.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7c73327-6417-4d5e-5325-08d98caabdfc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41909259B66E98EF1037FE0EB3B59@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lXUyHUnUA8IBLLr9UHy/078qOuremVh2yUZ8lsql9xKIMDDhiHGNk0sNxTH7EVxYkNvQrSmkFv6pPPltcUcKd+HvDg7vFYgvr1F99OJYoRX4sovXOB3u6+pzyHFBhstN91iyjAm4g/P17l2oySeLpVPDB7BteH+43yLJPBF9zB3vQYqPSZGfQ7MKsElEiWCm/Nn3POvRx3bpIn+bN2JQTtQOQ2dwyZcC6kMsQ20LDEH5S/MFc3oeJ+WlFH3rs0D/ngGb6hB2mH3XloR6dkapQozRDeUbH56e/VTHYw8qoCr6OlBuADUrZvYCMbZoPt1JwScrWAFVx6nZd9mLfTkqbqXsPR30b1RsRYMk7mqgO9RxznfnPwaDtl543bb/K2EUe2Z2crmVny1X3YDeyyVLhI9dDwXF7hIUm3n8SVgjVUSwW1Ww/yNb7YObA9WlsYJR12dF0TC/FkMIwmibMUh0vW0ej1RXH4UfBQyOCVhc9pKX0YhEQxImjYEect4G2gRvv8FsM3uy6eA1sOTkt3R8MkqS1JMuM6ygaPCdP7VGmmYjH7WeB2DVtwlAAC56/I4hAWr3CNJOd6msS9Q+64afLjKQxlwvs2bUDRk1KFBBX9DsozAakBjfdzVIabdSkQqV2yWWPam8/Bnd1e40PQmQuczrV/nZPsxZOuG8GmZA7Nhwmo2QlTWFvVjc5mt2yu46J/Q7mvXTyVZRoEXccEYJxmqyeC4wKoh0VLaCJwT0Z850lP7tvDWHhQLy0jS61MmU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(8936002)(31696002)(54906003)(956004)(66946007)(86362001)(6486002)(2616005)(7416002)(4326008)(83380400001)(66556008)(66476007)(316002)(508600001)(5660300002)(36756003)(31686004)(16576012)(38100700002)(8676002)(26005)(186003)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWJ5MnBsdVlUYTNwdUVpZDZhNnRhNEJ4dUs1WDh3b0xZdU5wNjhFVUdVZU85?=
 =?utf-8?B?MlpqTTBxdW9EVTRtOFAyckRUSFhIYW1MdkUzYkxWdW5WWDlrc01aNTlZMnpP?=
 =?utf-8?B?M1lpcGVvUmljU0Z3YnZBckYrUFpxWHJOVXVEWDZGeUI2NTdTWXhnbkdYWklQ?=
 =?utf-8?B?Y0U1WkVESVBhcFJaOElicUUxSnFIZ20wZWw0RXJjNFM4cmFjWVFBSUxwSXpD?=
 =?utf-8?B?bzREcG9LY1AyU0hzRkpvTmUwYWRudm9EV3FySDRGUkxGVlNUc3owcG5DamNE?=
 =?utf-8?B?R3JsQS9GejhkME0vUm1zYjNPcEVjckpVanRnd3ZGamJoTmV6NmpiRm1TbWtk?=
 =?utf-8?B?TTRtTDZNdkdqVnpwcERxN3JsUnJUMitUVDExOHBFVFZxbWVxZnpCcm16SzJs?=
 =?utf-8?B?aWdRUjBiYkJLaXAzUEZOMk5NdFhIQ3M2bVlsdnBpbktmSUVHQ25uRmF6MkNF?=
 =?utf-8?B?NkFTZUdLQW1ubHBmbFMrVzY2VDFRd1dWS0Q1VFJBcDRRTllBRTBsK0xsNy9Q?=
 =?utf-8?B?QnFtL005WFRoamFKeDFqVG1iaElYbWZKd1EvZ1ZJUGtNWnpvSUp6Z2w5WnpL?=
 =?utf-8?B?UGRIcllxQkdDc1ZRdkN3V0JBcGFZVDdpam11R0hKam9LN3hiM01LaVdPekxo?=
 =?utf-8?B?cWF4ZGNrT1ZaVTV2bk5nRmVtaG1PQWFzYy9rdTdrVXlTcHJ1Q2F0aktZZC9E?=
 =?utf-8?B?T21XbDhYQlN1NHVLYmhmU0JGdVFrVW1SQ1AyWTBvcTYrL242VW05VlRsMmh3?=
 =?utf-8?B?OHAyQWE3Umh0S2xjemh2dk1XSHFOL0t5YnIvek8zM1dieGpuWFU2NVNGSkI0?=
 =?utf-8?B?WlhlSUdaK3VpR1cwakhRdkhGTkNyUHBFTXBTdyt1QnVUeGRuRGNuNmpJUVN4?=
 =?utf-8?B?UVJQVE16MW8zRlIyM3c2bUYwYWFrN1dnV0xWNnhVbC9EdjhrcjYwZjZxY3Fp?=
 =?utf-8?B?S245eHVJRmlkdkhLYUZJNDZrd3pQK2xlUStQQjc4WUY5WVcvRmJlN0tHMkw5?=
 =?utf-8?B?Y2tKZXV4c29rYzIvZTloejNwZ3hvb21JSytUdHpKNkRGSUdtcEFtV2JQQWFD?=
 =?utf-8?B?NEJ0dmJDMEljd01ZQmhqbkdiTTBFSFowQjZ3d0JZV3lJYzZIZzE5ckpxaGdJ?=
 =?utf-8?B?ZEJLZitSbFEyb0grSzJUdUFodXdoRkt2ZTlQWm5vYnI4MmozRkJpTTFJSTEw?=
 =?utf-8?B?ZTQ1Vm11NVM4V0hmL1VBNEVJQSsycHM2ZldjZkxLZXU5aHNiMDNoYzEzRXNE?=
 =?utf-8?B?RDI3a0xkMktOZzJxaEFvSTNEZHRLU2RKWG44aytBeVBidVVaZ05IcDE2WHBz?=
 =?utf-8?B?UnNQdUgySVI5eG1MUXdiWXVRQ2x1ZVAxVDhHQzFpbDIyb09wZnFHMXRXdXV6?=
 =?utf-8?B?NXpNeHlGVjBocHplNDd5d0FIUmNNNEsxTE1LbmYrUzROR0dCRlF0TFNRdkhK?=
 =?utf-8?B?aTEzRFM0YmVJWGNoQ0h4MTh5L2NFdVdBSjZTNmZLOUNYbVB0MkpYQU5GcVd0?=
 =?utf-8?B?bkZvVXV3UjZHTXRsOXRhUzZ2UGdHMjJUb2lRaGl6STBJejk5c1djUFROVTZ5?=
 =?utf-8?B?ZUJOeldLeElDSE5JZ3d5NGg2TVhiY2pNcmtIQTgyMzNuWFpjSHhJRmlOVUJ3?=
 =?utf-8?B?amUwaVhEN2pFUmRoWEpPaE0vT1VsREg4bXh3MDgvQnYxaU1WWnorR3J2Q0Fo?=
 =?utf-8?B?NlhiYThMU3FQSytZNXF0Rk5oWGpMN05qRU1zbnBUT3NkazZqVmdFMUNTZGty?=
 =?utf-8?Q?ROGNDtSrSLzc7OPR6sqKkXDuYqUZV+Jc4F/DrZI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c73327-6417-4d5e-5325-08d98caabdfc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:32:01.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07a0jjic8U3cooxlfDaQ8z6SCOY8mFP79ZZlxlFGGM1ibZXrGEkzeM9JFsyF6sD05TL3iEGlRUlZqqtSOU+COw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 24.08.2021 12:50, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -271,8 +271,21 @@ CFLAGS += -flto
>  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>  endif
>  
> +# Note that link order matters!
> +ALL_OBJS-y                := common/built_in.o
> +ALL_OBJS-y                += drivers/built_in.o
> +ALL_OBJS-y                += lib/built_in.o
> +ALL_OBJS-y                += xsm/built_in.o
> +ALL_OBJS-y                += arch/$(TARGET_ARCH)/built_in.o
> +ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
> +
> +ALL_LIBS-y                := lib/lib.a
> +
>  include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
>  
> +export ALL_OBJS := $(ALL_OBJS-y)
> +export ALL_LIBS := $(ALL_LIBS-y)
> +
>  # define new variables to avoid the ones defined in Config.mk
>  export XEN_CFLAGS := $(CFLAGS)
>  export XEN_AFLAGS := $(AFLAGS)
> @@ -393,7 +406,7 @@ $(TARGET): FORCE
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>  	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
> +	$(MAKE) -f $(BASEDIR)/Rules.mk $@

This merely results in what was previously invoked from here now getting
invoked from the very bottom of build.mk. I'm afraid I don't see why this
is a useful change to make.

> --- a/xen/build.mk
> +++ b/xen/build.mk
> @@ -56,3 +56,27 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
>  	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
>  	  echo ""; \
>  	  echo "#endif") <$< >$@
> +
> +# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
> +# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
> +# build head.o
> +arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
> +arch/arm/$(TARGET_SUBARCH)/head.o: ;

This previously lived in an Arm-specific file. Moving this here in the
given, still Arm-specific form is imo a no-go when done alongside all
the other good changes you're making. Is there a reason this can't go
into xen/arch/arm/arch.mk?

Jan


