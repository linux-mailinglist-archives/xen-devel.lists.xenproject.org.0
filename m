Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E238F302C56
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 21:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74475.133884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48H6-0001Kg-Im; Mon, 25 Jan 2021 20:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74475.133884; Mon, 25 Jan 2021 20:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48H6-0001KG-E4; Mon, 25 Jan 2021 20:15:48 +0000
Received: by outflank-mailman (input) for mailman id 74475;
 Mon, 25 Jan 2021 20:15:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l48H4-0001KA-Qq
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 20:15:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67f35071-8efd-469c-8e6d-a99f11f83cb5;
 Mon, 25 Jan 2021 20:15:45 +0000 (UTC)
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
X-Inumbo-ID: 67f35071-8efd-469c-8e6d-a99f11f83cb5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611605745;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=brLBGS5CjzaCrG8+Sr6c0dpYyaItyxwDhzknho26Fno=;
  b=fBH/lAW9tamsMrprMjMdx0INAGFbNzL+UYvZwxAVgUoJgQtv2apfBYhV
   9WO1jd3KpO0qwNJX1R8TCphxTyaak3SvgsJalnwCcaiTaKhhR+RBBvonK
   noNpRe5B0KYXcdPBTKGtQtENp6HOJDJd+kVkyEdDurQyUjElzQU5O+1+z
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WbURBHPqUwcawkwdVqIUx0pV0gTlJ8EZjQPL/SFEfnh2q8IeqFGpbbzWl6F8Na65+BQTikcr0q
 l8WTO3asUi+pmhMECNo3pCpHywpqoW/or40Ku0UzC7J6E41geB1g9OlN8lqwrrOa0r6XJOYXgu
 t/YY6A/Gjn5SKglPWVqdna/n8gf/skSjNrZG0ErpRaU/M8g58l/igEWbIWhiWnwtneMTBRWaSu
 yT0npZYVnXdQdxTPrOTyXUqukbUlT6bgJlSrVu2D7eqSfcd1jjoaPi6Dvfu2YnXCU0SGwbhf1A
 TI4=
X-SBRS: 5.2
X-MesageID: 35787153
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="35787153"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+SzA8Rpl29ulnIvyrZ92h2rvo1kcgpAOq74lE04/IPojB6vlwo+8qpho/uWGrDEYX0qX+AHCu+Vurdc3MK1cNT+P+AK2riS6XOb5jO42NTmW+kEUzWSZ3lZLkgY7NdeD43CGP2dkUXeAcjJBo19px+cxXvBpF6wCTiYkjDRSuJbnkXJUzAI0yxQBU9y29b5ESkLUpy/GTtsPposwiAFc/cdxJWW2AryPrPu69D4vFtRRm7Q1IiYiT5fQpWuzRKxN5UEgEOf8L+AGWdeKBjLkhGEAggX7FiTuJUobiCoKwNK6hZnqP0KtefE9bZn10WzcjKPTL25C8CYKOWfs1rJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIf/n6e34fgdxuKVqqmGKol0LKI4iJsI2dpHFUSh1EM=;
 b=EAHLloYKRv06vQ5TIddsPljiMH77IvmdvUcdw790f0ZUQAVoiiQI7jkTppFLFjVufz5cUhb84dL/MdVxZ1r8rsDUkQtxlabSWNlp4E6f5UgVbeIptj/kuv9kBXEAbAjQqE91NqPtBDozaX+JDmsMiqabMER3SLlSeYjODadzURSNUEXOFW5ine+q4xXTt4P7X0V1xmc77w40syOZbWWr3O/YqpzQ4XQXzhfg7wVWjI3n0kzUrLcVvlEETcmxR+rHpsrCGhk10QmhTUEZL46TbfyoKFQ6kIF7/D1XT04YarDAkNr8eLeJIh1amCzsqBWLzlrWNHVlJsBdQ3vyT3MuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIf/n6e34fgdxuKVqqmGKol0LKI4iJsI2dpHFUSh1EM=;
 b=DACBZpb/DkvmC4mki0GrGFIXZ+yWkmcu1rqEU+LgnIKLfa98soqJVXs4VCdf30jtt5bGZ+sVShzACQooO/KfJFt/3TiwQVSF5/UyVq6ZWrxiWxiNfISMTShhcfFfyWYb7N2RX0AQ3yel/xRfSSUnkGULyTnU6rKYCYIiDc3ztmY=
