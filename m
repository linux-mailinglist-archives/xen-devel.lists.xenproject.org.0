Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FEA64E1BD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463739.721993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tt4-0004rQ-4r; Thu, 15 Dec 2022 19:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463739.721993; Thu, 15 Dec 2022 19:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tt4-0004ny-0v; Thu, 15 Dec 2022 19:27:22 +0000
Received: by outflank-mailman (input) for mailman id 463739;
 Thu, 15 Dec 2022 19:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lr10=4N=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5tt1-0004nq-Kj
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:27:19 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0121.outbound.protection.office365.us [23.103.208.121])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b0b283a-7cae-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:27:16 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1580.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 19:27:13 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 19:27:13 +0000
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
X-Inumbo-ID: 7b0b283a-7cae-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Bj+rtbzxDkw1XE/n2AG/Z2Prxa7BSs3CMlsdtspF6BIh7egzSZOu3g5K1nHDHWPloLaj43IwXwtAGicWH55dw6/n5CB8XeZNQboiBuwWVT7EXlJPMsnQdbCwYpDwhejnOyEfJuWwG1+u8qNwCChN4EBPSCd/RYkqZYN6xmywtyhPjiOytlBTgmoAxdh2a9h6AGbt7h0XCseksZyP7o6mCpJJ4A6g00EYr9UAFl65G8rfMjsnE+9+pbBFoR2KEwdnhgiWvuCNfcmWX0A2ntGfGct5Oour/ye/uCnvoHY5odg4OvAmadcBdT8h/9Pq8yygmLn9jaMA5pNcCeP7oxeMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=co9OdFQ9D+Hb9d/P88ZEqSmfYeaoJcAOfctM2vbc11U=;
 b=NNIzyVSrW4h4a6icKB1Fezam0ttQC3VSB/1MFw/Ipuin1QeQBLwpgPpdneVniLYJJ+psOZ+lmh0kM4eQsXmNgI85acxA71M7Io3r45xOcz63RtBSLNExHay7oYLC3Im7CSn79Tak+V0kBvgJX3agZg9RDkP5O+Mxt2GuWbGYEg9x5TnHz4FPn2MWAUFyVbK63OAVWsp1INWZRU7H+kSGZFl+SN7O/vrJWEGgSFUWjprvZxyvdW61w8/NEsvWBhylLQqt5U46PsPpTycSHVApbUEo03UAqx0kXkCF3o4Ib1GPBBCv26154aldYPgYXcnvlJ9BH4dsuDFY3IG2Yh71/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=co9OdFQ9D+Hb9d/P88ZEqSmfYeaoJcAOfctM2vbc11U=;
 b=mdokQVRnEghH3X7k8sgQtFA6QZjroc7E56asPRo+jZCD8ZEZPwmeV3HaCppH9b6L2iPgLu2AtNJ08nhN0QXwysKXFsaOys5tNN1Rmh/c0LemV/HDdOpwx908bH8ZjPDbhekwNOM9aiAxJ+Yf4bwu3nW9EKgZkT7trY7k0vTztA8TdUIjoWLb+4BOrdZSj35QOlR+3A1YZDDI92FHqeAMb9A9rUkogQYaRMW5k5/bVxSfFiEAt1dst65rngSmp/44JuzKlX8gndLp56ucXX8GnuXpVHxlXj37N0Oe73su4mbnE1MTHUXez3OkMkgzfE8VW7WG11eNbkaK1WLlry1C6g==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: Julien Grall <julien@xen.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"demi@invisiblethingslab.com" <demi@invisiblethingslab.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: RE: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Topic: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Index: AQHZDyrHUdSstfue4UmxiTJ0hoNsoq5sTCAAgAEyh+A=
