Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EC4143A6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192248.342636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxWK-0006TY-0S; Wed, 22 Sep 2021 08:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192248.342636; Wed, 22 Sep 2021 08:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxWJ-0006R9-Sw; Wed, 22 Sep 2021 08:22:23 +0000
Received: by outflank-mailman (input) for mailman id 192248;
 Wed, 22 Sep 2021 08:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxWH-0005Fo-TC
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:22:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31895ee6-1b7e-11ec-b962-12813bfff9fa;
 Wed, 22 Sep 2021 08:22:16 +0000 (UTC)
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
X-Inumbo-ID: 31895ee6-1b7e-11ec-b962-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zAhiWJIs0wbl7XNVNT3P6InRVdgLDNm/3Htj620jk5E=;
  b=S4GPl0FEwGviTfW762IMygOPd+/uhC2iRHReN3S8kAZEUtmKVDhghhjF
   sMUHrPAp1XoSgQc8SGafJG6P164GeTSZ2ivrjqr+JFV/MHn+ufjIh7leY
   hFJkmnrqvL9DT4oHXkZ+vegiPCmtV8088oHOR33WeAsJLZomrZ/GF+G8X
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jZCjbM+N1sOj+WiRfQBGmrBCA4CGnbNwg35d1f+DKcKjXsfQlg8mowpP6A2UmtW7T6tCxabsfZ
 5maHkjYWsiusJRqEmWOdvfUPw34twYeohmxYQoNie0c+UfUPo+hFY6VIy+vRP4mUKydZY1X32N
 zaaPP260vrHlKYXrceDjA6nQ8x2Vz2oNuHImx+QL4MRnhHBT4YgbnkpCeqwtqgobZXtctFmeHB
 y+yOSdYro/fBTXVONtYBd2wF14gONmkuOSYQek40ZYhktbS3bHyzIgihzeTtXMVXaNRTwSmnpV
 S4UhMCMCOJPhfuFOZ3b0HCZc
X-SBRS: 5.1
X-MesageID: 53713461
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h/Tv9auyTG9w8oMe8Op+7HtAdufnVLtZMUV32f8akzHdYApBsoF/q
 tZmKW+Ga/+KazT3fdkkb4W//RkO7MDdxoRqSAZt/i4zQioT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj5W1bQwgDqz2w6cDcztKVDh/PYZrweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sRRK2CO
 ZNxhTxHVTOaURETBEUrIq0jheiwpybCSzcJtwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ9PFwh0aI7ncOExBQXly+ydG7gEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZAd94OpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OJS8i/n+EAHx+
 WvJsggclfIKjM4g+pzuqDgrnAmQSoj1oh8dv1uMBDv1sF8hPeZJdKTztgOKtq8owJKxCwDb5
 SlawZD2APUmUMnV/BFhVtnhC11ACxytCzTanVcnNJ0o7T3FF5WLLN0IvW0WyKuENK85ld7Vj
 K374lg5CHx7ZiLCgUpLj2WZUZ9C8EQYPY65Ps04l/IXCnSLSONiwByCmGbKhzy9+KTTrU3PE
 cjCKpv9ZZrrIY9m0CC3V48g7FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TX8Gu95MPKb7dfWKL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9xrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:wr3VAKEqqBUDSQO8pLqFDZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKnyXcV2/hrAV7GZmfbUQSTXedfBOfZsl/d8k7Fh5FgPM
 VbAtFD4bTLZDAQ56aKg3jHLz9J+qj6zEnCv5a4854Cd3AOV0k2hD0JdzpzX3cGDzVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+wA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxeIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4rD3xHklUKvoIRiKq7zOSI
 JVfYPhDbdtAB+nhknizyhSKIfGZAV3Iv+EKnJyzfB9nQIm2EyQYiMjtb4id0w7heIAoq9/lp
 D525RT5cBzp/AtHNFA7Z86MLOK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53713461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBeKqpKOkoDnnTv5ogE1Ik94K9FODESOmkdu/7i3cVnxJdyI2drJYrnNLJMwgqZatF3KxqkV/iPfm1j6twba9MEyuVD+6/7dKTurumodLosMbEp6KjEjNUfJGbhxnrtnmskhdNal0wWa307GOWoVKgK0MlLHXDL7tusN7LuaVyimCB5a1a5UDHw+D/osy42EXYarbHzoMvnkyK0WDh+ZWBAF+vDFPnZJ/Csya8Zn8nCjdkZ2iwCvRVCpSWG4Tpgrr3IUsJKZyhF3P76Pp5srUrgLtHhDrP/Pyhjvk1hU3idvY+5MdUCCt6BRmg8Vm4fEgtgyvpTv5HmYQaApcd//Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9tcyJZDVToONgtALKgRS3g/dMzuoFmclxk5371g7gig=;
 b=K39HAv+SkLpXc5vLGaOpkIfWMFxDA20beiCPlkEAy4hyHUz6/ajz14PIuUvkDUEs3yDzarRlCowrcDYrePsIHTA3T9VF90SHK8I9PwPe8i40GRBwvdTjLPGBFiCxxONV3U4HFpp+vbTiPl6Jt1dsohkbajXjBGCHGcdHwNU9f8wH6fOHkAjLf/9wAypSAShUANu7WSFAhSA8RfYlQGnH++bKt2H2JDih6KrCekXkPXTEGghBBpFkq4yMkzFPF5GcS0VRqAzw+aJTZoLeQ2iQYqxfnH8J8wkzAJu/nlXHUGcW2H4UAaL2mIjZgZV8QF3MQn4vCweAPJOWvfrE3yCSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tcyJZDVToONgtALKgRS3g/dMzuoFmclxk5371g7gig=;
 b=lpZQakppQw7z34vxRmWYjqq+CDq+ASwGaH/53/YJ1WJezdIY0E5SqkKtNqavmwnEhpS1ljDMnI2XzbsoDeQVhACZCVo9NUd/OfwrCwjdw9CfU01rbCPavC4yDt0yeq1ox8gwzQ/Jx6G1OJ1IogYfuADduJ/1asR+VTqIfBs5BJM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
