Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E569658D01
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 14:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469711.729121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAsbM-0000JM-Ew; Thu, 29 Dec 2022 13:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469711.729121; Thu, 29 Dec 2022 13:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAsbM-0000Gj-C7; Thu, 29 Dec 2022 13:05:40 +0000
Received: by outflank-mailman (input) for mailman id 469711;
 Thu, 29 Dec 2022 13:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAJa=43=citrix.com=prvs=3553fb73c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAsbK-0000Gb-Kb
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 13:05:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79f6b099-8779-11ed-8fd4-01056ac49cbb;
 Thu, 29 Dec 2022 14:05:34 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Dec 2022 08:05:21 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5732.namprd03.prod.outlook.com (2603:10b6:303:97::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 13:05:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 13:05:18 +0000
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
X-Inumbo-ID: 79f6b099-8779-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672319134;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jF26Rs/Axd8uVU6tvE9dsxepvZ9dAY/EuJSHHHbTo3Y=;
  b=LWc79w56Cq8XoZWQg7vU3xMf5D7oMKrR7uAiwSpi1/dOYmjfAlGYs9QC
   5lwBSHnlJtnHcrT/93QUO2qDO+RnngTfrSdczflqviWcQYmVqomWsY2It
   Sshp1wEgK04fMGZ6ir/vrZZHnXvFBwNp1sfm3o/PVhTcXT0AQ7iyRfjiS
   k=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 92941448
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3vhmEq3b4lwaRag8VfbD5TBwkn2cJEfYwER7XKvMYLTBsI5bp2ZTz
 mtJXj/QO/jYa2L9L412OYW18UsG7MCEnIRhSgU+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZkNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIjhP+
 8wqdWoxVw2cu+ft5KjlU+dpr5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1EZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKhCd5LSOHonhJsqAWx7EEiKgAEbgOQ4vzou1GGBP5kK
 GVBr0LCqoB3riRHVOLVWBm1o2WFv1gfRsBXGO057ymCz6PV50CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LH6+8iNnoEjjY2
 TGUqzM/gb5VhskOv42w9ErLhD+ErZHTQgk4oA7QWwqYAhhRYYekY8mj7gHd5PMZdYKBFADe4
 T4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsI1cFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:1zYI1qDxocGTpdLlHemq55DYdb4zR+YMi2TDtnoBLyC9F/byqy
 nAppsmPHPP5gr5O0tQ+uxoWpPgfZq0z/cci+R8AV7FZniFhILCFuFfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.96,284,1665460800"; 
   d="scan'208";a="92941448"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFCzEiz16YAKUYTMy5UaEPmEDD7l2Mg1o8CoLDE8YYwC2fgQZLX9pYmbBNVne0wDpSYuf7EFURGyKCcaIv4FWhC8sma7NfF/oquJEDbVcoOEe3LqlkpGy13ieliijw4xtTYL7AIkdwmd9zpsJnVzt7WnEj6ZVclMIjN4K6oXF4WncrRiR596ZcXyK3TehVh9283cE7efux9RMNMT8T00RrZzh59Xlm6v3UWbfArC1ahAlh39uO2NdHECKicp4mCmTSTpc1mzl4phiJfw+2ChKRMlkPchAaIE3A5ITApgCQ/rC8vG6DNdtAA80cFrc3SOiYDQQnSD5cOWWBraHpEspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF26Rs/Axd8uVU6tvE9dsxepvZ9dAY/EuJSHHHbTo3Y=;
 b=GOVnJ2SibG2xEFgIaNU7GMVx3mjt3um1+dScpbd61Pt9e01YKuiZP3ihKfoROoJhSofFPCkSgYLfhtMQIDi4wD2v5qEk3tVXWmbATb1/EgrJOZ3XCSkR/oexyAckhRjXG1q/VEb5/La9Qq7miv89bXa6jGYFmm4wjMw+EsbNRGkB+wwUemb0lDTSdcXzAtATVIdGfKrJs4rKPqDnqAoEvGDDgJ/mZisW3n4zNt9Zuf0etxUzSaHVcSvciEeQprlD0gr/HY3snQ2zBFYaIEAIypnbhDwEAmf939yhX/C/iLGzJJ61J+yLvU8EvfywSFPDUSB2mpc7CAoh/HbLrQ+4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF26Rs/Axd8uVU6tvE9dsxepvZ9dAY/EuJSHHHbTo3Y=;
 b=ZxL8uHdOz+zqoLH8PlKhOfOqRp2rS+bd6D3x8CfHu76EKCFSnBAypVZHnW+8TMMpDjKr3VeDw0c/oCrTUhCX7YvNk5lFKRST8kiQ2nlM4dibUTGyQ4Qyfbd6fFcv8bBf2TkeQyV6+X0Th58x5BsNe3TT6zC07UhOqab0z4tHrBI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v1 3/4] automation: add python3 package for
 riscv64.dockerfile
