Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1880A6ED02F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525436.816631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqx25-0000Yx-65; Mon, 24 Apr 2023 14:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525436.816631; Mon, 24 Apr 2023 14:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqx25-0000XG-2z; Mon, 24 Apr 2023 14:19:09 +0000
Received: by outflank-mailman (input) for mailman id 525436;
 Mon, 24 Apr 2023 14:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqx23-0000Wl-Ln
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:19:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8029665-e2aa-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:19:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:19:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:19:03 +0000
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
X-Inumbo-ID: f8029665-e2aa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXmh0/GEMJx7IhIBIidUhaoHkRCOKNhG/01qd8ezWcZINbAcKroMz6Q8Vg+PKi3r0UzJkhjpeuXPGsU2Z2YnEm1iG+IPZekaU5DQguRgvdSANaGN1gW3nyyd+uP/svZa1fWDT+nEGukGgWmxLYtthhhbTvznvci/JgYLgkWxyOWOj631QL0wmOltjaCFoC3604aCj+5CXuox3PpikvXrtpuGaOYZJ1f7ROqn9y/Ne/FqBhhea+PE0hFKOeX0IVnw/2tJVRoWm99On3Ko5cOcGWbqSRykRoZbuq8ykyFEjFpIdPDGlZZZGLKBjDwrJzVE+kQjvAREHQuYpdNCHEEbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rnbx5yThSfBBNczVjIzAkUl722Qr8yiBHpP9VeIVII=;
 b=V5Rcy0EY4Rzf1TngI3On7gPkHxyG2mI1KalkQeH1YeQBHfddbHxZYd4JhfnKgjaZfXkpMFdXFAO2zSuJOdER9x3nqk4S9vBbpkNoJRcD/as6ynGKeccQQCKMsABRSwbl+rRlQeW2gsMTroWZvIylfoE8NZYfRi0VAh06zQo7Bgcpoalt6aWjqGbKvWjXbRD203ZzH/VALfMu6MaDGWU+D56N8BMeJ312EuC8rXtsUMRkzrFEXlVgZT9dl8lL7Yd7OkTLokTtgOFcNKr2PdZIrNVWNI7yyyz/kx/XeVQvnXUx4Un84Nxx58tYnSE65ySvghzuPFyVwSCuQEjVn8YBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rnbx5yThSfBBNczVjIzAkUl722Qr8yiBHpP9VeIVII=;
 b=dUH33Od6t8Nssy9pvoItr3AFbNJoAg8+TVg3HErDzfdckni6EMo18NKWewpe3vZjo2yI92TPLZQSRsaA5naK06P0h1jwgwOkIcclkTTtZbpDjKF4UkxCwae7I2Ql/icx/NZhWcrKQHL11zZxKSF67rFbZTq7Nj3ue7RWYdbsr0ADS0C79NWTwO5/6DdXFvdYe1La+G6ZNxpSfDL3qDJXd1HDA/53wxlHvmzq9XhEicur3KpJOeikz69d3yuzjMltSO3JkLeCgHvQWtSsZqycihSGlEZQ4pukp/f2moxQcN7NdKr6ZBkn871+3765nQKCuZzw6eci640QzV+eyu/DgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com>
