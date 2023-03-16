Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23316BD18B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510622.788626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco4j-0005C9-3b; Thu, 16 Mar 2023 13:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510622.788626; Thu, 16 Mar 2023 13:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco4i-00059L-Vj; Thu, 16 Mar 2023 13:55:24 +0000
Received: by outflank-mailman (input) for mailman id 510622;
 Thu, 16 Mar 2023 13:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pco4g-000597-UN
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:55:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc2e5c1-c402-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:55:21 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 09:54:56 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ2PR03MB7112.namprd03.prod.outlook.com (2603:10b6:a03:4f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 13:54:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 13:54:52 +0000
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
X-Inumbo-ID: 2fc2e5c1-c402-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678974921;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Eb8XUavrPgw5Lpj9biondHBcHdfVcMQAcEo0282qrFs=;
  b=MDWny+R9u2/3UTFFlWq0b7pSKOyxLyQg3zEaVDA+57quhVPaT2XLQB56
   Vv3zmjOa8TkEFwa8AAf1rbF1szGgU2aiEA38Ds2KCvfaZ8qPYZVNXen9H
   dt3K84sdVEnObOqbiStRqDVDmRHvXOPrDOYxEmSPdMyiBGy9tNU+5I8Cw
   s=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 101122314
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jAI+ba2lp5PjhtmkjfbD5T5wkn2cJEfYwER7XKvMYLTBsI5bp2QBm
 jFKX2yCOfuOYmSjeNsjbIjg8kIP68OGndVqGwNvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnO6gU1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIEVzq
 98yBDUxVQ2N3vmcy4v8Uu42mZF2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1QZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13raWx3mgAd56+LuQ7e96mwWrlkooOjo4X16gpLrihVyQcocKQ
 6AT0m90xUQoz2SVSd36Uwy9sWSzlBcWUNpNEMU38AiIjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLopw3jx/JZsZuFuiylNKdMSrr3
 zmAoSw6hrMSpc0GzaO2+RbAmT3EjofNZh444EPQRG3N0+9iTIusZojt5V2F6/9Fdd+dVgPY4
 yBCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWW2C
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:iKYs4a5HmeTALl2ZeQPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101122314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHBbqZK0d+lMeK2sDxEhV5VgWgdP72mYrLpbzgS4WeT0S4Dg1cas3GyzOuHbFlyu6s4UGsoktwTdVCLOieesMyU4ixdqWeP/aIWnbZ2AKhDC1yk2/VUXkF5NE2hwekrEC1jCD8yffGw/3IBmvH3Y1BBEmi2pdmpTKkTMe5/QBy4lWwxp5wDd6TLR4F5sokYurPSmF5jBrQ5760EHe4m/hBSZLUEYerO/4mlBEdoRMao1ou58csGgOtA76ARcpQBHDNfIximSIr24cJlf1R1ACynOgKyZ3WSKmXgfTh0ugfoSFaJOVJKTyevnW70AeejKxP05bj939ipvzxuuMpvS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9ZW+mhCQ5QSmZ9Jx0EC2aHMzN5S3uJ6UWnJzJkSE4M=;
 b=Vcmbl8mHXLfBJRz7ImBc34UAnKCb1MQvihwAlVNuDEWm3SUYSk1Enz73uXrGMJ/V4EkTf2PmMJlX3cF+3kht9CjX8WWbOJViOH3/n3T4aue9pdA/m1F2rFF+8uy5ugAD8VM9eoAL3FndZuIyCkZGEOvz5iaQpZ2jOyzR0gRYB1b9E79ZaVPx5ct92pkGscGajulW1vix34sqNIrECeDu80qOS16dzCufV0+fJRNGLwPJkWRq0PhbMauP3ekht7T6DI5cGKi7ULXNq2utCbF2h2Nam2gpiN/yAPct1AGXmZ3AQfUYLdebc1Fe9GMaRUyBLMceZwdj581w0AyUlvRzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9ZW+mhCQ5QSmZ9Jx0EC2aHMzN5S3uJ6UWnJzJkSE4M=;
 b=EL+nphCEbae4QEn+YD4wtYtc8U2PRVjRczD5oRLsmb0ybuv9lutCs8sJwnAfqOhtKfQUeS7pehJW4v238BqUK4QhkgwmoNEwHKgoNktIq8agda3fkEjXMfUL9pPjRrDBs5uAEBK7MdpfBgyHzFYho+u3OJxt3Vxg7192GjOyiBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 14:54:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBMfpnzW4YdqEiA0@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ2PR03MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2fff85-e481-414b-3e59-08db262603be
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qaUcVAg9edrCmLJ4rVaq4b2Y8A1akkkd+8xmHjw0o4jRjhqFeMc3vrfTlwnJ2pTXdS30QXxZB6uCevyeKsZLwUnzL9j0OSNgJ8ULt7nzsTCq9yKweDFNuZi0efZA1U3RiKVhlUgCN5J4vhfpXDC/64gY5Pkok2xS/Uj7u9cERW49GYehy8iUdUB90EnlMLfsYOWzAUsRm/fPoMmhZcKrKwdIwnsi19t/lgBSJbng2U/0R0dRCcLaLSRatG9wgT5V1NGceimbGcrSu8NisEBCtLa8Npr1Xf1SpFEq28iXQaf5Kr3JBfAV39/hUbYdIt6LGozFxR5kn/R+DmE9bTWxtUKXgXQ025dqZ+z4pTfTloz1edHRTyP5DGJa3Kv1W814vN/2zlTQVivfUK8PoefC8vdJHKtcwX8VTRrTCkUj2cczi+BMgyV2bQ6+RDUVx55jlCLUnhDw8fj1+z8UjcjK++YWX0t8KTQGbeQb7T9EXvU+ryaQOQsU4cOItF72DgO5QbN5dWn6BFhq1eUzGME51ZPyFzpr4FSTBEGcYyZ0Z56/0rDDFITtc0SH9Ow2PpeNI+o6MNFUgr2x/mgdKf7b47y3GSmYFQP9wpooEVRk37PPe9qy6C6herzUHv4qLvJHWQvfV/Cal3A3WTj41yIqRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(38100700002)(86362001)(82960400001)(85182001)(5660300002)(2906002)(41300700001)(4326008)(8936002)(33716001)(6916009)(186003)(6506007)(9686003)(26005)(83380400001)(54906003)(6512007)(316002)(66556008)(8676002)(66946007)(66476007)(478600001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJpc0xvZWIrV3M1MHZUK0luenF1a3FLaGJMelZDWFhiVEpoZk9tSkplNVh5?=
 =?utf-8?B?S25iYS9hK0cyN0k1enBab3FJN1d1eEN3ajl6QXNvNFhEeElRYkJ2Mzd2R1pM?=
 =?utf-8?B?THZ5U1o5d3NxUjBHQVkxZzVUNXM5eHV1YWJkajJQWGliRzFlVk1GaVU1RHdY?=
 =?utf-8?B?bEhhYkZKQjU1clVNdnY1djk0ZmxjaHUyd1hvWnRyUmdCQ1hGdnZQc29rc251?=
 =?utf-8?B?dUxpWFB4Y3dITjNnMnYzeVFXQm1VL0dwV1VMd0VtZ3NZTWdsR1VISVNwMHNP?=
 =?utf-8?B?TFltMEpXeGI0Rkx0RkpxTTNxZUVaRUJnb3RGQjJWVDFpSkpsVFhpZzhROVY5?=
 =?utf-8?B?VXRkUDI5Tm9BNlBxbFFRZWpvd01uYS9ZN0YzRXI3YXk4anZ5MEFzMFpVMHZQ?=
 =?utf-8?B?U2tCNnFHRjIwQit0cU53YTV3ZU9xSVFZcmozRHJRemVWOEtBbi9zOFBDQUlT?=
 =?utf-8?B?T28wSWpDR0VDWlA0cW9kOGNsNmZFcXBGRTlFZG9CdmdLVWFxRGVGZS9oaEk4?=
 =?utf-8?B?cXcwdWdEWTlwWTF4Mm5UMUMxdGxDSWJKL3N0YmIxZFFQZ0h6T255czJGOXRl?=
 =?utf-8?B?ZmJOb2pHMWE3Ynoyb1BLMDVMOWgvTnA2ajJqa3J4OWhtdzlMK2R3bDlLVE9K?=
 =?utf-8?B?dU5kcDUwaVJBQ2JxaTdzVVNFS0pQdHF0TyttQzFmVU10SkNIdGRLQ2pXUGY4?=
 =?utf-8?B?NkNZYUN6dGlaMW0zNXRpUHEweFQyMHZaOEg0ZE4yQTlEVW5wSGxJclRBUGh3?=
 =?utf-8?B?SzNZbXFFRlRCMUlnN2lqdkRtUEZiWTJqZWxVK3BmRjZJRmFHV291eCtwY0Ro?=
 =?utf-8?B?VTg3SklpdmhjZU04SkkydGRJRnpwSE95ZEhWemJPNWlnL2dpbmtRVXdwNXI2?=
 =?utf-8?B?UFZYcldXeVR1RnlBRnM4S0h3ZzVLSWVmdGRqdlJDRVBaRzZhZGU5UkVMRE1H?=
 =?utf-8?B?ckJIZ0lWc2hxVTdoRmgwVmR1ZGlwWVFmU0ZVYmg3ZmZjN015c3pZS2RzMkFZ?=
 =?utf-8?B?YTBzNFp5M0oyVTF6Z2hFMnB0V0xOamVVMUFLZzMrRzNKQjZQaEZ2ck9TdXlB?=
 =?utf-8?B?SjUyYjVoVVNiYk9taWJmQUFqOUp0amxLdUFOR0RiL2d6K1hUOWdaRThndGls?=
 =?utf-8?B?NVoybVdmY1ovLzU3RUpCVmlmUVZJTkFXbFgrRDNVZ0FOdmk5S0FsSEtpOXQv?=
 =?utf-8?B?ZUI1amVvYXgyZ2hiZ2ZGM285ZDJpcW1zcDh4ZVk0RGVrb0pDR1pLRUw1dUs4?=
 =?utf-8?B?N1dDZEV4V2dLZUN3NGFWazdBT1dRZ0RDaXdFL21tSVNYNEZFVmxCLy9tTTAw?=
 =?utf-8?B?U2FVQXZsOThSeVFHVGN0bzRjV3ZUbEJON0xUYjBlalMrZ0VkUlI3SGk1U2pU?=
 =?utf-8?B?ZGJkOEJDQThtQUE0VGVJQXRWeng2MXZ3a1lMbmN0dmI4YnJGT01lRm9lOVNX?=
 =?utf-8?B?YXY3WnFURE1mUVphOFVWUm5jNkhWVTBaY0tpNTdSVGJPcUovMjVpaXdvRXhT?=
 =?utf-8?B?bUFDeWRzK0NzUlMweEJPaFhSYitPMndwbjEwQnh5aEtiYTg5eWM3RERyR2FV?=
 =?utf-8?B?ckJPcXQwMFhiLzluM0tHODI4VHBYWnN5UmNKNHk5bC9GR1BnNkduVFEvSXJx?=
 =?utf-8?B?cHMxb0J0VndWZ0pJMWRyekdMZ2lPa1ZWVVV4MjhHK240eDhpQkxnVEVrdWFR?=
 =?utf-8?B?dnVCTjFDMVpJR0JWWHpGUUZ3dHUyU25sV0prNWcyMWVkWk5iWi9HTDEyaGxt?=
 =?utf-8?B?N3FXYi9mdTVhMGFOZDBNcmlabHdCNmt4VmdreThWV2ZSd20xYlpEWlo2Rnlr?=
 =?utf-8?B?ZTZjd0RXeEpuazducUE5YlJrTUJ2U0NmMEx2eGVMQXdhV0xiMnFtRU9uc3Zt?=
 =?utf-8?B?RU9RT1lsTWJnT2N4eFVCejhUZVRTTDhpK2xsQTJlTzZJZWovR0FjMFM2dFhy?=
 =?utf-8?B?MC9VaHJ5TVRlTWx4eWUrUGR3WUNuNnpvQk1kdlowTDRGWXNHTDdYZ3NyZTVI?=
 =?utf-8?B?R0E3eExlY00xZjBLQVNDY3dhcTdtM2pvdDJzeE1ra0hMcGczZVQxejZqeVlO?=
 =?utf-8?B?b1paUHdvYUQ0d1kwS2ZXaUVGSElPR1JyZnVIK0VPTVJuVXR6NGJQMlJwcjJl?=
 =?utf-8?B?WHFLTldMZTY0dXVaNTFmYlYxK1RiSFQyZ0ZJajUxTTNyZmUvdldKdEVwTDZn?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SvtpcwtlMg1rAx8RdrcPLxMqHJOYt8/hBDQ6/qpLEiVK5yx6T+0U4U7TXWiH18FpMRWhjfKeRCaNi0CL49s5xBiZ1oWxSFAAPg32IfhAAxe7jdsIpyT1LbFRwc6YiyViGupennNNwzjvHXkS0JoDJQIeMn8vI44KiaEKuCU5J+8xcCVA874bVcJUgCDXCU7tNOZ5uuUJjDrVXYU/azG4WNOC3MUW95vDrpQDfT/YTfcM6e/Apma3D0RW7+VBb68eUerH7LTkQ9HROjGJchr/wA3DvrOWPm6MlJlj5tnrHmZyoRHzipWm1i3Ij7HzsRayKzmBRxvoylav9iiOyoatIa4WABUysh4R+/L9AWm1aMwjmUeeUNRhBVjl8TNMwAlRG54nIKSVYNmY7hA7PjVFDu6jE3wqFapTD875Gx8jQmCjq7oV33bW9bosaBxX/7jgw7VwZ5szfOZz0mErdaGEZ4wXOOhZi55QlV59hicmB9tHhW9iYKzx3uznLcc1iibBYZdhz1OQqLtBwPPFq7yTU/2dwVwwBxPjFGfNrk4znRJMTCLjUpxwRNso6kVmXqTYpXtU0E318N0O0FHi8vd9qzwaFGJkZoNngGx90EWTinp2UYAHKGpCaCORvfxMZgGvmds08zHIO3KJLXJeFIn2eEPEGevUUvefrbLm9nstO4lBy1VT1aAfTAJq1fz7kElQCVYZsD7pY+7TjGMt8xCaxF+PSay44RDny8djecs0QUUHVYXeDCcVHu++IhqcRwvP4R5BHZiURRpW8h4pLuoEbZxpYPmzq204G5ZF/OQUzvda5EHtwBxf95qZXh32VwEWYT2ddt5UmcxwAHMrfUV0M+ghnaVrq90b1bVSA73XI52HN665fahraurv3fSluqep
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2fff85-e481-414b-3e59-08db262603be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:54:52.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pp9fwcOeSgLtNmZhrdjviej/VLbYqgqBlz54oB9cOoJ+eBdb+xoV4/S0rg0MI1JgYb4h6THmSvQdE97pyn6vUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7112

On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> We can use reference counter to ease up object lifetime management.
> This patch adds very basic support for reference counters. refcnt
> should be used in the following way:
> 
> 1. Protected structure should have refcnt_t field
> 
> 2. This field should be initialized with refcnt_init() during object
> construction.
> 
> 3. If code holds a valid pointer to a structure/object it can increase
> refcount with refcnt_get(). No additional locking is required.
> 
> 4. Code should call refcnt_put() before dropping pointer to a
> protected structure. `destructor` is a call back function that should
> destruct object and free all resources, including structure protected
> itself. Destructor will be called if reference counter reaches zero.
> 
> 5. If code does not hold a valid pointer to a protected structure it
> should use other locking mechanism to obtain a pointer. For example,
> it should lock a list that hold protected objects.

Sorry, I didn't look at the previous versions, but did we consider
importing refcount_t and related logic from Linux?

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> v3:
>   - moved in from another patch series
>   - used structure to encapsulate refcnt_t
>   - removed #ifndef NDEBUG in favor of just calling ASSERT
>   - added assertion to refcnt_put
>   - added saturation support: code catches overflow and underflow
>   - added EMACS magic at end of the file
>   - fixed formatting
> ---
>  xen/include/xen/refcnt.h | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 xen/include/xen/refcnt.h
> 
> diff --git a/xen/include/xen/refcnt.h b/xen/include/xen/refcnt.h
> new file mode 100644
> index 0000000000..1ac05d927c
> --- /dev/null
> +++ b/xen/include/xen/refcnt.h
> @@ -0,0 +1,59 @@

This seems to be missing some kind of license, can we have an SPDX tag
at least?

> +#ifndef __XEN_REFCNT_H__
> +#define __XEN_REFCNT_H__
> +
> +#include <asm/atomic.h>
> +#include <asm/bug.h>
> +
> +#define REFCNT_SATURATED (INT_MIN / 2)
> +
> +typedef struct {
> +    atomic_t refcnt;
> +} refcnt_t;
> +
> +static inline void refcnt_init(refcnt_t *refcnt)
> +{
> +    atomic_set(&refcnt->refcnt, 1);
> +}
> +
> +static inline int refcnt_read(refcnt_t *refcnt)

const.

> +{
> +    return atomic_read(&refcnt->refcnt);
> +}
> +
> +static inline void refcnt_get(refcnt_t *refcnt)
> +{
> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> +
> +    if ( unlikely(old < 0) || unlikely (old + 1 < 0) )
                                         ^ extra space

You want a single unlikely for both conditions.

> +    {
> +        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
> +        printk(XENLOG_ERR"refcnt saturation: old = %d\n", old);

Should this be printed only once for refcount? I fear it might spam
the console once a refcnt hits it.

> +        WARN();
> +    }
> +}
> +
> +static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_t *refcnt))
> +{
> +    int ret = atomic_dec_return(&refcnt->refcnt);
> +
> +    if ( ret == 0 )
> +        destructor(refcnt);
> +
> +    if ( unlikely(ret < 0))
                            ^ missing space
> +    {
> +        atomic_set(&refcnt->refcnt, REFCNT_SATURATED);
> +        printk(XENLOG_ERR"refcnt already hit 0: val = %d\n", ret);

Same here regarding the spamming.

> +        WARN();
> +    }
> +}
> +

Extra newline.

I will look at further patches to see how this gets used.

Thanks, Roger.

