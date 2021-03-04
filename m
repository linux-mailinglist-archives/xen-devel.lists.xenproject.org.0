Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B0F32D62F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 16:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93330.176183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpfS-0003Y8-1m; Thu, 04 Mar 2021 15:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93330.176183; Thu, 04 Mar 2021 15:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpfR-0003Xj-UV; Thu, 04 Mar 2021 15:13:33 +0000
Received: by outflank-mailman (input) for mailman id 93330;
 Thu, 04 Mar 2021 15:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHpfQ-0003Xe-As
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:13:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17d7fd51-760c-4bca-bf9b-e89f9c788037;
 Thu, 04 Mar 2021 15:13:30 +0000 (UTC)
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
X-Inumbo-ID: 17d7fd51-760c-4bca-bf9b-e89f9c788037
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614870810;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ldpjuXIS+rY5GR6s/hovUHOquDD9AgFBnBmj/RuxrDg=;
  b=VqHSinL+pw4dTXVivqGzm6QS+bFGyQ3eRqXkyATanwE9LmChS33cwkKj
   0QNJlQ+Vz9gLq9LApkLVvg/suq2XB+DatPza8VcU5fTeCQ9CPVss94UJV
   3WZuV8oK4gO0tqRSnL1J2/MnR/9jtURJk0X4cV+4Z7sTQkY/YW5Bw2amT
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qp7zNqE4w3bNLoQzvrh7KjDMhQ7LujK2fnBnO88/QXEA10AXaGLLBvpm3wL/FQL3E4ZpqUQOPE
 2wTf+X7toAc/dYCwS26BbYUM/eOnuVpCAXbAnbUBPT2Z1ZZRmACuIfTswejYN0riscfhrh3MgL
 NXZ5fdaotFrW65J8Bd5drNkJ8eK2mLhGamkLr9vkcFHwEvvZrRVw6tQIhE+eZ3YV4DNqmMsp2T
 SgYABcMmrg+71KcD8NC/UpOu46YwmaoChqWnrABLrWdgV2rgIG0FGkglN2Ks9B/STI4wb9jhGt
 L0Q=
X-SBRS: 5.2
X-MesageID: 38558239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38558239"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3dfIWWWbITxt3Y5Cvh1zWX9bI4xmcaa8092C72D4RFJy22YPN/QzxQzMqd8AoDEVv36g064JKy+ILFxZaFZNppbhbwUqf9PBlg9YJfMoKc5dgd5cp9afvdM9btLjUH3oUilm1rPFlCiTIDNORlAVblzfwU6ENMkT4a4kr53P7am53FUNv9troD/Ek14BG7kRyOiiKOW5BmDQJ/wN0GIUS7J4f8BVmiX7kWgdAHhTQyKkQqJAEpkgUAag3iT98gOH0Bj5KwHLlDbvOvSpmwwZyEH0yC3ohcF7DTSraMOBSCeieLk80M/mRJB/mOs8ojP3nIB4imdfrJXRLXedho7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEKHg+sw75mujriAG+HiLsQ2suVIWOFFpQLooMyeiPs=;
 b=WPRHaWnyhaVgbkqYH6h9Q0V1bUM4vFhg1p/1ksMff5TGlLWimdIgi1x6OmR02Wf8bQnPtfrP93MUPQrWIIRujnxcTTqmtQ8uaBEsn6+ajAwH3TiueQqoPpNQ3yi5zfkyEtp+EEXwbOudVm1ggBWV47mRkanfvjgPut1O8DYzJxdU6S3HgtV/CDrlmfepsaDte2zNwfftRsijLMe+KgVzVBvFbDYd+I0t3AfC8k3IWCHfPtVB4LTyzC0X12tyAmWeNWY2Pr+KxXVyyB3+Ez3izhR1xHz/0INukzRXiZbdpP0n1BKrkJWVX4IiYJyCc2uv3U47G1oiLH3dBNBzbr0FhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEKHg+sw75mujriAG+HiLsQ2suVIWOFFpQLooMyeiPs=;
 b=hpzPYOXy241y14Dy0mEIYxKp/J+hPwiW/CNBweEZFwR+MW/qVyUQj0IuQ6fYCfunaLpUlKN3lFwh+oSPzx5m2R+CcdZTbqy3vpNuJZm7wL/H2Q42ESeIIv1k9aEGIAZlMxDSXbZ2lm+GFd+Sh6yCRoz6+1gMd12IikV5iPbRMeU=
