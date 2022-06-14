Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103454A9DB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 08:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348590.574814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o10W6-0004SY-5I; Tue, 14 Jun 2022 06:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348590.574814; Tue, 14 Jun 2022 06:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o10W6-0004Pe-2F; Tue, 14 Jun 2022 06:59:10 +0000
Received: by outflank-mailman (input) for mailman id 348590;
 Tue, 14 Jun 2022 06:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o10W4-0004PT-I9
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 06:59:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bdacf79-ebaf-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 08:59:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5916.eurprd04.prod.outlook.com (2603:10a6:10:ac::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 06:59:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 06:59:04 +0000
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
X-Inumbo-ID: 7bdacf79-ebaf-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2+f32U0APJl+VeMpz1jwiyzw2AngewjS1pnXRlhE0/p07+LgqToPta02wkK4rIJrq90+XFlCPSoXcvBgz90IT/g8xjkONaAqJfepeG0quGNDnw48C+ajTgnqeq//jKxU0fCTCXxOzdSxUBWD736xANlvBPZ873vXv+x8gbvRB2YFk/JGJGJI+PZY/2x5s/eDeqL173ozyfIrHb3gGEqA1rbAO9Bv5l/QEYqMqQ9YpxxjVW243rdh7xZnofHwNeUcAsLy/Ew958gRv1B59lF7PlqAwY7+hFRQlT8oXcydAek2ALKlquEWEkE03opl5sYlFjrbp3LMT6kIB24xMOX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiqIR0YoJJTjxfG2FKh0K6nz6+HM3MUd+UjnkTQzW3c=;
 b=TfVWtqqz9kz04jE46M2S6FLvD6nfMKA8AUGgQWtD/+MMO5h41UXQUYBU/lSkQYgAtjW3Hna/vL6SBM8BzkvgtTj9qyX765XrH5otWebw13+UEgYh8FG1xKTIhZF8kvqM5RgLKZV3ypiCXZqICq6dPwHGGFWIryeOmy2f9G14Z/Zfbmq0JDdidWcvIKB8wF63cU5RCPYh/VtJE2EkuNMdvddGpvLKUbGmUzjrnk2Q88ml4UaGvb2c6/8trEvRpcWqFnrw5Iomlu4Dxh2xTzwD/Jli2Vb95yGwOX43yfSgxwj3oKz2UulF3zjhvsPCU22PZbaeWQ2YkgAMj/EpbEGTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiqIR0YoJJTjxfG2FKh0K6nz6+HM3MUd+UjnkTQzW3c=;
 b=AGdAUcMs/6NwdGPXuJvA+iMdNxWbX7qYU/gZpe7A9vUcQZ/nP9G1S0XR39ljqru0n9k3jZpggcI7gl1SJnkx/SQa7UiRf3PNwlCo3BQLZdlynyqaCl9WBLZtjG5jhHqbKZQspORi6Th8DA/XzareNj/NLm4HUZP1opIDp1YFUx5utxgaYJe+QvUYCUEFDSZNE5eGl07my77I9o3a9EKjk8OzbTmvAYcXMJBplxaBsCcDZm7uCMZUM5Bnk5O7vQE0MYRflYczZ0K4TGdNyB/HTQPanXOTXfbOaiI+RzqAxtM+MCpY41eZZlopq9t0VEgCeHyE8fCH9hGXY1OGIDnB1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f3b4e63-8cc6-1b34-4bf7-2c065b7a0cf6@suse.com>
Date: Tue, 14 Jun 2022 08:59:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] add more MISRA C rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George.Dunlap@citrix.com, roger.pau@citrix.com, Artem_Mygaiev@epam.com,
 Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220610212755.1051640-1-sstabellini@kernel.org>
 <2c4b41e4-7381-7424-de72-43f55c448665@suse.com>
 <alpine.DEB.2.22.394.2206131627050.1837490@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206131627050.1837490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 685c44d9-749c-4cb5-511a-08da4dd35e51
