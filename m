Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BE2F7F79
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68327.122332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R0W-0001uy-UE; Fri, 15 Jan 2021 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68327.122332; Fri, 15 Jan 2021 15:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R0W-0001uY-PY; Fri, 15 Jan 2021 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 68327;
 Fri, 15 Jan 2021 15:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0R0V-0001uR-0s
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:27:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03c8bce9-ee59-4dfe-bb5d-3ab43a4ecd3c;
 Fri, 15 Jan 2021 15:27:21 +0000 (UTC)
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
X-Inumbo-ID: 03c8bce9-ee59-4dfe-bb5d-3ab43a4ecd3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610724441;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UykVy2zAf6wcqSrEB8j6vbYCt/pD9FiIW+5WPcGCOTA=;
  b=TfeMo/mtOTlJ7pzHfB1YrnYIp8pMel7O/ny/81DrDB/FwcGmgu1UtclT
   p2Q7U51mk9xkLxkQEspI/MX53EIftqcWc+XTEhQC8rUUl+9uyDg3qoPJQ
   0PAg9X6kl06qxwlYnoDOWRQcAczwbtWq4kv027MUNwPUKvOS/LFxpHE7a
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yLDFOSOqSCwea5vWZmc9Cs4VIeTa5cBpKEy50yG/bsUyb31B4O90WNHKgeTa11bhwY8Ae5/cwE
 pP4rGaFsrL008kxf14iTi8m1J4ZwKVvcclNFlmg7T72viO52cd/ku4ja5XeOtkkQt0IpxUH6ju
 lyJm8kusyDgWSy1gSRgNfmgrXtokSwttAaZc95cMDpDm9qZG4R9Y/n7lmfpxNrvljeH+Xyi3Bs
 fyB9V3k2HYvzIJd2KkwHfFbFl37DQrD1AkxdlTzWPUixnZQagNm5myv22TcaiU7BTC0gF7udGf
 e6U=
X-SBRS: 5.2
X-MesageID: 35226347
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35226347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv0GhWpKEqU+u1IiyjcsufCYHTIjMfYbl/nXA/0ldY5pfO+ySABQ28w0mgZjx/R8T9ah6pvJ0YOQ7qfThMqs0CsoNBiYWpoJipIzhU+uFfxVHcsZ0ih2CHhoMRD3fQplBCgoicdxQGf8cF3ky0nz4kfm//V/1EgjdYmHtQZAy9OCFV1VE92jiOqJEqpRfkV12n3ildtnjmJ+eoem8g+zDWdJvX6JNfAV5lYPQwuRW7r4ihP90gg4Q0PmjGy65G+S8qu0JXjuTIH7isGzUsZnW7olKJStSB3iV+BBP8uuKlcQDX9RcAwnBIpnEAXC5oCS+PhyAK9IdWzFOihVTTXByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4WKfqrlx0+OgYqe9BwWXs+XWfW/GpOxIemutZ4XtgI=;
 b=iYXO79W9TNPAI0W8yuwLdq/Hj2e9PmtkfTUb5HWgKdd/EuXguTbw6j2sTT5J2xnHhK1WSPX8rgOLkozzIwc5NKPh1yXADMQJGDaXM94O5y7DouiWhlyYIA8c4TLRpgUvQajGJGO8znOC5iK/m5pvSmoNsTmrP0jnZPHKjOza8E636IN4V9CNMY5iGR7jZ2XRo2vf7jQIsyRMnZC5+AYF4Cwg7De5TZmRlGUiQQZ21TSLbRdfHADcceHgc5B3cpTdC4Sn69AgEQHDQyt5jwngqVna1ab2+gPKzEq75qDCChfYRVu+iT9Sad/7DADUvFrcjov+X07MoPza6Prennbb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4WKfqrlx0+OgYqe9BwWXs+XWfW/GpOxIemutZ4XtgI=;
 b=HX5sHfu+XmGRaZwbKwunm9wh/bJqn9DYQg06G/NjinU1xdpPWaDqOxFo1TOt+KQcE/cXaMZ1Cl513NimKSiyHJgE5bFVm+8rK6YfOjFvyfya66BBOePqHHsm1xEOiRDuygorOG7FJTl4lDXjEsBKnDgMHlplRuiUxjhxqWcZDVM=
