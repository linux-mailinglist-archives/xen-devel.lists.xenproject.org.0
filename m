Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8EE4335ED
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213113.371228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoCa-0003XO-5B; Tue, 19 Oct 2021 12:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213113.371228; Tue, 19 Oct 2021 12:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoCa-0003Uf-1r; Tue, 19 Oct 2021 12:26:44 +0000
Received: by outflank-mailman (input) for mailman id 213113;
 Tue, 19 Oct 2021 12:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcoCY-0003UZ-56
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:26:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 551de835-014c-4e54-9a9f-f8611c1b0362;
 Tue, 19 Oct 2021 12:26:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-uVXcQ2d7OOKzZLsBhZl5Dw-1; Tue, 19 Oct 2021 14:26:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 12:26:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:26:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 12:26:36 +0000
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
X-Inumbo-ID: 551de835-014c-4e54-9a9f-f8611c1b0362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634646399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fFu0Ope6IWazlryDmobnN2CzT23uN7rbeJ2sMJC6HA=;
	b=JmrHS4vLupYvMeR7cflhw29FGeV1aLS5QoK/8MN8b7+VUR1ISoAklxlKWX261IQiU2Y4pm
	5WHl5UE72Wb45MZ7wLPIc13oq4qmHLsfBWDnBo9ef29plFOcwwSvA+dviGb2iRQJFLuOil
	vU4bl5YXZOnHs5B0ZLMCz1M1izkwAN8=
X-MC-Unique: uVXcQ2d7OOKzZLsBhZl5Dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/bEVVMFBl8dd1iGe7b9dPoSdmTuihjvcBPvkyI4jDPI9VDKe0uPUEakVMnZeNSgaiRescvJR3NUOQDXotfJ75itzGXTkFSVwQ0doc5Gwuh1LbwZ06cF4G5o0jjpnj856QQDmDScvoUuVxV67zCPsKn198SOsMvKn2iQYpS4QcTYYhwTNpMeCYw7bJrdn5X3ihlBrCv77cY9Zm70eBvWEZgiLPW0WDmPVYf+YKI2ayK31Kd6UUhRB++GR5Lrstr2Xj9Xj4GofsaiNURXyZ4xg+7iCLSqB257637sc3EHgrXCg0Gu3hmyjbuoPACFXsKSDd7LUZqc0qG9mTtl9v12EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fFu0Ope6IWazlryDmobnN2CzT23uN7rbeJ2sMJC6HA=;
 b=Po5mbmHgaJjAh5EY9SH9Ipkig9GTTjGAo1XWoPMDi6NkgcEGpVHmiFOlEyk/tTcvb7D6kYNIgc2d9xfnk03xUuRa5EzUatGXkRnc/YD579kii2G6FxVNYhtIGol8lJpa+Aov0Hc7+6/88oBa4QQl742rN7/izNWAq8rwxdSUwVpBSQ2XuKGB3JcMu54sY1ZCnGJBpZPSMQo8bVfe74/FD4VoBcw5sFwC5b0uDGxf//vRqvX+id6xRxzOXWSkbkHN7q1dJWzM+G4V1uGXUm/DFEQ6AZex2bP/Zn08PZkhq98UedrOW89GXFhx1aO1wScmroNdfhM4ZZnYm46UIFDZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, sstabellini@kernel.org,
 Oleksandr_Andrushchenko@epam.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1634639117.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e22e85d1-2c57-29a3-9f4b-b2754069026b@suse.com>
