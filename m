Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADF312EDC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82698.152760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93hM-0006xm-Ag; Mon, 08 Feb 2021 10:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82698.152760; Mon, 08 Feb 2021 10:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93hM-0006xN-79; Mon, 08 Feb 2021 10:23:16 +0000
Received: by outflank-mailman (input) for mailman id 82698;
 Mon, 08 Feb 2021 10:23:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k8o=HK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l93hK-0006x6-2Q
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:23:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a51f082-4255-4d3b-9ff5-b73af9977752;
 Mon, 08 Feb 2021 10:23:13 +0000 (UTC)
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
X-Inumbo-ID: 2a51f082-4255-4d3b-9ff5-b73af9977752
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612779793;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4jEKH8PX/ONb1EVKOuyR6l6EL4AdOivu1ZjE6u1YryU=;
  b=Ba3V6F1EKMmm/GF60/6TPEXB/jmnXyA3S9prYmuIr9ASnbyWFaVUYBL1
   6gZh2DBB912ipDyscAUqHSRn67uMxp6/t1N69t7lxe6FlJpQw5+xiB6sF
   iWZQht2xopgUb+BTysejnxf1In5pGB4XPuKBdP/mORxnVBDUi6EX4woVm
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vb8cVxuP5RB4sCqF/4CwEu/J3PK3WDMh9MFw62YblUyjsjYlMcoBh5r2h1M4Zh/ufLscsfqUXJ
 lV60z1m4FjpgKmUGSaqttXn9WJMO+9HKRdh4saQi9EauYIWQaITZFP2GTqjW/iw3GFdRpyVwa/
 +o+WxNLj19tqntFfZnh4Eo/V7sdHMvcpQNGwq3cFHmgtjBHUPkTDD85OwN6TKXxLPbvahOqhzy
 +MjGE/3u3dkGjWGIRfyZ/9D6BLB/V5RXerC1XJIKodKi/08h0Sr5HdLuPSdNFSFX196CFTZ4r1
 4jI=
X-SBRS: 5.2
X-MesageID: 36755069
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="36755069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+qaZxtdKsFlFU5uTAjyUnLbFZM69CjskEiNGjCn36GZcpNbu+8pdnhRz1yNoibVT4cQTTKpimTMS/l6DPwTyjKqcusIz+Y38U2p7A1k4scVLOYEbjzwJbXeecNMt4uE0iH+q6xfRqpYiyA8gGHcKip9IyAlrVQuiIXw437iJnNRdUoxIxi56LsG47+EKC2s1SMHQRNKzyOX4BX7iJyVvlS9HffpBKa5Hlk3qHsDPQxFSu8R53xsAz1+XtN6RMAPIuJtctXlqGOlpLTWIlfWD2+2W9OvArcQ4bJe6ooCNHfNmK/36nyydEz80HUDWXWSWxuJ1Q1DIGceWpI8UQIsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jEKH8PX/ONb1EVKOuyR6l6EL4AdOivu1ZjE6u1YryU=;
 b=Tf7UGgbXZXd/G52ttsWPKl4fwvUG1s8lO4aWfq14WLnd5hZZfgFPjwRe9qdFhzS6EjkudPmeSx79jWRL7mpKhXmJLGxUXhQ/XYj7rPqFR/DH1pJFpl4THjzQwfhLj9TZzBTlhVBD4u18JlvLjlua9xY5mxA9llcrI2JNOFTdPsmhBqKjEQAaE+jx3olUAxVMwBO6gYNq+xWlOBp/48j6ZtM5WwtKjX9/gn9qSAm8oTkAExHFohD20nMyZLTFxI4h9DnpQxybBJ1b8X5RFh73sWpFKw65iEa4qD/qqqgg3ao1YblJuZP943umdeFbcTNRkIlL+s/p5Apbg6w8hhJVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jEKH8PX/ONb1EVKOuyR6l6EL4AdOivu1ZjE6u1YryU=;
 b=S2OtcvTiSGn6vZWinWZAhBolgHOrafmijbxh7RaLQXFiROYzwo7HBopYYgxsTBtxTV2gOkDcEPlAe72w5vkPDewkO/puQdQ2S/O4JzAsUq+sezVsA7eZTI+3lyJ+Q2VGZTkHuVvJf6UP5EWGKuVo7pvjtXr6MtK5KqkjEtiwEik=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Jan Beulich <jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
 <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
 <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e68f76a5-27ce-a6d8-88a3-1e8fa1c30659@citrix.com>
