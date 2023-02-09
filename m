Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34611690797
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492379.761899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5Hq-0006o3-8D; Thu, 09 Feb 2023 11:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492379.761899; Thu, 09 Feb 2023 11:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5Hq-0006mE-4y; Thu, 09 Feb 2023 11:40:22 +0000
Received: by outflank-mailman (input) for mailman id 492379;
 Thu, 09 Feb 2023 11:40:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKFD=6F=citrix.com=prvs=3977c2bfe=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pQ5Ho-0006m8-B5
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:40:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 858b44a6-a86e-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 12:40:17 +0100 (CET)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 06:40:12 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by PH0PR03MB5926.namprd03.prod.outlook.com (2603:10b6:510:35::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 11:40:06 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%6]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 11:40:06 +0000
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
X-Inumbo-ID: 858b44a6-a86e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675942817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PF7vTThuVCOAUt/1NEGOBbhrKn/lQ2AKokltyd0IAj8=;
  b=Yt7phZb121aADfszvWt1jeAPfykc2S/p+XvF4XV3e1PvjYCA2wfm18t+
   BMhkalEMp1YTJDY9c0stYMkDxkHSREc6cyJha6/fl47g2vAWiyVFZe2pE
   2pUgGTLhXxFtv5PN5p4kSvqgEPojAuhqdfDjxh4jTHe7nYNAbD8qiiRft
   4=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 98768532
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fpL92aAugFdMkxVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApGsr1DUPy
 GNJCD2GbKrZZ2TyL911bo6xpE4B68eExtIwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlA7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw//1FKl0f+
 s4hCgsBTyCogbPszLSQc7w57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzO7IA9ZidABNPLPfceRA8FckUuCu
 WvC+0zyAw0ANczZwj2Amp6prr6fwn2rBdlIfFG+3uFTslecwE0zMQ8fcEma/fyplmiEX/sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwAOQzqvZ5S6JC25CSSROAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpcsC1qH+91aYhTup/8DNVlRsvl6RWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:Y/L+MaltmHpyaepdFoaH10bDsoDpDfMsimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIa7Sde9qADnhOZICOgqTNGftWzd1FdAQ7sSircKrweQfhEWs9Qtr5
 uIEJIOauEYb2IK9voSiTPQe7lPsbq6HbiT5ds2jU0dMD2CA5sQnjuRYTzrbXGeMTM2eabReq
 DsgvavkwDQCUj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrAHx2Rzn4lIkRyKeNJyw
 n4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKx334zzYJbhJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt4Q/9yzwjgkWSh2NwuUGT4fAReQhKR/apxLgpPycx0nBQ9u2UBZ
 g7kF5w/vBsfGr9dCeU3am9a/glrDv2nZMYq59ns5Vua/psVFZvl/1swKp0KuZ3IMuo0vFvLA
 ApNrCW2Mpr
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="98768532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFh1bluAtKMN5eV29zapSuHwobx81LvXZfTRDHTD0+vCBgXdbIraWlyjA7C0RuVaF9/n9vOlkbgLwLVuhrrK4kTp+r6LouYcuOCLFEvQBdA2AiLJvIr29ifii+SJBRS1aINSp6TPlpOjLRJO6ASRFwWIru4SRaddEMUL0o8Vgp5UoA6ejdSHIthYkS4OGEdTLW9c70kfgQMlhVqsGmmQUOWuVigQAH3ekbSHf13zpGUC/uoIGmY7JTr7ONo1H77Pw++jP6+M5TImdmR1xRmv9LwyfRwz8YPyHUGHuCyq8E4QZimuwaXkEJbmRSP87pc/rPgTUjahnSBGsV/KjKgjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PF7vTThuVCOAUt/1NEGOBbhrKn/lQ2AKokltyd0IAj8=;
 b=Qpxf0Ejq5D31Oyc4xqeRh5drGG+lEhzPhivbd+U0Nc9UvpGAmfYgH53rkummTMT8MLTVMdNa/Vcjfkya4X82ZJ4WICqYuUrCMCUMYKWYJquO0JI7ZHpZeV8uPg0AQq5JgH455pfoMEZAQ+qKN0XHRfvFEXiFNkTNHaIsdWJ3R71UEffKOUefC/WP0tTbRMKAQCptZEFzXbVgqrgtl9UOoWjPsJze0uN95Mam7p2yvxJ69/8lUlA583fT+ghdw3XtqtfCO87uPIOCDLbmR9jNeCH/B2U56JaIGvzPSCe6eYz60dWOUzcQI/0p3ltrZ0hnsYHxwgF9AvDJNGVybQFKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF7vTThuVCOAUt/1NEGOBbhrKn/lQ2AKokltyd0IAj8=;
 b=gHWHE2581p/ANInrJ3csNJqb4osTYqoZOIxeGerVTHLWJr6fDAY48dCxxPDrfAf2mP5utAsBcsG/IhZqo94tizg9BDc+tsDiFzIIFc2d0nTMvnOJWoCBQqtmLqDZCPBD8SAZXvVCW5AWWG02Bl23n+NbTeS0nP9ld3hUkZIuaCI=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: Make FILE symbol paths consistent
