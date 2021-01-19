Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9B2FB5BC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 12:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70307.126142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pNf-0006nt-Lh; Tue, 19 Jan 2021 11:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70307.126142; Tue, 19 Jan 2021 11:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pNf-0006nU-IJ; Tue, 19 Jan 2021 11:41:03 +0000
Received: by outflank-mailman (input) for mailman id 70307;
 Tue, 19 Jan 2021 11:41:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1pNe-0006nP-9W
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:41:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44172b30-4d9c-44c6-b6cf-2517d19c73cf;
 Tue, 19 Jan 2021 11:41:01 +0000 (UTC)
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
X-Inumbo-ID: 44172b30-4d9c-44c6-b6cf-2517d19c73cf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611056460;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5rPePWJTD2fw3/cHTqsM6E/AsCu3T5/OxINyjH2BttI=;
  b=BLyRvFkGh/ZxwUydfYHI1o9/TLuQSGg9kVZqJZP0DKRsXKVbub4V6AC2
   DKHfJnV5l+PkImVJQjY4DWpXfPtVIbDaHqGf7+n5Jyxfd4DGFfJe+fqsQ
   FD70pAjBZQU5A4egQdebeGUTK2H6e/UFbOZoS0yguZbi5U1fnST4p0n2O
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1eFZN7hLzXmR5VNUtFSDzCMtsQZAi20BoCUA7vF6jdz9qu7Kyqag2xkbIQ2oQmDU3Gyv/QiBDh
 UtFYHLR6xRR8M7ASq+8qJE8N0woACLXWqe9EXnZ1xbB4y0ACWDpEjE0Utctsh46nRfC7jwiZAq
 6LqVvwCdEBH+5jNLfMML2iS4DlfHwIRkewCZwJByY3a/QsHOofSPvqZe21AKFuy4GBSzJwHLN1
 ZIYblRLM/tyoY2gPA93cg6Z4wYqbcDiXKnjxSvtZXF2MgUPTsYosrd6rOaiEnP5Gmxrv8ieiIx
 D04=
X-SBRS: 5.2
X-MesageID: 35410221
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35410221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FutnV/6dKW2/K/cAgCtr3j8Gkm9iETdyFMyq3v7JU5IWzTZDRLW+QWgcny4QvOawWeIiMgHASpx3QL9jQY37470TW7vwkODwMwbiY4wrlyBIZ6AcIJ8YCu1v3YbD8+buR5418k+fl4SgBmJnepNGsBu+jU4H0PFNC7p72at9ekk3rRxT2EFDD5P82XLpIe5kK31ObjxZ4zDtF6rnwyoZy6xdH4si/DZij+rsip8i0E58kJ0NNXYq2gyEIH7kITHtrm9tA2JwsH9xGMwcb0FLc00VOhsY+iGeAhvXuTsXv0PFvHWXvVEKonKlb2lYB8OMR3alnIhy91Xu+RNCLFv5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj810LY3epO6SYOKGHfY0262DTSZFEwi2xkUCFlkfcY=;
 b=am/kreHO48HTxbw2L0bi9YRZJmERG4KIAkiQpUH/mg00FK5kJOgk5hwTev2pVePWZ8RWnN4Q/dkRT5qMJ0JSrWtgfpkq56FypAOdRrwO8H+i+lPbcTFggfqepNTBnkfhf9ZZ047+TiDmIss71Ll6kvH1uhn42mQK21a961HS2co8hYjHvWQfE1zmq6X35BUcHY/Wqp4G188xn8SewS2Q3Zoa7VPQwysyKvzyqjhLSc9fZToUy5yF12/1oLir757ZnZ6tag90PQHooLnnE8FPEFwAbHLjoUydT29xHg7E7fHnACg797BtClduP69kl9rTmWStW3gqGlPm3ZiN+gqZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj810LY3epO6SYOKGHfY0262DTSZFEwi2xkUCFlkfcY=;
 b=E8+D1xv6RKVT+2+i6imk7hTpaMk/mwpHD2yPBDvlEgQf3L1SIVjGbMqbA/u11bpIfC5PK7G0z9Stnulo+nVD/91zhYDijenCUGBXhGSVrFJ1oFwOZQo5NKZ++Tc1/xniOcUMaRUyBcp/uugj2uUJrf1LjXegk3iXgiGZ55E8gok=
Date: Tue, 19 Jan 2021 12:40:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
Message-ID: <20210119114051.aslgkrh5n6t5a2yt@Air-de-Roger>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
 <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
 <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
 <20210119111406.owyitwdwoat2obeq@Air-de-Roger>
 <a247baba-3be0-75da-f581-67a362325eea@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a247baba-3be0-75da-f581-67a362325eea@citrix.com>
