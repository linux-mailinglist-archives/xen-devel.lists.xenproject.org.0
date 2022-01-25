Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5A49B395
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 13:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260315.449567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKmB-0006qm-VQ; Tue, 25 Jan 2022 12:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260315.449567; Tue, 25 Jan 2022 12:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKmB-0006ow-S8; Tue, 25 Jan 2022 12:18:19 +0000
Received: by outflank-mailman (input) for mailman id 260315;
 Tue, 25 Jan 2022 12:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCKmA-0006oq-UH
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 12:18:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ded986a1-7dd8-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 13:18:17 +0100 (CET)
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
X-Inumbo-ID: ded986a1-7dd8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643113097;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HdI7z30muaeiAmYg2kHzH8oBkDFQ7qkIHV7q0W2Uw+4=;
  b=bQ7Ym59tpXNyNsHgaq3Ib6zD4pHi6lBBPpFCA3HyA1AAXuAtR26HintR
   wQDypXGcD9kroiuioiYn1N37AQobMuSx5UVS5Ys27C/p6QJgwhylu2uuA
   PV98lZ8XU7WentBWyJUjUQ1N2Iag1F3aQ/pT4b5MIlzWfLQkws3H6Wgfk
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iuPwnD2995nRHruME0Ng/oHSVYtpweT22F+TXNsJ9IPTqkmm7Ocv2bwLi6nZRinOXJfexrcH5t
 vJE6xK0g1kJacehhbSY69VXDsPdrBG5TSCVpHkRDuj7Vb9Pp8omPk0e9KO8WfQL5pxuYdzE3p8
 itxZtYKAo8psof9H9QSmPm8OrXbhlZR4KvnpF9CdEJpgGWFx+gdzrVGv2JkCrSDyfgOhz27RGm
 JYIIixUIXYrNSHuqG3qkmWO7MqyugfcV7gjXMydgjt07fcbC0fq092j2Hai+LKsjSFu0/IEnKS
 obmZzpQ6G1bXmq7pwlS5oLPf
X-SBRS: 5.2
X-MesageID: 64865361
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6KANNK39C71jLKbfhPbD5Sp2kn2cJEfYwER7XKvMYLTBsI5bp2BTm
 2pOCj/Ta/yLMzCgeNp+PY6/8UsBu5HcnIAwGwE/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhrvBDm
 ZYVn5KKRih3L5Dqw9lAaBhEHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MIgmpr2Jkm8fD2X
 Pg6MGpEfij5XiJoYQcRMsoevsCIvyyqG9FfgA3M/vdmi4TJ9yRh3b6oPNfLd9iiQcROgl3et
 m/A537+ABwRKJqY0zXt2m2orv/Cm2X8Qo16PLS9/a80qEaJzWJVDhAKPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l+4rmskXBLGY+QREfeeEA7/Jrfj022
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddO51rXHb5
 RDofvRyCshUUflhcwTWGI0w8EmBvartDdEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZ5YKGC2P
 h6C4Wu9AaO/2lPwMcebhKrqU6wXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaOi0QtEauTib0H/qMhLRbz8BSJlVcmeRg0+XrPrHzeK70l4W6aOmutwItI890mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq672hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:WoUwH6sRXCI5jwp92+CRYZkZ7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64865361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6umcfKs/OKUNdSCSOZOK8CNmSkjBRNB7Z0ANzaSgORUzifAFmns+KD6Q4RuZd5ObS/bakMfyoN5lPW2CIjv7kLY8NByeVZ0/vBuOHs2XkMaB3HbTzVvlR+ICoyfG+cWhALeoMeEWIgdH2wMIsQAPuSGK0Ghk/i7HlqOESgQFdsdrXJwGMHyZA+ACUVDo8ZfeQaggM3RE8OIdzBmfZZOubZ1w0erFn/mPyrb3AoGhfWk09k/U0ixxtrj3QdCK1FhiJZ9LusGEap06gF5wLg/hb7kJE4Di81u7imYKL0Y+ztO7/iNXEtcnE0Ut7zY703U99Ulmf8uFPNacFpX3y6bHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYjWYPJD0TX4y4MGuU7nGi/QSPUmjBiEsakUN84Nt94=;
 b=bX2sSwSylQ4Qf4CXvzJa6MNnZJ4cypYgseq0OSebb3GebLLTre/rDgdGfCXjB0SX9sqAAlz8yX0Z4/sT5MzOqA/BnuvLX3BMo0xn7W8OSzTVBVPVBoFbmAkLxWs5D862VqYuE4mO4xDvhBskL0VABDkfqdHsyvFw4mIUNgUqkH5s4PFAi3v0C6QuAE930JairpaWa/BC3rIgTs4ewVhfOIgG6yDfv762NQMhRZVN82AAbPc1+pzjLD1dug6qwmb/S6nHQNff7fFMQepEww/54GxZOxrJ3IMiYQT0mTBzDx+1WuT4QGWts2tHAstm4kZxT4ZKMHOoySEDQqQA+D/bMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYjWYPJD0TX4y4MGuU7nGi/QSPUmjBiEsakUN84Nt94=;
 b=L2ejq+CkCDmEye4cIkweH141auKGSt4dyemcNM4YKJPeLSQikTVduuNDLsQeGouSTcsK0soMebh0bjFzqD1CMf94RXD5paf+7iMIVzZGT+KLYDaq6zW4ynUqkZaE6H1o035dGl2pnyQohwfe0zS3sIfmtAe2KnPxfy60WlQ3qMs=
