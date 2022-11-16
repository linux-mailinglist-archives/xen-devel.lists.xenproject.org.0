Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75362B4B2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444205.699150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDWy-0000Do-8l; Wed, 16 Nov 2022 08:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444205.699150; Wed, 16 Nov 2022 08:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDWy-0000Ag-4k; Wed, 16 Nov 2022 08:12:24 +0000
Received: by outflank-mailman (input) for mailman id 444205;
 Wed, 16 Nov 2022 08:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDWx-0000Aa-3U
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:12:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 652fef1b-6586-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:12:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Wed, 16 Nov
 2022 08:12:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:12:20 +0000
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
X-Inumbo-ID: 652fef1b-6586-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzzUJ2i4ZBqWyGPXqLlPYf6mT7NtB76k25dqIhQMHe2uQGtb/YNedHjA+JxAfsWj9Y0GCJpRDeJxN9W/Ywz/CtO5cONRwIOF5TJCdboAyStmSKP/gjMlmDDvcdM62qv/m2E0DnffQuzR7n0LkXhjK3Z/mMBYGigF7B3hV7wgh+06GplzaKFzSxYy2uMDnNCFflOkABrqOT6zbAm8Hcp/rUmPbHhoT6c3fB94HDOXQFmIfQBSReEpIPzi5CZOady3FK/7QuIzqaqEDCEPHrcWaDmrjwt9ccFag5nd/vcjNOkLyywB+/ZaIxDGyNzHWu81qONg52ENgRY3CZKqtN+hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8QCqOixMy/CPArvEcKWaNmev7Du6l3kdyG5pKJstIs=;
 b=WNsEo/DjzoVYbc3ilDFAbYilgNVS1LcPS8P1J/8gKzC9D2tYEPP5sBT4k4Ladlj+WPrtRqsxjW1zt3woRulNJodRZPb9YeW3Yuqjl68sK7NSSOOnwA3IevQS+zpxhpLvzwW9JA2gsstqdKIZBByyd6F/Tu4dc9Ji9OzGBj4XeCD4jQRyAeW+9MSwNyvOd96uN5/nYKnMDOmIBa9YdkbZIWWOe/ilp1sEnhnvNlF4dIihOGkHejXNUVrKlXZAMdZLXqc1XJXOfL32rJW7PINW3Dqt7hctwhz4W1XNLryI78ifB21rSN/JIFSKJ1bn9yvstFPxBlVb6YymcMMFgY+g1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8QCqOixMy/CPArvEcKWaNmev7Du6l3kdyG5pKJstIs=;
 b=2Ycq4mMxjEB62UwO2B9nwng4E34nVKy0PzC2jWncv1dEoZVknDB6k52+kAQmXuSl5XF1zc6dICPkhJc6YJValzUeY1mh/jvnBKgQ0fuP3IGqOYiX+jvR5e2YoYw401HLOx3EZM4LBCVlU1ZjgVxze3R27MwBE5zZd9CS8BXhMeEmQpou0tYCQ1UXXFMvKum0Mq68wqLBpV5HCy6b65pgnBAYMNvKgQofBk2PYia23jlf3Ffq//8pC1Guh5CJvZT80VibA75Fbg2KAcuWVNtkaWhR3ZRWjr4mSZtV7wEnhB2LZ7GXjAlS2PIuct5NioL6JAnv+c15cOdbG2CNLi+AYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ec9f4b-8674-587b-4e64-404b186ebe9d@suse.com>
