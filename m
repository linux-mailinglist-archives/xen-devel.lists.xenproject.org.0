Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38728613365
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 11:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432756.685404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opRmy-00017R-99; Mon, 31 Oct 2022 10:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432756.685404; Mon, 31 Oct 2022 10:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opRmy-00015C-5m; Mon, 31 Oct 2022 10:13:04 +0000
Received: by outflank-mailman (input) for mailman id 432756;
 Mon, 31 Oct 2022 10:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4oKL=3A=citrix.com=prvs=29677aabb=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1opRmw-000156-HE
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 10:13:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91b7786f-5904-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 11:12:53 +0100 (CET)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Oct 2022 06:12:46 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM4PR03MB6013.namprd03.prod.outlook.com (2603:10b6:5:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 10:12:42 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%8]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 10:12:41 +0000
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
X-Inumbo-ID: 91b7786f-5904-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667211173;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=S0j3BqmU/4jk1hsrwzp4nxYdIsOmYvxL2UxY4PVWkCU=;
  b=Mi+5pYrOgSFYQIab3uvuys0o2Eo2sm4aRIg2yu+QEGXFdXn/VQM8CSBr
   etWyqi4bHRNv7zzwpA4GzG/u4O+kr/AH4c2WmRySBT7XVT2tHi76tByC7
   6TXcM3zQPUPxnhEqD2XpvPLl+as9MM8Eo+oPL8VpAiSMNxL6UiCEECnt5
   8=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 84253942
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1YKd2aJTWhzjoWNgFE+Rz5UlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGI+//E4H65fcmIQ2TQI6pCthEihDpMDPDt7Dfh6tMXmbcpzOHBhu4
 swQOtCQIJlvHnOD+x2hPufop3UsiPDRG7eU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 d6u+sfWZlH/gW4qaWlKsane9E9h5fiu4WpDsA00bqwQ7QPSz3UbMskSdPq7R5fariu4PcbhH
 rqek+vplo/9101wYj9wuu+jKiXmepaLYU7VzCITA/L56vR7jnRa+r4hM/YBYltghTyMntRgo
 P1ArpX1QgoyVkH2sL11vyJwTmcvYMWqxJedeSLl6JTIlhWfG5fR664G4H8ebNVwFtlfWQmix
 dRAQBgRYxaKgf6Bwb7TYoGAUex6caEHlKtG0p1R5Wmx4cQOGPgvcI2TjTNs5x8ih9gmIBrrT
 5FxhQyDzvj3S0Yn1l8/UPrSlQoz75X1W2UwRFm9/cLb74VPpeDYPXeE3Nf9I7S3qctpckmwq
 1rCx1u6XhYmBJ/By2GHqnKDrf/zgnauMG4SPOXQGv9CpnS2njZWMztPEFyxrL++l1K0XM9ZJ
 woM4C0yoKMu9UutCN7gQxm/p33CtRkZMzZSO7RitEfRleyJvEDFXQDoTRYYADAinOA7QiYl2
 xmlgtXtDCRHu7yJU3ONsLyTqFtePABFcTVfPn5YF2Pp5fHHmsYdpAz9a+9JFb+FiPPVKBHdm
 WqV+X1Wa7I7yJRjO7+A1VLNji+op5PJZhUo/QiRVWWghit1eYihbpSnwUXe7P1AaouVUzGpo
 3wsi8WYqucUAvmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyF+WOnfI1WyCFzIgFuKMlsUQHuZ
 EjfqAZA/qh5NXGhbbJ0S4+pAsFsxq/lffzvW+rIdNNIbt50fRWe4SB1TUeK2ibml01EuYEyP
 42KN/mlC3kyAL5iijGxQo81wbItgywz227XbZT61Ai8l6qTYmaPTrUIO0fIafo2hJ5ouy3Q+
 tdbctCMkhxZWeimOC3Pq9ZPdhYNMGQxAo3wp4pPbOmfLwF6GWYnTfjM3bcmfI8jlKNQ/gvVw
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:qEbYD6Dx3ixtpzrlHegasceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcV2/haAV7GZmXbUQSTXeZfBOfZogEIXheOjtK1tp
 0QPpSWaueAa2SS5PySiGbXLz9j+qj/zEnCv5a9854Zd3APV0gW1XYdNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SCIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoai+2eGRi+erNvb8yfT9GQ+cyDpAo74RHoFqiQpF4N1HLmxa1O
 Uk7S1QePiboEmhA11d6SGdpzUIlgxep0MKgGXo/0fLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRC8pDEzGlqf1vjxR5z2JSEAZ4Jgupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIqiYdpQTOeNSSn5uw6zjndBGOgQD/q1sZSo5Bkp7yUfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.95,227,1661832000"; 
   d="asc'?scan'208,217";a="84253942"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9shBT4vw+boZRoynt2EiVTvZH8/2VLScwq4nFCLxJoPeCCBhFx3h3yvn8RwCpbbcsRPHQm/oCeeOwuGid1AQ2pPO/UE0Op1khUPmpRdPNhnaQA5yczjjGxRYFn6HXE6pImeZs072GMhlLzYtJ1tTconoEv7Cg2G2yYqjxWRlMYHVKltPbOx3a6ggA/K01RmdEtq5Ecs0nXzIUGNtmGI2xphZam7iKA71OsIWVeVUb+0rm3eQv1bh7P0HWSAHNwwlwwqPYp5FqA0CxhQcttUkSwLXVjRwPm4Xt9w5yG4prUrOV1C6Ul/0iYTLIYJPFOmT6nAHHhK0FPqE44EVUltjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcpFzGI6IoPOSIWS2McIqLJ1KnYVv3CkFohp+Id07gg=;
 b=HvUwelAbUNNb5Jyo7nXnAumjCe/x11kORkM4F4AdmPNSr3ZGpl5dJ2k5zta6yBiDInJIk8ObbQ3BpyiTUwLpyB+anPVwqrrfjEtLz8M84AMNXxjUgbx/M4P+ObmR6XgWQhA+vb4Y/4b7EpfHgyCif4gdTY2Guu64tJY8LnIJJph9rYq2k+Kgnc76yVy/oAUQUoYBoMqwT0NeFgn6j7YZ5mhAONBh/kO2NS1Odfu+wDbzXC28DuPNkT/SphYjpSdz9VoLTFul1gZArjDitQYZhRUkdvahHRLVuBEqxkSgeHnb11QhviIIsbJ6WTi8JhSEa/5Ru5Nk1YZYzZRB9p8o1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcpFzGI6IoPOSIWS2McIqLJ1KnYVv3CkFohp+Id07gg=;
 b=HkuROOctUEv4DH1wyNVRt/lRWNH+bkgz0JymKK/zhPPX1pPe0rMiIacHv6eBTsuUvCPwxI9OjNryeSZRegENL0hr2Dxoc2Av4Ll3ygXKKG3Mn/m3FnfK5B78bQECjxl31Enp715vEZGMFsxLyFd4e0QMP6qFJUrd+HVSMv31Bu8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <dunlapg@umich.edu>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool
 size
