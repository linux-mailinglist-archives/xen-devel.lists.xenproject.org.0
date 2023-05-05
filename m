Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BB6F8377
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530339.825905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv99-0005et-32; Fri, 05 May 2023 13:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530339.825905; Fri, 05 May 2023 13:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv99-0005c9-0D; Fri, 05 May 2023 13:06:51 +0000
Received: by outflank-mailman (input) for mailman id 530339;
 Fri, 05 May 2023 13:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puv96-0005Hq-Q0
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:06:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09b0e98-eb45-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 15:06:47 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 13:06:44 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:06:44 +0000
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
X-Inumbo-ID: b09b0e98-eb45-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6/3/Ys4PDb7OFaBf3sNTgJjxjHdbKYT3NtSSDR2vY8NwtEV61POKUWOFtxyhfo9YIUFojXQ4KsmP8VV2ZEyBDPzDk0D5OQatvHtFdsZbriUZOuduJ80LHU49kdA9ucEX4mQ94B0I3K582wBv/vm2cP08FBAeU6KhnPdscbJp7GnaAtu/Bc6qobY2wOnUJa1k1mKLsbOCCUmYv7hUBnS195oOCtFHugEhQZqUKr7lWwhSa6jpcAC8vB0hovXM0j2TVj1cNYc9he0gwnKk3Gl7GVmKEk0CksDA23qmC6HfoD6d+wumRNjdNeq/TbIf/kddm5Ne4pCoj6PhKf2vmY0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fi21jemoaQ/IahEePuXb4ql0t8nqpe0QrayBGOWBbM=;
 b=W2x3oeYCdAPHPsUfTD99rn2WKjzKRn7c0jm1z6Y4T1yrp5kO9c6Je898YsgWF6ej6bT51VHecaEqk3l9cnwakUlUAfKhuzC5XAIiUOM2/+6Q6kFtYrYeiw8W1YfyYzVcov56B2N4lQ0L9xk+QA6SrDZSZ24FY/FLq0otGI2/Pa7I/+QS/Mz/Mz5Kq4ZR/Fdud0+0oVPuwS+D4ql7DdwR47CrtISQX1197C4u9B6dsWK7Ov8VZUZA0HC/r8S/9/BHlmzfGFDF4BKlscR7suCXw2v9Tdi3P3x3sUbJ+dJRUuIJMWtIyfi8L1iCXZWpYYG0JnEwDHnTDX8DdPb18VgH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fi21jemoaQ/IahEePuXb4ql0t8nqpe0QrayBGOWBbM=;
 b=OYcQ+WXnHA0rYlh5HW02H8d/0dFnQRFbg9AeXmd3wyoUxepUbpM6L78XdJh97AJhoZ2jUDZKJShjRg1r74le/gWX5N+V9iwE52VoiI2xvI1pFIoC+gPKvldnc6MIvW2txpYcEDxQahfZPgcoWWFAYf2yAorhR2mjYXC4+pxc8WUgAChnTrdBxQSMsQqR5FHzrAI1IdUieHFied16YGMzYIgiUILiSRFS8JJVgLOMvcUIqqARzLhCywJ6K2FXJywcfwtxG6jsH5ZmSMp6qQwUTVor2k8Ek3O8mrTogQAiKvJ2ziZfOVR7q7yRFWMep4FbBUmEog+WplsNKBx6SgrgRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8ec85b6-90bb-1df0-4f6b-d7e9c6ade25f@suse.com>
