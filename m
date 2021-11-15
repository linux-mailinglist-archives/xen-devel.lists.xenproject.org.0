Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D694D4507E0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 16:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225968.390353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmdad-0007ha-8I; Mon, 15 Nov 2021 15:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225968.390353; Mon, 15 Nov 2021 15:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmdad-0007ek-5D; Mon, 15 Nov 2021 15:08:11 +0000
Received: by outflank-mailman (input) for mailman id 225968;
 Mon, 15 Nov 2021 15:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmdaa-0007ee-SM
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 15:08:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4ec7474-4625-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 16:08:06 +0100 (CET)
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
X-Inumbo-ID: d4ec7474-4625-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636988885;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6xdTbVenQdMWBRuaOCN74mHWSEE7yQy6MA2sZhtMZ5U=;
  b=dI6kcHx75S4viX8KTUofH8GUQCoz3an8p9bpjO7uBybf/BqTOc+DWFGG
   7sI4G/iHSJr4MmKw1JwuNTEapWZ0MucvNURF/O5YkNJrvIH2TIRbAMtSo
   1B9OIGu3cVRJKZrYu4lqni8g8vGrf7Kg5aVyVFOFxDd99ciZPNONjw9FM
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5Wh8LWvqGBWYTFWVXjYpzEh7lG5I6RmYwtTGuqM4hbZlVrbJuE2W6DbvEZRmEXjKYy0O0ZvBuX
 WwddWhdO5fmfDS7DchgAaE5+jNr5W+x2Y20C99T09eiOdvTz7xXaHDHMS85OwoCnFS7T0fw+H9
 aND2jD4Ehp/meVdgCJhArTOsMeK1MW8x/8PoXLlTLaf+4bcOcDTdRQAqFSnkTWk8Xpmm/Z0nR7
 pN93T9pN8/P9Ir+mq2hd+YcQEUCIXrvNIDjq8Ke8EhloHZFJpo/kTHqwGWhawWkwYpEuNmIdR2
 iLvwUYPVcL+UgZWv2bXc6V93
X-SBRS: 5.1
X-MesageID: 57804117
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GsLTIqs04xpV88TKRRH6X27vKufnVKVZMUV32f8akzHdYApBsoF/q
 tZmKWCCPa2KYDHyKdtzPIuz/R8Bv5+HyYRlHlZopClhHyIT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2IXhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllMeoEV1wHYP1iO0lXyIAIXpSPaYc0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258eRaqHP
 pVxhTxHQirlIANCCggrC5Mmht/xikbSKDFbgQfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMSW1D6t4n+qwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhvojxXWY2k5OsWXul+ozMn2ieOSNPBDpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZldtvl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT834JrWvFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqVZVzkfa9SYq5Cpg4i+aihLArLmdrGwk0OiatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaKMmu14JNQ+90mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq670hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:rKa0uar3C7MQTJ7r8SgUHNAaV5uxL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57804117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTUz/egjEhfTD80SZZvvVv/GoxYbTwYcSmW/hwOFUYjYhN4QDi8Wo4aQBDDwYbycBvDoQgmcvDIc6KSUxOD9SzMiW60vjtJxG1vNpSEjlBetlWk8IP1a3fJm6SYC6FyMc8CxTLFut0qo7fDMMB1l0ce+0eSjNjEnNdpAWduPh870uDYS7gsT0mPwcKDYvZQm5rIkPoc8VpN/URs7VlxoE4AtnZN+/EIl9P7bnB74AsEicMxakJjo3mGlzbehWR8gx4bIV7215ByiGit4oxhf9Cgqbr8wXU+x6pJNx0PjzSRoxmrDiK7G/a80XGq+8LlqXmXkgb1HWFp8JiRkXo4Vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpUxpJBLLE5ifRi6X7EwQyAJ/YnWuq1e6oq4dYev0pw=;
 b=oB2WX9ad4RE4lZW4waZoU9iQWViuhFw+qnDXvDwluECHEoaBi+QvVdjD8GyDxcwCM71Jfm44A+hAaJEJnq3uocagG/T/Az3PHtj3Z7yGdBVqNXqromMkLvlXzWaK+IPiciYnvoKxo+dDroGQ/hR4W05oGCYeaBaaWt6aSTq/oTofnGp9rREFxgtq51JQCo2oMEtgC5C4R71JOoPuw4kPur0zG3WKMiZgY2Zndk6NmAMcjMSvxeIUiQ0D9+F07Z4YhOMJck2lwqMXyvU8HGv/8dRVmPq+gCdDJmQtGRZNJr2aPi92Ro3OiQ6iCwSlUMkeC14niQHxjIsJwvi5BvcdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpUxpJBLLE5ifRi6X7EwQyAJ/YnWuq1e6oq4dYev0pw=;
 b=usMDTAWCub+sTCyua2Tf3foHkwyHZefaMzTjLLgvjkOEL+BzvKLgyRg9PZdMhydmK3tIaSPrg4d47yn7IiyaaY3qQw75UOuBmoHu+TEh+hNWfqgtDWKfMzsCcbqGDgwaym04kQbMz56E40t2oIdcJbHbxZYIvWtsrvEcomuE588=
