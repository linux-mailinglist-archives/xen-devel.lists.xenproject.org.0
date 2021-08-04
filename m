Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88993E0500
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 17:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163777.299905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBJE4-0003lE-Eq; Wed, 04 Aug 2021 15:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163777.299905; Wed, 04 Aug 2021 15:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBJE4-0003iC-B6; Wed, 04 Aug 2021 15:54:36 +0000
Received: by outflank-mailman (input) for mailman id 163777;
 Wed, 04 Aug 2021 15:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBJE3-0003i6-61
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 15:54:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42842892-f53c-11eb-9b79-12813bfff9fa;
 Wed, 04 Aug 2021 15:54:33 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-6S3CnRf2NtK2HfizuePh1A-1; Wed, 04 Aug 2021 17:54:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 15:54:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 15:54:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0078.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 15:54:28 +0000
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
X-Inumbo-ID: 42842892-f53c-11eb-9b79-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628092472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9R8XRmgRWfKimnP7+3lH7L7auzHWStrhZzNm1oknPs=;
	b=i9zXSFZ1zpDw4Lqz1mcmoF0iWR2PzIkWgBjjJBANX1HHgK+M70mE4N8/icMOCud16S7i48
	tOLfunwSKktKTs5ln/q85il4h5Wa3BcmzbwPJ+4uTpJfO9F1L6Xdh1pWpuwSd530B1TAbv
	AobEfonIRr6iTae8FCW6Byno9TW8Z8Y=
X-MC-Unique: 6S3CnRf2NtK2HfizuePh1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEaIYrsDH3hkmiIUZbn93NW8vu7R4fDbLZRGGCBO1uA+Cs6wHOaxMUWZGPU5ThqLYUyanySG+dWLJAQVMkM42YdWvFKN6xneYTMk5jEByraqkIswTXzDjOfdG2Rv7mfJXIsaFny1uI1DiwfrxJfXXpOKxq67xtGNFDOKA3n3IhtMyY8uQuZ+H7y6UVRpJQ+BTp5y4kwOCmIQqk1cG3wzG5y1cEhRwxv/iJAFL/ID1P6Jm9pj0QsnbVz3DF6qb3Bj3UPRWWPSoTlo7oE0L4C5/BCMaGBvsZjbKBkzWEllUIuzwrvbMMftc9Sg4n2W7pWZ7yuP1tX0HV/ne5KW2oKZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9R8XRmgRWfKimnP7+3lH7L7auzHWStrhZzNm1oknPs=;
 b=J7m1kEWFu86sKUX3rWc1Utk+EsGs5B52uVKLK3MwcS49x8Mq8gL26ZjRv7FiZlmWkIiBkqbppXUpmspD+ka9Ty8ka3JBZU3HrrJ0obcop9QedxsPRCJ3cPmRUTmYv9lMxyRmrO8T/n411pi1rcwpOHZoeKrpf5pIgPI8qaVKFyr6ksE6ugZOJFHhmVcI7xb88wFvR5euUI4hzrw7cBj304dTSOF48tse4hPyQ794evIl9ebDh/bGqq5G21rh2uKhiDxNcretC9UaZSKjazLXMFjasjRmTwizCDhW8PcKXWftWeIXGJLeKAuXQcFD9GWdyzihpw8yQbXaowcN7M4WNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V4 05/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bed307b3-b656-7405-c66f-394d54f846d7@suse.com>
