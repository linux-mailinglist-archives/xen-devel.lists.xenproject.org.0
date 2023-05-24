Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5570FA3E
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539150.839749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qVP-0000KZ-6Y; Wed, 24 May 2023 15:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539150.839749; Wed, 24 May 2023 15:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qVP-0000HE-3F; Wed, 24 May 2023 15:34:27 +0000
Received: by outflank-mailman (input) for mailman id 539150;
 Wed, 24 May 2023 15:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8ut=BN=citrix.com=prvs=5011a8a4f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1qVN-0000H8-R3
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:34:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73cac4b4-fa48-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:34:23 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 11:33:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6158.namprd03.prod.outlook.com (2603:10b6:5:399::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:33:42 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:33:42 +0000
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
X-Inumbo-ID: 73cac4b4-fa48-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684942463;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+Mzh/Qjr/yt7qldLKgdRLD+TEEQ2cI5k11kGRYowJoc=;
  b=M5w8ljyRr0CIoPMR+3IDoUgydFNQeDpmO/rGEPsagp/Y9rleiWC7hxLB
   +8LZzTqXP4Hd8UPlgYqsiaKwyupVcy85jyF4VJYNFh2etntLw+MQquUUp
   t/LPgyKf4gpFJtdQl2cfemsCCjujp3m8X/UoeS4ZjD73fPgmlwC3Mems6
   w=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 112715697
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zM7an6CMdvXvsBVW/xziw5YqxClBgxIJ4kV8jS/XYbTApDsihDMGy
 zcWUT3UbKqMZWD3ftwnYNuy9E8EvpOEndFjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9c9OLU9U/
 OwjBQsMaEGxiNqPz6K1c7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyjz37KRzHyTtIQ6D+2z6NRGvUGo2zIPCAw3VmCw+8i5sxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDRLoViMA6tjn5Ys13hTGS485FLbv14KoXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94Zdu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:3KZHc6rPHpmJwKHgngHfSOwaV5oReYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTn4AtjnfZq/z/5ICPgqXItKNTOO0AHEEGgI1/qA/9SPIVybysdtkY
 tmbqhiGJnRIDFB/KHHCdCDYrQdKQ+8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3A6NLLG2kj8ooc/94cmYHntCq9PPfXOXL09Vv+OUa?=
 =?us-ascii?q?oMktSSbvEe1Cowax0nfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATtz1vQ8L6rUoqMp8UbwDBSeQf9w46LqEJH0Rqoh?=
 =?us-ascii?q?Yp8mVFC9LMG2sjA3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="112715697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvq04jnntkFi+S/AHlOjQfHWqrU7Mm42HoztgFx9tfVco8v40m+W3QUEOkqKPzG1hgoaW7IO3Berb1LuRdNcR3hGMpO+JD98ShyK1SAfjIapTfICAYTS0gXK2WLeGgC/rYsCF6pWhbJXVG4HIAZKkuqd4XAj1q+uEVQ+CQ9vaXEKmVgdFt/YzkKKh75Y6iVnW4605c8sSjoYhGyPG7Gg1foThl2nYYLXhgR5P1UUv2mftih8hgGDfeIIn/LEi3gHHSiOJUq69fkjYGR5rsSB7RBGziyPCNfe1iHLDFuHentVPXWqiRNSXlRZMT+VMyXCa+707t/pd6Ke/V1TmVJRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3FBJFLRaaFplxSjxmtESrM0CxUPXgB4jYJz9Cxhqnk=;
 b=cGAKOSheen/JDw/xBIh4lLzrLi+VH70jSqG7iH+Mj737nCaA+iAQ2j44gF18T9QW073cr3lmX9qG4BiO8OEG4LdYZATo8ZL0pY1IkXLxlyMioCgSuvcSVm0kJ+nxtK+jdQNd3jKeR/jVwPGQEiyaJ4HKgfSRJwACZdZbl1fiXzzR634ej7AWWePpsuh51/2nr8EivnoLRXQw7+LSuGIYXCdJD+P7l2EIjQ45lVeJCCI8hk2aK8tW6+cFl4EXpxj3/+0/FR1SvqO/H4d5ok2vQMuJkMDugpvC1Cp5Se/Sm/c1Udf2ykAsY5L4gjRL4O/iHG2WysmnTL1pDFFye4YIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3FBJFLRaaFplxSjxmtESrM0CxUPXgB4jYJz9Cxhqnk=;
 b=o35ZPq9NiiDQ+1/p4+AvNyLB9RB65N47pewIWQrygzpXSSwR7FtSlNg0Nqrt0LMLB7hViVMDkX4fgKc5NBt/VzX5sUqr/I6623UcRHJtGIoA4MPwG0K/S5Pto8k1Ev+AgL3xEtdiRZue6Yxa8tn8K4L9FbopGWDIMspxvlj2PHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 24 May 2023 17:33:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZG4uUO93Iub36IFp@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 6267cd00-06b2-4054-5c0d-08db5c6c40f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lOkPZxvNHaIPQeEvt6zB7q64SiefNEgp4phJfsW3zPEaeStBh0Cfnaid0Xw0WmB3hwbIO6QbsUZCOM1iLdw+Er3o1AkS7cd3JvXi4/8xPAtuZsAoT2FiIVbcktkrRVasj45ISqQbR7Wzw1JDYiiKkkt7lK0jsxbTuFR4WcVbE+al9Qf0PREuYqQ3tZUvFRPYZoIbQThVeUSQ/jWVwtw27l9Xo1mpIs1531xSj42NidyMRim5CKqEsFn2yshn+8eJe2hF9Z4q5OcU6kiQq2qsAJa+ZPu785KqFL7gc2wTeJE8rGk595Up9fo9ibpDXvsfBURVRNd8Qs3m7cjSIRocEiWWMMmK0nDhE+bUoJpWXB9YBNp8wkHSppFjjegl10XywozcxaKMp7sPp7eLkQ6LgolznyNtqtssnmc4kwdHKOAjW4a6rL/eZdm30IxXBhNpQcNnWvSEpOHymo8AnqJLial5MOcNiakn7Lf4YtA54NgE21lsi129KEbqMW97gZuyGvpQhze0Zad5Z0pZ42CQ0Uo6Fs0+oPZBU+YG4ybhlGJdrHN6LxkHBp7b661YZaW0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(82960400001)(478600001)(86362001)(66946007)(33716001)(66556008)(66476007)(54906003)(38100700002)(83380400001)(85182001)(6486002)(2906002)(15650500001)(6666004)(316002)(4326008)(6916009)(8936002)(8676002)(53546011)(66899021)(26005)(186003)(5660300002)(6512007)(41300700001)(9686003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUMydjM2dTFqOUkwMVZBTlAzVVpEQjZNcXVEWmJQajd5aXdSKzYyb2M5QWpD?=
 =?utf-8?B?YmFhZ3RzakcvU09ucWVQV1VvbUMvL2xtU1psL3VXUll0blJzVWtPM1lJT240?=
 =?utf-8?B?ZjdLUGhjZ1V2UVkxS3I4UC9jVjMyMVlYMkdadlMvc1pZcEJwbWJ6UHMxWUsw?=
 =?utf-8?B?NThJbXJtSklYL2x6ZTdSWm8rZVBEQkRXZ0k2Y0owZUNhK1UxSHU2blI0U2FG?=
 =?utf-8?B?bVlzQnhXazdKTWpJR1VBM00yditFTS9wTzR1WmJlTTg2QUZwMXBrTzVjUTR0?=
 =?utf-8?B?UStpZ2dnRGpSYjlqSktTVFkzTTZhZ09ZdGxSaStyeWJVR2pkNmUzcGRQekhV?=
 =?utf-8?B?TkVKd2N3VGx5YzIrbDg1dkV4U243VXpreVNvRk9TdFVacHJ1VkVJTFR3dGRO?=
 =?utf-8?B?QlNveWNPT0JJSGV4Z0RrdEdWMjdWMVBEZWp2VTBIRkpuZC94dXZSMlF6OGdz?=
 =?utf-8?B?T0ZIejdNTkthY3plR1U3c3pvWVhZR3E5ZklrWmorZEo1elR5WVQyWElVMGEx?=
 =?utf-8?B?MHAyYnFqSHloOFpHSVg4THdkY1NTcGFzcWtwZENHRGc0WmpRMXZEOUt5V3hL?=
 =?utf-8?B?ZjE2T2tpbnZYdGN5SzNkQlR2R2RrNVRKaTJ6V0J6K0E1ODM5ZjZUSURYcElo?=
 =?utf-8?B?T0F2bVZnTnVhYllNUlhTRnBaWjlmT1hOMWNEZVJUaGVMaEVjSFlWVDRwTUV6?=
 =?utf-8?B?bUdidy94VXFxVlJwQlQwNTFuaXlRQWRNYm5UR2lKaUdMenZhYnlmZVRVcXEx?=
 =?utf-8?B?Z1RIaHhDTWdpR0NjRGx5dWxwK0ZoZjZpdFRYREpaWVU3cGIzaU1nQ2F4ZmJJ?=
 =?utf-8?B?ZkM1c3VZOFB4SndNb05QTWEwTndzRk5JeUxsaFZiekFyNEVWb1JPTlFtcGd4?=
 =?utf-8?B?UnhDeUtKY1ErYllQa0I3UE54Vll0bXp0aW13VEJteDF5RkVOQWx0Y0xoWGFE?=
 =?utf-8?B?RWJIUHBtWEVPRnZ4OW5pdFJjU0l3RDl1MGc5emhNQndCd2ZSNjloUXMyTW9K?=
 =?utf-8?B?VXJlTlA4eXdaMktuWUtGblZaUFFBWm03dVp5NWw3YjRlQW1WMlYzYm5jS0JG?=
 =?utf-8?B?cktZV2JJbVdNYm9HeE40K2VyVlVaeUxaUnhVSGc3RnUvTlZjWjErYnQzVTRt?=
 =?utf-8?B?WGd0S2RvemVROUEvdFlPbkpVRG9kbWdSMm1mdGxLL3J6WldRY2JTUVBKMnNG?=
 =?utf-8?B?Z0hDUWJBWmhmejBVWkdPdGR1aVF3aUtTbTdtS3VaeDlBMzJzbVNJbDR5MDBh?=
 =?utf-8?B?MHMwclRPVmZMMGhqZ0lCSkZUVjZNYkp3Rk1LVlNYRnlIMHhhbHdsRGU1UEFu?=
 =?utf-8?B?RE1PRG1IcXJXd1RwYWtLMFdFVjV4RkhrVWJTbUN2TU96R0JOS0RRZ1l4RVJ1?=
 =?utf-8?B?djFZeXhwK1NOTGlRZGJybjRNVjNpZFhRUUJGSThMaXliY0JJZjd2N2RNb2Va?=
 =?utf-8?B?SmdzNmM3MGsvTHc0cmRnWjM3Lzl5enEwM3V5Y0ZQdTRrL2g2NHpKYkFSZW5t?=
 =?utf-8?B?by80YjBQQkxRQ3dlQVpWVGJTSzl4Z1lyNndQU1Y2cTlDMVh1b1FGVDAyNkQ2?=
 =?utf-8?B?Rkx4d3hydXdHL3dXRGhoSmtsdGNVUUk4ZXlkQnNCWUN6Z0ZiRmxwSkhISkxR?=
 =?utf-8?B?OGUwS2VqYS83aDI4a1Z2Q2hiYWwzdnFEYzhPdklzY2loMEw2bTVkMTQ2clho?=
 =?utf-8?B?WFg0NncrUTVmeVRpMnpEM0lRbnFHZkwyL2piNWFXZmxKWXh4Q0ptS1JUQmdv?=
 =?utf-8?B?UTRCc01IWnU4MUp2c3FvN29EcE43SlF5alhMaURGQm9DOEFINHJsc2E5NTl1?=
 =?utf-8?B?V1ZpQXc5Nll6djRCQmJVRGl2YzNyRGdxWUJSMkFncWl1TjlLYjZMWlg2eFNL?=
 =?utf-8?B?VlBCb1VQTmNOY0c1elRnZ1lsVWpqWW1UTkgyTXJ2bmdQaW1NVUlyWVJjL3dE?=
 =?utf-8?B?U1hIK2hFc2NoL3dMRXNxVDR1TFZxbmpxUXFMa1FqZ0dBUzN1bkh4VkZPVHNQ?=
 =?utf-8?B?Tm1ueFd3RkNVZWZDMk00bHpnNDlHVXY2VWh0REpmSFExUFpQa05Bb0dWVWJ4?=
 =?utf-8?B?d3MwTE5paDhpMEFDV256enY4aktmRVB6YkRYaUl0b1ZlbnFkc2hhdCt2YnE1?=
 =?utf-8?B?SUwyVUxvUW1HNFliR0I0WTZXcEF3S2VCejB6Snl4ZCtpUTJOVjUwODgxb3h0?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NbAxgPnYytJz3YvZw7IKgLkAlFklrSmJ2THKjO+dE20mRi16ZNh2xkJtQ3RCO+s0D5jkC5ZlLZix9o2pWk4szQKh0nCu4vIy/lfJFmQwc0Amlk04h0LaBmbj9D07+BVlQNkaVkEkUQFHuqxagHle1Ic5HI8CwN9qwmRaPoJ8WL+sHEXIjWTVLMG7YRhlvC+ux9CbEZ8rkRJ58Ide6tOf7KnBGMrgqAHoXbSC/xRGU10Nx6EZGXaBRZBT8/ZF0I15m0z+wq5uQ6lT+aY48noB9/Y6h+0TgrMaOIlZw1YKeDgXfC/N7/o6t7BsKTe5FiL/qloBqgmB3+chlLeFwGfncuDvCHcV7w2fLlVR9BtwSIqLGn4YWUj1NW7261WGnG9MuqchRpHY1xaWWruTA1bbRBnbS7vT3lny3fPoqc6e2XcODio2S9lfi8itieUIJoNuQjv6YurAgbsjOF1+ZZLlFdon4Rdc9EyOTXTEOatSCeHLtDGPw9gUJ5+aHlzzogXva4YZeWvxJP12qKx9obJfe36cFBDT7qkLfUb1y9iYbco8ItMxlL2BmRUlFp00hE+h+S5gdu6tZjTs17WXu6EoikUt/GC8R87j2bIyf+aDIPa2n450ICn5rWpdcpfaRQCgR5CjaT02sVwyHwY4Xko9LbOrYy/t+w9lPQpVOohxv/YsjZWsNqMlJ4PplFlGOaHawKorSgOTZh43WhOMsZd49f/ERth4dzZHIyMzNh9MX6dYiLyZ0rDIqF80Wgy3GdyE+AeliYFiWVjzYeVUQlpFjPtuACRhZ9x5RS7kqOZCTxCff9wc4MosX/uhVWDL1V1v+F1bhoh2kOeFIJ8+O+hJ0Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6267cd00-06b2-4054-5c0d-08db5c6c40f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:33:42.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQfOiR+eL6ybvLqBGC0PB4EtzfDvB36mslxi+Y4492QeNPQQp03gIvw32NpXFDaWZ+Hixgep/TyZkaBWJMDH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6158

On Wed, May 24, 2023 at 04:44:49PM +0200, Jan Beulich wrote:
> On 24.05.2023 16:22, Roger Pau Monné wrote:
> > On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> >> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> >> console) are associated with DomXEN, not Dom0. This means that while
> >> looking for overlapping BARs such devices cannot be found on Dom0's list
> >> of devices; DomXEN's list also needs to be scanned.
> >>
> >> Suppress vPCI init altogether for r/o devices (which constitute a subset
> >> of hidden ones).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: The modify_bars() change is intentionally mis-formatted, as the
> >>      necessary re-indentation would make the diff difficult to read. At
> >>      this point I'd merely like to gather input towards possible better
> >>      approaches to solve the issue (not the least because quite possibly
> >>      there are further places needing changing).
> > 
> > I think we should also handle the case of !pdev->vpci for the hardware
> > doamin, as it's allowed for the vpci_add_handlers() call in
> > setup_one_hwdom_device() to fail and the device wold still be assigned
> > to the hardware domain.
> > 
> > I can submit that as a separate bugfix, as it's already an issue
> > without taking r/o or hidden devices into account.
> 
> Yeah, I think that wants dealing with separately. I'm not actually sure
> though that "is allowed to fail" is proper behavior ...

One better option would be to mark the device r/o if the
vpci_add_handlers() call fails in setup_one_hwdom_device(), as that
would prevent dom0 from accessing native MSI(-X) capabilities.

> But anyway - I take this as you agreeing to go that route, which is the
> prereq for me to actually make a well-formed patch. Please shout soon
> if that's a misunderstanding of mine.

Sure, will send the fix later today or tomorrow so that you can
rebase.

> >> RFC: Whether to actually suppress vPCI init is up for debate; adding the
> >>      extra logic is following Roger's suggestion (I'm not convinced it is
> >>      useful to have). If we want to keep that, a 2nd question would be
> >>      whether to keep it in vpci_add_handlers(): Both of its callers (can)
> >>      have a struct pci_seg readily available, so checking ->ro_map at the
> >>      call sites would be easier.
> > 
> > But that would duplicate the logic into the callers, which doesn't
> > seem very nice to me, and makes it easier to make mistakes if further
> > callers are added and r/o is not checked there.
> 
> Right, hence why I didn't do it the alternative way from the beginning.
> Both approaches have a pro and a con.
> 
> But prior to answering the 2nd question, what about the 1st one? Is it
> really worth to have the extra logic?

