Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6732B1D8F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26564.55025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaAk-0002Nz-5X; Fri, 13 Nov 2020 14:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26564.55025; Fri, 13 Nov 2020 14:35:30 +0000
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
	id 1kdaAk-0002Na-27; Fri, 13 Nov 2020 14:35:30 +0000
Received: by outflank-mailman (input) for mailman id 26564;
 Fri, 13 Nov 2020 14:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQoD=ET=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kdaAi-0002NV-Jn
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:35:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52791a99-6ab6-44f3-afff-6377aa920c0f;
 Fri, 13 Nov 2020 14:35:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yQoD=ET=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kdaAi-0002NV-Jn
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:35:28 +0000
X-Inumbo-ID: 52791a99-6ab6-44f3-afff-6377aa920c0f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 52791a99-6ab6-44f3-afff-6377aa920c0f;
	Fri, 13 Nov 2020 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605278127;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ujoTVnN+YBqbDTcmMTB76apyyrOARJ7+33aJqyy73Zk=;
  b=GNeZUv4gLkfCcJd6+YSoWhlrVJ/Jb0KPMvYy1f4bfHnXxSh68COuwi3m
   3zWEHqGlO91ciBVTCW3HnapG+g1cy9zsqnylVvGfjEm1naNS5mZ0tElvC
   Gi21eO/+UitQdtmQU3e0GVlnZ1A6zpUeb0nxVPyVqyJRkDATQG/jIn/qe
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lsaPtCFS+Q92a+ExlNbV+rxlTIvh+JAF6scq6CbbBWl9KycSZBx6MNW/wvr07emWq1C9OlbpBp
 Km5oe8UoR4VBJ9i6t8MykxLreiqqWYweQUYTmeDRXZiVIZQ44m/4NlzdoyDWrRT93bkpzdlXN+
 MHuqtMLK2wE0yTl95ZdU9T3ogfUHZugDldOoNunhSegHiX2lI/jJXjdw5dugvpTKYOyNIkXR1m
 i+IwaxaLjOj4ICip1MzE6NNJPJjgmt1qU8FGc6Pb7y6S02wuUpvKU46oT8DcQV1vFlnDSUhSfM
 CW4=
X-SBRS: None
X-MesageID: 31362517
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,475,1596513600"; 
   d="scan'208";a="31362517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdouVGLZkL6MD5JlXNcvayTR4Z9wdxkax+ZfnhcYnurGEqDMm8Hc+23sCJ7QGwTKTmyE+Udp+IluXxas8WQTYCzWNiFTM1wGaElgH/W026aGn7MFgkGiBjdns1EGiK5J2k5RXYoyzALSpmYCU7xHQXZT2V2E1JoyOnqdwcNbkcmPT47oU8PlcL+hKknptW/t3Tz6IynIgOxG40hVbQtY890F2MGBivpiCloHL0cpYrCjq9snrG/rP4li5Y/Feq0tQXEY13wkM4GLR2OWKqjWI8PYI54pITs0VJMo2KU7Bw9o7N5OwUSymD9JcPHqSRb+lCr1T6cYApsuzOJ9lXsyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhCsZoroeC45ZJavgpDQsb7UfSKy7Lpd+WQMFvqQ2K4=;
 b=BuuvRjz3FMHKsdy/eKqMWUsBH/HjNww/ZuORPL2vKUC2RmyUJ5wrS0Zyk21IW25dDgJ/Dx1BXL/hRgnYsMeVKXYNrvrnT4KDizATHyKqG0moh9bPdn/Lx90Xuet8GwrEwX3Iri23hNLf9a8cgjEHcLiSYKQBT5w8peiYV0n7kA3wdiUlj89ZDhwD34dKVfe0YqQHIty7CO6EQIi4ugG0bKWd+H0HWcXBy5B7sDf7ygBKSwz1/LyjC7NkILRTkWb6cjiDPery5LDuoUni45Fp0VPZ79w/naCs/noRkiFiTth4bei4k6vh/yY9OBJ34vyYoJQ2I+2yM9603qSdlSNBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhCsZoroeC45ZJavgpDQsb7UfSKy7Lpd+WQMFvqQ2K4=;
 b=BzuZBEFlaS+iPOMZvEh/c8IzewN3fGSa+dZIraqOLqj11+lnvSSrroOv8XT2XjXCPQJVawxD8tTospZ/n3K7CP5lPkuJ9V+ZXbWnJa/bnXKWZ+baLf49c5BnzRssuWDdMe5WfVmFlCF8joztLptB0dyu06PFX+Fh2NTM++heqVE=
