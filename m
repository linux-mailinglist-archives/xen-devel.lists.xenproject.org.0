Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95E39F3E2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 12:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138410.256229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqZDY-0003i0-T0; Tue, 08 Jun 2021 10:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138410.256229; Tue, 08 Jun 2021 10:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqZDY-0003fg-Ow; Tue, 08 Jun 2021 10:44:20 +0000
Received: by outflank-mailman (input) for mailman id 138410;
 Tue, 08 Jun 2021 10:44:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqZDY-0003fa-03
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:44:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b702d68b-3964-4a75-85ad-9f59d8a1fd7c;
 Tue, 08 Jun 2021 10:44:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-bde-LhGlOOuEDd9fjADOWw-1; Tue, 08 Jun 2021 12:44:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 10:44:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:44:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 10:44:12 +0000
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
X-Inumbo-ID: b702d68b-3964-4a75-85ad-9f59d8a1fd7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623149057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkFPpmtDQcMA0edR+gopvuykDTD5zn/IQkctL28VU4w=;
	b=Y5r+w4/fvrxGkAdZ2LGP9ZkYKhlUXk4b8x/HLx4UMSxcyXXCjf8Cx56NHtke2F7nCCGOAr
	5lS6hpvVzsTS5YDc6xb/NVsuKfIgo+ZerqK92mkQCgQ0Jfp70j8YZ55D7hcrOf1oVAH5XE
	zqkFw5YR7IUXhmZXHEqj/x5kw5K7GCw=
X-MC-Unique: bde-LhGlOOuEDd9fjADOWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yvy1jujUglMjO8zrj+j/Ly0VIZCb5UZh/li1ZXrOH3OvydvFxsogdG/UOgujVz1oWqpV8cwgpjlJ1qZ9u5tVDxTD4ub/1N9xPRvZdN26nPCQHJjxjO/qqs4yQMCXBvKwZT0mkMBO4bsoPRW39CKuGFgleBZIJuErpqpKqaMyhZ5VxY+RNKXigcYK6i4VXxwfXYQilX9i3jlCLj7WDsc1a9YCnzdNtOKEjPvbpDPWPQNjjOxtJwYm3mB1Rr+hySuLA+/juyOVgiaeNarHXoRxkwwu8ptppaVThvLIVHCXkcClJ/iGEuW03J/xrwVJgA36bPWxVNDx8U/1ZSMm/aTbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkFPpmtDQcMA0edR+gopvuykDTD5zn/IQkctL28VU4w=;
 b=RJb/HuLPwQle2RzGMMErY/hZ7bE1ilYGLUvWy+MH30S/eskbVEUW8i9ApUNxf4U4iRuvv3fnxC1wmLMrkO92H7gV0eBLqalYX6+JTZl6d2E3uuCNItoVrawqjktBwnImzOQZbkh7GOOxcJZrzG6z1OCl/nwrENVQ8aayEHs/IAkNujoPKjbTmonU+q0psso2w+zHHubUfg/I9G58HYhQhQwcOX8Xe9HlykPLWcWafrRHqw1gGpH3PWNrG7kaVe6FWtcgnGXKBsR2dp6VsjXWqomGakRuUnBEqNWwx89W7UKYIV5kIMgIe1Dt74d2Dti2RfmeWB8IEN07pXso57BVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 2/2] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <cover.1622772299.git.connojdavis@gmail.com>
 <4337d3cd6891b34f534d85ca62712bd3b446edf8.1622772299.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8e8eb9e-a80d-1202-9bbd-45af977e6e30@suse.com>
