Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C33490684
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258105.444109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Pp3-0004Wl-Pv; Mon, 17 Jan 2022 11:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258105.444109; Mon, 17 Jan 2022 11:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Pp3-0004Ua-Mg; Mon, 17 Jan 2022 11:05:13 +0000
Received: by outflank-mailman (input) for mailman id 258105;
 Mon, 17 Jan 2022 11:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHGG=SB=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1n9Pp1-0004UU-EY
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:05:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5482f919-7785-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 12:05:09 +0100 (CET)
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
X-Inumbo-ID: 5482f919-7785-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642417509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SlCsRUooNNaI5KVE5wRrRdgRQ/mD0PJpHLi1XoICSFI=;
  b=cnCrdR3F28m8XBu0e90V1QsjXo2az5V//4lHmQj+5PIs4+ZbNBNOTNTj
   5VR34noN/6w2NahMBvwge6NVmHCfcDZUskyrtRNdUZOMcuFDhTxn1PcSZ
   EibUz+nx2RqewJP+5l60QcaRBCO2yLONAc7ITrBoLc8lgDNN5Xmwrii0G
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 32dzvE535uf7MCDSzJ0w28+uHXI3IxlI04wGJY268HY1+FFajNLCwlnJqD9RdAx/ofEblnQVk1
 NRDDxIFrX80CuCgPyBkbvID2ExnWGTfJNE8epE5OkoNwLzOSMoq5msFsuQ1xkyCYk3yCOpawdT
 vVIDaUOAgPWjRZ3HhCr2IGJyBU7O3h89Ak4OF2dZT3DJX8rUCdktfrulCcAbQ33HxRkdpvkSeY
 ipVJxq9o3tyDxgkjiq81lr9j0//wFcv2IRQ+OJ3uK2f65jTanTFxOwlAyjVz+7M52UbKZTz991
 S1Riyo3nh9W0UJBt8KkaykEL
X-SBRS: 5.2
X-MesageID: 62546857
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dTfvP63K59uDbRHT1/bD5Yl3kn2cJEfYwER7XKvMYLTBsI5bp2BTm
 2EeWjuObPfYYGahL4twa9ng80pS75DcyNRqSQJkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrFh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhofBcj
 8lhlbuMW0QGYL/QqL4+VzZSOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EqckkNsbmeq8CvHVp1RnSDOo8QICFSKLPjTNd9Glq25wQTauBD
 yYfQQFRXD/EODt0AWUWWJ99xuiQ2CffTCIN/Tp5ooJoujOOnWSdyoPFOtfPZsaDQ8kTm0+Cv
 3/H5EzwGBRcP9uaoRKn3WirnfTnhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8ywqXD2cLTzlFafQ9qdQ7Azct0
 zehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqRwUJUA8E6NnLu5wog1TESdMLOKyoitz4Hxngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqbzi4+eKKFQLC6qneF/+pwdqWdYVOo6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 ReL4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUiwyiDAcollY
 P93lPpA615AU8yLKxLsFo8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lmPq
 IsPbJvWl0sPOAEbXsUx2dRORbztBSJqba0aVuQNLrLTSuaYMDxJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhiZ/Ca7ysvZ3X8ZnLNEPqb04pdYpH
 qZtRil1KqkVItgx025DPcCVQU0LXEnDuD9iyAL+MWdvJMAxFlWZkjImFyO2nBQz4uOMnZJWi
 5Wr1x/BQIpFQAJnDc3Mb+mowU/3tn8Y8N+elWOTSjWKUEmzooVsNQLrifo7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpESyTPVSmA79tOFec2sxLuvEfz7NVo1LuC
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCIupeiJS0RfORWImRdxFrotPdN32
 /olte4X9xe71kggPOGZg30G7G+LNHEBDfkq78lIHI/xhwM34VheepiAWDTu6ZSCZtgQYEknJ
 jiY2PjLi7hGnxeQdnMyET7G3PZHhIRIsxdPlQdQK1OMk9vDp/k2wBwOrmhnElULlk1Kg7BpJ
 2xmF0xpPqHfrT5nif9KU32oBwwcVgaS/Vb8ygdRmWDUJ6Vyurch8IHp1T6xwX0k
