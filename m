Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8F706C55
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 17:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535954.834033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIoh-00067M-Ux; Wed, 17 May 2023 15:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535954.834033; Wed, 17 May 2023 15:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIoh-00064Z-Ru; Wed, 17 May 2023 15:11:51 +0000
Received: by outflank-mailman (input) for mailman id 535954;
 Wed, 17 May 2023 15:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIog-00064T-Fu
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 15:11:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e7932d-f4c5-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 17:11:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 15:11:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 15:11:46 +0000
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
X-Inumbo-ID: 24e7932d-f4c5-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmAKAlh0S3TtM0+WVLKN+lRF/4fXuYhAafVExdRJwJYSP/IbMgU/6eQGNGmrr7co3QZPDZpRb4ZLMb08C9Ot/IMnEd/wNzZVqYh50T04jT7aQpIsVVxAB1ydjaqGPMLJ/Y+1Zu/vTThwuVK1uHY9wApsuneY8OaEfu+EPsiMGGOOagonb9F5BG8Kg4sD7W2DU9w7dQkI8BCMMgA/nPXJtSMv+cUYFCGhsDZ4Fp8WoM+ppa4K/kx7JUFNITASN0nODrLbEnMvEb/rf8d1+CsJ3tPxFoEGyDiTJpF9qfoDBDfX+aMvHZeg/yy42BLTHoH2BD5HsKskv+ugajWkxe8fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+aWjH0BITqOe3SNRN3Gw9i6+nWilhmT4/pnLX1fDz4=;
 b=k/olOGFANP3G6h2t7n8buvH1/Z6heDzKvGf4d7/Oaw3pge/s3f74CTw9JDz+G2KyvHDY2Uwn9srwF9bR1MwJ8H07oezfKqzJZlU6i4liK/Mi8DZSrQkjnIc9XhYgrRhi+AZXw2WQ1jLWp6TPvKpzIJbJt4AGCFfUenC7dMr7HIdinuB65eTP3tsV3Q6B8lnEDodRHo2LkMsFlPnrPT/URbb5nfIFE399OQK+gkoC8e+ta1n1u8qEg3JOQM8aNyzI9vy0QonMM1YlNJ8Gg/WwprF/KUMLL0XMJp5tHJkIxjmvGpZ5Z2gGFqFAx6lsP8mQKk79JY9T8+CLADR9BtrhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+aWjH0BITqOe3SNRN3Gw9i6+nWilhmT4/pnLX1fDz4=;
 b=nHFCVvTN0Mn+IRVT2vjioWDif1uIwezo0pMw1szjKDirhCmFGloK3GW4MLmMCBtBpJSYcoejo59AEUo2FmQpdcMUzrYhVaUjo1z+lYUViqEQQuuo5q3ex8JU4jJggc+AcTFgn0XuTA6eYUDgxH1fvzSG75zi1QEkdZaZWOSzM34zwKnB+KWRXgK1JHyW1nrmwbo78/46ctldHoB05LKMpo3JyRwuNV8Cb4MQ5Hv7zKpN78PU13uiTluf+8okUUBTGuUMgiU2ofbCxdUcdPJHh2h9EGKliMo9t+t5fVFUhuTjjzQEyLhRsClVgjltFzQHvZ9XxXeWRrLbF40TkZ2KEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28ea6dfe-63da-f0bc-bd98-6d5ff1ef933d@suse.com>
