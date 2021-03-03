Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE732B8FE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 16:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92885.175120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTb1-00037H-5V; Wed, 03 Mar 2021 15:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92885.175120; Wed, 03 Mar 2021 15:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTb1-00036r-26; Wed, 03 Mar 2021 15:39:31 +0000
Received: by outflank-mailman (input) for mailman id 92885;
 Wed, 03 Mar 2021 15:39:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHTaz-00036m-Ab
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 15:39:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86d6db25-f9a6-463d-ad70-44b21dd5eb80;
 Wed, 03 Mar 2021 15:39:27 +0000 (UTC)
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
X-Inumbo-ID: 86d6db25-f9a6-463d-ad70-44b21dd5eb80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614785967;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5WqOM5a7AgG0CkA3zpuMcvBDUKpT/78Kaja3BhtQ+HE=;
  b=SU08M8SUKgLD4YJd9ngWuezC1/fNkwIAcJfiYE972smCgS8jPvqPH2/7
   hvnxFo2Mt+6PgJhhxqWH09/J0tRZxY+8uld8EboiewJpDjQxbXeGxKKlX
   0OpmPvz7v3yX0dQZd2EAlBAq+eVPWCUJCwIciQZ6+5N7rRjOuJfhXHDTO
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lO3lmTKz5xh03vy0Gh7lf9hYgXTeObTXGw6X5rOOPeQmcQuKnVkM96E6OEgxt3axzp2T9oq92T
 3EVc7s++7bTXgzrLh9+NtsgDy+xXHoEd26fw+zDeIoTnJvTrzjHyD5tXKtxeiKiBjWSxBtLQor
 TPBKpbqz+2ANVZ3K4/uHKe0KYheiadOaiP35C6UBB3TX4uGWRVIVYqIFTHowH1oK1W1SwQzBgy
 gZTpMbvIP89fViUuAL1X5wnK9YWXIEH+WjhjMxBktpl95X47nrDydIy4vvjoXQIjAAd4t8YEvN
 fPY=
X-SBRS: 5.2
X-MesageID: 39847576
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,220,1610427600"; 
   d="scan'208";a="39847576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvswhddtmLDJaAoSnJHn7WRmK/JgzsTdrl5gVWVrKC7KUz4b9lt/UxA5zRAk25NeA6ZUo5FUZ93VgswD1Rg9qHcDUNUk3E1VpYsTIUKlQDwCia/p6kkxjAsoG/5QzJyZunvCsuCFHXRo6vXDpj0DjgZyicNLdvMQf7k+d+17Ndav7yaKwvuoy/xBdCBWsvRE/mn9qG4C9d0oaBJWljeWscFriZAzM8Xp193hjzcKN8x+YYMwL7/dBzjoTgVqIK1BR1/PbpRXv9cg3G2cL/N/XfNEGe1u8EqCT90pn9GlOBqiMmWPHC29aFOk5+lZ3B42CbdYdStQ0kZ+pSo/d84TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFkGrp1LEur/92qyuJerjH8KSSFT0YAAEpNUTFcxPgE=;
 b=HL2uaGW7Zw+pPN+dzb9P90qHzxq06b6AnPuOTlpbz75KNzyiVnkrFcVpO8ZiB3Ex6AeZacd92bntDyVlNQnDqzgxFnWgQjjItDByCujKbNpN3v2rMeylaq9amGlp+n7hjB6jmVnzCFkgCpueIYfdIVig/oJmxYviJ9IYDkXe2/dqJQyTsHmzIFoulyN4lnEgWt6xpogSs2dwXrjgkCgT9qKBYyhVc4ClQRW8zcHFBHOQn3ie2f+YeyiTD/7PT5h2d3DiXdTYdaERIvF9BUW++M8QbPo81uO2KCJwtl714l5gDHvYEfNMaBpNibtXVmmx5JPbTI/LYT1JFKPprpwMCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFkGrp1LEur/92qyuJerjH8KSSFT0YAAEpNUTFcxPgE=;
 b=CorstVwFJG/WPNMSNaVK73KpIisg47HT5cYZcIf8mx4QMbwxAgZqDrDy5reVwsT0MKPzXBv7pyW7AdPwKqbw2CcXQSA0LFjtcGQo6uAxPyuTqkrQ1N56VHWXFJY/n5zB6GDtQzzGe8C60cnHGYFh/cd3h3uhKwGEGJNke5upq38=
