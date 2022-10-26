Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378560E127
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430543.682334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfoz-0005tY-3b; Wed, 26 Oct 2022 12:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430543.682334; Wed, 26 Oct 2022 12:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfoy-0005qq-Vm; Wed, 26 Oct 2022 12:47:48 +0000
Received: by outflank-mailman (input) for mailman id 430543;
 Wed, 26 Oct 2022 12:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onfox-0005qk-RE
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:47:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060.outbound.protection.outlook.com [40.107.249.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63f20c0e-552c-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 14:47:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8826.eurprd04.prod.outlook.com (2603:10a6:20b:409::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:47:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 12:47:44 +0000
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
X-Inumbo-ID: 63f20c0e-552c-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwo4mFI9ZXMFTh5eRUleTFzJ92tyYjZjXJCpXRHtgerGR2iTgJFgBUJCO5SrjcxvVAr6yUFQw0kn48WqPPTJQhNcUoJbK2RCv/k0Y67xz3nmRbDUox6dOV+vb5/Nb7jK7lLgdGbIsKZMicEHkUpw+FGY31b1fFmqEiMh+/dotBdKT4kWAfdxV1av6eLlsLiQOHo/i/OvMHl6yJnK3UQx8GqVTSBUPVIzaUfx5FEzR2ojPP4eMPbR4kfXAKumSGXTCir7en/Dr6yryjY61P3HS+VbVzgsP5Sya9qEIL2/lTsNRlQTBjLs4Mpq7Sp9RRT8Zqlk3H9+wXpF6RwZWFFONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeAsD+nm3sk4y+riIz5Mbd5zOluwHxMpYPiCG3igjCU=;
 b=K07UWEF5CgFhtsrSUZ3wXxNaQVXQfTrmfFKQgg+TchYO2ayLRGTIfh5cgn0eC2M5c+a4PkcMgDHJEgWtluBvVHzCyeWMmFqEroZuZgloq6wCDp2altHV2G5q+Env8pPhHjlnpKcDDOzces2OTsIvGN+JGMTj4E0InYlj2uPNHt80bKrUOLIM+lHB7JAq5Phrr9p2X0Ou6UrubKSBH5rNuqh2szklVF+43l2PenEpk+d4Ez08jQ3X+SzIyT/gI26nLKLjY5sHaCmA/AM1srAwZd9nAj3V2UNIYWfNFBSaS1WUU69Cybjmv94M7ZGpsURFPhtaYaEognhjM+Q7J+SnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeAsD+nm3sk4y+riIz5Mbd5zOluwHxMpYPiCG3igjCU=;
 b=31nnsZctxn7I6iYSZ9FduVbmvQDpPc/U9C57hzG3NbBh213i+7Uutj7btsHtG+aBRGu7aUFxmD48AfZdxm+YU+zxnPwWoizbRAUuZHjtPG/lz/1h+MlSDGo3+G+qTwI9XUl58XxMdAdlPwmZgn/0dSrqlDcP4CqgP10IOmMQ0EOsH4h1Jf6UZpOMTZl134SxmAynHPVlACqa3GezBOmC9/Nzy0EHJELQcVfeem3FnaCUk7PcxcqrHzn7l8sizEu2z5Dguxnj6kG04D+r1vj13KaxwigsGmLCg+MOPPuW7yorhReKuRLv3i/7mQXwxWlKDvpUWxCdV1jNbIMkwfISEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
Date: Wed, 26 Oct 2022 14:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR
 is mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025144418.66800-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 89447bc4-392c-48b2-4c9b-08dab750471f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6O0VVebZ23pYsr1+fxJdxyQy6C5m/y3Ee9uE6yW9iBaUcbS/I9KtnHM5bz1SgcSHqBXSvpuKQSw6/Ny4UE3P65n/AewB6t2IkCgHbUhsmJTgCr2cM6KsOl5bCCryANF0Q7Utkr/3lv51FarTid4q+0S+QJVH7Hk9HwZMfcym/SVrMysQ9FaecGw6M2CLkujbebYeUyNDPeF11CIe3LwH9b3Ev6ixuwtBrbMSttGkJeormE6+6VyfBPqZFh9cfPMsBplhersnkyW3PMVrW/6Pou8RT9pf/BwpJpYbTePLu+pctAANWKLZgBDLLbDsalgyfrnzlb+esXaDBnvMhrXNEyJScHRfiUGT4QRCtrHX09hXXzOVkh6qyI2d68+VvVBNax6BrccL5ln8JndejOsNmGb+pezasoFkrdu3mbsujmsSkRAxsN8ZmDiKacdBR9nH7om42YfaiZVKlbaF/1z21v5OP95TtuLmO9CRkPMtqOlmQq3mQKU47cRqqTJ9YGhKRQtwRBTwWOgFfry6TKZfRhTgmMDcg2Bl+iHJHgc7qQ9o2L0+vII9TLcY879vdby454N+a7NxPe9twwVZ214PzhrSQ8figa7kqw3dPQUZ8/6Ad2C9ls/1nz+ePAshPggV6Odq4iXEx8GMgj3KbxGa0tAicO/+JkmfdkQzyo/R+RS2yWtLoqZ/vdUQk9J2TL/5ZJgt7Z2b06IFGPF8mTHFvZLG4QHKGoFtGc8yMph3M5qVBCfL/+nfPDv/ajh3Cw8yRQGkNuc0nFyvt8mSqp+/rg9VS/x4vxiDH5j5nzLErFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(31686004)(83380400001)(86362001)(31696002)(2906002)(2616005)(5660300002)(186003)(6486002)(316002)(6506007)(26005)(38100700002)(66476007)(41300700001)(8936002)(66946007)(8676002)(66556008)(4326008)(53546011)(6916009)(6512007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnE5YWRZRWZyNlpiNjh2L0ZsU0dTUkxXeU9ZV0hXMVVKeTcycWlLaDdRemIz?=
 =?utf-8?B?RTZ5TjNOL1JTdzJway9LdTBtOTlFYTlYVDN3UGhLa05sUWJKL1ZjM3E3Ylpr?=
 =?utf-8?B?R2VScCtHSDNPUHo5NHVZQnpkbWFOMmhUSCtYdEM2WGxwV2NTc2FYb0NoZGFi?=
 =?utf-8?B?NnNtd2VleTVKNWw4L0ZSRCtzTXVXNXlZb2p5cW45bzd2YVdkSXREdGFiaG0x?=
 =?utf-8?B?c2JTZFBRWlYydG01NEdhaE5vR1pPbmRrM1pVNDY4Sy9ibEdlNmluS0NFZ094?=
 =?utf-8?B?WXNnZzBmM2Z3NVFVaDBEbkp1UUU1VU1VMkNpU2xiRmVOSDBJY25rY1R2aHN1?=
 =?utf-8?B?eTk3WDRoTHowK2xsS2p0TTVLMEVMdE9URmFvWWt2V0VuY1kvSmUxNE5nOFYz?=
 =?utf-8?B?M0x3U3JHaDMwbXEwNEU2WnBVYmpiK3NGTTZLRlVWOTgrWkZYeGxweDl6MFZa?=
 =?utf-8?B?djUrYlJTK0R2RVJTSHpBZXhFMU5JT0lpRFlLNE00VmF3SHVtV2dpT284REhU?=
 =?utf-8?B?Q0RMNEFmaFVHZ2xGK1hwV1RnYjFXdGdndWE1eThNZ29Zd2p5ekdQb0U3RDV3?=
 =?utf-8?B?UlR4ZUhxY1NmWEhwODcycytzUDFSOHhDWnBnelk0SldETHBsMExTS1JHTWR6?=
 =?utf-8?B?azlSVXlLNlU5T3ByYWhoNVFYQ29zKzRDQXUwMDdVanFIaFFXdnZJc1ZWMnc3?=
 =?utf-8?B?N0pmbkxuVmNlcnZpU3JhQklLdmlwVy8vc2s4SlVYV04yZVMyTTJhZzBQQ0R0?=
 =?utf-8?B?b0V5MmRLM0dyYU5PaExzUFRMNU9pcWZVYXJKaXczZnNBbDFTVFNlRWY5cERJ?=
 =?utf-8?B?U1pxVTM2c3IzL2VLRjNRMVpRdHhxVVFZS0NhM1BwSFoyem54bHVKZytGME4w?=
 =?utf-8?B?a3JwMzRYTUIvMTJwZjZ0N1lsMkpWYW44OC80Z09TNkhiMU5EYlB1MTdPVkY2?=
 =?utf-8?B?QS8yZ3lGSXdaNUExemU1YmhxOUJsZjJDZXFqZ1hReWdrd0cxemhrbTRVbk5s?=
 =?utf-8?B?bG0ycVJpbzRxSWs2dDkzbWlyU2wyV0JUdDZxcDZXM3hSVTZPT0tzS2hCdnBn?=
 =?utf-8?B?Mmpqa01tV3JFSC9QMGFZQ0R6YlptRHBXTTVUcFVaU2RUSmpHU1dORFhPNzB3?=
 =?utf-8?B?UmZ4d1NoZVhmN0VJYStmMzJQa00yL1dLN1R0TEJGK0Y4dWtaOXBqNTlDK2p5?=
 =?utf-8?B?QkpGL0hFSEJucm1DbnhHa0JhM0NWN0J6SFltUlkxdDhwTHVHbjhFd3BieWpr?=
 =?utf-8?B?dnZncDNEMFgvWHFnUGVsbTMvQitUVjdyUGNXVmZGQlg3dDlhRndsc1JXVjdr?=
 =?utf-8?B?WjlDM0RnNVRlYkhRVXBkdzc5eGh5MXBVS2JuZ01xVlZsMnR5ZDlzbmRjVWtu?=
 =?utf-8?B?WFVVb1NBM0lZa1J0Z2FpMEg1SW5taEJweUZCd3R4YTRLczVvMm93c0tLaDVo?=
 =?utf-8?B?MjdVb1ltVnZWcTlXcHFrUFUvZTZ0bCtjci9NWW9Eem9wd0EzZEtpZ3Y1dzhS?=
 =?utf-8?B?cGszNDAzTHREcFZEWERJVGw2YTRVM0FOdVJjbWRWMnpNMStPVW9sWmlQNUlj?=
 =?utf-8?B?TGQ1VURwWmxnR1UvYm1RWExoeCtNRkJJVHB3TTZWSkg2QkFzaDNCUDlIUGJT?=
 =?utf-8?B?T0JMT1lBQ3JwMHdiRHJzb04vaXVXYXVpNTlrYVdTeEgrNFlVRUZBakRaTWhI?=
 =?utf-8?B?R2o5N3pRVXlYeXVJMnR6eTlvcXBIVTFuR1VobTIrd01hbjV4UFhneWx2aGg2?=
 =?utf-8?B?MDl1SC9UMHpMUEY3ci9neUpwZVRkbUJEUlJpMFZ5QnllcHhtUFBGVDdFaWhU?=
 =?utf-8?B?OTVFTkZJS3o0d0xRbUQ5dnZSNXZHT1VSQ3YvUnp2emlNYW9QZTVTdXc4TnJx?=
 =?utf-8?B?YVVqNVljeS96bisrUnlydHprNHZlZG1MSEsxTy9hWk5scTlWSTVQekp3eHFm?=
 =?utf-8?B?TjNKa0k1SDI5bmhERzBpcVpBL0JYL09mZjdhU3RadHVHVEhLdGlwZWJuMGdq?=
 =?utf-8?B?SS9KTG0rU0E4cnRvWG5IVExOdjRPaG40UmVZMmtwSmFXeHdONW9DYU9PaHdQ?=
 =?utf-8?B?YUFsQU9mZFB5aDJ2MkU1dWxTNmVSNytoVXd3YXRKRmpiRk9Td2tDWnpWQVZU?=
 =?utf-8?Q?PEvyIbxOp/KtSmVoJznt7h3uu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89447bc4-392c-48b2-4c9b-08dab750471f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:47:44.6096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBWP90WpZuKx+eb9uu2VixuBsqh+WwXHu1cjjSKnNgJ/HzJ96oeM35UpeNYda/KDbguSPxHNb7nJ9HxQWWUPKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8826

On 25.10.2022 16:44, Roger Pau Monne wrote:
> Writes to the BARs are ignored if memory decoding is enabled for the
> device, and the same happen with ROM BARs if the write is an attempt
> to change the position of the BAR without disabling it first.
> 
> The reason of ignoring such writes is a limitation in Xen, as it would
> need to unmap the BAR, change the address, and remap the BAR at the
> new position, which the current logic doesn't support.
> 
> Some devices however seem to (wrongly) have the memory decoding bit
> hardcoded to enabled, and attempts to disable it don't get reflected
> on the command register.
> 
> This causes issues for well behaved guests that disable memory
> decoding and then try to size the BARs, as vPCI will think memory
> decoding is still enabled and ignore the write.

Just to avoid misunderstandings: "guests" here includes Dom0? In such
cases we typically prefer to say "domains". This then also affects
the next (final) paragraph.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -128,7 +128,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      }
>  
>      if ( !rom_only )
> +    {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +        header->bars_mapped = map;
> +    }
>      else
>          ASSERT_UNREACHABLE();
>  }
> @@ -355,13 +358,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>  {
> -    uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> +    struct vpci_header *header = data;
>  
>      /*
>       * Let Dom0 play with all the bits directly except for the memory
>       * decoding one.
>       */
> -    if ( (cmd ^ current_cmd) & PCI_COMMAND_MEMORY )
> +    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
>          /*
>           * Ignore the error. No memory has been added or removed from the p2m
>           * (because the actual p2m changes are deferred in defer_map) and the
> @@ -388,12 +391,12 @@ static void cf_check bar_write(
>      else
>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>  
> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> +    if ( bar->enabled )

In 3 of the 4 cases you use header->bars_mapped as replacement. Since it's
not clear to me why you don't here, could you explain this to me? (I'm
therefore undecided whether this is merely a cosmetic [consistency] issue.)

>      {
>          /* If the value written is the current one avoid printing a warning. */
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>              gprintk(XENLOG_WARNING,
> -                    "%pp: ignored BAR %zu write with memory decoding enabled\n",
> +                    "%pp: ignored BAR %zu write while mapped\n",
>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>          return;
>      }
> @@ -422,13 +425,12 @@ static void cf_check rom_write(
>  {
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *rom = data;
> -    uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>      bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
>  
> -    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
> +    if ( header->bars_mapped && header->rom_enabled && new_enabled )
>      {
>          gprintk(XENLOG_WARNING,
> -                "%pp: ignored ROM BAR write with memory decoding enabled\n",
> +                "%pp: ignored ROM BAR write while mapped\n",
>                  &pdev->sbdf);
>          return;
>      }
> @@ -440,7 +442,7 @@ static void cf_check rom_write(
>           */
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  
> -    if ( !(cmd & PCI_COMMAND_MEMORY) || header->rom_enabled == new_enabled )
> +    if ( !header->bars_mapped || header->rom_enabled == new_enabled )
>      {
>          /* Just update the ROM BAR field. */
>          header->rom_enabled = new_enabled;


