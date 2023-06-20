Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C0736F5D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 16:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551921.861689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcn4-0002YP-JC; Tue, 20 Jun 2023 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551921.861689; Tue, 20 Jun 2023 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcn4-0002VQ-GP; Tue, 20 Jun 2023 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 551921;
 Tue, 20 Jun 2023 14:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBcn2-0002VK-Q1
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 14:57:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6edc7bb-0f7a-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 16:57:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 14:57:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 14:56:59 +0000
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
X-Inumbo-ID: b6edc7bb-0f7a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH14Pd1x+o1XV4+7kmhzYAarSMX+ZyJcRLAsCXzI1YDOL96sX/x+F1e96mSI49cRuZjd3gdTgP1VYj81Ni/Uaz2cYrESvtxH1nRJugEy5y0DtrDvYDhwF85t2Hg5bmcX9odsCylGPlEVIyC5ONz/7EYT4GrcgPUB8DtbBz92Z1fzMwPimmJIErCKZpP8C89K4BdX+nHaYS6NRYJpuJIhJXP08SAK7E3IJug76daliS1WtCk8TkesmekQW5gIEB1YtGnwtwRAeI6hLjpieDzq7ZC/TdqjFTraOy+F5Lfboat+KkImArueE/ppUUZOShmmq5I8Q8WS6dkI1H78EZxMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtwGcDaT4uptrnIqedM7IZ/ggPW/BtfbCwDGmmOwScg=;
 b=AM3+jrLA0b+T9MXhdfB9uCgLVCq/A743QZNq3DKNBxUtZmweyYXdAhjwxmlXykn/pzgZrPt6E/CfQZy7W9hh0Qa9nApUDmL7a07tsTxIJKDhvESRIenHlo+bUSjsEaIHXBmXmroWDDzOYLLCKvvXv9OtfW8LZ/8zaLbDZGUaeLKGwUOrDMX1kmej8CVWkMrMwnaeDWpB/9OwCR/bllaQHAZlatwp4znm9HsbOGFd/mD4SzqTCkNH8dqXOrL6jlEHfJjJcy6nR4qJQk6H7UTcgQvm3q2QaV67tkiC1Xq15YO2tqyTFkZwwc+1IGImQBq89W5E91SgJSeG3TaKWVnFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtwGcDaT4uptrnIqedM7IZ/ggPW/BtfbCwDGmmOwScg=;
 b=yLlYtKPslKC0ZTXFqmIABHAcDqqlABEU+rmFTLgbCtVWx3v5eZqzwCzN43QZboVzMomaifCb8d5apBN/TjMpHXtT968NfUaN6JgnPYR63+XmiGTcSza8OyxBMhCRCnYpS3cYwDYKqH+Evz89waPhAQEy44U+nPL3ztVBuKjURjdiQcoLgsIUlMAveHNDAPaNLDd31S4YzVQisFBaPFsqOHvwGNcrnfdckVrkDYAHRMd6yqdoqyugZKtsz2yppvgPJB46bGM+nSCpD6TJ59TtbjAWmAGXYbayCI2ajBupKitog3D7cF+cQrRTghxJwwBbjX18bnNlRKnBQchUjr+AWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a06234a-d9ee-4359-3260-eaf18dc83f86@suse.com>
