Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEB7D81E3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623734.971863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyen-000196-QQ; Thu, 26 Oct 2023 11:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623734.971863; Thu, 26 Oct 2023 11:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyen-000175-NY; Thu, 26 Oct 2023 11:36:09 +0000
Received: by outflank-mailman (input) for mailman id 623734;
 Thu, 26 Oct 2023 11:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvyem-00016z-9n
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:36:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8395ebf-73f3-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:36:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 11:36:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 11:36:01 +0000
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
X-Inumbo-ID: d8395ebf-73f3-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D52EH55JffuXmQOuTtvwRWlt1krRQSJfMqnPO1571AvvQvUA68LKqF8NNn32Ya7GvMkKVr5A7mvxSAHfF+gYzMI7pmwyHgAaRWxqtItVOLcTugcvmXfAoNoGJROvg26SyACKYMaNZPWycDZWUHy8yNlUzzL5UweB0Pfg3M0o6o326SqzcKCWcwQIh0+3vNEZE2z4isQKZRa17nnve3wS0shgD2euw6cBGtW5I/B1e2XxpxSrA/Bb3CMGyuVtNYTVvC90i0vAKTPEySdiXncINhr5tnIfmTH3POf6AzCv6rH/XQQw7mhfUuH9o/3mIIbLLkznXUTVZiRoQlJwTMZLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnuCnFYrID+nm5Gr1MKRMGLOEdQ4wkVNVMIMwRNyRM0=;
 b=H9xg7g3FQ13zHgs/qVMeHInHjRMD3M8Tv1mLauijpZYZOBwjP2bITpOo9U1ghdgLm58rUJbeyfExcXctaAeiBctt/sSvTo/aK/lySZ9IStvl4g/+hU2fO/usKKnDU9zf3RtsIUfeXXOLNSI2UhQCX8cVxZzzdgtT4h7Xf9r2TAJl0Cyc3a1jqNadbys2Qh1UHg8GvLuz644f3C5pF2YgtEUd4WIiiQRLc6tu3k6xgIgy12Zet92aXYFuBl19hdUy4HkV6aPXGKMSVAj2azC7jZDSbAL6S+6bA2GIdpNj94kAbDYwSpt4napJt6EnPrDUHS1VmNsZXsQ7an0SrSd0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnuCnFYrID+nm5Gr1MKRMGLOEdQ4wkVNVMIMwRNyRM0=;
 b=TfCZ2VFGzGIn1mK8n+quZodMCVT1qDNqiNrvOzxzS5PR+phwGiyq/7/171FJwYOzANfPqr8yw8L6T6ZfnmbUmtHC8mapdENJmVVurp7VMrh2q5N29XGV+nJgdIl+KrBFITGhfbohcITyW/pNSLECTpOPtK+D5XcQ+49y7L5x/gvtYTkmNHaT4w7X8jHsE9OppsSUlU0zJwHwGSufz7blMcAk5Lnsq4AlO7MnCsHHONOmNOPb3H+YD3Jy1Hz8XVrrZ4NCL6w8d1mCerO7Y7njw5iUkg2uU5UqTasxz2A7aL1tPlu4Tt2LFZ0P8TMVzNbRXOEJisScwDbtZkFAA8CerQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07fbb9b7-e6d7-9abc-a64a-a7972b93b9ad@suse.com>
