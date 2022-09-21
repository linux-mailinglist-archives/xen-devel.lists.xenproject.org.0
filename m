Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C895C01BB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 17:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409847.652832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1nT-00041y-NL; Wed, 21 Sep 2022 15:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409847.652832; Wed, 21 Sep 2022 15:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1nT-0003zC-JU; Wed, 21 Sep 2022 15:37:59 +0000
Received: by outflank-mailman (input) for mailman id 409847;
 Wed, 21 Sep 2022 15:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulJw=ZY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ob1nR-0003z4-KV
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 15:37:58 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5beb5f01-39c3-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 17:37:55 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:6e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 15:37:52 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 15:37:51 +0000
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
X-Inumbo-ID: 5beb5f01-39c3-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe5LO/6JpaLKZVvh5LVm8+4EL4CjFe5dnnBjUYtuQPlMMU3re+VwveJAqBMN3Hksk8O80301dpZ28NYZNmPZh4ZblgItFoVd9ydZUhw6goeXd1eEBGXhuA5UysqROIXdko6hjRC+aqzWYWdMVcFXlLQ1eTR5rGlJKFRE8ojlOI50jRCvnKFl7Fax0b77ByADg0O8iO2NBKhNUJgFTu3S3BA4Cc++RRs5B8pjwYYvQSEYM4Tw/lpo1B1eqLONyMLIj7AAfITkSlIBJWco/agHYxFY/GGIB0pjCoi3fSv1TIWZOWWcJpJYZGiZqxPDt9tbP6/do/0NOeuaCPe6e1/5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXlfI9hpCimOS0+PCSu7ySuBC3nN804dKKFN0UsrTP4=;
 b=hzlmGq3yjcbQzJzv2UdamTfawCQr6SAzxesEgcEFVfYtZ4XWFVO5hBzTq3/lbU3EY7Y/USrcfH+ItXSzpB3A9aby4gVveDn/i7yioeWA63Cim7QY8VzyoJOjlsXhZvw0TT7epkDr/QeJb1xigU581AZ8DTLjPhU2y9hJpjNYT2aflkmSMZ0EggWlgFG85gWWxFIks8S0FkEuLYTu4pk4X34h/TKS/MaeMRYAs1lBsjIrqmUKw2f/AMtA/bCHuxaGoUoB5BH30fChUCvikcRG9FdEvjoz82ZRmxVFekNxEerHcSObOcwUh50uXhd1AwG3MMJc5YXt4rlM2MSIY11SgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlfI9hpCimOS0+PCSu7ySuBC3nN804dKKFN0UsrTP4=;
 b=lMXR87dYURErXWW6DZu4CsIrNPYzSHOB3nhPmMJ+ulwKfMMxmxO4QAx+C36K/0LmMG/QGcFDfyb1A9znpONsRlkBFXl9kbNMPWWQLiVAp7kvgl4HXGojGQn5UjJrSAFiX8wQxjM0jLmNlywHGogsNULufQiji0FfOmfG5Ajqh7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d3414ec3-855d-50cb-4f2f-1a80b705dc62@amd.com>
