Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A0579667
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 11:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370499.602278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjb6-00086D-EN; Tue, 19 Jul 2022 09:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370499.602278; Tue, 19 Jul 2022 09:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDjb6-00083h-BU; Tue, 19 Jul 2022 09:32:56 +0000
Received: by outflank-mailman (input) for mailman id 370499;
 Tue, 19 Jul 2022 09:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDjb4-00083b-HJ
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 09:32:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2112158-0745-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 11:32:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5679.eurprd04.prod.outlook.com (2603:10a6:803:ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 09:32:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 09:32:49 +0000
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
X-Inumbo-ID: c2112158-0745-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgENY3uaDTfo3uyycJ14qF64Hrj3S5rw2ImyaUxCXSTytfcA3eLlH+mmGVDq9BwAplhpxNm6xXC5n+Z/u+mhQlB0dPRdhTIEzsmDjRRB//zhnLlM26z6Cri7eSZ/kPoYMelshDJBuiUqQ/n7Atp4SPcI9qzPsMN9NppwIdw35TAfrb7y06pv9K3aUOrFtY8IsIT3C7D1tZoGVQUEYKkhzQv498uOjg9BpBTNhDZGbtmo0OwALE5AWlYz4VER0P3xRe//G3icGrLTpFctpTy1EdjxhvKd0UYNKmCGDurreq8iHOIQmdVRlVn7XEcnVdPPJoOO7TnPWHR0JuqEQvKn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz7c6wjkMrFruZ2/AtYHJb3j8hPxDPCAGR6792LWaK0=;
 b=kmc75bqE5GgaYqo6e6q6zcGKnHR8nRng2hmjMSNmXjmXdpQZT9TnNuo9ew2+/wr8AP0kKdANvCwySwQXxZB1i2HC6VdYT2WYS+1q4z+JH0ZmmSNDTf3GbWDmouTHfIOeYBH7xGmLOWfU5nb5E0heqPlXNsowJxfpoou9rwYHE/zDX6Q1SigMK2zUVFFvKP75i6hhZ0kChioeQzP5gt2QFpxApso+QWfbpUi7u2DdYVmHYCG4jnO8mR//pv1ASAxxB58qnF6FQehmno3J169LEpVdq46ipHJ8EB3Y0aSSuku5QHTPjtQPKkk5or1qTXgyogHrWKaoj60Vx4vh0OwE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz7c6wjkMrFruZ2/AtYHJb3j8hPxDPCAGR6792LWaK0=;
 b=2qvO61+O8t5ytLu8gVxD8xMV/Y9VniPAux+u6xxnI5/uh/k3PgRtTRY3B13MqVaJltqkGV+yBBhnFp/aB0TsOf6V+U7A20bYMlpkKHQhvKeYGMVDS7NTYCZ3eMoF+frjk+DLZfCq2An2bSDk4u9YOqlHU3BAuLLEPkopGt1h0yr2s7jYOlbXdWlZeLH6jKegWjO4tMlw25iXZ2LGLPm05cHcUHVn8Jwzu8wJLoe3gXPdoWiutgId0Ia0VWcV/fCkm2y/oaz17keTIzlGooq9LGLHAqew6Mj+uCOaiNcb3KqkKKF4x1qi3QSGTdQOgNez+onqGtV8pklhUGajhaeywA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59114d3a-b9fe-1fb0-fac3-fe14fe4c505f@suse.com>
Date: Tue, 19 Jul 2022 11:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0046.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feedd562-2b38-4e74-8134-08da6969a51a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W1d4Z/HdQkm/Ew44ofs+AkYVz482+himYmM/QnwQVQLp3e/o/NU3sjnGtLU02MBlA1daVfm25peEIPG6ndO8WobReHE77JCRs/zut6/lPfC3BqQyo0DUlgtZOC7pGm66tNW4zUgCNT6Om0mNmc1r1mTixecjaHinvSvE9QkUbDK3jULhDcd8l9PFb4fPTA9zRwdrgKpRte+WP+nQAcDZkYfxupQnmjD84lTRHqKHjPuKWD3K+8a+lYG8QLJ0EAD6ffECxC2DQuj9XHGYRigRozZiUQD886ii4sSwqH+3z80ZMmZzrqSITLz1bU0K5MlvOuZP871dzs+c3zbLfjji6/ow9H6b13OmX9Z7LWV7Ai2UAPE3TDRbm9fTzhrqUdL1+XDYA8eRsJuAsgE0SeRSYCVyyGKbZIJdVi7NvSIpLVf32kK5cMzPV5bX3eQLwWBDoI3ossbDNArFpiMrOQaqtQdypJyZJBupTzBzHipl5bHZ4r83KdWpbEq/j0dnn276ckJKK8gWzWH2n3NmfF7wujXVCdshfRRQ3pSFWCpXOGvpIThlbXsKXCe4QhvcVEfuiV7BqUq0XPhgewLbKrrEUqqT2NiHAFnqwy0EvF/E8rvUDQW3nDMMc+C5oMoD+BJ5JbhT1fRwSQN/1zh7xpDSLpxLGq4BFhtGxMamUwjafK1tbwbkpjlEfUxD0b5zaJTBp0PjB7YlQa9/CnBJZOLzGvFPgEfPvaIMg+RTf8cHYWIYY4oS+3RKlTYsiIIf+PCHwxp8/2cLBeRT9O5FMfhAcoC46ABBujDIobVJM4XrkJvKDAmUZeeREpEwU4pXAAne5AhdqlEVmc3/FIP731a5QQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(39860400002)(366004)(346002)(2616005)(5660300002)(6512007)(6486002)(86362001)(83380400001)(31696002)(8936002)(6506007)(2906002)(53546011)(7416002)(26005)(41300700001)(6666004)(478600001)(4326008)(186003)(31686004)(36756003)(66476007)(38100700002)(66946007)(6916009)(8676002)(54906003)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZZVllWVHBxQ2txdFc4RnkvdlNnaUtMbW5zRFFNUldWaGtsKzBpUnlsRFpD?=
 =?utf-8?B?aS83VTRXUFREV21UMHI0TEFEMHYyZWZhWjVHd05FcDV6cWVuR1pPNjh4RmhL?=
 =?utf-8?B?V2VsZS92cUs1b3dPWWZtUE1uTTUxTWNzN3loMnFGeVRNMmwwa1MrSHBya2Ny?=
 =?utf-8?B?aC9tZ2gvSUhnalVqM3lYZEZGbmdTWnJHa0RJRlBEMjRsN3NxQzFpZFM5U3Iy?=
 =?utf-8?B?KzdkWnkxZlRLT01RVDRGTGEzam9aMnpQaDl2L3RXVzFxa2kxU0FYQ2c5blc0?=
 =?utf-8?B?Z2N3RXMwQ3QwRlRob3gvWUwzK1FpRnV6UXdKYW9RRkY0WGtGZno3bUVoTzVQ?=
 =?utf-8?B?bHQ5c0pkNVB6UXBIanZwemZ3VUtOY2JmSHpXRk05RUhiYjZDbS8zWWpISDAw?=
 =?utf-8?B?c3RTZHg1Wk9BZTQrYkhQeTBiVmZweVJTZWI0dXVWNGpUQ2lnRnlQVjdyZTVs?=
 =?utf-8?B?aVNicFBMTGQ0Z1l4clQ3MWEzeUQwMHArQ3JRWHQwWmkvZkNsL0FWbXZSdmhz?=
 =?utf-8?B?eUpReWRIQ0FVTHhiMDdJcUozSEVnYkErTk5wYnpzaHN0L3NCaVJyMjdha3N5?=
 =?utf-8?B?eE5kM2RLdHFmQ0VRU0hQam5NVG11WEQ0REVWMGhNeDlWU1IrZU5ObHZhbVE4?=
 =?utf-8?B?MkVQeWZ2LzlkbkU2NTJPSTM0QTVpV0ZhdWpCRTdTbjRoeHZOdjZEM09nZVBB?=
 =?utf-8?B?T3cvZ1Z1TTR2aFZVRWlIR280ZC9XUFkvVlBQMWhDMUc3K0dmVTRHNU9wV3dT?=
 =?utf-8?B?UHdVUWg4cm5ycFJWV2Z1clZQYTEvRVZZZzV2QTArNlFFUnRCcTFOWGNhMWZO?=
 =?utf-8?B?M1FCL1g0ZUpscmdnK3MvY2lqS1pQRjFVN1IzQURENlFFU3krZVVMZHkxUmhy?=
 =?utf-8?B?c2pUYi9lUEl2Y1UvdGJNSmdrVVdGeVBwbW44R2NFQ1dMUFEzbTBWTys1YzFh?=
 =?utf-8?B?VExnaSt0RWdFcWdxVitsWkdLT2VKdFBGN0FGK2QveW43cnozeTdjZzA4clRL?=
 =?utf-8?B?MmRmcmIwdng0T1NOaVpXZ2hvaUE0YUpqWUptb2lCR3p6aU84cnRZenB4bFlu?=
 =?utf-8?B?R29TK2xUaFUzRWhzendRSGNLS0pQSzJPQjRPVUwrSEJDT2hqNkY4RDBVRm1T?=
 =?utf-8?B?TzFCcm5TT01NVzRGdDBvcHd6VW50M2syS0w3NG9VMXRnc3RsZXZQL2pLVjBl?=
 =?utf-8?B?akJ2Wk9adDhWRkVTR2JLQ1pDNVlKbVNhSlZuaXZFc0hVcW9YSjJSbjVvYWQr?=
 =?utf-8?B?NGxKWDRublZXUFBNeXNod1FjaDhYaWgyNUdVditBQUtiaE5NVkdKTFNhblIw?=
 =?utf-8?B?Z3VWTUF5cEcwVjkxL1BZSlpXZEw3aFMwOThRaVdyMFY0eWFlVE11VlFvZnNj?=
 =?utf-8?B?VGtIQXdlRndGdnJVZG8rdVhYdE9TNFNlcUNnSE50VVFGbi80cCtoM2ozV0pZ?=
 =?utf-8?B?bnByTDExN3c1MTVraFZnQ3I2VHV3cHFmV0FPRFdxRlBCbnc1cTZmbUhIcm5F?=
 =?utf-8?B?U0tXdmFPQmFMNktKY05QZVN4NFpibXhXcnQ1Vnp0cGd5cEZISGFQMnMyVmU4?=
 =?utf-8?B?YVpOZndqUXdwaUlweUN6SlJCMFgrV0t3dUJ2RHNPbEVUeUphNXY0cGQzc3JV?=
 =?utf-8?B?TFVvV0ZYMDlodW9QQklHSXVRdE9CRStUWFZOZEx2bWNFM2pKblFSNGVYMEtj?=
 =?utf-8?B?RGtSK1VvQ2pvdTJzR1RPOG81L1FzNjIrL21Ya2lGTHhJbHhGTEdPR1diUElX?=
 =?utf-8?B?TGlXUWdOQ1ZHUk84TFNzU2VsMFkwaVdvaVVlL0lSeGNoSlhlZWx2bG9Ld0dy?=
 =?utf-8?B?UnlzK3UyTnh3dzhkV2FaVld4YnI5cDFBSHRjRmtOWlpnV1owZDJ4ZFEyYUhn?=
 =?utf-8?B?cTJ6d2laOTVHdmlQblZxVlE2eTN5N2tUUmw5cG50UXRBUFp0SCtOVGVWcmZQ?=
 =?utf-8?B?V2lWcTNSQU9PdjBOb2cyQnZITFF6ZXRnVXh4MVZYYUxVNzBiajdYOXBTNUxx?=
 =?utf-8?B?UE5JeGtZRE16c2tZeENOczVqdlBrVmxzdWhsYzRtM0JudldUZnpnMmRzeVlI?=
 =?utf-8?B?SmR2R3lYaVhjR29CODFzUnVORE83dnNjdkl4aTFQTmcvVWxhRi9wakpzQlZq?=
 =?utf-8?Q?XvXsYAjf29q65AaC+fYVxapiK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feedd562-2b38-4e74-8134-08da6969a51a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 09:32:48.9900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86VIsZNidifMx5X4eTjeQ9uI+A6WL2IT63b5Q1bkiAkptk+dT8I/89l2wWi46/WGwD/aRjE4XhPih3bw+ek8sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5679

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,15 @@ config NR_CPUS
>  	  For CPU cores which support Simultaneous Multi-Threading or similar
>  	  technologies, this the number of logical threads which Xen will
>  	  support.
> +
> +config NR_BOOTMODS
> +	int "Maximum number of boot modules that a loader can pass"
> +	range 1 32768
> +	default "8" if X86
> +	default "32" if ARM

Any reason for the larger default on Arm, irrespective of dom0less
actually being in use? (I'm actually surprised I can't spot a Kconfig
option controlling inclusion of dom0less. The default here imo isn't
supposed to depend on the architecture, but on whether dom0less is
supported. That way if another arch gained dom0less support, the
higher default would apply to it without needing further adjustment.)

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>   * The array size needs to be one larger than the number of modules we
>   * support - see __start_xen().
>   */
> -static module_t __initdata mb_modules[5];
> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];

If the build admin selected 1, I'm pretty sure about nothing would work.
I think you want max(5, CONFIG_NR_BOOTMODS) or
max(4, CONFIG_NR_BOOTMODS) + 1 here and ...

> --- a/xen/arch/x86/guest/xen/pvh-boot.c
> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>  uint32_t __initdata pvh_start_info_pa;
>  
>  static multiboot_info_t __initdata pvh_mbi;
> -static module_t __initdata pvh_mbi_mods[8];
> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];

... max(8, CONFIG_NR_BOOTMODS) here (albeit the 8 may have room for
lowering - I don't recall why 8 was chosen rather than going with
the minimum possible value covering all module kinds known at that
time).

Jan

