Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306D4AF4B4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269271.463306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoWN-0007P0-P7; Wed, 09 Feb 2022 15:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269271.463306; Wed, 09 Feb 2022 15:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoWN-0007My-Ll; Wed, 09 Feb 2022 15:04:39 +0000
Received: by outflank-mailman (input) for mailman id 269271;
 Wed, 09 Feb 2022 15:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHoWM-0007Bo-AA
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:04:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98d2a195-89b9-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 16:04:37 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-o-4APSYZNMqEboLW9ddFcw-1; Wed, 09 Feb 2022 16:04:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 15:04:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 15:04:34 +0000
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
X-Inumbo-ID: 98d2a195-89b9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644419077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ywwb/AXK6RvMZfa8QkYY8DYs+Xp/vFTpRFaCIs90yk=;
	b=EhKzzw9+ztjMDXfF/DjyrUMeiS0TSUKzazwjj8HoQOa6PcgFR7lNgRtj72qOz+cwalRviq
	8UHHf8vqJaj1gzImZ17glNEnONpI7lyso6NHGtJrUs1GazHsXPjQnVMePzN3u3E7fH/8gL
	C3GOHh3ugz83H6/4KZJ+cvcTK4bTrMw=
X-MC-Unique: o-4APSYZNMqEboLW9ddFcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akdygVXl7UaJL2zVVRFXSWIV54bGT/GQmrRD292tC/noUptcDTzpvQpay/dsfF/b9Yxa89zbT2bw6C793KSMsnh0wfVlolM6frMsL8KCh6f+jbL2PLvlD+f74p8iDv+/OybjchrKlj5bLXWNv5APKWytdlg5jHTPxB7yjVBVlyn54VYFZl2QgsdzUHXhtp2CktagwjecaWWHxPO+FiKVrXsV8ryT4I17vTQD1PYP5V24zoaDweTvX1hPpfXGNUBcd3AxymU1viwU+vdMozMscChgLgV8RMUL5B2f6U5LnfLXCNTJzG+fDVHXOihFqtPulg89THpEVj7hoSbpWJC1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ywwb/AXK6RvMZfa8QkYY8DYs+Xp/vFTpRFaCIs90yk=;
 b=DbdI6Pn9sylQ762qeDXarSCwZhu4n1o1PjIAtjCfyqLaZaWkqQfXB3CIZ8bjNfHEGgMyIl++zBiEOXqopusyojHyqFeefyiXWIocQhxitPJ8Lp4IHBK2OEOUOw5PkpzfZ6BtlAgqZFTgOePK5xgRPqSYYbVjuAhwSEpIFJrk1okCN1btZAsUhheJMF6Sh4bD7hFqsgktRBRxbo0QtlUHr//+rCR7ochZIA8By0oxdfNsy6dO7fw/F4f2hwplSSYqSnIOx/DKn7t/pTfaZNHIJ8UvwplTQNUJOJT7ujhJ+XDb2km8NPCANpT9ccScFJDyx3mxzFxORBhCNzVHrsZOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <909eb105-c91b-aea1-c0da-c8ec59c5721d@suse.com>
