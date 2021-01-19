Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E068C2FB597
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 12:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70266.126040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1oxo-0003A9-73; Tue, 19 Jan 2021 11:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70266.126040; Tue, 19 Jan 2021 11:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1oxo-00039j-3E; Tue, 19 Jan 2021 11:14:20 +0000
Received: by outflank-mailman (input) for mailman id 70266;
 Tue, 19 Jan 2021 11:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1oxm-00039e-Ld
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:14:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e23471d-eca7-43f8-aea8-6cc905244be9;
 Tue, 19 Jan 2021 11:14:16 +0000 (UTC)
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
X-Inumbo-ID: 7e23471d-eca7-43f8-aea8-6cc905244be9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611054856;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7Ja0saA12vPeb6otAfigzUScp2mI/5VYB9FL7XwYZg0=;
  b=PL+n0EGLUmjHAB6AWiqRBJYd9mkjurArL9BQ38H/TVsNUU3tR3ojj6Vl
   oXO4b4fEmR+kI5jf7iEqbybzf70YhOvx+YE5HmTH/KG7B5Knm2rtrBfZk
   hFyX2YbG6SdVmxDSCDW89BS19943lWpJIsXAkhEKFQCP1iuNJdhG/+Myp
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EgdGM4Cz3f2sxTFqlROAHrDGjyLAu7anSAvfpebCnZQSfwg8NMbIN8J7kyMLY249I6g8Co3JHG
 QfM0htV6d9Oq5+uKkmbmBUlHOiUCuXm1bJHf2Vv7jXmGQl0k7+EY9C8iMBYZo24yEPhvRdSKbQ
 mp7GIJxJlC2FUi2ZQwaLsFCwuzh8OhCrSiurp7YM7tsS7KH/o3ZtntqKisoPBeH4PbVZIuWO9/
 IyOoEuJJTXqkS3c6qFGRT2mfy6SAWVMZ6DUUsuru37zO/+Smjb9L6+Z305G4mOV4jb/+4F+3nm
 2gk=
X-SBRS: 5.2
X-MesageID: 35408071
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35408071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=broK9tKjvmly0hw8WszdAXOotXj5pxIAiFNpLCxZ2lfW8CvgF55BK/TUtnBQinCcxojxI8G44ToW02ZY9v0TwtaJaBXZH3bPMveKT3ranaq/l5zfuu49ZTGvNYHcQP+NQ9ZNpv7LblGzydc+n5/1sqFuMnA8DKjYqH3fb5+xbkrGriOGGFzurClfDOrO1VlPl02SqJHP7C2KWLt6G3DwatNhQJfXIAmyy2D1uMJO9Kf6q4zoQ0R5B/6I9+WdzNyslfXOyW/IDpO5Mdw1keMFlBO9QpbKOg3moKm5u8FYJVux+Da2kgfsLTro5B6It7ghQTljrvYheFqHeJhdNDWouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpnD95Z9UanBglA9Vp4cyfe5s2EpjixZu+W9ehU9258=;
 b=P4u833Ev5JYONVszQn2U9x29fDbBQprUjaDt5kYevCZcuip4i7+JxJh0wxus86E5srA/6GQUZAoSfWGRcGuPjBc321o4F7ZVntsthbWD971DuKt/GUdbLz/jmuXH/H7vSZ/tIYgt9btZLhpAxLferJ9z6HrgpYdR+llK19V8Syv/CfO/KzrYw3Ngrbhxe92bKYSLLhy8doAli+8r3oY171zUgAmx61TIIbXvtLnkCL3pmI+nA1N0P91k/MKc2A+yalwmSnQP7EwzrpQKROiW48CmpmPbhg+yIKcvtdw3eI+sXcNyG7OXJ/boaBCzQu6l4Q7/CY7QAIqx7f+Rgp/yzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpnD95Z9UanBglA9Vp4cyfe5s2EpjixZu+W9ehU9258=;
 b=OWz9CYOF2liEPFU1vnM9+Ooj+Sl4bFVr3rdoL91xwf1dkxlPtVwE20VRrChVWv5lFY3o9RjvLog/y+Gu9yUi8/nmGenkIWsVGyhzYz0BUZbBrxBACPka1rzjyhb6LxLqqEqWLBOttP/+fg9ECJJGs7ue6bp9aXBdC4XlbHUSS4s=
