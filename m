Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA96E47C9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522068.811222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO1Y-0006LT-GM; Mon, 17 Apr 2023 12:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522068.811222; Mon, 17 Apr 2023 12:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO1Y-0006JY-D4; Mon, 17 Apr 2023 12:32:00 +0000
Received: by outflank-mailman (input) for mailman id 522068;
 Mon, 17 Apr 2023 12:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poO1W-0006Iz-VQ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:31:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78321af-dd1b-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:31:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9651.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 12:31:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 12:31:53 +0000
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
X-Inumbo-ID: d78321af-dd1b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO0paTe3C6UB0Q+KwvQKitnMMutdoItB8NyzrzkFLXrSZSTzC4oSgLQMZPQlV/yT8jFWxyNXp1ATvy9ZEB6R5vK/smgmTPaUJwczWXw6XkxiIrnmLP8W02JkEP2cVCivNc4ekIXtuPvk0lmEl48pu/B1Pi0pd2fJJVvLw/7+b3Fi2ujSuoksRgXgQ614igZRYfWPoz+Iva0h4Qx9JEaKuoRJLqemundrAiHJ+XNugfSnNVKJgyqF7Lj3mgKROG0thmtehFxjUHCThqyS+GQU79XKsbY60RWN+kwmoFpfWPm4U8YBWwEZUH3CfVM7LiujgI7mZF8yei2Mb+//zMuubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi3+8447OF2S1p+bzTgtIFsvyuZusJ/CO/hiesmK1L8=;
 b=M93o35YDqldI79wUVxtsZA40qH8JTMDsVfLj/ua+A/XCSYD8UUYfOqp66dHeVvHuLNzuBcyYq/hgNrnZGsqN0XlpelhO6wuRcgO/R20TumSQwr+RCmxxjjIWxaSBEVI6knKhV747ZvDa3/p7yTWER7l6sPGreN6Caf3/XnNa7NpjscRodLgf5nnotyB33KqGcB0ccP+a6iqFY5JlJKA5RRhacIPO/t/uiIjCCGye0h4WNxsdPZpoU90YCM9u72PvMnqaw0LBrWV4F6wBzRv8ybtZY253jb/xDB43FHNT0qfaaqPZ8I2sbw2PIsVpmfelg/dmWk5Gav7Qtc1ATemPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi3+8447OF2S1p+bzTgtIFsvyuZusJ/CO/hiesmK1L8=;
 b=aLmlvf+SnIrtyQTr61vHrNFJXNl3/J+VDs6Lrpk3IYWVPyzDcumR8y6Kl8oM3N9g0AKd/+Ckgs2ywurdON6C8ntDWrKSfsmq6t8B0rC/gk6EA8uBOs859WuIK2rGmFoumaP9Z01d7FVDA+eFKHnkRyg9/QUv7uzte2DmmUCp0ObwtdhZQa3W+X1vDoA5z5PhhjDbASpJ91iwxtSGgY6JCwKnBXa2dpA1LSMhXJmi7W2i57XAqCZmS1UPESEmL2NAbGAn13fQ+d5D+czT1Y3SKhr/wj8kAAazFIxfxlAMax4eqZ8cPKTg8BdPKe2XWwxIWs7gSE4ebet86rCA+tNBfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a94cc73-f99b-a616-d342-8d84e8a274b4@suse.com>
