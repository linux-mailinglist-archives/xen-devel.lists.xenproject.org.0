Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D95A29ED2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 03:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882482.1292612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfriC-0007qK-TP; Thu, 06 Feb 2025 02:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882482.1292612; Thu, 06 Feb 2025 02:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfriC-0007nB-Py; Thu, 06 Feb 2025 02:33:52 +0000
Received: by outflank-mailman (input) for mailman id 882482;
 Thu, 06 Feb 2025 02:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liKN=U5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfriB-0007n5-N5
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 02:33:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2416::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c993c0ee-e432-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 03:33:47 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 02:33:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 02:33:41 +0000
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
X-Inumbo-ID: c993c0ee-e432-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOIOOioCKu6YVEMScq+5vkj04+dlvX4WF1BwCtGX84ft3DLQLV6vhGIJh5VST42fSVSMuKsnEszdWFZqngsYVhzntJTtd0TVwT4YbfCxw5z3zDNKln+cDuSWBx0we/PkZ2otztJ5fBtVbhw4hoIuGrajdre+dqeyUHx4XgO0EfybfSv+WTO9pEe1PPq9Q6bNqE3YY7X1mpfcytZocbrrY4sewc1hyEyfTQ3vxvyMnylr2Wll6O+rYXsK/0g171B0WQpK0XWNgKOUfzac/YAIFKr5t4fYZNsnwXT76vj1/qe9jRWSxMtwT5LuUNC8NYOFzi3J6SqgA3cm4NQ4Qmbi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc9Rxqeny9IwfjpiNTLoshZikZSCurUJE6WsN0G+lY8=;
 b=KHklOpiueBWNDVkkuBIpUtnAjnnNrl3ItcAkBFNvPxLthJ+Yv/oVZEUfzCjJ3kZgYzWTnAfKQHQn7Wagq5fUMMbTeaj3SPIdqDz7qECOMhwXqDDviLIfgCQQgQ/DroSVFcc4PKCEam/qGriVAFCAg9Y1KQ/7XN4aimMfnlwMvof3MtRdvtCd7/d+DpEBHBUzAMYSWkwuA0SeyLiwbR16/anc5EbErugHk4Fa0YXYLpacaPJ3Sii9ydkkMkK398n7zwEOklJd8HNqsW+Jg9lCsHt2m6HBKhbILHZfjec5tpsS69LaYigBYmlUGUBTk9ea4KfxcOdRNZhU3ONFUHKblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc9Rxqeny9IwfjpiNTLoshZikZSCurUJE6WsN0G+lY8=;
 b=T4WAtThJ7kVZldkaQRmJh+vpG63/Ty+wr1LFZh6ZSJvP+m5c/t3lkXUB3N4D442qIJ/pkpjceUU4ClS6v15hzTauvxfV6yj54CG8kAvaM0SzapBofUWmK2GZN/2PPlKOnntHynqwoSfj15STXJUCLBc0sIDFuzVEf/B4UvJL+S4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Thread-Topic: [PATCH v6] vpci: Add resizable bar support
Thread-Index:
 AQHbbUoyUzXRgWLOOkOHv+F73OEjK7MqsrQAgAAFzwCAAAMXgIAABJWAgA3j+oD//9kVAIAAiKwA//+IlACAAIkoAP//gpCAADHSwAA=
Date: Thu, 6 Feb 2025 02:33:41 +0000
Message-ID:
 <BL1PR12MB5849047405E8C8FA140DD65DE7F62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <Z6Mn2pWdp6aquAmY@macbook.local>
 <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <bce9e718-36bd-4bb6-9a9c-97115f453c1a@suse.com>
 <BL1PR12MB5849C558A2F667D2F09E6BAAE7F72@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67527f17-6477-4cd4-b6f2-21487ad153f6@suse.com>