Date: Tue, 8 Jun 2021 12:44:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4337d3cd6891b34f534d85ca62712bd3b446edf8.1622772299.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d92255-bd1a-48cd-fa35-08d92a6a5ac8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445DFB622CA533D87F5EC76B3379@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s9khqwQCSBDIpiEro7wX2ANi1UaT2Nm6Dd20QEkmAtKVrjWlT1y+l1sAMYScCctNw5+ORnjQSkFZR/Mp3WDlWqLC0pC7E7oHB/Ki12pM9zdCRLGXtH3d9XLnTQ8w1piNRcfTO9Bc5boUJHRlNWuQjLE/fvTAH3Wyh10svpG3AHnq8+EEFUT/lhhOonJVPrXCPHFgq5O/atu5yqk+kkAVr03qBR1Ouh/RJIKO46LkbWelMDdHdqrPuMxw51M9sbHaq8SGjQ9X8FDDYyy0r0mYOCCy576dsDhM36k4sNQ2SJoFAkc+8mYbo4ouyqfCH10Hiv6Gwuc0QfFzLw1feaaiGkJCWTpXlBIsvYLm5a5LUNzuyn3WnZyl1ZJrT0NnB4GipcAqAoNbx569yw346W6iEOQJWJgODwoevNWFhkbSHXm6bFqdAjnOpPkAiY4t2kbGgqbo8VE0hExYwCWzlI8/WmXktss/TYcEvPXCOI/x6DO9RPe+LwrzL8Dec4TLCAibiZUs1mD+xKq7q684ypYV88FhK5Wi3gHuLgUpg7znP6/mXhsit/LPsB8QiEfGyI2exTbzMQsV7XBrJ5vteLT8PB7sdOa2XFgdLT7G2DQAzOK1K5dHnUU6msC2HGqhAku3Qj+Z7Ij1/7f/4M4AYct+qyFrTpygqKWxZbtPizz5teJ19s/lDQvXiENtkGOX+xgl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(376002)(396003)(39860400002)(26005)(8936002)(6486002)(38100700002)(54906003)(2906002)(53546011)(5660300002)(4744005)(16526019)(36756003)(66946007)(66476007)(66556008)(186003)(316002)(83380400001)(7416002)(4326008)(31686004)(6666004)(31696002)(2616005)(956004)(110136005)(86362001)(478600001)(16576012)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?NmdzV2FmY09DeHlKWTk5UmxTSVloTWo4UFFPMi9qR2hLQVJGREZSUEc4K2Vq?=
 =?utf-8?B?UW5zcVhhWDAwYXlDN1JjOXNEVDNRNDZXMHA5Y3NLZUJodmo5VGRJTEl4YkIx?=
 =?utf-8?B?M2NjZ3ZFQkNtU1lHRmExajdwOGoycUlhZGhnYmlaRENPQS9nbjE4MW5GTFRv?=
 =?utf-8?B?ejY0RzMrUFFCckc4TnJ4Y0J5YmJzWHAzeUxocEx1bmtuNEEycXF1bnRMZFdP?=
 =?utf-8?B?OHJUeDR5ejRXdnRoOUtiYnY3N1dEUGlkUVgwenZJaGpUdDZQL1V6ZzBIbUdv?=
 =?utf-8?B?T0tBa2M4aGZvTGpKRVJJUmpYaUtmN1Z4RC9TeUhmV3lLOUY1MW5TWEYweXRR?=
 =?utf-8?B?czBodDNIOWVqREVKMEhPZ0pIVlhSY0xzN1owWWNXU3duM3JPdUIxK1RYVndh?=
 =?utf-8?B?aFJnakZiNUJTTnFtQ1Bmc3REdGo3dzczTzhNRi85UUJkeDJ6U21VYmFkUVlC?=
 =?utf-8?B?NU52TFowZUcyMDJxQnBtSHBwU3dFMjFOak5QRkJZemRBM1d1M2lzaVZrWU95?=
 =?utf-8?B?K3l3c1R1TTJzcUF3M3p3R2RGN1pBNkZCM3NyWXpIMWRTVlBsd29vbVk0NHJi?=
 =?utf-8?B?b09vbmt6WFF3N2ZEWmRTNGtNcFIvd1VoM29mK2MzTEhPVzh6Y0ZFZ2hUUWNQ?=
 =?utf-8?B?N25OYVBsRXFFbmdkMGExOVFraEtHMEM5QUc2UFVlZ1ovUTBMSWxVNUNERENQ?=
 =?utf-8?B?UjIzOE1uOURrUTdPcjFqNXpweWtXcXNUV2JPT2ZaL1pFZndUandDQUFZa1Iv?=
 =?utf-8?B?c1Yza1RqUVBuMUVwWGF2RHB3aEpXN1c2RlB4NzFYMjJUSjR2V0ZCR1M0Tnd1?=
 =?utf-8?B?b2pLMU0rWnZXMjZjTk91SnFrR05IZkF3cGJ2dWkvN2xDNVBSYWxVRkhMM0pF?=
 =?utf-8?B?L0NaOUhNeW1ldDd1SmVDRGZjN1NVYVpLNVRaYlA2NWpCS3BCbUNBTUlGMVNw?=
 =?utf-8?B?L0FxUFhQUnpVbjZaaVB4dVhIMEQyRHQ3SU1wNUplWVgyUHoyaFRDd1JTV29q?=
 =?utf-8?B?aWl0eUdUZkZCNmhob0RFWkdRdmVyY25pUCtrcE9ucUpuZVlCRzBFL0doeUsx?=
 =?utf-8?B?NFh4MEp4b1VjcTE1QnlmYnBsMjJFS1ZnSG43eTc0cnRJdUNLTzUyNjlvVHZW?=
 =?utf-8?B?MUNxbmJJQ3NPNGkwc3QwbUZFQmhENlBJMnNZMzVzZ3Q1ZW1KcnRGeHBRalNt?=
 =?utf-8?B?WjA5WDM0SXFObzRMNGt5RjBUL21aRWhkWU1XclpQTWxVSFBWNDRwR0VCVEo1?=
 =?utf-8?B?aUE2WFEzaU9xcy80QXdqWkh0WTViVzZwWkpHdDdQOXVTYnJHcHp2VWFwYmhs?=
 =?utf-8?B?bTI2RUFsZUREU21ibHlucTVnMUNyTnZGWGFhdUNtRms3TzJHWHlBcURSQ3pu?=
 =?utf-8?B?YTZxdVN4TktERmR4U1diajgwYmw1bEg5RWNpTUE2K1pLc2VJdmxNb1Qxbkw3?=
 =?utf-8?B?THE1SE9VdnA5b2srUVdMWGpBenlEQ0o5a25YbzZ6TFRHZWJFMVlwbE13UGhX?=
 =?utf-8?B?RnVFRkpWRWRSNlVTcG12SHUyVHE1KzFheXQwZFhsYzdMWFJPM1N5RkMyOENt?=
 =?utf-8?B?d1I2WmlNUWd1SFRqVkhjNkJJOVZKTjZKVVE2aGRadEFUbFYyN0NLUXdFNEhR?=
 =?utf-8?B?aHpvT2M0clZvVEpjdEloUzlmMTV6ZTdBVmZZNkZVcnk1VGovaVVQaFVsS2Qv?=
 =?utf-8?B?SW00SlhZdnk2VVVSWFFqUktTYzB5eDFxZDdaZlpDQjh3MUsxVTRmK3hmQmZi?=
 =?utf-8?Q?yzL0hOfyCGJErP8ec4NC/5R7dlxV+YmCFpSHhCF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d92255-bd1a-48cd-fa35-08d92a6a5ac8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:44:13.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzmngbddDrZ205iHWw07JmOe25iZiD+oF7syFW9GYgv5x0/0a9QXfe79QEq5ggzdRLI5Dw5MH8Ilsw2Bi7142g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 04.06.2021 04:14, Connor Davis wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -456,6 +456,15 @@ F:	tools/libs/light/libxl_nonetbuffer.c
>  F:	tools/hotplug/Linux/remus-netbuf-setup
>  F:	tools/hotplug/Linux/block-drbd-probe
>  
> +RISCV
> +M:	Bob Eshleman <bobbyeshleman@gmail.com>
> +M:	Alistair Francis <alistair.francis@wdc.com>
> +R:	Connor Davis <connojdavis@gmail.com>
> +S:	Supported
> +F:	config/riscv64.mk
> +F:	xen/arch/riscv/
> +F:	xen/include/asm-riscv/
> +
>  RTDS SCHEDULER
>  M:	Dario Faggioli <dfaggioli@suse.com>
>  M:	Meng Xu <mengxu@cis.upenn.edu>

FAOD as per Julien's request for this to be formally complete, I'm waiting
for Bob's ack in order to put in this one (together with patch 1, as I did
indicate before).

Jan


