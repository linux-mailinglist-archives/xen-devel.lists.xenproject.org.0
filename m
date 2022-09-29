Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17745EF5E1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413758.657628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odt7q-000792-J7; Thu, 29 Sep 2022 12:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413758.657628; Thu, 29 Sep 2022 12:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odt7q-00077F-GL; Thu, 29 Sep 2022 12:58:50 +0000
Received: by outflank-mailman (input) for mailman id 413758;
 Thu, 29 Sep 2022 12:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odt7p-000779-93
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:58:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7521031e-3ff6-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 14:58:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 12:58:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 12:58:46 +0000
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
X-Inumbo-ID: 7521031e-3ff6-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTeN9qCubmt9GBZ7j08i7yj6tabaeSqtFWVV+LTWziTw5ykX/5CODZQIa/NXdzBkNAAjjNeNLCaKGQQCd3t7DNBklpV3tmukj7Xy36eUqSu405PlqvB8tVl9rr5S5NSPzF+lEFRA8NkvVOhT/XzeN8WHcn9VA5GV38H291FNKhWZJozrFbP9qxaNaJWb7CzyCt3JyL04RooaYWl+rS3GubGm7a5Dny1rzRHmEzmiHDf+238WgCwIY+6mKi3oiUvnSqKD9vWamJmGiPZmaqsrVzAJ6zGjyLGqqmnLGoleDT9ZJKeLKVrbfILNfQ+k5TtCZnr2hbPGQ7+xOH+QIO+P2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAoIfGkUUecPBnAXkD2bFSWzkQhWxhdnL3EJzl3/6a0=;
 b=XVEyWZPeosp4SepSW+6ow3bfMjJIQp8WXkG9RklUP5vjNchFICwJ5RprtQTQNDwGnZ63TM20S8s9ShKYDfqINUbMXl5niW9wbgcOKyNertV+ZGdaoH3ANwElpoCsIB/W8EHRFd6vTLi1Du1y6vykU3UDjxcEe8KK29rhC56vkVAHa9+6itMUIxywRw3m3aArFAYHZGye4eg8Dhbbt9Bh4BDq5nD08yzh4NnLs7OuEVD5hWk4QPS/QTmQMs53LTtMEVPPu97BgS5Hneg2mYlIclSvKGOCHjqETDnsWOnzJZTDCrvh67NirfMmWrldOAvg4iexifx+vGiFVQTT7ue+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAoIfGkUUecPBnAXkD2bFSWzkQhWxhdnL3EJzl3/6a0=;
 b=K3U1h03KwqMjb2oyexhItBpT7bjrwquwpagK0l+n2dbR7YFFllTyXF+nkW1ToMjvtkjFLOMy2kOIwUiuRcF+oS0a530KjM3kacPeOGxYxWXya2+C2MDKQ7VaCYrPDtXPsEJqo34tDN8ffmkg1hT5j7Zs0rbnPhXo6r0DM7kFvrZZ+dIqNHyJIDi3cWrU9sA5rE/ZX11reJXNW8h2RD3na3Q6irNWmjscyNx71d69VOB4AEKXsyDqjU2nBjKJUmT0FN6O9Kg2UOmubNDMnyBjYyNzppaZ5COOfVbFG1bQmPnhGUPid0DSEN6ciMu6Ar913IqIEIjkou0pzqKMKzwuCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b766de0-90bb-db4c-e90d-d5c8baafae9a@suse.com>
