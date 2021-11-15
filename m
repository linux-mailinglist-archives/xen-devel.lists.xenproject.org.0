Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55860450629
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 14:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225921.390255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcV5-0004PC-PC; Mon, 15 Nov 2021 13:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225921.390255; Mon, 15 Nov 2021 13:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcV5-0004N4-Lg; Mon, 15 Nov 2021 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 225921;
 Mon, 15 Nov 2021 13:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmcV3-0004My-RJ
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 13:58:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1515885c-461c-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 14:58:19 +0100 (CET)
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
X-Inumbo-ID: 1515885c-461c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636984699;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AC0sON0AOiAPojPkmmZiSRc4Jpoj5wXX/hcXeIxkupI=;
  b=aTPBhhKgb+tIXcGIbRo3boyQ7mE6SEByWf72Y4VOfvyeD2FXZXEuDCpe
   Zc8vHbreLMqfPOttgep9ZOUMRR3vNdW75NLZCpEDta/aT1duRKj2wTMsS
   Bd33mvAUN5Yo2k6XMOOVX1ouvestJ2cK95Qm3PdAtC+C6MgFnC3niO2Ce
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2QG8TDT8wOLF3x3PvpV9RCSmJ3RFOeIJuTrv3rl5JeA8Dikh+a10pMwJ3zyLYM0AbmrMF/5eAw
 wZadIOvXvkyTg2BXymxRnNWBtwZVTaaYfWx3W9RQiF0NOV82GUHlyZRYFjKoxwItUP6j6su7Bw
 YwZhxXvA4KRMeQJzCaBRhWPB4IfF4JuRG4q7DBEUheAhZF+UjkubS9JcoN1+kWb9gF6BGKOZvW
 sDmyoz1pZT5S229wcZ0ShjQHTmViwdYhZYihWJDkOFqAHdRHh6Bh0oxqlcqT+tmdwIevWJD7Tl
 PL6BT+hshmyZiySV8M/p5Wva
X-SBRS: 5.1
X-MesageID: 59804567
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k7as46P8bGfmrGTvrR1YkMFynXyQoLVcMsEvi/4bfWQNrUoh1mBTy
 jcYWGjQbv2Da2P1fdokPo6y9kwCsZ7dmIA3HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Es+w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozTZuola9
 thqiZKXbRZuBrSTics2SxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/ibtYcEgWlv7ixINe/5P
 NILRAF1UCvJZwQTYU4JWL4Ql+j90xETdBUH8QnI9MLb+VP7zgZ8zbzsO9r9YcGRSINemUPwj
 mPZ/UzpDxcCLtudxDGZtHW2iYfngifTSI8UUrqi+ZZCiViYlzI7EwcdWx29rOXRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeRGwPj
 3S3kvTVCxtLofqtUC2M2ZyMombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2v0/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXTlrAYlRujBCxO53Nr02wEHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxM/4uP9zsV5p2kcAM8OgJsNiONLKihbArK2e6ENxGPxbMjwgBbmBx+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbfeFc7Qz94VKeKqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937zs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:bfaPoqAgZ0QQPlzlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="59804567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFoBxz/YKo9qhw2HsBqmcS16qC9yMERLzS30/rsZDmeO9YrhLHIxtK3wgoIU5r9MsdpOLwC3mN0z29t8jnrHKOSyUdeqKuT0wRUCrYvl+HSDiu/rxeyLajKEMl+qXyusPfLDrgy26v0MXycZPU+t9/l18BmKZr/zfkrsvG7EzrXpFBhpH1geQXA0brvpJaacUnkK8DQAj/j16lipfbct9sfNMvEwAXmtYrMYiZxvdEWosLNT5neIkTZvSimD641oFN8PYHTcV97UY0PS4CfOCzS6QRnzLSmEtUoFZO8TLJn3Dps9iyipqc3GIqVMwE32deOZZwirx66VXThMHHSNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFF8eXhEoTtHR3SbCoQV+0+LmyNuIRcz3YGjPPssfrc=;
 b=aXq0WNdhbXcczE6hAusA5I+oMzM4CZgcS+cNWVHUbEKVZpvlosjv1xSrDYaybFt3QG8Tfr+zAub4PlH7J4FVikXQ2lQfUiiGwMMVoIaOofWEZRTynjYfNt58Q77lZfoEDvOQTxfYdcwRqP5S4Cqn+pK64l6JQQlsaji5RqBTf6It3q+OBiBmCt9aJZe1rZrmwg6HCigb+l53YZW9wYNVaiLJTCOIi3XFnt4ZEDIMwL7i+AwWP5DXRGs1g1wdRAIw1m6CO+P3Dmivit6Q36EQdyxqItF5uakniJjQ+Ylx25hQcxe846bbyAWu7TDCWAnldTLAzoe/2vDQxW+cqGgCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFF8eXhEoTtHR3SbCoQV+0+LmyNuIRcz3YGjPPssfrc=;
 b=KAvWKERnlBbj0BpqP8wdMIho7dQ1hpKLEyDazKGvwriHhWkf6IBiHxtGCJl97zOlSfgSxgP2cmaLDtGaS5V/OycDkqrHL7rVNJa6jifRFyi9raMdoxJ5+0mlZC0YrfkKrChqmSkgWAYQSIHKSjcPw526tNXXFtxaybEYtdrdcZQ=
