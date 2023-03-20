Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8346C0CCC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 10:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511785.791030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBVt-0001Hx-6I; Mon, 20 Mar 2023 09:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511785.791030; Mon, 20 Mar 2023 09:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBVt-0001GG-3V; Mon, 20 Mar 2023 09:09:09 +0000
Received: by outflank-mailman (input) for mailman id 511785;
 Mon, 20 Mar 2023 09:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peBVr-0001GA-Kl
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 09:09:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddec5ba7-c6fe-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 10:09:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7862.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 09:09:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 09:09:01 +0000
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
X-Inumbo-ID: ddec5ba7-c6fe-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyYYgYIJdq/GIHDLDpwr2UuKdUolS44vHLC9bmrvzqsCm3Xt+sMC22iLoUZ5fIWY/KmZ1sw7hSRQu8LTMKM6853fW8yrq7xkveBxoAIstKffqOs2GyVjJQDOnVjjV4MOTgIUhCD2DSmsaPEtNbJ4B5k10j3H0OMBzbQuSbl5HEL+Um1ZMfjAC+hZraKAUTa4GY//c/+TdtM83mOoW8IJJzMCTK9QPXzy+oytBI46MnUOsPVx3nsoK/+Xw1A88iBOcTa0efVgbQBGtQqLMiZvVb1LbvyXyzdFzkgngl24NghlLdbIHEP/bdQNSwIEGKir7ZxJePRI+di0IRlpnbkadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtG/Al8PtyevE7aRtQosDGS8RpzC6T4w+nb5aluY80s=;
 b=B98LmoL+CK9LtW3ie2vTMzh5o2vrcDuJ+UH9YE7AGzQg23xR3b3ZiMrG4qn6rmZW/eCNeswg8tQ4WXXUEF0VYs+GZ614p86h5lOQQFCQ4uB6xQzoslKTrXEcMVme1AMacXV6JNmljYbnoU14LNQHw417D5/YNEl5V+FFLF7HLixZsoMouQrOqaXFCpMzz44+CQ5sf/1nalRR465OBluqQKvLMhsczuFE7AzZceWTbD5fercgTfTWZ0Bu0mD40b4KBf3CZcCa2R5YkmFyFJwJPslQ0ybDVcyPOXVShIZJm452ZFvX+beASh7A5zjfzte/PRx/6tXFSsLYyQcyEkar+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtG/Al8PtyevE7aRtQosDGS8RpzC6T4w+nb5aluY80s=;
 b=RLhTLBA7yMeehj01K/cUhxnengxwprvyjID2D3lqg/zCzeDEghoJk3qn8s8pkKNVIXF+CJ5/yM4gX3cxVv+/YOpbcnLQRcl0XWwHJrzUs5g5CYVWYpmSvln/iLwE9IZs4IhdA185Sle6x7s3WMsDfjX82cGgXtZFKzNWUeHIFDU9PEj7e3MaPMjF0L50ZBLnq1DKc97psDUtvm61N84AOJ6SWNt1I3HNbFxWGA9oZFI+oJ9OjTWwNzm4D5w2a4jJ/fZqNi8yY89ae6alF3FcLS8N59pWX9RdZPoHhKfVTwDyUcYHkdKgouZWOYt9aqrbfADAQqefrSU4eB/UGgR3Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <204dbe14-c1e9-8d56-4923-4a867c3d2c4b@suse.com>
