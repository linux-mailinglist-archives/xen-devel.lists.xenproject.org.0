Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7A6B9BCF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509750.786147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7gB-0000xk-7d; Tue, 14 Mar 2023 16:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509750.786147; Tue, 14 Mar 2023 16:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7gB-0000uY-3q; Tue, 14 Mar 2023 16:39:15 +0000
Received: by outflank-mailman (input) for mailman id 509750;
 Tue, 14 Mar 2023 16:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7g9-0000tk-GS
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:39:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf4a8caa-c286-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:39:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8228.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 16:39:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:39:08 +0000
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
X-Inumbo-ID: bf4a8caa-c286-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzrth0xW+i0/voaI4EeEPKJlqdEUtNWC/2sye0KD+Mxp2il30q6dfEK6Vez3IJX1TuNLhwFqiYE9eyde0Lr9+jRbQfKDNtM/WztQFiD2d1E6nmRgjwLvE73USz4iMosEOL8Bvahbpg3ElI3TjN9muWNrI6mmkqcvBbNa5sVXp7nDgGSi6xNN6kBn0syq1zMhCwOn+1X6eLUfdpqUFWGgd+h2dIseKoTWNNbQyN6Mmka/FwKxpcy/y9Y6s2+97Ggxd5Iyo53lyRaHow+YGGrxK5O23Av8UGzV/rdPsti1SU/tdL2vOnsHbUVf1v41TJ3v/leSSsP3puh9vUvvplPN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHDsEukHx1udBc03lZTNtRUsmtrmbaZA4f4XqzD8mWU=;
 b=JE6E2C7wUvC7iPR3t5fjAcvBI4Q1VIDRaLvHSpc8pTROVzVzoFtHjdOgw2kRNplawmwdfxCbgLa/Odx/ZcL3YnbcthIL4hfO5sgm4qQlQiIWOstpQQjrJcaKuoSQXkp1vE7JPfYDI/Nf0v3I5Kn5Xd7qNp4ZUeArkJb08hDEnCMhKT3TE8Ld67YBVOrOFPrprQh8dktI8Ewk42UUU1pxckGv9nQtRSefigbolm4Jc7tvK+0srGXtduYhQ9/zHJFY0rpSBdPse8BtZ3zQ8bgOfMKoqBoNGfEVJZ7C9bhtG8ZhWddLyYqgKMI+5xC0vQHL1HfV+pBhLW/gWIfb8AHsug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHDsEukHx1udBc03lZTNtRUsmtrmbaZA4f4XqzD8mWU=;
 b=veM98UVU+O61tbqBl/yExU3UIZRUjkFL3umHoPxuuFwImMZ5cJ45SP7E/myaU1QoCG22bTicpXoSalyMgWFNlVqyEL9TSJicFvu7AyWG5NcCWVgVrTwqCPUVlJWgoaQ3od0rZh/hUNJmCxP6FXjB9hmECgeBjZFVFo2Try8p4QYLcejty9JCYjYzIfkFFH3OEPjW21ba9WplxWcHqqnsivqFPAcs1KEw0cCWuNX267CgmQE2im8oIS3avB3FM8o6WatcflsyxsxYqyT+V2hG7K/PMKcUCnkbdZflPSsEN1rtKXjJcD8LVQtHDjXhEsWd1DDOBXAxon+R0I/WGnwdmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4942e37-48a2-1c77-cdab-d54ef9a8b55b@suse.com>
