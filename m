Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0841C043
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198769.352437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUbU-0003Fz-OS; Wed, 29 Sep 2021 08:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198769.352437; Wed, 29 Sep 2021 08:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUbU-0003DB-KW; Wed, 29 Sep 2021 08:06:12 +0000
Received: by outflank-mailman (input) for mailman id 198769;
 Wed, 29 Sep 2021 08:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUbT-0003D5-MT
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:06:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b2a2012-20fc-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:06:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-7zv2f_2CO_CdSG24ucAuVw-1; Wed, 29 Sep 2021 10:06:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 08:06:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:06:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0110.eurprd02.prod.outlook.com (2603:10a6:20b:28c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 08:06:05 +0000
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
X-Inumbo-ID: 1b2a2012-20fc-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632902769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEBkLD4p5OLJiZ72tr+7qMCKDXAVO1EX8Bfr7fliDis=;
	b=nxqnyow8YmpK2JTizNbv6j3T7e50kvgtSz/c9w9LaQ5TfvfcgXMgtbrDG6+FwXiXhOeNbi
	WHRtOi+Y9la+3IgcW3/Klylw5Mf81vIdyXyNHj9LVyN+BgMdgdmReqj3+zfnOrOxJZho6G
	ucC4iwyr9bZnPzhLP8ZjAkDcxhjv/Wo=
X-MC-Unique: 7zv2f_2CO_CdSG24ucAuVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSNiKAfRSL0o8B4CQly1hp/f0EFJ9vsUI07acxteRF9HA6X4mFnqqyx2zRVDY9cljeI2tvwHdYF1phbb990LLz43tK0KiDdFLRhZQp3t5GD/wLL8r37kSl7JFvod930LQaeiZFgFFARnWZMcLv/a0MhGN4tEJzUh04ob3bgfUUl4u0Gw4AyRhw8abvYeJ6P0MnWVTdzUTRVmzZ+S3VuKX4yQiI+42YPv7lxnmIE/bHrsiWxj0X2nVrPT2RPcMgJLW4PGhTdnNXnXwxYY9GBicdSLkx/vUtmoh/jzXEPbVMcDJiDkpwOfVxzxgAaAJHW4Bo9Ja4uhUULt6PbVaZ60jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gEBkLD4p5OLJiZ72tr+7qMCKDXAVO1EX8Bfr7fliDis=;
 b=TBJWYRHLiJfBmVv0rmwXdiRHTv80z2gXqZTuE8dhzkFkNOuKaEdtJV9UzMf78lnA0MOwP0aSmE7/ZEXM1BIvG/uDym01Hhg7RD6uPjlKLJ2L3TLzKao767BGGZajIxfLlyI+9e41ajhZO1mZjoPVF86GTTdzWpYiFqTQ+NpUdhfV9uwYM0mU9vUZRCXtBIdpFiWXiTFt7GR0g9HpZrZ4UfRqpRMF9m4w79fbv0WnteDxjHbpN3Xnf/b8rWz76BIPztJQW3NKC0aZwLnqEz+Grr8V3F4IMT/mRdi+3KfBifwt4d/ZrTkfrfWWR+U2piuqLKDHQS7RwUlkc2two6KlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/3] include/public: fix style of usbif.h
To: Juergen Gross <jgross@suse.com>
References: <20210929074620.28495-1-jgross@suse.com>
 <20210929074620.28495-4-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eebe75ad-e1c6-165c-3941-cd4dfa3e088d@suse.com>
