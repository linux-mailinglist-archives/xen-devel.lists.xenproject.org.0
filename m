Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90E3BEB95
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152521.281798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19nO-0007yU-0o; Wed, 07 Jul 2021 15:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152521.281798; Wed, 07 Jul 2021 15:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19nN-0007wd-TQ; Wed, 07 Jul 2021 15:49:05 +0000
Received: by outflank-mailman (input) for mailman id 152521;
 Wed, 07 Jul 2021 15:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19nL-0007wR-VK
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:49:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01bb24f3-e7cb-4637-a39b-548c7836938b;
 Wed, 07 Jul 2021 15:49:03 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-QICQW-XdOLiok0RZTmbULg-1;
 Wed, 07 Jul 2021 17:49:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 15:48:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:48:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 15:48:58 +0000
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
X-Inumbo-ID: 01bb24f3-e7cb-4637-a39b-548c7836938b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625672942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0Z9u/K7f3vtGeuW0Z3V4KYztYfbieEU3MfisQUwMFs=;
	b=LUFlnI6Z7E6Ocu5NZdQ77B+u/pZ22VbD2tzq1T8+jiepR953aUPThhclmNXU4w3xv9g+VE
	ds9dwpTz9WVmO1Pc2bE+joPMDINGZwbp1gWMnNBmf/g5Vob4+rfb5QDd3PxBCJLD31ucpy
	dWXl0ID2P1Uz45pKWnmIFHbk9IAtd/8=
X-MC-Unique: QICQW-XdOLiok0RZTmbULg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7KfWnCDyEtfjZeBb67zrVUZnH65HcEfAkt+EAUuEXSRNrFY9C4cEM/sapMq4y35pevssT6/Of8a9BQuLtAA2zDysYnURKSPfufsADFOC9tPPspQiE8RLTh5OFWRqXhRtDBjx9XdWl3Oiv6A6nAEwCRlaIUQPMKtgVERFmghPips/unGYj1OXHeIrD5ky8zsEfhEBBUISDvgEy7001uZT23NtoUml+QCrDp/dwwtgt5/uwJE0nXz52Phcb/XwhQI02qWJFQilxEd3T+9MZ450lM/moEHjEWrPOYOmKQZ6PXEMJWAQKkLO3fM/kvzgBi7ukcwbT2U66yGU+iu+LUL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0Z9u/K7f3vtGeuW0Z3V4KYztYfbieEU3MfisQUwMFs=;
 b=dCtDFibsJZEz0YdJOcyn2VLbvU94x2CMgMn8Ipy3qiFmmQMXtKiaZpv1RkVMJBsqxwzrWRNtGoD4K6ZxljOpV83lsBje9dmCRMSt6RdurlAr3cdtlj4Yowx6FlN0lgYUkmNNY4AfK82MJiXCwMFTAXzo8spz7/03BO3xNfJiMDCuMTHdeTXQO0F/xPEEuB7ORdfl3OOsuxPwdCP6WOUGKDKJHL3RMXkwsESiYuvLvzw/L02Si68AGiG/XP7rI9/bWy/TU10P/efI3JY2+6HaP16vSpEnWRl5n2fGCIBHUPRrnMUC3JYGSqv2CqRcaCI8YODInCQBy0l+3JhOTE/aNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-18-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com>
