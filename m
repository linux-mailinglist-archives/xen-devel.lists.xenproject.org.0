Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9CACFBCC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 06:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007832.1387023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNOKf-0007ac-91; Fri, 06 Jun 2025 04:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007832.1387023; Fri, 06 Jun 2025 04:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNOKf-0007Y2-5o; Fri, 06 Jun 2025 04:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1007832;
 Fri, 06 Jun 2025 04:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg/F=YV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uNOKe-0007Xw-EV
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 04:05:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7964b09d-428b-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 06:05:26 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 04:05:22 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 04:05:21 +0000
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
X-Inumbo-ID: 7964b09d-428b-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBvoD4d/a/s2ruYvHYkDTRN90zm6//mlRPZ2vH2Mq8nTTajiAT5A/wde7m+Pn9ziI9/FplzzcfqYUYUEx4d8dYY55UebNmYBJ6h7quwzj1GVoyHFjUbjfr+JH3OWzbCR3vv4SypU/srZUE3di6DMSjfpTs08aHwAHQp7Vd4q/rYA0w2/1XQekO0Mq2dB+qkPQSdDSi+U18mgXMJJLGs6xku3bUEdWMx/AV2tTbJbS3fFWZF/dpidLFftI5p/qLBCsrqnPhUo/N28sqghaz8c6lf9G8np+TY/4m5FU8UcVwho67RddV/aGBYbNBaYdb64z5s+Ml8zbkARCzYEXf5YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v0J+gcqrgdV++gz0L83VAg7D22l/I30zVfFVEbKdwI=;
 b=gaUQdNjkNcLbsZe68RjW9iKua5/ET7RNpk6vX00aK9VmI6vNwtTlyP3MikJXzqbrN0qMT9d/z0ULsgdCsKpeeHN3/BlXAYrB7TGu+bZRzk1qQwajpR3EEshSrzKlb1RUfSlAnymGhej5OlfIWEPXl5v7t3AlDd0yfwldSa8rq+c3YpuwGopbdOYXKELxp1anRWnPc6yAkK6JIkJ8T93AvLcW7WIopK8wuWyGMtDBWOWwf3k4gtdq+mTfg6lMjMe+3UpiAviT6JUJL1hT/xXOMywW3wCg78xduEaiSS4MHjXhCZvm5nYIEcjTj4WM5S8J+yGfwmomlNzWAJNyDegDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6v0J+gcqrgdV++gz0L83VAg7D22l/I30zVfFVEbKdwI=;
 b=3YIdXNU2zz6o7H8AB8vaNEDLt47WXmAgx3WgQiRlFYVT7YB9G4TzkrYo52goaYIok2yngrc7NVq7hBQi7jNILQdgkQdLFrXccAMfGist+lAi1meYo+yiB7iYWUKUy6oe+dnr0LVWSdZDbxd03MjQigdWUBDE9axLiZttepU4Bho=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v5 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Index: AQHbziMKXidFnyDUhE6S9bEvnc+iZ7P0fIKAgAGdrYA=
Date: Fri, 6 Jun 2025 04:05:21 +0000
Message-ID:
 <BL1PR12MB58498D81DC922F06F351088BE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-4-Jiqian.Chen@amd.com>
 <aEF-aXoU37k4XHJX@macbook.local>
