Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140786193D0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 10:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437405.691756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtHV-0005Tg-N4; Fri, 04 Nov 2022 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437405.691756; Fri, 04 Nov 2022 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtHV-0005RY-Jt; Fri, 04 Nov 2022 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 437405;
 Fri, 04 Nov 2022 09:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EY4A=3E=citrix.com=prvs=300c1333d=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oqtHU-0005RS-My
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 09:46:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d186938-5c25-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 10:46:31 +0100 (CET)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 05:46:14 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 CO3PR03MB6725.namprd03.prod.outlook.com (2603:10b6:303:17c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20; Fri, 4 Nov 2022 09:46:12 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 09:46:12 +0000
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
X-Inumbo-ID: 8d186938-5c25-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667555190;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=bglp5dgIt9/XmPJTJXoEN9/YgZ8OpFU/d7ZhbFB6QVY=;
  b=MnHpW4kl1GGLxNLAFGCHPhKkZ8EWB5mI3CV78A1UEwB7Z3qXmL4DmntN
   HT7cXUehU4CoZUOXYYsmGd+VF8wEdH0U0Cid93Z8fyZ5cbNNr3+yH21AP
   dczL+JVHs856MBF6rmBx34gjXMKrSkUM1585ylbU0LNAVp9lbUgoMd+Bd
   E=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 83767150
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MqbUnakF81I2xsc5fvW4ZHTo5gy/J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWWvQP6uNN2H8L91wYdy+80wD75bXzIM1GQZk/y1mHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 btCKxwLckmYvsGnxeO0SvJyoscfJ+C+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee0WDbWUoXiqcF9lUaCp
 3na/m3/RBUbMtCexhKO8262h/+JliT+MG4XPO3jqaA12QDLroAVIEFKd1uwnd/nsXzkXY5dc
 GATyAMnl5FnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQK2
 1mTjpXWDDpgmLSPTDSW8bL8hT+7JyU9N2IJYi4ACwwf7LHLv4Ubnh/JCNF5H8aIYsbdHDjxx
 3WGqXY4jrBK1MoTjfzkpBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulxERhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:IqdWYKE/A0+dFJYIpLqFXpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhd4tKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuVD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlEawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontprcZrau5p+7f63+4sowwbX+0SVjUNaKvi/VQUO0aGSAZAR4Z
 3xSlkbToNOAjjqDxyISFPWqnXdOXAVmjPfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFr9dLSU3am2a/hGrDvCnZMZq59ks1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxlLaIXieePFm9Kc7gizlUSG6QSnnzN1Y6txwpqD8LYCbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208,217";a="83767150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMJL01QZBiTxYVtyQvb22CTMzKVzv6pMUEBUbA8DUIbjZQ3h30+nK2F6xwXjccEYYvDviuNtZ6pPpMZcmcjyoTN9LcE+HzZoszpeHA42PHpIqrGaU2sIC26PyLSbIs0ZEzZz4kWw+WYu6czBrM4fc/JMOiCzg5NMBtFMeFubbLJUdxrzOZiRI35X1y505o0V6Bp+G5bAb5OCPCqqoZQ83ffOs9qDS9f7SEj190F7BFtUwOJ5MwYaZI0wNWjNkpS+oHhlapCuHVGz8FuRAzk9vrAodAxOGcIzhIn2EexU2KBF553oFf2TdKMtTEIbEZ6omp+iFfvG05OowRdCsUSsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bglp5dgIt9/XmPJTJXoEN9/YgZ8OpFU/d7ZhbFB6QVY=;
 b=doc/QdJro7ai0wch4yTTKnBDEQh/F280xXE1NmS9mZp9e8PsU/4NzlO8M3F2kv5Q5viVVzYKNHOutV/QTQlBCuQoGRXA7gb5a6IGZoDeJ6BGHHwDe5fvw1ey1pRLIQpDlFYg63p53eqUXD99aiH+gPeCcXUQWgZYu7FEV+JQzgDN9bgaxD8h68KUQjFfDP+UrlOPF+5pwaCKkerk15tH7FKC1xBjEUI56b0GIDYLfTZ5rKjQUcr3mjC0MNW5EscFBCu2+HzB6vRBkiTU6qZp22Rmgh7YepNyuQ2xEdq2tquSmgm50rKR8Mt6SBf+qZcBwG6OcspW+YCwYXC0PiwA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bglp5dgIt9/XmPJTJXoEN9/YgZ8OpFU/d7ZhbFB6QVY=;
 b=m3Qo0Hgz54EhwZ+1sPymzi1Z42fAtQD5zlUjBNeVuU6e7FDtBzP5JpAViAbXrrfDjdRTbIidsHNSQJN+x6Ho94yEhSq/0gZw7sheuFC784Ibyfp1Ji5K3EqfSN02+oR/OCuUvJNSJvdWeKtCs84Rbd/n6pbOj6HrqhwqYPhIx0U=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/store.ml: fix build
 error
Thread-Topic: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/store.ml: fix build
 error
Thread-Index: AQHY77QswELu31uiU0C5DgxD195B0K4uhSKA
Date: Fri, 4 Nov 2022 09:46:12 +0000
Message-ID: <891A255A-7083-4495-A9A5-596BBE8842E7@citrix.com>
References:
 <5a453393dad1de8286fe5db16504d3db2906eef8.1667500970.git.edvin.torok@citrix.com>
In-Reply-To:
 <5a453393dad1de8286fe5db16504d3db2906eef8.1667500970.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|CO3PR03MB6725:EE_
x-ms-office365-filtering-correlation-id: ec88c4ee-27f2-4ad9-30ae-08dabe4968ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8VOoU5J24ptqM2gOyyW6mfeaadAaFdzdXaYelam0KxAKjbYXNNaMa0soQitEhI6Ic7YNRwUA3JPm57kedQWdQBZuwP82bSZCIx/Ff1K/U/pByr+DJ6kNjtdM2Iwgg9pe9Q4tN/QCkbcCl4GCfvgBYs65LvF04OvoTtron1WMxvw6ie3iPrP/5Ea/NC2n0kBa0ApWe+qMdZW3HYmpFZ2/CoYgY+kbozCcDh33BGm/4CKfxYnzYa8ChNvEcxFs1vgNNX/+HBW75Xl42u/eDzx9i3mK8yT970jR9A8gp5I64i22L17B54lDQiDX2RwW8HeMsmX5yXnkL0tUKCFI/eTQhKijHh3rMhY67QUF2iked/fA6XCQZVDC8fr+kV9dymi0ztTosz8q4XREcJ1ixAP/j/po2PlkdtkgqrPkPOWX78AfcFqTWF0krz9fI1zOFPKolVrHmYq3D+vPXgKrigiDsjkHCKBBzy4FNXHmfhGh+2hM2YrsHughT680qxWTiyugkLvSdPYV5ijRRv81sbekUUQTi8C5sZGSd3EI1mibRbbW3YZUeZqtyIDBurgsISXOWFXoIt4bg71BmX1GRaFPBwT4LciIFpkI/1iUz3ICyNPSRo3Gtnt43ezW1GuJrkiVbDwRGIhHOYAF2lSLjyFDf9XWDEI57/Y6kaXS8g0MKskFZKIcRTVXSy54n9yjlyrC3cxZvh/1rAl62tjbktNMuIl3RxSmligpUGwEzF7UnzzqUB4MSihOdjRcL19M5+Op2g0/5QBeMDOELk3IKrPvDt7HFi/bazGmEx8yro/VUqc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(6862004)(41300700001)(54906003)(316002)(122000001)(44832011)(6636002)(2906002)(8936002)(66556008)(71200400001)(66446008)(64756008)(37006003)(4326008)(5660300002)(66476007)(4744005)(38070700005)(76116006)(53546011)(33656002)(478600001)(6486002)(91956017)(82960400001)(86362001)(107886003)(6512007)(83380400001)(6506007)(2616005)(8676002)(26005)(38100700002)(186003)(66946007)(66574015)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlJVdCtjNnNURDFueDhsL0xmdkZxTXRMaTc0U1A0clUrTmRiVE16RFkwcytl?=
 =?utf-8?B?QWhVK0dySXdaU1o1OWlKTjRwL0RIcjVDTFJFUkhFaUtVaFB4dFk1NzYyU3JZ?=
 =?utf-8?B?dlhweW1WbWdvQm1FNm5xVGduOExwT3NSV21HMGFHWkpwK0RONkUrdk1GdUlW?=
 =?utf-8?B?NXE5WVB2SmxoYUxhREQ0ZGJBaStDN0Q2RjVER2dEbkdVdHZtOGdLQWFXdU1V?=
 =?utf-8?B?aUpXVWpRZWtROGo0OENrRFBSVzhCSFluaXIyZWJtU2ZEc0h2dUpJdEJ6Z2xy?=
 =?utf-8?B?YVV3cDVOWUYwa25oT2I4VEVLSXlQZXN5QmorcVpnZlVjU0szc08xYXBQeUVO?=
 =?utf-8?B?K04zd0JiK2FHUUJNdzA2TmluNVZxU1g4VGV3ZnFQNHcvbE5DK3RNM0hBWVlI?=
 =?utf-8?B?T2ttblcybEhNSHFBdjN2WkNPSjBiQWIrZGl2cm9iYnhqelkyK1hxWlhwcmFu?=
 =?utf-8?B?QTFnelI0ZVpuaEc0NWhiZy9iS3dra3J4Z25KTTRtUlJvVWlEaC9FejMyMmR2?=
 =?utf-8?B?OFN5bU1SU25tdzdUd01KZnFSL1Z0NGtacHJGdVhERzZ3WTVtWTlvYWxwaUFS?=
 =?utf-8?B?ckpOVXhQNU4vVlBld0EyNUVXMHBIVmE0UTFUK09iMk1RTGdnTFVQODJrREpN?=
 =?utf-8?B?TU84cmdDQ3NoRXE0YUcyN1Rsb2lUb2paUGtlb0FzTUlCUFJGNUgvNlo0VSt4?=
 =?utf-8?B?L2FrMnFPenBiZHRFVzcxVkN0UG5xcHA3cW01cnJub0c5QmF3djdSbENnWnFK?=
 =?utf-8?B?Y2ZjeUliNjZldUtLQ1YzbWhMWkdPZ3F5T3Nodi9XbzFxN2ZKUHY1TEdzWGI0?=
 =?utf-8?B?djVVOGhHcGcybXJoblpqTEdoZGtORVhqMDJiblFtYndpT2VBV094b21iSHpW?=
 =?utf-8?B?ZWpTaU1rekJITDgzKzhRYW9laTJ6Q1dvSmFMRlBZdCtMc2ZmeU9rMlpsSjhT?=
 =?utf-8?B?VFVhRVFwRExoT1h0ZEJBd2dtd3lKM3VFcmgxSzF2MUlQdTNjbEs2KzBET1Fi?=
 =?utf-8?B?aGZRd3NucnR3bTI1K3duNEJONUJ6STRXVEQ4TEkrdUZEN1M3ZzBGT0RBdGtG?=
 =?utf-8?B?VFNUTmZvbEo5WEhHem1wcnFqM0RBbjZCNGUyK08rK0lHdlVFalZrdGptcnlp?=
 =?utf-8?B?Z003YjJsSjN0RlIzbEdObFpiVFd1THJ2K3dKSE1BZ3JRVlB1S1lsTG05cGg1?=
 =?utf-8?B?cGRjRDNwR2hpWTJRWjVPdnowbVJPZFFQZDREV2k4VTRYcTBrQ3R2VFdEOUxT?=
 =?utf-8?B?bytMNlRmMUtwS2VXYTJLaGQ1MWovU0kxRFhMOUtHOHpZQktZbnI1aUJRUUpl?=
 =?utf-8?B?VFVoaUtKbnllS1FIbjdNa2daOTZ2OEJ6Yy8vT3FFR0dvOWV5OHJhOG1DRzZB?=
 =?utf-8?B?NmQrWGlUSnZCYmExN2MzTEZaTzRoblJLaVRTVnFieWFQNEpiNDV3UUUyWW5I?=
 =?utf-8?B?NjY5NEgwajUyV0J1N1Z1eHJLQm4wUVFCd3FNeVNCNFU0YVFKU1hyZmZhelJi?=
 =?utf-8?B?WHRnNXlVdnY1bU0yWHhKeEZqcm54NFN6RWFuODlSakJsRjJ4TkYwaXlGTXhJ?=
 =?utf-8?B?SXM3YW4rL0Y3eW55WHRsL202ZHJoWGtvWVl1UDJpZENBZkxTbERwS1YwRk1B?=
 =?utf-8?B?bUVTQnFtREVaWnNSZ1R3SEJzRGNRZVlzMXlPeEZXcGR4dERhYTJSYWlsd3I2?=
 =?utf-8?B?M2hGZXZrai85blE5b3ZVZGVjTmpzTnFvUms5Y0F6OG9RR0k0VS9Cd2V0d0Nx?=
 =?utf-8?B?MjNrMVVhS3gyeHFKa2FienpLeEd5Rm9scGU0aHJvZy9WOE56UUJZZThQRk04?=
 =?utf-8?B?TDlHcDNlWWprekJEU01nQW54emMySk5PbW5FWnc3ekEzNGhINTJhWVl1SmhB?=
 =?utf-8?B?YjlRUU1KM3VxUDJ3TWVOajd1MlZQYU4xSGRLaWlYNEtRSzdhM2UrRjN2aFRT?=
 =?utf-8?B?SE8zMlVQSCtUNERUL1E5SlpUSlZWc01rdmJtbTB5SmhXMmFuZEt0OS9rVjli?=
 =?utf-8?B?SEo5TlovRm52eXllcHlMNi9yTXppZ2FPT1dCc1UyWlhzV1loQ2QrYm9DRW9E?=
 =?utf-8?B?TUNJUnJkc2VNbENiY2k5dFNvZEtiV2x5dlkzb3NSZmp2VGFySEE1ZUtvRmFy?=
 =?utf-8?B?M2NVQVE0ekladG9sdDdIZWkxSjRSZ0t4YlZDUGZ5SjNYcmJEZGhaRVdvUDZi?=
 =?utf-8?Q?fw6OV94cLIowoRQWSkC0w/E=3D?=
Content-Type: multipart/alternative;
	boundary="_000_891A255A70834495A9A5596BBE8842E7citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec88c4ee-27f2-4ad9-30ae-08dabe4968ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:46:12.4104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gL/8bEig+ps+MTwjk4IjnZD5tEiu7bwrMyo/txVXK45wOaxykO7Fczb6IaZnmvIF8xUElP/3LlvrRyuEMj/H8Lww33P6OMwRzoF/kd1lOmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6725

--_000_891A255A70834495A9A5596BBE8842E7citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDMgTm92IDIwMjIsIGF0IDE4OjQyLCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0Bj
aXRyaXguY29tPG1haWx0bzplZHZpbi50b3Jva0BjaXRyaXguY29tPj4gd3JvdGU6DQoNCkZpeGVz
OiBkYjQ3MTQwOGVkZDQ2ICJ0b29scy9vY2FtbC94ZW5zdG9yZWQ6IEZpeCBxdW90YSBieXBhc3Mg
b24gZG9tYWluIHNodXRkb3duIg0KDQpTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZp
bi50b3Jva0BjaXRyaXguY29tPG1haWx0bzplZHZpbi50b3Jva0BjaXRyaXguY29tPj4NCi0tLQ0K
dG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sIHwgMiArLQ0KMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGln
IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208bWFpbHRvOmNocmlzdGlhbi5saW5kaWdAY2l0
cml4LmNvbT4+DQoNCg==

--_000_891A255A70834495A9A5596BBE8842E7citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <20C5CCE45D0A6245B772F85258712581@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDMgTm92IDIwMjIsIGF0IDE4OjQyLCBFZHdpbiBUw7Zyw7ZrICZsdDs8YSBocmVmPSJtYWlsdG86
ZWR2aW4udG9yb2tAY2l0cml4LmNvbSIgY2xhc3M9IiI+ZWR2aW4udG9yb2tAY2l0cml4LmNvbTwv
YT4mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5l
Ij4NCjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7
IGZvbnQtZmFtaWx5OiBNZW5sby1SZWd1bGFyOyBmb250LXNpemU6IDExcHg7IGZvbnQtc3R5bGU6
IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0
dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7
IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6
IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5v
bmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPkZp
eGVzOg0KIGRiNDcxNDA4ZWRkNDYgJnF1b3Q7dG9vbHMvb2NhbWwveGVuc3RvcmVkOiBGaXggcXVv
dGEgYnlwYXNzIG9uIGRvbWFpbiBzaHV0ZG93biZxdW90Ozwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0
LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBNZW5sby1SZWd1bGFyOyBmb250LXNp
emU6IDExcHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsg
Zm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3Rh
cnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTog
bm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4
OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxiciBzdHlsZT0iY2FyZXQtY29s
b3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IE1lbmxvLVJlZ3VsYXI7IGZvbnQtc2l6ZTog
MTFweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250
LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsg
dGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3Jt
YWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRl
eHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9y
OiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBNZW5sby1SZWd1bGFyOyBmb250LXNpemU6IDEx
cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13
ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRl
eHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFs
OyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0
LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFu
dDsiIGNsYXNzPSIiPlNpZ25lZC1vZmYtYnk6DQogRWR3aW4gVMO2csO2ayAmbHQ7PC9zcGFuPjxh
IGhyZWY9Im1haWx0bzplZHZpbi50b3Jva0BjaXRyaXguY29tIiBzdHlsZT0iZm9udC1mYW1pbHk6
IE1lbmxvLVJlZ3VsYXI7IGZvbnQtc2l6ZTogMTFweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzog
bm9ybWFsOyBvcnBoYW5zOiBhdXRvOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogYXV0
bzsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zaXplLWFkanVzdDogYXV0bzsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyIgY2xhc3M9IiI+ZWR2aW4udG9yb2tAY2l0cml4
LmNvbTwvYT48c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1p
bHk6IE1lbmxvLVJlZ3VsYXI7IGZvbnQtc2l6ZTogMTFweDsgZm9udC1zdHlsZTogbm9ybWFsOyBm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2lu
Zzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFu
c2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Vi
a2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgZmxvYXQ6
IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+Jmd0Ozwvc3Bhbj48
YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBNZW5sby1S
ZWd1bGFyOyBmb250LXNpemU6IDExcHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50
LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsg
dGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25l
OyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFu
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogTWVubG8tUmVn
dWxhcjsgZm9udC1zaXplOiAxMXB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1j
YXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsg
d2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJv
a2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxh
eTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4tLS08L3NwYW4+PGJyIHN0eWxlPSJjYXJl
dC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogTWVubG8tUmVndWxhcjsgZm9udC1z
aXplOiAxMXB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7
IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0
YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6
IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQt
Y29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IE1lbmxvLVJlZ3VsYXI7IGZvbnQtc2l6
ZTogMTFweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBm
b250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFy
dDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBu
b3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7
IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1w
b3J0YW50OyIgY2xhc3M9IiI+dG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sDQogfCAyICst
PC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6
IE1lbmxvLVJlZ3VsYXI7IGZvbnQtc2l6ZTogMTFweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzog
bm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0
LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIi
Pg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBN
ZW5sby1SZWd1bGFyOyBmb250LXNpemU6IDExcHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12
YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5v
cm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3Jt
OiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10
ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25l
OyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPjENCiBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pPC9zcGFuPjwvZGl2Pg0KPC9ibG9ja3F1b3Rl
Pg0KPC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBzdHlsZT0ibWFy
Z2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDExcHg7IGxpbmUtaGVp
Z2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiBNZW5sbzsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9
ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPkFj
a2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnICZsdDs8YSBocmVmPSJtYWlsdG86Y2hyaXN0aWFuLmxp
bmRpZ0BjaXRyaXguY29tIiBjbGFzcz0iIj5jaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208L2E+
Jmd0Ozwvc3Bhbj48L2Rpdj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iZm9u
dC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlcyIgY2xhc3M9IiI+PGJyIGNs
YXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_891A255A70834495A9A5596BBE8842E7citrixcom_--

