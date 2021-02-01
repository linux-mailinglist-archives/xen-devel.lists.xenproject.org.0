Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC330A738
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79814.145396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Xzw-0007Sh-JL; Mon, 01 Feb 2021 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79814.145396; Mon, 01 Feb 2021 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Xzw-0007SI-G7; Mon, 01 Feb 2021 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 79814;
 Mon, 01 Feb 2021 12:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6Xzu-0007SD-Iy
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:08:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adbf6bf6-3d7c-45d3-a573-edb4819fdff5;
 Mon, 01 Feb 2021 12:08:01 +0000 (UTC)
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
X-Inumbo-ID: adbf6bf6-3d7c-45d3-a573-edb4819fdff5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612181280;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=E9iLSbZmHnemEGyhvYtVBHSgurnKxfn2YJu+Cxe7LwI=;
  b=ZQhRSQD8q3XYLz30frceFXI3Uy7Nvtav1XUCdhVJ5UGYvZU0PW/SVp/R
   Tv5mEfJ94MUXJSyJFWz3rp0kXrh5D7TD9JJa+qM89oDa6GU6YYTSxH8fb
   VgQCZc4ykta64aUyyjHMELTK9foyitwRlfDrjP0y9Y80ehsvAjXPLpAep
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V/WQQrj5SSNsqL5z11Pn278BGGzI+5QjT7YQvBAbLUYFJ6fWhC85fBYkzYDn4z/wUoeXGaRyct
 snD/DQ9KJXl/PvR9hivbLZpof0D2GQNJRg8mTbyF+GeyWtvfLy5IBzlYphKsJffkMCvh48+sCu
 EPA/mX761kEAfMmC+BQfwnBDgrhtvKR7BMKFxyz2aVRK0ysdq0sJFvNZVXf32sCPT+WUVxxpao
 38TcnJG/zQhyhYhKEQjaOEcqkwBk7F/uwwh3kRm25kYxd2iKr8xbe+8qOb4OiGoF5QLMurmEvF
 Cco=
X-SBRS: 5.2
X-MesageID: 36308068
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36308068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZrkt3zJbyUIylDbEMz3rT9/MPU+VFPWYmZQL0+A2Uqy7+s0owCnKgN7vB2tDmQP1vqH61rq4EI7MxhgsIZsZp2dt5Zd2QwbADoUVAhZ/xUDgLIzOvMLKfC/a2+DYKUTbiTKG8DTaB1nTeqEkrFSiZG/ngKea1xqvVCugZCSZ12sQKl/ujOm4JcS9pDaBauITdRyMZnI9qLqp7aFUyfzmAiLYHVbhwux23FDL/roCBTeZ5tm4MzqMLUvsYB1P/AV16xdqYfgtYG0cjKpYHox9+3eCnj4aHmEF+4m8h+zlZEQwdiyxLovzv1wSokKsWH/cy4Pr9pdM1QFWy7fXmf0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsO+Z8PnyvvynhfefiMZE7vKd2VJ+d5vXrtaFXjO5Vo=;
 b=aTtR9cE3oT/iEuvTKY1kwPcP5k8fR5sv/BL8s6y+/265LKTmvTR4vVaHT2+Y4wHunry6GPR8ltZYi+sEOsNa47DffXrgVGIj75Ie9SgioHiGiwjGE2lfS11Dn5NkaxD0kjFJ6lBlfPQpABgiQ+YPb7Cx22cwavZyPRPyldKnVwduWYs6aHoRTvFhA17Ti1DYsbaB1YUr/G8+LNQBwUCW7IM1Fai0LGBLaHrkYvQEcqyi6Zy2VrCPnHntkqfNlzzov0su1rVtAW21uyHjgTkS8KTVYpnZq3KjHwd7vQpdeF1VC6DHv7JKp2RP8WT8mm9oFIXqzZPUq+p6RKG+FAiygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsO+Z8PnyvvynhfefiMZE7vKd2VJ+d5vXrtaFXjO5Vo=;
 b=VpG4rqgZLTIJbRI6995wB1MHv4tMxTgxPz/qigR4mxJ7flKiODCa9F+oSgW1N3Ah5s5kgHeh3qNIoODFPaDfbaIYd7u7YbVvWTNZtK42ubjdEGwxCuSlIr56DEtbgZbbyA0OI7nWtS6R+o1nxf4JnuGynKzvrRh1s7nVGqwN9gM=
