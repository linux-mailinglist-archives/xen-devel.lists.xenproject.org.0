Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6861841C1D5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198956.352720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW6r-0003Pu-W3; Wed, 29 Sep 2021 09:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198956.352720; Wed, 29 Sep 2021 09:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW6r-0003Mr-St; Wed, 29 Sep 2021 09:42:41 +0000
Received: by outflank-mailman (input) for mailman id 198956;
 Wed, 29 Sep 2021 09:42:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVW6q-0003Mj-Gw
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:42:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01a44e8a-43e1-40b0-ac43-f9a34e6c3f33;
 Wed, 29 Sep 2021 09:42:39 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-f8SUCLSMMBS9Ghzb7whrQg-1; Wed, 29 Sep 2021 11:42:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Wed, 29 Sep
 2021 09:42:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 09:42:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Wed, 29 Sep 2021 09:42:35 +0000
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
X-Inumbo-ID: 01a44e8a-43e1-40b0-ac43-f9a34e6c3f33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632908558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLIHrV3tAS35bw50cNvZyc6rMif9PxUtegze2vI4lwY=;
	b=VgGKXLu+fY+Qb3WxUUdcZjxYZwNl8Uf3GvqXwr3TZNlBhDU9QdA1MEPZx52hfgwtApim2G
	UdBrL65H0Nk7uYiSuR1s7EJwC2WWgP1Dhg/s5Z6UP0mN3HuxyAqb0x5ZP6eIX/ab099dCC
	I4i0nRWwQPlAzuubFliMnj7+7MUBSUs=
