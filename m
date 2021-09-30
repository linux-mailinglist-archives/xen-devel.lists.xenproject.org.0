Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14F41D99F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199813.354090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv12-0004Tq-L9; Thu, 30 Sep 2021 12:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199813.354090; Thu, 30 Sep 2021 12:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv12-0004Qu-I8; Thu, 30 Sep 2021 12:18:20 +0000
Received: by outflank-mailman (input) for mailman id 199813;
 Thu, 30 Sep 2021 12:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv11-0004Qm-QV
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:18:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea89ec4-21e8-11ec-bd4a-12813bfff9fa;
 Thu, 30 Sep 2021 12:18:19 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-DM9gnjjIPzqegUU0-iFPDQ-1; Thu, 30 Sep 2021 14:18:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 12:18:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:18:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:20b:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 12:18:14 +0000
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
X-Inumbo-ID: 7ea89ec4-21e8-11ec-bd4a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3Nsesxu7Ouso1Ynp59Ie6SiuUu3Q+vNIHx5xr527BQ=;
	b=b7vT0lBPFd46VgJ4X+1jQKMszcFIlV1zJ8z4OSxxysGAkbm/pve3kShNtztCi58VJM8dtV
	eWgHf5MElWLxjFzlNbc3Vn0HEYSpnhP1z4zlUnP4xNAZ1H5kdgiK5xSJe0NxTpSliKUg+K
	CRuEDIy2TQRcDULRwOJ7vt+ty6bwgiE=