Thread-Topic: [PATCH] build: Make FILE symbol paths consistent
Thread-Index: AQHZO+JENUXJLbr7Kk6Vg23vMgRDg67GTYoAgAAe+3g=
Date: Thu, 9 Feb 2023 11:40:06 +0000
Message-ID:
 <DM6PR03MB5372B779A85FC592E4FE663BF0D99@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230208172416.725028-1-ross.lagerwall@citrix.com>
 <6d281c88-83a0-ee86-18b3-6c9d856a0971@suse.com>
In-Reply-To: <6d281c88-83a0-ee86-18b3-6c9d856a0971@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|PH0PR03MB5926:EE_
x-ms-office365-filtering-correlation-id: 09909d5a-fcdf-4157-683b-08db0a92642a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MTNkqrM/5IOujEEx437cFX7iKcbVS3s6vznyMInzymNF0ahTEfS9I0E4E7IFFagIFd9Ee1JLu/j/x30I9QZlDMSNZKl3fAgFjEHB9cwOVUPl76+zcHfIHizm9OP60oY1jtrK3vKT8yq22ebIp4vBVBIYJzbA8u7VfwNmU2Z/ODA7HcsYSGsGjcvCo/BwdUKJi7Y4P7ffGMmuCk5Q49xtfdGfy2oruHsv0R8t4ptFPhJpGg7yV6CNMmcW/Xo6NDAqa5E7sXhEIUo9yoLqGsioygfwEM1X40kKltCXHHYu7yclb2M9TJ7gWmz3ykk1FWW7mO7zjw/ozmmL8se+6Oz1Z15/MP8D57nKWaoWtSxvuz2SXV8gv41E3dCfqJw25N4Fs9aoCmLlz12LvsgqHcJeLMCfymRB/2unvl07YaQYY1XrzUK6PThz5iE7nFizeRLDtfEoOTYysPEy2Nti0DuS+Z1RfGRmuEn0xJ2uSQNeC5AwTm2+VvZ1IwcAz3iOBAEjngzLqFVHXhDp6jKfHCl+bQPMo3JFCCJHTR2K8ooa6CAsVGkgZSv1bTpVXwERmMJVTuEO/U1gPRttC/CCroVK3zaW3+wGhZQ+kCnjcCOMCVzssd2LorLw0TfE8XA3+4Cd0liu9IWs93Kxr6p/8DsWkZBaUKaRqCOideZXk31vZ5X/vk/g0IWjw/pI0Hk88NRrch9A/KwBkbbbeZqCVCPWYw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199018)(33656002)(82960400001)(38100700002)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(122000001)(55016003)(38070700005)(53546011)(6506007)(186003)(478600001)(9686003)(26005)(7696005)(71200400001)(54906003)(110136005)(6636002)(52536014)(5660300002)(4326008)(8676002)(2906002)(316002)(44832011)(8936002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aRWcJ5w/myeQ/SIxG+aM4dCe0/BS5ZWpcK3al7MhzNoyEUUT4cK5Xp7qP3?=
 =?iso-8859-1?Q?6AJk59Q4BQVB/fruVf6Dy9UoirLO2D7DG4TGL1hMM5Md0OQrjlb00QJEts?=
 =?iso-8859-1?Q?KPxXJewD1qW9S1+KTGTtVb1JT3PVwIzzCVM7dpyu3+vxGakt+uyYc0rW5W?=
 =?iso-8859-1?Q?pf8JXu5g18HVQ50avk4ddR9hkmklTHl1cm7xmVvtq5W5AtrtaDHS0NAfCM?=
 =?iso-8859-1?Q?cHO3aiR/La/omQ9s+GZfwea5KUJMnM/JSizjTZmOT4xfuI3y4o9f/VG1Ct?=
 =?iso-8859-1?Q?Qmh/SFzntfQSxBllatIirBWj7rp241lSUDbFMIZYKKn5YULq9ZD4rYAFW5?=
 =?iso-8859-1?Q?GS9+Es0/ocmH1i2nGmO4ubS+2O+A9oAzstVqrQvDWTxm8MlY9ESNqvsDmt?=
 =?iso-8859-1?Q?1C5F8RwC0pfmdvbU6x2tCh10oKQRdKSj8nwu3ufRu92N1hyrB/EiL0qmpI?=
 =?iso-8859-1?Q?iBK/CxVwFjO5Gfa6UOFO2WNK6jqQnnwvo5z/3R19cOWQnx2v6H8UYsKxt/?=
 =?iso-8859-1?Q?MbxeTDe1CDr/V0uRjT2svQumu1rKvjVNhEodw5NuLDWYiFilGl4bn+4Awh?=
 =?iso-8859-1?Q?jnNtM2FlE6+sX9HdloX1KWZIPuak2GwPy555GAwXqZkVQsqTJvgJ9rfRE6?=
 =?iso-8859-1?Q?qXq8huZwEYd6L6OSkm0Xz3H4cYvtj8WFnTWa0TLTszumviPpmLttuapxB5?=
 =?iso-8859-1?Q?PJ7Xlblq7zv6kwO9UQ0oZGLXMZHblKcdVWBuzIwiaSNAvXKr2wXym4xNhv?=
 =?iso-8859-1?Q?qe1DVYy/SNBpzwB5H/X8YkvDv1eU3WodaCTsYRdcazXG0bHPCKagWZKbLW?=
 =?iso-8859-1?Q?nAtxdi4maMKZzrrzLfGJupqBAAnMRN/JdHi7vSt/CbU/pXmj2jdYr/tET1?=
 =?iso-8859-1?Q?8MxZTJl8lDRs6XGIWy1b6YGkbcJlFqynAw/paPV/tqreFVaaUc7NzSNQjc?=
 =?iso-8859-1?Q?Tiv4X/YCwpJoUwOR7H2/PU4mC1a2H27/IV+/RJZkLEJkC8aODbLJMHieti?=
 =?iso-8859-1?Q?i+jjWm0PGp2tctaPSQcc7dNg+cGcNHOPW8XtPRWzFPNKnjjjGD7wC2aGrv?=
 =?iso-8859-1?Q?BiGjEomYbexvrRh5ZuWYra5gcJHnJWbNif3pTxtA3pgUGhvs6lXbP3O2+3?=
 =?iso-8859-1?Q?toa6QfeuJsJORGFGIY8JTMbJIIbOTmutrVFDVF3YkE1bz5yaOLzHNUh1+H?=
 =?iso-8859-1?Q?pJsF9MsNT1dts2rtf1u/KN6sH/F0tnXfErUfL4jUTtRIcsYONz7spDuo2s?=
 =?iso-8859-1?Q?he3uDTd8JisSujMCqDlwN+2v5g/WgFaUYUYmLpxRX8PSS+eNxoD8qp2wDY?=
 =?iso-8859-1?Q?cH8BvasFf9759rWLrnKULXeMQ05hV1tk/+1plQszdCVjQsWfIPrKFeSk2b?=
 =?iso-8859-1?Q?TpjA/QE0/dFDxzsokYnt6m8esSOb4p050dnHPEK13Zr28pCkOjL3c6RzXE?=
 =?iso-8859-1?Q?MNGpixOn+/ERF4JKpx48kvxU+OkYwiBGVqCpBxRBsZgQwujPZpfLXb/g6E?=
 =?iso-8859-1?Q?SyDdvRfzMykt0PO0uzoqEYBbZEPaGsL38HSzFg9ocHODZuflqNsme8xgbE?=
 =?iso-8859-1?Q?QJFTdgfeGKqs1tAcUzXMtAZaa/cZgMQ1t9stK/LiEzh8AsGuerijfTPRAK?=
 =?iso-8859-1?Q?c8+7eWLq7axAbUaQNItYAt9eWerhqboVkP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WBMs+1g+W6un9nzPMoZt7DBYDqvPus6uWkshowHNGMPuakhmS3m5Hutu9LLgXn+0Mv23+TiRGqaf766L5LZX5V47fXWW9j5wLeJJ2odp2ZMxW95V+HPSsqhb/V+GvSHyCn9vXyqr4KIgJ2x0H/+bDYTAOKybzMnIE48vcGDSQO2tFo7qWHaV+u49E+i2vM0GUmD6xlhcDOIqbLcxYBLq36hFj8mv8OfF78hhrAXU3olCK0ATxGFBXx+hTGug3mQDHHMzS2T0mhkEdhY0DMpxTDS42V414NShtqpKqPgjnt1Gh7DVcPZxVLAdN5RmgPf4gclJWTw11qA7gmGFG1oVH2xZMSom+ZGlqYqvujUijim/3dptFC36EbSSxWcHplZ9cgGZI38suNdVGRrIxveFCaXdabRE/IQV05Kjog7BISxPDH16Z0n5Y30gefqLh23xge7KkTRTVNYduf038oH4d+EnJ3Fl/ySJj04lFAEhM+pSXqZKC5Y17ZVAd18OdLG7yn5gI5fLd4qFSARt6DrpBw4mFdiBocHIHiaBgAhjZVDM9TKzHilhRmslmHqW4Mlacj4v+Ionle5kdiyAW6kZp5YrEyV7Wmpo3hruzQwsUWKQAwrkNvGZNVpFG7jTJ+ho33fMCfVz68sobJ9yOYeAQ6wIRGrhL2kGJyPd/dp3rF9oHWV2LPNuyv/DMQn9XaoUs+zk1B7aRbJEj+bvuIYeOWiPQMLplsYF+b/TYk2qsfPxfqTWXaZYTJCVAad4BcroYxJEtGiKl8czF7GCa+HqY3JLyRzOLpwa/x8EWccXurh8loeikfJQNGW+wHRks7J29VkTdSC8tx7/vEWj7Q5ItPawEVfLTTn347udeNHz6sk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09909d5a-fcdf-4157-683b-08db0a92642a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 11:40:06.4436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23TbkXp/AnBnkjk4ifrl6cFPSOhl3IA2ljn7BkH4ArTqyxvkW6os9uWHE6j+kQSFTX7eAbz1LYE4k3rOFBsB5PxdtDFTvZLJ4u7rLn67rGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5926

> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Thursday, February 9, 2023 8:44 AM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Anthony Perard <anthony.p=
erard@citrix.com>=0A=
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Dunl=
ap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabell=
ini@kernel.org>; Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org <xen-=
devel@lists.xenproject.org>=0A=
> Subject: Re: [PATCH] build: Make FILE symbol paths consistent =0A=
> =A0=0A=
> On 08.02.2023 18:24, Ross Lagerwall wrote:=0A=
> > The FILE symbols in out-of-tree builds may be either a relative path to=
=0A=
> > the object dir or an absolute path depending on how the build is=0A=
> > invoked. Fix the paths for C files so that they are consistent with=0A=
> > in-tree builds - the path is relative to the "xen" directory (e.g.=0A=
> > common/irq.c).=0A=
> > =0A=
> > This fixes livepatch builds when the original Xen build was out-of-tree=
=0A=
> > since livepatch-build always does in-tree builds.=0A=
> =0A=
> Sounds all plausible, except that I was under the impression that as of=
=0A=
> 035ab75d8e37 ("build: fix enforce unique symbols for recent clang version=
")=0A=
> things were consistent already. To clarify - Anthony, was this aspect=0A=
> simply not considered at the time? What would help here is a Fixes: tag,=
=0A=
> both for the purpose of review and for the purpose of deciding whether to=
=0A=
> backport. It might be that 7a3bcd2babcc ("build: build everything from th=
e=0A=
> root dir, use obj=3D$subdir") is to blame, but I'm not really sure.=0A=
=0A=
035ab75d8e37 ensures uniqueness for symbols but it doesn't ensure they=0A=
are consistent when using out of tree builds, i.e. the FILE symbols are=0A=
the same regardless of the value of "O=3D". Since this inconsistency=0A=
could only happen after out-of-tree builds were introduced, I guess it=0A=
should be:=0A=
Fixes: 7115fa562fe7 ("build: adding out-of-tree support to the xen build")=
=0A=
=0A=
> =0A=
> > --- a/xen/Rules.mk=0A=
> > +++ b/xen/Rules.mk=0A=
> > @@ -228,8 +228,9 @@ quiet_cmd_cc_o_c =3D CC=A0=A0=A0=A0=A0 $@=0A=
> >=A0 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)=0A=
> >=A0=A0=A0=A0=A0 cmd_cc_o_c =3D $(CC) $(c_flags) -c $< -o $(dot-target).t=
mp -MQ $@=0A=
> >=A0=A0=A0=A0=A0 ifneq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,6=
00,y),yy)=0A=
> =0A=
> You're altering only logic for pre-6.0.0 Clang, aiui. This is something=
=0A=
> that's absolutely necessary to state the latest in the description, but=
=0A=
> perhaps already in the subject. Among other things that's also an aspect=
=0A=
> when it comes to considering whether to backport.=0A=
=0A=
I think that's backwards. The check is: if !(cc_is_clang && clang-version <=
 6)=0A=
