Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5C6456CB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456110.713816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2r26-0005SG-Fy; Wed, 07 Dec 2022 09:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456110.713816; Wed, 07 Dec 2022 09:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2r26-0005Os-D2; Wed, 07 Dec 2022 09:48:06 +0000
Received: by outflank-mailman (input) for mailman id 456110;
 Wed, 07 Dec 2022 09:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2r24-0005Om-UC
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:48:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e31299b-7614-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 10:48:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 09:48:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 09:48:01 +0000
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
X-Inumbo-ID: 3e31299b-7614-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1gmlEqtXqa9ce3MoYWs9AFMsaQa/vR+OyiISqIfb/pTbzYxZy4Fxqxu6AYlBvNyLqHxMs6S6mloWbrtTwVKwWSN1SMw7SgpyZqG+CcyDh59PmbkeARKNMvJcEBHBwIE1CbLhaL9T3E9LvrCIHMIOLF5c85IHrRSpmZT1ciSo39BVaS6q5yYDm5CT15fLnWr3i7pftjncIfiNLXpPFzhoQGXAGxzESNnxDBruicoadnsfJ+e1gi0KWHGJB6GNCZMmG25UIJ8wDnDOo7YPcq+g9ck0PVT0j23EJiW38ft3hogZw8VUd5lYJr17T4zL9wpnbEXxC6nyA9ELQIgmWl/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0Y2FkX8sGUPj/P9upfIH4pegaBReVkV48iHOylcdWQ=;
 b=Vf42axXuA+g9I4QhCcf2LWbIjAuj9c5sk97Q9r+LKlzcMaiGKapfB3ko4jB6QTYZXrfXVMc3OOWZpB3PUB6Kneihfwicok09ZfpgL8dfqqnCEus36jO5HwDeRHKJk1x4wK3FAGSF6VDWeQ1744NfjKmZGx6fkk8SnE05vS8RIRd9iB3DDZjA2Nc5pXwIU8wFO4rlKCDI29z0J0xaEG4NZVKBftZKU5TkMBqO8TorLrJbijQLaXegjqgsQki0VGHZz8XnlbNdhLdgKrk4WX01CjdIRFOS0yjBJ4o/CMOwyX8okCtrR5aXBmEybByCzp/Le4ijK+KWtK/jbPJfUfwr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0Y2FkX8sGUPj/P9upfIH4pegaBReVkV48iHOylcdWQ=;
 b=z23uwxVPObrDGLNfDAJg+vzopB2Ln5OUeU0kPhhZPUDctLzXS4fXAzlWWDqkLa3VKLnw8z9jMRn4xh17QILN0B6p30pZv6P+5CWuD7hcFhnxDPRp67DSNusmA0LIdR2tPzAZVGdiGi9neUJfRDfTp+pVXEYw4x9sE0iXYOKKanc0vjE+oS/SklGoeY2IQyrxX27jZZMYXNbCzTGov/Ak6WbOSWOeVlJkOr+oiFomSSD0VvVdsmgvzyii2CTAeA20zeKdg1K/TPS+6z67Vwl34gKx937bDA1VkPFhah1ksjs+5DoqPDlF5N4L+e8qLlNpUS9vyee77ystZ1OOp6PhVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3b7b6e8-55e7-f88e-26d0-7e2052cca1f0@suse.com>
