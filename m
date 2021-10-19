Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E9433648
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213143.371268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoVd-0007BE-F1; Tue, 19 Oct 2021 12:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213143.371268; Tue, 19 Oct 2021 12:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoVd-00078i-Bw; Tue, 19 Oct 2021 12:46:25 +0000
Received: by outflank-mailman (input) for mailman id 213143;
 Tue, 19 Oct 2021 12:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcoVb-00078c-GH
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:46:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c72277b9-a6b3-475b-a787-c0e25f2ba2f5;
 Tue, 19 Oct 2021 12:46:22 +0000 (UTC)
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
X-Inumbo-ID: c72277b9-a6b3-475b-a787-c0e25f2ba2f5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634647581;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qq13tI2v06rCnIBfL+4WRXae/wl9u0gFN53TeC9ttys=;
  b=RelT5FbUktWBq7T+DMqX1BVhNEaLIbSlGPW5mRCpg42zvCSbZ2TctBZ2
   7XrHRgc7qmYiZqwbP/hFkCRMJZWzLIsO8IDUeTDmbshy6NYnM2Gvho8tG
   8yl8rW1r1m0faJ4UApTnwUyQaVjgjQbgi8xP1LLlZC62e685yihhOp/xW
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bqIxOojV8NcEdnn1cJHHZAr3DHKgcnQctE7N0zFzJO61NXw1TdbPgUdXZ0Aq1GeKiM9tFohNoU
 0i3c/c72+ZMzYb9/DukF51m23ePWUobFTRLRC7INbBCqXy8T5Kvk2hJSw6IK8p0MnGmzLYQZSu
 V2H4b+CxuVIZJUtP1RYHEtQK8B3R0EFs+MBaQmKHbk5QTmlLZEzwlJJATY442LqtmfP/kQ9Y1L
 KXK6UGjdCFBhI9tVuRvjr+gSWWxSicYxK/isZ/RYR2N/E7Cz1kunEWDZCje0M1jii3+nolC8AZ
 j3RBMvL+qt550Rcfs5rRtp69
X-SBRS: 5.1
X-MesageID: 55517809
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iqDmi6kUBHnj0DLtNNTt5SLo5gxZIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDD2FPfuMZTbxKNl2Pt7gp0wPu5fUxoJqTwpk/C82FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tc52YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JZc7oKUT1sVB/HvmOUESiZDEyZTELITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpt25kRTa6PD
 yYfQQhQdSnwRD5PA1coIrA+zPaXpFfVciIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs/Q9HRf5WT9EDtCKNy7PN3B2ZAUUpUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYndNczdTDcMQZU5cuYO7+dBs5v7aZo87SPbdszHjJd3nL
 9lmRgAFjLIPkdVD6ay/+V3W695HjsmUFlBrjuk7s2TM0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CJU8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxs0YpxaIWW3O
 R+7VeZtCHl7ZivCgUhfONrZNijX5fK4SYSNug78P7KinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWMnCGr99DcwpURZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:KhyfwKFPWRZyZGRHpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.87,163,1631592000"; 
   d="scan'208";a="55517809"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJC4lRWXUz+1B6E6lsiogV/gAmIWl3bHB4SngsGwCkEt0jlBRJSsXa7nKsisbzVdODbtmRFZyyfLGn47dLiYnOlJpK9XdBhcQG5H4rci3NKexJzbE+w43vSEj9CGRuBzCMBDGf02HL3Dg0WQNoL4J4wLLO+jdLyqupaZVLJtDJ6aLiXZHkxyXxGjV+BaxePhWVKq1wj5W1+p/ZN4Xnm5bHH1OHU6Vd7vm/6B+O3dUfGa5vEQBvIvdAk8dRbolU2SYHCCqZQ3wPJk2573AJu/Ut4fPV2XmAC57eY6lL6HYniNyP0zWqJeIKIegyLN0OJTvlqBLMoezBJSeSmtW7YO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ+DOZS6TOyBdKU5fGxUfNiaZ+kp3h/7e1sctlHNhts=;
 b=MdD3DrErYWtckGVB8vXq0lrixpORt5HQJ3YNzMiMYRSAD5MGNt0Xx3fLp4Yov9+F27iaM6BKKoiBf+uvhKgr1T9ogd8q5bLGL3THmuIB64rkaJWABG0BbE5UKi2AqKqDUNEcdsg3v1Uvuaepa7QPukK7biKuZwsxPCGegTkCjpU9BGaDO1GLSuEu0myC2+5Ve0N0Q+2KbABsX2glbXoyqnqvHMhtK0q46HXDIHtHfhaNgT7pzmdE/D9ChJVKXL6yKJU0MY2IbTcVQck1AuvCT9q3uCcK29+fKFTKpklojJJcR+k1mYaH97C9BSxvgNPYPPwDln9KpOwgsrsWyPrG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ+DOZS6TOyBdKU5fGxUfNiaZ+kp3h/7e1sctlHNhts=;
 b=b/0RWyJIUxWZoAuYgakDZieAP3+tC4TJa6PAF95U/iAQNIR041zgl2CgMgPs3r1bSfYb4w4sO8GBFmXb0xqRZEWoI/rMjIwBtHKMDTdeHne10Cu/DI77enBHoLCvoSFlNO5MTqiRuuQNIQYbIbVkaZG25H17EHfUCBqltQWCJpA=
