Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90074828D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559066.873768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH07R-0001xA-A7; Wed, 05 Jul 2023 10:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559066.873768; Wed, 05 Jul 2023 10:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH07R-0001vL-6l; Wed, 05 Jul 2023 10:52:21 +0000
Received: by outflank-mailman (input) for mailman id 559066;
 Wed, 05 Jul 2023 10:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH07Q-0001vF-Bj
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:52:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03212e97-1b22-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 12:52:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:51:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:51:49 +0000
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
X-Inumbo-ID: 03212e97-1b22-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXPo1JLr+obMsXGZuEehwW9JiHVghp+Ge65CETrq15vzZq4zt9oqvzrnE7tkpAf9XFrMvHl5TDM16Gh7ASo/6pG7NyjyVa4/r4jiQKeAIXaypwzgBhSLrYAcjxIqJ/vq+FOXzLea66dXwITApFoffi6Hdqa938lCfk+pooCvLtZjzg0amJg/LLXWMyChQrIv8z88YpeYK/5u/L2ZwYBItM0+31SjVdl4MF07sCIJC/7+67V+7Vf4a0aVzKEwwDvpKtwLYbfCu0hlxWxpnrOaIYnNuP0TDaav4ddnI9PV56XkEHjD5Mxs0dKIK9OsXotAgKt50jtfMi8pB8WnI4I6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bvbw1tm6Hz3nLztoL7t76OJzMGSv4pIc1wPZMxG4Y0=;
 b=B9pnlgNzv09LK+tWRIBijygOU2x2aH9QSmF/S0sUGYws0mSuPaqR57NIcM6ifjbHeqbrEOvcVNY0m0v9e9lgPqWnonDl9b3ww7b+1TfvJryNJ6dJ1hZQw93ht38SOOSx+NJQU1hUSTwvT0PbjM6LsruTwAyvX1lLvC9bwZw3mnbSFSiZULYs8vq40U8pGNKrVpN9pQeCjanlALipGYj40CPRG7wNXkmkn0jOsfMqoAprVQL1jSC8uEJKFYv7wZ6u2fJ1lRCytkLFNkRIY4yG2SXu2OPzCpTzKRhaRVilkDMbDsKA57734dcMVILOEtdB2KMDkZcQG0OsiaD30WSX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bvbw1tm6Hz3nLztoL7t76OJzMGSv4pIc1wPZMxG4Y0=;
 b=ZHsaBPEN9He0feYOiB+kFBLtkbTVmTojSOqQROTWNpHuYwa1xLDfSVymmyva5FIotoXl4YJki+Vx94G7HbHOxx6Hxgk8rgggRju1H1OnfG4p45olP6ZqYDNPMCm8/rPS8ovlpqn63yEU8HrC2FH7GhJLtSj9jzfQSHM4jmA+K8mGXguyQyjsS4WK2OXSep4uf+96MhGU5Bu7zAmEwHNaukpV9paefMaj4yZHKBYbg5B+hMJ+o31mz8uTnio6gGaA+0QF7K/ZqHBWnCV/U1lOkmBPrbv9r6f6ceeenC8EFX34PRzTY+CHb6jaaWENP2Idn+ZPCoveZgjOEHjqpOfvsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c9fe38e-d8aa-21fb-8dbe-4c54385b5a67@suse.com>
