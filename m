Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564FC3F18BE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168624.307874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgoI-0004SL-7o; Thu, 19 Aug 2021 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168624.307874; Thu, 19 Aug 2021 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgoI-0004P2-4P; Thu, 19 Aug 2021 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 168624;
 Thu, 19 Aug 2021 12:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgoG-0004Mm-4S
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:06:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cdf898b-8598-4343-969b-2e0c7e8883ab;
 Thu, 19 Aug 2021 12:06:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-7hTSsEn4OQCAOgmJ0UhuVw-1; Thu, 19 Aug 2021 14:06:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 12:06:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 12:06:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0077.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Thu, 19 Aug 2021 12:06:06 +0000
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
X-Inumbo-ID: 4cdf898b-8598-4343-969b-2e0c7e8883ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629374770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQuc3xYl5TmM2vUqZltf9YOmqeJwaGUUm5NONliWslY=;
	b=n4iZQGaP7cl9iDAqn9gEjdFuBf+QgQDRmWpJhMRejRBp8dxQvl98AhKm/t4DCsxjrIY/iJ
	q3vb2qRvogxJnlP2Pe3LIH4C2QAhNJyKXLocF/WF88crKzIvEsgVI7YfwzvdFOKFu7BBfH
	8imQJcR+kxH4HFzNlUApkWmalsEp3gw=
X-MC-Unique: 7hTSsEn4OQCAOgmJ0UhuVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDu9fCjmJgnqT08POAVjDTgrTVJ9IAy3a3v99WQFgfG3tUsE4nyOj2lWOZhggBJ0xYFtbYPLbPdZl6eMqgs+9d3pBPp3W6l/AdVlPeiMOO46MwLHcAcB06O4GJ3qJuPUBJSNUf+Zk4VKFsqhQkQb9FZs0uVYy6OCwp6rI4nJZisH8e0o3GgLaaVKLWG8vS0wM9qIxyon6C5CHmtdLd/HZh/2+oyWaKIXd2oji19wDotzZe3/EKuFwnvAA+5icGIuo47mBtI3m/vlN+LKYpp45ZMWd2O5ORhNNZ7bCPGsXsIW43BTsmddHkDcFNFj+CTMQcE+glQvSHvH/aaI32gahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQuc3xYl5TmM2vUqZltf9YOmqeJwaGUUm5NONliWslY=;
 b=hBXidjk26VWPMJTyocYNLZbrRMVOnZBlTzd0Z8HzAcUkBmCEfpEWBLC4Zd3rvcOiwXvWfnKFfnM+e2wY6xvQwFJRAMIMpKFSYE3ite/kBDdBEOsvkiw3ZRkpAZeuyuPCM6jxZFSPyF1tRX99AHBxEKYXsZc0qUgX6AG3B6IqiLD9qm4z/xzkJUcAsd9K0cAe57q/mjFsZr1CdfsXVWh5CH5xkx9lznk7lPdenAD7EQsaMuifMsM+JE0gxvLrHsCHfpxgIgUEAAnrQ8G5Zsubpciv0WRQx4AN/3eL3abLJJZ/kTaxt/AgXgk26slOifeJD+as/EMPy+Zu7AxGe516dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>
