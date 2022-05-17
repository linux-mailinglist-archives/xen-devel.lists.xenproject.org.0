Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF052A31B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330850.554253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx7T-0002c5-5J; Tue, 17 May 2022 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330850.554253; Tue, 17 May 2022 13:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx7T-0002Z4-1Y; Tue, 17 May 2022 13:20:11 +0000
Received: by outflank-mailman (input) for mailman id 330850;
 Tue, 17 May 2022 13:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqx7R-0002Yy-UH
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:20:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12c3228a-d5e4-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:20:08 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-dRoJaMrPOiSuXjrw0jTiSw-1; Tue, 17 May 2022 15:20:06 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5227.eurprd04.prod.outlook.com (2603:10a6:10:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 13:20:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:20:04 +0000
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
X-Inumbo-ID: 12c3228a-d5e4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652793608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBJI6c/5rUG5eJm2EAjii2sjsrogCPgZuNGKlo4sUOA=;
	b=aUZqlOISOAC2KPlqpZIhoR5VPTqwsskpzPSAKJRQ2rtFfqP599QMwiXI8bovWedHB3FLwk
	zL20Kt8+pYg0JUqoO7H/FEL/ZxKMvTVgHRP9UrNBZkdeyJVd7qSiLBOIAkVNE7rWbN2EqC
	ldKePVRreS3BrepRUbWMnW9/IaDuQW4=
X-MC-Unique: dRoJaMrPOiSuXjrw0jTiSw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9EBYH1gRi+jcvfKLbp1Pe3g19cSrRre7YnZOmAfUwD8uqQzHniWsUl+65WoGPSdYGk3b4qIKq2Cc0pzrvAVvpZzk+fS+16JFZq6fMkghESVWa+Owjr3q5Jtx6in3WsDFSMeEG7djIjeuqcluBGtxpF+0J2A36zjC55QA4X8FGNb3ePmEwSFosb7H1sFo4v/qEw4EVJiFSzXIN7oEDis/SKFewxRSzllHkJgevgma13QdmwVlDKGHA3FnDMBtY3dAD7BemM7zAT26Ks+UJzpyuTYDR8HIqFO8HBDC+u5WWZQK3TFkwzHjlvcUcfgejlj9gEVkkHAh2T0fSpkaMY3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBJI6c/5rUG5eJm2EAjii2sjsrogCPgZuNGKlo4sUOA=;
 b=Vdwd3xm8uPjETBFWdMZRqiZtrd9PCV0ukrBDUlsKcD28onlI5bA4LO9CDD/XhOPue/Luamcmnu8lyN+tegEyZs0HaoI8PLMs8fcmq2/YAhDiWt/s8vBp7r9ZASJHL/5Xdl5PvIZiI2mVPVqWxLIXvtf9BXzaj7xHJtIHfdYq5zp/P82MpiDY5q+sxV15h1X3ipPplfjasF9E8hbYLhUu6YT7X/ZKykU2px7KRb6TBuAiwanwza0WA4DQuJ/eHsDl3OYj0cV5LFVBU8Nqf7aPa25Vyu7btHa7ci/+36O/9Iv9eWBkAfY0HXAFPZUjNNnpvZbRftLuW4cdCIfiw8Bt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6a8ee0c-7b94-d891-0b92-128c406b619f@suse.com>
Date: Tue, 17 May 2022 15:20:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-2-michal.orzel@arm.com>
 <c7366893-c4fc-dd53-3b20-828e67cc5b91@suse.com>
 <bdf5ed51-0ec4-ca3f-897a-40cfbabcc4c2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bdf5ed51-0ec4-ca3f-897a-40cfbabcc4c2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8c1dea-d65f-449b-96b5-08da3807f4a3
X-MS-TrafficTypeDiagnostic: DB7PR04MB5227:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB522739FA2312A0600EA37AB0B3CE9@DB7PR04MB5227.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	16XvUtJ08O8WCIw0tvD5BY7WlT+73KVD7xTtSUouu6eJMpNDxWtfS7Z9OllGeDnztJQC7LO8CRuQeZFGvChC5K4zWZRPIZuFf/DAZrA5vimDw0n72Z9NbVHu9uyPADJY4lSYE0ObVC8QNQVA2ipBfxah28i+YFNNJaAEu7cFSeoU+a8DirriPqDK3Bq5FBFff+FzPrpW0cCB36YkJ9AG4TKyktC5ijXf3hKmRRrZLjDXA0eLAhD3yEaW5BaFdO0PInuwyb6jKYT+KC3O7dTKommJ25zcqwQfKVj2k4gn1ROZOHjpTBgIdm4p2pjsCAAvbIiOtyu9K7Gimwdnr6ep8UsnE5szij9D04C39gxAciAlmFOEdOxCV+lzYZpi1EOenfxw0dIQNh0HGtbhswro9MPEDhykkBIFtiALBU37LtzfyoR0oStwND3+8LWBzmeilUE0PzKkkah5NTtVi2lQms70UBUhDeJhUdOKVa1sy5DV/7H2k0yKQVgo8CPzZiNai2JNzNnR/hY16SlS6gI6jmTE8iyc1ojYtCFj9PUck0DQ8iF1rQJLrQpxmzB8OMtKIPtvkATtk4lb5e0y9Xpdxopkwyw/ixQwhu5689jxNbqjhbK6RMayyOXMjNP86k+rtSvW76qFM/1bUdO+oBjeZQ7fVDxmYC3Pb5ivXK/b6ESz8QzrSWuM4JJq8EKuYG9LfoZSKlyFj3YAb/QUS7xrudK5LrnnaAaq4AD8PE5O0R36ctMKArnKTSN0BYwOlBcO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(6506007)(186003)(53546011)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(2906002)(558084003)(31696002)(66946007)(66476007)(8676002)(4326008)(66556008)(6666004)(2616005)(5660300002)(8936002)(83380400001)(316002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pFVjFWNk1RN1pOZnlwc3VQMjY5M004QWg0M1UxWlUvblJkRDc5R1VWOFFu?=
 =?utf-8?B?TExnaUhEWnQxaXluMkF2VkhIeHlFcUI2ZU9tRm5UcFRpTmxEdUY5cHlIYk94?=
 =?utf-8?B?NTJaQWtJSVdZUHI0SmtrLzdpN1VXSUliR2F4aWFDRXV3QU9XR0p1ZENqMXVP?=
 =?utf-8?B?MWRyTHBjd1NSYlNOUThZT05GVmtPNS94WnZ4MFlQZXVkeDhqNVVzeE1hWnRO?=
 =?utf-8?B?OWRoQ1U3KzZXVGV6eW40Q2ptN29sVWxtWVJRZllvZVlkRldRbTQ2bm1QTDMx?=
 =?utf-8?B?bXh2czN4RjdnNEc3YmpiSnBFb0RsOGJGcDZCNFZ2bDZLSWtzSS8waUgwd05o?=
 =?utf-8?B?NUlKcjhnVC9SMWpoUm9LQnplVlREU2tHRHVkbUJxTkNtc1krbzFKbjMxU0N1?=
 =?utf-8?B?clFVR05paWdTU3dCS05kc0pPaWJkMDFVMEwzd0VkeVBaOStWbFJJaTQ5S2RT?=
 =?utf-8?B?TlQ3MG8yQUZXNlRlVXJ5eXFrTXNRSWRqS0MzSEhGRFZnSy9UZjJzQ2dWTUZz?=
 =?utf-8?B?U0d1THJZL2IxOWJvVTRmWHhnaVZTVzFZTFNFVVhGTVNybFJxNTc4VUNzN1dJ?=
 =?utf-8?B?akJMN2Vibk9UZU94T2JndmVETHNLcGJmUjJ5VnIrMWN2K3pDVzRpY1NJYUNw?=
 =?utf-8?B?TXFYbWdNT2lIT1djbHpZYXhNei90STFWb0crei96ejZBeEtybXF5bzRlQlpI?=
 =?utf-8?B?anFieUc5VHJnRkhYTnAzbk5MblF0b21aMWo3cHpYMUhKQ3ZTUGJQb1lER0N5?=
 =?utf-8?B?cWlqdEZaeFpKU1kxNXRVbGEyVGM2WGN2MTlEWDk5L3AyNFd1WVh3ZERuNnBq?=
 =?utf-8?B?V014VW52YWwxb1ZTUG02YkE5a3dCTVNPWGVDdDJxT2ZvRDc5cVVxaGh3SHk1?=
 =?utf-8?B?QzFZelRUbFdDSnowNDVuNFMrdy9xYjVtMG40OElDL0tlQzBaMHNYT1Zrak12?=
 =?utf-8?B?aWx6L0dTVEFDMXhEYm95clNmaXErQUJUK2cxeU53dUQrcWtVdWxsY2d5ek1t?=
 =?utf-8?B?UWt5ZUdUMDY3bHcyMk8yVnZlSlUzSitVbVlkaVg2NUYwVWJYdUlEb0lTWGxo?=
 =?utf-8?B?bzFGeVI1dWc5b2pGS0pmNENUb1BmTjQxZnlJMmlMTlJsQ29oNXlITS9GQnNx?=
 =?utf-8?B?UFllczRsUklZbTdKaVpDZCttM1lPQjR5N3FhYmt5dGFON2pTYi81am5XQ0do?=
 =?utf-8?B?aWVDbHdENlV1eHJxNHk0S2lOazVsVTNIbEI0SFEwNHRqMG4ra00wQktvZUp5?=
 =?utf-8?B?OU14L0FvWTRqdFZZelFFdWVBYVRlY2JsS0o2LzhyQjlVdHlPbldmZ2puNnFV?=
 =?utf-8?B?MEE1ZDFMUEFyeGdUMzBnS3h5NVFoY29taTVDaWdYV0duYkxDMTJSaElJVUZ1?=
 =?utf-8?B?YzA4ZmR3WG5jbThqRkdZUWttSUJFWmVQeDlrTmVxVit0NFFhTVJqVFNQc3Np?=
 =?utf-8?B?UW5iSnkzQkpuL09VdEJ5QlFCd2RsUy8vdVVCLzBYWGgzc2w5Y1k5elFub2lC?=
 =?utf-8?B?TDZka1NSV3gvbXFOYWVRWW9IWURCdzN3KzVmNTRJam4zdW90cTJkQTdFdGJz?=
 =?utf-8?B?dmNLaW5FNnVSR2orNm1kYUZNNnRWSnBKd1ZBakQwVHdicjVvTzdxSE4vazZZ?=
 =?utf-8?B?NU9ZalYyaVVTYW1jekk4VnJ6TmREUzAzNDhLUUZoZytIbC8wVlVwSkhDUk5n?=
 =?utf-8?B?ZlNNTFQ3ak9nak9oVXYyYSt2LzJqSzd0UkNxNmROcjVzVFFtUStaMm5Sb1Bm?=
 =?utf-8?B?bys3bmRKZENpMGI2b0tVQ2pXZVFEZFhjNDNCVy9MQmxIckFRVTNULzQ3VVQ5?=
 =?utf-8?B?cmU1YnBERjlhbFYrdzZPUmFMQjZyM2FmWnM1WXFUazZianlCOCsvcjZKU2hS?=
 =?utf-8?B?QkNmOGltcXBZRWNna0ZKZktCVlhzbk9FckJHTEhpVXdNNWpxNHFRNlNNWG4y?=
 =?utf-8?B?c0dQbUFKS05CLzRXZFFUbE41Q0FwT1VTWE5UaWMzSWFNc0x6Rm9YMk5FR25R?=
 =?utf-8?B?YS9RdWovM1NMZExTcXhjY0M4cm44cFYzMm4xN0kyK2daL0JaeUZZRHhEd24x?=
 =?utf-8?B?Q3hSMlN1SXZISWZqNmp6VjlXdng3SEVEdGxpRENoa1N6Njc2ZXExMFdXVTVi?=
 =?utf-8?B?YUliNFF1ZEp2TC9TdTdtcUFxc2ZKQUNBbU9wb3pZRjM3ZmhERnhUSlBTRjhy?=
 =?utf-8?B?TUVPR1gxaWNSMUtLbUpROHVBMGVhZ3dqUHhlL3JCS29PV3EwdVp5Ni90R3Aw?=
 =?utf-8?B?TUQ3aVMxMGZUeXJaYnJvM1k2d1RmbWdxMlZWM0l6SDdHSjdIZW1LQUVKYVBZ?=
 =?utf-8?B?bzE2L0t6YkE5azY4NUdSVFBrSlQ5YWJGNzFodmtuaHhUdUpXNy9Udz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8c1dea-d65f-449b-96b5-08da3807f4a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:20:04.8509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lImLzNDlI0ZSFLzrobbXbIwenNOyfuBI3TnR15RffTSGuB9WhET04ddXy2GILXagjGFyKv7USWoFCHDrhQ42sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5227

On 10.05.2022 08:52, Michal Orzel wrote:
> Do you have any remarks related to the second patch in this series?

No, I have no further comments there.

Jan


