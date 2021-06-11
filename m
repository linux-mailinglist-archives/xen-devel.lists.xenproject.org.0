Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8B3A3D59
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 09:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140249.259176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbkq-0005el-MB; Fri, 11 Jun 2021 07:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140249.259176; Fri, 11 Jun 2021 07:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbkq-0005cK-IH; Fri, 11 Jun 2021 07:39:00 +0000
Received: by outflank-mailman (input) for mailman id 140249;
 Fri, 11 Jun 2021 07:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrbkp-0005cE-J6
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 07:38:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 676f9e80-1b45-409c-a5e9-b107cb70d5ba;
 Fri, 11 Jun 2021 07:38:58 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-VKyVc1NSPQCeOb4e9aUOjw-1; Fri, 11 Jun 2021 09:38:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 07:38:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:38:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 07:38:53 +0000
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
X-Inumbo-ID: 676f9e80-1b45-409c-a5e9-b107cb70d5ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623397137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X11Ut+Mjv9dMzNg2zGs9HBO5d0wHIHjV5BuGHTa6zMc=;
	b=YoIB0S38T1+X0GJF5SsEl+NTXm6BErkcxcSuJsr/sEll1AnNQKro3UtIMHewUAyPSgezkx
	phwOoBVPmxKeCYdWIyDPb1yISOCedaF2PJ8zY11jua2RsQAXqABdl6cxcY7OggLRXU+PUl
	lXdOJxOM1IGejT2CJ9RXzlKQtUYnhfs=
X-MC-Unique: VKyVc1NSPQCeOb4e9aUOjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlN0fz6ZbqLziWTH9npyxaEyvG9KZHmYXbFloNm0EPSIex7zfCQEGKONPnBa2c8VkNIqvBT80S+VskdPMNfPTKh744n5lylMna6pOAlNCZ21qEzufMoxjvKkrwQH0D5Oof9BIEIWkg1OTDMjegxCOW65PM/+eoVpcffH5a3Dxj9dpaTs+6O2optewWDt+JXLSl3r9STv5oECpZAq3cva49SLZ1knu4Fl7cIjq3h25+PSAc2wvLZCGNg0a6u68BCzBdJ5vyPGu6uL1UXZwIPoVxUv8QZoIUhX7vXujrB72GpLNzXbOjFbp8z2owXYJcXhw+yJWfP71iygMxroAXdTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X11Ut+Mjv9dMzNg2zGs9HBO5d0wHIHjV5BuGHTa6zMc=;
 b=nddZC44p4kaGMTgo38Ey2EJtm4xoJYM4G/50L3QJ/sT53h5pDzlBDeg9M6FHHNx5OI7//ygBE3fDUdPHVZYBMT3l7AuC3RZD8CoKyt658RYyYBPx0ym5VJ8Wn0t+CNcRDYNuwV6pzYFBML2Q3yRXunTpytpnSeLadxch0mCXlREOFprkZwfsEZfUb5Cg1UTX9JwRAZvRvEvXGRafdEYodrpb39q3f6HAARCgaCrbyWHcTTVqWMAX7XLuViC/fYQmyZ9gpl/vtMXUAvbc2YmYuULRll77ncnJxBBU91N8MoWapmEhkRUeAakAlg79HNSAOP1rJpnxIHJAZ5rq4UsKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable-smoke test] 162597: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <osstest-162597-mainreport@xen.org>
 <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com>
 <E28F5F88-7D8A-46C1-89B8-9841071778D1@arm.com>
 <alpine.DEB.2.21.2106101644340.24906@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88b6c31a-d8ea-6d0c-2c97-ede8b01d3117@suse.com>
