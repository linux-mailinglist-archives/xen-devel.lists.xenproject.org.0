Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BE30A2FD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 09:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79595.144901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UEE-0005Rn-Px; Mon, 01 Feb 2021 08:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79595.144901; Mon, 01 Feb 2021 08:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UEE-0005RO-Mk; Mon, 01 Feb 2021 08:06:34 +0000
Received: by outflank-mailman (input) for mailman id 79595;
 Mon, 01 Feb 2021 08:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6UEC-0005RJ-Mz
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 08:06:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f268e6fa-bac4-4ef2-8b3d-d91bbbca46ac;
 Mon, 01 Feb 2021 08:06:31 +0000 (UTC)
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
X-Inumbo-ID: f268e6fa-bac4-4ef2-8b3d-d91bbbca46ac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612166791;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KhdcpZ6YsT3jClC7sF00+pqqlfLoNCz2hPSAtqdX3Ks=;
  b=CLqNOQ3KqJ0g6ZZ/now18tAckD5wEhnKi+ONxlAxWYASuHHp1fJZwjii
   VYjgWa2UtnP/mCDAgOxSsjvTDY4zZ5fRTnPM+Dk70AAMWIzDAMRd9XREq
   7/H1zNbrHT3IuVhL/EHl3J+GNVUDT8aRzcVLLui6NfDIh7BqXemzcY56P
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v798ru2Si4AMC9Me2Z4zh+chcNpz/rjcaVN/dMgxcjX7N5IM96Pz7zQyizjrztr69PmVJs/Q/a
 YrkYwPsy6yixEQqPyzJ/8k70v0wlN5lHPWhM7IGcZBOr3ohf7tCcCDCNctHz/HoWn7HtZcM+4V
 V37LTxSYhg5BzgLPjcDDdiv3jvvdXHGoBVjUPaJlfwRSwL92VYzYEoWxdXh0E9Aa9aZNif2Hk4
 7jJSqrnaj4AKO7enrNp4Tt0MBtwLWl2Q7qp0XovLWtfo12Zc6gKpQ5NTPR5ItJr649NIoJyMQn
 qWA=
X-SBRS: 5.2
X-MesageID: 36251608
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,391,1602561600"; 
   d="scan'208";a="36251608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhHi7/7PtDTNYkof8eCQZuw6jMJEclgIOhxXr50FIXg81NfrX5nGCj5nMoQKR+q+0PCJfHPqrHAG/NGJ8kP7nXFBEgb9C0jioav1wBmFAt4bR9eAUEYNCNPrr6ZUwe+N/RyPfOQKY9n2mLkEjL/npSBryYQ3D8txdXY0FVij8VdRid/MY5gGcvNbnGnUXwb/DCAPr3jHwd5HOWLJEd8O5c8ttvvhHugX41atZJ6DvtXynzhLFzhTNgThpS2SaDLB4gMee1D8aCjok9PxmMhY74n9nXCwpIjRvVS4+Mc7CalIgItYMC3rdTmpSTVUG4tf07lCEJEF8F03hztj3WeSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76t+WtlYL8DogoPuNoWMKZ2EhhsETnF01kV83mi7V80=;
 b=PGz76xqVJd5PfddOQR1S2TC2+fgp63/hBZGY6H70KjZDQ5IsZi3eEFtVu/cL/ANBEoz2aW0wqrLyXMQ+M5oC0OB3rdi+ggdpPNSfr4wFUKpu7IQJ9w3EbIUjgZ6C/Lcxp/pH6VOWaQkSwwI50/55snact7gaNaGbvmPC5DqMLeQbfsKPNBgeuSyXmYf4V6fjIH7noJhhxg3RbuJcL7qx/uwU0ZgykwmkYUml8cjHhF4bEKnQfv8kH9HwocEpN5Ijhu3QvQzFYQocz0gVLdlwhiSRvGOD2qonPUYEv8CEaUxiweYF1GfHJED/gz9KU3/l3B9wd2IHCqrObblyRJNZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76t+WtlYL8DogoPuNoWMKZ2EhhsETnF01kV83mi7V80=;
 b=aEZiu2/z9I7omedKKdbHBLTZHpksyzcJXN+tdylPdYyTXyQewxdT5EuHOGjjkC6j9PF2H6I1VlIUNLSkY49gBEHL48oL55gQIOzypKVHQ9I46peskYHepYI7oZ3124LCYs09HcOIVS7+3S427Fn+f4Q/5udtwerNnwMlAMTKFnc=
