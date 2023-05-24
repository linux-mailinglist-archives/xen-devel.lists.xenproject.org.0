Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBD70EF72
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 09:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538786.839020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ixA-00065h-Lc; Wed, 24 May 2023 07:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538786.839020; Wed, 24 May 2023 07:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ixA-00062M-H7; Wed, 24 May 2023 07:30:36 +0000
Received: by outflank-mailman (input) for mailman id 538786;
 Wed, 24 May 2023 07:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1ix8-00062G-5e
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 07:30:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb7eca5-fa04-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 09:30:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Wed, 24 May
 2023 07:30:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 07:30:29 +0000
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
X-Inumbo-ID: ddb7eca5-fa04-11ed-b22f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsXkhW7lKze1Tpy5p9vuqcvXiabUC/zcC8EmtcSOukVpwOQ5NWpdtPsCp+izWHmx6FiEy1WE8SM5zls8O0JQ5pElOkN511wvK6BifCOsV4Su9t7crORC5bwgPC1mkGuYQSXOotEWesAE01/4C4lW0jqKOfqmUnaUXPq9+3rxxCiO1EocQjaVkh41Q1jBlJvJ+Br/9mb71C/pNShjgmtUPBxBPODSw8sFk6zH10yQQqJU5e01zQEBLpTSUAXGLfIYzxHkrSHey3Atztub0IGhHMNpi4dVHwGy/lYj94J/vM+EH4kj72Yp7UYBVUosrZXVG99JU2BvEAMeRpz25J0sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx3iF0BllwDVSP4n8qbeh0/VHvSGvqX8Cp2GTZi1pWs=;
 b=G4Mp2IbO0U7dSaVSXbf2zqlnuXnTP/OW3gl/QW2KK8tYrS4dHPkZ6dLvg40egc9jkT8kB40t2VSBUtO6xU58yosySmEts9J6tjRgaKiizrLsoTNIAN+HUz+CqlVWZk5Xxa1Jj81vnq4PH+PYg7cv//bSjOAkW4+Ztte1VaJoAVUq3QrzCbzqLdqif1JEWuz1eTfwJlEPUVTBloNEE1z9VcKxPVShIdyQ9oSH0T9k0v+Oj+oScwNrDU7+gtxPu2AMO28Oz8vGg/0Pa65ary3/J+hTt/iC1ZQ5Q075S6BvVGhlMMegInF5VaB/4eMU2n0nm3CaLtb45DUmxyU0Ytx9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx3iF0BllwDVSP4n8qbeh0/VHvSGvqX8Cp2GTZi1pWs=;
 b=KkAPNNdwFcEJh/LeR2DhLjqggp304c7rBM6eMXt9Cx/anyXIUaBX42RBtDqIgk3xzgi5byhEPJitAQ/fJl+RzhCQ9ZXuBCTcl4Nas7fC8r54qCjN+asZABQd2jHl+xs1vrSmqLNnMngt9yn27m21qbIyiqJ4fydJPeOIwqHkS0TTNdvik2zdJ4tywO5aau7B2V+Gdj1XF8solHrUDOX5io43uDdgGIat0PBkhudqsZ1gohG54R7PClkkIHmJmn017Egt/Y/pfL2PyUQSthqt3AKwfYpOpd2Rx/Rj+vLi+GWv3OPH0/NShKNekZDgEIbBT/dYvk6ClANmEJIzYSkx+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce24476e-6e20-576c-7f9a-74d423776634@suse.com>
