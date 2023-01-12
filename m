Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3126673D1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 14:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476167.738204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFy6c-00042w-9v; Thu, 12 Jan 2023 13:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476167.738204; Thu, 12 Jan 2023 13:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFy6c-00040u-6c; Thu, 12 Jan 2023 13:58:58 +0000
Received: by outflank-mailman (input) for mailman id 476167;
 Thu, 12 Jan 2023 13:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFy6a-00040Y-QW
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 13:58:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ded505e-9281-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 14:58:52 +0100 (CET)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 08:58:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5025.namprd03.prod.outlook.com (2603:10b6:408:dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 13:58:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 13:58:40 +0000
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
X-Inumbo-ID: 3ded505e-9281-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673531932;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7y/UBF+/73haNmuu4jeuUM3NbyULZc1Ow6fxxc0jvlQ=;
  b=JOoaUGlLHIBYxZNNZdn6asoJHzwA33jgR2y/qUH1zB7ZZBIStRt0Y0wl
   aeEPcI14KVGuBE0PyY51rST3mO+A+dmQt7rk1kKyajcQCPLiPJC1Ik88a
   qQQ+zrpGo2gDeLAr91Hsp0BhctTck/abxSr2vVL7hY398QhkrvNbEqphX
   c=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 91241997
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F6R47aP8zWUuQebvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUon3jRVy
 WtNUWmFaKqIZ2Lyeox1YIWz/B9VuMDXnINkQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t4mCG1np
 PYAFCIQQBuHq6Hv5IKVdtA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexHmnAdNDS9VU8NZQigev1Hc6CCcSbkOFnejmsGq7UfxQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBQQ5b5dDm+dg3lkiWEY8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:qIGhUKz1pVRtdp5GHM7MKrPw871zdoMgy1knxilNoHxuH/Bw8P
 re+MjztCWE7Qr5PUtLpTnuAsa9qB/nm6KdgrNhX4tKPjOHhILAFugLgbcKqweKJ8SUzJ8/6U
 4PSclD4N2bNykBsS75ijPIburJw7O8gdyVbf+19QYLcenzAZsQlDuQDGygYytLrFkvP+tBKH
 KEjPA33wadRQ==
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="91241997"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyneM/E16kIodQQew1AbITyMCEB5ShL9Ub9MRJq86C8g76UVJ08xfBC0uw/VCkrwaIHg0e03EoJrmtAbzUGiwxgnoBkBlvDwej7hNPRoYBheloYDppjotmzFfMJ49v6QenTK+4MLHrFUlgR6gSIiv475nntFmVMhh2biwDQhbxBvKgFnOYNRlFqPIxaTvtn2bFYw/G1oyCh1Kx5Ot4vSh/pCSm1CmUXVA42h2c5liyl7vJRxcXnK8Iz6Srk0pEgMZilYuimS8h3dbqLu6BM46pWY8ZHGbFn7SHoh35cbQNjBawhIEDqjod5wo8S2Gdjp3KCuMYn5a3ofzwdGv/GsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y/UBF+/73haNmuu4jeuUM3NbyULZc1Ow6fxxc0jvlQ=;
 b=mQKOOCTiUhEDjJkLRKJLQMg56v5Pu+bpnHiOGS2K45kvHSP3gAFIpirC8en1mUTSJ6VFrQmwVDSnB9z3IWUhsCDYrXlyVAz/47fIcvqIYCyvTENyFldKylHHoIR4HY6vgOVL048R2cusxaFQW7iTNvxyaiydLjOhDKZNJVDvSnQzRRJ9Mm8k4YpoAmt5xAkVf9C+/EvEM2h57QtcS4rBEeFXtH/DrIUbo+S/EpJ3cLMC1vd4r4YGqCdv1FmqOFiCNgItMnZh1fE7aNVSIvw71bkG/a4TqB+rpnh1dlydDsTX5Y4zmBYA4y4vI7Wpf4uBmJdC8Nzv4FR8qJIA8VSnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y/UBF+/73haNmuu4jeuUM3NbyULZc1Ow6fxxc0jvlQ=;
 b=vmyyQQeRg/8dilEtmqyqVe1zmxR3avoXtz27AqcKDDakZ2ywUJDMT0IhA3GsqEzO72q1hJQrzqlidxcbTP6QNE2XE4wj67HbmSNv1T4V6mpW8iqXm2Tw/l6FhBqzh+0L9ldeGUxPyozor94j+JLgmzUph5RaPM/poUZ80/9cDtM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Thread-Topic: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Thread-Index: AQHZJRefYU5gP8dknEybN3m0hZOPA66awNaAgAAQ7QA=
Date: Thu, 12 Jan 2023 13:58:40 +0000
Message-ID: <2e568a8d-02d6-5761-8b55-c37a8de1be0e@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-5-andrew.cooper3@citrix.com>
 <97d16968-57fa-0114-1a93-4d0d253b8172@suse.com>
In-Reply-To: <97d16968-57fa-0114-1a93-4d0d253b8172@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB5025:EE_
x-ms-office365-filtering-correlation-id: d84b2e79-3fee-48de-1e5f-08daf4a51c64
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sJwdSiTxwobm9lzJHiumNbgNfWH6hDOni/WR7A4jLqJz1FJl8kMJ8JaFTBU0XNm1gx67TPjcFG6mcKNekTjMCORddMSPYWwZiDJC+BEAWj8RsLxWCbswqULCrPefKtN2jZXzIaHpfcR/W/ewEEz2b7ApNtNDDsGBiN2o1W0Khl7Bgy4OOLgCVgvW4YISxt//FQUGgTXb4cAF3gKVnhqsjQvyf43zDzPdJMv65o1OWtEtjsXJ9BAqCFW4hRG/GSH4q1OWaKH6LtyXnoSWURN2rmpi0O8GFPAsaWFBKz3MmjqSvMlpMdSJigGtdFwQM3eTEfghBgGfr+uXA7Y57XZ/BnsXrTvy8//tuX+RE+IefT2MA5H3mReC9jt0T7razaj+C4pl/Ht92HV3DviGCCsbODt1TbRVYJb6IExRRhIVG2ZTL6tLVvIHsXk+wa6SL1QG2ilFRVfFYCfjR4YxG5qy+fXYOKBxX7y1TYRW3EG1LtpYzEVCtVar0iORy74UQuBIl15/DjimqPObnw1aIZBkkoiruLIcg9D9QnnN1B2pbDN2j0vKWg0IDHdP3MiyCgeFp98z4RsEXBnKQ7ojD3Hq377Sm04IgaNKWMIauLsAQS2/hbJE1FjNdUw8Qoi5xqRvGeG52uM+onGYSpPW4JkEyTGb8rfLk1EQZ7FbJCXzPSDgutNG7+DYin7oU9MbLM2rVy2SQP7xTQBMMeFW76XeIys3HxIdyOMzYe3zDUka3zXU60305wz04UUYbxFxPJkNL0jRfOnb8/FeYYdIUrN4nw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(8936002)(5660300002)(83380400001)(41300700001)(86362001)(38100700002)(82960400001)(122000001)(36756003)(38070700005)(2906002)(31696002)(478600001)(31686004)(26005)(186003)(6512007)(71200400001)(6506007)(6486002)(91956017)(8676002)(6916009)(64756008)(4326008)(76116006)(66476007)(66946007)(53546011)(316002)(66556008)(66446008)(2616005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHRNZzVvT0gwOHRrMURFOTMvaGlHNHlJbXJvRWVyVHBIOHlueHBJVUYySk9O?=
 =?utf-8?B?RWNwTS9vWW13dSsyMFVvZGZCYW5JVzBRVTdjRlVGakEwVWY4YXFPb3JDbkhS?=
 =?utf-8?B?UGVwdjhJelFmeUtqWS9xVmM2Z3pIS3Bzdnk1aWljUzQrWWdHVEt0QmtWc05s?=
 =?utf-8?B?ZGJzNmJMNmsxTFl6TzJJLzNrMUg0MjgweWxoaDA2b1NIeTA0OEVMMDlhejA3?=
 =?utf-8?B?eDBaRDFxWUV1bHFiMDFnQkIwWDZwSFhUbHNXNUZKM0p1UGhudWlhbmp0eERG?=
 =?utf-8?B?SVpkd0dIcjVEdHRYUXlGTTNUZ3NKNE1MVW9nS3p0TVNhNlN5V1pwZlg0VE9U?=
 =?utf-8?B?YS93Z2dkMHpUNUZ5ZTZSYmtqenl4WkFHdnRudUxTU3hsb0luVjhDRGZDa2M2?=
 =?utf-8?B?Sm1pOWowK0FrVk03aVFHZFBPblRLaGUrdmVDYXYxTXFRTWlVVWRGSnp0dmgx?=
 =?utf-8?B?cUovUjBZVURaZXYybDJEVEZvKzh5RU51WkFqWU52T3o5M3U3VUxTWGh5OE1z?=
 =?utf-8?B?cDAya0tMd3hPaWYrNm5CZVUwTlUyUG4xdFkrd1AyR2w2ank1cmx4aVpLeFdW?=
 =?utf-8?B?c29CRU8wZ0M3aW1yNUR0NW44TWczbjVUU0NqM1RSSEhuOGpxWmlWbDdxRmoz?=
 =?utf-8?B?MUQwYnc3UHh6ZWxXK2hLSzBzMWQ4MFZvWGlMeHVhVXdSbW5hbzBRckVrZi9q?=
 =?utf-8?B?RUtWanp1dVJLeDA0VThpUmJ2dit5UEp2RFhNaHFsOTl6UWJ2MjhOeWs5dWpw?=
 =?utf-8?B?MlhjdFVMNGgwcjVCelNpckVtUDdMNG1TNTQ4QmIxb2lTWndPK2xwVnhkS0tE?=
 =?utf-8?B?MmtORE51bHV5OUo1NlBPeDRkckpTb2w3ZVJiY1l0Q3duYk5SdjkxQ0lHSHRa?=
 =?utf-8?B?MmZ2Ly9JU0VLRVF0ZENjWTR5eGlubnVtOXlqRmx3Q2cyRTlaRmZiZWgxdnhp?=
 =?utf-8?B?Y21YeWJUMitCaDQrOHRPd0tXb1RNd0RXZ0ZWbkJXYkNtVkxWSFNhZ1JZMGJZ?=
 =?utf-8?B?bkpsMGl3ZzQyUU5rc2ozZjZkRWY4Mno0bUVYUnFWZmEvNFNrSlRjQ09JclEz?=
 =?utf-8?B?aDRUeUlBRXVQT1p1NmZ2aHNDOHV4dW9ZWmVHU2lRdzRYMjVkT2hBSGpwUlhu?=
 =?utf-8?B?dmw4bmJZSHpqL01TekwrbDVZTE4xWENmU1RjMTI4Uk1MY2ZCcVNLTGRaYUJk?=
 =?utf-8?B?RFk4b2ZBT2d4a2JWUnNNa3FGNFZpTmFLVVZBZ0dCd1p1QTJaZ3QxcWJBKzRp?=
 =?utf-8?B?ZE0xbVhxOFBWazZES053S2VSZG5kVHJYSGJJUXdOckRCSkZhR3FZRVltcytN?=
 =?utf-8?B?eGRTV1l3VmlYbnB0c1ArRnh3QTZwbWtCbGJuV2VjSWhzM1ZxZExLSVJ6dlk2?=
 =?utf-8?B?RUJ4Mm5FZk11V0pPM3RFUjB1QTVBQThpc1c4ZHlrMDBoeUZOY0s0eDNpWHpG?=
 =?utf-8?B?OElQbDhybGRpQy90SGlTb0hCa2tlNTlsTFkxME5TckpvQ1hCOUxRb0l5Ri92?=
 =?utf-8?B?a1MyYmNQN25SNXVIL2dVanZkYS84RzEvaWtiL2F0UmJBSjRIZ3VKK1VtemNX?=
 =?utf-8?B?aGtrYUVPTjBnMlVqeDZJM1M3OS9TR2hKUXlvN3JzcWlnSWZaQVhqTTBwWi9j?=
 =?utf-8?B?WnRBOEZIRCs3T0ZCaitmalBlaFVmZWFuREFZYm1wM2dZaEl1OUdTQS8zS2hk?=
 =?utf-8?B?cXhvM3JXYkRadWErZHZRaTg0Qi9SYzc0b1ZKdDRCNTYwTTRhbFhka0pQU2s0?=
 =?utf-8?B?cXRJRTBZQlJwSVZFZjYydEIvcVdubkFBemd6bVNuMGRLY1dsV29wSzUzaGcy?=
 =?utf-8?B?bWtGV2FidW81TVgvWnlKK1ByVHA2NTZScHE1ZE5vZG5VRDhEZUFWNFpQSVhF?=
 =?utf-8?B?Z1JmbjBuMWp4dDJnSUEvRm90Nm5wdStOVTl5Yko0TlZFNFhobnRLajZ2OXdX?=
 =?utf-8?B?N1Z2VXhveDltSUpUOGtXRjhvTk5mMFF5OTlmcFVoakFWNVRFREZaeEVpV0Jx?=
 =?utf-8?B?QWNXTERrb2FhWDFmTVpaTEtvT0puY1FXNzhYdmVCV0VPSkgrSHJJclhORVhC?=
 =?utf-8?B?Mng4QVBORnNWb3VEMXJsdzZ2azIxakVWc3hMSTllNjI5a3JpTGRRZzJyR1Fn?=
 =?utf-8?B?dk5FTEwxUVB0bUFLb2FveFoyN0RTcWkyaVRmdHRvNzRvbGJIZWtxcXZSWkNS?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D52A8C1EF6E1B949B113D2F9810B1A28@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O2r9A88FXUoL9rckE2jDDLrn7EKAerBklpUssImVG2eh5XoD5/lCOyLUMFJPVkKUPKICGPfHotx5DRTj+qI9cuepu2HWe7EZTXRHvaw32i+yaEUbje9dthMagIHcKJe2+VF8sVN5dk3yRj45fSIm37b/tgHkmvatKMUf25bjvvKfa629EavvY17rZPoGprDM/plOiyDKl/qfV1gMPYTofqVM/qdKi7cIoX/ZGd/0wJc/GcKfFvi64+W31nqWNY1L221D57URg1oGALoHZ3oJeIZ/b8Sk0TTBKc3H+isYr2yX74t2e8u3+oxEZ6N6kMn6XknihB2vSSxK7MVXHdHeJ5X93G6h03CTwhQ9IvWw/LtoYVNhIaESxTvo/nUoQCcFPR/sogUE2+cT/GZkqNJ5g9LRQag7jnJr2j5hGC/E9am+WfWH/iT7EAAxU+3EKEq40+G5S+0CCLOBCaiz0mNW8YxTwF5Z0dIE+V3BZyDRzOt16WhJb1ztybrIvsCeqRbL4sD9XQCAZGbw+d5U/fqnmi7KHhYzWrpCPkP15BMPlJl1REfzRyJ5b4kyM3GzG4HtfP6hiYb3rUoAgZUK02bp7ZnRlPkYE3qR846luNJ/ApEIWkNZsrX/4Pjwln+L39159ONaSKeXZvDeMLO39qq+XcDYSyCQb6mf1Idj2Js1lxjcvWOiuWjAwZX/168SRmXjF2yPUHksH7H5HvPavA+JjYTqbjN5ddV5b6HSoS9Ers+/8z7XWdWxAnTtPhTJgmYGxx/elIXeeF4O4U77wyJDZg8Y7IlmNqTNkIjmF2Rz9bnLrqY9K75/s+CNXnfUWR3V
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84b2e79-3fee-48de-1e5f-08daf4a51c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 13:58:40.8982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3o8hyJJPdi16K8unOx+q3sOII2IMmoUDtTU9/GFem9b91Ri1Nnxkd2Jw1JPhcgn57tyUTl5njAzFkanZr9oqNmGnxhkTHOqs8CJ9nUlJpuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5025

T24gMTIvMDEvMjAyMyAxMjo1OCBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjAxLjIw
MjMgMTg6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXUk1TUiBOb24tU2VyaWFsaXNpbmcg
aXMgYW4gb3B0aW1pc2F0aW9uIGludGVuZGVkIGZvciBjYXNlcyB3aGVyZSBhbiBNU1IgbmVlZHMN
Cj4+IHVwZGF0aW5nLCBidXQgYXJjaGl0ZWN0dXJhbCBzZXJpYWxpc2luZyBwcm9wZXJ0aWVzIGFy
ZSBub3QgbmVlZGVkLg0KPj4NCj4+IEluIGlzIGFudGljaXBhdGVkIHRoYXQgdGhpcyB3aWxsIGFw
cGx5IHRvIG1vc3QgaWYgbm90IGFsbCBNU1JzIG1vZGlmaWVkIG9uDQo+PiBjb250ZXh0IHN3aXRj
aCBwYXRocy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPg0KPiBUaGlzIHdpbGwgYWxsb3cgbWUgdG8gZHJvcCBoYWxmIG9mIHdoYXQgdGhl
IHJlc3BlY3RpdmUgZW11bGF0b3IgcGF0Y2gNCj4gY29uc2lzdHMgb2YsIHdoaWNoIEknbSB5ZXQg
dG8gcG9zdCAoYnV0IHdoaWNoIGluIHR1cm4gaXMgc2l0dGluZyBvbg0KPiB0b3Agb2YgbWFueSBv
dGhlciBhbHJlYWR5IHBvc3RlZCBlbXVsYXRvciBwYXRjaGVzKS4gQ29tcGFyaW5nIHdpdGgNCj4g
dGhhdCBwYXRjaCwgb25lIG5pdCB0aG91Z2g6DQoNCkkgZGlkIHdvbmRlciBpZiB5b3UgaGFkIHNv
bWUgc3R1ZmYgcXVldWVkIHVwLsKgIEkgZG8gbmVlZCB0byBnZXQgYmFjayB0bw0KcmV2aWV3aW5n
Lg0KDQo+DQo+PiAtLS0gYS90b29scy9taXNjL3hlbi1jcHVpZC5jDQo+PiArKysgYi90b29scy9t
aXNjL3hlbi1jcHVpZC5jDQo+PiBAQCAtMTg5LDYgKzE4OSw3IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICpjb25zdCBzdHJfN2ExWzMyXSA9DQo+PiAgDQo+PiAgICAgIFsxMF0gPSAiZnpybSIsICAgICAg
ICAgIFsxMV0gPSAiZnNycyIsDQo+PiAgICAgIFsxMl0gPSAiZnNyY3MiLA0KPj4gKyAgICAvKiAx
OCAqLyAgICAgICAgICAgICAgICBbMTldID0gIndybXNybnMiLA0KPj4gIH07DQo+IFdlIGNvbW1v
bmx5IGxlYXZlIGEgYmxhbmsgbGluZSB0byBpbmRpY2F0ZSBkaXMtY29udGlndW91cyBlbnRyaWVz
Lg0KDQpPb3BzIHllcy7CoCBXaWxsIGZpeC4NCg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL21zci5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNyLmgN
Cj4+IEBAIC0zOCw2ICszOCwxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3Jtc3JsKHVuc2lnbmVk
IGludCBtc3IsIF9fdTY0IHZhbCkNCj4+ICAgICAgICAgIHdybXNyKG1zciwgbG8sIGhpKTsNCj4+
ICB9DQo+PiAgDQo+PiArLyogTm9uLXNlcmlhbGlzaW5nIFdSTVNSLCB3aGVuIGF2YWlsYWJsZS4g
IEZhbGxzIGJhY2sgdG8gYSBzZXJpYWxpc2luZyBXUk1TUi4gKi8NCj4+ICtzdGF0aWMgaW5saW5l
IHZvaWQgd3Jtc3JfbnModWludDMyX3QgbXNyLCB1aW50MzJfdCBsbywgdWludDMyX3QgaGkpDQo+
PiArew0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBXUk1TUiBpcyAyIGJ5dGVzLiAgV1JNU1JOUyBp
cyAzIGJ5dGVzLiAgUGFkIFdSTVNSIHdpdGggYSByZWR1bmRhbnQgQ1MNCj4+ICsgICAgICogcHJl
Zml4IHRvIGF2b2lkIGEgdHJhaWxpbmcgTk9QLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgYWx0ZXJu
YXRpdmVfaW5wdXQoIi5ieXRlIDB4MmU7IHdybXNyIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIi5ieXRlIDB4MGYsMHgwMSwweGM2IiwgWDg2X0ZFQVRVUkVfV1JNU1JOUywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgImMiIChtc3IpLCAiYSIgKGxvKSwgImQiIChoaSkpOw0KPj4gK30N
Cj4gTm8gd3Jtc3JsX25zKCkgYW5kL29yIHdybXNyX25zX3NhZmUoKSB2YXJpYW50cyByaWdodCBh
d2F5Pw0KDQpJIHN0aWxsIGhhdmUgYSBicmFuY2ggY2xlYW5pbmcgdXAgTVNSIGhhbmRsaW5nLCB3
aGljaCBoYXMgYmVlbiBwZW5kaW5nDQpzaW5jZSB0aGUgTmFuamluZyBYZW5TdW1taXQsIHdoaWNo
IG1ha2VzIHNvbWUgb2YgdGhvc2UgZGlzYXBwZWFyLg0KDQpCdXQgbm8gLSBJIHdhc24ndCBwbGFu
bmluZyB0byBpbnRyb2R1Y2UgaGVscGVycyBhaGVhZCBvZiB0aGVtIGJlaW5nIG5lZWRlZC4NCg0K
PiBEbyB5b3UgaGF2ZSBhbnkgaW5kaWNhdGlvbnMgdG93YXJkcyBhIENTIHByZWZpeCBiZWluZyB0
aGUgbGVhc3Qgcmlza3kNCj4gb25lIHRvIHVzZSBoZXJlIChvciBpbiBnZW5lcmFsKT8NCg0KWWVz
Lg0KDQpSZW1lbWJlciBpdCdzIHRoZSBwcmVmaXggcmVjb21tZW5kZWQgZm9yLCBhbmQgdXNlZCBi
eSwNCi1tYnJhbmNoZXMtd2l0aGluLTMyQi1ib3VuZGFyaWVzIHRvIHdvcmsgYXJvdW5kIHRoZSBT
a3lsYWtlIGptcCBlcnJhdGEuDQoNCkFuZCBiYXNlZCBvbiB0aGlzIGp1c3RpZmljYXRpb24sIGl0
cyBhbHNvIHRoZSBwcmVmaXggd2UgdXNlIGZvciBwYWRkaW5nDQpvbiB2YXJpb3VzIGptcC9jYWxs
J3MgZm9yIHJldHBvbGluZSBpbmxpbmluZyBwdXJwb3Nlcy4NCg0KfkFuZHJldw0K

