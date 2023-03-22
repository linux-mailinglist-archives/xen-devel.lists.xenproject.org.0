Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACC6C4D38
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 15:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513482.794541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezDp-0007fo-1U; Wed, 22 Mar 2023 14:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513482.794541; Wed, 22 Mar 2023 14:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezDo-0007d0-Ui; Wed, 22 Mar 2023 14:13:48 +0000
Received: by outflank-mailman (input) for mailman id 513482;
 Wed, 22 Mar 2023 14:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pezDn-0007cu-EK
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:13:47 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1956cf9-c8bb-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 15:13:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8215.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:13:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:13:43 +0000
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
X-Inumbo-ID: c1956cf9-c8bb-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mulVxBlkFjxCtByDrfD3jC8MjbJGn+ev1iOurJh8S15yNfycMvEe0YwF5kEEfsQ1ipbuMlo8SUEQ/hmj6P63tfdAHcjdWo+tqdWBhDDCRU1olAuN4c4SlgzCqWbOEg35SuWgLGZgzwztSv2xWw4IKvzr0QkyMrVbwsSPHNy8sARMNcEQrwRk+sLXEwdmmk1jl75mH85wuA2hks94q1g1b5tJe+7vYT4tH87Li0ZKR4MY6JQ3WBWpb8nqv4pP2jKumhv0RahvxJddybdeLrLhEjsFlleQx7ZqjQHjTwugDcEPIi+Fvq24Rs7m2xMQ+KVW2BMn6ok8ZeSHd4VLuQm3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tk5dJmoYspXo1dpTSv3sSNfP/AX01SlK860/F1mFoNg=;
 b=UCMIjoma5Bah/OWU7V9h2Ru862Pd7zGNqca6sQoSeOc+AIHlxaOSQAWv0WoRIDq/LDWPM8wdhNgRzBFdFKDy5Y9tp4NthZCq0mh1wT1vfSKfcA8ErErNhyjC52b0bBc7f9I9v3VA64FttIU06LHFfXF+EQ+xnqOBWZkG91WcokJ9pRHdIC/3IMa/P6T7JfuNbSY51ocXTLzCXZIq/tfwAtsnUSBdKjMXshED6alsnkgdh9/4j/uRuVVQ4qBveZAjCJy0c5QWNJEnspV2Yvk/RT1iMWcXwOEiHMq3sCVFqDhPg42m+BQ/weGT7SFbZls+I0yKTEkVuVPgw7CeCt6KfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk5dJmoYspXo1dpTSv3sSNfP/AX01SlK860/F1mFoNg=;
 b=5dBGgv5BsGyKE8K60/8waD19UMbtqnvILtj8rGsMLFhokWDlrsMQSvy9i+8r3lMJ8JFYre9YtyYYlKIemRelF0eTvElZ+E7rjNM4NSs+x7NPntOt/7G9nn6qicPdXxjOWhcCZ2u9y0RwUbFic9AbrJhBc9W2BKtRkE0K9ySsCgny825v0ezGKT6JgaolJH2BxI0cBr6A7xBRrD6AffBDBlAuKZRMKRlpWPJTQqspy5fITypE7eVQO1uTYnFNZZp/6uWjj1wLXSYk7wiNM80hzUrZb7Ttxn8/8XJiNCoku/I3UYgLQmGpWpLgRy5totZuWYqXe/j+6XnVrVKu33JvaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a07f94d8-85cd-a73f-704c-761a04ec3b3b@suse.com>