In-Reply-To: <67527f17-6477-4cd4-b6f2-21487ad153f6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8422.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7843:EE_
x-ms-office365-filtering-correlation-id: 90cc6dd2-e3c2-43ef-1c62-08dd4656abb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1loTWVyMVQ5d2MzSlN4eVRSbHJ1b2FkTXBGNUtTK3lMdEVSWUY3VjlTdEVh?=
 =?utf-8?B?RHYvdElVc1Y0czRZNjQ2SDF3YUpNMlhkMDlEVXBzZ2piSHBiemtBdmYzdDZV?=
 =?utf-8?B?THNyUW5sdldOUm9ESVFjYU5hYlNxTnVrcGxINkpRdmxXUVhDZmozY3NTQzVv?=
 =?utf-8?B?NHZBa3RVSmhVVUVpeTlIb21MeE5MV1UxTy9yWFk2bGxwalBhSXNGL3h6bmlU?=
 =?utf-8?B?QWg5WmJ1ODczVlFmNEs2Zm83RGwrNjBVZjJPZWtuWld2NmgwU0Q3QnMxSG9K?=
 =?utf-8?B?VmFlVlhzY2FoMUNWeElFTkRHZE5sVVlQYnF2OUxqblpTUFZzQTQxaU8wOUpX?=
 =?utf-8?B?V0lNaEx3L0UzR2phRUxFTFdSZ2NTUW5Fb1lXVm1rK210NW9PQmNsNllWdzVa?=
 =?utf-8?B?enNSMTYrRjRpY3o4RVE1aUlMYncxckVCR3ZjQ0pnZVdNQkJ1RkpCaXIzNGtw?=
 =?utf-8?B?VHU3SFo4NXRMMlFBV3p1aWRBMFVFVDNOTjREanpzQjlYdmI2cHArRkplSk8x?=
 =?utf-8?B?dDJOQW50b2pJZEp4M0JIWEZhZlo2V04rQzlNZVowSlptWnl1ejlPZy80TmxC?=
 =?utf-8?B?M0xyMjJWUXI5ZTVuMTBqb1psY011cy9hUUlWSyt0Q0MwcWhxZm94SEw3QW15?=
 =?utf-8?B?TXdHLzJjdkJDK1d6bDlKNVVtaDFzUS9pN3JKaUxXTUVvR05ZQ01qbWN0M0pQ?=
 =?utf-8?B?MGVja2FsRmVOcGp3WFdvOFB5UEVtMVJXaFlBeVhYc3NtOHFVWWRwa0R1U0Iv?=
 =?utf-8?B?Z2xvNjFrRXJDaHVlR1RYdWlUWHcyT1lXQ1FmUDNIaE5pQ3YrMjkyRVJNcnFi?=
 =?utf-8?B?ckRqdUdrRldRSzU4QjFUUXhSbjVnUTRXZkFGaTc3c1hMRnRDdU55OHk1aTdj?=
 =?utf-8?B?QURqdU13Vlp3VDdKQVRRV0ZGYk8ydzFLdEl0dFk0MExwaUxVcDZtN1lFanVm?=
 =?utf-8?B?L2VTaWRScVMraytHVjFIUGVrUmt5STZ3UFZnMFErZis1eTV3UVJ2NzQwV2pJ?=
 =?utf-8?B?Y2l1MnhRb2FDcmNUQVNVR3U3SG4xcklLRDNqalZsbXViU1pvb0k3OUZYSDdl?=
 =?utf-8?B?SEtVUE5jc0lHa3QxbFIwMWtVdlVSYTM4NFhhVjgwdEdaY2RpbFJRU3E5Y21y?=
 =?utf-8?B?ZUdCc1o4WjIwSlByTWk5ZUxMT0JsUUtML3NaWlgvdi84YlYzdGRKUVVkVjJW?=
 =?utf-8?B?b3dhVEJPdHJwVW1xZmhEdU9xekd2Qk5zR2J0TXpJTmlRZWxnTVViZm9YTDRt?=
 =?utf-8?B?RytNZy9zRzJKTUlISVJ0aERVc3U5aEJsZHZndUZJQ3ArUndSYlRBN1VmWUo1?=
 =?utf-8?B?bTZWMlVZS09nRkNUQ3RPUnBuVWRMMUpoWWVHUkIwcXpGMmlMLzlrVHFWOHVF?=
 =?utf-8?B?MzNwTDhucDA2RmRheTJYM1F1TFRFYTlibkJuQk1rOC8yR2xBc1E4VVJ2UUhF?=
 =?utf-8?B?MkpGaG5LRXV1cHlqTkRpazBkYnhtQlNWSmhsYzcraS9UKzN4YmdTa1pHclBN?=
 =?utf-8?B?S0FmUUdpWFlPck5qdW9qSkNteWJtUVZSRGZaTHNDR1ZMWVJKbUdWa1dmakxw?=
 =?utf-8?B?NXA5QS9ha21rSnVqKzl6bThvNTdlTmNFVXhRMTVpdktrcXE1aTNqUm9LQzVv?=
 =?utf-8?B?V2RRdVlkZ2daVXpzUitjY05GdW1ORWpTbzNkTzVoOStPVXc3SXpEYnozNXFY?=
 =?utf-8?B?bk1UUXBObWZxZXdwQW9PZU5PckhaVGtuYW8yNWpNZ3crQzluNmxIaWNCaTZZ?=
 =?utf-8?B?RlZvcWVsZ0M4c282NEhpdlVvVmlGcmpVL3pXMWNhT1RIamFzZGhxelNucGpK?=
 =?utf-8?B?cTJqZDJXa0tISzI3alRUb1Q2YW9oRnVGRTJTaFgxTjhia2NId3lhVWUvMWJm?=
 =?utf-8?B?aHFBVG15aHhKQjRNaEhkRHB6aWZXcW9MTTBvQ1pCdzhtQ3lqUktya2g2RXB2?=
 =?utf-8?Q?EZ9HXQiAT03ARsdY9lFado1ZRJ807oWy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUJaK0cwdFo2TTRBdllKNlZzVTNTR3ZlN3gzNkp2bmtkWnRCdjVWSEc3bUtu?=
 =?utf-8?B?ZmRkVFpTcC92cTZNZmxKOVRhTGUvQURmdHRoVFh2bWtEVjhtY3JOaTVSYXZS?=
 =?utf-8?B?RUdxQnB3eS9GRGt4ZUhOS1JJUmt4aW0rVnc1RGZVcVozbklyei91enVjeE52?=
 =?utf-8?B?UUpDL2RMeTdRSmxvKzhwL1JhNk93SnhiUGR1by8zTkJKS3RuUnZyR0Z1d0Nh?=
 =?utf-8?B?ZWdwVUpUL2VmSGJlaTQrbDVQdm5BLzhwMmdtQmZYZHRKZ3pQdjN5dGs4K1V1?=
 =?utf-8?B?WHh3OWVKak45VDhoK3FyQnRhb3pXT1RwM0E3c2FTMVpaemdnN0FBY0pyQjR4?=
 =?utf-8?B?R0VkcEE5ejhZOFlFWENUeUlyTWpWNXRXMG1CbHh3LzcwTjBWNlR6RzBLR3dz?=
 =?utf-8?B?UmQ3Z3phM08wVVlvcG03M2NiV1lYMTlzNHV3RlpZRWhPdURWQm1FeEFhemlV?=
 =?utf-8?B?ZDYzbjUwOUtsWWVjc3FvVjlNVHdYRk0ySXhvbzlqUXlMWTg4VDBrR3Nid1ov?=
 =?utf-8?B?S3dJUHJFM3FPMC83T0IxNjJ0ZnpkTzFBa1N6Wk9peE1KQ001aWZzMXd5di9a?=
 =?utf-8?B?MUhWWTI4aDlrWXB5MUhUSUl4MkEvaFJ4TXkvZ0hKZWxKSmlEL3p2a2UyMnhr?=
 =?utf-8?B?UjBSMUF2Smh5Z3hpMmZTczZpMGpuTk9DTHFBbzhIdUs3cWpMdStTdG9jMFlW?=
 =?utf-8?B?ekl4aDJaMkYyS2JDL1hUVjlLdUlZYXU1dS9VYmZZQ2x2c25uZU1VdlhJUDUr?=
 =?utf-8?B?V25lSG1RRGQxd2xsRWxaalVlTnhpS2VXM2lVRU55RS9jeG5ZYlhMck8rMmw5?=
 =?utf-8?B?cEpGNDR2YWY1Sjk5UXRQTjNNTEhPMVRBWUVGU1AyWWJmWWZ6TURPY3N6ZUhh?=
 =?utf-8?B?OE1JVG94YlQ2V0YzUFVRSFpaYUl4QmdkSXdxMXdkVVYveVNQZGYzMFkwVE12?=
 =?utf-8?B?SC9tWGxwMTBlYTNvR2tER3NjODRLcDlNZXZoUlg1KzVzZkhONGZsUlc5WDJX?=
 =?utf-8?B?a2M0MUNqZWQ1YjZ0ZDBuV2F1a2lTd0JkTWRqYnVQRHExaS81QVNXL3M5Y0tU?=
 =?utf-8?B?Sk85Mm56YjVQTlQ3Ym9ZWnNsNUFMK3FCSjhuenJpL2ZBZkVVa0lEazNlcU51?=
 =?utf-8?B?UFFrLytoZnlpWkJBcnk3NzJYT2xWWWVOaEJRbDhMWHRFbUtxRHpxaUU2OFJt?=
 =?utf-8?B?MUZYVnJaWURUMjduQUMxSmhxUzB5YS9zWTYzbHhXdCtyUVh2QU52WFZRYy9y?=
 =?utf-8?B?OHFBYkNFanBtcTJwbHF6Nk1qT1p1eG5TSERKaDJIL0VGN01SbnlYMnNkSnBv?=
 =?utf-8?B?WVJkS0c5dmZqV2IvdWdjMjdPVG0vK1VtOG5vQmZaYmRjOWlYS1dOQU52L2tT?=
 =?utf-8?B?d2hEVXVjR3BaUW9ZQktxdG1FZnJzMWFDWlhXbHNFVE1XaW8vYmkvbXRWZHB3?=
 =?utf-8?B?d1FmaTQ5UWkzUVI0bnVFa1FRVmQxRTVsdVhHSW1VRGRsUldDWm04SUxPc2VT?=
 =?utf-8?B?Ry9FRXdWWWROOG0vNTRmbHA5NE1EbFFrblJXNlI3UWx5VjlkbUd3c2ZQV2xG?=
 =?utf-8?B?cnhxd0s2b1hkYW44SzJ1RlZnTHE1SUhDaHJqdTFML2JBSCtNenVnRmNFVUhZ?=
 =?utf-8?B?SGVzVVZMdmNRUWsva0dEWi9ZWU5mUVBYRVIrVm9QMEhOYlBZSEp6VGRnb3k0?=
 =?utf-8?B?RFprSlFHaUs0MDVxVmZmRUFyajV6bnVncGVIRFJNS1Yza1dCOEVRTWkyMndQ?=
 =?utf-8?B?WXd4Z1kwREhlUXpvYWJ0SnBXSzUwTTlra3VRQzIwTGpsSG1zSXYvOVAvci9F?=
 =?utf-8?B?c3hWSVNRZmxaM1ZUTWRXSnUwaVFzbWZDa1craXZzZGY0RGwxdVppeG5JUTJj?=
 =?utf-8?B?SmE1YnJXdVFMTE9CRHM1Rmptc2pkckJSNy9JRlVPL0VaMmlIV1RCa0Nod1VT?=
 =?utf-8?B?Y3JkejFKNGQ1QllDY25EeTFEeFgzcU9kNCtJV0NoSTNNNHppVGt6aWRJZDh3?=
 =?utf-8?B?Q001TUZCWnRCMlViQ1d0anFOUHVCQWFrWlpFZXI2NU54akJSSExXSTRlT3Fh?=
 =?utf-8?B?QnMxYWZUYlUvRVM4bmQreWxLTVpnWWFkKysvV0dCWHNFUkhBTEZBbGNDaUl2?=
 =?utf-8?Q?i4ls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8B69310D5540A4AB70F5CE9CE930886@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc6dd2-e3c2-43ef-1c62-08dd4656abb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 02:33:41.8024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yAiaXEVDHl/pC77oY0c20ttTGQAcjLT5iLCWtrTXIQlKa+w3lol7+rSyXTZUlsG9o7L2d5dpcVVWMQgE98UU7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843

