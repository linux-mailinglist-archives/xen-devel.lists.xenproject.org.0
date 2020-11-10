Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12B2AD837
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 15:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23436.50206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUD5-0006wA-Cc; Tue, 10 Nov 2020 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23436.50206; Tue, 10 Nov 2020 14:01:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUD5-0006vl-9N; Tue, 10 Nov 2020 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 23436;
 Tue, 10 Nov 2020 14:01:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcUD3-0006ve-19
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:01:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a996ad91-ebbe-49d6-ae82-38f33ce2576f;
 Tue, 10 Nov 2020 14:01:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcUD3-0006ve-19
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:01:21 +0000
X-Inumbo-ID: a996ad91-ebbe-49d6-ae82-38f33ce2576f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a996ad91-ebbe-49d6-ae82-38f33ce2576f;
	Tue, 10 Nov 2020 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605016879;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4nQbDztq7vUsnFcGfi22P7BrxkrZLow7DXw6fyKcMSw=;
  b=DkYLCIZBgmNFqrTKBgpt0RbtHz8drVRZHYaJQOETRorgBjMB+eolSKMp
   hZ7KZxCuKR+UIMOslblUp8+xZoZXDsq83ogoenUBVIA/UjT4k8UpVisix
   V+he0GSP6ezYrfG8L81mZGPL/y1iVBdphZbU3473fbKTEdmMfC8CmIv/L
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uZTPLRCQA/o+O+5aULFK3NqufAa+I9YeBF+7vAn0ftWn36OoTHbizTHOlzhbESKstgP5zxGwcb
 Njq+OC4vDJxgPeDxUOSbR7/ZXAMDhcsMzcKQCSMwWKcs6/+jlvgCas7V3n3+amGfBHRGLJY7ED
 BV7WaDaWnkvkbXrZERuYNYEd6hJ091ri8jyYuD43QOAFfjc3y8sb64JEChRxeN6gnQdsg1j6Kh
 LvKBlczJpk6mS3b3mHpdtEKFxxFCQ/BeSPcS2yYk4mZBSwFT/l05aqOmYSUHR05XTEyD19RCYg
 e7s=
X-SBRS: None
X-MesageID: 31083993
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31083993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKDrMRU3QGqRyo0BurZIqKsX67wtz75p4glmdcKtCfEqQaGo8JOAQ09uB67caW9cFspcatRkgvPGugtysMi45A1IEDtk7BqWZAmQ9m9yhgJT6X5wbeB1cnJRMeWcqgo6enjsmiJGb//xD7NOMR69CDpd+L3PZ0D9zrA8zjARtuhqf87/cPzyTm1Ng7LlH9qwKKsoNDp9SV8rqk7Xmd9MOSETp8uBM4nvkgup/xOqRd4AdFZ/j8hnYfhvOQPKt0E7vUKDD7tfrQJOZnYrlrK1QMKQ23Lq/KKAA1vQ70gCelG0CcmwPmuesoc43WUsndvmRz6x2/u0/7CPf4Ql6iDrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7owhZAVtvNdWNQB+tGU55PWMNYvbI7Tg2m0AILIEfM=;
 b=OvQOA3BaVj/R6uF7QhQjEMcWp0Wq5Zmg8iPS5lCGbeNtSBW5HqJec2WIbx9VkwJsLQoSDSIy8vjrSlS6oAwumObea7mzJ0haEl923WV4h/oGlc4JFspZTK6eZibZ8vwpp63MAmhFRoii0MQxHgw8XN+65u/Eq0pjTw7suBX3HI5DK0TE/Rvn6JOvuJ4Mou/ZmK8ZkMt5TLh3xfoAfOSW0Ik2QDmcsV+1p0nbf+DS5V+zS2qbUtRHNWuc6Reu0ArI0xii1asjt0j2a6A3qePishs7bAHzILX2/i4iAZmRRB5phbhjzLRpZOrmYJP23jc+AFykfI09WgE+xCKvaEH4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7owhZAVtvNdWNQB+tGU55PWMNYvbI7Tg2m0AILIEfM=;
 b=pbZkiEJIo9foUB7Nf4g7cQ9sKmerUPEWmnwHw0RY2CF/nTeT5RzTUG1pLHFTU8goI0O7H3D3LeXIFZjm4RzUa5YvU2H4il8LcGuQgIcZDupr2l2BQE4upCUmD45BgxHvw9X6jyMfD4AhOkHFp9S0lvk57SMlLDSWhYDj1evOFIo=
Date: Tue, 10 Nov 2020 15:01:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 3/5] x86/p2m: suppress audit_p2m hook when possible
Message-ID: <20201110140103.6yalbcdgxl76ydzu@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <722cf75e-da6a-49c5-472a-898796c9030e@suse.com>
 <20201110113002.maox2v2w6om4lmik@Air-de-Roger>
 <ae87c1d8-0b4b-8a6a-156d-9f596d73a7bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae87c1d8-0b4b-8a6a-156d-9f596d73a7bf@suse.com>
