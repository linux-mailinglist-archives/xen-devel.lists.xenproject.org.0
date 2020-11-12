Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B42B0EF5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 21:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26033.54153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdJ4U-00081w-46; Thu, 12 Nov 2020 20:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26033.54153; Thu, 12 Nov 2020 20:19:54 +0000
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
	id 1kdJ4U-00081X-0d; Thu, 12 Nov 2020 20:19:54 +0000
Received: by outflank-mailman (input) for mailman id 26033;
 Thu, 12 Nov 2020 20:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kdJ4S-00081S-4f
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 20:19:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2ee61e5-47b6-4a29-abb4-9a58f613d491;
 Thu, 12 Nov 2020 20:19:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kdJ4S-00081S-4f
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 20:19:52 +0000
X-Inumbo-ID: f2ee61e5-47b6-4a29-abb4-9a58f613d491
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f2ee61e5-47b6-4a29-abb4-9a58f613d491;
	Thu, 12 Nov 2020 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605212390;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ml64WgrDyUNCCt0Zwhrj3BKfHRHSJoK3a6HPlUeDMf4=;
  b=TDhLEHQ7aNbUT9XaeQoJt3wsgAVk1/2bV0byLa3LmIttwkEukG5B+BJz
   EKkDw0fNvNZh0OI8Y4LEKspGRv4Wi82NDgDbw+tO4hhPrqpSWSJeoIqsO
   8cg5IbEMgCuwJhjiUK498G7M7fWtGdoIH3WBlz04sVg0Ea2s440EDv9eq
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tsC6RdhXYn06IOnYM5+hIhW+b0jV8miSKM9b3seQEIJw+MbroFyrL5VRUBjHMUbnPN+laR2DWr
 67SyvOiJGfn1Xtf1NV7RX7q1Doc8F2eICOqXuEHfQOllt+3hgr51Co4cFyTd2+qGn/7paGd58w
 0HueKMafrLK2PNiFpYevPJg/hl3Al1chtqlP98quBu/1Unlild3IRlHySuM06MQWwyJwOTnpzi
 6rHvFJOxRqWs3eCffnJmp6QDrTL+vqsSpuC0+Lr0ey850eJ4Y7du4aMK/4KTSGXqpb6WYnK2lk
 ZRE=
X-SBRS: None
X-MesageID: 32199207
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,472,1596513600"; 
   d="scan'208";a="32199207"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5KIwYUnmMWohFckzTrxbB3Q/05ghEVdpe5e8ZckrEEImKQczTJK6pHLIDNUfFkedusQN7w0/4AJnJlqXKMPnYmIJ3fEJ7C0bTlcL+eh+KlK/eSdNgoQWsFx5rl9006PETvcEe7FKk7D5TQvvvTPkMb6wb08oAev1GWS0a/M/MiZS7IctLfTbPBNfDn31qI03l4UlvMCugZQ/eKSn1u2uzA6KoVAnJmzD5p8+894y/IwwZynJgbiT43/z97t4zqRdzEiOZHYZCUYaG33Yaup55KILEgAMLcZt5+GewaMVWUp3OD1wUfGx3Yb4/EymIZKKdZcyHGdS+YheiC7WxFZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEk3MTH4ClpZVHTXC3mpKek7Qm2H6NwtVf7MUraNuuw=;
 b=jEdH/O0GHR3zq/PsEj35PZLKdfv2fL0ReuOPMiv1iOGrnxX/HmYycoYOEoh1zjz+0hcQb2G16iov5o3LYqNkg6fJlBD2Q9NLgqVK0aQNGnhAY9RQ7ERl9Ch8DLkRvN5j8oiF/mfegpvhiSwT05P+uqRqhSi4kMku8CRIBcq140T1v/LkWjlhI6CXCzYpaAXtbFkKpevgoXw5L1X+P7njrvEMw5poe8s6a3s3KiJlieHfBAafu4akJ0it5mspK7c4u7LgrBC5cCC16Jbf7QcavX8YCzBsUE8h35as5v5bti3g8rL9HwDGMHWUHpixUOUNqDzzdGDfFZd6uehACNxevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEk3MTH4ClpZVHTXC3mpKek7Qm2H6NwtVf7MUraNuuw=;
 b=o7Tvwu2aQJ4rgV1mZTh5mVTVZA7h/i7/EgtS6z4p1K5U3w6+nH/gNpdb6SCHfbcuDwvHVxwdwPGfxnm9FkQ01FJ6E2nRD6QxBm7iN7WroO2jBeYWt/ZuZ7P0gAAK6ZE2ynv9/d1caH0sQFmN5ue3JPltLbMR6zmb/5gQ6sV0NNU=
