Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00E63F354
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450823.708289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lAQ-0001z8-Jq; Thu, 01 Dec 2022 15:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450823.708289; Thu, 01 Dec 2022 15:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lAQ-0001wS-GE; Thu, 01 Dec 2022 15:08:02 +0000
Received: by outflank-mailman (input) for mailman id 450823;
 Thu, 01 Dec 2022 15:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0lAO-0001wL-IT
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:08:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef31fde7-7189-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 16:07:58 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 10:07:52 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BLAPR03MB5442.namprd03.prod.outlook.com (2603:10b6:208:291::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 15:07:50 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:07:50 +0000
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
X-Inumbo-ID: ef31fde7-7189-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669907278;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PBb1iC84Y9mtPs3tMgemr5UGzerkZP/AnbalvqRU7ac=;
  b=Y6mBabZpMH1jtY33z+c6P8gm9e8J9UVNoD9KZKo9DjPlcHIWp/R+Sd/o
   q9jdiHF8WSxgmlICjNDH6Y9HTaZAILkYjAvkkRoWlRftlMHr5jdYPwOiO
   9VIUpbRQsDzvVNokQq8zUV/O52K49dU4vmaZYjQ9EZI74M+mUy1fXEoQU
   k=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 86071011
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BpDJlKhur7Awmeh285PCs3ZwX161RxEKZh0ujC45NGQN5FlHY01je
 htvUTrTOaqNN2f1LdxzOt61/R4OvsDQx9M3Swo5/CE8RHsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWJj4AMw+6pdio7+LgSutCptp6fOrCadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS8WDbWUoXiqcF9k0qGp
 2SA42PjBRIyP92D0zuVtHmrg4cjmAurBtpNTeXhr5aGhnWx3is2JSwWd2DhirqG1n+vSeh7A
 kMtr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhpigqVFooyVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxtTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:j5CtuaF+IhmpK3hjpLqEPseALOsnbusQ8zAXPiFKOHhom6mj+q
 yTdZsguyMc5AxxZJhYo6HmBEDYewK7yXcX2/h1AV7BZmbbUQKTRekJ0WKF+V3d8kXFndK1vp
 0QEZSWZueAbmSTWa7BkXGF+8lJ+qj4zEi47d2utkuEU2lRGtpdBg1Ce3mm+hAffng9OXIgfK
 Dsm/auvFKbCAgqUvg=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86071011"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/mS9Lfws4NvkVVoC5oBr1Ti7/mx+KLYXsBnIIAZ2jL+YgKQZERuo9e7E8s6ZNZVy/l0qvpccgf2VPsWWxCoGbI2KX1XyTpm7MdZIu6Id68E+1G13ucZ2EEPzIlPLQmnf1uSxt70BwW9T/Ns2sPqFtggA1bwtu+7QvmaX+yl9xQS/t5qG+h9D2rQjAhp9zm+YW3xSShaCdbU+bt2yIDYYdfItMLItsl6nUKW56l0AGum5pHRXWe+zRooTILvcCs9sOr0G2Q5PpIDqgp5NDEk/fDL3RqLeVu90zKBqArDbIHpOT2KeRUsHIUlPTf2q80EQdabODREwoCK/reZ6vP8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX0z6qO/z3rpnNvYja98p/YzDIk/d0OmtRvMbEJnwjU=;
 b=hT5zX/MrVpJucx0U4Uy4Je4XpsVP13aLJl8CCqhgYycbj+fxiNL+5mbCT7tMUp5/E9vwCQXZf0FQuY4L+9Zaa6VWYx3Nd0+zvyIYvpq69TUAxC0zxnAQydmPkLgjNGu08d2CzoQhdc5ak4Zy9jF9Vq3Vd5bqUmdBU+yBzRtJR9e5FOlYyECymPMRZcD1nFl3Pl41kjpsZjxl0odHrF7wA0BG4+PjNDzx52M+A9j5GLOjtK3PVjd4+dVPvktePhttsoDlUY/cheARIbXBByNq8eMt7z59B8kJnPaQ2YsrIWVyY20GMxpSh4VYwVn2pKMA6GmYnz3DJGeRXbV2CKtmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX0z6qO/z3rpnNvYja98p/YzDIk/d0OmtRvMbEJnwjU=;
 b=Q3RaA8uSnWpw9Hb0QGGyP3h3MWFr/warXGy911yxg2+Wuf/ryPDfy6tpncAsbcUZudK7bsm3lieNJNbCQb3v/YQlXbUJVMWyY04/FwRtKdgttxVw+n8zkmseH2vFf8KcArsxp1KdouSvJDDXi+LDn4dZ/9T9iwdwseMXlGly7Do=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index:
 AQHZBOHXDfX2gYxBg0iCW8c7bxa9Ka5Y7MWAgAAhD4CAAAIsgIAABU4AgAABv4CAAAx+AA==
Date: Thu, 1 Dec 2022 15:07:50 +0000
Message-ID: <5AF88105-BA9F-4601-83CD-389DBE1EE80B@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
 <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
 <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
 <08D59C99-A8F8-44B1-A081-FFB0CCA8A8C5@citrix.com>
 <DD8F6F10-D9D2-4433-B2D2-ADB419F2FB8B@citrix.com>
 <B5F6DABD-B6E2-4F07-893D-78030272B424@citrix.com>
In-Reply-To: <B5F6DABD-B6E2-4F07-893D-78030272B424@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BLAPR03MB5442:EE_
x-ms-office365-filtering-correlation-id: c9ae0672-a5c0-4020-b956-08dad3add05c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4+cINO00///1tJ9P2BOagRSMIg25p+eY6RrhyyR1D1w18B4DiszdfendWOhW7/DbJFm7WFz7S71fvmA7i+Z2/NZjP79W6pr2Y9ldyhUujzLU/ElGKR9sGKj5/yZig2A95Ez06lwwCDX31nBuhKMnlACf3F1m819tKz1dipgiezaBF8Bwu461aTs+SjkUgsmciZtqEOEefKKt7VyH8ZeUaCwvBwhUIwssAhCPhTfiOqVXcoJcIJ+bgsrKxm5qfOcYdzghGSJcmNIgj9cttMg976SqIrV5o3Df9c9BRoFbfgH5QmXhZOJEhxFg6xyha0E4SjUbb/daAsW9s8Za/ApgxkKbuyOyX/aRuXdbZFy80AJJBZXraKUVIJpUvg/xwHIVXc/EkoS6ZdavawVtU5fIpf+GoMyYUcWVUDuRUKStpYh4Dc6uvg2Dj8Om6FbcePw4X7TTmZcpXv42z/PAYI3JvvMZ6hrf4qzyG7fZskYVQNnYVVokWy+Bp04R4+k4d8b/AeyqatzYVXraJ8/Avgd0cfRKa6AFml1pq4bJ4571wWJxCgAh1yZQLdwMc/4333cVgBYESgzsRwsvPlZjWM00GLkAigFBKY9nC4TBofwlX6wfBDx+DjzjC+Jl0tdSCK4pvBbUoaACOUcoiIDl8sz7QOy+Loidbw2y1H/03sdBK9vAii8W6asawbS5Tsz8VMqJziPqt4K/h7l+yRW+ndhlArEb9pgml0GhsSm0pPj0200=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(38070700005)(86362001)(36756003)(33656002)(6486002)(71200400001)(53546011)(6512007)(478600001)(6506007)(26005)(107886003)(5660300002)(41300700001)(37006003)(8936002)(4326008)(316002)(6636002)(54906003)(2906002)(6862004)(8676002)(64756008)(91956017)(66476007)(66556008)(66446008)(76116006)(66946007)(38100700002)(82960400001)(122000001)(83380400001)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5isVzh6iXrZPk0djxxRBS9iUZTbU1MkZJZqvI7PUY5pGM7bVlv4R6MLUpYUG?=
 =?us-ascii?Q?2bO5tAMQhcoZF9MI0iWZK8/xQQ1sW8C7zsOsdFDhz9TKYk34Au6MluQKVZqE?=
 =?us-ascii?Q?MeAtBrvEIwucdL84Cn0qFEpWxSvHKWrYg9sCO7BYmIrcly013Sd3rapvU5qs?=
 =?us-ascii?Q?vk2qo0vha9WML3MGXIUeEQ0+LlacPcK5UaxhRoLkAJvbHnfpMptcIgA9Rjki?=
 =?us-ascii?Q?tBpH9UAda1EYbNCnOk7Y0fcMpKUT3kyEottY5n+2/NmM44YOUug3JOf4P2U5?=
 =?us-ascii?Q?iwaVA3oik/MooItoz3VDok1m4nBrlGoLT5iM2gak6xHB5HsETvVb3hotwpwr?=
 =?us-ascii?Q?pSIkzlYv771ykHF9qr3ERQmTO5TDI9BXsSpGNfErDNz93W29MMNlq0YfrhHj?=
 =?us-ascii?Q?B6Q12DI56x0tZHrXfaQDiFZ64JLuZu46Im5PV8Jw6XQgvGVtrSBVIhFs2C/k?=
 =?us-ascii?Q?CFcPL62GjX24tQVWG0odiThRunybCDuITVBodhw4F+x+fpmU/hOZnnMLbTZ8?=
 =?us-ascii?Q?Uj1GFXi9ptHoMM8jdm//PlMA7jTJpg/hOySsuPCHAsl4vgR955EDO7pfGUxQ?=
 =?us-ascii?Q?Bto7exkOxB2iE52bNZEsBQu3QXNhWwMBEGztJrpuWDRRqmK4Y6TrhqvlGMy+?=
 =?us-ascii?Q?TZPUgsGmdCTkYwP5iRAfpJnqb8j9I4Ar4jUdsw2lxrIkETuvN/62HC7S65Cp?=
 =?us-ascii?Q?HlKZGea+N4Nf0PrD7suop3M27xXw00o+mQiKghTawwJSbG139woCtfQICPJV?=
 =?us-ascii?Q?kgmh9M13h4dn4Lk39VBVvEryTgvEU4gkVksbSbiV5tDCiBqM5E+BylWweTPj?=
 =?us-ascii?Q?f1471nXOHGQwKIarRFLozjxHZ6Mb+O35anOXB9PPJhnbFyIiPOIgS2cP33Kn?=
 =?us-ascii?Q?HRHNE6UaQ9H95aAJZ5Vp+bo8sLg9xJh+1Xe6FyC/OmDjp1mOewhWOauhasip?=
 =?us-ascii?Q?Zc5DCnBNLe/25JGmeXmGcu9uiBMXqyZO8iulTXxZpZx5q3Ai0z2EDWOh1QaQ?=
 =?us-ascii?Q?zOqGxhEkW/bI4msasA/xgdf67nmd0SRBPCe7dNvClj1YHb6iq9iHhLWmkxjP?=
 =?us-ascii?Q?iqEHfENyw/SmEhVuIcPFv+q5WCZ/Fe0SsdaNiQqULz1StHmAGKCcbljxB0P/?=
 =?us-ascii?Q?Z2P5JjFJSCUzI+dSZYXe+EzIDQDvRzGg8a4GMBmTccbEdFYSvyQmElTLZy6g?=
 =?us-ascii?Q?/viGLFYoNj5ld2tYvqUUHftYtHiXHoAFs2B5L3m/ase7WG9uNb8yWRDaZ8MC?=
 =?us-ascii?Q?j2RXpMIe6ETGQfgN3GoJShQ1AbU6ZFbYZ+v790+rtd9M6SjjW4FV2NZ7LvFp?=
 =?us-ascii?Q?gRLPDATiUX2n3Zd9xj5kwr47oNQ+e7go5drP9Dr0aKKbGrpDl4ofXPiRoo3F?=
 =?us-ascii?Q?7SGoLkI7kIxdg/3tbJTCZYNkTALkD8LX60IRbEzeSe21cxSalj4Oh+QzUxvh?=
 =?us-ascii?Q?mz+DkoNFOP6llaqUiNnNYSSZgzxAByw/cRrmuCd+PCPHf4AaQvdk7/6TqExy?=
 =?us-ascii?Q?K3wiemgya7bxTkhn3VtqmJkzlnJIWTqXGe8yCSzcZGfcFSlb7SVxEFA28/0f?=
 =?us-ascii?Q?giOWIelpFIw2YSiobm2noHcyETHVxwlydMD5F5qxuZJKZzUZSJxAtOtPv17P?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <827A6574CC397547A9806A6761D49892@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kxCimhhhNjIf7CK+4ZYYYzGGSBqbH7hO5YY/WqPuj48bxPg+W/3K6FCTVFYV1w0NSTIA/MCQeun2hgIREJOwNA/L0/FkWyaRgO7ErPDw2OItegMVc3e0x4RKeSJWXtDspinkUxqRV64Jk1Wolfjyt3c/VvqqMf7w9QnVu3qz+2S9f7/NaesVm68j875h6+MW3GRpgA8B5k8YiWdRzG0NabRCMWzaZMx0H8zbBQ+VGAyQ8yBtAwB0kM2Y+knL/dRWC5HLPsCRRDQ4qkz59ZeDB/u++EMTiGpZbXSp7TuPICbS23WXBYnjNfzXM6kBu1DHaOYFvR0Xgki3jldjAxYx3P+Gs1nCQZp+V2DxtF9ubICsWM715d89V8YKJFvFuWyZjFJtONoXKGJpMlkBPaAUELVEObW3cFHXrsltF2AU4S3fK+Tz87yxDRqN6879hcDlSkfyyJNbqy0gPoIKiM1XIOFTqiqQEzOzSMMaK3HyyREg5pJhhWpiWaQ7jk4hxjs6/7Rw6msfsLKY1heE1b3GgM7cHHd24dkyDmf9AGia3KEnv8VUCIvpHty6g2ViTM6jrS6/naGbXnTjPLpX+EvhaotLKludO2+nh3336+/ss/cdXz+5pXuf/A8CJzTaCRuE263NfM2Unx0E4liB+leDdzvLwkEJ9TsMZtXVWDIRGHNn2O7KkoATMzTn7AucDcdFzr0K5BcutDGLz+5BCzSLE2mdqyzgu02+E3rYYVNeOhLLWLOdmQg/zWM+EZNjTV2K4uH+ir6Nys90uKuq6TWqDdAp/seY2p1rHg6qOMBllGxV+iqxESQgRIFcG7eVcAgdVrSWYpFWK1RCbv8utUiHBg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ae0672-a5c0-4020-b956-08dad3add05c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:07:50.4574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 018JjYOG/MotD4HnC1WT0FjWsOIlVwG5pnhpRniz6+/O/10mJIa7cRAP2yCd2wgamlP/5J0l6peF60GmyR0ERg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5442



> On 1 Dec 2022, at 14:22, Christian Lindig <christian.lindig@citrix.com> w=
rote:
>=20
>=20
>=20
>> On 1 Dec 2022, at 14:16, Edwin Torok <edvin.torok@citrix.com> wrote:
>>=20
>> The disadvantage is that we can't pattern match on it anymore.
>>=20
>> Although we could have some OCaml code that does the pattern matching on=
 another type and maps it to these private integer types.
>> However at that point we've manually reinvented what ctypes would alread=
y do, and we have an additional mapping step (which may not matter from a p=
erformance point of view but would be nice if we could avoid it).
>=20
> I agree that this is a severe disadvantage. My method is only useful if t=
hey are mostly passed around but not when they have an algebra defined over=
 them where you want to combine and match them.


It might be possible to use your method to implement a pure-OCaml ABI check=
er though.

Consider:
```
external constant_A : unit -> int =3D "caml_constant_A"
external constant_B : unit -> int =3D "caml_constant_B"
external constant_C : unit -> int =3D "caml_constant_C"

let check_match =3D List.iter @@ fun (ocaml_variant, c_constant) ->
   let r =3D Obj.repr ocaml_variant in
   assert (Obj.is_int r);
   assert ((Obj.magic r : int) =3D c_constant ())

type t =3D A | B | C
let () =3D
   [A, constant_A
   ;B, constant_B
   ;C, constant_C]
   |> check_match
```

(although perhaps with the 2nd assertion replaced by something that include=
s the constant in the exception raised to aid debugging)

This'd only detect the ABI mismatch at runtime (although it would detect it=
 right on startup), so it'd need to be accompanied by a small unit test
that would link just this module to make any mismatches a build time failur=
e.

Then there would be no runtime overhead when using these variants in functi=
on calls, and we'd know they match 1:1.
Although there is still a possibility of mismatching on names (the bug I or=
iginally had in my patch, which although wouldn't cause any runtime issues,
would be good to catch at build time too).

I'll keep thinking about this to see whether there is another easy approach=
 we can use that doesn't require using Cstubs and doesn't rely on manually =
keeping
code in different files in sync.

Best regards,
--Edwin


