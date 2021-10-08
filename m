Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592B4265FE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204571.359733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlK8-0004WE-Hi; Fri, 08 Oct 2021 08:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204571.359733; Fri, 08 Oct 2021 08:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlK8-0004Sy-Ea; Fri, 08 Oct 2021 08:33:48 +0000
Received: by outflank-mailman (input) for mailman id 204571;
 Fri, 08 Oct 2021 08:33:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYlK6-0004Sp-C9
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:33:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73259c34-2812-11ec-8025-12813bfff9fa;
 Fri, 08 Oct 2021 08:33:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-SAnrG23LOCiUJQZQfxzFzQ-2; Fri, 08 Oct 2021 10:33:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 8 Oct
 2021 08:33:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 08:33:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0042.eurprd02.prod.outlook.com (2603:10a6:20b:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 8 Oct 2021 08:33:38 +0000
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
X-Inumbo-ID: 73259c34-2812-11ec-8025-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633682024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aCodjr1taws3K6Jb047WlFcwqBmnnBnKcuBfc1FYIU=;
	b=d1XGOnV1JAoshatyjHcJeQ1hbQMeC9pmycvIGFlb1g0sfznwIxnW/LqnLwyLICVtRku4Uf
	lJ+OE3GMiI+2+XqCgJ09TnV2PH9eIoM9v0NJe5jVLL1Vr53kiKnBx5Ku8gcmhB3bgrgh5d
	r5G0sE6m8eR0XGJP+Rp0DDdc1g/eHT0=
X-MC-Unique: SAnrG23LOCiUJQZQfxzFzQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ7e3qOf/L8oKKUnGmVKTv/5njco9B5o9N+Km1qF/+0rkScDJDoGnr4IHgW9Xb0DfC+VGm/K4gQPUSmAvZE+79V/aK5nlaS3k4QwvYVwgJzFG89E8VtRN9dgTGGJ4LuDETNRLXwPYif2HNKgUOeGRg1Q30bbfn38CRZZh/qOyB5xtyXqkDGeb1JPlZnvwGmw6jKzbCQvXFzzay1xWH35Ln+0dN3Wv1lQmq2sh2JLmMTgdFPIt6xPelJPhVkD4V1F47bdGs+p1JpbdxhpQ2SZtwkOIVdxzQnx05wZgcHUnBdnk3g7t0f81wAnPWXzehoY+5D4AUOJrvQ7ZPr8+GKZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aCodjr1taws3K6Jb047WlFcwqBmnnBnKcuBfc1FYIU=;
 b=FLW1Mynvr5AJLqKjXgIv8rWnCH/JII83ZC6kDDZO2RQc37qVDrGMvA+bKyO3V9hD1WX/93lLh0vKHQDtrPaa19AEbQGNXaf0XxPNWuZWxhCt0t4EqfVPbhT5drLkz7nHo7wAO9iCpQN0JpmTDbKbP4s++/yPzf75FzrQnL+PApIPju9uBElJNL+QydgbSoYeS6wWioIYAodfXj1L8iSjAasXvkn6ELKNtAVYnJSigvRKWIxc/BmQJUlxKM3bAqHvkC3ypHRxG4mV1UJfPoRDzup/C9677zpB3d6nn2wSSUXDXPNcCjDNVBDyZIGMR9OfwtVfx+mNr2daWZicmD10ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
To: Michal Orzel <michal.orzel@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dce7709d-a68b-a8f0-a752-6eaeb2e0ce2e@suse.com>
Date: Fri, 8 Oct 2021 10:33:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211008081933.18546-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0042.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c7ce8d4-dd5b-4114-8faa-08d98a36542a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605FCEB6B80C6E8AF1FF166B3B29@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M0bbFjt+gAlzkFs3NVxLQpo1MXWp0+Y9ncuyEmZ/3gRjSWEEcybr5URs+G8/cCZgfS+R4Cj8Fo17eHLk/fZz9UpvUnxWBZx3EIYF5Ds6Qb1bf8b1qJSBvkV4AGYyxViRF1u9W+XdgMPhVGwgpGE493Plz/jRN0BouzrKTS5KnWSJHLRqYl2x+UveFh/+JlweJg5nPZu3YoGP4Ugb/onOb9f+tx2NNPMq5stz9jdGtOmMtSCsZmswKdT4Hf5zGCKSjy6vScLCFVOoqh1X21JOQsIVn719J9cdt+IYOtZvEct+4sB2br3/Zg36JMRFd2eHWwaTyaqV3EaY3DkNu+DLaxuLbHkU/of2/uggIyZJXUhjXllP9WS/BD8v0KC7uKsGlYnRWmFLSbaMfBgUT6lw5mlf7qykfjsqjcFx/ckFpsTz2IalBcHnn2r7i8w4JcKqNhF8Ym2Vm9K0uHXnVwVdSOsA8Iww7vQS1Kgt3BjC7xxDne/47WajrYGr4hNimvspSWQQ3JLk8eINJW0xmo6CjjbMbSsPUkgdmMTQ6wtp7569UhY4r+cLU8Td166xDb/cWKww7oG8FVbUMFTxYtmoz4jcwT85TmVUsbQkt4tGztAPHl9hEwHGn2jFqfcQXUseT73yzqBLg3ciWJ3TwTD30nkP8BKQ/KQB5w46O+gqFWU9R/GUYlDtab+A9qaXaSLbw0Tblsso3ZIckq0OKE+oF+2f9xCMzMECrvsqKF/ySIx9Kh9aD1vYBCXaxQ329BQa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(4744005)(66476007)(2906002)(16576012)(316002)(36756003)(4326008)(956004)(2616005)(53546011)(186003)(54906003)(6916009)(31686004)(38100700002)(7416002)(6486002)(26005)(31696002)(66946007)(66556008)(8936002)(8676002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDdnNEhzb0s0NjdjWklSSkp5MVBjNWdJWGF3SmtzbHBJRkdOZE0zN2FlNlZw?=
 =?utf-8?B?WGcxSUx6NDNteTh1b1BGWktjekN0c0lHdEhOOW0rNUoySUJ4YTU5KzNES21N?=
 =?utf-8?B?U01zQk9ZdDhibHFtUUZudTkzZk5SMzR3WS9FMXl6aGtNa21manYzRU50UWZE?=
 =?utf-8?B?aVZCS1E3Nzl4RHpzeHMzZTlhN25Oa3grMUxPNzliRDhPV1RSYVpjTkhBN1lG?=
 =?utf-8?B?MEQyS0k4S21PajV4aEsvZDlrN3UxMGMzQ0Jia2Y1NUFRaTlDTEhGcXNUTHc3?=
 =?utf-8?B?U3lEbU9qSmxsRWQwRGdjb0J0OEl0eU8wU2xFVXhWMGJQTFhhcHVPbzh3cWsr?=
 =?utf-8?B?czJ4eDZjQzY2ay9ySlBTK1k3T2hEemJJZ0V6bkh2RUJOUThiWTBMU2NoNHVS?=
 =?utf-8?B?QTNkUlNqaFVTa3VaaWxTV09iNlE0QU9YUWlXWUoxeWt2dmQyS1RCMS9IYmdm?=
 =?utf-8?B?Z2FsMVUvcFdPK3hxR3F0LzI4YVhXSVhEK2NTOGN2QW5qemhLWmlXZjNRYmZy?=
 =?utf-8?B?MDU0R0Fsb0dRVzlnSCtNUHU4Qmx4ZWcyRjMycmxhMExXM0FBcldWdXFIdmVy?=
 =?utf-8?B?RVhTWkVOWkIzdHg1WHpzZVAvRlpDRk9qdDJwWUhueHVsMkl3N1dsZS9iOEd4?=
 =?utf-8?B?UGgxSmZhbGdUUmJwSDlkeVNFU0V2Z2pNZFZLWUZ2cUtCRWE0SUZQQ0ZxUFlN?=
 =?utf-8?B?eUsyVnhvNHRwek9oQk00RzU2SUlXU0FBZ0NjaCs2S2c5ZHJDakZrVkxTTUpJ?=
 =?utf-8?B?dTA5QzJKWmk0eGlOTmZIZ1dndlpwdVpSd0xVNU1YV3RRSzQ2d3RYN0lVV1pR?=
 =?utf-8?B?RU5DbkVjZjhvUGFqczdXT3ZpZUplQVRkWHczZWw5clJ6d2VrSzlSSnlQZEV3?=
 =?utf-8?B?VkhIckJVaHJUUXhXclVYK1VtUjZjRU1aTEQvRUpVS1VLUGpTM2JhT1dKNksy?=
 =?utf-8?B?RTdmVjNzK1lHRWlzN2hRdmYxUEptL1pQcU5HSEw2eVljME5CbkEvRGN4blFH?=
 =?utf-8?B?UjRiMTkyd0FuVFpUcUlzQ1BIVnZiSStCT3ArN3lSNGZ4NFJISHQ2Y3h1NGxw?=
 =?utf-8?B?eFcycWdtcEl1RnVFRWZmWGdRaGRSOWxWR3RDZC9wbkUvL1ZuWkRYL2kyVldW?=
 =?utf-8?B?UFFQaEw2ZmNVZUpBeldnbzNBWEpzQ2I0blJrYnl4bUFPY1BPdnF6MXAwdjAx?=
 =?utf-8?B?eUNSczhDTUtNS3prcDF1V2xKM0dzdXRVSDEwcy9ZNHpXdTNlUjU5d1lHVnd3?=
 =?utf-8?B?VkdCekZESFVDN0haczF2V21iRldRd1ZmOFNVdXdwLzVNQWZVYmZjaGJKa2x4?=
 =?utf-8?B?SlNzRHRZVjZvNmIvUmdwRDg0Zi81SkhNVG9WRjZYUFhmMUdzVk9sWU9jblAz?=
 =?utf-8?B?MmtFTmMvL3FNT0xQNjgvYmJTWFhjYkVpcGpxWk1FeVBuRURncjlrczFORFdG?=
 =?utf-8?B?ejZBaTFNa1J5TjdBdyt1d3kvY29JSjVXS1M5ZVJ4bkQ0bnlpUlppZUxselln?=
 =?utf-8?B?d2tub2VheXIzc0QyRjhOOVhER1ZsMnFQcFp5YVlySTVvMWZpdHd5R1MzNStL?=
 =?utf-8?B?L3dqbkozTHI1b2ZwMTNCSExjNXRoQUJrNEtrN25mbThLc0N1bTE1bG5xSzhv?=
 =?utf-8?B?Y1hoVjh0OWdhNWVsdGJLektyelZPYUNhRmI0LzZDY3J4SkZqS09EN1VueGdu?=
 =?utf-8?B?VDRSZENsZkVCcHpZM04vMzdQUm8zUmhGSGRHN3EzMk1QcTJkUjhVSCtCUmlu?=
 =?utf-8?Q?1eYgxTzDhluNUGRGtoMq1EgnXrFUT46vpHP2kq5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7ce8d4-dd5b-4114-8faa-08d98a36542a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:33:39.5497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VJEoX35jIwpQrmo4wUaN9pNjuKVRDXsUqHO00UHt18d930zP34Tl13xdhsnQX1bVotF5AWGzzeJ53kydIecMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 08.10.2021 10:19, Michal Orzel wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,10 +100,12 @@ struct xen_sysctl_tbuf_op {
>  #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>  #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>      (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
> -#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1u<<6)
> +/* The platform supports vPMU. */
> +#define XEN_SYSCTL_PHYSCAP_vpmu          (1u<<7)

While purely cosmetic and easily fixable while committing, I still
fail to understand why you did drop the blanks from the expression
you adjust and why you didn't add blanks to the new expression.
./CODING_STYLE is quite clear in this respect, and even the code
in context does not suggest any alternative style. (While code just
outside of visible context does, it should not be used as excuse
to introduce further style violations.)

Jan