Date: Thu, 29 Sep 2022 14:58:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
 <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
 <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d233a7-51d1-4614-a906-08daa21a581e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9MTsxJfyuwJaePTpgKQZ9xDWuXEjWpCL3EP1S+KKE9la9Nwye/KZJ1DjIGaLUgfqxmosST6PJh2jxdG+d0abhKGQZMgVHmeZBR5i9NaP270kWPQXGiNiYs9+j/KiBH+BfsxwB2lr2b5F1e6SBMluOzYmxVKIxgk91WpCnNwZa4MEZcivjFkIexrVTkk27M5zxaqxGqEn9QX8H0RZP5k0U5vFaJw6bFKpQyuja3yACywYG8MgezWYhT5lrrmkdPn8nzi0az/29AKthnawB3DTj3CdVzf3O+/Y+fQ1Pmz9of6WFYPLYIanMI2am23DoDZePq6UuQmm2Z2jOHTx0SEDOSflmrgfo8X8lLlXNHI542CVS57AlDVoN4ic5Gj3sn6fbCeBBQP2k2l1dRDdN3BcqM6f7SaVVB+xBMHgAiPROKWQt8f5sx8GWP/SaDhHMGBmGhGA5dvs4WCm+qAUkENo5Sb88mMTS0F7PCOToA15USZlahSR5cpHZMYBerbOX3l6NsWXMSnZljl0sFHGwVQJx45Vde14moxlXcXz8EC3TVeVRVsyVI88N8MbrloXw7xfIxOUp1zO9lCnJpcC07SvqJ/syleJvcpxSCa/0cnXCr0ZnZI+L78D6phwdV9bJcb6Q2AQuV4miQsORFqOMbY7IM3E0cWtez/oB21y7mYXvJ4PKP9K2UyWI+VgW1TM4fx3Rjs/Pqd8T0D6MdHmTOO5PKO4eCyoPoeDtMh1c76LwMq4KhyMgnxvdCJpm9++GB1fvgH9iXb9svnnzxg04BJ+H7abjAwsJ1FA/5Cnyy5Tn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(4326008)(37006003)(54906003)(31686004)(316002)(66556008)(86362001)(31696002)(66946007)(6486002)(66476007)(8676002)(5660300002)(8936002)(53546011)(6506007)(26005)(36756003)(83380400001)(6862004)(41300700001)(6512007)(6636002)(186003)(478600001)(2906002)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnduKzQ4ZC9ZaDdMTVVvSjNGY1lOTGo1cjZxZVJOQVZicGNFUi9uSXlDOGVJ?=
 =?utf-8?B?MVRJck1hcm1mMFFERUpHVURzenA3UTAxMFFPS3lFNzNId1loNHpmMEpPZG1r?=
 =?utf-8?B?QzJkWENlWDhoeXhZSytNbnpURE9Yc2JsaWE1emJxcFRhcUNOWk9oSG9wWVRY?=
 =?utf-8?B?RWZIZHp0bFQxTzdSUWVRQkIyN0FDSEdBNHplTEZJWHYrN0VxeEUwRjdZMmVV?=
 =?utf-8?B?VE1RUnlkSnJ2bHh1MExKb0R3cUVLbDBlcmRFVzdLSWVtNTJaTENBQkRsL1Va?=
 =?utf-8?B?eFFlYXJCZEZma2hCTjY5eGZOODAvMlpNRmFCWmZtZXJZblI4UWNCN2h5akVP?=
 =?utf-8?B?QlczamhLdzZaSGxpSitrQkNYc09uTXduNkNlallyODBTUW41R2FONkNGUktt?=
 =?utf-8?B?dnFncUU1L2xvRGJzeE9DRjVvYmM4UTRZZ0llYjZXK3Z5K1B1bVhSMXB0K3Q5?=
 =?utf-8?B?aDUyckJyQTFtSzViVElnNzJNa0V5T1h1VllLWEZrYWQ3ZGZLS2hVaFZkd1FZ?=
 =?utf-8?B?WDNvVWIzVXVQaWVUWjB1SU9VRStHbmtuUVJGU3FiSDNybHlHbG0veUlHTkw0?=
 =?utf-8?B?a0V2ZHIyK3NFQk4xR0hORVR0MzY5ajN4QUVpMWpTaGZtK1NGOFYvelFqTlJS?=
 =?utf-8?B?WWJDVnYzUG1UZ2N3R3dJVWs2eHJMdXRJRFozaXBBTmhuSGdkMktGalJiL2dS?=
 =?utf-8?B?Y1ltNnNFMTVzUldTV2hEWXVFc08vQU56d09pZXpGamdwNEdoUHRlamdkbUx5?=
 =?utf-8?B?em9kazVpUUV5Q0hPRUYyUUZCdFZtNTJDSDgyNU0yak4yVGFiTTBqTXZ2V0dj?=
 =?utf-8?B?dzdHRU5OQ0FTdXp6RTRzNGVtbUZXd1VNTTF6SUlCMkJLMHNxQUZqekJnaVFz?=
 =?utf-8?B?aXovbHpGK2drSmRJOTR6T0lxTVlEV25FL0cxb1NIcUhDa3Q0WWcvMU5zRXFT?=
 =?utf-8?B?ODc2anZrNjhQaTY0OGd5L0xRYWlDN1hjbTFiN2VRWmtLNU5lTlF6K3pjRzNl?=
 =?utf-8?B?dWNGL1E0c0dUdEV3RUhLQTY0KzJWVXp1QVVzNTErUkNEZUdWZHZKZVBuZXRH?=
 =?utf-8?B?Zks1KzJFYjFDZmxWamdRMHBJR2FZenh3cTNOUjdmMGg4V0piUWVnTDF2V2FL?=
 =?utf-8?B?ZVc4OFVkRTk2OGV6YmtjT0dYYjhRYndaeXR0SmtPbVV3bTVlVjBtbFZYTXRS?=
 =?utf-8?B?US96amxKd2l6OGhUMUJ1QUNzaVBUZXFWaDVqZmFHOE5kKzcyNWVnSjZpODM0?=
 =?utf-8?B?Nk9USEdReTJRbUhBVkFEeVVEdDdvVUhTaHBOQ3Z2TnJETGFOQWkwTlRNNzBh?=
 =?utf-8?B?U0pXWlE5akRxRHp4aXc3VU9CNGZ0YnUyVDRkYmdqQlgxdjJ3TTdOcEFNTUVY?=
 =?utf-8?B?Z2NMY3lnV0hkM1BSejk4N2NDSlpzelJpZXNnU1cxN0Yxc1U2cFRXU0MxOGVX?=
 =?utf-8?B?bVdWcUd1aWpNWFRuVDd4NFJQTWEzdTJHbXgxQnRrTmt5UmJqMmJPZWFQSEdC?=
 =?utf-8?B?R01LRzh6SHpjN2NrWVBRemZndmhSejFOaklPa0dXV0FESG15amVPdkRyN0h2?=
 =?utf-8?B?RmpMcWVIQTJjUXVZUmFnaXdpM2tEd0lXNVJ6ZHpVbEdkdWZLV3MwdU1DZ0t6?=
 =?utf-8?B?Sk1DRnNXLzNsSVBDVzBLaGVHdDlRY2hEN2JyZjJQUGVuMHc5OVZqWDAzN3lZ?=
 =?utf-8?B?NVZyemNYR0g4TjJRUlNwdnl4MVg5M1YyWTkvSDcvcUVyMVJZZVVNcVl0VjFm?=
 =?utf-8?B?TE9JVVdjWHNtdzlCSWpHYzZTVlNwY1Nmc0ZIZGFOL0djOEhFNHROZ2RoTjFs?=
 =?utf-8?B?ZndJMEVxc2pMKzVtRVM0L0dDVFF1ZS9HNkw3MFVtY2o1MWdoOHdaOFlFZVMx?=
 =?utf-8?B?d241amxGR3ZyU0xzWW40NmtPaDd0azBZVVNSeGtGV3Y0dWl1a0JrV2lUelJV?=
 =?utf-8?B?QnRnbGVld094NnhaMHZabWJESndiUy9Walo3REVLRllyNkNVU0o0TmpkWjdi?=
 =?utf-8?B?cjloaGVYUmlnbGpKZE5rYmNyZFBRYmR4djc4YW82RnRTRjdWNHdNOGVtWGMy?=
 =?utf-8?B?TXJvaC9iSERXMTA0amdKNmJSaDJ0UUhBSEx2WGpsaHp6UGNmMzFseXR1MDBZ?=
 =?utf-8?Q?1uhGcotSZpVGPqA8PjNXWpfEA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d233a7-51d1-4614-a906-08daa21a581e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:58:45.9006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obU8JaqDsiSeMuuwI7KNpdc0heSlT5R/LHHqBXbE7Crexog7zhuVonl7n7Gxdb6TW+HU7BI1z4QJztXKXuTWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407

On 29.09.2022 14:26, Juergen Gross wrote:
> On 29.09.22 13:32, Jan Beulich wrote:
>> Finally - in how far are we concerned of PV guests using linear
>> addresses for hypercall buffers? I ask because I don't think the model
>> lends itself to use also for the PV guest interfaces.
> 
> Good question.
> 
> As long as we support PV guests we can't drop support for linear addresses
> IMO. So the question is whether we are fine with PV guests not using the
> pre-registered buffers, or if we want to introduce an interface for PV
> guests using GFNs instead of MFNs.

GFN == MFN for PV, and using PFN space (being entirely controlled by the
guest) doesn't look attractive either. Plus any form of translation we'd
need to do for PV would involve getting and putting page references (for
writes also type references), along the lines of what is already
happening for HVM. Since "put" may involve freeing a page, which in turn
require locks to be taken, we'd need to carefully check that no such
translation can occur from an inappropriate call chain.

Jan

