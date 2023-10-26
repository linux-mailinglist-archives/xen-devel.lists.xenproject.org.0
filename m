Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC307D8761
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 19:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623936.972239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3vA-0003bT-Es; Thu, 26 Oct 2023 17:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623936.972239; Thu, 26 Oct 2023 17:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw3vA-0003ZN-Ao; Thu, 26 Oct 2023 17:13:24 +0000
Received: by outflank-mailman (input) for mailman id 623936;
 Thu, 26 Oct 2023 17:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jAM=GI=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qw3v8-0003Y3-8l
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 17:13:22 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e83::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5448832-7422-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 19:13:20 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 17:13:16 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::bc0e:2b8d:357c:675e]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::bc0e:2b8d:357c:675e%7]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 17:13:16 +0000
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
X-Inumbo-ID: f5448832-7422-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtuAT8B3hrQ4hdiRs1D3LZSl6I4UvlP4TUbRP7d56FOpR0q4qR8CCjDGer3O5klKZbrMYa1xnVGh3qT/GAUft0FnKgvhLmtXPRvy78F6uYyHKkGYFIYiEuLSSVDy7DJ46PGU5kBxyycMLlZCske73KsypDMEVXnnoYxAy7fpSbOCiGqdQ2X6wbSLgfU4YGHHgygt9ifUwN0pVi7+/FaTaTFX771IF+q6SMjC+IpOyFtK4NAwiBcUCgZn7CNPogyVuztVMs/+AoLA9wM7VIQ5Xfl//0n8PyKQKbbhjXupHIuYXEwEpdTE2kxyV/1KVqr1jiyUjSfWZTXs5j/QOLKTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgRssnI/fojT3LhdHgfivKq3kQildm1/kX+trC4wVIA=;
 b=Nidju6G+Jc6Hrimm7xarbL83Ren4HK4qpkjiq/PGtDb6qNrMbQG1LPyxeQ8YLWystQOUeefXERiPeDu3KHpbovbVg0ohWrIXSZudu3CjGbWWuwnl9mf2kVxVhAuJJ3bYaHlLIJPdYmxHr6L8aA99COkLRWKTpk8xyOtOvc1NHhqyvl6bWn/l/ujo+f8rQ9WwOiBLkSfh1S9VBzn80bQOPCD0/u1grmrYigpaSZYohViy6Po91E+5d17GNfq0DHNslXTCW3JaoSU1VqXTWmVAkxw4B5b/uZr/HLEVM6B+VphQnzPPA0bEbaWh0Hk0fe4a4IywybJN3/DUsYdc6vv4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgRssnI/fojT3LhdHgfivKq3kQildm1/kX+trC4wVIA=;
 b=wKyOX4gnzQs7kDZZ0Hh9MOiFKD0cT0JBpN6Wf0SMNtKdtno+4aUFqv/6uB284Uf6DSfPGXGnVwBmd79gHnuLncFhd4CPnhzbPpaM0dcUPBrBlkzE2ih32LYWpPzPXXc595OtjCUmfpd3SGEzYkO2UDhjoZaNxvjdMgdeki1Acs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 26 Oct 2023 10:13:12 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
	jgross@suse.com, Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCHv2 1/8] xen: when unplugging emulated devices skip
 virtio devices
