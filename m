Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB84C1043
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277285.473732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMopo-0008QK-Ii; Wed, 23 Feb 2022 10:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277285.473732; Wed, 23 Feb 2022 10:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMopo-0008Mu-Et; Wed, 23 Feb 2022 10:25:24 +0000
Received: by outflank-mailman (input) for mailman id 277285;
 Wed, 23 Feb 2022 10:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMopn-0008Mo-Dt
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:25:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e78129c4-9492-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:25:21 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-wCpIZxJYPzevN5BJVaAoWQ-1; Wed, 23 Feb 2022 11:25:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2451.eurprd04.prod.outlook.com (2603:10a6:203:36::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 10:25:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 10:25:18 +0000
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
X-Inumbo-ID: e78129c4-9492-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645611921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyq5jRdiVF1X+9pbX0NPbLU4H6z7c+4VAkBhIZM4KEA=;
	b=Kjzjn0KfcQNSWF6DjMNmVrcijDCHwORuKHbkjimoRqauucRB7vIKKTdmfYWQC2bl2XY8aA
	pumDhaI0194UEwsSXypKs5HRVViiJjGU70v8F3ZBKIdccRdGJmtVaOMVNRosovNTGYY1kT
	zSZDLfwRzL7+WdgKZ+fM2+S339UakLI=
X-MC-Unique: wCpIZxJYPzevN5BJVaAoWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgBy7Vic4U/GQSnsXjBhdVHnh6VZ0jdCuYbIraSKnT29AJmQEjRGIQYQfO2P8rgUcXNqekZOKEZh1e4LuTehUHMlJ2hWNJlhIFASCUn1ZkOYILbzxI1IEH/xmXCLTsYprPv7BDjMcBu4Js3SiyfhOksfWKB1gxh5sz5ZpsD7CupMc0R1nxhz4gMsIODbEJRxQL6W5+F6AiCvWr+crnT/51wSEBTKy90sSD24Krrv78Av4lD69qvk195xoc2JUXZvtTXsmkDapf5/S9DCs6AkxHbcXkDAJIfs3Z/M8dKI/4Ha1eWNj2OCGFpoK5zNh783c/5T7RCjT/wkr3y0xqU32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyq5jRdiVF1X+9pbX0NPbLU4H6z7c+4VAkBhIZM4KEA=;
 b=VkeRRzgnQ8lPys55FEObCuqGdJli9uv0tzq4OH6xioOS3WvBsvV7jl1+ZKLsvUSVxt8Az8GH8Ao9PGRs5w6oN4BSy4G+fECxvU8v+S40E178iDuaNpauvHdUGpQghK5cgUxZ8csLXf38hnAeD4alEMVbc0hSdxjUIXix/UjRLmlEo1o4a7vMBji/EGQdaUNOC3E9Ay6xC5Drb/bx45P3aqL4h7aA8+qumEiombwU+uv5fZvzsz7w3kVmYhNe7B75aXaBAr/Mb8KDo4U7MV4C0i/4+yM0XUE5SjAEkSCBxZUnTc69CwcMFeeB6Dqhz+dSvhmZ2AixQdpe/50QqpdC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fab0ba40-9840-9bde-e4da-822d797985f1@suse.com>
Date: Wed, 23 Feb 2022 11:25:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 29/70] xen/misc: CFI hardening
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-10-andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0059.eurprd07.prod.outlook.com
 (2603:10a6:203:2::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f338c5-4952-4747-fdee-08d9f6b6c9bf
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2451:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB24511B8761A0B8F63E3BE3ADB33C9@AM5PR0401MB2451.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ctKIdqfoav6/IVhzJiQkvrm4G1/gxl7842Zgpl0HPz7jfaKqn+ffSDpgkxE/8nlrQe4CTnZPBNIhY3qLvzxf+9zF7NGpIz5yewrIvxk+lxS8jm85YbCFDtBoVcM9W/9doNtPvBNgg6C30XNaZ6FJXaCpJ1TavakXJ7TDj9HSlhO/MgMt2noXIi5hUvbDIEMB6T/noF+BRr+RRxif5Cr2BwAG6Q3jvIzpsJ2V4/z/Xq8Ozf3goKDGMhMC9QzFQUSL0YSAf/904x/48BQwMpkEy8NhEa2R3jJLBM+M/B6935oOjP46zwbuqmxDBs18p4U8Z8GwxPfXlN0kBeZIgrws5YUhyPk4WhoJUgkLjlJky9JJ3qGufL4fTR0wEk8APRPi9x/FKM5UjMyBvrjnnZjeeAp49R5MqB/ElXXDDtXyhYUXJSrPlwqAzkQg1M9p7yvcA6sR6tw9G+cX1ET5ahw6HwgYIq+ge6vYKEPsIdGWiHnN/MexE60rX2wbbNK5RCjRQ3b6dSE2MG/dVG0fTkLl2M0KX9RtHxQz9LxX4iHYpmsTEuQMRji+tlAPK148KPHOynhHEhjw+HYGfpQw1ERUgEnoFBzBH1Mg0Bkre90WeFzHoMOLVwwHSx43hWqqkoNnCBVZDzCpYru6Gd4115zsBy/eW/Qqs/a4qjP7EMqmT9v7m7dmtOGAl8Pg8A1b/baXIc9kQRzyuo7F361h+zXmdKfelJ5LUddN/lv+QUXMJNsfjuA/gQL7c13pN8xZNtEh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(5660300002)(4744005)(38100700002)(8936002)(86362001)(316002)(4326008)(8676002)(6916009)(508600001)(66476007)(66946007)(66556008)(53546011)(36756003)(31686004)(6666004)(6506007)(6512007)(26005)(2616005)(186003)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3dVbkpUdU1oMk5vSEM2QWlVZTE2eldjU05uZTRqSC81ajc5KzdEL1B2UzVJ?=
 =?utf-8?B?REkwUlR0Wmg0MDQ2c2tOQXRFbHgyYkVwVWV0ZkZLNjJEbi90b1FZeEpsTE9Z?=
 =?utf-8?B?VWEwU2U4WkQ1bzZONVNjOFhKRENUclRYajdPNWVRZTdhS0I1UDZhRmFNTjQy?=
 =?utf-8?B?aTF1eTdqMUZ5OWQzVlNKdjUremZKY2xxR1NvZFMwYVNQeGhuTkVLU0lZb29U?=
 =?utf-8?B?VmV2V0NqaE0zWThrV0JBYzluQU1LN01HZ05BS2ZpRExOWWI4VmVmMnFSaTRJ?=
 =?utf-8?B?czZEbVFkQVlSTGsrZ3Y0bnptWG5aU3hYSHhpTFVRK2pQS1p3Wlhndm9RN3FT?=
 =?utf-8?B?a0JSU2RralAxSG4yV2R4ZXJFQldEbmswczlFSDBkL210ZmIzeVFMdWdpUnhG?=
 =?utf-8?B?MGtTSzdodkxTUGd0ZEhpRzJScDVVUHRSaVlaVTBJdU9tOXFSZkU0YmVLWGcw?=
 =?utf-8?B?TlBmbVV4QitsNHVnTWNGNVJNR04vYzd3RjdOdVI2eDlIS0FKcS9tU2NIQnBW?=
 =?utf-8?B?cWtrYzhnM250clRqUEtOVFl0OERnZ2J5bW9CTXorQTdmd1BtTm1ZVWNaWmVP?=
 =?utf-8?B?eWR4S2hEZUxWMytyNVh6dHIxQ3d4eWdIMnJSaVZqLzhjc1dPTXJ4cUJuY05O?=
 =?utf-8?B?MlVtbSt2UWZhQTNNTm9sYkxXcWZKSUlNNFVOOEFUTnYxbGVvR0xkdGZ4NnBk?=
 =?utf-8?B?WjR4UTZ2aTUvOHp0RGZVZCttM1kwd3E0NmhXTWpZTDJaQU5EdUVBQmdPWnps?=
 =?utf-8?B?QUI4ODByRTVmYXFzYkVDRTlXR056cStlbGwrYkorV2p1dnF4Ull2Y25mNytJ?=
 =?utf-8?B?bG1LOEd3YjFzS3dJTDdHNVRCNW9hV0NaNkgzS3V5NEQ5SFJNUDkxN3lGTlFE?=
 =?utf-8?B?QzVQRnJuQlZ6ajMzSVJsOHhjNFZybmJ1WkN6V042STJQQ0RsTTk1WmtMNjdp?=
 =?utf-8?B?eUJMTzhmOVdoK1Q4MWIreDl2QVhlYVg3UGJOc0tRWjJGMFlEM3lnYVdHeGRu?=
 =?utf-8?B?R1RrVmVoU2Nid2N1Yys4ZlQ4R1ptZ3pLendObEZoNGdIMEJENE83bE9ZZTNR?=
 =?utf-8?B?cVBnb1dNcGVsZUtjam9Eb0EwSlowUDhVWWx0V3U5VTNyR2RYdTVjT3dDTDFV?=
 =?utf-8?B?QTRRcDJtdHhzTkRoQTJMUFJ3S29BTkYyR3pJU1F3bE5kZ1hncnZuRmhxcG54?=
 =?utf-8?B?QXh3bXNRdktFU1FPUWpDWW1Lb01iczJMZ2FSdzBMZFFtbkhYMUtuN1IvMjdn?=
 =?utf-8?B?NlJydUNuWEUwT2x6QlBrbEJHOVlaZUNINXB6UkhDanBhUlZIZGYxd3IwYUZU?=
 =?utf-8?B?dTB5R01Xa05LNWt4SzZSZ2xYVkZRa3lYZUJINVJoRnhPRDRXN1hkc1lYMDNH?=
 =?utf-8?B?N1U1enB5OXdOcnczMUFDb0VOTENzTHQ4UHh3eWpZcjNlaWdBY3ZKZUVkaG5C?=
 =?utf-8?B?Y2hnWkdVV1FLa2FqWnlmVTdSZXgrRnRCN2pOMWR4M01YR3VwT0J3UnRKZzFj?=
 =?utf-8?B?WityYjg0UzQybGVMT1VWVTlzUzJLV2owVllIK2dLNFVJeWtDdFFtNHVmQnJO?=
 =?utf-8?B?S2RjeCs0T3FRdDFNKzdEZjJqbHdpaVc3VDNybmowcWtXZ3d3VkNqOXlCcXA0?=
 =?utf-8?B?enJwUzNHS0N4ME9tVmhUMURXaWNkTjlseStnV0poOVBsMWNkZjRJeVIvc2pB?=
 =?utf-8?B?Vy9ESmljNUUzNFduVk0wMHo2eWVUN1Mrc0xOWVZ1QTNTT2JtK1pUaGZramFE?=
 =?utf-8?B?bzBibVR0M2ozeXVMSHRjYkxqeDdZZGlmZmhGMXNjUGVkckd3Smo1WFhIdnlE?=
 =?utf-8?B?Z3E2RUliN3ZwVDFLZ3pvMUJ6M2xDMmFkNVNzcEVHd0s0OTA4b1RVcHZoZXBm?=
 =?utf-8?B?MmlWclA4ZmhHcHgyWndjd3lkMWRUTXFwR0V2T204ZWhmdVh3YnhKclpqNHU3?=
 =?utf-8?B?b2VRbXB3QWEwZm9TTDlyTzVWRWlQeEgzYUhxcGRVQWtWSmtxdlMyRlJDdEt1?=
 =?utf-8?B?TDJFU2lYdmVEN1AreHgzd2tsV2FkaUtTZjdKd01ZaHlwcnJGeFlacXZjWTFp?=
 =?utf-8?B?RE9US25WOXZYOEN2citOOWVZYktXUE43L0ZDRWtVeVpwbWcxUzR2QnJHYk9M?=
 =?utf-8?B?NWdEelAyYnFYYUxURWtmVjFnZElVZ3pVbHlTYldleVBkQTV0djc4TFFhS1Bs?=
 =?utf-8?Q?GKBS01Qso8tXvS4AWyPMoyk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f338c5-4952-4747-fdee-08d9f6b6c9bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 10:25:18.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gElPREU+4jauy5RjKrxpmKNnqzGAc0RhKiw3eRhLWRotaZYHss+PeZjtc0jqd2kYf7bMMEdRC+YaAHRASCt5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2451

On 22.02.2022 16:26, Andrew Cooper wrote:
> Control Flow Integrity schemes use toolchain and optionally hardware support
> to help protect against call/jump/return oriented programming attacks.
> 
> Use cf_check to annotate function pointer targets for the toolchain.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3
>  * Annotations for gcov

Hmm, ...

> ---
>  xen/arch/x86/mm.c                        | 6 ++++--
>  xen/arch/x86/setup.c                     | 4 ++--
>  xen/common/coverage/gcov.c               | 8 ++++----

... what about llvm.c then?

Jan


