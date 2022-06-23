Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D57557A51
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354908.582266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LwU-0004F3-W5; Thu, 23 Jun 2022 12:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354908.582266; Thu, 23 Jun 2022 12:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LwU-0004Cb-Rt; Thu, 23 Jun 2022 12:28:14 +0000
Received: by outflank-mailman (input) for mailman id 354908;
 Thu, 23 Jun 2022 12:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vof+=W6=citrix.com=prvs=166aae13d=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4LwU-0004CV-31
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:28:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1286419-f2ef-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 14:28:12 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 08:28:05 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BL1PR03MB5991.namprd03.prod.outlook.com (2603:10b6:208:31a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 12:28:03 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795%7]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 12:28:03 +0000
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
X-Inumbo-ID: f1286419-f2ef-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655987291;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ACNoGY9qRBAQJqGJRzuBfYMRIf6wqdSnYH7w/1bMUd0=;
  b=ZoLTFcgpPnj23uU23T0kTGMgW2G1t83CZ5MZzmIOTwhIsFjLGjaV/fmU
   JBBgYNAZNVFBU5UhSMuvBeY4zLFdQzZiw/b7o9aFI5fRdtVtiLbQ3deo8
   +tppmgDYtxfEBOK0AoT9JbKEuN+c1O2WLeF8w1qt/7as7AHy/UfWGmcKx
   g=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 76821657
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yu/scKpGnli1/oPwGDRDOt2sZa5eBmLsZBIvgKrLsJaIsI4StFGz/
 9cnaN20SrzTNTykP5w0PZPnthk2DaWly9drGwY9rCFkQiIap5XLWNjGdkqgYnPJdMaYR0ts4
 p5ENoaRJpttRXOM/kunbbO//Sdwi/vQGeOtUeWeNH58T2eIJMtZZTdLwobV1aY00YjR73qxh
 O7PT+3j1H6N0DIqaTpEtv7T+EMwsKT4tmgR51ZnaasW4w+FyykeAshOea3pI3XGGYQFReTSq
 8QvbV2aEsE12z93V7tJR56iKhVirob6ZFTI0jwMM0SbqkAqShYai87XD9JBLxYN49m1t4opk
 o8V68brEV5B0pDkw4zxbTEJS0mSAoUekFP3CSDXXRu7lhCun9PEmp2CPWluVWEq0r8f7VJmr
 JT0HAslfBGb799a9ZrgIgVaambPG+GwVG8XkikIITg0lp/KS7ibK0nBzYcwMDvdGqmitBsRD
 iYUQWMHUfjOX/FAEmYxE7MeotuavCW8bA0CgnG/t+05/kGGmWSd0JC1WDbUUvqjYJwP22On/
 CfB9Wm/BQwGPtuCzzbD6mirmuLEgSL8XsQVCaG88flpxlaUwwT/CjVPDQf9/ab/1BD4B4w3x
 088o0LCqYAd+UuxQdS7cwC+pHeclhUdR8BRA6sx7wTlJq/8vFjJXDFaE2EphNoO68ZsSA1z9
 WewuNLOFSNCrKObcFW6z+LBxd+1EW1PRYMYXgcGRwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0AWm7QWpd4G0eO851+vqyKhoN3FQxA44i3TX3m59UVpaYi9fYuq5FPHq/FaI+6kokKpu
 XEFn42b87oIBJTUziiVGr1RQveu+uqPNyDajRh3BZ49+j+x+nmlO4dN/DV5I0QvOcEBEdP0X
 HLuVcpqzMc7FBOXgWVfOupd1+xCIXDcKOnY
