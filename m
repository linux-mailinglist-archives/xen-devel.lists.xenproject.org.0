Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59A4AEF75
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 11:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268939.462860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkOa-0005CR-0F; Wed, 09 Feb 2022 10:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268939.462860; Wed, 09 Feb 2022 10:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkOZ-0005AE-Se; Wed, 09 Feb 2022 10:40:19 +0000
Received: by outflank-mailman (input) for mailman id 268939;
 Wed, 09 Feb 2022 10:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3wK=SY=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHkOX-0005A8-OQ
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 10:40:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3a5dc9-8994-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 11:40:16 +0100 (CET)
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
X-Inumbo-ID: aa3a5dc9-8994-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644403216;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=awSpnk9KzfJE1f7cDS5tVTLb/jHKmp11yzJIZm63+E8=;
  b=KF6qa4AEpAO/1lGNDecwJrFZGcl4g9iAG0xLkeAvtx1ersFkTOc2ged3
   0Uwdt5kvzaj4AO1kWKp5xtZP34TSR3VEE3UhZf4jRdNMaLpp/UL/tvwNn
   P8Zq2TAioWWfgLhluIKCkBBeR/9UTPlNK0ygTpoiaRiWyINt3Hk/5Aiss
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fkVgD6dN7PfKRx9cNiNxtFaz/vtPZJm0bPfE00Axrx0T+2YcPh3Nh/WQTU6jhS+VIXfWguAGmL
 lCC85XgCpsmgd4fDTCGNeg0fZdmqMc/km/FZw73wbVD840+kRKeo3qO8SBLWlJ8sc7G708BLIY
 +TVdYmIau1LhMVEdmpAVFFIimTOu+bVLGHL7gFDVWR/eZE6kpwXdPmkmf6QR/SMhNB9LAKt259
 DscpE/P4lGYFEFHyj89piceluNEpRqVSqcwws9+xyAdSwCogevkPctxaseJ7fWnuyPYYKc1QlC
 pilGVrV7YVLk3HYJzFZM1rhl
X-SBRS: 5.1
X-MesageID: 63817683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VdGiNqhemN/6sGThMaVK0V1UX161ghcKZh0ujC45NGQN5FlHY01je
 htvDz2PO6vbZDD8eIxxO9izpkkGvJHWzoA1TVFupHhnQiwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1LqZyWTC0bBJbK2/VaYUNgFzF/N5BJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHJNYUS/FRpyTjdBPAraZvCX7/L9ZlT2zJYasVmQ62OP
 pVHOWEHgBLoX0RPfX0dF7UEgcChp2n4LCdgpEuxjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJWD+0c7Su/8JHSoBfeNDI8Si5AYuEp4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HxgbQ4xawZRGp8crVnl
 CJZ8yR5xLpRZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBsybptYKGa5O
 RK7VeZtCHl7ZibCgUhfOd3ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIZ9bawHmRr5is8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSJjWsmt9pcHL7Xrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldc8XQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:hv5DpKEzK4uWm185pLqFR5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVp2RvnhNBICPoqTMiftW7dySqVxeBZnMTfKljbehEWmdQtrZ
 uIH5IOauEYSGIK8PoSgzPIU+rIouP3i5xA7N22pxwGIGEaCJ2IrT0JcDpzencGHjWubqBJc6
 Z0k/A33gZIDk5nCPhTaEN1OtTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNFNyMIv/MpTvKe0Tt8gDg06t
 M640uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pVVFZ9l/1WwKpuKuZKIMs60vFSLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpV+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOBl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7uywlgF/NKwgF5vsulaSRi4eMM4YDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.88,355,1635220800"; 
   d="scan'208";a="63817683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq4KV6WYGRp47LC2vH2LezrP/DU/+4A21V7NV+mJw9+nzZw23aNM0/M0icckO17WHG3v9plYa1bWxLSF+p7AJmMAQaHHaw2c9xxRmLqRkjdKjb76m7aK6kbUN1Ie5CBGNSXH5qefeXAtvfFIekER8sYgOP+eJOfiXh8NVvd4tS2jy9oOlXS/jYSyFSk1WlT2FjjjEelIhKngwSeJtYm50njXvsE0MQPUKPLWUkt1cm1ZzOIVkSrkApV90ZuK2r/uytveK/4qV5ZMtiKAaVlRJHNf+IZ75nDKk4XmhltqHaucAbszVaIdZyyi2kIyH+B0c/phZtb6qf90tnEZVKQkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awSpnk9KzfJE1f7cDS5tVTLb/jHKmp11yzJIZm63+E8=;
 b=FxuUsRO394j7g4pYMu0jsjt+ENwYMYvpQAg0fRmMkzvdJgqWmMJAcK1YVRGko+06RmWizsRkpRiPflzhjuTnjDGcyLy0wMO1OmQjfhpz/rQXqoBF1n4jlbuaxD+1UKHF3WY2TcdFO64MrY3/+g3XjMo/vK0vHT9yscN08HaOUPrn8msXEfunJUULT+CbGF8e03MwQG2TMKJzwCLYYbGXgihkTCDlKjAI4DgWQ6acxvygwPECI3qj5yxTk487xi/1kc+1VT/yIexCBD8IEGFZ5uaJdfT6/nkcw0vkyMvsyyu0BCS9jRZDNr2waXb9/AHMYdNsyj+iVkzLLVqmgW+VDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awSpnk9KzfJE1f7cDS5tVTLb/jHKmp11yzJIZm63+E8=;
 b=ee2TT8L3fZcm+fYMClbAq6Rg7fLsr7rqEAQPqp4KLp1/BsM+5dSjGVaTkrSfFkjSyP5+NRnJkBkB+Rnj3igmyW7YvpiwzFevGhjRklK+4e47RRltK5etaS281cgMVso5HGZPyQzNQ9mmqW81K+nsizQZvdmVLHfuPd0GmdjmL3k=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max
 conflict
