Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75964A401
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459713.717478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kZl-0008Mx-At; Mon, 12 Dec 2022 15:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459713.717478; Mon, 12 Dec 2022 15:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4kZl-0008Jh-7m; Mon, 12 Dec 2022 15:18:41 +0000
Received: by outflank-mailman (input) for mailman id 459713;
 Mon, 12 Dec 2022 15:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHV+=4K=citrix.com=prvs=338b0811f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p4kZi-0008Ja-N5
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 15:18:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eca4036-7a30-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 16:18:36 +0100 (CET)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Dec 2022 10:18:27 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 15:18:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:18:24 +0000
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
X-Inumbo-ID: 3eca4036-7a30-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670858316;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DAStDX5uv6E6Da33HcG8ZkQczFa5m89i2z6Uo18Hb5s=;
  b=Y7OA5u8v42OX7ch67l7l10XpQBxq3bRbc4Rt6NHSZv8w5ltEZbAqyEA7
   eZajmMEviEQNJpXzFWcmxPLRHwB49O97VK8Xbr7NGXEODPWtmTBhhSpRY
   GJawgSx2MiSdnlue9b6Ds8kqH6FKNSFAHpTGvR9Z4Ra2ON8a8e5mPxx4A
   Y=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 87448890
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6SwNza8vtRJQKttV8pgbDrUDRX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DEZXD+EOKqOYGbyLopyaoyz905Su8LUm9FiGQNrrys8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkljy
 aYycRIXUyqdluGk/+qZErJM2egKeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN1OSO3op6YCbFu79n0PVQFOC0KCkPScpW2YYetuN
 0cqw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8+AuDCWUVCDJQYccitec9QTs32
 hmCmNaBLSNrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG00geUVhMtSjaGjpwmY2nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalHY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:1i5xsqAAeTyL59nlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="87448890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUyojaM/X0043SKuBKBiJcH8VezBjcWA5eM8gwk37j6fUg795LKj27CY+8kS1Mk5cMeYka4yKHVP88S39VchGoCrwXgiYl4SW5l+NeTah3kJVfzRNVEvSsePUR0hdA0H9OZSdLDF5Q0zwai5OqIWFr9KyXvbLItyO7GvQPzpdUMs6jff6PXrWlLmtfkhCJaXGksSCmu3pLrUGYjqVYeRe2s/D/G1cYmVhW9Oom3t/40rqOmGmaBP4U/ajMd0TuaCQVcMS7Isgw57AeJsr2jSbMZIunqSNLDTiIYBEJJr0ZKDFD+mr2uDS3GCxhEnuEcCR81jbe1l3CDKpzUUEqbrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAStDX5uv6E6Da33HcG8ZkQczFa5m89i2z6Uo18Hb5s=;
 b=S3XMFq7CaSFP1qAOk+SQQw7PfZH2uMltS14LFV2WQTbyHqoYxtNZMbmQtrjJ0Xv3+zqt/6ZqLApDOz6ZqEIhnhfQHW6XcEDJsJIAjjjopNUAlAuWUPqQ/k88aYKh2JF1lTznTOiaKohzvDyaBLPnlJFb+h2nomRi29sr84cQjGgsViklvdUDVXttNpcgMIIHHeGG3QPZ0SWfBsz8uH3BfgfMiT6J4ycVG2sageG3gOchnQVpiU8uz4FQl1RAOL6CpRj1fS+t5XhoCBOdHIlO3AodAazKP9TNmKh9PLwMuzbiQG7mf8LmzHHdlNtu6QfLdqNK243rlSVaC+E9D+bdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAStDX5uv6E6Da33HcG8ZkQczFa5m89i2z6Uo18Hb5s=;
 b=cW/SfQvxL3YJh10NO1FMIFLv82wfL5bvX6lpFsvzcvj66im4SK3bE3fSAxJ3p3ArmzBur9kmWt3jptGt+JU+kNwXpqdiPbiqc3Bm3i2c5+n1EU23T3YFZ/fYhf7bTBfMWcIOFD5nSiQwScBURh5imNytgoJYCs5eZH71e7S1oUg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@cloud.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Thread-Topic: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Thread-Index: AQHZCwjAky6i1T4UZEeH7yXOYJiUd65kBHMAgAAalYCABjaCAIAACQQAgAAFVAA=