Date: Wed, 21 Sep 2022 16:37:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Design Session: Resource allocation for Guests
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a12b7e-5056-4df1-cf57-08da9be73e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zb7dV2yE+DZNfrk+29tsxCg50HS/HSlQmNFwM0gT4UOtGmTEQc3JIozcPq0ctBlc6RYk7BFPC4ISXYXRIealgjX7bkq3oJzqg/nSkkxK459kyIk82LidEQ3s40TBwcEVO9f75b7Cul2YMT8T3Qq3hs7/3uB2K5UGCxkZA/2QLmwMLGmofGv0GEtRpD6jjI5/GAEzPYC+2oDjbB2cXxAPFDaclwArzEz+jUdvhInv8oq3W5n2m86a44gcY1UDGAlWmg5LBRquq2OtU4V7ycOitJFl3SRXA1JtrMH53XKeySU4dW2gie+NceH5RFf48ILez+9Hy+hr2KbtwhY/mN+UqawzibKPmyE+hUT0J/qf/5HJEus9vQSOcR9TGdogO4BKJ8eEZ70qNLVn55sgHOPwF9z9yIQtxSMQzEqwGSUTpa4VbUlOItcXuK8XTa1pQVSh46rM+x7Novo9iw0Ssv5J46fzaNBzadg5HsyqgW6Xs5bHaCo1+p2v2a2rDeDxepKApoCpR5YxyshTB28x0Prs53b3M3pnVHk+EmpXpwe2bikYYL2FGAIpf880h5nW07sEnZIxlfR1YJtk8+DSc6Z1u9hI7kWqaafQXbmYJRI63r7fprHvWEgGgtdQoep9TAt//UIzJPj0ehdo/fyg5LjCB/qrR7hg0+AStyEXwirQ5KGYDadZUxRtIbZiwA9x8+RFMwXfGathSZA/0Pg9Kzi8BQ6wWuWehr5R5BqWHPzzxrdou9BZ5GN7c2mrjt8vet79A5uqj2TMtcEbgelk18gJr3N2C9oJoLdT1X7cTd8+bhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199015)(2906002)(36756003)(6916009)(316002)(5660300002)(31696002)(26005)(6512007)(41300700001)(66946007)(66476007)(66556008)(8676002)(38100700002)(8936002)(6506007)(478600001)(186003)(6486002)(2616005)(6666004)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekI5Uld0ckRKUitVV05qV1BVMTlUN1BzN215a2wraUFSM3JhSWU4RHpqQ1dG?=
 =?utf-8?B?c2JQek1iVEhGODRuT3N6Z2c2QWRrTjZOY3V2TVZHcDNxSXRJV0dPY1pSdHRk?=
 =?utf-8?B?bmMwLzhEa2FtN3RVRk42cTkxL1puUElDY1JwMXhqYS9LaW9udnkxNXBmbno4?=
 =?utf-8?B?N1BhcU1MaE14WGdqYjdWejRWbTZTcUx5OGZrYW9iVXJBd2FsNThqRFpYOEM0?=
 =?utf-8?B?Z0paRjlQWWZET3drcDNBQ21wUnVRelg5OGRyVXd5eThkMjhwUFJzb1JmMlUw?=
 =?utf-8?B?UCtzRjcyc253THlCTlZUYUUxSGpYM3RHYnREenBzVTVVbUc1VXF5RU05WmRi?=
 =?utf-8?B?bmQ2eE5hRHk0ODB0T3g1OG43RlFxV01PYlhJOVNBdkJVbFhxL21vaUVOSEhV?=
 =?utf-8?B?dVdkQkhmdEw3WDFDanZzbERVSjhXakxLNmlrbFM0cENyZzNrTy90aWU2OTg2?=
 =?utf-8?B?aWkwYzBHaERJaFJQbEZ5SEMwQVpDTVVtODFNRXhZenpNd2xKdmN4MngxRTYv?=
 =?utf-8?B?YWxrVGd5M2IrNEtXeGtlM2p5WWNPY0Y3ZFQwbTVmZWFkU0I2Z3pLNy94dkht?=
 =?utf-8?B?UklQUm9PSEhVOUI3cHpXVDRoYllHL3hYZUpWN0MrTGZnR3p3dXdDL2FYbEMz?=
 =?utf-8?B?QkVYWXl1dGZJTStEajlGQUJWaFlDN28veW1XWXR3cnhvKzJpTUc0UkdxN3VZ?=
 =?utf-8?B?WURqZUhQcC9vUFdxQmRLcmtLMHRuR2VHREVYN3VmM2ZPNGNSZ0pVVVBJbVNC?=
 =?utf-8?B?SHlRbW9FM0VKNW56blB1ZkRpb3JYcXRaOEExQlRXbjQydXNrTkNTZEo3bDVW?=
 =?utf-8?B?RDh0dzFocjVZTWJ2NHlrYW0rczZiaUlrUTNWOGxENE02RURFTWFiNXZsU0tN?=
 =?utf-8?B?L3BKdkpMdUNxNnVjYWxCN3JIbFlEcnN6bHRSVU1leWhOYWFORE5ST3dQa3FG?=
 =?utf-8?B?ZHFWOFhySnc2L29TazkxdTZQMFZPcnNNZEp3OUYwcGcwM2U2RnE5VnRuaDNF?=
 =?utf-8?B?N1A5SU8wMHFlMTJTeDd6Y1RmT1RnSGJ6RXMrTkVpaFpHTWxkVzgxL3BUNWtr?=
 =?utf-8?B?cXB3Y0xkYUFKZmV3Z2JOK0lXQkpUeGtvc2FFQitZaTZJZVdEK05UemZGLy9N?=
 =?utf-8?B?eWYwNnhCUEpBZkY2Y3BsdjBMS1hQUjVJTjIzaVdQcFpoMmsyQzNHeG5LWWZp?=
 =?utf-8?B?WERJVXVFQWY0TkRuR2xsNGM4NG1RaWpUTFgvenIycUd6UVF1bnhrYmx3ek1j?=
 =?utf-8?B?TGRFaG1zS08xTUxFeTUxaHcxbDNaYjRmZmJGanZVbHhadE9KSzZYdFQrVDl0?=
 =?utf-8?B?L1E4WW1TSkxjRzE4Q3pDOW8xT3I5Y2IzM3E3cHg0VFlQNXhhTkI2YUpMSjdk?=
 =?utf-8?B?OCt0Y0ovdjh3OWEvdzZYYlJ5K0o2KzVZUnpPbGNOS0xrOGYzU3pRbDBTTWNI?=
 =?utf-8?B?WmxhdG5jb3lVSStVUHRsbUQvVnRSR1h3MDRJdDY3WUdVUnNCRHZETnoxdFRL?=
 =?utf-8?B?TDBwdldDL2c1bklIRnljdTVDenN0YXVQN2JYVWRDRnJicitvZ2l0TE1jdjhq?=
 =?utf-8?B?WTlqNE9pYXBHY3Z3ODNnTjZlVHExZ2pybEF1ek5jelE4SWdneGgxdWNGS2o5?=
 =?utf-8?B?elRyVG13aW45R1FHK214TVFycmJJMExKY1lxWXJ0dnZtZ2lJWEU2SXFXS1VL?=
 =?utf-8?B?T0pvK1VXa2NkS2tqWWI0SHMrcC9ucVhISUZwMFVqYTBTdUw1Z2pLQWN1R3N0?=
 =?utf-8?B?RUppdW5Jb2FRWHhHbHBWOEh2d3FLNXRFanpHTjhtQktaMW1mVTdSMFlWZTVo?=
 =?utf-8?B?dWFIMzNaanR6aUNzbDA4eUVDSVIySjBKY0V3YWNJdUt6Q05pVm93M21YSktN?=
 =?utf-8?B?UDVYbDdhMGhzRUgwR2hLVm1lZmxiYVQxN2dNR08rOXIvblZqTWtaZXlGZDE2?=
 =?utf-8?B?bm5BWk9tSzJRNC9ZaTAwQVVsVURGanpaYWJqYXg2M3FmRWVVcklIMDBzYzZE?=
 =?utf-8?B?eEduRjBaeEIzb1dYTlJhTmVHb1ZtOWJuU0VNS1FzTytETjhxcHNzU3d0WmpD?=
 =?utf-8?B?ZFNPWm9uS0V3WUwrUXFNVlc5WlQ1OTBCRDE2OGhjVDVnNXUxRVBRZ3JBK1JS?=
 =?utf-8?Q?0RaHLdM/jWHiDc5lbekRQRXR+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a12b7e-5056-4df1-cf57-08da9be73e5b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:37:51.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfQk26x2Y11mTvJXfaWq+Gwv2dIdzcWBV/dP2sFG8X0ivc8Q7F4z0KT8mqxk09PVVixGhWjHqEWe10eI6GH+vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018

