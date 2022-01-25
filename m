Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B949B6CA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260410.449862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9H-00060o-7A; Tue, 25 Jan 2022 14:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260410.449862; Tue, 25 Jan 2022 14:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9H-0005yO-1J; Tue, 25 Jan 2022 14:50:19 +0000
Received: by outflank-mailman (input) for mailman id 260410;
 Tue, 25 Jan 2022 14:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9E-00033A-TV
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19db0102-7dee-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:50:15 +0100 (CET)
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
X-Inumbo-ID: 19db0102-7dee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HZaMJj9+rL+LRyMJ6VSN4shsmzvezVh6cTf4PGv5g6Q=;
  b=RaZTwldg7QKfUu+Mh6n8MqiK7tkOTYrHhnhtWP7APZhanWq+eQ5wCrmp
   tKVpDO54NcXIiZlofz8xMkiEUxipDueBKGjfnr5HtyluOsAxYlSa2cAiS
   qRD2HYY5q4ri1vDVMBrAwicULvphxpgdpi+CgmJTGeIlTOBAJlFjWoXtu
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: am4nLQAiuN9wbvfC5mdRLVyy1KLDthCgGDrP1NMou6y7CRjZc/n9uI9zke5OXEd6AsmKtDorsm
 NxzJ0oGxSDeZKdBfQ1ijtjE3sTQeP3Nj8Z/Smr96LIh3hzWHINH+OUTiwBRNoqigsFSZwq7Nzu
 kjphCAJWQdFtgud65GuFMhl5zt8/QnF6du4EuLQTnha7SLvViScChFimg7ritZCiXF5cpUOWG4
 iU13pejTm5VtFXGrK7/TFyRh0O0Zzq1cbBErmz9WY5lW1AVpph/9v4ybb6lTm1at/NCWlAhfMQ
 OCYpCb/nAFEZUsyaa74w0O35
X-SBRS: 5.2
X-MesageID: 63124333
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SiSgRa0isif4hPcbgPbD5Td2kn2cJEfYwER7XKvMYLTBsI5bpzUPn
 2MZDGuCPq2MYGL9edolao218kIAsZGBm9IySAJspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpM1W2
 tYRub6LYx4MAPH3tNseaSJ6KnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QBhmtr3Zsm8fD2X
 No4QBtWVTT5PD5yHH0TEZUTuf6uryyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVZACfsn3YsjwnccN1LbEBxD6O8JH22lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNxr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBgpJDSsjPeZJgrBED3CBsZ6sy67CFjG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj2oyLyIt8OsWAmTKuMDiriUWW1C
 KM0kVgJjKK/wVPwNfMnC25PI5pCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WnMnCIqtZCdA5TRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WZQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:GniLfK6J9sGnWRDK7wPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbq6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsNmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZSbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczJgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenUPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesYMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO01GkeKp
 gvMCjg3ocUTbvDBEqp/FWHgebcEkjbJy32A3Tr4aeuon1rdHMQ9Tpu+CVQpAZFyHsHceg22w
 3zCNUdqFh/dL5nUUtDPpZyfSLOMB20ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="63124333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnsqdwNQVv5rqF/bdOGgfyh/NtlJk0RyJUcoIKAxfcIrO+w4G3vLeDDojBWWTPUBwIhaObmGu2A/WAFdA8G2LAvnYY88PoTs1/fQP6imfG8M6zxF+vpjr5FPFXTOu/dZIKXTa8NqScBU+v9fc8Wriwlp3zczUfa6XO8WbFHzFr6z16u4pwMMY3ER+TGr4iugWNquylLkEGM+glLWMrvNT+Yd8dR23At51kxJ3TjqmBjuux2Tty8qTAL6KC/FMZBEAGp4RWzRjkAXn0HZGvhsu5c+Tifn2jQSv6bknLJZq8oGseOHvXYc+DKfHTknwigL1LUfYtR5oilIKoQXKZQiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy2XwwkC77aRusqaEhIqZOdJcdN/UpTCfyRBjte639Y=;
 b=AhU2p8lAkS6Vi14IcsH6oXImNWHGInyx3kJx7Mw9RxyRrcB5O/sUUpmUHkm4tyqEbo47DpyE9lHnfPfKi8AmS8RHt99ADDxtnkYmbjCpam5DuC2jvpWsMMBVrx0AzoMLD6nIVtvl9MurAYW6RNg/DoWyohmxEjYaZjsxcaoL8UM6l5aFqK6LlyVUc3PVY/v7j+3IF3eu/SmqFrwhqjVbp+G/to9wXhsw9yNdW/nv5ofai1h1vzDf6zLDUp2JdA9eaY4LxZqCYXiPckWbEDgwpUIZo4Jrj60XchvS5poYdAo1sW1XP8gxAe63/SAL5FBE6fVu8+2jbwbVnJQ1UyXzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy2XwwkC77aRusqaEhIqZOdJcdN/UpTCfyRBjte639Y=;
 b=tkSz7MzIwD9UPrxlBYZGuYJbjWeO3XJ6uc7N0Aat5pPfwfoGzz5ufUiFTJI+AEga9UTis25A6ggeeXz3tShRRYl0tpahNREvU7KDNezwCpEoVOClFm/sHSpD5pM42IT4BoixIwcDjpuSfdHvs/XN0ZCGQ9mt4Azw8/kAsqdRBC0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 05/11] libs/guest: make a cpu policy compatible with older Xen versions