Date: Thu, 15 Dec 2022 19:27:12 +0000
Message-ID:
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
In-Reply-To: <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1580:EE_
x-ms-office365-filtering-correlation-id: aee71798-8b4b-48b7-4f4c-08daded25e1e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CyRSqNnK7fkkvgvbvzLzdYs9jG149D3ej+Jn0BNAU7A5NgSl643bzsVvwJ6ePZQ50NLel+uq1Lc7W1oxAuxm+9Le2eiSNK+L48fUyaV/5FSGh5hIifIchUhBbpv76EaeHMzURhobuzI/VHONeO5O+YNTZWUjT8AJIYsgU82f+Tr0Xe17y5VOmxw7zMIr3g41PM9RMb33Wfrt33uyE3eVt/+9LT713Q2qA2BNTVQyV4BKuXXhdp+wQybDHxrxMaBr0om/ykV4/Cgc33za8iln5rkFTEzG3vvrKI91Rnx84/hCzpsz8uz92boYA7snSzJ+XDc6vkR/bcMjmdXPkAH5LjUAHShj6wfMS+a3k5I9M3lZKIxUc2pRxPjtyhCNGPA/fdL/UQP+tEZqx+RvG6K92X786p+f05cwpWZymFemsZCYPayDncs1FMCrVuCB3kaAu61VnraEgVzee3/fg2DKb5cF9I5TO/eHdSrJud8LxBqe51rZfZw2nE9h5N9ji+hxGAtWxC9IyBNQN5jqqPGrrTUEV9JLFOoxW1N1jl0RtULsoNrOhgaYcZWL+dc6IPy/rBhOi5ejxqVjC30up6SmKcBAXvIO5SDs47vxgKooeYcxFtYNoTD8ks4RzOCb/Py3gqNQi8yh6j1iPYLNN4RNWvc72Mh/7n3XEK8543oUhTc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(396003)(366004)(136003)(451199015)(966005)(122000001)(7416002)(71200400001)(55016003)(7696005)(6506007)(508600001)(53546011)(5660300002)(99936003)(54906003)(26005)(6916009)(66476007)(66946007)(64756008)(8676002)(66446008)(4326008)(66556008)(52536014)(186003)(8936002)(76116006)(41320700001)(82960400001)(86362001)(41300700001)(38100700002)(33656002)(30864003)(9686003)(38070700005)(2906002)(83380400001)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 F+va2VG/pxIcJ4nuEoANm625iYjxmF42ZF5rIBFm5mjwjTmOVES6eXQKLERNaMDNJiwkZ+swdfIZ3W+B1DOYI6cnjPo8wlT88AFJ3o5/HHMEp+fpYyA0hoV6Lyg2deDpIuPoxJYAjQsid809NQ9jr1wXbe6bGQpgnmUFsTF9Dx5DTjnVL8YEEEFfyYnNLXaHCMBTYIotxgUIbDlsE45oIUI1gTjkpGCX5ASUIoI91nUtzUOO3hikRSluJDSsFqK7L3UiMQNBokmDtixrmR5/J+3xhtZM6kmuywSVxgO+sIAHlHRcfeSvifKoUmxkWU0/tmo9guLTSEYeVY2JWLYBndl64am5lyTfsc1Fd7EankfpiXyDVZuFYErZH6Bf84kVDczUjiWF91G4/2tsQ8c+BRi5+c8NHUw74lGnaYOOr7k=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0065_01D91091.515CF850"
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aee71798-8b4b-48b7-4f4c-08daded25e1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 19:27:12.9733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1580

------=_NextPart_000_0065_01D91091.515CF850
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Julien,

-----Original Message-----
From: Julien Grall <julien@xen.org>
Sent: Tuesday, December 13, 2022 3:55 PM
To: Smith, Jackson <rsmith@RiversideResearch.org>
>
> On 13/12/2022 19:48, Smith, Jackson wrote:
> > Hi Xen Developers,
>
> Hi Jackson,
>
> Thanks for sharing the prototype with the community. Some
> questions/remarks below.
>
> > My team at Riverside Research is currently spending IRAD funding to
> > prototype next-generation secure hypervisor design ideas on Xen. In
> > particular, we are prototyping the idea of Virtual Memory Fuses for
> > Software Enclaves, as described in this paper:
> > https://www.nspw.org/papers/2020/nspw2020-brookes.pdf. Note
> that that
> > paper talks about OS/Process while we have implemented the idea
> for
> > Hypervisor/VM.
> >
> > Our goal is to emulate something akin to Intel SGX or AMD SEV, but
> > using only existing virtual memory features common in all
processors.
> > The basic idea is not to map guest memory into the hypervisor so
> that
> > a compromised hypervisor cannot compromise (e.g. read/write) the
> > guest. This idea has been proposed before, however, Virtual Memory
> > Fuses go one step further; they delete the hypervisor's mappings to
> > its own page tables, essentially locking the virtual memory
> > configuration for the lifetime of the system. This creates what we
> > call "Software Enclaves", ensuring that an adversary with arbitrary
> > code execution in the hypervisor STILL cannot read/write guest
> memory.
>
> I am confused, if the attacker is able to execute arbitrary code, then
> what prevent them to write code to map/unmap the page?
>
> Skimming through the paper (pages 5-6), it looks like you would need
> to implement extra defense in Xen to be able to prevent map/unmap a
> page.
>

