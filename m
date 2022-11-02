Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD9616AA3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 18:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436024.690050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqHVT-0007Iz-Ku; Wed, 02 Nov 2022 17:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436024.690050; Wed, 02 Nov 2022 17:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqHVT-0007GL-Gp; Wed, 02 Nov 2022 17:26:27 +0000
Received: by outflank-mailman (input) for mailman id 436024;
 Wed, 02 Nov 2022 17:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqHVS-0007GF-DI
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 17:26:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78fa247e-5ad3-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 18:26:24 +0100 (CET)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 13:26:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5193.namprd03.prod.outlook.com (2603:10b6:5:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 17:26:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 17:26:10 +0000
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
X-Inumbo-ID: 78fa247e-5ad3-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667409984;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EDxHCF7Nmi72tXTpt26cinldWFyy5ix/bNnqKe/wfes=;
  b=T56Qj9yWBn85tIoK7qz55X4AhT4/un1CrSI4hwdRI3yKKus4qUD5hJSj
   5WDjQ2+GonZ99ftwMimo3OZC3/XD1BCrYSFuB+jb9XD/qgUPGlLnYgMzh
   OyoKz/BRkUFk/8m8ByVkfQFQaO6K8MPWtMWTBUCc3sirY2bmwTWGSbaY8
   o=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 83122164
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nNWuIqPHDl0QRPvvrR2YlsFynXyQoLVcMsEvi/4bfWQNrUp2gzIOn
 WNKC2uGa/uCY2ujed0laIixpExXu8CAm4RhSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpB5gZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sluDGMU+
 7sWEigEPxWm2sGHxbenE/Y506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+UxHmhAdxOfFG+3sBEhASww30yMx9VanenkeWIlHahUM0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZNYcIrnNU7Tjsr0
 hmOhdyBLSNrmK2YTzSa7Lj8hRO/PzIEa1ALYyAsRBEApdLkpekOYgnnS99iFOu/iI3zEDSon
 zSS9nBi2PMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:yrtGf6n67j2QuWYj2cLdiCpo0jHpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="83122164"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8Ep+YxUgkxsMwBql+EHJKYDTTihy67ESMflEkc27Jiauv9tcdysO5JEwmQTFkEOJJpOlcj99TSF4CMz+OyJF1Idt8/HuPowLRL3bYL8pTrdLW4/eRaA5mq+f/IMiI2+jBeI941o4wKrKj2zR5CLcUnwtpBKXCD8a/rIsCxHUU30qJWKPj4p6B0T7Du65+vnWiP7deTimn14RjXpwdKfHpTn1rH5qWqIx4GAtMC7naivnxl5pako1RWgsC/TPvBsN0robtCS4OgqmGURbhEIVi9sh/m3B49sA7pPEvxPVj1S1fOqubCwmXd/+e4D5SaU9/rEbnUbalo/4OCBs5x42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDxHCF7Nmi72tXTpt26cinldWFyy5ix/bNnqKe/wfes=;
 b=TkviYj8whUrBr/9vyQfFESpbDL8oq1dsDrSoOS6VSMdmVnD0/xn+qOQ6h7QhiCclFLMx0VKefpLXuPz+sozZ1ooRm/IONDnkOMKddWZYmNyK7/YmQ8ZNRfN8yPVtaD6MQ9wh269uUhmbJR/Fj0GJ12qyHFKie7G43vjRnznZ8b8AR0xCCMCaAQ1+IeMJZtkZM/+B/WhP+MZM+jsXNO1SE2eOZBPPDg7kiiLSIdupZj3svKZ3OpQJxMFotmKzL4iYH5mbCN2RfYoRYNGY18/uRA+Nwtwz7pV0ST0fCrxh8lKvLec0MSg0ZBgPPVOB9rOKuq0xCsgcwFcTd+V1ojDEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDxHCF7Nmi72tXTpt26cinldWFyy5ix/bNnqKe/wfes=;
 b=Hd9LQY2eDZGSYYE8hXcVxdfeBMPj6saRltID3IrpiiJ1YO32iyVFIwOarGl5C8ASYhPs/rqyif4PF7AQrZMT7eAQIU5+6C5coOqJSKeFuV0Qkv+5xMQPV1uQb/Wes0SNOTXEHBsJv4kt4WjnUoShEGwMc0pUKIyC58UQGWvDhM4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Pau Ruiz Safont <pau.safont@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Further issues Re: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve
 scalability of domain_getinfolist
Thread-Topic: Further issues Re: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve
 scalability of domain_getinfolist
Thread-Index: AQHY7hvRP8qjKADr4EWYXnGWkvQZoK4r5CyA
Date: Wed, 2 Nov 2022 17:26:10 +0000
Message-ID: <a7ec99a1-7aa4-90d1-9d88-b35c4d789c4a@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1667324874.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5193:EE_
x-ms-office365-filtering-correlation-id: c69683ce-622c-46b4-9600-08dabcf75590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CBNeo5sjFtPf94+2RX7cMqr2eFRmsfUJIPg8CICCiWpgdckAzO/FZo2QkmNa4/E/IQRmfDRfVj5JQGAfBUqtN1dglljZvmFkMUXVFAC0HTCmhLLchjjWs61rMJ8xx/D6vu0kSIBnmLN0vVoLFoZSMFlCfcrwcs7Uee5b4ZFODiexVef+lofpEFnX4d9QzVhu4ny3u2+U2QvDnOZW9znI2KGc5cbJZ3e9yMeBFZ2TblgCA08aRWfB90q4ZkfTpT8cFcJwc2B0PXucKmTsnJM4CMNcZsJyEdi303veTUHUjO/uaKfvb+QItI27Tf+FMsMXj7LeG7onjxFsBw4azD7b4uvP6K5lxnBFuud+hgGJYRg5/GtLo40eZbvIGIt+LLwgyiO8POt/+8mA29qBa2jqdVEEL6O3YM264h1WeQj5MzebvBf/LKOFO0j2nT99/M7hZItC1bjTCYHJxv0ArtT0c2pN5zovrXvzcO5HosFY12D/7u0wChoV/YIpA+q/4uKucbK2JvbwDv7qqnWfFHuPRonNu6iniJmwY4nahBv8+L4+yWN5+tMERwWdha/+pCn4NGOwkRzdcY5hGW5cWCWS8wldgfzRPlm6Y6tCEik48MBEneYcropbr8CjEVUxJgtrjlE/ZXRMvjACndOaSuFN+4S7Y8N+Bjj3Ox6//6YjFEzDIta3YkunCJJ8wA6vf+BUaxV4KmDt9M/p3Flv1tT5N1IoMOz/E9stf9tbMz22wjqSqYj88FRaLNcT2MUXJVC6BXggZzj2h6IXfqn5LhuCGZKGZU31HZrExyxXOi8ujjqHyzmipA8v5o6964Emk7G7mt+B28zCNek2OyqsMIrTeg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(71200400001)(38070700005)(6486002)(478600001)(31696002)(41300700001)(91956017)(86362001)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(4326008)(8936002)(5660300002)(36756003)(83380400001)(316002)(54906003)(110136005)(31686004)(26005)(6512007)(122000001)(2906002)(82960400001)(186003)(6506007)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDNOYnUrbVFTcmt2MjBxR1hXcldqWUJUQXpHMENYS0ppdi9IdmQvYXlFUkly?=
 =?utf-8?B?MXFRTldndXVodzRJbTNmUDVrcklhcndJZ2ExWlpjQmdES20wMS9MekVVWGlT?=
 =?utf-8?B?YnhHN0IwdlF0T3ZEVG5pbFFvTlNCb2k0Q2JFek83dDVoS1JUQm5jOW5CTXU5?=
 =?utf-8?B?b3hNZ21EQkxHTVVJWnRaQTNlaGRHdTRRQWVuTUpJNjN3VlladHcvV3Nwbi9J?=
 =?utf-8?B?TDRROTg5WHllUDVKeTkxYWNPZFREOGI0bDJpU0tCL29qTU1pQVFuYVlhWkFZ?=
 =?utf-8?B?L2FZNUNCMG1GWGJNTXJYRmJKY080citJQjZkRUdhTURBTWVXL1dVMWZYWGF1?=
 =?utf-8?B?R0lqZ0x4Q2tqKzhRcXVwU2NwNncrZExTOHVEK2tKV1ZGSmh4NDd1Q2xFemo4?=
 =?utf-8?B?Vmp3eUhENnBuVnNLMkkvcGYrcVRoVzdmOFpXemVHL2h0MkFZbFNrM2xpUUs5?=
 =?utf-8?B?bGtHSzlNcW9mSXRxL1pVY0JyVkcyNnpmZTR6QVhQeHNPRjBZOWsrQnd1dkFY?=
 =?utf-8?B?K0JYUXpaNVlXUDYzbzgzYTZ1YkNWcU1WVGU1VG9sVFhEc01oRWQzU0dJY1l2?=
 =?utf-8?B?SWpmN2pvNnRZRzRiMlB3Mkp2S1M3amZEQ2dQRGdQbTRndnNPM1dRL0FYV0dG?=
 =?utf-8?B?M0hHNUs4ZHRLUGdiaHRDcGJKQk5KaFQrRVdGTFJmUndJdVBvb2UvdjJBV1FG?=
 =?utf-8?B?d0hFMEhjZFB5MzBBSjA0YmhoV1RwTnJnNVdxWEVtQW5ENnZWVHJKemZQdTZN?=
 =?utf-8?B?YzErR0lMbk0rc2ZKUHJEREZCY0c2dm5XSjlqdXFYdE8vLysyRmEzQWZDWjh6?=
 =?utf-8?B?OEdBb2pPT1NqUld3bnBVL0RrMERZSDhtU0NGVWVGbzVac2tqdUVUZWM3U091?=
 =?utf-8?B?VVZoaHVXSnFQMmhLSHlQVzJPSkVaZXlaRWdmdUpPSWFHN0dWSm5PVko2akVH?=
 =?utf-8?B?azJqVUpCdGw1KzVuTGt4Y0ZidXdrK1dka2FPREhnUWJQbk54b3duak1CeUhM?=
 =?utf-8?B?R0E2T211MmkxS1NWdzdFeGdyRzduWTQ5dCtPQjVZVDY5RTZXbVlSWWczb0dD?=
 =?utf-8?B?MjlyZno2K0NRY3RaeEpiZW51dzhmSUlwWWdrL3kvbzdSUWVMT0x2K3NXSHQx?=
 =?utf-8?B?bFRRUGhDSEVZbi9BOGY4d3pGSnkxczN6bE50NFdUZVNUSXl0dEF5RWV4N0xN?=
 =?utf-8?B?L2FjeE0rdERWRjQ2MUltZDdFVWpSL3QyMnFFaXJYc2RDWnNFRmU3dWFhdFB4?=
 =?utf-8?B?SGpFU3E4K2d2akxTd1BaUlJVQWgzakRTMEtKVjc2eWVWUVFHWC85Sjg1L1Nr?=
 =?utf-8?B?dktHMXo4Y0prS3RUZWFMU3duaXBnQ3NlZEFIVVdtSzBPR3dNazFvcmdnaXRK?=
 =?utf-8?B?ZytTRmdQWlppbXlocUNIeU84d25GUjcwWnJudkYxWFFYYis1cUc2YjM1bTgx?=
 =?utf-8?B?US90VGtpNVF2NWRNUGhVaTJjNndFTzB5S3NKbmdUay8yY0lQcVIvWG9VMFJo?=
 =?utf-8?B?d1VkMkhPOVVrSndaUHA2dnpKbXAzakdyYWZRMzBzbDRWOGpPaFlXVzQ4cGtK?=
 =?utf-8?B?bWp3ZlZvUUptSnJPbTd1S2x0QVJDT3VWaW5FOTJSNUdiRUI4Z2k0eUF2Unh1?=
 =?utf-8?B?a3NicExHL1NXWjJEcStONTZoSFBvMks5SGtVSjk2WTd2elowRHF5RDZCQXJY?=
 =?utf-8?B?VWJiZ0lWNENZSzZBck4rcTJsYkRZaVQxeGNoYWEyT2FoMjc1di8zOVJ5K0t1?=
 =?utf-8?B?c0YvT0JLdXIvam1kTzRuYjNvR0w1MVZBNlc4VnhqM3BVenJlMWpGODZUR083?=
 =?utf-8?B?bmdtWjVBRWhtZVFBTGlMRzdyZmNEcXFZSVViTTAySVAxbFJhd1VTK0xrMTVT?=
 =?utf-8?B?UGpVKzVzWjhlZGJXcUthU2FvSnNLS0ZGU29TdTlrYnpFLzdYc0tpNVNERFJ0?=
 =?utf-8?B?MFVucHNHVWJ6OVI1WHU2bG5vOE9pQWQ0b29tK0FrUEZlRnFxTHZCS2Raa2k2?=
 =?utf-8?B?MTRPemI0K25hRWlkbWJDSzF4VTZIaHFlN0pmeXdIcW1CTzFqWVB1OXdSVys0?=
 =?utf-8?B?OUF2NjFPaTZlMWNSU3BYRCt3YXFjQmxJZ0VmN05KazRkTEtmY1QzZFc3OEFa?=
 =?utf-8?Q?DODJ5yggvtNZ3avH3KrICq+wG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5075355C2ECED041B9534C8935354DD6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69683ce-622c-46b4-9600-08dabcf75590
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 17:26:10.4204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSmnx7RQWEuINbcxoomJBSQ1F32k9AyAMKZx2ChyJ93ZgAGDNixshBASWK6z5XOwmq64UW4Ki75LW6azKqZOMWZsJKTNk6f1DyQ3R4P414E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5193

SGksDQoNClRvIGJlIGNsZWFyLCB3aGF0IGlzIHByZXNlbnRlZCBoZXJlIGFyZSBjbGVhciBpbXBy
b3ZlbWVudHMgaW4gdGhlIHN0YXR1cw0KcXVvLCBhbmQgcXVhbGlmeSBmb3IgaW5jbHVzaW9uIG9u
IHRoZWlyIG93biBtZXJpdHMuwqAgQW5kIGRlZmluaXRlbHkNCnNob3VsZCBiZSBjb25zaWRlcmVk
Lg0KDQoNClRoYXQgc2FpZCwgdGhpcyBpcyBhIHN3YW1wIHdpdGggZnV0dXJlIHByb2JsZW1zLCBh
bmQgb25lIHJhdGhlcg0KZnVuZGFtZW50YWwgb25lIGluIFhlbiB3aGljaCBJIGlzIG5vdCBnb2lu
ZyB0byBiZSBlYXN5IHRvIGZpeC4NCg0KMSkgKHNpbXBsZSksIHRoZXJlIGFyZSBhIGJ1bmNoIG9m
IHN0dWJzLCBpbmNsdWRpbmcNCnN0dWJfeGNfZG9tYWluX2dldGluZm8oKSB3aGljaCBkb24ndCB1
c2UNCmNhbWxfe2VudGVyLGxlYXZlfV9ibG9ja2luZ19zZWN0aW9uKCkgd2hlbiB0aGV5IHNob3Vs
ZC4NCg0KMikgc3R1Yl94Y19kb21haW5fZ2V0aW5mbygpIHJldXNlcyB4Y19kb21haW5fZ2V0aW5m
b2xpc3QoKSBtZWFuaW5nIHRoYXQNCml0IHVzZXMgWEVOX1NZU0NUTF9nZXRkb21haW5pbmZvbGlz
dCByYXRoZXIgdGhhbg0KWEVOX0RPTUNUTF9nZXRkb21haW5pbmZvLCB3aGljaCBpcyBhIHByb2Js
ZW0gYmVjYXVzZS4uLg0KDQozKSBXaGlsZSBib3RoIG9mIHRoZXNlIGh5cGVyY2FsbHMgaGF2ZSBj
cmF6eSBBUElzIGxlYWRpbmcgdG8gbG9hZHMgb2YNCmJyb2tlbiBjYWxsZXJzLCBhdCBsZWFzdCB0
aGUgRE9NQ1RMIGhhcyBhIGZhc3RwYXRoIGZvciB3aGVuIHlvdSBzcGVjaWZ5DQphIHZhbGlkIGRv
bWlkLsKgIFRoZSBTWVNDVEwgKGFuZCBET01DVEwgc2xvd3BhdGgpIGlzIGFuIE8oTikgc2VhcmNo
IG9mDQphbGwgZG9tYWlucyBzdGFydGluZyBmcm9tIGQwIHRvIGZpbmQgdGhlIGZpcnN0IGRvbWFp
biB3aXRoIGFuIGlkID49IHRoZQ0KaW5wdXQgcmVxdWVzdC4NCg0KVGhlIERPTUNUTCBzbG93cGF0
aCBpcyB1c2VsZXNzLsKgIE5vdCBhIHNpbmdsZSBjYWxsZXIgKEkndmUgZXZlcg0KZW5jb3VudGVy
ZWQpIHdhbnRzIHRoYXQgYmVoYXZpb3VyLCB3aGVyZWFzIEkndmUgbmVlZGVkIHRvIGJ1Z2ZpeCBj
YWxsZXINCndoaWNoIGRpZG4ndCBoYXZlIGFuICImJiBpbmZvLmRvbWlkID09IGRvbWlkIiB0byBo
YXZlIG9uZSwgdG8gZ2V0IHRoZQ0Kc2VtYW50aWNzIHRoZXkgd2FudGVkLsKgIENsZWFuaW5nIHRo
aXMgdXAgd2lsbCBiZSBhIGdvb2QgaW1wcm92ZW1lbnQuDQoNCjQpIFRoZSAoYWRqdXN0ZWQpIGFs
Z29yaXRobSBpbiBwYXRjaCAxIHN0aWxsIGxvb3BzIHVudGlsIGl0IGdldHMgYQ0KcmVzdWx0IHdp
dGggbm8gZW50cmllcy7CoCBNZWFuaW5nIHRoYXQgaXQncyBzdGlsbCBnb2luZyB0byBtYWtlIG9u
ZQ0KaHlwZXJjYWxsIHRvbyBtYW55LCBzZWFyY2hpbmcgdGhlIGVudGlyZSBkb21saXN0LCB0byBy
ZXR1cm4gbm8gZGF0YS7CoCBJbg0KcHJpbmNpcGxlIHlvdSBjb3VsZCBvcHRpbWlzZSB0byBzdG9w
IGF0IGFueSBoeXBlcmNhbGwgd2hpY2ggcmV0dXJucw0KZmV3ZXIgdGhhbiB0aGUgcmVxdWVzdGVk
IG51bWJlciBvZiBkb21haW5zLCBleGNlcHQuLi4NCg0KNSkgLi4uIGlmIHlvdSBldmVyIHVzZSBt
b3JlIHRoYW4gYSBzaW5nbGUgaHlwZXJjYWxsLCBYZW4gaGFzIGRyb3BwZWQgYW5kDQpyZS1hY3F1
aXJlZCB0aGUgZG9tbGlzdCByZWFkIGxvY2ssIG1lYW5pbmcgdGhhdCB5b3UgY2FuJ3QgdXNlIHRo
ZSByZXN1bHQNCmFueXdheS7CoCBDYXVzYWxpdHkgY291bGRuJ3QgYmUgYnJva2VuIHdoZW4gZG9t
YWlucyB3ZXJlIGFsbG9jYXRlZA0Kc2VxdWVudGlhbGx5LCBidXQgd2UgaGF2ZSBhIHJhbmRvbSBh
bGxvY2F0aW9uIG1vZGUgbm93IHNvIHlvdSBjYW4NCm9ic2VydmUgdGhpbmdzIG91dCBvZiBvcmRl
ci4NCg0KVGhlIG9ubHkgc2FmZSBhY3Rpb24gaXMgdG8gYXNrIGZvciBhbGwgMzJrIGRvbWFpbnMg
aW4gYSBzaW5nbGUgZ28sIGFuZA0KdXNlIGEgc2luZ2xlIGh5cGVyY2FsbC4NCg0KfkFuZHJldw0K

