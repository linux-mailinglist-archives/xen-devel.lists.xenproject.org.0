Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3759673DE4F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555473.867273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkqo-0004yp-9v; Mon, 26 Jun 2023 11:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555473.867273; Mon, 26 Jun 2023 11:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkqo-0004xA-74; Mon, 26 Jun 2023 11:57:46 +0000
Received: by outflank-mailman (input) for mailman id 555473;
 Mon, 26 Jun 2023 11:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xUJM=CO=citrix.com=prvs=53421d4de=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qDkqm-0004ww-3h
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:57:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a645c19a-1418-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:57:41 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jun 2023 07:57:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5516.namprd03.prod.outlook.com (2603:10b6:806:bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 11:57:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 11:57:27 +0000
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
X-Inumbo-ID: a645c19a-1418-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687780661;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5VdrAXXyi4JezGRZpr4Np32WIRyDhhRgUyHIrT188PI=;
  b=JKBBKQ/A06s26BNd2MGop6USAKZkMXGwW21b20Ho0Ma+DcR5Gx31oxEe
   omsH5baFjSk3Ueor16QTyj2a3lJyqecrF0cFTlo3KC1LQqem8SrYavIM+
   BZ5piKX3PWnWkqPcuoxFl7hBN99lDCXWTigX4JbAG5L5m+QLch/736VpW
   U=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 114571769
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rgSsoqBd61vI8BVW/5Diw5YqxClBgxIJ4kV8jS/XYbTApDNwhjRUy
 zMYWW3UP62IYWfyf4ojaom2pk4O757Qzd43QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1C4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4/dVI0R/z
 OIiJ2o0UjWqjb7nzpn4Vbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwX6kAd1MRdVU8NZV0XmdyUMTDCZLdni8saW5tVO4S49Af
 hl8Fi0G6PJaGFaQZvnwWQep5kGNuBE0UsBVVeY97WmlyLfQ4gufLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqQTIPRE0r6t/orYU3kzrGVNMlG6mw5vXwGDrwy
 jTMqzIsirE7hMsHka68+DjvgT22r5zNZgcw7xfQWCSu6QYRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xMoDF42XnSqBBsAEBqi05u2tOSfZx1VoGvEJyTOp/HKyeJFK1xt3LkxpL8UsdCfgZ
 QnYvgY52XNIFH6jbKsyaYTuDc0vlPDkDY68DquSacdSaJ9scgPB5DtpeUObw2Hqlg4rjL07P
 pCYN82rCB72FJha8dZ/fM9FuZdD+8z07TiJLXwn53xLCYajWUM=
IronPort-HdrOrdr: A9a23:eZJr4aGauymeRVMcpLqFjpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6La90dq7MBfhHPlOkPQs1NaZLXPbUQ6TQL2KgrGSoAEIdxeOjtK1kJ
 0QCJSWa+eAc2SS7/yb3ODQKb9Jrri6GeKT9J7jJh9WPH5XgspbnmJE42igYypLrUV9dPgE/M
 323Ls6m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xir7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjesdMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCV2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJu3cw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2NfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOhNSS35uwJzvnxehT+Ydy0ofsuoqSR+4eMC4YDCBfzCGzHyKCb0rEi6s6yYY
 fHBHsZOY6lEYLUI/c74+TPYegiFZAgarxkhj8aYSP4niuZEPydisXrNNDuGZHKLREIHkvCP1
 prZkmAGCwH1DHmZkPF
X-Talos-CUID: 9a23:uGIn32P3roVaIe5DQThF1mslI94ffSfk8FL5KRPpB00qV+jA
X-Talos-MUID: 9a23:cYOPFAtqM6zYlzf0VM2nu2BGOshH46CVVWMuloVau/aZMzwtJGLI
X-IronPort-AV: E=Sophos;i="6.01,159,1684814400"; 
   d="scan'208";a="114571769"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP324cSVECKXBmBeSOPdmw4KEsRj0PC6o2FAxB2+KYohhmq5jYQme20pIx/J9YPApNopdCqK/tPAdKMoqpkeSgHGBtGonGWAegrVIbtW+7AZZplOOD8ymdalL8YZ4KawvVEq9lFjALi879Y9ZlWlMXiRAuMdCsheOrz16Z6Mkj95aeL7gpR7imbelD1D5Mbi6GKtPp8i1k7zAJKmXFrs+q+ZRNx8PxTzIoVpRW8XzdIdD1kaYtzbYaMP2AQFRIKrN32PTl+FvMrPctR2J4apbjegfejGOcsqFGwFI2NXJdtriye/v2ZOd79FzHjNHp+l52l4JFGzatbkoX6HJ/m8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VdrAXXyi4JezGRZpr4Np32WIRyDhhRgUyHIrT188PI=;
 b=eJ7bH8l+N3jx8Uwd+G3etopv74imuEB+1PgEowhXtat6ldyd22+E03LvIDtOfVu8V9GqtGA0RfHFOagGDiFvbctWgGxCZhkg+HYuUjKdVQwktdq8C5CaLmCn7k61REw6uH0zyLccJS3Cs/p7MgbWT/qwOUMES53ffEZxJQvqAs/A4CCqWkMCN5JeIbNBsjDOH32tmq6LskLyV6vzAT4ODWxh0wHi8j16jAa37y6MAOrOEfT5qWfeNKSbo2hjWHInzBLS9UN487ypOJt3QbGtniGCKtOGl3UTSvEvlc07sXPEoWG4QC3Q/m0mGorak9pITdYIDR95CJ+mc7PhrFif4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VdrAXXyi4JezGRZpr4Np32WIRyDhhRgUyHIrT188PI=;
 b=hs6oRJmOSc3hE3/4BYXS2McrpxAMhsG0euXQGXo/nIx3YJs1C7GWy9mlibFJJ6YUNVBWjylzDjA1HAq8V4HzUA2GerSxWrVvW+b6QI1S5SBxIA8jeVuOen3ShI05UNtiKPWc8CRwWGHRQDgijz3KP+TIjMEN3nT3VYFBl/meqMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26a025ae-a23a-4554-4a1f-bd606e171b8f@citrix.com>
Date: Mon, 26 Jun 2023 12:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7e58f8-4747-4f69-ce68-08db763c82ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aVVsR38SxIwx7AxqBY2ZLXNisd2kiogPO7rXEjpwTUUgE0OzDIV4YDOM4qEKk0ouk0ilXuH5qs0c+S4wPl/JVXW8e1FWAIcjHDG2q3J1nxBSXyWtcXwDwVw+3UObGMXZ4Img9tF3EC98NR90G/al6S61clcVLEE8MPv0HTxo1cknZt6QVnHfu9mkwDs6+Gi3RgGO5P8C7cXuGmA1Gdwp6aBFK/ENHs+fjrfNH4HdeD4PJfskDePqY0CZ6pZ4zeUOZEsbshxCdf9atZK00tuBlgy792rdQ9ueNqt9PULRKRlatI0E5U79iyH/w1k1332juV92cnpTV8lOoQgcRswuKCw0fQevjIbBcHBkj6mRNzS2zOcA/HAX6qdMiTJxs8FzQB7V9FoGO0CQeoJ0w6+acZgbgQqLcBDCeBEX3OXqFAB0RoWLA/9VRn3HFERP+5dcv5zGlE4k2ld1jubxDXDP5tGPgcg/UcVAl2fRpa8nc/IEq8eTb/vhJ5W8ys4GWGO5ipbL1Ac2Qcy2o2VDkbqxbiSDaojcl7fKYNKfY1kZQ6zYvFxJXuF/brBVzWR8GAS6XL/0fNNz/JXLELaFkF+ZYYJXg3DgcG5Gkc9nPkIBzsnuZJTALhMDHsjhkzDl09+mNu1BOP7kTcH9D/KTleqVfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(6486002)(6512007)(53546011)(6666004)(186003)(478600001)(54906003)(2616005)(31696002)(82960400001)(86362001)(110136005)(66476007)(66946007)(66556008)(4326008)(6506007)(31686004)(83380400001)(41300700001)(316002)(5660300002)(2906002)(4744005)(26005)(38100700002)(36756003)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUdRM3JxMjN4c0pyNE9aeWc5dUtRd0tMbnl3ajdzVGQ4bCtZRFc4a0pTU01D?=
 =?utf-8?B?OWVpTEFKYkxqVUMzV0hmRGtvV2lRNzBvZHhBcmpIYmU2T1BWdWVYZW9NWkR4?=
 =?utf-8?B?d2ZZdDB0a01QSkRuV0Q0azNlOXJ0OWo5Tlg0bUwvQlFSQzlPMXlvZDFUc2NR?=
 =?utf-8?B?aFYyVzdrU2UrdzRnZC8zL25RVWkzSWExaEZvaVJxNDVTZURESHZQNlJ1MGw3?=
 =?utf-8?B?azJTaXdONFhlbERxMmhVVUF0VEdkd1VGMUpKSGtIQ2lIZkw2alo3a0tlOTc4?=
 =?utf-8?B?bjlmZUg2aElJeWxPblowaUhCcTM3ekcrY3NlLzh0UUwzVjJPbTZqOG9uaUkz?=
 =?utf-8?B?RFJNMVVBOExwWnJ5TjVnTEluNjVlWVJiQUFxL2VraWI4aituaFM0VytjUlRv?=
 =?utf-8?B?Qld4elBabE82YitVektMZkdzcmpZRTcyajQ0OHBDSkVKMkp2a2dnVHROcGFo?=
 =?utf-8?B?YWFpdURzNkh5V3JzaDd6UE1EQXhuajVKZnFRT3M3K2Y5NnQ5ZXEzbVpxaGZJ?=
 =?utf-8?B?M1FFbEtJQTFubWU5MjA1elcwZm44dXErNlp2QjArQnZNeXgvWWxxSS9KeFFi?=
 =?utf-8?B?b2d5SDVJK2RZaWtkSHlRdjBZNTIwb3M3K2FMUDF5a25lUjBmQjFsd0ZmVTRY?=
 =?utf-8?B?b3MzeE1FU2E3c0tQa08zSVdaOENqeG9wOWg5UnpYM242VGs5WDBtZHpML21O?=
 =?utf-8?B?cHdnZU1aQ01jT1R4U1dSZDB5NXdtY1orMXVyMEM0UGE1emRtQ3dkS1RCdVRJ?=
 =?utf-8?B?S1JXSkZ3R01DRnJjYjlQU2w5V3gwTi95eHRTS2dDdlVZOUNZMlhsUmxzM01L?=
 =?utf-8?B?N0YwZGpBRTlxSnRKYlBKU2Y3NDhISWhYRUZrdWNrS1FNRHBhdVJDb2pSaUFz?=
 =?utf-8?B?WE1NNWt5UmdnUy9RbDFGbmVBcmNYZ2ZSeS9rN3pWWDNmZXZ0YnJSZXZ2KzNa?=
 =?utf-8?B?SE9xNW1FSXdYcG1hbS9qQzV2SjlZVDMvN3BCUVdPek8rQTBqOTExdnVKVlRu?=
 =?utf-8?B?YlhlMS9QTTlQM1FWcmZWanBNT3F1M1ZXTTRueThxUVNzM0dyc1FjM3gwYWk1?=
 =?utf-8?B?T09qTEpRZW5ka3ZkSEV1OGZvaFVQV00zZlAva01Lcml6Tkc1ZEYzblFVeVRn?=
 =?utf-8?B?MXJCaWxuaHF2ZExUalpKYVBMbmVoV3F6L3F4MEkzK1BuNGRTODJYNDJMYm96?=
 =?utf-8?B?ZlhDR3p4cEZHVXFpU0RSU3hwWi81UlNwcEQvTWZndzlDek9wanRQNkg0QjZK?=
 =?utf-8?B?N3BkZjB0WVlVTlVWYjgycGJTL0Y4Z3JwSFhGQ1NOK0diN2lzWnZUR2srLzNY?=
 =?utf-8?B?cHRWeFl5MUYwMjJoR0dvbldkZ3JWKzBSNTdzcFNPUnExU1JPN0V6djFhRDFZ?=
 =?utf-8?B?Z0NpcHB5SFQ2Y2lSWUtPTXBlVUFOZWMwb0p4cGk4N1Fma0RINzZ3MGJ3Qmkw?=
 =?utf-8?B?TTBGNnZBL3ArVG12RXlrSUhRYklHYzFUWHE0YU9vZWZZdE8wczVyY29INHhV?=
 =?utf-8?B?RG53ZjZDSE9VbitZZFB1TUFCMUtpWXFBVUp0WFpSOW84RTVRRmRReDduRldQ?=
 =?utf-8?B?UGJQTGFTSWhpVnArd2ViZDdEVzRhZk9YZUsyY1BGYmZSRjJucUdmZ0pxR0dM?=
 =?utf-8?B?d3ZqUU85bERhSU1reHpodE1qWjBLWHA2UFViaG8vb1ZobXd4NWY0VEx5d0pj?=
 =?utf-8?B?eVUwejl5R3dsNDJXbE5PdWRhWFFVSVdjRXIxYk9QdUQ4N1FyR1VoZFNDRUto?=
 =?utf-8?B?YkNDakVDTUZ0Z253dlVKUUhPQkplTXVsNGduaUVtOUpJQzIxand6UTh2cmIw?=
 =?utf-8?B?U29WdGpKZzNONUliVnhRL1RKNWtQa2h3QkJrWXlncUNCemdYSy9RYmNwVmlP?=
 =?utf-8?B?TzZGTnl5TzR4Y29tM3ozZmFycFJuZmNuV3BkMkFsYmVxc2NEVEZObm9DN3cz?=
 =?utf-8?B?Y1RMYjZwWktJY2RTcUlRdi85MEpMV3hJYVJNd3JLclFuSFdzcm9RVlNBb2No?=
 =?utf-8?B?NktnRHcvcEJyS0hSZ0tmenF5UW9vRWxwMWJlRlZiQ2ViOFdkRVhld1BhT2tV?=
 =?utf-8?B?elJBcHZuYWJMaUxURWc3azkwUk5wQjBXcGVObFc4eEhzdHFMSExXQ1RMQTVu?=
 =?utf-8?B?emk3aWFjTG5oaUo1SlY3NXYyOFRBNWV3L0tOa2lxbTlPcXBhc1h3REFrUVBB?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3eYHlLVHE0vsbpquAGUmmwb+6uLKofR6Y7PkTffeQTQ1WeftURssHtB4BiDrcv+cQEpMqP43CQKJ2JH00O92LVkbvC1LhlSXYZRD0nduX5q928FN8KSk4x0QXGi3mTgMsEeRmjemvgFIlSgbYTrOKRjU5OnA6c5Pg4jSxnHnY9aYQd8Ahnjg/9Eu8ycvn3SxZiM7u2qt05ayHfHTEIls5zyoWwltlouohblWldARw6/cdimf8k3GefNP18SozPP2iFY/+D/RPFmCqDj4xnEl7LbUjb8/dK1BkCcTbWn15GPT6mA3pmYW+8nu+K8fUMvNvWbDBm5of6/XFFcm/rroPT+qMRfMQB8Op32vTb76WZNmjHoPRCV4aiPLqxpy8RdKr847gPfjFV3h7BWUs/FnVGO/gxS6vDbUhsYYDvgmCDbsuTqyR+REOdZOXFSVdIiFAU3UeFsZ7gc81MSIkdwRMvu/EoR03BFKRPhYC6vfjG6rAs+hyU4rMRJInOKM5zoiBgTxsa0xWsqSp8oKdmXMN0k47of3g7xxM9xxShgiMAhi9JYzyd3XMbEQQupbg2LdKG5+j42U+7OrGcyImr5QCfPHdE0GYXhSNs0KvwaBbnq1M8gCYzMkuPQZMQ4DK5r4Ooir1y2ep143QByfRK/andQZnC02flCyHhaNKzBAkOsqBinl3o7feH0NlXlxaw18DFLiOQexw6n2dL0SvT3h+k04h/FmWrdhc7FlHGSy0jY7LJlTA+0OKUG68aI0s9iHcabjkYjcwg6FdTRyjhI2z/N8zcgSMXfc6rO3ve7HmhDBGE8wP8cds2I8j+BjKzdKtetkARPwveqrze6mRZmmymZ8bfchT7U3z8xxCEYM5tNgSYLovBdQJuVpPIQAUy7C3TQnA6UFwjXW4nSebjt7CRGKgT9lkVkh1l6s4v2ZSe4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7e58f8-4747-4f69-ce68-08db763c82ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:57:26.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeSSYYe4sdbiIMNsMr3ijT1rnqeG4EdQYcFt01CQJJpuOrWo2j+bOx0rhaqaq4hQlsDNAgaTUSnFJLUYWPMzzictXeWkEr8C20Rv2ygWl/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5516

On 26/06/2023 8:29 am, Henry Wang wrote:
> However, I noticed Xen will print below during the Dom0 boot:
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:371:15
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
>
> Just want to make sure you also noticed this, otherwise maybe you
> can include another patch in the series to fix this? Or I can do that
> in case you don't have enough bandwidth.

Just as a general note.  What UBSAN does and doesn't notice depends on
your compiler, optimisation level, etc, and whether you encounter a
problem case depends on your hardware.

Finding differing reports from different people is entirely normal.

~Andrew