Date: Fri, 15 Jan 2021 16:27:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <20210115152712.njzgo2zqpiwyhmds@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-4-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-4-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5c79269-6202-47bb-bd99-08d8b96a0b6c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633ED7658699AB161006AC58FA70@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fif+b8zTyVKVWgvxX4OIbFYjcY5iMrQWh6X/sYPqAd8TrofIEsWLCG1+2yqqv3OL8903LwRSRTfz0q0b2OYIyQZShozCWh6njPno4/jx9haNipLxUmUBL6WEqk3dh9HEvHeK1ibo+CA9A+kk8JcLiXYOCVw/p67+CWI7tCBwH1xxW3KSlZVl+sdPojT19HUyARxl+Xd9n2lF86Xq+BIdVZajQeDmwJ3cMrhPgTGX5esXyafLCvLCJbi+bxrvIGshLr/h9DJk9bKetPnOcfil5p9nH+1+xbfFjq2YbP5k2OfU3Ojlg5edy7Oo1Ta52zK5FWkTexMHFAQGQbW+M8rRjIDyXXucvgZIMDsXE6NDqDIc7hrdKsPAkiksfW40pUqyMMUbIep3ASrIPVf1CPPoZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(346002)(136003)(39860400002)(376002)(86362001)(6916009)(6486002)(26005)(5660300002)(478600001)(8936002)(16526019)(6496006)(33716001)(4744005)(186003)(8676002)(6666004)(2906002)(85182001)(66476007)(66556008)(316002)(4326008)(9686003)(54906003)(956004)(83380400001)(1076003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azV0RUozSTlJN2FuRGpRQjZicTlEcStpSVg0dXpRaS9FVHRoZEtOODlUZVhL?=
 =?utf-8?B?cG0zSkYvM1J3QllSdGxWek9raUoxU3YxWE1DR3lpZDYrdkJKeWJXQ2VzMnJW?=
 =?utf-8?B?S1ZmMVdRdEFCazFDTzdGTzMvamdXL2tYQmF5NWVjeDdCZ3ZsWTFTUG80RWFX?=
 =?utf-8?B?RFZ2K3pBYVZCY3o2cTluTFpXVHowME43bExPMmRaakpmcmp2QkNZVHR2VnVQ?=
 =?utf-8?B?OEhxWC96MXlGWXZ4RlRpZS9uaHpBU0RLQjIrYy9TTC9teDFQUnVaSUU4aXFq?=
 =?utf-8?B?YlJZdHUxK1NFdEpFSWk5MzRJQTl3MVRxZXlrMUFVZFVtdE1jUUFZMHN6c1Jm?=
 =?utf-8?B?YlJyZWJjbG9xV0owR2FWaGpxN2hsK2JCS2RhamcyMmZLQnVBSzBrM2lrekFh?=
 =?utf-8?B?elk2dzVyNjhaQ3RTTFlCZDhGTE5YNDFBR005R3lDWnpLT3RIL1VYT3BueEIz?=
 =?utf-8?B?WnM5Q3J4Q1hJdVFBa3dQV1hPMWwyNFZpd2tNLzg0YXZUZWtqNlcxUndKVDdK?=
 =?utf-8?B?My9oenByZUlhakI4a0RIMnJOQ2hBWWs0MHJ6T29mWC9ZZzlZQll4T0dIWkUv?=
 =?utf-8?B?SFJGWHpKcFUzUUN4eDRqV1QwZjVSMDFkamx5U1lDVE1TUkgvZXB6dk0yTC9N?=
 =?utf-8?B?T2M3d1hUaU1YV3UwTUE2d291MkFtMVhhRjY2RUY0Q2VjSFJCaERFNFhkZFk5?=
 =?utf-8?B?R1hJeXhUam9pN0pRcHpOdUNpU21kaytHajBjRENNN0QvdXlXTGFDT0FSZTZN?=
 =?utf-8?B?OEJLbXltT3k2My94eXA2Y3ZwZXdLNFpUb3NjTUNNUGZRd1JMWDhlR245VDRG?=
 =?utf-8?B?VVZSQStGQTBWUXI5MEdiUkM0Rk1VRjJaSHEvRWQrOHZwV21zTjlFZHNiUTho?=
 =?utf-8?B?SEpQaTdmK3hrR1ppbHczb0ZqRnJZaFExYkNUVGl0eDlReHpFeGF2RWdENnpo?=
 =?utf-8?B?Zy80UkZxQUMrSG5YQ2RBU3JnTldoK1Q0MEhLYmxOdnhUUmdZL1pJSkhVcjJU?=
 =?utf-8?B?N3FzQmdLbDdoeE1ISjdGMEhHVktWWTVyWnlrT3U3L1o4OWFMVktzSVdmVHhQ?=
 =?utf-8?B?QXRreURzWXZFVTRPcWM5WmE4YnJQQUQvY0hHSzNuOGU0UjBaOGZ0aklUK3c4?=
 =?utf-8?B?bTZjUElFT1ArelExcUVaMEdwNU96ZTN6cmJKc1FnZlBKS0JKV25kcFZ1SFJt?=
 =?utf-8?B?dCtUUlo0bWpKaVhzQTVyUWtYSUtFcis4elVDTnQ3c2FOUFZFQnNRSjVoeU82?=
 =?utf-8?B?cmFwZHlhL2wxMkZtSzJRVDRjY0xyUGhXMWE2YW5tekxKWEdaUkc0bllLS2pS?=
 =?utf-8?Q?DpVCPyf4rzaJkZ3VV/PHy9EG+f7H/D698C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c79269-6202-47bb-bd99-08d8b96a0b6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:27:18.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F/xj635vByF7G0rRzwSaMUrGL3FE/K92JEv7HNLOq8FzZDhsILZE0MhcgQ576HRms3V0+Ko+7cvTjY0hGLBQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:24PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> When a domain is destroyed, xparams may not be available any more when
> the block script is called to unconfigure the vnd.
> Check xparam only at configure time, and just unconfigure any vnd present
> in the xenstore.

The patch itself seems fine to me, there's no need to fetch params
for unplug, you can just reply on the vnd node.

I'm however not sure why params would be deleted from xenstore but not
vnd, do you know why?

> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

For the code itself:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

