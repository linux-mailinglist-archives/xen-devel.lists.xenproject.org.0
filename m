Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB73BA062
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 14:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149135.275685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzIIf-0002Mo-17; Fri, 02 Jul 2021 12:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149135.275685; Fri, 02 Jul 2021 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzIIe-0002KP-T0; Fri, 02 Jul 2021 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 149135;
 Fri, 02 Jul 2021 12:29:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mhJ0=L2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lzIId-0002KJ-Bm
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 12:29:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29b1941e-db31-11eb-83ab-12813bfff9fa;
 Fri, 02 Jul 2021 12:29:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-vftSAFXgONertm_4dqtRnA-1; Fri, 02 Jul 2021 14:29:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 2 Jul
 2021 12:29:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 12:29:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Fri, 2 Jul 2021 12:29:32 +0000
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
X-Inumbo-ID: 29b1941e-db31-11eb-83ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625228976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXCXkoq7qZBEYwgC4hG+ro2jpvJk8JLQN6Z4zTZq0hQ=;
	b=nwZR5yMPlkSU5sDEzmSpPiWKQAQ7wDxVFXs3oX2WUxi4ViZPbPOaCpNM2C9oUsmf6XoS0q
	PvWGbg1Jd9rC+19cWEWi7XKQE9koaV74dCPOJ3816LzzOQ2q3bhzSfrocVuynndcaHp7Pn
	XAuzrMj+MY/7dd37OnRVoyGlZ0vAv9Q=
X-MC-Unique: vftSAFXgONertm_4dqtRnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8bN8gQjkon8mrsXNk5pu8YrATEWXhKBB7d79E4HJOXut9fJeZzyhXI1/wXiz+4CNQGMAkXiv8x1svRVx644n2K80k7hVojrpwAPrphXqjxW9TzRicvKLbrEudlaamrbQ0b9YCkpicjgow5JaA+nbFl6v1rmjJBUfdWkbUOUCV2yCSJHAy8XZCMKmxjMkgSs+PSVPz4BWy6ewHwvCqORN3u1eqpBZhRyClHQrZB3oqDz6PhWDvZ8k4F+Fb4yZ3aiM3AoXK5xDf1vtuhEqv+kHLRuEohCLIsG/jU128lO7AL+lsbrASzF00dkVz1ouGB5QOGIN97OZ4FHAHzpaXew9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXCXkoq7qZBEYwgC4hG+ro2jpvJk8JLQN6Z4zTZq0hQ=;
 b=VOHuIxbCpg5GR8qL0gR41u7D2F1Cg4TwWivihmQV4vQsdtsxBlZ5yDgNmsba33qgXpjCG/5Xo2L4cE+LyoE/wFA/shuM3R7Rl+P4w7k5e7qRXn5lMgYB08XB3bwK50t5bpX5Uwz4NEZ8miL0Gc2iFO0nD96NnqSSwGEIeXkKKz/K3XsiEu2Eo+jE1Dm1ph0BROlKEF0OsSBJyF9JtP5tFex8C4bYhRHblEb7BsdohngBAjzXREkJrrmaQzjNv0BbDhqccqpf0J6RRSCB8UsMLTUJ52VRCfwibcU/0JkXhrpK9RFUjL4j3EpFvwXYj0Wlj2CizK86vD37ri/Tjhpr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION
 domctl
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
 <YN2Mujj8jKGv7tik@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>
