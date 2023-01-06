Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246736602B3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472743.733092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoHD-0004Hq-KC; Fri, 06 Jan 2023 15:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472743.733092; Fri, 06 Jan 2023 15:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoHD-0004FO-Gd; Fri, 06 Jan 2023 15:04:59 +0000
Received: by outflank-mailman (input) for mailman id 472743;
 Fri, 06 Jan 2023 15:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDo8k-0008RI-DA
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:56:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4159138a-8dd2-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:56:11 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 09:55:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:55:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 14:55:45 +0000
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
X-Inumbo-ID: 4159138a-8dd2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673016971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y6nqwjCeO6yIH8eftBJ7Xpict7gjEx2x3YmP+N15b4c=;
  b=AJ7a2zyVM9HgI+lBlJmJYSG1CWyFsAUCw63xF0qDUWCtDbxCltOFMCrc
   Eh+AvvncBPtiOWsaI4LD81vLBizECL0qvMG+RNAV/4ddLhtH7zkq2Engd
   tHdTwQxGuHwR0WFsEm+6crrkKaoZhA0wYLI+V6jxhdf9A+Q/zIGOpEesF
   k=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 90432588
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pyYw0aLtNcLAU0NvFE+RSpQlxSXFcZb7ZxGr2PjKsXjdYENSg2YGy
 mdLDGnUPfyDYmLzf41wPYy19k0FvpWAyIBrQFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wRgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vC2FV9
 PMfAwokSTvblezm4Z7rdMpV05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHunA9hPRO3QGvhC3nOi4i8TOSwtCgGL++a/rEKadIhBN
 BlBksYphe1onKCxdfH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv5sEaezisD+EBnqw
 i6Ntyk4jPMYistj/6+891rWjimsopXMRwgd6QDeX2bj5QR8DKasY42z9VHa97BONo+fRVial
 GcIkI6V6+VmJZqKkiqKQukEArCyz/mAOTzYx1VoGvEcGy+F/neiecVa5m54LUIwasIcI2axO
 AnUpB9b44JVMD2yd6hrbomtCsMsi6/9CdDiUfOSZd1LCnRsSDK6EOhVTRb49wjQfIIEy/pX1
 UuzGSp0MUsnNA==
IronPort-HdrOrdr: A9a23:qvsDdqOPQCkUO8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="90432588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4YR2n1k8weDMCmcqvXEEtZ4lP/nhok4woeIP7Okv76b+8VH2AV/RLAGd8n67RwoaK0uVbLovQNRCV88x5EbTvjvjSJSfgVUVGmv3E7dsnl5MQ5H9YxE6yRlKykV09ecMnzaxXq4HFYP6labhCBBfXTi53yh3Gj4YoutM7J2+rBLjhjjp0PvOyOtaVwnvD0mhH04R07PwpHf2gpCcymmE2IWmZ1kXuTt42xINC4MLSUVTofNsf/TZ1l7n09KxfO6kCI2r2yMGbtb7ciWzGqTkg/H5jnIQnk99vNUOx3EFV3bGES+SINUB1XsHGO4SYbvOMytg2jkHg6CfhhCE73N5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6nqwjCeO6yIH8eftBJ7Xpict7gjEx2x3YmP+N15b4c=;
 b=ZrtkplRlKvwTWfAyVK03tMEA+y+9i4lu8aXzV3KJ2BXQl/HSsQV/DaXAjpOrhJT7yZCZ/UI7PrFFbq0PMtfFlZ71FrgPT9s14cVSZZTkcYIhIQFHSr/fNse+YnsrLnloAf+HYlnjt0cueXc71SQoS47x9Domz7tvvqpjmHaRsYaycSARA31GLUwKMmuSTlLSldQ6ep9omizZ8K7VS6SmZfK9IuslSjOP7vzH4WKaAmrzWjbdR1g6olYOSzc++qPqGwG0FlmHnYn7+/quLEMfZaKMMB+WlthyaS2fM+SzPp18sMCAMvdM56zPsAu0X/BA13mhyYuBZVJNmWdaouFPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6nqwjCeO6yIH8eftBJ7Xpict7gjEx2x3YmP+N15b4c=;
 b=Wp7NRNs+IropkTTTFu4f+ameUEif6qThcmfZKq52HRSu5iEqrrHEBavjebZMMN4emLp1doQztEyWLotLE3bBrY6gIdilcYOsnxpcNPeD2II3zovwylTUFV31qjQYpV/hcM2IthGUoQibb0Yhft5FYh4LBXYzQLQD3BYjeK6BZEE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce stack stuff
