Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEA4F5A36
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299779.510965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc29v-0002fV-Sv; Wed, 06 Apr 2022 09:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299779.510965; Wed, 06 Apr 2022 09:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc29v-0002dg-P4; Wed, 06 Apr 2022 09:41:03 +0000
Received: by outflank-mailman (input) for mailman id 299779;
 Wed, 06 Apr 2022 09:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc29u-0002da-A5
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 09:41:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b4c8f5-b58d-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 11:40:59 +0200 (CEST)
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
X-Inumbo-ID: a9b4c8f5-b58d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649238060;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/kGwXS8dZVc3ZZR3yfVSfNArjoX/I0Ua+HY0llXNokQ=;
  b=NZt2zalxb4NVP1C69AW5IXjd9wrzJFkgkDb31q1bzaPqaIPCwECCvEEA
   /Gi7IpfSUP8cD9DnounSv3Epo7uWVLh+aNWNfOQvIIeAAabZOWi2ThYbJ
   XrZThEB8QF3NsRChcIoKWxotNkr/MgdN/FY5WoYgtlRk+/MS41KfCEOWe
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70536502
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wD1vU6NJ0A0aF9DvrR1Hl8FynXyQoLVcMsEvi/4bfWQNrUp202NVz
 zdNXj2CaP6JMWegKot+YNuxoxkGuZHUy9AySwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 44V6aazbiQSGZbMx+g+UUFELyxAFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwg29t3Z4TRay2i
 8wxZTQyaknsSgZzNxRKGps1uM2r1mv8fGgNwL6SjfVuuDWCpOBr65D2O93JZpqGTNtUhW6Du
 mvc+23zRBAdXPSTxjaI/WilrvPeliP8HoQJHfu38eACqFGL3WkSFB0+XEO2u+WkkVW5X89DK
 ksS4Wwlqq1a3E6hQ8T5Xha4iGWZpRNaUN1Ve8U44QeB0LvJ4C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdJmqon
 wqJiwsFoI4T0sIo1f2nwV35qmf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCbyBUOUS9joYyjP8UQGPY67PhwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoG7ZEgeN7lnBumji7qXXHI/KPi+T2iJm9E+ltDbdzRrphsPPsTPv9r
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LOt/1tvpALsdpJtHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIG2QlJveMktPTyRQz
IronPort-HdrOrdr: A9a23:CLYciqu65Pd0JfJ6fxPcCixu7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="70536502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHmHrT+Yu8TvHOFXkcshNtlu/8Tmd14v/ptabn9ZSTIEx7b973gLmyut1FqFYR3BKFO5u87OBFfTy8wUdOqRK4oQ+xE3L37KX71FYIHnHTSYJoRAekNAXTyb0kfUz5QuyJaNDxZKDQVlllNIZ5rdAtbIsffxLPnEaqTaon0GcBFlli+GoMwnNtOSTynNYd3JFFkr6bA8aoj7udKpgwY7i23+OMaC4ZDOz9r9/3n0MdGXglrPDZCZ/Pa7Z9nHC7JEk0+93iEh7GicQe2hil6zCRLeXMzKOcvk6twwzJlccB86zrsY6AAakQJQXjClKVVCw4F+gprT5gjEx8KKx6KObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cMQRrqpmPufUJ5VEl4g2u+SX0Y2ZZKjjMHF5qRiPp0=;
 b=YrL8Eu22ONylrotARX89Hqzi0DxRWovQROC9nhag2SEDAsoxNZuOWbt9KhnMamQoRUP0tuIEunHcyKfFQ858xl6wU3FUzOu5iO1oGrhdq8vQMuzHnrTaH3CW4GQcHjbHvTMpeTx16G8e0lke4HfNj5EwpAIsGacu6/TcCiFCA1tLSZxJxSPcdRrA/Z6PRaTyk8of6Lyopl/Bcizle3KUTbl9tQ1Uj6+mZ49ZoXZJzZvVK9HhCeVi5pGOGtNSK8aVxcT2MVvsyCA6HQmFBbOUo2gygrMk8Rm2WkowIo2KVpQcqZLxzlDGbJWnE9zhzJm+x48zvFGxv0bKdU7apVtrYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cMQRrqpmPufUJ5VEl4g2u+SX0Y2ZZKjjMHF5qRiPp0=;
 b=L5bOd3UAnPQ7Kkee7Hyotl1J2Cb1CRdXfqeW1e1gqRtv6zr9DmXnHhsLzCnhsbzhYQb99qTmK/e6IKOYOiAW6PEWDgMT1XVcgdKTQuOtHYpJH0Bs9q29vpCTx6vEUMpy76z6yT80d6CIGM/oVdORTCb9l8hXZ1DKY7VFybkpISA=
