Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE767D7DE2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623544.971473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvDn-0005VS-7e; Thu, 26 Oct 2023 07:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623544.971473; Thu, 26 Oct 2023 07:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvDn-0005S9-4o; Thu, 26 Oct 2023 07:56:03 +0000
Received: by outflank-mailman (input) for mailman id 623544;
 Thu, 26 Oct 2023 07:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvvDl-0005S3-6V
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:56:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191e961f-73d5-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:55:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Thu, 26 Oct
 2023 07:55:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 07:55:56 +0000
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
X-Inumbo-ID: 191e961f-73d5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJIxU6moI95qNz/+6KRy4fP9MNR2slEka8C9SyjAoPg6XkOVhJwuqa/XCV2/A0BZsfnU9sFbPc1ZMsWqY1RKsE/Qlly7Tg9iv9C4f2JprWQYgUzwJQoWJs0CcJK7r+sLESr3+dwjEtFNtZDxNE856qJxWKKiJHGn7O9uUVHIpBmmm9yHcqqxhW5bJ6LyaA1RoShw1Ths4OhtrjHczQik+5J1eLHZqzvL2KoteynG3HuUaxeb7+JqMHTJzIH5WV32GkUvvyutkWQWRtED1u9njrWrnfprfnL/84FwnRuTmjMvUWg5eqZaImfzBL633ooveZHHCCVcwI81SPLfU6zjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KperA67NHhVdPhHvryRtO/eew4wsEJq0Eq9CIUinfPg=;
 b=Sw+ZXJaM1ybiPB0CpnMBv7hXFU4zzgLn76P04LZa+uAg1KevVi4EDXheFDTSu9c+aGqrzfkmws13pg9ng1blncxN1tw4DacwvqjS2pyHehkHwju1/dg7ymk2qm1DsVK4zMoJ+SMftyPgkmeieEeGxphUGYJ8hgq7QtO1nzrpb1COYvBjmJG6nClYPeHZS/HjaDO9pbm1ZHCkJwEbqZJI3k9MLuk6JyCLrMLvv+kzvAc4v7VAU9JSIxgc27S0qtnefs7jABA8kwqXvt/v8y8HFTAaWuduqjOhD/ckpwV7tbU3tPuoZwyqWYZiRxjWX+JeCYQkKtuXvenp+73qzoy+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KperA67NHhVdPhHvryRtO/eew4wsEJq0Eq9CIUinfPg=;
 b=ESentQ2ajL9eVUJspnTzvlwyxclPfgonR+c/28fq6wbBd5JDf/HCrBF6DmXrRAr/z3UoxfbJCvysbVWN5ktupspS61/3gRG+X2K0hcsgr6Yn8ZL2oTFF4Ugx6utvh/8hS/uwRFRhjuQGUWx7Y5hKFVkC1iDQdNFtYi9z1zMVar5bOeeUsJrdEVXbSG17xwysZDR39hlV4Y2/6LPKjm1MmC3syVzlP4dmoej7vSNHD5xwU6oZUf60WGUVpMy3fbgKoQka52PYpTnkVuo/3fOrxcbPpbRbR+cMGcyZudi6IRGL4WTyqXrzMUto/aMAGgwG1Xq9GUsvt0BWde8/HeToLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com>
