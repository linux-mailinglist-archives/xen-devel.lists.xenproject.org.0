Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3BE78C788
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592327.925019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazid-0007ZX-9Z; Tue, 29 Aug 2023 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592327.925019; Tue, 29 Aug 2023 14:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazid-0007XM-6q; Tue, 29 Aug 2023 14:29:23 +0000
Received: by outflank-mailman (input) for mailman id 592327;
 Tue, 29 Aug 2023 14:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qazic-0007XG-2Z
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:29:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f20a5f3-4678-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:29:18 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Aug 2023 10:29:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7532.namprd03.prod.outlook.com (2603:10b6:a03:28d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:29:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:29:05 +0000
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
X-Inumbo-ID: 6f20a5f3-4678-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693319359;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NHV+QcFnl/i2d5dJxxj+Qo2vNf5F8IvIvinj5zuuet4=;
  b=LkJJWN4dO1MxQZHjbEVnFuPIZZ3YiEOMmrTzFDUOqKesfg7CF0nK2ik8
   Gzpn3FspclbQIgwb8OIi8Whfa4UeT9pcDXISUbKCxpdj8cbt38Fyb3Ji6
   jpoLyMIkgoxQL+2ddn9lMjiwEOaqLykhJ2NLrisr9XWX4mTNWqxwJrYC+
   8=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 123691352
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Tc7+Z6w8gkcLgTsuVmV6t+fzxyrEfRIJ4+MujC+fZmUNrF6WrkUHz
 mIWXGmHOavYYmD2KN9+bNy/8EIP7cXVzYc3TQpk+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRuP6ET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVNlr
 uI/Bj9QVDmg3cOs4quqZMJtqst2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAtlMReTjq6QCbFu71C9NUQ8KBFKAgMKCpFThC+5AG
 10U9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L84QefAWhCTTdHZ5olruc5QDUr0
 hmCmNaBLSNrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG0ygusVhMtSj6Gjpwmf3nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalG43hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:VjYYYK8OE0XbjChri8xuk+HJdr1zdoMgy1knxilNoENuA6ulfp
 GV7ZAmPEHP+VMssSkb6KW90KnpewKgyXcH2/hkAV7CZnighILMFusSi7cKrAeQahEWmtQtrp
 uINpIOeuEYbmIKy/oSgjPIY+rIqePvmMvE6YixrhcdLnAJGtgQlzuRSDzrYXGeLzM2eabRYa
 DsmPav0ADQBkj/AP7LfEXsg4D41on2fMuMW29UdkwawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/stmgoyWsjlP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01muey81wn+e
 O8+yvIfv4DsE85TFvF/CcF6DOQjArGLEWSlmNwtEGT+/ARgghKVfapy7gpIycxoHBQy+2UmJ
 g7qV5x8aAnXS8oWB6NsuQhW3xR5wOJiGtnnugJg3NFV4wCLLdXsIwE5UtQVIwNBSTg9ekcYa
 tT5eznlbZrmGmhHjPkl3gqxMbpVHIpBRuCSlUDvMvQ0zU+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TjWle2OJDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiJ8/go
 7IXl9UvXM7P0juFcqN1ptW9Q2lehT5YR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5+4SB8XKMs
 zDea6+w8WTY1fGCMJMxUnxXYNSbXMZS9YYv94nW1SI5sLHQ7ea/NAzXMyja4YFSwxUF18XKk
 FzEATbNYFF9FmsX3/zkBDeV3TxE3aPta5NLA==
X-Talos-CUID: =?us-ascii?q?9a23=3AMzjZrmmSFst7/BpI0+Hd2duE1vHXOU/2l2n3DUD?=
 =?us-ascii?q?lM09KEpyPa0aB1ohlv8U7zg=3D=3D?=
X-Talos-MUID: 9a23:SXKdJwS+8qweNHtyRXT+x287Jts56p+PM3sji8pWh9a0JCx/bmI=
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="123691352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfwgoXWHYmJW+Hz7qA1C8M5OO597ioMruxC8y5C8yBv9s2Dz4o001LtoC+0/aFkmCD+WipJvzB5IFYW9ibj21xKRDn17en+ba4wcwTwhbhGlexa5sctN75aXSUUfeuy6LRvAHjkdOkk/l4YMnD6QOd0e4PswDLehbYp7gW5PgHYwolH0DSgUs3OtvaqyU6SZoGUw5w1WuKcPJNG7Rxktwu2aCcI4sjdr8UP38REOPhe974L80uUoZISRouRkYPOt2KaEePCNXYNLZxJIjqdsC8baXH58rUHwFhjlVZxaFArn1zGNxido/1FfZsWLwx0hD9Zfg6tjJdbe6oNBW/kw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlqwqB5UNIVZrHrLU3SLnKJW6X8bzQTKZy8XVqMNzNs=;
 b=h002BgSl26ZPJCVJXerepkRCnETbNxQxnKNLOkqtBCZtnhTNWbvvrrVUO4ZFXQ+7rAv5fwUIbEH2BT7B1CHMxlagO1yMT9zISAgRGSt1gWDfnkTbMjV/q4tDx8XkMVktPogG704DIkUP9j60FQZHy0NVX/hVnZt4pSpER3+KL5TWLGsVwNWm958Mgr+9fNxLXwTN1AcS7//r6vGcI8BEfhjXUfwDZO6eYYZXUPzO4IjS58tT7eKH8wqdjWEAadWhQHB4FjhohFWXBGK8/488uP0hjX6/nofJNDjyofIxN7dxaN00PyDHnlpTSKmwlfiFzSwlfWeVNvv5m7cSbLpNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlqwqB5UNIVZrHrLU3SLnKJW6X8bzQTKZy8XVqMNzNs=;
 b=SjZH1gwTuup6LevSbO/snZnB0w3fw42wa5CFPWSqEH0WOaJ3irryJv+B3LLzd69M9BfhCRZXh2sJcmalh0NZ8z3J2XZW3FxCz6ULFoX9PPpFpoemhuRWYOjNrY3L8VEEOdgQKnJ01S9B04nGmY0EfO0FPEWSZMGqytuxGmmmwqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <339df064-0ee7-2b2b-ba73-4528cc2b0b00@citrix.com>
Date: Tue, 29 Aug 2023 15:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86: Fix calculation of %dr6/dr7 reserved bits
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-4-andrew.cooper3@citrix.com>
 <f5e258e1-5517-2276-6497-4288192cfeaa@suse.com>
In-Reply-To: <f5e258e1-5517-2276-6497-4288192cfeaa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec65935-230c-4a74-b0b1-08dba89c4c76
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5XYrNjpBqKs+GCG/6IaBV1PmO3Rhz9KV3SM5wSyRx8DbkSEZnk5/lEojfkXF7KoJFuBVsS4anhwFOnN+/4AL3YzLaa67Le+ZbfVW3hnGrYkb8KmK315ZrUBfIGljtEy5bDiGhloh1RpxpEcEL5yTwGs7TLRnjIoJErdpm9A02g4R+Qk0qfzkrTY1LZ7fxK74afoUgL+9VSDKCiJLZ5i7OaWL1ZcqxMJH1gRZ52CV/Nb/E4W4g8E8eOi9zmGy3PJpxNWiMERmvueP8cm7kg7+I1jFcyfqDOlWA8aV3uR2C3OsGUD4yDuVcbDO2x3ArHL6OKi9cPJ2PIcb6teNr9bRhqvfYEd4pmYiKOzdcGyINxOJ5TuxXC5+pMvIJeMR/YIPyQG7s3Gd8kxowHLa7ikCZeMFU7UvWUmt7fp31YAQSFnFSSOA2ZaN5yAnqVxFA8R3sDq0To8YBvVR24YfqvDpoUaW62kxl56H4XebKFroorMfe0Ny/bK72sSHS9cfFY2mRZVFtf3hVTFnVzNky4gY+5fvlw9NKBSwV/842H+ZX3nKFFGGyXzOPbLj7ERNB42iAwqtWgs54bHBHQbre51ll0vPawNWEIxnjMVP2l7u1zqTHNgOttxhWIbmwmtFrsQL5aC8hjL7YRwdyvpH/Ce0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(6916009)(66899024)(41300700001)(82960400001)(4326008)(2906002)(83380400001)(31696002)(86362001)(2616005)(26005)(36756003)(5660300002)(8676002)(8936002)(6666004)(6506007)(6486002)(66556008)(66476007)(54906003)(53546011)(66946007)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3JRY05MS0ROYjNZWkV3MkpxMHk0Y20xTVJDR2FNUEx3eWl0NVhrakYzU1k5?=
 =?utf-8?B?d0h2cTdyZ2Z3RzNpWXZ1QnhFN2R2Um9KVU1KdHd4Z2lZSWRlRnNoMXdvY09Y?=
 =?utf-8?B?Y1oxR2ZWa01kL1N2VlBIYmQ1V3lPaW01NjlkQlVMa2J0eUZpelkxWEUreDJH?=
 =?utf-8?B?dm1YVnIzM2NWUHJNS2ZLTXRCcVdBcG40VmFWdFVleDBzWHlBMU95TnlUbldE?=
 =?utf-8?B?Nmt2U1pDbk53ZXdkaERZNWtxMWR6cnMvVk5EeHJUSFIwMm04Uk9SZWJtbEhx?=
 =?utf-8?B?ajRPSXM0M3BaQWFkc0tIWDRRVlRxNWUwMlpFQU4wSU1tV3pRcWZ4VDJveGcv?=
 =?utf-8?B?NVpXTUptNXBzRG8vQ3VDQU1BemFUZ1FCK0dIN1V3Y0hsNzJBN0pBWmN4M1Bh?=
 =?utf-8?B?UTdQRzZ4WVNVWnhkS0R1WkRTb3Y0Ukp3K1dramRhZ1NiUWcxbWo0Znd6TzFH?=
 =?utf-8?B?VkdldFJhSFhHbjNjbmJzcjFVaG12U091THFhNGhITUNyaHFDZ0hKWUIzSDFt?=
 =?utf-8?B?SWZKOWNqQnZRQ1NrTGpSK3NIZG9YUEVtaDRTQTRPWCtHZCtBY1owVmNyRDBt?=
 =?utf-8?B?MjFmR2VhVWNDbUdEQTFab2E1WVNTc0tHWG95eTgvaVBJa0lkUkViUWFSSzBD?=
 =?utf-8?B?TytCdUdmSnBNNm1jZ2twVGZ6aHpiaStsWUx3dXhnR2NuZExkQ01PV25Ib3FL?=
 =?utf-8?B?UXlGRUQzT3hzOGwxaFJSYmZGSm52RXJxRmVicnhDdUYva2w0YjVLdHVUOERk?=
 =?utf-8?B?WGhaL042YTlLSWxrNmNPWnZ1ODhUT21RcjVaQndoQU1wMkx3VlF4U2tIRk1O?=
 =?utf-8?B?ZkYvSmEvOXB4NUdYYzM3SFVQSkFYS2lSQ0s3NUlyb2pSeVBNNTlkWE5BM0hL?=
 =?utf-8?B?dC9hRHV6VTZySDZQK2xXWnpoMGdpdXBZcHFiMGJBRlFRNTRBdzFZaTRpNGpK?=
 =?utf-8?B?TkJQY2E3dWUrSXlab1pnZmdhTHFGdHlZTHVLVFBXVGgyNVA3bjcvdkRZOENU?=
 =?utf-8?B?K3hINWdaaHBjT0o2RGJZSEZad296VTZRbXg3YjZEY2UrRjRCMXR0RjBqWjFv?=
 =?utf-8?B?aE5SeXNVSDk4UzJjSW5vVjhDU0VyNjN2aDdVTEs4VTYzN015U2RGaEsrMWJ4?=
 =?utf-8?B?WlJaQ29nUXc5bUw4Y3BDeU1nbDhCTzVxRHUyZkhNelNuRHdYd0pWNmdyRmdM?=
 =?utf-8?B?WEQvRUNBTE1naXJpdEk4Ym0zcGs5cVllR0lsY0hUbEFkMHpXNmlGVWxkbUlw?=
 =?utf-8?B?dk55SE9uU3ZJREhnVEdkTWU5VWRRaVZ6R0VYZStRS0tCZ0FXUWdlcXhXcjRh?=
 =?utf-8?B?ME83Vk1LSitWSXRvNloxZUUxRkpoSTRHdlNvSzI2TnJDYktEQ2h2aFFSejVS?=
 =?utf-8?B?Z0NBRTBvcnl6Qk1uekdJVExqcU9FZndSWEhrU3E2TGRid3NqOVI3UkhZemJ4?=
 =?utf-8?B?ZVl6Y0syQTUyVGJwQURveDdDS215RGxRT1ZyS0x3cld5TmJJRzBCUEM4YlVS?=
 =?utf-8?B?VXRQcDFKVG5SaTRJQnZGVzl5WElMTlFYcnE2am1HK1g2TU5Ub1U3SkVRcEdy?=
 =?utf-8?B?S09KaWxTM00xeTVmWDh3dkg0MWdEYUdQR2V6cFFvR1dQTjBsNHhLMVdibnNz?=
 =?utf-8?B?L3VlOTdhZkVuYU8rZ2dUREVjd0xHU3gxczJvVlBMa0Q0R3p6eWtXQlMyYVdC?=
 =?utf-8?B?dXhNcldFWHAwQ1JmckNPR1BSWkpIazk2WFNHWE9SQWR3S2lwMnJqWmxVbkt1?=
 =?utf-8?B?VHczMmF5aWxDNWVpMEtscXhMRTlmTU91MVNPUTdmTkpZVVNDM0hGcElrODBk?=
 =?utf-8?B?S0I3SVBQVmYzaVRwYSt2ZmF2bXBIUjJweHZqTXJkVk5QODFWV3hDQnlPb1E0?=
 =?utf-8?B?cFpHN0pPR3g3UDFrZTFVejYvQ3hpc3hrUlBxMnVEZGF3aU1NRXFoUkNJSnpP?=
 =?utf-8?B?dWtmNjM1STZnTVlFM3VZVTFVeFhhcHE4SHhZaE1mUS9CYXRyd3ZFdzVzajVR?=
 =?utf-8?B?UzdwcHhlbUVWK0FwUVFVcGV0QmNHNXlqaVh0MlBOSnRzbGZkc0JCZVM1bmc1?=
 =?utf-8?B?YmYxdjRlRFVWQlZaWW4yZVZVUXFwd1Q1UkVzVlVJblVqLzZOTTB3MWRqUXMw?=
 =?utf-8?B?M0pPbkRZSUpXK2Q3YnZ1dy9ET0VqVkJ6a2Q4Z2tPNWdsUTlRenJKNnF0UkRD?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u6nK723i3xYpGxZNV9DFIaqfuqtH3d2wxuZKLXY3XulRhM1KvnY7GDcHqgJeRwwULM4oyl6p+6phqma0g26wkAusxvk2JuwKwZw+KOmCmQhKkiDzGRt3xW5jxvzVB/udZHtJUVg2DKBc4BtasBQw53ED+6BoXltsy3u9uX30Ta2tQEnx5XhDAlqzGjKC2OSTJYJF/vO/eNn3RMfXjztf2SnUGN0H3WK4RfeH5KMeAO59YR3gJos4wepIqltsBHlcaqN8qVbEuIUg8+Bsev/TovrCspgmw3rdsMduIlwHtVF5TySdlmeDIPEAQtKcPwrv96c7BzP6ispaK9XCHymcahAIkO/09cARDzFbP03qhZ3wDRPrFOhyklpcj0EjVW/rpYlnalLnhtB/jsAoADItem03HjIUQm/tCkpStq4gXJ+xWFkJBW47UgrLTMM9/l/rLbbGQ2y9jYpeSLF/fXsDUMqrVYUEGVy1gsknb10VZrMsWbj9ynR3YkHFJep60aEP/lyTLzg+kSAw8uYG6ifuJ+REYJDkbb4UlyEsx8gVzQeBweKExBnWlIQVBlQMY0YKMEfkQ/lGu1NVOaZgp+WCbenqz08TOL3fd3P+Mb5TyvMCihLzuAj2OdLS93UWPSWIprOQEUKbhFKmDicKO079tEVSL1jddO22PLE+b+HBTkUBOkdFm1XFuOTSHGaDDHT3W2MWP5NlVmdrwd2O8v0eu/YY8qhW1OzefK9RX8nAwyqud875tCKUq0jOQaT3swmlupS8XipkNVv0/fAx5DgI4G+RHxfLpKHfcFNv4qKdW4MsWX5n8IPB6iB4rbPLbsW+UhLpsOL+wpMATdLKGokKsslAhUytLoIxMYk4OKVe5hA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec65935-230c-4a74-b0b1-08dba89c4c76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:29:05.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YM9Ey9THPbj3pUTI/FF9ethxk4FOWjeLF3tZq47qAaIGc4JxGKVWvkI3r5gvRwqXouTWikxA7oKqviaVI8g0Xcg43zidVqAy3EMDoi2SACo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7532

On 29/08/2023 3:21 pm, Jan Beulich wrote:
> On 29.08.2023 15:43, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/debugreg.h
>> +++ b/xen/arch/x86/include/asm/debugreg.h
>> @@ -1,6 +1,7 @@
>>  #ifndef _X86_DEBUGREG_H
>>  #define _X86_DEBUGREG_H
>>  
>> +#include <asm/x86-defns.h>
>>  
>>  /* Indicate the register numbers for a number of the specific
>>     debug registers.  Registers 0-3 contain the addresses we wish to trap on */
>> @@ -21,7 +22,6 @@
>>  #define DR_STEP         (0x4000)        /* single-step */
>>  #define DR_SWITCH       (0x8000)        /* task switch */
>>  #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
>> -#define DR_STATUS_RESERVED_ZERO (~0xffffefffUL) /* Reserved, read as zero */
> As you're dropping constants from here, how about the others? Especially
> DR_NOT_RTM would be nice to go away as well (I don't really like its name),
> yet DR_SWITCH looks to also be unused.

That's dealt with later in the series.  None of these DR_* constants
survive, but I think it's better to leave deleting them to the patch
that converts all.

>
>> --- a/xen/arch/x86/include/asm/x86-defns.h
>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>> @@ -102,13 +102,30 @@
>>  
>>  /*
>>   * Debug status flags in DR6.
>> + *
>> + * For backwards compatibility, status flags which overlap with
>> + * X86_DR6_DEFAULT have inverted polarity.
>>   */
>> -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
>> +#define X86_DR6_B0              (_AC(1, UL) <<  0)   /* Breakpoint 0                */
>> +#define X86_DR6_B1              (_AC(1, UL) <<  1)   /* Breakpoint 1                */
>> +#define X86_DR6_B2              (_AC(1, UL) <<  2)   /* Breakpoint 2                */
>> +#define X86_DR6_B3              (_AC(1, UL) <<  3)   /* Breakpoint 3                */
>> +#define X86_DR6_BLD             (_AC(1, UL) << 11)   /* BusLock detect (INV)        */
>> +#define X86_DR6_BD              (_AC(1, UL) << 13)   /* %dr access                  */
>> +#define X86_DR6_BS              (_AC(1, UL) << 14)   /* Single step                 */
>> +#define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
>> +#define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
>> +
>> +#define X86_DR6_ZEROS           _AC(0x00010000, UL)  /* %dr6 bits forced to 0       */
> 0x00001000?

Bah yes - serves me right for a last minute refactor.

~Andrew

