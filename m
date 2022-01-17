Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A537E490580
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258059.443989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol0-0008SV-NC; Mon, 17 Jan 2022 09:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258059.443989; Mon, 17 Jan 2022 09:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol0-0008QW-Ig; Mon, 17 Jan 2022 09:56:58 +0000
Received: by outflank-mailman (input) for mailman id 258059;
 Mon, 17 Jan 2022 09:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OeP-0003a5-2N
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:50:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9618f1d-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:50:07 +0100 (CET)
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
X-Inumbo-ID: d9618f1d-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642413007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PpqceEVBU/IQyI58549xqPJzUhi2ZBLyq+Qisg1SH2M=;
  b=PVJIiyenJEBTbvNBem05Ul/wjwAeJyciyOe4ZDP0xG00Enqt7S9TuPh5
   lgurZ1Njxdsa6YjKva7IxjEuh+dZr2uGhS/E8snbvgmfrRUzI6D/a0OCx
   AeX0MCannkpItoNak3qwrF1s0bU4LMEssNQHBD1gJAf9Vy6ZBnzNeTvEb
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uOZwPq+4mfqmanm+MypQ7j9yVLmc2XDUEdMrSV9UX6CVOx5jHnfu2FbQD/LW/keXsobDwVSILQ
 8nImlKJQnHvq+xBDOQIKxcQa7Cyz303jaxModd1e5YcOoiMOI2TFGWUfuvHnMxDPwV9xy3sufi
 nRsK9jgccB/PX4uFQwIBB5jaGsNUxmNRem9A95mzwEELOvXOa1cgFecNHrkYO/jVJ8H+h62Bo9
 KZbYztsIe+pMRVDGAZzNBvXUqOUnvQX4Q7gfT03FFUrlPyFiZumR9ISgzUJkEL9GugI6NWXuyr
 DWPywS7njLLtRz4VxmXNUsyL
X-SBRS: 5.2
X-MesageID: 62131536
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:twtt+KBaWknUNBVW/9nkw5YqxClBgxIJ4kV8jS/XYbTApD8ghjRWm
 2QaCj2CbK2PMTGjKdh3Po/kp0gEscWEydIyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940E07wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ugi5uc5Jx
 Yx26IWeWAENGILeh98WTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+TvoYFh2lYasZmH9fRV
 8QbW2JWUi/lURFhAAgRUrgkpbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSISt9ShV2wv
 X/d8iLyBRRyHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwDCw+ozK2wvAPTUdYC9HTPoJptANTiN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmpm
 2jSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasaRGp6ZgPY1
 JThpyR4xLpUZX1qvHbcKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWWyP
 R+I6V8Nus870J6WgUlfOd/Z5yMCl/mIKDgYfqqMMoomjmZZKWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6j+b2TCPLGN8tbQvfBshkvfjsiFiEr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5cGKb7YfFs3QTFJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:HVcpza3SjzcMRgbnNzSJaAqjBSpyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFnbX5XI3SITUO3VHHEGgM1/qF/9SNIVydygcZ79
 YaT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg1QpGlRGt9dBmxCe2Gm+yNNNWx77c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoW0e2O1DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62131536"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/9Xf+zSgXUkM8p+ZdFBBNEV5J9mtJJEkvftA/BqZzRlvnFQWS7FdKcGwEIFa4ySRD+q57LbExOSOLFl4pNy4M760EGNBc6jnYwFBhiLWbgKOeBz20DtTZpl29Fb+E4yj0ctwNMNTgnk3TT/xLgpy7K1ziz2Gk07aYbZF3sv6/+Coqzy+/hA0Aq9SFo4iuVxlzOXshGytkS4wSsIYMfRZBCcUasMibpGPJg4CoR+riN7IcqcnBuQ0rqSCh/OocjdQ4C1sRfBYSwTQXRNTkiLNlX8mfvTDPQrV09/yHOaEIcsGdB3uMeeU2DsSwg/NWLE/Ad8jGTCuOP196cTSOqJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJf2xu1l9SXGnbg2Yt5yA3xSAk+yaXKaJteq7987IPQ=;
 b=FzeGBS1/XJE/zTgB6CPeSUPkLP41dZlO8MQtG+4lvuiBGjWq//RAHGpdQe5Hb6DGld+OQfbVqYyl+Zks/Rr5K+7Fck85hRP0wxf8LPUqtRgT4cBe95Z25aYM2SxiBhRPrnY/Kch2LKeBUeBju8Mc58T+JnWcyEM8FD+VgQe5JR2jZEtaODYiei4H+rU9wA/gHBmq5twfhKM1Xqf+5jnupRmFHZJbs5hKqBqIN/7EjGqeDNATBBOQwkP8s/1q8AO7bjKzI0ykx1VqrBr7h0f/OO8BPw35qbGIqgkYrLq7SppUAkm9iwq2ZOh+pBp71sJDD/6LAep5pb58kGDOcoTDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJf2xu1l9SXGnbg2Yt5yA3xSAk+yaXKaJteq7987IPQ=;
 b=bLFirHRIMPUB/BJciGJNgsmDc3e15AayBF9gNGEcOrdto+xwFoWHtAz2YZ03g6vbno+xGOkorYln8wHSeJytmTrjFjtuDcn8BrW3P0AoF/PeHZl2eC3yafC8/kTwAEYMLfgs2hRe3C+KtmyBaqBxpcq6cq6t5ja5ixjlNoPCskQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v6 12/12] x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents
Date: Mon, 17 Jan 2022 10:48:27 +0100
Message-ID: <20220117094827.16756-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ed79bf0-6099-46ef-73d0-08d9d99ebbab
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059405C864BA42C457E9ADE8F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3vYJb+ELqhaJELkGvtD15K+HiFIifcBtBR3QR7A/KxXDKG9YEnu9kuEEORbWTCHiQHu4E682Iqi+S0qui9GDrSfhalH+MjDcqHo4oXKwLVVoVu1MSZ2qKopKNH65acAw2yd3Bj+MeXWLx37dOgRvKCIhrefwjDZUCAiXrgmY2iIpxwXd4aCoMxhX33jwTzJFCGJgXNBI0wmJB3PzHzrnQLFcesaCu1kIgb4CMnCzAL7aSbO9WeZiDCyRU5nke0NhMEsf61eIkIEHtby/CdaDki87tVSB/iBXoHD4MIWX0c/k81uAa92lWoAZmYjND2wIiXjvGSDvg1ZIsyuJ99csLomCMZM9IRvf6vp52+NLBqMoFEewNOtP/YZXEmiZAtLulGZhl03XUkPyZrqGu2+uJxSVH+XOTUm1bxP08+42TA4DK/YEH2uj+yZnjJRUj5F5Am6vBzn7rS/3GPkuBkC/FnwdwM7ElvOpsmiJlhnGNkl/J7dmoQPvG4lRECxUliuft6jq/JGWs7C7r1uSi3uHE/IkuVsw/46wJPsZqNe7LtBZnErM4NiI6lfVQ3iQb2TloOTUq5I1vLHtNDkrdhgCW5dXA3cXW2WlfhilSb6M7wWO7csbqhUb907S8TN6lDnb1JV6L+/bGZOxfsGHkvk5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBvS2Vkc3ZmK1UxbWRFc0ZXeGZzTzlPcVM0QTNDdVVLcWRJZlY5akF2TmJ0?=
 =?utf-8?B?R201UFhIblRJVm55NnRpcFFhRUZwRnB6VUc1M2R0UGY3MmJLQWkrL01ZcVJB?=
 =?utf-8?B?T3M3SzMrVUFzR2hyTmJjTnkxS2tCaUEweFJBVkIvWXVuUW5CZ0ZHL3VpQ0k5?=
 =?utf-8?B?bEp4enhPcnF6SXlmWWF1cW5Bc0V1ZlpSMHErcEF0NzlFcFhuOTV2ait1WXQr?=
 =?utf-8?B?UUZQcXV5UXdGRGtHYmlyUDJCYk5PTE5BQ3VKS2N6c2FUYW5NSzRmaG45UTJ1?=
 =?utf-8?B?dHBteTI0SEtmNE5jeWdUQk1SRzYvQnRDbGY2bU91dE51N25XS0x3MnhZTDBD?=
 =?utf-8?B?Ritic1l2WG9BWjkraUJCcFNUL0U3aEp1QkZBL1FCQkRtdUo5amFxSGEzZ2Qx?=
 =?utf-8?B?QTNvSjYxSDVGcEo2UTk3M2IvVkJCbXphdFdLSmdIMktKZGh6Q0pKWlRPelpT?=
 =?utf-8?B?Y1ZhT2hxSExqSUVVZ1IxdnV1eUVpNjk3MVpLRThXK29wcHEwZkFoS0FqUXl5?=
 =?utf-8?B?aDJiRzF2elVodE9aaDljQ3JsaVJUSEpUWEdBRFdHQkcxUkY3MzV3b01OQ2xv?=
 =?utf-8?B?RnlvQUZnWUcvVU8vcTd4djI5OXVaSkdFWkVnWGFGUGhmUU5UME1qSkdLYUZj?=
 =?utf-8?B?ZnFQNVBVUGhXdGU4bldpdm4yWkFhYm8wUGR1OXMzazZpRzlmSW9abzg3NEVT?=
 =?utf-8?B?OE5udlFrK0ZQdWY5SUI3RDUrZW1tNjIwQkp4dkFOYWFKL0ljOWFoMVVwQW8z?=
 =?utf-8?B?bk9DTHpXenpVR1hra3dBKzZ6RG5NbmJxc1k0Sjg4UXVWS3dlSXpJbTBReksy?=
 =?utf-8?B?TU4rYjdKaHhuclAxQTR3WTFZTHlYWUF1a2hJeTZEZm0wK29jY1R3aHprVHJT?=
 =?utf-8?B?TmhMYVV3YlZ5bWNrRUxKZ1pKc0VXaW5aNGs2alQyZFZXaVUzYVRyNmxOZXln?=
 =?utf-8?B?cWtMZCtWbmU2OGlXb1BUU0tNL3d5VjlocFpWUmdNMG90c1FoUjBJenZQeW1I?=
 =?utf-8?B?R1hRNXZDS0U5c2N1S1dwb1dETy93UEdqa2NXN0taRnpjcEh5N0o3eWhCY1Er?=
 =?utf-8?B?OTZzNjhLakJ2Y1lhOTJFNGV6TWU1V1ZqVWpQK0tKNWFHL3VZVnFjUDVjanVw?=
 =?utf-8?B?WS80M2VXWXY4NTZtTVF5dlQwZWtsWlR3a2tvSlpuOFlZQXdJNkNJZUZvK1B4?=
 =?utf-8?B?bTdYa2VudUlMUUh4V2RTVWxUbU0vMHJwZGxZQ2o2NGErS0ZzZkJGV0E5c0dw?=
 =?utf-8?B?Z0Q1OWZZU1JVeUIrdlQ3WUVqWW9qZTRleGtYUm51bVVTNHhScjczQmNsUXhw?=
 =?utf-8?B?c1FiOVRMZnAxWXFkRS91SjNaYU1oMnlBQXc3ZmpmQjJkTmQwdHlmaWcrQXUx?=
 =?utf-8?B?Yk5Wdy9DNVNiV3A5eEVqTjMvSkRFeGVkS2s2d3c0SHo5RFh2czBZTFdNY2lo?=
 =?utf-8?B?cWxXaEMvWFpBVGYvWXgrZmdYNXZmVi9BdG9wekJDaFA4OC8xN2xKTXM2REdm?=
 =?utf-8?B?K05IYmhrWXYvTjFMTHFhNlVoaStpK1JFOUROeVVJVnQ3eWRueTBYMzQ0Mktv?=
 =?utf-8?B?WUVGc2lGbFZ1ZzJNZ0tIaHQ0eHdNamtZKzhZS0djRnpxZTJpMTd5RTByMTBH?=
 =?utf-8?B?S01jQkFVN05PSXpvNFEvWHlHK0d5S2ljY1ROYjJnT3BtWDZzTXU3ZkswQU1D?=
 =?utf-8?B?aUhxZEZtUGlpbzFzcUF6TkZvdDloWlJmVjhFN08wdEx1TWd0WkRscU1RY3Ry?=
 =?utf-8?B?bXBkcUI0K2ZvYzA4U1REMmlzVXVobStuTGRlby9ZTGgvaVBheGM2NUtXWEVQ?=
 =?utf-8?B?WWpJSkFVQUZTR0VzeXRnTm8rZ0VhVzZUaGZNTElubDR6cEtnQXppaUNWL0lX?=
 =?utf-8?B?SGx4dTlLSXFuMGZ3enZ5QWRZSnowc3krci9zTUhUUWI3cWpzZjZjWG5YTjEw?=
 =?utf-8?B?TDg4bkt1NDNvYUNJaDFDaWdLZWxQTktROTZKRHMyYlhhRHlFZTY3TlE4a2pS?=
 =?utf-8?B?WVMxOHFaTUFVSkh0eTdZUG51Y3pVVG5oNUlLVW5xaG10Yk9wV3pzWkFGMUdG?=
 =?utf-8?B?YjhDaHhHMnNXeEordEl2bEIxYVgrQzF0OTFWOVE4SFpKODZvbEc0V2ZUaW8z?=
 =?utf-8?B?eWhsTnoxZitXOFRqVGlHUVM0UGY1NVFtQUI4MGlEMHNHU3BDTU9EZXdRVzQx?=
 =?utf-8?Q?jp3ZRPKztMCEWWIS3s1G3cE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed79bf0-6099-46ef-73d0-08d9d99ebbab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:50:02.7990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dXjuMNVacLrT7PjnhCVMRvpU1fewsu+AqFamduZz9EWZMQJ3Vi2Nvv3c0MDZPyq/7Xt2kf5t3LSe3JSusjxgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