X-MC-Unique: DM9gnjjIPzqegUU0-iFPDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emqtrX2XYYweu4RAZ2JlfUU8hXYjS/+fjwksUN1LdgDie0U7zsqLPztPfslPqs+/kkNoOxFI9o+cbzvm5egeQSvXgPghLYVc+XvcE0VgHOjpQdEiG69QQyWbJPMq0Nmfk/jUSEPHc7UWpkQbtngCFI93usCpbbwV4/A0jqsQXTVB7nnn2bViBvnTFAhDUlu6mhWGHuj+Q+uAI3P/5eEyD6sNg3IrTuq723oYSy3CSp0psw/ALwkIOSUK7s93E+7icI4XQAg3nory0xgdmb0hGrnId4INNMNYqpoMDne9g5d/i2XlDHmbeq2IQ/ODTFh3l5efblWTeJ9Ad++B08GhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=A3Nsesxu7Ouso1Ynp59Ie6SiuUu3Q+vNIHx5xr527BQ=;
 b=GLoVLo8QPW2jvkBquzDkXsxTG0jIbMQKhu4ZPLYcjZlbKJwQo3s8oUVND7LxAMD/2pnD3xRlvLN3Qpt+khTVBZcATAytNEYO5L5bI7BOoBReD+KvtDIBWW7MRl/IdZul4YJ0ytu9oL1iVvH/3Z4el1spYnUmea21tjhYjgFsFs3mXpZXqYFcilZNzxestkgpcPiS1MGZJrI/B9cEOpFuAqUz9Pb8LOmaH7HFbovpveIctIm+TkZlrs9ROKxC5WoVV3GFJFLbNsYbXRUIRFY1GMqjFFL24mQzYs474yxYZcPw9D5dPEtF2UBfwS4xy6xMzh14Sa8iUCOMtcmtclo/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 4/9] xen/x86: allow "earlyprintk=xen" to work for PV Dom0
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <d4a34540-a476-df2c-bca6-732d0d58c5f0@suse.com>
Date: Thu, 30 Sep 2021 14:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97f795b8-3159-416b-3e3a-08d9840c6144
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64792007107B6A798A7A0C73B3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3dxdqcnhuYwi/Z7EvOy6I2MDcmOkGcMLwme/dt/7fQ/Rz5Y9b0BcoxCojyfIVI/uUNr841INRG6F5M536DDl42y/SW91yz9Sd5+pzcuEZyA1qa4atGqae7Dd3NEml9VxkX2kbZu1mh9wcWCUlpzP7qjBTMCt7LwZ+/DSFwJ0oDpXICwzVhpXS6P4SQhn2WY5T+9jiSvVEYYhi2z7SGlNlPz6wR1ldaPjxBUyiNlrCZfPJDVL5io2Z6V3IlEpg9rIFjAukIN7MUtQVLHONW9ltivDGjR8csIP19mBPURhL2k666rN6nCw9DPPIl5XRV7F+o6iUlaMd32RMwDMvMA9Meo/XLdf00mQYYEMoa40Lxgvpgwqvq0pSpwxMiFa5UQXVoiECPwEucBdPuV2XRoXcPv1kSt4VCGbMdxBbH6I5Md+jZKHfj/VD2ce6xLm83wyhKRW3hBVRiWmzsoR6KN802dwjQ35FZJsUaK1qwMg7I0BxcbOmYo3eb/uConbKGi29mXCbJxXPaxPk5AU+YlzaduFN79EveAvN4bFvbSeVMlZQ/tdSs4zo+s/b/ip69j5mEtjVaQ+wnxHQYFi3V9HMAiI5YMLoNco4QDxPiS4Pz1mnyDsVxi0NCPalG59415Zo4fHemjV73gvQZLhiSOmDopDb7LQG97DuCh1R3BYs251q4vn8+SdVZSswGZWWPXDl5SbUBcjBBHuJPGNeJ1Xd8J3cLxpD65GeEv/j3OLYMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(4744005)(86362001)(26005)(16576012)(508600001)(316002)(956004)(186003)(6486002)(8936002)(31686004)(54906003)(4326008)(110136005)(38100700002)(2616005)(66946007)(31696002)(66476007)(66556008)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2dFeTc0b0dsR0lVZzBIQ1RuUzd1VG9PSVBUcHJLVEQ1a2JWcmJOVDNGZ3VO?=
 =?utf-8?B?cFk3MFAvV0NwbWorKzJSVG1kajMwakNVcVpIb0hqY1RoK0tKWUUwSzJnN1NQ?=
 =?utf-8?B?bkFoWU5qNnQ0TFhQN1NDNDNvZm53UEhmSFBrdGRUcTJQNUE2Q1lTOU1QVWdU?=
 =?utf-8?B?WjVCSG1CZisyYytlcjJuQ0RLbnhIUkFWWGhmcDhkeXJMSTk0WWMwOFhiYWgx?=
 =?utf-8?B?T2xvVlBUdHcwQjdXZjIwZlVWcnBkdDlkZmtpRzZOOFREcHR4Ti9BdURMamVC?=
 =?utf-8?B?cGc1NHdLTjhhYXlUZjArTUZaSVd4UmE2YUtDWS9GcVozeUJDejcreTFBU05p?=
 =?utf-8?B?czB0bCs3bjBWYmt0RzNUUjdWQ3NJaUJuOXplQUM2VkVGaFEvdzNPbkx4cXlU?=
 =?utf-8?B?SXRyNzNPSnBuYXVjbUd1cW5ySGRzRHZlWmIvY2VVRUdpNWFiRkpKRzdoKzlJ?=
 =?utf-8?B?cWNvQ1lFcXd5eEJOU0t3cmFWa0lyYWRNc2s3OXhPQ09MMU5od0xYNUY5dkNo?=
 =?utf-8?B?OEhqbWNTVFE3UVdkc0RLem9rNjc0SVJoVU1mZ2JoMm1tb3VJbkQvZjVXV21C?=
 =?utf-8?B?ZW1jUDJORElod250dUZkcDdyK0FkOW1TQXNKRmpoNW9MTmN0ZlBTbDBTd1hF?=
 =?utf-8?B?ZnVudDJSTXA3cGhSVENTNUIzV002b0s0MkZVNUJsTDVjZWxLZy9ka2ZGMU5B?=
 =?utf-8?B?K2ZwTGxtK1FlRENhczlKYmJZdUpOWDNVa2cwUDdZL01HK3N2N0I0NWN4WmdU?=
 =?utf-8?B?VFZQWXBFakU1MERMaHBEOWsvNlM5SUhraHp3TURxd0F6YUNaOWlCcHM2Yloy?=
 =?utf-8?B?QTJPcXJoN3hydU9WRENKV1NVbWEzUzJURFBTRzNKMWp5ckZQVDZWMVN5Z05k?=
 =?utf-8?B?WjY5ZkpPYTBtMG5oQXdjeGxjaGt3dGhFOUUyU3JFdzcxOGptRkR5eG94TFFp?=
 =?utf-8?B?Y0JzZUdEUFdLM0hmbDE4WXFzbzRDLzBqSVdJQitBS2ZNbFBpM0ZFK3FVRXpZ?=
 =?utf-8?B?bEtQUEpIbldoMk9zQmJueGhkdnh4dit5R3VEdVBFTVZwRlBxY1o4NjJvSFR0?=
 =?utf-8?B?Nzhlam5oZmV5dlpCUTBGdlh2Y29PamJ2YlpJRUVpTzlqbFFmUjFPRkJYRUtB?=
 =?utf-8?B?Z0thbTZ2MnY5NkdEaWxGeGNxazdMQ0VXVXp0OFIxeVE0U3pZeUVEaE4veXRt?=
 =?utf-8?B?YzhyVHdZSDBaYzNLbks2a0hPMzZvc25jNTRNMktzdGt2bWE0M1hSMndpS0R5?=
 =?utf-8?B?Zk5qclpqZ2Z1V2JERTBHeTNrZkhPNE9Fb0FOZU0yTjY0ZFFiVU5rRHBleXpu?=
 =?utf-8?B?dFluZ290VmE3dXFYSWFtMmYwWnNrM1R2S0JKNVpVdDM4aWNsM0NhMVAyN1RO?=
 =?utf-8?B?MlgwY25lTkR3L0VyVTNmVGs1K0s2bFBMdjcrRUNnL2FIeEFLSDJsczRwZGN4?=
 =?utf-8?B?MHdzaEE1Y0NDTy9udU5KS2FKTE1BbG5zMXQ5b3JiejhpZjh5OFFUdTBjdmRY?=
 =?utf-8?B?cE1WSlU3eHQrMllpd2J5aGRGT3RZanU0ZzZXdWw1Y3VqajlHd0w2cGxhTFlI?=
 =?utf-8?B?a0JFRTZWQkh4NHhzQkRlWjR2REU2SE5USnByMGREMlZBM3hJRloyMFZ1enRt?=
 =?utf-8?B?OTBNY2lTNk1NVG9DNTN2NFF0Q0xCR1NKR1AxZDF6aEl5OHB0MGhnOEYzMVVk?=
 =?utf-8?B?Y0Vxc003c1h6RThGRnJaYk1NUURpVDRFc0o2U2Q2VFN0MmNlOFFCSEpyYW0r?=
 =?utf-8?Q?6tIrI0PS5qoWKsdkOQnxaEttlv2Tv6SmmjhzaWz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f795b8-3159-416b-3e3a-08d9840c6144
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:18:15.7101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PhDoFle6mwMbklMriNVIDQv396oC4+UoGaUr3VQ3/AOcsWIkvnvJLgwhiUCkSQlvH55gtdQOYoZWvI2LfNauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

With preferred consoles "tty" and "hvc" announced as preferred,
registering "xenboot" early won't result in use of the console: It also
needs to be registered as preferred. Generalize this from being DomU-
only so far.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2: Re-base.

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1348,7 +1348,6 @@ asmlinkage __visible void __init xen_sta
 	boot_params.hdr.hardware_subarch = X86_SUBARCH_XEN;
 
 	if (!xen_initial_domain()) {
-		add_preferred_console("xenboot", 0, NULL);
 		if (pci_xen)
 			x86_init.pci.arch_init = pci_xen_init;
 		x86_platform.set_legacy_features =
@@ -1393,6 +1392,7 @@ asmlinkage __visible void __init xen_sta
 #endif
 	}
 
+	add_preferred_console("xenboot", 0, NULL);
 	if (!boot_params.screen_info.orig_video_isVGA)
 		add_preferred_console("tty", 0, NULL);
 	add_preferred_console("hvc", 0, NULL);


