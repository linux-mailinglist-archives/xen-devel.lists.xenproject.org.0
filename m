Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A67351EA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550973.860223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC1j-0005WB-GL; Mon, 19 Jun 2023 10:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550973.860223; Mon, 19 Jun 2023 10:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC1j-0005Tt-Ci; Mon, 19 Jun 2023 10:22:27 +0000
Received: by outflank-mailman (input) for mailman id 550973;
 Mon, 19 Jun 2023 10:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBC1i-0005Tn-0M
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:22:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eccba53-0e8b-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 12:22:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 10:22:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 10:22:19 +0000
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
X-Inumbo-ID: 2eccba53-0e8b-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnNkhtfQT6W7yaqI8874eKlVh+1Fs3iCT/s2nzuu/mjKfX2m6A6NdY5J/HZjgKq17VNLXJi5KON3OxrwPfOtvkdrO6fN8bZY4toItNN+VSHTW9qL/WUV3u53KjYbzIGXj02buxEjG1TrEow9IcUsrJBJNek3A+HAKcwe6osFKA4NaC5bCrL3YH+jq4A+zl9SlnLkJsEp755IoFo/9iwYF1txeygbpZT6zIqqgvgxYkAnDjaoGAfv4FJOfd2Z7DEDUc4KZYXO6EYpy3bxZqJgk5mnQHjSwXJYxH7tZTSAn5/ZU3+fReoJWnfwDKziBdXTh2HrNh1XbrxMnIbDfsifDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5lcn+2XTbgHXexqj2IoBWoQ5eQ6w3EWi3tf2dAej1c=;
 b=Xj7Gkgk4k+nRDZPWnRL65EMFWnrkHThRH36rE+CxFOTO8xsHqf/FIKunYAjADhj72upiAlWOyHhIthwnwtLxKmttqyiQfr63ZHfkcLxZYeX5RbeiFFDD9COlQ36BgfKmpfEJg38JuxMTriTcEukQ/CFYmOpOSGV8CUUKMFAt6w1G/0c81oIwpY4652BCMdWRfp8LqFJfTGPa4Vdr6Z6nShc54qweAWlmZmS1o5Uia79F9oCcG+EriIB3tWNg1zdWbLIAEhI8EkLnTQE/ruFXfjmWC1UZhN9EYhcBQLgdDmRxUd2YCzUHbox0qphxhEzpLlxQ6TXpv2+3hN5ZVdVk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5lcn+2XTbgHXexqj2IoBWoQ5eQ6w3EWi3tf2dAej1c=;
 b=M05KHaaHeYbbhPV8egJJF5lUgqKJKHdosWCokt2y374dJ2Wqr8qZWrAb3UzpY0W68dgPmctsCBEqSek6AX/MBmnyRl9rhes+BZsB4RdSUuZwOXuCrHo1Bp6gz55ZVi7V7TV5kJPYjSlh7Jy/F7MPmxJ0LQNRiyN24vvhQ0E2shysFTDUGoI/4P3SrxjAp6VDYnV7/eOf4nvD4AVLCrStTnz18+//1ZJyVxcUcyYy4cz9gD/urX//u/1ZlpbLtukpk9PqxlUFOLp6wyaOIGjGTIfQ0fA/jzzn7zRis950UwnOgsfoZ4NeF6zB9szaK1aGadd3McPd86l1THBWzjPkyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a30cbaed-f6fd-fab4-722f-02eeaf8063fc@suse.com>
