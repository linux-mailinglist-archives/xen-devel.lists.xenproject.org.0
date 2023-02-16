Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C73698EC2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 09:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496413.767146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZgN-0005Uw-Bc; Thu, 16 Feb 2023 08:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496413.767146; Thu, 16 Feb 2023 08:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSZgN-0005TC-84; Thu, 16 Feb 2023 08:31:59 +0000
Received: by outflank-mailman (input) for mailman id 496413;
 Thu, 16 Feb 2023 08:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSZgL-0005T4-J9
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 08:31:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef2318f-add4-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 09:31:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 08:31:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 08:31:26 +0000
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
X-Inumbo-ID: 5ef2318f-add4-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs51snOTBasR00t+ejmxsUeaYNnAlJ1GqArdy6itrFW6ujEm4+y+tIZ+DeofpjSIeyYdiB3HkmnskDXnnLgfL8qRWzCNqdGGMgxoJlgD4OmuwxTdQ95mrwfahjtFDUfy9KcXE6Vq0UuT+5O36aXXfvl5Y4l7OsAXRZnFk51W+K9rBRQBIKk6dMrfcgoMAshQUTV2yMVMi5jYFQgiLU8HzSjAbxDWkCGg/Pp2+dHv+UgsOaPuZkklifk9EuMiZVQmRlImhLPt72fizlNg+Xszus9V3WwgCDPwV7WQUPN6yQY//r/uJmR5wojkDVHhQm9hHGScF+tXVdtVweBPdlJJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxwyBi/6+06GlqNrP1Mmqf7cL5IXjJEd77QWsj/4MYY=;
 b=Fq5tH6d/Q1c1jV+srS2LRdirrfqoFW9k03ou+jIIo+TwUJFpot+K17v/G4tKwodQlJ0T1LDGzmPX1PpoYuPJ0SZRKyl01L33hVYW4mGlNcGGK160l6vPddgJxW5OS+TcswKO96Og79Ep8bRfBnslMJMUA/k6XbUA+TporZetWQdWBoFO3DZ/olk0iSyvr9qGnaCYVAU0aMa+lwes6d7WUf8viam9w6aXQgZohakdQ7xjSa226g3d0kWU/amk0seVL/VRYTcX9vVFUORv8z2MrAyJ8FyHxra+ppyFuD83/sh8Dj24kMz4Ml77e24GLGt/KWSt5FHSN6wLbWOmpahJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxwyBi/6+06GlqNrP1Mmqf7cL5IXjJEd77QWsj/4MYY=;
 b=mYeGWLS5os4Sh7dhKW0urF033eQTrbwuVowiaxB/GDSMcazFFSsXEHMW9hMuhazHx367Yup3du12MVMD/xsAfNV/3VIqdzkf3Rt0LSNmMlxt7lwEwkdbZuxZAgvQjUO4qL+3Jh3lTNyBSNbNbmXEaZkEPnTcELFmUmN3FtThmrFq6CTieFGPTv5n3F7MmCU+kf4pa83T7yUiHzRqHJMnEYgRvqenDnpnDarudtlG6xFF+d7FEpgMPmQNIJSMvAASkoT4m+AUoIH0msg8H1++DuJ1nXg8CKiiOut1VqFqLc7OCYFMw9Rd+xn3Iul3yCdERakBIH/1OSFxJ/pczXePWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com>
