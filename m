Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC17098AB
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 15:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537077.835843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00RU-0000X9-Qf; Fri, 19 May 2023 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537077.835843; Fri, 19 May 2023 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00RU-0000UO-NM; Fri, 19 May 2023 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 537077;
 Fri, 19 May 2023 13:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q00RT-0000UI-Cg
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 13:46:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a09b93-f64b-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 15:46:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:46:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:46:39 +0000
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
X-Inumbo-ID: 95a09b93-f64b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhXG10KDVNIVpJ5C3VC/2bihgl4o8O5c1AjyFW9cMh4GjvaulGP+xnHwoiGj5Wjkg7PzO4eOVzn5X74eygknaYrtNiPsETOm8tuQYHxJtRPjBRFhyNxbGXYmL6GBWMGNNtargffZi/lOzWO22SSyc1eb0BLDV2SuG1r7hYI269AYjYk6+lb64VaXIQiQR0ip4ulbSBnkJGr1u9mgRpC4TtKh2U5FcmeJ+seliQu77vbANfsGLKEhw4m+XNxS95+gb5/MSMq8kpO4WyKLhkeeEbpHVXxxaLUn7Wq7thopF4TZpLi956Y2ntytXgZwpDGrbIGvs3dplsn04RYDGapsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhHA8hH7QwqfXdKGI77LLNSsHMPt7mHwyDyOqpZH4lA=;
 b=kyLfp5RE3w3N8bboGxYdmn5PQ+fyOb+i0IV5zSlbD0iFh1RyPxMLRaO99F96tDQ9aemLgc1kDdxocmEXdoB3hW2vujytip+fo9Osa1sW6FJPCHqPh69z+rrW5zl3xxZythaQpH4iqJ+1vdFuhLipzCEb2DpLsLBsdBu814smsqJQdt8BTzZJRWBs9NVu3uL4CRccy4zcbXTnf6TDN9H55jKk3Gf7Pyjfq2HKcZv71KBYSWR3utAMfrjnY0cg9fByzDgrNcx/ZQMCj4JoTBPe9EWzRD1r44s6FXMC+mBOnwU48T4kAfPfTfOorCluPYuWvPetXArSRezqKQWWbXZS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhHA8hH7QwqfXdKGI77LLNSsHMPt7mHwyDyOqpZH4lA=;
 b=ub40dt2J60ZWo7rPT1P2yAAiopEDgCCHluBDqd7s5TwvYP5RJZw08+7RdhubF2lHMwr81LXeWMAHdvNoN4RBPPh/q7ZZAUBS0Cb3zGLHl/thMzQRIrGpz73w415EMqz9UNDI3xsvLbSlBr6LPXIyWkI1h30DF8Yb92eNRlZVPqgh7suMTpBPr3jQtD7tyiEY2s6teqfdYintSUfAdnZ9YqVeBNm3rYevsc4wrSYY1q0mImyDzL4NhZZQh7e/yOc6nL+z+OmMPta3+OQdMJTuc1tKg3MPWiCJuo1u2gfJ20TFVwHGYM5sn2/WVlVmNwinYyiuVNAuZO6m8Bco01iDUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9624d303-d894-ca35-dd20-8bc6924dce01@suse.com>
