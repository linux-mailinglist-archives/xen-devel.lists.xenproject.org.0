Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE6178C50E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592215.924870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayfA-0000Qf-Ma; Tue, 29 Aug 2023 13:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592215.924870; Tue, 29 Aug 2023 13:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayfA-0000Na-J0; Tue, 29 Aug 2023 13:21:44 +0000
Received: by outflank-mailman (input) for mailman id 592215;
 Tue, 29 Aug 2023 13:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qayf8-0000NU-O9
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:21:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdc52c02-466e-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 15:21:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:21:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:21:38 +0000
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
X-Inumbo-ID: fdc52c02-466e-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQc+kCELDBM4YQJLELNjrP5r5oJKvc93DI9/RtVICgW2DXyizuK08BwDK/fafvDu0lllDJqLsc9MYuXo2YnbJQA4rZmo5Fxu0g4tfvY0yiLskCvrvmbPl5UxeRz2p1Imbk1XCuTHb+byI9kxJqe/SlYT5dXkPMRvn1nIfFJHgyON7Npeq0NEzCGiNIqbW242Vdqe0BdtcTdXYbYIkHkfJR9AK17Zi8TSKlolRZdTPVz4jNlchuAo/G0VZnZNC5Q4OBrqwa2GQb8QLMP2YUdb+NslTgOoHxUM6d6G2g4F/7/v8HbwhiptI3BRtTXalH109v31DIGbOckSYniRk5qFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADMBT2CfXTCS0oltmguZ2qFM0oHS+oAn1EJKZfafymw=;
 b=WCsrGv834X9hJDfl0DkNgA8qzTp/pXiQGS7plucB3pDYpcjQVyNzfAFRI/jF1KFmCa6EjYPfeYsw2GKfMO1LqdvKp6inEWrT34U68Q8fGt6ncM6oezRZjciaMvzFErmzE4HRqJFU23H6ahJYBmc11pf3o/Ij3NiuAN4t+qRdibsDvNabIqbG8qqDqDS8uUrvitS0CblD91cSvgNRLLw4mXcI/45xJKcIDX2dCpQH/mfCUwtl+vOM7vCGSb/08xeFUB+8lXHdkBj6zaQQCiWYiNWuPcNJgL2912tQkGlI9o3pb+24BDxf3ByL63d0dkJ02ugxdIO4eT4tnqSxPsk09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADMBT2CfXTCS0oltmguZ2qFM0oHS+oAn1EJKZfafymw=;
 b=5Bq92U1DG47XLZmb7PD/Aj9P3taXfOpxv16olm5mzbjqd3jFMSAG137TFceMOHNxqR8V9U0Bksarm4oKzdMFggLb+wBLbp9RD6Rv0nD+rWYnLFzd4+7b2jt+Y6Cg8j+bT72qeAHFgFk/06Zf7zhaJ4BSTPtewMDqlx66d6GaHUWN+k9jpcLL7Y7HEMUv6tu6GiV86fqUtgyvE3WsFF3JPN4V1tHyQ3KV3N38FVYspi/iHo98R8cJnTZkpCh8MNmElxgrJj5C45g2Pa+VbhPCRLbChkQYdR+X7dm88KVUcrmTluCysYzVaP6/9GqLWmY3WHDZiHMpJZ7RfSdmVdPeMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <208ad7db-ed59-fe93-9df6-83007a4f00ae@suse.com>
