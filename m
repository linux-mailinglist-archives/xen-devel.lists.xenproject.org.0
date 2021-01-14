Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08222F6158
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 13:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66993.119227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02D8-0008TS-BQ; Thu, 14 Jan 2021 12:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66993.119227; Thu, 14 Jan 2021 12:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02D8-0008T3-7t; Thu, 14 Jan 2021 12:58:46 +0000
Received: by outflank-mailman (input) for mailman id 66993;
 Thu, 14 Jan 2021 12:58:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7Rz=GR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l02D6-0008Sy-Pk
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 12:58:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a6ab5fc-3f4d-40e9-a6d2-2166889df66d;
 Thu, 14 Jan 2021 12:58:43 +0000 (UTC)
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
X-Inumbo-ID: 4a6ab5fc-3f4d-40e9-a6d2-2166889df66d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610629123;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oNdLNXNznCRw+i/Q0EReWnL/5uSXuvyg16zixiD//Dc=;
  b=MoXQYlalQBGOUbdrEb9wt5Eb6WinbLCsvgLLNHKAKli70SsReyVrnxOY
   T094KDMF5nSNpuUUJlT57hSHi4g+lEn4e7fWcyaxjA4dKKAFODmh4GIt3
   wwFXGW93gEQsXAA/grfb8epGoccRZbZ8i802sO/IGcmCUNvomDWHAIOfB
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rSHUTAb9iuD3teWeso4SsODwiaRXaZ19qBhCJH7a+TaJF6KKj4AWvf6Y5U5IhIAH89WqZzEI0W
 GFraUlwiU2Gj+6UE/CfCIxYROglILbI2rZXD7ju1DXzhu4LqP7agBxJ5fd0kuK6M9QKJ3rzaem
 mZi2doMfJNZeZXrv4zuVNpnIxO/a7dqbx67iO10jN2lOcMTPfnqf8Uu473k9LfaxPCggtnQMIY
 uKiZkvrdqHPibr5iS77vikCtPxFKwGib51JGD4xBLnxRlaXK0rPrv6yowiFvX2xno8irWXB/jU
 Pho=
X-SBRS: 5.2
X-MesageID: 35078222
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35078222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdVdw/KqrfrWcqVkonYmcySMcE8HS/dFMwyFhU1GKVAaiZV/gwiKB1ioyJY9kB3PCbVtfawzjl03iVCOFe/cl8bqF8VI+bgge0G8XYv3Q9/C/x/21JCKoAjlbtY/y3UX2eTTWFsb+bGMCOD+r2AxtWkx5jx2XzS2fCtbSz1FVd90FTSwT/b+fmgFS90Ftj/uu7ZH2OX9q9K09s85keVHG6PK4vV+uUNzH+YbZuMwhhg1oWY4kz+GShMHHE8tK5A1/WUxpa4xeiJ5z28LNQiFspQAfRBqETVyGFtsl7IugA54GONnmUDiWZWRW6J+EWEcdacozFo6mmuvZjbSH7vR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3rhpRK4z+J0o68NICt+nMe5Bmoy+0Mmu/6/bZn+eSM=;
 b=F678oOTe8pE9M2UQmui2RSSuUP2wNSHGbMg+kWO5EpeJMkTMDVoMLhmbVfykD1LUXa79yR8Clgey/qXWTzlo6DG0atNZwBLounBcLl/+kjZ3HEl+kLzUdp8QOFB2XDGzRUb/6Rin6bYC9muWV4Tcl5m+WXYbhgWt7eMjvwGxvwh3GnbFjphLCJdFotOTOUZ37VqX6YCMp6alkXw1cPd4acNID7Rq4esKhRQaV8a7MQ/Jx7mtbYCV9bQwTFQBWD4vngNM40Q/B8NcR0aErp7D3+iauyQ055L67EklaqLQjKgzRZSAg2hxJHYd7Z6GzvK7Ex0aejdI8IJNEpR9SIyyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3rhpRK4z+J0o68NICt+nMe5Bmoy+0Mmu/6/bZn+eSM=;
 b=BHyHlgZvh/wjJlZ3JBXCsledimJQZKK8PtVvlixM7Az/kOXpBYQH0M09o90DGSOIArxMOehPXPLE8/98EL8yTNS9a+I+4r0vmPY2+2IX/FexQrSJjLZAFbGGre5OFeP2orxemw6OC1a9/FZ79FxtmQCN4lYpUM9ymDEy9d/4L9E=
