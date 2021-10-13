Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DE42C5E9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 18:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208715.364945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magpc-0004lP-62; Wed, 13 Oct 2021 16:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208715.364945; Wed, 13 Oct 2021 16:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magpc-0004jB-2P; Wed, 13 Oct 2021 16:10:16 +0000
Received: by outflank-mailman (input) for mailman id 208715;
 Wed, 13 Oct 2021 16:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGme=PB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1magpa-0004j5-EJ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 16:10:14 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bbf3ec4-2c40-11ec-8185-12813bfff9fa;
 Wed, 13 Oct 2021 16:10:13 +0000 (UTC)
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
X-Inumbo-ID: 0bbf3ec4-2c40-11ec-8185-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634141413;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5SJhYvrNHs8dPsPRlxElO3xnHWog/XPr6Eh8WvaODZs=;
  b=E7I1oBmYwXEs01V0ayPOHIMiGBPGTlNPSd4qy/b5NUUphkpoSyJiSBjO
   iCfm8hfpiXBQ7y6bCkrBBBWLjsLSYv9JKf1xB6VdN7BFDLgGFjDCjaIQc
   6l9bx8qc8ixVln4tpC3Zuo6o1wD6PGCCWi/yyrB4ImfvROQSE2fcBkCsW
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q5sgOQAfnF16F1JTc6xesCf3GMydb42NEj2NXliG4LttCOrzEI/rmpcBsYNsT79i38rWdZ21ST
 cIYLQSzPl1bnl6TQOGSz41N/e6q/NXLLl5IybxukVBsNkEJmf31NMT0HatebcaMVbqUC0zliO2
 7MwJoXhNL6Wi3EfpM1kgq5kTxiyRZPt6h3jUUpLzUjwcf2mQ+RtYLCKh6futCuZvmOiBaKFocs
 Q9CaTbmVWkcBfOi6KUHEGOX63YHPniYAqnjR7Bn4mULUpaFHP4STT+l68g/cTLcKsR8AZhnoKI
 cKJkMNQobCbWulZh6nz+ZYjm
X-SBRS: 5.1
X-MesageID: 56989076
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l0AkDquhcfNmryWX4Bjs4B1WAOfnVKNZMUV32f8akzHdYApBsoF/q
 tZmKWmAMvmDNGr9LtpxOYuwoxgDuJ/QxtU3GVRr/Hw2RihB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29cw2IPhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npli5KuET9qYJD3nMtaVxhKMnhcHoMB0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DO
 ZtJOGIwMnwsZTUeJwpLAooGzdykl1DkeGxqlkCEh7Uotj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TieW4j2auVtQZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA6QCAZUJ94ifQyansu1
 02oxvHKK3tG5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEY49SP/dYsndXGiqm
 WjT/XdWa6A71JZTj82GEUb7byVAT3QjZjU+4RnLRSqb5wd9aZ/Ni2eAuAWDs6gowGp0SDC8U
 Jk4dyq2sL5m4XKlznXlrAAx8FeBvKnt3Nr02w8HInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxMfcpP9jpUZhxkcAM8OgJsNiPMbKihbArJWe6ENxGPxbMjwgBbmB9+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbaelA4Rzp7V6OIqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA9370s5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:wTb1n6gOCQcbZnd5fQcn3vRReXBQX1R13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d3biVlsPW9R1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVkza71eUWpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwblUdxPIgnBQ9u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTp2Y3a/pdVJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHiuHV1ytDEZAVxIv6/eDlHhiWp6UkQoJggpHFogvD3301wtK7VcqM0ot
 gtac9T5ehzpsx/V9M3OA5Oe7ruNoRhKSi8Rl56Gm6XYZ3vDUi946If0I9Flt1CR6Z4uKfauK
 6xHW+w5lRCN34HN6W1rdR2G1b2MT6AYQg=
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="56989076"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFxEi8dR0syeaJpPNwymdHeWOLnZVr91O2t2xM7pXxDR9l6jT5Ot6+8WqsL2DiJIC18l3lhNQrh7pfQwUJwP+nct8sVLUze08GX2zXfaUaH1s8MhHmfBtzzo4eoz1KlKOb/4mxYPIm3fb6rUiadGwjSmeAiUnFX6veL24/1dkDly4i0NTblKSLbWxzo9ji46wfPPCmYRtxB1q6cFsu1Fet99PmHIBdZ0OdXFNq/2TJh+MYKtYXdGuSotMjmp7cpmclvEB9iE55GeGdkix8BTv1hovJHZEJnP3wLImeqXArOk+cujOKCv2QcOzcjeTaZ62xt7dwu3sfs2ZYckr1d0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SJhYvrNHs8dPsPRlxElO3xnHWog/XPr6Eh8WvaODZs=;
 b=SQ2n9oXkXrCRXqmdnSRr7g/zGCM4/oZoBydAdt5j8Fw0406GDvpDehFnczm6KAlm8sF4pyW73sXtXFgNLc4kV+MS4q1og/2thr1VFeyxTSYT+l0TtkWdQpT8XfNwRzN/MDbEDMuCapPIrzREqLgvEx/oW4aVT9Wu5r0dnXMufzD52V8uJA8Wb0TAlEjyxhX5oDJ2E216sGWFm9+2QfSSp+9em+jtI5iwTc5oYwxPUjdyxUNyc0ueDVuB1rlBQxAOibp/mrXLNXlgheRj7/qc3vrM4qvUPB5S7qSAdzQxJ/GZQpXodOIGq8aaWTpzNwtJYU2ERTrMUbRgsf7a3PtvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SJhYvrNHs8dPsPRlxElO3xnHWog/XPr6Eh8WvaODZs=;
 b=cqKJ7StVV3Yo7UGgZDwWllwGAMBujQ/GIEFl8AbJOi3ct454glRCnqJ1JDE7Oy36AOVxHsK5H/TVlgA/ZwG41yRB4TmEb9A3UKCpSNh7+JS6niJ9Jd5hM/e7vawEsACEgLdUfD8SCyPGJJ230FZ9X59xRVaq0hPPSyevVilcyvk=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] x86/shadow: address two Coverity issues
