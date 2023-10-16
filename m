Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB67CAA77
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617606.960347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO0G-0005aG-78; Mon, 16 Oct 2023 13:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617606.960347; Mon, 16 Oct 2023 13:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO0G-0005Ya-4P; Mon, 16 Oct 2023 13:51:28 +0000
Received: by outflank-mailman (input) for mailman id 617606;
 Mon, 16 Oct 2023 13:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsO0F-0005YU-06
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:51:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17c696b3-6c2b-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:51:24 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 09:51:16 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by MW4PR03MB6329.namprd03.prod.outlook.com (2603:10b6:303:11c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 13:51:14 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 13:51:14 +0000
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
X-Inumbo-ID: 17c696b3-6c2b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697464284;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2cE6YoDPEo7VVA2JfdYN1y3a11ih7FLDaPLJIG4q+Ac=;
  b=c5XjmF/oDt4BTh8rBJpi/YJrkvQYJ6mwsBQ/5Quk/cAYDYMihek1Fatx
   9jlghKo2dZKDy7u3dq33W8NDijImybwnfOb0EPolN6vm7pd8OMj3gbU6q
   b6CGLX6MziXF2IJfbeAFUTMGanVV8MCLkUYvavXsqOTIusuRjkT85xlNN
   8=;
X-CSE-ConnectionGUID: KofkAnAIQ/mkRLgrBFI6/A==
X-CSE-MsgGUID: 9TXjAZSuTwiNgKCsrIVZPQ==
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 124314541
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FQhYkK3wV/UC0H3qTPbD5RNwkn2cJEfYwER7XKvMYLTBsI5bp2QGy
 TFOCz+GPfuOazCjfYxxPI2x90xUupSAnNNkTFFupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfImZA9
 tUeARE0KRWAvca52piVa7crr5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LOUxH+mBNt6+LuQp8JagnSh/XEvFxwwWniQuuOYtHyGYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3OcpQRQ62
 1nPmMnmbRR3uaCRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AZi5EN3qDipVTf2Wv0/t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRtlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:EEQ8J66F+KOD90uelgPXwMXXdLJyesId70hD6qkRc203TiX2ra
 qTdZgguCMc6wxwZJhDo7690cC7KBu2yXcS2+Us1NyZPTUO1lHGEKhSqaXLhwD6Eyrl/uRB1a
 Fme60WMqyTMWRH
X-Talos-CUID: 9a23:g3XetG9QIKOaj30GUAOVv20TFMMMdFT89TDVIHWcBnxDZpzLDnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AzRlJlgzMyuUJtlpQ/M2cXy+oFeqaqPWSOEIko64?=
 =?us-ascii?q?bh9aFEyNTECyHrQqFerZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="124314541"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0+e7t6YZDFS1WL0BdNrEvFH5TZYBRSkWFPq69ocnBCFDDkb4G+F5DuVsvmgewu8gZzj+hKVw2Vh7ErghpvGILqi05fPRImnJgIBsehaw9Y/9/d7mLQX8NDUD0KmZKq5kzBwFjiKLSK8mbOXWlO56NCVNUc+03ZEEfBALYFxnS6DCoWAmTcrNnvdg1IudR75aB5NRbC1YTXC1QqbGhw2Tku0ijl9zxZxgIWSODpswyAAYEgRX5rKKM1D9nnSK356RVEss3UPBy8B8sJtUlUYriD2UY/mFqknkziM9Frg/Sh6rG7eeJVmuzcU/Mih7ZRpBznvSuzigGxAEYspM2pkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTJmAOcwzM/LiJYGBaCrr/9mqOAO7m86g6k4IF62U9A=;
 b=mPAENfVWXDRtcIoyAi/z15C4f0/U/ueF5ZBCz1nZWbmjNDEb9P71AcBUxaaFTZ19xlk5nNUieVMbRUADApfzLuqNwZBAUMpK6GDO02ONShAadGioAxGtaZYinpX7E1HSWiqNLr4cQ4bhMEaZjqhp95IB5/SzgDtPQ8CCHJLYhjP/bnQHk4uHgJDN3s/fFZ0UVDHXRmQY3YGtL8AMB02MVysheT56FSkx0QPYpWN4wYO7G5lIGERlgqLO8imT6b1u6ntG3drZCCRkoBF9F95vg7nqQ43fpbxshUZVLrflcHMUsrejar/1fN+dUrnilnYdnUDPG0Gwn4d8j793IyRJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTJmAOcwzM/LiJYGBaCrr/9mqOAO7m86g6k4IF62U9A=;
 b=aQW+HDlzeIDZJ81L7b/0rL8nTMdpLa7Edx+z5N++xG2rvG/vElvOTvrjNFbXz/hdYU1WCKBeHDvW0a65iee/FKzpdt0vxp4u2fvycPfcuaqUrucjXviIdqBXf7JzdVxTtVBucdKtySXmiLl9/eiErwRkIZhkiUh8bSHnD/7D6LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 15:51:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZS0_zPxGLwfsuVvX@macbook>
References: <20231013085654.2789-1-roger.pau@citrix.com>
 <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com>
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|MW4PR03MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eca3f59-608b-4a6a-8119-08dbce4ef660
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j1ZeXGLflwOGqnQ4M8lAI1YdX3as9rLVFk3k2+H71/+J+JJIb/E6YWzbmVNpMW/5hnYzf5oQU7Mju3WV2QjUC5XQHEJKCsPLkaqNw5IvGhgJKo52D+fpMWw0bZmN/3D3DnZCcEobTX3otp0aZBjJ7WK0x+4WIyJDcDsKyFIs/Tahl5wQ2Za3el2Dx/2M8oSyc+Cpfbls/VqBmVeiAcRK1dH/I/VISJ9KCKFKy0C9O0VjLRDwp0FcRG5oJH0fgQlhlIYbrk0dziVtUEUitfENgL70o7o2u8XhIY9WCIM5lnuNUuxnQ1BX5MOuyBGZR45bcOryqGljrDqTImY0B9VJqj4GYq6Qm0v2CTaUMb2aZ77sIWAJgdhzLjcUKUZ1xv8cjrMKWb10A7MtpxD7TSgwmcco1sJutynX78bPKSXNcvXqXY1g1N8JJscBio7QvAu1kNQnp1CF+ipJKcsaXA1SqMuPAMDHphnYCuGWgzsQJgZqFNj1QggJ1DgX08R3teD0LoX/TxU6N6odOkc7aaZ9vjbakYpQQJ+NS22Nek7c6yI3+g6hsHida/27bB+rOJHG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(82960400001)(6512007)(9686003)(6486002)(33716001)(66476007)(6916009)(66556008)(66946007)(38100700002)(26005)(6666004)(54906003)(83380400001)(6506007)(316002)(53546011)(4326008)(8676002)(8936002)(41300700001)(5660300002)(2906002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nzd2dklGZldIL0lPaDlUZFc0UVM4VU9MVVdEVDVIYy93UWdEWHlDZ05IZlI3?=
 =?utf-8?B?WWpPNnFHUmFoYktLSS9Oa2tvQmZ4Z21YUU1EblRlOENQUHNrVVV1R0dpYTFi?=
 =?utf-8?B?Q0hIc3NNQXRhbndSallwZml5Y2RRUGoxa0pSSkxtdUtMWThuUjVOYk5NZXFE?=
 =?utf-8?B?TVZRL29uTm9IZ1dmNUlIQk8rWUtVWGhyNExjeENGSy9tQVArbWM4NTV1WE1L?=
 =?utf-8?B?K2ZpZnpxZHBIak1NYXk2NUltMFB0TU44KzBmWGk1Slc4bURnUGRuVElmRi9H?=
 =?utf-8?B?YlB5RFk5eE9DQ0QwMW9aOXZ5bTU4V1Vvb0tTcU9aUlh0Q1VPTHZNRGI1bmRO?=
 =?utf-8?B?djlQMEU0eitENTJOVkFKWHRMQ1FVK05IUWlaRVROcUl0bmtaWVB6dmcxOVll?=
 =?utf-8?B?cEpQME84S3kxQ1RXd3oxdXpOWXN3ZWJQb0hJbGdvRkNEcWJEUm5zYWxrd0sr?=
 =?utf-8?B?VURvdlRTeXZ6N0NrN3h4NzB3UzlWcW9TRStKaDJabTB2N3NPMDB3dnptcFdL?=
 =?utf-8?B?SXBZTGUxVm8yZGNIT3JCQ0hIMVBjbGhZcDdOUlZsU1R4MXJtWWkyWEw1NndR?=
 =?utf-8?B?U1dGM2luTXJZdmM3aStjZmJTZXBJdGk3YWJkbTF4MUlvYWRmTlhtYTFWME1B?=
 =?utf-8?B?eVRWeTdwUFZnRXJGWUZFV3BHOW1QL1dkWnZhdzd0RWVxaCtFYUg0TVNxQlJK?=
 =?utf-8?B?UytFT3ZuUTZadWM4Tjg5MmZaanY0S0gyaFgyTmhWZXZYdGpVYUF1WlZUYk1y?=
 =?utf-8?B?bnJ2Qm85Njk1NjBEdWl2U1g4d0hTUzBuMW5OTm1meFVPM1lZYTdlUmlVRTln?=
 =?utf-8?B?dzNPdUh4V21MeDNpejhNaGZIZTBMYWg3T0VsVS8wY3JmSGVjdDZtTHBiSkJ6?=
 =?utf-8?B?RkJRRVkweEJYTEwxd1hySjFjMlFjWnZ1WmpDYmU5YmlXRmlXZ0dib2hNQnRj?=
 =?utf-8?B?UlVmaVBIcDNUNGgrbm14L2l4akl2SVAzcjcxOStRaGhHOVM3N2FSYWo5Mk5r?=
 =?utf-8?B?aXdkd0lNNDF6cjBVSWQ4VE1FSTAyaWdNVDhNQUxoMlJtWG81VFFzcFNlbmNo?=
 =?utf-8?B?RDVUT2hjMXVrK3FMSFNZNXA3VUwzYjF6MVBzQ0R6UVp1ZXQyYjZzRnVUUUFB?=
 =?utf-8?B?ZXAyYzh1WURoOG1lNlN5T1MxR296UnpUb1NnMjVpYjVRVktSUnRtS3lNOGRS?=
 =?utf-8?B?eWZCUjdsakYxWHhqWmxObjRWYzhxMjVXWmxWVTI5bmZKZUIxK3hPVyt2YTFV?=
 =?utf-8?B?c1k5WFJMSUpaMUpsbmJzLzltS1ZqY2VRV3N0cnFRVTBSRWtPbmlLZmNUV0Vi?=
 =?utf-8?B?TkVlSUZURDZHUXNyc3BPWUE4QXQ0SHR6YzBiZ0U2NjI3T2FHNWs2a3hVRS92?=
 =?utf-8?B?VXpIOEg5OStqSWtyaHV6OTJFajhycEVLNDBiZi8vM0Y5YmJJVEROcW5GL1Ra?=
 =?utf-8?B?U1RSaDhCQ3MyVVVJUGltd1F4Q0pncEE3TzE4M0k3Z1dQSndvemswQ1hTZGV6?=
 =?utf-8?B?b281a1dYbm9IQW9XdHdFWkQ5cVQ4U3VoUE1GdnJxbU5vRXRDc3ZsaWc0VGhC?=
 =?utf-8?B?S1ovbkw4ZEVzZy9TampMM0xKSnN4QnFOU3FvS2Y2Ull0STU2T2NSWWdhTTEw?=
 =?utf-8?B?SHBtUFZQc0oyZm9WVjk5KzF3eEMrYUtoSGNMbldwZ3B2aTBuYkhFamgzNTgv?=
 =?utf-8?B?M1RsNmF0OU43cjNweCsvbzVxRjFUUmhjSmRhMi80dExIZDZqeWhwSytsdlRK?=
 =?utf-8?B?S0l4SnNhdGlTOEFZVDcySVBFR1ZqLzcyNGFkdUVwd0lRN08yZ3pCTzhleGs5?=
 =?utf-8?B?QzdDZFhlcU5yN3lIZUw3S2NPK0EwbTh6cXdCZVlvVUI3N0hxUzdIWjFHSy9n?=
 =?utf-8?B?Z0gzd1pXV3RsZUx6aW1YcjZmK1k0dnpTaXozQnZDbFBMalU0aXA1eEtZZ0lG?=
 =?utf-8?B?NVk3TGhBVk1hK3J5dUdqNUFIaFpqNElxazU4Wm4zYTMrc2lPcEpzdCtQYXNh?=
 =?utf-8?B?OEtwK2Jtb3dGWXdScE1GRFJDOGJYWm9ZZ0M2SXhzampNRHRzdDh1Y1M1ZGI1?=
 =?utf-8?B?RWR3dHJBNzJ3ZzFMQmNQZmk5MDFVQkg4RFZtdS9uQ09WOU9vRlVvWDVwd0dt?=
 =?utf-8?Q?N5+jIW5sNpjkIAvG55E7UucQv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pCcShVUBWPoHzMRCUksoPg7LxeOqlOGeEe+aVtEu9V54Q+utuRUT5utZSHA+9HFAmAKZeHNaj+e+tlK2DRLDM3cw3h3UVF3P1FBzlTnsL5EyAu+VsFmZjwCqpTU/EdYuwW36XMM8nlyJ9JMnvaFctXjcOl/Z81l4S/dCwEY+Hnl5pVA2cK7hhf6nlxC+OpvFPUVZZguVjsMcICtp8sy7VQNj+Mp33Fh+ytRHeEJSWhWdOg8Y9/y8weJ1gAKfvC2ySLE8tnOrYUW5DFW4W+f+hrD2b4iRWPhrVGVQdn73OXqMqzUgjccl/FSAYtNRiiwRJIqY8e7vKGHhxvdnI+gWpPOC8hj/OAKJJ9bpJwbHVo6KW56n8D5zd1osaMPG4ojLBDsKNGeAVhxqUmAG77PkSb2LwlA59dVjfeeKguXrPrJYjEvPre1tl/MxroTgeX90MHpIGw1b+LN8Dtapvr9ZKFqMnTKmstVZz6fF3fTS+b3pE2RRTkyqkmbNABsiT/oUVrwg3LafIBYnsiBQmgz3l055J23gOCW/FKwCUivplx8Cix59HD3GhspgMvMyXfBCHECTYlWf+ieyvdTP3zqUVRz4k8HP2p1jvijMkhEWLD3oz1xaWT/wQSIeyyvcKZ9mVTvsHqQMk1QOqYDWokvvHPEYxYoAlGFL9aiPWSeYWt6mm4vOJRr0zkjhUMzRXKnoLzIARjGLirotLpcEBF+yXWmamSO/bJP9ztqPP9G3U4Z+81UJK222kRZIH7LPy8f+XiiWEnf+emHfXU+y7oZSgPm3V0PxWfTXkDArvpXSgmHqYMtgY50IynRrG8+bjN5qGXVZJxxaqYixTC7ILLAVY4XZrRbTJN0v/Ln86MQVNs4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eca3f59-608b-4a6a-8119-08dbce4ef660
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:51:14.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5BGSQIeeR+uPJdELao47BOFutuzYUPHNSdkA7gB+NMZBueUJiBkws3cwlBuvVsMJjmQmF8MSvO/W2n89yKEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6329

On Mon, Oct 16, 2023 at 03:32:54PM +0200, Jan Beulich wrote:
> On 13.10.2023 10:56, Roger Pau Monne wrote:
> > The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> > builder code, causing the region to be avoided by the arch specific IOMMU
> > hardware domain initialization code.  That lead to the IOMMU being enabled
> > without reserved regions in the low 1MB identity mapped in the p2m for PVH
> > hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> > describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> > faults until the p2m is populated by the PVH dom0 builder:
> > 
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> > 
> > Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> > Opteron(tm) Processor 3350 HE).
> > 
> > Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> > leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> > arch init code to create any identity mappings for reserved regions in that
> > range (like it already does for reserved regions elsewhere).
> > 
> > Note there's a small difference in behavior, as holes in the low 1MB will no
> > longer be identity mapped to the p2m.
> 
> I certainly like the simplification, but I'm concerned by this: The BDA
> is not normally reserved, yet may want accessing by Dom0 (to see the real
> machine contents). We do access that first page of memory ourselves, so
> I expect OSes may do so as well (even if the specific aspect I'm thinking
> of - the warm/cold reboot field - is under Xen's control).

The BDA on the systems I've checked falls into a RAM area on the
memory map, but if you think it can be problematic I could arrange for
arch_iommu_hwdom_init() to also identity map holes in the low 1MB.

Keep in mind this is only for PVH, it won't affect PV.

Thanks, Roger.