Date: Mon, 12 Dec 2022 15:18:24 +0000
Message-ID: <f980e5c9-b175-2741-ed95-43bbc643baf7@citrix.com>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
 <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
 <CAPRVcuccXaLNX3suy1t+xD_kptnV2yLxoCN_193PF6Gj_FBD1w@mail.gmail.com>
 <b610b461-4c77-66da-c930-10def3138e5d@suse.com>
In-Reply-To: <b610b461-4c77-66da-c930-10def3138e5d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6419:EE_
x-ms-office365-filtering-correlation-id: 79a0b0f1-b6e8-4667-1941-08dadc541cf5
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o7r74KBjvmCHXMm8LJcIeHPfSrmfPCc72YC4W0m3JKeFfnGwkHxbcOXnFJSMWDF63liwUkLuTgQC//KuZmmKSCl4sMQkkVqWAqqRMnbgpF0BTpyVkRWV2qsD4q8l5RaKEiozvUQVPr0inliCk0YQyHCSSuaoRAYYR65C5PfZ0bKg3vw67CRP3ajuxjA7zsM5UmTQt0knKoosUTpoZ5aw51dAqasXri1FY7jgqU8mqDouZWVkLwk7LOJw8HeI1XkVcJnvHewpsl30TQ+wQ5ggnj0FB8qo6m+1CVg5HLwod9TzOJBfABAMUbhuxZlaw40J1YSg8ZPj8vIRouAA0QQ8//mx6Tjr+sADoTRURguWGh7g/eVYUjiLyRRU+lAQmE8uO3rnsS7i21gjSRWu7aILvfqVvDUJcYHKd4pc1V9QTuJmnYedvDbPcESs6GixL0tO0ynm/EIk2xuwXFIa07EkdPTf+MPzUQgGYLtAvMVYM3SvLbarH+cy37I/UWLRMEPtwqyYEvJTflFBmT2YrJ/zW02eyP5yRL/704j25tTcOsDcZn2MN2fnTT90HWg7uChHN/R+4h5t8TK3uto07O1H1kSRlZ3nNi6fpNxWQKJTt7STwV/o86QeTixzq1SU0aSDSUe4txUnenBfEyIAqOkPjK0mERV9HsS46q1aBLUOAtGJ3/l6ZKyHDXEEu702Im6Ti4VRzgLiCkexcq9sYwnjNxtXkVQqD6vwndch3r/+syz7r7TmecbM1zuAMxSVDsGHuLDfENaFf7U1XJdIXCktYA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(478600001)(83380400001)(36756003)(26005)(6512007)(2616005)(6486002)(53546011)(186003)(38100700002)(31696002)(86362001)(122000001)(38070700005)(82960400001)(6506007)(5660300002)(31686004)(2906002)(76116006)(54906003)(110136005)(91956017)(64756008)(66446008)(316002)(66476007)(4326008)(66556008)(66946007)(8936002)(8676002)(71200400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1ZqVlFQTWo3NGM2bzlqTXRFZUgrZmhIcVdEOWhOV3pQeUJicUNHVFdDcFdy?=
 =?utf-8?B?RS94dzZ1Zk83VXZXaGJTaG5EZ25DdEthdHFoQnNyUzJjQkM4TnV2Qnc3akM3?=
 =?utf-8?B?VG1PcVBFRGx3d0dHcG5RYVNYOHpRNlFwOTNqd2RlSTZnT1MyZWUwMTg1SGE5?=
 =?utf-8?B?Z3VBWDlYOSswWjVPUlVDSkRMa3J5UjdET0o5dVA2VkFPWXd3NGRJQzBXd0tk?=
 =?utf-8?B?cVM5U0J4ZiszUlM5RlVSSEh0SFBOYklyRXIxdjZVZ014WlJodDdlUy9Ebzc0?=
 =?utf-8?B?OFl2V3o1c0ErSHV1WGIzSGI5bVc4Q1ZPV0Noc1JlNzBpVGpRdGVKcTByaElt?=
 =?utf-8?B?YngxM0U4RWhabDY1RjdIemxSZDdNM0sxc2E3c3QwNlRSSFZJTThheDhULzdT?=
 =?utf-8?B?djFKTWFtMWlWeVB0dlRXOG0rVmZkUkg0VDhpTURKM1RYSm45aEk5ZklJTk94?=
 =?utf-8?B?VVpIcVZ3S2Rmam1VVThoYkRPRkozRXJWUUlaVFZJQktaWDR3TWZSQzZsL2hJ?=
 =?utf-8?B?Y29aMTlDQWQ0QkFpNFRkV2hISE05UjAwUmd2YnRJamFWLytPUnUyMGNGTnQ1?=
 =?utf-8?B?Z3JJM3g3cFEzWjJRVW9LeTV2bEhRNWFGbDBVOStUcjBpNUxDWVNWU2J2NGY4?=
 =?utf-8?B?bllhWDR0NXQ0WmhadXNaVEFlTlcyLzV5Q0hXMlFJSDlQT3VBR3l4aUt1TnNr?=
 =?utf-8?B?QkFVa3BUNGFjczFyWkljaERLcVV4Yk9ObjF1eENzMEVscUh3Y1dCcWpCd05P?=
 =?utf-8?B?ajBOZm1qSkk3a2Z0SWFObVVNQlJxN2dsYVRidzFTNGNEKzJWajJjM2R4SVpp?=
 =?utf-8?B?OGhyOXN3aDNJZytTdVJrdW1CaFRqaU5HNzNLR1BPZUJHSDZVMThTN3A1Q21t?=
 =?utf-8?B?RFZIVG5iY3FTWWlRaHIrVkd0RzUzSUFKVFVxV3VSZE05YXRpcDc4U215NGEr?=
 =?utf-8?B?alJpTVhQdDA2a0hDL1JacHhTMmRPOUZZLzI5VndXRmdtekovQ0Jxa1IzcFFX?=
 =?utf-8?B?ZFJnVXc0bTVGUUtoR2YrOEsyWHMxeHlOeWtQc3N6MGNwL2pLcitPUjQyU3dY?=
 =?utf-8?B?MTJvNWZLdWt2WTJOVUpZZCtmdXQ5Yk1FOW5QcjJYMmk2MDNFMjdqYkJDYy9M?=
 =?utf-8?B?VnNVWlBwVVY3SW9sQlFHUCtRZXhYSGZBUCtlcUhXT1N1RVpIdVkwQW9lOXdW?=
 =?utf-8?B?bDRuTnNKV3dIbVdaWWNQWGVlTWJNRmJJMWF6bzBLL0JhcVVHdlkzdUY0eFFk?=
 =?utf-8?B?Q1JFSzczN29RZ3ZXSXpsOHNJbHQ4WG8wVHpsc3B3OWVSak1NZWYyRVAvaXB2?=
 =?utf-8?B?RjhCa3pPUVoxMGhDc1JJQVg5QUhSU3E2aVlzdEw0RUZWWGJ5TmVuMll3dVQ2?=
 =?utf-8?B?dGgyVVNlUVE1ZzFnbG9iam5sWk5WTHFwWjNwcldUbFpCekNtRFp0dTFZTE1y?=
 =?utf-8?B?VGVEK2ZZRHdXQVV5VmJqaGFQUkhVaU8va3RES2JJNUFxN0VaVDl5MGZwL1Zp?=
 =?utf-8?B?dHFXRVFDdE1YYWVQYk1lOUdSeVdFZlcxdmhiRDhXNEUycHpNUnpyRjRCSjZC?=
 =?utf-8?B?cHFLdzRNMTRUay9JbWNZTkhmZmR4M1d4Z2lwKzVJVWhCVnJOU0pyUzBTc2JJ?=
 =?utf-8?B?V3pyWDFOeTRKNU5nSmwzbTk1NEN2bHdaSVZBYkVVdzI3OEVMOElQdVIzRjk2?=
 =?utf-8?B?QmRic2VBRjdIdU9RTVpqbE5ETkt2MHlTeTZ0cUpuZG1MdWRUY0l6ZEdaUVU2?=
 =?utf-8?B?TGpES3dxKzFIUU5sVHJaZTZmNHlOSEJ4UmE0d2pFeUpnb3JwbzBIK2dPaE9X?=
 =?utf-8?B?VkFnQ1E4WHdYT2JCWlE5b3pYM3JrbFJIRE1CY0ZURkF3T1F5aVVzWFRWWEh1?=
 =?utf-8?B?ZkNtMG5LM0xOM3FVVkRjb0hJYWNTYlZhYy8xZ2wreFVOeXY2S3Y4dWNmOXdL?=
 =?utf-8?B?dXQ4dVBCS2I2YTFSY2NLY2d4UmJCYzBsVU9XZW55QUtYamhaYTEyZVNpcTFK?=
 =?utf-8?B?S1ZqM2Q1Uk55WHNKZnJRWXJ1dnJ3bXBEdXQ0MGdZZjhheUhsUWEvQjFkVTRi?=
 =?utf-8?B?Q3RhQzFzbDlUVmRiWXJTQ1BIWkMzeTBUenVDL1ZzTjI4ZWdHWm5PRkRGTUk5?=
 =?utf-8?Q?5gWLQp52wWM83Bqe/0ImClYyN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2413E4BB05D704786A1C22A2BDF73D6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a0b0f1-b6e8-4667-1941-08dadc541cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 15:18:24.7066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sq0Dgwy49kwcJvLPeNlQB4EYXfytvJq5/SSSxme6jAY4L2Ei/ZN9vMNbQAsSLvR5ci7dlpjbHnFlV2LitwMqUxOrqD/q9xntdwLOoRXNgcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419

