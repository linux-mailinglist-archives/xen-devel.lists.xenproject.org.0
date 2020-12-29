Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1D2E6FC1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 11:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59796.104845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCdr-0007pK-3Y; Tue, 29 Dec 2020 10:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59796.104845; Tue, 29 Dec 2020 10:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCdq-0007ou-Vc; Tue, 29 Dec 2020 10:54:14 +0000
Received: by outflank-mailman (input) for mailman id 59796;
 Tue, 29 Dec 2020 10:54:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuCdp-0007om-HU
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 10:54:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f17ff5e8-cdfa-47e8-82a1-03f4ace883de;
 Tue, 29 Dec 2020 10:54:12 +0000 (UTC)
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
X-Inumbo-ID: f17ff5e8-cdfa-47e8-82a1-03f4ace883de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609239252;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=819dp/zadN0UThaSLGO9MpJZce1ISBnOb2eyEqIu0P0=;
  b=P98U6s7sTLRVWpNTk9XTFBsGlLgOygRbPxEw6EYgxQTO4Xjf9JCSVQgV
   UTtVy6x+rUoxofHb8wz6+mL1+udyZTQ8R/+b9uoPuaJAluDDQYdB8tx2n
   6Tmc+HOuOJlTfifOuHJcN21NFdkUj/DQ/BfZvSQsvT9Tq3Vaikc2Poi1J
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M5+AZBmv/tvFfhg+qCnei6Wgc2MWOBK8L8bfcRHpnsvZdLf3kTjW9pU2lin9Ps73Rc1pbeE4MG
 jv4N32oFPxseUfvrd1rMr8nLN5MuF9PY8hLKOMY4E6/LH5cxyyOAVxM6O2e2T31bRRyBGRPXTY
 t6Gok2MmVjzGJmQ3W5U7+NT7YGK7pa0cGn8WA/NBnY3HNad0fYRge4S2kOq9k147PzUYINOKX6
 vmL1smEj6ov1aqv/QrjOc/WNug0AEubtPZJK8LYLlro5nB2iTQzIcEAURagF5unr4koYfRYzP8
 y2s=
X-SBRS: 5.2
X-MesageID: 35335185
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="35335185"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOQbiJ84TJp4xv+lVYlY40jzYtfb3c+PPSbtvC8n3zbOOW+04Ms4Pbrl/dKNxWvKluROkz4m2QrhTKVM2fMKAEAJ/1zCSGHF9/MayMM7GsLj12/O2hnbkOsPKLAE1J0i1zqW3xDI+gAYR0vGGusvFZsWDk3nY3Rfbdh3MAQZ84pSn87zPJm9DBxFtGrVfuide86ggz/LsN7/Mu30qaQFtMXAMahKCxm8pmhKww4xIiBxM/Li509n41Mn/sDLtBJRGOP4NJwo5Phwb0PpEgBTkKSZojYZX1gd0A3R+TqCcFUIfV76/SMxM4+X3Oy33SeT2L8Jmhl+tMxHhOzT1P///Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZut+Qh9XgHimERJvc5H7uE+N+wrnwXWN4ncZvqxiIU=;
 b=Gwd5JB1efTHhRMw41Sowr49aaG0+CeiuKrOsfLTcf32fDTtekyHuijwFT3YsN1TzV9FnPLaNh1BVDGI98Vpg7ffMN42dGosIpe3RA+2hjF7C864hqQLix6bfbHw/W3JL2bzIb2A8MPiLJMVgdrZLU2zCJttl489g++ovNRXnMOmEUsR8V0a4glv4ciI5sv7G/KXUEAPuQXSxMbKRIUdtEuOozbidRBhKsCZAXuM1n4NhvWDriTXPyUaYJ0+rUi0IVU4Ksh3C32ykqeeqsNwbqKYow06PofN5dJs//YluI6/klH4N4ji91L5zh7ADu7gBiIw4VF+gfnRzQTe47qe8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZut+Qh9XgHimERJvc5H7uE+N+wrnwXWN4ncZvqxiIU=;
 b=Htg9DOuHxp/w59yz0xvqmj3hovmnLSqPnpouAczLQnER3WIkoLzeEu3bMcqAi8XGKozU+TpWS1i+XSspPn5w5MwtUwokRsvFpgfvSD1pVcM8xyADEAEgZ/6kAxobU/yM7Mc3PxOJHVY2JFtYFYMdUbePq5IdHczQg+jC9lEhuHk=
Date: Tue, 29 Dec 2020 11:54:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: Ping: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
Message-ID: <20201229105403.7velkoskewx5lafs@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
 <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
 <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
 <fe2ec163-c6c7-12d6-0c89-57a238514e25@citrix.com>
 <094e9e27-e01f-6020-c091-f9c546e92028@suse.com>
 <1d971d71-9a7e-f97c-6575-7f427dc1553e@suse.com>
 <301f6814-3827-5aab-c105-74ebee66091f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <301f6814-3827-5aab-c105-74ebee66091f@suse.com>