Date: Wed, 9 Feb 2022 16:04:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] x86: Use Multiboot framebuffer
Content-Language: en-US
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
References: <20220209130907.252-1-dinhngoc.tu@irit.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220209130907.252-1-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a3ba027-4ea0-43b5-1fe1-08d9ebdd7bac
X-MS-TrafficTypeDiagnostic: DBBPR04MB7771:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7771EAB1531F30CD241F4E7DB32E9@DBBPR04MB7771.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xAasQtWsVwv4XQzO4Ob2NfOeVP2jTnnyt3lJD1HLTBkmKsJO7/mghRU6LTKui008iQ3wOrXgxuXo0fa92040wvR+6Jf3oYywz74NMpH5M6gpEm1Qxvbe0c2obu7cZTSBgYiAYb4vuGe0g2+eS+3h2ZR+KtvuYp2F71+sQc6zvwlIGmzoXPKu2q1rwMVMt/rqkLZLm1YrfEGq5ocg2cL9K0B06OLDYYOl5v1Bk85E7mE7koQW3M8nOLl66DtwW6EuvIs+dIaDsRo3/VRXyYrRLZEZaZ7k0hyi+kFBtp9UEkPN2lQfUr5ChL1iG2BvSrbbDG0Kp8uSA3Wnl2hXIT9f3W0Aw+iSvajOflu4lwS+wEeuEHyn5FK9XrIiHuBApw+p/jArBn8WElAFFBvFo+Pk8Su/hIFO5Rim5qVM6fxna7cnVwXS8a8yoOFquzhnVxB3wMHTRsbwiGIcKKZna2c2PKZabXQ+sLQpnfv2L0niJjgJmNeWVGB4PDpVMGtPNptUEaU5Fm6TYVJ5VtVxZygmDUf0gJksmFp9abdhPRNjaJ02WWZw8Sf2O77ZICMzvkuEFN0v0oYEL+yNKDHPShlH3KJL4WU8hIxoI8U9PCtfzo4+lc8gqJjdo/iQ2KSKWe6GaazIqh2kPpSO5yzdhWYJMzGhPjoCcWaVpNKsrWp5GYpOYPveBcsT1rnzMqfDJOiBJYjwN6h/Ekq5wUbaDFDEf4qlKn41DxpXdUd4s2OJXcWirhxEj2uYTTVaCMaXCNdEIf++tdLESNYANqI2dqew/ETmvUb+28Flz/zJpMMyP/xPodzyJBu6tQNwAg6HNQe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(4326008)(66476007)(66556008)(38100700002)(31686004)(5660300002)(8936002)(6916009)(316002)(36756003)(2906002)(4744005)(6512007)(31696002)(6506007)(53546011)(26005)(508600001)(186003)(966005)(2616005)(6486002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkpjc0U2YXp1a0V3K3pxWmQrTUEvcTVVYmJrMy9mcUN3dUs2THVvbmZNMGtV?=
 =?utf-8?B?c29YejJFeFNJYXZqVXRCMkRTNURnbERvRS8reTRWRW41MmhnZFgyYUM0aUJo?=
 =?utf-8?B?NitKeUI0L0dEdVlqc0wydjZWSHo2d2RnQnFHQldSazR4NjlUVENkdzd6MkZK?=
 =?utf-8?B?RFp1eGpNU1J6TUlBbUxWK0RRNG5yS3lFL3BOTk92T3dGUzdlYnRVYkhwb3dJ?=
 =?utf-8?B?K2s3bEtPdjlqeGVqVW1tZ2Q5MXVIaHJkRldTMHRlWHp5TTJQc0ZRQ1RqM1ov?=
 =?utf-8?B?VTBVVmdWSnhsZ2FDNldwanhnWHRkcjB6Z1BvN0pONENMckY0UmdmK2tGSjhN?=
 =?utf-8?B?dGk3OTZOVTVpU0VJbG1ueFBWZkNZRHJ6VVlDRkJTQUdNZ2JBekVyQXZrMU1y?=
 =?utf-8?B?UVZlNHpSazdCb0NVbTNhOElWQitMMy9kazQzM1JUZXRCTk9LdTJpdXZGNjdJ?=
 =?utf-8?B?VTJndDRWdHRoVTFJT05yYkY0UWNtRnQwZXR2K1hHZ3ZwaFNXTEprRDI1TENV?=
 =?utf-8?B?WHFYSVZRdUdKdHNjSklWR01EU3NDMGtIbTJMSFRrMHhiOWtrZXM1cGFJZ3By?=
 =?utf-8?B?MVN3bHNVb3Z0QjFqNnNkamJ2TG1QRGZ6MzZHWHFwZG5zdVlZSUE2aTZ1c00x?=
 =?utf-8?B?RE96R1JWVjN5Smc0eEFWbEVLdmNVNlhMOG1MK1RCTjdGSElnVjE4Ym91VFly?=
 =?utf-8?B?ajJERUZqNG5SdWVXYTlOZmREUWJzL1c3aU94VEFPSHhLRGxHenQvbno2Nytu?=
 =?utf-8?B?LzcrN3dhd3NEZ2xjV2E0VmlqZUJybDNPUG9xNkloYVppMWgwVGFackRIeFhP?=
 =?utf-8?B?bGExWTIzZEs2S0drVmd6VEpyMFRDc01ZeW1MSWtGUStuZk5wUVl4WnpUdGxW?=
 =?utf-8?B?R0QvZnZVcmZzc1FYUDFEK3ZRbGJnM296Z3FZRXYxdmxJcWZXTTR5aUNHbjZo?=
 =?utf-8?B?R0VRRE5NYllpREhkRXFodTBiUjEzSjQrQmxEbWZ2WGNHNkpPcVg4ekZqaUJm?=
 =?utf-8?B?VzEyMGZGblZzdW5xSGg4aG9GajVBakprT0xqck12bm1DUkJDbnNSZ1BxVU9E?=
 =?utf-8?B?cWhmeVI0SWU4Y0k0REF1RXBVeUVPczVSZDZhc0w0UzdvWUFQbW1ZdEFnRVF1?=
 =?utf-8?B?ZXJxZUdicEZGalc3OUQ0S2RNMy82YnBKRW9pY2QxWXhUM1dBdzRua2lCVkRt?=
 =?utf-8?B?S2UxdVpHL2d1ZG5IVXcxZEVGSlAxbG9vSTA5Q2xlQWcyQ1RFVSsrOHFhSGlB?=
 =?utf-8?B?Rml1VU8rRW8wWHVTV1Q5Q3I5QndyWkp3b3JONGRTUG05TUxxTWdnc0xhY3Uz?=
 =?utf-8?B?RmQxTTQrTWhWMXlzZ01DVzREQlV6RFlWVUpzcXNjTXhYTUMzOTZSNjZ2VnNL?=
 =?utf-8?B?M0VNbytkZWRZTkpVWGpnb0ZtVERnYVVxVlVqbUlFVTE0Yzg5MjBtMlVnR0FJ?=
 =?utf-8?B?b2tLbXYvYXdnZW5rRHplSExnQnRGa0ZnWE93eDJwVVZGb3pGV1lhMEYzbGRz?=
 =?utf-8?B?ZFh2ZUVWZ2IrZVhKakIwR25xUlhlbU55MUdFNE1RZ2ZKR2EyOVJZNFF0SVgx?=
 =?utf-8?B?aTdteGRwZWliVGpsMENpYVZ4Q3Erb3JCakpZZnhuMkRucnltODd0WWJHNFVu?=
 =?utf-8?B?R1dOVE9Xc21qUGFXZDZVYzNiQmhEM3lxV0lqNXdKaGIzc1MvQ1B4SmVVd0da?=
 =?utf-8?B?MTBpYndGNXYrdGxkd2ZnYXI4cGJmNWJBVWllS0R1QVI4dFgxTDhtOWNTdVpX?=
 =?utf-8?B?bGlJY09sWFpzeVQxeVRWSFFGU1FMYWRsUWZTWlVUUmFaS1NJbUM0TWs0c1RO?=
 =?utf-8?B?SjFVSUc5SXJhMnV2UXg3NXZ1SVBJVmRiblVhVVh4NmFWWWp4bGNWTFVzYVZN?=
 =?utf-8?B?REQ0K29kQm84QjF1djJjT2dzRFpwMEkwdTR4d0pqYVRGUDZVdXFXalhwNGpV?=
 =?utf-8?B?Y2c2VkxoYVRNOC8rTFZYS3ZLTitlQTdMb0NGQk5MbXNkYm1CN0J3ZzUvZ0Z0?=
 =?utf-8?B?ZkVCN3htU2RydkxGQmJ0eDV2cjBneUNLT3VkejEwbVIwUHBDSS9MdTUwNHdN?=
 =?utf-8?B?L245K2Z2REQzeUR6WHRiZi9NV25sNWcyRnFoV1E4QkhudnZjWFlYMG85eWVY?=
 =?utf-8?B?eDkxMndkTitaTnhvV2J3cm9aeHJOQmpLbWE1NmphUW5oT1ZDT043Ymw2MUNM?=
 =?utf-8?Q?3roGFMcq8wWCn53S0MPPbY4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3ba027-4ea0-43b5-1fe1-08d9ebdd7bac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:04:34.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EknlouhHwJ90DIB6ja/ZwVMngxBTsU1fRALh+4tWKe885dfftBIzZjqdeTmUo8LvmY6qt5MJa9aFAGUHnO/KIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771

On 09.02.2022 14:09, Tu Dinh Ngoc wrote:
> Xen does not currently use the Multiboot framebuffer. This means there
> is no graphics when booting Xen with Kexec.
> 
> This patchset parses and uses the Multiboot framebuffer information
> during boot.
> 
> Tu Dinh Ngoc (2):
>   x86: Parse Multiboot2 framebuffer information
>   x86: Set up framebuffer given by Multiboot2
> 
>  xen/arch/x86/boot/reloc.c    | 22 ++++++++++++++++++
>  xen/arch/x86/setup.c         | 45 +++++++++++++++++++++++++++++++++---
>  xen/include/xen/multiboot.h  | 17 ++++++++++++++
>  xen/include/xen/multiboot2.h | 33 ++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+), 3 deletions(-)

Btw, please see also
https://lists.xen.org/archives/html/xen-devel/2021-12/msg00379.html

Jan


