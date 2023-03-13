Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C256B71FE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509188.784507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe7N-0006pn-Ls; Mon, 13 Mar 2023 09:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509188.784507; Mon, 13 Mar 2023 09:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbe7N-0006nT-Ia; Mon, 13 Mar 2023 09:05:21 +0000
Received: by outflank-mailman (input) for mailman id 509188;
 Mon, 13 Mar 2023 09:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbe7M-0006lE-4R
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:05:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d9aeeb9-c17e-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:05:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:05:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:05:17 +0000
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
X-Inumbo-ID: 2d9aeeb9-c17e-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSJyvomxZT02ThYsXtYLUnwZBuR7xvEq/7TwW/sP8+ZrHtyr7H37elgcZEELc2icLE/JuJ29MSRf2wVsU4YI6b1XSLlpw6IQtmMvjzWJVfs5yvpf/3Wxm3QPN8YnmZUL0qwUjxw8ll6+wziB6TGls2f/KY/wo4rqS05Sx/qACM/0IolaOVK0NxGdTL48CfokGsnIP9xWbcMhPJukrzMTHi9rVTH8X3E16vsu5n8+9O+5jl0VTosR59Vbpa15tjCL38zPaMFLQqI7Pjm5RdeTMs8gfc/Hv/LWgZymDp5sJukmBMD1dOCl3yfY3PiTLDbVYCjLJQFnTbKtuMYF2NJQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxEQJr7vfJt1gpuCcinynEDKecS6JxbUYLLCpo71l/I=;
 b=lxRZAKfZFk4TyPg9Akub7qPYsloRryaK5BKiZZ13P9KgYpa/QV0eUJyRbFavahYmwAIg1CZN2ka7P+smWFOYSidBkOCXINniYYKImfh4uuNJVzY8ss4/3HmF96QZr0W2ZWmJdbqk62bz7beRAYgBHD6/WNs38q57IfUldH0OjVR4XASDyYuXsaD7Ty3MjKjSzUv4WWVmBX12C6uL18ngQJb76NpzMR09SpETd3HqtIXqOf/G2q7w092ZkMKxkd16fpQCL0Kl70H/pMyEIdDRN+MS4heoC7kUBM/dMO0i4YLSoPrjrO/w/iwJvwoQ9C/stnopjtBLJ1ukzmHqhC9jnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxEQJr7vfJt1gpuCcinynEDKecS6JxbUYLLCpo71l/I=;
 b=Z0VKo7F0RJvgnsLYP0XaO5n497TwYz1WPuhRvcR+I09SY86o1l/U3PaKucJWVbeRYq0kFjtKqTclRZuxWBglHHInqfiM1EZo2R4I+HlvDDvy9oRBp+n9Vk+bmfWQ5LqJaQSoIMeB0FLTSETwMkyyI0x12A08ctgmmAXS/XYIV5DpUmGGQ5DoqUPmkLgPDketLkmfnurXfAEQIiHFweQtzwpgU3Xraw3z95rxFlnk4EP4vkwm7dv5FZ46wXGR7447O8IBV21lXTu2VSvBBsqMIQSgfNq3KA57XCE/8rH0iAMqU4DYJfh+QjcdmjN8f/2lFSNsJCv+mECW5uSIkrD64g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <312ea7d0-5458-efef-b634-8c930517e806@suse.com>