IronPort-HdrOrdr: A9a23:g7tw8KpDLkzr4MhEbeGTCvMaV5uPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhc4tKLzOWxFdAS7sSrLcKogeQVBEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjGzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2X6bRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs/uWsQSGqm16NnhqAg7E
 sD5RPoi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4akWSOlHklYavoMRiKoLzPKt
 MeR/00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQF++oWEV4rydSq8kc77mst
 6ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62546857"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeiGdvnzyriyDCOpfxqOJdoXB7nCyZh+QdzL6b8lQV1Cb4cztnZw3MEmFdov7ZPWFT6XalVhuDW1zYfmrUyLBA1Ypavkpl9kWEjSajdxZ7M5rZ0MEpY1a/3SLKmwv4sTYSohL19VvxVzuR8TkEKtEKG/GrWAQUbkfE8B28imFqT980eRxtCf4sMgzIRnYUIpWj8RZKpWcMWPKYjNNdr06yJB83ehoHtq40dAz9gFoDZGbE80cVF/bpJ3XUtxHfGkvUhfmZy5oWr8D+vdaNqnx78liE3OlIxxLRPDIO1NNQ3TWO3G1nceXJy5jdr3F95dudJQuZ8Xrxqx2OFQ0Q48Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlCsRUooNNaI5KVE5wRrRdgRQ/mD0PJpHLi1XoICSFI=;
 b=GkcW0POdofOcwTyMLMKPw8DRJiSFG5pr/KSaWdgvD1BrAYHABGChc6aDVas0Wa5JlVDsmW4/Rh28wrkItqyTV06UPTY8emBxnizBPFIyIyoEMeTfGWwouQs+b62fUZUGYYkZsqF3Owsw6ItSJsQCmitQJgsz8RfytBDOYiWzTmkO+9TjA0hCtPZd+yxpxLSEchz57gp7lGD/PG4WhrLEbjJtOHs97LL23tQ2iOBkrBN24B+TCxgjUWzOFQv8m41umGT8jHJZsW2gPs6Xp4foUbXkkdZWSBJtLMBFN6OiBtK67BWNjQCFDdvNdltJEujaAONkZpT4CTwjM49fks8C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlCsRUooNNaI5KVE5wRrRdgRQ/mD0PJpHLi1XoICSFI=;
 b=vWWEskIoSAhzpxF4Ccp0nqFrLfvNcbtiBkt/FKFgLhLa6gYZi1xnxE3182Eg+3b7f/LWNuPB4ig5ai7dRExqcA/f7lIIScAo12rnRujnxQwX2IRzAXVtGdhQZOhHep3iTyMOAKPeZH6o4NAUBiKJyqtgMstAKQU9u1GGjMToCxk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Dario Faggioli <dfaggioli@suse.com>, "julien@xen.org" <julien@xen.org>,
	Jan Beulich <JBeulich@suse.com>, Juergen Gross <JGross@suse.com>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: sched=null vwfi=native and call_rcu()
Thread-Topic: sched=null vwfi=native and call_rcu()
Thread-Index: AQHYApYKcBQAyeId3UeWzqXDNXhpe6xVueAAgAETSYCADBqGAIAAJu+AgAQQWoA=
Date: Mon, 17 Jan 2022 11:05:02 +0000
Message-ID: <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
 <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 324a573b-da74-4885-d9aa-08d9d9a935cc