Subject: Re: [PATCH v10 00/11] domain context infrastructure
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e20e8b98-4c49-05d8-d403-befbc627efde@citrix.com>
Date: Mon, 25 Jan 2021 20:15:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6a36977-7bb7-4a01-745d-08d8c16dfcf4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5517:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5517CF5BEE6C1A9472847275BABD9@SJ0PR03MB5517.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +A+zaWLcLxc5PItr0FPSaYC1sJI0jXGSR8oEU25W+ELKW6gcPJBppynCi0NjFRjmTWxWHdefRHBy04ucF6fvmft/b8ekVblMwgHRLqcpJwhW6ovRTac3Od11pkmVRWYLD4OLKEE6jOqiDbLgzWj7DVjQAGaVjajaUyA8Ieo7AEXSgG/zIMeAhL0OIQ3yXLVno9vVFhPkj2SnrCQwKtnjHMB0JBz9CPpKx341PMt5TEb/1Sl4n56PiGPLmi9qvpm9HikBC8tBnmY9tyBHI3ICmdGgZ8Q8Gm49rY8Hol8n3FGSrfJDWnsD1Q8nJfZKdo7fUFOp8dV9KPKCie2NE10Vzvpa3Qwz3pGM8WOPEUVrwwz03HrGsfPTnJxh3tLUlUSePlFiAy4cFWlfepQp2sS9zVB91vGtP/m5SjWF/UuSQxksLmjRrKtYc6c7LrXo8EK5YFfNImyD0W3ctSLdqXecvrZwKRyPMawxqhhzVUlrhSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(31696002)(16526019)(186003)(26005)(5660300002)(54906003)(316002)(4326008)(8936002)(83380400001)(16576012)(86362001)(7416002)(2906002)(66476007)(66556008)(66946007)(6486002)(478600001)(31686004)(8676002)(36756003)(2616005)(6666004)(956004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YkFCYnBqUHdNYi9tbmM3Yy9RNFhiWi96R2JERzhtT3BhajhxMVJlNk5rTUM2?=
 =?utf-8?B?akR2ZXV2M1VBejZMelRZelR0TzEzSlk0elR4Rk5Jc0p0QlZNb3lDSTZFNjRv?=
 =?utf-8?B?bTJ5dDdkZWZLZUh6KytXY0dIMUQ3cHA1QmJYRkgwMVlqbUpzNkt3akcxc09a?=
 =?utf-8?B?U2NlWVBUOUNuKzNSbU1za1REdWVKZ2YzOGk4TnRyK2dudmFWaEQ1dWhpRjNQ?=
 =?utf-8?B?UURLTXZISXJ0bUplcEw1YklSL1RETnA0dENRWnNtT2xwOXV6VDN1NFFWbWZp?=
 =?utf-8?B?cTk5T3FTUDRjZ2d0YVI1SUdlSHpvQjdpYTVoUS92SE53YXV1eHkyRkw2OElj?=
 =?utf-8?B?Y0YvTHRoZVhKQ09tKzgxaXRvUnZiL2hraWdGR2JOUnpwa05yZTIvZkVXaUJZ?=
 =?utf-8?B?T2VONlBmeUJKZTF2d21MM09RKzlzdGVmcWFOaUM4TTNkc01EempWbkJLSGYv?=
 =?utf-8?B?R3JJVXhkUEFkQXY1ZVJiZG42UllGNHEyN3V0Wklmc1dhaWUxWldXaVU0dWhV?=
 =?utf-8?B?bWJLM3Y3d1VRS21XWG5Ub2s4RXhvT21JellkQ2dhb08yZ3QySG1adGpSWDNj?=
 =?utf-8?B?U2h4L3NjaW8wbUEwMDQ5a1Z6eHZLUVU1SXJxNDVBVXV4YVpwNTVWajcwREtQ?=
 =?utf-8?B?QzIzRWZiSi96eVV0d0R2TWJlNk5kY0VxaVFhY2txSC91cEdGV1AyUnpQQ2NU?=
 =?utf-8?B?OUJqRlIzaDJla0F3OHRObG81bjZzZUYwNUQvaGg2NENyT21seTlRSGsxUExB?=
 =?utf-8?B?ekd4bkRoVWFPVWpVdDBENGlxN0ViYUs5dER5dThNeFUzYkl5MHVsZlowbVRM?=
 =?utf-8?B?K09DQ0ROeEphY0I2RitFRFBmK2xVZ095QmpTejZWc1ZUenk1WE9iZys1Zisw?=
 =?utf-8?B?LzdjSmlibnpMd2xKTHpvTWM3cGxVWmxRVmVLaENneU1iS2pZRW1NZTlPZ25S?=
 =?utf-8?B?U2I3eDU1MEpQTU1RWHJTUW85NjFrM252dUU2Z1hhS05NKzZjQlZ5RWFZMUJD?=
 =?utf-8?B?RmN3WjAyQlFEOU82ZkZCTnBPMEV2aHZSbDZSb3Z3eXNneWJ4MGdneUFzVTZP?=
 =?utf-8?B?ZW5RaU1CTGdFUjBDampXOVp6Yyt2dEVJWEdaZW5lbGxOVGFWcDhWOWY2RXF2?=
 =?utf-8?B?U1greFExb09RMmloSmt0UWs0RisydEFWaGs4ZE5xSDdUUEpDeUxoalFxNGI3?=
 =?utf-8?B?VE5qaDlOK3ZXRlN3RUpWcXIwSDZ0eC9SUVZNamZ4cTNFUlpjK0VkVW0yT09E?=
 =?utf-8?B?ZCs0dzdGbXRia0JYU0FsRnRtci9kWlBWemlOOEIrWW9BVHVjbmFDTGRvRlFW?=
 =?utf-8?B?a05ZR0d4NERXa3ZleWYzeHFpVEIrQW8vQnp5d09LdDcxRldVa3pkSWJUNytU?=
 =?utf-8?B?bENsUEh1N0tteFJoMjkxQWE3cll5emtoSWFldDEyRGNla0RBK0NLY2dzNW5x?=
 =?utf-8?Q?c1szvF+6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a36977-7bb7-4a01-745d-08d8c16dfcf4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 20:15:41.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JatZwp8XO6lwgCzLlbVqLRUr4xgabVOW0Qy7Zt/UYaDA6uzE7YSIyjH31NzBgeMY9eyDRyFpAUNQ5cVi4YIqkW5Mrdqw1R+qlVMbSxZB5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5517
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Paul Durrant (11):
>   docs / include: introduce a new framework for 'domain context' records
>   xen: introduce implementation of save/restore of 'domain context'
>   xen/common/domctl: introduce XEN_DOMCTL_get/set_domain_context
>   tools/misc: add xen-domctx to present domain context
>   common/domain: add a domain context record for shared_info...
>   x86/time: add a domain context record for tsc_info...
>   docs/specs: add missing definitions to libxc-migration-stream
>   docs / tools: specify migration v4 to include DOMAIN_CONTEXT
>   tools/python: modify libxc.py to verify v4 stream
>   tools/libs/guest: add code to restore a v4 libxc stream
>   tools/libs/guest: add code to save a v4 libxc stream

Thanks - this is much better when it comes to the public API/ABI.

However, my concerns still stands.  What *else* is going in the domain
context record, because you can pull the "bump the interface version and
deprecated new fields" exactly once, as the libxg logic doesn't delve
into domain context stream.

At the moment this does increase the downtime of the VM for no gain. 
What I'm trying to understand is whether this is "no gain (yet)" or
whether you consider this "done" as far as cooperative migrate is concerned.

~Andrew

