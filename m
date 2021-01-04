Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609712E9917
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61318.107789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwS2p-0007P3-9x; Mon, 04 Jan 2021 15:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61318.107789; Mon, 04 Jan 2021 15:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwS2p-0007Oe-6Q; Mon, 04 Jan 2021 15:45:19 +0000
Received: by outflank-mailman (input) for mailman id 61318;
 Mon, 04 Jan 2021 15:45:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwS2n-0007OZ-Dq
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:45:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec0cb16f-2377-445a-b8cf-32a25b3eb99d;
 Mon, 04 Jan 2021 15:45:15 +0000 (UTC)
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
X-Inumbo-ID: ec0cb16f-2377-445a-b8cf-32a25b3eb99d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609775115;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OkMIRalYsiwjskYJeYOukN+vjKjqFQQb/vNsIfOQ85Q=;
  b=CiD0Cx6+/8nnBYMF5EdLCooI4PLdz6IzupAgJSaYXTwFhlAL3AP+m2LM
   FKPL/Ld33c18v1gN4XCPTMcf73y82I124MfIyxl/KvR1zBJoWTeV53g/O
   oci997oT8Np5Id9n2P1oErqnYj+8O7f6pCs5jvO67vhAS1EGtVwzaa9EI
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8Cd7XwNPsJKHVpjICspoIBJLSyaEsajfqHVsWPb0EH4T0ACMfma1AnRQ7IkRhKZianwgJOtLOj
 2EfNDkv1b3DjIDt8xCKHwxXa40ZYXP/UhEvpKw6LsiWlbz+/KEG+cz9OuGnA4scu3EwbK34dZx
 Qlr4tOcpunpg9T/4MZ262XI+kyw/qK0sfTmOV90ANvDzfM6qlcOi33uSC/sfvG5hM+1QOQL2tH
 c6jCVgt6jQwJ9WwQxunBMSDXojSztZqcCZRSf84oQEU3Jd0BJuN1KwKTKdbPhmDYLu9VNoZB6q
 0OU=
X-SBRS: 5.2
X-MesageID: 34348740
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34348740"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr1uyjLxYV6k4jsBk2hPyABPnkywWgpwAfbHZ4QxFewHhBu2ZdY8MrsvPSPQRi3jjuMy8uVoD+BTeYfevTFgkgIrAUt/ANVu5ztL+nd33f6I2wZKKpWBODY6eQ7PO1VRQM1Jc8vqaaUNWwdyn7z/w0jxRNklzU/Lr5S0JC4YDaJSDNFlmFmonGXeOtWwTr5s0DJrxnMT1VhBpuKCdM+AB0hlUByQPBvCjH6Qta8WmE+JaOKmubSRNtZVOT70AdiXa4HYIpiXeSdOwfV/Q0HPsSOqAX7ZJ0e2x9EzUKMoxDje6YZ2YDwf8dDWs+jGnZbAr45+cbOWvRtbEuOSdOO/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB4bCy0KMXd7RZxUzJMgrHfH3K7xnnmRyz5WRtVWjkY=;
 b=W60oZLuzS+JXaEpaKRDoTGzgjKh7K516Hlhin6GS68nVA7Z7K2M8lcKu/wH2N3w0THduw+24cbMebrRaVzxKOlWA4qIvjfAa76Hy4yNt57UgI2eA2RFEuqU/Lpp8ZMGjurZ78TR1DNnieuSPjTA1P7CAg6m/2V5CT64PVYa+m+ib01l7mN0Cj5Z+v4Dk7j4qW/nFPcqy0q/UbbPo2DsxUEyVhX6uIZxC2Xb/s18CZ7PNwtg8h6lqlRCStQso1P2TS3TB+yUbGAXvOBnwdZH6r48tuRxvNrFFpRUzKWkdO/Ue4IgahpRgBEWtvezllmd8zq1x0rRQE+oZqNFEMjsrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB4bCy0KMXd7RZxUzJMgrHfH3K7xnnmRyz5WRtVWjkY=;
 b=VVolj00MPFeX+CiaosexBQeRLfBGONSibmmDQao8s+9hLLgc8GhChYbyZuj+lLYsKDjXKuHLK0EAKVZb+27wS698j+FwC2ba6Pri9q241T4ZAn8kv3E5Eea0J+sIPDfp83u3A4DPtxNe6BIGXB/lNaZw7e3tpGFUYlW2hvoioR4=
