Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB036327AD0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91383.172753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeu9-0000BD-0L; Mon, 01 Mar 2021 09:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91383.172753; Mon, 01 Mar 2021 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeu8-0000Ao-Ss; Mon, 01 Mar 2021 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 91383;
 Mon, 01 Mar 2021 09:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGeu7-0000Aj-79
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:31:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ff5e09-a63d-42e2-be7f-a31152ad6744;
 Mon, 01 Mar 2021 09:31:50 +0000 (UTC)
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
X-Inumbo-ID: 35ff5e09-a63d-42e2-be7f-a31152ad6744
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614591109;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=emrEn4bzA/FIoA0ektzRYWh9isLrCqbZtL51hNPlLdc=;
  b=RsoaJjTrCG+FiY/O92z3xUKQXEWZ4fF608v4tYbM42ahzQBu4TDEOaCJ
   6f+LO2ACpeqRFod0SjEu1mTieXFo2sN0TA8KRQQgi3YjUcJIZUdlkVylW
   ILABzYG/5HTNa8Bz3iWhOj3vneUq9JsmKLztP9nFgKf1rDx9agZ1cwBsu
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UPcTxmatAYx10PeP5PAyrxuPp1nsdqHW1zNsCXkDF6PXx/9UC+pFRUQlEuTYLQFIUeJJlysPec
 V1pp0RER2+i7UQ9uLsgWjG+xM2dOg4EcQ7/iikkoeNluKvvhaQOb+NHelDgtPaj+BCozFT78CR
 kgiXUMTQDD8qgKCcGMYhSLN8peW2pj+NcVPcBRQ6NKDNTJPIXxUySN4b639YSfxwQUydTaGm32
 vpQkn47YaRQFspMVHTLjwncWqx9TSaThN7rkXzYsNboSwF4mZQo7/6WPKtjbQVsUBt/heHuAMZ
 IC8=
X-SBRS: 5.2
X-MesageID: 38234415
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38234415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWWbJQ6lHDZC7Zoz+xRHSQKeP12OlLsyo/xBp/awUdTRQS15vZUyUin9emIPYk89RPV++5gETNfXWhKa17aQfTBy9XgJV3lT4Rj/SiShScILaaAI9Nq3AVSWV1nUJyS1cqTrWpGo+nceeCivJZnKBzWIvAUMl3qSi0dsKkuP/sSodf1D354AL6ORvoRgvDTlGJR5rZuCuec9xo8bElpWWYZRR5hrrggusHvJjbp6nt36Trn6R9pk5IdN2uJSqECMTcpAWRw2SS1XxKhWqIUFeKZiJU+NeezKc2tv3N4XjbbcCaFt5uQqq5XS8t9jf5UV7gx4sVLAxl817HMuOsp4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYZkX7geCxLSO9G0LY8wuBLG4qVdOP9FeM2/vBRf5d8=;
 b=F5DesffL9UHcq9RFWhFVBZI3k9h/EBrhmkPTz48gzLjWoOmt6i9VOQ7fDbYtePeAt1znX16HzvoKqkP3oT10rKvNqzlGUcEQxPlgJHsv/cJdi04IDEpS2rdx4TBlZ0321mYAUuwxguBQJPCpYkVyeZKxUHiwQbX5QbI87NgE5xjGqMXgqImHYjxcM4KxwWRPYlzXwzK8RBbDq+EcBEv7Zs5rVZMSNjOcr2x9okr+Io4bmQctk6p/GmLtlkd4ydLHV6hxtCTZmB88Q+KgSSIvRPMaKMN39IG0LibxS+X4hdzHSE8sbE++/XOoDQlNUNUy6YhxvieW/jlauOyG2rtz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYZkX7geCxLSO9G0LY8wuBLG4qVdOP9FeM2/vBRf5d8=;
 b=iXLdwHefOhJFoJbsP5rSwAzYFVTZkRXJhx9XTYflNeV/AHybTJyoTu1pcczIxDdUpSRdaYkeIKhsam2NtOwuq6RFjngKHT8TBmVaJ+mMNGVzhIbgIjDfDne1cbQ7HZDuIw3ha5/dUroAwj6M3ptpzQRUqmL/yx4M7sZ/cHJ5LrM=
Date: Mon, 1 Mar 2021 10:31:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Ian
 Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] automation: Fix the Alpine clang builds to use
 clang
Message-ID: <YDy0fZ7hkXv9Du42@Air-de-Roger>
References: <20210226110233.27991-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.21.2102261446490.3234@sstabellini-ThinkPad-T480s>
 <c08d68a5-3c32-c6f4-dcc4-6fac29795b27@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c08d68a5-3c32-c6f4-dcc4-6fac29795b27@suse.com>