From: Jan Beulich <jbeulich@suse.com>

Zapping leaf data for out of range leaves is just one half of it: To
avoid guests (bogusly or worse) inferring information from mere leaf
presence, also shrink maximum indicators such that the respective
trailing entry is not all blank (unless of course it's the initial
subleaf of a leaf that's not the final one).

This is also in preparation of bumping the maximum basic leaf we
support, to ensure guests not getting exposed related features won't
observe a change in behavior.

Note that such shrinking is only done when creating a policy for a
domain from scratch. Migrated in domains keep their previous policy if
present untouched, and for migrated in domains not having CPUID data
the crafted Xen pre-4.13 policy is not trimmed to keep a behavior
compatible with those older Xen versions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New in this version, picked up from 540d911c2813.
 - Only shrink policies for newly created domains.
---
 tools/include/xenguest.h                 |   3 +
 tools/libs/guest/xg_cpuid_x86.c          |   5 ++
 tools/libs/light/libxl_cpuid.c           |   7 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 101 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpuid.h          |   7 ++
 xen/lib/x86/cpuid.c                      |  39 +++++++++
 6 files changed, 162 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 3462d27516..e8b0d3ff16 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -830,6 +830,9 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
                                    unsigned int nr_features);
 
+/* Sanitize a policy: can change the contents of the passed policy. */
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 8bc7bd7224..c630dd8a73 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -688,3 +688,8 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy)
+{
+    x86_cpuid_policy_shrink_max_leaves(&policy->cpuid);
+}
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 556e8f41a7..c7294680d4 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -689,6 +689,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
         goto out;
     }
 