Date: Fri, 19 May 2023 15:46:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] xen/misra: add diff-report.py tool
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230519094613.2134153-1-luca.fancellu@arm.com>
 <20230519094613.2134153-2-luca.fancellu@arm.com>
 <94cc53ec-17c4-6ec7-7f13-e4f0f9e31e2d@suse.com>
 <4BCB4841-3E13-468E-BB89-E72EDFF9D3E1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4BCB4841-3E13-468E-BB89-E72EDFF9D3E1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8e2e81-b387-4273-1ff7-08db586f7856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cqasDpKyEiB9K0LEY4mCAu/BkUZNC0jOuddUYiqZJx1VIkPy9O+xwDu1TbUdQwnawQPwBYTHVbel+Xmdmt/eW10hDX4kgWD+7oHV4VW9Z7xJOihPsylU+4nqDmFet+wFZAdT6/47PZOwIpNxAMxBT78fgoxkIgmAk7eocTUMJIxM8P3n0pLXSb0ddqPQkLBU31ubW0uia4SrMyWEIrqeKhQo9W2g6S+V3pF0s5lyNwfddyZ9pn7SJ1BNPAWN6xJmKPFRDQ/+Ljy93EiDjeQM05FKmOxnxSXhNDYv8jUBcfj0ZwufO2J+6m16zfcX27oFdyCybjra5YJ7EQ3iglURe5zK0SfLpWtp+WjQcMpOlLhvqktifx/7+kzIYFf8ejNx0Kqq12vXTvQy/dHRmlkiHBS4tWdWZLcTQnfj7vUk4ZKMjoHQ1D431DJ5lb3PhfuhSfwflkx3STsYT63vEJgdCj4TlrIMw6zFffwRoAs7nx1zOS6ma2a0P12WD6iEHsOfbPPmK3k0lGbQLpWvwHc2b6QwBirHUwqVXENYqFkN3lcR9QVgmjDiqFRueevIDlnJksdkAYn19VBnPfsLbWz66CVX3LM1OI53KcXI835TGNR4aomiSbSTaemThpHTEhLnmSANEo2Jmm/32U2/uXicQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(6512007)(6506007)(31686004)(478600001)(53546011)(26005)(2906002)(41300700001)(6486002)(186003)(316002)(2616005)(54906003)(66476007)(36756003)(8936002)(6916009)(38100700002)(31696002)(4326008)(5660300002)(86362001)(8676002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdES3Z2YUpkRk5aWjViOU56a0hTTUFEYStGcjdEeU9BRFhVTktwYnZKdlg4?=
 =?utf-8?B?QkJsT2xpQ28rd0lqUUdVeU1NR3JxRnk4ZXNtYVpwYUNSdjhXLy9FbjhVWlpT?=
 =?utf-8?B?YXJCLzJ3a1JNeUV0UExla2lMYTNmQ1RGSzVaM0VaVGRZd0grd3c4YXd0WlQ0?=
 =?utf-8?B?MStjUFgxZGtHanE0aTdNbnk5UjR5dmRrUnF0L1lJVXo2NEtmbmMzdXFYaEgr?=
 =?utf-8?B?LzNXWTRXVUtFUVpIVkZoVGJ0U0R5bCt4Vkk5NUhucjN5RjBCWjczTnphS2Z2?=
 =?utf-8?B?N3VFNk9VTjhzL2VZei82bjlsSFRMSWJWWTAxZTRzNUgzUVJIRXE5QnF1VTgz?=
 =?utf-8?B?NXJtNDBOTktHWm9Kc0Q3QWpsb2dQanVieFgxbmpPYVM5czlxSDF3cUVTaGRj?=
 =?utf-8?B?ZmpBM1FNT0VWS0l3TFNLcHRvdklLUU8ra0pBQ1Fwb1lJakR3NEpqKzdHOG04?=
 =?utf-8?B?WGd6cnJJTDhuT0E0RXQ3SGdjdk1OakRremM3dDRBVW9xVzU4WlBvVzFBVXho?=
 =?utf-8?B?aGo3elVNbDFWcFp1a3ZqV3R5Y1BqcGdCckxXaG12MjRDNUJnOSs5Z3FFWWJy?=
 =?utf-8?B?ZzJXSE5ITUxabDlYWm93SGROQ1M4dmx4Y3h1bkJsZ3RQVVJNeFlsalQrU1Y5?=
 =?utf-8?B?N0dCbnBjOXBtVGNYUzdzeGRweGkxNVNhTHZkSm51eCtBQTYwa0M5dlVXdUJR?=
 =?utf-8?B?VG5NM2s1dWM0WlNRS1JEUzdFSnBZZ2dXcUtnYVZ5TE9SZnQ0RzBWaGtTMjZV?=
 =?utf-8?B?cmwrR0w4Wmt5VTd6d2xIWUJydzZwNHNzK1RjOU1EeFBjUGRzUGZFWlY4VklQ?=
 =?utf-8?B?UndFeFBVSTdpZUlxL3RMZHJOaEtMd1o0YzdZZWR2K25qT1NlMU5CZGRXQ0NX?=
 =?utf-8?B?eWZ5eTluUS9ac3g3ZkFSTjZsWFlYM1VhT0FZajRiOWcrbTJQMVZXZUlGUk45?=
 =?utf-8?B?RXYvWnZPbUxaQzlyZCtqbG45TnZIekorTTFmMWpKb0ZxNFN3V2szVEtrbDBN?=
 =?utf-8?B?Q0lCMHJvUjJ2WmFCaWd6QTdBTnQ2SkFyaGFlT1cwQ3dhdCtMd04xM2dDZmlF?=
 =?utf-8?B?WkU3c1ROaGh2MUx4K1EySHJxbStLY2pYcEdwbkVwckdkTHdzL28waGxiV0RS?=
 =?utf-8?B?SGxJdWRuemtKYU52d1VMVzBqbzYrSDBOTmlHZkRnV0FUWmtMRm1DajZFbzNa?=
 =?utf-8?B?NFlxNUF0aUZrbHVyYXpQQksvanhoSW5nUC9NODFnQ1UrUjBRVi9NVWtzclNq?=
 =?utf-8?B?NjZZNmZGZWtocG55aUtwQ2l0NVBtai9lRU51ZHFtSmVMekcxMVBRa2Yya0xr?=
 =?utf-8?B?WjJESjY0d3FDMUg2SnBRTDBFSVgyRDV0TUhrSFNEYXRQcTkyTS96ekcwL1dI?=
 =?utf-8?B?R1pFL1p0NDN1cTl0T2hHcFpFMklWbURpSmNrNG1ENmVLYVFZcXErdnR1cWZi?=
 =?utf-8?B?QU80ZHZlWElEd2hzZXFjRVUzbFZKMGJINjk5N0ZjcHh3UGQ4NTJweWg3T2pZ?=
 =?utf-8?B?QkNCSGpxWnY5VEFSN3RQajlXQ3dKclpsWjZRMXkxSnBDT3liZ2djeU0vRDg2?=
 =?utf-8?B?VmJWNElQdnMxZnpoZWN5VnZTdTUyU0lCSXNOeFpqUlM3VzBxRjVwcXpaelRo?=
 =?utf-8?B?WnJkVmEzVHdDeGhxUjJyNEswS1hhWDZTRTdiaGQyMytDV2hnRUs0eGJ5WWFH?=
 =?utf-8?B?dGhZekRlckF4QTNDWWtyYXkwSFowNEpEOW5NdFA0QnI1MjhLc0tXK2d5ZFFX?=
 =?utf-8?B?UWJoR1pKQ2g2NUY1RjRoVnRQRjgrcmpDcDMwc1lVcXF4SWVDNXlpVnBXQi93?=
 =?utf-8?B?U0UrUjhhYVBWa2Q4Sk9ia0F3MzlUR3pia1Rma1I3UU9lOGZqb3BOVmVZWG9Q?=
 =?utf-8?B?RWtIVnlCL1Q4OVRadG03QTFSRmU4MVd3YkwyamFXUkxEdWZJeUtPS0VSV04v?=
 =?utf-8?B?NnJYUml0Rmg4bW1hSks0ekplWWlROFlhNXhJWVNmS3laM3d3V29wR2ZNN2F5?=
 =?utf-8?B?Q3FGbVF6K3ptWCs4Mi9QMmpKYkdRZjdIa1VDRDhsZDd6WWlCNkVWdkcrVGVM?=
 =?utf-8?B?eTVOcmdaMVI2OWVjMGxodThIOGUvMEM0WlVuTDBMQXFRVnIxYkZzYWZqOFRZ?=
 =?utf-8?Q?G8D7h0Jwomn+zlufjDEffXj7s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8e2e81-b387-4273-1ff7-08db586f7856
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:46:38.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89i1T1XCxZ1AyUKwGVS5IKRprGt0dOoXKCqtCLYL2jAPc+KY61FvhiVQ0ZjSIB5JYQsC1+vESEfVgN+zIwnk4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

On 19.05.2023 13:10, Luca Fancellu wrote:
> 
> 
>> On 19 May 2023, at 11:53, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.05.2023 11:46, Luca Fancellu wrote:
>>> Add a new tool, diff-report.py that can be used to make diff between
>>> reports generated by xen-analysis.py tool.
>>> Currently this tool supports the Xen cppcheck text report format in
>>> its operations.
>>>
>>> The tool prints every finding that is in the report passed with -r
>>> (check report) which is not in the report passed with -b (baseline).
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes from v1:
>>> - removed 2 method from class ReportEntry that landed there by a
>>>   mistake on rebase.
>>> - Made the script compatible also with python2 (Stefano)
>>> ---
>>> xen/scripts/diff-report.py                    |  80 ++++++++++++++
>>> .../xen_analysis/diff_tool/__init__.py        |   0
>>> .../xen_analysis/diff_tool/cppcheck_report.py |  44 ++++++++
>>> xen/scripts/xen_analysis/diff_tool/debug.py   |  40 +++++++
>>> xen/scripts/xen_analysis/diff_tool/report.py  | 100 ++++++++++++++++++
>>> 5 files changed, 264 insertions(+)
>>> create mode 100755 xen/scripts/diff-report.py
>>> create mode 100644 xen/scripts/xen_analysis/diff_tool/__init__.py
>>> create mode 100644 xen/scripts/xen_analysis/diff_tool/cppcheck_report.py
>>> create mode 100644 xen/scripts/xen_analysis/diff_tool/debug.py
>>> create mode 100644 xen/scripts/xen_analysis/diff_tool/report.py
>>
>> If I'm not mistaken Python has no issue with dashes in path names.
>> Hence it would once again be better if the underscores were avoided
>> in the new directory names.
> 
> From what I know python can’t use import for module with dashes in the name, unless
> using some tricks, but if anyone knows more about that please correct me if I’m wrong.
> 
> The style guide for python (https://peps.python.org/pep-0008/#package-and-module-names)
> Says:
> 
> Modules should have short, all-lowercase names. Underscores can be used in the module
> name if it improves readability. Python packages should also have short, all-lowercase names,
> although the use of underscores is discouraged.

Hmm, I was initially thinking there might be such a restriction, but
the I checked a pretty old installation and found plat-linux2/ there
with several .py / .pyo / .pyc files underneath. Which suggested to
me that, for them to be of any use, such a path name must be permitted.

But well, if underscores are required to be used if any separator
is wanted, so be it. Albeit ...

> So, yes, the use is discouraged, but here I think it improves the readability. Unless we want
> to use “difftool” instead of “diff_tool” and “cppcheckreport” instead of “cppcheck_report”.

... personally I'd like both shorter variants better, plus perhaps
xen_ dropped from xen_analysis, or some different name used there
altogether (to me this name doesn't really tell me what to expect
there, but maybe that's indeed just me).

> Can I ask the reason why we need to avoid underscores in file names?

First of all they're odd, a space or dash is simply more natural to
use. From my pov they ought to be used only when a visual separator
is wanted, but neither space nor dash fit the purpose (e.g. for
lexical reasons in programming languages). Plus typing them requires,
on all keyboards I'm aware of, <shift> to be used when dash doesn't.

Jan