Date: Wed, 29 Sep 2021 10:06:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210929074620.28495-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0110.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a585be1-f93f-4bc3-ba83-08d9831ffcbd
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61745645FCF11FED912AB71EB3A99@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yIcWmR7WjWPsBr1Rex3QgCaAHKPNF1NxBJXS+IhyDhfakcZOrlDWuF8SWVfzPfR0Sd3a3J5yoz/pojEgrkipwE8tTzKOjWy/N1es/9LaLmpdFkGxEPf4l57TQiOl8MKaz8FzNlycx2URU2qrbQYuiaHk2Dd2ZoRAEA9SnpzG6TdZ8lg2M7X6pmuBlbh4woV0IPNsRvDxVcyTw9EXJZIhVRAEK0jwR/6zpTh55YD5RzwwtnHKNkTiqdVAYeOtyuD4XKBzrYnFUSLUCPShn0JRAZ30Si6nkSDOCbJUwCphfnX8wKFqWyzfbk4gLdS77LBvpvqoFECnP6cc1MhsErabldpFH4PDzaMyrstDtlfp7grNSrXMDuKqYSiAkxogt089WHlAV/wG0+uCB6HjtUwQipfVtTKt8vgnaphy0vRxo59XLjXaNVo55pTL/XCZs3KjvVAVE8yGAT9lWDknxsYzJOkd4/iCcIqam4V2gzZRgJgaW6GDlWzaSDZoNOJLCVncoFo4wdv/qBHEcLe0CPeIDYPpmy4QZ5Y7JqRas1Izp5wfyi5RghI9p/wd0cRvV1ObtXPQpGeSikhw94/DAP3qi7Dnw+YL9T6YSEIJ34OdfJiCrMf4xLo8fxaP6XqTZsVW5XiQfuWnmsgInlImwkhG5Qyd683wz5xHILjxZpSvy4EL0fjOAIDqqFOeaUYztRY1CJRj1VWpeivef3EmOhw80GyNXqiQSgGlkmEbyUm807I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31686004)(186003)(53546011)(4326008)(6862004)(316002)(26005)(558084003)(16576012)(66946007)(66476007)(66556008)(8936002)(6636002)(37006003)(956004)(86362001)(2906002)(38100700002)(508600001)(6486002)(2616005)(5660300002)(31696002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czhoaUE0anNqTmh4VWVnMStyTDk4YmYrOEhFVjVDUVphL3lEZ2M4T2RNVWhh?=
 =?utf-8?B?WmwwYWI4WWhTQU95Z0NxSXVIR2VTRkRHS3NFNk9VM0Q0TEJjTnF1SmVDSFpZ?=
 =?utf-8?B?eTRsU0ZJQUZhTFd4M2VKcDJVK1pwTW54SmJjbDUrNnVtaVoxTkpEQ21ZWG04?=
 =?utf-8?B?UXRYTnBUVmtCeTFrM0h5cnM3dExXSW9CekMwSXdZaU5CdnY2dXdnb2Z0Uitj?=
 =?utf-8?B?WXY1WUdaVzh3VnVZbUVyNVJVNS8xRVVxcXF6RUFQdC9tdFR3UGQ2eVcyRGRF?=
 =?utf-8?B?UWVScUIxY2dIbXVuekhFcTJRR011YWQ1WlBmeTVDSytTRFNmakJWTDBUS2hk?=
 =?utf-8?B?Qm1LR25jdVgzL1Ixc2FVbGdlTzFkd2RFSmlTQ1JyUGhsZDlSOGZXSkQ2ZDFm?=
 =?utf-8?B?MkM2N1ZMQkNzNzRVV0MzaHE3U2t6ZlNJblVheXZyeUJUSXc5R0FhNFVyeHlp?=
 =?utf-8?B?QW11NDVWYUM2YXdtd1Qwa0xGaHBEWHBlNXdZeEhITTg3Z0JjQU16VlcxcDRX?=
 =?utf-8?B?YnppaWpKcklEdEdBWjBVUWV2MWpFTTBVdklzY3ZJMkdRVTk5MTFHM2p5Rmhu?=
 =?utf-8?B?UVg1U3poQi85VWtoekdid0lTMmFBMUQvMUQ3L1RMTnBrTVJEUU0zNmhodG1F?=
 =?utf-8?B?QlFvU0tiSjhzd1hVMEx3cGkxVnE3b2Juc2pURWcwenpXdDlBa2U2ejRxeDNR?=
 =?utf-8?B?TVNjVWpKUkNvSkxyR09JSi9VZTUyUkd3SDBYSFprTFdzeUVaYVErWmhJR3dD?=
 =?utf-8?B?QlZqOVI1dHZSblBpYldwTW4zcGZNWGIxUmJFWXlaZ2g2N1BWeG11Q3dJVVZS?=
 =?utf-8?B?b2pzaWZrbGlPS1M4MFFjQlNMaXQ2N1psOHkrZEVhVTYzWGc2VzNPVmREUUkw?=
 =?utf-8?B?amVNajFJTmZ6SG4rb1NTTEFmcFUrM0FVSE5jMjdNRmVJNWFGV0hZeHFWSWc0?=
 =?utf-8?B?azNjbnJtdDd6RHdpSHRKTm1wY1YrNDlTenFZSjNScmRkYkNtcm1XRWVKWjAz?=
 =?utf-8?B?eUF2M2p5c3JPNXBYYXlsWk1Kd1hWNWt4Uno1QWdPTGpPa3NGUmNmZ0JzS1Jj?=
 =?utf-8?B?NXVrUVBaUjRhbzE4UHN1T2ovcVcwK0VTRnkwUUlPZzV5ZWpkWWtvODN0R21K?=
 =?utf-8?B?eWRqYndTQXlVbmJIcVJ3NnQ3VjhTZlJPN0JQTWtrdnhucHZrbEtWQlYvSzhS?=
 =?utf-8?B?U1EwMmNYZWFaUERsbWtmTFhDU0N3Qmh2YWNBZS8xTDNJLy9GbjJ3cnVwZmhC?=
 =?utf-8?B?NzRjUFNVaE14aEZ1cWNsQU5kM3FtR0JOY1VOcGczUGtvV0dpZStDZTVBdmp6?=
 =?utf-8?B?M0pUbVhWcitqT2dCS3RaOVZvRThBMncyN3JvWjlKWDJUOTJESWFXU2kvc3pZ?=
 =?utf-8?B?SUhJbkVQR2ZpOHJ5bG1iT0tYV3RjWXM5WnNvakljUEJZMTBHcUZPc2I3NjFO?=
 =?utf-8?B?bGowWTY0K1liVDVhUEoxK1drNUh2MFZFdXA5OWptWVVubkpBL2dJTkFvTyt3?=
 =?utf-8?B?YWRDZVJiVXNaaU50bXdZMktwTG9SSXhCaTFkay9YeEw1QmtiYVlCZFgrZmxs?=
 =?utf-8?B?MUFWZ0MrZVo4WXd3TkE4WmlzY2ZlSVFWSDZCb2ZKd3U0dW5ZNDMyRHpyUUNl?=
 =?utf-8?B?dE84RzJ5R2dISmNzV1R0YVgvMHFBa3JPcjhwYmljcFNLZWtJb002bWx3Snk5?=
 =?utf-8?B?RmRVMDlYM2Fyd29aRzlPeWR6bFNDYTBseGJ3bjdyWUJVK0VDZTM5N3QyZS9L?=
 =?utf-8?Q?uUduKX6ZaWd/DEsNsJw4jkz20faj1Ak4D/pjaLA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a585be1-f93f-4bc3-ba83-08d9831ffcbd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:06:05.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyb/obETuKvNb89bRmRc/VRsGEqLCaQa8WhJERm8jUYAzBb5OoeYKtzVXLBtIt3YgSuLAx+csvq2rstcv8pjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 29.09.2021 09:46, Juergen Gross wrote:
> usbif.h is violating the Xen hypervisor coding style. Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