X-ClientProxiedBy: MR2P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6723d7f2-79f7-4901-f5e4-08d8abe811b8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55259B1E9BC6CF34A1C179F88FD80@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVLDa7otE7LuymHcwrv3LqhlrSpwjxeHKYK9XWAu1oUBU1lbVsG4PRlz93a2TLA/KoPfSaM/S2kxt5qJkDmi3ml/Bqq/25G9TWuIyysE9zqiIWj9/8r6jS7a5+A/eGrWRuZTxUxUXP+qbE+t2Cbp76KTiKHDETXW2BVL0KskjDFKF8VVVRFFOb14GekHrPnHVE8pMJ47zulmxO+bCp2Cvtt901jMTt8dE8A+d9bi2e0FvbUGbUZdWLTC9yO/1X0efMbHaEvTYzr8P9WEyA/VRcdgASgVKeQzNK09Jr8eKC+Kp075rIISGrIxosisYDXvSG0oVC/zAkOWqtVD7m5Xfr2c2vq5dR6/WTB1R/VN9kWOyuEjQA14qkAZNx3mo4/JnnZklpt/GnxAUWDBCxEcOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(86362001)(8936002)(66946007)(6486002)(956004)(83380400001)(66556008)(4326008)(54906003)(478600001)(2906002)(316002)(8676002)(66476007)(5660300002)(33716001)(6496006)(1076003)(6916009)(9686003)(6666004)(85182001)(26005)(16526019)(53546011)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L09Teisyd1YzQ0J4NVBUb2pHMVhPSFdVTGE5WGVsQUNTck10RUVRRGdGbmpp?=
 =?utf-8?B?dHkxZjNHbjRpL0VsVFVLYTVucGI1NjlVMCtrdlA0REhaUnQ3b2xtcXlubDZq?=
 =?utf-8?B?YzZaQVNDckNFNnBHREFCKzdRVHJGOWx1TkhFOXpQaGlYbTU2eVRXUlhkanJR?=
 =?utf-8?B?VUNJTWM5MDBqcFdoczFkcVZwMDk4aXdEN1VzWVRRTjYySkNTbzh4WmFXZXh2?=
 =?utf-8?B?Z2VERjVwTGlGNzlXSlltNkVseW1jYzJjZnU0ZU1jZ1RQdDdURnZ4SGROTllj?=
 =?utf-8?B?U3RFRUNLRXVvVUZpQm54em9xMlRTREdGRDZFUkpYU3ViMTFBVmp3UWRjT0tS?=
 =?utf-8?B?dVo5OWg4N1d4RVBob2lGeWJwWDlGWC9NL0JucUZDc0JsdkhNamRlSnR6UHkx?=
 =?utf-8?B?NHVJSGFIeVpRV1JZVm5NOHJTTjM0TjM1V25Vc01FeWxSRURlV29wRStOWTVx?=
 =?utf-8?B?aGY5THF5R1VVMnZWbnNpcjRSS3gxRVJLWTBxSlp5cCtpc3VwakExOE55L1E1?=
 =?utf-8?B?SDhSSEJENnhFcTlSTUR4eVQwQk8vdmlRZENPbzdVSmxlc0d2VlJZYzN5WHMy?=
 =?utf-8?B?QzcvZW01YTdnYng3VU1zU2tOODBsNS9kTWluNk1oWmRzU09JUEJBM1ZpelFZ?=
 =?utf-8?B?ZjNjRlA1cisycG1SV2IzZU80YXRhYXF4cHlKaytNNHU5NFd6ZzIxZy9qcU5m?=
 =?utf-8?B?Tm5BNm8xYWg3WFJ5d2dyaTExUkRHdjUvMG0zQzhwUFdFL2pKQmM4YklJWkx4?=
 =?utf-8?B?ZnN3c0sxYWIza09RRjQ3eW9DWkJ0MldlazAxNHN2RE8yN1dFbG1JYkZrWHNs?=
 =?utf-8?B?eFovRk43QUdXTi91YUxOTGp6VmxOaFJrekVYbExjUHViR1o4ckRrQ0ZDVXVw?=
 =?utf-8?B?SElVZTZhNkRMbFNNcTcrVnloNHJ6Wkk4cDZrZXh5T2Z6ekdhVFZDdCtZNmp6?=
 =?utf-8?B?QWpacmtnUkhMYk9aWnp1U2FVWFVoS3g4bWVuVFRobnM1UnhYdTVOQjlvZFBw?=
 =?utf-8?B?a1pGRnA5TGFNM1BoVk1QSW5aODNQb1pFUVpaQUNOZWZwYlM1dlZhQTRzN2s3?=
 =?utf-8?B?Q09Ya0FMTTNYeE5SWlJxYlFHOWRocVV0ci9MTEpVeEYzdDZTUGQyeitlV1Zs?=
 =?utf-8?B?TXptQU5KL2h3aHBiQm94QkdDWTI4SHVRZWtkTlFzTVNPTGdVd2FtaU0vNkhB?=
 =?utf-8?B?RWtQRWFxRG9wZnRqbWlqaENpZE5LSStnaEhpZC9EdjNoVmhyeU5hTjRBcFZE?=
 =?utf-8?B?S0phbXpxYy9TSWE2MExUMjJTTWl1bGptcHppMWVsRVBaN284MGozd2hZTjlH?=
 =?utf-8?Q?OGaYWO64/LgomvoPTI5OgRjjvGSuqQabTU?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 10:54:08.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6723d7f2-79f7-4901-f5e4-08d8abe811b8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIWaD/TYmyq/BFXpoGfoxWxIwIN+tsI5qjeea0+Ql/5fRAsJ5PMOb8X4FI2SCcqfHaWlQz7GA5aGQ5B+hU7drQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Wed, Dec 23, 2020 at 04:09:07PM +0100, Jan Beulich wrote:
> On 30.11.2020 14:02, Jan Beulich wrote:
> > On 24.11.2020 12:04, Jan Beulich wrote:
> >> On 23.11.2020 17:14, Andrew Cooper wrote:
> >>> On 23/11/2020 16:07, Roger Pau Monné wrote:
> >>>> On Mon, Nov 23, 2020 at 04:30:05PM +0100, Jan Beulich wrote:
> >>>>> On 23.11.2020 16:24, Roger Pau Monné wrote:
> >>>>>> On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
> >>>>>>> --- a/xen/arch/x86/acpi/power.c
> >>>>>>> +++ b/xen/arch/x86/acpi/power.c
> >>>>>>> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
> >>>>>>>      if ( state != ACPI_STATE_S3 )
> >>>>>>>          return;
> >>>>>>>  
> >>>>>>> -    wakeup_vector_va = __acpi_map_table(
> >>>>>>> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
> >>>>>>> -
> >>>>>>>      /* TBoot will set resume vector itself (when it is safe to do so). */
> >>>>>>>      if ( tboot_in_measured_env() )
> >>>>>>>          return;
> >>>>>>>  
> >>>>>>> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
> >>>>>>> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
> >>>>>>> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
> >>>>>>> +
> >>>>>>>      if ( acpi_sinfo.vector_width == 32 )
> >>>>>>>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> >>>>>>>      else
> >>>>>>>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> >>>>>>> +
> >>>>>>> +    clear_fixmap(FIX_ACPI_END);
> >>>>>> Why not use vmap here instead of the fixmap?
> >>>>> Considering the S3 path is relatively fragile (as in: we end up
> >>>>> breaking it more often than about anything else) I wanted to
> >>>>> make as little of a change as possible. Hence I decided to stick
> >>>>> to the fixmap use that was (indirectly) used before as well.
> >>>> Unless there's a restriction to use the ACPI fixmap entry I would just
> >>>> switch to use vmap, as it's used extensively in the code and less
> >>>> likely to trigger issues in the future, or else a bunch of other stuff
> >>>> would also be broken.
> >>>>
> >>>> IMO doing the mapping differently here when it's not required will end
> >>>> up turning this code more fragile in the long run.
> >>>
> >>> We can't enter S3 at all until dom0 has booted, as one detail has to
> >>> come from AML.
> >>>
> >>> Therefore, we're fully up and running by this point, and vmap() will be
> >>> fine.
> >>
> >> That's not the point of my reservation. The code here runs when the
> >> system already isn't "fully up and running" anymore. Secondary CPUs
> >> have already been offlined, and we're around the point where we
> >> disable interrupts. Granted when we disable them, we also turn off
> >> spin debugging, but I'd still prefer a path that's not susceptible
> >> to IRQ state. What I admit I didn't pay attention to is that
> >> set_fixmap(), by virtue of being a thin wrapper around
> >> map_pages_to_xen(), similarly uses locks. IOW - okay, I'll switch
> >> to vmap(). You're both aware that it, unlike set_fixmap(), can
> >> fail, aren't you?
> > 
> > Would at least one of the two of you please explicitly reply to
> > this last question, clarifying that you're indeed okay with this
> > new possible source of S3 entry failing?
> 
> I think we want to get this regression addressed, but without the
> explicit consent of at least one of you that introducing a new
> error source to the S3 path is indeed okay I'd prefer not to
> prepare and then send v2. I expect there's going to be some code
> churn (not the least because acpi_sleep_prepare() currently
> returns void), and I'd rather avoid doing the conversion work
> just to then be told to go back to the previous approach.

Since this is a fix for a regression I think we should just take it in
order to avoid delaying any more, so I've Acked the patch.

My preference however would be for this to use vmap. Could the mapping
be established in acpi_fadt_parse_sleep_info instead of having to map
and unmap every time in acpi_sleep_prepare?

The physical address where the wakeup vector resides doesn't change
AFAICT, so it would be fine to keep the mapping.

Thanks, Roger.

