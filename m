Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3851F73E
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 10:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324298.546278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnz5K-0005n2-8v; Mon, 09 May 2022 08:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324298.546278; Mon, 09 May 2022 08:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnz5K-0005kM-5B; Mon, 09 May 2022 08:49:42 +0000
Received: by outflank-mailman (input) for mailman id 324298;
 Mon, 09 May 2022 08:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P+Fb=VR=citrix.com=prvs=1211c9f53=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nnz5I-0005kA-0s
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 08:49:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a02bfb-cf74-11ec-a406-831a346695d4;
 Mon, 09 May 2022 10:49:36 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 04:49:34 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by DS7PR03MB5589.namprd03.prod.outlook.com (2603:10b6:5:2cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 08:49:31 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:49:27 +0000
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
X-Inumbo-ID: f3a02bfb-cf74-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652086176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uBL5yez/gVKzNfigMX7hU1FYTJ3y+nnpEpqMg/3heoU=;
  b=Yl/EEVEOkLc5hnCt9RtpGuzoEqrHuWYsN5bh5Qlw5AaN94yqSWSJOH81
   /180wJYQ5Bo5ThqtAm+yuq0BDwWU0iwkzOFtQIAdCiSj1h0LGuz+FXUzj
   Kn9Z12qWwOsB1KRaR5Rdo7PlLPYwVmEVNVlKPsG0TSEa5s53dTHIPRMWR
   c=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 70255539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jJiCuK6lwbY2nWjdV0oovwxRtCnGchMFZxGqfqrLsTDasY5as4F+v
 mdNXm7VMv7bamfweo8kao20oRlXvJKAmtQwGQJlpH0zHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhU1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSfFwd2JanVodgzdBBqKxh5IZRJ263+dC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YHgV/chegXdRraT
 9AeciEpaB3PbgdQM1MTIJk/gP2plj/0dDgwRFe9+vJtvjWOl10ZPL7FKIbnStmQW8Nsh1uWh
 X//wkfQH0E1K4nKodaC2jf27gPVpgvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGhg1O6c8JSL
 QoT4CVGhbE/8VHuQtTjUhmQpnmCsRgBHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbQGDq5WQQHOZs7uR8zW7PHFPKXdYPHBZCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:76KOMaqbWHst+WCxiVtzBIIaV5uJL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7EZnirhILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wfnbimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.91,210,1647316800"; 
   d="scan'208";a="70255539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJkskl2140nx0g+xpTb3DoMZmEtsE5jKZwF49iaNbK/IONOutmf5xIobN7L32p1BgwG7sLyQwEQ3ARW8K2wTIbr1FBfCVhnOUn2/4R2hC0BzBt09dF/X4ePCJhgsZtc5ZROlaehH/IEwIZ8yIBwD0KBtzskZgvsMxzjzWyrd8ok/xJCbUvmuYhya3ifjib2SJy8iWDGit2aXiBK7XwhKNjGZLCT/uo2e1lJdMxw4oxQTwLsVSlIWusIo55JcMOkgUDpMtZOQqMTd/s1Lm0k56rTULHc38o3bPdvVBgsrDTj5sgG+7gH/H3CIjogErMnuLLxg6xaLjih6ylup9nXlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4ffbgMF998iVYrdqam9WmKjOZmFHBmdRCUa7te/1mg=;
 b=UPoKsn4i66vfpa/vggpxrPA397sN04otXmzcFJSiyxxLqEC2/GVRxQGUZbWaD7Xqu14GuWapM+OFUhoCz8K/JBngqdhuMGL27+70LNN/hnJPlqJmcn7vHWnuMnjhXKWBm1FOBmzb5J3Xdu5x0dcACYauiU4hmo4lP9kHAaW0TopafBKiT3uJkO7i/mAWXCAJfRHb/AmDigpDkqo54OAho6Xcj8bGEuM63/4Q28Qj7AS3r/D4EhYoj0HkGlhNBCX6SQIeGhRfQkgU14t6xY0n/L+sr01cBNJNLc0h3HY3WWfHs1wpXZlUWlKyJUnlLbmZydH88+MqEPjFJgEcVyM39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4ffbgMF998iVYrdqam9WmKjOZmFHBmdRCUa7te/1mg=;
 b=ciurISsqP6uhzcR127G1qvuyIXPCCDcvW2syruIUmCdQ7pXDyb88lAuRxuxqGvWzR2SN1mbTC/q7TyIt/lyWcahBobiDbQ2XcHIH0az+DvPFeeHR0bPPgfNiHUNiUjPlv0U+IRIRrRThe+IJezg6VD1e7sJCnQ6MRtK8s/xbGmk=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Topic: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Index: AQHYWlVI6k4vzeGas0CbAgtnJ0rrZq0WTf75
Date: Mon, 9 May 2022 08:49:25 +0000
Message-ID:
 <PH0PR03MB6382FD47D06EBD58079775B2F0C69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
In-Reply-To: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20355d79-b671-45b0-83aa-08da3198d24d
x-ms-traffictypediagnostic: DS7PR03MB5589:EE_
x-microsoft-antispam-prvs:
 <DS7PR03MB5589B23118F8B6DDF077A1A1F0C69@DS7PR03MB5589.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 E0suAd6mbsUVhtq8x0l3LqvQTcKkMGBXoXTah3T7Awzd19M+SHIlmva0y+oSlL4Tgzib1tNYCijReX6L/VuHLZvGfLiUSrIQHCdfHWLTq+u4CcL0xyQyPy9asNn2G/Z4xpkjT8JQBya6/dki9cw/z5UOqM5K+tpkBh388Uh8IVJCD5b3DrOaqf1oy7FtvYYcmkpzpjnMJRWrneGlmsG76t/7LnbmljZDg3PrdUiPJm/jiFP2z2MFCjHKpVCgvMkLl9iZ31lioVqaBONPFKv2lU3R54oMtOel7G71cEA5Ij0++IS/A4WyWhUXnfU+7KgmT2Hy2LwVgalTDGTSQug25/1zw+IPMOCTb57kS6yWdUERz/3fx4cq87YXiYRoy9T4AMoVpV5OEyPW0noDVPQWJry8BuLMNFQfN/0zsPMVq77YJd1fYP7r3N5vrGt2fPt1Un8O8cMJuIaZypKkEfWijY62cKyMdILaXYv1I49QRl/+7xelQQW46IR2wbfphBep9urwV0z24qyE4WObnTbS18YCIhKyIMtF1g4BeQ71oDUMynOtaZdSuuHzh//tzTS7l6qnB3l5B5QZq1JD+qtSu+GX7ygJMjADdO+4Ii7EhHXO0nrZ92fF3dvlIjb6rnThjIgXYy/6QJg394FpGTuXK+lR5AeWl2skVX7GJPI/CIBXbe4rIDFoeaq6EeK98NNAdFULX6LGb/CUdPxG/ad6WA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(64756008)(66946007)(9686003)(71200400001)(26005)(66476007)(53546011)(91956017)(38100700002)(76116006)(38070700005)(4326008)(8676002)(86362001)(66446008)(33656002)(44832011)(52536014)(5660300002)(8936002)(30864003)(508600001)(7696005)(2906002)(110136005)(122000001)(54906003)(55016003)(316002)(82960400001)(83380400001)(186003)(6506007)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5NUvKspv3QgEKqxR+mz163/RjWb2oRo7uaWuqWMeVXXC/4nQ13Nl7Yt5K8?=
 =?iso-8859-1?Q?oFcpz+VErDkAA/RJavPNrAtvA0M/zEZwHFGcgnbEedE+3jsrgaHMFbImgf?=
 =?iso-8859-1?Q?JXfjYUbmNpJXBwh/FXSByc9iz5/E4E61mWVBezuiK8TB57/DZ36zX8x71g?=
 =?iso-8859-1?Q?Y0gT+wv3wpe3XOi9/H0mPkvbnkJ8x/n9vaWbTXrymEhcN9/wlRdnMBBLIJ?=
 =?iso-8859-1?Q?6H3EJDQl77ioj3SQhmPQU0DrdP9RN0h8zCQ/L6JBY6/3JO2iWbuXOcPEzr?=
 =?iso-8859-1?Q?aSNBFFBAZuwfhVLBn3n3ZqDMZsIqBwqLfcL2Q+LW9iSSUnzF60tZSY5d5X?=
 =?iso-8859-1?Q?Eouaiw+uQaQvquxneYTEMF5jfpw/aQBLD8ighhSod037T4bSzpdEmREglm?=
 =?iso-8859-1?Q?bLQmEtsvhOLsv/KHwbXrw9oPH1aIQKRyQLu/g2FY4V7qBJRlX6hcNXLKt5?=
 =?iso-8859-1?Q?ByODxc3XA82pBpd/SNQmzC9MQ2LoC85E/jqiKgxQKMb6q/ehzRpOuUMkkI?=
 =?iso-8859-1?Q?BZPfn6UffUqyX5PQE8KStsmNzIiR/V6VdSy2FI539ry9TgAySaOuTggS9M?=
 =?iso-8859-1?Q?cxaQMAdIqA+Ji0uj9MML50M+V7XWDLSKC2ZujG9LDR8t3XcpXJsQcKN6Gv?=
 =?iso-8859-1?Q?gktPnn4isFvsRkQFqJe9A/T9zYznlEAonrTlgAGavayref4xDmJwpoqj36?=
 =?iso-8859-1?Q?jg/L2Ea4Rq+jmfF1Z3pbO6eedKhiViu8FlGUesSYk4yHwatucVw+oa5fdj?=
 =?iso-8859-1?Q?eUpd4H3TR1UO5cNl/nQeRyosBNTUHj+Atqip8xNUKOaUo/oZMIr57mxFwT?=
 =?iso-8859-1?Q?Hd2zWIF5uADvnPbS3RE7bNxR5ZQZXJjJat8z9snOYxzM6lIW8MxlM9NiEL?=
 =?iso-8859-1?Q?USiF8l2EhG1ZttjxcWWEDKKKD8kgTWgXNxiahivEMwwPLl98b8Pps56j5u?=
 =?iso-8859-1?Q?5yFirZQ5rZL/kiMRvPDhq+SYZ9SSO16OepeHtPZ5gZsLEwSll3JUzAgDa3?=
 =?iso-8859-1?Q?XW4yr/cJtKpsIp/hS5l6c/js2WVlsFlBYNs3XXky8G7nGfaQVlYdbDF1S6?=
 =?iso-8859-1?Q?l1fSlEtRXhs3hMPNCmtJOJ8qbVnrP1lS8YV8czbQpcCZXQMPMG9q1GTsYa?=
 =?iso-8859-1?Q?IL6ROPokVOVFWvcdG6gcq7hGIZ9R9bFU1oM4YqVTTX6D7kbwtwnzZLVmmi?=
 =?iso-8859-1?Q?5q7u5iT0CnZCt3UBlZkmnmbNJV2iZWObK207RUAlY8E3bopi5qQEM83puG?=
 =?iso-8859-1?Q?k8++R2J+GfGn8OesxZbAe481OMtRA7taPw4RVw0GT0jjA1dwloqqV+jkxt?=
 =?iso-8859-1?Q?KAaaaiaAbpY7wDO6SDAQSHeNU+l7qgotbl+fwlS04RXBplX7w34rbcUnCa?=
 =?iso-8859-1?Q?p45Nx3YHbvMQHkok5VE8rOwcUeF4Sm1OQAwfl1f5KJaI5u1zDPI+KhbZjC?=
 =?iso-8859-1?Q?jCRoUeSjkBgeQJSnvFjOxV5ig9FaeL7gFuJ82gFJHA+nIKajv9ZqdabN90?=
 =?iso-8859-1?Q?HWWKhfSwF4I1Z28+EIU2PEz6VP+MgPOpkqGgMo59W8mU32hUZiQgfmKIdx?=
 =?iso-8859-1?Q?gLi9d9rPGEOfvSckkWtGKjjGESU3lDPpuTEyxsvps52kmBoqQXPCJ5vsRJ?=
 =?iso-8859-1?Q?Ogq2EGbJbJi1/3ZEniCdiATsiKehaRnDPEGb6OJeiAFrvSC+ICDbIyIdnD?=
 =?iso-8859-1?Q?s76PHIDHmw2AvM8l0bt5MXhDGv8iKkqHxgShXfceMMQjtM1u1+KIxKRx5Q?=
 =?iso-8859-1?Q?NAIU/vbj1lJADYo1v0ZoSIWPOJATKL8edVqXcgQWRdmM4+cHie526dKbHx?=
 =?iso-8859-1?Q?yU/IRrYj0l6zPXuh/CsfVGr+djLl3lE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20355d79-b671-45b0-83aa-08da3198d24d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:49:25.6151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VrMOW0jcdCt6tFZsQgJ9MwmJ7f29EOpYTxPS8ZgtTc0MkFqZAR+2B8HJeJTduHIz+QbPsLWdPUXjImQmUTTjG3JMMmk/5OoQshiTyy12LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5589

Ping?=0A=
=0A=
> From: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Sent: Wednesday, April 27, 2022 5:38 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.=
perard@citrix.com>; Paul Durrant <paul@xen.org>; qemu-devel@nongnu.org <qem=
u-devel@nongnu.org>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH] xen/pt: Avoid initializing BARs from the host ones =0A=
>  =0A=
> The BAR emulated register definition does not set emu_mask because it=0A=
> varies depending on bar_flag.  If emu_mask is not set, then the BAR is=0A=
> initialized based on the host value which causes the BAR to be initially=
=0A=
> mapped at whatever value the host device was using. Although it does=0A=
> eventually get mapped at the correct location, it causes unnecessary=0A=
> mapping/unmappings.=0A=
> =0A=
> To fix this, initialize a per-register emu_mask in XenPTReg from the=0A=
> initial value in XenPTRegInfo and then let the register's init() function=
=0A=
> set/modify the emu_mask if necessary. Update the code to use emu_mask=0A=
> in XenPTReg consistently and rename the existing emu_mask in=0A=
> XenPTRegInfo to emu_mask_init to help with refactoring.=0A=
> =0A=
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> ---=0A=
>  hw/xen/xen_pt.c             |   2 +-=0A=
>  hw/xen/xen_pt.h             |   5 +-=0A=
>  hw/xen/xen_pt_config_init.c | 221 ++++++++++++++++++------------------=
=0A=
>  3 files changed, 115 insertions(+), 113 deletions(-)=0A=
> =0A=
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c=0A=
> index 027190fa44..f0af1cfcec 100644=0A=
> --- a/hw/xen/xen_pt.c=0A=
> +++ b/hw/xen/xen_pt.c=0A=
> @@ -327,7 +327,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uin=
t32_t addr,=0A=
>              uint32_t real_offset =3D reg_grp_entry->base_offset + reg->o=
ffset;=0A=
>              uint32_t valid_mask =3D 0xFFFFFFFF >> ((4 - emul_len) << 3);=
=0A=
>              uint8_t *ptr_val =3D NULL;=0A=
> -            uint32_t wp_mask =3D reg->emu_mask | reg->ro_mask;=0A=
> +            uint32_t wp_mask =3D reg_entry->emu_mask | reg->ro_mask;=0A=
>  =0A=
>              valid_mask <<=3D (find_addr - real_offset) << 3;=0A=
>              ptr_val =3D (uint8_t *)&val + (real_offset & 3);=0A=
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h=0A=
> index 6b8e13cdee..dbb917a46c 100644=0A=
> --- a/hw/xen/xen_pt.h=0A=
> +++ b/hw/xen/xen_pt.h=0A=
> @@ -46,7 +46,7 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint=
32_t val);=0A=
>  =0A=
>  /* function type for config reg */=0A=
>  typedef int (*xen_pt_conf_reg_init)=0A=
> -    (XenPCIPassthroughState *, XenPTRegInfo *, uint32_t real_offset,=0A=
> +    (XenPCIPassthroughState *, XenPTReg *, uint32_t real_offset,=0A=
>       uint32_t *data);=0A=
>  typedef int (*xen_pt_conf_dword_write)=0A=
>      (XenPCIPassthroughState *, XenPTReg *cfg_entry,=0A=
> @@ -117,7 +117,7 @@ struct XenPTRegInfo {=0A=
>      /* reg read/write-1-clear field mask (ON:RW1C/RW1CS, OFF:other) */=
=0A=
>      uint32_t rw1c_mask;=0A=
>      /* reg emulate field mask (ON:emu, OFF:passthrough) */=0A=
> -    uint32_t emu_mask;=0A=
> +    uint32_t emu_mask_init;=0A=
>      xen_pt_conf_reg_init init;=0A=
>      /* read/write function pointer=0A=
>       * for double_word/word/byte size */=0A=
> @@ -146,6 +146,7 @@ struct XenPTReg {=0A=
>          uint16_t *half_word;=0A=
>          uint32_t *word;=0A=
>      } ptr; /* pointer to dev.config. */=0A=
> +    uint32_t emu_mask;=0A=
>  };=0A=
>  =0A=
>  typedef const struct XenPTRegGroupInfo XenPTRegGroupInfo;=0A=
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c=0A=
> index c5c4e943a8..2a934494ed 100644=0A=
> --- a/hw/xen/xen_pt_config_init.c=0A=
> +++ b/hw/xen/xen_pt_config_init.c=0A=
> @@ -25,7 +25,7 @@=0A=
>  =0A=
>  /* prototype */=0A=
>  =0A=
> -static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *=
reg,=0A=
> +static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTReg *reg_=
entry,=0A=
>                                 uint32_t real_offset, uint32_t *data);=0A=
>  =0A=
>  =0A=
> @@ -98,9 +98,10 @@ XenPTReg *xen_pt_find_reg(XenPTRegGroup *reg_grp, uint=
32_t address)=0A=
>  }=0A=
>  =0A=
>  static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,=0A=
> -                                     XenPTRegInfo *reg, uint32_t valid_m=
ask)=0A=
> +                                     XenPTReg *reg_entry, uint32_t valid=
_mask)=0A=
>  {=0A=
> -    uint32_t throughable_mask =3D ~(reg->emu_mask | reg->ro_mask);=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
> +    uint32_t throughable_mask =3D ~(reg_entry->emu_mask | reg->ro_mask);=
=0A=
>  =0A=
>      if (!s->permissive) {=0A=
>          throughable_mask &=3D ~reg->res_mask;=0A=
> @@ -116,10 +117,10 @@ static uint32_t get_throughable_mask(const XenPCIPa=
ssthroughState *s,=0A=
>  /* register initialization function */=0A=
>  =0A=
>  static int xen_pt_common_reg_init(XenPCIPassthroughState *s,=0A=
> -                                  XenPTRegInfo *reg, uint32_t real_offse=
t,=0A=
> +                                  XenPTReg *reg_entry, uint32_t real_off=
set,=0A=
>                                    uint32_t *data)=0A=
>  {=0A=
> -    *data =3D reg->init_val;=0A=
> +    *data =3D reg_entry->reg->init_val;=0A=
>      return 0;=0A=
>  }=0A=
>  =0A=
> @@ -128,12 +129,11 @@ static int xen_pt_common_reg_init(XenPCIPassthrough=
State *s,=0A=
>  static int xen_pt_byte_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg=
_entry,=0A=
>                                  uint8_t *value, uint8_t valid_mask)=0A=
>  {=0A=
> -    XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint8_t valid_emu_mask =3D 0;=0A=
>      uint8_t *data =3D cfg_entry->ptr.byte;=0A=
>  =0A=
>      /* emulate byte register */=0A=
> -    valid_emu_mask =3D reg->emu_mask & valid_mask;=0A=
> +    valid_emu_mask =3D cfg_entry->emu_mask & valid_mask;=0A=
>      *value =3D XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);=0A=
>  =0A=
>      return 0;=0A=
> @@ -141,12 +141,11 @@ static int xen_pt_byte_reg_read(XenPCIPassthroughSt=
ate *s, XenPTReg *cfg_entry,=0A=
>  static int xen_pt_word_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg=
_entry,=0A=
>                                  uint16_t *value, uint16_t valid_mask)=0A=
>  {=0A=
> -    XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint16_t valid_emu_mask =3D 0;=0A=
>      uint16_t *data =3D cfg_entry->ptr.half_word;=0A=
>  =0A=
>      /* emulate word register */=0A=
> -    valid_emu_mask =3D reg->emu_mask & valid_mask;=0A=
> +    valid_emu_mask =3D cfg_entry->emu_mask & valid_mask;=0A=
>      *value =3D XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);=0A=
>  =0A=
>      return 0;=0A=
> @@ -154,12 +153,11 @@ static int xen_pt_word_reg_read(XenPCIPassthroughSt=
ate *s, XenPTReg *cfg_entry,=0A=
>  static int xen_pt_long_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg=
_entry,=0A=
>                                  uint32_t *value, uint32_t valid_mask)=0A=
>  {=0A=
> -    XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint32_t valid_emu_mask =3D 0;=0A=
>      uint32_t *data =3D cfg_entry->ptr.word;=0A=
>  =0A=
>      /* emulate long register */=0A=
> -    valid_emu_mask =3D reg->emu_mask & valid_mask;=0A=
> +    valid_emu_mask =3D cfg_entry->emu_mask & valid_mask;=0A=
>      *value =3D XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);=0A=
>  =0A=
>      return 0;=0A=
> @@ -173,11 +171,11 @@ static int xen_pt_byte_reg_write(XenPCIPassthroughS=
tate *s, XenPTReg *cfg_entry,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint8_t writable_mask =3D 0;=0A=
> -    uint8_t throughable_mask =3D get_throughable_mask(s, reg, valid_mask=
);=0A=
> +    uint8_t throughable_mask =3D get_throughable_mask(s, cfg_entry, vali=
d_mask);=0A=
>      uint8_t *data =3D cfg_entry->ptr.byte;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>  =0A=
>      /* create value for writing to I/O device register */=0A=
> @@ -192,11 +190,11 @@ static int xen_pt_word_reg_write(XenPCIPassthroughS=
tate *s, XenPTReg *cfg_entry,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint16_t writable_mask =3D 0;=0A=
> -    uint16_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint16_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      uint16_t *data =3D cfg_entry->ptr.half_word;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>  =0A=
>      /* create value for writing to I/O device register */=0A=
> @@ -211,11 +209,11 @@ static int xen_pt_long_reg_write(XenPCIPassthroughS=
tate *s, XenPTReg *cfg_entry,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint32_t writable_mask =3D 0;=0A=
> -    uint32_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint32_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      uint32_t *data =3D cfg_entry->ptr.word;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>  =0A=
>      /* create value for writing to I/O device register */=0A=
> @@ -229,7 +227,7 @@ static int xen_pt_long_reg_write(XenPCIPassthroughSta=
te *s, XenPTReg *cfg_entry,=0A=
>  /* XenPTRegInfo declaration=0A=
>   * - only for emulated register (either a part or whole bit).=0A=
>   * - for passthrough register that need special behavior (like interacti=
ng with=0A=
> - *   other component), set emu_mask to all 0 and specify r/w func proper=
ly.=0A=
> + *   other component), set emu_mask_init to all 0 and specify r/w func p=
roperly.=0A=
>   * - do NOT use ALL F for init_val, otherwise the tbl will not be regist=
ered.=0A=
>   */=0A=
>  =0A=
> @@ -238,21 +236,21 @@ static int xen_pt_long_reg_write(XenPCIPassthroughS=
tate *s, XenPTReg *cfg_entry,=0A=
>   */=0A=
>  =0A=
>  static int xen_pt_vendor_reg_init(XenPCIPassthroughState *s,=0A=
> -                                  XenPTRegInfo *reg, uint32_t real_offse=
t,=0A=
> +                                  XenPTReg *reg_entry, uint32_t real_off=
set,=0A=
>                                    uint32_t *data)=0A=
>  {=0A=
>      *data =3D s->real_device.vendor_id;=0A=
>      return 0;=0A=
>  }=0A=
>  static int xen_pt_device_reg_init(XenPCIPassthroughState *s,=0A=
> -                                  XenPTRegInfo *reg, uint32_t real_offse=
t,=0A=
> +                                  XenPTReg *reg_entry, uint32_t real_off=
set,=0A=
>                                    uint32_t *data)=0A=
>  {=0A=
>      *data =3D s->real_device.device_id;=0A=
>      return 0;=0A=
>  }=0A=
>  static int xen_pt_status_reg_init(XenPCIPassthroughState *s,=0A=
> -                                  XenPTRegInfo *reg, uint32_t real_offse=
t,=0A=
> +                                  XenPTReg *unused, uint32_t real_offset=
,=0A=
>                                    uint32_t *data)=0A=
>  {=0A=
>      XenPTRegGroup *reg_grp_entry =3D NULL;=0A=
> @@ -287,17 +285,17 @@ static int xen_pt_status_reg_init(XenPCIPassthrough=
State *s,=0A=
>      return 0;=0A=
>  }=0A=
>  static int xen_pt_header_type_reg_init(XenPCIPassthroughState *s,=0A=
> -                                       XenPTRegInfo *reg, uint32_t real_=
offset,=0A=
> -                                       uint32_t *data)=0A=
> +                                       XenPTReg *reg_entry,=0A=
> +                                       uint32_t real_offset, uint32_t *d=
ata)=0A=
>  {=0A=
>      /* read PCI_HEADER_TYPE */=0A=
> -    *data =3D reg->init_val | 0x80;=0A=
> +    *data =3D reg_entry->reg->init_val | 0x80;=0A=
>      return 0;=0A=
>  }=0A=
>  =0A=
>  /* initialize Interrupt Pin register */=0A=
>  static int xen_pt_irqpin_reg_init(XenPCIPassthroughState *s,=0A=
> -                                  XenPTRegInfo *reg, uint32_t real_offse=
t,=0A=
> +                                  XenPTReg *reg_entry, uint32_t real_off=
set,=0A=
>                                    uint32_t *data)=0A=
>  {=0A=
>      if (s->real_device.irq) {=0A=
> @@ -313,7 +311,7 @@ static int xen_pt_cmd_reg_write(XenPCIPassthroughStat=
e *s, XenPTReg *cfg_entry,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint16_t writable_mask =3D 0;=0A=
> -    uint16_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint16_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      uint16_t *data =3D cfg_entry->ptr.half_word;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> @@ -405,13 +403,13 @@ static inline uint32_t base_address_with_flags(XenH=
ostPCIIORegion *hr)=0A=
>      }=0A=
>  }=0A=
>  =0A=
> -static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *=
reg,=0A=
> +static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTReg *reg_=
entry,=0A=
>                                 uint32_t real_offset, uint32_t *data)=0A=
>  {=0A=
>      uint32_t reg_field =3D 0;=0A=
>      int index;=0A=
>  =0A=
> -    index =3D xen_pt_bar_offset_to_index(reg->offset);=0A=
> +    index =3D xen_pt_bar_offset_to_index(reg_entry->reg->offset);=0A=
>      if (index < 0 || index >=3D PCI_NUM_REGIONS) {=0A=
>          XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n",=
 index);=0A=
>          return -1;=0A=
> @@ -423,6 +421,21 @@ static int xen_pt_bar_reg_init(XenPCIPassthroughStat=
e *s, XenPTRegInfo *reg,=0A=
>          reg_field =3D XEN_PT_INVALID_REG;=0A=
>      }=0A=
>  =0A=
> +     /* set emulate mask depend on BAR flag */=0A=
> +     switch (s->bases[index].bar_flag) {=0A=
> +     case XEN_PT_BAR_FLAG_MEM:=0A=
> +         reg_entry->emu_mask =3D XEN_PT_BAR_MEM_EMU_MASK;=0A=
> +         break;=0A=
> +     case XEN_PT_BAR_FLAG_IO:=0A=
> +         reg_entry->emu_mask =3D XEN_PT_BAR_IO_EMU_MASK;=0A=
> +         break;=0A=
> +     case XEN_PT_BAR_FLAG_UPPER:=0A=
> +         reg_entry->emu_mask =3D XEN_PT_BAR_ALLF;=0A=
> +         break;=0A=
> +     default:=0A=
> +         break;=0A=
> +    }=0A=
> +=0A=
>      *data =3D reg_field;=0A=
>      return 0;=0A=
>  }=0A=
> @@ -431,7 +444,6 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState=
 *s, XenPTReg *cfg_entry,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint32_t valid_emu_mask =3D 0;=0A=
> -    uint32_t bar_emu_mask =3D 0;=0A=
>      int index;=0A=
>  =0A=
>      /* get BAR index */=0A=
> @@ -444,23 +456,8 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughStat=
e *s, XenPTReg *cfg_entry,=0A=
>      /* use fixed-up value from kernel sysfs */=0A=
>      *value =3D base_address_with_flags(&s->real_device.io_regions[index]=
);=0A=
>  =0A=
> -    /* set emulate mask depend on BAR flag */=0A=
> -    switch (s->bases[index].bar_flag) {=0A=
> -    case XEN_PT_BAR_FLAG_MEM:=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_MEM_EMU_MASK;=0A=
> -        break;=0A=
> -    case XEN_PT_BAR_FLAG_IO:=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_IO_EMU_MASK;=0A=
> -        break;=0A=
> -    case XEN_PT_BAR_FLAG_UPPER:=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_ALLF;=0A=
> -        break;=0A=
> -    default:=0A=
> -        break;=0A=
> -    }=0A=
> -=0A=
>      /* emulate BAR */=0A=
> -    valid_emu_mask =3D bar_emu_mask & valid_mask;=0A=
> +    valid_emu_mask =3D cfg_entry->emu_mask & valid_mask;=0A=
>      *value =3D XEN_PT_MERGE_VALUE(*value, *cfg_entry->ptr.word, ~valid_e=
mu_mask);=0A=
>  =0A=
>      return 0;=0A=
> @@ -474,7 +471,6 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughStat=
e *s, XenPTReg *cfg_entry,=0A=
>      PCIDevice *d =3D PCI_DEVICE(s);=0A=
>      const PCIIORegion *r;=0A=
>      uint32_t writable_mask =3D 0;=0A=
> -    uint32_t bar_emu_mask =3D 0;=0A=
>      uint32_t bar_ro_mask =3D 0;=0A=
>      uint32_t r_size =3D 0;=0A=
>      int index =3D 0;=0A=
> @@ -493,7 +489,6 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughStat=
e *s, XenPTReg *cfg_entry,=0A=
>      /* set emulate mask and read-only mask values depend on the BAR flag=
 */=0A=
>      switch (s->bases[index].bar_flag) {=0A=
>      case XEN_PT_BAR_FLAG_MEM:=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_MEM_EMU_MASK;=0A=
>          if (!r_size) {=0A=
>              /* low 32 bits mask for 64 bit bars */=0A=
>              bar_ro_mask =3D XEN_PT_BAR_ALLF;=0A=
> @@ -502,13 +497,11 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughSt=
ate *s, XenPTReg *cfg_entry,=0A=
>          }=0A=
>          break;=0A=
>      case XEN_PT_BAR_FLAG_IO:=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_IO_EMU_MASK;=0A=
>          bar_ro_mask =3D XEN_PT_BAR_IO_RO_MASK | (r_size - 1);=0A=
>          break;=0A=
>      case XEN_PT_BAR_FLAG_UPPER:=0A=
>          assert(index > 0);=0A=
>          r_size =3D d->io_regions[index - 1].size >> 32;=0A=
> -        bar_emu_mask =3D XEN_PT_BAR_ALLF;=0A=
>          bar_ro_mask =3D r_size ? r_size - 1 : 0;=0A=
>          break;=0A=
>      default:=0A=
> @@ -516,7 +509,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughStat=
e *s, XenPTReg *cfg_entry,=0A=
>      }=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D bar_emu_mask & ~bar_ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~bar_ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>  =0A=
>      /* check whether we need to update the virtual region address or not=
 */=0A=
> @@ -547,7 +540,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthr=
oughState *s,=0A=
>      XenPTRegion *base =3D NULL;=0A=
>      PCIDevice *d =3D PCI_DEVICE(s);=0A=
>      uint32_t writable_mask =3D 0;=0A=
> -    uint32_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint32_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      pcibus_t r_size =3D 0;=0A=
>      uint32_t bar_ro_mask =3D 0;=0A=
>      uint32_t *data =3D cfg_entry->ptr.word;=0A=
> @@ -594,7 +587,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xFFFF,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_vendor_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -605,7 +598,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xFFFF,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_device_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -616,7 +609,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .res_mask   =3D 0xF880,=0A=
> -        .emu_mask   =3D 0x0743,=0A=
> +        .emu_mask_init =3D 0x0743,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_cmd_reg_write,=0A=
> @@ -627,7 +620,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -643,7 +636,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .res_mask   =3D 0x0007,=0A=
>          .ro_mask    =3D 0x06F8,=0A=
>          .rw1c_mask  =3D 0xF900,=0A=
> -        .emu_mask   =3D 0x0010,=0A=
> +        .emu_mask_init =3D 0x0010,=0A=
>          .init       =3D xen_pt_status_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -654,7 +647,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0x00,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -665,7 +658,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0x00,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -676,7 +669,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0x00,=0A=
> +        .emu_mask_init =3D 0x00,=0A=
>          .init       =3D xen_pt_header_type_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -687,7 +680,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0x00,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -698,7 +691,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_irqpin_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -764,7 +757,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D ~PCI_ROM_ADDRESS_MASK & ~PCI_ROM_ADDRESS_ENABLE,=
=0A=
> -        .emu_mask   =3D (uint32_t)PCI_ROM_ADDRESS_MASK,=0A=
> +        .emu_mask_init =3D (uint32_t)PCI_ROM_ADDRESS_MASK,=0A=
>          .init       =3D xen_pt_bar_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_exp_rom_bar_reg_write,=0A=
> @@ -786,7 +779,7 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -795,7 +788,7 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] =3D {=0A=
>          .offset     =3D PCI_VPD_ADDR,=0A=
>          .size       =3D 2,=0A=
>          .ro_mask    =3D 0x0003,=0A=
> -        .emu_mask   =3D 0x0003,=0A=
> +        .emu_mask_init =3D 0x0003,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -817,7 +810,7 @@ static XenPTRegInfo xen_pt_emu_reg_vendor[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -854,9 +847,10 @@ static inline uint8_t get_device_type(XenPCIPassthro=
ughState *s,=0A=
>  =0A=
>  /* initialize Link Control register */=0A=
>  static int xen_pt_linkctrl_reg_init(XenPCIPassthroughState *s,=0A=
> -                                    XenPTRegInfo *reg, uint32_t real_off=
set,=0A=
> +                                    XenPTReg *reg_entry, uint32_t real_o=
ffset,=0A=
>                                      uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint8_t cap_ver =3D get_capability_version(s, real_offset - reg->off=
set);=0A=
>      uint8_t dev_type =3D get_device_type(s, real_offset - reg->offset);=
=0A=
>  =0A=
> @@ -872,9 +866,10 @@ static int xen_pt_linkctrl_reg_init(XenPCIPassthroug=
hState *s,=0A=
>  }=0A=
>  /* initialize Device Control 2 register */=0A=
>  static int xen_pt_devctrl2_reg_init(XenPCIPassthroughState *s,=0A=
> -                                    XenPTRegInfo *reg, uint32_t real_off=
set,=0A=
> +                                    XenPTReg *reg_entry, uint32_t real_o=
ffset,=0A=
>                                      uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint8_t cap_ver =3D get_capability_version(s, real_offset - reg->off=
set);=0A=
>  =0A=
>      /* no need to initialize in case of cap_ver 1.x */=0A=
> @@ -887,9 +882,10 @@ static int xen_pt_devctrl2_reg_init(XenPCIPassthroug=
hState *s,=0A=
>  }=0A=
>  /* initialize Link Control 2 register */=0A=
>  static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,=0A=
> -                                     XenPTRegInfo *reg, uint32_t real_of=
fset,=0A=
> +                                     XenPTReg *reg_entry, uint32_t real_=
offset,=0A=
>                                       uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint8_t cap_ver =3D get_capability_version(s, real_offset - reg->off=
set);=0A=
>      uint32_t reg_field =3D 0;=0A=
>  =0A=
> @@ -921,7 +917,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -932,7 +928,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0xFFFFFFFF,=0A=
> -        .emu_mask   =3D 0x10000000,=0A=
> +        .emu_mask_init =3D 0x10000000,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_long_reg_write,=0A=
> @@ -943,7 +939,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x2810,=0A=
>          .ro_mask    =3D 0x8400,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -965,7 +961,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xFC34,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_linkctrl_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -986,7 +982,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xFFE0,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_devctrl2_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -997,7 +993,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xE040,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_linkctrl2_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -1020,7 +1016,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -1031,7 +1027,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0xFFFF,=0A=
> -        .emu_mask   =3D 0xF9C8,=0A=
> +        .emu_mask_init =3D 0xF9C8,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -1044,7 +1040,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] =3D {=0A=
>          .res_mask   =3D 0x00F0,=0A=
>          .ro_mask    =3D 0x610C,=0A=
>          .rw1c_mask  =3D 0x8000,=0A=
> -        .emu_mask   =3D 0x810B,=0A=
> +        .emu_mask_init =3D 0x810B,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_word_reg_write,=0A=
> @@ -1066,7 +1062,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] =3D {=0A=
>  =0A=
>  /* Message Control register */=0A=
>  static int xen_pt_msgctrl_reg_init(XenPCIPassthroughState *s,=0A=
> -                                   XenPTRegInfo *reg, uint32_t real_offs=
et,=0A=
> +                                   XenPTReg *reg_entry, uint32_t real_of=
fset,=0A=
>                                     uint32_t *data)=0A=
>  {=0A=
>      XenPTMSI *msi =3D s->msi;=0A=
> @@ -1088,7 +1084,7 @@ static int xen_pt_msgctrl_reg_init(XenPCIPassthroug=
hState *s,=0A=
>      msi->initialized =3D false;=0A=
>      msi->mapped =3D false;=0A=
>  =0A=
> -    *data =3D reg->init_val;=0A=
> +    *data =3D reg_entry->reg->init_val;=0A=
>      return 0;=0A=
>  }=0A=
>  static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,=0A=
> @@ -1098,7 +1094,7 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthrou=
ghState *s,=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      XenPTMSI *msi =3D s->msi;=0A=
>      uint16_t writable_mask =3D 0;=0A=
> -    uint16_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint16_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      uint16_t *data =3D cfg_entry->ptr.half_word;=0A=
>  =0A=
>      /* Currently no support for multi-vector */=0A=
> @@ -1107,7 +1103,7 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthrou=
ghState *s,=0A=
>      }=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>      msi->flags |=3D *data & ~PCI_MSI_FLAGS_ENABLE;=0A=
>  =0A=
> @@ -1148,14 +1144,14 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthr=
oughState *s,=0A=
>  =0A=
>  /* initialize Message Upper Address register */=0A=
>  static int xen_pt_msgaddr64_reg_init(XenPCIPassthroughState *s,=0A=
> -                                     XenPTRegInfo *reg, uint32_t real_of=
fset,=0A=
> +                                     XenPTReg *reg_entry, uint32_t real_=
offset,=0A=
>                                       uint32_t *data)=0A=
>  {=0A=
>      /* no need to initialize in case of 32 bit type */=0A=
>      if (!(s->msi->flags & PCI_MSI_FLAGS_64BIT)) {=0A=
>          *data =3D XEN_PT_INVALID_REG;=0A=
>      } else {=0A=
> -        *data =3D reg->init_val;=0A=
> +        *data =3D reg_entry->reg->init_val;=0A=
>      }=0A=
>  =0A=
>      return 0;=0A=
> @@ -1163,15 +1159,16 @@ static int xen_pt_msgaddr64_reg_init(XenPCIPassth=
roughState *s,=0A=
>  /* this function will be called twice (for 32 bit and 64 bit type) */=0A=
>  /* initialize Message Data register */=0A=
>  static int xen_pt_msgdata_reg_init(XenPCIPassthroughState *s,=0A=
> -                                   XenPTRegInfo *reg, uint32_t real_offs=
et,=0A=
> +                                   XenPTReg *reg_entry, uint32_t real_of=
fset,=0A=
>                                     uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint32_t flags =3D s->msi->flags;=0A=
>      uint32_t offset =3D reg->offset;=0A=
>  =0A=
>      /* check the offset whether matches the type or not */=0A=
>      if (xen_pt_msi_check_type(offset, flags, DATA)) {=0A=
> -        *data =3D reg->init_val;=0A=
> +        *data =3D reg_entry->reg->init_val;=0A=
>      } else {=0A=
>          *data =3D XEN_PT_INVALID_REG;=0A=
>      }=0A=
> @@ -1181,9 +1178,10 @@ static int xen_pt_msgdata_reg_init(XenPCIPassthrou=
ghState *s,=0A=
>  /* this function will be called twice (for 32 bit and 64 bit type) */=0A=
>  /* initialize Mask register */=0A=
>  static int xen_pt_mask_reg_init(XenPCIPassthroughState *s,=0A=
> -                                XenPTRegInfo *reg, uint32_t real_offset,=
=0A=
> +                                XenPTReg *reg_entry, uint32_t real_offse=
t,=0A=
>                                  uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint32_t flags =3D s->msi->flags;=0A=
>  =0A=
>      /* check the offset whether matches the type or not */=0A=
> @@ -1200,9 +1198,10 @@ static int xen_pt_mask_reg_init(XenPCIPassthroughS=
tate *s,=0A=
>  /* this function will be called twice (for 32 bit and 64 bit type) */=0A=
>  /* initialize Pending register */=0A=
>  static int xen_pt_pending_reg_init(XenPCIPassthroughState *s,=0A=
> -                                   XenPTRegInfo *reg, uint32_t real_offs=
et,=0A=
> +                                   XenPTReg *reg_entry, uint32_t real_of=
fset,=0A=
>                                     uint32_t *data)=0A=
>  {=0A=
> +    XenPTRegInfo *reg =3D reg_entry->reg;=0A=
>      uint32_t flags =3D s->msi->flags;=0A=
>  =0A=
>      /* check the offset whether matches the type or not */=0A=
> @@ -1227,7 +1226,7 @@ static int xen_pt_msgaddr32_reg_write(XenPCIPassthr=
oughState *s,=0A=
>      uint32_t *data =3D cfg_entry->ptr.word;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>      s->msi->addr_lo =3D *data;=0A=
>  =0A=
> @@ -1261,7 +1260,7 @@ static int xen_pt_msgaddr64_reg_write(XenPCIPassthr=
oughState *s,=0A=
>      }=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>      /* update the msi_info too */=0A=
>      s->msi->addr_hi =3D *data;=0A=
> @@ -1301,7 +1300,7 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthrou=
ghState *s,=0A=
>      }=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>      /* update the msi_info too */=0A=
>      msi->data =3D *data;=0A=
> @@ -1343,7 +1342,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -1355,7 +1354,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .init_val   =3D 0x0000,=0A=
>          .res_mask   =3D 0xFE00,=0A=
>          .ro_mask    =3D 0x018E,=0A=
> -        .emu_mask   =3D 0x017E,=0A=
> +        .emu_mask_init =3D 0x017E,=0A=
>          .init       =3D xen_pt_msgctrl_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_msgctrl_reg_write,=0A=
> @@ -1366,7 +1365,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0x00000003,=0A=
> -        .emu_mask   =3D 0xFFFFFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFFFFFF,=0A=
>          .init       =3D xen_pt_common_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_msgaddr32_reg_write,=0A=
> @@ -1377,7 +1376,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0x00000000,=0A=
> -        .emu_mask   =3D 0xFFFFFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFFFFFF,=0A=
>          .init       =3D xen_pt_msgaddr64_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_msgaddr64_reg_write,=0A=
> @@ -1388,7 +1387,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0x0000,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_msgdata_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_msgdata_reg_write,=0A=
> @@ -1399,7 +1398,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 2,=0A=
>          .init_val   =3D 0x0000,=0A=
>          .ro_mask    =3D 0x0000,=0A=
> -        .emu_mask   =3D 0xFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFF,=0A=
>          .init       =3D xen_pt_msgdata_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_msgdata_reg_write,=0A=
> @@ -1410,7 +1409,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0xFFFFFFFF,=0A=
> -        .emu_mask   =3D 0xFFFFFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFFFFFF,=0A=
>          .init       =3D xen_pt_mask_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_mask_reg_write,=0A=
> @@ -1421,7 +1420,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0xFFFFFFFF,=0A=
> -        .emu_mask   =3D 0xFFFFFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFFFFFF,=0A=
>          .init       =3D xen_pt_mask_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_mask_reg_write,=0A=
> @@ -1432,7 +1431,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0xFFFFFFFF,=0A=
> -        .emu_mask   =3D 0x00000000,=0A=
> +        .emu_mask_init =3D 0x00000000,=0A=
>          .init       =3D xen_pt_pending_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_long_reg_write,=0A=
> @@ -1443,7 +1442,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0x00000000,=0A=
>          .ro_mask    =3D 0xFFFFFFFF,=0A=
> -        .emu_mask   =3D 0x00000000,=0A=
> +        .emu_mask_init =3D 0x00000000,=0A=
>          .init       =3D xen_pt_pending_reg_init,=0A=
>          .u.dw.read  =3D xen_pt_long_reg_read,=0A=
>          .u.dw.write =3D xen_pt_long_reg_write,=0A=
> @@ -1460,7 +1459,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] =3D {=0A=
>  =0A=
>  /* Message Control register for MSI-X */=0A=
>  static int xen_pt_msixctrl_reg_init(XenPCIPassthroughState *s,=0A=
> -                                    XenPTRegInfo *reg, uint32_t real_off=
set,=0A=
> +                                    XenPTReg *reg_entry, uint32_t real_o=
ffset,=0A=
>                                      uint32_t *data)=0A=
>  {=0A=
>      uint16_t reg_field;=0A=
> @@ -1479,7 +1478,7 @@ static int xen_pt_msixctrl_reg_init(XenPCIPassthrou=
ghState *s,=0A=
>  =0A=
>      s->msix->ctrl_offset =3D real_offset;=0A=
>  =0A=
> -    *data =3D reg->init_val;=0A=
> +    *data =3D reg_entry->reg->init_val;=0A=
>      return 0;=0A=
>  }=0A=
>  static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,=0A=
> @@ -1488,12 +1487,12 @@ static int xen_pt_msixctrl_reg_write(XenPCIPassth=
roughState *s,=0A=
>  {=0A=
>      XenPTRegInfo *reg =3D cfg_entry->reg;=0A=
>      uint16_t writable_mask =3D 0;=0A=
> -    uint16_t throughable_mask =3D get_throughable_mask(s, reg, valid_mas=
k);=0A=
> +    uint16_t throughable_mask =3D get_throughable_mask(s, cfg_entry, val=
id_mask);=0A=
>      int debug_msix_enabled_old;=0A=
>      uint16_t *data =3D cfg_entry->ptr.half_word;=0A=
>  =0A=
>      /* modify emulate register */=0A=
> -    writable_mask =3D reg->emu_mask & ~reg->ro_mask & valid_mask;=0A=
> +    writable_mask =3D cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;=
=0A=
>      *data =3D XEN_PT_MERGE_VALUE(*val, *data, writable_mask);=0A=
>  =0A=
>      /* create value for writing to I/O device register */=0A=
> @@ -1527,7 +1526,7 @@ static XenPTRegInfo xen_pt_emu_reg_msix[] =3D {=0A=
>          .size       =3D 1,=0A=
>          .init_val   =3D 0x00,=0A=
>          .ro_mask    =3D 0xFF,=0A=
> -        .emu_mask   =3D 0xFF,=0A=
> +        .emu_mask_init =3D 0xFF,=0A=
>          .init       =3D xen_pt_ptr_reg_init,=0A=
>          .u.b.read   =3D xen_pt_byte_reg_read,=0A=
>          .u.b.write  =3D xen_pt_byte_reg_write,=0A=
> @@ -1539,7 +1538,7 @@ static XenPTRegInfo xen_pt_emu_reg_msix[] =3D {=0A=
>          .init_val   =3D 0x0000,=0A=
>          .res_mask   =3D 0x3800,=0A=
>          .ro_mask    =3D 0x07FF,=0A=
> -        .emu_mask   =3D 0x0000,=0A=
> +        .emu_mask_init =3D 0x0000,=0A=
>          .init       =3D xen_pt_msixctrl_reg_init,=0A=
>          .u.w.read   =3D xen_pt_word_reg_read,=0A=
>          .u.w.write  =3D xen_pt_msixctrl_reg_write,=0A=
> @@ -1555,7 +1554,7 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] =
=3D {=0A=
>          .offset     =3D 0x0,=0A=
>          .size       =3D 4,=0A=
>          .init_val   =3D 0,=0A=
> -        .emu_mask   =3D 0xFFFFFFFF,=0A=
> +        .emu_mask_init =3D 0xFFFFFFFF,=0A=
>          .u.dw.read   =3D xen_pt_intel_opregion_read,=0A=
>          .u.dw.write  =3D xen_pt_intel_opregion_write,=0A=
>      },=0A=
> @@ -1817,7 +1816,7 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[=
] =3D {=0A=
>  =0A=
>  /* initialize Capabilities Pointer or Next Pointer register */=0A=
>  static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s,=0A=
> -                               XenPTRegInfo *reg, uint32_t real_offset,=
=0A=
> +                               XenPTReg *reg_entry, uint32_t real_offset=
,=0A=
>                                 uint32_t *data)=0A=
>  {=0A=
>      int i, rc;=0A=
> @@ -1926,8 +1925,10 @@ static void xen_pt_config_reg_init(XenPCIPassthrou=
ghState *s,=0A=
>          unsigned int offset;=0A=
>          uint32_t val;=0A=
>  =0A=
> +        reg_entry->emu_mask =3D reg->emu_mask_init;=0A=
> +=0A=
>          /* initialize emulate register */=0A=
> -        rc =3D reg->init(s, reg_entry->reg,=0A=
> +        rc =3D reg->init(s, reg_entry,=0A=
>                         reg_grp->base_offset + reg->offset, &data);=0A=
>          if (rc < 0) {=0A=
>              g_free(reg_entry);=0A=
> @@ -1961,7 +1962,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroug=
hState *s,=0A=
>          /* Set bits in emu_mask are the ones we emulate. The dev.config =
shall=0A=
>           * contain the emulated view of the guest - therefore we flip th=
e mask=0A=
>           * to mask out the host values (which dev.config initially has) =
. */=0A=
> -        host_mask =3D size_mask & ~reg->emu_mask;=0A=
> +        host_mask =3D size_mask & ~reg_entry->emu_mask;=0A=
>  =0A=
>          if ((data & host_mask) !=3D (val & host_mask)) {=0A=
>              uint32_t new_val;=0A=
> -- =0A=
> 2.31.1=

