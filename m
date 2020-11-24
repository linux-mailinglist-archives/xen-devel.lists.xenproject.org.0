Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F132C2A97
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 16:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36515.68442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZo4-0001XN-LB; Tue, 24 Nov 2020 15:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36515.68442; Tue, 24 Nov 2020 15:00:36 +0000
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
	id 1khZo4-0001Wy-I8; Tue, 24 Nov 2020 15:00:36 +0000
Received: by outflank-mailman (input) for mailman id 36515;
 Tue, 24 Nov 2020 15:00:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khZo2-0001Wt-8G
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:00:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7724c44a-f1e1-4088-9595-39b47b70d6a5;
 Tue, 24 Nov 2020 15:00:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khZo2-0001Wt-8G
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:00:34 +0000
X-Inumbo-ID: 7724c44a-f1e1-4088-9595-39b47b70d6a5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7724c44a-f1e1-4088-9595-39b47b70d6a5;
	Tue, 24 Nov 2020 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606230032;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TuE4pQ1OvIONmT9HGFqcHQcCo6RSVky9ibwexebWbiM=;
  b=GsrKlH0NwQUgr2LPpn0IdKarZkIieJfqK3zIcs5JrvnqBfoEVh8/a5EF
   5xeCYCl2J7m1AOKoeHRAqBcKtqoo/+29VdB81hugAWa06YBKj+1Gty0VJ
   h4jr7gXvjznoyMqgfly8koGxtlj8n+EJL3mm9ZsuHTLAlrUXv/ivzPaC7
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cCSMrwaLdhQoGGZGSCuk5SUIOrHfD5A+WiXsMhIsM1joKOkk9qbptKxWCIAvjLpwaY86zEVbjY
 zX9IQGi/SXmvoMki8CiZpq34F/meKvohM4EHisRyPmLuaDBSzGmm4oWIlPJucIfk0aGYAUW7TL
 AkCyktDCu3DoH85w72SZGXx9t2CnPRibrDXaZzo5i3ur7eIFU81/jOJOol1sQix9ZwJAG7nS1N
 gPkZM5BRjBwFEuEzWG2gBnBouTVKA7KwIO3HIPCTcmbrJVo3kzeXPtfGv/w3ZNtsqmNta4K5h7
 8QI=
X-SBRS: None
X-MesageID: 32069031
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,366,1599537600"; 
   d="scan'208";a="32069031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU+dhdhCXo7MN8gcLzWUU80tMq48KRvIFjqjlUl1MscdYlxE+0Uq6O84MG5lhJyiCsDpmJG939i6Ok4hM8EkFtqfqbDRQou05G/imZoydtjW+0E7UozX3fwlkFgjVfkYZzyHI/Im/QjwF2EtG2IsPaWHSxhNZViLyu5uvl09HzafJnnxe753Ka9kTY2g4h4H6EuLqFpT1NJlJ0k0DSO+7uPR65GaDJb0cwLo0EcvynaQZyJ2N89w7/OKsbSHTpDJRDHSZ79TuM0IcJIOqi0ppCd874m9NkXfdeZI5gq08qnwsD492UgmzM5cgrT3qrzTLfvqI7fTIg0IhCmGMusFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVUHjFUsZj5/PaBK5kj5vImLgcnNQcVtKsPK5FrO3QI=;
 b=AFQZCVP/QfrYu91v1TD0ypl+qLxIhqL5Zwy4n/rvvquiqPEkDigAFAq6uODIHLeNs2EhWd2j4ygvyqg7NAa6gpfNgBZa8zmobJZM7yl6uWeYCQJqH0shj9nmCWXC4Kn10a6gGqtQpdd6txu7hT+sMWMXvCOuz3xCfjzd/efMZOLmn79lU9bYrH/rMg96KcMDFreMFNNzyGdC8k/vtd8OdnscHwbJTwST8zW6Xy67+CMN9bJZ51pebe5QYNPd280ilgfAO2f8mgRkMwHFn6wwIKTkV76bb7tj52NZ9Ru8Je0vNWTXuqwGZtMy1Gdmc0mlzFi4XKp7grOh28m5ntlGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVUHjFUsZj5/PaBK5kj5vImLgcnNQcVtKsPK5FrO3QI=;
 b=Gs0eSf10aTjvJdyBHSIEN6PbTgsn4IR2c6YWGE6UFxybGcOLW5RHH1kYBtX3Fcmf80z6v0HWvRauRVmdBBhYKV4tLCBlLNkpE3liU3KQzCRlc3G9cVkqIZM1heQ5sxYe8SJTVocXnRdxGH10SOUiXVmAFQKwu3jSs46+67gTj6s=