Date: Wed, 5 Jul 2023 12:51:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/4] x86/microcode: Disable microcode update handler if
 DIS_MCU_UPDATE is set
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-5-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230629152656.12655-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: e93a344e-14fd-4087-6c6f-08db7d45d5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLgQq4C824VGtOwCv4N9aJF7JNe5PJE9q3s4W9Xyyn+oHhbDpUWDFiqYBHYq+HTYjBu8PkuGm6ane+Q2u5NQ+TX3VZgCaybGqQPBM46osYd2wHQnQceWgEzcYb/u05lJn+Swtn793XrbIkn67nKi6IRDvmtZ0nGqRQrSSTL2BU9XKnb4d/eJDpA61owP1BWM+yYtHDHPLbFrFa89KtyGWjBUhMwPj5LJuEuDaAg5gZsUOCjuzYCuRySXDsoBM7jhbHX0hhxTzTPBVUhw636pwQG33MrlVmK5St3XjaTYU9/daWdvShNly+af0kUNe5Asr75Xp0TlBE8TCO2PPHxtDRZoHXzn5+OJ73YKZfq11uK3/s6sLJA/9/BPCw52sITv4XPEMd1Zmi2sYRCSIyZvE+cmfR7o7HxxHbB51qiQnHHZKulQ6DDWpgMgX7/vxllYJccOWhuFjx0dqfsf2aaBAVUbhufqA2fQ4UcueTW935pdJRNCOOVUB/MZQtxclnjLYLFysFTiGMvzjQ05S/Nv2TE9pgGiIYep1rlHIP4nVasXKkfv5egORZNvRuFoWJ2ZvGOP+XqVEBKeduD8PXTtx9aoy8j69D3uhB7RwbBQcaYfs3HHNdS23+V2vsXOlLxfPpn2joaPnMjkcHR58gSk6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(31686004)(8936002)(8676002)(15650500001)(83380400001)(41300700001)(316002)(5660300002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66476007)(66556008)(86362001)(186003)(53546011)(478600001)(54906003)(26005)(6506007)(6486002)(36756003)(31696002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZENC84SnBtbzJUci8xTFNDYVBBVk53MkxPRGg4QkVpNDlmQ1JYZ2l0b29Y?=
 =?utf-8?B?akQrNTRxOTdiV1g1eHpmeHhraWozYm5VbGNqT0x0NkF3b2JtKys0eUJxRCtW?=
 =?utf-8?B?SXBjNXE2aWNlSnRPSTVJbU5tSzhsRHorYXpTZVhVWkh3KzFRcjJ2STJpM1NC?=
 =?utf-8?B?RUlFQ1ZEL2hqZkZ3V21XZ2FOSzZsbHVtM2Z6aFpwTEE0WlJ5STQrelMrc0M2?=
 =?utf-8?B?cnQya2tPN1AwWHNWKy8xZEc1ZkluUjFJY2pJMFY4c3BBa2tJMTgrV0oyQk1y?=
 =?utf-8?B?VGhQdCs0Q3lrNEVkWUd6cVRHdkM0ZjRscVdmWWl6NVo2LzBJOTF0ak1WNGVh?=
 =?utf-8?B?Q0pNYkxyNW9DTjRlY2Y1WCtIZmVSVVRHQXY3RzZzVWhoS3o0TVhIclp2dG9D?=
 =?utf-8?B?Y211UUZFWHdYL1pJUExZM2ZaZmtmNGdRYTE2d2dySXJFOEtnZWVtU0U4UVJw?=
 =?utf-8?B?Y2R4ZHMrNHJTbFdPcFpDbkgrTWk3SU41Sm9KM0hJMFdjMEJndE94QTg1NUlI?=
 =?utf-8?B?N2cxRk1WWUhveHZvRTF6NGRkRmRrWHFNK0kwRmJJY3JTcWloZVBNTXNSMHcw?=
 =?utf-8?B?SUJiYUdVSTFBM0tOK0JSRDJaWkliSld3MGZ2NUxDeU5id0t2NXM5SnpadWwr?=
 =?utf-8?B?UkcwMjJ6ZitmcHF4NUU4ZVBlMnM5ekYxSkFsQktnbWg0YmovM20xbXVYSGln?=
 =?utf-8?B?UWJoWkF5M05qU0djWnZWemhPSWNncGE5VmdUa1pqanZTSGQrMDNFaTZGcjY4?=
 =?utf-8?B?VElTY0Q0dWhGQ2NYZGlsZDlMS09ac0NZWjdWQUltY1Vmenp0MGtSb3BpMmxF?=
 =?utf-8?B?SUp3RHBRUWRmMlhiTXZxMm1SR3hObTZPeUduSzFIeXl1bGhrbTZNS2FRcE5v?=
 =?utf-8?B?MlhvTHl6OGt5Tk9TdzhUcS9ReGdBeTlhNklyczRKSGhqRFpSNjdzb0pJcGxF?=
 =?utf-8?B?VWxybjhXMjh3NUdIQWxIODcyTjlIZEpHWTdJUS9aUFAza3dBTlV3WlhJRTh3?=
 =?utf-8?B?bi9RYnBoTExXVks5aU9NbGhtdE0vUUpFYUtLdC94MlRGY2NSWitSVWVyYkRz?=
 =?utf-8?B?NmNKamNhay84Wlg4WHh6bnBySjdpclhrdENhSXgxMXFLSkQ2aUIyMXlzWVRt?=
 =?utf-8?B?YU05c0VEYnI4NkhSNGpuWE5nWWM1aWRPUGRDTkt1QmtqWnJMdGdjVWRJUnM5?=
 =?utf-8?B?OUkvcWFJZlR2cGl2ZG51WFhuK1dCNlZEdkFWbTRCcHhnVnFoazNqL2pkcld5?=
 =?utf-8?B?RzRzSDBzZmxDNmRoK3hGMGo5MG45ajNoTzFzVXJNanVOSm1rR3RLT0FrQlR2?=
 =?utf-8?B?bExveDFpQ1MxSitlRkhPaWZUc0ZLbWpwVTIzeHVPMmgvTUhTaWo5UXU2RVNF?=
 =?utf-8?B?TG5CZHNCblg1RnU3bXZxUXQyOUJtM29TMURxOGIvaFM0SDRnNzVQV2cxc25t?=
 =?utf-8?B?U3B5WGxNWHRadGo2SitDWVZFVSt6RmNLVUtranNiQkRQd0oxZzhMU1pRTDVw?=
 =?utf-8?B?SlQzRVVNM2lCZG11d1NGMjFHS016a2lNNVBpMjhYZktsQXdBTVh4WDg3YlMw?=
 =?utf-8?B?cnlQRnIwSXkzU2ZYYXNuRW5OTmdoTTlUTE15OVdxWW1yNGR0ZlFsekdTODcy?=
 =?utf-8?B?MkREYzJBSVh1NTBUc0JNa0lzbVFNNTNQYkU3Z0xJOWNqUzhsSU5BUU8ycXht?=
 =?utf-8?B?OUpqZjM3M0lRTWZwTm1uekNTZ2RYYXJLMHZzcDNCbGNoUStGSVFiakJIdmpG?=
 =?utf-8?B?VzZpazRMa1lsQ0lYejR5Z3BsYXFCMHl2bFhYc2sycWkzdlo5cjI5RHhPcDMx?=
 =?utf-8?B?Z2lIbVJBaS9sQ09vYmxQb3Vtb25JQXZITU00bXBnYTdlb0FLc3pNM1hENzAz?=
 =?utf-8?B?RzZDWWNMZ29OSUdOeFNmMmJHVkFBRWFoeXZQS1JILzdRdGhOUHFwWHloOFcr?=
 =?utf-8?B?dnVIaklyeTBHcnRMcmxNL253UDMyYzJ1RFg1U1RrZXE1TkY2OFBvR2pVRHJa?=
 =?utf-8?B?OHRKY3AwTUwreUMzUlRvYXpxNXN4OVlGTzZPVlJXa2M3N1lLSTV1bmdLT2Zm?=
 =?utf-8?B?ZFlUWGlVMVZKbCsvZEtSZTNheUVQZWJMUUdWelQ3RkU0MG5zSFZHYkhEa1dS?=
 =?utf-8?Q?aB5uaX8Zq5IZ7x5B6jFfSFgRC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93a344e-14fd-4087-6c6f-08db7d45d5ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:51:49.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJGn29eO1FIUZl/7fMWhVznTSef48S/dzbl0okzfmUMQgNzVIyKgBcRlSjaIIseNKXik3OCEDdu46LcPT2spJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

On 29.06.2023 17:26, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -847,17 +847,21 @@ int __init early_microcode_init(unsigned long *module_map,
>  {
>      const struct cpuinfo_x86 *c = &boot_cpu_data;
>      int rc = 0;
> +    bool can_load = false;
>  
>      switch ( c->x86_vendor )
>      {
>      case X86_VENDOR_AMD:
>          if ( c->x86 >= 0x10 )
> +        {
>              ucode_ops = amd_ucode_ops;
> +            can_load = true;
> +        }
>          break;
>  
>      case X86_VENDOR_INTEL:
> -        if ( c->x86 >= 6 )
> -            ucode_ops = intel_ucode_ops;
> +        ucode_ops = intel_ucode_ops;
> +        can_load = intel_can_load_microcode();
>          break;
>      }
>  
> @@ -874,7 +878,7 @@ int __init early_microcode_init(unsigned long *module_map,
>       * mean that they will not accept microcode updates. We take the hint
>       * and ignore the microcode interface in that case.
>       */
> -    if ( this_cpu(cpu_sig).rev == ~0 )
> +    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )

While not too bad, the addition brings code and comment slightly out
of sync.

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -385,6 +385,19 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>      return patch;
>  }
>  
> +bool __init intel_can_load_microcode(void)
> +{
> +    uint64_t mcu_ctrl;
> +
> +    if ( !cpu_has_mcu_ctrl )
> +        return true;
> +
> +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);

While one would hope that feature bit and MSR access working come in
matched pairs, I still wonder whether - just to be on the safe side -
the caller wouldn't better avoid calling here when rev == ~0 (and
hence we won't try to load ucode anyway). I would envision can_load's
initializer to become this_cpu(cpu_sig).rev != ~0, with other logic
adjusted as necessary in early_microcode_init().

Jan

