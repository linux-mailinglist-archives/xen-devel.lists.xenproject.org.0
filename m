Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34849532451
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336285.560644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBL-0000v8-JY; Tue, 24 May 2022 07:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336285.560644; Tue, 24 May 2022 07:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBL-0000oW-BP; Tue, 24 May 2022 07:42:19 +0000
Received: by outflank-mailman (input) for mailman id 336285;
 Tue, 24 May 2022 07:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntP6P-0003DA-Sf
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17592183-db2e-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 08:52:36 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 02:52:33 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by SJ0PR03MB6675.namprd03.prod.outlook.com (2603:10b6:a03:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 06:52:32 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 06:52:32 +0000
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
X-Inumbo-ID: 17592183-db2e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653375156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=zk2mZpUlxkSyWF7bF7XclHWxrpHIywvG2VFlvPQCO4I=;
  b=blchsjMUTNRr3wCKh/fX0V3JeeziXsiz3geNY/YDOwD1q0jFw4ZErbGs
   hkcFEWIma1SIQ2I12ttiuQxS0d+fYMTixRUqdTe83Zmx5CRmewjwiJwrN
   wHtauwUnDjXCSd8eteH3LcwnRduvbFWRCRbAiM4eYzd+XLwTiXrrQAgk2
   g=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 72027380
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FfduP6i6zloNWQAQGMu1QwlnX161ZREKZh0ujC45NGQN5FlHY01je
 htvCGjQPKyDambzKdF+bY+w/EwG6pPdxoNlGVM6/ns3RSgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVs5G43MouclaiZjTAZ0eo5r8o/cDmfq5KR/z2WeG5ft69NHKRhveKY/o6NwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIEehWhr7ixNNa+2i
 84xbTtpKhDBfjVEO0sNCYJ4l+Ct7pX6W2IC8AjK/vpvi4TV5C9B9eizYMX4QfHJY89YgHa3h
 DKd8U2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRokyxQdVEM
 GQP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/Qjvc4yADctj
 1mAmoqwASQ16eLOD3WA6r2TsDW+fzAPKnMPbjMFSg1D5MT/pIY0jVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1K5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:Q9nVaK58FhneAEQFpQPXwX2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP2ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkyNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9p1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUZpDKh8KoDOCW/sLlXFtzesHfrWG2nYczGgNkBmpDu1L/tqq
 iJn/5vBbU115qbRBDJnfKk4Xid7N9p0Q6v9bbQuwqdneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KIoM3R3am+a/hRrDvDnZPiq59hs1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxFLaIXied/Fm9Kc7gizlUSG6QSnnzN1Y6txwpqD8LYCbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208,217";a="72027380"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2EybRfkPzkjfmQI94R1a+EJuI5PZY/MXcZgNjdV/24HRQFHghX1JoMFRysKmXOVnDehySvYENdTWPRLaG6EPhnC9h5wgvd6od7k/X3LhDcUYN2FE3S7+UDVmgH3vYg/a53lFI87U8h50ZnRmjs5VNmLvVWPfkqJuMgyYE7etA3QUOM62K1ZtcTB4lex/xoRkYBrmx2v8EZwhTTN/V79EtZdwfoNLuYDG7jbUlDyZkU+VYqr/jViK91pEh09yEnWgBsVdtNwSo4ZUqc5kE+ReNuunZKIiQW9OjLXnrZDvOvGx97thf5KzDYNE7q6/R0a4rAGl5AfDCw6C2TasF9pBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBesWdDLE7XH0mMmKBbgrgVOHPAfiXnfq6JIlvEC5FU=;
 b=jrbBRAtGFO6GwcUpSCtsl/rKsojCpw1wBCm314kYFGkhKiH02mOgnLnlrgSZ8mbtVjbzQo/6b7a2Nll6obqsaw97XBNZmiAKpf8XPk+HfXwhMXd4L3VS50NH+XBDrhLsdwsm4mRh0ZUzeG2inYeF/igTp8fPdL2NgDZOfMQhTcl2gt/MP8LPjzY/973Ap0km0pdWIKibyjeC0etWnjhh5mM15bkuqNk1itVyD9JfT5gL4VOeBOAavx2RI9k5YwhBQ18kuGtuoldF3JVO4L2TCc6q6LwvEErR6tBjoyrRyRuGQNKMuOTkbxBNrqsPrYy0w6sheGrqvZinkRhWflCwmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBesWdDLE7XH0mMmKBbgrgVOHPAfiXnfq6JIlvEC5FU=;
 b=ncW+JjsS6/gAmeo1VNckF6SUh/hg9EzfFNAqauIyA2HT8+2lAk7q3UltdpQnHYoDH5MozF6CffZZZ6o0qS2rX8nQEmRikKgvyQ/Za++8qdqbu7rqmT2XQ1B4YJDWr0qIRJKXV07YSBgatzfKWiXblQvrqvMKgSFxGWQ1YYe2E9Y=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Topic: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Index: AQHYbordwufrrqV0k06ypnfJmfxjlq0sTnKAgAD4X1GAAEYaAIAAC20q
Date: Tue, 24 May 2022 06:52:31 +0000
Message-ID:
 <SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
In-Reply-To: <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c02853d-f138-4bf6-50e4-08da3d51f9d7
x-ms-traffictypediagnostic: SJ0PR03MB6675:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB6675DC46D15AA368876219639DD79@SJ0PR03MB6675.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PDi9cTm7ZauPm0Q6PJbi3OG/jmdSPdAIuW0Grxs+dl0QoxjNg03jwpejMZYrTGvEQRU+vgNGCL0FG6AidGpg+N02EnkeUEgwe17kwzdO/Bd01wrcSe8hcHl+JNsnL8+hDj64yYOCr4iDTk6B2FOSgYWll5kSKYp7R09FZckF7GvJBa7BED/yPAzCHHBcm2npygjuUqSKcw46RefXACzZd3AioDSTBexshwjXaF6MGGD+5ZpJiJdu+a21idiLOUgWH5F6b3Fmv1LTB78015t/mC90JHYZ+JRdRsUbT+qtN0/7gvygFlIIHpJA5CeLaC+0KvkE4kqYCczxbW9YtEk0QjTGVg1MiwF0r8Qz2X/LZYzeAd5jv3IVtrbFdjiP4zB8V5Y4lF0KEOWWRuoCMvDgkZcM7yo1kufa11MJ8rPT0ME/Jw7GNDIw6pf8ElYmSgdJk2KQuYXlqBqTViZJUOJlWnCO1Jc93vW9IbdiZEj+nd/ANsz4TFOhsaopkt0ZdYjNDY5t7SiMvUMQxaHg5vbWVbOjiYnO2LJcgDQYzDUnvW7ibTwEIhkZQzIIOhMfnVDdEzZ5hzNm89MowA7SsG8vx7vqHeWyGBuoTsp8i2ipHHTUJqBLrlDrYkxOFfimO2DzUUX1uCmkg8qzzL2vWLOCUx/OAKctE+42STLh+OvAfO/k7EZA6d5Rt90imJPzV4XmTQikSTGLIg1VEPf+1BQs8w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(6506007)(86362001)(9686003)(2906002)(76116006)(7696005)(38100700002)(122000001)(53546011)(82960400001)(66946007)(186003)(6916009)(33656002)(54906003)(316002)(4326008)(55016003)(66446008)(5660300002)(52536014)(8676002)(91956017)(66476007)(85182001)(8936002)(64756008)(71200400001)(66556008)(508600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?b0NqNTcwY0Zqckg5SS82ak5TajBiSmp6ck01akRlM1hWa3dzSndiOVJ1VEdh?=
 =?gb2312?B?TkJTSThsQ0lWU1FrWThZMEdCbkdCOXliUm1XekZxMzIvZ05ldFhVTVVleldM?=
 =?gb2312?B?VE1aNmQ4TXZabHo3ck1KLzRTbnA5RHZyRWRzMWRYbHhYblhIQVhwY2ZXbitz?=
 =?gb2312?B?cjVUZkVnSnJ4c2Z6M2tQSG9lekhCeGxVYUEweUFZM3RUNVV2bjBjNnc5M0JK?=
 =?gb2312?B?M0lYOHFtMWZRQStndlZ1NW8xUjNnYzJWeDM5dnVkcStyQkpqZmNNeEZsUEkz?=
 =?gb2312?B?SDE4L05NakE5MnBreU9VRDV2OS9BdWFlWjNtT0FYbVJzb1JPUWFqaC8zQTRW?=
 =?gb2312?B?WncrajZFc0wvTnM4WjZ5VXJvUGFUM1h1dGJCcGswZ0RYbzRCU3B3TlJVODhx?=
 =?gb2312?B?NnQ4WjVUWjNibUduNWsxZFh0QS9oaUJVYVBnaWhJZG95L2wzUXNhdnl6UEcr?=
 =?gb2312?B?OERMWUF4RnlrZlVwTUpMWGpubGxFam1Pc3JIbko1TXVqMGpvYllCYlF2TXNa?=
 =?gb2312?B?ZElaVUNMaGllNmtFa2JBVlBwbm9YaDFvSWQ0aGJnbklrMmVaR2NiUEVVbzNI?=
 =?gb2312?B?K2pUaGxzQ2Vjdnp3RUZRSy9rMzliOWdLbVRZRUc0RDBQV3dFd0VabFFoNzdX?=
 =?gb2312?B?bXVJRFEreUt3NzFYakF4UThZVGVlR01KYk44VFlnWm5ZNGhXQk56L1RYampP?=
 =?gb2312?B?d1ZTZXV6NlU5SWdHdElncm5SaWRMNWZiMjVjY1p1UTRPeW9Sb2ovVmpyYnN3?=
 =?gb2312?B?aW5BbExyZ1BCRjVPM3BHL0RKaE5KWnNVRnZDdW1PczV1RHZWcW8ydTBKYWhR?=
 =?gb2312?B?SDYwWjZHRGFNb1RmN1hNSnZ5bHdHVVFQWjJSUWIyU3VrSzNDR044d1BkcTIw?=
 =?gb2312?B?RDFpR3VPaWhjTkNmSXdJZC9MKzBrYlRGNFF0clM4M1ZnaUs2N0ZVbTZUUFEy?=
 =?gb2312?B?U0FHTDkrVUdUSndVbUJ4Wi90K2thMWloSXdIaGVmU1MrQ2J1VzhSeGdOV3Ar?=
 =?gb2312?B?NUtjTU9RUkh4cnhYT2JmN1cvbGdmUlBEb2JJSDN4clJmYjFzdjNFZUlZWElG?=
 =?gb2312?B?ak9VeHNXaTM3d0h3dDE1MzVMbmxkbndtcFV4VVQyOEp3UFAvaXY4WVcraFBD?=
 =?gb2312?B?d1pHZHJDMTFYZXcwUW04Q3lwdTZYQklrTVo3RHdCeTVhSDFqSklGQWFCb3lY?=
 =?gb2312?B?Qjhnb1pjYkRaeUVCRGtBdTl6emRtWFFLb2k1Ly9RSG1WMTc0SkM0ZXVtbHRL?=
 =?gb2312?B?L1Mvbzc5dnBoeWZVNW9Hd2ZCQUpWZTRYL1dOSVZFanlnV1RSNy9lZTJUUWFh?=
 =?gb2312?B?eFFNV1ozUjJJSTQ5QlJyeE5nOVUyeE9pY2RVSFFBQytoaS9YZEVpWGljTEk1?=
 =?gb2312?B?cTIwMWEyQjdlbUp0VjVUc3dYaDR0RE9Sam1NR3lORWk5NXUwQjNmc0pFNlFH?=
 =?gb2312?B?QlloWjVPN2pOUXR5UytRRmRIcWNYbXoyenVCVG8ydTc0RFFOY0RLeEVFaUMv?=
 =?gb2312?B?WDlFeXhBVEpRL0ZDZHZPZ2lqR3ZLUUFMNGgydWFzOGRzbUt1WS9IVXI4eUh6?=
 =?gb2312?B?SzM3WjE3SWt0dTlheU4yRUpuNFg1TjlmUGJtd0xGeWlUc3pKSkw0N2tMbGd3?=
 =?gb2312?B?NFVVWUpEeklXcUd3L2s3V0ZKYmJUYjc1aHpSYXRpM09OTlkvU2lNMVJqWlE4?=
 =?gb2312?B?S3oxbTJQcmY0ZDlSMUxCODA5WmVvbWhpOXhMU29xbS9ibGtRNEFrUm1JNjhH?=
 =?gb2312?B?SU9pcTBJZ1E4V2VRYW1LbWo3VGZ5cVAwSDYySm1NS2g4TEtmb0Y5NmJzODVw?=
 =?gb2312?B?TzdKQjNaNHM5NEtKMU9kZkQvWnJCanVaY1hhM21NbjkwMUROaWJNekVROXlW?=
 =?gb2312?B?TkxzbmFwaE5VUHNKSWYzeFVReHFjaTRSTlpGdXdQcEZNOXBrM0NqOE1YME5G?=
 =?gb2312?B?d052UUlVdytRSXVSRGlKaGRvaGk5dnp1Q2FHWXhYVTRkVjg1S2lsSXhsb2NH?=
 =?gb2312?B?d1BDTlB0Q3Y0dUM2YVpkenFwY2FRVlpWVnpxaWxPK2cyWTZ6UnpNeUxFamxa?=
 =?gb2312?B?c0VJcTRBR1RlMmZDSk1zWVBRd3BzWVprU2hkWnpHN2ViaW5wQmp1Z3orTEZI?=
 =?gb2312?B?ckRORjNhd1oyU1FZRnlkZjlCVUd4bEVXck14d1pYcWxIY0tzbEJkbUliQzJj?=
 =?gb2312?B?Y0dQbjNVc2FiZm9sR1h0ZEtHMDFSTGh2aDdZaGVUMzlTcHRrcDNsTFJHSFFr?=
 =?gb2312?B?dm9NRDZEcGR6TG5xT1NzSytQNnVFVUhpU25xZGdLcDNKZ3E0NGh0clZiRUcx?=
 =?gb2312?B?R05QcFMyeks1N3ZKWlJrcXhmNWZzUmJRZVVHcVdXajJjK0xaeWtzcVpCZkha?=
 =?gb2312?Q?aaVKi6EX2s2gOWjs=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c02853d-f138-4bf6-50e4-08da3d51f9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 06:52:31.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEuf9x77s4ys0QqHX5PWibCgavoaTLfzJ/zCpXImx6cGKdM0PumXs8W02yDxiFLv7R1Jki/v/qlAOsu/R0rzSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6675

--_000_SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pj4gT24gMjMuMDUuMjAyMiAxMTo1MiwgTGluIExpdSB3cm90ZToNCj4+Pj4gLS0tIGEvdG9vbHMv
bGlicy9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfeHouYw0KPj4+PiArKysgYi90b29s
cy9saWJzL2d1ZXN0L3hnX2RvbV9kZWNvbXByZXNzX3Vuc2FmZV94ei5jDQo+Pj4+IEBAIC0zNCw2
ICszNCwxMSBAQCBzdGF0aWMgaW5saW5lIHUzMiBsZTMyX3RvX2NwdXAoY29uc3QgdTMyICpwKQ0K
Pj4+PiAgICAgICAgcmV0dXJuIGNwdV90b19sZTMyKCpwKTsNCj4+Pj4gIH0NCj4+Pj4NCj4+Pj4g
K3N0YXRpYyBpbmxpbmUgdTMyIGxlMzJfdG9fY3B1KHUzMiB2YWwpDQo+Pj4+ICt7DQo+Pj4+ICsg
ICByZXR1cm4gbGUzMl90b19jcHVwKChjb25zdCB1MzIgKikmdmFsKTsNCj4+Pj4gK30NCj4+Pg0K
Pj4+IFdoeSB0aGUgY2FzdD8gQW5kIHdoeSBub3QgdWludDMyX3Q/DQo+Pj4NCj4+PiBKYW4NCj4+
DQo+PiBsZTMyX3RvX2NwdXAgaGFzIGZvbGxvd2luZyBwcm90b3R5ZSBhbmQgZGVmaW5pdGlvbg0K
Pj4NCj4+IHN0YXRpYyBpbmxpbmUgdTMyIGxlMzJfdG9fY3B1cChjb25zdCB1MzIgKnApDQo+PiB7
DQo+PiAgICAgICAgIHJldHVybiBjcHVfdG9fbGUzMigqcCk7DQo+PiB9DQo+Pg0KPj4geGdfZG9t
X2RlY29tcHJlc3NfdW5zYWZlX3h6LmMgcmVkZWZpbmUgYW5kIHVzZSB1MzIsIHVzZSB1MzIgdG8g
a2VlcCBjb25zaXN0ZW50DQo+PiB0eXBlZGVmIHVpbnQzMl90IHUzMjsNCj4NCj5UaGlzIGFuc3dl
cnMgbmVpdGhlciBwYXJ0IG9mIG15IHF1ZXN0aW9uLiBGb3IgdTMyIHZzIHVpbnQzMl90LCBwbGVh
c2UNCj5hbHNvIHNlZSAuL0NPRElOR19TVFlMRS4NCg0KVHlwZSBjYXN0IGlzIHVubmVjZXNzYXJ5
LCB3aWxsIGJlIHJlbW92ZWQgaW4gbmV4dCB2ZXJzaW9uIG9mIHBhdGNoDQpDT0RJTkdfU1RZTEUg
ZW5jb3VyYWdlIHVpbnQzMl90IGluc3RlYWQgb2YgdTMyLA0KSG93ZXZlciwgQ3VycmVudCB4Z19k
b21fZGVjb21wcmVzc191bnNhZmVfeHouYyBhbHJlYWR5IHVzZSB1MzIgaW5zdGVhZCBvZiB1bml0
MzJfdCwgc28gSQ0KdXNlIHUzMiB0byBrZWVwIGNlbnNpc3RlbnQsIG90aGVyd2lzZSwgdGhlIGNv
ZGUgbG9vayBzdHJhbmdlDQo=

--_000_SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;margin-top:0cm;mso-mar=
gin-bottom-alt:0cm;mso-margin-top-alt:0cm;mso-add-space:auto">
<span style=3D"font-size:11.0pt">&gt;&gt; On 23.05.2022 11:52, Lin Liu wrot=
e:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; --=
- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; ++=
+ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; @@=
 -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_to_le32(*p);<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&nb=
sp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;<o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; +s=
tatic inline u32 le32_to_cpu(u32 val)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; +{=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; +&=
nbsp;&nbsp; return le32_to_cpup((const u32 *)&amp;val);<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; +}=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;<o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; Why th=
e cast? And why not uint32_t?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;<o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; Jan<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; le32_to_cp=
up has following prototye and definition<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; static inl=
ine u32 le32_to_cpup(const u32 *p)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; {<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_to_le32(*p);<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; }<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; xg_dom_dec=
ompress_unsafe_xz.c redefine and use u32, use u32 to keep consistent<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; typedef ui=
nt32_t u32;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;This answers ne=
ither part of my question. For u32 vs uint32_t, please<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;also see ./CODI=
NG_STYLE.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Type cast</span><sp=
an lang=3D"EN-US" style=3D"font-size:11.0pt"> is</span><span style=3D"font-=
size:11.0pt"> unnecessary, will be removed in next version of patch<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">CODING_STYLE encour=
age uint32_t instead of u32,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">However, Current xg=
_dom_decompress_unsafe_xz.c already use u32 instead of unit32_t, so I<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">use u32 to keep cen=
sistent</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">, otherwise, =
the code look strange<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79SJ0PR03MB5405namp_--