Date: Wed, 24 May 2023 09:30:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 06/15] build: quiet for .allconfig.tmp target
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6ff75a-b639-4411-a231-08db5c28c03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jwjB3w1/kuCPwO8+WOAotE0aR8g88x0XGuO2bU8eDAMR5S4Mo6lKvSfAlrQRU5IC/LodmP0K5tyT0zVRYRyL8/u6OjKj9XMcgJ0HhBcClOpJqNnKBAH6FEeIfPmdeNj2QcmCR/V1TBJNvmY84vAYVu+iICCl7LFWGyhuvI6NnmOnhl2g/lWYAKsfRJ+ubmnTp9taMIFfhZcrEF9HemUTntX8+50+rXyKC92/7FGyuyQVXJMiMBkNeYxuLPSw934WixsX4EpljpA9/Xd7gfUJ9TDvKwk/rQKoOJJ7h1MTknmaSk923rskxZi+5LMDZRflceyoVoSU/knIJTKX9PSlNk9K4BXpmPDz4Beovc/e76m22Nhrf03CM4tOHFYy1VXVSgNKYDOv4jAlL9C5PvT0cSKWecWcE4YTcH27dg+pJmC4PnSsSC0L16OuDv6Cos0aqmKVifrIzsmakqRVE+IP1qn4Txs5TIGZQ9D9pktu53K+VC0MlCx2oEWqsZY+rj8DjxW4mFXRW5etiDpYbk2AZn2CZC8QXJWz9Q336MeTg+ppukpL4nOk0B4ERtWLwWJy1Ujef6WMsOvL1RuiCnNHrgKU1s+/LFWfEgD8TMa9bQ9ptn3i1UvQjJpjsqekL/tWpgJpDC97vbcr82O3GtW2lj/wuzyMxCnsMXxFfHYvPK5oPyh2hw2LGfNTWQyjSbsA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(316002)(38100700002)(31686004)(54906003)(66476007)(66946007)(66556008)(4326008)(6916009)(41300700001)(478600001)(6486002)(86362001)(5660300002)(8936002)(8676002)(31696002)(4744005)(186003)(53546011)(26005)(6506007)(6512007)(2906002)(36756003)(2616005)(83380400001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVpNeXRyOWdwdXlRVDZIVmdlbmppcSt3SE92RG5hS20yMWNldklCUENwZHFI?=
 =?utf-8?B?L3RWSHFVcExsWUtNRldtamdEUGZpY0d5N2N2QTlOdFZoUkc3UkdGRjVNa21h?=
 =?utf-8?B?eU0wT0dWT1lSeVg2Z09JZ0hWOVRuRC9iUXRWN0p0Z0JmQ2Z1SUg2WmpYVzh3?=
 =?utf-8?B?Q1pObkc0S00rOURtaXlqOEZ5Y3BlRUVrUFgyeFlJSEZMenF6c0VldUJSODJL?=
 =?utf-8?B?d21TakJYcHRQU0hDMTdLTDRObjYyakZ1M1d0S2kyQWh1OWxHY08zbkVxenZx?=
 =?utf-8?B?NlZ1bmRZZ3pPWTFqSDBZd1IzbUpERkZORE53RnVpQmxrak9IZHFLNDRHYm5L?=
 =?utf-8?B?RHF0YVNyUnRNQ0trK25oK0N2L2lncUVTaWNRN3lxYWR6QVhDZFJLdnArWVFi?=
 =?utf-8?B?TGpaMUtzbmVFaTNaNVd2cGkwdDYveDhzV3dwQm5raVVmSUc4dE8wU2QxUFZS?=
 =?utf-8?B?dDJwTW9LbkZpTXdEbWtmd29SUURYVlBmVDdSaW5DT1dEL3U3TThtcmlpYlps?=
 =?utf-8?B?MTkyUGp3aW5EeitwTDdkNVI3YXpDdHNMNEdiOUVSVWhGTG9hckdnVlhpeDUv?=
 =?utf-8?B?WldIdTl3TFFOc3hweEMveGJMNkRNTWdCTGhhcmZqRzdmNSszZ0VwaC9SRklN?=
 =?utf-8?B?UkVDdU9IcnBNWUhJdFp1blBFbURiTS8vVXBqLzVNNmpOREVIbEhaSkNKTTJr?=
 =?utf-8?B?ODlVRndZOS9XMEc4RXdOZ0V4VDQvMGdTb3VrVTlhZ2VNMkhXd294S1Uxdk1B?=
 =?utf-8?B?eitTWWZSVldjMTJFWm1OYWhYZjBZZXR2WmlTT0tZMTI4T0FNUUl4eFZMTFBw?=
 =?utf-8?B?SGJFYnlkRnNFa2hqd1hIMUMwR1ZUOTU1bnBLM2ZSTjZDUnk3TUY0Mk5iUXl3?=
 =?utf-8?B?WERMS3N3cmJCamxTOVFTQ0w1YmdqTmVuRm51cmdSYkhKb2lWbjkxd0VDRlQ5?=
 =?utf-8?B?a3VMSEFGblh0TDlQN3V5aU1iTmhZQVhDUysvcGkzMGtwY2wwNWFXbW0zck9m?=
 =?utf-8?B?ZUlHajN1aThhREVPNHdrdDlFYnVTT3g3YXlZNGhTYlZycmZtMjJVTk5pQ0tj?=
 =?utf-8?B?d2cvdmoycFZzK2VKeGJ2RHcwWUhNZXc1ekM1N0RVdVp6dHVKYU5ZdnhoYVJM?=
 =?utf-8?B?ekYrNTlkNVEwYkV1MG9WSUU5eTRoOGpSOHRIK0ZxWmhOdVJxWUN3VXNENVNs?=
 =?utf-8?B?SjZaS1R3TzlPc1hTdzdBQ2NLVmJLblRPUDRoNUN1dDNhVEg5VTZuT25WTFVB?=
 =?utf-8?B?Y0pqTnRJejZaM0U2NEtZU01VSmttK015a0FMM0NTR01Ud0JucDZYeTk3ZHd4?=
 =?utf-8?B?M3UwYW9NbitpQStXVERGdkZNL1lldFllVFM5REVodHdrbXZ2MDg5bjBrVUJZ?=
 =?utf-8?B?aXMybnlSNGR5cEpCRFlFY1VBV1dPeHVUcU8vQmo5bFAwVnhURXFRUXYxMUJ4?=
 =?utf-8?B?ZHEvclN1NUxHNXNIcWNBMEFyczhFRDBGTWl1N2pHZG1sUGxud0RJL2Rha2hi?=
 =?utf-8?B?TitMVTFqYU1tOFpMenVHUE9VRFdxdng1U1liTVo1RTdsdVlZSGtjYmQxRllp?=
 =?utf-8?B?ZjdIaEcwQ08yNy9aZzFrcWhSTjhBUUh6UStFOXExSWJGSjUrV3FZVEFyRHpO?=
 =?utf-8?B?NWdxRTdPSSt2YzdPQWRic2J6R05jSmdmRlRDY3FreHE1OHV2SzNXSE82ZnhE?=
 =?utf-8?B?V2ZHVHFDSXBOcDVUYnQ0bG52T0FhS3pyQndrUlV4bmF1QVkrcUlvNEpFYkRT?=
 =?utf-8?B?MDhCNndlekh1d0ZnSlM1ZG8wT3pXYlJuc2NlWHZKZHlCS0NCam84dXFIRXJL?=
 =?utf-8?B?Ny9Ib0x6cHFIcFVaVUgza3Jtczg1R1drb2dOMEZpeVRPbEdPdDBwQXNpT2JI?=
 =?utf-8?B?YWkvbE1IM0prMEFDWjhrQWpSbDNCNUNBVHBXR09uVFhPNXpyNUZZZlJXemwy?=
 =?utf-8?B?anUzQUxsWjhGZW5RaXNzUk5FMVpSK1orckZmMUw0b0pwNlRjRXNYbmp0UzZ4?=
 =?utf-8?B?RCtXMElJSUVZaDJtRytYSVlhb3pYRCtieHdMb3RQS3VJSUtaRmZYSWNjTlVG?=
 =?utf-8?B?blZZYjUrbitNVEdhT0JFMEtyTXJodGJZYk5zYVVtZklSa3JqNkp5R09md2t4?=
 =?utf-8?Q?oc3ABjk43CjJh/G43xsrb7ffu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6ff75a-b639-4411-a231-08db5c28c03f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:30:29.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLc/WsuuodD0M4igVseoSUjpZXgybHIU4zHD1GvKl2wQkiPyNaZOBTx/JQ+0oA1/oyKajNJvs+KfgMcNbhRHeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325

On 23.05.2023 18:38, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -339,7 +339,7 @@ filechk_kconfig_allconfig = \
>      :
>  
>  .allconfig.tmp: FORCE
> -	set -e; { $(call filechk_kconfig_allconfig); } > $@
> +	$(Q)set -e; { $(call filechk_kconfig_allconfig); } > $@

So this then leaves no trace of the generation of this file. This might
be okay, if only the file wasn't needlessly generated for e.g. "make
syncconfig". So I'd be okay with this complete silencing only if prior
to that (or in the same patch) the dependencies were limited to just
the *config goals which actually need the file (and the setting of
KCONFIG_ALLCONFIG).

Jan