Date: Tue, 14 Mar 2023 17:39:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230312075455.450187-7-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0d5d55-adc6-4e11-3ffc-08db24aaa219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e96W49zqHeJc2H9/MaRNPW41tFUiuvfU0IwZXMXhmOZdjmspjdkWNokX9qGAhhQkwKIGcBdKBETqST9r7RTGVbvFb4BYKHqzuV/46vDaLRT56yO8hDs32Etg5g862b61Ps8SvLxrTonxzw1mLPv2dES4aK/qhEHGkxdsZxoNUh18WcnKKFNBkoL9uJixyI8FioceiHOQ+ZJOQHb6qZMQaBejFa6gXfJMch1GOKK2zOQPuNp6zdr7ONGmqMAQ00Agx5SWofmM5sr3lIgFLvax891crMxH5LEsoB7/7IkRvTdY7VoMFu8KEZ8QjMEKPeCHfPBdMZGL9J6MqPFfsHgxyf61/YVDbqvRfFgkzacaFKab6WqvaiuFLWDt9dBZaEXrcNPhvDitU6GolBRXv7OrTMC+tnSZKgRQ0f12CM8WLULbX8I7aIF8Wmr7HeLePkHK7pV7sWmKvxGjG28CZ6V2wgF2HGAMijS7y5PrPByNw8HQQje56a0bkrYkJryUEL1OTnpC5f8OS9s1It6C0rwdCriNzMucL+oInKXC3B7WDJdjFBauzetbOIErcUt8US16eV76tu0XTjsJyhhcoY+2qo/xeCpKuRQlNOfbF2G1+iEFCNJ7yMdWzZNHLKDjdul0iFK2URqYs3s8mP/IESb1f80ANZyjFCTzSXKbVUX56VrZZ8TZIHVaySBUeplDfrylMKa3LoIU5d2nRgcx64avoNhXnNKyh5ZHa8bXt1RgMkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(36756003)(54906003)(316002)(26005)(6506007)(53546011)(6512007)(2616005)(186003)(6486002)(8936002)(7416002)(5660300002)(41300700001)(31696002)(4744005)(86362001)(66476007)(2906002)(66556008)(478600001)(4326008)(6916009)(8676002)(66946007)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnRUZFZqSGdwamkyNmZacFFPOGlWQW0zMU5ZTWE5clFGR3ZxaWRDOGM3NCtr?=
 =?utf-8?B?bEVmUnZOMXF3WitYeDFHQU9xSzF0blJqQ0JTeEFvbVpScHRqUjB3OFh5YUR4?=
 =?utf-8?B?Z2dKL1hZUy9qZ3BtQWNZdExvanFJcHBSNnBVT2VkSWVLRVpNV3E2emUrUUdR?=
 =?utf-8?B?eEE4VUEwRmJQTEJFNnpOczMvWHhXb0pZejU5QTdhWksrdDd5R1p5bkRDcmVN?=
 =?utf-8?B?cW9obHAyZ1J5bDNuaFFHNm1ST0dtZmhHdjUycklWT0NkODJFa28xZS9wZnhu?=
 =?utf-8?B?NjhEWDJIUXp6VnIrQi9NNEpBbUIvSEFkaVFvY281M0MxSXZKMlNEQXhoOXVR?=
 =?utf-8?B?MUpEZG9xczFPMmZVZnJlZnBYZUJPREdheGtEWThzSGJQaWJLZmc3MEFwRFdk?=
 =?utf-8?B?Mm5JQ25SZTA1dzMxUnZ0VE5JS1ZVVXpqUVBkYzdXd0JMUEc3KzdFL3lITWpv?=
 =?utf-8?B?Qmpaa2tEOThYL3dHNUd4SVZGTTNhK1RzampidDlzL1RJWUVYM1h5OE5sVVhJ?=
 =?utf-8?B?OWl0ZkpEdFp4amQ4R0xLUnlsLzNnQXJKVEhzdlNpK3liRXI5cno3bVVobld3?=
 =?utf-8?B?QUpINERzZ1IwWGVSbUZYMGx1Mk5qUHpwZGd1a3FXY0VFa001ck9kcXN5V0x6?=
 =?utf-8?B?RWNDbGxiTXRwMGxSaGxMbWc4K2VUT2FzRFpydnFiRm5Ka0pxSG03N1IyRmMr?=
 =?utf-8?B?SGk3Zm1XZml6L2ZKbW96QUF5NW5jNStPNUszU0ZTQTJRUTlrTmtaSzdSQlEy?=
 =?utf-8?B?cVJ5b1A5blRSNnBCVWFBZmhRK1luUS9jVVVTRjQxQUcvNUlaajJFVzhwckhy?=
 =?utf-8?B?eDhJZlFVM0x5RFV0aktVREN5TU13bThoZVNsNzFlTkZkeWFKSEI4UThINlls?=
 =?utf-8?B?MDZGcXVhNS94NG5xTlYxL1pRODltYTJZL3ptaE8xZldhL0RkRlBpMTZTSU9x?=
 =?utf-8?B?T3h1ZW5sZ0VTMmpHcnh5dnorZ2lnK0xTZGhhVWszNzZjTnRrODgvRFVKMzVY?=
 =?utf-8?B?V1JEOXh0TjNidnh6NWFpTVlFOUZ4eldqTXZjaE4wUXBxVmliQmZ0RHVRL0d0?=
 =?utf-8?B?YXhTNDdIUW4yWG8yZ1RnQXZKd29TdHc2bXJxbVJDK2xPZWh1YUVmZXRoVjFT?=
 =?utf-8?B?MlQrNjNic3B0WHh4cklNYk9TajljVUhrWHhhZGxFYU9BeHdORXU5V3FEQ3ZL?=
 =?utf-8?B?clgvQlhFRW0rWnV1MU1zU2JXNHdtMzZaL3pBajBDWkxXTDdDMFpmMXcxS1ox?=
 =?utf-8?B?WDhNa1NhYVpLWDVDbEZ1SUFyVlVVMER1bTg4dVdqVFlQVW1Vams4RURIVVRs?=
 =?utf-8?B?VUtLdG9RTnFlLzNvN0lNbGttelEvUHFlSTlqT2pLelh3NkFtTHI2UXhKTXdh?=
 =?utf-8?B?d0FBbk84LzkwUFFVSEFGN1dKTm9Dcnk0bzJSMDB3aEt3ejNkbkFGRmtvMldR?=
 =?utf-8?B?VFNUa1k1SlJiUEN6c2tmWktOVm5sOVlTSDlxSWJMUTlJdks5cExLMWtxZmho?=
 =?utf-8?B?cEVDZUpubUdlUHpCaGhBbjM1ZVl0bkQvQ0JqaGUyZUdSSHNidUNVWVdUR3Fp?=
 =?utf-8?B?VllKVmM1ZWFJL0Q4MXlic0h3LytkTXVmTFRWNHIwU1pWVW5KR2JXT0hhb3hU?=
 =?utf-8?B?N0JxM0RxT3NhWjFYZVQvbCtmZWtsNmxWbEQ2ek5vRGpDTkRNeHNZbm5jNWlO?=
 =?utf-8?B?UjVjNC94TXBGYjNxRllzNEhiZlVaRldwL2V5K0NxU2lIWnpGaitUNGxWUEdH?=
 =?utf-8?B?V01DdjdPZkxCWkEvT1dLdndHTGlCelhVTjVTbG9sNVNZV29OUlc4N1kvUmIw?=
 =?utf-8?B?Z255S3VmZU8wcnJOdUFUYndGK1o0OG82RmJ3T1ZmK203ekl1Z1BrUitsYXUx?=
 =?utf-8?B?aXZTRFlzVWpUUi9nOTFVMkoxUUppTWVuVDFaUmZCUHlVeDIyT1N6Y3pRNis1?=
 =?utf-8?B?RWQrd0JITW5scnNSSGhiUm04SnZNdlJEbzJKRnl0QjN4OS9kbCtrZStpbnFn?=
 =?utf-8?B?YU1DV1pGdjkxQmwwN040ajlsVlk4Y0o2bDJ5allRaVQzRk1raDlFWUtwbmJR?=
 =?utf-8?B?NGNrNVJoOFI0YVdFenJpV2VzT0phdzBTeVN0eXNtM3Nlb3ZBQW8ySDF2T2RM?=
 =?utf-8?Q?blfgJYNhOYvzXaao/8MPj5w3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0d5d55-adc6-4e11-3ffc-08db24aaa219
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:39:08.7223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k0N26NDwcgRIsRXf+orpSLinGYM9N2Wr/zqX96FBCbfgcUFBZbkoxVnCDOdkwnNF+m25cUWmzo3qvlmznTgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8228

On 12.03.2023 08:54, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> Use new xc_physdev_gsi_from_irq to get the GSI number

Apart from again the "Why?", ...

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>          if (r < 0) {
>              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",

... aren't you breaking existing use cases this way?

Jan

