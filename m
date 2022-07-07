Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8F56A0D1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 13:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362933.593227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9PK1-0002Yz-7l; Thu, 07 Jul 2022 11:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362933.593227; Thu, 07 Jul 2022 11:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9PK1-0002Wi-4Z; Thu, 07 Jul 2022 11:05:25 +0000
Received: by outflank-mailman (input) for mailman id 362933;
 Thu, 07 Jul 2022 11:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9PJz-0002Wa-UV
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 11:05:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b25287ff-fde4-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 13:05:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4627.eurprd04.prod.outlook.com (2603:10a6:208:74::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 11:05:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 11:05:21 +0000
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
X-Inumbo-ID: b25287ff-fde4-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRa9axbVu7kE6A9kPNrO4KY6Nti2J2c4BEp9CRUx1vK1zyMkw1jajKew3+aaDS2JAUSDFsUen6uEws4vaE6roi4vTA6OTWHw/yx/ddUmEKxiUCPKSwPghyqVOanY/IYbV1JwMFapScf+fqAIjTyq+9JAlo08m6llLGSoJwv8ipmToQNGcCD7MqL/D6W6gh404up3Y8SIicQuSZDDcNsVpfd+uQfIzlEzVEl/haEP4SjTJpHRXL4y8+hR3NlUD6bjzhTMQbOlS/x2TK0nR38nQ3gpfix46ysJ+2SPqpZlMkmHPJfqBAGXQvZ/n3qN3286EzUwvxf1g6n/TONQl6K3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4EKzq5hZ22D2Yi1afyRTi8OxZnH7RebU862RMjXOfw=;
 b=ctjV1uR9SCEtdePU39zL+L86vbc0Jh7GyUkinKA9TPKimYFOlC6jhpvbNJFhPI0Mu66HJb504h8NRvwBQaUbN9v45wYDer1RDB7Ix86XPZl5aKW0dwTkkV6rJ7/DuI8/4x0lEvXXpQNXNcGxrp2wxuXdHPKLqujl8jCDo7NoKLsQgduTp7wv5uLluFkoairAEajsBVdO98qbxN/4xKv00VvZx9FTKwl5UfVBFviemYnZcu55IfLIUoXu1IH1re7njFAzUzp2qAjSCFMV6Z/DhbMyxq0W5lQPcmmSUAqGukiWh887LS3iY1CQ4sEWXOeuUJ6rtqXGBekSYP/pA/Jdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4EKzq5hZ22D2Yi1afyRTi8OxZnH7RebU862RMjXOfw=;
 b=z4gFmqarYszDQoL/z7JvZZN/O8XNSIc39JA+t2YfkTAkHTFFEjAkctL7GFcVMNcKEUdNAPQ+LHdfKRpprWx9gY6acAwlYMhSPVEi65keQZUulHKm3s6jcSGotOaELq+E5uXsyu4/WE4lPqy1Yk3CMxemN6fOf+/mA7UBXR8CXYgPdc2PV665A12reLdp6CdojIfInYA8ynTOR4Wud+TPvPg+JmprUzlW857FJ7+/r5l4MMB7jMIYZZ6A8V6Yfd8BJ6eIzLu8N+DUaoEvravnyjOWi9xiBztEMVHvkBN5uMrdU2sk+QQ1UeQKqqbHftRbgcdwbH/61Cf8dH7xZSFkag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cee1dcb-b207-6c16-1486-694b8f868cfa@suse.com>
Date: Thu, 7 Jul 2022 13:05:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 6/9] xen/arm: introduce CDF_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707092244.485936-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbbdbb68-31d1-4f9c-bb5a-08da60089581
X-MS-TrafficTypeDiagnostic: AM0PR04MB4627:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofI+KJFPWPx/I0b4Nk2nVqJ6UyH7iST/w8kiwil4NydakLJEEa2JlzJlALf2Ygj4jHVwfbpHvx6U1fU35dSlYvRJ/ko0SoCCUGCwcku4UQ9+xxaXSTVjzUV4/mxcWuAvXh7yv0L3jYmQChm4m5+SOMZn7s4cJatpp1WCxxjvZhXYKRFaHUNEs6aHTx0d7kj9taFGf3Mke//HyhTvpSQLTpzp/XfX5Np1m0MPfBui+pRcQYYNeG7k8g3JIBPNbawWOBaD+Uy0siz2Sxglv6AKEyb01FozVeu0/zXt90SI2ZNJ56Dk8JwZsAsgq/+yeIBLElDF69tRwXbJglXTyF/2L6JI4aT48Ej/5S7K+lqFVZPjpSb/7SUGThyTM6j6BjgNSVaACttZM+z+Y/SrV+nyLAt/gkD/EYwjmmplJeUUXv8kpa72Ze7qrmfpNtiDiPnfaCd7M+h+IVW9udMkTsXLlKdwat5fzWcjqgC5ILj2jfCMCpKUyQp8RjNBSv612ObgMbnEKyLgCGh+EVZh58x/5xcnft4ivW2WPqJFMesCU/uJDpzZUQ0MNmZnrKHZcsUpNyZUJqoUEQXInyyQGq1I/epjQbbSQxx8oIO5JW0+h538dr124nkWjtXDvzrA5v7PqOvS6+2SQzkZqZv4Oe53IkQT4g/OWt304uaTsz3XgBzlh2OmOHAuUvtb5SogrvlpAtbWsafoeq6YUmNTyIlPCmIaxs9klqm4ljA4M4Rz1PTVUZCjpEI50LG9SAUixIRQl+gV9PeZxQ0fVKjBg3XhbCdjpZurbLDkav5ZEb7lNsv+3hNBhZVcA2VOWX3G3JDQOJnh1rl47I98E7SvSOsnpCzTT6MkRbkBLYAAVQlgsHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(66946007)(66556008)(66476007)(41300700001)(53546011)(8676002)(4326008)(38100700002)(6916009)(36756003)(86362001)(6506007)(5660300002)(31696002)(4744005)(186003)(8936002)(2616005)(6486002)(7416002)(2906002)(6512007)(478600001)(31686004)(26005)(83380400001)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUVIT1QzczBSRE12RlJhOHU3NFNPRi95bU9NZVVDUzdCT1Z2ZG52blFUMTAz?=
 =?utf-8?B?NWV0RDYvSmNNTmRFK3ZmVW5iM1BvVzM5UWZUWG43N0grbnBxcjhIYytSbTd6?=
 =?utf-8?B?Zk04Wld6OHlNOGVQdFFFcVd0SThoc1pJYVlibk5md1hxUWQwZzNUblowcmNs?=
 =?utf-8?B?NTBRQmtPaVhwOStJcWFSQ2pxeDhuMFdDcW8zRkFCZkVwcEpxWXYrMTlvU0ds?=
 =?utf-8?B?S0QrbkxsSEl4UXU0dVArSlh5K3ZvTXZKQnczcXBteTZlZHYxQ3FZNDNTQ1RC?=
 =?utf-8?B?d1duUzVhYmQya052Nkk4TkNCLytxVWZWbXM4NUtQa2dWTHJIdm5vbFFRWU9l?=
 =?utf-8?B?NUpKU3ErczZVTGVXbVJqcDdveXRpWW1iTmNQeFFSTW5NZWVaeTNHK2hSSGxM?=
 =?utf-8?B?NmNYMWVYY1BRL0hRWXZxdG16ZFdCVGFIbkZzQlY1NlRmQTE4MnRuTW52S3B2?=
 =?utf-8?B?cEdRc1YwU0hWVjJpY2ZVSWpJRTdpYUZPVlQwUkc2MGowZ0JwZThlRjVSSzZu?=
 =?utf-8?B?RWd6ZHlMRno1eUhjeVJLS2NBaEFBM2hCK0RucWtzc29MWmRLd095eGNLcVQ2?=
 =?utf-8?B?N1ZQNTJRb3RqWEZjRFI5R3hFcGVYemtkVThHQXpTcTlvNXJESkFPVVhWR0Va?=
 =?utf-8?B?QkFyeWE0TzEyaEJKZ0tmdlZ6VnpqYmdUNDhXLzU4R0hoTFE4VDIzVTE4dlU2?=
 =?utf-8?B?a0dPZG9oakFyb0FxNitNT1RVT09WMGMzU09LY3JqdWIyNUFFZnQ3cWxkendr?=
 =?utf-8?B?NkpsTnM5ZW1EaFg2U1JJR1E1c2RnWG5GV0FZYkI0RzNtUkdxNDdBV09kVG5V?=
 =?utf-8?B?SlZ0TGxET3VvcTZJbmszZDdQQ0NSNlNkNWFuUUllc3MwZytXMUJBa1RWT01n?=
 =?utf-8?B?dURxTzZtaVJ0Wklvajd4dWFOSW1aTDNxbFJMNEtkbDkxbHRSWm00WFhhM0Jy?=
 =?utf-8?B?Mm5PeUdaNTRVTHZmRnI1SXhVaVh2eDBWSlNyWmx6UktmRFh6cmN5Z1AyaFpR?=
 =?utf-8?B?NWs3TWVvYk5GaXpVMFpEY1BJVStpdkRROEUzSU9sYVh2QXJhd0s5L3R0bStk?=
 =?utf-8?B?MHdPTXhvQU1LekVTYkUvNWVsQVNHVDNlVnZVcVlhcFZncVBjc1RDdDE2MCtV?=
 =?utf-8?B?bXNoNGs4cGhmRWxlSTM3eTRTNTNXZ0g1bFR5ZzVYMjNxaXd1ZlRsN2wwajFO?=
 =?utf-8?B?MzhFdTV4dmtOenBEK2o1dVpzajBTVXdSajBxNFo2VnBDRjJ0dHVReElzMXd3?=
 =?utf-8?B?YkdQQnVmbzVPRlZwSzBZSHpPclIxaWJaS0ROaTFCUU0yY0prSk41UGwrZFor?=
 =?utf-8?B?YTZnS2ZsUFl1T1ZhUnYvc3lyLzZ2VXAwd3NJM2lzMXNrSFRjdmYyQ0MxRm5v?=
 =?utf-8?B?YmxXTk9MRXp3OHFhRmIyY1lhZkloMXRpcXZSajdMTTBwV0JxemhkUlhmQWcw?=
 =?utf-8?B?aVNXSDVyOUhTOW51YUpWRXJsK1crSDJCdDJHUXZWMy9JZzd2ZnFpcW10STBY?=
 =?utf-8?B?ZGRSZWNBTzV2VUNkZ2VjUWhkcjl6aWRxK0NpMmVUNzRNeVNYdkNvcHJHWjF4?=
 =?utf-8?B?UENtNlNuNmdWNnZwTTJwVTJpeStrWFhBL25UNHJwbVBHSDdGbGYyaUZjSjVz?=
 =?utf-8?B?UjJZN1JUam8xUDVtWG5wMXd3NXhxdkV3MEQwNVVMOFNJekYxMkJITGlOTWhB?=
 =?utf-8?B?YzUvVWRDdndBRHQyU0FDQUVBbXR1QlVmQ1d1bksxWlpseklPVVVrSzZUSTMx?=
 =?utf-8?B?YXh1WkRYYU5LVTluZGpPeTdJcklvVVpPZi9FVWdBc1U3RDUwOVVuMVUySHQ5?=
 =?utf-8?B?dkpYR09ZWGwzN1E3WkkxVDlnaWlUUlR1cDJKZkl6WGxZcmR2bFpQblB6SGov?=
 =?utf-8?B?T2I4RzNWbnViN2h6YzJhRmdKdjBlci9Hd1hRaDhEeTlRY3V5N3VhUGMzV25z?=
 =?utf-8?B?VDlNbkxmampPRE5xVEFxeUZlTlQ1NWllL0U4a1ZCQlZHejdWWk1kcFQwZjNa?=
 =?utf-8?B?WTJSK3AzbVRtMkY4ZHVuWnpNVjkzNXl1dlRuWTlaQllxdVV0OXRMUk1DL3Vo?=
 =?utf-8?B?WTFmeXFNN044N2RJM2hWQU51bTErRGVxOVNHL0VsVjJtNkhoYWRTNlRmNlBM?=
 =?utf-8?Q?ItP88TXPMsVMDCWz3zOewbdSi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbdbb68-31d1-4f9c-bb5a-08da60089581
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:05:21.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXCJfG17X9mexI+Kyd0KGGLownUNEx1VUIJGLyVicYn1yP7woe4wG7jb3VVcULfb6TirFbgEp9WElZmVUg788g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4627

On 07.07.2022 11:22, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain memory
> is statically configured, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_using_staticmem() to tell.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


