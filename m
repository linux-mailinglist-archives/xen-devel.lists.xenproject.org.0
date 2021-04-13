Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902635E14F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109900.209769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJwg-0000oq-Ko; Tue, 13 Apr 2021 14:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109900.209769; Tue, 13 Apr 2021 14:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJwg-0000oR-H7; Tue, 13 Apr 2021 14:23:14 +0000
Received: by outflank-mailman (input) for mailman id 109900;
 Tue, 13 Apr 2021 14:23:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdUp=JK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWJwf-0000oM-CT
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:23:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb2e5442-f87f-4488-b876-1a7d01c1e3ad;
 Tue, 13 Apr 2021 14:23:12 +0000 (UTC)
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
X-Inumbo-ID: cb2e5442-f87f-4488-b876-1a7d01c1e3ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618323791;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZdSNRhbCrabpYJb6OC8w0j5IxVxsEzH5aLwmt+cxV88=;
  b=LxibjYnXTHxZUBdYLNApdeupBiGe+L36p1UhsD7xIYOb013/DhkHdNpn
   ilpQo2WMJTxpJ9orxgD3kLBjIiI5s+8VXPdMoNnNoNGt3VBcbdVBbYDf2
   k8YbMd2mqBwBw6drzImThggMoQGJ8Tm/i249o71CmJhqNkL25koFyi7bf
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jIf+hu8lSZVODWZ4zgLvB+FzJEmeoL3JsQZNA84ob0IldinlyrATi05x9cZE9jQvpTZZxqromY
 t2pZNu4fumX+kLllCqhJLT2I2n8sMm+0h0sPSFDCBpLTjTIn5ZUIVI6n/IN3dPsqGDJsGUGFZt
 HeP34xoPmwnQnp3MX7cW+AmvENJKuFtyMO6HvHscjEbH06yRipSfj9kwNS5JsLP550BclFtYCG
 e4VIAyMKXv+9APjX7IS81k1ot70JMfWbEuGep2RwkbqlNuu3yJVX2CRLRwLVFHrIYq+KnhNa6S
 64Q=
X-SBRS: 5.2
X-MesageID: 41869228
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aYMfDK47f+S0LwvHeAPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczlgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExkYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXct
 VGMce03ocyTXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OCDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieR/Gm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyrisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 lijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2DpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnwzoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9HqnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62yEpb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl0gqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y8YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr+1+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIEz1/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z+yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz0mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1ZjZW/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zpeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2CPY52yhFkknVtY6SxmkVCo+rHO2hakIWh2dSvDgptXWjFPNGOvls
 qty5nB6EjA
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41869228"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPP8/KZliPksjvx7gwOdjcRMTaoNq78OlIILuYPFqpCkRwIkp1iQEP3do3OI0qwk+5v7qLWJEQANMJ2Kr2xAB2TpoPmPL+dFeLOlyBsSDD3AvLjdpt3B7muZvxqP1QlYTgmOSp9pdvq7XekBsLRQBxYJvMujb1EeNhyaTfxMdeGYjYfRm3YOX97FnU5aTayhbhj7Tls//EE/p2bQJWjk8efIU44FGWrPvIlFLAiBe3VhFmd9XIZFppcD92RAQczwpYQe197BlxzpQbHN9Qd9qOSK06vYfrYlxDhPQyC24U89FDFBVQTlxuYHZrVmUc63a4LQPL2dTTicjwZ37RD5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcEcuGT5CzpfD8GdcPaNxvjGumol5BGSThm3KYSRq9Q=;
 b=FE8ncgMS95UBXe837rNUmEgOxGT53Mw7qrfHACym0AnJv3mnF6Jf3WeVD25L1BMh1YM4EV6cJu/sS7o9Xf/Y54PlS8/TFwwQxDluIFqUR2N2XlxirW8gIOve2F+PSGkAOHS9KKuTqDIpG55Lnq368C+JZ9xPhHNPaZzTyi0iHyOLeMTJXjgPlwK2xtZL3ycvVWmeMp7lp9oSt3CKUIo+TOSLogQ6MsMYsYoXPPlyZcbpJV6zt3Rt0ckgkjRek8Nj6zdrj0E5JSIP9t5i8Q6quqgON3H+h9FHVPGP5m6VEM8dCSXFR42FtlMLnjeS+zM9Mtsn34fh8BsPnyfUvh1SEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcEcuGT5CzpfD8GdcPaNxvjGumol5BGSThm3KYSRq9Q=;
 b=HEpKotszhxE6z0seXsvDVikqCLafzu+PtFr/AeJp43dvdGg8Ypj75gdtIPXK9+KwZrKRamAsLwI5qpvZ3Mz1iYjB9o3J/BQ5vdvkErDcTqQGQWlGWP/AjJhf81WCq0CZfMqyVwew1hI/zlb339nWw89RzavsHkAl+QgkBD4TF/4=