Thread-Topic: [XEN PATCH v1 3/4] automation: add python3 package for
 riscv64.dockerfile
Thread-Index: AQHZFsAO4W4uDI5cTkyDumFs2/flgK6D+jEAgACLTACAAFlngA==
Date: Thu, 29 Dec 2022 13:05:17 +0000
Message-ID: <29a98857-d575-66b5-171e-99014e92917e@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <55e2c865a0c2ab3ef405c427c0b1bcaf0abff2ab.1671789736.git.oleksii.kurochko@gmail.com>
 <24efc48f-5149-b055-7178-d21dae999f02@citrix.com>
 <b84bd12cdc343abf317a25476713b236a2403cba.camel@gmail.com>
In-Reply-To: <b84bd12cdc343abf317a25476713b236a2403cba.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5732:EE_
x-ms-office365-filtering-correlation-id: d58ca0ee-743c-4026-b77f-08dae99d5563
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CFf2V0y0VS4h7IFS430fUammzCPW2FjCZjgsOKALU1Wc8Ri+iLtWmgFMMbsm18vifXRhSPrgImpBTNXj8A6LnK3DC4ExdN/3R4LYpF48WcfbZ9TY/IwTbDfUJD1UwzRNAS+xSsPrh+QRPAGxbruZrBXAovhF+f+HjRq7y9mFLAukBZTjS6bIy+jELkGhL/bga9MSp82jSbI6JQ6gHi6GBlInJ5CSGSjeAeZ2BDeYQavqiZUs6pBtjul2K/cGD8Q/bMF7yDn7eLp413XIzsJW/qbZQ4P2NTpDCWmP9EBEt1UFBtLpVS+KQHDEGRPsut5BJmhcHIsgexNfTwO9SVFwettSlnwA1lbuvP5+RydYrvEweabhX7E4+HN/jYpkEaiqnMjVzJ3o3ZXv7lavFx4W8u7WA6YO9DPKDhl+uiNWoJWZUnCJ7EHgiu6mjBLYqmJNGc213hA7bCyK61uS+QeRSyEKSDmzJ8Zl5UTtdcaEJS1d7I0Nic6mb+F++H94+XnhNE1xY7TjBhgY0u2Y+1X6D/ZVcijNeyGI6eYp/8PVvtSwC+1yohJPsKTTpsm5NFDI+kA5ypAeJRXUy2cTDu4+GAKQb9vniYyN7urgHhB8fFYqm9xTwSt76y23YlzE0cdM0cuf3B6+/WcGMQDkBvQ92wqWvc8bz0Yg6PMoSOyY6h6U/ipefmIhc8K/+Atb0dQ5jzCfWMnYvAp2TED7rT/pWECoFq8p2Fgd3YS1U7WxQcVjQsJVaaDkBLx+54/4p7dulofl+goiFJNB8xmWDpnWpow4psXlZJla3fOgcknhojI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(82960400001)(36756003)(4001150100001)(31686004)(5660300002)(38100700002)(122000001)(8936002)(4744005)(41300700001)(2906002)(31696002)(86362001)(38070700005)(966005)(66446008)(54906003)(316002)(71200400001)(66946007)(64756008)(110136005)(66556008)(66476007)(478600001)(6506007)(76116006)(6512007)(91956017)(4326008)(8676002)(6486002)(186003)(53546011)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnZUWDZSbHhnRHBQZ2xOMlJVZmRnb29sUlVuK0NIS2FkYW9mUHkwaTFoYW9q?=
 =?utf-8?B?T0RLc0FGVXczM1RtL1k2a1BraGFTYUR0SGovWlJURGhJeFNiMm0vM1JsNHZI?=
 =?utf-8?B?a1lRVDQ1THUydkQvdmxVUGJwd0M1TkpjWUEya0M4MEMxZEI5bVVlMDlQUUJV?=
 =?utf-8?B?aTdLZHM0bVIwVTB2ZERwZGlLbGh3ZXQxU2taMVFlS3V3VE5nM3lpWmJqc3Rw?=
 =?utf-8?B?dkd3ejFXWiswclYzYlc0dWp5Yk5mWjJVZHhKYkpKaHpjbUVuWWduNmVTVDZ6?=
 =?utf-8?B?Z2x4NDNtY0JHZExNelB0bUxmUGZpSGtYcW9MZ3Bxa2VCekVoQ1dpQzNsQnBX?=
 =?utf-8?B?K0taMnlZQzROWkk1QVRXcXNqQUNGcmRzRTJ0cy9mMUNJUHArbEFaR3gzNEVm?=
 =?utf-8?B?UnhDZGNTbGxGSTFZSDlRTWoxbE5ub1VUazIzZTFaMUxYL3BMMm94U3dDbEhN?=
 =?utf-8?B?T09YR2xQay92U2JMS093WEl1MCtrYkxVdUtZNlNIYUlpYWRyQzNLaGF2MENi?=
 =?utf-8?B?TkdMZVNxZGFVdU9zK3VmeDdUd2huVmZMaGZuYUt2a2h1d2tWQkV1VFoycStm?=
 =?utf-8?B?VFkvb0x5QXQwWFZ5cnJmVHY0OHhFMnRhOTV1VHljTGtNK1l0NG9oUVZSZHJU?=
 =?utf-8?B?SHVwNS9GZGQ0bUhQd1F1TWtQWWhvaUVaYi9WRk9rNWRqc1dwS1FudmVFc3Bu?=
 =?utf-8?B?YmVkTXlYWXR2Y0N0ampabEJrb1N6TC83WUJ0Snkvbm1FL3RxaEUzN2s1VjNU?=
 =?utf-8?B?MGtpL1lqcklncHFPQm00WWZQNk12Tk1rOVpuazdyU3BPSnZUL2kxSHlZV05K?=
 =?utf-8?B?TXZ5bVFUeVlFcThoSTlGMThhT1NNaDE2T3AvNVZrOHBlVUlIeDJ6bFhnTHN2?=
 =?utf-8?B?MTRHUXJKR0ZtUEVueVlrTWxkN1J4aS9Jb295cHFKVnFtTUtUaGR4eTQ3RjFT?=
 =?utf-8?B?bjdjTGtBYmkrNnVGSnEvWGEwcStpdUZkSDUyV1krM081Ujh3U2dobWo1VDJC?=
 =?utf-8?B?ejBMRnJkQ3g5MEE3NmRxaFpXVjNQMFBTOU9UZEs3RytwbjdZckNFa2JESGJi?=
 =?utf-8?B?NDExMlBmOTlXSkNGREFYZ0d2aU4vRnpLL3JWMW93RzRPYlB0SitQUHlYUlIy?=
 =?utf-8?B?L3l3VTV1KzlTTUFOcXNxbXRFWlkzd0JkMVFpVDhuZFhYNmw0dXF1V0JjN0FC?=
 =?utf-8?B?dWk4ZXI5Tlkvelk1QzRvajREWG9sOW5rekh1MENFTWFDTE9sY2d2VmtEUS9Y?=
 =?utf-8?B?ZFFpNXN2cEZBL0FmUFY2T3l2QjRhdVM5Z1hwUnpoRy9MUU9mR0FoMVZ5L2Vu?=
 =?utf-8?B?MzlSZlF5ZERRbWJtM2pYUE5rcGg0MDAvMFJhRkZCOUVScEEya3FxS3VsZTZF?=
 =?utf-8?B?K0p1VkhMYVVmY05sUURqZGU5bWhTLzFLWmFIQ2pPWEpaN3JJcHVEbWN3ZVlj?=
 =?utf-8?B?VVE2cnhoVjV1QmVLQlhqbHpNZzlDRDRFNHFINHZaWEorbEt2SnpFaEkwb09Z?=
 =?utf-8?B?ZUNHMVUxQXorRUpFMGlYSmxRRi9tUnNUb1gvZGpiVFd6MHhoZ2ZkSWtCVmdJ?=
 =?utf-8?B?cXhac3FRTTJyclZpY3NQQXg2L1ozeHVnSlVOTmlHSFYxN2hKTXBSZ3packxN?=
 =?utf-8?B?alpDK1czNDM2aCtYOTNCTDFLVThjclFKSnd1MC9aZVpBdGlVTDk1emUrcUpG?=
 =?utf-8?B?NmgxNUdDbkRUL3cvR09Dc3BWQ2R1eEFnMDFaU1FEWTF6c083Y2xpUnlrQ0Q3?=
 =?utf-8?B?QkROdjY0RG1XaVZqR2hTS0RRNVBoaGphZFZuYmxrN09xSHVYNnQzSVMweVgx?=
 =?utf-8?B?aHU4UmZoVGNaL3F4MHVteEdqKzUvT3RwMHdvYklzb1ZzSGhLenRiUC9aSXQv?=
 =?utf-8?B?a2xBQjNHcTBNR0F0Tzk4SjBTanBlWnZSaWppc2hlTVFvQk5pa3QxUldHWjFn?=
 =?utf-8?B?Z0VROFMvWjl0eFJoaVhuUWxzWjZQbU5LRysrSDYzaktPYnRndUdOU1ZGMTU3?=
 =?utf-8?B?REl1V2xGamR2QUJFcDJaV1lKRlJJNG5YeEdKSWhoN1VJKzN5RUFBcjlRbXZr?=
 =?utf-8?B?TStOTUd1OXd2MXVNK05jajNsR2ZaeUlQbTh5dmVsTytsaUI4WE9FMERXVno3?=
 =?utf-8?Q?tg/eHttJZML0BnsNa/5hBj17J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE2C530C00E38B4099C425FC176AEA95@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58ca0ee-743c-4026-b77f-08dae99d5563
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 13:05:17.7769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ml0no2Fr/8ASay0JA+2/J7yhzONtJNhM61KEL2tmGcF1zmwV8enw/cgVJBr1JdS9BebhH21y52vKNJfHEz08eXdQKOIuGTdfxtdTOuos7Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5732

