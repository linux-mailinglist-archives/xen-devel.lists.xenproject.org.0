Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C160716E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 09:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427389.676391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmnR-0007r1-Qt; Fri, 21 Oct 2022 07:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427389.676391; Fri, 21 Oct 2022 07:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmnR-0007oN-OC; Fri, 21 Oct 2022 07:50:25 +0000
Received: by outflank-mailman (input) for mailman id 427389;
 Fri, 21 Oct 2022 07:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chjt=2W=citrix.com=prvs=286a1e6c2=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1olmnQ-0007oF-De
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 07:50:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02aabf47-5115-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 09:50:22 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 03:50:19 -0400
Received: from BL0PR03MB4161.namprd03.prod.outlook.com (2603:10b6:208:6e::27)
 by SN4PR03MB6750.namprd03.prod.outlook.com (2603:10b6:806:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Fri, 21 Oct
 2022 07:50:17 +0000
Received: from BL0PR03MB4161.namprd03.prod.outlook.com
 ([fe80::f917:c565:10a9:e14c]) by BL0PR03MB4161.namprd03.prod.outlook.com
 ([fe80::f917:c565:10a9:e14c%7]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 07:50:17 +0000
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
X-Inumbo-ID: 02aabf47-5115-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666338622;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HaPfP+NZXDV0k3oeQwlzMMBo3EA5m69EX33dDOguIbE=;
  b=DlqtV3OWQa39npAoP4XnzQe4ciKg4l/szKcdqStvSuqDNNMaBFCX+Hkb
   d6glfs/NPcQ38TbzHSXSEDXJ9UAbuPL2SDk/DsBEsdwUFe9eb8qzpdPFN
   rk/mNB45BKw3/VcF6eIyvPl2Klf3gNPgzI6uUpKOJsa7zorr/4UT3nLch
   8=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 83213623
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PWcbq6my82r/A8PFdJqmyrXo5gyzJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXmGBaf2INGD3LtpxYNi+9hkCvcDdzIVkQQdopCk8RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfK0ges
 tIqGT82Tj+olfC3+Y2Wcc5Xr5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFMZPLvFabI5fvSBRd9UhVqZr
 2SA+2X/DhAVHNee1SCE4jSngeqncSbTCNlITebmrKUCbFu7w2o9ARcITASHj/iwyRWBac8cB
 E0uw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMM/WzECz
 FKCmNLtQzt1v9W9Vna15rqS6zSoNkA9DWIEfz5CcgID7PHquoR1hRXKJuuPC4awh9zxXDTvm
 TaDqXFmg61J1JZUkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshTZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:2InL2qugY/CABeMh5izPl+Gr7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208";a="83213623"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa/6jgqutBpMlk7WRmKolUsDFeu0vDhSAlLc+YCMzeslhlsD5qSsJFV+qzohmG9wkWxsObzW94HkPC96ZzMV5Ao+comWg97HT9BYX0K8Q//BkBpnsxmxNHwKkZuIOIfIoigp3ZtHnFOjMbCpnoWHhhaOGT+svr+k+h2fRzA93/X4kpTigzoqZz4QhB1k7lzRiTQzFVEYTbM9kLcoSsQZ8NwSMl2dUPTlkr4/JbDYCPlqxHEdLpSU3Hdm9KD+0CCltvR7lsPyP8SKu/szIDFKa9p0bTgp6AeSwGldQhu7t+rn1YB2iCxQzR1C0dLF35A4eg8TLdyPEBJqEvgnSyCb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaPfP+NZXDV0k3oeQwlzMMBo3EA5m69EX33dDOguIbE=;
 b=ctxkSIBv893ODW2qRErPiHbyYBqOEz11HTzugQLiEqxaIm3Fj37kddA4b89ZoaWicq2tVc9YQ+WLmrvY2eVznbsT1nw0J/rwEIyFU4n6p5wAFqzvrX2gswnrGfXLg35ndRqqh9wTqTmmThRt2bqnnffTnK3Gc/kJ4cQDWERTdiPpiHbaiPWKWuo2aoopX4UYTrPi8yx7W20pLgBD7V+2mAlic80gkAonojbre8jhGMGU/7/TZPjdOpCSRM8mLdstAGTv9QiwIvOH23j/RhQNuWKvHMyhZFFcx/KakzUMkrA+8Qqg11MAPzVOY5Ed1fAJ6O10vhgOinBOOWXTZlV2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaPfP+NZXDV0k3oeQwlzMMBo3EA5m69EX33dDOguIbE=;
 b=Z0bJT0iNV5V3oDZTVrRSPbaLLvwcTYftwscWrfqQc2Wsd88Ml215kMmnPYEzZKmMKCC7yS3WDdjnMlDIoBd74RRH/3BOGalAnhL3EDTJN16JzImhKV4XTbB9deVp9mTMzDL2yPVr2J+8fOD9mFINHm91fgDabDsuLZCfFyNXTMA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.17] tools/ocaml/xenstored: fix live update exception
Thread-Topic: [PATCH for-4.17] tools/ocaml/xenstored: fix live update
 exception
Thread-Index: AQHY5KTJYQJiWLa1lkaa66iTW6pU/q4YejoA
Date: Fri, 21 Oct 2022 07:50:16 +0000
Message-ID: <B49FE4B3-77B1-4525-A6B8-C7CCA83CBC48@citrix.com>
References:
 <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
In-Reply-To:
 <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR03MB4161:EE_|SN4PR03MB6750:EE_
x-ms-office365-filtering-correlation-id: 4cb54149-1fe8-43ad-773f-08dab338e516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vICRyakRQWJadb3uFU3IBWiHtNvLXDMNZvBYRt+YFH5N3pVEtgnO++cXWo57pp9QBGef4+K2tQg+IBUDz5UXCS0sF4QiwLbdU7OFcagS49YmtdbJKW6h5xQgmTla7E3xMIIvrTJ2eulIsrygrhaIOcMxBuYpR5urmtrJHl4+WPr9Ryq09htpLA92tVDwCRVUd/bRZ9zRsDX11fx4uyTrKsooHTqOGtja1hh71vNxar5uePKKTMiUpfEwuA1ifveU4JHujL7EYzpBeEUSIOTebinpYVh0OjysBvkib2WFk+6nIdnYh4axc6aMqUY2CzU4rroyJpf/nOz/Kw48p5ftx+TDrftyNDSHwUAPJtC8wMhi40TTcV3rcV4V6E4rOS9PDj1LwQ6vsFdLz9u/DAybQxq0o7aeRx9Y5ZZIMrA4sSRovbw8U28XmvnvfFevxXf2+yntloMOwpwcANC57/InfpKlX5+MLK39FuBGVwy9fX1ebLCwoaKrX4PUVb+xuT/bqGkqSP62T1Vod3uNSC8Xp6FN7YrzFMR45Uj80frp+YFZx0ssKFaHW+WBVK7wpTu6DwjDo4MDfipg2LnDChUt2NrHaE5SDb7BkAPwau5fIGi1xojRaIWeU2+PgVxPH1Vs+nJdRnJJTTwHqikapkRJKMUfsKCSq7lT+1RLuMR+9wEBc4IAlztBzJ8ZT4TPcb0DuwIeXPmCFqkzmQBHHNoajKiss7IRk7hW2Nn2E8hjvakweUHaRSKLmsEjwbD2HdztGX7/FvHfLPm9umPCTNosCv0/Kodt9xWkEM4+fYvpRCk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR03MB4161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(66574015)(36756003)(38070700005)(83380400001)(86362001)(33656002)(107886003)(38100700002)(122000001)(91956017)(82960400001)(66946007)(6636002)(64756008)(66476007)(66556008)(44832011)(15650500001)(37006003)(2616005)(5660300002)(54906003)(8676002)(316002)(66446008)(6862004)(6486002)(186003)(71200400001)(2906002)(478600001)(8936002)(4326008)(53546011)(6512007)(76116006)(26005)(41300700001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1JlcTJPWnJyNnhCUThWSUVSSmdpbkNnd3hUWHNhNjNjeXhiaVhiRG02NXBK?=
 =?utf-8?B?ZDFnMnpsUlN5c2grZGp6UHRIbFd1UlRma0N2ZGsxOUJ2emZZNXdKREFiSmlq?=
 =?utf-8?B?d2pDZ1lOTmdYWVVDVHBNSDdTTytKYVNQZ2NFV2g3YnZJN0R0WldLV0s2NE1U?=
 =?utf-8?B?ZXN3N0ZXeVJ6bmo1WWlCR21kL1lnbDRXYi9QUlZ1T2RBUEZhclZXTXNmbnlN?=
 =?utf-8?B?UHNYRmVsQUVWUnB6Y1FzMnl0bTJkOXVIck1ISVE1NkcwMzcyZGhpZUd5dnVn?=
 =?utf-8?B?MGdIblNVWWdrS3pFUXByeTJEazVmZC9nTUpudWVZNlU5UFc4UmxBS3psR0Rk?=
 =?utf-8?B?MXhvK1JNNXoxN3Q1WVlKQm42eitjd3YzSjNCU0pBaitVN3Rwbm1FSnBpdnBO?=
 =?utf-8?B?NjZySUtqYVV3WDdFTjBMTksvT0dROXJOd3c0R2dyMGowLyswUVJkSmdLSHRR?=
 =?utf-8?B?eldKUi9HU1hGdzVWV0RiRFByd005WWVGM3YyWGZLYmh6bkt3cVRNb0RoMFQ2?=
 =?utf-8?B?ZmZsdjdpblZTRUd4OG5vVGtVTk1GbVRJWnNZbDhPMUNXUWNQdUhvZUFRSDJ6?=
 =?utf-8?B?T1RsU0RtZUNHYnJKVm8vMjNPQ3pHdHMzT0lNd0Z5M3NSN1daYjM4TWloSm4w?=
 =?utf-8?B?Vy9KU3E1dkozc05SUjNoR0svZTRmRHdBUFRoZmJBb0ZCYXFMR0ZEQ3M5dG9m?=
 =?utf-8?B?eStGNTRvVSsweUJZR0RJMVl0c3NBNytLM0dsV0I5VEJQV3gwYkhCeUxINjhM?=
 =?utf-8?B?UGdpWlpLUU5Bc2RyN3NtaGo3ZDRJRzVibWJrMnFTWlFoRFZsSC9UY2R0aXQ3?=
 =?utf-8?B?cFBjRnRRbTl5akw0ZHd6RHN3clJGb0I1MldqVGcvdEF4MHBHdDkvcDJwN3Iw?=
 =?utf-8?B?UDhMVVQ3YXJKN05xRjdoeVV1Z2Z0NDcyYStQYTA0UkxvNnk3c0VLYjBCUjRa?=
 =?utf-8?B?ZXlHdjgwckpSeWhDZjlZRnJGNE5GYUNhWXJDQnhPbFdhYk0rZnY2VlFmZmsz?=
 =?utf-8?B?Q3ZIUlBkYmgyQnBWcWd1aHZ3LzU5a0JRTGgrL2dQemE1alNaajFaU0xBaXVw?=
 =?utf-8?B?SkVkZWlzMlZlMkVJY3FlVDhLYjZqTkdreTMxc3FxUnJMaWtpRXV2R2NtZ1kv?=
 =?utf-8?B?OVdpZXpKUW51U3kzUU51eTFvTE5nUWx6eUF1NHQ3WXNzd1c4RjQ5T1c4eCtt?=
 =?utf-8?B?NTdWZ3hIQm1wQkhVK1FaZWdsakJaV2pZMStDUkxhL3RkNEZPWkNoU2xCZlBu?=
 =?utf-8?B?UjJkNzVwTmRHcSttWTl3VUpZMEhIdFRhanpQT3I2V0dITXRhVEJnelc2c08w?=
 =?utf-8?B?S0RXTU9DQnVPcXNieTlOekcybWRaMmI3cUwxbmdoV01BNUxZU25OU2tvSTds?=
 =?utf-8?B?VWJJazZuVW9sdU0ydWVMNXh3ejV2Zk90N0xrSEczZjRwQ0orT2Y3NExSUm1i?=
 =?utf-8?B?WmdVV20vVkNCT2pvOGtIWERqRWRiM3B0M21HZklaMHdTM0trblJlejN1TlI2?=
 =?utf-8?B?RnRIZkJ6OWlhejBYOHlFMERCb2tTMVhFUUVVTm5idlBSQ0xGRTJ5UzhXQWI5?=
 =?utf-8?B?VWF2OU1Ib3dLSmdDQXBad3ZHZXpibGV4N01BcEU0cDM4VWdpZVhrNHk2TUxE?=
 =?utf-8?B?UldMT1dhUS9UU3FhWHdOdWJGeklUb1ZTc2xXMkNpVFczUndESENXdEhERmZs?=
 =?utf-8?B?OEgzc2RWK0VPSjFyV2lmNTFPeWNhaXBIZlZyUDhLR0Y5Q3B3SlpkRGhtQ1BN?=
 =?utf-8?B?OVE3aFZVeWo0NTJqZVZsdUxESXFiVkpQTENRL3ZzcWVyVGZrSkdzZ3JLa3dl?=
 =?utf-8?B?QUc4NFppSWhyOVVlZWMxamdPQzNHNnFORTcxZEVPaXRtNUU5TklFVUlzY09U?=
 =?utf-8?B?RWNxNEt2ajNJUW9vdzJ0NkVIRjlicytRTktxRG1rSEthYnF0N3BkZ1FZT0lH?=
 =?utf-8?B?djlYeGJGUktDcTNsZm15QkRFMi9DTmc2UzU0T0h5cmV4UXdHcVYrTGRTOWNZ?=
 =?utf-8?B?aG1PZEFmTER1WFhjWTFidjFMbS9kcEI2aDcyTzh4NE1hNWRSTVB0bXZHbGNi?=
 =?utf-8?B?aEcwWGlmRUZ4aWJYVFVOWDdQd0dxVkQ5SmhzOUhrcDF3eHJCMEh2NzBrSk40?=
 =?utf-8?B?akJDMkw3QUl6MkphYWdjN1hOZkYyVndwSkI4emFiVm9uQzJORFdPMnFPV2Va?=
 =?utf-8?Q?O4uFCWJ15rUrNJzbxl7p/So=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB7B4CEAEE026F44975B20025FCCE908@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR03MB4161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb54149-1fe8-43ad-773f-08dab338e516
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 07:50:16.9185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0LiMuCISVY5TOjlKbUmtjWL600bxImu2b7abJ4qUkQ+PtoCVnI+d1vrSW86FyQTXDBn41f08GFmc9d2+4D77QnF75KgAQtC0vBDPgtNeNLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6750

DQoNCj4gT24gMjAgT2N0IDIwMjIsIGF0IDE3OjU0LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IER1cmluZyBsaXZlIHVwZGF0ZSB3ZSB3aWxsIGxv
YWQgdGhlIC90b29sL3hlbnN0b3JlZCBwYXRoIGZyb20gdGhlIHByZXZpb3VzIGJpbmFyeSwNCj4g
YW5kIHRoZW4gdHJ5IHRvIG1rZGlyIC90b29sIGFnYWluIHdoaWNoIHdpbGwgZmFpbCB3aXRoIEVF
WElTVC4NCj4gQ2hlY2sgZm9yIGV4aXN0ZW5jZSBvZiB0aGUgcGF0aCBiZWZvcmUgY3JlYXRpbmcg
aXQuDQo+IA0KPiBUaGUgd3JpdGUgY2FsbCB0byAvdG9vbC94ZW5zdG9yZWQgc2hvdWxkIG5vdCBu
ZWVkIGFueSBjaGFuZ2VzDQo+IChhbmQgd2UgZG8gd2FudCB0byBvdmVyd3JpdGUgYW55IHByZXZp
b3VzIHBhdGgsIGluIGNhc2UgaXQgY2hhbmdlZCkuDQo+IA0KPiBQcmlvciB0byA3MTEwMTkyYjFk
ZjYgbGl2ZSB1cGRhdGUgd291bGQgd29yayBvbmx5IGlmIHRoZSBiaW5hcnkgcGF0aCB3YXMNCj4g
c3BlY2lmaWVkLCBhbmQgd2l0aCA3MTEwMTkyYjFkZjYgYW5kIHRoaXMgbGl2ZSB1cGRhdGUgYWxz
byB3b3JrcyB3aGVuDQo+IG5vIGJpbmFyeSBwYXRoIGlzIHNwZWNpZmllZCBpbiBgeGVuc3RvcmUt
Y29udHJvbCBsaXZlLXVwZGF0ZWAuDQo+IA0KPiBGaXhlczogNzExMDE5MmIxZGY2ICgidG9vbHMv
b3hlbnN0b3JlZDogRml4IE94ZW5zdG9yZWQgTGl2ZSBVcGRhdGUiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiAtLS0NCj4gdG9vbHMv
b2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbCB8IDQgKysrLQ0KPiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
b2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5z
dG9yZWQubWwNCj4gaW5kZXggZmM5MGZjZGViNS4uMzI5OWZlNzNmNyAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbA0KPiArKysgYi90b29scy9vY2FtbC94
ZW5zdG9yZWQveGVuc3RvcmVkLm1sDQo+IEBAIC0zNTMsNyArMzUzLDkgQEAgbGV0IF8gPQ0KPiAJ
KSBpbg0KPiANCj4gCSgqIHJlcXVpcmVkIGZvciB4ZW5zdG9yZS1jb250cm9sIHRvIGRldGVjdCBh
dmFpbGFiaWxpdHkgb2YgbGl2ZS11cGRhdGUgKikNCj4gLQlTdG9yZS5ta2RpciBzdG9yZSBQZXJt
cy5Db25uZWN0aW9uLmZ1bGxfcmlnaHRzIChTdG9yZS5QYXRoLm9mX3N0cmluZyAiL3Rvb2wiKTsN
Cj4gKwlsZXQgdG9vbF9wYXRoID0gU3RvcmUuUGF0aC5vZl9zdHJpbmcgIi90b29sIiBpbg0KPiAr
CWlmIG5vdCAoU3RvcmUucGF0aF9leGlzdHMgc3RvcmUgdG9vbF9wYXRoKSB0aGVuDQo+ICsJCQkJ
CVN0b3JlLm1rZGlyIHN0b3JlIFBlcm1zLkNvbm5lY3Rpb24uZnVsbF9yaWdodHMgdG9vbF9wYXRo
Ow0KPiAJU3RvcmUud3JpdGUgc3RvcmUgUGVybXMuQ29ubmVjdGlvbi5mdWxsX3JpZ2h0cw0KPiAJ
CShTdG9yZS5QYXRoLm9mX3N0cmluZyAiL3Rvb2wveGVuc3RvcmVkIikgU3lzLmV4ZWN1dGFibGVf
bmFtZTsNCg0KSSBub3RpY2UgaW5jb25zaXN0ZW50IGluZGVudGF0aW9uIGJ1dCBsZXQncyBpZ25v
cmUgdGhhdCBvciBmaXggaXQgYmVmb3JlIHRoZSBjb21taXR0aW5nLg0KDQpBY2tlZC1ieTogQ2hy
aXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KDQo=