Hi All,

Please find the meeting notes. Please feel free to correct anything.


Jan - A patch series got stuck because revieres say contridactory 
things. Do we allocate all the resources when a guest is created ? Or do 
we can allocate resources on demand (so first time a guest asks for a 
resource, it may fail) ?

Jan - The guest lives or gives a bug

George - It is good to know ahead of time that guest will not fail.

Jurgen - For Virtio, this allocation required a significant amount of 
memory. So do allocation on demand. The guest will know that it will 
allocate resource (grant). Why should the guest allocate extra resource 
in the beginning. It will be nice for the guest to say beforehand what 
memory is needed. Then hypervisor can adjust resources accordingly. Also 
tell hypervisor when it does not need a resource

George - Ok. Memory allocated to the guest at boot. The guest can be 
ballooned up to add resources

Jurgen - Guest can add to grant table.

Jan - What we have in guest config file. Is the memory used by the 
guest. It is the memory used on behalf of the guest (eg event channels)

George - We can’t do that now (would have been good if it were done 
before).XAPI does something to manage the resources for VM. Sometime, VM 
will fail.

Jurgen - Why would it fail

George - Xen can’t allocate the memory. The guest fails not during 
creation, but in its lifetime. One needs to have a way if the guest 
needs to use a feature, then it should be possible to free memory.

Jurgen - Dynamic resource allocation, give resource to hypervisor

Jan - Need an option in xl config

Bertrand - For FUSA, we need to determine the memory size of the guest 
beforehand .

George - How do we predict the memory need for a VM ?

Jan - Extra memory for guest will come from the guest.

George- Need a way to make sure that the guest has the memory it needs.

Jan - If you have separate pools per domain, how do you associate each 
pool to domain. Andrew had introduced dmalloc().

Bertrand - On Arm guest, this is solved. We have separate pools of 
memory. The x86 issues don’t apply.

Jan - Grant table / event channel in common code

Bertrand - Not very sure when allocation happens for common code. Using 
memory for guest if you push to Xen, means unmapping the pages for 
guest. Then you may need page tables for Xen. The problem may increase.

Jan - On x86, this might be a problem . map_domain_page() does not need 
a page table.

