Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8B73B1BF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554274.865379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbJ1-0007Sq-I9; Fri, 23 Jun 2023 07:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554274.865379; Fri, 23 Jun 2023 07:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbJ1-0007Qi-E3; Fri, 23 Jun 2023 07:34:07 +0000
Received: by outflank-mailman (input) for mailman id 554274;
 Fri, 23 Jun 2023 07:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbJ0-0007Qa-07
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:34:06 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe12::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b96d8e-1198-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 09:34:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7392.eurprd04.prod.outlook.com (2603:10a6:800:1b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:33:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:33:58 +0000
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
X-Inumbo-ID: 53b96d8e-1198-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE/29+yFE6JygY6uflYOqKYbTyOjJ/y8O4lO//tzvEmD1D0xFan4mCh1vHGvjn5HYOunWDV4ixPOQg+PZUvhArtqyCUt7WriPNGXixShCJhJGdv3gh3B+Wj+VxtjlBf3XoostUBOs57u6t9EwU52tOMuDtrIfG+DPHVJomOyCQq/12kRY0CXQevX2AwCrGgIyTiEQ95cUb8cc8E7LK1wbdgov04W4d+pMRnV29WhDZAYUUCO/FO+fV4naz5LTeSB7qq6AYE6myg2fDXfpOb56DRlvo7mmadVY+w1w/T4Tt84BAZpJCg05HjAYIBMeyMfmFslVTljyRlJHvf4Vo3WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4Xd0UQMgpKt5+fDXNhj6kI5ul0pMYtXMtbQXzu3rL8=;
 b=Q5S06AFbw0DTff1skVu/4VD+YZXxhUFJP+8KU8x20E5g6KyARV44+7z2jqXJjffYXAsh/eaK2K8f4uWtEUZSN/HExGloB9ToWox1+CU42cRduLNgdphrcjQijwVHETHDC7/6I6m6EF73MXR0JQK4EHLTl/tFSFH96F2mrXp/c/bA1rYooXtW3D8sWqhaErVARES3xFgg5Ho5EBEr3Xg3OBbARkVKJUkf6GQtNgEEJ7e8fSKvRTmI34zcPUwuyIyUhnb9j+xXZSHA741lMrs4qLRULDKlyVrJca1sUpy/MmbpQd5xpdRNlNLWPhaA405JClztmkYPAOvfcm7lhjhkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4Xd0UQMgpKt5+fDXNhj6kI5ul0pMYtXMtbQXzu3rL8=;
 b=eIDrlV4H574dDddZoJIXhK6vPDWmr8pxjjA8bWeER6k3s2jxgROIPoQUmUedeN884XJLFWe1m/a4QHfglY4A5wr9FuIXJIC6cEd2DODVF6cSdtoMAjyNLTnIwFDg4jEMkMSBeYr5WCrRzcLkyRUIXXGYqsV8fD0B07cHnY+DLRWvgXPzZSV+TKnIyc2sChjw9fndH95M12elJR5IBQXj015VmnY9lbhQcm/dgmNS2luvBtVH+AB/JwvFBvyJjg6szNj+tWlH1stO0mCZOZKO0WgfgHtXV5ju22uHuB8COVqNtxzgzplCFgKnaDSwW0M19OTEO2o/0mfTwRynp0i4ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da108604-6468-757b-5fd2-d477cb388e5d@suse.com>
Date: Fri, 23 Jun 2023 09:33:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
 <20230622174219.8871-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622174219.8871-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 35842ac7-be9b-4e59-078f-08db73bc350a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8LMUDcRCYMuZhz4+4Ncg/TCWgDmoQrJlPPR0is+Ch+WvAL9/JdLj6v34ZHjh/6zDoxRcn6V+YW6J85WDkdZ4G9vdaPTbQH3cfFQAuKFcNm7a/63LFyvSpsaUUhHJUBrZ8i8Df0Z/Yk64FPh0RMIzmfEmyWjYT5UT48BctdGs7siX+XE4P/Hytmdfcu5a7cznDBNlwwn34G+MH2r4mPCiqhKqbCMYDkeqRDGL2Ntt1r3o1b8krK8cVrCK3SHDW8OmSPNu/g5trTdowZCKwuEhSsW2x4zlfmlBy6FGXmdEayOJZz/1phzH7whZFRvYEAYAV1qZak3G0r+aTzbg9oQZ2WY93jBY8KFHnTsBqPt9ULz6uQKnoqSd9b3ni71pslclpX7yOKeQgKBhluEZbOVvachrm1AYrDC9I5Wi+lpdFuMeUnVJPHV3nXjq0ksxCj00IMut/043XLhnysXEhL+SRuCjboq7oFjh4+vX/8vLM44unOGnzR49O4k3WXfJAkvepRfHf0TBPaIN626QgHcljWrRg/FyMzJ9vEu645Yde1OKB+gO/eBQHZoX+Ap8Jz1MT9TZ2/Xhzu2DhDEtpv76SK7wWga0NcspgBKw2sDiwS7qYejxDl3TbyeOJXTHCQTe7+zip6U/cXh53xHcu9kr1BLdTa5CRJEgfoOn3YNo8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(53546011)(5660300002)(86362001)(31696002)(31686004)(6506007)(2616005)(316002)(54906003)(478600001)(2906002)(26005)(186003)(6512007)(6916009)(4326008)(66946007)(66556008)(66476007)(8676002)(6486002)(8936002)(36756003)(41300700001)(38100700002)(83380400001)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ly9GR3FocHp3a1d1RUNqNlkyeDYxWHEwejRnQ2JZT0hLanpscXgzenJqbzJS?=
 =?utf-8?B?OFRNOVl6Z1VhUStoNldxYVpCV1RjWW1EK1docVNVVExXejk1OVdHZjZ3RlR6?=
 =?utf-8?B?Vyt5eHhYTjhieVdxSlJjTFNJNlNPN0U0b2VDZnNySndCQ0xUMk01dkMvL2dm?=
 =?utf-8?B?VVFOL05obTI2WnI4TkJOOHB1MlRoUTJ2R2pzODlPRzJGRzJRYzV0cWhIUFJs?=
 =?utf-8?B?NExHWTZmVU5Wb1hpaDlUMWlzcTh4d3NyVVVob1lnVmlhL3BnUi9CWEcyMnRs?=
 =?utf-8?B?OWtaODZQRzQ2WTN5MExJdE1lNktHdXNSNXYxZTJxbG1weVcxMU03MGFqaVZW?=
 =?utf-8?B?Sy8ybkE5VmF0QWJkSGptRGdWUXhwUlgyU1dpVU1KQS9TNVdyTDFEVVVuQU0x?=
 =?utf-8?B?UTNMMlVmUnBnUUREVXdkZXBlSFNPNVhSUHJNejhleGVCRnpDbFRKU09NT2Jq?=
 =?utf-8?B?TllkVmpGS3VFbWlyWkN2R2JNVUZ6bHpsV3pmQ3VwekY2N1dvcEV2eDRNMDJN?=
 =?utf-8?B?VzdjL05rbXVZSzdYeGFacjNNSHZPUzdKdS9qLzdZbGJlVCtSYWpuaDl6cWJs?=
 =?utf-8?B?UVdBN1ViYk1MbldJSU9BS2tyYnBNSVIyNkxuYzNxVDAwNjArMzU0ZjhYbHda?=
 =?utf-8?B?UTNwUVM5OXhiWG5VUVB4Z3RuMko4REJmMVZzN3k3UXJydnJmSlNOeVA5aXRm?=
 =?utf-8?B?S2tIOGZiYU43RDRPNUJGcDg3VkszRWZGWWFqeVFLMldEcFhYd2FmekR0amVj?=
 =?utf-8?B?QmZHbkVqVGFtQXFOZlpjaFlITnp2VVNyY0RiVi9Bbzg3NGNZZ1N0ZjROOXhm?=
 =?utf-8?B?UkozSTBxd0tKc2ZJYWpWMDlkMnlhbm1sdUcxRDNua2xaY0NyelVKYnhLRUNn?=
 =?utf-8?B?NG55Z0JwVGxkOCtxTGM5RU5YalMwMER1b0hjZGNhWVZmYkZydVZDS3BtVjUz?=
 =?utf-8?B?VzIxTkJOei91UmxtcDZmT3ZKd0wrcDZVZ01ad3pwcmJjK1FaOUdlRzg2S1g3?=
 =?utf-8?B?MnFWTXduUmlpQThCUFZSTWp6ZFk0KzhWcHlMVTB0cDhaVXoyUEU1ZGFYMU5u?=
 =?utf-8?B?ZGlmNXY0Tmp5UzBaSlpnNnREbnQ5SDkyWDVjVDN6ZjVPcDZLbk1HSFJianpQ?=
 =?utf-8?B?cUI3UjZ5dm95VmZ2ditqN0UzVksxK2pmRllxMll5OGMzbGl4bTVhcHA5MGQy?=
 =?utf-8?B?NFpaVG8wUytPeVFCVmx3N1VDdVZLOG5oM2NqYzN2QzZzRTNqTjA5YnFDbHpQ?=
 =?utf-8?B?czBhR09kVHRyaXZVZmxNSHROcGE3aDkyU2xSQ2dyUVU5QTZrK1pFOC93QzNp?=
 =?utf-8?B?UUd0N1ZPeXprQjNuYndEMVJYb3Z1d2k2YmZWWHpsQ2lHR0dXbGRmTm03R25w?=
 =?utf-8?B?THFVWENGajNHenpzMVZHMjU5QllQRnJTWjRSMWJ0UEdkcWVkS05YWHNUTzNv?=
 =?utf-8?B?L3lGcHpMU2Q3RFJ6L01xT0FXbFdvTDJXL2dWN0hrRGx5NTVXYXhkVHVnYXlz?=
 =?utf-8?B?Nk9jVUVYL0lWZ3lMSWJXMFNiYnVURytGS0F6WkYwbG9mNndsTzdQdmhvWUdv?=
 =?utf-8?B?NnN5dkwrYkVQMkNPMXY3QU54U25KTzZyZ0tUYll2cGJ4ZG9ITkkwTVA4ZUpT?=
 =?utf-8?B?MEhTUXRkVzBhbU1ueWRYUUViY1RqRTB5aDIxcy83UFFKaVlkanhJWmN4alJz?=
 =?utf-8?B?RFVsUGJQNGNuWjI0TGdhdEV6aFBKa3dBbnZLenpaTUdKblp0WDV4MGE4UXpL?=
 =?utf-8?B?TzJIYXlodGVIdnBzMi9xbDhIa0NDb0xTU1pOMDBRTzIrbTFMWThNUDAvZXhR?=
 =?utf-8?B?aWhkZlQ0cnZDaUpYTkRISlkxUzhsZXRjUC9hUHNoaWxUM3NYNkpnaUNUbm4x?=
 =?utf-8?B?WkdCaWY0TmpyMWNIdG9vZFNTWU5kV09zeHBsN05vSnBDUWFHY2pXRVEwWHF5?=
 =?utf-8?B?aFZBaHd0M04vZlpucEZVZnhhWFNwQUlnMEhHTE96b2tCUVBCbU5HcDEvMC91?=
 =?utf-8?B?eUdoWi9JTEhsM2NhajBSR00xL3pIWEFjWlM2NDZscVJTNVpFUUlPdi9Oa3da?=
 =?utf-8?B?RXdnNHU5ZzNQUXhoZEcvYlFYaXZDMllaZkdDOGdnSTZMc0tMWDVrVEpRUU4r?=
 =?utf-8?Q?xeBXJFGEeknMqs2G0SzidwtFh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35842ac7-be9b-4e59-078f-08db73bc350a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:33:58.5344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJuoJHkFwuqSYUPPFdD5a2LOFEuZdkIND3QQ9kdEo0CRnDa+EZt/IVUwg70hCmT25/ZRzm/IV9tVD9eaO7q2Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7392

On 22.06.2023 19:42, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -885,5 +885,18 @@ int __init early_microcode_init(unsigned long *module_map,
>      if ( ucode_mod.mod_end || ucode_blob.size )
>          rc = early_microcode_update_cpu();
>  
> +    /*
> +     * MSR_ARCH_CAPS may have appeared after the microcode update.
> +     * Reload relevant fields in boot_cpu_data if so because they are
> +     * needed in tsx_init().
> +     */
> +    if ( boot_cpu_data.cpuid_level >= 7 )
> +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> +            = cpuid_count_edx(7, 0);
> +    if ( cpu_has_arch_caps )
> +        rdmsr(MSR_ARCH_CAPABILITIES,
> +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
> +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
> +
>      return rc;
>  }

Did you consider simply calling early_cpu_init() a 2nd time, and then
perhaps from setup.c and only if ucode load didn't report an error?
There's a printk() in there which will want avoiding on the 2nd pass,
but otherwise this would look more future-proof to me.

Jan