Date: Fri, 5 May 2023 15:06:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] LICENSES: Improve the legibility of these files
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505130533.3580545-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: cf45689d-f97e-4be8-bbb0-08db4d699383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bnyk6Wx3DJFMeLKeR/igUv4DCbFygvGeyk5QNqYrJ9WvNpBMPWBr9w3P1qqCLXJN9gJ/T2p2QuUSygI5j6qzGsE7gDZ6ryvMT1AkiQIs3M5xMd5j1gO9eAc9ylwL+NHMAGerp03RZQbccMNj2bdDyBpPTxWX984NXs4vBIYQ/HYcnhU3/yBdSK11WVovjLcpQKLtl76i8UmOm6kp7np09ner6l5litb04EvuwEpMrwN2Jt7gjC5ul07jPyNIsE9q5gBHEuJbiuVYziqWGY2R88TO4RNBUTYc5A2INoVeNUfq2B//6U1Sw62ouEnfod+bxpOaVO+oZvQyEGupadY1yQn7CpFAASe73X0B3dPp7tZHjMvtIIQ4JGHiwHeVZRgZtnO/uYfex4FsRuJQfB28z3aDOVL1frzFihn9crcXbw4muq2JuoOK5gwCPbwobZYHFEtyjrF/o80+FgPGHcFngR8D8sqlSzTW6TytjfKDZ8J3GOBpIuRoykzbHLGWTvg5azIDTi2WS86c3aoFOkKO6/qbkxc0sq+ZYFnhWwY88+BXabxu5w5kOqmDqq+AhCB5pp3i07ItTZ5Naah+v4foyOAZt1oHlQ2FH9CmXCh09DlbVlq392uXOklVGbu6ReLPI2wZqtPtn65pyo/3oXUVXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(6486002)(478600001)(54906003)(2616005)(53546011)(186003)(6512007)(6506007)(26005)(8676002)(2906002)(38100700002)(5660300002)(36756003)(558084003)(4326008)(8936002)(66556008)(66476007)(6916009)(41300700001)(66946007)(31696002)(86362001)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWpkWjJXc3U2aXplUFpvdExYYWlnakdPNFBNWFlKaytnVkFzMlN5bVNQQ1J3?=
 =?utf-8?B?dnhXTEUwY01vRmRjc2x3VVFpRURFTWhsbnhJSHp4TlMyZGZuM0tzQ28yK29I?=
 =?utf-8?B?b3QrUkZ0UUo3dkV5a1c1Q0xweVNGSy9vUWRMTVMvZmVKTUE4RWI1Nzl5alNw?=
 =?utf-8?B?b08rREprdWVYaGVVTjdOYTRYYzBRS2hsNllWbnA4NUtzZFNZT3E3b3RJZ01J?=
 =?utf-8?B?NWFzam9ENWdxVjFOVFNiK043TDdqLzZvclJoYXY2UTRPYUVMeVI0SnptRFRZ?=
 =?utf-8?B?VkhzMVAyaWFza0lmNTRTZUJuVkxhU2ttZ1JWZnhHUFpzMGp4MDVkTkZxMW8r?=
 =?utf-8?B?M0FPdVY4eU9EbnNhaHVTWHVqaXZXTExHbXo0dWlKZjh1RVl3cFRrbVI2UkhK?=
 =?utf-8?B?a0VRQVc2aUw3KzBxUGRiTTRWSlhyM3JFTy9OaE9lUC9QYmpqZEpudXRTL25W?=
 =?utf-8?B?SHk2QjErZlpxaFlzays2RE02bXhYL05GMFV3azVJZnM4cjVOSWJiT1Rnenh1?=
 =?utf-8?B?N0ZFbkRYUXdQZ1FlcTl5bzlabWVZRFRYekZONzAxVFFHYU1XaEJPbk1PY0Z4?=
 =?utf-8?B?b2RQVFBaZU1HSGx5QWF1Syt4ZER0ZVlKdEJOdDRENW1qNHhnTjdmOUVwSlZQ?=
 =?utf-8?B?Rml4TGdtcDdXc1E1QWFIRjNhUHZQTSs2V2xWeVZNOUF2Zy95RDlDNjZBZkVH?=
 =?utf-8?B?SXAwS2UzRnZPM29vSVhQVEJIVUtwaXZtajZJaWJsTnFGSXVvTzBacnRGR0Zr?=
 =?utf-8?B?ZmZQejFiYUQ2by80b1JpNDJvYmtDbW4yMkdvOG0rVU5zV3FuZ0FPMkpNeGRU?=
 =?utf-8?B?cXdsWWtJVnhsbm9pWGVCTzNkNzBoZnVrZDkySlA2MUY2dlRXam1xZ0RvWVRJ?=
 =?utf-8?B?eThyQzYzVnRqTWd4MkZIM2Jxc0NhZ3BsUzBNcktmdHdpdlZjRDNKcHdEcWJZ?=
 =?utf-8?B?YzVqeStDbTRGNDlhNnFvZ25qWDFoMy9nYWRrMWRyUjdGUXk5QTY0bTYzbms4?=
 =?utf-8?B?dndxcU0rbUdnVUFDQmlYb2tId2h1SWY5eEVIWXViTi9wTC92VUczamVVRlQ2?=
 =?utf-8?B?cDFjRWpoMUtBQ0NRelNOSjF0aWlwejAvdUNwalU4dVhrVDFYZFllR2grWE00?=
 =?utf-8?B?SjhHYnBORHBFZUZIYVJmTTdzajFYQm9BMExxNDNMOVEzODBsNGdKanpwVFJ1?=
 =?utf-8?B?Q0ROb2hEZ1ZoL3NPTnVPUTF4U3hIUWhjNHBvU0cvSENCdDlSZTBrdHVBSWpj?=
 =?utf-8?B?MkFFTDNzUVBaV0E2dVlXcUxrNVUvRUQvODNKaWEzUHh2b1pOUzFlZlFpYnd5?=
 =?utf-8?B?dDduMFJqcFhTWEl4MWFKRGp6cFR0a2JoU0l6STVjRSs5elZUVHNCRzBTTzNk?=
 =?utf-8?B?SUhqNzF0MmVJSXUzQWprRk1RaFIxeG9tcnMyRlNsYnFZbG9DbjFnanZaRzI4?=
 =?utf-8?B?RVFhbU9ROWxkM0ljcXBvYTBqZHdMTXBDSHBMb3ZIUnlUYTBlWHZHRzIwcE50?=
 =?utf-8?B?TnNPcTNxVUY2MldBWjdEU3dCb2JjQU5HTUtHMmdTSWN1YWpPZzNmdzVZVUpV?=
 =?utf-8?B?RjY1NjZHSEUwMnpqQTNYa2hrZ2gwKzd6YVNzM3hYK0M0VmpYR05SbFRNMmRj?=
 =?utf-8?B?cXBXVGZvRU9zV2daQVNNSHVKMGVLcW9wM2RaN2lVUGJBaEY4bjVFdk1uR0dP?=
 =?utf-8?B?QXRxRlhLQTR0Ni9taEZQVVpIRlFSYTNoWUpJcndSV0R3YTBYSnVpRFVwR1FQ?=
 =?utf-8?B?bDZpTEZid1FFRVBYc2RTZnFIK0pwZDNZVnI0azdKNUQ1c2wxZENZQURQdWsz?=
 =?utf-8?B?SWtoOVVCWURIYkQyQXBBb1QzeXRFeSswVjNwVXZ4QXFCbGtwaDRXblhqc2Vh?=
 =?utf-8?B?eU5ubEVsZWNFM3JOM0lZNjhDQmNYNWtQYXVGZkRrKzdVNXIxN21wbldWTFlw?=
 =?utf-8?B?UXR2VEhXQUlCaHZJUmFWUlg2bE5HakkxQjhHdVlwNHYyUmhsaENIc2NvaExU?=
 =?utf-8?B?SFFJYXFMU3RHUlI0bDVhMkx3UG1SajlxMCtnd1RQa2hRcHBqdHFKUit0eGFI?=
 =?utf-8?B?R1FXZXZOZEE5NWo2QXFjZWwrbkR1L1dKRmh3clZROThLcVpXOUMwdGNtTk43?=
 =?utf-8?Q?mCF0cKcPZOgjRz7XzFWK4pJLw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf45689d-f97e-4be8-bbb0-08db4d699383
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:06:44.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szisnl/g/ITnM56g37H6Qb7/IMSpOuJPQFH9HR7bkLUv9yXoF7sNIGpNt/+47EFvLwvCUF8FKum+8zt8yol1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337

On 05.05.2023 15:05, Andrew Cooper wrote:
> A few newlines go a very long way
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



