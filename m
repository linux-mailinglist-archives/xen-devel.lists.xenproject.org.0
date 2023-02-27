Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447CB6A3D5A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 09:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502263.773981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYzD-000269-Md; Mon, 27 Feb 2023 08:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502263.773981; Mon, 27 Feb 2023 08:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYzD-00023A-Jd; Mon, 27 Feb 2023 08:35:55 +0000
Received: by outflank-mailman (input) for mailman id 502263;
 Mon, 27 Feb 2023 08:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWYzC-000234-4J
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 08:35:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef75953-b679-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 09:35:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 08:35:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:35:51 +0000
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
X-Inumbo-ID: bef75953-b679-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh89IzMG7tFF7htOQb5tIrEwwsLc7hX1OMqK8lU9j52R10QOMZW4UWd1t06dNcF8ixPR8CUg40g8UmSiQKHjQQLojYCApQOCvpxB7YkYgp8N47azooUQtTikDgmi/hERIorQhRkxVxQpnz9Bxlnw3OGM+sgYXQlgmZcUuBrIMmSMfMprWZyUIng8pmjpr5HjNBr7GtPsTLg5VuuvtnwdUMgBMG0UdrP76M72YX7I5LvBOHaB6ueJ6gRmy4i5pty3eSEEcMToIXLo/7W6SMbbfEqI2eya5FCFUqyV8fa0Qu+XjXsalHK0v087RYZEva27U+ZFN4mhxs1uBmpjqBZjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJsCtXs2A9QpQpcRy3pfyH7G3HrZXceaoj8HKqm1iII=;
 b=VkKMvn25UakVFZ7Er8dUctcaBtOZ+zxbvEySXlfMUBzt/qZfbch84Lv9i970oJlmSJYcYwpcPVr0k8wBcyccDO1TUiQyFrQzT/QcbpejkbfVa0C1A+n2NTCQ5leyT7BEbjJ0MI7DYH1bpnu/Z8fyf+RQnEU4sYRkAaEvtHBeJL2yOLsIhI+dGGy7u7xn2MYokxFi6MlXiKmQYQENYGq+JqnzLTSSG2l+WrZigoLQsT/TabLx8RNsuT4sjsrKmwkdCVNIZQtzWdrA3KXzytC7tBM9mwUbOMhZN1hr2JX5z9/9p4v1mBH65W+rGfxAr9NajftkflTiiQXht1yAIjVvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJsCtXs2A9QpQpcRy3pfyH7G3HrZXceaoj8HKqm1iII=;
 b=o7OgGN/B/R/RH73BlPhKNXOs6w8pjmEJoQ6a/7vk69E0dRWNyaOdmmAUVBUfXZwJp/CWBc4r6t2NMkJ2JApwY0g9m9+ga0PtquufzdQtfX091qgIAcyl3jiKjITqgl1lx0vfyEdHwJtZ1MNRy/KruwEd76e1Af2fsKKbPhSwURU4y/ibjJvvAksbN5N/Sj59fjvb6aqI2VjHK2vgLsG3I1wxaQI9FFhl0LJp9JvUQWMT4K7ivbZ7sXs3WeuQ0mChwNSa969hNCa5yR9BLd77VrjEi+3eo1qXPQePpOuAtdS2Gs4s6BLKSGVNHb8JMSuo6KvsDghFLxpWpSKen71/aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db7d6e42-2fd5-b7f0-ec84-ca7ffcf5d105@suse.com>