=0A=
I can mention in the description that this change doesn't cover older=0A=
versions of clang (which presumably have never worked with=0A=
livepatch-build-tools since it embeds full paths but that is a separate=0A=
issue).=0A=
=0A=
> =0A=
> > +=A0=A0=A0=A0=A0=A0=A0 rel_path =3D $(patsubst $(abs_srctree)/%,%,$(cal=
l realpath,$(1)))=0A=
> =0A=
> Personally I'm against use of underscores when dashes would do, and using=
=0A=
> a dash here would also be consistent with e.g. ...=0A=
> =0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd_objcopy_fix_sym =3D \=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0 $(OBJCOPY) --redefine-sym $(<F)=3D$< $(dot-ta=
rget).tmp $@ && rm -f $(dot-target).tmp=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(OBJCOPY) --redefine-sym $(<F)=3D$(cal=
l rel_path,$<) $(dot-target).tmp $@ && rm -f $(dot-target).tmp=0A=
> >=A0=A0=A0=A0=A0 else=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd_objcopy_fix_sym =3D mv -f $(dot-target).=
tmp $@=0A=
> >=A0=A0=A0=A0=A0 endif=0A=
> =0A=
> ... the several visible uses of $(dot-target) here.=0A=
=0A=
I'm not sure if there is much consistency since other variables like=0A=
abs_srctree and abs_objtree also use underscores but I can change it=0A=
if you prefer.=0A=
=0A=
Ross=