Message-ID: <ff9639f7-a853-7755-0d5b-5ccf21877cda@citrix.com>
Date: Wed, 13 Oct 2021 17:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0486.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbcfbd80-9c80-4047-a672-08d98e63ec84
X-MS-TrafficTypeDiagnostic: BYAPR03MB4296:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4296609B7BC31C8CEC42F4B1BAB79@BYAPR03MB4296.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5fMIxp9wD7p8HuWkBKO7b6Ys4LZc6IBFfwrxWhBzAE8gYxay/OL9WdKB+letfl/H75m4a7QvIeFPmv/fTi6nQRXrgS+aoUbK5/Uf00zmyG+IKVg1Zp/QjVr0jKttqVbnveVeh0jqmiLJQILkMmI6LK14/YnT/1anCs7K7V96zhe8shr6UG5gq/+PJDPgFhhzhAYg80Pwnb+Tl2DyMpGpJIFTgJ8mvMY2M4c/U6Ks5UI8OclkxZSdfA6jOEYpis0m+8SMUVUJCb6UzyL2X3jE1l04LaHGWcfjuwHcfDgiE1K9S+nW+9GtNVvO0OM5N3CrCwPaY7NCkV7aTCxcYLDmCC+GA6lVSgrWlAtex9rH93q9OjyVVF/OpqwzyOfWw6iAAtmcj0Pqqn703GcCNUUhDfuU4CvyAtaz3qEzatKicS8SHlJpEvqMUd+auEAosuNrDUZwaFovWOkyQzCtqgUq0l1Ue6rbN9RuOiIAI1MESYi8vgEoH0mIKqA/p+nb+DP4z4i+bunHfqP0pUDKzyQgWD/x3zog6T5Q1ClU/KtcFaiAxkdttpZ9dB+QLMN9AGtuALSSIyQ339ObPtLOl8tmQHXZfTQeS2GizyY1G6PMHL/Iw+iDis6we/I8vbdbTUR7apRwUD7SA1Ijy657eRaGpDll6i2xQoYg5Lz5cvu04hbYTraRprlD1JV0uIDYt96RU+IE913KmWN5GdD/KtYOq60aQcx3DH4RGh64qexy+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(8676002)(2906002)(5660300002)(6486002)(38100700002)(53546011)(110136005)(66556008)(66476007)(6666004)(31686004)(66946007)(36756003)(82960400001)(8936002)(16576012)(316002)(508600001)(31696002)(956004)(2616005)(186003)(107886003)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNtdURCWmJFZTB6enJEREZkSHhVQ1kzY1YvTUIxQzh2eDgxdjd1bzdUQ3Zt?=
 =?utf-8?B?aG5EUTN2Vnp1RTNWb0g3NHBxSVZLTlJ0dTdsWVY3REt4Zkl6Z0xvdFFCSzAy?=
 =?utf-8?B?U2JOUUE4RmF5MnpDM3lpOEJJS1BjbzJTUC9XQlJ6WGYzZEswMDB5ZTdJSGov?=
 =?utf-8?B?VERIWUM4Tm9STDVCRXBFYTg5L0pxaENtU2NEYUE0eFNoUjVlQW01c0JuQzNx?=
 =?utf-8?B?MG44Zm9xTG9zVXc5THErZ3hxTytKa2w5QVkzOW5jZGlmSHZ5R1E4UXBpYUNJ?=
 =?utf-8?B?RmsvNGxBczJ5MWdIWlFwdFpKUEpVTlFPdm4vRmpOMkV0aThuenk3YlJKUEZ2?=
 =?utf-8?B?VktpY0dTeVM5bVNneVhXR09ldkxHODZQdXc0ejdyMFFXanRBRW9KcmR0Z3JR?=
 =?utf-8?B?VW9qVDRadDJlMXJ6REF0bElnWHlwSTdZKzZoQjgwa2c2QVBUaTIrTVNjN3NK?=
 =?utf-8?B?WVpJZFpqenhmejhuRm9aWkdvVnIvVHZzaXNlMklDTHRpTnd0OTZpY1NWeCsy?=
 =?utf-8?B?aGRMUUNFNXFZdlFQVitqdWtGWHRjVm5GUWswT3pJMzZ2dDQvZzMwcTlpSjhF?=
 =?utf-8?B?d085N0R0aUp1eThJdllqcG9pUGQ4dEgvZ0NTaEpwM3dveklsRFBpUHpwMitE?=
 =?utf-8?B?YW1tVi9sWnJuaUZUU0NqaWw5YUV3bDM4Vm9Gd01zL2NIVlZGQ3U0UkpUdWZK?=
 =?utf-8?B?endiYzR0U2NXNVpQdlNOTU8rZll5dHJJTytDUTIwYS84ZXJxd09IeW5xUGtm?=
 =?utf-8?B?UEhTaE02Nk9RNjBGc212YWx2VlBDYUV0M3E1ODYydE1xY0RSMTNxbDhqNUVS?=
 =?utf-8?B?Tmg0VUg2c2ZGQVRTZXpidm56TWNTZUdWZEtRWHhFd2FNV21weWhDbGU3Tzkw?=
 =?utf-8?B?akZpREU5MXpkS2gxM3pZeGhtY2t0NVFzM21HY2lWVmRsR2IxdDY0VGlKSkNM?=
 =?utf-8?B?WWtKMWFqNTQyb2sycWdHOGRmcUUrQWtLUDBkbmV2REtRU3NjaEdwRnBQL3pK?=
 =?utf-8?B?WnlISVdrSHpsakhoOHdPS0hxQWs2ZU5YUE41em1UaWpHVGRXZ0F5U3B1dFZS?=
 =?utf-8?B?YWlERExpNjRrdGFSd1ZJWmZJN3dPV1Ayb011bHF1ZWg1aDNKdE1LSGZrN3Jj?=
 =?utf-8?B?blliTEVsWDRQYkNCcDN3VGRFSnVLbmFvU0hKZ0dGejhlclJVVkJlVW8zSWFG?=
 =?utf-8?B?ajhoblc1S1h0c3Zwb3I3eFRwb2g1YTcvRTZIRU5vRktnd3ZZWUVCeGZLRHly?=
 =?utf-8?B?TGovYTN6TGpoSnV3ZUxUbzA1Qis0SDJtclRlMjdwKzFaRmJEemFkWUNUTjZk?=
 =?utf-8?B?YjEwVjVjS2liT00vQ0ZUWFJVSUZYeStic2FXV0VRNkhxc2NrZk83dmVsMEZu?=
 =?utf-8?B?ZTE2VzNKY2I4bGhPSkJoN2JqLzZJOS9TaWxndzNKTXJGdlYrcjJkVlBPbEFM?=
 =?utf-8?B?Qmh3cUJCUE9iQkZxNVM1aWhEeS9CbGswTXR0YzVVZDZ6a254dktxN2Fnazk1?=
 =?utf-8?B?eXJPOGRtcDd4dFFtMWpqQnN1bzhaeUxRQWR6TmdwZmw1OXI5SkY4RkZmdWtl?=
 =?utf-8?B?c25naTkydmRYQzRHUU1TbS9XNVFpZnJkeEtUUDltNFh6Y1ZuSzF4cUhQVjJk?=
 =?utf-8?B?Mk9YMlVkdlgwbUl6dGJNM3pjenE1RmhKMlZyYklNbWJXTG9JaEp3N09LRVd2?=
 =?utf-8?B?VkpMQjIwNWxGUXVJbkRUejRVMHI1Wjk2bXc5ZU5VYmhVTDlxVFR5c0hkSVU3?=
 =?utf-8?Q?T6nQt0xe4tQLq0/qJ7H2iL2dFoSeGmHdnPBj2gC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcfbd80-9c80-4047-a672-08d98e63ec84
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 16:10:07.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9Irfyziy5LWWIHqv4HvER8QcE+AlwGr0oCpaVyBnPsYu+Jq4Q8DDZGnjNt5ptJ9RXb6s70Z/fTAFiNlratJO65ml0deK8GE12CqfoGqHyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

On 13/10/2021 16:36, Jan Beulich wrote:
> It's not clear to me why the tool spotted them now and not before,

Several reasons.

The Coverity backend is a software product just like everything else.=C2=A0
IIRC, it releases quarterly.

"If something's free, then you are the product".=C2=A0 The value of offerin=
g
free scanning of open source codebases comes from us (the free users)
integrating a massive corpus of code into Coverity's system, upon which
they can evaluate the effectiveness of new heuristics.


Second, and far more likely in this case, "x86/mm: avoid building
multiple .o from a single .c file".=C2=A0 Coverity has always choked on tha=
t
in Xen, because it's intermediate database is keyed on source file with
latest takes precedent, so we were only seeing the 4-level case previously.


And to also answer your question from patch 1 here, there are upper time
and complexity bounds on all analysis, because scanning is an
exponential problem with the size of the source file.=C2=A0 I don't know
exactly where the cutoffs are, and I fear that some of our larger files
never have later functions looked at.

~Andrew


