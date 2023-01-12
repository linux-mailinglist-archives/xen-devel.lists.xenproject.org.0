Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B766675A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 01:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475768.737593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFl3A-0001bp-UZ; Thu, 12 Jan 2023 00:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475768.737593; Thu, 12 Jan 2023 00:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFl3A-0001Z2-R4; Thu, 12 Jan 2023 00:02:32 +0000
Received: by outflank-mailman (input) for mailman id 475768;
 Thu, 12 Jan 2023 00:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFl3A-0001Yu-3C
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 00:02:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ab9fb2-920c-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 01:02:29 +0100 (CET)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 19:02:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5685.namprd03.prod.outlook.com (2603:10b6:510:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 00:02:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 00:02:24 +0000
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
X-Inumbo-ID: 66ab9fb2-920c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673481749;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c3iDwnezfMF+ULW9BNrpEmhodULbQKYQwOVb7MiOsC8=;
  b=R0VkhXTNH7xwM//h2vSO1p/HsQ2UpYsPhDs8uvnNX2XKq350Z98sZa87
   XaT7HCn58ADQKCRoiJAKUZfJZWJqw5VcrEYywgdNBKlegp3YvIrreDu1s
   gqM84ZUcVoT5NpSevDF6RwOZlo7CULNVlWZ0/3yyiSbnB4nQT+Ebl9TOx
   o=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 92208154
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R+DA36P2BGaixafvrR2UlsFynXyQoLVcMsEvi/4bfWQNrUok1zdVz
 DcfDDyHafeOZjOgfo12YY3jpxgAuJOGndNnTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5wVmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sdPGVlu1
 /EpEwIuaReZl9uw0oqWTNA506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eex3mjCNtPSNVU8NZm2Qy06DYzVSYncmedqsW7kFyGBtx2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETQUKEcSaClCShEKi+QPu6k2hxPLC9N8Sqi8i4StHSmqm
 mjV6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHb1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:AxAW0Kxvakbs1UI523JmKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.96,318,1665460800"; 
   d="scan'208";a="92208154"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBxTqiNseKxi3Rb3bHnLcJnmemaAW6Vy14J0lgBniSDNKEY8Eia5I9kb7Biq2iK6X5wuL4NkdlGbNeY8Li2IaE2Pa6iyxmc6fKT5itA5H8p4Z48pPiU4hxxNNQZsSu88ZpbuTpx3CCDUuaRgmNSe0H3smchguFCj63rS5DUWYGjOl3vYKbLMT6ox6Sp6au8ZnWo1F5GhKUg61pv5vqQa5OfMVoKeKydeYMBNBKctQVLcRlugFAWdDJJAna+axp8bz0F11fK9xv2FVgpdoalw//cfg/DKWzXXGCEdepxlguffLH9UEe8MjeJKbzGlItSSfUGMRsVISvZb+nmEkc25aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3iDwnezfMF+ULW9BNrpEmhodULbQKYQwOVb7MiOsC8=;
 b=GK6FcTleryCOEQZtvKX3dbEOde2B6dVCRvwSKBAVbggtWzqagsoHwvwiSUQAZs3JY8BSQjgNgUV+HMs/mfV89b6DRuoS6QZwxlIk9Xvdw5xHnb9hddT/NSqjQEVjq4Q6bxAJVDmbRzU9zO0rX+quxdznoYmltB6cO+z1aDsRIRovDfuI0di+7ny31iND9rtWYyAw/+msj0mBcLFGrfAOihW4VrVR9VnyVJkTwFBlwdz++n4RE6aIpla9AH2HZWd/ikPCQVwtaKzqUmbrKtFhXzClkDuwjtisPJFGbaYsifhD29W+CfYkNV1uLLW0k8ZCb9nW6fAUninvKXf2wZ99GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3iDwnezfMF+ULW9BNrpEmhodULbQKYQwOVb7MiOsC8=;
 b=wBVTnHekgCJkCtPAiy/4pXz/+HwevUsLSOWw5cVoJdkfirKGB/zXgGCwwr3y9v6OQdDB+wPDph6DBAQEH7CcACJjSS+6FJvYjKEnGYwEEB5nPISAFH/sy32xsDYrmvtWhyLikJ/PeBjesyuok6ppVjHZEeA6AFzm1THTR+jiAvY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 7/9] x86/shadow: reduce effort of hash calculation
