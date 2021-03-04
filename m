Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD232D82A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 17:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93351.176242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHrGd-0005eT-Kq; Thu, 04 Mar 2021 16:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93351.176242; Thu, 04 Mar 2021 16:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHrGd-0005e4-Ha; Thu, 04 Mar 2021 16:56:03 +0000
Received: by outflank-mailman (input) for mailman id 93351;
 Thu, 04 Mar 2021 16:56:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHrGb-0005dz-JB
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 16:56:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72ed6a25-e84a-4ea7-845c-034df5f6fd01;
 Thu, 04 Mar 2021 16:56:00 +0000 (UTC)
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
X-Inumbo-ID: 72ed6a25-e84a-4ea7-845c-034df5f6fd01
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614876960;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PJJlnvYNHcxT9lZlo/b5+Q0KHca4J59ZGhGT1OADYd8=;
  b=a+ZNs8ri6+CxRjwJmumXtoCD3zclgNrwTeTDnu8eLbWMHw6O+tn6LOKW
   EVrkjIEGrUeYFHr2B3zjPvnVEfjulhIdW3zUFhWqONxEg7DlXLXHUnsWx
   bDBBMSgQFiZBvaxfC0MxQudeLIN7LJU+gugBEBdsdngjtiYSUjf+pkhUF
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G3EsBo57MsW2HtMflzQ1AWWegbfShFRTctUHojlO49MqfQDwI+COPZqd29dyyYpO7LOChiRpIf
 4dpVLaqbB5dGgJ/6qZ0ulckvLGI1o4EV2RQhfBonGIhYUNXQBi/kTa9IIVQEFuysCWxX1LZSB5
 Atp0BFVkrVLF/+wco+CMyxzDAvlBRNNi3epB1Q6YECU0i9ioGpfrCVAG/ozZapyS+acN+GVLfa
 xjbRQ7mDT2Lz3+kWRs3IDsJMUAOFpdHebslKGJHhnd2mgMLLcsygnQmhNEoNtHYVMqIBgHkLc4
 Wic=
X-SBRS: 5.2
X-MesageID: 38744378
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38744378"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWfWaqOf/8BLfbDQPtkRd3dzh3I4Uav8u77BtLZ857mNqMtwHcSDuhlSTIgwFhGcjzEVdyYkH6ypMN0jBsoP7Y4NKY9Uipxt5MRzSfIka9+YEzOYoNjC2mH4f92q45+HtHIKDCfCp8GsfVGUnAwuAsgH15cT+/wSeKJ/1qRqVTcL+L8GjI9IMq5iUVlJFvXVfj0lj//quHTS6Hdvu5iofmWGKiZYYskKraq041dlHLebU3jeYQpht/pTmENGRyk3N9ZBXJQ53yoHi1A6e4UGMwEs86XG81SL9yVgQgiclewAenmucmpqTRtR5vnZMeCYha3qUt+T0yKUCikgioxc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5SmDKXuVn7S3cH1SIFYf2ARGTPUYV/bVlvugpYHpXI=;
 b=bg8t7k6qHCVqF0RPiHrQUaaIX8Qzv04+a/3BZcpBioORG4ZbfhTxcXvAd9xQGIKumATnpfCdP85/mhzrU/7NB6dOzaMPlRfjHEcwbL+I6/t0sCUNU//dUk9zcg2ea95nM2ra3j2A6iFp2HSRatJXhWm1Jccts2aWsYmj1kM8MzofuK0oEHFkyrLBCC1UCTLFOiOaNNgYZeTNJTMHI1wv2/v/FrXk4MLIXw+tUWaKho3C4669feXtPrPC99CYLwwKqNN/FXtgcAuCwZa0OEdOqwCR2P3wl25MFjC7gWCHCO+BU32seXczYTT9vXGxUVR2PtW6gKqJAyJX7Y0wR9mvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5SmDKXuVn7S3cH1SIFYf2ARGTPUYV/bVlvugpYHpXI=;
 b=SnhIr3z9DLVBJZl+U7k0XhBqY4HYbaQnPfzWd5REbtOqi+jwoHhotD6v9/4zPwYSIGLRbQ7oWORvgrYzhz8DVebi9FsPZbs6cU9VxRghIV0nUsA8dgFaGur7CDWvegfGiCS8DacQNXL+CNtre3eMwGhKoo8CxCIQVDsyuKZWC8I=
