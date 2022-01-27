Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59B49E585
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261553.452986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6RK-0005AX-FY; Thu, 27 Jan 2022 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261553.452986; Thu, 27 Jan 2022 15:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6RK-000583-BI; Thu, 27 Jan 2022 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 261553;
 Thu, 27 Jan 2022 15:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6RI-00057x-Ot
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:11:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76ff48f8-7f83-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:11:55 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-7FrJYYYPOjOOLmWcCa9dvA-1; Thu, 27 Jan 2022 16:11:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6683.eurprd04.prod.outlook.com (2603:10a6:10:3c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 15:11:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:11:52 +0000
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
X-Inumbo-ID: 76ff48f8-7f83-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643296315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xAfV4efI07QJ6ksfrDQOBauSw9AepGMyr8JwLCjJ3YQ=;
	b=VjPp5ubNS5w6HO4wHRAIIZU19WBLgvO0tMwrRp+Zu4wZIv7mu6WOVMISZb6zYuP+18ZdsR
	b1FkOL0JApme3BGtkb/+RCfyGCtZy1PP4ks7foFApvqcbE7CDhMcYZQTv0nu/i5mFYyb/U
	vDr+dfrh6bYntG9uO70Pc499QhrEv74=
X-MC-Unique: 7FrJYYYPOjOOLmWcCa9dvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCGbgPaTuTz93bWqzaUCySOLy815HyVUU+CnGT5aHNECzTv6dZeLLWLxPvD30EW6qdiQF4u6l1ySMkaC8zfgXVtPCljegskV9G+90qBbdvX2u0z9M19nHNoRsxrDEB04/RCOmNZSzHIW+KpWfhgPTUwQbYRPPWjkapNVhXI3EM0CEos7sbUjQ5t+tXRztXD1TDZjrTMzufMy3GDSOGIfTD1iW4sjmRxQDEdTqHmbwV4cyeOuQy0WAg3Q9xVU4eQ9MCGIG/IWetEepGm9yT2BH54bruJ7YvweiGnbqpIjjYgnA60L30yEg7UwLCZALnrd/adLBnXIRNnxo0Ebtz0Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAfV4efI07QJ6ksfrDQOBauSw9AepGMyr8JwLCjJ3YQ=;
 b=Fv7fa4wMjKsF2Xp6Ig646RgOpf4CM3Q1e43O8B0cGtHCOcX8ZfVtleptzq15cL0t8MVsHwjiN9rF+G4aK455VwwuX7vtl4NOtCpK4rejzaPUNVLOzB4b8NkFTGqn9eGbbjTvn25JIvfF0I8lTTvqEnvgC0G8fqoFnewJinLL0TYqZ7Ocz0oRkXLzMXnwwUZEWYwQ0U2k63gbUnymrIPl1H5+nTLxOkIOMhsJHR4uwGjhx9AWCM40JvQAL1dhjkxKllfKctXCuNzhfTQ1vtUBdhgnYjKP4225G6881qst63BGseus4ykAnj2ExCskFksyq7GD+OEngrfoTV3RhEB02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
Date: Thu, 27 Jan 2022 16:11:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] x86/mwait-idle: updates from Linux (and more)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee6e626-4dd6-4401-6b9c-08d9e1a75928
X-MS-TrafficTypeDiagnostic: DB8PR04MB6683:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6683FD9783BE7D1EF35F7A6CB3219@DB8PR04MB6683.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	On6YLgEJ83ezN6p3o1bWJNlYOvnCTjfAXjCsDUB4Wjcl/gs6BFws7HqsIHWygll/CqTzyZVyLBURVzDDKS4uhO9yi9kK9mrPwGWEiWFFNEYKM8Ds6Otebszw+Lov4uLyJWKmPE82PVx/grcQ8fwNc5JYVihzozmUsZC+HA8qGMrCAdteMtSNUwLViFB2hRdvItjgnikevY/2lAm9nmBCMNP8m1hxHV0/KCexgggwGFhS00MkZvcuz74FItI3pW3KLGbJeqkAjxxEPYxfjEJcrimsjDg1hdPrEvfBBZ8M7PuTDH9n0AtjZ0QR6xkKG9POtcQjj2lhsyry9Q+nv6pjuWaTrVNNM4NBlvMhEZv7UvxD8JGyJaNw2ksfONTt2n2dRk2ZwwXAPOPUrnQ/5aeXQMgO7I9rFnS2zBnAr6H4G5nIZhkHvgH2rGV5cj1J8BLXRmRHU3xFjitBT8vrZQTBUh0/rPPMLO5Eu2CLCrOvk6hKuXYq67ci9rHERsgwSooIHttqfYjy/kQFJzl+JECB/YLo32AUq595ZKJr2eAkmejX8ydyqWau+ZBlHc0TrJY2QlXgqgWDKKh1DVnOkwhwjl0TdrTLGuGceavV3lutkyr4yG/uiJhnW6Np2m3i6BMvCCJpot9O+3g+VxexQ8HxD/KeNhuy/bYqIHfoKt3YYGMcLbUwdYFfmT0j/zHN6eUhXeNnWV8lp7Slxo5uxJwFYCpDJ/QiFCsYQu1NhJDtoXv5irlX7eUfV0EUsWT1e14D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(558084003)(2906002)(26005)(86362001)(186003)(2616005)(6486002)(31696002)(83380400001)(66946007)(6916009)(316002)(54906003)(15650500001)(5660300002)(36756003)(4326008)(8676002)(31686004)(38100700002)(6506007)(66476007)(8936002)(66556008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk1ucFdRQW1DZmE5UCtic0ppSmNqOWFFYkVvVmxWT0MwRXNwbnlBVnJVYlAx?=
 =?utf-8?B?cEdFc1FSU0FyMDUwc2laZUZYMHNxUGVmOGt1SjRkS2lxYlZNb1VrRXRQM3Vz?=
 =?utf-8?B?RHRXZEVNbng3bUxWNHlKSGlmZnlTMndNdEJIWmlnQXhXQytWeTJ1OWxCWFR4?=
 =?utf-8?B?aC9wblNUUVZidWRaazhLS0IxVlFDcDMwSW5NM2MzeEJ0bDczZkJsTFk0TE5N?=
 =?utf-8?B?S3BCUGhMUkJhdnluU215VE91ZWRGZkR4RUk5TWJtSnlEZittaUt3T3NiT3k4?=
 =?utf-8?B?dlNqUWR4ZjlxU3A2b2IyREdTTmhPb1J1S3FrbTZqcFNjVmVibFNYeEZzM0xh?=
 =?utf-8?B?UmhaT21FakRMRnNCNUExTGJaOWVoVVJPOE1Iank1T1pVWnRSNklPdjh0QlNs?=
 =?utf-8?B?MmJjeXdyMGJnQ1BKU0xPbEhaaUpJSmw2aWNuMmF6c2RPRVJwS1hoanU3WTlU?=
 =?utf-8?B?Qjh0QTEzZGxWMmUzb1pBUzJCTXdEVHZWTjMxNDNZMHdmSlVFVjNWTGJieDFX?=
 =?utf-8?B?MHJCcU01MGVWR1l4ZE8yTTBUbWtwUytabWRzWXQwME96UGRReCs5eml4ZEFq?=
 =?utf-8?B?RUN4QTBSRVIwMGM1SWlZcnU2UE9vcUE3VzV4Z3hDR1owL0o5bTFUUWhhMU1G?=
 =?utf-8?B?UEVza3ZPNXpYUDMxOExoWU91aGhtV2VsOGZTdW1KRTF4Njh6NmtieWthT1l4?=
 =?utf-8?B?NGJIUEJkVERmcXFzdGtyU0N6Q3VGdjFWMDFyamN6ODBaeEdJcmNVbE9xQjF1?=
 =?utf-8?B?UWJlaEhiTnE4MjNScDdiSUtKaklVRUxFbkkycFZuQytvbFhEdEd5S0t1dTh2?=
 =?utf-8?B?VU53dGNhYmdhMEhWN3gxZWxzK0FTL2tuRjVpUFYvcmtwdm1QVFNibmlQWFhO?=
 =?utf-8?B?WnkzV0ZNc1BQOE1IL0ZTUERmbGlKamxmRDFrRU1ocEZhZkVHNmx2d3VWdTFE?=
 =?utf-8?B?N3ZRL08xRWlaS2p2VzQ0M1JZYnZIbGVHcWhmbHpES3lzUGJnWmIyQkNRaFFp?=
 =?utf-8?B?UmRTVko2RytGQlRlTnJ1Z2NIZEQzNDc1ZFZMWWtUeWpxcXk2RGJqamJncXU3?=
 =?utf-8?B?RXd1ekxJRzhTbm45aG1GbGk4OTJEL0RPM0ZFU1VUSkpOaVZOMEY3ZDZrTTRP?=
 =?utf-8?B?ZlMrUWtqQWI3eE9Uek1TT0kxdUpBWFRZTytKOExwbmxmbFhNVFl4VjJFNEpO?=
 =?utf-8?B?d1pQaE54N2lMenhqSDZVajByWFplSUN1Y0p4UXFJcXhoUjkzNzJOVEdoa0Jt?=
 =?utf-8?B?Ni8rYmxvSmlGYU5iaWNHdlpCakhpRy9RWmd1NXpZOUZaK2x2RWd2a0ErMy9h?=
 =?utf-8?B?WUQ5UHJHc3B3ZW9Id0tEMjRqNHRla0srWHl6UUVtellyZ1ZsTmZxZ2djMUZH?=
 =?utf-8?B?Y3B6aVlXaVZES3Y5RDMzbUJGR0VZNXppR1FRUkR5SjV2TWdKWHJ3ckF1WExJ?=
 =?utf-8?B?dnJEdDhRcUVyQ094aksxam1FcXdLUkU3N28rdmFiSzB3eUxrTGdtVnBncFZh?=
 =?utf-8?B?OHhtY2NQeGM4U1RVNDZYUUVKZWQ3Z3R5Zjc5eTFkd2Y5VTRndUlxZEJ5K1hT?=
 =?utf-8?B?eHNDd3ltbFNDc2dwT3czM1k3ZzIwY243czRsZTI0elpRWER3elU4N3NlamYw?=
 =?utf-8?B?alZNeXdpbTRUUzJhV0U2bWFrMkJDdytkaTJLNnEwTXg2ZnlFNkFvcHNKMUt1?=
 =?utf-8?B?V05hSnpEb0JCdlhLWnJKV3lyZzhOblV6cEFLWFF1ZHBEUTdzcloxeEZSTmo1?=
 =?utf-8?B?cThGWFRyZ2dsbGpoTDNYb25LZXNEcm10RktZMHpPeTBrQWNHc215MWoyamJJ?=
 =?utf-8?B?dVVSMHNsMjFNNk8xNDEzbWdPdWlkVXNJQ1pxWnpHUm9nTTAwc284Q2JmbkVR?=
 =?utf-8?B?QWdyd0cyb1o5c25uKzQrczR0RnNnbUJNWTkzTUNMRVUydmFTWUEzd3o5aFZR?=
 =?utf-8?B?NVo4TmFjU2hLd3BjbTlrcHhWcCtCaFpHYzBIeDJ6cnEwNlBsOVJxVXVYR2tC?=
 =?utf-8?B?VkNkVWtuUzRHQnNiMHJYUjBSSzZ5SXF0dmFzTll5VXN3azJWL0p3VFB1N1Vu?=
 =?utf-8?B?b012L1plTm5XSE5STG5rNWlqb3h4bG5zakxNT05VWEMrcHZteEVMTVBHT1dC?=
 =?utf-8?B?RDJYQ3hvR3FBZWJQdzUwT0VqNDRyNVZTbVNyOEpkWmpEeFkxRURlbmVJVU1n?=
 =?utf-8?Q?/nrPpSrX2RfZK/HcHHGM6Y8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee6e626-4dd6-4401-6b9c-08d9e1a75928
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:11:52.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0CSEikZy4Wv1qhNpkZ/CGcN18pmAgqi2eMw/RTwqeHbe1hHNLxjXxi74eH6h9So6Twwnrm13OnLVXjC5ItoEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6683

1: enable interrupts before C1 on Xeons
2: squash stats update when not actually entering C-state

Jan


