Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA249056F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:50:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258039.443901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdO-0002ih-7V; Mon, 17 Jan 2022 09:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258039.443901; Mon, 17 Jan 2022 09:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdO-0002go-3d; Mon, 17 Jan 2022 09:49:06 +0000
Received: by outflank-mailman (input) for mailman id 258039;
 Mon, 17 Jan 2022 09:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OdM-0002gi-JI
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1fa4dfa-777a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:49:01 +0100 (CET)
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
X-Inumbo-ID: b1fa4dfa-777a-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412941;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FHga6QLtp6Qqg+MNoEEFLDgBVnQdz+4xyJu2bcqn3rU=;
  b=QQi9Uwd8XlQzW7lQk5cgeq/8P83DDX5h6ZpQc7+l8+hhbNveo0evwu3e
   Eh/YUoTy8GzsgULknzEDTjQZOfK6uj/Ec0B9QCMMisJ8OZCCXIjUI9D5g
   09LCgMwTY8lFgoJKUdSbOgLvphPSaz2A4umd2YL1ZndtarE1omUg3WSXX
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nhLzeuLLWpwfSw+IzBuaRByy6tJDO1wCO7HXnnyN5Ml5MxYiTghhsICYX3l95+Xb/PfqKHbNhx
 bsGuHIIsSnspnMjlUdx+ESUcikY47Pfet3hhimGEz8V3HU5jcx2IAPCUdXhC/I0VeuWuL5dTxX
 xCyCia8JQWxsaeEoDb+miBVfGi8th8QRk2fHF+LYAeS7FrMB3HDTMqEFchtJfnzato5t/sk6+E
 qLB/oi87Ep8MTaui+YOUNQK22fukF7COdm8pz6ORjXEtGeG+Y0uNzvYej+CkbXK3w3123XwEPt
 p/ZUZmHY0VwG3eA3L9xD32FK
X-SBRS: 5.2
X-MesageID: 61616882
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P2f5Uaw4OJzmPhmW5Ht6t+fHwSrEfRIJ4+MujC+fZmUNrF6WrkUPy
 msaWjjQP/eIMzfzctB1YNy+8E8O7ZPdn9ZqTQE4+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdm2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9NLz
 dFhm76pchUkb/PTwbQeQyZWCD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEBgm5u1pAUdRrYT
 5o1YDhLPCTJWR5eYFIeM7lnlua2r3aqJlW0r3rK/PFqsgA/1jdZ0rf3N8HOUseXXsgTlUGdz
 krE9WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pAL
 2QE9yxoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILX2QOdKkYmVwVTZY14q5ZmRiwV2
 ESWyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7EFDFtX
 1BewqByCdzi67nXzkRhp81XTdmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hOJ4l4Bv88PYCX6BUOSX25XI553pUQHPY60Ps04k/IUOsQhHON51HwGibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OSDJIZ9YbgrmRr1pvcus/VSOm
 /4CZpTi9vmqeLCkCsUh2dRNfQliwLlSLc2elvG7gcbYc1U2Qz9wWqaBqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:VkMkcaO+NZfdksBcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KXHCWGDYqodKbK8gceVbInlvhJQpVYAUdAc0+41MHfTLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9t1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr3FtuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4Dn0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqU12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pSVFZol/1QwKppKuZAIMqjg7pXUN
 WGTfusrsq+SGnqIEww5QJUsZ+RtndaJGbyfqFNgL3W79FspgEJ86Iv/r1sop4xzuNCd3B63Z
 W1Dk0RrsA3ciY3V9MLOA5Te7rANoTyKSi8Q156Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="61616882"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIvv/bwwvTP9kCe+5dKlLHmeRDPvIGPd2acuWjZxKsPPXVMVzwzPk/iM5Kd/FiPxulQKKXMrZXZcTY8BGitdDyby6qGrgwAr47ciTRgU/bSoNs1lpbGY7CLo/Z5MqXIn0/NI2RGAQD5p7mluDN097hEjGi8pDQ39hWmrz7pfLwVootnHZ0Xms+zWccPHc22LtaWensuvHVoptdONROy2ay4THlUcAmWc0qKf1qAcElqM1yxhbZocE4phJdBvQkBYcjRJ+bQYBslqbPUPlDwy7Cs377DCgv8UYS86qTlAXUY3IvBrsRfDxoBvxhaZXZ9fTNXr8HLShqUi1Na5bktRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jPFzw4t+/chj9LsEJJtqma0zil4BQfocNH78tOpUow=;
 b=Z+WKQts4cAT8qI9qDK8b8SOqPVHCP4k9P/kea1MdShHiDlyugsZN2bxpt+UXzmH7iKwcDuOWrlpPNEwQpIknKA0EfFpxMyppRYDRtKxCtQCCxRux3PlNQzqFo8cK1WvaEYf4mnn0E0BWhRXBSms2Nad1mr9vb2rUK8C+oNAhdkCugExPaqT3CsZsjqFqCByXISkxApGYC8/kxhNN6EjIR3ldaNc3Po4rQchgdvpUXDuqrflHY/OxopDhQj3gkykTcycKAly7I7ke2FV8EvdBvxDbPvaanoXCKNMjmv+PGR6kOT2f6OXkIRBJX78hbv1UdqY0v9VPF1lskICBNuH2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jPFzw4t+/chj9LsEJJtqma0zil4BQfocNH78tOpUow=;
 b=UQ9ChEUX/dhDk/5wf6EB80ap9uxvcWJEnHOJo8ryV5A4Wd8ZSiFk4kxjU7iLyeWizHTWiDy6I9hMVeEVe0XUbACkbdZwRWxgQJmlmc57OAKg7oHVpYy/Nu6DZ+svUXgV2xsjTuIKzech7Hlvh6ms2dJPk7elnliRWnpVL9OZgs0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6 00/12] libs/guest: new CPUID/MSR interface
