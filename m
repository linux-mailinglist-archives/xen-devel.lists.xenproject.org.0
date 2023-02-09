Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67069025C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 09:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492238.761686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2XI-0001DQ-F8; Thu, 09 Feb 2023 08:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492238.761686; Thu, 09 Feb 2023 08:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2XI-0001BK-BN; Thu, 09 Feb 2023 08:44:08 +0000
Received: by outflank-mailman (input) for mailman id 492238;
 Thu, 09 Feb 2023 08:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ2XH-0001BC-3w
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 08:44:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e86de637-a855-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 09:44:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7338.eurprd04.prod.outlook.com (2603:10a6:102:80::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 9 Feb
 2023 08:44:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 08:44:02 +0000
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
X-Inumbo-ID: e86de637-a855-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diVfFRjyW4jQxEkPjDup+bwZyucJ519j7ZLqe/bkRFoOsZ3Nd1oE4rsNesM5vRolrFQzsrwRSdFSbRTjAUkASJJwxMmLO2uuSqLknhmdaw6ao7UAtCemHQvHDUYVBz2pVCluaWoYJl6cuFAM2uRPQfBsdkXbvNilADrjIABCsvYy4jc6JbhN4Bq3MOnf4en23R/CLaIazDyMZxOzczIzkz7Qj9l1RHb146scPPZmFA4OXE3ve8yygkahRh2oP2VDZNgPiwBBk6YuNAo+L8oY2QcSGKfB+9HCXD+qov5BABWOGaX2SmhUrnfGOLQAWXc76MrefhLaQOnTuYweQbTuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSUux6/54go8UABCZxIEZeLRzksdaTnN8Sc75jvVj1A=;
 b=V7RJs5ghOz5TCKho7iwp+Lc71plYMGjrteEXHVWJ6qgGcwq0iIwnYkv+OAezSttdblhEyDxQM2C0YhvqEW1UhCzsyNNdkS7BqO3/uS8ToS+9I6ZFnNEvs8J+FuzLFw0KDEVSbu+A2CXxph6ukmZtk2OfFdtb5DgBp8d4zc5jZ6FFJqAwFF4iLztjYVvdLDXHGpnl8X+8EIvU0E6Tk76iv4jVb202YLB0jzsOo9CU/QKy5PAgq3tsSGVqU2Wz/OIaDsAh39yxU+Bmvrad6aemoN+dvbrxA6sUGRWxHIoBmTBIeF6dTvMQhpoOriQ0c+rEd0IBz4LH3/KMOgaZbzO9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSUux6/54go8UABCZxIEZeLRzksdaTnN8Sc75jvVj1A=;
 b=uBraj4cP9kK2MaDiHUFJp1GkX/XYKiDjh/cyZjuP3feQ1tN6MFX1nIZKhlHDJKtIYczve83FEgDNGcg6XtrvreeQlfYZeZImagiwf+1OZ9H1/FgAaKL8QEzqbWbKn6gut04Nb5yHI9/2qNl06DzTqWAtygPbYAvuf3TMgHbM9cRRs5lpF8n9S/VHO1IBJnL4wn9tNbNC1qBIngcwz6xZV26HDiV7jguMFCd3RkmUKm57w94oBGYlX8VvdiXVItZBZYl7M3/HE3khNrmAdm/E4MGU3e4dXcY4T2So3EhC5fd562r1czZ/aM9vdF1izT6cQBRj5auFzOXqQQLx4BtrUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d281c88-83a0-ee86-18b3-6c9d856a0971@suse.com>
Date: Thu, 9 Feb 2023 09:44:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] build: Make FILE symbol paths consistent
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230208172416.725028-1-ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230208172416.725028-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0126931b-0f2d-4c6d-0e4a-08db0a79cb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xjDhGUGgAAAs543AEk/v/jz0SjsvEKyk6f+xEurXJ+4PRnPfLSc4f+Lmsr/7bAK5qUUggwyl5tXqXQR7za6nkt2UZWuNDcC6CCZFOd601ZaaFq4dB/NaojZua3cItgfow+rKM+B0OUNW6ogaVZjCsGA4WrnefUrt4eT/eb02iiLKkwH4H9MxaF58J2X9WsJik4/hoOohUX+2bONr66/lBlP8WaPeSizOrgabVikzTGVpIy40vsP2cvPl8mqnCBU2eTxkKUIHsUUlpFvLoQMqz28vMsYfpL9Jr/y4SP1E/O3s4gKBYHRzJTuFlRvjyXJxiSARTJJKELKZgwOX5sjK3g6YKNaGZZVuunOLAAjfeCTrL88z0KcPwT0ty119z0OdXqu9vYwkEkdQ267m/qN7VDHJjp76MVag5thBcON2lCJpyH2X60oKhWe8lf0K7Cf91etueYKe6JWwX4u/cCyr/it88geVSVbqCHuknxH4N69eh80IVLX9vilsoMFBPe7BQvrzpL8I+UqQzE86dZIZfmLSNaK5rdktb025snOlFQmyDD82FSa9D+Nk780KHcZ35v6MpCF4kOS0MtuPosPgje27ZkcrptrIBi9Y77kL5zKe1yIIlFCEwgoCv3S39dcQ45Ob35VgDvqf96RE6RgH9rc9w50/aU+OUxbAicAeVFg+m1pzVG18+qIZ36S2fv/LdBx4Vk7W4nCim/RtlDj176hLZos+tdyX5eBDZk/a1Ws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199018)(2906002)(53546011)(36756003)(2616005)(38100700002)(66556008)(110136005)(66476007)(66946007)(54906003)(316002)(5660300002)(8676002)(41300700001)(4326008)(8936002)(186003)(26005)(6512007)(6506007)(6486002)(31696002)(478600001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXplWjBrWVNNRGIvUGIySGFMbjM5UFdaeEp3UDBOd2xBVHd3Q1QxZ0JIODJr?=
 =?utf-8?B?bFBOdjVKK1hSVGJqTFdsaG1QNEJRUi9pRytUYXpRaE1jK1hoeUV2UUhYN2dh?=
 =?utf-8?B?UG9zdExRQnRoVC9yOS9YSEkyeGRHQ1V3MVp0bDlvcW1oNVlNZFhTWlV2N1Zi?=
 =?utf-8?B?S1ZJZkZiZ2VSSHJPekRnQmFzeC9TdU56NVd6ZHhIRVdScnVOVjRyZUFHSlFB?=
 =?utf-8?B?WTRoR1hGR0Jjb1RSa3NzalkrRit1cXZRM0QweEJpV043NzNlN25KYWd0NTFz?=
 =?utf-8?B?b2I0NUl5cWRTWXowZXFlZEsvRlAyVnliMzdjS2MzVGdSSStKWEJzYUhhRXJ4?=
 =?utf-8?B?YVV4ZW91U2pPZVhiSlh2c1NNNUlqbktiSDFrNGU0TmpwdG52dGc2eXJONGtw?=
 =?utf-8?B?Zkx4YjZnNHpBQ2ZDTUxqdFBBdmV2c3JNUE5mTjhFcDRlMDdDSW1GT0cxNklT?=
 =?utf-8?B?MlkxSXBIUE5pVEdlVnRjK3pENnQ4ZU42MHVRM0JRNUFmMlk4NWtmdndHR01N?=
 =?utf-8?B?YVA2VDRyNTlPbmVJUms2YVo4S3Y3THFrejRUeEJOQjlVLzBhellwdXBEOUM2?=
 =?utf-8?B?WDltcDNmeEYvYi9lTXVQeDBVN1k0Wml0YjdaK2hQMVpNZS8yT3p3VU5UQll1?=
 =?utf-8?B?Zm40NTlLWG83R1hYZFUwbDFIRjZNNEpURmpkMk4zTm95UTAwVDkxS2tyNXdT?=
 =?utf-8?B?b2JoNGlIYlpCeEh0ZzBoR2xwNjM0ZjNsQmtUM0w5djFkQXlIOEZiYUpvakU2?=
 =?utf-8?B?bjV3eTQ0ZEF3cHk1c1NqYjNhMEJ5UW12Q1FtanRqV0tKQ1doWC9JbjQvelVE?=
 =?utf-8?B?bmpCNURBSytOdXBYY3ZwQjBmKzd6MDJ2dEZDeGFQSnhnbXplLzZwSzVMMkFI?=
 =?utf-8?B?SUdMamNIZWd5azJaY3E0NXBpZWQ5SUNseDlyd0hYM2htUW5tZk5OdnEzQmN0?=
 =?utf-8?B?RTZSMnBNUXZ6YUtGMFU1azNjOFBVYmpmRzQzNVNGaklybkVNNU1IRFFTSzA2?=
 =?utf-8?B?MVNrUzhMNU53ek14eVFrZm5JOWVaakM5ekFiT2M4VkJSVlowQkFIUUhLQ2o5?=
 =?utf-8?B?QzlYd1VWNmJxS1Vud3NqWHdVODl4VStSTTFsZUpoYTk4cGYxTWtOazljc2lW?=
 =?utf-8?B?ZlFEamtvRThBZmJueXI5WllrSlhOcFI2czJITGdHL2hOeVFqVlluRlR3Z3BU?=
 =?utf-8?B?VWZESEZ0OWNYVzhSV3VXR2lzanBDY2JBUVNqbWZmTXc3MldSZjcxU2d5d0VR?=
 =?utf-8?B?b2RMNWdKVk5wODZsNU40cVdrQkhzZGFIQTNJMGFGVElReWlWQ3U3eE1JQXBF?=
 =?utf-8?B?M0ZWc3JQQVk2TytpSHAzclMzQmtFaVplQ2ZhNkpnNlZRM0pRMXFZMC9UWDJi?=
 =?utf-8?B?QXdZK3UxdTRhVUNwclUxWjVoN2VBcTduY25GSkdiTXNJVUlsSVc0c0M1WkpS?=
 =?utf-8?B?OXBocjZLQi82cVE1R25VUUMzTUZZTEs1T2dOWVpFalJCblNiVTlGcjlsK3VE?=
 =?utf-8?B?Wm1hL0NUNm5rWHZuVUV1elBHbFFpVlk5WGw3cnA5aDBGajNQSnFyS0lTcWxs?=
 =?utf-8?B?eE5SdGpYNjNGWk40akIyNXRxNGFTMnpPcExyR1JvR1JCa3dGYUFidHR2SEYr?=
 =?utf-8?B?NWVYSUtQRm1rY3JkeE14VU4vbCtYOHU0Z1V4OEpTdGoyeWhvN1VQcEh3ajRX?=
 =?utf-8?B?dXZJUkhGbk93cjAxNHkyeEkxS0p2ZTNnRC9zeGkrQTlmcTlZelJrVWlISDgv?=
 =?utf-8?B?SUg0TWZWM1NadDdwc1BPZ3JpMk04MjVZNGkvOTZyWDhmR3BiY0RhajlpazJG?=
 =?utf-8?B?eW9kd2tIaklOYTNaRlNsdkVaY0RUcTlrcmx2VEFVK0Frd3JzTkZLckd5QWpm?=
 =?utf-8?B?aStyWUlHMDRzWVh4aGYyQm1EOUMyT0pvWm10Q0cvTk4zSyt2WmhVYkowNVNl?=
 =?utf-8?B?ZFhqL3NSM2xpaTBjVWVBOURvZ1YzS0twVHY3QlA1eFhOTVRpdGdybEtoZlpi?=
 =?utf-8?B?YSt1TTBQamN5S3JnM1lGUFZPa2RCWmttbm9xYjAzaFl2NElwckVPWkpSeFFm?=
 =?utf-8?B?RWJaZzZwN1VMc25iV3VHNFV0QWo5WWJKN25STUhod1hGMjNDNVM1RWYzeHNu?=
 =?utf-8?Q?a9oFDzSoqMQCsP0cxjOpuRmEb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0126931b-0f2d-4c6d-0e4a-08db0a79cb8b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:44:02.7140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoeS1E3UtxKv+OHWaXWm6ekK5wkoRihGnG6GKe9zazrYB8rTiLcBJ/2JqiHZpQkTH0agRpj7lt0+DbIFM6fXAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7338

On 08.02.2023 18:24, Ross Lagerwall wrote:
> The FILE symbols in out-of-tree builds may be either a relative path to
> the object dir or an absolute path depending on how the build is
> invoked. Fix the paths for C files so that they are consistent with
> in-tree builds - the path is relative to the "xen" directory (e.g.
> common/irq.c).
> 
> This fixes livepatch builds when the original Xen build was out-of-tree
> since livepatch-build always does in-tree builds.

Sounds all plausible, except that I was under the impression that as of
035ab75d8e37 ("build: fix enforce unique symbols for recent clang version")
things were consistent already. To clarify - Anthony, was this aspect
simply not considered at the time? What would help here is a Fixes: tag,
both for the purpose of review and for the purpose of deciding whether to
backport. It might be that 7a3bcd2babcc ("build: build everything from the
root dir, use obj=$subdir") is to blame, but I'm not really sure.

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -228,8 +228,9 @@ quiet_cmd_cc_o_c = CC      $@
>  ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
>      cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
>      ifneq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,600,y),yy)

You're altering only logic for pre-6.0.0 Clang, aiui. This is something
that's absolutely necessary to state the latest in the description, but
perhaps already in the subject. Among other things that's also an aspect
when it comes to considering whether to backport.

> +        rel_path = $(patsubst $(abs_srctree)/%,%,$(call realpath,$(1)))

Personally I'm against use of underscores when dashes would do, and using
a dash here would also be consistent with e.g. ...

>          cmd_objcopy_fix_sym = \
> -	    $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@ && rm -f $(dot-target).tmp
> +           $(OBJCOPY) --redefine-sym $(<F)=$(call rel_path,$<) $(dot-target).tmp $@ && rm -f $(dot-target).tmp
>      else
>          cmd_objcopy_fix_sym = mv -f $(dot-target).tmp $@
>      endif

... the several visible uses of $(dot-target) here.

Jan

