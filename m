Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE15F563A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 16:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416272.660927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og58t-0003R4-0h; Wed, 05 Oct 2022 14:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416272.660927; Wed, 05 Oct 2022 14:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og58s-0003OQ-TP; Wed, 05 Oct 2022 14:12:58 +0000
Received: by outflank-mailman (input) for mailman id 416272;
 Wed, 05 Oct 2022 14:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzUo=2G=citrix.com=prvs=27000a6ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1og58q-0003OK-IH
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 14:12:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cced22b3-44b7-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 16:12:54 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 10:12:51 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH7PR03MB7001.namprd03.prod.outlook.com (2603:10b6:510:12c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 14:12:47 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 14:12:47 +0000
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
X-Inumbo-ID: cced22b3-44b7-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664979174;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vfWwYC1WNHz3U+5VkC746WjcrAf5w5+04Q2llwdwDkw=;
  b=OffW8NNy5iAum0cMorNCX7sS9uFwHhVpiMTvkSSgQi5YrXKTimbSGGW5
   wExP2qh8IlhNPOvRRaE2xxzyb/U+o3dtAhP8EH6CPu+XMSXpqHEbCRiYo
   Er3YC0B1sIYD3Sq+JAifaKH0f+RUzXDItO2coVnphfcg9B+2fLBCiibW+
   4=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 82019272
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UtRkFK3e9KnGfPyjvvbD5S1wkn2cJEfYwER7XKvMYLTBsI5bpzMPy
 mIbDGrSOf7YZmb8f9lzPou3oEtQ6JXUn9VrQQJrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GtF5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUAprdoK3Flq
 sYyLRUIbCiE28SR8ZikH7wEasQLdKEHPas5k1Q5l3T8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7gzL4/Zti4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWDdqyP22bWncSXTYp1KU5ub2OFThFST7UoBISA4C3+Wvqzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOttIyRDEs/
 k+EmZXuHzMHmLeYU26H/7GY6za7IzEILHQqbDUBCwAC5rHLnoY3iR7eS8d5J4S8hNb1BDLYz
 iiDqW41gLB7pdEP/7W2+xbAmT3EjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTG8U
 GMsnsGf6KULEsuLnSnUGuEVRun1vbCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUKzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:sX9qw62lyOuu9OKKsUy50AqjBdJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T+c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdkDXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZ8fgHC40Qtkdlg2O
 YTtljp/6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizh6XZEFYLFcgIQD9Ad+EYsGHgj99Ic7ed
 MeRf301bJzSxe3fnrZtm5gzJiFWWkyJA6PRgw4tsmcw1Ft7QVE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTRb5hBc8aKPHHRFDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYyop
 LcS1lV3FRCNH4GMff+nKGjzyq9A1lUBV/Wu4NjDtlCy/HBrYPQQGy+oAtEqbrknx0daverKc
 pbdqgmR8MLFlGeabqh7zeOJaW6FkNuIfH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.95,161,1661832000"; 
   d="scan'208";a="82019272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9Qr2zPsKwuoev+VH2zbTe6MFgsHDfqDohmtqPZ234XWNp3PcWRfxjgXps7e0cbLUS+fFEHavjKeOiSt2oxe7uOZGmDg6e88XDT/ffQxyWy0nYeRo8OLMRudGlnEYHU1Aovng03TOTVdDoofwVtMemuzBVh5UC/cJO00BcAKUSI5gMdQVCqfoW1tg4T9zufYMXr/AfIOrvcwHwRLhJKyzEAXKJCAxr/V3FKuLW/jgD5wj2zeps+5D0TIIsW/TvesTAor6lO+950VeYwAQ6gaiv8/p2YrOLLzjBd86WqOIUbtcRYDmzE7jVpTWjjpU+RjV2YgltHhMyJKHfVgZQHCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/SCgAJIsuTkXWojpM5hjMG9JK3fFZSdJ7zRovlTxbs=;
 b=QcD36i8TNZ/f6E5j6NsXh+kICHZ/3iQuqXZhc4+/oC8od5VLBmUQVcoz9sDL39+5P8YRBFZYExPI85Xz4Vrkm+VfrtnvyFeXr68+cexAptQLRiLdX1MZ+uOd7q6nU1kxV/1Xz1i1hAmg51NUVOX8lIzBZZWjRRubsQZd9nQMbUIT6pkfSUDhwfgLv1UNvzXRWqPKXGJU39Iei2vgTxPuMtBoUCPN+VQxKESCJYjIKOYKNp5QGYvYFMZ510KDTUA7fDLSgD+5IpWgPt0Vv1zlnemwnQ6vDzINczFmGmIkY/Ja9H12TmLMsMZwdUp4fX4v1MWc/nwDDIgtXCeqok5X6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/SCgAJIsuTkXWojpM5hjMG9JK3fFZSdJ7zRovlTxbs=;
 b=trrIDMLiJqwvhqt2EfJ33BSAp+MDRnAJK3dyGTKrLlgrVtFtgRA/fXEnNrgvqrTAaQLBUkJoLI/G6jXzXKYk+5KQ9HOrKGxIx15OqpxcDN68H2Fzy3LqahWWuzhXBK2boDntV0K6q3Pzbj7neRZ/ZEkwWjY5tQJIU1Z/j+9n0kY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Oct 2022 16:12:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Message-ID: <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
 <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH7PR03MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: ced12520-dc86-42cf-3f8a-08daa6dbad83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CMUY+KN8Q4rSrx7NunwPE0JfyxknKntqEpw8cyhMzNWzd/uFV5E9p2tvYGGMW6bAgnET7s0BcwYLpOS/wEf/6bIhedy9T5gJdYjHqRS8DivVMhqdWKUxhwz5VtsBVHmLJIf29G+7Xkg8rEv6Uj1cFUGVc31CbSs5Lwia75Ihzu4Gti0RtiAwwhzvjBPkn7QVLmlKyb3+gNXCXHf/VGj8e51QI/KOO9YWvwg0maddTBciLhBnLLHT2d9XnRseJuSq1/wgFcVoVJKV98veZMSYQ6x9arcfFdfx+Rrn7w0NLjuFYGrfMCX1N8ue+G7slotTyA9xpUAUb31eORVew/V0KD7vpzJVSFlcaSG50NibCNMZFGhI6jrx8pRYDWvUfdivpIUhlLe2jd/kGuSHNrfx/mTJIoIfxix3EsIkSuUVo+KVRuG4rE0Z3BHdeSMfePXTdVjSrfC5hhz0jJtDUTKAStsroG9F27sPFdqHeiGrv6f8fmjzMuORxtWlibzvuVcWRpGLmw/QiuHWadQMZPafKH1AsqV7SMY8Ojw4KdeChCHMoHlIreYyUqcc1bNZ9xpJnCuH7xK6hZVI/eWe0xwvALb1J6HW/EPwgMOTqzWWJQ/oFFRhCZgLOW8J7CGJunMPvi/NBHzlQKiRQF9xdyLkPcXFrUOhMnCqWrPfEbbQrGIkuhNgtEa3nshkFrUcWRVHxeQAcx4BIiiPBVn2YH6KYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(6506007)(82960400001)(38100700002)(85182001)(86362001)(9686003)(6512007)(53546011)(26005)(5660300002)(4326008)(6666004)(33716001)(8676002)(66556008)(478600001)(316002)(6916009)(54906003)(66946007)(66476007)(2906002)(6486002)(83380400001)(8936002)(66899015)(186003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRRUld2dkdKbG1MOENScjh2aE9DdTJyUGRPT1ZyaUdFdlVmWjZNM2J5TlJ2?=
 =?utf-8?B?N3UwOTlRelJsQkhPdnc3KzZKai8zWng2VjRuL3hhVmV4cUIxdEYrM2ROVGRN?=
 =?utf-8?B?VTBBakU4NHQ1eU9hajAwMkZqVjc2WTF0ZFFneVk0cUhBdXVOZ1BQQWpZeklI?=
 =?utf-8?B?TmpsVVBiaElRM3V5YUIrUVE2anZxR21XR09NMC9hNWhudHRPUGx2V3dIZzBR?=
 =?utf-8?B?UzVJLzJlcWl1TXVFQm16cGdBV0NWeXA0SE9BZ09NcDkvN0V4Zk5ydmVFRkht?=
 =?utf-8?B?eWZFNUFza3l5eWtJL3g0SWRIQ0puZ2xJQ0ltWmRldmZXRzVaNXptb3BZenVS?=
 =?utf-8?B?T1RkbGN0cVRKZndDbEdBYU1ZNXJEMjAyQTI1MU41QnhsejVybm1mUFNJR0s5?=
 =?utf-8?B?MUx4WmFiWTVXUUZHT1cvL3VuemtZaDYrOWFDM0d0SExTUlFrRlBCcHg2eCta?=
 =?utf-8?B?T293YjNBdnJUWWFNam9FWFo1ZzlEbTFFQUJYK3o5WHV3b1J5NWV6bkJvZFRR?=
 =?utf-8?B?aFlSallKV3duWFZjeTkra3VFdTRXcTlpNnFaUUVIYkxHL3pCbk1BNnJEOG1h?=
 =?utf-8?B?VkpvcDNVUVU4cURsZHdmYndEWTV0SXRBT09OMDhBSlVKMnBYY0sybjRySzdi?=
 =?utf-8?B?aTloWjViQnk2NFZFSUpOR2QrV2lUQlRFcGdneGlHempLV2xHMzJhbW1xd0cr?=
 =?utf-8?B?ODJ0UkpnUXZhYURtc2xtZkpLTlI3c0Y1Z2pOS091UGladXZxTW45WXpaNDFK?=
 =?utf-8?B?WThlZjFTMHQ1bUFGOGtXVS9sSUtOcnR5VFJsdUkwMmRQc1pZZUcxL1lRU2Jh?=
 =?utf-8?B?TUFQblh4c0NqNSs2T2syV3NHWS9paFdBM0xVUlZ4djFqSlpJcEpUeFJGZUdO?=
 =?utf-8?B?MTNrTDY1WWkwTjB1bGFuTkxwYUNkRzNTSEdvMmxBTm52ajlRZTdQcXZJOWNT?=
 =?utf-8?B?S1ZXVHNNUDRoTnp5a3ZtS3lFZlgxb1R3UUE4a0s2eE9aeFFyQlovaHpHY1dv?=
 =?utf-8?B?ekJESHJKSzNzcTB3QVBYZkFvYWRrR0FUZkliMEpJcmRHc0tOaEplUnNqejcv?=
 =?utf-8?B?d25BVmxoSGgrRnoxMUxUeDdhSUZiZWNwZEZuTW5HSnVxYXBVa2tIN1B2YVo5?=
 =?utf-8?B?bzg5TW0yYVNXaVVEZVlkU01iRkRRZ3RyRXoyUzZiTVEyeGF1Rlh3Q21TMTZh?=
 =?utf-8?B?N1ZmTHR2b3FzOFJWNFNGSzdGODQzdDNQaGxReGRMb1laSG5zSE1tRVNOUWli?=
 =?utf-8?B?eGZtNzhiWllQL014NlBqWHhiY3BBbVJVVTZkNTdXR1FCaTE2cWV1UlNHSUds?=
 =?utf-8?B?MnVvcnVkR0s0VittcmdvQkVNZm5sUVdhdWJ0eVZCeit3a2szUUdaTldjeXY4?=
 =?utf-8?B?VUltVkxvQ3dwbWpGcTQxZ2IwcWFpU2lOMnc4TVIzR2lSQ0tJN2tnK0c5OS91?=
 =?utf-8?B?TDR2STF5ZisxaU9yOXFVYVlJYXNaZnR0YjZ1WU9SeFpnTDRXWlV0R1hqc3B4?=
 =?utf-8?B?OXNaWjdObzdRVkhWUTBIczlnZHp2RDM0dktHejZoOFVFS2trQndkMzBONFlr?=
 =?utf-8?B?Kys0Um41ZTl5bGJwTDdEeGE5WjFUc2FDTVNObHpuelRlZDMvNGJjWElYTmZG?=
 =?utf-8?B?TW1vRkNXVFZ5YUxmWlY1TGxnZUpUYzVidi95NmxmTUxVVmNZdVNCcEpTc2c1?=
 =?utf-8?B?SUNNdVVFdEgrWlJDTUNKL0kyRzhwRVgrbGNqR0Uzd0xPM1ByNDZUNXVJTmZs?=
 =?utf-8?B?QmRMaVJMUHFiaEs3cGhhLzFINFExQ2xOcUM3NlZYMUcwcW5DS1R4QStNdjdC?=
 =?utf-8?B?SFlrdkVUMGtzckpVeGR4N2Ztc2NIcmErclg0QWQ0NVRxbnk4c3k3eUtaaGFE?=
 =?utf-8?B?WUtybXJhdlBKT2EyZ3JVUGZYMEtjQ00xM0ZweHJiTWNSQlpKWU9RUHR1amo1?=
 =?utf-8?B?QlZNTWRxbmZHZHM5OXM3dllPTnJ5ek42aUJSMGhaTTVGMm9hejlhejQyNFJm?=
 =?utf-8?B?N1hzbzRBejhaWFRwR3BqdjFOUE5FWi9ZZDlVVVp2R1U3bVQ4YnNFL3FZeUxk?=
 =?utf-8?B?b1N5SUluQzRLbjY2d0V0OVBDS1VISUZiRllFZ2p0NlVhQmpKRlowU0RXV2pD?=
 =?utf-8?B?bkw5cmRHUS9YQWU5VDhxblVTa3BBM1RpNzYzMmt3c25hNlZsM1Nkb2JMT0Fj?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8IiYtlJufmyH56DuY/SWNzExdZzrqMVB1kM1XbyGzpbQtOet24w8gjxSGi4QMgaO39929TxL2EvEZEvadCE3MwROPpOmhhZjCHuybn0b6YKqdgq6loErsvsz2RWE2uELbgrFfLTwSVnXs/2LuyeYNZi7ag2sF1sIJyxZEvwqL+D6AitiP2ROSmJFCLMKf9J/nss6tsihXWzHSkSVo025C8q4gEI9CE048kBOh37j8f+5j1RcJiPdiRdaZQMx+kPdV+/Ctvs8LvhqefXw8iYbVshnEZawLNcWIJm+/jcuAiB3PphMAN2y2501YFFYc+bOrVIolhIbJKRIeEtvN3K85Uh/HoGxz2p1LVCRYL8LSq0L9Jf02tvHBaVT38vlIaSVw+o00NiO4KBQYQ2rsOTp6PCzFZetPfCKk3/uQeOA0GqkCDnnKOPV0/0I9S+sXVT/0OPJgGyz4U4CeBcGxNgJzkgGzJ748L8PcSpFbRjFYQ08oa6L05MT42kdcRgnyryUFcRN8Vaa0Gh1yVuXW4v5U917YbBNiMK5dGmZgUtInbhlVVDMFc/Jq+LWyG+lfLMFW1ys6IZ0lpAK5P1cn+W1ri+MPWnSyMVb+8eueyUoga7JBDhv1uQ7Yvm210CohYvAaMHIJ/83uM+Wn7mG5Cbd9KevGo4Z7EbeFZR7GyivrXr7SAtzeUou/wNeAkd3juGYhZchjTmDL1wWpP6T3R2yXrEy2gWcxNdJYCvEnn1ptu3jKlcZrNmqk6F3lxiCWKEoEZPG7/X8H/j18xoY88L3sXYdjNgtIqlzVXwFpdgF9Zm0BzJKGh9ISKQpRH00ztlvwswmsKQwvolDUyBPxoXEoqMkf5hDEuoV8wYlZPW9UlWgV6xYHyrwXNyDDYHCTIMkxT9iYbJfy1yDFOIt0YFAS42Ami/mr/G+jKQy+O5AgeY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced12520-dc86-42cf-3f8a-08daa6dbad83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 14:12:46.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xow+R5kSSNsV53MUlxQ4rgI8iCdj2hgXpe8TxSCI69EqTNoQjRdkjU5vC4JEKGzH1iyi6GrMoJWSo5w2jUw/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7001

On Wed, Oct 05, 2022 at 10:53:38AM +0200, Jan Beulich wrote:
> On 05.10.2022 10:37, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 06:11:50PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 17:36, Roger Pau Monne wrote:
> >>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> >>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas used by
> >>> EFI firmware.
> >>>
> >>> The current parsing of the EFI memory map is translating
> >>> EfiMemoryMappedIO to E820_RESERVED on x86.  This causes issues on some
> >>> boxes as the firmware is relying on using those regions to position
> >>> the BARs of devices being used (possibly during runtime) for the
> >>> firmware.
> >>>
> >>> Xen will disable memory decoding on any device that has BARs
> >>> positioned over any regions on the e820 memory map, hence the firmware
> >>> will malfunction after Xen turning off memory decoding for the
> >>> device(s) that have BARs mapped in EfiMemoryMappedIO regions.
> >>>
> >>> The system under which this was observed has:
> >>>
> >>> EFI memory map:
> >>> [...]
> >>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> >>> [...]
> >>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> >>>
> >>> The device behind this BAR is:
> >>>
> >>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> >>> 	Subsystem: Super Micro Computer Inc Device 091c
> >>> 	Flags: fast devsel
> >>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> >>>
> >>> For the record, the symptom observed in that machine was a hard freeze
> >>> when attempting to set an EFI variable (XEN_EFI_set_variable).
> >>>
> >>> Fix by allowing BARs of PCI devices to be positioned over reserved
> >>> memory regions, but print a warning message about such overlap.
> >>
> >> Somewhat hesitantly I might ack this change, but I'd like to give
> >> others (Andrew in particular) some time to voice their views. As
> >> said during the earlier discussion - I think we're relaxing things
> >> too much by going this route.
> > 
> > Another option would be to explicitly check in efi_memmap for
> > EfiMemoryMappedIO regions and BAR overlap and only allow those.  That
> > would be more cumbersome code wise AFAICT.
> 
> Indeed there's a question of balancing well here, between two outcomes
> neither of which is really desirable.

Hm, I have the following diff attached below which is more limited,
and not so bad I think.  Initially I wanted to introduce an
efi_all_mapped() helper, but that would require exposing EFI_MEMORY_TYPE
which is quite intrusive.

Let me know if you think the proposal below is better and I will
formally send a patch with it.

Thanks, Roger.
---
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..c8e1a9ecdb 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -57,14 +57,4 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
-static inline bool pci_check_bar(const struct pci_dev *pdev,
-                                 mfn_t start, mfn_t end)
-{
-    /*
-     * Check if BAR is not overlapping with any memory region defined
-     * in the memory map.
-     */
-    return is_memory_hole(start, end);
-}
-
 #endif /* __X86_PCI_H__ */
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578..c3737e226d 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -4,6 +4,7 @@
  * Architecture-dependent PCI access functions.
  */
 
+#include <xen/efi.h>
 #include <xen/spinlock.h>
 #include <xen/pci.h>
 #include <asm/io.h>
@@ -98,3 +99,28 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
     return rc;
 }
+
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    /*
+     * Check if BAR is not overlapping with any memory region defined
+     * in the memory map.
+     */
+    if ( is_memory_hole(start, end) )
+        return true;
+
+    /*
+     * Also allow BARs placed on EfiMemoryMappedIO regions in order to deal
+     * with EFI firmware using those regions to place the BARs of devices that
+     * can be used during runtime.  But print a warning when doing so.
+     */
+    if ( !efi_all_runtime_mmio(mfn_to_maddr(start),
+                               mfn_to_maddr(mfn_add(end, 1))) )
+        return false;
+
+    printk(XENLOG_WARNING
+           "%pp: BAR [%#" PRI_mfn ", %#" PRI_mfn "] overlaps reserved region\n",
+           &pdev->sbdf, mfn_x(start), mfn_x(end));
+
+    return true;
+}
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866..b69c710ce3 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -78,6 +78,30 @@ bool efi_enabled(unsigned int feature)
     return test_bit(feature, &efi_flags);
 }
 
+/*
+ * This function checks if the entire range [start,end) is contained inside of
+ * a single EfiMemoryMappedIO descriptor with the runtime attribute set.
+ */
+bool efi_all_runtime_mmio(uint64_t start, uint64_t end)
+{
+    unsigned int i;
+
+    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
+    {
+        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
+        uint64_t len = desc->NumberOfPages << EFI_PAGE_SHIFT;
+
+        if ( desc->Type != EfiMemoryMappedIO ||
+             !(desc->Attribute & EFI_MEMORY_RUNTIME) )
+            continue;
+
+        if ( start >= desc->PhysicalStart && end <= desc->PhysicalStart + len )
+            return true;
+    }
+
+    return false;
+}
+
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
 
 struct efi_rs_state efi_rs_enter(void)
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f9..f29ea1a320 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -45,6 +45,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
 
+bool efi_all_runtime_mmio(uint64_t start, uint64_t end);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_EFI_H__ */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5975ca2f30..64995fc68d 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -211,6 +211,7 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
 
 void pci_intx(const struct pci_dev *, bool enable);
 bool_t pcie_aer_get_firmware_first(const struct pci_dev *);
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
 struct pirq;
 int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);


