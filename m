Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C423762E1B8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 17:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445297.700436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhjN-0004bk-HY; Thu, 17 Nov 2022 16:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445297.700436; Thu, 17 Nov 2022 16:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhjN-0004ZE-E2; Thu, 17 Nov 2022 16:27:13 +0000
Received: by outflank-mailman (input) for mailman id 445297;
 Thu, 17 Nov 2022 16:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovhjM-0004Z8-NG
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 16:27:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae79982f-6694-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 17:27:10 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2022 11:27:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5970.namprd03.prod.outlook.com (2603:10b6:610:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 16:27:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 16:27:03 +0000
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
X-Inumbo-ID: ae79982f-6694-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668702430;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LKhgxxwXJyatr88HgRHYL0lQJr/bi+Lp3jg4QI2ewKw=;
  b=ND7n3i6txLz7sxjvrWqaz9YNhrCiykA1sFoyeTqzqwcS1K0aQJCr36gQ
   KLNBZk29W/J3f4xnH0QPy3Ti7FRRSpl+vyD1F943Vf+ltLDEBK7FpX8/M
   Uu+2PJ0aQqEVUFDePRMWTDnPXUANPkO+CwhP4D1GJ6vjQMDRG3Nr0LdgD
   s=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 85067423
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ojIJDaNioPZZ2ubvrR05lsFynXyQoLVcMsEvi/4bfWQNrUp21zJTy
 WoZCmmHbKuDZTT0KdkkaIS0/U0OsMDczIdhQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vpqOFBz+
 fcxEQ4MXkyFq/qrmqKCYMA506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efwHulB95IT9VU8NYwhUfJ+ysaKScQclmxuaO20lS9QoJmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqf67OVoDWaKSUTa2gYakcscwwB5NXypZApuTjGRN1jDa2dg8X8HHf7x
 DXihCIznakJhMgHkaCy50nagimEr4LMCAUy423/fm+j9BI/W4ejaKSh812d5vFFRK6JQ1/Es
 HUalsy26OEVEYrLhCGLWP8KHryi+7CCKjK0vLJ0N5wo9jDo8Hn6e4lVuWh6PB0wbZhCfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zmFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:Z8kjoKpu//yuAUwvXHyB7vUaV5sDLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiv7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdU99WPBmcUa+d
 tVfYbhDcVtABWnhrfizzBSKemXLzAO99G9MxA/U4KuomNrdTtCvjYlLYQk7ws9HdQGOtl5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR92AiGQu1+8HIJou
 W2bHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFkr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2STN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDnAXPagAZZQy09Jju7TlbLc8wzT9oW7Jlv2jOHlFrrE8el
 d4Lffujr67zFPGj1r10w==
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="85067423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KknGO1sQA0zWS8jPlW/WpxKCchYs90/DR30i12YwFD/liUqZebtSMloLfeR0/CHcRA/8rizOzppmQ9/QbLnB1aRvRyt+v325tYwzVIgheI3pOh1SLeOdIZhWDBsn2/SPSDa35CZXx3odGd5fUtkkol2Nnyi3k0fDr6agXYch6ybabBK8qF/7rO0PEPcl+H3rBK7Lk8eTQCBL677cHaIlCpABVSpDNtmVkXau/BhmpHy9hg0z/UBPF6Qoqo1GIL3iZPBzirN8cSyZxwCyp10dx8/61WK5/NKI9FQEa0S2lYlZmWPs8YwFS/XtoVVFTpgjyaicC8AFQ1tKLWYYbkuoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKhgxxwXJyatr88HgRHYL0lQJr/bi+Lp3jg4QI2ewKw=;
 b=LgzWOa4yJwtJ/ufbSqXnuQyIm7Tg7jlGyhuHt7E+Luc5o4ymfFrv8TE8vJZ1WYSxZxhcJvgl44KllpnDhYNtCa5b6YHVa+DHH4HYUY0KwFT7T8gJBPrEh9VbrHZ3UUvS3fpP9OlOHhm2WY8F1WY7SOnXsUB5Ju1dC2dPplu/+js1xdlN+pCFIsEf4kdK61VJrcnchwDahHsm0Ddc8zk7wRCTx4JvbpPZYDL3N3mxcbAh1MmaSM42bAr6TDp6czq2LP6BXfunUMrCJ5Q32L4ToW0YAFvDdFOCU7q3QItiSK+YulHSMEAEShrs694l6SgscpncYdVjWk/1YlMWt18flg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKhgxxwXJyatr88HgRHYL0lQJr/bi+Lp3jg4QI2ewKw=;
 b=Tp1tP4n0buchxuhA7MUTw4a0D87zC47jcS1+xHI8lFQzx/uX/Z9dqjXfEopk3KRW1DwAYEK59NCuuCQaxxmqriuAxcmiU3H5VTh4+qjXOGJwfbKX2mdwKxyVCyYZjvDgbd71bCQUvJvrjVN0UkwsxyJ8Y7hosI6tikfAWOpRGHc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] tools/tests: Unit test for paging mempool size