Thread-Topic: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m
 pool size
Thread-Index: AQHY6SSZSdHfQqx5wkKQBwuC6qEQ/a4j8VgNgARSJYCAAAzQAA==
Date: Mon, 31 Oct 2022 10:12:41 +0000
Message-ID: <5EC7E359-3583-4846-8AF8-B84197B83BEF@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com>
 <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com>
 <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
 <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
 <2a8a490b-fd5c-5fe5-64ec-975c9c4784d0@suse.com>
In-Reply-To: <2a8a490b-fd5c-5fe5-64ec-975c9c4784d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|DM4PR03MB6013:EE_
x-ms-office365-filtering-correlation-id: 2e24d21c-d0f0-4643-4fdf-08dabb287257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oynRil2ElZER//ZxQILodec0WJ3KJdLj+ul2z7DoxdtVqsXJf9hWqyLLXyWRgLGn2At3uIIpFzv+2FGinwazi5sDTRJjPSnhKJ5g76D7WU7x+40+OKU9s17HEfopqD6/ZznVmFqwZ/0W/+QV4hX4bLs57+6ZBCBNp2tPyfIDYdiz5ajwfFD7xMYOcdSWfIe3FVyGKNP3EY/A1MIEixsM0bLrOHsREJplcnOkQEn7Yk0v6+tuFAUfa87D9+foPzgjOYhVpDXgVCDagDRBQQpNYFYwQnjPBYeY5EkPI4UWBFtnY2hGIplD+d+jxg8OzkDbz/dsie56BC6zt6YpSNjFP1TN5nJqH09lLNCP+1nCtfBgMjRDGpye0yQjMrmY9HV78sjr4YkM133M6aUSNzcDFoB3q7PQWpVuRdmqba4o8OwUcf0b7eJjyZ7GIKnfNLhEv1qNmZ4f7WZ0xxGR3h8jwduj1P6jWcAhdep0ZX8Ql0R60ez0S6uEroJyew+PkvHOxPibKvRbPeb3F3wabe7XB99C05013sL5uAErYiAYkHvw4pXPp+gX8XyXaeZuNeaKlUpt9T56k+FLUHuVtoPIKe8CFxQ53HtfDWnGTspdKFH8S4e2OqlQFumi2ir24fT7SDTIVEQCMi56OqlEptF4bjFbxNBcqsFQlP5SpDuwMmAhKZVXI/twhJIn1L8MDlsBna/fgvd5Sccdhh34fBBbtQQiYv8T+Sw83DdB3HGPoewQwOPCrPKctxOW9Tz1moVypd78FO/HVXDykuQq9NFPjSujlL4tnMjxy6txXVJOUHtmi8PCnhj35OFeqNY3pMSe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(36756003)(38070700005)(86362001)(122000001)(82960400001)(99936003)(38100700002)(71200400001)(2906002)(6486002)(478600001)(76116006)(8936002)(91956017)(5660300002)(4326008)(64756008)(66446008)(66476007)(66946007)(8676002)(54906003)(6916009)(6506007)(66556008)(41300700001)(186003)(2616005)(316002)(26005)(53546011)(6512007)(83380400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFFabTBLSjdzTzRtaFUrL2gvRmREZ1Jjc2c4TlVPTlhLRjJvKzNoZHlmbUtL?=
 =?utf-8?B?b285bTFrY0pTcThEWFlwWW9nZ2tHV0w1cnZUM2laaC9sdUFMaUpVN283NmJG?=
 =?utf-8?B?N1FXY0I5ZkUwKzczY0FDdEFZZFNreXpPUGszdzJCSlU2STlQS1pRTUhZVTRm?=
 =?utf-8?B?RytQZ3VFbng2bXB1SGlidy9XRzJQM3grdi9XZ1Fta2lYN3l1THZiQ2dQSWVJ?=
 =?utf-8?B?VTUwZFJoR1NqekxnNkY4WlZTaVhGWm9mWG51UDMxYXpMS1ltMHppWEJpTHB2?=
 =?utf-8?B?cFcvMzJ4OTJpeW4wSllQQTlnTEtWLzQwUzk1K0hpeE5ieWFnY1lHejJIejlW?=
 =?utf-8?B?c1hVakphQk9RN2dVcUhjcHRXTjQzNUNwRlNQSXhBckhKWUhCVi92WFNmMXB1?=
 =?utf-8?B?VUxOM1Q5a0U3enRKVXc3aGNDL1NwWnBxbElNTG1xZmlpWVRTaUFWTVpQZjIr?=
 =?utf-8?B?eE13bUpoK3hCd0pKTXM2eHllMjdlZjcwYkhNanNEaG80WDc5R0l5bStCNWNx?=
 =?utf-8?B?QXRMQmhkTzJGVjdtbEtycDVXdEU4OWVyVHpUL05Qc1g3c2pRYThIN0FTSCtW?=
 =?utf-8?B?VDh6RE1DQ1JwalJydTcvNWR4Sis1TDM5aGlwMFhJUHRRSk0yZGRRRG5lQkpU?=
 =?utf-8?B?b1RiQjFKMmoxek13QWVtajhQWDEvb3EyWWh4MGtUZk5BVHdkYVRMSmVvM3Vx?=
 =?utf-8?B?b1h5T3FNNTVoUUNYdHVZRzNFR0JqekRYZzZsd3hHTVg1UktJZHdLZW1yTlRy?=
 =?utf-8?B?ZjBnM1pVTjJ4THFwSG9ITUgybzV1RE1rcVJVZzkzK3VrZnlNaFhlaHhZd3pZ?=
 =?utf-8?B?bm5ad2FURzl2azE5THNScTZnZnVNOVFkK2ZGNUhidVhHd0JnUzRKUlBBc1BF?=
 =?utf-8?B?cTFJMDR3dnFUVXA0NS9kODVKclJXNnh3eGVxRURIb2VnWERhWHprYlJ1anNM?=
 =?utf-8?B?akRzb3loWXA3NUxGS0JpZkR1c2h2WXdMT0M4R3FEZDl4MmhYNEIrSkxDZzgw?=
 =?utf-8?B?RlpEOGtmeG5XK1FOOXplVmFuQXRWRjZMNDIzWUdzazJieE5zYUdibmorM3JK?=
 =?utf-8?B?eE5LbC9OTWdnMHpMSHVaTjRQaXJPcDVVajNtYXRwS2d6NHVJTmNLV1l6NmRz?=
 =?utf-8?B?ZWxFN0xXdXdVOHJEcnNUeCtkY0tzWWpUeGlFbEhvMWdoSWNHTWJuaVZzRXVl?=
 =?utf-8?B?ZnFJb3hUeTgzeVBYTjB6WmFmOVZLWEJFQzVmNnFxQ2k2d3Q2SGZJek9BTS92?=
 =?utf-8?B?MThlWFIycm9JaTBtRzRLVzhvNnRidEFxUHBMZmpZMnRlaU0xRWtVbUZPcC93?=
 =?utf-8?B?YzVOVzRONlF4T1JyNDFyNHFhUFdmOExFUDg0R082VlduOGNWQ0ZEU2NmNHd6?=
 =?utf-8?B?V1hKNjNvV2lrV1htdjZLRFVBejRkSmhiVUFYRnZmOW9vQ2VxQlBjdmhaaGdX?=
 =?utf-8?B?SnZ0OUdRd1FzTUVyRVh6SGpIS1dQZEptRW5vemhhUmRrWFlvU1hOallQbFc5?=
 =?utf-8?B?aWh5em5adGpaS29ob3JkU2pZcW9qczlIQUdUU1lkZi9HL05TTUdNMDlBZTkz?=
 =?utf-8?B?OFVEcXNJYTc1MHZ6OUlGdnFtYVJBMzBNU3RGNjRoNjVLVE1CclpnRXkwemIy?=
 =?utf-8?B?MnR2Tkk1Zm1BTWNWcVpNd2NLNmx1YmV0YXBVdlpCaVZYeWZQYjY3bEtsUDZM?=
 =?utf-8?B?eis4d2J3MWdZaE96RDJsc0xoZ2NVM3d0OXlkbUU4NU9vai9CZFpjYlhET3Fo?=
 =?utf-8?B?bFZXOWgrenY3SkIwTEY3U3VUVHdJL1c0M1RxOEd5STZLYlZiM0ZsYnNoQkkv?=
 =?utf-8?B?bXlmTTM5TERvaFN6RlN5WGh0aGN6clBhZks3a2lYaFBRZDRUMEp1S09uOHZn?=
 =?utf-8?B?Q3NvNWFPVkdOSEZ5Q3NKMkxWeVdqL09Ha21HK0s5UTkrakZYOS9FZmU5blMw?=
 =?utf-8?B?cVpSN3NjNFV0ODE4SDRRb0oxRkhsVXZIK1Rqb1prTlM0UEtNblBjbktOQjUw?=
 =?utf-8?B?aWpQUHlaVzBtRFh4ci9jWjZLM1BvbnNpNERXTkNkTnpmUVQ1c3BoUVlIdGxX?=
 =?utf-8?B?cUhhREhoZmJUOFI5MXNWU0FVNldOTm1XZDdNOGZQQ1h4MkVxMER1Z3dJRVdy?=
 =?utf-8?B?VmlCcWUvN3dRZ0puRUhxYkJwN3VKNzBoQkVud0RNcTZKZjNMeUV0blNnMVRl?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E4F71DA-140C-4FDA-BB4C-9FF5874D00C2";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e24d21c-d0f0-4643-4fdf-08dabb287257
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 10:12:41.7275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mim+ZMYS/PL9G/6WsjpplVZghwV8VaMneF7X0+EPlsOG1men2gvHmB8L0ZsMHBPJFR9YBXD/KDPoKdMIzi5p8uTNgaChoAzKqvEyS1bGnZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6013

