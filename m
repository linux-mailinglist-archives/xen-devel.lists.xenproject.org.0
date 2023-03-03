Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F76A959F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505865.778845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY333-0004Lp-E4; Fri, 03 Mar 2023 10:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505865.778845; Fri, 03 Mar 2023 10:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY333-0004IY-AA; Fri, 03 Mar 2023 10:54:01 +0000
Received: by outflank-mailman (input) for mailman id 505865;
 Fri, 03 Mar 2023 10:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY331-0004IS-8O
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:53:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1634552-b9b1-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:53:56 +0100 (CET)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 05:53:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 10:53:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 10:53:50 +0000
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
X-Inumbo-ID: b1634552-b9b1-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677840836;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hh8w1BXwTXVSFyizCvuLn1UHWxFa2Bg1nH6pCG+3RmQ=;
  b=CeCl1oSJzL332u7wMhZoz3WPmY7ewzLadkEf7Tv0VUzADIrKBH3lpPir
   UUZ0VM0niLZm82n4lciLDjKmLXGaVaX9nU7rHw2RGVEz7hrA5UJ7ERW54
   +zFUblzL/JTu/tLJyKZ8AZKa5swNKYCfdnfVE934wM+ZxiPyNr6URwMw8
   I=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 99727551
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Na+RlKpL7NHG/usDLm1mBLE5AE9eBmKyZBIvgKrLsJaIsI4StFCzt
 garIBmDP/rcNDbxet93PoSw8R4HscKEy9diTgFkrStjRCNDo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzyJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAgATiqHir6V/LGAQa53qu0DNPfWLIxK7xmMzRmBZRonabbqZv2WoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+SrbIa9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzpqaQ13QDKroAVIAcXX1nm/sWWtny3Ad1TJ
 V4kpw8LprdnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1V/GijSou5PAZhQ0+ALMX2SuqAh+YeaNbYui40nW9vZEIYOQSHGOu
 XEFn46V6+VmJZiJlTeRSeQXWr+z7vCOMSb0nlJkWZIm8lyF8Hmle4dS7DhgJVxBPcMNeDuva
 0jW0T69/7dWNXquKKVxM4S4Dpx2ybC6TYi5EPfJctBJf559Mhed+z1jblKR2Garl1UwlaY4O
 tGQdsPE4WsmNJmLBQGeH481uYLHDAhkrY8PbfgXFyia7Ic=
IronPort-HdrOrdr: A9a23:qzk3bKBW2MrVj6nlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99727551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCGqfhAokRIBTCCBjejJ7sWEScAzRN3PPr7tyblIP4L97q9IhyBQ3kRThw3O3u9hOHWtISBcPnZlIkmbXrCbvYpQqTSJmBa1rPgx2XNjtOvmIABBX3rT5bcwvWQAvvmC9p3ZMkJj3K/z+DIhdOdweRx/OIQKf5CHN/kvnWMHd19MfiHJ4HD8gpNVdTOwoJ4vNimAJ0FUNwmmxNNUqz6tlqtD7zqhQx5aWq42pLoU6IpZd0BAh963agmdGdIzf/50AuuAW1ss17PoufIdjimsgvJNwskJrlFkTGlONC/+Aw2yGeRkycfXvPX/UguvplkLFvsMcMVfSsZ6Fspop0jHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh8w1BXwTXVSFyizCvuLn1UHWxFa2Bg1nH6pCG+3RmQ=;
 b=I3tmOTQ34m8phtdxoNjwwCmDrsQ3rgA0wIApP1LmFrtenStjt6rYq4ZCOKApInfyaY7oz5/8UFAH37L8bx8pEyl2wwMOmiv7rtac56YSb3ak1e69F/Cj/jayU/0s3uJjNyPoyLkEr/apcsA+KTRC8Z3btaYkFwJLMzcAQiRymPzPETRlvs7XhQgdIz6F/OUz6bLTs0vWHEpA0x4ZauM3el9xGVSOG8hin4eznqGcKd4RvtOyHkNXr37kHW53xkBzaF/FR24gONxT63FWBAXXSHDB4kkAISi1fJLdBbfNRUapvPTRPLD/+ZoVEvzCCgU/f6y9ibpZDEeb/yMZEg77DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh8w1BXwTXVSFyizCvuLn1UHWxFa2Bg1nH6pCG+3RmQ=;
 b=w4pTY7JYbN5dD/eCngFgRgcnQGKpsZG1WAE2ng15RPWG14sOLCtJboIYdARjfUUa1svLldYnP5XBkXwqqwclKlGxj0+DtLY8sGvVqE2hUpHoWkK9Ebw2rL6UFv/L40DsxWy18IEd9AJNBGw4idmYzegQMj1DLjeJiiSC6HgxoU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8e0a2b7d-b879-9d6f-a168-ea9399e4252c@citrix.com>