Thread-Topic: [PATCH 2/4] tools/tests: Unit test for paging mempool size
Thread-Index: AQHY+iEU7bRDKRjfo06qF2T8yB0IDa5C7Z4AgABg+AA=
Date: Thu, 17 Nov 2022 16:27:03 +0000
Message-ID: <a858ce31-a3b5-0aa9-cdcc-2aebc8d0c506@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-3-andrew.cooper3@citrix.com>
 <3ede581f-3393-9290-b929-6c28450b007a@suse.com>
In-Reply-To: <3ede581f-3393-9290-b929-6c28450b007a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB5970:EE_
x-ms-office365-filtering-correlation-id: f44a9b4c-f2cc-480e-deda-08dac8b88f65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LRvhFdJ8ts5UvN/A6W1KBLSyOcreS8iEpxmCPXh8kD64LMe6HCWOB2sSEUo9M185wR4Dpb8uPMID1UEpC8JecB18LwnzeCIedVJCQWuiW5P/PR0fCrBI272BtUccB1cRaPktkcPSptv9TklOdJzr4wvMsp7CtK2EISmSVIuwGES3lAs+zSNusRsKsv0TKKodU46N+aZJ9Srrq4gfiBfYGBvlsYETwCW/HyvoH9uf1t7f4Mm4oTIYg+k7drOoIdEEM1EUzoYsJkPpRtj8opkBl89OuTCq3iJYOfTudyBKxEvd0AbFvYdsdVcheILZTS9KqiMLg/zQ1XqkxAuYBgzNCMwB5RZm/y8jihW+3/8uvElqxR4/VxiGdcdwY+EL0ERh3KCKey2CDn8n6j3MXKvb8r3pY0aRlifdTk74P1p8TW50SDY7sJQDd196o/GjCFvgwxbiq55ArWzVEzL3bVkVjCcDMOrjIJ88/wOVjdnF8465xztROzADG6dgkr4TKDyzU7PFRUc52Mxb5AlPm6rVhIe92POQ+0BPOm8c59f1CffDGCvxkh9uevXe4vrdlEtbZxiS/0Au7sOLOkUWwum7EaLLcH1pRbBdxGR1+VigxBYwKMFXkbmjsLj0psqbgjH6MJguCfw6d9eG5jmgG+nBqor6sR4aDDocQ0jWAnhRUgnR8HF2FCQqIaw/iYs04FTfWn8txt4aAos2RfW8/B10ZSvuh88MsacF6XHlKTBoZExOErHFVCvsMzzblxo1eBhQRscSQW7cy1mdKO4d40aahA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(36756003)(31686004)(2906002)(66556008)(5660300002)(41300700001)(8936002)(66476007)(4326008)(83380400001)(66946007)(64756008)(66446008)(76116006)(86362001)(31696002)(8676002)(91956017)(38070700005)(316002)(6916009)(186003)(71200400001)(54906003)(6486002)(2616005)(122000001)(82960400001)(6512007)(26005)(38100700002)(6506007)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cENiMUh1UlBWbUp4UkttK1B6UjRXeWxvMXgzb0lQbE9QdWRQcnRULzFFa003?=
 =?utf-8?B?Z1Z4RG5qYWpVcUVqUmJSZlZOWElWNEErZTl1MkJjbUJOWjcvWnJEOVhUZ1U2?=
 =?utf-8?B?NjgzUjk3L2tJK3l4VWpTdDdaa0RzRjA2TUNHaGpzYzl2T2x2S3VFZzBkVWtk?=
 =?utf-8?B?d09xb2FjeDVQdld4ekhESW9PeGMvRkoxRlRIQXpaTERRb3ZLQS9Na1RWNFRv?=
 =?utf-8?B?cjJEQndNRXZSemgwS0RRVGx6Rm9rT08rTW9qWUg5bWdSakVaRk5kWXViWVN1?=
 =?utf-8?B?blYxdXRJREdlbzlXRjBxc29JaTBzSmN5ZnNJK3krVVp5WGlmbytzREJJVTdx?=
 =?utf-8?B?NWRHNVQ1Yk5ITzl6RUxoT2JGNUJ4ZVVHYmZVL1JCbFFvdlhyYjFsRkRMbU0y?=
 =?utf-8?B?dXk4M0xJOGREK0taNmxaVytPaVhtQ0J1c2Y3ZG1SdHNHNWJKZVRnQncxVmdl?=
 =?utf-8?B?ZEFIdmR5bkh6SDA0TjVEWnNPaDRFUFk3bmg1WjRGaHVyK1NvUDF2b0pFbXZu?=
 =?utf-8?B?NndSR1c1UllQVFp2eE1wNFNyUTA1dVRRcTQ5ZGlVT01tVmJ5NXBHRU9SU1Qr?=
 =?utf-8?B?bzRtczVNc1Y1ZTM3NTNxcW55RG5abjZvaXVJYkltUm1OUkVmRm0zdGppdit4?=
 =?utf-8?B?dU1VZHFlQkx1V1V3Q1VBNkw2TFQ5T1VFVzNhd1J5NWZWRktPNnplb2xHbG11?=
 =?utf-8?B?YWpqQTAyOE5MVzFRdE5CWTlqN1c0RWI4cjVmcG9oSTNJVzYyMWRsU3hoKzlx?=
 =?utf-8?B?M3dudmhCTzlKRnhHaCtSZk5XUTlESng2dFM3dTVDNzdiV3JZdFRpUG1tb3Fa?=
 =?utf-8?B?RXYyR1F2eGk5bWxzcFA4bi9xcE5BTmZQaFVJOUFBUjNSQ093bmRiWk4zVEdL?=
 =?utf-8?B?SVBNTTJwakVxaXpVSjRiL1NCWGtVLzdUbmJHRjExR3d4eWJYbHVzS0xVRDd3?=
 =?utf-8?B?aGU4cWxsVnpVOXJrT3l1ZFdXbFE1eVV4anhFR3V4cFYzbURLd2M4MXJLVElU?=
 =?utf-8?B?RDI2enFtT0ZFekUxT1NWeGxzNlUyMUZvd0h6Y3Z0dk9XQVRGL0l4K2EvSkNW?=
 =?utf-8?B?VDljd29UeVRWZzUvWGdQdTRMTmtpYUhCUER5WWtEdEM2VHBYcXhQN1dDSE1w?=
 =?utf-8?B?WWx1bzNzNUl6ajNtZFJpTCtKZjcvQTExVnNpQkRRQUxHQjVjOTJHRHlzTSs1?=
 =?utf-8?B?cUI4OThNdXNudk1Mejc1cW1JTVVtREpNZ1BRY2hkVjRSMXJPdHBqVm1qQThW?=
 =?utf-8?B?YkJ4UHg1OC85NXpqb2traW9LeVFmdlAwQ1E3R3hNSkxVeHFJYmxtZWR2bGU3?=
 =?utf-8?B?Mlp0Q0dGVWtQKysyQXd4bHN4NzFmQnoxbk4rS1d6emxNbjFFV1ZISlF6VEdG?=
 =?utf-8?B?QVRDOUtyVkpFalQ2d3VIU3B1QTFCZ3RvL2RHMVc5Qjk3dkxDRTJqRXJzRXIz?=
 =?utf-8?B?ZWRQalp6S2g2eUZEVUNxYytLYXNFU3U1SjR3NWJHbzF5MTBXVHpPb25pQmNZ?=
 =?utf-8?B?RlA0MnNHUWpjenh3bCtGNjJ4UVJTa0pUNHBjZ3VVbStLcVl4dWFCdnh5K1NN?=
 =?utf-8?B?R3d4VERtenpMTFFTS3VnTW1BeWVaQU1EanQxOW5tbGI3d3ora1REUGx6anp1?=
 =?utf-8?B?Zkg4Q0JLQkNPdzNWQkE4MHR2V1BndXFNSEJOUGU4SVUrem0wVjJlR1lUeU41?=
 =?utf-8?B?b250dEp3QlZuaGh3aTRaWXd3UEJ2MGJYVGx3RSt3TVVxdWRXM090YU51QlVu?=
 =?utf-8?B?WmhOYjh2WTU3SUhBVzBrZWpQU0lGR3JYbkNrK1o1STNGOVhwd2g5dWdYL2RJ?=
 =?utf-8?B?Z3lHMVJhM2RhUDdsQTdONmV6KytROW9IZ3JFSnlxMktjSDNnbkFiMzBGdXcy?=
 =?utf-8?B?K2FrVTVDaDZqR3M2S2E0azdSYkJzS0UvZGh1Qi83QjZwZFEzLytvbEVSaWVC?=
 =?utf-8?B?b3RhalA4UDlHczBhZk90Rkh4Q093alRTdkhidkJsMy9PVlE4N0pIYlVBU21l?=
 =?utf-8?B?TjJRcjVhNGQ2czl0TjFiZXVUejJ1M2s5Ullxc2wvNzZGUlZldW5zRjJZK0w2?=
 =?utf-8?B?SWpTZU42RFJDUk14bTZYbWVkZzVlemtqRkdkVlhjSEZXcTk2V3g2dnNTM2JW?=
 =?utf-8?Q?yG1ueQSv7ad+C6pZ/tRxLBUfB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4CD0C290DE10849B33AF522B5C6135B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?d04vYTBocWtMd29Bb0hmWFl2S0xNOFZJMXJRL3hsMVkzbDBSaHRiQ1ZtaU1k?=
 =?utf-8?B?U1NBVnpQQWdUNlY2bGdzM0FPNWRYdlM4Vnh3czZIaWxoSWpJN2l6cEdtdS9u?=
 =?utf-8?B?THpSc1lnL2xMSmFIZ3VEUkF5bGxaamdxTEhxYVAzTExoQVM2QVpCcFVXMDBv?=
 =?utf-8?B?dEZDZVBFYlJIV25uYUh4YTUyTnBQWDZLY2hzenJZZjdOUGNLQlp5amZxOC8r?=
 =?utf-8?B?Tk5FTUs0WGdiZ1BsaDJNMlZhOXF1cTVTS3F3WjJZRVhEaEl6ZkkwcTZvKzdN?=
 =?utf-8?B?UjU1YnRyZGNuYkdPS1BZVDFPdENDNFhEZGJxTlFGZEpHS2plWmFtd3Zla2Uw?=
 =?utf-8?B?cGJaZXkzU0dRQVJ1UWFGQXMyMHU0bDk5YnNHWE40Q0Rvb1NTZHBtYjZWRTBF?=
 =?utf-8?B?Y0t2eUE1R1ozYlUwNXJwRGowcTF4UVBUckIva05TcTVxdGIvMTdrdXJ6by9F?=
 =?utf-8?B?bk1TQ1JiZk1nYkdJQ1VLOG5FMjNORHhYR1JRVzZlNnJUcm1Oc3hzckZSVlNy?=
 =?utf-8?B?YndEdEZ5cnhLNjZuaWpQdkpRY3VoTDY4bHhDOWE3elRvRE12UGlNUCtWVXQv?=
 =?utf-8?B?UVpmZDdBbzJGWlVjVmdtMTU1bk1kenZwdy9aU3oyc1ROUU0wVlFtQ1o4cWFy?=
 =?utf-8?B?R0pIOERRVXpYdmVJbGF6ZnM3UXBreWVQYnhZWm80ZEYzcFc2ajZzcUE0bGts?=
 =?utf-8?B?WVVpRERNRjYyMjl6SWc1MFI4QU1ZN2xYMEg0ZS8ydm1zWFVOaW40dkpVSEgr?=
 =?utf-8?B?a1pva1pJaWFTeVJnalFqdHFZNW5HVHFtQi95ZzJFNGZzNUc0Vk5Jc1hPem9P?=
 =?utf-8?B?bFc4dzhEdWpFbUxuL3ZtdkZlcUhSMWF4UmZYQTgvL3VubjdqOHNOQStzTDdE?=
 =?utf-8?B?SkQrQXFZOGwycWp5Nk5sY1NobkI1b2k4YklCWTF3SGtZTFpldzV4TGZLTTd2?=
 =?utf-8?B?TVBITFZZU2VvVlRNS1F4L3ZwYlJUdHBZaUc1Qk5LQ05TNlFDaVZoZUFkYXhr?=
 =?utf-8?B?WXVPbnNRVXoydVBkOGp4em82VkNTT0JnTGpMa2dvYnBqdDlWSXRvUkY5bzgx?=
 =?utf-8?B?T0hTMlRZemV4UCtZSi9udG5ZdkV5b0xkZkR3WXoyZytBSEFSM1cxTXJDMWJ4?=
 =?utf-8?B?ZWJhQjNhcTNIM2hQNE14aDVnT0p5TWRiUTZrQVdFblBaZEQ2L2F5SFZ6bWI2?=
 =?utf-8?B?dUJXUkFCbTdHcEN6WVZhbW5uZnpWZEx4aGpQTmRLbXUrTVV2VC9JWXBnbVRj?=
 =?utf-8?Q?e77uCR0PnWUmv5P?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44a9b4c-f2cc-480e-deda-08dac8b88f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 16:27:03.1546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zk2bxI2j/rlVlNYQ4HJcDrjC01LbU187VAu4RW22DPODzlnj1jMAQcmXOv2k51C6osgMTBnO9whnfxgfUWtAzq4lTMeXHY1knoiEFycHY/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5970

T24gMTcvMTEvMjAyMiAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjExLjIwMjIg
MDI6MDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBFeGVyY2lzZSBzb21lIGJhc2ljIGZ1bmN0
aW9uYWxpdHkgb2YgdGhlIG5ldw0KPj4geGNfe2dldCxzZXR9X3BhZ2luZ19tZW1wb29sX3NpemUo
KSBoeXBlcmNhbGxzLg0KPj4NCj4+IFRoaXMgcGFzc2VzIG9uIHg4NiwgYnV0IGZhaWxzIGN1cnJl
bnRseSBvbiBBUk0uICBBUk0gd2lsbCBiZSBmaXhlZCB1cCBpbg0KPj4gZnV0dXJlIHBhdGNoZXMu
DQo+Pg0KPj4gVGhpcyBpcyBwYXJ0IG9mIFhTQS00MDkgLyBDVkUtMjAyMi0zMzc0Ny4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPj4gUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0K
PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoN
Cj4gKGlmIHRoaXMgY291bnRzIGFueXRoaW5nLCBzaW5jZSBhcyBpdCBzdGFuZHMgdGhlIG5ldyBz
dHVmZiBhbGwgZmFsbHMNCj4gdW5kZXIgdG9vbCBzdGFjayBtYWludGFpbmVyc2hpcCkNCg0KSSBk
byBpbnRlbmQgdG8gZ2l2ZSBpdCBpdHMgb3duIHNlY3Rpb24gaW4gZHVlIGNvdXJzZSwgYnV0IHRo
aXMgZmFsbHMNCnZlcnkgbXVjaCBpbnRvICJUaGUgUmVzdCIgYXQgdGhlIG1vbWVudC4NCg0KPj4g
LS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvdG9vbHMvdGVzdHMvcGFnaW5nLW1lbXBvb2wvdGVzdC1w
YWdpbmctbWVtcG9vbC5jDQo+PiBAQCAtMCwwICsxLDE4MSBAQA0KPj4gKyNpbmNsdWRlIDxlcnIu
aD4NCj4+ICsjaW5jbHVkZSA8ZXJybm8uaD4NCj4+ICsjaW5jbHVkZSA8aW50dHlwZXMuaD4NCj4+
ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+PiArI2luY2x1
ZGUgPHN5cy9tbWFuLmg+DQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbmN0cmwuaD4NCj4+ICsjaW5j
bHVkZSA8eGVuZm9yZWlnbm1lbW9yeS5oPg0KPj4gKyNpbmNsdWRlIDx4ZW5nbnR0YWIuaD4NCj4+
ICsjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4NCj4+ICsNCj4+ICtzdGF0aWMgdW5zaWduZWQg
aW50IG5yX2ZhaWx1cmVzOw0KPj4gKyNkZWZpbmUgZmFpbChmbXQsIC4uLikgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcDQo+PiArICAgIG5yX2ZhaWx1cmVzKys7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPj4gKyAgICAodm9pZClwcmludGYoZm10LCAjI19fVkFfQVJHU19fKTsgICAg
ICAgICAgIFwNCj4+ICt9KQ0KPj4gKw0KPj4gK3N0YXRpYyB4Y19pbnRlcmZhY2UgKnhjaDsNCj4+
ICtzdGF0aWMgdWludDMyX3QgZG9taWQ7DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCB4ZW5fZG9t
Y3RsX2NyZWF0ZWRvbWFpbiBjcmVhdGUgPSB7DQo+PiArICAgIC5mbGFncyA9IFhFTl9ET01DVExf
Q0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcCwNCj4gSSB1bmRlcnN0YW5kIHRoYXQgaXQgaXMg
YWNjZXB0ZWQgdGhhdCB0aGlzIHRlc3Qgd2lsbCB0aHVzIGZhaWwgd2hlbiBydW4NCj4gb24gSEFQ
LWluY2FwYWJsZSBoYXJkd2FyZSAoaW5jbHVkaW5nIHdoZW4gcnVuIHdpdGggWGVuIGl0c2VsZiBy
dW5uaW5nIG9uDQo+IHRvcCBvZiBhbm90aGVyIGh5cGVydmlzb3Igbm90IHN1cmZhY2luZyBIQVAg
Y2FwYWJpbGl0aWVzKT8gT2gsIEkgbm90aWNlDQo+IHlvdSdyZSBhY3R1YWxseSB0cmFuc2xhdGlu
ZyBFSU5WQUwgYW5kIEVPUE5PVFNVUFAgZmFpbHVyZXMgaW50byAic2tpcCIuDQo+IFRoYXQnbGwg
cHJvYmFibHkgZG8sIGFsYmVpdCBwZXJzb25hbGx5IEkgY29uc2lkZXIgc2tpcHBpbmcgd2hlbiBF
SU5WQUwNCj4gKHdoaWNoIHdlIHVzZSBhbGwgb3ZlciB0aGUgcGxhY2UpIGFzIGEgb3Zlcmx5IHJl
bGF4ZWQuDQoNCkNoZWNraW5nIGNhcGFiaWxpdGllcyBuZWVkcyB0byBoYXBwZW4gYW55d2F5IHRv
IGdldCBQViBhbmQgSFZNIFNoYWRvdw0Kc3VwcG9ydCB3b3JraW5nLg0KDQpCdXQgdGhpcyB3aWxs
IGRvIGZvciBub3cuDQoNCj4+ICtzdGF0aWMgdm9pZCBydW5fdGVzdHModm9pZCkNCj4+ICt7DQo+
PiArICAgIHhlbl9wZm5fdCBwaHlzbWFwW10gPSB7IDAgfTsNCj4gSSBoYXZlIHRvIGFkbWl0IHRo
YXQgSSdtIHVuY2VydGFpbiB3aGV0aGVyIEFybSAob3Igb3RoZXIgYXJjaGl0ZWN0dXJlcw0KPiB0
aGF0IFhlbiBpcyBiZWluZyBwbGFubmVkIHRvIGJlIHBvcnRlZCB0bykgaGF2ZSBjb25zdHJhaW50
cyB3aGljaCBtYXkNCj4gY2F1c2UgcG9wdWxhdGluZyBvZiBHRk4gMCB0byBmYWlsLg0KDQpNZWNo
YW5pY2FsbHksIG5vLsKgIHg4NiBQViBpcyBhbiBlbnRpcmVseSBhcmJpdHJhcnkgbWFwcGluZywg
d2hpbGUgYWxsDQpIVk0gbW9kZXMgKHg4NiBhbmQgQVJNKSBhcmUganVzdCBmaWxsaW5nIGluIGEg
Z3Vlc3QgcGh5c2ljYWwgLT4gInNvbWUNClJBTSIgbWFwcGluZyBpbiBhIHBhZ2V0YWJsZSBzdHJ1
Y3R1cmUuDQoNCkxvZ2ljYWxseSwgSSBob3BlIHRoYXQgQ0RGX2RpcmVjdG1hcCBvbiBBUk0gY2hl
Y2tzIGZvciBhbiBhbGlhcyB0byBhDQpyZWFsIFJBTSBibG9jaywgYnV0IHRoaXMgY2FwYWJpbGl0
eSBpc24ndCBldmVuIGV4cG9zZWQgdG8gdGhlIHRvb2xzdGFjay4NCg0KDQpBbmQgbm93IEkndmUg
bG9va2VkIGF0IHRoaXMsIGV3d3d3LsKgIFdlJ3ZlIGdvdDoNCg0KZC0+b3B0aW9ucyB3aGljaCBo
b2xkcyBjb25maWctPmZsYWdzLCBET01DVExfQ0RGXyoNCmQtPmNkZiB3aGljaCBob2xkcyB0aGUg
bG9jYWwgJ2ZsYWdzJyBwYXJhbWV0ZXIsIENGRF8qDQpkLT5pc19wcml2aWxlZ2VkIHdoaWNoIGhv
bGRzICdmbGFncyAmIENERl9wcml2aWxlZ2VkJyBhbmQgd2FzIG5ldmVyDQpjbGVhbmVkIHVwIHdo
ZW4gZC0+Y2RmIHdhcyBpbnRyb2R1Y2VkLg0KDQpUaGlzIGlzIHVubmVjZXNzYXJpbHkgY29uZnVz
aW5nIHRvIGZvbGxvdy7CoCBZZXQgbW9yZSBmb3IgdGhlIGNsZWFudXAgcGlsZS4NCg0KPj4gKyAg
ICB1aW50NjRfdCBzaXplX2J5dGVzLCBvbGRfc2l6ZV9ieXRlczsNCj4+ICsgICAgaW50IHJjOw0K
Pj4gKw0KPj4gKyAgICBwcmludGYoIlRlc3QgZGVmYXVsdCBtZW1wb29sIHNpemVcbiIpOw0KPj4g
Kw0KPj4gKyAgICByYyA9IHhjX2dldF9wYWdpbmdfbWVtcG9vbF9zaXplKHhjaCwgZG9taWQsICZz
aXplX2J5dGVzKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICByZXR1cm4gZmFpbCgi
ICBGYWlsOiBnZXQgbWVtcG9vbCBzaXplOiAlZCAtICVzXG4iLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7DQo+PiArDQo+PiArICAgIHByaW50ZigibWVt
cG9vbCBzaXplICUiUFJJdTY0IiBieXRlcyAoJSJQUkl1NjQia0IsICUiUFJJdTY0Ik1CKVxuIiwN
Cj4+ICsgICAgICAgICAgIHNpemVfYnl0ZXMsIHNpemVfYnl0ZXMgPj4gMTAsIHNpemVfYnl0ZXMg
Pj4gMjApOw0KPj4gKw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBDaGVjayB0aGF0IHRo
ZSBkb21haW4gaGFzIHRoZSBleHBlY3RlZCBkZWZhdWx0IGFsbG9jYXRpb24gc2l6ZS4gIFRoaXMN
Cj4+ICsgICAgICogd2lsbCBmYWlsIGlmIHRoZSBsb2dpYyBpbiBYZW4gaXMgYWx0ZXJlZCB3aXRo
b3V0IGFuIGVxdWl2ZWxlbnQNCj4gTml0OiBlcXVpdmFsZW50DQoNCkZpeGVkLg0KDQo+DQo+PiAr
ICAgICAqIGFkanVzdG1lbnQgaGVyZS4NCj4+ICsgICAgICovDQo+PiArICAgIGlmICggc2l6ZV9i
eXRlcyAhPSBkZWZhdWx0X21lbXBvb2xfc2l6ZV9ieXRlcyApDQo+PiArICAgICAgICByZXR1cm4g
ZmFpbCgiICBGYWlsOiBzaXplICUiUFJJdTY0IiAhPSBleHBlY3RlZCBzaXplICUiUFJJdTY0Ilxu
IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgIHNpemVfYnl0ZXMsIGRlZmF1bHRfbWVtcG9vbF9z
aXplX2J5dGVzKTsNCj4+ICsNCj4+ICsNCj4+ICsgICAgcHJpbnRmKCJUZXN0IHRoYXQgYWxsb2Nh
dGUgZG9lc24ndCBhbHRlciBwb29sIHNpemVcbiIpOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAg
ICAgKiBQb3B1bGF0ZSB0aGUgZG9tYWluIHdpdGggc29tZSBSQU0uICBUaGlzIHdpbGwgY2F1c2Ug
bW9yZSBvZiB0aGUgbWVtcG9vbA0KPj4gKyAgICAgKiB0byBiZSB1c2VkLg0KPj4gKyAgICAgKi8N
Cj4+ICsgICAgb2xkX3NpemVfYnl0ZXMgPSBzaXplX2J5dGVzOw0KPj4gKw0KPj4gKyAgICByYyA9
IHhjX2RvbWFpbl9zZXRtYXhtZW0oeGNoLCBkb21pZCwgLTEpOw0KPj4gKyAgICBpZiAoIHJjICkN
Cj4+ICsgICAgICAgIHJldHVybiBmYWlsKCIgIEZhaWw6IHNldG1heG1lbTogOiAlZCAtICVzXG4i
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7DQo+PiAr
DQo+PiArICAgIHJjID0geGNfZG9tYWluX3BvcHVsYXRlX3BoeXNtYXBfZXhhY3QoeGNoLCBkb21p
ZCwgMSwgMCwgMCwgcGh5c21hcCk7DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgcmV0
dXJuIGZhaWwoIiAgRmFpbDogcG9wdWxhdGUgcGh5c21hcDogJWQgLSAlc1xuIiwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgIGVycm5vLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKw0KPj4gKyAgICAv
Kg0KPj4gKyAgICAgKiBSZS1nZXQgdGhlIHAybSBzaXplLiAgU2hvdWxkIG5vdCBoYXZlIGNoYW5n
ZWQgYXMgYSBjb25zZXF1ZW5jZSBvZg0KPj4gKyAgICAgKiBwb3B1bGF0ZSBwaHlzbWFwLg0KPj4g
KyAgICAgKi8NCj4+ICsgICAgcmMgPSB4Y19nZXRfcGFnaW5nX21lbXBvb2xfc2l6ZSh4Y2gsIGRv
bWlkLCAmc2l6ZV9ieXRlcyk7DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgcmV0dXJu
IGZhaWwoIiAgRmFpbDogZ2V0IG1lbXBvb2wgc2l6ZTogJWQgLSAlc1xuIiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgIGVycm5vLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKw0KPj4gKyAgICBpZiAo
IG9sZF9zaXplX2J5dGVzICE9IHNpemVfYnl0ZXMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGZhaWwo
IiAgRmFpbDogbWVtcG9vbCBzaXplIGNoYW5nZWQgJSJQUkl1NjQiID0+ICUiUFJJdTY0IlxuIiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgIG9sZF9zaXplX2J5dGVzLCBzaXplX2J5dGVzKTsNCj4+
ICsNCj4+ICsNCj4+ICsNCj4+ICsgICAgcHJpbnRmKCJUZXN0IGJhZCBzZXQgc2l6ZVxuIik7DQo+
PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIENoZWNrIHRoYXQgc2V0dGluZyBhIG5vbi1wYWdl
IHNpemUgcmVzdWx0cyBpbiBmYWlsdXJlLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgcmMgPSB4Y19z
ZXRfcGFnaW5nX21lbXBvb2xfc2l6ZSh4Y2gsIGRvbWlkLCBzaXplX2J5dGVzICsgMSk7DQo+PiAr
ICAgIGlmICggcmMgIT0gLTEgfHwgZXJybm8gIT0gRUlOVkFMICkNCj4+ICsgICAgICAgIHJldHVy
biBmYWlsKCIgIEZhaWw6IEJhZCBzZXQgc2l6ZTogZXhwZWN0ZWQgLTEvRUlOVkFMLCBnb3QgJWQv
JWQgLSAlc1xuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgIHJjLCBlcnJubywgc3RyZXJyb3Io
ZXJybm8pKTsNCj4+ICsNCj4+ICsNCj4+ICsgICAgcHJpbnRmKCJUZXN0IHZlcnkgbGFyZ2Ugc2V0
IHNpemVcbiIpOw0KPiBNYXliZSBkcm9wICJ2ZXJ5IiwgYXMgNjRNIGlzbid0IGFsbCB0aGF0IG11
Y2ggKGFuZCB3b3VsZCwgaW4gcGFydGljdWxhciwNCj4gbm90IGV4cG9zZSBhbnkgMzItYml0IHRy
dW5jYXRpb24gaXNzdWVzKT8NCg0KSG1tIHllYWguwqAgVGhhdCB3YXMgcmF0aGVyIHN0YWxlLg0K
DQpJJ3ZlIHN3aXRjaGVkIHRvICJUZXN0IHNldCBjb250aW51YXRpb25cbiIgc2VlaW5nIGFzIHRo
YXQncyB0aGUgcHVycG9zZQ0Kb2YgdGhlIHRlc3QuwqAgNjRNIGlzIGFuIGludGVybmFsIGRldGFp
bCB3aGljaCBvdWdodCB0byBiZSBzbWFsbCBlbm91Z2gNCnRvIHdvcmsgcmVsaWFibHkgZXZlcnl3
aGVyZSwgYnV0IGxhcmdlIGVub3VnaCB0byBjYXVzZSBhIGNvbnRpbnVhdGlvbi4NCg0KfkFuZHJl
dw0K