Subject: Re: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
To: Jason Andryuk <jandryuk@gmail.com>, Wei Liu <wl@xen.org>
CC: Dmitry Fedorov <d.fedorov@tabit.pro>, xen-devel
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Anthony
 PERARD <anthony.perard@citrix.com>
References: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
 <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com>
 <20200922133047.4646b2ab62cszn46@liuwe-devbox-debian-v2>
 <CAKf6xpsOfM=PSFW6sUx5yozmEji9f5t2p+5+mrpX_2cOqGBOmQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <301e8abc-f50f-0159-a373-d9eb54f9836b@citrix.com>
Date: Tue, 13 Apr 2021 15:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKf6xpsOfM=PSFW6sUx5yozmEji9f5t2p+5+mrpX_2cOqGBOmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a57abf-109f-4e0e-6302-08d8fe87a8ef
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5534275EDFA8BBC2AF68CB1DBA4F9@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Bp7VO6PQuCB3TDxPfPu0fHKnPeYHEAFiDMmGqLjrSo44dnthdcoAZQXoMzjh5dexlFAAAJQeVIoXyKIaXgwqhb11rrp/ZlXLDOq0eDQfp4ASIIjGQymR/G/rzTVCGS27M0OazSvo15TbkrbCeOtZYVM6mlxHLK2HsmfErHGPqI1OMvErmPi6/J4d+6EqN9Ey1f5cJKqGdoVYjxaoScgEHmEdHhD7Bjgs3wSIkXuO6jAWLpwJR2vAQLvoXdltn13S/dWBVr/dqWdL24CLQXscdNlsGavPLeYoF9PUlWfP5Y9efCGCJd7voS25jnbgx+zkcvAfQKHNXsuYSMRy8A2YDAS+tt8prqAK8ocQZHMCRNYvlVreZq9Brhf8fEwhe5+NuxZnPdH9/wi6ofRljf6ae0V0roOXdsXqDwdgJdQK98rpM8+dhOPy2lakM0O07FxuuE6D4NvbFAl2q2gu7Upzr3MRZL3isB1tTmrX6FQXzBvX8vYmCE2jR5X28YHr8107GCurDuESEGQUy4H5FsOyAWweDITMbx1GRo1RhcGQM8z7+shcmDGvFXqC//h252F8Mny4wPCtglqihgXc+OmL59jqaqVsYDG1n9Dip27rOsUgbFDpSm8Q4AbL2Rcz6XCcyVqiioCa4Fl5GhtHZRLJTQgk42GkQxnu7Ad3uzSZFluxxiZAwvezpiPAJ0OY5Tl35ElkeAZ+L+TlGHkuTxgNv1kh5613zZqlR2LcvEvH1xlJsBiWMMbswA5izp2IDs/360QQ90hrDIRttmPyGDgpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(54906003)(8936002)(316002)(86362001)(6666004)(6486002)(16526019)(107886003)(66556008)(966005)(31686004)(186003)(956004)(66946007)(110136005)(2906002)(26005)(5660300002)(2616005)(53546011)(38100700002)(4326008)(83380400001)(8676002)(31696002)(478600001)(16576012)(36756003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SVRqaU1ZM2ljWFNUQ1p0eVA0cUluQWVtNnBZYTFaWWJrWGlwb0pWY015VUNZ?=
 =?utf-8?B?cHNyVGZZcmhidUxEVXI3dHpOTG5RWTlyblN6cnZvdzNKTWg1dE5tL05vTm5o?=
 =?utf-8?B?Mmo2UXZuOTZkRnpMSm1ZMjJGWVJpM0hlMzFEUlh6bmN5MzhJV1gvSW1ERGxh?=
 =?utf-8?B?T1JPZlMrd0Ywc2RHMmlvOFltNCtWcStad3NYbWF1ZWtJc3JRblhoUnVnckVG?=
 =?utf-8?B?VlYweEtZa0JjN1ZlU242SkNmWHYyUmlQaVFwc1R3NU9ZdW5HQjZsYm5hNmVT?=
 =?utf-8?B?dnd3Uzg4MUx6VGFBdTNyNHBibWRLQzNNM2JqYTUxNVdKbTJYUHROa3JadmNM?=
 =?utf-8?B?U01FV1FjSUZ0ZkhpM2tYeE5tSm54enpYdHdEanIrZ21aRTd5RFk0Uk83SGNY?=
 =?utf-8?B?bE5QZU9UNEx1ci8vQm5nUzRWR3pmUFN4bFpaUnVwU2NkMEFxd0pQam1nSmJH?=
 =?utf-8?B?T0p1WHVaOXZRQjlMNDhXekRpTGV3WExFRjlPRS9hRFRlTHlZNTdMSCtPOUp1?=
 =?utf-8?B?eUhmdDEyTkY0ZDBSNzJCTDdPbzJWWWx3SkpGenlKV0ZYUng3dUFzS3g0RzlN?=
 =?utf-8?B?MVhkdzBKR2lhYS82V2duSDFLaDRHei9QalFyVE9oaE5aK3pnd1lmUmV1Qk5v?=
 =?utf-8?B?OXZkZFBJNmNJeVkzMjZCNnh3VEQxQU1naUdweFpsejNOazRiZzF2SG4zU1h4?=
 =?utf-8?B?WkpuYUxuMUwyTWhWQjRPTGpRSWxGRlpjSmJ4M0JIb3R6RVpWNGlVNU8rZWdO?=
 =?utf-8?B?M0NWa1dqV05YTVVRWXE3aTVFaXU5cEhoaEJvMG0rTmlCU3NaU3JiY2E1aFds?=
 =?utf-8?B?RXNDR3FtS2kvMmxvMXBVcVNSRXJJZ1g1cEpobGRlN2RNWXVHTENTUnpleGZX?=
 =?utf-8?B?Yk14dVhHSEt5V2kzSGhqWXp2ZUZmN3VSYUxxQTRqcjl3V1lGQ0d4MVdrY1I3?=
 =?utf-8?B?bDVYVUJvQnZTdkhERS9ZQjZUTFluclVrNnVzZ0xaTFhldWtzM2Zkd29ycmZz?=
 =?utf-8?B?V09FZm5saGhET2dmSThUS0l1S2NSSlJFVFg3enkySWZRVWZzN0M2bEFrajd2?=
 =?utf-8?B?TExpUE0xOHZjV243UzBMNUN2eTlKVVZLdVJSd1Z4MmJGOERqZFh2cW9EbXZN?=
 =?utf-8?B?WU1ycFcvSllBMTN4THA0aWI1TzVPREtRNWdwbkxrZ1lqbXBTZitBcUZKSFF4?=
 =?utf-8?B?RGNJT0FaakRWRnJJaGMvUytxZkdIUnZLVVJxUnRUMmx2VG9ERE5BWWlwbmVi?=
 =?utf-8?B?MkVlYk1vbTB5Q0hDdnBURWVMRUU5NlMyRzZnWmlCNWRkb0hyaGo0VVNEYUVS?=
 =?utf-8?B?TzNHb1VaaWFOVytHQi9UY2UzL1htaTZLaWpQblZVYmxzWkdaTm9GZ1Vpcjky?=
 =?utf-8?B?M1pzbkVRRkduTzJ1V3NHMmJjaFhQellMSkp4elJtd3oybFpHdTZuNm9jTlBP?=
 =?utf-8?B?YS9VcldQVFMxcmpGekhLTkh4emFPYlJyY0xVd29vOG0yd0pPMndFR3BBek5w?=
 =?utf-8?B?ZnJ6ZWx2QkRrTHFSQ0QvWUxhMnZyczg1ek5TMWNFQ0RPcDhOMFJUWk90SHlG?=
 =?utf-8?B?R01qdXFpOFZGYjdnVkg2ZjkxU1YvWWY0SlNQand2S0VsMTdVTWx5Y1pUMnNs?=
 =?utf-8?B?WERDdXEvVnBWV1hYNVdKTVNjTFJ1T1Q1bFJHOWFIWmVNcmM3OVpVUTBHMERT?=
 =?utf-8?B?eVJ6bUlSQmtnYWFudnN2WHdQRUVrK3F3UDdTNEk5dUdUdVplUk9SZEFXemQz?=
 =?utf-8?Q?SuEiBVqhH8EaQzjA0Ny/mpQ2nRL8WIz6wrFEpqg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a57abf-109f-4e0e-6302-08d8fe87a8ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:23:08.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5U7vjxVcPlk5u3O6vF912GsgayeYEuSmlpF5fmP7wFMtzrTMYWOLxl/ySSOOhKzKmelAdPe2UZOXyGcFcpNEHwlgvNMYNNUynjI6u7ZrLQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 10/04/2021 16:55, Jason Andryuk wrote:
> On Tue, Sep 22, 2020 at 9:31 AM Wei Liu <wl@xen.org> wrote:
>> On Mon, Sep 14, 2020 at 04:27:45PM +0100, Andrew Cooper wrote:
>>> On 14/09/2020 15:50, Dmitry Fedorov wrote:
>>>> Hi,
>>>>
>>>> Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
>>>> an issue where a device model stub domain doesn't have maptrack entries.
>>>>
>>>> Would it be possible to apply a user defined max_maptrack_frames value
>>>> to dm_config in the same way as for max_grant_frames?
>>>>
>>>> Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>
>>> This looks entirely reasonable.
>>>
>>> CC'ing the maintainers for their opinion.
>>>
>> Looks fine to me.
>>
>> Acked-by: Wei Liu <wl@xen.org>
> Hi,
>
> Wei, looks like you Acked but did not apply this patch.  And after the
> libs rename, the file paths no longer match.  Do you want to fix this
> up, or should Dmitry re-submit?

Apologies for the process failure here.

I have committed
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=80714e55042b2242cd82eccfb7405d671ecbebda

I take it that it wants flagging for backports?

~Andrew

