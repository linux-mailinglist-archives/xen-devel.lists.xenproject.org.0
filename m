Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DC4B6E83
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273217.468323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyd8-0004kl-2M; Tue, 15 Feb 2022 14:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273217.468323; Tue, 15 Feb 2022 14:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyd7-0004hY-VR; Tue, 15 Feb 2022 14:16:33 +0000
Received: by outflank-mailman (input) for mailman id 273217;
 Tue, 15 Feb 2022 14:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJyd6-0004hS-6H
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:16:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde46f3f-8e69-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 15:16:30 +0100 (CET)
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
X-Inumbo-ID: dde46f3f-8e69-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644934590;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fHYFumZUSEv8GHLg4KX2/xVq5AlxmvgxOIW/G7sGDLk=;
  b=NH9W26U8JvC/BcdrVocX0SRzdPonlc2wuXKBxL+u5Ee3LDY1OBssWPOK
   QmepP20s6EZRnPmL9nD6NfpdIYn3N38Tx0cGAjW7mk5tub8984FDX3U/w
   ToXGnP8N0ZeolL0dSBmiY4xWNXjscfzkjql7dk1kWYQ4NFY16PYlATXBk
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QgDxyYAXWi4CzPlDKkTZtmMlV6X3pAURUY6/aA1k1Dqm2jqnLzPaz0bYSkfXKch5JmuNmxJqmj
 EJO2L/sUSZwqxtAOcAUaC8THBXLYIWU32IglQyQOlaBcjDJ0doP16zF7XUZunBg04woLcYWQPe
 qODYo0GPE1yMKmd38Y7uNg/aaUufyGm2ZzWo0mJk91sF3YS6y5y634l+vZXhOadObfskyy1XRB
 hHfo+h5zVJ7bp81phwpdX2TUd9t+hVAuV/eTol3DwSUOtf/eC0nHzn/VgQyUPc2FWUeqAeIvzM
 LGfVwd57+wXhJ3RV1VrgbZrM
X-SBRS: 5.1
X-MesageID: 64146537
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IGsTbqr26iux4cjfYg/VwxyNwJdeBmLoYhIvgKrLsJaIsI4StFCzt
 garIBnUa/uDNGSgfdh0Od+y8kJTvMLcnYNhQQA4qCo9FykRpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HkW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb3zVAp2fa70pOg6DBMfDQdlEZFhwqCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SRKqAO
 pFGAdZpRAbeWT5/KnU6Mc4FkeuIt3TAYxxIqGvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWI3XAaAhASUVq9oNG6h1S4VtYZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0WcdUEuA8wBGAzOzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJzWVH/CtbSskT+VZiJSM0kZSRMjdxRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWe0bb1HRcBJG9GRF5mLJ9443d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8SYu1Bq2JNoMVOPCdkTNrGwk0OyatM53FyhBwwcnTx
 7/HGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l4UKGPmOt4IdQ690mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq671hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:I0PCXK8X5cIN9TiIcfxuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="64146537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1FFy+CGkZbdgQlTL27wKyXhvF79yxksgLI88XCgmkYYbeQupRoIDfcpDQKKfwwxa+tymAVEScdBTusFD6UfwDZI9t5BGmfkC0sJUFBCXpocorushHzM7ipJ+CzHR8wifC+TRnQIW88rd98jwFWAhNua3PuIznjguboq74gZP+2ZJFfO47BSY1JwnH42lqhDQSnj6IyYe7dpJKC7TSQxTSGeFp3PaGtjx3/TzARk0xtBab9z7Gnd/JSJMqS+0YSd8W2NJei+ALOv1EJxpylBt0PItYETOzWdkW9D5e4JcOAjAAlBeLkJcsBRmL2V4XC25IRAanPo9hjF8uBdolqfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGV0L+/KnQNwueDBMZXeET0IfGjUwvWawy+o5cWbojI=;
 b=dUkho0VYIXMPgTnuRvHZOlRyEnPevx8o6Y8nugiSmrRUxQc6fqLlmcKllbPPC75tP0W+jIxppVkM3IazEcpvRJLvW6GPuPgyGjEv2roqPMEnuk+DVNiyCeEGO7d7IMNBQPLUqG5nwPje6PluI2mzUNidg3oiK0JpAmrI1I/seaVVB68XOeQ/KxASgCZULAhfgJh0zwwt2H7mENsONxWvbdS9TsAV1H6VL+r3wbQTFxvQHqHKVzfWY56d7U5vERWUesk7e8xASBE1ESwRrir/eJPUB34N4+LWf9UR/c1zdOQEtE61oCppDdZrWmudyFMdQHr790fTfSNsSNixviY/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGV0L+/KnQNwueDBMZXeET0IfGjUwvWawy+o5cWbojI=;
 b=ku8hCZb934EI1qLAHOGdFTx/b/X2WP6Mn1cdsGC5Yxm6V6JaPoZ5aRAz2n/RE405LRy4xCUV9Eg8Jbtwwxb+3fQtfg5e0mUnqvlug5jzMmNKlEdO1WlX26fsf/8hWoZhEnnxXblw3vCKpGQt6m67HC5zq7zZWWXFK+9Set/480U=
