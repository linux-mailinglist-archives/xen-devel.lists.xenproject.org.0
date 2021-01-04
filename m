Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B422E9CFF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 19:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61483.108256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwUZn-0000qV-0i; Mon, 04 Jan 2021 18:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61483.108256; Mon, 04 Jan 2021 18:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwUZm-0000q6-TY; Mon, 04 Jan 2021 18:27:30 +0000
Received: by outflank-mailman (input) for mailman id 61483;
 Mon, 04 Jan 2021 18:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwUZl-0000q1-Ku
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 18:27:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82c4d160-f860-49f3-a919-6c2eeda826db;
 Mon, 04 Jan 2021 18:27:28 +0000 (UTC)
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
X-Inumbo-ID: 82c4d160-f860-49f3-a919-6c2eeda826db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609784847;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7J5jk8K8yLp1ghrAyGnHWSUvzTgtCvAxnVcUBMBe6bM=;
  b=AVjzkehUnHmD+F7XmYgg8i1w9xEv4HHeP/cylGINuyOUzDxSsY2GgMi0
   MO2Sh7bWk69wMNUh84I7T6S/DIMnzeSNkkXdMfFGpSqIII2YGR9YChoTH
   1W72SJxE5uQpr+KadS6oRaOpQIb5qK+0CtQAeiE9fIzsshZVqUjg1JapW
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IZT8R2Tgf4t40tyHjUj2HSONtZjc9TKipu+fFSlfju9a+fSOzcmHDjrz9e02GtV6yg0W5ol5wi
 UKIDeGMNJJs/zm3Sc/98Ba1KCTV4V6ksX+iIAcAktRsNgBFl6aD6ryzSOodZ9PPSquDGKub2gQ
 oMBtBzRhLUzV+Ns5z42nV8Noftfq1Y3nagD+zQMJ6VjX4Vu4qkTMyz7tHCb/+wj9m5sH5XnIOx
 xFLatqDHUF0j3Vbdl86zJcnjNkgfjyeVuNE4j7XYhW7vEnLEdC5SChbernyD0/U9m655U5NR5F
 p5s=
X-SBRS: 5.2
X-MesageID: 35625105
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="35625105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5/o0NYCmU50l3fiXU1dkKz44HFOwXqK9FHixVrLfB34rllUcbMyyy2QsPKznfcq3f/HJgx87TKAAHrOO+fXBU6O6DcnQttdmvw1RwpnbuC6KgBOwBzVveqUvH2EIikuHrO2ysXZYoHzuRQMx1SIz7Jt/04I9XfqMGzOgPIPe8XNS8W1nQiA0YmbZETFTYVf743sK3T4AT1VYyi67RRwr1GUWdGWOkXRPcat3U4gWPD3Gc70dF0lqEmViPLtmD0jL1WIYA7Pe9uN1hDG7X0ZElaMXNZSOWoA1oqopMdfFjN0mlsBMhOVFcbTkv7b21BbC0AlXHyrGPbGoP535MaL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfR4UOGY9rPW9TbQq5Dsh/1rtUJMduJz1sBLjTzmvWk=;
 b=UerlriztP0+AeyBjb+x3dGm2FZJ9oGO7rJhu05X0r1TFXPehqx/AEif3b+r3agxPcOeddfC8TOUiqPaPGvVBMxfNoUrCzQxLShj9cBBnLMlBkZp5z47xddL8dGyArz2Kcz5ZmdVIYZngw8vfgFqX3Jg70Gu/+BrtuzhNeIBi9yzMOm5pq1j2vdN7u/ddcjk/NM+N54zyP0sIAL/iTkoqNbxPmzFijHXGOdMkOdIkxe3oA71gehjnRVgVmTFxBfN5ARp6HMlSnnQRxN7gMmmNmeVsip6813CpXQ4v9W9GBRQclKMFKQ/HfCK4GloBoqH3MsNWan8FNEKR0kJjXLLpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfR4UOGY9rPW9TbQq5Dsh/1rtUJMduJz1sBLjTzmvWk=;
 b=NDbtZXLpgKT7xh9rhcLQWOAcEIefZESckeeP8+NkWBfIBL9I4UGpANr5jIISgCj4t0+Z4WAXuLsYTVj8H6iBKe1MffRdKkfgI5Odgj4M1v2OPz/Gn9vZPuEl9XLHebRjcQR4d5ouXcxQFZ+JO7Dk46htuXz7khGzmDCkFLJu2H8=
