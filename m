Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CB53B592
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340948.566091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgi4-00073k-N2; Thu, 02 Jun 2022 09:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340948.566091; Thu, 02 Jun 2022 09:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgi4-00071I-JF; Thu, 02 Jun 2022 09:01:40 +0000
Received: by outflank-mailman (input) for mailman id 340948;
 Thu, 02 Jun 2022 09:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgi2-00071C-TA
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:01:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c2e2049-e252-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 11:01:37 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44-D7V-1X0zOKaG90eZ2DFGaA-1; Thu, 02 Jun 2022 11:01:34 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:01:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:01:32 +0000
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
X-Inumbo-ID: 9c2e2049-e252-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654160497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4JFGsBy5OgRtxViF+1rg5wEOUhlGowDONoLjfgoE/s=;
	b=ZKjQHoV56uk0g32tV9zdjsjKZwb8ix5eE9TPTwZlE/5Rx3uI0qcdkkwga4HJpE2TWgLuWr
	WLf7h+xbKzjMhtzh5zoxE433ieCsf+bh+7yZQILgQbLPxbSceXkxm4kl2Ffuma85ZVvKwi
	iAg2sApGTUcQ+J4FHYpD65p8EbIjdAU=
X-MC-Unique: D7V-1X0zOKaG90eZ2DFGaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDOJyq5gyi6QFrOFZd8UyhgOaBi4p81rAcf5DFw9KFtKdHds3V6dYJ75NmAmiVyf81HyJmCW/47T8bAHO6zMoYAtMbJKPTulRbrVYr1DuOaJMXjKbVt3NEFAInIqhA6T3d3E6JypHX+huh0Rh/tPKaD/nL/MFhSpmxV5YZUhhrpjwNe3SpR7bp9Gn/KAEkEdNajZvbvLOxSXtlqJOFm4Qj09Y4NoPK8OLuu7Aur8ZIqwIvAmeAcmUpVMC1/vD4nA32WXcDZlfcBjqdmEWsTHfyD+n0niLkEz+RKitANRuAjFEVkaoI+ekqIKD18rAYjYWyZSpijOdf+jXrFOHrmnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4JFGsBy5OgRtxViF+1rg5wEOUhlGowDONoLjfgoE/s=;
 b=Gj2rOtVy/t4ZCtcFjTUdj3NP6vm+dJAqfnnxeibLqnKlS+VkwIDve1XcSCoYqspLdIQGMIHsQZLRIa6E0qmz3nnZx+6eYyT5uubvrhbs/HiUsXHxRl2RB+Udnvp58Jog3BiJxB2huHBXi77vBGhMv0n9OIUGWx1U4rcuGnhmRtSNV7c1zRBFW8utdxXIq0kffAeRGUJJuSuVpOLYRbjwY8dm33gTMGPsTmvaM5W3z5xD7pHGb8CTQMjrvnBteGpzSnFFIKYXOKB+A+VSxSBUGk3gmEkY0BIRITEny3B72eOOmX4VwKF9KhHcRffG+lD6TsrpPQuQQA5oyaIsukSuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <092852c0-d833-0c7c-1bc4-5d2e86610a4d@suse.com>