Date: Wed, 22 Sep 2021 10:21:23 +0200
Message-ID: <20210922082123.54374-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba7b8016-b3dd-4ea7-4b30-08d97da213f4
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4015FEC15D83049385100DC38FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5NPVDihWrMAPy8NDznUvuL396Fo+ZUrMqRTuVjMam7KW52N+KgTcxzFrVLev5CAuJvUIyPg820H/yyYxepJ3voDwjauX8yHX0YjMM+PTuuU8AAPM40NWw5EZ5kq10N7T1KgjpSVzdawIcRWCbKCkmkvUc1VwumvqNH/ZNZdrzjkwi0xmZrpjShb1FDLf4ubyr16EGlGOWUYNv1hoAgdfgrb4qeXYcykr7vJpMqXv4FAA+PVLFVgn/EIy5lGvIgwq7xGz9Bsvs0gQMZ6U9aMPCn49L+ZmPGtm3yTDNrnvHzzlO30L19S52aDTN3Dfw+wIgnSriHEdKNYqhhkMDEHb9aXrx+j7bGRlIMDRJvpzZ6vM/Sw0civgFnwnRVIEtTGkTN1VpzaXD3VvETnxxT7DzjwwgS2N/jL8vLuUSZaPVXmMQcNz/ltydnMqDUXExX30xtZmV1qx6/zPBLgARQ9XeIytQfuTjz98qWJigtE8u4pbCYW0ZX3ArHP9ju4uY1HE+obfmLCN+Z4POHlRklcgTvi5klhtsjb7AytqH6vxEMkm7XErkExxEOwiYuWkNOOoILRb3BY3U0gDP1XXd5g6j5zqU71i7gP95iN+48+rF1CE7WhBXaMOx5dsonTp2FwqZsLg9+6SRtcIRiTdnZteA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3gwMElBWVBrMmxDaWNvS0xjc01JeHRzQUNFWDhZeVYvTWRVSFErcDNBZWhK?=
 =?utf-8?B?MitHb2QycCtNV0lBTk5kbmtRaktSQjFlU1E5a2haUHVhS2gxR1Bma0sxRVYz?=
 =?utf-8?B?SVFmQk1hcmQyakg3V0diVHBsV0hwVVBUYy81bnljejF6SEt6STZRK3dMd1di?=
 =?utf-8?B?Z0d2U2ZsUXRKcnRwUDFJWUluTWNjYzlCUWVFdnhLZVM3Y0FBdUR1OUtoN2N5?=
 =?utf-8?B?RW9wY3gxUGNUMmFRdmgzNzh3UEJrRGNqN0ZaSnZyYjI4b0h0RGwrdFhKRklO?=
 =?utf-8?B?N3NFeXk5dmhCZnc2QjBQM2xsUTRFMHpCeGNUQ0hBckc1UTc5c3ozWmVwSFlr?=
 =?utf-8?B?NHkraVB4alM4Wk5HVm4vYnVxL2Fxa1dnazRoTmZyeTRHYUlxTU5iVnBIcUtT?=
 =?utf-8?B?YXRlUmcwVjFlazBpZi85UE16Ui9ML1M2WU1FWlgwT2wrMWFqMHVhUTRjdUhz?=
 =?utf-8?B?V3VYM1RyQ1hRYkhxV2Nncm1oZEdBZ2U1ZWI5MHJpUE1YODdTaHIwUlU5ZWk2?=
 =?utf-8?B?bS9ieHpjVEJ5alE4OTZaOGx2VkdoMzQ5cm1SYUJpalZBZ0V6WlBnTHFhcWdT?=
 =?utf-8?B?RTQ0dW16b2RnTHU0N0xTZnAzWi9sLysrbFVGWFJtbUJwVWN3Rkw5QnZJb0hJ?=
 =?utf-8?B?K2wya2JqU28xSlA2ZEErbFRtL04ydmtra09qMTc0QVRPbXNoTStqYWdKNTVw?=
 =?utf-8?B?ZkxJckRMaEt5d2t6dU50ajV6aEVmSkZuamFZRGhkM2gyMkJyaVRJUG01a3gz?=
 =?utf-8?B?NHRPTnk3MHFnTWw1MnYxU2xEQUtJcCsxTjZhU0paL2l5RnhuZ2dMUFZYaFBx?=
 =?utf-8?B?ZkdJR0laenNpNjF2RnRYaTAzR1BEbGxKejhxNnl0Z0U5UTFVSEYzVENVNksy?=
 =?utf-8?B?dHlnbFQvRmpEK0cxdzU5MXFwYSt1SmoxUFBCQ2pFOFRKNGZtYVF0ZUhOOHhK?=
 =?utf-8?B?bWFZSlNURTBFTG1xV2VhdHppclRZUXhxUkEzOEN5UEQwYkUwN1ZUZnBZN3dZ?=
 =?utf-8?B?TldLYVRhWkZxeC94OTF2TmdySURuTERhTjhab1J6OEdzVm9YK2hYZVB3WnJP?=
 =?utf-8?B?dDlVZk1BOHBYK3ZtMEl2MEovL2VURHdRVWE1NHBjQitoVDI3TENJY05NdkRv?=
 =?utf-8?B?cDJwNGdLY0FzRGcweVVvWW93RnpXTlFUYnVsNmJYU0xnSURTYlNVUzZCQi8v?=
 =?utf-8?B?WEpza2lTSjhSbWgrbXNaRm9ReXh4RlNCN2drbWJ5MXBab0Y5NFVTMU13bWx2?=
 =?utf-8?B?bllpdU9SS0l0NWhkdWF2S2Y4QTAxZ2dNcnhhV1RUaXdtK2gvNlA1aDVDMERx?=
 =?utf-8?B?aml1SFdQald2TE9JUmN5a0UyZXFmSTRoNS9adU92b2hrbUUxS0szMTVLZ0tk?=
 =?utf-8?B?Z3FSeHk1SGlTNGZRQmV4SEZDWFh6VEt4SGV6ZHZkSDNvZ3lxRWUxaDNTS2F1?=
 =?utf-8?B?RWNONW1oT0hFUlNzcEdEWnVxTjFOR1VnSWxCY3BCN1pRbUZJcndva0xEVTlR?=
 =?utf-8?B?OXpYT0ZYR3lpcHBTVEg2R0xjenpGUnVTMTRFYTk4Ylk5QVdxR0FaLzdxRnpG?=
 =?utf-8?B?V28vUmtKd0h0YmhNVm1UREhVaGtjMm1yVW40R29HRHp1UnFzWkg3QUl4SHFl?=
 =?utf-8?B?eVh4UkxQUjBaaUtDeklyK0U1V1BGN0QwNnBCTDVYcEh1SDEwMTE5WStSNWp0?=
 =?utf-8?B?UTFtTE1RYXhMTnI3QjRUbHFJTDdRY294UHp4VnpMZDByVjlhSktPVHlWZEZa?=
 =?utf-8?Q?cm5hSwZFPEc+P+dfmeiti1bI5gE/K/klYnrNCkP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7b8016-b3dd-4ea7-4b30-08d97da213f4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:22:12.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKQBC9dv1cpFOoNwkvoWgw+1wHUeoSqDtL6/AizjGrpcIT0T7rTWq05rBfJaICSdzBhrOo6+nnYJ7Amft7Bt1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Allow setting max_grant_version to 0 in order to disable grant table
