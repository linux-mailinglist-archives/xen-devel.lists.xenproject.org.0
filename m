Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06C2E9BCC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61407.108038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTSB-00013Y-Lr; Mon, 04 Jan 2021 17:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61407.108038; Mon, 04 Jan 2021 17:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTSB-000139-Ig; Mon, 04 Jan 2021 17:15:35 +0000
Received: by outflank-mailman (input) for mailman id 61407;
 Mon, 04 Jan 2021 17:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwTSA-000134-AX
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:15:34 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4420c15b-35cc-4468-9e6c-5f52be276817;
 Mon, 04 Jan 2021 17:15:33 +0000 (UTC)
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
X-Inumbo-ID: 4420c15b-35cc-4468-9e6c-5f52be276817
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609780532;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NpJwomGt9/Q+IgNffIvtdwFKCL0v92g6gcCtXsCKdGs=;
  b=JoOT89rLAmf3tF6FHnYIJ9Yf2NvydNgHHtyfocLgQkK0IePImw8qxja0
   wJmJELoNm3ktSKZdKnaE8167SfvRWEJVv1Y2I8n+pvumDJlf6PTR6+zf9
   08qnxYfz0ARWlldrcNeKvt2TTWNY3xcxQviZVotxEEwOyiNXhWSDc+JGM
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PeRZbu+4DbBiNnlCaWPibRl2HtbZSl0YRyI9TmPh3+izfIvJ72Hsyq1xyGvmJWMyPD65Y8Yev2
 hlpCrffLOKpMz+HJ/uG/nA7hE/Kfpf16ICrzVCJTznKmjxiDj0+kNnw7+17y/9MTUPz7gw2Lt1
 MdfPgBY2xppUjjUg9G69/Xnt+kS5a/t9gUadstGSurXPONrqxDMSCSiGOOBUpUF9BJOehuHDgC
 bJdTfgQpz+kW2n9x82600l+iB+Up+Xs7K7C7p+VYdG2mXGpmYAwGff6zxiCuKwICDSa26W8iVg
 mi0=
X-SBRS: 5.2
X-MesageID: 34396145
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34396145"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnMZ2BUiwqOT1AX3XbjhQ/lV5jyFFIZbkZGw0Wwb0DtFaiI0MNeAVhO0XjgDRR8ReRfqTNxQSw0azt9oksWw2dq7diR5Gr79ufDp+nZx91HdrZepM3twV6UgBNbaVdQxwGQvvE0UNmKJbjFgBishfGZQUrYPSHpclNFQK84z7pmNfT80FOOXfNyeBIMyWeXIms3eqg/Lm1615OiRvDVIovDQbHC5ImQ0Fjhf22Z+KxjaFh/JN3RvZMi4R6j5XWrjKtaDw0emXrRz0YNIdbTgG6p4JDnP1EztgTIf8h335pwyWKhGEzX2tYKtSJU6Mkj0D8bqnPv2bZ946UW8URBjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+lJ+kYmXHrmJtASUrorOoVPOX6FxQ1g932D2st4rA4=;
 b=oM9bZy9rVl0DBRuaWiWIK9/7JPDJMFwUAiZ5qyExQJgyDyiYyYu03+xfOdYnSizDoCtLE5Mh1TWsUKAekqMLbLUsd2BM33/yR9LpUK2SxN55WXGwsaofwByXve/7MNJqWEE/xwJ27kRA/mpbC8a/Kj4kyMZJtcVV02x4xdORtQRVap0fdjVnZL784zSDiszT4R3LuegnKii/+UlzbFIP327FFN+O9SJXgjAzTLWXp3TWDKFcCPJLCwiqiMiHMOKy2UUphjLu4fILw8IXUdADPwTnXpZxAUEeWjhz6Ei4UXtyik05u4SQc95lH8MTdDzYgIZaA6MU3K7VSZ74K/L//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+lJ+kYmXHrmJtASUrorOoVPOX6FxQ1g932D2st4rA4=;
 b=UzqtDMut9VSb7AvFgJZEEjTdrLYX6Kp6hKo1bdkHWbTs3i1jKZ1Be9bBJiDejOgdRiIfPBjY6VA4Hg8BiuVCA8ba90An7fO+teZr9TADZ8fMYj//zugG/ZKfVCtAYJ6qSEHQPH2m0C7iT05zBrc5WuOBo5Y4KnDWkn6Ol6ElZww=
