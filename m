Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DD4BBA2A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275435.471312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Qq-0006W3-6C; Fri, 18 Feb 2022 13:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275435.471312; Fri, 18 Feb 2022 13:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Qq-0006TE-1p; Fri, 18 Feb 2022 13:36:20 +0000
Received: by outflank-mailman (input) for mailman id 275435;
 Fri, 18 Feb 2022 13:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3Qo-0006CK-7f
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:36:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bec27801-90bf-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 14:36:17 +0100 (CET)
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
X-Inumbo-ID: bec27801-90bf-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645191376;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=B6Z/6EC7+xjySVFa9pp0oCDTOKjG4jLyxrlZIt00NPY=;
  b=VgVmWOMCJpwuA4MgCo7MTdrXtbvV2jU1P94RWkyyGtrgh5dByOP1vc+n
   2Xi9yw98WFx/vlb3wEu0kdp7QriCXFQJ+skdxUCTngrDbrY2x3b0ew/s3
   5rZK2C69soXDbAMknFl3cOhXaVK5N8khJMC3LjT1ukbCSD4g9/foLDudb
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64413323
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PcI1xamNs0zyhZiEvugtlDXo5gyTJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXzuOaPyKYGShLt8ka4+29EsFuJLSztdkSgI9+HtgRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYGVlwJLL1tsghQ0NyEyZjH4EX35bKPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNWY2N0+aOHWjPH8JA7sikMOi2kDYVGdChFO2tJo6zjnMmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwFHTk7DL2ii1OnheZD5Gdf4K5egfSCN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsacowGWxFADpU
 J04dy62tbFm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJGazP
 BeC5V0Ivve/2UdGi4cuMupd7OxwkMDd+SnNDKiIPrKinLAqHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJcwhRdCBjXcqeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:4KHWzaDzljvbjgvlHegKsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEEZKUmstKKdkrNhQotKOzOW+FdATbsSo7cKpgeAJ8SQzJ8k6U
 4NSdkdNDS0NykGsS+Y2nj6Lz9D+qj9zEnAv463pB0BLXAIV0gj1XYCNu/yKDwqeOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhhY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 r4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvi/VXEO0aWSAWQR4Z
 /xSiQbTp1OArTqDzmISC7Wqk7dOfAVmiTfIBGj8CHeSIfCNUwH4oJ69PNkm13imhYdVZhHod
 F2NyjyjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1TwKp5KuZKIMvB0vFsLA
 CuNrCq2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZOyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFQgFCvsurqSRloeMMYYDABfzPmzGyfHQ0cn3KverL8
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64413323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnu1/PnGFhKmJyxAplcIo5OKq0MFexOSnnYfXxB8c4fkECZ1yG3ToFFpQy8F3QzPTZCMUVUewGwLopzilZbDjTcnRilkGPRcQpNz7mg2Sm0ZPKGn/UQ7kVlkaoqkC41NZVk/Y9QH6S54YujpSDorK3axk2XxfLpZLUVl9CH8ijHEiMjkFRfN9Hmq6/Nzjg1IDVDjw0V6r6etXvLvPxyDh7LYn+qRwGHoKG2jolpqYPIy0u6wx0PFNmsErIr0wtppkcC5E2TA5uREpD1oi/qkkwGR7R2Fk98U7ZTqSW3LZjakgu+nqpo6Ge4SDTSUnLbyeGGHRMyqwknFT6TPVTriNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6Z/6EC7+xjySVFa9pp0oCDTOKjG4jLyxrlZIt00NPY=;
 b=EFJiSe0JNzObX3Bmu8F5rAqD7A6vrVjLb6b40YAdE+33G85fo5kNS/AJaTi2Gb6cnbumRtF5DZK6h/8X/zClbD1IJTFP0Ju7Iyn2NwsEtPXow7ls8yqeIqa51Hzg17s2d8E/KMj/y+nuX3g/PVncI6Y/Jv5BIZ3Zd00qHLw1gxygdVw9idFrUX2wqvc/KCoX3SBX3c2+TwBmEbEK2JjXQl2DVVLoQDXkDRB0ElfYkhY+LxWurlie+OdflJX5x7fVQZS2dSSLDsWCgeZNpGk3i1MerDo2aRbqWjd0y5aGRFKUK69JNRVs1lQ4g8Y1+F8UOcRwgva0qYhHR2Cpmc25pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6Z/6EC7+xjySVFa9pp0oCDTOKjG4jLyxrlZIt00NPY=;
 b=suubCDwliNK9sgcYwQye9wiJDO4MiOAYaqfqGnsQYi+AzbuSN7IjhltwiZAjufi+gQ8yiKixodLwpfl45Rm5vEWwd5Evrqt2KZXWgfrfzUVnQWbilVO4b7Zl4vQfN9lPNmDXKtF4Di4xFLvmas5xtvSTuyQRc5mFzvcd7UZBoH0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 09/12] video/vesa: unmap frame buffer when
 relinquishing console