Date: Tue, 25 Jan 2022 15:49:29 +0100
Message-ID: <20220125144935.44394-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aeb396b-2355-4961-15e9-08d9e011fbc6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568A3D3C635936A41FF38508F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lN4SHMdV99BsMb6MTomMkTFvPZrk++3EA81qaf5OL8B664dI0Exf+Y34WMYPMQrbG3794jDcj0lLxBwtOZ9Ce1y/WBpysvSY4zbwO3E9RLjne242JPE9ZVKaWU14StgOip02GBobPKjOLYxDPnE4eWaDRFUlPypcCXMKJw9ekmrGfcg4Ky2Xmd/NBAXxh37lofhKpChzxpYADbC1qz0e1zlUEQT8jUtSDlgvDBUvUiSI+/DdEpgwx8wlcjDKZukbEluB3mySG9qyV/bQRUaPmSyJuWxrcsF+lyC7p4ojAepD+eWSNoXWIzifpNgAiDV54/ZUZFvtmb7LALJVx86U+tjVLKq92CjnN8SPK9rbTvdJ5wJvrBbDcR/ojZPWhViFeGz/P4NTK224vZBbjwX/ITkC2I84yuvQJAXt1I1sThF233kpNB7naPCn37VaKAXmJUsniExYJDyRKFgljmYekqBTXUx+PmaASWpSPTe3DtqAnZXYRNTor2sBvqR25onP5/DliJSRZplMD/jvKgx7v9AbfiIlaLiizGK3nOt/ZK8JjhPp697EgJZ0RMaqVFzg50niodRsJSOV4J1htSKuBcIz4yL/zx1F9a1wpc+vvSah1GAJ6ckY21DphBZM3Lme7vZoXDqEoL+bP4ieIW7+qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzQvS21ZWkFza1MybGtqMGd6VU5qeEltdnp6Q2lIaGM4UzUxM0pFTFN6RXdN?=
 =?utf-8?B?eDJzV0NNcmRZZFNBZGFBQUQvQkx2blpIbWZ2N24zaVJyUjVIaWp3L3hJQmx3?=
 =?utf-8?B?K1dFZ3M1dkRkU1ZpcUpOV1VrUS8yYkFlb3BYWnNWdXJTc1lGclNyNXlCQlY0?=
 =?utf-8?B?cFp1RkVUQS9rb1loclZ0TW8zSzJXdzlwdGJoYU5TejFRWmNWVTNEMnN6ZUxo?=
 =?utf-8?B?Wm5sRWEwM2dJNHlsdUxDWWNDWU5ManlPS1dCcS9IREpkOU9YODByNXh1UnlN?=
 =?utf-8?B?MVpDSWdSYnNuRG1IOW9nNjR5bGVHVHFrNCs4VHQyU1p2VnY4dG5JOTEvaXhu?=
 =?utf-8?B?cjFUdjk4d3F1aWdwMzJXRmNiMllyNVRrL2dHdzFTTDdTRUNuZzlvUGprcThS?=
 =?utf-8?B?TStxeTNPaENXWlljaEs0TEtQWXNLcTVjNzhudXcvS1NSQzlZRy9TYWlVbmJr?=
 =?utf-8?B?MUpCZytuWGVWUWxyb1RuSlk0M3hBazk4aVlORUgvZFl3YVVxYzFkY0xXYXg1?=
 =?utf-8?B?bmhodEszcTZjZnZvcS9aVVJCOGdMS0QwOUVPdDdWY1BZV3FYV3pRM0xqNE5P?=
 =?utf-8?B?ci9ZTWQrMUdXeWV6YVpXNFlFcFl1R0oyRFNjZFhrUmRJeWZOYnU1VU1Dazg1?=
 =?utf-8?B?S0pWd3pDRHJ0dlF3MlhBVG1hYS9ROFcvOFhaejZINGIzUU5ZWk9tRjRSSElC?=
 =?utf-8?B?cmVwb3RuS2duUENORlRqWHFrSWJhWnJtSGhYVDluN0xpMmdIT1hDcUhJZUFB?=
 =?utf-8?B?bWVlaDZqVDFJeU4rWkhFTXFDZTZHOUd2dDRUaXZidU9Xc1hnd2RudGc0QjlB?=
 =?utf-8?B?czlIZm92Tk9iVzYzNlZzS0d3dVhBdHZOeXVwbWJjbGtNYVB3enJKVWQwQXYy?=
 =?utf-8?B?SWZCVHZSVFVzdHVIRVRaYVZkamhMd09DQTRsOGdSSVdYS2ltdDdLTTZjNjM1?=
 =?utf-8?B?OVNEWlFzZEpVZkhGR3h4OHVGK1d1b0k5RlBINzRNT0pCd2c2aVJlUWtuSUJz?=
 =?utf-8?B?b2lyZEoxUzZydkI0SjlaTmc3ZWRQOVl0UTRIMUlCVDVhZW9yNHFnbUFZNWZj?=
 =?utf-8?B?eTloZHJZTGFJTGl3L21TbDFGc2p4a0l3U1BSY2tNOURmcXZ3NVV2elhvQzZ1?=
 =?utf-8?B?UmtGQnJISjR3MmI2S3Z6c01vN2h2VXYwRUVUV1dlVFR3Y0hHNkc2TldTK240?=
 =?utf-8?B?Q1AzYjBSR01NalJnWmYyVTBSU1R0K09yMFdJTEkxVFhkNzZtalpBVy9KWUM1?=
 =?utf-8?B?QUJmRnQreVQ5RmtqampiVUIrQkZTUkhqYitIQm9NcDEzckRHUXIxVHFNREJq?=
 =?utf-8?B?cHc0N1lIYlFwVnpFY0ZTaFgyUnhVN1FnMXhaZlRLRHh3ZlgwdVRxM05EdURI?=
 =?utf-8?B?cEM5bjJmSThUUC9tMlRFckM5bVh5clh6SE1QY215OG1IcFhqdEpDZHMyaHhU?=
 =?utf-8?B?d3dWb2lTeXAzVm9ob0k3VURPejBmeWxVWFpNTXc2RXhZOEs3UTdSeDdnYW1t?=
 =?utf-8?B?SzhCYWdKdFl5ZHZLaWdoSVp3QmVvd3cvQ0FCTkNNU0d5UFRLcGM5bmpsV216?=
 =?utf-8?B?SkljaGwxbllXVmRzT2JZRU40S1N3ajk2Z1ZnNWRkOUFOK0JDMjc5UjJzMzl0?=
 =?utf-8?B?ZTJIdldPb0JwemM1WkxoWE94V3AyUk80NFlSTTBzT2ZJQXFSS01jeGw2aktF?=
 =?utf-8?B?YlYzOTUzR1VOcVpvWkFjd2g4dTlYTzMzSWZrVEc0cTdZc0RMdU1GQkJUM3Nt?=
 =?utf-8?B?TGNKd2swTmhVWjJ6RmcyakNRZlpwKy9WUEtzUGZQaXJ5K2psSnJpUkRVaVJK?=
 =?utf-8?B?bER4NmpuUWJkQURRSnhFYnN3U0I0VmJtTTNtWllocWp4NWgxTGhoazNTUUpr?=
 =?utf-8?B?a2djVDdvN3h4K1BmeW9oNmpsdFdNUkNWUkZMaXMwYnY5K2hNem9jYTFnMUZm?=
 =?utf-8?B?ZTMwYWtDU25lSDQ3UlhreTFub0dMRGZtNExEbTNIYnpsV05rcEZva2NXUEZp?=
 =?utf-8?B?QWxMQ21hbndyYnN0NkxsNTRVaEdDUE45aTJWdjBObkxnWXFPVExIc1ByOCtV?=
 =?utf-8?B?eEcxeHhpU3YyemtBclJ5S2p2TTBLVFdOejV2K05nU3VnSEYrZDFRNHJ4alJS?=
 =?utf-8?B?eTd2cE8rN0Niais2dEU0UGJCd1pCTEZnTTVCWnlmN0ZrVlBkSVNic3RJR3g1?=
 =?utf-8?Q?0Xel355siSUw8MkoT305oWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeb396b-2355-4961-15e9-08d9e011fbc6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:09.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sh4ItDzOBeLTUCCIsJIuYCOQHeNWLrSkOJ/0lvhrQoLokMPsbF1Irse1PMVzjgkTi/fsDWR90lop1t7Cepk7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Pass the host policy to the newly created helper.