Date: Mon, 15 Nov 2021 16:07:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2.2 1/6][4.16?] x86/x2APIC: defer probe until after
 IOMMU ACPI table parsing
Message-ID: <YZJ3y56FFerUa0gu@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11a6c43-ef8e-403a-28d6-08d9a849b72e
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5605A7E050E508B6DB727BBE8F989@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhoNKU1PpHVmH8wNZl3YmdB7q+YaD9wuRMSb7J2ICkzMp0IdnAao41dGRmTTSzySUIWeLh2IdR1xOH5Cg8uqxygVpMzsoyA9kYBE7pltMArcMzHwH2euqnFEhrRnCGHCeBhLMUPXwCLvH4/z9XwNw7dxNkylon11gMLXQ041eLuPsoi4xAGPSMeXMHNQ2YeyKR/ZJVUBGSTkvWjNoLCTvroiK9bTdRIWyAbwweH4cEOVkzoNVcETOAeKv63f2pbhhWc6pLGKQnSCjkmhlYDcwT5vJH/+EIXpubpr2qbEIqNX7UEVnNKnEnJFU0+5fnNq6daQ+5oIyNyx3YpDrX7jDvyHAgZ18sSpI/18JAUSvbi3Id8eAe/QCWGvebJMaYFU8qNIhhVC6s4PRlfKqqjWJS4fzQnKhqNvmK4OOqPOJMxYSY/Pm3sUleEgrch2qlZc2enf8lqrPqcbo81W1M8BLgBgpkuYj4LxFDNxA5wmcsKI3G/i6w4HznoEhz5LZX53HgxA6w0zXsv3TYrmlf5jcKzchMCJjcSD1rZ+NUTU6CGxD/i5pocFWurp/rSfT0sO5x4ARR+B3ZN8d/aQVkrd81+Q08RSxn+4Dosj2Dw8q6B2bJ/EQdfa3qUoZ0YJfQl6S0vgzLxbjjxgK5F5nITNTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(9686003)(186003)(956004)(83380400001)(6486002)(6666004)(6496006)(66476007)(66946007)(66556008)(8676002)(33716001)(508600001)(82960400001)(38100700002)(8936002)(316002)(4326008)(54906003)(2906002)(85182001)(26005)(86362001)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU92M1BDd3FWeUl2dVVQd0RhVDlkcnBob0pHcXk2MFcvQURGUi9wR09WTVBl?=
 =?utf-8?B?Y2NodWpqSWJ1bjVvb3R4ZnIyem1pRW15TGd2WllTL0FiSzJUdlN0ZHFNc2xC?=
 =?utf-8?B?VGZUK04zdzA2WEJXWW9IbUpPWHFMSk1IRlA4RUdQamtxU2prQ2NzMDRuRGNW?=
 =?utf-8?B?MjliaGJ6Y3F2L1hCd1M0Z3NTemZTM1BPV3FVbVJTWHFsNHBqR0s2NDlSRlEy?=
 =?utf-8?B?VHpLU2svYVM5Wjc3U20vU2hzOE5OOC9KWVp2K3lhVkdvS2Z1d2tXSUZtU0Nl?=
 =?utf-8?B?c1BqVG5nWFFnV0oxQStJTnp1VTBITm9SdXZTSWNWWjhGOUYrYlhQa2hIdENH?=
 =?utf-8?B?WmRITFZKK1JWRXBuTzNnRlNVSkEvZ2NMQ1JrMDNvdHRFNVgvbzBzZ3hVM2or?=
 =?utf-8?B?NXBRY1Fha25URTVWNEFaRVpyMlVVK3FySmFxOC9ScllmOE9nUFJRZzNaNldU?=
 =?utf-8?B?YldicjhWUSs2SmNHQVRMRGVaQ3Nnd29jWDVHK2JvRVVXYnV3eGRtbkQvbHRZ?=
 =?utf-8?B?RlI3Z0JlQkJOQlhqNFhZSUpWVjB6QVUxS09PV0xxQ2xidFNLTXAvTmh3RTVW?=
 =?utf-8?B?N0FRQUVNMGxyYlp0bEYwVElWOFpFVzF3YSs5SjZ1QjMrU0VpY1RVaGY4NHlZ?=
 =?utf-8?B?YTRDaEhuVEI2UnBGNjFHWlBvU1lFVEJHeHJYUnVVMUhscEZCcHZhS0l2VHpN?=
 =?utf-8?B?NHpHVkZ0czcrVURvT1pwZEdoVWZxdklUSjlLekk4eFdDWEJLU3V1OEkweko2?=
 =?utf-8?B?dUdJWG96bE9Bbmc2V0hPdFd5ZXpFZ0lqUEswV3VpTWZSM2hDMnZOR0IzTDl2?=
 =?utf-8?B?K1RaelRCcStCY3ZDWXA4Z1lZSGd0ZVBKR0FpR3dYUVBvTStmbVQyc1oxaWlh?=
 =?utf-8?B?bTVCeEM5ZEVnT3ZidGllV3dmYWlhSHdFQ0VDOGZaTy9sM2kwZE9paGNaN2R1?=
 =?utf-8?B?S0tQSUJQRXcvRFQyaXdyQXNUZFNGWW0vV1o2V25oaXdxQjJwTTNObUlJZDBF?=
 =?utf-8?B?VVNsVUE0TC8zLzVma2RiM3dVWGUxeXRKK2EvM0Z6VEVjYTFRRzA1dmtUOHlW?=
 =?utf-8?B?OFNXMWtwSE1KZ2w0elJ0WTlXVU5udkNsM1hHa3hTNXl4dXY5R1czbldqWXIy?=
 =?utf-8?B?K3U3b1hxMEpYR0k0MHJvV0VsR0duMnVmVS9PMjJZWm1oS3h1b3JGMXBNMGYv?=
 =?utf-8?B?Ylg3TGhNMjluREs4OVNjMjN0YUpLNFZEckZ6THdwbkpwU0hsNkFFQ3V4TFpt?=
 =?utf-8?B?M3liT2dXUkJCV0hXV3FVQ0gwTjhpUHNMWXVESlJxU2x1QVhqTWJqcm9FOFhz?=
 =?utf-8?B?T2Z4dFlFYnJRVzMyZ05oblp2cWo5bzlBUHhhRHVYaHlUSTh2c3VtN3lIcW1o?=
 =?utf-8?B?MEtSanJNUy8wK1E2RTJPR0Nrd3FSUU5qK2pKYmxBbUNoOFFHNEU5aTZ4QmRF?=
 =?utf-8?B?NEFOcWtSUkNHYXoyMUNSNEpacjBhYmF1TzQyQVBpWi9ROG02OVgrUEZjbER4?=
 =?utf-8?B?T3dUZnFpZzRCck9MaFEzWE9vUkZrS3U2QzdldWVDaGhBTEJsNWZxQUlabUV2?=
 =?utf-8?B?cUtFdWNSSEVpRkhjNFVHby80d1hIMzNRK3ZVRWNvdGtTY3B4aTJIRzB4NWlu?=
 =?utf-8?B?N0V3VFNHdHJtWGR4R05yZXN1WGpsVUxVeXJKNm9hTmdCS1RoN0VjMVI4WXFU?=
 =?utf-8?B?RVNHdGpMb0Z1bkZvMUIzN0g0cGR5d0t6K3dJTmxDM3pwQXQ0bkRDd0oxNGk5?=
 =?utf-8?B?UlhTYlp5OTdPVWxZdXBXY291aEhhMFE0MUdvMDFLVktqb1kwL0xwa2RvVlE2?=
 =?utf-8?B?d0paNUpYa2JFUCtLN0JKRXY0aWNWTzZJM1NzcFV4SzYwbk5odE4vUGVRVENR?=
 =?utf-8?B?UVFhS05kWUJIOHp4TFpLZ3lvRXNnYzdsRmxEbTZDWmhzMDhmdmNkb0pjbWwx?=
 =?utf-8?B?Ym0xZWd1NE1DeXFackNObVdqYThKWGZYNzZKNmZDbEZJbzJmS09DcXRSOWxI?=
 =?utf-8?B?ZzY1bzJmSGtWOGJTazlQVzNZOHJvNVNTUEh1ZkFYTmhTN3N0RStJRmxxd2wz?=
 =?utf-8?B?clhMMENXL1psR2ZQRm01S01ENFo1aTJHcVNINHB5K3BSaDIzZFE2RXFTV2RY?=
 =?utf-8?B?c0thbHFmSk42TzlHL3hPY1ZZL0p1WURjRlRTVDBVb3pKQWNLVU9jUVZ6L2hl?=
 =?utf-8?Q?QdEjekwK8KoE/ZTSbOoqr2I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a11a6c43-ef8e-403a-28d6-08d9a849b72e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:08:01.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 120W6rKltcn30g6d9SoiDHhR484QV9PZlA+wMMvXqiud8yI3QMe0TtRQKtI90TozxUD0dYyvw9pOrqjum8kbbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Mon, Nov 15, 2021 at 03:31:39PM +0100, Jan Beulich wrote:
> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> affected: The call needs to occur after acpi_iommu_init(), such that
> iommu_intremap getting disabled there can be properly taken into account
> by apic_x2apic_probe().
> 
> Note that, for the time being (further cleanup patches following),
> reversing the order of the calls to generic_apic_probe() and
> acpi_boot_init() is not an option:
> - acpi_process_madt() calls clustered_apic_check() and hence relies on
>   genapic to have got filled before,
> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
>   occur after generic_apic_probe(),
> - acpi_parse_madt() (called from acpi_process_madt()) calls
>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below.

> ---
> Based on code inspection only - I have no affected system and hence no
> way to actually test the case.
> ---
> v2.2: Move generic_apic_probe() again, but only past acpi_iommu_init().
> v2.1: Respect acpi_disabled in acpi_iommu_init().
> v2: Don't move generic_apic_probe() invocation, instead pull out
>     acpi_iommu_init() from acpi_boot_init().
> ---
> 4.16: While investigating the issue addressed by the referenced commit,
>       a variant of that problem was identified when firmware pre-enables
>       x2APIC mode. Whether that's something sane firmware would do when
>       at the same time IOMMU(s) is/are disabled is unclear, so this may
>       be a purely academical consideration. Working around the problem
>       also ought to be as simple as passing "iommu=no-intremap" on the
>       command line. Considering the fragility of the code (as further
>       demonstrated by v1 having been completely wrong), it may therefore
>       be advisable to defer this change until after branching.
>       Nevertheless it will then be a backporting candidate, so
>       considering to take it right away can't simply be put off.
> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -757,8 +757,6 @@ int __init acpi_boot_init(void)
>  
>  	acpi_mmcfg_init();
>  
> -	acpi_iommu_init();
> -
>  	erst_init();
>  
>  	acpi_hest_init();
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1700,15 +1700,30 @@ void __init noreturn __start_xen(unsigne
>  
>      dmi_scan_machine();
>  
> -    generic_apic_probe();
> -
>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>                                    RANGESETF_prettyprint_hex);
>  
>      xsm_multiboot_init(module_map, mbi);
>  
> +    /*
> +     * IOMMU-related ACPI table parsing may require some of the system domains
> +     * to be usable.

I would be a bit more specific and likely add "...to be usable in
order to hide IOMMU PCI devices.".

Thanks, Roger.