X-ClientProxiedBy: PR3P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf07110-4c30-412f-3078-08d8bc6f15fa
X-MS-TrafficTypeDiagnostic: DM5PR03MB2715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB27152DDFDF2EBA9DFF203EEA8FA30@DM5PR03MB2715.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6VvAy0mcErS7ZODn4ecm/xqUr4hMpmFcTydoZ7+MTEtuy4Yeb1YWa8f+r5ltR7PBZwrhWmU+CeI/vn+j+VdQr+Jlr4G4ljLBYG4obbdA4kNwrqIS8FxZ1g++E9K8ABa+qrlqE+Ev4J2hGxlvlYh1pk0T/dSjyfC8y7p+SRMuRYchGSNt5zz/AjXVvHZdjCv2CfIGqxsz3Fnn7jucIk22D/xm89yKoWzpyxPPH+SmU9qlDtTCmRPMWwdtTXWUKg9XdHLOqvI3REoYGgAGQleCedGnR88LXQVAnW6XudfUr1UeKYtB7cTb8NV6Q/luMmLToHKrM3pVnNmFdNdMDu/A9rgHMi/LMUe5F1i39JgaXBwxiY7wfNgju3Izw/hM/WCdMgzyPGx7WsfOu6dNZMNmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(1076003)(316002)(478600001)(33716001)(186003)(53546011)(26005)(85182001)(2906002)(9686003)(6486002)(8676002)(110136005)(5660300002)(4326008)(16526019)(86362001)(6496006)(83380400001)(66556008)(6666004)(8936002)(956004)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjBTNHk3dWJ3c1o1NVIzQ0Rnb3N6eVN2Zm1NdXVkSlVtVXl2VE0yeW5TeHE4?=
 =?utf-8?B?M1luVTdOak1SaEw4N1lLM2tFNzRzS1psSzkrWWdQT1h0YXhRTllWK2xmNUJr?=
 =?utf-8?B?TGVTcVdlVExMYkcyL1JLMTBqWGd5dm9qYVRGRUx5YlZ1TE0va1cxWjFMQy85?=
 =?utf-8?B?VkRzUDJicnMyTjVGWUpTdkF2UGtSVGxlWkNHR2N6MVJrVk5pSG5tZUt3YWI1?=
 =?utf-8?B?NGdOVnpGVXd6WGRTSkFQeFVOWDRmRVY5NVJvdkZWSDc2RnFQWXhwWkZ3R2E4?=
 =?utf-8?B?aXNjQkxpR05PRmgwdUU4RXJLU08wbHdDRnBlbG1iTEUrY2p3WCt1YzhzZ1FE?=
 =?utf-8?B?ZjdTMmx5V1liOE12R2oyVFdNMHRBVWwybnBpa2RMa2FEL2ozYXZGTjdOTENi?=
 =?utf-8?B?VngwU0gxQ2g1WTlSdmtIOTFXdktwWXBVZU4vc09JT1RkangvQzY3a3pOSFNk?=
 =?utf-8?B?VS9jMkpMaDZjRFFBUFBwSFBnUzJnRzYycTk5dXpTck0ycGNtNUw5ZFB0SDRN?=
 =?utf-8?B?NUQvN2w3ZUxFR3VLU0tqaWNCaUJ5YzhPVWdLMnlFWGJaSXJrbDJrcGpQcUlE?=
 =?utf-8?B?TkUzM1d6MkJNcXc2bHVZaTdGVXpQbXgvTERQWS9Td0lrVmRoaFNDMmxqMU01?=
 =?utf-8?B?Z1Q1S1dkbUZob3hJRWh6N1ZQM3c5UzIxRFQ3MnUrVnFZWVI0QmhFM1RuZVlN?=
 =?utf-8?B?Vm16bm5tNzJBc3NQbzZrblBuemJVSFlyWGlOa0dsOTJMNDFtaklESU1sZjJ4?=
 =?utf-8?B?QmUvMGgrdm10dUdOZjhzdG53a2VteHAyRG0ybHpXWVBUTnhkaU9JazFIWTA4?=
 =?utf-8?B?L0QxWUNJYmNUclFVQ1R1UkJIQ0dhWFgwU1JoSGtHOUw4NkM3bmFHM3lreERE?=
 =?utf-8?B?OUg2MXhGRXhlT1dPdFl1TlpBeDI0R3VsaTg3clZZaDhlTzZqVE5RYVVSb1dW?=
 =?utf-8?B?TWlVbkdTa1Evdk5HVlE2ejN5VCtxRTFWYzdQanpLdU8xNXV5OGhNYXpWQWd1?=
 =?utf-8?B?NW14eUNobU0zY0l5YWlySXgvMFhjMzBoT0p3TGZOZ3VzYWFabGk1aUdsYmd4?=
 =?utf-8?B?T0luQVZjcW00UjZ0TllOREFHYXhnaXlFMG1TbERSSDg4ZitLTU1IS0orcWVj?=
 =?utf-8?B?bmpXa1pabjhBbFQ3bmE2b3kxZjZUcVBFYzROdGdHbW1aaEdpaS82cFV1ajlU?=
 =?utf-8?B?eVVhcGFNSEEvS0dhWG9YMVR3MTlJN2lzWW1wOVJ6R0I5QmhwcGN1bkhqN0tE?=
 =?utf-8?B?Tm5CaE9TaElVZ0xuVzVLK3lYQW9BeW1vNGtRSi96TjBZSVZFeUtpcjVkbmNF?=
 =?utf-8?Q?WSDr+s82i7A3fP1u9Wlk7ewclxTZhbrlD1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf07110-4c30-412f-3078-08d8bc6f15fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 11:40:57.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+UJRNPdWHh7916h4orGCsdpfAXUdgT40CSCLRceKjcucasGOQmoJVILMUsJLliqoDRAudY9dfYvf3lmXDAi8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2715
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 11:16:06AM +0000, Andrew Cooper wrote:
> On 19/01/2021 11:14, Roger Pau Monné wrote:
> > On Mon, Jan 18, 2021 at 05:48:37PM +0000, Andrew Cooper wrote:
> >> On 18/01/2021 17:10, Roger Pau Monné wrote:
> >>> On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
> >>>> On 18.01.2021 16:54, Roger Pau Monné wrote:
> >>>>> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
> >>>>>> On 15.01.2021 16:01, Roger Pau Monne wrote:
> >>>>>>> --- a/xen/arch/x86/traps.c
> >>>>>>> +++ b/xen/arch/x86/traps.c
> >>>>>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
> >>>>>>>  
> >>>>>>>          /*
> >>>>>>> -         * Indicate that memory mapped from other domains (either grants or
> >>>>>>> -         * foreign pages) has valid IOMMU entries.
> >>>>>>> +         * Unconditionally set the flag to indicate this version of Xen has
> >>>>>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
> >>>>>>>           */
> >>>>>>> -        if ( is_iommu_enabled(d) )
> >>>>>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>>>>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> >>>>>> ... try to clarify the "Unconditionally" here?
> >>>>> I guess Unconditionally doesn't make much sense, so would be better to
> >>>>> start the sentence with 'Set ...' instead?
> >>>> Hmm, this would further move us away from the goal of the comment
> >>>> making sufficiently clear that a conditional shouldn't be (re-)
> >>>> introduced here, I would think. Since I can't seem to think of a
> >>>> good way to express this more briefly than in the description,
> >>>> and if maybe you can't either, perhaps there's no choice then to
> >>>> leave it as is, hoping that people would look at the commit before
> >>>> proposing a further change here.
> >>> /*
> >>>  * Unconditionally set the flag to indicate this version of Xen has
> >>>  * been fixed to create IOMMU mappings for grant/foreign maps.
> >>>  *
> >>>  * NB: this flag shouldn't be made conditional on IOMMU presence, as
> >>>  * it could force guests to resort to using bounce buffers when using
> >>>  * grant/foreign maps with devices.
> >>>  */
> >>>
> >>> Would be better? (albeit too verbose maybe).
> >> The comment should be rather more direct.
> >>
> >> 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
> >> mapping, and forgot to honour the guest's request.
> >> 2) 4.11 (and presumably backports) fixed the bug, so the map hypercall
> >> actually did what the guest asked.
> >> 3) To work around the bug, guests must bounce buffer all DMA, because it
> >> doesn't know whether the DMA is originating from an emulated or a real
> >> device.
> >> 4) This flag tells guests it is safe not to bounce-buffer all DMA to
> >> work around the bug.
> > /*
> >  * Old versions of Xen are broken when creating grant/foreign maps,
> >  * and will never create IOMMU entries for such mappings. This was
> >  * fixed in later versions of Xen, but guests wanting to work on
> >  * unpatched versions will need to use a bounce buffer in order to
> >  * avoid sending grant/foreign maps to devices. Whether such bounce
> >  * buffer mechanism is not needed is indicated by the presence of the
> >  * following CPUID flag.
> >  */
> >
> > Does that seem better?
> 
> Better, but the key point is that all DMA, emulated or real, needs
> bounce buffering because the guest kernel doesn't know the difference. 
> *This* is why the flag needs to be always present, because otherwise a
> guest will bounce buffer DMA for emulated devices.

I think this is clear from the text as I explicitly say 'devices'
(not emulated or passed through devices).

/*
 * Old versions of Xen are broken when creating grant/foreign maps,
 * and will never create IOMMU entries for such mappings. This was
 * fixed in later versions of Xen, but guests wanting to work on
 * unpatched versions will need to use a bounce buffer in order to
 * avoid sending grant/foreign maps to devices. Whether such bounce
 * buffer mechanism is not needed is indicated by the presence of the
 * following CPUID flag. Not exposing the flag will force guests to
 * fallback to bounce buffering when sending grant/foreign maps to any
 * device.
 */

If not I don't mind just using the list that you provided if Jan
agrees.

Thanks, Roger.

