Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64B5F630C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416741.661412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMYY-0003qj-TV; Thu, 06 Oct 2022 08:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416741.661412; Thu, 06 Oct 2022 08:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMYY-0003ow-PE; Thu, 06 Oct 2022 08:48:38 +0000
Received: by outflank-mailman (input) for mailman id 416741;
 Thu, 06 Oct 2022 08:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xibJ=2H=citrix.com=prvs=271cd1fce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ogMYW-0003oq-Ku
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:48:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a84d39f3-4553-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 10:48:34 +0200 (CEST)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 04:48:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM8PR03MB6214.namprd03.prod.outlook.com (2603:10b6:8:3d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Thu, 6 Oct 2022 08:48:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 08:48:30 +0000
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
X-Inumbo-ID: a84d39f3-4553-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665046113;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fC5ZqGHbRR1q5qVyWWPtF+yGmC6Ql0eTZ30T62oxsO0=;
  b=C2pYUXlu8hns+McaV1vw5avonu/AAs7Xr01aOFmf13TyVNSdxS8BMhIg
   89SR1LqWTnFnB7apuV6YGwbjYZT25PNuwv5ncwRQB/TWAeP/zFoodbPuj
   wSmfzd7XgXFfo+ppTAswf9GHOVFT9Kyw6lQrXlFWYhzw7IgVwjz7eV/B1
   4=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 82086937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:T0Nug6yMDu1Sd89rjJt6t+fJxyrEfRIJ4+MujC+fZmUNrF6WrkVRm
 2sWXGCFOvyNNDbyfI8lO96+pEsPsJTXydBhQVRorCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtA4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwoOUnWGJHz
 qEkJW4JZQKChNOWkK7nc7w57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxrsgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WrfqiLy17SQ9c/9cLpRG5aR1c5Ou1G4x0FUMUdVSQXiiNDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8FLD+Qw5QWJy6zVywWUHG4JSnhGctNOnM0rQT0n0
 HeZktWvAiZg2JWfRGiB7L6SoXW3MDIMMG4ZTSYeSE0O5NyLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYU042r8FaBhCijzrDZQwhw6gjJU2aN6gJieJXjd4Gu8ULc7/tLMMCeVFbpg
 ZQfs82X7eRLAZTTkiWIGLkJBOvxu6fDNyDAi1lyGZVn7y6q53OoYYFX5nd5OVttNcEHPzTuZ
 Sc/pD9s2XOaB1PyBYcfXm57I51CIXTIfTg9as3pUw==
IronPort-HdrOrdr: A9a23:0hAEMKNkjX3JkMBcT6H255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhNV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYfB9BajYxUXxPF4w541esMmJ
 5j7ia8jd56HBnAlCPy65zhUAxrrFO9pT4HnfQIh3JSfIMCYPt6rJAZ/mlSDJAcdRiKobwPIa
 1LNoXx9fxWeVSVYzTwuXRu+sWlWjAJEhKPUiE5y7mo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST+cNBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fEc+PyqQpoV15E/8a
 6xH2+wjVRCO34GNPf+n6Giqnv2MSeAtHXWu41jDqFCy/zBrOGBC1zHdLgs+/HQ0cn3TPerH8
 pbA6gmc8MLHVGeZ7qh4DeOKqW6CUNuJPH96exLLG6mk4bsFrDAkND9XbL6GIfNeAxUKV8XRE
 FzEQTOGA==
X-IronPort-AV: E=Sophos;i="5.95,163,1661832000"; 
   d="scan'208";a="82086937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXLvo8vrmNqCO724IVSj87yqE3Ekmo7h4TsR5FbiHg7PuCiBpeHfmj1Z66Reeb+ryvI5enrhxWwA0s+vpuOSHUi2EZx8c4bSjnkkWic3jLhCxP/GZBxbKWwp+btjcibidKZkqeK8Zg+YDyfv6XHOGggziTjY9RgG+QRnTigU/gg6Q6yfh+ydA8+ibqWEXrCqVx6TnCmTWEJHdXdKXXs2CSlJTmyUKPGFvlidGrO2TkCejhYpZ3xabGzYGpxjf+6VzvYPW8niVZDl1yMRcg6ApKipJ2OMB17CD1uZqgoU+FKCkqLBagPu+AX1UlJc3E+Dacq+APAqLULbL5ubWuLjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvLprH3LWQGLyashJB9j68WE8Krzi6YlHNZiN93Xi6k=;
 b=kBdr23ipLDWCcb7MIdS6nssC9RVoaQHKV6/pzPQ66SVM3dLwXXBung4v8g8r5qdCup395HLG7xxBr2QIhVFDie7pV4SoPp9jlvT0rp7bbbRRXg/VIhyLgaxXI0W3PimlBuX4bAwUNCToY2XAZLXEf3fLDSCZxmFpvRjDji315KaeN8V1kc/OZ90h3PmKQFWgjVCEMMTx1vSh7JMpF+0EjisUzLWXjUYaI5HkCUDgaklXLHD+fcTv0iIhisY7akOvbH5MrehdHAtMCEX0NA/SBLjfTlZsJIQsjbfQaaVUtqeaPInudxu6m/Dcg81Zt3pm7iNxOVd9g+Up1LwBDkimKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvLprH3LWQGLyashJB9j68WE8Krzi6YlHNZiN93Xi6k=;
 b=rpAGHZwkbCLN6Yo8xE7LFCVOYSuVjaesBUrYdP47BzkDy1MRjfOeB7CincjxBWvlBzy/eOILx9NTYQpczgciXwL3GxuBWVWV2USxQhXTj1aF7mJZMzMeDGngtdVv9l9RkxEkZgafdCQlNbKe/8+xLoKpWWozRqb3XKmrgm/z9fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 6 Oct 2022 10:48:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Message-ID: <Yz6WWYn5uO4R3zNg@Air-de-Roger>
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
 <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
 <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
 <544a7408-ea02-db17-39d7-82b7a1f56622@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <544a7408-ea02-db17-39d7-82b7a1f56622@suse.com>
X-ClientProxiedBy: LO6P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM8PR03MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f73ac15-29e8-4c39-c86e-08daa7778a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q+k7oYsYeyY3MkodPYwWXWOk4aAzcirQuJSyjMeReqTcp+3tPNrTCiMOP1RLDLjU+RZEnhlCkGS56YKpGJQCwyJcd6jbtQFeJM4GZrOx9j4tgNaP96zCtR6PTA9JEIZPA9P2xIrCeAap5QghUvyuUPh/s5Z54w7my/7p5eBxfCMuZeGVDOzcBCGEXp6BFZrWycJm9C0zJB+ARrl+cV1kilvQO/h0D3SD9S/iWGiR9HD8fJIt0D+70LJ6CfhI3c/86yVmVxfmBUn5BJY4kC3g2ZnNQqcc2F472clmkqYAepDT3CkStNADsaVKaDStxEd3ctKyHypE6IecPAjH61jE5wEL7YNiVRAZrUx169lAKABMXYJMiXUbn4sRhDJorW9KIzFNogC1UbKZxAGAFyrfdC45EFfIuag2N6I76WmAHIjCSwWQELXoobbwCgCtMayAT7mWii3nCOJM7XJQGBV37ck1uaQnljEvuKMgK4N+La37uTGQxtKOk/j/+A0pNgL5W8F0SSUVbQM6gLimHwJv3rlTfTxmtX5bBI3CKh7vPQJZ2wsarMvJgmGn8PRAnzrmX7Hx1g8MFWEPZjOlf4S7iKfuACAxahTLHyMAeL8hEFXlE/GLNHryrHI0Mh4iVWpRV33+GDYWbKWoLKnXGMIh7r3mSJGtKOm7dgZ7ny8Gx2/epn32NaeU3ewFcDeVErZgmnPgpp2AeWjauG9y3V8TvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(26005)(66899015)(85182001)(8676002)(4326008)(82960400001)(66556008)(38100700002)(66946007)(54906003)(6916009)(66476007)(316002)(86362001)(478600001)(6486002)(53546011)(6506007)(6512007)(6666004)(9686003)(41300700001)(8936002)(2906002)(83380400001)(33716001)(186003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdDN2FBU0NZZUNoaFU2Y1F0SWdKUnM1MnAxVjBBaFp4Vjg4VEMyeGdWRXM0?=
 =?utf-8?B?RnFGTElJMjgvWXNyTCthZ2lNelJrSXhwcWl4Mk14RlI3N01ub2NzOE8wck5N?=
 =?utf-8?B?TjIrZy9ObWlERFdmOTk4ZTgvaS91amxyVjYyZkhlbzZNTWFWN0NKZ2s1ZERO?=
 =?utf-8?B?aC9oQXpFVk1kZ2dIY09FOXVWSVU5R25OcXRZTUtqbnJ2QUJYOFQ5Q2crMXA2?=
 =?utf-8?B?VFBDaUdTUEVIdGdJMkpqYmFtOHJyaVFENXdWZVp1bTZ1dndoUE4vWExTaTVP?=
 =?utf-8?B?MWhacXNJc1JWRHVIQlVWRS9Eb2NWTVBFbUlIUW5LMk9VY0xIaFZULzNldm5L?=
 =?utf-8?B?SWdEalNaT1JuMXRDalhZMTVzVlZYWGo2YUl6VmxtOXpYUGdzOENZMEJqaktO?=
 =?utf-8?B?cGhrVW9jT3UzQkhTTkhvODhYeDdVTXBPR0h0Y1RBZTZDd3lPb3cvTkxtaVJt?=
 =?utf-8?B?MEpPcmxWSStvU0xRMmh6aWMyUldENlJwK2ZDNndSY2RjODVydndzeUVyd1o2?=
 =?utf-8?B?MVRSa2tUTnExbXZUUFYxdDRDSG9JWGlqL1NlWGFPRzRiZzZqTFlGVWxmUk1W?=
 =?utf-8?B?QVE2aDZHeDZ5ZHdRb3JpdTk0Mmg0bzJOcHNYNXJ6RnBjUTMyQzFUTmFucUty?=
 =?utf-8?B?TkJPVllLNE5nOGlnS0VMa25MRUlmMklqZWlmd1dBb005ZTFhTk5QOVUwcU50?=
 =?utf-8?B?SjY1RkIwQk4vSHJIVnNrK2MrN0ViNEdFSHI2eFpwUldWQnNTdnhuUnd0bkJ0?=
 =?utf-8?B?UVNCY2JUNkMyMk94aHA4Q2lMRWcrSnBDV2VDUkFJQnB0VnVQVFNpNDRtUG1p?=
 =?utf-8?B?WXk3ZHJ2Y0Joem81cDFvR0tUZzZ1MkFSNDhaUEtIRU1UdDJtVk9zRFJST2pa?=
 =?utf-8?B?VkZrRmtFRWhOY2UwUEh2V21CS1AzZDY3akFldGY3bEd3YUZOVXJBRE9VanJm?=
 =?utf-8?B?V2tMeDRzTHFZdWFzQTc4ckxwN3dqWnhmS1poQnEwNytrUU5yQjh6RlZpRVFF?=
 =?utf-8?B?ZGk5Nk9lVmhrQngwTXpDQVhKb3FNU3lLWDN1amJ1YWd2a1R1WWFkWkF4V2FF?=
 =?utf-8?B?Zm9nVWdZbkN3cGFMM0h6VHlhSnBjakhHS2QvYW1PTmFDUzd5Z2xIZTFWSmd2?=
 =?utf-8?B?cDBXMzVUS3YwY2hrbDIwdGpucU5NMTJoOHZKQ3NVUnlLZHhwR09DZzhCNG1V?=
 =?utf-8?B?WEtoR2xHRDltNjZwWUNvNmlHS3JCSmg1Yk0xSHBVMTFlcGw4L3ZNNitYMlNt?=
 =?utf-8?B?Ry9wMzhoS0VnZndmTndiMUJzM2VtRm40VVRwOWJWeTJIczR3TEpPLzI0dVVh?=
 =?utf-8?B?S1cwZFg1RDliKzFuMUFWTkFLRDJMSzlMRXlOYnV0MnpQZ0MvbWZsaFp6bEE5?=
 =?utf-8?B?dVFtRmUxR1BaeUJHZUVZKy8wR1NRWC95L0Z1RXBqTWNsM3YvSTUvSTVrNEdI?=
 =?utf-8?B?YXYrUHgveFppYmFuUzhGSlBjVDdBUXorRko0VkdLWnpMZjlXTGw2Z0pIc1h3?=
 =?utf-8?B?TDZVMnJyMTI0UnF2NlV1d2dRb3A2Q3JzZlVuU0JXd1BKYmdoRlRla1dZRU4w?=
 =?utf-8?B?b3B6YUNNV1RvcXUrK1VVaDdWQ0hQaFNOQnNFelRrQUxMSVJBaXcyZi83WHdl?=
 =?utf-8?B?U0hoUU94ZjVHbXRHUy8weDRrNFBjeHRoa2FxLzVkL1QrWVpnMmV4UStUQ0R0?=
 =?utf-8?B?RFFsZE9kSnhGK3l2bnBLdFg5MzhMZUE5bkdZcmlHbHBKckN6Uk1yZ0U4MEZ6?=
 =?utf-8?B?ZlFWZWNmSnlTeTh3dURUd0g0VUphb2cwZ1RnMFF1R0hRQ3VOSDcvYW15d3NE?=
 =?utf-8?B?QjFoT0l0TkxYMEI2UDJUTmdJSDhNRUZwcHh0Rk8yM2ZBdHR5c01uNm01NC9O?=
 =?utf-8?B?TXVMNHZDanBvdnA0UndFekM0Z0lTZjFMWWcyUndFa1RaclRYeFM2dDZYMzdo?=
 =?utf-8?B?QnlRdEhadUtnNGJYOUhVTDFvbm5lZ3BQUjRLNkw2TmNxaUJLZFcvdTlZM0Va?=
 =?utf-8?B?OHhLa3J3dFowWVAxZ0NMemZQc3NEMDk2UjdiVzA0UktyMXhDUWFxSXU5VDN0?=
 =?utf-8?B?eWtPWHhmcXVydi9hZ3ZEdlRoTmE3cUN3R1NnZWhlakdPdzN5a0svZG9FUHZX?=
 =?utf-8?B?VEVCRFZ5SzNWRC9iNEpxTFhIQ2dhMkFBdkdUaHMyRE9xZ2F1bDhQelpvVldj?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tACSf5xxOAqQ9rbaNWzdc/Qt/RNXlzbw/FlujLxJSaatZi0t/RV2zP7Qpti9tQyqKpk2iE6+1J0P8irPadv2BHEytKyFSrgoKQP79fiPu3fO7ylB0wKbcXFIlC8bC3e+/cGqXKm6szMm6HRnNaHvtvrmxSV0B3R2929kvrGdetyX3C0Wjfj3eV8t5VdeVop36jDs5XjiRm5W5OSuSzIxeHYXb4PlzfGm6UhL2Ou8xktLU9pzi8JdHWvBsPLT3uGAbcgRZPynr4Dkb52cixfwzA4o8TRbi7bhBW7FG9rghq0PrmX07jNkktaX6vog0f/U4wHHTV8Li4pxo9L9kArHdqI0cOS3tDSZITTVDp1L7GI7GR5ljWIWwvIMay4OPJszEUWBkT8kIvRUaax5Artkx8hGeydTWwmjygH6UBK2B+J24TWeNBSpi66fwhjFwFLfymcpYzf1haKGEW2tI7cysByyOYV0xBTA9l+kV1m/R7CdKCDIvHSNUjVZROxizHBOoSad1iquxyZnLVil9CvxIGJcNW8WfxSfwpR3cj9XtuzMhIbzhPVXzhn+Irgd2yfCRm5pLbSJPiT2hE3yJG4d9LFmr3e1CXVrA0wfWdA61cBwMXKHeVft2mZir6Yxc/FluaLCbL0XqkVH/hyR5sER05/HC1EcToV3jr9c1njQasZ1tA5H1Gyir9bxiCrCETsUmoiis0Z1B3xJxw6JEwnt4QpVAYRKHYpe0f+GklFSCFOOpUlywuMChGSBW6MoIyNMv9w+kv2wCNKPLRYiexPVbJdQrczRZDr3dxY5+f9JnVLwyoXWBp/zpWeYkvNWAMtfDuiRLZDjLi4sOsGHAp/oYUDyj+YsjWJiR1k/IpD3FQPU0bQdDJ00LxtHEe9TLebBbAeU7CdkDBq/7u7R+nKY4hpGJ9HLxw7vx2mSRGXfBxE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f73ac15-29e8-4c39-c86e-08daa7778a6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:48:30.0505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXZ5IwGetLbECp07syX9Yvze6ar2hbDK6XU1jJ1FEg2Q+kmttPA2aMsdtFVZIzpaK7inqFrf88KJw0KYRIP7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6214

On Wed, Oct 05, 2022 at 05:42:08PM +0200, Jan Beulich wrote:
> On 05.10.2022 16:12, Roger Pau Monné wrote:
> > Hm, I have the following diff attached below which is more limited,
> > and not so bad I think.  Initially I wanted to introduce an
> > efi_all_mapped() helper, but that would require exposing EFI_MEMORY_TYPE
> > which is quite intrusive.
> > 
> > Let me know if you think the proposal below is better and I will
> > formally send a patch with it.
> 
> Hmm, personally I like this slightly better for, as you say, its more
> limited effect. Objectively, however, I'm still unconvinced of making
> this an EFI special case. How would non-EFI firmware go about
> communicating that it is going to access a device at runtime (which,
> as said before, I consider a no-go in the first place)? Likely by
> putting its BAR range(s) in an E820_RESERVED region.

I've never encountered a non-EFI firmware that attempts to access the
BAR of a device so far (or at least none that caused problems with
Xen I should say), so I would worry about such use-case when we find
one.

> Plus the MMIO range covered on the system in question is pretty large.
> That way we're still allowing pretty wide an abuse by the firmware.
> Furthermore the MCFG range would also be covered by an
> EfiMemoryMappedIO descriptor (in fact that's the only use of the type
> I had been aware of so far). IOW the change specifically permits an
> overlap of a BAR with an MCFG range.

Additionally I could check if the device overlaps with any known MCFG
regions in pci_check_bar(), again not sure if that's more fine grained
than needed.

> 
> Who's the manufacturer of the system?

It's from Supermicro: "Supermicro X11DPU BIOS"

> Or put in different words - how
> likely is it that we could first gain understanding on their
> intentions with this region? You did say the system hangs hard without
> some kind of workaround, but that doesn't clarify to me in how far a
> use of the device by the firmware was actually involved there.

It's a black box to me, so I have no idea what the firmware attempts
to do.  It looks like that BAR is used to store some information
related to the boot sequence, the hang happened when trying to create
a new variable bootnum using efibootmgr (that's just a guess
really).

> Have you considered other routes towards dealing with the issue? One
> approach coming to mind would build on top of what you've been doing
> so far (either variant): Besides avoiding the turning off of memory
> decode, also invoke pci_ro_device(), thus protecting it from having
> its BARs relocated, and also preventing any driver in Dom0 to gain
> control of it, thus avoiding two parties competing for the device.

IMO using pci_ro_device() would be going too far here - it's not Xen
the entity using the device, so Xen doesn't really know whether
there's already some interface between the firmware and the OS driver
(or just OS) in order to signal that the device is being used by the
firmware.

> Relocating the BAR outside of the reserved region would be nice, but
> will likely not resolve the hang.

Not an option for Xen due to not having enough information about the
memory layout, and it's risky IMO anyway.

> In any event I'm still hoping to have a 3rd view on the situation as a
> whole, irrespective of specific ideas towards possible workarounds ...

Thanks for the detailed feedback.

Roger.