Date: Tue, 24 Nov 2020 15:59:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
References: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
X-ClientProxiedBy: LO2P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec089594-6088-448b-48fe-08d890898d65
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2972DEA40A8771419C1725728FFB0@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tbN22/MrkODmumb51tJzQ1dQjPXnNAq7ETsFihtwd+MQ5+Bl2jhyyunr7dF+5yeuA8rgrtEoAy/grlkJPGSzCMsNHcXIDQQBH039aBGg4cSNON6oBRFS8cZhbetAaismECVBXO3AoXVmSQuTosNeFS9TuQ+8bSD6y66VoKw0Ao8OPacuPknLs4IiBIRp9NfGAg/3pQ8Qd+lrk/SAU6hKILMTTeQJF3MSJeNwTHsNly2gbnP7Xt4uZMzY2NNgKXA+UJSZ+q68Nq08YoJq3k/+W9ZwBtlLkZonJVKdED8moIasepM4kFKN+AWvasGK+W0wn8ksoGu+oRYn8EzWb6vC00O99S1klhQ9wooNn5txwkLpnfLl1Cm789V52UhPbfbqr6AuURQ0IbjKiiLXVCHrkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(66476007)(66946007)(4326008)(83380400001)(8676002)(33716001)(9686003)(8936002)(2906002)(85182001)(186003)(110136005)(966005)(5660300002)(1076003)(6496006)(66556008)(16526019)(316002)(26005)(956004)(478600001)(6666004)(53546011)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: E2xkfhTzVpDLNwMtWajg+NGWHdSaF4ol4YBWXDO3Sw+3IMmdWvCHi9PjPrymi7rdhObd2M0YXbbH111b4tPKi424TigxEPt6pYGzBdu9nDiiQ+f8ospEJFYpPMknnIS77/D3HR/UbqF1NanK38MNB2zRO2WP2PeNbCvDUBnYkeDwj/c75gSkg+oHI0XBUPs+mV+XbGHP/ZYOTTdyCvDIpyqhs3Dn+3w0PNyi8r2HnfTkwO1cq/f3RDthWijBEBpJ08bwh8tahDobDAH9lAofOd7APJG9a3K8I+vwNKYlJNhqZaBTo9oK4mHdDUJlAKQcZucPu2LuiYvqHGLgYddvmLqGH21dhRAAqxYR34QeRJc8Afbh5YxT8bH9Hpezx4+lwuct24njRriIdAzdgI9GEH98M6b1O7np03netnNZA1vDU0WpCF/zVcyqjX/xf2K5qKh+ZXMsdcjHTdipkqVIm6Xf3TH3olBSn4An5cYbfJqMs3z3inCZKmQlhpr5UdH4FcbdmAbjGeptfH+aWmA5KL1lEFo/uoI0gQlpmRXp3NqOcQp7bXLH3s8SI7c3d2N6QiEd3IkxrC5Xc7cKnrC8LdLw2u9PDXNyPJk4AxYaUe3qrUI0Qtmz6jDthCTg3IFjwh+BMFwn7LirTh/CZNOHUDOHkt6jOHr+i4Gbley8qoS+IDsx6WbSookljW+Yx2P0me4HGHPYPsGrTkXAp3EcRH7Hz1dpeDMMdAK4/uCAfNmM8QKkORHHN8aNTSIoRTRdiD08TOCfMECJIig4hM5Mpl/zOK96eAVq380DhhlM+5fH3H1B/G13XkTgGLdW8HJ3sIWkd6bA7+/A8Ws7ts/K6iT8w27qHJGom3AJeAiztLjeMKra+D0OwBYy5JPO+NYUwnVQN4fH7Fqia/Tro8HziQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec089594-6088-448b-48fe-08d890898d65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 14:59:33.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3dSRFBbFhgiVgtZW0zdIiKkTZM9iYuliIe2QgiZBmJD1PNrUbGts3hRtzbP6jXiqlBrJFLse1ArpaQSo46uQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 03:42:28PM +0100, Jan Beulich wrote:
> On 24.11.2020 11:05, Jan Beulich wrote:
> > On 23.11.2020 18:39, Manuel Bouyer wrote:
> >> On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monné wrote:
> >>> OK, I'm afraid this is likely too verbose and messes with the timings.
> >>>
> >>> I've been looking (again) into the code, and I found something weird
> >>> that I think could be related to the issue you are seeing, but haven't
> >>> managed to try to boot the NetBSD kernel provided in order to assert
> >>> whether it solves the issue or not (or even whether I'm able to
> >>> repro it). Would you mind giving the patch below a try?
> >>
> >> With this, I get the same hang but XEN outputs don't wake up the interrupt
> >> any more. The NetBSD counter shows only one interrupt for ioapic2 pin 2,
> >> while I would have about 8 at the time of the hang.
> >>
> >> So, now it looks like interrupts are blocked forever.
> > 
> > Which may be a good thing for debugging purposes, because now we have
> > a way to investigate what is actually blocking the interrupt's
> > delivery without having to worry about more output screwing the
> > overall picture.
> > 
> >> At
> >> http://www-soc.lip6.fr/~bouyer/xen-log5.txt
> >> you'll find the output of the 'i' key.
> > 
> > (XEN)    IRQ:  34 vec:59 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
> > 
> > (XEN)     IRQ 34 Vec 89:
> > (XEN)       Apic 0x02, Pin  2: vec=59 delivery=LoPri dest=L status=1 polarity=1 irr=1 trig=L mask=0 dest_id:00000001
> 
> Since it repeats in Manuel's latest dump, perhaps the odd combination
> of status=1 and irr=1 is to tell us something? It is my understanding
> that irr ought to become set only when delivery-status clears. Yet I
> don't know what to take from this...

My reading of this is that one interrupt was accepted by the lapic
(irr=1) and that there's a further interrupt pending that hasn't yet
been accepted by the lapic (status=1) because it's still serving the
previous one. But that's all weird because there's no matching
vector in ISR, and hence the IRR bit on the IO-APIC has somehow become
stale or out of sync with the lapic state?

I'm also unsure about how Xen has managed to reach this state, it
shouldn't be possible in the first place.

I don't think I can instrument the paths further with printfs because
it's likely to result in the behavior itself changing and console
spamming. I could however create a static buffer to trace relevant
actions and then dump all them together with the 'i' debug key output.

Sorry Manuel, you seem to have hit some kind of weird bug regarding
interrupt management. If you want to progress further with NetBSD PVH
dom0 it's likely to work on a different box, but I would ask if you
can keep the current box in order for us to continue debugging.

Roger.

