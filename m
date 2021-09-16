Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E725040DE23
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188579.337786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtOr-0003y8-MC; Thu, 16 Sep 2021 15:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188579.337786; Thu, 16 Sep 2021 15:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQtOr-0003wL-Iz; Thu, 16 Sep 2021 15:34:09 +0000
Received: by outflank-mailman (input) for mailman id 188579;
 Thu, 16 Sep 2021 15:34:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQtOq-0003wF-Mg
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:34:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f74405e-1f04-4757-a459-ccc6a51b427f;
 Thu, 16 Sep 2021 15:34:07 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-JjXlT15sMv2b-unXNYDlyw-1; Thu, 16 Sep 2021 17:34:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 16 Sep
 2021 15:34:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:34:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:34:03 +0000
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
X-Inumbo-ID: 5f74405e-1f04-4757-a459-ccc6a51b427f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631806446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAU95lKgjP591NS7TknXuAXLyWzCj94rCuuPDnhasOM=;
	b=aKLP21yRZENbaVqL35IUGu/hfM201kRJ34JtUAtBDtySxFmK07Skpp31OhMXvOBvIyUAVk
	qRIreo4IFCpuaJgUanwiFgIW5uvOoSOGpSA4uTvT6TPKj9a6Vpz8S1L7Jrh9LwAL/RlUUX
	SIZ3IWTSQaVAsSOTLo5PlDFx2ovCPAQ=
X-MC-Unique: JjXlT15sMv2b-unXNYDlyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTe26F61co4YGXM2ZSzPvOPbW9gT5UPj1rAU7PcO9PxHLnCRVQ1aZkQGqjWHvRIhzzcqH2UPDgS4abQc5Dnp/yJwhCmIQChRJBAIu5cwdF7Ehv0GSA/HJo+i/aEyjI9oaYpaP4V893ZeBluwdjvIg/mgI7tubouvHczWhcR2GsqEoXzP3S6ErqIYezEEPzp6IlQqTJNJHnJ3aj4eRFYoSD1vfUIGCEIVpXLgbnZmd0db4ulq5r0WT6cWGreKOY9xb+Kz8Mle7BdWDiw1W5N9wOnKBLJfYi0wkrebqJU/kaXuAIS8M2bG1fv5I5HinP7fYvQ7/4XYeYvUBmU3veI62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QAU95lKgjP591NS7TknXuAXLyWzCj94rCuuPDnhasOM=;
 b=VjpfrvsZd9eyyfhHbf4UHgg1d1IPIqIwQET14uG/As0RgmY7NZqaKktZBFCPg+WcMOxGzlGcCk3LAIwUWNiQnn+tSl4dywstX8VkwmkJ3eI0kxUK3BWDHxpzvXv+0Y5OMln+zM8FH53ChHdq6Abp7ASW0jGDJeH9Y2uusRDgDAISgiIYPZibFO+u0E8EWFEa7mA3sgiG21oP+64HWOQCO3iTmwgjG+dPGVAa99aKvyLFIeAQuV5JVn2bk80k+c5oD1uFf2O34ECOyhzh7yBO7VmPkCjKqpNhblabRgX5FXtNh/pjHab1Zi+otFtNX8WvjaCg2EA3ZNzPwdysqxxSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v3] xen: rework `checkpolicy` detection when using
 "randconfig"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210908111727.440265-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb40484f-fbfb-a206-fa98-0e927f5398fa@suse.com>