Date: Mon, 4 Jan 2021 19:24:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 11/24] Implement foreignmemory on NetBSD
Message-ID: <20210104182441.e45vp7wj2s3gkdua@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-12-bouyer@netbsd.org>
 <20201229124630.5ld2dt5o6awa53db@Air-de-Roger>
 <20210104113044.GA1530@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104113044.GA1530@antioche.eu.org>
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b436f201-7a63-4841-567f-08d8b0de0328
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065AEF4BAA439CFBBDDCE598FD20@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mt79qdb8qJa6RXMdNFYSUs5tixLwwqqa2qD8RbjI1dtpluXxNxtHIEeMYeXjEVWZ4cKpbqrWGQPBNr5H0QpYzSkRGpeSk7Ig8EdGg1tPQxiyTozWswckwek9th3tG94J7rOwndRD4wsJJCrPqRlbZ1mw0dyRJzgtezZnVI1m1BZ/0B4mYsYntRmPKqXHe3Tqf5KSKBBV9hF2gpGGSODJkGIqQWgiw/ObMvVQfIDP8bs3+BOvIkvVPitkex40DEd3YZgIexKwKbaqOQE/+olDYtslcBIVtwV04kt5lI36PxvMiKU6ikdezh1yAjnlAtWhdFPKvpl4rl7t7YBPjLHmqOfiKqmd0EzETQyq7rZx9hStMzezhQklFMEPJ+dY0RwYX/7WVK8ArNEyS2c59w2/CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(26005)(8936002)(86362001)(316002)(956004)(2906002)(4326008)(1076003)(6486002)(33716001)(8676002)(16526019)(186003)(66476007)(478600001)(6916009)(85182001)(6496006)(66556008)(66946007)(4744005)(9686003)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2lPK3FXL2NYT3hEdWpoS2Z5ZjNJZENucitRMjh1eDJmRzFJT2FEYUFsSHk2?=
 =?utf-8?B?aWRINk1iRjNnekVjRm05MlRmUlBvcEdqUHJjdkkrTjhESjc3S24rYysvYlp3?=
 =?utf-8?B?cGVXWEphZFZKbzZVL2UrNmQ1TTluVVNOTHZFSG9BclFDQUpnZjJRTFh2NHJu?=
 =?utf-8?B?TDl1aC9CcVZxZzJ0RVdubGVlL2VQRSszbHErR0lPVlkxMFpwZ0U3M2FJcDN6?=
 =?utf-8?B?d2FneDN3UlhEYlBoRlNzNnNqRm5RNlZsVkZId2oxaFd6Yjg2UHlMYlVkeVBW?=
 =?utf-8?B?dWpwUUVycWtvOWNQQ0JDRzh4bmVxMUhOdDFYT3htRzM1Q05xcnNNcGVraVA2?=
 =?utf-8?B?YitmTzBoSitkSGcxdk9zUTBSZXNLMW0vRllGZ3JhSWpXVVV1NWVjWElSR1Jt?=
 =?utf-8?B?MTVDMlZkTVpDSzVCQTU0aHg4VktLNkl1NnFxdzNiNWhCYzh5VjNyenJuYTF0?=
 =?utf-8?B?eGtudldIQkhrcnZ6K2lDbTYvV25EREhXS0dERUt5RHpyZXgwVVdwcGhScHJn?=
 =?utf-8?B?V0RpejRiMGEwWHMwYkt0Q3Vtci84dHhkTUtqbThraHZOc2FsaG5jZUdsd3oz?=
 =?utf-8?B?ZUZNUFI3d0FaWTRoZDFrMGtESWpxYkJTVXRXNDRoRm5ienNTWlF0KzE4SXdP?=
 =?utf-8?B?eXo0TnJmRGdZcEQ3MGRlVnUyZmh1dDdseEdRdm82cWc1YWZIM3drbGZvQ0RW?=
 =?utf-8?B?ZkE2RDNoUEEzVGQyS2JMMUlmL1JDSWxQZWl2SVVIZXlmN1pqUGJCdXZNL01E?=
 =?utf-8?B?SGhaRS93Y3Q0Nm5pTkRCZU5HMkRzNTRKdDNKTnRYTVIwVStNampWR2xGMXFC?=
 =?utf-8?B?cjF2RFhBU29SSTlOOFBldmVJS3loWENjZmVsajlhZXR1L0RoZnQ2MDRvMURx?=
 =?utf-8?B?U3o1UTBaTnFuQW02QlJLZzNmSEpHNGtZZ0VwK0t0OXAxU0gvVy9JTWVlRmt3?=
 =?utf-8?B?MDl5bnczODE0SUZGTkxnSXpiRVZQZkFERFJQL21BR0UvRXpHWlVyRENXV2s0?=
 =?utf-8?B?WnhLa0NBYlc0bXV3M29rNlZFdldtQWtBOGZZVVZ6YnppdnR5RGlTak9wRndK?=
 =?utf-8?B?SWdMdUEvSE9SUThLWkpad2Y3OHg1OEVNeEJHWkVpM1JNb1FXaFZFMTR4c2Uy?=
 =?utf-8?B?ZWRsa1c3Z2V3cHgxYStpcjVLejk5bFNiN2hlLzVveFRvOUFwdExTeS9LVm9X?=
 =?utf-8?B?UDZHbGFpZmUvelhTVWJ3NkFVeVNZenJ4LzRFTlVRRThtckEyWlZaYTJUYUNB?=
 =?utf-8?B?V3dUUFlEdzRPTmhoblFGZVl2RWhjR2JaME9DRlNJZFZVVWxHYkRRd09nZFJV?=
 =?utf-8?Q?Vfdh80GlkiVJ1Y2wQddK5qHCYSH2iyUgfX?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 18:24:45.4362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b436f201-7a63-4841-567f-08d8b0de0328
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5ulJCQayZ4kQBs9pjxbc9LQ6jRV4D3Gw9h0A0lYvOac8e5+rSLol0/S6pHFGcIwWe7qvOgA+hawiUZJmq03gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 12:30:44PM +0100, Manuel Bouyer wrote:
> On Tue, Dec 29, 2020 at 01:46:30PM +0100, Roger Pau Monné wrote:
> > Also a little bit below these prototypes are the dummy implementations
> > of osdep_xenforeignmemory_restrict,
> > osdep_xenforeignmemory_map_resource and
> > osdep_xenforeignmemory_unmap_resource. I think you at least need to
> > modify the condition below so that on NetBSD the dummy inlines are not
> > used?
> 
> This is !defined(__NetBSD__) so it should not be used ?

Right, I think I somehow overlooked that part of the patch. You are
indeed tweaking the define so it should be fine.

Thanks, Roger.