Thread-Topic: [PATCH v2 7/9] x86/shadow: reduce effort of hash calculation
Thread-Index: AQHZJcSKbn2Oy+OF1EuP+6uJ3eHPoq6Z5sMA
Date: Thu, 12 Jan 2023 00:02:24 +0000
Message-ID: <28488645-1cf7-cb9b-ca03-f060f7947156@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <4785b34b-2672-e3a8-8096-df1365b6b7b8@suse.com>
In-Reply-To: <4785b34b-2672-e3a8-8096-df1365b6b7b8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5685:EE_
x-ms-office365-filtering-correlation-id: 1001df52-2a13-4c49-9cfb-08daf430491b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oCCOWOH52K1U7Usk3e1wfph8E5ezYKfJvxrjxhS5bohK0izIQ9jy0CWqYjSHMPPNfzFW6cpX8PH9e4/JZBrZ0wSGPskIzX5ettypmnVlPHLDl0Kx4W9uDcwD2BQPjXCz2WMf4uTQauzn85zIKLxk3gPvvjFMw1cuC53d9gfo9/GarxHe4ijsS+54BGBY0fkgwW0hA7QYySebbIDQHfJ1JkADaKoh8WUTK9rcMOioTZtPbw2+uxT1AvM3+uCjvTnhEA+y/nobC0a4+vanp4gEhk8dCbQ1cj1p3x5WJtibJhmNANt5rCj/vdmVcsybDCu7gFEPYu932pOEqQ1uEPlcqe3nocEl1Kd7PAdbPqlXxp7+4aQq69X5V7hQlBtjxKxv07ibMkY9ykGRVccLCWll1LUmxBdwPAWuc87fKTHElLZxTL6HZ+LmUxDhzW67S/6RhwwfbWKvNabdczsxp4p8fZULObCeZHcYxLnffVY95AMpVnar6SgqlMcKWTfD5oG1LBMrhx+knDoVA9vLkJCJyJHFg+C2uuWl96rZ801dZzFkI68QopX9th1X10JrQEfKYaVxdJiT/rywbmbdkRY99KYjdTpphC7z+k//bSHfaXIjDSRJB3VNhf1wMtCCppzZ1Z4RhY+nRFtEhY85ErpyJm5y4Pvh6XHZGDYbYMOJ+K8Fi0yFLF/1nL/LQAw92+JIvqn9sjSyy2GrQ3FtQBwdzw6FUutnrsTOMBskBxW2i13QL7owkh1lCxuff5v19Tb+WqNCV+DXXup8QqDQ+Axx4w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(66946007)(64756008)(110136005)(2616005)(36756003)(4326008)(41300700001)(316002)(8676002)(66556008)(66476007)(76116006)(66446008)(86362001)(38070700005)(31696002)(4744005)(8936002)(122000001)(38100700002)(5660300002)(54906003)(82960400001)(91956017)(6486002)(2906002)(71200400001)(6506007)(6512007)(53546011)(31686004)(478600001)(186003)(26005)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnV4MmlIQnc1eG1nT2YyOXFjS3ZWQzRUbEw0YVh1R3ZIWXBjcDFqOFNGMGp6?=
 =?utf-8?B?aVQ3MnNtVXoyTC94K2NXNkUwMk42UG12ZStBYnJ3RDB0U1prNEdGSkZ6QVZH?=
 =?utf-8?B?cmY4T3ZSZEcwUUJjYkR2WnhrbUZHaHdFRWU0WFA1YVN5T0lsM3dBcTdyVDh3?=
 =?utf-8?B?WE5RQkwxcDMyZmdFdE5JUnJyMkF1NUVMT1IwVnZDcFA4NWpKQW1jZzdCM3Zz?=
 =?utf-8?B?YnZnK1FReEppVXRjTHJ5VXYxVUJvajB2ODFEMk1TOUNoenZVVEdRdGcyWFF5?=
 =?utf-8?B?TEFjdFhiZEZ3b2tKbDRWZ1RsaTN6Q2pISVhhS3JLcEJQVlFDdEdoTEFjTkpr?=
 =?utf-8?B?ZjFodVdBZHhQc05KOWpuaCt0dTFoZmtSbmkxNmlya1YzK3dEVC90aUp2V29a?=
 =?utf-8?B?ZTZ4Rmh3eHNWOWRtNG1vbm8zWjFRVkwwTUhMOWtqaE9iMUpybUdPNGcvS0Fi?=
 =?utf-8?B?V0I5TDIrSDdlZlBhVHdVV2NTazA0c1FUdXN5QlJUbzNUeWVpbFZyd2F3U0pC?=
 =?utf-8?B?em0zbzZmL0h4YTRUK1M5ZVBQdTFyU2ZzaGh6WDBsU09tZHhrZGtkN290KzF3?=
 =?utf-8?B?K2tYRmFxWllFSDNQb2t3R2l2MytTL3pnY2psekdrdm4zalBXUXdZUG1JOG1I?=
 =?utf-8?B?K3owbm4wUGJZNkNBZTJwZ2MyNXIyaVhBemFHYmcxWis0RFMzM1h2R1BlREN2?=
 =?utf-8?B?akJOVzJMcFFEVTFreDg0VHJ0bDN1QkpVUjY4aG8ySUVlTmZscDQ2QWJUdG5N?=
 =?utf-8?B?cUhyNjdzUE1UNkFEUnFkZWJVS1ZmRFBIOENLUkJlTk9LSFBtZWJveFF2MUtV?=
 =?utf-8?B?SVNWQ2dvNG9zbUNWSTBNZk5FeEE0WTlWS3VOMUMvcmsrTmpYemF2N2h3WVcv?=
 =?utf-8?B?SXlYcnNZYUtWRXY4bnR6UXdUMXNDV05obEQ2bzBQN0dxMjNCeGJhTWpNM2Jo?=
 =?utf-8?B?Qm1CMDR5OXdnMG9UU01GYWV2dXhOSlozUVJKMHFxa21COHJIWU1XSXdKaUNH?=
 =?utf-8?B?NkFwWTc5N2NMeDhWdzBZYXQ5WGtSYmZWSnBmV002N29QSE1yeHFPNlg4MnFB?=
 =?utf-8?B?OEpLL1BCVFFEb2ordzRzdmdqTE1KSHhKZ1JRQklQRUlkWVpDN1ZHQ01XWmFk?=
 =?utf-8?B?U010Qm5kWVpIVk5YVkoyck94WTcvWDNGR0FGa3VBcTlCUlhpZ0k3OTl2UzV3?=
 =?utf-8?B?amU0eVhqVUI1WFd2OUdQZ3lwQmY2Q0hZWmRyN0dBZ21WcytjZU5GTlhTSGtt?=
 =?utf-8?B?dWorSU9HOXhtUm1zOWJLTGlOVHlyYkZRRTd5cHJkeDR5ZWthODJPbVNKWmNQ?=
 =?utf-8?B?NUlJQkh0TUs5SktvMURaSkI0L0NxdFVSbTJ6NGljQVBHWDdZTDJmSWk2MXdF?=
 =?utf-8?B?c1ZDRWd4YTU3SVQyWC9pRUdTT2l2TjdjNjFVS2ZoOHNTMnJrUWx2V0RhR0d3?=
 =?utf-8?B?eGhTY3ltT3pKNm56NU91TkUwTW5UZ3I3dnNQUG05VktWUFJORTBiR0w2bUsw?=
 =?utf-8?B?QWxDWmJFRjJJUFdXN3VLclcxR2JlQ1U1RFV4UGFudGxJT3BITkJmNzhJTGVG?=
 =?utf-8?B?ZUs4RFNqamhTcDVVQ0dGUXVQNDAzbFdjWkt6L0JCTU1CNFFkVUtqaXcxVytK?=
 =?utf-8?B?c1NJbk9VOGlBRHBtYnM2ZlpPV3ozaEx5UHVENWpYZW4wbDRScCtHT1Fqd2Ju?=
 =?utf-8?B?a1VHWHhHdmU1NThaSzBYeEVoaDV4YXVtYWF6dHl2d0ZLZHYzeVdVNVczbzYx?=
 =?utf-8?B?WEgvRzRIbDJGS2tId2FXUHZHaHdIUUZ3UURUbGVUV1JmdEJmeVJkMy9sd013?=
 =?utf-8?B?V3ozUnFsYVlEK2RWR2oxSE9neTB4THJiaHNNS1NDTmZ2YlYzMFlJWEFuVzZx?=
 =?utf-8?B?YTVjNzRQVVBkd0h0V2VKMXFvUlZRNlZvTmRSY2dPVXBjOEVQMlByTWZHMEV3?=
 =?utf-8?B?VVljZUNySlJKbGkrYWVXdXdmRGpRb2JUTnJPTkg0TVkwRkwxMUtaS01pR1BH?=
 =?utf-8?B?UDhtN2ZJejR6cXJKNFF4QUltZ2QvT0g4aTdFcmwxbGFYNHZGTFQyNHpvQXgz?=
 =?utf-8?B?bHlPa2FBakp3N2tUcWNvYnV0K2FZQzJHSGkwYlBMSTd0ZXdvcDJKWDB2cWRp?=
 =?utf-8?Q?3c1LPIujqc/aEbEYoPzXyYCf1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82E358E44FF7894CB3C2763FDBE6DCA3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TLbZiH43vNJBNjSgp3zTAvPCoTZ/CjbrqzKiPqhSDrJPnC9iVlQmeQ356WCLkc+oSqqxIkVnhsIwW8qbNcZsPzarGf4zdSYXIWSx/NdAinc8+vOSYB/ymSWleGtcHH79o1BafrRnJ158JVw1yLHDLi8rwWZM4rrMTP1hT9sCV3YRJkNUaHkFYQD55dsWxM08LVd1JZbfg6oNLBT+XJRAAhROfSZQgWRJvsYC8prcJEk+4x/W/CmFJUotTgFiV2O9O4hur504rCCFA15Q3DyhCdaNooWTNRH/eGBEsRFBcSvu/egIYCw9vb6o9h21GaOy6Y4gJUyBxeDoXx+VZ4mTMOcEzd2SN/G1WCxRMzXNWRZa4ayyrASO+98ucsN3wpiljySjnX4EIzP8Pi8hwEheJhyLCIqG/ZQEo/wUE7spRAI+uWSSYzZiR4oR9o/deblpUbjibm+ndBjgq2X0Ld3EBm5b9KA9KJdOnwA8QFcLP6g5oN+hh9G9BqWqR2lfmec54Q1yR3rHJXVEcGRbXrPpQRP1ffSw7eEdhBbI91jPaPAab5edQfan6pvLJecaNUH2kr1BvQ6JeTKn9UoAf0ABsW5eJ5U3fFO2Py5UpPEZQ8ck0cnHtJUNW+wGfhVRh+Gui0/tf96ynQESBf/kyJX+0O8PRrdvVRCTflHn6EOAfY4EbPzMt6TL3mTL1OUpCqJRYq/LMlQzLuFurCyfWZR9beraprGFuhY64O2QydSIvjFSqj9N0UUXD+C/aUD0roSARz6WujqLUixLmCmwhFE+vI6A9w8kZQL4JWwap++MSXus/koktWb0k+wrSNzV05kWfthiGpMzYl2nDMyjxsBVHw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1001df52-2a13-4c49-9cfb-08daf430491b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 00:02:24.7875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EY027ciF4+8mTfK/wipN2e4uLaIAs7wNwE/HETKH27VEh9RS6zm9Pf7OqpO+p2OoZ06fEUDaD2tjerjFB7p1Hk+0onY1BdvNWt92phpUplA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5685

