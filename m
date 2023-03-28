Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8D6CBFE4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515786.798953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8qa-0001Xy-ED; Tue, 28 Mar 2023 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515786.798953; Tue, 28 Mar 2023 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8qa-0001Ux-BS; Tue, 28 Mar 2023 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 515786;
 Tue, 28 Mar 2023 12:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph8qY-0001Un-QK
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:54:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b41c94da-cd67-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 14:54:41 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8354.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 12:54:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 12:54:39 +0000
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
X-Inumbo-ID: b41c94da-cd67-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5ZtpSObE0Ig5cxQ7hO1YKC4+cds7fPuYmpWhJ1XvYD6kgkJvN0yCLexF1ahCh2jgvax5LDwQNeYaFO9Yy4qATBeurb73Qj+sSj3umW8G1a62oJxiLLopMsWptQsbTmDei92oPp1JbADT493znruyxt3DC8xmFbi0LcawkbjyxU9B/FO108O/wIt0vSNnPdUy79amG5RaHSrmtVAKy7dJkGuzuCf2rGu35vngeDfuQX6Nj467DtSXafChwOzQKFK7glQ2zZ88Clez3Mp6zjleTq7DOPry1kwjz6xhUNajctGG7FNKBxBMmjlLc0e8f5zvgVpqYPb61YF+k+lEsA8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIxMtcO8FGXRErZNwVX/JZutpjwl7UgT8b+v9lvMKxY=;
 b=nlbbg4O1qaACxVDadp35OouYl1AcMZ34OJv0JdsP0G1LTlzcV1m+tjILFL0AM8wr6ha5wBAKCL4MK5McaG/DxWJU2o6B4TL6+EdehAwTyXL3pjCAtlKH7qJRYi/6p1YDljKPd5ikZaRbKuWcRPZsbVUe7ZYRq/YWYfQQw6MPUhzr8UTg6q+8B+XDFKB2NEgP5ZU0xrdmBGxD0eYZleyEmHf/+ARw3gJ+ZZuSxZEBv3LZxF6a4YPOTJg1aocEg0T4eEsDnBJO95q1+oeEsW0ym83c0Bczt73wRZ7klhjK6xtwBHMIIJ3TdV2/OSltYD05mc3A+g7v9ca9hyRtAmvy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIxMtcO8FGXRErZNwVX/JZutpjwl7UgT8b+v9lvMKxY=;
 b=oAlhhdjOb6cSj+MKx72nQBzPnAzD1dE9dlWmlptDQpqilSW/L6h/PJB8hOAuQojPwidx8WA+kIans1lwS0ewyZCRsHKBrBe5jGECNUl2x9kqhkcU3udkFMi38XBWst3ySY8CksYQ8prNBBJfHv5nUEcd6xAXWUV/jRXERCGAAoEDtkANVRuqjSUtcnaNqcUwf7GSFKzz+zeBdPE6eF5n2CP2x9QIu/pa5YqGZ5Pz1NMR//CUt0wBhpEkSdJwmwT+0a6nRuo+t53ukGyeyyEqeKX1TVzlyXQA2QaCvmSAi2Ce8Z0eI8PTzk1ugvB8IjITlK3Bq3Hs7C4h5t7+m0Gqxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
