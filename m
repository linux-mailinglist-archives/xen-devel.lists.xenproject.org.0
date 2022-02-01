Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFA4A6190
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263671.456503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJf-0002K4-Eh; Tue, 01 Feb 2022 16:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263671.456503; Tue, 01 Feb 2022 16:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwJf-0002Hj-8d; Tue, 01 Feb 2022 16:47:39 +0000
Received: by outflank-mailman (input) for mailman id 263671;
 Tue, 01 Feb 2022 16:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEwJd-0001jp-IN
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:47:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7aa6c46-837e-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:47:36 +0100 (CET)
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
X-Inumbo-ID: a7aa6c46-837e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643734055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Ndn4INHz/j60oQaRgENB/5AM+vR9HliHOz/hdLMStQ4=;
  b=KZQUOFTTP/1XhdDnAv4QuuzJB80UU1uuajjkhwAAcxyJvEk65J+/DOGJ
   8/XM+Dtq5sOovdrnBwLmBhUcwUno2hQF5NLsz77ZhmvSe0U/3qoAUxELR
   k95YQ5lBWBvKcU6qyLRsYrgq+tW3jmSK/TvEGcQUPbJS3XBnZtJRzd9nH
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /5cyDcjvk/BU1jS0MzZfgzwQPVeZa6+rXcThtrut3f3lM+ojCXJEUwOKUTfv4gyCZ74TwB6GS1
 lvJkItYeVTYR0cyhC/qBK1B68gA6Vy0jHoyn9TcfQaMhL4LkGuTMHEW2zcs+9s2GgpI3pSRNLj
 SQYtLdRrwsFuiVY8swrkiBru6e3M2uSyiws8yVaMonr/NrqNPWMu+rt2Z2X0lfB5EO1L/wq7oK
 CN+mkkF3FbINfLZkYyrqIpjaldJYMYJ+/92nlZvE0RDrZGL05klYQHSpTcqHaujDeDzoonsatb
 FlooQjbpx+go3uRFfDZD5L3x
X-SBRS: 5.2
X-MesageID: 62702189
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sxnmYahnUh0qQGnEz9ifqXMAX161hhcKZh0ujC45NGQN5FlHY01je
 htvCG7XM6qLM2WgKI12bIrl/EoO6pTdxt9nS1FtqXpkFn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1u7pqIdzsrfZfhhe0cURlXDih5EIhZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3J8WR6+ON
 qL1bxI0SBjQeUdREG0TBagbstuLmnejKztx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalj1HXeJuL+950iyQw6vW4wmED28payEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdTNi2+AswGzARN8wGCxFAPpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2wuex85bJdYKFcFh
 XM/XysLvve/21PxNcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dgFXdCVrWMyt9qS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:S1hepKMgQnbcb8BcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoX5PwPk80lKQFnbX5WI3CYOCIghrQEGgP1/qG/9SkIVyFygc/79
 YRT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY+Ns2p00dPD2CAJsQiTuRZDzrdnGfE2J9dOQE/d
 enl4B6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1sjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdm11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixttqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWzHAbgcYa
 pT5fznlbRrmQvwVQGdgoAv+q3iYp0LJGbHfqBY0fbllwS/nxhCvj0lLYIk7zA9HakGOut5Dt
 L/Q9NVfYF1P7wrhJ1GdZI8qLOMexfwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="62702189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs+L6wDrAU8jRN9wpbAsyg6gCLa5W4hsQPIRVmxr62jqPLA1mwL3jXZC06zqcBbTGHp7LwDtXQ1vQZN7zwrcfkZXU2FroDA6R5qkwuFTDo3ZDj7cgzARaLMmMVfodPo2W6wty9nqC55JcZV81KxB3of+Afsi5MPBLIb/hF/oPSx29u7M80AkkEeM1xOwmd+nbkcFwEpiAULNT0yFeVQBEg62Gel08HRQnRRNMycd4dBOIHDVuqqOPmEEfky++nA2HYae8zD8LvO8vR1m02nXD9gVOiJZVev0wIhAM5iMwPFKuJBAusvVwUwgcR/AX9X2vDNk35KdZnkPaFMQP71r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC4rmfq1r30JXFzxESWwLWKQBwXbmOrlpdWDDTn7Q+8=;
 b=KBAp61nLAzgw1Za5y9rXW0hAwBQgoNDEMUn1Y5kh89d0cbLXVRuYftl8EBJyHGBAN7Nk4+DEpv0a2fdhjJvqJtk03Q/Yieu1TSBYQWwM+3N+MOBnxa3u4YwCrl8xlrbQLjG6IKSPsxblFuhf5a/FV034irgfA6jdeKJAVfbFZDdWpGnBDIp2kyGfui7jx/E8QI0NGsG6IlLM6H+6GL20qs7Tn/Zl+REIHvQbPgmTa/K9L0ftUhRxb5ZTiLPw50jEk+qVvRNYYzdy4e7Pw0292pj8QJZqplBdIGiAOQ4pCSpT2LD+1S3BkAxipza8YXdtySQZCIwf82KFCvwjqtAmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC4rmfq1r30JXFzxESWwLWKQBwXbmOrlpdWDDTn7Q+8=;
 b=Qvdb8ZJgeF7Vcq18zm+JxnbaRY0k24uifZtM9fP9SKRgiDdDpXwZ5f0EbyB5mAnnDl/vBEEZg2bspKQF6vrSKQFOTJDuZBRoSpCFVQtUrCwgXW1F+6Lc9HllkhvzyeL8ov5a0dsNE+qJnV0X1eQflXB84M3LUT/QhYc0kFJy8Es=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Tue,  1 Feb 2022 17:46:51 +0100
