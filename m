Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2A6FEF03
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 11:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533188.829617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px2nZ-0005HK-3P; Thu, 11 May 2023 09:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533188.829617; Thu, 11 May 2023 09:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px2nZ-0005En-0M; Thu, 11 May 2023 09:41:21 +0000
Received: by outflank-mailman (input) for mailman id 533188;
 Thu, 11 May 2023 09:41:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px2nX-0005Eh-DL
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 09:41:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa296340-efdf-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 11:41:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 09:41:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 09:41:15 +0000
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
X-Inumbo-ID: fa296340-efdf-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMwy4P+b16P03MGpHi2J7Pi0ZUyxyjMR3/hDPlolvWZF66m7f5xUobmPiGXV8Ajw38pAkcwOi/hukdlSYILl3mtt1DwWWtxqvnsO0vrIkUKDe+U7tcXEhd4a5BitVyv9oX1h+A/efxof11kx0X7DKrl/N4tUnmJLbv3zS/+YYpUv7bnwd8ZAFf6Pvy5haj+wgexZJzBnRWHVQLX3s46r5sjKDldu8u7w6C+sEc4YFazWeE6P3zc9OVeZoh88RIXEQ4IT68wUTnoFMeqUkHE2CXwrE2T/Og4R6Dlu0pxMy8RZBjO/NyhxdNQgu20WZsD6q6EUg171NRWrGSbcfnJxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwK8xy/p8hr9PzAIZvLZ2B03WcEt3mvoJWxm84yJlmU=;
 b=LhkTSYO/xAalJKOj0F0pUPxjOBMFgdcAP3l/tYnhLdBEIccX0BbPkjys53oCu19ILVKBIrZsu4iQ0T/fyZIQL5tRNgSyvQr2FcEZhI4pIeVImA3/6IDhDte7p/cWf3kVYugJniVjH1R3avl+xC/+UqRyrjV5lR9+ebx80WLpCOA1WjvGxmUJaHuYKFLvRO97s8CLaYY9FJbyoKo4cpnIRPcjU2GpJ6iweiH76OdCeLpu9ji7hNMlTJyuOQm2Bivx5pP+pcg3KGV+3fZRDDY5rE7R8PoxnoMnze8hepBpdzMbXOEE4Tkhdl4yJTL7/tnMVjvWzXaI8uimB+lWanyQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwK8xy/p8hr9PzAIZvLZ2B03WcEt3mvoJWxm84yJlmU=;
 b=j4hmOYhfIozNnoRFMX1M4XIcqwDEAK0SGF+wB0LOB36Y/soCcACdSbZihnju9+j/ufjLEkrFAQVvGTCQ2DuoUVpJ+aKy8Wy0iSkEErMpW5VyhRXTbzfowGNG3EB+8moJ4mxflYapMQUOztZxSiJUlESJNQWLlaDFrs2Xk6JZF7dqJY1MFAxzzR2ZIO7o5ybCIWj0IXwebOOkYDpXJPvUjB2pCZ9ke20T/puiQNC2VIp6pi6H/i7sGOmdSZQ1Glg19iRIXoTrrS3QFzUONPLFhSqDFk+fBqh6IfMe8mmPqYJXuW3ZHTO8dGnbbLvpn5ojZv0PEtQgjgWRzX5qnrqtbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8995344d-cd14-d66b-efb6-e4ac7be6d457@suse.com>