Date: Wed, 22 Mar 2023 15:13:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v2] build: detect compiler change to rerun kconfig
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230320152836.43205-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230320152836.43205-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 282e6f99-5760-4776-5f46-08db2adfa4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L3PMDCFneJxmI7pjtvEfVwNva52xbUxd+QsTV0/lt0PTZY4TLEgtRsMqSGrWSauaI8mh+y5ze6WS33EOiuYk0eTvOcvk9GZbioTcC/IpjNt8UahM1IUNE+ROQ/f2wL8mqqVyzPBqRMagSzqcjOJgGo0+ALBaHjDrmXo/vawMOL/UV4GYWqwmUyUrMj46jqpX9cDEU09yaVATDkgUOmQDSCDK39BnimDvV3JdeUx48rRJXQ28Hj9DPYV7MSyGh1nHrdCeEN2jZE7jISrHSvmXHIQBuo1eMDgzh4MKNU8casxU2UzWWjwHkKGDztWjyL/z/rzr1zEZU/PijQiT48nSe9ekGVkUbgl1aRetQCTd+K6ZJrJ1LYMef5SKA5R8NXoHj9ehl9cLWLuW00/PKn8wBFJRhXE3H8N5+LdYHJmMFdfJLwtU2yQJv2wowMjrs1fb863RUFEIhfubuxRxPdMAnhJMa1hsEfpu7UMw4Qo1Q0Y8gs4J6ej66e3tXMCbR4YsE/f48PxyHMr20/mfHgT3Nkj/7BeqNXNgsiPfu+bT5l/LfZ7O2iX1frq+CSnlar3V5YC/jubZZJT6SBTNxQ70pGt9+jLu0UV8K+X/HmNDtrOWBxu+ue8hIKNC1V1ny0rq4qjC/chbByefVsXuDQcxCV2J487qECdXXPmW7DZHDPg9iNg0/vWd4MEuyd5SE2D4W+oHKaAAiVPk2y2ANpLgxmRjxqjI3PzUL6YsfBLtUKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199018)(31686004)(66476007)(316002)(54906003)(41300700001)(66946007)(66556008)(4326008)(8676002)(8936002)(36756003)(478600001)(6916009)(31696002)(86362001)(6512007)(186003)(53546011)(6486002)(2616005)(26005)(6506007)(5660300002)(2906002)(83380400001)(966005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXo2UVlrNWxGYnd3bVlGNGxyZmpXcWMvN2d3ZHZvOGFoSDEyMDY4YVJ1WTJH?=
 =?utf-8?B?SnhWemdyY0xpa0JiWWhsR0c0UldqeXI2Z1AvL0syMmJjTzJLUlFlaDIrS2pM?=
 =?utf-8?B?MGEyZm42SmtBWStCRG05aHYwUjFxZmdtaEd4eXlaY1ZVczNZYThQaDFPMElZ?=
 =?utf-8?B?RlF6eWdERnc3SWdEMHlvZjFmdUluMGFGYmhydjNiVlE1Z3BkSWtmam1TbEFY?=
 =?utf-8?B?czhzMUNFVFRPUXBURXR5by9DUE9KeURKdDBzRUpOQzZTT3hSL2FYU1I4T1Bu?=
 =?utf-8?B?aHZDcGdrbWtQL3lmampGYjZOelRISU1QcWlvaDZZZUZzOXl4dVZRTW8xWkpN?=
 =?utf-8?B?b2xqYWd4UjI1eSsycnpkY25IalVjQ21XTUxQN1lSRXNFVzl4UldmRFA5YXY5?=
 =?utf-8?B?OGNiV2h2YmVLcTlHQkpadzFsU0hoZHJlbWZvSlhJUFQ5U1pzOWFWa2JFaUpW?=
 =?utf-8?B?bmd4M2NpZXd5ckZ1bGhKakh1bDVnVk5ZWG93OXREQ3BtQ3l6Z2J6dXBFZExk?=
 =?utf-8?B?S1NyVi9oaFpKOXZUL0ZOUDBxUDFEYnBOWVVXR3FHa0tFRVF4QmovcW51alR5?=
 =?utf-8?B?US9xeW1FU05md0lCbnlxOUhRWDBOMWtYU2Q3dUpucVBVajdzdmJ3YzlWb0ZD?=
 =?utf-8?B?UFFjREViZ2tWNm4wR2FJQTRBZmZYUEpZTjZGeGY1RkVBd3l1SU9DR3dhaE1m?=
 =?utf-8?B?UklPZklNaGxJU3FzZlJUZk43SFJISVRxOFB5QmpWUGRzYllSbUZ5d2JpVmtO?=
 =?utf-8?B?MDlWRmpvSElibXpCeFRQRWJUckcwekVXUWoyZElWb2lSQ0t4TWx0ZkN5eW04?=
 =?utf-8?B?V0U5Wko4cFh1eVNVYktFd0lNSlFMWFQ2dGYyMGpoU0lIcGUvNElDeVNyTm1l?=
 =?utf-8?B?VnFGS2s5MzBkL29HMFRWNWVhRVRMVkpqME5uMDdKRGk1Ty95L2liNjVET0Z1?=
 =?utf-8?B?VENtS3lRYjlMVlJ6Yy9wSnVCd1YwMjFKajAwL21ZblpVYThUbmZXcWM2dllH?=
 =?utf-8?B?dXRlRDVvNEQwVUVRK29wVzhpekVxOTU4RnI0RGVsdEErNVVuV09BWUhiY0dz?=
 =?utf-8?B?VmtCbE82WnBmd09JeWhEZnZFT1J5eE1HZmd5NlpoM1ROWG9DZ2w4cHE3dXgy?=
 =?utf-8?B?RERrU3BvaVZ0bTNwREI0a0lieUdUOWxWMWtybFhLL0REdkpBNU8xQ3NnS3Qw?=
 =?utf-8?B?ZjRPSHUvSGhvcjJ4TWJYdFYzNEx0a3dqWGtybWlIQmZiRVNxeHRhdGVPQW5G?=
 =?utf-8?B?eVZVSHJNOThmOGV3VjJGZWNiVkQyRHJoYXg1cG5ETjMyaFBsa1NueDN2OUh3?=
 =?utf-8?B?V2dBTER5QVNuRnVzS2tqQWtZNDZyWm5tSzZ1NDZ5S0tJZXdsOW9yZmRzRE9F?=
 =?utf-8?B?ajRLTmFQQ2dDa09YQjYwYnBrZlNJc3dlcitDMXVhR1JoMjd2VllUNk5UcmE2?=
 =?utf-8?B?b3hqV3l0Qm51NER3S3lzeHdrUjl0NXR5SGpySGVYQTI3aVFrbzRWN3FoUTZo?=
 =?utf-8?B?LzNyeEJTbitITEQ5cjVKK0YxQ2tELzZLRG9qOXZuVXpIcVhiRytxWHJqMjV4?=
 =?utf-8?B?SHF5UlV1VVNqcVMzeEVuSlBwclF3dGRnYWhsSG1kcm5seEtIVGZ5OUIvaXdv?=
 =?utf-8?B?UURpbGJLdWFYWkZucEx4ZkY2Y2hkSDljalNiYm5RcFFUQXFpZGVvV0RpT05u?=
 =?utf-8?B?bm9WTmlCbzhxYlE4eU9seUhBRlN6WmI3dGg4TmYwY0dBcHpCRkJ3azRGdngy?=
 =?utf-8?B?VXhORU4vQk5IU1pJUTJETUs3Q0wvMWJyTlJCU0dhL0tKZUdsVmVQNGkvbFZa?=
 =?utf-8?B?T0FxbmFKbTRZK3laWmphM2xhNWxaZXdvVFRGakZoc3M2WnZzOFlSNkFJN0tn?=
 =?utf-8?B?dURrb1JhMkJRYUI0K0J3Y0dKUmRNeG82K0tMNkxLL3h6MHNPaTFqNXRTTTZl?=
 =?utf-8?B?WEN1MmhDb2QwRmpCQTlkQjUyajVyUDBtckpqMnFQUWVMUzlGTHJQcmtCL29y?=
 =?utf-8?B?d2JnVUN5alJrYkhEQk40dURLM0lQc2crNlh2SDVubHRGV1ppSG9FTjUxV2J0?=
 =?utf-8?B?QXhwUkFDQlVtTW1PUWZ4RzJzcnJ3V1pvUkd4c284Z09RcXNQcEpTYmVodThO?=
 =?utf-8?Q?WqN6tutdKXrSnfcw5iDBwRRBg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282e6f99-5760-4776-5f46-08db2adfa4e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:13:43.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77PIse0AJ3LTw7WIdue92GVv12PimNyLLIbaGHBBEcYbfBLZWskGZjx/GU0YQ32OkLtJrxFUVVOZp+9lpa9Vwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8215

On 20.03.2023 16:28, Anthony PERARD wrote:
> This simple comment allows to detect when $(CC) changes version.
> Kconfig will be rerun in this case. (Rerun is forced by
> include/config/auto.conf.cmd which detects changes of CC_VERSION_TEXT
> value).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Technically, it was acked by Andrew:
>     https://lore.kernel.org/xen-devel/20200326135621.687685-1-anthony.perard@citrix.com/t/#ma1171775b9938bcdffc80b2fcb8d2a883cd3e32a

And technically - comment visible under the same link - this still
isn't what we would need to address one of the arguments around not
storing tool chain capabilities in .config: The version string may
not change, but an update may still have brought a new option the
compiler understands (or a downgrade may have taken away one). In
fact this change is working against the proposed direction of not
making .config contents dependent upon tool chain properties. But
of course that proposal wasn't adopted yet, so for the time being
this still looks to be an improvement.

Jan