Date: Mon, 17 Jan 2022 10:48:15 +0100
Message-ID: <20220117094827.16756-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 255e38dd-5d7e-43b0-2229-08d9d99e9430
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB40598CBBA760F1A80B71903C8F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30/zElRhqjTaJydsu7aCWz6KptMyH3k91ki02kwfLKCSY3+A5UxmsFx0IP4Szx2ptbxzab4iBRtT/ET0qKg1eXz06nwAPBQWyLmPNNWEIKF+Wds2Y3pGQEUSJ/1Cm9fsW1VLs/JiuxS9eFHxxz2pgVu7YNAP/fk/mqYz4Wfio67QJb0wgeu8nwzquYtptFS0njtLsmAiFUTPZ63GjyqXkYmj3fzD9xx8XSeLVMdXPKRdYEj+3l2+n7QF4UIYi2pgerBALT7tlYcdAqUDk7SA0lpk0WtEOPIRXWmdv5UDkzfbaR8GKTQHYQjuwywDGMDsa1hIE0fGL3JVynK4SJLUkZ/l7JRBHBhaWy65UM1yAKmgdmg1KABqSb2NygUH6OV9yFfbE7c8eMB2D3ErFVNCdS6EFj9Tpt4k9xK4uOJHao+LAcG56ONnzOobdoyoSidaarXXexCtLrxu9FuL50C3MWO0wZxRGpL/LFQ1rYAjW25KD4jUFD+blIxTehCiHmABdtzrIarT8/PJxjifcvB6V/i9kOdUg8vYJzZmxxy/Dl7UZcUJOsTfZfF0JeI1QwLQ49OrvhfE1clKKftKPFYigHL+1SGQT5aPWkSnh/Zl2akMaZroWbPbvlFoN7WBDLFLHLe9X3y1SpN8CmCJyIgv4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di9FbkhDc2J6U2k4bEVYakliNEErTFFYYVh1UWFVUHlxZVQyMU5wVVdXVERm?=
 =?utf-8?B?clJtdVFmdVhNN3VUc1RleUV3U1VLMnhvZ1YzMEVJQm15aGFzNWtnVXZwN3Iz?=
 =?utf-8?B?MEsvNVVwNmxCYXBIWW52UjRQWG9Ua1IwenZGWEVMMHpKTTEvdmRXL1JRcTYr?=
 =?utf-8?B?ckJRaktEUnFzVlI0RzlGN3JCQTJuL1UvSzl0SzZJeUxXbnZIUEtHeDdOK2dM?=
 =?utf-8?B?MjJhT2NGVnpkRENjK3JkbjRtSCs4d0ZtK0dPMjhKK0Jta052Mlltb3hDUXV2?=
 =?utf-8?B?VXdKcU4wa1VnWTk4N2ZleEpSYS9sT3FHL0pwNk1qYzVUQVdjUzYxdkVFRTBz?=
 =?utf-8?B?Y0J3eDFDcXhBbmxROCtkZ0Z6cmg0bjY0MnVxYXMxSEhWazM4OUhRZ3JwTE5u?=
 =?utf-8?B?OEI4Q0hDa2lvclFTbHhyYWZCOFdxVnlDVVo4MkowdmwwMkd3ZTBLMGMwQVRm?=
 =?utf-8?B?bzNMeFMyLzhNYzV2SVI3NDUwenFXbmpRUGpLTXJxSTMxa3RBVzJKQ3NNSWE3?=
 =?utf-8?B?ejlrY2FyTlMwUEREcGFGMi80dHNDK2VKOGt6d3F1bDQ2ZFROdkp4dVRabGQ2?=
 =?utf-8?B?SFNVdTRPYUxqUlRIb0JiK2pic2VhYVFlZFRqU3p3aEtqTklQa0pBYis4TlBT?=
 =?utf-8?B?a1JnUVdoT2FFU3FUMWNVa1NYUGxSY3Fpc0cxLzBabDZjc05IUjBkRmd0MnB4?=
 =?utf-8?B?T2llRC9Sd2JoMFNOZWdiSmE0TXFRaG8zOSt5WWVza3lDM1o2aGtvS2t0S1ZH?=
 =?utf-8?B?Qm5wcXlwUXFKblRwSU0yVG1EWlYyTlRxblNHZXF5QUxzZTVzV0dZK2NkaGli?=
 =?utf-8?B?Q0hqckdRbFlOalpjd2dFVnN3SWdKUDhtZC95Syt3QUlsb2VEUVBvMHRQMGV0?=
 =?utf-8?B?OGJUbjZVL0kxYmFUZFR0QUdad2ZrT3dYWGh2VGRwbXJGeVZzNlM1akEyNGd1?=
 =?utf-8?B?RDgxNTYxR3BaSmtvRmNtTkVOSzhTQmRqYnpLZDArRU05OGVENkFzckJMeEZq?=
 =?utf-8?B?dnhwREI0aWJTdWJrUGtlcnVhazlOVVgyY2hKQmVQdmlJQXV6dGJnU0dCYjhQ?=
 =?utf-8?B?bnFuZFZvUE1BZmZ2YVpuSW1yd0Z4bVFzSW9XbFdSS3NleUJsNXo4dU41RGlJ?=
 =?utf-8?B?S0FwZEV2WVgzSkhDVHlIQjRQck5qeWRyRGhRVTVZbDhKK2h0d3BIL0lvUGxM?=
 =?utf-8?B?OVRuSmtzbXFiOTkwcEYrM2xYdmtObURUN1pPWDc4bFcwYWU0M21lMFo0U0Mv?=
 =?utf-8?B?VnM2bVBlR2lvY1RZc3pMcGVQN2h0b3dDY0VhNmw3TkQvU1lNd0tQYlQvaDd6?=
 =?utf-8?B?UWV3RG5BeDd2UVh6OU9RVUhReWFFT3IxSDRMTFpPNHNVbFhjZjM4aTVieCs1?=
 =?utf-8?B?TzFVVUtmczRDSkRLRjl1Ri8wbnorY2JZQTBCNHBHSkgxTnZRbEI5cU5zeVRa?=
 =?utf-8?B?eCszRWUzamcyNk90Q21Tbk9jeFVFMERORWVMdHlMZjlMRDRydGZETVN0d1RB?=
 =?utf-8?B?UVd6Z0g3WVU2alNqM1lWQkpUNllWVjEzNUNqenFEa2tBYlZqYkQxeUR5VWxC?=
 =?utf-8?B?cDQ2d1pRelhMRmFRR1JIY0sxZHFSSXpiejdtdEY4UW5ETnFFTXVZUjM1OFBI?=
 =?utf-8?B?YmFFeE12NVVVY2UyeTc4bmNHMzhudmx4S0dnTy9BK3ExcW5BRFJiaVk1MjA5?=
 =?utf-8?B?aWc5T1dxM1hCellBajhkT2dzMGo5N0JPcVoxdkNVTGpPM1hrUFprUzBoNzND?=
 =?utf-8?B?eFpWakxXRitONENyTWM1alRnenBCcytkUUp4QzZnb0p6RGdiMitMbUpOYmlG?=
 =?utf-8?B?Z1NET3ZETmRFSCttZlIvYWlLN2tIYW80Q2pCQ1hZNEIyMy9QQUVRd09kanpP?=
 =?utf-8?B?UmJoNTVMWmNPZ3pUcXR3V01ZdGhCTDNKTGRkSHpkUWlENThrWlRma3dNRmlq?=
 =?utf-8?B?ejRLNHFEeUkvZjArWHljVkNMV2JGaDQ2VUpYMWY5UHpreWpkNzRJNmt1aVpt?=
 =?utf-8?B?bzZ5TUZ2cGZmRkw1cmtLbGN4SlhOV21JQ2IxQ1JZMGlMYjVUSU0xTi9ENGEy?=
 =?utf-8?B?YklTaWVObStxUEo1YTVCYnpLSVljanJEd1lwMjd1TjZOVWY4a0FQVlZ1UEtM?=
 =?utf-8?B?dHJZS1kwZ2pQMjRobmhGVzdsVmN4QkZENDEvOElKQThOdzVLNlZaSWdCcXZn?=
 =?utf-8?Q?glq9CivF30KqXDIYPuw/Xsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 255e38dd-5d7e-43b0-2229-08d9d99e9430
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:48:56.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6ttpp9u8KALbGhJ9ZP8zZ5UdCGAAxMooHKG57M5jEv6D7bRecH8yzDawVefw/+c/rBzYBr+qD5IhMO38ppvQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