Date: Thu, 11 May 2023 11:41:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] x86: Add AMD's CpuidUserDis bit definitions
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509164336.12523-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ace943-83a6-4bb3-451c-08db5203dd23
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZW+rBXUAciqEOcJ5SfGhkpEfcOjpbZh1bMLdK/UOSfpX9fZDdO+NUTalNKFsa1T3rR3AeOtFw6QH/wbWLPzeVfaCjOVEWe2r6GK8fZVl7KWXWnkjdOffmsIO9YE17UKiUbfRuOrY+Gg82DpfZULvdqBpmSinJRoYGW2VIlg/pnLIpARzOPLWr2qZh8rggsEPgdIsOrOpL5N/iMoW3jVHmnopi5jPw726w/GZ5T8oCxtAjW8ZQ+/VuT7a+VlPYXVPd9rZ6UzKgdOkhNs3PzXVVtpQ4/TGFkWjc/yetiDqKgBJzjieisGakGPwjjRPH21NeNmUVtqJE4odKCDqRH/vwCArPjLfSLlG/xdldZ0eliJOHt18ruD1bO6tSRI5Nb9qM1d8f+bUeAnfC4aXgPI9nWdNJlrOIFR78SjES9adTi9KUwVogp8B571Ca4mccZ2UMihr02I5lWigLPSa8vQVbz1QR0PSUA3i1yaw7tLmqilqjw41HomipgWeh8APiK/vW/DK5zbuusiuo9ARP+1urVx+BeC77qmTMs1ARs93J7mEF5xqC4RIiOry/koDPxtjsTN7CfY99WleCUBntfoxlSZarcj9PR3k2KmjEsA8mQ5N03kMJRDQenCXce5z1dIjRZ2MZRXAQlDAiPgsLcR+jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(38100700002)(36756003)(86362001)(31696002)(66899021)(31686004)(316002)(41300700001)(6916009)(4326008)(5660300002)(26005)(8676002)(8936002)(53546011)(186003)(6512007)(54906003)(6506007)(2616005)(2906002)(66556008)(66946007)(66476007)(478600001)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1NbC9nVCtFNGUxbmpCaTFIS1J5WmY0MHVPdGE3M2tyY1kvRkw0d0tDZjlT?=
 =?utf-8?B?dkJKOExXN1RkV1N6b3lYL2ZhdEtEeGpwTlZmOXdBMjRhendjcXF2RXFZTUJM?=
 =?utf-8?B?ZXlLbVRHRHVmUHA2a2tMOG0xaHpIMXd1cWZETU9nNkhBak1BcHVJcExNWnds?=
 =?utf-8?B?OW9VQ2pGbUdXZzNycnZWS011RGdyUmd2Sk1UZFdUcTRWam42NUFicEJKS2E4?=
 =?utf-8?B?Uk9lQ08xY2NndEMyd3M4TjJYN0Jockt4NGlrdEJMS2xTN1RXSHY2aFFwZEtD?=
 =?utf-8?B?dXZqeWxwQ1Zzb0l1bXRzVi9xTEg4dFF3MjdWZ1V5Wml6bXFXNTNkL2dRTCtX?=
 =?utf-8?B?Y2VYVFluMGoxQ1p3alZsdEtacjVRMTljWC9ucVIwYUFjWGc3elNkcjRXQUFL?=
 =?utf-8?B?cXRqR1NDZUhSNldPWkZNamZFQnB3R0RhM0UvZTQ2NzRkMlI5NFRxZ1lyYTE2?=
 =?utf-8?B?Q2lKc0ZJYms3T2tYTURwTVFMajBKN005d1BiNi9ldjVoTkEvOUEyd2F4M0Nw?=
 =?utf-8?B?VDdRWnZWZ01CLzZlSXYrOTR3RUJRc2k5VFhuUVV3cGxCOGU5U2EvaC9vS0dO?=
 =?utf-8?B?WUFaNU1JZUZ3VnZlczBUaVNsLzk0UG1PY0pMZTB5ZzNWRGpRcWgyMkV4L1Ax?=
 =?utf-8?B?aEdoMGFEckFjMmlMYTlzU24yVEJRbUQ0c3c5LytlSk1sRXFnZDlDNVFFbm13?=
 =?utf-8?B?SUs3ekliVzZrOUE4bmE1eHczQXVGd25CVVRtWUVQTm42ZjBDUkJ0K251Q0k4?=
 =?utf-8?B?MVNJbHNpVzBPZk5aZkxlc3ZNaTJPN294TlE5ZlkyU3E0NmJyNGlPWEw4b1U4?=
 =?utf-8?B?M1dHTCtITGZkOU5nYWMwY3Z0MGdsUU84ZEpaZXQ5ZzUyWDFzUzRGanZLSGIr?=
 =?utf-8?B?M2hTNSszY1p3REhRUUdNYU5tVU5TZndWaXVNQ09CZmcxbi9LL3c0MndmNVp0?=
 =?utf-8?B?Y1ZZa3pMTUVYTkpkcnVRbVh0QVZEbWg3WmF0MVdNT3VNaUNHRnVibml0UTV1?=
 =?utf-8?B?ZkNWVlh0MnFvQ0N6M1A2TEZ2RUY5U1Bsa2tqTlh2MmtqTmQ5OVFCYXAyR3lY?=
 =?utf-8?B?TXBOeWlzWk9yUXNkMDRoc3dyN1B1Wm01Z2NDVC90NzdDcHJhMFY1V1FFdEl0?=
 =?utf-8?B?bmJvRFRrK0FDOFdhV24rQUhMU0VwbTdtOEc4QlZDZDk3Mlo4Qyt3SzZ6THZY?=
 =?utf-8?B?ZC85V0dKSnpqZEdoMWE1RVBzOElEVzdxQjYwZUdNQWcyNHh1eElIOW5SL1Vt?=
 =?utf-8?B?bHRHYTBlSjA3OGpMMlQrYVRzdWFLdEUwNXN0TDAwTkswclJETWNIQzBFbDRR?=
 =?utf-8?B?eWYwQ0wwT09lTENyL29SN0wyV0Rzc2RaaWdLbTcxaWtJN0w5UWl5Y3Z3b3FW?=
 =?utf-8?B?eFNnclA2WGI4cWVVRkxMVXNkUnlLUGdFd2hWTUY3NHU5OFdxMXd4cUhBdGRM?=
 =?utf-8?B?NWkvTTZUS1czUDk2YlZQcUFtbzFoYmdBOXduSzYrdkkvdjBaRHRPSXo5UlVi?=
 =?utf-8?B?ZmdTTFVqUFZWNzd2dDNRdXFyYURteldmWG1JZzUrRGp2Q3VoRDMzZk01SHhy?=
 =?utf-8?B?SkppV3FNaFJ3bWREanZIRGtBNVlTK3lZd25hcnhxMFNlSnBQT1NNMHl6VSt1?=
 =?utf-8?B?c1lFSDlYVlVieUpUVXg2SVkyT042V295aTlBaWszRmlzSWxaOXViWGRNSzhv?=
 =?utf-8?B?aHZlbTZhWUpQb1ZZZk1nLytnelczcDhNcVJocE9XWGxHc09NZ3Jnc3VrVG1U?=
 =?utf-8?B?ZWtBbE9sUGdBbW52bDBKc3M1cWV1cW1TcU5VU2RIZDRaQUVNY3lXZTFGWFk4?=
 =?utf-8?B?Vmc2LzRHQ1Ntc0xOK05pYWd0ZHlpYjBHeFdFQUNXS0NLSk53UzJhVU9OVW8w?=
 =?utf-8?B?TGZYMXJXRlo5VUV6WFZzcWZ6L1pvMk5xaWdHRzhyaStrcTMxa3RDWjk3MHpG?=
 =?utf-8?B?bkt0N2FnV2FyZXFqTEdjTTJGaUx1bklVbE5hWlpOUXBIMTc4VFM5b0NwVEht?=
 =?utf-8?B?Nkh1RGYxeTg5clZEdDliaEp1SUxZRDc5K0s5SlhxbGNWUTN0OENOWHJSbWQ2?=
 =?utf-8?B?c1NoK1lPVzd4L0c4ZFdsM2lNSEUwS3VZR29QTDZpK0N4M3lHK3dad3AvZ1V6?=
 =?utf-8?Q?VVnCn9weXvxuwmx/01Bahole8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ace943-83a6-4bb3-451c-08db5203dd23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 09:41:15.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY4tXoi3fnSOTZpGtKVX9LeLfSmnYFBqAw5dRVRdNExLG6IYRTUdndN6x7DzMmeVSfe6wEI8FcbPiZdja8FumQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617

On 09.05.2023 18:43, Alejandro Vallejo wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
>  XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
> +XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for non-privileged software */

While I can accept your argument towards staying close to AMD's doc
with the name, I'd really like to ask that the comment then be
disambiguated: "non-privileged" is more likely mean CPL=3 than all
of CPL>0. Since "not fully privileged" is getting a little long,
maybe indeed say "CPL > 0 software"? I would then offer you my R-b,
if only I could find proof of the HWCR bit being bit 35. The PM
mentions it only by name, and the PPRs I've checked all have it
marked reserved.

Jan