Date: Mon, 4 Jan 2021 18:15:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 10/24] Make libs/evtchn build on NetBSD
Message-ID: <20210104171524.drvnwbqd2y5i4m66@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-11-bouyer@netbsd.org>
 <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
 <20210104102645.GD2005@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104102645.GD2005@antioche.eu.org>
X-ClientProxiedBy: LO4P123CA0478.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0167232-a2aa-4d91-5e4f-08d8b0d45566
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3210489EB5C4274374F2FB158FD20@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flGbj+AQUuMGW469W6mFG9wbxhcPM6/vO7zy1v7EKj7bSkESRPqrPw3/fduzjNtkR10lC8W+0VTdD113wk2jrkg5HkVe+J7rKAcugDm4TKCRIjaD7MsCfn7kLU8cRpr2WtSIKbQtZrOi1l40LKMUT6nVe8IOFHv/0w0dj+UI6dd0bVLLdvGXv+/bPZaCp4D3ivsc1c+PxEm/6e1z89Z4+B5QY2QOb+DBaj4U89024QKX1htDHZDcTdvO8gHErI2av9Xbrf5BSZcMp97JwudqFE5jGj8LsymM2MKSY7v7efiDT0d6NXsMI+LCZRG0b3I+S3vTpRB2UG2XU11TSqK30b7gB7FLRJJ2hWCa+dzeGPc5lmWFnHYL+adaFnjsfIOOORyXpD1pErkF8Y8wzNhXNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(136003)(396003)(39860400002)(366004)(5660300002)(9686003)(8676002)(478600001)(26005)(1076003)(186003)(6916009)(66946007)(4326008)(16526019)(6666004)(66476007)(66556008)(86362001)(85182001)(6496006)(33716001)(956004)(8936002)(316002)(83380400001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2h4ajdUVE1RNUtmdmRPUVpZS3VZVEZJYWtUaDNLUmNOS0ZzWmJGQnBWcEln?=
 =?utf-8?B?bmhZekZCNStHMk82cDlQMlNuaGh2NlYrSWE0NUx4R0k5aGxUcnl1OWVxcnE1?=
 =?utf-8?B?endpaE9aVUZlRC9PeU9zQjJ0LzQ0SVluY1RwaU8yaDBXT2w5eEE0TFk3L2ZD?=
 =?utf-8?B?RVlsQWtCVkVoTHlmOExCWjFiSFVKZHl1cG5vc0p3NXBjMGJMRnN4dGVMSnQy?=
 =?utf-8?B?L2dsb1d3WmhzVEIvRVgxZlMvcDQzUU9pRVFreWZQdnF0UUxKUy8xdmNRL0w1?=
 =?utf-8?B?N2toYWd2eEQ4UWYwL2dzZGpyeUY5TERuclJxaENpNTZVNzU4TUpxQWpYL1NH?=
 =?utf-8?B?Z3lPcGR6M1h2cmU4TUQvRHArY1pEWm5saDh1WHptMDY4dGRYaWM2RlhLcUJO?=
 =?utf-8?B?QllEd0doWEtaVmtmM2ZKdUE1aHhSdzVVU3R4RmN4YVAreGc5M21oSG0vUU9S?=
 =?utf-8?B?WTJ5d3YzV29DKy93UnBHeGVvTVFPaElta3ZwWUZ4NjlwbFVoZDd2d3VrOFFo?=
 =?utf-8?B?K2RJd1pLNjBURmFPMUd3UkVIaTNBMENkQk5rZHE0YkRMbmhjVXN2U0ZzWEVJ?=
 =?utf-8?B?cVQzc084M2tsVjNHdllXblJwajdPRWNQamFSdC9wYk5CQWNJMjZ1Wkc5dnFk?=
 =?utf-8?B?SjU1dC9RcGkvOStPY1lNREFHc0xPeFJmVmtvUEFINll4WUlZUmlYNFU5SVZF?=
 =?utf-8?B?ZWFLYUlFcFVlT1g2VkdKMTUrTEZxa0JIelB3THh0VjI0Q3l0MHlsTWxsWlNS?=
 =?utf-8?B?L1JXcmdyT3grMldvQjhLbmFHTVhRb0FDMkxuZjQ1WEsxNUMxY2VwbjlLUnJQ?=
 =?utf-8?B?ZU5NMW4yRi9BSXNYLzRjekhSdmw5dm1KR2hMdHcrS3NSb3lPZFNXc2RQT0xv?=
 =?utf-8?B?dXNHR2haSTJGTzFXSDlCckQ4dUZlazJibUlBM2ZHMXRZWGllMHpnaFNwVlRM?=
 =?utf-8?B?TDVBd0tmbWhCdjhYT0JFdm10YWdkamo3Tmc5MW05RTRRNVVYeUJpNE9VZkZM?=
 =?utf-8?B?U2VUcUV4OVRnM05FS1BFMlE4SW1NcVAxa2s5aDhFTWFxODYwbmZJWmhWOHVC?=
 =?utf-8?B?REVhOUl6NHkrUXFtT3VtblpNVGR3SjEzd3lWSkMzZXVEcmE0blBuVHc5UTM5?=
 =?utf-8?B?Q1JKRkoyaUpwbnQwV3hqNnR4SHRscGxmWTVMeFJsK3ZrYWQ5b0syZFRrK2Vs?=
 =?utf-8?B?azJFQUlrOW53eWJkVUs0dTBoell4VkIwQkc2TThxR3pGNUVjMnFmSE8rZy9y?=
 =?utf-8?B?ZFVxS3FGUnpYWmttSG9YZmRLNWFhdmZ5emdRQUkyRVdSWXJ4VEZyZy85UVAr?=
 =?utf-8?Q?oTfqVbLJ4Uq83Fxt74v8sU9COWI16QNL4O?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 17:15:28.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b0167232-a2aa-4d91-5e4f-08d8b0d45566
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R8KSD/Ixrclaikg+V3QtQ/vD+pwssEIvq+UVbuXEpDzL+Ghv5ai1RLpj0TCK/skh57jgOiV28qCas7ygQbU3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3210
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 11:26:45AM +0100, Manuel Bouyer wrote:
> On Tue, Dec 29, 2020 at 12:52:43PM +0100, Roger Pau Monné wrote:
> > On Mon, Dec 14, 2020 at 05:36:09PM +0100, Manuel Bouyer wrote:
> > > ---
> > >  tools/libs/evtchn/netbsd.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
> > > index 8b8545d2f9..6d4ce28011 100644
> > > --- a/tools/libs/evtchn/netbsd.c
> > > +++ b/tools/libs/evtchn/netbsd.c
> > > @@ -25,10 +25,10 @@
> > >  
> > >  #include <sys/ioctl.h>
> > >  
> > > -#include <xen/sys/evtchn.h>
> > > -
> > >  #include "private.h"
> > >  
> > > +#include <xen/xenio3.h>
> > > +
> > >  #define EVTCHN_DEV_NAME  "/dev/xenevt"
> > >  
> > >  int osdep_evtchn_open(xenevtchn_handle *xce)
> > > @@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > >      int fd = xce->fd;
> > >      evtchn_port_t port;
> > >  
> > > -    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
> > > +    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
> > >          return -1;
> > >  
> > >      return port;
> > > @@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > >  int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
> > >  {
> > >      int fd = xce->fd;
> > > -    return write_exact(fd, (char *)&port, sizeof(port));
> > > +    return write(fd, (char *)&port, sizeof(port));
> > 
> > I'm afraid we will need some context as to why {read/write}_exact
> > doesn't work here.
> 
> It just doesn't exists on NetBSD

But those are not part of libc or any external library, they are
implemented in tools/libs/ctrl/xc_private.c and should be available to
the NetBSD build AFAICT.

They are just helpers build on top of the standard read/write calls.

Roger.

