Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72F50DED4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312807.530189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwvw-0005zz-Ex; Mon, 25 Apr 2022 11:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312807.530189; Mon, 25 Apr 2022 11:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwvw-0005x4-BA; Mon, 25 Apr 2022 11:31:12 +0000
Received: by outflank-mailman (input) for mailman id 312807;
 Mon, 25 Apr 2022 11:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1niwvu-0005wq-EO
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:31:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32dc96ec-c48b-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:31:09 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 07:31:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BY5PR03MB5234.namprd03.prod.outlook.com (2603:10b6:a03:219::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 11:31:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:31:02 +0000
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
X-Inumbo-ID: 32dc96ec-c48b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650886268;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+ePuuScs6l4G9f5phnkbNfZbpvdmw3iqIrl4JDB+RoA=;
  b=CrYKDpd2bs1jLWEnc+FqMUKg+LRktBh442fWHfhHWJQRwxFQfrfkfNml
   /caA3vID6gNR7pz3aHZD0uS3VgoiEw2cBlgCyMTwgH7dJOHJDa0Pf7mRZ
   2tWgo3hqb/AL1AZ1xi1ObdkFP2teJ4jGL+1SStNepqBlS7t7O9j0R38Ww
   w=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 70252679
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vej8sKO2cqP5AIDvrR3kl8FynXyQoLVcMsEvi/4bfWQNrUpx1jIDn
 2pJDWCGP/2PYzfzKdh+aoiy9UgC6JKByYVhQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 fkOjo26FhwVIY7UxcZEUAcbOgtuIvgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPiiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iOiKWMH+Tp5o4IH82vMxQ8hjYLwH4DbdMC4ROB2pUuX8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZmmEaWx3ATIBQOWEGnvOKijUqjR9NYL
 VdS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLlYDSjlNedk3rvgcTDYh1
 kKKt97xDDkpu7qQIVqC8p+EoDX0PjIaRUcZbigYUU0J6sfiu6kokhvVSt9pVq+y5vX3EDf82
 SGXrwAxgrwSiYgA0KDT1Uvcnzumq5zNTwg0zgbaRGSo6kV+foHNT4617VnW695QIYDfSUOO1
 FAOltKC9ukIAdeInTaUXeQWNLiz4rCONzi0qVJhFpYu9jOp+la4YJtdpjp5IS9BPskIdDDza
 WfPqAhR49lVJ3LsYqhpC79dEOwvxKnkUNjgCPbda4MUZoArLVDauiZzeUSXwmbh1lA2lr0yM
 ouadsDqCmsGDaNgz3y9QOJ1PaIX+x3SDFj7HfjTpylLG5LHDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:dSzWTKGLFrXPxsD2pLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="70252679"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwwFCLoBCqwC/HkUrlWftO4wY3KjWKb9maPIWrzSWkDgJSd74quKILDHuVigbUKHb0c/P04Rw6MyExzN3H4K9JaXfaunkjxLdgpvfMZ6TaUsiupto3p7n8HEnyLxpmLAxRVTHZamfymz8o+oHBCq5n+67SvmQMHevlbByg64hYRBzCeJDZsT7ZTlWA7Pn/a8ViEpqQ8PFp9JYvpLnUsHdeEUhjwpnjNmIAVAawPuB8LATKP2+F7i6pHfaAkTIyw6+vPw+AGWxHnDpr6PTitvNaoHkG6AJDOj0RlUOCqqa5YxoX+NMxUU8APD22P98u7NWEwsmyEA4Ebgya3qwT0NJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/ZO9v9R/w1tir+v/kYfqsH6oY0f/06Vjrne7HI0cQY=;
 b=Eh1q9S7NdVSJj0eU0EtFefKkyzx5nQmYwaWge79Hq5/8d/LLI+1ETlBZT3x16k2i33YkbXhzh+pif72mAjQDbi3w0393GeGaia+v0armq0glNFzENY/ogjdfKen33phhAfMaEx8NAShP1cfXJh5zrYJLGgT/1TD2mhFllo03NNhMhquBc1ytbdcXS0GCWG05mo6SeSEBGywu+62bQXuDA9qUJFPmvk8N8L2KvQx0w4o2D1j2fCn1vq47fo03iBUQyDNx029k7nwr8FTu/KFa3gg5SbiQJG2mIND/VlNMfXbQbF170wvzz9oKE8c1CxmUKAOhTi5ti0f3kodOQJgOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/ZO9v9R/w1tir+v/kYfqsH6oY0f/06Vjrne7HI0cQY=;
 b=uQoh7ZYSv2PPWrhq1d1rG+JGhuA+1XdVgCXNW/Y/3msF+RHYi/l+63X76sm2pdCJPGOtrJANIOvzI64g6DqAyyAfBTbjiE0I1HxUfQCek6XukPyqQQQgXgpBQn6YFFLhMpi2zbNp6+N9LviGws0bPcuq9zHZJVG/VMPzY+IVqHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 13:30:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
Message-ID: <YmaGcqhx5tTiKl9a@Air-de-Roger>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
 <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
 <1c2875af-bb9f-38ef-dd06-c74d0c20e7c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c2875af-bb9f-38ef-dd06-c74d0c20e7c3@suse.com>
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c95f10d1-fef4-4aab-5775-08da26af1422
X-MS-TrafficTypeDiagnostic: BY5PR03MB5234:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR03MB5234959F5DDE11FB53BB869A8FF89@BY5PR03MB5234.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yI933n7WxY7Qsx2ySB7pTgcK0urrei2gMQuYEx+1Y91EcUry4hKSvHWOh7XvbpqVPIJ1Z1fOr2qPX7zJetYRXRfNPQkqnJ9SM+Zf04cyR4OC/7lpTL6GtKQ2jwIvbFOobJSVawikMHqOZV0DlNok6yTFX4ASUY7rp2qhjFksO+Bo3uKdDu3tmDTBaFITqoM1FGj9h/vx+w0HRD2JlrSLBDOptAJ2+zdIkeQOpiWlTgeBpppmopXnc5X2moW9k77pOjDMHD6qOyWC6enxZU/9tzazZLh5i309ZGv0HQVCAwmzmdwx8626FoJhKTNLHYMtfxnwsXwp6ljkz9QHMyzHP3s4q3lXAD8fmHxvCqDDgZShYo+JR3KJpVlbw4XA9lyVhtigr8dYu9nPklt7I2KmpnBxX2LTARp1SUW/6t4pajjahwmB2bBgKl4Zl34y94D4w3ASbjh2fgatgHaz7c3BVAclu9G/klUAymthlbhSvwj6I4t5rFUQLiH7hKR3o5UE2tnI0Kjc/f+DpR1/ma2sw3LS0IN8pwG50vsmHjM+US3674gEULwT0HUkcyHC91uGRkDJxJa1eHjeD8UKLbwqUwd36qC5rrZdKSqHESLlc+BKLVl/TBBoo+lYfUoMJ8Z8jvz6UDCR1FjVeMR0Po7uDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(6486002)(7416002)(8936002)(53546011)(9686003)(85182001)(33716001)(83380400001)(186003)(6506007)(86362001)(26005)(82960400001)(38100700002)(6512007)(6666004)(8676002)(2906002)(4326008)(508600001)(66556008)(66476007)(66946007)(6916009)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNFOEFHMXNyQ0JrSkNnMzF4KzhMSnlscEtDZHRTRTE3Z2lDVzduRVB5NDho?=
 =?utf-8?B?TTgxd3Nkbjl6enMvYTdiTXpkbVY2WTNwUE95a0o2MnVELzhEQUsyVDIwV3dv?=
 =?utf-8?B?cEpYcjJkYzFTczVxdUFXR2RNZHpoRzAwQ3ZqVkg2QnRNaTNua1hIUTNvcUgr?=
 =?utf-8?B?aWhTZTRkYUlPd0ptR3V1K3o3U1RmZ1lDTncvQmJPTHAzTEduclNzK1pVTEJp?=
 =?utf-8?B?TjlXR3Rla1M4R2xmWjdJcFBvaVdZVi9YMWI4eVpBR2N3MFprOEdRZGhqcEQ5?=
 =?utf-8?B?ZU90UmtyVHV1ZG1RZDVMOFV4bFgrbSs3TnVJOVhCaFJ6Ni9yYTB3Z1NZVlg3?=
 =?utf-8?B?bFY3MlVlZVp5Z25tWUU3ZUtESDl1NmNoNFZNNG84R2JZajkrbkJaSVNEcUs3?=
 =?utf-8?B?U014blJkWERYYWsxYWVuTzcrQVhmTXFzWW5ldy9QTUhHNmpYSlg4NXhBWlZo?=
 =?utf-8?B?VXNlSng2VFlkSEJPZ1UyNUVaNi9WRjRwOGcxK3lncVlSYXNmUkZDdUVsMVA3?=
 =?utf-8?B?cWZ3RlFmQVo1ZWZkSjNGT2MvR2VTZk9kQk9tcWpNeVlTL0NQSjZCbUFpUThj?=
 =?utf-8?B?UE1uVGlZRFJ1dHltUzhIclpmWjR3bXhBMm9HZE9aaFRWOUJSc0lhb1kxaFVS?=
 =?utf-8?B?OFNhNkYxTDhIWGJ5Z3lqSk5QTElFMzRHZ1BhSTJpVis2bjNUVlAzallYRUZC?=
 =?utf-8?B?eFdCVVNodjFQSFFYQm4xRTBnd3k0MmJBQTlqVTdONUk3d0tmckw0OGk4eGlN?=
 =?utf-8?B?VkhOSUJhWFh3Q2lFUzFnczNYQ2I4dCtUK3c4dDlzSmc0NzZ1RGpMYlpRVGZu?=
 =?utf-8?B?RkFJTmdBTURwRkhlTVRjcmZpS3FybUJtanZGYkVSRjhlRXRsa1JXSW0xaFZL?=
 =?utf-8?B?dG9HVGpOZU9ockR3bndoTG5MMTljcGRYZVBUMHJWSzB6Ylh6elNxcGMrYkg0?=
 =?utf-8?B?WHVzbzhhMkMyWjBlLzRiRzdoWXNIZXlzUGRaQVV4YVNQREhsRnpWRWJrcmNT?=
 =?utf-8?B?Yk5pNi92ZUhDbTZVQnF5RjV2RklmVEtiZWU5aE9jZEN2V2JHOWRiWngrNzRF?=
 =?utf-8?B?VUdFbEVFYmRNVXhlQXRNUjZPSkFrV0pmWHFhZU9tYmlNYlF0M2lpQmp1cExz?=
 =?utf-8?B?cTdZQ2MvZlJYdzd4R1BQTThwbXpqaUprZTNTa25vMUc4NDRWUlVGRytMOGdz?=
 =?utf-8?B?Y0M5N2V1S240M0xHTlkxMlltM2k0UGIzQjYwc3hHRjRQOXg5V3ZuRzBkNzF5?=
 =?utf-8?B?cmxoc2UyUFM5VGRUeEt0aUJZY3p2NUNnZ3ZJRm9WY0tiU2w4Rkt6R3Z0Z0Rt?=
 =?utf-8?B?ZzFna0RDZGc5TDEyK0UwUnIvcTZBNHMrN0lIS0hTNlY5cGEydDFYcnVqelkx?=
 =?utf-8?B?MHJFcklSOGdKbDVJWTIrL05DQ290VG9KaElmY0ZjMTEweEJZa3VMQ09MYk9W?=
 =?utf-8?B?aGxyb1E3Y0pmTE1WSGZ2eW5BbG8zdzMveVc3bTNoajRDOWVkY2RlaDlwdjJZ?=
 =?utf-8?B?UHpGdVBPQjlqQVIwVHBFaUNRbDEreHZPWTU2RElFRFRYa1RFN2FRZmhyaE5j?=
 =?utf-8?B?RzJsVE5la1ByN2VUbHVnMDA1UDZDMFEzQlRsRGxycVpBYTJISHdkRU5hbWlX?=
 =?utf-8?B?Y0pXUEZTRHVqYitwN3Bsdm5ZdU12K2NoaG9NMThZZ29UTENrKzI2WTBKdHpM?=
 =?utf-8?B?MUpLTmxKZ3hxdUxYa3dCWVJrdlVlcVBaMmREcG5qaldtNkpVRURkeGlkdGV2?=
 =?utf-8?B?Yk13YkRIMmRDZXJ4TFFmaXRQUDdRODR2SzBDbDJhZXRTZGU0c2FBV1M5OXEw?=
 =?utf-8?B?MUJleHZEazFuaXgySUZ3eUhtZVhBcWxQNmNTTTRpZFBITkRMZzVqbjREcXRz?=
 =?utf-8?B?MFZsSXNrSG9mMSt0OFZ4UHZPSEFMRTBEQmFmUHNKWkVjMmlaYjExbTArdTlE?=
 =?utf-8?B?NlpsYS9FaEwvcEhUVllHc0YySEljWGFtVHVOMHMyOGU1U00zZDlsRTFORjl2?=
 =?utf-8?B?Ymp6THJsOGVWeU9ldnIwaW0yRndOamhzRTB4Sy9lNlRoWndUWmk0ZmZtUm9C?=
 =?utf-8?B?dTdJMFE0eXA5bG9wYWpXVTRiOXo2L0JGN0V6MVFOc2tPV28zdzZEbEdlQStZ?=
 =?utf-8?B?MW5GU2svN1ZEcFNLd1EyWVorelZ5V09YY3hXZElyNnBLc0NXeDdiclhyak5l?=
 =?utf-8?B?TWg0ZitnZC9SQXZtbnhGZmk2cmpDenBodjNlaVFWR2hwSW0zSGFPeHU3cTlK?=
 =?utf-8?B?NUtxOExvSUsyV3VndHphRWtrRytyK2xMbzRFMjk2T1JCcGNRWWZDdEhxMHJl?=
 =?utf-8?B?NWZPa2FCVGk1M1hLdkxYMTBqYitCQU11TVBZak1rSGlDSE15aGtUWkhSQ1VI?=
 =?utf-8?Q?NuwJE80hO7muMaRM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95f10d1-fef4-4aab-5775-08da26af1422
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:31:02.7460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCjBxw/rI6lzxJ2M4c4s7M3VuUkeTcJoBvf5LwzoSjnDVc/qQo3F9VQ/PQKCBwl89lai6+4a5Zqt72baqPnVBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5234

On Mon, Apr 25, 2022 at 12:53:02PM +0200, Jan Beulich wrote:
> On 25.04.2022 11:44, Roger Pau Monné wrote:
> > On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
> >>      void *va;
> >>      unsigned long start, end;
> >>  
> >> +    if ( xsm_set_system_active() != 0)
> >            ^ extra space.
> 
> Hmm, did you mean
> 
>                                          ^ missing space
> ?

Indeed.  I was switching from a different code context and got
confused.

> >> --- a/xen/common/sched/core.c
> >> +++ b/xen/common/sched/core.c
> >> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
> >>          sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
> >>      }
> >>  
> >> -    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
> >> +    /*
> >> +     * idle dom is created privileged to ensure unrestricted access during
> >> +     * setup and will be demoted by xsm_transition_running when setup is
> > 
> > s/xsm_transition_running/xsm_set_system_active/
> > 
> >> +     * complete
> > 
> > Nit: missing full stop according to CODING_STYLE.
> 
> Not really: A single-sentence comment may omit the full stop (while
> personally I agree a stop would better be there). Instead starting
> with a capital letter is mandated. 

Right, it's a multi line comment but single sentence, and hence the
full stop is not mandatory. Sorry for the noise.

Roger.

