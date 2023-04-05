Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED646D8B40
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 01:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518686.805470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkCrx-00019v-3F; Wed, 05 Apr 2023 23:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518686.805470; Wed, 05 Apr 2023 23:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkCrx-00017b-0O; Wed, 05 Apr 2023 23:48:49 +0000
Received: by outflank-mailman (input) for mailman id 518686;
 Wed, 05 Apr 2023 23:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkCrw-00017V-5y
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 23:48:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6619712b-d40c-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 01:48:45 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 19:48:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5947.namprd03.prod.outlook.com (2603:10b6:806:11f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 23:48:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 23:48:40 +0000
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
X-Inumbo-ID: 6619712b-d40c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680738525;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8svVWt7HH2xIy0tqQ2OwV8bT1afdTLaVAIvTAUGR4FY=;
  b=XhqbzWdvCih1xAX1EhLYVRLljp+M5pxYVNqp5Ve42E1P+FSFPMbGF2st
   0KVm7ZOZnPMXrMpJ2spynMm+VwATXEWwAfpTzBViJLr77sGq+ZCfvLO35
   RFcJ9ZAkGkNr00URqD0jmow+SlIoCf+Sos8bceBVahA61V9pvrIatw+jd
   4=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 104398281
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lMjACK8UAA6F4CNyZlG1DrUDZH+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DAWUT+OP6mPYDPxf48nPYTipxwF65Pcx9FnTQI9+Sk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagW5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkli3
 906dREBZCnZ2cCpg6iSd9s1ussaeZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOT+zorK4z6LGV7nMuMh0cbna2mPOauFOYQIpUO
 VZX9BN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnM05Xzsxz
 XeSgsjkQzdotdW9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMSH9x
 XWGoTYzg50XjNUXzOOr8FbfmTWuq5PVCAkv6W3qsnmN6wp4YMuuYNWu4F2CtPJYdt/GFx+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1Ba67opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:63rR6qta9seN7xaHytvvsmQf7skDVdV00zEX/kB9WHVpm7+j5r
 yTdZUgpGTJYVMqMk3I9urwXpVoLUmslqKdpLNhWYtKPzOWwFdATrsSlLcKqgeIc0afygce79
 YET0EXMrzN5DNB/KHHCXyDYqsdKbe8gcKVbCTlo0uFjzsGV0it1WhE436gYzdLrcB9a6YEKA
 ==
X-IronPort-AV: E=Sophos;i="5.98,322,1673931600"; 
   d="scan'208";a="104398281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJMDTH+pScY8ERFsFjI7qubxn3OCYpihgBKYD7h9l4etFodi0kVnECdtGZjfmTNv0Q45xi152wlqTfBq2hW//uDuXvkEVvxd0qlbZT1tmBlTOaSalifS6KZ/sn1ofq3cHseWEZykbc6aE1FH0dNCdu4Eo1o1lGloxNBYslwR7YP0Y/zraSym2dgbxXv1mTCWPseUZ/c/hKIscGn51KhVmCRAII4/EvLTXtMGri4B1w6CZe9UOP74Xe2dIqzsCRfNII15f1LDNR/fwASA7ISg1jwGxTRy9jG/lLsGYLeDSLcMbBszJ+A9+MCrng9oEJmbiWSIV9pda1IIjLq02nnPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b89C+WDjoBzAWdyAvIeyTESJkKHIuxXpo6ReecPT/Co=;
 b=FhL62pFx0ntXoHWKMozas0V4YJ4ys4y3SUDNKNAM93vYurt+h4D2Gb3xjeQNdq3n9lk/IjLLfki+wkeMfDJMo8I3cdG/Lmpii2VI5IkFSWWi3jgPKHELW59qynoC5WxFrBAEu5EzDUJAUf0M/JtZAy/DzjoXwuHrWmH1TdQLAjravwWpEA7J8GAkvzUDCzyvINVSOXxAd/NCIbXI5wNodsxgpDDwSa6MMWFx+34xQ3ErMEanl9Ex11rTAfLmT3wxDgPQxPiZnn6fIBT0vCQSHpwIk3bYKYlfjE1bWdbwouBdQosNouXG9jzD8FzEwT5I+hX83oTPVkHWg2gph7dAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b89C+WDjoBzAWdyAvIeyTESJkKHIuxXpo6ReecPT/Co=;
 b=vf74fw8r+BOgpbeRF7ibBD4PvejNVO9DrgALKlOA875ORMoqNJVIsq3lZLJEqFSB3+/By2mcYysX6uO6pZH4VNmA/OvzDb+nD+LJ3hSv+Z+/IydQ6asO/v8YNkSZJf8grWHSJVnKvnQAWHJPL979zFC/jbdFX0ntfiP9O7CzFFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8bde7944-a9aa-a243-c621-9cef1c657552@citrix.com>
Date: Thu, 6 Apr 2023 00:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-4-sergey.dyasli@citrix.com>
 <b46ce1ce-19f3-29d2-af50-e1515da4112f@suse.com>
In-Reply-To: <b46ce1ce-19f3-29d2-af50-e1515da4112f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e4afa7-7493-4c6b-076e-08db363047f3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wBZ5grUS58HoTF6qlg9Nh7e8YSy0viwxx8ooIhErzv84mW7EEyOKU7yLD2BR0bT7JzLOFZQ4gt9y5ZB4NX4x7dKps2+es5GEgww8qoxW3ynrY9+dxkLZqt5OsO/Fya9arm7fGIuqyqLKu5x71GvTNeqY7WKoPJHhWcKPkRDLsWWDkp+sllxTkrQtczafofhJQLx2Gr+wGXCW3Wn7sFRuxIgoozDHWueBfL5SSheutOh8xUTw3jfBUlAd1mOMZvrJmWUsCXjmkRST0Q20aGNQ9snKcYfIdnsz9t81GIX1EsmPgUmb+Ov6cVSN6RkQRpJ7aY5AXF9WEpfIrdbzQuQ9ydgXlAJjzg9FtGVYl5h8s0nhuSZY9rgf1POrF1BgPcOAcZywpPOKq3OLkEhKgDJICf6CYz0G7D71eywxqLuaRWafktplptHn+eGNGpCbqY85sZEEzwtAiDEbHfm/hk04bj1H+EEiE1k4ZBHyc+xF6Hj0vVmVLophTwTn3/KZixKmlyd5NDnf+zhDEIj2ARBB/g2AMEkArwW1Znk1V4YXBQAPV97KBUqH6UAR2Fpb/pdulq5DTKcd84lDbIzjPe+bw1iH0xANy0jFGmzeZn/oXFSMmEEUBj9DXcZ+nE0Jf9kbYT/Q9P6uJQmHIo+AuiDKMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(31686004)(6666004)(2616005)(83380400001)(8676002)(53546011)(6506007)(6512007)(26005)(66476007)(66946007)(4326008)(66556008)(38100700002)(86362001)(2906002)(82960400001)(186003)(41300700001)(478600001)(110136005)(316002)(6636002)(36756003)(7416002)(5660300002)(8936002)(31696002)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFkrV2ZWWkNKUnNzbTF6REp2ekF2T1lqNEF5cGMzb1FKSFF1VzVMdVBkMVFY?=
 =?utf-8?B?c1hqNUhVQkpneXF6SzBjbFA0TVEvakRlRTdpUmc3Q0tNRE0wemhaaXYyczMw?=
 =?utf-8?B?OExaQklOQjV6YUFWREdTU2hNai9rdUhTTDl4WFU0RXErOFUzN1RDMmo3TkdE?=
 =?utf-8?B?SG93VzJKcjlpNDhpOWpDNnpoci9RUmlSZEJKNVZHU1dMNndEd1czOXdnYWo5?=
 =?utf-8?B?eEN5VGRGR3Y0Sk1FKzhCNlRmb1pHdTFTYkhDcVRsbzkxRGVlUUFsN1JrcTZ4?=
 =?utf-8?B?VXFTQ0E5RDljMWJ6RS9WTmtVS0JHc1BxS2tHeTJ2bnFyMUJrTnFnSlMzVmdH?=
 =?utf-8?B?VFZJSm4yYmwwbzNHajZlNnB5OGJHV1BSWFFsZHJ3ZlUwN2tnbXUwRjc0dzVx?=
 =?utf-8?B?UDQ2ZzN4R3lBbmlKN1diTzZRSzhFZktKVXRjOHZJdEZ6V0VPdlVNM0Q4T0Zo?=
 =?utf-8?B?WWhrK29zemwyYjBHbFFHRkhFYysrL1RRWlZpSWRzVENwNmZZM3NwaTBSZGhj?=
 =?utf-8?B?Y253OFV1VmcxN0YraGZCRnUyRi96T1ZEMU0zQXpITStTVTlwSFQzU090UVRj?=
 =?utf-8?B?UWE2ei9CM2tOQUNPR3czSkdOdmdVdURpdUxBRm84WnBhRTJSSkQrS1BFRFUv?=
 =?utf-8?B?Q2ovSzd3di9tWVR6eWwwUnhnVVl6Vk1ySFErazA2OTFRUlozT0c1WWtSQ2hC?=
 =?utf-8?B?UlVmVUlZajE0T3FQdTdUZ0t5YmtBaEljamlhd1pBQmxzNWdEZDEvUmFjcFpH?=
 =?utf-8?B?VTd4Yk01d0Q1ZEgvanlkTmVsQkl3L0tOR1cvbUtXNlBBTjJIQm1ySjcrQVVZ?=
 =?utf-8?B?UzZ6cmJjYUZ5WDZIcVI2WG9UOEIxTmFJOVMyS1VuVG5NMVJYMmJkQytQdGZs?=
 =?utf-8?B?bjBUQzVYSHFVNE0yQ21kQU9oOXl5UzNYNmhqU2U4NnlVS0M0WUVWRDlpWEZB?=
 =?utf-8?B?b1Y5RnZFNElZbjlYZ29Ra1loRFo3bEYwUFNITElHbDVXNlVOZ21tMVBvNTNS?=
 =?utf-8?B?SGhMWUFGUHF2KzBUTUM1cHNZNXNGS0lvN0dCZHdaZkd3VXBNRHg0TUczeUNH?=
 =?utf-8?B?bFlLVXFUamNXL1FhUzAxdXRZeVEwOGc2bHppMUNlOVdncVF3dEpGMVVrdHhr?=
 =?utf-8?B?TEs1L0pJRUN6T2pYQzFaQ2l3TEorVUp4b3JaQjFvbHNEcUk3NElBeGNsR3kr?=
 =?utf-8?B?U0xRZW9CL2xVTFlNckhhVFV5M0Fob2g4YnBrdEtjU2Erc3BVYml0MjlYL011?=
 =?utf-8?B?VUVzdE1mSUJMb1MrOUtvRGI3Z25heGc3cHNJWGJqNkgwYmxwNVZhck5CWWFh?=
 =?utf-8?B?N2hGNGIrdWpHRG5qWFMvOGtVc2RIVmRwWHoyT0toVUdWenNUTXZKeEg4NWFn?=
 =?utf-8?B?SnIzSEtiVGRhYTBVZ0xFMVBFc251VjUwc2pubEI5MnJyZkZMWGY1RFRiNXNx?=
 =?utf-8?B?cmF1b0x4M21FWVQ5NlNEaEdMOXpVNnUyNkpqWVFEdUQvcDBSVXNMdWxSR2Ra?=
 =?utf-8?B?N0c5dDJKdDd6V05lMTVqajFjZURkQ1lyNUNkWDF1MnVTSGk4U0YxWmREMUxt?=
 =?utf-8?B?cHM1akNPUVlnRm5FYzVHa1hhT2dSdXQ3UXVJTEFVejlseFhlTnJIa0VZQXl0?=
 =?utf-8?B?Q3FlaWZ6TGIvRkhqS1pIRnRiK2lacGRlbWFNemZ4YUlBWEZmZE1abXpxL1hO?=
 =?utf-8?B?ZWQzT2hKViswdlBxNkJWVEVvOUk5RzdTTFA5aUIvSmM4Vk94OURGQUk1ek9X?=
 =?utf-8?B?YTZROGhHNHZtemNKVmVWRmU3eXErMmN1KzMxTGFaQSswU05tK2ZTcjhEL0Jk?=
 =?utf-8?B?ME5FcTRnODBmcHN3OXVoTXZnWFd1NXBRdy9CM0pUK3hhQndYa3FneG9kdndB?=
 =?utf-8?B?dXExQ245ZzBleUhVRnVOSHlzUjJtTkp0dldHeE1wbXUxcVpsaU04SjRCdlFR?=
 =?utf-8?B?NW1vRGVqbEN6WHBTTjF1b2puQVJVVDUyQ25GTGEyNFZJbkZraWVxQW1BdjVC?=
 =?utf-8?B?ODB2QVI2OUJTYkQ3dnZWd25Ub29XTFpCcVFodnB5VkRKeEFqNm1TWUQrM2tV?=
 =?utf-8?B?Vm10WkptZ1RWbEswUHlQaTRZeDJNcVJSRG1MUTJoUUEydEY2R1dRY0dUdkdO?=
 =?utf-8?B?aVFkUzJyY2h2aDFMc3RXUEJmM3IxVDlxS0pzTVF1VEZJVUNxNTFOMC8rZXpE?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Eh6DUGPuRvjOx0T7xRY8P3tZUnwwujEpK5iX1d8noxfSftjxIMaNlhUC4arA3zE9IlG1uLWqz3WsK2DY/CoF4vYzYP8vFObiYDaIyvNlELgjwTMJC0n+aFgyrLCc9LQEBubmt6bIkJUJYtJr9TYKdYtv3kL/eqxiurYYSqG1mhKR/WvzXLdxx6Sxl9Nv6Fy3DEYr6+SJ5TxkrCvYCp/AUzhg2DNHyjmQwFRE4Bxiud84g5eUrAqyHvq//AYX9ySIIgjkIsTpeSxq/YyjnDzQdjZQAyQ5PK9mI7X14EO1tgEvwKABnllieoH/mOh/9ncmnP9ewTzYAarg253uyvsmhYORDW5yE+yPMpuaLSmu+pwOcNo8rHX9/SmXEFFWACDVGBG3Jw479fsLHV7xhpDDdjQwwTqT4bhF5eWzXKHe8U1KZ/494mG9d0beWrqvyFPEj6KQrfnTGqF+kwfVUoPfvMbF1dzgzxz67Rcxqv2cGt4eSNRGNhl5zu8Wn8vIsXFZVc7Wn7qKHVq6UkXxUaHAcuf3UVmgh4Sg22vbF9/2b2gd9JAd25b3gGBGgw4hQKHbJE0FHZbNaz88RZTvgv8C6dyyZ+aQUlkq8lKcNC8z8HXCkwnqqvJqUMroZS0CrCOW+QHs0c3FwZXzCT8GTBMZ20GJJKC+FowalHxfqTqIfjW0iIzS7Yl8dMnNXeHT+R82ZrQCpyYilngFrwJl7qhTmVfQPq86uKMto7GA0ht+uHUktutsOIceYJ26UmaRdAQ5O6FQ7vqfUxTybrK3wEca4mWPOOoYYum/uIU6JQZAzamSqJoZJ4n69TdxRYfpjpqNgOySGOf4Jur9F5/bwG8iXJcm3haUkZAacHFfx4C5/uc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e4afa7-7493-4c6b-076e-08db363047f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:48:39.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCbaLpxVs4iqbCZVncydb/L1V2vcKaKagn7GMT4WJ9dXxBSvu0iP8YwL/b0n6CYmdfCBe/KMOK7BKk3bNT2EAVst0QI78qmIt0KBXlQycXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5947

On 05/04/2023 10:11 am, Jan Beulich wrote:
> On 04.04.2023 18:06, Sergey Dyasli wrote:
>> Add an option to xen-ucode tool to print the currently loaded ucode
>> revision and also print it during usage info.  Print CPU signature and
>> platform flags as well.  The raw data comes from XENPF_get_cpu_version
>> and XENPF_get_ucode_revision platform ops.
>>
>> Example output:
>>     Intel:
>>     CPU signature 06-55-04 (raw 0x00050654) pf 0x1 revision 0x02006e05
>>
>>     AMD:
>>     CPU signature fam19h (raw 0x00a00f11) revision 0x0a0011ce
> Wouldn't it make sense to also report the model number here, even if
> ucode blob file names (currently) don't include it?

I have debated FF-MM-SS on AMD several times.

AMD do document all their CPUs consistently in hex, and I know the model
tables alarmingly well now.  Furthermore, it's not a straight nibble
shuffle from the raw value.

So yeah, it probably is worth including.  Given that we're not guessing
the Linux path of the microcode, it can replace the fam19h without any
loss of information.

> While for the revision always printing 8 digits is definitely helpful, I
> wonder whether the two top nibbles of the raw value wouldn't better be
> omitted. (I understand Andrew did ask for this, but it's unclear to me
> why he extended this request to the raw fields.)

For precisely the same reason.  (With a question like this, you clearly
don't work frequently with microcode crossing a wide range of CPUs...)

>> --- a/tools/misc/xen-ucode.c
>> +++ b/tools/misc/xen-ucode.c
>> @@ -12,22 +12,89 @@
>>  #include <fcntl.h>
>>  #include <xenctrl.h>
>>  
>> +static xc_interface *xch;
>> +
>> +static const char intel_id[] = "GenuineIntel";
>> +static const char   amd_id[] = "AuthenticAMD";
>> +
>> +static void show_curr_cpu(FILE *f)
>> +{
>> +    int ret;
>> +    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
>> +    struct xenpf_ucode_revision ucode_rev = { .cpu = 0 };
> As mentioned before - the current state of the system may be
> inconsistent, so I question the entire lack of a way to know of
> this by using this tool (even if via a specific command line
> option, defaulting to CPU0-only).

It's a theoretical problem, not a practical one, and definitely not
something worthy to block this patch with.

Software always has more up-to-date microcode than firmware these days,
and it has probably been a decade since there was a system released
which could usefully function with asymmetric microcode.

I know we seen it in the past, but only on truly ancient systems.

>> +    ret = xc_get_cpu_version(xch, &cpu_ver);
>> +    if ( ret )
>> +    {
>> +        fprintf(f, "Failed to get CPU information. (err: %s)\n",
>> +                strerror(errno));
>> +        exit(1);

Use err(), which removes all the boilerplate here.

>> +    }
>> +    else if ( memcmp(cpu_ver.vendor_id, amd_id,
>> +                     sizeof(cpu_ver.vendor_id)) == 0 )
>> +    {
>> +        fprintf(f, "CPU signature fam%xh (raw 0x%08x) revision 0x%08x\n",
>> +                   cpu_ver.family, ucode_rev.signature, ucode_rev.revision);
>> +    }
>> +    else
>> +    {
>> +        fprintf(f, "Unsupported CPU vendor: %s\n", cpu_ver.vendor_id);
>> +        exit(3);
>> +    }
>> +}
>> +
>>  int main(int argc, char *argv[])
>>  {
>>      int fd, ret;
>>      char *filename, *buf;
>>      size_t len;
>>      struct stat st;
>> -    xc_interface *xch;
>> +
>> +    xch = xc_interface_open(NULL, NULL, 0);
>> +    if ( xch == NULL )
>> +    {
>> +        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
>> +                strerror(errno));
>> +        exit(1);
>> +    }
>>  
>>      if ( argc < 2 )
>>      {
>> -        fprintf(stderr,
>> -                "xen-ucode: Xen microcode updating tool\n"
>> -                "Usage: %s <microcode blob>\n", argv[0]);
>> +        fprintf(stderr, "xen-ucode: Xen microcode updating tool\n");
>> +        show_curr_cpu(stderr);
> I recall you had it this way before, but I don't see why this information
> needs to be part of argument error handling.

Because it is specifically useful information to be given when running
xen-ucode with no arguments.

But also because this patch predates Spectre/Meltdown going public, and
is documented this way for XenServer.

That said, the information does need correcting because it's changed to be:

  "Usage: %s [show-cpu-info | <microcode file>]"

in this patch.  (and file is specifically more relevant than calling it
a blob).

~Andrew