Date: Tue, 19 Jan 2021 12:14:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
Message-ID: <20210119111406.owyitwdwoat2obeq@Air-de-Roger>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
 <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
 <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
X-ClientProxiedBy: PR3P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 904cbff3-d671-4be0-2c9f-08d8bc6b59a9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3676E37BCE392A061259D3DC8FA39@DM6PR03MB3676.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XtuDRV9n3qhlN7x4V+1J9TvHT2By6uC4vjSuO3dX3zfOqLf3t90QZ7dwSg5mHD3z4ExWODN1+BzUnccL23A0MeKYSKDNz18eXN1FTA/XLA4M+DAFMudFVcFPU/5RmFbo5VanVhuB7zbsj7rYOLeg8JgyrIspgIIMam+cBcBi6+Hzs8hvWX16N+qhA6AwO2/rQaRvuDaXyz3Hm2s+YI5wbxTE88XnJ+JcZ3RF4b6FsPKiggJsKyHZiDhGk6PKA5GydyEKBmDaRa58qXypg2v7eGtDUc642BQbK8GrhQqkvxmanbjztVU5hUT6LNzDqSi7kJRxOipm1ZZ3tD1/7vsI34pvxAorM8ps9U8nCsQAvxhOMuALyhhj/NADM4xCF2+BrxJ6tyV8AyRjh38+k06QKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(83380400001)(956004)(186003)(16526019)(85182001)(6496006)(8936002)(5660300002)(66556008)(66476007)(86362001)(9686003)(66946007)(33716001)(316002)(6486002)(8676002)(110136005)(6666004)(4326008)(26005)(53546011)(1076003)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkNma3pSeEVrcWNTbzI4K3FEUW9OVjAzSjJWZllya1BPWDRzSnJtaFg1bG1S?=
 =?utf-8?B?ZE1ocXBrbmNnR3hWcXg3RG5DWDVmb2tIUkFKTDNyTm9ORHJWYnhmdWlPZW4r?=
 =?utf-8?B?QmJQTUxuN1hveTNiejhiaUFYWXk1ZUpqN2kwRlRUbU5GbVd4RGt1WWhmZTZL?=
 =?utf-8?B?S3hBNkQ1WFk3OWFXaEVlWGpTZ1VhSVNLaDRNTVZVOG1zQ0EydDk5QmlTL2Jv?=
 =?utf-8?B?WEd6OHpNZUsxTklrNjdHdHVkZ0R5TWVVdnU0OEVZNTJHOG1LNWVCL0ozTjgz?=
 =?utf-8?B?TW1uVUVGUFlIbjl0WXRWcGJsVHc1bFZMcmdYNndmN2F2VmF6alkybFZDeEZW?=
 =?utf-8?B?SlpwVmNVRWM5WmtINy9VNUliUmdFNDZXdTU1cksza2xTSDNiblh4M0h3RHNV?=
 =?utf-8?B?NUpUNS9GcEdTaXRtZnhkNGIveG5ONjA4V1hMWTJVYUR5VHVxNnlJMWNaK2VR?=
 =?utf-8?B?Tm9ORENGa3RUNDlTcTZTRkZqNllyOVp2VGNUc29nVU4ycjRodG1LeXNMVUtx?=
 =?utf-8?B?ZE83NXY5cEZKeTN2RXlEdjFmMlQ2QldLOHArY1IrRkZIR0VXc2FRUkNGVllw?=
 =?utf-8?B?R1ZDK2JiRFBUMG1ralluNGxLaXdFS2daTFl0SFJnYmZEREczMHdpZ2sxS2NL?=
 =?utf-8?B?OHFDdHA5Mkc2N2F1YXBsczNER3ZjRVFqaGxPeW5Eb3JNbGV5akQ2aHd6RUIz?=
 =?utf-8?B?NmhocGlrOXk2alpWWDAxR2VhbEFnVWQwUFo0WHh5SWdiU1RnSEpKOWM3MklE?=
 =?utf-8?B?bS9WV2FxYUxGU1lhYm9ITXZRbmVJeE91ZHpSRkJSaDBPTVhyRE1pNkh3Y3dH?=
 =?utf-8?B?TFpDWDZIYWZRdUVuc3NhcU96UWk4K3hrUS9vWnVaanhJMEtndzJIQXAxT3ZC?=
 =?utf-8?B?M0toTjZZWlIxd2x1ekZSU1FvOXlMVXBHeWQ5YUZxNm9xVzF6S05Ia2k4MXYv?=
 =?utf-8?B?SmFFbTFrZVVtS2tSWUl1STFFbE5LSjN0VjVzelV4R1VkT2puMVJuclhvR1Ri?=
 =?utf-8?B?KzJTYUI1WE85WTlzcFcydkthOWdJVGxoMGxqTThTQ1pRSVRjdG52QU5Md2p1?=
 =?utf-8?B?dDF3NVRxTzRQTjl6RGs4OER2WCtsNkJEcDJXbHBzNGZQME0zNm1abUZYbTNl?=
 =?utf-8?B?SWQxWlBPVTAyWmNMMDZPcUE4NW4wZXZDQWtOR2JmQnhHY29UZk5aaEozS0hp?=
 =?utf-8?B?NFRiSHZRZkdaaFp3WFJsU0FQeXc5MDY1MHZSSVgzQWRPcjFOT1d1ekM4LzhU?=
 =?utf-8?B?dmNEV0lHQjNmZ2Y3SFNqbDJBOFdjNVI3SjJ4Tm9JSVh6c1NsTk5CQzhlVXdD?=
 =?utf-8?Q?hc3G1r2/dBhTcWh9/3ur+w52Oks7QLh7a5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 904cbff3-d671-4be0-2c9f-08d8bc6b59a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 11:14:12.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YENHuyWIRALHK4H8cnSbakMi0wlSpAL8WbeFdzY1GMWvbGDncbSMVVntyReayckNYazL0rMMJEh3zZG5xgyCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3676