IronPort-HdrOrdr: A9a23:YEZiQKHM9r6Gyy81pLqFSpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcYtKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAudD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dl8awTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontRrcZrau5h+7f63+40owwbX+0KVjUNaKvq/VQUO0aOSAZAR4Z
 /xSlkbTp1OAjjqDxyISFPWqnXdOXAVmjHfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFj9dYvGlqr1v4EDrDvKnZMOq59bs5Vka/pXVFaRl/1rwGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlOhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OHDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkow1Lau3iefvFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vdvHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.92,216,1650945600"; 
   d="asc'?scan'208";a="76821657"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaxoRqBoNdDARZzvlo9bNLRd3U3yLSLRuxuH5rI0YA2KM82fnrWXXEBF1nd1Ht013ipkncd3An7RfBFFShqOWfS4ezFNSyJjtNCEQTIf7eEWOuCCujrKfOpLAnOrsfUhj6VGzBr3v3yYs7hAg8c7WbYFHvcX73Rc1NGwubWAd2SVplf2aUYR7i7cXV7WkxIWga0a6jEL6U9IqpR2wjoG8qFpPYRTCQFhumVA8S1tLysNkfqlZgmcX+VvxOR7H1KRzNRA7hVSSo+8aNLS/e18Pcdv4Uqx+dUvE4C6J+GPoMF4de5SX8T90t7/1Vpeoj7rHm0GfZQzDiTSaJ09voIvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w5PMtG+7N4IHxxO9Hr8VGZOpY7bYKRhGOV8vf82b3c=;
 b=GGKJFcW7ZSg7k+g5M1wu4eVSxcttMDerTapiujXqIfUTsMaMh36d4osmtQarO9W/GXDdui9VmEhDw2MUYUZPdnxB6AJO1Ea4zsWkc+6Htjbe/MU9/mqGfTRzizumYtwm1WgVW/4oq29e7HKi0V/I3aF3qPngj3OKDoEXgyfvDt5ZLRCwP2qR+iqzz5hqEShYQ0FgRKQCT64vgcafBi3YgD0LGd1u8rBjbM1w8azRtCTSWtMwVqXqalBtmusb0IyHjKXUlM77rxYp27Zkf1lgU5XA6V9axiexChsV6u9sTGlnE0LdC1U22V2ALlGIOusbswveGXa9HRIau4AXfYM+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w5PMtG+7N4IHxxO9Hr8VGZOpY7bYKRhGOV8vf82b3c=;
 b=Txq4SjOYsEhK9Ej6x5RPtHqgzLVcndihPfXiqDJ75XUOZXYPt6l32L8LzOgxXD44E3Z4vROV0RXmjnREY5j/oesJ5QH5JCeRQGM1vyEHZUpfoRekVYvPcWaD3T8VSmeakuv+RgN0CPMoDRX7lygCF8yhNJHE7LAq3XojFDNgiPY=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/2] x86/P2M: allow 2M superpage use for shadowed
 guests
Thread-Topic: Ping: [PATCH 0/2] x86/P2M: allow 2M superpage use for shadowed
 guests
