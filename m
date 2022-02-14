Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C534B5343
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272341.467151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcJ9-0002v4-Hk; Mon, 14 Feb 2022 14:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272341.467151; Mon, 14 Feb 2022 14:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcJ9-0002s4-ET; Mon, 14 Feb 2022 14:26:27 +0000
Received: by outflank-mailman (input) for mailman id 272341;
 Mon, 14 Feb 2022 14:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJcJ7-0002Vp-Ix
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:26:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 156a2b21-8da2-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:26:24 +0100 (CET)
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
X-Inumbo-ID: 156a2b21-8da2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644848784;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=MumfUcd9JlwlU0tR66LjJ8OPcnkedrNNEXrmVPsYYjI=;
  b=AS1aWh0Ux+l4kALiZLQbuDV4NzLr/jl7HSTwlxjT6xxpYeD2B5SuVQEA
   w9tLxn9w5ciJe7XyE93AjcrcY+K+RsVm5dg72hhuzV3wmp8XOF6fzqIAK
   xFZ1y295u8/BkH83CR74j0EMEAaMrODWdFXk6NRxrFGOOZS1/57otSYVf
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 813hHJokbSRqHTfh8EeEciEKZA6EPn1V33YbsR1rGXlIfSf5Fa1CpwMFNLLyFyduRKAnlH25dw
 AddyKHruvnYjWs5Hjq4SQTybDsiNZRVMafAQF5bDomne0Wz/pVQBg37IlONdOJY850RaCBoeZq
 SajDUtuHmhn0J94eT34jVX4iiG1vwY4iBRSoX6fIgKVenhmIp9PRC6zRX8hPx66PS5jM/zznua
 JJm1E5hCl4r2hmNxH+oQNjzCVRfhFZREL97TeB2KOW5ZljCNoBNFfdqPJFikheDnhS9yyYBES1
 brEJvEfY5LPqi01GYb4OTrhQ
X-SBRS: 5.1
X-MesageID: 64561964
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hSQgVa/DSkhzkHmbxHjHDrUDxXiTJUtcMsCJ2f8bNWPdYAuX7wSz/
 BJcAD7Ya7vPIDfrKpolWDmFhRsE656Ex9U3TlBv+Sg0Q38VopLPD42QfxurYHzPd8eSF044s
 J5ON4bOJZk/EnPVrBrzbbbrpyYliqjXTOehU7es1kydPeNBYH5JZUVLx75p6mIRveWEPu+th
 T/Ti5GBYwCug28tYzxNsq6N+R1l5Kn8s21I4FdjNKwVsQODxiUZVJ4RG/q8fiDyKmV28k9WZ
 AphIJWRpD6xE8IFU4v9+lrDn8ljrof6ZWBisFIPM0SZqkUE9nxaPpoTbqJGMx8N0mnRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxQxF3fgnlbiB1IgkHK74SruWFlmjAbGgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wDd
 hJNq3RyxUQ03EGoCf/Cbi+bmXeJuzE9QtRbDMEC6SjYn8I45C7GXzNZH1atcucOq8seVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkRpB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B02nESoX1ohAdzC7PTH+A4z5DfNC1RKCE21r2/ed/M9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GptcIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgkzPyZ8PEi3ySDAdJ3T3
 r/BL66R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+tZbwveM71htfjeyOkwz
 zq4H5HUoyizrcWkOnWHmWLtBQxiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6dZKpvQWqwVElwqOV01NPHAkWCrTzz27SqmNCu5ejkvOZlmQg3C4Nj/eQXzsiIJC0KKWQEW+
 dVMDyvXHsgOQRpMFsHTZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OgMl6P8PfQLkUxkqY15F7o3n6sy68G2/+1Rzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXYOzbNtnkHVgdIBseQt6CjfxEyCPP6fkVIVnh4HMl9rSwTkgPbQKHjzZQLeUpPdp9k
 /shosMf9ye2lgEuboSdlilR+mmBci4AXqEgus1ICYPnkFN2mFRLYJiaAS7q+pCfLd5LNxByc
 DOTgaPDgZVax1bDLCVvRSScg7IFiMRcog1OwX8DO0+Ny4jMifIA1RFM9Sg6E1ZOxRJd3uMvY
 mVmOiWZ/0lVE+uEUCSbY12RJg==
