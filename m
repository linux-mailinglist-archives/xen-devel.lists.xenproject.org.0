Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585754486E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344842.570450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzF9M-0007SO-0l; Thu, 09 Jun 2022 10:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344842.570450; Thu, 09 Jun 2022 10:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzF9L-0007Q0-Tl; Thu, 09 Jun 2022 10:12:23 +0000
Received: by outflank-mailman (input) for mailman id 344842;
 Thu, 09 Jun 2022 10:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzF9K-0007Pu-Fo
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:12:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a623cb7e-e7dc-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:12:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:12:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:12:18 +0000
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
X-Inumbo-ID: a623cb7e-e7dc-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnS9Ko8haU9sC23yvdvtuv01zYmRAHnF0MCy6gCNkO1CFGKn8SaSpSrZqYGyUGuGoLVc2+u9pOawj+k0i3vx+GohZBQnP4GijTZc8NXxjmh34PrLhERUFIlFIAwSlun3ARjW7REIK6jq9vpI450bBeJ7nTR5cv8lO0A7+S7jNtolH9TKaraUTcp20TViC/txk/bdOI0Y1s5zKo9ZpAA7K8129G0Snr4iUeDlQ4oSdWUpE/0qi47S53S8EHsAqeaUdAOuA4YdoTfEtsGuoORwdA5YW+9zPWJP55YxFseC30CLgh1xoe9lDD0ltn2hmZ4qUVtkKDKtJGSMNHizxqnPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNJhQRJwcy1cRgL+GcMx71Kx/vI63KNV/AsP3CWfQxA=;
 b=JZkrK3rH4E6ks4COaWoLj2UBvmcxpW8S95oGaUaCvM4/vtrQW/nRFGbfWp4vSvCKosy7zG12I3y5HaOitPnFCZv4IZenbtueemvhnTMUlyONuFmixnMnlpxZvM1QJY1foF0mjFb1D5X0d3c6elLYR1M+Ru0qaTRCI7P61+Cmmt20xwIZSDDxIVoeSbCo+PS6LBq9Y0ZuBE0st1m3dHZqumb0LniYVQu49RiYNsXJSgu1femmvdyzfrAYma8jHy5aGrnPyT+tf1WTK5xUl/8KxhQBTGO+wurBJOAAZ/7Hp43R4E8vZbaYROpIdhxopn7C7aSXrGJLpo7NrIbSt7M++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNJhQRJwcy1cRgL+GcMx71Kx/vI63KNV/AsP3CWfQxA=;
 b=LbDYqHHD/Mk/rNlxjsu84k+2OerbJjvlEJGOA1VN+CkXNWO13OksOZGz1UMkyo47XQtsc38q1ZyIFM2YEg5afO/jcBxm/34iGtHI/yLkxHH2sJd52aqWbDtV9ZX/nBpH5c64aahjVFm9BVj+S/oaVLj7/wixE0tSF22GlqfVEbnN459eJJ4n+Sm98cPurAs8XxGk/vgK9kmDPNRj0LaVenJbJetf3tv7FAvvpjUf9358Aa/ELq+8/QyK2AmFS9myUpI3qC63WCNUr7++eLTrEACJQ+b8dNcMu3qnOzAAbokY0OnqpGDMXNfhPEtE/a2RFobU33XxS9vRxGtJOWnTfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cac6b820-31fe-10d2-50ea-7c7e14e00f06@suse.com>