Date: Wed, 7 Dec 2022 10:47:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dpsmith@apertussolutions.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0add55-c58f-4ff4-a4fa-08dad83820fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yfeDW1/Zac/p44NRu3t3vQim15EybMQtjUvUKjSlpirWz9i7szhOkCXSrdKI4hzB++wp49iNeU4TU+YwdpHB1cuHX3LMsyqV5opjBPN+HLmn7xmRS46Ni2+HOVm1gucU3Ywl6TBP9NVRv9cR8pqM6q9eNjXzCUnptQe3xHvqrxF/FDi1qUrOHxwFN69isygUJYBCegTdq/TvYwiNUk5vT7kt0hh85PQ97Rh4UrPe4ahf3AAvlxsdSsjkF1AclugOLdgk5k1V2YO40pVvVwFnFdXYwWAoM7CTmlM1c4SXVxmXVI+lgPTzdwQrm9O/5UeLntKRusvQG3DA3Q+w3B2c33VKt7PIlY7sxLfk1LhDhcgy6xfWRMI7Z+aFRWybJPW3hcHygK+yiZYcayI5QXasqbEXw8tTP21w3Er4+cmmSfInONtjEjPkA0RSeQ05hsj4QbofaM4z/KIrYZVoQoYygxjNGEV+5Pp/4e+vdzCw78h+mjrlOQE4nooYKcKB2PqIvo2/7zq1IIFEH0hLN6CVLs22ZI73ZX+9JEi6ztxyhxAqVd9Z0/iIKw2t5veb5ykW950rZUaBxewMmoMydobtmADlh7UaC7ZmPGOovtM7TAKJ47mhyQRiURO2TpL+8hFN5F5fgrWijTzSsLrqOKK3VD4GjDMMt5LHj94JXDd1uOAdBs3j21i0n9yEVf+FKg1bLOzLKixDwJvpuq8gHiWza6QbZRAgX3qPbvxWRY94x4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(38100700002)(36756003)(2906002)(4326008)(5660300002)(41300700001)(4744005)(8936002)(83380400001)(31696002)(8676002)(478600001)(316002)(66556008)(6486002)(2616005)(66946007)(31686004)(86362001)(66476007)(6916009)(26005)(186003)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVJMZ05kNHZJa0hWcjJncEU1U1NIMy9jSFZ3RmRRbGFYa1hIOVNtVXVGUTFn?=
 =?utf-8?B?QktMSTYweTRpZUFnc1NTdXJQRGtCTzk5WXh6b1NkbHVOM2xWQUtPbVgzUGk3?=
 =?utf-8?B?ZzUvTUltUjhQY0lyZ0VTdmtKcGNqSjRXRXdWV0pUZnJ1eTE2SUR2VVRzZFpk?=
 =?utf-8?B?ZHhadDBqQjFQcXQ0bnFkTWdCU3ZOeXhPdUp6MUVsVnUrTnNXb1F0L2NscUZJ?=
 =?utf-8?B?czA0N3ZoU2RsMVozS2tLbU5Nai8ydGFkdGRYbUdjaTJEcjZiTGlaSnlKVUJO?=
 =?utf-8?B?MHRzM3RZNC9uNkpBdjEwQ21kbjBRanFmbm9CakoxVEdrdUJ2OW5IQ1Q2NmpX?=
 =?utf-8?B?ZzBWUEM1VjZKNGdEcGFvRURuQThLamp5Y2RQVnYweEd1cTlYR09TSVUxUzN2?=
 =?utf-8?B?VzdteVlOR3l6QUlBdi9kR2diUFA0azhSeFBENE0rTS9xaWN5OUUzYVlJRGQ3?=
 =?utf-8?B?aWxiQW5EOWxId0Z2VkJEWG1oWHZheWU2T2MxbnVtdWExV3JEUko5cGo2VlpY?=
 =?utf-8?B?dFB1VElzNDdkcnRLNWZCMm9YZVJ2Ym8vejJSMlR0ZDdwcnExRzlMMmhhMU16?=
 =?utf-8?B?RFUzSS9nMEorUWtoSVRoemhXQVBKc21idUxEYVJISWZ2emxhZTQ0UDVwRWR1?=
 =?utf-8?B?Ty9jb2JmQUg0UUpnNHZBa2taYXIzUDNGSGZ0TVRTa1FCK25IUmhNbmgrRlY4?=
 =?utf-8?B?VG9FemVTK2lwVGIyaUFObjAxamQvQ2FGNEFFQjlLdk1rSk4yMzV3ZktrcHFM?=
 =?utf-8?B?MEpSU0VXMHMzZVhtaVpsaFZTQ05LNjJaZXJZeEJqbTdKQmplUWU2VTFZWGwx?=
 =?utf-8?B?Y0RjNTFxeUpUd0R4OWNJTVFGb1VSditlVFFCRE5neVJGK0NYTjRDNkRqcklq?=
 =?utf-8?B?elQwZk9ycW5BUGlCWGtmdWp2NG8yRU1XRlJOS1R3ZERGOFJ2QTRQQVNoYjNi?=
 =?utf-8?B?N1I0VFNYaTcvVnRRY3A2Qmw5OGxzU2NrQ1EwWHIwamptYTVEck0wMkhWamNt?=
 =?utf-8?B?RDBjdDNPbmx0c1NVZGVMZGxjQ2lCcUxhV1NEa2EzVU9CSWxDMTlkRmVkSGEy?=
 =?utf-8?B?WGN4TVk1RHdRS2Vmek5ickUxMEZuWG1NTjRmVnp4YTl6dG40WG50V3FaTS9D?=
 =?utf-8?B?d0h5bmZVbWp3Ny9hRUhCQVkzdmljdlNWM2UrUmo0blV2NldKQUIxV3ozaVFz?=
 =?utf-8?B?MmE4ajdiUTFYZEV1em5NaE1Wa0hnR0hKbWxVMW9oOXFrT3JSSFhDUGhnbkdz?=
 =?utf-8?B?aGR6K0hPem9YZzhSRUkwcjVWNjR1OC9NUDRrdXJ5UzROSTBkTzdVVUxiUWJO?=
 =?utf-8?B?a1VaSENTa3Z6VkIzSlFTSWU1UWJaam02cUk2QndGMjNCNW5CWjQ2ckVGMFJK?=
 =?utf-8?B?YnRzWkZjU2drRUE0aDF6SStkeThzeEtCczdYYUdIUGx6ZGd5Y2FlaHB6aFI1?=
 =?utf-8?B?K0RhK2REOFM1a01sUGNvdGNkaVR0enlrcGp4NGVibWlkTnZhWnVYT285a1Jm?=
 =?utf-8?B?d2V4a2llYm5BZGVnOTFhMTFSWVprSXlZdWtVMDdrZzNOZ0xFajF6eDJWcXc4?=
 =?utf-8?B?ZDVqQ1lNVStEK1hqSTZONTBmWXdTWmx4VlZseEhTU29LUFZCSW1CWlBueFFu?=
 =?utf-8?B?eGx0RUFMM3djYWswMUV4aWNGQ1Y5Z2wweDNjUDEwQUY0NFFOSlFuZmFlZW5G?=
 =?utf-8?B?UDJVRTlCNHNnT2VzbVlPbGhrWElBRDdWMlZ1WDNTMzFIVmljaW15YkN3MFJP?=
 =?utf-8?B?djJyOFRyUUFQZm0xY1doWDdQaHRhTU1QY25zZnFmZUgxcCthOHF3aVRFYzZu?=
 =?utf-8?B?UDN6aXBqeHpLaHB0YWszaUdIMlFRVnNJak01d1IvOWIxbjJnaFgveWJQQmdn?=
 =?utf-8?B?SjJEY1VlUlBFc3lwbUMxSVhCYlFhNU00dmF5UHBaNThDQXl1Wjc3Z3NTOW9m?=
 =?utf-8?B?UXZXVG85eHBVSkgxaHJxc3JUVlVGRkx3eEMwKzZqdHF0L3NBQzRlRThqY1d2?=
 =?utf-8?B?VWRYcWpNQWZUdDVKalk3MkJuR1NDOW5WdFpuVk85YzVxa1V2bnIxQ2UxMksz?=
 =?utf-8?B?a3BWL2xhbFhNS2cvRWZySUU2TFlIcCsvT29JZUdrQnhhYnRmSEZlSk5zcysx?=
 =?utf-8?Q?MdZpMaSG4Xd5UYpcrmklfUNVA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0add55-c58f-4ff4-a4fa-08dad83820fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 09:48:01.4073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIMhQJ/jwV9a6olGm+umYdzGeMKcjydzKdNl9OJvpLi8bjcWx3ROqXWy4DCRa6OQo2erdogHSYHO/JRV80/H+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767

On 07.12.2022 03:12, Stefano Stabellini wrote:
> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
> visible when an object or function with external linkage is defined")
> found by cppcheck affecting xen/xsm/flask/ss/services.c.
> 
> Fix the first issue by making policydb_loaded_version static

This variable is only ever written to afaics, so perhaps better simply
drop it?

> and the
> second issue by declaring ss_initialized in a proper header.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

As to the title: The changes are contained to Flask, so xsm: really
is too wide a prefix.

> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -56,8 +56,6 @@ static int bool_num = 0;
>  static int *bool_pending_values = NULL;
>  static int flask_security_make_bools(void);
>  
> -extern int ss_initialized;

What about the 2nd one in flask/ss/policydb.c?

Jan