x-ms-traffictypediagnostic: SN6PR03MB4351:EE_
x-microsoft-antispam-prvs: <SN6PR03MB43513CB72902E34E34682E0A99579@SN6PR03MB4351.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WmShd/KyB/SAwxbgSE3joYuR8WsrqCat1Gmuj9unvmKbq4LHzsWtmJz0DOsjD4Co0DfEhasdfe8GCOrO3H2YExrQpfM2r1HMDbIiDduOglqn/FriDhz2ew6Gcq+zNJN8loflAtIFA3GfgXXtSxWwEeQh/OSuhC3DxHEfRp/ruj4fkPT84Eu7Fhjf4YZKM7gSrBvzeW5v0RZj1KXjnjy95hl8mHWCiU0oa9TIMwgU8nl1HgamvNb0bEum+/QT3xzK2FCuYlPXoQwMnG8s2FyJBi/fiYKAC0FnPiHm6Ro2guSSh1psXoHYBnH37Ge5crOdR4I+JLr+bYuYO0Q1E14IpXIwYN14nPuRyUZ/7ZUVhT5XBDdb0Eztc+Iy3l8jtzNSmly59I9vTcV9b/oKLTTNmXVCSUZnGNea2MWLTALsP5aELoW7tMBB9Ng8xN2JILLdCwv9LDSk5qaB6z/APxs1guJ4bYjcXHW2fmbkKFTDx+7ToBuzA+Tg+Ys9Kb8l7+EcFs3ZgmBO6v9acqOpRRGrEJbQcNAtqr/6oH/rcOaN4nPx/LD+kOsQEQM1KduJIT48iDMmvOpHwAwjphvz0nSxDJFCNSVQq8cZwe7fgp4HRpxuDcYeHRyJhDs27Y3RX6Her/aTj7w7Q2wTfWQUvmLdCw9DRFaOmPQQLJ1qY8KLNhKj1hX0AES/rdnqLP6vxLua2dwQMmt5FqinmaG3nUTyIoodFtVkTFVepyvj0Paj5VBQFF9L3IJPeYN1szFNKhkBaooaVr2UyuB0Jih7BblWtdeTjM+poozOvB+lmLgo0d6RUD+LEL6LiFWqkRgfCtcT9t+0NoL3goWx45/NEtrT9ndfZ4n0Zy9lX4JMyt7WzQA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(966005)(8676002)(91956017)(6506007)(38100700002)(6486002)(8936002)(53546011)(122000001)(83380400001)(26005)(66476007)(66556008)(64756008)(66446008)(82960400001)(38070700005)(45080400002)(6916009)(2906002)(316002)(54906003)(86362001)(508600001)(5660300002)(4326008)(107886003)(2616005)(36756003)(33656002)(66946007)(76116006)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWFhT0g0UXRzZTZicW9PVy85MlVxNkxTcVZ2Ly9uZEJxd0t4c3VLZUduMEt2?=
 =?utf-8?B?U1pIT2RkUDNxYkNuVlJ4VGtoVjEzTzFPQ0FDQXVsRWVJREllOEFQMlkyVE4y?=
 =?utf-8?B?eEFCczdZaGhNNmRCZ0lHZFZTanhqbWp6SlZselNEdHh5dndmN2tuQThPZDNs?=
 =?utf-8?B?SWpsWm1DeWh5SDdHVTBPZnVXMjlJY0VUVlludUk5ZVJpR05CL093ODRBQUpy?=
 =?utf-8?B?VUZ4aDBXS3ppOW9DWWMxSmQ3MFZVbE1hTkdsRjdEYTNNVUJNeVRrWHlVL2Ji?=
 =?utf-8?B?UHhGVEFEYmNsMkI3ZXphYktNMHBMVEwxYXFnUndDOGg3QnNRUTdSRndzWERy?=
 =?utf-8?B?bzcwb09tcVVDWHJGTno3aWFyTzlsZkVrTXpaZEc0S0ZPRXZBSG1BNHhNTEtN?=
 =?utf-8?B?RFdDUDhmWVkraUI5UlYyWms1b3VuTkl5NkcrdnA2cGhoMnAxZjM1Y0RTSUFo?=
 =?utf-8?B?VW5Tc1BQSm9QQmkwbU9CQS80dlpPc0R1eUgwOVhuUzhNRDdlbDNFdUZUd0pE?=
 =?utf-8?B?WDFiZmtySXpXdVRFZDlkYXZYUmp0emRrZUVZYWFRNkdwQnc1YU1za09mNHVr?=
 =?utf-8?B?S0RLWmZwTGFMdXQrdG1PV2QxZVRRWGlmbERqMGRJTzIxZG5JYWt3MzVUWW14?=
 =?utf-8?B?UjR3QW5mRjZyK0ZNRm5TOUhCak1WT004MmhoTDI1Wkl3ZWI4d3U2cHoxY2Qw?=
 =?utf-8?B?enRrUWhGVjN3ZHJzTmhPd0FxVTE5eG5IYWZSRE1PblhvMFJjY3J3dTgyaElz?=
 =?utf-8?B?bmVJVVVxN281UGZDTmx4VmZGdkh6SS9oRHlhcXQ4Y1duVTdNYWVYU013a1hV?=
 =?utf-8?B?Z2xxWUV6QnFHaUZoZCtYUmJaNkNKOXJQVXFMUWM3UWRDUTlseWduS3JMWnJC?=
 =?utf-8?B?bXplRjlhODYzSlhGYnp5S1NoZHJJUExBSUoyWUdDK2ZESVpRdEdQTjRzbTh1?=
 =?utf-8?B?cDJYWTJ1TURGRXBlUkdFWHJISmRGcnl2K09hMHVPbGlVUmFQVWh1T1RSWnBy?=
 =?utf-8?B?NnZJM2YwUUhZNkxtNmp6VlJ4ZW9ZcHFqQ3J0SEpQcUNnTjcwYkE0MmsxVm1Z?=
 =?utf-8?B?N094SlZ2M0FiR1h1QUZwYUQ1N2lVU2l6blkzMytqZ0VUamtKOFAwU0ZUdy9n?=
 =?utf-8?B?RUFtUzRJQXBOUFk3dTZtMXB3M1JKYUpJcHJzaFJvRU5Md3BPM1lDTG9aYnR3?=
 =?utf-8?B?R0FrUDRpbFBSNWN6NWhnaVdJY0FNNVhHSHhETmh3cXMyUDFxRHBwTlNaY3RC?=
 =?utf-8?B?Nm1YdStPNy9qZkwxYjRqNWxjNVdyci8rZkxaSUhVZXUrK0RCZnprekpSdERw?=
 =?utf-8?B?dm9TTVkyUXFYRHJWaTRNYWVvSzV1N3ZjVW5iek12cXQ5UGlySTRmeGdJdTlG?=
 =?utf-8?B?Y1UrTmE5WE9wb2RBZmg2dWtBVTNHMnRoQ3lQSUt1akZ1U3NBSUovWElLSi9W?=
 =?utf-8?B?eExHbUduNW1ORWpoazBQVDVRMkhRWFd3RGV2OEc3cmxqQ0pabHVjemdLQlhS?=
 =?utf-8?B?S0RMSkc3c2oybHlEUnIzak9NcUZGakMydm91TkFMRHgxUytDb3VnK0VnTnBG?=
 =?utf-8?B?dEJOTjRtMVl6eVp3SW9tRG1STnpyNk1FRTI1TGZoUWs3cUZIWGpKTGxkYmxU?=
 =?utf-8?B?b2pvWnBGUGFnSytuaXVid29WYlBHMFZlQ0FlTzA4SWhVZ1Z1ZnJUV1VkRStS?=
 =?utf-8?B?enJWck5jbDNUMGQ3b2QrODJHUW8xUTg3eG5IZWd0Q1g1TmZoZW5YWno1dGR6?=
 =?utf-8?B?ZjNmWnpzZmJ2Q0psckVqL096eUFaWGI5Smd6cXg2S1g3VHJad0hueDZ4cE84?=
 =?utf-8?B?ODJnR3R1RVkwOUxha0JKTGtyWm5Sc3JwR0RoR2NpTG5tNithcHQyaUJKdFJL?=
 =?utf-8?B?Nno5cXpTRjBpaWo4MFRlUTFCTmtnalBrL21pTnpGRklxMEtSb0QwS3M5anN5?=
 =?utf-8?B?aXI1ZHNNM3JNVU4zYncvbG56Tms1VGZBcHpHcjBpQmUxQnVqMTlhbmwzdE1z?=
 =?utf-8?B?NzVONzAxa3laQU50SktqYllGT3lscTJCQi9WK2ZFV0NaZHh4UWJrUU9qODZI?=
 =?utf-8?B?SWZoL1pudFplSC84UU5YUTllSm1Sem5YSEtqSHNybWF0U0F2RkZnRThtWDNm?=
 =?utf-8?B?dVJ4a2FwUjhlUWlkR1ErMkg4eWNLNlUrTU8wQmdoT29jVHh6MmJJN2dsMnVn?=
 =?utf-8?B?cVVGSDg3Ky92Z0ZzNnczVGdPeExuMmN0M0dGc0t5Mm1mVHlWbFVpUHcxZkU1?=
 =?utf-8?Q?ko6tFForiMxmKT0dqWLmbBlt0OF5mdg7UmFO/tPihs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AFC98F84CF7E048ABD5A5BF7DFF614C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324a573b-da74-4885-d9aa-08d9d9a935cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 11:05:02.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXy5PFhCo4jeN5V+rIvlBMgrNPSV+ihoSD3ZURvYVij/8//kGZDbfzavzbHnr/kTh/2J+VqYTnrXiAhRaODlBvsi2HCIGjT2eHJ+bqrD228=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4351
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDE0LCAyMDIyLCBhdCA5OjAxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAxNCBKYW4gMjAyMiwg
RGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+PiBPbiBUaHUsIDIwMjItMDEtMDYgYXQgMTc6NTIgLTA4
MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBUaHUsIDYgSmFuIDIwMjIsIEp1
bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gDQo+Pj4+IFRoaXMgaXNzdWUgYW5kIHNvbHV0aW9uIHdl
cmUgZGlzY3Vzc2VkIG51bWVyb3VzIHRpbWUgb24gdGhlIE1MLiBJbg0KPj4+PiBzaG9ydCwgd2UN
Cj4+Pj4gd2FudCB0byB0ZWxsIHRoZSBSQ1UgdGhhdCBDUFUgcnVubmluZyBpbiBndWVzdCBjb250
ZXh0IGFyZSBhbHdheXMNCj4+Pj4gcXVpZXNjZWQuDQo+Pj4+IEZvciBtb3JlIGRldGFpbHMsIHlv
dSBjYW4gcmVhZCB0aGUgcHJldmlvdXMgdGhyZWFkICh3aGljaCBhbHNvDQo+Pj4+IGNvbnRhaW5z
IGEgbGluaw0KPj4+PiB0byB0aGUgb25lIGJlZm9yZSk6DQo+Pj4+IA0KPj4+PiBodHRwczovL25h
bTA0LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZs
b3JlLmtlcm5lbC5vcmclMkZ4ZW4tZGV2ZWwlMkZmZTNkZDlmMC1iMDM1LTAxZmUtM2UwMS1kZGYw
NjVmMTgyYWIlNDBjb2RpYXguc2UlMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q0dlb3JnZS5EdW5sYXAl
NDBjaXRyaXguY29tJTdDYjY3OTVlMGJlM2FmNDE2ODQxYTQwOGQ5ZDdhMTIwMzAlN0MzMzU4MzZk
ZTQyZWY0M2EyYjE0NTM0OGMyZWU5Y2E1YiU3QzAlN0MwJTdDNjM3Nzc3OTA5MzA1NTY2MzMwJTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJ
aUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPTklMkJvaUZm
ZEszckdBZVdGU05DUnU1YVN1WWdxbDFYWmNhR0pnVDNhUnNPQSUzRCZhbXA7cmVzZXJ2ZWQ9MA0K
Pj4+IA0KPj4+IFRoYW5rcyBKdWxpZW4gZm9yIHRoZSBwb2ludGVyIQ0KPj4+IA0KPj4+IERhcmlv
LCBJIGZvcndhcmQtcG9ydGVkIHlvdXIgdGhyZWUgcGF0Y2hlcyB0byBzdGFnaW5nOg0KPj4+IGh0
dHBzOi8vbmFtMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmdpdGxhYi5jb20lMkZ4ZW4tcHJvamVjdCUyRnBlb3BsZSUyRnNzdGFiZWxsaW5pJTJG
eGVuJTJGLSUyRnRyZWUlMkZyY3UtcXVpZXQmYW1wO2RhdGE9MDQlN0MwMSU3Q0dlb3JnZS5EdW5s
YXAlNDBjaXRyaXguY29tJTdDYjY3OTVlMGJlM2FmNDE2ODQxYTQwOGQ5ZDdhMTIwMzAlN0MzMzU4
MzZkZTQyZWY0M2EyYjE0NTM0OGMyZWU5Y2E1YiU3QzAlN0MwJTdDNjM3Nzc3OTA5MzA1NTY2MzMw
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPXZyTk41
S2d3WGo5M1pUaHJlSUROQjdVZ0tKZFBOeiUyQm9MOThiJTJGb29wTjh3JTNEJmFtcDtyZXNlcnZl
ZD0wDQo+Pj4gDQo+PiBIaSBTdGVmYW5vIQ0KPj4gDQo+PiBJIGRlZmluaXRlbHkgd291bGQgbGlr
ZSB0byBzZWUgdGhlIGVuZCBvZiB0aGlzIGlzc3VlLCBzbyB0aGFua3MgYSBsb3QNCj4+IGZvciB5
b3VyIGludGVyZXN0IGFuZCB5b3VyIGhlbHAgd2l0aCB0aGUgcGF0Y2hlcy4NCj4+IA0KPj4+IEkg
Y2FuIGNvbmZpcm0gdGhhdCB0aGV5IGZpeCB0aGUgYnVnLiBOb3RlIHRoYXQgSSBoYWQgdG8gYWRk
IGEgc21hbGwNCj4+PiBjaGFuZ2Ugb24gdG9wIHRvIHJlbW92ZSB0aGUgQVNTRVJUIGF0IHRoZSBi
ZWdpbm5pbmcgb2YNCj4+PiByY3VfcXVpZXRfZW50ZXI6DQo+Pj4gaHR0cHM6Ly9uYW0wNC5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0bGFiLmNv
bSUyRnhlbi1wcm9qZWN0JTJGcGVvcGxlJTJGc3N0YWJlbGxpbmklMkZ4ZW4lMkYtJTJGY29tbWl0
JTJGNmZjMDJiOTA4MTRkM2ZlNjMwNzE1ZTM1M2QxNmYzOTdhNWIyODBmOSZhbXA7ZGF0YT0wNCU3
QzAxJTdDR2VvcmdlLkR1bmxhcCU0MGNpdHJpeC5jb20lN0NiNjc5NWUwYmUzYWY0MTY4NDFhNDA4
ZDlkN2ExMjAzMCU3QzMzNTgzNmRlNDJlZjQzYTJiMTQ1MzQ4YzJlZTljYTViJTdDMCU3QzAlN0M2
Mzc3Nzc5MDkzMDU1NjYzMzAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAw
MCZhbXA7c2RhdGE9dmp4VDM1YiUyRmdscXp6QTREQ0xxVGpibzBiQWZPanRMY3ZOOTBPRnM4VTlR
JTNEJmFtcDtyZXNlcnZlZD0wDQo+Pj4gDQo+PiBZZWFoLCB0aGF0IHNob3VsZCBiZSBmaW5lLg0K
Pj4gDQo+Pj4gV291bGQgeW91IGJlIHVwIGZvciBzdWJtaXR0aW5nIHRoZW0gZm9yIHVwc3RyZWFt
aW5nPyBJIHdvdWxkIHByZWZlcg0KPj4+IGlmDQo+Pj4geW91IHNlbmQgb3V0IHRoZSBwYXRjaGVz
IGJlY2F1c2UgSSBjYW5ub3QgY2xhaW0gdG8gdW5kZXJzdGFuZCB0aGVtDQo+Pj4gY29tcGxldGVs
eSAoZXhjZXB0IGZvciB0aGUgb25lIGRvaW5nIHJlbmFtaW5nIDotUCApDQo+Pj4gDQo+PiBIYWhh
ISBTbywgSSBhbSB1cCBmb3IgcHJvcGVybHkgc3VibWl0dGluZywgYnV0IHRoZXJlJ3Mgb25lIHBy
b2JsZW0uIEFzDQo+PiB5b3UndmUgcHJvYmFibHkgZ290LCB0aGUgaWRlYSBoZXJlIGlzIHRvIHVz
ZSB0cmFuc2l0aW9ucyB0b3dhcmQgdGhlDQo+PiBndWVzdCBhbmQgaW5zaWRlIHRoZSBoeXBlcnZp
c29yIGFzIFJDVSBxdWllc2NlbmNlIGFuZCAiYWN0aXZhdGlvbiINCj4+IHBvaW50cy4NCj4+IA0K
Pj4gTm93LCBvbiBBUk0sIHRoYXQganVzdCBtZWFudCBjYWxsaW5nIHJjdV9xdWlldF9leGl0KCkg
aW4NCj4+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCgpIGFuZCBjYWxsaW5nIHJjdV9xdWll
dF9lbnRlcigpIGluDQo+PiBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0KCkuIE5pY2UgYW5kIGVh
c3ksIGFuZCBldmVuIG15c2VsZiAtLWFuZCBJJ20NCj4+IGRlZmluaXRlbHkgbm90IGFuIEFSTSBw
ZXJzb24tLSBjbG91ZCB1bmRlcnN0YW5kIGl0IChhbHRob3VnaCB3aXRoIHNvbWUNCj4+IGhlbHAg
ZnJvbSBKdWxpZW4pIGFuZCBwdXQgdGhlIHBhdGNoZXMgdG9nZXRoZXIuDQo+PiANCj4+IEhvd2V2
ZXIsIHRoZSBwcm9ibGVtIGlzIHJlYWxseSBhcmNoIGluZGVwZW5kZW50IGFuZCwgZGVzcGl0ZSBu
b3QNCj4+IHN1cmZhY2luZyBlcXVhbGx5IGZyZXF1ZW50bHksIGl0IGFmZmVjdHMgeDg2IGFzIHdl
bGwuIEFuZCBmb3IgeDg2IHRoZQ0KPj4gc2l0dWF0aW9uIGlzIGJ5IGZhciBub3QgZXF1YWxseSBu
aWNlLCB3aGVuIGl0IGNvbWVzIHRvIGlkZW50aWZ5aW5nIGFsbA0KPj4gdGhlIHBsYWNlcyBmcm9t
IHdoZXJlIHRvIGNhbGwgcmN1X3F1aWV0X3tlbnRlcixleGl0fSgpLg0KPj4gDQo+PiBBbmQgZmlu
ZGluZyBvdXQgd2hlcmUgdG8gcHV0IHRoZW0sIGFtb25nIHRoZSB2YXJpb3VzIGZ1bmN0aW9ucyB0
aGF0IHdlDQo+PiBoYXZlIGluIHRoZSB2YXJpb3VzIGVudHJ5LlMgdmFyaWFudHMgaXMgd2hlcmUg
SSBzdG9wcGVkLiBUaGUgcGxhbiB3YXMNCj4+IHRvIGdldCBiYWNrIHRvIGl0LCBidXQgYXMgc2hh
bWVmdWxseSBhcyBpdCBzb3VuZHMsIEkgY291bGQgbm90IGRvIHRoYXQNCj4+IHlldC4NCj4+IA0K
Pj4gU28sIGlmIGFueW9uZSB3YW50cyB0byBoZWxwIHdpdGggdGhpcywgaGFuZGluZyBvdmVyIHN1
Z2dlc3Rpb25zIGZvcg0KPj4gcG90ZW50aWFsIGdvb2Qgc3BvdHMsIHRoYXQgd291bGQgaGVscCBh
IGxvdC4NCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSBjYW5ub3Qgdm9sdW50ZWVyIGR1ZSB0byB0aW1l
IGFuZCBhbHNvIGJlY2F1c2UgSSB3b3VsZG4ndA0KPiBrbm93IHdoZXJlIHRvIGxvb2sgYW5kIEkg
ZG9uJ3QgaGF2ZSBhIHJlcHJvZHVjZXIgb3IgYSB0ZXN0IGVudmlyb25tZW50DQo+IG9uIHg4Ni4g
SSB3b3VsZCBiZSBmbHlpbmcgYmxpbmQuDQo+IA0KPiANCj4+IEFsdGVybmF0aXZlbHksIHdlIGNh
biBzdWJtaXQgdGhlIHNlcmllcyBhcyBBUk0tb25seS4uLiBCdXQgSSBmZWFyIHRoYXQNCj4+IHRo
ZSB4ODYgc2lkZSBvZiB0aGluZ3Mgd291bGQgdGhlbiBiZSBlYXNpbHkgZm9yZ290dGVuLiA6LSgN
Cj4gDQo+IEkgYWdyZWUgd2l0aCB5b3Ugb24gdGhpcywgYnV0IGF0IHRoZSBzYW1lIHRpbWUgd2Ug
YXJlIGhhdmluZyBwcm9ibGVtcw0KPiB3aXRoIGN1c3RvbWVycyBpbiB0aGUgZmllbGQgLS0gaXQg
aXMgbm90IGxpa2Ugd2UgY2FuIHdhaXQgdG8gc29sdmUgdGhlDQo+IHByb2JsZW0gb24gQVJNIGFu
eSBsb25nZXIuIEFuZCB0aGUgaXNzdWUgaXMgY2VydGFpbmx5IGZhciBsZXNzIGxpa2VseSB0bw0K
PiBoYXBwZW4gb24geDg2ICh0aGVyZSBpcyBubyB2d2ZpPW5hdGl2ZSwgcmlnaHQ/KSBJbiBvdGhl
ciB3b3JkcywgSSB0aGluaw0KPiBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSBoYWxmIG9mIHRoZSBzb2x1
dGlvbiBub3cgdG8gc29sdmUgdGhlIHdvcnN0IHBhcnQgb2YNCj4gdGhlIHByb2JsZW0gdGhhbiB0
byB3YWl0IG1vcmUgbW9udGhzIGZvciBhIGZ1bGwgc29sdXRpb24uDQoNCkFuIHg4NiBlcXVpdmFs
ZW50IG9mIHZ3Zmk9bmF0aXZlIGNvdWxkIGJlIGltcGxlbWVudGVkIGVhc2lseSwgYnV0IEFGQUlL
IG5vYm9keSBoYXMgYXNrZWQgZm9yIGl0IHlldC4gIEkgYWdyZWUgdGhhdCB3ZSBuZWVkIHRvIGZp
eCBpZiBmb3IgQVJNLCBhbmQgc28gaW4gdGhlIGFic2VuY2Ugb2Ygc29tZW9uZSB3aXRoIHRoZSB0
aW1lIHRvIGZpeCB1cCB0aGUgeDg2IHNpZGUsIEkgdGhpbmsgZml4aW5nIEFSTS1vbmx5IGlzIHRo
ZSB3YXkgdG8gZ28uDQoNCkl0IHdvdWxkIGJlIGdvb2QgaWYgd2UgY291bGQgYWRkIGFwcHJvcHJp
YXRlIGNvbW1lbnRzIHdhcm5pbmcgYW55b25lIHdobyBpbXBsZW1lbnRzIGBobHQ9bmF0aXZlYCBv
biB4ODYgdGhlIHByb2JsZW1zIHRoZXnigJlsbCBmYWNlIGFuZCBob3cgdG8gZml4IHRoZW0uICBO
b3Qgc3VyZSB0aGUgYmVzdCBwbGFjZSB0byBkbyB0aGF0OyBpbiB0aGUgVk1YIC8gU1ZNIGNvZGUg
dGhhdCBzZXRzIHRoZSBleGl0IGZvciBITFQgJmM/DQoNCiAtR2VvcmdlDQoNCg==

