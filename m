Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A0640604
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451889.709692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p14Rk-0001RR-BJ; Fri, 02 Dec 2022 11:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451889.709692; Fri, 02 Dec 2022 11:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p14Rk-0001P5-8N; Fri, 02 Dec 2022 11:43:12 +0000
Received: by outflank-mailman (input) for mailman id 451889;
 Fri, 02 Dec 2022 11:43:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p14Rj-0001Ox-9S
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:43:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc4caa5-7236-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 12:43:09 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 06:43:07 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CO1PR03MB5745.namprd03.prod.outlook.com (2603:10b6:303:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 11:43:05 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 11:43:05 +0000
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
X-Inumbo-ID: 7dc4caa5-7236-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669981389;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ov+dUSP7/wgxQhDdCQltZYKiswcTZExdjyQekQCHrY4=;
  b=dxnBTJWvRzSKSZ9BMq1AxY403opoJmEmCpLIJelldcPkgsM9vLu0UfW9
   KPgXD+aBq1njDgK7UTueV/DZ4ZYyeuf82hQH21N1ml4ywEvcCIpsNXppb
   c5hMyOlC7Io85JcbVjEPZk3SN9ipkCRuRubLBg2fqNYpVF7gCQxlWXYsJ
   w=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 85268876
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GuWkoaMH8S9R18fvrR2ElsFynXyQoLVcMsEvi/4bfWQNrUohhDQDn
 2MeCGiDPq3fYWekKtBwaI3noUsH7ZWEx4JrGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0udqHUh0+
 OQiEQlOXgyGi+Ls4pe2U8A506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/Rxvza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+Sx32rCN1MfFG+3rlIrFOL2y8iMzwLeGCJiqKipRW9B90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZNYcIrnNU7Tjsr0
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAuoPnuNtr0kyJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:bxsJt6A59Ttaf2LlHemJ55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8sjzuSWE7Qr5O0tOpTnjAsi9qBrnnPYejOUs1NGZLXDbUQOTXeZfBKTZsl/d8kbFh4pgPM
 lbAtJDIey1IV9mjdvrpCmUeuxQveVuu8iT9IHjJgxWPGJXgnhbnn9E49CgYzZLeDU=
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="85268876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcSNv58n3W9/P2T8hOdiuqtMcHVQ/6HHlHjsswVQhr5LiQQ+3fkB/fvV5Hl4kIAgmC3YdLuPs0TvlLt+/TG3OS6CKEUnt7eW8tyeTYYW4OC6dW0f5+SIaewcHXEVYR3z64mK0mAcuemNOolFq3sTlYDy4ERmWj87Ot6swvaJ9Fy7l0Pc2Daa6rlBds7whDudymDaubJQSGTOkuIKlerRgAHaSg3GvpEMyp4cIypa+LE4XWb6HQWGQkFDCutGVK3gXy9YpAoaegjxLeR9XVpp7MnU8BkHl9s6sEsPyAnAdNL5WiFU/CE9UzEDuzE0iFnFruL92h2A8DbYKqudxIyodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov+dUSP7/wgxQhDdCQltZYKiswcTZExdjyQekQCHrY4=;
 b=lTpg6GsN6cDJLTSm9lkHU4w7O+RzaRRJgt7P6lG6jyGK5JKze/AH7+rZUbrSGWNq4SJ5ieusZKSN3K75dYx2wpI4f2omWgdrt9TEi5xchY/ijkqj6BHIL8vBRqjjx1e0F1oJi7U7Ga8gDS33sIfny/omQxyBD5XegCAduA5f07WG1IbDGKQQQrjTO2alSjYhDhfwqdvtdSizy8iI0F8ppUY/3F5cjRbOL4qSKQ012fUF4s9wBVN2ipX2c5NqasCIRWv54TmFcpD74FXgE6b1m0VD9Tnx1iODIctABWUAKPBpZpLyV1NhaHT7jevlUCe49yTlMmv9qMiHcaH25Ldexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov+dUSP7/wgxQhDdCQltZYKiswcTZExdjyQekQCHrY4=;
 b=GS3KCvY2+6im5mTggeTHFiZW/0jm1WUaeWEpGP5vSWzeZUbZ9jid9XOug9k7wwt8YOaTD00QIPiqX3f6NwY35vnsVoLJnEvcVRi2O2L78+UKLz1xZeeiQE+EAyjvQkedGmYKzhlue740REdVGn7Hno3XOozqM3t7+dKFkw0qspc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 2/4] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Topic: [PATCH v2 2/4] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Index: AQHZBj2LflDJ6btqj0G8mw5XievwQq5aef4A