Date: Mon, 27 Feb 2023 09:35:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/5] Change remaining xenbits.xen.org links to HTTPS
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <e36a472b3e58ee81e8d61e7306f0ee2068eff62a.1677356813.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e36a472b3e58ee81e8d61e7306f0ee2068eff62a.1677356813.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 60158f85-6b36-4106-ca7a-08db189da271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IlTB6JxvsjDyJT/JKUNw3cFVN48txs/jVPurmfB3ueKJZ/fetO97rjWEnwpeibOV1whi96qTdjVxhEf5OCySf3Q5KzP69fR4Lje9WzTYGngWRAz+krlLCG0CENnMl+fA0cB3jvWndB3YqOKA2XAgWCzTgjflbCyZncnykEMpNbcT6BB1/Y9YPR4dJiyNdc5yRyGeo7Z/EprMUIc3p7skve3OPgeLpvQT/S6Rwvyb4AALEpPaGdX+ZaAZWHx/kV8L6+ShZ2frH8wCtqbAYAdx/60b1sLJbJPoN8WAW342vlIzDs4D4nnS14eCdx5eQFZWejhaDvCA9uGjSbvdV3zylEF/h9Hkl9qYcS7zq9d4raGmuBBMLzmDL0FH7wg2g0Jz9YArboh3P7sCuhr/06QJGE/Y7Vcfm0c8Ee5T1erp7w/Jlnlx78625IhR2cy0bDIXUUQlP33vW/JEUVmua+RIDHp6VHJFxTX7adLLtLJGVSruj3HlRHYFMlOipmxwlg/zn0bOpWT6pxTETYHF8zGeMG7MI6TviQZYN2enLtjVzsMDMeY5ooNAUeeiiiiqHs3klmMzYVWf6JiDgmA6xjmt0LWruVLcM9U5taLs5K837MLQVpUdrugayrFcQdHLfMy0Nlpwa/VUFVg3Sk24q1kwfiXgIWJPtvQOdw1NS7haHbn4JE5xyLBssMuJZ6miMIR/uK7wBl8Uv0sTd1INN0QJFEJ0f3t4+xiv+YhOr78A7zrCcTprts6Jlt7OBRs782imwiv+zbC6iwVAufjw/jWnzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199018)(5660300002)(41300700001)(83380400001)(66476007)(66946007)(66556008)(4326008)(8676002)(6916009)(38100700002)(36756003)(2906002)(31696002)(86362001)(8936002)(2616005)(966005)(6486002)(478600001)(66574015)(54906003)(53546011)(186003)(26005)(316002)(6506007)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck15ZEh1RW43OWJob21oNUJIbkdaTiszblRGNzF3dzZ5bms1V0xPNzNYcWVH?=
 =?utf-8?B?OThtajFNTk1HSnhJdVUxc1R6K3BqZDFGNzgvbDRJajFMemZGRVNqMzI1Ukgy?=
 =?utf-8?B?dTR1WHFvbzJPVmNoY0ZuZURhbWRiYVhJQkhiZExDQzgrK210ZmFwdysxMXNC?=
 =?utf-8?B?TXZ1V3BEb1lOT3hRcFEvR0NtY3VFeWpRRDZiOFZFWmNHNG5VaXdoaVBzWWdP?=
 =?utf-8?B?aUlCRm1meXZaVEFpMER0S09LdEkyRWtZOW0wbUhwRnJVTC9tSjczYVNQVTJx?=
 =?utf-8?B?TE5kbTRpTWQ3R01udUZsVHNiaGhpdkVmNFh3TTF3emtwK042MDRVdnNISjl4?=
 =?utf-8?B?bmp2cVU0MFE0NXNDeTYySUxRRUFuQXJwZ1J6ZUxyMmkrODdqSnlHLzlCSmV3?=
 =?utf-8?B?MFBSMXJpYVR4RkZRc2hkTWpnb25YODZFQWNQeXdvbEw5RzFYa2V3WFUra2V0?=
 =?utf-8?B?SlRQMVJXSFNza1ByYkFsYllneFM4cHZRSUl2di9XeUVOVjNxMGx3UjdpL1cz?=
 =?utf-8?B?cTlIbGgvUFZlYlRDeVlJNUl3S2xhNExSUmVNVW9iN1BTQVBuak9QTDRacmNz?=
 =?utf-8?B?dEVUSlNHQlhxbnhZekFUajcra2hOOU1VN09lTTJiS3lxT05zRzJYZ2ZDU1hw?=
 =?utf-8?B?WDZsajBLNCs5Q01HNG1CQVFzaHFseHJmZjFGQ3dYa1FNc3NBZStIQjY3eGxu?=
 =?utf-8?B?RlJrR0sxTnFzUFZXVXdJdFVTSHVKQ0JoRW5IWUFjaGpiV2lESmYrR3NhaFRm?=
 =?utf-8?B?K2lPdVA1UGE0cnJKZ29vUi9iWENlWCtaMm90TVBtMzd6TlJTczFJNlVYbkpj?=
 =?utf-8?B?ekZZWUpIWFZrSUFoODc0ZzVETGdQeTNMNkRwaWhJNHFWYklnTUxxVU1KWHNi?=
 =?utf-8?B?OGtKeHV5ZW5ldHY0Ti9MbE9mZk9ueUVaVnBGdDlrdHQ5MnlOTkE5Mm9lQ0dw?=
 =?utf-8?B?ajJvblpDZUt1MEF5TkFFZU9xZm1hazdnUnZGTFREcE51d0IwaEh2aDhzaWxR?=
 =?utf-8?B?U0tZaVBndlAyMmdGZzRlNmRJSHZkL0FQeVVQcTd1VWp1RUloUCtHajFHdTU3?=
 =?utf-8?B?RzNzTG9WQnlCRGtkOHljMGFyYU43WmZ1MWJ6TStzTzZaRHRob1A3anFoRUF5?=
 =?utf-8?B?QVZSZVJDZHNWUFRRaUhpMDZndmUxZWJTaUtVdExoaEdSWHdOb3NVc0N1V0tD?=
 =?utf-8?B?QlI3UXlsMmxvZStEK2U4V2hWWWJNTnNaLzF6UHdYTDl6WmZsQnJLd3ltaW54?=
 =?utf-8?B?M0FYMG9zVkJ4dkkrSVBCd2FoT2h3TCtZeTFNQXhLVVNlUDc2VjJnR1psUWtX?=
 =?utf-8?B?cVZNUW5ua1YwSWMxNm9wcURwN0t3TkJtK0xuL2FLa2V4R0xSYzBzVERKYmdI?=
 =?utf-8?B?aFk3N2g0MThDTm9NOGFtRUlTUzFHUW9GNXhRZCt3c3Q2SUZRZTBaN3lOdkNH?=
 =?utf-8?B?YllqTXlkc1QyRkxxL0RLVkRqOGlPdUxuN0phZHl1b0xRaWwvdGxTTlcyN244?=
 =?utf-8?B?QndJQW5FSHFaelF4M2xDaVdZV2NMbi9ySTMwMmExaDdzZDdXTjdGUmJqdFZD?=
 =?utf-8?B?TzBRdk5aSERaYy9iYVoycjFIL3E4WUVFOVhsTDZXVVdWZEY3c2tEd2doTFph?=
 =?utf-8?B?TEc2eksvSm8yOUFib3lJUDg4T2cxaFNjNzZGNStJUlJRaDhPcWtNemY5b3pF?=
 =?utf-8?B?NVkxTVZMalc3UnBCYkF4WTBCMU5aYThGTUd1dm5nejJENmtsZVJJOXRqSEk1?=
 =?utf-8?B?bmE3NCtsV3JUSG1RRmRiaHRaZmRaWW45TWlpSjZ4b250Y1hHSW8yU2tnblYw?=
 =?utf-8?B?UVpwN0pySTU1NWFVUjUwWUJ2Ri9YS05rbWVZaEl3OTVOMG50Ui83N3RzREVr?=
 =?utf-8?B?di9DaTM4QVhucDlFWEZadlZOU3A2eHBiY2hscVc2NlI5YWZ1WHBGRTZ4ZVRV?=
 =?utf-8?B?M3JLRGhFS1hmV2lycXF4SldTK1lRVTNlSWFsSUc4U2JsTTcwSUV2VG9tQTVU?=
 =?utf-8?B?VTZHcHIxYWNpOWRwRWV5aTNORWpBRmRjRmZFQTl1T09JVjVLYS9wcmpzOHVv?=
 =?utf-8?B?TzFjSHBVQWlUdEJhQm9HVUlwUnQ2YmFWMTg1Tm55WjJtdUJVd3RjVDU1TG9j?=
 =?utf-8?Q?h81QMx5R18THk+60UoSL1qulR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60158f85-6b36-4106-ca7a-08db189da271
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 08:35:51.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBHzw2Qg8Mv/Ndw63ZyzcqENOM0PRVG6VVaZVYIjXdLFZs69Tonj5BdiIxiwmeIcyqdowRHD+S3lbUjVRnsAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On 25.02.2023 21:37, Demi Marie Obenour wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -191,7 +191,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
>  
> -XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
> +XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
>  # All the files at that location were downloaded from elsewhere on
>  # the internet.  The original download URL is preserved as a comment
>  # near the place in the Xen Makefiles where the file is used.
> diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
> index 68819b2d739cea5491b53f9b944ee2bd20d92c2b..548db4b5da2691547438df5d7d58e5b4c3bd90d0 100644
> --- a/tools/misc/mkrpm
> +++ b/tools/misc/mkrpm
> @@ -34,7 +34,7 @@ Version: $version
>  Release: $release
>  License: GPL
>  Group:   System/Hypervisor
> -URL: http://xenbits.xenproject.org/xen.git
> +URL: https://xenbits.xen.org/git-http/xen.git

Please can you not lose "project" from the URL? That's the more modern
form, after all. In fact, since you're touching the other URL above
anyway, I wonder if it wouldn't be a good idea to insert "project"
there as well. With at least the former adjustment (which I suppose
can be done while committing, as long as you agree)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

