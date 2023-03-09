Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A76B18AF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 02:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508154.782505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa4zZ-0002Sa-6j; Thu, 09 Mar 2023 01:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508154.782505; Thu, 09 Mar 2023 01:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa4zZ-0002PN-3O; Thu, 09 Mar 2023 01:22:49 +0000
Received: by outflank-mailman (input) for mailman id 508154;
 Thu, 09 Mar 2023 01:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rN8H=7B=epam.com=prvs=7432707a69=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pa4zY-0002PG-7t
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 01:22:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4135e09-be18-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 02:22:45 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328LPJ1a000428; Thu, 9 Mar 2023 01:22:28 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3p6fhnm8ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 01:22:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PA4PR03MB7455.eurprd03.prod.outlook.com (2603:10a6:102:ec::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 01:22:19 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6156.029; Thu, 9 Mar 2023
 01:22:19 +0000
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
X-Inumbo-ID: e4135e09-be18-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiA1fO0Rb7mg7qu37XFKckMLAjH+Mqp7AVBevBgQfsNgB9/B36mF/dqyqxVVj3oGuwiGmqmdUGFpYyKo9G3vrR/nqtHFlpoWzE70EuAurA+qGbUURevKdMCKTmQ5SbKj+LSqOeMWzlLdAzZf87cVmRcaTP+0MCExxTaoDOZ7NMQ5xxqnITw5PWzHPzwZ4LZ/fTA3Y4HN1or0MwQqCxLD7MtCdHQnhG7cde+nXFhnH+He5939sVEAr3r/7XSPBPYAB5UksMmq9TpplVp7JsUB+fACusTn8mdr0sqli7VjS07B2UeHnBWNP3bBJ9umn68Xv4g0YbzO10G+FJh/2p4hDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqy12t0RQd/RNwTswnsTspjMP6itjiRNUtrLGauzMis=;
 b=U5HfksPQX+IP3BBCc0k6OCLQRu/uTnLCPri+u88uLEOa99DnqEqs4heg4pA71OC5Hj+K6hN6y48owd2w9zsMtS/pTcybgs2LUA0NlUvVtPbUkq7rT2gk4H0g5TkojhfiRRwR6u9BdsHVBK2NRoQ1veniMQ7QtPYM66K1hoTg8HsJ9XqmJN1rnEIFhW3HqEXbdynXAKBuJqy/3QdjRVIyLKS3ezpseFatbXqWh6fGTm4CJZm0x70IRldNpSpCDGo5QgGqvPQ+WYEQXIIVMFkzY6C5R+UnGCF4m+j7SQJJH1BN5uS7XPNPn+j+R5eY8pWqGxp2Hl1lLQPpeEBsMPWPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqy12t0RQd/RNwTswnsTspjMP6itjiRNUtrLGauzMis=;
 b=roS7tpKwaLkGX8AkzMjMJ0dXwcw09sGT042hMfvEUImCCNLOMAl3AvehDKSkw1kNyC5YqelpLeYIe3WSTBs2BsRMSEmsVuK9QM3uC/VzK3yrs/Lf2oQJAVoZEzFPF81MlOtaVzU2g0UsQO95QPZJtXP2gbDSaWAl20BoB8FdJ7CkhYvBwQ1Kfi4SCLMLG/rxXoZC3azV/wBbaxsFeybirTt0PR6QF+fqLypgQf4rg2CKOmfSoxlD5qh2w9pIfTdTzG7JJnIqBZxBimIGsS0Cmo6vIO6j4O0+Pp83GWrgoL45+eoIxUIgPszWrAwaXo3G3K/oqRcZ9zvyNYpisolDQg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Topic: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Index: AQHYvUN/BRbyNewJG0OqhFjBUWUt7a6z9h8AgCWO7ACAALRSAIAYk4mA
Date: Thu, 9 Mar 2023 01:22:18 +0000
Message-ID: <87o7p2yb0p.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-9-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
 <875ybwylp6.fsf@epam.com> <67330fed-560d-0078-2c5e-0a71974f3dcc@suse.com>
In-Reply-To: <67330fed-560d-0078-2c5e-0a71974f3dcc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PA4PR03MB7455:EE_
x-ms-office365-filtering-correlation-id: 6d335ece-1a09-4e64-92cd-08db203cb99c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cN7xgwxMgpDHbuIm4Vo6Y4mFMKUoil/TZuMofQy6SKyr2U5UT3njh23RZ2WceKU3If/IwBx6w5JetQ2FpVsMXSoktl2DOGqL0haEg9BB5frg4cyuXSiHanfVM0FUc5oMHVBaSBRL0S0DpK/T1j9CjjLaTSyaLI8DpQIhfyv5QchJoXNwgsQHMYWH5I6EDvp7uaqszU7dhix9wXD3de9/40yVVxoI29NKKxHMKJe/o8+oNbxb7RDaaja6jypgvqhVVIk2cNDnCWaPudoVMbfJRuUB57UP1eZHLCJB2uOhDcCQoQgwDIKdEwoH9uyGRwtb2xmquieBek7Gms+qNRU4pQFfgD9mQst5CZUSvQ9dnpMxJCdJ/J3cb3w3QXeyperX/3wSHS5xwj17o8UEI1ImPKgxoRfuF9vRLliLYZNvgLfnPSBANWZNNmIRXFfC9Lkko0NAmJtxx3WLFPO6ukXW+GGvL7YVDaIREOdAW+uNfL63+rbDtScIWxhdn1ZfKByxBb8Tq7KMk8Ga5tlllvaANBl+XfJXv7/UdTUrsJV7lFUScMYcS4BU009BLyIHBbjSjH7DjCTuQUcZwr9KNaa27OMNozmxJqLvW9ydzn28pu+e+6L4+Xzj/rU6tx7FrHzBxft34PTAj+lvEeDvpEHMVkfAmLCD6tEJRjjp4I6wlknvoq8enmVXYTL5M4hPhz1rBAttAxdFG2GRRc147s2m1g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(66899018)(316002)(54906003)(86362001)(36756003)(38100700002)(6512007)(38070700005)(186003)(122000001)(26005)(83380400001)(6506007)(53546011)(55236004)(2616005)(7416002)(6486002)(478600001)(5660300002)(4326008)(76116006)(8936002)(71200400001)(91956017)(66446008)(41300700001)(2906002)(66946007)(66476007)(64756008)(66556008)(6916009)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?53VEI8AnVYXq+r04TE4ki0V7emHK7Psp93KldRBY9i5kJ8ko+2g4lj83EN?=
 =?iso-8859-1?Q?K4PCv8lRsC0dE/+4dbQ/hGgsWY3qsgHxQilwgLZ7ujT2ednssoShoX8NFS?=
 =?iso-8859-1?Q?GmrWo7DkvemSQQdkH8/I9TxgVSWRfF3rlyGyohyoBtZGKoo33T32Eh/Zer?=
 =?iso-8859-1?Q?HzzfkM4Ah3XcSiqB5XMBFqEpsL/8QLGcjke5O0Bjl7DzDQtF2AbvgGOCm9?=
 =?iso-8859-1?Q?iX9MD6G9cXDvsBw3f1a/YUn7CxBkeQ5jyve2A9YC83+u8URqOqySMrwiUO?=
 =?iso-8859-1?Q?hmF0r/V8mRGSZYpsQ+bv7x6QWls55MQ9jlVpKgyJ3ChWB46Wcn9hCMwvOU?=
 =?iso-8859-1?Q?6r7yf+/vBfj0I2rVHBpdn90U2IHLYu7JK2c69nOaucEjTJHRrb/XiEbigv?=
 =?iso-8859-1?Q?odIVhOs4tZFSyiIXzxEa3C37Ffguu18Y5HqEBfEEJUVuXJsL79FLy7vYC/?=
 =?iso-8859-1?Q?Lnn8n/Qw9/1vL3lsvscuiW27HTAhoWMG9vymiiy4PnUMZJHWgP6EBtH/IU?=
 =?iso-8859-1?Q?QLVrCG+P9DMKQolAguNqr3SyBIctp9uGj6f8F0rzBRpnat4u6l4xfboEIh?=
 =?iso-8859-1?Q?QjeMirnOpmDOCdUhFD8WkDcnX3cnOh0Gid083qd/Vj5ZcRHwi08Azdo0V0?=
 =?iso-8859-1?Q?/FBR6ZSMqHnBu2CY7L1cFVFK02wF+wSQbT+W6GXu5eYNFlFUHenw++NoIJ?=
 =?iso-8859-1?Q?nuGalVRiLMRHphAeUKiF+xre9K/qUd5fuGI9dQidA6PeNT0yvAd5p+qLTX?=
 =?iso-8859-1?Q?CzzyowkrFLlqxaLMHIS/U2v9/glvqh1JJJXL2GtyfLtsUx/WiKpklSarl+?=
 =?iso-8859-1?Q?Ec8pQ03vngqQRC5qqLGkCTDpZT2dvFxHDxgRvREPXL4jxbc00RwrTZm8GQ?=
 =?iso-8859-1?Q?FsoAL1qzVVVlvabLKWQ1r2EhrM5D2EkaVVfJdM7phcluny9eVuO+LL+89w?=
 =?iso-8859-1?Q?8DQyK88rMpArW9LdUhYUf4zAXddWGy8qVpmMTaIVfLKXTxGqK0aoPTzwjB?=
 =?iso-8859-1?Q?4yV/QpyzdWYIdmewU/zobMBRzphwHsuDzm9lknFnYHtvHmQz9e3p+iwz49?=
 =?iso-8859-1?Q?pE9QRCd0nf/u//lren+Bg1ilQo1WKMBIX4NE6hgHSmTHaSujUA0aubrzJ0?=
 =?iso-8859-1?Q?GQZrZpd8khFewkfjA3bQ/miecHCHKA5UCZ2rSfMbhYDaoCmMukuFCVeYST?=
 =?iso-8859-1?Q?KiwFHcvny6X+z6qYsNQ7z9+5tj5iqkp1VRniMWPlagwyCaTtwDBhDx1RNb?=
 =?iso-8859-1?Q?0tNH30E36aIoYFa2GHJkLL80k72IjkZp6438Da59YoQABm/CM/GgZqToe6?=
 =?iso-8859-1?Q?5OdiuAPhpqNY+tV2uioONfw2aCDrt29K9FtBO9cBeJ9bakk77tPIHAWTDh?=
 =?iso-8859-1?Q?p3lAbn+2LMR2CFtFbN96RkEM7pv/YXMbdUIY4+bJeUzmtbdTkKqgd1QA7V?=
 =?iso-8859-1?Q?NUJ/TfJ/dulry0CO+BudRTYBQgI4A1i0c2/cHLcwpoe4E414lzzakKLyRF?=
 =?iso-8859-1?Q?Du2OGkPmGHltUBHYRIev94D8fqGLgkaVIN+aHCXIHrC5qiQbXQlL+lZgcv?=
 =?iso-8859-1?Q?VcD6YEHA4EsXw/jr/Vh7AmxbZ1rabEVi1uG1RKdfPBo5ubb9+WDEhp2P08?=
 =?iso-8859-1?Q?s+wjNVqmsDVNHCbh2RYW1LpxQVjgHFFbUeTtivMWUDKYpkElWhCe1JTA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d335ece-1a09-4e64-92cd-08db203cb99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 01:22:18.6761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7oBueL2LUhNEKC5NAFyW7wa0PhGIHofOggldXO5dFfFPdNHfpFbNvMAqCk/KSR2FIcTPQjmKUEPd36C0tsSrySGcgvT2IIyvwru1CrQ0ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7455
X-Proofpoint-ORIG-GUID: vDEO7zgbmSUPKRHuY_fWYQw76-483nA5
X-Proofpoint-GUID: vDEO7zgbmSUPKRHuY_fWYQw76-483nA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090010


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 21.02.2023 00:13, Volodymyr Babchuk wrote:
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>>>> As pci devices are refcounted now and all list that store them are
>>>> protected by separate locks, we can safely drop global pcidevs_lock.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> Up until this patch this patch series introduces:
>>> - d->pdevs_lock to protect d->pdev_list
>>> - pci_seg->alldevs_lock to protect pci_seg->alldevs_list
>>> - iommu->ats_list_lock to protect iommu->ats_devices
>>> - pdev refcounting to detect a pdev in-use and when to free it
>>> - pdev->lock to protect pdev->msi_list
>>>
>>> They cover a lot of ground.  Are they collectively covering everything
>>> pcidevs_lock() was protecting?
>>=20
>> Well, that is the question. Those patch are in RFC stage because I can't
>> fully answer your question. I tried my best to introduce proper locking,
>> but apparently missed couple of places, like
>>=20
>>> deassign_device is not protected by pcidevs_lock anymore.
>>> deassign_device accesses a number of pdev fields, including quarantine,
>>> phantom_stride and fault.count.
>>>
>>> deassign_device could run at the same time as assign_device who sets
>>> quarantine and other fields.
>>>
>>=20
>> I hope this is all, but problem is that PCI subsystem is old, large and
>> complex. Fo example, as I wrote earlier, there are places that are
>> protected with pcidevs_lock(), but do nothing with PCI. I just don't
>> know what to do with such places. I have a hope that x86 maintainers
>> would review my changes and give feedback on missed spots.
>
> At the risk of it sounding unfair, at least initially: While review may
> spot issues, you will want to keep in mind that none of the people who
> originally wrote that code are around anymore. And even if they were,
> it would be uncertain - just like for the x86 maintainers - that they
> would recall (if they were aware at some time in the first place) all
> the corner cases. Therefore I'm afraid that proving correctness and
> safety of the proposed transformations can only be done by properly
> auditing all involved code paths. Yet that's something that imo wants
> to already have been done by the time patches are submitted for review.
> Reviewers would then "merely" (hard enough perhaps) check the results
> of that audit.
>
> I might guess that this locking situation is one of the reasons why
> Andrew in particular thinks (afaik) that the IOMMU code we have would
> better be re-written almost from scratch. I assume it's clear to him
> (it certainly is to me) that this is something that could only be
> expected to happen in an ideal work: I see no-one taking on such an
> exercise. We already have too little bandwidth.

The more I dig into IOMMU code, the more I agree with Andrew. I can't
see how current PCI locking can be untangled in the IOMMU code. There
are just too many moving parts. I tried to play with static code
analysis tools, but I haven't find anything that can reliably analyze
locking in Xen. I even tried to write own tool tailored specifically for
PCI locking analysis. While it works on some synthetic tests, there is
too much work to support actual Xen code.

I am not able to rework x86 IOMMU code. So, I am inclined to drop this
patch series at all. My current plan is to take minimal refcounting from
this series to satisfy your comments for "vpci: use pcidevs locking to
protect MMIO handlers".

--=20
WBR, Volodymyr