The key piece is deleting all virtual mappings to Xen's page table
structures. From the paper (4.4.1 last paragraph), "Because all memory
accesses operate through the MMU, even page table memory needs
corresponding page table entries in order to be written to." Without a
virtual mapping to the page table, no code can modify the page table
because it cannot read or write the table. Therefore the mappings to the
guest cannot be restored even with arbitrary code execution.

> >
> > With this technique, we protect the integrity and confidentiality of
> > guest memory. However, a compromised hypervisor can still
> read/write
> > register state during traps, or refuse to schedule a guest, denying
> > service. We also recognize that because this technique precludes
> > modifying Xen's page tables after startup, it may not be compatible
> > with all of Xen's potential use cases. On the other hand, there are
> > some uses cases (in particular statically defined embedded systems)
> > where our technique could be adopted with minimal friction.
>
>  From what you wrote, this sounds very much like the project Citrix
and
> Amazon worked on called "Secret-free hypervisor" with a twist. In your
> case, you want to prevent the hypervisor to map/unmap the guest
> memory.
>
> You can find some details in [1]. The code is x86 only, but I don't
see
> any major blocker to port it on arm64.
>

Yes, we are familiar with the "secret-free hypervisor" work. As you
point out, both our work and the secret-free hypervisor remove the
directmap region to mitigate the risk of leaking sensitive guest
secrets. However, our work is slightly different because it additionally
prevents attackers from tricking Xen into remapping a guest. 

We see our goals and the secret-free hypervisor goals as orthogonal.
While the secret-free hypervisor views guests as untrusted and wants to
keep compromised guests from leaking secrets, our work comes from the
perspective of an individual guest trying to protect its secrets from
the rest of the stack. So it wouldn't be unreasonable to say "I want a
hypervisor that is 'secret-free' and implements VMF". We see them as 
different techniques with overlapping implementations.

> >
> > With this in mind our goal is to work with the Xen community to
> > upstream this work as an optional feature. At this point, we have a
> > prototype implementation of VMF on Xen (the contents of this RFC
> patch
> > series) that supports dom0less guests on arm 64. By sharing our
> > prototype, we hope to socialize our idea, gauge interest, and
> > hopefully gain useful feedback as we work toward upstreaming.
> >
> > ** IMPLEMENTATION **
> > In our current setup we have a static configuration with dom0 and
> one
> > or two domUs. Soon after boot, Dom0 issues a hypercall through the
> > xenctrl interface to blow the fuse for the domU. In the future, we
> > could also add code to support blowing the fuse automatically on
> > startup, before any domains are un-paused.
> >
> > Our Xen/arm64 prototype creates Software Enclaves in two steps,
> > represented by these two functions defined in xen/vmf.h:
> > void vmf_unmap_guest(struct domain *d); void
> > vmf_lock_xen_pgtables(void);
> >
> > In the first, the Xen removes mappings to the guest(s) On arm64, Xen
> > keeps a reference to all of guest memory in the directmap. Right
now,
> > we simply walk all of the guest second stage tables and remove them
> > from the directmap, although there is probably a more elegant
> method
> > for this.
>
> IIUC, you first map all the RAM and then remove the pages. What you
> could do instead is to map only the memory required for Xen use. The
> rest would be left unmapped.
>
> This would be similar to what we are doing on arm32. We have a split
> heap. Only the xenheap is mapped. The pages from the domheap will
> be mapped ondemand.