Date: Mon, 1 Feb 2021 09:06:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <YBe2RSZeJBeMybdt@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org> <YBKbEhavZlpD75fU@Air-de-Roger>
 <20210130115013.GA2101@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130115013.GA2101@antioche.eu.org>
X-ClientProxiedBy: PR3P189CA0101.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3254604-b9fb-4a14-d9f3-08d8c688446d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5081:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508121DAB726A68AFE1C3F038FB69@DM6PR03MB5081.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pnaDrg7IMLceTph8zylUSLWHWCOUNyHRJLIdVyXdqz0a6HWah462MCPPjZ1pAGvFCiSnWmGbORBquEzioVbTIo1FMKUHwK/oKYPY1yu2ZoapX//P6vh6jnkeU44kTFgwvFGAr6ZWHjb5yq7gBL9ku9pjEm9AGlHTDAbauGJRGHb9Uy5KyzxPNSd+1FzXcSNb997Lo+0HRcy0+jFCxNeUktnHjjm6BhL3J7x+pmrWzOg2fG8MFIPakrRDlInu9cIqoSx6C1xP/EQCNh+qQyZIeYV46yslARi9l/kERTlRupRdqru+99um6dAdQbviBveFm7qJT6Zi2X4xR5JccuyB7eN87wtkPpUVaNgxGFtT+6mQIk2xvZYy4DwPHTYqw8+xVwJ8zGTwe/cRhZojiAR5Ffqr+oCHOfrTlULauywDod+pF7nWCUWCQ5+cdNEl8MtiRFw0xkz9XyRYeq34Ikp7mVi3GrtCAB0BK3APj+hIQEiFG3QH/wArHCr9GGKG0bP0QqD2LP3bdDAcJIW4w4kBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(316002)(33716001)(26005)(8676002)(8936002)(4326008)(6486002)(956004)(66556008)(66476007)(54906003)(86362001)(66946007)(85182001)(107886003)(6916009)(2906002)(6496006)(5660300002)(16526019)(186003)(478600001)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTRzY2VDS2JOQkJnanArb2JWY3QvOXRIejI3cFBuRGJyTGszOXR2U1E4Mk9s?=
 =?utf-8?B?Q24xTDFjUng4Z1JRRDN3ZnhpL2V6Tk4yWjBab2kxbGJnZmF0eDQ5bWVRdk8v?=
 =?utf-8?B?VlY1Z2NMQzBLend3V0szTHFESDZYeUxZZmV4ZEJYdTF4WkgzbHN5UWs3ajZ4?=
 =?utf-8?B?ODFydUhMOC9KaTZvN3l6RWJ1WEp0cnIvNnluNDBnOGd3K2gveWVnZEMzc0pH?=
 =?utf-8?B?L0srOXIzcGFJL01YVHpDVGhVTlNCQXhiWUFRZEpTZ3BLUEdCckJvSFRxYUds?=
 =?utf-8?B?cHd0Nk5zN2FXN1NGU0VTVUpGc0JmQXc2RXRwUUx1NDdReWpJK3pIU0dONEk2?=
 =?utf-8?B?YjhlOE5UUmRmV1RwMmo4TG5RbE4yMGtLb0k0QkZrb3VUQmZTeCtiVC9tS3RR?=
 =?utf-8?B?KzZ4N09ZR0xramxLWlhJT1dQWkI5dVo0QWgxUTRBNjhEdUpTOENERC8yUlE3?=
 =?utf-8?B?dEpVK3N1dVN5NmQ3d0RmdUQxRCsyU3psQWd6Rll5VVpzVW5mQk5keHdwU0xq?=
 =?utf-8?B?ZVpvNUFRVzZIZTc1aWl5U1NHSmVlNDlwdzZCcCtrNnl1emZSNU45Q08xa0pU?=
 =?utf-8?B?eTJsMUx2S0pVUS94Ym52Z3FWQTgzcnhUL05vaGZETEY5cjlCaHczdS83K2V3?=
 =?utf-8?B?WXcreS80Mms1TjlIOVhKWU9ETXh1SnhZQnVBK0pWamNrWnY5UHBxN1luRDZl?=
 =?utf-8?B?VGxNamJjWmxUbU9PMG83MHZiUE9mWWpwSHVqVmhGZXQxZDhrdm4xUzNiNHlJ?=
 =?utf-8?B?cThheG84Tk0vUjUraHI4SGphaVVJY0ZzQlNTVjhucVQ0M0Y1bEgwMmROTDZC?=
 =?utf-8?B?V1JuZjBDcUJuNEp6MHpXb0tRWCs2SzF4NWR4a1JoNHU3dWJmU2l0ZVRxWDVF?=
 =?utf-8?B?bE9ITVhoZlBVUjFqRXJhcDdrUi9ualQyQXU2MG5oU2tvalNBK0xEc3luR0do?=
 =?utf-8?B?b3pZeFNKbFZucE5OSEswOXh6VTBqMmtiUUpQVlE5ZFd2SE9la2Zrby8xMFQy?=
 =?utf-8?B?QmJEM0FqOGlMQjk1QUtaenpBN3I4N2NoZ2xmUEd2YW05SVE5T0lSY3JqWURy?=
 =?utf-8?B?Y3lJSzR5VHlQclNwRFpQS3JpOTIydkNEWmg2UzJMSDR5U2Z6MFhPZ2M2amVK?=
 =?utf-8?B?SVArU0ROUFBOYThpYmxjcGxOQ0kzeUxYZW1QQlJPaDgwT0FtcFhYNmJxWUJr?=
 =?utf-8?B?eFEvNG9SUklmcG9FZXFSZmk1aHZrUjAwbTBzUFM4QU45VnJvK1Z6TWZmZ1dF?=
 =?utf-8?B?NFZVS1RmODNqeUU2VG1EUzgvc3AxY056dDN6aVVvTUgyVDB1ODdIcGFGcU5T?=
 =?utf-8?B?QnVDcWRQd0NjQ3VIRjVFZWhJMk8rN2FQNkpUTURuQW5hYTRIMEJEbUlRL1B3?=
 =?utf-8?B?MGlDY3ZINTZuV3BGNDllaDZYY2tzbHJXbGdFZTNLZEdVM1BSNUFTbHV1ZFdy?=
 =?utf-8?B?WDB5K2xVNlZrd1ZVb0w4T3p1dHZYRFIzY2Y1Y2hBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3254604-b9fb-4a14-d9f3-08d8c688446d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:06:24.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X0NR4+4sEgkrTiNrlR5ARorjzPupNMkt4kwazGW543dq6uGTg8uu2x96DXJcglayU7I3Dr8nY1lRhE0mSt5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-OriginatorOrg: citrix.com

On Sat, Jan 30, 2021 at 12:50:13PM +0100, Manuel Bouyer wrote:
> On Thu, Jan 28, 2021 at 12:08:02PM +0100, Roger Pau Monné wrote:
> > [...]
> > Also, the qemu-ifup script doesn't seem to be part of the NetBSD
> > scripts that are upstream, is this something carried by the NetBSD
> > package?
> 
> Actually, the script is part of qemu-xen-traditional:
> tools/qemu-xen-traditional/i386-dm/qemu-ifup-NetBSD
> 
> and it's installed as part of 'make install'. The same script can be used
> for both qemu-xen-traditional and qemu-xen as long as we support only
> bridged mode by default.
> 
> qemu-xen-traditional did call the script with the bridge name.
> This patch makes qemu-xen call the script with the same parameters,
> and add the XEN_DOMAIN_ID environnement variable.
> 
> Is it OK to keep the script from qemu-xen-traditional (and installed as
> part of qemu-xen-traditional) for now ?

I think you want to move the script into hotplug/NetBSD/ because it
should be possible to install a system without qemu-xen-traditional
(--disable-qemu-traditional) and only qemu-upstream, and the script
will still be needed in that case.

Thanks, Roger.