Date: Tue, 25 Jan 2022 13:18:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/time: minor adjustments to init_pit()
Message-ID: <Ye/qfGRHjfDxNudz@Air-de-Roger>
References: <08b293b3-e04a-9230-e7ec-dd7da9d198b1@suse.com>
 <5a8228df-b3f9-609e-e7fb-d0f8a5ed5413@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8228df-b3f9-609e-e7fb-d0f8a5ed5413@srcf.net>
X-ClientProxiedBy: MR1P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 664a9c21-e89e-4384-cdba-08d9dffcbf6c
X-MS-TrafficTypeDiagnostic: BN7PR03MB3505:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB35055723F04480F698EB788A8F5F9@BN7PR03MB3505.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmaJqoAhTKXDpng1xnUxrjyKOmF9JrGVFWNRRC2tw0svi4kAtGpCXcG/ns6Cye3LODrjVlk4ukj7JjV1klsKm65xuTZPG451BYoBGbpmY4ZYKHNxbgS0c3JnAdEevDqZTc5DkjiZP9ka8kBoeS32JW9HGHTkCu6llLna5mlBDFioDFJ5L6cFNLaX0KCnkgUlXaFgDmJhIVF9eFk1OLZSRfKicPebhQyFmzZ5x8oLM3P/bkXcUZBXtb+nW+iadYGP3Xe1hw66prEx4UjWSkcWixZ/rZesJavyDGHvoaIRNpTGJCxLAE5t1WVsKq0J1D3secgu2DFnKuUCxAPJxCCeILPhNjUpSq4qiUbNAjDf6iZdhVsVodxCFsJwa6cgCRV6O/UTNAC32gzJzFlXwdW1X0WC1AGFMNy3SmvV7pWcpwkl96KjGoIU25o6ld7bVV/tQ/h53raTFSbtAaDbjQPMgZGz0XPJpzXw9nVp8qk/0yKyNorZZMQe4TFC04ZKy1t/cdgUMXswlnbC4Fp1uDF5rXmObT1mHXfapNBXNJZUJxc3SQQRryCD4SdU6SI7DtwH4sDGeVeNIK8SJlDMwC+huUeI6A/5Iz9jOgZC/gkvUnmWpGPuONRcJM7x9P0KAl07e+V8xojPJJg6XHJuD9yFog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(54906003)(4326008)(316002)(6486002)(86362001)(53546011)(6512007)(9686003)(6506007)(26005)(5660300002)(186003)(6916009)(508600001)(6666004)(2906002)(66476007)(66556008)(66946007)(33716001)(8676002)(8936002)(82960400001)(83380400001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlZNzF6SDFFWDhSckt0M09oMS9jN2FLQkEyYjMvWkdUUFVvMzhaUjRnMERR?=
 =?utf-8?B?S09KU0kyU1BRTDdjaWlNMnZaNFJhOE5jMXpuazJFdmhkL2xpOWlDR3FLeTd2?=
 =?utf-8?B?aFlPeno4bEpTeUszY1hrNXJpL1NkSXFlaW96cUh2bDdPaExmV0lKOSt1Z1pu?=
 =?utf-8?B?T2o4VEtCeGpIWmNBSmd2d1l5ME9GaDF6TEppQm9mVkQ2NWtjRVJJYkVTZVNJ?=
 =?utf-8?B?ZlRLYnNkRTU2cnYza3l0SGsxLzdvSWNkOUZpNjRicWNwYjhhQTFmbzM0T1Yz?=
 =?utf-8?B?dnAyb0dEOGhGQ1JMc2MvRDREOHN4dkkrMjhqT1lwdUw4azZtUVB6TlIrUDlh?=
 =?utf-8?B?Z1N1Y1M0REcvNzMydklQdzVKZTZqS04wYlRNWmVTRWdqQTUyT1dpNHYreXd2?=
 =?utf-8?B?SlE1NlAveTFXeWxMSy9NY3BZazdjYjhZTnhjYmx1YkV3Vm1Ic25VV1ZDYVdo?=
 =?utf-8?B?Q3R3Tlg0WVJheisvUCtKSm5HaFhmUkF3cm5mdHgvZnVqQmRsNzZ2ZTF2UHV2?=
 =?utf-8?B?VEkyM1pEL3d6SjZhREE5WDVXTFlzcmZoVUlLcFdub0hpa3J4NGNzcmJiRU5j?=
 =?utf-8?B?SkwzeGt4UlI2WUFpNUxlT04yNGpxNUowTTNIU0pKeWtjT25mb0JTRDZGNHBB?=
 =?utf-8?B?ZjU1TStDcWN5cHdTb1F0bFhQSEhGRytZMXB3Q1d1UVdkc3pvV1FOLzRwZjZD?=
 =?utf-8?B?cnZmbE1SY0tQRU1DVkhoVWVaREVEd0VnWWR0K25Zay9OM3p3NkJScXpoUkRI?=
 =?utf-8?B?UmRtK1ByTmxZb1JpVzBqdVF4bENIVFliSlNRbkJJWEFoNXloeEhpU2JlR2JW?=
 =?utf-8?B?TDRHRFVhTkZXQUora2pHUFRqa3J3dFF1Q3BOS2ROUUlzbzhGRXNOeTNDdDlx?=
 =?utf-8?B?NVBzTjFZQ3M1c2M4UzZsV1NpRm5VajhNbGRKRlpGaFVrZ2VvcGsrSWZ4eTV2?=
 =?utf-8?B?SC8yb0FGcndFeVErZEtaTzN4SUttWHM1MWpHZmE5MFhzOU0zRTNTMjMxcjZa?=
 =?utf-8?B?OGFzQmdRL2g5RUIwOHRQQW1JR0w1SWJ0RUVlOG9uQjYwY1BBdHBybzZUbFpU?=
 =?utf-8?B?YzkyeDA0SU9UdFpjaHdjWjdWTWZiR3lUTUlZczZjWnpNN2IybmlyczN6aFM2?=
 =?utf-8?B?WU1leE0xelhDQVA0V1NUV3N1SkYrR3hBaUIvTjlQSDJRNHpqQ1doeXZ0enRm?=
 =?utf-8?B?dWp6WTdIYzYzbFVsMXNwMVkwWWdkRkhOV3ZMOTBTN2h6NXR2a1ppK2daamlT?=
 =?utf-8?B?aXBYTmRQVTNqU3R0R3VERjZ5RGVJWUFVYWd6M1hJczIvU0RlcTBQNk5aUmNB?=
 =?utf-8?B?Mys5MnN5L25mbUU5WWJTNXRFZGRWVXk0Wk5VdVdBU2oxMmZrWlIwN3B5TTVl?=
 =?utf-8?B?bDFSdWlYQjNMTFZDejBJWkNDa0M2VTZqcVoxaFcwUis3dTNQNkFQSG15R1Ri?=
 =?utf-8?B?QnNkWitJNHA5ZUJLTk1OcmdDYUFheXNoRjhqLzRSUzNLRUczeEVhVDV3eTRX?=
 =?utf-8?B?aWZiZHpjVnYwL2lHUGltVElZbldOa0tXN2tEKzl3Z25SMStjWlQ2OVRwMng4?=
 =?utf-8?B?N2ZpRUt2bVhGd3VaT1hSOUtXUXZTdTlKT1MvcXc1WlAxOU04RzVFSFJQbzdG?=
 =?utf-8?B?MWE5d24xeW9UamdYN0hqV2IwKzE0NFpLMmgrRXFBeUpteXJxeGtXN0ZxVWxq?=
 =?utf-8?B?ZTVSSWU5RlRTSVg5M1AranJMZ216RS9wT0M3MUlnWFdNdW56aWxyUGVOOUdv?=
 =?utf-8?B?RGpwUUxKcjM3dDdta3VXREsvTWdvNXN2OU4wR3lvOGMzUHd5VUR1M1lUZUdu?=
 =?utf-8?B?cEJibDNSOEFNRkhLSnJSVUR6bVJQTjJSUWlUS1BIUzVNODczMlR4cm56WXZS?=
 =?utf-8?B?YjhneGYwT215dE5NRUlaSTFnZEFxdnU0Y2xzb0lwMitHK3dVTVV2OVN5RkJF?=
 =?utf-8?B?aTd6d2pMSUpMVFdpYmpmdTdzQWRBZGVuN21pMTFVdDdxUXJ2d3MrU09ZclRo?=
 =?utf-8?B?b3RuUDNZMjlXKysreHpEZGZwTDF3Sy9kVHpoT2JZdXlpaGNiWXdtZFJjM3Rz?=
 =?utf-8?B?TWhmM0d0Njg4bWZaTDIrN2t5R1RkdGFWaWUraWRpbHZROFArV01xQXAzYmg4?=
 =?utf-8?B?M29YMGtUcFZvTGwwSnR3azY3OXJITWlxbUl2RkZxZTdaaGZoTm9QYkF0RDBE?=
 =?utf-8?Q?k1cLD4tj8VRxXIKjKey2+3o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 664a9c21-e89e-4384-cdba-08d9dffcbf6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 12:18:08.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JJXqXZhDLwj7DHW6OxIP4SNdybp20pwJJB2IjvxRWYtwWnVqaeaIMKnDrVK61XY/HJxojLLdzW2000iBu6pSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3505
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 04:17:37PM +0000, Andrew Cooper wrote:
> On 17/01/2022 10:36, Jan Beulich wrote:
> > For one, "using_pit" shouldn't be set ahead of the function's last
> > (for now: only) error path. Otherwise "clocksource=pit" on the command
> > line can lead to misbehavior when actually taking that error path.
> >
> > And then make an implicit assumption explicit: CALIBRATE_FRAC cannot,
> > for example, simply be changed to 10. The way init_pit() works, the
> > upper bound on the calibration period is about 54ms.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > ---
> > Really I've noticed this while considering what would happen if someone
> > specified  "clocksource=pit" on the shim's command line. Unlike "hpet"
> > and "acpi", "pit" presently wouldn't be (explicitly) ignored. While,
> > aiui, right now the only error path would be taken (due to port 0x61
> > reads being supposed to get back 0xff), I don't think we can build on
> > that longer term: Seeing what we use port 0x61 for in traps.c, I think
> > sooner or later we will need to have some form of emulation for it. Such
> > emulation is then not unlikely to continuously report 0 in the bit in
> > question. That would leed to an infinite loop here.
> 
> If we're not already doing it, pv shim really ought to set the FADT
> hardware reduced bits.  There should be no need to depend on heuristics
> around ~0.

We have talked about setting the hardware reduced flag for PVH,
it's however tricky. For once hardware-reduced ACPI mandates the usage
of UEFI firmware, which we don't yet fully support for PVH.

And then we cannot set that flag for a PVH dom0, because we use a mix
of crafted and native ACPI tables, so we risk that setting the bit
creates incompatibilities with the native tables we expose.

Roger.