X-OriginatorOrg: citrix.com

On Mon, Jan 18, 2021 at 05:48:37PM +0000, Andrew Cooper wrote:
> On 18/01/2021 17:10, Roger Pau Monné wrote:
> > On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
> >> On 18.01.2021 16:54, Roger Pau Monné wrote:
> >>> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
> >>>> On 15.01.2021 16:01, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/traps.c
> >>>>> +++ b/xen/arch/x86/traps.c
> >>>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
> >>>>>  
> >>>>>          /*
> >>>>> -         * Indicate that memory mapped from other domains (either grants or
> >>>>> -         * foreign pages) has valid IOMMU entries.
> >>>>> +         * Unconditionally set the flag to indicate this version of Xen has
> >>>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
> >>>>>           */
> >>>>> -        if ( is_iommu_enabled(d) )
> >>>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>>> ... try to clarify the "Unconditionally" here?
> >>> I guess Unconditionally doesn't make much sense, so would be better to
> >>> start the sentence with 'Set ...' instead?
> >> Hmm, this would further move us away from the goal of the comment
> >> making sufficiently clear that a conditional shouldn't be (re-)
> >> introduced here, I would think. Since I can't seem to think of a
> >> good way to express this more briefly than in the description,
> >> and if maybe you can't either, perhaps there's no choice then to
> >> leave it as is, hoping that people would look at the commit before
> >> proposing a further change here.
> > /*
> >  * Unconditionally set the flag to indicate this version of Xen has
> >  * been fixed to create IOMMU mappings for grant/foreign maps.
> >  *
> >  * NB: this flag shouldn't be made conditional on IOMMU presence, as
> >  * it could force guests to resort to using bounce buffers when using
> >  * grant/foreign maps with devices.
> >  */
> >
> > Would be better? (albeit too verbose maybe).
> 
> The comment should be rather more direct.
> 
> 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
> mapping, and forgot to honour the guest's request.
> 2) 4.11 (and presumably backports) fixed the bug, so the map hypercall
> actually did what the guest asked.
> 3) To work around the bug, guests must bounce buffer all DMA, because it
> doesn't know whether the DMA is originating from an emulated or a real
> device.
> 4) This flag tells guests it is safe not to bounce-buffer all DMA to
> work around the bug.

/*
 * Old versions of Xen are broken when creating grant/foreign maps,
 * and will never create IOMMU entries for such mappings. This was
 * fixed in later versions of Xen, but guests wanting to work on
 * unpatched versions will need to use a bounce buffer in order to
 * avoid sending grant/foreign maps to devices. Whether such bounce
 * buffer mechanism is not needed is indicated by the presence of the
 * following CPUID flag.
 */

Does that seem better?

Thanks, Roger.