Date: Mon, 13 Mar 2023 10:05:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] x86/spec-ctrl: Add BHI controls to userspace
 components
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
 <20230310160238.1321765-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230310160238.1321765-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 4841cede-76a1-4a95-c901-08db23a210b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T7gaYMHhKI8+3c0QF5FDewpHFmS1C9M/A00rjvT0Hf9msq8KGmJmqzJqSPsaYbFNrSFLeABkMwy2QeDr8AlHiqT//sToUyVC6IQFpeJBUBSbYjZje3cYiEeb3m7do3Csy/3A7cztKEgarSSvK74LLXDDy/MyuCHmR/w64Ci63BVsZp3FqXQ/K/eG2CHHf9dI9af6SY877RgRKElwiZM9N4SQRsjeSDd+wcQzYlIJUedlTYlFEdiaiPmpZWfXwNj4K47eLgN1fsgJ/EdNKGMSm8pFU5Z+QYvqxyACxVQ3af7sT3edCCkF7IOtWTWsDoNmNCN36MwNWdlCVd8L2RIr143bwb5QwtoBWYgiui9xV47jTc1XEwa+N31gtmiiWW9aOO0HFYnPReMYGlgwQC8bFq+CHidwAvuAdFIASeiRcOSiEhbWY5tf1J9OGj4UXrSc6sBxZwhQQo8J4lbNJplr54FBEX7cHyVmLq9WlKZ81daJOs+vmXJ7s/guCVS6mhDzCqqUIewAYahd6DhJEIuk5Mht8QUJOap4vmqz/FIxnNMPRs36+u1wuXD2Xx/WNCnZ3JUGWVph18C3p7YdyNmZhgfqYaNnr/Fr58ITiDSseOWdTi0Ap5Ps6thiwwauxz7h03qIb/BGVO1VtQX0GQaDA5P4mm14whNyMfcTqqbCZ9SbOSr4Qj2lFdO8P5ENyPDUajqKBEpDuSqwO9YkgyPlXd28snhXJ6FL3E2ifTfKzNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(53546011)(66556008)(41300700001)(8676002)(66946007)(6916009)(4326008)(66476007)(5660300002)(26005)(186003)(6486002)(8936002)(6512007)(6506007)(54906003)(2616005)(478600001)(316002)(36756003)(558084003)(86362001)(31696002)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEdqZ2xTaGFLSmpTdFpZcDhHSitsSHg2VDBZTzdZamVkSTZGM0ZMdURNRUM5?=
 =?utf-8?B?MDRIUkpENkRTb2tQd0wwRG9CeTZ6cGd6TnYxWjduMHZuZEVkeVU5Tnhoekh2?=
 =?utf-8?B?MjhOZXczVDc2RjdOSENuUlN6cHAwcW1waEdQTTZSdW9xU2dpZ2x4czlCV3or?=
 =?utf-8?B?L1ZaNlpzSDJVdzdpYlNFdDRWQm1WblB4ekRIclBMM3o4R1ZYZVpBcHd2Tmo1?=
 =?utf-8?B?WWhhdUwvNXViU2dQZUVrZ09rdzhhUThxYTEwbjkwZUpYdmdmTktScURXS052?=
 =?utf-8?B?KzBnU2pRWWRXQS85S0o0WDJXNzJmUDlnYjczdmY1Q0J5ZlIvcVB5aElFRzZ5?=
 =?utf-8?B?NTN3TWtQcWNBMFprVkhFVWdhTVBmcEx0N3JaNkZCeElZa3dUYUt2M1VRZGkr?=
 =?utf-8?B?YTA1WGl6QmZBSUJ5cWdoV0ZxMEF3VlU5UmtKS0xQSGZ2bllhY0ZoUHkzeCsw?=
 =?utf-8?B?UWQwZU1LanZOc1pBd2J6NnZXL0VMbUtiaHRkSk1iTUhIMUVqdkdURGMwRk8r?=
 =?utf-8?B?ZDlNWWhHS056NGFIaTB5QWhpcCtPSmlNd2hRMkcxTHdDZDJYakRwTDdhUjA0?=
 =?utf-8?B?bzNVaXN4cFlSSTNsVEJLQWZocGlNUVg0L3locG1ReDlrTlFscjM2SlpXM0Na?=
 =?utf-8?B?NjZERnIyTEtoZzErTkNOZjlRVGtjSXo2bnBQbEZQdWM1SkhuOFV6QlM1b2pY?=
 =?utf-8?B?SVY4QnJVK1hpK0ZNSUd5V0NqQS9oajBmL2JTTTVKanZObUVoNmV0WExTMlpZ?=
 =?utf-8?B?SklEYTdzd25vM0RNMldjamdVQzlHMjE5emxKNlVqOU5VTlViOFk3bWRZanBr?=
 =?utf-8?B?WnY3SC96VnoyTkhmcXV0STkxTzQzTGk0elRnSllaaWdQOXpyS2dUSThRY2R2?=
 =?utf-8?B?blRHMDhqY21IalRWL1Mvd2Z6UTNZT0VNbEoyR2NvQ2wyaHkxcWdWSU5YMDUv?=
 =?utf-8?B?RmVZNW1LVHI2OGNrdGFwMUtkVVlEQmJKc041bW5FME9DVzdUVERiQ0RjWjkw?=
 =?utf-8?B?cEtWQTZCdUdENDJqWkxvak9tTEpiVVNUaHB3YmFKeUExbmdvb2RKSS9BbG96?=
 =?utf-8?B?cS9NZ0o2UnRGcFBkOG4xd3dzMVBEdzJtY1NRYVZ3UHE5TUQ3WDhhQWgva1h5?=
 =?utf-8?B?SHVTQlRJM1hjMkFVbEZUZ1FMellvS0ZqY0t2THY4YWhzRVlIdkNYVzRxSmJp?=
 =?utf-8?B?S2FKTjE0OVBnQ3FlYVdXSnp3cjlVNFY1VUJmQ25rZ3IwOEZFUlNhQnFjYUZu?=
 =?utf-8?B?QmJkdEZGaFp6dHNWQXJVNzlFU3VlaU83SFoxNjJQL0ltWlRSSlpON28rc1FO?=
 =?utf-8?B?M1dlL3lYRy8vc0pkMHhaakIyVHo5U0g0RWF2SUJBcFZZK3dyLzNDYkJWMWNS?=
 =?utf-8?B?TE5sTkM5QjM2SStKcmNxNy9iYldoM2thV0hJdmVnUHFVdzB2SmhKTzJnV0pj?=
 =?utf-8?B?ZlQ4RmJPTEk0WE93NFZQVTVCSjgrMVNnZElGN1Y3Y0JRUVJlNUlDTVc5NlY1?=
 =?utf-8?B?SjRtM2QzRFRKRjRSL2c1aFhwRStManV5V01JL3NHWCsrMzVhaFBZUWNnekFq?=
 =?utf-8?B?WVRxbm9GSXNyVGlIN2I5Mnh3SGhiS2NkMUxPYnJ5bzg4OThTa3p5T2txMEZn?=
 =?utf-8?B?SGdIMFVUYTJEZk9UUXVLMTMwMG81Z0pnZWV6eTR4TnVHNFZ5N0hPR09iRkJm?=
 =?utf-8?B?RWFDejFqRzRtT09VWmhWcjhqdlY2eG82YzVUcUZseUlxeVVwWFk3MGhjOFdB?=
 =?utf-8?B?NjIvbGlGV1h3bTFud0ZoTFNoeHc5SEloeE45ZHZBK2FKd1cxRUp1Q0RJNk5h?=
 =?utf-8?B?aVQ0TDEyTzg4YVR4NWZBMDZKU25WL1JvWG1OalNjZGJWdzhGc1JKaVNTODFE?=
 =?utf-8?B?LyttdGFuKzZBbStuUzJEMXFZL08rZUx3bXh5eVBJRllSbExvV0xhYXU4KzVK?=
 =?utf-8?B?S3FrS1VBRzBBV0xSQllIMmV2N0YvRUNIbGZlUlB6cU4ya0tzbThWSmoxa2Rp?=
 =?utf-8?B?T3p6MEduSHliSy9GbVFnUDlZMy94Zlo1dmV2OUVybEVTV0RtUTFiUEZmODNs?=
 =?utf-8?B?QUtlM1RuTHlESnZDS09WZ0xOVDlHMndYc2VUMExSZDRWdS9UWmwyS0lCNmwz?=
 =?utf-8?Q?MZQXgGkdtScaYkDlz8gHyt7iW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4841cede-76a1-4a95-c901-08db23a210b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 09:05:17.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtTGIlDdU4yUB3OdjfIU256zduIQGVfOh4p6db6BD/xldNQTFR+sZSAHfTbQ5ksHniJnrf2fTn3WOY6CM1wIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656

On 10.03.2023 17:02, Andrew Cooper wrote:
> This was an oversight when adding the Xen parts.
> 
> Fixes: cea9ae062295 ("x86/spec-ctrl: Enumeration for new Intel BHI controls")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



