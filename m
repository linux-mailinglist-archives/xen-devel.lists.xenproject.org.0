Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC06C2BED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 09:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512252.792124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peX2h-0007F4-SM; Tue, 21 Mar 2023 08:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512252.792124; Tue, 21 Mar 2023 08:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peX2h-0007Cf-OE; Tue, 21 Mar 2023 08:08:27 +0000
Received: by outflank-mailman (input) for mailman id 512252;
 Tue, 21 Mar 2023 08:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peX2g-0007CZ-RY
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 08:08:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d4a6c47-c7bf-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 09:08:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7147.eurprd04.prod.outlook.com (2603:10a6:10:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:08:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:08:21 +0000
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
X-Inumbo-ID: 8d4a6c47-c7bf-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu57ijytlLtm91SPZXOUrKKlnY+Y0onhBScWivPLYjAAvh2cpsGSStZUwuhdx7g11KYyVoYOlQOIc2cH2c6YLpQihTb1bJU1DH0OzNbLXycGnieay8XVL51XaLLgKhG7LJ3sd72tKp6mdyZcYqXjCE0uEBoRaonx2gGYGK3FS1yI1h5bW/VU6jiy6r/VER+G78xr+xewsx5dzN4+NtEkC7mZArEbu9H1jqQVQSJiDtzP9aLLTGEzzNcGXatJ/1R5zmXVGD+p32m129xwQDQT2Dtw5cCITJ0TOjcqEX2jKeWobJbYoK20Y/fxrA+PXP0W+0nBT+lgrayqr2GCmrR+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2/AOBkMmISvTuLIzyxYbeTH30ey/d2N7zX6Zcu19sI=;
 b=bin0p+S04XoMd8swnuX+mdt/fdCA0AzHG83qto3LF2DXf+2AolO0K5rSaFdcgeUEGlPwr3rEWadBYPJdwyf6pK0BxzhYIa502gYUfQmomUe+W1u6BlApWs/7RAs6duWLN19SC+sSSUdN6svrsN+j86KjsUOcfaSdIC0nabDObTSqAfMRSIacTWoe74J9gHey0RRv7N/x6n6b/61Z8up+tbEEtM/ULALbrSuRbl/7XiJxXvvdfINnnzTV5+YUVtoJT5oSMTjzolTqN8TaspGDp47kxyS9rak49XXtfu/pLsBjnlkWM/G1tEFBfMQ7sg/d9Kc8bafPG6Vw/GAqQDZdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2/AOBkMmISvTuLIzyxYbeTH30ey/d2N7zX6Zcu19sI=;
 b=q6IuLUmeSKWoLIDlJh2ILwrJyrZZWrb16EtcNYF7Xou3vHS/YxUSFDZibXSx3IV75+imZcJ/yS8PmSA8bKgt5K5OmBQF28LU89Um+m3L7sAs0nrolnvmmui+YrVsPnbPuIwvgg6ZsEQ2Dlt9Nfg1bMVCxwWJHlpHbbBtCaFFXgNRAzV5i6Galo0EhU0BWviy46/nKVnZ6fD4+USMJEaWcYBur9pb3EWiI060G+cjsP5njKYKPl2Emlf3tekrhe7KeCz9nk+6nQE2lxGrlTUypdhve3BJc+6VHJLcqjykqJ7Q42fL5C5Ksmm7GL3D1qAh9JwmdPBMbO3kGV1sEngK0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33912bbc-2796-b2f9-1e82-bb88e070fa4d@suse.com>
Date: Tue, 21 Mar 2023 09:08:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v4] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
References: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 745d28c2-513b-4eb4-b2fe-08db29e36ff9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	59FobW9XdqGeXLtKRimm+uJDkCOWjOfrtQcUsfNiBXmqkwWVABssrc9avvbjoj3LCmqDFFK/oKaSRisO38lr93pJ7BdkjELe0ym+iCfqCpy/GqmyI7K5iCs3jhAIye4rAfQNLy+UxIcwOdzNoSjLHDKuzxTy4OQVGNffN0uBUvjCrYf10CxAdQSUkSwOkwMboGWj1q93bVWH1bQsaoEIIgawPfdE2MPFnRu7qIu01R6rrCysVmLKFZfr0tpbvZzcmbhC9u5N1HK7b3x2T1FRLtTvtSfCdHwcoozihoBZR9GEUKNq5zGXufRNl2hI856KHkwL7cRFLdv5TtzS5AuhcpMTGrupiUNrJU+2J2bwGiTDt8hm9+eUHtRJebW90AOdf7F6UyO1deNkrtBHR5/xN/3ByjCzR/oh4klPTX6DM99bZ/7UcHUvh5h2MVtD0cQOa7lkLRPHLYIIkOgKKB8rnJs8tAzIQbfVtW39ITsNQJER5oyADy+gVutKrrJ9hNfUJq7ERZr+nE60qmaEaldOfJWtrjHMZbX3KyRx4pZRdguL3KprU4Z8TJ2SPcBKQ5bPRTmwPnxLMZYrEmG66nCCbhW3p+KS5asUnEkCLpvRHwKRSuPl6GKzV0Ew/43eMdM3zJ38MxSd2jhgE+1pGWx5ufekSSFGz+YrMlXMGprfvust3HhCRCvqqBrY/J/p/5Xqx7nV+6Ggi/QB3hJJR5daYvMb3nMLgvg0u40EGd5LnKX6wmydgpg7/6W2K/iSGqhwHOTxCRN8ToCzNx0Fs1SzOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(2616005)(54906003)(83380400001)(86362001)(38100700002)(31696002)(8936002)(4326008)(8676002)(66556008)(36756003)(66476007)(6916009)(66946007)(2906002)(41300700001)(5660300002)(53546011)(186003)(26005)(6486002)(6506007)(478600001)(6512007)(316002)(7416002)(31686004)(23180200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjA3TDN4cC9Cd05WQUpVUVVSb3krVzRIdWY4TmRwSHBBWGZWSlRRWWFHUEt5?=
 =?utf-8?B?bnNhdGJEVFNmQU5xU01GalJjeldFeWw1M0lPemFyRnlzd21vUUxIRkFkZEU2?=
 =?utf-8?B?bmRXQXRZTHBCc3oxSUxsSklzRFVBOVlhV1JaSFhBakFQaVVZZmhQZWkwbFhZ?=
 =?utf-8?B?MG9jbVEzNGRnUG1MUVZSWmZLY1ZZcjZhVEYwbnVTaGJkT2RVcUd3c1hEZFR6?=
 =?utf-8?B?V0x4b1JqQVdXODgrMnIxVVlnSjdiVnVVb1FpSkh2Y1FsbnAreFB1bVQ1NGxR?=
 =?utf-8?B?ZFlIbVgwdVFMTlMxTFRRK1VsOFB5TXNZS3ZCSkg3NU4veEpYWjAvVnpic0hW?=
 =?utf-8?B?dVlIQ3JSSVF2a0FJSHBRWXB0NFJEYWFtcTFrcm1ib2xZeUp6SHdjVkhtMG9N?=
 =?utf-8?B?Qm4waDdUNU4rSCtSVUljeDAxQndGU1lTODZZMDRCSEtqbEVQdFg2V2NCSWFW?=
 =?utf-8?B?cDdNbGJwYmJmeURCaGJLZ0pWQitLdVJ3a2pPdGN2cWpzb1lZdnR4eEdYc2Ey?=
 =?utf-8?B?RDA2dTF0QnUvMk0yeWpWRFpnTHhleXJqOVV6T1BQYUIwSDIyRTBKNStac1Nz?=
 =?utf-8?B?V1kwUTdLQnRzTk5vU1l3UE5CaXg0MERib0ZQQXIwMDJkeXdtanZMTVp3QlJU?=
 =?utf-8?B?YzBlR2JsVzM2dGJyeXZVQ1RqalgrY201TTg1OWRmRHR4UGYwY0M1eDVqVUd6?=
 =?utf-8?B?YVlWalRQTzBqZ0JhUTdPTFFCOUk1TE5QdWlldFlTNzNhSFFqRDJXcEpmWGF2?=
 =?utf-8?B?eHEyZnkrQ3czbXNRWWFCQ0RSL2owalV4Wk1DL2l6YW9Vek9GUDFjN3ZaTUdS?=
 =?utf-8?B?ckZIM3JzZVc5VmY5TXhLa0tUZCtyZjVGN3BDVndtNFVsbTBET3Jjd1Jib1hS?=
 =?utf-8?B?S2JjaHVlNjdRYjVKcTh0NjJtZmpZdFB1ZUpxRmxRS2craHV6VERVNS9OUnkv?=
 =?utf-8?B?eW9rS2VZWlI4djNiQ2tWeUU1KzYzVlNPWlRyVUNBTnNWd2xiaHB5bkFLWEhH?=
 =?utf-8?B?SzhXdURzS1NUdTM3bWVJRk5rMjZuRmhGVTlpWXJab0l1dFMxQitCK3pxVjAr?=
 =?utf-8?B?Vmo1ZExtK0VrSkhrOFBFRzQxMm5WQmZ2SkNjSVFoQWc4LzJqekNJWGtjZmFo?=
 =?utf-8?B?UWxsY2F3NUc3clNycERJQ29tOTJoRFVTb08zMTlVOFpKbmlzZ3pjVkRVREZ4?=
 =?utf-8?B?VE9RVmhka3VhTTErQzMycjIwVFduV2dQSHVtNlZaM3JiSDF4YzAwQkNML0RF?=
 =?utf-8?B?S2xhcnBlNHIzVlRHam1pNHpMMUtXQy9xVEZkaTQ4ZGpmc096WFF6NzF5K1Iy?=
 =?utf-8?B?QlJnaTltTmd0YXdmejR6YjMzYmRtdnVlQlhGZTM2TlhVNyt3OXF5dVZySlN1?=
 =?utf-8?B?K1A2dkl3U3NzbU43anZZMVBnbURmNUtoRVgxWVRpb0RkZk1MNlJwOTZlVEpI?=
 =?utf-8?B?cGZvRXEwbit4WHRub3NnNGozTzJ2N2RWb1pBL0xKd1dwUWp3QlJlREQ0aUwr?=
 =?utf-8?B?dGlZMzBOaHQ3NFZocy9XcWxpdHpRMHlOV1ZQR3RERVByaDhXR0c0eGZwdXdJ?=
 =?utf-8?B?MSsyVERINThkUWZhL1VzamVzc2ViZWpTbGsrVVhja0pZUkJXTXVydTBUT21T?=
 =?utf-8?B?S3dHSjJrR1FjVWVwSVZNM1dkNVpraXZBYTNmOU14Wm5VdGkwM0hjYjZDNFFh?=
 =?utf-8?B?eEQ0VnMzQU8zYnNaQWxXanFZVnloR0E2azBaOFBNKzZMTEE5REJaWU1WNGZL?=
 =?utf-8?B?bVNvSDBSRDVLUzBBblRsTlc1Ymx3bTlHVEFOWGlvM05OS29GUjRpKzI2SUFH?=
 =?utf-8?B?Y2M5anhoMzh0TmJocXpwODRibWN0RWF6c3VoeWZrMFBPME1zdkdXWFZJd2RX?=
 =?utf-8?B?bmNTQkZ3bzZyVmh2aVA3bFgyZ2xrMkwxVllaaHF6MDdFbDFmSHlFSzg4N2NQ?=
 =?utf-8?B?L1lsR2Z5d2ZaWWMrMzVhUXp6ZVUxTE94dmlDaUVFdVZ1V0gzMGM4ODdNRUE0?=
 =?utf-8?B?VWJyYnJPYTgxSEphWmk4dW5jTnFMelRuMVdudGQyWFRUcTlhQmR0ZTgxcmNB?=
 =?utf-8?B?dkFXc0xuSGNKbTZaRkJpWm1mSHZCRkw5aVkyODR0dVRCWFQ1WGg1ME5weFBV?=
 =?utf-8?Q?6j0f6y5Y8BGVU3OQpVnxd7Phu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745d28c2-513b-4eb4-b2fe-08db29e36ff9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 08:08:21.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO0uJiM6apIxsdetv2c2zf3ZhsXZXa2K4L5ltgmyJyVu1ZbTLzkyPiBZf8HRQWCEFnq0JmqhYiLRmAYtAK+GyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7147

On 20.03.2023 22:56, Dmitry Isaykin wrote:
> Adds monitor support for I/O instructions.
> 
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>

LGTM now FWIW, but this part ...

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4560,8 +4560,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          break;
>  
>      case EXIT_REASON_IO_INSTRUCTION:
> +    {
> +        unsigned int port, bytes;
> +        bool in, str;
> +        int rc;
> +
>          __vmread(EXIT_QUALIFICATION, &exit_qualification);
> -        if ( exit_qualification & 0x10 )
> +
> +        port = (exit_qualification >> 16) & 0xFFFF;
> +        bytes = (exit_qualification & 0x07) + 1;
> +        in = (exit_qualification & 0x08);
> +        str = (exit_qualification & 0x10);
> +        rc = hvm_monitor_io(port, bytes, in, str);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        if ( rc )
> +            break;
> +
> +        if ( str )
>          {
>              /* INS, OUTS */
>              if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
> @@ -4570,13 +4586,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          else
>          {
>              /* IN, OUT */
> -            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
> -            int bytes = (exit_qualification & 0x07) + 1;
> -            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
> -            if ( handle_pio(port, bytes, dir) )
> +            if ( handle_pio(port, bytes, in ? IOREQ_READ : IOREQ_WRITE) )
>                  update_guest_eip(); /* Safe: IN, OUT */
>          }
>          break;
> +    }

... would preferably be re-based over Andrew's change to use bitfields here
as well (just like was already done by him for SVM).

Jan