IronPort-HdrOrdr: A9a23:2s7uIq+PVf6J4ske+X1uk+D9I+orL9Y04lQ7vn2ZLiYlCPBw9v
 re4cjzuiWE7wr5NEtQ/OxoW5PwIk80l6QFmLX5VI3KNGSL1wuVxa5ZnOnfKlbbakvDH4BmpM
 NdWpk7LJnVN3YSt62a3OHAeOxQuOVufMqT9JvjJyEHd3AQV4hQqzlCMEK6PyRNLmd7OaY=
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64561964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW3d8mX1OVNzZRYpUtWP3x0FOvDVwFKWaorasqiwlTsIFDm+h8zwHq0vGzAEXVbGCP9Z+RuSif67YPukN+Z2CbgVUKF9ITPOsuvtd0RXTLrRsk7xsjhP36ygj+tW3xEKXYCg4wRMK7oC+UnL3YJlOAebSvd4vaWd/lz0u2apx2Uhi0zC3UPMk7xz+LSEqxEDaLW1UCj59TAULE/4wfwwGJztXIsx5alV7ktvEvC/Wpnn+do6HrtMnQRYQJJrTbEXFtY6FjGjVQTiBF2WcBrjIucxHc4bQEKU6e+Ee/1WqXBPjM2SnaycP+F+UM9k33YMWYTEXNmm9VZB+aEPTkzURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLbeoozoNl88oHhTxblOUPVdiF+hItASCVrCU+5u7OI=;
 b=QdHBKXv8BaeVyfU9NIQvV3k8P1/tRRfxnzvZ+ntP78M3TQXkW/VjHez0ovBQ36iNpSiHJnwQq3KjLP/qiB5z4O025Nqy4cfLAsjx1fiaQe2sabdk6G6/QGRe0T+yxmNpz1JUSpDHLsWsbLcQs8vQ9MMrkg7K+7udFJiZrrOAVJwQHBBt0zVO7l48VIqbCT1nYt2Ek2GFQTY79BvjpnCNFoxbWpVcLHLBpjp9xwP32bb7Co/Rsv+P9HWZhqPQl1tk9WkIVbc33fxDT4Lu8ZQOwZkzs6fFUgTfLNo/lcYJ0Vj5j9wNeL1FFWeUVoCWiidjs/beJYYbXaQLI4pCLD429w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLbeoozoNl88oHhTxblOUPVdiF+hItASCVrCU+5u7OI=;
 b=F8dR05N+GC/5Rusoc+KGvx3JLGASd2xFXnbqvhITsD3tSyOI8DwaDop7jeauTkl/wcVqrmwJHKs2ZUjseUolr4kYfI9MGE8z2qa5n0U6+2Yu3e2QWhydFmOU8zI16arhBIZnibE1SieWeK8WwUkPBYieNGNHRhvnb+UnH1GJu0U=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 10/16] x86/P2M: p2m_get_page_from_gfn() is HVM-only