Bertrand - Security concerns. Need to cleanly unmap the page when it is 
passed from guest to Xen. When you create a guest, you need how much 
memory you need. For ballooning system, the guest cannot do ballooning 
after some time. Ballooning systems will need two heaps for memory.


Jan - Config file memory, guest sees as normal ram. It is under the 
control of guest. Guest can decide to use extra memory

Jurgen/George - Guest may say I need more grants. How much more memory 
do I need? Xen tells you. Guest ballons up in domain heap.

Bertrand - The system is not possible to know in advance the memory

Jan - For grant table, this is possible. A new grant table, will give 
you a ratio of the memory for each entry.

Jurgen - You can’t document.

Bertrand - Upto the guest to give more memory.

George - Guest fails until it gives all the memory.

Jan - Add a new grant table so query grant table.

Jurgen - Querying how much memory a guest needs. (If the free memory 
falls below 64K, then increase it to another 64 K. This is Linux approach).

Jan - Indicate how much memory was missing for last allocation.

Marek - Subsequent allocation need more pages. So you may need more retries.

Jan - Error handling code

George - I will make a guest with these params. Balloon the heap. Try if 
it works.

Bertrand - The code becomes complex where the guest tells how much 
memory it needs in advance.

George - Robust approach, is to to retry to get more memory .

Bertrand - It is not FUSA safe. How much memory a guest needs (min 
heap), then a have ballooning system. This should work for x86 and Arm.

Marek - Guest memory should be allocated upfront by tool stack (know 
what is the initial pool).

Jurgen - Old kernel do not use ballooning system

Bertrand - Add a new guest and it crashes. This is not acceptable.

Jan - Provide the memory (for both the heaps) in xen config file.

Bertrand - Keep this option as a Kconfig. Make the code generic enough.

George - Set as an experimental feature. This may not work. New feature 
may gracefully handle memory failure.

Jan - If a guest demands more memory (after converting grant table), 
then this need new configuration.

George - Set the number of grants (instead of pool).

Bertrand - Prove a debug console to say which guest is using which 
parameter. You need end up giving more memory.

Jan - Xen should report what was used in the lifetime of guest.

Bertrand - We cannot have a realistic view of the default memory for a 
guest.

Jurgen - The sizes are limited at guest start.

George - Permissive mode. Allocate first from private pool and then main 
pool. Like running SE linux in permissive mode.

Jan - Could work for permissive mode.

Roger - Why do we want to move the feature to tool stack ? Do not expose 
feature if the guest does not use it

Jan - It should be the hypervisor to determine.

Bert - If the user want to have a default value, store it in Xen.

Jur - Required for Qemu stuff for special cases.

Roger - If the guest exhausts memory, then what happens. Guest kernel 
does not use the pool

George - If the heap runs out of memory, then it is a vulnerability. If 
a user can cause kernel to exhaust memory on Xen, it is possible now.

Roger - The guest gets killed.

Jurgen - One guest should not make the host unusable

Bert - A guest can impact only itself not others (FUSA). The pool is 
preallocated on guest creation.

George - How to send feedback from Xen to guest telling it does not have 
memory. Guest frees memory

Roger - We need good ref counting for feature.

Jurgen - The grant table may not be used all together at the same time. 
Expand grant table for this feature.

Jan - As we do conversion between xmalloc and dmalloc, document 
everything to influence calculation.

Roger - does not work for dynamic allocation

Jan - By documenting the various need, avoid situation where guest runs 
out of pool

George - Write tests to allocate all pages. We have an agreement to use 
per guest pool.

Jan - Permissive option to fall back to main pool

George - We should make a pool, set aside what is need. With permissive 
option, throw error

Jan - Guest will log what is allocated from the pool. Maintain the max 
need of memory

George - Guest will write down what memory it has allocated.

Bertrand - Add a structure for the guest for counting. Some places need 
to hack

Bertrand - At some point, every allocation should happen from guest. Not 
by Xen

Jan - For PCI hot plug, allocate memory from Xen heap. This may be a 
problem when there is no dom0

Jan - Why would a dom0less system not see a new hot plug. May be 
dom0less does not detect hot plug.
Dom0less with ACPI was never considered.

Bertrand -  (DMALLOC) This has been done on Arm

George - Until dmalloc is used, allocate upfront.

Jan - Let’s not defer further allocation. Also, we are moving to per 
domain pool.

Greorge - Dynamic allocation increases chance of failure.

Jan - Replace runtime allocation to dmalloc().  Then switch over. Then 
convert static allocation can be converted to dmalloc().

Jurgen - Design interface to guest, so that linux can use it

Jan - The only interface need is to indicate ballooning (private pool). 
How large the private pool is ?

Jurgen - Easier for linux to buffer allocation memory and not retry 
every time. Performance is better.

Bert - You need one more page

Jan - Guest should report how many free pages.


Kind regards,

Ayan


