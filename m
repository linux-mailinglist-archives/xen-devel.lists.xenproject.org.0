Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E775B55C4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405503.647937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeXc-0001oY-DX; Mon, 12 Sep 2022 08:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405503.647937; Mon, 12 Sep 2022 08:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeXc-0001mc-Ag; Mon, 12 Sep 2022 08:11:40 +0000
Received: by outflank-mailman (input) for mailman id 405503;
 Mon, 12 Sep 2022 08:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXeXa-0001m3-Vq
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:11:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82103183-3272-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 10:11:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8325.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 08:11:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:11:35 +0000
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
X-Inumbo-ID: 82103183-3272-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM63gipaD2auCeehwYlzfC4VrE5B7SC3J7i20sPM1S8HkzGYhrBhYnE+INKgP0Ma8tI5gAhKubwjpQCEZzPo9RHZPGPnAzk67VL62MvfjY1/jtwtUqReMMaOSwqVLUOG48Jao8qSU0RN52r0OJeGz5HgqSUwg46wOAcBuHgbNLxcHzPOtmQmT7mjeqDZY+4tVTeYeQMRB0c31r+orh56gEeozCzKqEp8a32aVlSsgc3ioRjYHVmxmL/o19JLmb0dZWBCmTG+c2i5IIy4i+bZeJu82Aqhz0FQ6YSuqDDzso+ZwgbN9LqBvn9itXf6bqk31y3n6AT+fuU6hggMpvwbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emMbKCssggZ0MZ0oNAde9DnrhL345ZbHg7vU6va+QGI=;
 b=kxF+SdQR6wgMgOgwf25frhuac0eOYatWnm/hxyAbh5DgPfsYZ8an7o0NrJRX2/ql/CjE2R0dAASVGzIyYj+5tXeJ9znY+YgPQM3/h5MuoCVmAuIgjuNMElb7M9LogxpK8CVdbyxDfc99fqTOg+vZptD8Gg1Yi1pnp7pqeb2T0oWi6WcshAFRqPmTpcefzRZOXBdyKEDeaB9oIz0O2IFJZQpwI3hZB5AhhnIKcqBzRYkhSWtahqDV7XoXFwVETBNpgm8twGR3VVjq/y9kToJl5fDYPku3KeZwfuZNcagHLwV5zZKbczAQEoLiwInvX3KyclWVuwFoNEtHLShyd0mJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emMbKCssggZ0MZ0oNAde9DnrhL345ZbHg7vU6va+QGI=;
 b=rQicN7Je3I3jywOJS+OsRX6sIwgcGC9VfFQ50loCeM++8fwiuQDAH/a8EYgAO55Xr0QhgZWJGOCRA+lltnrAhBpN6wcSLpeu6HF6QrvhQY1o0rAxzpS219hdaufJ9fmpApw4KBE7+BiMZhe2ThTCKqeNXSVfGnNswVT24yLGQZdYei3ZkKnS83w93gvuizPQJL8ydG7Sl6H+ladm5dG9itzypqizqyOQiLs2Owzdrs5CFwcDJhJjq6ICQgMktXnVeB3QL+uVegmUK4eLy3PcsO1A5ZTFy3eZyzhdk8uhM2ufz4PSxJZ+9x1gaWvDUTA4kS4B/0WxREh2UKldtJXBeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2241c6e3-74fd-55f3-6de3-93f3733baf2c@suse.com>