Date: Mon, 20 Mar 2023 10:09:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/10] xen/arm: add SVE vector length field to the
 domain
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230317131949.4031014-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 499cc575-d72b-4c85-e0a6-08db2922befb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fMxDiVMsM9/fiiPyN8BjuH8IKRrvqIry7vQFZUGto9nSDsbgVW+j/RuHgryGgWmc5sZPJVMWIHSjgu5AAGoLZAM2i8owHPKHzYx2qEGF5bYDrYvNciqrG18q6iUuRYeIllhJa5eVbl3NfwhboRppOhYW6WQZOLpyG4O3wLmHMr10MsO7gmZCKnG9mhFMAfu/n8VnPELo4L+4ZDx55R/Ezs5IkILhNnhWxu1lbR2tvm+nHbeYjO92Rby5QoYNf73O+LBCubddOp2bUr79u2o4w45HfKBoy0fSq5RJ1K35587AKCYpUGOkxKfBIdUeOJbNgp/Zy7L413cG9u4FDfPGGjkMpm1k86MAoldo6bLCvd3JKe2sWwf2zpZ2y4hoyNEMbxtRzixJXjb40vGbiKc6vSrFzxQ0SOxsDnl9zrtZaC/GY3CeCtWkAI5UhJ1V9X1WVlQyYlLu0+stjw80QF17oz22UxiK9CZ7k+OkYdFhsr+qznz0yFlMCCQrd0OkFywgIQsWrjbbxReKdVc3Z1fq+EvuHGeO/Aw4l82GDABxnePBfTE72WebqGEDgCO8rQnRl+eGtArhSb2WN2dshgoOtb9U6dsfw9zj8SwFCaEWF/jByQUkADVS5MRcaxyrwGm+zQCSVWHiAPYonNIb1F0Ror/c2tCUYCBrj8w0pwk/34RZdPdSqJop+6Owtxp4LGAg17HYFwpmzSfcan4xlO190uX267khBgPwYS80MTWCEtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199018)(31686004)(2616005)(6486002)(186003)(6512007)(6506007)(53546011)(26005)(38100700002)(31696002)(478600001)(2906002)(86362001)(83380400001)(8676002)(316002)(54906003)(8936002)(66476007)(4326008)(6916009)(5660300002)(7416002)(41300700001)(66556008)(36756003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDhTYUpZQ216QnRaWEM0YzV1dW8xdEk0c3ZlOWFaaXNKOUtZZTF6OXZsdk5Z?=
 =?utf-8?B?ZDV0U0FGVHFhWjUwaURMeTVHdGI0Rko1OVZsdi80Ulc5SVZxMVNNVUZyeUhS?=
 =?utf-8?B?RHRmSk1PM2xHQ3RwTUlrNnRFYzRwM1RNcyt0bDhOSmQwVFhXNnFnZ2hrWi9r?=
 =?utf-8?B?OGQ4N0pTSXJyRmlkNHpyR1RjekxNbFpyUjA2VlBIR0ZYRm5tR1Brby9hbW92?=
 =?utf-8?B?TXJjcDJqeHB5bmZxL01YRHRHNTYraFFQSkhoMWhQb2xzMzdhQTBWVWNJaWR1?=
 =?utf-8?B?M001SVovaU1kVytjRnZNSTc3bk0yeTJPbXc4bUVKWG9rNlFyQmdzSGhBeTJp?=
 =?utf-8?B?aEk3NUlydyt1eG92WHppWk9LOXI2WnhLSDZ4THE4KzRGc282NmIzVFVLVjUx?=
 =?utf-8?B?VXlkQkFkZDZaZlAzTU5jZEpVazlHWFVhMkdKazdhRHlvQ2VsazJJMGxhMzlV?=
 =?utf-8?B?L3dQTEdqTmdQMkZ2R3FEd2ViZCtlNFBvRmxjMzZCRjRnVEdXeHhCcjF5bUh4?=
 =?utf-8?B?b1N2NzBUVDU4R0hOeHV2aGg2bkYrdkdvbW1RQnZETURWaHJZa1FrUUdjRHdp?=
 =?utf-8?B?VUFGT2VGcFNpbm4wRDUxWEV5Q1p1aUJmVC9OMWxYWmwvdFZlVVNhdSttbTEw?=
 =?utf-8?B?THU3aVVSeE1MVTFTMDJxRWpBVGRDN0JLTUI0aGExMnpYcWJwQmpaNTU1THI0?=
 =?utf-8?B?MGRURXRPbW1IbGNvREEweEl2VVN0dlJVYjkzRlRRbXZKTkorUlJ3Qm5sc3lk?=
 =?utf-8?B?YkJwVklWWm5DTXdNOTk0UmNVNll5VnJRemJvMW0reGkyMytUL04zYmdybFkx?=
 =?utf-8?B?akRsVDNUdzR2TnhzdEVjQTRpdUg5WGZqTko2Nld6K1p0RzZuREg5WWxzRndh?=
 =?utf-8?B?aGM4Z20ydHBlWllBc3FMci9mdlJHN0JtVkRVNkdnSXdsL3BucTk0KzEzMEp6?=
 =?utf-8?B?bDFVVG5LVE1vTm4yak9ON2VBNUhmZlkweGQyK05GWDNTdWU4U0VJaEJjbzgw?=
 =?utf-8?B?N01LOE5tek1wRmtnNmtlMnBuZnl5d2ZMaEhzMXBEQldodlROOFprWHc0Zlhh?=
 =?utf-8?B?ZzBSM2g4ZXg1dEk2aFRmbmlHNHJKZTc5Q3M2S21xVVloaVpJZUNGZWtSQ1Jr?=
 =?utf-8?B?VXlBclZrQVdJVUcrcFRBcXdHUWhBK01PYmIwV1lydjg2aG1kQ1NKa3pwNFEw?=
 =?utf-8?B?U0NwNHN2R0k5aUJJT0hMSy9PYWVQZlpXbEVWdEZoNVNDTkVwOG1SUzc3TVNY?=
 =?utf-8?B?blBNRTRRbVY3eEU1cEo2SDBLQ0MrV2gwTUR2S0tpL2t5T0RiVzFscnhzWnB5?=
 =?utf-8?B?anQvU2hQUVZIN2NZUll6cE9sM1RDZ2thVHIxcXZlaXFmZmFNQ0dScklrVy94?=
 =?utf-8?B?TEIrd1JnaFc1MllCaU5IK2lPY2RPSHkybFVzcWlLenV4V1NsS05FRk5pOGto?=
 =?utf-8?B?a2NMRFpzMUdNNmhQY1VWNnhZMktQZTFwTTNLVGcveEM3WnpMYzV3VXpkc1VD?=
 =?utf-8?B?OGlicHdaV1NLVExtcEFZMWsxditvaTBVY0IvK1duVm1tSm5jMld0d2Q3R1p1?=
 =?utf-8?B?TVBnMjBnOTZJcVZjK2tmUTlCWU1BVW9yYVpvWndxdkZWSzdXcEM2cHltbEdZ?=
 =?utf-8?B?K2V0WWovNytmNkEvc0NnNjUxYzlJTVdjb29rTFMrbG5KNllzT1R6RkJLV2pD?=
 =?utf-8?B?cWhRMlhHbjhyQ0I2NGpWVDA3M1JnTHhQQnYxRm9XZGFkM3k5SGlyTStzMUJI?=
 =?utf-8?B?N1FLbXExZWhjZVg1Qm5NQVg5THc0clFFOHBVeEJXcy8xQkVWd2NVMXd2VlFC?=
 =?utf-8?B?WDdkMlAwZmkwdlZXaFB6TmJEWmdpZGN0eUR0WU1tL0hwQnV3ejNkVlovL3Y4?=
 =?utf-8?B?ZFYrOXc4dTk0WWk0enZzclZ0MElQdWFMc3c4eUxvRDhhWkZjQTZKa2xKcm80?=
 =?utf-8?B?dUtOMmd4NjFiT2JGUnRrbDhMRzYvejdTRTVZbXNEZjYvOHI4V3BoQnU2aXpQ?=
 =?utf-8?B?WEtJMFQ5eWhBWkQ3WmpPTmNvdkI3dEh5SXNzVU0wUHFJa3RKWldtSm5wT2hM?=
 =?utf-8?B?UjNYVVNKelFWaW5UZDFibDFGTWFuRDc3eVdSbE9VV2dKbGljTzhnRkhPMUl1?=
 =?utf-8?Q?mNIP5S074AIQ1l8TAENW1K/0y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499cc575-d72b-4c85-e0a6-08db2922befb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 09:09:01.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGL2jK5chAiiy3tk/g9s8esH91ul/pG4WsHQZPuF5N010Xr45QYO7U85hCWZFGuqjGrEmrYe7dZAt2rY+jlo1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7862

On 17.03.2023 14:19, Luca Fancellu wrote:
> @@ -744,6 +773,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = domain_vpci_init(d)) != 0 )
>          goto fail;
>  
> +    /* Copy and decode sve_vl from the domain configuration */
> +    d->arch.sve_vl_bits = domainconfig_decode_vl(config->arch.sve_vl);

