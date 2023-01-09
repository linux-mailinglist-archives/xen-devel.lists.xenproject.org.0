Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8466292B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 15:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473717.734442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEtay-0002XS-EZ; Mon, 09 Jan 2023 14:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473717.734442; Mon, 09 Jan 2023 14:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEtay-0002Vc-BF; Mon, 09 Jan 2023 14:57:52 +0000
Received: by outflank-mailman (input) for mailman id 473717;
 Mon, 09 Jan 2023 14:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEtaw-0002VW-8M
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 14:57:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9c29b50-902d-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 15:57:47 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jan 2023 09:57:44 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 14:57:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 14:57:41 +0000
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
X-Inumbo-ID: f9c29b50-902d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673276268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=S/j8qZxd5fo4q8BxZa+uetjPoTsTEamnOrI9iHm6nnQ=;
  b=UCCgfsguBmdHqYKgEbvEBvcmkg6rqORHXlvhhjVH2COFcKOfnzlJ2OLD
   NMZH6VXnixvHiZYN2zvP2pchOgXG+uSroGz+RcYWMtdv2b+HC0JPGDJYD
   xCtHSfSVjVvsrujCt+AqVpbq6KQ+wSO5zI2LbD1oHCJgz3VdCLpmig8+A
   0=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 91806294
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NQwJ/6zk0Rh5+842AX96t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 2QdCG/Vb/mMZ2HxfN4nOtiwpxxVsJfXnIVkSQc5+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPaET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUJ/2
 tYgLgEjVCGaxKGTyYvjeONchP12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAdJKSufpqpaGhnWi1HMCCEAsD2G9/6bk1UGCacllC
 BILr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A79y9pog210jLVow6T/bzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:KROsfaioaJy/LUz2+WpEwtMK8XBQX6F13DAbv31ZSRFFG/FwWf
 re+MjztCWE/Ar5PUtK9+xoV5PhfZqiz+8L3WB8B9aftWrdyRmVxf9ZnOnfKlTbckWVygc379
 YCT0ERMqyUMbBw5fyKnjVRe7wbrOVum8qT6ts3AB1WID1CWuVYy0NcNy7eK0txQWB9dO8E/F
 j33Ls3m9JlE05nHfhSwxM+Lpj+Tqbw5fXbSC9DPQcj9A6NyRuw8dfBYmCl9yZbaSpL3bAhtU
 PYkwn1j5/Tz82T+1vnzmrO6JYTv9PkxrJ4daqxo/lQECzolgGrIKJ+XLGY1QpF2d2H2RIRid
 zRpBVlBeRfgkmhBV2dkF/Wwgz91zRr0XP41lOCpnPmraXCNUgHIvsEv5tdbhzar3Utp8t91q
 Uj5RPli6Zq
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91806294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gasRM56Dn463+ByYL/Vj063gtgAzJpLOiWJoN0xc46gh4vrXbzp9TlEdeODii+IfeKg9jx/oDYQzCNtfUdujH1Z06LzwAMnMJIdFQnZynWbrTOQWm4s3Wy+77gA7ljObke85SN9uhIOIr9qO7W1PH0Jpa/51P2ntygVKHYFPTF5RXHtkYAA/iVKVedqfSjg62NuktuXZDZx/k5/oKOs5bvTu7zY19v7iX8cm02yGCHH43OowsOEEEgWnWuoFhJWZtyxWMAgy+UWgObH/HkVSXieTg6r6u1sjKTco4PKR1GjL1oXpisGMdd1AQyqiUfhMhsbL3Kw8ExeegvwymCwsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/j8qZxd5fo4q8BxZa+uetjPoTsTEamnOrI9iHm6nnQ=;
 b=hhIA679/9WQdXy3t0NRzNPefOX41VjmU/4EN+C6+vU0nQm7Aw1+Vn8R/g7OtvfqWoI7/Rf5gPj5Joe1F3+BDoGTV6hks3gk3cLVX/dF8e363vTM0TbFZf/JcZdbmUXtPMIoPlJWkEkvx+SKe8MlY988573G4WrwBM8kWkLXmE8CjyeftKOO0UJMzuxMwmCIHwjSKsmsoK0LdNu4z+qNsW7CLk99VV9swZnbmy92Ry+sEc2QTlNM87mvQjZj6jIIiZTi6hsgME4HVkyArl8UMnBqvL9LyB5m4uI03HFLi9hEKaLyuFmbkL27o3qJLsiLC7rC/fh3FEs69ueL+KYVWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/j8qZxd5fo4q8BxZa+uetjPoTsTEamnOrI9iHm6nnQ=;
 b=kT8IO3h1Lha2LZWZVEUl4toqdParjrKAoUioteVGF/S8K0pTmNgipEbvl1XL0sNzVL/Hpy0B6wNDPFvL8pRSre4zcptOzIb/K0wpK51VyCSCBHS+q2qjzhh5DW16yj1CvJp4ruKXNg8oO/qzDFiOSmGJpR/U/n2ErTAMxh5NtsA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/6] x86/prot-key: Split PKRU infrastructure out of
 asm/processor.h
