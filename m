Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F33BD9D9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151456.279907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mlT-0004Xl-Sc; Tue, 06 Jul 2021 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151456.279907; Tue, 06 Jul 2021 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mlT-0004V7-Or; Tue, 06 Jul 2021 15:13:35 +0000
Received: by outflank-mailman (input) for mailman id 151456;
 Tue, 06 Jul 2021 15:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0mlS-0004V1-J5
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:13:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 389338a7-2732-4e70-9d08-c4afefb9091b;
 Tue, 06 Jul 2021 15:13:33 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-htgNHDxIMOuKxkZ4zwn-1A-1;
 Tue, 06 Jul 2021 17:13:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 15:13:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 15:13:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 15:13:29 +0000
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
X-Inumbo-ID: 389338a7-2732-4e70-9d08-c4afefb9091b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625584412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF8mHCXbqKG3rpZqt/df7LojCuCulW9eZ9aigTmV3e0=;
	b=gkaac3Z04z44U712GwbDaWbIBOk5n71g1QgICvc62F8S+X7rCpNlJ9vMTh6qmuPwZnVBsu
	6lUfSWHdpUO7HsLEbUzMewUZGDxb36LZIzXhbbd8PJBRDNEi7pn/BG1TzKXhaVmDDgmcM7
	nkcg+aa9OfKWVzGpWpllngc41lJBXLM=
X-MC-Unique: htgNHDxIMOuKxkZ4zwn-1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeJFoUYQIJSzJSXurvsF9czXOfZC32Pq6dFJJxZGvfeY3PvrDqJCm7IZxV38U7SjW/RpYHGR4lT1S/Ycivav35y5+NtTrXuskG+NbmMRg4SUiuE4wfXJgTMmiHFdsduCJqqys151rTQVFOXVpAcQWr9n4PXX3m6EgCsyEhvqA/lMXijNLIiDgDopBs7BezirEwX/sp98os8sfFgEvAeqTus8I2F0r1WdLEKF3DINg980Od4fUMxh0el3a+fo36eTd5SGCdBSTQKW7fX26AWqLjoqFVHwGpYjAIbF4amLNPRTnXiyr4G2sHekPV3px0n/D+hsTA34oMmtx825RkqJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF8mHCXbqKG3rpZqt/df7LojCuCulW9eZ9aigTmV3e0=;
 b=M427EzNxs8VhwUP7Fs/N5UjpLMxUvDEZo6TnQJLmtkLkZXAhlSXJ06mxmZgN/LaCVTSUMjH3BkVZzMZJr+CTipN4o6PsbYeCCdLj7vI4otu4wlC1/UtofhI5WSsD8EgQ9kyKkUI7zVIrvW2EI/bWrD13+SUYozM5DYMzZl2BmNWkNJbdgJkyLYAqb1+7gYx/o+5kiCZT/EguHbP1y5Kfl4eV4jaGh/vxZfvAiV0SmlxPhzsGJDLw4NCLl0zAYmx4zBdM0AcxckGwVoKodYTsFfgfhC+xZBaGIqzrZv6vruN2OX/fsiW6v+5nBHL8wJ24fw2jFD4JvuEr7qlPgrHpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <20210706161120.2b6394a9.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20d002fa-d050-0ea9-4c2f-1b98d618d9f8@suse.com>