Date: Mon, 24 Apr 2023 16:19:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea03319-1a8c-4db1-c062-08db44cedad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MPa23qLrLo4g5BYBi5ofqwVSW1Tb+QVTdOTXUNdpQU83kf6X1bDvQrkd8tgygYJJ3aBeAJ+GwKyPYCaEAWPYN/FR9dcW2rz23OBNiMRQPstazE++8ssCnOQVIZwJz/QtogAye6kB1yRWXyvoVPw/XhUlROOG/A4D5vqdTgWNQY8RaYCGEvxmJCAG4+oICL2R4TBVZjikMZRgwx+N1BoqtjE+2kSbC70SPigSRzM8JZSKd76BpFGGvedK8z7UK+WJZZdSGt3ZeYXB5gmDP+xEt0jiProLYwLWmuuEuCZR4I0rdcJmZA696tTE99VoDdYXtcMiSYQiDxbJuGvw+x6Wov6GCkEynSDt/hp2B4iAfDMVHpP2Om9UWZVrQ3HLThOX7wdY/vSnbbRd69sLeX0AJZrjTuIZy+3PL6e/HirFbkNcUa6zjVT0kHehLftZ/LLGy2huEpuSt2uQfu4NrFGNudUwIvCpm7xF/oKTBqUJAd5URKKjKcqit9uBEqMmL0HwOgquQKhaCB0FaQ/lQAxxQIJiQrTSNEVIRskGv4y6rUCXC/nAjR4BEHtam2y2FAMZxgh91gMmpRoymUVgKbtAfR5bgHMUi0KpOe/bAM/9hTWb7pWWr9A51qm3WdIhKnQyWjDplRU4S4lEuRFN0NwLDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(38100700002)(6506007)(6512007)(53546011)(26005)(2616005)(186003)(83380400001)(66574015)(2906002)(8676002)(8936002)(5660300002)(36756003)(54906003)(478600001)(6486002)(110136005)(316002)(4326008)(41300700001)(66556008)(31696002)(66946007)(86362001)(66476007)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmdPRVVtRkFDK2Y1TkZRYlRyajdGUkpmZGtKZzhVNkk1ci8wM0UvQTN1Mmlw?=
 =?utf-8?B?eGRuYjVKUnlYZUFLUmpZM2RmUjl3MEYwaVVhdUVDOXI4bHBKK1JObDFONFN3?=
 =?utf-8?B?YUphWkhmWWh1aTB5Sy9hUEVpZ05nQW1WS0pTd2hwSE81enZEVjU0cTduVWIr?=
 =?utf-8?B?ZTd0UEZLMUN3NHZqbC9pRDZ3QXRURjdzR1FsY1hlZ3RLckVxTm5WRlNCWkNU?=
 =?utf-8?B?dk5YVVAvWjNmZUlqajBVV25NWmdidy8rc1k5ZFlsdVk1WkZrS1pzV29aRnBB?=
 =?utf-8?B?c1orMUNuU1JkbitsamhxSUVmcXExSGRwSExFRmFBZUlvSUs4dTRpMG1SZEE3?=
 =?utf-8?B?UXBwWkI5ZmJ3ZXBacXpYN0NtdG9ON0QwdVpUYjZNSTFveVVQY25BK2d0aVUy?=
 =?utf-8?B?bVBESWhKaVJ3TnNSQ3RXc1BhcGlzMndHOGZrVFdlY3RaUFZiMUpUd2x6M0Fv?=
 =?utf-8?B?NEljclI1eVgxdnc5VXdxMi9ZNFU5V00zL1JzbHZOa1E5dEZ0M2RxVWJLUUVT?=
 =?utf-8?B?TEhvMkNqSDlHK2FTOEEzWW9KQWxnODV4TEhLVXNtNEkrZkU5U3RyQVVwY1hB?=
 =?utf-8?B?Z0NCR2FNRGJRTHVIeEU5eEJPMzZXTFA1TUhJZzJpaTc2Zk5hdWR1ZjR1aEk5?=
 =?utf-8?B?RFNFbWdwcENBdEZBa3FKdzA3UG41bzR3N2hWKzFrY0k0MHRCOHI4bjIzMDdK?=
 =?utf-8?B?eTk3d3NqZThFeldKVmhkeHl4SlFxd0ZCSi9zeFI5TU42K3lNR1ZpTkIxbGdh?=
 =?utf-8?B?RDRVS1ZWUjBEYTFFcm5PVFR5L1R4Rk0rbnVsVUo1ZVNkY0JGUTllS2ExL1Nr?=
 =?utf-8?B?R0owemVUOXlSUlBVT2FUbU95cjZUZjJOalhzTWxwT2haWUh2MGwyblN4SktL?=
 =?utf-8?B?TmhyMjJpRzFsSm1nbG95dElnQzV6dTQvL0dQTTFJZWNmeGFkdlRVNUF1OU5k?=
 =?utf-8?B?NGtqd09oWE9tc3NIU01QdHl3L3N1UXdNcFVMcjY4aXNVcmtJQ1Y2djEyQnYz?=
 =?utf-8?B?eE5PQWFqdDB6K1pERFZHUzRZOW9KdHlCdkd2MXV6R1NhVVk2RkxHUnZibVEx?=
 =?utf-8?B?SW9Jbm5weWlzWGszMHJRcWRtbHl4Sy9qTWNDUkNmejVjVjk5L213b2Jvd0Nx?=
 =?utf-8?B?cnV4SEI4M0lmSU9YTlc2U0Mvd3VGcUlzd1VWSXlKcVREVEVaZFdWUUdPU0Q4?=
 =?utf-8?B?RVprNVk0d2FuSWZkczBNT2M1MS9MaS83M0c5b2hJc1ZMcEYxR1plalJ5YlRT?=
 =?utf-8?B?R2xPa0NiUXphdWttSHNzV0VVVkYwWVM4VHJiR0xpV1RxSnlyYzFPeWtCbE9o?=
 =?utf-8?B?WnRMejY0cGFDSUR1N3JrWjVUWEd4U1FMMjFzNUlZcW1KRnVqeTFqZHBTZUxv?=
 =?utf-8?B?OHJBREY0bCs5ZGtZLzIxTG0yWjNWWlFwVWoyUU1aZDh3Uk5ydWVWd1lTL2xY?=
 =?utf-8?B?czgrQVFXUVNDVkNaMTJncm1TUHVSUENQQ1lQTGVrNFpwaUdjT3RVZUQycGZU?=
 =?utf-8?B?ajU2TklrcGtyblJqcjlid2I2dmtKSjJ0dnI5SERmNk5KUnV1d0FGTzBuS2d3?=
 =?utf-8?B?ZkplaXdVWm9wR21lYTZoelptanJhQ1JwMnh5MWlVZzA3Q0F5eTZsQWZwT1RW?=
 =?utf-8?B?NXpNbUFPbVN6bVhFbHBvQjhSZDZ2dXIzV1hvWllRbm5Ib2RqZlB5L1FoTFJz?=
 =?utf-8?B?MDhzdE9TUlA4SktqZlRMay9qWlc1TnhxUDhPaGpGUHdHdVIvTFVES2pUb1FU?=
 =?utf-8?B?UlhRR2xBYVhpcCtuSE5kSy9CdWpVQkRKU1F4RDBETkNyRnhKUWtBcXhiREZC?=
 =?utf-8?B?MWxJc1RkYkk2ZGFyN3hEM2FvYXhLeG9aYlkwK2pJcktadDJDdFRWbXNza3B6?=
 =?utf-8?B?ZjFpWCszNVhIeTREdnAzT240dDEwTWNscjhPSnBNekQ1T1FCNTZhbHBLZkdx?=
 =?utf-8?B?QUYzQ2dkenhaVm5FcjVncmRqeTdGYS96eFovTForVFM5aXI0c2gvbmk3ZEda?=
 =?utf-8?B?eElIRTRZcXk4VDNTaEQzeEhnZGZGWHN0ZEVvdG1yYU5DVVplcGFTWUVFMkQ2?=
 =?utf-8?B?SFlJaVVOb2xzM1VXMUFoZUFLOXMvRitHSVFIdnljS25WQlZXNW5KNHR5c2w4?=
 =?utf-8?Q?AjhXu8SPmf1kf0DGTcD+melC7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea03319-1a8c-4db1-c062-08db44cedad9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:19:03.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc79pOtpCFvXs9JuI0p7UxbsKYZq51E1EfkDOoaCRiC2z5cmUkwUXrENXWvAKnFWrYmHxQp7eeh7JSlMm4A+dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978

