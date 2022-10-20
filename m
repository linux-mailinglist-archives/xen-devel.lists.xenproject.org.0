Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD95605B69
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426329.674697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS96-0001Sg-9E; Thu, 20 Oct 2022 09:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426329.674697; Thu, 20 Oct 2022 09:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS96-0001P0-4F; Thu, 20 Oct 2022 09:47:24 +0000
Received: by outflank-mailman (input) for mailman id 426329;
 Thu, 20 Oct 2022 09:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS94-0001OM-7T
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb0b786-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:20 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Thu, 20 Oct
 2022 09:47:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:12 +0000
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
X-Inumbo-ID: 2fb0b786-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=k+2bCajRjmdDUI5qrAEiOOQGkBMftTHfCURovph7k1o=;
  b=LnxzfAGxx1riSzwyFeeHy3USPtqi7xDTZw8jr/BBRqrlXkqmQsG0p+Jg
   TPTygZCZtH9BtyfkpqxnY8Ln+/yHX4atutAo9VHYVz4OKMdI30nP7F4X/
   APgjYJvEaSxNwwEzMavaBGCluIl/UTnri1tAlRe6AI44Ga0me4u7Dq1Rd
   o=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 82251983
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GB87FKt5VlT2QyFHe7keYX5qM+fnVFhfMUV32f8akzHdYApBsoF/q
 tZmKTqPPKrZamChL90gaYXk800FvZbSyIM1SARpqSxkRHxD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPaoT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklE5
 8M/NwofSCuMuPqw/oDkasRQt+A8eZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+Vx36iCdJJfFG+3vBFgn3Q13wJMTw5UlKAs/WhyUGHUc0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 mJlhPvsDD1r9baSEHSU8+7NqSvoYHZFa2gfeSUDUA0JpcH5p50+hQ7OSdAlF7OpitryGnf7x
 DXiQDUCuoj/RPUjj82TlW0rSRr1znQVZmbZPjnqY18=
IronPort-HdrOrdr: A9a23:O0cap6GA4b6rjBAGpLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkloJk29Tpb+CUlpAZxyHsMceg72w
 36CNUYqFg3dL5xUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="82251983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkLc7JC6jujAjdgfgOurSt+BWDRq/Y/fb8lCwrKfBHPNEpLkZADGD/5vfcFlS4KEpTLYuxFLY+DzKv8EFQxw/+akNhIktN4Yo9VMh+WnrIPS7W6CBZb5o5w24Lw6WwpdnYxPtAq2ywRBgkjZtA85Fm+kIwcyW4+akqepCm9YMH3p6cQ2eeJSN8M9lENT/wBnp4TWVcHG1DqWwAubzAzq73bzqmwZFXM/GgXxRx/5T/cTrRbuc35vWiiZsDy7EQUY9qD46ROUe7Kr8uJDJAWt6fN3OUtsM7XFQ1MtLwHzua9UFbhUsmfUsPgtRX6JU+JTjFDR0WQl6DFntWEoYk3D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+XSJ9rQmd5UfBXKliHWuNtxPvSFy2AGFgwTxJdAwX0=;
 b=JnSgcLVh1Q2d4kzwxlN6yMfOxkkEpP6bvdkPJSMWEby3y4fhlCLcfDP0Eo5ZKP2CrfXLRK9aQVrh/+X0RpMAN27BzKN2uAEbNxjcUC7+UAyE72+m1eLTJUyjWHE3o36mJt9qbFNv6xxzLtPIHc+GsEpkyJcx4vACZ2vs0lbqv0afy6KW8tI2CuK0eTyRb7t4tZPEXGcXNwFqGh4QaaB7lpRHsT9AvONJZshSsxhV/6c8C73UgIbhJt5S5aWmX7abEv4BSjt5NbMJt7GOmhJQY4I02/8XQ/YWEo3KZ4sFqantzAcd+b+5Wm5Fb9OBFSnfso+w6vdpPxzFDI2K5wgxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+XSJ9rQmd5UfBXKliHWuNtxPvSFy2AGFgwTxJdAwX0=;
 b=VuJ9L4nEyskamt3uqgjoeN/6kAVKzENa+5G8PcixXa5LT0PPULI+wn8L6tVuo3iZYruznxFg3iOkQQz56bYMvnC1Rs9qDdIgMZ3d54vw6b/A3JFLUZhXTCVZ6Qn1rFrdYeHX0dG7qtZ51urOoe5a6U8FRlbII0t9vRQYhXta0Mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.17 1/6] test/vpci: add dummy cfcheck define
