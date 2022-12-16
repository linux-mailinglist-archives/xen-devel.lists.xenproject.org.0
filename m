Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA664F2C7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 21:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465029.723600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6HiV-0005uD-VO; Fri, 16 Dec 2022 20:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465029.723600; Fri, 16 Dec 2022 20:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6HiV-0005sQ-SM; Fri, 16 Dec 2022 20:54:03 +0000
Received: by outflank-mailman (input) for mailman id 465029;
 Fri, 16 Dec 2022 20:54:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6HiU-0005s1-I4
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 20:54:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a6bd0a-7d83-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 21:54:00 +0100 (CET)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 15:53:55 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6986.namprd03.prod.outlook.com (2603:10b6:a03:436::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 20:53:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 20:53:49 +0000
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
X-Inumbo-ID: c2a6bd0a-7d83-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671224040;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/EBsvEOI499PfXBw7JeJBv/KuSyaexr/+L/6wbzMUCk=;
  b=S87dCJ8EEAQkc2b+Zl4LznrbmuAqXPvJRqHDlwC2NdzmT+qvwXz16ElE
   0ZpXmWvSbEEn0+b/GGRM5rKRV1XPhbwMzhar8MetswOIVgzZXER2iwLR9
   OyNEX30jt2RsM62eIgV8NIUZj6sqM2FVS5Jn4pdABx04DnwHiI0X64D0s
   4=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 88825952
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BaJDZaODoa+qTvDvrR1klsFynXyQoLVcMsEvi/4bfWQNrUpxgTMOy
 mNJWGHXP/3ZZmX9eN0lbN++80gEscXSyN9jSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5wJmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tpUGUIVz
 eBDFDkIMCusrvydz++JWOY506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efzXOhBdNPTtVU8NYtjVnD6nQoBSEodgWbnfyQ0w2GZspmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESQYKG4qZCkaTBAE6d3uvIEyiB3USt9pVqWyi7XI9SrYx
 jmLqG0ygusVhMtSj6Gjpwmf2nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:htlh/Kl78Rf8LfhvCKaG6Pxi6W7pDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWWxxjImLH4sJlON1GkcKp
 gmMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyYEUHoCbQBFrYGpe4/eIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.96,251,1665460800"; 
   d="scan'208";a="88825952"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzsFmoTqNHzNXE+AmuyfL1xoMxYu3llHkUgegnOcFhdUzT/GtIsHNJ5Se5Cl7KFabMzUy8oLSPxFon2RlWXsfU+0abFM1lqKL9tarDv+SBkkCqqpBK5zMQ6JCFPTBwp06zg1kQ09hBJr3TnzRLtYy16zn+a24wJi+B6sNjVdpM2yIq3IVDqezh6S96QOz1NtxgUBCnD399hjTENmsxIk78KDYdjzZpXOC4nRIuBsIqHSU0ROqRvPq8HZZpuZpiE/HbNhC/Vu65VFG2Sxe+rMk+QzZY8UaYRvZ9x5lQ+LLJiHXbBBLSueuow3pTnSDdRYMkTnma2qRvlhN5Mzn7r0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EBsvEOI499PfXBw7JeJBv/KuSyaexr/+L/6wbzMUCk=;
 b=P+s0L3sAeuVVUH1xUkT3whorTfWS/tVdeo4s01jEoJKuEbKH25X4VFMxh4njUuym8bpi6qnE2WPhnPefoIAlO4YDKzWk6aFkm7yKjPVU39vVWx7y1jQtlYx/Ra3SyGjqywW/LquGj1n9CXmuniFkmSf+io7E9+S7TowzIhim9eTe8jkdZUnM2dwtcxWBkWliVZZDEcB4luLfT5ejHEPi8ABG3JwxL8U/MEryXExSSNhAvdDjg2D7/s7T0ZNWHIdMFU5i88sXyscvpg479LZ4Li32DZmZdupCburjbFK1PV10RBIs+6FTxPeS4uDYYVgdGWbHa3xY/6WabSn6lP50hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EBsvEOI499PfXBw7JeJBv/KuSyaexr/+L/6wbzMUCk=;
 b=EmjJn0ihrm2oFZZFemDC8GKJDE4f/uAQf+MRyfSo4jdbq2b8Ey3E0wnfnAs/0BR2ZkxTzlTTMlCmGNgxe+O+Dn17dIB/CtBBNNiR3DoPtsvpX3cnfZ+E32b+9bB1W/+UNRzWGfHYzdfEI4o72xPsnGkS5R6GvENKVaiKgDKSBDM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Edwin Torok <edvin.torok@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Thread-Topic: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Thread-Index: AQHYrL5RUAHVMa/wUEmdRSJMkDgnS62oK2YAgMmcG4A=
Date: Fri, 16 Dec 2022 20:53:49 +0000
Message-ID: <77198021-f45c-9d75-c1da-5022d3ca99a2@citrix.com>
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
 <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
In-Reply-To: <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6986:EE_
x-ms-office365-filtering-correlation-id: f3541d1d-d26a-4961-115e-08dadfa7a20a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3fetXiDFY7ubYgwfyNmMVULQqK1Kn2rvFLzJ6C6526IYPpE0UQ5Dt1w8oiP4apad6jCsrs0dEVn1FrtJhpZhk/05hzO2KhxtuT8VImx4Ju7O0ZfAr6NUgDZ/ReCwnqTxFb1Vu6bVRXl4dRw1W9tqnrV1uFRJ3Ylc2eUb7nE8h/BOv+N7YeZsgc4a+UbAQuGpe9l7bMd5FeApVNJb4ulC9jcA3x64eixv0RCOMnxClT8RS/+FPv4VCSAwBBMiRRntHU6jVS8R+90Q15BJ4nwvx2MxoR+5Ee0u3DWAwi1dfqr/waM58DlxMG8Ykusbjrbxp7n+GTjHCcGNZvpnH2rUJSz+GX4v9oPMNfDZq6CbOAMd5DQrc9xBkAraBKy7Jscx2l87HevYkKmS/tjo/fvjGNYoGIzfZk12bG1yq1no/OZTXT5os26piPXeW1Zs8CtUhQZVQ5HADgaGCETqvb0Oav53eyJelVcRJs9KVyH3zqtQ6QEBl4Ww+GAbN5B9pR3jOQitkrEy1HkHT+9ai5+3V7QODW3n//iu1Ee5oDzTjrHJkdus0PlF4hLSD3L4Ab8I2XYKuWBVAx7QyMj1WH5hUMsBoM4b1v7dHilhUBS4iHVJswvBJD4bXmWDwhsBM1JPAgTGTCArRM0yvhKO/ygCCPXH6Ihivfr2j9sdUuYHfWDzSAM1abtcSHrkC0jb/DMMG2HQSqa6ay+XdgxWxqbstKApsAt+2+KGz1rKF7WFiaq4FY7Gya5Opxp9Pvb3C4y7U4p73CIBml5QTvIwuM2cgV/2Y2sFRXMi9uKuFSk+RPk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(122000001)(38070700005)(82960400001)(38100700002)(36756003)(31696002)(86362001)(71200400001)(54906003)(66574015)(6506007)(110136005)(53546011)(6636002)(186003)(26005)(6486002)(966005)(6512007)(316002)(2616005)(478600001)(4326008)(8936002)(31686004)(8676002)(2906002)(5660300002)(66556008)(66446008)(66476007)(66946007)(64756008)(91956017)(76116006)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTdxQkVMTE5iVHZYMWdHSmI2Q1dDM1NubDRoZTNhWHQ0S1RzVno4cTZoV1Bw?=
 =?utf-8?B?cDJPRjFMY0VMdVJscTZRVXREWUc5T3pRZlRqQ09qeC8vdXhGYjJ1T0wwL2pr?=
 =?utf-8?B?VEtBcE1OcEprdzBqa0NFTHlFTWx3UTJLSHZ2K0t1QVA5RXhsWUZ4aWY3R05W?=
 =?utf-8?B?c1pPVFFXdk84VlJuZGxzUU1KS1hjQVNvSUR0dnFJTVRwdDFqcVhtdGNybVRq?=
 =?utf-8?B?NGFzTEtiRUVqOWYyNlNuNnMxZGNCRitMNTd3MWtaV0VqSjJWTnZaOGljemU3?=
 =?utf-8?B?Rk5JdFd5WWxEdFRBSmgvcHU4QVoxeXN3aVZ6TkFYWEtTbHo5QTMzTVA0WmNr?=
 =?utf-8?B?cmhPcWZNWkFCUUg2b2lJalZUbjdwWjFGT1ArUG4vNVNMdWJIRU1mUHdXaE56?=
 =?utf-8?B?emhGTVVsVXpGc1IyU1BvRDVaTmN5SmNMenFqK1NPcU9iSGlucU9LZjFESmh5?=
 =?utf-8?B?ZHVXQjRwS3E4SFhlQkUyK25OYkZVT1lUWDQ4MGMxTHZnbldISlBoSEdWMVVX?=
 =?utf-8?B?UjZqeUdCZ2JGUXRpNkU3MXluWDhhaC8zQ3A0Q3dkSFdzQW5yVVpTR01yRlAw?=
 =?utf-8?B?MU5RRERIZGdsRHlmamQzV1V3NmdjdVFqSjhTdG96S1hhYmVwd3E2RklFY0hv?=
 =?utf-8?B?KzdITTEySnR5N2ZyeE85QXNtWGNJeDVBeE9ObjRsRWtUYUtsS0VtTkh5WjBC?=
 =?utf-8?B?dmNZWk1BVk12WEViRU9YNk9kOGFxUjBXb2pqOEhmTFdseXZycVFmM0h0YUdF?=
 =?utf-8?B?S1pJeU5lSDgvYTgxYlhaeGh5NGVuY1JqL3FaenNGemxPdTgreUdJYVhncEQw?=
 =?utf-8?B?UzN6UFEzWVIxclJ1ME56MUdhVTVabkhwTGwwOU1iL3p6QTFMNzI2dkd0WG1u?=
 =?utf-8?B?czU1akRwVWd4K25rUVhoN3FJeGx3ZkFxekQzZENiN3ZLRmROdHFoUko4OHl3?=
 =?utf-8?B?WjkzV29QYnROL3UrenpxSDNMZDE5cm5EamszK0d6dVkrTTJlL3VoMnIzN2xy?=
 =?utf-8?B?UUppY0F3b2ZvU094YzRLaGlubDNMTWdSSWxRS1NIQklKeU1GckJHSUhsT1F2?=
 =?utf-8?B?L3VteStPL1FIOVltTmMxckNUSWVWeXBtd0VQL3dGblZWL0xXRGt2NzAzWnc4?=
 =?utf-8?B?QnFlcWFOSGFaRUVPYkFSNEZkSEkyb29vRGhPQnUrTkVlR0JKK1h3U2RCRWoz?=
 =?utf-8?B?M0NidkFjNEpzdzFHdVp6L0FFcWVUMDkvVHVpZmtKY2JNcHJ0eXpSSlpSWWFR?=
 =?utf-8?B?WDA5bGRwWE1HTGFYZTRiZnRyQmtmUVNnVjhwcEwxM0tYdmFjSFpkRFFBU3BB?=
 =?utf-8?B?bFZOWWgyc2J1RFgzc3UzK2N6bkpJTlVXWjlMamZ5MU95SUc4MG1FVHoyUllu?=
 =?utf-8?B?RE56QlpOUDlOUzNURmNOcFdjNXIwUVJtNjdGT1ZUb0NFZFFJYTZiVU9zbWRR?=
 =?utf-8?B?b01NdC94djBhb3F4S0RnclBiNEFqU1cwWUZrTERmYndkTFBuMVFLYlREdzVB?=
 =?utf-8?B?dDJqWXVLaTUwb0RRcVQ1dDhNcHgwZnQvRGZoUE42Wm9IMEREY0Q0d0hROWFZ?=
 =?utf-8?B?VmFkWE1XQ3pEWFoxUVNrcHozS2xYcFgvb1Y5NWU4UG52MG1CMjVSdS9uTS9s?=
 =?utf-8?B?S1ZUYkNYbEwxMXMwZUkxbzUvemR5dStRMEtyN3puZ0VoOWRGM05DbFBJa1Vs?=
 =?utf-8?B?anpVbzhoRkRZMjRWd0t5TEh2aHA2cW1ETUVFT1BUVkNPSEVzUTNxdHZuTFV6?=
 =?utf-8?B?NmFmdmU1bnVvZENMdW9zNENGa2Q2TkRqMzVCUEF2VE4vN2J4NWxwS2F6bVIx?=
 =?utf-8?B?RXBOQmhyekFpNWlrcGNDVVgxNkFSSGQ4UkVxdE9kb3UzZXdUUjgrdTZrdVp5?=
 =?utf-8?B?T1dZK1RzNWZEdUduWE9sZjFLcDA4b2tpcFBNMlVEcU9hN2JzZ0tTQUpKN2xW?=
 =?utf-8?B?SFU4UWcyWXZLN1JLUE5DeHdyYjZwL3BjTnZMNUhYaHZSSlNRNGZKK1ZZeVJG?=
 =?utf-8?B?L05yMFU1L3NDU00xaEJpRFp5Uy9VTDROVEgveHMrMEdYcC8xdVR0cFlYem5m?=
 =?utf-8?B?RlozcXloUWU4QlNkRnVzV0VnRCtFVHNmdllLaitaOFMwMDB4VU5TVFN1WmM4?=
 =?utf-8?Q?46J5YNZIDLr9iGO13fUc8aj9u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06C09F47E49F3F46AF38298890B4F405@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3541d1d-d26a-4961-115e-08dadfa7a20a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 20:53:49.7135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCKZwCJ/veLe+ADYmxPSKaj41NOlw0q8eifIzcafIk9S8FKmKmlvk7Kl9P7r8w0TgGHE89Ykb7zDS7huoqxzV7CM7506IXzexgAPrkaM3uM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6986

T24gMTAvMDgvMjAyMiAzOjA2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDguMjAy
MiAxNTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IEZyb206IEVkd2luIFTDtnLDtmsgPGVk
dmluLnRvcm9rQGNpdHJpeC5jb20+DQo+Pg0KPj4gRm9sbG93aW5nIG9uIGZyb20gY3NldCA5Y2Uw
YTVlMjA3ZjMgKCJ4ODYvaHZtOiBJbXByb3ZlIGh2bV9zZXRfZ3Vlc3RfcGF0KCkNCj4+IGNvZGUg
Z2VuZXJhdGlvbiIpLCBhbmQgdGhlIGRpc2NvdmVyeSB0aGF0IENsYW5nL0xMVk0gbWFrZXMgc29t
ZSBlc3BlY2lhbGx5DQo+PiBkaXNhc3Ryb3VzIGNvZGUgZ2VuZXJhdGlvbiBmb3IgdGhlIGxvb3Ag
YXQgLU8yDQo+Pg0KPj4gICBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNz
dWVzLzU0NjQ0DQo+Pg0KPj4gRWR2aW4gZGVjaWRlZCB0byByZW1vdmUgdGhlIGxvb3AgZW50aXJl
bHkgYnkgZnVsbHkgdmVjdG9yaXNpbmcgaXQuICBUaGlzIGlzDQo+PiBzdWJzdGFudGlhbGx5IG1v
cmUgZWZmaWNpZW50IHRoYW4gdGhlIGxvb3AsIGFuZCByYXRoZXIgaGFyZGVyIGZvciBhIHR5cGlj
YWwNCj4+IGNvbXBpbGVyIHRvIG1lc3MgdXAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRWR3aW4g
VMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFRoZSBtYWluIGRvd25zaWRl
IGJlaW5nIHRoYXQgY2hhbmdpbmcgdGhlIGNvZGUgdG8gZml0IGluIGEgbmV3IFBBVA0KPiB0eXBl
IHdpbGwgbm93IGJlIGhhcmRlci4NCg0KV2hlbiB3YXMgdGhlIGxhc3QgUEFUIHR5cGUgY2hhbmdl
Pw0KDQpUcmljayBxdWVzdGlvbi7CoCBOZXZlciwgYmVjYXVzZSBQQVQgaGFzbid0IGNoYW5nZWQg
c2luY2UgaXQgd2FzDQppbnRyb2R1Y2VkIDI0IHllYXJzIGFnbyBpbiB0aGUgUGVudGl1bSBJSUku
DQoNCkkgcmVhbGx5IGRvbid0IHRoaW5rIHdlJ3JlIGluIGRhbmdlciBvZiBuZWVkaW5nIHRvIGNo
YW5nZSB0aGlzIGxvZ2ljLg0KDQo+IEkgd29uZGVyIGluIHBhcnRpY3VsYXIgd2hldGhlciB3aXRo
IHRoYXQNCj4gaW4gbWluZCBpdCB3b3VsZG4ndCBiZSBiZXR0ZXIgdG8gZXhwcmVzcyB0aGUgY2hl
Y2sgbm90IGluIHRlcm1zIG9mDQo+IHJlbGF0aW9ucywgYnV0IGluIHRlcm1zIG9mIHNldCAvIGNs
ZWFyIGJpdHMgKCJiaXRzIDMtNyBjbGVhciBBTkQNCj4gKGJpdCAyIHNldCBPUiBiaXQgMSBjbGVh
cikiKS4gVGhlIGNvZGUga2luZCBvZiBkb2VzIHNvIGFscmVhZHksIGJ1dA0KPiB0aGUgdmFyaWFi
bGUgbmFtZXMgZG9uJ3QgcmVmbGVjdCB0aGF0IChhbmQgd291bGQgaGVuY2UgbmVlZCB0bw0KPiBj
aGFuZ2UgaW4gc3VjaCBhbiBldmVudCkuDQoNClRoYXQgd291bGQgcmVkdWNlZCBjbGFyaXR5Lg0K
DQpUaGUgYml0cyBiZWluZyBzZXQgb3IgY2xlYXJlZCBhcmUgdHJpdmlhbCBmb3IgYW55IGRldmVs
b3BlciwgZ2l2ZW4gdGhlDQpwYXJ0aWN1bGFybHkgYmFzaWMgUkhTIGV4cHJlc3Npb25zLg0KDQpU
aGUgY29uc3RhbnQgbmFtZXMgYXJlIHdoYXQgcmVsYXRlIHRoZSBiaXQgcGF0dGVybnMgdG8gdGhl
IGRlc2NyaXB0aW9uDQpvZiB0aGUgcHJvYmxlbS4NCg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPj4gQEAgLTMwMiwyNCAr
MzAyLDQzIEBAIHZvaWQgaHZtX2dldF9ndWVzdF9wYXQoc3RydWN0IHZjcHUgKnYsIHU2NCAqZ3Vl
c3RfcGF0KQ0KPj4gICAgICAgICAgKmd1ZXN0X3BhdCA9IHYtPmFyY2guaHZtLnBhdF9jcjsNCj4+
ICB9DQo+PiAgDQo+PiAtaW50IGh2bV9zZXRfZ3Vlc3RfcGF0KHN0cnVjdCB2Y3B1ICp2LCB1aW50
NjRfdCBndWVzdF9wYXQpDQo+PiArLyoNCj4+ICsgKiBNU1JfUEFUIHRha2VzIDggdW5pZm9ybSBm
aWVsZHMsIGVhY2ggb2Ygd2hpY2ggbXVzdCBiZSBhIHZhbGlkIGFyY2hpdGVjdHVyYWwNCj4+ICsg
KiBtZW1vcnkgdHlwZSAoMCwgMSwgNC03KS4gIFRoaXMgaXMgYSBmdWxseSB2ZWN0b3Jpc2VkIGZv
cm0gb2YgdGhlDQo+PiArICogOC1pdGVyYXRpb24gbG9vcCBvdmVyIGJ5dGVzIGxvb2tpbmcgZm9y
IFBBVF9UWVBFXyogY29uc3RhbnRzLg0KPiBXaGlsZSBncmVwLWluZyBmb3IgUEFUX1RZUEVfIHdp
bGwgaGl0IHRoaXMgbGluZSwgSSB0aGluayB3ZSB3YW50DQo+IGV2ZXJ5IGluZGl2aWR1YWwgdHlw
ZSB0byBhbHNvIGJlIGZvdW5kIGhlcmUgd2hlbiBncmVwLWluZyBmb3Igb25lLg0KPiBUaGUgYWN0
dWFsIHZhbHVlcyBhcmVuJ3QgZ29pbmcgdG8gY2hhbmdlLCBidXQgcGVyaGFwcyB0aGUgYmVhc3QN
Cj4gd2F5IHRvIGRvIHNvIHdvdWxkIHN0aWxsIGJlIGJ5IHdheSBvZiBCVUlMRF9CVUdfT04oKXMu
DQoNCldoeT/CoCBXaGF0IGRvZXMgdGhhdCBzb2x2ZSBvciBpbXByb3ZlPw0KDQoicGF0IiBpcyB0
aGUgdGhpbmcgcGVvcGxlIGFyZSBnb2luZyB0byBiZSBsb29raW5nIGZvciBpZiB0aGV5J3JlDQph
Y3R1YWxseSB0cnlpbmcgdG8gZmluZCB0aGlzIGxvZ2ljLg0KDQooQW5kIEkgYnJpbmcgdGhpcyBw
YXRjaCB1cCBzcGVjaWZpY2FsbHkgYWZ0ZXIgcmV2aWV3aW5nIERlbWkncyBzZXJpZXMsDQp3aGVy
ZSBQQVRfVFlQRV8qIGNoYW5nZXMgdG8gWDg2X01UXyogYnV0ICJwYXQiIGlzIHN0aWxsIHRoZSB1
c2VmdWwNCnNlYXJjaCB0ZXJtIElNTy4pDQoNCj4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgYm9vbCBw
YXRfdmFsaWQodWludDY0X3QgdmFsKQ0KPj4gIHsNCj4+IC0gICAgdW5zaWduZWQgaW50IGk7DQo+
PiAtICAgIHVpbnQ2NF90IHRtcDsNCj4+ICsgICAgLyogWWllbGRzIGEgbm9uLXplcm8gdmFsdWUg
aW4gYW55IGxhbmUgd2hpY2ggaGFkIHZhbHVlIGdyZWF0ZXIgdGhhbiA3LiAqLw0KPj4gKyAgICB1
aW50NjRfdCBhbnlfZ3RfNyAgID0gIHZhbCAmIDB4ZjhmOGY4ZjhmOGY4ZjhmODsNCj4gVGhpcyBh
bmQgdGhlIG90aGVyIGNvbnN0YW50IHdhbnQgdG8gZ2FpbiBVTCBzdWZmaXhlcy4NCg0KRml4ZWQu
DQoNCj4gKFdoaWxlIEknbQ0KPiBvcGVuIHRvIGJlIGNvbnZpbmNlZCBvdGhlcndpc2Ugb24gdGhl
IGVhcmxpZXIgdHdvIHBvaW50cywgdGhpcyBvbmUNCj4gSSdtIGdvaW5nIHRvIGluc2lzdCBvbi4g
WWV0IGluIGNhc2UgaXQgd291bGQgZW5kIHVwIGJlaW5nIHRoZSBvbmx5DQo+IGNoYW5nZSBpbiBu
ZWVkIG9mIG1ha2luZywgaXQgY291bGQgb2YgY291cnNlIGJlIGRvbmUgd2hpbGUNCj4gY29tbWl0
dGluZy4pDQoNCkkndmUgdHdlYWtlZCB0aGUgZ3JhbW1hciBhIGJpdCwgYnV0IEkgZG9uJ3QgdGhp
bmsgdGhlIG90aGVyIGNoYW5nZXMNCndvdWxkIGJlIGFuIGltcHJvdmVtZW50Lg0KDQp+QW5kcmV3
DQo=