Message-ID: <20220201164651.6369-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201164651.6369-1-roger.pau@citrix.com>
References: <20220201164651.6369-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff70a3a-04bb-48fc-3225-08d9e5a28975
X-MS-TrafficTypeDiagnostic: SN6PR03MB3565:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB356523C903B9693AE749902F8F269@SN6PR03MB3565.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDUjierzUPpuH0nriDbC8i6BpNMS/Rmhzcv9ljNiQXJuJppk4ehTbeONVCXbip3y2T/lrsKJbBIadufywKwglFb9AoHCdzn0SjTEo8tJEZvN3kHGf1ocOrKY7OATngtLYnkWnsUfHd2Nk9fzhDlaDU5hxBZ7y0L3OVSD3SX3nKJ3JljWjTA2OfToa00aeR/LL/ul1pQkbLa00XQM7OwXsOWoJE2a0TXMSKHqKCCeseNJJQK3xP1Sa5im0AkkwO3/dqYomWEh/mnV9yFoq9ZZrj4e4fHllo4lQcBG5rfQJzMMK+3pwz/L/mnL0FScNIchF7q/6Tc3FVUns8K+l4M3q5Z7hhEKvqxBWnPo4qxWZ/O224OfVVBaFeOEnaK5MmPrN8SjTYQq0fgqwNiiTeSlNi3DCIcA2a4lmMuieOKDiGp8FtHJ3UuiPM6afPrb0t21ScvFECZcFGV7PKZRuQiQ5J5lIgWX+cEE46xfWoBkts4VEMTPek1YnYi88vNzRbmNzddVmohtUUKXVwGdb2GfFkA6aP2dXwUB5utxIvRY49Uw7ESo5q7kY8D0BYkQ7QoLCTgtNzfQtCn+dE1K0Xbb9P3XL08GQ/hloEZ3dgNzKFyCNOPDWXRt+VY3Fi38NfpYq3Wm1oDGLckFmeOHoH8dveT4wN5ywbn6XUkX2yxNLjxIOWOc5HW3VCDDP83MiEC2KSGOkOLXCAhft7LL/VIYgm5liTxr5kzdlSOa+/nH1Sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(66476007)(66946007)(8936002)(4326008)(8676002)(508600001)(5660300002)(66556008)(6486002)(966005)(38100700002)(83380400001)(6506007)(36756003)(6916009)(82960400001)(6512007)(26005)(86362001)(1076003)(186003)(2616005)(2906002)(54906003)(316002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qi9FcjFKUFZmZWNodmRHNEExb3ZMeDl6V0FkUjZGNmF2MnNnZEFjSENkUFVn?=
 =?utf-8?B?N2hHbzRTeEZ4S3J1bmFOUXRXSkRWdU5DLzU4bGZMMjZWaVU5KzdMMEZyMGhs?=
 =?utf-8?B?S2JnWmJzOVlnRVdjYllWNDlmSmoyOC9vOE9UeENJRGc3TnFMQVhyRzI2OHVv?=
 =?utf-8?B?aTVBYkJYN0U2QVNtK3ZFT3pRKzR3SlNEaXJwdW5XWE1xWThnYTQxRS9JUk9N?=
 =?utf-8?B?cGd2K3hDaWxKVWFIUk5jZkJsdkJ0ZXhYWENzTXk3bUQ4bWJqMllhNUZVVGFo?=
 =?utf-8?B?SzZkbHpPajV5eEFNQ3lPMmFxZUo2aHE3U1pSbTBIVW8xbUpveHlvdXB3V2Rl?=
 =?utf-8?B?WkQyUUZaRkg0Z1pYa1drVUo2UVlwK0xVWUVNWmFqUmREZmkvdlNXTWhBUkpH?=
 =?utf-8?B?S1RldnltM0VFeER2aXBNZzRFUFBlcWZpRHBIN0pYNUY4dk02WGZVN29TbnFQ?=
 =?utf-8?B?T2xhUTJNY2gwMnNtWkttRWZjdHFTc2ZnaGRsTVVHbGcyRHNjVUFLWVJhR3NW?=
 =?utf-8?B?amR4MWFjN2hCUDFRYVBzWkxqNC8weTRvM0lDeGUxbHQxbEZmM25ZMXpIL2J0?=
 =?utf-8?B?RURiSUJmVVQvNE54cXlaR0tpaWt5dTQxV2VWb01LSXVCYmlVK2ZkUW9tVVdm?=
 =?utf-8?B?RHl5Mm9ncmVRWVFnT05nWlMvM1QzOHVUUmdvbXlPcExKcnpnbzhIRS9TdjBj?=
 =?utf-8?B?bFdmWXl6SlR3WnE2NHJnZ0Q3bnJFMDg2blZsK0d6bHVKUEJFZFR6NVRUbjdz?=
 =?utf-8?B?L2F2OVFYY0F2RU9Ocm5kRHFPUEIyUDVFa2w3YWx3QUpjY3RYcm0ycjlhR3dK?=
 =?utf-8?B?SWpVMlpIRWx5c1ZuSUlreU9CM2pDZ00xWERIanNhNk1wWk5lOStBekRJY3hZ?=
 =?utf-8?B?Z1kzODlLYzlGaFVETTBVT0RZaThuYUJiSFI0Ung2RkFKU04yaEhqNkM5M2tZ?=
 =?utf-8?B?YTFxVnZyZzN5QkJVS2svK0lsdlVFQVFSWjdRRFA1R3Z6Ni96YmNqZE9NMTBP?=
 =?utf-8?B?ZTdLKytJVkVyZGoyZEFUcmluK1hremJLWlhaSWdOS1BPVzlUVkpWdGxTbEZ5?=
 =?utf-8?B?MlVxSjB3dzh6cmVueC9rb0lueXlqM21mOWdsbE5zVkJsOUVHc2h5OGMwc3lB?=
 =?utf-8?B?ZmdOSXBkbnVQWXJmL1ZaMTNVVGRhNmkwb0wwU1ZmOUkxRE44TWhScHVraGtX?=
 =?utf-8?B?dkdnVGY0UWJYM3d3RDhyM3Y1TjBYREl5czl4QlJNUjNsNzdwQTZoVk1heERw?=
 =?utf-8?B?T1FQRXUzTmEyekdxK0p4dENITWxQSXZUODNuMFZOOVRmdlJPSytnT1RScGJV?=
 =?utf-8?B?dFBWMWU3KzdHb01TOHViOFRuSHhvaXZNNloxeXJpQU9SZTB5amlPOTlkVXE3?=
 =?utf-8?B?Z3JwWHF0TExqQVlIZTh5RUdLWFArUDNpRitLcGJ4eWN2UG9tQTFlRjhKa1gw?=
 =?utf-8?B?OHV1TU9hSmgxd2tDN1h1ank3OC9OTGM2cFRTa2lNc3BsZ2UvWFRVZFN0Ylhv?=
 =?utf-8?B?VFV0S1Znd3dOS1VFd1o3NUtKNDZEb0dSeDllMFZhYjEzZVRKZkpkbElCM2ZS?=
 =?utf-8?B?THN4UHE5cm9kZGJwUW0rNmhFZzFvb2hxZjdhV29UalRycGpDVmFSWStPcnlC?=
 =?utf-8?B?SlQxejN4STBvRDFYcDlyVnFSZFN2TFJYditObjBiT1EybE5tclk0cStqUkxs?=
 =?utf-8?B?WndZMUVkUUhUelNGQ1dqM294eis0SGpuTk9vR1JMNXRZeTAvUWZOZjFmaHlK?=
 =?utf-8?B?TWE4NWcvY3dTMjZnVmhkNGl2cjdwZHY2Y004Y05tTEdXVDMwMnB4Y0Zac0Jl?=
 =?utf-8?B?MXFtUTg1T0tPc3NXbzJsNDBFcXlSOWk5L1BTUTVtRmtkMS9sRUZQSjZvQVBv?=
 =?utf-8?B?TFYrM2NCUWo5UURuaWczbUhrY1J1Mis4bkdzUmZDdHNLMXV5U1lNL09sR0NS?=
 =?utf-8?B?VkdJYWk2Z005MVJmOFRxZHNyTUNwNGl1cXVpQ1dONDVpWVJ4QVhvZ3pBd3Rh?=
 =?utf-8?B?bCtZUGhaMjIxTlRIWHJBN3RKNjB0WThjS1N5WlY5UGtzVnRuSUtUbGx6WFRO?=
 =?utf-8?B?Qlc1UkhrdnRiN3l3aGNrS0lxMHRTMXQ2aHQ3ZDVwWU5SbmVkRlUxUTc2bWdx?=
 =?utf-8?B?K1ZXQXRJSnlDSGthekc5bTNZQXFsM2ZCaEhxNFlkSXZQd2V2ZWs0VXlaekFE?=
 =?utf-8?Q?BnQZypxS7ExLSKOSqbZOfmE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff70a3a-04bb-48fc-3225-08d9e5a28975
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:47:30.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBFq+biCchyuE2/+AQ9Mn0kx0Wem6f2jlZNgFh64FYYxJEJ5KjiPOIK7FpycTTP/BJJp8DmS76xEdP191Vfo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3565
X-OriginatorOrg: citrix.com

Expose VIRT_SPEC_CTRL to guests if the hardware supports setting SSBD
in the LS_CFG MSR. Different AMD CPU families use different bits in
LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD allows for an unified way of
setting SSBD on AMD hardware that's compatible migration wise,
regardless of what underlying mechanism is used to set SSBD.

Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
shared between threads on the same core, so there's extra logic in
order to synchronize the value and have SSBD set as long as one of the
threads in the core requires it to be set. Such logic also requires
extra storage for each thread state, which is allocated at
initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL in the hardware when supported.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c                 | 113 +++++++++++++++++++++----
 xen/arch/x86/hvm/svm/svm.c             |  14 ++-
 xen/arch/x86/include/asm/amd.h         |   3 +
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/spec_ctrl.c               |   4 +-
 5 files changed, 115 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index c3fcc0e558..7318623874 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -685,24 +685,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
-	struct cpu_info *info = get_cpu_info();
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		goto out;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -716,26 +702,117 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	struct cpu_info *info = get_cpu_info();
+
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		goto out;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		return;
+	}
+
+	if (!smp_processor_id())
+		setup_force_cpu_cap(X86_FEATURE_LEGACY_SSBD);
 
  out:
 	info->last_spec_ctrl = info->xen_spec_ctrl = opt_ssbd ? SPEC_CTRL_SSBD
 							      : 0;
 }
 
