Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0D75C6ED
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567519.886671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpK4-0007lJ-Rd; Fri, 21 Jul 2023 12:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567519.886671; Fri, 21 Jul 2023 12:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpK4-0007iQ-Ol; Fri, 21 Jul 2023 12:33:28 +0000
Received: by outflank-mailman (input) for mailman id 567519;
 Fri, 21 Jul 2023 12:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMpK3-0007iJ-86
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:33:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fe1fcd-27c2-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 14:33:24 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 08:33:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5658.namprd03.prod.outlook.com (2603:10b6:806:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 12:33:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 12:33:18 +0000
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
X-Inumbo-ID: c7fe1fcd-27c2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689942804;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ureQDmAb34/07iNbPW+48n/vpU/rYoI8SODgabUAArY=;
  b=hpjfXB6KVblvCpGNNJppTNylNWdaE4Xl0h6bzYcXUHjqeAcMcCfQ/7cL
   CFwh1rpAM5JFusI0CSnhVtjUr4W6Re+vA2TuUbqsandwG/MICiC7SUH+B
   x5cmbvmGJxjttdBCdYq5Fbbx9A+y5uiq1PtmxHSybdjZ6URBkxnZgS0Ek
   4=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 117427983
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:izkkqq3lM9QHtQ/aXPbD5eZwkn2cJEfYwER7XKvMYLTBsI5bpzcAz
 TRMW2DTbquJN2ajfNokOt7i/UkH6JCBmtJmTlQ6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLWQJ1
 adCExQxYB2ngf3p+qq7dcVvmZF2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1IZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137CTx3yqCNl6+LuQpqB2ukGf514oOTIsSFiYvOH+tRaDRIcKQ
 6AT0m90xUQoz2SvU9L0GROxpnWJuhoBc9NKFqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9U3ud67PStjK0Nig9JHUHIyQDSGM4D8LLpYgyilfDS4hlGavs19ntQ2ivn
 XaNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFDFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:jSyRE6zQwD/+ESUUe7WlKrPwDb1zdoMgy1knxilNYDd0Vuzdrc
 yqkP4H0wScskd1ZJhGo7290ci7LU80kKQe3WB/B9aftWXdyQmVxatZnPPfKkTbalTDH41mtZ
 uIEZIRNDSYNzETsS+d2njfLz9K+qjlzEnHv4jjJ0wGd3AMV0hr1XYcNu/KKCZLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A2IC1KmgUMh2Vls213aMXd9YRMzJuXnia7CyKGGu?=
 =?us-ascii?q?EB2tNTqLKc0eQx49njJ87?=
X-Talos-MUID: 9a23:Thj5NAtmgixCMTeezM2n1G9+DttkwpaVOW83jJYlptHDCnRNJGLI
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="117427983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwcG7PYPaFJird6MPY6zWS086xK0ESR2E1cWL6MiMkPJ3b2glmXSooLicI9BwJMRLSuwI4gmrObNvYwdjEoR/LW8myQlW2KmPHtNd0RmPVwsRrcTrik8x6Kv1n/YEfA39ycslyBeLWpXcSa9tnuFv9J6ndlfjOddc96eDKGZkhxOcxBKUcEsh6PR7tJRlUnEBvVy0JkYqxX9rD1kGzMcVvb1dQFmlZo4ZOVnylVHJ8prXJdSEILvdslSR6kxy8Zc+kpkEc/fOLR5v33E8YAvVgGe+Jm88fsOaR65q2nTy0Dr6HLo2nUZc51T0AM33Yek0LeMljiCpTT3VwD8Fh60vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quS7JODlCbB3FnrYqh9DRjcgMUiIMuUVidrVDDdDvV8=;
 b=aZTr6pgo2cC2sQD+JdpcjVVPC6fKqf1LjeQXU0BqWooQEFx7VS7ozSpixwmUp3ML9s2LkbMEzLUfrWkdkPBhWf7NT11RiCwacSyzLPxWfHwDpCh/CEgVVxKy9qkbw1w1c9umQed0//k09wDmB2aPc+VZSbEFDgYv839jC8VDMCq9WNaCXKFA7/h+U5yWmfv7ac3NPiHmaSSGfC/PSA3VfZO7dcD/66AH2g5mkttkYHG6TBY35f2SuEtqfW/GJQ9tD6Z3b4yIKAiEGmOHsl+TzD6kCEuB12BnC13OUGgv0/O0n2159J6ZEOHpa1FnyJm0ArNA6mIy7XIWp+QnigNcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quS7JODlCbB3FnrYqh9DRjcgMUiIMuUVidrVDDdDvV8=;
 b=jYLbnARw/CIYKPXfDtpJUamQFrd4oHSw9sQZrvCciW0I7aGFFIRZ0w3ahyHBkSjOfJ3ETUnOt4cc11B3XDUzzFW1jo1d3zvroqmD2IofiK+Lts+td3R+rGPxtb6TRwzm0CHqD5XbMRGLTOO9KpluaRhYvNMqKkhjKFiP74MIGMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 14:33:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, rahul.singh@arm.com
Subject: Re: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Message-ID: <ZLp7CBp7ZYsYeuu-@MacBook-Air-de-Roger.local>
References: <20230721121627.1229906-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721121627.1229906-1-luca.fancellu@arm.com>
X-ClientProxiedBy: LO2P265CA0424.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c901df-d4c9-4a13-7572-08db89e6a965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X0y/+0x0clQb7T/rh5kVvVTQ4F8y50cBIjR6r4PKycGaYUcW0k0t77LjP9URNocnsiEN9kBPfLbMtZYAHEFVLbFWoKIqOy2WHnePhxr07ZHiRYRC05eFSRnqJPpo7cPCOnPJnSxSXO7ij7mrj7Rj8a2G/NMNSXNN5kywzzBCQgliTYE3xGc6ijXjYW9z1NclaJEwho5ju/qDMlMvStk0/Kb/rU4iVKUMHuO2LrGOt0H4Mln9EqXdN9403QhzuMgHCOe7QCV5BIt07vACR825eGFr2lhysGUGK1rD+c1v8iMZ9Ef8bzBrahW8buGzO7OO+d9Qut6afRgSdSsOf66Ki3ghRGbCt/QcwRd5T4i2wSnyFnGU9gKzwryN4aMTcX/W0AItlgjp7WZ6jQN/mp4X8zNy+LCIMEuJ+Lq95PZcZKzrMHNVM8cfFVN8Efz9xiQSwAboDazVeysM3WTPmISxgRJuFLvG5ZqRbCEi6B14ZfvSg1HTOmz4Ro1PzcRNuSZ7/JmVlFVvGOXsUTHEa0y2ZwRLGY95fQrDFjjip6JCqmUKTpUo+wtLqNhv8kD0ywcW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(8676002)(8936002)(186003)(26005)(6506007)(86362001)(6512007)(9686003)(5660300002)(66556008)(66946007)(6666004)(85182001)(478600001)(2906002)(82960400001)(41300700001)(6486002)(38100700002)(4326008)(6916009)(66476007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2VBRC82YlRHN2F4MDFPOUdEREFLRStRdDNHRDdXNFVPakQ5V05MK3RyOWgw?=
 =?utf-8?B?Y2RBdm9GYXZieVA2V1E0M0RPSGRYN0FqODI2Mm44bFowUVBka3BhMU4vdHVX?=
 =?utf-8?B?cHp2MHVmSWlzeExZQVE4R1RwWW5HZ21oeGdEeG5USGZiNUFhejhFNTVrWU9R?=
 =?utf-8?B?bE9hbHhERGRFbUNmRlN6YzB6VEpucE9yRUkyeno5RUhJQmhoRFYzM0psZ3BM?=
 =?utf-8?B?dXhHQ3VEZzF5OHBxOEFsTiszM3lmb1U2a0VSR3VZeGFYcHo2SDJCUDhJVks0?=
 =?utf-8?B?K1I2RC9CTS9Zd3dERXVoenZ5ck9BRTJoZ3JzdHBnZDdjRVpEazhoaFlYZDFl?=
 =?utf-8?B?d1RuQUV5dHlnWjV5UVV4eHUwdDRGVVMvVVAyY3Q5TURvRnVZUnBtRnpNRHUy?=
 =?utf-8?B?TUNOZVYyUEVYYWRWelJrVkx4TDBhdnJRVzdYYStJbWdtQTBHVFFsWVAwWno0?=
 =?utf-8?B?T0VBYlBCeG5EYTI2RFQvQ2MzMG1ZcTUyaTdDOEJpa2JjT1V4Z1JudGlsbTY5?=
 =?utf-8?B?djlyV0I0UFVOMkhiMloxSEo4Mkh3eVdGelQ0Y0xtK1dpL01SVHBCdDlaYjg4?=
 =?utf-8?B?bkcvUUtaOVo0eGEwTCtEdnFab0Z0VU91K0tLcWVUU1VsdHBhd0RXc2FONXNp?=
 =?utf-8?B?QkJnWjBNM0RTRGIwUlNNTUJHalhBSGFZeWRURnBHWm1jc0tMY3pUWFNraCs4?=
 =?utf-8?B?RTBkM044M3NRdjMxa0V1UC92dXpUM0FVOTlFOHF6TmxYdEZSdkpsODMxSXQ5?=
 =?utf-8?B?TG9iV1I1b2tCemltN01oQmxsUytEcW92TjRhb20vajk2WnhoUmtOdUROVlB2?=
 =?utf-8?B?a1dSRWlOWG1adnY4RU1lUitNdUJ3b00zTHI5RWcyeE0rclhNOTZXb25kRVNX?=
 =?utf-8?B?UjZXM093OVBqYUQrcnpUL0Z0UHpVd2dBOGVYaWFjQVRsTVRpWjYzUm5EZUhh?=
 =?utf-8?B?OXlCcXVNaGlqS0FRUWFFZk9qZzBXcmlWS3BBNGwwMUtNRnlXMGplSk9nejNu?=
 =?utf-8?B?cVVpVTJWWUR1aFllSmFCeWs4NkJUWHByMHNuaXQyQU1GbTVmS3ZiZXBIMTBC?=
 =?utf-8?B?Z3RCbkhjODF1UVpTYmcxTzJWZkdmUUN4YVBHUm94dUpkTkp3T1h0QUJIak4x?=
 =?utf-8?B?OGpOeXJOaEFQRk5ueW9lUmkvdnNTZFhmeDhDZjJoUE51RFU1OHFyUUJKOE5t?=
 =?utf-8?B?Zk5ib0E3N1FGZHRWQmppZk5Mb3Y3b20vTHJEU2xUaFJpNENkN3BjL2wyRmtJ?=
 =?utf-8?B?RUVQZUxpOHl1cHdTcGNCNUJoQ05JZy9EV0VlN05idVB3R2kwWW5GUHMvTlB0?=
 =?utf-8?B?emFXZFkrNmdUR0xWYXlwMjM4V25nRWpUTmwydGVUMlRIQUcvV0RNaG4wSTNX?=
 =?utf-8?B?NU96bjRlOHJPd1BNeEFENnFUbmJWNjQva0sxMkxrZVJvYjBabFFTTkcvOVN4?=
 =?utf-8?B?SFV1bDlCOFdzM2JmQnZuSXRvZkdJRWdYc1h1cVh5SisrdDZsb2RoNDRjcm5G?=
 =?utf-8?B?Uk5nNEppbzY4bXQyOE80YlU2b20wWUp2WGlGWXlNN0Z0cTFEbGh6M2tjTklE?=
 =?utf-8?B?eHk0cEdTWGZtM0E5UjFxUysvbnB6bm5OMzZZMHlxc3ZtWFZ2K0h1K3FhT3NE?=
 =?utf-8?B?SFdSeWVLeCttUGQ3dmMxL3ZNeXczT0VJb0ZucGdBWVN5c05TVkFFVDRYdDkr?=
 =?utf-8?B?NnZBaEFRb0FVZGt4dzhRc25VVUNlWlgvQlVEZytqaHB3dmd4d1cyRStNL0Rx?=
 =?utf-8?B?MUQ2Vy96cVFnL3llWkVVSFN6MUdOOWtaSlZOSTNXbEM1WGlLVmg5cm9pbm5T?=
 =?utf-8?B?Vk9scDJjeXhUaXBRS1ZUQVpvN3cxSDNXVWFQdzZta2lKZHBRai96REhCN05U?=
 =?utf-8?B?OHdqZU9hYlV6TXFValZZNFlzcldDWGVLb1F2QlQ0bXNWQ0hoMTRWT2J4d296?=
 =?utf-8?B?ZzAwL0EyWFpRdTQ4OWhOc1o1U3pRZ2dQUndJWVpIc0RDUThNZTdwVTg4RE9p?=
 =?utf-8?B?dkFZdHZELzJUc1ZIWnNaNzM1ZWFlUXMvOTFQWnlZejJyVjFXQ095YnRhNVRS?=
 =?utf-8?B?aHIvcFNaTjFvdHBmcDVVVC9iMVhzVy9iK1NJODZTYkMvK1hVMWhsUmRUQ2Qz?=
 =?utf-8?B?VUZjaDEwMjlwZ0tTRFNuWUc5YnI0QnlWeTczV1BXMHI5aVR5U2l5MG1ReUZj?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GgO5TlVv/bWge63htOQt9/RbJETj4KZa4GyUyNVpKjqAEhipIOGDvnSgWj7DiUHhdTexd9k+n0O0TDuczkFO9IaS6z1qNZeSyEMatZ20LjxtBhIKTpvGGYvLp0IVlk7aDpWr15DWvCxd+EbYqDsPKyA3CoO64jJPLayTjVYaAmFiSOkdwgvQvs0oKwiM5lWy1nB4yrdt2KHDtDRxmvIYRBLjVqzX3r/Lxk9KhM/00ROEUzBjWeuCKLKaFJ3GCCDd5jQCwZD6oDexzDK37I3cpBHntCQa2IZ+ngKalkN6/2JQ7C2AQlX2qnVR5bTvoGmS6zCWOnztH+jwTH8AUPBLGPoz+7+qqKjVf3OAiqZ/Hx8AOHJEJ63Bv1AsJEQ6kdyGVlJoDAUHCBYxNsjdnv636JQQ0/CcGw5lILb/pyy4Sre1ZNg4VgZdB+qcrAjJso/wa9FviXUCLcBPema2J7U7iqLCMK23aiCjLM0q8AWLuDjlrlv47k54WFtJvKnhQNaHX/A17ZMHdCybiEGLcyFdqdMGSt/xPbJBv15RhMBQJnEVc0AQePCpkcoaPeX20PYTge4rAxQ9bX76zEU4K9hko3YrYvL0BnpzxIbgwgBUv2geujnRoi6G9nM+7g2N6uvBW0vpUjfIDZtPaYXrXBrtsV4VdsZbaq3do/E+fXJ8N5xot/CNEO2x3j/CQE6oe2P+T7X2pt76uhJU3vTEBr3Fnq/McwPOi+Mh26klFreJfhn4/YfLa/OHE6k74z5LVUn53xiKZRVbAiYq06tOF76QMaXqwk9g1HB6oAJKQZWf1LQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c901df-d4c9-4a13-7572-08db89e6a965
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:33:18.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAMiEnP7PLEVWxBLF0GH5CsDiKAIkq4K+bxZ+W0SfEBUAK0N8mNEDKoi5wE6/akC7Lu1PunOjJeDzP+HrEGALw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5658

On Fri, Jul 21, 2023 at 01:16:27PM +0100, Luca Fancellu wrote:
> The Linux commit 33629d35090f5ce2b1b4ce78aa39954c603536d5 has
> removed the 'snps,dwc-ahci' compatible from the generic
> AHCI-platform driver control module selected by
> CONFIG_SATA_AHCI_PLATFORM.
> 
> A new driver, the DWC AHCI SATA platform driver is now implemented
> and handles the above compatible when CONFIG_AHCI_DWC is selected.
> 
> The module is needed for the Arndale board to have the SATA controller
> working, so enable the CONFIG_AHCI_DWC as additional kconfig parameter
> in ts-kernel-build.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Tested successfully on:
>  - arndale-lakeside
>  - arndale-metrocentre
>  - arndale-westfield
> 
> arndale-bluewater must have some HW issue, don't have much more info ATM.
> ---
>  ts-kernel-build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ts-kernel-build b/ts-kernel-build
> index 6c8f1d6a..73104874 100755
> --- a/ts-kernel-build
> +++ b/ts-kernel-build
> @@ -245,6 +245,7 @@ setopt CONFIG_SENSORS_LM90 n
>  setopt CONFIG_ICS932S401 n
>  
>  # Enable some additional drivers for Arndale.
> +setopt CONFIG_AHCI_DWC y

I would have added at the bottom of the Arndale list, but it's easier
for context to see it belongs in the Arndale section.

Thanks, Roger.