Considering that you now "encode" and "decode" the value when coming in /
going out for a hypercall, wouldn't it make sense to also have in internally
stored value in the same more compact format?

> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -13,10 +13,23 @@
>  /* Vector length must be multiple of 128 */
>  #define SVE_VL_MULTIPLE_VAL (128U)
>  
> +static inline bool is_vl_valid(uint16_t vl)
> +{
> +    /* SVE vector length is multiple of 128 and maximum 2048 */
> +    return ((vl % SVE_VL_MULTIPLE_VAL) == 0) && (vl <= SVE_VL_MAX_BITS);
> +}
> +
> +static inline uint16_t domainconfig_decode_vl(uint8_t sve_vl)
> +{
> +    /* SVE vector length is stored as VL/128 in xen_arch_domainconfig */
> +    return sve_vl * SVE_VL_MULTIPLE_VAL;
> +}
> +
>  #ifdef CONFIG_ARM64_SVE
>  
>  register_t compute_max_zcr(void);
>  register_t vl_to_zcr(uint16_t vl);
> +uint16_t get_sys_vl_len(void);
>  
>  #else /* !CONFIG_ARM64_SVE */
>  
> @@ -30,6 +43,11 @@ static inline register_t vl_to_zcr(uint16_t vl)
>      return 0;
>  }
>  
> +static inline uint16_t get_sys_vl_len(void)
> +{
> +    return 0;
> +}

Throughout here: Style - please limit the use of fixed width types to
cases where they're actually necessary to use to achieve a certain
effect (see ./CODING_STYLE). None of the cases above look to match that
criteria, merely ...

> @@ -114,6 +116,9 @@ struct arch_domain
>      void *tee;
>  #endif
>  
> +    /* max SVE vector length in bits */
> +    uint16_t sve_vl_bits;

... this may be justified (for space efficiency), while ...

> +
>  }  __cacheline_aligned;

(nit: stray insertion of a blank line)

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> +    /* IN - Contains SVE vector length divided by 128 */
> +    uint8_t sve_vl;

... in the public interface it's of course mandatory to use.

Jan

