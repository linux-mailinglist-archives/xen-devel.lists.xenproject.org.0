Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96FA3BEA58
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152363.281495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m197i-00049E-4I; Wed, 07 Jul 2021 15:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152363.281495; Wed, 07 Jul 2021 15:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m197i-00046S-0E; Wed, 07 Jul 2021 15:06:02 +0000
Received: by outflank-mailman (input) for mailman id 152363;
 Wed, 07 Jul 2021 15:06:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m197h-00046M-2l
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:06:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc01274e-9016-45d6-b528-8ea4986cb5c7;
 Wed, 07 Jul 2021 15:06:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-zmS_FOdyPXW12z0qrOS6Ng-1; Wed, 07 Jul 2021 17:05:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 15:05:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:05:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 15:05:56 +0000
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
X-Inumbo-ID: dc01274e-9016-45d6-b528-8ea4986cb5c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625670359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA6yKVbRGkdt6mFoIv47GD1QeubqKGcVngTzn74HTks=;
	b=YhuxOT7g+2+DLntB9PuhG+6BpUMAhB7WujqshKoXNxNoHPv/0OobUySRSGh2FdVLJhOSv/
	AMvaljVAbGE10MnrzpuBfPu2dTLmgPqPQExk9HcV5lRbuBAB47qWM7rpL4heB4TiQ73hbE
	5wzkqc4pPJ0E6D26Jj3OKPapksS9Y90=