X-ClientProxiedBy: PR2PR09CA0015.eurprd09.prod.outlook.com
 (2603:10a6:101:16::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8319ef4-f95a-453a-ec06-08d8dc94d516
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-MS-Exchange-MinimumUrlDomainAge: gitlab.com#6255
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB321034CA2599F3AF69491D998F9A9@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fZFJmQj2yvxOiduhi4nQxwDhkLXYUKG2TtMvPRVaAXll7NBRjX8AneCsBEZUMnKmA5XTKyfw10P4q6+oOdvqyAWZWfSQiA/sxosyHK0JuN70yt3Qxeg+deXuJzJmWTHcdsLmFNVRHIcBGcrp6hJRDi4qRdOjL8/KW+UN2AlDrS4z3v5nKIB59s91JD3wyS7gXF5fHYNulFbx2UBoycJSqYrkgTOhctj8o2FBSJ6veiFyH+vY+2F3KVkuzVe53+JXoWWBiLBZlu93pul9Q0DkZAwzXkuW4hDt21JIYLLQB5G0zPyHE6npNSbCzRvmrJHpxtnONwxP4X0atEaSH/WtttFKQ3+tawUfuAjBQ3sA1sKb8kd1NJFcc0SOsniiKSCAx4nZmIzw8716XYxlPHzQ8xUmhYk6ywyBwdlph+xqD+mw7M9mH//eEEZ+dCO3xSanrUMAmXFsQSHNVIonkwmDKnvgXTVKvkXNilGVVO4eIlAaLeLrPrQlgSrDBWawvcSi0hZk5Kj5t+jy1R2QOBFPin5feVgOclf79vwM/9X9Kb8dxO7fLfx9JZxf5Oj4jPieNp2j99yOT8es/+AUNCuIie813yjoRZuz8QnqQ07X1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(54906003)(86362001)(4326008)(6496006)(316002)(107886003)(5660300002)(53546011)(956004)(33716001)(66556008)(6486002)(186003)(26005)(16526019)(66946007)(66476007)(6666004)(8676002)(8936002)(9686003)(6916009)(966005)(2906002)(478600001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGJSaTlXbDJNVmt2YjNmazg4bWU1c1JQYklyT01NcWV0M0tlSjZYVUVLb2E3?=
 =?utf-8?B?dVgzOXEwMnJnV0xTTHdHV3V6K211Uk83VGVLNStETi9GNGJIaHZIR0JiQ2U2?=
 =?utf-8?B?MjhqRzM4eVNFMTAyVHc0aExOL2V3Z1lwY3Z4S2RsTjlOaDJTN09DVkUwa0Q2?=
 =?utf-8?B?aXk3VzM4Q3RYOW5TeWVyUWIzSFVSeG9YcXpWUzhsVGwxQlNwMkpad0VTNGJj?=
 =?utf-8?B?TGRBTVJEV201V3lFeUJ2YkZYa3hWK0tTK1JMTmU0M0YxdjIrUnBWOTdWMWo0?=
 =?utf-8?B?T2hLR3Uxdm1XSTU4NDNhVVFab2FaeWhRWkkyTTFwY3NUZW56TWxTWWt3R1pj?=
 =?utf-8?B?azc0anMyN0hnSS9VUi9SMmRodXBBZXBndWdWMVp6WXpNalRRZ0x5K1ZWRXJM?=
 =?utf-8?B?Q3ZlV20rWEkva3pOZXBwME5SY25ZK25yN01PV1BMR08ySW45YjV6ZmFzeHRH?=
 =?utf-8?B?QVNGc0pqVjVlbWx1QkwyWkFUc3BObTJWdkpGMHNrUXZSMGJVd1RlTmlHaGpH?=
 =?utf-8?B?OXA0eGJqM3o3S2Z4V2h2bW9HU0hEL1hpRFF3Vk1mVE84MVVrNnpLRlpHNlNU?=
 =?utf-8?B?OVFLS3R0UzBZVjQ5YUVIYTRiTWdpNk9YZ244UTk4cG9MeWVMTmxkWFg2OVln?=
 =?utf-8?B?L2x4RUt4TjdTNWl4WFRqRklPODBxWEIzalYrbjlKT2g1dklZVCtVcVg2RnpU?=
 =?utf-8?B?dE9GKzhRZVB2bXNjRVFVdTJJMVpERkw3WTE4R1VKaEJDeE9xck92QlRwT2dF?=
 =?utf-8?B?MUdzY01FVTlhRk5GUUJkYTdHcCtKSlhCM1hCbWxyOWFSYnBQUitWWW5YRlFO?=
 =?utf-8?B?QUR2eE42QXdmOTRxd0tKblIzUitqNE44YzI2WU5mUWdnOXVCSVV6UlJXcUxV?=
 =?utf-8?B?OThFcG5hNElPOG90bkJqQXhTVlMwQjFGRTRvU2tHTm1TbUs1TXZZVTB1NmlY?=
 =?utf-8?B?eVFzam1HZGxPa3o0clhDbHkwNDZwUHFBSDJnU2RNYUxJemVYQVFBeWg0VkJ3?=
 =?utf-8?B?UW1McDdGVXpTOE8xRTdlODhPMUIyUnJNY2N4U3R6M1dWUytTR2s1VDc3Rzc1?=
 =?utf-8?B?QzA2Y0tZc1BiZk1QUWhTNmMvOUUySVFXT29aQjA1R2IyTUxrd0pKR1NjSFpT?=
 =?utf-8?B?TDErYy8wS2RwczBSaU1INHdTOVk5c1F6UVI3TVpVaXFNRWpyaXhLVTlPbXJs?=
 =?utf-8?B?cHJPUU9kMzlrUm9PNmRaVkIzUnlremxpU1BmRDdYa3Z4ZG5TKzY1U3F2aTVn?=
 =?utf-8?B?bEg2ZUNwZFQzTG9jVElqWjF2UDVCeWdiNi9ZQ25VYXFpZjFxdExVeDJETmF4?=
 =?utf-8?B?UTdzc0J2SzJocmg1YUZCc0ttbi85c2dwakdRcXNMLzk5eVNXMFA1Q0s3QjJC?=
 =?utf-8?B?RUFXRG9RZ3NXYWx5b3VmUWpST1BFemhrZTFueWgwY1B3czQzZDRFQlU1VGpW?=
 =?utf-8?B?TkErbzZUbjZ1cDlpc2p3enJLQ1ltWm1DMHZPWDcxcVdjV0F3L3NuK2VGZ1lV?=
 =?utf-8?B?WXNpZFV0R1VYMnhCZWMrckJOT0lsS1lCWDNDRVMyWExUSXJ3NkhpWmFyd2di?=
 =?utf-8?B?RUhJTjBrNG92d2RDWkJUOWppaHRSMjdubFE5NkJycUVuSzRaRStkbjVBaXdn?=
 =?utf-8?B?LzBFdUhrSjZVSXlERHN2cUxsby8rUXFjb203bXpzSDRlbWdjRzREajc2NTJH?=
 =?utf-8?B?MS9ZYkd1M01MV2lTWHZMOEVHSmU0cDZHMUFZZkNvUE8zaWRGcndBQ0pJazNh?=
 =?utf-8?Q?QciJnnmVOFXpkLNY2X65vbVWA74N7Iv2mJ7PS4u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8319ef4-f95a-453a-ec06-08d8dc94d516
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:31:46.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpl7vY7iEqPpCICJGGJ9IEdlA5K73CG2sFb82ipwgsbopZwGLwsvYjLDZUjyGWqB5Bb2lbgSfP4fKfsc5/Xduw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3210
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 09:58:48AM +0100, Jan Beulich wrote:
> On 26.02.2021 23:48, Stefano Stabellini wrote:
> > On Fri, 26 Feb 2021, Andrew Cooper wrote:
> >> Looks like a copy&paste error.
> >>
> >> Fixes: f6e1d8515d7 ("automation: add alpine linux x86 build jobs")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > 
> > Thanks for the patch and of course it is correct
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > 
> > However unfortunately it breaks the Alpine Linux gitlab-ci again :-(
> > I created a branch with Roger's patches plus this patch. The two clang
> > Alpine Linux build jobs fail:
> > 
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686530
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686532
> > 
> > 
> > The error is the following:
> > 
> > <built-in>:3:10: fatal error: 'cstring' file not found
> > #include "cstring"
> >          ^~~~~~~~~
> > 1 error generated.
> > make[10]: *** [Makefile:120: headers++.chk] Error 1
> > make[10]: *** Waiting for unfinished jobs....
> 
> Doesn't this suggest there's a C++ compiler installed without
> the headers also being available? The headers++.chk rule
> requires neither or both to be present.

Right, that's because the include path for clang++ seems to rely on
the gcc c++ headers:

#include <...> search starts here:
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/x86_64-alpine-linux-musl
 /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/backward
 /usr/include
 /usr/lib/clang/10.0.1/include

It's solved by installing g++, I will prepare a patch against the
docker file. I've got no idea why clang doesn't install the required
c++ headers (or simply pull in g++ if that's required).

It's unrelated to the -ffreestanding issue.

Roger.