Date: Thu, 4 Mar 2021 16:13:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YED5Czp+v2xFSCOG@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <24640.62938.427877.757656@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24640.62938.427877.757656@mariner.uk.xensource.com>
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f404b2e5-ac65-47ec-d4e2-08d8df200c53
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB314651CED0453B1EE13C0B018F979@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZj02z7Pe3+HWBQDHUjiL4YUdTmZfqxn3tvMdr3yYC0u+iRaMR6DALueDjikFGmzUJDbAUGUU4EJxf0kvobG5UGzXCn50slhpzUgRFKhkdCMN/gd92aDvu6ZIbHbWp5VS109ss4LEh8w8EdmOMFPqRwfYzxM+B4mHg7sPF0U8C76FhLzAAzBpgYn8O7gYk0CEchFNzhWdCKa/OoNwBpxmFGCkGmUws18UAPeWmW9kXfroFdrLGaWFLGPd4z7+FZurfd1q3VyEnpGBnGhB40bxY7bRGittn7iWuKbaWGxzJXk+b5qax7+vfW66sRvCi6Jxv3TpSCfIn4LpL7+MevMBWG8aXUzV0eldbIUxhBwNuNHYp9WeJ64gEthVhFPGWAFMSoSoUOKvcB0RRBWktBJ/UIT0Z2R0zMFLfAiWcabJdt1Wt5hOqAgsGfSZx2ZEaeXBYKNa9IT7zW2dI9SeU9IsbQ8kWwNoqSMqzo43jco1D+8c59eFCVLVFqckXeKzvW+pe3HBbpn5eaB9n88CC7/MNmw0UfRHKCxOcfXvqiAyyl94Re2BVgedKdIV0Kptjp3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(6496006)(86362001)(2906002)(6916009)(6486002)(8676002)(85182001)(956004)(83380400001)(66556008)(316002)(8936002)(54906003)(4326008)(33716001)(66476007)(26005)(66946007)(6666004)(186003)(9686003)(5660300002)(16526019)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VG11MHBEOG1nSHZ3a0FRbmkvaExDeGhob3A0RGZQS0thaVVKamI4VjNya2Nt?=
 =?utf-8?B?T1pDc0ZwWTErRUgxa2cwRld1Y0Y2L3hDTWpoSDJ1Vk9sSjdjMy9sN0tZT0NX?=
 =?utf-8?B?WlFONWVtMWNUSXJhRG1VZTN2NGY5dnNKZlczYTAzS3dUSCtwSHZSVmxBTSs0?=
 =?utf-8?B?OVZUZmE2NHdsejhBQ2NjR1pvWGhjanFtZTJjWTdNL3lhNUxiOXdwOU9abUcy?=
 =?utf-8?B?a1BrRUNCTTA0bXltZzNGUnpBa0FpS3RldjNidGdNU2JmOUxndkVUYng0R2p3?=
 =?utf-8?B?TG0wMTZHSXRqVk5uYlkrUytDdWhCaHRvaW10bXhvQnNoVjBXdVZJM2dScXlZ?=
 =?utf-8?B?Si8wM0xrVDd6c3JncFpoUmg5TTlGVVpWazlsMW1hSTZzb0lKWkdWb1VjTHZB?=
 =?utf-8?B?Z2ZlRWY2emliS1BVSm01cGlHelF5Vkk3NXNFZkJ5UXB1TTg5eXppSDBtZHds?=
 =?utf-8?B?bWR5KzNveWYxaHU0UlBUZGwyYjl1Y2ZJb05rOUNYaE9pd1pFd1RUS1c0UE5k?=
 =?utf-8?B?M0xEbmo1c3luM2dBemFvTmpFWG1VTkxuRGFtN3F6NWFMcGhhRm5vbWtZSGJN?=
 =?utf-8?B?ZUNmOThYRmx2ZDVxRFdqeXBJaENFcEdwVnYxTjdMTGNvTDhnT3NIWXl0ZUxV?=
 =?utf-8?B?dzMzNWV6SHlEQ2tDZDZEWUJmblVGSXdIbGwyZjZ4dDlXYlB6Z2s5alhlb0tm?=
 =?utf-8?B?aUMrZ3hUVnZrQkFjZEYveFhkclBYMGNWSDBuL0ZjdUwrMU1LMFN2OWo4RXV5?=
 =?utf-8?B?L0U0ZW9sT05WSER6U1c1SnVVR3g0ejNjM1pTcDEzZ2RTaUtIQ3BDVnUxYlpt?=
 =?utf-8?B?YUQ2K3gxOE9RaExoTldvaHVyMXl5RXFnb09RaDMxaUVPMXpYUUc5cEEyT3BS?=
 =?utf-8?B?SVM1ZkYxc0JHWk54bHExRHg5cHlUb21SbnVIYVQ2OWFaNHFsSEdHSjhHL2l0?=
 =?utf-8?B?M1Y3YnZyWjQxcHVUdkU5ODRjTnhZMlBjcHZCS1RTWGJaSFZ2VlNVcktQNWU2?=
 =?utf-8?B?ZUlBQ3VMdE42OTRUQmhMZG5OSjIrTVNhV1J2Y0RuZ3RzM2o2VmJ3d2hBRjdi?=
 =?utf-8?B?WFJHbEx6UkVGLzdTOXFDZkJmQVVzVUtjdmpVcFdxZVpzRWg5a3BRSHUwOUNm?=
 =?utf-8?B?eFUyMUlUQURGTnpEY1YvRUQrRlF3ZlNJMjJRZ1lYTGNMNFBkc2hMNkxremky?=
 =?utf-8?B?WDhYQUZ0Ymg5dXFQTDZIVU1JU0d0aG9SL2tEWUJjRm5iakR1WnR0TXJpWEt4?=
 =?utf-8?B?K2I3bFJ3eGN5TkFLTTNZZWg1VkRXZTM2dzV0YVA4eTZyZnc3djh2eDRUck9t?=
 =?utf-8?B?bHRGZS9KMytIU3BBL1ZrSlhOSWpZMUN6REdMTWNibFZGMng5QnlwR2NvRXB3?=
 =?utf-8?B?Sitjaks3QU9hVEQwcGJPYkFNWVBSTk52UGdmK0IrQk5weDJlMzFTVzVMUHpW?=
 =?utf-8?B?ODRoZ2YzdXhwWENhb09DUVEwVzZtRTdjcEZUSklKRDBGRkhGODQ3dTlVUTdE?=
 =?utf-8?B?c0pGN1FnMEg5VUdPRXRVMy9ya3pzdmNNMkh2ellGVzlRVGtpMFI2M0p3b1Vs?=
 =?utf-8?B?eWljUnlkakJRNjh0TkdnT0dzL1ordjJXM25Pb0krSmxFRTNpVHlJRzA5Q0Qw?=
 =?utf-8?B?QlY5WDE0dk95K29aRUg0UjM0MTZnVW1PUm00VGZZWURqVTdCRDdWaVk5MjZY?=
 =?utf-8?B?WFhhVyt1K1kzcXpJRHNlTk11ajRwVGk5T05JNG5PUE1iUW93Z0FOazZwVDMv?=
 =?utf-8?Q?oXvI/kkNtCmj1CdndTlxoH5jPt3AAcj3/FhMioD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f404b2e5-ac65-47ec-d4e2-08d8df200c53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 15:13:21.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTXM9Els0B0DR8it4ti8jcjwpLO2CH9hv1fNcoT2qBrAE0vL2yLoJmE0WumYFvvDhhblScFlZNi0qUgTI7b12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 02:59:38PM +0000, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> > Introduce an option to allow selecting a less strict behaviour for
> > rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> > commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> > Xen result in the injection of a #GP to the guest. This is a behavior
> > change since previously a #GP was only injected if accessing the MSR
> > on the real hardware will also trigger a #GP.
> ...
> > I wonder whether we need to to enable this option by default for
> > guests being migrated from previous Xen versions? Maybe that's not
> > required as the option is helpful mostly for early boot I would
> > assume, afterwards an OS should already have the #GP handler setup
> > when accessing MSRs.
> 
> I think it's almost as bad to have guests which can be migrated in,
> but which then cannot reboot.

Ups, yes, right.

> Historically we have taken the view that new Xen must support old
> guests, even if that means being bug-compatible.  So I am strongly in
> favour of avoiding such a usability regression.

I'm not a xl/libxl expert, but couldn't we set the option in a
persistent way for migrated-in guests?

IIRC at domain creation libxl knows whether it's a restore or a fresh
domain, and hence we could set the option there?

The part I'm not sure is about how to make it persistent.

Thanks, Roger.