Date: Thu, 20 Oct 2022 11:46:44 +0200
Message-Id: <20221020094649.28667-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0048.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::36)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 5094f796-e799-4b1f-b0c4-08dab2801041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fWyr9+hYLYclK/mh5Crgy7OsQP9xMVHe3gV2guGn8GaAXgheKq8rB2tChqqn2IkC3RZI86PLG5WOOV9Cl7Ge9KR1pCA5CGo48RjkpVv6BjbpHRZlBKENeGroaI4vzkdR4afinJn/gWJko7fAcwS1zpBjNIM/7VvbngkThNxGomJYCy62L3vCQrRHds36NxI1i2vA+yFAZrFW3DV4PdIdg8DXRoUn+mGrSLbV46AVh/x8SHKhpou5djLm/eQPcgNA07puUJ0ZNcV3KEyh1hT7U7bupserpT8dK91jRPkPbQednhITIVhyT3rx7mGh3Y57BDBIlQuy/Q8HLGW7ZgjAVP1ArrgTYDsEpNtVkw/HfbX3iOIQlrrEm3+c7CEf/3rRArIVQ4aERKSTf/nJy6aXtFPNVnrnA907kDS3NF5hI//Zw7yN0iXpBTrFqGCsILHyGHNKqNUnzqOJX6spO5JcMNOs5NKhGx52epGKuGSocjrg+EWFOD2BZBScnCHNSRzTGUb93ZYO4P1q9Ha5uYbshMolSdW5q9Pb39iJAKU7MzWEmRB+1TinXoR2AVBzROHr0gc6hmiT34l3/6+Z2QMfM1mW2Xj3JgMBwdFbM+Ua3LwQEBTwF47bZNs1gHZ28PCZT2pFb31ZAUmmYuNjNvcDc18hWOzxGqXxiwHE+d/mPEbciUhqs3ImV0zbNnmcDOuoKInSusv56DhFWAgXchOJ8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(316002)(54906003)(6916009)(6506007)(186003)(36756003)(2906002)(41300700001)(1076003)(2616005)(4744005)(6512007)(5660300002)(83380400001)(8936002)(26005)(6666004)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(107886003)(38100700002)(82960400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3I4anpsMVZDVlh2YTJFU0FJZlhtbzNPanZ2NUdRNHdwZjVVOEJtZkh5VTlM?=
 =?utf-8?B?VUdJMmN2NmtRck1mUmdyNDNLSjFKdWQ4dTBJZExRZTRMS1MwYlo3MlhrQ1ZT?=
 =?utf-8?B?NUlWczdncXYzcXhiZmJhU1AwQlFzOEVVaWFJbnBmdTZWSnNVbkhLTlc4amNV?=
 =?utf-8?B?WEpZK1FiVytUY3FIS3QvRk1lempsd1hqOHVRbW9nNlZCU3k3Ykc0eThZR2Y0?=
 =?utf-8?B?ekZYblkxMW9vU3F4bXJwNGo0VnAzc0pRYjdTdmkxbWJuMzViNUdDZGZxU1U0?=
 =?utf-8?B?Qng2YnRKd2pwd2NVTjVYNWhLdkdBeWYxZnNEdHN3M1lKUlpUQTROUzJnTUpD?=
 =?utf-8?B?THVVM2xnOWhZS0JFQnJNbWgvem1WVVJUeWtWTVZ2dk1Qa3hNU1hmOU9HTHBS?=
 =?utf-8?B?d1RZdFpNVG4xWEtMcW9iMHYwaktDUVdxV2xFdDQvTDZEOXRmRk02ZnJIZ0Q2?=
 =?utf-8?B?R3lQZlZZb2cwMlVGR1pvMVRBeFBLVmUvbkRhaWdKOFhybXNjNG91V0xlQkhy?=
 =?utf-8?B?N0ppNzRleitPdkNPYXQxUGp0OFpWaDBQa1M0QXNjL1FHdWxBR0hHRDI4NXZF?=
 =?utf-8?B?eUpQM2U4WUI3THlJSUU3NEk4elk0NEViL0dhWFVybHFiZ1pndGpUK0J2U21D?=
 =?utf-8?B?SVhackxOU2YxdXo3MjhRNXo3SENFTzRxNjV6S2J5amFFMmQ5SGw2Q0ROV205?=
 =?utf-8?B?SmMrYXh3RlhveWJ3a29OSjNrckR4clQ4cDM0STZLQ2c0RUVoZ3NoOE5neFhk?=
 =?utf-8?B?NE8wTHZaRWMzcVk0ZEIrSmRmUURqclJCZlhJY3d3dHNFQzdWMEVrR09yYnlj?=
 =?utf-8?B?YjVkRW9DWHZJWXhNWW5EN2NkOG5Rd0M5M25oNEJRb0pSdDJadEdRZkRlZzh1?=
 =?utf-8?B?Z1JQeUQ3a2Q3VkhXSVVkVDc3a25hdEpOZXVGK1N3TUZWSWR6ZE9UY3JUY05G?=
 =?utf-8?B?YXRaMEd1UHRXWlhWYTNHaWpIc3V1clEzekRDOXNXRG8ySWRKNW95c3JQQnkz?=
 =?utf-8?B?TC9qa3AxNkY5UVA5TDhNUVZobU9Uek5uUkJ5Z013SU1ONFRPZkZlSXlySFdp?=
 =?utf-8?B?L3dzRkFmTFRzbjJVNEJ6WGtId2YxVEt3NFFxbWhBMHR6bW42djgxUWlXTDBG?=
 =?utf-8?B?YzNQYmx4MnpEeDJsaFZUOWVjeUptNS9jWWFPTURDak4yRmdvSkZIbk02K2VC?=
 =?utf-8?B?cy9CamlBdlYvMVY0RStpaFMyU1AreG9vNWIwRHY1Q09wUnRlM2F2bXp1aUI0?=
 =?utf-8?B?eEhzZzFsNWlZZWNodzFUenJiaytZOGNwbmV0MVRzYXp5Z0lNMWxDaTJ1L2R5?=
 =?utf-8?B?N1RhaGhST2dUQndKdnpkTGxML0NpT2NJRmpma3R1dTErUUVreVNTZGxuMlFI?=
 =?utf-8?B?MUh3Skl4ZlU3eUYrWlIwVDduMWg3THdNSk1ucWZXK2QvNGZsK2ZXbS9RNzcr?=
 =?utf-8?B?UWhVRUJVTndzcVNmTllwalo1Ulk0YWZYZW5TOURoYjlTTVB5VXpqNEtaR1hM?=
 =?utf-8?B?MWtkbk9HaG5ERkw2UzR6Yi9Pa0pnVi9oNWZCWkE2VDhEVG9NUVZIczNUZ0pi?=
 =?utf-8?B?eEU4Rk8wdWxZc3hQL0w2N2kzVDlxbWlJRjRvNnFMWjYvMERKbzBpS0Y4bGRG?=
 =?utf-8?B?RThDSEwzTlhoVVVnRVFmazMzOU14bVBlejJiSmN5Nkg5NFdVT3dXMFU1c0lX?=
 =?utf-8?B?L1l4N2Z0RXA5TWtyRlBCY3liOFNYQmZ6NWVUdFpHUUV6VjdVUGNRa0NGT09o?=
 =?utf-8?B?QkFRVDRWZWRzRjFwT2RWcmNDOWVJamxyUWNra3dXNVRPc1k5Q0tTRHR5ck5n?=
 =?utf-8?B?ajhtdVJPSXBHRzRUY24zbXZVY1oxKzFVdkYxTHBsTHVlZU1aVEQzNzdPL1kz?=
 =?utf-8?B?YWJVQnhGNkdZSkZJdGxuQnNjL256VnlTVC9UL0t3MUo0OVFSUUxiSWVxdlph?=
 =?utf-8?B?UndIbkdUL1FhQ0x0L1E2blROT1lmY3dUM1lHUkU4ZnloeEgraGFqMEttYjYz?=
 =?utf-8?B?ZFBZRitpck9yOHhQY201QnN1d0Z3VUFRSHAvblZPVzVaN1NKY2VCSmdVZHRW?=
 =?utf-8?B?ck1YeWNBUnBjaWpCL0VHaWN5Sm0zb05Valg0SXB3QU5zbXBRVjF3T2Roa0hw?=
 =?utf-8?Q?E/XUJNah1rAeUAjq49/hip0AH?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5094f796-e799-4b1f-b0c4-08dab2801041
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:12.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNrWa3syDppKynSHPDi47cp01up5rWLVhFwbjZtfjn7QmYftG07CeO4dzE4GYvYLjC5k+qyU4TVHt7NvtB5hIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Some vpci functions got the cfcheck attribute added, but that's not
defined in the user-space test harness, so add a dummy define in order
for the harness to build.

Fixes: 4ed7d5525f ('xen/vpci: CFI hardening')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/vpci/emul.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index 2e1d3057c9..386b15eb86 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -37,6 +37,7 @@
 #define prefetch(x) __builtin_prefetch(x)
 #define ASSERT(x) assert(x)
 #define __must_check __attribute__((__warn_unused_result__))
+#define cf_check
 
 #include "list.h"
 
-- 
2.37.3