Thread-Topic: [PATCH 10/16] x86/P2M: p2m_get_page_from_gfn() is HVM-only
Thread-Index: AQHXcbhq/OSzA1CQ40KMLkP1JktxTKyUejaA
Date: Mon, 14 Feb 2022 14:26:18 +0000
Message-ID: <95D687BA-6640-4786-8B73-3FBDF782401F@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <06063948-65fb-1839-c10b-7cfb53d22b3b@suse.com>
In-Reply-To: <06063948-65fb-1839-c10b-7cfb53d22b3b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f749098c-1316-4756-43b1-08d9efc5f746
x-ms-traffictypediagnostic: BN7PR03MB4449:EE_
x-microsoft-antispam-prvs: <BN7PR03MB44494C4E670FB8D962A1BF9899339@BN7PR03MB4449.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GLYG9ixb38sJiprfcT0QyzILMsUp+oviEo8vFkvAXsf55suriTjeBquK2x7llLwLr1vBr/7rjecLEaiJCqy9dE0wKuAq09Z8lSt6aSLRa1GavKOnI/rfZjUvssJRFJ1sg5U2OI5XbD7agCp5OAhdqax/K10cgxXQbpO79AktR55Vezb6kLl14Ft0Xd+A1q8K1/0joYcbp0PCFZb3tpxvozuS+XBnK2hPXmyz4C5yl0ltjKF46CjEsjVJpRMFCwHrhq3l7K8lAMQRMpDFQiMknCJniALZ0AIA8eGj1K/tBpyhi9raAkRNCkIUrS+N+OmoJgD4GF3X3StQFM8f6sA8JaUNy/Et2iLqg/BdMs6brIU/aqVXNKt8iUSQbwmhtrQjiYfo20xl60XoVSjnsFSmlykVyvHFL6D8J+dGw6XZVMzFm0QMru9fMfPQCQL+t9KMW7JYCHRkkrJAnTgxjyknhRnP7+Z8qmLZQ2PHq8taRVYJ93ph1hgT0aqf7mPQJfuZffFvObxlkgZAlEEjLs5EqA0ysKitDjafuW5JFtJaV04/ZmwtYmHbA3Z/3pMJokW72VH7yXvUjqXqBupn9/33B3ImfBQTfRfjjcJAdNNyLPO3AfZtLB67bLXFG5ZXo2Zt7bPgk4eIHSUIsgO0zeEjcLFdBX122IsqekwlCo3tTyE5JPrgmIqUK4bzDy4H6fZcAjeXnZwhHqSLWHIgb0ZAmcD5viZTscquJUncUPyb6MAGqd5AZb89Vo4d4C0SP2RP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(99936003)(82960400001)(508600001)(107886003)(2616005)(6506007)(71200400001)(6486002)(53546011)(6512007)(26005)(186003)(91956017)(4326008)(8676002)(86362001)(66946007)(64756008)(66446008)(66476007)(76116006)(4744005)(66556008)(8936002)(5660300002)(33656002)(2906002)(36756003)(38070700005)(316002)(122000001)(54906003)(6916009)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WebAp/Ic+ucju928QHajo89M1avXMdSMl1kD2H9Co8fs8B5kogb0H0PZ1mGQ?=
 =?us-ascii?Q?QsqMm+ujaBYhSoZJE/Z1Xr29L4smUVKuHkFUWUVdAOrrHtKqyBnlgiPbYU+n?=
 =?us-ascii?Q?kBEGtbfxM8udELLYKBrHDSlhG3oPA339wDSt1uekc6UZfaHojg94YN0G29uI?=
 =?us-ascii?Q?x7tm4UP1ZSVEEDjU06NLvZCaIjTfJ5txN8vzj4FGX+aiAj/xvp/jXA6ntDuL?=
 =?us-ascii?Q?k1y6qo1cvdwy7eB7gaNufTikpekq+lOWfzcNNwpisIubs3yPR1sEwLREsb5H?=
 =?us-ascii?Q?Q9ILkt5qTY6bt//qjl3/derTZV/g75atCJRmsM+xarQVK3BYtIfU2G2oTyie?=
 =?us-ascii?Q?W89xog0Gw7ctOodP8Rt5pIz3xKS6NNR6H3zP4T+Sh49/fhisv3i1g8GFmXb1?=
 =?us-ascii?Q?l/RYqMer7gjL/eXI6tGrfavkTBk6JGjfgRpPS+G2MxApAlwOnDsVH06kpG4i?=
 =?us-ascii?Q?d746iEWqEgMNLXr+rNPYxmGKVOjJjmfDffe5UC8v90b7e9tH7loBYMh6oqX4?=
 =?us-ascii?Q?rlYI3J2abBUCI8EeVkdYUNK/pPNg6508PSyfxU9vEpfBF7m0Rwx2hYaYi46V?=
 =?us-ascii?Q?syL1nkNfNIMdiRCusf0obcUwyp5Pb/gE+gLdkUcPzo/mlHvIqrFZQplQF8RY?=
 =?us-ascii?Q?pr5FBfiy1rBzio856lnd795ftHMNjIlyaxzXNVOQw3xpvrSrYpaoFStUQUX+?=
 =?us-ascii?Q?TWEq6HoNfh13pzSbIdxkw0mWl1u/47DPp0KowKP1AziPMadbjmc0P1rTomp2?=
 =?us-ascii?Q?IrwwDykxmYNLmsHBLVb13hvCVDcqiMJ+UMusE0P/4nvip6IsUh66o0YXKrAq?=
 =?us-ascii?Q?rhTIHv7GBAVywW4QqxMP1T7Wgu8vAxE/juZjd8rjhek4CA4SAw1cUF5z/3eO?=
 =?us-ascii?Q?T/BCoEgTOnKhbu1TH2Wtb+Fn7iGnIf7rwsG1hqM+qSityyf7Wu5e8wFL7ITr?=
 =?us-ascii?Q?mqxw6NCJyzJ0I4tnsScO28LcsHhJOop7vpzjrW7mIGcImrK+BJmdVrcZfoFz?=
 =?us-ascii?Q?OicxX0P5GwBFxTd3qmFmUlLRGdIuDx9TXB61uu60sHXAgePjYWBltXPzlEzm?=
 =?us-ascii?Q?pYDUIZBanj9g1AswkTfDvQqOHbpwH9Mvt6Qk5J/5vFRql5QOrYql7BeOO0jc?=
 =?us-ascii?Q?KSi8eJ6sFt6kYdtZ3CFAg//zx2hyAR4l329kKPO8KwUZFn/zMT1wAYpRxkDZ?=
 =?us-ascii?Q?e+V5jXDS507vb7trzJgguRcFi3JxdCG1GYpZee7WEQlRQzI2tamG48EixDXO?=
 =?us-ascii?Q?KO4pkTAujyBwBIL3PVyvR1cLPTfcb7XaE1ZrODQQot48sn5Q/ba4R1bK6jhh?=
 =?us-ascii?Q?ykQlondkdWMR7ldaxUci399uT2a/AhE5r6aoXXwMst4Dl49ExPbKhhzm7E19?=
 =?us-ascii?Q?Y0Ae75wx55hWXXtgrO5+8fW8sxNTSJk1OOKUgB4VhhuuQeNi1Zd8gpWnYCUE?=
 =?us-ascii?Q?cxL3rqBghJ/jS5VB/Eo9cAN6xwe4VD2NtNIZnIWlD0dCtoRPQxxFHuyxRG3K?=
 =?us-ascii?Q?HsH5CSfVlov3CwF6xLLvnQyHOCNY/lIwCaN9xshdfSoEdI/bnyY1SLEeu/ps?=
 =?us-ascii?Q?90EZ7/lhEjoB62x4YoSeY8uuSLkp25Tq7j9Cve0Be95evI2wSuUDI4NZmMOj?=
 =?us-ascii?Q?8LlFQb4Tiw2/AC1RiwYzpp1wE/JxpyGWYjxWGA9yZMZiRhXowWMKow3sWpLb?=
 =?us-ascii?Q?2bOk2l5dMfcOfZjnlAtfuo7QMkQ=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7CC07E38-E0BB-4FC2-BC04-B3245B5D2DC7";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f749098c-1316-4756-43b1-08d9efc5f746
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:26:18.4715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYBGw+9gmCMB7v/rbMDrsy+8Hv4396gSxd9Zc+/5gsb2Zf0LSm7ifIIwqLNO3QyPrmdv+m3ROm1gOrLKs16J602gJFwCDtN51eVS53Q0DoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4449
X-OriginatorOrg: citrix.com