Date: Thu, 4 Mar 2021 17:55:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YEERBL4AO371ZxmP@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <24640.62938.427877.757656@mariner.uk.xensource.com>
 <YED5Czp+v2xFSCOG@Air-de-Roger>
 <24640.64194.445736.52546@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24640.64194.445736.52546@mariner.uk.xensource.com>
X-ClientProxiedBy: AM5PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:203:2::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24c848dd-9c8e-4fdd-a61f-08d8df2e56a3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB43960A7BB1320572454F14318F979@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xYJSAvKr3ibcgO3yOVt3MsoKQAmYLLJebJd47kksatjcyh9bQCyVOuFYxKlz+ZtS8ow92CzJZZzUseVNf8ERAjox2SJBIj8wOneLBA8Ks3ckdtAFOon7edgM5QquFztW93xCJEpGVtGOeiJyqR1N8/0Kf+E7wirH0J1z+EtduaF0yTg4fq47duPhyquXXRIdADtJw/CystHCmnUDaDO47i8V6yPt5dbAYY3MXhRXjbZRLwVT63JThUr+05KWjAg3+JQARn9HtZwX/4B9NEBu4rc3N2JKgAljGeyPx00QCQMMaO0Re2qnHiUV2PSmhzzcP8rTuXpYPdvdmAHpvW3/SOKcTdV12b1rJRDZ+7XM3kfM1tHSQavaf6jH3ZmLOKpxzxRf7ZFdQTThH9bpMbdv+M7aH7Gp0GMYFyZkk6HdRpcoC5KZelI+AI6eQjnYRhJWOtvVmHHsDpb/YBXYjJ7l8zS1+S32T01sNqT97rtMDmpoyP5C5ihJKtVhDXdJWaVgQ+93w7be3rKobbLIG51kxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(6916009)(66476007)(6486002)(66556008)(66946007)(4326008)(5660300002)(86362001)(478600001)(9686003)(2906002)(8936002)(8676002)(85182001)(33716001)(956004)(6496006)(316002)(186003)(16526019)(26005)(54906003)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWVqYVF4WGVYVWpXWmtMY1Y3aE5ZQnE5elVFMEZHYjNvcjVTU05BTjQvOGxy?=
 =?utf-8?B?ZlBlM1ZQRzRNNy9JVGZ5bnhwamZuQTd4ODNPZ0hWSWd1NnlPb0VkcnZvYnNi?=
 =?utf-8?B?SVRZSmwxTHZEZFhxT0FXVGt1UFhEdTRDVjl6QnFwU0wwMmJrTHppN1hWKzh3?=
 =?utf-8?B?SlZUR3JCeXBLNkRTTjQ0VlNIdGpGZGx4R3lGcVl2RHRuaHF3WEczSjluczFp?=
 =?utf-8?B?WDBNY0liakdRM1JLaW9McUhWZUgvSHNrVzI5RDB0WHlwUG0vaUsyRFRxM3Z2?=
 =?utf-8?B?TzRCbWlPNjE4N1VCbWJqT0toSkdyNzhIZUkvMHVsYlZLeTdtcmN2bFRoL2Q1?=
 =?utf-8?B?Tkl6SkFIQVhQMG5BeHE2UitCYjBEZWhicFVhZHpXM3ZMd1BXTmRoVFZteVJF?=
 =?utf-8?B?djg4UHJONDQrdllKSGhlY1Urckk1Nzg3QkRFaGdEZ2xwaWR5TGttRVBpemht?=
 =?utf-8?B?aW9mQ09FM0QrZXJLc0VCR1JFbTFlM0ppalpGQTRsK1hDVFU0andJdFRKOVBL?=
 =?utf-8?B?QStSK3VlNTQrdjhlSHBqbjE1WjU2ZnJUNmN2NzV6c2VrTVRVWnhyT2kwSXEw?=
 =?utf-8?B?eUJCMmlaUjdNeWNHbFRkYlFQKzlxWXZPckR0YjlZRlYwUm9tbEQzM205MUx0?=
 =?utf-8?B?aTU4NFQ2TVNhYnZDUWh0MVcwTCtwbWw2NndEamZleS9yV3loUENKRW5mTU0w?=
 =?utf-8?B?SzJKaEJqeC9QUlJDU1RyUktxZFluMDFnRTZzSCsvMnVhc1MxTmpiQjUwd2p2?=
 =?utf-8?B?OUJNQ0Z3aEJjYWcvVFJ4ZVRobEpZQ2IyYnZVcytuaURpL1V3VDRvWnlaWXBk?=
 =?utf-8?B?RzhQd3VMY3ZiNlVyRVQ3VHJtKzVZanQzVkI4bGdERXJEZDY0SEVETUJkZXBz?=
 =?utf-8?B?bVJtcGxzb09Fb2lOdldKdHJ4eHlCWHc4V2hjK1BtTnZvdTJBQnNuYnVBbFcw?=
 =?utf-8?B?bXlKcnNxMHZwdG90NE9oZkNxcmt5ZnY1aTlSTTNBeE5SZzhsL053dzNKbnNJ?=
 =?utf-8?B?OFV5SDlUc1NNaDVvejkyRUphRFlDcytXeGxXRWFRQ3F0UjlUdDNkUk1qZVB1?=
 =?utf-8?B?RU9JaFgxdk5vQ25BNW9xb1N2YkxYTlo4YVVhNmZJUEkvdHZoczc3a21yZDd2?=
 =?utf-8?B?VzNCRDYzS2wvTy84aS9LVmZ6YzVsSzVHbWNZZXYweE9LZmNPZHZyOFo5RENa?=
 =?utf-8?B?b0RyNWd0S3VjT2p3N2ZDUXZuT21WYityTEpvUEN0RDRJOTFONzFIaFZRU0Z1?=
 =?utf-8?B?UlFMQ2l6bk5jY2ZOYmV6SWt4bnFsdGxNSE1ycHdPdnJjc2kvQzlldk8wOU1D?=
 =?utf-8?B?eVd2bzMrZUpSMWJnblZhVFltek9Na2wveTMydk5KL1RXV2IvajQxbGtDQWVr?=
 =?utf-8?B?MUtuV3J2bWUzRm1USzhYTW1HcHM0WmFLNGtTVkJ4cmJHRmF2RXFGWnI5ZlZi?=
 =?utf-8?B?Qjg3dHdTY3VJQnNyMjI1aWsrOGc0RC9aL1preHJXVURvUzJEZ2dyYTdxajlk?=
 =?utf-8?B?MHZFYktxdFd4SUwyQkdUeEd3N1JaQjI5Q2tHeTAyYkpIVHUvV1U3d2ZNblMv?=
 =?utf-8?B?cGJPbEpETE53MHEwSm1JZzRHeEU2dlB6a3YzK2laNFFiZHVFeWN3TXFPMHJv?=
 =?utf-8?B?SVdka3pXbHpwaVJwWFZ1Z2QxRWlJbkV1YWVGNnJmSGU3Q0hjWTlxcGhCOW8v?=
 =?utf-8?B?d2c5MGdHL2dUUklGeXF4SXN6L2oxVHYxaEkzVjRqRGFqVWRiUmN3VmtpMW1W?=
 =?utf-8?Q?QukHMKbOkdQcW2dHhA6iEwursnF9eKtavW7EuaF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c848dd-9c8e-4fdd-a61f-08d8df2e56a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 16:55:39.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIMDRYIuJWYltJl6RXF2cU3vwJe3RIbanq+g/R6PLZxhZZjBChXfWSO1fpRnYZab9mZhhf6e7Ervsw36VwbXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