Thread-Topic: [PATCH 2/6] x86/prot-key: Split PKRU infrastructure out of
 asm/processor.h
Thread-Index: AQHX8mMDkacqheDKokOTUkSgUg9d2qw81wgAglu5ogA=
Date: Mon, 9 Jan 2023 14:57:41 +0000
Message-ID: <b7c7d431-e7d5-9dd5-a33c-c61e53c42acc@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-3-andrew.cooper3@citrix.com>
 <427dc257-b318-de55-7126-0446264401f8@suse.com>
In-Reply-To: <427dc257-b318-de55-7126-0446264401f8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6979:EE_
x-ms-office365-filtering-correlation-id: d3716add-b3f4-4468-d33f-08daf251db40
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8ssqwxJ5AQJ2VNADvIqSqIlbQRirifDLafZuDCLD9aAusRdmVHzHaPpvdwiW9x1D2Cc9fHO8D2Cr+T4o2ZtbzltAxshLPpcpU4k9WV8Pl4MXTItT13QFB3F+mehp3HPBcNsG+DNy15nZLrbqS6TEFhn/XyjPzvI7p9WWpG4nUYny7KMW/cBj0F/0+8QOK8rHemqgWg5lZrVQDJH+u7ZIVb9E0vHIHIpj+B5S1s4vve1Pw4U5TGgr3XP8doTfUy9NehtwPqZAflgcXah3Nz4HX/WELgQwlsladW35m7rycPRdqRRMscMRR/9Zu2xpWlMw0/PCtWGDdJam+2eG7PyDKpIncb4igjFkvjBTITLctA5Mn8KQvGgmvo3RKoSQq4FI1PXX4N1xccyoOyYGt4+nspdzsbr0RjOWa40gI+Q3t4jEHyaMdomOKDOCjAQ/lMDY9a3+Q2XmK6VOsBMQPY0Zau7x9VrgWtZKNDD5WVG2alWhbjkO5c9oey7FzI+m55xorEl5sZhzAOdtjB84f0X0060aE8iqyg2FJrF1iG/wCX7dpq5f1nboAn/yf2640HLiMZBAX7lsa94sIVQFcLNtg2oRSin0ycdVAyDq+UXB046xZ+zo0CTa+CfB4HNcyXLwgsAsDiwASivrvFW7SY64Hmp6a8xMgx/kD7pwK/qpTCOcZfWl4a/ea4Ax6yloDgPb3MWubdo/znvf91K2HgCV+7riOCSM9n/JFJmcNzA3BQMWmouZZ1ALVlta4VD/ZxS323L+eJIKvup2eLFJhm21BSHZq1Wwg271hrXl28CAAC6BW9wPHgj4ELV56yyPRIJi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(41300700001)(2616005)(316002)(54906003)(8676002)(66446008)(36756003)(66556008)(4326008)(6916009)(64756008)(76116006)(66476007)(66946007)(91956017)(86362001)(31696002)(38070700005)(38100700002)(122000001)(82960400001)(8936002)(5660300002)(83380400001)(6506007)(2906002)(71200400001)(53546011)(31686004)(6486002)(186003)(26005)(6512007)(478600001)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2pUL3ZFZ2NoaEtOSFZpNzFDcGxWMTRtNmJSakxtRXM2ajdGdTNLZDdNakZ5?=
 =?utf-8?B?UXpocnRsZkx2MjlrOUNuWEx3eVBCVFhuTjlZUzNLdWFLQjdERlNTUFdtaHVu?=
 =?utf-8?B?SDBrT2xRaTlFRm5SQ3phZE94cVJxWVY2UlNscVlCK0ZDUWRoNHZLRFBha3FT?=
 =?utf-8?B?WXJOaXlDMkJER1J5NVZtbG91WVN6aEZadHphY2Nmd0JVdWs1eXk3U09iRFI5?=
 =?utf-8?B?K2ZEZWpFQUczZzVUN1BOYlRNWVdOenNZQmh2WGpiTUlOc0lRRHU5RWhMWEtu?=
 =?utf-8?B?a3BtOXozUmlHbDd3aXNBdm5mVk51UE5QUWEzTXFKYmdPZ1AvdW9UeERkZkU4?=
 =?utf-8?B?SEFxdGN2TEMyZ01HcENjMHJ6ekdoR1U0dTRpMjhjNW52dEtlTjNLZVZwTzJY?=
 =?utf-8?B?UVgwdERYL1pnUHFzMzk3ODBTcnZzRlZUc3Z4ai9uZVBVR1Jjbkg0SHB6dmF5?=
 =?utf-8?B?K0ZlMGwzeHR0TVYxL2NBdU42QXVOTzBBbjVVT1htYzFnYkQ3ektrakI4S29X?=
 =?utf-8?B?d2RySElxdlhGdnNhSEp3Rk1ENHdwWklsVW8zN0VRYURhNEJ2SkhUMUVnOVpm?=
 =?utf-8?B?Y2hUMVVXT2ZEdFc4QTVHNFZYL0tlUVNTaWlRWUQwWmtSNlNKdFgrTnhpditp?=
 =?utf-8?B?Yy9kcTdlUVBTS1pLYnlUL25NT1F4SVV0RXNjTUxFSStpbHhSOW1tejFYeHhL?=
 =?utf-8?B?SFZGTjZadnFqNjZ0aUZKUXVpL1ZVV2tPd25GNXQ1SFNXRE1YbENaaDJuZXNw?=
 =?utf-8?B?NWVVMUxObUxpaUJueGFBZGZUcis2cXVKZG9UUVFMbmMzbFNtdDBMMis5eURZ?=
 =?utf-8?B?OXZPaFJiNno4dEhWQUMydjVXdWZzUUdXNG5pbnJpZ0QxQUg4WldlS21OdE1h?=
 =?utf-8?B?RDExRzF2ODlJcm95WFl3Vk5jaC9qWVNrUXpmRldWWmtMa1ZmKzUxbDJ3T1RT?=
 =?utf-8?B?Z09YRkZ5RVpNZTdLQUd1RnVLYlc5WVFEaE8xR1FVdityZWFNbXZCY0JpVEpl?=
 =?utf-8?B?VDN4dnhzcURQWWRScFdEL0lhN0FJcDFsRWkrVVBHYWdmcmJ5Z24rM1d1dkha?=
 =?utf-8?B?YlcvMWM1WnRrTjF4LzB5MytTUENlQkc1bTMwSFlNanNRUEprNlg2ZmY1T0dq?=
 =?utf-8?B?YXM3NW9RaTRYQjBqS3JFZ3Rza0kvRUFqUGFVZVczQldidDM5Vnl6Qk1BZmV2?=
 =?utf-8?B?anFyYjZ5UGNqTmZScEhiUEQrcDk4cnRCYTF6aXFMZnh5SUdERDUrY0pqS1Fz?=
 =?utf-8?B?bG5oU25zdWE1eHE3Q1RXSVlSc1R0eGIvRzNqeDZiMHZPcWpia0tSZDJMb0xN?=
 =?utf-8?B?ZnFrQUk3eTNLNzdFcjFqNlNuSnJsMDBWT290SUpMWkJYdnZ1M2Zxb0tib0t0?=
 =?utf-8?B?MTNWYjg1aUowQU1qWkJYK0F0N2FPZXV0TmRSU1pubGVDMklpQy9CT2RDQ1NL?=
 =?utf-8?B?ODB1V1B0Z05yWDZYNHJyNm43SVdXTVRwdGpBdW5DWHdVUm93emtQakFFOEJj?=
 =?utf-8?B?c3U3cWM1ZS82VElnT3E4YTZZZXBsTHlOZTZiUThTOXZMRXZSM3JFaUdpVUZH?=
 =?utf-8?B?RElSWXVEOEpUdktxTWdKb2p2TkJpVk5FdjUvNXRHdXk0bGxGZitRQW9ML1Rm?=
 =?utf-8?B?UCsvYWZRVEhlUTNkb1kxaDhYeG9EMDV4T2pyU08vZHdmOWY3WGNPcVp6QXFZ?=
 =?utf-8?B?Q1NKQ2V6SGtYNklYRzVFZFZTcnZtL0xJQkswV3dmZS8xQjhjQmF0RCtwYmkw?=
 =?utf-8?B?RzI1VEJPQ3BoQTVRMHhJcHkzZnNxT3JqRlZqMDRRQUxsSVRtRDhHc3oxUk5C?=
 =?utf-8?B?VmtteUpTNHR3ZUNXaVVlbVlwTGtYblpuRWV0VUhFRHNwTGFpdlpEdy9qK3NN?=
 =?utf-8?B?bDZXRmJ4R3BhZGYvYWQrV0FNWGpVV2E2dG94TE5Pd1Y1SUVNc3RzcmxOVkZi?=
 =?utf-8?B?eE9HWU1ZOHZnM2FJUDYwUzMrYS9EQXd2YjRDWFhXcFo4YldycnZqb3YwNGtX?=
 =?utf-8?B?c0FONmxBRjdVMitOK1JJcTVkdDh2SDQxWVJ5bmlSZzdSemNCWEdlMzhmRUNo?=
 =?utf-8?B?TC8zeFVYckJ1ZzVSd0RyWHYyeEo1T0k4b1Nnc3BqbTJtcFdpTGdhVDA0WGsw?=
 =?utf-8?Q?trkwh0Mqr2QRSJc5h6Sa+jb1E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5FB6ADFC953CE40A07C7D81CC2BB5BB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TJOxBeYW+ga1xsVFbo8Wv7QaY7a0Z59cuNCFhF0dBlCA2cmUiJ0UYfVkNK1Did/tZprEDO3LYo45v4DNGjWMzhdv5nfLFHm18yiLxATNJ1++tEM3oirFtPcjzbv87QlW+HHncMIhvlzMtZA8VRhwQS4I560DFFRkYvYHlx2+vzi/VEZqZkJFLpnSFpFkUNhjJ4+fvFEZRWjeTIfttQ1VpsGifOYrSHH4EqIFmENd0lXmHfnQ3vcdLsQLQo8tPgmD3nKb5eGBYbM51nyQ0VXUk9DDEcx5eCG/HOD2YlW0MZ8aYf5/89P5u2UZVR8E9nPOp+klnM8kAePDvCdFbjZDeKP7RHnHl+gHEiFsQ3pnaX3Jaj6WpfvjPqeZ5SfaC5cMj5wP8g0okLDBXIBKdoUGwjip0eD2yYyOcIxzmCn1rJbDwbVGPKfjv/m5ksVFpTpgRg9MeuvNlHo1YBpXAKUVTzD3n2kEl/p0mLwR0TXZoO3oOWCwmtdcK9RKOVGcfRuS8N8U42oYNA5673FFecMLfQjV1SC7mX4qCKo6ozNRP+L6V5A6uXqCAYgZt2j3mui4c7KXyrKLho32PAFXUrDiM0ve8xg+GWQU9JK/22SAxSbnW+nkBDEFJ+svB1//CtsmWB26gNCRVD+prQ7hB72wpi+Xb45UQiIEffwCrXNfLgjinlxWSyn4g1UjzvH8MgIVcmk6zZXFgJF2MaISHGZu0kUNirKNiR5rlpHs9tFiVb0gUlZjKNTZnI7NdmBLLttrJi1H8UfuE65AaGXmbdYRLZPwjHR+ihUXlGVniZ4UXTabImpFlrqPG0jfY2ezmAdj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3716add-b3f4-4468-d33f-08daf251db40
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 14:57:41.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSjV6k1FP4sfLF+3jePk5NkdaZy4o6di6NP/o6BO9f3wg3udcVeeX16R0ivZjsqr4J7Nwn4BqEqyQ+3S/LjhLrQI5YY/uUWdRAlyXGf8F4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979

