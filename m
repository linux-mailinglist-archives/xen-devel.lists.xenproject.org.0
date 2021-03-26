Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADBF34AC95
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 17:33:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101946.195311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpNt-0005Xf-Fw; Fri, 26 Mar 2021 16:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101946.195311; Fri, 26 Mar 2021 16:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpNt-0005XF-C3; Fri, 26 Mar 2021 16:32:29 +0000
Received: by outflank-mailman (input) for mailman id 101946;
 Fri, 26 Mar 2021 16:32:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPpNr-0005XA-3s
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:32:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1273c169-e0b8-4637-827f-b7da6849c3cb;
 Fri, 26 Mar 2021 16:32:25 +0000 (UTC)
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
X-Inumbo-ID: 1273c169-e0b8-4637-827f-b7da6849c3cb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616776345;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kqL/TsxVamHcnO3BuDj+gChPGY9LWz88MMzz3zb/CCo=;
  b=KMEUgi0kyg7G9pQRtNBlyn3BztclOFLj6oanMqlg0cxYjw0a1kR2XPsb
   zG55Qh702cmeDRVHmxvjPWKwMtZ1Mhtra7BTZP1cgICVEFcNuSzy1tOcS
   f23MnVF2dAKFv+he8JQ9bZi5xXGNcQ4zC7MvIozhycxPniS8AKsfn53zY
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wFp4xSbeXsrtIx1WXBtPCmVmXMp1GKhxQXYs7qD90+JutwOi2LBCMNokYxTo4rE/nTmaZSO8qk
 YQbB1e+6idmw4nCIxu9Ygmrvie7ZUOI3yCF2dFP3uy0BHJVpAEO53H328Wg/wNyXpJ14AA+NfL
 k4OUOFKGcti7hdrtGn34XeVCnOOFJ7Pt9MNgUDQltiiaiVLzbvrRTbQs+t+mitk+SamqmINQB+
 dSeyPeBIHBZTiDafV02BCiAbfhq7EZ+izPfOMI2ivy5aqcN/ElBIS5oIfBgX5bl+4uGH+e8WJd
 3Qw=
X-SBRS: 5.2
X-MesageID: 40109039
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HNd9Vq6u5F1gf0XeeQPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbzqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczkgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExUYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXdt
 VGMce03oc1TXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
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
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40109039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZVWHQzPKxTAHqlt8TSzLP0LV90VxK/cs7GLT/ywT0+Yu92HjyNpPD8c73pu+RdPV/SIavC9Ukv6IrRUAMc4N/D7kPXgfOYToWkzZxVys3ttN84SViInaZ+pemRJnH2j8DIs91pzrisNFfQqmyyNz9seX5o4ICfFNHwG84Tjr6dZlvdyRQjzXHm3LXzcjnap0i+ptgaio+SWk6Cg/7icJ/gGvFv4m+nVUQoFXD6lZ+daBiwl9q4XHEgyt//4xaz0c11DH9z1mRE3q0LBKt8ytymeWqEHCl2NCOyxf8mHq2JWq4XhHVH7Ft5WOM7exZ3LAdO3Sm8Iz5wdJrC6xqfR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ5U4tMoaLd8RQTZdpC454/U83DhRqVaTFixRadeaXU=;
 b=PFbBXNkChywHTCawLSMCunDa5XQJr5N1rdQqgv1UJM9nSZvg+os3A2ArvDlOMEkLCwR8qRgm94oAbN5vKMFCo3WxqphCgCUb5osujaX18Gr942k0YWJhOZZ/EuS4GRUaSfmbYr8JMikwI/RwsB/c6cjq4ldzX+rSNVSgeSOg5cGDRFle9zJrQjaAOHKoQ5KdK8xh8HIyNXOdT6KBSej6MRXsTrzWHvJfYmt0OZmaj3v/Uo1yHqrJVnKbhDEZkQrdsJuRFQTCxFjMb+pOrWyirySdqLTynpLBz6X+5/FrlMhzj/CWaAewH70r+1AYRKFlb+3wMYo2yZM7tlZFAvG3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ5U4tMoaLd8RQTZdpC454/U83DhRqVaTFixRadeaXU=;
 b=j8EdXOvfZL2dUbAG7ATfOB4+6OuPAJ+df9nx9QApiJYEzeUvZKXQ1wVNZRrfL+acNu7DoT+jlrbQmO3XDXf6dHedF0gDVKlG6xuWJVN78VLwTbTvwjLaoBjEtfzkc1lP9R3b+3D3Nznago86P7NnBDQH8Klpu7cozpWmLh+GBRU=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <e7e94820-b71a-4cfa-8c40-614373215362@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
