Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCD651ECC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466936.725913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Zpr-0007RZ-Ra; Tue, 20 Dec 2022 10:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466936.725913; Tue, 20 Dec 2022 10:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Zpr-0007P8-OF; Tue, 20 Dec 2022 10:26:59 +0000
Received: by outflank-mailman (input) for mailman id 466936;
 Tue, 20 Dec 2022 10:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7Zpp-0007P2-T8
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:26:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d20fb212-8050-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 11:26:56 +0100 (CET)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 05:26:51 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BY5PR03MB5127.namprd03.prod.outlook.com (2603:10b6:a03:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 10:26:49 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 10:26:49 +0000
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
X-Inumbo-ID: d20fb212-8050-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671532015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JanuIABp82I7AvmzMIyf/S4KjN6iATynnaHUprDGZ5o=;
  b=HDKPt8BZHhXFu79EZ0tCZ2pn8OQgFMF5TvrAf46ViUlHl9Ccm2idhf8A
   nrkw4nr8fR7+GJwsa4uk3IxM0oCmuaGzA7im//Z3PeWXUJkh8olpNKyGc
   Y6ksh6W7Gc2s0yewu4AQw5PLiVKSzeHwJNVPH7T4DRGQCLFVQGlq1t11p
   Q=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 89271261
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/cMTo6JbJMUuT7F4FE+RFJQlxSXFcZb7ZxGr2PjKsXjdYENSgmMOy
 DAdCj2BPKzcamKhf9lzaY2zpENU68LSy4I2GlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5RG21W7
 dYgJQwnf06ahsuEm6CiaMtF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzXKhB9tISuTQGvhCnQGW5DMuDDYtbVK++OnmhHKgd8xlN
 BlBksYphe1onKCxdfH3QgeqqXqDshkDUvJfFuQ77EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8HqvYUbnh/JCNF5H8aIYsbdHDjxx
 3WGqXY4jrBK18oTjfzlrBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4Vulz0RhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:JmQb96o0J2ZvgqPiXRjMf+gaV5oteYIsimQD101hICG9E/bo8f
 xG+c5x6faaslkssR0b9+xoW5PwIk80l6QV3WB5B97LNmSLhILPFvAB0WKI+V3d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="89271261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlu8dBiCwdHWgfMD2P9FUQ1iPoLtc7nArnTu8XePP0yG1v3NNDUT6eAi03C2QWVxdJdWgq4xwGDX3WxljBUsTekxjCcotPAbx87OFoSi6qg8s/wjOuCmM2OmGT990n8sHUg5iD1086xX5PgVWzRUS+aHGF1iGwd4ViGDQTzYtvNiJFabeZAoFsf1cNjFOpsS6dJlLd3c+zvWIXduY6ZPQv3qESBthHa+iPcBxjIfQ98MYoO+TJvasNqkhnwEleIXs9yyn2CkMGXsaYu7ZXA20ry7S9QuV/UCd7gqKgA7j96GUoBpETbS1To91rKEyLB7P890YkSNGSfEgVeS8fSLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JanuIABp82I7AvmzMIyf/S4KjN6iATynnaHUprDGZ5o=;
 b=AUoxW3JHNISgKnAttxpTaxb6EvDPR53wylYAbaNKlX5badrhcyyWa6XlGlwu5+40nE3kj1KqMZyHqRKSt35A1FCpaE9BD07/SjRFtQkxVovsGyn2TLwsogpvTsi0Jy2TG3DMnv0+i6FD21fE6RQep40q+5wW7hoP7d60iNXVIgiAqaR/zOFjygrIsN8/v8vKIGiE1WPYtHhS5wZjofmybI/DZa1tjxS45AuyD14f97LNDvzocZIjmGRW3MpjIgjJcFX7dV9qoFEK3+jFdLcWA+RIHR4V+/6cykZ46By5nNrARqmB42kPyIilIV+ZYMRzjGN59QSApZdMpufhaPZcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JanuIABp82I7AvmzMIyf/S4KjN6iATynnaHUprDGZ5o=;
 b=AwJ2QwdcbQi3nrJMZckucne8Wx0zbG7MaIlnXdbUGTXeVZPI7FsaD0PeUvHeIz/kKNWyi85I2d0dgNzeO4VHexPISCviTMP04OjM1/lgxNCnO5T7x8zkJOw1nZHQl1gw1WRO+idXSxPq5LYpYrqtVZa5vutrFgvLeKskL6Oluk0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Thread-Topic: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support
 configurable
Thread-Index: AQHZE3QiiN9xXpyr80S/AFQLoEXg6a52lDkA
Date: Tue, 20 Dec 2022 10:26:48 +0000
Message-ID: <ed527c56-13e9-b02b-0608-3c943d76d159@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-2-burzalodowa@gmail.com>
In-Reply-To: <20221219063456.2017996-2-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|BY5PR03MB5127:EE_
x-ms-office365-filtering-correlation-id: 5633c846-0c59-4418-3292-08dae274b3d8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HMaIDOYIRhfRzJropyDwTcfrYhAKWCv/cBduw3yMX913WTeI353aJrFES+N3NZdBdCBADEZSntE2TnNka3aAc4ab+xN7+FDm/7CsBLwrKGCD0wj2OhejBlVUzCD5tO2LfWQ/vuJB4PofR6umjEyRO3zDj374BV4Jp4fEjIy797K8i1rDdcmzE7vitFuRtDT3FwzrB9sve7PDrj8zghOSIbqGoEn+vNcvAX1Q/ZPwr4K2IxYQ+ZgizyQe8fjDekX7wnBIRLW9S6TFM1QKrv+O2TBmmgREFpdMjZjAyaoTSZhtB92unjuv7nc6XHsORq14a5/fjVlfqDU1c1cZTwsJY2eVdA4OaoYF9NKlTPd2yMxQ/jZiXZbYFeCkmyZcjHtE0rXt6uer20hoKkF8qybs4X7ZgkpNDYL0U5fA1zCUoj60vpbmkDevotJTI+GvdXqFkjd37T9UrUVeZE1rFwarB7OPQvK6if2UGTNu0/xRT/M/ti+fl8sRWcBLVbCV1gP02sXqId1GZnhK98RnWNTCAuJGPgq+fkt+AdAbzCx0uNY3Or10KVRsosIEGpotJ5PajUaqtvROvvhUV5kU9O6K0AHN0dKuPpmXl5wH6CZu5hxn/gHq7Lz8B0LC7DtKLXDLgra9/nzXSV0Y5qlFX/9rVsJjlABvjTu/sqgRXP8HVA9xnUK17FZrk5IGeyF6f7Mqju7MoNWjVUMONWnhUwRwMs/6MzPlq/T8tDo2ghgrGQeQn/goJHKtzbYCkF7Lb3BmX+mOb8xm0cEsaduuw0rPrg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(107886003)(478600001)(6506007)(186003)(53546011)(26005)(82960400001)(66946007)(66556008)(316002)(66476007)(64756008)(66446008)(8676002)(91956017)(6486002)(76116006)(110136005)(54906003)(2616005)(38100700002)(4326008)(6512007)(71200400001)(2906002)(4744005)(41300700001)(8936002)(122000001)(5660300002)(31686004)(86362001)(31696002)(36756003)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3E4Mk5MVVJiWjNEZjc1ZGZ1UkUydXhBU0RTNHRSa3dOU3g1dVdpMHpMZFp4?=
 =?utf-8?B?UTZST1RkZ1Y2Tk5qL2JENVZxbjdlMGppUGw0bkpBY01PaWlZM0d6N2w5TEw5?=
 =?utf-8?B?YmVEZGx0QmlId1ROc1B1WkhEUVBwQ3lPWHhXUmV4NENuN2tWbmwvR3JYMXBk?=
 =?utf-8?B?U25UVG1oTVJueXlIc0ptZjJjWGpmbUhDdzJjNXd5YUU3WUNKSmZwQ0JsbFM3?=
 =?utf-8?B?ZXpxODI5Z2lqWG9jRkd6WEs4UkNHTkgrV3FVbFR6ampDZENleDRxenhENEtq?=
 =?utf-8?B?N2Z0eFd5QVp5SCszc0pHUldHUkhzemw2RytnOGcwYlNidkRhZVZqY3A1c1k2?=
 =?utf-8?B?MmJXSE1QU3lHbXl3MXFhM0hMUHE1UElaTUlTYm5FSVVFVkpJYUEzZzA4STBo?=
 =?utf-8?B?VFJkNldjVG9weFBCWksrQUQ3WThYVCt1LzVQMXhIL1FCR1h0TFpJV2tBdVpS?=
 =?utf-8?B?TUU0b0tjUWZOcHRKN2lycm41aUlPRnE0TXdWa2RxT1lhcnU2NEtNd3NaZmpU?=
 =?utf-8?B?UEowK25PNFBWQlZrZE1ZWHA5VFBSZnloVTRWNGNDQ1Z1Y01nMk04QXdwVXpQ?=
 =?utf-8?B?RnlsVFgxcTN6dndEUThwMFlFaUhpN3hDak8rNFp5RS9ObGl2NGZjL0l4YzdZ?=
 =?utf-8?B?ZEVWa1oyTkhaZXllUFQwV0ZscVhnM1luc1dZMGhEZk5GdnUrdGtneFA0cjhG?=
 =?utf-8?B?WDFSdHJVRk9oaWRWMURzTnhkalY3a213TFNWRFkyNjg0VlAybSsrRHJac0oy?=
 =?utf-8?B?b0p3N1Nxclo0ZGh4WVJrTU5HcXlVOXNCUUlZdU9lNDBFTTRGV0piaHZsYVR2?=
 =?utf-8?B?ZDlUZVgvMkswN05oZ1BiZ2ZOZjJJOThWL1VMWWk4ZDFVWXdaRDVmK1BhTExB?=
 =?utf-8?B?azRNaTBzeENBYTZjcDNGZ2RQajk2MkdqVkJmRml2VkFON2Q1QjVTWC9CdXUv?=
 =?utf-8?B?M0dQelllbmh6dERzZmlXSk5zd0IrOFFCNzlJSGtSd2VMZ1Zod1BMZ0VVRFlz?=
 =?utf-8?B?ZGhFOTM3MEhPWXRTakFUQmpKUFFNY0RoZDBOSDNLOGJFd25ENUM0OHZlNERD?=
 =?utf-8?B?d3kzWTBsYUFmK1VBZmo2ZFh2MGVJSnBjb0g3VXVBY01UeW5xWC9vcnJTdmJR?=
 =?utf-8?B?d2JYZTY5RkhXNjlmUnA1K0xBbTF4d0V4bWtTLzNHSlJFZFZXQUdmNFl0M0Zj?=
 =?utf-8?B?MzBidDlpRWF4aDVLaUNVS2twZGdFQk1Ha0U3Ykk5QlRPa0JPcHREdjNsWkxa?=
 =?utf-8?B?NkFYR2hEUGZ3V2lTT1dpRHhMKy9kREk5SkhkczRMdHR4bVVEVFEwS0lIY3Yv?=
 =?utf-8?B?ZWw0aVI2QUsxem1DMENxYTRJM3ZxNUV5aG9GeFU5aWpSOTcxa2U5QTJ4OWI4?=
 =?utf-8?B?V09RcnpjSFhMdTk0Yy9XS2ZsNElQMExoNVlIYTAyVnIxTXZBMDFDVVhCOG9O?=
 =?utf-8?B?cTR2L1liUzA3ZEtDY0NoSXYvQWVSQ0Z1UkhWOW56Q2lxWFpiNDFIc2x0dkJr?=
 =?utf-8?B?bmhlbnhCWGFjNE9OTlhzcTl6VWJoOVJTcHQydXNGTkVMTE9kWENrelBuOTM3?=
 =?utf-8?B?bzdrT21TR2JFcTc0RnpjRzhzeGFXMVhseVgvWndPUlpzSlNma0pnSEwvL2M1?=
 =?utf-8?B?c1JXdUFlaFZWOTdwWVlZUlNpcjBDcmR1blR5ODB6QXdQbUhqbHV6LzFobklp?=
 =?utf-8?B?T3pTNFR5WlNBUTlUdmhsT1E5NjlaSUxDNy8zMzAyL3doVVd2Y2Vrbm1NbUFX?=
 =?utf-8?B?eC85RGRnWUdQdkM4WHdaR2ZBZTRwcUEzNFRmdXFUR0VHbTh1MHJNMFZTTitC?=
 =?utf-8?B?aTh3ZVRDbDl0M01IblI0bkoyWUpqT0kvOG84SGhzVDUvY01EaWlCalNNOW0r?=
 =?utf-8?B?bGxpZnlIUVppTllhSTgvMERBOE1SNmJHMU1vbTJidkJzeGZSeTlHcXdKNEhN?=
 =?utf-8?B?SzdqS0pxTkk0U0Z0dm9zVSt4WWllcEhZRjJSM2FteG11cVlZN3RDbVUvSHdB?=
 =?utf-8?B?dEIvcUhRVldiVzJHTGZpNzRXWVZuOWFRUjlFNG5uS3l5K1d2bXYvWklRZHhQ?=
 =?utf-8?B?Qm5SVW8rckZqNFYwemR5ODlpTldLQTBDSGNkRnIvYlJIL0VDeW1GZWVUWGwr?=
 =?utf-8?Q?ljzYyT0PzEOmRtqgCezDToFTr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE5957B894E93F499AB5372AE338F589@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5633c846-0c59-4418-3292-08dae274b3d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 10:26:48.7095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82dzWu6XCNOWD3wtZMPgwi8RJSiVaPpJE/OD/aWoXV612KbJkDPZymELpgHBPlb10mNZ1dqrtaBskOtPt6aGYJ2qvwpgsqD3mi0Tmo2zFd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5127

T24gMTkvMTIvMjAyMiA2OjM0IGFtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL0tjb25maWcNCj4gaW5kZXggNDc5ZDdkZTU3YS4uODI0NjVhYTYyNyAxMDA2NDQNCj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9LY29uZmlnDQo+IEBAIC0zNyw2ICszNywyMiBAQCBjb25maWcgSVBNTVVf
Vk1TQQ0KPiAgDQo+ICBlbmRpZg0KPiAgDQo+ICtjb25maWcgQU1EX0lPTU1VDQo+ICsJYm9vbCAi
QU1EIElPTU1VIg0KPiArCWRlcGVuZHMgb24gWDg2DQo+ICsJZGVmYXVsdCB5DQo+ICsJLS0taGVs
cC0tLQ0KDQpXZSdyZSB0cnlpbmcgdG8gcGhhc2Ugb3V0IC0tLWhlbHAtLS0sIHNvIHBsZWFzZSBq
dXN0IHVzZSBoZWxwLg0KDQp+QW5kcmV3DQo=