T24gMTIvMTIvMjAyMiAxNDo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEyLjEyLjIwMjIg
MTU6MjcsIFNlcmdleSBEeWFzbGkgd3JvdGU6DQo+PiBPbiBUaHUsIERlYyA4LCAyMDIyIGF0IDM6
MzQgUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAwOC4x
Mi4yMDIyIDE0OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+PiBPbiAwOC8xMi8yMDIyIDEz
OjI2LCBTZXJnZXkgRHlhc2xpIHdyb3RlOg0KPj4+Pj4gQEAgLTI0MCwyMCArMjQwLDIwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpubWlfcGF0Y2ggPSBaRVJPX0JMT0NL
X1BUUjsNCj4+Pj4+ICAgKiBwYXRjaCBpcyBmb3VuZCBhbmQgYW4gZXJyb3Igb2NjdXJzIGR1cmlu
ZyB0aGUgcGFyc2luZyBwcm9jZXNzLiBPdGhlcndpc2UNCj4+Pj4+ICAgKiByZXR1cm4gTlVMTC4N
Cj4+Pj4+ICAgKi8NCj4+Pj4+IC1zdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGFyc2Vf
YmxvYihjb25zdCBjaGFyICpidWYsIHNpemVfdCBsZW4pDQo+Pj4+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLCBzaXplX3Qg
bGVuKQ0KPj4+Pj4gIHsNCj4+Pj4+ICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwodWNvZGVfb3BzLmNv
bGxlY3RfY3B1X2luZm8pOw0KPj4+Pj4NCj4+Pj4+IC0gICAgcmV0dXJuIGFsdGVybmF0aXZlX2Nh
bGwodWNvZGVfb3BzLmNwdV9yZXF1ZXN0X21pY3JvY29kZSwgYnVmLCBsZW4pOw0KPj4+Pj4gKyAg
ICByZXR1cm4gYWx0ZXJuYXRpdmVfY2FsbCh1Y29kZV9vcHMuY3B1X3JlcXVlc3RfbWljcm9jb2Rl
LCBidWYsIGxlbiwgdHJ1ZSk7DQo+Pj4+PiAgfQ0KPj4+Pj4NCj4+Pj4+IC1zdGF0aWMgdm9pZCBt
aWNyb2NvZGVfZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkNCj4+Pj4+
ICtzdGF0aWMgdm9pZCBtaWNyb2NvZGVfZnJlZV9wYXRjaChjb25zdCBzdHJ1Y3QgbWljcm9jb2Rl
X3BhdGNoICpwYXRjaCkNCj4+Pj4+ICB7DQo+Pj4+PiAtICAgIHhmcmVlKHBhdGNoKTsNCj4+Pj4+
ICsgICAgeGZyZWUoKHZvaWQgKilwYXRjaCk7DQo+Pj4+IFRoaXMgaHVuayBkZW1vbnN0cmF0ZXMg
d2h5IHRoZSBob29rIHdhbnRzIHRvIHJldHVybiBhIG5vbi1jb25zdA0KPj4+PiBwb2ludGVyLiAg
S2VlcGluZyBpdCBub24tY29uc3Qgd2lsbCBzaHJpbmsgdGhpcyBwYXRjaCBxdWl0ZSBhIGJpdC4N
Cj4+PiBBbHRlcm5hdGl2ZWx5IGl0IGRlbW9uc3RyYXRlcyB3aHkgeGZyZWUoKSBzaG91bGQgdGFr
ZSBjb25zdCB2b2lkICosDQo+Pj4ganVzdCBsaWtlIGUuZy4gdW5tYXBfZG9tYWluX3BhZ2UoKSBv
ciB2dW5tYXAoKSBhbHJlYWR5IGRvLiBXZSd2ZQ0KPj4+IHRhbGtlZCBhYm91dCB0aGlzIGJlZm9y
ZSwgYW5kIHRoZSBhcmd1bWVudCBoYXNuJ3QgY2hhbmdlZDogTmVpdGhlcg0KPj4+IHVubWFwcGlu
ZyBub3IgZnJlZWluZyByZWFsbHkgYWx0ZXJzIHRoZSBjb250ZW50cyBvZiB0aGUgcG9pbnRlZCB0
bw0KPj4+IGFyZWEgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgdGhlIGNhbGxlciwgYXMgdGhlIGNv
bnRlbnRzIHNpbXBseQ0KPj4+IGRpc2FwcGVhcnMgYWx0b2dldGhlci4NCj4+IERlc3BpdGUgbXkg
bG92ZSBvZiBjb25zdCwgY29uc3QgY29ycmVjdG5lc3MgaW4gQyBpcyBxdWl0ZSBhIHBhaW4uIEkn
dmUNCj4+IHRyaWVkIHRvIG1ha2UgeGZyZWUoKSB0YWtlIGEgY29uc3QgcG9pbnRlciBidXQgdGhl
biBpc3N1ZXMgYmVnYW4gd2l0aA0KPj4gYWRkL3N0cmlwX3BhZGRpbmcoKSBmdW5jdGlvbnMgYW5k
IEkgY291bGRuJ3Qgb3ZlcmNvbWUgdGhvc2Ugd2l0aG91dA0KPj4gZnVydGhlciAodm9pZCAqKSBj
YXN0cyB3aGljaCBqdXN0IHRha2VzIHRoZSBwcm9ibGVtIHRvIGEgZGlmZmVyZW50DQo+PiBsYXll
ci4NCj4gVGhlcmUgaXMgZXhhY3RseSBvbmUgc3VjaCBjYXN0IG5lZWRlZCBhY2NvcmRpbmcgdG8g
bXkgYXR0ZW1wdCwgYW5kIHRoYXQncw0KPiBpbiBhbiBpbnRlcm5hbCAoc3RhdGljKSBoZWxwZXIg
ZnVuY3Rpb24uIFNlZSBiZWxvdyAoYW5kIGZlZWwgZnJlZSB0byB1c2UpLg0KPg0KPiBKYW4NCj4N
Cj4gbW06IG1ha2UgYSBjb3VwbGUgb2YgZnJlZWluZyBmdW5jdGlvbnMgdGFrZSBjb25zdCB2b2lk
Kg0KPg0KPiBmcmVlaW5nIGZ1bmN0aW9ucywgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgdGhlaXIg
Y2FsbGVycywgZG9uJ3QgYWx0ZXINCj4gY29udGVudHMgb2YgdGhlIGZyZWVkIGJsb2NrOyB0aGUg
YmxvY2sgc2ltcGx5IGRpc2FwcGVhcnMuIFBsdXMgaXQgaXMgbm90DQo+IHVuY29tbW9uIHRoYXQg
c29tZSBwaWVjZSBvZiBtZW1vcnkgaXMgYWxsb2NhdGVkLCBmaWxsZWQsIGFuZCBoZW5jZWZvcnRo
DQo+IHN1cHBvc2VkIHRvIG9ubHkgYmUgcmVhZCBmcm9tLiBJbiBzdWNoIGNhc2VzLCB3aXRoIHRo
ZSBwYXJhbWV0ZXJzIG9mIHRoZQ0KPiBmcmVlaW5nIGZ1bmN0aW9ucyBub3QgYmVpbmcgcG9pbnRl
ci10by1jb25zdCwgY2FsbGVycyBoYXZlIHRvIGVpdGhlcg0KPiBvbWl0IHRoZSB1c2Ugb2YgY29u
c3Qgd2hlcmUgaXQgd291bGQgYmUgaW5kaWNhdGVkIG9yIGFkZCByaXNreSBjYXN0cy4NCj4NCj4g
VGhlIGdvYWwgYmVpbmcgdG8gbWFrZSB4ZnJlZSgpIGZpdCB0aGUgaW50ZW5kZWQgcGF0dGVybiwg
YWx0ZXIgb3RoZXINCj4gZnVuY3Rpb25zIGF0IHRoZSBzYW1lIHRpbWUgdG8gbGltaXQgdGhlIG51
bWJlciBvZiBjYXN0cyBuZWVkZWQgdG8ganVzdA0KPiBvbmUuIHN0cmlwX3BhZGRpbmcoKSBuZWNl
c3NhcmlseSBoYXMgdG8gaGF2ZSBhIHN1Y2ggYSBjYXN0LCBhcyBpdCdzDQo+IGVmZmVjdGl2ZWx5
IHN0cmNocigpLSBvciBtZW1jaHIoKS1saWtlOiBJbnB1dCBtYXkgYmUgcG9pbnRlci10by1jb25z
dCwNCj4gYm90IGZvciBpdHMgb3V0cHV0IHRvIGFsc28gYmUgdXNhYmxlIHdoZW4gdGhlIGlucHV0
IGlzbid0LCBjb25zdCBuZWVkcw0KPiB0byBiZSBjYXN0IGF3YXkuIE5vdGUgdGhhdCB0aGUgcmlz
ayB3aXRoIHN1Y2ggYSBjYXN0IGlzIHF1aXRlIGEgYml0DQo+IGxvd2VyIHdoZW4gaXQncyBhbiBp
bnRlcm5hbCAoc3RhdGljKSBmdW5jdGlvbiB3aWNoIGlzIGFmZmVjdGVkLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCklmIHlvdSBjYW4gcGVy
c3VhZGUgdGhlIEMgc3RhbmRhcmRzIGNvbW1pdHRlZSB0aGF0IHlvdXIgaW50ZXJwcmV0YXRpb24N
Cm9mIGhvdyB0byB1c2UgY29uc3QgaXMgbW9yZSBjb3JyZWN0IHRoYW4gdGhlaXJzLCBhbmQgZ2V0
IHRoZW0gdG8gY2hhbmdlDQpmcmVlKCkgdG8gdGFrZSBjb25zdCB2b2lkLCB0aGVuIHdlIGNhbiBj
b250aW51ZSBkaXNjdXNzaW5nIHRoaXMgcGF0Y2guDQoNClVudGlsIHRoZW4sIHRoZXJlJ3MgYSBk
YW1uIGdvb2QgcmVhc29uIHdoeSBmcmVlKCkgdGFrZXMgYSBub24tY29uc3QNCnBvaW50ZXIgKG5v
dGhpbmcgaGFuZGVkIG91dCBieSBhIG1lbW9yeSBhbGxvY2F0b3IgY2FuIGV2ZXIgYmUgY29uc3Qs
IGFuZA0KaXQgaXMgbmV2ZXIgYWNjZXB0YWJsZSB0byBmcmVlIHZpYSBhIGNvbnN0IGFsaWFzKSwg
YW5kIGNvbnRvcnRlZA0KYXJndW1lbnRzIGFib3V0IGhvdyBpdHMgInRlY2huaWNhbGx5IGZpbmUi
IGFyZSBtaXNzaW5nIHRoZSBwb2ludC4NCg0KfkFuZHJldw0K