Date: Fri, 2 Dec 2022 11:43:05 +0000
Message-ID: <71d4810b-90b4-a2fe-30f9-48a64697b551@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
 <c43ff9e8a95a73dadcd5db6ad10340a45592dd01.1669978356.git.edvin.torok@citrix.com>
In-Reply-To:
 <c43ff9e8a95a73dadcd5db6ad10340a45592dd01.1669978356.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|CO1PR03MB5745:EE_
x-ms-office365-filtering-correlation-id: b83da3ec-3bcc-4ff4-ed4e-08dad45a602a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yBXNU7F1wB4L0pXSrVw/VK4627ud8TnW3hHGB+Ma+GxxA+N1V4P0/RXh35PGq6hBfBMtP6Sel7gkyXfbxO/xk4zN5UJaazfV9jG6Rt6sGNUNLK0BxbQK4MNHpEwyJPOZt8PUmYlBbSi5tHn4Y0sdxPsE/honU/CeLbhZiePSSujWWCz2A7PS40L0F9vVNiUOTeA9Nqh6Fewp4RIDkZpKPPNIGT4gicHljILdPUaopM5csHIoiCS/UTpgXguAG8yFdjZ98THc41W0TwvYx34KfLhxhRIsnbKkaVVo/88PkyH1nmHxMPipm+RxP0uezmbrUD99UzuBiAX9GJYC7jzNWETR1FDeBSrtJ9q/Izi8cygL01IEqeSsr9InfxckzC29anuny3dK7DVk1fFkz4WbLyZBKoBxDZwml8rPEpI8K38916RQ9+9qOx9S7seEa0yoGJnYppuVusXCCgjdjSY1YYKclbrRVm0Cv/fDrlEi0iy5h2WdyeyDM2h3PVXwWHsLnrRir0qkcJzxfU39HY30CorelFT+nhjFC5G5v3YqqA2nxSWCSLlawyTuhWSNsuIZENOrBDK72hlOUn7x0idHmCz9DUrFSWydAWR1XegvIRcdzRLcoqEWjLlGaw1/FI3XdSSNvnK7M3ViMd8ATaG2F0NOFcY/83cfp9QHWjoMd6xAL7AuJvy5UGl7ACYNwaMLiUJE8qOUo2Dn2y7rGxjIEzu1OmDyitg+7cqQZVtv/hdRkMislVIdC5jaJe7zjAxyt9e1BmEuIaxJILFi0lhwjg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(26005)(186003)(66446008)(71200400001)(6506007)(53546011)(8676002)(66476007)(64756008)(66556008)(107886003)(66946007)(478600001)(91956017)(6486002)(4326008)(41300700001)(5660300002)(8936002)(83380400001)(2906002)(2616005)(76116006)(122000001)(82960400001)(36756003)(6512007)(316002)(31696002)(86362001)(54906003)(31686004)(110136005)(38100700002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDB0VTVJdlpQV0s0WTNteWtqakZYSCtGamE5RFl3YU5qcTZMZy96QkFhMzlO?=
 =?utf-8?B?eTlhdTl6UlAzdGppVHFhVWtIUDRITGVsaGtCNkRpcjhKWGxtWlV0YU1PTTNa?=
 =?utf-8?B?RFBkd2RrZVRTeENLUEc3ZjZSUTFUc3JzV1R6K05mNndmVzN1SUJsb092aHBJ?=
 =?utf-8?B?b0hkYi9QRDJzL21WbFU0cVFFVlg0aFU5ajNZZHF0Nk55NllPMVlYU2ZzWEpF?=
 =?utf-8?B?ZjlmaVplcktJTFNLVkpNSWhMUTdjN3FhZUFlN1R2RjFISEg5K1VEUW9EdC9I?=
 =?utf-8?B?YkRjdjNRVGEzdEI1TFRzL2xQeG5jaGJYOFJEcDVocGhWTHFweE8vZXRmTDdt?=
 =?utf-8?B?V0tOUEoyUWFibUM1RDNZVk8rQTRUa3BsZlBha2lBSTZFeDRrZnJOMVJOUzVL?=
 =?utf-8?B?eDVkNVlWa0JvT1ZjdUp4NWdFUjMreXNwa0F5ZlpjbHNJQ2dyTU8yTlFjajYy?=
 =?utf-8?B?dzZ2Vm5kdXpCemtBc0N1YUdTT1lBREFXRlZJNWtuSlRvNXNQRS81MkNhNUdR?=
 =?utf-8?B?clhGSCs2MEl1K1M3ZXhsejl1YXN3RHhuMTZ3QlZMUWwveVJncklqd01aL216?=
 =?utf-8?B?UlpNVTRwODhRZmp1YnlFL3daYjBVUHRpZWhEYTY1djBZd2g5dGZTSFRKSm9V?=
 =?utf-8?B?TUFhejBMdC8zemlTcnZEQmNyRGhwUkpMQU9kTnkxTmd3amxsaXE4Vzc0Mmxa?=
 =?utf-8?B?OWpYVFdnYjdJL3pjdmZ5TE5FTUY2anl4TWh4Q2hUYlNtOXo4dTZyeXA5VVVl?=
 =?utf-8?B?eGpyTlYrNTRYZktXZzBpMDRSMldibFhrNTZ5VHJ1S1d0YXE3RXVWbnFMVGpO?=
 =?utf-8?B?MCtJL2QrRzlQV1dCaU5leUQwdkFEOWFvWTJSNEpZN0xrUUhqOFBpMWk2SlJu?=
 =?utf-8?B?aG1vY0xWQ1FJTmZiS3R3cVYzUXVWTXB5MWxvRkFsWEV0T0hlTU1Ba2lXS2Nq?=
 =?utf-8?B?MFRaWWwvU0ZzUmYxc2lLS1J5Y1FOMWpESFFGSnVLV0k4RXgzL3hNNm5QU2FK?=
 =?utf-8?B?MjV2emM3WUZNVGh5QzRCcVZyL1J5MVN2ZzFZd2w3QzRNVEVzZjNRUWFLdkQy?=
 =?utf-8?B?ZGFyQ2VaNXRQckJoNFBiYVNMWE85S2k5Znl4dVhZVUFzTUVJcVNyUHhDL243?=
 =?utf-8?B?TlEzNE5DMFIyRXluVmdNbnBqMldlSG53SGx2bWUwOStpMmN6R2pKR0NyaTcz?=
 =?utf-8?B?cndUMVFjaGFDcHFzOU4xcWFsYmpYV3E4NXdjRWNQN2JJQVNBOWlYeUZVN0d5?=
 =?utf-8?B?U3RhRC81cmNNNGU4c003VFFXZlZHWlNuZlcxT3dpR1BlY2VPNm9UdmV3d3pt?=
 =?utf-8?B?LzkxUHpHZ3NqUUxRWHBiQm01dXBtWHRMcmxYTVdMaENwdVA5Ky82MzhBUVMw?=
 =?utf-8?B?NU9DSXFsSnl1R292SlNZekg2MU9nK25Rei9WbFFaNjhqQko1dXlLRlkrNDd0?=
 =?utf-8?B?aWY4ZUFuWldBcVo5QmhrOXN2czZ3YjNhQXdBanBKVkxWNWFZSDMwTW9VYmUx?=
 =?utf-8?B?cS9OUVhvY2hBWWlNZmhSa3VwV3YybHViZ1VuZ25YKzNOZjIrTjRZUnpXTC9w?=
 =?utf-8?B?NUFEcldLcGpQelVOdEEwSCtQUFhqSVRWeEg1RU4zWGV2dy8xREw1OE9BK3Yz?=
 =?utf-8?B?WUI1aTBuQWMrYjJOUUc3Y0FRYitXRy9rMytTZHZkSXk2VmlQS1NTM1FjaDJy?=
 =?utf-8?B?bXRMR2FjbFE0dlJpKy9uUEMwdGJybHlVYnJzYXlnOFc0WUozU1hlVzBKNkpN?=
 =?utf-8?B?QlNUNkllODdrQkFXcldBZUd4SGt6bllOcis5WG5GU0ViUzZtYUNBeW9tNmhQ?=
 =?utf-8?B?ZW5QMGg4NzlXK2xsVHQ4b3Iyd0c1R3pCYVlzWlo0UU1LVHF3Yko4b1ZkSWRG?=
 =?utf-8?B?Zm9CdVdpdnllamk0ZnVNcVZaZVY0aGRMUTdwV2E4NGJsVzJqRmkxNXZqRHNw?=
 =?utf-8?B?eEYzNlIrUVhjL2FrRVVpVnVlSjZXb0VTSUZkaUFUN3I1Z2NKUVNMaUhXdEpQ?=
 =?utf-8?B?YzJEL0lHdVdBU1BLek9TWHBJTDlMMDk0SlYrakR2S3hKNStDOG5sNWRVa0Uz?=
 =?utf-8?B?YnJJbUhTWEprc1pSeVoyclU4MUFJR2FVaTB1bWJZZFNNVXU2Y0FLWjZpeFJO?=
 =?utf-8?B?bEUybTkwOFc1Rm0rTytobDBPZ2puZXBmY0dUWkw2MmtKU3VrWU5qQVRoSEU3?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E3363DC8EDEB642A34B46FC61B721D0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tYTN3UY0gGW9X4gdpfsgSRPQwga8fT72EXjGuqxC14w6T67rrs2oeIYqiC98/oXeqMybGlgAY4LeVi7INZ+rkEvypOpneGCXuXlFk/Dp5JEwmc7BPsn4Lx0uu5hlcAM6RKhFBXHrltr0Oc6u6AhR7GrxmAew/wpCuVG5rK8JAksUqPSEIpEh48Tx2F2lFfxZbkuCyazlmX0jMbFsMGmuGz6Tw8wJ2g8lbqX+JXPF15HR9GJio1QUTPLC+8CzadFYOANvM9KZcOpmAyH53D+ZFtUpHpOhG4Fkm4WyRAIlFTMPfFvjlY/Rh+48xbIiOd6hVIwnNzpQPAdFV/uCgfByDPjPVoYC4wNfR7gngiarkl+Tri4pyyFRJoR8iyCsPZBo6ZVfLM9H2fnScDfx7pYKkE2bTyG5v94NUTYVg1fhEOyPMPIiZi17nlHFwyFI/altZgMPr67NwUkoTwDQK9P4lxb+keX+JJb2rk2O91ioeMnNCq5Wh9qDc8v991z8NwKFZWDxTPSaQYbLieCNjP0vwdVgviZ8gudBDegS/F6qId9j15x3tAxGispz+iAVHhIPNfoXs3Yt8wcya3qADd+92DrBGtlZCAAx4Y2qY/wceWEEgunIu+QJI+MlJq75/tL2hyQfFzpJePukGK6wnGxVcedcfxybt0i6vWYz0aaHf/ZRyK4L7/h1EtV3KqpQ1JW75lieQif+TL9VfubdBK3nitYfSRbUdMLAyL3BcA44+edKfuYhk9ZNVyBYYtUBp0n56H8iHpJdibbKmc/CcQ6czJ7A2D/jVQuHmhOU1WCS7nLdTwextL7BNGR8i1S3oRQxTcRapSY9P0UCbSBKwTm74w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83da3ec-3bcc-4ff4-ed4e-08dad45a602a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 11:43:05.1448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrrTPU9B1zYGz4JuCZBs8c5V/NBRnkxEgNz5eIf0tqQ1talRrl/1xk7gTeV5yUWSbVy/OjJI1CXzcN0yeygGMDe307m2T/usxk2Rp2mYpog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5745

T24gMDIvMTIvMjAyMiAxMDo1NSwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMNCj4gaW5kZXggZDMwNTg1ZjIxYy4uYTQ5MmVhMTdmZCAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gKysrIGIvdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gQEAgLTY0MSw2ICs2NDUsNjkgQEAg
Q0FNTHByaW0gdmFsdWUgc3R1Yl94Y19ldnRjaG5fcmVzZXQodmFsdWUgeGNoLCB2YWx1ZSBkb21p
ZCkNCj4gICAgICBDQU1McmV0dXJuKFZhbF91bml0KTsNCj4gIH0NCj4gIA0KPiArQ0FNTHByaW0g
dmFsdWUgc3R1Yl94Y19ldnRjaG5fc3RhdHVzKHZhbHVlIHhjaCwgdmFsdWUgZG9taWQsIHZhbHVl
IHBvcnQpDQo+ICt7DQo+ICsgICAgQ0FNTHBhcmFtMyh4Y2gsIGRvbWlkLCBwb3J0KTsNCj4gKyAg
ICBDQU1MbG9jYWw0KHJlc3VsdCwgcmVzdWx0X3N0YXR1cywgc3RhdCwgaW50ZXJkb21haW4pOw0K
PiArICAgIHhjX2V2dGNobl9zdGF0dXNfdCBzdGF0dXMgPSB7DQo+ICsgICAgICAgIC5kb20gPSBf
RChkb21pZCksDQo+ICsgICAgICAgIC5wb3J0ID0gSW50X3ZhbChwb3J0KSwNCj4gKyAgICB9Ow0K
PiArICAgIGludCByYzsNCj4gKw0KPiArICAgIGNhbWxfZW50ZXJfYmxvY2tpbmdfc2VjdGlvbigp
Ow0KPiArICAgIHJjID0geGNfZXZ0Y2huX3N0YXR1cyhfSCh4Y2gpLCAmc3RhdHVzKTsNCj4gKyAg
ICBjYW1sX2xlYXZlX2Jsb2NraW5nX3NlY3Rpb24oKTsNCj4gKw0KPiArICAgIGlmICggcmMgPCAw
ICkNCj4gKyAgICAgICAgZmFpbHdpdGhfeGMoX0goeGNoKSk7DQo+ICsNCj4gKyAgICBpZiAoIHN0
YXR1cy5zdGF0dXMgPT0gRVZUQ0hOU1RBVF9jbG9zZWQgKQ0KPiArICAgICAgICBDQU1McmV0dXJu
KFZhbF9ub25lKTsNCj4gKw0KPiArICAgIHN3aXRjaCAoIHN0YXR1cy5zdGF0dXMgKQ0KPiArICAg
IHsNCg0KVGhlIEVWVENITlNUQVRfY2xvc2VkIHdhbnRzIHRvIGJlIGEgY2FzZSBoZXJlLCBvdGhl
cndpc2UgaXQncyByZWFsbHkNCndlaXJkIHRvIHJlYWQgZnJvbSBhIEMgcG9pbnQgb2Ygdmlldy4N
Cg0KSXQgd291bGQgYmUgZmluZSB0byBoYXZlIGEgY29tbWVudCBsaWtlIHRoaXM6DQoNCmNhc2Ug
RVZUQ0hOU1RBVF9jbG9zZWQ6DQrCoMKgwqAgQ0FNTHJldHVybihWYWxfbm9uZSk7IC8qIEVhcmx5
IGV4aXQsIG5vIGFsbG9jYXRpb25zIG5lZWRlZC4gKi8NCg0KdG8gaGVscCBpZGVudGlmeSBtb3Jl
IGNsZWFybHkgdGhhdCB0aGlzIGEgYml0IG9mIGEgc3BlY2lhbCBjYXNlLg0KDQo+ICsgICAgY2Fz
ZSBFVlRDSE5TVEFUX3VuYm91bmQ6DQo+ICsgICAgICAgIHN0YXQgPSBjYW1sX2FsbG9jKDEsIDAp
OyAvKiAxc3Qgbm9uLWNvbnN0YW50IGNvbnN0cnVjdG9yICovDQo+ICsgICAgICAgIFN0b3JlX2Zp
ZWxkKHN0YXQsIDAsIFZhbF9pbnQoc3RhdHVzLnUudW5ib3VuZC5kb20pKTsNCj4gKyAgICAgICAg
YnJlYWs7DQo+ICsNCj4gKyAgICBjYXNlIEVWVENITlNUQVRfaW50ZXJkb21haW46DQo+ICsgICAg
ICAgIGludGVyZG9tYWluID0gY2FtbF9hbGxvY190dXBsZSgyKTsNCj4gKyAgICAgICAgU3RvcmVf
ZmllbGQoaW50ZXJkb21haW4sIDAsIFZhbF9pbnQoc3RhdHVzLnUuaW50ZXJkb21haW4uZG9tKSk7
DQo+ICsgICAgICAgIFN0b3JlX2ZpZWxkKGludGVyZG9tYWluLCAxLCBWYWxfaW50KHN0YXR1cy51
LmludGVyZG9tYWluLnBvcnQpKTsNCj4gKyAgICAgICAgc3RhdCA9IGNhbWxfYWxsb2MoMSwgMSk7
IC8qICAybmQgbm9uLWNvbnN0YW50IGNvbnN0cnVjdG9yICovDQo+ICsgICAgICAgIFN0b3JlX2Zp
ZWxkKHN0YXQsIDAsIGludGVyZG9tYWluKTsNCj4gKyAgICAgICAgYnJlYWs7DQoNCk5ld2xpbmUg
aGVyZS4NCg0KPiArICAgIGNhc2UgRVZUQ0hOU1RBVF9waXJxOg0KPiArICAgICAgICBzdGF0ID0g
Y2FtbF9hbGxvYygxLCAyKTsgLyogM3JkIG5vbi1jb25zdGFudCBjb25zdHJ1Y3RvciAqLw0KPiAr
ICAgICAgICBTdG9yZV9maWVsZChzdGF0LCAwLCBWYWxfaW50KHN0YXR1cy51LnBpcnEpKTsNCj4g
KyAgICAgICAgYnJlYWs7DQo+ICsNCj4gKyAgICBjYXNlIEVWVENITlNUQVRfdmlycToNCj4gKyAg
ICAgICAgc3RhdCA9IGNhbWxfYWxsb2MoMSwgMyk7IC8qIDR0aCBub24tY29uc3RhbnQgY29uc3Ry
dWN0b3IgKi8NCj4gKyAgICAgICAgU3RvcmVfZmllbGQoc3RhdCwgMCwgVmFsX2ludChzdGF0dXMu
dS52aXJxKSk7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgY2FzZSBFVlRDSE5TVEFU
X2lwaToNCj4gKyAgICAgICAgc3RhdCA9IFZhbF9pbnQoMCk7IC8qIDFzdCBjb25zdGFudCBjb25z
dHJ1Y3RvciAqLw0KPiArICAgICAgICBicmVhazsNCj4gKw0KPiArICAgIGRlZmF1bHQ6DQo+ICsg
ICAgICAgIGNhbWxfZmFpbHdpdGgoIlVua25vd24gZXZ0Y2huIHN0YXR1cyIpOw0KPiArDQo+ICsg
ICAgfQ0KPiArICAgIHJlc3VsdF9zdGF0dXMgPSBjYW1sX2FsbG9jX3R1cGxlKDIpOw0KPiArICAg
IFN0b3JlX2ZpZWxkKHJlc3VsdF9zdGF0dXMsIDAsIFZhbF9pbnQoc3RhdHVzLnZjcHUpKTsNCj4g
KyAgICBTdG9yZV9maWVsZChyZXN1bHRfc3RhdHVzLCAxLCBzdGF0KTsNCj4gKw0KPiArICAgIC8q
IGNhbWxfYWxsb2Nfc29tZSBpcyBtaXNzaW5nIGluIG9sZGVyIHZlcnNpb25zIG9mIE9DYW1sDQo+
ICsgICAgICovDQoNCkknZCBqdXN0IGRyb3AgdGhpcyBjb21tZW50LsKgIEl0J3MgZ29pbmcgdG8g
YmUgbWFueSBtYW55IHllYXJzIGJlZm9yZQ0KT2NhbWwgNC4xMiBkcm9wcyBvZmYgdGhlIGJvdHRv
bSBvZiB0aGUgc3VwcG9ydCBsaXN0LCBzbyB0aGlzIG9ic2VydmF0aW9uDQppcyB1bmFjdGlvbmFi
bGUuDQoNCkFsbCAzIG9mIHRoZXNlIGFyZSB0cml2aWFsIHRvIGZpeCBvbiBjb21taXQsIHNvIFJl
dmlld2VkLWJ5OiBBbmRyZXcNCkNvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gb3Ro
ZXJ3aXNlLg0KDQp+QW5kcmV3DQo=

