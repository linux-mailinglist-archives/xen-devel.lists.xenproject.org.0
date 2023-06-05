Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5982272219B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543570.848657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q662k-0005kz-3z; Mon, 05 Jun 2023 08:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543570.848657; Mon, 05 Jun 2023 08:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q662k-0005i1-14; Mon, 05 Jun 2023 08:58:26 +0000
Received: by outflank-mailman (input) for mailman id 543570;
 Mon, 05 Jun 2023 08:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q662i-0005hv-MN
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:58:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e58f301-037f-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 10:58:21 +0200 (CEST)
Received: from mail-bn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 04:58:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5299.namprd03.prod.outlook.com (2603:10b6:a03:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 08:58:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 08:58:12 +0000
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
X-Inumbo-ID: 1e58f301-037f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685955501;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rXphWBvyhf2VA51/Ok1tzgpc/JNxdWkKYBx6VcdeoDw=;
  b=Be2ZiKObqdcLgrbZKuEwiVRgduRsslxVo2nqb1wNQIHUi8yAus6x19TO
   S29llgBxoRSirznhVXHxf+GFsEuBwrxmYdlN4FgscnbJ/pAas1oWnHXaA
   FHfzGIkNqpBMwoIqPAqK1FJ+DNV0KnckSUeBaX4CgMCCeZqP8Widf7RjX
   w=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 110349328
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2niu+KgJ3fpHFdV4YG8Q8wohX161pBEKZh0ujC45NGQN5FlHY01je
 htvW27UPqyMNzTxKIokO4/i8kgEuMSHz4NnSVBo+ywzFXwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0MQwuYCqegN672e78StdWo9gofer0adZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluS3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeXjqq8x2g37Kmo7Nj8xdlmHpPqCrGGlQvtRK
 xMP5nQSlP1nnKCsZpynN/Gim1aeuRQRQcZXVecz5weE0KP86RuWHWUCQXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqfjMJQwID5J/4vIg5gxbLT9BiOKewgpv+HjSY/
 tyRhC03hrFWh8hS0ay+pQrDm2j0+sKPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:0OjkD6y+6dbdiNhkXGr0KrPxSugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Sc+9qADnhPpICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtrZ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg5QpGlRGt5dBmxCe2Om+yNNNW577NYCZf
 ihDp0tnUvdRZ1bVLXzOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyMZ3BjEwhubCQrgKdKZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:np9lZW7eFDz7WqmeDdss2FcoOc4fb3rhwW6MZE+GM0N1Q+y2VgrF
X-Talos-MUID: 9a23:Q6uJLQYZshOrA+BTiR3LpzNeMcRTxYu1EWkDkcodp5e4DHkl
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110349328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgBhvtaKmctLyM7p4SWg76MUKuf7gyFoXTSYozrm8h7o6XgB5dzbIg5A5GXOzsphjBOcR2OBAW/iK7qndIBPWHk0UL2NFA3BsMKzBVjQwVLheNJEBwzLqJwXwfk+bZUc8uz9i5f5RTLf6Wz5E1PFw6vTvHxaSqnhhelGT5iBnj28DybDIVIKjUpAWbi0xZqOmoawjsmzF8TBpFYoQ94B3sATYvstj87X6Zy2rjAkhysX+ZQF4PN3QH+ON9eG/z4I1oAXONJAohD+HYvFdCkowXxBXU1OkRLm41SKNlzX+OGQWPXqzt3prvFiOoeoqd0zyiPQkoPVnHSjDBgJHWzNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXphWBvyhf2VA51/Ok1tzgpc/JNxdWkKYBx6VcdeoDw=;
 b=R/AnkLNtvVXBon9fKWp6149X6/zguN9E14ipMbqpawSvWi9PFO//3tpE3qfJXZqcbTz/xBGE1qenKtyjpKqhRZ5l660E2bCn0yFUZPBogs8Pcduoq008omremEwHJCZlacogRrhP/b94kB7PU6YX/xRTS3DRoZQdh+ION2hmF9MWWTpmPyFHBkdC94QKFMSHpI8PmGEP8wTwhg7QC3TJDB4p9NBv8k0nwTESe9EwK+Sc4ietzKDWutHMBk9srQtCOPfy5iX1lAGfgoPfEPl5v1/L5s64u++FZqbzK9atOrjkLfHWg7oUQQpNwrAjVeLlF9gbOzz7r/ILHXgf9ROSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXphWBvyhf2VA51/Ok1tzgpc/JNxdWkKYBx6VcdeoDw=;
 b=i4xrI/w+4uQ5T57CXH+0oS3RGUVXx2c4LMkYoj8uFTgEyVTFDkJjvh5K7PjvmZ8ZcT5vtpXYVOdcBfNdwkzU8xU6SlOwJvNHi3C1zvzkV1kx26hVU01Ieq+jSTT5+zC/MgSP12gpqUVV1zSqHjB6zW472xdIQJsXAbDhka01ccU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <def81409-a328-7b13-8dc9-a791d8328d39@citrix.com>
Date: Mon, 5 Jun 2023 09:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-GB
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0554.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aeda25-b747-4546-1bcc-08db65a2fd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JdNsARseAubBEumYXDkmPt0GmZBcJEKkoWDwVO3n/QPmG0w3lJE8gU1AYX1OwXAjqQMSQ86BY34KkFtETWf0kbx2TANAiyJg8UamQBClL9gbgM6rICQmYfDM8KCx7CfABJIqm/iA0kKKVsq9tiEF45M/6ph5z4PoV4bnhl69fvTEZ+RQRAA7Qsh+HFpzn5QeIobDe5fSe/qXDz4OZtGi7XRgY3cYR19UnQKDBVrlRWx79EYJ8LikrVnMTjuZKB7kVaDPUzTL+wIvuG4bQOTXqO/zdCgjjXN1PH8wj/I7sBYInHXQkzdp8g4iW7swKer7tNo31xpH4p3rA51YtqP+nQE3kF2dRDK3ox7yfUVoV65kcSencqdgk+QKGonvRUiDqO9+z2oQ2sUXb79xVgKU3wXKUCUS7dyPAedEX2Aa7aGfHKelEW5U/ADtZ7H2XOQwv35pMh11GdcoGz2AyaSbRmOvAzKc2FO4DOTEORTg5ntjxdtYKjfIOX+AqrJG2XWDX03Db17KZlRgH0mgW7ldK0YDhPhbUaxhCqORUXVtxPCbrGRHSwb6m/juUeKRMJeQhGDFLY71uJPMjYbdwd7ZS5U2VKF6z+x8vglXdEHmt3JYuqjc++G2BVEMRR3LGAjpbwXMcMFo/PNRZEhXEfE2TA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(26005)(110136005)(66476007)(66556008)(66946007)(4326008)(38100700002)(82960400001)(478600001)(6486002)(2616005)(6666004)(2906002)(4744005)(53546011)(36756003)(6506007)(6512007)(41300700001)(316002)(8676002)(8936002)(186003)(5660300002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNid0owSXViQTFOand3S2RkS09pRW5yNEJzekxsMGtJODhXMTBSS1E3Tkhk?=
 =?utf-8?B?eE1ieUJ1VVhBS25yajFRc1E0Wm1YWE1KRU94b1lTNTdFZVN6MmJlanJqMXl0?=
 =?utf-8?B?NzFGa2d5dXRmRm4raEtIZVVOWUFycEJUc1VyUUxIM3VZUldEaXJWWFZ3NXQr?=
 =?utf-8?B?bDdXcXR4K2tGdVIxTkVEakxIZ3UyNW1wRDIrSFZ5NmRjN3M3UkF1bHhzZlZt?=
 =?utf-8?B?MllsdlA4a3ZQdGRiVTBGWGR3VGJ6dHVhSUFpUG9MTnpZaFY2dUxJejdRNGZV?=
 =?utf-8?B?SzJQRVg5NXd4U3E2ZVhMOVhvQzBDb1VLeW94NzUwUUF3Smh4V2pOd0lUaFdn?=
 =?utf-8?B?Snd6QWdONzBVY2Fzb2VSMHNtazlaZEkxWlRFcEtJOFJ5bU5NVFBwM2hpMTd0?=
 =?utf-8?B?TDlpUW02UTloaWpoTjE1ZlZkbHpjT2ZwMEpVS1AralNVNW5CbktYbjVpWmU5?=
 =?utf-8?B?Rmo5ZW9IOGxIdm1RaWhzUXRQdXhBenQ5Q3htWVVOZVVIYjZnYUFNVzB5a0Jy?=
 =?utf-8?B?MW92N2dkNmRwalZDS1p0bVEvTms3bXZ2cFV2MVZDZUhNRzl3RFdyMUdCWmtH?=
 =?utf-8?B?QytJMmFwNEFmQlQ0MFpNRlZmc3hkMVUrNnhaMVpwR3dxZWlZRHZBUGlnNE9w?=
 =?utf-8?B?aHpaQVZqQmZpMmFhTXlDaWZwV08wTmpPYnBJSGVSUm1SMGpNaDdQeS82L3ZI?=
 =?utf-8?B?ODZVME5MYXM0bFlFclVtSTVDbkQ2K1FPZDlXckNSdUo3ZE5wMk02bWw4Y0g3?=
 =?utf-8?B?dTl1cW5WVkh6a3pZZWQ2TTg4WVB5VDVMa21oUjFzanRvY3d5MThROVBWUncy?=
 =?utf-8?B?aVo0bHpSNlhPNWhzQlgvRGY4VlJ1MnkraFJIcnR5cjZWa0UvdkdjeFBPQkVY?=
 =?utf-8?B?aXVxYUl2MjNVOUE0OHQ4KzVoMlNBZUlvZUdVaHNhZG5IZ1VTNGRRVXF5N1J5?=
 =?utf-8?B?d05sT09ZZmVUVG1kZ2pJRHRqYy8vVDRhTmw3RDVhQm9zT1pWemVHMzBxeUhn?=
 =?utf-8?B?eDFoRVY0NzZIZEFKdEduMkxrTmVsUmpBNEE0M25jOXJreG1iQmhFbjlmQ2dp?=
 =?utf-8?B?MTM1YTZqMkFzeHdhQ1N3OUhiN2FEa3M3WVowYmNqRHNjcFRaeVBtSGdPUm1O?=
 =?utf-8?B?QmRUaE1qOVVIZEp6UzRSeUgyempWYm14UU9jemxOMzVSYU9XQUdzNXBHRGFH?=
 =?utf-8?B?dDRvT09KSHJqWWxxc2ZsQldRbmJtaTIrYko0dlpzZHROa0EwZUFnRWg3WU1X?=
 =?utf-8?B?YWhJeFNHTkl2YkthZ0lCdncrY2NjUTF2NG1sdTBlRE9pOHhqL2JzR2l1MWh2?=
 =?utf-8?B?ZXFxaTJtb09UdmJTRExiMUwrOEhSaUloVE5Rem9KUWhFaGFGUHNqSVU3MzBx?=
 =?utf-8?B?bzU1dUg1T1AvU0ZISTY1RXh5ME5mMSt0WWFSN1NWcEdESFF1OXp2ZFVpV2ZJ?=
 =?utf-8?B?WFFPazZTU3drbnozbGRFNVdsZ0pnaHUwRTJqS0JkQkZvbS9WaVBZNldQc0V4?=
 =?utf-8?B?UnNLdlB6WC9pdzBYbTdKcUl2ZTRsVTJINFdwR3hmQlZ0SnBvbVVvekVreFdr?=
 =?utf-8?B?cjJCZzFaU1M0VUh1S0RidnJKSUl5MmcvTE5DTkRIUExnUThmYkt3azNOaWcx?=
 =?utf-8?B?eWVWZ3dFT2RjRmZzaVdQV3lhMGlMR2xwSDdpOHB2emR0UTVEekJGcHNFSEJj?=
 =?utf-8?B?SDVla3NYMlZzRmFYTXhoclIxaWNBZGwvQ3pyTWUrSTJMNVBBUjdIeGVtNDhX?=
 =?utf-8?B?ZHFzZEwxRXUvVUl3QnI2UFV1Ym1TdXRRdEdTQU9RaVFKVHAxbXF5UmhGbHZK?=
 =?utf-8?B?U1pCa0F6d1pTeGh4MmRwa1kvT3JDbFNUcnNGL3o4VjJOSmI2KzV4ZFIrcGdn?=
 =?utf-8?B?S1d6Y2hweUgvckdJRDVBVFhnQlQxWXB3aFBEQy9ERVJaN0xvKzVKRzNDUTVI?=
 =?utf-8?B?Q2o5VWh6ZitMcFNnU0l3d1V2MVlqWkdzTnAwclRiKy9EWlpjYjJVUmxDeDdD?=
 =?utf-8?B?L0JGOUpOeEJtQ0YxcXl1ZzNNclN5SHo2Uml0eUFNWXE0NFh2L1ZwSHh2TDhZ?=
 =?utf-8?B?a2g3MmZyYmZBemJrZGdtZzZmRVRMdWRwWS94bjFBZ29ZNDdxd2ZFdXhvVWty?=
 =?utf-8?B?TjFzMkFjS1RNK3dVQ0dFdlRKUUVRQ0FjUUg4M25qWUNkYlZ2WnA3amlqblZB?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OZg2Qe4uGHXtrKCwCLSwZRbbOLSrhKvmBXYryBJ7dkwiFpxrpwXumLGAjVr1Up5CDtV15TKQJTM1Ymh7PUzEz8I8aVZdHFu83H5+T/9ePNk3ZI+ssfe0DUWbhNubraTOGJWyXkmDbTo+PK9h58rsdwDh5Mg/quhfsTbuxYnzxCuw9Ja7Fur8Vpmwjh+JjQuJ81nXMFX39DIlOhhLGKkEss/UhbVC/Uhj8lLxvQY2M/Eal4nfmEW8sYzcNqXua/Vj+VAkxWwHJQUohyvM4keMoEgib4SxSHv43nGDdbdlIoLtOrz3sNzBvLxzMaPK/THJUa4Ep9czYvgdWVz1Z+NhUyJrf7Y5p3EHKzZHLLH8UHrvsH52BXAXPQp2zMPXlkTmb5GUe2B5sparm+AVS3sBDyoEB1929JamjvoCbwDi5L1EnPOFTqKT3BDZ/bpK8RZBML0P5y4hZpivAILRHMaR8ejRl27T7OZVypDMGLvS7lS9UKlw/HzeCR3f1giKLPezurziVKwBcG7k4l/H9RaAYp74wCZgR6T0hMX7IOGr4hWKJaGCdZV14ZGT7Bh7cvEjNFAJi4j3HA8qE5ImYVF5vAdd/ShOtsYSKs2p0ZsdeELkZEm81w6pAsY/4RwSVG9tV2gkMIczVLEV/REGsVp4GdwZicISryu49dWZ4ds0MTq3aK/TelLgWcBMePKz4FsvZS9knIxm29WCqNqBOpnO85MN49gj71B6IAhh3JQMROB/TfV2RPssNt6B9S/kNEv4anEVYdAGS1NwKo2wyVcpc8TkCM0uYBaBI+V+0cwf3+G5AlrE80CamCW7k7E13R3+8fTdo0QZb1CMAv6JY1xLrQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aeda25-b747-4546-1bcc-08db65a2fd8a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 08:58:11.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZYF5VDlDJZ5i4oZ7d3tLFaBuD5JRJV8vXUe74LMaFhj02NMeiXUALmLm4Ozl0Fkhl9JL1hLegLHf8dRcoQLCS4OjsZqHt1kkzyY7YGN4FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5299

On 05/06/2023 6:28 am, Roberto Bagnara wrote:
> U10) \m escape sequence.
>      Is this an undocumented GCC extension or just a typo?

Where are you seeing this?

The only examples I see are in asm macros, and they're all parameter
substitutions.

This includes the one in x86's bug.h where it's a parameter substitution
into an .ascii string literal, not an escaped special character in the
literal.

~Andrew