X-MS-TrafficTypeDiagnostic: DB8PR04MB5916:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB591615C209EA4EDBA2BD2EEAB3AA9@DB8PR04MB5916.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBfkXHOW6SKoT3AQWR2vdKvJ977VovzXvqn7E5XwVub/lHd/xSNVJiznkfPg7k8goQ3eKmAh6HUh0XxKKjXoBtEDdgOuS9arp7acZPbDZcsUIBm51d0pTWq+ENjB+Eknl+wWM/DrdAUp/cYFba8fA0CXX2urD1S/ADq1hCY6Zudhw1+hHiQPVWhmxFqkR4V7NYmBk2DItQml3qTbuJt9eY3qmhv8aUE2z03yxGuZP5eYdAiCKHIlP3ideebJhA3CyfsWIwm6Gfn/Lnnt1yHZ1Rr4uB/kYgfbbnsG77VT43VFzKw1XvMCRWWT4n52d7XI3FY8TwOVdRIhKp+n+oUJIlOcPlln4TXjGzQXX3sQgsFyJYgJ1a3y5wzm/+2ZHWLDorYTGcjHFXYBGKotF891pmroK/b1QLlegcB0QufCXQDvk5ugtFhqebq9g6uvW4kRPIrW1I2Rns9JFzj7B35umj/iWLU6zQJXIpcLw3SSpBBGEePREOOzC5oVFtr5UACcuj1Kd+WTqyRQ91fumWm14fHF6uRSF54CNle6w6LOfNyYWHaCPnCipOPsrARQ1WTIPBaxElj0ovMljNeJrDch3YKp7cNfdM19PfNznCWl4hrk3BDBbVpp20xCPKq2qfoVZxBCFVn0p9Wv8DmCZe+ZYrv64neaQIWgVLh6VXtPL8geQeyE6D6SP5MYcPZl+rRcFEur5fVoBYejgp3gsYjR7Vv0kFmEw+q9X4TKvJb3yLTmmbb2CuMUuAggNqZvwkTfhyrSJEd57KnoOR5gY34U+ei9Rb+lDOUCMDJIqQTaHKguln8NOT3Lx0yuJKEWoq0x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(186003)(6512007)(5660300002)(6486002)(38100700002)(2616005)(31686004)(36756003)(316002)(86362001)(26005)(6916009)(66556008)(83380400001)(2906002)(31696002)(508600001)(6506007)(53546011)(8676002)(66946007)(66476007)(54906003)(7416002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm1qbDA0aGpMRk5ZK0pxRkJBekpVRzRrQ0grTzNJOGNkdnVOeVBWaER4YlVv?=
 =?utf-8?B?VTFGV3c3dUVmZDJVdWZYZEtSWDRnaFUyZ0xhdzZFYTNWazRyZzhRZlBVd3NF?=
 =?utf-8?B?NkNqQlZQN1EzbWpYVWVGenlkSEtyMUc1Qk80LzdKY0N6bkRQcGxLTzA2SVQv?=
 =?utf-8?B?NWgvMCtKVGpKL3hCb3drNHpyVU1sczRNbGdJKy9WRDdsZEdpOTRMRGdpM2FW?=
 =?utf-8?B?c09NV2MxZjdNeWZPVGNadHliYkM5Ty9yWWw3Y1NnVWo4d2FXWEZWZTFkYzVw?=
 =?utf-8?B?cDd6RFVHb1FKQ2tsUTd5RjNTK0s2YWRqSU5tRTNYck51OVZsSmlucGtyb0hr?=
 =?utf-8?B?UklwRzl6UnBxeDFwYk4yN252eWxhNk0zS2RZbmdPSUEvWnBvbWE1MmhlL0NH?=
 =?utf-8?B?S0Yvc2VOVkt3N29VZDVMUGRzUjhWbXlVeEdiYndjVllBeXNqTDJDa3JHZG13?=
 =?utf-8?B?Q0JabmY1VUo0SUxLbHRLUEN4M0oxQzBTb29Kcms1cVd2cVVxL0wva05Zd3Zu?=
 =?utf-8?B?NXRDUFdGanU0TlExakNWbXZTRjZ3UGtuSy8zME82ZUw3dGJETEMrVEJMcXFo?=
 =?utf-8?B?c2hWekZBN3E4M0QzOUJjYVRIUGpybUZzejVHZElnYk9mY09VZTZsWXoyanVm?=
 =?utf-8?B?VWROYWk1blhwaktBRVc4dmRXTVFud3IxRktNWkJWV3dHaVhOUmpYMEZHbFhS?=
 =?utf-8?B?aHdkcEV0ZVFvc2I0VEtXd25iUytrYVR2cnpUbHlaOHo4NFVmb01CNG9kaW95?=
 =?utf-8?B?WnZ2K0RRdFI4Sm11dDlXcjVLR3RQQXlKMXVPcU5ZTHA2WGMyT2drU2RVajZF?=
 =?utf-8?B?Y2pSN2JuSCs3Sk1LQkpVUTg2c2xVMGVGY3E2VW5oN0c3MUdRTDJreFBUZGhB?=
 =?utf-8?B?Wlg2aGlsTHl1VCtvdXFvZmRuUithSlBxMHd5dXZZNURJOWlxNHpwUzIrbFph?=
 =?utf-8?B?VVNGRzR5RS9EeWxxODFFbWh3LzV2NExPN2VKbzJZdlZpcStKY0NoMWIxQ0xa?=
 =?utf-8?B?aXB0eUZtRFBwTTE4ODhOM3Jxdm8vWTA4em9RaWZheXRhbFMrUlZObStHWnVN?=
 =?utf-8?B?OUdqbk8wR2U0RmlwMkE0TzljSHYwa0VoYVVienBTVHRyK2h1OWVhUnJqdWFJ?=
 =?utf-8?B?Z1UrQ1lQeGhsVlJGUFBxZGZWbGRpOFJsOHl2NFFwNVBTME5nZ3N5Tlg4QzBJ?=
 =?utf-8?B?MUpvek1rNW5KaUVmL2U2OEhFVldHdjNCN25xTnVBTEllQTkweW93WVVxdCtE?=
 =?utf-8?B?aFZua3l1bUtRMzVkVTRUdzhyWlBRY2RoazAxb3MvNmp2M2E0VUk2NzU3SWhP?=
 =?utf-8?B?ZUFaM253KytYcE9CajMra1o2eGZpcGhmdXlRVGFON3VHYmhXaFRRRkdONlUr?=
 =?utf-8?B?WUxZM1VkVWJ2Uk1jemEveWpHbUs1TVYrSDNkVjQ5V081TDJkOEFycVpic1Z0?=
 =?utf-8?B?ZGg0NG5mc1RHWGY3c3FKT1Y1UEd0VDZmbFEydU9jeGJ0Z3BLZ200K1BReFhG?=
 =?utf-8?B?WW1oRm1Tcm1jNUs0T3h1NkRMUC94Y00zc3JXZHVqbUc5VmV6TXVuaS85VG5P?=
 =?utf-8?B?bStWODFiN0JFV2RkWGQyaEc4TWRBTkg2SUwrMDR1Y0NHRCtsZ2YrZHlleXVW?=
 =?utf-8?B?dDFMOGVRa0wyYTdXMzB0eXRlUkV6ck9OcFdSMU1tTG5BQXJOSjFCd3RwYXNE?=
 =?utf-8?B?UERwZTR4NU9teW51VmJxRDFQb3EraWlmODlMbUFyWFh0TUFUWlQxMlhHdlgy?=
 =?utf-8?B?MkVuL3luQ1ZKUDBNZ2p5N0prNEk3Z0VJZW1IaWc0cERSaU9tZDJBZGdnSGVM?=
 =?utf-8?B?c1hFL3lBdzVkdXpjNWZlVVpFd1dXakI0VTB0emhyOG9uV0xSaGdMbnczcFhB?=
 =?utf-8?B?cndRUjhocnZlcDhWNk95Ni93Q1l3RnZkbGVUVDRFam4vbWpHY0crZWJpVTRv?=
 =?utf-8?B?OXNhaDB4VGwyYndjUkdIOCthR2VzbXRCVE5KTmhUcjYvYUd3a0tacGNmUFIy?=
 =?utf-8?B?Z2tLTVZVWW5meGNyRzAvOGNUY2twNUlEbmZ1Y1hQMkl6SGVmc1ZFL2Jia2V2?=
 =?utf-8?B?R052UDBkSlRkK3QzRTFoM2V2a0VvL1FrK0R2ZHFIUG4wanA1MG4yTEZPSGFQ?=
 =?utf-8?B?SFJPRXN6OGIwWVdXZUMra3Y4c1BFYzc3YnM5Z0lHaVB5RENIa2FPcDgzS2hG?=
 =?utf-8?B?UnRidzVFdkNEb3NqZ1E2VWRBUFdNbjdpWWpZOEZVQWlEbzEvbjNwbzhWYXBM?=
 =?utf-8?B?VkdwOUJIOExkVXNFajFCNDJRWDR1dzlLUCs1RUI5T08rangwallOUSs5YUlT?=
 =?utf-8?B?QVZJNEttRXh3S2RjU1ZpTGdJZjV6SXQxdjRIWm05SFhIakdsVFc3dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685c44d9-749c-4cb5-511a-08da4dd35e51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:59:04.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxT0IkPon9MyvWBSbLx5ABQRM9FBUY75OlWxjWQCA8Q/cg1dwdfUuguxwxMT3wdSjU0LmNHvNiy5MP77BYSHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5916

On 14.06.2022 01:29, Stefano Stabellini wrote:
> On Mon, 13 Jun 2022, Jan Beulich wrote:
>> On 10.06.2022 23:27, Stefano Stabellini wrote:
>>> +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
>>> +     - Required
>>> +     - An identifier declared in an inner scope shall not hide an
>>> +       identifier declared in an outer scope
>>> +     - Using macros as macro parameters at invocation time is allowed
>>> +       even if both macros use identically named local variables, e.g.
>>> +       max_t(var0, min_t(var1, var2))
>>
>> Nit: I would have been okay with the prior use of MIN() and MAX() in this
>> example, but now that you have switched to min_t() / max_t() I think the
>> example also wants to match our macros of these names. Hence I'd like to
>> suggest that either you switch to using min() / max() (which also use
>> local variables), or you add the missing "type" arguments in both macro
>> invocations.
> 
> I see your point. I'll use min/max as follows:
> 
> max(var0, min(var1, var2))
> 
> If you are OK with that and there are no other suggestions this tiny
> change could be done on commit.

Yes, that's fine with me.

Jan

