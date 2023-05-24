Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBE70EF18
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 09:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538776.838999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ieV-00031K-Pc; Wed, 24 May 2023 07:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538776.838999; Wed, 24 May 2023 07:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ieV-0002yh-Mg; Wed, 24 May 2023 07:11:19 +0000
Received: by outflank-mailman (input) for mailman id 538776;
 Wed, 24 May 2023 07:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1ieT-0002yb-UT
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 07:11:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c233c62-fa02-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 09:11:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9653.eurprd04.prod.outlook.com (2603:10a6:20b:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 07:11:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 07:11:13 +0000
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
X-Inumbo-ID: 2c233c62-fa02-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpX8awG+JPCMcscF2udFAkS1ysSp0zzb9OhFoYk0fxeXyh1ABrF9ubbjwxJ/JdaYJ8y1Bj2JhWk+DAcaDH9jC1L8lPc6+gEGwjWSL1ZgGaiMUIVyhgjjW2nbAV3F7xSBdkhK2C2Fr6MdmRCJfpwYCM6pta4eFNz6hZXRE9w+I0fefjdVSMehpeTSOKc0Wa9v37U/mCU/8GaQqIfsif9NZ9bMBa8NEbn3Q0fBlzuFDDHdiY3IvDCYyY+1DrvBycD9Eh+q8nZ2ozvGlVAI69hfI4kNiuziivNWC26orcvN33QS6bsAFklHh/JBBhFIxaOLn1qTcSFW+h6V49mfPzVT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3iEGQwJ6NHRvRWoDuRx/P3UeRJpn+HOmoBB6dyYtQg=;
 b=TtWepDnCW5MIYpIYkIrboQViPc6QPcCIG7umVEhhC69UhKXQ+F6JRn7s/Sg3yNRIsfOoCvaz0Fe2KBZfNX1MaGGv/ztajH2x4c9PthM6zD6+7wKz+baPK4gIA8jeEvo1Ge+dKKuz13UdXmBNn1TbqWiT93OKXZjKM2onET+9uRkhpyssLWuuUXEIh6t2uhcWbpWRehZdY4knvV/ZPpG00++LY69Tn3uysMU7N80qsSPrjBwnShELyLbRVeXXmUBYkWWOugYAg9270Mr8rms9fYbDPbkwpqlFdoBcYyIyb1A+GvtqmGF0xxnD2si7OvXFIOqhIjbAU/kn0gmh4hR1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3iEGQwJ6NHRvRWoDuRx/P3UeRJpn+HOmoBB6dyYtQg=;
 b=YsiyOsNFN4CypD1ixL68Teu0aMPYa4cQEr6k99XFpb0fcS+PnLDGA/czUDSEsHdIukZIVWHtX4inVUy7nc5p/TdxhwDlnEBXQf7+yBQwYoyoouN36FjmqrwMhc3u8jSO/5Xjh/vUgqNsJDoAHH9AxgwiQM0qHG0VKT1BBtQ9Zf5uw4KOJi6stT1yEaZibbz7rf/GrsxysfLiYRBFke7ZaMjJoTkqEVObHDJ8wUulWrF2CaIiOuGq4JJZPC1gCgqocs6ryrnxGzpOtyz4JD1T2kzSsYPoe+2DfU+HYJK2SNWFqEJrBFlCwirsESUttYJIgtQXqqi64nLEgcIMXRUz5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c75368db-6444-6910-487c-8ac9477a6785@suse.com>
Date: Wed, 24 May 2023 09:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 04/15] build: hide policy.bin commands
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9f46c0-3e6b-4372-e92d-08db5c260ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZMpPoCd4cKxyT+p9/3cFJygaM04O4L4fpeI18NU17FKfx7yCVHNfO5A5wCUfv9bJbPzOCNy54kiFZl6NABmDnyyVJpf3NWlriGc9p0+7UMxA+Ehf0cy3H/IHGwgTW6xa71oh0Vr2yUILh0b708DfPWi+XXh1Su/rV7JzaNxsReX6PvWgsOV+et7ujEJkw0utyKbRwGt+1lMRrZkngwO0P9igx4O1EfL4NkFHuUWWnJn//tGiOsaXfJ6E7diwQwMbJayHyILFKZS62ZNJMkAGw60iMyyllBJS2RFRvmjxb0mwHVLU2/24Dgl+fZqjwv5W0ebVRG9ATVl1fw3U/OznphOuvH9LZIqEoSo01Tz6czOlwJ3mW6yxivnOfZ704EgBX0Ps1Z18HCOalaP8o0O8ODfSAgT44wcHKe6HSeO/81r6apXF/FDvJGMvgMzKN+QzZacvw/87qsxM1wldjPLp1iqXtCYKVayAZJbIJJHH58N/Czj0Tr46O2nr4M7LhAwENSTHhoGisWjxhl/lsjO5E1DN9JyqQz989pezV6pDuzw38WpLclbNW1fbnDnkpBGZ8q20g/+XBVv+mK+/8wbKlrxYOdzqnTA3eXqqUNZ3TOfNCzjdn/QXrVh6CAgyZ2P47AOmw1m5X1gweXGHXNWxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(2906002)(31696002)(53546011)(186003)(86362001)(2616005)(38100700002)(5660300002)(8676002)(8936002)(316002)(36756003)(41300700001)(26005)(66946007)(6486002)(6506007)(6512007)(66476007)(66556008)(478600001)(4326008)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWgvYWdWemU1M29qbENSOTl5akYvMm5HQm9paEY2cW91Q1FYQ25BTWFHaWdH?=
 =?utf-8?B?N1pSTUpXZnNWRUpmZ3lBaEZKMXRQWWVHUjFqVURFQ0pIMmoyUmRTUzhQNXZ4?=
 =?utf-8?B?Qkk3VEZVUGRISDU0c2tNVm5LSjdNcU9xNU1jYUtuMW44SDJPR2RMS0tWNEo5?=
 =?utf-8?B?enZEUkdibTcvQ1hZay8yOUl0NytnQ09Sckd3MElOVUxJMXZiT3NUTm5PM1E0?=
 =?utf-8?B?ZThmdnF1Y2pJbXBXSzlDSElOc3F3eW55MTlkaDQzdHZpQ2wvSkYwSko2d1ha?=
 =?utf-8?B?bHJQdVZMSWtPNFBDSWlXYnk2OXlOemJMRGRYcWZCUW9FbkdPcDhCN2pldUNu?=
 =?utf-8?B?cUxodis5bmRUcmwxaWtGSmIzdlQ5UExsTXNvd1ZYQVJtSVQyNG9LK3Q5NWRo?=
 =?utf-8?B?K2dSbGdhT1VrYWRxTk8xMHFCOEh2MU9JeEFGYnY2OEQ5Mmw5cXZWN0w3b1pV?=
 =?utf-8?B?NXhhK2drTUp2WHVWR0hEMlZ6bUNHdit1SzYrS2tNMUJqVldtK2ZMNTV6dUJQ?=
 =?utf-8?B?cHZkUU91c2hnaW5wZmllVGVJbjRQb1RVK21BWXJiMkhsUTFLdHVCOXkyUlo5?=
 =?utf-8?B?akpGZjJHZ3VhY2lWbGpVT3ZLWnpJNHFsU2o4R2xWekhMSDU3SzNtMDg0akdk?=
 =?utf-8?B?QTZEU29EcmswcjJyM1c1NGMwVHRJTmlocytUSTl1eWFtQ21ZUjVaQUNid3dN?=
 =?utf-8?B?TXZOUVNpaGszMUtGM0ViM0Zsa2c2ZEg2U0lmWUlSa3psNUhDNmd3d3ZKY2hs?=
 =?utf-8?B?bHRsV2VJdWl2SkFRZ3doL2ZXMzVSY0JGQ3FJWmtGMXZiRkZDaWpBWU8wR01Y?=
 =?utf-8?B?UU5tMXd5RUhSNWNwUFNWbzdYckpBZ3Z1dGJxKzdNckhtSEZUdnozZlBhR1NT?=
 =?utf-8?B?azQ5Z0hVZnB2YzB4RURuRjE0QnlYNlFlamhFV0NDc0h5QWgzbEhFR1B1SVMr?=
 =?utf-8?B?M2pTaTBVaWJTVFFNNVgyS3F4ejI2R29rT05SSXE4c2V5UnZnMXRZSG94dFJT?=
 =?utf-8?B?Nk1UWVducDI4VmpFMEI4V3FvVWhQQmFodndudGNGUkc4dHNjL25rMGVDaFFj?=
 =?utf-8?B?eDdQWTFhd0ZNWi94cER6S1NRcWllU0thTG5NczNiZUh1TW5sQ01JUkEzbFdr?=
 =?utf-8?B?QVY1Z2VxWlNucGxzVjFuOHdiYkRZczFjUXQ4TDVHNUtwSDJ6Ni8xTWdtSVV1?=
 =?utf-8?B?SnNreFJvTUxjYlNSTlZSVkg4MTFPZHZYYmVTSHJsTTZ3Q1FoMCtDSWV5SjZm?=
 =?utf-8?B?YTFSZG5jRzNDSzIzRnErYXozNFBMdDJzeXNXazB2WkdaUTliWHdyZ2tneHNh?=
 =?utf-8?B?aVlDWThodEowazFoZ0VabjlFaEcreFcxRUpOUUZldDJrYjhyNUxHQ1lxd1NW?=
 =?utf-8?B?L2ZLTThCUkNFMGpBa044WmpvbFhTNWYvMlBEditSdktqaWR4V2U2S1Y2RlZ1?=
 =?utf-8?B?T05uTUhIazZWYWJDdGtVeVFtYW5OQzlUMHNnMnNKNmxRWVVoaEtEVVZVRDd0?=
 =?utf-8?B?L2lUclRPcEVaa3RaTVJwYlZoUmpFVDRDUWlENmlKL3dnNDZsZ2owQnRPa2Np?=
 =?utf-8?B?NVhwdnM3THFmY2dtaTRrYis2SkNHMk44TGFWT1lLV3ovTDFLbzI4b3BseXl5?=
 =?utf-8?B?OUFSRjVBVXM0cytTUHZsRGN5TC9ERGVlVHZPVUtVVXBYUGJiS3NIcVdYSjhw?=
 =?utf-8?B?SE5zM0tzZlozQU95bERGcXowSkIrSytGTWpUald1VnBSV1pGVXA3dEhFVEZW?=
 =?utf-8?B?OTljeVdvT25sQ1pzNDNmWXNxeUx6YnphWFF5cWFOemNzdHVHeDhWcUpsbWF6?=
 =?utf-8?B?djdqNmIvREp1Njk2MmdQd0ZtVE40ZEh0UXN2Qy9xb2hYaEF0U0JkU3VZMTdP?=
 =?utf-8?B?aDN0dWhVam5XOTdYMUFRTmtpbTBTcEdFbTVoMmJYMS9TY2dCWEloSlVoek1I?=
 =?utf-8?B?cVhvTWx6akJ5TDE4RGdBM2FyVDkwYzhZZkdyZmR6ZjQyUEdtQTQ4T1B0VG01?=
 =?utf-8?B?QzhuQkFlZ29DZlhXaXFjL1N0UkpNZ240VmpxQm5GbjljSTQvdENFb3gzWjdU?=
 =?utf-8?B?U2JpUDVKRWVUekVUb3h6U1dpcE9vZWdVdmdBcE9rKzR1bjh5N1VjWUtjTzFa?=
 =?utf-8?Q?u2U9uhlSJ621p9SEQNzwmt33u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9f46c0-3e6b-4372-e92d-08db5c260ef6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:11:13.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nfmq0GFnkuK+CGC/SSHFg7SR5aa9is2p8tk0w6voy6Z/Xpu4yWT+tIfZLe7seZgACJgG3HBL02BDu9iWcS4wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9653

On 23.05.2023 18:38, Anthony PERARD wrote:
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -48,10 +48,15 @@ targets += flask-policy.S
>  FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
>  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>  
> +policy_chk = \
> +    $(Q)if ! cmp -s $(POLICY_SRC) $@; then \
> +        $(kecho) '  UPD     $@'; \
> +        cp $(POLICY_SRC) $@; \

Wouldn't this better use move-if-changed? Which, if "UPD ..." output is
desired, would then need overriding from what Config.mk supplies?

In any event, much like move-if-changed itself - please avoid underscores
in names when dashes are fine to use.

> +    fi
>  $(obj)/policy.bin: FORCE

Nit: Blank line above here please.

Jan

> -	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
> +	$(Q)$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common \
>  	        -C $(XEN_ROOT)/tools/flask/policy \
>  	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
> -	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
> +	$(call policy_chk)
>  
>  clean-files := policy.* $(POLICY_SRC)