References: <osstest-164237-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
Date: Thu, 19 Aug 2021 14:06:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <osstest-164237-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae14f3ea-601e-4545-9ed9-08d96309b995
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63826B156E68668DA096E006B3C09@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wF6TuXsQT6JAA7aIXp9LQhBMXECwtmiGDNUE9a7JUDKlktXjUTeCOnvNMJZSbVK7wHKCcqHAPP2EICWllD15zDzgPEyPgLEwLjKTPvfxoXYRbbiJRnhJqfp/wt62ue/9LTyJ7x7OvD0/CeCFL0I4Wrhpp0s9qJOJVwtmrzUX6Vu3tcnz0ZxDjCoUPrvDo+2GVCpm5bkyEWxNCJ7sLfaaEoturVmt/wA25RMGgwot1JQ+tTRyGCJ5RRTaMEo5PncmOJCVpnxRQxf4f3refvya1F5s5b2iH3wRJp7YSKB6Nud7MXEjJ5pk7kU3P6q0mqCPZ8+QOsAmCBFtLaTSUPRJxniRyVMiyfK66uBvySFX8Al+PDAr5SNLjWfoZJ2K8wAgVDOsgFnpMrINRmQJyYFVB525X68JF5KKAmU97b0L65PmZv06QxaC9vjDdobmtfbN1b8P/hRh+AwhAmwC5xsShDjUCC89l/Pro2QcwCg8UdaWX4fy2eL+pV4VXD4hRrfRw1h+eAke9BL8Ua/9Nxzv7qzOwBdD3eGqogHRNp+JX5WV6HE+etae1Zg9ncjgXptjW9UjCrp3erJ48wlGtEBUP02dgnkBorkPAy3z5GqlQorDY2PFTf4AfL0mNj8QzTqefER7RMxEKvK5Y8cn9oh48ggGyj/QOakNbJ/uPBr8aKGZnGqEFzjZ6t38UkIuYWuKzkS9jzsL2kT+BOJCArgeo+W8NdTBQ1GfG7DvNTHkvCRLNOxMTi61If9mYTfXTGpjqCGmEPUd8m8MxUjCJH+1P+Q1zd11G5T7OJCj9lDpFXn/IfISpQ3/3aTQKh5ALkcI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(396003)(376002)(346002)(4326008)(31686004)(966005)(53546011)(4744005)(5660300002)(66556008)(66476007)(36756003)(186003)(83380400001)(478600001)(6486002)(66946007)(26005)(316002)(8936002)(8676002)(16576012)(86362001)(31696002)(956004)(2616005)(38100700002)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBJcW5zc2w3K0FyaG9QdVFsVFNkRU85a2Z0bWFrNEJBcUptRXpaNFpLaXNN?=
 =?utf-8?B?Q0hGTlVsRDNCN202QnBZcTA3QWpIQ3Z2ZCs3c3VlMHFyWjNHZlpLUHYya1d5?=
 =?utf-8?B?SCt1Y3NNYnpRejNsN25uaEtrVnJ0c1RkZ3VxY2VnOEhjQTFWMkd6K015SUJD?=
 =?utf-8?B?cVM0MEJVZGpydWNqMVVJL2lGTWd1a296d0UxSTVmYmcwYVdNa0VadlZWMjRO?=
 =?utf-8?B?NzkvRFM5UlA2RVUzd0tybkFoNHFQbWFPVnhvWHZuek44d2ZON09WeWpRS3dq?=
 =?utf-8?B?STFJaVlRUTBSRTU3RlMrS2lUV2ZQdFFDRGMwTXdEMy9adFBoVDVHRVNTNkFP?=
 =?utf-8?B?OTJHSnZETTFtSUFRZVlqbVhweTg0anJqcGYyMU9JOWVFLzFwMDJpVllOaHJh?=
 =?utf-8?B?Y1c2Z2hpREtGalJpUm9ueTg3SEQ5Zmt0VDJmMFNwMk9abkVXLytzd2JvT1ZP?=
 =?utf-8?B?amcxcUE4anpqblFGYXducjAvL29HN3ZNMTB4TGdMUDlPOTdyeUhFVFMvV09P?=
 =?utf-8?B?ZWRmZ1dtUmZWcFErUGJjK2c3YTd3NW56UGhud2RJdng4TmE5VytQbTNXRk1T?=
 =?utf-8?B?VUZ6NVc2L3FEN29FakduakxLMVE4UHlnM2F1YWZMWkxYMEM2ZndXME9xb28y?=
 =?utf-8?B?bStCYmdBZE5ObmJDTHZ2OVRXcUcvTDh2d1dwc2xNTkJZWTl1d1dzK0V6bjM3?=
 =?utf-8?B?eE1IU0hhZERqLzVzRUR4cFpmNWZEYnFiQ01CY0FIcnYvbENZUGVsT04vdEZT?=
 =?utf-8?B?ekZJMnptOThvRlVEaFVFYVNWaXlHS3R5bzdtSk9XSUpQY2tLU1Zrc1NZNDVG?=
 =?utf-8?B?Zm9EZ212aFBBV3JYdWt6SUIzRXpIeVNzajFSRUVWTzFNSTNpeGlXaHArMnZB?=
 =?utf-8?B?UjN5cDRCVzJGeXYyYjZaV3I2V1FiK0lCRWdEUDdBaUdCaTFOYnNtVElSUVR4?=
 =?utf-8?B?UFh3bFR0YkpQSHZzMkRWTWJmeUdQMnBMVGlKTlEvbXY3OVFWZ0s3NDFESmtj?=
 =?utf-8?B?THlXY3dnRnIzOVhXSGsrUkZNK3o4UlF1UmNkYXZ1V3NYM0RDZDA0RVlvbEho?=
 =?utf-8?B?bWVPaFpZb3JKSDFuOHRqU1paR0h0V1JxalR1YkNRUlNNTDJLK2xGV3BkUnNj?=
 =?utf-8?B?SFE1STJrZjJxZFVzeFBZRlRNdVRncGtFcFVoNSt0bzBvSFZRL1NVRVRkT3I3?=
 =?utf-8?B?UWdTUGU4ODVjS2FJdlQ0enhQUVJQZUtIT1lIdnNJRTVnVkVMalp1U09RL3g2?=
 =?utf-8?B?SnFaTlRZRDlxUEpqV2JZNmZRTzVDaEpSZnBBWCsvYnhYa0VqaFdwaGxNVE5v?=
 =?utf-8?B?SUR0T0JUb3RNWHJVajdjbDA0RW10RmJ4bElJN1FKbkNyYWJXRzJVRnlzYlBY?=
 =?utf-8?B?ZjdQY1IrK01zazY0TmtHZGJZWTdvTk5mb0NyUXdnVDJjWklGcnhncGM2YS9W?=
 =?utf-8?B?UEpsWmNGYSsvUjlUb1FWTjZPTmZjaTJrcitFQnZENzQ1bzVLY3M4a3lxa0s1?=
 =?utf-8?B?Z2kxbm1zdW5zZW0rR29xc0pYeHJxWTFuaE5yTnZibmhDU0dsaXBzbUVZVDFM?=
 =?utf-8?B?WHIxN1RPME0xdXBuMm5DU2JCNEMrVkRHY3hGRDNWeGtJakRLbGRxUVR2QWt6?=
 =?utf-8?B?TEwwS3BZOGdwbDJ0SURmUVhhdmtrMjhMTE8xcWxwTENYMjhLaTljZTdHM2tK?=
 =?utf-8?B?ZjlLZzhkSGZPaDd2ald4OEVxcEJUVWpHcFdkcloyQjZLaTNQZUxWeWJ4enov?=
 =?utf-8?Q?a4p+qsuV/gD+tpUXjHPY3YarmoAc+zJCxNyWReq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae14f3ea-601e-4545-9ed9-08d96309b995
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 12:06:07.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcJh18P9iRKnhttXzB7KSTz99LJElaSdDHeMSz1+jk32ffC1uq1lhvXKjgt+LziXOhQpGjiwqz4Dmzw6/eBFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 19.08.2021 05:07, osstest service owner wrote:
> flight 164237 xen-unstable real [real]
> flight 164246 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/164237/
> http://logs.test-lab.xenproject.org/osstest/logs/164246/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-amd64-pvgrub 12 debian-di-install       fail REGR. vs. 164178
>  test-amd64-amd64-i386-pvgrub 12 debian-di-install        fail REGR. vs. 164178

Looks like this didn't sort itself (yet). Do you continue to be
convinced that it will, eventually?

Additionally I'm puzzled by these having been in the "are not
blocking" section up to flight 164202, and have since been in the
"are blocking" one.

Jan