Message-ID: <ZTqeKBSYXciFcBXG@amd.com>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>
 <20231025212422.30371-2-vikram.garhwal@amd.com>
 <f8d6eaf9b5f57184a5f6ec5b6103189b77364e3a.camel@infradead.org>
 <alpine.DEB.2.22.394.2310251820510.271731@ubuntu-linux-20-04-desktop>
 <9d7d7fc988fa06d77cb1eca739f82063608dfda6.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d7d7fc988fa06d77cb1eca739f82063608dfda6.camel@infradead.org>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: fea02308-6938-4b93-e0af-08dbd646d7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfG9f16BgZUx5mGp7nKvxlLxkf9ZHvgS6ipGkksoFl2vraeE25dIb6uFwC6qbRAgGe6HwEs/JdIi5DTeyCqS33iUDWD/mEQRNA84YKpDN6vonO5qQATJ8f6X1aoLFW5LtnO3XaUJhOgqxLB+59d5bczVS/UUIh13qYE0eP4pvT3JeA1F0bo3VviQnc5LO0Y5JlBIaVynl5sPmGhU1s9Nhy8yws3GYvDN0srMCvoubxr0eoU3qb/Oz0l6pWaFS6dgqeNI3adR9JutVKOxFMlqOw9ArmwOkou0sFXiP5NguPA5cte77byxsvKqoNHwuBMqhSXlvfWZ5bzux6yVhXOnohDXZ7vSHHzwWLcjyxmuC/ZbdDfuXYNHJAa6T05ZCalpB9d1+hBcDjZ0mpWncVPhg1QeK+BL66ql8Lx9/bG506WKOKZ9U/tunnOw0UBnQqJFEf+DzU89O7283WZ3/XMS9wbeUewdC6jv8WZDNVMx0/N1FWVCdmecWhECHQqag8UjnxF5PIeFQfbG4WmfeUcxJf1vPSk0QlwFWdn4yRkecAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(2616005)(36756003)(38100700002)(6506007)(6512007)(6666004)(316002)(54906003)(66946007)(6916009)(86362001)(66476007)(6486002)(478600001)(966005)(66556008)(4326008)(41300700001)(8676002)(44832011)(8936002)(2906002)(4001150100001)(7416002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alBpbnlvNUJvWHIrbFBNVE5yaTJTbUMreTJqeStkYTd3YVo5WU5XQVVmZFdk?=
 =?utf-8?B?TnY2WWc3dDY0SmROYmg4bkYvVDIwUjlFQXlkbEVmTHhuWnNxWW5wY0Q1VUU0?=
 =?utf-8?B?MlpudUZlVDQzMWxwZ0NlZHJZMlJGcjE5Q2JpVlFnci95cjhTQVEzeG5aL1lx?=
 =?utf-8?B?MDd0dlRpT296SlBSUytmOEgxUEZ1aHNtSkVvaDhwODNCd3p0amZ5RmtKd0lL?=
 =?utf-8?B?OUJwNUhkMjMrM2dtdXcxZmlzSEpzbUVhOGVySm9POEV0TWZWY3BrdWRLNVRz?=
 =?utf-8?B?UktWdFUyYmdOOEMwTXE2NUF1dkxibCtnQXMxUHN1UUlKOEFBc3NGTVBlbzlB?=
 =?utf-8?B?OWY5eHUwN3BCZlo3UjhudkszTXBnQXJqRmxiS0hQaEtiT0hpVHBlREVuZWtE?=
 =?utf-8?B?RkNCNXdDaVU0SUFkaitsRWNFQzBsNmpQT0U0NUtVYXZxSFAvV2Eya3k1aTRr?=
 =?utf-8?B?QnIrMWZPWTE4WkxMOG96OGRhdFYxZ05FS3Y4QWZhNEZVeU9kbUVwZGVVelY0?=
 =?utf-8?B?bXJ3bWZ5c2g2c0NDRDZWeVhEZHpBTzVLV2Z0TUxOLzFUeUYxem9ISVEvY3pG?=
 =?utf-8?B?SlVJZURwMlpPcVlETjd3d1BFcDhqaUFGSTViL09hdDlLQzZwUkZwUlh4Nzkv?=
 =?utf-8?B?N0lPenNnQjQzZ3REdE1nRGdTaUcwKzBpS1hCcmh2N043b2gvUHlBZS9Ya2JT?=
 =?utf-8?B?enNNUlVrcnRwa0U2T0s4OXJUQzdYcDJRTW1RSm9BSkV1ZFhXaFR5WFhXS3B1?=
 =?utf-8?B?emUydUhheWZRcUQ5QkdVazdyN0V3Zm8zV0tYbjBwY0F6enU4dmlacmtWSitB?=
 =?utf-8?B?cGZMa2RRcGdSWjBDWktFRndEMnZYa2dKUVluOFg0aHlzd2hGaFRaVUdNZzhr?=
 =?utf-8?B?dmpWVSt3REpsSVMvZjFRT1lvenlJNXM3SzhKZnhWQzgxTWIyNjZ3TXJpVGZG?=
 =?utf-8?B?WGJ2NkhDVytjaHJEN0FGNjNwbmV1a1MvYXlJU01SK1hDNm5WY3ZQQ2p2bFdq?=
 =?utf-8?B?WEJoR3dVd3RXNVBsa3FRcWpCVTZmaVVXQlEyRHdBRHVobEpxaGxGeG9xZWd5?=
 =?utf-8?B?dTBkOHBCSVB2em5PcDNTZFdXQ0VPek14TytaNzl6dm9DdWRZcFN4OTE2YTBZ?=
 =?utf-8?B?Ukg0TkZxVnpxWGd0QjVqN1EzaWI0Qlk4NXFjZzZBU0FnMk9mb2w1eU1pU25P?=
 =?utf-8?B?V2psQXJTVmJ6TmI1S2ZJcThnY0lYaXFSWmtPNVp2YWkwVVBPT2Fhd1BSYml1?=
 =?utf-8?B?TW1vWUVQUjZsQlVnVGcwNzVmcjgzdzVjcWZMVGt1dFRtK2s5QU45eUl3ejlE?=
 =?utf-8?B?VDVIeWQrMUhTNE53dGRVdVIyZ21WOHVETUNMaDF1ckpTcEp3SDY0MHhTUXVO?=
 =?utf-8?B?RTEvdDZSL3R5OTFKTkhrc1lwTmRuVEY3RXo1ZXhuRjJEMDEvN2YwenJEY3VZ?=
 =?utf-8?B?R2tneGZEUXhKLzRaSEFwTmZreWNBNTFOajRneFNEdmZqcTBHWXlKUXZzOG1a?=
 =?utf-8?B?Tittci9zV2srSTNLVXhhOW4xaytrQmlMN2lTQ1R0aEt5VGwvSHZMNjY2MzZp?=
 =?utf-8?B?SUQ3R3FvU1hRV3lBYk16eC9tbTFuL1FJeWhUZVF5NWY0Y1ZZdTBmelhpSmlW?=
 =?utf-8?B?SFhjNDBqS2hPVUhWVnlSNUtVbGl4TktoVEpNU0VUcFFjbVRUUDhmUFlIbUFH?=
 =?utf-8?B?K1ZMWklvMjk0bGF6cS9CTldtN2tZbGtiSmtPQmluazFoeHFoZzJvaGVwdzZn?=
 =?utf-8?B?RFlTQk5lWjgvT1NSMHNZTjcxUEhlaXF5aFZlaklFS2xJbndvVkJEVmhuUkFG?=
 =?utf-8?B?TzhxUG9aRWtYZWlzN1JVdVNEYnFmbGNuazg3VHpia3g2NVVhZWs4Y3d4TU5J?=
 =?utf-8?B?YmdVQ2I5bkRPVklHQmVrTlpnZzlQQTBET0xSci8zTVNJMXF2emFROTBBdXkw?=
 =?utf-8?B?VVpLS1F4VmNKbWc3Q0pKeW41TkMxRnlOckV1UU1hNHoyYjlBbkprYTJkdGdl?=
 =?utf-8?B?ak9KTkJpZ1dvQ1dycDdkR21pQjFoNDRZNUNwWVB5Y1JWc1BCNm1DRTlKSDh6?=
 =?utf-8?B?Z1pETko2N3FqRE9EOFRTVlhpUXEzM3crbWpRTXg5eUEvVjluQTFCSzhCaGhj?=
 =?utf-8?Q?x0pAwPmI1N8oa1SaYzJ7I6i8k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea02308-6938-4b93-e0af-08dbd646d7f0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 17:13:16.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vb/IGTBlFd3UXIJ1QMB446U6PaGbkA8Nca5eFTJie/602ff/Yx9F9gxS6U3tr1kQgJHH4gsvfo27x1VDy6J1IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268

On Thu, Oct 26, 2023 at 04:45:21PM +0100, David Woodhouse wrote:
> On Wed, 2023-10-25 at 18:23 -0700, Stefano Stabellini wrote:
> > On Thu, 26 Oct 2023, David Woodhouse wrote:
> > > On Wed, 2023-10-25 at 14:24 -0700, Vikram Garhwal wrote:
> > > > From: Juergen Gross <jgross@suse.com>
> > > > 
> > > > Virtio devices should never be unplugged at boot time, as they are
> > > > similar to pci passthrough devices.
> > > > 
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > 
> > > Hm, do your virtio NICs still actually *work* after that? Or are they
> > > all disconnected from their netdev peers? 
> > > 
> > > I suspect you're going to want a variant of
> > > https://lore.kernel.org/qemu-devel/20231025145042.627381-19-dwmw2@infradead.org/T/#u
> > > which also leave the peers of your virtio devices intact?
> > 
> > Hi David, device unplug is an x86-only thing (see the definition of
> > xen_emul_unplug in Linux under arch/x86/xen/platform-pci-unplug.c) I
> > suspect Vikram who is working on ARM hasn't tested it.
> 
> Ah, I had assumed there was something else coming along later which
> would make it actually get used. 
> 
> > Vikram, a simple option is to drop this patch if you don't need it.
> 
> That works. Although I may revive it in that case. 
> 
Hopefully, Juergen is also okay with dropping the patch. Then, i will remove it
from v3.

Thanks David & Stefano!



