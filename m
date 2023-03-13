Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B56B7413
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 11:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509219.784556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbfSd-0002C7-UJ; Mon, 13 Mar 2023 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509219.784556; Mon, 13 Mar 2023 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbfSd-00029H-RN; Mon, 13 Mar 2023 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 509219;
 Mon, 13 Mar 2023 10:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbfSb-00029B-Oi
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 10:31:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f442313-c189-11ed-b433-930f4c7d94ae;
 Mon, 13 Mar 2023 11:26:23 +0100 (CET)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 06:31:15 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB6083.namprd03.prod.outlook.com (2603:10b6:610:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 10:31:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 10:31:11 +0000
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
X-Inumbo-ID: 7f442313-c189-11ed-b433-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678703479;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EuT7rxQXyDraQwneNuKIuwaDnIfo5bWzPwITl1cnZcI=;
  b=Y+Suj2Cwt2pvNy5owx6Pc0w/sZI0aD0u51Aee6b5ZWqz2O5hzu1Z5vOq
   Ir2g4nrG8+VT4NmCAGGNpI2Y0EoXKYUJa6QSnEOdr/lezvG4U2cI7lKnp
   HZ5z6KfkXK3z7+LkZTyDT41FVHPw8vEAf3ZgdUZvjELd+JMn1QrGu+Y6r
   8=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 100587526
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:udp1g6yxVM9qzWIotaJ6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 2YdWGqBbq2JMWOmfNx+b4nlpklX75eGzt5qHQBq/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSJ2s
 tg6eQIVUjaKucnokJG8cNdhre12eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eXwHOkBdhMfFG+3qVb3nG3+nI+MiRIU12a/L7jo0ywed0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoBUlED6ty7/IUr1EuQEZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:5almcaFUMoVpvZmPpLqFOpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faUskd2ZJhEo7y90ca7MBfhHPJOkOss1NSZLWrbUQmTXfhfBOLZqlWOdU3DH4ZmpN
 9dmsNFebrN5DZB/KPHCT2DYq0dKZS8gdOVrNab600oYRBhaqlm4Qs8IgGHEnduTA0DIZYiDp
 KT6udOujLlIB0sH7GGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsK67Y/9m
 rulRD/+8yYwoOG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpsQqsbJQJYcz9gNhgytvP1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6xmxLY0IbEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnR76+8PDW3hR5wGJSEIZ4KMuZkFkIMIjgf5q3PoiFXpuYeA99ffBmcga+O
 oHNrCi2B8ZSyLXU5njhBgS/DWdZAVPIv64eDl5hiW06UkmoJkr9Tpp+CVYpAZ1yK4A
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100587526"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8D4loh6ynfdBO3XSZsXqartB+fpSzkMYMLtG3REFvNHkOdmrsnOIMSnxEQGyTOica3dSt73fRJDOTSulzI5gk+Z99oKbmMRD8BCeyBAamcjtp0W0TVLz85AJH+jONC/kUH8302nW8pLIusamILJHp+SFS8mzWHZN3kK+utJBk1ebWEcasuA4gmNsHHkd4H8Sqtb3cKzb2qxpTDSPxEXyK56Ib1clcay0pYP3LMjzcTjVbWj1+4HKDm7VSebUyGinPyerU6C131gzw72lMmfRbHVsziAIoyi0KnfoUHM4DGq0ktevmmub6gjDvPnaWJ49T+2IGl2hYFJ4h0/mVh1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rees6DWdA8nFVTTPiYYPjXr+j28HZzV7HqVLweidxg=;
 b=S7wF+/T9UuN4AmCXaHMynTsgCPl1HeMXpHqteNrH04vxCTjH31y0D5PBqE2fiWE0M8gnsNW5qSxzrR39pL/7dQVQg9hntYjKv642/hRziazh4FD3b/O2E2zsp16mt2sb9m4lcUdrmWK62gmxA1zsagTKPezy6OszQCv75nqU+sCJst3sUoTyOto8UzQjkH/++GChdbpN3q3DZKvz33yrppp7siCbn5jSe9aUlIdm3M/npAev/DWbFAi65eIJ/hu4FxLKgAG4V77i8rSUjyiEKyyTSn+J7xAWGTZR8359IHg5p858BD8sT0o8vZLZVRJDTXd3gS9L3W10wnDOzXGcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rees6DWdA8nFVTTPiYYPjXr+j28HZzV7HqVLweidxg=;
 b=p3NWhrIlN2g+77O4WiWfbGsYKNbxTb/18PdAVh32lQP/FZUcnpRG+4BbL4UgQLPOO0mAgcJ93KWANxIS0QgrivLIJ17L1AWs6NAFHcy1SUbcofpnWAVtEAR9ooLnojkNIfiszVlYkZLNkRO/DyIWTp8S0CJ7O+G1FImz4VQF6iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Mar 2023 11:31:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tests/vpci: install test
Message-ID: <ZA77aJM7/6dhu5F1@Air-de-Roger>
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
 <ZAsyxw6VvQHYrksG@Air-de-Roger>
 <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: b947b336-9ffe-4441-f082-08db23ae1056
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bWXfE2XkKocx1fWbRmh5jpzgDgK8BJFEz4uyfLfq0YZ6+AciVcDE4NnY/DEYKCt+aJmP/mWdnbQT80uS1a9McKTxvoF3n128EWEbUFIqL4IW5cqs/ej/PGXHzsT3G+o+3gRIo6UyFNbNQmttzDQxpe8fY1pxyIzg0fUdEqVt8mDsra5PF8Zdkv/eCjqipCaMfhM0Zr5isbhmUphWf3sGbfSuqYnIJ1qWFtXt+3DjuKOzv4IabIhAzexDl11kUYT49nGWO8Y9CD4cJYRtzs4zIOSKlqz9pJ/EV2pPFbfAC+ab/n+HE22/BhaVe+PssJ4LAgchGZ0qYF3Q8kTcMTF4OQyaMfpnuRPlCMs/uMermAotGKJwY6/m/QO8oKFgGag2klKcc4mC0ruVMyuRSUDcjzCHR/UftK9Y+67QQuXjHIdXfhYf56y6+96Ji+bnJNM7B4fzBssgAjwDm07dA3h1cyLwDaCgjDpmXcbaRaS5Sn30XXo8wj2A2A4PTek1T22R+Pvz0aeTtp6UYjtSjPy9RlE8i6Ts7xOjA8CYj0M1JnQ+nKH5SiIIH/jj8rj7ZW+d9zcLPHJG5mNIA1hTq4ZWo3INuEqRbCvkSfl2sP9ehQpqkjrFwZw8qLDeUdY4T+lfNuze8dQqICTC5hojPmtaTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199018)(2906002)(66899018)(82960400001)(85182001)(5660300002)(66556008)(66476007)(41300700001)(9686003)(8936002)(8676002)(4326008)(66946007)(186003)(6916009)(38100700002)(54906003)(86362001)(316002)(478600001)(33716001)(53546011)(6506007)(26005)(6666004)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzhaUG1pQ2taT3ZmWGNFRFhZb2hybk94bDhobWdvVmhiNmhBSFFDcXZaN0NR?=
 =?utf-8?B?Y2hFWXNveEkzWHFXU1lEOXNaUVI4cEFORE9ML0tWR3dlYW9sQ1lxOGRDNUV1?=
 =?utf-8?B?MjZjN3N1SnlBNHREdENKT3Q0UFhQNk1rU1FESmN4L0I5alFJYncvL1V2TE5M?=
 =?utf-8?B?dnVhQ0pId0tFVDJQN3cyVUwrS3NXemc5Zi9zTytaL1ZzS3kxUVQ4UTEwWERa?=
 =?utf-8?B?S29ZVHV1cHFXUVBjeDdhckVhd2ZLNFJVZmYxMVFOUUhHYnA2cm9rR1kyRXI0?=
 =?utf-8?B?MjAvSnFoc282K283OUxndW9mOFgyNThzQWJYbyt4UzlVS3FwN1pIZm51TFla?=
 =?utf-8?B?RUhMcHpBdDBzTTByS05INGdaYTk4M3lRdUtRdTdkRE9UOFNIYzUvV2FPd2JP?=
 =?utf-8?B?NlJVVGQ2RWdsYklYRG52U3B3NDJFZWw2YVFCTmtyTjhhN2JqWExoWG8wcnFW?=
 =?utf-8?B?bTdUZXdUdzBVcFlyeEh3NkVTU0pXZnpLQkZCelNJYTFJUG5KdjVVYUFGZjcv?=
 =?utf-8?B?TWpnVEtBSHVVdzAzZmVxYkNGVENpSmwxZzFxajgxdEZ0MFZEMFJudmVyWDdR?=
 =?utf-8?B?cmNsMmY4UnY1a28vRGJLZVl0bllhcjRVdGtxT3drZzhEVlcrNlNBcWQ0V0xV?=
 =?utf-8?B?djdZZ0o3YWRVMzJSdEpUcjBrcXdFMGVuSXVDL245cEc1dGZIWlBhK2lzUkhh?=
 =?utf-8?B?VlAybm5QVVBiY1crcUI5cWp6R2dHclNidGZaRTUxTjl3UlJoVG8xdkRtcFpV?=
 =?utf-8?B?dnB1UXo5bEw0b2x2b1h3NC8wQUFKSkJQRzNIb1h6VFk4c0p2OUMrWjBLUTcv?=
 =?utf-8?B?Tjh0djV6bHI4dUVUT2FyYm5ySDVYZkQrMGJ2b0tmNlF6S25ScDlGYVo1a0lR?=
 =?utf-8?B?dk1tT0FDS3Q4Q2R1RjhyUXhnZXBFUVFpQSs5V0R4SHVwSk9lcEdFYnRJWFZY?=
 =?utf-8?B?cWJlUTNFUEp4Tksycm1KZ2tNUDI0T093aEIvSC84VGg3d0lUSjA3NVo1TEN4?=
 =?utf-8?B?a3NNZlVwKysyaUFRWm9HZ1FhZWlqY1p1d0I3R2Z5VnNUL0VjdWRsNXc1TlVo?=
 =?utf-8?B?eG9FS0VwNTZIQkhkMkNIU3BkVmxtV1lPc1lXTUVHRFJvTHhzZGcxd2hXUWEv?=
 =?utf-8?B?UmhnRW0xbnlSYmp3S3NkMHdjT2dsR3NSZnc4U25DbGN4YzZCMjRtZ1NJZTJO?=
 =?utf-8?B?MDdyVGYyVGlNUnE2TkxFR1dnbmlLNU9IeTFCSDBXVzl5c2N5c2E1T3JCalFk?=
 =?utf-8?B?aFh3VWduSUR4c0h5WVpDMkRpMlNpb3lSTzlYRjAweXBrTzFZb3VpQ3gzOXl4?=
 =?utf-8?B?SjJzRDdDYUdveDczU3d3Y0JuUnFHem9IbDY1NXZsUm9Tdml2d1lVWjNyRzh2?=
 =?utf-8?B?d08rajB3blZVdHJERnFrekJuWXlodjFQbkZIdkp1RlpFT1ArV0x3RE11THVX?=
 =?utf-8?B?MlFHUHprcEJxUk9CM083OHJ2RUFuYmdldXFCcERTK05lVk1OdTR5ME84SlNJ?=
 =?utf-8?B?MDdNclpSQm9lQWR4aGtXSWkxMEpDNjR4My8yVTZhQk96cytBNHExWHA3RWs3?=
 =?utf-8?B?eW1ySDNBMFBiRnk2VkhHNmhYSzh2cmVHR3RxK3p5SnY3NTAySzZSSGU0MTBT?=
 =?utf-8?B?bUhyQzNKalBaT0MraUdjVUhDdWhKMzZyemdUM3NUeFQxY0xTL3hHMFNOT3pn?=
 =?utf-8?B?SXhXTUtXaGM5aXZSZEl2RTl0ZXpWR09RK0dJbXJFL291K1RZeE41cE50S1hV?=
 =?utf-8?B?c1lNNWZmN1Z1UVJJcDhRNGhwZjFZeDBPL1M5MHB3bStNaldBTHpWQjJ0TEZs?=
 =?utf-8?B?SkZDZTFxNkxsZmRZcUtxck0wYnIxdHZrRHh0QVcySlVqT2FHWHZ4eVo1QzFs?=
 =?utf-8?B?SXJDQlJPVENaTDJzbE1mc2ZBOGRsRkNRbXFsVFJYZHhhcTBSYUc1QlVBd25x?=
 =?utf-8?B?azlsUTY2WWlnSnNFMlZMNS8rVFpKY1ZJYm1rZUxLeXZiMkpwdTZLSVBMa2JS?=
 =?utf-8?B?TVZaMURGNVJQMTVEaDMvVmpIL0cxd3hCdGIvejIxeFVHSkQxSWFzakR3amlJ?=
 =?utf-8?B?aFZnZzJpbVBGUVpoRFlCem9qRGpmMHgxYSt0UDR3bFh5WVNSNk0zWk1DL29m?=
 =?utf-8?B?azFuYllHa1BWd1c5SnhHVHdSZHI1K1dvVnE0WmxCRzJMVm02dUZaendpRnBo?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	flHwrJ7fdlt3md4N8IOl4VNibGF+sb2GAIKf1N+M+GP+mwBZ5OlbmJySAvWWSbS1+YT5CNk/y/Kc4kY3TjPqdwJMhmPNOSmESSOV5cWD9iiJaBOEKteWTtAMbN2/UfH2RyUTR+oKY5BxcsmYNk+YQwOldUG8oRQ+S9oW0QdNOEDJjDv9GgENIv9qOnEAapCWUcrqIRbKmD8QCx3h7F/y1W0mKBeQjvmj3YXJq2cIbHY9lmLtujaIIguwDJBJM1siIrCe6YwPZjiikUm5WEcmAefzRnMM/Gsx4go9DTTdKylSDebNESRzdOp7EGp3Zv/0hJ9XI3XmfGuALVE49ThntbZcBlCO/p+n5otGp0QwQJsBoOzhLL/6PmKmOXP66crm+nRQeHqzt0B1+ZIP3nnqzsAy/gfeCOTQw/kBsqpjxFfktxtnBOWvJOpSOdV3fKf/uMGK0yac6/BN5xiulBgYnXwODi5QJHJv0IRRwE8IRbukt0kIsEXN0RGaSgN4ORPH1PvnNl9m5sbVj+JOAiHG82jobKYzXMTeLJmPnFNkx21kbPk7eBnuPafqjY/Py3hLAptmriVRbdSqfxgxzhaOvHEwWKeI9dWrZ+G0/Egva/8Yrq8DKUerawR0Hd1XVS4CFqsSXgowwuz38joX57GBRp7T4yciMSMTmgSjrN+clqJGJQk58rmFaXN8L1bOXrIIDNLpWt7egkPXY/OgSOAtXZM3SO4fhTfEElXjRGqh2MABYlTX/qGGbU0heq02F50cd/XEwme8XnLhOcjCIA1sesfYchlJWvHKmAcEIzIBBt4CG216neOFSAq5PPS2bHdGEXAHCCyrh8OTIn7bFyuiYw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b947b336-9ffe-4441-f082-08db23ae1056
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 10:31:11.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8r1E8+4cgRmKacpA3vg8WTsQ6atbEl9ikGb8VmtRMdvDKCZkOGMRFD+apPGmucgCoPRL+6F9Zm7ZIm7/Drh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6083