Why would we want to do all the vPCI initialization for r/o devices?
None of the handlers setup will get called, so I see it the other way
around: not short-circuiting vpci_add_handlers() for r/o devices is a
waste of time and resources because none of the setup state would be
used anyway.

> >  And
> > hence doing those before or after normal devices will lead to the same
> > result.  The loop in modify_bars() is there to avoid attempting to map
> > the same range twice, or to unmap a range while there are devices
> > still using it, but the unmap is never done during initial device
> > setup.
> 
> Okay, so maybe indeed there's no effect on the final result. Yet still
> the anomaly bothered me when seeing it in the logs (it actually mislead
> me initially in my conclusions as to what was actually going on), when
> I added a printk() to that new "continue" path. We would skip hidden
> devices up until them getting initialized themselves. There would be
> less skipping if all (there aren't going to be many) DomXEN devices
> were initialized first.

I think that just makes the logic more complicated for no reason, the
only reason you don't see this with devices assigned to dom0 is
because device addition is interleaved with calls to
vpci_add_handlers().  However it would also be valid to add all
devices to dom0 and then call vpci_add_handlers() for each one of them.

> > One further question is whether we want to map BARs of r/o devices
> > into the hardware domain physmap.  Not sure that's very helpful, as
> > dom0 won't be allowed to modify any of the config space bits of those
> > devices, so even attempts to size the BARs will fail.  I wonder what
> > kind of issues this can cause to dom0 OSes.
> 
> This is what Linux (6.3) says:
> 
> pci 0000:02:00.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
> pci 0000:02:00.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:02:00.1: [Firmware Bug]: reg 0x24: invalid BAR (can't size)

OK, seems fine then.  There's no point in mapping the BARs of r/o
devices to the dom0 physmap, as the domain is unable to size them in
the first place.

Thanks, Roger.