Date: Mon, 19 Jun 2023 12:22:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
 <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de>
 <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
 <20230616134708.6b3c6964.olaf@aepfle.de>
 <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
 <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
 <20230619121349.2327bcff.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230619121349.2327bcff.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec0c739-2e66-4614-2c39-08db70af0fe1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qlqtsxOnoHXlmKWygKT6Eo4lx9C2b/HVzbntIkDojUuN/f26+pn0H6BFXdPsbCfqqVr86RqJ+EpegBCy+/zVdIUPqP//OmVp8QHjj/jXQVe69HTtly53rjlf7b+Mp1G3hAFMI0ggG1yddpJOFTZz0EorW8CwhgweYesxYfk9fqvtmmK536yeghHY97F/YDfMewRYBfehN4zcOcJOGjSNJ8jsK1gH1Mn3QO2lKYWLk8+sPw/OsK/jU8ej7yLzdU/54FvHCWTeR3o0IPWR7ARvHJeT4Z6/yEE0Rma+8s5pti+bwIIL5BlO4Bspr9/Gvp/W0RY750D9HyxR5VQw4bAApaq+dD0m8ZJuLPwuX5HeXF7VhOYlta+FCRA+r3V7Jly0VBQtNDIiVt/NGmpWy/Gahc7VTlhsX4/mHkv/FywbNpXY+qlmFcoID3lhfNLmVjWt2AMtlUKPfs/jRUjnTfXwZCtnKDP/q2nbRaaHlgH+3ZSlQq6Yqqy1BmjzjNYih86dg+wyORm/v+BBotxBZo5hWdxuwLCv9/2rWi/5nWj8IsWNMBibJzHoaaYeA0MgHose5D7vrUMk7+qzEkKYCOACWrYmdrwJCwUFMjxE0/U81bbR3x7qY0TQbTl6sX4HSwnm/luG+Of/P4g5+aOPnB6yOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(4326008)(54906003)(478600001)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(6666004)(36756003)(4744005)(2906002)(8676002)(41300700001)(8936002)(66946007)(6916009)(66556008)(66476007)(316002)(5660300002)(31696002)(38100700002)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01UZ3FDdHB5V2x2NEw3VlBmWko4YWtWTkVxVERYRG1JZnJvRHlZRnR2Q2l5?=
 =?utf-8?B?dXZXT0c0ZnFMQ2NjSlNiUE1Ib2JadUV2Y0xweTByYXJRN0pDTEFWRGlobklM?=
 =?utf-8?B?NE4xRzQyRzhFeGkyS2kzYVJhbVptT2REaFhaN1Jzanc4QjM1VWdtN3VkYWhy?=
 =?utf-8?B?K3hqU0pJdGhlRGZaR1VLSjRlWGNjRTdyOUI2TFNJbGFGbWJUVVZxREp1Yll2?=
 =?utf-8?B?Z3hDdExraXBNMW1ORGw2OW1TQTFTcDV2K2xZRFpWeldqNFhtUm1aUW9sUGk5?=
 =?utf-8?B?eU0zMkVYL3QxM0J3cy8xVVdyVkNIZlRialc0N3JmSXdzcW1JME55ZzFWVWlW?=
 =?utf-8?B?ajY5Q2tsVEd3U2pqdUZNUTloa3dnQnhyaExlMDNZTFpCUGMzaW5JVTFKVnhl?=
 =?utf-8?B?aVNneWViUmlFSFhsUjdEOENhUVpGZmtnVEZDQ3ZRcTNCRHZhcVlEM3FDNzYv?=
 =?utf-8?B?WWhuYmZkdzhjSkwwb1FicG1jY09pZ1dhdVVMNTRkTUxxTno0UlJvcVE2b2pu?=
 =?utf-8?B?NUhnN29iejUyTE1wcVBCYXMvd1NVSWxvSXg0RVd2RUhheWhtdWJkQ0tQb0pJ?=
 =?utf-8?B?WlJoQ2FkYU5vZzNldXlIL1pVK2YwbTMwQXkxWkVlQ0pXdkhPODMrVXpJaEd6?=
 =?utf-8?B?Y083ZFI1ZnlDeWRpaFBPUkdNa2hHTHNGcWFLTkowZ0U0UlBxUnZDZkRSOFF3?=
 =?utf-8?B?bnpHQnJIUFk0QmsrbzV6T0F5clF6dEFpVGY3YjFzU1VLS2ZKVCt6d1lUNWNW?=
 =?utf-8?B?aG4xcXJUbUhDclZ2OElxR2V5S21CbDc0bjhUWWRtY29nUm1GWDhPR0k3OUZ5?=
 =?utf-8?B?elVBbElIaHhPZnRiUU9XMzdMdGdlL3hUL0xrT2R5MTM3M3ljcTkwbW5pK1hK?=
 =?utf-8?B?U2ZjVTd1WGdDVXJsdTBWQWRyL2F4cGttZ0lhWFF6c0YxOGVZYVpDakFuRGRS?=
 =?utf-8?B?ZXl1WCtDUG92N0lVTDRXcFZVWGhWSUkrVTIvN2trM1ZWQStMYmFoaHFMQlZ3?=
 =?utf-8?B?NUJSV29UMVdieFRJMnFGRmx2MWNKbzlhczRKdFhOSUlUOXQ2M3B0LzBWa0F0?=
 =?utf-8?B?QmFDODBXSjMza0FQRzFYYzdrVVdNb1QrRWxqNzViUG1UZGorTjlYcFpMd2tt?=
 =?utf-8?B?RzRJb01HZlgzQWdxZDJDZlVRSTV3NVlqT1dtbWpCZ3dhaUJmSS9QYXUzYzV1?=
 =?utf-8?B?cjNoTTZuRE9EYWpMZW5wdVNqMkljWWdyTEJFRS84Zm9xTFlxakFwdUhSU1Zy?=
 =?utf-8?B?QjJxaGRiUElaZGNrZGYxeStHREtlcHBpaWNTQW5SRDJETjlEZUR4WUgwbTh5?=
 =?utf-8?B?SkJ5MEhDRkdab3A2eWxKTjk4U21HN0xsTDZpUFZ5eWEwZXVlMjc4eXBjdy9v?=
 =?utf-8?B?RzR5TVNLVjA1Y3dsakI5TmIrdTF4MG5meWxNcWtnK1d0QS82SndrWFg3SDAr?=
 =?utf-8?B?cUZMT05xMEpxQnh2ejM3MitST3RzTlVid2VBek81TFluS1lUTWF0L0UvRnF3?=
 =?utf-8?B?N21oRHR0U1BFYjRYS0tRVEQ4Y0NJWkVsNk1jMnIwR05pU2pqU3A2bkVYRHI3?=
 =?utf-8?B?MGh0RjZ3bENKdG9FWUZLd3FZZ1F0aEpFQit4OWF0Q24xbWJzdytpQ1pSWmxx?=
 =?utf-8?B?aHhxd0h5a3ErS3NTOTJPWGJwSHZzN2RHQ3VWSTNqMmpXREl6TjB3Y0ZSejIw?=
 =?utf-8?B?T0dicXM4QjJjRWd5VGM2UnJHdXk2d0FpeXJYQkgwc0E3VUo0cy9OUkgxekto?=
 =?utf-8?B?M1FtdlFCazM0ZmtTdEJzVDdxS2FKZFFybmYwbkYxNzVPWjBIZzBucFN6NytZ?=
 =?utf-8?B?NXhnYStkSXBJVlFWRnhYS091bW5sbU5scmdQK1NJQm5CUmFzL1dTVUZDdm96?=
 =?utf-8?B?Rzd3dE8zRTFxRTJ6cW9xa3FaV1p4TnprZEtUaHlEazcrZTR4YlljWHp1V2x1?=
 =?utf-8?B?UEo2TmRBalFPZ0V6eWtuYUNxaUVwMWlxM3pRZC9OVnhRVUw1amJvbXFzR1p0?=
 =?utf-8?B?UlRPM0tTMHpEcVVKRVE4QzZyS1ZLSWRPcGxtTmIwM1Z3S0lLUlhYVUx1UTB0?=
 =?utf-8?B?UlhISzdqNmNrR0RHNVlKUXQvazE0dUxqdnNzRlY1Ulg5YlZ4MVZNaW1MUUFB?=
 =?utf-8?Q?jnQcmJHokk1wU0AP3RBnZq9Sd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec0c739-2e66-4614-2c39-08db70af0fe1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:22:19.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCi4EUIN233YRb3+P2sSWWyNeaPEI3Dk32OC7w8wMsAJW8nQplMwJiiq8+4Xn1gKXr1u8JsvTqme1yOb2eSarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

On 19.06.2023 12:13, Olaf Hering wrote:
> Regarding coding style: can this_cpu and per_cpu be used as array index,
> or is a temporary variable required? This would affect the number of
> lines changed in next_record.

I see no reason why it shouldn't be possible to be used. At least as
long as overall line length doesn't make the result unwieldy. (It's
no different from a function call, in the end.)

Jan