Date: Tue, 28 Mar 2023 14:54:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230325024924.882883-3-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca51384-4e04-4f06-bc94-08db2f8b9791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2tlLtkcML348U/tO4SF/YHxVrkT9932hbVxa5o4BDnCGbuuakIQuf6VMPF3f9p1tm3T7XwYbGfgbr7TUNiDdZOeSfXqTzHxijiaRii9jwg9DTvuqjX4j/kx8BazGvveRR5vszyRoddUcfvIPzaiRm2gOWZW8UopigbeHEJKeGdt8uYWgb9DssOqadIP0fE3FwR78n0U2zgyls5e95PPZ0A90hk3DUbPObLMx1fgbCBSDKMtaBhIq1sPcWuLKjcBcTDoNVXAyHYe/pGbUenT57E0i+qhOwZHfTK0jtp/aAMvOP3RG6p0kHCyMfF0liXDLmUWjs1SSfyyjIm9+C4U62k6PenYRGgE0QV1Ai43mlv6V/EQH3P5fwkMrwjSLjgjcUNA5Wa8LgMBF8x495lV289RpkrL6mPQxh9OqhkrgmlPOyTgor0INBv0mVfLD8WDp0usc3zFlqHRUTjCxYTJ2qC/3SaFbZdpRWg+Tt3GeL3DZvucvOiyOHLmpeGRipQPqdvuBgeSAEYiqMRjmPuI+a2mvwJ4Y85vn2YX5PX+P5LStrUIa3Nv70/j8hG+zkQ7YKaqLtJNDl1RV60pYcGzas8MjB786a4TUTOaiM/rcUXNleIlhi19D3FfxoLvp3ZwWIvLojbHIrPkcNUSNzNLScw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(31686004)(36756003)(53546011)(6506007)(66574015)(26005)(6512007)(186003)(66899021)(83380400001)(2616005)(8936002)(66556008)(4326008)(66476007)(41300700001)(66946007)(6916009)(5660300002)(478600001)(316002)(8676002)(54906003)(38100700002)(2906002)(6486002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRrR1MzN1RWUWhXVmYrU2JXVU9BYXp1WUMzYmUvVzR1K0F6aGJDd0ZYRnU1?=
 =?utf-8?B?emIxc0VEbW1KSUFERW1MMDFKY2t0cDVlbWltamtqdDk5RkNuQ2lhZ2NIMzZk?=
 =?utf-8?B?RXh6VWxuRlh6eExTTUJmWmlBVlNDb21KTmpqMDN3MVlaZjZYK0dsUkY1dTJJ?=
 =?utf-8?B?U1lrSXBYRGk5RDVjTi9hbFZrUjV5V1psNmpUZUd4SmxEMzBEejlGOUFaaEli?=
 =?utf-8?B?MjdpMGR5ZTc4Y0FpdXZZRWp1eWtDRzAzQmpMVTd5TFVLNjlSQ2VFVTY0TkRa?=
 =?utf-8?B?OVQwWisyUnp5ZmJxMTBBeVM0UTl2UnNncFpkTmpVMFZqdTVUV2ZPNUE0UmVF?=
 =?utf-8?B?UUFKRjJFWEhVbFV4T0xQZUowNnIzTWV3L1RpaEJJWWJJVG80RzAwV3FCaXc2?=
 =?utf-8?B?b1BMUVJVNXFiWkxUNGd6UUdNRk9LRlJLSXVrb09uWEhRUWY2MlBXS2VZTnl6?=
 =?utf-8?B?azhhbTB2REE0bXZ1YjFpRGxmWmdtdnhpNUJFbU51blZYajR5SWR2NkQ1TFA1?=
 =?utf-8?B?ZjhkNEVNUmlyQ3dvQ1NZSXpEVTg0eS8wYmtwc1Qxb1FYSXEvRFRoemhNeGF1?=
 =?utf-8?B?NkhObE03a3ZpcnV1NVFWMklDY1p2amdveG9Ld21nYWFWYmFaWEttYUUzOE03?=
 =?utf-8?B?MXMyai9IWE5seXExTUtvanpBRk1wYzZ3azlTVE5CNVhCZStXNjFvQmxKUHZk?=
 =?utf-8?B?T08rZ1FEeVo0YzdOTjZRWUdJd3pPQ1o3VlBRTjZwaU9rQ0duY240TUpRQ1Jy?=
 =?utf-8?B?OGFNQ3hoMkZhZWx0RHdCcUMwN2x2RHpuZ3ZRLzhxa3FoS3FwZWR3ZGYySzBz?=
 =?utf-8?B?VDRWRXVVQXRmWnVoSzJJSXozK0ZGM1JrcFYwN2RQUEdtT2tsYkdkQm9yRTFB?=
 =?utf-8?B?YTN5emtLM3VCYkN1SnlyQVVldEQ0ZWw4OHRKRElKY05lcE1yZGRPYUFtc1g5?=
 =?utf-8?B?OTk5Mml1WFgyMi9tWEpIUWMvdGt6Y05yQjJqem5pQmhzMVlkTi9sQ3ZoRHNz?=
 =?utf-8?B?R2VRZEZmYUJsQWtHR0piS1BGTTAweER3emF3RWNIYU9hY1JpUUVwa3JYY1FD?=
 =?utf-8?B?WG9teUoyKy9mNVVyemNuNTVjVjhBOWlDdFg1NUZhNytlMnlWbHlqTFFuQmEv?=
 =?utf-8?B?YmhXTDRzVEFLalJGb1M0NjJPam5KVkVKdWU4ek0wV1QvaHFyZEo0SWoxUHh2?=
 =?utf-8?B?a0REUklFd1BjWklrRFovdkFNdFVwL3k2NHp0clpaT1FmbWxLZnF6ZUU3OWlq?=
 =?utf-8?B?UDB1bU5sUGQ2VUFYQXBSMU9vRTFoL0xxejlMbTM4WTdCdlA1ZElCM3RaanZ2?=
 =?utf-8?B?TjB4K3phWUdzTXUrUVdWaExhMU0rWURpS0hWdDFYSzJ6c1l6KzZrb2VFSm50?=
 =?utf-8?B?UzBic09XYXY5QUxWNGtET2pKNzdQTm01aTY0TTFESXFrQzYrZDgrQTR6Nktp?=
 =?utf-8?B?QWNkblJBVTVjdEtGZUFxa1Vmek84ZDBpY0RLeE5jK1JtMXNUOGk1NG8wTTlR?=
 =?utf-8?B?b3p5WGFuaGJKK0ZTZCs2K3lBQ2tub0djcVJGSEVlVGQ5VGYzcFRsRC9jUDJE?=
 =?utf-8?B?NHgyS09iVTFPRXQrcURPK2VsRFA3MllLSjJHUk51RlUxTkp2NGlzUGpMZmFQ?=
 =?utf-8?B?ekpQT0JTRU4rcFd2Q2hrb05NWkxHUkxCbWxXa2VyK0RnTDh0V0kzQlNGendF?=
 =?utf-8?B?VDFmckZQcmNCanpVQkUvTkNGM280eFo2eVNZRStoWGt3QnhZdGxnR2xMVHZ1?=
 =?utf-8?B?NU4wQVFLdHVTZEh1aEtjTTd5RGRienI5dkE3cDMwNVlJTjZhek84T3R1aUNM?=
 =?utf-8?B?cG9UUVpTcHBRUGhaSDdjKzZFd1IxM01xZkZWU1ZoZHA3WlVCYVJkd0txRGR6?=
 =?utf-8?B?Qmc3MzFFVEVUbmRURDQrZFg2c0ZJZkZPREM3NW9RR05jRlhXcTVXcVZpNGpV?=
 =?utf-8?B?ajJOSW5DL09QRVNWYm1ITzlPdmxYeG5pQVpNWE5oZFpMMHBTMStRWUdPS01N?=
 =?utf-8?B?TXVuanZqSW1BcllhSVRCWFJxd1FCMStodGc5bmV5RFZqUHVFZFZMVE1HVE4z?=
 =?utf-8?B?cjR6TnNqLzRQQlA0MTNab0QwOHhnNldHT0FRMFI0V0ZvVzZKaWxsUHBOZVhE?=
 =?utf-8?Q?4h8c8LX8nt+s2gXNd36RiZ/K+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca51384-4e04-4f06-bc94-08db2f8b9791
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:54:39.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbSzLBY+6U/gOiSdoe80Dnz8PYQZvP1itREpFIHdioYzZtk2YdU00vjsTVZgAC3zW67MQO1/3/KxNOoqcUiNcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8354

On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
> Some firmware/devices are found to not reset MSI-X properly, leaving
> MASKALL set. Xen relies on initial state being both disabled.
> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> just MASKALL might be unsafe if ENABLE is set, so clear them both.

But pci_reset_msix_state() comes into play only when assigning a device
to a DomU. If the tool stack doing a reset doesn't properly clear the
bit, how would it be cleared the next time round (i.e. after the guest
stopped and then possibly was started again)? It feels like the issue
wants dealing with elsewhere, possibly in the tool stack.

> --- a/xen/drivers/passthrough/msi.c
> +++ b/xen/drivers/passthrough/msi.c
> @@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
>          ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
>          msix->nr_entries = msix_table_size(ctrl);
>  
> +        /*
> +         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relies on this
> +         * initial state.
> +         */

Please can comments be accurate at least at the time of writing?
pci_reset_msix_state() doesn't care about ENABLE at all.

Jan