On Thu, Mar 04, 2021 at 03:20:34PM +0000, Ian Jackson wrote:
> Roger Pau Monné writes ("Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> > On Thu, Mar 04, 2021 at 02:59:38PM +0000, Ian Jackson wrote:
> > > I think it's almost as bad to have guests which can be migrated in,
> > > but which then cannot reboot.
> > 
> > Ups, yes, right.
> > 
> > > Historically we have taken the view that new Xen must support old
> > > guests, even if that means being bug-compatible.  So I am strongly in
> > > favour of avoiding such a usability regression.
> > 
> > I'm not a xl/libxl expert, but couldn't we set the option in a
> > persistent way for migrated-in guests?
> > 
> > IIRC at domain creation libxl knows whether it's a restore or a fresh
> > domain, and hence we could set the option there?
> > 
> > The part I'm not sure is about how to make it persistent.
> 
> The guest could be stopped with xl shutdown and then recrated with xl
> create, from the config file.  I don't think we want to break that use
> case here either.

So my original approach was to actually risk breaking creation from
config file and require the user to set the rdmsr_relaxed option, and
report the problem upstream. I think ideally we would like to get to a
point where we could drop the rdmsr_relaxed option, but maybe that's
too optimistic.

We have done quite a lot of testing of this new policy, but obviously
it's not possible to test all possible guest OSes. Forcing the new
policy by default might be too risky, so indeed falling back to
enabling this by default could be the only solution.

The main downside of enabling by default is that then we have to
resign to always having this kind of quirky behavior for MSR
accesses as the default.

Thanks, Roger.