Date: Tue, 19 Oct 2021 14:26:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cover.1634639117.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a5ba082-7689-40df-f48b-08d992fbb21d
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958285C7D2EEBEC13CAEC0CB3BD9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hfE1nSSNdgBsjPGtmW/Ti78CqMDavQq6pawE7Cdu6C93AfiYbOk6PKSc7JIt8pZm+dt5z7xowEsHdwZU8BZyq9BmNKQ3kDf+8JnHl54vD+fSqqR0KZRPtv8N5fOKfDtjiSol08DwXfbkoXDxTOaBV/qlA45rD6oUdoCKYpHpCVDAPtR/i+In2QRd7/v1LHGLNFZtWDeDcNN0fUwZ3neBIJ6nTih4IhMJ2ifoDqoWFNARH3z13lmI59sfiO2Kt94stmcrIuR41G5e3sBPmYhBchtSGtC1IbCo9wz/QRcg42UvwqIwY3PAxeLtBmBrQIyU8CAcT171g/oESYjIwTonAMFA81Dvg9VH0kzZR2x1w+0a7EYykvXUN3AtI1cTNhTeHuv/CKNobnj9eS4sEA+yaG5MUG4ILJ7xnYi8Ds+ZYAPO+bGeFUxIMONILZFkwBqz9WzzjRf4vuPcNa/4poc24PHQNo1tlAPg3TqKl0DpusL1lM/PYn1H/vlVBEWCbZioD6eFZHtWEAEPvlUAYAYo/E7YanYIrJ7kc9CJNAy/0bu8aoEjacV/295N6iudxypK9aYxQGfjnLBlw4WvJvlv9O+ShFwgyiazQGVRA8OEjbKeUrIo9JryRGY8zHihuKOIUQPRlkkJSXEHhuNPKIkOcFZSF5hBVcg/C/FYX/eNMiRdtgrhG0V/+RomgX3522/454JfLXDEYSvQpS/TxB7Zy/0ZNFnwxyaYmtDiwwmkZWuP8lk0xqDUARD2Mpg/+3Z0CIfgdzgv7z2ECBOzaBNdbbNhpWznoPj9miFdi24X/l0bYD0+gsbSa+CcSB8J61dq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(316002)(4326008)(31686004)(54906003)(38100700002)(53546011)(86362001)(2616005)(6486002)(83380400001)(16576012)(2906002)(966005)(8676002)(8936002)(26005)(508600001)(66946007)(6916009)(186003)(5660300002)(956004)(66556008)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SktpdEZmNEFpcFkxekFLNHZCSGkvZFNZSm9qaGZZb1ZMZUVaR3NwNkR6L0hH?=
 =?utf-8?B?d2RobzlQd3BVYjFMbXRnK1Y0R0VmTklJc3k5Vk5EWnNRZWoycm5mZ3Zpa0w3?=
 =?utf-8?B?aGxaaitaNE5zTEZ4aC9sK0F4M1hvdkRHcTlBOW50VWtSdmxJV2Q3ZkFCMlI2?=
 =?utf-8?B?V3U3eEx3ZHRhSUFVQ3YwMjMrdkFCUFZYa0dXNmhJbjE0YkhMbGMrUHB1NTNB?=
 =?utf-8?B?b1NnK3o4WVZJNXM0VXI0RllCcVZrU3ZmR3FtWUtYTC9scm11NWYwQWVXRjNV?=
 =?utf-8?B?S2twbkVkR2RMMFFzcVRWWHpDQVBTcE9pRkRPd25oYVRrVVRUdzBjcFpvc2N5?=
 =?utf-8?B?d1hicnpJOFkvRGJaN3FQS2VDdGFtOTRoYUNrbFlnOWxDTiswUXRtZUVIczM4?=
 =?utf-8?B?RFA4NXJHKzlhVGNrZnltV3d3RVJ5YmJKd1RzUVNKZndOWTYvTVhlT1M5Q0FS?=
 =?utf-8?B?cmVSYlFjNytGZU9sQmxOS2l3U0d3Tkdmb3FBakp4bEtOK25uTitFbnRMZFVZ?=
 =?utf-8?B?RGI1M2ZsWlNtNCtXMmJvOUtHVk5pMFZNaVp4Q2taTzdiUFpYRk9rSmpZU2tZ?=
 =?utf-8?B?a25yMDZjUnRpSHRydElSSDc0R3FLeXNib3JGbTBDbUVXSTF4WnlONW9CaEdB?=
 =?utf-8?B?Uk1oaEw4ZlNZOUFCYW9XMGd5UVFWcmlleDlieUtUWnFyTjIxS1dZV2JMRkhV?=
 =?utf-8?B?U1dJbEpWSGk1T1FuQ2JZbURQY294d3lXSmMrSWZNTTB5dkZmWlRyUHZITTFu?=
 =?utf-8?B?ZU13L0dxL01adWYySW44ajc0RTR1eWhwTGhNS1dkU2RjUzZqLytNUjR2TFpR?=
 =?utf-8?B?T2VKM2RKdk9sWlp5UzlKU016SUpEYUoxTTM2cmtEWERhNmFnZ1J6eWdEWGZP?=
 =?utf-8?B?UENjOWVpRzdWK3liVWxzUkRtaHhpNVlIRFZBb0lubVhjeFpSUUVyc0V2eWVk?=
 =?utf-8?B?V2JXcjNiYUIwZ0QvbEUvcGdKQWdiRkYzMUxneWpLNUl6M2c1K3RpL1R0SEJ6?=
 =?utf-8?B?OTNGR1hsTU01MmhMUGxHWkRpOTlMQ0dOSFAzbzVaQWdLQVV1R2E0NFVVLzFG?=
 =?utf-8?B?L0ZKT3RhSDU4czlSTUxWU1VKUmRIT2VYTVRxaEwrMVcvVU94QkgyQ25ySXA1?=
 =?utf-8?B?VHFXUDNPZUNTbGNNRDJySnFlYW1rb2ZaWFhManZaeXhwSzRaQmg0OC9YM2NE?=
 =?utf-8?B?REtJZDc4TDZOakZDUVVOSDJpcE1UZDVkZVViOWlkUTE3RkNLblBoNkhxL2R2?=
 =?utf-8?B?WUNvMWRwSHpYMVNyQ2RzbCtWaHAzb1pHQTVKenp4UlkzWDZyMjZSUmVHTmdZ?=
 =?utf-8?B?NEhSZTh5OTNMZ1J6OWhDRDNUUEQwZU9XbitOU0h5eVIzK1BWTWhOV0VYN29S?=
 =?utf-8?B?TkM3elpwSTFib0psOTk5Z3ZZZUxld0cxQ0dKRE12ZTBYT3Y4RVJjVnBvazM0?=
 =?utf-8?B?N2ZsajFPZlZ1U2ZDVlVQU25rWi9HVDZzL3dxb2xuVXB3S1NhU09jalQzNk5G?=
 =?utf-8?B?MTFqWTZvNVAzTW9qNFUxZ3RNWUszUm9SRUFlOCtvQWEzSHd3eUZUMEJ4bVND?=
 =?utf-8?B?SXJSTVMrVERlYTZhZHA0ZTNNUnlhZGdWNFVkb202Q01ueVduNlBueXJvSVlX?=
 =?utf-8?B?Vlp5NEV1U1NKcXV5ZSs2ZXVWaGI5NDlnZUdNRWxaaU5MbEhodi94WnlMWWdW?=
 =?utf-8?B?ZUtkRjdMdFlacU9yeDNCbDV5emZuMXYvMm1iU3ZISFJiYjRSQnVXa2R0NG93?=
 =?utf-8?Q?+oZfGfGLKBaOeTucPPjF+RbQmnulNOD8u4q96uk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5ba082-7689-40df-f48b-08d992fbb21d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:26:37.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeccY+1XzH4tZtfjuLE7HY5gTapgtR0v7hG14U20B2sGumnDx+r3p8L4Hfl2pk+LZFBxcDLcOKuGnG/BzC707Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 19.10.2021 12:40, Bertrand Marquis wrote:
> This patch serie is a follow-up after various findings on d59168dc05
> ("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
> agreed in [1].
> 
> It does the following:
> - enable vpci_add_handlers on x86 and not only on arm
> - remove __hwdom_init flag for vpci_add_handlers
> - add missing vpci handler cleanup in error path during pci_device_add
>   and pci_device_remove
> 
> [1] https://marc.info/?l=xen-devel&m=163455502020100&w=2
> 
> Bertrand Marquis (3):
>   xen/arm: call vpci_add_handlers on x86
>   xen/vpci: Remove __hwdom_init for vpci_add_handlers
>   xen/pci: Add missing vpci handler cleanup

Imo all three changes need to be in a single patch. An option might be
to have first what is now patch 3, with CONFIG_ARM conditionals, which
the subsequent patch would then delete. But what is now patch 1 cannot
come before patch 2, and patch 2 alone would unduly impact x86 by
moving code from .init.text to .text for no reason. (Still it could
technically be done that way.)

But let me also comment patches 1 and 2 individually (patch 3 looks
okay, apart from the ordering issue).

Jan


