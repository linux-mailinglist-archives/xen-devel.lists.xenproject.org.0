Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1270F2C3
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538919.839298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kmn-0006Bl-V1; Wed, 24 May 2023 09:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538919.839298; Wed, 24 May 2023 09:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kmn-00069O-Rs; Wed, 24 May 2023 09:28:01 +0000
Received: by outflank-mailman (input) for mailman id 538919;
 Wed, 24 May 2023 09:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1kmm-00069G-53
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:28:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 442401ba-fa15-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 11:27:58 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 05:27:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6608.namprd03.prod.outlook.com (2603:10b6:510:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:27:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:27:49 +0000
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
X-Inumbo-ID: 442401ba-fa15-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684920478;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mZJTJiNe2yrvWtjAcW+mCPp+FDrPb5c4YG/4tfh/ItM=;
  b=PEeonw2x1utQveNQyd8NLRZTOT/vkq+L9E7egwiXD2tN1kz/0RfpnEJg
   hptEg3u4NTZ31ie+zAmduxY3fzsEIIBiSKS3aFfZlLEPoDckJYg43SJ+O
   B4KEhxwVtQqrE3GIald2ts8V+tT9Ivsssn7wBfUB5j0KtpB5io5h6+HOo
   0=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 108956681
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hJ3P262OwjEVxBaXe/bD5c5xkn2cJEfYwER7XKvMYLTBsI5bp2QOx
 mFLXjuDaPqOMDeget5+b4W1p0MD7Z7XyN9kG1Q6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDE5N1
 eQmDmsxbT++3ee865u6b/VwiZF2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurCd9MSu3hnhJsqH+omHU2LRwEbErljveCmhWnWPQCN
 1NBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQqrNQzRCAq/
 laRksn1GCd0t7mIVXOa8KzSpjS3UQAWKmkYbCNCUgoB4PHkuog4ih+JRdFmeIa8itzuBTjx2
 XaEtiE4jLQIpdEH3OOw+lWvqzCxopnESCYl6wORWXiqhitif5KsbYGs7Vnd7N5DIZyfQ13Hu
 2IL8+CB6MgeAJfLkzaCKM0GFaul4PutOzTGjVliWZIm8lyF8Xmpd5Fd+zF6KUJgNO4LfDboZ
 AnYvgY5zJRUOn2tb6N+fYOqI8svxKnkU9/iU5j8ZNdUfoJ4cgPB+Sh0fFORxEjkik1qmqY6U
 b+ldsKrAWcfGL5Q5jO8TOcA0pcm3ik7g2jUQPjTzR6qzL6fb369UqoePR2FaeVR0U+fiADc8
 tIaMtTQzRxaCbf6enOPrdZVKk0WJ38mA5yws9ZQauOIPgthHicmFuPVxrQiPYdimsy5i9v1w
 510YWcAoHKXuJENAV/ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:GjEKJaEpYT7DllHLpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:qv78SW9vHAKn8c2+zpeVv0M7GeA9TFuG8HT/HhW9A01ASZiJVVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ACBnJvw7bfK49wZuG/kbOAx3JxoxK2Pq3LWUMg6w?=
 =?us-ascii?q?X5eaKDjwrIjS70SioF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,188,1681185600"; 
   d="scan'208";a="108956681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmZcyKOCfnMD1OYEkCR2kHTNgKt0iPwnBM2wMTQ5+NgvUzuAEwhDZEljKTpmJGK35FY6jHxfzLD224+P2mqz9b2WbNRgEVvM4+MzAA6/+v5WKRxhn85WKNXZqwP1bYoZFTXX9HXL1TWcqawjqGMaKreNn2LBmGFW2lOEpE4oyKn9+YDV2KWcbECpk8SYTDw+gy6NL53iFkZLSKzIuVY+HQzzaFmd1M5jJmdegILZ5yQLR7cEsNlHTjsHJe3JHVmluJnj/eSyB1zxeYAI1DCkpKRy4IsCGYZnYBfHuh02ykH2dCFwMi2jUiNY9IJYPefVNEVuHTo44qy17LV8rO9AGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZJTJiNe2yrvWtjAcW+mCPp+FDrPb5c4YG/4tfh/ItM=;
 b=fQzAPBgJb5aAGRZ7/N364/Xk2ELrtq2OwSHaPtOyeLjWM+xupkhmTsXVGGSWKXM+1xivHvFRtQr/M6yNOQpk5H+zyZbqeApihWWDNvHB7+6QJNMaYuiu/IcEFZPUp1JECWvV8Z4dnPK0Sac/C5MjPcqN0aEo+KhVpMoKIWCjutNeytSP4pcA4Ie4J1bxVyd07dF+RuHUszHDwqXcoWP7Rox+sNt08zvj1ZRGOS4ERw/LwUwUXCEOo3x7kq+VwUQUNyj7mfkCuY5NAhT/ElZasmvLapwWqWUc0RkPDsn39ZDjKCQS6DVTXqMD5PTmWnN+QNLm9SHqfUJ7Id6FtnS8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZJTJiNe2yrvWtjAcW+mCPp+FDrPb5c4YG/4tfh/ItM=;
 b=uhRs1dxkm9ppMMa9yIjlZxM37qVo4kYXZPWfu3kX9SIGtZ8KwSiRA/q0OD7T2bpvA1y9TM01kwmSq2/8UcBNhIg3D4GQuSj3NQ/JpKgJMmdxM6RoqCGaLVEz+o8E9AF4u190dYVvTnkXd3urxd4f4qu1aZoF+ANa6Vs5MKTliUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a1c8a1e-ce60-7e52-78fe-f82f21a89d1f@citrix.com>
Date: Wed, 24 May 2023 10:27:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 00/15] build: cleanup build log, avoid user's CFLAGS,
 avoid too many include of Config.mk
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 43165941-ea4e-4c62-1e83-08db5c3923e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rhfi4UfS/thGCn/ljQEshZ13CFlMUgrOMNZIY2ve1/QOlYMHxiKEwfUUFm6b+u8YLZtWxGaIqKPZ5FFN+OzkQRMsGAdxDYHQrj/2JeXJaQqbfNCyxwka3K5/LIr8z6Bh9Wk9OSZny9m1dh786i7BnUJ5nJmVSwhuz8gH5A1vslFXS1SeFt9hEa04oBVkKuNp4/E7Tx+fvXYqgsdsKqqbfHfj2xTipqo+kpg16sw8xW4AL2nd7X21q6ScF2rfaELPlZsRzi2ruu4OZrK287snypbr/8XYsN2IViqAWs8vhJZmjpSjvAAQIlPwahkgoLyTSAiCsq8Y80r2YckvJ2RlpnhSstNjKkx4Vq5aWsXScTEN3EuDWFxP8LY4ACWUQ1CMTJcEoCk81MFA0YffFetm2BOo/j0Tuvpz1sFN7m8FbXv7Qo+VUXUJxHCBMnMg+gfPXXnDQkb3qmybLvXoK1xbVS1SKO8MYTm+FDwIusfSKjouiu49gHDvwcBlh4muvodGomRX3dxg8NUHWAcpZQtbrQeyhi4Y+410k3lmqxaLgzvEQs8j4y8fCOHkyV9fzHWIrg/5kIUEH2G8zinyVhJqa1N/KhcbQ0c4jBa9RRBVgmUPx31cEOZMxwOiYZL7ti71X8maZ/ciispNtO1N1gqNlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(26005)(6506007)(107886003)(6512007)(186003)(41300700001)(2616005)(53546011)(31686004)(8936002)(8676002)(966005)(6486002)(6666004)(36756003)(4326008)(82960400001)(7416002)(66946007)(38100700002)(86362001)(66476007)(478600001)(316002)(31696002)(5660300002)(54906003)(2906002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzY5VlRqN2RKVGd4OTJDTndCN0VXNHZQRkoxaVJ3L090MW1sVVkxL0xkSFdU?=
 =?utf-8?B?cE1mN096ZE04NHJkT3pUcmpLS0czMHZwcm9mYTVaNjA4eGIvSnltS0thNk1x?=
 =?utf-8?B?WFhqYUtlQUJFMU15NVRoRURUbTgxZ3hpaGc4U0ZnNUNPdE5YZVlWZEFvdFpx?=
 =?utf-8?B?V0tPaFNMUWVZT1FwdFptQXZtbjVLcFlxeDdaTGd0eU9JNUNIMjNDaTBSSC9O?=
 =?utf-8?B?QnhFdjRsWnkrVW1PYi83TTNkNkc2enc1SjdLRTFRUkZBTWxZUXRid1VSWXRt?=
 =?utf-8?B?NmpHdkVSRGZDMWJ0UDJmWWEwNTNHdWZiajF5Z1FZalhiY0ZCOU5YeVN6dXZi?=
 =?utf-8?B?Ry83YktSTWYvNTdXcDE1TXZ4S00wc0wxWXVSWlBEQmhITStncndKVytKcWNI?=
 =?utf-8?B?UzJ0RllpV2QvZTBaR0RTWkRoYURuN2pJcGlqRFMycVZaM011VmljYlpjREw4?=
 =?utf-8?B?MlFLNWFObCt6WWM3WXU3RTVhcldIWUYxZHJFSG9VQzRhM0c4cU4zQ09od1NK?=
 =?utf-8?B?LzRNWW9iTG9CcXgvTG92Rkx1K0x2S0ZUYkJmZXhzbkJMTlRGbFEyYWZBeHZ1?=
 =?utf-8?B?bHZNLzNQbFhjQjVuZEkrbVcrcmcwYnRJWVlYQXZzS3BGWUk5NXpjRFJQNDVu?=
 =?utf-8?B?aVorTGNzOUJxTmZDUzlaMlNxN2NRalFLQkxsZUhzTlZFV3FqWXVLbzdseWFi?=
 =?utf-8?B?dGRBYVFkWnRNOGxCdjI3VzlwUC9SdTJ4N1FLTFozVU1Va1FJQ3NPTUdkSjVx?=
 =?utf-8?B?eWI0eUpMUGZPdG9sbXdWbWNQUFhCb2w2L0tYNEhoMFVxdGp6b2tIZ3ppR0s2?=
 =?utf-8?B?YWdzUGcyRWtSUDJWRnFndnVlRTVzRU9XZ0RYakFuTlFyR3pzQXdnbG00MjFP?=
 =?utf-8?B?eXkrbHVIRDJSa0FYOXBqUUxuNTdLWHFZNlIycG9vaDhLMExqVXNOOFpIVmJo?=
 =?utf-8?B?b24zRjNTd3NJQkx2Zm1XajNZUU9CWDhkWGhQZEhPcnlpYWJxV3VpKzlScWFl?=
 =?utf-8?B?d3NTbmE1RjNnMkZnQjdHbkF4a2h5WCsvZzRDQzB2OXFyVjNTbS9Yc1ZpS1Nr?=
 =?utf-8?B?bDBxM205RVgrNG1lZndDSmI1VFFGblZGbnU1Sk5aMUl4VGZjS0NpbjZKc0t6?=
 =?utf-8?B?Rzg4RWJMWHIwbldDbjFCTERRWjlTNmd0amdJM2hoN2t6VWZxaUJicS85ZXl6?=
 =?utf-8?B?SWVSVlJYY1RGNmZCTDBmWWNuZ2xyNjVZRmNMT2loNXlCM0hqbFYvM0ZVUzJM?=
 =?utf-8?B?bExERGJzMEp6NlNlTlhXT0NJRk5BTDRGak1OSXpFdk8wVExCS0R0TGE5TGlG?=
 =?utf-8?B?UnVQTUxOVnp5R1NlMEE1by9HN0hrZDVFOGQ1K1VWT0VLMU00NTdIQVFsOExZ?=
 =?utf-8?B?WEMzNW9HY2NiRGpHb1NQdWZKRzlUbjdPaG5GcVdkTCs0RFhpeDFJOUh4L0NY?=
 =?utf-8?B?eE53VThWSUtsSEZnS3N6dVF0M0YwVkpEb3RxUlNoRlluVDQ4c1JiamduOE1j?=
 =?utf-8?B?enRBcGVlYi9FcFMxUGJtOGNpNEU3d0V5QTYvbVE5bmIzQWZnUEgzMWN5dEp6?=
 =?utf-8?B?Ykx0QTVTblBGbkZFeGoyeVdqeUdEUGdad3dxNEFyTy8xWGJQQTlnenlnTUNX?=
 =?utf-8?B?TzhvQzBZUHN4YjBENHh0aEJVN3BEZWdGNnFlUDR4S3lYZlZyNFZtY2VKZ2J1?=
 =?utf-8?B?N00vM1RldUxnaXRRZTh2UXpPMnU0d2hHQm95T3o1RlBTc0RwdU81UHRCaWRL?=
 =?utf-8?B?d2h0SWJOZCtpckY5UnJ3cEVWMnBOUjRwdFV4NDBZWnhwSUlNakxob1RPMEFy?=
 =?utf-8?B?b3Z4TDIxTEo4NTVyQ3lUM1plMEV0U0krS3hVc2NudldwWmdtd0c4emtUUDZu?=
 =?utf-8?B?Qk9KcmR3OGxOUTBqS2I3d0djKzk2ZlMrcHhJdXA3bHJkMlVLU0tLV0gzR25O?=
 =?utf-8?B?THNNUk1mOEJQeGN5WC8xWDJKNTN5MDY1dmpVSStzZlltb0NSbWFyZm5GZHRB?=
 =?utf-8?B?UmEzUUZIR1FteHlQQ0ExaEJ3aURYNnl2a0dHZHJ3d2UrM0xLaUZJb0JzVFpX?=
 =?utf-8?B?a1FxajBQaGpRYStkN1BwNVF3eElRcW5QeEFzL2NDa0E0a0t5cG04cElJTnpo?=
 =?utf-8?B?N05NMStmSmJUVExYVGVjakZzcHl3UmJIbTJYVU1FTzFkSkc4SWJWUWt1NHlV?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?L2ZtZTRFWTBBSVJNZnV5UWo2dm1CVi9Xb0xYSjh1ak0vR0U3QTRKVmVmcHgr?=
 =?utf-8?B?eU9TN0VBdldGeU1TUENHaWFOM3pOUFVOTHVRTTNKdFpkUzBRdWJKVS9qTVRR?=
 =?utf-8?B?b3BNMkVieFgwcndNYnpOQ2IvamFldmIyYzlFSms3M0FiWTRrcmJCY1VPbjcr?=
 =?utf-8?B?K2Ztd1hpMWErcmdQUkZNNnR6UVRDODhjcnQ0Y3dzb1pWakVjaDU3TitibFJa?=
 =?utf-8?B?bHcxaFZHakdSbFJGTTZiaEtWdkFCNWI1WG0yeFBGa3kzN2FuUGxkSWJRWUlJ?=
 =?utf-8?B?ZHVZNEVuTm0yMlhHZzJsSXc5MTJwNEV4dGJjdFlnY1NDTFU5TEVlejA1eWFY?=
 =?utf-8?B?emoycGpQMHZLa2FRdVU0M3RCblZBcy9rbkxZVkRZUXVwNzZOYXBNYWNXMGlr?=
 =?utf-8?B?VlpxVkNMQ2VneDdha2JXVjBkOU1rQnJKVTNhY0laalZzc0cxR1JWWlFIK0lZ?=
 =?utf-8?B?Z3dGYTBmSHF6NkVUT05DMXI1clF5QUU1VGhIM2dKdWNmaER6d2pPdytXTXNp?=
 =?utf-8?B?Q2ViOVdtUUUrUkJBNTJ1NTNhQVFFK2M5dUJQSTFtY3ljaHJnZ25tbDMra2FV?=
 =?utf-8?B?UVI2Y1lUaFYwYUpSYU5WZ3hsbVNXM0JlL2hzekZVNDBzTnlJUVgxSHFMQnFw?=
 =?utf-8?B?NjdwMFBma1EvMWNHWGFkY3VBVUk4VysxTHpKS1lyMEc4bXk4T2dSbjYrbjlK?=
 =?utf-8?B?aXd5NGpUU3Q5NjRXV1VkT29EYmpobHhlK3ZIaTJiTjdicm1Vcmc3Ulc4YUpj?=
 =?utf-8?B?SFhlUzg0YUpnZ1pMOG4rdVhSMDM3R1V1Y1BIeHVwSEpVRGNuZXFLUmhZcVcz?=
 =?utf-8?B?NkxSRFZGTVdvem5JaXQvRzVwRmdmZUE2blptUDJ6QjhpOENrUUlwcEQ5VHBB?=
 =?utf-8?B?dW5Wd3JQU3lHd05FOWlKYjBrTEJ5RllzL1dYMys5RXhaWUNFNW1YRjdpU3ZS?=
 =?utf-8?B?UnZ5Ly84bmlMRWFld1hYR0YzakNWT0Y1YmttRlhIYVBucUxEK09ObXR4bGhm?=
 =?utf-8?B?Mk5haUVrU0FHV1VtbUVhTmlmSmJLU3lxKzZ1R054aGNqVlM3d204TGhMUklv?=
 =?utf-8?B?NG53cWpUdWtTcTFrTXczUC9WeGpEb3ZlWTlUUDA1Q0dERDU3cUJsRjF3dUFW?=
 =?utf-8?B?QkxuQzl3Y3pFL1dBQ29McFZ5T2VoeHdFaS93WThMMEQ5OElNMzZZTkdZYVM1?=
 =?utf-8?B?MXF0WDFMdXNNMnpOVmQzU1hzMitxRkV3aGQ2N3hKOUlvMnhzSFJObi90bGs1?=
 =?utf-8?B?eWtHcTYwWmg2M0ZtalNXdzRMNmdReFdoczZHRWhoV1pxeUg2T2xsZTVhOHpz?=
 =?utf-8?B?dzVGeGlZRUZwU3d5ZmpNY1lxMk1pdDhGOXVCMnU5QTlyek9yUVlhS2Nxd3B1?=
 =?utf-8?B?NUhia3VWQU5zT1ROM21uTnE0N0o0b29zN0hoTVdvVzdCb3BRNUs1QXNRVm1k?=
 =?utf-8?Q?IZ/O8d4a?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43165941-ea4e-4c62-1e83-08db5c3923e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:27:49.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1MxTrhYf6GlciQO9RnoyYHWMHuZ5VUXrT9IzVXuEIXvIAywk5ORTHmhGAkeloPc+kgP9zRgBnxZoJkbl1Z0GHORv3n24jDBbp1g/fEiPQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6608

On 23/05/2023 5:37 pm, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-removing-config.mk-v1
>
> Hi,
>
> This series of patch cleanup the remaining rules still displaying their command
> line.
>
> Then, some change are made in Config.mk to remove build-id stuff only used by
> Xen build.
>
> Then, the variable AFLAGS and CFLAGS are been renamed XEN_AFLAGS and XEN_CFLAGS
> from the beginning to about inclusion of users CFLAGS as those are usually made
> for user space program, not kernel, especially in build environment for distro
> packages.
>
> Last patch removes the inclusion of Config.mk from xen/Rules.mk, as this slow
> down the build unnecessarily. xen/Makefile should do everything necessary to
> setup the build of the hypervisor, and is its only entry point.

Thankyou for doing this.  I'm tempted to summarily ack it, but lets do
things properly.

One thing though, which I think might be a regression but I'm not sure. 
When doing an incremental build (second build with no change), we get:

...
  UPD     include/xen/compile.h
 __  __            _  _    _  ___                     _        _     _      
 \ \/ /___ _ __   | || |  / |( _ )    _   _ _ __  ___| |_ __ _| |__ | | ___
  \  // _ \ '_ \  | || |_ | |/ _ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  /  \  __/ | | | |__   _|| | (_) |__| |_| | | | \__ \ || (_| | |_) | |  __/
 /_/\_\___|_| |_|    |_|(_)_|\___/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
                                                                            
make[2]: Nothing to be done for 'all'.
make[4]: Nothing to be done for 'all'.
  CC      common/version.o
  CC      arch/x86/efi/boot.o
...

Where I think those two "nothing to be done for 'all'" are new.  I don't
see them in a build from clean.

~Andrew

P.S. I do have some other notes for further cleanup, but I'm not going
to extend this current series with them.