Date: Thu, 14 Jan 2021 13:58:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, "Tian, Kevin"
	<kevin.tian@intel.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210114125833.wndg4dpdygcljayb@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
 <8da05add-656c-0e18-793b-38ac468b6ed7@citrix.com>
 <06ffa0bd-311b-eaca-701d-289aabe8e6a4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06ffa0bd-311b-eaca-701d-289aabe8e6a4@suse.com>
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca11160-5b65-4e97-d2cc-08d8b88c1c26
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3739B1C5EB5BC691A948902E8FA80@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Fa+EW0pZtlY07TqrK/DDMDRXzzGlyf+72mXyLEbRWXKjAazHkMkFpCUTsXUONaCEu1bjirXiaKM3Qdt11RZ3MZLNN/AtkAxEg+Wh9P5qpq7Gxkg02f9cfBKkr2uHLmDh+uUWHhBBge1phDobG2hRrxaDtrr8O8HtUCf7JF7YO7cHaGwyNJrMA9/njk3rZHrlO6Zccr2w7isAyXnqYLLAy2s9W1jXseBJJHkvTmjUGsncxPIYgeVLsNE96AISN+aZOcmiP+Yxw2Rms9O0Udg4ihugHN2M6H84lzJg5LOCQq9rO3L7EbTEuJqycgMzHsZs4aJNtvbqQyhFayDoFnHXrmZuZC1/jHGDHT3zfhH3mxfSV2RaQZUBc1Fo5tBb21QOz7MhB74IYIGOLR0NKN+fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(136003)(396003)(366004)(39860400002)(16526019)(8936002)(54906003)(86362001)(2906002)(83380400001)(316002)(8676002)(6496006)(6916009)(186003)(85182001)(4326008)(1076003)(53546011)(26005)(478600001)(66556008)(9686003)(33716001)(66946007)(6486002)(5660300002)(66476007)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N29Ea0pZa08xaVJjMnlieE5DWWxlSnZpU3hXeHlhd1pxUDRCM1VkRTdKcTYy?=
 =?utf-8?B?NkQ2Q3kvV0JFMkowclU4TWlFZDlaTHlXcUZzT2R3WFZHcUlwL1BFSTlHOEUv?=
 =?utf-8?B?b0RHck1SWExwL2h5SzZiUEZKOWpxWWN1Qy9ubDZqMytMd1diOVprZmNNcVZV?=
 =?utf-8?B?ektXODRadnZ3d1BWcHh5MUYxbkpuZ1NHU1lrclRRbEl3MmdJNUk3ZysxZ2R2?=
 =?utf-8?B?bmhhOFdVWU9jRzZ2YWFzUTArbUg5ZDZJd28xcmZ5QWZHNEtkWkVaOHlYbFBm?=
 =?utf-8?B?L1puWk9UbXd1ZThDSVpGOXdWWjZEWHZFMGNYc0w3L1gvaXpPTHNieU9od0tP?=
 =?utf-8?B?ZUlpUXdDMWNCYWlLTUhUYjBTQmxRT0VaVjE5SGt3K0hMVU9CKzZDK1NCclhZ?=
 =?utf-8?B?MEx5dHJhSXBIVWllWU03NTQyU0VqQWg1M2thbWNBbEkvOGVZWDhhRW1hUG5B?=
 =?utf-8?B?TEN3MjE2QWtDZzkrNGVWaG9TRWN1WWFUSFhFY1FRTkppRW5rLzk1ZjBUcUxO?=
 =?utf-8?B?SjRnYWxaYWR4MW15S2xpcjJmOThSZFIwSis1cTNqVFJicnltYk5jZzdMYlNm?=
 =?utf-8?B?dUlsOWFrMTBwOFpXaW9yQ3RLQ1FId1lJcXFhSzNNSldHQU1yVnQxVnhpQ0Ur?=
 =?utf-8?B?MXdncWNTalQzWEFLZlV1amw0U2czYzFwOFZJSy9lWG9yYUFSSHdWSjZ2UU8r?=
 =?utf-8?B?QzFCeUNYRmVNcDFhS0JDcUs3VFY4Tm9tbVdHUUg5N3NqbXc5SXZxa1Fra2Y3?=
 =?utf-8?B?Wk1Xc2hFaU5wZkYzT2JGUUF4YkZUb2hBU3lUZlRuazFMR2kzRnU2T2lLRCtF?=
 =?utf-8?B?VEhTTlM2U1pFMzA5OEU3QWI4eTAwK0t1MU1nWTdjR2lXL1N3K3FTZUdsV00r?=
 =?utf-8?B?QWkyV1B2YlRmMTEzWmRmSXFtcHdlYU5kR3BMdWhHaTdsaER4a2F5ck1QQUJs?=
 =?utf-8?B?dnM3QVc3Z1E2WVRzYUNSaExJRmczeHNDRy9MUHh6L0ZYWXVGVm9sVGdMZk43?=
 =?utf-8?B?SXF3WCtLOURRYmlqNzVIbEJSY0Yyd3pXK2tpU25jNU16WnI3K2pTQ210V1VM?=
 =?utf-8?B?MXNlcThkOERJVHpRVG5obTZsWU5IeVZGSS9RTDNvWDkyRzJUdHVQNmdRdnF5?=
 =?utf-8?B?REFUZjJsUjdJK2YwRklGMnZWZnlRWWVLa3dWSmxjM1pjb1J5YU1xNzVoY0JD?=
 =?utf-8?B?UGphWDB1Uk1oZE5OSnJ2aFloVnR5NFd6UWRwbkRKK3BmZTBjczVScVhYeUEv?=
 =?utf-8?B?WnVXS3h1NFQ5ZitSbWFOS2ZXL2gxd2JMbC9reFZ4RTZ0V2wwVlh6NmFXL0VQ?=
 =?utf-8?Q?nD1Bwp28q7BxJVKlicCQVwCyDk5FzzW8ci?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:58:37.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca11160-5b65-4e97-d2cc-08d8b88c1c26
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itXvItVsPNXwam1L6COsM8Yn2F+CmHhsQaRjIavEaS74VKkSfn3YKH330/lRfKlZerit3v5NTlVcLMsFEcvskA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 01:12:00PM +0100, Jan Beulich wrote:
> On 14.01.2021 12:56, Andrew Cooper wrote:
> > On 14/01/2021 11:48, Jan Beulich wrote:
> >> On 13.01.2021 14:11, Roger Pau Monné wrote:
> >>> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> >>>>> From: Roger Pau Monne <roger.pau@citrix.com>
> >>>>> As with previous patches, I'm having a hard time figuring out why this
> >>>>> was required in the first place. I see no reason for Xen to be
> >>>>> deasserting the guest virtual line. There's a comment:
> >>>>>
> >>>>> /*
> >>>>>  * Set a timer to see if the guest can finish the interrupt or not. For
> >>>>>  * example, the guest OS may unmask the PIC during boot, before the
> >>>>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> >>>>>  * guest will never deal with the irq, then the physical interrupt line
> >>>>>  * will never be deasserted.
> >>>>>  */
> >>>>>
> >>>>> Did this happen because the device was passed through in a bogus state
> >>>>> where it would generate interrupts without the guest requesting
> >>>> It could be a case where two devices share the same interrupt line and
> >>>> are assigned to different domains. In this case, the interrupt activity of 
> >>>> two devices interfere with each other.
> >>> This would also seem to be problematic if the device decides to use
> >>> MSI instead of INTx, but due to the shared nature of the INTx line we
> >>> would continue to inject INTx (generated from another device not
> >>> passed through to the guest) to the guest even if the device has
> >>> switched to MSI.
> >> I'm having trouble with this: How does the INTx line matter when
> >> a device is using MSI? I don't see why we should inject INTx when
> >> the guest has configured a device for MSI; if we do, this would
> >> indeed look like a bug (but aiui we bind either the MSI IRQ or
> >> the pin based one, but not both).
> > 
> > When MSI is configured, a spec-complient device shouldn't raise INTx. 
> > But there are plenty of quirks in practice, and ample opportunity for
> > races, considering that in a Xen system, there are at least 3 entities
> > in the system fighting over control of the device.
> > 
> > I suspect the problem is "what happens when Xen gets an INTx".  We don't
> > know which device it came from, and therefore we can't even attempt to
> > filter out the devices we suspect are using MSI, in an attempt to avoid
> > raising the line with every domain.
> 
> The domain using MSI won't have the INTx IRQ bound, so won't be
> notified of the INTx instance at all.

Oh, so that's the bit I was missing. So we do actually remove the INTx
binding when a guest enables MSI on a passed through device?

Can you point me at when this is done, I don't seem to be able to spot
it.

Thanks, Roger.

