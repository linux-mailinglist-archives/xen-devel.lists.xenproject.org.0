Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0DB2B1D89
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26557.55013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda9I-0002EJ-Lr; Fri, 13 Nov 2020 14:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26557.55013; Fri, 13 Nov 2020 14:34:00 +0000
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
	id 1kda9I-0002Du-IU; Fri, 13 Nov 2020 14:34:00 +0000
Received: by outflank-mailman (input) for mailman id 26557;
 Fri, 13 Nov 2020 14:34:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQoD=ET=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kda9H-0002Dn-So
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:34:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 725bee47-33ae-4ea6-b2c9-893f1d599ed0;
 Fri, 13 Nov 2020 14:33:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yQoD=ET=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kda9H-0002Dn-So
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:34:00 +0000
X-Inumbo-ID: 725bee47-33ae-4ea6-b2c9-893f1d599ed0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 725bee47-33ae-4ea6-b2c9-893f1d599ed0;
	Fri, 13 Nov 2020 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605278038;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EW90h6ugA8EtrqEuUkRKAsenjbZRdKzDX2xG8itrsPM=;
  b=Ek+jpY104Wpk/6ES0Dk6oV0iWGNZY5UC1utECi+EK809k1GFAJMVXIzb
   v04VILaKOL8XwQqo8eArMQlFifw3N8BkAOllbvg1LjIdL5j/7K8H22B3c
   tC6gYkL+EeNdLBSJ3vnaLWIAV/+bbkBevaA0jsjJKR1ML1pUdjRuqL7RE
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZIY0CKa3u8ZjiYJGc0ULjm1jpXzEhu6hY3Gh1CKp1U48RhVYyZW9Ucn6QwUilE8mxqAP5+Dgpx
 2l890b6FsbhzQBJNTicR1v3FxAqQFcpZIkgxtPuQMr/KYTZU993/ChutM5EWpn5eefAQkVDl4d
 8CQS4sD0mrm8EI1s09ipjzvC1n9rYbGo5UZY6bgqEnxAiUxBwo98at7LnMCx9YRiI6eoRK5Hf2
 kfDFitvFBm2SJHosR+/VWCOzVYGQwWzuO6TeRCcFsA4KWZH6ufYtx9l3NGre4PnuyNF4MhCx8H
 1Rk=
X-SBRS: None
X-MesageID: 31098696
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,475,1596513600"; 
   d="scan'208";a="31098696"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li5mPgVaqF605/jO8xXQKTtM0Q8Dbed2UlIWd+Z7uK/bPCEam5wuf9zjZrIRmBog+vDE36fyw2E3JloSGvwc7qA/BhmoLlkNl1z24ncZulnhl36vsUxALfTfV3hQ38EWyMws42MAQb5e1TO60n08m06rAu/fYbrSeCy1AL3gCiMopMm2GwnvbqVwOzsk7yi/6P2/vekHJw/3JWwLXVt7P+MBnSGayVKadWBtsqnQKYGFTDE8t59eQ7chqa7BHRG50yKKCXABI0T4wzk38fFW2rqKSB0caHE82UD1Yz11ZCByP6pRqTBjZY2qCRZCPOTNJ9BG8MSLA/+tC0tCiifK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGV9NRyzsEmWXkCi3srNVusz2oW8ftZAG1ZNGc/EWHc=;
 b=oEqs9M0Rm9k+v07acQ2B0wfmb0YadkgSqWvgDmCPbcUQ/p/IgZNsWaog/5MmwXIvboCtlg3vCgr7qYe2QOTKk1O1fQs8CeXivCPM+v1laSbrs156E0vByGNjwdMdtUu391z22Wk4KWT8wnCvD4Ff4FhQe7ZggQCKvyXVttD1Yd0T0qPqPPMJ0vK0zVza7Ac/6mi423HKjaybvkfAWNuz4XYZ8Gg4rXTNPgKQR1KJfhOAmXn2MVuqO0E5Zhd5D9x2G6gKMOniPIbqqhwlYJObEbERp7S2BKI9lBZ75PzGWta83404ANUVRsR0QqjYf59AXaKPzFqkGRIYtJjfF0pC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGV9NRyzsEmWXkCi3srNVusz2oW8ftZAG1ZNGc/EWHc=;
 b=e4OfK+HA1fUTJngREM2blSnaIA17q5/85Ync0UN0/ADQ4MuUWIj2zvGUl+XRof6WQwKjwm8+Q3U0TIIUSkMM16/Aa4BvIpnpd3dbVYPPh7+z0DOb5RbVTeBLeEcI/Dx0EUw+2mcHcCjOUzHYfOQ1Ok4VdyS1OHvYYcHFEyJ442o=