Date: Thu, 16 Feb 2023 09:31:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
 <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5e8cc5-0c91-4d31-92ae-08db0ff8318a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQJhM4IElnEkSXfixeOF3RA9bEaoz1rDbcn0wL25m7ZLrKnqWWv+OJCsAH8uakJTJT3kxrK3eokY6mvi89rsf7Gvf/VKDTQGLgLmLfGBDZxyYw/fQzu+TPWl9EsUjLn5OlGG34ijYO8db3fASfE8Epzjmp00MwaPAlmBAUF4516Yc6fFHkqXU8hPLacvSFl7X2fkTNYuQ5ARwvFQPbqvCAmbglYxDW0L47UlKdxpTZPbw+on9WIu5N++hE+gyVSRku5L/CKKdXHz5SKNQFu7bZt+TTKLIgTmhulYmXFntoQ9FyYBAPfzPs9U3RIgXLEtBCIM4yLPhoaoP4WaugzZ5lrvhqn/EDNlb92AvPkHjx2RwLiHyqJWGL/gqmirNTjX6vtdDuTX/RRJMRgUkSRqnorXt35FmtkAta96QWX6LRwiOdkgE+/K83qZRM6q1hcuiUSlmEDnLxVkh8RaImPFIo11+F/+Q9BgHOe02SwFVksfnKxfV6LJmHsNmN3arfDA9mUXsFYe04dngXl5ThSzZZ9gAKdj9UjlsNqM8m4yA74tW9+NvYOsHBBs3JoHzkzqyb0p4ldAf3+8VwB0kYuEF8Tte3X/xK5E3R9ANCcpwhp+mM+ym/HCvnepwe5c+rafybXkQiqG7BkJJ9MG82m33BRKRcEYHDIw6Jp5n1xyf6d/Xw+y+hyrdNJ4YRwd32rF8PYkYO4WN8ejl7mLN7U67N5pWKzMF3YjQds/7cd1ol0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199018)(2906002)(36756003)(6486002)(38100700002)(6512007)(186003)(26005)(2616005)(83380400001)(66556008)(6916009)(8676002)(4326008)(316002)(66476007)(66946007)(8936002)(5660300002)(54906003)(41300700001)(53546011)(478600001)(6506007)(31686004)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmVDQWYrNCsrM01NVHJ6VytoRGovdGhGUW5oRU50UnUralg3QzlGSkxMOUhD?=
 =?utf-8?B?RGJ1QnQwWEtoSmg4SjU5Q0FPSTkveGhKQ1YwSFJMTFlYYzBSUnFDamF6TWFW?=
 =?utf-8?B?MDZsYkJDQU9xYVVZNzAwdVNzU3p2U1BpajNNR1dYVG96UW5VaG5seEt1cWpy?=
 =?utf-8?B?V2s4Z1NONzFQNW1JYXFEVW9QVXlpODRIbERNaEl2d1pzM1pxZTV6bWYyVlEz?=
 =?utf-8?B?VDJOMDJDWU1xUGtaWm1DVlBTNmZOQk1CTWhDTEdxaXFjcVhsVHNGT3lWeS9z?=
 =?utf-8?B?Vysxem9xUmJZbmRWdndYKzFsU3ZUWFAyNnJ2TUVwUk5WZ1JQV1QzQ2F6Yk9z?=
 =?utf-8?B?RDZYUi9LUVNaQ256MjQyUmhJSCt1VHZzbkgrZkJPZlY1MUt4cmtYa1lWMTB5?=
 =?utf-8?B?NXBueWszK050bXpQWHJ0QUExVVE2Rnlmem9qZ2xLaVFCeUhpZ0lRQ1h6MVNx?=
 =?utf-8?B?SUU4aWROcktURy9iOVppZDBCelk1UVpMaUZWYlJRRzh3SzhySllBeGlCQ1Bo?=
 =?utf-8?B?UHZCSGNmQTZKQ29YZ1NwWlhqMTI1TFNXa242SE5TSmc4MjNwZVlydTcyUEZK?=
 =?utf-8?B?Wm4yVzB5UTVqQVBETHc4eHdOYmpyRnFDU0Z0SmR2a1A4YXN2Rk1TWXVoU01U?=
 =?utf-8?B?d2FMY2g2ejdPQ093TzlXa2RBMnlmWndCM1BuN0g2U2VIQW1vR2UzWDY1cGhn?=
 =?utf-8?B?bzlGdG5ZTW1OenNUU3V6cGxtTG1RMEthQklTbkpxaFJvNHNzRnJiSjBaTEpw?=
 =?utf-8?B?WXhNdGRKV0xGcE40aTVEN3k0ckhKd2NST3l1OVVsVkg1WkNQVUE0N0EyMlFj?=
 =?utf-8?B?YjVLMlZpTytLaWN6VlVNUXVyRlcrZTJPMHUwR1BVWElZcjVNMlVJOHNqaHp5?=
 =?utf-8?B?MXovSzJkS1luRnBibHdrTFdMOFZwK3p6RWZBeHdjY2Q1ZFRrSWJmNVRvbDJr?=
 =?utf-8?B?UmFBQmpmdmZKWWdDYUtxV0o5MmpGeDNoK1Q3QlpPY0lsVDVWL1I4QWd5SVFn?=
 =?utf-8?B?K1d3QXF5b0pWYjJscVFTZmNJQnFubFQ1Yy84WVJ6YnZ3c0lYMUUwZ0lyN0Y4?=
 =?utf-8?B?d2hkempOSHp3eDNIcWtmOXlkZmpGMjBCZmZqMkhFeXhJWUdKQ2Q5SHJweUZz?=
 =?utf-8?B?Q3U0Y28zTlFRTWN3V1hJdmdqbEg5T2p6S3dyam5pMFJiTE8wZnA1RnZVN3JX?=
 =?utf-8?B?WTYwVzNrZ0IrMmdHNGVPU2kxd1RqaGR2V1dqQkk1MnlqRG1pcWRXczJjU0Fm?=
 =?utf-8?B?Z2JmSU5ueER1UFk0VytFOVBscnViQzNWWjJIbklvNzFsUFFJbWwvWGZaaVYr?=
 =?utf-8?B?Qzh1YW1HSTNZNnUzT1JwTTJEN3A5VFdkYVV5dVI0c0pNcndGZ0g1SFJxNEFM?=
 =?utf-8?B?YzJ5cUNLZm9pRGdETnFsUWpwcm9vekRhTGV6Y2lDUWtPSlIwUmhOY0ptbWcx?=
 =?utf-8?B?cFBnTVRqMnBwTnFlbGJMWGlObWQ1djRxZ3lTa0tud294WkpKOFpXRDl2SGJQ?=
 =?utf-8?B?YzZKQ0hKeG5PT25WNGJxT043Tms4SGZIRUNtb1hNd3pSMW0xbVAzQUh1dUFM?=
 =?utf-8?B?ODhqS2VUTkZIUE5Zc2xWbnRwL1hQcElwMHlVZUdPdE1LRFVsdE5RRk94MEc0?=
 =?utf-8?B?aHYwNnlPb0V6Slk4QnZ4STIyVDlqZ0R5cHFrcVNmRWFQZXB2MzdOa3RlUUNI?=
 =?utf-8?B?U3RLbkRWQ2JFb1BxbGhvK0g1OGRRaUNpWGVzWk9BUG96QU92QzJteFdtTllC?=
 =?utf-8?B?Q3preWdRbXBLbVUreFJXdWpMSHRLQld2emY4dEZQck9HbE8vbXpxYzJLZlMy?=
 =?utf-8?B?aEcxNUQzalVMWkhDQ0ZLZWJ2NmI5Q1NmeUxwcmNLU2dCUmpobGtMenZuWFhP?=
 =?utf-8?B?UU5ZN1p6MFVaMngvV29KVXViL3J2TVFrakg4MUZsaXB1cUk0Zlhqazl6c1dv?=
 =?utf-8?B?bkFWbWtCcFRJcjhEN1U5dFVqcUZHSm9mTTN4Q3Mwc2UzSWZYMHNHVTVVVVJI?=
 =?utf-8?B?aTZaajYyajBnTzBnc1lIN3lTTzVZZHZHbFlxcUFyNkpJTXp5Ukp1TlNIeGYv?=
 =?utf-8?B?bTFkR1drMjNjVTZNdTlNZ0xPYUNQdmt5QzNrZ3RXbVUzNktUSFR4ZXFmR05h?=
 =?utf-8?Q?Oj9bnCLFonK4SluV0Tml6NoNn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5e8cc5-0c91-4d31-92ae-08db0ff8318a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 08:31:26.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwIv5/i/nOf9yxLHBze98YFkFvmhooQjpel/ySEZagSHT5kz/SHsvthvkDLbaIM66qEFbCdDdM79kP73z868zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755

On 15.02.2023 17:29, Tamas K Lengyel wrote:
> On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Did you consider the alternative of adjusting the ASSERT() in question
>> instead? It could reasonably become
>>
>> #ifdef CONFIG_MEM_SHARING
>>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
> !atomic_read(&d->shr_pages));
>> #endif
>>
>> now, I think. That would be less intrusive a change (helpful for
>> backporting), but there may be other (so far unnamed) benefits of pulling
>> ahead the shared memory teardown.
> 
> I have a hard time understanding this proposed ASSERT.

It accounts for the various ways p2m_teardown() can (now) be called,
limiting the actual check for no remaining shared pages to the last
of all these invocations (on the host p2m with remove_root=true).

Maybe

    /* Limit the check to the final invocation. */
    if ( p2m_is_hostp2m(p2m) && remove_root )
        ASSERT(!atomic_read(&d->shr_pages));

would make this easier to follow? Another option might be to move
the assertion to paging_final_teardown(), ahead of that specific call
to p2m_teardown().

Jan