Date: Tue, 20 Jun 2023 16:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 76db9ecb-c3c5-4f19-1c45-08db719e9929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h4qI178pu2T/ko7DBycLkepjhkZoyYvZ0IWAJDmzZDTlM8RX6dL9PUu+kIgQVm/+4BQMDsO5eHlg0QGhzxVGaV61GztGx8oqXeM0ugLmzxzZJalDDC8hmIaONY/I4VaXJMKMuBc3J7gp2kuwrK090Ytvjt7bjUPTOVpMgXS9Xgy8PftXLA1hOJ2VarxYf3mw8d7+2GMquyeYUT24kSGNerPY+/OopG/0h1/gTtWqQ2jeXS/CwbYPmCPTf+CJcRp/SfTgNs72IORQcDU7qr4O8U/Fn+d2EvpWgA6c7JjLqaRxfgqC+5fnK3yd0/u8UkGewprvE8NQvl4b8BVu9HJMsjWwXrG/bn9J3yBz+29mgBCNXex+NRiCrqKiv/1P+yJAa8mUFvQ95sB/g9FaDtpFDxlP/l0ciqyExLN5SMZmezmnNo6RpcgzFXfBx2JaWeTLcec/kNp1hI9ypYUwdZqJsO6BR9FX3bLZlXklWQ+9RgE5DEvE+17nkRA1zgQwMJJpGA0y5nRdJkl94AWsgDlH9pN2yEX2ipAVZhwsx5Q45VS6qQlLuXrHAmMHX5KhkQhjQUuPluxNZg57k9UXZ9tj0z4hGMeKJEnBeJfX8yj8+Bi6cwWSfy+/v58a2GX9KgK48qCcHZfPAm+9I+Tsft1gVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(66946007)(66556008)(66476007)(6916009)(4326008)(2616005)(38100700002)(31696002)(86362001)(53546011)(6512007)(6506007)(26005)(186003)(478600001)(36756003)(6486002)(6666004)(54906003)(2906002)(4744005)(41300700001)(31686004)(5660300002)(8936002)(8676002)(7416002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJTQVZqWGl5ZUIxTVdLcUtQdXB2TDdvU2I5aElTc1VTOVpwQnRyZlRqZFZT?=
 =?utf-8?B?engzQ21OYzNtTnM5WG9PYUhMbzd1YzJuRFpmYmdEY0JPMVJnaTVXd0x0QWdn?=
 =?utf-8?B?Q2IwNXVkc1JMbUo3YStNSEpFMjduWGR3ckloSit1dXJKRHFhbnVzb3VtUUVN?=
 =?utf-8?B?TkZybDJ2RlJndytheVRIbVFVVUpUTEEyYTUzTWRvYmovZ2tOWUlncW53WFdx?=
 =?utf-8?B?OXFrcVVmRVNMMGlYWUVva01DM2xVOVFRRHFpY1JQbExUMFRyM3lmU01qeFFM?=
 =?utf-8?B?VkFLL3p6SGxrcUo0STh5Zm12U0VEaTEwWUJsdjZQR3N5TDUrU3B2dlpTMzNy?=
 =?utf-8?B?dnVRVmk5SmZMVm1iUFBGaTB2c041VjJNaTFLTXlIMzlQcXNYVkxKSkVuOUVs?=
 =?utf-8?B?Mm05Qm5EdDBObzJvQ0ZGNW5QRk9vTyt0NlZpNG52MFhEZEk5Vms1VHFiNm5i?=
 =?utf-8?B?SlhHb3lHYXFaNVF6bzVvL0F0Y0NUd2M2MlJBbytSRkxyblhTL2JOUkF6dW1y?=
 =?utf-8?B?NXhKWlBHS0pTQXNNRVlmWkhwSk1vWjJlQ3hoYVl1VlpkQ1QzZlJrRVc3V1Qv?=
 =?utf-8?B?dWdMSWZ5cFNHemY1TkFFNlFaUDZXcDlZVjYzZE9JalRWV3dMdWFvSUpkdlhT?=
 =?utf-8?B?UUFsN3NWOXlhQ0JpRlp5SXBjNDg2WFZPWHE4bTNocG4zT2NKRXkrVjBaMWJV?=
 =?utf-8?B?YUE3aSthZUc0N09BMDdRSmlIbFhBQXo0aFRlcjNYU05HNWVFbGdneVB6eU1U?=
 =?utf-8?B?bjdDcldpemVPZ2FrdjVTV0RlZGVZeUtqRXdIZTFtZXQ2NHkyaDUxWHNEY2hr?=
 =?utf-8?B?bEhncDk0UWNKRU9lbDlQakY3d2cwTVJnSWlrYlpXQnJFR0tZdkNBcU84ZGpk?=
 =?utf-8?B?L3NCRk54Z29tSHRIYW9kaGtRZVRBQXg4Uk1mREVlUHE2QWpaMXppOWVaSnJO?=
 =?utf-8?B?SExvMDlyczhPdmlWb3RYUmlQdmxFSjVUQ1FacnBqTXpid1F3dmM3aXNxWm9F?=
 =?utf-8?B?c0Z3RlMzMlNUMnpMWjdPZ1F6WnZLTG9pWnFubnQ2dktORUU4eWlTQWtYeGlY?=
 =?utf-8?B?a1V4Y2tuNmNPdHpJYzAyU29scFdKYi9TbVdJL0hxbVRiRERnVkZiOTJudHJh?=
 =?utf-8?B?VDNMbjBLZlZrRFVMa0lRcXlSUHphY3pDM3dtZG1CVHQrUVdmdnk3bHdnTUJP?=
 =?utf-8?B?dlEvaVhPZEJXaFQrNWhSdUVFM2x1YlhZOGFBTENSMzhmbThSbGtBeTF6ZXA4?=
 =?utf-8?B?T1UrQkxHSlNQczI5aUtEc050R3o5NWxSOVM4MmM0NFd0TzVlODIzaUVXTFNv?=
 =?utf-8?B?WE5YZk8wcDk3djh6eTB0RU1QcE5FbHFNTVByd0E1VFRSWi9iRXNmTDlia3Zk?=
 =?utf-8?B?Qld4ejc5U2VwajVOdGxqMjlIWTB0bko3YjRRR2QwcFkxZXNFVDJCcUIrZmZa?=
 =?utf-8?B?OFVHN2IrYWx4TC9VY0VuTGdqUlViQ0FabE5pS2VnWC9HNE9ocU12aDl6MExC?=
 =?utf-8?B?WVFlTko4VncxOVlSNXgwbFRNZGRnZXVLSjYrdEI2Y3JEZnRKY0JqNklQNEox?=
 =?utf-8?B?ZW84V21tRWlSWU9idEUza1JBK0wrcTBxT0h0bm12cDYrckRvWlJvTEtHUmxn?=
 =?utf-8?B?UFIvY0FYMENpeHhCSGVaY2FuMjNNTzRaTkJqaEdDZFNlNmNXZFFSWkM5S1Jq?=
 =?utf-8?B?RVVUNmVJanNGK2JYVkF3NUxmUHNmM1pnN1pra1NyclFsZXF6dkJZVldESEtz?=
 =?utf-8?B?V1R4SXJsS0dWMTlkaDJHOUMwdzBYOEdTN0hKU3J1ZXNZQXhXRFZweUM5Nk5L?=
 =?utf-8?B?Szc0MTYyU2J3VU9YdmsyVGJRKzdBOVEyUHFiWHNTTG1BRUdiYkFTb1VlcjU2?=
 =?utf-8?B?ZHhDeFZNNDg1bi9yQ1Y2NkVJUEV2VlpSa1RyMWpHK0JkVTNMSUs4R0t2cVpj?=
 =?utf-8?B?clZUOVAxNytmcDAwZGNGSXBSMWtEY3NFSnNkTDM2RDBkdzJPR1AxanVyb3ZN?=
 =?utf-8?B?YTRObVpRNWQzQnF2czdkaDZGSlNrZ0lXVUVpUk0xUzNiTnNRcUdnbnA0bm1Q?=
 =?utf-8?B?ZzZZQUYzbThFZy9RUTM4TTBwa2xncHFXdGwyM1ZBUlV1UStCa3IrK0p2cjBs?=
 =?utf-8?Q?mps4Virsv2X0WSkmB6XRXp35y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76db9ecb-c3c5-4f19-1c45-08db719e9929
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:56:59.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RAy0B5SHmF4hH81WeyI20QKNmmPacXH7StBhnh9ng7JQrMgdlHvZBJs3gLTYe+eb0fmyrW7OSESnDVd3aPAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

On 20.06.2023 14:10, Roberto Bagnara wrote:
> +   * - Arithmetic operator on void type
> +     - ARM64, X86_64
> +     - See Section "6.24 Arithmetic on void- and Function-Pointers" of GCC_MANUAL."

The first line is misleading - we don't (and can't) do arithmetic on void.
What we do is arithmetic on pointers to void (like the gcc section title
properly says).

Jan


