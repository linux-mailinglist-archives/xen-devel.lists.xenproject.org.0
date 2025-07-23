Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAAB0F6E4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054395.1423160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebIu-00028l-4v; Wed, 23 Jul 2025 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054395.1423160; Wed, 23 Jul 2025 15:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebIu-00026L-1K; Wed, 23 Jul 2025 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1054395;
 Wed, 23 Jul 2025 15:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uebIs-00026F-TT
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:22:46 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff6065e-67d8-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:22:41 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9242.eurprd03.prod.outlook.com (2603:10a6:20b:5b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 15:22:37 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 15:22:37 +0000
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
X-Inumbo-ID: dff6065e-67d8-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgUwOJgUu47moQVUjbcFFWfHD8ACIB1Bez2uc71wM8NZEOfbk04E7/Dt01xeSPbYRC0gwO4vmRjup1Kgv4AmVxz+wrG+o+Bs3aZU+ujlehrYa2LOXamyuB+2iuh3TjG+UAYngQY5Y5LR2znWf0d0kLRX19OFQtsE1+iPS+LZCKme/LB+lBv4Tlfa9KuX5hn+nC/eE7uu3DPypWRIspuy2JpoP5/rfASKGNfpXJ4MQMX/zuFxeQFD56EtaPy2F06hK0pnx/YsJbXr2g9JB1qZTlL6iM9BEBjoaP7JFsijj5qg0ohBYsEqeqiOB19HIckZhUQiblZj9aOl08961E3avQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enabtvlus+OVXOW9sWGe+edlBZRhOo2+7YdleUR/VdY=;
 b=n/rHWKX9OYmzwGA0ZZz7luYXSaetal2Ci9e3v0fxIeJwmsYefUsc/ZGvB/uY1H9f0z91dhfi1ao5zY3oxYqH2G1bGnRy/uo6zdeJrNx/RrXxgEzutVQTfT3ZzH/nguFjdttdI0H/4HXSzQQ8qAF6SCH8WEwaaKLz72aBcJM38ZNpbULXoCFeg64Xu7+s7JewfRfkbLV09zchd/Ginb3wZ5HT8j+jc0MiQFgEdkvJiYpxdlcSS7jUiYXR67P/ADadwwt+D24z4V03o3Y0+Wu0LHTTKlTaVAqH5uG/W68Rnn7QyUZeaWwfn1wQuoX4H+f3PbhJQKfpVcvumvuUvYb1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enabtvlus+OVXOW9sWGe+edlBZRhOo2+7YdleUR/VdY=;
 b=ckj4AiwiKIuoDxZ7BbejEmEZ/C8MfSqvgXdWllx/XH+7j2MvZ/Po6hJNVbXSmABOHtmR2S/xTuRcKLOzEq/DT4j+6/ulPkN7E+1vHAFOtaBEo2E0GHeCS8lNMmHp3d5wHSLeeh+Hwa9UbViQt1PgwaFpY5240p4R0xMNd2czTnDhL8zyzGX638ZCcA4AUu5ChOuy/Aj6uEOfGZAmdS26Fq7GolbVBwG8oll8Q1PpITcBwdBP0I7pxyVzDIdX5UQ61u0Kfrspid8EOgAlq6+c1P65WaS0wUTlbIarhpV/k1AAsuCVRlxuVmVTwVl2BB10BD96YwwjT4EkneHXyOWiVA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Topic: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Index: AQHb++OSR1IPVyyv8U2dW9yY4SuMsrQ/0S6AgAACRwA=
Date: Wed, 23 Jul 2025 15:22:36 +0000
Message-ID: <597719b5-8928-4b13-bef9-a8bd990cbb9f@epam.com>
References:
 <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
 <82ccbea6-1c40-4e8c-8209-7ee758429324@suse.com>
In-Reply-To: <82ccbea6-1c40-4e8c-8209-7ee758429324@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9242:EE_
x-ms-office365-filtering-correlation-id: 70dd76a8-8ff9-49af-c1a2-08ddc9fcc162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjgxQkJGSWdYOFlFR0F4ald1eUFMUlpsSmplRW5mU2lRTFY3dmpreXM2MFRK?=
 =?utf-8?B?TFlOVlBYdElaQmlQRnpLT0NwaXRHQWdJa3RtUUlTN3RqSk5kcitsemR4bEJo?=
 =?utf-8?B?ejFKMGI2a2xWMzFmVW80aUp3VmR0aDVXVjdUM2Nsb1M3WXFFbFlWNGhid3Ns?=
 =?utf-8?B?Mzh0d0NOUlJEa05MckswQnEwS1BtTDZmUEhmcWtXRFBGYklPS2wxL3FKcmUv?=
 =?utf-8?B?RTJPaFZmOGsvWUtPRGFtbmhKcVpmNkZpMkluZGt4Y1Jxb2o1bThURDZhZ0Nm?=
 =?utf-8?B?V1dyTm56TWNINThmMmFZTjZLQ1J0MVRtck9WZ0h4LzYxVHhWeHd3dmRaTHV2?=
 =?utf-8?B?YlJ1Q2VXS3M4bnNYSkd4bWlhWGdndWhNT05CWmJhd2Fsbi9mcTBDb1dFMUV3?=
 =?utf-8?B?RmsvVDVvdlQxMkp5NXUvdmJ2ZGJzT2xScStaRDBDcFBpTllKcFMwQk82VVhQ?=
 =?utf-8?B?V2JuL1FIeTdlRll2VjRrYmVUOW5mYTRLenVnMXd0V0ppT1lvR25mWWRxMHlT?=
 =?utf-8?B?UlROYkppNTRyL1N1a0R6azZuNS94aXBwb3pMdkpNOTRIS2h5TEx1R3IwZ1V6?=
 =?utf-8?B?YUN4ek9IMWlHeGErakR1OHZYY2J4azFVY3pmUUF5Ri8wT3g1UzdVZXE2dUx0?=
 =?utf-8?B?UVN4dlVxRWMyRlVKOUFDdHpXK1FsZ2FsbW92VXEzSGdMTWhLU0N0TVc4NmE0?=
 =?utf-8?B?YlpHL09WV1lHVXZEMEhoekMwU0hDNDVRMWtvdHFPdXJ0Q0hQYW1CNUFkQ0J5?=
 =?utf-8?B?Q3QrcWtUaXlqbDZGbG9wWWdnWmZUTTNWV1VEWkpwcVJBRHRLUWRhSjA3THVh?=
 =?utf-8?B?VjZtaFdBK0VOV3JJbEd4aHU0aHY5ZWhhRVlML3d4UVAzSytWcnA5T2NsaDE1?=
 =?utf-8?B?TWdqNXg2dDdSemxmRDhhVklkd2RISzNKcGk4WXF1ckNiNW9MOWxrTzBnSmw1?=
 =?utf-8?B?VHdpaHVQMjRncUpsRkJ0QUJJZWtVVDcxbUs2VzJncjBKQ3hzSnRmVTdFdW9z?=
 =?utf-8?B?NmhFbU9Sd3IySm9IaG81M085RCswdG1OWktxNStZK0I1V3BjZUVDNzNXVlZy?=
 =?utf-8?B?MzJTTVI0L1dDekh6SzVuVWJueExMN04xRUYrMUNKbU9CWExsbFVQQ2ZKUEZn?=
 =?utf-8?B?Z29lY2lzeGdtalA5MmtxS1Bvb3pmWHZpVFoyYkdoR0VNckJBcS9kM1BKMVBL?=
 =?utf-8?B?cVl4NVREZlZ6b1Ruakg1VHhPVU05WXBLZkNWaGNXMFNHMWV2cUczSk5NN3Fj?=
 =?utf-8?B?Um96cytpdTVHMVAxNW9rWDBZUVNGM2syMTNHbGhiSnZHV1ZqVDgxWHhMVGFM?=
 =?utf-8?B?NFRWR0xwYXA4K2VoU0ptL3Y1RXRrdFU1aG04U0NVaE5SNU82VmUxU2FtLzI1?=
 =?utf-8?B?SXB2aVZ2YlRPNnllZlBSYlVVVG1ScDlvNDAxbHY4bUtwWUZmMXhGSSs4VDNS?=
 =?utf-8?B?am82b2tQNEJMd2c4RWxlQ1hVVDZ3VGpxM0lCT2xQK3JoK3hZVzJyMnFUTVNn?=
 =?utf-8?B?aWI1WG1hUGs2ZUhOYVdXYWl1WTR0dGlETnJSeFRLaWlnS2NjVEQ2UmNYTG1G?=
 =?utf-8?B?RENCS1REL3dIZ1dMNzRWZk9adTZZditXNm55c09EdndUQWlRSUk1U21rZVlX?=
 =?utf-8?B?TGg5dlJRZjJORXZ4dzZsWXBoS3htSGV2RTVVNnZFR3RWbUZldmxwVDE3K2dt?=
 =?utf-8?B?RFJCM1lLSkJHd3lDaDlhcVEzNE1qb0dPYWhUYUYyZFB1ZVYvWEpkWlUzaVlG?=
 =?utf-8?B?T1hjckNoYlJka3krYlpFM1VBRnJqM0lxSnRXTzNlNDdvNFhtRlJkOTFjNzgw?=
 =?utf-8?B?S041bnB0YUNHWml0RHV5QWtBY0JTZFQ2SW1KMXo3RlFWSkIwRlRDZTg2bm53?=
 =?utf-8?B?Q2cyU3ZacG9DZkFQb2RKY0lheFRMT1NYOWpPZDhtekZSU3VmUFdiVnJmTEZG?=
 =?utf-8?B?NHk1cDVhTnJ4MndReHhmYWdzeTVGTUZucVV3ZWpraUNBbFVheHdHZnBmS0kv?=
 =?utf-8?B?RVlSOXJhZ3Z3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OENpbi9UZzBTTGo1QVdVcElSVW1oTUlQR2YyTStLMjJtenYrdmJSZCswVVVE?=
 =?utf-8?B?cjhSVmRQQ0lXQlRzbU1BUnhRVk9qN2RnT1MvRHBmMkdQNFRWb0VVVjE3M3Vo?=
 =?utf-8?B?L012UnNHZmRNTmR0dy9mM05ILzVJd3VCY0sycVNJWi9ON3RwRGJDb1pURnRo?=
 =?utf-8?B?dmFydzBRUGc4Y2VxL2x0M3NjcVFOZFFBWjFQNWp2TmsrK0pDU3JxdEJLYjVq?=
 =?utf-8?B?akZBNmxydEhrSGFVa0VMYVU2Z2oxbmcvd1NIdmQxNVByQjB2Q3ZaV1hqdDNE?=
 =?utf-8?B?Q1VqU1d0QTB6R3hXMm9mLzZZNCtUNi9CSSs5b2grcTNabzVIS3JaNmZEUE5i?=
 =?utf-8?B?S1gzdW1rdENaeVFRZkN1K05kWm5oQlNjS2NKWFRZZU1hWkMwbGgwQzdEbjVp?=
 =?utf-8?B?VGt3L0dJS24xU0tYU0NSNm85Q2tybS9udElkN0Zud2JPVkRsd0hwVGpmM0xO?=
 =?utf-8?B?Q1QxbWNYKzFiaUt5NHd5ZzdlTmhFSVFMUE5wM3k4R1hZMFJ0SVJqQ2hCSlRF?=
 =?utf-8?B?aEFhdFBOd1lwRTVtcHhhbkZxNnVOYVM0V3IvWEUrZzRIeGpaN0NVRjdGUUZN?=
 =?utf-8?B?QXNWQkFZSU52VGtQcTFHRm5DZHdDcjF0aVNSeTVSaFZrNE8ySDNpZVJJeEk0?=
 =?utf-8?B?TTBBWEFLM3VuSUpmbjdXTG54T28wb1puN2hOamZhcXJCL0ZPQjRBSS9CeTdQ?=
 =?utf-8?B?OVJIZkdLSHR2dE9JNUY4bnkwVFM0M0hOMTJTeGhyS1F0Z2JZeGR0RkI0b0Uw?=
 =?utf-8?B?N0hmdWpRRzhDeGYrcE5kdVdkbTlYcitSSjBEVG9XNkRydXhZanpMbS9tZ2ND?=
 =?utf-8?B?VXpKZHdmbktQMHBMTTYzRVRqNVNKL21YSzN5aXNIMTNuSEpqeWR0L0d5QVdi?=
 =?utf-8?B?UkNyOE1JdmNlM3RCb0ZEQlRpOEhzT3lPSWNMZTlLTlprWnREMXJDcklnMzVa?=
 =?utf-8?B?OTJBelNtMHJ4anVJalJlcWg0Yzh4M25pa3dEWWdyMkxQM2ttejFnUExBdkFE?=
 =?utf-8?B?dWZZSVdBM2dGaWhWSVhHQThhRU5FbnRNL2tkeFlTeDk0Rkpmb0RnWWlHSDJX?=
 =?utf-8?B?V1U0eGJJNTRjK1VaMEt1ZUVsT3NuWXNkL0ZMS2VuQTdGL3NJTGsvOTBmc25r?=
 =?utf-8?B?clljOUM3ZHc5a092Vkg4cng3eHhEVUJUamY1bWxoSzl2WnZPOEx2cWNWL0xP?=
 =?utf-8?B?V0piMTcydnpGc0RFWnpYSHJsckxha1JndDg1dnJUWk42Z2R5TXlBTlpqVnNS?=
 =?utf-8?B?ald6MVZ2VHZmYkVPNHU5SlYyOHZrbE03NzMrYmdYRFppektRNVdsQVBWcStr?=
 =?utf-8?B?a0RhS3d6YkFGNDNFVWpXd24ybjhpM0p1a2ZYenBkVnlsV3RHeVdQcW1LdndY?=
 =?utf-8?B?a2UyMFlpMlg5UUJnUVhOeEFNUGhlZWF6eDdWelhkWHVPR1FScTRsODcwVDNS?=
 =?utf-8?B?QVNVblczanA4UUc2VER3UkxsSWpWVUZaL0l1Mi9yTU5wWlN5NlBaQnZZNDcx?=
 =?utf-8?B?aFdkSjN1b3cxWkxYZ3ZpdWFZMzhwbU5JVTVENmhKa1RIMStQMlVmSk8wMDU5?=
 =?utf-8?B?VnB5M2p2RUhOS3liNURpOGlkOFRJcTk2L3dUTnNxZ2o1VklaRVN4OTZ0VXV4?=
 =?utf-8?B?bFpwcll3K21ISThXcis0dnhpY05Fc2tzMG9HMjB6MCsrZXJROFFWNkt4cjNv?=
 =?utf-8?B?NTlJUXpUUEtxZjJsRkl0VFRXcEZxdno2N3V1cXdYU1R6ZTFmcVA2djR3TVhJ?=
 =?utf-8?B?bmxnT1d0Mm1MK3JBVmdRY2UyL09KWlV6Ykp2TWlsTHk2NXJXQStLdnV4L3Nw?=
 =?utf-8?B?RDBwc0VlTmphQ0NJRzFQcEljSUpZSXI4RzRLVW9GTTZhcmREdXpYS1RpZm1a?=
 =?utf-8?B?aTczN3NZdmRoZ3EyVEFPZVhUeU9kbjVyc0JzQkhNdlEzZVZmcU5ZT1RkUTFI?=
 =?utf-8?B?Y3QyZEV2ZnFJK1Ftb1A5dWlvS0FnMWJBcDViWVNQczdkeWREN0VPNGUwaEw2?=
 =?utf-8?B?RUt3WWFaYlBGeEExdjZQdkdFM2FwU2JwR0Q5eGJNNzQ3azBYWXFSWC9saFlZ?=
 =?utf-8?B?cUw5YmxiektVUUxXMWZSNE1RTmVNbmNQeEIyeXppS3JpV09GOFo5cGkzRSsx?=
 =?utf-8?B?eFBwKy9VS0JtQW9xQTBtQk1PdklwempNa3JWV0QyRnpidmF5M1lTRHIzaG5F?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C26A9C7370A5A4E955665B9AF72E33E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd76a8-8ff9-49af-c1a2-08ddc9fcc162
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 15:22:36.9365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppzhAre8cZPgQDI7LaKhXI4Fj/6Hvk2u0j2aqQsZ85axojKB48QzvR1VyA+0w48QpY5lWvkrHIS9z0m4PNMzovoTAjJ2nCz6mpHmMZ3842E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9242

DQoNCk9uIDcvMjMvMjUgMTg6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4yMDI1
IDE3OjA3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBBZGQgTUlTUkEgQyBydWxlcyB0
byB0aGUgbW9uaXRvcmVkIHNldC4NCj4+IEFsbCB0aGVzZSBydWxlcyBhcmUgJ2FjY2VwdGVkJyBm
b3IgWEVOLCBoYXZlIHplcm8gb3IgZmV3IHZpb2xhdGlvbnMsDQo+PiBhbmQgc2hvdWxkIGJlIGVu
YWJsZWQgZm9yIHRoZSBFQ0xBSVIgc2Nhbi4NCj4+DQo+PiBSdWxlIDE3LjIgaXMgZW5hYmxlZCB0
byBwcmV2ZW50IGFjY2lkZW50YWwgZGlyZWN0IHJlY3Vyc2lvbi4NCj4gDQo+IEhvdyBkb2VzIHRo
aXMgInByZXZlbnQiIHdvcms/IEkgc2VlIG5vIGRldmlhdGlvbnMgc28gZmFyLCBkZXNwaXRlIHRo
ZXJlIGJlaW5nDQo+IGEgZmV3IGNhc2VzIG9mIHJlY3Vyc2lvbi4gSGVuY2UgaWYgb25lIGhhZCBh
IG5lZWQgdG8gaW50cm9kdWNlIGFub3RoZXIgdmFyaWFudCwNCj4gaG93IHdvdWxkIG9uZSBnbyBh
Ym91dCBkb2luZyBzbyB3aXRoIG5vIGNvZGUgdXNhYmxlIGFzIHJlZmVyZW5jZT8NCj4gDQo+IEph
bg0KSSBhZ3JlZS4gV29yZCAicHJldmVudCIgaXMgaW5hcHByb3ByaWF0ZSBoZXJlLg0KQmV0dGVy
IHRvIHNheSAibW9uaXRvciIgb3IgInNjYW4iLg0KDQpEbXl0cm8u