In-Reply-To: <aEF-aXoU37k4XHJX@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ0PR12MB6902:EE_
x-ms-office365-filtering-correlation-id: f3c1951a-92c2-41e1-9bce-08dda4af5b8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODlWeUV2VERUdzBIVlMvOUNSUkhUdVRnZE8vSDhuZlpBUkZwMll1TXFwaU9z?=
 =?utf-8?B?Wllhdk1rSGRwVHlZcm5JOWNTdFdLM2ZCdjMvbWptZzJ5ajM5QW9nVlJzcDFp?=
 =?utf-8?B?SXdDV0ErM2dYdFM5STNWVGRYT3ZINDZjbGNwUFUyZE5qRGFtMk41T3NVLzVM?=
 =?utf-8?B?TENpZU40Q2xIZG5aSnhoZ2IvMXZnK1Vkb2o5V0R3ZmF3TXpOaXZ5WER2UkRC?=
 =?utf-8?B?N3NoaHpkQStMZEx2em9PRUYyVjJEWGxJTFNXWkxRYlgxektlQnJqbkpTRlBu?=
 =?utf-8?B?SWJBM3hRWWZ0T3F1Z05wRGZMT0hlNlRoQytCVXNmUHBkenhNSEVOaXpua3Fv?=
 =?utf-8?B?cUNqWStDTTFpOEx0cmJEQWgvczJ2TEc3SjllRDlaaXBNT3ZrbWJlWU9CeUlv?=
 =?utf-8?B?ZXdHZ2RWeVdkbVpsWmhqL3M2OC9QTWVTdE4xM1ZrQ3QvcHNxcEdzcDlaWHQr?=
 =?utf-8?B?MlJqWW42OWFIdDVWZ244V0d2YlhtU1dwQWU1bTA0R3NDSWRGVTMxQ1F6Vkky?=
 =?utf-8?B?L1l3QTBHZ09Ua0hqeE9wdDE5SUxuS1ZDYUpJWXl3VXJ6bUdhNXlaRHNudHZz?=
 =?utf-8?B?MzJUMUxVQVE4Y3ZaRk5lNm9rMXVoUGY5UXZKU0dGSFRJdTcxbTBHd2xFYUp6?=
 =?utf-8?B?azIzaE9FVlhubU54VEhtdEN4aDNva29oMjBNTWt1R2k0UktXbnhac1FmL2J6?=
 =?utf-8?B?L0xtSThMbHZCRGhaRkUxQzFIdEJQQ2k5TUsxSUp6WmMwOVUvQVd6L0c3ZEVR?=
 =?utf-8?B?QUZyc0J5TEFVK2kwcTI2YVAwWEw4ZGVjRlRYL256TkJnbktHZzVhSFR3R2FT?=
 =?utf-8?B?anczRUVVaEZ1OE1xclpnTXVlWlhhTHhpc3UyNnNrWGdRaFVuTFcyTFp5QURt?=
 =?utf-8?B?MWRCME1uVEU2bDFIKy9uK3NRYzFXbHFSeUlDMVhubyt3eFYrUTRWSktVeUc4?=
 =?utf-8?B?TVFZRmFWbk8vTFZ4MEo2RnhhdmpiRGp0eXkrcEJPbnR2aEVTYy8vUXpjOWI2?=
 =?utf-8?B?eVNuOTNQVjBtemNmT3BGL3NMd1ZXVk12TDM0cGFYWG5HeGI2ejQ1OGkwTTVL?=
 =?utf-8?B?ci9PSWNQQWVPMTBOL0NRMWY3QUMrem5MU09HSzZBTU1hTVBTWDZ6UVNGQXRU?=
 =?utf-8?B?RW1TM0RMOHR3aFhzYUs5am52WSt2Z1lOdzFycURtRWs1K0JQNDhabWt4Zzd4?=
 =?utf-8?B?RUw0ZERlQVVvR0YveERkVERkQW9WVXhUU0RpMytJQWRadnJDMUdzMEN2cEFN?=
 =?utf-8?B?UVZ1VUdoTU42akgwNWg5TkFQNko5dllHYWQ1U3pIQmNrYk83MGhuVkN0R0tW?=
 =?utf-8?B?WkRrSkVMMU42a0pCaVlmME9RVXdmVUpqR1RFa2JQVEhDUzdJTGpOSklKenhK?=
 =?utf-8?B?SUt0cnd0cHd6TmJuMlFBOTk4RGFmNGxER2V4c3VTQ0xZM0x0Uy92UndhNGFS?=
 =?utf-8?B?c2VxakRzc1dCeXZKd3RmSEFSYkZORzQ5RG1ac0pBdzlRdEpualo0TlgxNGl0?=
 =?utf-8?B?MFlOK3B6eHJFcHdhRE4rYUFITkcwTkppM1BydDdReTJKMHh6VWFlU1pISDJv?=
 =?utf-8?B?VllXMEppNTNPT0tOdW5VTUxtVkVJMXVLT2pNOWZoWkhFTzVDWlcyYjMraUt6?=
 =?utf-8?B?KzgzRHR5MDdOYTdiYUNCRzVrWW9KQ3ZWWmZsek5OSEJ4dDMyb2dycjBpVkI1?=
 =?utf-8?B?eGVjQ0cydjFHOFV1MmFsWmQ5dlZySlAxZlpQZnU0ZkhDaGJRQmZWemloR056?=
 =?utf-8?B?RnVsOXFJeUxlbThIS1ZqUHFMZi96QjZocFBOSGM0Uit6M1BnU2RCSUpzQXhz?=
 =?utf-8?B?OE02RytUU3lVbzV6emdnbGtGWjQxWUJQbFA3YTVnc2NjUStzU3JXSlJuTEdw?=
 =?utf-8?B?SmJ0cEIyQXNZNHRWdXN3WWIxamZjNzBpMlpQREVUU01HTG1IUGNZamlsWFFt?=
 =?utf-8?B?U1gzRnh4eXBUcXZsd3NFcGVmYzNSVkowS3ByNzRGR29YdENPeGtmSjk1ZCtS?=
 =?utf-8?B?YVEyZzliQitnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnhKSFpReklaa0xrS0pnTk9hdTA2Rm9ESDAvTGNYM0RNRVVTcWpISGU2WTEw?=
 =?utf-8?B?RW1NdGQxNzBBcFpLUjNjU0oxSTVMK0wrS2RkSFpWY2lmOFNCZDdKYXlBdlY0?=
 =?utf-8?B?VTNVdFJRMDAvSS9XMWxlclMzYzJyY0UvZlFwUGQyaXRLaE1wYTZYTVBBV0I5?=
 =?utf-8?B?YVdEeDdWVWVZY3ZkN2lEZ215ZzRXaCtwRjBNVHFoYnE1NC8rdURIVUpzWUo5?=
 =?utf-8?B?VGZkdmVtWlNHcE1jQS9HUzNDS1M5a1VQcjRacUMyU3FtaWk4UEh4QWNWL3RC?=
 =?utf-8?B?d3hFYkc5SGgyZTFaYUhJTnhHUnB0QUg5NGFTb2VHUFN4Uy9tY3VqU0hyT2l6?=
 =?utf-8?B?SDhpd0d5RFpWdlRTOGhPS1I0WFc3aTJPN0ZDK1QzMVhaZXl6dG1rdkJnOU10?=
 =?utf-8?B?clRHWG5CcGJDNjNFYnJySzFhYVczQWVZMmFyWU4rZit4MTRvTlI4L3ppMnBw?=
 =?utf-8?B?dmNENGNTTDNlYmdVV1Fzcm93bnFHeW5OeHdsWkI2ZStnR2JEbzlGQkM4NWFi?=
 =?utf-8?B?SU4wVGlsSStDTWE2aHBuMmZXZ3Jta2pwajBCZldhOUpFaU5kZTJWRWxlYlNK?=
 =?utf-8?B?ZDBoN3o4TGlVbVpEa250RGt6bEU2anVNcGUxSGJIa2ZMTzAyMS84dFlJQWRI?=
 =?utf-8?B?YTBxNEpmUmZwYkV0Skp0ZzRZMStON2NkY3hXbHRuN01HNHpybHJiMngvVFgy?=
 =?utf-8?B?ZCtwQTdTci93VWU3UThNSEwvL2JwcTlpMzRNMmFNdGZWQTlzdjNULzFtTFdu?=
 =?utf-8?B?Z3JBaUJhVjFGVkpmN1o0NHdNRjBiTzJyY1o5a3lqVFFsNE1CUVd5b3dlZG0y?=
 =?utf-8?B?dWZyYitRTXM2UTJKNmRSamRmamZxd2graGFxQmthTi9peG1hTEVhZFVXU1RD?=
 =?utf-8?B?RDIwUWdqeTBVV3pXMGM5dWlCSHhHTnNPRVBVTWw3d0NSYkEvU1BWZHV6a1Rj?=
 =?utf-8?B?bUJUUnZEMmNJQ20vRG1NbGVVcWVhVWJoeXdlNmo1QXJWYmJLeHBDN2tzMTlO?=
 =?utf-8?B?d2hObDRvdzc4RlRlbm1PbTUraFoxc2FEREswT1RKd0hEVWxMM2JwRjgwRHc0?=
 =?utf-8?B?YTl0bkROZkRoa0tBVDVKa0RyYTQ0UW9HdXNhdGthSUNHb2NJa2xxdDlLMjNK?=
 =?utf-8?B?MllrRkx6MmlQbFFOSmVRMkNFYkh4QlZXNnVHVUVwejFIdXQwYjN6a3NsZGRq?=
 =?utf-8?B?dXgvc0lXMXlmWFdsTzVNcy9rbVN3dk4vTldTeDlMMWtOU1E5L3o2cVJIZnJw?=
 =?utf-8?B?ZzR2NzlxMHZYNGRyRXNTZFdWTU1HdUhiSmJuVGFkU29QcktQNUlITDZ6SFJq?=
 =?utf-8?B?OTlFWkY5cGJqd0s5OXBlak9ybjNmdWdyaGd3U0RhdXZuQTM4WXdTazI1enp3?=
 =?utf-8?B?ZE5aaVlXSHpSNGt1bG9oVmExdFZmRnlKb0I2OW1HVExwOEpOVFhRaUI1aFZN?=
 =?utf-8?B?THVPR3QrSkRmMEJ5RGVQaStOQW14THVuNCt2L1BrbHFUZmtDV08wMEwxT0Zx?=
 =?utf-8?B?UWRwV1d5TmE5YUY0MFBQSjlqRmFjN2krQWZvM0toMzR4NnhJSnNyRjlYdmV4?=
 =?utf-8?B?SU12TVpJaHdrOHdtVlMyeGlBdHBVWno2OWtyTCtxMHJaME93R3NnNFJhTEw1?=
 =?utf-8?B?ZnkrTWlMemRud3VOamFENnA5TlNUWnd6RGlhbFdoZnhwMzdmZGVCS0VCTlg4?=
 =?utf-8?B?cjNUM0YzeTNZa0hZdW9CNTljMkNDSHNjMUhHT1JQd2FrYzZpNXhkUCt0NUZ2?=
 =?utf-8?B?U0d3NUJxd3FmanVReTcvQVRYWWZFeitUYUZFY1lhSDgwdkFRYXpPV3AyTnRD?=
 =?utf-8?B?dUtlUFdseGFKd0xZMGZUWHF0VlB2SzBueSsvOXdkdWswVXlmU1NNYTFmZ25K?=
 =?utf-8?B?dkp6VFQ2cjBMOFpLVjc5ZEFhTGRlTWI0Y3pnRkhuWGk1eXFEZUhOcGc0dUR6?=
 =?utf-8?B?YlZMSWRYWXNlUnUrbWlDcVFJZmgxTTdaaktNOTVNUW0zcHMzN1o0WGVoTGRS?=
 =?utf-8?B?eTF6ajgzS3RiQUZvVVFTenArZXlvSlNQWjdnT0FEZzNrdWNvakp2VFhSanNT?=
 =?utf-8?B?amlrSmxFcEd2SUEzWlJrcjJGTDJXSGlFVUFtMUNxTEQzenltNkVuYkZtdHRB?=
 =?utf-8?Q?HJrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFA0170C2EF6E34B80A131A0D6231397@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c1951a-92c2-41e1-9bce-08dda4af5b8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 04:05:21.8460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cigay1WntRDpmBlV/ViOPSqAubbzje8GWGQ2gK8G1KRPyzrThRv0Ppp3KWyLujpZHu2ykZWOgPnfOtExoMSADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902

