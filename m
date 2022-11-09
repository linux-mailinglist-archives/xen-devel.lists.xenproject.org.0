Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3662302B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 17:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441078.695349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osnuy-0001O8-Rg; Wed, 09 Nov 2022 16:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441078.695349; Wed, 09 Nov 2022 16:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osnuy-0001LD-Nf; Wed, 09 Nov 2022 16:27:12 +0000
Received: by outflank-mailman (input) for mailman id 441078;
 Wed, 09 Nov 2022 16:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osnux-0001L7-Hd
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 16:27:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d7c5b5-604b-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 17:27:09 +0100 (CET)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 11:27:04 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CH0PR03MB6033.namprd03.prod.outlook.com (2603:10b6:610:bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 16:27:02 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:27:02 +0000
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
X-Inumbo-ID: 59d7c5b5-604b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668011229;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=01okUQweI9FcDAGzqugXotVxQCl66ejb7qXpXWy7DPc=;
  b=KHbrnh0WLe3xV1hzb/gjUxgMlRbwXnXvk4m795fwbLisEMLoureQfr67
   JMBufcyOqTMPj6pcDG7Ycugi9dQbIzIqutZIBaXnxq364HlrDit4qs1dH
   TTWzFcVrbiYjFvfwoW1EWQ/HFf4g3j1q/u4ICY4bSuFeepL0TwVoBabjq
   w=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 84918370
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Av8Do603FNaLDEET2/bD5RNwkn2cJEfYwER7XKvMYLTBsI5bpzRRn
 GAWUG6OPfvbajP2Ldsjb4q0/EIE6MDWyt9hQAI4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDiIU5
 /YUCzAxZ1OG19yUh4u3VdVrr5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PkmSd05C0WDbRUtGGW8RT2Fqfv
 GXF12/4HgsbJJqUzj/tHneE1rOexHOgB9p6+LuQ+vxqw0aagUMpOhw6RGebrfie0XGkVIcKQ
 6AT0m90xUQoz2SLQ9/nTluHqXiLlhcGXpxbFOhSwAOQzqvZ5S6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BWMLeyIsVwYO5Njn5oYpgXrnUdJLAKOzyNrvFlnNL
 yuiqSE/g/AfiJAN3qDjoVTf2Wrw+N7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lQNlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:CoDWiK/0OFhMDAdNvMxuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2Xkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DMfeX56tQ0hbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9M1lVBw6du/22z6IJyoHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.96,151,1665460800"; 
   d="scan'208";a="84918370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKQ1Jeppo2RCrRxErjaRRmeQhImWeKPEEORK5WFOEjaENMg2chcmwE02uLweK+DM/J0jg13WeXTa9LgYZKjBd+Zeq9f0vHvUgicNx10okEz7x9wOOsMB9H8FD4onVNtg14+Gt+OfOGczHQsHrWm4QzON6B532L0liZT/U8u9CFEHf95OAutZOFy+Z2+1wxnbNKfiJUiNrzeUuDJnTkzd9Fiv8dpaOhaw5bbZmSICvNvRKK8azcW8Uum+pCU1Qb9adt8Zyrl0E3xYuquXWZ7GePVtWRzEbALI2CrA8Lkmefxu6PE8+L57UbN1L6r0PGUS38xBzoJ0om5WiMEyYFn54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4dAEgVRnGT6vctPCLk+AFIjAqguSpc7AsekpJ7o1ek=;
 b=KTm04TF33JXnqpHkcc0GkFfKsOKg37DkAa3Z/L2qvxuNWWndlEfRWl5Dnwd9OMMxK2wPJjNvG/W9cP/SVOkNT8yBVatgfho4HQI8DUBQTvSg9B9nc0EWHEhKXRpIktVlbchjPV7YqIb+1n3yDYjAznUhF3yM6YJgFCePRX9HJ+x9daT0NO0rVdozjw5KC5CNkH81avgTpOzbVqZWxKTXe/YWLms5vdUhbusdO0DEV5UTsXnOH1runfvCpciRTRRggKdZMTv7PEPAZefoArDMB17dDYtfPaAw9LNM/CKzPg7l6CW+hDp2qOytVvpPSk7vxiqc8uTsSKOI4G3RXOFx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4dAEgVRnGT6vctPCLk+AFIjAqguSpc7AsekpJ7o1ek=;
 b=JZYTezcYcX3216CsnspjqYmwrZPIoGVk7/MsrHWERB5cGYHDGml6TtsvgtBlfvGA30cgKQT/aRd9g2NloA/IJ8iTdAex4aNlgfuJqg6pDkHkSz8P0UV6OpUva24eyHWu1nWYURWwgNHUOPbeSekh/aoMNEIMNM1CL/pdfhop3bI=
From: Edwin Torok <edvin.torok@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgACx3ICAAML3gIAAI/qA
Date: Wed, 9 Nov 2022 16:27:02 +0000
Message-ID: <8C257640-9021-4036-8E5F-A085D53CAA60@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <0B9BA046-5FA5-42EC-9959-63F15B833E91@citrix.com>
In-Reply-To: <0B9BA046-5FA5-42EC-9959-63F15B833E91@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CH0PR03MB6033:EE_
x-ms-office365-filtering-correlation-id: 43004ee0-d7e3-456a-7ff7-08dac26f3bae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eBxK6Q2a7JfrqqmumOrYitWlsvJcY56PIQDRlJUct+64g4IlxmwJnvcayzuZhFHgsM0SpcLJGnaigfIpb9TfmsrGrDwCu1qbIDydJwTyZxxMoi4PpdW3EA0ZhkzBbGXC6a6VpxL16FIQ1814iGJyYZsw7HcWcU/H4W2Zz50nKFPSE0HOgECnAunn2Jx45wjdB07KJKpkg/yW7LoIBzmr9c3CiSMalouwpQszPMzu6+8cZsk3VcP4bc2iqePaadGihFrVM63mUX/jBbUKVP62lVwVPqhdWlKjifuiRwX0wH8uZJccML0nus+dRe9n4F4Bq1PTi8IS8IigDCFIXYqHaZfpMMyd6cAh3Xy/c3DfyOt14OensTTdAVzbN4q913BI0squ1Y3BhZ9LptCqyQa2xwcMRFuPLnVDgBiuHuNvMuo8P7FaAQ/f3b42E5JZ+ebw2eLKKxNn4uqEDrJn0KFXK5QCGYPFY52mTsf3bWtJrjtlg1cXOKbELh9JOuU4EHAIswlFO+gdg4unxYcvi3Z1KhFPCW03dKKeXeF6VZxQFL4CQnWJhh8qMer3IcE7gC9vlXfk4FgyAsnGKpv+12WBNpzRMvd5bHi1QcvBtq9gMKyG2LHSKv64SnqjEmcsHGbZfyyx38DvexhlDtIR5C+db/B0yCFLwEMWkaKKa5Njbk94rwn6waY4ijAy6v6teZETLr+Z8DNST1kA3MDZCY90DNMUa/ax62zdlDRxgKCbQeEKgU9n7yxX9XcwmkP7nXrlfLf8d8+87TzRnOJaGa8AF89o10wuotdBa+Y0bDFpn5bS3xCxnf/zFbfckfPY0zX/VB96utKKOTe68fc0wJebar1TcwozbSoCIFy/HEQd6+erPkguXqXcdzE1vGySdBTD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(478600001)(6486002)(966005)(6916009)(71200400001)(38070700005)(86362001)(122000001)(38100700002)(107886003)(82960400001)(316002)(54906003)(186003)(26005)(6512007)(36756003)(2906002)(2616005)(76116006)(5660300002)(91956017)(6506007)(4326008)(53546011)(8936002)(41300700001)(64756008)(66946007)(66446008)(66556008)(66476007)(83380400001)(8676002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4jXeuuXsGR1Uq+K5u83ZpTH95FU6b9zpdvJuCSX2euFdL/Qh6wd9o5Sdz6RA?=
 =?us-ascii?Q?e/BQNaUOKg9dSwRTegATyRcoGKMnznN5teuZxBqAlXQSEdlBEJNuO+OnYVga?=
 =?us-ascii?Q?NA4pwIWe+ISruvwfrSPzk3oFyr9O/sj6PNuClshyhQ0SicF6Sax+SlS9YXuC?=
 =?us-ascii?Q?y5agZyNAQrwv+GGl5vkn302MyUQQ7Asno3n5SlUPF9v1LpRXd7hfCkGwbcNq?=
 =?us-ascii?Q?pwi1pa+VHujHPyHaWgc6Li6Ki6x0M9zB9odWVpZbFl4qX9DimhUL2loFGc2H?=
 =?us-ascii?Q?4fpIBWpcHbSBEtfrpnhyZr7/Iwwo7uHG9E9dXeEYNjdsoBWUc1GDKXjbODZh?=
 =?us-ascii?Q?vtFLBWFsbsITZ5w6B0bMIeRW5AKk8tnHMI8xR54OkOkOoaCbZUM3koZ7zrkd?=
 =?us-ascii?Q?7exnTP8vmqBkco1b33O/P1+aRI/sGXE/cE9XUZqSvF9vuCXMbxt/PrQ26nnV?=
 =?us-ascii?Q?+1/xvVh653JhqukPdm9jhiomRvcxFUJCgCaMUyr/4uqLP8VYXLgo9Wry2uOy?=
 =?us-ascii?Q?p5uJ21myxFS+CxrUcbZwVKn4LaZQuH7qp857vsjvf5bFk5g+wSsyy9UYTvpf?=
 =?us-ascii?Q?qvMxm+aeminOIgIOrZmXq/ZJfgqrG0ZysQJ/sBvJUtjsmuqKZo4TUa4os1gn?=
 =?us-ascii?Q?kozTXbb3/0qR8zh08ieMMT+56HvXaWk3q7QgU2n5HwvLUWp+jIWuvgtaRYpy?=
 =?us-ascii?Q?t036CkzbG+qbRnAecxaXq7F8hdBb9qXlwoB0hdb2lLduyHKVKbmsvsJ2S4Nc?=
 =?us-ascii?Q?RkhlOfnfualihhvhqGt53pCp1tezB0J4X1WnnV99i6jmvHOSzgGtGKqA2V5y?=
 =?us-ascii?Q?CEdOs2MoNnmT2pnbUV6vGa1AaC+6a1y7+Ll9NsH1zq34cz8v89elzUHL6cjp?=
 =?us-ascii?Q?ff6SVuGDR0b5Gl5wsHs/P2RS+JjC/K5QcIaKW2mfia0gqs9EJaY1hzsjaKx1?=
 =?us-ascii?Q?WGCJU/1lpoYEPIyy+5pw/Pie33Bt/GVqZ1xs5ratd6mUvJTWIyC5imCjF6X6?=
 =?us-ascii?Q?x0auxO5krVeG+5sAvntvPQuXjPQbuRdfE7JW21EXxpACV15QqGcVy+a4/mll?=
 =?us-ascii?Q?SQB1QTgCtQFcnL2ODikzwZ28If770u2lER6w6zGI7JXFZLOHWVfAm7z55bkU?=
 =?us-ascii?Q?L/NOWIFvGk7BCshHETdKrIfEElBt1v7t0f82lM+qt7CL3LI24SzoNV794bb9?=
 =?us-ascii?Q?RJXNi8s4ZRZ8nsYxSjJWanT7KbrKYNehnpVLJ1uQiAVzP1OQ0g4Ddi7UY/ZB?=
 =?us-ascii?Q?2ahxtTh5FPm5RcgbrqneJI6tSB9/HeZjt3RnZ33DVLhhbDyfVRtTDJyBwCIV?=
 =?us-ascii?Q?NGaSt1XGt6qNQ4tx+PzZaH3wBxaYKhpWkeobKYmPePBa0eIKic9ZptcTszi6?=
 =?us-ascii?Q?KSzFKQHkgR5+A9IRsm0fpNY+TjMAUF5zS6tbk7tLdMc8gaFVlM5WdMraq8Xl?=
 =?us-ascii?Q?Pc+s7/++Isc8HhcPm7HkSeryy/k/xmrvi0pZfI+2a4OalXcg1Kt+o2fY3SdI?=
 =?us-ascii?Q?qFz8SWEOsLZByJz63/jxltCxhp7aAr7Jn+yy2MW5NaQozQ39laIopYmLvxDN?=
 =?us-ascii?Q?xA+IBiZom6rs068dpSjA3pWugAFOljyOWCRVJlaFHBrkxfvILFsO5tR5VFmL?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E3358863A041043A53BF182812D22E1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43004ee0-d7e3-456a-7ff7-08dac26f3bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 16:27:02.4327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7nO+CsquVhEYt0rQD3KRY7ZyIw2V36NPMxyXP2Pw7Yk/vcYMsyBgdZOR2T9b/EPxKl+kyCQZLuIVGIT9QxzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6033



> On 9 Nov 2022, at 14:18, Edwin Torok <edvin.torok@citrix.com> wrote:
>=20
>=20
>=20
>> On 9 Nov 2022, at 02:40, Henry Wang <Henry.Wang@arm.com> wrote:
>>=20
>> Hi Julien,
>>=20
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add
>>> 'make format' and remove tabs
>>> While I understand the goal and support, this seems to be a bit too lat=
e
>>> to do it in Xen 4.17 (we are only a couple of weeks away). At this stag=
e
>>> of the release we should only do bug fix.
>>>=20
>>> This is clearly only a comesmetic change and there I would argue this
>>> should be deferred to 4.18. That said the last call is from the RM.
>>=20
>> I agree with your point. I think maybe defer the patch to 4.18 is better=
,
>> given the deep freeze state we are currently in.
>=20
>=20
> Indentation can't really be trusted to humans :)
>=20


It might be better to consider oxenstored unsupported in 4.17 at this point=
 and try again for 4.17.1 or 4.18, it is probably too late to fix up all th=
e bugs that I keep finding in it in a way in which it can be (security) sup=
ported, although I thought the goal of a release candidate is to try and fi=
nd bugs and fix them before release.

But doing that while also trying to keep whitespace and indentation changes=
 out of the patches (or trying to keep the patches small), is more likely t=
o introduce more bugs into it at this point rather than fix things.

I was not able to do or send any of these patches sooner because the XSA-32=
6 and XSA-115/etc. work in the past years has prevented any other kind of w=
ork from being sent (it'd have made rebasing the XSA series more difficult,=
 and/or reveal the XSA as part of various other changes and commits), it is=
 unfortunate that there is a release quite so close after an oxenstored XSA

I tried fixing up the rest of the series to not depend on this patch, but w=
ithout an actual 'make format' rule to give it consistent indentation
it is just too error-prone or risky to fix it up at this point (I don't rea=
lly mind whether indentation is tabs vs spaces, it is the inconsistency and=
 non-automated nature of it that is the problem),
e.g. it is quite easy to accidentally duplicate code, or get the code in th=
e wrong scope, or introduce bugs like the one I just mentioned before when =
a new statement gets inserted and the code seemingly looks ok but its seman=
tics is entirely changed (and that is hidden by the inconsistent/non-automa=
ted indentation).


Perhaps by trying to merge some of the changes/fixes from https://github.co=
m/mirage/ocaml-xenstore and getting that production ready, which is a much =
better codebase to start from than
the current one in the Xen tree.:
* it has actual unit tests (which I tried to introduce as part of a securit=
y fix for the intree version of oxenstored but got repeatedly discouraged f=
rom including it to not make the security fix too large)
* it was not vulnerable XSA-353
* it has fixed part of XSA-326 together with a unit test nearly 10 years be=
fore Xen project rediscovered the same bug and realized it is a security bu=
g in the in-tree version: https://github.com/mirage/ocaml-xenstore/commit/2=
1e96654c27c01cf52e5d7aabc5ee53e07f2cbb7
* (of course mirage version has never been used in production so it is enti=
rely likely it has *different* bugs)
* in-tree Xen is difficult to contribute to:=20
  * it has a broken build system that keeps throwing 'inconsistent assumpti=
ons'
  * it has inconsistent and as we can see sometimes wrong indentation
  * patches get posted to the mailing list and sometimes lost (e.g. https:/=
/patchwork.kernel.org/project/xen-devel/list/?series=3D339731&archive=3Dbot=
h is still not committed), and I'm fairly sure I've seen an ack somewhere, =
but patchwork can't find it now

So I think oxenstored in 4.18+ will likely be sufficiently different than 4=
.17 that direct backports won't be possible anyway (indentation changes or =
not), so having this indentation patch in 4.17 wouldn't really help much.
The disadvantage is that we lose all the bugfixes in the patch series after=
 the indentation change, but if we consider oxenstored unsupported in 4.17 =
that may not matter.

I can resend this patch series for master without a 'for-4.17 tag' and keep=
 doing development there.

Best regards,
--Edwin