Date: Wed, 3 Mar 2021 16:38:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
Message-ID: <YD+teWWbeu0XDhqm@Air-de-Roger>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
 <YD5TBSwZWzjlwGxD@Air-de-Roger>
 <62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
X-ClientProxiedBy: PR1PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cca290f-6943-4df8-f912-08d8de5a6aad
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4843A9406FBEC7475022C2398F989@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMCJdoUQgVfS0PgweYf0xOAe8kxIvxTidB6mLnKjk0ciOT1FNrTOuvWyqgV0U1VatudGCFQqktL50P/S/E5id0EA1LV/8rtMKJ2PK+DmXHLtrl3mG68wN0KxEzbBzGbbTndt2ZmKUoyli/g2ukI+kEif//rJ3hEcQY0Ngqv8F3ONHC3acHeQbBJGYBrDW9cPQK1AEH1jNk1bhmJ3jZOS06o/1CxaYQa+7iuih4njKXdd1OjlfLJMdzBvrwJ4iGnOdWMpJVvd8vIbz/jbO38O0Z/puDtm4/LJ23qFYn1olVZK7olqxiAfVqjWs4AVZamIl0v/387Xj+iZQ3xM7z67pDey8hBCurokJWYX2F7nOWQjzm/5Qa05qRroJxQqpx0MeYEbK1HEiQQ8Naifh54jAjZogtt8mv5lEy/b1UpkLUjnTYvmu0besodCcmyMgl7FbAIE+VIst2a0KhCsf2Q7z2cOCEIG1dMI1n111KRAYkIKAndvBmaS3LwT2AhP33jSA6Ng3EFhhYJ+B/bEsXzrPNXWJXUo9uecfN2Ilq3Pc+PIvEZ9iieCVTHYql6OSc6NSC+AD/cFppa/OXW7OlXxqU2dA0GJHdCMyu10SnCmYDijz44ojZPCKYk0V5H0e/FEUvF0Y26UnPcGakWRSSKmNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(39860400002)(376002)(366004)(396003)(110136005)(5660300002)(316002)(186003)(8676002)(66476007)(83380400001)(6666004)(8936002)(86362001)(53546011)(26005)(16526019)(54906003)(6496006)(4326008)(956004)(9686003)(85182001)(66946007)(2906002)(478600001)(966005)(33716001)(66556008)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blp3Njdic3lIUVYrclBCNEtZcmkzYjRRcnl3SnZHd3RvZTBjSDA5YjRmbmRV?=
 =?utf-8?B?SE9uSDhWRERxQVR2WnVOYzkzcUNtdWU3WkhwSzZRQWxuU3NwcHE4NElsODdQ?=
 =?utf-8?B?TUNzZnZ3b0h5aTEyVjNubU5hbmFWOVUwT2tyUlBnc2F5eE1LRGc1cHZFY29u?=
 =?utf-8?B?MEx5elBVeDd5N1FlNUNNdlRnTS91TVYycjVEZHhTRkYrbHpha1lXby9BaGt6?=
 =?utf-8?B?MUZlMGtTUWV4QUlqU2dwbXJ1ZnRPWmNyUnRCdERxUzVNYW1Xd1lmbWo2TzNi?=
 =?utf-8?B?bm1Id2Zyb0t6ZFc2Qy9VS2ZoWFRKRU1weC8ybktPVVFINTh1UkErNjc2c0Uz?=
 =?utf-8?B?YWdna0ZqZzJCQmQ2bzhWWWFTUS82YVk0eHVTNEkyZVlZSWFZV1NxUXFMMW55?=
 =?utf-8?B?OVM5OHIzRFRYTXhZT0F6eDBiUzJVMTdUWWZGOTduMzJ0VHZNZUlJS3ZtczBs?=
 =?utf-8?B?NFdmUHZBU0hxTytmRlFWSTY5NkxnZGhsQnd0cm5VNnY4YXRGRTVoaDljVE9T?=
 =?utf-8?B?Q0J3M0VsdWdUOWV1aUY0WUlLWG9GbjM2UjVwOG9teGVlNnRLNzN3K01nbERx?=
 =?utf-8?B?akdyTE1GWGxOQVk0bUhZUXQ3QUJ2VkRiTXhxcElUWEVNMGd4QVZQRHR2N1dP?=
 =?utf-8?B?ZDduSllqUXNKU2krZnVOUC8xN0tkclRRUnpWMlBFS0J0d2ZqU3NETTNNOXpP?=
 =?utf-8?B?WjhEZTlzVVlmWmNXNURiTkhPZEJCNlIzZUdQWVZ5dW56b0FKNW04RmtMRm9h?=
 =?utf-8?B?RVdISFVCZHBYWGFIOG54ZFpJUnFBUm9uSWlVSkE0OEllc2xVUVV4WWZMODRV?=
 =?utf-8?B?VXorRzRoU3k4a0k5RDVDRm04Y1VLVGxlNVdHT1NPcTl0R3EzMy9jRzMxQW5n?=
 =?utf-8?B?N05WTE5NOFlOcU5EaDFFMmVnTXozcHlOZm5OVFhpbEFsa0lZdklDTkEvQ2dw?=
 =?utf-8?B?N3lWWVYxeEdXTEdzSEE4OXRuT3N4WWFjWmkvZW5UWFNqM2J6Q0h3MXpxU011?=
 =?utf-8?B?VlMwUkp4c2c1SC8zS3o5N3FaU2VLamdNMnh4Vy9aNUdRdlVHWXBXSHdaNzdG?=
 =?utf-8?B?cWJOTU54MjdzclgzMGdBNEVPQ1h6aVNYL1NCVVkzcXdaVnFtWEtqWXI4WEd3?=
 =?utf-8?B?V09MbC91M0hYZnBqM3ZYL0k5ZzBDdmVKT1NsVzVoYy8xWFhGdXkwMXM3eXFi?=
 =?utf-8?B?WEloK3dkSjUwZElZb1Y5dksrVXZGckkzNVN6RSt2TGdDNVpVcVRLNUlQUVN3?=
 =?utf-8?B?MTRjUGs2R2RKdTBmVmRGdGZkTnR2T1hLd0wvampoSHJRUDhxeTkzZFl4OVFC?=
 =?utf-8?B?emRnLzUzcTVMcHBMeHBGTW1abFd3d3hKSjF5UElESTdIVjMvSGVLcFlWK1VI?=
 =?utf-8?B?eVdyaXlPbGp4K0Z4OVVxVEx5azdTTms4bGx4V0JWZUxYVXcwbGdadE4wNGpy?=
 =?utf-8?B?WmhoRjNLVTZwM1Frc3VlQVdDZ0hMWUs0NnJRbGVjdjd3TStWbEwxSHZ0L1N2?=
 =?utf-8?B?MHJtSzdOU2JiZDM0VTVrSmdKSFpnQUxhaEk3V25SWVJNU0hpWnNnNWlmYmZJ?=
 =?utf-8?B?NVJvSDhhaEZQMUJLdTc0VnlLYXpCd29ZMzgxM0dNL09CV25vWXc2a1BOOXd4?=
 =?utf-8?B?UklFQjBobzl2U0dtU0lDQlJ5UVVCajNKYnduZjR2UkFIODlqMEZuSE85YkV6?=
 =?utf-8?B?U1ljc21pRGZBOThyT0JrbDYrVmRvV0NycEdJbFJtY3dsU1o2NEs3NWFrNVh6?=
 =?utf-8?Q?llUWzL7r3QoegZsIlIvtxs9qX6sx2L5BFiwcdz8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cca290f-6943-4df8-f912-08d8de5a6aad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 15:38:39.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 215U1bCIELaqLaonSRjYRdPdn4EMmqI4xF6kiAGcf1NaLO/E5VkQQGGFeaqRERmZ8OWegsx2eWh1fon2G0Tw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Tue, Mar 02, 2021 at 04:18:59PM +0100, Jan Beulich wrote:
> On 02.03.2021 16:00, Roger Pau Monné wrote:
> > On Tue, Mar 02, 2021 at 12:16:12PM +0100, Jan Beulich wrote:
> >> On 01.03.2021 17:23, Roger Pau Monne wrote:
> >>> RFC because there's still some debate as to how we should solve the
> >>> MSR issue, this is one possible way, but IMO we need to make a
> >>> decision soon-ish because of the release timeline.
> >>
> >> Generally I think it would be far better from a user pov if
> >> things worked out of the box, at least in cases where it can be
> >> made work. Arguably for Solaris this isn't going to be possible
> >> (leaving aside the non-option of fully returning back to original
> >> behavior), but for the old-Linux-PV case I still think my proposed
> >> change is better in this regard. I realize Andrew said (on irc)
> >> that this is making the behavior even weaker. I take a different
> >> perspective: Considering a guest will install exception handlers
> >> at some point, I continue to fail to see what good it will do to
> >> try to inject a #GP(0) when we know the guest will die because of
> >> not having a handler registered just yet. It is a kernel flaw,
> >> yes, but they ended up living with it merely because of our odd
> >> prior behavior, so we can't put all the blame on them.
> > 
> > My concern with this would mostly be with newer guests, in the sense
> > that people could come to rely on this behavior of not injecting a
> > #GP if the handler is not setup, which I think we should try to avoid.
> > 
> > One option would be to introduce a feature that could be used in the
> > elfnotes to signal that the kernel doesn't require such workarounds
> > for MSR #GP handling, maybe:
> > 
> > /*
> >  * Signal that the kernel doesn't require suppressing the #GP on
> >  * unknown MSR accesses if the handler is not setup. New kernels
> >  * should always have this set.
> >  */
> > #define XENFEAT_msr_early_gp   16
> > 
> > We could try to backport this on the Linux kernel as far as we can
> > that we know it's safe to do so.
> 
> I too did consider something like this. While I'm not opposed, it
> effectively requires well-behaved consumers who haven't been well-
> behaved in the past.
> 
> > If this is not acceptable then I guess your solution is fine. Arguably
> > PV has it's own (weird) architecture, in which it might be safe to say
> > that no #GP will be injected as a result of a MSR access unless the
> > handler is setup. Ideally we should document this behaviour somewhere.
> > 
> > Maybe we could add a rdmsr_safe to your path akin to what's done
> > here?
> 
> Probably. Would need trying out on the affected older version,
> just like ...
> 
> >>> --- a/docs/man/xl.cfg.5.pod.in
> >>> +++ b/docs/man/xl.cfg.5.pod.in
> >>> @@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
> >>>  
> >>>  =back
> >>>  
> >>> +=item B<msr_legacy_handling=BOOLEAN>
> >>> +
> >>> +Select whether to use the legacy behaviour for accesses to MSRs not explicitly
> >>> +handled by Xen instead of injecting a #GP to the guest.  Such legacy access
> >>> +mode will force Xen to replicate the behaviour from the hardware it's currently
> >>> +running on in order to decide whether a #GP is injected to the guest.  Note
> >>> +that the guest is never allowed access to unhandled MSRs, this option only
> >>> +changes whether a #GP might be injected or not.
> >>
> >> This description is appropriate for reads, but not for writes:
> >> Whether a write would fault can only be known by trying a write,
> >> yet for safety reasons we can't risk doing more than a read. An
> >> option might be to make writes fault is the to be written value
> >> differs from that which the probing read has returned (i.e. the
> >> same condition which originally had caused a log message to appear
> >> in 4.14 for PV guests).
> > 
> > Read values for unhandled MSRs will always be 0 with the proposed
> > code, so we would inject a #GP to the guest for any write attempt to
> > unhandled MSRs with a value different than 0.
> > 
> > Maybe we should just inject a #GP to the guest for any attempts to
> > write to unhandled MSRs?
> 
> ... doing this would need to. Iirc I did add the write side of the
> handling in my patch just for symmetry. I'd prefer handling to be
> symmetric, but I can see why we may not want it to be so.

Kind of in the wrong context, but I will reply here because it's the
last message related to the MSR stuff.

Jan: would you be fine with modifying your path to not change the
behaviour for writes (ie: always inject #GP to the guest for unhandled
accesses), and then add a rdmsr_safe to the read path in order to
decide whether to inject a #GP to the guest even if the #GP handler is
not setup?

I can modify the option introduced on this patch to always inject #GP
on unhandled writes and only inject #GP on reads if the physical MSR
access on the hardware also triggers a #GP. HVM guests with broken
behavior will require having the option enabled in order to work,
but I think that's likely OK as long term we expect all HVM guests to
be well behaved.

My main worry with this approach is that we end up requiring half of
the common HVM guests OSes to have the 'legacy MSR handling' option
enabled in order to work. I think it's unlikely for this to happen, as
we are only aware of Solaris requiring it at the moment.

It also raises the question whether we will allow any more exceptions
to the MSR policy, like we did for Windows and OpenBSD in:

http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=ca88a43e660c75796656a544e54a648c60d26ef0
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4175fd3ccd17face664036fa98e9329aa317f7b6

Or if we are just going to require those guests to enable the legacy
MSR handling instead.

Thanks, Roger.

