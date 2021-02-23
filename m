Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C43227E6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 10:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88664.166831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEU5V-0006Gj-Mf; Tue, 23 Feb 2021 09:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88664.166831; Tue, 23 Feb 2021 09:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEU5V-0006GK-JU; Tue, 23 Feb 2021 09:34:37 +0000
Received: by outflank-mailman (input) for mailman id 88664;
 Tue, 23 Feb 2021 09:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEU5U-0006GE-Ig
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 09:34:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 471dd317-2404-45d0-a7b4-149f9eb8661b;
 Tue, 23 Feb 2021 09:34:35 +0000 (UTC)
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
X-Inumbo-ID: 471dd317-2404-45d0-a7b4-149f9eb8661b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614072875;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QnwEhqK3nf/JJvD0AKuux9RAyrH6udqqWb22TaRYJ5A=;
  b=Z/hu9Y+TrFTqvlrXyEkU8Jwq+j6zcB/5oRIsNfhCCSPji630IqeJIuqW
   zd2NS63yL2FCCw69rwFcKshvFo8bsiXKFB0i8DlWpK3aWEWPB66W/Bb3N
   ULrqCt0oU9WIsgkae35ROUcR0BwMI9HwAsK8E4Pwrtr3nLDrYdb+BNAz6
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3IGz5ZaZZzreJYT8gcBgo0KqgcsOggKGYJVPHI8BJ63nMU+Bup50SVrf/T2PGg4SMMSn4FNQpV
 NNIFztnTp/r5nU0DYVJIGg5Td/TUUp8byvExfZ+Z30Pvf+Wr3RGgdMxqcStIy2AIWGjFBfqIRv
 aP/SqKPAHr3lSatL6qYoECsl1jKoO5jW5bsp+vFaUCtDHuwu6in+qm+0dw0uGaUXLFnahvYqeU
 NeJiur5gXNdvKPAwKwRwLIHLix3xoABMnbU+SdKWQ0466oCdZ3eeYlaIt6y31pg8KaIJukwZ/P
 isY=
X-SBRS: 5.2
X-MesageID: 37805208
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,199,1610427600"; 
   d="scan'208";a="37805208"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZcVOjLibKuqskGHYwceMldM9ELA9RVocPjMj8Txzq4acUDcvFhB+CFvWAHV/4CR5afbSouqjOP08FP5qRyk+FPA4HTSwGIifH9tUPaeX+MwTXXuLChRY7XEl1jItgUcjLnKZi0X035GYpOfnQjmdIkjYmGuYbKyW8j5Jc+KvjTYWAFIY5RuzSa/HB7FNG2ixlajnd0eiLgGFunhXaFFTh5reQ012R1YGi0z6GNF2ejk4YVCsrpMD9YEqmNxpmg1xtds2qbywfIFf1Zr7LJw8kKB8NAmgqm6daxDr8EHzjibUgGYcVBPWkLPUJaQ3rS9oaB9b92zy1LzI129FA/YkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylQB6UdonLTXrzMiypbu+eZrZZWQq2NInzj2fKjWhaw=;
 b=ZuOMi75qzDGu+nVPTJma//E8+UVmgLG/T/hMsaz+SbZ7sh25PfP4rQRSAu3ZPhT7OlxXALYvGbaGdj8KxaNlu9Zy2SddbbscozCrXqeN0efdzNBRNfM2ZDjPM4tMEmp3ikuAUJ8HI3IxVWF0qcp1x+o3pdVycSPkqM8QT9gABOax8U7yN6lZUpN5JhYCmgehe68OolB6UuTvMEoJauZbxp6JktNjWVd9xNJoehNngNTFQLLKr5oUoa40TkCGtTXmdAyMeZx3XzKJ7KhiECRMMzoH4IqZc/iDB+KgxW9PTxjzk5mQH6XjxpGAW/p3cWhCqO4fr4HX65aJlNkvyt4r7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylQB6UdonLTXrzMiypbu+eZrZZWQq2NInzj2fKjWhaw=;
 b=OZxk6cd+iSgjDzyxP3cRW1+UyF5Xdj2N3mX/1vyS4UunqLQGG0GWjimy5WxLGDx4Uy5Ivn5O9yi9KmWmukli7whVp5xiKmMsc9N9O6Sds6n3tczlITDMVDmNcBGwBjJh5Zfpfzu12UvTQaM7MJ6a+N+wSMHDz/ugi8eymgRSw60=