Date: Tue, 29 Aug 2023 15:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 04/13] xen/x86: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <d2f0b1184ac9d2a79cc4651e6e4469bc38a6c24a.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d2f0b1184ac9d2a79cc4651e6e4469bc38a6c24a.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 24476e64-dc05-442e-470d-08dba892e047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5d1+dGMYFsDAzEUeZsgLy/iI1pkBVIroOVsl4QV5AD+WkT8FdNAFtwXYXl8lOxPA+FeIVUAdVSq37aDwct7HXXPO6yrtBZx2+r8RbmINuW+L1S0kKF2ZScx7m0SOq/CI9Fd7Zsg6yATB2oSIyY0rG8N2vDw7X7lH1Nqa25l5xMj3/OZVomNs0CvcjtF1ZMVfwzrG5HjFptkDZPbA/SEqmVLUTQdyIxO6vxRlItEyQ0bU7Vc8ATGJPFaI9WblKQ8Eo916QQujuSQNuHysa8JXGXAY26UyP898A9q1Q6YZUjQUW8j918jZxCCx7zbs/CbIqKD7DJqdItXFZ+h6P9um6Aw8ldhK7QZtXunJUSBzN2C2wuMaPL9VSpkjQXVdvVXMjJLp/r7w6hLothx0i1Dccz/rl9WjOWqUAfL4fFCcJULAEFB0AP57WmSonzrJNv/DT3GpPBHTW94/EZ8XkUDPVNRUBETasQYsJGr6AZ9KY5Dsuml2Qn4wDjkQJYWj4kcJN5qryy+x2iWsHVvs4KOh9E0yRbd33/DSd5fPQoAFkkDFBbexpYj/fKec3gxsid89UWtZIwREtbbS/en9awPiKLCLgENKnBufADofJXfESfBbc9Hiv0uGQDt0v1ZnddGR0hbNG9eknsiCNvq+bS0pHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(83380400001)(478600001)(31686004)(26005)(2616005)(6486002)(6512007)(53546011)(6506007)(31696002)(86362001)(5660300002)(2906002)(6916009)(54906003)(8936002)(38100700002)(66556008)(316002)(8676002)(4326008)(66946007)(66476007)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S01UOGxYcXUvMzRnd28yUXAzeDJTclNRTnB1UmJSWndvdFdLZHM0cWY1a1JZ?=
 =?utf-8?B?S1V2VDJkVUpQRWM5K1dMVGNhQnp5eHgxM2lOK3hQMzBETTF5aUthb25naHV6?=
 =?utf-8?B?Y1EyaGsxTDVUS1krUGFHdGZpWEpDY3MxYnVCRlNFSDdOSW0vTHRJMHVyTWpj?=
 =?utf-8?B?bUVSVlV0N2JFL2dyQklzdkpJNm14R1BpMXkzQ1RuTUdQcUlDempqcUJkcTBH?=
 =?utf-8?B?K0FHODdEWm1UcXg4cEhqTjJhK2dsbldod1hnUDBlS1B2OTV2Q2VyWlFVQllz?=
 =?utf-8?B?MFJNeExsbmJ2SHBiVEM1S2xBKzU2VGU2dk5pcUtWZ2lZbkVVRnN5cGJpa3lk?=
 =?utf-8?B?U0NLVVF4MHJMR2swOUp6SGtiTzcxSnRxdmpQcHlRTEFjbUJDaXdZS05RR2Q4?=
 =?utf-8?B?SXIyT3Fuc2VOTG5mM3kzbXc0YmUyNkJ4N1grZXc2bklSOTM4Z09QTTZRUCtR?=
 =?utf-8?B?N3NQUGxyNE5FNUp6Z1J4dGc0YUV1V2xQaXI1ZjArWDdHZDJ1TTlibVpwK3Ft?=
 =?utf-8?B?SGp4TGVnN3BJQWtyckFDU1BPU1lmbzdtN1BRK2ZDQitXckRWcDdOZm5uT1Mx?=
 =?utf-8?B?M2crNlMzSDFSWEMzdjJhUzBubFVjMS9ieVNteU9lNWxlMW9JL1pqaS9lYW5x?=
 =?utf-8?B?NWNRUmZNRXlSUlZ2L0JPZDAyQ0EzU3JkWHpXWDVxV3QrVmVwR1FBYmI1UDU2?=
 =?utf-8?B?bmdFQ3VzZzhIRHAvZzlMRCtuTURrb2FUQmhGN2I1Ny81d3ZiSDFZZzRXRGtq?=
 =?utf-8?B?YXlTK3NDZGlMYlpjd1oraVFqRDBjMC9MNmZHNmNlTW9qSFlpeDVGUFVnVXM2?=
 =?utf-8?B?QXpzcFR5cnVKclBOeDdFcVovcEpZU2RNOXN3RHZXazJ4dGVlSVUzclVzZ3hI?=
 =?utf-8?B?VEZDM2JOeWl6Lzhjd2x3UEV3QnFHa2hMU2VGcU1YVTlHbXlXK2N4WlJ0MW1i?=
 =?utf-8?B?NXBNZU9ZZlhDcHduQnByZGRJM1R2QWkyblkwSGdieHJxMzdaWDNQcXJaRGlR?=
 =?utf-8?B?a3NzRzZ5MDIxYW9JanVHR3gwSXF6QW1LQ1dDT1habmlncFJzQ1Byci80UHQz?=
 =?utf-8?B?b0FhTVRjL3BHM2RQT0hPQlF2Z3lXK25YbUdUTkxwWHlBajhIWmRLSWdwdHQ1?=
 =?utf-8?B?NzVrT2NTQXp6Ni9xdTRxejFLeitxM3I1R2llODlXdEd1aEdWaVNZVWVzT0Q5?=
 =?utf-8?B?NUZGaDA1L2tnbmIzV1R6OUVFakp6OEV6cHI0SjFlaGJseE9rV2JENkpUbVhk?=
 =?utf-8?B?Rno2QTZOYldPcDd1NjNnNmtyUjlKWFlncEVhNFE1RG43TDg2RGV6citmbEw3?=
 =?utf-8?B?SmNZMnIydkJDZXAweGd0YVN0b1B0bkpaSiszWDdBT3FTMGxvQldFdmcxUlpO?=
 =?utf-8?B?dkw0bVZORFk0SnMrd3hzaUZNWi9VdlpWNlBVUlYvcWpCSVpNZWVVQXN1SlhS?=
 =?utf-8?B?ejlhcVdOR09XY1h0NEFpdEE5N1N4cVFwZk0vQ0ZmQ3dkdkJSLzdGZHRJMTlk?=
 =?utf-8?B?YjExNVVNNHlqdTlFR0VjV1RHc1RLc2ljZGtmSXNza3VkYmx2c1lmNlVJdWd2?=
 =?utf-8?B?QVZHcVAxUDZoZGcwV3pDbWhEdGMxcWlkTkxhQW9oZUdQSTBVSW9LaUtqT0xQ?=
 =?utf-8?B?NjBadGdFaFJRenNHSVdhWCtHWWFKUXZQVWhYa2IxbzY1SEQrK2hVVnZlZWVC?=
 =?utf-8?B?L0tjNWd6NGxXcUxHMVdRS1JCNnIvdExlZDUwRVhORVdJczc2eDBmUmlyU1NO?=
 =?utf-8?B?cmNIVEwrdUlPbHhPUHJqN0s2YVlqVEFRTHZYUUhITFVFSmhOaWliUTRzeUQ4?=
 =?utf-8?B?dzA2TlgybTh6c1M0ZTNWRDBCMlB3S3ZqV3kwSUVTdnNZT1hTNlZwTFZGMWtX?=
 =?utf-8?B?dlhTK3NMemYrNks2OU80cjhDTDg1eDVYR1lwZ09vRTZWRXlwY05hSWxPdVpm?=
 =?utf-8?B?NzhVREVBandwOXJkZld0ZEF2MElWa09EQ0o0TXNVN3B2cW4vRjJwd2xFcm4r?=
 =?utf-8?B?SjlXaWVtRDhtTkVNK2xSeUNxQkFJYXhuMGxhR0U5eVFYdnpDTVkxT0d1VkxK?=
 =?utf-8?B?QnpTRjZ2MHZBNW05WlFKR1cvUHBpcWM0WGt5THhSZlBLMnhtNVFoZTM4WEJl?=
 =?utf-8?Q?p3S3Zg0KVXBegd16NlDl60fv2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24476e64-dc05-442e-470d-08dba892e047
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:21:38.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMNrr4Rx9vVb5rq7c/D1qJDkhaqI2kJ29Rjbyhkj8R8XqvTIr7aVrDBAWa6ITD7RSfkGRYPWtVepLjGEKIBohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978