Date: Thu, 26 Oct 2023 13:35:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
 <20231025180630.3230010-3-andrew.cooper3@citrix.com>
 <85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com>
 <0d67d2c6-1841-4771-9e6e-1a6463c0b443@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0d67d2c6-1841-4771-9e6e-1a6463c0b443@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0373.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b69e7af-a474-4245-4c8b-08dbd617baf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8W7ksSTjCH3BVEdL2ARJahhekJa/Et90cSSfC4vQ7mZ1fBsoBz83l+rAGrpTACYnihhRvIICZq3hpHGtpx0ygZDaddiDHsRmypsFKdcHhxqIngWqt2eTa73y5jx6pGjJHD7EUzb47e2DUxSXvjCvEJqs29q15aTPHgSbrS+T4St3IiX2k+Y/qyw6982h7wVl4IBS6z0FBd7PJRl4XBWO4n7fSrOpzm90nrs6fahgkTRBHsnADmLKn80vSIePWaID+dTdifKh4ghpHr0cdo/KDl4BXSmUbPr42hJRh+3SzdvHyoYNrlD+xBCtU2179Yamj0EYn7Si6jqxy5/n1DdsCJlZfkAFzzWmqGlGF+CFISmGDXshHGrrfX21vrlR/zax/ZcGN5xMRPlpSq2MKFjGd2H0Qkf2RGYhU3kR5/9ga0p0R1DCtFbm3x0fb6h3YbZ5qaXpx7HvcmPpc5TDDDVl5yXqLtbHpyMKpCazBakWXggKLX70+3Rgq8aFNz+8PNrp1dTM42Rf4s7qhhrQ5GSjX/sxeueNkgqSE/10UL2vf6GfCLaD1IGltAtvKoemwuU1Z4hNCR8Zomno87pSe/giKLHyT4kspx0FFoVn5JdlORZKlT4VUS1AEPmacp+XFjKxzatyI8xsnIQix3D7RpsFug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(53546011)(6512007)(6506007)(86362001)(4326008)(5660300002)(8676002)(8936002)(38100700002)(54906003)(66556008)(66476007)(6486002)(66946007)(31696002)(41300700001)(6916009)(316002)(36756003)(478600001)(2906002)(31686004)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJaeVZpakp2N3poVE9hQnNxM09Qb2NRdmlkSDE1V3EydVpDaW4zZFlsNCs3?=
 =?utf-8?B?K0tOUWd4aWtmTFVrTnVBME5aMStjeEc5OThMbUQwa3Q3a0FzSXhTaDdoSzFo?=
 =?utf-8?B?NjlYVGtMZE5xdGUvUW5qUGN1cWMxaFVsWXVmaUxJMHJBeGlBZFlqSnhjRHRm?=
 =?utf-8?B?Q1JFdXdtOEdHY0EyazNxYklnWFhxMjQyZiswbUYzMStoSGthY2M4QVA3c1R3?=
 =?utf-8?B?Tnh6amhGaU9qWUdJSjUxT1R6WTRENkxBRjFNS1IwcDRQZjh0K2tzaWl5ZGVa?=
 =?utf-8?B?cW5RdGVSdGw3K2ptbDhhaXNhd1lrZFVhVHcxV1VKcnJqczhaM21nNE1HSGRy?=
 =?utf-8?B?dU9yYUFsS0FyWkVnM1NwOU0wNllnVnFWRG5EcW9tZnNpVnhRQ3hiNXRGYmdP?=
 =?utf-8?B?a0VyNTJuTFFzS3VHWW1PUUpFMVF3Ujk3bXVwSHNnb1Btb1RVN1ZZTHQ3cmFl?=
 =?utf-8?B?c1BONno2c2t6bEEva25DZ0JzS003L2dwdGpBVFozeXN4UW9Ga3RUVTMxNFhP?=
 =?utf-8?B?OEhwckZZcC8xQWhYZHFnZHhxQ25sWWhNaDZ6eVY3VWZNWlpOVUNqZGEzRGxX?=
 =?utf-8?B?RFZXLzZDaVFoS3hEakdIekJldTRpMGZvSExid1k2a3RlUHgyMWUvTkV5T0pK?=
 =?utf-8?B?MkR2SmQxb0JGd0cvamtOdE5DTWZKdW5Wcnd1emZNU1FzaXIrMjVTRDdjQ1or?=
 =?utf-8?B?VFFSeW5VMTA4Vjhnbm5wNHFOdkdONkR6UFJCK1JtYWoyUHZpejE4dUN1dXJE?=
 =?utf-8?B?eEdOZGdKUUMzWjlwZHMvSnkxQ0gzdzA0S1BEdGVKU21rUHd2ZXBOcXIwR252?=
 =?utf-8?B?UnR4OHliS2xYYWczQldZYjhaUE0yNWRuM3hRdUZLd2NyVmhWS3JvcHdNcHRw?=
 =?utf-8?B?Mm9BdnROM3BBY0NqMHJxWmtDdUpKK0o5eDN0Wkd2YmxnTFpwWnAzbzFyeU1h?=
 =?utf-8?B?NG45dEluWVFlS3NGR0s4WVBOUzFtd2UySlM3UlJ0WU1wMG9yYU1WbmFCMGJj?=
 =?utf-8?B?VkNQVkhkRXo5dHZvU2w3cWhzVW1TSzkrVGE2bERvNSt2blQwVkxoVXpCSzF3?=
 =?utf-8?B?UUpyZ1UwMlFTT2JFNUpBL0tkbHFlOS93VnhxWG1QR0lRMm5LVFNqQ3kwb3Nr?=
 =?utf-8?B?alNtS2ZsVzFJaUJOQnpZbVR6ZG1uMGd3QmlIaDhoYUFUYkVqNnRjbU1XTm5Q?=
 =?utf-8?B?dWVZR01zTVA1MkdhQ2lITG1ycHRRcEFwWmY2ZlJBdG03QU1IS1dtcituMTV2?=
 =?utf-8?B?ZHljQkt1QW9ZVjRDTnRzaEZRQmo1MjBuQkwyTitIekt2Qk9DVEMvZUNOVS81?=
 =?utf-8?B?d2Z3TFVzbHorRUZRZHBBdU1JVU84VXJoMkcyeEt6dXByTkg1Q2RLalFpYSts?=
 =?utf-8?B?RG1ETnB6aDlHNi9zZW1uajRWS05VQm5jbkUrRlJXUzZOS1NuNElYOU1PMnJP?=
 =?utf-8?B?eTlFd0Jid1pZQ0dCTzZUVHR2NnJmd2NUMlNDdFNpQVVDKzkyWDJMdU1MMGxD?=
 =?utf-8?B?LzUvUkdrWHFhMVI1NW8yUU12Vm0zTlpCQU5wa2RPUHphd2p2NmlnL3laeEtz?=
 =?utf-8?B?QmlEcmZHYXZyc2ZnWGhzRTYzOUFTVWxQYUI5eGxyenZKRmxLN29YblZMRFBz?=
 =?utf-8?B?OVhDWEFZVmhCWkQ2YXVSdDcrOFFxblJmZW1Kc0VmOWJJVkpNZmFJSkttNWJr?=
 =?utf-8?B?VWIySHlHamVVRGtsQjlkNFI0N1dCWUxnZXRROERuL1BpbUMwUUM1M3Ntd1Vu?=
 =?utf-8?B?SjY2K21UODVlUDI4SUJZcjBRaUd0b1daYmczQ2JlODZDaGVTWnArd1IyeVNK?=
 =?utf-8?B?QTVvc2h1TEt3Tml5K3d1S3plbVBNSFdIS3l3TlFCSDJJWFFCNFR4djcySmtT?=
 =?utf-8?B?Nnh0bTlkcGxXdTVqM3czZzhJSkxBSlpHVno5M29BWHVuSDEwdTRnV05RcEt6?=
 =?utf-8?B?RUdvb0hhSmVBWk4ydHJFOHpETm5rQjdSdlJZL0k2L20vZGdFVzJUcEEwcXpN?=
 =?utf-8?B?YVhhQkErRnlvUUVEcTAwRnNNY1h3ZlZ3SkR5bWhIcUtCS3FrL3Nub2JKbHZk?=
 =?utf-8?B?K3g2QU5LYy9IUnhhMWsyUG5Nb3hTUDRONXBjRk5JdXl3ME4yL0pVZm9ML3VJ?=
 =?utf-8?Q?+pBIJv/2aShsVmoYRsKpmKeh5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69e7af-a474-4245-4c8b-08dbd617baf2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:36:01.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOkPwgI59n/nImjBKoz2HdKRMeLH8IF/2bR4aIhf7cHISWhvFCGQQzo3k2o74kzAstsm5PTNuKSmWB1aHJLHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 26.10.2023 13:10, Andrew Cooper wrote:
> On 26/10/2023 8:55 am, Jan Beulich wrote:
>> On 25.10.2023 20:06, Andrew Cooper wrote:
>>> We eventually want to be able to build a stripped down Xen for a single
>>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>>> available to randconfig), and adjust the microcode logic.
>> Linux uses different names for the Kconfig symbols. While I'm unconvinced
>> of the SUP part, I wonder whether we wouldn't better use CPU in the names.
> 
> I don't see what that gets us, other than a longer name.

Just to mention the (I think) obvious - on the IOMMU side we already have
AMD_IOMMU and INTEL_IOMMU. It would be odd to have just AMD and INTEL here,
yet then ...

>> One immediate question here is how the IOMMU interaction is intended to
>> end up: Do we want to permit either vendor's CPUs with the other vendor's
>> IOMMUs to be usable?
> 
> From a randconfig point of view, yes.  These options are only targetting
> a specific platform, and we can absolutely make that the end user's
> responsibility to describe their platform correctly.

... <vendor>_IOMMU not depending on <vendor>. Whereas the lack of a
dependency on <vendor>_CPU would be quite natural, imo.

> The more interesting question is perhaps VT-x and SVM, given that VIA
> have shipped VT-x and Hygon have shipped SVM and AMD-Vi.
> 
> I do specifically want to to integrate the HVM setup better with CPU
> init - KVM dropped an enormous amount of complexity by doing this - but
> I expect we'll end up with VTX and SVM options rather than using
> INTEL/AMD for this.

I'd certainly prefer us using VTX/SVM (and those then having dependencies
on the main || niche vendors), with the caveat that SVM also has had a
meaning for Intel for quite some time, iirc.

Jan