Message-ID: <19ed3f8f-1dcd-dfde-ffb3-67da569b15c4@citrix.com>
Date: Fri, 26 Mar 2021 16:32:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e7e94820-b71a-4cfa-8c40-614373215362@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ac62ad-ae98-4ac6-5db8-08d8f074bade
X-MS-TrafficTypeDiagnostic: BN3PR03MB2275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB227596678A5751BF9139E07CBA619@BN3PR03MB2275.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJlu8lQ/lMJw3BE5XxiKLvznyxEHKqZTtOHwdaT1eklZkyffpDRO1GeQkYcv0+ib62R7WongFOkRqcNohhI68PrDxXR1WBY/OuTBBQPzkWel0T7BYsuade+QYxwlgRkaId2LPmvNVXFTPJSIAPP/TpYjsAwkB2RsdYS4KFeZAXb/SqGXb4Rdwv2Pf4YbYqqpecamSzsKcbq5sCe3Mk9zux17omzmu6YN26yRxqUi1BhfzFzrQdS4Yx4+1Yg1aSzMBRixHoKOnMiR6CpsW7201RVWFlvWPptOQ6P7XnjxbMN0RXV3pL3iO5i0XPbaWgP22Q7oxUaKMawCrwXo2n1trKDFtfXejcuRneNI4Rwi9yjDsJTjwPbdLUUd5Ie786r5HpYhERNn5ds4uFmcYQxTdZjYk8A5sAEqXqF6EH3GknSBd/t4PxXKYXd1LuRFiV6J1unw8jxqlHul0Rg0Kd9slzwiWt90D2F6qGnqFLNcU4hjR2aVtUdSFV7mCifuJkUo2RiH9YghzjpWwOWGa5BDAeD+ccHTnk31FZP+Jw7bmC2xk/kuhkjonZ6458cBOtarpyT5+dnjZ4V6NqbeSjScctDfJXgj9VqjqbciQpgFFGhqwX8+yUMC1JBZNIksZg+fzuMyTO+p1nmfYmQq8FMU4qoJZ+iCt3k8+J9lJz54Q7DdKxxljrMrIJ8n4gz2fFZaxySYDaSYYvSEpzoT5D0y/1bClyekC6zZj4/IczjOUEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(8936002)(83380400001)(66946007)(66476007)(8676002)(6486002)(16576012)(86362001)(54906003)(6666004)(53546011)(4326008)(498600001)(5660300002)(36756003)(2616005)(38100700001)(31696002)(31686004)(6916009)(186003)(956004)(16526019)(2906002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlpsZWJ6NHRzV0ovYjlnNk13OGw4UkNFeFhoV3dlcjV1TEZxQzI1SW8vSkhz?=
 =?utf-8?B?d0pMV0hHMnYvWWc3Y0VQWDFWeXhzWEd1ZVliemRrbnAyT3dMOUVNTTBOeC9H?=
 =?utf-8?B?MERVQkFITm1DL29hcmtJSHUyVThEVUM3a3VCRFRTcVplT2tybkNxWDJRditQ?=
 =?utf-8?B?dXArbUVScnlCWXAvN2J3NEQ2ZDdOMUc2SXdWaXRuSVZpeTFPSVpzSVFmc3kv?=
 =?utf-8?B?NFdmOEJnU2lQOURkRUhScDlubHQyK1FxQjZTanMwT3JxMS8zRVVReU9yNm1B?=
 =?utf-8?B?cUsydTFTRHB3eUNnQ2psOXBDYlo4NVhFRHlCWG5jNStiYS9DNmZlVFdpb2tE?=
 =?utf-8?B?WXM5SUhORm10eTNsRmc3Z0RUOU1jejRIOXVQRjRHWi9hNEFkK2M2YzE0OVF2?=
 =?utf-8?B?Y3dYZUFZeXh3WURlWGNFZzYvQzJUbFcxeFZoN1FKL2h4d2NWd3JWbWtCdzFO?=
 =?utf-8?B?M29QT0pKaGdlRWwydjBPSTUxdnFSSlBRWmhTUmNuODhjQm5RZzliUHBWWHk5?=
 =?utf-8?B?VjYwWUpFb0VhdVd2eFdXL0xZMzk0WWJtY2Uwa1RyVWZyemNrejg1TWtmbnc2?=
 =?utf-8?B?b0pPV1R0K2NRZXZzWXY5WXptTDUzUytNVTUvcXJHS21DUERrMktGVGkxTWsv?=
 =?utf-8?B?T3ArZDFVeVVtQTVrYnhCcHc0L3g4eXNLVnBuU2NwVi9RTUgyMzdVVFRuckNw?=
 =?utf-8?B?STVTRnM3cTlFUndpNUV3cGNkWkM0alNBSjhPTWRpb2Y2ekNVL25PNGxVNlJD?=
 =?utf-8?B?UjI5ZW1ZTDR0ZFBUc0ROY2QreGdSY21UU0pCS0x1VzVPOGN1dDBSVVVXMkRx?=
 =?utf-8?B?WUNSUS9pMkpLa0hWMzRmRENYb2RpWlpUNktqYmRUOVoyWTRhUlZjSVFZT1hF?=
 =?utf-8?B?UUJ5QzFhVlJESC9KakU0WjVrQnBSZFhRRWRoUDBOMUlKaW1MTzJSSkZHT0dx?=
 =?utf-8?B?TjNjcmdiRFNiSEhNVXM1K1pUNThSWVBXbTQrcFFXU3dFS3hYV1dOUjFoMktH?=
 =?utf-8?B?ZllRRlJrQlBLQmxKSzQvdUk1Szd1Q2F2a3E4Y1dXNW1PMEg3WENDdTdRZElB?=
 =?utf-8?B?Y0JXZ3I3NjZrNmxmTm1DUUVjcm5FbnJSZEhLU3laM0FLcUgxeU1MMVVmdXNu?=
 =?utf-8?B?YXpSYUpNbkJkZGkvUE1yM0dmR2ppRHloUjN2cGFFc2kvb1VmWE1KUExzM1VL?=
 =?utf-8?B?dlg4T2FGdUZTU25lQ0dzWkU1eTdHaHBzVGM0elRCencvcDFJdy9BT2VYaTI4?=
 =?utf-8?B?b3EyOW0wcUlYYnBUc3FYeG1XMkd3TWkzUklOVnNPOEorWUN0aVNPYmVPcUJm?=
 =?utf-8?B?TkhFWHFQcjRIL1p3blgyd0JzVWQxSUhuY1oxSUlLUHBmbkUzQjZYQ1hoRllV?=
 =?utf-8?B?a2gvWldOMlk2L25JdFBhUy9RUmgrNnVVWVRzeDJZek5lR0toR04vK1dkODdT?=
 =?utf-8?B?SmNhZDlDZ0hkV3JpZmJlTnVLdTl0c1JHTmtaaVA2MERCYVdlYk9ZT1M2Z29D?=
 =?utf-8?B?ZmFaeVlNNzFxT1Y4TDBHaVhJcXBvWjYrUFJNclBGUnRCdVlNWDB3cFkzcHZa?=
 =?utf-8?B?TTFndmtHU25URFlDMFBaL2xHWEZlRGpyMVNZTkxRRnZkMkFZS2pGVnRRVThF?=
 =?utf-8?B?dEdTRUFDc0RST1E4SW14Q2N0VjkxUFluazF1bDhucUNRN0kzVkxFSHV4ZGh1?=
 =?utf-8?B?dzJLQzBHYnZIMk84Nk9EbjBsc0lhTWVwYkhJanpMM24rQWpCK1JRSlNCWWpP?=
 =?utf-8?Q?DxPvy6m7SnPCMX7uhJEKX3R7X9uQA8so63crLKA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ac62ad-ae98-4ac6-5db8-08d8f074bade
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 16:32:21.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbUFouyy44iwcSALBS0v/STYyWrWip4V1Lz+sEvn6mLsVInUL8nCDGlIiT/cy53FFSnWsAhOisd0Ho3o2WYx0Fo83A3LO/V/hoPaPrl25I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2275
X-OriginatorOrg: citrix.com

On 26/03/2021 09:51, Jan Beulich wrote:
> On 25.03.2021 18:21, Andrew Cooper wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for m=
ore information.
>>  When the hmp-unsafe option is disabled (default), CPUs that are not
>>  identical to the boot CPU will be parked and not used by Xen.
>> =20
>> +### hpet (x86)
>> +    =3D List of [ <bool> | broadcast=3D<bool> | legacy-replacement=3D<b=
ool> ]
>> +
>> +    Applicability: x86
> If this is the more modern form to express this information, then the
> (x86) I did put on the sub-title line should imo be dropped.

Oops yes.

>
>> +Controls Xen's use of the system's High Precision Event Timer.  By defa=
ult,
>> +Xen will use an HPET when available and not subject to errata.  Use of =
the
>> +HPET can be disabled by specifying `hpet=3D0`.
>> +
>> + * The `broadcast` boolean is disabled by default, but forces Xen to ke=
ep
>> +   using the broadcast for CPUs in deep C-states even when an RTC inter=
rupt is
>> +   enabled.  This then also affects raising of the RTC interrupt.
>> +
>> + * The `legacy-replacement` boolean allows for control over whether Leg=
acy
>> +   Replacement mode is enabled.
>> +
>> +   Legacy Replacement mode is intended for hardware which does not have=
 an
>> +   8025 PIT, and allows the HPET to be configured into a compatible mod=
e.
> 8254 ?

I did spot and fix that...

>
>> @@ -1922,14 +1924,38 @@ static void __init check_timer(void)
>>             vector, apic1, pin1, apic2, pin2);
>> =20
>>      if (pin1 !=3D -1) {
>> +        bool hpet_changed =3D false;
>> +
>>          /*
>>           * Ok, does IRQ0 through the IOAPIC work?
>>           */
>>          unmask_IO_APIC_irq(irq_to_desc(0));
>> +    retry_ioapic_pin:
>>          if (timer_irq_works()) {
>>              local_irq_restore(flags);
>>              return;
>>          }
>> +
>> +        /*
>> +         * Intel chipsets from Skylake/ApolloLake onwards can staticall=
y clock
>> +         * gate the 8259 PIT.  This option is enabled by default in sli=
ghtly
> 8254?

but failed to spot this one.=C2=A0 (It was an error from the original
patch).=C2=A0 Fixed.

>
>> +         * later systems, as turning the PIT off is a prerequisite to e=
ntering
>> +         * the C11 power saving state.
>> +         *
>> +         * Xen currently depends on the legacy timer interrupt being ac=
tive
>> +         * while IRQ routing is configured.
>> +         *
>> +         * If the user hasn't made an explicit option, attempt to recon=
figure
> s/option/choice/ or s/made/given/?
>
>> +         * the HPET into legacy mode to re-establish the timer interrup=
t.
>> +         */
>> +        if ( opt_hpet_legacy_replacement < 0 &&
>> +             !hpet_changed && hpet_enable_legacy_replacement_mode() )
>> +        {
>> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Lega=
cy Replacement Mode\n");
>> +            hpet_changed =3D true;
>> +            goto retry_ioapic_pin;
>> +        }
>> +
>>          clear_IO_APIC_pin(apic1, pin1);
>>          printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "
>>                 "IO-APIC\n");
> As mentioned on irc already, I'm somewhat concerned by doing this change
> first (and also not undoing it if it didn't work). An AMD Turion based
> laptop I was using many years ago required one of the other fallbacks to
> be engaged, and hence I'd expect certain other (old?) systems to be
> similarly affected. Sadly (for the purposes here) I don't have this
> laptop anymore, so wouldn't be able to verify whether the above actually
> breaks there.

Turion is K8, so very obsolete these days.=C2=A0 If it doesn't have an
IO-APIC, its even less likely to have an HPET.

Even if it does have an HPET, there isn't anything to suggest that
legacy replacement mode is broken.

Would you prefer me to undo the change?=C2=A0 Its not easy - we have the bo=
ot
time config stashed, but if it was periodic before, the accumulator is
broken because we can never read that value back out.

> As a minor remark, I find the "goto" based approach not very nice (we've
> been generally saying we consider "goto" okay largely for simplification
> of error handling, to avoid having many [partly] redundant function exit
> paths), but I can see how using for() or while() or do/while() would
> make the code larger and require deeper indentation.

Actually there is rather less to repeat than I was expecting.=C2=A0 I think
it is reasonable to take out the goto.

I don't think we want to multiply this with all fallback modes.=C2=A0 The
issue we're fixing here (new systems don't have a PIT) is orthogonal to
the rest of the fallback chain here which is looking for PIC/APIC problems.

~Andrew