On 06.04.2023 05:57, Marek Marczykowski-Górecki wrote:
> Some firmware/devices are found to not reset MSI-X properly, leaving
> MASKALL set. Jason reports on his machine MASKALL persists through a
> warm reboot, but is cleared on cold boot. Xen relies on initial state
> being MASKALL clear. Especially, pci_reset_msix_state() assumes if
> MASKALL is set, it was Xen setting it due to msix->host_maskall or
> msix->guest_maskall. Clearing just MASKALL might be unsafe if ENABLE is
> set, so clear them both.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a couple of nits (which I'd be happy to address while
committing, so long as you agree). First one being on the last
sentence above: It's surely not just "might"; if resetting already
doesn't work right, nothing says that the individual mask bit all
end up set. Clearing ENABLE as well is only natural imo, if we
already need to fix up after firmware. So maybe "Even if so far not
observed to be left set, clear ENABLE as well"?

> --- a/xen/drivers/passthrough/msi.c
> +++ b/xen/drivers/passthrough/msi.c
> @@ -46,6 +46,23 @@ int pdev_msi_init(struct pci_dev *pdev)
>          spin_lock_init(&msix->table_lock);
>  
>          ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +
> +        if ( ctrl & (PCI_MSIX_FLAGS_MASKALL|PCI_MSIX_FLAGS_ENABLE) )

Style (missing blanks around |; once more below).

> +        {
> +            /*
> +             * pci_reset_msix_state() relies on MASKALL not being set
> +             * initially, clear it (and ENABLE too - for safety), to meet that
> +             * expectation.
> +             */
> +            printk(XENLOG_WARNING
> +                   "%pp: unexpected initial MSI-X state (MASKALL=%d, ENABLE=%d), fixing\n",
> +                   &pdev->sbdf,
> +                   (ctrl & PCI_MSIX_FLAGS_MASKALL) ? 1 : 0,
> +                   (ctrl & PCI_MSIX_FLAGS_ENABLE) ? 1 : 0);

Our "canonical" way of dealing with this is !!(x & y).

> +            ctrl &= ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
> +            pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
> +        }
> +
>          msix->nr_entries = msix_table_size(ctrl);
>  
>          pdev->msix = msix;


Aiui there's no dependency here on the earlier patches in the series;
please confirm (or otherwise).

Jason - any chance of getting a Tested-by: from you?

Jan