Date: Mon, 17 Apr 2023 14:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230417121357.3738919-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccfe117-5ad3-48a9-4a16-08db3f3fb9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5m/8cWrHyLfFCWswPLkgG9VImZ2FZ+f3qrcGZSlNObcMm3tnqPVeAggKfEDCrQbP43YPI2XIun7z/Mg85KcuAM5ixaqJl8GgTzqqZvpkBeTN0rsKrjVB+MrsjmtSVkWOfKYRnRPL52llpJuSktwDoEbnpN5sF/tndnmlyONLpj1TXAXtRepkJVmpUlFUPSHnGZAAr8E4oLDaQSFaU38NmLqhQgUy/vOj6qR3pd691E00s9FGZZkxPTXW4yv0ViVqZYCjsirD7stVeMGCM1Da/pc7Vmyv3qJkFAytPd6V6QMvVPLeWHNcuULuPtew1+NVF1ktKtLGOOYqH5nJAaSUiI9Z3GfLMynLZstn10XJW10C5vrxze4oIYyqgDWcR1oXu4jk3OZD124oZAzSbUMR+bWnZGeHdOBvjC8mObZR6Y/U3qua0ALJf7Mv9K93U1PS2tFXIpbby/Ri0RqqZRPak3WbGXRGPda43T/l17WnJ3RFfk9kNVmSazZ3gI83nz4lyW3kYGgDqsAXlgxrXkPQqrpK96SmmQKy4d5GbADbuTVxGUyXXKZwTBmGkdQatKx9QLmf+u42jrDrL2o/BT5jmU7v2MlN73yfe4QpIWeK1zpN/LrfRz9HwGVZW807dnhBnjykvJS9B/N8e8oxJs0CyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(5660300002)(6486002)(66476007)(66556008)(2906002)(4326008)(66946007)(36756003)(7416002)(86362001)(8936002)(38100700002)(41300700001)(478600001)(8676002)(316002)(31696002)(54906003)(110136005)(6506007)(6512007)(26005)(31686004)(53546011)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUQxR0FwSzNEL28rek93R0ZKdzdVL0VGd1MwYzg4RElCMEtLTEVycEUyRnl1?=
 =?utf-8?B?L0FmNFRUV3R4RzUrM241eHQzMEd0R0ZmSDFsU1BnT2g5UHVKd1hVWklVdmZU?=
 =?utf-8?B?cXZ6aG5yVmt2SjJjcDc5Rzg3VXBJVXBOOVVjV0pXZ2U3aXNrWEJNYnp6bFNz?=
 =?utf-8?B?QjhBWEtPdi9La2YvZ3FsL01oK2dOUVBmVmVwbWEvSElaM1dwemVXYkZkRjAx?=
 =?utf-8?B?eTVWVkV0Z1pqbUpRMTJpMlpNeTkxTS9mOFk2eTh6eFhHOTR0b2V2V2k3Z2cy?=
 =?utf-8?B?cG05MXZ0L2IzVUNzT2dUcWlLSWRJcS9QcndwNlNjanNXMjRpajBmOE1mT1pU?=
 =?utf-8?B?Tnl1bytqTEI2em5xdW9HNjJ1elpTZFZKM3JQSkIzVExKNUhqbWhabGU3WVcw?=
 =?utf-8?B?TXpCcVAyMEMvd3pwWlRhMVFBMWxqWHNFZi9rN001aHNpZVNIS0cvY1dyUEZi?=
 =?utf-8?B?MWxwOHpSSEZUbHVqZTJEQTAyS1JOU3BqeUJaR0tmajZaRk5EZDRUTkRpRWRN?=
 =?utf-8?B?MFFvWnplL0t3LzJrUnJ3akxDb0JocEx6N09VcE90dlZUZEV3TEtJOGVpK1E2?=
 =?utf-8?B?dkFhdVBwWEw2S2E1d25YbkFyb1lJNnV2bnRDL0s5dEZDQ2UrVHRRdm1rVkFk?=
 =?utf-8?B?RGJ0cXlCNFRSUEkxL0IzWjBJWnNtRFlTYVl5TktsUnNiU0VkRExLUm1XdGVJ?=
 =?utf-8?B?bmUyODZyRmJFa1hUYmpRb2pPUGk0ZTg1VjM3Uklhcy9zRGpjTVlTTEpaTXl0?=
 =?utf-8?B?S3kwVFMrU01Dcng4Mk15RFAzRDl4YnRmWjJRVUtIdUlNWDk4MHkxYkxtZ05x?=
 =?utf-8?B?azdJd3dRL1Ywa0pUcmNoMWRMN0puNUxIVTNFSmw3bFlKbkQrZGJKUU5xOUEr?=
 =?utf-8?B?cFRRTVpnL095RkpaNXprZFFXWmZQQWhLLy9RVGJ5UFZDTHpPYmpFZ0R0cW02?=
 =?utf-8?B?L2czOUhTa21JRzBRNTJGMnFvUWxOc1doT2N0U3AxZUZBTUpSMlpXamFZUFZl?=
 =?utf-8?B?V2doRFViYWpibU5GOTNDNTZrOGt3YTVDTFRoVzZlSjBINUVyamdwSkJ1N0RM?=
 =?utf-8?B?Uk1Jb2YrdEFIUFYxV2dLZUxmVEJWcEdjZEdjRHBpdnRaR0FEODliSWhnVWdL?=
 =?utf-8?B?VytrN05NamVnMGVUekh5Sy9Ecjkzd2NZdkx5QURhUlBXTitjWnB5MmtRSTY5?=
 =?utf-8?B?MnR6L2hzU3pzM2UzK3Y1azcwUUhCMWpWaUp5YlNBdVRTQ3hPVS83NFE2NVFO?=
 =?utf-8?B?cE83anRTYXZmZG9RODhGWUR6USt0R3dPc1pKa1dDa3FxdkNIWVVQSkZMRTFV?=
 =?utf-8?B?bzJCaEdGV3RYdjR4TDFycHJ4MThmL3FqS216emxvSFExc0VMQWhqQVJoTkZY?=
 =?utf-8?B?eWgva0VYemVJdFU5enYzS3RGNjA2WGZKOE5TMzF4bDM0cWlXc2pIckhlYi9H?=
 =?utf-8?B?T1hEOGRiTDVRbXhaei80S1JMMkVBTnBMdng0a2FlUVRyTEwzUGpIeTVxRTRD?=
 =?utf-8?B?ZWVGd1F1cHpvelZXRWpzOHg5NFprd1RrcFQ3dVdKSjBWZTRYZmVCcDFJNk5P?=
 =?utf-8?B?UHRxS1F3cXFmd0JZWDNLMjlqeHhJSzJwcWwvcnBXRjVsYzZGaStvMmIvZ0Vj?=
 =?utf-8?B?Wklxb3FmbFdpbTZPOUJYVjVUNkt4Z1E4S1hkWmNLbTlqVVBFZzMrckVHTnFC?=
 =?utf-8?B?VmVrN2pzaXVLeDZzcXE4Z1RjQXl2bmJHWWhHRnNQbVJjZjBmRmxtUkRETTdW?=
 =?utf-8?B?VS84V1ZYOUtNNE92Yk5QcmUyMENVZ29BVnBxNks5VHNiQjhQQnVrc0xUaHF0?=
 =?utf-8?B?WTFnUXZ5SnBTbFpqaTFOZGQxOHh5TVRyV3FrWk1NaHdseFpwbnFUN2ZGNkxw?=
 =?utf-8?B?KzlkY2p1YmNpVDVERnpnK0JpdWRQZVIwbVV6QlZIY2xWZnlDa1JYN0JQRHJT?=
 =?utf-8?B?ZHNqWExzVStoOThxN2d6bkdxOHJxS3JxZ0RKdUpHZXk0dzRJZTVUZEQya0tr?=
 =?utf-8?B?Y1ExR2tkWHBGdks5N2U3L3hGeTNjNzliaG9vTXVaK08rWDZEOXVUKzlGZ2t5?=
 =?utf-8?B?R0lKNXVXR1pjZU1RbGhGNzVxQkRBWVd4Z3BJUE8yWXVvOUZRWVhBRG1hY1Bj?=
 =?utf-8?Q?Zlcae3B7DlHOKjxea5ju5JdO0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccfe117-5ad3-48a9-4a16-08db3f3fb9d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 12:31:53.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaNMbBcS4T8IajyL6Rlse3x/6XmH0A0JxoKhndvcneSMjOer0mVgPK7UekgYBECQ3CWpf2fzrdAxmd/g+u1vzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9651