Date: Thu, 16 Sep 2021 17:34:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210908111727.440265-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd46e001-b027-45c7-f5ae-08d979276a0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70399208AAAD76C7587574D5B3DC9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/d+qxQ4/i39IzBwFAYbO8Y/6iXcLn5vzbBzjMuy31hksrkPFyvWzlaDOyPckQ6MF2xsvpx9seVcRVjqlS8vOpTJ6kWvYOWjOju+jXqvprHU31e/vzoynpQTsNtJTOmreHl+5WdYfqLrBZ373wSIL+9fAJsta0fG0kzzb4Sr5xaCfmC/XYk2P5CpCU/652M31DdwVeW+eec0EH+LCOVVPypURZ9AvPcJBKQXnoRsHKZgNQE1vFPzCeUPGAkAiuQeDobTqXP7tsx6IZsarJHddNL9y2l9RryfiB1UOOsOXHKcxyizOS3eHDzrmn+7uYTUDjshhPZiKYzflQ07tlanwN5cOPQrZZU7FQ/+uoiRagENx7VHG3u5njazCijLo9YJqOf5SM1zNdIhc2IW1jRZIag2AFi1augEVdJ/wdR6PRBBBRhLfQi7SNPUS//1kyMDGQQz8ztFyGbvWmRNGCaznpPl617VihMISZVpGks+n0K1ceO6ZeNglb7gi6AyGLWKYS2GAuqfh9Dbdzvql/7coAJENmOWeW0kiiKsIMGZg/CE5PnoIiCOakpRZS8j5gHclnT+DZEy3UTK8W2d9/+Y3TT45g1cEEIpVy4GD0Ss4oj6sDmhmFhfqh5XfopYEg7uteGL1DSRKcRK0u6mMIOOHPwyv1fAjVHh4C/dIMZHXedqUZs11MP2CPGxWuXtsrBcIfDbnC2/ud/8/GzHwqU26KTqxmCBtVCRlldvYERpjSq2y5rEGTS/1q/tvwXwMfg4H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(316002)(38100700002)(26005)(66556008)(66476007)(6916009)(2906002)(478600001)(8936002)(66946007)(31696002)(83380400001)(54906003)(2616005)(8676002)(6486002)(36756003)(5660300002)(186003)(86362001)(53546011)(4326008)(16576012)(31686004)(956004)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amM0bUh0MUxMUHIwU0MySS81TWN5MTVNVzh0cU1Ocm55NkhrODBnVTRDNmcr?=
 =?utf-8?B?ZmZqSWJMUld5akN5Ym10THFTQVkrSVFMSmJqRzVxMkVBRjZoOG1qc1JidDZP?=
 =?utf-8?B?ZVkwdWE2OGVBOXdwZU5DQTIrYlVJcnczUkcvUVRPeHN6eWlMT09zRjRWVHlE?=
 =?utf-8?B?Z043bzFQOEZoWmprTWswZU5zbUlmUjlFNXc3alNHejBhMC9IYTRGekQvcjJQ?=
 =?utf-8?B?ZTcyZnFJeGdWWFNqeis1akkzNnpWQUVWRmhDQjNrMXZwdE9GT1dXRG9HNUl3?=
 =?utf-8?B?bnJadjlXUm5IQkZDS0N5MHE3VFZoNHRPbjhNdVRJM3ZnaVVhNTVXOWs2L0dM?=
 =?utf-8?B?UTlXYkJUV0JjZXN5N05XWisweU1uWkxJMTc1WGxIZ0hpNW1wUmdHY1FFT0xI?=
 =?utf-8?B?RTRyUDk4RXlubmJQaG9FdEpGd0x6NzFNUFIyTzI5MnU4dTlZTXR1OUd5eW1W?=
 =?utf-8?B?KzFaZ3dQWTNJQmFLemJDTFJwNGJmdVp4TzIvS2xZK0FkK1pOaTROV1Azeno2?=
 =?utf-8?B?SlZheTU4T2dBQUJrQmJzaFozc1ZnenM4bkgweEs5MVhTcUZhZWhTbEhxZnd5?=
 =?utf-8?B?MVRNa2YvaWw5bDFIOVE1dDNkelJWRzlGVWZ1Q3BUOWNyckZBR28xVlR6VGZu?=
 =?utf-8?B?MUxNYWZ2S1hVV2F0Sy9pSWJUSUh0emU5c2RpY3hOVDh3d2hQbEFtTVVIMWR1?=
 =?utf-8?B?bnpKTlRvQXVzK1NXck1BNXJUY1JlUFE3VTFKSE5CNG5pZkxWUUIvM2gwOXp5?=
 =?utf-8?B?OUYvUThyS01temNpa1NKc3o3anJjeVBOa0k2eEtJbDBnV0kzWEtzeGplcFhh?=
 =?utf-8?B?QzlSTStrMEU5Z3c4aXdRU0tJQlcyNXJEQnliZ3RRWG5DTUpRUjZ1QTBkeHdB?=
 =?utf-8?B?QXVpUXhJbnpiK3ZlOVdCYnJlbFY5WGZFRGg3bTlDSjZLSUMxOXF6MFRPT2Fw?=
 =?utf-8?B?cGM4a1VtbVhmQ1pyWGNsNm9xYU5jbDlqREtmNnNsZjl1MXRlY00rQzRmUVlm?=
 =?utf-8?B?V1huUlhUbjhwV0NEa3lLNm1mV1o0T2EydUpNMS83bXFJeFVWTTlsbW5JNWtX?=
 =?utf-8?B?Q3JRQVZOY0xmN0hWQ0diRWxlQjhtZk5tMjFXeERVMnFIZXNycmppTDBGREpC?=
 =?utf-8?B?OUxVR1JpUEZoRHZ5QkhaNENrMjhkYzA2K1U4dFRvdG5yckNLWWFCTWI4dmNm?=
 =?utf-8?B?bjFIcUdWYVZnL2pvQnJ2bVJGUlUySGxieVhtcTl2c2hsTUtBTFVTMkRzUzFQ?=
 =?utf-8?B?TVJNL3BhK3lrQVFrMXVYelM3a2FvUVRTTlBWWGdxNzl0MkxWbHlXWlpoNmFz?=
 =?utf-8?B?NjNMQzR2THh1SEsrSCtHMG5laEVrQmtUQkFneFRpZTFWWXNSQm5OWVpxUFlu?=
 =?utf-8?B?Vy82QkpmY2dEeVdpZm8yK2ZuS0VUUTFhdk5oMmN2cE9yTWlQU1dUVVltUjhp?=
 =?utf-8?B?QUFROXkwNHVuVmNXcTNFK3BMYSs1RkRiWXNlWEJwYnVkblozR29jeklZS2tR?=
 =?utf-8?B?K0xTN2VqVkZGejBMZHRzb2RtQmZUc2U0czBkOVp0TG1sd2pMRzF0N2N1ekNm?=
 =?utf-8?B?c2pONFpmNjIyRTllRktWYW1CT3RIQ1lJc3A1TDd0ZkdOQTlSTE1rdzhiRTk2?=
 =?utf-8?B?OGlUVkNoQm5NdWJlTGlzeklKN2Rwa0s4cUhiMllHN0hpODhOK1NDdXBOK0pu?=
 =?utf-8?B?YXp6Z3dqaDhhUXRaSVFOVDlBcGFaNGxSTDNsb3VSUzJzc0xoY2ZOWEhVUzJk?=
 =?utf-8?Q?9jcQQ6FwJZFoD3a/L3dk+iLU3Fs+il/GBDAyIaK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd46e001-b027-45c7-f5ae-08d979276a0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:34:04.0584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jIOJQolnMW5Bqjd+Cnlbz4gxIKrzBtfZVXCRrH5x4FSF8c2yiSH23+0wSdi2mojW4j/U0Bg6nfLBsVjlZ/WaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 08.09.2021 13:17, Anthony PERARD wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=y