Date: Mon, 15 Nov 2021 14:58:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 3/4] test/tsx: set grant version for created
 domains
Message-ID: <YZJnagbiihYH99DA@Air-de-Roger>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-4-roger.pau@citrix.com>
 <f544fcaf-be7b-6c2c-7e9f-7847477739a9@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f544fcaf-be7b-6c2c-7e9f-7847477739a9@srcf.net>
X-ClientProxiedBy: MRXP264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8924e2bf-0a00-4568-23f1-08d9a83ff409
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4971818389DFF25E69ECE56D8F989@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mA3ZuBoH0VAcL9nlULIVWLNM+BWGvCSiJbrVyFzOj9j6vsi/Gi+5FzQog+ZM0hUQohClq1PA97YT4Hdz3y4iVzvyBlyLGKEzg3yGE6FN91vx+6YEjkCJp+4frbpAirQhqiTiWVbq9jkFCsm33NWItUWtXv9TbOhfcUlqB5chtk79h/KJjkMJ76TzQ2zRb+LKjk5Qcz+wN125MiLvGpeMpcykev6A+LWQFn/wI1CpFxKsoFNMSyN4FUBpRgTOFUB6fMSsPEhOq16sXqjOmwekM+dOmvNuEwr/KSqMzPW8NDqqjJZPao4qK1CitdcKi39KTjy6SQksOY4/BX2lsuozvROFtmK3ei9Z9uERCQ4Q+9BydeA987kgH2t/+/Pps59o1NzZl0eoQdehRaH2KvFt5qATcXgWIbtjDhhSw7ZOejWN8IytSgDAaXyvIyTy5Wt8K4BqOi4vdr8ASX5azks5uKm/MMlBEPDlBZCJiLMFKvxAFHEne2vfOvEjqqo6sRhO7cZVYzNKHcJIWhazwbWmNp9stRbg4f+VCXfGjRczRnQkcD7D/RpaX91UKZ4DbnwYhbeCRFk/6E0YEwz5p139q9rn0aCWZmKT7ozCdjCJXoIzWjrywmZbG4Uato6nyvDwUeDJLoAkFW3YSp/O6HE2Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8676002)(4326008)(6666004)(82960400001)(8936002)(85182001)(316002)(6486002)(33716001)(26005)(5660300002)(2906002)(9686003)(66556008)(66476007)(66946007)(6916009)(6496006)(508600001)(54906003)(38100700002)(86362001)(956004)(53546011)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0c1R0Z3Wm9YK2xidmgrK0VqYUVTYmI0MittZ1k2ZjVjOTIrZ3pjejdPT3ds?=
 =?utf-8?B?VE55WWJNN2ZaVWRzTGRhckZzNTJqSUtTdXNNNmRzL3RrbEs5T04rQ0pkRmds?=
 =?utf-8?B?RFE3enNsZytDNU9hU1F3YS80Z28yamxoeFpUVnBiUlJBQTdROUZtdGZtOVNN?=
 =?utf-8?B?d0xPNTZlUU9sZVZsNHIwK09RM2FKdjdENFNZaW44SW90R08xTVVDRWlla1Zo?=
 =?utf-8?B?RDhqNm9jTktyMFFVWGkweHV3WWhYMDBkRW9keVhlZHJwR2NPQ3lNT28zZ3NI?=
 =?utf-8?B?NnNaRVRlMnF5ZDlLazBXQyttL3g0a1BlK2VUZUZ1QjYzdXFZU0ZFMzlmVEZZ?=
 =?utf-8?B?NERva1gzQlpnakVQUXVCc0Z6UjREd3NYTDRnek42UFhJeXlpaU1mSndNMXN5?=
 =?utf-8?B?VzQzWEF6cmNra1NwK1NRcFp3NEdnWStCTXBKd0xyUEc5U1NFUVVveEwyL3NQ?=
 =?utf-8?B?dUQ5N2RESmlQQlJFemJZc2R4c3RXckIxZDZiODFGSng2dUZ4c0ZKdVJjNWN0?=
 =?utf-8?B?ZVA3YWo3RVFFOTBxSk1WRjVmdklBdXNYQnVmMHhDMnNhbTZ2N3RMeG1ucnVo?=
 =?utf-8?B?MWk3czBVb0Y0Vk13N0RZVHBPdDMzbURGaWZJa2VWZVRJVkx1Sm04TThJejNz?=
 =?utf-8?B?VXBJc25yVXlYc2JxT0JITFJ1aHpYWUZGZUY5OGI3RUNZR3NkcitwdTIwMEFm?=
 =?utf-8?B?VEUvVVpham5zWUM5Q1hpbUwzVGJySmZZOHlSNGNFTVp1bmVueHBRMytvb3Ux?=
 =?utf-8?B?MXJsak1IRVFOY1F4RWJubDdDQmxVOGhac0dpYitNTGxwWFpvR0dHQTBOUkVQ?=
 =?utf-8?B?ek9pNmlOTHRyUXhKTUk4UzNBNXM4QUJqZ2hyN0ZwWCt3VFBzUWRoLzdrNk5K?=
 =?utf-8?B?RWFSNGJSc2hEY2FoMEhnVUFKMm95dmZxSUMrbVR4dE9oM1pJU21NUVZjNzd0?=
 =?utf-8?B?eFlNOUI5Ty8xSjNrbExzRG04QUkwcnNVdDU2Slp3eHUxenNuSWdtSk42VXFS?=
 =?utf-8?B?QXVrVWhmVDBBSHduWmU0bWVYU2NDcXM3c0ZLeXRIczFmb0hrSm83eU1Pd1hL?=
 =?utf-8?B?YjF1azVES2Z6aGxGajYweTg3bDNmQVRwcUlDQTVNQys2QWJGbWdTeEtKVFJk?=
 =?utf-8?B?T0tuM0tGcCtOekFjYWdaQ1ZidzhhMkJOVlh0K0UwV0E5Zk5GYzg1cDZHeVNC?=
 =?utf-8?B?M2lvT0pGaXp2Zi94YjRuWkRyUEM2cTVjOTVoMmpzNVV3NW5CL1p3MkZwZVFO?=
 =?utf-8?B?TXVOeFFGcFdoU1QwZlRSNzdLLzV5MWN1cW1IZ2diaHJzUG1CVnArNm5yMGZ5?=
 =?utf-8?B?MlZtc3FOS3FpRjJjOFpudXRuek1UZWpMYnNRMUI1M1drRTNXeHo4S2wwekhx?=
 =?utf-8?B?R0dIdzJpZC9EY0gzeWlYZFJRWEJhTmhlejRrUVA0MzhZWDlleFpyKzJSQ2xV?=
 =?utf-8?B?MDRyaHJ6ZDAvQUtKa3lDRXlxaE12ZzFpd0Zwbk40S3lUN2Z0VU1xMUppUkU4?=
 =?utf-8?B?aFlHSnRINkx0MklLazk2eDVMcy8waEZKd1gwYUVHb2t2Mk94YUxUR2x4ZzBB?=
 =?utf-8?B?QnVxNXpIMkVTZjg1cVk5Wm9mTkZDR0RMbEN0YTlEQjN0TEc5dEJibzFkR05S?=
 =?utf-8?B?KzM3VitJcVBuVWVFZnFiYkxjMjhaOGpUMlZUV3dHd2w4UTlEemc3dnhaMmZq?=
 =?utf-8?B?cjdTRHNZR1pRZStZZGxNUmxDVmJNVjlhaTVPZzBMeGdDTTA5L3ZadVJ3QjJa?=
 =?utf-8?B?UWVsb0pRamNOVEJDTVkwbHZCTUdZK1VYR0lzam9wV1JIVTkwdENMeVdreUQ5?=
 =?utf-8?B?VElRaytNZ2kvc1MyVTdlVGtFWHVPanVSMDd6alpPWWhabjJ0aktEWk1zYm5U?=
 =?utf-8?B?SFlFR0xOWFhmcFJYY05nSFRxSVRkTnd6aERWM2xiOWJPWkNGaEtCaDdJdVVY?=
 =?utf-8?B?elJsSDFuQWhBODR5a0V5T0VlTkJNTUVjZFdpZ2Q0Tk84WTdlekdOVmFBNVF4?=
 =?utf-8?B?T01meThjTldJQmdQcGl4dzVGbEMxVHhyRkZDcG5tVk03Q1NGSjhEc3FIdWNX?=
 =?utf-8?B?cFJ5U0JGTlB5Nk8yOSs3RExyalA0QS92NzlMcFhiR2dwTjNUY2pkR09oa3dH?=
 =?utf-8?B?WEh2bDQrakZYQnZZWVVJUDdYRXBEdFZkYW02R056SXRLbTVoWnBvQ0pCOFd3?=
 =?utf-8?Q?kaCrf2FBeXqmWUzLFbX/vUM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8924e2bf-0a00-4568-23f1-08d9a83ff409
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 13:58:08.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5fGG1XtTKbhOriUmCwZk4toDz+JJOwfNO56eg50F3zKNzWoYMC9F8q3QFO0vJiGpECKl+x78+L+QrhhTHPmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Mon, Nov 15, 2021 at 12:43:34PM +0000, Andrew Cooper wrote:
> On 15/11/2021 12:17, Roger Pau Monne wrote:
> > Set the grant table version for the created domains to use version 1,
> > as such tests domains don't require the usage of the grant table at
> > all. A TODO note is added to switch those dummy domains to not have a
> > grant table at all when possible. Without setting the grant version
> > the domains for the tests cannot be created.
> >
> > Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> >
> > This patch only modifies a test, so it should be safe to commit as
> > it's not going to cause any changes to the hypervisor or the tools.
> > Worse that could happen is it makes the test even more broken, but
> > it's already unusable.
> 
> What do you mean unusable?  Other than this, the test works.

I mean, it's unusable because I broke it with the gnttab change, and
that's it's current status unless this patch is applied.

> > ---
> >  tools/tests/tsx/test-tsx.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
> > index fab99c135e..f1dcff4c30 100644
> > --- a/tools/tests/tsx/test-tsx.c
> > +++ b/tools/tests/tsx/test-tsx.c
> > @@ -444,6 +444,8 @@ static void test_guests(void)
> >          struct xen_domctl_createdomain c = {
> >              .max_vcpus = 1,
> >              .max_grant_frames = 1,
> > +            /* TODO: switch to 0 once support for no grant table is added. */
> 
> I'd avoid these TODOs.  It's test code, so really doesn't matter too much.

I'm fine with this, when looking at the test code I didn't see any
reason why gnttab was needed, so I thought it would be a fine use-case
for opting out to grant table. As you say it's a test case, so it
doesn't matter much.

Do you want me to repost with the comments removed?

Thanks, Roger.

