Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7C5ED0FF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 01:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413025.656515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odJvK-0003FO-Jd; Tue, 27 Sep 2022 23:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413025.656515; Tue, 27 Sep 2022 23:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odJvK-0003Cw-GY; Tue, 27 Sep 2022 23:23:34 +0000
Received: by outflank-mailman (input) for mailman id 413025;
 Tue, 27 Sep 2022 23:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0TW=Z6=citrix.com=prvs=262f03aef=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1odJvJ-0003Cq-9t
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 23:23:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63fc3502-3ebb-11ed-9648-05401a9f4f97;
 Wed, 28 Sep 2022 01:23:30 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 19:23:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6878.namprd03.prod.outlook.com (2603:10b6:303:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 23:23:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.027; Tue, 27 Sep 2022
 23:23:20 +0000
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
X-Inumbo-ID: 63fc3502-3ebb-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664321010;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e1Yj/OR6wUofZ6oxF8HJMJwNFT/G5tVRxSxKLfX+1u8=;
  b=YEh7/HW57RNaWfBzDG/iUq7u3xiCHRaP5G/NF70vClYp2i4njilK7N1Z
   8aFSowurX9+1YNNwfdy5QniqqpDL5ISlVF+txuTh+XJs/q/JFfUfr/s0O
   tXZ/Uc+8NMzVBj8SQoY/w3JN8oRrKZhByetRHBUThM0H59PMYOtrboEaE
   0=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 81473564
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Vj6IOq/xdvnYbASdV2RjDrUDRn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 zFJX26HaPqCMzOheIt+PNjioxhSupXTyIJnHVZsri48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvnrRC9H5qyo4mtJ5ANmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rt+HyJV0
 uAjEmEmNBbahLKO57y6cvY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efxH+kA99MSNVU8NZ0i3u9lk0MVSRHflGk/dKnyUiOfPxAf
 hl8Fi0G6PJaGFaQZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1/b6OoTS/ESMcN2MFaGkPSg5ty/nuppsiyC3GSNlLGbSwyNbyHFnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvz+N7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:JHHFYqmwHI2y03lz1NGEHiP43+bpDfID3DAbv31ZSRFFG/Fwz/
 re+8jy1XfP5wr5K0tQ/+xoWZPwOk80mqQFgrX5UY3OYOCighrNEGgA1/qZ/9SDIVydygc178
 4JGMJD4Z/LfD1HZK3BjjVQZuxB/DDxysGVbInlo0uEkWlRGtxdBkxCe3+m+wVNNXF7OaY=
X-IronPort-AV: E=Sophos;i="5.93,350,1654574400"; 
   d="scan'208";a="81473564"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5lf/Ns9Tl9UIfu+C4MwAw/AQa0b2vIUxjL917jUuLruve8HdwJ9m9IyqEtP1Jn9XFG4FslKPmSiMeWB9d7wjQ56khyCXi90MEJrXS2+iEB1nFYffbM+EQoBe2WF1Xa2y+ipb1O4xuaMmZBLUMmARNxcm2pvSyQdh4r87tHzRNMHSx9FZdjAN5kVe8KxEI38x9AWsmdVXfe3YYAFtOykL07Wj53HU8Sc+u4vhqvSsXUw2QikvzIP5HnE1UrYFUilk4DfeMfwCvHB21GLq1TLJ5FvD58yOeUhG49IEzcenqUqaqXxNpgPif30gRnRONlalOtR52mes0oPwOeg3T6peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1Yj/OR6wUofZ6oxF8HJMJwNFT/G5tVRxSxKLfX+1u8=;
 b=PWBI6HsOnabg8YOElBWjcyEtr5moAZagv+VXFlDfmwsyCpbTy3qJD8g/76qVzHxnu/C3QGg6VVbm6w8Bft46kw81E2LR/dsC1Dxk5t9st4s9DFIhFKT2G7Y/5L6NGKYgr0h57bk5yks1IcuXNwk8ud/IuwGyYQklUhF7wEZIhhZ0IAMhEmtXDArI7A7wPTPKstmW+LoBtVBuJmaYLqn+9nhqBKDOVNpcr9/z7EOEGsemYjIkvWbsLtpDcLYlZBg5+CXkzys2t6VFR+X+AWPXGmOKX0zZ1smGgb7ImAyylScHDc+DyfxJdQNKvTcPZLP5Off8qgnTYIeyOXOKXYEC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1Yj/OR6wUofZ6oxF8HJMJwNFT/G5tVRxSxKLfX+1u8=;
 b=ql20yN8CaZR0NMTwCE7gPY5l6OjZHbzjYfJMkZBFZF0ECIJ/hyzueh80OD6PatHlIh174vpPRcOZYOp/ajCNSkjHJ3p87nVBc3TYk14SnXyUro75z/3wIRiQaGgN/nBguJQzjto+hBcoYmG3gTOfyUNDt32gyHfGp8UlEZAHpPE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
Thread-Topic: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
Thread-Index: AQHY0ahGyNiffGBomUWUhynqT69//63z4wWAgAAJ64A=
Date: Tue, 27 Sep 2022 23:23:20 +0000
Message-ID: <29effece-f467-0763-9b88-85d0eba076a1@citrix.com>
References: <20220926130213.28274-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2209271545110.922084@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209271545110.922084@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW5PR03MB6878:EE_
x-ms-office365-filtering-correlation-id: 914738a8-6000-483b-e953-08daa0df43d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vSt1J/lhPn2IF72NiZuRjlqaTOQR5GQeF9cP8EHb8rjuMHUcUG1f5DZ4IFQvVlhER9j6zuXztNYfbLr4MRupVzZmExgK6Q9UcMvyhaEGkRQJArfu49YaC5A8yQPj4r9R4ww40elqU+xnHkmEBJKKW/3Nj2Nz0FOdNKOQqcgKRNR4JqmF7LNKIvFfMtyN0e1r/lorzqzkRZoy0b2EjUCNHMixrD92PvnhJZxko+3l+/q4FPSDK7XEjmPzT2+XxIgckAu4KpEufHqYsFVamNQ2890C1JdQ4AUVRWIUGfLNoJsFYW2b/edDuLAzp1v05bdu3B8NYG6U55r6QHQbFciWpcGsWbF/bEjlI/n39iy+b5it/rrz7K31TN+4RvZ9MGlBwpPmQB3xV2DruAtaVyhcaYUhhJoWCE6tfF7Eh6J7ZSb8kfbYxt10SsaJFm+1XDt1ZZqWAMsAAe3eXvcNZfRompq3D1DGqdpSigQr34lH4ibrqm8JtkGJASIjrVRUFvtblOBX4Z9hDOs6x8P77ET+jOnXTYrEcgT9Gj5iuxn3hfmxW53dRSwN1NEJNagWTGHj/SMkii8joRJUnAY+OAQJZk2bEkoKT9YeJiA2vbP2bWvLN7w2jNGmjwD6z0AvOrwCj4PVdvtq9+yOoCDIZVHbYy5gi0qvAflf46grR7xC/mjfmXuZeAgYFtEFyW4L73o6zbgYwItF1LMDNVjhjbYns1eEewhWAILWUyfi9ZvN9qjAn97dsDWQ+n+ot+RyNuO0+Ny/yn4mMpDmwdXYhbtL1aJkZJ/j8OFuHHTNKyMbdeBI9keN1ks28djhPWp43R5GJM9PNPS8hJO3yq88JqnyOw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(31686004)(38070700005)(6486002)(71200400001)(6916009)(478600001)(82960400001)(316002)(54906003)(66446008)(26005)(66476007)(91956017)(186003)(122000001)(4326008)(64756008)(38100700002)(66946007)(8676002)(76116006)(66556008)(2906002)(41300700001)(6512007)(5660300002)(86362001)(36756003)(83380400001)(2616005)(6506007)(31696002)(53546011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGJZT3dXY0g5N2dRTEM0aVhxOXVsaXQ3RHF6TE5tSUJlMlVsbTFheXVoakQr?=
 =?utf-8?B?cGF3NDltRERtVkFpSGRhWjU4VjYvRkdaTnVUeDE5MkZtL2RTamhrZjg0WWk4?=
 =?utf-8?B?MTVzR0U1M1BXK2xSUjhGdUl6UEovOFNYSU5NenE1WEZRZXNLYnh3UEVVeDJU?=
 =?utf-8?B?VHcrdmNlL0c5N0k0dTdmT0U2N2R3djlmRXZacFY2WWlmK1JuUE9uTVdsc0dy?=
 =?utf-8?B?MW5Vd3FncVlDM1JyTlRNS3hXdTRjOXNBSkxCL0lPRHczNkZac2NJSGwxdlEy?=
 =?utf-8?B?L3pvWmJoRytzN3B4Qm9pOSsxeHZ2bC9ONGRjOUs3cnFnZ0NKYisxeUxOdVNY?=
 =?utf-8?B?QjVnSG12RWNUb2ZYWUhGcHVXNU1jWFFnU1ROUHZNVVg0ZjBkd3UzUU00b3RN?=
 =?utf-8?B?VXY3aitmZzhmRGczbVFxL1RMNVNJQW5NaUdOcXdVemxwL21XQlN0cnZyb1Jt?=
 =?utf-8?B?clpmZGZlbTg4Z2pkYUF6NDRwL2dxem45dU1sOTREUW03WEpybnBpKzZka0ZH?=
 =?utf-8?B?TWd3ZmtGTDF4SS85N2kxaE1CY3hQT0lhY080MDVzZU4wMXVrOWxFck5ENzJH?=
 =?utf-8?B?c2ZsRTRSNEp5K2I4TTY0dmk3azRLSGdyUHgxUnNBQVBGRnBtY2lxMm1jdmFm?=
 =?utf-8?B?ck5kMHBmVlg5T0hDditaRlpuZ0g0dGU0VkZZSWszQ1NsSys4MWkyeW44d2x5?=
 =?utf-8?B?MFJFMmtpaDNMdVFCYTJzMTZYb0crOXA5QVpCaHVRSnp4bHpNTVZPR01vMVh4?=
 =?utf-8?B?VHFWZXB6OVhYelFCaEVSV0ZNcTBQZUR2dk1BcVBDR3BNZ1dUcU4zcmxpczZL?=
 =?utf-8?B?TVh4aGZBNjQxUHdwUVZPRTFyejFyRnk3eC9QTDBvVWRVckM4ZWQ0SVNPcXlp?=
 =?utf-8?B?N21IZmVoYzhIakRzMS9NcjM2czRKUHZnemdieUwrWGt2V3hWZS9JcDlXcFRX?=
 =?utf-8?B?VGhxdWswSjZZaXViYVJFYVM2QzVzWlQ0eGtZMXgvUnZzTUNjUW1BcFNHUFNG?=
 =?utf-8?B?djM2YVVGSjNxVEl1YjI5YytmTzh2aTJWWHRoUmZud093dlluU0pteitRaUkz?=
 =?utf-8?B?cWNBb25JamRrc21WU1crSENvR2lVY2Y2Wlk0alk4M1diK3R5dlVnSnNqRXZG?=
 =?utf-8?B?OEJxQk56R1pQRjhobThHdG5ienpLaHpqbEc4VWlXWWtrUk1sckg1VlMwNmtT?=
 =?utf-8?B?VTc0RFpEdzRBYmcrekxCUlNiWU0vR3IxWHRTT0Qya1lCWnBndlY0VThWeml1?=
 =?utf-8?B?Nm90TitmM0pkOFhIT3pKMzhTVU91VnM3RGoyYmQ1QjdRQlpKWDFSdVlBeFY0?=
 =?utf-8?B?VHhYT284aFZCVi9xUTVIVzcrdGZLV3Yrd0NWcGdqSWttVG5BTGtmckp2S3ov?=
 =?utf-8?B?MVEyM2RhRWhFYTFFZk13cGV0MTk1WGFzb2lsbFpqYlFLL1Q3czJTelNXbkg0?=
 =?utf-8?B?S2VTcmphUHlxSTNHcGxDSFZhbzlhVTdJMlZKR0wyVmVSbUlGYXY5VkREM3ZF?=
 =?utf-8?B?b3NOeERtdTQyRzNHN2FkUEVPVVRjTG8yekRsaVJwelFxWm53UVBVNTQ0VmEw?=
 =?utf-8?B?ZWJBUHQ0SEJBNzB6SUdLSjJXc0NwcUdGNHVEakdDTEpwTERFaWxmV1hRY0RM?=
 =?utf-8?B?cFdUNW5TRmZjMCtXVzhRZ1B1UWdKelJWZjBwRzdpbmFEZG80d0FkcmVDbHNQ?=
 =?utf-8?B?NEN0MmRzNXpEbCtYWGNMc0FXQkJSWExmMVpYR1BmS281THRzelZoclVUYjRn?=
 =?utf-8?B?OTFVYk5lQUpWZVlqMVNydk9WS1V5RVpPbnJoUEdWSWluWjVPYnJEQkwvVzhF?=
 =?utf-8?B?VkZwZUtNVkRXV01BMUdlK3dkYWd5d09hbEFIbkVoT2cwdjg2WlFwZm9mYXhP?=
 =?utf-8?B?K0dkNHlPczVvTnFDY2RZVEJuQndrdGJzNHY1NTRxR0pySThZVm5Gb0doRDlT?=
 =?utf-8?B?T09xVitVRmVLVXBNMG1ONjRnMHUrOGVhNHB3UzlNL1hMVXBTRjB1bng0TlNt?=
 =?utf-8?B?N3VubFBZaWVSMUdvbTBQLzhHMWdJNjBvV3RLdDlUVWFUcEx4Q0Rtdk5MK3ZG?=
 =?utf-8?B?MjQ0VmRDM3I5MXQzU0x1dTBDMlBGaVBublREL2FienVjQUZ2SzJ4Uy9XUkdk?=
 =?utf-8?Q?fzPoyhiGbFJgoFpAajNw6WaC0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <134BDDDBBAB3ED44AC0BF4D750AC1E31@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914738a8-6000-483b-e953-08daa0df43d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 23:23:20.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1AIL7I/5H55E3zYKjQEDbXyVZ+COVBqikts0nPePPgXBEY6RMsHz6c1u/APpGjHYzLkMny5HI6NgNZhPngTAgKsu6BdKrmkFHG7LpBstxlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6878

T24gMjcvMDkvMjAyMiAyMzo0NywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBNb24s
IDI2IFNlcCAyMDIyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gYnVzdGVyLWdjYy1pYnQgaXMg
YSBkZWRpY2F0ZWQgdGVzdCB0byBydW4gYSBub3QteWV0LXVwc3RyZWFtZWQgY29tcGlsZXIgcGF0
Y2gNCj4+IHdoaWNoIGlzIHJlbGV2YW50IHRvIENPTkZJR19YRU5fSUJUIGluIDQuMTcgYW5kIGxh
dGVyLg0KPj4NCj4+IEZvcmNlIGl0IG9uLCByYXRoZXIgdGhhbiBoYXZpbmcgNTAlIG9mIHRoZSBq
b2JzIG5vdCB0ZXN0aW5nIHdoYXQgdGhleSdyZQ0KPj4gc3VwcG9zZWQgdG8gYmUgdGVzdGluZy4N
Cj4+DQo+PiBGaXhlczogNWQ1OTQyMTgxNWQ1ICgieDg2OiBVc2UgY29udHJvbCBmbG93IHR5cGVj
aGVja2luZyB3aGVyZSBwb3NzaWJsZSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzogRG91ZyBHb2xkc3Rl
aW4gPGNhcmRvZUBjYXJkb2UuY29tPg0KPj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4+IENDOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
DQo+Pg0KPj4gRm9yIDQuMTc6IFRoaXMgaXMgYnVnZml4IHRvIENJIG9ubHksIHRvIGF2b2lkIGl0
IHByb2R1Y2luZyBhIGZhbHNlIG5lZ2F0aXZlLg0KPj4gQ3VycmVudGx5LCB0aGUgdGVzdCBpbnRl
cm1pdHRlbnRseSBmYWlscyB0byBzcG90IHRoZSBlcnJvciBpdCB3YXMgaW50ZW5kZWQgdG8NCj4+
IGlkZW50aWZ5LiAgSXQgaXMgdmVyeSBsb3cgcmlzayBhcyBmYXIgYXMgdGhlIDQuMTcgcmVsZWFz
ZSBnb2VzLg0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgVmVyeSByZWNlbnRseSBNaWNoYWwgaGFz
IGFkZGVkIGEgc2ltaWxhcg0KPiBFWFRSQV9YRU5fQ09ORklHIG9wdGlvbi4NCg0KSSBrbm93IC0g
dGhhdCdzIHdoZXJlIEkgc3RvXlcgYm9ycm93ZWQgdGhlIGlkZWEgZnJvbS4NCg0KPiBJZiB5b3Ug
YXJlIE9LIHdpdGggaXQsIEknbGwgcmVuYW1lDQo+IEVYVFJBX0ZJWEVEX1JBTkRDT05GSUcgdG8g
RVhUUkFfWEVOX0NPTkZJRyBpbiB0aGlzIHBhdGNoIGZvcg0KPiBjb25zaXN0ZW5jeS4gSSBjYW4g
ZG8gaXQgb24gY29tbWl0Lg0KDQpObywgdGhhdCB3aWxsIGJyZWFrIHRoZSBmaXguDQoNClRoZXNl
IGFyZSBub3Qgb3B0aW9ucyB0byBiZSBpbnNlcnRlZCBpbnRvIGEgcmVndWxhciAuY29uZmlnLg0K
DQpUaGVzZSBhcmUgb3B0aW9ucyBwYXNzZWQgdG8gYG1ha2UgcmFuZGNvbmZpZ2AgdmlhIGEgc2lk
ZWRvb3IgKHRoZQ0KS0NPTkZJR19BTExDT05GSUc9IHZhcmlhYmxlKSBjYXVzaW5nIHRoZW0gdG8g
YmUgaGFuZGxlZCBzcGVjaWFsbHkgd2hpbGUNCnRoZSByZWd1bGFyIC5jb25maWcgZmlsZSBpcyBo
YXMgaXQncyBjb250ZW50cyByYW5kb21pc2VkLg0KDQp+QW5kcmV3DQo=