Date: Tue, 23 Feb 2021 10:34:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDTMIW5vBe0IncVR@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
X-ClientProxiedBy: AS8PR04CA0126.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7a4ce81-f4e2-4ccc-c6e0-08d8d7de3922
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56088A919674474F3A7D7F4B8F809@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNEOSzSj/JQ+waKZOEqHS1PN6dEZFq6QGnK9HFA4q3FShOs/RdeaaxXhyKZycuTwo+Zii6376rN0FvhwN6rfmjUj+/60qiaoAH0KdyTVtIEEbdbh5ZEX2K5Qi77A1TJG5JK80pVG7qdK9EeKuCH+xFi0Gg63B9xaEg6h/+PIB/Ngi9kqvcKARE+uJDbRNBa5hUiX0OGG78qxK8U1tdKpkCzvZ9Dzpy60XNq6cH32kojrxy1gIL/ObC6chsBwQZP9Syijz7w6Oy5aiOA6IxFq0MlJtRzZaJkPtptbuRVYbYZfCyofd12t9Ldk6bwrEKl8HWN2Tag2Vg0EK8H/yRj7JWNvPe/djLXiwtAoxF+Yq1drJOIC0ihh/u8iFAQqiMafg2XA4WgO5m1EWoLaMIxAGLm2NDzz34iJoN3lIUdgS3wvoXWXj9LoU90jlGC/i8ySiq/sR8txF4M3bPk4RlQh+q5SAPH0KGF2ACaKjiAfaHHGl+uAkBwDlngTX7QB+G17Mi7S4RDB0JrHRlgnIjfHaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(346002)(396003)(376002)(39860400002)(9686003)(316002)(478600001)(4326008)(8936002)(8676002)(66556008)(66476007)(33716001)(6486002)(186003)(83380400001)(66946007)(26005)(2906002)(86362001)(6916009)(5660300002)(16526019)(85182001)(6496006)(6666004)(956004)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTdUUzFZaFV1OUZGRmhWWWwxcG1JZlkvMnlZSFpzSTZ0NFkyeVhOVEFJejJj?=
 =?utf-8?B?Q3k4SkNSNFNuckVMby9VSExXNGJ6QWtGMjRRc014R00wTERWNFlQS2xHdkJB?=
 =?utf-8?B?cm02MzI4QjZteHloTTlKNG5obStCSjRoK1ZPcUhjUEtscm9uRVN0MUFvRFJN?=
 =?utf-8?B?aHgwR2lnYkxJd0wrSXZ3TUNaenMyYnVhZDVsQ3dlbTZNb1pBZU5yOEtpMmJL?=
 =?utf-8?B?cmJyRTR4ais0S0d2Ymo0R2hyKzhzeURST2JhSEZPKy91dmhyRWZTREdwaEpL?=
 =?utf-8?B?aGNqRW5YSVpndzMySVJROGFlSi9VYmZHRXBsdFRYTG9hMGtkUDNhVkVhaGEw?=
 =?utf-8?B?RW1XNm1vWjZPby9lU21DOERoR0dEZlZqZTBHTW5DdllnbENudUZHcmtza1JX?=
 =?utf-8?B?aTZCTnlpcHlxZEpBVUZ0d3UxeG9NeHZQMklDZ0pPWG1jMlhYSHNob1NLS0hn?=
 =?utf-8?B?eFlERm5wSGwvR1VJVmphRUdWS3NxUEh3VjlHVDNrc0hlL094cklhYW9NWmpz?=
 =?utf-8?B?NUNJSzZEUGVueFJxZWtxOVVsNnVFR25pUjhTenZMc2FaRDdnUEQrREhNSzdQ?=
 =?utf-8?B?aW5yVlFxS09FcTNLTGVkTERGcitlZmFJK0pkWm4yWEprRlgveU9VVEFyZThB?=
 =?utf-8?B?aTljWFEzOTJPdUM2bm1JZFdnVk1DQnR5cXNzZG1zb25TMmtzMFdUQnlhNU9N?=
 =?utf-8?B?NjJsT0JQQUw2aFcyaGhsTkZ5TTVZdWtKQ3daZmE5SnlXTFVHSDU2UVRzbDBk?=
 =?utf-8?B?ZUZZV203SmJHcWVsMlV2R0pPNEg5YmNiRVROSXE0VFFpeEhPd01COTVQVjFF?=
 =?utf-8?B?b3NQMDJ6VmswaG1uS2Q5UkR5VDBSZDRLakVEcW9sdzJSU3NQcFFkR2EzTytC?=
 =?utf-8?B?RVNmSlhmZUl6Njd5ZWd5cWx3dlk3V1hnL1BUaC9iLzAvclJVQWppSHVFQlJY?=
 =?utf-8?B?b3JhcVRTS2gwTkRwMEk0eEJFVnVjSFJQc3N3SWlTWklXMEhIK3lZQmU0WDNR?=
 =?utf-8?B?TXNrZ1hrVE9OTXRRREJ4S3p2QlpxcVhKbTRHR2VidlJlM3gzb0NFOEFVT3Mw?=
 =?utf-8?B?d2JHdFY5cU9wTXpNNE0wdHVHeDZtT2k4Z0JMYTRwMlhmVnlXN09iZmNpS3JN?=
 =?utf-8?B?SmE4NFQ2QktYdHhWUzVDbnlCamxiN0I1Wm0zaGVudGExMkdVMkdMQ3ZGc3Nh?=
 =?utf-8?B?czh1M2JXUEFGQm5ISDlpczU0WTJDbGdPTVZyRWYvcGwzUUVDWE9Rb3JHcnl5?=
 =?utf-8?B?Z0tJL2N5ZTh1THhKdnl3WGFGL1NpQU9TVWNLLzBjQi80WVlsNHAxYmF2dEp5?=
 =?utf-8?B?U3dIMEFYa0lEMmI3UzBacittMllMRVRWU00zcjV6MitmZlJDQnR5aXFqMk5m?=
 =?utf-8?B?QlhVR25yamlJSTVndmdFQWxlam5JRVZ5UGRaWW1vbUZFYkRoemRxZmNOTEpp?=
 =?utf-8?B?cmQ2REo2MGlJbXNZVFJmZVByYnVLZjJWNkhGL21CeXErTmxTTTBmTVNVN1N0?=
 =?utf-8?B?cExNdGpJWUY3T2pDTXlPWDZiMkdWQWJTTWY3MHNqMTUrU3J1YVRvRjBIdkhJ?=
 =?utf-8?B?T2xvVnl3T05vWE5iMGwxdU1EWm5vbWdsVUxFZithREJhalRpQjd6SCtHVkpI?=
 =?utf-8?B?Vy9hbjdGRXBlbi9tUitjQmhSL2NKQmg3SWJkaTJ2bW1haWJBQXNEVm1HZzI1?=
 =?utf-8?B?eW9rR0FYUGxKMzVtVFN3REFGUTRxd1hQZUlsaStjL3M5a3ZDZGp4eTJhdVdN?=
 =?utf-8?B?VDluZERJSVdkMFh3TzZNSWg0a05HY0JQSHNHaUx2TlpBK2N1M3lNQnBCSlRt?=
 =?utf-8?B?UGN6TExONHlVcFNhVnBrZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a4ce81-f4e2-4ccc-c6e0-08d8d7de3922
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 09:34:31.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyH3kg3KABvM2jKHsnpb2jvNMEG8+IowpUEW0C0fJzGyJe+1lJ1kvoMBdElPjon4cagUmbS2ocX18Yk69s7VXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 08:57:00AM +0100, Jan Beulich wrote:
> On 22.02.2021 22:19, Boris Ostrovsky wrote:
> > 
> > On 2/22/21 6:08 AM, Roger Pau Monné wrote:
> >> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
> >>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
> >>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
> >>>>> When toolstack updates MSR policy, this MSR offset (which is the last
> >>>>> index in the hypervisor MSR range) is used to indicate hypervisor
> >>>>> behavior when guest accesses an MSR which is not explicitly emulated.
> >>>> It's kind of weird to use an MSR to store this. I assume this is done
> >>>> for migration reasons?
> >>>
> >>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
> >> I agree that using the msr_policy seems like the most suitable place
> >> to convey this information between the toolstack and Xen. I wonder if
> >> it would be fine to have fields in msr_policy that don't directly
> >> translate into an MSR value?
> > 
> > 
> > We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).
> 
> Which, just to clarify, was not the least because of the flags
> field being per-entry, i.e. per MSR, while here we want a global
> indicator.

We could exploit a bit the xen_msr_entry_t structure and use it
like:

typedef struct xen_msr_entry {
    uint32_t idx;
#define XEN_MSR_IGNORE (1u << 0)
    uint32_t flags;
    uint64_t val;
} xen_msr_entry_t;

Then use the idx and val fields to signal the start and size of the
range to ignore accesses to when XEN_MSR_IGNORE is set in the flags
field?

xen_msr_entry_t = {
    .idx = 0,
    .val = 0xffffffff,
    .flags = XEN_MSR_IGNORE,
};

Would be equivalent to ignoring accesses to the whole MSR range.

This would allow selectively selecting which MSRs to ignore, while
not wasting a MSR itself to convey the information?

It would still need to be stored somewhere in the Xen internal domain
structure using a rangeset I think, which could be translated back and
forth into this xen_msr_entry_t format.

Roger.