Thread-Topic: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max
 conflict
Thread-Index: AQHYHaBVLLQoAjzhjUW/NIePQEslT6yLB48A
Date: Wed, 9 Feb 2022 10:40:10 +0000
Message-ID: <489b4434-aa05-1355-a704-cbec56b73e5b@citrix.com>
References: <20220209103153.11391-1-jane.malalane@citrix.com>
In-Reply-To: <20220209103153.11391-1-jane.malalane@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e15b02d6-5f8c-4d61-3223-08d9ebb88bde
x-ms-traffictypediagnostic: MN2PR03MB5133:EE_
x-microsoft-antispam-prvs: <MN2PR03MB51338B33966E595CE9870488812E9@MN2PR03MB5133.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: asuvPH2tLAERX+9tHiqLm6CLmaApHQiJ2R6ueZW3ptjJR965RXtvW+QbScLfUEz5TdGNzdt5sylwuDiiHmskvtQZfxjtVSFd75tgaURhkpxABJiYIv/D1Cs4YfC0i6B+l18YDBGZUy/Z3rapCfqGGdQGx2CjogBMFaPM08dDhdmpaPGE8VGk31FYLgl6QfGDMflhd5MK9ijjwGliaRSKjtZjATyFF3u5V81J4LqMMrpkqBo8IdV87HumGQPhEfkCCnxmnrih7hsoOc4S4r2AVo9ywRZaceM434zFy1zx/Nz8euzB0Po6WT7OYScPVhApKEnLHwsPOh83ORmtjOVex/IqAwxp8ElWvlO7KHQc6HEKM8UBwVCqfQjsB9xno+AsbRrDrC/ng8OfEdNzDVTI212dhsDp5ryFnR+l44AC0H3gR4oG1DE1knKOvqTPJCKS6VSHJzkb3rHSzOGo4XHjdWcNrj4AYeZSyR9q6ZHlAE7MrSrXa0HNDuvDsGPuWOvxlH/isu4AfMmosRb5mx+NCU9dhFu8ufvWc3/DhguNG2+6LX42PEsRUvpHs2Y+Z9xvzttDHhvI+xf+J9E+WZFgMVYS6qU0jIDVMa63Ff9JhGATwmKY45X4NQxxZ0FeXu6l3Yikd0zKFZC4SjPulDsVsxhc8oy76dkPrHCKkQSS+p7P0VIAPHOuEkBpHts8Ba/HFI4VFZNuTb8OF0dHxld2WHbocDEEtz6Yks41vHW82lnKcCPsoFPE7BLLleekBUtz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(6512007)(54906003)(36756003)(2616005)(6506007)(71200400001)(316002)(38070700005)(508600001)(91956017)(6486002)(31686004)(6916009)(53546011)(122000001)(8676002)(76116006)(31696002)(83380400001)(86362001)(66446008)(4326008)(26005)(64756008)(66476007)(66556008)(66946007)(186003)(82960400001)(2906002)(38100700002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnAzK0pWNGIrYTc2WDRIR3oyK1ovMEgzSThUdE1zZGtZVmZDQTJtZHNxRko0?=
 =?utf-8?B?b25nTVVKQ3IrM1dUQnI1NW1PMThsOS9aVlNTOFQ2WVNCMTRBdzVoUWwwVzRa?=
 =?utf-8?B?MU10bFlyLzB2a3ZDRnZ0U0U0Q3Vpa2liWFFqWUMrR3lNQ1VXVWU3dE44Q1ov?=
 =?utf-8?B?OHpNZmNldE9MT1g3OGJUVldaNTh0em4va1NVRU43RlZYKzIvbWlpT2J5UnNM?=
 =?utf-8?B?WnNqa3NmWS9USkJKblppY25RNHZCdW5NT0pCMDh4SUtMT2Q5amlxQnJtWW81?=
 =?utf-8?B?bXBRb0tnR0ZMUkljRWhRamV0eVZsc3BJYVhYajA1K0YvZTJUVHVGdVdGdS9R?=
 =?utf-8?B?ZXdSUmxVVW5reklGWmZRVGtIQ2tBUDJWaFdjcHRmY0FaRjFNRXBWc2FLbnYw?=
 =?utf-8?B?TXUwRXBIWkdvcC83SFJlK1U1NW1XOW1Ga2IzenRhUVI3SmJiUXRsU2s1c0RB?=
 =?utf-8?B?YUdqTWZsdzYvd0pLd3Rndk8yZ1BySEh4WXVZUUZFVVpnOHRZMkhuS0o1ZGNn?=
 =?utf-8?B?MllaVzFIZDVWWmozVDFVTU1ZNVV1Y0RGWFpEa2J5M1RQSnZIbldUNXNidTd5?=
 =?utf-8?B?OEUxSWc1N01jOElDZlhGc2VucDBvU0pORHBvWjBmK1NUaDFxZGk5M0RpK2t5?=
 =?utf-8?B?eUcyUzNoU2ozTmhaTE9TMFV2ZlJHZ2lrcGZEYTJzckMwNk5OWUxMNjdhUE9B?=
 =?utf-8?B?RXRaZDhkdTIvWWpTRzdUWmhnZXBiLzV0enVGcDQ4NDQ4NzNWQU5wOTUyQk5k?=
 =?utf-8?B?NG9ud2k0dzNUdHU0V0k3STRlNCs3MlpqTytoQ0xIZkNlNWpCem5hM3UyZndJ?=
 =?utf-8?B?cDF6NWhoVnNFZ0VhcGhoOE1LUHErZ2I0ejV5VURQeEFqRzdvZHlmM1BaT1ZY?=
 =?utf-8?B?ZmF0bWNyZmo4WXhaZ3NOcFdBVVM2L0RIRU5JbmxwYldkVFN2aTEra0EyV1FG?=
 =?utf-8?B?eDVwWTNjRkNnWjFheW9nZHZCS1EzTktBc2RSalFPTUxCclRHcHhHc2IzYjZ4?=
 =?utf-8?B?Qm9hYnJXOUEvdVZuZ2l1VUhidHBmbTVSYVhEZ1l1Y0pFWUE1YnFndEtBaStM?=
 =?utf-8?B?Zm8xYlhkRWpObkxtMXo2cXNFM2g4NXF3UUFwc0tLeUR5ZG1TT3FvWnNwbHRo?=
 =?utf-8?B?V0dYZFN5S0c5UThoV1NjeFpiL2NJeFZFM2M2bFljZTRFYWpaSVFtVWVEeHVm?=
 =?utf-8?B?RVE1REZFZ2prUlgyU0xzaWROaUcrM1FFcVJVZHVlVG9EV3pFZEx5cFFsdmxZ?=
 =?utf-8?B?ZG9RcEVLRzJiMU4vbHZQcXpkWHl3Z3RZRGl4ckJJS0dBVEUwdGtPRTJYSEFR?=
 =?utf-8?B?bCtmeHI0Z0xkQXVFbDFudFU5RFBjZEZxVldHbkpoRzV6c1RTR3M3bEpZZHM2?=
 =?utf-8?B?QlJoL0FaL0lBVXprVmdWbjZMS01UZ3VOK1NOamFnTEdSbVY1d2J3QUlSclgy?=
 =?utf-8?B?M0thRWoxQzVtSUZhZXNNTmcwdEkrNkpFR0NDbFpqMUFKYWZ5NDdCcVBOeW0r?=
 =?utf-8?B?ZFJ6anlJSExMcTJrcnFVUFQ5UEplQXdWV1ZFMUJUakhmMmkzYnNJeVZPWkFK?=
 =?utf-8?B?cmhSVlZEQWh5djNWYzlYRTNFTFB5ZzgyQ3hhdS9ZUnRFRkxKV3hhU3JuQUtN?=
 =?utf-8?B?SXZEbVUvSzRiY21Zcm1tR1hlbk9xRFpCR1hYV3lVV3dmeEw2MSsyU1pJYm1K?=
 =?utf-8?B?cjdqVnhwYXVqZHgveHZBN2puN2kyZTU4YVM4bGlqMXNhZ0hGVlJiWFdzemRu?=
 =?utf-8?B?Tk80Wm84djlwa1hUakdDRkNFa2ZEckNnVndhQ296T1hubWRkQVVhSlg5ZUly?=
 =?utf-8?B?MDlZOWNBUUJTQ2Rkb0QzSWFOc21SSHFFaGNONUR1UDlrdkxFeWZuVC94eWxU?=
 =?utf-8?B?VnIxc1ZRTi9vTzRWS3RYWEhyY3VCUVFVREc3Wk5zdGRNckNvemkzRWpNRlJR?=
 =?utf-8?B?dWNrTjJTSlQzOFcwZ09NTDRJajNyQlZ4U0oxME1pbnJqVXROZWZIL1RWR09j?=
 =?utf-8?B?MTdjR01tL0lTdklQTHQ1THBRNmlWdTZzT3BPMkdTbjBxRmxuSDdLTVFIbGtR?=
 =?utf-8?B?WU1EeXFPNW5jWFgwc2JNQ0RFSHR1Qlh3QjZJZW1RSG15b212UXZTVmlyUlQv?=
 =?utf-8?B?Z0pkWm5YTjVvZmpNeFRmR1d4NDFscnlNWFd4c2hMVFhVWVF5Q3QwRHdDc292?=
 =?utf-8?B?cGRsN0Z2c3V4bElHVW1SRWZ0aExCNGNEdGt3RFdJdzdQSVpZSkpzTkNibGkx?=
 =?utf-8?Q?avNopMRbL99xto4lXxwyfD8fG3bGk+mG5xudcv51E0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D6DAA1E2DFC64468EDB92421FF02EEC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15b02d6-5f8c-4d61-3223-08d9ebb88bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 10:40:10.1959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPcUVJyMQ6udYC4+Yv69qNYCL0e3oOLTn5+//ct6P8gLmk+NzFnQAtJfvWkHfC+rMaz2laUHqTqK8d14abMp53CosR4RcG4L8/mEJl7OTHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5133
X-OriginatorOrg: citrix.com

T24gMDkvMDIvMjAyMiAxMDozMSwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4gVGhpcyBpcyBub3Qg
YSBidWcuIFRoZSB4ZW4gY21kbGluZSBjYW4gcmVxdWVzdCBib3RoIGEgTlVNQSByZXN0cmljdGlv
bg0KPiBhbmQgYSB2Y3B1IGNvdW50IHJlc3RyaWN0aW9uIGZvciBEb20wLiBUaGUgbm9kZSByZXN0
cmljdGlvbiB3aWwgYWx3YXlzDQo+IGJlIHJlc3BlY3RlZCB3aGljaCBtaWdodCBtZWFuIGVpdGhl
ciB1c2luZyBkb20wX21heF92Y3B1cyA8DQo+IG9wdF9kb20wX21heF92Y3B1c19tYXggb3IgdXNp
bmcgbW9yZSB2Q1BVcyB0aGFuIHBDUFVzIG9uIGEgbm9kZS4gSW4NCj4gdGhlIGNhc2Ugd2hlcmUg
ZG9tMF9tYXhfdmNwdXMgZ2V0cyBjYXBwZWQgYXQgdGhlIG1heGltdW0gbnVtYmVyIG9mDQo+IHBD
UFVzIGZvciB0aGUgbnVtYmVyIG9mIG5vZGVzIGNob3NlbiwgaXQgY2FuIGJlIHVzZWZ1bCBwYXJ0
aWN1bGFybHkNCj4gZm9yIGRlYnVnZ2luZyB0byBwcmludCBhIG1lc3NhZ2UgaW4gdGhlIHNlcmlh
bCBsb2cuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0BjaXRy
aXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNp
dHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gQ0M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPg0KPiAtLS0NCj4gICB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIHwgNSArKysr
Kw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYw0K
PiBpbmRleCBmZTI0ZTExYjM3Li5lNTdjYzgwZWYwIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvZG9tMF9idWlsZC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMNCj4gQEAg
LTI0MCw2ICsyNDAsMTEgQEAgdW5zaWduZWQgaW50IF9faW5pdCBkb20wX21heF92Y3B1cyh2b2lk
KQ0KPiAgICAgICBpZiAoIG1heF92Y3B1cyA+IGxpbWl0ICkNCj4gICAgICAgICAgIG1heF92Y3B1
cyA9IGxpbWl0Ow0KPiAgIA0KPiArICAgIGlmICggbWF4X3ZjcHVzIDwgb3B0X2RvbTBfbWF4X3Zj
cHVzX21heCAmJiBtYXhfdmNwdXMgPiBvcHRfZG9tMF9tYXhfdmNwdXNfbWluICkNCj4gKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJEb20wIHVzaW5nICVkIHZDUFVzIGNvbmZsaWN0cyB3aXRo
IHJlcXVlc3QgdG8gdXNlIg0KPiArICAgICAgICAgICAgICAgIiAlZCBub2RlKHMpLCB1c2luZyB1
cCB0byAlZCB2Q1BVc1xuIiwgb3B0X2RvbTBfbWF4X3ZjcHVzX21heCwNCj4gKyAgICAgICAgICAg
ICAgIGRvbTBfbnJfcHhtcywgbWF4X3ZjcHVzKTsNCj4gKw0KPiAgICAgICByZXR1cm4gbWF4X3Zj
cHVzOw0KPiAgIH0NCj4gICANCkhlcmUgSSB3YXMgZGViYXRpbmcgd2hldGhlciB0byB1c2UgYSBw
cmludGsgb3IgYSBkcHJpbnRrLCBhcyBhbHRob3VnaCANCnRoaXMgd291bGQgYmUgdXNlZnVsIGZv
ciBkZWJ1Z2dpbmcsIGl0IGdpdmVzIGdlbmVyYWwgaW5mbyBvbiBkb20wIHZDUFUgDQp0b3BvbG9n
eSwgYXMgZG9lcyBmb3IgZS5nLiAnRG9tMCBoYXMgbWF4aW1pbXVtIC4uLiB2Q1BVUycuIEhvd2V2
ZXIsIEkgDQpkZWZlciB0byB0aGUgbWFpbnRhaW5lcnMsIGFzIEknbSBzdGlsbCBnZXR0aW5nIGFj
cXVhaW50ZWQgd2l0aCBYZW4gKEkgDQphbHNvIHVuZGVyc3RhbmQgdGhpcyBwYXRjaCBpcyBvZiBt
aW5vciBpbXBvcnRhbmNlKS4NCg0KVGhhbmtzLA0KDQpKYW5lLg==

