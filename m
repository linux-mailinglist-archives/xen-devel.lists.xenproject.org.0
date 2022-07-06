Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63054567F3B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361812.591513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8z3l-0007Ka-Tm; Wed, 06 Jul 2022 07:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361812.591513; Wed, 06 Jul 2022 07:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8z3l-0007HZ-QC; Wed, 06 Jul 2022 07:02:53 +0000
Received: by outflank-mailman (input) for mailman id 361812;
 Wed, 06 Jul 2022 07:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8z3k-0007HT-DD
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:02:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6591063-fcf9-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:02:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6772.eurprd04.prod.outlook.com (2603:10a6:208:188::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 07:02:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 07:02:49 +0000
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
X-Inumbo-ID: a6591063-fcf9-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj/QKHZT60zKn6vNEfGwRJmW/ezv+rj2vEcNXYITBZAoci5GeACmFaD4bKC6K6LR6612dSQys+7LGXCbBezGybT7FEhUehyqx0gt6FZVQCVAlQpseJbgW6xWZa51wPcoerrhdyuIVHcIjSva7BPqpRY07FWmYvjCL5VhRKi2EfVRXSAc2G7sai/18s+EOPHX8oJ1oA0/RPyT+aGy76/jljP90h/89PVKvmjMSEjBF88uc8QUntBPoGXf73GMvsA7iO5U+di8H3BMPUwrvQMumGCrgv8xsmNW6KQSeZA7OnP7fUfWVr6iz4HGEmEpwLRg50aSvSHTMLVvv1XBy0dwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHJDN7apsUjgn76lgbjecD6ESKgMZWqrsjk2zWm1mcA=;
 b=LD+3t2thRZ/z/2Sb1ULDRviX9ZAKM0vzUIBV4NV+SxQg+KxSeZWOudRPqOGRyqvIXaxLjZl7UdZqt2yNKZQR6DX4IvL4zyNh1dONbDO6USn4wzkIMPoGO1i+koJuQ8JWEokunjMusK3IyPeSmpkDD9nezmqdDaebggPDGdwGrvMWLbdaoWy3gxObGGKaXAfsMCaNkZ+oIsJpVRjjIjHXiINhEhDWpz6Np8mIZScaUnWVaCBWls70gFUG73cy7g49gMI8in13NqBYel0ADd9tUCrK8yXvbyXNmPlRfobDX0qc1jK1nIEMpAKy53E6dJ5WxnKMLgHMmgZ+rT+s/QhGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHJDN7apsUjgn76lgbjecD6ESKgMZWqrsjk2zWm1mcA=;
 b=Cvr2EqYsngRxZ/v0aaiR8LPK1BOzUYblJsFZA8+56s3j9kVpzS8CQcXTpD5j5vZKvcrIQFX0ydlrawSH0wBH1zxRuMztkm31qsdS1xEnOBH6xv4TxRC/o1NqMKYS4b7E+tkfKZlgfOWcDeVqrK/0ijjmo4IpMZDxKkkY9x2hGutrb+MMd2mnzoi8cUUUPlaQwwKcF9J1zBOuFXZLNKLHGmYtOUC5pmonx7u7/bP1J6Fkqsy+F9y94fMcrtZHFzEqwYCzhjl8eMno9X1CISdyfNPs/m+3Kw/XRVA8SbVuNJAiO+NTVzfOdH/Ii0SK4zSAFW0iDIV0B8oTP75o2Zj3Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12374e16-8f58-ebc1-fa78-16c9eb6f1d0b@suse.com>
Date: Wed, 6 Jul 2022 09:02:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com> <YsUyUCv7IAbXYwaB@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsUyUCv7IAbXYwaB@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d601995a-2fce-4bdf-0590-08da5f1d89b1
X-MS-TrafficTypeDiagnostic: AM0PR04MB6772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VG+vXq2O0zmjt7Si5vNOgFkRvHXhCwAuQwuzC4RAyhq/gHdsEsA1Ql8vUO69NBWaMyMCKBo1j7op9Txa9lVTr0IAMqc8qgTZBsZRvfVnR8kAtdCAS1j1dbvGRf1kbktgI2dvPfdEhsCjU1RD1xa5W53FoKHJ5IHZ/gyDgLUg/mPvSj/8JdQvYjBMU+87IEeZ8n2jCAM4nqPlTs1CI5hY2SKkQ7sdYYk+lmMBSB6AOPW3gZRexQB7FE80zo/J8D1OkG1oJA1wigkbkbtoeu7SSJTOk29SimmluDezfb1atcUHwqCZz4F9XEfSbOmIUwyjugUQ+2TtTubTT/CiPk97v7gh2v+957OJdsUsStJiJf/gLOhXF8o+oDEnA+uVkpkZnHuxNWXA2+UWZq4RBvUsPyRKG053tNDRHiVWzo0olukW0Z3VZsjhOJxDoeey1a8aDvSvWUIs9tUkauhJBB0QxeoNZJUdmwTmWRMp/mC9oLiha38CIy7nswwLoOuIKKWj5DD6+qobt4/XAfK3D4LUlNhKLGrO2ShhqpAgqv29a2YOTDYYCXKiCmEFxpEuIUizYYiZKZx/Xmik4ayIM8ijqk9IiqNrDagcaVKMkrhak1mjvQVEpw+IB1gD38jAVuSKrT+YbLiHrd+bjN6exkWoTaL+Wuy0WRGTo0hqESzHtFdFBXIyke/hRb99brBid/jDVqGkCSJBqwxF7ey3XW39fmgM2NEFirqHmu3WMK+OZl8rkTlm2GPNIxqrG3yb2rggQW9mIpGgLRgjb2/sCm0EC4nH03WWYJWrRE1m75oeE9FrH0JPdkMNkACv/g4VjitUEq+YhiNmsz/o9b8oKJdsz2YbCDD1gwbvMK+bpH0vHOM8+sA6Hykbh5rQU/RGsduC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(136003)(376002)(186003)(83380400001)(66556008)(4326008)(66476007)(66946007)(31686004)(8676002)(36756003)(966005)(316002)(6916009)(53546011)(6506007)(86362001)(2616005)(26005)(6512007)(478600001)(6486002)(8936002)(5660300002)(31696002)(2906002)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0VNbU5JcFlJY1Fhc1hrcVQzMkZkbHZmeVczdkVxVUlWTHpHZWdzdEpvbmlO?=
 =?utf-8?B?MXAyNnZzS1ZjaFlLWllYbW9BVzlSNUVvaVptTjVvNmJQcDhxNCtxQ2JwQ2Jn?=
 =?utf-8?B?SjNkd1dsQnh3cFdMbyt6b0hUZVJ3b2FxTy82REJFa2o5ZEgyNng3MmVNYkRQ?=
 =?utf-8?B?aEt0a3Q1eGJmbnh6ZTJMcE03Z0hnbVNpaW94Z3JCV09UZUJRMCtwQ2tpV2Nj?=
 =?utf-8?B?cjU1SFFkT0ZTU2VvWEdzc0J6U25QWm1NV0V4bmFzQWpwc3JEQkpVRUo1UlNW?=
 =?utf-8?B?RmpsV1Vhc1JHc25jZVhrV2lqQ1V3ZXc2dTcrenN3aTFPSjBtblJyd2NsVktE?=
 =?utf-8?B?SC9LUU9YY0VNb3l0WU9Qbjk1bFRPeXdGeVR0eEdlZDA2S28zRHY2cmFCdC9I?=
 =?utf-8?B?VVVYZGVEWDNubVh4RDRrLzJFbVZSc2UxbkZDSWdBVDVtbVpqQVVIWEd3QVB0?=
 =?utf-8?B?UUlKS1RFeXFuaWJzYXVneGM4UGdhbm1OYy9FelRDVjBhWE5kbUxicHhMZjVm?=
 =?utf-8?B?SDY5eUUzRzVFeDE1Vm5CdFU3ekxyYnU1RXlJQWlNYkJEU2VlZjlHclRKemlW?=
 =?utf-8?B?R3VIUEtLS0orQjJVZzVRNDZtVHFvQU5JbWJFcFcrdDc4N2ozOXQxN09IajJi?=
 =?utf-8?B?SzVyOE1KM3N1S1cySjZUUTZoOW4za3NOTUQ3OTZhZ2ROeWdYb0tOOERJYTdM?=
 =?utf-8?B?bW9oak4wMUpGK1cyUFV6SjYyczVvQnBDNjRDc0VCYVpobmp1MjFCWmczaXd0?=
 =?utf-8?B?YzEzZHNaa3lJeHpSMk1tTEpKOHFPMHBlbDRhL0VxWlg2eEZKNGVrbG9mdTJ5?=
 =?utf-8?B?UGZvd2lvOFVHQTJQa1hRaitHdFVTQVdST3huN1RsSkJzbmV1bHhuaHJ0T3F5?=
 =?utf-8?B?anBsQ0p1a1l6QWJkUjB3bzlVcGY2YWJzL0tCWGRUcHZMN1YrUFM4eEVnSG5r?=
 =?utf-8?B?UUJCRWtyS1I0MlhQR1JQZ0FrQnY2ZExNSjR0aXNSMElVWEgzVlljeHducHlU?=
 =?utf-8?B?TnlMaXo2dnB2TXpwNEY3VXNRUUs2UmlNcmRQbzVzNFBJWmlJMlRRWkNkK1hV?=
 =?utf-8?B?bkp4Zkh5Uk9xMytjaHJsSm9XQXIzclpBNE12dnhWQWxtcFptQmZVSldmMUhV?=
 =?utf-8?B?NUVGbGRNRVowMU82cktMZHpMcldFclF2YUNGbmNXcWI4dXRyN3BlV1VUcnpK?=
 =?utf-8?B?WkFQWkEyZUVudkRpelc1NEZ5QlhPY2czRHRSSmRqaDg5KzNjOVlMWUJOVTd2?=
 =?utf-8?B?WFBSMk1nakFGakdtR295R0NyNGsrVnFiTU5kZVJpZjRDZlcyTTZYQ05zRXZk?=
 =?utf-8?B?anNxU2xaZGZwQkUvYWhMVTEvVW1DZGJRdy9ZUE94bXF2UitXSkJFeE95dTZH?=
 =?utf-8?B?VHpyS3hBRldiYUI5eXdUeDRML0cySTFEajdnS3M3UHRRSWR3MG9ZVVFFVkxX?=
 =?utf-8?B?ZmlrNkdyaGo4YlBwUkw1NzFTMWdodzd3c2x1U2J2dXhzWEZZNVFwYVZNYmNG?=
 =?utf-8?B?NE9HbW96MmNyVFNDZUFHS0hqVE5yV25zOVl5VFc1YUkzRGh6V2VnMlJwMkFL?=
 =?utf-8?B?Q2FpMGJhRjh2L0VPOVZESk9LZDJybm81THN3bU5UOTVzVnE2UTh1RkQya0Rl?=
 =?utf-8?B?dC9yaWRGMFdPK1Z6cEd2d3hvL1VKRlljUW50N2pYT3ZCNkJXQ3ZqN1Q5Q25z?=
 =?utf-8?B?WVJ0UnZ6Vi9wcXRkY0NwWXlFRWVpeWhnK3VZdEs2VGU0OUk2U0FUcjFRQ1pm?=
 =?utf-8?B?dmZ0ekFhaW85TmprK2JJYUtqWllsa0FtaStzY0J2dVpObCtvZDFISkNtL3F5?=
 =?utf-8?B?akpZOG1yVU5QYlh2bjFVUm52WXZYZ3hnZ1h2Nlp3SkFjRXJ4SDRZbGtQa0gr?=
 =?utf-8?B?TGxlaXhUYUtZK25LcDFkY3pXWjRtT3dteGVvQWIrQzBGSUF3VzdETEFwNGJM?=
 =?utf-8?B?RTlBL3BOaEVUWm43eGNISUdNOXNhNFZGdlcvV2xqamVFMUdDRDVxSURqNmsw?=
 =?utf-8?B?ZHVsd2R3RHNzcFhwTDZIMmRPY1lmOU1xQkpweDJWMWhPWG9MY3RrRW5UK0hP?=
 =?utf-8?B?eDZLd3lEdkpwL3FCckl2ZEQ1WUkrajBGKzJjK3AvOTZDMmVXMUs0SzdvdXY1?=
 =?utf-8?Q?0XSMwaChW/f/STiS7rQGC+DgT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d601995a-2fce-4bdf-0590-08da5f1d89b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:02:49.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep+xLgZiaMXSrheY+ksXM3NL4o5iynAMZSzCg1l1t6C4nQU83zWRs2vdynDNr9eWyydV/Y70AiP4liWtfJv0Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6772

On 06.07.2022 08:56, Demi Marie Obenour wrote:
>>> commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
>>> Author: Demi Marie Obenour <demi@invisiblethingslab.com>
>>> Date:   Tue Jul 5 13:10:46 2022 +0200
>>>
>>>     EFI: preserve the System Resource Table for dom0
>>>     
>>>     The EFI System Resource Table (ESRT) is necessary for fwupd to identify
>>>     firmware updates to install.  According to the UEFI specification §23.4,
>>>     the ESRT shall be stored in memory of type EfiBootServicesData.  However,
>>>     memory of type EfiBootServicesData is considered general-purpose memory
>>>     by Xen, so the ESRT needs to be moved somewhere where Xen will not
>>>     overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
>>>     which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
>>>     in memory of type EfiRuntimeServicesData.
>>>     
>>>     Earlier versions of this patch reserved the memory in which the ESRT was
>>>     located.  This created awkward alignment problems, and required either
>>>     splitting the E820 table or wasting memory.  It also would have required
>>>     a new platform op for dom0 to use to indicate if the ESRT is reserved.
>>>     By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
>>>     does not need to be modified, and dom0 can just check the type of the
>>>     memory region containing the ESRT.  The copy is only done if the ESRT is
>>>     not already in EfiRuntimeServicesData memory, avoiding memory leaks on
>>>     repeated kexec.
>>>     
>>>     See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
>>>     for details.
>>>     
>>>     Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> ... this is the most likely candidate, considering in the log all we
>> see is:
>>
>> Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-dirty) EFI loader
>> Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
>> Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
>> Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
>> Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
>> Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.
> 
> This would not surprise me at all.  I was hoping that Jan would be able
> to test this before he merged it, especially the ARM-specific stuff.

Jan (i.e. me)? I've never done any testing on Arm; all I do is build-test
things there. Also if you suspected there might be issues, I think you
should have arranged for someone to test this, i.e. at the very least
indicate so in a post-commit-message remark targeted at the eventual
committer.

Jan