T24gMjAyNS8yLzUgMTg6NDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wMi4yMDI1IDEx
OjMxLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI1LzIvNSAxNzo1OCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDUuMDIuMjAyNSAxMDoxMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0K
Pj4+PiBPbiAyMDI1LzIvNSAxNjo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9u
IFdlZCwgRmViIDA1LCAyMDI1IGF0IDAzOjQyOjMwQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90
ZToNCj4+Pj4+PiBPbiAyMDI1LzEvMjcgMjM6MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+
Pj4+Pj4+IE9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0IDAzOjUyOjMxUE0gKzAxMDAsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjcuMDEuMjAyNSAxNTo0MSwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToNCj4+Pj4+Pj4+PiBJZGVhbGx5IGVycm9ycyBoZXJlIHNob3VsZCBiZSBkZWFsdCB3
aXRoIGJ5IG1hc2tpbmcgdGhlIGNhcGFiaWxpdHkuDQo+Pj4+Pj4+Pj4gSG93ZXZlciBYZW4gZG9l
c24ndCB5ZXQgaGF2ZSB0aGF0IHN1cHBvcnQuICBUaGUgdXNhZ2Ugb2YgY29udGludWUgaXMNCj4+
Pj4+Pj4+PiB0byBtZXJlbHkgYXR0ZW1wdCB0byBrZWVwIGFueSBwb3NzaWJsZSBzZXR1cCBob29r
cyB3b3JraW5nIChoZWFkZXIsDQo+Pj4+Pj4+Pj4gTVNJLCBNU0ktWCkuIFJldHVybmluZyBmYWls
dXJlIGZyb20gaW5pdF9yZWJhcigpIHdpbGwgY2F1c2UgYWxsDQo+Pj4+Pj4+Pj4gdlBDSSBob29r
cyB0byBiZSByZW1vdmVkLCBhbmQgdGh1cyB0aGUgaGFyZHdhcmUgZG9tYWluIHRvIGhhdmUNCj4+
Pj4+Pj4+PiB1bm1lZGlhdGVkIGFjY2VzcyB0byB0aGUgZGV2aWNlLCB3aGljaCBpcyBsaWtlbHkg
d29yc2UgdGhhbiBqdXN0DQo+Pj4+Pj4+Pj4gY29udGludWluZyBoZXJlLg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IEhtbSwgdHJ1ZS4gTWF5YmUgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZSBjYXNlIHdo
ZXJlIHRoZSBmaXJzdCByZWcNCj4+Pj4+Pj4+IHJlZ2lzdHJhdGlvbiB3b3JrcywgYnV0IHRoZSAy
bmQgZmFpbHMuIFNpbmNlIENUUkwgaXMgd3JpdGFibGUgYnV0DQo+Pj4+Pj4+PiBDQVAgaXMgci9v
IChhbmQgZGF0YSB0aGVyZSBpcyBzaW1wbHkgYmVpbmcgaGFuZGVkIHRocm91Z2gpIEkgd29uZGVy
DQo+Pj4+Pj4+PiB3aGV0aGVyIHdlIG5lZWQgdG8gaW50ZXJjZXB0IENBUCBhdCBhbGwsIGFuZCBp
ZiB3ZSBkbywgd2hldGhlciB3ZQ0KPj4+Pj4+Pj4gd291bGRuJ3QgYmV0dGVyIHRyeSB0byByZWdp
c3RlciBDVFJMIGZpcnN0Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJbmRlZWQsIEppcWlhbiBpcyB0aGF0
IGEgbGVmdG92ZXIgZnJvbSBhIHByZXZpb3VzIHZlcnNpb24gd2hlbiB3cml0ZXMNCj4+Pj4+Pj4g
dG8gQ0FQIHdoZXJlIGlnbm9yZWQgZm9yIGJlaW5nIGEgcmVhZC1vbmx5IHJlZ2lzdGVyPw0KPj4+
Pj4+IFNvcnJ5IHRvIHJlcGx5IGxhdGUsIEkganVzdCBjYW1lIGJhY2sgZnJvbSBhbiBhbm51YWwg
bGVhdmUuDQo+Pj4+Pj4gRGlkIHlvdSBtZWFuOiB3aHkgSSBhZGRlZCBoYW5kbGVyIHZwY2lfaHdf
d3JpdGUzMiBmb3IgQ0FQPw0KPj4+Pj4+IElmIHNvLCB0aGlzIGlzIGEgY2hhbmdlIHNpbmNlIFYy
LCB0aGF0IHlvdSBzdWdnZXN0ZWQgdG8gYWRkIGl0IGJlY2F1c2UgdGhlcmUgaXMgbm8gd3JpdGUg
bGltaXRhdGlvbiBmb3IgZG9tMC4NCj4+Pj4+DQo+Pj4+PiBJbmRlZWQsIGlmIHRoZXJlJ3Mgbm8g
d3JpdGUgbGltaXRhdGlvbiwgeW91IGNhbiBqdXN0IGRyb3AgdGhlIGFkZGl0aW9uDQo+Pj4+PiBv
ZiB0aGUgdHJhcHMsIGFzIHRoZSBoYXJkd2FyZSBkb21haW4gYnkgZGVmYXVsdCBnZXRzIHJlYWQg
YW5kIHdyaXRlDQo+Pj4+PiBhY2Nlc3MgdG8gYWxsIFBDSSBjb25maWcgc3BhY2UuICBJT1c6IHRo
ZXJlJ3Mgbm8gbmVlZCBmb3IgYQ0KPj4+Pj4gdnBjaV9hZGRfcmVnaXN0ZXIoKSBjYWxsIGZvciBQ
Q0lfUkVCQVJfQ0FQIGlmIHRoZSBoYW5kbGVycyBhcmUganVzdA0KPj4+Pj4gdnBjaV9od197cmVh
ZCx3cml0ZX0zMigpLg0KPj4+PiBPSywgSSB0aGluayBzby4NCj4+Pj4NCj4+Pj4gSGkgSmFuLCBj
YW4gdGhpcyBjaGFuZ2UgbWVldCB5b3VyIG9waW5pb24/DQo+Pj4+IE5vdCB0byBhZGQgcmVnaXN0
ZXIgZm9yIENBUCwgYW5kIGlmIGZhaWwgdG8gYWRkIHJlZ2lzdGVyIGZvciBDVFJMLCB0aGVuICJj
b250aW51ZSINCj4+Pg0KPj4+IFdlbGwsIFJvZ2VyIGFzIHRoZSBtYWludGFpbmVyIGhhcyBpbmRp
Y2F0ZWQgdG8gZ28gdGhhdCByb3V0ZS4gVGhhdCdzIG9rYXkNCj4+PiB3aXRoIG1lLiBNeSBvbmx5
IHJlcXVlc3QgdGhlbiBpcyB0byBhZGQgYSBjb21tZW50IHRoZXJlLCBzdW1tYXJpemluZyB3aGF0
DQo+Pj4gaGUgc2FpZCBlYXJsaWVyIG9uLg0KPj4gVGhhbmtzLg0KPj4gSG93IGFib3V0IGFkZGlu
ZyBiZWxvdyBjb21tZW50cyBuZWFyIGFkZGluZyByZWdpc3RlciBmb3IgQ1RSTD8NCj4+DQo+PiAg
ICAgICAgIC8qDQo+PiAgICAgICAgICAqIEhlcmUgbm90IHRvIGFkZCByZWdpc3RlciBmb3IgUENJ
X1JFQkFSX0NBUCBzaW5jZSBpdCBpcyByZWFkLW9ubHkNCj4+ICAgICAgICAgICogcmVnaXN0ZXIg
d2l0aG91dCBvdGhlciBzcGVjaWZpYyBvcGVyYXRpb25zLCBhbmQgaGFyZHdhcmUgZG9tYWluDQo+
PiAgICAgICAgICAqIGhhcyBubyBsaW1pdGF0aW9uIG9mIHJlYWQvd3JpdGUgYWNjZXNzIHRvIGFs
bCBQQ0kgY29uZmlnIHNwYWNlLg0KPj4gICAgICAgICAgKi8NCj4+ICAgICAgICAgcmMgPSB2cGNp
X2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgcmViYXJfY3RybF93cml0
ZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lf
UkVCQVJfQ1RSTChpKSwgNCwgYmFyKTsNCj4+ICAgICAgICAgaWYgKCByYyApDQo+PiAgICAgICAg
IHsNCj4+ICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBmYWls
IHRvIGFkZCByZWcgb2YgUkVCQVJfQ1RSTCByYz0lZFxuIiwNCj4+ICAgICAgICAgICAgICAgICAg
ICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRleCwgcmMpOw0KPj4gICAgICAgICAgICAg
LyoNCj4+ICAgICAgICAgICAgICAqIFRoZSByZWFzb24gb2YgdXNpbmcgY29udGludWUgaGVyZSBp
cyB0aGF0IGlkZWFsbHkgZmFpbGluZyBoZXJlDQo+PiAgICAgICAgICAgICAgKiBzaG91bGQgaGlk
ZSBSZUJhciBjYXBhYmlsaXR5LCBidXQgWGVuIGRvZXNuJ3QgeWV0IHN1cHBvcnQgdGhhdCwNCj4+
ICAgICAgICAgICAgICAqIGFuZCB1c2luZyBjb250aW51ZSBjYW4ga2VlcCBhbnkgcG9zc2libGUg
aG9va3Mgd29ya2luZywgaW5zdGVhZCwNCj4+ICAgICAgICAgICAgICAqIHJldHVybmluZyBmYWls
dXJlIHdpbGwgY2F1c2UgYWxsIHZQQ0kgaG9va3MgZG93biBhbmQgaGFyZHdhcmUNCj4+ICAgICAg
ICAgICAgICAqIGRvbWFpbiBoYXMgdW5tZWRpYXRlZCBhY2Nlc3MgdG8gZGV2aWNlcywgd2hpY2gg
aXMgd29yc2UuDQo+PiAgICAgICAgICAgICAgKi8NCj4+ICAgICAgICAgICAgIGNvbnRpbnVlOw0K
Pj4gICAgICAgICB9DQo+IA0KPiBJIGNvbnNpZGVyIHRoaXMgdG9vIHZlcmJvc2UuIEhvdyBhYm91
dCB5b3Ugc3RhcnQgd2l0aCAiSWRlYWxseSB3ZSB3b3VsZCBoaWRlDQo+IHRoZSBSZUJhciBjYXBh
YmlsaXR5IGhlcmUsIGJ1dCBjb2RlIGZvciBkb2luZyBzbyBzdGlsbCBuZWVkcyB0byBiZSB3cml0
dGVuLiINCj4gTGF0ZXIgaW4gdGhlIGxvbmcgc2VudGVuY2UgdGhlcmUncyB0aGVuICJ3aWxsIiB3
aGljaCBJIHRoaW5rIHlvdSBtZWFuIHRvIGJlDQo+ICJ3b3VsZCIuIFRoZSAidW5tZWRpYXRlZCIg
b3RvaCwgbmVlZHMgZnVydGhlciBxdWFsaWZ5aW5nOiBJdCdzIG5vdCAiZGV2aWNlcyINCj4gYWl1
aSAoYnV0IGp1c3QgdGhlIG9uZSBkZXZpY2Ugd2UncmUgZGVhbGluZyB3aXRoIGhlcmUpLCBhbmQg
SSB0aGluayB5b3UgbWVhbg0KPiAiZW50aXJlbHkgdW5tZWRpYXRlZCIgKGFzIG9wcG9zZWQgdG8g
InVubWVkaWF0ZWQgYWNjZXNzIHRvIGp1c3QgdGhpcyBvbmUNCj4gcmVnaXN0ZXIiKS4NClRoYW5r
IHlvdSENCkFmdGVyIG1vZGlmeWluZywgY29tbWVudHMgYXJlOg0KDQogICAgICAgIC8qDQogICAg
ICAgICAqIEhlcmUgbm90IHRvIGFkZCByZWdpc3RlciBmb3IgUENJX1JFQkFSX0NBUCBzaW5jZSBp
dCBpcyByZWFkLW9ubHkNCiAgICAgICAgICogcmVnaXN0ZXIgd2l0aG91dCBvdGhlciBzcGVjaWZp
YyBvcGVyYXRpb25zLCBhbmQgaGFyZHdhcmUgZG9tYWluDQogICAgICAgICAqIGhhcyBubyBsaW1p
dGF0aW9uIG9mIHJlYWQvd3JpdGUgYWNjZXNzIHRvIGFsbCBQQ0kgY29uZmlnIHNwYWNlLg0KICAg
ICAgICAgKi8NCiAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNp
X2h3X3JlYWQzMiwgcmViYXJfY3RybF93cml0ZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSwgNCwgYmFyKTsNCiAgICAgICAg
aWYgKCByYyApDQogICAgICAgIHsNCiAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQg
JXBwOiBCQVIldSBmYWlsIHRvIGFkZCByZWcgb2YgUkVCQVJfQ1RSTCByYz0lZFxuIiwNCiAgICAg
ICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRleCwgcmMpOw0KICAg
ICAgICAgICAgLyoNCiAgICAgICAgICAgICAqIElkZWFsbHkgd2Ugd291bGQgaGlkZSB0aGUgUmVC
YXIgY2FwYWJpbGl0eSBoZXJlLCBidXQgY29kZQ0KICAgICAgICAgICAgICogZm9yIGRvaW5nIHNv
IHN0aWxsIG5lZWRzIHRvIGJlIHdyaXR0ZW4uIEFuZCB1c2luZyBjb250aW51ZQ0KICAgICAgICAg
ICAgICogY2FuIGtlZXAgYW55IHBvc3NpYmxlIGhvb2tzIHdvcmtpbmcsIGluc3RlYWQsIHJldHVy
bmluZw0KICAgICAgICAgICAgICogZmFpbHVyZSB3b3VsZCBjYXVzZSBhbGwgdlBDSSBob29rcyBk
b3duIGFuZCBoYXJkd2FyZSBkb21haW4NCiAgICAgICAgICAgICAqIGhhcyBlbnRpcmVseSB1bm1l
ZGlhdGVkIGFjY2VzcyB0byB0aGUgZGV2aWNlLCB3aGljaCBpcyB3b3JzZS4NCiAgICAgICAgICAg
ICAqLw0KICAgICAgICAgICAgY29udGludWU7DQogICAgICAgIH0NCg0KPiANCj4gSmFuDQo+IA0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