Date: Wed, 16 Nov 2022 09:12:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN PATCH for-4.17 v2 1/6] xen: Add licence information to
 public/errno.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221103115204.49610-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0506.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 86232029-c8c9-485f-df40-08dac7aa484f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7bSCzF5Gwctz3CdzbpLJ5EHdbqiwwBA5JeLorlh5iLD+V4AaSbxDX7zdKCJ2buerqhlKnLD0wY6NRPzRV0SiMmDRYzbOul5QxbmRNaDSqXXoxH1kL485orXFo8DLEigDpkoh24bGfQeBaAeW6JhohcMoNOOrG877gSHLxm3YbcxyxThghIzuMjMTebg4xpZQjOguwd+eZLlERgt5LmoyNXrEwphCWaN4mVcxpzEV5tK3kJG/BroZcp9ecOnesctacGYd75laVIHBRzuSSjJgmfa2m2aqTGHn3A5e5KJ0+6LBwe7p3qt952eCCngoG/3Lg1UDzI+jC9mZO/0vph5EopqVsTzdZiuR/84RtD/LaNphZabYdBRhfcz4v2HfdZsXPh8YJHw+KTXimM/6jRxzT+6r6E2+9FP7NqwZMb72DI8DVij+DXt8pDqfHYBQLCBPDlH44Yw6k/7fJXbki13hvK+MWqwA3JXZfPjS9EcjLJl8bKvvgg/A5i+5nS9ioJYF1cpjtSiEXMdtcD6uOylLBhHGgHgZqTWrDd13d4e51sAVlcAVb8LalzDoATy07PuGy2GQaZNrTYZKC4pLcetTGeWS7wHz6XxPd+QgXMVvm7/1fbj4Mp9bjSHcT2rKQAAQBZbABhH+JDAnl9BUECCAkFKjpIokJ5zl2cDqPsglpIe0KpsTpZNOF6QCZCSZhCDZmn/nptU92suYzof5Z1BL4cRRiQbBtUT+Z7U1vNwWOw82doI6Sn/ywf9TcGgp8hULGzdf1ZMtpTXoXPvfIS9X95hOhC6FSDQb9PTjDtDQwk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(38100700002)(31686004)(36756003)(558084003)(86362001)(31696002)(8936002)(5660300002)(2906002)(186003)(2616005)(54906003)(316002)(6916009)(41300700001)(4326008)(8676002)(26005)(478600001)(66556008)(66946007)(6506007)(6512007)(66476007)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStDR1hPcWVOeFJOKzVjMnkrNE51Z2ZoZjNrdXlyd2dFd0YwMnM3ZDZmMDl2?=
 =?utf-8?B?bkRCdGpZaFkwUWhwWXg3K3FrTU9LbDFKZnZPN0ZRa0ZMazVqaTlKemlWanlB?=
 =?utf-8?B?RnZXTHpQUzFxNDlhYW1WZm5iVUtpMmtBZmNwS2hkaU9VV2dURW44eTVWWExZ?=
 =?utf-8?B?RkRiZ0VhNUw3cjA4Mk9CU2F5VTBTQjdtZk5EYmprWU44MFZDQjRHZ3RPMjFy?=
 =?utf-8?B?M2FLeEV2TkdPNE53dXJQUWxrOXZkN080NDRxZmxZZy9KL0t3VVhJVWFseVkz?=
 =?utf-8?B?c3ZIT0FaTkNxT0RiZE1TeU9CdWV2aWdRMGxxNHArR1lhRlU5UytmQnlKdDR1?=
 =?utf-8?B?Y1hTNk5CSGNvLzN4WTZRanNvZElVRnVuUzVOLzhyUjRaNEl1UmRESG9nMURW?=
 =?utf-8?B?dThhRlhNaTdXbnM3RWg2bzZVbVptMkF2Qms0ZlU3SWNzdmw4eFYvZytEa2lH?=
 =?utf-8?B?ckhHSVlyTDErbkpQb3dBeXJVR0liT0Q1SG0rcnVFRHBsRXRaSk52VlB3QjIv?=
 =?utf-8?B?T1dkUEg1S1NTRE9YaGJnY09sNVNoQ05LMHpJNjRtbHRMSk1JbHZUOWxXMStr?=
 =?utf-8?B?Sk8vVDRLV1pLZVRFZk91NnV1K2s4NDJEOWhJZTJ2andHWDNJT2JlSUZQOFZE?=
 =?utf-8?B?ZmlsTjB6OTJuQWlaeVdkMXdmN2ZxbWQyQzNBeWhPWTNhS0R4OXVQMTAzZ09l?=
 =?utf-8?B?RitmZ1Y4N21IUFo4WnYzM3M0aUUxSkZrWlM3RzBHb0YvUitXRStabVJMUGpo?=
 =?utf-8?B?eUljSjZUWTVONnU0TUU2UERDZ0FFTWNCU1ZXck5XdkVNVk5rR1JyZU1uUUUz?=
 =?utf-8?B?VTZwSVhRaWxKbzh2d2w4TDlacG5JN3FJZk1veFdreldiMGFUK1pwYVdrMXZw?=
 =?utf-8?B?T0tZNSt1WXlvVTRvdm5INGNmdVpLaFNJVjN4VG4wQnRWMm5KUUtleTMvUmJE?=
 =?utf-8?B?WXRQbVgybndjVWl5QS9lbG1rYmgyN2NFVjA1ZStNS0Qyb2MxTm92MWs5bnpL?=
 =?utf-8?B?aEJYWUd1YjJvNllNRUJNcE85N2FvRUw0VHNzK2phU0xRT2FWaU5TQUNMdHli?=
 =?utf-8?B?YTIxWTZYYmZLaUc1VHZrSnFBQWRPeUQwSVFsc1R5a001Z2EzWW1wU2F2UnB1?=
 =?utf-8?B?eG1oay9BOW95Q1FoUDRtd3krUTZ1ZGJaOExyVUt4ZFc1cVlDZERoQzQ1VTRS?=
 =?utf-8?B?RmZTK3UxZGIvbXJOQWdDTUZGSFNVWE5JYWNMWG1wRXp4L2lRQmt1c2dBN3Uv?=
 =?utf-8?B?ZEF4blYrcllwMFU2eWtrUm1XRlVacS92dlhWeUFjSGlNSVR1Y1dJdHNiSWpa?=
 =?utf-8?B?UUdxanorM2pyKzZkWnpWcFh1aGhxWEVCS2cwcXJDaC9Ib0RGWHJpZlFCN2xU?=
 =?utf-8?B?ZHBuWEcweEFVcGJEQ0dQbUdCME8wRXpFYlU4bmE3d0FlNlRyU3gzVHpLcmYz?=
 =?utf-8?B?TXRRbWxOc2ZJZ282ek55UVBFNmE3WTgyRm54SzZjWGJTd2o3YlJTcjN2eldS?=
 =?utf-8?B?WHlrWUI1YWxVTnhqek93R3htZnFIUVNWNytsYlY0M2NlMWo1akMwbG9EWVBH?=
 =?utf-8?B?UVdLWTB0cUlZbWtENzhZc0dwY2Q5MXlTMzJ0YmZRTmpPQjRHNVZCU1ZTakts?=
 =?utf-8?B?emlPTkZRemIzRjM1VnhDL2lkcWhYaUVoYnpBUHdqL2VqZ1JpdUhrT2JRNFpl?=
 =?utf-8?B?bU1LdWd6MmQwc2Z0ejdrbmlseTVUV24ranlOWHlwVWQ5bStjUy9SS3A2T1da?=
 =?utf-8?B?SVNxS01ySXRJSElxbGpQTmpBMjlFeEk0b1d6VFZUQlpUWkE4ZWFXMGJZT3BM?=
 =?utf-8?B?dEtqNkFXWEtvdWNZL1REb2puVkFVaUdtSXJyVXFpVHFLcXMrR1k3RS80eXEw?=
 =?utf-8?B?ZzlQRWRoKzBvQ3JscUVuOXRJRDhZQjlkMXYyZjU5b29Vem05NmhGeEUxK25U?=
 =?utf-8?B?RWtMQUNXRTNnblZ2MnZwOFE3VDg0c1dINDdLUUhoSkJ1d1UrVk5PSmpYcGxY?=
 =?utf-8?B?MXFMbFFCbHBDWjZ4MnVZWEgvV2c2MkxHN0NtdnZLMTU3bzFwdnAwRGUvMnJK?=
 =?utf-8?B?TXBSb3BFWHBYQi9XTVNiWW9SVENadGhwRy9XMlluSW1xOHpPOWF5cFI4ekd6?=
 =?utf-8?Q?b9rQjM51KfTG7svomIJLb8YaG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86232029-c8c9-485f-df40-08dac7aa484f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:12:20.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcBUVQ/LSUUKt3YcvvlxRONxbD6TtkCi3fnGyXKJ+C+Zxg8M1obhzdh2fbdHLwvl7cuX0ehFPpBaFg94IC1t5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794

On 03.11.2022 12:51, Anthony PERARD wrote:
> Fixes: 81f559e97974 ("make error codes a formal part of the ABI")
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