>  build_id_linker := --build-id=sha1
>  endif
>  
> -ifndef XEN_HAS_CHECKPOLICY
> -    CHECKPOLICY ?= checkpolicy
> -    XEN_HAS_CHECKPOLICY := $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xen && echo y || echo n)
> -    export XEN_HAS_CHECKPOLICY
> -endif

Is there a particular reason to go from XEN_HAS_CHECKPOLICY to ...

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?= $(shell hostname)
>  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
>  export PYTHON		?= $(PYTHON_INTERPRETER)
>  
> +export CHECKPOLICY	?= checkpolicy
> +
>  export BASEDIR := $(CURDIR)
>  export XEN_ROOT := $(BASEDIR)/..
>  
> @@ -178,6 +180,8 @@ CFLAGS += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>  
> +export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)

... HAS_CHECKPOLICY? As soon as things get put in the environment,
I'm always suspecting possible name collisions ...

> @@ -189,14 +193,24 @@ ifeq ($(config-build),y)
>  # *config targets only - make sure prerequisites are updated, and descend
>  # in tools/kconfig to make the *config target
>  
> +# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
> +# This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
> +filechk_kconfig_allconfig = \
> +    $(if $(findstring n,$(HAS_CHECKPOLICY)),echo 'CONFIG_XSM_FLASK_POLICY=n';) \
> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG), :)

Nit: It would be nice if you were consistent with the blanks after
commas in $(if ...). Personally I'm also considering $(if ...)s the
more difficult to follow the longer they are. Hence for the 2nd one
I wonder whether

    $(if $(KCONFIG_ALLCONFIG),cat,:) $(KCONFIG_ALLCONFIG)

wouldn't be easier to read.

> +
> +

Nit: Please avoid double blank lines.

> +.allconfig.tmp: FORCE
> +	set -e; { $(call filechk_kconfig_allconfig); } > $@

Is there a particular reason for the .tmp suffix?

Jan