--Apple-Mail=_7CC07E38-E0BB-4FC2-BC04-B3245B5D2DC7
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Jul 5, 2021, at 5:10 PM, Jan Beulich <JBeulich@suse.com> wrote:
> 
> This function is the wrong layer to go through for PV guests. It happens
> to work, but produces results which aren't fully consistent with
> get_page_from_gfn(). The latter function, however, cannot be used in
> map_domain_gfn() as it may not be the host P2M we mean to act on.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_7CC07E38-E0BB-4FC2-BC04-B3245B5D2DC7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKZokACgkQshXHp8eE
G+1uJAgAw3WNR8HQG8w8ST9ICV5+Lz/+Ld47XFt+hOP2JvK8o+mM10onCQ7Soq8h
qqwfGKVcRBzytDgu+N22E0HsrSQa8fx5KQnkE72UQB2hR57OA79NIJC34a9Xv3dB
me/ta7Zgo1goG4Di0IhM7rW/zpVH13AkNOtyMrBKBeKxmTusW34fvgw7Li0P/KZH
TnTCy+fjH7QcPoHxqPW7Y6IMxPfldrfSTvSgwJIGiCq0CHqsxciT6czH3WCSTqaY
7Ci/3S/jC1gMiq4DNM0P7sUqGNUazvU2/MPv2ARUI3GV49/iEr1JuS0HeawvlWbu
oRoeaszb/NPhWtGVukk++FdDp56W+A==
=7ZYW
-----END PGP SIGNATURE-----

--Apple-Mail=_7CC07E38-E0BB-4FC2-BC04-B3245B5D2DC7--