On 17.04.2023 14:13, Andrew Cooper wrote:
> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -310,12 +310,12 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>                      break;
>                  }
>              }
> -            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
> +            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => 0x%08"PRIxElfAddr"\n",

I don't see what's wrong with using %# here (and below); I also don't see
what value it has to zero-pad to 8 digits when the printed value either
is far below 4G (when representing just a section offset) or likely far
above (when representing a real address on 64-bit). But once again I'll
leave judging to the maintainers.

>                      elf->name, elf->sym[i].name, st_value);
>              break;
>  
>          case SHN_ABS:
> -            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => %#"PRIxElfAddr"\n",
> +            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => 0x%08"PRIxElfAddr"\n",
>                      elf->name, elf->sym[i].name, sym->st_value);
>              break;
>  
> @@ -344,7 +344,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>  
>              st_value += (unsigned long)elf->sec[idx].load_addr;
>              if ( elf->sym[i].name )
> -                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
> +                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => 0x%08"PRIxElfAddr" (%s)\n",
>                         elf->name, elf->sym[i].name,
>                         st_value, elf->sec[idx].name);
>          }
> diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
> index 06e6f87c3d80..3124469faeb4 100644
> --- a/xen/include/xen/elfstructs.h
> +++ b/xen/include/xen/elfstructs.h
> @@ -561,8 +561,8 @@ typedef struct {
>  #endif
>  
>  #if defined(ELFSIZE) && (ELFSIZE == 32)
> -#define PRIxElfAddr	"08x"
> -#define PRIuElfWord	"8u"
> +#define PRIxElfAddr 	PRIx32
> +#define PRIuElfWord 	PRIu32
>  
>  #define Elf_Ehdr	Elf32_Ehdr
>  #define Elf_Phdr	Elf32_Phdr

This part certainly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