+    /*
+     * Do not attempt any modifications if creating a policy that aims to be
+     * compatible with pre-4.13 Xen versions.
+     */
+    if (!restore)
+        xc_cpu_policy_sanitize(ctx->xch, policy);
+
     r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
     if (r) {
         LOGED(ERROR, domid, "Failed to set domain CPUID policy");
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 686d7a886c..20419a6108 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -8,10 +8,13 @@
 #include <err.h>
 
 #include <xen-tools/libs.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
 
+#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
+
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
@@ -671,6 +674,103 @@ static void test_msr_get_entry(void)
     }
 }
 
+static void test_cpuid_maximum_leaf_shrinking(void)
+{
+    static const struct test {
+        const char *name;
+        struct cpuid_policy p;
+    } tests[] = {
+        {
+            .name = "basic",
+            .p = {
+                /* Very basic information only. */
+                .basic.max_leaf = 1,
+                .basic.raw_fms = 0xc2,
+            },
+        },
+        {
+            .name = "cache",
+            .p = {
+                /* Cache subleaves present. */
+                .basic.max_leaf = 4,
+                .cache.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "feat#0",
+            .p = {
+                /* Subleaf 0 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 0,
+                .feat.fsgsbase = 1,
+            },
+        },
+        {
+            .name = "feat#1",
+            .p = {
+                /* Subleaf 1 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 1,
+                .feat.avx_vnni = 1,
+            },
+        },
+        {
+            .name = "topo",
+            .p = {
+                /* Topology subleaves present. */
+                .basic.max_leaf = 0xb,
+                .topo.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "xstate",
+            .p = {
+                /* First subleaf always valid (and then non-zero). */
+                .basic.max_leaf = 0xd,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+            },
+        },
+        {
+            .name = "extd",
+            .p = {
+                /* Commonly available information only. */
+                .extd.max_leaf = 0x80000008,
+                .extd.maxphysaddr = 0x28,
+                .extd.maxlinaddr = 0x30,
+            },
+        },
+    };
+
+    printf("Testing CPUID maximum leaf shrinking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        struct cpuid_policy *p = memdup(&t->p);
+
+        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
+
+        x86_cpuid_policy_shrink_max_leaves(p);
+
+        /* Check the the resulting max (sub)leaf values against expecations. */
+        if ( p->basic.max_leaf != t->p.basic.max_leaf )
+             fail("  Test %s basic fail - expected %#x, got %#x\n",
+                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
+
+        if ( p->extd.max_leaf != t->p.extd.max_leaf )
+             fail("  Test %s extd fail - expected %#x, got %#x\n",
+                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
+
+        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
+             fail("  Test %s feat fail - expected %#x, got %#x\n",
+                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
+
+        free(p);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -787,6 +887,7 @@ int main(int argc, char **argv)
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
     test_cpuid_get_leaf_failure();
+    test_cpuid_maximum_leaf_shrinking();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 050cd4f9d1..86cda38986 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -386,6 +386,13 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  */
 void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 
+/**
+ * Shrink max leaf/subleaf values such that the last respective valid entry
+ * isn't all blank.  While permitted by the spec, such extraneous leaves may
+ * provide undue "hints" to guests.
+ */
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
+
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 924f882fc4..6a943cd91b 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -236,6 +236,45 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
+{
+    unsigned int i;
+
+    p->basic.raw[0x4] = p->cache.raw[0];
+
+    for ( i = p->feat.max_subleaf; i; --i )
+        if ( p->feat.raw[i].a | p->feat.raw[i].b |
+             p->feat.raw[i].c | p->feat.raw[i].d )
+            break;
+    p->feat.max_subleaf = i;
+    p->basic.raw[0x7] = p->feat.raw[i];
+
+    p->basic.raw[0xb] = p->topo.raw[0];
+
+    /*
+     * Due to the way xstate gets handled in the hypervisor (see
+     * recalculate_xstate()) there is (for now at least) no need to fiddle
+     * with the xstate subleaves (IOW we assume they're already in consistent
+     * shape, for coming from either hardware or recalculate_xstate()).
+     */
+    p->basic.raw[0xd] = p->xstate.raw[0];
+
+    for ( i = p->basic.max_leaf; i; --i )
+        if ( p->basic.raw[i].a | p->basic.raw[i].b |
+             p->basic.raw[i].c | p->basic.raw[i].d )
+            break;
+    p->basic.max_leaf = i;
+
+    for ( i = p->extd.max_leaf & 0xffff; i; --i )
+        if ( p->extd.raw[i].a | p->extd.raw[i].b |
+             p->extd.raw[i].c | p->extd.raw[i].d )
+            break;
+    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
+        p->extd.max_leaf = 0x80000000 | i;
+    else
+        p->extd.max_leaf = 0;
+}
+
 const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-- 
2.34.1