Yes, I think that would work. Xen can temporarily map guest memory
in the domheap when loading guests. When the system finishes booting, we
can prevent the hypervisor from mapping pages by unmaping the domheap
root tables. We could start by adding an option to enable split xenheap
on arm64.

> Another approach, would be to have a single heap where pages used
> by Xen are mapped in the page-tables when allocated (this is what
> secret-free hypervisor is doing is).
>
> If you don't map to keep the page-tables around, then it sounds like
> you want the first approach.
>
> >
> > Second, the Xen removes mappings to its own page tables.
> > On arm64, this also involves manipulating the directmap. One
> challenge
> > here is that as we start to unmap our tables from the directmap, we
> > can't use the directmap to walk them. Our solution here is also bit
> > less elegant, we temporarily insert a recursive mapping and use that
> > to remove page table entries.
>
> See above.

Using the split xenheap approach means we don't have to worry about
unmapping guest pagetables or xen's dynamically allocated tables.

We still need to unmap the handful of static pagetables that are
declared at the top of xen/arch/arm/mm.c. Remember our goal is to
prevent Xen from reading or writing its own page tables. We can't just
unmap these static tables without shattering because they end up part of
the superpages that map the xen binary. We're probably only shattering a
single superpage for this right now. Maybe we can move the static tables
to a superpage aligned region of the binary and pad that region so we
can unmap an entire superpage without shattering? In the future we might
adjust the boot code to avoid the dependency on static page table
locations.

>
> >
> > ** LIMITATIONS and other closing thoughts ** The current Xen code
> has
> > obviously been implemented under the assumption that new pages
> can be
> > mapped, and that guest virtual addresses can be read, so this
> > technique will break some Xen features. However, in the general case
>
> Can you clarify your definition of "general case"? From my PoV, it is
a
> lot more common to have guest with PV emulated device rather than
> with device attached. So it will be mandatory to access part of the
> memory (e.g. grant table).

Yes "general case" may have been poor wording on my part. I wanted to
say that configurations exist that do not require reading guest memory,
not that this was the most common (or even a common) case.