Date: Thu, 9 Jun 2022 12:12:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] xen: Add MISRA support to cppcheck make rule
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <56d3deee8889d1372752db3105f3a1349ef4562e.1654767188.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <56d3deee8889d1372752db3105f3a1349ef4562e.1654767188.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0529.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a2095e-19c4-4b05-a223-08da4a0088af
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5608474F032BDA562E54632BB3A79@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XtLsGpDLJ8t0sQUtZ/flVa6B3FxwgJhGKCpesppsmJ0NjM+IZcAFMy6F8gKfJ96mlCGJT6/N4brPhqLaEhl9E4j4trfHAZQY/ZXIMOr8WRmF19B1hNyJNCMpesSPMK4TJHsjinaORSOrat9DHZqxD6EZjgH8KG/u+urRr+G5vJb6tpQBe64fo8/Yt7QbreoU45O9Z6aS1DNa6FgacyYPE6l35/oC5T0QJbTWNYYV7QLetCxzCosn/spJ6UwAth9HAFZG18u22ZRxY4pajDslMB1No18J3/EVmhceFNbfuc3LAN6yuVzBSFbcgJMhJusmXSgio9y6eSezre+px8nSdkdsf8TPyIxrS+G9YapEiuxnMLs+t+/9WmqfeTWocPZFBp7P7FcsbbQZNSWAA3HpFjqXJa/KceMjctwhalu1LMSlVEsVI/yI+jEzU7+5H++HgWpc4IAn6w98Hb9qkzyrDTcz83/Rma8nJYjTqHOcynt/pOzu1ITUhtPPbuzP/rZbRb9ftLA2GC6tJYbNl9tXDvrqkuo5k80toxAM3vzdNOF3guEyUwPLmM4kBIFfHQSjE+80HfOfYNR7rylbeXtztEu4VNt1t/vaOHGiu7gpru7YA0nlQVG7IrCBkp5b1ZxabpoG2WBFdgzJcEOMtaCaLyuhbH2zGqWeQtLYmteCU86EQsB0a1xnctiod/9+aek5sh0S8+wM3ANMYrPO/3Yv6HdEwmEnBoazvAM375ncll15QBpLER/Kd0xn3VMF0yDH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31696002)(6506007)(508600001)(6512007)(6486002)(86362001)(53546011)(26005)(186003)(2906002)(83380400001)(31686004)(5660300002)(36756003)(66556008)(54906003)(316002)(6916009)(38100700002)(8676002)(4326008)(66946007)(66476007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjU0MUlCY2Y0VVl6Qnl1b0RxUlJTNUNZT0FQMEVkOGRvZ0hvMjNtSDEzL29h?=
 =?utf-8?B?V0tJUlh1S05HWlVvWUl0NFFEOU5VUGJCdU5IUllLbzdaL2NNRzV0SlJSOFlk?=
 =?utf-8?B?RWd2amExMVg2TVhUaUZXekdLUmh2NXBiOEI2bFRCcytrR0MveUE3M3VjcDNE?=
 =?utf-8?B?c25sYjdXcHJBeHF4RGdYTFduaGFNQytwS0pzdE5uRVZaZWQyM1k3Ry9TVDZ3?=
 =?utf-8?B?M2Q1OXJ3VE9PYTVKUDZjZ1l5cUg5RG1xTlRsek4rTHRZNWJLdXE5aHB0YlhI?=
 =?utf-8?B?V1lhWWxoL1IrMWQvSGkxK3Qway9vWlVTejR5bmZQaFczU3AwRFo4L0p5bDRq?=
 =?utf-8?B?d0h6ajB4NHRmdFA0bksvU0xQSitxamdSYjdycldkYmViNlFGdkNab3lRK1Rk?=
 =?utf-8?B?Nk02eXBaeFRib2FtaWRGbHluVit6UUErcmcvOEhvVUt6YnpsQktPMDBEeWMv?=
 =?utf-8?B?RndleEwxYlk4a2ZtMlY5aDZEWmwrWTk3VElXblE0SnArRm0yQmlXb3pobGFU?=
 =?utf-8?B?U0FRd2djbWtuZ05DZCtWR0JXYjZmSFYxdEM2eVdPTTgreUsxOXFnRjlKZFFi?=
 =?utf-8?B?Qk8wOEdIRTROc2VoeXdQaGtmOHRvMTFFcWhad2FxdDBkejh4a2t1UHlLVXBH?=
 =?utf-8?B?MEpweXFnTktoeG1vKzNKbHJJZko0cTVJOC9WMjJyMTY1OVJORVZjMC9USm9u?=
 =?utf-8?B?eUVUVVFJUlhCWWpKTVdsbDJxRWxlMWhXTVM2NlFPcHlaeDZpY1h0MVZ2blB1?=
 =?utf-8?B?VVlFbHhidmJKSlhMdHJjK1JPUTUzU0h1RVdKNmljekptZkVlanlYWUlsV1Zx?=
 =?utf-8?B?STZ3WDNwNDFyWjNYQkNxUUNpUWFLc2U1RW80TDJGVkJhZzNQOFQzM1ovODRz?=
 =?utf-8?B?eUpIemtOWU5vay8xY1oxd0hHdmdxOXZQVWdocFhvRnUra29yckZvMU1PS3RY?=
 =?utf-8?B?cEs1TkMrWnl5Z1NKZGFGeVhzNVNLWlFsRFhSdFEwRDZCUFl1ZXpad2RPSkFp?=
 =?utf-8?B?eVNKSTZkMW9IdHZ4WGtMWHM1VzA4ZmZvejhjaWQ3NGdBQmIxSUQ4Z2JjclNB?=
 =?utf-8?B?bmpjbmtDMkM0RklxN3o3YWd3UFhFRlhodmw2UTZVNTlVUWpBWW1QaC9KQkRP?=
 =?utf-8?B?ZHhTVmY1aUk4ZGRMYXhpaENRT2oxS2NYTVRVNWMrWE9ZV0dLMi92M0F1KzQw?=
 =?utf-8?B?QjBvUHl0b1lPMlgwN05rSHhjSjBJcGZ0ZWQySXhITDBNeXM2dkU1SUlkNTdV?=
 =?utf-8?B?eHpLOGREN3h4THR3RjJDZTVlWW83WW42a2pKTHROVlhHYmtYTzAvUTZPUlZK?=
 =?utf-8?B?NlloMXRvTVpralVQYk02bG9iRVdoNW5rSW1oT1FDcXNoNDhFamlqV0d0bFRF?=
 =?utf-8?B?RjE1WFRRcmgxWlhVUTBvalVtTHVWQjZkMjNSM3JrUUhLQUJUVnFSbVJ5SCtv?=
 =?utf-8?B?d0ZJWEhES3BqblVUUU8wanMvMFcrUkp5M0NRWklkQ0lFWnBoU2g4K1lTYVNs?=
 =?utf-8?B?aUd1K0k2VGpSbTI5NVBEemxRZDV1cDdkaHRzUURtRjA1NHJUSEJ6WEFFakEv?=
 =?utf-8?B?TlhkcEMybUd6TGIxbDBTemFVV0FFWm9SNzJBM3Zlbnl1R0xpK0ZVcllVQXNS?=
 =?utf-8?B?ZC9GZnI0UW9HMk9RYSt3eVZQa1dyUWU5WFBueWM0U3N3dVpEV1B4SmNxRDRD?=
 =?utf-8?B?eDYzUUIxbVg3cEpxWk94U1BGN1JSR0tzZHl0MTNCSWd6eFRPcTBiR1hEVmpz?=
 =?utf-8?B?YVlSNyt5aG1INy9nQ3ArZVJzRk5LUjJOZHVLSDJrWDc4QnF4V1BicldHaWhR?=
 =?utf-8?B?M0NrQzVlVFU0Y1ZVdWtlN3JHQVRWVTl3ZUZPUEhvMHZUM2NRZFUveEYxemgy?=
 =?utf-8?B?ZFFyQnRHNUVrS2JlNE01TjhhYStjVEYyZDl3cmxtaDl5ZEpZOCtYejUwL1RE?=
 =?utf-8?B?dGtRdGJ4ZXlPaUpScXdyMWIrckIzUDU4NjdoMDNLSkJieDlvUGNyRVgwTGRX?=
 =?utf-8?B?WDFZRHhGc0U5dE1HTHl4em8ycEtKL29GeWhOZTZHMFQyeFlhdnJtYy90MXB6?=
 =?utf-8?B?L2FXUlJobHpuS2pjSDFVZVg0Q2VUMWdaT3E4R24xZ2VHcnpBVXpDQ2FGRXUr?=
 =?utf-8?B?a2ZkSkF5ZXVRT2NQUUtUdFR6VWpLKzBVRjRXODRCcXVJVlhkbDJZa1M0MlZB?=
 =?utf-8?B?c29kdDRHdjFITWVCbzdTQkR1SWU4alBGdzJjUVo0R3JsMXMzUnNzQ2NhSnNz?=
 =?utf-8?B?ZnZIajZQbjdoUHlHQmxVWUlyRFlabzkxb2tobXpkcEw2VlZCb05nNGlnSTVi?=
 =?utf-8?B?cysxdXVEaHloQXA0ajROZXRYWjBWZnBxakR4RTU4VW9CR1ppaUY0UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a2095e-19c4-4b05-a223-08da4a0088af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:12:18.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXVTeYTaLNgoh3CCIZIinESKqTCC7Nkewg29SjSTpGtd/x4SmNSNPaBwmsqqDJioLcguDqkmOZUvhvdv8PRWfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608

On 09.06.2022 11:34, Bertrand Marquis wrote:
> cppcheck MISRA addon can be used to check for non compliance to some of
> the MISRA standard rules.
> 
> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
> line to generate a cppcheck report including cppcheck misra checks.
> 
> When MISRA checking is enabled, a file with a text description suitable
> for cppcheck misra addon is generated out of Xen documentation file
> which lists the rules followed by Xen (docs/misra/rules.rst).
> 
> By default MISRA checking is turned off.
> 
> While adding cppcheck-misra files to gitignore, also fix the missing /
> for htmlreport gitignore
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - fix missing / for htmlreport
> - use wildcard for cppcheck-misra remove and gitignore
> - fix comment in makefile
> - fix dependencies for generation of json and txt file
> ---
>  .gitignore                     |   3 +-
>  xen/Makefile                   |  29 ++++++-
>  xen/tools/convert_misra_doc.py | 139 +++++++++++++++++++++++++++++++++
>  3 files changed, 168 insertions(+), 3 deletions(-)
>  create mode 100755 xen/tools/convert_misra_doc.py
> 
> diff --git a/.gitignore b/.gitignore
> index 18ef56a780..b106caa7a9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -297,6 +297,7 @@ xen/.banner
>  xen/.config
>  xen/.config.old
>  xen/.xen.elf32
> +xen/cppcheck-misra.*

As said on v1, this wants to be added further down, while ...

>  xen/xen-cppcheck.xml

... this line wants moving down at this occasion or in a separate
change.

>  xen/System.map
>  xen/arch/x86/boot/mkelf32
> @@ -318,7 +319,7 @@ xen/arch/*/efi/runtime.c
>  xen/arch/*/include/asm/asm-offsets.h
>  xen/common/config_data.S
>  xen/common/config.gz
> -xen/cppcheck-htmlreport
> +xen/cppcheck-htmlreport/
>  xen/include/headers*.chk
>  xen/include/compat/*
>  xen/include/config/

xen/cppcheck-misra.* wants to go alongside the line you adjust, while
xen/xen-cppcheck.xml belongs yet further down.

Jan