Thread-Topic: [PATCH v1 3/8] xen/riscv: introduce stack stuff
Thread-Index: AQHZIdDaBwrpw7Xp9EGdXN7qbTOW/a6RekUA
Date: Fri, 6 Jan 2023 14:55:44 +0000
Message-ID: <ab3c05b2-14a2-6860-0452-c8873617f332@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6151:EE_
x-ms-office365-filtering-correlation-id: ed02e942-0001-4006-13d0-08daeff616d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Lmyb4e0csK28luGYz/fJ2JV1vv2uAckOP+nDyUIceCuALgTLYBzpUkGM3WTldWEQw91Myr7i9v8qXeAYgrub0mFLuZlW39iDEBHXUQ66rU4G4/r95AzGTLGESx7Ssz84vAb73+AjrgtIGxV3X5c6Ie7Lja+uO/xt5c7psQuGQVBfcRbP0qZTVqfWjc0ojQPR5HqnjBj0/Y3m0IGRE5e0nA/VatXIi6rwRN5rW/BfOrb36PpofeF4Q4Gu5k2lErHXdEWjcMMxFNZj2+em6DryXzxXMQk8bkKFl1gJI+RvbWHbr7V/KdLtk64p64qjJAA69MRtT275KAgAFIiBaUcmpgwAnrCx7l3oTqCKtNNRuXVS4ZfUsTlyd7RXQ3Hmm7dZjddnr5VjrOEIZuxJz5T0vkmgUWPFkHAMBNl8kFfqF6SOwFd0JCOqOrxe7vwfljjnIoNVX8/rQru6U9gb901xmXinwwUor5tc0ZYt8pfpYrGFO72s1+1e+DelT34v6toLkHH0rz2idEKQY8kRhW0oW1n7FomPO0gE6CnrvdDepYqzLEX4X0UbJA9L3a9QQqlOqi7rk8cLtrZtERlpRnf7B8ebAl24lk43Stef2nsz5CdtnJT/kPUOIwZHcqRQdcVUfp+soNgnAgoK8ydLx4c+vrHMilwcuXWBDGR+EQpbfodTxqgGvsLaC20uRl7Wkss9hTGXK9OqOmz4Jz+f6T+DdlgqFHLpiLueypwpb24Aq6pTokGf47aJP67wmxMynRe44Sd+qmo2JyantSuQFrzkIQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(26005)(186003)(6512007)(6486002)(8936002)(53546011)(478600001)(6506007)(31686004)(71200400001)(91956017)(316002)(66946007)(54906003)(2616005)(8676002)(66476007)(64756008)(66446008)(66556008)(76116006)(82960400001)(4326008)(41300700001)(38070700005)(36756003)(122000001)(83380400001)(5660300002)(2906002)(110136005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkpraHlCekVqdTRTR0FTMXpybUZQcFlMaFlwTUNmWDRzeW1YQnV5OVZIUkMr?=
 =?utf-8?B?M280MjFrbHdlU21UOEpXU1JzQXJHbGxqTE1JZ2dpM0NUTkYyOEU5aHBPN2xS?=
 =?utf-8?B?cjBWSzR6ZG1lbEFNYldndEJNR04rb0JMbWtEdmdGL2RMMU5CZE85SzVVc1hT?=
 =?utf-8?B?c29ESU1Tc2QwOEhxR0lObTN3S0R4NU1Zak5PeDltL0pUTFkydkpxcSswZ1ow?=
 =?utf-8?B?NXJuSjJxN1loUjR5eStCM2ZhMTE3ZnlYOFdvUU5sS0hzZThpK1VwRVlzSXVu?=
 =?utf-8?B?V0lLVnkvTGIxY3pFSFRoZHpRK3ZQWXhHdnY2QjlvNHZGWkZxdmVPZTNoT1JJ?=
 =?utf-8?B?MkpNL2N2dDdLR1dud3hzdVBuV0ZaV0VlL2pzYmNoYTJpQmd3Y2haYkM5ZUs2?=
 =?utf-8?B?RW9BOVdyVlpBVlVlbHFtWmFiWmNuVUpMWlVJUloyU3hjanFQWmw3a3krUTY5?=
 =?utf-8?B?M25INnY2U2ZXa080MVh3Mk1Nb3IrdnR1TllaWWZiOE00Smk0dXFURFoxWk96?=
 =?utf-8?B?aWdLbTNERUh4Qm83dmxxckhJdkJiVXM0MlkxV0tvMkthOFkwNjFGd1ZlVGdO?=
 =?utf-8?B?TTlLeHE3MUZPVWdvNzlteFhxbFJEWlZoYzNpM2d5Ukl4M0VveEhZalZZOThq?=
 =?utf-8?B?aGdwTHdzbXhZcCtDNzBkYWYzQmFUdDUzMWJ4cnNkaFJ5b0lSelJnSjRIeU1Y?=
 =?utf-8?B?Y1BVNTRpc2xuaDY1V0d4MDNnWnVvdzYzUlJ5SHJZSzl4Rnh3YUp6b1JCQWRu?=
 =?utf-8?B?THo2ZkVYL0JNTWFQVEQ0VzJnTWtRS2tMSW8zM2g4dVlsaTBDRXplOWNRbWFM?=
 =?utf-8?B?T2x6d2xna2FJRFV1a05iVUxBNVRBMWJKbERERG5CQ0dhRFhiM205OERHZFV2?=
 =?utf-8?B?NFVaVWYvdldMMVhyRTFFNUlYbmRWNVp6OXNLQ1JZbUFiY2J6RHljcGhFMW9K?=
 =?utf-8?B?TUw1MVdUeCtVeXFVcS85ZGRQRkVxMEJ3VmQzV3haN211ZWJIMUtxMC85T3pn?=
 =?utf-8?B?VXJQTXBsY1B2b1pMRTN5NTdjTHRIS3IreElReWl5dC9tYThIcEcxNDlXYVNJ?=
 =?utf-8?B?SnFENnZ3ZWE0Z3AzaXNEbks5MHdPcjkyQmRoMllUZjdSVEc2ME9SNUU3S2ZH?=
 =?utf-8?B?dGI4czJiNFJNMURsL0hMUUZsaUFhRC81NTA3eFhPd2xyd1d4WEJXaXlpWTBR?=
 =?utf-8?B?SmYvL1ZYWm1RN2U0ZlVmQlNVYWFOMGNwSFRQbnc2Q25uVDhEMW5YakRTZ2dN?=
 =?utf-8?B?K25KOHpvaVJocWs4Z1JVa0U2bERyaXdWUmY0Sk9QakJzK2dMS0VpRy9BaXVB?=
 =?utf-8?B?VTFxcWNBeG5aMk1WeWlLWU52UHVJUCtEL3dic1ZXWlNiQ1JEbkVWSzZUbjha?=
 =?utf-8?B?VzVMeTB2SnJGYk9XL2pmM1llU0JUVTc4bVlVamJTT3dkQTVWM3ZPb0FOb0Nm?=
 =?utf-8?B?c2tleXh6QVF4Wit6b3dTMWtlRzBVZ2tFb1BqMmJhZVRKR3A3U2V0R0FrUHVS?=
 =?utf-8?B?djd0TmVVcklkMy85YTBpTCtlOXlKamdZQ2RZclNET3E0TFlnRTlaUnJJZFp6?=
 =?utf-8?B?eTdQSGc4YmpWby9oRDA4TGd2VXowcCt2cnVXa0dnbUxEZnlQTVhIQTE5bFAr?=
 =?utf-8?B?RUswVDY0cjNWbm4xZUV5QlJ1OCt5WDdhNjVFVzVjc0lOaHhrcXlaSTJZSUJB?=
 =?utf-8?B?WVN6N1I1NHIwcEpSRkVsZTYrUE9HVFRLVHg4TWZLUzArS3lsYW9oekhyM2R0?=
 =?utf-8?B?UHd5SU02MGlRNi82Y25NQnFKQ1lMSkxkMGVwZ2RENStXTDFRd1ltSS9yWS9w?=
 =?utf-8?B?YzJibzVkU0dIVlZOWmNGSjZmNU51bklISzQ5ZldxbjhiTk5vZldSTFpFSnJz?=
 =?utf-8?B?NjVNcFFNOHBrT2FpM1lQdTRSUUpQMVZZMU1vYW5xZU5GVXBFNFNoUDBOeGVR?=
 =?utf-8?B?Mk1vcTM4eHo3RjBmTkN1eC93ZTkvK2Y4U1pqd2VNMjVSaEdtMTlTY09IcFJQ?=
 =?utf-8?B?T0Y1QkhmU3Qzc3NSSk4vWEtCZVpJclhuVHpjcWdYNXJ3cXl4TzJFSGQwVGpB?=
 =?utf-8?B?WUpvT3R3aytEWnlvQUcvOTY4ck92QzEwb2lWdHBRMFExV1krcWg1QnYwWFNt?=
 =?utf-8?B?ZVJyK2hBU0JKN3NGMzE1OFZIMWVGMXArWWhleCtOQzJDSVBrQkE5dklGKzBI?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D76733CFA921E4C803663BEC4C94DEC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Y05VVS9XMjZlMllNV0ExMkwzUHJzMTdSVUdXVmlhWkQ2UXFENHBJZlRINGZX?=
 =?utf-8?B?UHAvYUZXbVZJVGpzV3lHYVNqWkZkYjVCd1IxNlJMaVdsSHM5R3RMRVVqN2N3?=
 =?utf-8?B?RE52ZVFzandaN2cvL3NGSHVYUFNOZmFxdllubWF1Q2J3YzZGZ201K2Y2Nm00?=
 =?utf-8?B?M3NqMWoyQ1czWkRUa2xPcFVVQmJOUkhpNVR1UGtCd3YxeG9UY3UrK3lrVEtO?=
 =?utf-8?B?dHJkbWd5L2NBeFE4L1c4bDhiVktBc09YRk9Eb0NzcVpQelhqa3VMU0JGOXhQ?=
 =?utf-8?B?SC9TYWpPZnRxbkx0WmlxK3phbW9WaDF3MFFkUXduUXM1eUdEZjV5RGY5a2p4?=
 =?utf-8?B?czJuY09jY0laYXJUbkdzRnFuTzhUR0VvWVM4VnFHUmZaMU5NQnJSRDMzRTlv?=
 =?utf-8?B?VmlyQzdacU95Vy9BRmVmVWUrUnozMEEvUTB5dHpRUE1wWjZXamd2TEhLSlR1?=
 =?utf-8?B?dXBCRlU5RURna0RnY3ZhRms3VG9oSTgzNzI0emRnQUR0TVdsYUplMUd0MlVL?=
 =?utf-8?B?ajc4TWlESW5RVlJXRWd2VmtNV1hyMWk2Z216aGZEWU9XanI4ZDhKYzRVeTJC?=
 =?utf-8?B?dW1iRkxuaUJWdnhDVDdkVlVjOWtJQ09GNnh6TzQrYXZXaS80eGg4Mk9EWVFD?=
 =?utf-8?B?R3IzL3JGemFrZ1hLbUdZRUF1cU9wWUg1Vmx2eVRsWWY3eVBLdDZ1NnZtc2x5?=
 =?utf-8?B?OC9nRDZqWmZpNWtOYlN0bDZpQVRxRzEvL2tGUXAxUTZ5UERYSWhIUkg4WlYw?=
 =?utf-8?B?TmZtNjZlVUdFV1NRUm55TGU2K1VsVUwrbXAzcnpYaW0zbkQ0Yytwb2xxU2xJ?=
 =?utf-8?B?QStEOGwzLzNZYTBxVnNXUkNHR250WFpjV2N2OGRqbG55NHBjNldWRndCOFZT?=
 =?utf-8?B?a0ZLY3pVU2YwSnZGMEtJTzhFZ2R1YnFyTk9hbXVaTWxqNzR5Q21uQmdhK3NH?=
 =?utf-8?B?RVJuQlNqNy9NUXBIelM5aGhRVFowamJZU24wbWllYjVqTXhDQlBKS2pONnN1?=
 =?utf-8?B?dEZVSEV6WWYyTkVDUFBqRzRxNE5MVWZwQTIvNStUTTFqUGRzdmV6Y0E5dno3?=
 =?utf-8?B?WTVFYURSQ2ZDYmM1WGlzKzlBWFpWMTgxWEZqWG1hTTE3OUh4Q2FUQ2tWMmky?=
 =?utf-8?B?WFRtRHdseXNEYnY2Z2IrOWxEc3NXKzlKVEgwWThYMllid2NEbGZEKzAvd0c1?=
 =?utf-8?B?OUsrcHRhZFVIc3RmOTlpbWRXc0EwL01KS0pzeUtPZkRXaDdnRGk4K1gvWDA4?=
 =?utf-8?Q?eco7TEMUDbb3bWT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed02e942-0001-4006-13d0-08daeff616d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 14:55:44.9515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S48rDDuw/IZz0Bpd8awmrIwg2rEUXIhmH5XhFIlE7sk0NJOlQkBUGijQ6zJTsxgIZQYrpeK98HmSn0UJKQury8/eTNIExP6teTJ6W7u6eH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151

T24gMDYvMDEvMjAyMyAxOjE0IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvcmlzY3Y2NC9oZWFkLlMgYi94ZW4vYXJjaC9yaXNjdi9yaXNj
djY0L2hlYWQuUw0KPiBpbmRleCA5OTBlZGI3MGEwLi5kZGM3MTA0NzAxIDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC9yaXNjdi9yaXNjdjY0L2hlYWQuUw0KPiArKysgYi94ZW4vYXJjaC9yaXNjdi9y
aXNjdjY0L2hlYWQuUw0KPiBAQCAtMSw0ICsxLDEwIEBADQo+ICAgICAgICAgIC5zZWN0aW9uIC50
ZXh0LmhlYWRlciwgImF4IiwgJXByb2diaXRzDQo+ICANCj4gIEVOVFJZKHN0YXJ0KQ0KPiAtICAg
ICAgICBqICBzdGFydA0KPiArICAgICAgICBsYSAgICAgIHNwLCBjcHUwX2Jvb3Rfc3RhY2sNCj4g
KyAgICAgICAgbGkgICAgICB0MCwgUEFHRV9TSVpFDQo+ICsgICAgICAgIGFkZCAgICAgc3AsIHNw
LCB0MA0KPiArDQo+ICtfc3RhcnRfaGFuZzoNCj4gKyAgICAgICAgd2ZpDQo+ICsgICAgICAgIGog
IF9zdGFydF9oYW5nDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9yaXNjdi9zZXR1cC5jIGIveGVu
L2FyY2gvcmlzY3Yvc2V0dXAuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwMDAwLi4yYzdkY2ExZGFhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIveGVuL2FyY2gvcmlz
Y3Yvc2V0dXAuYw0KPiBAQCAtMCwwICsxLDYgQEANCj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0K
PiArI2luY2x1ZGUgPHhlbi9jb21waWxlLmg+DQo+ICsNCj4gKy8qIFhlbiBzdGFjayBmb3IgYnJp
bmdpbmcgdXAgdGhlIGZpcnN0IENQVS4gKi8NCj4gK3Vuc2lnbmVkIGNoYXIgX19pbml0ZGF0YSBj
cHUwX2Jvb3Rfc3RhY2tbUEFHRV9TSVpFXQ0KPiArICAgIF9fYWxpZ25lZChQQUdFX1NJWkUpOw0K
DQpBaCwgSSBkaWRuJ3Qgc3BvdCBoaXMgd2hlbiBsb29raW5nIGF0IHRoZSB1bmlmaWVkIGRlbHRh
IG9mIHRoZSBzZXJpZXMuDQoNCllvdSB3YW50IG1vc3Qgb2YgcGF0Y2ggNyBtZXJnZWQgaW50byB0
aGlzLCBzbyB3ZSBlbmQgdXAgd2l0aA0KDQordm9pZCBfX2luaXQgbm9yZXR1cm4gc3RhcnRfeGVu
KHZvaWQpDQorew0KK8KgwqDCoCBmb3IgKCA7OyApDQorwqDCoMKgwqDCoMKgwqAgYXNtIHZvbGF0
aWxlICgid2ZpIik7DQorDQorwqDCoMKgIHVucmVhY2hhYmxlKCk7DQorfQ0KDQppbiBzZXR1cC5j
IHRvby7CoCBUaGF0IG1lYW5zIHdlIGRvbid0IHRyYW5zaWVudGx5IGFkZCBfc3RhcnRfaGFuZyBq
dXN0IHRvDQpkZWxldGUgaXQgMyBwYXRjaGVzIGxhdGVyLsKgIChBbmQgaXQgd2lsbCBmaXggSmFu
J3Mgb2JzZXJ2YXRpb24gYWJvdXQgdGhlDQptaXNhbGlnbmVkIG9wZXJhbmQuKQ0KDQpBZGRpbmcg
dGhlIGVhcmx5X3ByaW50aygiSGVsbG8gZnJvbSBDIGVudlxuIik7IGxpbmUgd2FudHMgbWVyZ2lu
ZyBpbnRvDQpwYXRjaCA2Lg0KDQp+QW5kcmV3DQo=