On 28.08.2023 15:20, Simone Ballarin wrote:
> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
> 
> Also C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/Makefile                  | 8 ++++----
>  xen/arch/x86/cpu/cpu.h                 | 5 +++++
>  xen/arch/x86/physdev.c                 | 4 ++++
>  xen/arch/x86/platform_hypercall.c      | 5 +++++
>  xen/arch/x86/x86_64/compat/mm.c        | 5 +++++
>  xen/arch/x86/x86_64/mmconfig.h         | 5 +++++
>  xen/arch/x86/x86_emulate/private.h     | 5 +++++
>  xen/arch/x86/x86_emulate/x86_emulate.c | 5 +++++
>  8 files changed, 38 insertions(+), 4 deletions(-)

Considering that the description talks of header files alone, there's a
lot of non-header-file churn here.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -259,17 +259,17 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
>  	$(call filechk,asm-macros.h)
>  
>  define filechk_asm-macros.h
> +    echo '#ifndef __ASM_MACROS_H__'; \
> +    echo '#define __ASM_MACROS_H__'; \
>      echo '#if 0'; \
>      echo '.if 0'; \
>      echo '#endif'; \
> -    echo '#ifndef __ASM_MACROS_H__'; \
> -    echo '#define __ASM_MACROS_H__'; \
>      echo 'asm ( ".include \"$@\"" );'; \
> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>      echo '#if 0'; \
>      echo '.endif'; \
>      cat $<; \
> -    echo '#endif'
> +    echo '#endif'; \
> +    echo '#endif /* __ASM_MACROS_H__ */'
>  endef

Can you please explain why this needs adjustment? While I think things
are going to be okay with the adjustment, this dual C and assembler
construct would imo better be left alone. Plus as per context found in
patch 2, aren't generated headers excluded anyway?

Jan