Date: Tue, 6 Jul 2021 17:13:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706161120.2b6394a9.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81472767-d12c-4bdc-4dd1-08d940909cd0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392013B16470D52ED33C335B31B9@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wdtQ5El96eF5ni/yvNs08lqBIzF4khoYSgdGtFfoXcGQH6M0eeD5pLyUz8buw4OSnfysp+iGpW3RKPNsxplFmvk2iaQ/SEZ9GsXc2OUA35vHVQshsaWJsZFeTzExal2uNkXBZ1XtcV3N1fRegD2acSEIJbMxsE61jSZ+MX1Ei4RZ1nrhHG+ix9nBU2gP3/r2GjdV9TF9+kJibDQg40qAK8lpJE6O3a4K/P2PHJsZktJnhtIYhFFbe6pt57P9oPssy80lSe/ns+gAsZei9wkAg/YXqLo2vWngIi7JSqyl7zxf/00OGHuedoCZTGXVsc/5foik8olyszb4i0fpd9BRM4YRn0/6wD2xYkH6TSbwlgqfztKvt9OFpjXd/n3xDieYmtJE72eBLUvAsiIYZomGl9xViKxykrtZtBq0hPcOXERxx4NQV9LEIdWw0mFAmGvLI/mvEuQKOZBV6aC+xqAbXM6mtHI3LTqNAGuDrW8gYPZIJd2thvMgmfwp+B27atcSfloK1v4Ct70EK0ZVdK/cy6reHofqIXoKlZSZu/UJoZ9gj6zc4VHHxUqKY4fDtFhilKNGZdCnn816pg50xiAMhIZl22bPGkiR+JWy+IE0Z9g1X37fDVQO2o36XIRt1XF+WCtJl7NwzxkALjCs/1Slirru23nvklMvax1z+89tKOg7zgCjoj+KA+j3xJeYarrDoxVSUPakzhCpazAhzpkNyCUxZ6Pd239LRjbFWI4P34RdH6PANsIT2glYuERFWtSiQLhNgM6VOQgjMsZh9Lg8xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(366004)(136003)(346002)(396003)(66946007)(186003)(478600001)(4744005)(8936002)(6486002)(31696002)(36756003)(38100700002)(2906002)(26005)(66476007)(66556008)(53546011)(5660300002)(8676002)(31686004)(16576012)(4326008)(316002)(54906003)(6916009)(956004)(86362001)(2616005)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?tfq6//ganKN45OtBL/WGSJUJ8l5l68j++Xk+j1p/hN9O+dzpM9M0Nzjg?=
 =?Windows-1252?Q?0tLEZJLyAEs2MSp5y4E6d2ia9ZwlC6RzCNXXM0X1kfL5fXyPxbVz5/fW?=
 =?Windows-1252?Q?IzHUaiPlMMkGI3ZtfZC8UNtdEm3IDr1R4+koFjwja1+C3JIu5eHyk2ms?=
 =?Windows-1252?Q?LgA9WUsGKu1zks3OL96x11DIFQ4eXNuXTACqmoSE4AwzJiJBsTZn8j2A?=
 =?Windows-1252?Q?ysOtITLOC6mYy1CRAjrKxGshu6j5sS5T3WgkSUG0rwPgRMeTEQwjF1/6?=
 =?Windows-1252?Q?vNj+pfr2xUC5af9XWclIOGwLTAkzRseudz23qk1eXziE/DFKCQZyaqQh?=
 =?Windows-1252?Q?fDIP+foKQus4kxL1GScMfqIFXrWqTr/bFwiDYkGKgV+e9Q0QN8cA3p/k?=
 =?Windows-1252?Q?SmasUPcoFroSggcyqskCOFYEOIO8smdDfEXUwARhhIfgcOCkbfk51xrk?=
 =?Windows-1252?Q?TTx0+plvJDlCSj8vbUxl7FHTPYYtkhG0iePYxwRSYII2qq3V+y/EcXp/?=
 =?Windows-1252?Q?1EJtPDB9sLOcCrwkg5v8G2yJ8okyghL07Mo/WYkIw2T1MmPjqOiSvrC6?=
 =?Windows-1252?Q?KOX3/IObQsHf/Nc46V+k8ZZhtlfacVTOr8NlQzgEXXBx9IQrAhK8/Hy0?=
 =?Windows-1252?Q?LKZ2BkbBJlGeGE5wb5IXRoIa0LZUUj1XMYzHIkU7Z8J2Kvcju9FuXqBh?=
 =?Windows-1252?Q?tWoUVd2js/UucFqQRcU/36oIfYpF6Pvwy+j20XkojpS8z0YS5MwEBJYd?=
 =?Windows-1252?Q?cY6DJYgPAk0bXLWAWe3LZV5+BPmgMqawhMMMtGbsVGMimfMCP0a+W+vs?=
 =?Windows-1252?Q?G3bQ5PwMgeBTtccdHyf9m5u3icP7XGqgkpGNLLGCm5dVpAzyG8yeK85Q?=
 =?Windows-1252?Q?pE/Zr7uihY1gO9kMujFkkMiO+dGYl0B6anZbepmvonTAJ1qvLs/xfgO9?=
 =?Windows-1252?Q?N2oIovEYYGg6tuj+Cmx9Cir50WUGL+t3mQDjq5CJO5vpFw8Ea7gcvw1X?=
 =?Windows-1252?Q?IBgJti4oxbMWIOT722vpNZxfLJpV8EkhlEqMpBsKkEUHoYqwIQFm8GxC?=
 =?Windows-1252?Q?+QLwJG3Fmzi39pDHRp8l7j1i0IbBofFFY625HAI/58pYH2ZT3EXVqzZT?=
 =?Windows-1252?Q?9e+gSreiVis1hANu7no750ldAxiKlMSj5xiJvgfGmTqSxd+r4okbuLbW?=
 =?Windows-1252?Q?YQKr9LNHIxAY6kGaIhYap+U+p6gNRZMT4sBAwi90xbLBicWojiK+THqL?=
 =?Windows-1252?Q?Mhf+wIppQakOX7t1m59ruECQQzm6yvPlDbtlvSfafVddHi7LQGHGGATd?=
 =?Windows-1252?Q?6tYWYzAcxGTwkDg5dx8sx9SgbGiFOGwVMcFKLDc1R1VlaVRy7kjOYdwm?=
 =?Windows-1252?Q?2JRptA5JdzoWNLE1hIQie11j3AS0gYt3TZLHdV5CxuJusfU6OwVsixf9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81472767-d12c-4bdc-4dd1-08d940909cd0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:13:30.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmtghrDJxfgtzO9Bbx0rg4/HfLhKPPvneIbVcDvKTXffsBI+yNSyAAqe9yUmvhSHz5O1zypY9VxjHVOpcNoyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 06.07.2021 16:11, Olaf Hering wrote:
> Am Tue, 6 Jul 2021 14:58:04 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> 
>> the reporting is broken since a while
> 
> A quick check on a Dell T320 with E5-2430L, which does not have "Page Modification Logging", indicates that staging-4.5 appears to work, but reporting in staging-4.6 is broken.

Not surprising at all, considering PML support was added in 4.6.

Jan


