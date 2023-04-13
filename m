Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAE6E0D67
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520677.808520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmw15-0008C8-Hr; Thu, 13 Apr 2023 12:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520677.808520; Thu, 13 Apr 2023 12:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmw15-00089u-FB; Thu, 13 Apr 2023 12:25:31 +0000
Received: by outflank-mailman (input) for mailman id 520677;
 Thu, 13 Apr 2023 12:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmw14-00089l-Un
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:25:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45662288-d9f6-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 14:25:28 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 08:25:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6198.namprd03.prod.outlook.com (2603:10b6:208:31e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:25:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Thu, 13 Apr 2023
 12:25:23 +0000
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
X-Inumbo-ID: 45662288-d9f6-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681388728;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nw8B0PqzZkmEgNqIfZy+uVF3ETSAfu8vkeNNFIBfcIs=;
  b=UpoYQRe6mfRFz8E0OgKhHD2U/UnZoXVLKLeUTX4A/w01J3mNuZQyccqg
   jwSi2HPibSbrTnC8+VIXIs4Pms0Euo6V/4SI+Yd6iTI+fBXmTRg7kPjDN
   LJItlGX3GSu9qFFfTpRl9fEQFfT+Yn97SSJ8xn68kk8isrEnkn+tTE9AR
   s=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 105277033
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XzOWK6pKpn1klJv32w/QfGZCrYpeBmLIZBIvgKrLsJaIsI4StFCzt
 garIBmAafeDZmH8ft11OoS3pxsD6pPVzIRhHgtopX9kRCka8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCziJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADA1SBKI2c3r+5W2ScVVmdpkMpjrNapK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqMw3wLLnTd75Bs+b1C8ntmLsBGCRNNTC
 As71xsrtfgvzRn+JjX6d1jiyJKehTYZUsBVGvc36ymMzLTV+AeTAmUYTj9HZ8civcVwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9Lquo00gzrER8xvF6PzhdrwcRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzqUlVSYw7wTTG2mitwVwYdf8Y5TysAeGq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gJiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:t8uu5qzGYN0jf04dHdqYKrPwL71zdoMgy1knxilNoH1uA6+lfq
 WV98jzuiWftN9vYgBGpTntAsW9qArnhPpICOoqXYtKPjOKhILAFugL0WOJqAeQfhEWkNQz6U
 4KSclD4bPLY2ST4K3BkWuFL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3AsT0d8mjg1GNYNzKvcVyTv1E0IjJuckX7znyODBK?=
 =?us-ascii?q?DLmtqZISKVxiOqaNtup87?=
X-Talos-MUID: 9a23:7ETkNgpVNs8HcEhrE10ezwtpM/hI0Z7xNF8MnbZBlOS1MDQgJg7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,341,1677560400"; 
   d="scan'208";a="105277033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5NMW2E0vCAbYcESnlgYK325SNjhZW/OtTNDwzXJT7RcB0f7SC7NMSHtlhPq8waAAXlt1dSvdnkyFXToZn+3/MHRIeMxuuDE0OCDGOD0UjbP12C5nwOr8/EYFx8VFHeKN6vXpZGjckbXdpXlKPIm0AFHmtNA5pWpLFYXbzx6ihg7GddgNkjDQCXeO62oHobPJGfMXCoX+6mxUwjKkIor0EYEZpP1ByC9+1+LPEi6hwaQJqqDZBWFW/JK2ztF2I1psBPAZw0Qi4Zv3jAz7ssTaE04aF82uQ5PtTGRNKadY2SW61etoz+ZWvcB0MVa9nZMcT8ttlLvR/+d3EyBX41vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw8B0PqzZkmEgNqIfZy+uVF3ETSAfu8vkeNNFIBfcIs=;
 b=d2xAhR+FdFhFqtPc+NXIMw/Zj135B22nUQacq8Yp7mNQvqAieuoLrpeySEq1LNnoB7E5QNpp4rW3DKX1J28b2LX9wBdi5BjYfwv+9lArJiLvFNS9ZYyJqOEoP6YlLGBmVh8RetoLLLw/2Xqsm0ySG+ENgtDqhEbxZ8UZ/ssU9AX04PJ8Eqo1KOEdT/tUpIHMrgWUQuQn3NC8E6Qm3HPYNka4dOGXgtOi79mktRnxpnd6oMv4NJOYWX8WiDiduC2JWONIUtXUBkkPisINLzshxWUczOpXkcUqM56sCDa3TLLlWuuYBDvPUMW6AXntIwqrFNf7+6SWA0ptB7HW49tWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw8B0PqzZkmEgNqIfZy+uVF3ETSAfu8vkeNNFIBfcIs=;
 b=Q4xMhWa5vxTOR7nugplsg6k4e6RvU8AWuShDm94BfLtOJOWEn4Y93Jo/KqMC2h8fN9WeV1JGAkQg4qI+28hRZBOhz9Vhf01fy5t2p6Bgfg7a4r69kZBMmk9jLayU4g2uDaQwXToYvZW+esEB5kU2jupC9M7l0Dv3xjM5hqcPDKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <50de28eb-f661-fc55-8d7b-7ba07b160c25@citrix.com>
Date: Thu, 13 Apr 2023 13:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] automation: switch ADL hw tests to debug build
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413122340.47233-1-marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230413122340.47233-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e64e8d0-c4a3-402d-b634-08db3c1a2759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BGSzvVApVqVS6BhuK6MY08lLHJCjwEnSv/evmBBSvzKq3QQOw6xd/z+bj5ZEw0nmNkJlfX+k0meLeg4GEpYVtiC1tl/gm8eXYMe0oj1vHFsOFZRwMx+qf7glhGQ81eb2SG6Ck4Ftey1F5jDRWoO9TR1WEs40Yq3bC9yzEjy4vF8eSMxRZrDudQARQ9/PPwZpZ/syV+iGDVxwHl5YJy3Esg6PiFnLN+sUol1v7tGhANSpUbjF1ag96LeswKZnvwaiHeD/QtewMlCyXeBG1rAcIZFCZ04DYv9ude0WDZ63D4HUMU0inrPMY5VIhza2FPl2ho9GdrnAE5Ky9MFfZbDcQC3V8vTG3c2AgIrM9/mnr5FZU/ekfU6WtyvV2l3uPLCbPUaRwkyRBJIrKDSda9IrsFYnB+yvwZnHc5lPKY+J2hXaldIcfUo2AgGD6qjkPrVP+yhWIH3g0EMaXVzqkC0k0mVprVbQ3u41dg7hzMvKhjkCq8e6bcFkVpVpo2LCwv/y6kWWSCxIOWD3+NVgrlWrZ826Cbsy9WY2HpwGTaKcpEAmupdL3PXZiBv+sEtJ2yphM3XWFWhWX+6gBp9y0dQeJp0PqsTy7OWgbOOcC5wm+fYgzd2sy9B0zS2Q1/j5VZvBbhsKKtbhSX56hvHUXbnaTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(8676002)(8936002)(82960400001)(4744005)(2906002)(31696002)(86362001)(26005)(186003)(53546011)(6512007)(6506007)(36756003)(6666004)(6486002)(31686004)(83380400001)(66574015)(2616005)(66556008)(66476007)(66946007)(38100700002)(4326008)(41300700001)(54906003)(478600001)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUZ5a3lGT1BuY2JtbWkwM0tuL0dObWVPN2pHN3F5ZjlUTUdpSDQxdEZKRUxL?=
 =?utf-8?B?N2V5QytkMVhIeHp2bW01NHJhUnhIaS9TZXJ6dkttYmdyQ1J5UGhXZ29aakI4?=
 =?utf-8?B?YjVlaW1maW1NclF2dVNtQ1dtS2hxKzJreDRxaVQyWHJNK2JSbE5zcmpEemNv?=
 =?utf-8?B?dm9DSTVua3ZydWZSRE5FN0FONWFCQVZpRlBHY2dXM2hXaEttTk9JYjl6NTJY?=
 =?utf-8?B?RTNieUJqL1BjVk0zc2Q5Y1QwY0x0SFFYMjRBNUpoNUhhZXdpZW1kVlNCbVl4?=
 =?utf-8?B?NUl6LzR2Y2ZkWHgvaStUd2hqTmdVOGowS1hiYS9BYStLMnB1clYwYXNGaHoz?=
 =?utf-8?B?Y1N6VEQweENRU3hPRnU4OXVJQTNuVW9nOTZtaWtMYUdtc0t6ZVk0TGp5RVAr?=
 =?utf-8?B?UXpsU2hzRFhVdGRjaUVSYXpoV0JRb1lZWnVIM01sUW50YktlbnprcUNva2Jo?=
 =?utf-8?B?VzBjMEZReFJGbG5jV0NDcXZGZno5MmJoRjJKNnE5ZGlkK2dwYjloM2JaWnhB?=
 =?utf-8?B?STBBNHJXT1FaOWJ0a0JaU3UyVkYrWGN1UGVGT3ArZHp4bzFTcENYNVpacG82?=
 =?utf-8?B?N2FaMm1TZDJaNDFqdENYbTAvSXBMVElNU2RWQ2hTYlFENFN0SGRGUHdockhP?=
 =?utf-8?B?dUJKYUtsMXFKVzBxTE51NHdHZUVseDNjaUd4OU5GczE0MTYvK0tNcHFYVzlM?=
 =?utf-8?B?MFpMenBySTBxc3lZTjVObHNhcHc1MjdaUWN4dUxyZFdmTVIyT05SRC8wSzAx?=
 =?utf-8?B?M1BCZXAwejg2RWdGK2c3RkZiTUg3Y0h1b1UzRHR2clNFNld4VjNvMXNDY0dZ?=
 =?utf-8?B?SG5QRWYwOWVqOTdEenFGaDlvYURhODBCVmhFd0xaaDJkMDQvQWg2VHNBWjhV?=
 =?utf-8?B?ZnoyMjYxcU9tc1h3NDE2ckhvYWVINzZBeERXK1N3TXdCOG9LMU5DdEZkVktX?=
 =?utf-8?B?T3lOWDdsNEhiQnpyUnFJM2xpVjZiZy92QUFGMExJYVRNM3JFeFJsdTJ4ZWNG?=
 =?utf-8?B?Nm40RVp0MXRJQWNucVIxYURFMndNSUV3Rmwwc3I4VEl1NXQxT0JSTXBFVmh0?=
 =?utf-8?B?aVNNWmREWC84S2x4WWZlWDBkNGQ0N3BDSXNybFVWR1hTK25xVlo1QXB1NXZl?=
 =?utf-8?B?MmdmUjFCWWFISU9vbjdZSEFkRlVLOUlqc1Z2K1UrWDdGYldrWU5NUlFMTXR0?=
 =?utf-8?B?azFrSmUxQVNPSTdEZm4wR0YvVEg1WWNCb0REQmtYRUNWV1VYd2VvUDB1TzAy?=
 =?utf-8?B?RVJBcy9NRGkyOTRBeGQrNUVqVm13TU5tbjdiZEFDUkdGUUh2cmtPYlJ2RkdI?=
 =?utf-8?B?VjBkNVBNSDNFdUZINjlFSWFnSXBKRHlSemhWQmtFWG5BcUZxcXFWVGR5b2Jm?=
 =?utf-8?B?UWxMS0ZJMjVHeEE5R00yL2Z1bXBBN2NuajlrdFpWVEM4c2hwMjNKMnFSYnVt?=
 =?utf-8?B?Vm11dlI0Z0pTY1BrcStKNzJRMDJZNkdEcjBBZjQ4U1ZJWGJTUldmM0M3V21y?=
 =?utf-8?B?K2hSaHpJRUg2UmxPaDRVblg5WWNtbFpRZ25SK3p2Vkt1RGlNZ28ySWt3aS9j?=
 =?utf-8?B?UVdzWXpVOUpQNWFDTWg2Nm4rUGN4bUtjaEhTeUZVYmNBRkEzYlVVRGlpVHRh?=
 =?utf-8?B?ekZybnNWVmNUbkdLWGhEeEFrcmFZd21vTDNpcjcwbGt2WVRGVDVibVFCc0FN?=
 =?utf-8?B?WFJndmVVdGRtNFExTkZzRUVLRDIrMTFVMGpTdUhoQ0k0T2IyQnlkZmtSSitX?=
 =?utf-8?B?Q2N5Y0YrMXZzWDNVWkZBREZSdGJPYmgvUWt5S3E5ZXhkTHRLWmpET21qNG11?=
 =?utf-8?B?NVkrWkxJYjJuQkYvMjlIYUxweTEyeWNSQzNPL1lZN20zYmVrcitHdmxRNEpV?=
 =?utf-8?B?bVE5bHlMa1BVRkZ0N2hzUGlrbDNBdWtaQ0VyR0V6NG51TXFqK0hxNlp0Y253?=
 =?utf-8?B?VFU1NE9VZUtnL0w3SjFsRjNPaitlUVpGWUYyMGdKMUR3d2ZlKzBtNjZ0T2VI?=
 =?utf-8?B?aGlINDBlZjJJbjNLRC9mbEFNdy9mNWh5bWdlMEEzZGhNNUlybXNBY2ptSldT?=
 =?utf-8?B?bXQ0WHV4WVJjaDdZSHVZbHRON3VncUtzc1hwY2k0Vzh2eVhteXdQdC9XMGJC?=
 =?utf-8?B?elR1TVZ3d1NmQnV2UStJVlk2QUZqeWU3dW9uMWgrTjdqZ0J5cTYyUHcwdlEr?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9qizroPoeI8F2lPM42z6pF+pOkjuzghjlIyKfjC7+YpVG+S6GYU6c0OzFLoFS20DbuBtoZ8JbnOQeQZBK4o2bKd5R2l3pBCO+LTZovo8BRbY+qaZVNsbOcWm/BGLM5iznxC164K3R68tt+2FwF+cpiRtws7bK9SDCxbcIde04KBLJdUMhOW/iGdQHHSFntUA48Y3BX1GJemENdJJ9Op/iZYzH4vG0w3HzN9sqhffLWdbDulnP48FfopRFavs4PsSturLamQseea8UPoaFIP/2Kecg5T9CunLB9WYz7E6LpIiCLep5YQfCVtMt3QhAkER8SasFTErk0mAugFnOGE39wgKziMvWlJMOIRJROt7xIvbq5rDckMcxs8rkGddg0iVkMDlQw3Zo6LY6br7hS3PnvMizuWh6Gjg/aH9x9otTX/nFRB/iEE3bwNHVrab5Cg1hI0rX6+O2CFq3+zCeNGM5uAvniMwftbPC0zmMrfRlBaQpCp2yn9dafUAS6fVqnkiT2XmLBQnhNd+zgB2KDFXtorGYLsskYWc6ECsoq92Mc/iSu5F9vsrXpJmhqpXOLGh6I20XC+PGZK3Lix7r/YY+OoEwIN4TjzFtAgBHnbYqqWp/zrmjXPSoqQSDEWjOYp1f/1tzR+h7Zg9Rb/N73aHokNm/+i5emc9x/wzI8wrnL0hr4dXYk6FTDG+b5e+BeLMsAHeAhqCanLdDyqwK/wO4VqXSG3KPmlpmI4MZ7WT8qIGFRKan/5AQlZrk16Zj5EeNpqnqZEPJ4o3vIA+BVuTqGhu8uhPWkoebujo8mAl1JzHF7QRo1f8R5PPNn+liHHJAXkqvi7znWUT8GB+0A8BeEJZ4TqdIkNzDJepbwiZnYo0lzr/k+CEjtLhTLGiy4leWGdvYGYO+1PC4KuNXM85xA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e64e8d0-c4a3-402d-b634-08db3c1a2759
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:25:23.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDsLRiFLIM7jnEvaw/LsNDXdpzgz/Qc7Rmx5NQ8MFjEhj1Ay06zgPozyErIAlogEx4XkBHnteQxWgrQ03lomI4vuw37yeq5jixzPp3I5z4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6198

On 13/04/2023 1:23 pm, Marek Marczykowski-Górecki wrote:
> This should give a lot more useful information in case of a failure, and
> also enable some asserts for extra checks.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll merge this shortly.

