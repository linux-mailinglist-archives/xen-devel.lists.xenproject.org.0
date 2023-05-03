Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D06F564E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529091.823089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9qu-0000o5-QU; Wed, 03 May 2023 10:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529091.823089; Wed, 03 May 2023 10:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9qu-0000lv-Ng; Wed, 03 May 2023 10:36:52 +0000
Received: by outflank-mailman (input) for mailman id 529091;
 Wed, 03 May 2023 10:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu9qt-0000lp-67
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:36:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6919bb39-e99e-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 12:36:50 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VE1PR04MB7263.eurprd04.prod.outlook.com (2603:10a6:800:1af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 10:36:47 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 10:36:47 +0000
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
X-Inumbo-ID: 6919bb39-e99e-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl5p12lIMh/AmyDfA2AnyabYzMVMLVngMTmR1PluzZT51IO9gh0e6tOaxQtHpu/Ln5FeQfIhupw8UUUAcd2ocXPFpcJKICd3/OpJkOxKgw+EajqslZ6B85EjLbfKDi0qxhlESdy9ZNvh379AwDw3Ev1+QGHc5jXx6F0tkRdWQM0brl5Xsyi4mE5w8hPOeGn0lY9IIf3OQBnH+2mWobljYEIxYGn8XSLIMEHEzvyBQZ0HS4x2r7lLWdnf04idUO1CdnjNtFnh/nUmZNHqpXi2uRuG3yUhTCwaS5rHI3yEKehlLrNWWp0FQKsHEDl2r0OexICJMqjvKWk3TzIKpwGBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hFX+X1sh+3XqbisDaZVyq/2N10sj1zXa+mjFkM1wa4=;
 b=NaFrp9Qe6qajzY7JOnA6XMU0Upv5Zz32xhKZF3vJz8TH+OeSzQdeqtR/Yrex3RQUFtC05hKMVJ81We3FVhmGiCu3dPI7sOrGoDK0VNRX9eU3N3KfevRGu+37BIScd8tZEEPjddiMxGu52o/2iO0yo5U28LuL0ynk18wmsiGIiaAwBBxse9NfS3frwxQUAaA9IMX/A+0BTJ8FAzVK8gOvQ5JADp2BQfH8BcT30cFMirnHpcx9lXXPkbG4AC6jCG9h6lxqgpnFSQoH1CEzszb53++vaB6FwIQ4Zp/XT2OWKkjzi7IfhKqMsTE+KmAU7DJt7Or+sN+x/c3LGZNFtYXDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hFX+X1sh+3XqbisDaZVyq/2N10sj1zXa+mjFkM1wa4=;
 b=S2HRuKQBn7OmsBGIvXdBWLLJTgFyyLR/ACxMX/HTm/kZ1Y7Staj0qAfm4SRZDomjZjKYvjv5+hFtGfb1Jto3Umf6fBy5z2Rg6a6fwTsMFxbgSfCadF/jqFEVKdfR1EsEWlBP3NonGqOmNifykpqmsRVJarF1jpbQ9iqqDW1CtFGJ+gXEue8XSBjeMUUz760YF5Wmj4lyzAt74AR+nqHVrIgVzuq7++Zv7UsqFu6lha0cP6apvgqBYiECmZR2xQKuWLBVO4gh1HYUhOxL6RD5k4dQlUNYavZ5uX0rWgLWrh4xsPckhLnP5P0Y6biVD1I4aqiadckTonvBtf57H3B9Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fef669f5-2b28-c47b-9b57-60c4eb99017e@suse.com>
Date: Wed, 3 May 2023 12:36:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Ping: [PATCH RFC] build: respect top-level .config also for
 out-of-tree hypervisor builds
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
In-Reply-To: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VE1PR04MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 513571ee-53ae-47a7-4526-08db4bc24bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RWPi+bzsMpR58Ct8rKlP8TTg54OyOsiLk0oy03whHf0GKjkO26IGXf+/YY2gsWwh3peYgNL3yRIi2Q7PrEstBl+YwCezL3PKuGujwe7W0MyTEMHfb+aKkr0IOuSeW8/zPLEt1ZuhopBzlPGzIuH8UzTTzPvFjh65jcl3WObOjfK8zMC2CGkHj4vyN4xOjwCRmwRD4ZxvFPwvYsnpfgaXpm7XJ8BSZ3kQeoX3Qk6WAm3hL2HjiXnsDB9vQnpEdrCHfO6Yhg4h1xe4/nmPS45TUQTDg9fa3ekvcAg/MRxUXAiClkTybgRTsa9MUVhO7RM2X8oBeu1L0ouzqpnqoLfZM6WtxSEXRbyoiNhDKgCeh2RrEwZjiK1HD689C6dEOFzXlXNf/oaUgzHKxg+cb9FYshuR6wnyqAqqv+0Lgg1yC3fvCBexCbUPys9Z1WKuzb715eDfN5pu5KR6GPbHww5jLVqAMZFIHi/vF3mtkZRKwe1oYUO7gWwkeCV26vlZ4iFa4BKJSmGbmcZHPLfBy4ZrsdM90IJYgOJpGY9XVGvghna5e/pjrj/vpsGZCVZLMCQLgWYSrXNM/9I8XV9RDB2GX87f/28u5ZH5iDxAesFogs/18NuZ+DxsEwzSKCBZRKfd/BJKR56Tp5QiGzgeBqHAWyuGg8/cWqx892ABWAXNepG7Ze1ZZIAzI50a6GRmeWflH3JB3kKFIpyKzoSt3uSioGhWdqva0LaEdh+8lzmt6w8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39850400004)(451199021)(186003)(31686004)(2906002)(38100700002)(2616005)(54906003)(53546011)(6506007)(26005)(6512007)(66476007)(66556008)(66946007)(478600001)(5660300002)(8936002)(8676002)(41300700001)(36756003)(86362001)(6486002)(31696002)(316002)(4326008)(6916009)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpaTVpTTWx1NW1DNUN1aE1mcS96bTNzY2Q5L2ZVOTc1TDlOdXpUTTJCQjI2?=
 =?utf-8?B?cm45c2dCcWdUTkJpMVdsS21ZcWU0ZHptcHUvbS9PNHNmUlVMSnNMOEs1N3R3?=
 =?utf-8?B?eWZtNFd6bUNMaEVWd2RNWUl2OTVYUVpHWHZzcUxOd0xRblI0SmxRN2xlbnhL?=
 =?utf-8?B?RFR1MllRcWx0amlaTE93ZXQrMElFUSt2OHUxT3ErcDFYWGFEV0M0VUlwNW5W?=
 =?utf-8?B?cUc4YU1SK2VkcXFJelNyM21LZGdCRjNEdXpzN2MvSlRQc1lNZU9zYXVoUU91?=
 =?utf-8?B?bXUyM3BqSDJFRmw4MmowUUp6ZFZZdFUrZU5kd1Ixbk8zN1AxQWViUi9NOUxB?=
 =?utf-8?B?a3cxdHdVbHhjVXRZVmxBOHMwYTVqTk9PV3pLaGpoMm9MRmR1cDltRnFyNG9H?=
 =?utf-8?B?VlVYbzNMNHZjT0JIMDVFRWlRSjJhUmNPZ1c3U2NDMWQvUTlGR1I3dFdDbFFn?=
 =?utf-8?B?SUZZWEh4ZFZTS3dGMDhmT3NLS3d1bUJxQ0JJYzNRZzZQd3Nsd2pYTURRNDU2?=
 =?utf-8?B?bUF0MGFZbytyQ1VELzJXOXl1ZnhYdEsyUnp1ZmZBRVltNkpGdlM2TGdBaHp3?=
 =?utf-8?B?VHBONkI1QlNld3M1WXNmaXNic1BCZU40OGwzL05jZitHK0VqVStxVnlWUVFr?=
 =?utf-8?B?bCtZVWE3YmpsemZqRXB3eUIrcEdjb3FvNWNiNlMwTkkwWVA0SStvYVFIVzhT?=
 =?utf-8?B?bWEvMGF1VTNWRUhOVElyR2dKUjA4L0lYWWtFdWxmbXp4YnBCbWRielYyd1E5?=
 =?utf-8?B?TmU2cElwa0VmdGxhdjhydnlzYWxSTExKdjRXZzdQNXZLL3REMmtsWDlSRy8y?=
 =?utf-8?B?THozTjFKcSt0VXRIcXEvSUtSaHVPeEJXMmx0T0poRThSRklMbENFTm5zbnZX?=
 =?utf-8?B?ZDFreXRsRVozRnV0ekJ6bWhNWmxZMFFjcHNNeCtIZzgreXZDWVY5VU9yeTF4?=
 =?utf-8?B?TjJWZ3Q4ZTVZL0VydDQ5elI1Zm5LYkpWc3cxMnpIWE12RUJnUUhSQXlkT2c2?=
 =?utf-8?B?em1JQVU0cjhzM0hQUXZJM3RmRFM5KzFnenkrRGFuRnh6SER5TXgra2E5YktW?=
 =?utf-8?B?RUQ5SnpISUtTODJPM2RDVWRiQ05melhQcFBPZmQ4aTZ5TU5OcEVlZWdoQVVx?=
 =?utf-8?B?OGg2U0NpRkltSVlmMzArMy9mVkVCL0ltMjZsVlJ2Y1VEUUVjclVJajJVU0Rw?=
 =?utf-8?B?WDFXUEhGRnZyNy9oUnNiWHRVWlBHOEZEYVRZS3J3WVlFTWZuRnFjRkFQL09L?=
 =?utf-8?B?d0hGbVNhUDlqdWtmcXh1azhSYW16WDBLUjM0b1BBSUhjNFpyVzZNM2dFa3da?=
 =?utf-8?B?VlFWUE1hYWRzN21aZTlMMXE0NStvcWdGZ1k4aEFQeDl6Y2FWcFp2VkpsWG1p?=
 =?utf-8?B?dTNEQ1FueXRYREEvMnNSWGxxeDhrMk5IRVdWb3VwajFZME5jNkE3YlV1VCt6?=
 =?utf-8?B?U1ZQQ29GdmJOMTB0MGZBeExMR04xMDIzTGxrakc5bXJ1TFdHYW03eUg5d09k?=
 =?utf-8?B?czRBRjBRRHRpNENiQ054di9VWmRnQ09paHhMZ3poMHMyV3JkbTd1SytDY3pU?=
 =?utf-8?B?Nm9GMkhEazFva2FabmMzSmZmbTBoUkl2QlZwMGptNDVtY2lTV1QwMHpyL3hE?=
 =?utf-8?B?QkN0S3Roa1puTGQ1clFhOEMzSk1tZzB1TU15eVJhdm9zTENLcWlYSklMc0Zw?=
 =?utf-8?B?T2JXdmxheURrS2ZUcU91cVh4NFVWRk92dTdoMFkraVVXdVREaTQvazFOUGgz?=
 =?utf-8?B?dXhvU2EwVlRjaVR2QnVRYndjK1pIOTJWR2RZQnAvajdTZ1d3cmhLWVJkMS9B?=
 =?utf-8?B?eEl0TFNBdjlGRGMxTGNac1NneDMwWjgzQUQwMURnQk5jTWEyelFaRTNldHJP?=
 =?utf-8?B?SDNoU3Z4NFBDWnQ3ZWpVN0puM3N0NGlkQjhFSFNyV3krQTRZWTNsT1Z4TXlJ?=
 =?utf-8?B?MFp2TnlGUHBHM2tnY282S2Evd2ZlMEJDNGRVNUlwWWZEeHppQldlbFUwYjha?=
 =?utf-8?B?K2R0WC8wL2FLWnlQc2t3VitRMzNxRTZPQSs0UGhtYms4cjl1cHpGL3VIMW93?=
 =?utf-8?B?dm1oakh5b1R1dHc3S0xEa2hIaEtBNWRVaEVPampaOWc3K1JkcjU5VDNxS1pm?=
 =?utf-8?Q?3Wb22EHlKeyJHwGrXd9qdPvOC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513571ee-53ae-47a7-4526-08db4bc24bb9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 10:36:47.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6eZUv9EpTvJhEpWvi3jxyEup6Ia7GgquzBLg9bQlon20oKn9v4aUOupgHDw0AJZzG9w8SsQW9LrQo8gQwapDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263