Date: Wed, 6 Apr 2022 11:40:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <Yk1gIhr37mK3Exc3@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
 <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
 <Yk1Ta9ujHBuj+svN@Air-de-Roger>
 <dd4fce17-2625-603b-25d5-3a586a682210@suse.com>
 <Yk1YtHYzS3aAbQlr@Air-de-Roger>
 <48e44681-822d-8e00-a2c8-808984a0cd50@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48e44681-822d-8e00-a2c8-808984a0cd50@suse.com>
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9194247-3d72-4e4b-5656-08da17b18b94
X-MS-TrafficTypeDiagnostic: BN6PR03MB2739:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2739C6E2DBB076FDBDBECE258FE79@BN6PR03MB2739.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ndVtym9R7jgH3IR5JQAmf1fNPN12iACfykx5NPXSonc0BFY1Tkm5hJgVujys/qJ1PBgbfwpd+UQAwFWdmX5JhCe0fvzil39ovyWRlO+/ILLiYK4FrxiscCE97dv8aH6iB3i7O6C868zNDFOmbWL8mPlezaZ6K1Hjlj/phCwTZgQyuevJyNQggYqRqamSH6ALwXLKZGLWIIQKizoEFsoIUXBZVFiCUnh0K16PAaB041Pztoem6Eh877wZt3GQmUZJaP68kbkn/kDsU3m+yMtc/k9y5sS5lcV3O4wcVVH7EhdsU3fXeS9Duov7/lekEgIWz3DVyKV1YvIxvisLDFtj2GoIZUlFcjv4pxGAK0ZtOKa1Ene8NbgRRgE+KjIrmyWewSe7XejauWKz6EnkkiKj1ssgElrQG35INJt/kbIJJMc+mOYQLxdNPJu65xMgCTw1GKiWAWjaw9MbA8jbRXNLt3LfTJ1sjOuyyaACmfae+PGcCmB6usB0v2tjgEe+xGpzTZLgy+NMAulcL/76OcBEvjPLeoOcp2C+TS3WTTJrIJYhSnX7bwDBeF/PTKLVLK74sUt525QZprHQPHUC7quN+K66sUJF651Q82R+SpCPb0kwfMS28MZIfKlViUwucvNDNgOp2/Nm9LcJH+pdU21Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(8936002)(2906002)(82960400001)(66946007)(85182001)(5660300002)(66476007)(4326008)(66556008)(8676002)(508600001)(6506007)(9686003)(6512007)(316002)(33716001)(6486002)(86362001)(26005)(186003)(6916009)(54906003)(53546011)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlZ2aUlPZWhRVk9ydXFuaGMxNTFtSGdCR20vaGFIc3VyWWpTUnczR0tYdnAv?=
 =?utf-8?B?em1Pb2RDcE9KVWVzSy9KQkR5aDVLRjhQRGVBemwwZ2V1K1Z6Sjc3eG9FOWo3?=
 =?utf-8?B?eHJOQjNiQ2JKYkUvbzVBZWEvRXFVVUwrRDArZVAvUklKcUd3ZlFZeThHWHQ5?=
 =?utf-8?B?OVNyK3JSU0dmQ3JCWlBHNktvbUJMaGFNcllZaE5QdytFam41V1dMRi80M1Vx?=
 =?utf-8?B?elJNbXVkUHhtUUxzcC95Rk9Za3dKdGhSMVQvU09rd1JZQ1NjejdBTVpvODht?=
 =?utf-8?B?N2paMEZFMDdUN0lIVmpKTGhGWnFrMUkyYjlOR2FqMVhQWEFaMUhUYVFXdmQ5?=
 =?utf-8?B?YWhkT0xaL1ZmbFU5VmxQbjJza1JpZElSenFSQ3pZQlNHakdiZ2xpc2k2aHZO?=
 =?utf-8?B?WDNncHFUb3hDVHlaTithaldqTitGdlNiMkpwUjlOWHJ3ZGl3Y05jdjBpREl2?=
 =?utf-8?B?Zmt2ZTkrUGdzbnlUUGttLzlzQmx0b3BOaThiS2I4OUFxL1dCS3FzSHpyVWk0?=
 =?utf-8?B?M3ZLVUF4cVhyM0JzWGJScEZ1WmF3SlFMeW15OXpUK3RiZGRxb1NiVUdUU0E2?=
 =?utf-8?B?bHk1ZU4zUzNHNHFXR0dOVTA1bmY2MXZoVGlmcGVVSjd0YU1sTEVnT2k2d2FZ?=
 =?utf-8?B?ZnMzZUpCSXhsUTZhWjBLcXdTRjBRdDlISDBDOE14Q2NVaVBXTmZ3SXFpc0Zl?=
 =?utf-8?B?OHJIK0ZDbEpnbU1DSVZ2dzF3YzY0YXhzcGMzWnMwcDVWcnNYQXVxTHF0dUpV?=
 =?utf-8?B?dFc4eTZyWXJYVUNYWnVxMGFTZHg3R2dsRm1pQmFNemdhdEJLZ3U1cWZTNzZ6?=
 =?utf-8?B?dWoyYWpvbCthVlIxdFNzSVk5NmppV3JpbTBvUHZuV3dkMDRadi9iMEwyWFJv?=
 =?utf-8?B?ZzRNRVFpSTkxZ2NSS3hGNldycnVWR3RIL0lxa0xzenM1L3B1UlZ4WmZzM20w?=
 =?utf-8?B?U21XT05mZUNNaUxaeE5kOUhwZThDYzV5dFpnaCtFTXZUbEV2M1NaOHZ3RGRX?=
 =?utf-8?B?Wmd2bGRxMlBLZGdadlFyZnVDajdSd0FpWkdxcFBOZGhQRlpSL3Jka0lFU21Z?=
 =?utf-8?B?MHR2S3EzdTViT1VwcGNqeSthcnh5L3dEZE5QRXFaa3VuSWJaZ241OU92MW1J?=
 =?utf-8?B?Wm54eWNPbmdiV0Urc3BhZjNCQ3lPNTFmOUdqeWpuMFRhQVd6STR3YWRYV3ZL?=
 =?utf-8?B?MXFjWE52S0NBZDFrcnFXQytvTDhSZmVmeEZTYmMvMi9iUFhLSTZnVXdCc3Rt?=
 =?utf-8?B?b1VvbkJMQzJIUUVsRSthQXAxbTg5WEgvSm1zVHFOZGwraHU2RFpvaXNISnJx?=
 =?utf-8?B?bnBBR1I5NzNUclBtaE9oWStvQjBpSEhkZWlYK1luNnFuWHdrMnRFNkdkMDc3?=
 =?utf-8?B?WE0rSUpxcXdjcVluQTk0SFpYa0I4eSs2ZDNnODRBNDZyRnpUckcxWi93ZGZP?=
 =?utf-8?B?eGJnRXgyaDlFMlg3blpnZ2ZmYmRkL1pEeG8vVEdWOFM2OW9hS0xpYy80K2FT?=
 =?utf-8?B?eENENUVMMU9CVldudk5JMXBTUnA1RG9PanFEaU1SazdwVjZGUVBVSjRPY1po?=
 =?utf-8?B?dVd4aGJsdDBGUlhTLzl2MnhhZklYeE1VL2lDU0h6ZTFvREZjdW9qMm1FQ0s4?=
 =?utf-8?B?dTUzaDFLMVVYU2VPN3lEeWxTRlFQZnpkWXhVY0R4aStmcDhpb1FSWnhqYWtE?=
 =?utf-8?B?d1A2MmhkQzZ0VFR6UUtaRnNoaWtrczJtWWhQMUo5cDFFSVZKY29iWXk2RkZR?=
 =?utf-8?B?TWZqZVRWN25ISWZycWNIOHlQbDRsWFNRVUhrQ21ONEE1djIvS0FaVUxFa2xS?=
 =?utf-8?B?bGt1UHdqVEpKcVpNcGJ6TG4zaTlVT2RPSTZ2WllUZGJTelBQVnUxWWc3cGVG?=
 =?utf-8?B?dldVYnl4eE5OeGdIeXFRNFoxZi9ya0VwSmFKR3ppbXRqN2U1d3oxeUdDVzRL?=
 =?utf-8?B?RGVReTZrRWZDdjZqOUZmOUZpMXcrbnd4WkVrWWpobnIxL3MyaWxvZ0poNXNF?=
 =?utf-8?B?M3F1Z0xhUUpMY3haQ2pnMU53L1pRQ2xaWG02K0t3ejJuOG1CMTBVRjh6WS9p?=
 =?utf-8?B?YVRLRkRjMjRLVDVvL2lHT0hiYlR0Q1c5NjlKMlhUWGRza0hsYlFqeFJDTE5t?=
 =?utf-8?B?WUVQUVNOMmlwT0JpN21jZmc4SWRsMjJaZExtRVEyQjAyb1p2NDJOVWdONGM2?=
 =?utf-8?B?NGhGdmczQmFRK3dBZXBTUEtjQTV3ZEFLZHh1a2ZEcUFsRHZ0YWluTU51cEVV?=
 =?utf-8?B?eUUwQUxCbnVtM3pQdmVPVjZXVjhkYzN5bXA5YjZ4SmNQWkVXZEZxU0dQd1ls?=
 =?utf-8?B?TlVOOVkrZXJIR0QwaXllR2ZmSnFqclBCSXVoNEcvSEhYNngrWVpCMEtleUxB?=
 =?utf-8?Q?gDPa6LbuYkEgeOik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9194247-3d72-4e4b-5656-08da17b18b94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:40:54.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQtyYqntGmE9Gyxnb73ywmwHKxJI07TJomiDk9jZejFbMfm9kPQSpQXoHkEvylzl10U1RCZ7IHF4LKDTwe8yrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2739
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 11:16:10AM +0200, Jan Beulich wrote:
> On 06.04.2022 11:09, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 10:48:23AM +0200, Jan Beulich wrote:
> >> On 06.04.2022 10:46, Roger Pau Monné wrote:
> >>> On Wed, Apr 06, 2022 at 09:06:59AM +0200, Jan Beulich wrote:
> >>>> On 05.04.2022 19:17, Jason Andryuk wrote:
> >>>>> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >>>>>> On 3/31/22 09:16, Jason Andryuk wrote:
> >>>>>>> For the default policy, you could start by creating the system domains
> >>>>>>> as privileged and just have a single hook to drop privs.  Then you
> >>>>>>> don't have to worry about the "elevate" hook existing.  The patch 2
> >>>>>>> asserts could instead become the location of xsm_drop_privs calls to
> >>>>>>> have a clear demarcation point.  That expands the window with
> >>>>>>> privileges though.  It's a little simpler, but maybe you don't want
> >>>>>>> that.  However, it seems like you can only depriv once for the Flask
> >>>>>>> case since you want it to be one-way.
> >>>>>>
> >>>>>> This does simplify the solution and since today we cannot differentiate
> >>>>>> between hypervisor setup and hypervisor initiated domain construction
> >>>>>> contexts, it does not run counter to what I have proposed. As for flask,
> >>>>>> again I do not believe codifying a domain transition bound to a new XSM
> >>>>>> op is the appropriate approach.
> >>>>>
> >>>>> This hard coded domain transition does feel a little weird.  But it
> >>>>> seems like a natural consequence of trying to use Flask to
> >>>>> deprivilege.  I guess the transition could be behind a
> >>>>> dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> >>>>> in some fashion with Flask enforcing.
> >>>>>
> >>>>> Another idea: Flask could start in permissive and only transition to
> >>>>> enforcing at the deprivilege point.  Kinda gross, but it works without
> >>>>> needing a transition.
> >>>>
> >>>> I don't think that would be right. Logically such behavior ought to be
> >>>> mirrored to SILO, and I'll take that for the example for being the
> >>>> simpler model: Suppose an admin wants to disallow communication
> >>>> between DomU-s created by Xen. Such would want enforcing when creating
> >>>> those DomU-s, despite the creator (Xen) being all powerful. If the
> >>>> device tree information said something different (e.g. directing for
> >>>> an event channel to be established between two such DomU-s), this
> >>>> should be flagged as an error, not be silently permitted.
> >>>
> >>> I could also see this argument the other way around: what if an admin
> >>> wants to disallow domUs freely communicating between them, but would
> >>> still like some controlled domU communication to be possible by
> >>> setting up those channels at domain creation?
> >>
> >> Well, imo that would require a proper (Flask) policy then, not SILO mode.
> > 
> > But when creating such domains in SILO mode from dom0, dom0 would be
> > allowed to create and bind event channels to the created domains, even
> > if the domain themselves are not allowed the operation.
> > 
> > That's because the check in evtchn_bind_interdomain() is done against
> > 'current' and not the domain where the event channel will be bound.
> 
> Yes and no - the check is against current, but that's because
> communication is established between current ( == ld) and rd. The
> function in its present shape simply can't establish a channel
> between two arbitrary domains.

I've got confused with evtchn_alloc_unbound() that does take a local
and remote domains as parameters, but in that case the xsm check is
done against ld (which might not be current) and rd.

Thanks, Roger.

