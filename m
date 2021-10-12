Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA91D42A012
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206914.362602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDKs-00070m-By; Tue, 12 Oct 2021 08:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206914.362602; Tue, 12 Oct 2021 08:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDKs-0006yb-8X; Tue, 12 Oct 2021 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 206914;
 Tue, 12 Oct 2021 08:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maDKq-0006yV-1J
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:40:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dc8bd71-2b38-11ec-811b-12813bfff9fa;
 Tue, 12 Oct 2021 08:40:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-Pq_ignnFOuWD3beqfZVI7A-1; Tue, 12 Oct 2021 10:40:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 08:40:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:40:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Tue, 12 Oct 2021 08:40:24 +0000
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
X-Inumbo-ID: 0dc8bd71-2b38-11ec-811b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634028029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJrnzztcgpAUtNQ9QtKq8z2DdFZssTkvFswiHvb4aLg=;
	b=bh3Yz0lBTG9MXoqQi/lakFAKEUnKgfOQtJpz0N5VbBSPqRpckDtoEtx5mBYOHE8cYOqJ/Z
	/zQQ81+pV7+E19NUIAKZMNclq+gUMO3G5nABw8pZ12CSPi05Jf+hDTVYJkLNKq2rnGwzbJ
	qRHZf/Uzb+M/VkfjZGMqHHt2xy21yPU=
