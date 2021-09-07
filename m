Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF840282B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180902.327770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZq4-0003tK-W0; Tue, 07 Sep 2021 12:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180902.327770; Tue, 07 Sep 2021 12:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZq4-0003rF-Sd; Tue, 07 Sep 2021 12:04:32 +0000
Received: by outflank-mailman (input) for mailman id 180902;
 Tue, 07 Sep 2021 12:04:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZq3-0003r7-AZ
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:04:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c166c816-0fd3-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:04:30 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-1WTDrmR2MLyfRnbNaWU5jw-1; Tue, 07 Sep 2021 14:04:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 12:04:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:04:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:208:be::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 12:04:26 +0000
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
X-Inumbo-ID: c166c816-0fd3-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUjiZ+FcARWZPfFdze9B3FWeG4LoDQIbpj7UKsZHujs=;
	b=Qg/AlsS5lskTedWM7PBZtc1T9M3UnlHNgaXHI5xEZiSzMq4mgEMA/4Tfkd06ub5k7A1nym
	EzneuDDEenGhF9w9DpmDJBZcWb8yfhEUN98MKruMkhMVJIy3IRs/85Zohq4lhwj2fpqFCn
	qq0gYMMRPR/L0MyPW66A9eFqRyNkYRI=
X-MC-Unique: 1WTDrmR2MLyfRnbNaWU5jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWqVnRoSMtkkKoLxFIHeXIgiaJovVpi2T/C6/AsZB7qDEw+xtIrewTpygFBpQZZoseK8rv/oXPeqB/Kza9pJ90bRay4WbZJj7ouIFUIA8vcb/6Q9ZGxjOThcrIIGWqZGjuqEo7RoLMYwhGcZbyvUu28tXdCKByKfWxZMD8a0CTqjWYKz1pu1b4r42ZD4nZOJy9EdJv+9mAK18zwcpqqbMkYXrwHVoY90wnTudnjsEwyz7cCtferfkASLjI4MFjnMq6vxo7WfJr4FgGcQ+vZyfr0D1iJZv01FvTd2ko959+vhmP6sUAuO3C8hIc/CZB81u+pTlRYutm4XWuZzGmkDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YUjiZ+FcARWZPfFdze9B3FWeG4LoDQIbpj7UKsZHujs=;
 b=P/sUORgtT+v0e8U6tOn4IUxrHCYqaVhHrluOs2tQ+UpS42gjQBgVMNtpDnx9DGQHxpUC0onhjzDLvMQMEXKU4ytjm6SUeW8tcXIEF0azjIWi4sDVwQU67lYxbLsF+m0DrXo5T+8fltnBWNvJzwcnOwroomHg9EGY81/Ygjgb9tWq7BJiXssn3FFbywMjF9Jl7u+BBnrECVbegyPrEUE9vtXVBZzJqDvQmik+bI5pP4wcbvWeNdWKLYnyim7nJTGIbZq+I8lJI1vQ1pz27lm+AnxS6LJ5TO3IRV/dqLadTHtTLOjFwN/Ktxs0sBXMmLdH2IKAUmXxYSYzAmv1NyBeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 01/12] swiotlb-xen: avoid double free
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <ce9c2adb-8a52-6293-982a-0d6ece943ac6@suse.com>
Date: Tue, 7 Sep 2021 14:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:208:be::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921de9e7-79f6-4e70-1d37-08d971f7a410
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312004B434F20DB2E967D513B3D39@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cTKXp63JMT+BOej5u6mmIeFwoZz5HLopoCNNDmsPAfAJMiZxsA7fw2XDuaefcIvO/z9fhrHpmzco/sPf+qbyEWQg2kNkrv2VEjOuVlrroyMfcvfE2I072EhTZ1sYwOAc1jeqdzuboiL5weYhMRsPIXWe+DIR2ju2+eV2gX4NzVHEYcxK8AkcxTiQh3EWAWkNO8R8vcTAQL/f2fMwEKP4lGofC0XzX/eIOLDHvw/pRPFI2ActBVdpN3zwUA82e26DNpRS8NrPCkA7DK00nB9WbruRgOrp51QMku8GZG1lx0MhjqfqrJKVaQ3b+rTLsh5EoKVGfmNYXAVg2gHNsrHNi0qshYakSNwtE8mIYZxNvmtXSIqEIFYN+/gP9sHzd5Ww0lctLsRQaCuKlXMqNpPC663xQC9eXQstM2YVJ+W4J/Z6n3UbLvecHEpc0gBz/2gOKgBt97MEmkrGnDeIXhlKq6QIKAwxWBJmE0apSNBNLGqGHbfkdTSfJHN9vBPz3LHEg4NhZ5vwOF1+SoOybfIeL4a9wXdbtQUJP7s0WxoU7yHZlpmA/KAvYbnxx4rOJDOh8QTU+NxyXwnN0xWQemY7TAslj8ZaxC+dVtzeDeRk8wBSeKHml5NqiBusXJpiUX5VjwvtW9/D2f01BHWq9iRGvuBywI4/e3nz4tikmbBjWksPB+xjrhKgnvo6msIQwlogf8IsKWSeMjRmMhRHvCFrj/JYibGZmYHfIFLdDz5BGHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(956004)(38100700002)(2616005)(86362001)(316002)(16576012)(83380400001)(26005)(186003)(36756003)(4326008)(2906002)(66946007)(66476007)(478600001)(66556008)(5660300002)(8676002)(31686004)(110136005)(54906003)(8936002)(4744005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3FudDlzTVc5RUZZeWhhMWJyUEx6Rm5IaXAzWUZ0MmgrMUcrYjJNK1VMYUJS?=
 =?utf-8?B?U3paOGsxT2llZDNNMVBaakdUMEtNTzBzNmJzMTJKNlZmUm5oeXZhS05hWEhk?=
 =?utf-8?B?VnFZdGNHK1o3cmtIR3pIRzRFQVdjUzc2d0VkdWtIQlpLbDFWOE1WTENQMnRi?=
 =?utf-8?B?b2pUR3pQc1p1MUpGZ2lZRklKRjliRWdEYkZCZGhuQmpYdVc3SysvQ253aG9P?=
 =?utf-8?B?d1lHNDdTMXIxVGdOZXIxWUE2STluVjRPTVhoYnQxcnNtUWYzU0N5OWhqTE1a?=
 =?utf-8?B?VnNlMWNnL1hhT3lJLy94TW9jbzVnY1NnaVlpd1ZCbXJrV3k3ajIyTDRiOVZh?=
 =?utf-8?B?Q2E0QzJGL3dqVThtWE1UV2pYVTRQUmpqRGZsdkxMa1BDSDR6ZTA1RW1NWjBP?=
 =?utf-8?B?NWlaMzEvUjNidEpjekpMUmdQMFZkOVZWRnArSTlLNE1MSFdKWXkxekdIcWla?=
 =?utf-8?B?NElCck5iS0hudjhpcGoyL2FQS3hlVGZhQWEvWnI4L3lVOG5hRU12VVZBeHNN?=
 =?utf-8?B?RmhoVmlkZjViSUVyaUw1OC8rbGtCTGQzZHJxb3h0NDFTdzlRbCt6K1N5Ylhn?=
 =?utf-8?B?N1pFNE91ZHJZTGZnS1NqYkRvVWh0Ukx1WEg2M1Z4cC9FT0cycVJiNDFldDJF?=
 =?utf-8?B?dWJXY0VqVWxQbzF6STZHNHdvZ1U0NTB1dVZiT01sWHpBeXNYbnFpZE9qTXpZ?=
 =?utf-8?B?Tkk5OTZrVzhCY0JlM2xFVG4zM25xRjVnSncySXIzYjBtdGV6TUhxWFQweVJD?=
 =?utf-8?B?V0hrMEsxWmN2L3JPTjRIU3VIbldoZTRFT3ZnbW1PckZqZUcxbTBzbG15dWc0?=
 =?utf-8?B?cUx2T0h3WWQwdDFreUVGMzFMTE1wM3NtQjZ5ZkFuM2NvWWhXN2Q1VDFNV3ow?=
 =?utf-8?B?ZUp6R3BxOVJnUGVZY3JETnRya3d4WGZXNzRNK0I0VHpEQ1BLWWFiRE5KTkpY?=
 =?utf-8?B?VzUyZXV0MlBoY2M1VHlTaW8rRWxBbHZmSzhkTHloRFlSS05TQS8yMWxWY3J4?=
 =?utf-8?B?Y3FaZ1Y3WVZjbWJaOHBsdnlSaFRMTUtIeFd6T1g1WlVDOXRqWURoWGRZc2tt?=
 =?utf-8?B?a2hjOWtDTDBLaG5LaW1sUWdONnRvWkdSd1R2NVRhalhGMU9PM3ZkRTJoU1Vi?=
 =?utf-8?B?QWc3OUF6c04wZ1BwQ2EzYWgwRC9HZVY3cmhlOHV3YVJiYnZkcUY5VHhhV2sr?=
 =?utf-8?B?MFV0L213TXZncU52KzZJeTVncjZHQUtqbWFPdFN6TnVEVTRvQUdBQmh1MFo0?=
 =?utf-8?B?WmpQdEdOYmM1dE4xMy9OTW5FbVYwTU4yRllvakJvR1B4b29La2dya2FrSUJC?=
 =?utf-8?B?cjcyZlpVZnB1bVVaVzQ0Nm1rL3QrS0FxbFp6MEpWQ2pOWlA1Q2hkeHNoTVZu?=
 =?utf-8?B?QzJjQlNJZGZMMU41UUREdTZNalRlRnJycU1IdFVHZFl0MzR0d2ZReEdTTGRa?=
 =?utf-8?B?L0xpaUJjdDlhQTk3bkE2MkkwMUF2Zm9DMXR2eFZsVFNGVHN5K3dPdTdaQko3?=
 =?utf-8?B?WDFzTjQ5Z0JOMEZtc25KQnRzZ3BOZUdjTlp1WkZjM1FQSnpoSFhqUGUyVkRs?=
 =?utf-8?B?YVhObzRQMDV3eTZsRXdsTHE0R255SWtVdVRKbTVNYjQxa2VheTIybXpTM3Y3?=
 =?utf-8?B?VVNnOWNsRDY5OENWVU8yckxqVVBrY0E0ZUVQUXNDSzdCeU5sNVFwV1JrbjJH?=
 =?utf-8?B?NWE2TldNR21oVm8yV0R4SHdubTRqZ3RRVEtuR3FOelJBbnlHRkh5MFdFTmpW?=
 =?utf-8?Q?WAG8SzkZU1bnjyZ9mtOD9I9rNAZYcDqmM+yfsrP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921de9e7-79f6-4e70-1d37-08d971f7a410
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:04:27.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxmyLLc2/qK2sEN83kbQC4/qg3WM3+6UGQu1CSP/kkah2+uudkIas1308gmuLjq4QwRWerOTYZ0iL0+NKi/ObQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

Of the two paths leading to the "error" label in xen_swiotlb_init() one
didn't allocate anything, while the other did already free what was
allocated.

Fixes: b82776005369 ("xen/swiotlb: Use the swiotlb_late_init_with_tbl to init Xen-SWIOTLB late when PV PCI is used")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: stable@vger.kernel.org

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -216,7 +216,6 @@ error:
 		goto retry;
 	}
 	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	free_pages((unsigned long)start, order);
 	return rc;
 }
 