Date: Thu, 2 Jun 2022 11:01:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 2/4] build: set PERL
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220601165909.46588-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0084.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba588a5e-64ff-4388-ebca-08da44767d3b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB882290FBD3518512A444B724B3DE9@DU2PR04MB8822.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAPfAAWooHmjfQAHyu9c4GDZfBWfn+jBu2OnFOHJEsgvq+9oHYH+GCmVrBsZGvbH778Cr2ih9CYPNbQDaryFuSvz53HQnTSsD6NtfaUH2H/UZOnkaSFppM0CNuk0a7M5Jl9H4ZFzw1uk3kpKgf0jgDfNw2IKtd8tqg0EcIX591247i3hdvFtz7eAwnjfsWwOfztmG0A5VsoccofjN12iuxeXB5ZZByn8kL1CyUPeCyn3k/tT/pKf6i9mcezpwPgVnA2oTfoDPTQwFiykJxLt3slUqxgRv4oCxUayQ4AOV1g94PmyZdSwmz88ixGMb8zZObZpiXqvR+cosY/C6tL/+5bC7AovkJQONJrPvYVPvnNX1FDy5lPfJjmxTLEN4w+iiAAX0K4CZM23J9TOKJzaoP4KCKaF8rIZfP9jdLtrGosFMSGvZfphT/RFb9YvwXzLmLgKDQFuryoRbzb1SmJ1SPEAAWPwEfOOTL+JIiBf45BDqWzSLKuGwcKeKfmIJIg8EVzdgrKvDNyKpoPLDFJaNZ5SX5jcdGKqwy2OplswcSocaxboOp525Dfeqsh12rQvQtmX3l+/MkAr4Bwr987mdXpzLJZPG6a/S0zHr7E3aVk7psZyZUcar24fa6MqNSUsfeGh7+/CjR7Q4woHDqRRUi3Zb6PqTtBzU/vjdiagkFveFy2r7X+n2F80L8phsHmPuJNj5Kk5ybDSFD3fiG4DajJ2gMgtbP34TNlEXs2NgG1//lQKXq/DubnR1Iv4tLN3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(31696002)(66476007)(4326008)(66946007)(8676002)(186003)(2616005)(4744005)(2906002)(316002)(54906003)(6916009)(26005)(6512007)(31686004)(86362001)(36756003)(8936002)(53546011)(6486002)(6506007)(5660300002)(508600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9OUmZIRmpZTkJ4cmFnMk5SRTM3NkprWmZtNGFnYktLSFJDWmJiVkU4ck50?=
 =?utf-8?B?WDlUL2NXbTVDYjVkdG1VbWlTb2dVUDE5NmNQaXFCeG9vU1FSWE5NNzVXd0xr?=
 =?utf-8?B?aWdnUWZGUUV5MHN3NDBNUmh2Q0l6MXlGNjlNWEUyekRyZTBoYk1CV3FMS1pa?=
 =?utf-8?B?cHJZNXVIVFY0QWpveSs1cERMZmx1Vzk5bVBSL0xPSlRLaWlrbW12N08wT0Yy?=
 =?utf-8?B?R1dBYSs3cTlrQ0JWWnV4UHBRZ0RQZHNIUi8rdTJoOVBxY1dJY2wvMkZyTHlH?=
 =?utf-8?B?cUROZjhPM1czU3p6TlhFWDRaYVhtUVJ6aU4xVWdsM2NsWVV3YWgzZmt3aVVu?=
 =?utf-8?B?QUJKL3FxT2tiWkJPcjlPTXREbHFldWtTVWhjd2hlbHdNU3NkMXR3Q3V5aGlG?=
 =?utf-8?B?K01qVHVSeUpkcnNLS2xpLzhsYWNldzNtSmExS2NKZXRXcTFYTE5USzJ3Ykwz?=
 =?utf-8?B?MmppTGlJVjZsYkwxYU5EckczbDFhTEtMK3VMTjlmTlhDZ2JlZWtPVE93SG5m?=
 =?utf-8?B?RDZIWExRNEVUUW4waUt4eU5NZFJsK0o3R3JJUmdyVzlFV0t3SUx1ZFB2NStM?=
 =?utf-8?B?em1ObWFRWVFlWEVYRFptVXdPL2tGaHhJdVIrYXRZVFowMzhVVmUrNUgvdGJk?=
 =?utf-8?B?Z2RsZVRTcUdGRVFSZnRuSnQ0alJDc3FJRE9udzBsTlgveE9IVVZDNHZHQkwx?=
 =?utf-8?B?VVdRaC9xWXZ3LzZPa0l2TnEzQjZBZ3VETzZSSktZUmYvWk1oVEprMjl1T0Q0?=
 =?utf-8?B?cWpCR09qOHl5T2FTR3I3NmkvQ3loRUhVMzBlTm1KbmpUcnFVMks1VDdCNElu?=
 =?utf-8?B?ZEhjbFZ2MDV2eFJKL2xlT25kcWJCVGdraFp1SGVsNzlRMzc0N1NEb1Y3T2JQ?=
 =?utf-8?B?UTh4R2h0NEUyd3gxTkY1aHY0N1hDMDlxa2pZMEx0d1Nwa1k4UXVleHo4aUpa?=
 =?utf-8?B?ZWtZMGgyZjRpY2x3S1RPK0NkaGZocnFVazJmY2M3VDVvQjBhWGVvNGdRYldu?=
 =?utf-8?B?NExCUUI3OC9seThWVHVTUkxCdHJnZC9PQjlWd0Vad2FXVXA3UTFRKzRUdHhI?=
 =?utf-8?B?OHJPaGtEUElSUmZ1ZTlQY1Iwc0dUKzMwYlh4aVdSeGJ6UWVpaFRmOVF0b0Ix?=
 =?utf-8?B?cG4zSHJEWG84UFYyWW9SN2lGZjdNajNQUFNOU3U4cGptU0NFT2JsVTc4blhR?=
 =?utf-8?B?ajhLcFBiMW5nT01UY09waVdRdGZsK3Vjc3R1K1JJaGFrdVNCSGRWTE40U2Jq?=
 =?utf-8?B?RzRkc3RTL3NFUmF3b1FEVERvZGR1YWQySmFWODRQS1RwdE53d0kwZW50bHly?=
 =?utf-8?B?aXkrOFFPVTF5YUpoUEs5ZzB2RzhWb3g3TmNPOXFGRm91SXVRdHRhZEdTdnpL?=
 =?utf-8?B?Z1lxd2U0NEIvWWhpZEk2NmtTU3FHdnZQeG1RMVJEaXpVZUNFcDhiSXBHbSt0?=
 =?utf-8?B?SUhZMENaT0JQS0tsUEZpMldZVkNoSEM0RTFBcFNSRmJtUU5SOXlwaHhURExQ?=
 =?utf-8?B?c1crZEllZWhBanJ6RDFaR25OK1ltSjNNYjJ1emhVMnJaZFZQSkZUdlU5SUk2?=
 =?utf-8?B?cTdSWWlhZ3RLSXhGb2xTWG9Rb1AyclhEa0lhaG9JRGxGVWNJUkxnL0IrMVJp?=
 =?utf-8?B?c0ZrTE1weGVDK2JpN09JajFTRmxIRGdkalZ2LzBnQkE2ZkJXWGltcTZ1Sjlo?=
 =?utf-8?B?VmNGdmhnZkZyWDdXdVBYWjUvc1Z3Wjlwa0ZmVWVNT2E3UjBkbjROcHVFZ0or?=
 =?utf-8?B?WldKN0h4ZFJSY0QvOTZCV0ZWbG54UlVBZmtRajE1cGtPZzM1NnRxWlVMVDdE?=
 =?utf-8?B?Y3k0WGxqbm9VK1g3K0RmQndOazdiTEhUOG1GK1JMcEVmaUNqN3N0MjVvYk9Z?=
 =?utf-8?B?SW5XOHI2Ukh3YUxIR3JVOWtCbGZKWmZzbTYrbG5DU21OZFRaaTY0SGxjQ3k2?=
 =?utf-8?B?VGkxMzI2Y0p2bVQyU3h5OTN2dUpHOGhZSVlLOU5jcW5KSmViZFV3Q3doMU1H?=
 =?utf-8?B?eURzZ1BZakZla2dqemNLZnhHMTE5UDRyNUMrcXBxak9TL3Y5dFBMRlByTzRX?=
 =?utf-8?B?Y1N5RnZiOGtudWNiemxnOWYrMS90MG1qQUZQd21EcXNyck9oN2dFWUFQR015?=
 =?utf-8?B?ZHJWOVlhY3VlRkZYSWV4U2FaWFZFeGJWUnhEeDljZ1dGTUNoUEZMczFlS0VL?=
 =?utf-8?B?U3BxRHBqM21GbFIwTkNIaUVnVHlvVndsVTh3dWplU2pzVVhyaGVjM042Um8w?=
 =?utf-8?B?SURBR09RSmNEZjVPRWFCR0NwTzdyUkR1aDZrTVE5OVZhQmJtUHRwVWR2d3lJ?=
 =?utf-8?B?K21lTUNsWVkwRTJ4R1RTTFpUT0VnNDBEZUt1K3AzUUFQTHFUNjFyQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba588a5e-64ff-4388-ebca-08da44767d3b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:01:32.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cKk524xCqwhjLcDqcHOKFb69amFYkiZWPAdMvvdxvSVA/ZX7s+oXY3x8ob9KFg8+cWTPiEeXBfbCUPICf2NNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

On 01.06.2022 18:59, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
>  export PYTHON		?= $(PYTHON_INTERPRETER)
>  
>  export CHECKPOLICY	?= checkpolicy
> +export PERL		?= perl

For the intended use, is there a minimum version requirement? If so,
it needs documenting in ./README (and it preferably wouldn't be any
newer than from around the times our other dependencies are). And
even when the uses are fully backwards compatible, I think the need
for the tool wants mentioning there.

Jan


