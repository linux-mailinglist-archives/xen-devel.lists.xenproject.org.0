Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E07B563A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611658.951214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKmW-0000qP-HA; Mon, 02 Oct 2023 15:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611658.951214; Mon, 02 Oct 2023 15:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKmW-0000o4-EO; Mon, 02 Oct 2023 15:24:24 +0000
Received: by outflank-mailman (input) for mailman id 611658;
 Mon, 02 Oct 2023 15:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKb2-0000iK-TT
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aef2bec-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:12:30 +0200 (CEST)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:28 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 15:12:25 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:25 +0000
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
X-Inumbo-ID: 1aef2bec-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=psChbXevVQDev+FecL8Znn3KSLaq4hCGvgjWrrp1GF0=;
  b=PLDqXYYt71ySyDpLloJFQvwiebvQwxds0R3F+MeA7No7xSuTrKYs1oC9
   bTPFxpojngfxH6Tg9dzPy5QwOnNnlixv/NO0Krzz93qqjhaNrhaeSImNP
   MnVyj8LbCjpzF+4JNz4fkb3hz4zai125omDmDR4aR+nVB+IVo5EJf8WW2
   s=;
X-CSE-ConnectionGUID: A9L7y0N9SiWSdMHovdX94g==
X-CSE-MsgGUID: EDmfyoThTZGrEjmFdJkNDQ==
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 124817058
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:MqvB86DRi9i8KBVW//Liw5YqxClBgxIJ4kV8jS/XYbTApGkggTcAy
 2UeUW3VOveMM2D9eN4iYI21p0pQ6JXSz4cwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw07dTXnAW0
 60jKQ82YjWjgPy68OPnRbw57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPfriL12beSzUsXXqo/OLi25/lWgGGh6XY+Chg4WXm4h9WA3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBmUCVC8Hd9Ugu+c/Xzls3
 ViM9/vrDzFytLyeSVqG66yZ6zi1PEA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pdEP/7W2+xbAmT3Em3TSZgs85wGSVGT16Ap8PNKhf9bwtQWd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdw4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:8IkXWqyPjDacIpRYVDNIKrPwKL1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSibfK8nnNHDD/6/4Y9Y
 oISdkYNDQoNykZsS8t2njcL+od
X-Talos-CUID: 9a23:VOXadmyq5Ka5kfamPINJBgU9S+R6YyX7nUzRHHS0LEZuVrGlGAOfrfY=
X-Talos-MUID: 9a23:ucyPhQm/dxHKtfsaPLRQdnpPGMJm8qOSCHw/vo8rucyqOQ5zHRuk2WE=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124817058"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7+yE8xU+03OhcQfKfQkPtIq2J4q8+vFFW/nSnABIaLhqHSwGVw9UMXrOjsgpbHpiQEl+EGGYMSL1RSiCAmeE7z/03rsxasjrngwm9x5Oq+hQclw9+sGfN3CBe+CFYqqEvp33FUSAWwR4OCETyoO0q24goFWl6xVA6t7kCk0vQmO2upWDD3RoaDBtUUTRTp53EnkNrRzZ4ffuqRMw4N6fwlXfIOxOcgix4zQuBoKestxMRtkM/L9wfHfE1NeHlzVuQgjZrrF27y/GSec03iwsrkKKj1/bGb699P7AaZbpzn41cectRBaOQkB2QHFikXp3P/tHcYHOyGddA5d7mjtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHzEv0bBVjJyC3Xd0ymJb5ygmas8Z04naThhX+BBIfg=;
 b=QPwANCEejrhVdj46jA5TUpsQBt+XEw254v0oUqjLU4+RLikqwYlXavleNMCEW4HL9VYVSxpMmQQL6CqBrZ6+83n1GU+1R2RMSc3sSzs0MYY3zeXrrONwuh7PzesrGMjP5uQvbyVei8+ROhRJEG7QxWxjDpACh7OOQkUzaUvJT7Akb9OGlWWdo+8w9QaHFqdYKOd8fDhoGvbuyiDjQgbDCWjILbT+J1wT3bbNnmY+3xcU3XLT/VD/cbXP8QiPhlv4SwbbE4sbTI5a9CipkqxKF0O3rgx27PXzJdWqVVbZT0jMTE9nrW7WIrfOzHY5YguMOTdZxv9v3xCzaeXqg8XHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHzEv0bBVjJyC3Xd0ymJb5ygmas8Z04naThhX+BBIfg=;
 b=eaYNIs/4MoFlul1RibCXcV50eVOEoZ5YPo0pLrhQWcWW16gxzcy+ORF6Wh7RacWyfS4YkJYwOJ606L0S0wwwkiv0iQkj2hRyREiY1LCQ2dod1l7IiZcCl/f2VrmYCwDPSPLwf65djj9ZtIc+qiOWm0rFflowogYKbT02ZZpXpHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 07/10] domain: map/unmap GADDR based shared guest areas