Date: Mon, 8 Feb 2021 10:23:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d14eb3-f60b-43c7-d20b-08d8cc1b8797
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5518:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5518953EA3674ED5DBFE4D7FBA8F9@SJ0PR03MB5518.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpN26I261m+/Xt09hkqIuuvhW8b84HekpvRF1ezS6dKhew40OJveN79VJ44GZd0IlS4AwwPyUwmofa0BMWkiTsuhIcQVhh5U9vyhDexHdURAD01HJEoUCgnK2Wkz9FM2+iYOhlpVZcc+LO2jUUVemGwEdzIngG8Z8sOTmmR3czMbU7D2ZY20BiX0k53OryNHx+cu3Hn+SKbmHS0UlpeolkBhQ8vYy5dEXN04MruwVwaDqr+qT1l/CFmGvGDL2rhylpw98N5f1k4Tjh0GC9R3//9/JpPVjrm1qK90f9Q59Mi3L9kD08ybqZkvhO0pfPBe/35k2rN9rvelxdG89kuLZaz4hxQrNGQ9+XPoRwV0s34PJ4xnrBYePjQ5Fzmh139neGeeUU0cn/7wdEQj8/zPQtSHHi4DN4SnIvOy9uAR9vw3lxbLh9tuwJXqN7qd335tVVQpuJpHjLluVcOK3ht4fer1hTZa8vuHcKCWa/boKiGSBqeCO2bN0gtKmteZu1I07Tik6dV0g6LtbT+E4K+nhAHQqYABa1ahEWGVPzqTMTxtX8nAGv/K/2TUCU+QGvF1j/ahFk8Sp9xyDq1rrCV9d5bJEzN1Q9AbcDSnreFl7NY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(5660300002)(2616005)(2906002)(53546011)(316002)(66476007)(86362001)(8936002)(956004)(6666004)(54906003)(16526019)(66556008)(31696002)(31686004)(36756003)(26005)(186003)(6916009)(478600001)(4326008)(16576012)(8676002)(6486002)(66946007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2lFWDVidHl0Y09YRGhuS3Jhb1N6WkorM0NJT09aRlFjTjlUTk1TUlQ2T0hM?=
 =?utf-8?B?YmtVS2hnN05IQllnWlBGWVAydEhUbFd0MjBLelVQQ3laeGdvWlBieERweGxa?=
 =?utf-8?B?OVNaSVBRVGZiVFZwUnBNY1ZxczJ5a2dQdTVlbWdRcEpsWXVUZ0RrYlJlNC96?=
 =?utf-8?B?QVYvUjR0UlBRbFJNVzB3a0tFRExBcTNKdUJOTGl0cXNTWlJNK3h3VG5BR1E2?=
 =?utf-8?B?SGlLR2w1dE1MZXBCVkgzeUFSTXNjdlVENWZvN1psR2xIb1NvYTliMElLazdi?=
 =?utf-8?B?K3k2QU9xOTVjQVVoc3piSTFkRjdrVFpFL2p0SVM3TUxGd2xIeUdQOXJtbWVu?=
 =?utf-8?B?NkRXYzZiWVNwREVScUs5U3RnVUZEdUg1NElKK2hWdXYwVmlMakYrbXhCQ3hS?=
 =?utf-8?B?ODdmUkZPOHNpQWJqQ1pGanVHdnVGdG1veTE4MFBIMjRnb0swdlpRNHBySXUy?=
 =?utf-8?B?eDVscDBxVXoxaVVIakNRM21BU3dIQ0t0VDhNL1BMaU9TTkJ2WlFEb2ZjcFVj?=
 =?utf-8?B?ZzY3RU9ST0poTzc5eDgydkIycnViczZFVEFJYkFGRlp0SHRyaXJvZnBDNXBs?=
 =?utf-8?B?bmFsQjVzYkVSRm1MK2lVTWIwQU1YN2NDbVZKaDZIRDlGeWFYMURuaHR2c3Ir?=
 =?utf-8?B?Z250Qloza0taZTBkcWZxK0ZhVUxQZ1I0WGhRSCsrZWdJbE4rN3REN3R4ODRG?=
 =?utf-8?B?Rm1ZOW4xd2h1R2ZNMVhucnJrMmJzZ2NidHk1eGYyN2lGWHQ0Rk80bTJsRFE0?=
 =?utf-8?B?Sjc3QWNxU2hjNFFXMElhd05qZ2dtbTB3MFB0R1BjVjBuRmJyZHgvTzNRWmFM?=
 =?utf-8?B?UVVTa0F1bkMyR2p6Tm9iYkwyZm91N3ZzYWwyc2xETVlwRngwOXQxeTFBTkpN?=
 =?utf-8?B?aHA1Q0o0WDlralRpWDVCSzdBMnJNanZxWlBWT000THp0Uk4zM05zc3c1SzBu?=
 =?utf-8?B?T0lEQTkzeWc4OGdzcG1TTTNFeUsrRVJmaW41OVRjQk9qSnRHb0Vxa2ZiWGN5?=
 =?utf-8?B?S2prU3dGdlBxVzMreEZnRlJpaExCem5McmNHOVJoZ0ZnYm80eFZBRWdlSWtp?=
 =?utf-8?B?TC92ZUlOaW1OWDJDaDNkenlwdERPZFZSUWh1TnVaYnQwdnlhdnFxby9Lc2ls?=
 =?utf-8?B?eGZHelJKT3pWRzIyWjVxeTZ5WEx5L0JXcDBUa2ZUWkVCN2JVbkNkZy91dm5L?=
 =?utf-8?B?bzAycUdDS1RQQkdXRFQ3QTRXNThZWk9wRmlvTEtoVnpMcEZnd2F2aGptNWNL?=
 =?utf-8?B?ZEZ6b1RvV1lFeis5RHMxSHJOcUJsM3ZzaE02bUwxSHFNOW9QaGlPZkpDQ245?=
 =?utf-8?B?QlZCa3gyeDR3Y2UyMnBBVm1kSGJjc3F3NDdMSDdNNDRpRnFxcGNjcXU3b2xQ?=
 =?utf-8?B?TjZFZzV5YkMvM1dJR1k3K1FXaU1yRlIwNWpURExWTGgzTWw4OVFnWVYrTnFF?=
 =?utf-8?B?bnhzVzlORkdwc2lWM3VNYTV4ZFJDaUp5THpWcXV4ZzlwSStoellydVlLbklM?=
 =?utf-8?B?RUZiY3RnWUdWL1d4VFJQNStVUmxXWjE0anhqZ1NFaUs1S3hyazZNeU5iVXEy?=
 =?utf-8?B?WDNkcTFTaVF0R2FBajFITGNhN0Q5RHFtb05wVzQvUEp1QVhDVFJFOGl6Z0RB?=
 =?utf-8?B?VVlNa0RHWit0WEV5ZTRreGo5N29Ua285ZmhLTjhsSjBtb2Z2RjMvSzVBMzlP?=
 =?utf-8?B?dUJFeE94NnRPRGpnaHFSdFhXbjdTUkg5ajAxalFyNzBvR01RZnZQSy9QcFlt?=
 =?utf-8?Q?4JsCrkTNMntTFIcIj4qggTZZ0jN6SYqZ5UhOH6q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d14eb3-f60b-43c7-d20b-08d8cc1b8797
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 10:23:08.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnVbszVxZc7qz/ORwnAZE91BQ61RIHMIdcBz+frg+U6Zd3YOs6JrfOk5t9rzqB71Wt44ubMzCS67F+W55dMOySFEJZVOqaLXP4nRq5YfBxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5518
X-OriginatorOrg: citrix.com

On 08/02/2021 09:50, Jan Beulich wrote:
> On 08.02.2021 10:44, Andrew Cooper wrote:
>> On 06/02/2021 10:49, Juergen Gross wrote:
>>> The ring buffer for user events is used in the local system only, so
>>> smp barriers are fine for ensuring consistency.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> These need to be virt_* to not break in UP builds (on non-x86).
> Initially I though so, too, but isn't the sole vCPU of such a
> VM getting re-scheduled to a different pCPU in the hypervisor
> an implied barrier anyway?

Yes, but that isn't relevant to why UP builds break.

smp_*() degrade to compiler barriers in UP builds, and while that's
mostly fine for x86 read/write, its not fine for ARM barriers.

virt_*() exist specifically to be smp_*() which don't degrade to broken
in UP builds.

~Andrew