Thread-Topic: [PATCH v2 09/12] video/vesa: unmap frame buffer when
 relinquishing console
Thread-Index: AQHXUvS6bSKgeOnvKUm16fE8JrtG66ya8xKA
Date: Fri, 18 Feb 2022 13:36:11 +0000
Message-ID: <c491c1a4-67c2-d689-5fc9-aec64deffaa1@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <843f440e-039f-ca0b-6ac1-a4d50559d5bc@suse.com>
In-Reply-To: <843f440e-039f-ca0b-6ac1-a4d50559d5bc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9823fde8-2471-4afe-a1b6-08d9f2e3a0a0
x-ms-traffictypediagnostic: BYAPR03MB4837:EE_
x-microsoft-antispam-prvs: <BYAPR03MB4837F342729A00716670867BBA379@BYAPR03MB4837.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1SpKVl2+OnvaOMS4u0uCtHsmcVSyIXBt45LjXT6vl1JeB7XTx1THM3UzBGxrcj6KqwQA7mwAqT5r5pynCNcvCd+iUwnI5e33nwGpqp98q+b6wgSIOyoV9ogQM3Y46L1WyehNPQuzQvGns9KuEeyZ2Pe+Gdp6hmrzS6+Sx4km4DexfJtC0KVLYbd1MY7h2L+eP/KLHa73xAbTso3whx5G8Oc51Ri+RVDVmWVgKuDlKvt/NAX5klF2QyNCQYMi+5A9dU7Qpv6/bSnTqoxtmmKQWsxfKQgNmi6fE0RV/eEh0qTj7UgdKIAnBrnwlX2N1pTKudTlYGwG9F/2g4UVNurg5oYGNLJ1yYWSokslymLMlwHdRSCgBLjjYZSrIPHHvkBtWPIDg8itNJp9GrEEzkrSiK+hdT1ODO11zpaeCfh7x5OtTtfQc7H1mtHR1fX3U3hccmM4MPEQ1RIEG+Dic+hYWzvZo6PTVrvr7IvwnYfYCjEEopqGJ/5UrKoyekj9k+rkun4eu3Z4nGXdqvQuKn2pmdleUWpg/en9sC4Rwgmz7KTMuyiQdaI4D0H0ADnl28IFmbCZOsgmqLzUuZLvjXWMmMGe6hrlfw/Y7Xl/HWahOvvv8q9PRQZpDkGxcSBeoBlB1sdvKRdRDSvq1dxKZbrr3ia/fO1ogmw8U0g6fjZcm2H0uHwewU0fs+5BCceyE7ZYyfMZm97tttAosdK7hIju279H4RXjXPpvR5Daw1HuVzxxKbIabI/YhEBE9MDemn/ZQqVgZOJoBiz6RpGctoGf0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(107886003)(71200400001)(8936002)(26005)(31686004)(6512007)(508600001)(2616005)(53546011)(110136005)(316002)(36756003)(64756008)(5660300002)(38070700005)(54906003)(91956017)(4326008)(186003)(31696002)(2906002)(38100700002)(82960400001)(122000001)(66446008)(66556008)(558084003)(66946007)(86362001)(66476007)(6486002)(76116006)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjdVeldsYlR5ZUNBSVkreHBnSE02Y21BQ0RjWmZJTDhPaVczQWZUUEh5d1lJ?=
 =?utf-8?B?VUhLelQyeXQ2TTRPWUdSMGlYRFNaalZVTjR6VjlJcXUwUlNEbXJYL3ErdENn?=
 =?utf-8?B?UStZenRSRkZQcWJLMGplWHF5VVhob01OZTR3Tkg5bHJsaFRNZlJLWHlFOXJ6?=
 =?utf-8?B?c2RnaDg0RHFMNXI0eTJJZzNLamVwOFlGYldNVjR1WGI1RWkzQTY0RlBqOWow?=
 =?utf-8?B?WUx4S08rYWgrNWZlTDhDc09qaVVYQnBrUHdTS0xSMmR2SmRBMU9uWksxNlNw?=
 =?utf-8?B?dHB3UzM0RkRXMjJwSEF0VUFITmd4eXRZVVIzM0pLMDdxZmphT1Fvb28zb1Z4?=
 =?utf-8?B?N0Q1RlNKZ2tNMFpZWFRpWE9jMnY0OGR0MlRiZzlOT2lNRWdRaXVGUm45ajk4?=
 =?utf-8?B?cG5pVGJYODRac002aXBndU9oeVBib3prU1VXa3Q3cGxnbTRvRDdkYS9aYVRF?=
 =?utf-8?B?R0h1SW1QRU5UMG45VjFZMU5KK21KU3F3dXo3UW8yRXNFQVk5N1loUGcvZ202?=
 =?utf-8?B?YmxrM1JlZGM5V1ZMaGhrUWdGWWZLd0NXb3c5U0NWRDJJUVhLc2lnejUwKzFL?=
 =?utf-8?B?aHBnVEx3dUZ6K0ZwWmRVOTRmMTZURjRCdm85dzNtaDlSNDhqemNmTmlOb3E3?=
 =?utf-8?B?SnBXdFBFWElnTy9KL29uTW1QTFNFSWV3ME9DaFNoUTJjTCtSWG9NVFRqMWV6?=
 =?utf-8?B?YXJTSklWdmFUTHliWEMrWmJXZGlySk9pNVI1b0lMZHN0Z1JlT2FaRnh5SlUy?=
 =?utf-8?B?akp1cXJVT0dTRGhoVWNPNGRZRU9ReEkzck5VRjRzZlNPaURLaExHTmdQS09l?=
 =?utf-8?B?UU1EVVp3cndWM0RoMmlXZU5lL0g1OGJzanFiVnhxaUREZml4MTFwVldYTTRI?=
 =?utf-8?B?d2JjZUp6allqTnM3M20yKzl1MjA3QjFtR0ZvUnV3TzJ1eXdpSlJXQU1mL3R0?=
 =?utf-8?B?WDVrZXU1YitlMVg5TUhyRTQ0OWUwVjBLWUhSdEFIdExqUGdMVTM2bXFFdnN0?=
 =?utf-8?B?VlkyZkJJRGdpWDRYdHZaV1lVR21LTktvUzdsR3JnRVFobDhFMTJyekZTMTFy?=
 =?utf-8?B?ZzR4SDA1a09JMTJKSXBoNDJkaEY4ZTBBM1JHb1lSazVOcGFEKzlEczBRbDlN?=
 =?utf-8?B?dlMxZXJMZ0pNaXNYZHZDTWpuVXNSWW5ZSlRDVWVITXBDYWk2RFZzRzF1SEhx?=
 =?utf-8?B?U1UwbGkxbEFET21qb3N1L010bW1Ya0trUUpRNVFGV1p4U1phMGRKVGkybnF0?=
 =?utf-8?B?Y2ZVVjd1Y3VWSEpsL1NpTE1mSHR3Wkx5WnF6a3NzRWFOTVRpdUNOSHJkeVUr?=
 =?utf-8?B?emYrSmJSWjR5UjhLYW1PbHlhT1RHR2xsNUM5WmpKTnpJdTVDQndibDkrMWFv?=
 =?utf-8?B?TElhVTc3NXJQNVlxRE9mQzFUaGRBN2U0Q2ZxVkhqcmFSWUtSTWRvU3VFOGtJ?=
 =?utf-8?B?bDUzbnBVcE5TWWJaSUxONklITy90Z09BbXdoZkd6WmJwalVlN3lGM1FuMG1u?=
 =?utf-8?B?SlBFRllJdkk5MHM4Ynl3dTlKSVVBL1lXRWhCeE9JYkI3SGlhcUVrQy9sL0hR?=
 =?utf-8?B?Z0gwTTVWQlNFSGloaU9EZTBYR2RxSHBCN3FCejVqSW5HL0drdTN1SG9LMDN3?=
 =?utf-8?B?cjcxVFhjUmdJWkN2Z1Fzc2k5V2lCQTJvc1paMUdVQktGN0YyUnpmZU0rNi9p?=
 =?utf-8?B?TkpqTldKZUVqVVA2bnFsZk9vVkJHQjIzaGlJUEJ1YSs1R2RBQWZyTmhCM1JZ?=
 =?utf-8?B?bEhxNjR4cmx5bDhuc3lZc1JBa1NFeExKUllraUMzQUpCVEx4c3VCYmEzWnRX?=
 =?utf-8?B?SWNMSnlBeDM3NkljMlgvQ25TdEMxWjZUSy9FdzBkV2FCU0FPSCtWVTA3Y1c1?=
 =?utf-8?B?OGdjKzY0L05McnFaekE2TEpuRVhqbndLKzJ4dGduSXVNQ1Z6WndST0I4Tndl?=
 =?utf-8?B?VFNQSXFEaEMycXVPaUpHSm5KYkFZdzdWYkVmSTBqTjFlWVU0ZXFLM1VFK1lN?=
 =?utf-8?B?R0JYVGVlSnJFTStHRHhOcDdQMFdiQmZRUnhOZFJoTVlqc3pWS1RFaDU2cER4?=
 =?utf-8?B?WjZ0cElNTFhwakFJR0I0L1lMOGFJcWVPVVM4TlRYcnArMHZNWjlPTUNvVHdX?=
 =?utf-8?B?NElTOXJiSjAxUzhjdW5sZkplelVIQldqRklqM1labEJVQm1nS3JEQWI4UzRH?=
 =?utf-8?B?QXB5aWxBdk1COEhHMWxIYXRCaXNKTmdyU1FYZWtWdVdsdFBkbzNYK1ZUbmFa?=
 =?utf-8?B?RlorQitZZ1FkNTdVNlZqUis1dlZ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <212005125E1BCF478D005B56FE07A070@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9823fde8-2471-4afe-a1b6-08d9f2e3a0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:36:11.4609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNdF+PBnd09wWqEpNpMgs3KFFsQ0BBMBA1ZKE7CpdY0gC7/NcEUafnt+L2ZN9NZ+JRsh6NsroAifFLzla7e0Rdt4/0a9pnXvtwsCRGEzuBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4837
X-OriginatorOrg: citrix.com

T24gMjcvMDUvMjAyMSAxMzozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZXJlJ3Mgbm8gcG9p
bnQgaW4ga2VlcGluZyB0aGUgVkEgc3BhY2Ugb2NjdXBpZWQgd2hlbiBubyBmdXJ0aGVyIG91dHB1
dA0KPiB3aWxsIG9jY3VyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0K