Date: Fri, 2 Jul 2021 14:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YN2Mujj8jKGv7tik@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e9c49c5-a595-4117-6b45-08d93d550b69
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393443779A2C13B6B379532AB31F9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mxBPYuRUJI13yJgLB/a88r9N90OUyhTD411Pq4Pug0avOvFH7cX1R69BoBePIyFg3HyZKBLFzWZUkgc+Zp1kPHHOmvsPwf0Ewb1AjOF+TJf1lTQ9aQj9SVc5KfK5wKk33whkmkFauIevkLS85Q4hj6HFODqveLkhptozecxVzZQYNzkIcU/r2WM5nchu0E+rIo0DyBrn0DD5Orhlawz98naWvbJlBaL0xlObSbSr/A63ZYowpNp/3DtIjgYU5tPKHIvaM/2Rsf6/MXeg6Aw0HfrTzmmWOuuLNS8VlGZ/Ea2SIdnVTKA5J1znwjJQonQJT7WTp5cJ8df5DyEZ3vQVPHY+C2cH3ZdVB0FB0Gvul7LPt+cFtuqVdeGRkgT39TsdYB9/42bfNDKdxw1i97u+IvANnE2S3GoI1Jq1H7GNQJ7/NyRioG9fb/btaytbJ9aLpzSSDEMXyupxU1rBe38tMy5YyHDL9BQf3lsnUdkjQwdHPa/juuitkN2GWhOiUtj9q4e2ikvUT561+cXJE3Ql8Dxl5NM34NXeFUXQdRPtTIdq7CjFYPTkDxF8gs28enx//1ckTrPvTc4hqqx2EozHqAgkmcr7D7TthjEo7btgmFSuUIXM4wh+yfv1+YPfI4brq/IbE8H9hTy0xcWNtM28JcPsZLFXWj2+qa74IC9zYZ8BteAZJeDgO6oEuohHNg2jsmSY9TVygvwcp95QtvGHvbiLMNkZoMMGW+7iCXg+Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(26005)(36756003)(478600001)(8676002)(8936002)(16526019)(186003)(66946007)(66556008)(66476007)(6916009)(16576012)(86362001)(316002)(6486002)(38100700002)(53546011)(31686004)(54906003)(2616005)(956004)(2906002)(4326008)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlpNOUxqb0llR2dsd3R6ZDZtVEgxWlRIWHIxUkNncU5Rc2xTRmlvOGNnMVV6?=
 =?utf-8?B?VW5sREpVV2lLQ1B4QmlkOE54NEd6bFdkK2g2RWpzbU1IZHRPM25TL1NwTitl?=
 =?utf-8?B?bzdFOGZUUXpCOStrbzVEMXhrSXhXZkZXVVVvM2ovMEp2VUpUK2VJMHIwS0Jp?=
 =?utf-8?B?NUZHUEFvdjR1dFdzOEdNdUdkRUVMM2ZMTEdiTVVJVTJ2a2thL1RIcy9aaFM1?=
 =?utf-8?B?aGh1VlhzV3ZQMk1RT3FLalF3YktIQitkM25scUFKM2d6TmlsZmE3YTFyVjMz?=
 =?utf-8?B?dGxyTDBiazgvTndRM09zc2hteitJOXgxam5SQ3VFcEgvejgxdDZMeENqSDR5?=
 =?utf-8?B?b2dLWDNiZTJuUklpbEluSGF0N1loS05oaW5UWXU3dmlZR05qL2ExTmIvNmRx?=
 =?utf-8?B?YXY2Tk90eGJlTFV3Z2lSeXZHSjhacHVDVzFSTUE0UGxLU3hlaE0zSXdjZTNh?=
 =?utf-8?B?SVc2V3lYdmFpZzFyci9lTm96SHlOWWVXUmdTWldaQ2pWeU5IMkt3TXZBU05P?=
 =?utf-8?B?WDVqeXBHNHo1VXVJcDdvYkwwK3NvdkhNRU52Wm5QSTV2ZjBtcFVBa0FkSTQ1?=
 =?utf-8?B?YU11SE1rbm5haGpMNjBEa3B3TkFSZ25oeStGanNsZ3ExUFJGSE9uZ1NkS3lk?=
 =?utf-8?B?ZHE5TUVhdHd0MytuN1RYaHpNa2h0R2lQWS9HNXFYaFFHS2Vpemh5bk1ZU3RY?=
 =?utf-8?B?cVV4cjdyQ1JkcUZvbmVuSFR1cmtUY0dDNURNL1MrWWg3YWVxLzRPYm1lZExK?=
 =?utf-8?B?N2k1dGovMyt3U2p2NUJMeEZUa0tKSjIyWjZZN0lmajU1eDd0b3RGRkV6UlQw?=
 =?utf-8?B?ZHl4NDdrYXd3eWVYR2R3RlV1Y1JJdHdjRGlSaGtpTGt2M2dteUFsOWlGcCtC?=
 =?utf-8?B?VWdxZ0pZR0ZOQ29RbzdGQmFxMGhDbDVRWk1OazQzS05JTGRMMWYyd25NUzNB?=
 =?utf-8?B?UnovRlgxSDAwaFZHUi9EWElNcklKS1BhTVJBV0NHUFdNSEtIb0Q3eWFvNEZH?=
 =?utf-8?B?Rm5KZldHMUFZcFpNU0FKZkZGWnlsT1FXYjNvcXlPN3BySVoxaHJJVUljOE1O?=
 =?utf-8?B?Q000eFpZYS8wV3ZieGVGS2RQZDF5RmlXbEhyS0RmTGpVQklOdzcxWEZxMEFT?=
 =?utf-8?B?NHlMZG4ybzJSQ2NVa0JKeDBjbVUzRHlIZHVVRkpSWGxRdHI0SnRMcTVBSDNM?=
 =?utf-8?B?ZTE1eUNQUkV3VUZkaHc0eHlMZXE4VDFEeVlWdG1vVnBTdllOb0hxOXFGRFVQ?=
 =?utf-8?B?OGJYU0hZeUt6Ly90NCtPbURDbHFSd0U0eVRSZnppWkNXN0ZQT2VsQWZjMkpH?=
 =?utf-8?B?Qjloc2NaUHowb2RZWTVGM1pWZDIrRkdrWnhzNmlkYy9ZY2wrRmxLck1rcTBq?=
 =?utf-8?B?eFNlT2VKSkFHdTZlZEI5eEJNNzZpazZJV2REUldEUjRLdGtLVGxsdGNaSVQ4?=
 =?utf-8?B?WjFrUlNnbEpyLzRDNE16UkJVVXBxZWFBY2YvY1gwckVZQWYybzE0aFFMbE81?=
 =?utf-8?B?T2premtDUVVacWgzbDB6QnpxdXlGSFVJSlNhai90RStRWVJyLzNIS2F1cGtP?=
 =?utf-8?B?R0wvRlNFcE13WmJiWWUxRm5MK3FkOUprRjhROTV3WkhKUE9wMjZ3aHpqemxK?=
 =?utf-8?B?MjRtSmF3NWF4cmxOK0JzWTlCNmxKcmVJcFVjZjZwNnBCVjhlREpwR0VRdTJ6?=
 =?utf-8?B?WWtyVU5LTlhzdXlpRWxqSm1nbTdlMk1URkIzSUtQOTJUMHFITXNHQ2VCWS95?=
 =?utf-8?Q?0Gv42Y8GOzmyPvMPxNzxaCgylZ+x7d3d2ClSTeF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9c49c5-a595-4117-6b45-08d93d550b69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 12:29:32.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJQisQjKkzqC0Cbcz2WDT+xDX+9oS7v8RE64d1nfEKtDm66iHAbMe9QH8RCy0Ag9x6YDLTSfS4jEn/s24U0vgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 01.07.2021 11:36, Anthony PERARD wrote:
> On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
>>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
>>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
>>                                             1024);
>> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>> -                          NULL, 0, &shadow, 0, NULL);
>> +        int rc = xc_shadow_control(ctx->xch, domid,
> 
> Could you use 'r' instead of 'rc' ? The later is reserved for libxl
> error codes while the former is for system and libxc calls.

Of course I can, but I did look at the rest of the function and
found that it uses "ret" for the purpose of what you now say
"rc" ought to be used for. Seeing "ret", I decided to avoid it
(knowing you use different names for different kinds of return
values). While I've switched to "r" for now, I'd be rather
inclined to re-use "ret" instead. (Or actually, as per the
remark further down, I can get away without any local variable
then.)

>> +                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>> +                                   NULL, 0, &shadow, 0, NULL);
>> +
>> +        if (rc) {
> 
> xc_shadow_control seems to return "domctl.u.shadow_op.pages" in some
> cases, are all non-zero return value errors?

Indeed it does, but (a) we pass in zero here and (b) this
operation doesn't alter (nor even care about) the value. So I'd
prefer to stick to what I have, but if you tell me to switch to
"... < 0", I will.

>> +            LOGED(ERROR, domid,
>> +                  "Failed to set %s allocation: %d (errno:%d)\n",
> 
> LOGED already prints prints the meaning of the "errno" value, so we
> don't need to log it.

I see. Please note that again I took neighboring code (a few lines
down) for reference. Judging from other call sites (not the one
right below here) I infer I also shouldn't have \n in the format
string?

>> +                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow",
>> +                  rc, errno);
> 
> Is the return value of xc_shadow_control() actually useful when errno is
> already logged?

I don't know. Again what I had matches what can be found a few
lines down in the same function. But looking at other uses (in
other files) I'm getting the impression that it's useless -
dropped.

Jan