Date: Mon, 4 Jan 2021 16:45:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
Message-ID: <20210104154507.teikuuhyqr7kk3td@Air-de-Roger>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
 <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
 <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
 <c4397698-d93f-ca64-34cc-8b7f3f76e3bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4397698-d93f-ca64-34cc-8b7f3f76e3bf@suse.com>
X-ClientProxiedBy: MR2P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ebca23d-6b5d-4147-6603-08d8b0c7b8cc
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533905BDF65F1EF891EC9F978FD20@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6iCf7Lgm2XNh8IFHQrdLoilFHLznB0XhVo+zDcfUuolOkNf3fRSrpVAP5RbWFBy5tbi9Dn6bCoaSS1hw3+vTbevED9NdLUpB4XSwfeOOYJUg5o+rTP8Zr60mHugQSPinBEnL5IPAVwQEMpLUw16mBOB73724xN8+vGvQMNAFR6kLQqkDW01HxbptutfrRDiCcG3xR3efu0Hk+9QmcM9wPDqu3y8ByiyZbuHF8/eR8MX8/rh4O91LyEIl4K61qjk/3sgsg5MWzWw/gMaHMzWQZ/EY0YwHOQS74FjTa+WvXPHtKVlZpeKe3Q3Ql+x04cFteiJJB5fIKRgg1k1jd73185TKlu2dRPOSIrMw/VJ4HEP/p3RO6IJ/T0lrWOnhFyXj0OHwPeZi24AikGOb87lMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(9686003)(8936002)(316002)(956004)(4326008)(83380400001)(66946007)(66476007)(66556008)(6666004)(86362001)(1076003)(33716001)(5660300002)(478600001)(53546011)(85182001)(186003)(26005)(6916009)(6496006)(54906003)(16526019)(6486002)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXdyRm5DSHFsbmdITHZDRXVFcmkvVmpWWHBqcFIwTTVwUXZ0bmpyeXU0ZDJh?=
 =?utf-8?B?bUk2U0dFSVZ0RHBYVC9mWGF3T1JueGl1U21GVHg3OW5qaVM3UVdxazBjdW1Y?=
 =?utf-8?B?WmRabmxDa2ZpRkdaVFR5MFMrekdXcjNzY2Q3VDQ4TUF2ZHcyU1phelRPRDVp?=
 =?utf-8?B?OWFvSTh6QWhCKzBocGt5WTBzTmRtTUhXWnZ6K3plNlphblVuQUxqSDZWc3FB?=
 =?utf-8?B?Wk9tS0RqUjg3blNvYVVGcW13WS8rU0xZUEdlZDdRVnF0VVFlYk8veWFwMGV3?=
 =?utf-8?B?akQ3b1psaGtndlhkYkF2cGxOTzBNdEduOURNa05QSWJwZ2RQQXlkOEtzWUpo?=
 =?utf-8?B?UGcwRXBKRnNvUkZlSkp0WnJJVlJnRzBwVTM4VWxaZ1lOSGxrT2owQnF3clJs?=
 =?utf-8?B?MzVKQ0VlQ2lXbTliMUdjWE9pekN5VlhJMFVWQUlKdTNxNWlaWHh2eFljNWZv?=
 =?utf-8?B?a2VqYXppUHZESFlTSEhsRHg1c3NlNWQvdlJNMXJJeTBJRDdhZnUzRldPbU1F?=
 =?utf-8?B?ekh2Q1l0bkwxMUpCNEJ3NTRYZG9QeEpJZmJjeEV6OVIrek82L0hpTnJYNWNx?=
 =?utf-8?B?bjBOL0w1UnhtYTVIYk05M3l5U0ZySEZTa1JIb0Y4Q1d5RkY4RjUxR3BhTW5K?=
 =?utf-8?B?SkZYRVNoU2lHZ0w3QlBLeXN0eStUWmd0cEVGNlVPUlNuNVpaeHpBZ2N1dGRO?=
 =?utf-8?B?T2w3dzNEendvMFQ3MUt5Q1AwTlZCbkVJZUFEc1BaNXUzY2JFUWpYbDVucjBs?=
 =?utf-8?B?VTdLMkRibkRMcnZmQVJqcHdpbEZpZGZ2YVNzWmVVLzMxclpCYzNjTm1yVExE?=
 =?utf-8?B?WDB2NkJlQjdqZFJ5VkovbVNnVTBOaDlVN3JBVW5mbTcrVEw5K1FHc3V2dUxu?=
 =?utf-8?B?MkxKSzRBS0Y3VUlCbmpuOUdNTTYzS0JMVFNzREh6QTNxMkVYbG5kL01NcVBD?=
 =?utf-8?B?QUF5TlI5N1pNWGZIVlVQcUQxbkN1bk1SeUpmYzR2ZmVucEFVMWRLZDlnMkwx?=
 =?utf-8?B?WlBQUS9hZGhDNk13OEdhMGZKeEZiam5MbEpmNG5mcEtURmp1SHJ3MTdtb2N3?=
 =?utf-8?B?SjBCYk1MVGpsazVzUE9FMTlNRHVmMEppM3FjS25FcTlGVEhNOEpzNFR6N0VK?=
 =?utf-8?B?TmtIcFlNVzV3WEVXTGlKSFV2UHd5L3FKcmtPdlF2cHFMWkwydEVwYkR1dS82?=
 =?utf-8?B?bUE2cUtWWVIvSTUzbUxXUFpoY0ZoK1RKdWlLWEZwaHFyc2JFOFdPNEZaMlIv?=
 =?utf-8?B?T2Y2Nmpkckk0MWo1Tm9LWVUxNHZZNDlwaHN6d0gwNUZQNjI4eVBRQ1g0UnA4?=
 =?utf-8?Q?ITCzTCi7XDTuBhNsSroW18wWr3tXot8GiI?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:45:11.7562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebca23d-6b5d-4147-6603-08d8b0c7b8cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZThpSaQZbVdX+AjP5jLvSNZIMqt72MELP4ZFpLhTdtNfV7cynknfIQ6vHMCvYcZ/JSVuCb2sKMO+yHJQ/RoxLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 04:16:18PM +0100, Jan Beulich wrote:
> On 04.01.2021 15:56, Roger Pau Monné wrote:
> > On Mon, Jan 04, 2021 at 02:43:52PM +0100, Jan Beulich wrote:
> >> On 28.12.2020 11:54, Roger Pau Monné wrote:
> >>> On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
> >>>> Now that the IOMMU for guests can't be enabled "on demand" anymore,
> >>>> there's also no reason to expose the related CPUID bit "just in case".
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> I'm not sure this is helpful from a guest PoV.
> >>>
> >>> How does the guest know whether it has pass through devices, and thus
> >>> whether it needs to check if this flag is present or not in order to
> >>> safely pass foreign mapped pages (or grants) to the underlying devices?
> >>>
> >>> Ie: prior to this change I would just check whether the flag is
> >>> present in CPUID to know whether FreeBSD needs to use a bounce buffer
> >>> in blkback and netback when running as a domU. If this is now
> >>> conditionally set only when the IOMMU is enabled for the guest I
> >>> also need to figure a way to know whether the domU has any passed
> >>> through device or not, which doesn't seem trivial.
> >>
> >> I'm afraid I don't understand your concern and/or description of
> >> the scenario. Prior to the change, the bit was set unconditionally.
> >> To me, _that_ was making the bit useless - no point in checking
> >> something which is always set anyway (leaving aside old Xen
> >> versions).
> > 
> > This bit was used to differentiate between versions of Xen that don't
> > create IOMMU mappings for grants/foreign maps (and so are broken) vs
> > versions of Xen that do create such mappings. If the bit is not set
> > HVM domains need a bounce buffer in blkback/netback in order to avoid
> > sending grants to devices.
> 
> Neither the comment in cpuid.h nor that in traps.c have any mention
> of this, and the constant's name also doesn't imply such.
> 
> > Now it's my understand that with this change sometimes the bit might
> > not be set not because we are running on an unfixed Xen version, but
> > because there's no IOMMU assigned to the domain, so the guest will
> > fallback to use a bounce buffer.
> 
> ... if it expects to ever map a foreign domain's pages.
> 
> I can see that reverting the change is one way to address the issue.
> Such a revert shouldn't be a plain one then, but one adjusting one
> or both of the the comments to indicate the _real_ purpose of this
> flag. (We probably better don't rename the constant, as we can't
> easily drop the old name from the public interface anyway.)

I'm happy to send the revert, but do you have any suggestion about the
fixed comments?

Maybe adding something like:

/*
 * Unditionally set the flag to notice this version of Xen has been
 * fixed to create IOMMU mappings for grant/foreign maps.
 */

Thanks, Roger.