On Fri, Mar 10, 2023 at 03:32:41PM +0100, Jan Beulich wrote:
> On 10.03.2023 14:38, Roger Pau Monné wrote:
> > On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
> >> On 09.03.2023 17:58, Roger Pau Monne wrote:
> >>> Introduce an install target, like it's used by other tests.  This
> >>> allows running the test on the installed systems, which is easier than
> >>> running it during the build phase when dealing with automated testing.
> >>> Strictly speaking the vpci test doesn't require to be run on a Xen
> >>> host currently, but that allows easier integration with logic that
> >>> runs the rest of the tests.
> >>
> >> I accept that as a possible way of looking at things, but personally I
> >> remain unconvinced of this model. To me what is installed should be of
> >> value to users. If there was a properly separated directory where all
> >> (and only) tests were put, I might agree with installing. (Nevertheless
> >> this isn't an objection, merely a remark.)
> >>
> >>> While there also adjust the makefile to use $(RM), and rename the
> >>> resulting binary to use a dash instead of an underscore (again to
> >>> match the rest of the tests).
> >>>
> >>> Since the resulting test binary is now part of the distribution CC
> >>> must be used instead of HOSTCC.
> >>
> >> This breaks the run: goal, doesn't it? If the new mode is wanted, I
> >> think the two kinds of binaries (and rules) need separating (maybe a
> >> way can be found to avoid duplicating the rules, which would seem
> >> desirable).
> > 
> > The run rule is not hooked up in any of the upper level makefile logic,
> 
> What about the run-tests-% goal in the top level Makefile?

Urg, I wasn't aware of that target.  I assume just removing the `run`
target from the vpci makefile would be an acceptable solution then.

It's still the user that needs to explicitly call run-tests-vpci, so
it would better know that HOSTCC == CC before attempting that.

Note cpu-policy and resource should also be fixed, but I don't plan
to do it as part of this patch.

Roger.