T24gMjEvMTIvMjAyMSAxMToyOCBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjEyLjIw
MjEgMTA6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysg
Yi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJvdC1rZXkuaA0KPj4gQEAgLTAsMCArMSw0NSBA
QA0KPj4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+ICsgKiBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9zcGVjX2N0cmwuaA0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieQ0KPj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0
aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBX
QVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICogTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZQ0KPj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+
PiArICoNCj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJ
ZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+PiArICoNCj4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjEgQ2l0cml4IFN5c3RlbXMgTHRkLg0KPj4gKyAqLw0KPj4gKyNp
Zm5kZWYgQVNNX1BST1RfS0VZX0gNCj4+ICsjZGVmaW5lIEFTTV9QUk9UX0tFWV9IDQo+PiArDQo+
PiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gKw0KPj4gKyNkZWZpbmUgUEtFWV9BRCAxIC8q
IEFjY2VzcyBEaXNhYmxlICovDQo+PiArI2RlZmluZSBQS0VZX1dEIDIgLyogV3JpdGUgRGlzYWJs
ZSAqLw0KPj4gKw0KPj4gKyNkZWZpbmUgUEtFWV9XSURUSCAyIC8qIFR3byBiaXRzIHBlciBwcm90
ZWN0aW9uIGtleSAqLw0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgcmRwa3J1KHZv
aWQpDQo+PiArew0KPj4gKyAgICB1aW50MzJfdCBwa3J1Ow0KPiBJIGFncmVlIHRoaXMgd2FudHMg
dG8gYmUgdWludDMyX3QgKGkuZS4gdW5saWtlIHRoZSBvcmlnaW5hbCBmdW5jdGlvbiksDQo+IGJ1
dCBJIGRvbid0IHNlZSB3aHkgdGhlIGZ1bmN0aW9uJ3MgcmV0dXJuIHR5cGUgbmVlZHMgdG8gYmUs
IHRoZSBtb3JlDQo+IHRoYXQgdGhlIHNvbGUgY2FsbGVyIGFsc28gdXNlcyB1bnNpZ25lZCBpbnQg
Zm9yIHRoZSB2YXJpYWJsZSB0byBzdG9yZQ0KPiB0aGUgcmVzdWx0IGluLg0KDQpUaGlzIGlzIHRo
aW5uZXN0LXBvc3NpYmxlIHdyYXBwZXIgYXJvdW5kIGFuIGluc3RydWN0aW9uIHdoaWNoDQphcmNo
aXRlY3R1cmFsbHkgcmV0dXJucyBleGFjdGx5IDMyIGJpdHMgb2YgZGF0YS4NCg0KSXQgaXMgbGl0
ZXJhbGx5IHRoZSBleGFtcGxlIHRoYXQgQ09ESU5HX1NUWUxFIHVzZXMgdG8gZGVtb25zdHJhdGUg
d2hlbg0KZml4ZWQgd2lkdGggdHlwZXMgc2hvdWxkIGJlIHVzZWQuDQoNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9ndWVzdF93YWxrLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9ndWVzdF93
YWxrLmMNCj4+IEBAIC0yNiw3ICsyNiw5IEBADQo+PiAgI2luY2x1ZGUgPHhlbi9wYWdpbmcuaD4N
Cj4+ICAjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+DQo+PiAgI2luY2x1ZGUgPHhlbi9zY2hl
ZC5oPg0KPj4gKw0KPj4gICNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPj4gKyNpbmNsdWRlIDxhc20v
cHJvdC1rZXkuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0X3B0Lmg+DQo+PiAgI2luY2x1ZGUg
PGFzbS9odm0vZW11bGF0ZS5oPg0KPj4gIA0KPj4gQEAgLTQxMywxMCArNDE1LDExIEBAIGd1ZXN0
X3dhbGtfdGFibGVzKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LA0KPj4gICAgICAgICAgIGd1ZXN0X3BrdV9lbmFibGVkKHYpICkNCj4+ICAgICAgew0KPj4gICAg
ICAgICAgdW5zaWduZWQgaW50IHBrZXkgPSBndWVzdF9sMWVfZ2V0X3BrZXkoZ3ctPmwxZSk7DQo+
PiAtICAgICAgICB1bnNpZ25lZCBpbnQgcGtydSA9IHJkcGtydSgpOw0KPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IHBrciA9IHJkcGtydSgpOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBrX2Fy
ID0gcGtyID4+IChwa2V5ICogUEtFWV9XSURUSCk7DQo+IFRoaXMgaXMgY29ycmVjdCBvbmx5IGJl
Y2F1c2UgYmVsb3cgeW91IG9ubHkgaW5zcGVjdCB0aGUgbG93IHR3byBiaXRzLg0KPiBTaW5jZSBJ
IGRvbid0IHRoaW5rIG1hc2tpbmcgb2ZmIHRoZSB1cHBlciBiaXRzIGlzIHJlYWxseSB1c2VmdWwg
aGVyZSwNCj4gSSdkIGxpa2UgdG8gc3VnZ2VzdCB0byBub3QgY2FsbCB0aGUgdmFyaWFibGUgInBr
X2FyIi4gUGVyaGFwcw0KPiBzb21ldGhpbmcgYXMgZ2VuZXJpYyBhcyAidGVtcCI/DQoNClRoaXMg
dmFyaWFibGUgYmVpbmcgbmFtZWQgcGtfYXIgKG9yIHRoZXJlYWJvdXRzKSBpcyB2ZXJ5IGltcG9y
dGFudCBmb3INCmNsYXJpdHkgYmVsb3cuDQoNCkkndmUgbWFza2VkIHRoZW0gLSBzZWVtcyB0aGUg
Y29tcGlsZXIgaXMgY2xldmVyIGVub3VnaCB0byB1bmRvIHRoYXQgZXZlbg0KYXQgLU8xLg0KDQp+
QW5kcmV3DQo=