Date: Mon, 1 Feb 2021 13:07:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	"Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
Message-ID: <YBfvGKkQWSisFHNs@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
 <YBfTpTzi+wo7AFSH@Air-de-Roger>
 <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
X-ClientProxiedBy: MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccb84ef4-acef-488e-4cc9-08d8c6aa02fa
X-MS-TrafficTypeDiagnostic: DM6PR03MB3916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39160790A74FD0AFFDA21A1E8FB69@DM6PR03MB3916.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZbyHhUlGtPQPuEZ4R3x7Fc8e7kjGXm1PfGFaCbTrYhkiAk/FZKtr4wCVat9AzJPJILVUexuRt+20hHmgc6oXcOGsB3mQiU9omvo3dmDrdnQTZekTUvr2FR0S2IaTFZtlJvzndUhMOk9OcDHn2oh9f1g8BXQCPZ7841o4HIWahOzy2b+Ij27hQvLAZbwM9avdQHumHO3Cpf157I+BHtKyIe0XE2CAw4E5KmJ0aelqm3rujeelK1RBqu+ayYUudBgXLawI4MsstVPWYKEvsMjPEairo3Tqo4fdbxnw6H05PGwXvwD4lhunzZ/62ijVrltdfHIhRZp15lb6LF/pF8ERQEfYjMhjzdmpfZqt2YMmHp8SK9QycYlwGp3+IPHuoTetKYlljDr2efsLZNUdWZ4mTCJQ0xkFRQlxVCfvB72umUp9FaTMwRoTIsWtq91NlMh8EhuhmCSn/mrQihSeIH2311qVrsbEHG+VR/jU4Xfxb5WT4bwcLJ6wD7oVL2PfcMOBMABVBMA5SL0EiEXLuSS7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(7416002)(66476007)(316002)(16526019)(186003)(9686003)(53546011)(956004)(66946007)(6496006)(33716001)(8676002)(478600001)(26005)(85182001)(66556008)(5660300002)(6862004)(86362001)(83380400001)(4326008)(2906002)(6486002)(6636002)(6666004)(54906003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTZ0SWZZMmdRSVh1V1ArbzBvSzgxY2ZRQ1Y1WlVXUmM0dWRiNWljalZqZnlL?=
 =?utf-8?B?MkhISVdrVGc2TU5pSzVSS1pjSDNUNUViT3dSanVodUtqS2pybVpEL05jRFdu?=
 =?utf-8?B?RFM0WmkxYVV6VjlpUGNCKzlVK1MzKzRsTktSOXZudEJpNHUzYTVEQUxHMUhD?=
 =?utf-8?B?Q0YvdGNJNXJSdEYrYnIvQ0hvNzlGK2xyN2VHdzhxWHl3QmROUlZYSXBMZ2lp?=
 =?utf-8?B?K25kUWlLVEMrRVVuVmNmQ0dHUnlUdm52V1AvRWc4cjM2UXRYSE8yTnpDVU9R?=
 =?utf-8?B?OXQ1SEJINUxMR3YyVVRQaHFNQndrVHNuejhXQkllTVF2U2Q3d3N5am9yRFJW?=
 =?utf-8?B?WXNxbStPMjIveUdkeWRYaGFtV1BOZUtZM1Q2WE52NTZOWTNCYnFna05BdTJp?=
 =?utf-8?B?R1YvYXd4QlpNbnkzZ3QwVGFiWVRVWFRsS1RhSGxyTk5MRy9lTXhSWk5zaTNK?=
 =?utf-8?B?bXQvNllmVjZnQy9mS05UT0E1Uyt0Y1JxSVovMU5JcE9hSXRLMnFOdUpsRm12?=
 =?utf-8?B?bnc0aVdpV3RiR2dUbHZWbFZrVHVlNkVzS0FpRkdBcWd5aDI3SDZKZm9zMFpT?=
 =?utf-8?B?bzFNTVVyUWtCdkc3eTV6ZUJ2L3VLVElGUU5zakJ2aWIxODhFVW0yWUVJYjI1?=
 =?utf-8?B?V2swMHF4MTN2TzlhSjdwVkRFT0pYL0w3WFd1U3NmV0llNWNVQkpZRmZwWlE1?=
 =?utf-8?B?QzFKS1dlSkZhRFRSOS9wSFRJWVVDNHR5OE9NMUExTmdXcnlqU3FHWFB5L24r?=
 =?utf-8?B?b3pZK0RCOEtkSWhSZnFHeHl6YTRPWnAzdmNucmdYSUN3WmlUcWFQeERiRk1v?=
 =?utf-8?B?ZE54cFZtN3ZhMGFJRkJsUVI3emFrcit2UzFVWG9nbURGeVp5Skx5RzRuTHZU?=
 =?utf-8?B?YTkvS2NnRmhMQkp4Um53QlBWcHlNeVdNeldmck8yLzJVY2NyZytjMURjbWpV?=
 =?utf-8?B?U1Z4M0xuNk5vM3MxOXUyQXpvTDkwTkl3cmllTm1ZTzcrRW90YjROVGY3U3hE?=
 =?utf-8?B?SzgwL3QwRC9oU0F4RUxiS3JpV3RMejBDdEdHOXhlY3J6ZklSYTdXaWpaem92?=
 =?utf-8?B?eHRHcWttVUxScE1hcWF2OGdtT0Z3MVBiL1BiRFVNQ2xZWkt1SGhuOGoyYlRX?=
 =?utf-8?B?LzRuZk43a1M0MmVTOTFLQzcvWFdHQ3lPQlBJMW1mZ2l0ZkNPUjdwRjRGdVox?=
 =?utf-8?B?K0JGbTZWcWJTOU1BVjJiN0JBYWc2WmxEeS9SSGFsT1NqOW9HdlFDT0p4c3R1?=
 =?utf-8?B?a3orMEZxVE9tMytUQUZiRFovaXlxV1FLMzFJNHVFVnI2REpDUDlxN1U4ZHkv?=
 =?utf-8?B?eDBwMXdjOG5zYVhjWWhpZ3JSNFZyZ2g5Z0dMMDJQVjlMVldqTEpxTm9yYUZC?=
 =?utf-8?B?ODNobENyeWZ0QjcwZDJaZko3ZW9Wc0FLTlVBNHEwSk5DL08xTVpEMmpDbWNW?=
 =?utf-8?B?ZUhPL0I2T1EwQmpubGVydEVXNlZ5WmxxbG9kWnhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb84ef4-acef-488e-4cc9-08d8c6aa02fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 12:07:57.0648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjdTYSgucwMavbaW2DE05MPpMIxWjhY+Gd83jDnnZW5ilMdNEm6+mCQNawOQqDFjhJvCOw0ISRSbhw0KDaS+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3916
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 11:11:37AM +0000, Andrew Cooper wrote:
> On 01/02/2021 10:10, Roger Pau Monné wrote:
> > On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
> >> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> >> +                    sizeof(*xen_frame_list);
> >> +
> >> +                if ( start_extent >= cmp.mar.nr_frames )
> >> +                    return -EINVAL;
> >> +
> >> +                /*
> >> +                 * Adjust nat to account for work done on previous
> >> +                 * continuations, leaving cmp pristine.  Hide the continaution
> >> +                 * from the native code to prevent double accounting.
> >> +                 */
> >> +                nat.mar->nr_frames -= start_extent;
> >> +                nat.mar->frame += start_extent;
> >> +                cmd &= MEMOP_CMD_MASK;
> >> +
> >> +                /*
> >> +                 * If there are two many frames to fit within the xlat buffer,
> >> +                 * we'll need to loop to marshal them all.
> >> +                 */
> >> +                nat.mar->nr_frames = min(nat.mar->nr_frames, xlat_max_frames);
> >> +
> >>                  /*
> >>                   * frame_list is an input for translated guests, and an output
> >>                   * for untranslated guests.  Only copy in for translated guests.
> >> @@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
> >>                                               cmp.mar.nr_frames) ||
> >>                           __copy_from_compat_offset(
> >>                               compat_frame_list, cmp.mar.frame_list,
> >> -                             0, cmp.mar.nr_frames) )
> >> +                             start_extent, nat.mar->nr_frames) )
> >>                          return -EFAULT;
> >>  
> >>                      /*
> >>                       * Iterate backwards over compat_frame_list[] expanding
> >>                       * compat_pfn_t to xen_pfn_t in place.
> >>                       */
> >> -                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
> >> +                    for ( int x = nat.mar->nr_frames - 1; x >= 0; --x )
> >>                          xen_frame_list[x] = compat_frame_list[x];
> > Unrelated question, but I don't really see the point of iterating
> > backwards, wouldn't it be easy to use use the existing 'i' loop
> > counter and for a for ( i = 0; i <  nat.mar->nr_frames; i++ )?
> >
> > (Not that you need to fix it here, just curious about why we use that
> > construct instead).
> 
> Iterating backwards is totally critical.
> 
> xen_frame_list and compat_frame_list are the same numerical pointer. 
> We've just filled it 50% full with compat_pfn_t's, and need to turn
> these into xen_pfn_t's which are double the size.
> 
> Iterating forwards would clobber every entry but the first.

Oh, I didn't realize they point to the same address. A comment would
help (not that you need to add it now).

> >
> >>                  }
> >>              }
> >> @@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
> >>          case XENMEM_acquire_resource:
> >>          {
> >>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
> >> +            unsigned int done;
> >>  
> >>              if ( compat_handle_is_null(cmp.mar.frame_list) )
> >>              {
> >> +                ASSERT(split == 0 && rc == 0);
> >>                  if ( __copy_field_to_guest(
> >>                           guest_handle_cast(compat,
> >>                                             compat_mem_acquire_resource_t),
> >> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
> >>                  break;
> >>              }
> >>  
> >> +            if ( split < 0 )
> >> +            {
> >> +                /* Continuation occurred. */
> >> +                ASSERT(rc != XENMEM_acquire_resource);
> >> +                done = cmd >> MEMOP_EXTENT_SHIFT;
> >> +            }
> >> +            else
> >> +            {
> >> +                /* No continuation. */
> >> +                ASSERT(rc == 0);
> >> +                done = nat.mar->nr_frames;
> >> +            }
> >> +
> >> +            ASSERT(done <= nat.mar->nr_frames);
> >> +
> >>              /*
> >>               * frame_list is an input for translated guests, and an output for
> >>               * untranslated guests.  Only copy out for untranslated guests.
> >> @@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
> >>                   */
> >>                  BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
> >>  
> >> -                for ( i = 0; i < cmp.mar.nr_frames; i++ )
> >> +                for ( i = 0; i < done; i++ )
> >>                  {
> >>                      compat_pfn_t frame = xen_frame_list[i];
> >>  
> >> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
> >>                      compat_frame_list[i] = frame;
> >>                  }
> >>  
> >> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
> >> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
> >>                                               compat_frame_list,
> >> -                                             cmp.mar.nr_frames) )
> >> +                                             done) )
> >>                      return -EFAULT;
> > Is it fine to return with a possibly pending continuation already
> > encoded here?
> >
> > Other places seem to crash the domain when that happens.
> 
> Hmm.  This is all a total mess.  (Elsewhere the error handling is also
> broken - a caller who receives an error can't figure out how to recover)
> 
> But yes - I think you're right - the only thing we can do here is `goto
> crash;` and woe betide any 32bit kernel which passes a pointer to a
> read-only buffer.

With that added:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