Changes since v3:
 - Rename function to xc_cpu_policy_make_compat_4_12.

Changes since v1:
 - Move comments and explicitly mention pre-4.13 Xen.
---
 tools/include/xenguest.h        |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 50 +++++++++++++++++++++------------
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2672fd043c..df18c73984 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -817,6 +817,10 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
+/* Make a policy compatible with pre-4.13 Xen versions. */
+void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                    const xc_cpu_policy_t *host, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index af5b8e47f4..20fd786da3 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -432,6 +432,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    xc_cpu_policy_t *policy = NULL;
+    xc_cpu_policy_t *host = NULL;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -454,7 +456,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     rc = -ENOMEM;
     if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
+         (p = calloc(1, sizeof(*p))) == NULL ||
+         (policy = xc_cpu_policy_init()) == NULL ||
+         (host = xc_cpu_policy_init()) == NULL )
         goto out;
 
     /* Get the host policy. */
@@ -473,6 +477,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
+    cpuid_featureset_to_policy(host_featureset, &host->cpuid);
+
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -496,23 +502,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( restore )
     {
-        /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
-         */
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
-
-        /* Clamp maximum leaves to the ones supported on 4.12. */
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
+        policy->cpuid = *p;
+        xc_cpu_policy_make_compat_4_12(xch, policy, host, di.hvm);
+        *p = policy->cpuid;
     }
 
     if ( featureset )
@@ -662,6 +654,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 out:
     free(p);
     free(leaves);
+    xc_cpu_policy_destroy(policy);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -919,3 +913,23 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                    const xc_cpu_policy_t *host, bool hvm)
+{
+    /*
+     * Account for features which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
+    policy->cpuid.feat.hle = host->cpuid.feat.hle;
+    policy->cpuid.feat.rtm = host->cpuid.feat.rtm;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+    /* Clamp maximum leaves to the ones supported on pre-4.13. */
+    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
+    policy->cpuid.feat.max_subleaf = 0;
+    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x8000001c);
+}
-- 
2.34.1