Date: Wed, 17 May 2023 17:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] docs: fix xenstore-paths doc structure
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>
References: <20230509102455.813997-1-yann.dirson@vates.fr>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509102455.813997-1-yann.dirson@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c03017-0c2b-48be-7273-08db56e907e0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdNgGNBabhprG9zD7/rvK4hezDlcQ3c38Llc6SphIOc2xKw2Zs5mDn2XYYOBb7QApu5zZIFHDsSWEeyC9Qz4fWUvAW/EXxi96cNImvWX/CXctyigKbmjoMUvyAIMCF31cnSzWDM/WELUTlX9rNTCF4xgmLrx/BfF/N7daBa66/ZyBKCWTn1yXai/etKxu0wF848tHF+QYq/ujNSDvOOOU5fK4gJgKLDDW1Nnxm1whobspZtVuJbLSjIfALF9f2QFwI01abe6hAYP+/FANzEk3MtaflZCi1S3JdS0fxelF9mPzn4REgAuD+uFOlD8347roEXllg93tkvVfCnccdf83BZ0QdyZhOx97e9x2ANhp+VU5bapp0an1PC8cWv9xN3czYZ3r2f/TRf4tWg0KTMs7UaZQPSigw/eek5303SkXibz1H6oGuPr67PEY1S0vGknXuLO/Pdv7fgVJU2J6T+2JAN1qEKHBiaB5XM5EDunTG85wu+y5Y1ZQf/mim+MSRK6b8roOCK58mfJuH7UVOZVT7gBivPK38zKmEY3ZkUpPByI8Q7tgbCN4CppOT6iozE3I8e+RSi6dqEtI9M094HfoIcRk05KL8SKooF69nXulAE7UnbbB6/FHWPpkdg/t0ZEINZ4aO2VXRmuYySwbdTMHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(478600001)(6486002)(54906003)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(4744005)(8936002)(8676002)(5660300002)(36756003)(41300700001)(6916009)(38100700002)(4326008)(66476007)(66556008)(66946007)(86362001)(316002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJmYVRwRjdjNlNvZ2tXcHZPcDBWNkxYOEVZSHJ3SnlNcjRWbXhia21YQmV6?=
 =?utf-8?B?a0t1V3NGTGRQWDFYVUZoZzZXZzlYSWFaem9RdW1VSGdTMnlUcTNhQmFUaDdp?=
 =?utf-8?B?WFowNEt5RndEZTVORjBvejZjT1ZFVXVaVUFkL25FZzRma0FIMDZBelcwL3Qz?=
 =?utf-8?B?dndmOGVPRXJibzFwWmQzU21CU0FSNG9LbWR2K1J5UW9ITGdoanI5UURNZ21U?=
 =?utf-8?B?Ym92QStuaW04VlM2SXRpWCt4aUZwMEZCdnhIMTh6VWZKQTJjeUE3c3JvbUZx?=
 =?utf-8?B?cDJieU5EOW5yWWJwc3o1UEVXRVkvclJ0Sm4zK01pVGlpUDJXOGxJZEM5WS8z?=
 =?utf-8?B?N2Mrb1FkNU5ib0Y2eWczbW9vOGJTMHh6eGp5S1E5QnplNndrWU1hRHEwWXRi?=
 =?utf-8?B?KzlEM0hCbmhILzcvd1Zqc004eUwyNDhnSFU0OHZUdnFDNkR1ZVAzY3UwdSs4?=
 =?utf-8?B?Qk5pc3ZJaWVlZDBmRzlKajBZNUFBb0V3VENaN05Yb3hPYlhoVG5VT2JJVjdM?=
 =?utf-8?B?RmdQdkV5dWRxemtHd25NUXgyVGlJa2ZMdjR0c280cjNSaGJkUXJmc0RqN29q?=
 =?utf-8?B?VVl2dnJVMC80VkVKREZYdTBLVWcxSUsxeWRBMVZva21CS2p2L3BOUlNYQlZ5?=
 =?utf-8?B?dG9NZXJ1cGRHMlNoSC9PTTAyR1pjWkwyMHJZOFZmNnQzbkdlRFNwajZQRTE5?=
 =?utf-8?B?WHZmM1hmWC9YSU5uZFJhaVQzclRXN0VEUkowVHcvdWgxT3YxQ3d6dXVONWw5?=
 =?utf-8?B?ZVhITjRISTIzaWlVOVZJaEdIcnNSdFM1RXJLZXhkZ3cvR3dJMFB1T2ppWWE3?=
 =?utf-8?B?bVdYdHZrMG14WUMyOHVlSkJrTXhTMmlOQ25qUXRzK0Zqc3lCWjJRc0FxbHNu?=
 =?utf-8?B?MmQ5S0xlYlYvWDYydXFLYzFiSndDYm9kdWl2eGcvNzUzZlpRQkowa3llQm5I?=
 =?utf-8?B?MDdybUxIVm1Ja243S1BPc1ZzNHZWSUIwYUVkRXdZeC9vU2FTZ0svVmJ3TGFJ?=
 =?utf-8?B?c0VxcEY2dHpFd2JaLzRqNitGbG1ERThvMnJvUGJWcm9KTWQwcENMYlJTZmtx?=
 =?utf-8?B?MnB6c3VLa05xd01XUklZSnR2M20ySk8wYzZOL0FCbndROFNYL0poMXV5MWl5?=
 =?utf-8?B?Qm05NHZVZjAyU0xwWDZaa1lHdWZwOVpnTnV6NFArc3ZrTCtYRXNzaEZSZmUx?=
 =?utf-8?B?cWlranJyVjBkREN0a1RYWWkwSEwzWWRoL3dPSGdqQkwxcnpabWhWeXFlM0JX?=
 =?utf-8?B?QW5leldZZFFvNyt3UjQvMzBIU2VDMzJZSzh0K3ZLQUFtdk1vd3NRcEx2UmtL?=
 =?utf-8?B?Tm1vT1ZmYi9RbWdOdWgxVStoaUFHcE1WYlJGRU5CRzZEbmZCbWVjalVEKzVY?=
 =?utf-8?B?dHBvK2VsbW05VnBBVnpoOVdkRFBDZjBVUWpPd3gzQ3V6aE00c2ZnbHBEUVd2?=
 =?utf-8?B?N0FPM3c3dm52bFlaMmhybE1CS3Nyb3YvSnNIQnFpT0YrUEF6cEo5czUrOWJJ?=
 =?utf-8?B?a0kzbXVhd3BRUmpsOUc2KzFpU3l3TFpRWGZOVzlJOWVPLzdQL3g5SGxrSERv?=
 =?utf-8?B?WWFsTnJsckY2M0F1UUQ1Y2FaWmU5N1VESUxuUmlMSGl0dzQ0cVZ2M2hkcEhH?=
 =?utf-8?B?a0JjRy9ReE8wenA3VGNKREJRMEJwbFRSYndRSGIrMFNJRlk4K1ZXZndFMGtT?=
 =?utf-8?B?RUY0eFZ2MVFhZEV4emcvRkc4YVNBVUc2Sm1vVzVod041eExHR1h3Q1NwRlFl?=
 =?utf-8?B?dlRpSTNmYkd2VE5GaWsvT1J6djBNWHJ2SEZXOTZsN25weGp1YlBSUjg4eC85?=
 =?utf-8?B?aXVOcXJPam0xcHVSNDJ3QVZpL3RiZVBhNnkzaTJySm5PdTVHOHR6ODFCZkZv?=
 =?utf-8?B?Y0NBcGdoUTBhelFDOFpobjU2bTFScXdTbWRueDdjOE02M2dBYWw4NzRpZUl4?=
 =?utf-8?B?RlZ3NkRUL1F5TCs5bGREMkE4aDlDSGYyYjk3Yy94SW1HaTBQV3lIaU5MYktm?=
 =?utf-8?B?YTlBM3o2ZUc3eHhsWWVibFIzb2Q3RFhUdDdRL2FQWVlBNEQyR1dwSEx3YmpD?=
 =?utf-8?B?elFhQUxqRERCTEk3QVhRbFFpM2RBL0lHVGVzSnZOekhwUGlhUmcvRzAwblJ6?=
 =?utf-8?Q?AdncOwWC8CgMVVq7Zg/64JNFG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c03017-0c2b-48be-7273-08db56e907e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 15:11:46.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //TSHSrYAcKWEO1uEsjrTDCLEFdTbM+eIrJ94ORQ4iDFTCDQ8VgpaO6nF3PvfyGX/cb80QdTV5xCDh6UZv7CUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989

On 09.05.2023 12:25, Yann Dirson wrote:
> We currently have "Per Domain Paths" as an empty section, whereas it
> looks like "General Paths" was not indended to include all the
> following sections.
> 
> Signed-off-by: Yann Dirson <yann.dirson@vates.fr>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Cc-ing the xenstore folks for an ack.

Jan

> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -129,7 +129,7 @@ create writable subdirectories as necessary.
>  
>  ## Per Domain Paths
>  
> -## General Paths
> +### General Paths
>  
>  #### ~/vm = PATH []
>  


