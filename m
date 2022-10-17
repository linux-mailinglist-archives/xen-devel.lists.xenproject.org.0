Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE10600903
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424189.671442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLkF-0007NN-9G; Mon, 17 Oct 2022 08:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424189.671442; Mon, 17 Oct 2022 08:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLkF-0007Jx-5L; Mon, 17 Oct 2022 08:45:11 +0000
Received: by outflank-mailman (input) for mailman id 424189;
 Mon, 17 Oct 2022 08:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okLkE-0007Ji-4U
 for xen-devel@lists.xen.org; Mon, 17 Oct 2022 08:45:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff86cc4f-4df7-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 10:45:08 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 04:45:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5565.namprd03.prod.outlook.com (2603:10b6:a03:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 08:45:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:45:02 +0000
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
X-Inumbo-ID: ff86cc4f-4df7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665996308;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=agiom/3uGv4zFX2KKYUW3GwRs/WMFEWoNh3uCmaUleg=;
  b=UHUMwzaEOPvhvZ+Y2+QS13qCKtxBuz3t8t4HPUfiJOWqZh61Eyopw/C5
   neqNinaYBSHDloP50JBeKj1xF9A+yT30DIBfOo2wWaq9pcpokDTDLbfIJ
   o+m+tUTxnQDm2/0/UCWY7jCNII/x9lGSbigfwSODFczUM+kAfvLvSlIk5
   A=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 82866916
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RVhl86AnfhVZmxVW/zviw5YqxClBgxIJ4kV8jS/XYbTApDgk1zZSy
 zNJCz/VOqveNmune9F/aI+zp04OsZ7dx9NgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2t4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kVPcpf8cplCFpW6
 PlbL3M/NxOPmtyplefTpulE3qzPLeHNFaZG4jRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvN+8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toij82LGexH2TtIQ6MpG36/N42Uav+zIOFEApW1K1ouThsxvrMz5YA
 wlOksY0loA77lCrU8P3WAejqnmDuzYTXtNRF6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDps0
 UWG9+4FHhRqubyRDH6YqLGdqGrqPTBPdDdcIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:uWijSKFn9NkDBeBwpLqFRJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdoZJm58erwcpVoMkmsjqKdhrNhcItKPTOW81dASbsP0WKM+UyFJ8STzI9gPO
 JbAtFD4b7LfBRHZKTBkW6F+r8bqbHpnpxAx92uqUuFJjsaCJ2Imj0JbzpzZXcGJjWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnPdOX4VmgLfIBmj8DTeSIXCNU0H44Aqv/MkTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDvDnZMOq59ms5Vka/poVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV6Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r/NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC7a
 gpkGkox1LaV3ieefFmhqc7jCwlaF/NLAjF24VZ+4VzvKH6Sf7iLTCDIWpe4Pednw==
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="82866916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBikRUClswlDVIE1VNRpZMpJLO7LGQbpprNJjnx8kcaYtmWAgHitrLLmZyDiwsx20ISjNM3WMYlAEHpQEKPG97IuRK2xlcbQxYpGNGXM7ypHrN7JdKzFhgYiVDzIfny8QBnmbMvjW/JlrKPU6vC8Sg8ywRaDu6u4xKs1nY/eW24PE7c3SRRbYP2y7oDBw3T5uvujcjwFydWo7atY1aFeKut6us1QcTvpeFRcvEDqJXjCMDgVT7x+tMKCAy+OapgtC1OgMZrJo6Y+A6MAMp+NXhDKqIEdORmxl1sRp26gDz1AWZEPfPzzEKhMkMm+C3Np1ePVdnSNqsLhFBPND+0IHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agiom/3uGv4zFX2KKYUW3GwRs/WMFEWoNh3uCmaUleg=;
 b=FqRuXd2nR2a85bAwfBQp+NKSft1gBWAmZhwxAjvJARBh0W4/mdQsOOplXwFe9/r9BT7cehSktGC5jnNPf+LrCPwvhUQgNaBUe/JeC7UDxcvmXSyn5DgQApbWwsB6yx3fUSlZJkw9Eps3PPSYg0pkef/bulWzF4h7cHaijoK/FSyF6tQAxQXpLe74x1mTf/fGOlLk+nGx3TouDQu0kLV3b42j6/cqYWkmeld4gvlKEi0TDa9FPskZOAoHLtumTWce1NpUAmhMrSFWAXJy/VSgOvvRI/HvvDCv35CIShAl73aPhvQQwdXwyp6CFroewlyM2mJaRa0wnBDRvd9h3GA+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agiom/3uGv4zFX2KKYUW3GwRs/WMFEWoNh3uCmaUleg=;
 b=kc8ejqZqHaM9QnN0vNo+kEZedBp8mJQci6pifAMCHReK1niSPgZyDP/A0uAepDGVnRBKHoyzJ6znhsQrJd4JYHf/fE7sOr7yIAz2bFOP/zPm3rzSpTo98L2aAliiHWfFxlb04fqUmAjGDqvCKg4/mLzTml2Mt6oR+C9rPOVnMjM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Arthur Borsboom <arthurborsboom@gmail.com>, xen-devel
	<xen-devel@lists.xen.org>
Subject: Re: [BUG] Xen build error - undefined reference to
 bpf_program__set_socket_filter
Thread-Topic: [BUG] Xen build error - undefined reference to
 bpf_program__set_socket_filter
Thread-Index: AQHY4gBZi66fKRuOSUytRGSa5NRyQK4SRXyA
Date: Mon, 17 Oct 2022 08:45:01 +0000
Message-ID: <e25a9c12-92f3-936b-82fd-cf7319592a6e@citrix.com>
References:
 <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
In-Reply-To:
 <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5565:EE_
x-ms-office365-filtering-correlation-id: c85357f7-fcbb-4fa6-cab8-08dab01be178
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TC4QRfrJQ/RpG0tw0eIsABOuBgqgmrdAGVjAnk840rtgovLQpN3K+OLrmGG1amBylxN3M3SyYY4BmcyweTDCnt+jnVcnAV4g8pdkvbaIS4rSqiSotWIkzMYGkNBny15fVbkVQ4PbDb1LBbxreWcEtpb66OIY0VvmxoQiegwaP+miXIPheIGf3pX8WV5eMRMoypdCv3A60qYy4gA56b2TDJkITbiuhE3LhzpiJbGPjXax3JQwbcK/pQNJJbCNLrc/wSr5Jiv9ZyEvsMUr3qe1/hs+o7NrHBGd4wbml1KUqnLbIlO5zksRwoPlQCo+sSKanfiRmwBKzP1l8qYY7pUIinZzfo0V1fkzhQpiCCZKWnziuI6RsYS9SXOQraTRJOn/j3sE/MN3L9TswekUr8XL2d6KGnxPepV+plnS/AVYpbKMJK3mrKFtwkfFQnf5D/K1gJ79RLBa1SQQ8Brv917h7wILmh2yJr/x1j1hREZlSOLAtyveN3Mrr7MXeCvfjj1B8uMhQdbqP2BW1vg5pVrRVxjZeIWRti3EVABWLpFc2LyK9mI6qkYhn3ea/tcw/1q5VomY0+xq30sBktHB7j6XsAV4S+UzYFrhSttGx94rVRbMj4f+6AY1SX3TfGd6NYE0QrhZzgW2j8Qsy28z+AdFeHZBfd2j7bzqTH8TZP3QxcvKQcyInxl/VZZMzHTaa8h8oOlvhMW99Q1R9jn4RvzFJBRrzNQpzGc/oIjYJeUjMVUAVSFAaZ9cPRQV3lhg/7vvGiW/yC3tAS+zToynAbqtOL6FzIHFxLh586h7A3i/BiOkaYzYMhiSkTXzgb4bocbX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(36756003)(31686004)(86362001)(31696002)(2906002)(5660300002)(82960400001)(38100700002)(122000001)(2616005)(186003)(83380400001)(38070700005)(26005)(6506007)(316002)(53546011)(966005)(478600001)(6512007)(71200400001)(6486002)(66556008)(66476007)(66446008)(76116006)(66946007)(91956017)(8936002)(41300700001)(64756008)(110136005)(8676002)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cytZRm9BcDFrRVc2QXFlY04zRHFrWHVwdVp2dFZ0VnlJMjNuYmF3eXBoTzdK?=
 =?utf-8?B?bSswWlM0YU9YdkdCYUdqeTRxMWFZT29RNnFnSUYvRm0vNXlEUHpDbjAwWlhF?=
 =?utf-8?B?MTBxL0lmL2RzUXYyelBBSTZFbVdVZ0RrWlo4MTlMcERmNEY3T0d5U2hlb1Bk?=
 =?utf-8?B?TWFvcDdVbjZtemNHUVRwL1RxOUd3SVlPYlBYUzNQZ0x0c3E0dlJTaUlXNlJO?=
 =?utf-8?B?NkVxK3lLQWltdjRXU1g4VGdPZEJ1QnlORzkrZ1JOUVR0WTFpQWRQMUE3eHd4?=
 =?utf-8?B?ajU5TVFCamY5SDhPNmkzaDNuS0RETXFTVHBBZkUrdUFoamJ3NnRhTm1GUkpr?=
 =?utf-8?B?ODh4UEN6ZUJFUE8va1Z3NmtiYmZZNWVKTlgzVm9DUE5PMXlua1FsVUdaR3Zw?=
 =?utf-8?B?TlNFYlM4ZzRGN095Rk0zV2lHeUNoODZJMXA1YTVSV0ZKemRBdmdxUGtyZHA1?=
 =?utf-8?B?M1VmUjl1czFTZjBWUnp0b2JBK3lzeGxUekxhem8vWlhJTUlJZUlFbm45MEhK?=
 =?utf-8?B?c01EaGNrQnluR2NqZjJhU0V6Y0Mxekdhdk5BVTFJK0F4VmtOSVFFQVdXa3A5?=
 =?utf-8?B?Q3l0ZzEvdlpVbzMvR2tVdk1Xc1dCN0tlbTZsTnJ1NnIrOTNEQTIwYzl1eVRL?=
 =?utf-8?B?NGVmbCs3VzVoMWVIK1l2SjNlL2V1bk1BeUlHRGF2dnRFYkdib2lLcUlQS3Iw?=
 =?utf-8?B?MWg4YXcxVG9ZWlA5QitmaGVJY2pVVHdYeFdWWSs4SFE1OVd1ZWtZODVsQ2lW?=
 =?utf-8?B?cjU1bnNoU0lxQ3FFdWNLY0UxVlJuekxycWhuRUJZRXhuOVdIQ1kvNDVWTmJo?=
 =?utf-8?B?eDNGaGVTUjIrcUF3MTdpZjBYNlNjMDJhaGRBOFBZWk5GMTNIMGZrOUVURFFn?=
 =?utf-8?B?ak5GazN1QU9QU293bGpQU3pSQU84aUJpaGt2UUp2Zkt6NkJzcm1EYmJWQXRw?=
 =?utf-8?B?bmc0NSs4cWFjZlJONnFnbGJCRFFaeHlnWjFudEVEWWt1alY2b1N1cWlob2Zy?=
 =?utf-8?B?OFdBLzVsWTNKYVRRRU44OEl4K2ZqdmFGN29RWXZteVlDUGo4QzlvbzNoWXJP?=
 =?utf-8?B?b0dvSVZUWUNXTzBZcHcyVkl5OWkzVUZwbUtuUkYwSDFXR25HVWVISkRtNVRj?=
 =?utf-8?B?YU9JWm03RzdTdjFOb3c5bGIwZWJTMlZ5bjJ3S3hYc1JMU1JFYnBXY0lweHNl?=
 =?utf-8?B?aUdJcGxEZUZrTnhHMGRGQWVjZUxlREVsc0RKV2JJZjY4L1FlV3ZqMEV6ZkJ0?=
 =?utf-8?B?VmpibmF5UDlVNkxBS1YrVStEUllzZkF5dzdRaEhnWENDUDJPS1lYQlU2QzM2?=
 =?utf-8?B?T20xS21BK3RhUTB2R0xRWndBT1h1MlZ6c1JlVDBhNXJQUjBPWjBORUNaVnFj?=
 =?utf-8?B?MEF5eGlSOTVqUFZaWTRoQ3NOcUVVMm9wZ3dGUFowc1BmSlZuQUNYRVhsMyto?=
 =?utf-8?B?UHR1cHk1UjM2K0pOMy9kMEZaK0xadllDemttM0JlclduZThjb1JTSWNMWTd5?=
 =?utf-8?B?TytJaG9OVkdsVkFZdGw4NnoyelExSXgydTZDdkszRWtiOWJ6YnhKbXNWdEd0?=
 =?utf-8?B?bFRZaXB5cHFCYWFDOTlJeW1Dd2lPcWFtdHZmY1ZYYjJzeTJsN2FjM2krM3ZX?=
 =?utf-8?B?TXFOUUw3YklSRWt6NDFkMXNTM211NWVxZTFHSXNHRGlCcHA2WEl4NlJGdkhI?=
 =?utf-8?B?SGZYYTZWaGtMaXhpNXRZc0NRL2lYSElmOXRUU1FwSm5ka3pBREVBT0NraXVG?=
 =?utf-8?B?RkNtWDJ0Y3NCWlM4Ujc1TUpobEpualhKOVRXNnVsd0tVZi9DNjFPbXBhQ2Q4?=
 =?utf-8?B?SGVwUUFCaXIyZEYreEdOZnIzb0Uvb2VFb3EySjJwTGhOZ3ZiQ0xscEVmVnlm?=
 =?utf-8?B?dzhDZlpoaTBXa3lBZmNpOWRNTWVMd3BHSE9hYjZGcURxODN5b1ZBejB0Tks3?=
 =?utf-8?B?R2hOcllvYlYvbURjeG1ybDJsMVZEVnlYa3djQXNtVFFyUTlIUmFpcTNnY3J3?=
 =?utf-8?B?ak9KWGRhejRPZDNUK3N2NnIzK055OHNMcVc1aFlGSW1FSXRJYVFpckdyeTBH?=
 =?utf-8?B?bmJaaG5Eb29rdU5Qb25xSzBaZEFHZ2s3d0hVSXZOcWJGcW5wSGo5TityVzVI?=
 =?utf-8?Q?Ai18d9H0wra+aSSzQmFC2k8aF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B6F7D854649B24085372E0705C10B7A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85357f7-fcbb-4fa6-cab8-08dab01be178
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 08:45:01.9116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHVl5YoC/C5udwZdbdY4JkHIaZ8Z9qiBz8PNymwEYu/Mpt502UJNOQhDORTPXVHMyPLUwNZII73X2XsmWqWmdr9TbxUs5SGkKBid3Y7t3dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5565

T24gMTcvMTAvMjAyMiAwOToxMiwgQXJ0aHVyIEJvcnNib29tIHdyb3RlOg0KPiBYZW4gNC4xNi4x
LCA0LjE2LjIgYW5kIDQuMTcuMC1yYzEgZG9uJ3QgYnVpbGQgYW55bW9yZSBpbiBBcmNoIExpbnV4
Lg0KPg0KPiBJIGJlbGlldmUgaXQgaXMgY2F1c2VkIGJ5IHRoZSBtaXNzaW5nIGZ1bmN0aW9uDQo+
IGJwZl9wcm9ncmFtX19zZXRfc29ja2V0X2ZpbHRlciBwcm92aWRlZCBieSBsaWJicGYuDQo+IFRo
aXMgZnVuY3Rpb24gaGFzIGJlZW4gZGVwcmVjYXRlZCBpbiB2MC44IGFuZCBoYXMgYmVlbiByZW1v
dmVkIGluIHYxLjAuDQo+DQo+IEFyY2ggTGludXggdXNlcyBsaWJicGYgdjEuMC4xIHNpbmNlIE9j
dG9iZXIgMjAyMi4NCj4gQSBkb3duZ3JhZGUgdG8gbGliYnBmIHYwLjguMSBmaXhlcyB0aGUgWGVu
IGJ1aWxkIHByb2JsZW0uDQo+DQo+IFNvdXJjZSBhYm91dCB0aGUgZGVwcmVjYXRpb246DQo+IGh0
dHBzOi8vbGliYnBmLXRlc3QucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2FwaS5odG1sDQo+DQo+
IEJ1aWxkIGVycm9yOg0KPg0KPiAvYmluL2xkOiBsaWJjb21tb24uZmEucC9lYnBmX2VicGZfcnNz
LmMubzogaW4gZnVuY3Rpb24gYGVicGZfcnNzX2xvYWQnOg0KPiAvaG9tZS9hcnRodXIvLmNhY2hl
L3lheS94ZW4vc3JjL3hlbi00LjE2LjEvdG9vbHMvcWVtdS14ZW4tYnVpbGQvLi4vcWVtdS14ZW4v
ZWJwZi9lYnBmX3Jzcy5jOjUyOg0KPiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBicGZfcHJvZ3Jh
bV9fc2V0X3NvY2tldF9maWx0ZXInDQo+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBl
eGl0IHN0YXR1cw0KPiAuLi4NCj4gLi4uDQo+IG5pbmphOiBidWlsZCBzdG9wcGVkOiBzdWJjb21t
YW5kIGZhaWxlZC4NCj4gbWFrZTogKioqIFtNYWtlZmlsZToxNTY6IHJ1bi1uaW5qYV0gRXJyb3Ig
MQ0KPiBtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeQ0KPiAnL2hvbWUvYXJ0aHVyLy5jYWNoZS95YXkv
eGVuL3NyYy94ZW4tNC4xNi4xL3Rvb2xzL3FlbXUteGVuLWJ1aWxkJw0KPiBtYWtlWzNdOiAqKiog
W01ha2VmaWxlOjIxMjogc3ViZGlyLWFsbC1xZW11LXhlbi1kaXJdIEVycm9yIDINCj4gbWFrZVsz
XTogTGVhdmluZyBkaXJlY3RvcnkNCj4gJy9ob21lL2FydGh1ci8uY2FjaGUveWF5L3hlbi9zcmMv
eGVuLTQuMTYuMS90b29scycNCj4gbWFrZVsyXTogKioqDQo+IFsvaG9tZS9hcnRodXIvLmNhY2hl
L3lheS94ZW4vc3JjL3hlbi00LjE2LjEvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MTYxOg0KPiBz
dWJkaXJzLWluc3RhbGxdIEVycm9yIDINCj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkNCj4g
Jy9ob21lL2FydGh1ci8uY2FjaGUveWF5L3hlbi9zcmMveGVuLTQuMTYuMS90b29scycNCj4gbWFr
ZVsxXTogKioqIFtNYWtlZmlsZTo2NjogaW5zdGFsbF0gRXJyb3IgMg0KPiBtYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeQ0KPiAnL2hvbWUvYXJ0aHVyLy5jYWNoZS95YXkveGVuL3NyYy94ZW4tNC4x
Ni4xL3Rvb2xzJw0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjE0MDogaW5zdGFsbC10b29sc10gRXJy
b3IgMg0KPiA9PT4gRVJST1I6IEEgZmFpbHVyZSBvY2N1cnJlZCBpbiBidWlsZCgpLg0KPiBBYm9y
dGluZy4uLg0KPiAtPiBlcnJvciBtYWtpbmc6IHhlbg0KDQpTbyB3aGlsZSB0aGlzIGlzIGEgYnVp
bGQgb2YgWGVuLCBpdCdzIGFjdHVhbGx5IHFlbXUgd2hpY2ggaXMgZmFpbGluZy4NCg0KVGhpcyBj
YW4gYmUgZml4ZWQgYnkgY2hhbmdpbmcgdGhlIHZlcnNpb24gb2YgcWVtdSwgb3IgZHJvcHBpbmcg
cWVtdQ0KZW50aXJlbHkgYnkgdXNpbmcgLi9jb25maWd1cmUgLS13aXRoLXN5c3RlbS1xZW11PSB0
byBwb2ludCBhdCB0aGUgbWFpbg0KZGlzdHJvIHFlbXUgcGFja2FnZSAoc28gbG9uZyBhcyBpdCBp
cyBidWlsdCB3aXRoIFhlbiBzdXBwb3J0KS4NCg0KfkFuZHJldw0K