--Apple-Mail=_8E4F71DA-140C-4FDA-BB4C-9FF5874D00C2
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DCD67686-F85E-4921-A3CB-5ADB6AE77FCE"


--Apple-Mail=_DCD67686-F85E-4921-A3CB-5ADB6AE77FCE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 Oct 2022, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.10.2022 17:27, George Dunlap wrote:
>> On Thu, Oct 27, 2022 at 8:12 AM Jan Beulich <jbeulich@suse.com> =
wrote:
>>=20
>>> On 26.10.2022 21:22, Andrew Cooper wrote:
>>>> On 26/10/2022 14:42, Jan Beulich wrote:
>>>=20
>>=20
>>=20
>>>> paging isn't a great name. While it's what we call the =
infrastructure
>>>> in x86, it has nothing to do with paging things out to disk (the =
thing
>>>> everyone associates the name with), nor the xenpaging =
infrastructure
>>>> (Xen's version of what OS paging supposedly means).
>>>=20
>>> Okay, "paging" can be somewhat misleading. But "p2m" also doesn't =
fit
>>> the use(s) on x86. Yet we'd like to use a name clearly better than =
the
>>> previous (and yet more wrong/misleading) "shadow". I have to admit =
that
>>> I can't think of any other sensible name, and among the ones =
discussed
>>> I still think "paging" is the one coming closest despite the
>>> generally different meaning of the word elsewhere.
>>>=20
>>=20
>> Inside the world of operating systems / hypervisors, "paging" has =
always
>> meant "things related to a pagetable"; this includes "paging out to =
disk".
>> In fact, the latter already has a perfectly good name -- "swap" =
(e.g., swap
>> file, swappiness, hypervisor swap).
>>=20
>> Grep for "paging" inside of Xen. We have the paging lock, paging =
modes,
>> nested paging, and so on. There's absolutely no reason to start =
thinking
>> of "paging" as exclusively meaning "hypervisor swap".
>=20
> Just to clarify: You actually support my thinking that "paging" is an =
okay
> term to use here? I ask because, perhaps merely because of not being a
> native speaker, to me content and wording suggest different things: =
The
> former appears to support my response to Andrew, while the latter =
reads to
> me as if you were objecting.

Sorry, the tone was =E2=80=9Cobjecting=E2=80=9D because it was directed =
mainly at Andrew=E2=80=99s arguments.  I thought about replying only to =
his mail, but it seemed like since I was clearly =E2=80=9Cjoining the =
discussion=E2=80=9D, it would make more sense to quote you too.  I could =
probably have made it more clear by leading with something like, =E2=80=9C=
I tend to agree with Jan here. =E2=80=A6=E2=80=9D

 -George


--Apple-Mail=_DCD67686-F85E-4921-A3CB-5ADB6AE77FCE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 31 Oct 2022, at 09:26, Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 28.10.2022 17:27, George Dunlap wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
Thu, Oct 27, 2022 at 8:12 AM Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">On 26.10.2022 21:22, Andrew Cooper wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On 26/10/2022 14:42, Jan =
Beulich wrote:<br class=3D""></blockquote><br class=3D""></blockquote><br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D"">paging isn't a great name. While it's what we =
call the infrastructure<br class=3D"">in x86, it has nothing to do with =
paging things out to disk (the thing<br class=3D"">everyone associates =
the name with), nor the xenpaging infrastructure<br class=3D"">(Xen's =
version of what OS paging supposedly means).<br =
class=3D""></blockquote><br class=3D"">Okay, "paging" can be somewhat =
misleading. But "p2m" also doesn't fit<br class=3D"">the use(s) on x86. =
Yet we'd like to use a name clearly better than the<br class=3D"">previous=
 (and yet more wrong/misleading) "shadow". I have to admit that<br =
class=3D"">I can't think of any other sensible name, and among the ones =
discussed<br class=3D"">I still think "paging" is the one coming closest =
despite the<br class=3D"">generally different meaning of the word =
elsewhere.<br class=3D""><br class=3D""></blockquote><br class=3D"">Inside=
 the world of operating systems / hypervisors, "paging" has always<br =
class=3D"">meant "things related to a pagetable"; this includes "paging =
out to disk".<br class=3D"">In fact, the latter already has a perfectly =
good name -- "swap" (e.g., swap<br class=3D"">file, swappiness, =
hypervisor swap).<br class=3D""><br class=3D"">Grep for "paging" inside =
of Xen. We have the paging lock, paging modes,<br class=3D"">nested =
paging, and so on. There's absolutely no reason to start thinking<br =
class=3D"">of "paging" as exclusively meaning "hypervisor swap".<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Just to clarify: You actually support my thinking that =
"paging" is an okay</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">term to use here? I ask because, perhaps merely because of =
not being a</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">native speaker, to me content and wording suggest different =
things: The</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">former appears to support my response to Andrew, while the =
latter reads to</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">me as if you were objecting.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote></div><br class=3D""><div class=3D"">Sorry, =
the tone was =E2=80=9Cobjecting=E2=80=9D because it was directed mainly =
at Andrew=E2=80=99s arguments. &nbsp;I thought about replying only to =
his mail, but it seemed like since I was clearly =E2=80=9Cjoining the =
discussion=E2=80=9D, it would make more sense to quote you too. &nbsp;I =
could probably have made it more clear by leading with something like, =
=E2=80=9CI tend to agree with Jan here. =E2=80=A6=E2=80=9D</div><div =
class=3D""><br class=3D""></div><div class=3D"">&nbsp;-George</div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_DCD67686-F85E-4921-A3CB-5ADB6AE77FCE--

--Apple-Mail=_8E4F71DA-140C-4FDA-BB4C-9FF5874D00C2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNfn5IACgkQshXHp8eE
G+0m8wgAtCqz/dGH+gdoUj1MtJMd18DQSAxMMH+RDvkM3F/Ukr8uPCtwVVyijL65
lu8IhZtgHlJ07BgugpCQu3hLdOxpINkCjQlPx5rkn1UdFT+k1fVO8toIe6BeX1vO
OHGCooS6nyzc2XEhUx5HRcGz5Hi71WDHLmCZX9fFLfOFsreDQkPwwA72nZzEj8Es
rWMfWmc78LBls0DFxYtJRDgt38iOCp71kopJ/3xGyDINjUyKkRBJQbv0vIVxnxCV
hBZQGGJVrladRYC2BJ0yZR+vr7ouSlq//6Pc7InR1wRzsvbk91rudF012rWF1/tS
Q5vjDVUFzrAT47fbuLOvymhiqkdagQ==
=UEz4
-----END PGP SIGNATURE-----

--Apple-Mail=_8E4F71DA-140C-4FDA-BB4C-9FF5874D00C2--