Date: Fri, 13 Nov 2020 15:33:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201113143349.gehu36wsipvpkrt7@Air-de-Roger>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
 <20201112201939.be6ztg2iipwa6hkb@Air-de-Roger>
 <20201113115457.GD1512@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113115457.GD1512@antioche.eu.org>
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc231c89-76f3-46a5-e393-08d887e125b9
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-Microsoft-Antispam-PRVS: <DM5PR03MB32103C0570886287F30BAEB18FE60@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sN2mWhp7jkkIoI0GlggVQflcbklaeLc7RThkDjFZOwDtVswhv/o0uWa3Ec3/Y/ydNsDpNi101xVU6sKMuV38xwgfEc9c5mYokyZd4C2jCETyv2tUWLxCSOnAgwLZ0L068uQVHUvcyr+jLsKWhgJ6oFO2a6/OgMmr3bAqV6Jg6ZfCEgzJ1PL5gACWlBh2qc5iPhsmOjqv7JcA/invOkp8aW6T+K2bzLPzDoKQJQnzFOyRD7BQdIforxQhLVRxu7WzentKXhw1Pc3kS+lTGNNRw+u2LUDqAmZbVt17cQvJGLixO7/Q244BKQ/2aecyRqiaA5TUoqaEkMvMp1Zg1g1lRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(346002)(376002)(396003)(39860400002)(9686003)(6486002)(478600001)(316002)(4326008)(6666004)(86362001)(5660300002)(26005)(2906002)(186003)(6916009)(66476007)(85182001)(33716001)(956004)(6496006)(8676002)(8936002)(66946007)(1076003)(16526019)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ft3GkVOITn81znt/yIagKk2q1k+zgdPy3xIKEsaO/rRK4VwRr+bHqeHUwyYKixO6+EnDWvl6yx42vh9sxkp2BrBkwMhG+mlxYDv+W4XTHBNCRjnKCTKKMb44iuXBcGHQPOl1U1W45qHS8T7VsVQGZBzfHfQeu6wi3ZDYVqsibP4/Q6F6yKDJIZWpssUxB9TkRn8xVwD59/OB+llmPvlq8NvT5Hp37wDhp55TA3t1vG0f0boKVXIuC4OsOX52q3QhaeIdaAJnwTfHEiDMZ5EX7c8oCcFx/Tvr3ipdac8n1m326UWq3igsmo08RwjGgFcI/Swq2UtnSfbYBf85O+KDhArvDUHwe6rxPFVFqm3XP297WXV2d+HMbxPUbdpfH0gwE5cJr1BO+t/JMyN7+RW13M5FBWAigpHlc33B0jROzhzS34hLsFKwnHWOP1ys/Cn8GL5lFCYe0L8s5ZO+MibrHxw5wXEXUKky0Bq6MzaCtc+WTgnZKMUzAXgcxmx0j11rnsroE++IPeG4aCGdidq0Dit1riXQQLA24PRSdZlBrg1aT8Bd+nXV7rO4807O4QMbCH0rog3G/ABgmqp7P5B/iwqO5rD9fLYz62tlbJbHP1y9BgAEEQ2DavJOk2a5OtE2hnlb79RTybxraE08MUJhgyQHS/OTizpUaueMTCpGOpvBoZbKe0sY/cYQP1pKCsteF3vB6XoIQG08/xCvnZaEewGpoT5gqjB21cSa+TuZW7xtqy/tmtL5LWhIfH21UYxpAGNlUz81cfbeZbzDoUv/mJM+o759mgVJ8QGmx2KlnxmbSJxjpVtOLYQc59ceOtaxpXBCZ5HKPG5f1pIEan5hKIFvLzFtQnRBW6OX0bmemynkEVgepTRmBqOL7lPjt5EVnRqdgbZnuKKLqtDHsW0gDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc231c89-76f3-46a5-e393-08d887e125b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 14:33:54.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93QsUjMR5Rj4d1O0Qy9ma5++PUfKwI2FVBe0S4H+U2oluahFFw23qaXzVNxI6/kSbGdkzUa2W1Ufds2XeACsnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3210
X-OriginatorOrg: citrix.com

On Fri, Nov 13, 2020 at 12:54:57PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 12, 2020 at 09:19:39PM +0100, Roger Pau Monné wrote:
> > The following might be able to get you going, but I think I need to
> > refine the logic a bit there, will have to give it some thought.
> 
> I also tested with xen devel (Xen version 4.15-unstable, Latest ChangeSet: Wed Nov 4 09:27:22 2020 +0100 git:9ff9705647-dirty).
> Your patch is needed there too to avoid the panic.
> 
> As with 4.13, I have problems with interrupts not being properly
> delivered. The strange thing is that the counter is not 0, but 3 (wuth 4.13)
> or 2 (with 4.15) which would mean that interrupts stop being delivered
> at some point in the setup process. Maybe something to do with mask/unmask ?
> 
> The problematc interrupt in identifed as "ioapic2 pin 2" by the NetBSD kernel,
> so it's not MSI/MSI-X (not sure it matters though).
> Maybe something related to mask/unmask ?

What device do you have on that pin? Is it the only device not working
properly? I get from that that MSI/MSI-X is now working fine.

You can get some interrupt info from the 'i' and the 'z' debug keys,
albeit that won't reflect the state of the emulated IO-APIC used by
dom0, which is likely what we care about. There's also the 'M' debug
key, but that's only useful for MSI/MSI-X.

I can try to prepare a patch to dump some info from the emulated
IO-APIC, but I'm afraid I won't get to it until Monday.

Roger.