>
> > (in particular for static
> > workloads where the number of guest's is not changed after boot)
>
> That very much depend on how you configure your guest. If they have
> device assigned then possibly yes. Otherwise see above.

Yes right now we are assuming only assigned devices, no PV or emulated
ones.

>
> > Finally, our initial testing suggests that Xen never reads guest
> > memory (in a static, non-dom0-enchanced configuration), but have
> not
> > really explored this thoroughly.
> > We know at least these things work:
> > 	Dom0less virtual serial terminal
> > 	Domain scheduling
> > We are aware that these things currently depend on accessible guest
> > memory:
> > 	Some hypercalls take guest pointers as arguments
>
> There are not many hypercalls that don't take guest pointers.
>
> > 	Virtualized MMIO on arm needs to decode certain load/store
> > 	instructions
>
> On Arm, this can be avoided of the guest OS is not using such
> instruction. In fact they were only added to cater "broken" guest OS.
>

What do you mean by "broken" guests?

I see in the arm ARM where it discusses interpreting the syndrome
register. But I'm not understanding which instructions populate the
syndrome register and which do not. Why are guests using instructions
that don't populate the syndrome register considered "broken"? Is there
somewhere I can look to learn more?

> Also, this will probably be a lot more difficult on x86 as, AFAIK,
there
> is
> no instruction syndrome. So you will need to decode the instruction in
> order to emulate the access.
>
> >
> > It's likely that other Xen features require guest memory access.
>
> For Arm, guest memory access is also needed when using the GICv3 ITS
> and/or second-level SMMU (still in RFC).
>

Thanks for pointing this out. We will be sure to make note of these
limitations going forward.

>
> For x86, if you don't want to access the guest memory, then you may
> need to restrict to PVH as for HVM we need to emulate some devices in
> QEMU.
> That said, I am not sure PVH is even feasible.
>

Is that mostly in reference to the need decode instructions on x86 or
are there other reasons why you feel it might not be feasible to apply 
this to Xen on x86?

Thanks for taking the time to consider our work. I think our next step
is to rethink the implementation in terms of the split xenheap design
and try to avoid the need for superpage shattering, so I'll work on
that before pushing the idea further.

Thanks,
Jackson

------=_NextPart_000_0065_01D91091.515CF850
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
PUJSTy1EUzAyKDcpLENOPUJSTy1DQTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNl
cyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXJyaS11c2EsREM9b3JnP2NlcnRpZmlj
YXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludIY0
aHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJjaC5vcmcvY3JsL0JSTy1EUzAyKDcpLmNybDCCARMG
CCsGAQUFBwEBBIIBBTCCAQEwgacGCCsGAQUFBzAChoGabGRhcDovLy9DTj1CUk8tRFMwMixDTj1B
SUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlv
bixEQz1ycmktdXNhLERDPW9yZz9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlm
aWNhdGlvbkF1dGhvcml0eTBVBggrBgEFBQcwAoZJaHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJj
aC5vcmcvY3JsL0JSTy1DQTAxLnJyaS11c2Eub3JnX0JSTy1EUzAyKDcpLmNydDBVBgNVHREETjBM
oCwGCisGAQQBgjcUAgOgHgwccnNtaXRoQHJpdmVyc2lkZXJlc2VhcmNoLm9yZ4EccnNtaXRoQFJp
dmVyc2lkZVJlc2VhcmNoLm9yZzBPBgkrBgEEAYI3GQIEQjBAoD4GCisGAQQBgjcZAgGgMAQuUy0x
LTUtMjEtMzE1MzczODEzMi0zNDMzOTAxMTAzLTQxMTc4ODYyMi00MDQ1NTANBgkqhkiG9w0BAQsF
AAOCAQEAYaBBvBGuhKlhJ2O6JBtcYRW7CYREO4+CAep40ordLIS0gvnKuE7A3a+4YzJpqKvfSbQd
+dQzeaZNz3kTpwJlZh5fJb/Bo7zQWlvDU1p/rr7a2tAnWNqSVlgQrvAk35TLqlGAmwo8tgQ1jxc/
JAkWg5Pqks6IKyO8CwKuIEOqL7vxN/THcEvpJvLnhRxm/ARosCDW1x0XTwivA8tS1AVvxxcpQAXS
uo/q3WNG/XDC8oO6oJLZfnpl9LiDBrsHEzDaR3Ct3XCR6rJ4ezjwFjH4SEOWCWeWsLhk+uoOgAx5
4cKlGpprXf5oje+0nSz1bAw5kaGD8k83rXL75YVcIuRTlDGCAskwggLFAgEBMFgwQTETMBEGCgmS
JomT8ixkARkWA29yZzEXMBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAy
AhMsAARwT/LbBVtfmneXAAcABHBPMAkGBSsOAwIaBQCgggHHMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMTIxNTE5MjcxMFowIwYJKoZIhvcNAQkEMRYEFN89o+tH
7S+Il86Gdjo/oe18Kk8yMGcGCSsGAQQBgjcQBDFaMFgwQTETMBEGCgmSJomT8ixkARkWA29yZzEX
MBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAyAhMsAARwT/LbBVtfmneX
AAcABHBPMGkGCyqGSIb3DQEJEAILMVqgWDBBMRMwEQYKCZImiZPyLGQBGRYDb3JnMRcwFQYKCZIm
iZPyLGQBGRYHcnJpLXVzYTERMA8GA1UEAxMIQlJPLURTMDICEywABHBP8tsFW1+ad5cABwAEcE8w
gZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMH
MAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEgYAKk544
TcW87NbcUG9pDHwirPlIsHa25Pb8t8ogtd3LWf36KlA9Vo7f0CreI8q32XbosmykuYreAzqFIaR+
wvhTnkIbtxsagX0CxdUn7eQMP4NldUOcYRFlLIZWnE2+h5UFSenIvWMH35HJME7SLTkce5SYHjU8
Utq2Fd+ksPn8UAAAAAAAAA==

------=_NextPart_000_0065_01D91091.515CF850--