X-MC-Unique: zmS_FOdyPXW12z0qrOS6Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4ul1LUfhbVVPwgoaISr+xBV4ovy8DxjJySfTHkMDeuUBU6cNLPpf/jqriizFzN6gNAeYWkL3RJXWQoH7Di0j0xjI3yD3/RO9GYk7NoeiV7M/arBFbtxaGRJCx1iNISa2fUIeJDW5Mjdx6qQWqnDNrpmqoKEh27mif4f3+RIkuMfOGcIlxP3ObQLiBGIOhxJaxPssGVQK/NEwzTGOeHzYdrK/oOfH8kjx0dTM9xEclPhUJ8N4rwNMzgGTWOLeA7OIxUULxiQcRQBJhU0LdO0TSOmbgrr8/4gvqY5Tg7rHQGozOZDMCE9jz+IuJaO2GTTcK6R+jf3HO0NmW/YVmntcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA6yKVbRGkdt6mFoIv47GD1QeubqKGcVngTzn74HTks=;
 b=Mi3jBdTtGi4+2/p9rRR2XiVka/DsQk/F0S9hmBQdY3w1PUl1RzsfNXSKnk0tq6glQJ1b0Pif+RtWic58pYoxeZ8FB16BhVvQUAMHWxfAlrwGpAf4jUUOFzg5aXTcjw3doBpn+TZIY6d9KO11nFRIL9tpNaT13teX2rfKncafyckjafX3F/4N71/p+8jpsQvBoxdg7M6/sVMYo//lYnz61b8Oa/QBQRQ/YqzVQXicApnB+htmmJIYf9CFBck9zemZG+v81sggjfPKeo1haCvKL7jVcuk51IMSEL1LihtKvFc9FO6MXZLcIQfUqLNRiUTYfK/zr9L0XYZiMr/XmtarPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 10/31] build: use $(kconfig) shortcut in clean rule
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-11-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c68518c8-1b85-5d6e-cdc8-7005bf184304@suse.com>
Date: Wed, 7 Jul 2021 17:05:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-11-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6faa57fb-9cb2-4ec6-2ce1-08d94158b983
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703738CA885313D9AAA689B8B31A9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDnzjleiF996ZqFsaeL4TXPZZtezxtwRxXWRRr07FXjC7XdvhCM73mXXEyp8U8Q2P5NFpWT8jwoL7YmAGWhg6Ygzl8GB2vmEKIxgwGcsVkE6taaH2LV047hjfUyA/do3017pqTfESQv7fzdoYvoDA7GZjemr3FCFjqnQ0BJN+xA4jVheTtL/x5o/Sc+0M3/oo7lk9ld3dJMl8mTBhvYy3e6tVkhYxQ3k5kpJT9doMBlwqewtXeWXG7AO3jeaPqP/DSA9ub01sWTHlFRYCHMP+0Ew6kPlOwyRRAo+njSeXqzJYPsWUR5lM87bVUqYgivT31l2eZsnLg99sAsuzUEMc5fTZ8PBJCeli4e+ZdGgENOLfS0j7uNNbrByN6enju5S8kJKhSopa487e4viE6ccXFpauEMXNw2YTkqsA2/p3FZiv3UWxw1HU5w3L3wEwh8C5pSRy0NcTElGrENApCdly7mlc5lCm8MIhguhjE1g/UxkJl/RHtfj6hmhUzgUk/a/TXXZxIat0PcWaXvypgfJhBjzYNF7AK7oKsBUajR7iXjQdQGR75JrvPL89k84H+mWy8jvPY8GmsGHV+mqeH5SgSOqz+FuPgGHfl8JrWuDI3MG2qSuEqGuVHD2mnejrSxYYj8EqvDCVavVQyEqGOtuzWU+I2sn9tJR5QaIO3HaeQhOQeavMOsmDpUcCkY6u2b08a5bJ+jI7uptM9WU/a3nfI4tsvApwKvTNTm+k/KmLcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(376002)(346002)(39850400004)(4326008)(186003)(36756003)(53546011)(2616005)(6916009)(8676002)(956004)(38100700002)(31696002)(31686004)(558084003)(5660300002)(66556008)(66946007)(54906003)(6486002)(66476007)(86362001)(8936002)(26005)(2906002)(478600001)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVkrRTlzMlBLMDFkOXp3bGFSZXNHWDNZc2pzbHpxOFdtUWZOZ3hDNmFyUGly?=
 =?utf-8?B?N1lFMTgrNXNBZ3NuTTFwQ0cwMGUwQ0dxTi9GbHZjSEx6U2I2L0xsOE5ZNVNi?=
 =?utf-8?B?Nkh0bUh5dXAwYzFxdU8vR0FXY0lNM3B6VG1YVkpsSTdrUUpnZEhnNURQalZR?=
 =?utf-8?B?TjVJa0IzSWRJMk44MVdYcUFvRU12T0lUeEwxWEk1aXFZTlVmSU5OMDRqd3d5?=
 =?utf-8?B?bk5EaXJvOHFKbHE2Vmpaay9SMEd0UzFtQWlOSW1sZUxNaENLUmcvWlI3KzVk?=
 =?utf-8?B?RjE3OWROQmtWb2dJWFBJa1VVSHREQXhtVjZYUGlaMUdTQ2tkVVpNU2ZFeVVz?=
 =?utf-8?B?eU1ZQUE1ZmM4LzZOMDNETlZYd2lLVzQySFVrS2xZeElPVDdPdnlLbW1EZVJa?=
 =?utf-8?B?cGVSS1QxVHN3YjFZMndzSEY4SXljZXBFZWRoYmhCNVhqcTlyYllsem95dHIz?=
 =?utf-8?B?ZUxWL3N2eVJsbFBDT1FCWHk2MnRwM0ZtaDkzY1BpYTJMVUpjVEtycXBTWit0?=
 =?utf-8?B?eFdiMzZsZEVHLzdvU3FVMDQxMC9yTXdvNFZNb3hmQytjeGhsdjlJSm4zc1pu?=
 =?utf-8?B?MllUWkNYLzltekhyWm5tKzErbkIxN21UeUZsZGxnK2t3elZzbHE2TkhlL1Zu?=
 =?utf-8?B?dGM1OW8yemRhSERva1gvVTF6ZllvZG81akUyYXo0L3hxQ3BoakNSVFl3d056?=
 =?utf-8?B?UWxpU0paL1hzRlNoWUFMMitxOHhnZ1hwRWJqRVErY1VXY3NZdERyL2wxcGxF?=
 =?utf-8?B?Z2lrWTFmSnRraklBU2o4WEs5dzF5bHNhcjU4UDI4Yzd2S2ZYUEpWMVJibXNu?=
 =?utf-8?B?QXYrM3FEOGN6TnRlYlpCdlVjeU5EcWErNzFzRFdXRC91N0NLdlNrMmN3Nmhk?=
 =?utf-8?B?TTBuYWtPNlNPTkh1WW5WYlhESTlsQll5ZzhXQ3U1ZnloRUlrdEFpZlNUVm5m?=
 =?utf-8?B?alFlQ0xFQXU2N0s2TGE0ZEptUEFrbE1ja3Z2ZE05ZlRwS0RUZzlaVFMyT25M?=
 =?utf-8?B?NFY3THFhNXhsSHdCVE53SjZNMkxZQ0Y1czZhNjFQZVV3UHR3OHA2MW9FQzE5?=
 =?utf-8?B?dkV6T28xa3g2N1pqKzRtKzd6QUxmU1lnUVc4bzd6ZEVLMml6UWU2MGZOYXJP?=
 =?utf-8?B?MnU5ekQxTnhhTnkxMUd1OG15S1BoZHlCRUFxWWVOZFBuRURWbjZwMENWNWox?=
 =?utf-8?B?SUJGdDV0ZHcrL3hOd3hjZG1TZFgwWVpGRnNOTk9OYVBQQXJibGFpYU9FaHhZ?=
 =?utf-8?B?ODA3eU81eForbDFnQlVhc2J0aVZBbkZYZjY0VC9LODNERUUrb0UxYnRoblk4?=
 =?utf-8?B?R3FzeG1STGtUVklRV01mNWhrWUFJaE4weU13czV2aUpRSmt2a0VHbm9HNUhB?=
 =?utf-8?B?LzdERitaQ0x6ZEw2S3p0Tlkzekg2Z1Iyb1EraXVOdGdVdkwrbjFjMzhjdUNW?=
 =?utf-8?B?bkpjaUIvY3Npcm1qRTluN01CZk1QRzM5ZXlZczNnK3hEc25zZXQ0UERDalc5?=
 =?utf-8?B?cTZGR2JQczN0TitkTEVLRy81T3dDemxtbUhaTkZqV3BuNVJaZ3IwdGpNaHFi?=
 =?utf-8?B?THJLRnc5YjRIYldFdi92VkJLSGVOMkIzbmtLZjB0WWQyUlhDUW5IRkx2U1ln?=
 =?utf-8?B?YTdLUWtWVW5BUWlYZjVmUGlCanRlckwxY21xL1k0d3pnaUlwY1BlR1hqS0s1?=
 =?utf-8?B?UDRTVlF4K2ovdXlvUnJQd2I2cVA3U0cxUUplUFpVWUVhSEpCbzJuUHBHMVdn?=
 =?utf-8?Q?AcGWjXG+3DePYZkRArr/OmQmuuQ8hvO4nKQF/mq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faa57fb-9cb2-4ec6-2ce1-08d94158b983
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:05:57.5984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfqSVT+CG+nU2h0tN1aroX/aa/J4y9oadc68p/rTuysae4/6qn43f4t2qPIf0/3U0VdNFpTd4CpQvcmNYpoLBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 01.07.2021 16:09, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


