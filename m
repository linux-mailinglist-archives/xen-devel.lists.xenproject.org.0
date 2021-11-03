Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BE444417
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220954.382432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHj6-0000SE-RY; Wed, 03 Nov 2021 14:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220954.382432; Wed, 03 Nov 2021 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHj6-0000QG-Nv; Wed, 03 Nov 2021 14:58:56 +0000
Received: by outflank-mailman (input) for mailman id 220954;
 Wed, 03 Nov 2021 14:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHj4-0007d0-DZ
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:58:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f884282-3cb6-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 15:58:53 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-4F5sC1xMPtWynMa5qGm11g-1; Wed, 03 Nov 2021 15:58:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 14:58:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:58:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 14:58:49 +0000
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
X-Inumbo-ID: 8f884282-3cb6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635951533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tFASd2uRDGG/6zbz90CB4A7QLi4tWN8h4Ck8MZrvkdM=;
	b=U94Ba1okLJ59KYa3RR33QwwN1rqnVnXPhrbg4m5rBaBVUwvW1NPEvlFwAXPWLlm9flh4ru
	3lbS4ve9IL0ntl0jjIZwrIwqEPS3Tg8x2a1s2FnsdFloagF25N9sjWjmO/zTfsvAzn+uex
	cwSGhpnDVIR4978SwBqRQMOJo8xyLeg=
X-MC-Unique: 4F5sC1xMPtWynMa5qGm11g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baFM9j/n0fGVCU/LM3WNwXi1d4YUJ2zpOtQ3uX1yZZtt+RwP3MiFoa6oJvM3TTZre7LjSaDCmxqwkoBQCPQSZcvj78FZciLHOCGDQQo2EllEKX6Rk8BlOn7MB8MZwLRjmOCtBNiEvm12xY/7hu+EaRmExChcxyFI6zgF4tqOM1epsZkGsP36EOsidwAnFG9XjafSwWHOeQohOza7uXnREZqRPE+F7ujYFRIEYErY2vl5p7HrA4hZXn/J7KL7O9GQ3HzdXpDGuLwXXLXX+pB2NhsQ8I+krMxF1MptH5iU7ohF+1+G9dnCx9SGOpz3xjAULNM5dLshD+rwXai7BL9stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFASd2uRDGG/6zbz90CB4A7QLi4tWN8h4Ck8MZrvkdM=;
 b=mB/pHHpqnuk1fgXlUbPmB44tet/vQKCpr1vP7iFCaG2cEuhSYCzI3cZOQm3BdU/20dSwcaxD3F8Br9aIw/l/bCFHkuLJroC2D8vrCiP+IH+uzq0zvwupW27soS68UKCK/BWN+Ew6OeMPy/KNtCA9p8KPSgEWsanCMAvI88cSAlP+Vx97JFkpBphGaV4WZ469flkHbLvd7cDZw9K68IDCCKpOGPrcCeDONboo1ppG5Q81sRXjqpzHWr/h/msWIqm1BJUHQyFs3AZA9KP1lmXeLpCkboLSiXnZn1WC3748Ij2fXcxDitawMWluQlu2aEcel9rvnVLxzJDSUzdF6gpxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbce3cac-c635-65d8-01a5-9c401b8197b6@suse.com>
