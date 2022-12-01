Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14263F7EE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 20:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451123.708740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0owL-0008PY-8Q; Thu, 01 Dec 2022 19:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451123.708740; Thu, 01 Dec 2022 19:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0owL-0008Mi-4q; Thu, 01 Dec 2022 19:09:45 +0000
Received: by outflank-mailman (input) for mailman id 451123;
 Thu, 01 Dec 2022 19:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0owI-0008Mc-I5
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 19:09:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39b8849-71ab-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 20:09:40 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 14:09:37 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB7016.namprd03.prod.outlook.com (2603:10b6:8:43::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 19:09:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 19:09:35 +0000
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
X-Inumbo-ID: b39b8849-71ab-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669921780;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2t7Tbv6gOm9w6RFfcZbwNS0f8dyl8+pBVgGCgYlMgKM=;
  b=L3ido0c05nqT+4DBov+S52PeUgVLbY2Uc6ffJASRXTjSkuCH9M+0UPjh
   1iwfLQmGDGbPzAQDDPVo7g27Nr42iQrzoLNvw7WRvdgIb/Kz0eFnlujYh
   iGxV6fMu3ESCVwyM8j2yS6gYhsNmeMxDKgOmbZwvUMNe/knz/XzG/c3BM
   A=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 86119721
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Urb16A9iykSNhVW/87iw5YqxClBgxIJ4kV8jS/XYbTApGkqhTIEz
 WQcWT+FP/jeYWqmKNAgbYy/8EoAu57WnIVnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA5wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwukoOCJA1
 uwkLhcRViCqq++7w4yVRbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE1rGWxHKkAtt6+LuQ2sU6uBqt5kgqAhw4SXqbv9yVukWhcocKQ
 6AT0m90xUQoz2SLQ9/nTluHqXiLlhcGXpxbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3Oc0WDgr2
 1mhj97vQzt1v9W9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHLv4Ubnh/JCNF5H8adntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJjPZ/S3SV2OhqwZmPoisYtXy7UCBtaoRaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:iG31s6+n4Ehg7n8H7thuk+H6dr1zdoMgy1knxilNoENuA6mlfp
 GV7ZYmPEHP+VUssSkb6KC90KnpewKlyXcH2/hjAV7CZnikhILMFupfBOTZskHd8kHFh4hgPO
 JbAtlD4b7LfBpHZKTBkXaF+r8bqbHmgcTY4ts2jU0dMz2CAJsQlDuRfzzrb3GeMzM2f6bReq
 Dsn/avWQDORZ3tVKmG74U+PtQrXeegqHsYW3I77uMchjWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jU97iuqPayzz7bziv2445NkNXs59NfDIjU4/JlbgnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MNLtl+8HTYe0CyuF/I1xP72Dgjxnf+wRuzgGflo+b+WDUmYvAxwL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtlrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGBgoAv+q31Yp0AJGbdfqEwgL3J79GQpgEk86Is/r1Fop7HzuNjd3AL3Z
 WbDk0irsA9ciZfV9MJOA5Ge7rxNoWFe2O5DEuCZVvgD60JIHTLttr+56g0/vijfNgSwII1g4
 mpaiIXiYecQTOkNSSi5uwGzvn2ehTzYR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR6aLFxqvJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObonnrPbSfvrfLKfkVTwkRmT8CH
 0eWyWbHrQA0mm7HnvjxBTBUXLkfULyuZp2DajB5uAWjJMAM4Vd2zJlxGhQzamwWEp/W2wNDQ
 FDyZ/c4+uGTDONjBD1Bk1SS1NgMno=
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="86119721"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHK5bDaQOGEdS3nadntIvTkJBnuSw3DZFUkxZZRooD7qxDDshFRcW0/KYGFacLppYAtLgx3OiP7t5Iw34J2LRpE83Ppyuej0Op+0Dh5/BDVWuKxeW1l4OB8e9eTbweesH+hpPrt8yxsWSB6q4BGEo3drYB/RAVTzEbVxsbuxJOrzy4MLeG/FVVYaREqZXBa0mBuFJqR2GRYRRE4xab4BQmJnbhliuO8eFmM64lL8xS7j1cOwUitaBA0vtsfQFMcswGE4lojHM3Xd6SwzFtvqI1zikKL7vtZgX48qK/QmePaLwQ/DC/hyNy+2kc7yMI6IdLcBTFsfibBEQ/vNsC1oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t7Tbv6gOm9w6RFfcZbwNS0f8dyl8+pBVgGCgYlMgKM=;
 b=B1Cqq4SHW8dgphdvIeqwqu9DZ73Q3MiY6QvSM//3bZyTl0IhSNrGcgMwRwUwpuwNyn+KZoqrIVdFzHEPFoS8eTdYmRuhkhn+h2xf/wJKNwOPoiZk560YlS+Oz/oDnkc5xurZwkk/JNvcL39e7DDXxwU77+EwxQOn9dKW0bGyfCmatXiasbJaejUTGLvqdsdpMnu4r1kfofb69OBM0GlehAzoRspFt3T49EeTHYeI80eE04r3Y2FlZFdFUDkXrLPj+F41p2UwEJa8omAL2u4uFRJIko7mHi2xLRxUVm1YoCUIE4FWY5LIXlKMbob8RsEJKQUXG51nqj6Nl/+NbW58aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t7Tbv6gOm9w6RFfcZbwNS0f8dyl8+pBVgGCgYlMgKM=;
 b=GD8VDTMc0/pdlDhUtwaj93pKZU4A+ZRtIQP1x1gnwxvkHtA4yaauDkIxbQsbg/3vEh/XhNRxsiBQTW5D4j+J9VStUv75+UVB2hCtAgIpbF0mYHQPDErDyVmy7RQ48xS4kebtarUDX68e3r1gerIh7SgmDejDU8W9ebm4LRAP2oo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Topic: [4.17?] Re: [PATCH] x86/HVM+shim: fix build when
 !CONFIG_GRANT_TABLE
Thread-Index: AQHZBZ2nWTAZIWB6y0GC+MRiLhYZVK5ZMT6AgAAA44CAAAKIgIAAMQEA
Date: Thu, 1 Dec 2022 19:09:35 +0000
Message-ID: <a8db44d8-0cf3-790c-09a3-0dce226ec0ae@citrix.com>
References: <2ea8c3de-4967-802c-9a32-79203cd41384@suse.com>
 <261da93e-9464-8e9f-6ae2-a8f8ec466def@citrix.com>
 <8b93be0a-cca6-f1f2-2902-afcf1f8915f6@suse.com>
 <AS8PR08MB7991E47CA9036E000C00E68D92149@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991E47CA9036E000C00E68D92149@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB7016:EE_
x-ms-office365-filtering-correlation-id: 0d110454-1b93-46ba-67f8-08dad3cf95ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5yAgx0vOZz15wuit2Gpor3FaWjr1GEzVxbPGjvkrt6tNbT1nUeAq50mxRSbNN9cNnRG8V24IkwkPsNDVEl2hfR/NCecQaSEzJ/ofWitsKeiL1Eme+TyN5RbhYpea7QJJSKJUpQ1Bml7m69/UYBvexTA/klQ1Ml8zgQvqXgZzwoJxLaFDobP1Tlw0rPrLXhNTzrZwdolywDNY0W/FxDupDPpLhtuWmy7zHATRoF4NWOf085zQZbsDj7awbOdeOg6M3MP/QYrx+cB2dGcB0CUtE92nN65Bbid/RuSy+NsGBCe2FhtnJT+/DomTmKsc/PXI+hrZhBDVQ0krrEWpwzwqvqhXYU7+5buNHtqy3G6bZyo6ffRfk5MbsFxsxkPMbWDHxehi8DrhFaF05M/tfvhJStoKCe9KJp80QfPs2JnXFgKhDHW3e0REmj9LNAG/V7Pgiqt8s7RkPxsZp77eDpyLmoPJhAhHM3Zp2vPx3cEnPF5eOdxlSYvVuxcY/QThJNA20DaLdQd+ooFDJSN1A4cNm027y2sue+m1MR+4cY0E2AfY5a9owRRMa4+lMsWoNIPw4+KfCah2gTBqIbjX0OredH3zEo9xmpRarZ8ssmzVK/7FwQMDm6x4/BdvaK2cFyUo/7bB4CUD47wIZJaZ39FK7Il+TGCUw1g9x/sV75E+EVVrziRlxHvg6tHABJu9OlarWKZWT4OF+tNEqj+XBxZqev3uGqcdVKLgVjAaO2NdXMKig/udN8DpRbZdJZNT623FRVNHzBaW6UYz5IicYEtW/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(83380400001)(31686004)(71200400001)(6512007)(6506007)(110136005)(54906003)(31696002)(36756003)(6486002)(26005)(86362001)(38100700002)(38070700005)(64756008)(122000001)(2616005)(186003)(66946007)(478600001)(66446008)(53546011)(4744005)(66476007)(5660300002)(2906002)(8936002)(316002)(82960400001)(8676002)(41300700001)(66556008)(91956017)(4326008)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWhiZDBRYjE1ck1xNWYxbGhwcWhUZXBFT3BhWlg1MGNuMGpCZ0NrdUw3SEw0?=
 =?utf-8?B?dGtBZTJDWlp4aU5VRllmQUVibnFNdVg1L3NoM3I2Ky9qNVYyMEFqTDYxTjRy?=
 =?utf-8?B?OUFGWEZmWVN0OE5iTHRYTWJDUTI2YzdUQ0NrdFovV3dKMHpLMzJ5K01QYnJk?=
 =?utf-8?B?Vlk1TzFEYlFMSU1uVDBtRStWa0hreVU2dHMwTmJOdDNpVWRXQ01ZQ3psK1dQ?=
 =?utf-8?B?WmsxZGRXZ3IxbE1JMXdRQXJhcTBkb3J2UTRSSjhTNE9icG1YY1pCSnZyUTlD?=
 =?utf-8?B?bC93UWJSenBVSmJuNE1DeW5wdWdNa2N4RGlaSE94YTRtTG1vWngrYnBGNHkv?=
 =?utf-8?B?WmdXcktCdFFaVGJxV0pVaEZsdTcwbG5kRnUwNEowNDhBU0QwVTZ5WWRSNXR1?=
 =?utf-8?B?bzhJbFdlak9RT2g0a2N3VFpScFR4VHprL2FyV0x4SElySVdWU1lpd1RjM28z?=
 =?utf-8?B?RDR5UDd4REUvck5MOVowTzVSd0hPbHlBakhRNTRHcDhjM1BiVWxhMFdmYjBw?=
 =?utf-8?B?Zk8wYXpwa1NXRWQ2TGRnRngwSldkRFZ2S1VKa2tYWjN3RUFjUFdhdTJGcUgv?=
 =?utf-8?B?OWF2cHRDZFBjbHdlaGVUdEQ0Mmo3WGFTRFZnRVJwRG5wK0tlaDI1cGk0ZjJU?=
 =?utf-8?B?UFJjTmwvTmdJaHJXL085a0pRZWFFWWVodkY4a3VaWmpQVkxiYUVnK1g5Sjhi?=
 =?utf-8?B?R1R0ZTA1aVRjcmM3NUE5Vk1QVjl5TEVoWVhuU3F6Q2FJZ2kwdmdkNlZJVFRq?=
 =?utf-8?B?OFM1M2U3d3FqZnRyRU8vYTcwK1BPRk9MVHErcEU0SWdaeU04UG05Ty9FWG5Z?=
 =?utf-8?B?QVpQUUpRYXZIb1daZHRaa3lLdldiUUxON21YcFEzZS9SQzNNVXRYT25zVmtS?=
 =?utf-8?B?emNvOWlrdytsakJjM1hHdHNMNnk5YlFhTVA1OFJhQzNJajF5K3F2djV1MjhQ?=
 =?utf-8?B?eU1pYi9SQm5NTkU5RHQ2YUFaU3hHdlcrdlI3dmRxVS9KSDkyN3RuN0dKM0pT?=
 =?utf-8?B?enY3QVg0TlBrb29mY3RnRVNIZ0tlM25FMTZaVDRlRTM0MzBmSmtSZk91N0RH?=
 =?utf-8?B?KzA5dW0vQ096NVo5YW5KUlVYbHJnakhhSGE5NVdrc2oxUU0yRkgveGdMYkF6?=
 =?utf-8?B?a040UWVucEpQZi9wbXhZV2JTVjVtKzVWWVpCMDJxNi9JcUduTDhZbTEwMlBt?=
 =?utf-8?B?dHhJNTFNVnE0SjlIenloRGpkUmphSzJvQThqNFVSQzZUOVZaTC9HVXFwTUtJ?=
 =?utf-8?B?bkdQQmFDRGV1Nlo5TkhVRzlXWWMzWjJqOFZmNC9OVExNR3JHZmdwT2ppQXJ5?=
 =?utf-8?B?eE0yZG5FMm1HNks3bElJQ2o0bUkxZWd4ZkR6VmloWVllWUo1S28rS2l0dTR1?=
 =?utf-8?B?aWhPbDg2bnJzS3lRWWwwZHd1b3pOMFVDVkdick52UFhjZEw4c3RXMDVrNlVl?=
 =?utf-8?B?M1luZ2xBbkdMenJrNzdrL2V5WnFYdGZCTlN2U1NKclIxcHhqNFozUVhFS0hI?=
 =?utf-8?B?LzFnNktEL2Y1MmsxM29nYnE2VW0xRFR0Uk43QlhQVEEvR2FRT2pxWXdUdVpw?=
 =?utf-8?B?aG43UHB2VEpQUmRxMVJRTTk4Y2JzTW13Ni9ybU1jdVRRVmNyVS80QVdHazZS?=
 =?utf-8?B?Zkp6SXlUYWNZWWt6amRtQ0xzZ1hOWnhXeGJpYkZhZVFFV0w0NnFtMjJTd2h6?=
 =?utf-8?B?VG1MMlFSeitzc1Zqd0N4Rm53KzRwOTJ6eUkzSVNxOFVOUkZSZWU4cmpxc0RO?=
 =?utf-8?B?VEpEd3I1cEZSMCtSVzRtc1VUcHpML3A2MVpnbjNVZFhrQ1JycndmT3Naak9V?=
 =?utf-8?B?cnZPenVEcStNMlBYNkZIRjNxUDg1UHlpaFZzMEN1Y0xCR01hVU9xM1g4cmxL?=
 =?utf-8?B?U2VNSWZOWUlUWGR6cjZZWmpETVB5Njc5TXlaYnN2UEpValcxNUxCaVVibXcz?=
 =?utf-8?B?c2p5bEJ1YVR1aHExeUFnMUlVaUlOUklrK1M0Q25jbUdwU2RYcHBTZCtKNlEy?=
 =?utf-8?B?ODRjSDhkNXhZb2tFTkJQY3dsN1JzaHZHTmxSQ2NrQXlsbTRTb0ZIZTU5VWxv?=
 =?utf-8?B?VmZUaUZ1bVcvZG4xTXh3eGhHRlFTUGJ5RFdPV0IxakQzWHEvSGJtSm54MERO?=
 =?utf-8?Q?bGxgPDmuO4lSBeW4wqinFMSjB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C201C5E22AFE494E8BECC7CA214C59DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XyjuUfUveTPaHUOhFay+4BvdVFKUIsK4Ljit0oX56jYPYoTBgiNm2hJVgiwPSUOdDwKd5+NLuB/FanNMGrTreT3k5KSO4A7jjeAwaXZOKC8CdCHHVqC4QEUfHZXnZBn1P8cRkyXOaz24MlKg2bAnsHK5IbaxIEhLP/fnky9wdFZmXFcVGdq8IfIfwdy4zBJ9r5MPVGOxB+ibSkApw12g6Hr9M5jmvmgyVCcxhwj+Z3L++kLPrbR+ATUsfPZr6gHtdZD/pOrd7ijaJ1zUWA/2Dg53seseZQdSnBJ4RHdwG5TM7u4F64AUr9V5PiGzaizqfDTmQdEdFmsrh6Z9Z5cbiAS7FvxKh6XW4zsf5T18DBLYsykkkDLzVhUzN5ZfvjQ4MLi9bDXXgQFnNkf3MGChePUHl4mEF0rQhSaOBstzpyfRZ0uSh5MW9Y7JNy3qPRZPRF4Hxxl2Q4vF4J3jceRHkZo8PsPynj0Oe3b7sOBMcAmr79KdI/ZbP7OtmefttBpmQBAznDetkMaFTDi8o6M3kdVYuP86vQ8wxVZvvWNkPgrgeKQ1JzFn9p8HU8/PQxRdIgfyJqUtzq0bv3x9feSsPmwq3ijjpBDwdzPvjLhZmcKArOFxGXJnUk+PB3yxtqcMsPsUfqQgaF1DWhVzrTaGsRTFfyPKh+NsuP0rS3esMosWmBpOICBis7ogzvbPTfUbgzChZJBHjwqZ4bZI9IvVKT8AggqaDUQwme5RzVL13/4S0burFwkhpkRglE8lR5+JGTDsqcdVxepthF+EUUobkgUuwO7kne86UcYja4VP1L/Hxfu+MHrg9D8QY61k6h1oVZ7hNSl70KbY0NWs++YTyojPU0ilwstGkf59Ow+fp+tgW8+K+6TYF3tF9z6StbTojmwktS0pk5BzuaRn8GAdSw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d110454-1b93-46ba-67f8-08dad3cf95ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 19:09:35.3376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPgJaCUuZgJxa/JxUF9WWjlTCHND/uTjhfk5vI4h2NSZvdZNFwLTM+h3v5SwvJ17ML5eZyon4y0Y9nE1qnrD5T7slt88DgTuqgXN3zJ2GAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB7016

T24gMDEvMTIvMjAyMiAxNjoxNCwgSGVucnkgV2FuZyB3cm90ZToNCj4+PiBUaGFua3MgZm9yIGlu
dmVzdGlnYXRpbmcuDQo+Pj4NCj4+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4+IFRoYW5rcy4NCj4+DQo+Pj4gVGhvdWdodHMgYWJvdXQgaW5j
bHVzaW9uIGludG8gNC4xNz/CoCBUaGlzIGlzIGEgYnVpbGQgdGltZSByZWdyZXNzaW9uIHZzDQo+
Pj4gNC4xNi4NCj4+IEkgdGhvdWdodCB0aGlzIHdhcyBvZGQgZW5vdWdoIGEgY29uZmlndXJhdGlv
biwgYnV0IHNpbmNlIHlvdSBhc2ssIGxldCBtZQ0KPj4gZm9yd2FyZCB0aGUgcXVlc3Rpb24gdG8g
SGVucnkuDQo+IEkgdGhpbmsgYSBidWlsZCB0aW1lIHJlZ3Jlc3Npb24gc2hvdWxkIGJlIGZpeGVk
LiBXZSBjYW5ub3QgYXNzdW1lIHVzZXJzDQo+IHdpbGwgbm90IHVzZSB0aGlzIGNvbmZpZ3VyYXRp
b24gKGFzIEphbiBwb2ludGVkIG91dCBpbiBJUkMpLiBTbyBmb3IgNC4xNzoNCj4NCj4gUmVsZWFz
ZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPg0KPiBCdXQgaWYg
T1NTVGVzdCBpcyBleHBsb2RlZCBhZnRlciBtZXJnaW5nIHRoaXMgcGF0Y2gsIEkgd291bGQgbGlr
ZSB0byByZXF1ZXN0DQo+IGEgcmV2ZXJ0IHNpbmNlIHdlIGRvbid0IGhhdmUgdG9vIG11Y2ggdGlt
ZSBsZWZ0IGZvciB0aGUgZHVlIGRhdGUuIEhvcGVmdWxseQ0KPiBldmVyeW9uZSBpcyBmaW5lIHdp
dGggdGhhdC4NCg0KSXQgaXMgdmVyeSB1bmxpa2VseSB0aGF0IHBlb3BsZSBhcmUgZ29pbmcgaGF2
ZSBhIGNvbmZpZ3VyYXRpb24gbGlrZSB0aGlzDQppbiBwcm9kdWN0aW9uLg0KDQpCdXQsIHRoZSA0
LjE3IGJyYW5jaCBkb2VzIGhhdmUgR2l0bGFiIENJIHJ1bm5pbmcgb24gaXQsIGluY2x1ZGluZw0K
cmFuZGNvbmYgdGVzdHMsIHdoaWNoIHByb3ZhYmx5IGRvIHNwb3QgdGhlIGVycm9yIG9jY2FzaW9u
YWxseS4NCg0KVGhlIChJTU8gYmV0dGVyKSBqdXN0aWZpY2F0aW9uIHRvIHRha2UgaXQgaW50byA0
LjE3IGF0IHRoaXMgcG9pbnQgaXMgdG8NCmZpeCBhIENJIGZhaWx1cmUuDQoNCn5BbmRyZXcNCg==