Date: Fri, 13 Nov 2020 15:35:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201113143513.5mvfb4tyczyo2rwx@Air-de-Roger>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
 <20201112201939.be6ztg2iipwa6hkb@Air-de-Roger>
 <20201113115457.GD1512@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113115457.GD1512@antioche.eu.org>
X-ClientProxiedBy: LO4P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0265994c-152d-431a-3dbc-08d887e15b99
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-Microsoft-Antispam-PRVS: <DM5PR03MB321091DD9709F0D19B6DA5F88FE60@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pj0LqPggeerDpPBVWYqbGIF5BIjvogPx4QRAcNWrRzwzBr46wYvEkiyXJo2vPB+uxRNBqjM7/aR1oQHnvmowPh6p3fp5ujV/8hVAi3/u16b1ovrhLDTkzl2ifZQKpjfnaDDYFfhYamYrwEzcGvMxUy3lfLML+SOHpr8UOd1V0BXQcdCgw6h7rn99i1sq47Q9yLc+PZUA3PO2LQ0SkldUmOUeG8zy4TX3zx8aKIJjyWqIOvCs+BxvHo0x9RU19JBpCYu7t0SDxeJIQxMQCW7wvu3N262l2epg2sThXTpFDFT6AY1HZratWOKvAFM8eD6J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(346002)(376002)(396003)(39860400002)(9686003)(6486002)(478600001)(316002)(4326008)(6666004)(86362001)(5660300002)(26005)(2906002)(186003)(6916009)(66476007)(85182001)(33716001)(956004)(6496006)(8676002)(8936002)(66946007)(1076003)(16526019)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zPd3VvF8fzR2fn4nScpa9UdLXH5FJkJxJ1nvq3iyKAj59FZTHfoP+madQhZ9ZfqFRJgFZlo4pabzeXxFY1YWSypGLN4QWVBoF6uw2vi3Hwro9hMl5o269gy/p/hkw5mQ9k29EnbssuVhDgTUW6yRYyzm7TPBINvJJmLKHd4cd8E48Vh6fuOPxO01eEXmFjUWXWajzqRoiusi4UbR1D9kQmAzKq6bWE/P1Ux0K73EpQ8X+UiEIWySQkPXCxa6kfywuQ3yi3hCqtaC95zmaZRkV0Pf82SFW7izHk8nTU6MgWcpzt21eHnOEMFv4XPctWmqfyf8oMUx9uuvQnfFY1/Elgh1bKg4Uv3vFEOZ7KRYiqpN1wR+YDL4JjC3JUU4Fniol2SZDC0gnveDTv2/v4Mc6M2WmdsVeLxnrAGRh0F5AEnyZUWoXoMWtyyOT4zZKYx4Dn2/KEsURfX7dqqTxLqd8LmbK0AT5BCCDfN5aM9o3S1+OsefohTKV2A0XM9lRhnE0SO5qhqAxUfauGFbY1dmI4ERMZGDePwQ+2pQXaUrQdufHvzRm11UBBBRVdwNiOJuAQQS33y6yD6NdCen/ICCyy//erZMk6eqsxDWH6zDht34UY4EK3mRc3GUSpqBHJBzZq1nIwPhtm0/s4t+UDWwSP2c5BEx5ziL2L1FIuTwOX8COoGrS8pswKaVM9jl80QqN6utXoTQFi86KBBjbO/2p7nGoSX0+c4riK9qR0+LcHF4Ul6vwKseMcPefKLzl4Q4TVjADlvWOo3hsRCGTPi5VodZOHxw+n4aQ3JjMoQvxvRRX9TpoPSxWPIPLvhPaLSVrI1hQvLdsJGAbbXjiHi+81bKsHPHn9BwZImEpEEmJjZVKU/cQt1f1DcLxyhsgDQmHV9BkBYFZnJ8EhLabjaj5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0265994c-152d-431a-3dbc-08d887e15b99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 14:35:24.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIcNZaJ/iGshu5QbsqWQnzfmOaq+uFfw53CyDYeoMUXBJyNS4rzpgcGzouqaO2DXbh26ZtiO+Rtc44qbqlM21Q==
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

Forgot to mention, it might also be helpful to boot Xen with
iommu=debug, just in case.

Roger.