T24gMjkvMTIvMjAyMiA3OjQ1IGFtLCBPbGVrc2lpIHdyb3RlOg0KPiBPbiBXZWQsIDIwMjItMTIt
MjggYXQgMjM6MjYgKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8xMi8yMDIy
IDExOjE2IGFtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPj4+IFB5aHRvbjMgcGFja2FnZSBp
cyByZXF1aXRlZCBieSBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQNCj4+PiBzY3JpcHQgc28gaXQg
c2hvdWQgYmUgaW5zdGFsbGVkIHRvIHJpc2N2NjQgZG9ja2VyIGltYWdlDQo+PiBJcyBpdD/CoCBU
aGlzIHNlcmllcyBydW5zIGZpbmUgd2l0aG91dCBpdC4NCj4+DQo+IEl0IGlzIHVzZWQgYnkgYXV0
b21hdGlvbi9zY3JpcHRzL2J1aWxkIGhlcmU6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC9wZW9wbGUvb2xrdXIveGVuLy0vYmxvYi9zdGFnaW5nL2F1dG9tYXRpb24vc2NyaXB0cy9i
dWlsZCNMNjMNCg0KVGhhdCBsb2dpYyByZWFkcyAiaWYgKCAhcHkzIHx8ICEocHkzLnZlciA+IDMu
NSkgKSBza2lwIiBzbyBpcyBmaW5lIHdpdGgNCm5vIHB5My7CoCBTb21lIG9mIHRoZSBvbGRlciBi
dWlsZCBjb250YWluZXJzIG9ubHkgaGF2ZSBweTIuDQoNCj4NCj4gSXQgbG9va3MgbGlrZSB0aGlz
IHBhdGNoIGNhbiBiZSBza2lwcGVkIGZvciBub3cgYXMgaXQgZG9lc24ndCBhZmZlY3QNCj4gcmVz
dWx0cyBvZiBSSVNDLVYgY3Jvc3MtYnVpbGQgdGVzdC4NCg0KWWVhaCwgaXQgY2FuIGJlIGRyb3Bw
ZWQgZm9yIG5vdy4NCg0KfkFuZHJldw0K