On 15.03.2023 15:58, Jan Beulich wrote:
> With in-tree builds Config.mk includes a .config file (if present) from
> the top-level directory. Similar functionality is wanted with out-of-
> tree builds. Yet the concept of "top-level directory" becomes fuzzy in
> that case, because there is not really a requirement to have identical
> top-level directory structure in the output tree; in fact there's no
> need for anything top-level-ish there. Look for such a .config, but only
> if the tree layout matches (read: if the directory we're building in is
> named "xen").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: The directory name based heuristic of course isn't nice. But I
>      couldn't think of anything better. Suggestions?
> 
> RFC: There also being a .config in the top-level source dir would be a
>      little problematic: It would be included _after_ the one in the
>      object tree. Yet if such a scenario is to be expected/supported at
>      all, it makes more sense the other way around.

Anyone? I'm certainly okay for my approach to be rejected, but I'd like
to see out-of-tree builds to reach functional parity with in-tree ones.

Jan

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -236,8 +236,17 @@ endif
>  
>  include scripts/Kbuild.include
>  
> -# Don't break if the build process wasn't called from the top level
> -# we need XEN_TARGET_ARCH to generate the proper config
> +# Don't break if the build process wasn't called from the top level.  We need
> +# XEN_TARGET_ARCH to generate the proper config.  If building outside of the
> +# source tree also check whether we need to include a "top-level" .config:
> +# Config.mk, using $(XEN_ROOT)/.config, would look only in the source tree.
> +ifeq ($(building_out_of_srctree),1)
> +# Try to avoid including a random unrelated .config: Assume our parent dir
> +# is a "top-level" one only when the objtree is .../xen.
> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
> +-include ../.config
> +endif
> +endif
>  include $(XEN_ROOT)/Config.mk
>  
>  # Set ARCH/SUBARCH appropriately.
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -17,6 +17,13 @@ __build:
>  
>  -include $(objtree)/include/config/auto.conf
>  
> +# See commentary around the similar contruct in Makefile.
> +ifneq ($(abs_objtree),$(abs_srctree))
> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
> +../.config: ;
> +-include ../.config
> +endif
> +endif
>  include $(XEN_ROOT)/Config.mk
>  include $(srctree)/scripts/Kbuild.include
>  
> 