X-MC-Unique: Pq_ignnFOuWD3beqfZVI7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz8BiXZG0ZxM/iUBDufux8NmZE6L0IwQUa0QvA4SnqD0I9ipVX6tfeyJrgrnx6aUIjer7kIL90UO6VkXfOFTCe1RmmOPCDfE65SBHHsJ2tgSKwacrFQTTnWIyd1ZQrsWaAIiY0KSDILXJ0FGKWdzmMjY78okCqcRt6CXkG7w0U/MsX1p7dbcF34MyTV18gv9vDZPNDKXutskzeoP5zltQ6nI6m5GMTFx3PJGZ8UX6VXpdl14x5ycdsGcXRjB6SA2GcRQTFaNv7pSVnKD+uA0Wd7ZzBJMdwiJ+4szPAlxI47sUDxOV8IvxNL5xI/P7VwT2y5Nt23uca1DjWkRNiug/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrnzztcgpAUtNQ9QtKq8z2DdFZssTkvFswiHvb4aLg=;
 b=feUryQlUXsrUphk53oqfvex7WBSOlshLGRgPph8ISvdqfzQT4dRdfDlprOGSRbARPj9lyjDfJ3kW7PS3/izaodd19nMYsQ+azNX6/GTPOgrtmrPP+S16xZpS9VGkEWf+sttn343vMGtpdG2OG4Fa9jkp9Ni37S76z2/3KHtCM8Ha7xR98LirRYrwNg19y27EU9WdRZlPPOkbL8KNM26rIZGrOOuHD6ASdjWpuG1yl2Wf2iaRqVaXehkGW3ke8fycgUqZv1XZFkes1I/2XTofTCJISCQhnRxzl7FzUDMzl4pQShQW71gx+AUa7Zd00rOufv74XABHXwqYRJuD/UQv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH xen 2/2] xen: update system time immediately when
 VCPUOP_register_vcpu_info
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-3-dongli.zhang@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
Date: Tue, 12 Oct 2021 10:40:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211012072428.2569-3-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2e4cf2-8489-44e3-c50d-08d98d5bef8d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3117A952E1BC0E23C1864308B3B69@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4DoI8DWw4lXBvbUmvi9qEpzxwYa0pAYJNm8+byZSORdiCQ6x/xoHrU2DHmUyN0ScfN2NuCPi8SOXcYm5Hk6LYeOmXvoX+Q7mfzRczvCwzAMGdXgwEz5xXGXg148q01d39IxR9AwbxUk2h5ZGIkyOoTvpwNozre6jG3QVVwWqb3Exvy0k94Q7iJi4jaoDxqLUJCTH8maPt8HBfi94KBx/LF65bwXn0LkB3L//ybFtuvnzJgMUGhm2edXWxbp5BAPwZbPqjt2lR+TFVuZHWcJgKkFIXCm45R9tRi6kftgKtCXheC/raa6uIpyvYVL56Lr90iWfgx0YNyMs+ucJcaG5FuQWhjT+PeN7/gAPZsSunYlDNJEq/inas6junWTneprDenFm7aKqAM6o5L7CSCPWgjUh2wKrKA/hPfBL9X84tR8aVnzLlrDyEl5h+Uk1y3DaQCcgEdfVEw274kyzi9m7xVzP8gCLUe1h6wMRNdCxJ/20lWeReGYsJglAd/aMSTzMgjR6/J/0KKbZrdfxLvd/8vr0LC5FmyKhJfEajn/SueHG/cgLqJTsoTdBuwQ95QY92QliF7lqTQB168gcyRpVukwz1fJvkAQXaJUJfZUrA0pObHrN9uW6+5spuC5uJd3IM6KvNbkiKDk9KImneSnevZ+yGWMq6Az5J5hvM5UE8kpG9cFWTVdGLzRYHvtHaecFAZOk7SbYsnK6mNS7PHWQVHWbbyE7ETP5IAAAhq5LiBl7cQcTcQaPajix6/q+3Ym3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(186003)(31696002)(86362001)(53546011)(508600001)(8936002)(16576012)(5660300002)(956004)(2616005)(26005)(6916009)(316002)(4326008)(66476007)(2906002)(66556008)(31686004)(83380400001)(66946007)(4744005)(6486002)(8676002)(38100700002)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUpSVHp1ZUtMMG5CeWxDTXMzUEhIRXZqWVpzNXFJY29IZ0lEY0FiR3plS3Z4?=
 =?utf-8?B?OWZVVzU3OEd0aVg4K3RkNU1IVzJXZzhXWStvQ0ZweXVkVzIybkJvcFRuSlVp?=
 =?utf-8?B?TTRKK3JuVWJpdURFQVdtdUVIcC9xOUMwNTNwYmZWVldNQ1JSby9SKzJ4V3lT?=
 =?utf-8?B?WE9uL1kxTTNKME82TmtvY1dzK1Vra1pGcS91VmZBaGFja0MweWQ3OUN6K1pH?=
 =?utf-8?B?aXptd0JtU1plWDZiWUl4QnFQL3pyWTZ1UTJkc29CZVBpYVA2V083bWRZZyt6?=
 =?utf-8?B?VUo1cWZrQk9mUjd1OUtjdWhZU2plZmtQRHBEYUVzcG51UUNibFZwM0ZLZmFK?=
 =?utf-8?B?dzVLUGs2bUNndkEwTVJ5WVNGTGx3MGt1KzhHa2IwT3luZk1RUnozNmFFa1NW?=
 =?utf-8?B?MnU0dXNNbDEzM2NIM1VTdFR1SWNlcUFEaUxhQ1hYT0tiY3A5TlR1WWNHbnNV?=
 =?utf-8?B?ZHpwLzBkNzRwMWFDTVArVmpWQi9qOFdxUUsyaml4V0NWcDFlSDNwWFkyeHVS?=
 =?utf-8?B?bnpDWXFUb1FQSGdIR0I1WnR1b0o2WUx0MmpybDkxZkUySUZMM2hsWEpjbDFC?=
 =?utf-8?B?OVNISCtnTDNpdDNVOUJxVTBGcXRpalVLQjF2UXJLcThFWHVPTTZKV2h6R1Y5?=
 =?utf-8?B?VnM3UTYybWV3Ky9QOUtnOWN5R0lkMnNMV2pzRHVkQVFIc2g2WTF0MmpQN1BD?=
 =?utf-8?B?OXVYS1EyaWdscDZ6alFNQi9sWjI5dVBnbmdTMitUZkVxU1JpRWJLVUZHT2Fv?=
 =?utf-8?B?bzgxa29rTkwvTXZTUHhnSktIb2ZBT3BzSHd5U3lLODVYVjZkd0cyUlk5UTVk?=
 =?utf-8?B?ZnlGbXREK09jRjFSRjFLS25NaGFOaVJJTi80d05GVDNJUjZkazVhU3ZsaGky?=
 =?utf-8?B?aUlvTUI3ZDVsNUYraXRhdXBDNm40ak5PYlBhTVpjS1dHYksvcVJ1K3VUcHEw?=
 =?utf-8?B?MEZNNHNUSTFuSWdyNkRPK2laVUx5TVBzc0RuMXdFY1RUYTBGRUhIcCs0K20y?=
 =?utf-8?B?UXV5M1lFWUtSSm1iK0N2RzlrWjBMcHgwRVE1ank5MGxjMVhRbEp2L1lHU3hB?=
 =?utf-8?B?WXByM1hmWEhZZUhwakhqclFUQWF0Nk56em5EcXJUR0tkaGt3OXdsUWxQOHA4?=
 =?utf-8?B?OElTaHc3WmxzekxIZy82UkJvSnJDVE5nV1dlejBKVnRTQ3JQRlZSZzFQYm5G?=
 =?utf-8?B?U3F2RnhrRWt1WkRaN1loYVpKV2hGZEhKaXRJSnlKc1llSXplZ1oycEVsNDBp?=
 =?utf-8?B?TUhYZlcrdFErQTZtdEdMQjE0dzc1UFVtQi95alVuTU1RVGp0Zmp1bm5ZRm15?=
 =?utf-8?B?a0Y5cTMwMlFzdFFjcll2N2lIQWlFVkwxM01OWmJ2Ty9UN3JOb0IzcDVNdnVw?=
 =?utf-8?B?K0ZHUHNTZ2lINUZzMFUrMzFEZ1RrS2NGMDFlRGZhSkprVXVITjk2ekk0R0Vt?=
 =?utf-8?B?MXYzTlFOd2ZUalRmZHowTTg1dENhOSs5UGxMbzJGekJIaVdDKy9yakNpaGFT?=
 =?utf-8?B?MFVXSjNBZ0M1VHF0dTdjdURFNmZ0VkdLRHhqbHQzSE5pbnl5dUR5YUYrMUZ2?=
 =?utf-8?B?ZUY1KzMzT2MvQzBrWHdSZExQazRyYmczWWFPMSt6Z28zVjBRb0I3R3lPYy92?=
 =?utf-8?B?T3I1RkRtSzN3WjJETlgzZkVZNll4TDJ2dUNSWlM0RjgwdWY2MHorWGxyZWI4?=
 =?utf-8?B?aFZqUk9xNjZIVFY2NjUxNC8xRmg1NWllN2d3MjJkeGM5U1VOWkgydE9pVmR3?=
 =?utf-8?Q?5wg4W+I+yXdAOF640/bUzYO/Z3NiXT5kX4ud4yR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e4cf2-8489-44e3-c50d-08d98d5bef8d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:40:25.2800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5y3TD7+ubdZknU4oHqc5PlDtofNkPt+Wnrw6G8JLf4Mj8isw6VXri8gAZ4icyxueyq+PCLmk5mdYzCz7k8fZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 12.10.2021 09:24, Dongli Zhang wrote:
> The guest may access the pv vcpu_time_info immediately after
> VCPUOP_register_vcpu_info. This is to borrow the idea of
> VCPUOP_register_vcpu_time_memory_area, where the
> force_update_vcpu_system_time() is called immediately when the new memory
> area is registered.
> 
> Otherwise, we may observe clock drift at the VM side if the VM accesses
> the clocksource immediately after VCPUOP_register_vcpu_info().
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

While I agree with the change in principle, ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = map_vcpu_info(v, info.mfn, info.offset);
>          domain_unlock(d);
>  
> +        force_update_vcpu_system_time(v);

... I'm afraid you're breaking the Arm build here. Arm will first need
to gain this function.

Jan


