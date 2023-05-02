Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503D6F4053
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528416.821529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmTy-00053p-4u; Tue, 02 May 2023 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528416.821529; Tue, 02 May 2023 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmTy-00050T-1K; Tue, 02 May 2023 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 528416;
 Tue, 02 May 2023 09:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptmTw-00050N-1E
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:39:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3da54026-e8cd-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:39:33 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:39:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6526.namprd03.prod.outlook.com (2603:10b6:510:b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:39:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:39:20 +0000
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
X-Inumbo-ID: 3da54026-e8cd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683020373;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vupd9GIf/iSUDWxuU9OY5RGPur9GEsNPNTDZ9vRliqw=;
  b=hHxXgr3RywuwNAXZxuqaPAvxp10lYWaqfvbZRLBgQU8e2YFxGG08Ogsr
   xMJUGGAeyYxN8HSkmzoj9+kZSm0sUKlbbzYM9+hWX+wmwWaB7MA3xPIhV
   0PBWfu9ovCBBm7L2mG0xkkp5ahvBXvBcMghLcQusGfAkjuCZj0g/PP9pi
   k=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 106308496
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0eY/c6/H7nn6MYSZ+Xu0DrUDGn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2AYD2+EbKrZN2HxKN4gPo+29xkG75TTxtM2HQFvpCo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklDr
 6weJRE9diy9gvm7h7CaR9Z2u5UaeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpMT+Xoqq806LGV7jAKDyYoVlqdmvyopB6PcO1jK
 FUL2DV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj/6mj5lXGnzKEr4DEVBIo/R7QWn+57wR/f8iuYInAwVHf4PRJKoqDSR+ft
 XwAlsqZxOsKCoyB0ieKRY0lHriv6+yULT70jltmHp1n/DOok0NPZqhV6TB6YUtsbMANfGazZ
 FeJ4FwIophOIHGtcKl7JZqrDNgnxrThEtKjUe3Iat1JYd56cwrvEDxSWHN8FlvFyCAE+ZzT8
 7/AGSpwJR720Zha8Qc=
IronPort-HdrOrdr: A9a23:ZTR7X67KDQmj6L8uPAPXwMzXdLJyesId70hD6qkRc20tTiX8ra
 uTdZsgpHzJYVoqNk3I+urwXZVoI0msl6KdiLN5Vd3PMzUO0FHYSL2KhrGD/9SPIUzDHkM378
 pdmy8UMqyXMbCv5vyKhzWFLw==
X-Talos-CUID: 9a23:GAVLA20BlJl3roihmSsnh7xfF5p1dHD8/G/sHUqjBCFrabCqU2LBwfYx
X-Talos-MUID: 9a23:Lj0T1AkwyweZ29UJXt7Ydno+LcBT3aevLnsIgLtWiuK7CS9pJBWC2WE=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="106308496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQ8NLxYEtrBeLweKkTfOk4yasIMDAdgsJl/IU+Mvra0WOafI259MHwuuKNAFeF/jn3wBOEiVA9sqBRrk0PFt4G1wQx7ms94fAQMB7YtMjbEjKiHZ7QiFSGLoCkEEsMoOPUTGXqmq+gWnPxEm8qmlKHvxzVgeLvicFWMzsrz0VQahbq1ALBhGRnls5ul65+0APpB1jWRBgbFLpx1MdszHsyHIa2G6WNNIUYIRua87SCpDTILYqTOR1YJWaP0lJh0nf0iebs5HSCd3GZ5V5b0ASzWb+5/en6Zd8asW85BBACtGRjUlr3K7BikI3jA/8JylSKMc0hK4PgvtOoNQif3Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vupd9GIf/iSUDWxuU9OY5RGPur9GEsNPNTDZ9vRliqw=;
 b=ULX4YjFWLfKRn0miVfnnfDI+HU0p8Z3w9Mp3gWgSyW/YqvmbfTscb1xtcpgeaBAskpXspKWvADW8WL/FIedA2f2CPA0fIPi4F1b47WfyD4BlhdWFswBLuYpwvZXofJmlmWpplf8tQRdYfN45zynyd7PHox9wniyybOK3DwmMmG6dnrZBZRavYHMqCqGZK3yHnTnpiLSo8iyYvHo0JzWKo8ftwl5cKqVs2Qvgat8sFP5bTNPo5c0e52STsSQC2OKEMmKhjyCZmbQclf/oh58WrO3wFDTwuJDairg7K4Eu6XAwX/e00bYilR08T+IkCjf+Cllq86fXGp6Ovx5WuuUR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vupd9GIf/iSUDWxuU9OY5RGPur9GEsNPNTDZ9vRliqw=;
 b=EXtBWPs0/nsF082w0k1F9SnQRs2C8zcteDj0+s1gq3LdueF+CyToNFKc0o02CHPogfeD142tRdFLT3Kc66FJEmXnMLMndnPeIJ5NPwggdPE8gIEq+JT6kSj5AFka/yCzT/Evii/CF7sr3zXdZa4SWiXrZBVQwuAV2hMBLI1FxWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <05b09b22-08a5-a2fa-5efa-74845fcc2445@citrix.com>
Date: Tue, 2 May 2023 10:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <afc999f3-fbe0-3b52-2f8a-b8b5a36eda87@citrix.com>
 <ZFDY9/mXw1gr5HgI@Air-de-Roger>
In-Reply-To: <ZFDY9/mXw1gr5HgI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0363.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: c5020920-f78e-4b45-5465-08db4af11b10
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtyPiy1BXUpYD+Yum4L6xkS9UbDQZD7OK9T6/VSG9sDQpHzfxcaiXtxg5bc6UW46kvfYqU6XyGDVE3vJrvb2PYKUb9Bfbb/js3JNsVsYPHVAxLIB2HnE5PDw+3Il4mpNlh4Ww86rLlW+l7ysUSef0jfHfTISKPl+M245OvvMjlr0WIxdnY2OxSq8zDz4MtcBaso6sLVECSJkOrccFzrHhG50lykxE9oJPNp1IS/HNU/IYoO8O7CwMu0FyOMqsjHEqlo4b0p6MFdmOXB1L8RqOusuO425iAKxIjw9pglHD44NxVuVZpLRTHIclPSf38iUPXcShvg5xjs47e73YVPG+wJ9UPv71jw653Sm7Kxnaf0d7qP2AiFVLiScy15OnoEV9II5j9MGYxptesMKOHkRhxDaw5Q99bqYqsi+HCTlpMn0g6NNn2MIK98PSx9PuST2JxcICHwjOBDe7wzrd+23uik4hzyon1O79Nkf1//tU6sc/1HGtwTbAKhu56eSY75G+V9UeULmH94clWBZtU95duSV6XAXHUuSpzBASRj8O7QpEHizx1ye6nGCuIqjtbjGjnLWfxcQig8hChpoE5jRl3kNhlC0CYXd/xCqnnKRmMscy+TqauohlkE+d9vwCGSZa8teFkREwkm7CTPmzPqoww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(31686004)(316002)(2616005)(53546011)(6512007)(4326008)(6506007)(6862004)(8936002)(7416002)(8676002)(31696002)(86362001)(5660300002)(478600001)(37006003)(54906003)(83380400001)(26005)(41300700001)(2906002)(36756003)(82960400001)(6636002)(6486002)(66946007)(38100700002)(66556008)(186003)(66476007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dktOVmNQZDg3RUROenVlcGt6S0FOcURqRHJDWU56NlJZR2U2clB2YmNIN1ZZ?=
 =?utf-8?B?c1VEY2FYNHZTdXdzY29ocCtoVHlHcVQvK1pQK2hURkplOUdvTVJuMndOUW1M?=
 =?utf-8?B?enVDaW5GdEU2S3FUM21DVTNmZ24ySnJYTTM2Wm9hREplNkNOdFpFaWpobDFl?=
 =?utf-8?B?aXRDYnVacmROVjlWUW1qMW9KaVpMck5ndmxmUlE0TnNFQm5KTm1PaHBmQlN6?=
 =?utf-8?B?ZXlieFRycTZyZTh1WU9EaFVmdGFpYVZsd1J0NTM5cjhCOGdDem5DUEtJR1BV?=
 =?utf-8?B?RzB4VDBJVGZmSU1HeU1FOHNKQjN1UGx3SXF1WXUyZnkyTUMyZVgwa0ZNRlhw?=
 =?utf-8?B?aGUrVUloNURJOGRwR0xhN3k0ekpibFdicDRHREZHbkJueng0ZHNEVTdWcTlW?=
 =?utf-8?B?WnpTeVdPeW1yY0RhTUVyNUpYdTNxc25KZVk1dG9FeGZoQXBNYkdqbGUwS2h3?=
 =?utf-8?B?L0JzSGZFN0w2UFd2NUp2ZG1PalhSQTkxTlBBaWdvb3lrTy9BUjNQbTE5L3cv?=
 =?utf-8?B?Q0dLSFBQdWFLWnppWUU2Q0NkeUFrbUx4NGlHSTJnNUJGTitKYWpKaHc3UWo0?=
 =?utf-8?B?U1J6UU5iOCtSM0RTWWpRN1grcUtSU1J5L1oxd0pZNlZtcFpraUxrMVVNblgw?=
 =?utf-8?B?cDc0Kyt5U1E1aWl2QkN3TE12Q0lGd0REeTE0NFRQY1owZ1lhUzZZOFJyV01u?=
 =?utf-8?B?djZvVWM5Ris3cXgya0pOaTFkcG5wa2lpWU00cG84MjgyYVJXZnZLS0VnUzcx?=
 =?utf-8?B?RGRjSVBOQ1Fham8zcStGbUJjeDU3NTRGTURFZG1UZGgyeGJ6NXQweXJNZk9t?=
 =?utf-8?B?bkxSMGl5SGRKV3BtZ1hSRUhoMmg3eEFFZ0xWdUpBOHBlMG1OejJUK2l2S2po?=
 =?utf-8?B?T21pblpaSUkwWDNDUy9sTnp2eFZlTGVQU2JXL1gxaW9pREtLNitwVTZDRDh4?=
 =?utf-8?B?dWswbzRtTXYvSngreUdwckNkQ3JVVUFqN0ZwMkVaQTJFQnVNY05aVTQ0S0dU?=
 =?utf-8?B?dWZNbDVENW9QUjNabEQ4THZRWHN2djhLb1duYlBsNmRYOWJQUFNTZHdWcmJW?=
 =?utf-8?B?SFM5a1lSZjlnMUNMOTA0ZjB0TU0xOGhFNEZBRUJacjNoNTZKMFNkQlhiVmRV?=
 =?utf-8?B?TGgySEE4dU90MTlvRzFHZ0hDNytpWndwa01KQXB6YmlNeUs3NkgyZVFRMGw1?=
 =?utf-8?B?MFNYTm5EZCtmSjlOdG8rTDdjcmVBR2s2ZVVXNUQ5OUt2dlFqT0E3d2lvQ1Zl?=
 =?utf-8?B?V3ZOZXYzNlpCb2tsM3pqdmlJWmN3WEFzcmd0QXNTTk5sdGU2KzdWRi9vTCtp?=
 =?utf-8?B?b1kySFJWT1gwUU1EQ1V0NWUxNGgrYmRDdks1anJiMCt3eWYyRDYwNW15UE9K?=
 =?utf-8?B?Z3gyK3NBREtlQXpoVGpOVkNtanJkMXZsTjRQbTFBeS9waUtOOTE1SWVwSjJ6?=
 =?utf-8?B?VkZLQkpWNElXUVEzeFpRVHJjVVBPRFhxUCtMVEVIZ29ETUVBVk1QUFJBMWhj?=
 =?utf-8?B?TTdpU0I2M0VZdWZLdzdxcDhtYTNVUzIwbkt1MXlLTllRZEJnay8vTnJVZkFt?=
 =?utf-8?B?M1VkaCtnbEN0RngxRTZwRmRKajA0RGFQQ21ucm5oUGdCTXpLQkdEaGFXN0dm?=
 =?utf-8?B?QnVoWXhyNW0rc3NZVGxPeUZXTEJtdmZORzFXNE5IWUpJQU03UzJndGZaSUdT?=
 =?utf-8?B?ZzJXQWN4OHkvYXF0UWxhd3F2c29lVGp4Rloza1FCWW0rcTRZM0FZR1Q1R3k1?=
 =?utf-8?B?dUFYRkFUNVh4bFBYMTRVaWhkSnZmSGNTYVcxZmk1QWwwZFhRQUJJeHFYZVVk?=
 =?utf-8?B?czhHaUszZ21RSlhqbHI1UFY4dlVJazJFQmFYQlQ1dDBndzd6VkEySjFiVXM2?=
 =?utf-8?B?VklDLzFMWDJQNFlJbnhSR2l5VExsNTd0cnpTUzVHeE5aUEFPZGlyNWxsNFMz?=
 =?utf-8?B?UWVSUnNyamJPVVZmZlRWYWVSbnlkWUUwcUZSKzN0VkNjYjdsOVJQU2hCcHBo?=
 =?utf-8?B?N3ZpR1pVTDRKYS8vdSt2SG5BOGZnd3FVUFJqdTh3dTNUOUgxUVdHRXdNTUto?=
 =?utf-8?B?Y3BhdDc2ZStOeVA2ek9YaW5mYUZuWStXaFdVcTlzcXFlTjZYdHV5L2xtUVNT?=
 =?utf-8?B?YUh4VWM1SHFWQmFFUC8xQTZjRFdua3k2MHAxRmQxRFlNNVBaUWNlUHI2M0sy?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UnBaRzhsVDV6YjArb1NaV1ZML3dBUlRGT2ZKYW1Gc3Q3dHZEVlhDQTZyQ3gy?=
 =?utf-8?B?SlNjRWMzYnZ1L0RwL1A5TFI4SStYTGFxdW9aeFZxMWpMend2L0ZQTUVpYjNY?=
 =?utf-8?B?TzV4eVViSmlPSEhqWGI3dFhzV3pJL2NHSG1aQWI4aTV0UitqMlN3aGszWVNw?=
 =?utf-8?B?TVNybHJwSUc5ckJtekVQSitqd1FaTjFvOUhtSkdxdlJsTDdFZFRzSEJDWXdL?=
 =?utf-8?B?Yk9qQU0wRVpBOHpGNUVSU1U4UVNDNzd0R1Bob3BWdmtpaFZucUp5QWFiT0tV?=
 =?utf-8?B?dzBKQ0cxRGt4RVNBSjFobGFZSDU3WklRZU5JZnJMazVIOFhRb25iWkt1L1Jx?=
 =?utf-8?B?NWtlOXRPcnA5RitPa3VsWGtjRFZrRFNyd1lvVWNjSGlnQW52TEJkZUtxMkR3?=
 =?utf-8?B?Y3FXU3RPRGp3QlJyTTZpQ1hMN2NNWFg3cUpBWngwbmtvV3ZEZ1NwOTh4Vm1D?=
 =?utf-8?B?czBRMG04UzdLUTlXZyt6SVJ5UTdrU1ZlMExLcFV5U3J5RmRaNnM0OXhyQXh3?=
 =?utf-8?B?R0JzVFFDWXo4azBSdktxRFAzalZNWmtPOWR3akJwZStNVXYraEtlSG9UVHNM?=
 =?utf-8?B?REZlNDdzYmEvek85d0o3dUdHZldOMHNNZ2hTTTJjSGVsNDd3OGVDNFc5eVRs?=
 =?utf-8?B?blMwT09yejBoSXlHdmJaS2psQWpkVEoyWUtiazZFSzdtWmpPenRHNnZBRlND?=
 =?utf-8?B?UTRHcWJtYkxCNmViZWQwVCtvQ1ZXdXYrNFdPWm5EaXREY2ZvTzBmaG83TUxN?=
 =?utf-8?B?YnFUalloUnhDQ0E5RXVLMHpaV0wxSGk3Y1lZTHVEckdOVys3ZXUzNkNhWDBN?=
 =?utf-8?B?UDJKUnRGS2VGNDRGaGorR3VNVHVMeFB3UHhJNUtFL3BnUlhlY0RVdUFBQW50?=
 =?utf-8?B?SE5meTBlSHFTQStoM21MbUVFdkdJNEU5UklvZjlHTTY4ZElVTi9GSFJFcTB2?=
 =?utf-8?B?aE9DNDdlUW1pVUxQYnROY3pNWFFXYWkwMk50bTRyaUN0VGVsSVpmdTkwb1BS?=
 =?utf-8?B?VjUrTG1IOEdCcksxTXA4Mkg1N3QySjg0c1pkQzBqQkNRKzNaclJFV1owZVNF?=
 =?utf-8?B?WVZibHU0cS9oTXpFMmdZQnd1TkttY0d5alV5SnJXWitSeHkrNUsvcGc2cnNE?=
 =?utf-8?B?ZzJpZEF5b2R2elp6c1VmdWtyNG5CR1hmNlVUN2NhbmhyMUwrNldDYXdzWGsw?=
 =?utf-8?B?eU9sWE9wdEhkL3NaMUZHM3pxRExTZ0NGd2dnbXRRYXJFZmd0bGNaTUNBS2M1?=
 =?utf-8?B?NU5JUEVvUXhZTVFGbDV6bGNha2lCckQ2elk3b3N2Y2tvbTZKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5020920-f78e-4b45-5465-08db4af11b10
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:39:20.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kBqrQUkG8gSP0RoIpA2tTsCM+AFIwaVmj9faavkyHEjSsxb8fKbTSkE/C/Js4/fKsd+QfK1rxKdTPYpfuPfRT4PmaGubDvlhaMny/DiNis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6526

On 02/05/2023 10:33 am, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 10:27:39AM +0100, Andrew Cooper wrote:
>> On 02/05/2023 8:17 am, Jan Beulich wrote:
>>> The hook being able to deny access to data for certain domains means
>>> that no caller can assume to have a system-wide picture when holding the
>>> results.
>>>
>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>> While racy in general (including in its present, "normal" mode of
>>> operation), within a tool stack this could be used as long as creation
>>> of new domains is suppressed between obtaining the count and then using
>>> it.
>> This would not be the first example of the XSM hooks being tantamount to
>> useless.  I doubt it will be the last either.
>>
>> With the rest of Alejandro's series in place, all requests for a single
>> domid's worth of info use the domctl, and all requests for all domains
>> use the systctl.
>>
>>
>> As a result, we can retrofit some sanity and change the meaning of the
>> XSM hook here for the sysctl, to mean "can see a systemwide view" (or
>> not).  This moves the check out of the loop, and fixes the behaviour.
> Don't we still need some kind of loop, as the current getdomaininfo()
> XSM hook expects a domain parameter in order to check whether the
> caller has permissions over it?
>
> Or we plan to introduce a new hook that reports whether a caller has
> permissions over all domains?

New hook.

The current behaviour of skipping certain entries is fundamentally
broken, and needs not to stay.

~Andrew

