Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A027367BFFF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 23:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484638.751318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKoPw-0006DL-A6; Wed, 25 Jan 2023 22:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484638.751318; Wed, 25 Jan 2023 22:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKoPw-0006B0-7B; Wed, 25 Jan 2023 22:38:56 +0000
Received: by outflank-mailman (input) for mailman id 484638;
 Wed, 25 Jan 2023 22:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKoPv-0006Au-4I
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:38:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0afdfff7-9d01-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 23:38:53 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 22:38:50 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%6]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 22:38:49 +0000
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
X-Inumbo-ID: 0afdfff7-9d01-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji8EGikVIjrqdqnOkXJJBbDgd8FQzTYmzS3DNT/ehmpEUfVaddrSJMsYA/EH7KoMml+dyylCsdl330MlG8VMEKebWbOWn7dokA2UK6afPHDYOBIfoSb8YhI6QY8RKX3kVSm5q2NmleiwG/YO+zU+3YJk/sSzs+RbCx2xgMiAgoV56dQ8jnt4rjY3cy1rHXVGNJn59x+zl/rL/3myxKUbMESkcwPOCMMn8ODyl6/WhfGgkfkv4RyvglJTUxpH1cnZfcchQxX3P0mI/Dll7wOeOEyuttMic60uRweKY4vHhhUfSpZaKhJCArSSP8bTcgCJg6Ad+Oz3Oq2DYpJfif2UJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RU7lzqCpBB1280QOXUVIR+DSuSw8vtfdFZGSytrw4Y=;
 b=mPihZU5KU3871/Pmd1cY7z4ST77wHrPtYOIw5x8KKloo0PdfjqcTjR1x2awLaSkVBusukfTKHL6h6OXeumGaij6PmO1Ne2eBxlP5DcrYIb2YS111l82edUB9ouoL1xOaTfEMcsjVDreXunPqSpf744IzqI5ULU4gmBiyUbRy0vl9mAeTi6SHfAP3ZcvQ3Mk75pd1BPRt7S1Vpfoapq7x/AExF2jXdoAp4z2vJAWHszPHIToI+jG7sWgPn00MfRbabCUPSYbbarpfmz0CY5gnwnY1yZp4OtaagO1gqfQ9AHErvEQ8EaSTOykEOVIKTeZr6/+wUv0CdmuUQmWrw1n5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RU7lzqCpBB1280QOXUVIR+DSuSw8vtfdFZGSytrw4Y=;
 b=MoNWpsCwxbd5vcY56FTmTdy8Djq8QQGtw0B46hAW5T2hboWwcjXllmGIhQhiwQGbUguZkhB33pu3sjlZCnweHqHIqDn3W/x0cANLN+/w9FRHeB2RY4ZavNbIPpHsIeUAWYoTJpyUz8IjE07bzpBsgKZ8uGdkxnPH8oA8FDuAYQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <35e561e8-df9e-5ca8-7367-07db3388b0ac@amd.com>
