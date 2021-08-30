Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364AB3FB6B8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175063.319025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgz7-0002BM-Kc; Mon, 30 Aug 2021 13:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175063.319025; Mon, 30 Aug 2021 13:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgz7-000293-Gj; Mon, 30 Aug 2021 13:05:57 +0000
Received: by outflank-mailman (input) for mailman id 175063;
 Mon, 30 Aug 2021 13:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgz6-00028n-2R
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:05:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c0a22b7-e515-41e8-9fed-4614c4096fe6;
 Mon, 30 Aug 2021 13:05:55 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-dyw5BkivMK24LQqLRkA-ww-1; Mon, 30 Aug 2021 15:05:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 13:05:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:05:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:207:4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.9 via Frontend Transport; Mon, 30 Aug 2021 13:05:50 +0000
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
X-Inumbo-ID: 1c0a22b7-e515-41e8-9fed-4614c4096fe6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5CJMcRsTP8YiUEVz+XgCP0XZj5R61TCRxya50P2tErc=;
	b=Pq61/qpfmRjAnAHyeqJogGQ3LNnRBW5ECneESaJu/w6C4GFvahbvd4ZrwNvyQqUXaVrqC3
	3ZHZHDj5cVxs67CTnEjIqhiAPXqFHX/HRP4zmQZQ/774kobbJVcyz2Ym2qSepT+EHAQHAV
	bEFiMEoPT3NIWmu68UFI65Xyx+27OYU=
X-MC-Unique: dyw5BkivMK24LQqLRkA-ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7Sx/7KVuNeZaizlLP6k+TKAipFhOdNYSERH100VRwTDeq/m39NtlAVSZxHF9eFY0oGIJ30ZV5STWgcSjjYd4TQQz2afMBaL3Rwul4MraZ4kggNf54/nn7XB6kEjjQBi1TW5so86x2FfZRB1+7UpSglrsh/IyGF5tUXZ9l1zydniLDXpU5wXsbUkzt5Ghc/E0uibIqQ+gUspg6Oyh9aERg+v4nZb3vsUEJ/Qv4bmer0lXqiTbKSZHVhToK+u5oswsJIJoLsEo0XkZ2p/RY0r9VupERxRGLm9mltmsTFZsFK5LwOlslLZVB2QmXL6t7eOZAKJbx31TTMJtqHsMtAhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CJMcRsTP8YiUEVz+XgCP0XZj5R61TCRxya50P2tErc=;
 b=bfo6wZd+At0HsS8x5aGlcgxwke1Fd5lhG3qJ8wMDitjhsGsydkYymeXUQtufijfMjnSiejcTUzgnUe1pNOpwQaqnLWhqA48JauSeDqI+nF2OXjMV+x2/FsrQ9gI57QHOsKHLorINs2QCGZr7IyVwsw+tVpSN5HKBBU13qzJPL+1w/hEHAp09OKPN2EVev3aagpdcp1PSB8U0o3JNc5qjzC89rCcLaKwpJ0ommfq49x9LOPNf4SPS2h4vs5kIS605N5UEMLwbgWEK3MrHxKMrjQiCPFEiVJrIIQMLqLQ9UIu3JgQE+DrXtSYX6VCr6JtfdDbuwkEHUupQak+b647bpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ns16550: MMIO r/o ranges are maintained at page granularity