X-MC-Unique: f8SUCLSMMBS9Ghzb7whrQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOhnbwJ6RW4GGHpRGXWyDQR8HD0efmyGHTSmFA1GUppXsd+kZoSoeOSUuCfKuUYeJ87IQPh9teeINy4/HRE7lMWKO3dRf2875LbO4SoNwNVrSa4tiIVKkqiGUbWTQKRePPnrrXI0nx6EsdjwzpyLVwdCkUs/GUL+xTAivvB46B20GiL50b7ajrB46sv3qN1gwCLEJ6yA9Ooe10UqhPu7OtE63+cwnQyP4ocH4w+67ESCDVCUMZgBhYCQX7XbuqsXljjYW7pMSFrVBzn2SqPenIvV4+S5xGr3NrqPDXB+/gqiiS5hNRK4rYdhrQ7bUZQVfgZ+FVOK7zfHoxlrRM7gDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oLIHrV3tAS35bw50cNvZyc6rMif9PxUtegze2vI4lwY=;
 b=TbAPriCDm+1TWb9PRb7gdUnhZPs94+R+0U7PlQ906ThB8+hc0hP7b07532LtejwVMRzzkxnQsLDKYiFRYPOIoiatkaUHgIYwUFUNlc5Pb5HyS1V0F81fXgYBIV4Ch+Lx/kt0wQ8s9JonFmPWA1SzEp2iIJ7R/Il0+cqV4qKHmrb9qupUJ4Flw+jyisoomICosW8idKm1K8wZmJSeP+0bANgE3yCeAOsHVXW1O+Ajl/ziYHvs7qZYf8I7sZXB1i+wPUV+mnNJH4P27aecQmX0mxbOULEmVkxoby+KAsbn/OES/rXyWYRVwuHbtzCB5EaKU7sd21n4rHgiOFfjpAVqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/3] x86/PV: make '0' debug key dump Dom0's stacks again
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Message-ID: <268da650-1261-0ac6-9908-7916f0b4d2ec@suse.com>
Date: Wed, 29 Sep 2021 11:42:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d9e66e2-a46f-4efc-36c1-08d9832d7805
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152699CDA74E15B23091520B3A99@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zM9e/6QihDAFCTwJt+Rvv7YlzATzQXgmqDSk4U4yQDCo3FETTNUX0P42Hb80iKAdx82cHmOhmw0dqKMEjLp8A9udPLAZkj1O+6DbMp/us76tNX4EZucdQQUlF2DL2vL10wjiZGuuhDF9hM80vEVVUL8pWtg3mDXI39C2nhzOBaW2TndrIp2a0LHyPWYP39YghQv2aJAAcKh5S9H98hpaue+tLwaEXaYtMXqorA4+HuPvdBRAtr91C2VISLDBqmTEqHCfro+0jWicoqf8a1eoJws5Mi5L1PWVGbokfDyBpaMZh5MEbupJF2MkehM/bn1/0ayBmAKLGdeTraPIrhFRjYdqlTsSjcoyBNv8JNF7GnQPU9nUVB4sxtfGfmCeHiugtIoVX07mLzg1CWrrKRbTS3zxMZwUc8WGwGfGf51AphpOlBoOToOmCd7+EPjcFnc5LaMTCqqUWw/z1NLMS4mUnRtWoKgI2hzNw6euYYDfHWwHC0KeBA5q0RsAkTQ4c+TdpTMVxnSoMkGQO8qbKftIcDDOgHhkg/7BA/OQ/FuBxPlhZeGsQR/FlImd1noQVPS5a8PnXhKBWlqYp5BHkUAjAtbVM/Bkpv4ElV9XJJXb8An1Nf5ESrmFxjaw3E+fhvNMu5bmJT+F/1OIf8kyJ42ne/nO0PjYeZIwUM5WK1ucHJtpG2bwGm4ibT7AdyVIvkPDuP4I/8VVRKCsTrpO4aaf9yz947cM69/jIy7UvdZCIUA0nMFlOUqsneFOmpHdDUid
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66946007)(508600001)(956004)(2616005)(4326008)(186003)(6916009)(36756003)(86362001)(2906002)(5660300002)(83380400001)(8936002)(8676002)(31696002)(16576012)(316002)(38100700002)(54906003)(26005)(6486002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkdEYlREbXhDS2xsYkxsRFZyTjdzNnI2Uk91WGdDam1Nb2xHWVUydnBYRlR1?=
 =?utf-8?B?NW5VT3pHaUI2MFBjRkhpR0JLck84cng3WW9nblkrem42d3p1OXV2OVMzay9H?=
 =?utf-8?B?SHU4bFRCQy9taGNRL0lpbkRhWlIyZzR2T0xPQm5TdXQzWWdYc3l4MExjUUY2?=
 =?utf-8?B?ZVVSYjhPc3BQd3hKTmVBaVQveTMxSE10TjY3ZXFLaFVhU25QdWxRblpZbVk2?=
 =?utf-8?B?Rytnd2haWHY4Q29qV1EwbllyQlVkK0NpOUZoWkk0aHQwN3NGa0dyV2h1V1Zr?=
 =?utf-8?B?ZXdGcG41RG1xNFRYbjFxaEpRNHcveVVBWXpFWXNJaHYzMkpHR1Zxam5mYWxF?=
 =?utf-8?B?VXFpTDZJbzJsZmo1Wk0wSDhqK0hZZHVNcW9TLzNwN0FvdWUxRmRNcTBpWmtr?=
 =?utf-8?B?dEUvMnNjMVdwRmpmSHYwUGlRQVdyZHZlMThxSVRkU3ZXdWV6Z2daamltSE1O?=
 =?utf-8?B?Qy8vMjFzS1hrU3MrQmNORmlaMzU1WDlOMm1KWURoZHVONjY5d1cxUUd5QTdY?=
 =?utf-8?B?ODlxbUNGL2psYWR1WjRzZUl0Wi94NHM1U3h2eEtaa2srNEZSTnV5eTloVFlC?=
 =?utf-8?B?QXhLSVNrM1lkTVhNd0xiWjBYRjAxTTNrT0lFZjFRZ0lsc0RsMlVXTVFOMUNJ?=
 =?utf-8?B?K2owa1N5ZlRqTWNJTnI1R1pQSHpKeDVzYkEzeEp5eEhXbzZxOGQya3NtV3N4?=
 =?utf-8?B?Q1h1MEdMZ1FIYWZxeUsxemtmcTFPRjJIZWtRbmNDOE85R0VEQnNNVE9aRkFI?=
 =?utf-8?B?SzRKckFYTlNKTFFKak5Vang5dVRNdW5GTUVJYWtyZVM4SzFuMHZTSCsyeDdS?=
 =?utf-8?B?c0xiNm91cHFzQVR1bTJHUk0xMXdlQlprdmJIZkZXZVBtQ0RNZlpjeVhwS0xS?=
 =?utf-8?B?U1pPVEJDSlA5cUxsRjdWUEdCeW9Fcy9Sem1nZCtJUFRMdzlJdjV1TTlBZFRS?=
 =?utf-8?B?bFRUc1BuSlVDSlJmRU5ENUR0V0w2UW9rbWI0cCtXVFVyMTRJdzRsWjdPMmxy?=
 =?utf-8?B?THpLbTkwZHdQYjVkOHdrZlRGQmZsVENOQm8xZnVacXVLdFpGTWNmL0FYVFMx?=
 =?utf-8?B?V1ptckZzZUd0VXA1OWhBbHA0NnREbm52TEc2TUJSN3k5YVhuUTd3N1pydmlO?=
 =?utf-8?B?alFTd3QzU2o4bE9ubmlWeStGWmdVV0l2ZXpCSjBnKzl2aXRTR3BCQ0EzMnFP?=
 =?utf-8?B?OXBKZ2lycHo0bXlvSzl6amFKRU1PcTJ6VFFVSWhUdDdoVThHeTRpSXFMaFFZ?=
 =?utf-8?B?UnpsZ0x0aFoyL1Zqa0J2a0hWdHRvTys4aks3SHNtWFVUeXRrTU9FcFdLNTJ2?=
 =?utf-8?B?ZTlnMVRlZGxHWU5hQ1lwZlhVbXptd290cEVqM0FEeWhyMUhJc25jQndESW40?=
 =?utf-8?B?Q0xjM1RHS1hWTVluRVFFenI3a2pnaVVueXJqWGZreU8xa0p4b3g0eXFxalZN?=
 =?utf-8?B?c09SL0VnRDBWUVZ2WHRpUmZhN1ZENk5ZQW1sUHYrSnNyNEJWMEpxMkIwWVJY?=
 =?utf-8?B?K2lBOFJBYlBTck44ZTVvVTNGelVCOVpWYi9iSE5Vb2hJRjZmQ2s5YzZMemVO?=
 =?utf-8?B?TS9ybHBETWRMU1VlMW9RYlQyblpiK3VOby8yVWEzK3ZWazF1akZxODlQU0dZ?=
 =?utf-8?B?a0I1eXp5czJDaWRBd2ZzVVJtTnRabG1WWlF6VFo2SGpEOGprQWY1TXBBRkdI?=
 =?utf-8?B?c0xUYnd0SmJYbFpoQ09rUTYrT09Bd2JLTVJBZjN2REFPNE56OXRuQm1xQnpR?=
 =?utf-8?Q?PScLhkxEnZ9+SUzlktvEQTp4ym+xwV+TyChW5Oe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9e66e2-a46f-4efc-36c1-08d9832d7805
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:42:36.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+QiDNiXxTVZ0rDwTT+UpNSjUeB6aeIjrAULzH2vNt5QkSlxCuK/wUaZhYxNl/h46xrcWv8a7E46OIqyVCyHtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

The conversion to __get_guest() failed to account for the fact that for
remote vCPU-s dumping gets done through a pointer obtained from
map_domain_page(): __get_guest() arranges for (apparent) accesses to
hypervisor space to cause #GP(0).

Fixes: 6a1d72d3739e ('x86: split __{get,put}_user() into "guest" and "unsafe" variants')
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using get_unsafe() might be an option as well, instead of the added
extra conditional.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -275,7 +275,9 @@ static void compat_show_guest_stack(stru
     {
         if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
             break;
-        if ( __get_guest(addr, stack) )
+        if ( stack_page )
+            addr = *stack;
+        else if ( __get_guest(addr, stack) )
         {
             if ( i != 0 )
                 printk("\n    ");
@@ -344,7 +346,9 @@ static void show_guest_stack(struct vcpu
     {
         if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
             break;
-        if ( __get_guest(addr, stack) )
+        if ( stack_page )
+            addr = *stack;
+        else if ( __get_guest(addr, stack) )
         {
             if ( i != 0 )
                 printk("\n    ");