Date: Thu, 26 Oct 2023 09:55:53 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231025180630.3230010-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c929f0-28cf-415f-e82d-08dbd5f8fbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3MItbr3pvruepZl9yL6y4I6k1Z3b4f+XY6UFHcTaa1/TYLg5cL8joI3GhwDwUZ6CN13ejNDgnYNSrAQY+MlGatpiYTb6Oz2Pw9FQUyhwlkTTWUl6co8ukWgmLGvp/fDI42uoPxLpNUlKUkAAFRUhVDBKZrWXHdcolkW6cgVpnholu08L/WuJSUM/p6KqfK570JYLB5e+2xi8j2vlmgfJZ4n/NbwmGLN6yoyKv4Pf61gPiLCXLe3skmMAaYzj59kGj0mVt6A6vPwOUBm2VxsPfLWlh1jXrqNQte6I6K1VWPPfMiJMIUE8CO2FuJReb62IsciUbwQNLu12QYoRj/83lRje5qYCWXvwzevafF8bfUCxP3clQB7qiA0FHN4cpZKRXBKOS1N+qyJkVmu9Yf4WsjYjCUaGYVOF+k499Sx/nyRJJjiDSNx3dBDr/dgvyKbZnwsYDHhFAf+9pTIoOeaVuh74XJjQfFFBcD968b825WTXHoYd8IW1Uxp5rLP4TYBs1SyQiziLM67RWZ8X/owU2mdmjFdIGU2FlDXJN1hWXNTHQDLyuBUpaARm11+nyTRs03Wi+RwR6YulyGTg3SzOrLDXw+Lq0XaH691bCYfCWS61exFeDYWqxkNIL1lr5jWaJji5iK2BW0YCiBBGCHfNRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(83380400001)(8936002)(4326008)(66476007)(66946007)(66556008)(41300700001)(86362001)(54906003)(6512007)(6916009)(316002)(31696002)(478600001)(6506007)(5660300002)(6486002)(6666004)(36756003)(2906002)(26005)(38100700002)(2616005)(8676002)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGR3Kzd5WksyZXg3RnlXL28xUGFITTU0K0NtUHhHZWRiSGV5eXViWHpFZFFw?=
 =?utf-8?B?Qml0dC9SaWlrTGxOU3B2dlFWemo4S0Ivb3lIR2lsb2FBeHBndEZlaXU3bXlz?=
 =?utf-8?B?OEVROVlSMmk1L3dmMzhIMkNnSEtxU0dNaDFBWXpaV0phOVova0U2bFhUcEUy?=
 =?utf-8?B?dkpFRWxQWFU1U3FFb21yaGk3VkY4THVJU1VDaVZVL3dzeHlIR3J6Q3dqalRI?=
 =?utf-8?B?ZmVQeVVXSDZVOCtOeVNDY3BwVjZNamZBRjdMNStXdEY1KzFTOTMxVTV4V2NI?=
 =?utf-8?B?aDZMa0Mxak5FdVcySjcvMUxkbzhJN3ZNRW1nYTIzMzgwNEk5UFB4UGdHc1lS?=
 =?utf-8?B?SVFpVXVLdlYvM0RTbWJFY2ZUbHp2N3RXWXBBKzhUaGd4bXZsZUh5cXlvZE05?=
 =?utf-8?B?K2hQSjN1cVF5WjNtaUQzZElpcVRRYzdnc1RhNjN0NjVPR2p6Wkp6bHl2N2l6?=
 =?utf-8?B?VmRtTWxMUjFOSXBJMmkzOERWWGhKMUtHcTNUQy9VVEw4Q3dpWWpIeGV1SXhY?=
 =?utf-8?B?dDd1K1VlQkVrZCtmQzBvMjQ3Zk5Fa3Ixam9YbTdpOFN5RXY3UDVDUldVeHZX?=
 =?utf-8?B?ZXN6dGNZNUpBdDAxYzd0R3RDVi9adFRBTHJpZXhjUmNBSnNsL0E2OStsQVZS?=
 =?utf-8?B?N0RVTmNZVlE3dXNRNnR1aHdOakRFMkVOdGR4YWZ6Z2g4b1B4VkVCQStDVStE?=
 =?utf-8?B?UlEreEJkL29uTkRLbTJMNEp5bjZlcGdqRS9kenZvNE52QVFPODY1TFdhb2Z2?=
 =?utf-8?B?QzBxS1ZLSytkeGV6dm9SQVBsdzhjREc2aFBnYmQyR3AwakZvaUh5RDN1WjVU?=
 =?utf-8?B?Z3dPeEJrYTQ0WXhCcGkzeTBYSEc2R2g3alVXelRESnBjN3RIUnVwSDU2UTFs?=
 =?utf-8?B?dUtINFl6a3Y2dThkeFRvNHFVOXUrWEZIS2xxQXFWWHlBYm83eHcxL0xqeUJD?=
 =?utf-8?B?bTMyYXFrZmhXL3pJek9IbWdia0xtZkI1UnN2cU5RZ2pEZmNYSlJFUDE3Y0tS?=
 =?utf-8?B?amt0K0xaRCt0VFY5TGhMS3hXTkV2VHBxdWtqa2FybC82eWFQUUlqamtxZDlI?=
 =?utf-8?B?OXBBaEJmMkVEbW1laElNMzFPTVVRZXc3ZXAzbWd1dGxsNm5uZHZCMW1PQW5p?=
 =?utf-8?B?NGtxRDIwaUxiang3L2c1MHlpdUNCcllJTjNKYW9aaWdpN0pkVjJhRjlUYnpJ?=
 =?utf-8?B?NThXOUpoNjN2SEJIdWpJZkRqU3Vpb05NK1B6Y0ljU2k2eVlxV2RZUHFmMFdL?=
 =?utf-8?B?aU4xNk1Tam9uNnM5R3NFQ2NUWkJyekhSeStFalhLUnl5NitPck8ramVjU09q?=
 =?utf-8?B?YkpGVkxNVzBJRDlXdFh3dnQ3Qlpaem5JM0IzRmx2K0xFc293REk1bzh2aFMx?=
 =?utf-8?B?VVNoY3JCUk9aZzc3VUVkUnpLNUtRNklsempnT3JHbUxYMDFEQUhJN0lzR0ZV?=
 =?utf-8?B?bDN3NHgrNUpmTXowSFd1Rkl0eW1GVXRsaHdkMHdpOEtSRlVCdzUyMi9sTkky?=
 =?utf-8?B?U1E0RU5ES1hwaFFpNXRiUTliK1prMlVtU0RJZ2tSS3VLbFQ4aVE2aTNCQlk2?=
 =?utf-8?B?Y2gzeU1QZG9XWHlCRVlZL0RkUkM2YituVHJ0MXkxNHVMcFFwRXpTNU9FUERo?=
 =?utf-8?B?L0pjY2lpUUE0Mkc5NTN3a1hLUS90dEJBUHN6NDFacUFJNEFjNng4WlZybVJQ?=
 =?utf-8?B?TzFZdXVpVWNnTFRVRUFCOWdpQ1dKbXBscHluNmVIclB4NFpTeHhDcVhVcS9C?=
 =?utf-8?B?dzVkMDhXK2hUK2JtZnA4TVNlMVNSTG9qbkRUTEQzcXJ2K25CWUwyakJhRGMy?=
 =?utf-8?B?MkhzK3lyVFJjZ1pEbkp3VlUrREZjR2Z6a2czRDJTVk0vWHF1ODRmdVhOeFJG?=
 =?utf-8?B?bEk0Yk9sWGlaODk0TWhLdzNkU0ZKYWJIN0dDeXN0VFYvckRET0pjSVhYcndF?=
 =?utf-8?B?TG5kZzEwaGpKckhETUdTbmJFSDc1Yzl5WWZKWjhBSnNTMFBTSXFoY0Nnc3dI?=
 =?utf-8?B?UTZoOHpFdzhlQ1p1VnY3TzdSaHdpdnRrNElOS093U2owdDJmMTdIRS9PYnpx?=
 =?utf-8?B?alJDWm12Z3hqVzgxZW9VR0F5R1NJZyt2V2xaMlNZK2NBcTRqYWNFRlZHbE1W?=
 =?utf-8?Q?9p3dEDMfmteL/3986zwJSTTa1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c929f0-28cf-415f-e82d-08dbd5f8fbfc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:55:56.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVfKf9kOsm2p4A6GgMHuCh16U4r2VaEc6vuk2zHJPR+ZC6/Ax8qbq9FC+eKsgVGi5ztaG6khBeh1v2JZ1RYSLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

On 25.10.2023 20:06, Andrew Cooper wrote:
> We eventually want to be able to build a stripped down Xen for a single
> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> available to randconfig), and adjust the microcode logic.

Linux uses different names for the Kconfig symbols. While I'm unconvinced
of the SUP part, I wonder whether we wouldn't better use CPU in the names.
One immediate question here is how the IOMMU interaction is intended to
end up: Do we want to permit either vendor's CPUs with the other vendor's
IOMMUs to be usable?

> --- /dev/null
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -0,0 +1,22 @@
> +menu "Supported processor vendors"
> +	visible if EXPERT
> +
> +config AMD
> +	bool "AMD"
> +        default y
> +        help
> +          Detection, tunings and quirks for AMD processors.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on AMD processors.
> +
> +config INTEL
> +	bool "Intel"
> +        default y
> +        help
> +          Detection, tunings and quirks for Intel processors.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Intel processors.
> +
> +endmenu

Nit: Throughout this hunk there's an inconsistency with indentation
(hard tabs not used in some places where they ought to be).

Also, depending on the verdict on the aspect mentioned at the top,
"processors" may want replacing by "systems" or "platforms" or some
such if we mean these to cover more than just the CPUs.

Jan