Date: Tue, 19 Oct 2021 14:45:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/hpet: Use another crystalball to evaluate HPET
 usability
Message-ID: <YW6+Av5roTErWQ/s@MacBook-Air-de-Roger.local>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
 <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
 <YW6sSXMyC6t4fB62@MacBook-Air-de-Roger.local>
 <3a366ebf-61ed-7e41-193e-131540e555e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a366ebf-61ed-7e41-193e-131540e555e4@suse.com>
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c00ddb9-2d16-4ab0-6ca7-08d992fe6742
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057CBF4A5994B0A1045D1A78FBD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDHd2FIlhSC0O98e+qRehuXT5QKoVoeDgcuQ+1KVMdhmiIS2OLpYTnLAMdTVDoUbQsNRJjrb1YpDxVfXmPT131Xo4MwPgeD/uuOOSHdwsb5O4MZAlXVKK1kLQfPNgRtxawvNubD7mkDIf6/86Y1E5PpTDkhz48hN2KN87LqD+lSG44oNPJ/w5kE1p9chREri06qZmYmonPThvFOloHBWnyUt3qSSWebAjBjiZHITmfDVUJ0jBRa+weKjCdr+gPhuSZLofTtEGcuSrSBclwJ/AoMZqQWSyHNk4kVkwJVmQYoORF43c/QK199P/Gy3C0BdjiWMVSQ4VNtiJIW6GJIHwPSEB/R1/dXCVWxyLybJc9dotuf44+xpB83f+Vj7H7p6I+eNdttH5CJyKL09iC4vW12dtYXfnaczXktbAHOAr+PDour4SxWjKOl15IAgCbtBFd/HPPPcOeduhaq4tJOHQ5VSWedcw48VpvBnVZdI5ty47tWObL19DMOLuWAHrFqvOND46IlmTyyR6M7c0S+kG3f6nQ77thLlI8WZ4vjTSY0SSd1FU8U+l+KJ8eav+Kw4hPyFWkK9eIutS4sZyO2ggWfeSjIl5IQc54r+qqxEgmp9f8TYpFnfDg1Z9ivJzVRO33bTk9VieJBunrkFuRX+rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(508600001)(8936002)(4326008)(82960400001)(83380400001)(5660300002)(9686003)(316002)(54906003)(66556008)(6666004)(85182001)(66476007)(86362001)(66946007)(26005)(2906002)(6916009)(186003)(6486002)(38100700002)(956004)(53546011)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0pnenZsd0g1VnY1aDBtTlpmM243c2prNFIwWXVWU2I1SERTTWMxM1FrQTRP?=
 =?utf-8?B?QnNiUldmM1dLYk5rbDA3eWpBYnkvMzJyZG10VnZXVUdDUXFBT2NzdXZKcUM2?=
 =?utf-8?B?Z0xKRFJQQTFjZ3NhOVoyWkhnUGJsbHZuNWdKUklHTGNGRXhYdnEySW9SSEt6?=
 =?utf-8?B?cmtjdS96aGZ6aWliOEJiMzVkUjJEd25IcUpuaTVFc2YySVBmQ2UvRDdJS1hP?=
 =?utf-8?B?V0VvV2ovVTRHV2luR3p3Ri8vVzUxNEpYSGFoYjlMYXBVS0lQV1pOY2g5Slpi?=
 =?utf-8?B?bUJPbWhTb3FDYVF0OGJFckpuZlg4UjlpS3owWjdJMFA3djFubGdMODlsbjNk?=
 =?utf-8?B?S0JuSTNaQ3lGUGY0K2NkS0FSNlNJWnBGMUJRaFY2ODlQS1dRUVRhVGtPVmlh?=
 =?utf-8?B?OG9vcndqdXRHT1hFTWljY1BlWDNMR3pCeC9DLzQ4bDdnaDZrb2tHbmNRNUkz?=
 =?utf-8?B?eWJLNWRGQ0YrV2VtN2FkSXkzZ09xbEUvSHB5QkR1T2lHcWFZbUpCWnhxVms3?=
 =?utf-8?B?c0gwbkx6WWx3TlZyTDVWU1g4d1N2MU9nK3k3ZlBnYVJiWWVjRW1tdnF3dS9D?=
 =?utf-8?B?N0IxWk5UL01uSVcwalo0TUhpUlNLeVhzdS8yakc3eXFlYkVGUk90SnE5UEZa?=
 =?utf-8?B?NWE3d1dMcjN0dFcyeHR1YkgxdTJNU0xBSE5uUnZiTG1BRjFqRWJkN0pxWmJ4?=
 =?utf-8?B?VnVMLzA3Sm42cVlxdjI5ZTdCcThMalVvZ1U1Sm9qM25Uc0lET0pESjZpcklB?=
 =?utf-8?B?MEQ4Z0wyaVB5TFRXMjhEbzRsZnFESUcyeC9manhBWEdDcTB6TkcrOGZnVTNE?=
 =?utf-8?B?SXNjNTlSV09XN1lWMWV0VXUrWEVtWWsybDdSS2xGYUkvNk9IN2NlUUl6MUhN?=
 =?utf-8?B?TTNCU29OV0d2VmFJcnZXZjB2MStYeTRnNU1yZk42cExVR3B2Y2VKWUp3U3VO?=
 =?utf-8?B?VkpvR3VUeTlnNjRCRjkxdHlyczFHWm12ajQ2YmFrVDNVWUhPM3pFOUNnb0Ru?=
 =?utf-8?B?ZjA4bmZLYU9NQ2ZidXVLSC9TM2EvWjVwVHRDQjZuNGxjY25oeElKQUw0S2Q1?=
 =?utf-8?B?VDc4OVc0Mi9EWE1XUlZPdnE0T280aHF3WnBSMU5LY2F0Tmh6ZTNZQS9JK25C?=
 =?utf-8?B?ekh3amVzTVQ4M0lJdkJXa3VBaVBYZ2lmVDVpbVAxYTFtNnlkYVhLZ1BFcjg0?=
 =?utf-8?B?NEF5V3NJOWlheUNQMXZFcVdXNWd3K0t1Z3U3MGlweXo4UUZqTCtPVHNRYytZ?=
 =?utf-8?B?ZUZvSEZoSmUwTjFkejFIYW4zcUN2UW1LVHVSRUt6bXoyc3NveW5ES1F4NGk3?=
 =?utf-8?B?QVErM1VQUlRFK09XMFV6VmZCOTNRbjFueTVvUHF4OENMT1FXaDNIZFBsVk5z?=
 =?utf-8?B?cjdBMjJWb0ZSREVrMzJpQytTenpEZTZqOXNqN00xYlNSMDVYS09KYjZTeXVY?=
 =?utf-8?B?TVBiY0Q5NG5JNFBJc1ZlS0pHcVRlL2hQUlNHUytBdUxoNEVKN1U2T3BqN1J4?=
 =?utf-8?B?MVY2aUoxYjZ2ZnluOC95K1dPT0g3Q0JLa1lmM3ZaYXB1cjBaK00rOVlYc0Vz?=
 =?utf-8?B?QlltdFB5VzR3cStSclpDYmRLZjh1WDk4RnpXalJ2MUZORTRCam92cWxjVmZk?=
 =?utf-8?B?S0tMQUZwZS8ycmNtVGh0N1hqMktWeHF1QmVraDZ5ZTlKR01CaTRGMWMwd2c2?=
 =?utf-8?B?cWgwN0d5REYxZWE0ek1JTnRXeS9tRkRGRzBsV0R4aVR5bU5ZM1ROa2svV0VI?=
 =?utf-8?Q?V5ctQyhsLVu5Gj6FoinTVQf16FVV06/Y4ap38Fc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c00ddb9-2d16-4ab0-6ca7-08d992fe6742
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:46:00.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV7+eKfQYsV0EyzQocqnwG6OBEm69D6kwvpGvmCc48dhMFdpWQ3h/7CsizFKUj8G+0IrtsokDoFChsdIbe0UzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 02:08:38PM +0200, Jan Beulich wrote:
> On 19.10.2021 13:30, Roger Pau Monné wrote:
> > On Tue, Oct 19, 2021 at 09:07:39AM +0200, Jan Beulich wrote:
> >> From: Thomas Gleixner <tglx@linutronix.de>
> >>
> >> On recent Intel systems the HPET stops working when the system reaches PC10
> >> idle state.
> >>
> >> The approach of adding PCI ids to the early quirks to disable HPET on
> >> these systems is a whack a mole game which makes no sense.
> >>
> >> Check for PC10 instead and force disable HPET if supported. The check is
> >> overbroad as it does not take ACPI, mwait-idle enablement and command
> >> line parameters into account. That's fine as long as there is at least
> >> PMTIMER available to calibrate the TSC frequency. The decision can be
> >> overruled by adding "clocksource=hpet" on the Xen command line.
> >>
> >> Remove the related PCI quirks for affected Coffee Lake systems as they
> >> are not longer required. That should also cover all other systems, i.e.
> >> Ice Lake, Tiger Lake, and newer generations, which are most likely
> >> affected by this as well.
> >>
> >> Fixes: Yet another hardware trainwreck
> >> Reported-by: Jakub Kicinski <kuba@kernel.org>
> >> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >> [Linux commit: 6e3cd95234dc1eda488f4f487c281bac8fef4d9b]
> >>
> >> I have to admit that the purpose of checking CPUID5_ECX_INTERRUPT_BREAK
> >> is unclear to me, but I didn't want to diverge in technical aspects from
> >> the Linux commit.
> >>
> >> In mwait_pc10_supported(), besides some cosmetic adjustments, avoid UB
> >> from shifting left a signed 4-bit constant by 28 bits.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> @@ -395,14 +396,43 @@ static int64_t __init init_hpet(struct p
> >>              }
> >>  
> >>          /*
> >> -         * Some Coffee Lake platforms have a skewed HPET timer once the SoCs
> >> -         * entered PC10.
> >> +         * Some Coffee Lake and later platforms have a skewed HPET timer once
> >> +         * they entered PC10.
> >> +         *
> >> +         * Check whether the system supports PC10. If so force disable HPET as
> >> +         * that stops counting in PC10. This check is overbroad as it does not
> >> +         * take any of the following into account:
> >> +         *
> >> +         *	- ACPI tables
> >> +         *	- Enablement of mwait-idle
> >> +         *	- Command line arguments which limit mwait-idle C-state support
> >> +         *
> >> +         * That's perfectly fine. HPET is a piece of hardware designed by
> >> +         * committee and the only reasons why it is still in use on modern
> >> +         * systems is the fact that it is impossible to reliably query TSC and
> >> +         * CPU frequency via CPUID or firmware.
> >> +         *
> >> +         * If HPET is functional it is useful for calibrating TSC, but this can
> >> +         * be done via PMTIMER as well which seems to be the last remaining
> >> +         * timer on X86/INTEL platforms that has not been completely wreckaged
> >> +         * by feature creep.
> >> +         *
> >> +         * In theory HPET support should be removed altogether, but there are
> >> +         * older systems out there which depend on it because TSC and APIC timer
> >> +         * are dysfunctional in deeper C-states.
> >>           */
> >> -        if ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
> >> -                             PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL &&
> >> -             pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
> >> -                             PCI_DEVICE_ID) == 0x3ec4 )
> >> -            hpet_address = 0;
> >> +        if ( mwait_pc10_supported() )
> >> +        {
> >> +            uint64_t pcfg;
> >> +
> >> +            rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
> >> +            if ( (pcfg & 0xf) < 8 )
> >> +                /* nothing */;
> >> +            else if ( !strcmp(opt_clocksource, pts->id) )
> >> +                printk("HPET use requested via command line, but dysfunctional in PC10\n");
> >> +            else
> >> +                hpet_address = 0;
> > 
> > Should we print a message that HPET is being disabled?
> 
> There is one, and it was even visible in patch context that you
> did strip from your reply:

I meant something about being disabled for PC10, but I think the
generic one is fine enough.

Thanks, Roger.

