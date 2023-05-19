Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A626F70907C
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 09:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536728.835362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuhb-0006ey-Od; Fri, 19 May 2023 07:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536728.835362; Fri, 19 May 2023 07:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuhb-0006dD-LO; Fri, 19 May 2023 07:39:03 +0000
Received: by outflank-mailman (input) for mailman id 536728;
 Fri, 19 May 2023 07:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTyP=BI=citrix.com=prvs=49624ea57=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzuha-0006d7-7U
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 07:39:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367a423d-f618-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 09:38:59 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 03:38:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6427.namprd03.prod.outlook.com (2603:10b6:303:122::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 07:38:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 07:38:54 +0000
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
X-Inumbo-ID: 367a423d-f618-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684481938;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q1BAOgB3ZUzGU1gDfM5OLJopGjOjCz97ebthPmZ1aA8=;
  b=EEJwgt0dEw5LqRGD92ym6MIXyBt/9q9BaCa2HJImTxUKyKIJ7WddyEBH
   7KH9ZnHFJUv4YeF00uJxDTo+HOoz/xA41FTuVXHs8GCSkBO3Eyi2MkfVj
   ELxQREUtDgUopWIAMJFcHBMAHRDldIB3Pcka4NbkCmvyC8rruHwZrGNaQ
   Q=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 109509093
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ltpYx6A6GD/IihVW/8Xiw5YqxClBgxIJ4kV8jS/XYbTApDwj0GYHz
 jAYCj2HM6mJZGb9edglOtm1901VuMfUxtQ2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5B7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1dx6BDF16
 /AjJS0tQj+uiOvox6LkRbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrugA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPdoy/017eexksXXqpKT4ex+vl6uWfI4UczFloZaHSypaCm3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSoNVw4M+dTgiIA1kBPUT9xnHbK1j9v6AjX5y
 XaBqy1Wr6Uei88Ckb+y8lHOjzuvoYXhRws5oA7QWwqYAhhRYYekY8mt9gLd5PMZdoKBFAHd5
 T4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsIFcFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:kDEslat08UB+4PKztveVOY6e7skCEYAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjoqh+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWSg2OwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NrOTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJ0zxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wM93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYGjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7vCwleF/NHggF9/supaSQ4tbHNf/W2Gy4OR8TevKb0rUi6paxYY
 f2BHpUa8WTWFcGV7w5mDEWYKMiWUX2YPdlxOrTZGj+0/4jCreawdAzI8yjUobFIHIDZl7VJE
 clcXzaGPhgh3rbKEMQxiKhF0/QRg==
X-Talos-CUID: 9a23:OYeBlW5DqW5U5Cv099ss23QZH5AebHHmwWrwD2CVBm83T63KRgrF
X-Talos-MUID: 9a23:B+S3jQhbyMz9rRhRwss6WsMpbJxS6qipGHk3yrItm9fDOhFfMjPEk2Hi
X-IronPort-AV: E=Sophos;i="6.00,176,1681185600"; 
   d="scan'208";a="109509093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T60KxpkpLARhhvqzILge/0/DHCeeRE0usyW6nYjr4DeBCxBz3CUhOx/vnMKbEj5Xf2HlYfzQzO9oopbZzkdIE/Xir9oObFJ52itmYRVC+Qg88kg4OuWBFBp9yaocd1m5eNJCYxlPewZ5vDjmPM9Czb6iH607IvAV1ZOdwPEJnNt0UHHElvjoik2EWt63KoHGbeB10l4huhaKdsQrv0eqF0DPdcaeQobqJnlA2YvwOTnhKRiScxCHN/cAtnLBbQdg5Va9M104vVXl5x+fzOCd8uMRhvS5adGTJILLQl9TIyihTE6Tg6IsC1RPZNOvM40LunXAuCcxBmRaiKqZWnL1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hUDmsjUGTRRMByIBsebnZ+jzvOiPbptetj/uyiskZc=;
 b=BrVRRtg5ZaQzIMm5z7rWhv1Ykwd9O6fUlIEvCYvx4EQcihAYNLRU+ab0vRZSXoigBo573NxMzhSd6v5dl1stcOUMrYEr2CoJjRceDWoaeMpQ30c3Fkt5XAly9ZEL0pmk0jOH1Lj5MsjlKcLNYDGSLO5FSjHf9zCPTjJLA+QrAU05eTa6f7pwlS+fw7QBSvQuI3BC5trz5KSnTOrpG+ohwbHmswkGRWuM8mwqKSpg7HuPxSDDDul7Pup3c4udQO5Sk0MJWFFyEF2NXVe2jc71QBCaYHk42g2Fdscv8QQ0gqZKdWcWpBZiVjFVT4zyHQLiBfjIhS2a3JrX/+5a8dVAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hUDmsjUGTRRMByIBsebnZ+jzvOiPbptetj/uyiskZc=;
 b=tNeJpwosJ4NRh7Joe7qyugyNvfMKKoMsYgVeumuNQXt/TITnyqTFTNYuILcQLAvKji1Lk4/wAlkmdH9WDSgziJn0Yln4aYiNrkVz3A7vsLRFO6QABN/Y2NJbO3B19oEYV0gihtAI0VHkEfhvn+VguR6LbClGwDjnMhZ/6gY0Jr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 19 May 2023 09:38:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGcnh/DZvFAIBR/n@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 589d631a-ecf6-416e-f279-08db583c1872
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RFwkWcz+Euw2z8v79CK/LNk+PxjP2oMiIwMaXGdQtkzndD68HvMweAp5WUa6AwKbaxbxteCA8zDCAnRgCAQJVu9yZNY0oO7g24mPpxrhiJT0JHYV3Ehnk5q0m5Cu9M7mPVyLrVYT3KmEz/3R2bm5d2O1bZ4kC32UQshWV602QuDOk0+1UyiftujqE8O31AdWx0oLqQaaO4ruL8MxHmfpWWW192Pddl6fDjn55drBWwfSVLsObSxG46Yz+qsemeXN9tDMMu1F5aItZw8NnPscXYebo4iqk+BoetpU63M+rxEm0apyIYxsT/6COtVAL9bnNRJj3LdOgDiLtRKSQw8uQkeI1P5JBaOk2Arx8/708dDE5HBZAMb+EMhEjoGBSxzK0lINsznLgjlJsrBlGds86wNQuDMea/eNaFupzuz4mp/lpsAE7Vba7p7zzr2FSjyV/4M8SVh+5Alm/XI3CXEo8kKSW2qnBaQs+00Ji1b/K1c5L5e00J6FjEI+OX5T8T4isRwGV24zLdIuUqvpCypYNdjLfGgH4UnenIFxeeeTkuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(5660300002)(66899021)(41300700001)(2906002)(83380400001)(85182001)(86362001)(82960400001)(33716001)(38100700002)(26005)(186003)(6512007)(8936002)(8676002)(6506007)(53546011)(9686003)(66476007)(66556008)(66946007)(6666004)(6486002)(478600001)(966005)(6916009)(4326008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWk1QnE3S2tmUXZrRHpsZi93VlVxaE5pcGEvR3Q0ZWVCYTV4L0pYb2x3Ym5P?=
 =?utf-8?B?ZEhGay81ZjVwLzV0ZEN1YWZpT2NLQlh4VmRJTHFqdHZjTjlqVk94T3c1VjFH?=
 =?utf-8?B?U0xqTVdWR1pEYlN0a1JIV2lHWndGMWw2emdtU2lmV0ZZOUpIUFJOU1Y4WVh3?=
 =?utf-8?B?RjgrbjZhSTNQKzNVWG0wQ3FqRzdRcVBVd0tBNjFiL3R6MUpxMXNUVnNFR0pr?=
 =?utf-8?B?UXFHT1lGSktxVEd1SytCUHRjeGJnRnZCYURaTUVmSEFvV2lnZE1ub2YwdmdI?=
 =?utf-8?B?enExZUFBTitFclBIbmV1OVJPdkxMVkt3cHo1eHJhNyt6VUV0Z3NMYUFyQUFH?=
 =?utf-8?B?aG9jbHNqZmlLdkZWR0YrTHBIZHF2K0xNNnV3WEdkZ24rTFladk5VbktKN0FV?=
 =?utf-8?B?R3cvcHJVcVRNVWNZa3lZNlFvd2xTU2o0WWtxY3U2RGtvV2VSUkgyVldxK2tU?=
 =?utf-8?B?RWpzNG5seStzVll4d0VZRTk5dUFmOFJKVWhXVW5iSXRmUURZMWZTTEZ4R0ND?=
 =?utf-8?B?MzY0L2RaODBwZ3BReE5XWXlwc082Um1SMm1EVEVNaG1ZdWhRMjNGRHFJbFl3?=
 =?utf-8?B?YjRoWnVVQ2tUd3BGRzVLL0s1SmFuTEtVVVY5MVh5aExRc2NtU1kxaysrZnY5?=
 =?utf-8?B?eWJMaHNyV3BRZkZQZnJmbTd1QjJ6eE9TTG9Ub01Qa2s4ODhUVkNzcmFlQ2lY?=
 =?utf-8?B?dnYrRGgyaW9rYmJweDUxNjQ4dUpJdnljS3IxalZyTGs1cHJ5bUtOOXJFeXQ4?=
 =?utf-8?B?UHlDRFVuVHVPak1LZjRrT250LzU2alVmanNBRHRXUURSRU9SZUFqU0hIRlVM?=
 =?utf-8?B?dGJxYTlXVHRSc1ViekltSzYxOXdOUjJkSC9ZREl5Q0pPaVl6TTZuaDdoYkZk?=
 =?utf-8?B?R3FNekRYTzhtellyUi9naVdzb2lXUGJQcVlQN2RxcENzTXJvS0F1STVGbVdx?=
 =?utf-8?B?YW51cTBqVG91blEvVWs5OERuYW52UHZiSGJMMlRUMXFLSG9NNlZ3OEtCZGdL?=
 =?utf-8?B?WUduakNSRWVUamNFRzlNclY4aVptcnpaa0E4Q1hTN2pmODc5V1RwV2VaMCty?=
 =?utf-8?B?L0ZZcHorUzRYYW15TlUybkJMazl0WU5nMUpadG9DSWlZM2pVZnNxWWZRQXV1?=
 =?utf-8?B?SnlnaG5KcnJrMVNlWU4vOTk5WUJyZjJETDFpNXBmcUUzTFZEdzh4dTBCdmhP?=
 =?utf-8?B?ZndBUTJRdk04bHhzMFVYcXZmOEZJQXNUR1hkenRjcDVZb0ljclY4V0xXbTdF?=
 =?utf-8?B?bWdzODQ4QllZZTdSOHhkZE04b1hjUzRKdGk2dHE0WCszUzkrMVdJR2h2T0h3?=
 =?utf-8?B?NnQzNUx1VTJiRzFPVTZIVHp1U0RQQmVUNG8yQTdxazRpY3NjbHhKRGdrYXFW?=
 =?utf-8?B?ckhSY0hGQ2pGaWkwTmwySjhjUjNEcG95QllhUDg4ZVp5RkhleUkxV09QaC9P?=
 =?utf-8?B?RG5WenlTd2VOV2F5TTFjZ1hFbnZzUGVDSVJtSTIvajJub2Q5aUt5N3Q2MXEz?=
 =?utf-8?B?MjZEaG9WcGdZVGtWc1BpOFplaVExY09yWXBZVWZnRm05YnlDZldMYmlUM2pU?=
 =?utf-8?B?K2xpanRET205QWNrQzVkdzJTbG81L0xUUGs0cVBTMXBQd0xDYkpVeDVqdCs2?=
 =?utf-8?B?cHRNVmJneDFYdHprbnorUU5ob2lkWjNmRzFIbFJKeW9PMDdQV1A1MExMZ0Zt?=
 =?utf-8?B?UE9IZHd2dFdZL3JkM1VZbXRPVytrM1JJY2c5Tk10TGh0bXJXWFh4Z0hxb3FW?=
 =?utf-8?B?MHloZitZcFk4UjF2cnUxamF3YzJxZm84bDlMSUdZTTI5UjNBMStFbUtsSnlD?=
 =?utf-8?B?aGxJRmpBbUk2YmxOS1NxMUhhL1BwczlJUjRnQzAyZmx5ZWZqSmVCdURUTys0?=
 =?utf-8?B?S3I0cWpzRFpVd3NDSVlXK1F2RjdMOWxhZ3ViMWJPTzdZSHFhWU9uWUllcUQw?=
 =?utf-8?B?RS80VndmaXNlUWpEMlYxQm9FY0FxdEgwWGloNlJOYWhlZm0razJCU09BMkln?=
 =?utf-8?B?L2gvR2ZCdVcwWHNsR0NKT1k5T0d2Z2JnT21iVGR4NkM4V2I3ajUrT1pmZmdh?=
 =?utf-8?B?SkRHRnBzRS95bmFhZDJ2QW9DYjBHTksxRWMvcU8zV2kvTmpYSkhwVTBuVU94?=
 =?utf-8?Q?QCOaHH4geaL+/keimj5R+hjst?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yTur0IE/vmaXgHpiRbaSlJLsAW+IwNKbYKjxIZne9E0Nra9mMMU8Kzn6sSEH/tq1rPKTfryi2XcD5RWaUlFkXEPME5Ir36mhQzHhz8E4oo4DoHSBPv/EIrWOwFpwnaiWjup32ete3YN720Gd4/jWg5V1tb14MKfLc7/Y2b6fu4aQIvQnOIv1+WUe+iVUy7PEGrtlV3n6HFvWEkBUFRDS++HPTFFM9VFIkoOAvzZD4MQxWPkt/sL8LNFt7mIrXyTNO+NvvU47jmC1YaxFy2H7+VKyrhS8j/x5ykGKmcJSJojsU3MwxhJL3dIKHBI9Oxwf0sBX68O5cTErSJzHIEYwg63+uNosjLtsnJWaJELBmiR1kCSlCcKI/UBNLujQlGTBsjtQ/np+Wb1FH4kcgyo7H3HUxfBNydC65h+PnQpgoo/AN8cNg+DtK8iUe6CPFgACZMRAEc0zaARaeYq6DuTJjaJm2cFZwxSbTQlXp09cn86yh/wrUz0FDC/8Z4nwW28QQrilnsWW39OUhmExhivOL2vXYZCuTERotk9FgUms+/mmwBExO5toRe2AXJ7SPp9xz9N0p/fEGOd+6fI84toKpDRV/fdzLQJtcrkLMzARyfLJ+isNX6JYWnkInQwp4Y0F62WolwLdEfGq/5T8qFqUdtkpfJixfjA41LrU++wv4SnD41G1hDYW0/Jiq4MzG7UPco9kIAAYT4Os1nQFyM2hBbmQLupF/L87d4WQ4ND7/d3SwAoE55j+Smo8y/UhU8SFQB14IM0SAadi8eXLweNIp01eZRbelMD/bX29RhrkqC/Sa2Dez2azQbSuhDivibAwR5OE53JUVwtuMzT9MLgZFIvvnj+nnEEtnpjbuWVGgfpgh/D5OfjfkR1mcy09V3dQvGzLNFkhnFjfXfMqWkXRVG1jezzZeFmOMGM1zJSWmUI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589d631a-ecf6-416e-f279-08db583c1872
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 07:38:53.8560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GYNzt+GL8QO4EuGV7J9TnJjb73lUOfprvO4sk+saKVBcwOp0y5iyKSjzfne25pTndYpvyenxGxY4iG9MI+iqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6427

On Fri, May 19, 2023 at 09:22:58AM +0200, Jan Beulich wrote:
> On 18.05.2023 12:34, Roger Pau Monné wrote:
> > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> >> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> >> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> >> Zen3 system and we already have a few successful tests with it, see
> >> automation/gitlab-ci/test.yaml.
> >>
> >> We managed to narrow down the issue to a console problem. We are
> >> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> >> options, it works with PV Dom0 and it is using a PCI UART card.
> >>
> >> In the case of Dom0 PVH:
> >> - it works without console=com1
> >> - it works with console=com1 and with the patch appended below
> >> - it doesn't work otherwise and crashes with this error:
> >> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > 
> > Jan also noticed this, and we have a ticket for it in gitlab:
> > 
> > https://gitlab.com/xen-project/xen/-/issues/85
> > 
> >> What is the right way to fix it?
> > 
> > I think the right fix is to simply avoid hidden devices from being
> > handled by vPCI, in any case such devices won't work propewrly with
> > vPCI because they are in use by Xen, and so any cached information by
> > vPCI is likely to become stable as Xen can modify the device without
> > vPCI noticing.
> > 
> > I think the chunk below should help.  It's not clear to me however how
> > hidden devices should be handled, is the intention to completely hide
> > such devices from dom0?
> 
> No, Dom0 should still be able to see them in a (mostly) r/o fashion.
> Hence my earlier RFC patch making vPCI actually deal with them.

What's the difference between a hidden device and one that's marked RO
then?

Thanks, Roger.