Date: Fri, 11 Jun 2021 09:38:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <alpine.DEB.2.21.2106101644340.24906@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0e49b50-c4c5-4f98-6fe2-08d92cabf698
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393501BA84FE7BF7B0112762B3349@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Q+Bi1m9UF1UnvtNWNS3c95/utVsm74/dAuoERKEjTBC7YqHCUdnRdvb3gbYc6d3DJU6OajT3bTFdz/c15qc73Sk09jn9xSiLlX0qQfhSy2vQwp3HYGkLMN/XujYCpYCDsc9yhvauerxaBB+2GHXfCwvaTj6PZHbjCMCPWMUBCPdWyfaYxalssZfadawWwlZho4WYS+U7BCW9lqsOZZJ6/zkTWHO3RNryZM5XnoJPWOSyLXBw+8RNzYnUD7SYPeLk+0SZ/Q83aduxfWO4xydUoGGGHoqmPN2GU5MruMgdB7ajR9Cepol6XuJvLk2vxpWWCMKhAYM94ktyTw6w4N3gTmKdLgP1DB78DGZs+jLvbEWzkE+bHtZVD6ZLP7gtlxiA8Lcn29hzUvK84hF95y0vO5OCF5joZbLBCT6G8SNvp+on1wSXjDSIwnP1jqXCw+80LJJdY0eH9fejcCWksyI/G3sKOdmwlqGc/TpnnsRidfdJYfVWXcUJUfZ3xwQwXlG9hXieuSIkZUyt2/TveyN+7WMakLelqr5qW+/HatqfUVDRlqwOW66zS4JbqwxpxDYTVtDO3aUptuDhivKAcfuvPgLKJkmLDJzPbFz7mYlIWIJ7uUKYdZTANvq14wyPdJBc/FAgyE5wHZQI4uovjTXBElWO3kiwUKT2CnuW+UdLMxlM+lNwyminLQX1CMCz1/l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(38100700002)(316002)(54906003)(16526019)(66946007)(956004)(66476007)(26005)(2616005)(16576012)(8936002)(36756003)(66556008)(53546011)(8676002)(4326008)(2906002)(6486002)(31686004)(6916009)(83380400001)(186003)(31696002)(86362001)(478600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amJXOHdNOHdUUDNxa0dtZHNwNnpTUE1sMXRtZDNrZTVVbEFhV2pWbGlxUksy?=
 =?utf-8?B?dEx1WlM5a0x3ZzhtOEJkZ1NaaXhiSURiYlptVzNSbU12blRRelV0VnhsQkl1?=
 =?utf-8?B?Q2lrY3dBeVVCNUM5bElGVTR6REtiK0xSOE8ra3Nmc2kwUmxQbkV3RnIySkpC?=
 =?utf-8?B?andBNnQvdUUzWGl2WUxpdG9QajJ1K0tMb3VKY0xhQmlFZktCcUJwNGpBSmc4?=
 =?utf-8?B?WjB2Q2R1U2NmdzAreG1OUlpza0lTZXNvWFBheTZ1SElUUlBKSUVVUHB6RXpx?=
 =?utf-8?B?cnhReFBhOUYzSExaWjNlYkJERjJTZkM3YnBPdzh5WEplM1FIcTF3K0FpeUt2?=
 =?utf-8?B?RkNsMnhBRkpaLzB3K1ViYzA1QTBCbVR3a09INU1oeHgrYnI2Ty8ybmNtcmNE?=
 =?utf-8?B?SHJ3Zk90d2Juam8wdXU0WkdhQnF3Zi9HWDdESXpVNDY5MjN5akFiRENZa0ZP?=
 =?utf-8?B?WldQMjNmbWJSVkFlakQzL1FXQ3FBNENMbEJWVkNWZk9jWFpzeUV3UXVYK0xt?=
 =?utf-8?B?b05KZXBzbjhqajlJR2hVVmdvQjNKQitybUtBa0JyRy9NYkNxMFNNU0RGd3Yw?=
 =?utf-8?B?U0JZTHFSaTFQWUt3UE52VVpoK20xSHdoRC9xZllIcGhhaGVIMDhZQVpTWjhh?=
 =?utf-8?B?d2NQUkplQ3pWNC9zRTBnMnZiY3NjeTVNMEJOWDRlRkM0V0tIaWdORS9SN0dh?=
 =?utf-8?B?Z0d4Sm9rL0tialk0QStkUTdDVFJJbTBkdmE4YTF1bmNSUlJiVVBCMVA4aTBW?=
 =?utf-8?B?OVlmQjlDUkNxaHhUNUUvVjhuT0xMd1pxOWloVzBrT0w4KzhYSnNIbnl5SU8v?=
 =?utf-8?B?aGRoREJZN3pMZWhUaGRqZXN5S2ZLY0JKUytXbHZTWXRoMnR5ZStBR2lyWWVy?=
 =?utf-8?B?UWFiaWVRVlFjZmdYNVlDMW1mNy9YYXhIeUJqdjdKRVVocUUvM0dWck9rQkJI?=
 =?utf-8?B?dzN5NDFUckMzSFlQQWM1ZzloMU9LelBjS0hyOTZPbWIrTmZsUTB3MHpFWkI2?=
 =?utf-8?B?Q296Myt6anZ4MHR2VmFpN1gyaGdHK29CaStRUTlOb1pQeEF5RjVTSUUzdzBl?=
 =?utf-8?B?d3JxMGQybUlaU0pWQWdnb3FzeUhqNHJvQlg3REVFRjNzK3NobUVGdWZwVklN?=
 =?utf-8?B?bWU1a3VZMUVMUElGSzJxMFpwckc0cGZ5L1Y2MkZpVmJEVUR0UkprSFlSblZi?=
 =?utf-8?B?SUc2RDhmUWxNZzJud3FaQk1pNW1pYm5NV1J5dDlYQ01obkJSbXJhZXVCd0Zq?=
 =?utf-8?B?alBZekFoNU4veUUyRitseTFQZU1USmUyMTBCRDF0SHRrektkYS8vL2gyM1lu?=
 =?utf-8?B?M09DdjBheXhmTHFQZGUzMkRTcnB5MjRkdW4wdS96NGZmUDhHbndTTlFJWExh?=
 =?utf-8?B?NVIzMUxwSldkOC92NVJTMDhWTjhYaElZZGo0a1d1TjFoL2pGZVNJdnZNdWk4?=
 =?utf-8?B?YmlCc1hBdTNHTUc1L2Yvb3c0STI2YjBvRnV0ODFzQ0FYT1hZMkxEOEVnUnE4?=
 =?utf-8?B?V0hBaUJocTNIRHl5L0ZabnVtbHpxTTQ2WnprVXJob3l3WGd6TzY2SlV5aThF?=
 =?utf-8?B?bVVxSEd2OUtHMksxU1JqZE5Wem5XUHErTG9qY1VvenVvcUo4WEpjOU9tMFFz?=
 =?utf-8?B?dk4yTE12QTRHaVJjRGo0LzdpYVJYbzVldHFLQ0s1RDUySjRzU0lYeFlVZldL?=
 =?utf-8?B?Ty9FQ1JXOEROSTd1Skd0b1JVSkdrcC9DZUNoZVcyUHR0cGdIb294VE53VnpH?=
 =?utf-8?Q?kL4cXv5g87kKrKZtDBvQj9zuHscGoLmrSwA62lJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e49b50-c4c5-4f98-6fe2-08d92cabf698
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:38:54.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSfsXMylMGflqofr9dzuLzFtNEFVmBzvutMSkhy0Xiw8y2iyWgPj7Wx587EoKHMuP2fALchQEL4O4PbHzhKr0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 11.06.2021 03:49, Stefano Stabellini wrote:
> In any case, I tried to figure it out. I guessed it could be a compiler
> error. I followed the white rabbit down the ARM ARM hole. I disassebled
> the Xen binary [1] from the failed job. "msr SPSR, r11" is 0x0026a38c.
> 
> The encoding should be at B9.3.12 of the ARMv7-A DDI 0406C and F5.1.121
> of ARMv8 DDI 0487D.b. Unfortunately it doesn't seem to match either one
> of them and I don't understand why.
> 
> 
> The "mrs r11, SPSR" is generated as 0x00262ecc. That should be described
> at F5.1.117 for ARMv8 and B9.3.9 for ARMv7. Also doesn't seem to match.

According to my looking at the disassembly, the two numbers you've
quoted are the addresses, not insn encodings. Using my own disassembler
(i.e. there's room for that one being wrong), I do get

        E169F00B        msr     spsr_cf, r11
        E14FB000        mrs     r11, spsr

the former of which doesn't look like an exact equivalent of the input
instruction. I guess it really is "msr spsr_cxsf, r11" which is meant?
In gas sources I find this:

      /* Unadorned APSR is equivalent to APSR_nzcvq/CPSR_f (for writes).  This
	 is deprecated, but allow it anyway.  */
      if (is_apsr && lhs)
	{
	  psr_field |= PSR_f;
	  as_tsktsk (_("writing to APSR without specifying a bitmask is "
		       "deprecated"));
	}
      else if (!m_profile)
	/* These bits are never right for M-profile devices: don't set them
	   (only code paths which read/write APSR reach here).  */
	psr_field |= (PSR_c | PSR_f);

There's clearly a comment missing to talk about the "unadorned" SPSR
case, but the effect is exactly what is observed: Rather than
defaulting to the setting of all 4 bits, only two of them get set
when plain "SPSR" is used. I've not been able to spot a place where
the Arm ARM specifies this, but given its size I'm not surprised at
all. I'd like to note though that the MSR description doesn't even
allow for plain "SPSR" (unlike MRS); only SPSR_<...> is described
there.

Based on this analysis I guess I can make a patch despite not being
able to test it, as I'm pretty certain you really want to restore
all of PSR; not just the low half ...

Jan