Date: Wed, 4 Aug 2021 17:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210728102758.3269446-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0078.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aacc89ff-ad93-4da9-21bd-08d957602464
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608B18E236055F0FBEC7915B3F19@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTVKNZcI9/HpIn853182N/Jjz/V3MCxfpLxdnjH2PtIfULFeaEcTZeDru2eOBh29ZQwiOqNZ26GCUlK0Q81ZLmC22EuW8Vt4z/Q5FVvjs1dodr1Ki+PbT3S/k36L0KbaG4gRWPYK3pp6JgIiD/xeUYaGD7EOdhCulsW/nJPB6coXSfeIOd0A7UqL/NKf5Ost4DoSufJoNKLbIm4lq77XzXeNMFFMh6xNi1ozkvK4XERqpVr/howYFrMmXaDVUK57bSPE1q1d2SPad7PoC4gBDXsqSuTnuEuhBb4QKW+MydK4lTIS0Gv/ILvA6y/8KymBV19c5DaS0SAIT9goJLp0rU57ATlzffARzR5SjPphKcaB6KBSjpxPiE4Za/uhCDeQ5XXeyK9AO1tFF8KWEd25TTUlG4ya9U3yY8QkYxp0r1nIwJjTz+2ibCeOgUecufFQYI59IgU6MivAQZbddzZOiU0leeo3BYzPwK4WRdyjseDPeEHVjyxzdI8k+Nrm8vwmIGfg+0h/z1x2H8niCp7awp05sLlNCZrEJv53gD5UC+PEZ7Q1OALF3vpxtttae28cJ9wXpBdzlAjzcsCLsun+XcpMZ/wKL4AyP8ZAgc2xCmTmaACA914FMZiHBqHJLX4sf0nXwk2bzzIiCjXSgdr2HP8NuHfLPLTVacRQ0N0KXOR8POnA/5dKjFTYFUOI7L4987C14vAQV5AkYXCxpelNwUiBoBsOdxSkxUjuk5jfXEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(316002)(53546011)(31686004)(478600001)(4744005)(6486002)(16576012)(6916009)(8676002)(66946007)(86362001)(5660300002)(2616005)(38100700002)(186003)(31696002)(26005)(4326008)(66476007)(36756003)(66556008)(8936002)(2906002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RldLN0s1UzJEUHpMWUQ1TnVWSk9PRlRaRkttKzJuL2hjSnJQbEdLUk9WOEFE?=
 =?utf-8?B?ZXRnc2pkc1lmNnpOK0FkQ1lNSlZpVXZDMUhCSmRBWDcvTFljcHgxYU5jT2lQ?=
 =?utf-8?B?aFB1a0JkNDZKM3BlbkRjak9JMUF2THVvMFhxa0xYSkV2aUtXVnBzbGgvdkxL?=
 =?utf-8?B?TVdkY2NkcEtOb2NVYjBvVkJPeGo4WDIrKzNBU1FDR2xrRFhMY1FOS2lvdEsv?=
 =?utf-8?B?c2JmV01DSVQ1VGV2NUVERmI4WktadzVzSElIUlJreWJvSnNMeXF2SVlvbUJx?=
 =?utf-8?B?YnJvNGt4Q2J0aldKcEJ0cFVFd3c3Tm5FQnY5N0U5WHIzVXkxVmR6VEQ2d01s?=
 =?utf-8?B?OThNSDVoRE1GM3BYNHpLT01LdThaQmZ1NmoyRWpIcnV0UWpSb1g1QzJMcWZs?=
 =?utf-8?B?WmxtQmkrMG90akU0QTJRRTBwVlBySXdabXRGMElycGwzVnlGWVo2UzBKd2hD?=
 =?utf-8?B?elRlS2dxUFd3ZXB1TmpwcWRwYWtUem0zeVE2VEluRnpMcFRwWTFhblcrVWlW?=
 =?utf-8?B?NkNCTmQ1SWlLZXRPVEVZYWtIWlpGbWRUUE02bUwyTnFzYytOenV1UStCTElI?=
 =?utf-8?B?N1A2OENwcFhnSzNsOC94c0U1aTA2TmhSUWNtRDJnaWdweWdvdk9DdmhkRkFh?=
 =?utf-8?B?N0gyQzB0RXhza2RrUGVhK1dtZmI3MStYdHZ0TmEzYnRvY0RSWmlWeW1aZlph?=
 =?utf-8?B?MGpEaG5TK3JOazVidDV6LzFVZDFwYjY1ZWE5NWg3aTREQlh5U3pwbDl3b2Ri?=
 =?utf-8?B?OVBDQUF4aUxhRWgxemtXSjkybmJiTzF2ck5rZVZrRU1CZ0JFQnA0WnprbUo2?=
 =?utf-8?B?ZnJHamgyYVZaWDNSRWlNYmQ5MWI4V2tXWERFa04zWnVabzNrYkp4dmx2dnZX?=
 =?utf-8?B?SHZNQTNsZVhvVmlHRlFnZVIrWGRuWjdTallJUCtCdmQxZ2tiYVBkTERsQlZE?=
 =?utf-8?B?VjJ3VDVKSkdsbFE3MWtJeHl6YTE1WnF2bUM1UFpxTmtuck1ZaHRSdS9kaFJD?=
 =?utf-8?B?V0R6Q2xiR3NZRlYwR3crV3RCSUwvOUxDWGJnTFVPbGU5cVhlZDI5SUkrYnBK?=
 =?utf-8?B?dlYyMXFRWnorNHpIQyt3WWN2c1pMWVQyRWxxU3BUcmhPV3hBZmRrVndqdzNy?=
 =?utf-8?B?bW0vVG9oQnlrS1cwYmIrQnk1Y1BUUVFMVnRBVEZPbmM4ZEMwSFYwZkVaTmR2?=
 =?utf-8?B?UWk3cExPaUNxV3ljTWNqUGgvR0tSZW1QaXpKbzdqMXhYVTNheHZJQUtubWJl?=
 =?utf-8?B?bWRSTlU4VTA0Yng0ajhBQmdLMk9WWUlIdk5TRFAzTmJjWmpPVjE1YTVyOHdF?=
 =?utf-8?B?NXRJUDQ0MTdwNlR4c2d3MGVncE1wdGJLSkJIaVZIUllZckRJVUVDaVA3WlNF?=
 =?utf-8?B?M20rUGhTS0RpOThJTFVoMUN2KytRdDVGczVkK3krN2NYUWtmOENUUEhpSTdq?=
 =?utf-8?B?NGMveDF5TVlRNS9IU0Y4ZVV5SmdLdlN5WWNUWWFXdzBmMlBZOXBCN093L3ZS?=
 =?utf-8?B?cWxQYUpzeUtINDBGY2VuZ0xMR0hEbDdLNFQvZ2IwbnBqUDZkT0NJNWJDc0hY?=
 =?utf-8?B?VTgvMkx2eGpuK3QzRGU0WVJ2M3Q5VENFQjhZdmVHUHVCTGliemZqQnRZT1RK?=
 =?utf-8?B?blRFQTFuRWo2b1E5NmdrZlluZG13SThCSGN0R0pkMHp2bmtTcnFSSERpMjhl?=
 =?utf-8?B?bU4yU1FHNVg1S29XcVlYQ2tURUJXTEVvTWFKc1VJWnpueUljNU5xQW9HY1hT?=
 =?utf-8?Q?xeLb5ccMbg/DH9Q6hqZat/b4F8qvCyB7rDZIC36?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacc89ff-ad93-4da9-21bd-08d957602464
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 15:54:28.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eys0Tw2tFpL20eOWuWjHiVlUl3g9Su0h/+sSpMrePyXVIGDKtvKcm/C/CJ+Mk4V+mYs1+e6TxYcmL5zsCzHjyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 28.07.2021 12:27, Penny Zheng wrote:
> This patch introduces static memory initialization, during system boot up.
> 
> The new function init_staticmem_pages is responsible for static memory
> initialization.
> 
> Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_mfns pages of static memory.
> 
> This commit also introduces new CONFIG_STATIC_MEMORY to avoid bringing dead
> codes in other archs.
> 
> Put asynchronous scrubbing for pages of static memory in TODO list.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Common code parts:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


