Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F80588A4D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379754.613496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBYJ-0002W6-EJ; Wed, 03 Aug 2022 10:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379754.613496; Wed, 03 Aug 2022 10:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBYJ-0002T8-BN; Wed, 03 Aug 2022 10:24:35 +0000
Received: by outflank-mailman (input) for mailman id 379754;
 Wed, 03 Aug 2022 10:24:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LHrU=YH=citrix.com=prvs=2079004b7=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oJBYH-0002T2-Sf
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:24:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75bb0d1e-1316-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 12:24:32 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2022 06:24:29 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SA1PR03MB6579.namprd03.prod.outlook.com (2603:10b6:806:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 10:24:27 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::11be:5f36:d3fe:ba1e]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::11be:5f36:d3fe:ba1e%6]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:24:26 +0000
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
X-Inumbo-ID: 75bb0d1e-1316-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659522272;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mGNRwlacwTxgIjc2OVx4+MHoRHgRebh989lPy2POGE8=;
  b=S4Z0khPIzIB355fZMI3wPlgXFPekpSEcNKXmzSAJ4riGs84HAfuW52+G
   qWFY9OJ5S19BbT7yPvAz2Qf3G6fbeVQpIhwydpjkrdKHrB4YD0cLE6f46
   0Voa6bOez9Dm8Yzg90gyCLQ7jCNPH1RSKU/qI08kbtC3kSoC5BRKzfmc0
   E=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 77260921
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Fp5qCq60K7fPOUeSGUI/xwxRtBfGchMFZxGqfqrLsTDasY5as4F+v
 mtKXTiObqrbamH9eIojao+29koD6sWBxtFjGQZvpCEyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5K+q4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJE0mELIxp7tvPVNX7
 awhNj1UVU+Pgf3jldpXSsE07igiBO/CGdpH/1tGknTeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LGUe8QrFzUY0yzG7IAhZ3bTzMdyTZtuQQsZ9lUeEv
 GPWuW/+B3n2MfTAlmDbqiP234cjmwvgZ64LMIyV18RRgUWLzEEcVg0XDgaS9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYQUsRdO/c34waMzuzT+QnxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iE3JR9M6SKqt1IStSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:wboTGaEkuo8tf8jEpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZKz+dRj8EC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="77260921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d53y0CynJRkz1KCSfjKX53G+KrmQgdHM1+XDKyFtgSzKY6JLi5c8s1bLCOUNe3bZ3JHPUhHxqsJIlO+CnpvauPlpYMnPAQWHOTOWelIptDED8wG/LFoqZfIZhsRdmRoLUzEpdahV8FiLP2s2HNJnxIr07a58TwSRB/p7sMJTKDf2Q06HiTsN22fUrcoZGkpUghjG3Aem/r5CEiII6BvSqJZym/hoKxmGA2b6ut8wGHs10h37+2gfb/RqUsItAwCutxaR4nyFXc25Tq6LdpGVcu5tD8ksO2wSsWE3hx/z/sG5kSHPyPDXb/jALHXIJt1yklKLoE1UykYgPf1P4g0E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGNRwlacwTxgIjc2OVx4+MHoRHgRebh989lPy2POGE8=;
 b=MMyNb8r6RWL2eENhiFsXB7vQG8x6zfrU+VSRbq9GqBvFghV/917asSp6vNqfaybjagF9pZuUIa730qei96qmA2Q1/Kb50quFU1Tk0RBAw16Iv0fc4PtO8t9YR2PYcDLd4JZXdnA2MneeBqWm770KUyX6GVRUtW2pM1pSTfDDQzbCeXRmDctvZb9uFgweG+w46a/NKyNnf58B4JQJU0KIB/Pm3a+jscftpQIV4fF/W87pTzSoAtVAxD5+Nzc0pWhx6Aaait4bVfiKhDllcCCVwmrE326EQiwrXStdIGhF0j8ziTHmFaVt11Ftp70BAt4jeJt9CAcCBPu5sCwvI6AM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGNRwlacwTxgIjc2OVx4+MHoRHgRebh989lPy2POGE8=;
 b=SYLySdqI+CmDjn2+nBt7LQfoJtUbgZfK1xQ9uixIRs8mLu0R6zWWgZGU6Hj8Wl51ZySxXzqBrlUMQ3ewrqWbnG14WwMn4IAGDkj6W7oDXZVLUKODFw3OioxvwSZrzpjo9vovRwZcFPilgFv+ij4Dp90MJ4FDVEoDZL+wjZLd7kQ=