+static struct ssbd_core {
+    spinlock_t lock;
+    unsigned int count;
+} *ssbd_core;
+static unsigned int __read_mostly ssbd_max_cores;
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings == 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	/* Max is two sockets for Fam17h hardware. */
+	ssbd_core = xzalloc_array(struct ssbd_core, ssbd_max_cores * 2);
+	if (!ssbd_core)
+		return false;
+
+	for (i = 0; i < ssbd_max_cores * 2; i++) {
+		spin_lock_init(&ssbd_core[i].lock);
+		/* Record the current state. */
+		ssbd_core[i].count = opt_ssbd ?
+				     boot_cpu_data.x86_num_siblings : 0;
+	}
+
+	return true;
+}
+
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_core *core;
+	unsigned long flags;
+
+	if (c->x86 != 0x17 || c->x86_num_siblings == 1) {
+		set_legacy_ssbd(c, enable);
+		return;
+	}
+
+	ASSERT(c->phys_proc_id < 2);
+	ASSERT(c->cpu_core_id < ssbd_max_cores);
+	core = &ssbd_core[c->phys_proc_id * ssbd_max_cores + c->cpu_core_id];
+	spin_lock_irqsave(&core->lock, flags);
+	core->count += enable ? 1 : -1;
+	ASSERT(core->count <= c->x86_num_siblings);
+	if ((enable  && core->count == 1) ||
+	    (!enable && core->count == 0))
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&core->lock, flags);
+}
+
 void __init detect_zen2_null_seg_behaviour(void)
 {
 	uint64_t base;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 56c7b30b32..10a5a77ad7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3134,6 +3134,15 @@ void vmexit_virt_spec_ctrl(void)
             wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
         curr->arch.msrs->spec_ctrl.raw = lo;
         info->last_spec_ctrl = val;
+
+        return;
+    }
+
+    ASSERT(boot_cpu_has(X86_FEATURE_LEGACY_SSBD));
+    if ( val != info->last_spec_ctrl )
+    {
+        amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
+        info->last_spec_ctrl = val;
     }
 }
 
@@ -3147,7 +3156,10 @@ void vmentry_virt_spec_ctrl(void)
     ASSERT(!boot_cpu_has(X86_FEATURE_SC_MSR_HVM));
     if ( val != info->last_spec_ctrl )
     {
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        if ( boot_cpu_has(X86_FEATURE_LEGACY_SSBD) )
+            amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
+        else
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
         info->last_spec_ctrl = val;
     }
 
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..823e2f3bd2 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,7 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index a2c37bfdd4..f12d423fe9 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(27)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
+XEN_CPUFEATURE(LEGACY_SSBD,       X86_SYNTH(28)) /* LS_CFG available for SSBD */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 2c46e1485f..c7f8ec29f4 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1056,7 +1057,8 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
-    if ( opt_msr_sc_hvm && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && (cpu_has_virt_ssbd ||
+         (boot_cpu_has(X86_FEATURE_LEGACY_SSBD) && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.34.1