Date: Wed, 3 Nov 2021 15:58:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 06/15] add .gitignore entries for *.[is] below xen
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0183.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc91989-0a32-44dd-57b6-08d99eda7233
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27040B1D05A244D77AE23B5CB38C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hOfIwMo1pPw4XoX3122Od8lVGTyOiTBp4A4TQjf7GgLuA34hXX8EaaknjL6gj57OXl67bdzTY+EmFPTunZ9rRq+wbYdmiAwKNMVR+jFNvlVts60fNfMdCxW62S6y8sWSe/w0UX6qNHBqPT4bp03BJuGK+JcoDRd9+9DaDPyBoAHMtF9F+6OpyIQPot6+IpjxYxQe10hutm5BZek8OTazTs5ZagH1bOSvsDP3It209ouWkclz23gF+Zg8qw9/40pe8pw4FzYhhtJ2Y3PUMQaZlkyhB2kOfkMUHCf0IBI1NYXtLAQHEwq2GMmJSxytjdBKgWXqDyvFabZbaK7TUVmYFH6sC+QvWCcU/lioOLMgXYUpUM+NzNegJMkEnnGrIHudmaY551eTyfm3BLdUkaUG2xrEDOmLTxNfpeL8jI/RFRFkaWilAP1bYm7yPU3UozHj7RmGJtcwLkGLyDFa+wSBauZIRp+rIzVGNs4wUDhNFa5uxLEuTpebunJJNJ6GCHqh7J2U55kzEdoudPy0UPkJXBYifyyJyxfaQ5zHgvvH+ONUEOZIh0ShW6+J9dm8R8D2Q6xEqJeKBiq1w3TdkqYWVNz28PIssE/yqK6FknAuFgAK9UlT/ODu/lCf4Q3QGoPb1vP6oiIv3010QpVa3ZUcpiaKUn2O5BkeZpZh2SdzKMZRZQpKdU06NqnE31sR3oLfP1pp2ejAFP3Icl+3xcAkcqw9kxxhZPxbWkCZgS0mFvvV/YLSEXXfS95+WzUS5NaYlkeIcFGYUjPWRckaJaUbcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(66476007)(2616005)(86362001)(26005)(53546011)(6486002)(5660300002)(36756003)(6636002)(956004)(508600001)(38100700002)(31686004)(6862004)(31696002)(16576012)(2906002)(8936002)(8676002)(186003)(4326008)(54906003)(37006003)(316002)(4744005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZVb05xUEJiSkFlemVQM2ZrOWppaHNrR1ZzWHgzZmIvaFliMjJ4c29GQ3BP?=
 =?utf-8?B?YXVZOXRWWU8xYjlBOUNRaE9kbWkrdW44eXkrWk9FMVJQVW83cHFwSUVqY241?=
 =?utf-8?B?VWhjYkREa2xsaHlaeWxESDNEMFp1eTN5Um0yM3Y3bHY0VFlsSEVYWUNEMVFG?=
 =?utf-8?B?UkZza0VxelAzNzllK0lZUEFLL0EvUkdTOGdJSHF1WXgyd2Z6Z0Z6Qm1lYmpP?=
 =?utf-8?B?Vnk3L2NZOFBScmVlZWdtU2RJcXdOZCtnS2doazVHbEhnanlsTUQ5ZkI5ZDR6?=
 =?utf-8?B?QnR1S3YybUxWeVliT3pDOE1nU1FtQmhaZDh6emtteEpCOXBZR3h3enJXUFla?=
 =?utf-8?B?eWFNeGVSQmlyT0EzNVJWeDVKV2hoWmQvUVU3aG9HMHIrY3A4NXIwbmllcDE5?=
 =?utf-8?B?MjROTEd1SzVQWVJoOTRVOVdoaHU0dHF1NFB5YnY0V1JWS0FuMzEzc2dQOTN3?=
 =?utf-8?B?cUlQWmswQmUrdDZ5NXZmTzZqeGhHcU5pRUtWZGdialdpamxpcDlGUlY1Tkdh?=
 =?utf-8?B?dlUyRXZkalZNL29QVllGdE9BckQxSnVaMlNxTEIwdnhFdTgvNEFWUjFvMGhk?=
 =?utf-8?B?WEY2TFhsOU5VbHBNLy80TzIxNzFLRmVWTzRvUEp1YlowZzhKWTFpeGJ2YXBn?=
 =?utf-8?B?eEFNR0h0Q2xOQzhEN0V4aTVzRGl2NzJIT3ZYK0RSRktNbmZnM2JNOTFhT1Vy?=
 =?utf-8?B?UENQc0I0ZWkzWmxGNEUzcmswYmVBQlFyMFNSQVMyZ1c3ZXJwS1B6ZkxRQyta?=
 =?utf-8?B?YUgxTWRZVm43MUVCdTVXMDd1aFB6NE9zQ3BZUGt4L1RvVEN3LzRZdU4vQTNF?=
 =?utf-8?B?V051aHV6dHNQL1JpYnRTOG45aTNBZ0NYRHh2MlNYRWZDeldqd1NSVitNUUZD?=
 =?utf-8?B?dFA1aWZLcld3MFNTV2hReUtqT3RiUEVEOXNQRFc4aXdJbmh3a0RvRGNrMWhq?=
 =?utf-8?B?b1doS3o5OTloT1VKaWZIeStyYmtQcXlvTVA1MmNzR0pWTGxzMGRKazRtaHRq?=
 =?utf-8?B?b3RaemlIMldrTTUvQjlxU25NUjQ3eEVPbFFYUHc4M3dnRmc1dHNGQWpIc2ow?=
 =?utf-8?B?VFYvcWxmNTNVWHBJUWs3Wk1hNk12MXZPZnRtRCtnQ3pVNy9LZ0M4ZWZ5ejUy?=
 =?utf-8?B?SkFBWTg5dThIYmFNNmt2TndGYk0yaEhhVVNQYWsyckNqVDBmK3BBRDhONVI4?=
 =?utf-8?B?VmRWNFArRjBHMUxzdTZnT29wNlQwWndyaDlldE1JamwyYmhaYjV2ZmF5Kyth?=
 =?utf-8?B?ZVlqY1FuMmZnZHZDVktrN1JWdUFIOHhGTHhlSUp0OEg4MW4wMlNwZWdCY1Nr?=
 =?utf-8?B?ZDZ0ZWFQWldwMkpaeEo3Vzk5U2NMQWRQYml1MGJEem5UTGdxUnV3TS8zY2JQ?=
 =?utf-8?B?ZStNR0J6TElWSGhFYWlWV0ExYS9VMEFMZStxeUFueFkrbFJqRlRKblJINlNB?=
 =?utf-8?B?ZEJVTFNmS2k5QjJJZ3o1eUVySkFLMS9ybDhDQnJUdmpGZXAvRjExR1BxSGN4?=
 =?utf-8?B?VWZ6QU0wOGNxd1dQWnUrZ1Jra0F0K01sUy9nYW0vaDNvTklpT1VYMm12Yktn?=
 =?utf-8?B?cTZKUnlWekpFODBKVDNJd0pKc0FYa01NbjgxWXNVaU5iTHFibGhFekhDQmVq?=
 =?utf-8?B?UzdSSjRXTGEwNTkzOG1UT1hId2JMSEVyMlkxQmhoQWtkM01yNEVkMXdZYUdB?=
 =?utf-8?B?dThsd1JjemRCbFlYK0s2S3UwbndVbHJGaDllNWRkUWZjWUp4RVdmVlR3enhs?=
 =?utf-8?B?Y05XdlpXdnBTWWwrdXRQOEFUTi9Ob3kxSVdIRXpyU0Q4TW55MElRcG0zVjRC?=
 =?utf-8?B?aURjVkFVZzA0SXlpLzdCd0lkdDZOb1V5Nlc2Ly9SZzR1YTc2bVo5QS9kNW5S?=
 =?utf-8?B?SjExdzdZSWFzMVZMSHRlYmFzWUR3dHRpU0ZhVjE3TnNQWWtVM0thZGR1MDZC?=
 =?utf-8?B?c3ZJSXo3dEl4N1BaMHROeEZFLzJ4TTlkY3JCcThMakpSVzdrc3I2VTk1d3NM?=
 =?utf-8?B?aG5mcXBmSGxZSVFvVnhYSjJrTkozQjA1UTZhTWdCbE94eUZjVmFhUXdrd2dz?=
 =?utf-8?B?cFVBVGRLTmFucC83Y0JDemp0STJYVlllNUpxT0FscjBQUFRvNUdqSjRQeXNS?=
 =?utf-8?B?QXpHNHowZE9RemJjWEkrNGZucEJKOHBicnMvd3p0aUh3RDN4bnN6aWdSSldG?=
 =?utf-8?Q?nHloOTNq1mOo9o2yu42LaiQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc91989-0a32-44dd-57b6-08d99eda7233
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:58:50.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv+q4QbvqYaaTZPkgVAe3jxY40miUuq0Rn1yF7FsUmRtwAxPXd1h2KBvtQRzz1HUWv75ojqGBcAKpImkO/zYPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 01.11.2021 16:20, Juergen Gross wrote:
> Instead of listing each single file with .s or .i suffixes in
> .gitignore use pattern based entries. Restrict those to the xen
> directory as we have e.g. tools/libs/stat/bindings/swig/xenstat.i in
> our tree.
> 
> Below xen the pattern based entries are fine, as we have pattern rules
> for creating *.s and *.i files in xen/Rules.mk.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


