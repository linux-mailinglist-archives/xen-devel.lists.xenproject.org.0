Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B75511867
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315064.533408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhoo-0007pu-Bc; Wed, 27 Apr 2022 13:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315064.533408; Wed, 27 Apr 2022 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhoo-0007mw-82; Wed, 27 Apr 2022 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 315064;
 Wed, 27 Apr 2022 13:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njhom-0007mj-FY
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:34:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d02be7e7-c62e-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:34:50 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-dbXcQQGYPpelA_6uwElz9w-1; Wed, 27 Apr 2022 15:34:49 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM4PR0401MB2260.eurprd04.prod.outlook.com (2603:10a6:200:4b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 13:34:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 13:34:48 +0000
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
X-Inumbo-ID: d02be7e7-c62e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651066493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEBStFJ/uoGURVVIk+WdXrlLzR8PNzTyTLMEmgZey2Y=;
	b=U2/anU0IYUuEdJ+bVLX13BLqsRccmNl6Ookpk/tN+S/5kA3z5wrCX4tyR+HjgwCB6FVE7P
	FEMc+ybNtwQz1kYkmLmpMtb1R4rJYNQG95CdklpyqbWcI1LpdSV9SY0XZ6eAWM2PYPYs3E
	nER+zmO2BDezqcG1xZqUsY/XBPR6KoE=
X-MC-Unique: dbXcQQGYPpelA_6uwElz9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPXtkSfrFrk21KAhCqBNWg76LzJabOqfHhILY8G2nRBDlBg6ZJ4SkOM/bIlbKxS0ysjrkgzLm0P4sXutFd3GHsWyeMhhvj7suDrzIBI3oy1SQ3u1dxFE1dowah+CuApaHk/4ldi1LWotg3XUEBolnNXWg4Ea1dUKjhog85ITgO1cZAqIJk364odTHqZFYNUvgtKTFzj5PieYgsLgDRM75DIxX0o0WZrVKAORF6nBSkcj0n7RcmD8gYNyDxB4o1+Fid+RAYHL+qrKlJht/ww1vf2pwnf22SE9vWu2NKs0/mN0yoWbpSgJwT6Q+oNRpLKNBhbiJvJI8HB8I1yrl3wOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEBStFJ/uoGURVVIk+WdXrlLzR8PNzTyTLMEmgZey2Y=;
 b=AKucEPcka60mk8ke/bgG9KYBMkfzYTFRHqcBELmQ5BuwB2UGB06XkJYj+7RWNqvJBhsn/kPrbm7nMPnMGcDvonluN3Sv9kEMMwtO1IJASHRhd+JflJ4Xl7Jy3vKjpSde5zUWaAaYDUW2HC+VdqIk/WTTU4SBLYAx9QMUccISVaiG1rhOYr2UyI8eg5uqhanpNegMvHh8nGTbJz5MJIeTV/f8PMdOhWVaXcHygVIwJKSHEuUWWZTDMDe28O16BvlUugYijfcj1ekExxuWYCYw96XbZZgkMF1Y+1//ZUAn84eTxl53ejRiHO9u2q/sZtb6vlXn9v1OJhVFq88UV0lRUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <066202e1-f4c8-be2e-4eb0-45a977d1de5e@suse.com>
Date: Wed, 27 Apr 2022 15:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] SUPPORT.MD: Correct the amount of physical memory
 supported for Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427132246.52715-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427132246.52715-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d37e28c-b96f-47f4-11cc-08da2852b2cd
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2260:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB22601D3666CC930B16007246B3FA9@AM4PR0401MB2260.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AX0xCYypKYSJZi/hRzWNCkvITc2Clbi8hcDtiWPRr44YNVEEnqqqBh8bmp4gynzp2fDBJgw87wpeDUKXBkBztI1e+gOApcR1wgNEXY4tg1+NtiI70S/yqbPhWJXg5XnboVo4D8725BMpltu/c2+vvjD/Wn/MXTaB1e4Byypi05B9HoFBSz9cWOvK70wPE4CxnNM228mjwvHLUWrComIlMbUOO8xJ/ccc69XMYHwOBIJ8EDOCaCCQmsLRpC9gPkfGvWFNNa5YiXMCbM4suZGzIfdpB8cpWyCgZKYGHwpHr7uLdGSfmKD7M3omEaCidHeUm84XOYnoE7q4to70M0RO2yPdK7VjJFYLXuv6sQC1dZtmaDI+1+bSkxMEeMz06V9nhTwoLPh42xxrRtjQkYj7t7byUJ5/bacw1WHtabJEpU93s1YPigVWnMdq6qhwdqgnK0l2lglbPJ4KKtJK7yzApy4NEcRevjrAzxid9gBG7LZZwqx+UNpmx5DGVqVa3R9bvSvC8cMQYJrZWHaJm2sNUHEYykA9xxSrnoriFq/Wf5DCchVp1ENx+Tq8ESTFt6kiGShrRfwP1wA7WGtkPwGhFfTWii+zLJicrDbSvI8r/AI8BD6lKNba7hzbBdQRC166CPGiK91AP+qS2nxrtiLYEX9SX3K4QNTSFcK9efpr8UucCzvUHGsm7GMh0TcCmgTbvqp1Z6Ex+2bNUqxzdOTNppkGmjcqG1p7ICG4RcSjsKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(2906002)(6512007)(26005)(2616005)(31696002)(83380400001)(186003)(66556008)(66946007)(66476007)(5660300002)(4744005)(8676002)(4326008)(38100700002)(31686004)(508600001)(36756003)(6486002)(8936002)(6916009)(54906003)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUg3OEVGSzltQyt4RVpPZzkvblA0QzVPUXBPaE90WWw5UGJjR2NOVWZsNytY?=
 =?utf-8?B?bkhKWnRacTR2dVQ2S3k3dkRJYW01cmVtZ1BPM3lYYStwcHBKKzRLUkRGMmgw?=
 =?utf-8?B?VHRoR0VnWCtuY2dCRVRqVDAvTzdwQXBod0t5VmhMdEdZQitWZC9xMnBRMmdj?=
 =?utf-8?B?azY4bFA5UVNra2IvaGlRYlI0d0kzVlFIbmhPUGNPMEw3WmthbngreVNUL2VZ?=
 =?utf-8?B?M1hMMlFobmU3NGtlNk1zWTArQk9hVWdDWUYvUlY2cmswUE5LazNYbHZlL1p6?=
 =?utf-8?B?WHpXd2E1R2MvNVlxWkhESytabjZaSGtrU0xIbGczVlc1eGNLWWZJSXNaTVBa?=
 =?utf-8?B?OTlYQktUYkx6UUF4bzd6ZzJBUUh5Mm0xdk5LSkZ4YmdjMFVIS2U1SnVFUmRC?=
 =?utf-8?B?ZUtCMzBaVmJMUGtmekZkcXYwb09UUHJSeTBDU250ak8zTnYzSVFjNjNJbWRw?=
 =?utf-8?B?T0tsWTJ6OHUvOUc5ZUJUWklnTFovOWFQU0xRMFdQVGhHZGlqdWltd0JJdHRJ?=
 =?utf-8?B?OGlhcXhsdi82NmdQbWUvam54TjYwY011SmNJeURJbVhGZUVFRzlVN1RCNDZr?=
 =?utf-8?B?dCsxMEhOS1JiblQzUTJSd0xJbDk0YkdOWkNaU3pVb2VuN0Z0VDZvaWtyZDQ3?=
 =?utf-8?B?dzM2Qk5JS2JVUEJyb296OGcvL3VmcmVyeTd6UW1JSTlhaVBEc0p3d1NMeGIz?=
 =?utf-8?B?UkozZkQ5OVd3OHcyUzNCSmlSTXhjWk9QT1J2KzhmbFpsUU5GcktJSkZXZDRh?=
 =?utf-8?B?S2Fpd1Byc3VZelNNMklDN1RxYmhNVFc1K0l5ZzFaOGgzUUx5U1libjIwbnNH?=
 =?utf-8?B?d1hjL2pLaEliV25OWHNaL01DWWVvY1FWQ3B3bU1KMEVUYjlkdlh3Nlp4bmU1?=
 =?utf-8?B?Mzl2ZzVxajRvMys1MFViZFJJR0xpQ0I3VkpZQW14dXNpd1owZEFhMWJhWmo0?=
 =?utf-8?B?ZEZxV216eEE2d01SaXBTdWJ4eXB0dTJ4R3dUeHN1Z3dSQ0p2MzBsYWlyTEF5?=
 =?utf-8?B?VTFoS04zL0NmbDUyditrRmg3REpTcnRjYWFiemJ3VVhWSVAybkx2U0NyQlcv?=
 =?utf-8?B?ekw0clBFdWZRN09PdEw0SXMwTHU5VFlSbkcwQkM4cUJHQ2pOWVNCU3hQd1kw?=
 =?utf-8?B?NHoyNFBIM1h1eWRUak5Felg3RnlESmpHUlUrSVRZdVZNc25OWkcyOFV3YzBs?=
 =?utf-8?B?bXkrVU1YaGh0c2h2bHVUQlQwMkQvRFFnY0NpMndwMDJTZVBxcGJ1Y2ZZS1B2?=
 =?utf-8?B?OW1heVllTmpZTnFhcjBIMnNybEc0VTZyaFZqc1hETEltcUN1bHNJeE1WRjVZ?=
 =?utf-8?B?OStJRTcrcm90bzcyT1JyeGhmOUw0a2J1cUd2TnhyM0QySmI2cDFiMWtZdUIr?=
 =?utf-8?B?d0VZVmFGYkhadzhvRk1wYUtjaFFUUDZpcDU2d2VFK0doVGxKd3g4ck5hODg4?=
 =?utf-8?B?WkxmNVo4aVFWTGY0VVNRVDF0dWRVbFNWcUE1U0QrRmFScDRlUUpoK01zS01h?=
 =?utf-8?B?QnN6ejNSVU5SMW9JWGpER3lBbURvRVVZNXpRVHRSZ1JVdjFZMGJtSytiNGk1?=
 =?utf-8?B?M2JkSEtmWFI5WXJSN053blI5SFM2MURkb0xSRnA5RGVVNy94WlZZcTJCelpF?=
 =?utf-8?B?dGh6YWxPbWhwQTdhRjJXY1pVT05JTSs5K1hnTEZUR1UwazgxTUlkRGg4RDR0?=
 =?utf-8?B?VkVma3M3K0hnSGRnMmtaNHNHYW1oWnY1ZG5HdnRvazRvYUpRd3hvRWdpWjdQ?=
 =?utf-8?B?ak1QdGhIVmNJUHRDZGRLT0JxVWM0eGxYRVhYK1d1SGZMM3RJb2s3Ujd2MjVy?=
 =?utf-8?B?cVNZaWhtSXZ3N25DajFidnNTQ20ybFBPd01SMUxwL1hMZzBsclNoRGZDd1U0?=
 =?utf-8?B?K25MYkFaZitxUEVoMUpSMit6eldESW1VVGFQZHlQNFRobldxdXhlTnIrNG04?=
 =?utf-8?B?NlVUOFpxRjgyRm9rVzhUWVRFM20yc0h6YmtLUDdrMUpZZUxxa0Q4cDZ4SWlH?=
 =?utf-8?B?UGoxMjNWZHpSZTNhVjg4d2htSEdmeDgxbXRQa1lOaTFHeUpqdU9QRTdiN250?=
 =?utf-8?B?Y0FxbnNTNGNSY2t4bG0vVkVlNG82elU0V09icGpsdUJlWUxPeE44dVN6VHBU?=
 =?utf-8?B?VzBNQTBzam04ZlVZcURycWZHVm5ERlBrQmRqYTl1V2ZpL3BUZUNNdXBoUFhy?=
 =?utf-8?B?RDBBMXlSbTFIaUNzSU5sbzJrZ0NIaUM2NHE1YW03bGRlTGNjWDRUb1Q5NDBP?=
 =?utf-8?B?V0p0YkprTXdCUm02MVVHbVdZSzJwanFYVTUyQ0RLNm1Ec1Q1b3hDRGpyZDAr?=
 =?utf-8?B?ZExJZXZkYVJCTEk4WlB0QlR0dVNEQmZPQUx5YzU5MnA3R0lIMENiUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d37e28c-b96f-47f4-11cc-08da2852b2cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 13:34:47.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR/3ZHPRme5UBdDgzItNw3Tpi1tRDIfVxKiMkSpVrcGg0DyQBddo+sA/ba8DxXPHHdWVPJyuRhf0GW8M+Xp0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2260

On 27.04.2022 15:22, Julien Grall wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -50,9 +50,10 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>  
>  ### Physical Memory
>  
> -    Status: Supported up to 8 TiB
> -
> -Hosts with more memory are supported, but not security supported.
> +    Status, x86: Supported up to 8 TiB. Hosts with more memory are
> +                 supported but not security support.

Nit: "supported" also in the 2nd instance, as it was before. I think
retaining the comma would also be beneficial.

> +    Status, Arm32: Supported up to 12 GiB
> +    Status, Arm64: Supported up to 2 TiB

This really will need to be ack-ed by an Arm person, so I don't see
value in me providing an ack.

Jan