Date: Thu, 12 Nov 2020 21:19:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201112201939.be6ztg2iipwa6hkb@Air-de-Roger>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112172704.GA5899@antioche.eu.org>
X-ClientProxiedBy: LO2P265CA0257.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::29) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c4e40e8-8b74-4663-fd06-08d887484c0f
X-MS-TrafficTypeDiagnostic: SN6PR03MB3694:
X-Microsoft-Antispam-PRVS: <SN6PR03MB36948F6465E21EBE3EB0F25F8FE70@SN6PR03MB3694.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ue7IwmRSvowq0bZeGXzWCAhLYkIVV8bRJ504ko99fwzcsqOpZhTiRuPlgWnqvSNaz6VEesZHhPRMZWVydRTeVR6oqjmCrI6iQKCfdgn1GfcGjQcBHYG1sH78zkUQJyjL0aJ18ZQ0wPFFFalcs/3yHTfR5ju64JJ2o1FHN7Fs8AfdMwIBtzARRY+Unwbjb0N7ECo6dtO22x43I+5MdebuLJTeaPxAkD81Hx/3fPU2KtxUt6wSiIQu5Xk4nT9+hgbO9/VjDhOQTd8UMPNNSOFzQW9sIjDUTQqgMi14U3zdR0sRKRr3011J1rreV5zIePw/16cp8Tzu3lbglYpILUZ/XvuFLMnK/UsAcYdHfgObx2Fk+XrK00M3Z2Z66IUkfUdwWjIEejPW/souZRXtU+LgpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(478600001)(16526019)(66476007)(6486002)(26005)(85182001)(4326008)(8676002)(83380400001)(33716001)(1076003)(186003)(6916009)(9686003)(966005)(66946007)(86362001)(6496006)(316002)(6666004)(2906002)(8936002)(956004)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Uw/T6Ju/T+3+7v31XCDV+VyiC7qVK7jYi9qfniZEQ6GTobPSM0bdkj8Hi7dgwH9/Rwn1ykadW5RvFzRHtrA4y7k0hV3P30sifjV6xZm/yEPwOMSLGbVujWe98mmNkwSoVl7dSnM3cPcrr9lYaiMMrC9IKK9XPfKMp6ufDY/wOs//gYsaOjvJWBvL8cBLUDhWTPn9E77dD1uPJ9FgnXACgXQeExk8e3FaUYK+cqsaBDdPGOXbWFhZApGfGhEc8Ypejb34i5PMCPFiDqH5SLWQuZL1aaUtnZqjb3Z84AVprg/Z5PlNkX1SH3mGZ1kqcrYSB4Usykma5COzygvFacaOdt3OueKLXYvTSiM2eocpEsgzHw++OZSStuY2zD2HvnZzU42KyylKEwl16n6FgewLxs89OVQMtn2wOcjHCcLf06BgwGdy8a4diHv/ehEomV//BTJHPzBQBxC35oqSTFHiDBBLhrjVRpPi9C4NlIVpSEkFuXpxnJUcy1QKkwG47AuptL5N0mZTT0B8J6tK3bLCkO6WdorZp3LcmRQxth/4CZkTJP285K/FwtGPCbYBTBozWSan+2LWqapD9JmTsTo82PEuv1ssXDnSR02iEOPjVCwJmDV58y7ljPI6csjiEih8uQY37MXWv9lPcnfcmq1j5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4e40e8-8b74-4663-fd06-08d887484c0f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:19:45.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ij/qboOEWSv0Yq6PtzUl67k+UGb0KtUcebX/ezwfPuGVmbWAoP85oj4XMR+FcaZrZRccBXoVM+NzMvjVr9FMdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3694
X-OriginatorOrg: citrix.com

On Thu, Nov 12, 2020 at 06:27:04PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 12, 2020 at 05:32:40PM +0100, Roger Pau Monné wrote:
> > On Thu, Nov 12, 2020 at 04:57:15PM +0100, Manuel Bouyer wrote:
> > Can you give a try to the following debug patch and paste what you
> > get?
> > 
> > Thanks, Roger.
> > ---8<---
> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> > index 64dd0a929c..7ff76b7f59 100644
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -371,7 +371,12 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
> >              entry->updated = false;
> >          }
> >          else
> > +        {
> > +            printk("%pp offset %u len %u new_masked %d enabled %d masked %d updated %d\n",
> > +                   &pdev->sbdf, offset, len, new_masked, msix->enabled, msix->masked,
> > +                   entry->updated);
> >              vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
> > +        }
> >  
> >          break;
> >      }
> 
> I get
> (XEN) ffff83083feaf500p offset 12 len 4 new_masked 0 enabled 0 masked 0 updated 1
> (XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
> 
> You can find the full serial console log at
> http://www-soc.lip6.fr/~bouyer/xen-log.txt

The following might be able to get you going, but I think I need to
refine the logic a bit there, will have to give it some thought.

Thanks, Roger.
---8<---
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..3eb6102a61 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -370,7 +370,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
 
             entry->updated = false;
         }
-        else
+        else if ( msix->enabled )
             vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
 
         break;