T24gMTEvMDEvMjAyMyAxOjU2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlICJuIiBpbnB1
dCBpcyBhIEdGTi9NRk4gdmFsdWUgYW5kIGhlbmNlIGJvdW5kZWQgYnkgdGhlIHBoeXNpY2FsDQo+
IGFkZHJlc3MgYml0cyBpbiB1c2Ugb24gYSBzeXN0ZW0uIFRoZSBoYXNoIHF1YWxpdHkgd29uJ3Qg
aW1wcm92ZSBieSBhbHNvDQo+IGluY2x1ZGluZyB0aGUgdXBwZXIgYWx3YXlzLXplcm8gYml0cyBp
biB0aGUgY2FsY3VsYXRpb24uIFRvIGtlZXAgdGhpbmdzDQo+IGFzIGNvbXBpbGUtdGltZS1jb25z
dGFudCBhcyB0aGV5IHdlcmUgYmVmb3JlLCB1c2UgUEFERFJfQklUUyAobm90DQo+IHBhZGRyX2Jp
dHMpIGZvciBsb29wIGJvdW5kaW5nLiBUaGlzIHJlZHVjZXMgbG9vcCBpdGVyYXRpb25zIGZyb20g
OCB0byA1Lg0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGNvbnZl
cnNpb24gdG8gYW4gYXJyYXkgb2YgdW5zaWduZWQNCj4gY2hhciwgbW92aW5nIHRoZSB2YWx1ZSBv
ZmYgdGhlIHN0YWNrIGFsdG9nZXRoZXIgKGF0IGxlYXN0IHdpdGgNCj4gb3B0aW1pemF0aW9uIGVu
YWJsZWQpLg0KDQpJJ20gbm90IHN1cmUgdGhpcyBmaW5hbCBiaXQgaW4gYnJhY2tldHMgaXMgcmVs
ZXZhbnQuwqAgSXQgd291bGRuJ3QgYmUgb24NCnRoZSBzdGFjayB3aXRob3V0IG9wdGltaXNhdGlv
bnMgZWl0aGVyLCBiZWNhdXNlIEFCSS13aXNlLCBpdCB3aWxsIGJlIGluDQolcnNpLg0KDQpJJ2Qg
anVzdCBkcm9wIGl0Lg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo=