The addition of a helper to generate compatible policies given two
inputs has been removed from this iteration, sine Andrew Cooper has
posted a patch to set the foundation for that, and further work should
be done against that baseline.

Thanks, Roger.

Jan Beulich (1):
  x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf
    contents

Roger Pau Monne (11):
  libs/guest: move cpu policy related prototypes to xenguest.h
  libx86: introduce helper to fetch cpuid leaf
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libx86: introduce helper to fetch msr entry
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h                    |   6 +-
 tools/include/xenctrl.h                  |  99 ----
 tools/include/xenguest.h                 |  77 +++
 tools/libs/ctrl/xc_bitops.h              |   6 +-
 tools/libs/guest/xg_cpuid_x86.c          | 645 ++++++++---------------
 tools/libs/guest/xg_private.h            |   1 +
 tools/libs/light/libxl_cpuid.c           | 233 +++++++-
 tools/libs/light/libxl_internal.h        |  26 +
 tools/misc/xen-cpuid.c                   |   1 +
 tools/tests/cpu-policy/test-cpu-policy.c | 224 +++++++-
 xen/arch/x86/cpuid.c                     |  55 +-
 xen/include/xen/lib/x86/cpuid.h          |  26 +
 xen/include/xen/lib/x86/msr.h            |  20 +-
 xen/lib/x86/cpuid.c                      |  91 ++++
 xen/lib/x86/msr.c                        |  41 +-
 15 files changed, 946 insertions(+), 605 deletions(-)

-- 
2.34.1