usage by a domain. This prevents allocating the grant-table structure
inside of Xen and requires guards to be added in several functions in
order to prevent dereferencing the structure.

Note that a domain without a grant table could still use some of the
grant related hypercalls, it could for example issue a GNTTABOP_copy
of a grant reference from a remote domain into a local frame.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in     |   4 +-
 tools/libs/light/libxl_dom.c |   2 +-
 xen/common/grant_table.c     | 100 +++++++++++++++++++++++++++++++++--
 3 files changed, 98 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c5a447dfcd..d507540c2c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -583,8 +583,8 @@ L<xl.conf(5)>.
 =item B<max_grant_version=NUMBER>
 
 Specify the maximum grant table version the domain is allowed to use. Current
-supported versions are 1 and 2. The default value is settable via
-L<xl.conf(5)>.
+supported versions are 1 and 2. Setting to 0 disables the grant table for the
+domain. The default value is settable via L<xl.conf(5)>.
 
 =item B<transitive_grants=BOOLEAN>
 
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index e9f58ee4b2..afc8b88497 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -598,7 +598,7 @@ static int libxl__build_dom(libxl__gc *gc, uint32_t domid,
         LOGE(ERROR, "xc_dom_boot_image failed");
         goto out;
     }
-    if ( (ret = xc_dom_gnttab_init(dom)) != 0 ) {
+    if ( info->max_grant_version && (ret = xc_dom_gnttab_init(dom)) != 0 ) {
         LOGE(ERROR, "xc_dom_gnttab_init failed");
         goto out;
     }
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index f50e9f6a06..df01d03ce4 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1027,6 +1027,12 @@ map_grant_ref(
     }
 
     lgt = ld->grant_table;
+    if ( !lgt )
+    {
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", ld);
+        op->status = GNTST_bad_domain;
+        return;
+    }
     handle = get_maptrack_handle(lgt);
     if ( unlikely(handle == INVALID_MAPTRACK_HANDLE) )
     {
@@ -1037,6 +1043,14 @@ map_grant_ref(
     }
 
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        put_maptrack_handle(lgt, handle);
+        rcu_unlock_domain(rd);
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
     grant_read_lock(rgt);
 
     /* Bounds check on the grant ref */
@@ -1367,6 +1381,13 @@ unmap_common(
     ld = current->domain;
     lgt = ld->grant_table;
 
+    if ( !lgt )
+    {
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", ld);
+        op->status = GNTST_bad_domain;
+        return;
+    }
+
     if ( unlikely(op->handle >= lgt->maptrack_limit) )
     {
         gdprintk(XENLOG_INFO, "Bad d%d handle %#x\n",
@@ -1406,6 +1427,13 @@ unmap_common(
     TRACE_1D(TRC_MEM_PAGE_GRANT_UNMAP, dom);
 
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        rcu_unlock_domain(rd);
+        gdprintk(XENLOG_INFO, "%pd has no grant table\n", rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
 
     grant_read_lock(rgt);
 
@@ -1556,6 +1584,12 @@ unmap_common_complete(struct gnttab_unmap_common *op)
 
     rcu_lock_domain(rd);
     rgt = rd->grant_table;
+    if ( !rgt )
+    {
+        rcu_unlock_domain(rd);
+        op->status = GNTST_bad_domain;
+        return;
+    }
 
     grant_read_lock(rgt);
 
@@ -1931,10 +1965,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
         max_grant_version = opt_gnttab_max_version;
     if ( !max_grant_version )
-    {
-        dprintk(XENLOG_INFO, "Invalid grant table version 0 requested\n");
-        return -EINVAL;
-    }
+        return 0;
     if ( max_grant_version > opt_gnttab_max_version )
     {
         dprintk(XENLOG_INFO,
@@ -2056,6 +2087,11 @@ gnttab_setup_table(
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out;
+    }
     grant_write_lock(gt);
 
     if ( unlikely(op.nr_frames > gt->max_grant_frames) )
@@ -2138,6 +2174,11 @@ gnttab_query_size(
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out;
+    }
 
     grant_read_lock(gt);
 
@@ -2302,6 +2343,13 @@ gnttab_transfer(
             goto put_gfn_and_copyback;
         }
 
+        if ( unlikely(!e->grant_table) )
+        {
+            gdprintk(XENLOG_INFO, "%pd has no grant table\n", e);
+            gop.status = GNTST_bad_domain;
+            goto unlock_and_copyback;
+        }
+
         if ( xsm_grant_transfer(XSM_HOOK, d, e) )
         {
             gop.status = GNTST_permission_denied;
@@ -2888,6 +2936,12 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
 
     if ( op->flags & gref_flag )
     {
+        if ( !buf->domain->grant_table )
+        {
+            rc = GNTST_bad_domain;
+            goto out;
+        }
+
         rc = acquire_grant_for_copy(buf->domain, ptr->u.ref,
                                     current->domain->domain_id,
                                     buf->read_only,
@@ -3092,6 +3146,9 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
     int res;
     unsigned int i, nr_ents;
 
+    if ( !gt )
+        return -ENODEV;
+
     if ( copy_from_guest(&op, uop, 1) )
         return -EFAULT;
 
@@ -3270,6 +3327,11 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
     }
 
     gt = d->grant_table;
+    if ( !gt )
+    {
+        op.status = GNTST_bad_domain;
+        goto out2;
+    }
 
     op.status = GNTST_okay;
 
@@ -3332,7 +3394,11 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
         return rc;
     }
 
-    op.version = d->grant_table->gt_version;
+    if ( d->grant_table )
+        op.version = d->grant_table->gt_version;
+    else
+        /* Use 0 to signal no grant table. */
+        op.version = 0;
 
     rcu_unlock_domain(d);
 
@@ -3351,6 +3417,12 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
     struct active_grant_entry *act_b = NULL;
     s16 rc = GNTST_okay;
 
+    if ( !gt )
+    {
+        rcu_unlock_domain(d);
+        return GNTST_bad_domain;
+    }
+
     grant_write_lock(gt);
 
     /* Bounds check on the grant refs */
@@ -3872,6 +3944,9 @@ void grant_table_warn_active_grants(struct domain *d)
 
 #define WARN_GRANT_MAX 10
 
+    if ( !gt )
+        return;
+
     grant_read_lock(gt);
 
     nr_ents = nr_grant_entries(gt);
@@ -3953,6 +4028,9 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
     int rc = 0;
     uint16_t flags = 0;
 
+    if ( !gt )
+        return -ENODEV;
+
     grant_read_lock(gt);
 
     if ( gt->gt_version < 1 )
@@ -4069,6 +4147,9 @@ unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned int id)
     const struct grant_table *gt = d->grant_table;
     unsigned int nr = 0;
 
+    if ( !gt )
+        return 0;
+
     /* Don't need the grant lock.  This limit is fixed at domain create time. */
     switch ( id )
     {
@@ -4100,6 +4181,9 @@ int gnttab_acquire_resource(
     if ( !nr_frames )
         return rc;
 
+    if ( !gt )
+        return -ENODEV;
+
     final_frame = frame + nr_frames - 1;
 
     /* Grow table if necessary. */
@@ -4156,6 +4240,9 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     struct grant_table *gt = d->grant_table;
     bool status = false;
 
+    if ( !gt )
+        return -ENODEV;
+
     grant_write_lock(gt);
 
     if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
@@ -4200,6 +4287,9 @@ static void gnttab_usage_print(struct domain *rd)
     struct grant_table *gt = rd->grant_table;
     unsigned int nr_ents;
 
+    if ( !gt )
+        return;
+
     printk("      -------- active --------       -------- shared --------\n");
     printk("[ref] localdom mfn      pin          localdom gmfn     flags\n");
 
-- 
2.33.0