Message-ID: <05d055aa-2981-8c0f-33c6-62139859aeb2@suse.com>
Date: Mon, 30 Aug 2021 15:05:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0054.eurprd07.prod.outlook.com
 (2603:10a6:207:4::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e93b2f79-8e13-44f8-bef3-08d96bb6e492
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23361B67F48EDAACF7ED63EEB3CB9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Ng8LRrmtMzN84pNmmRKxJWrqzNEHSaEMisCo8nG1ubY0TBoTy/bSSkJ48hVOPcEkpnwALTnuxqWz6esNyNQgo3yBAoCZcFGwoWqkDdN6H78tcp3IUUkqgoMqkPXtNlDZxsXFofFVXi849gjoEDHYXXQq52R9N8+07d3Sgh6wSIczpqy1OFdLYDjwhj3An+bzkj5sk2RzO3j7a5STOlF5G1qv7hhbImoTTcUXGysEq2yTsDlJpdS2j9F1cz2Gp6J0FkOa4+6F00u2655mJ0uuFCK8/yP4qzeY6SFl4/6EvyYCKVRFwoDbKHbcbN0ESP2UHV6hEcoHMJZlQGwASS5lHM5P1xH7UGOw1/Ut6ah7xL/pK1c/CcybKvpvgyPHZrEINAebLsKFBYwqBsOTOkVk0nqUJkjH5LpmIzUnJdGOtLIYI2pT+9MTCoc6FS5PiL70U/O2asxqtotjRX/16ViCXHlfVNcwsGC+d1YtbqaEZo9I6+UK0S/2opHaZMYAs7P3/CMcUnZShxaDLIC5KufIGzxOCC71YsfHEzT7LHmPdxwWV2QLxCiHP789DfxSsIWyMKBAVFlC7nw3MPLhABQb/vEoxcZZYHCqBftSas1AuOmnKV2MvrD/yscftf0plDrW60bQrXw1GTrKf6J42RFqzIBO9Dj1nRl9SpbjuByqfGhPCTj9hGxPON4QYhYpAbQv2154aY6ghQKLjjO3NIIfeTsSIKydsizYSnP74lWOCk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(376002)(39860400002)(54906003)(5660300002)(316002)(478600001)(8936002)(2616005)(16576012)(6916009)(26005)(956004)(36756003)(8676002)(31686004)(31696002)(86362001)(66556008)(2906002)(66476007)(66946007)(83380400001)(38100700002)(4326008)(6486002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1llOUNSb3krRFU3czNIKy9ySUcxbHcvNzczRm11SDFHUDJPN21XbWVtdVp2?=
 =?utf-8?B?WloyM3N0YXc4amN0S1dXZ1lNaThQaGNXeVlYU2pGSlBvZk9kZE5PSEVEd2pL?=
 =?utf-8?B?SWJsZEMxR0RuYUZYbEd2OFhvUk02ejJWdldlMENzY05RSktpUk5nemNUamhC?=
 =?utf-8?B?US9OdlM3M1BMYmEvaVNpU1N4NFdnNmtPQ2hjd1Fwc0djUXN3N0pKNXA5Yk9u?=
 =?utf-8?B?amVxMm9JSnpKSk5qOXZXdkYyNWhrTFJ5NzlSaDNSenlxUElTZHMweXowNllG?=
 =?utf-8?B?RWhybjFZWStEUjYwVlRXTDZOQ0U4R1BCMFd1ZTBQcU85UWIzOFVEMGlRZnFV?=
 =?utf-8?B?L2xhWkNxNDE1cGRjWFFHRCsrRDBuWVdVYU45V0ZmaVZQMkJYRC9YUWVtNkdT?=
 =?utf-8?B?eVBYWEtBSW9zVDd4djVUc0V6QTkxa0cvSnZQdWxadU5IaEg3U1JzQ3RiUEFK?=
 =?utf-8?B?Yk1NZjkzWjNUNkRwd2lIN1BUSWUxZDd2dE1TSjlGdlM0QnZkR3ozVTdUL3pB?=
 =?utf-8?B?aEVHMXlKWWFObHVPWGt0UkZjVUZnbXN4cXVrUnJ1WEp6RkhWTzRRM2Mwb0dQ?=
 =?utf-8?B?eFRVdTdRcndJRjhEckgybjRoci9yL0Z3ZmZ6MG5LamEvY2phWkxSeDc5ekZn?=
 =?utf-8?B?ckNyNUJtbWJiWFN0MVlmbzNIeGU5U2RpY01adkJYbE5weUZzblV3cFFjZEsr?=
 =?utf-8?B?VDVNQkV3SkVjbFJsaHAzSEhaNXN0Y0R6TG5sUW1NR3RsdXZmckdETUV4Q3NQ?=
 =?utf-8?B?Q0NNSnpnbzdnbzhyMEplOWJLc1drVGlWMVkwUFVSc051WlVkTGl3RFRVM3Rv?=
 =?utf-8?B?dDhCaWc0dlgwb3dKd1NQeXBhT01xdUkyeVo5YnlJWnNWc084Q2d5YWpTdVg5?=
 =?utf-8?B?YlJ0WXBPVFF2VEJ1dk83NnNmVGNrSmM0bGlMYXZLZHFEZXh2OVR1Y1JjcVJO?=
 =?utf-8?B?R3pyTVpnOFBzR0EvLzI4WXJ6NlhuOXg5ZlJ0Uk5EVFpMWVcxbThRdm1CNmZq?=
 =?utf-8?B?NEV3K3RiV1pFOXRMenJEU2Z1V3RqY0oyMUxYSkhZYXREWC8vVXpsWGluMjJu?=
 =?utf-8?B?UHVlUFRWNTVtQ0tvZnNUbk5Ycmk0dXVIS0lpM3FXeTUrVzBBakNlcDlUREZ0?=
 =?utf-8?B?Z2UvUWFZSmdqU3J2cUsxdWZycU9CSFBIYXRNeFNxaVJuZUMwT0l0elVYVzhQ?=
 =?utf-8?B?MFBQejBadWxybE53ZU00NFl3YkFucktGVVNVZEJnWURJSUk2TFRzQUJnR0Ft?=
 =?utf-8?B?RWdRSW5IbmVpZVNiZGlNZ2RTTUkzeXdyQkJFdDJTUzhjSHJYck5MVEdIcldM?=
 =?utf-8?B?UllTc09nWHlnZUtuRmRDWmpQaURIbEdCdVpjS3pNOHQ1dEt6TjByenVCRjIx?=
 =?utf-8?B?TW90cXh2QkU4dHdEc0dKdGQxL3ZuVGxWbFQrZW52WjIwL2xaSWtjOTA5VVlV?=
 =?utf-8?B?a25ITGVJM0lsL1RFRStMeldRZmYzVG9aLzhDQ2NJeUltaE8wd1VCa2Q5em04?=
 =?utf-8?B?OENweUx4YXNIcnZJd1RjaFF2OHAvbU5YcWZnMjhISmg3Wkc3TnQweHBXRW5D?=
 =?utf-8?B?NU0vTDYzSG1rNFA5MWkzd0llaEpEcWd2NzJCU2tpaEs5bDAvSTdtVm54RHVO?=
 =?utf-8?B?V1RHNkdDODJxZ1hkbjNOSzBhbG44T25XVWtSMGNkYytLblJXTzRFa1IrdUx3?=
 =?utf-8?B?T1ZKS1V5SmdjaDZVbEc0VXpTRXM3LzhCZjU5T3ovNGgxRnMvTVgzZkdGWFVY?=
 =?utf-8?Q?dYBX7qWYP3yVEWOOhvxTn/fbBNlDUPKuPXGoJYH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93b2f79-8e13-44f8-bef3-08d96bb6e492
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:05:51.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNaW9Vm2Yq7l/ZnWyYKIa69neD6BJ8HZ6uX68frbHtYJV4nG3DEHjWe6XbmPHaF8SS3mW6vgIQbEw44d4lwaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

Passing byte granular values will not have the intended effect. Address
the immediate issue, but I don't think what we do is actually
sufficient: At least some devices allow access to their registers via
either I/O ports or MMIO. In such aliasing cases we'd need to protect
the MMIO range even when we use I/O port accesses to drive the port.

Note that this way we may write-protect MMIO ranges of unrelated devices
as well. To deal with this, faults resulting from this would need
handling, to emulate the accesses outside of the protected range. (An
alternative would be to relocate the BAR, but I'm afraid this might end
up even more challenging.)

Fixes: c9f8e0aee507 ("ns16550: Add support for UART present in Broadcom TruManage capable NetXtreme chips")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -421,8 +421,8 @@ static void __init ns16550_init_postirq(
     if ( uart->bar || uart->ps_bdf_enable )
     {
         if ( uart->param && uart->param->mmio &&
-             rangeset_add_range(mmio_ro_ranges, uart->io_base,
-                                uart->io_base + uart->io_size - 1) )
+             rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
+                                PFN_UP(uart->io_base + uart->io_size) - 1) )
             printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
 
         if ( pci_ro_device(0, uart->ps_bdf[0],