T24gMjAyNS82LzUgMTk6MjQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgTWF5
IDI2LCAyMDI1IGF0IDA1OjQ1OjUyUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQWRk
IGEgbmV3IGZ1bmN0aW9uIHRvIGVtdWxhdGUgZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0IGZvciBk
b20wLA0KPj4gYW5kIGNhbGwgaXQgaW4gaW5pdF9oZWFkZXIoKS4gU28gdGhhdCBpdCB3aWxsIGJl
IGVhc3kgdG8gaGlkZSBhDQo+PiBleHRlbmRlZCBjYXBhYmlsaXR5IHdob3NlIGluaXRpYWxpemF0
aW9uIGZhaWxzLg0KPj4NCj4+IEFzIGZvciB0aGUgZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0IG9m
IGRvbVUsIGp1c3QgbW92ZSB0aGUgbG9naWMNCj4+IGludG8gYWJvdmUgZnVuY3Rpb24gYW5kIGtl
ZXAgaGlkaW5nIGl0IGZvciBkb21VLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAq
IEFkZCBjaGVjazogaWYgY2FwYWJpbGl0eSBsaXN0IG9mIGhhcmR3YXJlIGhhcyBhIG92ZXJsYXAs
IHByaW50IHdhcm5pbmcgYW5kIHJldHVybiAwLg0KPj4NCj4+IHYzLT52NCBjaGFuZ2VzOg0KPj4g
KiBBZGQgY2hlY2sgImlmICggIWhlYWRlciApICAgcmV0dXJuIDA7IiB0byBhdm9pZCBhZGRpbmcg
aGFuZGxlciBmb3INCj4+ICAgZGV2aWNlIHRoYXQgaGFzIG5vIGV4dGVuZGVkIGNhcGFiaWxpdGll
cy4NCj4+DQo+PiB2Mi0+djMgY2hhbmdlczoNCj4+ICogSW4gdnBjaV9pbml0X2V4dF9jYXBhYmls
aXR5X2xpc3QoKSwgd2hlbiBkb21haW4gaXMgZG9tVSwgZGlyZWN0bHkgcmV0dXJuIGFmdGVyIGFk
ZGluZyBhIGhhbmRsZXIoaGlkaW5nIGFsbCBleHRlbmRlZCBjYXBhYmlsaXR5IGZvciBkb21VKS4N
Cj4+ICogSW4gdnBjaV9pbml0X2V4dF9jYXBhYmlsaXR5X2xpc3QoKSwgY2hhbmdlIGNvbmRpdGlv
biB0byBiZSAid2hpbGUgKCBwb3MgPj0gMHgxMDBVICYmIHR0bC0tICkiIGluc3RlYWQgb2YgIndo
aWxlICggcG9zICYmIHR0bC0tICkiLg0KPj4gKiBBZGQgbmV3IGZ1bmN0aW9uIHZwY2lfaHdfd3Jp
dGUzMiwgYW5kIHBhc3MgaXQgdG8gZXh0ZW5kZWQgY2FwYWJpbGl0eSBoYW5kbGVyIGZvciBkb20w
Lg0KPj4NCj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4gbmV3IHBhdGNoDQo+Pg0KPj4gQmVzdCByZWdh
cmRzLA0KPj4gSmlxaWFuIENoZW4uDQo+PiAtLS0NCj4+ICB4ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiAgeGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMgICB8ICA2ICsrKysrDQo+PiAgeGVuL2luY2x1ZGUveGVuL3Zw
Y2kuaCAgICB8ICAyICsrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gaW5kZXggZDI2Y2JiYTA4ZWUxLi40
YjJmNzYxYzljMjQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+
PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtODM2LDYgKzgzNiw0MiBA
QCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfUlNW
RFpfTUFTSyk7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgdnBjaV9pbml0X2V4dF9jYXBh
YmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICB1bnNpZ25l
ZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFLCB0dGwgPSA0ODA7DQo+IA0KPiBJIHRoaW5r
IHlvdSBjYW4gZHJvcCB0aGUgdHRsIHZhcmlhYmxlLCBhcyBzYWlkIGJ5IEphbiBpbiBhIHByZXZp
b3VzDQo+IHJldmlldywgdGhlIHB1cnBvc2Ugb2YgdGhhdCBjb3VudGVyIGlzIHRvIGRldGVjdCBv
dmVybGFwcyBpbiB0aGUgUENJZQ0KPiBjb25maWcgc3BhY2UsIGJ1dCBmb3IgdGhlIGNvbnRleHQg
aGVyZSB0aGUgY2FsbCB0byB2cGNpX2FkZF9yZWdpc3RlcigpDQo+IGFscmVhZHkgc2VydmVzIHRo
YXQgcHVycG9zZSBieSByZXR1cm5pbmcgLUVFWElTVC4NCldpbGwgZG8gaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBD
aGVuLg0K