Date: Tue, 15 Feb 2022 15:16:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
Message-ID: <Ygu1si+HEiPB8vGz@Air-de-Roger>
References: <20220215093951.97830-1-roger.pau@citrix.com>
 <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
 <dfc3ab95-f2ca-bf03-98c1-5d77ebcdb048@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfc3ab95-f2ca-bf03-98c1-5d77ebcdb048@suse.com>
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c7707f4-b912-4660-7c79-08d9f08dbee5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5488:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54880CE3AD9AB2D4E1CAF7118F349@SJ0PR03MB5488.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkrKiRACK6NRSt49WSX4Xr8byiCgpqD4cE991hkgjR7WogKYTpKjv1ersM2x2MCx0sYelpU+ahZCuyv6jpNrcB5fi/mvjP0jKGAEDqsOrePol6gYiyBJM6mNclyVRRUgNNZ1h5oeA2Nj/XFR8IyM4imlVBYk12LGJlSjm2PH1iveVX5yEoWWNFyzEnDouTCDBxeGMLTvkxvPShuS5Ti2LHftfJtD6H8u5bpN+NG7sCjFcUmP8iayKIfNItKRjq6wVX0GzjjSwazEURyYkyxm7mQtc2KyjgMGV9YkGxM8ByJd1zHcIPfnVvjxXaGXxi2xPQizF32Hpljyp/vePWCemRGZUDPkcEF3a8OCPzuPKCvNSmLWFYGN2M1MY5/42iRLNHkN5ANiOkfiJK8MavOKULHQRNfU2Nl9UR2NZ3a7YmI5QdZGzMKosEKI5qhRHvB45FqRBIsI3i13L4fMla7Jc+lzgqBZJcDhp1xL1aKSeICkm0SJFITnSDP9WkQPpzQ0ngdm3r4hOV6fNBlVZaedsbPFIqil1sXfC8EOxBw1sOxFQmSjUREr0MAUFBtI2ywMzGJMRXUv1I8cJdMxPDsl1BaELv0bDNG0xwQ5iTC7zLSrlOcoqV6GbxHjQUgksoFDS1VsWI3Wxpwc8ZnZsExNVfSgi8FPVCxsOrvWDaNq6StDcu+DZAfFf5odl+1WVTJ7PMwyn5ddmBTRioRpRBFfag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(82960400001)(4326008)(8676002)(6486002)(54906003)(8936002)(6916009)(85182001)(38100700002)(5660300002)(66556008)(316002)(6666004)(66946007)(66476007)(53546011)(83380400001)(6506007)(6512007)(2906002)(9686003)(508600001)(33716001)(26005)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REVKdjZWNHVGZHRoYkt1dkZ2Y0dFOWNTYjlVZ2tlaTJwOWVVTlRkZkRUVEEr?=
 =?utf-8?B?QkRlRHRweGxIeTNjMmZkNG9UUEk0d3Q3Z1pxcVpWZ010SGZydEZ6MWoyUXM3?=
 =?utf-8?B?MjBFamdVcVZBVGJRWm9aOWpDd2NRZWs3ZWdkQlYweTJPWGk1bWFjQjE2TnF1?=
 =?utf-8?B?MGx2TFdubWhZTzE0aXQ4WjdsQjk1ak9mRy9lSUlyZWV4R2lTZ1c2TDJlOGxn?=
 =?utf-8?B?Q21FNWVPR3VYUG5zL1dYWk92emZXbmRyaS80WlZWOFdqU2dkdDBmbTVCTUVZ?=
 =?utf-8?B?RnpnZTNLTVRQWHlQOFF6Wi9jNTBNRUpBOXU0Vkltc01sbHRqbzJIcGkvVGg3?=
 =?utf-8?B?MFQwTUo1ZW5mb2lvTnZBYWFxVDRIaHpXbEx2N0gwVzVSWWZJNXlpR1l4aTVa?=
 =?utf-8?B?bjMzdjRzQzNITjZ1TC9NNHVDSUNhK2VTQjRKK1JaRWM0dHNzc1ZlNjNpRS9U?=
 =?utf-8?B?QmZ5WkZ5MjFkOTNoTk9aVGd2YklwdW5lWC9vRE53SGdnR2NOTmhveDlldTZj?=
 =?utf-8?B?ekFkNnF4QjViQURuUkhEUERHMWgxdEsvakFlZmZIWGszcSttdVZRcEpIVkZU?=
 =?utf-8?B?WTJTdTB4M0lqamt5Yk5XaE9mUVo2Vlg0MWs1c09BcytoNDVXV1lvbVVaZmxO?=
 =?utf-8?B?bi9mM2lxdVJMempnc2U4d1NtczcyNWpGZFBhTjUwcENuYzdGR1J0aEhFVDNS?=
 =?utf-8?B?OE5HSTNDekNIcldmYm5pRFpWVXBmLzlwYlBtLzFudWY3V1VVUWU5REszR2Vt?=
 =?utf-8?B?TDFTTkVGWTFXb2FXbXJ2QS9WTHdkeFZXUDdTQmswdXhiK2hKSVVCK2JBWDg4?=
 =?utf-8?B?V1hrZmZiVTNkV2duNlAzcjZmdUFMLzhyREI0Z0pxM1h1WHJQeVBydWZEMmZ4?=
 =?utf-8?B?b3BySlJ4Z1htNmt2RnVucmVXUUhIek56NitaZHl3VjgzdnpmVGl6MTQ5MUk5?=
 =?utf-8?B?eGE0MVErZVY1SUx1WUxwMnc2OVUvUXZDcEVXRGVKaW5aYzVWWnh0ZGc4YWZz?=
 =?utf-8?B?d1NxNlFwOHNsL2szSmJVeGdJb0VhOERBVGdqbHFHZWQvb3B4S2hCdkhkV05j?=
 =?utf-8?B?VXlZZjhBYUdwK0hpeVNDT1E3SG55djQzdi96NVlFanEwWnNnVWk5WnBwb0FF?=
 =?utf-8?B?WHM1YnAxanphK1pYbG5SaWVrbzFXUTFDR1A4QjJveEpXS2ZMMENCWVA2SXkx?=
 =?utf-8?B?WXhGbnE1R3dxdzFiNnZtRGxRMjg1YjNSaXRIOTlJYWVwbWJFbmEvcG0zbUNa?=
 =?utf-8?B?L1pieDNONGdlNTM2T09xQ042cXA0aDk3L05taG44WnkzVUpQZXcyQ3FZNUV0?=
 =?utf-8?B?Z1J3aTBWU2ZWRnUwN3VVUGtialg4NVNrL25nZVBmckk3TjVkaFUrSEdILzl3?=
 =?utf-8?B?YlU0cFV6aEdaRCtRV3ppdFFYK3I2Z2ozT0JGSHFyM29icXptU1Y4ek9WUWVH?=
 =?utf-8?B?QXVpMnpvZmNyQXBUNzNJSlhzaTlBT1d5NDhMMjd5ZHVvdmhFTlkwMDJIL28v?=
 =?utf-8?B?Z09MNGlXMXAyTVpRc1A2dTIvLytWTzE0N0wrT0JBbVR1V3k1dEw3RC9hcmJL?=
 =?utf-8?B?UVIyQS9yaUNaYmNxU3VwOGtMdDRUNWRwSG43NUdWVk8yaERlK0lDYlhlMVVk?=
 =?utf-8?B?dDRFMFFTMy9uemJLTjVqc2d5QTJXSmxGR09NM2NLUnNYaVpiaWRlQVh5ek5o?=
 =?utf-8?B?amZlUnNGMEdCcXVvM2U0Tkg4WXpXTlJoeHFZeXlsVHhrR0xLQzZWK010aTVX?=
 =?utf-8?B?cHlMTU1VZEhBYVJvams3dVdjT252dlFQM0lpUTN5SVkxYlkwcGMxR0QxaVJL?=
 =?utf-8?B?Unl3MExaVFNEMk02WXNyckVhUDQwVHV2Qm9kbURDWjA4RUIzcmYxWWpJY2pF?=
 =?utf-8?B?THBzYVRCcHZOdVR4bUdNQ1BGZTFvT3dMdFNBM3JKOUd5aVRsVGs1dlFsdjNm?=
 =?utf-8?B?OHlVUkkwNm5jRlRnMGZEajZuL1lJcmFsVnBCRDgxR21jWk9HUE9CWVVNVWht?=
 =?utf-8?B?S0I1VVZTYXJ0cytSaGQ5a1ErckFVOUhaQ0tKbXNCcThkMzdFWkVRTlhtUThj?=
 =?utf-8?B?MWwzRnNlQURJeDlJQTNjZEF0NTZhZ0xzSjB0aU56RTUzc21DUWlxT1U3eHZB?=
 =?utf-8?B?eVFSWHhjc1N1WXpteWtBRmRpQm8xcHp5QnRLaEFDaEJQK1kzWmJIT0dEWTFk?=
 =?utf-8?Q?O7BE4vcIykla3fIvwDQVjN0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7707f4-b912-4660-7c79-08d9f08dbee5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:16:23.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sI/uZbO5mm4hgfOF6rTshnRM4JnCtBqibBnJzM3V/MEh08dBuUHeJDOk4P4lF6pztDC0zPdiBBtfdb1tppu25Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5488
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 02:22:02PM +0100, Jan Beulich wrote:
> On 15.02.2022 14:13, Julien Grall wrote:
> > On 15/02/2022 09:39, Roger Pau Monne wrote:
> >> There's no need to subtract _QR_BIAS from the lock value for storing
> >> in the local cnts variable in the read lock slow path: the users of
> >> the value in cnts only care about the writer-related bits and use a
> >> mask to get the value.
> >>
> >> Note that further setting of cnts in rspin_until_writer_unlock already
> >> do not subtract _QR_BIAS.
> > 
> > The rwlock is a copy of the Linux implementation. So I looked at the 
> > history to find out why _QR_BIAS was substracted.
> > 
> > It looks like this was done to get better assembly on x86:
> > 
> > commit f9852b74bec0117b888da39d070c323ea1cb7f4c
> > Author: Peter Zijlstra <peterz@infradead.org>
> > Date:   Mon Apr 18 01:27:03 2016 +0200
> > 
> >      locking/atomic, arch/qrwlock: Employ atomic_fetch_add_acquire()
> > 
> >      The only reason for the current code is to make GCC emit only the
> >      "LOCK XADD" instruction on x86 (and not do a pointless extra ADD on
> >      the result), do so nicer.
> > 
> >      Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >      Acked-by: Waiman Long <waiman.long@hpe.com>
> >      Cc: Andrew Morton <akpm@linux-foundation.org>
> >      Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >      Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >      Cc: Peter Zijlstra <peterz@infradead.org>
> >      Cc: Thomas Gleixner <tglx@linutronix.de>
> >      Cc: linux-arch@vger.kernel.org
> >      Cc: linux-kernel@vger.kernel.org
> >      Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > 
> > diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
> > index fec082338668..19248ddf37ce 100644
> > --- a/kernel/locking/qrwlock.c
> > +++ b/kernel/locking/qrwlock.c
> > @@ -93,7 +93,7 @@ void queued_read_lock_slowpath(struct qrwlock *lock, 
> > u32 cnts)
> >           * that accesses can't leak upwards out of our subsequent critical
> >           * section in the case that the lock is currently held for write.
> >           */
> > -       cnts = atomic_add_return_acquire(_QR_BIAS, &lock->cnts) - _QR_BIAS;
> > +       cnts = atomic_fetch_add_acquire(_QR_BIAS, &lock->cnts);
> >          rspin_until_writer_unlock(lock, cnts);
> > 
> >          /*
> > 
> > This is a slowpath, so probably not a concern. But I thought I would 
> > double check whether the x86 folks are still happy to proceed with that 
> > in mind.
> 
> Hmm, that's an interesting observation. Roger - did you inspect the
> generated code? At the very least the description may want amending.

It seems to always generate the same code for me when using gcc 8.3,
I even tried using arch_fetch_and_add directly, it always results
in:

ffff82d04022d983:       f0 0f c1 03             lock xadd %eax,(%rbx)
ffff82d04022d987:       25 00 30 00 00          and    $0x3000,%eax

Similarly clang 13.0.0 seem to always generate:

ffff82d0402085de:       f0 0f c1 03             lock xadd %eax,(%rbx)
ffff82d0402085e2:       89 c1                   mov    %eax,%ecx
ffff82d0402085e4:       81 e1 00 30 00 00       and    $0x3000,%ecx

Maybe I'm missing something, but I don't see a difference in the
generated code.

I could add to the commit message:

"Originally _QR_BIAS was subtracted from the result of
atomic_add_return_acquire in order to prevent GCC from emitting an
unneeded ADD instruction. This being in the lock slow path such
optimizations don't seem likely to make any relevant performance
difference. Also modern GCC and CLANG versions will already avoid
emitting the ADD instruction."

Thanks, Roger.