Date: Wed, 7 Jul 2021 17:48:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-18-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d90d6eb4-5373-48e8-de4d-08d9415ebc34
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53250510EA79A33D9A97D4E9B31A9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FCro0GsZUFHUHvhPOb9wZFs4LRrp+2gLgoqDO/OO3YcYI4ifilPVHaFTinEhefD5+TjVScW1x5iI/YF6bmFZabqoQV2WTPeFYJgDa6kwu/tgHgStaKWwu9SsynU8Yi976YuHuL0YkAHun8jlFR2/mq+hxiOBF+KFURTSR/r7DoSVIeKz/xbm+Et/Z/M76yYaSGQIoC6od6nGdAcgU9GE+wfEyfBvR97MXG1m5Wd/8VVgQUBlEJ8etHSvIiVEXm/bJXHKFmPFfqWUk/zhYpqacOqDlxwfglWWuey0w0fnVyDDiJiP7rqAZty8pdktdh/GEk5pitAANZ3Ws3rx2pIfMjdWSG6+Uj73DExOXnPAqgQHAMeQbSSx4KNXxrZyDf/BzlzsFrKpYwy2I9o4ElNxkZRIf+j+ZblPBQixORvnB9gDX8BsNDtFPjZZnPdQknwtgnYFQhIzCsaPCy+5dCIMI/2uf1FHK51aDUZmzBKqfqXZw8pA6bb1EI5VqNASzVMLj1qQqP/q8c9agviusrvUvs4h9YXGIAqJxFb3Jo3BJPin3b7MKQqLRaStyMIIoPJHsBaGJHpeKH1mMIIMcd/N7MOXMiisXVnOQpUpVGNZAb6iL0FDk5UcZ3lvQua/nZmG6RZay1teUsF0Nm3Rr6Zvx2vSxJ/a9NyMmHtwJdr7IgoRwC+ViLhLTq8k40cHZ4Gw7+HPZ5xRKkOFgwQZPT8nnliQxR2f49d1NR72qDFSmI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(366004)(396003)(136003)(376002)(26005)(2616005)(5660300002)(478600001)(6916009)(316002)(6486002)(31686004)(66946007)(66556008)(16576012)(8936002)(86362001)(31696002)(186003)(53546011)(66476007)(956004)(4744005)(36756003)(8676002)(2906002)(54906003)(38100700002)(4326008)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2svQU10K0tTSDhKcmprMXpsTXVNa3dHOXVTSnFRNE5wUTRTRitLUVQxS0hn?=
 =?utf-8?B?SU96Rnh1b25SYUlIR1IxUHRFU1N3bFZ0Wk1xK2RSM1NubFpsSUR4ak1pOVBw?=
 =?utf-8?B?V0ZWN2ZWbmswQWxVdmZWRC8xTC9oQUhoWXVEM1NnekhOVURxR3RUWHVKQlpF?=
 =?utf-8?B?NkNMd2FIbEFiY2JiOEFJdDVhSEZDYVo0RVNldHJ1cHcxalFLY1V5S2RvbGJo?=
 =?utf-8?B?bVFYQUNhbURlbTd3YmkvdCt2RnRtYXo2MHBTdU1TMXovYjYvM1RDa2VFL2Rw?=
 =?utf-8?B?ZEVLRjRMOGFaaWZacHljTjBZRU55dHpoS2s0MnNWS29tcTZYb3BpaEdhakVy?=
 =?utf-8?B?Qlp3MThScHU0ai85UEcvNTE2djI0YUNCN3hWeEE0VDdWakFiQ2JxQnp2WVNp?=
 =?utf-8?B?dWhNeCt1Y1VTc2Iza3prQ0NHTXZzWWJvSFJHazJaVXlkajVYYmZ4VmhnUW9K?=
 =?utf-8?B?TklUTC9sUUJvZTF0aU1aWGRQZWhXUDRaRmNQZ3g1V2lNeUZjeExNVmwzT0I1?=
 =?utf-8?B?WU9jUmN5WGxMUjdKWVd6NHgzWDBCRzZvYkxvV3QrWmY3TVZ4SDhsZGt6azJ3?=
 =?utf-8?B?UXRQU0VISHFGa0FGQ2J4VTFzN2VzVkd5Z3VCS2F1Z29FVHNmQWZWYms5SlZa?=
 =?utf-8?B?bGMzSWlqQmdRQUgxWnA0Wm10QzA1bFAvWEhrMXFGNXhGVGZTL05Dd3hhWnZN?=
 =?utf-8?B?QkFDZjlyazhYM3IvajVMTlNNSDlYWkVLMFVySVBZNXV6QXV4cmpvdnhhTXo3?=
 =?utf-8?B?TmJkZGlQZzRvNzc3dnpqbEhENDZpNnJsZGxvNzNDOVBVMkhLNVVDQWNlTVoy?=
 =?utf-8?B?bEx5MkVmaUNjakV1bkpoREpHUndsdGt6N3hoa0VHVnpaY3YwdER6T3hWdmtI?=
 =?utf-8?B?M3RCVGo3dENtS1M4ZkQvbHFHSlN5d0xpMEkwTG0waURjUmZIUUhBQkdQcUY2?=
 =?utf-8?B?cUxGZUdLbzBGVDQrcUx0cmRZMjZuNDkxRmUrdytuWWRqNGJoQmh0WnhYcHJx?=
 =?utf-8?B?Vy9GUlc1NXV0aTg4eDRqTDFBSjB6WU1Cam5nb1BRSEdvQTRuelUwdHh2OWJR?=
 =?utf-8?B?aHVta0NPcUEvTDU3RkRJSjF2d2RDeUlEUnRWeVByMWkvK1FEY0FvcjhIUk1k?=
 =?utf-8?B?QWRKeC9pR3JrNGcyWFZrSDduQ0lhNnRJNGtsenJEb1c3djRHNW1hajhjNzJV?=
 =?utf-8?B?ZVQrSURtNVNRai9FTER3SXlKaWFidEV2bm9DMkkzemNtTnZRdU5xY1VacG41?=
 =?utf-8?B?OXVRNXhxR2VqVDc4TkVyYVFSWHJVYXlRaEtJNzJmQ0dzdWJFWi9SWU12T1lm?=
 =?utf-8?B?bW8xMGZTY2RsM1llWiswMGN5VW9OUStlcWZFa1JyVEI3T0hTTHZNZFZ0eGdN?=
 =?utf-8?B?bVhKeFU1dWZNcWxuMEpQRmtUdG9BQmJhV3FHeDVsekNHZVVXeXdWZU0xYlA2?=
 =?utf-8?B?VHlYT0Z2MlBkbjlSZVV5clZKbHl3R1cyVGYwb1FSdlphckVaWmRGY2IrN0lC?=
 =?utf-8?B?N3UvYU8xbkxKdnZyWWpQbDh4ZG5oOU0zRXh6dWpmYUV2SnU4b1dXWjN1NTRp?=
 =?utf-8?B?cE9IQ1dKT0FrUmVod013SnIzWE5IVFhoL3NmZDI0dlBaVUFtSUsrMFVBQW15?=
 =?utf-8?B?bmtuK0FyaEpyNGVlL0gwbXVLRkRINXZNU0FYY0I2ZU5LUUR2UmVGemV0Vkhz?=
 =?utf-8?B?bS82SXRDNTJkU2Vvb0FEdEtnck56UTVvTFI5cGFjTVpRemNRUFlFSVNobVBx?=
 =?utf-8?Q?pZQHtjl8fY5Q3vosGtWwMGfZKE4abIV6gu7sLIZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90d6eb4-5373-48e8-de4d-08d9415ebc34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:48:59.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlQBLRBqvf6ZEAviRLv2vn3KYfNDtSW2AD5o4TAJb5BLTEncExJxyROItHhLkp1dBdVO+HX8FpTN3NedgUedGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 01.07.2021 16:09, Anthony PERARD wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
>  
>  config_data.o: config.gz
>  
> -config_data.S: $(BASEDIR)/tools/binfile
> -	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
> +quiet_cmd_binfile = BINFILE $@
> +cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data

This is an abuse of $< which I consider overly confusing:
$(BASEDIR)/tools/binfile is not the input file to the rule. Instead
the script generates an assembly file "out of thin air", with not
input files at all. The rule and ...

> +config_data.S: $(BASEDIR)/tools/binfile FORCE

... dependency shouldn't give a different impression. What would
be nice (without having checked how difficult this might be) would
be if quiet_cmd_binfile and cmd_binfile could move to xen/Rules.mk
and merely be used from here (and the other location, where the
same concern obviously applies).

Jan