Date: Fri, 3 Mar 2023 10:53:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: initialize .bss section
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
 <009206ce-1750-95f2-7f6f-34c71f0b79ec@citrix.com>
 <415ea0b45a1d6539935ef77181d08aa22e00f7e5.camel@gmail.com>
In-Reply-To: <415ea0b45a1d6539935ef77181d08aa22e00f7e5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0427.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f3becc-832d-4d40-18c7-08db1bd59247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ETT7N7HvR69gNT+r+0mPN+g5dBPu2k5gIZAtcgS6Z1J7KfniUZuMc4e0KCM6NELNLeCY6UjlNw2oH9GJNo3JcTI5SuMoDqrnU1Nu1WQ5IBOG56DvFhwQVtywFTasWkYUYhZD7rViA6sAKVFtWPKVlNFRSDWUdE42CHh1By+dAPQksANfoiCEXD56FOKk7JNRY20vP5H4KmXsMVpcDXPP4jvcnlU3TNn8fBxF1xdtJash4fBnAqDUJblzoAiwjjCUewqlh9bNQaVWPrZncELR5K3JzX9m9Tf7pb26DV6vgxL5UzkqJSDZnlJa/4hEBdMQh0JjIh0FSo+JeAK6pjBjb3B6aLYanJsfHioTyrhLyARoSXvc3ZL0MASXjBuNZIX3JiXqePcjJNrbL+7JrF/NBaTm1exJBhtN92mIyj20m38VioN4QydoOv2UFt7ZeDYXxXZsxz6rmpv+zj3wL7hlvAd960v0IuL7X5jiZ76IlugXec9DGsESE3a+IuYi/s9ibKot1B7Vprb+HiMsWKv/krUfDzP5IwjCCm0UNkPPzs3yaA1z4x6AqQQWeFHPv84cfDjRMRziMshvVaU5Rt8u1zaLUHMfnnGR4WBo0CCSVrz4DIY11HgZN72Xt1N6906YKxypIIN4TPP8FHX00QR2IIU2RZZF8D1Nrn6fhbFI9eN4RTOpaUDk3tDr4/cdvQ7RgNe6z6AQZ9ciYB1eFk+FuaP2LDNnQfafEW3lZXdsttNLLR05o8+RdfFN2KLWq4b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199018)(186003)(26005)(6512007)(6486002)(478600001)(54906003)(316002)(66476007)(66946007)(66556008)(8676002)(53546011)(6666004)(2616005)(31686004)(4326008)(6506007)(41300700001)(8936002)(5660300002)(82960400001)(38100700002)(2906002)(31696002)(86362001)(36756003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmdjMHNKcnB0b0pDUUh1LzFxMjVZNldJdzkvUlJOSytCb2IyZGdPY1dIdDNv?=
 =?utf-8?B?angydEhrRHd0TTJvQjlGVjI4Q21ySGI0eHlNUnk2czRUZ2FFaW5tMEtTSU9l?=
 =?utf-8?B?U1NNb2FUSTZHMlMzSkFtOVRoYUFCRHMrTGZOdmx2cnlyS3FGcktsV2xNYkVo?=
 =?utf-8?B?RWRQQ2plaEdpSTZrME9teDhOM2NwdlBTdmovV0VDWXJMdGRJWjB2dW1QTGRa?=
 =?utf-8?B?czlUVGNXaEFHa1BUSDhML3JBT1JjUGRFVGRWNTNnVGhZME00UVpMUk1DMEdu?=
 =?utf-8?B?T2doQmhGY1JDOXdINCtBaFB6S1VhaGJ1Z0FJdjh5eit2RGVCUHh5NDM1SC8r?=
 =?utf-8?B?SStnOHFnYVN4ckNOY0NmcEtDelFQRHhRVFkyQjdLNU5hMi9jM0w2czh3bGpN?=
 =?utf-8?B?c3dlQVI3bWRHbXVXSTNIWEVZSEpnNzlOWUh4alBZTDMxN0RrZW44aTVrVjJw?=
 =?utf-8?B?am9DdnN0MHdFL3FvVE1TYitGZWJKdjFlbW1mZ011RWRIU2JhZVhRSXhKU1Bj?=
 =?utf-8?B?RHJYek54WXo4UDRaZGcvUnN1OEl2UEtoNlJNK24yNHNPa3pjdFpPODlzL2RD?=
 =?utf-8?B?c1VDNGoxMGxQQ0xuQ2c2Q2dMeEFZUjNLa2tMMm9ucGdTL0NDUTNPN0pzUHQz?=
 =?utf-8?B?NklxdmZrOERycmFWV3UvQ1pZWUt5clU1R0ZneVV2ek5wL2N3YmpIRlE2ci9k?=
 =?utf-8?B?SVhBRVRVNnp1Wi94c1NocG9wTHdzMTM0MkJMV2x2RlNwZ1A5c3p1aUVQR2ZQ?=
 =?utf-8?B?TFZkUzlibmRxc01wSm9XRW5oOXhRMnZRN3I0VUliejJmSkNsbC93Vm1kMDUz?=
 =?utf-8?B?MHpZOGg4eWpYRGRZWE54SXQ5NERLNWdoYnRMNndMMFZvNWtiYm9LMTJuaUF3?=
 =?utf-8?B?NytacXhQU05YUVFQdUJVWlp6WDh3YjF3MlZDajBaci82d2JUVWhsMXM4OW1I?=
 =?utf-8?B?MWMvN2VXaWFmSU80YnVWZ0g0R2g5NktkOHhrdEFwcXF1TjhDWk5KUURBVDZN?=
 =?utf-8?B?UmdXUVR3aHBkUDJDVkRVUitVNHk1M21hWGNpdmVnOE44Ym5iUXljOEJtdHk2?=
 =?utf-8?B?M1dNMXNKamxGRi8rK2phZTVXMk9mT1U3elozQmpIbG14MEJ0MmkxZ013cXFh?=
 =?utf-8?B?clBxK2c5VFhVTUpJZmptU2NJbStPdEZZdXg5SWJBOU1KMTZSZ1RCZUhDWkZl?=
 =?utf-8?B?SE9SYUhOYTBmZXFzVnpEdmpZR1ZhM1BRcUlYR1p0ZitYdGFyWDBuc0JrZVBp?=
 =?utf-8?B?bzZ6S1JYdGd5cGNyNitXYkxlM3FRd0tLVzRESmtzZDBaL2pXOURGVks0SmMw?=
 =?utf-8?B?dldZM1F0TjhDMldaUE4yVU5pb2NRMm5OMEdsakpKODdrOVdRYncxTm0xSzli?=
 =?utf-8?B?U0w0dllFZVU1SnIxUUcwc1NneGhCeFV3V2Z6dUE4K0JkeG9Dcld1UUNGY0V4?=
 =?utf-8?B?QUpwbmtTNy81TC9hSWZaRXF3a3M1cjdqRXE0NUdVQVZrbHlCVUY4TlhML29M?=
 =?utf-8?B?T0hrWmEyV3dlOWlQVmU5M2hDTFFhcjVOd2gzd3BXTWZ1bS9ZUDVCd3g3dktI?=
 =?utf-8?B?UU8wbHhwSktzOU9LaXhxNXJVMDVQOWt1Z0hCVm9sTldIRTZYZ0tDVW0vTzM1?=
 =?utf-8?B?Y2x4TVg1WU1kZ3NzYXRSbG9Jb3NFQzRsZXVUcDRrclc1YXo3NTIyTWgwbk05?=
 =?utf-8?B?dEtUdlU1TENxcjhTTWNiUHk3aTMxbERHcjIyVjJLMXhPUS9tMnNLRk9icGw4?=
 =?utf-8?B?Zng5ek01NjdheHdySUpWV203M09FeS9sRk5ZZW1uOVU0ZWZxVVBBTnVkdWZs?=
 =?utf-8?B?dXNaZ08rODB5Qkl3dkRHby9RK1JpWUJXS0ZsTU1FMFRmd1VlMFZpM1NQaDVj?=
 =?utf-8?B?emJzR1F1UDV2ZTNESVVlalp5enFPVWVuZERKb0FXUTVROGFsMTdTZGc4eno3?=
 =?utf-8?B?Zy84ZDFxWWxaSmMvbDE3ZHhDbTJTR3g4SEZwV2p2UzlPdmZtR1FlTzRpK2RN?=
 =?utf-8?B?QjY4R01IbnVSN0pieGVqSzY0WlNONWJzeHNlTjBoNFlOOEJUb1MvUytVSERo?=
 =?utf-8?B?d3ZQaFIzRUVuWXkvbmlWL0xiaDhRTWlxeFZkMGlZM3lsTUZXNm5neTE2RGlU?=
 =?utf-8?B?aGtEejcybVhId0hocGxjcUlkQzZldUtDSWtSZTIyeGM5SVNOYVBhaTMvR3hT?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WEnygWEPiICXJOCiTPCI7JW0mxibdoR1nILDnwbVX3HnTPYvdpzughBBWM93becHpRNvzv4xGmOWpVQey2XZ7jDosr880dytUViE3MtnNpRaihdiH0Yb2xuEY3oSgaBqDNHjUW4LO7FmAAzFggQjVQ2WphQuCiPNdUaehV3MeCLZJ+vvmVJUyvkF1VkBAeEHQ6r7ZyIuR0B8YKQYzC+WUZHY646IGHU6qmZg9NG10ZA58qBg6/rHgmDlFzjrxTdkyrsu82oBJ92NCYEW1J0P2vmMqx81E1ti7lTn/a0PfkL+DgzyScnxhCLtQ97cXT1N+OB4JGbADv5TPHjSEsR4uFCmRHTFnMJC25PoMwMb1LGlza+HmsxOk3qdQoTOb38YhrOlbaS7lkb9tFavfr8S+46pIInLUs4dAEwTllPH0udjROl8Ome2cgPWMfrm/F8rHOKcRZze2qZEuiKut6AhGAD2F+J2Gjg5NZUNTawHHPpwKrzh2/4y/NIUf77p1z8NADm2CLF29F5j1VLL2PJ3oksbdlg+K37VGMI25GlLFl+DBqfHwWFf/ASlbWi2w2wU3GNZV2BYB6CqWaQnkhmTKLnXGWt+cGqZnB8hfq4JwHPEbofbIlEyIJ0aWSsXJI0sFO/+giPgJ/4FmEHmvjkaflviqnlA7NPex8pv8+ztDKtbTtWe+VoDjvs7W6aPV/w8yzOdnSES9tHGMX0WzrWuivkDlRprQJwOEmHZ73/wtoD2PsayRQYQMp8iKXbz83HJZsxZs2n5hC5ze9pGbQladUb2gQ16kIC/7nxXpC703rRo6rkHY2OZszWD0UZWPp4D8wg/Z/eAzdHOT/rRDwWamf4TjIuxUkIaJKsQugfQM6PMQfHtDQVz2zKFzUyE3rJ/FM8cIVbohJ1RuULc3SCd02Rp4VXIJ7aFMteNGkWFzoo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f3becc-832d-4d40-18c7-08db1bd59247
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:53:50.1673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lapmLm6WHUdtSzxZd+FACDhztZUSjpii3cFiq7TGUgEeIRBiXU+0D0EPjGZshUsXwH/MThng8iJW2S8BNXq7tJbDsBPlByCqOxSlF3Q3u2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972

On 03/03/2023 10:42 am, Oleksii wrote:
> On Fri, 2023-03-03 at 10:33 +0000, Andrew Cooper wrote:
>> On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>>> diff --git a/xen/arch/riscv/riscv64/head.S
>>> b/xen/arch/riscv/riscv64/head.S
>>> index adf5d6c74a..8887f0cbd4 100644
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -18,6 +19,14 @@ ENTRY(start)
>>>          li      t0, SSTATUS_FS
>>>          csrc    CSR_SSTATUS, t0
>>>  
>>> +        /* Clear the BSS */
>>> +        la      t3, __bss_start
>>> +        la      t4, __bss_end
>>> +.L_clear_bss:
>>> +        REG_S   zero, (t3)
>>> +        add     t3, t3, __SIZEOF_POINTER__
>>> +        bltu    t3, t4, .L_clear_bss
>> Using t3/t4 is fine, but it would also have been fine to use t0/t1.
> Yeah, I understand that. It was easier to rename and not confuse
> something.
>
> Could you please rename them during commit?
> Have I to send new patch version?

No need to send another patch.  TBH, I wasn't intending to change it at
all - this was just supposed to be a note - but I can if you'd prefer.

~Andrew