Date: Mon, 12 Sep 2022 10:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] xen/gnttab: reduce size of struct active_grant_entry
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220912055356.24064-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0c8710-5fd7-47a0-e8c9-08da9496691a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x0Kwa5fiS7T3O9SoIXnazwbwKhel0OuzOTZxWrNnfudUWbxGsG2MQ2+JD1U0liEKU0+g7z6SINt+FD2SsYiui3Ls5wO0S24kwYHVRePuT6L3ILmIX/LuH3JDeZ8BxQ9pgMC22GcrU5CMEjkmm+msPkez61lqK4ZOD72cSAIfZUsvL8WHZeBCxbt/OJPfEDf4HYfmO0UexRsujwdFTLn/3vwO9EBOaMI5BdLNxtubPsSaBX/FRlnjcdGSdSFApzOXXTp02XzIUeh2JFgqBjeo6O6/lVyD2SwSQk604e8CGBdF0+tgeQxCbfiJLlbjsj5X3oPQuUwQl8YBvtyQopk07VnoAwiBGMJzPJxIYCQd+cwvYzAHgrgGA6Rqfa/EbFbSlNwDUYcwtnhfdWPGLRapQby9KahNR1TWHzAg9l4QvE0TeGej2iatMCG3sn6kh5Jn1VNmTdjORnHJ1ef+J/CWNwiMAb3zvKPcO8BhVa7/omLgK6rJUS0TuRcbV9ife4WsezzpkzzKnIRrqp4YxxdGD3BsVhMMXoCm6EwdHw8KNIjbFIx+x5opDeo+pgOHm+tiIUtqkLT7DeE9JF2UQksU0XNgqf8jB/Fdyb/kOphAlHERsi0iyQp/g0haVXYazFc6HWK41WBYNDJGMQ34uyCHGk6jw5rIutJIgW8KTt71k7dhBNqpErrDKYjqJxL7p4zGQDSX65gWgwYaSD9KS4w0XWANCwesWLbftlocY7pqAtTK5czTIV25sIiQg3lhQbR1XdgXbHTy9nKuD1zdHYtGrHnbvJ+sCc7K25PODfSyVNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(346002)(376002)(2616005)(186003)(83380400001)(38100700002)(8936002)(36756003)(31686004)(316002)(6636002)(66476007)(66556008)(6862004)(2906002)(5660300002)(54906003)(4326008)(8676002)(37006003)(66946007)(26005)(86362001)(6486002)(6506007)(53546011)(478600001)(6512007)(31696002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnEvVUR2dHEwTmpCaFU0V0ZKczJpRDVFOU1SekxjZ1ZDZk0vRDgyaU1hMDRJ?=
 =?utf-8?B?ZFJmdXpPTXBBYUJaSC9pamNFdXpTcXZ2SE9CdnBPNUJMSmEvTjhZNUlXVmhj?=
 =?utf-8?B?VTVvdFVscGRtdzJFbG10eDVSY09XbUhjSFdWUVdscGhNYXkyUjVacWsxWjc1?=
 =?utf-8?B?M0xWOTExbDFpeWQ0N3M2MHhESFZZNzcrcFNQVTFHVHMzeHRjdUNYQ0NWZHBr?=
 =?utf-8?B?RHVDU0t4ZkZvRGxjMmhHdnpKTVBxQ1E4RDFlenJSbW9GcWpCczlWQXZuUjFk?=
 =?utf-8?B?UW54ajJNM3dVUUFiRWRzYzA2OTYxdTZFUDVvamVkQmVPSVBJRWVVdmtlVEo3?=
 =?utf-8?B?cU9wTFBTSVJscFVOS1BZa25KZlFqZjVNTjJMNDNRSUtGUDBUOEl0Zk1KNGU0?=
 =?utf-8?B?dExKRFEzeForR1M2ejROQU9sSFNGa1NxSGk1dXhpODFOTE9mUTM1STk3WUFX?=
 =?utf-8?B?NGsyR3lMY0lBRkk0SkoxQWg1YnpqNmpKOXRSQ0V5c2ZGOXhIVFZyR0ZJR0hF?=
 =?utf-8?B?ZGpVbmN1cDBqdVRVaFNycUJTSHVMc2x5cXlhc2dkS0dHR011OFZYSHlwZ0U0?=
 =?utf-8?B?WTk2UHhOY0dGY1hoMnU5dmM4RXpta0lsbGZIWTlSUjBnT2RERGI2WUh5aEdk?=
 =?utf-8?B?VVFJLytWcWx2M1JCUE95TE1jR1NOWUVlQmMrWEtSMWUyUTg4WEhoVW9CTVJx?=
 =?utf-8?B?Nll2bHkweHJOTDkxdjB0RHNXb1c3Q2FXSjZYYUJWOUw1SUJ3THlQZDRBZHEv?=
 =?utf-8?B?M3lvVG1laXRmcU5pMzdyMUdWbkErbURDWmZyczZ3UFpxd2VWSVhETGhCbFU5?=
 =?utf-8?B?SFdnMU9YeE43cVJ2akpiNUhCZVE5NkNaNnhvTnZmWGcxMTgwSWZLc2xza3hr?=
 =?utf-8?B?elN1d1BPTW0vZ2ltWlhjcTBWRU9SWHBYMTFRc1E4Z1pDek55c1gwTlFmRlpW?=
 =?utf-8?B?UzhOTnpLd29iNHFidVl3RExHQzFFeEd6WU9naytNQUE1MjVnZTRiM09jTU9v?=
 =?utf-8?B?OUpEN2pVTzUwbnZSYXg0ZkpqbHpFSU5IQ3Nzd3FaUm5xUFltUjM4bUNsQ0Zw?=
 =?utf-8?B?SzhWL1ZCR1JrRzQ2Rno2QUVQUXNsdjViZHRRRUw2V2Ztd291U0dJOFlCc3lT?=
 =?utf-8?B?OFFOakM5L1NGTWtqNERsYmR6WmdhaldQWmVwVWxXRitycWZxU1NkdVdxNlRu?=
 =?utf-8?B?TWxud0I3bEd6VFN2dUFVbmxyVWtOa0pJODRIcUFJL2pKU2FCa2E0Vld2dW1k?=
 =?utf-8?B?VW5ZcVFybUdPNUl5Y1VsNWgxOUZaZHdhR1RZNnVhMEw0ZzhtOHFHMnliSGhq?=
 =?utf-8?B?TmxDVmNzZlkrT2JKRHNKVTZlQWxKMFFBUmkyK1lWUGxsKzUvTGhZNjZQNmZu?=
 =?utf-8?B?bU5wOWd6cytNQytKVklJblErYmVjS3ZZR1BGc3Y3Q0dyTUNsbWx0b3BOS0tE?=
 =?utf-8?B?REh2eXhhSVRuaVJBWHpMVmdIUytTZG9OQ0lSSTFCOEZuYmxib3FiNkJXSnVR?=
 =?utf-8?B?VldmV2dORGtEK2lUV3RWWk5XL1A3YmQ2dEdwV3BYMVJaNzdkbDRrbCsyckU5?=
 =?utf-8?B?NnZZMjFCSHVTREpJVlluN003eDYvelFSL0FJeksxSUpkSG02QmM0SFQxVGl1?=
 =?utf-8?B?MUNHNGc1NExMdXBCZmVYSnRWbjJCWnhyR0ZZR29RR1ZWdmQwVjViUXppdXFY?=
 =?utf-8?B?M0dDbzhNT084TFA5YXZNc3RDa3h1b0cvMmpSeXJ4aGwxbHM1MFpDUFo3WS9K?=
 =?utf-8?B?Nlc3V1FGWVpGSzhvc294RXVodmpLYVh5S1RUeGh2TmZLSm9MSmxmKzVjT2t2?=
 =?utf-8?B?eHhSaWdWZkpuNGRyUUk2YitxdVBGK2dFQ0lad1BCMXZzSVl1U2RqUEFRMXdD?=
 =?utf-8?B?cE1SSEw4WXJ1dkpMNnpmWTBGdmlDTlNlYmh0aUtUL3NNbm9YYkI5RHFTRi9a?=
 =?utf-8?B?WFRVc2tVUEh6VUZ2dzZBSDc3b3RzRDQ0SjdYSTl6c0FJUEhaSlhRZ2dWcGpS?=
 =?utf-8?B?R1JLbzlCZlVyMFpoYmVZSG9ldnREU2k0dTJPc1FjVFNvUWR3VzFyNkdUUWp3?=
 =?utf-8?B?R2xRMTR1WHNVUmttRmN1anlXZXRWRWRtY1lTNmpCSksrNW1tUVliS1ZYNEg0?=
 =?utf-8?Q?SUaQS3hqjfcpoNA4YkuNAY5uP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0c8710-5fd7-47a0-e8c9-08da9496691a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:11:35.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMOrqMN5Hs3sbKsQQp643vLc43meqiOb/GZ0qUyAueji+dsU0aIiamcI/SNNJbe5CF1xLLR52W7PdgSv8QNvhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8325

On 12.09.2022 07:53, Juergen Gross wrote:
> The size of struct active_grant_entry for 64-bit builds is 40 or 48
> bytes today (with or without NDEBUG).

... and leaving aside DEBUG_LOCKS / DEBUG_LOCK_PROFILE.

> It can easily be reduced by 8 bytes by replacing the trans_domain
> pointer with the domid of the related domain. trans_domain is only ever
> used for transitive grants, which last known user has been the old
> Xenolinux branch of the Linux kernel.

That tree used grant transfers, but I'm unaware of (actual) uses of
transitive grants; there may have been code there to allow their
use, but iirc that would then not have had any users. Or am I
mis-remembering?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -381,13 +381,13 @@ struct active_grant_entry {
>  })
>  
>      domid_t       domid;  /* Domain being granted access.             */
> +    domid_t       trans_domid; /* Domain granting access.             */

I'm afraid I consider the comment misleading and not in line with
field name. For normal grants this is merely the "source" domain
(i.e. "granting" in the comment is correct, but "trans" in the
name isn't), while for transitive grants there are two domains
granting access. Therefore may I suggest to use src_domid or
orig_domid, or otherwise omit the comment (just like there was
none originally)?

Jan