Thread-Index: AQHX7O+Zuhd13MkDA0i1XG8QMQlRG61eF6gAgAAHz4A=
Date: Thu, 23 Jun 2022 12:28:03 +0000
Message-ID: <F9BEFBCF-F4E3-43C4-9BF9-87E5FA36637E@citrix.com>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <5a8a8f01-03cb-b84a-bbca-9c5f6d2ea9cc@suse.com>
In-Reply-To: <5a8a8f01-03cb-b84a-bbca-9c5f6d2ea9cc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 246dac34-3114-44f7-9a2c-08da5513d19e
x-ms-traffictypediagnostic: BL1PR03MB5991:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <BL1PR03MB59919199D2C19A4C584160BF99B59@BL1PR03MB5991.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jYCNqKR8xaAoEaNNgje5dAUPWeukn3iB/qibT4hU+kTPOYUDcKr+8zYPbit6wmvXUBuzO7/ImSKzEqpTN2swbN15S62yIUrxMjlVdSyrgBtEPi7NSmesyVp+123/6jNLb7NgLqE2UhQhQqQZYry4qYbkgvwukFxMRyL36oNo/vci61BCXvUglg3jWelvxfkcq6Yy8RKapMcpnHMm7uo/JqZdqLNUrHDJrFxmwEsOAGLam06ntfSVyUrPpVFCmsRLA/2xfg9vrQYRhVaxxb+CMO5wQQX0pziJpBoVikbV7aQTlADDG7W6zPH69KaWVh6ZCRLHAxOGIc7SINrD4ShCQFQHzqlffA6712INT0KNt4fW+HoccnGYlYTVo8eI32wn9cZvHQJxbqaBzfq3QkuES4S3kfJFoc/CUaIcchtDAKeIjA2HtG480zrJe49aa2MYFgfNP3qL6c3GoyuCobisH9XuY7hKLYbw6nIlZG7Ob6sCEkS90D9Wmcil0aL1YXfYn7FYJM1xWGjVlOWLcKhPBxfkNhfuG0+06R+uO0gwjvKYFNcduYQ63rIixkS/nIry0MFvhx+j24ohNtsAisYQtWeSbwhVOIpqFZHQ6ryRtZc+2tdMHupx9Q7WVNPPyaazVlTBZbRXxKo+0Qfb5/d+pjDp+8stiKiH8a2xzGuzQqokUth5AkvlDGf2ZuE4m2JBFBBcamMQTXnte9xnAdXx95hYq56OP8hSMPVWpuV0YlCwnhq2AwRFc6DHjcxb+0Jp7PxDqMdSLp/bU2XXRtv+gHWERK3vz/vhcO4C9soSf+s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(54906003)(316002)(86362001)(6916009)(66556008)(6486002)(71200400001)(53546011)(122000001)(8936002)(478600001)(5660300002)(4326008)(66446008)(8676002)(2906002)(6512007)(36756003)(4744005)(64756008)(66476007)(76116006)(41300700001)(91956017)(2616005)(26005)(99936003)(38070700005)(186003)(83380400001)(6506007)(38100700002)(82960400001)(33656002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qL8E1whH+rfvFk9VOIyh63b8JB9FdzJ9Y7dF/38qTCNxxl4kiXqTTjcMZLZg?=
 =?us-ascii?Q?JSnmmw6vNCktY/QkNEJdF3ad+lgbZcNvLyiW5hbfQ3NbvCDkPq8QZ8htfR5f?=
 =?us-ascii?Q?2XsetPcxBBl3sjDnKzL0CS3+2KxGdpmO/avY9zhquNaFN2gf8/DzCd06NOYm?=
 =?us-ascii?Q?OE9E3RzsrEOy0DK8063yeWawmFmh27M6s/sjKDQIVtyxuVotygZ166lPdPum?=
 =?us-ascii?Q?8+tD+yPgpp0LPGyKI5jkRZbqsbEUhQjafLB7FdlroMlgBfBLFAiOX4QR1yqZ?=
 =?us-ascii?Q?H+mCWhqsNZ8mChUkwUez6tsiofndoKxypAazlU10M4jEQvHSqMrzY/yjOj5a?=
 =?us-ascii?Q?RI766e1uTmkLDkh8B7ZkXkGRNZiuCuFieFFtY5T27ggUaGZMiAHfYfX2xiC4?=
 =?us-ascii?Q?HpeOp9pdNzsCbxu1KcXWWF7VDCJ20zRrL4SyM4P7wCvJZdcUktVLfemAQ3tz?=
 =?us-ascii?Q?WWhqUb4WXlvnPrDhfWQHtCe1Ig0Xge4fGHVj6u06MbmWrG3CdvRvNE9Rik2z?=
 =?us-ascii?Q?/PbZ0eL3KGvcpE3YulNl9l9rLNP767fmAIVLaaz3PSh6VQHcFNjOVl37hl2z?=
 =?us-ascii?Q?dBmvPrtVbX0m/rqD4N9zfe9uWSiEOUMNG4CXG+DnGxHw4ZSdU8k8PSlyutUd?=
 =?us-ascii?Q?PT8Ta8/hmc1GkAlTGxV0g0HxdAuUpGsKF892P818VEtLtxkc3qThv+20KyVb?=
 =?us-ascii?Q?kMpkyb201YrMhwVCFnA23pgfvVl9hjFml5M+g7HrSSab2lepu2DQAb6/arq7?=
 =?us-ascii?Q?68unxtLoIuQK3k21P2GsfryM4ybfq7JYkrEWBfiB8GB1wRGujr2oKPLysyrF?=
 =?us-ascii?Q?0UdC6NW6jmkILP/7KWuTI6WkUC3I4+cZIryp9UjpooJso17ql3aRwS1H9c7W?=
 =?us-ascii?Q?QOAKEBpSzJwvZNEXbnZASTWEulj20QYZe45B7oELdcgv5H7f0FaDhh5jN8Au?=
 =?us-ascii?Q?BozUm8c7d+YxAuWyNcPOAcPHapbooEXGtDTo22RdH8gVL6j1if5n4Pe6OIbU?=
 =?us-ascii?Q?MCfZaLNjV5z4U4UTBapeV4nQ5mj3nH/OuSy7Bo0GjH/uHVrXWHdBVwXSDa7/?=
 =?us-ascii?Q?MQDeKOM5GBfffNlD88Ue23MIyaacBCorlh9rqOu1Aw/OZ7IXgCUd3OgP4n6q?=
 =?us-ascii?Q?tBznTbp4uTDtKxDY2AXzrWj0rLhgKpccmT9QiudBjQH3SyyL9uHpj1bK4kti?=
 =?us-ascii?Q?vFF5qwCaygjBW1aKabM0lr/8VLBgWIPfuDocFJtMtmvyyorkSEFFeZVT2Hcc?=
 =?us-ascii?Q?T7CXmuiv5KZlrY46xuAoqsvsbTf1PPhY0exL81vDBj3jI1TcrDWh2DuMP7oJ?=
 =?us-ascii?Q?wSJKYvBexQn1ee7ifGxbE/2iqEcYwle1LIbptb3aPjVHfW/14lrZwAOb8x8j?=
 =?us-ascii?Q?rpDLAjgt24HB/QcX0leAD0MzGxhiuVz00dyjVi1Ax0G5J1+jTVV62LG1s8rr?=
 =?us-ascii?Q?6VPmmtjZISL9TcK0dicPnqu/x9BEllnncUaDagbsrByYKbfRkcgjgK/Gm+zt?=
 =?us-ascii?Q?O5rszdCJLhGMrLwFgdishCIGL4i9cY7aCiLYDHlD4MMeaCuyrz1FmO73nrUe?=
 =?us-ascii?Q?8Z2Bfv/4Zy8/9ToFEPXkOHEssi+ob3mvXfCQO8rHZIBeK/BREYZ2nmbnZeWl?=
 =?us-ascii?Q?KQ=3D=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_72AB159C-5944-4604-9B63-60B46667403F";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246dac34-3114-44f7-9a2c-08da5513d19e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 12:28:03.5762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e21cAiBNyFmhFb0xtso0lyvw1ABdriBEEpH6Ud05u4xE8EjKruqKm/JA6LF3jV4yXzO1n/3mXOeQrJwsxrH/qSH0qTYwWVi8Ulo99yCNvE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5991

--Apple-Mail=_72AB159C-5944-4604-9B63-60B46667403F
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On 23 Jun 2022, at 13:00, Jan Beulich <jbeulich@suse.com> wrote:
> 
> On 09.12.2021 12:25, Jan Beulich wrote:
>> I did notice this anomaly in the context of IOMMU side work.
>> 
>> 1: shadow: slightly consolidate sh_unshadow_for_p2m_change()
>> 2: P2M: allow 2M superpage use for shadowed guests
> 
> This has been pending for over half a year. Anyone?

I can put it on a list of things to look at tomorrow.

 -George


--Apple-Mail=_72AB159C-5944-4604-9B63-60B46667403F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK0XE0ACgkQshXHp8eE
G+0eDwgAx4obv5fxaCMUI4H1FdU1LKyIygBUhyMEE0CYz//F/DX9OdP6nAGnqzm0
MPAGiddXjECiTJ0LXJKlgYWrhQEO0XCk2QyylRYcmQxpdsUuJWLU9EoWZhv1JXU0
HFqxMzpg76TDgNQtyCXTWq7cPLNJZP3s+KYIASk3Tjh5q0vEnzQDbXDFY1ckQ2YS
mCgI1RetmVRm7Yusmmwr+cDBh3tjtI4t8l18FEKpDDxH2Mer9gC0dEhfMv3ujIGA
/ISr10dS1D7uF2W0GW7yaIU8HUifQohIoWdtFHvQkuY2QY/rcY0zOxe3zSGNMGJb
uQ/ZqqaIODE9F4TNv4EnHYEanmgExw==
=a+pp
-----END PGP SIGNATURE-----

--Apple-Mail=_72AB159C-5944-4604-9B63-60B46667403F--