Date: Wed, 25 Jan 2023 14:38:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v4 04/10] xen-hvm: reorganize xen-hvm and move
 common function to xen-hvm-common
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, alex.bennee@linaro.org,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-5-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2301251329520.1978264@ubuntu-linux-20-04-desktop>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2301251329520.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 4569b997-3058-4173-c0b3-08daff24ed59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vJ/21zRa5FJLD8XGnqFsFsPjJgnyI9IAvvRLjEOFpNijOwwJCClkhdhQHH9/qC/Ck0fXmmMyDeNuuaM6eXZUTiXrPZdiGv92lKw2XvnWK0Zvlg9fCLzour/reo7hkXUzU5DDdCBMa4JuHYrvHJcn44kNc3jdVX5Unl3VeixvPJcJP7dc+N2j+XIXd3hmHzJ2wKjvBmtV8nkb2mEpVH0m9iLYIHvFZr6dxulynDnlWjBoz+zuxqkevd+wjZ2SP3qo3uOP+RYk4kbqZfUwlhuEptfw+kti44xxWC2MJLLGFXbJOiwaPAt5KYdinDVDpVlZiErJGEoZLeWajKB1DgVCY6y+j2E8jzYOa9wtRNItV/NnQHjLHIBXY5HaEjJ2yjn0rFhM6wNMvq4S5YeCcp/SQ2wj3Z46m7mNo+nGphYC2XWtNh44GyfOjZq58tqoIqU0i2JqdC88vl7wCVhYhuT3cfOvVImky7l6x0npCvdjRa5/MUveMDMNGA4+8Cgrglu2+iXX2R1KRlUWVDfXxkLx9HMHQR4zBONkvAv3gb3Gkei69VUJ8JbPHLhY3PcB1lECrY8FjRq5C6uxaIviRQXHoGyHqAmWpnO9C/hdQ8JjJihntuFLCbIdN8txGPCixMyg+1DFazq/Dead+rsYlb4SorfWmykbXTh17vpH054DEBqySrJRY2yXaj0QZvOK2TiXVEk+ECxt27uEToEx0TXki1Uj2+VRgZHBHHD5Lmz+48c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(2616005)(8936002)(86362001)(31696002)(478600001)(2906002)(8676002)(38100700002)(4326008)(7416002)(6486002)(5660300002)(36756003)(31686004)(44832011)(186003)(26005)(316002)(6506007)(54906003)(41300700001)(53546011)(6512007)(66556008)(83380400001)(66946007)(66476007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJ5a2x6NUVMSExEZ3VCUXhOTWVOTm10NXVWSDlFMEdHNEZ0V3FLVjFlUzc5?=
 =?utf-8?B?RWRsTUQ0QTJjLzF3ZSt3a3czbGNYamhYMFF4MmxWRnA4M3RqVExSOGoxVkhS?=
 =?utf-8?B?OFVsTTJ1NVdFaG0zbGhDUnVlUXR1cE9Ec1pLUFpwNTFIaVBUTmFaRWg5K1l5?=
 =?utf-8?B?cTFpeGpMVWNRNzBPYmZJSjcyczBIUnlBK2h3OGRVL3hWWTZqUk44L0tNNTRE?=
 =?utf-8?B?aWpKWjNJWWJCSTVvY3ZlSlFLVmgvN25Ld2o5SktLY0RlMTBqWlFqa2F4Z2Zr?=
 =?utf-8?B?NXlVTlo1MHRubUZKd3pJUVJ5L0UzbCt2VGJKd3pQRGIxMy9ubkttMXRZaUZR?=
 =?utf-8?B?TFlMWVJiQ1pNaWIxenZKTElLcG9qZzdPczljR1hhZU83TDNHQ0dNVXJ5d0hl?=
 =?utf-8?B?TUNzNDdrbkxCelh0bHo0TmhzdnRWUzhLSGlBcHdFKzBjbXNzTGkydjNPZTZX?=
 =?utf-8?B?enJzNmZFc2FPZzBneFZheGxJdUNJcFlsU0hvK1J2VnVQRWNFVFBUbkVjRkV0?=
 =?utf-8?B?OUtGN1dNeVdITWhOYlluck9GUjJYN3NBTkVYc01DQVMzK0J5VUFxcFI1c1VF?=
 =?utf-8?B?aGZoV3Y4Y04wNFRuWE1iYXFQdlZ0UEtpWmR4MkR4Vk55YVNXVU9sSHdrRlR1?=
 =?utf-8?B?RDNsSmM5cGhsdVJXVG1ta2RMdzBmQVJINkxYMFVNa0U4ZkUyT2NweGE3c0M1?=
 =?utf-8?B?YUJha3FyYlpaR2JKR3I1NklzZnVobWdaMnFaOFNpVDBvOE8vMDdiVW9CakJ1?=
 =?utf-8?B?WTFOM0NwaTNvQmFkaUdXV0VvNGllR25GbmRDb0djakE2NDFkYTJwbG91V0VE?=
 =?utf-8?B?U2JLOEorR1lBL0tETllOS0RqRENQbmZMNUloK3NzdVM5Si8xb0ZkVTRSOWtT?=
 =?utf-8?B?Ulc1YkdtNCtyVzJaam1ldDh5Y0VEVkFVK1JabFk5VGV3KzhtYlo3NkVkSy8y?=
 =?utf-8?B?eml6bmJPVHpnbXJzZThmd2wzTlBqZ2Y1Z0tHNys4ZDFuWmRYSEIvQ0tObjZs?=
 =?utf-8?B?NzBsZW81Y1VzWjVYSHU1YmN2ZUIydGFVc3BDK2Q2QzVhYThJMC9wbEd4ZVVk?=
 =?utf-8?B?VEt6aG95SzFkNU96SzFkRVJadVhyWG91aVlUVTdadTJVMUVabnNRNkJIZWk1?=
 =?utf-8?B?NG9DN3NZQVcvVWVCQ2l6U1FVWjlTSVFPYzhvVlg1QS9MVmNwZGdtWFU5TkVo?=
 =?utf-8?B?UDBKczMxTEYxZ3JmWmpMaG5maW0wd1VYbnBnMk9DdlRKRXl0aGxzWE5zQXNE?=
 =?utf-8?B?M3V1STgxQ3BoTkpZZUg4SVJ0dk9nZVZORXM0U1FlRytjM3FhbEI2OUcxR3Vz?=
 =?utf-8?B?T1hFQ0J1RllxTjVPNzlMNlMrK2pRVmFqdWJtYlNPSzBscmVzckRqc3kxT1RU?=
 =?utf-8?B?aEVHTVl6SU55aHlLQ1dzTXMzbHRXNnk5MWJtRVh1SG9jWm5VTnhab0puNFVC?=
 =?utf-8?B?UWpwZUhHTU9rcjN2Y2tUQTdYR3p0WGlBZCtXQVdMV0hmNEhidlgvN1hPeDRh?=
 =?utf-8?B?d2JiQisyTzY1Yk1rbjBtNGlSNElpQmViL2h5MGw5SXZZejFlL2ZpcVBDazdK?=
 =?utf-8?B?b005dTdnaTBRRHQ1d0EzaGpwaDljdmNWam9nVVVndFBoTm5rV1J6QTZBN04z?=
 =?utf-8?B?UVV0RXptdm9yWE5nSENkK3BzYVNTaUdGZUZXQWVYKzlKWjB1WUNjTEpOUE5j?=
 =?utf-8?B?YXVWeVlDcXJ2a0hVY2tkNGMwZVhYbXJONW9JUUxtWlVTRUJjSzBaTVJMbHNV?=
 =?utf-8?B?L2t5ZW1qdjlJUTNEVjE5S2VHSW8yb2FPSDJjRUhadkhyZzZSMmxOVytTVjZG?=
 =?utf-8?B?OG0vaklZWFZ4TWZ4UE42d2JhN2YwbTJtQitsWWxram13VkZWVzl5ZkRWYWU2?=
 =?utf-8?B?bTA2YWRxVjIzdHNCUUZ5Y1AyQVZHcGRtTHZIdTJsWVBkbzZQdlFEcWFzOW1W?=
 =?utf-8?B?L3Y3blNJTFk5d00wMEMzdy8raStTaWtWai9RcW1nNnlORXNOR05PTjFzYnNs?=
 =?utf-8?B?UzVkYWZacTlMMWlHV3F1N1N6Y0E3TWpQb2tqelFSdnljc2NUUnJzRVQwOUtx?=
 =?utf-8?B?d3VjNnpGZllvT1NzTnMwRkljeE4zRlFscnFkeSs5Q1F6MEdSeTcza2QwbUFr?=
 =?utf-8?Q?T7Nh9x8xs2jyrOyNKNZ7Fv6ws?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4569b997-3058-4173-c0b3-08daff24ed59
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 22:38:49.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpRnYWngK3/JphQlzNHsQSBO9aA8ufeNPhJOOV/O+2bU8f3A1Z7BAGizwRq4hbUqisulCddtnmTTWaamLoXLNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

Hi Stefano,

On 1/25/23 1:55 PM, Stefano Stabellini wrote:
> On Wed, 25 Jan 2023, Vikram Garhwal wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> This patch does following:
>> 1. creates arch_handle_ioreq() and arch_xen_set_memory(). This is done in
>>      preparation for moving most of xen-hvm code to an arch-neutral location,
>>      move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>>      Also, move handle_vmport_ioreq to arch_handle_ioreq.
>>
>> 2. Pure code movement: move common functions to hw/xen/xen-hvm-common.c
>>      Extract common functionalities from hw/i386/xen/xen-hvm.c and move them to
>>      hw/xen/xen-hvm-common.c. These common functions are useful for creating
>>      an IOREQ server.
>>
>>      xen_hvm_init_pc() contains the architecture independent code for creating
>>      and mapping a IOREQ server, connecting memory and IO listeners, initializing
>>      a xen bus and registering backends. Moved this common xen code to a new
>>      function xen_register_ioreq() which can be used by both x86 and ARM machines.
>>
>>      Following functions are moved to hw/xen/xen-hvm-common.c:
>>          xen_vcpu_eport(), xen_vcpu_ioreq(), xen_ram_alloc(), xen_set_memory(),
>>          xen_region_add(), xen_region_del(), xen_io_add(), xen_io_del(),
>>          xen_device_realize(), xen_device_unrealize(),
>>          cpu_get_ioreq_from_shared_memory(), cpu_get_ioreq(), do_inp(),
>>          do_outp(), rw_phys_req_item(), read_phys_req_item(),
>>          write_phys_req_item(), cpu_ioreq_pio(), cpu_ioreq_move(),
>>          cpu_ioreq_config(), handle_ioreq(), handle_buffered_iopage(),
>>          handle_buffered_io(), cpu_handle_ioreq(), xen_main_loop_prepare(),
>>          xen_hvm_change_state_handler(), xen_exit_notifier(),
>>          xen_map_ioreq_server(), destroy_hvm_domain() and
>>          xen_shutdown_fatal_error()
>>
>> 3. Removed static type from below functions:
>>      1. xen_region_add()
>>      2. xen_region_del()
>>      3. xen_io_add()
>>      4. xen_io_del()
>>      5. xen_device_realize()
>>      6. xen_device_unrealize()
>>      7. xen_hvm_change_state_handler()
>>      8. cpu_ioreq_pio()
>>      9. xen_exit_notifier()
>>
>> 4. Replace TARGET_PAGE_SIZE with XC_PAGE_SIZE to match the page side with Xen.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> One comment below
>
> [...]
>
>> +void xen_exit_notifier(Notifier *n, void *data)
>> +{
>> +    XenIOState *state = container_of(n, XenIOState, exit);
>> +
>> +    xen_destroy_ioreq_server(xen_domid, state->ioservid);
> In the original code we had:
>
> -    if (state->fres != NULL) {
> -        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
> -    }
>
> Should we add it here?
>
>
> I went through the manual process of comparing all the code additions
> and deletions (not fun!) and everything checks out except for this.
thanks for catching this. There were two recent commits in upstream and 
i missed those. I rechecked and there are actually three other lines 
which needs update. I will address it in v5.
>
>> +    xenevtchn_close(state->xce_handle);
>> +    xs_daemon_close(state->xenstore);
>> +}