From: Edwin Torok <edvin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Thread-Topic: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Thread-Index: AQHYo3Q1+zzg+oK1BUGAK7B2d/MLMq2c/V8AgAACIYA=
Date: Wed, 3 Aug 2022 10:24:26 +0000
Message-ID: <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
 <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
In-Reply-To: <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30973b5c-4f5b-4755-3d80-08da753a57de
x-ms-traffictypediagnostic: SA1PR03MB6579:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IEfZGk9IZA/z8FLpMoC8DMps+Ki02LqBN2tVbCWJIij7llhJId606Dse6AITUuAuFqNU4iAFqCQhK6yuqlupW3Pr/61bKJ0eR0F6PsUFR4RvChwjdS+4FDbL662cNMn4MahkXjWGx4qHhl0l/zSlFyTBEOgqUQj+0Vipeddffa0CUDtxqQ3QW6rTCu6Zm5bvt/Kjrxqilf99JyvSzR29E0+k3iz2t+skt9dSwHqKspvqHXaurcAbqcKR/Sfd2aXP4xol92oR5ihbjWp1rGjqtvdJ0hCaJQlXOv6lnddGGr0a9LD6HSxWVjHIq9pvwOkVV8dNhnkfb6SDB6nMFADj0UghsNnHfH4RVWARfokGzcBJ3uJ7KVbSJ9jOYu6H4ZFrJgHiOOEPr1VMQDKVGjOghdCggnbDJN/dcK2cLAaJ/JRO0bKeV3uxQP6xOB9LU7N4NrivF4ENIp360fOsSXgva7s9QBOzOy6RSBvPr0GSnLLJndEZj9tyaan6xjxWueKyzMH13yMZYMbSaiLfhozDarXUjLO11Z0ZnZ7EU+H7HhiU3QufLJbI8ZOaaOq4pYLjGeKHaMw+knwNyHgo79iX1isK/qIAD5vQSdkgDMoIvHNicvfDMGsXRI6Wk9wuXkCwCMwhJILNl+uAwA8eAfZrr02JYcE2AgX7rcTGzfjJ495y5b3ohHY/tVSfGe8FPyqN3G4EqCVIHt9UP64Gnh9oqGtglgxmx8XlP5npq4VPJRRaRWo4SpuM6974UykKjWPEnsrZe03MgAvg5q4zZtn7iZ109tY1v3/0uIubH/H/4dI7acLTHtkWaDqrEImD6IohVoXDMlDf4Wc5kX4yeJst5A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(186003)(71200400001)(53546011)(36756003)(76116006)(38100700002)(86362001)(91956017)(66446008)(2616005)(66556008)(66946007)(64756008)(66574015)(66476007)(83380400001)(6512007)(8676002)(6506007)(26005)(4326008)(82960400001)(6916009)(8936002)(2906002)(54906003)(478600001)(41300700001)(33656002)(5660300002)(38070700005)(122000001)(6486002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmRFZFJmUXU1Tmp6YnlzVTJVRURvMEFZKzFldjl2WEc4QWpNbWlwbk1JeVdM?=
 =?utf-8?B?N0Q5Qi9tSDBjN1p2Nkl0RWFPSklSb2h6b1dvYXllcStaRUsrdGdnVG53QmdS?=
 =?utf-8?B?L2FUOEtJVHcvOGJrSVd0WThDYXdVUUMxY1FtM2xTcmczaWpkSDN1ZDlINWk2?=
 =?utf-8?B?eDBubFBKNmVNQUtGUUcyc3hOYXZkY1NZbUhMcDhhWEtoK2pHS0htR1p5T21H?=
 =?utf-8?B?UUVTRDZ4L0hvWmV4RDZQWWVueEV1S3hLY0JGZmxRc0loQzNmRnpMSUVpalJZ?=
 =?utf-8?B?WTJQN3kxNGs1Ym9mUlJFaEJrZVJWa0JIM1Jic0ZFUkJCeU44NGZsUHF5cDFl?=
 =?utf-8?B?ZklPNmpDWUk2VFVvRGR5WEVGdFp3U2tDVmpEV3BtakRlNHpOZ1p4RDNiemZz?=
 =?utf-8?B?WlFUSnFvem9GN2lSUnZXcnZyTlkyTDZjMnhoRW5yS3c4TVRzc3U5MTJIS05q?=
 =?utf-8?B?UmhGQlp0Rms4cUVaRXFyZjhNRVp0YjV2Y1pqMTNxejlqbG50Y2h0ZnhmbFNI?=
 =?utf-8?B?Z1lyOWM3aURTSm5KZXhxV3BqeFVqSVFEOFZWUTlLSkRwK0hVR1ZCK0kwSzdh?=
 =?utf-8?B?cGN5dW0zeGgyUUZuZkVMQmcrcFNaTXhQcjZlWkliVDdReFdCUGVsM3RjMDhz?=
 =?utf-8?B?ekpZZjJKQmU4MDljNGRnRHlSb3JhZFNPZDcyMjVCNWlRL2pOejN6Z0l2Y3Fy?=
 =?utf-8?B?VTA3aWw3dGNtcGVsME1lNEVSMzZpeFdBcWplUHE3UHhTK1VVeUlNTXNFd2dW?=
 =?utf-8?B?UzV0a3FUSmcyVHc3UllhSmJlK3VaYWFOM2lTYlhmYk1UTlNPK0VDTjhEa2VO?=
 =?utf-8?B?cEZBeGVORTk5aVhoczNKc1RDZlVyU1daVWsvWjE5YWRJNE5GNCtZb1NnOURW?=
 =?utf-8?B?ODZhVlorVXJ0amwyeTk2STRjQlBnSUFxWWhHOUptRmNzTGZYdnk2b0k1SDBE?=
 =?utf-8?B?VUlaQ2NNUzNSaGxJSW5VdTBMUm1ZcW5INkRUNnR2NWdyTDZWcEordzJJRjF4?=
 =?utf-8?B?NEJNZWs4bTlZUjQrVnhZR0lubVcyU201SmM1a1lPanVrNEcrVU9wMkFiVjU1?=
 =?utf-8?B?cjhETnk4U1NJOTNCM0RIdStVbVoyTXJEVlU3MDZqenZPMTkzTjFPYkQxSVhC?=
 =?utf-8?B?azAxcUg2RmxEeXBieUhEYVduVHZkZnNmMzRsQ09iOFF5Y0Z3WE1pRFY2b1Z5?=
 =?utf-8?B?OVhISE5meGJPRlFKTWV1Vlo2b0M2dnRPODZ2c1hWSzRYK04yY3g4Z04vZDJa?=
 =?utf-8?B?L3FTRktqaS9xQ0poa1ZzcU1Kbjd2eVA4VVg4WXM1SU1oUnNVNHdFQVpaMUY4?=
 =?utf-8?B?TTF1d1h5UWtNbTlIWUNzOHNwOVgyZ3dQcHplY3oyNEJySjJIbForcUxBdWhz?=
 =?utf-8?B?c3FOeWsxTEVoZkE5ci82UlFWbmNpVXhrdWtINEF1UkNaZjBRT0VIMGVaL1pM?=
 =?utf-8?B?eTlKY1pGNzAvWTA1dDBnWUZ1ay9BbzJ4azY1emR6WHlGZFVjeWZkaDhrblBh?=
 =?utf-8?B?dUkrUm5lU2IvQnpvVVR0NnBFQTltcm5GVDdkZ3lpVkg3ZDIxMkV6TkVUblpG?=
 =?utf-8?B?MnJQenRKMHNPcFo1a1EwMlRiZkZqY2doREZSWDVHY3NQVzhQMjNhd2J6Z0pu?=
 =?utf-8?B?QTRkakQ4Q3dRbW1hc3BrMXQvR1lyWEE2Ni9tZFFkQS9yTWFYMUFLZ2lpNkN4?=
 =?utf-8?B?MkFLdFRsRldZWTJxRVZhMUFkdVpMZzNxVi9QRGJSc2pPMlg2U2tzVUhSS28w?=
 =?utf-8?B?akdtekRaOTFDTG1waXhXSG9Ob1RFNGhUbmRoVGVFSEFXRVI2NXVXTWFjS3pR?=
 =?utf-8?B?U0ZSTGFtUng0Zi9yNDg3QzhEeXExa2t4NDduS05yRXlYaUVqZ3FBQmVleVcr?=
 =?utf-8?B?SzkyNitjMW5yWFRnb0JMamFFSTVJd2M5Zkh5U3p2ZThsanA3MWgweGRpMERp?=
 =?utf-8?B?OFBnd3NFZytWa1p3RFl5LzgyWXcyeHdRdU5FSzRhd2FlRTdXOXpBMGtpbGVQ?=
 =?utf-8?B?akZ3bDFEZXFNOWJvMjhVaXV5UzY0WVFvQnV5M2FPdlZyVE16NUMvc1hPRW1q?=
 =?utf-8?B?NlFRSGdnOTM4c2pBaWFyVEtEMjRqRS9JSFlKd2FkZTlWdzQ2TVpVa1d0c0Rl?=
 =?utf-8?B?aWdGTkgxaFMvQmZHejU0Y2F5RXdNNTVTRmNDYy9jbWYzNzNDN3AydXdaeWdV?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4219CABB53C25C4880C59312A4652C2B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30973b5c-4f5b-4755-3d80-08da753a57de
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 10:24:26.8769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOX69tVPGn6xq9lGvisLZGge/CTtoW5sIyOQ6+xqHlQJxxWuUD7lbCScIk+40O9LLoYO/Cf2nypT5AW0i7iGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6579

DQoNCj4gT24gMyBBdWcgMjAyMiwgYXQgMTE6MTYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOS4wNy4yMDIyIDE5OjUzLCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4gVHJ5aW5nIHRvIGluY2x1ZGUgLm9jYW1sZGVwLm1ha2Ugd2lsbCBjYXVzZSBpdCB0
byBiZSBnZW5lcmF0ZWQgaWYgaXQNCj4+IGRvZXNuJ3QgZXhpc3QuDQo+PiBXZSBkbyBub3Qgd2Fu
dCB0aGlzIGR1cmluZyBtYWtlIGNsZWFuOiB3ZSB3b3VsZCByZW1vdmUgaXQgYW55d2F5Lg0KPj4g
DQo+PiBTcGVlZHMgdXAgbWFrZSBjbGVhbi4NCj4+IA0KPj4gQmVmb3JlIChtZWFzdXJlZCBvbiBm
NzMyMjQwZmQzYmFjMjUxMTYxNTFkYjVkZGViNzIwM2I2MmU4NWNlLCBKdWx5IDIwMjIpOg0KPj4g
YGBgDQo+PiBQYXJzaW5nIC9ob21lL2Vkd2luL3hlbjIvdG9vbHMvb2NhbWwvbGlicy94bC8uLi8u
Li8uLi8uLi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gUGFyc2luZyAvaG9t
ZS9lZHdpbi94ZW4yL3Rvb2xzL29jYW1sL2xpYnMveGwvLi4vLi4vLi4vLi4vdG9vbHMvbGlicy9s
aWdodC9saWJ4bF90eXBlcy5pZGwNCj4+IFBhcnNpbmcgL2hvbWUvZWR3aW4veGVuMi90b29scy9v
Y2FtbC9saWJzL3hsLy4uLy4uLy4uLy4uL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRs
DQo+PiBQYXJzaW5nIC9ob21lL2Vkd2luL3hlbjIvdG9vbHMvb2NhbWwvbGlicy94bC8uLi8uLi8u
Li8uLi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gUGFyc2luZyAvaG9tZS9l
ZHdpbi94ZW4yL3Rvb2xzL29jYW1sL2xpYnMveGwvLi4vLi4vLi4vLi4vdG9vbHMvbGlicy9saWdo
dC9saWJ4bF90eXBlcy5pZGwNCj4+IA0KPj4gUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3Ig
J21ha2UgY2xlYW4gLWo4IC1zJyAoNSBydW5zKToNCj4+IA0KPj4gICAgICAgICAgICA0LjIyMzMg
Ky0gMC4wMjA4IHNlY29uZHMgdGltZSBlbGFwc2VkICAoICstICAwLjQ5JSApDQo+PiBgYGANCj4+
IA0KPj4gQWZ0ZXI6DQo+PiBgYGANCj4+IHBlcmYgc3RhdCAtciA1IC0tbnVsbCBtYWtlIGNsZWFu
IC1qOCAtcw0KPj4gDQo+PiBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnbWFrZSBjbGVh
biAtajggLXMnICg1IHJ1bnMpOg0KPj4gDQo+PiAgICAgICAgICAgIDIuNzMyNSArLSAwLjAxMzgg
c2Vjb25kcyB0aW1lIGVsYXBzZWQgICggKy0gIDAuNTElICkNCj4+IGBgYA0KPj4gDQo+PiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8
ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4gDQo+IEkndmUgY29tbWl0dGVkIHRoaXMgYXMgaXMg
c2luY2UgaXQgd2FzIGFja2VkIGFuZCBpcyBhbiBpbXByb3ZlbWVudA0KPiBpbiBhbnkgZXZlbnQs
IGJ1dCAuLi4NCj4gDQo+PiAtLS0gYS90b29scy9vY2FtbC9NYWtlZmlsZS5ydWxlcw0KPj4gKysr
IGIvdG9vbHMvb2NhbWwvTWFrZWZpbGUucnVsZXMNCj4+IEBAIC00NCw4ICs0NCwxMCBAQCBNRVRB
OiBNRVRBLmluDQo+PiANCj4+IEFMTF9PQ0FNTF9PQkpfU09VUkNFUz0kKGFkZHN1ZmZpeCAubWws
ICQoQUxMX09DQU1MX09CSlMpKQ0KPj4gDQo+PiAraWZuZXEgKCQoTUFLRUNNREdPQUxTKSxjbGVh
bikNCj4+IC5vY2FtbGRlcC5tYWtlOiAkKEFMTF9PQ0FNTF9PQkpfU09VUkNFUykgTWFrZWZpbGUg
JChPQ0FNTF9UT1BMRVZFTCkvTWFrZWZpbGUucnVsZXMNCj4+IAkkKGNhbGwgcXVpZXQtY29tbWFu
ZCwgJChPQ0FNTERFUCkgJChBTExfT0NBTUxfT0JKX1NPVVJDRVMpICoubWxpICRvLE1MREVQLCkN
Cj4+ICtlbmRpZg0KPiANCj4gLi4uIHdoYXQgYWJvdXQgdGhlIGRpc3RjbGVhbiBnb2FsPw0KDQoN
ClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24sIEkgc2VlIG90aGVyIE1ha2VmaWxlcyB1c2luZyAn
ZmluZHN0cmluZyBjbGVhbicsIHdvdWxkIHRoYXQgYmUgYXBwcm9wcmlhdGUgaGVyZT8NCg0KU29t
ZXRoaW5nIGxpa2UgdGhpcyBwZXJoYXBzPw0KDQpGcm9tIDUzY2JmODFhOWM3ZDUwOTA0NDNiNWZl
NWRlMzdhNDcxMThhYzUzZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpNZXNzYWdlLUlkOiA8
NTNjYmY4MWE5YzdkNTA5MDQ0M2I1ZmU1ZGUzN2E0NzExOGFjNTNkOC4xNjU5NTIyMTc4LmdpdC5l
ZHZpbi50b3Jva0BjaXRyaXguY29tPg0KRnJvbTogPT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9
QzM9QjZrPz0gPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQpUbzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQpDYzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tPg0KQ2M6IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+DQpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4NCkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4NCkRhdGU6IFdlZCwgMyBBdWcgMjAyMiAxMToyMTo0NiArMDEwMA0KU3ViamVjdDogW1BBVENI
XSB0b29scy9vY2FtbC9NYWtlZmlsZS5ydWxlczogZG8gbm90IHJ1biBvY2FtbGRlcCBvbiBkaXN0
Y2xlYW4NCk1JTUUtVmVyc2lvbjogMS4wDQpDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgNCkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCg0KU2lnbmVkLW9mZi1i
eTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCi0tLQ0KIHRvb2xzL29j
YW1sL01ha2VmaWxlLnJ1bGVzIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvTWFrZWZpbGUucnVs
ZXMgYi90b29scy9vY2FtbC9NYWtlZmlsZS5ydWxlcw0KaW5kZXggZDM2ODMwOGQ5Yi4uYzFjNWRk
M2IzOSAxMDA2NDQNCi0tLSBhL3Rvb2xzL29jYW1sL01ha2VmaWxlLnJ1bGVzDQorKysgYi90b29s
cy9vY2FtbC9NYWtlZmlsZS5ydWxlcw0KQEAgLTQ0LDcgKzQ0LDcgQEAgTUVUQTogTUVUQS5pbg0K
DQogQUxMX09DQU1MX09CSl9TT1VSQ0VTPSQoYWRkc3VmZml4IC5tbCwgJChBTExfT0NBTUxfT0JK
UykpDQoNCi1pZm5lcSAoJChNQUtFQ01ER09BTFMpLGNsZWFuKQ0KK2lmZXEgKCwkKGZpbmRzdHJp
bmcgY2xlYW4sJChNQUtFQ01ER09BTFMpKSkNCiAub2NhbWxkZXAubWFrZTogJChBTExfT0NBTUxf
T0JKX1NPVVJDRVMpIE1ha2VmaWxlICQoT0NBTUxfVE9QTEVWRUwpL01ha2VmaWxlLnJ1bGVzDQog
CSQoY2FsbCBxdWlldC1jb21tYW5kLCAkKE9DQU1MREVQKSAkKEFMTF9PQ0FNTF9PQkpfU09VUkNF
UykgKi5tbGkgJG8sTUxERVAsKQ0KIGVuZGlmDQotLQ0KMi4zNC4x

