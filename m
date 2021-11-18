Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE6455F20
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227464.393409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj4J-0000Dx-L4; Thu, 18 Nov 2021 15:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227464.393409; Thu, 18 Nov 2021 15:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnj4J-0000At-Hl; Thu, 18 Nov 2021 15:11:19 +0000
Received: by outflank-mailman (input) for mailman id 227464;
 Thu, 18 Nov 2021 15:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnj4I-0000An-M6
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:11:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c64d4e85-4881-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 16:11:16 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AICbJn0018398;
 Thu, 18 Nov 2021 15:11:12 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdp9ph1fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 15:11:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3470.eurprd03.prod.outlook.com (2603:10a6:803:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 15:11:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 15:11:07 +0000
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
X-Inumbo-ID: c64d4e85-4881-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3aiC2WPGVSkzhjkn79WCGyqQqmQ+acXkZYVbnDy2Da+NxT3yKSY4rddJ5aRTIC9rYFBZKn4oA9QI7CjWaikABrvuzYDryh/t2GxGNrgA6ts6joO6sDQNXE7JKrgeOIotNBSunCEnuxAco/yJ4ZvR6fz1K17DvZHc7EZ2Bx/sC+5P51EgYSUVMk3LUrJUsR6zafX7CpQQE2MGfruDVsukCa5fuddz75W3ZtkOciHBieuPFWXRC1ZsvS3xD5QWoT4YalEl/IWIyzgYDoDoCoMh4fvt72mFre6k27XD6VA0vypBnahEJKLYBa/wHMKX4YBLBJLeuFYHC5f4Kibbd3i7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13WsbcRt1o1jEhSqQDz7SEJwBOC96YHsyu/KpgELDf0=;
 b=dhc7GN5P+ThkNkD6gpYkB13xv2BW9APe2kWuvAIccRj27WL3MPYHhG276qfT/eUVwMae2hDNdtgykX7GZMpanisgtBTAIN9qSz6S6Y3+DjxOA5B3mocuuoHfIKMbuwKjBuzjGRT8j1vaZ7Rikgzy7ti42IUUFmzRCOAqIXLrO9V8Gr5DvLW8ZRbLDP+jj0m6OGAPCKrGIMyFEbHKcdVAujoohevaK+OI5dcnSTvLtZO96ltePmdqio4jaq+Dgwz/HK6ynfivmgoh73yAm9ZxgnEj4XYMUuLUC3gLX4UtcNzfN63crT0DAhM6RSNHNASDsPu68BM3Qc2MB5iv1j1t+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13WsbcRt1o1jEhSqQDz7SEJwBOC96YHsyu/KpgELDf0=;
 b=FwSz2CrBP+g+fmsoZ0sODLusQywKbW5IFVz7rESamga0EEJTOsSLEesFbJ/oEmlMTn5WBRxTbQMwBEQq/Imh/hgC3ayoaDF1LQHY5vzblfM/GwtHJhjwfSG0BWiKnRKNySJOznTyVrow7pVN6xOhQfQaZNozKPmSbrn4QItc6Ij3JnB8ubucnBmkFCL6sP4gJfydsocU6uDlvIo6YWhCxtyZg3M9QRj908SFoOmjbRPHaYgeVu1lFzdkuCaf1lHD6dwUH8ux/NZmURasdCo8OTegRaj2stoXEXqdWX6Np/u0eXrVyxRkqXs5rMu1zSDANaZXU5Vmmw71LVvmCFa1Sg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAA==
Date: Thu, 18 Nov 2021 15:11:07 +0000
Message-ID: <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
In-Reply-To: <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6576ca7-6f12-4580-d574-08d9aaa5a5a9
x-ms-traffictypediagnostic: VI1PR0302MB3470:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3470D8D3AFF498968B3CC3FBE79B9@VI1PR0302MB3470.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cuj7xPq/t42lQBW5NZyH5kSwPl9BhFx5Y/GPMVOQP8rjN+AWWJxnjyPiHx2dm1golz1Vq6NiboQjio03PtyDhXctCp7WeZh453ZU1NxM5fqtc4YM5ryTmDqat/k18PDGqC5un03L5//V4hUPp8qKBf3ezyizQeBGooCzrmDAxSY0zODbkC7fTe2XpIvrQ4HGZje+Hr4GMdaotJVRfTYlfxHNuG0xOmPpy1GxaFoMe269PiPTQLdhhlibkLAfLNFm/G8MKb+nPahQ83ROzNIi/xtFOYUSdj8co31UrbFu32GcEMt+OSJkRMiv532iTxpxEkjoWpeU1jqfmDn9PeRR4e9UYDiNTNvCogCFTM7N8C+3c+xD02hv9YDjhP9rFiHnEdAhmZ18Ow9cPf1PjH+tj0pF1NmUvKW3yae2sCpNFlMdYngFTC8sDV3YRS0gK4m+auyUQ0p6fjqrfSZ3/lDXer1phDuFfMFlv1tW/MhCQEUaGnl1CnglxcCnbqM50vXGbf6LWipkIoR6TPZQFozuym8HUnff3fQhiDHoNf+MSye3LGXgR/Qqf/fsP3TkTD1DWyth29GKaGflQbIu1lWJbrZhOXsDl2MCzXPPAAhLkZZazW2L2JsCUpW1ECoJWfLjy8ueuL+IbkjsXA79IulmuBbrUrffgUCFwx3/qun25TP2W8/WQqO1VlBJk3iGu4hjVhhvodIvJ/gYtTX5p5vMJO5IfKTSSKVcRsUSdS/6nRkvv7KysC0JcRUtlSeBDobN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66556008)(6916009)(6512007)(76116006)(71200400001)(26005)(64756008)(66476007)(91956017)(66446008)(508600001)(8676002)(186003)(83380400001)(36756003)(54906003)(122000001)(8936002)(38100700002)(6486002)(86362001)(7416002)(31686004)(107886003)(38070700005)(2616005)(5660300002)(6506007)(2906002)(53546011)(4326008)(31696002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3pWWXd5SW5KaGxEcFplcXJINmVrckVvRG9XdmhnMXpCcXFiV3JnNG5seXRJ?=
 =?utf-8?B?Nm96RXREMi90U0ZxUnNzMDBtUEtQUVliWGJNcmFnenZuR2JiQ1h0UUdCYzh1?=
 =?utf-8?B?SEczWExXRU9MNlBiSHN1cXRZRWVmLzluWWNTRFVFTUJzdWllSFVpYmNxNXFH?=
 =?utf-8?B?SHFZekcyeCtUNEhHMk9kOUxkRDJEQUxTZnVkdkZVMUNGeW9VTFE4blRLS0FV?=
 =?utf-8?B?YkJxbGJJbjhpWW9PaGtOTHR3QmxEbkd6TnpXaGwxUi9wVmZ3dVhLS2hWSFFa?=
 =?utf-8?B?cURQZFJkVzVuV3lGT0J5QTg5RlJzTVRaR3AxVHArTnZ0eHloem9rcmFqRWht?=
 =?utf-8?B?OUUwVU51Q1RMR3haTVN6Q1BkRi9YYXBnT0Fib3ZRNjRYeEphaGkwTHhiOHgv?=
 =?utf-8?B?SUE1ekVlNXZOUzlxQVB6QVV6S2wzUExIYzd6UXFsbDdvdlRYeHA1Q2hudzFN?=
 =?utf-8?B?cUVVTmVhcTdpbFVVMnhJNjJVYTcxZUhOWkxHSHB4S2JLZ0NRSlU3MURsNTdw?=
 =?utf-8?B?Wi85bWI5ZTBpT2VwSmhJR2FjTThXWVpyTG1KSkdTZE9sWHBaOHlBcUNYNk5m?=
 =?utf-8?B?cUFzUCtkQUxxeUxzdXlhWTMrdTdFWWFVNk1MTnQ3UHk5WlZFSmJGNUZFa0ZB?=
 =?utf-8?B?Vlh3UE5PVlhjSks5ZXhpdkhnSWVTSHRnV3lYOUdZYkYzM3dJQ1NVTVd1U0V2?=
 =?utf-8?B?SlJ0OTBua2ZoUExwTGk4cDVmS1N5QTRkUlNvV1FET295eFZkNWp1OHVIOUNP?=
 =?utf-8?B?ei9iZ3pWajk4MW84MWVJalhjNjRGckdiQUFUQ0dvQm1ldmpxZFc2bS80ZnAy?=
 =?utf-8?B?U2t2bDVtQk96VWdtVzZKVlRBNWQxdGUxeG56YWVLbXI0ZWRMVEhDK01vVHo1?=
 =?utf-8?B?Y05VMUlyQnZzRHpwY3c0Y0owcFRXcGFTMVdRVUc0SVcxUC9DaU8yblBtb1NV?=
 =?utf-8?B?YVRTWmtNUWo2Qk9YVXJzVXBIZW45eHFrNUN1YVpRamVQSkxWSHJPaVh0NGhH?=
 =?utf-8?B?RmNuSmU2TlBzUkx3cGxkcUlHTkRhRzZUK0NiZ21WYm1zSmV6bmkrUS9zRGdM?=
 =?utf-8?B?VlVQQlpBbEcxcjdjL1V1SlhiYmxXRlpPbkkvOXFtOXhTaE9GLzVyY3FOcWkr?=
 =?utf-8?B?NDZ5YWZPRjY0QWFmM1dUNnJ6SHcvQ2dCQ3lQN3JvOHNCLzZRU2RwYUFRZkd0?=
 =?utf-8?B?cUJ3enlLWmFKaTlxZXI2TkNNOUsxNGZNK2l4ZDZrNGpBT3Nva2tGYkVZYUpm?=
 =?utf-8?B?RDdTUi9tKzkzcmlvT2dkOHJKYmdBNVJwdjN0YzZONllIVXdLQnZXTGJ2aGY5?=
 =?utf-8?B?THFLTWk2ak5JSGh2dUNhNDFTbzIwbHhLL21peUlJaHNhV1hQa1BicmVEeUpC?=
 =?utf-8?B?Y0RWbDlCWVkybVJwUEtIc1JoL1FiaE9WS2F6T1BaaXVJckx6R2JDWlVBdTZZ?=
 =?utf-8?B?MW1tVGQ1VWp3cnJSR0xqU2hweHo4WWZRS0tHSlQ0Q3pMdGdqUFloQ2V1MlBI?=
 =?utf-8?B?cGN0ZVRiTTd6YnBtaXZNNXFzbyt6R2dMNzlPcXJYdW9iSVdSc1JxRlNIelVP?=
 =?utf-8?B?SDZMemdROU1SYzZpSEpTcFR0ZUpYMFBwWWloY3F5R2x0OVJyYy8zcEh5WHBp?=
 =?utf-8?B?aDJ0TWpacGZuU21yRm1tYnRVMkpERTI2VTdLQWI3MnRUWDNSMjM5d3RGOXVn?=
 =?utf-8?B?MUNldEVaaFV5am4xbFVueStocHhVcHpTUytPR1VEL2pWOGtLYVRHWGlqRXB1?=
 =?utf-8?B?MUpZaTFHanAzMmJ0OGtaeGpCUUJacCtjaFJvRmVHMHZreVV6RkNOMmlGS0Nj?=
 =?utf-8?B?YkwydmY3dTJjUkNpNWxYZG13ZjA2aHJZbkx4aU1zajVGdHArcS9HU2NFVDVT?=
 =?utf-8?B?NkFoeTNEUndsMFVCOFhOVi9WZDZwM2k2TStmMUl6elZxdGFNc3FySUMxcmtD?=
 =?utf-8?B?RkJzL21LVk1pRUFud2VGcGRxZU1PWlVXcHBrWURiVDVaSnhHMFhsbDJJMm1z?=
 =?utf-8?B?dVRZNWd3SnRtNXpoUWllNUNPMWhIWGRiNmxWc0xHTEt5RkU0VGJSVE9KS1Fa?=
 =?utf-8?B?QmhTY3QyOTUxeWN0UUxSTVFCODIvMStKOWNYbDNQUUZQcytkVmcwekhRcVEy?=
 =?utf-8?B?VTNIZmhkM0Z4TFU4cFd6dlMxWVo1ZStMcUdOd2tDamRuTlRWOVUwdEZ4c0VE?=
 =?utf-8?B?QWhJMlpPanZEZGlNL3l3K2F4ZmZHb1plTmhmUDBrYW9IRWJqWkdBY1gzSUc2?=
 =?utf-8?B?NFVVbmxmZ3VzY2VaZ3FKZkRQOUcxdmhBbC8vL2s5a1hneDNLVmVtaG1Cd0JX?=
 =?utf-8?B?U1RKVm9uaGh3N3ZuaEIrTlhHZ2lXcTl4VWM3eUFPaUFGR0x2cmQ5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6597CCBBABCB2B428F4B2DEC26EA69CD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6576ca7-6f12-4580-d574-08d9aaa5a5a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 15:11:07.3749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cc3xuG/+s33ATG+7UGx9stYvxXfxKUUbxvnmv3QF8G00AwlxCnoAnUcWqafPrfVW3GqAGQUc3N2HwqwR+rj01uGR29jukMpTfeVyz3m/7Ba1pY44SQkVeC19X5QBRNjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3470
X-Proofpoint-ORIG-GUID: mjb--oE1Py1kKF3VDuJdeoojY3xUDVul
X-Proofpoint-GUID: mjb--oE1Py1kKF3VDuJdeoojY3xUDVul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180085

DQoNCk9uIDE4LjExLjIxIDE2OjM1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAxNToxNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOC4xMS4yMSAx
NjowNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBJbmRlZWQuIEluIHRoZSBwaHlzZGV2
b3AgZmFpbHVyZSBjYXNlIHRoaXMgY29tZXMgZnJvbSBhbiBoeXBlcmNhbGwNCj4+PiBjb250ZXh0
LCBzbyBtYXliZSB5b3UgY291bGQgZG8gdGhlIG1hcHBpbmcgaW4gcGxhY2UgdXNpbmcgaHlwZXJj
YWxsDQo+Pj4gY29udGludWF0aW9ucyBpZiByZXF1aXJlZC4gTm90IHN1cmUgaG93IGNvbXBsZXgg
dGhhdCB3b3VsZCBiZSwNCj4+PiBjb21wYXJlZCB0byBqdXN0IGRlZmVycmluZyB0byBndWVzdCBl
bnRyeSBwb2ludCBhbmQgdGhlbiBkZWFsaW5nIHdpdGgNCj4+PiB0aGUgcG9zc2libGUgY2xlYW51
cCBvbiBmYWlsdXJlLg0KPj4gVGhpcyB3aWxsIHNvbHZlIG9uZSBwYXJ0IG9mIHRoZSBlcXVhdGlv
bjoNCj4+DQo+PiBwY2lfcGh5c2Rldl9vcA0KPj4gICAgICAgICAgcGNpX2FkZF9kZXZpY2UNCj4+
ICAgICAgICAgICAgICBpbml0X2JhcnMgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwIC0+IHJh
aXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSkNCj4+ICAgICAgICAgIGlvbW11X2FkZF9kZXZp
Y2UgPC0gRkFJTFMNCj4+ICAgICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZSAtPiB4ZnJlZShwZGV2
LT52cGNpKQ0KPj4NCj4+IEJ1dCB3aGF0IGFib3V0IHRoZSBvdGhlciBvbmUsIGUuZy4gdnBjaV9w
cm9jZXNzX3BlbmRpbmcgaXMgdHJpZ2dlcmVkIGluDQo+PiBwYXJhbGxlbCB3aXRoIFBDSSBkZXZp
Y2UgZGUtYXNzaWduIGZvciBleGFtcGxlPw0KPiBXZWxsLCB0aGF0J3MgYWdhaW4gaW4gaHlwZXJj
YWxsIGNvbnRleHQsIHNvIHVzaW5nIGh5cGVyY2FsbCBjb250aW51YXRpb25zDQo+IG1heSBhZ2Fp
biBiZSBhbiBvcHRpb24uIE9mIGNvdXJzZSBhdCB0aGUgcG9pbnQgYSBkZS1hc3NpZ24gaXMgaW5p
dGlhdGVkLA0KPiB5b3UgIm9ubHkiIG5lZWQgdG8gZHJhaW4gcmVxdWVzdHMgKGZvciB0aGF0IGRl
dmljZSwgYnV0IHRoYXQncyB1bmxpa2VseQ0KPiB0byBiZSB3b3J0aHdoaWxlIG9wdGltaXppbmcg
Zm9yKSwgd2hpbGUgZW5zdXJpbmcgbm8gbmV3IHJlcXVlc3RzIGNhbiBiZQ0KPiBpc3N1ZWQuIEFn
YWluLCBmb3IgdGhlIGRldmljZSBpbiBxdWVzdGlvbiwgYnV0IGhlcmUgdGhpcyBpcyByZWxldmFu
dCAtDQo+IGEgZmxhZyBtYXkgd2FudCBzZXR0aW5nIHRvIHJlZnVzZSBhbGwgZnVydGhlciByZXF1
ZXN0cy4gT3IgbWF5YmUgdGhlDQo+IHJlZ2lzdGVyIGhhbmRsaW5nIGhvb2tzIG1heSB3YW50IHRl
YXJpbmcgZG93biBiZWZvcmUgZHJhaW5pbmcgcGVuZGluZw0KPiBCQVIgbWFwcGluZyByZXF1ZXN0
czsgd2l0aG91dCB0aGUgaG9va3MgaW4gcGxhY2Ugbm8gbmV3IHN1Y2ggcmVxdWVzdHMNCj4gY2Fu
IHBvc3NpYmx5IGFwcGVhci4NClRoaXMgY2FuIGJlIHByb2JhYmx5IGV2ZW4gZWFzaWVyIHRvIHNv
bHZlIGFzIHdlIHdlcmUgdGFsa2luZyBhYm91dA0KcGF1c2luZyBhbGwgdkNQVXM6DQoNCnZvaWQg
dnBjaV9jYW5jZWxfcGVuZGluZyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCnsNCiDCoMKg
wqAgc3RydWN0IGRvbWFpbiAqZCA9IHBkZXYtPmRvbWFpbjsNCiDCoMKgwqAgc3RydWN0IHZjcHUg
KnY7DQogwqDCoMKgIGludCByYzsNCg0KIMKgwqDCoCB3aGlsZSAoIChyYyA9IGRvbWFpbl9wYXVz
ZV9leGNlcHRfc2VsZihkKSkgPT0gLUVSRVNUQVJUICkNCiDCoMKgwqDCoMKgwqDCoCBjcHVfcmVs
YXgoKTsNCg0KIMKgwqDCoCBpZiAoIHJjICkNCiDCoMKgwqDCoMKgwqDCoCBwcmludGsoWEVOTE9H
X0dfRVJSDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiRmFpbGVkIHRvIHBhdXNlIHZD
UFVzIHdoaWxlIGNhbmNlbGluZyB2UENJIG1hcC91bm1hcCBmb3IgJXBwICVwZDogJWRcbiIsDQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcGRldi0+c2JkZiwgcGRldi0+ZG9tYWluLCBy
Yyk7DQoNCiDCoMKgwqAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQ0KIMKgwqDCoCB7DQogwqDCoMKg
wqDCoMKgwqAgaWYgKCB2LT52cGNpLm1hcF9wZW5kaW5nICYmICh2LT52cGNpLnBkZXYgPT0gcGRl
dikgKQ0KDQpUaGlzIHdpbGwgcHJldmVudCBhbGwgdkNQVXMgdG8gcnVuLCBidXQgY3VycmVudCwg
dGh1cyBtYWtpbmcgaXQgaW1wb3NzaWJsZQ0KdG8gcnVuIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGlu
IHBhcmFsbGVsIHdpdGggYW55IGh5cGVyY2FsbC4NClNvLCBldmVuIHdpdGhvdXQgbG9ja2luZyBp
biB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0aGUgYWJvdmUgc2hvdWxkDQpiZSBlbm91Z2guDQpUaGUg
b25seSBjb25jZXJuIGhlcmUgaXMgdGhhdCBkb21haW5fcGF1c2VfZXhjZXB0X3NlbGYgbWF5IHJl
dHVybg0KdGhlIGVycm9yIGNvZGUgd2Ugc29tZWhvdyBuZWVkIHRvIGhhbmRsZS4uLg0KPiBKYW4N
Cj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