Date: Mon,  2 Oct 2023 17:11:24 +0200
Message-ID: <20231002151127.71020-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN9PR03MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 26aadd2b-5455-42af-3424-08dbc359fbe3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gEzwI7qaiwqowvA7WR43F09zOYVyQSpTlFjycOKamLEs86Hx7ChEYIchIDyKizgBhtgVRihvydR+O+4VCfGbKeRqLIcaY+ubtDgX+sbQ+2HS8+M/31EUZUvo8gBFigVRKwzE0WPpPJB912iTs1rzOFMwe5TUNRNcQwnw5fNPxGu4rU/T5cWx+nWch48ydnsm1E8GyQpsB1Q18RZfI2YqqP/tW7AvpuqPlZpI30/YCWCbmthj3TvnfsvsQcr9SjYHaWvRzQZfGbrMgVD2i4Y9TRgD7qTawy9ik0mMSZZD2+fze2XVMqWCsiLmzpmQ5PGt+V8kwG+YZfckUkVKpZXDQxUlFjn3W70EmFMegeFYckOM00aQb9abE63uGT9wysL+8nGR4nu5e20GX8mS7lVfVOEP7+l1S2itU7VkneT6KdP17gYCNT96JCVkFID25P76jYvndYq3Rx7fmfJsUPLLLiYbvDvwS2RpVpjHJFRNoRiuGVCKWh3fl6YEJcLsE3ED7kOKP2sjLLzcVc8shqeyN6/WOUy8fcsFnOSEMDEMOAOlCvsy4yDGWBHpBj/EdvLW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(107886003)(1076003)(26005)(83380400001)(82960400001)(38100700002)(86362001)(36756003)(316002)(54906003)(8936002)(8676002)(4326008)(5660300002)(41300700001)(66476007)(66556008)(66946007)(2906002)(6506007)(6512007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2wzdUlIUmNRUTBDRjRYenluUDdxeTBoYVVPeUZqS3piNUM0NEk3VjBnYlgv?=
 =?utf-8?B?VFhtcTBHVWxRckVjSFByM2JYUm5JQlNpa0tQUEVTWWhJZlFWVVZ6YkV0ZkxX?=
 =?utf-8?B?RmZjZy94c0NmTGlZanJjSjJjY0Q1enh0VmdpU3AzcDJjTUhmNjlOTFJPVVZy?=
 =?utf-8?B?dTBwTGNvZ29SZHM4V0hES3dpVDRyOXkwSnphZU5MUjRjUGVGTWdFRzREejhG?=
 =?utf-8?B?cjhIMEFaZXlSUVhlYUsrbm02MGZWL1Q5ODhvS2F3VHVRdHNXVDNhTWZSMDU0?=
 =?utf-8?B?aURNWTRuLzkwdVlwTmlnYXVWRzUzbUR3U1Y0NVJHRmdKcHRmVDZkS0FXb215?=
 =?utf-8?B?S25KYzB2dnE2K1paWlpKTitVK1VKSkFUUXE2emxJOGdKV2crVHBVbDliOE1o?=
 =?utf-8?B?UWVxeTdLY1QxemRGQzUxRVVqQjlLMThoNStseGs1SGQxYk96OUV5TjJkaGJ5?=
 =?utf-8?B?OSt2KzB3blZ5ajRPVFQ1aGtiTGZ5LzZ2dUJ2T3lvQ0g0a0dnUVBnUDREeDkx?=
 =?utf-8?B?UytOaklhN1Y4cG1UL2lmeXF3dTVqMmF3SnErWnpSQkFFbUJOR09tK3ZWYU9p?=
 =?utf-8?B?ZkR1UjhMUDFuSkErRUFRQ29kek9qY2d2WWRVbzBzNGFxaEE2a3JJUGQ3amVD?=
 =?utf-8?B?SXlzbjJIUVhJWU1xVkdSQnl6bXR5b3Y3NVZzWW1QYXhpRXoyM2FkRmpDWmdP?=
 =?utf-8?B?aU53MnlFcmVoK3ErRTU2c1dKMHJwQ3V0L05BdjltZDFQbXo1WjJHRCt0dUVo?=
 =?utf-8?B?WTQrUEkxckVpZ1Z5YWtuN2VzcGh5QlJPWjU2eFFzWk9UTXVtMS8wc3M0SEVa?=
 =?utf-8?B?ZmRHOE9oVjFETVl3Vnp6NWhpamVrZStrSEhGTlpnMkJsTmZNbTlrTUIzV1Y0?=
 =?utf-8?B?blY0VmI5em5GeTEwS1NYOG5IRE50T0dtUHcxMGNCbTl0VEFtcjh6Z1hNcktB?=
 =?utf-8?B?a05Zalg3aWFBUnBRaVRxeE9CZmw3ay9wSUltSGZmSURSbktlUzBLWUlmNDA2?=
 =?utf-8?B?NlBweE1NNC9KK0ZVRWVoUFVWZkVaMXFzNDJPTTN0eGN1dWVoU0hhNnpqakRR?=
 =?utf-8?B?RDVab3hCTTMxNExEbmhpL3JUUTVldWxNYkhtWjJqaUhJak9kalAvVzZSdjRh?=
 =?utf-8?B?bHZKOWZocnJsU2NtK0tFajJsc0RhRUIxMy8yOVJYcjAxd01EYW9UMEt3TzNF?=
 =?utf-8?B?L2wzVjIxL3dHZ08xbjVWeXZrYkUxR3IrWEZQZlJMZHFSdEpiMk9Mc1Z2S3E2?=
 =?utf-8?B?YkVpLzR5VVFkUlVuVEtpeSthQUJua2lZOVBKa1doemdoSG9qaUdLeEJ2MXVa?=
 =?utf-8?B?cFhQWEpOSHhhVUtyYW5od0hLY28wK1ZiZ1VacWh2bjF6N0FFWnlablM3ZExL?=
 =?utf-8?B?alo4Y1VrcDRZMW1DY0lDS3g3WU1wTXAxc21GQlNITmMrdXBOamRjZUhSMHN6?=
 =?utf-8?B?L1pJV3FMRWtMVk02cnpVL0xzK052alJCNWxaOEFDSHNjUXdiRnRiL1dHVjJ0?=
 =?utf-8?B?aDNjdEFydSt3VWNRNmRiUXM5S0RqankzL0dOVk9iRkx6cllQVk5mc3ZiSVZN?=
 =?utf-8?B?VUpnNVo2S29xNWhFZjdmdEY3NU5tLzVSREpSQ2ROK3U0OWhtRDdSWDdrYTB3?=
 =?utf-8?B?RzYxNEZlUGsvWk8yMlJSaG1Id3Z6dTZmWUxxMUZvSHpjZSt2dU1hK1N5UGgr?=
 =?utf-8?B?eGdoUS9TWG9DL0N1bUYxNzNiYnV2Sm1DVDBWRCtSSjNyUGEwN216NGFPZC9Q?=
 =?utf-8?B?VDJNdXVZZ0tiS2pMaE1uSmYzVkRSUGxmN3VoeUdPb3dtRllQVkhJMVEwb0d6?=
 =?utf-8?B?aU45ZUhUSEJxR2p2bnhIdk92V1dlNnd3TUk0bVpSSFlhSnhjZ2pGS1RhallR?=
 =?utf-8?B?bm1ZQ1VPaHV5STROTVpzZFB0M1VwUzJKK0FsVXRzbElTczUyUjV0L0t2eDQ1?=
 =?utf-8?B?ekFVKzZiUS9YR2VkbFhEbFEyamh2cGV3UXJ0OEtIQzNsOWpyVEZYNThPcXVu?=
 =?utf-8?B?MDdyR3FWOW9xbFB4WGMvcnpwYjNFWnFBZzZod1pTeDgzbFdwNHpLdkh1UFNB?=
 =?utf-8?B?Y3VwQncvQXoxQVp6WGpPam1pRXhPbmxQUGxwcGR1ckxOVkRFTHZWT3R0empX?=
 =?utf-8?B?RGNXZUNuSk96SDNJT0U2SU03WmFESmlTY2VMalBBczdoR0RyWHV5YWxrb3h5?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GwbOEnPr10kxxSrMNhQcQRUGPnHnJIbcZdtOjeMwWb+HGM1bXWLI3BUS7KJT8dliItiC9UtCVabgxx2WCXU/KbbVpMC6LZRFIlC7Bq5D60SKT/LFqXWp3UWlxgnYXaqqHYEEDnCxlf08hdPqFgeJJkAK/1Fm/GEknxnL9QxJSXvE6rwcCFRsyzoLSse8Dd0fxd+CjM1acB0C0b6Jk8aqMvkpHKWzdf+TgkNF33tFUisZ1JSPIaJ5kxbBVhUsdZFVaBhNpLbh6S+v9inGmGAfRh+ik5P7uVMxd4elxuBRpeA2RNk50Pz2dE0qAytfuM/PmnJcSrvOgO8S7T1X2dngq9htq02LAEYtL2DBuoH+4Ujzy03UnNmG4lujbWAoKlpc76dXTseAh3+JoD3Li6FDUUwKekdN5lLjynQhw/aMo5OcPnug6BKkmTJWpawvmNCU7R31sUrET7LMrs/z5tgORP8onzXukYxYKSbuRVeVzoHSs5f6/zf/1vvGt9TNSF0BPaaX8pIHzv+IrFsaWtGOfbCzaiYV8LGW2tYQD3OH0+DUluDbGb51IZ9IsXfT3d2rMK2+3IYM6zjLWRfpybck3cC27fZeT60Vf8N9ZgxlQmMfRP3rpz6J6aXoVwUbJByurtKclj8QRsO0LcaHfF6R7c+IjhxvCNY61u9thHB8xr0R4fRgeQ7/NCYCMAoy+kNTG94TFTldAFHmMUWIfL5r99PBueGS9pzTeA+zTHrBkLLmQZaYjFwZbUpFhWrawywgHiwo2lhCt/xjDfn/mZ+ipix9OX3sqQWyXc7QjA65rP+iJeXHfB8jvj+TftXrDotUwZQJ88CLLhrQ7theBWmDYlX7G8ng2a9RMiagG3EebaIuw2jO7gQbZbgxkE5rjddG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26aadd2b-5455-42af-3424-08dbc359fbe3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:25.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TV/QUCpK8ivYHdsotAi9iDzEZ537Hd1qm5BXS9xLWc3KQX80BoSlACa7H2VJBoQbP+6T5vW9eQGFPFC+nCm3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6188

From: Jan Beulich <jbeulich@suse.com>

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the areas are inaccessible (and hence cannot be updated by
Xen) when in guest-user mode, and for HVM guests they may be
inaccessible when Meltdown mitigations are in place. (There are yet
more issues.)

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, flesh out the map/unmap functions.

Noteworthy differences from map_vcpu_info():
- areas can be registered more than once (and de-registered),
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/domain.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 47fc90271901..747bf5c87a8d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1605,7 +1605,82 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
 {
-    return -EOPNOTSUPP;
+    struct domain *d = v->domain;
+    void *map = NULL;
+    struct page_info *pg = NULL;
+    int rc = 0;
+
+    if ( ~gaddr ) /* Map (i.e. not just unmap)? */
+    {
+        unsigned long gfn = PFN_DOWN(gaddr);
+        unsigned int align;
+        p2m_type_t p2mt;
+
+        if ( gfn != PFN_DOWN(gaddr + size - 1) )
+            return -ENXIO;
+
+#ifdef CONFIG_COMPAT
+        if ( has_32bit_shinfo(d) )
+            align = alignof(compat_ulong_t);
+        else
+#endif
+            align = alignof(xen_ulong_t);
+        if ( !IS_ALIGNED(gaddr, align) )
+            return -ENXIO;
+
+        rc = check_get_page_from_gfn(d, _gfn(gfn), false, &p2mt, &pg);
+        if ( rc )
+            return rc;
+
+        if ( !get_page_type(pg, PGT_writable_page) )
+        {
+            put_page(pg);
+            return -EACCES;
+        }
+
+        map = __map_domain_page_global(pg);
+        if ( !map )
+        {
+            put_page_and_type(pg);
+            return -ENOMEM;
+        }
+        map += PAGE_OFFSET(gaddr);
+    }
+
+    if ( v != current )
+    {
+        if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
+        {
+            rc = -ERESTART;
+            goto unmap;
+        }
+
+        vcpu_pause(v);
+
+        spin_unlock(&d->hypercall_deadlock_mutex);
+    }
+
+    domain_lock(d);
+
+    if ( map && populate )
+        populate(map, v);
+
+    SWAP(area->pg, pg);
+    SWAP(area->map, map);
+
+    domain_unlock(d);
+
+    if ( v != current )
+        vcpu_unpause(v);
+
+ unmap:
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
+
+    return rc;
 }
 
 /*
@@ -1616,9 +1691,24 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
 void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 {
     struct domain *d = v->domain;
+    void *map;
+    struct page_info *pg;
 
     if ( v != current )
         ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
+
+    domain_lock(d);
+    map = area->map;
+    area->map = NULL;
+    pg = area->pg;
+    area->pg = NULL;
+    domain_unlock(d);
+
+    if ( pg )
+    {
+        unmap_domain_page_global(map);
+        put_page_and_type(pg);
+    }
 }
 
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
-- 
2.42.0


