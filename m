Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF463F28D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450758.708190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kN5-0007C4-TK; Thu, 01 Dec 2022 14:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450758.708190; Thu, 01 Dec 2022 14:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kN5-00078c-Oy; Thu, 01 Dec 2022 14:17:03 +0000
Received: by outflank-mailman (input) for mailman id 450758;
 Thu, 01 Dec 2022 14:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0kN3-00078W-I7
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:17:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0206170-7182-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:16:58 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 09:16:55 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BLAPR03MB5443.namprd03.prod.outlook.com (2603:10b6:208:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 14:16:54 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:16:53 +0000
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
X-Inumbo-ID: d0206170-7182-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669904218;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r3gpdYtysnz1aSDNjr62zKpdVXvwyrys4yV22BUop9E=;
  b=PiLXFF4FPFrnE5xxGA6wtZ6p0cjKrn9TNEQXn1nWak2D03rYzowKIaDn
   MdJ0I/BfOI5PYqmRwmmVTv3j5uEGUxu0u4p+2EvGfkZ9HexvG+pb4ohCa
   eI6jRceLnHNBywNsQ5GwmJDLRnbFTpczniHqEDdRX+f95uYq3NAEaTkYg
   I=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 86061910
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:buAcCajuLSDO7QSV3aO5Mv1TX161RxEKZh0ujC45NGQN5FlHY01je
 htvXT2BMqvcYjD1etwnb9+w90kHvZLQz9I3QAA//ywzHy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ4A2gDUhqRrtuLzaykWudQhc49IuL0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGya7I5efTTLSlRtkuUu
 GPAuXj+GBYZHNee1SCE4jSngeqncSbTCNxKSuTpr6YCbFu7300WUxsLD1WHp6eG11eABe90N
 2Epw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMM/WzECz
 FKCmNLtQzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1xbXFI88S+iyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:PLDTRK2bvtmzt8m1dCP9KgqjBLEkLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP4gr5J0tQ/uxoVJPtfZqkz+8Q3WBzB9eftWvd1VdARbsKhbcLqVbbakjDH4hmup
 uIGJIeNDSfNzZHZauQ2njbL+od
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86061910"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuSPedb8Gzk0sgw8sJwrEbdAGA0qROw9jnsPNkbE2SFTN93UbtqQHqr0i5a/ujhUuiEVVKkQx0jFSmz4lNNYbkSfmBrz5WOoA7QYmjRSFcGH6VtvZvZxQyQ9bVEYG9vw8NFcBOTLfNvLxPPE7qdmbIyg1adjVlxfufHXPGvWZujtnMsbcvASeCWOd2Bse9aLu/0AX2kM0sK8tq8cBnYACWAdZFnCLY0vjVkAac1UQoVd0xD6iWcZnTOXBHNeSrmJDE0H8g9PiC3E+9+Doblz0DH6XP892p5hylBpJRzEZoS/zvVFrfVVyxXIODrhY36y5Iyp+MtU9yLmCgG5C1iJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3gpdYtysnz1aSDNjr62zKpdVXvwyrys4yV22BUop9E=;
 b=FybKyNLCZu41MaOGzrawmOqVKDc7eZYGtMqROivj+4x2NKOtGQrWhJEXenrF/yQkdi1wt350tPg6Zp83yPZT3Gzd+kyUzPDS3oNdsVEH0Q2ikv8Klu+siqrlW8hu2L4s8UOpm+OxyQsNGNTAFJ+d9qLMZsbcDDY8LONSZBZVczmS8BbX9owTrwrGQ2fR4W/7F8JxbfN+0QwhAeAhCbMmfl8uD7qBc6NtnkAwIe2pb3irhU5ZTwLM+RVeslSAwj9ikDFOakvp15kuI/R9a1CqNAd0ZIdS3SkFALCk7aJLIMfkxPicdr+1zq5F9lmY6J8wuik7SErnjkBpJGy2xhYV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3gpdYtysnz1aSDNjr62zKpdVXvwyrys4yV22BUop9E=;
 b=LydppHu8MBWTxvm4z+xNTRW6+RAYM14jG8oSZKjxLzeqQsuNHyGdlMZSaOYuBxKfYbje5h7oLeR0W2ArcjNX8AbdN+ccsw7KJ9u38Z85CesUXhH2dLVPu/OJViYnmcE6nmChOJsGKpVuB/599YOv91klKVzeiUOqRHF2c490ePs=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBOHXDfX2gYxBg0iCW8c7bxa9Ka5Y7MWAgAAhD4CAAAIsgIAABU4A
Date: Thu, 1 Dec 2022 14:16:53 +0000
Message-ID: <DD8F6F10-D9D2-4433-B2D2-ADB419F2FB8B@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
 <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
 <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
 <08D59C99-A8F8-44B1-A081-FFB0CCA8A8C5@citrix.com>
In-Reply-To: <08D59C99-A8F8-44B1-A081-FFB0CCA8A8C5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BLAPR03MB5443:EE_
x-ms-office365-filtering-correlation-id: 9b86be05-d77e-42f1-3cb9-08dad3a6b27d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dpTVbgd2IGF1IR9IqEs3P4tUhvmCqN5mJgSdPtxKnnSd4NmAs12kh3g04CP8uvp1NXgOSZzAXZ7Kcm+ofIvzKJuJHH8fFBiE8vkeBFVWfDKt1bc956t1y0UmuVTCvUS4K0MEp0lfcaTwqa8QVwaqvD7KQcqPNScsm7VyxKjV9TyGg5qdqF9AxPcVraIbevi5K4b5JK547Nsgj2bJbMlWR9N1YmxWlwJmgQkdwBgMcUipU5O86AuVz4ApOkCuxXNw3GrPjGwYbMeCWh6JR32mBfY5VwhjP7eoqxKJT8jQaO31UYOgvgrRodj8Ahzxds1gvybAGA2XJr2bZZigIYCYITpFsa95jmjttWopVgBUcEIqoBtN633qUp4MpO+adEMVMN2hK24AJsdS60TXg6WslDG829beJWQbFuzBvP24xbX2c1ZrJh1fFhV3CLzaxvxBSH8bnMoO7F4Z65ebCKvucmA4PnOK7MKRSvFHjHhEai/P6xV20p4fZrYLwnqtXyBJNaZX5NoO1KC5FizGHOa0Rvqsre5vj/12gYcTG7J5SOxQPL69fwMoAJUBwKk7an33UmUnxUIzWeOELMlybN72bdNwOnfJ0RXaGlMgls1ruXEyRcvEHlM8/qZ5Q5UQ1omj0xKkX1NXkFV8wfA90Y3PfvzqI4cdqRJV2tQ1NHFTrRrfkCQhoQvFXccSxm/oI4pVttX7yThKYQ3WlILo/dXAzCL3EiL2Wu00TP9vww2bRbA4SxbvZi1eKTFygJ8pSP7OH0xw6laKlxxeSONmmLG7DSflpMdjM2nogeHIXquaSmXTmjjLdndjgr4btFDCMWZ2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199015)(83380400001)(38100700002)(122000001)(71200400001)(6486002)(6506007)(37006003)(33656002)(54906003)(966005)(26005)(6512007)(36756003)(86362001)(107886003)(38070700005)(82960400001)(5660300002)(186003)(2616005)(8936002)(478600001)(53546011)(66556008)(91956017)(6636002)(41300700001)(66446008)(8676002)(76116006)(2906002)(316002)(6862004)(64756008)(4326008)(66476007)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVhESktOM2hib2FTZEJUZlIvWCtObU43SStqQnoxdWUrOGZXSEptcEYwVExx?=
 =?utf-8?B?UVk0WmpMSGE3VUJQUTRSWmsvNWxtVTFSTFZuNUNuYy8xOTJGZWxUUUdOaUli?=
 =?utf-8?B?bFJoSlVpZHM2WGV3eDR3T01JaGl5YkxvdEIzcExHa3M1anU5bHg3MFY0R3JC?=
 =?utf-8?B?aXRVYTd6eERrYlFRZXBEVVEyQVIvVVpXV0hxK1pINjQvSnd6K252eVQxQkVI?=
 =?utf-8?B?WFNWRWFHQVhFaUxQVGltMUMzSW1vd3ZEM1hHSWN3MmFMS0dOSXphUTF2REZU?=
 =?utf-8?B?aHIxdmVybytHTUZENjh2eitGS0dYcUlSYU4vbFlPVkNzUDhDUE5mT2VsOTVC?=
 =?utf-8?B?UCtiWUxFM2ZDdCtIeEJUSDBPY0NUN3JMd3BRdmx2UUpackpxb2tJMnU2TDI0?=
 =?utf-8?B?aGk0TTdGMUI0Q0xVWVhWMFdRekF6NmJMSmhvVTBJWngzSHZYdkJaZ2VjQlIw?=
 =?utf-8?B?QW1KOTdDRDRkazdGSFUwemR2Umc3YWY3Y0ltcG9rT1N1cEs5TUFvL3BsNGJy?=
 =?utf-8?B?WTRUakhoeDcvc0FOS2h2R0xWZ2lzdlQ0djkxS1JoMHFWeWs4VWlrN0ZEajRs?=
 =?utf-8?B?d2ttVmoyVWFPckRvd0ZhNEIxQitaSkRsemVub0FSemV4dE5TaTE1SlhBZGM4?=
 =?utf-8?B?U2RyU1pZaVZOVnRmbFVreEpVdTAwbnhQcU5PNlAwY3kwTzZXdkZWS2tWZHA2?=
 =?utf-8?B?MnVzTVIwek1XUFdQK1RFVDNkdTNpeXVKVEp2aTVMNDdpVm1iME04U1RKd2ts?=
 =?utf-8?B?Ym9scE8yNVBJa0l4cEFFeE5GS3I5M1NwY2lLVllpVmYrQVlPb0JXY2NMNUFo?=
 =?utf-8?B?eHZTeVZoazdFZys3ajMvNzE2VHBPdkxDdm9QVEpnTThqcEt1YzRJbFlRNVJt?=
 =?utf-8?B?UkFjdWMvN1ltT3kwREF1d0t5WEVkUnBzdTJZZVIyUnlVRVBJZkRObDFQbWdC?=
 =?utf-8?B?WHlaenJrZmQrWHEwZjZEQ2JibTlEM2hTREFFZUIvbVk1RHI1NXg3dktwWEU5?=
 =?utf-8?B?dkJUVVB0MXU2Y3ZvT1ozMExxa2lCSmdTeUFTeDVhazU4Rmo0cVliTHVLYTl6?=
 =?utf-8?B?MzV4SHVFQzQydHVXd0xSVFpwczNFWG85MUFjZ0NselM1dE4xd0Y0WE9WRXpN?=
 =?utf-8?B?U0l0MVlSb0p3UXcwYWN5Sll0cnBTSWZ1cXAvT3JsRUw2Q0QwRmJrRUJ3b1c0?=
 =?utf-8?B?bXhQaGZWM1pkSFluZmpkQjNVcnh5MXNuWjNOSG9SRTBnckc5WEdsZ1RxNWVk?=
 =?utf-8?B?UWUza3hyeVcvcjRnVmdWNXZxVkk2N1ExN2VVVnFJNTRVTWtRc2U1L0pzcmpx?=
 =?utf-8?B?bXJQdlg2R2UzSlQ2NzJzSEZRcXQzWW9CMEZrV0tZcmFHakVlTWV6NitiZnpl?=
 =?utf-8?B?T2tCMDZVUGl5cWc1THhOMFJPRlFuMEdnMzFsM1pZVitDMk42Vk5weC9rU3l2?=
 =?utf-8?B?YmJ4dXN1dE5ncVNIQmRxdzdaYWFXbGpTRnRDSnVYNTF1MFRHbTZMNWRDRlBa?=
 =?utf-8?B?R3RwZnhtVFB2bUkxaVNid1dRLzJtNlBWZ3BTd0xoM3hsV2FxL1NHN2JFeVYr?=
 =?utf-8?B?eVd1UzBzU1RTMlU2WW4vcFZwL1hpQmROVDl6UUVGdElxTE0wV20vNmxnWHVL?=
 =?utf-8?B?VFpiV2ZEWWIwMGlHazJuVithaFFNZlhBeE53eTNDd1QyTkdmK2VETStKRHZ4?=
 =?utf-8?B?aTkvNXBJaDE1N3BNbTNnVUtNNm1uV0V6SmpmMW0rRUhZUWsyVXA1MTN4dkxv?=
 =?utf-8?B?YWl3bmhLZThjLy9zK3pEeFJTcURveW5MTzF6dVg1K3N0cmhOUGVNWW54U2N4?=
 =?utf-8?B?OWQ1ckwvZnRMS3Fvb2NtaGx3SXlCLy9qRGt2NzNMMnlMWmtMTWI1UUU4clVs?=
 =?utf-8?B?cHNpWGkvaGxtNGJGQUZmME55eTNUcmtRN3ozaTh3WTNxc2NscWkwZXFQdHp1?=
 =?utf-8?B?V0gzSkhaZXhFZmtIWDRNSm1ESGtjVDJkNnB5L3NOcDQ5NjQwRnhydGVRczdZ?=
 =?utf-8?B?K0JuTmVrdVdPb1JIWmhEcGdXMUdITTQ4WG9TUFBqbXVnWVYvRXNuV2RlTDh3?=
 =?utf-8?B?L2xhMXpxNTNIYlYwNjlsSUpOUk9ZNDA0TGRtbGQ1UmlCNTNlN0IvaDJ4TGJT?=
 =?utf-8?B?dnNGbVJ1UTBCU3B2NmliNzh2K1pvSG1reGV6N1REV2xCREF4N1JLMGlrTWxy?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D51A0B34950DE145B719E28F6F3E0E8B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VUwKzis+OczPvRVikbJjAl27wwfKQxVQq/7dllmHCAqpMxU8q5hjHg/48Dj1G794Ggc2OFP40AsMulhO1Bpq9yf5sqFbTU8y/raBIL/IezIgX7gdfOqL20VBhe8naHtwNzLNR8dUaqei8fW51axDPn3yZ6NH4yO28FgNB1tB0l0xw1cJEOyzk2F0Qj+AgyXMmlai2/71Go/VS6eSvkgLMjL45Hn7qdPfZ7OyoI/JBatJ6ji1KVfBHQco6yXeynb9h7Xx1PwaiV/OI9+YtGsc0FA0ExLk0+Eafs1x6YMcOnAR/z4gDJRBnXFvbc5CAxa1u25/XmHBYgfx1SPC7Aq4dtjNBy1HILHEd8hbanwxzEuW+M/wa1NzakGvtL8OxN52Bz05WcZfUSVM5++w6LXykY517IWY82MRwAYrc0xIpkiA3g36WxBt0yP1CfpMKUcyn5zzp9CTjYsyZxWn50QYhPZ/CHmUGmdQ29kaV/RaC4my1WNmd0xGsRX1XQYIK0FE3xQmtqXRfifW9sN/SYldDkoERJA8nWg9TYo7H+lX3qzRx1ly3Zb84u5YdJ0INyQET7ecC8OO+iC54u59Bzq0r9dwvDZLSNEcIJ8jKk+RUsgSXn8IBShwV7xZlqS4XQD5jW1WI5r1jHzaF8bhYRm8Mo4RYkM1IyXRBEY8a6n/JRSqjeLigJP8KfA0yY3bXQL6ylOozrChJ27T+6mqPa6Vy9IHjwBtfKbLqH2nhUpJ/qZ202WRfa5MrpQIGDZJHhbZyssjBbNbEbm5g0EEogdH/rxxsPinEr0b8Ug4TvVy03a4DXIzZtTjg97A2XqqbgLEpTReXADTL607AIXrAhnp6w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b86be05-d77e-42f1-3cb9-08dad3a6b27d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:16:53.8774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVFt7s3uQimz7jT9Uv/RL+nzP3uPA3vocguObbJ9ni77BbegiOGp0DVTc8ijiTuur3QRuptWRtkB0w1MSTz54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5443

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTM6NTcsIENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxIERlYyAyMDIy
LCBhdCAxMzo1MCwgRWR3aW4gVG9yb2sgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBTaG91bGQgd2UgaW5zdGVhZCBzd2l0Y2ggdG8gdXNpbmcgY3R5cGVzIHRvIGdlbmVy
YXRlIHRoZXNlIGNvbnN0YW50cz8NCj4gDQo+IEkgd291bGQgbm90IGFkdm9jYXRlIHRoaXMuIEN0
eXBlcyBpcyB0aGUga2luZCBvZiBtZXRhIHByb2dyYW1taW5nIHRoYXQgaXMgZ3JlYXQgd2hlbiBp
dCB3b3JrcyBidXQgaGVsbCBpZiBpdCBkb2VzIG5vdCBhbmQgaXQgYWRkcyBtb3JlIGRlcGVuZGVu
Y2llcy4gDQoNClBlcmhhcHMgdXNlIGl0IHRvIGp1c3QgZ2VuZXJhdGUgdGhlIGNvbnN0YW50IG1h
cHBpbmdzPw0KSGVyZSBpcyBhbiBleGFtcGxlIG9mIGhvdyBJIHVzZWQgaXQgZWxzZXdoZXJlOg0K
aHR0cHM6Ly9naXRodWIuY29tL3hhcGktcHJvamVjdC9vY2FtbC1kbG0vYmxvYi9tYXN0ZXIvbGli
X2dlbi90eXBlcy9iaW5kaW5nc19zdHJ1Y3RzLm1sI0wzMC1MNTUNCg0KPiANCj4gSSBqdXN0IGhh
ZCBhIGRpc2N1c3Npb24gd2l0aCBBbmRyZXcgYWJvdXQgb3RoZXIgdHJpY2tzIGhvdyB0byBicmlu
ZyBDIGNvbnN0YW50cyB0byB0aGUgTUwgc2lkZSBpbiBvcmRlciB0byBkZWNvdXBsZSB0aGVtLiBJ
4oCZbSB1c2luZyBpdCBpbiBteSBQb2xseSBsaWJyYXJ5IC0gaXQgbWlnaHQgbm90IGJlIHRoZSBz
b2x1dGlvbiBmb3IgWGVuIGJ1dCB3b3J0aCBrbm93aW5nLg0KPiANCj4gaHR0cHM6Ly9naXRodWIu
Y29tL2xpbmRpZy9wb2xseS9ibG9iL21hc3Rlci9saWIvcG9sbHlfc3R1YnMuYyNMMjMtTDM5DQoN
Cg0KVGhlIGRpc2FkdmFudGFnZSBpcyB0aGF0IHdlIGNhbid0IHBhdHRlcm4gbWF0Y2ggb24gaXQg
YW55bW9yZS4NCg0KQWx0aG91Z2ggd2UgY291bGQgaGF2ZSBzb21lIE9DYW1sIGNvZGUgdGhhdCBk
b2VzIHRoZSBwYXR0ZXJuIG1hdGNoaW5nIG9uIGFub3RoZXIgdHlwZSBhbmQgbWFwcyBpdCB0byB0
aGVzZSBwcml2YXRlIGludGVnZXIgdHlwZXMuDQpIb3dldmVyIGF0IHRoYXQgcG9pbnQgd2UndmUg
bWFudWFsbHkgcmVpbnZlbnRlZCB3aGF0IGN0eXBlcyB3b3VsZCBhbHJlYWR5IGRvLCBhbmQgd2Ug
aGF2ZSBhbiBhZGRpdGlvbmFsIG1hcHBpbmcgc3RlcCAod2hpY2ggbWF5IG5vdCBtYXR0ZXIgZnJv
bSBhIHBlcmZvcm1hbmNlIHBvaW50IG9mIHZpZXcgYnV0IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291
bGQgYXZvaWQgaXQpLg0KDQpJJ2xsIGhhdmUgdG8gZG8gc29tZSBleHBlcmltZW50cyB0byBzZWUg
aG93IHRoZSBjb2RlIGdlbmVyYXRlZCBieSBjdHlwZXMgbG9va3MgbGlrZSBpbiB0aGlzIGNhc2Ug
KGFjdHVhbGx5IHRoZSAnY3N0dWJzJyBwYXJ0IG9mIGl0KSwgYW5kIGhvdyBkaWZmZXJlbnQgaXQg
d291bGQgYmUgZnJvbSBtYW51YWxseSB3cml0aW5nIGl0DQooaS5lLiBjYW4gd2Ugc3RpbGwgcmVh
c29uYWJseSByZXZpZXcgdGhlIGdlbmVyYXRlZCBjb2RlLCBhbmQgd291bGQgaXQgbG9vayBsaWtl
IHNvbWV0aGluZyB0aGF0IHdlJ2Qgd3JpdGUgb3Vyc2VsdmVzPykNCg0KQmVzdCByZWdhcmRzLA0K
LS1FZHdpbg0KDQo=