X-ClientProxiedBy: LO2P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0cde2f3-df72-4e27-51b6-08d885811267
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35805FEA60D9A3811D2F94308FE90@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGaUs60mY5IjDD42J2bnTAT4N+wNwPctVWbmg1OfS/VFOE4Bfq9q0IL7rxm/r1jgotxO/85GnEs5qhUCclSZoz/XYC5uWd9ZIXSSl1I3ges6ppvy0Xr0YBOWE2tVhPgEWAlBkUV9IRFo3R6hjdJMJOBUYFTMzaPTpqJRPhW/djyYLQGf65+ErJRYLvlnV74jstsBI9hmslx1LNHDBraR3O3R7GhNm+QKBRzP3NNKKTUA76AOE2BTZeOD6QLj/bX6LCEzddoIckkZnYLN7elBk0xydN6+i1f8bfIOOs2V5KMto6ixh5/e9Br/B0FIwaC519T7VlDf5BPeMb9mZV7RwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(6666004)(107886003)(54906003)(6916009)(66476007)(4744005)(33716001)(66946007)(66556008)(956004)(8676002)(4326008)(316002)(86362001)(478600001)(85182001)(16526019)(9686003)(26005)(5660300002)(186003)(6486002)(1076003)(8936002)(2906002)(53546011)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hxhi5e8KhcqVWSqy52hBhYhSW3Kydv1aIfFtL9UJkipDa8FPaRBIN9a7r2dlxdfKCBZEiZ0TpWott7Dc0TK1gipp34Z0Ev9eYu5N8g64Y9JHQOhuFxVWRh0iMh1ldF8j7tDOYFIh58s8ddPlEhQYHe3Dan1zARd8WjG3qd8T1LHg6t6MuVorYLaO4Cw7eH5v4TtJkyKFzV87NWK8sw4R0FpwFfK2rqry4dGosbpcyuoMMrV5o7NFG3FYgLggHrLDHyQ0P5YG5gpmxQO4bpgIjDuhwI1LlS5OEITtY+moqUYEKlciNg+CbWCHNOMzL5aMHREkKk1JQHnAU+qBFFwfL+FyB7DOhyzAlxTupF21Avok9jZlhCnN1vopb+tks17rVGqH/SVhYmLdmwgR+1cgLhE3h3WkILTI7fZDr/Ssrh91Dp6R5eoLV3E6dWRhS5mU4LidN5KmrQ/22d/19CBHuiejvyCwfb7Bz3ioJBDuPFhk3ZOXhJ71UFvgGs4u9bbSKY904/u8tphZNQOROFTgNzZVyCKSmyy0W+qhJt+gGWtOtayYNuWSBUBtgGPVXcvXAgA3HugqRkAux5d74RdisxifNjf3NW3FK+3X/DCqNhbCxS6kpnyBH9FlffSBxD2JZTWi/plobALdxQJJo1iTSywJ07T32YVn30e29BV3j7gxlmqKF/5CFWTjH6US/KY3gNN4cKvyj8tdvBWViIw4ftv5ZwBC3sshlIndMJbH2VA3e4dp/n39UakimQdlWhyWHL3yd+t2WNJn9NzTeo0J7J/g49czOFQ0jS3tOQZtlh5/e1sjCl1coCll8CI7SqX9XNaTc/nb3QUnIWrb8I6QXbTQdwrNo5AEPzSg0TPBZ8/zIPxmIQ4e6sjAz7jpgMKX1Ly79jWNdZvruvmMEYyqzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cde2f3-df72-4e27-51b6-08d885811267
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 14:01:07.9688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q/NksdBIN6K0LEq1fhYEYh4kMzlmBrw6h79Z6Vx+X8HkJiQlaAXHmnwXBIiV66i8kcblswIasv/ImBkZFh7Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 02:21:43PM +0100, Jan Beulich wrote:
> On 10.11.2020 12:30, Roger Pau Monné wrote:
> > On Wed, Oct 28, 2020 at 10:23:42AM +0100, Jan Beulich wrote:
> >> When P2M_AUDIT is false, it's unused, so instead of having a dangling
> >> NULL pointer sit there, omit the field altogether.
> >>
> >> Instead of adding "#if P2M_AUDIT && defined(CONFIG_HVM)" in even more
> >> places, fold the latter part right into the definition of P2M_AUDIT.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks. Since I see you keep replying to v1, are you aware of
> there being v2? For this particular patch there actually is a
> clang related fix in v2, which may be of interest to you.

Urg, no sorry. I was just going over my mail queue and didn't realize
there was a v2. Will take a look.

Roger.

